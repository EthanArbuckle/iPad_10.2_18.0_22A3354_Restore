@implementation M5I7sWv47RO6ptkx

- (M5I7sWv47RO6ptkx)init
{
  M5I7sWv47RO6ptkx *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *UQa7uorw6jeKCE2x;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)M5I7sWv47RO6ptkx;
  v2 = -[M5I7sWv47RO6ptkx init](&v6, "init");
  v3 = dispatch_queue_create("com.apple.asd.statcomputation.emae", 0);
  UQa7uorw6jeKCE2x = v2->UQa7uorw6jeKCE2x;
  v2->UQa7uorw6jeKCE2x = (OS_dispatch_queue *)v3;

  return v2;
}

- (id)WnJ3gJFPRgsreXQi:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  double v16;
  _UNKNOWN **v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  _QWORD v33[5];
  NSObject *v34;
  uint64_t *v35;
  _QWORD v36[5];
  NSObject *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  _QWORD v55[5];
  _QWORD v56[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  if (!objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[j7CSI6j8vNYi4bMa sharedInstance](j7CSI6j8vNYi4bMa, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "email"));

    v5 = (void *)v7;
  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  if (objc_msgSend(v5, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[C7RiKwi0qHUD3RW9 sharedInstance](C7RiKwi0qHUD3RW9, "sharedInstance"));
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000BAD4;
    v36[3] = &unk_1004CE7B8;
    v36[4] = self;
    v38 = &v51;
    v10 = v9;
    v37 = v10;
    objc_msgSend(v8, "E5J0OeRApCYQUXDZ:completion:", v5, v36);
    dispatch_group_enter(v10);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000BB74;
    v33[3] = &unk_1004CE7B8;
    v33[4] = self;
    v35 = &v47;
    v11 = v10;
    v34 = v11;
    objc_msgSend(v8, "U4k02bIWNYQCLSGK:completion:", v5, v33);
    dispatch_group_enter(v11);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000BC14;
    v30[3] = &unk_1004CE7E0;
    v32 = &v39;
    v12 = v11;
    v31 = v12;
    objc_msgSend(v8, "YMeSiVAJwqHb7P3U:completion:", v5, v30);
    dispatch_group_enter(v12);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000BC2C;
    v27[3] = &unk_1004CE7E0;
    v29 = &v43;
    v13 = v12;
    v28 = v13;
    objc_msgSend(v8, "KqWH25SjlYcX4wo6:completion:", v5, v27);
    v14 = dispatch_time(0, 1800000000);
    if (dispatch_group_wait(v13, v14))
      sub_10002D26C(-32006);

  }
  v55[0] = &off_1004F49D8;
  v15 = objc_msgSend(v5, "length");
  v17 = &off_1004F4D78;
  if (!v15)
    v17 = &off_1004F4D68;
  v56[0] = v17;
  v55[1] = &off_1004F49F0;
  LODWORD(v16) = *((_DWORD *)v52 + 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v56[1] = v18;
  v55[2] = &off_1004F4A08;
  LODWORD(v19) = *((_DWORD *)v48 + 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
  v56[2] = v20;
  v55[3] = &off_1004F4A20;
  LODWORD(v21) = *((_DWORD *)v44 + 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
  v56[3] = v22;
  v55[4] = &off_1004F4A38;
  LODWORD(v23) = *((_DWORD *)v40 + 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
  v56[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 5));

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->UQa7uorw6jeKCE2x, 0);
}

@end
