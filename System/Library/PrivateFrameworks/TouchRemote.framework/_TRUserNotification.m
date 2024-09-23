@implementation _TRUserNotification

- (_TRUserNotification)initWithDictionary:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  const __CFDictionary *v8;
  _TRUserNotification *v9;
  CFUserNotificationRef v10;
  _TRUserNotification *v11;
  SInt32 error;
  objc_super v14;

  v8 = (const __CFDictionary *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_TRUserNotification;
  v9 = -[_TRUserNotification init](&v14, sel_init);
  if (v9
    && (error = 0,
        v10 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, a4, &error, v8),
        (v9->_userNotification = v10) == 0))
  {
    if (a5)
      *a5 = error;
    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (void)dealloc
{
  __CFUserNotification *userNotification;
  objc_super v4;

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    CFRelease(self->_userNotification);
  }
  v4.receiver = self;
  v4.super_class = (Class)_TRUserNotification;
  -[_TRUserNotification dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  CFUserNotificationCancel(self->_userNotification);
}

- (__CFUserNotification)CFUserNotification
{
  return self->_userNotification;
}

- (void)show
{
  AudioServicesPlaySystemSoundWithCompletion(0xFFFu, 0);
  self->_response = CFUserNotificationReceiveResponse(self->_userNotification, 0.0, &self->_responseFlags);
}

- (BOOL)didAccept
{
  return self->_userNotification && !self->_response && self->_responseFlags == 0;
}

- (id)textFieldValueAtIndex:(unint64_t)a3
{
  return (id)-[__CFString copy]((id)CFUserNotificationGetResponseValue(self->_userNotification, (CFStringRef)*MEMORY[0x24BDBD728], a3), "copy");
}

+ (id)userNotificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6
{
  return (id)objc_msgSend(a1, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:isTopMost:dismissOnUnlock:", a3, a4, a5, a6, 1, 0);
}

+ (id)userNotificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 isTopMost:(BOOL)a7 dismissOnUnlock:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a8;
  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDBD6D8]);
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDBD6E0]);
  if (v16)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDBD6F0]);
  if (v15)
  {
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDBD6F8]);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24C2F2928, *MEMORY[0x24BEB0E30]);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDBD6E8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BEB0E58]);

  return v18;
}

- (int)response
{
  return self->_response;
}

- (unint64_t)responseFlags
{
  return self->_responseFlags;
}

@end
