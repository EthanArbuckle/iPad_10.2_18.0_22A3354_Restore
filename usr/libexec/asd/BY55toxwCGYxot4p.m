@implementation BY55toxwCGYxot4p

- (BY55toxwCGYxot4p)init
{
  BY55toxwCGYxot4p *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *UQa7uorw6jeKCE2x;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BY55toxwCGYxot4p;
  v2 = -[BY55toxwCGYxot4p init](&v6, "init");
  v3 = dispatch_queue_create("com.apple.asd.ca.stcq.nae", 0);
  UQa7uorw6jeKCE2x = v2->UQa7uorw6jeKCE2x;
  v2->UQa7uorw6jeKCE2x = (OS_dispatch_queue *)v3;

  return v2;
}

- (id)WnJ3gJFPRgsreXQi:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (!v4)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstName"));
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastName"));
    if (!v6)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullName"));

      if (v16)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1004F4D20, &off_1004F4D38);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1004F4D20, &off_1004F4D50);
      goto LABEL_10;
    }
  }

LABEL_5:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[C7RiKwi0qHUD3RW9 sharedInstance](C7RiKwi0qHUD3RW9, "sharedInstance"));
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100031538;
  v21[3] = &unk_1004CF478;
  v21[4] = self;
  v9 = v5;
  v22 = v9;
  v10 = v8;
  v23 = v10;
  objc_msgSend(v7, "SKiIwgejuzELNOY0:completion:", v4, v21);
  dispatch_group_enter(v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100031620;
  v18[3] = &unk_1004CF478;
  v18[4] = self;
  v11 = v9;
  v19 = v11;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v7, "b8mzIZQ1GCTnhVAP:completion:", v4, v18);
  v13 = dispatch_time(0, 1800000000);
  if (dispatch_group_wait(v12, v13))
    sub_10002D26C(-32001);
  v14 = v20;
  v15 = v11;

LABEL_10:
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->UQa7uorw6jeKCE2x, 0);
}

@end
