@implementation WFNetworkEvent

- (WFNetworkEvent)initWithEventType:(int64_t)a3 startDate:(id)a4 DNSDuration:(double)a5 connectDuration:(double)a6 requestDuration:(double)a7 responseDuration:(double)a8 responseSize:(unint64_t)a9 HTTPStatusCode:(unint64_t)a10 errorCode:(int64_t)a11
{
  id v21;
  WFNetworkEvent *v22;
  WFNetworkEvent *v23;
  objc_super v25;

  v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WFNetworkEvent;
  v22 = -[WFNetworkEvent init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_eventType = a3;
    objc_storeStrong((id *)&v22->_startDate, a4);
    v23->_DNSDuration = a5;
    v23->_connectDuration = a6;
    v23->_requestDuration = a7;
    v23->_responseDuration = a8;
    v23->_responseSize = a9;
    v23->_HTTPStatusCode = a10;
    v23->_errorCode = a11;
  }

  return v23;
}

- (WFNetworkEvent)initWithEventType:(int64_t)a3 metrics:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  WFNetworkEvent *v20;
  void *v22;
  void *v23;
  void *v26;

  v4 = a4;
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "response");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  objc_msgSend(v4, "fetchStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainLookupEndDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainLookupStartDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceDate:", v22);
  v8 = v7;
  objc_msgSend(v4, "secureConnectionEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secureConnectionStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;
  objc_msgSend(v4, "requestEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;
  objc_msgSend(v4, "responseEndDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseStartDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v18);
  v20 = -[WFNetworkEvent initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:](self, "initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:", a3, v6, objc_msgSend(v4, "countOfResponseBodyBytesReceived"), objc_msgSend(v26, "statusCode"), 0, v8, v12, v16, v19);

  return v20;
}

- (WFNetworkEvent)initWithEventType:(int64_t)a3 startDate:(id)a4 error:(id)a5
{
  id v8;
  WFNetworkEvent *v9;

  v8 = a4;
  v9 = -[WFNetworkEvent initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:](self, "initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:", a3, v8, 0, 0, objc_msgSend(a5, "code"), 0.0, 0.0, 0.0, 0.0);

  return v9;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)DNSDuration
{
  return self->_DNSDuration;
}

- (double)connectDuration
{
  return self->_connectDuration;
}

- (double)requestDuration
{
  return self->_requestDuration;
}

- (double)responseDuration
{
  return self->_responseDuration;
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (unint64_t)HTTPStatusCode
{
  return self->_HTTPStatusCode;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
