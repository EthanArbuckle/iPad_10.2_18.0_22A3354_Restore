@implementation UIRemoteKeyboardPlaceholderView

void __69___UIRemoteKeyboardPlaceholderView__configureDebugOverlayIfNecessary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  id v18;

  if (qword_1ECD7A388 != -1)
    dispatch_once(&qword_1ECD7A388, &__block_literal_global_958_0);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("KeyboardPlaceholderDebugOverlay"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v0) = objc_msgSend(v1, "BOOLValue");
  if ((_DWORD)v0)
  {
    if (objc_msgSend((id)UIApp, "isFrontBoard"))
    {
      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)qword_1ECD7A2D8;
      qword_1ECD7A2D8 = v3;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CFBundleIcons"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundlePrimaryIcon"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CFBundleIconFiles"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        +[UIImage imageNamed:](UIImage, "imageNamed:", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageByPreparingThumbnailOfSize:", 1.0, 1.0);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", v2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "colorWithAlphaComponent:", 0.5);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)qword_1ECD7A2D8;
        qword_1ECD7A2D8 = v12;

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (double)(unint64_t)objc_msgSend(v15, "hash") * 5.42101086e-20;

        +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v16, 1.0, 1.0, 0.5);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v2 = (void *)qword_1ECD7A2D8;
        qword_1ECD7A2D8 = v17;
      }
    }

  }
}

@end
