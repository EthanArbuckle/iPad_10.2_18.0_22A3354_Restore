@implementation ft9cupR7u6OrU4m1pyhB

+ (unint64_t)dataChunkSize
{
  return 0x8000;
}

+ (id)pK0gFZ9QOdm17E9p9cpP:(id)a3 sinfData:(id)a4 refetch:(BOOL *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:contextManager:sinfData:refetch:error:](ft9cupR7u6OrU4m1pyhB, "pK0gFZ9QOdm17E9p9cpP:contextManager:sinfData:refetch:error:", v9, +[ft9cupR7u6OrU4m1pyhB contextManager](ft9cupR7u6OrU4m1pyhB, "contextManager"), v10, a5, a6));

  return v11;
}

+ (id)pK0gFZ9QOdm17E9p9cpP:(id)a3 contextManager:(tpZFqotcPt *)a4 sinfData:(id)a5 refetch:(BOOL *)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  bb74bdd798ceadff5c1f0c2b *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  id v22;
  unsigned int v23;
  uint64_t v24;
  id v25;
  _BOOL4 v26;
  uint64_t v28;
  void *v29;
  id v31;
  id v32;
  unsigned int v33;
  id v34;
  int v35;

  v11 = a3;
  v12 = a5;
  v13 = objc_msgSend(objc_alloc((Class)NSInputStream), "initWithFileAtPath:", v11);
  v14 = v13;
  if (!v13)
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_41;
  }
  objc_msgSend(v13, "open");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "streamError"));
  if (v15)
  {
    v16 = 0;
    v17 = 1;
LABEL_36:
    objc_msgSend(v14, "close");

    goto LABEL_37;
  }
  v34 = 0;
  v18 = sub_1D87BC((uint64_t)a4, (uint64_t)v12, &v34);
  v19 = (bb74bdd798ceadff5c1f0c2b *)v34;
  v35 = v18;
  if (!(_DWORD)v18)
  {
    if (a6)
      *a6 = 0;
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0x8000)));
    v20 = (unsigned __int8 *)objc_msgSend(v32, "mutableBytes");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0x8000)));
    v21 = (unsigned __int8 *)objc_msgSend(v31, "mutableBytes");
    v22 = objc_msgSend(v14, "read:maxLength:", v20, 0x8000);
    v23 = v22;
    if ((uint64_t)v22 <= 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "streamError"));
      v16 = 0;
    }
    else
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0));
      if (v16)
      {
        while (1)
        {
          v33 = 0x8000;
          v24 = tpZFqotcPt::E7CI7xMRxnQE2nWg(a4, v19, v20, v23, v21, &v33, &v35);
          if (v35)
            break;
          objc_msgSend(v16, "appendBytes:length:", v24, v33);
          v25 = objc_msgSend(v14, "read:maxLength:", v20, 0x8000);
          v23 = v25;
          if ((uint64_t)v25 <= 0)
          {
            v15 = 0;
            v17 = 0;
            goto LABEL_34;
          }
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay")));
        v17 = 1;
        goto LABEL_34;
      }
      v15 = 0;
    }
    v17 = 1;
LABEL_34:

    goto LABEL_35;
  }
  if ((_DWORD)v18 == -42004)
    NSLog(CFSTR("[*] Fairplay error: kDRMInvalidUserError. Are you pointed to the right iTMS store? Signed in?"));
  else
    NSLog(CFSTR("[*] Fairplay error = %d"), v18);
  v26 = !tpZFqotcPt::Tb38ee2B31aD5Debb1q(a4, v35);
  if (!a6)
    LOBYTE(v26) = 1;
  if (!v26)
    *a6 = 1;
  if (a7)
  {
    if (v35 >> 1 == 2147462350 || v35 == -42597)
      v28 = -996;
    else
      v28 = v35;
    v15 = 0;
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), v28, 0));
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  v17 = 1;
LABEL_35:

  if (v14)
    goto LABEL_36;
LABEL_37:
  if (a7 && v15)
    *a7 = objc_retainAutorelease(v15);
  if (!v17)
  {
    v16 = v16;
    v29 = v16;
    goto LABEL_43;
  }
LABEL_41:
  v29 = 0;
LABEL_43:

  return v29;
}

+ (id)y7OOpRt0C6jKsWDCTuNz:(id)a3
{
  id v3;
  tpZFqotcPt *v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = +[ft9cupR7u6OrU4m1pyhB contextManager](ft9cupR7u6OrU4m1pyhB, "contextManager");
    v5 = objc_retainAutorelease(v3);
    tpZFqotcPt::aee6eb53ad09b5623faf(v4, (unsigned __int8 *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
    if (!v6)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v6, 0));
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), -997, 0));
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

+ (void)_8g0aKpBRl5gIBvODdOy7:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  tpZFqotcPt *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = +[ft9cupR7u6OrU4m1pyhB contextManager](ft9cupR7u6OrU4m1pyhB, "contextManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v8));
  v10 = v9;
  if (!v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), -998, 0));
    if (!v6)
      goto LABEL_10;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKeyPath:", CFSTR("accountInfo.DSPersonID")));

  if (v12)
  {
    v13 = objc_msgSend(v12, "unsignedLongLongValue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1D73D4;
    v15[3] = &unk_3882A8;
    v17 = v6;
    v16 = v5;
    tpZFqotcPt::A31bo2we343KEA87KF2((uint64_t)v7, (uint64_t)v13, v15);

    v14 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), -998, 0));
  }

  if (v6)
  {
LABEL_8:
    if (v14)
      (*((void (**)(id, id, void *))v6 + 2))(v6, v5, v14);
  }
LABEL_10:

}

+ (void)Xj3eVHDeBoTD6fVn6fY8:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  tpZFqotcPt *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = +[ft9cupR7u6OrU4m1pyhB contextManager](ft9cupR7u6OrU4m1pyhB, "contextManager");
  if (v5)
  {
    v8 = (uint64_t)v7;
    v9 = objc_msgSend(v5, "unsignedLongLongValue");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1D7564;
    v12[3] = &unk_3882D0;
    v13 = v6;
    tpZFqotcPt::A31bo2we343KEA87KF2(v8, (uint64_t)v9, v12);

    v10 = 0;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), -998, 0));
    v10 = (void *)v11;
    if (v6 && v11)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, v11);
  }

}

+ (void)FVnIWgVXBigm3P6nj4U9:(id)a3
{
  id v3;
  tpZFqotcPt *v4;
  tpZFqotcPt *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  bb74bdd798ceadff5c1f0c2b *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = +[ft9cupR7u6OrU4m1pyhB contextManager](ft9cupR7u6OrU4m1pyhB, "contextManager");
  v5 = v4;
  if (v4)
  {
    if (v3)
    {
      v6 = objc_autoreleasePoolPush();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v7);
            v11 = tpZFqotcPt::TA87KF2B31bo2we343K(v5, *(const __CFData **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10));
            v12 = (bb74bdd798ceadff5c1f0c2b *)objc_claimAutoreleasedReturnValue(v11);
            if (v12)
              tpZFqotcPt::RTvM5X_G7QMNC67UE(v5, v12);

            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

      objc_autoreleasePoolPop(v6);
    }
    else
    {
      tpZFqotcPt::p30R9pAOR831587jnjy(v4);
    }
  }

}

+ (id)MNeITI0WyvXBxnLLXXWr:(id)a3
{
  id v3;
  cJgRjzCmkoWxanXPuQh4 *v4;

  v3 = a3;
  v4 = -[cJgRjzCmkoWxanXPuQh4 initWithSinfData:]([cJgRjzCmkoWxanXPuQh4 alloc], "initWithSinfData:", v3);

  return v4;
}

+ (unint64_t)d32lDu5WFQOV5kTab38V
{
  return 0;
}

+ (tpZFqotcPt)contextManager
{
  if (qword_3CEE98 != -1)
    dispatch_once(&qword_3CEE98, &stru_3882F0);
  return (tpZFqotcPt *)qword_3CEE90;
}

+ (void)prewarm
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(-2, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1D78BC;
  block[3] = &unk_377C50;
  block[4] = a1;
  dispatch_async(v4, block);

}

@end
