@implementation CKRecord(SafariSharedExtras)

+ (uint64_t)safari_folderTypeForRecordName:()SafariSharedExtras
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = safari_folderTypeForRecordName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&safari_folderTypeForRecordName__onceToken, &__block_literal_global_13);
  objc_msgSend((id)safari_folderTypeForRecordName__builtInRecordNamesToRecordTypes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

@end
