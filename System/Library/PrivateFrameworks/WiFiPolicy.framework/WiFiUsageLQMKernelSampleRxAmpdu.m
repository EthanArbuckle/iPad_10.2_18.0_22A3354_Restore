@implementation WiFiUsageLQMKernelSampleRxAmpdu

+ (id)sampleWithStruct:(apple80211_rx_ampdu_lqmct_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7;
  uint64_t var0;
  WiFiUsageLQMKernelSampleRxAmpdu *v9;

  v7 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleRxAmpdu sampleWithStruct:WithReferenceDate:AsNsec:]", var0);
    v9 = 0;
  }
  else
  {
    v9 = -[WiFiUsageLQMKernelSampleRxAmpdu initWithStruct:WithReferenceDate:AsNsec:]([WiFiUsageLQMKernelSampleRxAmpdu alloc], "initWithStruct:WithReferenceDate:AsNsec:", a3, v7, a5);
  }

  return v9;
}

- (WiFiUsageLQMKernelSampleRxAmpdu)initWithStruct:(apple80211_rx_ampdu_lqmct_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7;
  WiFiUsageLQMKernelSampleRxAmpdu *v8;
  uint64_t v9;
  NSDate *timestamp;
  unint64_t var1_high;
  uint64_t var2;
  unint64_t var7;
  unint64_t var11;
  unint64_t var4;
  unint64_t var6;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WiFiUsageLQMKernelSampleRxAmpdu;
  v7 = a4;
  v8 = -[WiFiUsageLQMKernelSampleRxAmpdu init](&v18, sel_init);
  +[WiFiUsageLQMTransformations dateWithMachContinuousTime:WithRef:asNS:](WiFiUsageLQMTransformations, "dateWithMachContinuousTime:WithRef:asNS:", *(_QWORD *)(&a3->var0 + 1), v7, a5, v18.receiver, v18.super_class);
  v9 = objc_claimAutoreleasedReturnValue();

  timestamp = v8->_timestamp;
  v8->_timestamp = (NSDate *)v9;

  var1_high = HIDWORD(a3->var1);
  var2 = a3->var2;
  v8->_rxAmpdu = var1_high;
  v8->_rxMpduDensity = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", var2, var1_high, +[WiFiUsageLQMTransformations mpduDensityScale](WiFiUsageLQMTransformations, "mpduDensityScale"));
  v8->_rxBarOverRxAmpdu = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var10, v8->_rxAmpdu, +[WiFiUsageLQMTransformations mpduDensityScale](WiFiUsageLQMTransformations, "mpduDensityScale"));
  v8->_rxQueuedOverRxAmpdu = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var13, v8->_rxAmpdu, 1);
  var7 = a3->var7;
  v8->_rxAddBaReq = a3->var8;
  v8->_txAddBaResp = a3->var9;
  var11 = a3->var11;
  v8->_txDelBa = var11;
  v8->_rxDelBa = var11;
  v8->_rxAmpduAll = HIDWORD(a3->var1);
  var4 = a3->var4;
  v8->_rxHoles = a3->var3;
  v8->_rxDup = var4;
  var6 = a3->var6;
  v8->_rxStuck = a3->var5;
  v8->_rxOow = var6;
  v8->_rxOos = var7;
  return v8;
}

+ (id)featureFromFieldName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", CFSTR("rxAmpdu"), CFSTR("median"), CFSTR("rxMpduDensity"), CFSTR("median"), CFSTR("rxBarOverRxAmpdu"), CFSTR("median"), CFSTR("rxQueuedOverRxAmpdu"), CFSTR("sum"), CFSTR("rxAddBaReq"), CFSTR("sum"), CFSTR("txAddBaResp"), CFSTR("sum"), CFSTR("txDelBa"), CFSTR("sum"), CFSTR("rxDelBa"), CFSTR("sum"), CFSTR("rxAmpduAll"),
    CFSTR("sum"),
    CFSTR("rxHoles"),
    CFSTR("sum"),
    CFSTR("rxDup"),
    CFSTR("sum"),
    CFSTR("rxStuck"),
    CFSTR("sum"),
    CFSTR("rxOow"),
    CFSTR("sum"),
    CFSTR("rxOos"),
    0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (unint64_t)rxAmpdu
{
  return self->_rxAmpdu;
}

- (void)setRxAmpdu:(unint64_t)a3
{
  self->_rxAmpdu = a3;
}

- (unint64_t)rxMpduDensity
{
  return self->_rxMpduDensity;
}

- (void)setRxMpduDensity:(unint64_t)a3
{
  self->_rxMpduDensity = a3;
}

- (unint64_t)rxBarOverRxAmpdu
{
  return self->_rxBarOverRxAmpdu;
}

- (void)setRxBarOverRxAmpdu:(unint64_t)a3
{
  self->_rxBarOverRxAmpdu = a3;
}

- (unint64_t)rxQueuedOverRxAmpdu
{
  return self->_rxQueuedOverRxAmpdu;
}

- (void)setRxQueuedOverRxAmpdu:(unint64_t)a3
{
  self->_rxQueuedOverRxAmpdu = a3;
}

- (unint64_t)rxAmpduAll
{
  return self->_rxAmpduAll;
}

- (void)setRxAmpduAll:(unint64_t)a3
{
  self->_rxAmpduAll = a3;
}

- (unint64_t)rxHoles
{
  return self->_rxHoles;
}

- (void)setRxHoles:(unint64_t)a3
{
  self->_rxHoles = a3;
}

- (unint64_t)rxDup
{
  return self->_rxDup;
}

- (void)setRxDup:(unint64_t)a3
{
  self->_rxDup = a3;
}

- (unint64_t)rxStuck
{
  return self->_rxStuck;
}

- (void)setRxStuck:(unint64_t)a3
{
  self->_rxStuck = a3;
}

- (unint64_t)rxOow
{
  return self->_rxOow;
}

- (void)setRxOow:(unint64_t)a3
{
  self->_rxOow = a3;
}

- (unint64_t)rxOos
{
  return self->_rxOos;
}

- (void)setRxOos:(unint64_t)a3
{
  self->_rxOos = a3;
}

- (unint64_t)rxAddBaReq
{
  return self->_rxAddBaReq;
}

- (void)setRxAddBaReq:(unint64_t)a3
{
  self->_rxAddBaReq = a3;
}

- (unint64_t)txAddBaResp
{
  return self->_txAddBaResp;
}

- (void)setTxAddBaResp:(unint64_t)a3
{
  self->_txAddBaResp = a3;
}

- (unint64_t)txDelBa
{
  return self->_txDelBa;
}

- (void)setTxDelBa:(unint64_t)a3
{
  self->_txDelBa = a3;
}

- (unint64_t)rxDelBa
{
  return self->_rxDelBa;
}

- (void)setRxDelBa:(unint64_t)a3
{
  self->_rxDelBa = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
