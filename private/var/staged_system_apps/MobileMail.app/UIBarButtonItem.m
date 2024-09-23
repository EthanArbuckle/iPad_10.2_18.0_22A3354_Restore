@implementation UIBarButtonItem

+ (void)mf_configureMultiBarButtonItem:(id)a3 usingStyle:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  v11 = v5;
  switch(a4)
  {
    case 0:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_7;
    case 1:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_5;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
LABEL_5:
      v9 = (void *)v8;
      v10 = 2;
      goto LABEL_8;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
LABEL_7:
      v9 = (void *)v7;
      v10 = 0;
LABEL_8:

      v5 = v11;
      break;
    default:
      v9 = 0;
      v10 = 0;
      break;
  }
  objc_msgSend(v5, "setStyle:", v10);
  objc_msgSend(v11, "setTitle:", v9);

}

+ (id)mf_newMultiBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[3];

  v5 = a3;
  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_100531B00, CFSTR("Main")));
  v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, v5, a4);

  v10 = objc_alloc((Class)NSSet);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_100531B00, CFSTR("Main")));
  v20[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100531B00, CFSTR("Main")));
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
  v20[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
  v18 = objc_msgSend(v10, "initWithArray:", v17);
  objc_msgSend(v9, "setPossibleTitles:", v18);

  return v9;
}

+ (id)mf_newFlexibleSpaceItem
{
  return objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

+ (id)mf_newFixedSpaceItem
{
  return _objc_msgSend(a1, "mf_newFixedSpaceItemWithWidth:", 28.0);
}

+ (id)mf_newFixedSpaceItemWithWidth:(double)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v4, "setWidth:", a3);
  return v4;
}

+ (id)mailDefaultBarButtonItemFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0);
}

+ (id)mailBoldBarButtonItemFont
{
  return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0);
}

+ (id)mf_newSelectionBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[2];

  v5 = a3;
  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
  v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, v5, a4);

  v10 = objc_alloc((Class)NSSet);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DESELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
  v18[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v16 = objc_msgSend(v10, "initWithArray:", v15);
  objc_msgSend(v9, "setPossibleTitles:", v16);

  return v9;
}

+ (void)mf_configureSelectionBarButtonItem:(id)a3 usingStyle:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (a4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DESELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v7, "setTitle:", v6);
    goto LABEL_5;
  }
  if (!a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v7, "setTitle:", v6);
LABEL_5:

  }
}

@end
