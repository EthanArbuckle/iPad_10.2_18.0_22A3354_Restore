@implementation AXDefaultsObserverPostDarwinNotificationAction

- (AXDefaultsObserverPostDarwinNotificationAction)initWithDarwinNotification:(id)a3
{
  id v4;
  AXDefaultsObserverPostDarwinNotificationAction *v5;
  AXDefaultsObserverPostDarwinNotificationAction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXDefaultsObserverPostDarwinNotificationAction;
  v5 = -[AXDefaultsObserverPostDarwinNotificationAction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AXDefaultsObserverPostDarwinNotificationAction setNote:](v5, "setNote:", v4);

  return v6;
}

- (void)performForChangedDefault:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[AXDefaultsObserverPostDarwinNotificationAction note](self, "note");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);

}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
