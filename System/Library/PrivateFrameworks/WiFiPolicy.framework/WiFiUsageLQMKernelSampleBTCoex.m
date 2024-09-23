@implementation WiFiUsageLQMKernelSampleBTCoex

+ (id)sampleWithStruct:(btInfo *)a3 andTimestamp:(id)a4
{
  id v5;
  uint64_t var0;
  WiFiUsageLQMKernelSampleBTCoex *v7;

  v5 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleBTCoex sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = -[WiFiUsageLQMKernelSampleBTCoex initWithStruct:andTimestamp:]([WiFiUsageLQMKernelSampleBTCoex alloc], "initWithStruct:andTimestamp:", a3, v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleBTCoex)initWithStruct:(btInfo *)a3 andTimestamp:(id)a4
{
  NSDate *v6;
  WiFiUsageLQMKernelSampleBTCoex *v7;
  NSDate *timestamp;
  NSDate *v9;
  unint64_t v10;
  objc_super v12;

  v6 = (NSDate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)WiFiUsageLQMKernelSampleBTCoex;
  v7 = -[WiFiUsageLQMKernelSampleBTCoex init](&v12, sel_init);
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  v10 = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var1, a3->var2, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale"));
  v7->_btAntennaDurationPerc = v10;
  return v7;
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

- (unint64_t)btAntennaDurationPerc
{
  return self->_btAntennaDurationPerc;
}

- (void)setBtAntennaDurationPerc:(unint64_t)a3
{
  self->_btAntennaDurationPerc = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
