@implementation SXDataTableConditionEngine

+ (id)engine
{
  return objc_alloc_init((Class)a1);
}

- (void)addConditionForEvenBoolean:(unint64_t)a3 withInteger:(unint64_t)a4
{
  if (a3)
  {
    -[SXDataTableConditionEngine setConditionCount:](self, "setConditionCount:", -[SXDataTableConditionEngine conditionCount](self, "conditionCount") + 1);
    if (-[SXDataTableConditionEngine isEvenInteger:](self, "isEvenInteger:", a4) == a3)
      -[SXDataTableConditionEngine setValidConditionCount:](self, "setValidConditionCount:", -[SXDataTableConditionEngine validConditionCount](self, "validConditionCount") + 1);
  }
}

- (void)addConditionForOddBoolean:(unint64_t)a3 withInteger:(unint64_t)a4
{
  if (a3)
  {
    -[SXDataTableConditionEngine setConditionCount:](self, "setConditionCount:", -[SXDataTableConditionEngine conditionCount](self, "conditionCount") + 1);
    if (-[SXDataTableConditionEngine isOddInteger:](self, "isOddInteger:", a4) == a3)
      -[SXDataTableConditionEngine setValidConditionCount:](self, "setValidConditionCount:", -[SXDataTableConditionEngine validConditionCount](self, "validConditionCount") + 1);
  }
}

- (void)addConditionForEqualInteger:(unint64_t)a3 withInteger:(unint64_t)a4
{
  if (a3 != -1)
  {
    -[SXDataTableConditionEngine setConditionCount:](self, "setConditionCount:", -[SXDataTableConditionEngine conditionCount](self, "conditionCount") + 1);
    if (a3 == a4)
      -[SXDataTableConditionEngine setValidConditionCount:](self, "setValidConditionCount:", -[SXDataTableConditionEngine validConditionCount](self, "validConditionCount") + 1);
  }
}

- (void)addConditionForEqualString:(id)a3 withString:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    -[SXDataTableConditionEngine setConditionCount:](self, "setConditionCount:", -[SXDataTableConditionEngine conditionCount](self, "conditionCount") + 1);
    if (objc_msgSend(v7, "isEqualToString:", v6))
      -[SXDataTableConditionEngine setValidConditionCount:](self, "setValidConditionCount:", -[SXDataTableConditionEngine validConditionCount](self, "validConditionCount") + 1);
  }

}

- (BOOL)isValid
{
  unint64_t v3;

  v3 = -[SXDataTableConditionEngine conditionCount](self, "conditionCount");
  return v3 == -[SXDataTableConditionEngine validConditionCount](self, "validConditionCount");
}

- (unint64_t)isEvenInteger:(int64_t)a3
{
  if ((a3 & 1) != 0)
    return 2;
  else
    return 1;
}

- (unint64_t)isOddInteger:(int64_t)a3
{
  if ((a3 & 1) != 0)
    return 1;
  else
    return 2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; isValid: %d; conditions: %lu; valid conditions: %lu>"),
               objc_opt_class(),
               self,
               -[SXDataTableConditionEngine isValid](self, "isValid"),
               -[SXDataTableConditionEngine conditionCount](self, "conditionCount"),
               -[SXDataTableConditionEngine validConditionCount](self, "validConditionCount"));
}

- (unint64_t)conditionCount
{
  return self->_conditionCount;
}

- (void)setConditionCount:(unint64_t)a3
{
  self->_conditionCount = a3;
}

- (unint64_t)validConditionCount
{
  return self->_validConditionCount;
}

- (void)setValidConditionCount:(unint64_t)a3
{
  self->_validConditionCount = a3;
}

@end
