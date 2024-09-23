@implementation TUConversationActivitySceneAssociationBehavior

+ (TUConversationActivitySceneAssociationBehavior)defaultBehavior
{
  return -[TUConversationActivitySceneAssociationBehavior initWithTargetContentIdentifier:shouldAssociateScene:preferredSceneSessionRole:]([TUConversationActivitySceneAssociationBehavior alloc], "initWithTargetContentIdentifier:shouldAssociateScene:preferredSceneSessionRole:", 0, 1, 0);
}

- (TUConversationActivitySceneAssociationBehavior)initWithTargetContentIdentifier:(id)a3 shouldAssociateScene:(BOOL)a4 preferredSceneSessionRole:(id)a5
{
  id v8;
  id v9;
  TUConversationActivitySceneAssociationBehavior *v10;
  uint64_t v11;
  NSString *targetContentIdentifier;
  uint64_t v13;
  NSString *preferredSceneSessionRole;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUConversationActivitySceneAssociationBehavior;
  v10 = -[TUConversationActivitySceneAssociationBehavior init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    targetContentIdentifier = v10->_targetContentIdentifier;
    v10->_targetContentIdentifier = (NSString *)v11;

    v10->_shouldAssociateScene = a4;
    v13 = objc_msgSend(v9, "copy");
    preferredSceneSessionRole = v10->_preferredSceneSessionRole;
    v10->_preferredSceneSessionRole = (NSString *)v13;

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySceneAssociationBehavior targetContentIdentifier](self, "targetContentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" targetContentIdentifier=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldAssociateScene=%d"), -[TUConversationActivitySceneAssociationBehavior shouldAssociateScene](self, "shouldAssociateScene"));
  -[TUConversationActivitySceneAssociationBehavior preferredSceneSessionRole](self, "preferredSceneSessionRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" preferredSceneSessionRole=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationActivitySceneAssociationBehavior isEquivalentToSceneAssociationBehavior:](self, "isEquivalentToSceneAssociationBehavior:", v4);

  return v5;
}

- (BOOL)isEquivalentToSceneAssociationBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[TUConversationActivitySceneAssociationBehavior targetContentIdentifier](self, "targetContentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6)
    && (v7 = -[TUConversationActivitySceneAssociationBehavior shouldAssociateScene](self, "shouldAssociateScene"),
        v7 == objc_msgSend(v4, "shouldAssociateScene")))
  {
    -[TUConversationActivitySceneAssociationBehavior preferredSceneSessionRole](self, "preferredSceneSessionRole");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredSceneSessionRole");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[TUConversationActivitySceneAssociationBehavior targetContentIdentifier](self, "targetContentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  if (-[TUConversationActivitySceneAssociationBehavior shouldAssociateScene](self, "shouldAssociateScene"))
    v5 = 1231;
  else
    v5 = 1237;
  -[TUConversationActivitySceneAssociationBehavior preferredSceneSessionRole](self, "preferredSceneSessionRole");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v4 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivitySceneAssociationBehavior targetContentIdentifier](self, "targetContentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUConversationActivitySceneAssociationBehavior shouldAssociateScene](self, "shouldAssociateScene");
  -[TUConversationActivitySceneAssociationBehavior preferredSceneSessionRole](self, "preferredSceneSessionRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithTargetContentIdentifier:shouldAssociateScene:preferredSceneSessionRole:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivitySceneAssociationBehavior)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  TUConversationActivitySceneAssociationBehavior *v13;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_targetContentIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_shouldAssociateScene);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", v8);

  v10 = objc_opt_class();
  NSStringFromSelector(sel_preferredSceneSessionRole);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[TUConversationActivitySceneAssociationBehavior initWithTargetContentIdentifier:shouldAssociateScene:preferredSceneSessionRole:](self, "initWithTargetContentIdentifier:shouldAssociateScene:preferredSceneSessionRole:", v7, v9, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TUConversationActivitySceneAssociationBehavior targetContentIdentifier](self, "targetContentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_targetContentIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[TUConversationActivitySceneAssociationBehavior shouldAssociateScene](self, "shouldAssociateScene");
  NSStringFromSelector(sel_shouldAssociateScene);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  -[TUConversationActivitySceneAssociationBehavior preferredSceneSessionRole](self, "preferredSceneSessionRole");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_preferredSceneSessionRole);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (BOOL)shouldAssociateScene
{
  return self->_shouldAssociateScene;
}

- (NSString)preferredSceneSessionRole
{
  return self->_preferredSceneSessionRole;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSceneSessionRole, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
}

@end
