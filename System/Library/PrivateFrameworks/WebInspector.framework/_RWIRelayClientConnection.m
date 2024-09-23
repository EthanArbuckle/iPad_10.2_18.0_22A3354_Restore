@implementation _RWIRelayClientConnection

- (_RWIRelayClientConnection)initWithDelegate:(id)a3
{
  _RWIRelayClientConnection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_RWIRelayClientConnection;
  result = -[_RWIRelayClientConnection init](&v5, sel_init);
  if (result)
    result->_delegate = (_RWIRelayClientConnectionDelegate *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_RWIRelayClientConnection close](self, "close");

  v3.receiver = self;
  v3.super_class = (Class)_RWIRelayClientConnection;
  -[_RWIRelayClientConnection dealloc](&v3, sel_dealloc);
}

- (void)_closeAndNotifyDelegate:(BOOL)a3
{
  _BOOL4 v3;

  if (!self->_closed)
  {
    v3 = a3;
    -[_RWIRelayClientConnection closeInternal](self, "closeInternal");
    self->_closed = 1;
    if (v3)
      -[_RWIRelayClientConnectionDelegate clientConnectionDidClose:](self->_delegate, "clientConnectionDidClose:", self);
    self->_delegate = 0;
  }
}

- (void)close
{
  -[_RWIRelayClientConnection _closeAndNotifyDelegate:](self, "_closeAndNotifyDelegate:", 0);
}

- (void)closeFromConnection
{
  -[_RWIRelayClientConnection _closeAndNotifyDelegate:](self, "_closeAndNotifyDelegate:", 1);
}

- (void)sendMessage:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Subclasses must override this method."), 0));
}

- (void)closeInternal
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Subclasses must override this method."), 0));
}

- (void)dispatchRelayMessage:(id)a3
{
  NSObject *v5;
  NSString *v6;
  NSString *v7;
  SEL v8;
  id v9;

  v5 = RWIMessageTraceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_RWIRelayClientConnection dispatchRelayMessage:].cold.1(self);
  traceMessagePayloadIfKeyExists((uint64_t)CFSTR("WIRSocketDataKey"), a3);
  v6 = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("__selector"));
  if (v6)
  {
    v7 = v6;
    if (-[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("_rpc_")))
    {
      v8 = NSSelectorFromString(v7);
      -[_RWIRelayClientConnection delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = (id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("__argument")), "mutableCopy");
        objc_msgSend(v9, "setValue:forKey:", self, CFSTR("RWIServiceConnectionKey"));
        -[_RWIRelayClientConnectionDelegate performSelector:withObject:](-[_RWIRelayClientConnection delegate](self, "delegate"), "performSelector:withObject:", v8, v9);
      }
    }
  }
}

- (void)forwardInvocation:(id)a3
{
  NSString *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;

  v5 = NSStringFromSelector((SEL)objc_msgSend(a3, "selector"));
  v9 = 0;
  objc_msgSend(a3, "getArgument:atIndex:", &v9, 2);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = v6;
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("__selector"));
  if (v9)
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("__argument"));
  v7 = RWIMessageTraceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_RWIRelayClientConnection forwardInvocation:].cold.1(self);
  traceMessagePayloadIfKeyExists((uint64_t)CFSTR("WIRMessageDataKey"), v6);
  objc_msgSend(a3, "setArgument:atIndex:", &v8, 2);
  objc_msgSend(a3, "retainArguments");
  objc_msgSend(a3, "setTarget:", self);
  objc_msgSend(a3, "setSelector:", sel_sendMessage_);
  objc_msgSend(a3, "invoke");

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_RWIRelayClientConnection;
  result = -[_RWIRelayClientConnection methodSignatureForSelector:](&v4, sel_methodSignatureForSelector_, a3);
  if (!result)
    return (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", sel_sendMessage_);
  return result;
}

- (_RWIRelayClientConnectionDelegate)delegate
{
  return self->_delegate;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)sleeping
{
  return self->_sleeping;
}

- (void)setSleeping:(BOOL)a3
{
  self->_sleeping = a3;
}

- (void)dispatchRelayMessage:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "tag");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21AD49000, v1, v2, "IPC client[%{private}@]->relay: %{private}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "tag");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21AD49000, v1, v2, "IPC relay->client[%{private}@]: %{private}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

@end
