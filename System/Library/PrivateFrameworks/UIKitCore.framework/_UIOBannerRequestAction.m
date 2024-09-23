@implementation _UIOBannerRequestAction

+ (id)actionForSystemBannerRequest:(void *)a3 completionHandler:
{
  id v4;
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = a2;
  v6 = (objc_class *)objc_opt_self();
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v7, "setObject:forSetting:", v5, 0);

  v8 = (void *)MEMORY[0x1E0D016A0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74___UIOBannerRequestAction_actionForSystemBannerRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E16C6A58;
  v14 = v4;
  v9 = v4;
  objc_msgSend(v8, "responderWithHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend([v6 alloc], "initWithInfo:responder:", v7, v10);

  return v11;
}

- (BOOL)isPermitted
{
  return 1;
}

- (BOOL)connectionIsEntitled:(id)a3
{
  return objc_msgSend(a3, "clientHasEntitlement:", CFSTR("com.apple.private.uikit.requestsystembanner"));
}

- (void)performActionFromConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIOBannerRequestAction connectionIsEntitled:](self, "connectionIsEntitled:", v4))
  {
    -[_UIOBannerRequestAction info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    if (qword_1ECD7DA30 != -1)
      dispatch_once(&qword_1ECD7DA30, &__block_literal_global_206);
    v7 = objc_retainAutorelease((id)qword_1ECD7DA28);
    if (!v7)
      goto LABEL_11;
    objc_msgSend(v7, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postBannerWithRequest:", v6);
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  v9 = _MergedGlobals_1040;
  if (!_MergedGlobals_1040)
  {
    v9 = __UILogCategoryGetNode("OverlayUI", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_MergedGlobals_1040);
  }
  v10 = *(NSObject **)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v6 = v10;
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "%{public}@ has attempted to request a system banner without necessary entitlements, ignoring the request", (uint8_t *)&v11, 0xCu);
    goto LABEL_10;
  }
LABEL_12:

}

@end
