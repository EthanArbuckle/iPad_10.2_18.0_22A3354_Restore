@implementation HAPFieldWrapper

- (HAPFieldWrapper)initWithTlvId:(unint64_t)a3 name:(id)a4
{
  id v7;
  HAPFieldWrapper *v8;
  HAPFieldWrapper *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAPFieldWrapper;
  v8 = -[HAPFieldWrapper init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_tlvid = a3;
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

- (int64_t)tlvid
{
  return self->_tlvid;
}

- (void)setTlvid:(int64_t)a3
{
  self->_tlvid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
