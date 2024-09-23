@implementation FPTime

- (FPTime)init
{
  FPTime *v2;
  FPTime *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPTime;
  v2 = -[FPTime init](&v5, sel_init);
  if (v2)
  {
    v3 = 0;
    if (!mach_get_times())
    {
      v2->_wallTime = (double)0 - *MEMORY[0x24BDBD238] + (double)0 * 0.000000001;
      v3 = v2;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (FPTime)now
{
  return objc_alloc_init(FPTime);
}

- (unint64_t)machAbsoluteTimeNsec
{
  unint64_t machAbsoluteTime;

  machAbsoluteTime = self->_machAbsoluteTime;
  if (qword_253D9AAC8 != -1)
    dispatch_once(&qword_253D9AAC8, &unk_24CFC9458);
  return machAbsoluteTime * dword_253D9AAC0 / *(unsigned int *)algn_253D9AAC4;
}

- (unint64_t)machContinuousTimeNsec
{
  unint64_t machContinuousTime;

  machContinuousTime = self->_machContinuousTime;
  if (qword_253D9AAC8 != -1)
    dispatch_once(&qword_253D9AAC8, &unk_24CFC9458);
  return machContinuousTime * dword_253D9AAC0 / *(unsigned int *)algn_253D9AAC4;
}

- (NSDate)date
{
  return (NSDate *)MEMORY[0x24BEDD108](MEMORY[0x24BDBCE60], sel_dateWithTimeIntervalSinceReferenceDate_);
}

- (unint64_t)machAbsoluteTime
{
  return self->_machAbsoluteTime;
}

- (unint64_t)machContinuousTime
{
  return self->_machContinuousTime;
}

- (double)wallTime
{
  return self->_wallTime;
}

@end
