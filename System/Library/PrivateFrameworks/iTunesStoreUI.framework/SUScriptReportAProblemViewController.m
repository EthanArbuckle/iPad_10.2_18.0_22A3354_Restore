@implementation SUScriptReportAProblemViewController

- (SUScriptReportAProblemViewController)init
{
  return -[SUScriptReportAProblemViewController initWithAdamID:clientInterface:](self, "initWithAdamID:clientInterface:", 0, 0);
}

- (SUScriptReportAProblemViewController)initWithAdamID:(id)a3 clientInterface:(id)a4
{
  SUScriptReportAProblemViewController *v6;
  SUScriptReportAProblemViewController *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  SUScriptReportAProblemViewController *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  objc_super v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)SUScriptReportAProblemViewController;
  v6 = -[SUScriptObject init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v17 = MEMORY[0x24BDAC760];
    v18 = a3;
    v19 = a4;
    v20 = v6;
    WebThreadRunOnMainThread();
    if (!*((_BYTE *)v22 + 24))
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      v10 = objc_msgSend(v8, "shouldLogToDisk");
      v11 = objc_msgSend(v8, "OSLogObject");
      if (v10)
        v9 |= 2u;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v9 &= 2u;
      if (v9)
      {
        v12 = -[SUScriptReportAProblemViewController _className](v7, "_className");
        v26 = 138412290;
        v27 = v12;
        LODWORD(v16) = 12;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v26, v16, v17, 3221225472, __71__SUScriptReportAProblemViewController_initWithAdamID_clientInterface___block_invoke, &unk_24DE7CA80, v18, v19, v20, &v21);
          free(v14);
          SSFileLog();
        }
      }

      v7 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  return v7;
}

void __71__SUScriptReportAProblemViewController_initWithAdamID_clientInterface___block_invoke(uint64_t a1)
{
  SUReportConcernViewController *v2;

  v2 = -[SUReportConcernViewController initWithItemIdentifier:]([SUReportConcernViewController alloc], "initWithItemIdentifier:", objc_msgSend(*(id *)(a1 + 32), "itemIdentifierValue"));
  -[SUViewController setClientInterface:](v2, "setClientInterface:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "setNativeViewController:", v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

- (id)newNativeViewController
{
  SUReportConcernViewController *v3;

  v3 = -[SUReportConcernViewController initWithItemIdentifier:]([SUReportConcernViewController alloc], "initWithItemIdentifier:", 0);
  -[SUViewController setClientInterface:](v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

- (NSNumber)adamID
{
  NSNumber *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__37;
  v8 = __Block_byref_object_dispose__37;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSNumber *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __46__SUScriptReportAProblemViewController_adamID__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithItemIdentifier:", objc_msgSend(v2, "itemIdentifier"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)_className
{
  return CFSTR("iTunesReportAProblemViewController");
}

- (void)setAdamID:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("adamID")));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_49, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptReportAProblemViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptReportAProblemViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_49, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_49 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("adamID"), 0);
}

@end
