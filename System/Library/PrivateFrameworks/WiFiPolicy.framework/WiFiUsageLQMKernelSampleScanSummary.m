@implementation WiFiUsageLQMKernelSampleScanSummary

+ (id)sampleWithStruct:(id *)a3 andTimestamp:(id)a4
{
  id v5;
  uint64_t var0;
  WiFiUsageLQMKernelSampleScanSummary *v7;

  v5 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleScanSummary sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = -[WiFiUsageLQMKernelSampleScanSummary initWithStruct:andTimestamp:]([WiFiUsageLQMKernelSampleScanSummary alloc], "initWithStruct:andTimestamp:", a3, v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleScanSummary)initWithStruct:(id *)a3 andTimestamp:(id)a4
{
  NSDate *v6;
  WiFiUsageLQMKernelSampleScanSummary *v7;
  NSDate *timestamp;
  NSDate *v9;
  uint64_t v10;
  NSString *scanClient;
  objc_super v13;

  v6 = (NSDate *)a4;
  v13.receiver = self;
  v13.super_class = (Class)WiFiUsageLQMKernelSampleScanSummary;
  v7 = -[WiFiUsageLQMKernelSampleScanSummary init](&v13, sel_init);
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  v7->_scanDurationMS = a3->var1;
  +[WiFiUsageLQMTransformations scanClient:](WiFiUsageLQMTransformations, "scanClient:", a3->var5);
  v10 = objc_claimAutoreleasedReturnValue();
  scanClient = v7->_scanClient;
  v7->_scanClient = (NSString *)v10;

  return v7;
}

+ (id)featureFromFieldName:(id)a3
{
  return (id)objc_msgSend(&unk_1E88642B0, "objectForKeyedSubscript:", a3);
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
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMKernelSampleScanSummary;
  objc_msgSendSuper2(&v7, sel_allLQMProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", CFSTR("scanClient"));
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

- (unint64_t)scanDurationMS
{
  return self->_scanDurationMS;
}

- (void)setScanDurationMS:(unint64_t)a3
{
  self->_scanDurationMS = a3;
}

- (NSString)scanClient
{
  return self->_scanClient;
}

- (void)setScanClient:(id)a3
{
  objc_storeStrong((id *)&self->_scanClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanClient, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
