@implementation TUITransaction

+ (id)transactionWithOptions:(id)a3
{
  id v3;
  _TUITransactionAutoProxy *v4;
  _TUITransaction *v5;
  _TUITransactionAutoProxy *v6;

  v3 = a3;
  v4 = [_TUITransactionAutoProxy alloc];
  v5 = -[_TUITransaction initWithName:options:]([_TUITransaction alloc], "initWithName:options:", 0, v3);

  v6 = -[_TUITransactionAutoProxy initWithTransaction:](v4, "initWithTransaction:", v5);
  return v6;
}

+ (id)currentOrImplicitTransaction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "threadDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TUITransactionCurrent")));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_msgSend(a1, "implicitTransaction");
  v8 = v7;

  return v8;
}

+ (id)implicitTransaction
{
  _TUITransactionAutoProxy *v2;
  _TUITransaction *v3;
  void *v4;
  _TUITransaction *v5;
  _TUITransactionAutoProxy *v6;

  v2 = [_TUITransactionAutoProxy alloc];
  v3 = [_TUITransaction alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions defaultImplicitOptions](TUITransactionOptions, "defaultImplicitOptions"));
  v5 = -[_TUITransaction initWithName:options:](v3, "initWithName:options:", 0, v4);
  v6 = -[_TUITransactionAutoProxy initWithTransaction:](v2, "initWithTransaction:", v5);

  return v6;
}

+ (id)noAnimationTransaction
{
  _TUITransactionAutoProxy *v2;
  _TUITransaction *v3;
  void *v4;
  _TUITransaction *v5;
  _TUITransactionAutoProxy *v6;

  v2 = [_TUITransactionAutoProxy alloc];
  v3 = [_TUITransaction alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions noAnimationOptions](TUITransactionOptions, "noAnimationOptions"));
  v5 = -[_TUITransaction initWithName:options:](v3, "initWithName:options:", 0, v4);
  v6 = -[_TUITransactionAutoProxy initWithTransaction:](v2, "initWithTransaction:", v5);

  return v6;
}

+ (id)transactionWithName:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  _TUITransactionAutoProxy *v7;
  _TUITransaction *v8;
  _TUITransactionAutoProxy *v9;

  v5 = a4;
  v6 = a3;
  v7 = [_TUITransactionAutoProxy alloc];
  v8 = -[_TUITransaction initWithName:options:]([_TUITransaction alloc], "initWithName:options:", v6, v5);

  v9 = -[_TUITransactionAutoProxy initWithTransaction:](v7, "initWithTransaction:", v8);
  return v9;
}

+ (id)currentOrNewTransactionWithOptions:(id)a3 block:(id)a4
{
  return _objc_msgSend(a1, "_currentOrNewTransactionWithName:options:block:", 0, a3, a4);
}

+ (id)currentOrNewTransactionWithName:(id)a3 options:(id)a4 block:(id)a5
{
  return _objc_msgSend(a1, "_currentOrNewTransactionWithName:options:block:", a3, a4, a5);
}

+ (id)_currentOrNewTransactionWithName:(id)a3 options:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  _TUITransactionAutoProxy *v12;
  _TUITransactionAutoProxy *v13;
  _TUITransaction *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "threadDictionary"));
  v12 = (_TUITransactionAutoProxy *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TUITransactionCurrent")));

  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    v13 = [_TUITransactionAutoProxy alloc];
    v14 = -[_TUITransaction initWithName:options:]([_TUITransaction alloc], "initWithName:options:", v7, v8);
    v12 = -[_TUITransactionAutoProxy initWithTransaction:](v13, "initWithTransaction:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "threadDictionary"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("TUITransactionCurrent"));

    v9[2](v9, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "threadDictionary"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, CFSTR("TUITransactionCurrent"));

  }
  return v12;
}

+ (void)js_transactionWithBlock:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  float v17;
  id v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isObject"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions defaultImplicitOptions](TUITransactionOptions, "defaultImplicitOptions"));
    v9 = objc_opt_class(NSNumber);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("animated")));
    v11 = TUIDynamicCast(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = objc_opt_class(NSNumber);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("duration")));
    v15 = TUIDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v12 && !objc_msgSend(v12, "BOOLValue") || v16 && (objc_msgSend(v16, "floatValue"), v17 == 0.0))
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions noAnimationOptions](TUITransactionOptions, "noAnimationOptions"));
    }
    else
    {
      v18 = objc_msgSend(v8, "mutableCopy");
      if (v12)
      {
        objc_msgSend(v12, "floatValue");
        objc_msgSend(v18, "setAnimate:", v19 != 0.0);
      }
      if (v16)
      {
        objc_msgSend(v16, "floatValue");
        objc_msgSend(v18, "setDuration:", v20);
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "transactionWithOptions:", v18));
    v24 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v23 = objc_msgSend(v6, "callWithArguments:", v22);

    objc_msgSend(v21, "commit");
  }

}

@end
