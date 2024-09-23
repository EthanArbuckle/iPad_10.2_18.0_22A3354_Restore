@implementation SBHLibraryCategoryPodIconListView

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setImageLoadingBehavior:", 1);
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryCategoryPodIconListView;
  -[SBIconListView configureIconView:forIcon:](&v12, sel_configureIconView_forIcon_, v6, v7);
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPodSuggestions"));

  if (v9)
  {
    objc_msgSend(v7, "nodeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SBHLibraryCategoryIconViewController-Suggestions-innerIcon:"), "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v11);

  }
}

@end
