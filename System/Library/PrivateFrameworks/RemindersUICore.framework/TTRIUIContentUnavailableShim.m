@implementation TTRIUIContentUnavailableShim

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

+ (id)instanceWrappingImpl:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (id *)objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong(v5 + 1, a3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TTRIUIContentUnavailableShim)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  TTRIUIContentUnavailableShim *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "implClass")), "initWithCoder:", v4);

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "instanceWrappingImpl:", v5);
    v6 = (TTRIUIContentUnavailableShim *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSCopying copyWithZone:](self->_impl, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
