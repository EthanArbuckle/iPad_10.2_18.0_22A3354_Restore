@implementation ICPushPayloadLocKeyWorkaroundFor75288677

- (ICPushPayloadLocKeyWorkaroundFor75288677)init
{
  ICPushPayloadLocKeyWorkaroundFor75288677 *v2;
  ICPushPayloadLocKeyWorkaroundFor75288677 *v3;
  NSBundle *v4;
  void *v5;
  id v6;
  NSBundle *v7;
  void *v8;
  id v9;
  NSBundle *v10;
  void *v11;
  id v12;
  NSBundle *v13;
  void *v14;
  id v15;
  NSBundle *v16;
  void *v17;
  id v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICPushPayloadLocKeyWorkaroundFor75288677;
  v2 = -[ICPushPayloadLocKeyWorkaroundFor75288677 init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MENTION_NOTIFICATION_TITLE"), CFSTR("You were mentioned"), CFSTR("Localizable"));

    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MENTION_NOTIFICATION_TITLE_WITH_SENDER"), CFSTR("%1$@ mentioned you"), CFSTR("Localizable"));

    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MENTION_NOTIFICATION_TITLE_ALL"), CFSTR("Somebody mentioned everyone"), CFSTR("Localizable"));

    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MENTION_NOTIFICATION_TITLE_ALL_WITH_SENDER"), CFSTR("%1$@ mentioned everyone"), CFSTR("Localizable"));

    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MENTION_NOTIFICATION_SNIPPET"), CFSTR("In “%1$@” – %2$@"), CFSTR("Localizable"));

  }
  return v3;
}

@end
