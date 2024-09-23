@implementation PTPCancelPacket

- (PTPCancelPacket)initWithTransactionID:(unsigned int)a3
{
  PTPCancelPacket *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTPCancelPacket;
  result = -[PTPCancelPacket init](&v5, "init");
  if (result)
    result->_transactionID = a3;
  return result;
}

- (PTPCancelPacket)initWithTCPBuffer:(void *)a3
{
  PTPCancelPacket *v4;
  PTPCancelPacket *v6;
  objc_super v8;

  if (*(_DWORD *)a3 == 12 && *((_DWORD *)a3 + 1) == 11)
  {
    v8.receiver = self;
    v8.super_class = (Class)PTPCancelPacket;
    v6 = -[PTPCancelPacket init](&v8, "init");
    if (v6)
      v6->_transactionID = *((_DWORD *)a3 + 2);
    self = v6;
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)contentForTCP
{
  void *v3;
  _DWORD *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PTPWrappedBytes wrappedBytesWithCapacity:](PTPWrappedBytes, "wrappedBytesWithCapacity:", 12));
  v5 = objc_msgSend(v3, "mutableBytes");
  sub_1000273B4(&v5, 12);
  sub_1000273B4(&v5, 11);
  sub_1000273B4(&v5, self->_transactionID);
  objc_msgSend(v3, "setLength:", 12);
  return v3;
}

- (id)description
{
  return +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPCancelPacket %p>{\n  _transactionID: %lu\n}"), self, self->_transactionID);
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

@end
