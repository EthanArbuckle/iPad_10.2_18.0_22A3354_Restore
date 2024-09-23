@implementation CalendarMessageInviteReplyCell

- (id)titleStrings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  }
  else
  {
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v8, v7));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Shared Calendar"), &stru_1001B67C0, 0));
  }
  v9 = (void *)v6;

  *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1001B67C0, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v9));
  v17 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  return v15;
}

- (id)bodyStringDict
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "descriptionStrings:", CUIKCalendarNoboDescriptionProfile));

  return v3;
}

- (id)actions
{
  return &off_1001BC850;
}

- (unint64_t)options
{
  return 4;
}

@end
