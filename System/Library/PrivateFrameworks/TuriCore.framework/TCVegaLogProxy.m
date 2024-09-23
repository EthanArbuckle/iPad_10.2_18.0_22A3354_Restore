@implementation TCVegaLogProxy

+ (id)wrap:(id)a3
{
  id v3;
  TCVegaLogProxyHandler *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(TCVegaLogProxyHandler);
  +[TCVegaLogProxy wrap:withHandler:](TCVegaLogProxy, "wrap:withHandler:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)wrapObject:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDDA730];
  v4 = (void *)MEMORY[0x24BDDA720];
  v5 = a3;
  objc_msgSend(v4, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithObject:inContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[TCVegaLogProxy wrap:](TCVegaLogProxy, "wrap:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)wrap:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("__tmp_instance"));

  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("__tmp_handler"));

  objc_msgSend(v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "evaluateScript:", CFSTR("new Proxy(__tmp_instance, __tmp_handler);"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("__tmp_proxy"));

  objc_msgSend(v6, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "evaluateScript:", CFSTR("Object.defineProperty(__tmp_proxy, '__LogProxy_wrapped', {  enumerable: true,  value: __tmp_instance,});"));

  objc_msgSend(v6, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("__tmp_proxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)tryUnwrap:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v3, "hasProperty:", CFSTR("__LogProxy_wrapped")))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__LogProxy_wrapped"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (id)unwrap:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasProperty:", CFSTR("__LogProxy_wrapped")))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__LogProxy_wrapped"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
