@implementation WFChooseFromMenuItem

- (WFChooseFromMenuItem)initWithString:(id)a3 synonyms:(id)a4 subtitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFChooseFromMenuItem *v11;
  uint64_t v12;
  NSString *string;
  uint64_t v14;
  NSArray *synonyms;
  uint64_t v16;
  NSString *subtitle;
  WFChooseFromMenuItem *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFChooseFromMenuItem;
  v11 = -[WFChooseFromMenuItem init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    string = v11->_string;
    v11->_string = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    synonyms = v11->_synonyms;
    v11->_synonyms = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    subtitle = v11->_subtitle;
    v11->_subtitle = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (WFChooseFromMenuItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  WFChooseFromMenuItem *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("synonyms"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = &stru_1E7AFA810;
  if (v10)
    v11 = v10;
  v12 = v11;

  v13 = -[WFChooseFromMenuItem initWithString:synonyms:subtitle:](self, "initWithString:synonyms:subtitle:", v5, v9, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFChooseFromMenuItem string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("string"));

  -[WFChooseFromMenuItem synonyms](self, "synonyms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("synonyms"));

  -[WFChooseFromMenuItem subtitle](self, "subtitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitle"));

}

- (NSString)string
{
  return self->_string;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
