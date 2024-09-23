@implementation SBHIconGridPath

- (SBHIconGridPath)initWithFolderIdentifier:(id)a3 listIdentifier:(id)a4 gridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v10;
  id v11;
  SBHIconGridPath *v12;
  uint64_t v13;
  NSString *folderIdentifier;
  uint64_t v15;
  NSString *listIdentifier;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBHIconGridPath;
  v12 = -[SBHIconGridPath init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    folderIdentifier = v12->_folderIdentifier;
    v12->_folderIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    listIdentifier = v12->_listIdentifier;
    v12->_listIdentifier = (NSString *)v15;

    v12->_gridCellIndex = a5;
    v12->_gridCellInfoOptions = a6;
  }

  return v12;
}

- (SBHIconGridPath)iconGridPathWithListIdentifier:(id)a3 gridCellIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  -[SBHIconGridPath folderIdentifier](self, "folderIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v8, v6, a4, -[SBHIconGridPath gridCellInfoOptions](self, "gridCellInfoOptions"));

  return (SBHIconGridPath *)v9;
}

- (SBHIconGridPath)iconGridPathWithGridCellIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  -[SBHIconGridPath folderIdentifier](self, "folderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridPath listIdentifier](self, "listIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v6, v7, a3, -[SBHIconGridPath gridCellInfoOptions](self, "gridCellInfoOptions"));

  return (SBHIconGridPath *)v8;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gridCellIndex, CFSTR("gridCellIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gridCellInfoOptions, CFSTR("gridCellInfoOptions"));

}

- (SBHIconGridPath)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  SBHIconGridPath *v11;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("folderIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("listIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gridCellIndex"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gridCellInfoOptions"));

  v11 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:](self, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v6, v8, v9, v10);
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_folderIdentifier, "hash");
  return -[NSString hash](self->_listIdentifier, "hash") + v3 + self->_gridCellIndex + self->_gridCellInfoOptions;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconGridPath *v4;
  void *v5;
  char isKindOfClass;
  SBHIconGridPath *v7;
  BOOL v8;

  v4 = (SBHIconGridPath *)a3;
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
        && self->_gridCellIndex == v7->_gridCellIndex
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
  return (NSString *)-[SBHIconGridPath descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconGridPath succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHIconGridPath descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  void *v8;

  -[SBHIconGridPath succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridPath folderIdentifier](self, "folderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("folderIdentifier"));

  -[SBHIconGridPath listIdentifier](self, "listIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("listIdentifier"));

  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconGridPath gridCellIndex](self, "gridCellIndex"), CFSTR("gridCellIndex"));
  SBHStringForGridCellInfoOptions(-[SBHIconGridPath gridCellInfoOptions](self, "gridCellInfoOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("gridCellInfoOptions"));

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

- (unint64_t)gridCellIndex
{
  return self->_gridCellIndex;
}

- (unint64_t)gridCellInfoOptions
{
  return self->_gridCellInfoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_folderIdentifier, 0);
}

@end
