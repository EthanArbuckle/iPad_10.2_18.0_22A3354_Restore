@implementation SFPeopleSuggestionProxy

- (SFPeopleSuggestionProxy)initWithPeopleSuggestion:(id)a3
{
  id v5;
  SFPeopleSuggestionProxy *v6;
  SFPeopleSuggestionProxy *v7;
  uint64_t v8;
  NSUUID *identifier;
  SFProxyText *v10;
  void *v11;
  uint64_t v12;
  SFProxyText *displayName;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestionProxy;
  v6 = -[SFPeopleSuggestionProxy init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peopleSuggestion, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [SFProxyText alloc];
    objc_msgSend(v5, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SFProxyText initWithText:](v10, "initWithText:", v11);
    displayName = v7->_displayName;
    v7->_displayName = (SFProxyText *)v12;

    v7->_disabled = 0;
  }

  return v7;
}

- (SFPeopleSuggestionProxy)initWithSuggestionNode:(id)a3
{
  id v5;
  SFPeopleSuggestionProxy *v6;
  SFPeopleSuggestionProxy *v7;
  uint64_t v8;
  NSUUID *identifier;
  SFProxyText *v10;
  void *v11;
  uint64_t v12;
  SFProxyText *displayName;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestionProxy;
  v6 = -[SFPeopleSuggestionProxy init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionNode, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [SFProxyText alloc];
    objc_msgSend(v5, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SFProxyText initWithText:](v10, "initWithText:", v11);
    displayName = v7->_displayName;
    v7->_displayName = (SFProxyText *)v12;

    v7->_disabled = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPeopleSuggestionProxy)initWithCoder:(id)a3
{
  id v4;
  SFPeopleSuggestionProxy *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  SFProxyText *displayName;
  uint64_t v10;
  SFProxyText *subtitle;
  uint64_t v12;
  SFPeopleSuggestion *peopleSuggestion;

  v4 = a3;
  v5 = -[SFPeopleSuggestionProxy init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (SFProxyText *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (SFProxyText *)v10;

    -[SFPeopleSuggestionProxy setAvatarImageSlotID:](v5, "setAvatarImageSlotID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("avatarImageSlotID")));
    -[SFPeopleSuggestionProxy setTransportImageSlotID:](v5, "setTransportImageSlotID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("transportImageSlotID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peopleSuggestion"));
    v12 = objc_claimAutoreleasedReturnValue();
    peopleSuggestion = v5->_peopleSuggestion;
    v5->_peopleSuggestion = (SFPeopleSuggestion *)v12;

    v5->_disabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[SFPeopleSuggestionProxy avatarImageSlotID](self, "avatarImageSlotID"), CFSTR("avatarImageSlotID"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[SFPeopleSuggestionProxy transportImageSlotID](self, "transportImageSlotID"), CFSTR("transportImageSlotID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peopleSuggestion, CFSTR("peopleSuggestion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disabled, CFSTR("disabled"));

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

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestionProxy;
  -[SFPeopleSuggestionProxy description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestionProxy identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestionProxy displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestionProxy subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFPeopleSuggestionProxy avatarImageSlotID](self, "avatarImageSlotID");
  v8 = -[SFPeopleSuggestionProxy transportImageSlotID](self, "transportImageSlotID");
  if (-[SFPeopleSuggestionProxy isDisabled](self, "isDisabled"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[SFPeopleSuggestionProxy peopleSuggestion](self, "peopleSuggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: identifier:%@, displayName:%@, subtitle:%@, avatarImageSlotID:%u, transportImageSlotID:%u, disabled:%@ peopleSuggestion:%@>"), v3, v4, v5, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[SFPeopleSuggestionProxy identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  -[SFPeopleSuggestionProxy displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v5;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPeopleSuggestionProxy identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
        v13 = v8;
        v12 = v7;
LABEL_17:

        goto LABEL_18;
      }
      v10 = objc_msgSend(v7, "isEqual:", v8);

      if (!v10)
      {
        LOBYTE(v11) = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    objc_msgSend(v4, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPeopleSuggestionProxy displayName](self, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v13))
    {
      objc_msgSend(v4, "subtitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestionProxy subtitle](self, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", v15)
        && (v16 = objc_msgSend(v4, "avatarImageSlotID"),
            v16 == -[SFPeopleSuggestionProxy avatarImageSlotID](self, "avatarImageSlotID"))
        && (v17 = objc_msgSend(v4, "transportImageSlotID"),
            v17 == -[SFPeopleSuggestionProxy transportImageSlotID](self, "transportImageSlotID")))
      {
        v18 = objc_msgSend(v4, "isDisabled");
        v11 = v18 ^ -[SFPeopleSuggestionProxy isDisabled](self, "isDisabled") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
    goto LABEL_17;
  }
  LOBYTE(v11) = 0;
LABEL_19:

  return v11;
}

- (BOOL)load
{
  uint64_t (**v3)(_QWORD, _QWORD);
  void *v4;
  int v5;
  char v6;
  NSObject *v7;

  -[SFPeopleSuggestionProxy loadHandler](self, "loadHandler");
  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SFPeopleSuggestionProxy setLoadHandler:](self, "setLoadHandler:", 0);
    -[SFPeopleSuggestionProxy suggestionNode](self, "suggestionNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "loadIcon");

    if (v5)
    {
      v6 = ((uint64_t (**)(_QWORD, SFPeopleSuggestionProxy *))v3)[2](v3, self);
    }
    else
    {
      share_sheet_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SFPeopleSuggestionProxy load].cold.1(self, v7);

      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (SDSuggestionNode)suggestionNode
{
  return self->_suggestionNode;
}

- (void)setSuggestionNode:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionNode, a3);
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

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionNode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "Failed to load icon for suggestionNode:%@", (uint8_t *)&v4, 0xCu);

}

@end
