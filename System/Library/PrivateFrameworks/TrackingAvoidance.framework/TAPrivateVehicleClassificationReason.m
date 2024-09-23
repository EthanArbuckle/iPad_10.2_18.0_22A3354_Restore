@implementation TAPrivateVehicleClassificationReason

- (TAPrivateVehicleClassificationReason)initWithReason:(unint64_t)a3
{
  TAPrivateVehicleClassificationReason *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TAPrivateVehicleClassificationReason;
  result = -[TAPrivateVehicleClassificationReason init](&v5, sel_init);
  result->_reason = a3;
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_reason);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TAPrivateVehicleClassificationReason *v4;
  TAPrivateVehicleClassificationReason *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (TAPrivateVehicleClassificationReason *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TAPrivateVehicleClassificationReason reason](self, "reason");
      v7 = -[TAPrivateVehicleClassificationReason reason](v5, "reason");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end
