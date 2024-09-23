@implementation SRTrialParameter

- (void)setHasValueFromTrial:(BOOL)a3
{
  self->_hasValueFromTrial = a3;
}

- (SRParameter)parameter
{
  return self->_parameter;
}

- (SRTrialParameter)initWithParameter:(id)a3
{
  id v4;
  SRTrialParameter *v5;
  uint64_t v6;
  SRParameter *parameter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRTrialParameter;
  v5 = -[SRTrialParameter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    parameter = v5->_parameter;
    v5->_parameter = (SRParameter *)v6;

    v5->_hasValueFromTrial = 0;
  }

  return v5;
}

- (BOOL)hasValueFromTrial
{
  return self->_hasValueFromTrial;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SRParameter description](self->_parameter, "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_hasValueFromTrial)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("parameter = (%@), hasValueFromTrial = %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
}

@end
