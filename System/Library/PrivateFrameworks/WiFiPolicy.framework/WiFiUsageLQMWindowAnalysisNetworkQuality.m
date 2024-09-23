@implementation WiFiUsageLQMWindowAnalysisNetworkQuality

- (WiFiUsageLQMWindowAnalysisNetworkQuality)initWithRollingWindow:(id)a3 AndDictionary:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  uint64_t v10;
  id v11;
  WiFiUsageLQMWindowAnalysisNetworkQuality *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WiFiUsageLQMWindowAnalysisNetworkQuality;
  v10 = *(_QWORD *)&a5.var0 & 0xFFFFFFLL;
  v11 = a4;
  v12 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v14, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, a3, CFSTR("NetworkQuality"), v10, a6, a7);
  -[WiFiUsageLQMWindowAnalysisNetworkQuality setNetworkQualityResponsivenessScore:](v12, "setNetworkQualityResponsivenessScore:", 0x7FFFFFFFFFFFFFFFLL, v14.receiver, v14.super_class);
  -[WiFiUsageLQMWindowAnalysisNetworkQuality setNetworkQualityEventFields:](v12, "setNetworkQualityEventFields:", v11);

  return v12;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageLQMWindowAnalysisNetworkQuality;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v7, sel_addDimensionsTo_, v4);
  objc_msgSend(v4, "addEntriesFromDictionary:", self->_networkQualityEventFields);
  return v4;
}

- (unint64_t)networkQualityResponsivenessScore
{
  return self->_networkQualityResponsivenessScore;
}

- (void)setNetworkQualityResponsivenessScore:(unint64_t)a3
{
  self->_networkQualityResponsivenessScore = a3;
}

- (NSDictionary)networkQualityEventFields
{
  return self->_networkQualityEventFields;
}

- (void)setNetworkQualityEventFields:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityEventFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkQualityEventFields, 0);
}

@end
