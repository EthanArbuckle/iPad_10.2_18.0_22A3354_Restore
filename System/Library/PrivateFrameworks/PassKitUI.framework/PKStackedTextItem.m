@implementation PKStackedTextItem

- (PKStackedTextItem)init
{
  return -[PKStackedTextItem initWithNumberOfContentRows:groupingIdentifier:](self, "initWithNumberOfContentRows:groupingIdentifier:", 0, 0);
}

- (PKStackedTextItem)initWithNumberOfContentRows:(unint64_t)a3 groupingIdentifier:(id)a4
{
  id v6;
  PKStackedTextItem *v7;
  uint64_t v8;
  NSString *groupingIdentifier;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKStackedTextItem;
  v7 = -[PKStackedTextItem init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    groupingIdentifier = v7->_groupingIdentifier;
    v7->_groupingIdentifier = (NSString *)v8;

    v7->_numberOfContentRows = a3;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  v8 = v6
    && self->_numberOfContentRows == *((_QWORD *)v6 + 3)
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && self->_significantPrimary == v7[8]
    && self->_deemphasizedPrimary == v7[9]
    && self->_strikethroughPrimary == v7[10];

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (2 * self->_deemphasizedPrimary) | (4 * self->_significantPrimary) | self->_strikethroughPrimary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[NSString hash](self->_groupingIdentifier, "hash");
  v6 = v5 ^ -[NSString hash](self->_title, "hash");
  v7 = v6 ^ -[NSString hash](self->_primary, "hash");
  v8 = v7 ^ -[NSString hash](self->_secondary, "hash");
  v9 = v8 ^ -[NSString hash](self->_tertiary, "hash") ^ v4;
  return v9 ^ PKIntegerHash();
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (unint64_t)numberOfContentRows
{
  return self->_numberOfContentRows;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)primary
{
  return self->_primary;
}

- (void)setPrimary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)secondary
{
  return self->_secondary;
}

- (void)setSecondary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)tertiary
{
  return self->_tertiary;
}

- (void)setTertiary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSignificantPrimary
{
  return self->_significantPrimary;
}

- (void)setSignificantPrimary:(BOOL)a3
{
  self->_significantPrimary = a3;
}

- (BOOL)isDeemphasizedPrimary
{
  return self->_deemphasizedPrimary;
}

- (void)setDeemphasizedPrimary:(BOOL)a3
{
  self->_deemphasizedPrimary = a3;
}

- (BOOL)isStrikethroughPrimary
{
  return self->_strikethroughPrimary;
}

- (void)setStrikethroughPrimary:(BOOL)a3
{
  self->_strikethroughPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiary, 0);
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

@end
