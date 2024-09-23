@implementation CKRecord

void __63__CKRecord_SafariSharedExtras__safari_folderTypeForRecordName___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D89DA0];
  v3[0] = *MEMORY[0x1E0D89DA8];
  v3[1] = v0;
  v4[0] = &unk_1E4B878B0;
  v4[1] = &unk_1E4B878C8;
  v3[2] = *MEMORY[0x1E0D89DB0];
  v4[2] = &unk_1E4B878E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_folderTypeForRecordName__builtInRecordNamesToRecordTypes;
  safari_folderTypeForRecordName__builtInRecordNamesToRecordTypes = v1;

}

@end
