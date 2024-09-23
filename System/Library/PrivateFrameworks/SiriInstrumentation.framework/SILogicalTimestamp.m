@implementation SILogicalTimestamp

- (SILogicalTimestamp)initWithClockIdentifier:(id)a3 nanosecondsSinceBoot:(unint64_t)a4
{
  id v6;
  SILogicalTimestampInternal *v7;
  SILogicalTimestamp *v8;

  v6 = a3;
  v7 = -[SILogicalTimestampInternal initWithClockIdentifier:nanosecondsSinceBoot:]([SILogicalTimestampInternal alloc], "initWithClockIdentifier:nanosecondsSinceBoot:", v6, a4);

  v8 = -[SILogicalTimestamp initWithInternalType:](self, "initWithInternalType:", v7);
  return v8;
}

- (SILogicalTimestamp)initWithInternalType:(id)a3
{
  id v5;
  SILogicalTimestamp *v6;
  SILogicalTimestamp *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SILogicalTimestamp;
  v6 = -[SILogicalTimestamp init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlying, a3);

  return v7;
}

- (id)underlying
{
  return self->_underlying;
}

- (unint64_t)nanoSecondsSinceBoot
{
  return -[SILogicalTimestampInternal nanosecondsSinceBoot](self->_underlying, "nanosecondsSinceBoot");
}

- (NSUUID)clockIdentifier
{
  return -[SILogicalTimestampInternal clockIdentifier](self->_underlying, "clockIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  SILogicalTimestampInternal *v4;
  char isKindOfClass;
  SILogicalTimestampInternal *v6;
  BOOL v7;

  v4 = (SILogicalTimestampInternal *)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = *(SILogicalTimestampInternal **)v4->_anon_0;
LABEL_5:
    v7 = self->_underlying == v6;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
