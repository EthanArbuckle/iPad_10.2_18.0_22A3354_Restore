@implementation OS_remote_device

- (void)setUuid:(char *)a3
{
  char *uuid;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  uuid = self->_uuid;
  if (a3)
  {
    if (!uuid)
    {
      uuid = (char *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      self->_uuid = uuid;
      if (!uuid)
        -[OS_remote_device setUuid:].cold.1(&v6, v7);
    }
    uuid_copy((unsigned __int8 *)uuid, (const unsigned __int8 *)a3);
  }
  else
  {
    free(uuid);
    self->_uuid = 0;
  }
}

- (OS_remote_device)init
{
  OS_remote_device *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dq;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OS_remote_device;
  v2 = -[OS_remote_device init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("remote_device_t", 0);
    dq = v2->_dq;
    v2->_dq = (OS_dispatch_queue *)v3;

    v2->_state = 1;
  }
  return v2;
}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    xpc_connection_cancel(connection);
  free(self->_uuid);
  free(self->device_name);
  free(self->device_alias);
  v4.receiver = self;
  v4.super_class = (Class)OS_remote_device;
  -[OS_remote_device dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
  objc_storeStrong((id *)&self->_dq, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (char)uuid
{
  return self->_uuid;
}

- (unint64_t)device_id
{
  return self->_device_id;
}

- (void)setDevice_id:(unint64_t)a3
{
  self->_device_id = a3;
}

- (unint64_t)messaging_protocol_version
{
  return self->_messaging_protocol_version;
}

- (void)setMessaging_protocol_version:(unint64_t)a3
{
  self->_messaging_protocol_version = a3;
}

- (BOOL)remotexpc_tls_enabled
{
  return self->_remotexpc_tls_enabled;
}

- (void)setRemotexpc_tls_enabled:(BOOL)a3
{
  self->_remotexpc_tls_enabled = a3;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)connected_callback
{
  return self->_connected_callback;
}

- (void)setConnected_callback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (OS_dispatch_queue)connected_callback_queue
{
  return self->_connected_callback_queue;
}

- (void)setConnected_callback_queue:(id)a3
{
  objc_storeStrong((id *)&self->_connected_callback_queue, a3);
}

- (OS_remote_device)connected_callback_self_retain
{
  return self->_connected_callback_self_retain;
}

- (void)setConnected_callback_self_retain:(id)a3
{
  objc_storeStrong((id *)&self->_connected_callback_self_retain, a3);
}

- (id)disconnected_callback
{
  return self->_disconnected_callback;
}

- (void)setDisconnected_callback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (OS_dispatch_queue)disconnected_callback_queue
{
  return self->_disconnected_callback_queue;
}

- (void)setDisconnected_callback_queue:(id)a3
{
  objc_storeStrong((id *)&self->_disconnected_callback_queue, a3);
}

- (OS_remote_device)disconnected_callback_self_retain
{
  return self->_disconnected_callback_self_retain;
}

- (void)setDisconnected_callback_self_retain:(id)a3
{
  objc_storeStrong((id *)&self->_disconnected_callback_self_retain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnected_callback_self_retain, 0);
  objc_storeStrong((id *)&self->_disconnected_callback_queue, 0);
  objc_storeStrong(&self->_disconnected_callback, 0);
  objc_storeStrong((id *)&self->_connected_callback_self_retain, 0);
  objc_storeStrong((id *)&self->_connected_callback_queue, 0);
  objc_storeStrong(&self->_connected_callback, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_dq, 0);
}

- (void)setUuid:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

@end
