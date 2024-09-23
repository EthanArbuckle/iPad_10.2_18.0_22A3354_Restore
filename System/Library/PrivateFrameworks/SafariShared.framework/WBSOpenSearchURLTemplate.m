@implementation WBSOpenSearchURLTemplate

- (NSString)templateString
{
  return self->_templateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_parametersByName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *templateString;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    templateString = self->_templateString;
    if (templateString)
      objc_msgSend(v5, "encodeObject:forKey:", templateString, CFSTR("templateString"));
  }

}

- (WBSOpenSearchURLTemplate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WBSOpenSearchURLTemplate *v6;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templateString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WBSOpenSearchURLTemplate initWithString:](self, "initWithString:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSOpenSearchURLTemplate)initWithString:(id)a3
{
  id v4;
  WBSOpenSearchURLTemplate *v5;
  uint64_t v6;
  NSString *templateString;
  NSMutableDictionary *v8;
  NSMutableDictionary *parametersByName;
  NSMutableArray *v10;
  NSMutableArray *parameters;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WBSOpenSearchURLTemplate *v15;
  uint64_t v16;
  unint64_t v17;
  WBSOpenSearchURLTemplateParameter *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  WBSOpenSearchURLTemplateParameter *v28;
  void *v29;
  id v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WBSOpenSearchURLTemplate;
  v5 = -[WBSOpenSearchURLTemplate init](&v32, sel_init);
  if (v5 && objc_msgSend(v4, "length"))
  {
    v6 = objc_msgSend(v4, "copy");
    templateString = v5->_templateString;
    v5->_templateString = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    parametersByName = v5->_parametersByName;
    v5->_parametersByName = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parameters = v5->_parameters;
    v5->_parameters = v10;

    v12 = -[NSString length](v5->_templateString, "length");
    v13 = -[NSString rangeOfString:options:range:](v5->_templateString, "rangeOfString:options:range:", CFSTR("{"), 2, 0, v12);
    v31 = v4;
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
      if (v12)
      {
LABEL_22:
        v28 = objc_alloc_init(WBSOpenSearchURLTemplateParameter);
        -[NSString substringWithRange:](v5->_templateString, "substringWithRange:", v14, v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSOpenSearchURLTemplateParameter setPrefix:](v28, "setPrefix:", v29);

        -[NSMutableArray addObject:](v5->_parameters, "addObject:", v28);
      }
    }
    else
    {
      v16 = v13;
      v14 = 0;
      v17 = 0;
      while (1)
      {
        v18 = objc_alloc_init(WBSOpenSearchURLTemplateParameter);
        -[NSString substringWithRange:](v5->_templateString, "substringWithRange:", v14, v16 - v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSOpenSearchURLTemplateParameter setPrefix:](v18, "setPrefix:", v19);

        v20 = v17 - (v16 + 1) + v12;
        v21 = -[NSString rangeOfString:options:range:](v5->_templateString, "rangeOfString:options:range:", CFSTR("}"), 2, v16 + 1, v20);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v22 = v21;
        if (v21 <= v16 + 1)
        {
          -[WBSOpenSearchURLTemplateParameter setOptional:](v18, "setOptional:", 0);
          v24 = -1;
        }
        else
        {
          v23 = -[NSString characterAtIndex:](v5->_templateString, "characterAtIndex:", v21 - 1);
          if (v23 == 63)
            v24 = -2;
          else
            v24 = -1;
          -[WBSOpenSearchURLTemplateParameter setOptional:](v18, "setOptional:", v23 == 63);
        }
        v14 = v22 + 1;
        -[NSString substringWithRange:](v5->_templateString, "substringWithRange:", v16 + 1, v22 - v16 + v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSOpenSearchURLTemplateParameter setName:](v18, "setName:", v25);
        -[WBSOpenSearchURLTemplateParameter setRange:](v18, "setRange:", v16, v22 + 1 - v16);
        -[NSMutableArray addObject:](v5->_parameters, "addObject:", v18);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_parametersByName, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v26, v18, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_parametersByName, "setObject:forKeyedSubscript:", v27, v25);

          }
          else
          {
            objc_msgSend(v26, "addObject:", v18);
          }
        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_parametersByName, "setObject:forKeyedSubscript:", v18, v25);
        }
        v12 += v17 + ~v22;

        v16 = -[NSString rangeOfString:options:range:](v5->_templateString, "rangeOfString:options:range:", CFSTR("{"), 2, v22 + 1, v12);
        v17 = v22 + 1;
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v12)
            goto LABEL_23;
          goto LABEL_22;
        }
      }

      v14 = v16 + 1;
      v12 += v17 - (v16 + 1);
      if (v20)
        goto LABEL_22;
    }
LABEL_23:
    v15 = v5;
    v4 = v31;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)templateBySubstitutingValues:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_parameters;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
      objc_msgSend(v11, "prefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v12);

      objc_msgSend(v11, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        break;
      objc_msgSend(v11, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v5, "appendString:", v15);
      }
      else
      {
        v16 = objc_msgSend(v11, "isOptional");
        objc_msgSend(v11, "name");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16)
          objc_msgSend(v5, "appendFormat:", CFSTR("{%@?}"), v17);
        else
          objc_msgSend(v5, "appendFormat:", CFSTR("{%@}"), v17);

      }
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v5);
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)includesParameter:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersByName, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)URLWithSearchTerms:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_parameters;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      objc_msgSend(v11, "prefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v12);

      objc_msgSend(v11, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_18:

        if ((v8 & 1) != 0)
          goto LABEL_23;
        goto LABEL_21;
      }
      objc_msgSend(v11, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("searchTerms"));

      if (v15)
        break;
      if ((objc_msgSend(v11, "isOptional") & 1) == 0)
      {
        v17 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[WBSOpenSearchURLTemplate URLWithSearchTerms:].cold.2(v26, v17, v11, &v27);
        objc_msgSend(v11, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("{%@}"), v16);
        goto LABEL_15;
      }
LABEL_16:
      if (v7 == ++v10)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    objc_msgSend(v21, "safari_stringEncodedAsURLQueryParameter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v4, "appendString:", v16);
    v8 = 1;
LABEL_15:

    goto LABEL_16;
  }

LABEL_21:
  v18 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[WBSOpenSearchURLTemplate URLWithSearchTerms:].cold.1(v18);
LABEL_23:
  objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)templateBySubstitutingValue:(id)a3 forParameter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSString *templateString;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  WBSOpenSearchURLTemplate *v14;
  void *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersByName, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_alloc((Class)objc_opt_class());
      templateString = self->_templateString;
      v11 = objc_msgSend(v8, "range");
      -[NSString stringByReplacingCharactersInRange:withString:](templateString, "stringByReplacingCharactersInRange:withString:", v11, v12, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (WBSOpenSearchURLTemplate *)objc_msgSend(v9, "initWithString:", v13);

    }
    else
    {
      v17 = v7;
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSOpenSearchURLTemplate templateBySubstitutingValues:](self, "templateBySubstitutingValues:", v15);
      v14 = (WBSOpenSearchURLTemplate *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = self;
  }

  return v14;
}

- (id)templateByAddingParameter:(id)a3 asURLQueryParameter:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[NSString rangeOfString:](self->_templateString, "rangeOfString:", CFSTR("?"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v8 + 1;
    -[NSString substringToIndex:](self->_templateString, "substringToIndex:", v8 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString substringFromIndex:](self->_templateString, "substringFromIndex:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@={%@}&%@"), v13, v7, v6, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  v9 = -[NSString rangeOfString:](self->_templateString, "rangeOfString:", CFSTR("#"));
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v9;
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[NSString substringToIndex:](self->_templateString, "substringToIndex:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString substringFromIndex:](self->_templateString, "substringFromIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@?%@={%@}%@"), v13, v7, v6, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  -[NSString stringByAppendingFormat:](self->_templateString, "stringByAppendingFormat:", CFSTR("?%@={%@}"), v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v10);

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  WBSOpenSearchURLTemplate *v4;
  BOOL v5;

  v4 = (WBSOpenSearchURLTemplate *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](self->_templateString, "isEqualToString:", v4->_templateString);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_templateString, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; templateString = %@>"), v5, self, self->_templateString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)URLWithSearchTerms:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Template does not include the \"searchTerms\" parameter", v1, 2u);
}

- (void)URLWithSearchTerms:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_ERROR, "Template contains non-optional parameter \"%@\", a1, 0xCu);

}

@end
