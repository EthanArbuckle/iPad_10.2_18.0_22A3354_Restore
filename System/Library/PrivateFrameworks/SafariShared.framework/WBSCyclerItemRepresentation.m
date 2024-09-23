@implementation WBSCyclerItemRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerItemRepresentation)init
{

  return 0;
}

- (WBSCyclerItemRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  WBSCyclerItemRepresentation *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *uniqueIdentifier;
  WBSCyclerItemRepresentation *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSCyclerItemRepresentation;
  v8 = -[WBSCyclerItemRepresentation init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WBSCyclerItemRepresentation)initWithTitle:(id)a3 symbolImageName:(id)a4 uniqueIdentifier:(id)a5
{
  id v9;
  WBSCyclerItemRepresentation *v10;
  WBSCyclerItemRepresentation *v11;
  WBSCyclerItemRepresentation *v12;

  v9 = a4;
  v10 = -[WBSCyclerItemRepresentation initWithTitle:uniqueIdentifier:](self, "initWithTitle:uniqueIdentifier:", a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_symbolImageName, a4);
    v12 = v11;
  }

  return v11;
}

- (WBSCyclerItemRepresentation)initWithCoder:(id)a3
{
  id v4;
  WBSCyclerItemRepresentation *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *extraAttributes;
  WBSCyclerItemRepresentation *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WBSCyclerItemRepresentation;
  v5 = -[WBSCyclerItemRepresentation init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("ExtraAttributes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");
    extraAttributes = v5->_extraAttributes;
    v5->_extraAttributes = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("Title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("UniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extraAttributes, CFSTR("ExtraAttributes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isEquivalent:(id)a3
{
  NSString *title;

  title = self->_title;
  return title == *((NSString **)a3 + 2) || -[NSString isEqualToString:](title, "isEqualToString:");
}

- (id)pairsOfItemsWithDifferingExtraAttributesComparedTo:(id)a3
{
  _QWORD *v4;
  NSDictionary *extraAttributes;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_extraAttributes)
    extraAttributes = self->_extraAttributes;
  else
    extraAttributes = (NSDictionary *)MEMORY[0x1E0C9AA70];
  if (v4[3])
    v6 = v4[3];
  else
    v6 = MEMORY[0x1E0C9AA70];
  if ((-[NSDictionary isEqual:](extraAttributes, "isEqual:", v6) & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", self, v4);
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setExtraAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
