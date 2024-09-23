@implementation SUCoreDiagStats

- (SUCoreDiagStats)init
{
  SUCoreDiagStats *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCoreDiagStats;
  result = -[SUCoreDiagStats init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_faultAllIndications = 0u;
    *(_OWORD *)&result->_faultCount = 0u;
    *(_OWORD *)&result->_failureIndicationsCount = 0u;
    *(_OWORD *)&result->_anomalyAllIndications = 0u;
    *(_OWORD *)&result->_anomalyCount = 0u;
    *(_OWORD *)&result->_errorIndicationsCount = 0u;
    *(_OWORD *)&result->_endFailAllIndications = 0u;
    *(_OWORD *)&result->_endFailCount = 0u;
    *(_OWORD *)&result->_beginCount = 0u;
  }
  return result;
}

- (id)initIgnoringSuccessRelated
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCoreDiagStats;
  result = -[SUCoreDiagStats init](&v3, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = -1;
    *((_QWORD *)result + 2) = -1;
    *(_OWORD *)((char *)result + 24) = 0u;
    *(_OWORD *)((char *)result + 40) = 0u;
    *(_OWORD *)((char *)result + 56) = 0u;
    *(_OWORD *)((char *)result + 72) = 0u;
    *(_OWORD *)((char *)result + 88) = 0u;
    *(_OWORD *)((char *)result + 104) = 0u;
    *(_OWORD *)((char *)result + 120) = 0u;
    *((_QWORD *)result + 17) = 0;
    *((_QWORD *)result + 18) = -1;
  }
  return result;
}

- (SUCoreDiagStats)initWithBeginCount:(int64_t)a3 withEndSuccessCount:(int64_t)a4 withEndFailCount:(int64_t)a5 withEndFailIndicationsCount:(int64_t)a6 withEndFailAllIndications:(int64_t)a7 withErrorCount:(int64_t)a8 withErrorIndicationsCount:(int64_t)a9 withErrorAllIndications:(int64_t)a10 withAnomalyCount:(int64_t)a11 withAnomalyIndicationsCount:(int64_t)a12 withAnomalyAllIndications:(int64_t)a13 withFailureCount:(int64_t)a14 withFailureIndicationsCount:(int64_t)a15 withFailureAllIndications:(int64_t)a16 withFaultCount:(int64_t)a17 withFaultIndicationsCount:(int64_t)a18 withFaultAllIndications:(int64_t)a19 withStateEventCount:(int64_t)a20
{
  SUCoreDiagStats *result;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SUCoreDiagStats;
  result = -[SUCoreDiagStats init](&v27, sel_init);
  if (result)
  {
    result->_beginCount = a3;
    result->_endSuccessCount = a4;
    result->_endFailCount = a5;
    result->_endFailIndicationsCount = a6;
    result->_endFailAllIndications = a7;
    result->_errorCount = a8;
    result->_errorIndicationsCount = a9;
    result->_errorAllIndications = a10;
    result->_anomalyCount = a11;
    result->_anomalyIndicationsCount = a12;
    result->_anomalyAllIndications = a13;
    result->_failureCount = a14;
    result->_failureIndicationsCount = a15;
    result->_failureAllIndications = a16;
    result->_faultCount = a17;
    result->_faultIndicationsCount = a18;
    result->_faultAllIndications = a19;
    result->_stateEventCount = a20;
  }
  return result;
}

- (id)initByCombining:(id)a3 withBeginCount:(int64_t)a4 withEndSuccessCount:(int64_t)a5 withEndFailCount:(int64_t)a6 withEndFailIndicationsCount:(int64_t)a7 withEndFailAllIndications:(int64_t)a8 withErrorCount:(int64_t)a9 withErrorIndicationsCount:(int64_t)a10 withErrorAllIndications:(int64_t)a11 withAnomalyCount:(int64_t)a12 withAnomalyIndicationsCount:(int64_t)a13 withAnomalyAllIndications:(int64_t)a14 withFailureCount:(int64_t)a15 withFailureIndicationsCount:(int64_t)a16 withFailureAllIndications:(int64_t)a17 withFaultCount:(int64_t)a18 withFaultIndicationsCount:(int64_t)a19 withFaultAllIndications:(int64_t)a20 withStateEventCount:(int64_t)a21
{
  id v27;
  SUCoreDiagStats *v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  objc_super v39;

  v27 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreDiagStats;
  v28 = -[SUCoreDiagStats init](&v39, sel_init);
  if (v28)
  {
    if ((a4 & 0x8000000000000000) == 0)
      a4 += objc_msgSend(v27, "beginCount");
    v28->_beginCount = a4;
    if ((a5 & 0x8000000000000000) == 0)
      a5 += objc_msgSend(v27, "endSuccessCount");
    v29 = a9;
    v28->_endSuccessCount = a5;
    if ((a6 & 0x8000000000000000) == 0)
      a6 += objc_msgSend(v27, "endFailCount");
    v30 = a10;
    v28->_endFailCount = a6;
    if ((a7 & 0x8000000000000000) == 0)
      a7 += objc_msgSend(v27, "endFailIndicationsCount");
    v31 = a12;
    v28->_endFailIndicationsCount = a7;
    v28->_endFailAllIndications = objc_msgSend(v27, "endFailAllIndications") | a8;
    if ((a9 & 0x8000000000000000) == 0)
      v29 = objc_msgSend(v27, "errorCount") + a9;
    v32 = a13;
    v28->_errorCount = v29;
    if ((a10 & 0x8000000000000000) == 0)
      v30 = objc_msgSend(v27, "errorIndicationsCount") + a10;
    v33 = a15;
    v28->_errorIndicationsCount = v30;
    v28->_errorAllIndications = objc_msgSend(v27, "errorAllIndications") | a11;
    if ((a12 & 0x8000000000000000) == 0)
      v31 = objc_msgSend(v27, "anomalyCount") + a12;
    v34 = a16;
    v28->_anomalyCount = v31;
    if ((a13 & 0x8000000000000000) == 0)
      v32 = objc_msgSend(v27, "anomalyIndicationsCount") + a13;
    v35 = a18;
    v28->_anomalyIndicationsCount = v32;
    v28->_anomalyAllIndications = objc_msgSend(v27, "anomalyAllIndications") | a14;
    if ((a15 & 0x8000000000000000) == 0)
      v33 = objc_msgSend(v27, "failureCount") + a15;
    v36 = a19;
    v28->_failureCount = v33;
    if ((a16 & 0x8000000000000000) == 0)
      v34 = objc_msgSend(v27, "failureIndicationsCount") + a16;
    v37 = a21;
    v28->_failureIndicationsCount = v34;
    v28->_failureAllIndications = objc_msgSend(v27, "failureAllIndications") | a17;
    if ((a18 & 0x8000000000000000) == 0)
      v35 = objc_msgSend(v27, "faultCount") + a18;
    v28->_faultCount = v35;
    if ((a19 & 0x8000000000000000) == 0)
      v36 = objc_msgSend(v27, "faultIndicationsCount") + a19;
    v28->_faultIndicationsCount = v36;
    v28->_faultAllIndications = objc_msgSend(v27, "faultAllIndications") | a20;
    if ((a21 & 0x8000000000000000) == 0)
      v37 = objc_msgSend(v27, "stateEventCount") + a21;
    v28->_stateEventCount = v37;
  }

  return v28;
}

- (id)initByCombining:(id)a3 withAdditonal:(id)a4
{
  id v6;
  id v7;
  SUCoreDiagStats *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SUCoreDiagStats;
  v8 = -[SUCoreDiagStats init](&v28, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "beginCount");
    v8->_beginCount = objc_msgSend(v7, "beginCount") + v9;
    v10 = objc_msgSend(v6, "endSuccessCount");
    v8->_endSuccessCount = objc_msgSend(v7, "endSuccessCount") + v10;
    v11 = objc_msgSend(v6, "endFailCount");
    v8->_endFailCount = objc_msgSend(v7, "endFailCount") + v11;
    v12 = objc_msgSend(v6, "endFailIndicationsCount");
    v8->_endFailIndicationsCount = objc_msgSend(v7, "endFailIndicationsCount") + v12;
    v13 = objc_msgSend(v6, "endFailAllIndications");
    v8->_endFailAllIndications = objc_msgSend(v7, "endFailAllIndications") | v13;
    v14 = objc_msgSend(v6, "errorCount");
    v8->_errorCount = objc_msgSend(v7, "errorCount") + v14;
    v15 = objc_msgSend(v6, "errorIndicationsCount");
    v8->_errorIndicationsCount = objc_msgSend(v7, "errorIndicationsCount") + v15;
    v16 = objc_msgSend(v6, "errorAllIndications");
    v8->_errorAllIndications = objc_msgSend(v7, "errorAllIndications") | v16;
    v17 = objc_msgSend(v6, "anomalyCount");
    v8->_anomalyCount = objc_msgSend(v7, "anomalyCount") + v17;
    v18 = objc_msgSend(v6, "anomalyIndicationsCount");
    v8->_anomalyIndicationsCount = objc_msgSend(v7, "anomalyIndicationsCount") + v18;
    v19 = objc_msgSend(v6, "anomalyAllIndications");
    v8->_anomalyAllIndications = objc_msgSend(v7, "anomalyAllIndications") | v19;
    v20 = objc_msgSend(v6, "failureCount");
    v8->_failureCount = objc_msgSend(v7, "failureCount") + v20;
    v21 = objc_msgSend(v6, "failureIndicationsCount");
    v8->_failureIndicationsCount = objc_msgSend(v7, "failureIndicationsCount") + v21;
    v22 = objc_msgSend(v6, "failureAllIndications");
    v8->_failureAllIndications = objc_msgSend(v7, "failureAllIndications") | v22;
    v23 = objc_msgSend(v6, "faultCount");
    v8->_faultCount = objc_msgSend(v7, "faultCount") + v23;
    v24 = objc_msgSend(v6, "faultIndicationsCount");
    v8->_faultIndicationsCount = objc_msgSend(v7, "faultIndicationsCount") + v24;
    v25 = objc_msgSend(v6, "faultAllIndications");
    v8->_faultAllIndications = objc_msgSend(v7, "faultAllIndications") | v25;
    v26 = objc_msgSend(v6, "stateEventCount");
    v8->_stateEventCount = objc_msgSend(v7, "stateEventCount") + v26;
  }

  return v8;
}

- (SUCoreDiagStats)initWithCoder:(id)a3
{
  id v4;
  SUCoreDiagStats *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCoreDiagStats;
  v5 = -[SUCoreDiagStats init](&v7, sel_init);
  if (v5)
  {
    v5->_beginCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("beginCount"));
    v5->_endSuccessCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("endSuccessCount"));
    v5->_endFailCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("endFailCount"));
    v5->_endFailIndicationsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("endFailIndicationsCount"));
    v5->_endFailAllIndications = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("endFailAllIndications"));
    v5->_errorCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("errorCount"));
    v5->_errorIndicationsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("errorIndicationsCount"));
    v5->_errorAllIndications = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("errorAllIndications"));
    v5->_anomalyCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("anomalyCount"));
    v5->_anomalyIndicationsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("anomalyIndicationsCount"));
    v5->_anomalyAllIndications = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("anomalyAllIndications"));
    v5->_failureCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("failureCount"));
    v5->_failureIndicationsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("failureIndicationsCount"));
    v5->_failureAllIndications = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("failureAllIndications"));
    v5->_faultCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("faultCount"));
    v5->_faultIndicationsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("faultIndicationsCount"));
    v5->_faultAllIndications = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("faultAllIndications"));
    v5->_stateEventCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("stateEventCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t beginCount;
  id v5;

  beginCount = self->_beginCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", beginCount, CFSTR("beginCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_endSuccessCount, CFSTR("endSuccessCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_endFailCount, CFSTR("endFailCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_endFailIndicationsCount, CFSTR("endFailIndicationsCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_endFailAllIndications, CFSTR("endFailAllIndications"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_errorCount, CFSTR("errorCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_errorIndicationsCount, CFSTR("errorIndicationsCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_errorAllIndications, CFSTR("errorAllIndications"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_anomalyCount, CFSTR("anomalyCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_anomalyIndicationsCount, CFSTR("anomalyIndicationsCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_anomalyAllIndications, CFSTR("anomalyAllIndications"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_failureCount, CFSTR("failureCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_failureIndicationsCount, CFSTR("failureIndicationsCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_failureAllIndications, CFSTR("failureAllIndications"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_faultCount, CFSTR("faultCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_faultIndicationsCount, CFSTR("faultIndicationsCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_faultAllIndications, CFSTR("faultAllIndications"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_stateEventCount, CFSTR("stateEventCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  SUCoreDiagStats *v3;

  v3 = objc_alloc_init(SUCoreDiagStats);
  -[SUCoreDiagStats setBeginCount:](v3, "setBeginCount:", -[SUCoreDiagStats beginCount](self, "beginCount"));
  -[SUCoreDiagStats setEndSuccessCount:](v3, "setEndSuccessCount:", -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount"));
  -[SUCoreDiagStats setEndFailCount:](v3, "setEndFailCount:", -[SUCoreDiagStats endFailCount](self, "endFailCount"));
  -[SUCoreDiagStats setEndFailIndicationsCount:](v3, "setEndFailIndicationsCount:", -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount"));
  -[SUCoreDiagStats setEndFailAllIndications:](v3, "setEndFailAllIndications:", -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications"));
  -[SUCoreDiagStats setErrorCount:](v3, "setErrorCount:", -[SUCoreDiagStats errorCount](self, "errorCount"));
  -[SUCoreDiagStats setErrorIndicationsCount:](v3, "setErrorIndicationsCount:", -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount"));
  -[SUCoreDiagStats setErrorAllIndications:](v3, "setErrorAllIndications:", -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications"));
  -[SUCoreDiagStats setAnomalyCount:](v3, "setAnomalyCount:", -[SUCoreDiagStats anomalyCount](self, "anomalyCount"));
  -[SUCoreDiagStats setAnomalyIndicationsCount:](v3, "setAnomalyIndicationsCount:", -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount"));
  -[SUCoreDiagStats setAnomalyAllIndications:](v3, "setAnomalyAllIndications:", -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications"));
  -[SUCoreDiagStats setFailureCount:](v3, "setFailureCount:", -[SUCoreDiagStats failureCount](self, "failureCount"));
  -[SUCoreDiagStats setFailureIndicationsCount:](v3, "setFailureIndicationsCount:", -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount"));
  -[SUCoreDiagStats setFailureAllIndications:](v3, "setFailureAllIndications:", -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications"));
  -[SUCoreDiagStats setFaultCount:](v3, "setFaultCount:", -[SUCoreDiagStats faultCount](self, "faultCount"));
  -[SUCoreDiagStats setFaultIndicationsCount:](v3, "setFaultIndicationsCount:", -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount"));
  -[SUCoreDiagStats setFaultAllIndications:](v3, "setFaultAllIndications:", -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications"));
  -[SUCoreDiagStats setStateEventCount:](v3, "setStateEventCount:", -[SUCoreDiagStats stateEventCount](self, "stateEventCount"));
  return v3;
}

- (void)combineWithStats:(id)a3
{
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  if (objc_msgSend(v30, "beginCount") >= 1)
  {
    v4 = -[SUCoreDiagStats beginCount](self, "beginCount");
    v5 = objc_msgSend(v30, "beginCount");
    if ((v4 & 0x8000000000000000) == 0)
      v5 += -[SUCoreDiagStats beginCount](self, "beginCount");
    -[SUCoreDiagStats setBeginCount:](self, "setBeginCount:", v5);
  }
  if (objc_msgSend(v30, "endSuccessCount") >= 1)
  {
    v6 = -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
    v7 = objc_msgSend(v30, "endSuccessCount");
    if ((v6 & 0x8000000000000000) == 0)
      v7 += -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
    -[SUCoreDiagStats setEndSuccessCount:](self, "setEndSuccessCount:", v7);
  }
  if (objc_msgSend(v30, "endFailCount") >= 1)
  {
    v8 = -[SUCoreDiagStats endFailCount](self, "endFailCount");
    v9 = objc_msgSend(v30, "endFailCount");
    if ((v8 & 0x8000000000000000) == 0)
      v9 += -[SUCoreDiagStats endFailCount](self, "endFailCount");
    -[SUCoreDiagStats setEndFailCount:](self, "setEndFailCount:", v9);
  }
  if (objc_msgSend(v30, "endFailIndicationsCount") >= 1)
  {
    v10 = -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount");
    v11 = objc_msgSend(v30, "endFailIndicationsCount");
    if ((v10 & 0x8000000000000000) == 0)
      v11 += -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount");
    -[SUCoreDiagStats setEndFailIndicationsCount:](self, "setEndFailIndicationsCount:", v11);
  }
  -[SUCoreDiagStats setEndFailAllIndications:](self, "setEndFailAllIndications:", -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications") | objc_msgSend(v30, "endFailAllIndications"));
  if (objc_msgSend(v30, "errorCount") >= 1)
  {
    v12 = -[SUCoreDiagStats errorCount](self, "errorCount");
    v13 = objc_msgSend(v30, "errorCount");
    if ((v12 & 0x8000000000000000) == 0)
      v13 += -[SUCoreDiagStats errorCount](self, "errorCount");
    -[SUCoreDiagStats setErrorCount:](self, "setErrorCount:", v13);
  }
  if (objc_msgSend(v30, "errorIndicationsCount") >= 1)
  {
    v14 = -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount");
    v15 = objc_msgSend(v30, "errorIndicationsCount");
    if ((v14 & 0x8000000000000000) == 0)
      v15 += -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount");
    -[SUCoreDiagStats setErrorIndicationsCount:](self, "setErrorIndicationsCount:", v15);
  }
  -[SUCoreDiagStats setErrorAllIndications:](self, "setErrorAllIndications:", -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications") | objc_msgSend(v30, "errorAllIndications"));
  if (objc_msgSend(v30, "anomalyCount") >= 1)
  {
    v16 = -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
    v17 = objc_msgSend(v30, "anomalyCount");
    if ((v16 & 0x8000000000000000) == 0)
      v17 += -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
    -[SUCoreDiagStats setAnomalyCount:](self, "setAnomalyCount:", v17);
  }
  if (objc_msgSend(v30, "anomalyIndicationsCount") >= 1)
  {
    v18 = -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount");
    v19 = objc_msgSend(v30, "anomalyIndicationsCount");
    if ((v18 & 0x8000000000000000) == 0)
      v19 += -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount");
    -[SUCoreDiagStats setAnomalyIndicationsCount:](self, "setAnomalyIndicationsCount:", v19);
  }
  -[SUCoreDiagStats setAnomalyAllIndications:](self, "setAnomalyAllIndications:", -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications") | objc_msgSend(v30, "anomalyAllIndications"));
  if (objc_msgSend(v30, "failureCount") >= 1)
  {
    v20 = -[SUCoreDiagStats failureCount](self, "failureCount");
    v21 = objc_msgSend(v30, "failureCount");
    if ((v20 & 0x8000000000000000) == 0)
      v21 += -[SUCoreDiagStats failureCount](self, "failureCount");
    -[SUCoreDiagStats setFailureCount:](self, "setFailureCount:", v21);
  }
  if (objc_msgSend(v30, "failureIndicationsCount") >= 1)
  {
    v22 = -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount");
    v23 = objc_msgSend(v30, "failureIndicationsCount");
    if ((v22 & 0x8000000000000000) == 0)
      v23 += -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount");
    -[SUCoreDiagStats setFailureIndicationsCount:](self, "setFailureIndicationsCount:", v23);
  }
  -[SUCoreDiagStats setFailureAllIndications:](self, "setFailureAllIndications:", -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications") | objc_msgSend(v30, "failureAllIndications"));
  if (objc_msgSend(v30, "faultCount") >= 1)
  {
    v24 = -[SUCoreDiagStats faultCount](self, "faultCount");
    v25 = objc_msgSend(v30, "faultCount");
    if ((v24 & 0x8000000000000000) == 0)
      v25 += -[SUCoreDiagStats faultCount](self, "faultCount");
    -[SUCoreDiagStats setFaultCount:](self, "setFaultCount:", v25);
  }
  if (objc_msgSend(v30, "faultIndicationsCount") >= 1)
  {
    v26 = -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount");
    v27 = objc_msgSend(v30, "faultIndicationsCount");
    if ((v26 & 0x8000000000000000) == 0)
      v27 += -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount");
    -[SUCoreDiagStats setFaultIndicationsCount:](self, "setFaultIndicationsCount:", v27);
  }
  -[SUCoreDiagStats setFaultAllIndications:](self, "setFaultAllIndications:", -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications") | objc_msgSend(v30, "faultAllIndications"));
  if (objc_msgSend(v30, "stateEventCount") >= 1)
  {
    v28 = -[SUCoreDiagStats stateEventCount](self, "stateEventCount");
    v29 = objc_msgSend(v30, "stateEventCount");
    if ((v28 & 0x8000000000000000) == 0)
      v29 += -[SUCoreDiagStats stateEventCount](self, "stateEventCount");
    -[SUCoreDiagStats setStateEventCount:](self, "setStateEventCount:", v29);
  }

}

- (void)combineStartingFrom:(id)a3 endingWith:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  -[SUCoreDiagStats setBeginCount:](self, "setBeginCount:", objc_msgSend(v6, "beginCount") - objc_msgSend(v7, "beginCount") + -[SUCoreDiagStats beginCount](self, "beginCount"));
  -[SUCoreDiagStats setEndSuccessCount:](self, "setEndSuccessCount:", objc_msgSend(v6, "endSuccessCount")- objc_msgSend(v7, "endSuccessCount")+ -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount"));
  -[SUCoreDiagStats setEndFailCount:](self, "setEndFailCount:", objc_msgSend(v6, "endFailCount")- objc_msgSend(v7, "endFailCount")+ -[SUCoreDiagStats endFailCount](self, "endFailCount"));
  -[SUCoreDiagStats setEndFailIndicationsCount:](self, "setEndFailIndicationsCount:", objc_msgSend(v6, "endFailIndicationsCount")- objc_msgSend(v7, "endFailIndicationsCount")+ -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount"));
  -[SUCoreDiagStats setEndFailAllIndications:](self, "setEndFailAllIndications:", objc_msgSend(v6, "endFailAllIndications") | objc_msgSend(v7, "endFailAllIndications") | -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications"));
  -[SUCoreDiagStats setErrorCount:](self, "setErrorCount:", objc_msgSend(v6, "errorCount") - objc_msgSend(v7, "errorCount") + -[SUCoreDiagStats errorCount](self, "errorCount"));
  -[SUCoreDiagStats setErrorIndicationsCount:](self, "setErrorIndicationsCount:", objc_msgSend(v6, "errorIndicationsCount")- objc_msgSend(v7, "errorIndicationsCount")+ -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount"));
  -[SUCoreDiagStats setErrorAllIndications:](self, "setErrorAllIndications:", objc_msgSend(v6, "errorAllIndications") | objc_msgSend(v7, "errorAllIndications") | -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications"));
  -[SUCoreDiagStats setAnomalyCount:](self, "setAnomalyCount:", objc_msgSend(v6, "anomalyCount")- objc_msgSend(v7, "anomalyCount")+ -[SUCoreDiagStats anomalyCount](self, "anomalyCount"));
  -[SUCoreDiagStats setAnomalyIndicationsCount:](self, "setAnomalyIndicationsCount:", objc_msgSend(v6, "anomalyIndicationsCount")- objc_msgSend(v7, "anomalyIndicationsCount")+ -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount"));
  -[SUCoreDiagStats setAnomalyAllIndications:](self, "setAnomalyAllIndications:", objc_msgSend(v6, "anomalyAllIndications") | objc_msgSend(v7, "anomalyAllIndications") | -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications"));
  -[SUCoreDiagStats setFailureCount:](self, "setFailureCount:", objc_msgSend(v6, "failureCount")- objc_msgSend(v7, "failureCount")+ -[SUCoreDiagStats failureCount](self, "failureCount"));
  -[SUCoreDiagStats setFailureIndicationsCount:](self, "setFailureIndicationsCount:", objc_msgSend(v6, "failureIndicationsCount")- objc_msgSend(v7, "failureIndicationsCount")+ -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount"));
  -[SUCoreDiagStats setFailureAllIndications:](self, "setFailureAllIndications:", objc_msgSend(v6, "failureAllIndications") | objc_msgSend(v7, "failureAllIndications") | -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications"));
  -[SUCoreDiagStats setFaultCount:](self, "setFaultCount:", objc_msgSend(v6, "faultCount") - objc_msgSend(v7, "faultCount") + -[SUCoreDiagStats faultCount](self, "faultCount"));
  -[SUCoreDiagStats setFaultIndicationsCount:](self, "setFaultIndicationsCount:", objc_msgSend(v6, "faultIndicationsCount")- objc_msgSend(v7, "faultIndicationsCount")+ -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount"));
  -[SUCoreDiagStats setFaultAllIndications:](self, "setFaultAllIndications:", objc_msgSend(v6, "faultAllIndications") | objc_msgSend(v7, "faultAllIndications") | -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications"));
  v8 = objc_msgSend(v6, "stateEventCount");

  v9 = objc_msgSend(v7, "stateEventCount");
  -[SUCoreDiagStats setStateEventCount:](self, "setStateEventCount:", v8 - v9 + -[SUCoreDiagStats stateEventCount](self, "stateEventCount"));
}

- (int64_t)allIndications
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;

  v3 = -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications");
  v4 = -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications") | v3;
  v5 = -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications");
  v6 = v4 | v5 | -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications");
  return v6 | -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications");
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  int64_t v6;
  int64_t v7;
  const __CFString *v8;
  __CFString *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  __CFString *v32;
  int64_t v33;

  v31 = (void *)MEMORY[0x1E0CB3940];
  v30 = -[SUCoreDiagStats beginCount](self, "beginCount");
  v29 = -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
  v28 = -[SUCoreDiagStats endFailCount](self, "endFailCount");
  v27 = -[SUCoreDiagStats endFailIndicationsCount](self, "endFailIndicationsCount");
  v33 = -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications");
  if (v33)
  {
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagStats endFailAllIndications](self, "endFailAllIndications"));
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("None");
  }
  v25 = -[SUCoreDiagStats errorCount](self, "errorCount");
  v24 = -[SUCoreDiagStats errorIndicationsCount](self, "errorIndicationsCount");
  v26 = -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications");
  if (v26)
  {
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagStats errorAllIndications](self, "errorAllIndications"));
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("None");
  }
  v22 = -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
  v21 = -[SUCoreDiagStats anomalyIndicationsCount](self, "anomalyIndicationsCount");
  v23 = -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications");
  if (v23)
  {
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagStats anomalyAllIndications](self, "anomalyAllIndications"));
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("None");
  }
  v32 = (__CFString *)v3;
  v20 = -[SUCoreDiagStats failureCount](self, "failureCount");
  v6 = -[SUCoreDiagStats failureIndicationsCount](self, "failureIndicationsCount");
  v7 = -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications");
  v8 = v4;
  if (v7)
  {
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagStats failureAllIndications](self, "failureAllIndications"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("None");
  }
  v10 = -[SUCoreDiagStats faultCount](self, "faultCount");
  v11 = -[SUCoreDiagStats faultIndicationsCount](self, "faultIndicationsCount");
  v12 = -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications");
  if (v12)
  {
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagStats faultAllIndications](self, "faultAllIndications"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("None");
  }
  v19 = v11;
  v18 = v5;
  v14 = (__CFString *)v5;
  v15 = (__CFString *)v8;
  objc_msgSend(v31, "stringWithFormat:", CFSTR("\n[>>>\n                beginCount: %ld\n           endSuccessCount: %ld\n\n              endFailCount: %ld\n   endFailIndicationsCount: %ld\n     endFailAllIndications: %@\n\n                errorCount: %ld\n     errorIndicationsCount: %ld\n       errorAllIndications: %@\n\n              anomalyCount: %ld\n   anomalyIndicationsCount: %ld\n     anomalyAllIndications: %@\n\n              failureCount: %ld\n   failureIndicationsCount: %ld\n     failureAllIndications: %@\n\n                faultCount: %ld\n     faultIndicationsCount: %ld\n       faultAllIndications: %@\n\n           stateEventCount: %ld\n<<<]"), v30, v29, v28, v27, v32, v25, v24, v8, v22, v21, v18, v20, v6, v9, v10, v19,
    v13,
    -[SUCoreDiagStats stateEventCount](self, "stateEventCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)

  if (v7)
  if (v23)

  if (v26)
  if (v33)

  return v16;
}

- (id)summary
{
  int64_t v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;

  v3 = -[SUCoreDiagStats allIndications](self, "allIndications");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[SUCoreDiagStats beginCount](self, "beginCount");
  v6 = -[SUCoreDiagStats endSuccessCount](self, "endSuccessCount");
  v7 = -[SUCoreDiagStats endFailCount](self, "endFailCount");
  v8 = -[SUCoreDiagStats errorCount](self, "errorCount");
  v9 = -[SUCoreDiagStats anomalyCount](self, "anomalyCount");
  v10 = -[SUCoreDiagStats failureCount](self, "failureCount");
  v11 = -[SUCoreDiagStats faultCount](self, "faultCount");
  v12 = -[SUCoreDiagStats stateEventCount](self, "stateEventCount");
  v13 = v12;
  if (v3)
  {
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("beginCount:%ld,endSuccessCount:%ld,endFailCount:%ld,errorCount:%ld,anomalyCount:%ld,failureCount:%ld,faultCount:%ld,stateEventCount:%ld,allIndications:%@"), v5, v6, v7, v8, v9, v10, v11, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("beginCount:%ld,endSuccessCount:%ld,endFailCount:%ld,errorCount:%ld,anomalyCount:%ld,failureCount:%ld,faultCount:%ld,stateEventCount:%ld,allIndications:%@"), v5, v6, v7, v8, v9, v10, v11, v12, CFSTR("None"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (id)summaryOfProblems
{
  int64_t v3;
  __CFString *v4;
  void *v5;

  v3 = -[SUCoreDiagStats allIndications](self, "allIndications");
  if (v3
    || -[SUCoreDiagStats endFailCount](self, "endFailCount") > 0
    || -[SUCoreDiagStats errorCount](self, "errorCount") > 0
    || -[SUCoreDiagStats anomalyCount](self, "anomalyCount") > 0
    || -[SUCoreDiagStats failureCount](self, "failureCount") > 0
    || -[SUCoreDiagStats faultCount](self, "faultCount") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("|"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%@|"), v5);

    }
    if (-[SUCoreDiagStats endFailCount](self, "endFailCount") >= 1)
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("endFail:%ld|"), -[SUCoreDiagStats endFailCount](self, "endFailCount"));
    if (-[SUCoreDiagStats errorCount](self, "errorCount") >= 1)
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("error:%ld|"), -[SUCoreDiagStats errorCount](self, "errorCount"));
    if (-[SUCoreDiagStats anomalyCount](self, "anomalyCount") >= 1)
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("anomaly:%ld|"), -[SUCoreDiagStats anomalyCount](self, "anomalyCount"));
    if (-[SUCoreDiagStats failureCount](self, "failureCount") >= 1)
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("failure:%ld|"), -[SUCoreDiagStats failureCount](self, "failureCount"));
    if (-[SUCoreDiagStats faultCount](self, "faultCount") >= 1)
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("fault:%ld|"), -[SUCoreDiagStats faultCount](self, "faultCount"));
  }
  else
  {
    v4 = CFSTR("no-issues");
  }
  return v4;
}

- (BOOL)encounteredProblems
{
  return -[SUCoreDiagStats allIndications](self, "allIndications")
      || -[SUCoreDiagStats endFailCount](self, "endFailCount") > 0
      || -[SUCoreDiagStats errorCount](self, "errorCount") > 0
      || -[SUCoreDiagStats anomalyCount](self, "anomalyCount") > 0
      || -[SUCoreDiagStats failureCount](self, "failureCount") > 0
      || -[SUCoreDiagStats faultCount](self, "faultCount") > 0;
}

- (int64_t)beginCount
{
  return self->_beginCount;
}

- (void)setBeginCount:(int64_t)a3
{
  self->_beginCount = a3;
}

- (int64_t)endSuccessCount
{
  return self->_endSuccessCount;
}

- (void)setEndSuccessCount:(int64_t)a3
{
  self->_endSuccessCount = a3;
}

- (int64_t)endFailCount
{
  return self->_endFailCount;
}

- (void)setEndFailCount:(int64_t)a3
{
  self->_endFailCount = a3;
}

- (int64_t)endFailIndicationsCount
{
  return self->_endFailIndicationsCount;
}

- (void)setEndFailIndicationsCount:(int64_t)a3
{
  self->_endFailIndicationsCount = a3;
}

- (int64_t)endFailAllIndications
{
  return self->_endFailAllIndications;
}

- (void)setEndFailAllIndications:(int64_t)a3
{
  self->_endFailAllIndications = a3;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(int64_t)a3
{
  self->_errorCount = a3;
}

- (int64_t)errorIndicationsCount
{
  return self->_errorIndicationsCount;
}

- (void)setErrorIndicationsCount:(int64_t)a3
{
  self->_errorIndicationsCount = a3;
}

- (int64_t)errorAllIndications
{
  return self->_errorAllIndications;
}

- (void)setErrorAllIndications:(int64_t)a3
{
  self->_errorAllIndications = a3;
}

- (int64_t)anomalyCount
{
  return self->_anomalyCount;
}

- (void)setAnomalyCount:(int64_t)a3
{
  self->_anomalyCount = a3;
}

- (int64_t)anomalyIndicationsCount
{
  return self->_anomalyIndicationsCount;
}

- (void)setAnomalyIndicationsCount:(int64_t)a3
{
  self->_anomalyIndicationsCount = a3;
}

- (int64_t)anomalyAllIndications
{
  return self->_anomalyAllIndications;
}

- (void)setAnomalyAllIndications:(int64_t)a3
{
  self->_anomalyAllIndications = a3;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (int64_t)failureIndicationsCount
{
  return self->_failureIndicationsCount;
}

- (void)setFailureIndicationsCount:(int64_t)a3
{
  self->_failureIndicationsCount = a3;
}

- (int64_t)failureAllIndications
{
  return self->_failureAllIndications;
}

- (void)setFailureAllIndications:(int64_t)a3
{
  self->_failureAllIndications = a3;
}

- (int64_t)faultCount
{
  return self->_faultCount;
}

- (void)setFaultCount:(int64_t)a3
{
  self->_faultCount = a3;
}

- (int64_t)faultIndicationsCount
{
  return self->_faultIndicationsCount;
}

- (void)setFaultIndicationsCount:(int64_t)a3
{
  self->_faultIndicationsCount = a3;
}

- (int64_t)faultAllIndications
{
  return self->_faultAllIndications;
}

- (void)setFaultAllIndications:(int64_t)a3
{
  self->_faultAllIndications = a3;
}

- (int64_t)stateEventCount
{
  return self->_stateEventCount;
}

- (void)setStateEventCount:(int64_t)a3
{
  self->_stateEventCount = a3;
}

@end
