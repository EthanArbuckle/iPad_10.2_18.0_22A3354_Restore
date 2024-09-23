@implementation ICFairPlayGetContextIdentifierForFolderPath

void __ICFairPlayGetContextIdentifierForFolderPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Media"), CFSTR("iTunes_Control"), CFSTR("iTunes"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPath;
  ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPath = v0;

}

@end
