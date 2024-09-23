@implementation MesaAutoBugCapture

- (id)getTypeForReason:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 1 < 3)
    return off_251CA0BA8[a3 - 1];
  v4.receiver = self;
  v4.super_class = (Class)MesaAutoBugCapture;
  -[BiometricAutoBugCapture getTypeForReason:](&v4, sel_getTypeForReason_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getSubtypeForReason:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 1 < 3)
    return off_251CA0BC0[a3 - 1];
  v4.receiver = self;
  v4.super_class = (Class)MesaAutoBugCapture;
  -[BiometricAutoBugCapture getSubtypeForReason:](&v4, sel_getSubtypeForReason_);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
