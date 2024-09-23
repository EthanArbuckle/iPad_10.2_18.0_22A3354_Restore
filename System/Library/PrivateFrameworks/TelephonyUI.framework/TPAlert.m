@implementation TPAlert

- (void)dealloc
{
  __CFUserNotification *userNotification;
  objc_super v4;

  userNotification = self->_userNotification;
  if (userNotification)
    CFRelease(userNotification);
  v4.receiver = self;
  v4.super_class = (Class)TPAlert;
  -[TPAlert dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  __CFUserNotification *userNotification;

  userNotification = self->_userNotification;
  if (userNotification)
    CFUserNotificationCancel(userNotification);
}

- (void)show
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_msgSend(a1, "userNotification");
  _os_log_error_impl(&dword_1BCFA3000, a2, OS_LOG_TYPE_ERROR, "Could not create run loop source for CFUserNotification: %@", (uint8_t *)&v3, 0xCu);
}

void __15__TPAlert_show__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pendingAlerts;
  pendingAlerts = v0;

}

- (void)showOnViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3450];
  -[TPAlert title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPAlert message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPAlert defaultButtonTitle](self, "defaultButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0DC3448];
    -[TPAlert defaultButtonTitle](self, "defaultButtonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __32__TPAlert_showOnViewController___block_invoke;
    v24[3] = &unk_1E75FD528;
    v24[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v13);

  }
  -[TPAlert alternateButtonTitle](self, "alternateButtonTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0DC3448];
    -[TPAlert alternateButtonTitle](self, "alternateButtonTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __32__TPAlert_showOnViewController___block_invoke_2;
    v23[3] = &unk_1E75FD528;
    v23[4] = self;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v17);

  }
  -[TPAlert otherButtonTitle](self, "otherButtonTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0DC3448];
    -[TPAlert otherButtonTitle](self, "otherButtonTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __32__TPAlert_showOnViewController___block_invoke_3;
    v22[3] = &unk_1E75FD528;
    v22[4] = self;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v21);

  }
  objc_msgSend(v4, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __32__TPAlert_showOnViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "defaultResponse");
}

uint64_t __32__TPAlert_showOnViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alternateResponse");
}

uint64_t __32__TPAlert_showOnViewController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "otherResponse");
}

- (NSString)title
{
  return 0;
}

- (NSString)message
{
  return 0;
}

- (NSString)defaultButtonTitle
{
  return 0;
}

- (NSString)alternateButtonTitle
{
  return 0;
}

- (NSString)otherButtonTitle
{
  return 0;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(__CFUserNotification *)a3
{
  self->_userNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
