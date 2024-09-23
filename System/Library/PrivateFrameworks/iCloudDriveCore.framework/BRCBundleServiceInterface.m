@implementation BRCBundleServiceInterface

void __BRCBundleServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255ED6CF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRCBundleServiceInterface_interface;
  BRCBundleServiceInterface_interface = v0;

  v2 = (void *)BRCBundleServiceInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_extractMetadataForContainerID_bundleID_minimumBundleVersion_reply_, 0, 1);

  v9 = (void *)BRCBundleServiceInterface_interface;
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_extractMetadataForContainerID_bundleID_minimumBundleVersion_reply_, 1, 1);

}

@end
