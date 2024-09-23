@implementation UIKBArbiterClientFocusContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  if (-[UIKBArbiterClientFocusContext contextID](self, "contextID"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; contextID = %x"),
      -[UIKBArbiterClientFocusContext contextID](self, "contextID"));
  -[UIKBArbiterClientFocusContext sceneIdentity](self, "sceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBArbiterClientFocusContext sceneIdentity](self, "sceneIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; sceneIdentity = %@"), v5);

  }
  -[UIKBArbiterClientFocusContext layeringSceneIdentity](self, "layeringSceneIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBArbiterClientFocusContext layeringSceneIdentity](self, "layeringSceneIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; layeringSceneIdentity = %@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(" >"));
  return v3;
}

- (FBSSceneIdentityToken)sceneIdentity
{
  return self->_sceneIdentity;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (FBSSceneIdentityToken)layeringSceneIdentity
{
  return self->_layeringSceneIdentity;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)focusContextForSceneIdentity:(id)a3 window:(id)a4
{
  id v5;
  id v6;
  UIKBArbiterClientFocusContext *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(UIKBArbiterClientFocusContext);
  -[UIKBArbiterClientFocusContext setSceneIdentity:](v7, "setSceneIdentity:", v6);

  if (v5)
    v8 = objc_msgSend(v5, "_contextId");
  else
    v8 = 0;
  -[UIKBArbiterClientFocusContext setContextID:](v7, "setContextID:", v8);
  objc_msgSend(v5, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "responder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_layeringSceneIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBArbiterClientFocusContext setLayeringSceneIdentity:](v7, "setLayeringSceneIdentity:", v12);

  }
  return v7;
}

- (void)setSceneIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentity, a3);
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (void)setLayeringSceneIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_layeringSceneIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layeringSceneIdentity, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
}

- (UIKBArbiterClientFocusContext)initWithCoder:(id)a3
{
  id v4;
  UIKBArbiterClientFocusContext *v5;
  uint64_t v6;
  FBSSceneIdentityToken *sceneIdentity;
  uint64_t v8;
  FBSSceneIdentityToken *layeringSceneIdentity;
  objc_super v11;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v11.receiver = self;
  v11.super_class = (Class)UIKBArbiterClientFocusContext;
  v5 = -[UIKBArbiterClientFocusContext init](&v11, sel_init);
  if (v5)
  {
    v5->_contextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ctxId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneId"));
    v6 = objc_claimAutoreleasedReturnValue();
    sceneIdentity = v5->_sceneIdentity;
    v5->_sceneIdentity = (FBSSceneIdentityToken *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layeringSceneId"));
    v8 = objc_claimAutoreleasedReturnValue();
    layeringSceneIdentity = v5->_layeringSceneIdentity;
    v5->_layeringSceneIdentity = (FBSSceneIdentityToken *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contextID;
  FBSSceneIdentityToken *sceneIdentity;
  void *v6;
  FBSSceneIdentityToken *layeringSceneIdentity;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  contextID = self->_contextID;
  if ((_DWORD)contextID)
    objc_msgSend(v8, "encodeInt32:forKey:", contextID, CFSTR("ctxId"));
  sceneIdentity = self->_sceneIdentity;
  v6 = v8;
  if (sceneIdentity)
  {
    objc_msgSend(v8, "encodeObject:forKey:", sceneIdentity, CFSTR("sceneId"));
    v6 = v8;
  }
  layeringSceneIdentity = self->_layeringSceneIdentity;
  if (layeringSceneIdentity)
  {
    objc_msgSend(v8, "encodeObject:forKey:", layeringSceneIdentity, CFSTR("layeringSceneId"));
    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  UIKBArbiterClientFocusContext *v4;
  UIKBArbiterClientFocusContext *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (UIKBArbiterClientFocusContext *)a3;
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
      v6 = -[UIKBArbiterClientFocusContext contextID](self, "contextID");
      if (v6 == -[UIKBArbiterClientFocusContext contextID](v5, "contextID")
        && (-[UIKBArbiterClientFocusContext sceneIdentity](self, "sceneIdentity"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            -[UIKBArbiterClientFocusContext sceneIdentity](v5, "sceneIdentity"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v7, "isEqual:", v8),
            v8,
            v7,
            v9))
      {
        -[UIKBArbiterClientFocusContext layeringSceneIdentity](self, "layeringSceneIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBArbiterClientFocusContext layeringSceneIdentity](v5, "layeringSceneIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (id)focusContextForSceneIdentity:(id)a3 contextID:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  UIKBArbiterClientFocusContext *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(UIKBArbiterClientFocusContext);
  -[UIKBArbiterClientFocusContext setSceneIdentity:](v6, "setSceneIdentity:", v5);

  -[UIKBArbiterClientFocusContext setContextID:](v6, "setContextID:", v4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBArbiterClientFocusContext *v4;
  uint64_t v5;
  FBSSceneIdentityToken *sceneIdentity;
  uint64_t v7;
  FBSSceneIdentityToken *layeringSceneIdentity;

  v4 = -[UIKBArbiterClientFocusContext init](+[UIKBArbiterClientFocusContext allocWithZone:](UIKBArbiterClientFocusContext, "allocWithZone:", a3), "init");
  v4->_contextID = self->_contextID;
  v5 = -[FBSSceneIdentityToken copy](self->_sceneIdentity, "copy");
  sceneIdentity = v4->_sceneIdentity;
  v4->_sceneIdentity = (FBSSceneIdentityToken *)v5;

  v7 = -[FBSSceneIdentityToken copy](self->_layeringSceneIdentity, "copy");
  layeringSceneIdentity = v4->_layeringSceneIdentity;
  v4->_layeringSceneIdentity = (FBSSceneIdentityToken *)v7;

  return v4;
}

@end
