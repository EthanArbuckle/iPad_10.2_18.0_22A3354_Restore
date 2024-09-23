@implementation SocCC

- (SocCC)initWithParams:(__CFDictionary *)a3 listID:(int)a4
{
  SocCC *v5;
  SocCC *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SocCC;
  v5 = -[ComponentControl initWithCC::](&v8, "initWithCC::", 3, a3);
  v6 = v5;
  if (v5)
  {
    v5->listIDPos = 101;
    *(&v5->super.currentPower + 1) = a4;
    v5->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d SoC "), 3);
  }
  return v6;
}

- (void)defaultAction
{
  self->listIDPos = self->super.previousValue;
  objc_msgSend((id)qword_1000A2E38, "setGPUPowerCeiling:fromDecisionSource:");
  objc_msgSend((id)qword_1000A2E38, "updateGPU");
}

- (void)refreshTGraphTelemetry
{
  *(float *)&self->gpuPowerTarget = (float)*(unsigned int *)&self->super.allowLIOverride;
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SocCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)SocCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SocCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return CFSTR("SoC - timeActive");
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SocCC;
    return -[ComponentControl copyHeaderForIndex:](&v7, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)SocCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SocCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%.3f"), *(float *)&self->gpuPowerTarget);
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SocCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }
}

@end
