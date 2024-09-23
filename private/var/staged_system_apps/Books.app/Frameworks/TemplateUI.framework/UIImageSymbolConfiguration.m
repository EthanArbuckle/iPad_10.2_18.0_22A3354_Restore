@implementation UIImageSymbolConfiguration

+ (id)tui_configurationWithRenderingMode:(unint64_t)a3 colors:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a4;
  v6 = v5;
  if (a3 == 3)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor"));
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    if (!objc_msgSend(v5, "count"))
      goto LABEL_10;
    v9 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v6));
LABEL_9:
    v7 = (void *)v9;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v8));

  }
LABEL_11:

  return v7;
}

+ (id)tui_configurationWithPointSize:(double)a3 weight:(int64_t)a4 scale:(int64_t)a5 renderingMode:(unint64_t)a6 colors:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", a4, a5, a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tui_configurationWithRenderingMode:colors:", a6, v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configurationByApplyingConfiguration:", v14));
  return v15;
}

@end
