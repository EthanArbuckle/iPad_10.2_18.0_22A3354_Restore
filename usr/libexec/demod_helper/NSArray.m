@implementation NSArray

+ (NSArray)arrayWithXPCArray:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithXPCArray:", v3);

  return (NSArray *)v4;
}

- (NSArray)initWithXPCArray:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  NSObject *v7;
  NSArray *v8;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  NSArray *v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = sub_10000344C;
  v17[3] = sub_10000345C;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100003464;
  v13 = &unk_100048B98;
  v15 = &v16;
  v5 = self;
  v14 = v5;
  if (xpc_array_apply(v4, &v10))
  {
    v6 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100028260((uint64_t)v17, v7);

    v5 = -[NSArray initWithArray:](v5, "initWithArray:", *(_QWORD *)(v17[0] + 40), v10, v11, v12, v13);
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)xpcArrayFromArray
{
  xpc_object_t v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000037FC;
  v6[3] = &unk_100048BC0;
  v3 = xpc_array_create(0, 0);
  v7 = v3;
  v8 = &v9;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  if (*((_BYTE *)v10 + 24))
    v4 = v3;
  else
    v4 = 0;

  _Block_object_dispose(&v9, 8);
  return v4;
}

@end
