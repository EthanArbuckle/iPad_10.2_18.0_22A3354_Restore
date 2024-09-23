@implementation SHSheetPulsingAction

- (SHSheetPulsingAction)initWithEvent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  SHSheetPulsingAction *v7;

  v4 = (objc_class *)MEMORY[0x1E0D22FF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 2);

  v7 = -[SHSheetPulsingAction initWithInfo:responder:](self, "initWithInfo:responder:", v6, 0);
  return v7;
}

- (SHSheetPulsingEvent)event
{
  void *v2;
  void *v3;

  -[SHSheetPulsingAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SHSheetPulsingEvent *)v3;
}

@end
