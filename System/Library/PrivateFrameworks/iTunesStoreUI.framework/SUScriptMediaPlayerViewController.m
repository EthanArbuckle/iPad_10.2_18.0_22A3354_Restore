@implementation SUScriptMediaPlayerViewController

- (SUScriptMediaPlayerViewController)initWithMediaPlayerItem:(id)a3
{
  SUScriptMediaPlayerViewController *v4;
  objc_super v6;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must provide a media item"));
  v6.receiver = self;
  v6.super_class = (Class)SUScriptMediaPlayerViewController;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    WebThreadRunOnMainThread();
  return v4;
}

void __61__SUScriptMediaPlayerViewController_initWithMediaPlayerItem___block_invoke(uint64_t a1)
{
  SUMediaPlayerViewController *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copyNativeMediaPlayerItem");
  v2 = -[SUMediaPlayerViewController initWithMediaPlayerItem:]([SUMediaPlayerViewController alloc], "initWithMediaPlayerItem:", v3);
  objc_msgSend(*(id *)(a1 + 40), "setNativeViewController:", v2);

}

- (id)_className
{
  return CFSTR("iTunesMediaPlayerViewController");
}

@end
