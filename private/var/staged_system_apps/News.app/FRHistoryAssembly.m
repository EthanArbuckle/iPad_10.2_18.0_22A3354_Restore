@implementation FRHistoryAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "publicContainer"));
  v3 = objc_msgSend(v4, "registerProtocol:factory:", &OBJC_PROTOCOL___TSClearDataManager, &stru_1000DA158);

}

- (FRHistoryAssembly)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRHistoryAssembly;
  return -[FRHistoryAssembly init](&v3, "init");
}

@end
