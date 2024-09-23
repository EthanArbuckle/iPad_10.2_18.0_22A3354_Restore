@implementation SHSheetOptionsUpdateAction

- (SHSheetOptionsUpdateAction)initWithCustomization:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  _WrapperForNonBSXPCCodingConformingClass *v7;
  SHSheetOptionsUpdateAction *v8;

  v4 = (objc_class *)MEMORY[0x1E0D22FF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[_WrapperForNonBSXPCCodingConformingClass initWithObject:]([_WrapperForNonBSXPCCodingConformingClass alloc], "initWithObject:", v5);

  objc_msgSend(v6, "setObject:forSetting:", v7, 4);
  v8 = -[SHSheetOptionsUpdateAction initWithInfo:responder:](self, "initWithInfo:responder:", v6, 0);

  return v8;
}

- (_UIActivityItemCustomization)customization
{
  void *v2;
  void *v3;
  void *v4;

  -[SHSheetOptionsUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIActivityItemCustomization *)v4;
}

@end
