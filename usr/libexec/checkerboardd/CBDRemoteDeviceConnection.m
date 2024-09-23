@implementation CBDRemoteDeviceConnection

- (CBDRemoteDeviceConnection)initWithRemoteDevice:(id)a3
{
  id v5;
  CBDRemoteDeviceConnection *v6;
  CBDRemoteDeviceConnection *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serviceDiscoveryQueue;
  NSUUID *v10;
  NSUUID *uuid;
  NSUUID *v12;
  NSUUID *v13;
  NSUUID *v14;
  NSString *v15;
  uint64_t v16;
  NSString *name;
  __CFString *v18;
  void *v19;
  id v20;
  NSDictionary *v21;
  NSDictionary *properties;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  NSUUID *v30;
  NSString *v31;
  _QWORD applier[4];
  id v34;
  objc_super v35;
  uint8_t buf[4];
  NSUUID *v37;
  __int16 v38;
  NSString *v39;
  _QWORD v40[2];

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CBDRemoteDeviceConnection;
  v6 = -[CBDRemoteDeviceConnection init](&v35, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteDevice, a3);
    v8 = dispatch_queue_create("com.apple.deviceconnection.handshake", 0);
    serviceDiscoveryQueue = v7->_serviceDiscoveryQueue;
    v7->_serviceDiscoveryQueue = (OS_dispatch_queue *)v8;

    v40[0] = 0;
    v40[1] = 0;
    remote_device_copy_uuid(v5, v40);
    v10 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v40);
    uuid = v7->_uuid;
    v7->_uuid = v10;

    v12 = v7->_uuid;
    if (v12)
      v13 = v12;
    else
      v13 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("0000000000"));
    v14 = v7->_uuid;
    v7->_uuid = v13;

    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", remote_device_get_name(v5));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    name = v7->_name;
    v7->_name = (NSString *)v16;

    if (v7->_name)
      v18 = (__CFString *)v7->_name;
    else
      v18 = CFSTR("Unknown");
    objc_storeStrong((id *)&v7->_name, v18);
    v19 = (void *)remote_device_copy_properties(v5);
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100004438;
    applier[3] = &unk_10000C508;
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v34 = v20;
    xpc_dictionary_apply(v19, applier);
    v21 = (NSDictionary *)objc_msgSend(v20, "copy");
    properties = v7->_properties;
    v7->_properties = v21;

    v23 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v7->_properties, "objectForKeyedSubscript:", CFSTR("ProductType")));
    v24 = (void *)v23;
    if (v23)
      v25 = (__CFString *)v23;
    else
      v25 = CFSTR("Unknown");
    objc_storeStrong((id *)&v7->_productType, v25);

    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v7->_properties, "objectForKeyedSubscript:", CFSTR("OSVersion")));
    v27 = CFSTR("0.0");
    if (v26)
      v27 = v26;
    v7->_osVersion = &v27->isa;

    v28 = CheckerBoardLogHandleForCategory(11);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v7->_name;
      v30 = v7->_uuid;
      *(_DWORD *)buf = 138412546;
      v37 = v30;
      v38 = 2112;
      v39 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Remote Device UUID: %@; name: %@",
        buf,
        0x16u);
    }

  }
  return v7;
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection remoteDevice](self, "remoteDevice"));

  if (v3)
    -[CBDRemoteDeviceConnection setRemoteDevice:](self, "setRemoteDevice:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[CBDRemoteDeviceConnection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CBDRemoteDeviceConnection;
  -[CBDRemoteDeviceConnection dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection productType](self, "productType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection osVersion](self, "osVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; uuid = %@, name = %@, productType = %@, osVersion = %@>"),
                    v5,
                    self,
                    v6,
                    v7,
                    v8,
                    v9));

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection uuid](self, "uuid"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqualToDeviceConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  CBDRemoteDeviceConnection *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (CBDRemoteDeviceConnection *)a3;
  v5 = self == v4;
  v7 = objc_opt_class(CBDRemoteDeviceConnection, v6);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    v5 = -[CBDRemoteDeviceConnection isEqualToDeviceConnection:](self, "isEqualToDeviceConnection:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CBDRemoteDeviceConnection *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v4 = objc_alloc_init(CBDRemoteDeviceConnection);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection name](self, "name"));
  v6 = objc_msgSend(v5, "copy");
  -[CBDRemoteDeviceConnection setName:](v4, "setName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection uuid](self, "uuid"));
  v8 = objc_msgSend(v7, "copy");
  -[CBDRemoteDeviceConnection setUuid:](v4, "setUuid:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection productType](self, "productType"));
  v10 = objc_msgSend(v9, "copy");
  -[CBDRemoteDeviceConnection setProductType:](v4, "setProductType:", v10);

  v11 = objc_alloc((Class)NSDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteDeviceConnection properties](self, "properties"));
  v13 = objc_msgSend(v11, "initWithDictionary:copyItems:", v12, 1);
  -[CBDRemoteDeviceConnection setProperties:](v4, "setProperties:", v13);

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  self->_osVersion = (NSString *)a3;
}

- (OS_remote_device)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (OS_dispatch_queue)serviceDiscoveryQueue
{
  return self->_serviceDiscoveryQueue;
}

- (void)setServiceDiscoveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDiscoveryQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDiscoveryQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
