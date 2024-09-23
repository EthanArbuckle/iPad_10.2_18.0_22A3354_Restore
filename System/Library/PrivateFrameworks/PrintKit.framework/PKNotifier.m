@implementation PKNotifier

+ (id)sharedNotifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__PKNotifier_sharedNotifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PKNotifier sharedNotifier]::sOnce != -1)
    dispatch_once(&+[PKNotifier sharedNotifier]::sOnce, block);
  return (id)+[PKNotifier sharedNotifier]::sNotifier;
}

void __28__PKNotifier_sharedNotifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)+[PKNotifier sharedNotifier]::sNotifier;
  +[PKNotifier sharedNotifier]::sNotifier = v0;

}

- (PKNotifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKNotifier;
  return -[PKNotifier init](&v3, sel_init);
}

- (id)makeSimpleAlert:(id)a3 message:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  makeNotification<PKNotification>(self, a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("OK"), "Acknowledgement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultButtonTitle:", v5);

  PKLocalizedString(CFSTR("Cancel"), "Cancel printing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlternateButtonTitle:", v6);

  return v4;
}

- (id)makeQuotaAlert:(id)a3 message:(id)a4 quotaURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKNotifier *v11;
  id v12;
  id v13;
  PKQuotaNotification *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = v8;
  v13 = v9;
  v14 = -[PKNotification initWithNotifier:notifyKind:]([PKQuotaNotification alloc], "initWithNotifier:notifyKind:", v11, 0);
  -[PKNotification setHeaderString:](v14, "setHeaderString:", v12);
  -[PKNotification setMessageString:](v14, "setMessageString:", v13);

  PKLocalizedString(CFSTR("Details"), "Open webpage to manage quota");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNotification setDefaultButtonTitle:](v14, "setDefaultButtonTitle:", v15);

  PKLocalizedString(CFSTR("Cancel"), "Cancel printing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNotification setAlternateButtonTitle:](v14, "setAlternateButtonTitle:", v16);

  -[PKQuotaNotification setQuotaURL:](v14, "setQuotaURL:", v10);
  return v14;
}

- (id)makeNotice:(id)a3 message:(id)a4
{
  void *v4;
  void *v5;

  makeNotification<PKNotification>(self, a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("OK"), "Acknowledgement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultButtonTitle:", v5);

  return v4;
}

- (id)makeRetry:(id)a3 message:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  makeNotification<PKNotification>(self, a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("Try Again"), "Retry printing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultButtonTitle:", v5);

  PKLocalizedString(CFSTR("Cancel"), "Cancel printing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlternateButtonTitle:", v6);

  return v4;
}

- (id)makeAuthAlert:(id)a3 challenge:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PKNotifier *v8;
  id v9;
  PKAuthNotification *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a3;
  PKLocalizedString(CFSTR("Password required for \"%@\"), "Password prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v5);
  v8 = self;
  v9 = v7;
  v10 = -[PKNotification initWithNotifier:notifyKind:]([PKAuthNotification alloc], "initWithNotifier:notifyKind:", v8, 0);
  -[PKNotification setHeaderString:](v10, "setHeaderString:", 0);
  -[PKNotification setMessageString:](v10, "setMessageString:", v9);

  -[PKAuthNotification defaultUsername](v10, "defaultUsername");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("guest-only"));

  if ((v12 & 1) == 0)
  {
    PKLocalizedString(CFSTR("user name"), "Username placeholder text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAuthNotification setUsernameField:](v10, "setUsernameField:", v13);

  }
  PKLocalizedString(CFSTR("password"), "Password placeholder text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAuthNotification setPasswordField:](v10, "setPasswordField:", v14);

  return v10;
}

- (void)notification:(__CFUserNotification *)a3 completedWithResult:(unint64_t)a4
{
  PKNotifier *v6;
  PKNotification *outstandingNote;
  __CFRunLoopSource *outstandingSource;
  void *v9;
  PKNotification *v10;

  v6 = self;
  objc_sync_enter(v6);
  if (v6->_outstandingRef == a3)
  {
    v6->_outstandingRef = 0;
    v10 = v6->_outstandingNote;
    outstandingNote = v6->_outstandingNote;
    v6->_outstandingNote = 0;

    outstandingSource = v6->_outstandingSource;
    if (outstandingSource)
    {
      CFRunLoopSourceInvalidate(outstandingSource);
      v6->_outstandingSource = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v6);

  if (v10)
  {
    CFUserNotificationGetResponseDictionary(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKNotification _interpretResult:responseDict:](v10, "_interpretResult:responseDict:", a4, v9);

  }
  else
  {
    objc_msgSend(0, "_interpretResult:responseDict:", 2, 0);
  }

}

- (void)startNotification:(id)a3 options:(unint64_t)a4 dict:(id)a5
{
  id v9;
  const __CFDictionary *v10;
  void *v11;
  void *v12;
  const __CFAllocator *v13;
  __CFUserNotification *v14;
  __CFUserNotification *v15;
  __CFRunLoopSource *RunLoopSource;
  PKNotifier *v17;
  __CFUserNotification *outstandingRef;
  __CFRunLoopSource *outstandingSource;
  __CFRunLoop *Main;
  SInt32 error;

  v9 = a3;
  v10 = (const __CFDictionary *)a5;
  objc_msgSend(v9, "resultHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v9, "setResultHandler:", &__block_literal_global_3);
  objc_msgSend(v9, "resultQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(v9, "setResultQueue:", MEMORY[0x24BDAC9B8]);
  error = 0;
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, a4, &error, v10);
  v15 = v14;
  if (v14)
  {
    if (v11)
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v13, v14, (CFUserNotificationCallBack)_notifyCallout, 0);
      v17 = self;
      objc_sync_enter(v17);
      outstandingRef = v17->_outstandingRef;
      if (outstandingRef)
      {
        CFUserNotificationCancel(outstandingRef);
        CFRelease(v17->_outstandingRef);
        v17->_outstandingRef = 0;
      }
      outstandingSource = v17->_outstandingSource;
      if (outstandingSource)
      {
        CFRelease(outstandingSource);
        v17->_outstandingSource = 0;
      }
      v17->_outstandingRef = v15;
      objc_storeStrong((id *)&v17->_outstandingNote, a3);
      v17->_outstandingSource = RunLoopSource;
      objc_sync_exit(v17);

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    }
    else
    {
      CFAutorelease(v14);
    }
  }
  else
  {
    objc_msgSend(v9, "_interpretResult:responseDict:", 2, 0);
  }

}

- (void)cancelNotification:(id)a3
{
  PKNotification *v4;
  PKNotification *outstandingNote;
  __CFUserNotification *outstandingRef;
  PKNotifier *obj;

  obj = self;
  v4 = (PKNotification *)a3;
  objc_sync_enter(obj);
  outstandingNote = obj->_outstandingNote;

  if (outstandingNote == v4)
  {
    outstandingRef = obj->_outstandingRef;
    if (outstandingRef)
      CFUserNotificationCancel(outstandingRef);
  }
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingNote, 0);
}

@end
