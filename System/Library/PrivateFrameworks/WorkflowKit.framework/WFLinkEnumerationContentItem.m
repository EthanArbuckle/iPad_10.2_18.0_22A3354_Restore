@implementation WFLinkEnumerationContentItem

- (WFLinkEnumerationCase)enumCase
{
  return (WFLinkEnumerationCase *)-[WFLinkEnumerationContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (WFLinkEnumerationContentItem)initWithCoder:(id)a3
{
  id v4;
  WFLinkEnumerationContentItem *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  WFLinkEnumerationContentItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFLinkEnumerationContentItem;
  v5 = -[WFLinkEnumerationContentItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumCase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v6, "wf_contentItemClassWithAppBundleIdentifier:", v9), "itemWithObject:", v7);
      v10 = (WFLinkEnumerationContentItem *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFLinkEnumerationContentItem enumCase](self, "enumCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("enumCase"));

  objc_msgSend((id)objc_opt_class(), "enumMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("enumMetadata"));

  objc_msgSend((id)objc_opt_class(), "appBundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("appBundleIdentifier"));

}

- (LNEnumCaseMetadata)enumCaseMetadata
{
  LNEnumCaseMetadata *enumCaseMetadata;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  LNEnumCaseMetadata *v8;
  LNEnumCaseMetadata *v9;
  _QWORD v11[4];
  id v12;

  enumCaseMetadata = self->_enumCaseMetadata;
  if (!enumCaseMetadata)
  {
    -[WFLinkEnumerationContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "enumMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__WFLinkEnumerationContentItem_enumCaseMetadata__block_invoke;
    v11[3] = &unk_1E7AF89A0;
    v12 = v4;
    v7 = v4;
    objc_msgSend(v6, "if_firstObjectPassingTest:", v11);
    v8 = (LNEnumCaseMetadata *)objc_claimAutoreleasedReturnValue();
    v9 = self->_enumCaseMetadata;
    self->_enumCaseMetadata = v8;

    enumCaseMetadata = self->_enumCaseMetadata;
  }
  return enumCaseMetadata;
}

- (id)name
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFLinkEnumerationContentItem enumCaseMetadata](self, "enumCaseMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[WFLinkEnumerationContentItem enumCaseMetadata](self, "enumCaseMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v8)
    v4[2](v4, v8);

  return v8 != 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void (**)(id, void *, _QWORD))a3;
  -[WFLinkEnumerationContentItem enumCaseMetadata](self, "enumCaseMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v9)
    v5[2](v5, v9, 0);

  return v9 != 0;
}

- (void)setEnumCaseMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_enumCaseMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumCaseMetadata, 0);
}

uint64_t __48__WFLinkEnumerationContentItem_enumCaseMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (LNEnumMetadata)enumMetadata
{
  return 0;
}

+ (NSString)appBundleIdentifier
{
  return (NSString *)&stru_1E7AFA810;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "enumMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8BEA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pluralTypeDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "enumMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8BEC0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localizedCountDescriptionWithValue:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "enumMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numericFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithReplacements:forLocaleIdentifier:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "localizedPluralTypeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "canLowercaseTypeDescription"))
    {
      objc_msgSend(v8, "localizedLowercaseString");
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v13, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
