@implementation UIKeyboardMediaServiceRemoteViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)requestInlineViewControllerWithConnectionHandler:(id)a3
{
  id v4;
  const __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  __CFString *v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
    v5 = CFSTR("InlineRecentStickersViewController");
  else
    v5 = CFSTR("InlineRecentsViewController");
  _UIKBMediaLog_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_INFO, "Requesting inline remote VC %@", buf, 0xCu);
  }

  v7 = UIKeyboardMediaServiceBundleIdentifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__UIKeyboardMediaServiceRemoteViewController_requestInlineViewControllerWithConnectionHandler___block_invoke;
  v11[3] = &unk_1E16C5430;
  v12 = (__CFString *)v5;
  v13 = v4;
  v8 = v4;
  objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v5, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __95__UIKeyboardMediaServiceRemoteViewController_requestInlineViewControllerWithConnectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _UIKBMediaLog_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unable to request %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_INFO, "Got back readyController %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = _UIUpdateCycleEnabled();
  if (v5 && v10)
    objc_msgSend(v5, "_setShownInline:", 1);
  objc_msgSend(v5, "_setViewClipsToBounds:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)requestCardViewControllerWithConnectionHandler:(id)a3
{
  id v4;
  const __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  __CFString *v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
    v5 = CFSTR("StickersAppCardViewController");
  else
    v5 = CFSTR("AppCardViewController");
  _UIKBMediaLog_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_INFO, "Requesting remote card VC %@", buf, 0xCu);
  }

  v7 = UIKeyboardMediaServiceBundleIdentifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__UIKeyboardMediaServiceRemoteViewController_requestCardViewControllerWithConnectionHandler___block_invoke;
  v11[3] = &unk_1E16C5430;
  v12 = (__CFString *)v5;
  v13 = v4;
  v8 = v4;
  objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v5, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __93__UIKeyboardMediaServiceRemoteViewController_requestCardViewControllerWithConnectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _UIKBMediaLog_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unable to request %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_INFO, "Got back readyController %@", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setHostBundleID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHostBundleID:", v4);

}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  if (qword_1ECD7E010 != -1)
    dispatch_once(&qword_1ECD7E010, &__block_literal_global_256);
  return (id)_MergedGlobals_1070;
}

void __76__UIKeyboardMediaServiceRemoteViewController_serviceViewControllerInterface__block_invoke()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v0 = _os_feature_enabled_impl();
  v1 = &protocolRef__UIStickerPickerServiceProtocol;
  if (!v0)
    v1 = &protocolRef_UIKeyboardMediaServiceProtocol;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", *v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_1070;
  _MergedGlobals_1070 = v2;

}

+ (id)exportedInterface
{
  if (qword_1ECD7E020 != -1)
    dispatch_once(&qword_1ECD7E020, &__block_literal_global_79_0);
  return (id)qword_1ECD7E018;
}

void __63__UIKeyboardMediaServiceRemoteViewController_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF18260);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)qword_1ECD7E018;
    qword_1ECD7E018 = v0;

    v2 = (void *)qword_1ECD7E018;
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_stageStickerWithIdentifier_representations_name_externalURI_accessibilityLabel_, 1, 0);

    v6 = (void *)qword_1ECD7E018;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_stageSticker_, 0, 0);
    v14 = (void *)v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF18140);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)qword_1ECD7E018;
    qword_1ECD7E018 = v15;
  }

}

- (BOOL)__shouldRemoteViewControllerFenceGeometryChange:(id *)a3 forAncestor:(id)a4
{
  id v6;
  int v7;

  v6 = a4;
  if (_UIUpdateCycleEnabled() && self->_shownInline && (a3->var0 & 4) != 0)
    v7 = objc_msgSend(v6, "__isKindOfUIScrollView") ^ 1;
  else
    LOBYTE(v7) = 1;

  return v7;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceDidTerminateWithError:", v4);

}

- (void)presentCard
{
  id v2;

  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentCard");

}

- (void)dismissCard
{
  id v2;

  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissCard");

}

- (void)pasteImageAtFileHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteImageAtFileHandle:", v4);

}

- (void)stageStickerWithFileHandle:(id)a3 url:(id)a4 accessibilityLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stageStickerWithFileHandle:url:accessibilityLabel:", v10, v9, v8);

}

- (void)requestInsertionPointCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestInsertionPointCompletion:", v4);

}

- (void)draggedStickerToPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggedStickerToPoint:", x, y);

}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  _UIKBMediaLog_0();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_INFO, "Staging sticker identifier %@", (uint8_t *)&v19, 0xCu);
  }

  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stageStickerWithIdentifier:representations:name:externalURI:accessibilityLabel:", v12, v16, v15, v14, v13);

}

- (void)stageSticker:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIKBMediaLog_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_INFO, "Staging sticker identifier %@", (uint8_t *)&v8, 0xCu);

  }
  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stageSticker:", v4);

}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v7 = v4;
    -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteHandlesRecentsStickerDonationWithCompletionHandler:", v7);

    }
    else
    {
      v7[2](v7, 1);
    }
    v4 = v7;
  }

}

- (void)stickerPickerCardDidLoad
{
  id v2;

  -[UIKeyboardMediaServiceRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerPickerCardDidLoad");

}

- (BOOL)_isShownInline
{
  return self->_shownInline;
}

- (void)_setShownInline:(BOOL)a3
{
  self->_shownInline = a3;
}

- (UIKeyboardMediaServiceRemoteViewControllerDelegate)delegate
{
  return (UIKeyboardMediaServiceRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
