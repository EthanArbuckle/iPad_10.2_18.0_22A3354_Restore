@implementation RPTransportServiceHandoverMessage

- (RPTransportServiceHandoverMessage)initWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPTransportServiceHandoverMessage *v14;
  NSArray *v15;
  NSArray *transportServicesMetadata;
  NSString *v17;
  NSString *applicationLabel;
  NSString *v19;
  NSString *version;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RPTransportServiceHandoverMessage;
  v14 = -[RPTransportServiceHandoverMessage init](&v22, "init");
  if (v14)
  {
    v15 = (NSArray *)objc_msgSend(v10, "copy");
    transportServicesMetadata = v14->_transportServicesMetadata;
    v14->_transportServicesMetadata = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    applicationLabel = v14->_applicationLabel;
    v14->_applicationLabel = v17;

    objc_storeStrong((id *)&v14->_payload, a5);
    v19 = (NSString *)objc_msgSend(v13, "copy");
    version = v14->_version;
    v14->_version = v19;

  }
  return v14;
}

+ (RPTransportServiceHandoverMessage)messageWithMetadata:(id)a3 applicationLabel:(id)a4 payload:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v16 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v14, v15)), "initWithMetadata:applicationLabel:payload:version:", v13, v12, v11, v10);

  return (RPTransportServiceHandoverMessage *)v16;
}

- (id)transportServicesMetadataDictionaryRepresentation
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_transportServicesMetadata;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "dictionaryRepresentation", (_QWORD)v11));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  return -[RPTransportServiceHandoverMessage descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;
  NSString *version;
  NSString *v9;
  id v10;
  NSString *applicationLabel;
  NSString *v12;
  id v13;
  RPNearFieldMessagePayload *payload;
  RPNearFieldMessagePayload *v15;
  id v16;
  NSArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _BYTE v35[128];

  v3 = *(_QWORD *)&a3;
  v34 = 0;
  v5 = objc_opt_class(self, a2, *(_QWORD *)&a3);
  NSAppendPrintF(&v34, "%@", v5);
  v6 = v34;
  v7 = v6;
  version = self->_version;
  if (version)
  {
    v33 = v6;
    v9 = version;
    NSAppendPrintF(&v33, " Ver %@", v9);
    v10 = v33;

    v7 = v10;
  }
  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    v32 = v7;
    v12 = applicationLabel;
    NSAppendPrintF(&v32, " applicationLabel %@", v12);
    v13 = v32;

    v7 = v13;
  }
  payload = self->_payload;
  if (payload)
  {
    v31 = v7;
    v15 = payload;
    NSAppendPrintF(&v31, " payload: %@", v15);
    v16 = v31;

    v7 = v16;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_transportServicesMetadata;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v21);
        v26 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "descriptionWithLevel:", v3));
        NSAppendPrintF(&v26, "\n\t%@", v24);
        v7 = v26;

        v21 = (char *)v21 + 1;
        v22 = v7;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  return v7;
}

+ (RPTransportServiceHandoverMessage)messageWithConnectionHandoverSelect:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  RPNearFieldAuthenticationPayload *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transportServiceList"));
  v6 = sub_100069F74(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if (v10)
  {
    v11 = objc_opt_class(NSDictionary, v8, v9);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);
    if ((isKindOfClass & 1) != 0)
      v13 = v10;
    else
      v13 = 0;
    v14 = v13;
    v15 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      v18 = -[RPNearFieldAuthenticationPayload initWithDictionary:]([RPNearFieldAuthenticationPayload alloc], "initWithDictionary:", v10);
      if (v18
        || (v18 = -[RPNearFieldValidationPayload initWithDictionary:]([RPNearFieldValidationPayload alloc], "initWithDictionary:", v10)) != 0)
      {
        v19 = (void *)objc_opt_class(a1, v16, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationLabel"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "version"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "messageWithMetadata:applicationLabel:payload:version:", v7, v20, v18, v21));

      }
      else
      {
        v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return (RPTransportServiceHandoverMessage *)v15;
}

+ (RPTransportServiceHandoverMessage)messageWithConnectionHandoverRequest:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  uint64_t NSNumber;
  void *v17;
  void *v18;
  id v19;
  __objc2_class **v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transportServiceList"));
  v6 = sub_100069F74(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if (v10)
  {
    v11 = objc_opt_class(NSDictionary, v8, v9);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);
    if ((isKindOfClass & 1) != 0)
      v13 = v10;
    else
      v13 = 0;
    v14 = v13;
    v15 = 0;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_16;
    NSNumber = NSDictionaryGetNSNumber(v10, &off_10011AA88, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v18 = v17;
    if (!v17 || (v19 = objc_msgSend(v17, "integerValue"), v19 == (id)1))
    {
      v20 = &off_1001106D0;
    }
    else
    {
      if (v19 != (id)2)
        goto LABEL_14;
      v20 = &off_1001106E0;
    }
    v21 = objc_msgSend(objc_alloc(*v20), "initWithDictionary:", v10);
    if (v21)
    {
      v24 = v21;
      v25 = (void *)objc_opt_class(a1, v22, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationLabel"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "version"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "messageWithMetadata:applicationLabel:payload:version:", v7, v26, v24, v27));

LABEL_15:
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v15 = 0;
LABEL_17:

  return (RPTransportServiceHandoverMessage *)v15;
}

- (id)connectionHandoverSelect
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage transportServicesMetadataDictionaryRepresentation](self, "transportServicesMetadataDictionaryRepresentation"));
  v6 = objc_alloc((Class)off_100130FD8[0]());
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage version](self, "version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage applicationLabel](self, "applicationLabel"));
  v9 = objc_msgSend(v6, "initWithVersion:applicationLabel:serivceList:userInfo:", v7, v8, v5, v4);

  return v9;
}

- (id)connectionHandoverRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage transportServicesMetadataDictionaryRepresentation](self, "transportServicesMetadataDictionaryRepresentation"));
  v6 = objc_alloc(off_100130FE0());
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage version](self, "version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPTransportServiceHandoverMessage applicationLabel](self, "applicationLabel"));
  v9 = objc_msgSend(v6, "initWithVersion:applicationLabel:serivceList:userInfo:", v7, v8, v5, v4);

  return v9;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (RPNearFieldMessagePayload)payload
{
  return self->_payload;
}

- (NSArray)transportServicesMetadata
{
  return self->_transportServicesMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportServicesMetadata, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
