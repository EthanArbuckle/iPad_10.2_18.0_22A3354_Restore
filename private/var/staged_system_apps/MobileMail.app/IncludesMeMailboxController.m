@implementation IncludesMeMailboxController

- (id)criterion
{
  return +[MFMessageCriterion includesMeCriterion](MFMessageCriterion, "includesMeCriterion");
}

- (id)unscopedCountPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForIncludesMeMessages](EMMessageListItemPredicates, "predicateForIncludesMeMessages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
}

- (BOOL)shouldBeDisplayed
{
  return -[SharedMailboxController badgeCount](self, "badgeCount") > 0;
}

- (id)mailboxTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INCLUDES_ME_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)navigationTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INCLUDES_ME_NAVIGATION_TITLE"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (id)iconImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)qword_1005A9BD0;
  if (!qword_1005A9BD0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v5 = objc_claimAutoreleasedReturnValue(-[IncludesMeMailboxController _iconImageWithBackgroundColor:](self, "_iconImageWithBackgroundColor:", v4));
    v6 = (void *)qword_1005A9BD0;
    qword_1005A9BD0 = v5;

    v3 = (void *)qword_1005A9BD0;
  }
  return v3;
}

- (id)applicationShortcutIconImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)qword_1005A9BD8;
  if (!qword_1005A9BD8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v5 = objc_claimAutoreleasedReturnValue(-[IncludesMeMailboxController _iconImageWithBackgroundColor:](self, "_iconImageWithBackgroundColor:", v4));
    v6 = (void *)qword_1005A9BD8;
    qword_1005A9BD8 = v5;

    v3 = (void *)qword_1005A9BD8;
  }
  return v3;
}

- (id)shortcutIconName
{
  return 0;
}

- (id)_iconImageWithBackgroundColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double y;
  double v22;
  UIImage *ImageFromCurrentImageContext;
  void *v24;
  CGSize v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v6 = sub_10010A330(2, v5, 36.0);
  v7 = sub_10010A330(3, v5, 36.0);
  if (v6 < v7)
    v6 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = sub_100109D80(2, v5, v8, v3, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = sub_100109D80(3, v5, v11, v3, 0, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v10, "size");
  v15 = v14;
  objc_msgSend(v13, "size");
  v26.height = v15 + v16 + 2.0;
  v26.width = v6;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  objc_msgSend(v10, "size");
  v18 = v17;
  v20 = v19;
  y = CGRectZero.origin.y;
  objc_msgSend(v10, "drawInRect:", CGRectZero.origin.x, y, v17, v19);
  objc_msgSend(v10, "size");
  objc_msgSend(v13, "drawInRect:", CGRectZero.origin.x, y + v22 + 2.0, v18, v20);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v24;
}

- (CGPoint)iconOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)invalidateIcon
{
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IncludesMeMailboxController;
  -[SharedMailboxController invalidateIcon](&v4, "invalidateIcon");
  v2 = (void *)qword_1005A9BD0;
  qword_1005A9BD0 = 0;

  v3 = (void *)qword_1005A9BD8;
  qword_1005A9BD8 = 0;

}

@end
