@implementation _UIActivityBundleHelper

+ (id)activityBundleHelperForExtension:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "_extensionBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[_UIActivityBundleHelper activityBundleHelperForExtension:].cold.3(v3, v5);

  }
  objc_msgSend(v3, "_plugIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_UIActivityBundleHelper activityBundleHelperForExtension:].cold.2(v3, (uint64_t)v7, v9);

    v10 = (void *)MEMORY[0x1E0CA58F0];
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pluginKitProxyForIdentifier:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      share_sheet_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[_UIActivityBundleHelper activityBundleHelperForExtension:].cold.1(v3, (uint64_t)v7, v12);

      v8 = 0;
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleProxy:", v8);

  return v13;
}

- (_UIActivityBundleHelper)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIActivityBundleHelper init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (_UIActivityBundleHelper)initWithBundleProxy:(id)a3
{
  id v4;
  _UIActivityBundleHelper *v5;
  _UIActivityBundleHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIActivityBundleHelper;
  v5 = -[_UIActivityBundleHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIActivityBundleHelper setBundleProxy:](v5, "setBundleProxy:", v4);

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIActivityBundleHelper;
  -[_UIActivityBundleHelper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityBundleHelper bundleProxy](self, "bundleProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {bundle = %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageForApplicationIconFormat:(int)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  id *v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v6 = a4 != 1;
  v7 = a3 != 10;
  v8 = (id *)MEMORY[0x1E0D3A890];
  if (a3 == 10)
    v8 = (id *)MEMORY[0x1E0D3A870];
  v9 = (objc_class *)MEMORY[0x1E0D3A820];
  v10 = *v8;
  v11 = [v9 alloc];
  -[_UIActivityBundleHelper bundleProxy](self, "bundleProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithResourceProxy:", v12);

  v14 = objc_alloc_init(MEMORY[0x1E0D3A840]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  objc_msgSend(v14, "setScale:", v17);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sh_hostUserInterfaceIdiom");
  objc_msgSend(v14, "setSize:", 3);
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setTemplateVariant:", v6);
  objc_msgSend(v19, "setDrawBorder:", v7);
  objc_msgSend(v13, "imageForDescriptor:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(v13, "imageForImageDescriptor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)MEMORY[0x1E0DC3870];
  v22 = objc_msgSend(v20, "CGImage");
  objc_msgSend(v20, "scale");
  objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (LSBundleProxy)bundleProxy
{
  return self->_bundleProxy;
}

- (void)setBundleProxy:(id)a3
{
  objc_storeStrong((id *)&self->_bundleProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleProxy, 0);
}

+ (void)activityBundleHelperForExtension:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_19E419000, a3, OS_LOG_TYPE_FAULT, "Cannot access extension's bundleProxy (extensionIdentifier=%{public}@; pluginIdentifier=%{public}@)",
    v5,
    0x16u);

  OUTLINED_FUNCTION_1();
}

+ (void)activityBundleHelperForExtension:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_19E419000, a3, OS_LOG_TYPE_ERROR, "Cannot access extension's bundleProxy with UUID (extensionIdentifier=%{public}@; pluginIdentifier=%{public}@)",
    v5,
    0x16u);

  OUTLINED_FUNCTION_1();
}

+ (void)activityBundleHelperForExtension:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Cannot access extension bundle (extensionIdentifier=%{public}@)", (uint8_t *)&v4, 0xCu);

}

@end
