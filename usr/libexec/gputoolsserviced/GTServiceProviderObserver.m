@implementation GTServiceProviderObserver

- (void)notifyServiceListChanged:(id)a3
{
  id v5;
  const char *Name;
  void *v7;
  void *v8;
  xpc_object_t xdict;

  v5 = a3;
  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "_port", -[GTServiceObserver replyStream](self, "replyStream"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceObserver replyPath](self, "replyPath"));
  xpc_dictionary_set_value(xdict, "_replyPath", v7);

  xpc_dictionary_set_nsobject(xdict, "serviceList", (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceObserver connection](self, "connection"));
  objc_msgSend(v8, "sendMessage:", xdict);

}

@end
