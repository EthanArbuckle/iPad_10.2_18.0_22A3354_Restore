@implementation RMConnectionHandlerInternal

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  RMConnectionDataDelegate *msgHandler;
  RMConnectionEndpoint *v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_opt_class(RMConnectionHandlerInternal);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    msgHandler = self->_msgHandler;
    if (v4)
    {
      v7 = (RMConnectionEndpoint *)*((id *)v4 + 1);
      if (msgHandler != (RMConnectionDataDelegate *)v7)
      {
LABEL_4:
        v8 = 0;
LABEL_8:

        goto LABEL_9;
      }
      v7 = (RMConnectionEndpoint *)*((_QWORD *)v4 + 2);
    }
    else
    {
      v7 = 0;
      if (msgHandler)
        goto LABEL_4;
      msgHandler = 0;
    }
    v8 = self->_endpoint == v7;
    v7 = (RMConnectionEndpoint *)msgHandler;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_msgHandler, 0);
}

@end
