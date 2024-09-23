@implementation _HAPBTLEDiscoveryContext

- (_HAPBTLEDiscoveryContext)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (_HAPBTLEDiscoveryContext)initWithDiscoveryType:(int64_t)a3
{
  _HAPBTLEDiscoveryContext *v4;
  _HAPBTLEDiscoveryContext *v5;
  uint64_t v6;
  NSMutableArray *discoveringServices;
  uint64_t v8;
  NSMutableArray *discoveringCharacteristics;
  uint64_t v10;
  NSMutableArray *readingCharacteristics;
  uint64_t v12;
  NSMutableArray *discoveringDescriptors;
  uint64_t v14;
  NSMutableArray *readingDescriptors;
  uint64_t v16;
  NSMutableArray *readingSignatureCharacteristics;
  uint64_t v18;
  NSMutableArray *readingSignatureServices;
  uint64_t v20;
  NSMapTable *characteristicSignatures;
  uint64_t v22;
  NSMapTable *serviceSignatures;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_HAPBTLEDiscoveryContext;
  v4 = -[_HAPBTLEDiscoveryContext init](&v25, "init");
  v5 = v4;
  if (v4)
  {
    v4->_discoveryType = a3;
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    discoveringServices = v5->_discoveringServices;
    v5->_discoveringServices = (NSMutableArray *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    discoveringCharacteristics = v5->_discoveringCharacteristics;
    v5->_discoveringCharacteristics = (NSMutableArray *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    readingCharacteristics = v5->_readingCharacteristics;
    v5->_readingCharacteristics = (NSMutableArray *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    discoveringDescriptors = v5->_discoveringDescriptors;
    v5->_discoveringDescriptors = (NSMutableArray *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    readingDescriptors = v5->_readingDescriptors;
    v5->_readingDescriptors = (NSMutableArray *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    readingSignatureCharacteristics = v5->_readingSignatureCharacteristics;
    v5->_readingSignatureCharacteristics = (NSMutableArray *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    readingSignatureServices = v5->_readingSignatureServices;
    v5->_readingSignatureServices = (NSMutableArray *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    characteristicSignatures = v5->_characteristicSignatures;
    v5->_characteristicSignatures = (NSMapTable *)v20;

    v22 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    serviceSignatures = v5->_serviceSignatures;
    v5->_serviceSignatures = (NSMapTable *)v22;

  }
  return v5;
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[_HAPBTLEDiscoveryContext setDiscovering:](self, "setDiscovering:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext discoveringServices](self, "discoveringServices"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext discoveringCharacteristics](self, "discoveringCharacteristics"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingCharacteristics](self, "readingCharacteristics"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext discoveringDescriptors](self, "discoveringDescriptors"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingDescriptors](self, "readingDescriptors"));
  objc_msgSend(v7, "removeAllObjects");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingSignatureCharacteristics](self, "readingSignatureCharacteristics"));
  objc_msgSend(v8, "removeAllObjects");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingSignatureServices](self, "readingSignatureServices"));
  objc_msgSend(v9, "removeAllObjects");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext characteristicSignatures](self, "characteristicSignatures"));
  objc_msgSend(v10, "removeAllObjects");

  v11 = (id)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext serviceSignatures](self, "serviceSignatures"));
  objc_msgSend(v11, "removeAllObjects");

}

- (BOOL)isComplete
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext discoveringServices](self, "discoveringServices"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext discoveringCharacteristics](self, "discoveringCharacteristics"));
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingCharacteristics](self, "readingCharacteristics"));
      if (objc_msgSend(v6, "count"))
      {
        v4 = 0;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext discoveringDescriptors](self, "discoveringDescriptors"));
        if (objc_msgSend(v7, "count"))
        {
          v4 = 0;
        }
        else
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingDescriptors](self, "readingDescriptors"));
          if (objc_msgSend(v8, "count"))
          {
            v4 = 0;
          }
          else
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingSignatureCharacteristics](self, "readingSignatureCharacteristics"));
            if (objc_msgSend(v9, "count"))
            {
              v4 = 0;
            }
            else
            {
              v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPBTLEDiscoveryContext readingSignatureServices](self, "readingSignatureServices"));
              v4 = objc_msgSend(v10, "count") == 0;

            }
          }

        }
      }

    }
  }

  return v4;
}

- (int64_t)discoveryType
{
  return self->_discoveryType;
}

- (NSMutableArray)discoveringServices
{
  return self->_discoveringServices;
}

- (NSMutableArray)discoveringCharacteristics
{
  return self->_discoveringCharacteristics;
}

- (NSMutableArray)readingCharacteristics
{
  return self->_readingCharacteristics;
}

- (NSMutableArray)discoveringDescriptors
{
  return self->_discoveringDescriptors;
}

- (NSMutableArray)readingDescriptors
{
  return self->_readingDescriptors;
}

- (NSMutableArray)readingSignatureCharacteristics
{
  return self->_readingSignatureCharacteristics;
}

- (NSMutableArray)readingSignatureServices
{
  return self->_readingSignatureServices;
}

- (NSMapTable)characteristicSignatures
{
  return self->_characteristicSignatures;
}

- (NSMapTable)serviceSignatures
{
  return self->_serviceSignatures;
}

- (BOOL)isDiscovering
{
  return self->_discovering;
}

- (void)setDiscovering:(BOOL)a3
{
  self->_discovering = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serviceSignatures, 0);
  objc_storeStrong((id *)&self->_characteristicSignatures, 0);
  objc_storeStrong((id *)&self->_readingSignatureServices, 0);
  objc_storeStrong((id *)&self->_readingSignatureCharacteristics, 0);
  objc_storeStrong((id *)&self->_readingDescriptors, 0);
  objc_storeStrong((id *)&self->_discoveringDescriptors, 0);
  objc_storeStrong((id *)&self->_readingCharacteristics, 0);
  objc_storeStrong((id *)&self->_discoveringCharacteristics, 0);
  objc_storeStrong((id *)&self->_discoveringServices, 0);
}

@end
