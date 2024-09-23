@implementation HAPStringWrapper

+ (id)wrappertlv:(unint64_t)a3 name:(id)a4
{
  id v5;
  HAPStringWrapper *v6;

  v5 = a4;
  v6 = -[HAPFieldWrapper initWithTlvId:name:]([HAPStringWrapper alloc], "initWithTlvId:name:", a3, v5);

  return v6;
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_field, 0);
}

@end
