@implementation ICSFreeBusyTime

- (ICSFreeBusyTime)initWithPeriod:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSFreeBusyTime;
  return -[ICSProperty initWithValue:type:](&v4, sel_initWithValue_type_, a3, 5009);
}

- (unint64_t)fbtype
{
  void *v2;
  unint64_t v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("FBTYPE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setFbtype:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("FBTYPE"));

}

@end
