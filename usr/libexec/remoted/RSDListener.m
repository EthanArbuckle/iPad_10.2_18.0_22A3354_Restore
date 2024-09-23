@implementation RSDListener

- (RSDListener)initWithInterface:(id)a3 targetQueue:(id)a4
{
  id v7;
  id v8;
  RSDListener *v9;
  RSDListener *v10;
  RSDListener *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RSDListener;
  v9 = -[RSDListener init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interface, a3);
    objc_storeStrong((id *)&v10->queue, a4);
    v10->canceled = 0;
    v11 = v10;
  }

  return v10;
}

- (int)listenOnPort:(unsigned __int16)a3 connectionHandler:(id)a4
{
  id v5;
  void *v6;
  __n128 *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *listener_source;
  NSObject *v14;
  OS_dispatch_source *v15;
  _QWORD v17[4];
  int v18;
  _QWORD handler[4];
  NSObject *v20;
  int v21;
  uint64_t v22;
  unsigned __int16 v23;
  int handle[20];

  v23 = a3;
  v5 = a4;
  if (self->listener_source)
    sub_100037BDC(&v22, handle);
  handle[0] = -1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  v7 = (__n128 *)objc_msgSend(v6, "local_address");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  v9 = sub_10001DB04(handle, v7, &v23, (int)objc_msgSend(v8, "index"), (uint64_t)&unk_1000410BC);

  if (v9)
  {
    v10 = sub_100023934();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000397C8(v9, v11);
  }
  else
  {
    v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, handle[0], 0, (dispatch_queue_t)self->queue);
    listener_source = self->listener_source;
    self->listener_source = v12;

    v14 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100023974;
    handler[3] = &unk_100051AF0;
    v20 = v5;
    v21 = handle[0];
    dispatch_source_set_event_handler(v14, handler);
    v15 = self->listener_source;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100023988;
    v17[3] = &unk_1000514F0;
    v18 = handle[0];
    dispatch_source_set_mandatory_cancel_handler(v15, v17);
    dispatch_activate((dispatch_object_t)self->listener_source);
    v11 = v20;
  }

  return v9;
}

- (int)listenOnBonjourName:(const char *)a3 type:(const char *)a4 domain:(const char *)a5 configureTLS:(id)a6 connectionHandler:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  nw_parameters_t secure_tcp;
  NSObject *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  const char *name;
  void *v27;
  int v28;
  OS_nw_listener *v29;
  OS_nw_listener *bonjour_listener;
  OS_nw_listener *v31;
  const char *v32;
  const char *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  int v40;
  id v41;
  int result;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  nw_listener_new_connection_handler_t handler;
  _QWORD v47[5];
  id v48;
  id v49;
  const char *v50;
  const char *v51;
  const char *v52;
  int v53;
  uint64_t v54;
  int v55;
  const char *v56;
  __int16 v57;
  id v58;
  uint8_t buf[16];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v12 = a6;
  handler = a7;
  if (self->bonjour_listener)
    sub_1000399E8(&v55, buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  v14 = objc_msgSend(v13, "index");
  v15 = v12;
  secure_tcp = nw_parameters_create_secure_tcp(v15, _nw_parameters_configure_protocol_default_configuration);
  if (!(_DWORD)v14)
    sub_100039838(&v55, buf);
  v17 = secure_tcp;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = nw_interface_create_with_index(v14);
  if (v21)
  {
    nw_parameters_require_interface(v17, v21);
    nw_parameters_set_local_only(v17, 1);
    nw_parameters_set_required_address_family(v17, 30);
    nw_parameters_set_required_interface_type(v17, nw_interface_type_wired);
    nw_parameters_set_no_fallback(v17, 1);
    nw_parameters_set_indefinite(v17, 0);
    xpc_remote_connection_setup_nw_parameters(v17, 1);
    v22 = v17;
  }
  else
  {
    v23 = sub_100023934();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000399AC(v24);

    v22 = 0;
  }

  if (!v22)
  {
    v41 = sub_100023934();
    v25 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_1000398A0(v25);
    v40 = 6;
    v36 = handler;
    goto LABEL_18;
  }
  v25 = nw_parameters_copy_required_interface(v22);
  name = nw_interface_get_name(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  v28 = strncmp(name, (const char *)objc_msgSend(v27, "name"), 0x10uLL);

  if (!v28)
  {
    v29 = (OS_nw_listener *)nw_listener_create(v22);
    bonjour_listener = self->bonjour_listener;
    self->bonjour_listener = v29;

    v31 = self->bonjour_listener;
    if (!v31)
      sub_1000398DC(&v55, buf);
    v32 = v20;

    v33 = v19;
    v34 = nw_advertise_descriptor_create_bonjour_service(v18, v19, v32);
    if (!v34)
      sub_100039944(&v55, buf);
    v35 = v34;

    nw_advertise_descriptor_set_no_auto_rename(v35, 1);
    nw_listener_set_advertise_descriptor((nw_listener_t)self->bonjour_listener, v35);
    v36 = handler;
    nw_listener_set_new_connection_handler((nw_listener_t)self->bonjour_listener, handler);
    v37 = self->bonjour_listener;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100023DE4;
    v47[3] = &unk_100051B40;
    v47[4] = self;
    v50 = v18;
    v51 = v33;
    v52 = v32;
    v48 = v15;
    v49 = handler;
    v53 = -1;
    nw_listener_set_state_changed_handler(v37, v47);
    nw_listener_set_advertised_endpoint_changed_handler((nw_listener_t)self->bonjour_listener, &stru_100051B80);
    nw_listener_set_queue((nw_listener_t)self->bonjour_listener, (dispatch_queue_t)self->queue);
    nw_listener_start((nw_listener_t)self->bonjour_listener);
    v38 = sub_100023934();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "create bonjour listener done", buf, 2u);
    }

    v40 = 0;
LABEL_18:

    return v40;
  }
  v54 = 0;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  *(_OWORD *)buf = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v43 = 3;
  else
    v43 = 2;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  v55 = 136315394;
  v56 = name;
  v57 = 2080;
  v58 = objc_msgSend(v44, "name");
  v45 = _os_log_send_and_compose_impl(v43, &v54, buf, 80, &_mh_execute_header, &_os_log_default, 16);

  result = _os_crash_msg(v54, v45);
  __break(1u);
  return result;
}

- (void)cancel
{
  NSObject *listener_source;
  OS_dispatch_source *v4;
  NSObject *bonjour_listener;
  OS_nw_listener *v6;
  RSDNetworkInterface *interface;

  listener_source = self->listener_source;
  if (listener_source)
  {
    dispatch_source_cancel(listener_source);
    v4 = self->listener_source;
    self->listener_source = 0;

  }
  bonjour_listener = self->bonjour_listener;
  if (bonjour_listener)
  {
    nw_listener_cancel(bonjour_listener);
    v6 = self->bonjour_listener;
    self->bonjour_listener = 0;

  }
  interface = self->_interface;
  self->_interface = 0;

  self->canceled = 1;
}

- (RSDNetworkInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->bonjour_listener, 0);
  objc_storeStrong((id *)&self->listener_source, 0);
}

@end
