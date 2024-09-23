@implementation SHSheetAction

- (SHSheetAction)initWithType:(int64_t)a3
{
  id v5;
  void *v6;
  SHSheetAction *v7;

  v5 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 0);

  v7 = -[SHSheetAction initWithInfo:responder:](self, "initWithInfo:responder:", v5, 0);
  return v7;
}

- (int64_t)type
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SHSheetAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

@end
