@implementation GKBulletinMonogramRenderer

+ (void)monogramImageForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64x2_t v16;
  uint64_t v17;
  unint64_t v18;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":")));
  if (objc_msgSend(v6, "count") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
    v9 = (unint64_t)objc_msgSend(v8, "integerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PRMonogramColor availableColors](PRMonogramColor, "availableColors"));
    v11 = v9 % (unint64_t)objc_msgSend(v10, "count");

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10015E708;
    v13[3] = &unk_1002C51F0;
    v16 = vdupq_n_s64(0x4060000000000000uLL);
    v17 = 0x4008000000000000;
    v18 = v11;
    v14 = v7;
    v15 = v5;
    v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

@end
