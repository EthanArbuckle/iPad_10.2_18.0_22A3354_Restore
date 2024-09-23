@implementation PHUtilityCollection(PhotosUICore)

- (uint64_t)px_navigationWellKnownName
{
  return objc_msgSend(MEMORY[0x1E0CD1800], "px_builtInAlbumNameForUtilityCollectionType:", objc_msgSend(a1, "type"));
}

+ (__CFString)px_builtInAlbumNameForUtilityCollectionType:()PhotosUICore
{
  __CFString *v4;
  NSObject *v6;
  __CFString *result;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_12;
    case 1:
      v4 = CFSTR("utility-generic-documents");
      goto LABEL_11;
    case 2:
      v4 = CFSTR("utility-receipts");
      goto LABEL_11;
    case 3:
      v4 = CFSTR("utility-illustrations");
      goto LABEL_11;
    case 4:
      v4 = CFSTR("utility-handwriting");
      goto LABEL_11;
    case 5:
      v4 = CFSTR("utility-qr-codes");
      goto LABEL_11;
    case 6:
      v4 = CFSTR("utility-maps");
LABEL_11:
      v8 = v4;
LABEL_12:
      result = v4;
      break;
    default:
      PXAssertGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v9;
        v12 = 1024;
        v13 = a3;
        _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "Unexpected type in %@: %u", (uint8_t *)&v10, 0x12u);

      }
      result = (__CFString *)0;
      break;
  }
  return result;
}

+ (uint64_t)px_utilityCollectionTypeforBuiltInAlbumName:()PhotosUICore
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int16 v6;

  v3 = a3;
  if (px_utilityCollectionTypeforBuiltInAlbumName__onceToken != -1)
    dispatch_once(&px_utilityCollectionTypeforBuiltInAlbumName__onceToken, &__block_literal_global_606);
  objc_msgSend((id)px_utilityCollectionTypeforBuiltInAlbumName__utilityCollectionTypes, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = 0;

  return v6;
}

@end
