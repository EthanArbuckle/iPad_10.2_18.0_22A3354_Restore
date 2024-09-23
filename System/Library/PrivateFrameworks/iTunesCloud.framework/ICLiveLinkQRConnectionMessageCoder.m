@implementation ICLiveLinkQRConnectionMessageCoder

- (id)messageFromData:(id)a3
{
  id v3;
  _ICLLProtocolMessage *v4;

  v3 = a3;
  v4 = -[_ICLLProtocolMessage initWithData:]([_ICLLProtocolMessage alloc], "initWithData:", v3);

  return v4;
}

- (id)dataFromMessage:(id)a3
{
  return (id)objc_msgSend(a3, "data");
}

- (id)traceIdentifierForMessage:(id)a3
{
  if (a3)
    return (id)*((_QWORD *)a3 + 5);
  else
    return 0;
}

@end
