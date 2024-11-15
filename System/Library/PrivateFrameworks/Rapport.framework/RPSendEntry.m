@implementation RPSendEntry

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)queueTicks
{
  return self->_queueTicks;
}

- (void)setQueueTicks:(unint64_t)a3
{
  self->_queueTicks = a3;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (unsigned)xid
{
  return self->_xid;
}

- (void)setXid:(unsigned int)a3
{
  self->_xid = a3;
}

- (NSNumber)xidObj
{
  return self->_xidObj;
}

- (void)setXidObj:(id)a3
{
  objc_storeStrong((id *)&self->_xidObj, a3);
}

- (unsigned)xpcID
{
  return self->_xpcID;
}

- (void)setXpcID:(unsigned int)a3
{
  self->_xpcID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xidObj, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
