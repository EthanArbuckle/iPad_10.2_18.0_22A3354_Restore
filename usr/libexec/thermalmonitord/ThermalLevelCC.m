@implementation ThermalLevelCC

- (void)refreshFunctionalTelemetry
{
  unsigned int previousValue;
  unsigned int v3;

  previousValue = self->super.previousValue;
  if (previousValue == 100)
    v3 = 0;
  else
    v3 = (100 - previousValue) / 0xA + 1;
  HIDWORD(self->product) = v3;
}

- (ThermalLevelCC)initWithProduct:(id)a3
{
  char *v4;
  ThermalLevelCC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ThermalLevelCC;
  v4 = -[ComponentControl initWithCC::](&v7, "initWithCC::", 5, 0);
  v5 = (ThermalLevelCC *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 18) = 100;
    *(_QWORD *)(v4 + 140) = a3;
    *((_DWORD *)v4 + 22) = 2;
    *((_DWORD *)v4 + 37) = 0;
    *((_DWORD *)v4 + 38) = 0;
    *((_QWORD *)v4 + 6) = CFStringCreateWithFormat(0, 0, CFSTR("%d Thermallevel "), 5);
  }
  return v5;
}

- (void)defaultAction
{
  if (HIDWORD(self->product) != self->currThermLevel)
  {
    objc_msgSend(*(id *)(&self->super.currentPower + 1), "setComponentThermalStatusLevel:");
    self->currThermLevel = HIDWORD(self->product);
  }
}

@end
