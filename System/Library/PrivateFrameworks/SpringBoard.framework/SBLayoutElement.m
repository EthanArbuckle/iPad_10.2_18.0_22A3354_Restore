@implementation SBLayoutElement

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (id)workspaceEntity
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[SBLayoutElement entityGenerator](self, "entityGenerator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutRole:", -[SBLayoutElement layoutRole](self, "layoutRole"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)entityGenerator
{
  return self->_entityGenerator;
}

+ (SBLayoutElement)elementWithDescriptor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "elementWithDescriptor:layoutRole:", v4, objc_msgSend(v4, "layoutRole"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLayoutElement *)v5;
}

+ (SBLayoutElement)elementWithDescriptor:(id)a3 layoutRole:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "supportedLayoutRoles");
  v10 = objc_msgSend(v6, "layoutAttributes");
  v11 = objc_msgSend(v6, "viewControllerClass");
  objc_msgSend(v6, "entityGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v7, "initWithIdentifier:layoutRole:supportedLayoutRoles:layoutAttributes:viewControllerClass:entityGenerator:", v8, a4, v9, v10, v11, v12);
  return (SBLayoutElement *)v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLayoutElement uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = (id)objc_msgSend(v3, "appendInteger:", -[SBLayoutElement layoutRole](self, "layoutRole"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutElement supportedLayoutRoles](self, "supportedLayoutRoles"));
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutElement layoutAttributes](self, "layoutAttributes"));
  NSStringFromClass(-[SBLayoutElement viewControllerClass](self, "viewControllerClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  v11 = objc_msgSend(v3, "hash");
  return v11;
}

- (BOOL)hasLayoutAttributes:(unint64_t)a3
{
  return (a3 & ~-[SBLayoutElement layoutAttributes](self, "layoutAttributes")) == 0;
}

- (unint64_t)layoutAttributes
{
  return self->_layoutAttributes;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (unint64_t)supportedLayoutRoles
{
  return self->_supportedLayoutRoles;
}

- (SBLayoutElement)initWithIdentifier:(id)a3 layoutRole:(int64_t)a4 supportedLayoutRoles:(unint64_t)a5 layoutAttributes:(unint64_t)a6 viewControllerClass:(Class)a7 entityGenerator:(id)a8
{
  id v14;
  id v15;
  SBLayoutElement *v16;
  uint64_t v17;
  NSString *uniqueIdentifier;
  uint64_t v19;
  id entityGenerator;
  objc_super v22;

  v14 = a3;
  v15 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SBLayoutElement;
  v16 = -[SBLayoutElement init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v17;

    v16->_layoutRole = a4;
    v16->_supportedLayoutRoles = a5;
    v16->_layoutAttributes = a6;
    v16->_viewControllerClass = a7;
    v19 = objc_msgSend(v15, "copy");
    entityGenerator = v16->_entityGenerator;
    v16->_entityGenerator = (id)v19;

  }
  return v16;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entityGenerator, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLayoutElement uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("uniqueIdentifier"));

  SBLayoutRoleDescription(-[SBLayoutElement layoutRole](self, "layoutRole"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("layoutRole"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLayoutElement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBLayoutElement *v11;

  v4 = a3;
  -[SBLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SBLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __57__SBLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  SBLayoutRoleMaskDescription(objc_msgSend(*(id *)(a1 + 40), "supportedLayoutRoles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("supportedLayoutRoles"));

  v5 = *(void **)(a1 + 32);
  SBLayoutAttributesDescription(objc_msgSend(*(id *)(a1 + 40), "layoutAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("layoutAttributes"));

  v8 = *(void **)(a1 + 32);
  NSStringFromClass((Class)objc_msgSend(*(id *)(a1 + 40), "viewControllerClass"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "appendObject:withName:", v10, CFSTR("viewControllerClass"));

}

- (BOOL)supportsLayoutRole:(int64_t)a3
{
  return SBLayoutRoleMaskContainsRole(-[SBLayoutElement supportedLayoutRoles](self, "supportedLayoutRoles"), a3);
}

- (BOOL)representsSameLayoutElementAsDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBLayoutElement uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[NSString copy](self->_uniqueIdentifier, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = self->_layoutRole;
    v4[3] = self->_supportedLayoutRoles;
    v4[4] = self->_layoutAttributes;
    v4[5] = self->_viewControllerClass;
    v7 = objc_msgSend(self->_entityGenerator, "copy");
    v8 = (void *)v4[6];
    v4[6] = v7;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBLayoutElement *v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  objc_class *v10;
  BOOL v11;

  v4 = (SBLayoutElement *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SBLayoutElement uniqueIdentifier](self, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLayoutElement uniqueIdentifier](v4, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6)
        && (v7 = -[SBLayoutElement layoutRole](self, "layoutRole"), v7 == -[SBLayoutElement layoutRole](v4, "layoutRole"))&& (v8 = -[SBLayoutElement supportedLayoutRoles](self, "supportedLayoutRoles"), v8 == -[SBLayoutElement supportedLayoutRoles](v4, "supportedLayoutRoles"))&& (v9 = -[SBLayoutElement layoutAttributes](self, "layoutAttributes"), v9 == -[SBLayoutElement layoutAttributes](v4, "layoutAttributes")))
      {
        v10 = -[SBLayoutElement viewControllerClass](self, "viewControllerClass");
        v11 = v10 == -[SBLayoutElement viewControllerClass](v4, "viewControllerClass");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)-[SBLayoutElement descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)setEntityGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
