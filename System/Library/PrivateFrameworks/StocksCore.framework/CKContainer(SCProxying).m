@implementation CKContainer(SCProxying)

- (void)addDatabaseOperation:()SCProxying
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "privateCloudDatabase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

@end
