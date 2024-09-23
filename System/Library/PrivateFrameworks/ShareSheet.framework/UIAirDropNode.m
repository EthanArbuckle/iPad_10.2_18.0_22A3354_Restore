@implementation UIAirDropNode

+ (UIAirDropNode)nodeWithIdentifier:(id)a3 suggestionNode:(id)a4
{
  id v5;
  id v6;
  UIAirDropNode *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(UIAirDropNode);
  -[UIAirDropNode setIdentifier:](v7, "setIdentifier:", v6);

  -[UIAirDropNode setSuggestionNode:](v7, "setSuggestionNode:", v5);
  objc_msgSend(v5, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropNode setIsPlaceholder:](v7, "setIsPlaceholder:", objc_msgSend(v8, "isPlaceholder"));
  return v7;
}

+ (UIAirDropNode)nodeWithIdentifier:(id)a3 displayName:(id)a4 subtitle:(id)a5 avatarImageSlotID:(unsigned int)a6 transportImageSlotID:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  UIAirDropNode *v14;
  double v15;
  double v16;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(UIAirDropNode);
  -[UIAirDropNode setIdentifier:](v14, "setIdentifier:", v13);

  -[UIAirDropNode setDisplayName:](v14, "setDisplayName:", v12);
  -[UIAirDropNode setSubtitle:](v14, "setSubtitle:", v11);

  -[UIAirDropNode setAvatarImageSlotID:](v14, "setAvatarImageSlotID:", v8);
  -[UIAirDropNode setTransportImageSlotID:](v14, "setTransportImageSlotID:", v7);
  -[UIAirDropNode setMainLabelSlotID:](v14, "setMainLabelSlotID:", objc_msgSend(v12, "slotIdentifier"));
  objc_msgSend(v12, "slotTextHeight");
  v16 = v15;

  -[UIAirDropNode setMainLabelSlotHeight:](v14, "setMainLabelSlotHeight:", v16);
  return v14;
}

+ (UIAirDropNode)nodeWithIdentifier:(id)a3 peopleSuggestion:(id)a4
{
  id v5;
  id v6;
  UIAirDropNode *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(UIAirDropNode);
  -[UIAirDropNode setIdentifier:](v7, "setIdentifier:", v6);

  -[UIAirDropNode setPeopleSuggestion:](v7, "setPeopleSuggestion:", v5);
  return v7;
}

+ (id)TTRAirDropNode
{
  UIAirDropNode *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(UIAirDropNode);
  objc_msgSend(MEMORY[0x1E0D97458], "TTRPeopleSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  -[UIAirDropNode setIdentifier:](v2, "setIdentifier:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D97460]);
  objc_msgSend(v3, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithText:", v8);
  -[UIAirDropNode setDisplayName:](v2, "setDisplayName:", v9);

  -[UIAirDropNode setPeopleSuggestion:](v2, "setPeopleSuggestion:", v3);
  return v2;
}

- (BOOL)isTapToRadar
{
  void *v2;
  char v3;

  -[UIAirDropNode peopleSuggestion](self, "peopleSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTapToRadar");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAirDropNode)initWithCoder:(id)a3
{
  id v4;
  UIAirDropNode *v5;
  void *v6;
  uint64_t v7;
  SFProxyText *displayName;
  uint64_t v9;
  SFProxyText *subtitle;
  uint64_t v11;
  NSUUID *identifier;
  uint64_t v13;
  SFPeopleSuggestion *peopleSuggestion;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;

  v4 = a3;
  v5 = -[UIAirDropNode init](self, "init");
  if (v5)
  {
    -[UIAirDropNode setAvatarImageSlotID:](v5, "setAvatarImageSlotID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("avatarImageSlotID")));
    -[UIAirDropNode setTransportImageSlotID:](v5, "setTransportImageSlotID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("transportImageSlotID")));
    -[UIAirDropNode setMainLabelSlotID:](v5, "setMainLabelSlotID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mainLabelSlotID")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mainLabelSlotHeight"));
    -[UIAirDropNode setMainLabelSlotHeight:](v5, "setMainLabelSlotHeight:");
    -[UIAirDropNode setBottomLabelSlotID:](v5, "setBottomLabelSlotID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bottomLabelSlotID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionNodeReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropNode setSuggestionReason:](v5, "setSuggestionReason:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v7 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (SFProxyText *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v9 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (SFProxyText *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    v5->_isMagicHead = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMagicHead"));
    v5->_selectionReason = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("selectionReason"));
    v5->_hasSquareImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSquareImage"));
    v5->_isDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDisabled"));
    v5->_isRestricted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestricted"));
    v5->_isPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlaceholder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peopleSuggestion"));
    v13 = objc_claimAutoreleasedReturnValue();
    peopleSuggestion = v5->_peopleSuggestion;
    v5->_peopleSuggestion = (SFPeopleSuggestion *)v13;

    if (-[UIAirDropNode mainLabelSlotID](v5, "mainLabelSlotID"))
    {
      -[UIAirDropNode displayName](v5, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "slotIdentifier");

      if (!v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0D97460]);
        v18 = -[UIAirDropNode mainLabelSlotID](v5, "mainLabelSlotID");
        -[UIAirDropNode mainLabelSlotHeight](v5, "mainLabelSlotHeight");
        v19 = (void *)objc_msgSend(v17, "initWithSlotIdentifier:slotTextHeight:", v18);
        -[UIAirDropNode setDisplayName:](v5, "setDisplayName:", v19);

      }
    }
    if (-[UIAirDropNode bottomLabelSlotID](v5, "bottomLabelSlotID"))
    {
      -[UIAirDropNode subtitle](v5, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "slotIdentifier");

      if (!v21)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97460]), "initWithSlotIdentifier:", -[UIAirDropNode bottomLabelSlotID](v5, "bottomLabelSlotID"));
        -[UIAirDropNode setSubtitle:](v5, "setSubtitle:", v22);

      }
    }
    if (-[UIAirDropNode isRestricted](v5, "isRestricted"))
    {
      share_sheet_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[UIAirDropNode initWithCoder:].cold.1((uint64_t)v5, v23);

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode avatarImageSlotID](self, "avatarImageSlotID"), CFSTR("avatarImageSlotID"));
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode transportImageSlotID](self, "transportImageSlotID"), CFSTR("transportImageSlotID"));
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode mainLabelSlotID](self, "mainLabelSlotID"), CFSTR("mainLabelSlotID"));
  -[UIAirDropNode mainLabelSlotHeight](self, "mainLabelSlotHeight");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("mainLabelSlotHeight"));
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode bottomLabelSlotID](self, "bottomLabelSlotID"), CFSTR("bottomLabelSlotID"));
  -[UIAirDropNode suggestionNode](self, "suggestionNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("suggestionNodeReason"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isMagicHead, CFSTR("isMagicHead"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_selectionReason, CFSTR("selectionReason"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasSquareImage, CFSTR("hasSquareImage"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isDisabled, CFSTR("isDisabled"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isRestricted, CFSTR("isRestricted"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isPlaceholder, CFSTR("isPlaceholder"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_peopleSuggestion, CFSTR("peopleSuggestion"));

}

- (void)setAvatarImageSlotID:(unsigned int)a3
{
  atomic_store(a3, &self->_avatarImageSlotID);
}

- (unsigned)avatarImageSlotID
{
  return atomic_load(&self->_avatarImageSlotID);
}

- (void)setTransportImageSlotID:(unsigned int)a3
{
  atomic_store(a3, &self->_transportImageSlotID);
}

- (unsigned)transportImageSlotID
{
  return atomic_load(&self->_transportImageSlotID);
}

- (void)setMainLabelSlotID:(unsigned int)a3
{
  atomic_store(a3, &self->_mainLabelSlotID);
}

- (unsigned)mainLabelSlotID
{
  return atomic_load(&self->_mainLabelSlotID);
}

- (void)setMainLabelSlotHeight:(double)a3
{
  atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_mainLabelSlotHeight);
}

- (double)mainLabelSlotHeight
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->_mainLabelSlotHeight));
}

- (void)setBottomLabelSlotID:(unsigned int)a3
{
  atomic_store(a3, &self->_bottomLabelSlotID);
}

- (unsigned)bottomLabelSlotID
{
  return atomic_load(&self->_bottomLabelSlotID);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)UIAirDropNode;
  -[UIAirDropNode description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropNode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIAirDropNode avatarImageSlotID](self, "avatarImageSlotID");
  v7 = -[UIAirDropNode transportImageSlotID](self, "transportImageSlotID");
  v8 = -[UIAirDropNode mainLabelSlotID](self, "mainLabelSlotID");
  -[UIAirDropNode mainLabelSlotHeight](self, "mainLabelSlotHeight");
  if (self->_isDisabled)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_isRestricted)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_isPlaceholder)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: identifier:%@ avatarImageSlotID:%u, transportImageSlotID:%u, textSlotID:%u, textSlotHeight:%f, peopleSuggestion:%@, isDisabled:%@, isRestricted:%@ displayName:%@ subtitle:%@ isPlaceholder:%@"), v4, v5, v6, v7, v8, v9, self->_peopleSuggestion, v10, v11, self->_displayName, self->_subtitle, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isMagicHead)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(", isMagicHead:%@, selectionReason:%ld"), v14, self->_selectionReason);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(">"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[UIAirDropNode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  UIAirDropNode *v4;
  UIAirDropNode *v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  char v19;
  _BOOL4 v21;
  uint64_t v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;

  v4 = (UIAirDropNode *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[UIAirDropNode avatarImageSlotID](v5, "avatarImageSlotID");
      if (v6 != -[UIAirDropNode avatarImageSlotID](self, "avatarImageSlotID")
        || (v7 = -[UIAirDropNode mainLabelSlotID](v5, "mainLabelSlotID"),
            v7 != -[UIAirDropNode mainLabelSlotID](self, "mainLabelSlotID"))
        || (-[UIAirDropNode mainLabelSlotHeight](v5, "mainLabelSlotHeight"),
            v9 = v8,
            -[UIAirDropNode mainLabelSlotHeight](self, "mainLabelSlotHeight"),
            v9 != v10)
        || (v11 = -[UIAirDropNode bottomLabelSlotID](v5, "bottomLabelSlotID"),
            v11 != -[UIAirDropNode bottomLabelSlotID](self, "bottomLabelSlotID"))
        || (v12 = -[UIAirDropNode transportImageSlotID](v5, "transportImageSlotID"),
            v12 != -[UIAirDropNode transportImageSlotID](self, "transportImageSlotID")))
      {
        v19 = 0;
LABEL_15:

        goto LABEL_16;
      }
      -[UIAirDropNode identifier](v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAirDropNode identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          v19 = 0;
          v27 = v16;
          v28 = v15;
LABEL_26:

          goto LABEL_27;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
LABEL_24:
          v19 = 0;
LABEL_27:

          goto LABEL_15;
        }
      }
      v21 = -[UIAirDropNode isMagicHead](v5, "isMagicHead");
      if (v21 != -[UIAirDropNode isMagicHead](self, "isMagicHead"))
        goto LABEL_24;
      v22 = -[UIAirDropNode selectionReason](v5, "selectionReason");
      if (v22 != -[UIAirDropNode selectionReason](self, "selectionReason"))
        goto LABEL_24;
      v23 = -[UIAirDropNode hasSquareImage](v5, "hasSquareImage");
      if (v23 != -[UIAirDropNode hasSquareImage](self, "hasSquareImage"))
        goto LABEL_24;
      v24 = -[UIAirDropNode isDisabled](v5, "isDisabled");
      if (v24 != -[UIAirDropNode isDisabled](self, "isDisabled"))
        goto LABEL_24;
      v25 = -[UIAirDropNode isRestricted](v5, "isRestricted");
      if (v25 != -[UIAirDropNode isRestricted](self, "isRestricted"))
        goto LABEL_24;
      v26 = -[UIAirDropNode isPlaceholder](v5, "isPlaceholder");
      if (v26 != -[UIAirDropNode isPlaceholder](self, "isPlaceholder"))
        goto LABEL_24;
      -[UIAirDropNode peopleSuggestion](v5, "peopleSuggestion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAirDropNode peopleSuggestion](self, "peopleSuggestion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v29;
      v31 = v30;
      v44 = v31;
      if (v28 == v31)
      {

      }
      else
      {
        v32 = v31;
        if ((v28 == 0) == (v31 != 0))
        {
          v19 = 0;
          v36 = v28;
          goto LABEL_47;
        }
        v33 = objc_msgSend(v28, "isEqual:", v31);

        if (!v33)
        {
          v19 = 0;
LABEL_48:
          v27 = v44;
          goto LABEL_26;
        }
      }
      -[UIAirDropNode displayName](v5, "displayName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAirDropNode displayName](self, "displayName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      v37 = v35;
      v32 = v37;
      if (v36 == v37)
      {

      }
      else
      {
        if ((v36 == 0) == (v37 != 0))
        {
          v19 = 0;
          v43 = v37;
          v41 = v36;
LABEL_46:

          goto LABEL_47;
        }
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if (!v38)
        {
          v19 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      -[UIAirDropNode subtitle](v5, "subtitle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAirDropNode subtitle](self, "subtitle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v39;
      v42 = v40;
      v43 = v42;
      if (v41 == v42)
      {
        v19 = 1;
      }
      else if ((v41 == 0) == (v42 != 0))
      {
        v19 = 0;
      }
      else
      {
        v19 = objc_msgSend(v41, "isEqual:", v42);
      }

      goto LABEL_46;
    }
    v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)load
{
  uint64_t (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  int v6;
  char v7;
  NSObject *v8;

  -[UIAirDropNode loadHandler](self, "loadHandler");
  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIAirDropNode setLoadHandler:](self, "setLoadHandler:", 0);
    -[UIAirDropNode peopleSuggestion](self, "peopleSuggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4
      || (-[UIAirDropNode suggestionNode](self, "suggestionNode"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "loadIcon"),
          v5,
          v6))
    {
      v7 = ((uint64_t (**)(_QWORD, UIAirDropNode *))v3)[2](v3, self);
    }
    else
    {
      share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[UIAirDropNode load].cold.1(self, v8);

      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (SDSuggestionNode)suggestionNode
{
  return self->_suggestionNode;
}

- (void)setSuggestionNode:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionNode, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (SFPeopleSuggestion)peopleSuggestion
{
  return self->_peopleSuggestion;
}

- (void)setPeopleSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestion, a3);
}

- (SFProxyText)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (SFProxyText)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)suggestionReason
{
  return self->_suggestionReason;
}

- (void)setSuggestionReason:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionReason, a3);
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isMagicHead
{
  return self->_isMagicHead;
}

- (void)setIsMagicHead:(BOOL)a3
{
  self->_isMagicHead = a3;
}

- (int64_t)selectionReason
{
  return self->_selectionReason;
}

- (void)setSelectionReason:(int64_t)a3
{
  self->_selectionReason = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)hasSquareImage
{
  return self->_hasSquareImage;
}

- (void)setHasSquareImage:(BOOL)a3
{
  self->_hasSquareImage = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_suggestionReason, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_suggestionNode, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19E419000, a2, OS_LOG_TYPE_FAULT, "UIAirDropNode:%@ is restricted.", (uint8_t *)&v2, 0xCu);
}

- (void)load
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "suggestionNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Failed to load icon for suggestionNode:%@", (uint8_t *)&v4, 0xCu);

}

@end
