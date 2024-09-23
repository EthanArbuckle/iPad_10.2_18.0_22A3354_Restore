@implementation BMRapportDevice

- (BMRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v5;
  BMRapportDevice *v6;
  BMRapportDevice *v7;
  uint64_t v8;
  NSString *rapportIdentifier;
  uint64_t v10;
  NSMutableArray *requestQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMRapportDevice;
  v6 = -[BMRapportDevice init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bm_companionLinkDeviceIdentifier"));
    rapportIdentifier = v7->_rapportIdentifier;
    v7->_rapportIdentifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (NSMutableArray *)v10;

  }
  return v7;
}

- (BMAccount)account
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice accountAltDSID](self->_device, "accountAltDSID"));
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)BMAccount), "initWithAccountIdentifier:", v2);
  else
    v3 = 0;

  return (BMAccount *)v3;
}

- (NSString)shortenedRapportIdentifier
{
  return -[NSString substringToIndex:](self->_rapportIdentifier, "substringToIndex:", 8);
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (NSString)model
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));

  return (NSString *)v3;
}

- (NSArray)serviceTypes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceTypes"));

  return (NSArray *)v3;
}

- (int64_t)platform
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
  v4 = BMDevicePlatformFromModelString(v3);

  return v4;
}

- (void)invalidateClientWithError:(id)a3
{
  BMRapportDeviceCommunicationClient *client;
  BMRapportDeviceCommunicationClient *v6;
  id v7;

  client = self->_client;
  if (client)
  {
    self->_client = 0;
    v6 = client;
    v7 = a3;

    -[BMRapportDeviceCommunicationClient invalidate](v6, "invalidate");
    -[BMRapportDevice handleInvalidationWithError:](self, "handleInvalidationWithError:", v7);

  }
}

- (void)handleInvalidationWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  BMRapportDevice *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  v5 = self->_requestQueue;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("~~RESPONSE_HANDLER~~")));
        v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
        if (v10)
        {
          if (v4)
          {
            (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, 0, 0, v4);
          }
          else
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 4, 0));
            ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v12);

          }
        }

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](v16->_requestQueue, "removeAllObjects");
  v13 = __biome_log_for_category(11);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice shortenedRapportIdentifier](v16, "shortenedRapportIdentifier"));
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: invalidated", buf, 0xCu);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapportIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice rapportIdentifier](self, "rapportIdentifier"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice rapportIdentifier](self, "rapportIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;

  v13 = 0uLL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "operatingSystemVersion");
  else
    v13 = 0uLL;

  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice shortenedRapportIdentifier](self, "shortenedRapportIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice rapportIdentifier](self, "rapportIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice bmDeviceIdentifier](self, "bmDeviceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice name](self, "name"));
  v11 = objc_msgSend(v5, "initWithFormat:", CFSTR("BMRapportDevice[%@]: id=%@ bmID=%@ model=%@ name=%@ version=%ld.%ld.%ld"), v6, v7, v8, v9, v10, v13, 0);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BMRapportDevice *v3;

  v3 = self;
  return -[BMRapportDevice initWithRPCompanionLinkDevice:](v3, "initWithRPCompanionLinkDevice:", v3->_device);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMRapportDevice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  BMRapportDevice *v8;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RPCompanionLinkDevice, v5), CFSTR("device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = -[BMRapportDevice initWithRPCompanionLinkDevice:](self, "initWithRPCompanionLinkDevice:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BMRapportDevice device](self, "device"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("device"));

}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)bmDeviceIdentifier
{
  return self->_bmDeviceIdentifier;
}

- (void)setBmDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bmDeviceIdentifier, a3);
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BMRapportDeviceCommunicationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bmDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
}

@end
