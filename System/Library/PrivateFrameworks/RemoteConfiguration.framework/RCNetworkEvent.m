@implementation RCNetworkEvent

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (NSURLSessionTaskTransactionMetrics)metrics
{
  return self->_metrics;
}

- (NSError)error
{
  return self->_error;
}

- (RCNetworkEvent)initWithResultType:(int64_t)a3 request:(id)a4 startDate:(id)a5 operationID:(id)a6 requestID:(id)a7 response:(id)a8 metrics:(id)a9 error:(id)a10
{
  id v16;
  id v17;
  RCNetworkEvent *v18;
  RCNetworkEvent *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)RCNetworkEvent;
  v18 = -[RCNetworkEvent init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_resultType = a3;
    objc_storeStrong((id *)&v18->_request, a4);
    objc_storeStrong((id *)&v19->_startDate, a5);
    objc_storeStrong((id *)&v19->_operationID, a6);
    objc_storeStrong((id *)&v19->_requestID, a7);
    objc_storeStrong((id *)&v19->_response, a8);
    objc_storeStrong((id *)&v19->_metrics, a9);
    objc_storeStrong((id *)&v19->_error, a10);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (int64_t)resultType
{
  return self->_resultType;
}

@end
