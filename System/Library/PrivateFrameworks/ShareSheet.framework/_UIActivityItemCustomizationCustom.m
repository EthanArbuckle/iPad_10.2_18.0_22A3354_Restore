@implementation _UIActivityItemCustomizationCustom

- (id)_handler
{
  return self->__handler;
}

- (void)_setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__handler, 0);
}

@end
