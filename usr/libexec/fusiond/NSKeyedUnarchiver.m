@implementation NSKeyedUnarchiver

+ (id)unarchiveDataToObject:(id)a3 allowedClasses:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;

  v5 = a4;
  v6 = a3;
  NSLog(CFSTR("%s: Data length : %lu"), "+[NSKeyedUnarchiver(XPC) unarchiveDataToObject:allowedClasses:]", objc_msgSend(v6, "length"));
  v10 = 0;
  v7 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v6, &v10);

  if (!v7)
    NSLog(CFSTR("NSKeyedUnarchiver object - nil"));
  objc_msgSend(v7, "setDecodingFailurePolicy:", 0);
  NSLog(CFSTR("Allowed Classes : %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v5, NSKeyedArchiveRootObjectKey));

  if (v8)
    NSLog(CFSTR("%s: Successfully Unarchived Object"), "+[NSKeyedUnarchiver(XPC) unarchiveDataToObject:allowedClasses:]");
  else
    NSLog(CFSTR("%s: Failed to Unarchived Object"), "+[NSKeyedUnarchiver(XPC) unarchiveDataToObject:allowedClasses:]");

  return v8;
}

+ (id)_unarchiveObjectFromVersion1XPCObject:(id)a3 allowedClasses:(id)a4
{
  id v5;
  const void *data;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  size_t length;

  length = 0;
  v5 = a4;
  data = xpc_dictionary_get_data(a3, "SerializedObject", &length);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length));
  NSLog(CFSTR("%s: Data length : %lu"), "+[NSKeyedUnarchiver(XPC) _unarchiveObjectFromVersion1XPCObject:allowedClasses:]", objc_msgSend(v7, "length"));
  v12 = 0;
  v8 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v7, &v12);
  v9 = v12;
  NSLog(CFSTR("archiveError :%@"), v9);
  NSLog(CFSTR("%s: Successfully Unarchived Object"), "+[NSKeyedUnarchiver(XPC) _unarchiveObjectFromVersion1XPCObject:allowedClasses:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v5, NSKeyedArchiveRootObjectKey));

  if (!v10)
    NSLog(CFSTR("Unable to unarchive data: %@"), v9);

  return v10;
}

+ (id)unarchiveXPCObject:(id)a3 allowedClasses:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  void *v9;

  v6 = a3;
  v7 = a4;
  uint64 = xpc_dictionary_get_uint64(v6, "Version");
  NSLog(CFSTR("Version : %llu"), uint64);
  if (uint64 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_unarchiveObjectFromVersion1XPCObject:allowedClasses:", v6, v7));
  }
  else
  {
    NSLog(CFSTR("%s: Unhandled Version: Error"), "+[NSKeyedUnarchiver(XPC) unarchiveXPCObject:allowedClasses:]");
    v9 = 0;
  }

  return v9;
}

@end
