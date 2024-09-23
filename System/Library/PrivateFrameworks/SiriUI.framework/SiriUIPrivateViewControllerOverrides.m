@implementation SiriUIPrivateViewControllerOverrides

+ (id)viewControllerForSnippet:(id)a3
{
  return (id)objc_msgSend(a1, "viewControllerForSnippet:sizeClass:", a3, 0);
}

+ (id)viewControllerForSnippet:(id)a3 sizeClass:(int64_t)a4
{
  id v5;
  __objc2_class *v6;
  SiriUICardSnippetViewController *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = SiriUIPrivatePeoplePickerViewController;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(SiriUICardSnippetViewController);
      -[SiriUICardSnippetViewController configureContentWithSizeClass:](v7, "configureContentWithSizeClass:", a4);
      -[SiriUICardSnippetViewController setSnippet:](v7, "setSnippet:", v5);
      goto LABEL_10;
    }
    if (!SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = 0;
      goto LABEL_10;
    }
    v6 = SiriUILegacyCardSnippetViewController;
  }
  v7 = (SiriUICardSnippetViewController *)objc_msgSend([v6 alloc], "initWithSnippet:", v5);
LABEL_10:

  return v7;
}

@end
