@implementation BCResources

+ (id)iconTextPopupHighlightUnderline
{
  id v2;
  void *v3;
  void *v4;

  v2 = IMCommonCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("ib_text_pop_icon_highlight_underline"), v3));

  return v4;
}

@end
