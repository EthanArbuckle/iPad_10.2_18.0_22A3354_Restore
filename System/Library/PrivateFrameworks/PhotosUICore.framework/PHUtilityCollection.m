@implementation PHUtilityCollection

void __81__PHUtilityCollection_PhotosUICore__px_utilityCollectionTypeforBuiltInAlbumName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("utility-generic-documents");
  v2[1] = CFSTR("utility-receipts");
  v3[0] = &unk_1E53EF078;
  v3[1] = &unk_1E53EF090;
  v2[2] = CFSTR("utility-illustrations");
  v2[3] = CFSTR("utility-handwriting");
  v3[2] = &unk_1E53EF0A8;
  v3[3] = &unk_1E53EF0C0;
  v2[4] = CFSTR("utility-maps");
  v2[5] = CFSTR("utility-qr-codes");
  v3[4] = &unk_1E53EF0D8;
  v3[5] = &unk_1E53EF0F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_utilityCollectionTypeforBuiltInAlbumName__utilityCollectionTypes;
  px_utilityCollectionTypeforBuiltInAlbumName__utilityCollectionTypes = v0;

}

@end
