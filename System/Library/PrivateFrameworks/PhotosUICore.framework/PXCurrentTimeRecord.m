@implementation PXCurrentTimeRecord

- (PXCurrentTimeRecord)initWithSampleTime:(id *)a3
{
  __int128 v4;

  return -[PXCurrentTimeRecord initWithSampleTime:rate:](self, "initWithSampleTime:rate:", &v4, COERCE_DOUBLE(__PAIR64__(HIDWORD(a3->var0), 1.0)));
}

- (PXCurrentTimeRecord)initWithSampleTime:(id *)a3 rate:(float)a4
{
  char *v6;
  int64_t var3;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCurrentTimeRecord;
  v6 = -[PXCurrentTimeRecord init](&v9, sel_init);
  if (v6)
  {
    *((CFAbsoluteTime *)v6 + 1) = CFAbsoluteTimeGetCurrent();
    var3 = a3->var3;
    *(_OWORD *)(v6 + 24) = *(_OWORD *)&a3->var0;
    *((_QWORD *)v6 + 5) = var3;
    *((float *)v6 + 5) = a4;
    v6[16] = a3->var2 & 1;
  }
  return (PXCurrentTimeRecord *)v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CFAbsoluteTime v6;
  float v7;
  Float64 v8;
  uint64_t v9;
  CMTime v10;
  CMTime lhs;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PXCurrentTimeRecord isValid](self, "isValid");
  if ((result & 1) != 0)
  {
    v6 = CFAbsoluteTimeGetCurrent() - self->_sampleTimestamp;
    -[PXCurrentTimeRecord rate](self, "rate");
    v8 = v6 * v7;
    -[PXCurrentTimeRecord sampleTime](self, "sampleTime");
    CMTimeMakeWithSeconds(&v10, v8, PXAudioDefaultCMTimeScale);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &lhs, &v10);
  }
  else
  {
    v9 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v9 + 16);
  }
  return result;
}

- (id)description
{
  id v3;
  __CFString *v4;
  void *v5;
  float v6;
  double v7;
  __CFString *v8;
  void *v9;
  CMTime v11;
  CMTime time;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PXCurrentTimeRecord sampleTime](self, "sampleTime");
  v4 = (__CFString *)CMTimeCopyDescription(0, &time);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sampleTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCurrentTimeRecord rate](self, "rate");
  v7 = v6;
  -[PXCurrentTimeRecord currentTime](self, "currentTime");
  v8 = (__CFString *)CMTimeCopyDescription(0, &v11);
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Sample Time: %@, Sample Timestamp: %@; Rate: %.2f; Current Time: %@>"),
                 self,
                 self,
                 v4,
                 v5,
                 *(_QWORD *)&v7,
                 v8);

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (float)rate
{
  return self->_rate;
}

- (BOOL)isValid
{
  return self->_isValid;
}

@end
