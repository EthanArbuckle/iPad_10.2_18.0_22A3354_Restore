@implementation UIAirDropNode

+ (id)nodeWithIdentifier:(id)a3 suggestionNode:(id)a4
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestion"));

  -[UIAirDropNode setIsPlaceholder:](v7, "setIsPlaceholder:", objc_msgSend(v8, "isPlaceholder"));
  return v7;
}

+ (id)nodeWithIdentifier:(id)a3 displayName:(id)a4 subtitle:(id)a5 avatarImageSlotID:(unsigned int)a6 transportImageSlotID:(unsigned int)a7
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

+ (id)nodeWithIdentifier:(id)a3 peopleSuggestion:(id)a4
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
  id v6;
  id v7;
  void *v8;
  id v9;

  v2 = objc_alloc_init(UIAirDropNode);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFPeopleSuggestion TTRPeopleSuggestion](SFPeopleSuggestion, "TTRPeopleSuggestion"));
  v4 = objc_alloc((Class)NSUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v6 = objc_msgSend(v4, "initWithUUIDString:", v5);
  -[UIAirDropNode setIdentifier:](v2, "setIdentifier:", v6);

  v7 = objc_alloc((Class)SFProxyText);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
  v9 = objc_msgSend(v7, "initWithText:", v8);
  -[UIAirDropNode setDisplayName:](v2, "setDisplayName:", v9);

  -[UIAirDropNode setPeopleSuggestion:](v2, "setPeopleSuggestion:", v3);
  return v2;
}

- (BOOL)isTapToRadar
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode peopleSuggestion](self, "peopleSuggestion"));
  v3 = objc_msgSend(v2, "isTapToRadar");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAirDropNode)initWithCoder:(id)a3
{
  id v5;
  UIAirDropNode *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  SFProxyText *displayName;
  uint64_t v14;
  id v15;
  uint64_t v16;
  SFProxyText *subtitle;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSUUID *identifier;
  uint64_t v22;
  id v23;
  uint64_t v24;
  SFPeopleSuggestion *peopleSuggestion;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v41;
  void *v42;

  v5 = a3;
  v6 = -[UIAirDropNode init](self, "init");
  if (v6)
  {
    -[UIAirDropNode setAvatarImageSlotID:](v6, "setAvatarImageSlotID:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("avatarImageSlotID")));
    -[UIAirDropNode setTransportImageSlotID:](v6, "setTransportImageSlotID:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("transportImageSlotID")));
    -[UIAirDropNode setMainLabelSlotID:](v6, "setMainLabelSlotID:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("mainLabelSlotID")));
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("mainLabelSlotHeight"));
    -[UIAirDropNode setMainLabelSlotHeight:](v6, "setMainLabelSlotHeight:");
    -[UIAirDropNode setBottomLabelSlotID:](v6, "setBottomLabelSlotID:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("bottomLabelSlotID")));
    v8 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v7), CFSTR("suggestionNodeReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[UIAirDropNode setSuggestionReason:](v6, "setSuggestionReason:", v9);

    v11 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(SFProxyText, v10), CFSTR("displayName"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    displayName = v6->_displayName;
    v6->_displayName = (SFProxyText *)v12;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(SFProxyText, v14), CFSTR("subtitle"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    subtitle = v6->_subtitle;
    v6->_subtitle = (SFProxyText *)v16;

    v19 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v18), CFSTR("identifier"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v20;

    v6->_isMagicHead = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isMagicHead"));
    v6->_selectionReason = (int64_t)objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("selectionReason"));
    v6->_hasSquareImage = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("hasSquareImage"));
    v6->_isDisabled = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isDisabled"));
    v6->_isRestricted = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isRestricted"));
    v6->_isPlaceholder = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isPlaceholder"));
    v23 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(SFPeopleSuggestion, v22), CFSTR("peopleSuggestion"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    peopleSuggestion = v6->_peopleSuggestion;
    v6->_peopleSuggestion = (SFPeopleSuggestion *)v24;

    if (-[UIAirDropNode mainLabelSlotID](v6, "mainLabelSlotID"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode displayName](v6, "displayName"));
      v27 = objc_msgSend(v26, "slotIdentifier");

      if (!v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode displayName](v6, "displayName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "text"));

        if (v29)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UIAirDropNode.m"), 117, CFSTR("using slot and text at the same time for displayName."));

        }
        v30 = objc_alloc((Class)SFProxyText);
        v31 = (id)-[UIAirDropNode mainLabelSlotID](v6, "mainLabelSlotID");
        -[UIAirDropNode mainLabelSlotHeight](v6, "mainLabelSlotHeight");
        v32 = objc_msgSend(v30, "initWithSlotIdentifier:slotTextHeight:", v31);
        -[UIAirDropNode setDisplayName:](v6, "setDisplayName:", v32);

      }
    }
    if (-[UIAirDropNode bottomLabelSlotID](v6, "bottomLabelSlotID"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode subtitle](v6, "subtitle"));
      v34 = objc_msgSend(v33, "slotIdentifier");

      if (!v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode subtitle](v6, "subtitle"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "text"));

        if (v36)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UIAirDropNode.m"), 121, CFSTR("using slot and text at the same time for subtitle."));

        }
        v37 = objc_msgSend(objc_alloc((Class)SFProxyText), "initWithSlotIdentifier:", -[UIAirDropNode bottomLabelSlotID](v6, "bottomLabelSlotID"));
        -[UIAirDropNode setSubtitle:](v6, "setSubtitle:", v37);

      }
    }
    if (-[UIAirDropNode isRestricted](v6, "isRestricted"))
    {
      v38 = share_sheet_log();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        sub_1000E6E5C((uint64_t)v6, v39);

      v6 = 0;
    }
  }

  return v6;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode suggestionNode](self, "suggestionNode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionReason"));
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
  NSString *v3;
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

  v18.receiver = self;
  v18.super_class = (Class)UIAirDropNode;
  v3 = -[UIAirDropNode description](&v18, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode identifier](self, "identifier"));
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: identifier:%@ avatarImageSlotID:%u, transportImageSlotID:%u, textSlotID:%u, textSlotHeight:%f, peopleSuggestion:%@, isDisabled:%@, isRestricted:%@ displayName:%@ subtitle:%@ isPlaceholder:%@"), v4, v5, v6, v7, v8, v9, self->_peopleSuggestion, v10, v11, self->_displayName, self->_subtitle, v12));

  if (self->_isMagicHead)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(", isMagicHead:%@, selectionReason:%ld"), v14, self->_selectionReason));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(">")));
  return (NSString *)v16;
}

- (unint64_t)hash
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (unint64_t)objc_msgSend(v5, "hash");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode identifier](self, "identifier"));
  v8 = (unint64_t)objc_msgSend(v7, "hash") ^ v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  UIAirDropNode *v5;
  uint64_t v6;
  UIAirDropNode *v7;
  unsigned int v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  unsigned __int8 v21;
  unsigned int v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  unsigned int v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;

  v5 = (UIAirDropNode *)a3;
  if (self == v5)
  {
    v21 = 1;
  }
  else
  {
    v6 = objc_opt_class(UIAirDropNode, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = -[UIAirDropNode avatarImageSlotID](v7, "avatarImageSlotID");
      if (v8 != -[UIAirDropNode avatarImageSlotID](self, "avatarImageSlotID")
        || (v9 = -[UIAirDropNode mainLabelSlotID](v7, "mainLabelSlotID"),
            v9 != -[UIAirDropNode mainLabelSlotID](self, "mainLabelSlotID"))
        || (-[UIAirDropNode mainLabelSlotHeight](v7, "mainLabelSlotHeight"),
            v11 = v10,
            -[UIAirDropNode mainLabelSlotHeight](self, "mainLabelSlotHeight"),
            v11 != v12)
        || (v13 = -[UIAirDropNode bottomLabelSlotID](v7, "bottomLabelSlotID"),
            v13 != -[UIAirDropNode bottomLabelSlotID](self, "bottomLabelSlotID"))
        || (v14 = -[UIAirDropNode transportImageSlotID](v7, "transportImageSlotID"),
            v14 != -[UIAirDropNode transportImageSlotID](self, "transportImageSlotID")))
      {
        v21 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode identifier](v7, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode identifier](self, "identifier"));
      v17 = v15;
      v18 = v16;
      v19 = v18;
      if (v17 == v18)
      {

      }
      else
      {
        if ((v17 == 0) == (v18 != 0))
        {
          v21 = 0;
          v29 = v18;
          v30 = v17;
LABEL_26:

          goto LABEL_27;
        }
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if (!v20)
        {
LABEL_24:
          v21 = 0;
LABEL_27:

          goto LABEL_15;
        }
      }
      v23 = -[UIAirDropNode isMagicHead](v7, "isMagicHead");
      if (v23 != -[UIAirDropNode isMagicHead](self, "isMagicHead"))
        goto LABEL_24;
      v24 = -[UIAirDropNode selectionReason](v7, "selectionReason");
      if (v24 != (id)-[UIAirDropNode selectionReason](self, "selectionReason"))
        goto LABEL_24;
      v25 = -[UIAirDropNode hasSquareImage](v7, "hasSquareImage");
      if (v25 != -[UIAirDropNode hasSquareImage](self, "hasSquareImage"))
        goto LABEL_24;
      v26 = -[UIAirDropNode isDisabled](v7, "isDisabled");
      if (v26 != -[UIAirDropNode isDisabled](self, "isDisabled"))
        goto LABEL_24;
      v27 = -[UIAirDropNode isRestricted](v7, "isRestricted");
      if (v27 != -[UIAirDropNode isRestricted](self, "isRestricted"))
        goto LABEL_24;
      v28 = -[UIAirDropNode isPlaceholder](v7, "isPlaceholder");
      if (v28 != -[UIAirDropNode isPlaceholder](self, "isPlaceholder"))
        goto LABEL_24;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode peopleSuggestion](v7, "peopleSuggestion"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode peopleSuggestion](self, "peopleSuggestion"));
      v30 = v31;
      v33 = v32;
      v46 = v33;
      if (v30 == v33)
      {

      }
      else
      {
        v34 = v33;
        if ((v30 == 0) == (v33 != 0))
        {
          v21 = 0;
          v38 = v30;
          goto LABEL_47;
        }
        v35 = objc_msgSend(v30, "isEqual:", v33);

        if (!v35)
        {
          v21 = 0;
LABEL_48:
          v29 = v46;
          goto LABEL_26;
        }
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode displayName](v7, "displayName"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode displayName](self, "displayName"));
      v38 = v36;
      v39 = v37;
      v34 = v39;
      if (v38 == v39)
      {

      }
      else
      {
        if ((v38 == 0) == (v39 != 0))
        {
          v21 = 0;
          v45 = v39;
          v43 = v38;
LABEL_46:

          goto LABEL_47;
        }
        v40 = objc_msgSend(v38, "isEqual:", v39);

        if (!v40)
        {
          v21 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode subtitle](v7, "subtitle"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode subtitle](self, "subtitle"));
      v43 = v41;
      v44 = v42;
      v45 = v44;
      if (v43 == v44)
      {
        v21 = 1;
      }
      else if ((v43 == 0) == (v44 != 0))
      {
        v21 = 0;
      }
      else
      {
        v21 = objc_msgSend(v43, "isEqual:", v44);
      }

      goto LABEL_46;
    }
    v21 = 0;
  }
LABEL_16:

  return v21;
}

- (BOOL)load
{
  uint64_t (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  unsigned int v6;
  char v7;
  id v8;
  NSObject *v9;

  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[UIAirDropNode loadHandler](self, "loadHandler"));
  if (v3)
  {
    -[UIAirDropNode setLoadHandler:](self, "setLoadHandler:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode peopleSuggestion](self, "peopleSuggestion"));

    if (v4
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIAirDropNode suggestionNode](self, "suggestionNode")),
          v6 = objc_msgSend(v5, "loadIcon"),
          v5,
          v6))
    {
      v7 = ((uint64_t (**)(_QWORD, UIAirDropNode *))v3)[2](v3, self);
    }
    else
    {
      v8 = share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000E6ED0(self, v9);

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

@end
