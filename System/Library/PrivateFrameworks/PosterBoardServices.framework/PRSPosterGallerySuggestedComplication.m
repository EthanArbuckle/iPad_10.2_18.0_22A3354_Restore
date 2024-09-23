@implementation PRSPosterGallerySuggestedComplication

- (PRSPosterGallerySuggestedComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7 source:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PRSPosterGallerySuggestedComplication *v18;
  uint64_t v19;
  NSString *extensionBundleIdentifier;
  uint64_t v21;
  NSString *kind;
  uint64_t v23;
  NSString *containerBundleIdentifier;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PRSPosterGallerySuggestedComplication;
  v18 = -[PRSPosterGallerySuggestedComplication init](&v26, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    extensionBundleIdentifier = v18->_extensionBundleIdentifier;
    v18->_extensionBundleIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    kind = v18->_kind;
    v18->_kind = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    containerBundleIdentifier = v18->_containerBundleIdentifier;
    v18->_containerBundleIdentifier = (NSString *)v23;

    v18->_widgetFamily = a6;
    objc_storeStrong((id *)&v18->_intent, a7);
    v18->_source = a8;
  }

  return v18;
}

- (PRSPosterGallerySuggestedComplication)initWithProactiveRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  PRSPosterGallerySuggestedComplication *v13;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "widgetFamily");
  objc_msgSend(v4, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "source");

  v11 = (v10 - 1);
  if (v11 < 6)
    v12 = v11 + 1;
  else
    v12 = 0;
  v13 = -[PRSPosterGallerySuggestedComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v5, v6, v7, v8, v9, v12);

  return v13;
}

- (id)proactiveRepresentation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D38]), "initWithPosterBoardRepresentation:", self);
}

+ (PRSPosterGallerySuggestedComplication)suggestedComplicationWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;

  v6 = a3;
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  if (v12)
  {
    NSStringFromSelector(sel_kind);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v19 = v17;

    if (!v19)
    {
      if (a4)
      {
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_37;
    }
    NSStringFromSelector(sel_containerBundleIdentifier);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    v23 = v21;
    if (v22)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = v24;

    NSStringFromSelector(sel_widgetFamily);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_class();
    v29 = v27;
    if (v28)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;

    if (v31)
    {
      v32 = CHSWidgetFamilyFromString();
      if ((CHSWidgetFamilyIsAccessory() & 1) != 0 || v32 == 1)
      {
        v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v12, v19, v25, v32, 0, 0);
        goto LABEL_36;
      }
      if (!a4)
      {
        v18 = 0;
        goto LABEL_36;
      }
    }
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  if (a4)
  {
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_38:

  return (PRSPosterGallerySuggestedComplication *)v18;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *containerBundleIdentifier;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  NSStringFromWidgetFamily();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v13[0] = self->_extensionBundleIdentifier;
  NSStringFromSelector(sel_kind);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v13[1] = self->_kind;
  NSStringFromSelector(sel_containerBundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  v8 = containerBundleIdentifier;
  if (!containerBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v8;
  NSStringFromSelector(sel_widgetFamily);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  v13[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!containerBundleIdentifier)
  return v10;
}

- (BOOL)matchesPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[PRSPosterGallerySuggestedComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualStrings())
  {
    -[PRSPosterGallerySuggestedComplication kind](self, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualStrings();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", self->_extensionBundleIdentifier, self->_kind, self->_containerBundleIdentifier, self->_widgetFamily, self->_intent, self->_source);
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterGallerySuggestedComplication *v4;
  uint64_t v5;
  PRSPosterGallerySuggestedComplication *v6;
  PRSPosterGallerySuggestedComplication *v7;
  char v8;
  PRSPosterGallerySuggestedComplication *v9;
  void *v10;
  NSString *extensionBundleIdentifier;
  uint64_t v12;
  PRSPosterGallerySuggestedComplication *v13;
  id v14;
  NSString *kind;
  PRSPosterGallerySuggestedComplication *v16;
  id v17;
  NSString *containerBundleIdentifier;
  PRSPosterGallerySuggestedComplication *v19;
  id v20;
  int64_t widgetFamily;
  PRSPosterGallerySuggestedComplication *v22;
  id v23;
  INIntent *intent;
  PRSPosterGallerySuggestedComplication *v25;
  id v26;
  int64_t source;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  PRSPosterGallerySuggestedComplication *v34;
  _QWORD v35[4];
  PRSPosterGallerySuggestedComplication *v36;
  _QWORD v37[4];
  PRSPosterGallerySuggestedComplication *v38;
  _QWORD v39[4];
  PRSPosterGallerySuggestedComplication *v40;
  _QWORD v41[4];
  PRSPosterGallerySuggestedComplication *v42;
  _QWORD v43[4];
  PRSPosterGallerySuggestedComplication *v44;

  v4 = (PRSPosterGallerySuggestedComplication *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v12 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke;
      v43[3] = &unk_1E4D426A0;
      v13 = v9;
      v44 = v13;
      v14 = (id)objc_msgSend(v10, "appendObject:counterpart:", extensionBundleIdentifier, v43);
      kind = self->_kind;
      v41[0] = v12;
      v41[1] = 3221225472;
      v41[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_2;
      v41[3] = &unk_1E4D42E28;
      v16 = v13;
      v42 = v16;
      v17 = (id)objc_msgSend(v10, "appendString:counterpart:", kind, v41);
      containerBundleIdentifier = self->_containerBundleIdentifier;
      v39[0] = v12;
      v39[1] = 3221225472;
      v39[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_3;
      v39[3] = &unk_1E4D426A0;
      v19 = v16;
      v40 = v19;
      v20 = (id)objc_msgSend(v10, "appendObject:counterpart:", containerBundleIdentifier, v39);
      widgetFamily = self->_widgetFamily;
      v37[0] = v12;
      v37[1] = 3221225472;
      v37[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_4;
      v37[3] = &unk_1E4D426F0;
      v22 = v19;
      v38 = v22;
      v23 = (id)objc_msgSend(v10, "appendInteger:counterpart:", widgetFamily, v37);
      intent = self->_intent;
      v35[0] = v12;
      v35[1] = 3221225472;
      v35[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_5;
      v35[3] = &unk_1E4D426A0;
      v25 = v22;
      v36 = v25;
      v26 = (id)objc_msgSend(v10, "appendObject:counterpart:", intent, v35);
      source = self->_source;
      v30 = v12;
      v31 = 3221225472;
      v32 = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_6;
      v33 = &unk_1E4D426F0;
      v34 = v25;
      v28 = (id)objc_msgSend(v10, "appendInteger:counterpart:", source, &v30);
      v8 = objc_msgSend(v10, "isEqual", v30, v31, v32, v33);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_4(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_extensionBundleIdentifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_kind);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_containerBundleIdentifier);
  v7 = (id)objc_msgSend(v3, "appendInteger:", self->_widgetFamily);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_intent);
  v9 = (id)objc_msgSend(v3, "appendInteger:", self->_source);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGallerySuggestedComplication)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PRSPosterGallerySuggestedComplication *v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_kind);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_containerBundleIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_widgetFamily);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", v14);

  v16 = objc_opt_class();
  NSStringFromSelector(sel_intent);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_source);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "decodeIntegerForKey:", v19);

  v21 = -[PRSPosterGallerySuggestedComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v7, v10, v13, v15, v18, v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *extensionBundleIdentifier;
  id v5;
  void *v6;
  NSString *kind;
  void *v8;
  NSString *containerBundleIdentifier;
  void *v10;
  int64_t widgetFamily;
  void *v12;
  INIntent *intent;
  void *v14;
  int64_t source;
  id v16;

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v5 = a3;
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", extensionBundleIdentifier, v6);

  kind = self->_kind;
  NSStringFromSelector(sel_kind);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", kind, v8);

  containerBundleIdentifier = self->_containerBundleIdentifier;
  NSStringFromSelector(sel_containerBundleIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", containerBundleIdentifier, v10);

  widgetFamily = self->_widgetFamily;
  NSStringFromSelector(sel_widgetFamily);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", widgetFamily, v12);

  intent = self->_intent;
  NSStringFromSelector(sel_intent);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", intent, v14);

  source = self->_source;
  NSStringFromSelector(sel_source);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", source, v16);

}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (INIntent)intent
{
  return self->_intent;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end
