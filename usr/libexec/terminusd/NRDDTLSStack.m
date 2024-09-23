@implementation NRDDTLSStack

- (id)description
{
  id v3;
  const char *v4;
  unint64_t identifier;

  v3 = objc_alloc((Class)NSString);
  v4 = "client";
  if (self)
  {
    identifier = self->_identifier;
    if (self->_server)
      v4 = "server";
  }
  else
  {
    identifier = 0;
  }
  return objc_msgSend(v3, "initWithFormat:", CFSTR("[DTLS%llu %s]"), identifier, v4);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_udpConnection, 0);
  objc_storeStrong((id *)&self->_dtlsConnection, 0);
  objc_storeStrong((id *)&self->_dtlsListener, 0);
}

@end
