@implementation _UIViewPropertyInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_previousValue, 0);
}

+ (id)viewPropertyInfoWithValue:(id)a3 previousValue:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setValue:", v6);

  objc_msgSend(v7, "setPreviousValue:", v5);
  return v7;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setPreviousValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousValue, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[_UIViewPropertyInfo value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  -[_UIViewPropertyInfo previousValue](self, "previousValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreviousValue:", v6);

  return v4;
}

- (UIVectorOperatable)previousValue
{
  return self->_previousValue;
}

- (UIVectorOperatable)value
{
  return self->_value;
}

@end
