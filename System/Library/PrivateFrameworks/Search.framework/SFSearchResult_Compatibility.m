@implementation SFSearchResult_Compatibility

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)SFSearchResult_Compatibility;
  -[SFSearchResult_SpotlightExtras debugDescription](&v12, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_Compatibility sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_Compatibility title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SFSearchResult_SpotlightExtras score](self, "score");
  -[SFSearchResult_SpotlightExtras score](self, "score");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ (0x%llx, 0x%llx)"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)setCompatibilityTitle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BE85018];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SFSearchResult_Compatibility setTitle:](self, "setTitle:", v6);

  -[SFSearchResult_Compatibility title](self, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

}

- (NSString)compatibilityTitle
{
  void *v2;
  void *v3;

  -[SFSearchResult_Compatibility title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSimpleTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[SFSearchResult_Compatibility title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE85018]);
    -[SFSearchResult_Compatibility setTitle:](self, "setTitle:", v6);

  }
  -[SFSearchResult_Compatibility title](self, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

}

- (id)simpleTitle
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSearchResult_Compatibility;
  -[SFSearchResult_Compatibility title](&v5, sel_title);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SFSearchResult_Compatibility identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFSearchResult_Compatibility;
    -[SFSearchResult_Compatibility title](&v8, sel_title);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)isQuickGlance
{
  return 0;
}

- (id)section_header
{
  return CFSTR("missing");
}

@end
