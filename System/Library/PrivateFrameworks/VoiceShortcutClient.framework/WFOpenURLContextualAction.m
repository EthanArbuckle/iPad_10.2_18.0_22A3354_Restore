@implementation WFOpenURLContextualAction

- (WFOpenURLContextualAction)initWithURL:(id)a3 bundleIdentifier:(id)a4 actionTitle:(id)a5
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  WFContextualActionParameter *v20;
  void *v21;
  WFContextualActionParameter *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *bundleIdentifier;
  WFOpenURLContextualAction *v27;
  WFOpenURLContextualAction *v28;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id v34;
  id v35;
  WFContextualActionParameter *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
    {
LABEL_6:
      obj = a3;
      v34 = v12;
      if (v12)
      {
        v17 = v12;
        v18 = 0;
        v19 = v17;
      }
      else
      {
        WFLocalizedStringWithKey(CFSTR("Open URL (Contextual Action)"), CFSTR("Open URL %@"));
        v17 = objc_claimAutoreleasedReturnValue();
        WFLocalizedStringWithKey(CFSTR("Open URL (Contextual Action, Title)"), CFSTR("Open URL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("%@");
      }
      v20 = [WFContextualActionParameter alloc];
      objc_msgSend(v10, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v20, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFURLContentItem"), 0, CFSTR("WFInput"), v21);
      v36 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContextualActionIcon iconWithApplicationBundleIdentifier:](WFContextualActionIcon, "iconWithApplicationBundleIdentifier:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", CFSTR("is.workflow.actions.openurl"), CFSTR("is.workflow.actions.openurl"), v11, v23, v17, v19, v18, v24);

      if (self)
      {
        objc_storeStrong((id *)&self->_url, obj);
        v25 = (NSString *)objc_msgSend(v11, "copy");
        bundleIdentifier = self->_bundleIdentifier;
        self->_bundleIdentifier = v25;

        v27 = self;
      }

      v28 = self;
      v12 = v34;
      goto LABEL_12;
    }
    v35 = 0;
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOpenURLContextualAction.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (v11)
      goto LABEL_6;
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nullable WFBundleIdentifierForHandlingURL(NSURL * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("WFOpenURLContextualAction.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E520]), "initWithURL:error:", v10, &v35);
  objc_msgSend(v14, "bundleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = v35;
  v11 = v16;
  if (v15)
  {

    v11 = (id)v15;
    goto LABEL_6;
  }
  getWFVoiceShortcutClientLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[WFOpenURLContextualAction initWithURL:bundleIdentifier:actionTitle:]";
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_1AF681000, v17, OS_LOG_TYPE_ERROR, "%s Can't determine what bundle identifier can open %@", buf, 0x16u);
  }
  v28 = 0;
LABEL_12:

  return v28;
}

- (id)uniqueIdentifier
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D3E558]);
  -[WFOpenURLContextualAction url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFOpenURLContextualAction bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v6);

  -[WFContextualAction displayFormatString](self, "displayFormatString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "finalize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContextualAction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("."));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  objc_super v11;

  v3 = (void *)objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFOpenURLContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v11, sel_hash));
  -[WFOpenURLContextualAction url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFOpenURLContextualAction bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  v9 = objc_msgSend(v3, "finalize");
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFOpenURLContextualAction;
  if (-[WFContextualAction isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpenURLContextualAction url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      v13 = v8;
      if (!v8 || !v9)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_19;
    }
    objc_msgSend(v5, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpenURLContextualAction bundleIdentifier](self, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    v16 = v15;
    v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16)
        LOBYTE(v11) = objc_msgSend(v13, "isEqualToString:", v16);
    }

    goto LABEL_18;
  }
  LOBYTE(v11) = 0;
LABEL_21:

  return v11;
}

- (WFOpenURLContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFOpenURLContextualAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  WFOpenURLContextualAction *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFOpenURLContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v5->_url, v6);
      objc_storeStrong((id *)&v5->_bundleIdentifier, v8);
      v10 = v5;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFOpenURLContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));

}

- (NSURL)url
{
  return self->_url;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
