@implementation SUScriptApplication

- (void)beginDelayingTerminate
{
  NSLog(CFSTR("Delayed termination is no longer supported"), a2);
}

- (void)endDelayingTerminate
{
  NSLog(CFSTR("Delayed termination is no longer supported"), a2);
}

- (void)exitStoreWithReason:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  WebThreadRunOnMainThread();
}

uint64_t __43__SUScriptApplication_exitStoreWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v3 = *(void **)(a1 + 40);
  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 2;
  return objc_msgSend(v2, "_exitStoreWithReason:", v4);
}

- (void)returnToLibrary
{
  WebThreadRunOnMainThread();
}

uint64_t __38__SUScriptApplication_returnToLibrary__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "_returnToLibrary");
}

- (void)scrollIconToVisible:(id)a3 shouldSuspend:(BOOL)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __57__SUScriptApplication_scrollIconToVisible_shouldSuspend___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _OWORD v4[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, 512);
  result = CFStringGetCString(*(CFStringRef *)(a1 + 32), (char *)v4, 1024, 0x8000100u);
  if ((_DWORD)result)
  {
    v3 = SBSSpringBoardServerPort();
    return MEMORY[0x220762F98](v3, v4, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)setStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUScriptApplication_setStatusBarHidden_withAnimation___block_invoke;
  block[3] = &unk_24DE7CE58;
  v5 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__SUScriptApplication_setStatusBarHidden_withAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "_setStatusBarHidden:withAnimation:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)setStatusBarStyle:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUScriptApplication_setStatusBarStyle_animated___block_invoke;
  block[3] = &unk_24DE7CE58;
  block[4] = self;
  block[5] = a3;
  v5 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __50__SUScriptApplication_setStatusBarStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "_setStatusBarStyle:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (id)hostIdentifier
{
  id result;

  result = -[SUClientInterface hostApplicationIdentifier](-[SUScriptObject clientInterface](self, "clientInterface"), "hostApplicationIdentifier");
  if (!result)
    return +[SUClientInterface _defaultApplicationIdentifier](SUClientInterface, "_defaultApplicationIdentifier");
  return result;
}

- (id)iconBadgeNumber
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__31;
  v10 = __Block_byref_object_dispose__31;
  v11 = 0;
  WebThreadRunOnMainThread();
  v2 = (void *)v7[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v4 = v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

uint64_t __38__SUScriptApplication_iconBadgeNumber__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  result = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", objc_msgSend(v2, "applicationIconBadgeNumber"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (NSString)identifier
{
  NSString *result;

  result = -[SUClientInterface applicationIdentifier](-[SUScriptObject clientInterface](self, "clientInterface"), "applicationIdentifier");
  if (!result)
    return (NSString *)+[SUClientInterface _defaultApplicationIdentifier](SUClientInterface, "_defaultApplicationIdentifier");
  return result;
}

- (id)isDelayingTerminate
{
  NSLog(CFSTR("Delayed termination is no longer supported"), a2);
  return (id)*MEMORY[0x24BDBD268];
}

- (id)isRunningInStoreDemoMode
{
  int v2;
  id *v3;

  v2 = objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)screenHeight
{
  double v2;
  void *v3;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x3010000000;
  v8 = &unk_21B5745F1;
  v9 = *MEMORY[0x24BDBF148];
  WebThreadRunOnMainThread();
  v2 = v6[5];
  *(float *)&v2 = v2;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __35__SUScriptApplication_screenHeight__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (id)screenWidth
{
  double v2;
  void *v3;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x3010000000;
  v8 = &unk_21B5745F1;
  v9 = *MEMORY[0x24BDBF148];
  WebThreadRunOnMainThread();
  v2 = v6[4];
  *(float *)&v2 = v2;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __34__SUScriptApplication_screenWidth__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (void)setIconBadgeNumber:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  _QWORD block[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
LABEL_6:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SUScriptApplication_setIconBadgeNumber___block_invoke;
    block[3] = &unk_24DE7AF90;
    block[4] = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  v6 = objc_opt_respondsToSelector();
  v4 = a3;
  if ((v6 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __42__SUScriptApplication_setIconBadgeNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "setApplicationIconBadgeNumber:", (int)objc_msgSend(*(id *)(a1 + 32), "intValue"));
}

- (void)setIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("identifier")));
}

- (void)setStatusBarHidden:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUScriptApplication setStatusBarHidden:withAnimation:](self, "setStatusBarHidden:withAnimation:", objc_msgSend(a3, "BOOLValue"), 0);
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setStatusBarStyle:(int64_t)a3
{
  -[SUScriptApplication setStatusBarStyle:animated:](self, "setStatusBarStyle:animated:", a3, 0);
}

- (void)setVersion:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("version")));
}

- (id)statusBarHidden
{
  void **v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __38__SUScriptApplication_statusBarHidden__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "isStatusBarHidden");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int64_t)statusBarStyle
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__SUScriptApplication_statusBarStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSString)version
{
  NSString *result;

  result = -[SUClientInterface applicationVersion](-[SUScriptObject clientInterface](self, "clientInterface"), "applicationVersion");
  if (!result)
    return (NSString *)+[SUClientInterface _defaultApplicationVersion](SUClientInterface, "_defaultApplicationVersion");
  return result;
}

- (id)wasLaunchedFromLibrary
{
  void **v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __45__SUScriptApplication_wasLaunchedFromLibrary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "wasLaunchedFromLibrary");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSNumber)exitStoreReasonButton
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
}

- (NSNumber)exitStoreReasonDownloadComplete
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
}

- (NSNumber)exitStoreReasonFatalError
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
}

- (NSNumber)exitStoreReasonGotoMainStore
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
}

- (NSNumber)exitStoreReasonOther
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
}

- (NSNumber)exitStoreReasonPurchase
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
}

- (int64_t)statusBarAnimationFade
{
  return 1;
}

- (int64_t)statusBarAnimationNone
{
  return 0;
}

- (int64_t)statusBarAnimationSlide
{
  return 2;
}

- (int64_t)statusBarStyleDefault
{
  return 0;
}

- (int64_t)statusBarStyleBlackOpaque
{
  return 2;
}

- (int64_t)statusBarStyleBlackTranslucent
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_44, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_35, 8);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptApplication;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptApplication;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_44, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_35 = (uint64_t)sel_beginDelayingTerminate;
    unk_255186A00 = CFSTR("beginDelayingTerminate");
    qword_255186A08 = (uint64_t)sel_endDelayingTerminate;
    unk_255186A10 = CFSTR("endDelayingTerminate");
    qword_255186A18 = (uint64_t)sel_exitStoreWithReason_;
    unk_255186A20 = CFSTR("exitStore");
    qword_255186A28 = (uint64_t)sel_returnToLibrary;
    unk_255186A30 = CFSTR("returnToLibrary");
    qword_255186A38 = (uint64_t)sel_scrollIconToVisible_shouldSuspend_;
    unk_255186A40 = CFSTR("scrollIconToVisible");
    qword_255186A48 = (uint64_t)sel_setStatusBarHidden_withAnimation_;
    unk_255186A50 = CFSTR("setStatusBarHidden");
    qword_255186A58 = (uint64_t)sel_setStatusBarStyle_animated_;
    unk_255186A60 = CFSTR("setStatusBarStyle");
    qword_255186A68 = (uint64_t)sel_showNewsstand;
    unk_255186A70 = CFSTR("showNewsstand");
    __KeyMapping_44 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("hostIdentifier"), CFSTR("iconBadgeNumber"), CFSTR("iconBadgeNumber"), CFSTR("identifier"), CFSTR("identifier"), CFSTR("isDelayingTerminate"), CFSTR("isDelayingTerminate"), CFSTR("isRunningInStoreDemoMode"), CFSTR("isRunningInStoreDemoMode"), CFSTR("screenHeight"), CFSTR("screenHeight"), CFSTR("screenWidth"), CFSTR("screenWidth"), CFSTR("statusBarHidden"), CFSTR("statusBarHidden"), CFSTR("statusBarStyle"), CFSTR("statusBarStyle"),
                        CFSTR("version"),
                        CFSTR("version"),
                        CFSTR("wasLaunchedFromLibrary"),
                        CFSTR("wasLaunchedFromLibrary"),
                        CFSTR("EXIT_STORE_REASON_BUTTON"),
                        CFSTR("exitStoreReasonButton"),
                        CFSTR("EXIT_STORE_REASON_DOWNLOAD_COMPLETE"),
                        CFSTR("exitStoreReasonDownloadComplete"),
                        CFSTR("EXIT_STORE_REASON_FATAL_ERROR"),
                        CFSTR("exitStoreReasonFatalError"),
                        CFSTR("EXIT_STORE_REASON_GOTO_MAIN_STORE"),
                        CFSTR("exitStoreReasonGotoMainStore"),
                        CFSTR("EXIT_STORE_REASON_OTHER"),
                        CFSTR("exitStoreReasonOther"),
                        CFSTR("EXIT_STORE_REASON_PURCHASE"),
                        CFSTR("exitStoreReasonPurchase"),
                        CFSTR("STATUS_BAR_ANIMATION_FADE"),
                        CFSTR("statusBarAnimationFade"),
                        CFSTR("STATUS_BAR_ANIMATION_NONE"),
                        CFSTR("statusBarAnimationNone"),
                        CFSTR("STATUS_BAR_ANIMATION_SLIDE"),
                        CFSTR("statusBarAnimationSlide"),
                        CFSTR("STATUS_BAR_STYLE_DEFAULT"),
                        CFSTR("statusBarStyleDefault"),
                        CFSTR("STATUS_BAR_STYLE_BLACK_OPAQUE"),
                        CFSTR("statusBarStyleBlackOpaque"),
                        CFSTR("STATUS_BAR_STYLE_BLACK_TRANSLUCENT"),
                        CFSTR("statusBarStyleBlackTranslucent"),
                        0);
  }
}

@end
