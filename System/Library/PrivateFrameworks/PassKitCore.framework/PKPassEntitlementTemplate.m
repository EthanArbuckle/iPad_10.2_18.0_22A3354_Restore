@implementation PKPassEntitlementTemplate

- (PKPassEntitlementTemplate)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  PKPassEntitlementTemplate *v9;
  PKPassEntitlementTemplate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassEntitlementTemplate;
  v9 = -[PKPassEntitlementTemplate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawDictionary, a3);
    objc_storeStrong((id *)&v10->_bundle, a4);
  }

  return v10;
}

- (void)setFieldInserts:(id)a3
{
  NSDictionary *v4;
  NSDictionary *fieldInserts;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  fieldInserts = self->_fieldInserts;
  self->_fieldInserts = v4;

}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_rawDictionary, "objectForKeyedSubscript:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_fieldInserts, "objectForKeyedSubscript:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassEntitlementTemplate _stringReplacingPlaceholdersInString:withInserts:](self, "_stringReplacingPlaceholdersInString:withInserts:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localizedDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_rawDictionary, "objectForKeyedSubscript:", CFSTR("description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_fieldInserts, "objectForKeyedSubscript:", CFSTR("description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassEntitlementTemplate _stringReplacingPlaceholdersInString:withInserts:](self, "_stringReplacingPlaceholdersInString:withInserts:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localizedGroup
{
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_rawDictionary, "objectForKeyedSubscript:", CFSTR("groupTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_fieldInserts, "objectForKeyedSubscript:", CFSTR("groupTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassEntitlementTemplate _stringReplacingPlaceholdersInString:withInserts:](self, "_stringReplacingPlaceholdersInString:withInserts:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)groupRenderingPriority
{
  void *v2;
  int64_t v3;

  -[NSDictionary PKNumberForKey:](self->_rawDictionary, "PKNumberForKey:", CFSTR("groupRenderingPriority"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)clearGroupWhenSelected
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_rawDictionary, "objectForKeyedSubscript:", CFSTR("clearGroupWhenSelected"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)icon
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_rawDictionary, "objectForKeyedSubscript:", CFSTR("icon"));
}

- (unint64_t)displayStyle
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_rawDictionary, "objectForKeyedSubscript:", CFSTR("displayStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKPassEntitlementDisplayStyleFromString(v2);

  return v3;
}

- (id)_stringReplacingPlaceholdersInString:(id)a3 withInserts:(id)a4
{
  NSString *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = a4;
  if (v6)
  {
    v40 = v7;
    PKLocalizedStringInMobileAssetsStringsBundle(v6, self->_bundle, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v47 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("%\\w+%"), 0, &v47);
    v11 = v47;
    objc_msgSend(v10, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = v8;
    if (v13)
    {
      v37 = v12;
      v38 = v11;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v12;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      v39 = v10;
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v44;
        do
        {
          v19 = 0;
          v41 = v16;
          do
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(obj);
            v20 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v19), "range");
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v22 = v20;
              v23 = v21;
              objc_msgSend(v8, "substringWithRange:", v17, v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v9;
              objc_msgSend(v9, "appendString:", v24);

              v26 = v8;
              objc_msgSend(v8, "substringWithRange:", v22 + 1, v23 - 2);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectForKeyedSubscript:", v27);
              v28 = objc_claimAutoreleasedReturnValue();
              if (!v28)
                goto LABEL_12;
              v29 = (void *)v28;
              v30 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v40, "objectForKeyedSubscript:", v27);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                objc_msgSend(v25, "appendString:", v32);

              }
              else
              {
LABEL_12:
                PKLogFacilityTypeGetObject(0x1BuLL);
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v27;
                  _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Error: Did not find %@ in entitlement template fields", buf, 0xCu);
                }

                objc_msgSend(v25, "appendString:", CFSTR("•••"));
              }
              v17 = v22 + v23;

              v8 = v26;
              v9 = v25;
              v16 = v41;
            }
            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v16);
      }
      else
      {
        v17 = 0;
      }

      objc_msgSend(v8, "substringWithRange:", v17, objc_msgSend(v8, "length") - v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendString:", v35);

      v14 = v9;
      v11 = v38;
      v10 = v39;
      v12 = v37;
    }
    v34 = v14;

    v7 = v40;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldInserts, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_rawDictionary, 0);
}

@end
