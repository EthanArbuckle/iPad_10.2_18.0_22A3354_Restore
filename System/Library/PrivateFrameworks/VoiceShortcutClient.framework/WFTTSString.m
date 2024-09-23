@implementation WFTTSString

- (WFTTSString)initWithComponents:(id)a3
{
  id v5;
  WFTTSString *v6;
  uint64_t v7;
  NSArray *components;
  WFTTSString *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTTSString.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFTTSString;
  v6 = -[WFTTSString init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    components = v6->_components;
    v6->_components = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (NSString)displayString
{
  void *v2;
  void *v3;
  void *v4;

  -[WFTTSString components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_16683);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E5FC92C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTTSString;
  -[WFTTSString description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTTSString components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFTTSString components](self, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

id __28__WFTTSString_displayString__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "displayString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

+ (id)parseAnnotatedString:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTTSString.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v26 = (objc_class *)a1;
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  v6 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("[Siri "), 0, 0, objc_msgSend(v5, "length"));
  v29 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v29 = 0;
    do
    {
      v9 = v8 + v7;
      v10 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("]"), 0, v9, objc_msgSend(v5, "length") - v9);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = v10;
        v30 = v11;
        objc_msgSend(v5, "substringWithRange:", v9, v10 - v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v14 = v28;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v32 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "parseAnnotationString:", v13);
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = (void *)v19;

                objc_msgSend(v5, "substringWithRange:", v29, v8 - v29);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "length"))
                  objc_msgSend(v27, "addObject:", v21);
                objc_msgSend(v27, "addObject:", v20);
                v9 = v12 + v30;

                v29 = v12 + v30;
                goto LABEL_18;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            if (v16)
              continue;
            break;
          }
        }

      }
LABEL_18:
      v8 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("[Siri "), 0, v9, objc_msgSend(v5, "length") - v9);
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
  if (v29 != objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "substringWithRange:", v29, objc_msgSend(v5, "length") - v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v22);

  }
  v23 = (void *)objc_msgSend([v26 alloc], "initWithComponents:", v27);

  return v23;
}

@end
