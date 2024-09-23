@implementation SearchUICallCommandHandler

- (id)destinationPunchout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setScheme:", CFSTR("tel"));
  -[SearchUICommandHandler command](self, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", v5);

  v6 = (void *)MEMORY[0x1E0D8C5E0];
  objc_msgSend(v3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "punchoutWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defaultSymbolName
{
  return CFSTR("phone");
}

@end
