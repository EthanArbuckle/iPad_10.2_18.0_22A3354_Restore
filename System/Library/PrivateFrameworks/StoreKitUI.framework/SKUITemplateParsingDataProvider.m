@implementation SKUITemplateParsingDataProvider

+ (id)templateParsingRegularExpression
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUITemplateParsingDataProvider templateParsingRegularExpression].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("<script.*?id=\"(.*?)\".*?>((?:.|\\n)*?)</script>"), 8, &v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SKUITemplateParsingDataProvider)initWithRegularExpression:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUITemplateParsingDataProvider *v14;
  SKUITemplateParsingDataProvider *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUITemplateParsingDataProvider initWithRegularExpression:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITemplateParsingDataProvider;
  v14 = -[SKUITemplateParsingDataProvider init](&v17, sel_init);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_regularExpression, a3);

  return v15;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(a4, "statusCode");
  if ((unint64_t)(v9 - 400) > 0xC7)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    if (v11)
    {
      v35 = v8;
      -[SKUITemplateParsingDataProvider regularExpression](self, "regularExpression");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v17, "count"));
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = v17;
      v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v37 != v21)
              objc_enumerationMutation(v13);
            v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (objc_msgSend(v23, "numberOfRanges") == 3)
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "rangeAtIndex:", 1);
              objc_msgSend(v11, "substringWithRange:", v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = objc_msgSend(v23, "rangeAtIndex:", 2);
              objc_msgSend(v11, "substringWithRange:", v29, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v24);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, v28);
            }
            else
            {
              NSLog(CFSTR("*** Malformed match group %@, skipping"), v23);
            }
          }
          v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v20);
      }

      v15 = (void *)objc_msgSend(v18, "copy");
      v8 = v35;
    }
    else
    {
      if (!a5)
      {
        v15 = 0;
        goto LABEL_20;
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB31F0];
      v42 = &unk_1E749B6C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("SKUITemplateLoaderErrorDomain"), 561214578, v13);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  if (a5)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C92C18], "localizedStringForStatusCode:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v43[0] = CFSTR("SKUITemplateLoaderErrorHTTPStatusCodeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v43[1] = *MEMORY[0x1E0CB2D50];
    v44[0] = v13;
    v44[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("SKUITemplateLoaderErrorDomain"), 1752462448, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    goto LABEL_19;
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

+ (void)templateParsingRegularExpression
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithRegularExpression:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
