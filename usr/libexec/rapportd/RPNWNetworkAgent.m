@implementation RPNWNetworkAgent

- (BOOL)createListenerFramer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v17;
  id v18;
  NSObject *definition;
  nw_protocol_options_t options;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  _QWORD start_handler[4];
  id v24;
  _QWORD v25[2];

  v4 = a3;
  if (objc_msgSend(v4, "type") != (id)1)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListenerFramer:]", 30, "createListenerFramer: incorrect agent type\n");
    }
    goto LABEL_23;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listen_framer"));

  if (v5)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListenerFramer:]", 30, "createListenerFramer: listen_framer already set\n");
    }
LABEL_23:
    v15 = 0;
    goto LABEL_24;
  }
  if (!v4
    || (v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flowAssignHandler"))) == 0
    || (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localEndpoint")),
        v8,
        v7,
        !v8))
  {
    if ((objc_msgSend(v4, "isUsingQUIC") & 1) == 0
      && dword_1001315C0 <= 40
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flowAssignHandler"));
      v13 = objc_retainBlock(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localEndpoint"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListenerFramer:]", 40, "createListenerFramer: called without all information; assign=%@, local=%@\n",
        v13,
        v14);

    }
    goto LABEL_23;
  }
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flowAssignHandler"));
    v10 = objc_retainBlock(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localEndpoint"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListenerFramer:]", 30, "createListenerFramer assign=%@, local=%@\n", v10, v11);

  }
  if ((objc_msgSend(v4, "isUsingQUIC") & 1) == 0)
  {
    v25[0] = 0;
    v25[1] = 0;
    -[NSUUID getUUIDBytes:](self->_networkAgentID, "getUUIDBytes:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localEndpoint"));
    nw_endpoint_set_agent_identifier(v17, v25);

  }
  start_handler[0] = _NSConcreteStackBlock;
  start_handler[1] = 3221225472;
  start_handler[2] = sub_100078410;
  start_handler[3] = &unk_1001139D8;
  v18 = v4;
  v24 = v18;
  definition = nw_framer_create_definition("listen-pipe", 0, start_handler);
  options = nw_framer_create_options(definition);

  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "flowAssignHandler"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localEndpoint"));
  ((void (**)(_QWORD, void *, _QWORD, nw_protocol_options_t))v21)[2](v21, v22, 0, options);

  objc_msgSend(v18, "setFlowAssignHandler:", 0);
  v15 = 1;
LABEL_24:

  return v15;
}

- (id)_quicProtocolOptionsFromParameters:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD iterate_block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v4 = nw_parameters_copy_default_protocol_stack(v3);
  v5 = v4;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_10000F9C8;
    v13 = sub_10000F970;
    v14 = 0;
    iterate_block[0] = _NSConcreteStackBlock;
    iterate_block[1] = 3221225472;
    iterate_block[2] = sub_10007DA7C;
    iterate_block[3] = &unk_100113CA0;
    iterate_block[4] = &v9;
    nw_protocol_stack_iterate_application_protocols(v4, iterate_block);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _quicProtocolOptionsFromParameters:]", 90, "Failed to copy default protocol stack from parameters=%@", v3);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isTCPTransport:(id)a3
{
  NSObject *v3;
  nw_protocol_stack_t v4;
  nw_protocol_definition_t v5;
  char v6;

  v3 = a3;
  v4 = nw_parameters_copy_default_protocol_stack(v3);
  if (v4)
  {
    v5 = nw_protocol_copy_tcp_definition();
    v6 = nw_protocol_stack_includes_protocol(v4, v5);

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _isTCPTransport:]", 90, "Failed to copy default protocol stack from parameters=%@", v3);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)sharedNetworkAgent
{
  if (qword_100132250 != -1)
    dispatch_once(&qword_100132250, &stru_1001138F8);
  return (id)qword_100132248;
}

- (id)getPersonaFromParameters:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 uu[8];
  uint64_t v10;

  v3 = nw_parameters_copy_application_id(a3, a2);
  v4 = (void *)v3;
  if (v3)
  {
    *(_QWORD *)uu = 0;
    v10 = 0;
    nw_application_id_get_persona(v3, uu);
    v5 = 0;
    if (!uuid_is_null(uu))
    {
      v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uu);
      v7 = v6;
      if (v6)
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
      else
        v5 = 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)executeAgentLogicInPersona:(id)a3 pid:(int)a4 handlerDescription:(id)a5 handler:(id)a6
{
  id v8;
  void (**v9)(_QWORD);
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = (void (**)(_QWORD))a6;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent executeAgentLogicInPersona:pid:handlerDescription:handler:]", 30, "Executing '%@' as default persona\n", v8, v10);
  v9[2](v9);

}

+ (id)getLogInfo
{
  return &stru_100115158;
}

+ (id)getCurrentPersona
{
  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWNetworkAgent;
  -[RPNWNetworkAgent dealloc](&v2, "dealloc");
}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  id v5;

  v5 = 0;
  NSAppendPrintF(&v5, "-- RPNWNetworkAgent --\n", *(_QWORD *)&a3);
  v3 = v5;
  +[RPNWAgentClient listAgentClients:](RPNWAgentClient, "listAgentClients:", v3);
  +[RPNWEndpoint listEndpoints:](RPNWEndpoint, "listEndpoints:", v3);
  +[RPNWListener listAllowedApplicationServices:](RPNWListener, "listAllowedApplicationServices:", v3);
  +[RPNWConnection listConnections:](RPNWConnection, "listConnections:", v3);
  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076F14;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076FDC;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _invalidate]", 30, "Invalidate\n");
    }
    -[RPNWNetworkAgent _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)_update
{
  if (self->_prefNetworkAgentEnabled)
    -[RPNWNetworkAgent _ensureStarted](self, "_ensureStarted");
  else
    -[RPNWNetworkAgent _ensureStopped](self, "_ensureStopped");
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (id)getDiscoveryDeviceTypesDescription:(unsigned int)a3
{
  id v4;
  const __CFString *v5;

  v4 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v4, "appendString:", CFSTR("<"));
  if (a3 == -1)
  {
    v5 = CFSTR(" all devices");
LABEL_16:
    objc_msgSend(v4, "appendString:", v5);
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" iPhone"));
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v4, "appendString:", CFSTR(" iPad"));
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v4, "appendString:", CFSTR(" mac"));
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v4, "appendString:", CFSTR(" watch"));
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v4, "appendString:", CFSTR(" atv"));
  if ((a3 & 0x20) != 0)
  {
LABEL_15:
    v5 = CFSTR(" homepod");
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v4, "appendString:", CFSTR(" >"));
  return v4;
}

- (unint64_t)convertBrowseScopeToControlFlags:(unsigned int)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 12288;
  if (a3)
    v3 = 0;
  v4 = (a3 << 18) & 0x100000 | ((((unint64_t)(a3 & 8) >> 3) & 1) << 44) | v3 | (a3 << 11) & 0x1000 | (a3 << 9) & 0x2000 | ((unint64_t)(a3 & 0x40) << 37) & 0xFFFFDFFFFFFFFFFFLL | ((((unint64_t)(a3 & 0x20) >> 5) & 1) << 45);
  if ((a3 & 0x80) != 0)
    return 0x380000103C00;
  else
    return v4;
}

- (unint64_t)convertConnectionParametersToControlFlags:(id)a3
{
  unint64_t v3;
  id v4;
  int required_interface_subtype;
  void *v6;
  size_t v7;
  int uint64;
  uint64_t v9;
  void *v10;
  size_t v11;

  v3 = 0x60000220000;
  v4 = a3;
  required_interface_subtype = nw_parameters_get_required_interface_subtype();
  if (required_interface_subtype != 1002)
  {
    if (required_interface_subtype == 1001)
    {
      v3 = 0x60000400000;
    }
    else if (nw_parameters_get_include_ble(v4))
    {
      v3 = 0x40000600100;
    }
    else
    {
      v3 = 0;
    }
  }
  v6 = (void *)nw_parameters_copy_prohibited_interface_subtypes(v4);
  if (xpc_array_get_count(v6))
  {
    v7 = 0;
    do
    {
      uint64 = xpc_array_get_uint64(v6, v7);
      v9 = v3 | 0x400000;
      if (uint64 != 1002)
        v9 = v3;
      if (uint64 == 1001)
        v3 |= 0x200000uLL;
      else
        v3 = v9;
      ++v7;
    }
    while (v7 < xpc_array_get_count(v6));
  }
  v10 = (void *)nw_parameters_copy_preferred_interface_subtypes(v4);
  if (xpc_array_get_count(v10))
  {
    v11 = 0;
    do
    {
      if (xpc_array_get_uint64(v10, v11) == 1002)
        v3 |= 0x20000uLL;
      ++v11;
    }
    while (v11 < xpc_array_get_count(v10));
  }

  return v3;
}

- (unint64_t)convertBrowseParamsToControlFlags:(id)a3
{
  id v3;
  int include_ble;
  int include_screen_off_devices;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int next_hop_required_interface_subtype;
  void *v10;
  void *v11;
  _BOOL4 v12;
  size_t v13;
  int uint64;
  void *v15;
  size_t v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  size_t v22;
  int v23;
  unint64_t v24;

  v3 = a3;
  include_ble = nw_parameters_get_include_ble(v3);
  include_screen_off_devices = nw_parameters_get_include_screen_off_devices(v3);
  v6 = 2;
  if (!include_ble)
    v6 = 0;
  v7 = 65538;
  if (!include_ble)
    v7 = 0;
  if (include_screen_off_devices)
    v8 = v7;
  else
    v8 = v6;
  if (nw_parameters_get_next_hop_required_interface_type(v3))
  {
    if (nw_parameters_get_next_hop_required_interface_type(v3) == 1)
      v8 |= 4uLL;
    LOBYTE(include_ble) = 1;
  }
  if (nw_parameters_get_next_hop_required_interface_subtype(v3))
  {
    next_hop_required_interface_subtype = nw_parameters_get_next_hop_required_interface_subtype(v3);
    if (next_hop_required_interface_subtype == 1002)
    {
      if (dword_1001315C0 <= 60
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 60)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent convertBrowseParamsToControlFlags:]", 60, "Browsing with AWDL unsupported over Rapport");
      }
    }
    else if (next_hop_required_interface_subtype == 1001)
    {
      v8 |= 4uLL;
    }
    v10 = (void *)nw_parameters_copy_preferred_interface_subtypes(v3);
    goto LABEL_18;
  }
  v11 = (void *)nw_parameters_copy_preferred_interface_subtypes(v3);
  v10 = v11;
  if ((include_ble & 1) != 0)
  {
LABEL_18:
    v12 = 1;
    goto LABEL_19;
  }
  v12 = xpc_array_get_count(v11) != 0;
LABEL_19:
  if (xpc_array_get_count(v10))
  {
    v13 = 0;
    do
    {
      uint64 = xpc_array_get_uint64(v10, v13);
      if (uint64 == 1002)
      {
        if (dword_1001315C0 <= 60
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 60)))
        {
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent convertBrowseParamsToControlFlags:]", 60, "Browsing with AWDL unsupported over Rapport");
        }
      }
      else if (uint64 == 1001)
      {
        v8 |= 4uLL;
      }
      ++v13;
    }
    while (v13 < xpc_array_get_count(v10));
  }
  v15 = (void *)nw_parameters_copy_prohibited_interface_subtypes(v3);
  if (xpc_array_get_count(v15))
  {
    v16 = 0;
    do
    {
      v17 = xpc_array_get_uint64(v15, v16);
      v18 = v8 & 0xFFFFFFFFFFFFFFFBLL;
      if (v17 != 1001)
        v18 = v8;
      if (v17 == 1002)
        v8 &= ~8uLL;
      else
        v8 = v18;
      ++v16;
    }
    while (v16 < xpc_array_get_count(v15));
  }
  if (v15)
  {
    if (dword_1001315C0 <= 60
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 60)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent convertBrowseParamsToControlFlags:]", 60, "Both prohibited interface types and prohibited interface subtypes are set. Overriding types with subtypes");
    }
  }
  else
  {
    v19 = (void *)nw_parameters_copy_prohibited_interface_types(v3);
    v20 = v19;
    if (v19)
      v21 = 1;
    else
      v21 = v12;
    if (xpc_array_get_count(v19))
    {
      v22 = 0;
      do
      {
        v23 = xpc_array_get_uint64(v20, v22);
        v24 = v8 & 0xFFFFFFFFFFFFFFFBLL;
        if (v23 != 1001)
          v24 = v8;
        if (v23 == 1002)
          v8 &= ~8uLL;
        else
          v8 = v24;
        ++v22;
      }
      while (v22 < xpc_array_get_count(v20));
    }

    if (!v21)
      v8 = 32774;
  }

  return v8;
}

- (BOOL)discoverDevices:(id)a3 response:(id)a4 nearbyInvitation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t device_types;
  void *v14;
  uint64_t browse_scope;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSUUID *v26;
  void *v27;
  NSUUID *networkAgentID;
  void *v29;
  BOOL v30;
  _QWORD v32[4];
  id v33;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "browseDescriptor"));

  if (!v10)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 30, "Called discoverDevices with nil browse_descriptor");
    }
    goto LABEL_46;
  }
  if (!v5)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "browseDescriptor"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 30, "Called discoverDevices, browse_descriptor=%@\n", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "browseDescriptor"));
    device_types = nw_browse_descriptor_get_device_types();

    if ((_DWORD)device_types)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "browseDescriptor"));
      browse_scope = nw_browse_descriptor_get_browse_scope();

      if (dword_1001315C0 <= 10
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 10)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 10, "Got browse scope %X\n", browse_scope);
      }
      v16 = -[RPNWNetworkAgent convertBrowseScopeToControlFlags:](self, "convertBrowseScopeToControlFlags:", browse_scope);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "browseClient"));
      v18 = (void *)nw_agent_client_copy_parameters();

      if (dword_1001315C0 <= 10
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 10)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 10, "Got browse params %@\n", v18);
      }
      v19 = -[RPNWNetworkAgent convertBrowseParamsToControlFlags:](self, "convertBrowseParamsToControlFlags:", v18) | v16;
      v20 = objc_alloc_init((Class)NSMutableArray);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "browseDescriptor"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100077BD0;
      v32[3] = &unk_100113920;
      v22 = v20;
      v33 = v22;
      nw_browse_descriptor_enumerate_device_filters(v21, v32);

      if (dword_1001315C0 <= 10
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 10)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 10, "Got control flags: %ll{flags}", v19, &unk_10010AD02);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationService"));

      if (v23)
      {
        if (dword_1001315C0 <= 30
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationService"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNetworkAgent getDiscoveryDeviceTypesDescription:](self, "getDiscoveryDeviceTypesDescription:", device_types));
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 30, "Called discoverDevices with appSvc='%@', device types=%@\n", v24, v25);

        }
        networkAgentID = self->_networkAgentID;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationService"));
        objc_msgSend(v8, "startDiscovery:deviceTypes:controlFlags:deviceFilter:agentUUID:applicationService:", v9, device_types, v19, v22, networkAgentID, v29);

      }
      else if (dword_1001315C0 <= 30
             && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 30, "Called discoverDevices with no application service name\n");
      }

      if (v23)
        goto LABEL_44;
    }
    else if (dword_1001315C0 <= 30
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 30, "Called discoverDevices with no device types\n");
    }
LABEL_46:
    v30 = 0;
    goto LABEL_47;
  }
  if (_os_feature_enabled_impl("Rapport", "NearbyInvitation"))
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]", 30, "Called discoverDevices, browse_invitation_scope=%d\n", objc_msgSend(v8, "browseInvitationScope"));
    }
    v26 = self->_networkAgentID;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationService"));
    objc_msgSend(v8, "startNearbyInvitationDiscovery:agentUUID:applicationService:", v9, v26, v27);

  }
LABEL_44:
  v30 = 1;
LABEL_47:

  return v30;
}

- (BOOL)createRapportServer
{
  RPNWPeer *v3;
  RPNWPeer *server;
  RPNWPeer *v5;
  RPNWPeer *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = objc_alloc_init(RPNWPeer);
  server = self->server;
  self->server = v3;

  -[RPNWPeer receiveWithRequestID:receiveHandler:](self->server, "receiveWithRequestID:receiveHandler:", CFSTR("com.apple.oneapi.browsing"), &stru_100113960);
  v5 = self->server;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100077EE8;
  v9[3] = &unk_100113988;
  v9[4] = self;
  -[RPNWPeer receiveWithRequestID:receiveHandler:](v5, "receiveWithRequestID:receiveHandler:", CFSTR("com.apple.oneapi.resolve"), v9);
  v6 = self->server;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100078284;
  v8[3] = &unk_100113988;
  v8[4] = self;
  -[RPNWPeer receiveWithRequestID:receiveHandler:](v6, "receiveWithRequestID:receiveHandler:", CFSTR("com.apple.oneapi.connection"), v8);
  -[RPNWPeer handleConnectionData:](self->server, "handleConnectionData:", 1);
  return 1;
}

- (BOOL)createConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7
{
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  RPNWConnection *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  RPNWConnection *v26;
  uint64_t apple_service_apple_id;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  id v37;
  RPNWConnection *v38;
  RPNWConnection *v39;
  NSObject *definition;
  nw_protocol_options_t options;
  nw_protocol_definition_t v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v46;
  id v47;
  unsigned int v48;
  id v49;
  const __CFString *v50;
  id v51;
  const __CFString *v52;
  _QWORD start_handler[4];
  RPNWConnection *v54;
  id v55;
  _QWORD v56[4];
  RPNWConnection *v57;
  _QWORD v58[4];
  RPNWConnection *v59;
  id v60;
  _QWORD v61[2];

  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = a7;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Setting connection framer options, local=%@, remote=%@\n", v13, v14);
  if (objc_msgSend(v11, "type") != (id)4)
  {
    if (objc_msgSend(v11, "type") == (id)3)
    {
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Received connection framer request on incoming connection (%@)\n", v11);
      }
      if (v15)
      {
        v49 = v15;
        v26 = (RPNWConnection *)v15;
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationService"));
        v51 = v12;
        v52 = v13;
        v50 = v14;
        if (dword_1001315C0 <= 30
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
        {
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Using incoming connection=%@\n", v26);
        }
        v48 = 0;
        goto LABEL_51;
      }
      if (dword_1001315C0 <= 90
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 90, "No incoming connection provided\n", v46);
      }
    }
    else if (dword_1001315C0 <= 90
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 90, "Received connection framer request on invalid agent client type (%@)\n", v11);
    }
    goto LABEL_75;
  }
  v52 = v13;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Received connection framer request on outgoing connection (%@)\n", v11);
  v61[0] = 0;
  v61[1] = 0;
  nw_endpoint_get_service_identifier(v14, v61);
  v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v61);
  v17 = objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](RPNWEndpoint, "findEndpoint:", v16));
  if (!v17)
  {
    apple_service_apple_id = nw_endpoint_get_apple_service_apple_id(v14);
    if (apple_service_apple_id)
    {
      v51 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", apple_service_apple_id));
      v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v28);

      v29 = objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](RPNWEndpoint, "findEndpoint:", v19));
      if (v29)
      {
        v18 = (void *)v29;
        v49 = v15;
        v50 = v14;

        goto LABEL_19;
      }
      if (dword_1001315C0 <= 90
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 90, "Failed to find endpoint from ID=%@\n", v19);
      }

      v12 = v51;
    }
    else if (dword_1001315C0 > 90)
    {
      v19 = v16;
    }
    else
    {
      if (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90))
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 90, "Failed to get UUID from endpoint=%@\n", v14);
      v19 = v16;
    }

LABEL_75:
    v20 = 0;
LABEL_76:
    v30 = 0;
    goto LABEL_77;
  }
  v18 = (void *)v17;
  v49 = v15;
  v50 = v14;
  v51 = v12;
  v19 = v16;
LABEL_19:
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applicationService"));
  v48 = objc_msgSend(v18, "shouldAutomapListener");
  v21 = [RPNWConnection alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "device"));
  v23 = objc_msgSend(v18, "browseSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endpointUUID"));
  v26 = -[RPNWConnection initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:](v21, "initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:", v22, 0, 0, v23, v20, v24, v25);

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Found remote endpoint=%@, created connection=%@\n", v18, v26);

  if (v26)
  {
LABEL_51:
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v26, "peer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v26, "peer"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "destinationDevice"));
    v34 = -[RPNWConnection inbound](v26, "inbound");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection endpointUUID](v26, "endpointUUID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection connectionUUID](v26, "connectionUUID"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100078E20;
    v58[3] = &unk_100113A00;
    v59 = v26;
    v47 = v11;
    v37 = v11;
    v60 = v37;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000790BC;
    v56[3] = &unk_1001110F8;
    v38 = v59;
    v57 = v38;
    objc_msgSend(v31, "connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:", v33, v34, v20, v35, v48, v36, v58, v56);

    objc_msgSend(v37, "setConnection:", v38);
    start_handler[0] = _NSConcreteStackBlock;
    start_handler[1] = 3221225472;
    start_handler[2] = sub_10007915C;
    start_handler[3] = &unk_100113A50;
    v54 = v38;
    v20 = v20;
    v55 = v20;
    v39 = v38;
    definition = nw_framer_create_definition("client-pipe", 0, start_handler);
    options = nw_framer_create_options(definition);

    v42 = nwrapport_copy_protocol_definition();
    if (dword_1001315C0 <= 40
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 40, "Setting peer protocol definition: '%@'", v42);
    }
    nw_framer_options_set_peer_protocol_definition(options, v42);
    v12 = v51;
    v13 = (__CFString *)v52;
    v14 = (__CFString *)v50;
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      v43 = CFSTR("<NULL>");
      if (v52)
        v44 = v52;
      else
        v44 = CFSTR("<NULL>");
      if (v50)
        v43 = v50;
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 30, "assigning connection %@ <-> %@", v44, v43);
    }
    (*((void (**)(id, const __CFString *, const __CFString *, nw_protocol_options_t))v51 + 2))(v51, v52, v50, options);

    v30 = 1;
    v11 = v47;
    goto LABEL_65;
  }
  if (dword_1001315C0 <= 90)
  {
    v12 = v51;
    v15 = v49;
    v14 = (__CFString *)v50;
    if (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90))
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]", 90, "Failed to find endpoint\n");
    goto LABEL_76;
  }
  v30 = 0;
  v12 = v51;
  v14 = (__CFString *)v50;
LABEL_65:
  v15 = v49;
LABEL_77:

  return v30;
}

- (BOOL)createNearbyInvitationConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7
{
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  char **v16;
  RPNWNearbyInvitationConnection *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  RPNWNearbyInvitationConnection *v22;
  __CFString *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  RPNWNearbyInvitationConnection *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  RPNWNearbyInvitationConnection *v38;
  NSObject *definition;
  nw_protocol_options_t options;
  nw_protocol_definition_t v41;
  int v42;
  int v43;
  const __CFString *v44;
  const __CFString *v45;
  BOOL v46;
  unsigned int v48;
  void *v49;
  id v50;
  id v51;
  const __CFString *v52;
  id v53;
  _QWORD start_handler[4];
  RPNWNearbyInvitationConnection *v55;
  id v56;
  _QWORD v57[4];
  RPNWNearbyInvitationConnection *v58;
  _QWORD v59[4];
  RPNWNearbyInvitationConnection *v60;
  id v61;
  _QWORD v62[2];

  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = a7;
  v16 = &off_100131000;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Setting NearbyInvitation connection framer options, local=%@, remote=%@\n", v13, v14);
  if (objc_msgSend(v11, "type") == (id)4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Received NearbyInvitation connection framer request on outgoing connection (%@)\n", v11);
    }
    v62[0] = 0;
    v62[1] = 0;
    nw_endpoint_get_service_identifier(v14, v62);
    v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v62);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNearbyInvitationEndpoint findEndpoint:](RPNWNearbyInvitationEndpoint, "findEndpoint:", v19));
    if (v20)
    {
      v21 = v20;
      v52 = v13;
      v53 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "applicationService"));
      v22 = [RPNWNearbyInvitationConnection alloc];
      v50 = v15;
      v23 = v14;
      v24 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "device"));
      v26 = objc_msgSend(v21, "browseSession");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endpointUUID"));
      v29 = v22;
      v16 = &off_100131000;
      v17 = -[RPNWNearbyInvitationConnection initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:](v29, "initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:", v25, 0, 0, v26, v18, v27, v28);

      v11 = v24;
      v14 = v23;
      v15 = v50;

      goto LABEL_17;
    }
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 90, "Failed to find NearbyInvitation endpoint from ID=%@\n", v19);
    }

LABEL_46:
    v46 = 0;
    goto LABEL_47;
  }
  if (objc_msgSend(v11, "type") == (id)3)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Received connection framer request on NearbyInvitation incoming connection (%@)\n", v11);
    }
    if (v15)
    {
      v17 = (RPNWNearbyInvitationConnection *)v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationService"));
      v52 = v13;
      v53 = v12;
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 30, "Using incoming NearbyInvitation connection=%@\n", v17);
      }
      goto LABEL_17;
    }
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 90, "No NearbyInvitation incoming connection provided\n");
    }
    goto LABEL_46;
  }
  v52 = v13;
  v53 = v12;
  v17 = 0;
  v18 = 0;
LABEL_17:
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v17, "peer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "nearbyInvitationSession"));

  if (!v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v17, "peer"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v17, "peer"));
    v51 = v15;
    v33 = v11;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "destinationDevice"));
    v48 = -[RPNWNearbyInvitationConnection inbound](v17, "inbound");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection endpointUUID](v17, "endpointUUID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection connectionUUID](v17, "connectionUUID"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100079D98;
    v59[3] = &unk_100113A00;
    v60 = v17;
    v61 = v33;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100079FF8;
    v57[3] = &unk_1001110F8;
    v58 = v60;
    objc_msgSend(v32, "connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:", v34, v48, v18, v35, v36, v59, v57);

    v16 = &off_100131000;
    v11 = v33;
    v15 = v51;

  }
  objc_msgSend(v11, "setNearbyInvitationConnection:", v17);
  start_handler[0] = _NSConcreteStackBlock;
  start_handler[1] = 3221225472;
  start_handler[2] = sub_10007A098;
  start_handler[3] = &unk_100113A50;
  v55 = v17;
  v56 = v18;
  v37 = v18;
  v38 = v17;
  definition = nw_framer_create_definition("client-pipe-nbinv", 0, start_handler);
  options = nw_framer_create_options(definition);

  v41 = nwrapport_copy_protocol_definition();
  v42 = *((_DWORD *)v16 + 368);
  if (v42 <= 40 && (v42 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 40, "Setting peer protocol definition: '%@'", v41);
  nw_framer_options_set_peer_protocol_definition(options, v41);
  v43 = *((_DWORD *)v16 + 368);
  v13 = (__CFString *)v52;
  v12 = v53;
  if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v44 = CFSTR("<NULL>");
    if (v52)
      v45 = v52;
    else
      v45 = CFSTR("<NULL>");
    if (v14)
      v44 = v14;
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]", 30, "assigning connection %@ <-> %@", v45, v44);
  }
  (*((void (**)(id, const __CFString *, __CFString *, nw_protocol_options_t))v53 + 2))(v53, v52, v14, options);

  v46 = 1;
LABEL_47:

  return v46;
}

- (BOOL)setupPolicyWithQueue:(id)a3 browseAgent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NEVirtualInterface_s *v7;
  void *v8;
  NEVirtualInterface_s *interface;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NEPolicySession *v14;
  NEPolicySession *policySession;
  NEPolicySession *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  BOOL v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _QWORD v34[4];
  char v35[46];

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 30, "Configuring agent policies");
    }
    v14 = (NEPolicySession *)objc_alloc_init((Class)NEPolicySession);
    policySession = self->_policySession;
    self->_policySession = v14;

    v16 = self->_policySession;
    if (v16)
    {
      v30 = v6;
      -[NEPolicySession setPriority:](v16, "setPriority:", 300);
      -[NEPolicySession lockSessionToCurrentProcess](self->_policySession, "lockSessionToCurrentProcess");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](NEPolicyResult, "netAgentUUID:", self->_browseAgentID));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition requiredAgentDomain:agentType:](NEPolicyCondition, "requiredAgentDomain:agentType:", CFSTR("com.apple.rapport.browse"), CFSTR("RapportBrowseAgent")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition customEntitlement:](NEPolicyCondition, "customEntitlement:", CFSTR("com.apple.private.application-service-browse")));
      v21 = geteuid();
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 30, "Constraining agent to UID %d", v21);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition uid:](NEPolicyCondition, "uid:", v21));
      v34[0] = v18;
      v34[1] = v19;
      v34[2] = v20;
      v34[3] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
      v26 = objc_msgSend(objc_alloc((Class)NEPolicy), "initWithOrder:result:conditions:", 10, v17, v25);
      v27 = -[NEPolicySession addPolicy:](self->_policySession, "addPolicy:", v26);
      if (v27)
      {
        if (dword_1001315C0 <= 30
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
        {
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 30, "Applying policies for agent %@", self->_browseAgentID);
        }
        -[NEPolicySession apply](self->_policySession, "apply");
      }
      else if (dword_1001315C0 <= 90
             && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 90, "Failed to add entitlement allow policy for agent %@", self->_browseAgentID);
      }

      v6 = v30;
      if (v27)
        goto LABEL_42;
    }
    else if (dword_1001315C0 <= 90
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 90, "Failed to create policy session");
    }
LABEL_49:
    v28 = 0;
    goto LABEL_50;
  }
  v7 = (NEVirtualInterface_s *)NEVirtualInterfaceCreate(kCFAllocatorDefault, 1, v6, 0);
  self->_interface = v7;
  if (!v7)
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 90, "NEVirtualInterfaceCreate returned NULL interface");
    }
    goto LABEL_49;
  }
  v8 = (void *)NEVirtualInterfaceCopyName();
  NEVirtualInterfaceSetRankNever(self->_interface, 1);
  interface = self->_interface;
  v33 = 0;
  v32 = 0;
  v31 = 33022;
  v10 = v8;
  arc4random_buf(&v32, 8uLL);
  inet_ntop(30, &v31, v35, 0x1Cu);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("%")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v10));

  NEVirtualInterfaceAddAddress(interface, v13, 0);
  NEVirtualInterfaceUpdateAdHocService(self->_interface);
  NEVirtualInterfaceSetReadAutomatically(self->_interface, 1);
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 30, "Created interface, name='%@'\n", v10);
  v22 = objc_retainAutorelease(v10);
  v23 = (void *)nw_interface_create_with_name(objc_msgSend(v22, "UTF8String"));
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 30, "Calling nw_agent_add_to_interface agent=%@, interface=%@\n", self->_networkAgent, v23);
  if ((nw_agent_add_to_interface(self->_networkAgent, v23) & 1) == 0)
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]", 90, "Failed to add agent to interface\n");
    }

    goto LABEL_49;
  }

LABEL_42:
  v28 = 1;
LABEL_50:

  return v28;
}

- (BOOL)setupBrowseHandlers
{
  OS_nw_agent *browseAgent;
  _QWORD v5[5];

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]", 30, "Setting Agent Browse handlers\n");
  browseAgent = self->_browseAgent;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007AAB8;
  v5[3] = &unk_100113AA0;
  v5[4] = self;
  nw_agent_set_browse_handlers(browseAgent, v5, &stru_100113AE0);
  return 1;
}

- (void)resolveRequest:(id)a3 existingEndpoint:(id)a4 controlFlags:(unint64_t)a5 clientPublicKey:(id)a6 client:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RPNWPeer *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = objc_alloc_init(RPNWPeer);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "device"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "applicationService"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007B0D8;
  v21[3] = &unk_100113B30;
  v21[4] = self;
  v22 = v13;
  v23 = v12;
  v19 = v12;
  v20 = v13;
  -[RPNWPeer resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:](v16, "resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:", v17, a5, v18, v14, v21);

}

- (BOOL)setupResolveHandlers
{
  OS_nw_agent *browseAgent;
  _QWORD v5[5];
  _QWORD v6[5];

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]", 30, "Setting Agent Resolve handlers\n");
  browseAgent = self->_browseAgent;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007B56C;
  v6[3] = &unk_100113AA0;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007BC30;
  v5[3] = &unk_100113B80;
  nw_agent_add_resolve_handlers(browseAgent, 6, 3, v6, v5);
  return 1;
}

- (void)createListener:(id)a3 nearbyInvitation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSUUID *networkAgentID;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  RPNWNearbyInvitationPeer *v15;
  id v16;
  RPNWNearbyInvitationPeer *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  RPNWNearbyInvitationPeer *v21;
  _QWORD v22[4];
  id v23;
  RPNWNearbyInvitationPeer *v24;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  if ((objc_msgSend(v6, "isUsingQUIC") & 1) != 0)
    networkAgentID = 0;
  else
    networkAgentID = self->_networkAgentID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWPeer createNWEndpointWithID:agentID:applicationService:](RPNWPeer, "createNWEndpointWithID:agentID:applicationService:", v7, networkAgentID, v9));

  v11 = (void *)nw_array_create();
  nw_array_append(v11, v10);
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "browseResponse"));
  ((void (**)(_QWORD, void *))v12)[2](v12, v11);

  if (v4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListener:nearbyInvitation:]", 30, "%@ LISTEN: Creating NearbyInvitation server\n", v13);

    }
    v15 = objc_alloc_init(RPNWNearbyInvitationPeer);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10007C1EC;
    v22[3] = &unk_1001121C0;
    v23 = v6;
    v24 = v15;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10007C2A8;
    v19[3] = &unk_100111928;
    v16 = v23;
    v20 = v16;
    v17 = v24;
    v21 = v17;
    -[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:](v17, "startServer:withCompletion:disconnectHandler:", v16, v22, v19);
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListener:nearbyInvitation:]", 30, "%@ LISTEN: Creating NearbyInvitation listen framer\n", v18);

    }
    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v16);

  }
  else
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListener:nearbyInvitation:]", 30, "%@ LISTEN: Creating listen framer\n", v14);

    }
    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v6);
  }

}

- (BOOL)setupListenHandlers
{
  OS_nw_agent *networkAgent;
  _QWORD v5[5];
  _QWORD v6[5];

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]", 30, "Setting Agent Listen handlers\n");
  networkAgent = self->_networkAgent;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007C460;
  v6[3] = &unk_100113AA0;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007C93C;
  v5[3] = &unk_100113B80;
  nw_agent_set_browse_handlers(networkAgent, v6, v5);
  return 1;
}

- (id)_applicationServiceAdvertiseDescriptorForClient:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = nw_agent_client_copy_advertise_descriptor(a3, a2);
  v4 = (void *)v3;
  if (!v3)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _applicationServiceAdvertiseDescriptorForClient:]", 30, "LISTEN: No advertise descriptor available\n");
    }
    goto LABEL_14;
  }
  if (nw_advertise_descriptor_get_type(v3) != 2)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _applicationServiceAdvertiseDescriptorForClient:]", 30, "LISTEN: Not an application service advertise descriptor, found type=%d\n");
    }
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  v5 = v4;
LABEL_15:

  return v5;
}

- (void)startFlow:(id)a3 listener:(id)a4 client:(id)a5 assign:(id)a6 parameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RPNWNetworkAgent *v23;
  NSUUID *networkAgentID;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  nw_endpoint_t v31;
  void *v32;
  NSUUID *v33;
  RPNWNetworkAgent *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)nw_agent_client_copy_endpoint(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nearbyInvitationConnection"));

  if (v13 && !v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWListener findListenerForAgentClient:sender:browseRequest:](RPNWListener, "findListenerForAgentClient:sender:browseRequest:", v13, 0, 0));
    v20 = v19;
    if (v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "removeTriggeredConnection"));
      if (v21)
      {
        v46 = v17;
        v50 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endpointUUID"));
        v51 = v12;
        v45 = v15;
        v48 = v16;
        v23 = self;
        if ((objc_msgSend(v12, "isUsingQUIC") & 1) != 0)
          networkAgentID = 0;
        else
          networkAgentID = self->_networkAgentID;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationService"));
        v44 = objc_claimAutoreleasedReturnValue(+[RPNWPeer createNWEndpointWithID:agentID:applicationService:](RPNWPeer, "createNWEndpointWithID:agentID:applicationService:", v22, networkAgentID, v25));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "peer"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "destinationDevice"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "endpointUUID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "applicationService"));
        +[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:](RPNWEndpoint, "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:", v27, v28, v29, 0, 1);

        v17 = (void *)v44;
        v15 = v45;
        v16 = v48;
        self = v23;
        goto LABEL_16;
      }
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]", 30, "FLOW: Received incoming connection but listener does not have a triggered connection\n");
      }
    }
    else if (dword_1001315C0 <= 90
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]", 90, "FLOW: Received incoming connection but listener agent has no mapping\n");
    }

    goto LABEL_43;
  }
  v50 = 0;
  v51 = v12;
LABEL_16:
  v31 = nw_parameters_copy_local_endpoint(v16);
  if (!v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    if ((objc_msgSend(v51, "isUsingQUIC") & 1) != 0)
      v33 = 0;
    else
      v33 = self->_networkAgentID;
    v31 = (nw_endpoint_t)objc_claimAutoreleasedReturnValue(+[RPNWPeer createNWEndpointWithID:agentID:applicationService:](RPNWPeer, "createNWEndpointWithID:agentID:applicationService:", v32, v33, CFSTR("dummy")));
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]", 30, "FLOW: Created local endpoint=%@\n", v31);
    }

  }
  v34 = self;
  v35 = (void *)nw_agent_client_copy_path(v14, v30);
  if (nw_path_is_listener())
  {
    v12 = v51;
    objc_msgSend(v51, "setFlowAssignHandler:", v15);
    objc_msgSend(v51, "setLocalEndpoint:", v31);
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]", 30, "FLOW: Creating listen framer\n");
    }
    -[RPNWNetworkAgent createListenerFramer:](v34, "createListenerFramer:", v51);
  }
  else
  {
    v47 = v14;
    v49 = v16;
    v36 = v15;
    v52[0] = 0;
    v52[1] = 0;
    nw_endpoint_get_service_identifier(v17, v52);
    v37 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v52);
    v38 = objc_claimAutoreleasedReturnValue(+[RPNWNearbyInvitationEndpoint findEndpoint:](RPNWNearbyInvitationEndpoint, "findEndpoint:", v37));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nearbyInvitationConnection"));
    v40 = v38 | v39;

    if (v40)
    {
      v41 = v17;
      if (v38)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v38, "applicationService"));
        objc_msgSend(v51, "setApplicationService:", v42);

      }
      v15 = v36;
      if (_os_feature_enabled_impl("Rapport", "NearbyInvitation"))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nearbyInvitationConnection"));
        -[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:](v34, "createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:", v51, v36, v31, v17, v43);

        v15 = v36;
      }
    }
    else
    {
      v15 = v36;
      v41 = v17;
      -[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:](v34, "createConnectionFramer:assign:local:remote:incomingConnection:", v51, v36, v31, v17, v50);
    }

    v17 = v41;
    v12 = v51;
    v14 = v47;
    v16 = v49;
  }

LABEL_43:
}

- (BOOL)setupFlowHandlers
{
  OS_nw_agent *networkAgent;
  _QWORD v5[5];

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]", 30, "Setting Agent Flow handlers\n");
  networkAgent = self->_networkAgent;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005EEC;
  v5[3] = &unk_100113BF8;
  v5[4] = self;
  nw_agent_set_flow_handlers(networkAgent, 4, 6, 1, v5, &stru_100113C18);
  return 1;
}

- (void)setupAssertHandlers:(id)a3
{
  id v3;

  v3 = a3;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupAssertHandlers:]", 30, "Setting Agent Assert handlers\n");
  nw_agent_set_assert_handlers(v3, &stru_100113C58, &stru_100113C78);

}

- (BOOL)createBrowseAgent
{
  OS_nw_agent *v3;
  OS_nw_agent *browseAgent;
  OS_nw_agent *v5;
  NSUUID *v6;
  NSUUID *browseAgentID;
  _QWORD v9[2];

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createBrowseAgent]", 30, "Creating browse agent\n");
  v3 = (OS_nw_agent *)nw_agent_create("com.apple.rapport.browse", "RapportBrowseAgent", "Rapport Browse Agent", self->_dispatchQueue);
  browseAgent = self->_browseAgent;
  self->_browseAgent = v3;

  v5 = self->_browseAgent;
  if (v5)
  {
    v9[0] = 0;
    v9[1] = 0;
    nw_agent_get_uuid(v5, v9);
    v6 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v9);
    browseAgentID = self->_browseAgentID;
    self->_browseAgentID = v6;

    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createBrowseAgent]", 30, "Browse Agent UUID=%@", self->_browseAgentID);
    }
    -[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:](self, "setupPolicyWithQueue:browseAgent:", self->_dispatchQueue, 1);
    -[RPNWNetworkAgent setupBrowseHandlers](self, "setupBrowseHandlers");
    -[RPNWNetworkAgent setupResolveHandlers](self, "setupResolveHandlers");
    -[RPNWNetworkAgent setupAssertHandlers:](self, "setupAssertHandlers:", self->_browseAgent);
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createBrowseAgent]", 30, "Activating browse agent\n");
    }
    nw_agent_change_state(self->_browseAgent, 1, 4, 0);
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createBrowseAgent]", 30, "Browse agent ready!\n");
    }
  }
  else if (dword_1001315C0 <= 90
         && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
  {
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createBrowseAgent]", 90, "Failed to create browse agent\n");
  }
  return v5 != 0;
}

- (BOOL)createNetworkAgent
{
  OS_nw_agent *v3;
  OS_nw_agent *networkAgent;
  OS_nw_agent *v5;
  NSUUID *v6;
  NSUUID *networkAgentID;
  _QWORD v9[2];

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNetworkAgent]", 30, "Creating network agent\n");
  v3 = (OS_nw_agent *)nw_agent_create("com.apple.rapport", "RapportNetworkAgent", "Rapport Network Agent", self->_dispatchQueue);
  networkAgent = self->_networkAgent;
  self->_networkAgent = v3;

  v5 = self->_networkAgent;
  if (v5)
  {
    v9[0] = 0;
    v9[1] = 0;
    nw_agent_get_uuid(v5, v9);
    v6 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v9);
    networkAgentID = self->_networkAgentID;
    self->_networkAgentID = v6;

    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNetworkAgent]", 30, "Network Agent UUID=%@", self->_networkAgentID);
    }
    -[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:](self, "setupPolicyWithQueue:browseAgent:", self->_dispatchQueue, 0);
    -[RPNWNetworkAgent setupListenHandlers](self, "setupListenHandlers");
    -[RPNWNetworkAgent setupFlowHandlers](self, "setupFlowHandlers");
    -[RPNWNetworkAgent setupAssertHandlers:](self, "setupAssertHandlers:", self->_networkAgent);
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNetworkAgent]", 30, "Activating network agent\n");
    }
    nw_agent_change_state(self->_networkAgent, 1, 4, 0);
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNetworkAgent]", 30, "Network agent ready!\n");
    }
  }
  else if (dword_1001315C0 <= 90
         && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
  {
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNetworkAgent]", 90, "Failed to create agent\n");
  }
  return v5 != 0;
}

- (id)_localPublicKeyForAgentClient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)nw_agent_client_copy_parameters(v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[RPNWNetworkAgent _quicProtocolOptionsFromParameters:](self, "_quicProtocolOptionsFromParameters:", v5));
    v7 = (void *)v6;
    if (v6)
    {
      v8 = (void *)nw_quic_options_copy_local_public_key(v6);
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else if (dword_1001315C0 <= 90
             && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _localPublicKeyForAgentClient:]", 90, "Failed to copy public key from options=%@, parameters=%@, agent_client=%@\n", v7, v5, v4);
      }

    }
    else
    {
      if (dword_1001315C0 <= 90
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _localPublicKeyForAgentClient:]", 90, "Failed to find QUIC protocol options from parameters=%@, agent_client=%@\n", v5, v4);
      }
      v9 = 0;
    }

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent _localPublicKeyForAgentClient:]", 90, "Failed to copy parameters from agent_client=%@\n", v4);
    }
    v9 = 0;
  }

  return v9;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSUUID)networkAgentID
{
  return self->_networkAgentID;
}

- (void)setNetworkAgentID:(id)a3
{
  objc_storeStrong((id *)&self->_networkAgentID, a3);
}

- (NSUUID)browseAgentID
{
  return self->_browseAgentID;
}

- (void)setBrowseAgentID:(id)a3
{
  objc_storeStrong((id *)&self->_browseAgentID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseAgentID, 0);
  objc_storeStrong((id *)&self->_networkAgentID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->server, 0);
  objc_storeStrong((id *)&self->_currentPseudonym, 0);
  objc_storeStrong((id *)&self->_endpointIDsWithPendingResolveRequest, 0);
  objc_storeStrong((id *)&self->_pendingResolveResponsesByEndpointID, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_browseAgent, 0);
  objc_storeStrong((id *)&self->_networkAgent, 0);
}

@end
