@implementation DOCUIContentUnavailableShim

+ (id)instanceWrappingImpl:(id)a3
{
  id v5;
  id *v6;

  v5 = a3;
  if (v5)
  {
    v6 = (id *)objc_alloc_init((Class)objc_opt_class(a1));
    objc_storeStrong(v6 + 1, a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  -[NSCopying encodeWithCoder:](self->_impl, "encodeWithCoder:", a3);
}

+ (Class)implClass
{
  return 0;
}

- (DOCUIContentUnavailableShim)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  DOCUIContentUnavailableShim *v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self), "implClass")), "initWithCoder:", v4);

  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "instanceWrappingImpl:", v5);
    v7 = (DOCUIContentUnavailableShim *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class(self));
  v6 = -[NSCopying copyWithZone:](self->_impl, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

@end
