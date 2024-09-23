@implementation SSArchiveViewCardSection

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSArchiveViewCardSection;
  v4 = a3;
  -[SFArchiveViewCardSection encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SSArchiveViewCardSection attributeSet](self, "attributeSet", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributeSet"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SSArchiveViewCardSection isTopHit](self, "isTopHit"), CFSTR("isTopHit"));
  -[SSArchiveViewCardSection searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("searchString"));

  -[SSArchiveViewCardSection fallbackCardSection](self, "fallbackCardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fallbackCardSection"));

}

- (SSArchiveViewCardSection)initWithCoder:(id)a3
{
  id v4;
  SSArchiveViewCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSArchiveViewCardSection;
  v5 = -[SFArchiveViewCardSection initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributeSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSArchiveViewCardSection setAttributeSet:](v5, "setAttributeSet:", v6);

    -[SSArchiveViewCardSection setIsTopHit:](v5, "setIsTopHit:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTopHit")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSArchiveViewCardSection setSearchString:](v5, "setSearchString:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackCardSection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSArchiveViewCardSection setFallbackCardSection:](v5, "setFallbackCardSection:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void)setAttributeSet:(id)a3
{
  objc_storeStrong((id *)&self->_attributeSet, a3);
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (void)setIsTopHit:(BOOL)a3
{
  self->_isTopHit = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFCardSection)fallbackCardSection
{
  return self->_fallbackCardSection;
}

- (void)setFallbackCardSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackCardSection, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_attributeSet, 0);
}

@end
