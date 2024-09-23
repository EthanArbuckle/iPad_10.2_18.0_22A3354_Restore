@implementation SBHSpecialWidgetDescriptor

- (SBHSpecialWidgetDescriptor)initWithType:(unint64_t)a3
{
  return (SBHSpecialWidgetDescriptor *)-[SBHSpecialWidgetDescriptor _initWithType:supportedSizeClasses:](self, "_initWithType:supportedSizeClasses:");
}

- (id)_initWithType:(unint64_t)a3 supportedSizeClasses:(unint64_t)a4
{
  void *v7;
  SBHSpecialWidgetDescriptor *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  void *v16;
  const __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  NSString *description;
  objc_super v22;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", &stru_1E8D8E958, 0, 0);
  v22.receiver = self;
  v22.super_class = (Class)SBHSpecialWidgetDescriptor;
  v8 = -[SBHSpecialWidgetDescriptor initWithExtensionIdentity:kind:supportedFamilies:intentType:](&v22, sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, v7, &stru_1E8D8E958, a4, 0);
  if (v8)
  {
    switch(a3)
    {
      case 1uLL:
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("SIRI_SUGGESTIONS_WIDGET_DISPLAY_NAME");
        goto LABEL_9;
      case 2uLL:
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("SHORTCUTS_FOLDER_WIDGET_DISPLAY_NAME");
        goto LABEL_9;
      case 3uLL:
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("FILES_WIDGET_DISPLAY_NAME");
        goto LABEL_9;
      case 4uLL:
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("APP_PREDICTIONS_WIDGET_DISPLAY_NAME");
        goto LABEL_9;
      case 5uLL:
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("WIDGET_ADD_SHEET_SUGGESTED_STACK_DISPLAY_NAME");
        goto LABEL_9;
      case 6uLL:
        SBHBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("SHORTCUTS_SINGLE_WIDGET_DISPLAY_NAME");
LABEL_9:
        objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v12 = CFSTR("None");
        break;
    }
    v13 = -[__CFString copy](v12, "copy");
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v13;

    switch(a3)
    {
      case 1uLL:
        SBHBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("SIRI_SUGGESTIONS_WIDGET_DESCRIPTION");
        goto LABEL_17;
      case 2uLL:
        SBHBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("SHORTCUTS_FOLDER_WIDGET_DESCRIPTION");
        goto LABEL_17;
      case 3uLL:
        SBHBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("FILES_WIDGET_DESCRIPTION");
        goto LABEL_17;
      case 4uLL:
        SBHBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("APP_PREDICTIONS_WIDGET_DESCRIPTION");
        goto LABEL_17;
      case 5uLL:
        SBHBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("WIDGET_ADD_SHEET_SUGGESTED_STACK_DESCRIPTION");
        goto LABEL_17;
      case 6uLL:
        SBHBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("SHORTCUTS_SINGLE_WIDGET_DESCRIPTION");
LABEL_17:
        objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v18 = CFSTR("None");
        break;
    }
    v19 = -[__CFString copy](v18, "copy");
    description = v8->_description;
    v8->_description = (NSString *)v19;

    v8->_type = a3;
  }

  return v8;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)widgetDescription
{
  return self->_description;
}

- (BOOL)sbh_canBeAddedToStack
{
  return (self->_type < 7) & (0x4Fu >> self->_type);
}

- (BOOL)sbh_supportsRemovableBackground
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (id)backgroundColor
{
  void *v2;

  if (self->_type == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accentColor
{
  void *v2;

  if (self->_type == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
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
  v8 = v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9 = objc_msgSend(v8, "type"), v9 == -[SBHSpecialWidgetDescriptor type](self, "type")))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHSpecialWidgetDescriptor;
    v10 = -[SBHSpecialWidgetDescriptor isEqual:](&v12, sel_isEqual_, v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHSpecialWidgetDescriptor;
  v3 = -[SBHSpecialWidgetDescriptor hash](&v7, sel_hash);
  -[SBHSpecialWidgetDescriptor displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHSpecialWidgetDescriptor;
  -[SBHSpecialWidgetDescriptor succinctDescriptionBuilder](&v5, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v3, "appendString:withName:", self->_description, CFSTR("description"));
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHSpecialWidgetDescriptor;
  -[SBHSpecialWidgetDescriptor descriptionBuilderWithMultilinePrefix:](&v6, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v4, "appendString:withName:", self->_description, CFSTR("description"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHSpecialWidgetDescriptor;
  v4 = a3;
  -[SBHSpecialWidgetDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (SBHSpecialWidgetDescriptor)initWithCoder:(id)a3
{
  id v4;
  SBHSpecialWidgetDescriptor *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHSpecialWidgetDescriptor;
  v5 = -[SBHSpecialWidgetDescriptor initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
