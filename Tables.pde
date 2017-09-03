Table Products;
Table Compatible;
Table Patterns;
Table Lights;
Table PatternProfiles;
Table ColourProfiles;
                              
String[] Lights_ColumnNames = {"LightID","ProductID","ProductName"}; // Table of connected lights with relevant details for dropboxes
int[] Lights_ColumnFormat = {Table.INT,Table.INT,Table.STRING};
IntList Lights_Product_IDs;
StringList Lights_Names;
String[] Lights_NamesArray;

IntList PatternProfileIDs;
StringList PatternProfileNames;
String[] PatternProfileNamesArray;

IntList SelectedCompatiblePatternIDs;
StringList SelectedCompatiblePatternNames;
String[] SelectedCompatiblePatternNamesArray;

String[] SPPD; // SelectedPatternProfileDetails


/*public void AddBoolsRowData()
{
  for(int i=0;i<Bools_RowData_Name.length;i++)
  {
    String[] ConstructData = {Bools_RowData_Name[i],Bools_RowData_Values[i]};
    AddTableRow(Bools,Bools_ColumnFormat,Bools_ColumnNames,ConstructData);
    
  }
  
  
  
}
*/
public void PullCompatiblePatterns(int SelectedProduct)
{
  println("Pulling compatible patterns for product: "+SelectedProduct);
  SelectedCompatiblePatternIDs = new IntList();
  SelectedCompatiblePatternNames = new StringList();
  PatternProfileIDs = new IntList();
  PatternProfileNames = new StringList();
  db.query("SELECT * FROM PatternType JOIN PatternCompatible on PatternCompatible.Pattern_ID = PatternType.ID WHERE PatternCompatible.Product_ID ="+SelectedProduct);
  while(db.next())
  {
    SelectedCompatiblePatternIDs.append(db.getInt("Pattern_ID"));
    SelectedCompatiblePatternNames.append(db.getString("Name"));
    
    
  }
  for(int i=0;i<SelectedCompatiblePatternIDs.size();i++)
  {
    db.query("SELECT * FROM PatternProfiles WHERE Pattern_ID = "+SelectedCompatiblePatternIDs.get(i));
    while(db.next())
    {
      PatternProfileIDs.append(db.getInt("ID"));
      PatternProfileNames.append(db.getString("Name"));
      print("Found PatProfile: "+db.getString("Name"));
    }
    
  }
  SelectedCompatiblePatternNamesArray = CreateStringArrayFromList(SelectedCompatiblePatternNames);
  PatternProfileNamesArray = CreateStringArrayFromList(PatternProfileNames);
  
  
  
  
}

public String[] CreateStringArrayFromList(StringList list)
{
  int size = list.size();
  String[] rtn = new String[size];
  
  for(int i=0;i<size;i++)
  {
    rtn[i] = list.get(i);
  }
  
  
  
  return rtn;
  
}


public void CopyLightDataFromSQL()
{
  Lights_Product_IDs = new IntList();
  Lights_Names = new StringList();
  int cnt = 0;
  db.query("SELECT * FROM Product JOIN Lights on Lights.Product_ID = Product.ID");
  while(db.next())
  {
    Lights_Product_IDs.append(db.getInt("Product_ID"));
    Lights_Names.append(db.getString("Name"));
    cnt++;
  }
  Lights_NamesArray = CreateStringArrayFromList(Lights_Names);
  if(Lights_Names.size()>0)
  {
    
    lstSelectLight_MainWindow.setItems(Lights_NamesArray, 0);
  }
  if(Lights_Names.size()<=0)
  {
    Lights_NamesArray[0] = "Ready";
    lstSelectLight_MainWindow.setItems(Lights_NamesArray, 0);
  }
  
  
}

public void CreateTable(Table table, String[] ColumnNames, int[] ColumnFormat)
{
  // Table must be initialized BEFORE running this setup.
  for(int i=0;i<ColumnNames.length;i++)
  {
    table.addColumn(ColumnNames[i],ColumnFormat[i]);
    println("Adding column "+ColumnNames[i]+".");
  }
  
  
}

public void AddTableRow(Table table, int[] format, String[] ColumnNames, String[] data)
{
  TableRow row = table.addRow();
  for(int i=0;i<data.length;i++)
  {
    if(format[i] == Table.INT)
    {
      row.setInt(ColumnNames[i],int(data[i]));
    }
    if(format[i] == Table.FLOAT)
    {
      row.setFloat(ColumnNames[i],float(data[i]));
    }
    if(format[i] == Table.STRING)
    {
      row.setString(ColumnNames[i],data[i]);
    }
    print(ColumnNames[i]+" : "+data[i]+" : ");
  }
  println("Finished adding row");
  
}

  
synchronized public int GetTableInt(Table table,int tableRow, String[] data)
{
  TableRow row;
  int result = -1;
  // data example: GetTableInt(Bools,-1,{"winPatternConfig_Loaded","Name","bool"});
  // data example: GetTableInt(LightData,0,{"Product_ID"});
  // data example: GetTableInt(LightData,0,{"LedsAmount"});
  
  if(tableRow == -1)
  {
    
    row = table.findRow(data[0],data[1]);
    result = row.getInt(data[2]);
  }
  else
  {
    row = table.getRow(tableRow); 
      result = row.getInt(data[0]); 
  }
  
  return result;
}
// above looks to be a very good way of not needing repeated code!!!
synchronized public String GetTableStr(Table table, int tableRow, String[] data)
{
  // data example: GetTableStr({"LightData","0","LightName"});
  TableRow row;
  String result = "";
  if(tableRow == -1)
  {
    
    row = table.findRow(data[0],data[1]);
    result = row.getString(data[2]);
  }
  else
  {
    row = table.getRow(tableRow); 
    result = row.getString(data[0]); 
  }
    
  return result;
}

synchronized public float GetTableFloat(Table table, int tableRow, String[] data)
{
  TableRow row;
  float result = -1;
  if(tableRow == -1)
  {
    
    row = table.findRow(data[0],data[1]);
    result = row.getFloat(data[2]);
  }
  else
  {
    row = table.getRow(tableRow); 
      result = row.getFloat(data[0]); 
  }
  return result;
}

synchronized public void SetTableVal(Table table, int tableRow, int format, String[] data)
{
  // data example: SetTableVal(Bools,-1,Table.INT,{"winPatternConfig","Name","bool","0"});
  // data example: SetTableVal(LightData,0,Table.INT,{"LedsAmount","176"});
  TableRow row;
  String columnName;
  String exData;
  if(tableRow == -1)
  {
    row = table.findRow(data[0],data[1]);
    columnName = data[2];
    exData = data[3];
  }
  else
  {
    row = table.getRow(tableRow);
    columnName = data[0];
    exData = data[1];
  }
  if(format == Table.INT)
  {
    row.setInt(columnName,int(exData));
  }
  if(format == Table.STRING)
  {
    row.setString(columnName,exData);
  }
  if(format == Table.FLOAT)
  {
    row.setFloat(columnName,float(exData));
  }
  
}

// Currently not being used as SQLite is being used to push and pull kept data.
// Table functions will be used for active light profiles, as memory location lookups will be faster.