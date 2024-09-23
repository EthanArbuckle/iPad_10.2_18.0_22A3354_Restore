@implementation TRIFactorLevel

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_83;
  if (!descriptor_descriptor_83)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRITrifactorRoot_FileDescriptor(), descriptor_fields_84, 2, 24, v8);
    if (descriptor_descriptor_83)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("Trifactor.pbobjc.m"), 468, CFSTR("Startup recursed!"));
    descriptor_descriptor_83 = (uint64_t)v2;
  }
  return v2;
}

+ (id)hashForFactorLevels:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  const void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "uniqueDataRepresentation", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v5, "appendData:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    if ((unint64_t)objc_msgSend(v5, "length") >> 32)
    {
      v12 = 0;
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
      v14 = objc_retainAutorelease(v5);
      v15 = (const void *)objc_msgSend(v14, "bytes");
      LODWORD(v14) = objc_msgSend(v14, "length");
      v12 = objc_retainAutorelease(v13);
      CC_SHA256(v15, (CC_LONG)v14, (unsigned __int8 *)objc_msgSend(v12, "mutableBytes"));
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __56__TRIFactorLevel_NamespaceHashing__hashForFactorLevels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "factor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)uniqueDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;

  -[TRIFactorLevel factor](self, "factor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 2483028224, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && objc_msgSend(v5, "length"))
  {
    -[TRIFactorLevel level](self, "level");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v12 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v9 = objc_msgSend(v7, "levelOneOfCase");
    v10 = 0;
    if (v9 <= 99)
    {
      switch(v9)
      {
        case 10:
          v11 = objc_msgSend(v8, "BOOLeanValue");
          goto LABEL_18;
        case 11:
          objc_msgSend(v8, "stringValue");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString dataUsingEncoding:allowLossyConversion:](v15, "dataUsingEncoding:allowLossyConversion:", 2483028224, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        case 12:
          v11 = objc_msgSend(v8, "intValue");
LABEL_18:
          LODWORD(v30) = v11;
          goto LABEL_19;
        case 13:
          v30 = objc_msgSend(v8, "longValue");
          goto LABEL_22;
        case 14:
          objc_msgSend(v8, "floatValue");
          LODWORD(v30) = v16;
LABEL_19:
          v18 = (void *)MEMORY[0x1E0C99D50];
          v19 = 4;
          goto LABEL_23;
        case 15:
          objc_msgSend(v8, "doubleValue");
          v30 = v20;
LABEL_22:
          v18 = (void *)MEMORY[0x1E0C99D50];
          v19 = 8;
LABEL_23:
          objc_msgSend(v18, "dataWithBytes:length:", &v30, v19);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        case 16:
          objc_msgSend(v8, "binaryValue");
          v21 = objc_claimAutoreleasedReturnValue();
LABEL_24:
          v10 = (void *)v21;
          break;
        default:
          goto LABEL_38;
      }
      goto LABEL_38;
    }
    switch(v9)
    {
      case 'd':
        objc_msgSend(v8, "fileValue");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 'e':
        objc_msgSend(v8, "directoryValue");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 'h':
        objc_msgSend(v8, "mobileAssetReferenceValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "hasAssetType"))
        {
          objc_msgSend(v8, "mobileAssetReferenceValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "assetType");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = CFSTR("null");
        }

        objc_msgSend(v8, "mobileAssetReferenceValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "hasAssetSpecifier"))
        {
          objc_msgSend(v8, "mobileAssetReferenceValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "assetSpecifier");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = CFSTR("null");
        }

        objc_msgSend(v8, "mobileAssetReferenceValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "hasAssetVersion"))
        {
          objc_msgSend(v8, "mobileAssetReferenceValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "assetVersion");
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = CFSTR("null");
        }

        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@-%@"), v15, v22, v23);
        objc_msgSend(v28, "dataUsingEncoding:allowLossyConversion:", 2483028224, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
LABEL_37:

        goto LABEL_38;
      default:
LABEL_38:
        if (objc_msgSend(v10, "length"))
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v12, "appendData:", v6);
          objc_msgSend(v12, "appendData:", v10);
        }
        else
        {
          v12 = 0;
        }

        goto LABEL_42;
    }
    v15 = v17;
    -[__CFString asset](v17, "asset");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString assetId](v22, "assetId");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString dataUsingEncoding:allowLossyConversion:](v23, "dataUsingEncoding:allowLossyConversion:", 2483028224, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v12 = 0;
LABEL_43:

  return v12;
}

@end
