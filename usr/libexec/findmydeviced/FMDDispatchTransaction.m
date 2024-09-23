@implementation FMDDispatchTransaction

+ (void)dispatchTransactionAsync:(id)a3 transactionName:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend((id)objc_opt_class(a1, v11), "transactionName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v14, "beginTransaction:", v13);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BDD5C;
  v17[3] = &unk_1002C16D8;
  v18 = v13;
  v19 = v8;
  v15 = v13;
  v16 = v8;
  dispatch_async(v10, v17);

}

+ (void)dispatchTransactionSync:(id)a3 transactionName:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend((id)objc_opt_class(a1, v11), "transactionName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v14, "beginTransaction:", v13);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDEA8;
  block[3] = &unk_1002C16D8;
  v18 = v13;
  v19 = v8;
  v15 = v13;
  v16 = v8;
  dispatch_sync(v10, block);

}

+ (id)transactionName:(id)a3
{
  return a3;
}

@end
