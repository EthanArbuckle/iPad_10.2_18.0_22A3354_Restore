@implementation OADFormula

- (OADFormula)initWithType:(int)a3 arg0:(OADFormulaArg)a4 arg1:(OADFormulaArg)a5 arg2:(OADFormulaArg)a6
{
  OADFormula *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OADFormula;
  result = -[OADFormula init](&v11, sel_init);
  if (result)
  {
    result->mType = a3;
    result->mArgs[0] = a4;
    result->mArgs[1] = a5;
    result->mArgs[2] = a6;
  }
  return result;
}

- (OADFormulaArg)argAtIndex:(unsigned int)a3
{
  return self->mArgs[a3];
}

- (int)type
{
  return self->mType;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (id)name
{
  return self->mName;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADFormula;
  -[OADFormula description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
