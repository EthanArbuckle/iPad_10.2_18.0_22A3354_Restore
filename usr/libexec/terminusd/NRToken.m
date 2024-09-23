@implementation NRToken

- (id)description
{
  id v3;
  uint64_t type;
  __CFString *v5;
  uint64_t action;
  __CFString *v7;
  void *LogString;
  id v9;

  v3 = objc_alloc((Class)NSString);
  type = self->_type;
  if ((_DWORD)type == 1)
  {
    v5 = CFSTR("ProxyUsage");
  }
  else if (self->_type)
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%u)"), type);
  }
  else
  {
    v5 = CFSTR("Invalid");
  }
  action = self->_action;
  if ((action - 50) >= 3)
    v7 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%u)"), action);
  else
    v7 = off_1001B5D20[(action - 50)];
  LogString = (void *)_NRKeyCreateLogString(self->_tokenValue);
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRToken[%@, %@, %@]"), v5, v7, LogString);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenValue, 0);
}

@end
