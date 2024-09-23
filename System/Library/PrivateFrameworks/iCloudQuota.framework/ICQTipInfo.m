@implementation ICQTipInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQTipInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  ICQTipInfo *v21;
  ICQTipInfo *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  ICQTipInfo *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ICQTipInfo;
  v5 = -[ICQTipInfo init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQTipInfo setTitle:](v5, "setTitle:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQTipInfo setSubtitle:](v5, "setSubtitle:", v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQTipInfo setAnchor:](v5, "setAnchor:", v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQTipInfo setId:](v5, "setId:", v9);
    v25 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[ICQTipInfo setDismissURL:](v5, "setDismissURL:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICQTipInfo _parseTipIcon:](v5, "_parseTipIcon:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQTipInfo setIcon:](v5, "setIcon:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __33__ICQTipInfo_initFromDictionary___block_invoke;
      v30[3] = &unk_1E8B39980;
      v31 = v15;
      v16 = v15;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
      -[ICQTipInfo setActions:](v5, "setActions:", v16);
      v17 = v31;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        goto LABEL_22;
      }
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __33__ICQTipInfo_initFromDictionary___block_invoke_2;
      v26[3] = &unk_1E8B399A8;
      v27 = v6;
      v24 = v8;
      v19 = v7;
      v20 = v6;
      v21 = v5;
      v28 = v21;
      v29 = v18;
      v17 = v18;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v26);
      v22 = v21;
      v6 = v20;
      v7 = v19;
      v8 = v24;
      -[ICQTipInfo setActions:](v22, "setActions:", v17);

    }
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

void __33__ICQTipInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[ICQActionInfo initFromDictionary:]([ICQActionInfo alloc], "initFromDictionary:", v4);
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

void __33__ICQTipInfo_initFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  ICQActionInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  ICQLink *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(ICQActionInfo);
    -[ICQActionInfo setIsDefault:](v4, "setIsDefault:", 0);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[ICQActionInfo setActionURL:](v4, "setActionURL:", v6);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actionParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("purchaseAttribution"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("route"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("purchaseAttribution"));
        if (v11)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("route"));

      }
      if (v5)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("URL"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("openURL"));
      }
      v12 = -[ICQLink initWithText:action:parameters:]([ICQLink alloc], "initWithText:action:parameters:", *(_QWORD *)(a1 + 32), _ICQActionForServerActionString(v7), v9);

    }
    else
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Parsing manage storage tip, no action type found", v16, 2u);
      }

      v12 = 0;
    }
    -[ICQActionInfo setIcqLink:](v4, "setIcqLink:", v12);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("text"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQActionInfo setTitle:](v4, "setTitle:", v14);

    objc_msgSend(*(id *)(a1 + 40), "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQActionInfo setSubtitle:](v4, "setSubtitle:", v15);

    -[ICQActionInfo setConfirmation:](v4, "setConfirmation:", 0);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

  }
}

- (id)_parseTipIcon:(id)a3
{
  id v3;
  void *v4;
  ICQTipIconURL *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("IMAGE")))
  {
    v5 = objc_alloc_init(ICQTipIconURL);
    -[ICQTipIcon setType:](v5, "setType:", v4);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("urls"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ICQImageURL initFromDictionary:]([ICQImageURL alloc], "initFromDictionary:", v6);
      -[ICQTipIconURL setImageURL:](v5, "setImageURL:", v7);

    }
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SF_SYMBOL")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v5 = objc_alloc_init(ICQTipIconSymbol);
    -[ICQTipIcon setType:](v5, "setType:", v4);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQTipIconURL setPath:](v5, "setPath:", v8);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("color"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQTipIconURL setSystemColorName:](v5, "setSystemColorName:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQTipIconURL setId:](v5, "setId:", v6);
  }

LABEL_8:
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("id: %@, title: %@, subtitle: %@, anchor: %@, dismissURL: %@, actions: %@, icon: %@"), self->_id, self->_title, self->_subtitle, self->_anchor, self->_dismissURL, self->_actions, self->_icon);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQTipInfo *v4;

  v4 = objc_alloc_init(ICQTipInfo);
  -[ICQTipInfo setId:](v4, "setId:", self->_id);
  -[ICQTipInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQTipInfo setSubtitle:](v4, "setSubtitle:", self->_subtitle);
  -[ICQTipInfo setAnchor:](v4, "setAnchor:", self->_anchor);
  -[ICQTipInfo setDismissURL:](v4, "setDismissURL:", self->_dismissURL);
  -[ICQTipInfo setActions:](v4, "setActions:", self->_actions);
  -[ICQTipInfo setIcon:](v4, "setIcon:", self->_icon);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *id;
  id v5;

  id = self->_id;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", id, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchor, CFSTR("anchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissURL, CFSTR("dismissURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));

}

- (ICQTipInfo)initWithCoder:(id)a3
{
  id v4;
  ICQTipInfo *v5;
  uint64_t v6;
  NSString *id;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *anchor;
  uint64_t v14;
  NSURL *dismissURL;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *actions;
  uint64_t v21;
  ICQTipIcon *icon;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICQTipInfo;
  v5 = -[ICQTipInfo init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    id = v5->_id;
    v5->_id = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
    v12 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismissURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    dismissURL = v5->_dismissURL;
    v5->_dismissURL = (NSURL *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("actions"));
    v19 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v21 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (ICQTipIcon *)v21;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)dismissURL
{
  return self->_dismissURL;
}

- (void)setDismissURL:(id)a3
{
  objc_storeStrong((id *)&self->_dismissURL, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (ICQTipIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dismissURL, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
