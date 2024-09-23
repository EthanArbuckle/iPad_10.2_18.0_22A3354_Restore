@implementation PKPassUpgradePrecursorPassRequest

- (PKPassUpgradePrecursorPassRequest)initWithDictionary:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassRequest *v5;
  PKPassUpgradePrecursorPassRequest *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *p_super;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  __objc2_class *v18;
  id v19;
  id v20;
  __objc2_class *v21;
  uint64_t v22;
  PKPassUpgradePrecursorPassRequest *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id *p_isa;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  v5 = -[PKPassUpgradeRequest initWithDictionary:](&v34, sel_initWithDictionary_, v4);
  if (v5)
  {
    v6 = v5;
    -[PKPassUpgradeRequest secureElementIdentifier](v5, "secureElementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actions"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v8, "count"))
      {
        p_isa = (id *)&v6->super.super.isa;
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        p_super = v8;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](p_super, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(p_super);
              v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v15, "PKStringForKey:", CFSTR("type"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              switch(PKPassUpgradePrecursorPassActionTypeFromString(v16))
              {
                case 0:
                  PKLogFacilityTypeGetObject(0x25uLL);
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Unknown Precursor pass action type request", buf, 2u);
                  }
                  goto LABEL_19;
                case 1:
                  v18 = PKPassUpgradePrecursorPassProofingAction;
                  goto LABEL_14;
                case 2:
                  v18 = PKPassUpgradePrecursorPassAction;
LABEL_14:
                  v19 = [v18 alloc];
                  v20 = v15;
                  goto LABEL_18;
                case 3:
                  v21 = PKPassUpgradePrecursorPassGenericReprovisionAction;
                  goto LABEL_17;
                case 4:
                  v21 = PKPassUpgradePrecursorPassIssuerAppAction;
LABEL_17:
                  v19 = [v21 alloc];
                  v20 = v4;
LABEL_18:
                  v17 = objc_msgSend(v19, "initWithDictionary:", v20);
                  -[NSObject safelyAddObject:](v9, "safelyAddObject:", v17);
LABEL_19:

                  break;
                default:
                  break;
              }

            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](p_super, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          }
          while (v12);
        }

        v22 = -[NSObject copy](v9, "copy");
        v23 = (PKPassUpgradePrecursorPassRequest *)p_isa;
        v24 = p_isa[6];
        p_isa[6] = (id)v22;

        if (!objc_msgSend(p_isa[6], "count"))
        {
          PKLogFacilityTypeGetObject(0x25uLL);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "WARNING: Precursor pass request has no actions", buf, 2u);
          }

          v23 = 0;
        }
        v8 = v9;
        goto LABEL_34;
      }
      PKLogFacilityTypeGetObject(0x25uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Missing actions for precursor pass upgrade request", buf, 2u);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0x25uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Missing seid key for precursor pass upgrade request", buf, 2u);
      }
    }
    p_super = &v6->super.super;
    v23 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v23 = 0;
LABEL_35:

  return v23;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  -[PKPassUpgradeRequest asDictionary](&v19, sel_asDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSArray count](self->_actions, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_actions;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "asDictionary", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("actions"));

  }
  v13 = (void *)objc_msgSend(v4, "copy", (_QWORD)v15);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassUpgradePrecursorPassRequest)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *actions;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  v5 = -[PKPassUpgradeRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("actions"));
    v12 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  v4 = a3;
  -[PKPassUpgradeRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_actions, CFSTR("actions"), v5.receiver, v5.super_class);

}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
