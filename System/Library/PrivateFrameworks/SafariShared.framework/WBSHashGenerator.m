@implementation WBSHashGenerator

- (WBSHashGenerator)init
{
  void *v3;
  void *v4;
  WBSHashGenerator *v5;

  -[WBSHashGenerator _createEncryptionKeyData](self, "_createEncryptionKeyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHashGenerator _createEncryptionKeyIDDataUsingKey:](self, "_createEncryptionKeyIDDataUsingKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBSHashGenerator initWithKey:keyID:](self, "initWithKey:keyID:", v3, v4);

  return v5;
}

- (WBSHashGenerator)initWithKey:(id)a3 keyID:(id)a4
{
  id v6;
  id v7;
  WBSHashGenerator *v8;
  WBSHashGenerator *v9;
  uint64_t v11;
  NSData *key;
  uint64_t v13;
  NSData *keyID;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHashGenerator;
  v8 = -[WBSHashGenerator init](&v15, sel_init);
  if (v8
    && objc_msgSend(v6, "length")
    && objc_msgSend(v7, "length")
    && (unint64_t)objc_msgSend(v7, "length") >= 4)
  {
    v11 = objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = (NSData *)v11;

    v13 = objc_msgSend(v7, "copy");
    keyID = v8->_keyID;
    v8->_keyID = (NSData *)v13;

    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)generateHashStringWithComponents:(id)a3
{
  void *v3;
  void *v4;

  -[WBSHashGenerator generateHashWithComponents:](self, "generateHashWithComponents:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "safari_stringAsHexWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)generateHashWithComponents:(id)a3
{
  id v4;
  void **p_key;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  size_t v16;
  void *v17;
  NSData **p_keyID;
  NSData *keyID;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CCHmacContext ctx;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE macOut[32];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_55) & 1) != 0)
  {
    memset(&ctx, 0, sizeof(ctx));
    p_key = (void **)&self->_key;
    CCHmacInit(&ctx, 2u, -[NSData bytes](self->_key, "bytes"), -[NSData length](self->_key, "length"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "length", (_QWORD)v28))
          {
            if ((v10 & 1) != 0)
            {
              v13 = v12;
            }
            else
            {
              objc_msgSend(CFSTR("/"), "stringByAppendingString:", v12);
              v13 = (id)objc_claimAutoreleasedReturnValue();
            }
            v14 = objc_retainAutorelease(v13);
            v15 = (const char *)objc_msgSend(v14, "UTF8String");
            v16 = strlen(v15);
            CCHmacUpdate(&ctx, v15, v16);

          }
          v10 = 0;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        v10 = 0;
      }
      while (v8);
    }

    CCHmacFinal(&ctx, macOut);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", macOut, 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    keyID = self->_keyID;
    p_keyID = &self->_keyID;
    objc_msgSend(v17, "appendBytes:length:", -[NSData length](*p_keyID, "length") + -[NSData bytes](keyID, "bytes") - 4, 4);
    if (!objc_msgSend(v17, "length"))
    {
      v20 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[WBSHashGenerator generateHashWithComponents:].cold.1(p_key, v20, (id *)p_keyID);
      v21 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = v21;
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_key, "safari_descriptionWithoutSpaces");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSData safari_descriptionWithoutSpaces](*p_keyID, "safari_descriptionWithoutSpaces");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v34 = v23;
        v35 = 2114;
        v36 = v24;
        v37 = 2114;
        v38 = v25;
        _os_log_debug_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_DEBUG, "Could not generate IdentityHash for components %{private}@, with key %{public}@, keyID %{public}@", buf, 0x20u);

      }
    }
  }
  else
  {
    v26 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[WBSHashGenerator generateHashWithComponents:].cold.2(v26);
    v17 = 0;
  }

  return v17;
}

BOOL __47__WBSHashGenerator_generateHashWithComponents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

- (id)_createEncryptionKeyData
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", v4);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createEncryptionKeyIDDataUsingKey:(id)a3
{
  id v3;
  const char *v4;
  id v5;
  const void *v6;
  size_t v7;
  size_t v8;
  _BYTE macOut[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (const char *)objc_msgSend(CFSTR("Safari"), "UTF8String");
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  v8 = strlen(v4);
  CCHmac(2u, v6, v7, v4, v8, macOut);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; key: %@, keyID: %@>"),
               objc_opt_class(),
               self,
               self->_key,
               self->_keyID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHashGenerator)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSHashGenerator *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KeyID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBSHashGenerator initWithKey:keyID:](self, "initWithKey:keyID:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("Key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyID, CFSTR("KeyID"));

}

- (NSData)key
{
  return self->_key;
}

- (NSData)keyID
{
  return self->_keyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)generateHashWithComponents:(id *)a3 .cold.1(void **a1, void *a2, id *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "safari_descriptionWithoutSpaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "safari_descriptionWithoutSpaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Could not generate IdentityHash with key %{public}@, keyID %{public}@", (uint8_t *)&v8, 0x16u);

}

- (void)generateHashWithComponents:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Could not generate IdentityHash with empty components", v1, 2u);
}

@end
