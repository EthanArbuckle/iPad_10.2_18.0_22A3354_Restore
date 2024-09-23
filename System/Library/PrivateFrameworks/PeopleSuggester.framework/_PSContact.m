@implementation _PSContact

- (_PSContact)initWithCNContact:(id)a3 isChild:(BOOL)a4
{
  id v7;
  _PSContact *v8;
  _PSContact *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSContact;
  v8 = -[_PSContact init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cnContact, a3);
    v9->_isChild = a4;
  }

  return v9;
}

- (CNContact)cnContact
{
  return self->_cnContact;
}

- (void)setCnContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (void)setIsChild:(BOOL)a3
{
  self->_isChild = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContact, 0);
}

@end
