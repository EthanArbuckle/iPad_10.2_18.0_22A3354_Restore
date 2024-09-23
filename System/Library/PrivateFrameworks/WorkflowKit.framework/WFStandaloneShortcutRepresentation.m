@implementation WFStandaloneShortcutRepresentation

- (WFStandaloneShortcutRepresentation)initWithBundleIdentifier:(id)a3
{
  return -[WFStandaloneShortcutRepresentation initWithTitle:associatedAppBundleIdentifier:launchIdForCurrentPlatform:activityBundleIdentifier:](self, "initWithTitle:associatedAppBundleIdentifier:launchIdForCurrentPlatform:activityBundleIdentifier:", 0, a3, a3, a3);
}

- (WFStandaloneShortcutRepresentation)initWithINShortcut:(id)a3
{
  id v4;
  void *v5;
  WFStandaloneShortcutRepresentation *v6;

  v4 = a3;
  objc_msgSend(v4, "_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFStandaloneShortcutRepresentation initWithINShortcut:title:](self, "initWithINShortcut:title:", v4, v5);

  return v6;
}

- (WFStandaloneShortcutRepresentation)initWithINShortcut:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFStandaloneShortcutRepresentation *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_associatedAppBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_intents_launchIdForCurrentPlatform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WFStandaloneShortcutRepresentation initWithTitle:associatedAppBundleIdentifier:launchIdForCurrentPlatform:activityBundleIdentifier:](self, "initWithTitle:associatedAppBundleIdentifier:launchIdForCurrentPlatform:activityBundleIdentifier:", v6, v8, v10, v11);
  return v12;
}

- (WFStandaloneShortcutRepresentation)initWithTitle:(id)a3 associatedAppBundleIdentifier:(id)a4 launchIdForCurrentPlatform:(id)a5 activityBundleIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFStandaloneShortcutRepresentation *v15;
  WFStandaloneShortcutRepresentation *v16;
  WFStandaloneShortcutRepresentation *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFStandaloneShortcutRepresentation;
  v15 = -[WFStandaloneShortcutRepresentation init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_associatedAppBundleIdentifier, a4);
    objc_storeStrong((id *)&v16->_launchIdForCurrentPlatform, a5);
    objc_storeStrong((id *)&v16->_activityBundleIdentifier, a6);
    v17 = v16;
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (NSString)launchIdForCurrentPlatform
{
  return self->_launchIdForCurrentPlatform;
}

- (NSString)activityBundleIdentifier
{
  return self->_activityBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchIdForCurrentPlatform, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
