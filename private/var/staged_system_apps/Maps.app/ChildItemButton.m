@implementation ChildItemButton

+ (id)button
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ChildItemButton;
  v2 = objc_msgSendSuper2(&v5, "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "_setAttributes");
  return v3;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 9.5;
  v3 = 4.0;
  v4 = 12.5;
  v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ChildItemButton setClipsToBounds:](self, "setClipsToBounds:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemButton layer](self, "layer"));
  objc_msgSend(v3, "setCornerRadius:", 8.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemButton titleLabel](self, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, &stru_1011E0D68);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemButton titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setLineBreakMode:", 4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemButton theme](self, "theme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyColor"));
  -[ChildItemButton setTitleColor:forState:](self, "setTitleColor:forState:", v7, 0);

  objc_msgSend((id)objc_opt_class(self), "contentEdgeInsets");
  -[ChildItemButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
  -[ChildItemButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "_buttonAction", 0x2000);
}

- (void)updateTheme
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChildItemButton theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childItemButtonBackgroundColor"));
  -[ChildItemButton setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_buttonAction
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChildItemButton delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemButton childItem](self, "childItem"));
  objc_msgSend(v4, "didTapChildItemButtonForChildItem:", v3);

}

- (void)setChildItem:(id)a3
{
  id v5;
  void *v6;
  GEOMapItemChildItem *v7;

  v7 = (GEOMapItemChildItem *)a3;
  if (self->_childItem != v7)
  {
    objc_storeStrong((id *)&self->_childItem, a3);
    v5 = objc_msgSend((id)objc_opt_class(self), "buttonTitleWithChildItem:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[ChildItemButton setTitle:forState:](self, "setTitle:forState:", v6, 0);

  }
}

- (void)setDelegate:(id)a3
{
  ChildItemButtonDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

+ (UIFont)buttonTitleFont
{
  void *v2;

  if (sub_1005EC254())
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13](UIFont, "system13"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  return (UIFont *)v2;
}

+ (id)buttonTitleWithChildItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "childItemType");
  if (v5 == (id)3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisherResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publisher"));
    v10 = objc_msgSend(v9, "totalCollectionCount");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      if (v10 == (id)1)
        v13 = CFSTR("Guide_One [Autocomplete]");
      else
        v13 = CFSTR("Guide_Many [Autocomplete]");
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));

      v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v10));
      goto LABEL_12;
    }
  }
  else
  {
    if (v5 == (id)2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childItemAction"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "buttonTitleWithChildAction:", v6));
      goto LABEL_12;
    }
    if (v5 == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childItemPlace"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
LABEL_12:
      v10 = (id)v7;

      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_13:

  return v10;
}

+ (id)buttonTitleWithChildAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v3 = a3;
  switch((unint64_t)objc_msgSend(v3, "childActionType"))
  {
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Directions [Autocomplete]");
      goto LABEL_17;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
      v8 = objc_msgSend(v7, "supportsARMode");

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      if (v8)
        v6 = CFSTR("Flyover [Autocomplete]");
      else
        v6 = CFSTR("Flyover Tour [Autocomplete]");
      goto LABEL_17;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childActionSearch"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayString"));
      goto LABEL_19;
    case 4uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Look Around [Autocomplete]");
      goto LABEL_17;
    case 5uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Call [Autocomplete]");
      goto LABEL_17;
    case 6uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Website [Autocomplete]");
LABEL_17:
      v10 = 0;
      goto LABEL_18;
    case 7uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guideLocation"));
      v13 = objc_msgSend(v12, "numberOfGuides");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      if (v13 == (id)1)
        v16 = CFSTR("Guide_One [Autocomplete]");
      else
        v16 = CFSTR("Guide_Many [Autocomplete]");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guideLocation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, objc_msgSend(v17, "numberOfGuides")));

      goto LABEL_20;
    case 8uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Autocomplete] Download Offline");
      v10 = CFSTR("Offline");
LABEL_18:
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), v10));
LABEL_19:
      v11 = (void *)v9;
LABEL_20:

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (GEOMapItemChildItem)childItem
{
  return self->_childItem;
}

- (ChildItemButtonDelegate)delegate
{
  return (ChildItemButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childItem, 0);
}

@end
