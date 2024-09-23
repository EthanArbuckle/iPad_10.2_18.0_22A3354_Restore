@implementation SHSheetContentReloadAction

- (SHSheetContentReloadAction)initWithActivityUUID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  SHSheetContentReloadAction *v7;

  v4 = (objc_class *)MEMORY[0x1E0D22FF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v7 = -[SHSheetContentReloadAction initWithInfo:responder:](self, "initWithInfo:responder:", v6, 0);
  return v7;
}

- (NSUUID)activityUUID
{
  void *v2;
  void *v3;

  -[SHSheetContentReloadAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

@end
