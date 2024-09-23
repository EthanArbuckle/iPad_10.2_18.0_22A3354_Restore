@implementation _RWIRelayConnectionToApplication

- (_RWIRelayConnectionToApplication)initWithConnection:(id)a3
{
  id v5;
  _RWIRelayConnectionToApplication *v6;
  _RWIRelayConnectionToApplication *v7;
  _xpc_connection_s *connection;
  _RWIRelayConnectionToApplication *v9;
  _RWIRelayConnectionToApplication *v10;
  _QWORD handler[4];
  _RWIRelayConnectionToApplication *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_RWIRelayConnectionToApplication;
  v6 = -[_RWIRelayConnectionToApplication init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    xpc_connection_set_target_queue(v7->_connection, MEMORY[0x24BDAC9B8]);
    connection = v7->_connection;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __55___RWIRelayConnectionToApplication_initWithConnection___block_invoke;
    handler[3] = &unk_24DE00FE0;
    v9 = v7;
    v13 = v9;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
    v10 = v9;

  }
  return v7;
}

- (void)close
{
  OS_xpc_object *connection;
  OS_xpc_object *v4;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_RWIRelayConnectionToApplication close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)_RWIRelayConnectionToApplication;
  -[_RWIRelayConnectionToApplication dealloc](&v3, sel_dealloc);
}

- (id)_deserializeMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;

  v4 = a3;
  v5 = MEMORY[0x220757BC4]();
  v6 = MEMORY[0x24BDACFA0];
  if (v5 == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v4, "msgData");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8 && MEMORY[0x220757BC4](v8) == v6)
    {
      v12 = (id)_CFXPCCreateCFObjectFromXPCMessage();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v12;
        v7 = v12;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
      {
        v7 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "xpcConnection:unhandledMessage:", self, v4);
    }
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = v4;
  if (self->_connection)
  {
    v6 = MEMORY[0x220757BC4](v4);
    v7 = MEMORY[0x24BDACFB8];
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (v6 == v7)
    {
      objc_msgSend(WeakRetained, "xpcConnectionFailed:", self);

      -[_RWIRelayConnectionToApplication close](self, "close");
    }
    else
    {

      if (v9)
      {
        -[_RWIRelayConnectionToApplication _deserializeMessage:](self, "_deserializeMessage:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          RWIMessageTraceLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            -[_RWIRelayConnectionToApplication _handleEvent:].cold.1(self);

          objc_msgSend(v10, "objectForKey:", CFSTR("messageName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            objc_msgSend(v10, "objectForKey:", CFSTR("userInfo"));
            v13 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
            {
              v18 = (void *)objc_opt_class();
              logUnexpectedType(v18, v14);

            }
            else
            {

              v15 = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v15, "xpcConnection:receivedMessage:userInfo:", self, v11, v13);

            }
          }
          else
          {
            v17 = (void *)objc_opt_class();
            logUnexpectedType(v17, v13);
          }

        }
        else
        {
          v16 = (void *)objc_opt_class();
          logUnexpectedType(v16, v11);
        }

      }
    }
  }

}

- (void)sendMessage:(id)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  xpc_object_t v11;

  v6 = a4;
  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", a3, CFSTR("messageName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("userInfo"));
    RWIMessageTraceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_RWIRelayConnectionToApplication sendMessage:userInfo:].cold.1(self);

    v10 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    if (v10)
    {
      v11 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_value(v11, "msgData", v10);
      xpc_connection_send_message(self->_connection, v11);

    }
  }

}

- (BOOL)available
{
  return self->_connection != 0;
}

- (_RWIRelayConnectionToApplicationDelegate)delegate
{
  return (_RWIRelayConnectionToApplicationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleEvent:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tag");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21AD49000, v2, v3, "IPC app[%{public}@]->relay: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)sendMessage:(void *)a1 userInfo:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tag");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21AD49000, v2, v3, "IPC relay->app[%{public}@]: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
