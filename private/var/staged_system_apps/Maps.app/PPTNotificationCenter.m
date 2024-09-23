@implementation PPTNotificationCenter

+ (void)postNotificationIfNeededWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a1, "isEnabled"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", v11, v8, v9);

  }
}

+ (void)addOnceObserverForName:(id)a3 object:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a1, "isEnabled");
  if (v10 && v11)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1003ECE84;
    v23 = sub_1003ECE94;
    v24 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1003ECE9C;
    v16[3] = &unk_1011B4A30;
    v18 = &v19;
    v17 = v10;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v8, v9, v13, v16));
    v15 = (void *)v20[5];
    v20[5] = v14;

    _Block_object_dispose(&v19, 8);
  }

}

+ (BOOL)isEnabled
{
  return byte_1014D23C0;
}

+ (void)setEnabled:(BOOL)a3
{
  byte_1014D23C0 = a3;
}

@end
