@implementation UIDraggingSystemSessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDraggingSystemSessionInfo)initWithCoder:(id)a3
{
  id v4;
  UIDraggingSystemSessionInfo *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  NSString *persistentSceneIdentifier;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIDraggingSystemSessionInfo;
  v5 = -[UIDraggingSystemSessionInfo init](&v13, sel_init);
  if (v5)
  {
    v5->_sessionIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sessionIdentifier"));
    v5->_processIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("processIdentifier"));
    v5->_supportsSystemDrag = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSystemDrag"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v6, "getValue:size:", &v11, 32);
    v7 = v12;
    *(_OWORD *)v5->_auditToken.val = v11;
    *(_OWORD *)&v5->_auditToken.val[4] = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentSceneIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    persistentSceneIdentifier = v5->_persistentSceneIdentifier;
    v5->_persistentSceneIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sessionIdentifier;
  id v5;
  id v6;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_processIdentifier, CFSTR("processIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsSystemDrag, CFSTR("supportsSystemDrag"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &self->_auditToken, "{?=[8I]}");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("auditToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistentSceneIdentifier, CFSTR("persistentSceneIdentifier"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: sessionIdentifier=%i processIdentifier=%i supportsSystemDrag=%d sceneIdentifier=%@>"), objc_opt_class(), self, self->_sessionIdentifier, self->_processIdentifier, self->_supportsSystemDrag, self->_persistentSceneIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[UIDraggingSystemSessionInfo sessionIdentifier](self, "sessionIdentifier");
    v7 = objc_msgSend(v5, "sessionIdentifier");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_sessionIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSessionIdentifier:", -[UIDraggingSystemSessionInfo sessionIdentifier](self, "sessionIdentifier"));
  objc_msgSend(v4, "setProcessIdentifier:", -[UIDraggingSystemSessionInfo processIdentifier](self, "processIdentifier"));
  objc_msgSend(v4, "setSupportsSystemDrag:", -[UIDraggingSystemSessionInfo supportsSystemDrag](self, "supportsSystemDrag"));
  return v4;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (BOOL)supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (void)setSupportsSystemDrag:(BOOL)a3
{
  self->_supportsSystemDrag = a3;
}

- (NSString)persistentSceneIdentifier
{
  return self->_persistentSceneIdentifier;
}

- (void)setPersistentSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentSceneIdentifier, 0);
}

@end
