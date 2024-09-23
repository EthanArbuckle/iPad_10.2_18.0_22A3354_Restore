@implementation CLPeopleDensityRequest

- (CLPeopleDensityRequest)initWithRequestTimestamp:(double)a3 hints:(id)a4 replyBlock:(id)a5
{
  CLPeopleDensityRequest *v8;
  CLPeopleDensityRequest *v9;
  NSDictionary *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLPeopleDensityRequest;
  v8 = -[CLPeopleDensityRequest init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    v8->_requestTimestamp = a3;
    if (a4)
      v10 = (NSDictionary *)a4;
    else
      v10 = 0;
    v9->_hints = v10;
    v9->_reply = objc_msgSend(a5, "copy");
  }
  return v9;
}

- (void)dealloc
{
  NSDictionary *hints;
  objc_super v4;

  hints = self->_hints;
  if (hints)
  {

    self->_hints = 0;
  }

  self->_reply = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLPeopleDensityRequest;
  -[CLPeopleDensityRequest dealloc](&v4, "dealloc");
}

- (double)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(double)a3
{
  self->_requestTimestamp = a3;
}

- (NSDictionary)hints
{
  return self->_hints;
}

- (void)setHints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
