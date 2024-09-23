@implementation TIKeyboardLayoutState

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int64_t v26;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TIKeyboardLayoutState inputMode](self, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMode");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[TIKeyboardLayoutState inputMode](self, "inputMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_15;
    }
    v13 = -[TIKeyboardLayoutState hasCandidateKey](self, "hasCandidateKey");
    if (v13 != objc_msgSend(v5, "hasCandidateKey"))
      goto LABEL_15;
    v14 = -[TIKeyboardLayoutState hasAccentKey](self, "hasAccentKey");
    if (v14 != objc_msgSend(v5, "hasAccentKey"))
      goto LABEL_15;
    v15 = -[TIKeyboardLayoutState canMultitap](self, "canMultitap");
    if (v15 != objc_msgSend(v5, "canMultitap"))
      goto LABEL_15;
    v16 = -[TIKeyboardLayoutState isAlphabeticPlane](self, "isAlphabeticPlane");
    if (v16 != objc_msgSend(v5, "isAlphabeticPlane"))
      goto LABEL_15;
    v17 = -[TIKeyboardLayoutState isKanaPlane](self, "isKanaPlane");
    if (v17 != objc_msgSend(v5, "isKanaPlane"))
      goto LABEL_15;
    v18 = -[TIKeyboardLayoutState diacriticForwardCompose](self, "diacriticForwardCompose");
    if (v18 != objc_msgSend(v5, "diacriticForwardCompose"))
      goto LABEL_15;
    -[TIKeyboardLayoutState layoutTag](self, "layoutTag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutTag");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[TIKeyboardLayoutState layoutTag](self, "layoutTag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutTag");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v24)
      {
LABEL_15:
        v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v26 = -[TIKeyboardLayoutState userInterfaceIdiom](self, "userInterfaceIdiom");
    v12 = v26 == objc_msgSend(v5, "userInterfaceIdiom");
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSString)softwareLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[TIKeyboardLayoutState inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetComponentsFromIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sw"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (BOOL)hasCandidateKey
{
  return self->_hasCandidateKey;
}

- (NSString)layoutTag
{
  return self->_layoutTag;
}

- (BOOL)isKanaPlane
{
  return self->_isKanaPlane;
}

- (BOOL)isAlphabeticPlane
{
  return self->_isAlphabeticPlane;
}

- (BOOL)hasAccentKey
{
  return self->_hasAccentKey;
}

- (BOOL)diacriticForwardCompose
{
  return self->_diacriticForwardCompose;
}

- (BOOL)canMultitap
{
  return self->_canMultitap;
}

- (TIKeyboardLayoutState)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardLayoutState *v5;
  uint64_t v6;
  NSString *inputMode;
  uint64_t v8;
  NSString *layoutTag;
  TIKeyboardLayoutState *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardLayoutState;
  v5 = -[TIKeyboardLayoutState init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputMode"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v6;

    v5->_hasCandidateKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCandidateKey"));
    v5->_hasAccentKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAccentKey"));
    v5->_canMultitap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canMultitap"));
    v5->_isAlphabeticPlane = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAlphabeticPlane"));
    v5->_isKanaPlane = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isKanaPlane"));
    v5->_diacriticForwardCompose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("diacriticForwardCompose"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutTag"));
    v8 = objc_claimAutoreleasedReturnValue();
    layoutTag = v5->_layoutTag;
    v5->_layoutTag = (NSString *)v8;

    v5->_userInterfaceIdiom = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("userInterfaceIdiom"));
    v10 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardLayoutState *v5;
  uint64_t v6;
  NSString *inputMode;
  uint64_t v8;
  NSString *layoutTag;

  v5 = objc_alloc_init(TIKeyboardLayoutState);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_inputMode, "copyWithZone:", a3);
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v6;

    v5->_hasCandidateKey = self->_hasCandidateKey;
    v5->_hasAccentKey = self->_hasAccentKey;
    v5->_canMultitap = self->_canMultitap;
    v5->_isAlphabeticPlane = self->_isAlphabeticPlane;
    v5->_isKanaPlane = self->_isKanaPlane;
    v5->_diacriticForwardCompose = self->_diacriticForwardCompose;
    v8 = -[NSString copyWithZone:](self->_layoutTag, "copyWithZone:", a3);
    layoutTag = v5->_layoutTag;
    v5->_layoutTag = (NSString *)v8;

    v5->_userInterfaceIdiom = self->_userInterfaceIdiom;
  }
  return v5;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (void)setLayoutTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIsKanaPlane:(BOOL)a3
{
  self->_isKanaPlane = a3;
}

- (void)setIsAlphabeticPlane:(BOOL)a3
{
  self->_isAlphabeticPlane = a3;
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasCandidateKey:(BOOL)a3
{
  self->_hasCandidateKey = a3;
}

- (void)setHasAccentKey:(BOOL)a3
{
  self->_hasAccentKey = a3;
}

- (void)setDiacriticForwardCompose:(BOOL)a3
{
  self->_diacriticForwardCompose = a3;
}

- (void)setCanMultitap:(BOOL)a3
{
  self->_canMultitap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutTag, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *inputMode;
  NSString *layoutTag;
  int64_t userInterfaceIdiom;
  id v8;

  v4 = a3;
  inputMode = self->_inputMode;
  v8 = v4;
  if (inputMode)
  {
    objc_msgSend(v4, "encodeObject:forKey:", inputMode, CFSTR("inputMode"));
    v4 = v8;
  }
  if (self->_hasCandidateKey)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("hasCandidateKey"));
    v4 = v8;
  }
  if (self->_hasAccentKey)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("hasAccentKey"));
    v4 = v8;
  }
  if (self->_canMultitap)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("canMultitap"));
    v4 = v8;
  }
  if (self->_isAlphabeticPlane)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("isAlphabeticPlane"));
    v4 = v8;
  }
  if (self->_isKanaPlane)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("isKanaPlane"));
    v4 = v8;
  }
  if (self->_diacriticForwardCompose)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("diacriticForwardCompose"));
    v4 = v8;
  }
  layoutTag = self->_layoutTag;
  if (layoutTag)
  {
    objc_msgSend(v8, "encodeObject:forKey:", layoutTag, CFSTR("layoutTag"));
    v4 = v8;
  }
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom)
  {
    objc_msgSend(v8, "encodeInt:forKey:", userInterfaceIdiom, CFSTR("userInterfaceIdiom"));
    v4 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TIKeyboardLayoutState inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputMode = %@"), v4);

  if (-[TIKeyboardLayoutState hasCandidateKey](self, "hasCandidateKey"))
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; hasCandidateKey = %s"), v5);
  if (-[TIKeyboardLayoutState hasAccentKey](self, "hasAccentKey"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; hasAccentKey = %s"), v6);
  if (-[TIKeyboardLayoutState canMultitap](self, "canMultitap"))
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; canMultitap = %s"), v7);
  if (-[TIKeyboardLayoutState isAlphabeticPlane](self, "isAlphabeticPlane"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; isAlphabeticPlane = %s"), v8);
  if (-[TIKeyboardLayoutState isKanaPlane](self, "isKanaPlane"))
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; isKanaPlane = %s"), v9);
  if (-[TIKeyboardLayoutState diacriticForwardCompose](self, "diacriticForwardCompose"))
    v10 = "YES";
  else
    v10 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; diacriticForwardCompose = %s"), v10);
  -[TIKeyboardLayoutState layoutTag](self, "layoutTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TIKeyboardLayoutState layoutTag](self, "layoutTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; layoutTag = %@"), v12);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  unint64_t v13;

  if (-[TIKeyboardLayoutState hasCandidateKey](self, "hasCandidateKey"))
    v3 = 2;
  else
    v3 = 0;
  v4 = v3 | -[TIKeyboardLayoutState hasAccentKey](self, "hasAccentKey");
  if (-[TIKeyboardLayoutState canMultitap](self, "canMultitap"))
    v5 = 2;
  else
    v5 = 0;
  v6 = v5 | (4 * v4) | -[TIKeyboardLayoutState isAlphabeticPlane](self, "isAlphabeticPlane");
  if (-[TIKeyboardLayoutState isKanaPlane](self, "isKanaPlane"))
    v7 = 2;
  else
    v7 = 0;
  v8 = v7 | (4 * v6) | -[TIKeyboardLayoutState diacriticForwardCompose](self, "diacriticForwardCompose");
  v9 = 257 * (-[TIKeyboardLayoutState userInterfaceIdiom](self, "userInterfaceIdiom") & 3 | (4 * v8));
  -[TIKeyboardLayoutState inputMode](self, "inputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 + objc_msgSend(v10, "hash");

  -[TIKeyboardLayoutState layoutTag](self, "layoutTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 257 * v11 + objc_msgSend(v12, "hash");

  return v13;
}

- (NSString)hardwareLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[TIKeyboardLayoutState inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetComponentsFromIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hw"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
