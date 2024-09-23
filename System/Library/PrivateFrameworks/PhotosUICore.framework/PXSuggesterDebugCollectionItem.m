@implementation PXSuggesterDebugCollectionItem

- (PXSuggesterDebugCollectionItem)initWithSuggestion:(id)a3 suggestionInfo:(id)a4
{
  id v7;
  id v8;
  PXSuggesterDebugCollectionItem *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  NSString *description;
  id *p_description;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  NSDate *v37;
  NSDate *date;
  objc_super v40;

  v7 = a3;
  v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PXSuggesterDebugCollectionItem;
  v9 = -[PXSuggesterDebugCollectionItem init](&v40, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyAssetUUID"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    name = v9->_name;
    v9->_name = v13;

    objc_msgSend(v7, "localizedSubtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR(" "));
    v16 = objc_claimAutoreleasedReturnValue();
    p_description = (id *)&v9->_description;
    description = v9->_description;
    v9->_description = (NSString *)v16;

    -[NSString stringByAppendingString:](v9->_description, "stringByAppendingString:", CFSTR(", "));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (__CFString *)v19;
    else
      v21 = &stru_1E5149688;
    objc_storeStrong((id *)&v9->_description, v21);

    v22 = *p_description;
    v23 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyAssetCreationDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringFromDate:dateStyle:timeStyle:", v24, 1, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *p_description;
    *p_description = (id)v26;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reasons"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(*p_description, "stringByAppendingString:", CFSTR(", "));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *p_description;
      *p_description = (id)v29;

      v31 = *p_description;
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByAppendingString:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = *p_description;
      *p_description = (id)v33;

    }
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_msgSend(v7, "startDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
      v37 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    date = v9->_date;
    v9->_date = v37;

    objc_storeStrong((id *)&v9->_info, a4);
  }

  return v9;
}

- (BOOL)isInvalid
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("isInvalid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
