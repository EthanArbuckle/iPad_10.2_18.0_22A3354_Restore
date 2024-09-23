@implementation _UIDICActionActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIDICActionActivity;
  -[UIActivity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDICActionActivity activityTitle](self, "activityTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ '%@'"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)newPreviewActionActivity
{
  _UIDICActionActivity *v2;
  void *v3;
  void *v4;
  _UIDICActionActivity *v5;

  v2 = [_UIDICActionActivity alloc];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Quick Look"), CFSTR("Quick Look"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDICActionActivity initWithActivityType:activityImageName:localizedTitle:](v2, "initWithActivityType:activityImageName:localizedTitle:", CFSTR("com.apple.UIKit.activity.Quicklook"), CFSTR("eye"), v4);

  return v5;
}

+ (id)newLegacyDelegationActionActivityForPrint
{
  _UIDICActionActivity *v2;
  void *v3;
  void *v4;
  _UIDICActionActivity *v5;

  v2 = [_UIDICActionActivity alloc];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Print[Activity]"), CFSTR("Print"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDICActionActivity initWithActivityType:activityImageName:localizedTitle:](v2, "initWithActivityType:activityImageName:localizedTitle:", CFSTR("com.apple.UIKit.activity.DelegatingPrint"), CFSTR("printer"), v4);

  return v5;
}

+ (id)newLegacyDelegationActionActivityForCopy
{
  _UIDICActionActivity *v2;
  void *v3;
  void *v4;
  _UIDICActionActivity *v5;

  v2 = [_UIDICActionActivity alloc];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Copy[Activity]"), CFSTR("Copy"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDICActionActivity initWithActivityType:activityImageName:localizedTitle:](v2, "initWithActivityType:activityImageName:localizedTitle:", CFSTR("com.apple.UIKit.activity.DelegatingCopy"), CFSTR("doc.on.doc"), v4);

  return v5;
}

+ (id)newLegacyDelegationActionActivityForSaveToCameraRoll
{
  _UIDICActionActivity *v2;
  void *v3;
  void *v4;
  _UIDICActionActivity *v5;

  v2 = [_UIDICActionActivity alloc];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Save to Camera Roll[Activity]"), CFSTR("Save to Camera Roll"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDICActionActivity initWithActivityType:activityImageName:localizedTitle:](v2, "initWithActivityType:activityImageName:localizedTitle:", CFSTR("com.apple.UIKit.activity.DelegatingSaveToCameraRoll"), CFSTR("square.and.arrow.down"), v4);

  return v5;
}

- (_UIDICActionActivity)initWithActivityType:(id)a3 activityImageName:(id)a4 localizedTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIDICActionActivity *v12;
  _UIDICActionActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIDICActionActivity;
  v12 = -[UIActivity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionActivityType, a3);
    objc_storeStrong((id *)&v13->_activityImageName, a4);
    objc_storeStrong((id *)&v13->_localizedTitle, a5);
  }

  return v13;
}

- (id)activityType
{
  return self->_actionActivityType;
}

- (id)activityTitle
{
  return self->_localizedTitle;
}

- (id)_systemImageName
{
  return self->_activityImageName;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  uint64_t (**activityPerformingHandler)(id, _UIDICActionActivity *);
  uint64_t v4;
  id v5;

  activityPerformingHandler = (uint64_t (**)(id, _UIDICActionActivity *))self->_activityPerformingHandler;
  if (activityPerformingHandler)
  {
    v4 = activityPerformingHandler[2](activityPerformingHandler, self);
    v5 = self->_activityPerformingHandler;
    self->_activityPerformingHandler = 0;

  }
  else
  {
    v4 = 1;
  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v4);
}

- (void)_cleanup
{
  void (**activityFinishedPerformingHandler)(id, _UIDICActionActivity *);
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDICActionActivity;
  -[UIActivity _cleanup](&v5, sel__cleanup);
  activityFinishedPerformingHandler = (void (**)(id, _UIDICActionActivity *))self->_activityFinishedPerformingHandler;
  if (activityFinishedPerformingHandler)
  {
    activityFinishedPerformingHandler[2](activityFinishedPerformingHandler, self);
    v4 = self->_activityFinishedPerformingHandler;
    self->_activityFinishedPerformingHandler = 0;

  }
}

- (id)activityPerformingHandler
{
  return self->_activityPerformingHandler;
}

- (void)setActivityPerformingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)activityFinishedPerformingHandler
{
  return self->_activityFinishedPerformingHandler;
}

- (void)setActivityFinishedPerformingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityFinishedPerformingHandler, 0);
  objc_storeStrong(&self->_activityPerformingHandler, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_activityImageName, 0);
  objc_storeStrong((id *)&self->_actionActivityType, 0);
}

@end
