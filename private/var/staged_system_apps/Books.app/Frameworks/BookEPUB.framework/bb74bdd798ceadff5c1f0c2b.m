@implementation bb74bdd798ceadff5c1f0c2b

- (id)initW9ab3a732e8c7a246dd8:(rp6S0jzg *)a3 c0147d93538f22fb3e2a91a0:(unint64_t)a4
{
  id result;

  result = -[bb74bdd798ceadff5c1f0c2b init](self, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
  }
  return result;
}

- (void)dealloc
{
  rp6S0jzg *cf96f37f8dfcefb8f3d84a15;
  objc_super v4;

  cf96f37f8dfcefb8f3d84a15 = self->cf96f37f8dfcefb8f3d84a15;
  if (cf96f37f8dfcefb8f3d84a15)
  {
    sub_2B5BA0((uint64_t)cf96f37f8dfcefb8f3d84a15);
    self->cf96f37f8dfcefb8f3d84a15 = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)bb74bdd798ceadff5c1f0c2b;
  -[bb74bdd798ceadff5c1f0c2b dealloc](&v4, "dealloc");
}

- (rp6S0jzg)c443a638ffc3d34ce6b8ac05
{
  return self->cf96f37f8dfcefb8f3d84a15;
}

@end
