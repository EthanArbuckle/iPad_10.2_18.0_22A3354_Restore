@implementation SULockoutViewController

- (SULockoutViewController)init
{
  SULockoutViewController *v2;
  SULockoutViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SULockoutViewController;
  v2 = -[SUViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUViewController setTitle:](v2, "setTitle:", -[NSBundle localizedStringForKey:value:table:](-[SULockoutViewController localizationBundle](v2, "localizationBundle"), "localizedStringForKey:value:table:", CFSTR("NO_STORE_TITLE"), &stru_24DE83F60, 0));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SULockoutViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (void)setLocalizationBundle:(id)a3
{
  NSBundle *localizationBundle;

  localizationBundle = self->_localizationBundle;
  if (localizationBundle != a3)
  {

    self->_localizationBundle = (NSBundle *)a3;
    -[SUViewController setTitle:](self, "setTitle:", -[NSBundle localizedStringForKey:value:table:](-[SULockoutViewController localizationBundle](self, "localizationBundle"), "localizedStringForKey:value:table:", CFSTR("NO_STORE_TITLE"), &stru_24DE83F60, 0));
  }
}

- (id)copyArchivableContext
{
  return 0;
}

- (void)loadView
{
  id v3;
  NSString *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BDF7080]);
  v4 = -[SULockoutViewController messageTitle](self, "messageTitle");
  v5 = (id)objc_msgSend(v3, "initWithFrame:title:style:", v4, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setMessage:", -[SULockoutViewController messageBody](self, "messageBody"));
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
  -[SULockoutViewController setView:](self, "setView:", v5);

}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1112);
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1128);
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (void)setMessageTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1136);
}

@end
