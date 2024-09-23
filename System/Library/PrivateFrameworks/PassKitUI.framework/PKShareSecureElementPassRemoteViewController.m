@implementation PKShareSecureElementPassRemoteViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE56C370);
}

- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKShareSecureElementPassRemoteViewController parentViewController](self, "parentViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didCreateShareURL:activationCode:error:", v10, v9, v8);

}

- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PKShareSecureElementPassRemoteViewController parentViewController](self, "parentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didFinishShareWithDidUserShare:error:", v4, v6);

}

@end
