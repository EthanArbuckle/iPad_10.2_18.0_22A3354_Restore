@implementation VSStorefrontSection

- (VSStorefrontSection)init
{
  VSStorefrontSection *v2;
  VSStorefrontSection *v3;
  NSArray *storefronts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSStorefrontSection;
  v2 = -[VSStorefrontSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    storefronts = v2->_storefronts;
    v2->_storefronts = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (NSArray)storefronts
{
  return self->_storefronts;
}

- (void)setStorefronts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefronts, 0);
}

@end
