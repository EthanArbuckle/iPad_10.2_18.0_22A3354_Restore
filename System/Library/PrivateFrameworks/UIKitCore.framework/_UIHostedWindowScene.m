@implementation _UIHostedWindowScene

- (id)_hostedWindowSceneDelegate
{
  void *v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[UIScene delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0CE1C8))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        goto LABEL_9;
      -[UIScene delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = (id)objc_opt_class();
      v9 = v12;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "_UIHostedWindowScene delegate does not conform to _UIHostedWindowSceneDelegate, the delegate is an instance of %@", (uint8_t *)&v11, 0xCu);
    }
    else
    {
      v5 = _hostedWindowSceneDelegate___s_category;
      if (!_hostedWindowSceneDelegate___s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_hostedWindowSceneDelegate___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v7 = v6;
      -[UIScene delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = (id)objc_opt_class();
      v9 = v12;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "_UIHostedWindowScene delegate does not conform to _UIHostedWindowSceneDelegate, the delegate is an instance of %@", (uint8_t *)&v11, 0xCu);
    }

LABEL_9:
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  v4 = v3;
LABEL_11:

  return v4;
}

- (void)hostViewWillAppear
{
  void *v2;
  id v3;

  -[_UIHostedWindowScene _hostedWindowSceneDelegate](self, "_hostedWindowSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (void)hostViewWillDisappear
{
  void *v2;
  id v3;

  -[_UIHostedWindowScene _hostedWindowSceneDelegate](self, "_hostedWindowSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

}

- (void)hostViewDidDisappear
{
  void *v2;
  void *v3;
  id v4;

  -[_UIHostedWindowScene _hostedWindowSceneDelegate](self, "_hostedWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_rootPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_resetRemoteDismissing");

}

- (void)sendAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (pthread_main_np() == 1)
  {
    -[UIScene _FBSScene](self, "_FBSScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendActions:", v6);

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35___UIHostedWindowScene_sendAction___block_invoke;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

- (void)_setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[UIWindowScene _contentSizePreferenceProvider](self, "_contentSizePreferenceProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPreferredContentSize:", width, height);

}

- (CGSize)_preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIWindowScene _contentSizePreferenceProvider](self, "_contentSizePreferenceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_UIHostedWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  _UIHostedWindowScene *v4;
  _UIHostedWindowScene *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindowScene;
  v4 = -[UIWindowScene initWithSession:connectionOptions:](&v7, sel_initWithSession_connectionOptions_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIWindowScene _setKeepContextAssociationInBackground:](v4, "_setKeepContextAssociationInBackground:", 1);
  return v5;
}

- (void)_invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_UIHostedWindowScene _hostedWindowSceneDelegate](self, "_hostedWindowSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  v5.receiver = self;
  v5.super_class = (Class)_UIHostedWindowScene;
  -[UIWindowScene _invalidate](&v5, sel__invalidate);
}

- (BOOL)_pushesTraitCollectionToScreen
{
  return 0;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  -[UIWindowScene _displayInfoProvider](self, "_displayInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsetsPortrait");
  v9 = v6;
  v11 = v10;
  v12 = v7;
  v13 = v8;
  if (v10 != 0.0 || v6 != 0.0 || v8 != 0.0 || v7 != 0.0)
  {
    v14 = -[UIWindowScene _shouldRotateSafeAreaInsetsToInterfaceOrientation](self, "_shouldRotateSafeAreaInsetsToInterfaceOrientation");
    if (a3 == 4)
      v15 = v9;
    else
      v15 = v13;
    if (a3 == 4)
      v16 = v13;
    else
      v16 = v12;
    if (a3 == 4)
      v17 = v12;
    else
      v17 = v11;
    if (a3 == 4)
      v18 = v11;
    else
      v18 = v9;
    if (a3 == 3)
    {
      v15 = v12;
      v16 = v11;
      v17 = v9;
      v18 = v13;
    }
    if (a3 == 2)
    {
      v15 = v11;
      v16 = v9;
      v17 = v13;
      v18 = v12;
    }
    if (v14)
    {
      v13 = v15;
      v12 = v16;
      v11 = v17;
      v9 = v18;
    }
  }

  v19 = v9;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)_installLocalSheetPresentationControllerForWindow:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIHostedWindowScene _hostedWindowSceneDelegate](self, "_hostedWindowSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    objc_msgSend(v8, "_rootPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _remoteSheetClientProvider](self, "_remoteSheetClientProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setLocalSheetPresentationController:", v6);

  }
}

- (BOOL)_usesMinimumSafeAreaInsets
{
  return 0;
}

@end
