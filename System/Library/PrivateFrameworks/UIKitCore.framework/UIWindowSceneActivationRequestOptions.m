@implementation UIWindowSceneActivationRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_quickLookSceneConfiguration, 0);
}

- (void)setPlacement:(UIWindowScenePlacement *)placement
{
  UIWindowScenePlacement *v4;
  unint64_t v5;
  NSObject *v6;
  UIWindowScenePlacement *v7;
  UIWindowScenePlacement *v8;
  uint8_t v9[16];

  v4 = placement;
  if (v4 && !objc_msgSend((id)objc_opt_class(), "_placementType"))
  {
    v5 = setPlacement____s_category;
    if (!setPlacement____s_category)
    {
      v5 = __UILogCategoryGetNode("WindowScene", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setPlacement____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Custom scene placements are not supported. Please use one of the system provided ones.", v9, 2u);
    }

    v4 = 0;
  }
  v7 = (UIWindowScenePlacement *)-[UIWindowScenePlacement copy](v4, "copy");
  v8 = self->_placement;
  self->_placement = v7;

}

- (void)_setQuickLookSceneConfiguration:(id)a3
{
  UISceneConfiguration *v5;
  UISceneConfiguration *v6;
  void *v7;
  char v8;
  UISceneConfiguration *quickLookSceneConfiguration;
  void *v10;
  void *v11;

  v5 = (UISceneConfiguration *)a3;
  v6 = v5;
  if (v5)
  {
    -[UISceneConfiguration role](v5, "role");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("UISceneSessionRoleQuickLook"));

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISceneConfiguration role](v6, "role");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationRequestOptions.m"), 42, CFSTR("BUG IN CLIENT OF UIKIT: Attempting to set an internal scene configuration with an incorrect role. Expected \"%@\", Received: \"%@\"), CFSTR("UISceneSessionRoleQuickLook"), v11);

    }
  }
  quickLookSceneConfiguration = self->_quickLookSceneConfiguration;
  self->_quickLookSceneConfiguration = v6;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIWindowSceneActivationRequestOptions;
  v4 = -[UISceneActivationRequestOptions copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPreferredPresentationStyle:", -[UIWindowSceneActivationRequestOptions preferredPresentationStyle](self, "preferredPresentationStyle"));
  objc_msgSend(v4, "_setPreferredSizeCategory:", -[UIWindowSceneActivationRequestOptions _preferredSizeCategory](self, "_preferredSizeCategory"));
  objc_msgSend(v4, "_setPreserveLayout:", -[UIWindowSceneActivationRequestOptions _preserveLayout](self, "_preserveLayout"));
  -[UIWindowSceneActivationRequestOptions _quickLookSceneConfiguration](self, "_quickLookSceneConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "_setQuickLookSceneConfiguration:", v6);

  -[UIWindowSceneActivationRequestOptions placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPlacement:", v8);

  -[UIWindowSceneActivationRequestOptions _interactionIdentifier](self, "_interactionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "_setInteractionIdentifier:", v10);

  return v4;
}

- (BOOL)_effectivelyWantsProminence
{
  void *v3;
  void *v4;
  char v5;

  -[UIWindowSceneActivationRequestOptions placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "_requestCenterSlot");
  else
    v5 = -[UIWindowSceneActivationRequestOptions preferredPresentationStyle](self, "preferredPresentationStyle") == UIWindowScenePresentationStyleProminent;

  return v5;
}

- (BOOL)_effectivelyWantsFullscreen
{
  void *v3;
  void *v4;
  char v5;

  -[UIWindowSceneActivationRequestOptions placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "_requestFullscreen");
  else
    v5 = -[UIWindowSceneActivationRequestOptions _preferredSizeCategory](self, "_preferredSizeCategory") == 1;

  return v5;
}

- (BOOL)_effectivelyWantsPreservedLayout
{
  void *v3;
  void *v4;
  char v5;

  -[UIWindowSceneActivationRequestOptions placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = objc_msgSend(v3, "_preserveLayout");

  return v5;
}

- (BOOL)_effectivelyWantsBackground
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowSceneActivationRequestOptions placement](self, "placement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "_requestBackground");
  else
    v4 = 0;

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UIWindowSceneActivationRequestOptions *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIWindowSceneActivationRequestOptions;
  v4 = a3;
  -[UISceneActivationRequestOptions descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__UIWindowSceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

  v7 = v6;
  return v7;
}

uint64_t __79__UIWindowSceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("UIWindowScene-Specific"), 1);

  result = objc_msgSend(*(id *)(a1 + 40), "preferredPresentationStyle");
  if (result)
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 40), "preferredPresentationStyle");
    v8 = CFSTR("UIWindowScenePresentationStyleAutomatic");
    if (v7 == 1)
      v8 = CFSTR("UIWindowScenePresentationStyleStandard");
    if (v7 == 2)
      v9 = CFSTR("UIWindowScenePresentationStyleProminent");
    else
      v9 = v8;
    return objc_msgSend(v6, "appendString:withName:", v9, CFSTR("preferredPresentationStyle"));
  }
  return result;
}

- (UISceneConfiguration)_quickLookSceneConfiguration
{
  return self->_quickLookSceneConfiguration;
}

- (UIWindowScenePresentationStyle)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(UIWindowScenePresentationStyle)preferredPresentationStyle
{
  self->_preferredPresentationStyle = preferredPresentationStyle;
}

- (UIWindowScenePlacement)placement
{
  return self->_placement;
}

- (NSString)_interactionIdentifier
{
  return self->__interactionIdentifier;
}

- (void)_setInteractionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)_preferredSizeCategory
{
  return self->__preferredSizeCategory;
}

- (void)_setPreferredSizeCategory:(unint64_t)a3
{
  self->__preferredSizeCategory = a3;
}

- (BOOL)_preserveLayout
{
  return self->__preserveLayout;
}

- (void)_setPreserveLayout:(BOOL)a3
{
  self->__preserveLayout = a3;
}

@end
