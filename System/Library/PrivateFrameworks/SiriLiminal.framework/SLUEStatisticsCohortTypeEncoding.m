@implementation SLUEStatisticsCohortTypeEncoding

- (SLUEStatisticsCohortTypeEncoding)initWithDefaults
{
  SLUEStatisticsCohortTypeEncoding *v2;
  SLUEStatisticsCohortTypeEncoding *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLUEStatisticsCohortTypeEncoding;
  v2 = -[SLUEStatisticsCohortTypeEncoding init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SLUEStatisticsCohortTypeEncoding setRawValueEncoded:](v2, "setRawValueEncoded:", &unk_24D0CB400);
  return v3;
}

- (NSDictionary)rawValueEncoded
{
  return self->_rawValueEncoded;
}

- (void)setRawValueEncoded:(id)a3
{
  objc_storeStrong((id *)&self->_rawValueEncoded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValueEncoded, 0);
}

@end
