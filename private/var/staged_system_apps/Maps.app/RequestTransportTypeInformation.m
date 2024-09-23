@implementation RequestTransportTypeInformation

- (RequestTransportTypeInformation)initWithDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  RequestTransportTypeInformation *v11;
  NSDictionary *v12;
  NSDictionary *transportTypeInfoProviders;
  RequestTransportTypeInformation *v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (((unint64_t)objc_msgSend(v10, "integerValue") & 0x8000000000000000) != 0
            || !objc_msgSend(v10, "integerValue")
            || (uint64_t)objc_msgSend(v10, "integerValue") > 5)
          {

            goto LABEL_17;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }

    v16.receiver = self;
    v16.super_class = (Class)RequestTransportTypeInformation;
    v11 = -[RequestTransportTypeInformation init](&v16, "init");
    if (v11)
    {
      v12 = (NSDictionary *)objc_msgSend(v5, "copy");
      transportTypeInfoProviders = v11->_transportTypeInfoProviders;
      v11->_transportTypeInfoProviders = v12;

    }
    self = v11;
    v14 = self;
  }
  else
  {

LABEL_17:
    v14 = 0;
  }

  return v14;
}

- (id)requestInfoProviderForTransportType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTransportTypeInformation transportTypeInfoProviders](self, "transportTypeInfoProviders"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  RequestTransportTypeInformation *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (RequestTransportTypeInformation *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (-[RequestTransportTypeInformation isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTransportTypeInformation transportTypeInfoProviders](v4, "transportTypeInfoProviders"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTransportTypeInformation transportTypeInfoProviders](self, "transportTypeInfoProviders"));
    v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTransportTypeInformation transportTypeInfoProviders](self, "transportTypeInfoProviders"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSDictionary)transportTypeInfoProviders
{
  return self->_transportTypeInfoProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportTypeInfoProviders, 0);
}

@end
