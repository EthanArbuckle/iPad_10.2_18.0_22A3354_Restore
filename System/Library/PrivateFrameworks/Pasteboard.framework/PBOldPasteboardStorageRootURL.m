@implementation PBOldPasteboardStorageRootURL

void __PBOldPasteboardStorageRootURL_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend((id)CPSharedResourcesDirectory(), "pathComponents");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "addObjectsFromArray:", &unk_1E2437E10);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECED8C30;
  qword_1ECED8C30 = v1;

}

@end
