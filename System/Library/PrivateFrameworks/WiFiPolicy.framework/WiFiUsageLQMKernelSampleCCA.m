@implementation WiFiUsageLQMKernelSampleCCA

+ (id)sampleWithStruct:(ccaStats *)a3 andTimestamp:(id)a4
{
  id v5;
  uint64_t var0;
  WiFiUsageLQMKernelSampleCCA *v7;

  v5 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleCCA sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = -[WiFiUsageLQMKernelSampleCCA initWithStruct:andTimestamp:]([WiFiUsageLQMKernelSampleCCA alloc], "initWithStruct:andTimestamp:", a3, v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleCCA)initWithStruct:(ccaStats *)a3 andTimestamp:(id)a4
{
  id v7;
  WiFiUsageLQMKernelSampleCCA *v8;
  WiFiUsageLQMKernelSampleCCA *v9;
  objc_super v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v7 = a4;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:ccaSelf:ccaOther:interference:](WiFiUsageLQMTransformations, "ccaStatsWithDuration:ccaSelf:ccaOther:interference:", a3->var1, a3->var2, a3->var3, a3->var4);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:ccaSelf:ccaOther:interference:](WiFiUsageLQMTransformations, "ccaStatsWithDuration:ccaSelf:ccaOther:interference:", a3->var5, a3->var6, a3->var7, a3->var8);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:ccaSelf:ccaOther:interference:](WiFiUsageLQMTransformations, "ccaStatsWithDuration:ccaSelf:ccaOther:interference:", a3->var9, a3->var10, a3->var11, a3->var12);
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLQMKernelSampleCCA;
  v8 = -[WiFiUsageLQMKernelSampleCCA init](&v11, sel_init);
  objc_storeStrong((id *)&v8->_timestamp, a4);
  v8->_selfCca = v18;
  v8->_otherCca = v19;
  v8->_interference = v20;
  v8->_selfCcaSleepPerc = v15;
  v8->_otherCcaSleepPerc = v16;
  v8->_interferenceSleepPerc = v17;
  v8->_selfCcaWakePerc = v12;
  v8->_otherCcaWakePerc = v13;
  v8->_interferenceWakePerc = v14;
  v9 = v8;

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)selfCca
{
  return self->_selfCca;
}

- (unint64_t)otherCca
{
  return self->_otherCca;
}

- (unint64_t)interference
{
  return self->_interference;
}

- (unint64_t)selfCcaSleepPerc
{
  return self->_selfCcaSleepPerc;
}

- (unint64_t)otherCcaSleepPerc
{
  return self->_otherCcaSleepPerc;
}

- (unint64_t)interferenceSleepPerc
{
  return self->_interferenceSleepPerc;
}

- (unint64_t)selfCcaWakePerc
{
  return self->_selfCcaWakePerc;
}

- (unint64_t)otherCcaWakePerc
{
  return self->_otherCcaWakePerc;
}

- (unint64_t)interferenceWakePerc
{
  return self->_interferenceWakePerc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
