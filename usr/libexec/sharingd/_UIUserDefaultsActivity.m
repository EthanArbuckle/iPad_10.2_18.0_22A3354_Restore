@implementation _UIUserDefaultsActivity

- (_UIUserDefaultsActivity)initWithUserDefaults:(id)a3 activityCategory:(int64_t)a4
{
  id v7;
  _UIUserDefaultsActivity *v8;
  _UIUserDefaultsActivity *v9;
  _UIUserDefaultsActivity *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIUserDefaultsActivity;
  v8 = -[_UIUserDefaultsActivity init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDefaults, a3);
    v9->_activityCategory = a4;
    v10 = v9;
  }

  return v9;
}

- (id)activityType
{
  return UIActivityTypeUserDefaults;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityTitle
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = -[_UIUserDefaultsActivity activityCategory](self, "activityCategory");
  v4 = sub_10020CE1C(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v2 == 1)
    v7 = CFSTR("More");
  else
    v7 = CFSTR("Manage");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable")));

  return v8;
}

- (id)_activityImage
{
  if (qword_1007C6CC8 != -1)
    dispatch_once(&qword_1007C6CC8, &stru_10071A260);
  return (id)qword_1007C6CC0;
}

- (id)_actionImage
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_class(self);
  v5 = sub_10020CE1C((uint64_t)v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("UIActivityUserDefaults"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIUserDefaultsActivity contentSizeCategory](self, "contentSizeCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_actionImageForActionRepresentationImage:contentSizeCategory:", v7, v8));

  return v9;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_UIActivityUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (NSArray)availableActivities
{
  return self->_availableActivities;
}

- (void)setAvailableActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActivities, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
