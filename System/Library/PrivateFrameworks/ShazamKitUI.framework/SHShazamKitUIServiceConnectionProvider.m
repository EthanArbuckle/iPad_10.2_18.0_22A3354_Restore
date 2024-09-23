@implementation SHShazamKitUIServiceConnectionProvider

- (id)shazamKitUIServiceConnection
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD1988]);
  v3 = (void *)objc_msgSend(v2, "initWithMachServiceName:options:", *MEMORY[0x24BDE9878], 4096);
  SHShazamKitUIServiceInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

@end
