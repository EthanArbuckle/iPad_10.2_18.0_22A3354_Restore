@implementation SBHWidgetStackDescriptor

- (SBHWidgetStackDescriptor)initWithSmallStackDescriptors:(id)a3 mediumStackDescriptors:(id)a4 largeStackDescriptors:(id)a5 extraLargeStackDescriptors:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBHWidgetStackDescriptor *v14;
  uint64_t v15;
  NSArray *smallStackDescriptors;
  uint64_t v17;
  NSArray *mediumStackDescriptors;
  uint64_t v19;
  NSArray *largeStackDescriptors;
  uint64_t v21;
  NSArray *extraLargeStackDescriptors;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHWidgetStackDescriptor;
  v14 = -[SBHWidgetStackDescriptor init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    smallStackDescriptors = v14->_smallStackDescriptors;
    v14->_smallStackDescriptors = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    mediumStackDescriptors = v14->_mediumStackDescriptors;
    v14->_mediumStackDescriptors = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    largeStackDescriptors = v14->_largeStackDescriptors;
    v14->_largeStackDescriptors = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    extraLargeStackDescriptors = v14->_extraLargeStackDescriptors;
    v14->_extraLargeStackDescriptors = (NSArray *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSArray *smallStackDescriptors;
  uint64_t v7;
  id v8;
  id v9;
  NSArray *mediumStackDescriptors;
  id v11;
  id v12;
  NSArray *largeStackDescriptors;
  id v14;
  id v15;
  NSArray *extraLargeStackDescriptors;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  smallStackDescriptors = self->_smallStackDescriptors;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __36__SBHWidgetStackDescriptor_isEqual___block_invoke;
  v29[3] = &unk_1E8D85AD0;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", smallStackDescriptors, v29);
  mediumStackDescriptors = self->_mediumStackDescriptors;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __36__SBHWidgetStackDescriptor_isEqual___block_invoke_2;
  v27[3] = &unk_1E8D85AD0;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", mediumStackDescriptors, v27);
  largeStackDescriptors = self->_largeStackDescriptors;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __36__SBHWidgetStackDescriptor_isEqual___block_invoke_3;
  v25[3] = &unk_1E8D85AD0;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", largeStackDescriptors, v25);
  extraLargeStackDescriptors = self->_extraLargeStackDescriptors;
  v20 = v7;
  v21 = 3221225472;
  v22 = __36__SBHWidgetStackDescriptor_isEqual___block_invoke_4;
  v23 = &unk_1E8D85AD0;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", extraLargeStackDescriptors, &v20);
  LOBYTE(extraLargeStackDescriptors) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return (char)extraLargeStackDescriptors;
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

- (id)descriptorsForSizeClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return MEMORY[0x1E0C9AA60];
  else
    return *((id *)&self->_sbh_galleryItemIdentifier + a3);
}

- (unint64_t)sbh_supportedSizeClasses
{
  _BOOL4 v3;
  unint64_t v4;

  v3 = -[NSArray count](self->_smallStackDescriptors, "count") != 0;
  if (-[NSArray count](self->_mediumStackDescriptors, "count"))
    v4 = (2 * v3) | 4;
  else
    v4 = 2 * v3;
  if (-[NSArray count](self->_largeStackDescriptors, "count"))
    v4 |= 8uLL;
  if (-[NSArray count](self->_extraLargeStackDescriptors, "count"))
    return v4 | 0x10;
  else
    return v4;
}

- (unint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[SBHWidgetStackDescriptor sbh_supportedSizeClasses](self, "sbh_supportedSizeClasses");
  return v5 & ~-[SBHWidgetStackDescriptor sbh_disfavoredSizeClassesForAddWidgetSheetLocation:](self, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", a3);
}

- (unint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  return 0;
}

- (BOOL)sbh_canBeAddedToStack
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackground
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (NSString)sbh_appName
{
  void *v2;
  void *v3;

  SBHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WIDGET_ADD_SHEET_SUGGESTED_STACK_DISPLAY_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sbh_widgetName
{
  return 0;
}

- (NSString)sbh_widgetDescription
{
  void *v2;
  void *v3;

  SBHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WIDGET_ADD_SHEET_SUGGESTED_STACK_DESCRIPTION"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sbh_galleryItemIdentifier
{
  NSString *sbh_galleryItemIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  sbh_galleryItemIdentifier = self->_sbh_galleryItemIdentifier;
  if (!sbh_galleryItemIdentifier)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[SBHWidgetStackDescriptor sbh_appName](self, "sbh_appName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetStackDescriptor sbh_widgetName](self, "sbh_widgetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetStackDescriptor sbh_widgetDescription](self, "sbh_widgetDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("'%@'-'%@'-'%@'-%lu"), v5, v6, v7, -[SBHWidgetStackDescriptor sbh_supportedSizeClasses](self, "sbh_supportedSizeClasses"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sbh_galleryItemIdentifier;
    self->_sbh_galleryItemIdentifier = v8;

    sbh_galleryItemIdentifier = self->_sbh_galleryItemIdentifier;
  }
  return sbh_galleryItemIdentifier;
}

- (BOOL)sbh_isLinkedOnOrAfter:(unint64_t)a3
{
  return 1;
}

- (UIColor)accentColor
{
  return 0;
}

- (UIColor)backgroundColor
{
  return 0;
}

- (UIColor)mostInterestingColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.360784314, 0.807843137, 0.937254902, 1.0);
}

- (NSArray)smallStackDescriptors
{
  return self->_smallStackDescriptors;
}

- (void)setSmallStackDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_smallStackDescriptors, a3);
}

- (NSArray)mediumStackDescriptors
{
  return self->_mediumStackDescriptors;
}

- (void)setMediumStackDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_mediumStackDescriptors, a3);
}

- (NSArray)largeStackDescriptors
{
  return self->_largeStackDescriptors;
}

- (void)setLargeStackDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_largeStackDescriptors, a3);
}

- (NSArray)extraLargeStackDescriptors
{
  return self->_extraLargeStackDescriptors;
}

- (void)setExtraLargeStackDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_extraLargeStackDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeStackDescriptors, 0);
  objc_storeStrong((id *)&self->_largeStackDescriptors, 0);
  objc_storeStrong((id *)&self->_mediumStackDescriptors, 0);
  objc_storeStrong((id *)&self->_smallStackDescriptors, 0);
  objc_storeStrong((id *)&self->_sbh_galleryItemIdentifier, 0);
}

@end
