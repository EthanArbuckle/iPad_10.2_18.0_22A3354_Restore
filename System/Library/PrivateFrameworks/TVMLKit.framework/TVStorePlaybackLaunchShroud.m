@implementation TVStorePlaybackLaunchShroud

+ (id)sharedShroud
{
  if (sharedShroud_onceToken != -1)
    dispatch_once(&sharedShroud_onceToken, &__block_literal_global_17);
  return (id)sharedShroud_sharedShroud;
}

void __43__TVStorePlaybackLaunchShroud_sharedShroud__block_invoke()
{
  TVStorePlaybackLaunchShroud *v0;
  void *v1;

  v0 = objc_alloc_init(TVStorePlaybackLaunchShroud);
  v1 = (void *)sharedShroud_sharedShroud;
  sharedShroud_sharedShroud = (uint64_t)v0;

}

- (TVStorePlaybackLaunchShroud)init
{
  TVStorePlaybackLaunchShroud *v2;
  TVStorePlaybackLaunchShroud *v3;
  TVStorePlaybackLaunchShroudWindow *v4;
  void *v5;
  TVStorePlaybackLaunchShroudWindow *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TVStorePlaybackLaunchShroud;
  v2 = -[TVStorePlaybackLaunchShroud init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hidden = 1;
    v4 = [TVStorePlaybackLaunchShroudWindow alloc];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[TVStorePlaybackLaunchShroudWindow initWithFrame:](v4, "initWithFrame:");

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVStorePlaybackLaunchShroudWindow setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[TVStorePlaybackLaunchShroudWindow setWindowLevel:](v6, "setWindowLevel:", *MEMORY[0x24BDF8000]);
    v8 = objc_alloc_init(MEMORY[0x24BDF6F98]);
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[TVStorePlaybackLaunchShroudWindow setRootViewController:](v6, "setRootViewController:", v8);
    -[TVStorePlaybackLaunchShroud setWindow:](v3, "setWindow:", v6);

  }
  return v3;
}

- (void)_showWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  +[TVStorePlaybackLaunchShroud cancelPreviousPerformRequestsWithTarget:selector:object:](TVStorePlaybackLaunchShroud, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_fadeOut, 0);
  -[TVStorePlaybackLaunchShroud window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "setAlpha:", 0.0);
    objc_msgSend(v8, "setHidden:", 0);
    v9 = (void *)MEMORY[0x24BDF6F90];
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke;
    v16[3] = &unk_24EB85440;
    v17 = v8;
    v11 = v10;
    v12 = 3221225472;
    v13 = __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke_2;
    v14 = &unk_24EB85E00;
    v15 = v6;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 0x10000, v16, &v11, 0.3, 0.0);

  }
  else
  {
    objc_msgSend(v7, "setHidden:", 0);
    if (v6)
      v6[2](v6);
  }
  -[TVStorePlaybackLaunchShroud performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_fadeOut, 0, 10.0, v11, v12, v13, v14);

}

uint64_t __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __76__TVStorePlaybackLaunchShroud__showWithFadeAnimation_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_hideWithFadeAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  +[TVStorePlaybackLaunchShroud cancelPreviousPerformRequestsWithTarget:selector:object:](TVStorePlaybackLaunchShroud, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_fadeOut, 0);
  -[TVStorePlaybackLaunchShroud window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    v9 = (void *)MEMORY[0x24BDF6F90];
    v10 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke;
    v14[3] = &unk_24EB85440;
    v15 = v7;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_24EB85FA0;
    v12 = v15;
    v13 = v6;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 0x20000, v14, v11, 0.3, 0.0);

  }
  else
  {
    objc_msgSend(v7, "setHidden:", 1);
    if (v6)
      v6[2](v6);
  }

}

uint64_t __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __76__TVStorePlaybackLaunchShroud__hideWithFadeAnimation_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fadeOut
{
  -[TVStorePlaybackLaunchShroud setHidden:animated:withCompletionHandler:](self, "setHidden:animated:withCompletionHandler:", 1, 1, 0);
}

- (void)setHidden:(BOOL)a3
{
  -[TVStorePlaybackLaunchShroud setHidden:animated:withCompletionHandler:](self, "setHidden:animated:withCompletionHandler:", a3, 0, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (self->_hidden != v6)
  {
    self->_hidden = v6;
    v10 = v8;
    if (v6)
      -[TVStorePlaybackLaunchShroud _hideWithFadeAnimation:withCompletionHandler:](self, "_hideWithFadeAnimation:withCompletionHandler:", v5, v8);
    else
      -[TVStorePlaybackLaunchShroud _showWithFadeAnimation:withCompletionHandler:](self, "_showWithFadeAnimation:withCompletionHandler:", v5, v8);
    v9 = v10;
  }

}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
