@implementation CSSearchableItemAttributeSet(Shortcuts)

- (BOOL)wf_associateWithBundleIdentifier:()Shortcuts
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  _QWORD v19[2];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContextualAction+Spotlight.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v18 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v18);
  v7 = v18;
  if (v6)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setRelatedAppBundleIdentifier:", v8);

    objc_msgSend(a1, "alternateNames");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v6, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(v6, "localizedShortName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAlternateNames:", v15);

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSearchableItemAttributeSet(Shortcuts) wf_associateWithBundleIdentifier:]";
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_ERROR, "%s Can't associate spotlight item with app: %@", buf, 0x16u);
    }
  }

  return v6 != 0;
}

@end
