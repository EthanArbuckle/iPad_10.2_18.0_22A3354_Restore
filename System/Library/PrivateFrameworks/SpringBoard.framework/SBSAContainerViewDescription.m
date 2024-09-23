@implementation SBSAContainerViewDescription

- (id)copyByPixelAligningGeometryWithScale:(double)a3
{
  id v6;
  void *v7;
  _QWORD v9[7];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSAContainerViewDescription;
  v6 = -[SBSAViewDescription copyByPixelAligningGeometryWithScale:](&v10, sel_copyByPixelAligningGeometryWithScale_);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBSAContainerViewDescription_copyByPixelAligningGeometryWithScale___block_invoke;
  v9[3] = &unk_1E8EA2CC8;
  v9[4] = self;
  v9[5] = a2;
  *(double *)&v9[6] = a3;
  v7 = (void *)objc_msgSend(v6, "copyWithBlock:", v9);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLineTintColor, 0);
  objc_storeStrong((id *)&self->_associatedSystemApertureElementIdentity, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  SBSAElementIdentification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CGSize size;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSAContainerViewDescription;
  v4 = -[SBSAViewDescription copyWithZone:](&v15, sel_copyWithZone_, a3);
  if (self->_associatedSystemApertureElementIdentity)
  {
    v5 = [SBSAElementIdentification alloc];
    -[SAElementIdentifying clientIdentifier](self->_associatedSystemApertureElementIdentity, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAElementIdentifying elementIdentifier](self->_associatedSystemApertureElementIdentity, "elementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v5, "initWithClientIdentifier:elementIdentifier:", v6, v7);
    v9 = (void *)*((_QWORD *)v4 + 16);
    *((_QWORD *)v4 + 16) = v8;

  }
  *(CGSize *)(v4 + 168) = self->_contentScale;
  size = self->_contentBounds.size;
  *((_OWORD *)v4 + 14) = self->_contentBounds.origin;
  *((CGSize *)v4 + 15) = size;
  *(CGPoint *)(v4 + 184) = self->_contentCenter;
  *((_QWORD *)v4 + 17) = self->_keyLineMode;
  v11 = -[UIColor copy](self->_keyLineTintColor, "copy");
  v12 = (void *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v11;

  *((_QWORD *)v4 + 19) = self->_sampledBackgroundLuminanceLevel;
  *((_QWORD *)v4 + 20) = self->_shadowStyle;
  v13 = *(_QWORD *)&self->_renderingConfiguration.alwaysRenderInSnapshots;
  *(_OWORD *)(v4 + 200) = *(_OWORD *)&self->_renderingConfiguration.renderingStyle;
  *((_QWORD *)v4 + 27) = v13;
  return v4;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __69__SBSAContainerViewDescription_copyByPixelAligningGeometryWithScale___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContainerViewDescription.m"), 41, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "contentBounds");
  objc_msgSend(*(id *)(a1 + 32), "contentCenter");
  SBUnintegralizedRectCenteredAboutPoint();
  UIRectRoundToScale();
  BSRectWithSize();
  objc_msgSend(v6, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setContentCenter:");

}

- (CGPoint)contentCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentCenter.x;
  y = self->_contentCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setShadowStyle:(int64_t)a3
{
  self->_shadowStyle = a3;
}

- (UIColor)keyLineTintColor
{
  return self->_keyLineTintColor;
}

- (void)_setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->alwaysRenderInSnapshots;
  *(_OWORD *)&self->_renderingConfiguration.renderingStyle = *(_OWORD *)&a3->renderingStyle;
  *(_QWORD *)&self->_renderingConfiguration.alwaysRenderInSnapshots = v3;
}

- (void)_setKeyLineMode:(int64_t)a3
{
  self->_keyLineMode = a3;
}

- (void)_setContentCenter:(CGPoint)a3
{
  self->_contentCenter = a3;
}

- (void)_setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (void)_setKeyLineTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (int64_t)keyLineMode
{
  return self->_keyLineMode;
}

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 200);
  return self;
}

- (CGSize)contentScale
{
  double width;
  double height;
  CGSize result;

  width = self->_contentScale.width;
  height = self->_contentScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setSampledBackgroundLuminanceLevel:(int64_t)a3
{
  self->_sampledBackgroundLuminanceLevel = a3;
}

- (void)_setContentScale:(CGSize)a3
{
  self->_contentScale = a3;
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  return self->_associatedSystemApertureElementIdentity;
}

- (int64_t)sampledBackgroundLuminanceLevel
{
  return self->_sampledBackgroundLuminanceLevel;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  SAElementIdentifying *associatedSystemApertureElementIdentity;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int64_t keyLineMode;
  id v15;
  void *v16;
  UIColor *keyLineTintColor;
  id v18;
  void *v19;
  int64_t sampledBackgroundLuminanceLevel;
  id v21;
  void *v22;
  int64_t shadowStyle;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  SBSAContainerViewDescription *v52;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke;
  v50[3] = &unk_1E8E9EA50;
  v51 = v4;
  v52 = self;
  v48[0] = v5;
  v48[1] = 3221225472;
  v48[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_2;
  v48[3] = &unk_1E8E9EA50;
  v48[4] = self;
  v6 = v51;
  v49 = v6;
  v30 = (void *)MEMORY[0x1D17E5550](v48);
  objc_msgSend(v31, "appendEqualsBlocks:", v50, v30, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  associatedSystemApertureElementIdentity = self->_associatedSystemApertureElementIdentity;
  v46[0] = v5;
  v46[1] = 3221225472;
  v46[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_3;
  v46[3] = &unk_1E8EA4320;
  v8 = v6;
  v47 = v8;
  objc_msgSend(v29, "appendObject:counterpart:", associatedSystemApertureElementIdentity, v46);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v5;
  v44[1] = 3221225472;
  v44[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_4;
  v44[3] = &unk_1E8EB5E60;
  v9 = v8;
  v45 = v9;
  objc_msgSend(v28, "appendCGSize:counterpart:", v44, self->_contentScale.width, self->_contentScale.height);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v5;
  v42[1] = 3221225472;
  v42[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_5;
  v42[3] = &unk_1E8EA6AD8;
  v10 = v9;
  v43 = v10;
  objc_msgSend(v27, "appendCGRect:counterpart:", v42, self->_contentBounds.origin.x, self->_contentBounds.origin.y, self->_contentBounds.size.width, self->_contentBounds.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_6;
  v40[3] = &unk_1E8E9EA78;
  v12 = v10;
  v41 = v12;
  objc_msgSend(v11, "appendCGPoint:counterpart:", v40, self->_contentCenter.x, self->_contentCenter.y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  keyLineMode = self->_keyLineMode;
  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_7;
  v38[3] = &unk_1E8EA3AB0;
  v15 = v12;
  v39 = v15;
  objc_msgSend(v13, "appendInteger:counterpart:", keyLineMode, v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  keyLineTintColor = self->_keyLineTintColor;
  v36[0] = v5;
  v36[1] = 3221225472;
  v36[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_8;
  v36[3] = &unk_1E8EA4320;
  v18 = v15;
  v37 = v18;
  objc_msgSend(v16, "appendObject:counterpart:", keyLineTintColor, v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sampledBackgroundLuminanceLevel = self->_sampledBackgroundLuminanceLevel;
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_9;
  v34[3] = &unk_1E8EA3AB0;
  v21 = v18;
  v35 = v21;
  objc_msgSend(v19, "appendInteger:counterpart:", sampledBackgroundLuminanceLevel, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  shadowStyle = self->_shadowStyle;
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_10;
  v32[3] = &unk_1E8EA3AB0;
  v33 = v21;
  v24 = v21;
  objc_msgSend(v22, "appendInteger:counterpart:", shadowStyle, v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(shadowStyle) = objc_msgSend(v25, "isEqual");

  return shadowStyle;
}

id __40__SBSAContainerViewDescription_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SBSAContainerViewDescription;
  return objc_msgSendSuper2(&v3, sel_isEqual_, v1);
}

BOOL __40__SBSAContainerViewDescription_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  __int128 v5;
  uint64_t v6;
  _QWORD v7[3];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    objc_msgSend(v1, "renderingConfiguration");
  else
    memset(v7, 0, sizeof(v7));
  v3 = *(_OWORD *)(v2 + 200);
  v6 = *(_QWORD *)(v2 + 216);
  v5 = v3;
  return SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)&v5, (uint64_t)v7);
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "associatedSystemApertureElementIdentity");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentScale");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentBounds");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentCenter");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyLineMode");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyLineTintColor");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sampledBackgroundLuminanceLevel");
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shadowStyle");
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
  SBSystemApertureContainerRenderingConfiguration *p_renderingConfiguration;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__SBSAContainerViewDescription_hash__block_invoke;
  v18[3] = &unk_1E8E9EAA0;
  v18[4] = self;
  objc_msgSend(v17, "appendHashingBlocks:", v18, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendObject:", self->_associatedSystemApertureElementIdentity);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendCGSize:", self->_contentScale.width, self->_contentScale.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGRect:", self->_contentBounds.origin.x, self->_contentBounds.origin.y, self->_contentBounds.size.width, self->_contentBounds.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGPoint:", self->_contentCenter.x, self->_contentCenter.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendInteger:", self->_keyLineMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendObject:", self->_keyLineTintColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendInteger:", self->_sampledBackgroundLuminanceLevel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendInteger:", self->_shadowStyle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_renderingConfiguration = &self->_renderingConfiguration;
  objc_msgSend(v9, "appendInteger:", self->_renderingConfiguration.renderingStyle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendInteger:", p_renderingConfiguration->cloningStyle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  return v13;
}

id __36__SBSAContainerViewDescription_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBSAContainerViewDescription;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (NSString)description
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
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  SBSystemApertureContainerRenderingConfiguration renderingConfiguration;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBSAContainerViewDescription;
  -[SBSAViewDescription description](&v18, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v16 = (void *)MEMORY[0x1E0CB3940];
  SAElementIdentityDescription();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_contentScale);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_contentBounds);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_contentCenter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureKeyLineMode(self->_keyLineMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor description](self->_keyLineTintColor, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureBackgroundLuminanceLevel(self->_sampledBackgroundLuminanceLevel);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureShadowStyle(self->_shadowStyle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  renderingConfiguration = self->_renderingConfiguration;
  SBStringFromSystemApertureContainerRenderingConfiguration(&renderingConfiguration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("; associatedSystemApertureElementID: %@; contentScale: %@; contentBounds: %@; contentCenter: %@; keyLineMode: %@; keyLineTintColor: %@; sampledBackgroundLuminanceLevel: %@; shadowStyle: %@, renderingConfiguration: %@"),
    v15,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertString:atIndex:", v13, objc_msgSend(v4, "rangeOfString:options:", CFSTR(">"), 4));

  return (NSString *)v4;
}

- (void)_setAssociatedSystemApertureElementIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end
