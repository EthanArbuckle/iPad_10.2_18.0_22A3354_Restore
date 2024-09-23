@implementation SUScriptMetricsController

- (SUScriptMetricsController)init
{
  SUScriptMetricsController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptMetricsController;
  v2 = -[SUScriptObject init](&v5, sel_init);
  if (v2)
  {
    v2->_metricsController = (SSMetricsController *)objc_alloc_init(MEMORY[0x24BEB1ED8]);
    v3 = (void *)objc_msgSend(MEMORY[0x24BEC8C50], "sharedBagLoadingController");
    -[SUScriptMetricsController _configureWithBagDictionary:](v2, "_configureWithBagDictionary:", objc_msgSend(v3, "bagDictionary"));
    objc_msgSend(v3, "addBagObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C50], "sharedBagLoadingController"), "removeBagObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMetricsController;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesMetricsController");
}

- (void)flushUnreportedEventsWithCompletionFunction:(id)a3
{
  SUScriptFunction *v5;
  char isKindOfClass;
  SSMetricsController *metricsController;
  _QWORD v8[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3 && (isKindOfClass & 1) == 0)
      v5 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a3);
  }
  -[SUScriptFunction setThisObject:](v5, "setThisObject:", self);
  metricsController = self->_metricsController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__SUScriptMetricsController_flushUnreportedEventsWithCompletionFunction___block_invoke;
  v8[3] = &unk_24DE7DED0;
  v8[4] = v5;
  -[SSMetricsController flushUnreportedEventsWithCompletionHandler:](metricsController, "flushUnreportedEventsWithCompletionHandler:", v8);

}

void __73__SUScriptMetricsController_flushUnreportedEventsWithCompletionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  SUScriptError *v3;
  SUScriptError *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
    v3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a2);
  else
    v3 = (SUScriptError *)(id)objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  v6[0] = v3;
  objc_msgSend(v5, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1));
  objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);

}

- (void)recordEventWithTopic:(id)a3 properties:(id)a4 completionFunction:(id)a5
{
  OpaqueJSContext *v9;
  OpaqueJSContext *v10;
  id v11;
  id v12;
  SSMetricsController *metricsController;
  _QWORD v14[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[SUScriptObject copyJavaScriptContext](self, "copyJavaScriptContext");
    if (v9)
    {
      v10 = v9;
      v11 = (id)objc_msgSend(a4, "copyArrayOrDictionaryWithContext:", v9);
      JSGlobalContextRelease(v10);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Unexpected error in iTunes.metricsController.recordEvent: failed to retrieve JavaScript context."));
  }
  v11 = 0;
LABEL_9:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a5)
      a5 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a5);
    objc_msgSend(a5, "setThisObject:", self);
    v12 = objc_alloc_init(MEMORY[0x24BEB1EE0]);
    objc_msgSend(v12, "setTopic:", a3);
    objc_msgSend(v12, "addPropertiesWithDictionary:", v11);
    metricsController = self->_metricsController;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__SUScriptMetricsController_recordEventWithTopic_properties_completionFunction___block_invoke;
    v14[3] = &unk_24DE7DED0;
    v14[4] = a5;
    -[SSMetricsController insertEvent:withCompletionHandler:](metricsController, "insertEvent:withCompletionHandler:", v12, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __80__SUScriptMetricsController_recordEventWithTopic_properties_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  SUScriptError *v3;
  SUScriptError *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
    v3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a2);
  else
    v3 = (SUScriptError *)(id)objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  v6[0] = v3;
  objc_msgSend(v5, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1));
  objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);

}

- (void)_configureWithBagDictionary:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BEB2990]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithGlobalConfiguration:", v4);
      objc_msgSend(v5, "setDisableEventDecoration:", objc_msgSend(v5, "_decorateITMLEvents"));
      -[SSMetricsController setGlobalConfiguration:](self->_metricsController, "setGlobalConfiguration:", v5);
      -[SSMetricsController setFlushTimerEnabled:](self->_metricsController, "setFlushTimerEnabled:", 1);

    }
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_59, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMetricsController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_45, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMetricsController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMetricsController;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_59, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_45 = (uint64_t)sel_flushUnreportedEventsWithCompletionFunction_;
    unk_255186E00 = CFSTR("flushUnreportedEvents");
    qword_255186E08 = (uint64_t)sel_recordEventWithTopic_properties_completionFunction_;
    unk_255186E10 = CFSTR("recordEvent");
    __KeyMapping_59 = (uint64_t)MEMORY[0x24BDBD1B8];
  }
}

@end
