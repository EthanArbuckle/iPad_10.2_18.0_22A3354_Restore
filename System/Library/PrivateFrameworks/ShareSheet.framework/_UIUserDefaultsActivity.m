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
  v8 = -[UIActivity init](&v12, sel_init);
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
  return CFSTR("com.apple.UIKit.activity.UserDefaults");
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityTitle
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[_UIUserDefaultsActivity activityCategory](self, "activityCategory");
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 1)
    v5 = CFSTR("More");
  else
    v5 = CFSTR("Manage");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_activityImage
{
  if (_activityImage_onceToken != -1)
    dispatch_once(&_activityImage_onceToken, &__block_literal_global_22);
  return (id)_activityImage___image;
}

- (id)_actionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  v4 = (void *)MEMORY[0x1E0DC3870];
  _ShareSheetBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("UIActivityUserDefaults"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivity contentSizeCategory](self, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_actionImageForActionRepresentationImage:contentSizeCategory:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActivities, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
