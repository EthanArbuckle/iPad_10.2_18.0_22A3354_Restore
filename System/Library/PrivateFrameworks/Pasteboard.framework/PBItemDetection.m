@implementation PBItemDetection

+ (id)_allowedValueClasses
{
  if (qword_1ECED8BD8 != -1)
    dispatch_once(&qword_1ECED8BD8, &__block_literal_global_5);
  return (id)_MergedGlobals_4;
}

void __39__PBItemDetection__allowedValueClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v6 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v5;

}

+ (id)detectionAbsent
{
  if (qword_1ECED8BE8 != -1)
    dispatch_once(&qword_1ECED8BE8, &__block_literal_global_6);
  return (id)qword_1ECED8BE0;
}

void __34__PBItemDetection_detectionAbsent__block_invoke()
{
  PBItemDetection *v0;
  void *v1;

  v0 = -[PBItemDetection initWithPresent:value:]([PBItemDetection alloc], "initWithPresent:value:", 0, 0);
  v1 = (void *)qword_1ECED8BE0;
  qword_1ECED8BE0 = (uint64_t)v0;

}

+ (id)detectionPresent
{
  if (qword_1ECED8BF8 != -1)
    dispatch_once(&qword_1ECED8BF8, &__block_literal_global_8);
  return (id)qword_1ECED8BF0;
}

void __35__PBItemDetection_detectionPresent__block_invoke()
{
  PBItemDetection *v0;
  void *v1;

  v0 = -[PBItemDetection initWithPresent:value:]([PBItemDetection alloc], "initWithPresent:value:", 1, 0);
  v1 = (void *)qword_1ECED8BF0;
  qword_1ECED8BF0 = (uint64_t)v0;

}

+ (id)detectionPresentWithValue:(id)a3
{
  id v3;
  PBItemDetection *v4;

  v3 = a3;
  v4 = -[PBItemDetection initWithPresent:value:]([PBItemDetection alloc], "initWithPresent:value:", 1, v3);

  return v4;
}

- (PBItemDetection)initWithPresent:(BOOL)a3 value:(id)a4
{
  id v7;
  PBItemDetection *v8;
  PBItemDetection *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PBItemDetection;
  v8 = -[PBItemDetection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_present = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBItemDetection)initWithCoder:(id)a3
{
  id v4;
  PBItemDetection *v5;
  void *v6;
  uint64_t v7;
  id value;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBItemDetection;
  v5 = -[PBItemDetection init](&v10, sel_init);
  if (v5)
  {
    v5->_present = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("present"));
    +[PBItemDetection _allowedValueClasses](PBItemDetection, "_allowedValueClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("value"));
    v7 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 present;
  id v5;

  present = self->_present;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", present, CFSTR("present"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (BOOL)present
{
  return self->_present;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
