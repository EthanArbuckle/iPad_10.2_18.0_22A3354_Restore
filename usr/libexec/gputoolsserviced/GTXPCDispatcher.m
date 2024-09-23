@implementation GTXPCDispatcher

- (GTXPCDispatcher)initWithProtocolMethods:(id)a3
{
  id v4;
  GTXPCDispatcher *v5;
  os_log_t v6;
  OS_os_log *log;
  NSSet *v8;
  NSSet *protocolMethods;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTXPCDispatcher;
  v5 = -[GTXPCDispatcher init](&v11, "init");
  if (v5)
  {
    v6 = os_log_create("com.apple.gputools.transport", "GTXPCDispatcher");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v8 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v4);
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = v8;

  }
  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  const char *string;
  void *v9;
  void *v10;
  NSString *v11;
  OS_os_log *log;

  v6 = a3;
  v7 = a4;
  string = xpc_dictionary_get_string(v6, "_cmd");
  if (string)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    if (-[NSSet containsObject:](self->_protocolMethods, "containsObject:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("_")));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR(":replyConnection:")));

      -[GTXPCDispatcher performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", NSSelectorFromString(v11), v6, v7);
    }

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
      sub_100003038((os_log_t)log);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolMethods, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
