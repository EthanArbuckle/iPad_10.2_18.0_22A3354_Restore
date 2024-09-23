@implementation SBHIconRelativePath

- (SBHIconRelativePath)initWithFolderIdentifier:(id)a3 listIdentifier:(id)a4 priorIconIdentifiers:(id)a5 subsequentIconIdentifiers:(id)a6 gridCellInfoOptions:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBHIconRelativePath *v16;
  uint64_t v17;
  NSString *folderIdentifier;
  uint64_t v19;
  NSString *listIdentifier;
  uint64_t v21;
  NSArray *priorIconIdentifiers;
  uint64_t v23;
  NSArray *subsequentIconIdentifiers;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SBHIconRelativePath;
  v16 = -[SBHIconRelativePath init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    folderIdentifier = v16->_folderIdentifier;
    v16->_folderIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    listIdentifier = v16->_listIdentifier;
    v16->_listIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    priorIconIdentifiers = v16->_priorIconIdentifiers;
    v16->_priorIconIdentifiers = (NSArray *)v21;

    v23 = objc_msgSend(v15, "copy");
    subsequentIconIdentifiers = v16->_subsequentIconIdentifiers;
    v16->_subsequentIconIdentifiers = (NSArray *)v23;

    v16->_gridCellInfoOptions = a7;
  }

  return v16;
}

- (SBHIconRelativePath)iconRelativePathWithFolderIdentifier:(id)a3 listIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFolderIdentifier:listIdentifier:priorIconIdentifiers:subsequentIconIdentifiers:gridCellInfoOptions:", v7, v6, self->_priorIconIdentifiers, self->_subsequentIconIdentifiers, self->_gridCellInfoOptions);

  return (SBHIconRelativePath *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *folderIdentifier;
  id v5;

  folderIdentifier = self->_folderIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", folderIdentifier, CFSTR("folderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_listIdentifier, CFSTR("listIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_priorIconIdentifiers, CFSTR("priorIconIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subsequentIconIdentifiers, CFSTR("subsequentIconIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gridCellInfoOptions, CFSTR("gridCellInfoOptions"));

}

- (SBHIconRelativePath)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBHIconRelativePath *v14;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("folderIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("listIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v9, CFSTR("priorIconIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v11, CFSTR("subsequentIconIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gridCellInfoOptions"));
  v14 = -[SBHIconRelativePath initWithFolderIdentifier:listIdentifier:priorIconIdentifiers:subsequentIconIdentifiers:gridCellInfoOptions:](self, "initWithFolderIdentifier:listIdentifier:priorIconIdentifiers:subsequentIconIdentifiers:gridCellInfoOptions:", v6, v8, v10, v12, v13);

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_folderIdentifier, "hash");
  v4 = -[NSString hash](self->_listIdentifier, "hash") + v3;
  v5 = -[NSArray hash](self->_priorIconIdentifiers, "hash");
  return v4 + v5 + -[NSArray hash](self->_subsequentIconIdentifiers, "hash") + self->_gridCellInfoOptions;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconRelativePath *v4;
  void *v5;
  char isKindOfClass;
  SBHIconRelativePath *v7;
  BOOL v8;

  v4 = (SBHIconRelativePath *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = BSEqualStrings()
        && BSEqualStrings()
        && BSEqualArrays()
        && BSEqualArrays()
        && self->_gridCellInfoOptions == v7->_gridCellInfoOptions;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)-[SBHIconRelativePath descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconRelativePath succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIconRelativePath descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBHIconRelativePath succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconRelativePath folderIdentifier](self, "folderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("folderIdentifier"));

  -[SBHIconRelativePath listIdentifier](self, "listIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("listIdentifier"));

  -[SBHIconRelativePath priorIconIdentifiers](self, "priorIconIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("priorIconIdentifiers"));

  -[SBHIconRelativePath subsequentIconIdentifiers](self, "subsequentIconIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("subsequentIconIdentifiers"));

  v11 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBHIconRelativePath gridCellInfoOptions](self, "gridCellInfoOptions"), CFSTR("gridCellInfoOptions"), 1);
  return v4;
}

- (NSString)folderIdentifier
{
  return self->_folderIdentifier;
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (NSArray)priorIconIdentifiers
{
  return self->_priorIconIdentifiers;
}

- (NSArray)subsequentIconIdentifiers
{
  return self->_subsequentIconIdentifiers;
}

- (unint64_t)gridCellInfoOptions
{
  return self->_gridCellInfoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsequentIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_priorIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_folderIdentifier, 0);
}

@end
