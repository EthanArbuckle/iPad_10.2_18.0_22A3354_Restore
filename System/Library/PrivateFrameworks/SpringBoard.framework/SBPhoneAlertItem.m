@implementation SBPhoneAlertItem

- (SBPhoneAlertItem)initWithTitle:(id)a3 bodyText:(id)a4 slot:(int64_t)a5
{
  id v9;
  id v10;
  SBPhoneAlertItem *v11;
  SBPhoneAlertItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBPhoneAlertItem;
  v11 = -[SBAlertItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_bodyText, a4);
    v12->_slot = a5;
  }

  return v12;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", self->_title);
  objc_msgSend(v6, "setMessage:", self->_bodyText);
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DISMISS_ALERT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__SBPhoneAlertItem_configure_requirePasscodeForActions___block_invoke;
    v11[3] = &unk_1E8E9DCB0;
    v11[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v10);

  }
}

uint64_t __56__SBPhoneAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (int64_t)slot
{
  return self->_slot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
}

@end
