@implementation WiFiUsageLQMWindowAnalysisJoin

- (WiFiUsageLQMWindowAnalysisJoin)initWithRollingWindow:(id)a3 andReasonString:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  uint64_t v10;
  id v11;
  WiFiUsageLQMWindowAnalysisJoin *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WiFiUsageLQMWindowAnalysisJoin;
  v10 = *(_QWORD *)&a5.var0 & 0xFFFFFFLL;
  v11 = a4;
  v12 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v14, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, a3, CFSTR("Join"), v10, a6, a7);
  -[WiFiUsageLQMWindowAnalysisJoin setJoinReason:](v12, "setJoinReason:", v11, v14.receiver, v14.super_class);

  return v12;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageLQMWindowAnalysisJoin;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v7, sel_addDimensionsTo_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_joinReason, CFSTR("join_reason"));
  return v4;
}

- (NSString)joinReason
{
  return self->_joinReason;
}

- (void)setJoinReason:(id)a3
{
  objc_storeStrong((id *)&self->_joinReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinReason, 0);
}

@end
