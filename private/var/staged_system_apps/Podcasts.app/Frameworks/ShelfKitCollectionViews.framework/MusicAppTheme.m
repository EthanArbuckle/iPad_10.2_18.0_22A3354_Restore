@implementation MusicAppTheme

+ (double)defaultLibraryAddKeepLocalControlHeight
{
  return 28.0;
}

+ (id)systemLightGrayColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)stopButtonImageWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 8.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("square.fill"), v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithSymbolConfiguration:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));

  return v7;
}

+ (id)pauseButtonImageWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 8.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("pause.fill"), v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithSymbolConfiguration:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));

  return v7;
}

+ (id)resumeButtonImageWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 12.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("arrow.down"), v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithSymbolConfiguration:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));

  return v7;
}

+ (id)addButtonImageWithPointSize:(double)a3 traitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("plus"), v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithSymbolConfiguration:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithRenderingMode:", 2));

  return v9;
}

+ (id)cloudDownloadImageForTintColor:(id)a3 pointSize:(double)a4 traitCollection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("icloud.and.arrow.down"), v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithSymbolConfiguration:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flattenedImageWithColor:", v8));

  return v12;
}

@end
