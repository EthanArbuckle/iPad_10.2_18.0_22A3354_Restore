@implementation RBSInvalidateUnderConditionAttribute

+ (id)attributeWithCondition:(id)a3 minValue:(int64_t)a4
{
  id v5;
  _QWORD *v6;

  v5 = a3;
  v6 = -[RBSInvalidateUnderConditionAttribute _initWithCondition:minValue:]([RBSInvalidateUnderConditionAttribute alloc], v5, a4);

  return v6;
}

- (_QWORD)_initWithCondition:(uint64_t)a3 minValue:
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RBSInvalidateUnderConditionAttribute;
    a1 = objc_msgSendSuper2(&v9, sel__init);
    if (a1)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSInvalidateUnderConditionAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_condition, CFSTR("_condition"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_minValue, CFSTR("_minValue"));

}

- (RBSInvalidateUnderConditionAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSInvalidateUnderConditionAttribute *v5;
  void *v6;
  uint64_t v7;
  NSString *condition;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSInvalidateUnderConditionAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v10, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_condition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    condition = v5->_condition;
    v5->_condition = (NSString *)v7;

    v5->_minValue = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_minValue"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *condition;
  NSString *v6;
  char v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSInvalidateUnderConditionAttribute;
  if (!-[RBSAttribute isEqual:](&v10, sel_isEqual_, v4) || self->_minValue != v4[2])
    goto LABEL_9;
  condition = self->_condition;
  v6 = (NSString *)v4[1];
  if (condition == v6)
  {
    v9 = 1;
    goto LABEL_10;
  }
  if (condition && v6 != 0)
    v9 = -[NSString isEqual:](condition, "isEqual:");
  else
LABEL_9:
    v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  return self->_minValue ^ -[NSString hash](self->_condition, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| condition:%@ minValue:%lld>"), v4, self->_condition, self->_minValue);

  return v5;
}

- (NSString)condition
{
  return self->_condition;
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
