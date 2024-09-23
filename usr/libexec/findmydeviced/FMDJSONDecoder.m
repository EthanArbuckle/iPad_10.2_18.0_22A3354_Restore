@implementation FMDJSONDecoder

- (FMDJSONDecoder)init
{
  FMDJSONDecoder *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *container;
  NSMutableArray *v5;
  NSMutableArray *stack;
  FMDCodableFactory *v7;
  FMDDecoderFactory *factory;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMDJSONDecoder;
  v2 = -[FMDJSONDecoder init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    container = v2->_container;
    v2->_container = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    stack = v2->_stack;
    v2->_stack = v5;

    v7 = objc_opt_new(FMDCodableFactory);
    factory = v2->_factory;
    v2->_factory = (FMDDecoderFactory *)v7;

  }
  return v2;
}

- (FMDJSONDecoder)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  FMDJSONDecoder *v7;
  FMDCodableFactory *v8;
  FMDDecoderFactory *factory;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  id v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDJSONDecoder;
  v7 = -[FMDJSONDecoder init](&v18, "init");
  if (v7)
  {
    v8 = objc_opt_new(FMDCodableFactory);
    factory = v7->_factory;
    v7->_factory = (FMDDecoderFactory *)v8;

    v17 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 4, &v17));
    v11 = v17;
    objc_storeStrong(&v7->_jsonObject, v10);
    v13 = objc_opt_class(NSDictionary, v12);
    isKindOfClass = objc_opt_isKindOfClass(v10, v13);
    v15 = 16;
    if ((isKindOfClass & 1) != 0)
      v15 = 24;
    objc_storeStrong((id *)((char *)&v7->super.isa + v15), v10);
    if (a4 && v11)
      *a4 = objc_retainAutorelease(v11);

  }
  return v7;
}

- (FMDJSONDecoder)initWithData:(id)a3 usingCollectionObjectKeyType:(id)a4 andCollectionObjectClass:(Class)a5 error:(id *)a6
{
  id v10;
  id v11;
  FMDJSONDecoder *v12;
  FMDCodableFactory *v13;
  FMDDecoderFactory *factory;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char isKindOfClass;
  uint64_t v20;
  id v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FMDJSONDecoder;
  v12 = -[FMDJSONDecoder init](&v23, "init");
  if (v12)
  {
    v13 = objc_opt_new(FMDCodableFactory);
    factory = v12->_factory;
    v12->_factory = (FMDDecoderFactory *)v13;

    objc_storeStrong((id *)&v12->_collectionObjectClass, a5);
    objc_storeStrong((id *)&v12->_collectionObjectKeyType, a4);
    v22 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v10, 4, &v22));
    v16 = v22;
    objc_storeStrong(&v12->_jsonObject, v15);
    v18 = objc_opt_class(NSDictionary, v17);
    isKindOfClass = objc_opt_isKindOfClass(v15, v18);
    v20 = 16;
    if ((isKindOfClass & 1) != 0)
      v20 = 24;
    objc_storeStrong((id *)((char *)&v12->super.isa + v20), v15);
    if (a6 && v16)
      *a6 = objc_retainAutorelease(v16);

  }
  return v12;
}

- (FMDJSONDecoder)initWithDictionaryData:(id)a3 andError:(id *)a4
{
  id v6;
  FMDJSONDecoder *v7;
  uint64_t v8;
  id v9;
  NSMutableDictionary *container;
  FMDCodableFactory *v11;
  FMDDecoderFactory *factory;
  id v13;
  void *v14;
  id v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDJSONDecoder;
  v7 = -[FMDJSONDecoder init](&v17, "init");
  if (v7)
  {
    v16 = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 4, &v16));
    v9 = v16;
    container = v7->_container;
    v7->_container = (NSMutableDictionary *)v8;

    v11 = objc_opt_new(FMDCodableFactory);
    factory = v7->_factory;
    v7->_factory = (FMDDecoderFactory *)v11;

    if (a4 && v9)
    {
      v13 = objc_msgSend(v9, "code");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), v13, v14));

    }
  }

  return v7;
}

- (FMDJSONDecoder)initWithArrayData:(id)a3 andError:(id *)a4
{
  id v6;
  FMDJSONDecoder *v7;
  uint64_t v8;
  id v9;
  NSMutableArray *stack;
  FMDCodableFactory *v11;
  FMDDecoderFactory *factory;
  id v13;
  void *v14;
  id v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDJSONDecoder;
  v7 = -[FMDJSONDecoder init](&v17, "init");
  if (v7)
  {
    v16 = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 4, &v16));
    v9 = v16;
    stack = v7->_stack;
    v7->_stack = (NSMutableArray *)v8;

    v11 = objc_opt_new(FMDCodableFactory);
    factory = v7->_factory;
    v7->_factory = (FMDDecoderFactory *)v11;

    if (a4 && v9)
    {
      v13 = objc_msgSend(v9, "code");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), v13, v14));

    }
  }

  return v7;
}

- (FMDJSONDecoder)initWithDictionary:(id)a3
{
  id v4;
  FMDJSONDecoder *v5;
  uint64_t v6;
  NSMutableDictionary *container;
  FMDCodableFactory *v8;
  FMDDecoderFactory *factory;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDJSONDecoder;
  v5 = -[FMDJSONDecoder init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
    container = v5->_container;
    v5->_container = (NSMutableDictionary *)v6;

    v8 = objc_opt_new(FMDCodableFactory);
    factory = v5->_factory;
    v5->_factory = (FMDDecoderFactory *)v8;

  }
  return v5;
}

- (BOOL)containsValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6 != 0;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));
    v11 = objc_msgSend(v10, "BOOLValue");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSNumber, v7);
  v9 = 0.0;
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v4));
    objc_msgSend(v11, "doubleValue");
    v9 = v12;

  }
  return v9;
}

- (float)decodeFloatForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  void *v10;
  void *v11;
  float v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSNumber, v7);
  v9 = 0.0;
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v4));
    objc_msgSend(v11, "floatValue");
    v9 = v12;

  }
  return v9;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));
    v11 = objc_msgSend(v10, "integerValue");

  }
  else
  {
    v11 = 0;
  }

  return (int64_t)v11;
}

- (unint64_t)decodeUnsignedIntegerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  else
  {
    v11 = 0;
  }

  return (unint64_t)v11;
}

- (id)decodeNumberForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)decodeStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v8 = objc_opt_class(NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FMDJSONDecoder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  const __CFString **v21;
  NSErrorUserInfoKey *v22;
  id v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v8 = a4;
  v9 = sub_10005303C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10022D700();

  if ((Class)objc_opt_class(NSString, v11) != a3
    && (Class)objc_opt_class(NSNumber, v12) != a3
    && (Class)objc_opt_class(NSNull, v13) != a3)
  {
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable))
    {
      v14 = objc_alloc_init(FMDJSONDecoder);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v8));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder factory](self, "factory"));
        v24 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder processJSON:forCodableType:usingFactory:error:](v14, "processJSON:forCodableType:usingFactory:error:", v16, a3, v17, &v24));
        v19 = v24;

      }
      else
      {
        v18 = 0;
        v19 = 0;
      }

      goto LABEL_14;
    }
    v25 = NSLocalizedFailureReasonErrorKey;
    v26 = CFSTR("Object does not conform to FMDCodable.");
    v21 = &v26;
    v22 = &v25;
LABEL_13:
    v14 = (FMDJSONDecoder *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v22, 1));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v14));
    v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v8));

  if ((objc_opt_isKindOfClass(v18, a3) & 1) == 0)
  {

    v27 = NSLocalizedFailureReasonErrorKey;
    v28 = CFSTR("Object does not conform to given class.");
    v21 = &v28;
    v22 = &v27;
    goto LABEL_13;
  }
  v19 = 0;
LABEL_15:
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a5, v19);

  return v18;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FMDJSONDecoder *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  uint8_t buf[4];
  Class v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = sub_10005303C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v27 = a3;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "decodeObjectOfClass:%@ forKey:%@ usingFactory:%@", buf, 0x20u);
  }

  if ((Class)objc_opt_class(NSString, v14) == a3
    || (Class)objc_opt_class(NSNumber, v15) == a3
    || (Class)objc_opt_class(NSNull, v16) == a3)
  {
    v17 = (FMDJSONDecoder *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder objectForKey:](v17, "objectForKey:", v10));
    v21 = 0;
  }
  else if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable))
  {
    v17 = objc_alloc_init(FMDJSONDecoder);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v10));

    v23 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder processJSON:forCodableType:usingFactory:error:](v17, "processJSON:forCodableType:usingFactory:error:", v19, a3, v11, &v23));
    v21 = v23;

  }
  else
  {
    v24 = NSLocalizedFailureReasonErrorKey;
    v25 = CFSTR("Object does not conform to FMDCodable.");
    v17 = (FMDJSONDecoder *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v17));
    v20 = 0;
  }

  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v21);
  return v20;
}

- (id)decodeObjectOfProtocols:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  void *v20;
  id v21;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = sub_10005303C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10022D760();

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v9));

  if (v13)
  {
    v15 = objc_opt_class(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder factory](self, "factory"));
    v23 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder processJSON:forCodableType:usingFactory:error:](self, "processJSON:forCodableType:usingFactory:error:", v13, v15, v16, &v23));
    v18 = v23;

    +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a5, v18);
    v19 = -[FMDJSONDecoder isValidObject:usingProtocols:](self, "isValidObject:usingProtocols:", v17, v8);

    if (v19)
      v20 = v17;
    else
      v20 = 0;
    v21 = v20;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)decodeObjectUsingFactories:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  void **p_cache;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  objc_class *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v30;
  FMDJSONDecoder *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  FMDJSONDecoder *v40;
  id *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  NSErrorUserInfoKey v48;
  const __CFString *v49;
  _BYTE v50[128];

  v8 = a3;
  v9 = a4;
  v10 = sub_10005303C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10022D7C0();

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v9));

  v14 = &ACErrorKeychainDomain_ptr;
  p_cache = FMDCompanionRegistryFactory.cache;
  if (v13 == (void *)objc_opt_class(NSString, v15)
    || v13 == (void *)objc_opt_class(NSNumber, v16)
    || v13 == (void *)objc_opt_class(NSNull, v18))
  {
    v27 = v13;
    v28 = 0;
  }
  else if (objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable))
  {
    v19 = v13;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v21)
    {
      v22 = v21;
      v41 = a5;
      v23 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v23)
            objc_enumerationMutation(v20);
          v25 = (objc_class *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "classForObjectInfo:", v19);
          if (v25)
          {
            v26 = v25;
            goto LABEL_20;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v22)
          continue;
        break;
      }
      v26 = 0;
LABEL_20:
      a5 = v41;
      v14 = &ACErrorKeychainDomain_ptr;
    }
    else
    {
      v26 = 0;
    }

    p_cache = FMDCompanionRegistryFactory.cache;
    v31 = -[FMDJSONDecoder initWithDictionary:]([FMDJSONDecoder alloc], "initWithDictionary:", v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder factory](self, "factory"));
    -[FMDJSONDecoder setFactory:](v31, "setFactory:", v32);

    v43 = 0;
    v27 = objc_msgSend([v26 alloc], "initWithFMDCoder:error:", v31, &v43);
    v33 = v43;
    if (v33)
    {
      v42 = v33;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v34 = v14[233];
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "userInfo"));
      v40 = v31;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", NSLocalizedFailureReasonErrorKey));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringWithFormat:", CFSTR("Key: %@ | Error: %@"), v9, v36));

      objc_msgSend(v38, "setObject:forKey:", v39, NSLocalizedFailureReasonErrorKey);
      objc_msgSend(v38, "setObject:forKey:", v42, NSUnderlyingErrorKey);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "domain"));
      p_cache = (void **)(FMDCompanionRegistryFactory + 16);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v37, objc_msgSend(0, "code"), v38));

      v31 = v40;
      v33 = v42;
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v48 = NSLocalizedFailureReasonErrorKey;
    v49 = CFSTR("Object does not conform to FMDCodable.");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v30));

    v27 = 0;
  }
  objc_msgSend(p_cache + 318, "checkAndSetOutError:WithError:", a5, v28);

  return v27;
}

- (BOOL)isValidObject:(id)a3 usingProtocols:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = sub_10005303C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10022D820();

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder protocols](self, "protocols"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder protocols](self, "protocols"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setByAddingObjectsFromSet:", v11));

  }
  else
  {
    v12 = v7;
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        if (!objc_msgSend(v6, "conformsToProtocol:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i)))
        {
          v18 = 0;
          goto LABEL_16;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_16:

  return v18;
}

- (id)decodeCodableClass:(Class)a3 withJSONObject:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  FMDJSONDecoder *v22;
  void *v23;
  id v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;
  uint8_t buf[4];
  Class v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v9 = a4;
  v10 = a5;
  v11 = sub_10005303C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = a3;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "decodeCodableClass:%@ withJSONObject:%@ usingFactory:%@", buf, 0x20u);
  }

  if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0
    && ((v14 = objc_opt_class(NSString, v13), (objc_opt_isKindOfClass(v9, v14) & 1) != 0)
     || (v16 = objc_opt_class(NSNumber, v15), (objc_opt_isKindOfClass(v9, v16) & 1) != 0)
     || (v18 = objc_opt_class(NSNull, v17), (objc_opt_isKindOfClass(v9, v18) & 1) != 0)))
  {
    v19 = v9;
    v20 = 0;
  }
  else
  {
    v21 = objc_opt_class(NSDictionary, v13);
    if ((objc_opt_isKindOfClass(v9, v21) & 1) != 0)
    {
      v22 = -[FMDJSONDecoder initWithDictionary:]([FMDJSONDecoder alloc], "initWithDictionary:", v9);
      -[FMDJSONDecoder setFactory:](v22, "setFactory:", v10);
      v25 = 0;
      v19 = objc_msgSend([a3 alloc], "initWithFMDCoder:error:", v22, &v25);
      v20 = v25;

    }
    else
    {
      v26 = NSLocalizedFailureReasonErrorKey;
      v27 = CFSTR("FMDCodable Class mismatch.");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v23));

      v19 = 0;
    }
  }
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v20);

  return v19;
}

- (id)decodeCodableClass:(Class)a3 withJSONObject:(id)a4 usingObjectKeyType:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  FMDJSONDecoder *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  NSErrorUserInfoKey v23;
  void *v24;
  uint8_t buf[4];
  Class v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v9 = a4;
  v10 = a5;
  v11 = sub_10005303C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v26 = a3;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "decodeCodableClass:%@ withJSONObject:%@ usingObjectKeyType:%@", buf, 0x20u);
  }

  v13 = -[FMDJSONDecoder initWithDictionary:]([FMDJSONDecoder alloc], "initWithDictionary:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](v13, "container"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
  v16 = objc_msgSend(v15, "containsObject:", v10);

  if (v16)
  {
    v22 = 0;
    v17 = objc_msgSend([a3 alloc], "initWithFMDCoder:error:", v13, &v22);
    v18 = v22;
  }
  else
  {
    v23 = NSLocalizedFailureReasonErrorKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unsupported object class key - %@"), v10));
    v24 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v20));

    v17 = 0;
  }
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v18);

  return v17;
}

- (id)processJSON:(id)a3 forCodableType:(Class)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  Class v28;
  __int16 v29;
  id v30;

  v10 = a3;
  v11 = a5;
  v12 = sub_10005303C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v10;
    v27 = 2112;
    v28 = a4;
    v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "processJSON:%@ forCodableType:%@ usingFactory:%@", buf, 0x20u);
  }

  v14 = sub_10005303C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10022D880(self, v15);

  if (-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodableCollection))
  {
    v22 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeCollectionOfClass:fromJSONObject:usingFactory:error:](self, "decodeCollectionOfClass:fromJSONObject:usingFactory:error:", a4, v10, v11, &v22));
    v17 = v22;
  }
  else
  {
    if (!-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable))
    {
      v23 = NSLocalizedFailureReasonErrorKey;
      v24 = CFSTR("Object does not conform to FMDCodable.");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v19));

      v16 = 0;
      goto LABEL_11;
    }
    v21 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeCodableClass:withJSONObject:usingFactory:error:](self, "decodeCodableClass:withJSONObject:usingFactory:error:", a4, v10, v11, &v21));
    v17 = v21;
  }
  v18 = v17;
LABEL_11:
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v18);

  return v16;
}

- (id)decodeCollectionOfClass:(Class)a3 usingFactory:(id)a4 forKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  Class v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v10 = a4;
  v11 = a5;
  v12 = sub_10005303C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = a3;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "decodeCollectionOfClass:%@ usingFactory:%@ forKey:%@", buf, 0x20u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](self, "container"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11));

  if (v15)
  {
    v19 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeCollectionOfClass:fromJSONObject:usingFactory:error:](self, "decodeCollectionOfClass:fromJSONObject:usingFactory:error:", a3, v15, v10, &v19));
    v17 = v19;
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v17);

  return v16;
}

- (id)decodeCollectionOfClass:(Class)a3 fromJSONObject:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  Class v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v10 = a4;
  v11 = a5;
  v12 = sub_10005303C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v33 = a3;
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "decodeCollectionOfClass:%@ fromJSONObject:%@ usingFactory:%@", buf, 0x20u);
  }

  if (!-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodableCollection))
  {
    v28 = NSLocalizedFailureReasonErrorKey;
    v29 = CFSTR("Object does not conform to FMDCodableCollection.");
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v16));
    goto LABEL_13;
  }
  if ((objc_opt_isKindOfClass(v10, a3) & 1) == 0
    || (v15 = objc_opt_class(NSArray, v14), (objc_opt_isKindOfClass(v10, v15) & 1) == 0))
  {
    if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0)
    {
      v21 = objc_opt_class(NSDictionary, v20);
      if ((objc_opt_isKindOfClass(v10, v21) & 1) != 0)
      {
        v26 = 0;
        v16 = v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeDictionaryCollection:usingFactory:error:](self, "decodeDictionaryCollection:usingFactory:error:", v16, v11, &v26));
        v18 = v26;
        goto LABEL_11;
      }
    }
    v30 = NSLocalizedFailureReasonErrorKey;
    v22 = NSStringFromClass(a3);
    v16 = (id)objc_claimAutoreleasedReturnValue(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Object Type mismatch: %@"), v16));
    v31 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v24));

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  v27 = 0;
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeArrayCollection:usingFactory:error:](self, "decodeArrayCollection:usingFactory:error:", v16, v11, &v27));
  v18 = v27;
LABEL_11:
  v19 = v18;
LABEL_14:

  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v19);
  return v17;
}

- (id)decodeArrayCollection:(id)a3 usingFactory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void **p_cache;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  void **v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v35 = a5;
  v7 = a3;
  v8 = a4;
  v9 = sub_10005303C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10022D940();

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v7;
  p_cache = FMDCompanionRegistryFactory.cache;
  v14 = &ACErrorKeychainDomain_ptr;
  v37 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v42;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v36)
        objc_enumerationMutation(v12);
      v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
      v17 = objc_alloc_init((Class)(p_cache + 318));
      objc_msgSend(v17, "setFactory:", v8);
      v19 = objc_opt_class(v14[196], v18);
      if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
        break;
      if (!-[FMDJSONDecoder collectionObjectClass](self, "collectionObjectClass"))
      {
        v32 = objc_opt_class(v16, v24);
        v38 = 0;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "processJSON:forCodableType:usingFactory:error:", v16, v32, v8, &v38));
        v23 = v38;
LABEL_14:
        v31 = v23;
        if (v31)
        {
LABEL_18:

          v33 = 0;
          goto LABEL_19;
        }
        goto LABEL_15;
      }
      v25 = -[FMDJSONDecoder collectionObjectClass](self, "collectionObjectClass");
      v26 = v8;
      v27 = p_cache;
      v28 = v11;
      v29 = v12;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder collectionObjectKeyType](self, "collectionObjectKeyType"));
      v39 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeCodableClass:withJSONObject:usingObjectKeyType:error:](self, "decodeCodableClass:withJSONObject:usingObjectKeyType:error:", v25, v16, v30, &v39));
      v31 = v39;

      v12 = v29;
      v11 = v28;
      p_cache = v27;
      v8 = v26;
      v14 = &ACErrorKeychainDomain_ptr;
      if (v31)
        goto LABEL_18;
LABEL_15:
      objc_msgSend(v11, "addObject:", v22, v35);

      if (v37 == (id)++v15)
      {
        v37 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v37)
          goto LABEL_5;
        goto LABEL_17;
      }
    }
    v21 = objc_opt_class(v14[196], v20);
    v40 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "processJSON:forCodableType:usingFactory:error:", v16, v21, v8, &v40));
    v23 = v40;
    goto LABEL_14;
  }
LABEL_17:

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[196], "arrayWithArray:", v11));
  v31 = 0;
LABEL_19:
  objc_msgSend(p_cache + 318, "checkAndSetOutError:WithError:", v35, v31, v35);

  return v33;
}

- (id)decodeDictionaryCollection:(id)a3 usingFactory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void **p_cache;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _UNKNOWN **v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *j;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  __int16 v89;
  id v90;

  v8 = a3;
  v9 = a4;
  v10 = sub_10005303C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v88 = v8;
    v89 = 2112;
    v90 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "decodeDictionaryCollection:%@ usingFactory:%@", buf, 0x16u);
  }

  p_cache = (void **)(FMDCompanionRegistryFactory + 16);
  if (!objc_msgSend(v8, "count"))
  {
    v14 = v8;
LABEL_7:
    v15 = 0;
    goto LABEL_49;
  }
  v13 = objc_msgSend(v9, "classForObjectInfo:", v8);
  if (v13)
  {
    v83 = 0;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeCodableClass:withJSONObject:usingFactory:error:](self, "decodeCodableClass:withJSONObject:usingFactory:error:", v13, v8, v9, &v83));
    v15 = v83;
    goto LABEL_49;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
  if (!v17)
  {

    v14 = 0;
    goto LABEL_7;
  }
  v19 = v17;
  v20 = *(_QWORD *)v80;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v80 != v20)
        objc_enumerationMutation(v16);
      v22 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
      v23 = objc_opt_class(NSString, v18);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
      {

        v14 = 0;
        v15 = 0;
        p_cache = FMDCompanionRegistryFactory.cache;
        goto LABEL_49;
      }
    }
    v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
  }
  while (v19);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v16;
  p_cache = FMDCompanionRegistryFactory.cache;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v76;
    v25 = &ACErrorKeychainDomain_ptr;
LABEL_18:
    v26 = 0;
    while (1)
    {
      v27 = v24;
      if (*(_QWORD *)v76 != v57)
        objc_enumerationMutation(obj);
      v28 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v26);
      v29 = objc_alloc_init((Class)(p_cache + 318));
      v62 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v28));
      v32 = objc_opt_class(v25[196], v31);
      v64 = v30;
      v65 = v29;
      v63 = v26;
      if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0)
      {
        v34 = objc_opt_class(v25[196], v33);
        v74 = 0;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "processJSON:forCodableType:usingFactory:error:", v30, v34, v9, &v74));
        v36 = v74;
      }
      else
      {
        v37 = objc_opt_class(NSDictionary, v33);
        if ((objc_opt_isKindOfClass(v30, v37) & 1) != 0)
        {
          v39 = v30;
          v40 = objc_msgSend(v9, "classForObjectInfo:", v39);
          v24 = v27;
          if (v40)
          {
            v73 = 0;
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "processJSON:forCodableType:usingFactory:error:", v39, v40, v9, &v73));
            v15 = v73;
          }
          else if (-[FMDJSONDecoder collectionObjectClass](self, "collectionObjectClass"))
          {
            v42 = -[FMDJSONDecoder collectionObjectClass](self, "collectionObjectClass");
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder collectionObjectKeyType](self, "collectionObjectKeyType"));
            v72 = 0;
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder decodeCodableClass:withJSONObject:usingObjectKeyType:error:](self, "decodeCodableClass:withJSONObject:usingObjectKeyType:error:", v42, v39, v43, &v72));
            v15 = v72;

            v25 = &ACErrorKeychainDomain_ptr;
          }
          else
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v59 = v39;
            v56 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
            if (v56)
            {
              v53 = v27;
              v54 = v39;
              v55 = *(_QWORD *)v69;
              v44 = v65;
              while (2)
              {
                for (j = 0; j != v56; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v69 != v55)
                    objc_enumerationMutation(v59);
                  v46 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKey:", v46));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKey:", v46));
                  v50 = objc_opt_class(v48, v49);
                  v67 = 0;
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "processJSON:forCodableType:usingFactory:error:", v47, v50, v9, &v67));
                  v15 = v67;

                  if (v15)
                  {

                    p_cache = (void **)(FMDCompanionRegistryFactory + 16);
                    v24 = v53;
                    v39 = v54;
                    goto LABEL_41;
                  }
                  objc_msgSend(v60, "setObject:forKey:", v51, v46);

                  v44 = v65;
                  v39 = v54;
                }
                v56 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                if (v56)
                  continue;
                break;
              }
              v15 = 0;
              p_cache = (void **)(FMDCompanionRegistryFactory + 16);
              v24 = v53;
LABEL_41:
              v25 = &ACErrorKeychainDomain_ptr;
            }
            else
            {
              v15 = 0;
            }

          }
          v35 = v60;
          if (v15)
          {
LABEL_51:

            v14 = 0;
            goto LABEL_52;
          }
          goto LABEL_45;
        }
        v41 = objc_opt_class(v30, v38);
        v66 = 0;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "processJSON:forCodableType:usingFactory:error:", v30, v41, v9, &v66));
        v36 = v66;
      }
      v15 = v36;
      v24 = v27;
      if (v15)
        goto LABEL_51;
LABEL_45:
      objc_msgSend(v24, "setObject:forKey:", v35, v62);

      v26 = v63 + 1;
      if ((id)(v63 + 1) == v58)
      {
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
        if (v58)
          goto LABEL_18;
        break;
      }
    }
  }

  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v24));
  v15 = 0;
LABEL_52:

LABEL_49:
  objc_msgSend(p_cache + 318, "checkAndSetOutError:WithError:", a5, v15);

  return v14;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 usingFactory:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  FMDJSONDecoder *v13;
  void *v14;
  id v15;
  const __CFString **v16;
  NSErrorUserInfoKey *v17;
  id v19;
  id v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v23 = NSLocalizedFailureReasonErrorKey;
    v24 = CFSTR("Unsupported nil data found");
    v16 = &v24;
    v17 = &v23;
LABEL_7:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, 1));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v11));
    goto LABEL_8;
  }
  if (!-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable))
  {
    v21 = NSLocalizedFailureReasonErrorKey;
    v22 = CFSTR("Unsupported object class.");
    v16 = &v22;
    v17 = &v21;
    goto LABEL_7;
  }
  v20 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 4, &v20));
  v12 = v20;
  if (v12)
  {
LABEL_8:
    v15 = v12;
    v14 = 0;
    goto LABEL_9;
  }
  v13 = objc_alloc_init(FMDJSONDecoder);
  -[FMDJSONDecoder setFactory:](v13, "setFactory:", v10);
  v19 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder processJSON:forCodableType:usingFactory:error:](v13, "processJSON:forCodableType:usingFactory:error:", v11, a3, v10, &v19));
  v15 = v19;

LABEL_9:
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a6, v15);

  return v14;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  id v7;
  FMDCodableFactory *v8;
  void *v9;

  v7 = a4;
  v8 = objc_opt_new(FMDCodableFactory);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDJSONDecoder decodeObjectOfClass:fromData:usingFactory:error:](FMDJSONDecoder, "decodeObjectOfClass:fromData:usingFactory:error:", a3, v7, v8, a5));

  return v9;
}

+ (id)decodeCollectionClass:(Class)a3 fromData:(id)a4 usingObjectKeyType:(id)a5 forObjectClass:(Class)a6 error:(id *)a7
{
  id v11;
  id v12;
  FMDJSONDecoder *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t *v19;
  id v20;
  void *v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v11 = a4;
  v12 = a5;
  if (!-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodableCollection))
  {
    v27 = NSLocalizedFailureReasonErrorKey;
    v28 = CFSTR("Unsupported collection class.");
    v13 = (FMDJSONDecoder *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONDecoderErrorDomain"), 0, v13));
    goto LABEL_6;
  }
  v26 = 0;
  v13 = -[FMDJSONDecoder initWithData:usingCollectionObjectKeyType:andCollectionObjectClass:error:]([FMDJSONDecoder alloc], "initWithData:usingCollectionObjectKeyType:andCollectionObjectClass:error:", v11, v12, a6, &v26);
  v14 = v26;
  if (v14)
  {
LABEL_6:
    v20 = v14;
    v21 = 0;
    goto LABEL_7;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](v13, "container"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder container](v13, "container"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder factory](v13, "factory"));
    v25 = 0;
    v18 = (id *)&v25;
    v19 = &v25;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder stack](v13, "stack"));

    if (!v23)
    {
      v21 = 0;
      v20 = 0;
      goto LABEL_7;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder stack](v13, "stack"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder factory](v13, "factory"));
    v24 = 0;
    v18 = (id *)&v24;
    v19 = &v24;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONDecoder processJSON:forCodableType:usingFactory:error:](v13, "processJSON:forCodableType:usingFactory:error:", v16, a3, v17, v19, v24, v25));
  v20 = *v18;

LABEL_7:
  +[FMDJSONDecoder checkAndSetOutError:WithError:](FMDJSONDecoder, "checkAndSetOutError:WithError:", a7, v20);

  return v21;
}

+ (BOOL)checkAndSetOutError:(id *)a3 WithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  if (v5)
  {
    v6 = sub_10005303C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10022D9A0((uint64_t)v5, v7);

    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }

  return v5 == 0;
}

- (NSSet)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_protocols, a3);
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (NSMutableDictionary)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (FMDDecoderFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (id)jsonObject
{
  return self->_jsonObject;
}

- (void)setJsonObject:(id)a3
{
  objc_storeStrong(&self->_jsonObject, a3);
}

- (Class)collectionObjectClass
{
  return self->_collectionObjectClass;
}

- (void)setCollectionObjectClass:(Class)a3
{
  objc_storeStrong((id *)&self->_collectionObjectClass, a3);
}

- (NSString)collectionObjectKeyType
{
  return self->_collectionObjectKeyType;
}

- (void)setCollectionObjectKeyType:(id)a3
{
  objc_storeStrong((id *)&self->_collectionObjectKeyType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionObjectKeyType, 0);
  objc_storeStrong((id *)&self->_collectionObjectClass, 0);
  objc_storeStrong(&self->_jsonObject, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
}

@end
