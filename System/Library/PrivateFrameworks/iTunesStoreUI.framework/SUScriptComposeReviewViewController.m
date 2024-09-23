@implementation SUScriptComposeReviewViewController

- (SUScriptComposeReviewViewController)init
{
  return -[SUScriptComposeReviewViewController initWithScriptReview:clientInterface:](self, "initWithScriptReview:clientInterface:", 0, 0);
}

- (SUScriptComposeReviewViewController)initWithScriptReview:(id)a3 clientInterface:(id)a4
{
  SUScriptComposeReviewViewController *v5;
  objc_super v7;

  objc_msgSend(a3, "infoURL");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUScriptComposeReviewViewController;
    v5 = -[SUScriptObject init](&v7, sel_init);
    if (v5)
      WebThreadRunOnMainThread();
  }
  else
  {

    return 0;
  }
  return v5;
}

void __76__SUScriptComposeReviewViewController_initWithScriptReview_clientInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  SUComposeReviewViewController *v3;
  SUComposeReviewViewController *v4;

  v2 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v3 = (SUComposeReviewViewController *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", v2);
  if (!v3)
    v3 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", v2);
  v4 = v3;
  -[SUViewController setClientInterface:](v3, "setClientInterface:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setNativeViewController:", v4);

}

- (id)newNativeViewController
{
  SUClientInterface *v2;
  SUComposeReviewViewController *v3;

  v2 = -[SUScriptObject clientInterface](self, "clientInterface");
  v3 = -[SUViewControllerFactory newComposeReviewViewControllerWithCompositionURL:](-[SUClientInterface viewControllerFactory](v2, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", 0);
  if (!v3)
    v3 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", 0);
  -[SUViewController setClientInterface:](v3, "setClientInterface:", v2);
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesComposeReviewViewController");
}

- (SUScriptReview)review
{
  return 0;
}

- (void)setReview:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("review")));
}

+ (id)webScriptNameForKey:(const char *)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForKey((char *)a3, (uint64_t)&__KeyMapping, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptComposeReviewViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKey_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptComposeReviewViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  SUWebScriptAddPropertyKeysToArray((uint64_t)v2, (uint64_t)&__KeyMapping, 1);
  return v2;
}

@end
