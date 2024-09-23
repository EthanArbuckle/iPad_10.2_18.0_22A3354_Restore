@implementation SMUAvatarViewController

void __52__SMUAvatarViewController_descriptorForRequiredKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBAE58]);
  objc_msgSend(v2, "descriptorForRequiredKeys");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)descriptorForRequiredKeys__descriptor;
  descriptorForRequiredKeys__descriptor = v0;

}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_onceToken != -1)
    dispatch_once(&descriptorForRequiredKeys_onceToken, &__block_literal_global);
  return (id)descriptorForRequiredKeys__descriptor;
}

- (SMUAvatarViewController)init
{
  SMUAvatarViewController *v2;
  void *v3;
  uint64_t v4;
  CNAvatarViewController *avatarViewController;
  uint64_t v6;
  UIView *view;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SMUAvatarViewController;
  v2 = -[SMUAvatarViewController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBAE60], "defaultSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBAE58]), "initWithSettings:", v3);
    avatarViewController = v2->_avatarViewController;
    v2->_avatarViewController = (CNAvatarViewController *)v4;

    -[CNAvatarViewController view](v2->_avatarViewController, "view");
    v6 = objc_claimAutoreleasedReturnValue();
    view = v2->view;
    v2->view = (UIView *)v6;

  }
  return v2;
}

- (void)setContact:(id)a3
{
  void *v4;
  id v5;
  id v6;
  CNAvatarViewController *avatarViewController;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAvatarViewController setContacts:](self->_avatarViewController, "setContacts:", v6, v8, v9);

  }
  else
  {
    avatarViewController = self->_avatarViewController;
    v6 = 0;
    -[CNAvatarViewController setContacts:](avatarViewController, "setContacts:", MEMORY[0x24BDBD1A8]);
  }

}

- (UIView)view
{
  return self->view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->view, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end
