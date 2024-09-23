@implementation SBINAppIntentSystemContext

- (SBINAppIntentSystemContext)initWithPreciseTimestamp:(id)a3 actionSource:(unint64_t)a4
{
  id v7;
  SBINAppIntentSystemContext *v8;
  SBINAppIntentSystemContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBINAppIntentSystemContext;
  v8 = -[SBINAppIntentSystemContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_preciseTimestamp, a3);
    v9->_actionSource = a4;
  }

  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  NSDate *preciseTimestamp;
  id v5;
  id v6;
  id v7;

  preciseTimestamp = self->_preciseTimestamp;
  v5 = a3;
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", preciseTimestamp, CFSTR("preciseTimestamp"));
  NSStringFromSBINAppIntentActionSource(self->_actionSource);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("actionSource"));

}

- (BOOL)isEqual:(id)a3
{
  SBINAppIntentSystemContext *v4;
  void *v5;
  char isKindOfClass;
  SBINAppIntentSystemContext *v7;
  BOOL v8;

  v4 = (SBINAppIntentSystemContext *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (BSEqualObjects())
        v8 = self->_actionSource == v7->_actionSource;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_actionSource + -[NSDate hash](self->_preciseTimestamp, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (NSDate)preciseTimestamp
{
  return self->_preciseTimestamp;
}

- (unint64_t)actionSource
{
  return self->_actionSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preciseTimestamp, 0);
}

@end
