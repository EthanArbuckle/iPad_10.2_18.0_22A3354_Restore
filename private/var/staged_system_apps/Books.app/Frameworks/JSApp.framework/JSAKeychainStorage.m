@implementation JSAKeychainStorage

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B4A4;
  block[3] = &unk_9E1B8;
  block[4] = a1;
  if (qword_B9F60 != -1)
    dispatch_once(&qword_B9F60, block);
  return (id)qword_B9F68;
}

- (JSAKeychainStorage)init
{
  JSAKeychainStorage *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)JSAKeychainStorage;
  v2 = -[JSAKeychainStorage init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("JSAKeychainStorage.accessQueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (id)getItem:(id)a3
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CFTypeRef result;

  if (a3)
  {
    v3 = sub_B624((uint64_t)self, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v4, "setValue:forKey:", kCFBooleanTrue, kSecReturnData);
    objc_msgSend(v4, "setValue:forKey:", kCFBooleanTrue, kSecReturnAttributes);
    result = 0;
    v5 = 0;
    if (!SecItemCopyMatching((CFDictionaryRef)v4, &result))
    {
      v6 = (void *)result;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "objectForKeyedSubscript:", kSecValueData));
      v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)getItemAsync:(id)a3 :(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  dispatch_block_t v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B784;
  block[3] = &unk_9E208;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(accessQueue, v11);

}

- (void)setItem:(id)a3 :(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  CFTypeRef v10;
  CFStringRef v11;
  void *v12;

  if (a3 && a4)
  {
    v6 = a4;
    v7 = sub_B624((uint64_t)self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));

    v10 = 0;
    if (SecItemCopyMatching((CFDictionaryRef)v8, &v10))
    {
      objc_msgSend(v8, "setValue:forKey:", v9, kSecValueData);
      SecItemAdd((CFDictionaryRef)v8, 0);
    }
    else
    {
      v11 = kSecValueData;
      v12 = v9;
      SecItemUpdate((CFDictionaryRef)v8, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    }

  }
}

- (void)setItemAsync:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_BA64;
  v16[3] = &unk_9E230;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v16);
  dispatch_async(accessQueue, v15);

}

- (void)removeItem:(id)a3
{
  NSMutableDictionary *v3;
  const __CFDictionary *v4;
  CFTypeRef result;

  if (a3)
  {
    v3 = sub_B624((uint64_t)self, a3);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v3);
    result = 0;
    if (!SecItemCopyMatching(v4, &result))
      SecItemDelete(v4);

  }
}

- (void)removeItemAsync:(id)a3 :(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  dispatch_block_t v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BBD8;
  block[3] = &unk_9E208;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(accessQueue, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
