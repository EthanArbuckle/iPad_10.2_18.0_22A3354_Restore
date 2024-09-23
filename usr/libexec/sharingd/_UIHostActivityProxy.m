@implementation _UIHostActivityProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHostActivityProxy)initWithActivity:(id)a3
{
  id v5;
  _UIHostActivityProxy *v6;
  _UIHostActivityProxy *v7;
  uint64_t v8;
  NSUUID *identifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIHostActivityProxy;
  v6 = -[_UIHostActivityProxy init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activity, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityUUID"));
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

  }
  return v7;
}

- (_UIHostActivityProxy)initWithCoder:(id)a3
{
  id v5;
  _UIHostActivityProxy *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSUUID *identifier;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSUUID *activityIdentifierShare;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSUUID *activityIdentifierOpen;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSUUID *activityIdentifierCopy;
  uint64_t v23;
  id v24;
  uint64_t v25;
  SFProxyText *activityTitle;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSAttributedString *activityFooter;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSString *applicationBundleIdentifier;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v45;

  v5 = a3;
  v6 = -[_UIHostActivityProxy init](self, "init");
  if (v6)
  {
    -[_UIHostActivityProxy setIconImageSlotID:](v6, "setIconImageSlotID:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("iconImageSlotID")));
    -[_UIHostActivityProxy setLabelSlotID:](v6, "setLabelSlotID:", objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("labelSlotID")));
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("slotTextHeight"));
    -[_UIHostActivityProxy setSlotTextHeight:](v6, "setSlotTextHeight:");
    v8 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v7), CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v9;

    v6->_isDisabled = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isDisabled"));
    v6->_isFavorite = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isFavorite"));
    v6->_isRestricted = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isRestricted"));
    v6->_isUserDefaultsActivity = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isUserDefaultsActivity"));
    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v11), CFSTR("activityIdentifierShare"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    activityIdentifierShare = v6->_activityIdentifierShare;
    v6->_activityIdentifierShare = (NSUUID *)v13;

    v16 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v15), CFSTR("activityIdentifierOpen"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    activityIdentifierOpen = v6->_activityIdentifierOpen;
    v6->_activityIdentifierOpen = (NSUUID *)v17;

    v20 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v19), CFSTR("activityIdentifierCopy"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    activityIdentifierCopy = v6->_activityIdentifierCopy;
    v6->_activityIdentifierCopy = (NSUUID *)v21;

    v24 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(SFProxyText, v23), CFSTR("activityTitle"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    activityTitle = v6->_activityTitle;
    v6->_activityTitle = (SFProxyText *)v25;

    v28 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSAttributedString, v27), CFSTR("activityFooter"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    activityFooter = v6->_activityFooter;
    v6->_activityFooter = (NSAttributedString *)v29;

    v32 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v31), CFSTR("applicationBundleIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue(v32);
    applicationBundleIdentifier = v6->_applicationBundleIdentifier;
    v6->_applicationBundleIdentifier = (NSString *)v33;

    if (-[_UIHostActivityProxy labelSlotID](v6, "labelSlotID"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityTitle](v6, "activityTitle"));
      v36 = objc_msgSend(v35, "slotIdentifier");

      if (!v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityTitle](v6, "activityTitle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "text"));

        if (v38)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIHostActivityProxy.m"), 71, CFSTR("using slot and text at the same time for activityTitle."));

        }
        v39 = objc_alloc((Class)SFProxyText);
        v40 = (id)-[_UIHostActivityProxy labelSlotID](v6, "labelSlotID");
        -[_UIHostActivityProxy slotTextHeight](v6, "slotTextHeight");
        v41 = objc_msgSend(v39, "initWithSlotIdentifier:slotTextHeight:", v40);
        -[_UIHostActivityProxy setActivityTitle:](v6, "setActivityTitle:", v41);

      }
    }
    if (-[_UIHostActivityProxy isRestricted](v6, "isRestricted"))
    {
      v42 = share_sheet_log();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        sub_10001B918((uint64_t)v6, v43);

      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIHostActivityProxy iconImageSlotID](self, "iconImageSlotID"), CFSTR("iconImageSlotID"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIHostActivityProxy labelSlotID](self, "labelSlotID"), CFSTR("labelSlotID"));
  -[_UIHostActivityProxy slotTextHeight](self, "slotTextHeight");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("slotTextHeight"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDisabled, CFSTR("isDisabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isFavorite, CFSTR("isFavorite"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRestricted, CFSTR("isRestricted"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isUserDefaultsActivity, CFSTR("isUserDefaultsActivity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityIdentifierShare, CFSTR("activityIdentifierShare"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityIdentifierOpen, CFSTR("activityIdentifierOpen"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityIdentifierCopy, CFSTR("activityIdentifierCopy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityTitle, CFSTR("activityTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityFooter, CFSTR("activityFooter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));

}

- (void)setIconImageSlotID:(unsigned int)a3
{
  atomic_store(a3, &self->_iconImageSlotID);
}

- (unsigned)iconImageSlotID
{
  return atomic_load(&self->_iconImageSlotID);
}

- (void)setLabelSlotID:(unsigned int)a3
{
  atomic_store(a3, &self->_labelSlotID);
}

- (unsigned)labelSlotID
{
  return atomic_load(&self->_labelSlotID);
}

- (void)setSlotTextHeight:(double)a3
{
  atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_slotTextHeight);
}

- (double)slotTextHeight
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->_slotTextHeight));
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSUUID *activityIdentifierCopy;
  uint64_t v13;
  void *v14;
  __int128 v16;
  UIActivity *activity;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UIHostActivityProxy;
  v3 = -[_UIHostActivityProxy description](&v18, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy identifier](self, "identifier"));
  activity = self->_activity;
  v6 = -[_UIHostActivityProxy iconImageSlotID](self, "iconImageSlotID");
  v7 = -[_UIHostActivityProxy labelSlotID](self, "labelSlotID");
  if (self->_isDisabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_isFavorite)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_isRestricted)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_isUserDefaultsActivity)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v16 = *(_OWORD *)&self->_activityIdentifierShare;
  activityIdentifierCopy = self->_activityIdentifierCopy;
  -[_UIHostActivityProxy slotTextHeight](self, "slotTextHeight");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: identifier:%@ activity:%@ iconImageSlotID:%u, textSlot:%u, isDisabled:%@, isFavorite:%@, isRestricted:%@, isUserDefaultsActivity:%@, activityIdentifierShare:%@, activityIdentifierOpen:%@, activityIdentifierCopy:%@, textHeight:%f, activityTitle:%@, activityFooter:%@, bundleIdentifier:%@>"), v4, v5, activity, v6, v7, v8, v9, v10, v11, v16, activityIdentifierCopy, v13, self->_activityTitle, self->_activityFooter, self->_applicationBundleIdentifier));

  return (NSString *)v14;
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

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy identifier](self, "identifier"));
  v8 = (unint64_t)objc_msgSend(v7, "hash") ^ v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  _UIHostActivityProxy *v5;
  uint64_t v6;
  _UIHostActivityProxy *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  unsigned __int8 v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  id v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  unsigned int v63;
  id v64;
  void *v65;
  id v66;
  unsigned int v67;
  id v68;
  id v69;
  id v70;
  void *v71;

  v5 = (_UIHostActivityProxy *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(_UIHostActivityProxy, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy identifier](self, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy identifier](v7, "identifier"));
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {

      }
      else
      {
        if ((v10 == 0) == (v11 != 0))
        {
          v14 = 0;
          v21 = v11;
          v22 = v10;
LABEL_18:

          goto LABEL_19;
        }
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if (!v13)
        {
LABEL_16:
          v14 = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
      v15 = -[_UIHostActivityProxy iconImageSlotID](self, "iconImageSlotID");
      if (v15 != -[_UIHostActivityProxy iconImageSlotID](v7, "iconImageSlotID"))
        goto LABEL_16;
      v16 = -[_UIHostActivityProxy labelSlotID](self, "labelSlotID");
      if (v16 != -[_UIHostActivityProxy labelSlotID](v7, "labelSlotID"))
        goto LABEL_16;
      v17 = -[_UIHostActivityProxy isDisabled](self, "isDisabled");
      if (v17 != -[_UIHostActivityProxy isDisabled](v7, "isDisabled"))
        goto LABEL_16;
      v18 = -[_UIHostActivityProxy isFavorite](self, "isFavorite");
      if (v18 != -[_UIHostActivityProxy isFavorite](v7, "isFavorite"))
        goto LABEL_16;
      v19 = -[_UIHostActivityProxy isRestricted](self, "isRestricted");
      if (v19 != -[_UIHostActivityProxy isRestricted](v7, "isRestricted"))
        goto LABEL_16;
      v20 = -[_UIHostActivityProxy isUserDefaultsActivity](self, "isUserDefaultsActivity");
      if (v20 != -[_UIHostActivityProxy isUserDefaultsActivity](v7, "isUserDefaultsActivity"))
        goto LABEL_16;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityIdentifierShare](self, "activityIdentifierShare"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityIdentifierShare](v7, "activityIdentifierShare"));
      v22 = v24;
      v26 = v25;
      v21 = v26;
      if (v22 == v26)
      {

      }
      else
      {
        if ((v22 == 0) == (v26 != 0))
        {
          v14 = 0;
          v32 = v26;
          v30 = v22;
          goto LABEL_65;
        }
        v27 = objc_msgSend(v22, "isEqual:", v26);

        if (!v27)
        {
          v14 = 0;
          goto LABEL_18;
        }
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityIdentifierOpen](self, "activityIdentifierOpen"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityIdentifierOpen](v7, "activityIdentifierOpen"));
      v30 = v28;
      v31 = v29;
      v32 = v31;
      if (v30 == v31)
      {

      }
      else
      {
        if ((v30 == 0) == (v31 != 0))
        {
          v14 = 0;
          v42 = v31;
          v36 = v30;
LABEL_64:

          goto LABEL_65;
        }
        v33 = objc_msgSend(v30, "isEqual:", v31);

        if (!v33)
        {
          v14 = 0;
LABEL_65:

          goto LABEL_18;
        }
      }
      v71 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityIdentifierCopy](self, "activityIdentifierCopy"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityIdentifierCopy](v7, "activityIdentifierCopy"));
      v36 = v34;
      v37 = v35;
      v70 = v37;
      if (v36 == v37)
      {

      }
      else
      {
        v38 = v37;
        if ((v36 == 0) == (v37 != 0))
        {
          v69 = v30;
          v14 = 0;
          v51 = v36;
          v32 = v71;
LABEL_63:

          v30 = v69;
          v42 = v70;
          goto LABEL_64;
        }
        v39 = v36;
        v40 = v36;
        v41 = v38;
        v67 = objc_msgSend(v39, "isEqual:", v38);

        v36 = v40;
        if (!v67)
          goto LABEL_43;
      }
      -[_UIHostActivityProxy slotTextHeight](self, "slotTextHeight");
      v44 = v43;
      -[_UIHostActivityProxy slotTextHeight](v7, "slotTextHeight");
      if (vabdd_f64(v44, v45) >= 0.00000011920929)
      {
LABEL_43:
        v14 = 0;
        v42 = v70;
        v32 = v71;
        goto LABEL_64;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityTitle](self, "activityTitle"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityTitle](v7, "activityTitle"));
      v47 = v46;
      v48 = v65;
      v68 = v47;
      v69 = v30;
      v66 = v48;
      if (v47 == v48)
      {

      }
      else
      {
        v49 = v48;
        if ((v47 == 0) == (v48 != 0))
        {
          v14 = 0;
          v54 = v47;
          v32 = v71;
LABEL_61:

          goto LABEL_62;
        }
        v50 = v48;
        v63 = objc_msgSend(v47, "isEqual:", v48);

        if (!v63)
        {
          v14 = 0;
          v32 = v71;
LABEL_62:
          v38 = v66;
          v51 = v68;
          goto LABEL_63;
        }
      }
      v64 = v36;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityFooter](self, "activityFooter"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy activityFooter](v7, "activityFooter"));
      v54 = v52;
      v55 = v53;
      v62 = v55;
      if (v54 == v55)
      {

      }
      else
      {
        v56 = v55;
        if ((v54 == 0) == (v55 != 0))
        {
          v14 = 0;
          v60 = v54;
LABEL_59:

          goto LABEL_60;
        }
        v57 = objc_msgSend(v54, "isEqual:", v55);

        if (!v57)
        {
          v14 = 0;
LABEL_60:
          v32 = v71;
          v49 = v62;
          v36 = v64;
          goto LABEL_61;
        }
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy applicationBundleIdentifier](self, "applicationBundleIdentifier"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy applicationBundleIdentifier](v7, "applicationBundleIdentifier"));
      v60 = v58;
      v61 = v59;
      v56 = v61;
      if (v60 == v61)
      {
        v14 = 1;
      }
      else if ((v60 == 0) == (v61 != 0))
      {
        v14 = 0;
      }
      else
      {
        v14 = objc_msgSend(v60, "isEqual:", v61);
      }

      goto LABEL_59;
    }
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (BOOL)load
{
  uint64_t (**v3)(_QWORD, _QWORD);
  char v4;

  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[_UIHostActivityProxy loadHandler](self, "loadHandler"));
  if (v3)
  {
    -[_UIHostActivityProxy setLoadHandler:](self, "setLoadHandler:", 0);
    v4 = ((uint64_t (**)(_QWORD, _UIHostActivityProxy *))v3)[2](v3, self);
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)activityIdentifierShare
{
  return self->_activityIdentifierShare;
}

- (void)setActivityIdentifierShare:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifierShare, a3);
}

- (NSUUID)activityIdentifierOpen
{
  return self->_activityIdentifierOpen;
}

- (void)setActivityIdentifierOpen:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifierOpen, a3);
}

- (NSUUID)activityIdentifierCopy
{
  return self->_activityIdentifierCopy;
}

- (void)setActivityIdentifierCopy:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifierCopy, a3);
}

- (SFProxyText)activityTitle
{
  return self->_activityTitle;
}

- (void)setActivityTitle:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitle, a3);
}

- (NSAttributedString)activityFooter
{
  return self->_activityFooter;
}

- (void)setActivityFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (BOOL)isUserDefaultsActivity
{
  return self->_isUserDefaultsActivity;
}

- (void)setIsUserDefaultsActivity:(BOOL)a3
{
  self->_isUserDefaultsActivity = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityFooter, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_activityIdentifierCopy, 0);
  objc_storeStrong((id *)&self->_activityIdentifierOpen, 0);
  objc_storeStrong((id *)&self->_activityIdentifierShare, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
