@implementation PKBarcodePassBoopProvider

- (UIActivityItemsConfiguration)cachedConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
  swift_beginAccess();
  return (UIActivityItemsConfiguration *)*v2;
}

- (void)setCachedConfiguration:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setPass:(id)a3 passView:(id)a4
{
  id v6;
  id v7;
  PKBarcodePassBoopProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D84D740(v6, a4);

}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration);
  swift_beginAccess();
  return (UIActivityItemsConfigurationReading *)*v2;
}

- (PKBarcodePassBoopProvider)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_pass) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKBarcodePassBoopProvider_cachedConfiguration) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BarcodePassBoopProvider();
  return -[PKBarcodePassBoopProvider init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
