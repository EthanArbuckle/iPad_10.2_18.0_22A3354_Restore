@implementation PXSettingsConfiguration

- (PXSettingsConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfiguration.m"), 29, CFSTR("%s is not available as initializer"), "-[PXSettingsConfiguration init]");

  abort();
}

- (PXSettingsConfiguration)initWithName:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXSettingsConfiguration *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "archiveDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSettingsConfiguration initWithName:settings:archive:](self, "initWithName:settings:archive:", v7, v6, v8);

  return v9;
}

- (PXSettingsConfiguration)initWithName:(id)a3 settings:(id)a4 archive:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXSettingsConfiguration *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSDictionary *archive;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXSettingsConfiguration;
  v11 = -[PXSettingsConfiguration init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong((id *)&v11->_settings, a4);
    v14 = objc_msgSend(v10, "copy");
    archive = v11->_archive;
    v11->_archive = (NSDictionary *)v14;

  }
  return v11;
}

- (PXSettingsConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  Class v8;
  uint64_t v9;
  void *v10;
  PXSettingsConfiguration *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (v8 = NSClassFromString(v6),
        !-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class())))
  {
    v10 = 0;
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  -[objc_class sharedInstance](v8, "sharedInstance");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v5 || !v9 || !v7)
    goto LABEL_8;
  v11 = -[PXSettingsConfiguration initWithName:settings:archive:](self, "initWithName:settings:archive:", v5, v9, v7);
LABEL_9:

  return v11;
}

- (id)copyWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[PXSettingsConfiguration settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfiguration archive](self, "archive");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithName:settings:archive:", v4, v6, v7);

  return v8;
}

- (id)copyWithUpdatedSettingsValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[PXSettingsConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfiguration settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:settings:", v4, v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXSettingsConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[PXSettingsConfiguration settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("settingsClass"));

  -[PXSettingsConfiguration archive](self, "archive");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("archive"));

}

- (NSString)name
{
  return self->_name;
}

- (PXSettings)settings
{
  return self->_settings;
}

- (NSDictionary)archive
{
  return self->_archive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)sharableStringForConfigurations:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v30[0] = CFSTR("name");
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v11;
        v30[1] = CFSTR("settingsClass");
        objc_msgSend(v10, "settings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v14;
        v30[2] = CFSTR("archive");
        objc_msgSend(v10, "archive");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 1, &v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v25;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSettingsConfiguration.m"), 86, CFSTR("failed to serialize configurations: %@"), v18);

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Photos internal settings configurations. To import, copy this whole text and select Photos > Internal Settings > (…) > Configurations > Import…\n\n%@\n%@\n%@\n"), CFSTR("========="), v19, CFSTR("========="));

  return v20;
}

+ (id)configurationsFromSharableString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  Class v20;
  void *v21;
  void *v22;
  void *v23;
  PXSettingsConfiguration *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\n%@\n"), CFSTR("========="));
  objc_msgSend(v3, "componentsSeparatedByString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v7 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_29:
    v33 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  v11 = v10;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v11;
      v28 = v8;
      v29 = v7;
      v30 = v5;
      v31 = v4;
      v32 = v3;
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v27 = v9;
      obj = v9;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (!v12)
        goto LABEL_27;
      v13 = v12;
      v14 = *(_QWORD *)v36;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSLog(CFSTR("unexpected object when deserialize configurations (expecting dictionary): %@"), v16);
            goto LABEL_25;
          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("settingsClass"));
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("archive"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            v21 = 0;
LABEL_23:
            NSLog(CFSTR("malformed configuration dictionary: %@"), v16);
            v23 = v19;
            goto LABEL_24;
          }
          v20 = NSClassFromString(v18);
          if (-[objc_class isSubclassOfClass:](v20, "isSubclassOfClass:", objc_opt_class()))
          {
            -[objc_class sharedInstance](v20, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = 0;
          }
          -[objc_class settingsFromArchiveDictionary:](v20, "settingsFromArchiveDictionary:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "archiveDictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v19 = v23;
            goto LABEL_23;
          }
          if (!v21 || !v23)
          {
            v19 = v23;
            goto LABEL_23;
          }
          v24 = -[PXSettingsConfiguration initWithName:settings:archive:]([PXSettingsConfiguration alloc], "initWithName:settings:archive:", v17, v21, v23);
          objc_msgSend(v33, "addObject:", v24);

LABEL_24:
LABEL_25:
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (!v13)
        {
LABEL_27:

          v4 = v31;
          v3 = v32;
          v7 = v29;
          v5 = v30;
          v9 = v27;
          v8 = v28;
          v11 = v26;
          goto LABEL_33;
        }
      }
    }
    NSLog(CFSTR("unexpected object when deserialize configurations (expecting array): %@"), v9);
  }
  else
  {
    NSLog(CFSTR("failed to deserialize configurations: %@"), v10);
  }
  v33 = 0;
LABEL_33:

LABEL_34:
  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
