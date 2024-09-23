@implementation MTApnsDictionaryProcessor

- (MTApnsDictionaryProcessor)initWithDictionary:(id)a3
{
  id v3;
  MTApnsDictionaryProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTApnsDictionaryProcessor;
  v3 = a3;
  v4 = -[MTApnsDictionaryProcessor init](&v6, "init");
  -[MTApnsDictionaryProcessor setDictionary:](v4, "setDictionary:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  return CFSTR("0");
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isKindOfClass;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  int v18;
  id v19;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTApnsDictionaryProcessor dictionary](self, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (!v8)
  {
    v16 = _MTLogCategoryCloudSync(v9);
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v6;
      v15 = "Processor was asked for key %@ that's missing from the provided dictionary!";
      goto LABEL_9;
    }
LABEL_10:

    v12 = 0;
    goto LABEL_11;
  }
  v10 = objc_opt_class(NSObject);
  isKindOfClass = objc_opt_isKindOfClass(v8, v10);
  if ((isKindOfClass & 1) == 0
    || (isKindOfClass = (uint64_t)objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___NSCoding),
        (isKindOfClass & 1) == 0))
  {
    v13 = _MTLogCategoryCloudSync(isKindOfClass);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v6;
      v15 = "Processor was asked for value for key %@ that doesn't conform to NSCoding!";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));
LABEL_11:

  return v12;
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
