@implementation RCRecentlyDeletedCollectionViewCell

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = objc_alloc((Class)UIAccessibilityCustomAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AX_ACTION_RECOVER"), &stru_1001B2BC0, 0));
  v6 = objc_msgSend(v3, "initWithName:target:selector:", v5, self, "performRecoverAXAction");

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (void)performRecoverAXAction
{
  -[RCRecordingCollectionViewCell performControlsAction:position:source:](self, "performControlsAction:position:source:", 20, self, 0.0);
}

- (void)_createShuttleBarIfNeeded
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCRecentlyDeletedCollectionViewCell;
  -[RCRecordingCollectionViewCell _createShuttleBarIfNeeded](&v4, "_createShuttleBarIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
  objc_msgSend(v3, "setRecentlyDeleted:", 1);

}

@end
