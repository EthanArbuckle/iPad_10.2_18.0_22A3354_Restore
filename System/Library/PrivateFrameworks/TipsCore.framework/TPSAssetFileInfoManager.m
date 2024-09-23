@implementation TPSAssetFileInfoManager

- (id)filesFromDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TPSAssetFileInfo *v12;
  TPSAssetFileInfo *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "TPSSafeArrayForKey:", CFSTR("files"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v12 = [TPSAssetFileInfo alloc];
          v13 = -[TPSAssetFileInfo initWithDictionary:](v12, "initWithDictionary:", v11, (_QWORD)v16);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  if (objc_msgSend(v5, "count", (_QWORD)v16))
    v14 = (void *)objc_msgSend(v5, "copy");
  else
    v14 = 0;

  return v14;
}

- (TPSAssetFileInfoManager)initWithDictionary:(id)a3 clientConditions:(id)a4
{
  id v6;
  id v7;
  TPSAssetFileInfoManager *v8;
  void *v9;
  TPSAssetFileInfoManager *v10;
  id v11;
  uint64_t v12;
  NSDictionary *fileMap;
  TPSAssetFileInfoManager *v14;
  _QWORD v16[4];
  id v17;
  TPSAssetFileInfoManager *v18;
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TPSAssetFileInfoManager;
  v8 = -[TPSSerializableObject initWithDictionary:](&v20, sel_initWithDictionary_, v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke;
    v16[3] = &unk_1E395D3F8;
    v17 = v7;
    v10 = v8;
    v18 = v10;
    v11 = v9;
    v19 = v11;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
    if (!objc_msgSend(v11, "count"))
    {

      v14 = 0;
      goto LABEL_6;
    }
    v12 = objc_msgSend(v11, "copy");
    fileMap = v10->_fileMap;
    v10->_fileMap = (NSDictionary *)v12;

  }
  v14 = v8;
LABEL_6:

  return v14;
}

void __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;

  v10 = a3;
  v5 = a1[4];
  v6 = a2;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_3;
  objc_msgSend(v10, "TPSSafeArrayForKey:", CFSTR("conditions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke_2;
  v15 = &unk_1E395C190;
  v16 = a1[4];
  objc_msgSend(v7, "na_firstObjectPassingTest:", &v12);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
LABEL_3:
    v8 = v10;
  objc_msgSend(a1[5], "filesFromDictionary:", v8, v10, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v9, v6);

}

uint64_t __38__TPSAssetFileInfoManager_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fileMap");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileMap, 0);
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

id __38__TPSAssetFileInfoManager_na_identity__block_invoke()
{
  if (TPSAssetFileInfoManagerKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSAssetFileInfoManagerKey_block_invoke_na_once_token_0, &__block_literal_global_30_0);
  return (id)TPSAssetFileInfoManagerKey_block_invoke_na_once_object_0;
}

- (TPSAssetFileInfoManager)initWithCoder:(id)a3
{
  id v4;
  TPSAssetFileInfoManager *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *fileMap;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSAssetFileInfoManager;
  v5 = -[TPSSerializableObject initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("fileMap"));
    v11 = objc_claimAutoreleasedReturnValue();
    fileMap = v5->_fileMap;
    v5->_fileMap = (NSDictionary *)v11;

  }
  return v5;
}

- (id)fileInfoIdentifierWithMainIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  void *v4;
  void *v5;

  -[TPSAssetFileInfoManager fileInfoWithMainIdentifier:userInterfaceStyle:scale:](self, "fileInfoWithMainIdentifier:userInterfaceStyle:scale:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fileInfoWithMainIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4 scale:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  -[TPSAssetFileInfoManager fileMap](self, "fileMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__TPSAssetFileInfoManager_fileInfoWithMainIdentifier_userInterfaceStyle_scale___block_invoke;
  v15[3] = &unk_1E395D420;
  v15[4] = &v22;
  v15[5] = &v16;
  v15[6] = a4;
  v15[7] = a5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  if (!v23[5])
  {
    objc_storeStrong(v23 + 5, (id)v17[5]);
    if (!v23[5])
    {
      if (-[TPSAssetFileInfoManager allowsFallBack](self, "allowsFallBack"))
      {
        objc_msgSend(v10, "firstObject");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v23[5];
        v23[5] = (id)v11;

      }
    }
  }
  v13 = v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSAssetFileInfoManager;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSAssetFileInfoManager fileMap](self, "fileMap", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileMap"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSAssetFileInfoManager;
  v4 = -[TPSSerializableObject copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSAssetFileInfoManager fileMap](self, "fileMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileMap:", v5);

  return v4;
}

- (NSDictionary)fileMap
{
  return self->_fileMap;
}

- (void)setFileMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __79__TPSAssetFileInfoManager_fileInfoWithMainIdentifier_userInterfaceStyle_scale___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "userInterface") == a1[6])
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    v7 = a1[7];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 != objc_msgSend(v10, "scale"))
    {
      v8 = *(_QWORD *)(a1[4] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    *a4 = 1;

}

void __38__TPSAssetFileInfoManager_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __38__TPSAssetFileInfoManager_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSAssetFileInfoManagerKey_block_invoke_na_once_object_0;
  TPSAssetFileInfoManagerKey_block_invoke_na_once_object_0 = v0;

}

id __38__TPSAssetFileInfoManager_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_35);
  objc_msgSend(v0, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "TPSSafeStringForKey:", CFSTR("ruleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

- (void)addNewAssetInfoFromFileMap:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v11 = a3;
  if (objc_msgSend(v11, "count"))
  {
    -[TPSAssetFileInfoManager fileMap](self, "fileMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__TPSAssetFileInfoManager_addNewAssetInfoFromFileMap___block_invoke;
    v12[3] = &unk_1E395D448;
    v12[4] = self;
    v6 = v5;
    v13 = v6;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
    -[TPSAssetFileInfoManager fileMap](self, "fileMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = objc_msgSend(v6, "count");

    if (v8 != v9)
    {
      v10 = (void *)objc_msgSend(v6, "copy");
      -[TPSAssetFileInfoManager setFileMap:](self, "setFileMap:", v10);

    }
  }

}

void __54__TPSAssetFileInfoManager_addNewAssetInfoFromFileMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "fileMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v8);

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)TPSAssetFileInfoManager;
  -[TPSSerializableObject debugDescription](&v12, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSAssetFileInfoManager fileMap](self, "fileMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("fileMap"), v7);

  -[TPSAssetFileInfoManager fileMap](self, "fileMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("files"), v10);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %d"), CFSTR("allowsFallBack"), -[TPSAssetFileInfoManager allowsFallBack](self, "allowsFallBack"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (BOOL)allowsFallBack
{
  return self->_allowsFallBack;
}

- (void)setAllowsFallBack:(BOOL)a3
{
  self->_allowsFallBack = a3;
}

@end
