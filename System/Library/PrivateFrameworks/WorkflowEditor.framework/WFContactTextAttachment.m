@implementation WFContactTextAttachment

- (id)valueName
{
  void *v2;
  void *v3;

  -[WFContactTextAttachment value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFContact)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
