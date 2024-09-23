@implementation NSAttributedString

+ (id)fr_attributedString:(id)a3
{
  void (**v3)(id, NSMutableAttributedString *);
  NSMutableAttributedString *v4;
  id v5;
  void *v6;
  NSAttributedString *v7;
  NSAttributedString *v8;

  v3 = (void (**)(id, NSMutableAttributedString *))a3;
  v4 = objc_opt_new(NSMutableAttributedString);
  if (v3)
    v3[2](v3, v4);
  v5 = -[NSMutableAttributedString copy](v4, "copy");
  v6 = v5;
  if (v5)
    v7 = (NSAttributedString *)v5;
  else
    v7 = objc_opt_new(NSAttributedString);
  v8 = v7;

  return v8;
}

+ (id)fr_attributedStringWithString:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSAttributedStringKey v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v12 = NSFontAttributeName;
  v13 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));

  v10 = objc_msgSend(v8, "initWithString:attributes:", v7, v9);
  return v10;
}

+ (id)fr_accessibilityAttributedStringForSpeakingStringInLowerPitch:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc((Class)NSAttributedString);
  v8 = UIAccessibilityTokenLowPitch;
  v9 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = objc_msgSend(v4, "initWithString:attributes:", v3, v5);

  return v6;
}

+ (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  _UNKNOWN **v9;

  v3 = a3;
  v4 = objc_alloc((Class)NSAttributedString);
  v8 = UIAccessibilityTokenAnnouncementPriority;
  v9 = &off_1000E4BA8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = objc_msgSend(v4, "initWithString:attributes:", v3, v5);

  return v6;
}

- (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement
{
  id v2;
  id v3;

  v2 = -[NSAttributedString mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "addAttribute:value:range:", UIAccessibilityTokenAnnouncementPriority, &off_1000E4BA8, 0, objc_msgSend(v2, "length"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

@end
