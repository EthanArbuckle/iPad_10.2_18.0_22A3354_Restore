@implementation NSDate

+ (void)load
{
  _QWORD v2[6];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000323C;
  v2[3] = &unk_100004118;
  v2[4] = a1;
  v2[5] = a2;
  if (qword_100008078 != -1)
    dispatch_once(&qword_100008078, v2);
}

- (id)tri_memoryFriendlyDescriptionWithLocale:(id)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  double v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  tm v15;
  time_t v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  char v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000034B4;
  v17[3] = &unk_100004140;
  v17[4] = self;
  v5 = a3;
  v18 = v5;
  v19 = a2;
  v6 = objc_retainBlock(v17);
  if (v5)
    goto LABEL_2;
  -[NSDate timeIntervalSince1970](self, "timeIntervalSince1970");
  v16 = (uint64_t)v10;
  memset(&v15, 0, sizeof(v15));
  if (!gmtime_r(&v16, &v15))
    goto LABEL_2;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)v20 = 0u;
  v21 = 0u;
  if (strftime(v20, 0x100uLL, "%Y-%m-%d %H:%M:%S +0000", &v15))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v20);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v14 = ((uint64_t (*)(_QWORD *))v6[2])(v6);
      v13 = (id)objc_claimAutoreleasedReturnValue(v14);
    }
    v8 = v13;

  }
  else
  {
LABEL_2:
    v7 = ((uint64_t (*)(_QWORD *))v6[2])(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v8;
}

@end
