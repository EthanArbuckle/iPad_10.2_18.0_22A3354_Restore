@implementation UIStoryboardViewControllerPlaceholder

- (UIStoryboardViewControllerPlaceholder)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _WORD *v11;
  void *v12;
  __int16 v13;
  UIStoryboardViewControllerPlaceholder *v14;

  v4 = a3;
  +[UIProxyObject mappedObjectForCoder:withIdentifier:](UIProxyObject, "mappedObjectForCoder:withIdentifier:", v4, CFSTR("UIStoryboardPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIStoryboardIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_storyboardDecodingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceSegueTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_storyboardDecodingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_instantiateViewControllerReferencedByPlaceholderWithIdentifier:storyboardSegueTemplate:sender:", v6, v8, v10);
  v11 = (_WORD *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIParentViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13 = v11[188];
    v11[188] = v13 | 0x100;
    objc_msgSend(v11, "setParentViewController:", v12);
    v11[188] = v11[188] & 0xFEFF | v13 & 0x100;
  }

  v14 = v11;
  return v14;
}

@end
