@implementation OABTable

+ (id)readTable:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  OADTable *v7;
  OABRTable *v8;
  OABRTable *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(OADTable);
  v8 = [OABRTable alloc];
  v9 = -[OABRTable initWithSourceTable:targetTable:state:](v8, "initWithSourceTable:targetTable:state:", v5, v7, v6);

  -[OABRTable map](v9, "map");
  return v7;
}

@end
