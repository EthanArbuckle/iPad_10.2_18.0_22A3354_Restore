@implementation UISCurrentUserInterfaceStyleValue

- (UISCurrentUserInterfaceStyleValue)init
{
  return -[UISCurrentUserInterfaceStyleValue initWithChangesDeliveredOnQueue:toBlock:](self, "initWithChangesDeliveredOnQueue:toBlock:", 0, 0);
}

- (UISCurrentUserInterfaceStyleValue)initWithChangesDeliveredOnQueue:(id)a3 toBlock:(id)a4
{
  NSObject *v6;
  id v7;
  UISCurrentUserInterfaceStyleValue *v8;
  UISCurrentUserInterfaceStyleValue *v9;
  NSObject *v10;
  _QWORD handler[4];
  id v13;
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UISCurrentUserInterfaceStyleValue;
  v8 = -[UISCurrentUserInterfaceStyleValue init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_notificationToken = -1;
    if (v7)
    {
      if (!v6)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v10 = objc_claimAutoreleasedReturnValue();
        v6 = dispatch_queue_create("UISCurrentUserInterfaceStyleValue", v10);

      }
      objc_initWeak(&location, v9);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __77__UISCurrentUserInterfaceStyleValue_initWithChangesDeliveredOnQueue_toBlock___block_invoke;
      handler[3] = &unk_1E2CAFBD8;
      objc_copyWeak(&v14, &location);
      v13 = v7;
      notify_register_dispatch("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification", &v9->_notificationToken, v6, handler);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      notify_register_check("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification", &v8->_notificationToken);
    }
  }

  return v9;
}

void __77__UISCurrentUserInterfaceStyleValue_initWithChangesDeliveredOnQueue_toBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_notificationToken))
    notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)UISCurrentUserInterfaceStyleValue;
  -[UISCurrentUserInterfaceStyleValue dealloc](&v3, sel_dealloc);
}

- (int64_t)userInterfaceStyle
{
  int64_t result;
  uint64_t state64;

  state64 = 0;
  if (notify_get_state(self->_notificationToken, &state64))
    return 0;
  result = state64;
  if (state64 - 1 >= 2)
    return 0;
  return result;
}

@end
