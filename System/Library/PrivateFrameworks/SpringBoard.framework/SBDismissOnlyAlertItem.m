@implementation SBDismissOnlyAlertItem

- (SBDismissOnlyAlertItem)initWithTitle:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  SBDismissOnlyAlertItem *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *body;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBDismissOnlyAlertItem;
  v8 = -[SBAlertItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    body = v8->_body;
    v8->_body = (NSString *)v11;

  }
  return v8;
}

- (void)setTitle:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_title != v6)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[SBAlertItem alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

  }
}

- (void)setBodyText:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_body != v6)
  {
    objc_storeStrong((id *)&self->_body, a3);
    -[SBAlertItem alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v6);

  }
}

- (id)title
{
  return self->_title;
}

- (id)bodyText
{
  return self->_body;
}

- (id)dismissButtonText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DISMISS_ALERT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", self->_title);
  objc_msgSend(v5, "setMessage:", self->_body);
  v6 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBDismissOnlyAlertItem dismissButtonText](self, "dismissButtonText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SBDismissOnlyAlertItem_configure_requirePasscodeForActions___block_invoke;
  v9[3] = &unk_1E8E9DCB0;
  v9[4] = self;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

}

uint64_t __62__SBDismissOnlyAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)suppressForKeynote
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
