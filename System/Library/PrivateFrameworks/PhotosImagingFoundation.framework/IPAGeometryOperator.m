@implementation IPAGeometryOperator

- (IPAGeometryOperator)init
{
  IPAGeometryOperator *result;

  result = (IPAGeometryOperator *)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (IPAGeometryOperator)initWithIdentifier:(id)a3
{
  id v5;
  IPAGeometryOperator *v6;
  IPAGeometryOperator *v7;
  IPAGeometryOperator *result;
  objc_super v9;

  v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)IPAGeometryOperator;
    v6 = -[IPAGeometryOperator init](&v9, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_identifer, a3);

    return v7;
  }
  else
  {
    result = (IPAGeometryOperator *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (id)identifier
{
  return self->_identifer;
}

- (id)transformForGeometry:(id)a3
{
  id v3;
  objc_class *v4;
  id result;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  result = (id)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifer, 0);
}

@end
