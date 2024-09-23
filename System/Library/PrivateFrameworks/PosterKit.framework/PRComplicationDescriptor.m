@implementation PRComplicationDescriptor

- (PRComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4
{
  id v6;
  id v7;
  PRComplicationDescriptor *v8;
  uint64_t v9;
  NSString *uniqueIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRComplicationDescriptor;
  v8 = -[PRComplicationDescriptor init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_widget, a4);
  }

  return v8;
}

- (PRComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 suggestedComplication:(id)a5
{
  id v8;
  PRComplicationDescriptor *v9;
  PRComplicationDescriptor *v10;

  v8 = a5;
  v9 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](self, "initWithUniqueIdentifier:widget:", a3, a4);
  v10 = v9;
  if (v9)
    -[PRComplicationDescriptor setSuggestedComplication:](v9, "setSuggestedComplication:", v8);

  return v10;
}

- (PRComplicationDescriptor)initWithPRSWidget:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PRComplicationDescriptor *v14;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D10148];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "extensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "family");
    objc_msgSend(v5, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v7, v8, v9, v10, v11);

    objc_msgSend(v5, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](self, "initWithUniqueIdentifier:widget:", v13, v12);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)hasMatchingDescriptor
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  -[PRComplicationDescriptor widgetDescriptor](self, "widgetDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationDescriptor widget](self, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "family");
  v5 = CHSWidgetFamilyMaskFromWidgetFamily();

  if (v3)
    v6 = (v5 & ~objc_msgSend(v3, "supportedFamilies")) == 0;
  else
    v6 = 0;

  return v6;
}

- (id)PRSWidget
{
  id v3;
  NSString *uniqueIdentifier;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0D7F738]);
  uniqueIdentifier = self->_uniqueIdentifier;
  -[CHSWidget kind](self->_widget, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget extensionBundleIdentifier](self->_widget, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget containerBundleIdentifier](self->_widget, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CHSWidget family](self->_widget, "family");
  -[CHSWidget intent](self->_widget, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:family:intent:", uniqueIdentifier, v5, v6, v7, v8, v9);

  return v10;
}

- (id)widgetDescriptor
{
  void *v3;
  void *v4;

  PRSharedWidgetExtensionProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetDescriptorForWidget:", self->_widget);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *uniqueIdentifier;
  uint64_t v7;
  id v8;
  id v9;
  CHSWidget *widget;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __36__PRComplicationDescriptor_isEqual___block_invoke;
  v19[3] = &unk_1E2184110;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", uniqueIdentifier, v19);
  widget = self->_widget;
  v14 = v7;
  v15 = 3221225472;
  v16 = __36__PRComplicationDescriptor_isEqual___block_invoke_2;
  v17 = &unk_1E2185148;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", widget, &v14);
  LOBYTE(widget) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)widget;
}

id __36__PRComplicationDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __36__PRComplicationDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_uniqueIdentifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_widget);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"), 1);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_widget, CFSTR("widget"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_suggestedComplication, CFSTR("suggestedComplication"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRComplicationDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  PRComplicationDescriptor *v8;

  v4 = [PRComplicationDescriptor alloc];
  v5 = (void *)-[NSString copy](self->_uniqueIdentifier, "copy");
  v6 = (void *)-[CHSWidget copy](self->_widget, "copy");
  v7 = (void *)-[ATXComplication copy](self->_suggestedComplication, "copy");
  v8 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:suggestedComplication:](v4, "initWithUniqueIdentifier:widget:suggestedComplication:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PRComplicationDescriptor uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uniqueIdentifier"));

  -[PRComplicationDescriptor widget](self, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("widget"));

  -[PRComplicationDescriptor suggestedComplication](self, "suggestedComplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("suggestedComplication"));

}

- (PRComplicationDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  PRComplicationDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedComplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:suggestedComplication:](self, "initWithUniqueIdentifier:widget:suggestedComplication:", v5, v7, v9);

    v10 = self;
  }

  return v10;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
  objc_storeStrong((id *)&self->_widget, a3);
}

- (ATXComplication)suggestedComplication
{
  return self->_suggestedComplication;
}

- (void)setSuggestedComplication:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedComplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedComplication, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
