@implementation SBSwitcherShelf

- (SBSwitcherShelf)initWithBundleIdentifier:(id)a3 layoutRole:(int64_t)a4 displayMode:(unint64_t)a5
{
  id v9;
  SBSwitcherShelf *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSString *uniqueIdentifier;
  void *v16;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSwitcherShelf;
  v10 = -[SBSwitcherShelf init](&v17, sel_init);
  if (v10)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBSwitcherShelf.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    }
    v11 = objc_msgSend(v9, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    v10->_layoutRole = a4;
    v10->_displayMode = a5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld-%ld"), v10->_bundleIdentifier, a4, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v13;

  }
  return v10;
}

- (unint64_t)switcherLayoutElementType
{
  return 7;
}

- (BOOL)isEqual:(id)a3
{
  SBSwitcherShelf *v4;
  NSString *uniqueIdentifier;
  void *v6;
  char v7;

  v4 = (SBSwitcherShelf *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      -[SBSwitcherShelf uniqueIdentifier](v4, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](uniqueIdentifier, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueIdentifier, "hash");
}

- (NSString)description
{
  return (NSString *)-[SBSwitcherShelf descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherShelf succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  const __CFString *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherShelf bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("bundleIdentifier"));

  -[SBSwitcherShelf uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("uniqueIdentifier"));

  SBLayoutRoleDescription(-[SBSwitcherShelf layoutRole](self, "layoutRole"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("layoutRole"));

  if (-[SBSwitcherShelf displayMode](self, "displayMode"))
    v10 = CFSTR("scenes");
  else
    v10 = CFSTR("spaces");
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("displayMode"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherShelf descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
