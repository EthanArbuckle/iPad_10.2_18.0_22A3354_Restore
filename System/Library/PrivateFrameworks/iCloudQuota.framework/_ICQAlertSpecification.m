@implementation _ICQAlertSpecification

- (_ICQAlertSpecification)init
{
  _ICQAlertSpecification *v2;
  uint64_t v3;
  NSMutableDictionary *linkForButtonIndex;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ICQAlertSpecification;
  v2 = -[_ICQAlertSpecification init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    linkForButtonIndex = v2->_linkForButtonIndex;
    v2->_linkForButtonIndex = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (_ICQAlertSpecification)initWithServerDictionary:(id)a3
{
  id v4;
  _ICQAlertSpecification *v5;
  _ICQAlertSpecification *v6;

  v4 = a3;
  v5 = -[_ICQAlertSpecification init](self, "init");
  v6 = v5;
  if (v5)
    -[_ICQAlertSpecification setServerDict:](v5, "setServerDict:", v4);

  return v6;
}

- (id)linkForButtonIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[_ICQAlertSpecification linkForButtonIndex](self, "linkForButtonIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setLink:(id)a3 forButtonIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if ((unint64_t)(a4 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v6;
    -[_ICQAlertSpecification linkForButtonIndex](self, "linkForButtonIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "setObject:forKey:", v9, v8);
    else
      objc_msgSend(v7, "removeObjectForKey:", v8);

    v6 = v9;
  }

}

- (void)setLink:(id)a3 forButtonIndex:(int64_t)a4 defaultButton:(BOOL)a5
{
  _BOOL4 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  if (v5)
    -[_ICQAlertSpecification setDefaultButtonIndex:](self, "setDefaultButtonIndex:", a4);
  -[_ICQAlertSpecification setLink:forButtonIndex:](self, "setLink:forButtonIndex:", v8, a4);

}

- (void)_setLinks:(id)a3 defaultIndex:(unint64_t)a4
{
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = objc_msgSend(v12, "count");
  if (v6 != 1)
  {
    if (v6 != 2)
    {
      v7 = v6 == 3;
      v8 = v12;
      if (!v7)
        goto LABEL_8;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQAlertSpecification setLink:forButtonIndex:defaultButton:](self, "setLink:forButtonIndex:defaultButton:", v9, 3, a4 == 2);

    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQAlertSpecification setLink:forButtonIndex:defaultButton:](self, "setLink:forButtonIndex:defaultButton:", v10, 2, a4 == 1);

  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQAlertSpecification setLink:forButtonIndex:defaultButton:](self, "setLink:forButtonIndex:defaultButton:", v11, 1, a4 == 0);

  v8 = v12;
LABEL_8:

}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (void)setServerDict:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  _ICQAlertSpecification *v36;
  void *v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_serverDict, a3);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQAlertSpecification setTitle:](self, "setTitle:", v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQAlertSpecification setMessage:](self, "setMessage:", v7);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("altMesg"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQAlertSpecification setAltMessage:](self, "setAltMessage:", v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hideOnLock"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  -[_ICQAlertSpecification setDisableLockScreenAlert:](self, "setDisableLockScreenAlert:", _ICQBooleanForServerObjectDefault(v9, 0));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v37 = v5;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Actions"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v38 = -1;
    v19 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        _ICQLinkForServerMessageParameter(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v15, "addObject:", v22);
          v23 = v21;
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("btnDefault"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = v24;
          }
          else
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("BtnDefault"));
            v26 = (id)objc_claimAutoreleasedReturnValue();
          }
          v27 = v26;

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = objc_msgSend(v27, "BOOLValue");

            if ((v28 & 1) == 0)
              goto LABEL_26;
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = objc_msgSend(v27, "isEqualToString:", CFSTR("0"));

            if ((v29 & 1) != 0)
              goto LABEL_26;
            goto LABEL_25;
          }
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("btnAction"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            v32 = v30;
          }
          else
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("BtnAction"));
            v32 = (id)objc_claimAutoreleasedReturnValue();
          }
          v33 = v32;

          if (objc_msgSend(v33, "isEqualToString:", CFSTR("CHANGE_STORAGE_PLAN")))
          {

            goto LABEL_25;
          }
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("MANAGE_STORAGE"));

          if (v34)
LABEL_25:
            v38 = v18;
LABEL_26:
          ++v18;
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v17)
        goto LABEL_31;
    }
  }
  v38 = -1;
LABEL_31:

  v35 = (void *)objc_msgSend(v15, "copy");
  -[_ICQAlertSpecification _setLinks:defaultIndex:](v36, "_setLinks:defaultIndex:", v35, v38);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)altMessage
{
  return self->_altMessage;
}

- (void)setAltMessage:(id)a3
{
  objc_storeStrong((id *)&self->_altMessage, a3);
}

- (NSString)lockScreenTitle
{
  return self->_lockScreenTitle;
}

- (void)setLockScreenTitle:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenTitle, a3);
}

- (NSString)lockScreenMessage
{
  return self->_lockScreenMessage;
}

- (void)setLockScreenMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenMessage, a3);
}

- (NSString)altLockScreenMessage
{
  return self->_altLockScreenMessage;
}

- (void)setAltLockScreenMessage:(id)a3
{
  objc_storeStrong((id *)&self->_altLockScreenMessage, a3);
}

- (BOOL)disableLockScreenAlert
{
  return self->_disableLockScreenAlert;
}

- (void)setDisableLockScreenAlert:(BOOL)a3
{
  self->_disableLockScreenAlert = a3;
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (NSMutableDictionary)linkForButtonIndex
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkForButtonIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkForButtonIndex, 0);
  objc_storeStrong((id *)&self->_altLockScreenMessage, 0);
  objc_storeStrong((id *)&self->_lockScreenMessage, 0);
  objc_storeStrong((id *)&self->_lockScreenTitle, 0);
  objc_storeStrong((id *)&self->_altMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

+ (id)alertSpecificationSampleForLevel:(int64_t)a3
{
  uint64_t *v3;
  id v4;

  if (a3 == 3)
  {
    if (AlertSpecificationSampleForFullLevel_onceToken != -1)
      dispatch_once(&AlertSpecificationSampleForFullLevel_onceToken, &__block_literal_global_10);
    v3 = &AlertSpecificationSampleForFullLevel_sAlertSpecification;
  }
  else
  {
    if (a3 != 2)
    {
      v4 = 0;
      return v4;
    }
    if (AlertSpecificationSampleForAlmostFullLevel_onceToken != -1)
      dispatch_once(&AlertSpecificationSampleForAlmostFullLevel_onceToken, &__block_literal_global_5);
    v3 = &AlertSpecificationSampleForAlmostFullLevel_sAlertSpecification;
  }
  v4 = (id)*v3;
  return v4;
}

+ (id)alertSpecificationDictionarySampleForLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return &unk_1E8B53EF0;
}

@end
