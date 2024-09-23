@implementation PKCloudStoreServiceInterface

void __PKCloudStoreServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE296B08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22A50;
  qword_1ECF22A50 = v0;

}

@end
