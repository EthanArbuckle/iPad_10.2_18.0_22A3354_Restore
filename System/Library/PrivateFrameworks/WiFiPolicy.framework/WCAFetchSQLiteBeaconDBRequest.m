@implementation WCAFetchSQLiteBeaconDBRequest

- (WCAFetchSQLiteBeaconDBRequest)init
{
  WCAFetchSQLiteBeaconDBRequest *v2;
  WCAFetchSQLiteBeaconDBRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCAFetchSQLiteBeaconDBRequest;
  v2 = -[WCAFetchSQLiteBeaconDBRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WCAFetchSQLiteRequest setTableName:](v2, "setTableName:", CFSTR("prof_clean"));
    -[WCAFetchSQLiteRequest setColumnNames:](v3, "setColumnNames:", &unk_1E88641A8);
    -[WCAFetchSQLiteRequest setLimit:](v3, "setLimit:", 1);
  }
  return v3;
}

@end
