@implementation NSDictionary

- (id)ic_prettyDescriptionWithTabLevel:(unint64_t)a3
{
  id v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void **v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *, void *);
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;

  v5 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v5, "appendString:", CFSTR("{\n"));
  if (a3)
  {
    v6 = &stru_1007FE210;
    v7 = a3;
    do
    {
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("\t")));

      v6 = v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = &stru_1007FE210;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("\t")));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10001D344;
  v18 = &unk_1007D7998;
  v10 = v5;
  v19 = v10;
  v20 = v9;
  v21 = a3;
  v11 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", &v15);
  objc_msgSend(v10, "appendFormat:", CFSTR("%@}"), v8, v15, v16, v17, v18);
  v12 = v20;
  v13 = v10;

  return v13;
}

- (id)jsonify
{
  NSDictionary *v2;
  id v3;

  v2 = self;
  v3 = sub_1003A553C();

  return v3;
}

@end
