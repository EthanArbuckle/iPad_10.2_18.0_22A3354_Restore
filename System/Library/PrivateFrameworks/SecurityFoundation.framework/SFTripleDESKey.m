@implementation SFTripleDESKey

- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFTripleDESKey;
  return -[_SFSymmetricKey initRandomKeyWithSpecifier:error:](&v5, sel_initRandomKeyWithSpecifier_error_, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tripleDESKeyInternal, 0);
}

@end
