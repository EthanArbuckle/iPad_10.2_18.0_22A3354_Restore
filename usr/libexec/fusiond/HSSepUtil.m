@implementation HSSepUtil

+ (id)sharedSingleton
{
  if (qword_100014C58 != -1)
    dispatch_once(&qword_100014C58, &stru_1000105D8);
  return (id)qword_100014C60;
}

- (HSSepUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSSepUtil;
  return -[HSSepUtil init](&v3, "init");
}

- (int)processSepUtilCommand:(id)a3 response:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CommandData")));
    v8 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && objc_msgSend(v7, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("--restore+art"), CFSTR("-"), 0));
      v7 = v7;
      v34 = 0;
      v10 = +[HSPipeUtil HSPipeUtilExecCommandWithData:options:data:response:error:](HSPipeUtil, "HSPipeUtilExecCommandWithData:options:data:response:error:", CFSTR("/usr/libexec/seputil"), v9, v7, a4, &v34);
      v11 = v34;
      if (v10)
        v12 = 8;
      else
        v12 = 0;
      v13 = v7;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/HSSepUtil/HSSepUtil.m"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid SEP firmware.\n")));
      v12 = 4;
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v17, v18, v19, v20, v21, v22, (uint64_t)v15);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v23, CFSTR("Status"), CFSTR("Invalid SEP firmware."), CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0));

      v11 = 0;
      v13 = 0;
      v9 = 0;
    }
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/HSSepUtil/HSSepUtil.m"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastPathComponent"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Input response dictionary pointer is NULL.")));
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v27, v28, v29, v30, v31, v32, (uint64_t)v26);

    v7 = 0;
    v11 = 0;
    v13 = 0;
    v9 = 0;
    v12 = 8;
  }

  return v12;
}

@end
