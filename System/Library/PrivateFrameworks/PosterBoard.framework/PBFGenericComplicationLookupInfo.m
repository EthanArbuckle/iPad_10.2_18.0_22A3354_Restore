@implementation PBFGenericComplicationLookupInfo

+ (id)complicationLookupForWidgetFamily:(id)a3 extensionBundleIdentifier:(id)a4 containingBundleIdentifier:(id)a5 kind:(id)a6 intent:(id)a7 suggestedComplication:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  INIntent *v19;
  id v20;
  PBFGenericComplicationLookupInfo *v21;
  uint64_t v22;
  NSNumber *complicationWidgetFamily;
  uint64_t v24;
  NSString *complicationExtensionBundleIdentifier;
  uint64_t v26;
  NSString *complicationContainingBundleIdentifier;
  uint64_t v28;
  NSString *complicationWidgetKind;
  INIntent *complicationIntent;
  INIntent *v31;
  uint64_t v32;
  PRSPosterGallerySuggestedComplication *suggestedComplication;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = (INIntent *)a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFPosterPreview.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("widgetFamily"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFPosterPreview.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("complicationContainingBundleIdentifier"));

      if (v18)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFPosterPreview.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("complicationWidgetKind"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFPosterPreview.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("complicationExtensionBundleIdentifier"));

  if (!v17)
    goto LABEL_8;
LABEL_4:
  if (!v18)
    goto LABEL_9;
LABEL_5:
  v21 = objc_alloc_init(PBFGenericComplicationLookupInfo);
  v22 = objc_msgSend(v15, "copy");
  complicationWidgetFamily = v21->_complicationWidgetFamily;
  v21->_complicationWidgetFamily = (NSNumber *)v22;

  v24 = objc_msgSend(v16, "copy");
  complicationExtensionBundleIdentifier = v21->_complicationExtensionBundleIdentifier;
  v21->_complicationExtensionBundleIdentifier = (NSString *)v24;

  v26 = objc_msgSend(v17, "copy");
  complicationContainingBundleIdentifier = v21->_complicationContainingBundleIdentifier;
  v21->_complicationContainingBundleIdentifier = (NSString *)v26;

  v28 = objc_msgSend(v18, "copy");
  complicationWidgetKind = v21->_complicationWidgetKind;
  v21->_complicationWidgetKind = (NSString *)v28;

  complicationIntent = v21->_complicationIntent;
  v21->_complicationIntent = v19;
  v31 = v19;

  v32 = objc_msgSend(v20, "copy");
  suggestedComplication = v21->_suggestedComplication;
  v21->_suggestedComplication = (PRSPosterGallerySuggestedComplication *)v32;

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBFGenericComplicationLookupInfo *v4;
  uint64_t v5;
  NSNumber *complicationWidgetFamily;
  uint64_t v7;
  NSString *complicationExtensionBundleIdentifier;
  uint64_t v9;
  NSString *complicationContainingBundleIdentifier;
  uint64_t v11;
  NSString *complicationWidgetKind;
  uint64_t v13;
  PRSPosterGallerySuggestedComplication *suggestedComplication;

  v4 = objc_alloc_init(PBFGenericComplicationLookupInfo);
  v5 = -[NSNumber copy](self->_complicationWidgetFamily, "copy");
  complicationWidgetFamily = v4->_complicationWidgetFamily;
  v4->_complicationWidgetFamily = (NSNumber *)v5;

  v7 = -[NSString copy](self->_complicationExtensionBundleIdentifier, "copy");
  complicationExtensionBundleIdentifier = v4->_complicationExtensionBundleIdentifier;
  v4->_complicationExtensionBundleIdentifier = (NSString *)v7;

  v9 = -[NSString copy](self->_complicationContainingBundleIdentifier, "copy");
  complicationContainingBundleIdentifier = v4->_complicationContainingBundleIdentifier;
  v4->_complicationContainingBundleIdentifier = (NSString *)v9;

  v11 = -[NSString copy](self->_complicationWidgetKind, "copy");
  complicationWidgetKind = v4->_complicationWidgetKind;
  v4->_complicationWidgetKind = (NSString *)v11;

  v13 = -[PRSPosterGallerySuggestedComplication copy](self->_suggestedComplication, "copy");
  suggestedComplication = v4->_suggestedComplication;
  v4->_suggestedComplication = (PRSPosterGallerySuggestedComplication *)v13;

  v4->_hash = self->_hash;
  return v4;
}

- (unint64_t)hash
{
  uint64_t hash;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  hash = self->_hash;
  if (!hash)
  {
    v4 = (void *)objc_opt_new();
    v5 = (id)objc_msgSend(v4, "appendObject:", self->_complicationWidgetFamily);
    v6 = (id)objc_msgSend(v4, "appendString:", self->_complicationContainingBundleIdentifier);
    v7 = (id)objc_msgSend(v4, "appendString:", self->_complicationExtensionBundleIdentifier);
    v8 = (id)objc_msgSend(v4, "appendString:", self->_complicationWidgetKind);
    hash = objc_msgSend(v4, "hash");
    self->_hash = hash;

  }
  return hash;
}

- (BOOL)isEqual:(id)a3
{
  PBFGenericComplicationLookupInfo *v4;
  PBFGenericComplicationLookupInfo *v5;
  uint64_t v6;
  char v7;
  PBFGenericComplicationLookupInfo *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;

  v4 = (PBFGenericComplicationLookupInfo *)a3;
  v5 = v4;
  if (v4 == self
    || (v6 = -[PBFGenericComplicationLookupInfo hash](v4, "hash"),
        v6 == -[PBFGenericComplicationLookupInfo hash](self, "hash")))
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v5;
      -[PBFGenericComplicationLookupInfo complicationWidgetFamily](v9, "complicationWidgetFamily");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGenericComplicationLookupInfo complicationWidgetFamily](self, "complicationWidgetFamily");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = BSEqualObjects();

      if (!v12)
        goto LABEL_11;
      -[PBFGenericComplicationLookupInfo complicationContainingBundleIdentifier](v9, "complicationContainingBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGenericComplicationLookupInfo complicationContainingBundleIdentifier](self, "complicationContainingBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = BSEqualObjects();

      if (!v15)
        goto LABEL_11;
      -[PBFGenericComplicationLookupInfo complicationExtensionBundleIdentifier](v9, "complicationExtensionBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGenericComplicationLookupInfo complicationExtensionBundleIdentifier](self, "complicationExtensionBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = BSEqualObjects();

      if (v18)
      {
        -[PBFGenericComplicationLookupInfo complicationWidgetKind](v9, "complicationWidgetKind");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFGenericComplicationLookupInfo complicationWidgetKind](self, "complicationWidgetKind");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = BSEqualObjects();

      }
      else
      {
LABEL_11:
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSNumber)complicationWidgetFamily
{
  return self->_complicationWidgetFamily;
}

- (NSString)complicationExtensionBundleIdentifier
{
  return self->_complicationExtensionBundleIdentifier;
}

- (NSString)complicationContainingBundleIdentifier
{
  return self->_complicationContainingBundleIdentifier;
}

- (NSString)complicationWidgetKind
{
  return self->_complicationWidgetKind;
}

- (INIntent)complicationIntent
{
  return self->_complicationIntent;
}

- (PRSPosterGallerySuggestedComplication)suggestedComplication
{
  return self->_suggestedComplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedComplication, 0);
  objc_storeStrong((id *)&self->_complicationIntent, 0);
  objc_storeStrong((id *)&self->_complicationWidgetKind, 0);
  objc_storeStrong((id *)&self->_complicationContainingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationWidgetFamily, 0);
}

@end
