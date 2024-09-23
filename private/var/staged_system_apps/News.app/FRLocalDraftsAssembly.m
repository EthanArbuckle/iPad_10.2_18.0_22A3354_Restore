@implementation FRLocalDraftsAssembly

- (void)loadInRegistry:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "publicContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "registerProtocol:factory:", &OBJC_PROTOCOL___TSLocalDraftsDeviceManagerType, &stru_1000DE370));
  v4 = objc_msgSend(v3, "inScope:", 2);

}

@end
