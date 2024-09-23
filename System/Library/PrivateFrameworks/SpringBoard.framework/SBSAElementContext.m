@implementation SBSAElementContext

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (SBSAElementContext)initWithSystemApertureElementContext:(id)a3
{
  id v4;
  SBSAElementContext *v5;
  void *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  void *v9;
  uint64_t v10;
  NSString *elementIdentifier;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  UIColor *keyColor;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSAElementContext;
  v5 = -[SBSAElementContext init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    objc_msgSend(v4, "elementIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    elementIdentifier = v5->_elementIdentifier;
    v5->_elementIdentifier = (NSString *)v10;

    v5->_layoutMode = objc_msgSend(v4, "layoutMode");
    objc_msgSend(v4, "preferredEdgeOutsets");
    v5->_preferredEdgeOutsets.top = v12;
    v5->_preferredEdgeOutsets.leading = v13;
    v5->_preferredEdgeOutsets.bottom = v14;
    v5->_preferredEdgeOutsets.trailing = v15;
    v5->_interfaceOrientation = objc_msgSend(v4, "interfaceOrientation");
    v5->_systemApertureCustomLayout = objc_msgSend(v4, "systemApertureCustomLayout");
    v5->_systemApertureCustomLayoutCustomAnimationStyle = objc_msgSend(v4, "systemApertureCustomLayoutCustomAnimationStyle");
    v5->_systemApertureLayoutCustomizingOptions = objc_msgSend(v4, "systemApertureLayoutCustomizingOptions");
    v5->_activeDynamicAnimation = objc_msgSend(v4, "activeDynamicAnimation");
    objc_msgSend(v4, "keyColor");
    v16 = objc_claimAutoreleasedReturnValue();
    keyColor = v5->_keyColor;
    v5->_keyColor = (UIColor *)v16;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientIdentifier;
  uint64_t v6;
  id v7;
  NSString *elementIdentifier;
  id v9;
  int64_t layoutMode;
  id v11;
  id v12;
  void *v13;
  int64_t interfaceOrientation;
  id v15;
  void *v16;
  int64_t systemApertureCustomLayout;
  id v18;
  void *v19;
  int64_t systemApertureCustomLayoutCustomAnimationStyle;
  id v21;
  void *v22;
  int64_t systemApertureLayoutCustomizingOptions;
  id v24;
  void *v25;
  int64_t activeDynamicAnimation;
  id v27;
  void *v28;
  UIColor *keyColor;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __30__SBSAElementContext_isEqual___block_invoke;
  v55[3] = &unk_1E8EA4320;
  v7 = v4;
  v56 = v7;
  objc_msgSend(v36, "appendObject:counterpart:", clientIdentifier, v55);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  elementIdentifier = self->_elementIdentifier;
  v53[0] = v6;
  v53[1] = 3221225472;
  v53[2] = __30__SBSAElementContext_isEqual___block_invoke_2;
  v53[3] = &unk_1E8EA4320;
  v9 = v7;
  v54 = v9;
  objc_msgSend(v35, "appendObject:counterpart:", elementIdentifier, v53);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  layoutMode = self->_layoutMode;
  v51[0] = v6;
  v51[1] = 3221225472;
  v51[2] = __30__SBSAElementContext_isEqual___block_invoke_3;
  v51[3] = &unk_1E8EA3AB0;
  v11 = v9;
  v52 = v11;
  objc_msgSend(v34, "appendInteger:counterpart:", layoutMode, v51);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v6;
  v49[1] = 3221225472;
  v49[2] = __30__SBSAElementContext_isEqual___block_invoke_4;
  v49[3] = &unk_1E8E9EA50;
  v49[4] = self;
  v12 = v11;
  v50 = v12;
  objc_msgSend(v33, "appendEqualsBlocks:", v49, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceOrientation = self->_interfaceOrientation;
  v47[0] = v6;
  v47[1] = 3221225472;
  v47[2] = __30__SBSAElementContext_isEqual___block_invoke_5;
  v47[3] = &unk_1E8EA3AB0;
  v15 = v12;
  v48 = v15;
  objc_msgSend(v13, "appendInteger:counterpart:", interfaceOrientation, v47);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  systemApertureCustomLayout = self->_systemApertureCustomLayout;
  v45[0] = v6;
  v45[1] = 3221225472;
  v45[2] = __30__SBSAElementContext_isEqual___block_invoke_6;
  v45[3] = &unk_1E8EA3AB0;
  v18 = v15;
  v46 = v18;
  objc_msgSend(v16, "appendInteger:counterpart:", systemApertureCustomLayout, v45);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  systemApertureCustomLayoutCustomAnimationStyle = self->_systemApertureCustomLayoutCustomAnimationStyle;
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __30__SBSAElementContext_isEqual___block_invoke_7;
  v43[3] = &unk_1E8EA3AB0;
  v21 = v18;
  v44 = v21;
  objc_msgSend(v19, "appendInteger:counterpart:", systemApertureCustomLayoutCustomAnimationStyle, v43);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  systemApertureLayoutCustomizingOptions = self->_systemApertureLayoutCustomizingOptions;
  v41[0] = v6;
  v41[1] = 3221225472;
  v41[2] = __30__SBSAElementContext_isEqual___block_invoke_8;
  v41[3] = &unk_1E8EA3AB0;
  v24 = v21;
  v42 = v24;
  objc_msgSend(v22, "appendInteger:counterpart:", systemApertureLayoutCustomizingOptions, v41);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  activeDynamicAnimation = self->_activeDynamicAnimation;
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __30__SBSAElementContext_isEqual___block_invoke_9;
  v39[3] = &unk_1E8EA3AB0;
  v27 = v24;
  v40 = v27;
  objc_msgSend(v25, "appendInteger:counterpart:", activeDynamicAnimation, v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  keyColor = self->_keyColor;
  v37[0] = v6;
  v37[1] = 3221225472;
  v37[2] = __30__SBSAElementContext_isEqual___block_invoke_10;
  v37[3] = &unk_1E8EA4320;
  v38 = v27;
  v30 = v27;
  objc_msgSend(v28, "appendObject:counterpart:", keyColor, v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(keyColor) = objc_msgSend(v31, "isEqual");

  return (char)keyColor;
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elementIdentifier");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutMode");
}

BOOL __30__SBSAElementContext_isEqual___block_invoke_4(uint64_t a1)
{
  double *v1;
  double v2;
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;

  v1 = *(double **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "preferredEdgeOutsets");
  v5 = v1[11] == v4;
  if (v1[10] != v6)
    v5 = 0;
  if (v1[13] != v3)
    v5 = 0;
  return v1[12] == v2 && v5;
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemApertureCustomLayout");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemApertureCustomLayoutCustomAnimationStyle");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemApertureLayoutCustomizingOptions");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeDynamicAnimation");
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyColor");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendObject:", self->_clientIdentifier);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendObject:", self->_elementIdentifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendInteger:", self->_layoutMode);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendCGFloat:", self->_preferredEdgeOutsets.top);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendCGFloat:", self->_preferredEdgeOutsets.leading);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGFloat:", self->_preferredEdgeOutsets.bottom);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGFloat:", self->_preferredEdgeOutsets.trailing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendInteger:", self->_interfaceOrientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendInteger:", self->_systemApertureCustomLayout);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendInteger:", self->_systemApertureCustomLayoutCustomAnimationStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendInteger:", self->_systemApertureLayoutCustomizingOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendInteger:", self->_activeDynamicAnimation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendObject:", self->_keyColor);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)description
{
  NSString *clientIdentifier;
  NSString *elementIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  clientIdentifier = self->_clientIdentifier;
  elementIdentifier = self->_elementIdentifier;
  SAUIStringFromElementViewLayoutMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromDirectionalEdgeInsets(self->_preferredEdgeOutsets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAStringFromUIInterfaceOrientation(self->_interfaceOrientation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureCustomLayout(self->_systemApertureCustomLayout);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureCustomLayout(self->_systemApertureCustomLayoutCustomAnimationStyle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureLayoutCustomizingOptions(self->_systemApertureLayoutCustomizingOptions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSBSADynamicPersistentAnimation(self->_activeDynamicAnimation);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier: %@; elementIdentifier: %@; layoutMode: %@; preferredEdgeOutsets: %@; interfaceOrientation: %@; systemApertureCustomLayout: %@; systemApertureCustomLayoutCustomAnimationStyle: %@; systemApertureLayoutCustomizingOptions: %@; activeDynamicAnimation: %@; keyColor: %@>"),
    v14,
    self,
    clientIdentifier,
    elementIdentifier,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    self->_keyColor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSystemApertureElementContext:", self);
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAElementContext copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithSystemApertureElementContext:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)_setElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)_setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_preferredEdgeOutsets.top;
  leading = self->_preferredEdgeOutsets.leading;
  bottom = self->_preferredEdgeOutsets.bottom;
  trailing = self->_preferredEdgeOutsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)_setPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3
{
  self->_preferredEdgeOutsets = a3;
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)systemApertureCustomLayout
{
  return self->_systemApertureCustomLayout;
}

- (void)_setSystemApertureCustomLayout:(int64_t)a3
{
  self->_systemApertureCustomLayout = a3;
}

- (int64_t)systemApertureCustomLayoutCustomAnimationStyle
{
  return self->_systemApertureCustomLayoutCustomAnimationStyle;
}

- (void)_setSystemApertureCustomLayoutCustomAnimationStyle:(int64_t)a3
{
  self->_systemApertureCustomLayoutCustomAnimationStyle = a3;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return self->_systemApertureLayoutCustomizingOptions;
}

- (void)_setSystemApertureLayoutCustomizingOptions:(int64_t)a3
{
  self->_systemApertureLayoutCustomizingOptions = a3;
}

- (int64_t)activeDynamicAnimation
{
  return self->_activeDynamicAnimation;
}

- (void)_setActiveDynamicAnimation:(int64_t)a3
{
  self->_activeDynamicAnimation = a3;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)_setKeyColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
