@implementation _MLNetworkUtilities

+ (id)doInitNetwork:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *MEMORY[0x24BDE0880];
  v4 = a3;
  v5 = (void *)MEMORY[0x22E2DB7F4](v3);
  +[_MLNetworkUtilities configureTLS:](_MLNetworkUtilities, "configureTLS:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_MLNetworkUtilities createSecureConnectionParameter:useUDP:](_MLNetworkUtilities, "createSecureConnectionParameter:useUDP:", v6, objc_msgSend(v4, "useUDP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "family");

  v9 = +[_MLNetworkUtilities setProtocolStack:family:](_MLNetworkUtilities, "setProtocolStack:family:", v7, v8);
  return v7;
}

+ (void)setupBonjour:(id)a3 name:(const char *)a4 useBonjour:(BOOL)a5 useUDP:(BOOL)a6
{
  const char *v9;
  NSObject *v10;
  NSObject *bonjour_service;
  _QWORD v12[5];
  BOOL v13;

  if (a4 && a5)
  {
    if (a6)
      v9 = "_nwcat._udp";
    else
      v9 = "_nwcat._tcp";
    v10 = a3;
    bonjour_service = nw_advertise_descriptor_create_bonjour_service(a4, v9, "local");
    nw_listener_set_advertise_descriptor(v10, bonjour_service);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59___MLNetworkUtilities_setupBonjour_name_useBonjour_useUDP___block_invoke;
    v12[3] = &__block_descriptor_41_e37_v20__0__NSObject_OS_nw_endpoint__8B16l;
    v12[4] = a2;
    v13 = a6;
    nw_listener_set_advertised_endpoint_changed_handler(v10, v12);

  }
}

+ (void)setupListenerStateChangeHandler:(id)a3 useUDP:(BOOL)a4
{
  id v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;
  SEL v10;
  BOOL v11;

  v6 = a3;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke;
  handler[3] = &unk_24F356F78;
  v9 = v6;
  v10 = a2;
  v11 = a4;
  v7 = v6;
  nw_listener_set_state_changed_handler(v7, handler);

}

+ (id)configureTLS:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x22E2DB7F4](*MEMORY[0x24BDE0880]);
  if (objc_msgSend(v3, "useTLS"))
  {
    if (objc_msgSend(v3, "psk"))
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __36___MLNetworkUtilities_configureTLS___block_invoke;
      v8[3] = &unk_24F356FA0;
      v9 = v3;
      v5 = MEMORY[0x22E2DB7F4](v8);

    }
    else
    {
      v5 = MEMORY[0x22E2DB7F4](*MEMORY[0x24BDE0870]);

    }
    v4 = (void *)v5;
  }
  v6 = (void *)MEMORY[0x22E2DB7F4](v4);

  return v6;
}

+ (id)createSecureConnectionParameter:(id)a3 useUDP:(BOOL)a4
{
  void *v4;
  nw_parameters_t secure_udp;

  v4 = (void *)*MEMORY[0x24BDE0870];
  if (a4)
    secure_udp = nw_parameters_create_secure_udp(a3, v4);
  else
    secure_udp = nw_parameters_create_secure_tcp(a3, v4);
  return secure_udp;
}

+ (void)setAWDL:(id)a3 useAWDL:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *parameters;

  v4 = a4;
  parameters = a3;
  if (v4)
  {
    nw_parameters_set_include_peer_to_peer(parameters, 1);
    nw_parameters_set_use_p2p();
    nw_parameters_set_required_interface_subtype();
  }
  nw_parameters_set_required_interface_type(parameters, nw_interface_type_wifi);

}

+ (id)setProtocolStack:(id)a3 family:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  nw_ip_version_t v9;

  v5 = nw_parameters_copy_default_protocol_stack((nw_parameters_t)a3);
  v6 = v5;
  if (a4 == 30 || a4 == 2)
  {
    v7 = nw_protocol_stack_copy_internet_protocol(v5);
    v8 = v7;
    if (a4 == 2)
      v9 = nw_ip_version_4;
    else
      v9 = nw_ip_version_6;
    nw_ip_options_set_version(v7, v9);

  }
  return v6;
}

+ (void)bindEndPoints:(id)a3 localAddr:(const char *)a4 localPort:(const char *)a5
{
  const char *v5;
  const char *v6;
  NSObject *v7;
  NSObject *host;

  if ((unint64_t)a4 | (unint64_t)a5)
  {
    if (a4)
      v5 = a4;
    else
      v5 = "::";
    if (a5)
      v6 = a5;
    else
      v6 = "0";
    v7 = a3;
    host = nw_endpoint_create_host(v5, v6);
    nw_parameters_set_local_endpoint(v7, host);

  }
}

@end
