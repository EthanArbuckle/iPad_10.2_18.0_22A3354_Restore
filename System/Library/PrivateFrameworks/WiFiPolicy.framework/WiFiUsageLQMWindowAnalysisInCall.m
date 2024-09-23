@implementation WiFiUsageLQMWindowAnalysisInCall

- (WiFiUsageLQMWindowAnalysisInCall)initWithRollingWindow:(id)a3 andCallStatus:(id)a4 andCallDuration:(double)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8
{
  uint64_t v12;
  id v13;
  WiFiUsageLQMWindowAnalysisInCall *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageLQMWindowAnalysisInCall;
  v12 = *(_QWORD *)&a6.var0 & 0xFFFFFFLL;
  v13 = a4;
  v14 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v16, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, a3, CFSTR("InCall"), v12, a7, a8);
  -[WiFiUsageLQMWindowAnalysisInCall setStatus:](v14, "setStatus:", v13, v16.receiver, v16.super_class);

  -[WiFiUsageLQMWindowAnalysisInCall setDuration:](v14, "setDuration:", a5);
  return v14;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMWindowAnalysisInCall;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v8, sel_addDimensionsTo_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_status, CFSTR("call_status"));
  if (!-[NSString isEqualToString:](self->_status, "isEqualToString:", CFSTR("Call Start")))
  {
    +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:](WiFiUsageLQMTransformations, "getBinTimeIntervalUpTo12h:As:", 1, self->_duration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("call_duration"));

  }
  return v4;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
}

@end
