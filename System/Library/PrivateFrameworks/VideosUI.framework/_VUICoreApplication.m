@implementation _VUICoreApplication

- (id)appTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  id v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  _QWORD v58[12];
  _QWORD v59[5];
  uint64_t v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  const __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[_VUICoreApplication keyWindow](self, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "keyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v8 = (id *)MEMORY[0x1E0DC4730];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*v8, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  if (v3)
  {
LABEL_10:
    objc_msgSend(v3, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[_VUICoreApplication keyTraitEnvironment](self, "keyTraitEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(v12, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    v58[0] = CFSTR("userInterfaceIdiom");
    v14 = objc_msgSend(v11, "userInterfaceIdiom");
    if (UserInterfaceString_onceToken != -1)
      dispatch_once(&UserInterfaceString_onceToken, &__block_literal_global_306);
    v15 = (void *)UserInterfaceString_userInterfaceStrings;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = CFSTR("unspecified");
    v20 = v19;

    v59[0] = v20;
    v58[1] = CFSTR("screenWidth");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bounds");
    objc_msgSend(v21, "numberWithDouble:", v22);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v54;
    v58[2] = CFSTR("screenHeight");
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    objc_msgSend(v23, "numberWithDouble:", v24);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v52;
    v58[3] = CFSTR("displayScale");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "displayScale");
    objc_msgSend(v25, "numberWithDouble:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v51;
    v58[4] = CFSTR("layoutDirection");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceLayoutDirection");

    v28 = CFSTR("ltr");
    if (v27 == 1)
      v28 = CFSTR("rtl");
    v59[4] = v28;
    v58[5] = CFSTR("horizontalSizeClass");
    v29 = v28;
    SizeClassString(objc_msgSend(v11, "horizontalSizeClass"));
    v60 = objc_claimAutoreleasedReturnValue();
    v58[6] = CFSTR("verticalSizeClass");
    SizeClassString(objc_msgSend(v11, "verticalSizeClass"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v30;
    v58[7] = CFSTR("preferredContentSizeCategory");
    objc_msgSend(v11, "preferredContentSizeCategory");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v56 = v20;
    v57 = v13;
    if ((id)*MEMORY[0x1E0DC4908] == v31)
    {
      v33 = v29;
      v34 = CFSTR("extraSmall");
    }
    else if ((id)*MEMORY[0x1E0DC4930] == v31)
    {
      v33 = v29;
      v34 = CFSTR("small");
    }
    else if ((id)*MEMORY[0x1E0DC4920] == v31)
    {
      v33 = v29;
      v34 = CFSTR("medium");
    }
    else if ((id)*MEMORY[0x1E0DC4918] == v31)
    {
      v33 = v29;
      v34 = CFSTR("large");
    }
    else if ((id)*MEMORY[0x1E0DC4900] == v31)
    {
      v33 = v29;
      v34 = CFSTR("extraLarge");
    }
    else if ((id)*MEMORY[0x1E0DC48F8] == v31)
    {
      v33 = v29;
      v34 = CFSTR("extraExtraLarge");
    }
    else if ((id)*MEMORY[0x1E0DC48F0] == v31)
    {
      v33 = v29;
      v34 = CFSTR("extraExtraExtraLarge");
    }
    else if ((id)*MEMORY[0x1E0DC48D8] == v31)
    {
      v33 = v29;
      v34 = CFSTR("accessibilityMedium");
    }
    else if ((id)*MEMORY[0x1E0DC48D0] == v31)
    {
      v33 = v29;
      v34 = CFSTR("accessibilityLarge");
    }
    else
    {
      v33 = v29;
      if ((id)*MEMORY[0x1E0DC48C8] == v31)
      {
        v34 = CFSTR("accessibilityExtraLarge");
      }
      else if ((id)*MEMORY[0x1E0DC48C0] == v31)
      {
        v34 = CFSTR("accessibilityExtraExtraLarge");
      }
      else if ((id)*MEMORY[0x1E0DC48B8] == v31)
      {
        v34 = CFSTR("accessibilityExtraExtraExtraLarge");
      }
      else
      {
        v34 = CFSTR("unspecified");
      }
    }

    v62 = v34;
    v58[8] = CFSTR("windowWidth");
    v36 = (void *)MEMORY[0x1E0CB37E8];
    v37 = v34;
    objc_msgSend(v3, "bounds");
    objc_msgSend(v36, "numberWithDouble:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v39;
    v58[9] = CFSTR("windowHeight");
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "bounds");
    objc_msgSend(v40, "numberWithDouble:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v42;
    v58[10] = CFSTR("orientation");
    v43 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "statusBarOrientation");
    if ((unint64_t)(v43 - 3) >= 2)
      v44 = CFSTR("unspecified");
    else
      v44 = CFSTR("landscape");
    if ((unint64_t)(v43 - 1) >= 2)
      v45 = (__CFString *)v44;
    else
      v45 = CFSTR("portrait");
    v65 = v45;
    v58[11] = CFSTR("forceTouchCapable");
    v46 = v45;
    v47 = objc_msgSend(v11, "forceTouchCapability");
    v48 = CFSTR("false");
    if (v47 == 2)
      v48 = CFSTR("true");
    v66 = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 12, v60);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v57;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (UIWindow)keyWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_keyWindow);
}

- (UITraitEnvironment)keyTraitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
}

- (id)appLaunchParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[_VUICoreApplication appJSURL](self, "appJSURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("location"));
  -[_VUICoreApplication javaScriptLaunchOptions](self, "javaScriptLaunchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[_VUICoreApplication javaScriptLaunchOptions](self, "javaScriptLaunchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (NSDictionary)javaScriptLaunchOptions
{
  return self->_javaScriptLaunchOptions;
}

- (id)userDefaultsStorage
{
  return +[VUIAppUserDefaults sharedUserDefaults](VUIAppUserDefaults, "sharedUserDefaults");
}

- (id)appIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setKeyWindow:(id)a3
{
  objc_storeWeak((id *)&self->_keyWindow, a3);
}

- (void)setJavaScriptLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_VUICoreApplication)initWithLaunchContext:(id)a3
{
  id v4;
  _VUICoreApplication *v5;
  _VUICoreApplication *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_VUICoreApplication;
  v5 = -[_VUICoreApplication init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_launchContext, v4);

  return v6;
}

- (id)appJSURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  objc_msgSend(WeakRetained, "javaScriptApplicationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (VUITVApplicationControllerContext)launchContext
{
  return (VUITVApplicationControllerContext *)objc_loadWeakRetained((id *)&self->_launchContext);
}

- (void)setKeyTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_keyTraitEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_destroyWeak((id *)&self->_keyWindow);
  objc_storeStrong((id *)&self->_javaScriptLaunchOptions, 0);
  objc_destroyWeak((id *)&self->_launchContext);
}

@end
