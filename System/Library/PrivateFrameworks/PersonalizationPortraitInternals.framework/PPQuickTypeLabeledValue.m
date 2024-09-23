@implementation PPQuickTypeLabeledValue

- (PPQuickTypeLabeledValue)initWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5 fields:(unsigned int)a6
{
  id v11;
  id v12;
  PPQuickTypeLabeledValue *v13;
  PPQuickTypeLabeledValue *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPQuickTypeLabeledValue;
  v13 = -[PPQuickTypeLabeledValue init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_label, a3);
    objc_storeStrong((id *)&v14->_value, a4);
    v14->_scoreBoost = a5;
    v14->_fields = a6;
  }

  return v14;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (double)scoreBoost
{
  return self->_scoreBoost;
}

- (unsigned)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  PPQuickTypeLabeledValue *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PPQuickTypeLabeledValue initWithLabel:value:scoreBoost:fields:]([PPQuickTypeLabeledValue alloc], "initWithLabel:value:scoreBoost:fields:", v6, v5, 0, 0.0);

  return v7;
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5
{
  id v7;
  id v8;
  PPQuickTypeLabeledValue *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[PPQuickTypeLabeledValue initWithLabel:value:scoreBoost:fields:]([PPQuickTypeLabeledValue alloc], "initWithLabel:value:scoreBoost:fields:", v8, v7, 0, a5);

  return v9;
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5 fields:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  PPQuickTypeLabeledValue *v11;

  v6 = *(_QWORD *)&a6;
  v9 = a4;
  v10 = a3;
  v11 = -[PPQuickTypeLabeledValue initWithLabel:value:scoreBoost:fields:]([PPQuickTypeLabeledValue alloc], "initWithLabel:value:scoreBoost:fields:", v10, v9, v6, a5);

  return v11;
}

@end
