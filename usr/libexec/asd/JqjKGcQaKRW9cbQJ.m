@implementation JqjKGcQaKRW9cbQJ

- (JqjKGcQaKRW9cbQJ)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JqjKGcQaKRW9cbQJ;
  return -[JqjKGcQaKRW9cbQJ init](&v3, "init");
}

- (id)WnJ3gJFPRgsreXQi:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  float v13;
  float v14;
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
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, int);
  void *v30;
  NSObject *v31;
  uint64_t *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  _QWORD v45[5];
  _QWORD v46[5];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FnfDbwO2lFcwJMJU sharedInstance](FnfDbwO2lFcwJMJU, "sharedInstance"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "N6iJbZh5ycxf9a3z"));

    v4 = (void *)v6;
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[C7RiKwi0qHUD3RW9 sharedInstance](C7RiKwi0qHUD3RW9, "sharedInstance"));
    v8 = dispatch_group_create();
    v36 = 0;
    objc_msgSend(v7, "A6B42kYrDuXnlUJs:IaS2bByRUGdVAKHz:", (char *)&v36 + 4, &v36);
    v9 = v36;
    dispatch_group_enter(v8);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002112C;
    v33[3] = &unk_1004CE7E0;
    v35 = &v37;
    v10 = v8;
    v34 = v10;
    objc_msgSend(v7, "YMeSiVAJwqHb7P3U:completion:", v4, v33);
    dispatch_group_enter(v10);
    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_100021144;
    v30 = &unk_1004CE7E0;
    v32 = &v41;
    v11 = v10;
    v31 = v11;
    objc_msgSend(v7, "KqWH25SjlYcX4wo6:completion:", v4, &v27);
    v12 = dispatch_time(0, 1800000000);
    if (dispatch_group_wait(v11, v12))
      sub_10002D26C(-32002);

    v13 = (float)SHIDWORD(v9);
    v14 = (float)(int)v9;
  }
  else
  {
    v14 = 0.0;
    v13 = 0.0;
  }
  v45[0] = &off_1004F4C18;
  v15 = objc_msgSend(v4, "length", v27, v28, v29, v30);
  v17 = &off_1004F4C48;
  if (!v15)
    v17 = &off_1004F4C30;
  v46[0] = v17;
  v45[1] = &off_1004F4C60;
  *(float *)&v16 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v46[1] = v18;
  v45[2] = &off_1004F4C78;
  *(float *)&v19 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
  v46[2] = v20;
  v45[3] = &off_1004F4C90;
  LODWORD(v21) = *((_DWORD *)v42 + 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
  v46[3] = v22;
  v45[4] = &off_1004F4CA8;
  LODWORD(v23) = *((_DWORD *)v38 + 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
  v46[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 5));

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

@end
