@implementation WFAppShortcutColorFetcher

- (id)colorsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[WFAppShortcutColorFetcher colorCache](WFAppShortcutColorFetcher, "colorCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, a4);
    v11 = v10;
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v10, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleWithURL:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "infoDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("CFBundleIcons"), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CFBundlePrimaryIcon"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CFBundleAlternateIcons"));
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v32 = (void *)v18;
              objc_opt_class();
              v19 = v32;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v20 = v32;
              else
                v20 = 0;
            }
            else
            {
              v20 = 0;
              v19 = 0;
            }
            v30 = v20;

            objc_msgSend(v11, "alternateIconName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = v17;
            v33 = 0;
            if (v23 && v30)
            {
              objc_msgSend(v11, "alternateIconName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v24);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

            }
            colorDefaults();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v6);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            -[WFAppShortcutColorFetcher extractColorsForIconDictionary:alternateIconDictionary:bundle:colorDefaults:](self, "extractColorsForIconDictionary:alternateIconDictionary:bundle:colorDefaults:", v17, v33, v14, v29);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAppShortcutColorFetcher extractTintColorForIconDictionary:alternateIconDictionary:bundle:](self, "extractTintColorForIconDictionary:alternateIconDictionary:bundle:", v31, v33, v14);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAppShortcutColorFetcher finishWithComplementingColors:tintColor:bundleIdentifier:error:](self, "finishWithComplementingColors:tintColor:bundleIdentifier:error:", v26, v27, v6, a4);
            v9 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {

            -[WFAppShortcutColorFetcher finishWithComplementingColors:tintColor:bundleIdentifier:error:](self, "finishWithComplementingColors:tintColor:bundleIdentifier:error:", 0, 0, v6, a4);
            v9 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {

          -[WFAppShortcutColorFetcher finishWithComplementingColors:tintColor:bundleIdentifier:error:](self, "finishWithComplementingColors:tintColor:bundleIdentifier:error:", 0, 0, v6, a4);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        getWFGeneralLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v35 = "-[WFAppShortcutColorFetcher colorsForBundleIdentifier:error:]";
          v36 = 2112;
          v37 = v6;
          _os_log_impl(&dword_1AF681000, v22, OS_LOG_TYPE_DEFAULT, "%s Unable to grab bundle for %@, returning defaults if available", buf, 0x16u);
        }

        -[WFAppShortcutColorFetcher finishWithComplementingColors:tintColor:bundleIdentifier:error:](self, "finishWithComplementingColors:tintColor:bundleIdentifier:error:", 0, 0, v6, a4);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      getWFGeneralLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[WFAppShortcutColorFetcher colorsForBundleIdentifier:error:]";
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_1AF681000, v21, OS_LOG_TYPE_DEFAULT, "%s Unable to grab record for %@, returning defaults if available", buf, 0x16u);
      }

      -[WFAppShortcutColorFetcher finishWithComplementingColors:tintColor:bundleIdentifier:error:](self, "finishWithComplementingColors:tintColor:bundleIdentifier:error:", 0, 0, v6, a4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

- (id)finishWithComplementingColors:(id)a3 tintColor:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  double v12;
  uint64_t v13;
  WFAppShortcutColors *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count"))
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    colorDefaults();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v17;
    if (v10)
      goto LABEL_3;
  }
  v26[0] = CFSTR("com.apple.camera");
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 757935871);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v26[1] = CFSTR("com.apple.mobilephone");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v19;
  v26[2] = CFSTR("com.apple.facetime");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v20;
  v26[3] = CFSTR("com.apple.VoiceMemos");
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 3947773439);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v21;
  v26[4] = CFSTR("com.apple.mobiletimer");
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", 4288613119);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v22;
  v26[5] = CFSTR("com.apple.DocumentsApp");
  +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "objectForKeyedSubscript:", v11);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_3:
  objc_msgSend(v10, "alpha");
  if (v12 == 0.0)
  {

    v10 = 0;
  }
  v13 = objc_msgSend(v9, "count");
  if (v10 || v13)
  {
    v14 = -[WFAppShortcutColors initWithComplementingColors:tintColor:]([WFAppShortcutColors alloc], "initWithComplementingColors:tintColor:", v9, v10);
    +[WFAppShortcutColorFetcher colorCache](WFAppShortcutColorFetcher, "colorCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, v11);

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFAppShortcutColorFetcherErrorDomain"), 3, 0);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (NSCache)colorCache
{
  if (colorCache_onceToken != -1)
    dispatch_once(&colorCache_onceToken, &__block_literal_global_15682);
  return (NSCache *)(id)colorCache_colorCache;
}

- (id)extractTintColorForIconDictionary:(id)a3 alternateIconDictionary:(id)a4 bundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSAppIconActionTintColorName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_12;
    }
    else
    {

    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSAppIconActionTintColorName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v12, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

LABEL_12:
  return v11;
}

- (id)extractColorsForIconDictionary:(id)a3 alternateIconDictionary:(id)a4 bundle:(id)a5 colorDefaults:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  double v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_31;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSAppIconComplementingColorNames"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = 0;
LABEL_11:
    v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_29:

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
    v14 = v13;
    v13 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v14, v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v15, 0);
          v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

          goto LABEL_29;
        }
      }
      goto LABEL_11;
    }
    if (objc_msgSend(v13, "count") == 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v14 = v18;

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
      }
      else
      {
        v20 = 0;
      }
      v15 = v20;

      v16 = (id)MEMORY[0x1E0C9AA60];
      if (v14 && v15)
      {
        +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v14, v11);
        v21 = objc_claimAutoreleasedReturnValue();
        +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v15, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v21, v22, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_28;
    }
  }
  v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_30:

LABEL_31:
  if (objc_msgSend(v16, "count"))
    goto LABEL_44;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NSAppIconComplementingColorNames"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v24, "count"))
    {
      if (objc_msgSend(v24, "count") == 1)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v25, v11);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v26, 0);
            v27 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v27;
          }
        }
      }
      else
      {
        if ((unint64_t)objc_msgSend(v24, "count") < 2)
          goto LABEL_43;
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v37 = v36;
          else
            v37 = 0;
        }
        else
        {
          v37 = 0;
        }
        v25 = v37;

        objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v39 = v38;
          else
            v39 = 0;
        }
        else
        {
          v39 = 0;
        }
        v40 = v39;

        if (v25 && v40)
        {
          +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v25, v11);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFColor colorNamed:inBundle:](WFColor, "colorNamed:inBundle:", v40, v11);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v43, v41, 0);
          v42 = objc_claimAutoreleasedReturnValue();

          v16 = (id)v42;
        }

      }
      goto LABEL_42;
    }
  }
  else
  {

    v24 = 0;
  }
  if (v12)
  {
    v25 = v16;
    v16 = v12;
LABEL_42:

  }
LABEL_43:

LABEL_44:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = v16;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "alpha");
        if (v33 == 0.0)
        {

          v34 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_54;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v30)
        continue;
      break;
    }
  }

  v34 = v28;
LABEL_54:

  return v34;
}

void __39__WFAppShortcutColorFetcher_colorCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)colorCache_colorCache;
  colorCache_colorCache = (uint64_t)v0;

}

@end
