@implementation UISSecureControlServiceSharedRemoteInterface

void __UISSecureControlServiceSharedRemoteInterface_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v4 = (id)objc_msgSend(v0, "initWithServiceName:", UISSecureControlServiceName);
  UISSecureControlServiceInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v1);

  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_58);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECDA5858;
  qword_1ECDA5858 = v2;

}

@end
