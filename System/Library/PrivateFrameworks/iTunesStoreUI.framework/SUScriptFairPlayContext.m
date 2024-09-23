@implementation SUScriptFairPlayContext

- (id)_className
{
  return CFSTR("iTunesFairPlayContext");
}

- (BOOL)isOpen
{
  return objc_msgSend(-[SUScriptFairPlayContext _accountViewController](self, "_accountViewController"), "_mescalSession") != 0;
}

- (void)close
{
  WebThreadRunOnMainThread();
}

uint64_t __32__SUScriptFairPlayContext_close__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_accountViewController"), "_closeMescalSession");
}

- (id)signData:(id)a3
{
  id v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__54;
  v10 = __Block_byref_object_dispose__54;
  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (a3 == 0) | objc_opt_isKindOfClass() & 1)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v4;
}

id __36__SUScriptFairPlayContext_signData___block_invoke(uint64_t a1)
{
  id result;
  void *v3;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_accountViewController"), "_mescalSession");
  if (result)
  {
    v3 = (void *)objc_msgSend(result, "signData:error:", objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4), 0);
    result = (id)objc_msgSend(v3, "length");
    if (result)
    {
      result = (id)objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

- (id)_accountViewController
{
  return +[SUAccountViewController _latestAccountViewController](SUAccountViewController, "_latestAccountViewController");
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_59, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFairPlayContext;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_59 = (uint64_t)sel_close;
    unk_2551871C0 = CFSTR("close");
    qword_2551871C8 = (uint64_t)sel_signData_;
    unk_2551871D0 = CFSTR("signData");
  }
}

@end
