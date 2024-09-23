@implementation SPUIFooterButtonGenerator

- (SPUIFooterButtonGenerator)initWithReuseIdentifier:(id)a3 buttonGenerator:(id)a4
{
  id v6;
  id v7;
  SPUIFooterButtonGenerator *v8;
  SPUIFooterButtonGenerator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPUIFooterButtonGenerator;
  v8 = -[SPUIFooterButtonGenerator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SPUIFooterButtonGenerator setButtonGenerator:](v8, "setButtonGenerator:", v7);
    -[SPUIFooterButtonGenerator setReuseIdentifier:](v9, "setReuseIdentifier:", v6);
  }

  return v9;
}

- (id)buttonGenerator
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setButtonGenerator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)reuseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReuseIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong(&self->_buttonGenerator, 0);
}

@end
