@implementation SBSApplicationShortcutItem(SBHAdditions)

- (id)badgeView
{
  return objc_getAssociatedObject(a1, "SBSApplicationShortcutItem.BadgeView");
}

- (void)setBadgeView:()SBHAdditions
{
  objc_setAssociatedObject(a1, "SBSApplicationShortcutItem.BadgeView", a3, (void *)1);
}

- (void)_setupAssetManagerWithApplicationBundleURL:()SBHAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "_assetManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("Assets.car"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4020]), "initWithURL:idiom:error:", v5, v7, 0);
    objc_setAssociatedObject(a1, "SBSApplicationShortcutItem.AssetManager", v8, (void *)1);

  }
}

- (id)_assetManager
{
  return objc_getAssociatedObject(a1, "SBSApplicationShortcutItem.AssetManager");
}

- (id)_monogrammerForKey:()SBHAdditions style:
{
  void *v7;

  objc_getAssociatedObject(a1, key);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)getCNMonogrammerClass()), "initWithStyle:diameter:", a4, 35.0);
    objc_setAssociatedObject(a1, key, v7, (void *)1);
  }
  return v7;
}

- (uint64_t)_lightMonogrammer
{
  return objc_msgSend(a1, "_monogrammerForKey:style:", "SBSApplicationShortcutItem.Monogrammer.Light", 2);
}

- (uint64_t)_darkMonogrammer
{
  return objc_msgSend(a1, "_monogrammerForKey:style:", "SBSApplicationShortcutItem.Monogrammer.Dark", 3);
}

- (void)sb_buildIconImageWithApplicationBundleURL:()SBHAdditions image:systemImageName:
{
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void (**v31)(void *, void *);
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(void *, void *);
  void *v46;
  void *v47;
  _QWORD aBlock[4];
  id v49;

  v8 = a3;
  objc_msgSend(a1, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x1E0DAA000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "systemImageName");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "_setupAssetManagerWithApplicationBundleURL:", v8);
  objc_msgSend(a1, "_assetManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    objc_msgSend(v13, "systemImageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v13, "systemImageName");
      v15 = 0;
      v16 = (void *)v11;
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    objc_msgSend(v13, "sbh_image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;
LABEL_20:
    objc_msgSend(v22, "imageWithRenderingMode:", 2);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "templateImageName");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v15 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v12, "imageNamed:withTrait:", v13, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v17;
    if (v8 && !v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.png"), v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByAppendingPathComponent:", v18);
      v46 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v19, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageWithContentsOfFile:", v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0x1E0DAA000;
      v12 = v46;
    }
    v22 = v16;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    objc_msgSend(v13, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v15 = 0;
      goto LABEL_21;
    }
    v23 = objc_msgSend(v13, "dataType");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    v26 = v25;

    v27 = v12;
    if (v23 == 1)
    {
      SBLogIcon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[SBSApplicationShortcutItem(SBHAdditions) sb_buildIconImageWithApplicationBundleURL:image:systemImageName:].cold.1(v40);

    }
    else if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:scale:", v16, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
      if (objc_msgSend(v13, "isTemplate"))
        v41 = 2;
      else
        v41 = 1;
      objc_msgSend(v28, "imageWithRenderingMode:", v41);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = v27;
      v10 = 0x1E0DAA000;
      goto LABEL_21;
    }
    v28 = 0;
    goto LABEL_49;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v9;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__SBSApplicationShortcutItem_SBHAdditions__sb_buildIconImageWithApplicationBundleURL_image_systemImageName___block_invoke;
    aBlock[3] = &unk_1E8D89148;
    v49 = v30;
    v31 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(a1, "_lightMonogrammer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2](v31, v32);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageConfiguration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_darkMonogrammer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v31;
    v31[2](v31, v34);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "imageConfiguration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_alloc_init(MEMORY[0x1E0DC3878]);
    objc_msgSend(v36, "registerImage:withConfiguration:", v47, v44);
    objc_msgSend(v36, "registerImage:withConfiguration:", v43, v42);
    v37 = objc_alloc_init(MEMORY[0x1E0DC3E88]);
    objc_msgSend(v37, "imageConfiguration");
    v38 = v12;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageWithConfiguration:", v39);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = v38;
    v10 = 0x1E0DAA000;

  }
  else
  {
    v15 = 0;
  }
LABEL_23:
  if (v11 && !v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  if (!v11 || v15)
  {
    if (!(v11 | v15))
    {
      objc_msgSend(*(id *)(v10 + 3512), "sbh_defaultImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "imageWithRenderingMode:", 2);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    if (a4)
      goto LABEL_34;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v11);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_35;
LABEL_34:
      *a4 = objc_retainAutorelease((id)v15);
      goto LABEL_35;
    }
    v15 = 0;
    if (a4)
      goto LABEL_34;
  }
LABEL_35:
  if (a5)
    *a5 = objc_retainAutorelease((id)v11);

}

- (void)sb_buildIconImageWithApplicationBundleURL:()SBHAdditions image:systemImageName:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Use SBSApplicationShortcutCustomImageIconDataTypeUIImageData", v1, 2u);
}

@end
