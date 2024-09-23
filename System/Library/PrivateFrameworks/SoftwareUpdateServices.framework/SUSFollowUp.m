@implementation SUSFollowUp

+ (id)identifier
{
  return (id)SUSFollowUpUniqueIdentifier_;
}

+ (id)uniqueIdentifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

+ (id)categoryIdentifier
{
  return (id)SUSFollowUpCategoryIdentifier_;
}

+ (id)groupIdentifier
{
  return (id)*MEMORY[0x24BE1B2E8];
}

+ (id)titleWithDescriptor:(id)a3
{
  return 0;
}

+ (id)informativeTextWithDescriptor:(id)a3
{
  return 0;
}

+ (unint64_t)displayStyle
{
  return 0;
}

+ (id)representingBundlePath
{
  return 0;
}

+ (id)bundleIconName
{
  return 0;
}

+ (id)extensionIdentifier
{
  return 0;
}

+ (id)actions
{
  return 0;
}

+ (id)notificationWithDescriptor:(id)a3
{
  return 0;
}

+ (id)generateFollowUpWithDescriptor:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  if (v8)
  {
    objc_msgSend(a1, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUniqueIdentifier:", v9);

    objc_msgSend(a1, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActions:", v10);

    objc_msgSend(a1, "titleWithDescriptor:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v11);

    objc_msgSend(a1, "informativeTextWithDescriptor:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInformativeText:", v12);

    objc_msgSend(a1, "notificationWithDescriptor:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNotification:", v13);

    objc_msgSend(a1, "extensionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExtensionIdentifier:", v14);

    objc_msgSend(a1, "groupIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupIdentifier:", v15);

    objc_msgSend(a1, "categoryIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCategoryIdentifier:", v16);

    objc_msgSend(v8, "setDisplayStyle:", objc_msgSend(a1, "displayStyle"));
    objc_msgSend(a1, "representingBundlePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRepresentingBundlePath:", v17);

    objc_msgSend(a1, "bundleIconName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBundleIconName:", v18);

    objc_msgSend(v8, "setUserInfo:", v7);
  }

  return v8;
}

@end
