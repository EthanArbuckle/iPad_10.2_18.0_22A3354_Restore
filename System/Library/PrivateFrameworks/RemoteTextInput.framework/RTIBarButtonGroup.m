@implementation RTIBarButtonGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *itemWidths;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  itemWidths = self->_itemWidths;
  if (itemWidths)
    objc_msgSend(v6, "encodeObject:forKey:", itemWidths, CFSTR("items"));
  v5 = v6;
  if (self->_representativeItemWidth != 0.0)
  {
    objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("rpItem"));
    v5 = v6;
  }

}

- (RTIBarButtonGroup)initWithCoder:(id)a3
{
  id v4;
  RTIBarButtonGroup *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *itemWidths;
  float v11;
  objc_super v13;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v13.receiver = self;
  v13.super_class = (Class)RTIBarButtonGroup;
  v5 = -[RTIBarButtonGroup init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    itemWidths = v5->_itemWidths;
    v5->_itemWidths = (NSArray *)v9;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rpItem"));
    v5->_representativeItemWidth = v11;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTIBarButtonGroup *v4;
  uint64_t v5;
  NSArray *itemWidths;

  v4 = -[RTIBarButtonGroup init](+[RTIBarButtonGroup allocWithZone:](RTIBarButtonGroup, "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_itemWidths, "copy");
  itemWidths = v4->_itemWidths;
  v4->_itemWidths = (NSArray *)v5;

  v4->_representativeItemWidth = self->_representativeItemWidth;
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[RTIBarButtonGroup itemWidths](self, "itemWidths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTIBarButtonGroup itemWidths](self, "itemWidths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; leadingBarButtonGroupWidths = %@"), v5);

  }
  -[RTIBarButtonGroup representativeItemWidth](self, "representativeItemWidth");
  if (v6 != 0.0)
  {
    -[RTIBarButtonGroup representativeItemWidth](self, "representativeItemWidth");
    objc_msgSend(v3, "appendFormat:", CFSTR("; trailingBarButtonGroupWidths = %f"), v7);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RTIBarButtonGroup *v4;
  RTIBarButtonGroup *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  float v13;
  float v14;
  float v15;

  v4 = (RTIBarButtonGroup *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTIBarButtonGroup itemWidths](self, "itemWidths");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIBarButtonGroup itemWidths](v5, "itemWidths");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[RTIBarButtonGroup itemWidths](self, "itemWidths");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIBarButtonGroup itemWidths](v5, "itemWidths");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
        {
          v12 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      -[RTIBarButtonGroup representativeItemWidth](self, "representativeItemWidth");
      v14 = v13;
      -[RTIBarButtonGroup representativeItemWidth](v5, "representativeItemWidth");
      v12 = v14 == v15;
      goto LABEL_10;
    }
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (NSArray)itemWidths
{
  return self->_itemWidths;
}

- (void)setItemWidths:(id)a3
{
  objc_storeStrong((id *)&self->_itemWidths, a3);
}

- (float)representativeItemWidth
{
  return self->_representativeItemWidth;
}

- (void)setRepresentativeItemWidth:(float)a3
{
  self->_representativeItemWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemWidths, 0);
}

@end
