@implementation SLDCollaborationAttributionViewSlotDrawer

+ (id)resolvedStyleForStyle:(id)a3 tag:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v16 = (void *)MEMORY[0x1E0DC5C60];
  v4 = a3;
  v5 = objc_msgSend(v4, "accessibilityButtonShapes");
  v6 = objc_msgSend(v4, "accessibilityContrast");
  v7 = objc_msgSend(v4, "displayScale");
  v8 = objc_msgSend(v4, "layoutDirection");
  objc_msgSend(v4, "localization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "preferredContentSizeCategory");
  v11 = objc_msgSend(v4, "tintColor");
  v12 = objc_msgSend(v4, "userInterfaceIdiom");
  v13 = objc_msgSend(v4, "userInterfaceStyle");

  objc_msgSend(v16, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v5, v6, 1, v7, v8, 0, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)resolvedStyleForStyle:(id)a3 tag:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "resolvedStyleForStyle:tag:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3 tag:(id)a4
{
  return 0;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3 tag:(id)a4
{
  return 0;
}

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SLDCollaborationAttributionViewDrawing *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SLDCollaborationAttributionViewDrawing initWithStyle:tag:forRemote:]([SLDCollaborationAttributionViewDrawing alloc], "initWithStyle:tag:forRemote:", v8, v7, v5);

  return v9;
}

@end
