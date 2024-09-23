@implementation PRPosterQuickActionsConfiguration

- (PRPosterQuickActionsConfiguration)initWithLeadingControl:(id)a3 trailingControl:(id)a4
{
  id v6;
  id v7;
  PRPosterQuickActionsConfiguration *v8;
  PRPosterQuickActionsConfiguration *v9;
  PRQuickActionControlConfiguration *v10;
  PRQuickActionControlConfiguration *leadingControl;
  PRQuickActionControlConfiguration *v12;
  PRQuickActionControlConfiguration *trailingControl;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PRPosterQuickActionsConfiguration;
  v8 = -[PRPosterQuickActionsConfiguration init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = (PRQuickActionControlConfiguration *)v6;
    }
    else
    {
      -[PRPosterQuickActionsConfiguration _fetchFlashlightControl](v8, "_fetchFlashlightControl");
      v10 = (PRQuickActionControlConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    leadingControl = v9->_leadingControl;
    v9->_leadingControl = v10;

    if (v7)
    {
      v12 = (PRQuickActionControlConfiguration *)v7;
    }
    else
    {
      -[PRPosterQuickActionsConfiguration _fetchCameraControl](v9, "_fetchCameraControl");
      v12 = (PRQuickActionControlConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    trailingControl = v9->_trailingControl;
    v9->_trailingControl = v12;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterQuickActionsConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PRPosterQuickActionsConfiguration *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("leadingControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("trailingControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PRPosterQuickActionsConfiguration initWithLeadingControl:trailingControl:](self, "initWithLeadingControl:trailingControl:", v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterQuickActionsConfiguration leadingControl](self, "leadingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("leadingControl"));

  -[PRPosterQuickActionsConfiguration trailingControl](self, "trailingControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("trailingControl"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterQuickActionsConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PRPosterQuickActionsConfiguration *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("leadingControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("trailingControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PRPosterQuickActionsConfiguration initWithLeadingControl:trailingControl:](self, "initWithLeadingControl:trailingControl:", v6, v8);
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterQuickActionsConfiguration leadingControl](self, "leadingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("leadingControl"));

  -[PRPosterQuickActionsConfiguration trailingControl](self, "trailingControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("trailingControl"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRPosterMutableQuickActionsConfiguration *v4;
  void *v5;
  void *v6;
  PRPosterMutableQuickActionsConfiguration *v7;

  v4 = [PRPosterMutableQuickActionsConfiguration alloc];
  -[PRPosterQuickActionsConfiguration leadingControl](self, "leadingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterQuickActionsConfiguration trailingControl](self, "trailingControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRPosterQuickActionsConfiguration initWithLeadingControl:trailingControl:](v4, "initWithLeadingControl:trailingControl:", v5, v6);

  return v7;
}

- (void)setLeadingControl:(id)a3
{
  id v5;
  PRQuickActionControlConfiguration **p_leadingControl;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_leadingControl = &self->_leadingControl;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_leadingControl, a3);
    PRLogEditing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = v5;
      v10 = 2050;
      v11 = objc_msgSend(v5, "category");
      _os_log_impl(&dword_18B634000, v7, OS_LOG_TYPE_DEFAULT, "Quick Actions: Set leading control to %{public}@ with category %{public}ld", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)setTrailingControl:(id)a3
{
  id v5;
  PRQuickActionControlConfiguration **p_trailingControl;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_trailingControl = &self->_trailingControl;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_trailingControl, a3);
    PRLogEditing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = v5;
      v10 = 2050;
      v11 = objc_msgSend(v5, "category");
      _os_log_impl(&dword_18B634000, v7, OS_LOG_TYPE_DEFAULT, "Quick Actions: Set trailing control to %{public}@ with category %{public}ld", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CHSWidgetExtensionProvider invalidate](self->_extensionProvider, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRPosterQuickActionsConfiguration;
  -[PRPosterQuickActionsConfiguration dealloc](&v3, sel_dealloc);
}

- (id)_fetchFlashlightControl
{
  void *v2;
  PRQuickActionControlConfiguration *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[PRPosterQuickActionsConfiguration _findControlIdentityForExtensionID:containerID:kind:](self, "_findControlIdentityForExtensionID:containerID:kind:", CFSTR("com.apple.ControlCenter.ControlCenterControlsExtension"), CFSTR("com.apple.springboard"), CFSTR("com.apple.ControlCenter.ControlCenterControlsExtension.flashlight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[PRQuickActionControlConfiguration initWithControlIdentity:type:]([PRQuickActionControlConfiguration alloc], "initWithControlIdentity:type:", v2, 1);
  }
  else
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PRPosterQuickActionsConfiguration _fetchFlashlightControl].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v3 = 0;
  }

  return v3;
}

- (id)_fetchCameraControl
{
  uint64_t v3;
  NSObject *v4;
  PRQuickActionControlConfiguration *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[PRPosterQuickActionsConfiguration _findControlIdentityForExtensionID:containerID:kind:](self, "_findControlIdentityForExtensionID:containerID:kind:", CFSTR("com.apple.camera.LauncherControlExtension"), CFSTR("com.apple.camera"), CFSTR("com.apple.camera.deeplink.button"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[PRPosterQuickActionsConfiguration _findControlIdentityForExtensionID:containerID:kind:](self, "_findControlIdentityForExtensionID:containerID:kind:", CFSTR("com.apple.camera.LauncherControlExtension"), CFSTR("com.apple.camera"), CFSTR("com.apple.camera.deeplink.button")), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    v5 = -[PRQuickActionControlConfiguration initWithControlIdentity:type:]([PRQuickActionControlConfiguration alloc], "initWithControlIdentity:type:", v3, 2);
  }
  else
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PRPosterQuickActionsConfiguration _fetchCameraControl].cold.1(v4, v7, v8, v9, v10, v11, v12, v13);
    v5 = 0;
  }

  return v5;
}

- (id)_findControlIdentityForExtensionID:(id)a3 containerID:(id)a4 kind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  CHSWidgetExtensionProvider *v15;
  CHSWidgetExtensionProvider *extensionProvider;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_extensionProvider)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0FFE8]), "initIncludingVisible:hidden:", 1, 1);
    v12 = objc_alloc(MEMORY[0x1E0D101C0]);
    v13 = objc_alloc_init(MEMORY[0x1E0D10180]);
    v14 = (void *)objc_msgSend(v12, "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v13, v11, 1);

    v15 = (CHSWidgetExtensionProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D101B0]), "initWithOptions:", v14);
    extensionProvider = self->_extensionProvider;
    self->_extensionProvider = v15;

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v8, v9, 0);
  -[CHSWidgetExtensionProvider extensions](self->_extensionProvider, "extensions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke;
  v33[3] = &unk_1E2183F70;
  v20 = v17;
  v34 = v20;
  objc_msgSend(v18, "bs_firstObjectPassingTest:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "orderedControlDescriptors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v19;
  v29 = 3221225472;
  v30 = __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke_2;
  v31 = &unk_1E2183F98;
  v23 = v10;
  v32 = v23;
  objc_msgSend(v22, "bs_firstObjectPassingTest:", &v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "defaultIntentReference", v28, v29, v30, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intentReference:", v20, v23, v25);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __89__PRPosterQuickActionsConfiguration__findControlIdentityForExtensionID_containerID_kind___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (PRQuickActionControlConfiguration)leadingControl
{
  return self->_leadingControl;
}

- (PRQuickActionControlConfiguration)trailingControl
{
  return self->_trailingControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingControl, 0);
  objc_storeStrong((id *)&self->_leadingControl, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

- (void)_fetchFlashlightControl
{
  OUTLINED_FUNCTION_0_2(&dword_18B634000, a1, a3, "Quick Actions: Failed to fetch flashlight control", a5, a6, a7, a8, 0);
}

- (void)_fetchCameraControl
{
  OUTLINED_FUNCTION_0_2(&dword_18B634000, a1, a3, "Quick Actions: Failed to fetch camera control", a5, a6, a7, a8, 0);
}

@end
