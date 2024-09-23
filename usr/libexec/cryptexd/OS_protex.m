@implementation OS_protex

- (void)dealloc
{
  objc_super v3;

  sub_10000F87C((void **)&self->super.super.super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_protex;
  -[OS_cryptex_base dealloc](&v3, "dealloc");
}

@end
