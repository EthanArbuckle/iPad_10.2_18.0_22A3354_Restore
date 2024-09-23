@implementation WFUserPromptOperation

- (WFUserPromptOperation)initWithOptions:(id)a3 timeout:(double)a4 flags:(unint64_t)a5
{
  id v9;
  WFUserPromptOperation *v10;
  WFUserPromptOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFUserPromptOperation;
  v10 = -[WFUserPromptOperation init](&v13, sel_init);
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v11->_timeout = a4;
    v11->_flags = a5;
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (WFUserPromptOperation)initWithOptions:(id)a3 timeout:(double)a4
{
  return -[WFUserPromptOperation initWithOptions:timeout:flags:](self, "initWithOptions:timeout:flags:", a3, 0, a4);
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFUserPromptOperation;
  -[WFOperation start](&v3, sel_start);
  -[WFUserPromptOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__showPrompt, 0, 0);
}

- (void)_showPrompt
{
  const __CFAllocator *v3;
  double v4;
  CFTimeInterval v5;
  CFOptionFlags v6;
  const __CFDictionary *v7;
  __CFUserNotification *v8;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v10;
  void *v11;
  __CFRunLoop *Main;
  SInt32 error;

  error = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  -[WFUserPromptOperation timeout](self, "timeout");
  v5 = v4;
  v6 = -[WFUserPromptOperation flags](self, "flags");
  -[WFUserPromptOperation options](self, "options");
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = CFUserNotificationCreate(v3, v5, v6, &error, v7);

  if (v8
    && (RunLoopSource = CFUserNotificationCreateRunLoopSource(v3, v8, (CFUserNotificationCallBack)_UserNotificationDidFinish, 0)) != 0)
  {
    v10 = RunLoopSource;
    objc_msgSend((id)objc_opt_class(), "sharedMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", self, v8);

    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v10, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRelease(v10);
  }
  else
  {
    self->_result = -1;
    -[WFOperation finish](self, "finish");
  }
}

- (void)_notification:(__CFUserNotification *)a3 didFinishWithResponse:(unint64_t)a4
{
  NSObject *v7;
  os_log_type_t v8;
  NSDictionary *v9;
  NSDictionary *userResponse;
  NSObject *v11;
  os_log_type_t v12;
  NSDictionary *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    v15 = 136315394;
    v16 = "-[WFUserPromptOperation _notification:didFinishWithResponse:]";
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: response %lu", (uint8_t *)&v15, 0x16u);
  }

  if (a3)
  {
    CFUserNotificationGetResponseDictionary(a3);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    userResponse = self->_userResponse;
    self->_userResponse = v9;

    if (self->_userResponse)
    {
      WFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
      {
        v13 = self->_userResponse;
        v15 = 136315394;
        v16 = "-[WFUserPromptOperation _notification:didFinishWithResponse:]";
        v17 = 2112;
        v18 = (unint64_t)v13;
        _os_log_impl(&dword_219FC8000, v11, v12, "%s: user response %@", (uint8_t *)&v15, 0x16u);
      }

    }
  }
  if (a4 <= 3)
    -[WFUserPromptOperation setResult:](self, "setResult:", qword_21A062CD8[a4]);
  objc_msgSend((id)objc_opt_class(), "sharedMapTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", a3);

  if (a3)
    CFRelease(a3);
  -[WFOperation finish](self, "finish");
}

+ (id)sharedMapTable
{
  if (sharedMapTable_onceToken != -1)
    dispatch_once(&sharedMapTable_onceToken, &__block_literal_global_10);
  return (id)sharedMapTable_mapTable;
}

void __39__WFUserPromptOperation_sharedMapTable__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 2, 0, 0);
  v1 = (void *)sharedMapTable_mapTable;
  sharedMapTable_mapTable = v0;

}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSDictionary)userResponse
{
  return self->_userResponse;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userResponse, 0);
}

@end
