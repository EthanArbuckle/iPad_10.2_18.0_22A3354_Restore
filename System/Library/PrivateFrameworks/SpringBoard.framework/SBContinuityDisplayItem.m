@implementation SBContinuityDisplayItem

+ (id)continuityAppDisplayItemWithBundleIdentifier:(id)a3 appSuggestion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithType:bundleIdentifier:uniqueIdentifier:", 4, v7, 0);

  v9 = (void *)v8[6];
  v8[6] = v6;

  return v8;
}

- (SBContinuityDisplayItem)initWithType:(int64_t)a3 displayIdentifier:(id)a4 appSuggestion:(id)a5
{
  id v9;
  SBContinuityDisplayItem *v10;
  SBContinuityDisplayItem *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBContinuityDisplayItem;
  v10 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](&v13, sel_initWithType_bundleIdentifier_uniqueIdentifier_, a3, a4, 0);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_appSuggestion, a5);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v4, "uniqueStringRepresentation"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SBDisplayItem uniqueStringRepresentation](self, "uniqueStringRepresentation"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = BSEqualObjects(),
        v8,
        v7,
        v9))
  {
    objc_msgSend(v4, "appSuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuityDisplayItem appSuggestion](self, "appSuggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BSEqualObjects();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SBDisplayItem uniqueStringRepresentation](self, "uniqueStringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SBContinuityDisplayItem appSuggestion](self, "appSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (SBBestAppSuggestion)appSuggestion
{
  return self->_appSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuggestion, 0);
}

@end
