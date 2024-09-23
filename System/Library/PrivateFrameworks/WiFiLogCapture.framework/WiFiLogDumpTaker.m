@implementation WiFiLogDumpTaker

- (WiFiLogDumpTaker)init
{
  WiFiLogDumpTaker *v2;
  WiFiLogDumpTaker *v3;
  OS_dispatch_queue *event_queue;
  OS_xpc_object *xpc_connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFiLogDumpTaker;
  v2 = -[WiFiLogDumpTaker init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    event_queue = v2->event_queue;
    v2->event_queue = 0;

    xpc_connection = v3->xpc_connection;
    v3->xpc_connection = 0;

  }
  return v3;
}

- (void)handleConnection:(id)a3
{
  NSLog(CFSTR("%s: %@"), a2, "-[WiFiLogDumpTaker handleConnection:]", a3);
}

- (id)XPCConnection:(const char *)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *event_queue;
  OS_xpc_object *mach_service;
  OS_xpc_object *xpc_connection;
  OS_xpc_object *v9;
  _QWORD handler[5];

  NSLog(CFSTR("%s: creating..."), a2, "-[WiFiLogDumpTaker XPCConnection:]");
  v5 = (OS_dispatch_queue *)dispatch_queue_create(a3, 0);
  event_queue = self->event_queue;
  self->event_queue = v5;

  if (self->event_queue)
  {
    mach_service = xpc_connection_create_mach_service(a3, 0, 2uLL);
    xpc_connection = self->xpc_connection;
    self->xpc_connection = mach_service;

    v9 = self->xpc_connection;
    if (v9)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __34__WiFiLogDumpTaker_XPCConnection___block_invoke;
      handler[3] = &unk_24E1CBDD8;
      handler[4] = self;
      xpc_connection_set_event_handler(v9, handler);
      xpc_connection_resume(self->xpc_connection);
      return self->xpc_connection;
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t __34__WiFiLogDumpTaker_XPCConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleConnection:", a2);
}

- (void)takeWiFiCoreCaptureDumpWithReason:(const char *)a3 callback:(id)a4
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a4;
  NSLog(CFSTR("%s..."), "-[WiFiLogDumpTaker takeWiFiCoreCaptureDumpWithReason:callback:]");
  v4 = CoreCaptureControlCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = 2 * (CoreCaptureControlCapture() == 0);
    CFRelease(v5);
  }
  else
  {
    v6 = 1;
  }
  v7[2](v7, v6);

}

- (void)takeWiFiDiagnosticsDumpWithPath:(const char *)a3 reason:(const char *)a4 callback:(id)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  NSObject *event_queue;
  _xpc_connection_s *v12;
  OS_dispatch_queue **p_event_queue;
  _QWORD handler[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  int v18;

  v8 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  if (self->xpc_connection
    || (v9 = -[WiFiLogDumpTaker XPCConnection:](self, "XPCConnection:", "com.apple.wifi.logdumperd"),
        self->xpc_connection))
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "command", "dump");
    if (a3)
      xpc_dictionary_set_string(v10, "log_path", a3);
    if (a4)
      xpc_dictionary_set_string(v10, "reason", a4);
    NSLog(CFSTR("Sending xpc message...\n"));
    p_event_queue = &self->event_queue;
    event_queue = self->event_queue;
    v12 = p_event_queue[1];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __68__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_callback___block_invoke;
    handler[3] = &unk_24E1CBE00;
    v16 = v17;
    v15 = v8;
    xpc_connection_send_message_with_reply(v12, v10, event_queue, handler);

  }
  else
  {
    NSLog(CFSTR("%s: failed to create xpc connection"), "-[WiFiLogDumpTaker takeWiFiDiagnosticsDumpWithPath:reason:callback:]");
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  _Block_object_dispose(v17, 8);

}

void __68__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const char *string;
  int v5;
  xpc_object_t xdict;

  xdict = a2;
  NSLog(CFSTR("%s: reply: %@"), "-[WiFiLogDumpTaker takeWiFiDiagnosticsDumpWithPath:reason:callback:]_block_invoke", xdict);
  v3 = MEMORY[0x2207A4B88](xdict);
  if (v3 == MEMORY[0x24BDACFB8])
  {
    v5 = 1;
    goto LABEL_6;
  }
  if (v3 == MEMORY[0x24BDACFA0])
  {
    string = xpc_dictionary_get_string(xdict, "rc");
    if (strncmp(string, "rc.ok", 5uLL))
    {
      v5 = 2;
LABEL_6:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)takeWiFiDiagnosticsDumpWithPath:(const char *)a3 reason:(const char *)a4 shouldTryFallback:(BOOL)a5 callback:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  const char *v14;
  BOOL v15;

  v10 = a6;
  self->_didLastCaptureFallback = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke;
  v12[3] = &unk_24E1CBE50;
  v15 = a5;
  v13 = v10;
  v14 = a4;
  v12[4] = self;
  v11 = v10;
  -[WiFiLogDumpTaker takeWiFiDiagnosticsDumpWithPath:reason:callback:](self, "takeWiFiDiagnosticsDumpWithPath:reason:callback:", a3, a4, v12);

}

void __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2 == 1 && *(_BYTE *)(a1 + 56))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke_2;
    v5[3] = &unk_24E1CBE28;
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "takeWiFiCoreCaptureDumpWithReason:callback:", v4, v5);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)takeWiFiDiagnosticsDumpWithPathAndReason:(id)a3 :(const char *)a4 :(const char *)a5
{
  -[WiFiLogDumpTaker takeWiFiDiagnosticsDumpWithPath:reason:callback:](self, "takeWiFiDiagnosticsDumpWithPath:reason:callback:", a4, a5, a3);
}

- (BOOL)didLastCaptureFallback
{
  return self->_didLastCaptureFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xpc_connection, 0);
  objc_storeStrong((id *)&self->event_queue, 0);
}

@end
