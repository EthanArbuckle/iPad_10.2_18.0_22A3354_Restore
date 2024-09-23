@implementation NSKeyedArchiver

+ (id)archiveObjectToData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", v3, NSKeyedArchiveRootObjectKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  NSLog(CFSTR("Successfully archived Object : %@"), v6);
  NSLog(CFSTR("%s: Data length : %lu"), "+[NSKeyedArchiver(XPC) archiveObjectToData:]", objc_msgSend(v5, "length"));

  return v5;
}

+ (id)archiveObjectToDict:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archiveObjectToData:](NSKeyedArchiver, "archiveObjectToData:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &off_100011F60, CFSTR("Version"), v3, CFSTR("SerializedObject"), 0));

  return v4;
}

+ (id)archiveObject:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v3, NSKeyedArchiveRootObjectKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encodedData"));
  xpc_dictionary_set_uint64(v4, "Version", 1uLL);
  v7 = objc_retainAutorelease(v6);
  xpc_dictionary_set_data(v4, "SerializedObject", objc_msgSend(v7, "bytes"), (size_t)objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  NSLog(CFSTR("Successfully archived Object : %@"), v8);
  NSLog(CFSTR("%s: Data length : %lu"), "+[NSKeyedArchiver(XPC) archiveObject:]", objc_msgSend(v7, "length"));

  return v4;
}

+ (void)archiveObject:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v10, "encodeObject:forKey:", v6, NSKeyedArchiveRootObjectKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encodedData"));
  xpc_dictionary_set_uint64(v5, "Version", 1uLL);
  v8 = objc_retainAutorelease(v7);
  xpc_dictionary_set_data(v5, "SerializedObject", objc_msgSend(v8, "bytes"), (size_t)objc_msgSend(v8, "length"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  NSLog(CFSTR("Successfully archived Object : %@"), v9);

  NSLog(CFSTR("%s: Data length : %lu"), "+[NSKeyedArchiver(XPC) archiveObject:to:]", objc_msgSend(v8, "length"));
}

@end
