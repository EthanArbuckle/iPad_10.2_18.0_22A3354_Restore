@implementation WiFiUsageLQMKernelSampleOfdmDesense

+ (id)sampleWithStruct:(id *)a3 andTimestamp:(id)a4
{
  id v5;
  uint64_t var0;
  WiFiUsageLQMKernelSampleOfdmDesense *v7;

  v5 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleOfdmDesense sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = -[WiFiUsageLQMKernelSampleOfdmDesense initWithStruct:andTimestamp:]([WiFiUsageLQMKernelSampleOfdmDesense alloc], "initWithStruct:andTimestamp:", a3, v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleOfdmDesense)initWithStruct:(id *)a3 andTimestamp:(id)a4
{
  NSDate *v6;
  WiFiUsageLQMKernelSampleOfdmDesense *v7;
  NSDate *timestamp;
  NSDate *v9;
  unint64_t var2;
  uint64_t v11;
  NSString *desenseReason;
  objc_super v14;

  v6 = (NSDate *)a4;
  v14.receiver = self;
  v14.super_class = (Class)WiFiUsageLQMKernelSampleOfdmDesense;
  v7 = -[WiFiUsageLQMKernelSampleOfdmDesense init](&v14, sel_init);
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  var2 = a3->var2;
  v7->_ofdmDesense = a3->var1;
  v7->_bPhyDesense = var2;
  +[WiFiUsageLQMTransformations ofdmDesenseReason:](WiFiUsageLQMTransformations, "ofdmDesenseReason:", a3->var3);
  v11 = objc_claimAutoreleasedReturnValue();
  desenseReason = v7->_desenseReason;
  v7->_desenseReason = (NSString *)v11;

  return v7;
}

+ (id)featureFromFieldName:(id)a3
{
  return CFSTR("mode");
}

+ (id)allLQMProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMKernelSampleOfdmDesense;
  objc_msgSendSuper2(&v7, sel_allLQMProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", CFSTR("desenseReason"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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

- (unint64_t)ofdmDesense
{
  return self->_ofdmDesense;
}

- (void)setOfdmDesense:(unint64_t)a3
{
  self->_ofdmDesense = a3;
}

- (unint64_t)bPhyDesense
{
  return self->_bPhyDesense;
}

- (void)setBPhyDesense:(unint64_t)a3
{
  self->_bPhyDesense = a3;
}

- (NSString)desenseReason
{
  return self->_desenseReason;
}

- (void)setDesenseReason:(id)a3
{
  objc_storeStrong((id *)&self->_desenseReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desenseReason, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
