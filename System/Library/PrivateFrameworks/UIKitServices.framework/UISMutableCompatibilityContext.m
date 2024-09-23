@implementation UISMutableCompatibilityContext

- (void)setSupportedDisplaySizes:(id)a3
{
  NSArray *v4;
  NSArray *supportedDisplaySizes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  supportedDisplaySizes = self->super._supportedDisplaySizes;
  self->super._supportedDisplaySizes = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  UISCompatibilityContext *v4;
  void *v5;
  UISCompatibilityContext *v6;

  v4 = [UISCompatibilityContext alloc];
  -[UISCompatibilityContext supportedDisplaySizes](self, "supportedDisplaySizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UISCompatibilityContext initWithSupportedDisplaySizes:](v4, "initWithSupportedDisplaySizes:", v5);

  return v6;
}

@end
