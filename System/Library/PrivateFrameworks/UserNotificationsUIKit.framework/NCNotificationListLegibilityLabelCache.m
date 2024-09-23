@implementation NCNotificationListLegibilityLabelCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance___sharedInstance;
}

void __56__NCNotificationListLegibilityLabelCache_sharedInstance__block_invoke()
{
  NCNotificationListLegibilityLabelCache *v0;
  void *v1;

  v0 = objc_alloc_init(NCNotificationListLegibilityLabelCache);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (NCNotificationListLegibilityLabelCache)init
{
  NCNotificationListLegibilityLabelCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sectionHeaderViewLegibilityLabelDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListLegibilityLabelCache;
  v2 = -[NCNotificationListLegibilityLabelCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionHeaderViewLegibilityLabelDictionary = v2->_sectionHeaderViewLegibilityLabelDictionary;
    v2->_sectionHeaderViewLegibilityLabelDictionary = v3;

  }
  return v2;
}

- (id)legibilityLabelForTitle:(id)a3 forSuperview:(id)a4 font:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NCNotificationListLegibilityLabelCache sectionHeaderViewLegibilityLabelDictionary](self, "sectionHeaderViewLegibilityLabelDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NCNotificationListLegibilityLabelCache sectionHeaderViewLegibilityLabelDictionary](self, "sectionHeaderViewLegibilityLabelDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v8);

  }
  -[NCNotificationListLegibilityLabelCache _stringDescriptorForFont:](self, "_stringDescriptorForFont:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "superview");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v16, "superview");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 != v9)
      {
        -[NCNotificationListLegibilityLabelCache _createLegibilityLabelWithTitle:font:](self, "_createLegibilityLabelWithTitle:font:", v8, v10);
        v20 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v20;
      }
    }
  }
  else
  {
    -[NCNotificationListLegibilityLabelCache _createLegibilityLabelWithTitle:font:](self, "_createLegibilityLabelWithTitle:font:", v8, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v16, v14);
  }

  return v16;
}

- (void)clearAll
{
  id v2;

  -[NCNotificationListLegibilityLabelCache sectionHeaderViewLegibilityLabelDictionary](self, "sectionHeaderViewLegibilityLabelDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_createLegibilityLabelWithTitle:(id)a3 font:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC4270];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstanceForStyle:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5D8]), "initWithSettings:strength:", v8, *MEMORY[0x1E0DC5960]);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(v9, "setLineBreakMode:", 0);
  objc_msgSend(v9, "setFont:", v6);

  objc_msgSend(v9, "setString:", v7);
  objc_msgSend(v9, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  return v9;
}

- (id)_stringDescriptorForFont:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v8 = v7;

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%f"), v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableDictionary)sectionHeaderViewLegibilityLabelDictionary
{
  return self->_sectionHeaderViewLegibilityLabelDictionary;
}

- (void)setSectionHeaderViewLegibilityLabelDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderViewLegibilityLabelDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewLegibilityLabelDictionary, 0);
}

@end
