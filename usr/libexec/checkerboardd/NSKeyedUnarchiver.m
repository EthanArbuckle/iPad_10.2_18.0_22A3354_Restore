@implementation NSKeyedUnarchiver

+ (void)unarchiveObjectFromXPCObject:(id)a3 allowedClasses:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  Block_layout *v10;
  Block_layout *v11;
  uint64_t uint64;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = (Block_layout *)a5;
  if (v10)
    v11 = v10;
  else
    v11 = &stru_10000C440;
  uint64 = xpc_dictionary_get_uint64(v8, "Version");
  if (uint64 == 1)
  {
    objc_msgSend(a1, "_unarchiveObjectFromVersion1XPCObject:allowedClasses:completion:", v8, v9, v11);
  }
  else
  {
    v13 = uint64;
    v14 = CheckerBoardLogHandleForCategory(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100007214(v13, v15, v16, v17, v18, v19, v20, v21);

    v11->invoke(v11, 0);
  }

}

+ (void)_unarchiveObjectFromVersion1XPCObject:(id)a3 allowedClasses:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  const void *data;
  void *v12;
  id v13;
  void *v14;
  size_t length;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (objc_msgSend(a1, "_magicIsValidOnVersion1XPCObject:", v8))
  {
    length = 0;
    data = xpc_dictionary_get_data(v8, "Data", &length);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length));
    v13 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v12, 0);
    objc_msgSend(v13, "setRequiresSecureCoding:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v9, NSKeyedArchiveRootObjectKey));

  }
  else
  {
    v14 = 0;
  }
  v10[2](v10, v14);

}

+ (BOOL)_magicIsValidOnVersion1XPCObject:(id)a3
{
  const char *string;
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[16];

  string = xpc_dictionary_get_string(a3, "Magic");
  v4 = (uint64_t)string;
  if (string)
  {
    if (!strncmp(string, "CBCo", 5uLL))
      return 1;
  }
  else
  {
    v6 = CheckerBoardLogHandleForCategory(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Magic missing while decoding message", v16, 2u);
    }

  }
  v8 = CheckerBoardLogHandleForCategory(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10000727C(v4, v9, v10, v11, v12, v13, v14, v15);

  return 0;
}

@end
