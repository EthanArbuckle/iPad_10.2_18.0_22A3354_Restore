@implementation SBSystemActionSimpleControlPreviewElement

- (SBSystemActionSimpleControlPreviewElement)initWithSystemAction:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SBSystemActionSimpleControlPreviewElement *v12;
  objc_super v14;

  v4 = (id *)a3;
  -[SBControlSystemAction iconView](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSystemActionSimplePreviewElement defaultSymbolFont]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setStyle:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC688]), "initWithView:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6E8]), "initWithText:style:", &stru_1E8EC7EC0, 4);
  v9 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  objc_msgSend(v9, "setLeadingContentViewProvider:", v7);
  objc_msgSend(v9, "setTrailingContentViewProvider:", v8);
  -[SBControlSystemAction properties]((uint64_t)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenConfigurationServer queue]((uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
  v12 = -[SBSystemActionSimplePreviewElement initWithSystemAction:contentProvider:keyColor:](&v14, sel_initWithSystemAction_contentProvider_keyColor_, v4, v9, v11);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_leadingIconView, v5);
    objc_storeStrong((id *)&v12->_trailingTextContentProvider, v8);
    -[SBSystemActionSimpleControlPreviewElement _updateContentWithProperties:previousProperties:]((uint64_t)v12, v10, 0);
    -[SBControlSystemAction addObserver:]((uint64_t)v4, v12);
  }

  return v12;
}

- (void)_updateContentWithProperties:(void *)a3 previousProperties:
{
  id v5;
  id v6;
  char v7;
  uint64_t *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  double v28;

  v5 = a2;
  if (a1)
  {
    v6 = a3;
    v7 = -[SBCameraHardwareButton foregroundCameraShutterButtonPIDs]((uint64_t)v5);
    v8 = (uint64_t *)MEMORY[0x1E0CEB140];
    v9 = 0.5;
    if ((v7 & 1) == 0)
      v9 = 1.0;
    if ((v7 & 2) != 0)
      v8 = (uint64_t *)MEMORY[0x1E0CEB148];
    v25 = *v8;
    if ((v7 & 2) != 0)
      v10 = 0.25;
    else
      v10 = v9;
    v11 = *(id *)(a1 + 184);
    v12 = (void *)MEMORY[0x1E0CEABB0];
    if (a3)
      v13 = 0.2;
    else
      v13 = 0.0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__SBSystemActionSimpleControlPreviewElement__updateContentWithProperties_previousProperties___block_invoke;
    v26[3] = &unk_1E8E9DE88;
    v14 = v11;
    v27 = v14;
    v28 = v10;
    objc_msgSend(v12, "animateWithDuration:animations:", v26, v13);
    -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenConfigurationServer listener]((uint64_t)v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(id *)(a1 + 192);
    -[SBHomeScreenConfigurationServer listener]((uint64_t)v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenConfigurationServer listener]((uint64_t)v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = BSEqualStrings();

    if ((v21 & 1) == 0)
    {
      if (a3)
      {
        objc_msgSend(v18, "swapInText:textColor:", v17, v16);
LABEL_17:
        -[SBCameraHardwareButton foregroundPendingRemovalCameraShutterButtonPIDs]((uint64_t)v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAccessibilityIdentifier:", v22);

        objc_msgSend(v14, "setAccessibilityTraits:", v25);
        objc_msgSend(v18, "providedView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAccessibilityTraits:", v25);

        -[SBHomeScreenConfigurationServer queue]((uint64_t)v5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemActionSimplePreviewElement setKeyColor:](a1, v24);

        goto LABEL_18;
      }
      objc_msgSend(v18, "setText:", v17);
    }
    objc_msgSend(v18, "setContentColor:", v16);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBSystemActionSimplePreviewElement systemAction]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlSystemAction removeObserver:]((uint64_t)v3, (uint64_t)self);

  v4.receiver = self;
  v4.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
  -[SBSystemActionSimpleControlPreviewElement dealloc](&v4, sel_dealloc);
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  BSInvalidatable *contentVisibilityAssertion;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
  if (-[SBSystemApertureProvidedContentElement layoutMode](&v12, sel_layoutMode) != a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSystemActionSimpleControlPreviewElement;
    -[SBSystemApertureProvidedContentElement setLayoutMode:reason:](&v11, sel_setLayoutMode_reason_, a3, a4);
    contentVisibilityAssertion = self->_contentVisibilityAssertion;
    if (a3 < 1)
    {
      if (!contentVisibilityAssertion)
        return;
      -[BSInvalidatable invalidate](contentVisibilityAssertion, "invalidate");
      v8 = self->_contentVisibilityAssertion;
      self->_contentVisibilityAssertion = 0;
    }
    else
    {
      if (contentVisibilityAssertion)
        return;
      -[SBSystemActionSimplePreviewElement systemAction]((uint64_t)self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBControlSystemAction acquireContentVisibilityAssertionForReason:]((uint64_t)v8, CFSTR("Preview element"));
      v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v10 = self->_contentVisibilityAssertion;
      self->_contentVisibilityAssertion = v9;

    }
  }
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  SBUISystemApertureTextContentProvider *trailingTextContentProvider;
  id v5;
  id v6;

  trailingTextContentProvider = self->_trailingTextContentProvider;
  v5 = a3;
  -[SBUISystemApertureTextContentProvider providedView](trailingTextContentProvider, "providedView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 != v5;
}

- (void)controlSystemAction:(id)a3 propertiesDidChange:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBControlSystemAction properties]((uint64_t)a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionSimpleControlPreviewElement _updateContentWithProperties:previousProperties:]((uint64_t)self, v7, v6);

}

uint64_t __93__SBSystemActionSimpleControlPreviewElement__updateContentWithProperties_previousProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_trailingTextContentProvider, 0);
  objc_storeStrong((id *)&self->_leadingIconView, 0);
}

@end
