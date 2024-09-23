@implementation VUIFamilySharingMediaEntitiesResponseMetadataParser

- (VUIFamilySharingMediaEntitiesResponseMetadataParser)init
{
  VUIFamilySharingMediaEntitiesResponseMetadataParser *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIFamilySharingMediaEntitiesResponseMetadataParser;
  v2 = -[VUIFamilySharingMediaEntitiesResponseMetadataParser init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.tv.mediaAPI", "VUIFamilySharingMediaEntitiesResponseMetadataParser");
    v4 = (void *)sLogObject_3;
    sLogObject_3 = (uint64_t)v3;

  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4;
  VUIMediaAPIResponseMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v4 = a3;
  -[VUIFamilySharingMediaEntitiesResponseMetadataParser setResult:](self, "setResult:", v4);
  v5 = objc_alloc_init(VUIMediaAPIResponseMetadata);
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
  {
    -[VUIFamilySharingMediaEntitiesResponseMetadataParser _parseTotalFromMetaBag](self, "_parseTotalFromMetaBag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaAPIResponseMetadata setTotal:](v5, "setTotal:", v7);

    -[VUIFamilySharingMediaEntitiesResponseMetadataParser _parseOffsetFromMetaBag](self, "_parseOffsetFromMetaBag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaAPIResponseMetadata setOffset:](v5, "setOffset:", v8);

  }
  else
  {
    v9 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Parsing AMS Metadata with no object dictionary", v11, 2u);
    }
  }
  return v5;
}

- (id)_parseTotalFromMetaBag
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  -[VUIFamilySharingMediaEntitiesResponseMetadataParser result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_dictionaryForKey:", CFSTR("meta"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Parsing AMS Meta with no meta bag", v8, 2u);
    }
  }
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("total"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_parseOffsetFromMetaBag
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[VUIFamilySharingMediaEntitiesResponseMetadataParser result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("next"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v4);
    objc_msgSend(v5, "queryItems");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "name", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("offset"));

          if (v13)
          {
            objc_msgSend(v11, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v15 = sLogObject_3;
    if (os_log_type_enabled((os_log_t)sLogObject_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Parsing AMS Meta with no offset bag", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (AMSURLResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
