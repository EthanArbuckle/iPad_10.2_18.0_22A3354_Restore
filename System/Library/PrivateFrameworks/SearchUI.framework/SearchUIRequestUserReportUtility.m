@implementation SearchUIRequestUserReportUtility

+ (id)createUserReportViewControllerWith:(id)a3 rowModel:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)sub_1DADF5058(v7, v8, v9);

  return v10;
}

- (SearchUIRequestUserReportUtility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RequestUserReportUtility();
  return -[SearchUIRequestUserReportUtility init](&v3, sel_init);
}

@end
