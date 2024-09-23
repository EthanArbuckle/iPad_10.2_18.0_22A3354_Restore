@implementation IPAVideoAdjustmentStack

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  int64_t epoch;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAVideoAdjustmentStack;
  result = -[IPAAdjustmentStack copyWithZone:](&v6, sel_copyWithZone_, a3);
  epoch = self->_naturalDuration.epoch;
  *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_naturalDuration.value;
  *((_QWORD *)result + 5) = epoch;
  return result;
}

- (id)minimumVersionForFormat:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.video.slomo")))
  {
    v5 = CFSTR("1.1");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.video")))
    {
      v8.receiver = self;
      v8.super_class = (Class)IPAVideoAdjustmentStack;
      -[IPAAdjustmentStack minimumVersionForFormat:](&v8, sel_minimumVersionForFormat_, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v5 = CFSTR("1.0");
  }
  v6 = v5;
LABEL_7:

  return v5;
}

- (id)_debugDescriptionSuffix
{
  void *v2;
  __CFString *v3;
  void *v4;
  CMTime time;

  v2 = (void *)MEMORY[0x1E0CB3940];
  time = (CMTime)self->_naturalDuration;
  v3 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("naturalDuration=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setNaturalDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_naturalDuration.value = *(_OWORD *)&a3->var0;
  self->_naturalDuration.epoch = var3;
}

@end
