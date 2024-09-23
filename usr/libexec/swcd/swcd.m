void sub_100002288(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100002450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10000272C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

uint64_t sub_1000027A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

__CFString *sub_1000027F4(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if ((_DWORD)a1)
  {
    if ((_DWORD)a1 == 1)
    {
      v1 = CFSTR(".wk");
    }
    else
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", a1));
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

    }
  }
  else
  {
    v1 = CFSTR("cdn");
  }
  return v1;
}

void sub_10000285C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000297C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002A3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100002A4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateTaskStatesUsingBlock:", &stru_100030798);
}

void sub_100002A5C(id a1, SWCDownloadTaskState *a2, BOOL *a3)
{
  -[SWCDownloadTaskState receiveSIGTERMSignal](a2, "receiveSIGTERMSignal", a3);
}

void sub_100002AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100002BF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100002CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100002DB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100002E98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100002EA8(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100002F28;
  v2[3] = &unk_1000307E8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_enumerateTaskStatesUsingBlock:", v2);

}

void sub_100002F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_100002F28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));

  objc_msgSend(v3, "downloadRoute");
  objc_msgSend(v3, "isDiscretionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "task"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateScheduled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buffer"));
  objc_msgSend(v4, "length");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100003014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  void *v9;
  void *v10;

  sub_100003038(&a9);
  _Unwind_Resume(a1);
}

id *sub_100003038(id *a1)
{

  return a1;
}

void sub_100003530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_1000038CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v7;

  _Unwind_Resume(a1);
}

void sub_1000041FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1000043F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100004700(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v5;

  _Unwind_Resume(a1);
}

void sub_10000495C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100004CBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100004D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100004E4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100004EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100004FA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000513C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000053D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005410(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005420(uint64_t a1)
{

}

void sub_100005428(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v7 = *(unsigned __int8 *)(a1 + 48);
  if (v7 == objc_msgSend(v8, "downloadRoute")
    && objc_msgSend(*(id *)(a1 + 32), "isEqual:", v6))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void sub_1000054C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100005650(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000568C(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SWCDownloadTaskState *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  _BYTE v41[128];
  _QWORD v42[3];
  _QWORD v43[3];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "underlyingQueue"));
  dispatch_assert_queue_V2(v2);

  if ((objc_msgSend(*(id *)(a1 + 40), "isValid") & 1) == 0)
  {
    if (qword_1000371B0 != -1)
      dispatch_once(&qword_1000371B0, &stru_100030918);
    v8 = qword_1000371A8;
    if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Domain %@ is invalid. Will not attempt a download.", buf, 0xCu);
    }
    v10 = objc_alloc((Class)NSError);
    v43[0] = &off_100032798;
    v42[0] = CFSTR("Line");
    v42[1] = CFSTR("Function");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader(Private) _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:]_block_invoke"));
    v43[1] = v11;
    v42[2] = CFSTR("Domain");
    v43[2] = *(_QWORD *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));
    v3 = objc_msgSend(v10, "initWithDomain:code:userInfo:", _SWCErrorDomain, 8, v12);

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v7 = (void *)v13;
    if (v13 && (objc_opt_respondsToSelector(v13, "downloader:failedToDownloadAASAFileFromDomain:error:") & 1) != 0)
      objc_msgSend(v7, "downloader:failedToDownloadAASAFileFromDomain:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = (SWCDownloadTaskState *)*(id *)(a1 + 48);
    v15 = -[SWCDownloadTaskState countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v14);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i) + 16))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
        }
        v15 = -[SWCDownloadTaskState countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v15);
    }
    goto LABEL_51;
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_taskStateForDomain:downloadRoute:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80)));
  if (!v3)
  {
    if (*(_QWORD *)(a1 + 56) && !*(_BYTE *)(a1 + 80))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCDomain appleDomain](_SWCDomain, "appleDomain"));
      if ((objc_msgSend(v18, "encompassesDomain:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
        v20 = objc_msgSend(v19, "isAppleInternal");

        if (v20 && !arc4random_uniform(0x64u))
        {
          if (qword_1000371B0 != -1)
            dispatch_once(&qword_1000371B0, &stru_100030918);
          v21 = qword_1000371A8;
          if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_FAULT))
          {
            v22 = *(_QWORD *)(a1 + 56);
            v23 = *(const __CFString **)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v38 = v22;
            v39 = 2112;
            v40 = v23;
            _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Application %@ is attempting to download AASA data from %@ over the public Internet (via an Apple-controlled CDN.) Doing so may leak information about unannounced apps or features. This application must be updated. Please file a bug report against this application.", buf, 0x16u);
          }
        }
      }
      else
      {

      }
    }
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v7 = (void *)v24;
    if (v24 && (objc_opt_respondsToSelector(v24, "downloader:willDownloadAASAFileFromDomain:") & 1) != 0)
      objc_msgSend(v7, "downloader:willDownloadAASAFileFromDomain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v14 = -[SWCDownloadTaskState initWithDownloader:domain:downloadRoute:]([SWCDownloadTaskState alloc], "initWithDownloader:domain:downloadRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));
    if (!v14)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("SWCDownloader.mm"), 571, CFSTR("Failed to create download state object"));

    }
    if (*(_QWORD *)(a1 + 48))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState completionHandlers](v14, "completionHandlers"));
      objc_msgSend(v25, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));

    }
    if (*(_BYTE *)(a1 + 81))
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v26 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v38 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Downloading discretionary data for domain %@", buf, 0xCu);
      }
      v28 = *(_BYTE *)(a1 + 81) != 0;
    }
    else
    {
      v28 = 0;
    }
    -[SWCDownloadTaskState setDiscretionary:](v14, "setDiscretionary:", v28);
    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState taskDescription](v14, "taskDescription"));
    objc_msgSend(v29, "setObject:forKey:", v14, v30);

    objc_msgSend(*(id *)(a1 + 32), "_resumePendingTasks");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SWCAnalyticsLogger sharedLogger](SWCAnalyticsLogger, "sharedLogger"));
    objc_msgSend(v31, "logAASAFileDownloadEventWithDomain:route:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));

    v3 = 0;
LABEL_51:

    goto LABEL_52;
  }
  if (qword_1000371B0 != -1)
    dispatch_once(&qword_1000371B0, &stru_100030918);
  v4 = qword_1000371A8;
  if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = CFSTR("discretionary");
    if (!*(_BYTE *)(a1 + 81))
      v6 = CFSTR("non-discretionary");
    *(_DWORD *)buf = 138412546;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already downloading data for domain %@, so skipping a second download (%@)", buf, 0x16u);
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionHandlers"));
    objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
LABEL_52:

  }
}

void sub_100005CA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100006090(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_100006144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

void sub_100006298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000064E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;
  void *v32;
  void *v33;

  _Block_object_dispose(&a31, 8);
  sub_100007244(v31);
  _Unwind_Resume(a1);
}

uint64_t sub_100006548(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = a2[6];
  a2[6] = 0;
  *(_QWORD *)(result + 48) = v2;
  *(_QWORD *)(result + 56) = a2[7];
  a2[7] = 0;
  v5 = a2[8];
  v3 = a2 + 8;
  v4 = v5;
  *(_QWORD *)(result + 64) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 56);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 64;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t sub_1000065B8(uint64_t a1)
{
  return sub_100007244(a1 + 48);
}

void sub_1000065C0(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  id v5;
  unsigned __int8 v6;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "task"));

  if (v3)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_sessionIDForTaskState:", v5);
    v4 = sub_10000728C((float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v6, &v6);
    ++v4[3];
  }

}

void sub_100006638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_100006650(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD *v5;
  unint64_t v6;
  id v7;
  char v8;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "task"));

  if (!v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_sessionIDForTaskState:", v7);
    v8 = (char)v4;
    v5 = sub_10000728C((float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), v4, &v8);
    v6 = v5[3];
    if (v6 < (unint64_t)objc_msgSend(*(id *)(a1 + 32), "_maximumActiveTaskCountForSessionID:", v4))
    {
      ++v5[3];
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }
  }

}

void sub_1000066FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_1000068C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100006C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100007154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100007214(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "dl");
  v2 = (void *)qword_1000371A8;
  qword_1000371A8 = (uint64_t)v1;

}

uint64_t sub_100007244(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

_QWORD *sub_10000728C(float *a1, unsigned __int8 a2, _BYTE *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  int8x8_t prime;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  uint8x8_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v33;

  v6 = a2;
  v7 = *((_QWORD *)a1 + 1);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2;
      if (v7 <= a2)
        v3 = a2 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & a2;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == a2)
          {
            if (*((unsigned __int8 *)v10 + 16) == a2)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_BYTE *)v10 + 16) = *a3;
  v10[3] = 0;
  v12 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v13 = a1[8];
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      prime = (int8x8_t)v16;
    else
      prime = (int8x8_t)v15;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v7 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v7)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v7)
    {
      v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        v24 = std::__next_prime(v24);
      }
      else
      {
        v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2)
          v24 = v26;
      }
      if (*(_QWORD *)&prime <= v24)
        prime = (int8x8_t)v24;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            sub_10000767C();
          v18 = operator new(8 * *(_QWORD *)&prime);
          v19 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v18;
          if (v19)
            operator delete(v19);
          v20 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v20++) = 0;
          while (*(_QWORD *)&prime != v20);
          v21 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v21)
          {
            v22 = v21[1];
            v23 = (uint8x8_t)vcnt_s8(prime);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              if (v22 >= *(_QWORD *)&prime)
                v22 %= *(_QWORD *)&prime;
            }
            else
            {
              v22 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = a1 + 4;
            v27 = (_QWORD *)*v21;
            if (*v21)
            {
              do
              {
                v28 = v27[1];
                if (v23.u32[0] > 1uLL)
                {
                  if (v28 >= *(_QWORD *)&prime)
                    v28 %= *(_QWORD *)&prime;
                }
                else
                {
                  v28 &= *(_QWORD *)&prime - 1;
                }
                if (v28 != v22)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v28))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v21;
                    goto LABEL_55;
                  }
                  *v21 = *v27;
                  *v27 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v28);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v28) = v27;
                  v27 = v21;
                }
                v28 = v22;
LABEL_55:
                v21 = v27;
                v27 = (_QWORD *)*v27;
                v22 = v28;
              }
              while (v27);
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        v33 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v33)
          operator delete(v33);
        v7 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v29 = *(_QWORD **)a1;
  v30 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v30)
  {
    *v10 = *v30;
LABEL_72:
    *v30 = v10;
    goto LABEL_73;
  }
  *v10 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v10;
  v29[v3] = a1 + 4;
  if (*v10)
  {
    v31 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7)
        v31 %= v7;
    }
    else
    {
      v31 &= v7 - 1;
    }
    v30 = (_QWORD *)(*(_QWORD *)a1 + 8 * v31);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return v10;
}

void sub_100007668(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000767C()
{
  abort();
}

void sub_1000076AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000077B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000787C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100007CA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100007DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100007F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100007FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100008054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100008100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000083D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100008584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100008774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1000087CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "isEqual:", NSUnderlyingErrorKey))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("UnderlyingError"));
LABEL_6:

    goto LABEL_7;
  }
  if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
LABEL_7:

}

void sub_1000088A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000894C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100008AB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_100008CB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100008D80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008EA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_100009018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000093A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100009E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_100009F68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SWCEntry *v11;
  SWCEntry *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = [SWCEntry alloc];
        v12 = -[SWCEntry initWithApplicationIdentifier:service:domain:](v11, "initWithApplicationIdentifier:service:domain:", *(_QWORD *)(a1 + 32), v5, v10, (_QWORD)v13);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void sub_10000A0A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000A154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000A2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_10000A2F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (_NSIsNSString(v12) && _NSIsNSDictionary(v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:](_SWCSubstitutionVariableList, "substitutionVariableListWithDictionary:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("defaults")));
    if ((_NSIsNSDictionary(v7) & 1) == 0)
    {

      v7 = &__NSDictionary0__struct;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("details")));
    if (v8 && (v9 = _SWCServiceTypeMaximumDetailsCount(v12)) != 0)
    {
      if (_NSIsNSArray(v8))
      {
        objc_msgSend(*(id *)(a1 + 48), "_addEntriesToOrderedSet:forUniversalLinksFromDetailsArray:domain:substitutionVariables:defaults:maximum:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40), v6, v7, v9);
      }
      else if (_NSIsNSDictionary(v8))
      {
        objc_msgSend(*(id *)(a1 + 48), "_addEntriesToOrderedSet:forUniversalLinksFromDetailsDictionary:domain:substitutionVariables:defaults:maximum:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40), v6, v7, v9);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("apps")));
      v11 = (void *)v10;
      if (v10 && _NSIsNSArray(v10))
        objc_msgSend(*(id *)(a1 + 48), "_addEntriesToOrderedSet:forService:fromAppsArray:domain:", *(_QWORD *)(a1 + 32), v12, v11, *(_QWORD *)(a1 + 40));

    }
  }

}

void sub_10000A470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10000A5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000AE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_10000B300(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_10000B724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_10000B82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_10000B858(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v17 = a2;
  v15 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v15;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domainRequiringModeOfOperation:", 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
        v11 = v10;
        if (v10)
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v10, "unsignedLongLongValue") | (int)objc_msgSend(v8, "modeOfOperation")));
        else
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithChar:](NSNumber, "numberWithChar:", objc_msgSend(v8, "modeOfOperation")));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v9);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000BB6C;
  v19[3] = &unk_1000309B8;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(obj, "count"));
  v20 = v13;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v19);
  v14 = objc_msgSend(v13, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v17);

}

void sub_10000BACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_10000BB6C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domainRequiringModeOfOperation:", (char)objc_msgSend(v5, "unsignedLongLongValue")));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void sub_10000BBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000BF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_10000C044(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayWithOptions:usingComparator:", 16, &stru_100030A20));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
}

void sub_10000C0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

int64_t sub_10000C0EC(id a1, _SWCDomain *a2, _SWCDomain *a3)
{
  _SWCDomain *v4;
  _SWCDomain *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  int64_t v13;

  v4 = a2;
  v5 = a3;
  v6 = -[_SWCDomain isWildcard](v4, "isWildcard");
  v7 = -[_SWCDomain isWildcard](v5, "isWildcard");
  if (((v6 | v7 ^ 1) & 1) != 0)
  {
    if ((v6 ^ 1 | v7) == 1)
    {
      if (((v6 ^ 1 | v7 ^ 1) & 1) != 0)
        goto LABEL_9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain host](v4, "host"));
      v9 = objc_msgSend(v8, "length");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain host](v5, "host"));
      v11 = objc_msgSend(v10, "length");

      v12 = v9 == v11;
      v13 = v9 > v11 ? -1 : 1;
      if (v12)
LABEL_9:
        v13 = 0;
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

void sub_10000C1C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000C664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_10000C8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C928(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v16 = 0;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:options:error:", v6, 1, &v16);
  v9 = v16;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](SWCSecurityGuard, "sharedSecurityGuard"));
    v15 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "JSONObjectWithSignedJSONData:error:", v8, &v15));
    v12 = v15;

    if (!v11)
    {
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v13 = qword_1000371B8;
      if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to decode JSON object from file %@: %@", buf, 0x16u);
      }
      v11 = 0;
    }
  }
  else
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v14 = qword_1000371B8;
    if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to read JSON file %@: %@", buf, 0x16u);
    }
    v11 = 0;
    v12 = v9;
  }

  objc_autoreleasePoolPop(v7);
  if (v11)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10000CB80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000CDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  void *v29;
  void *v30;
  void *v31;

  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CDF8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000CE08(uint64_t a1)
{

}

void sub_10000CE10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  __int16 v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  _WORD *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "entriesForJSONObject:domain:", a3, a2));
  if (v21)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v6 = objc_alloc_init((Class)NSMutableOrderedSet);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v21;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v23;
      v12 = (a4 & 7) << 10;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentifier"));
          v16 = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v16)
          {
            v17 = objc_retainAutorelease(v14);
            v18 = objc_msgSend(v17, "fields");
            *v18 = *v18 & 0xE3FF | v12;
            v19 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "indexOfObject:", v17);
            v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v20, "addObject:", v17);
            else
              objc_msgSend(v20, "replaceObjectAtIndex:withObject:", v19, v17);
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

  }
}

void sub_10000CFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10000D3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  void *v33;
  void *v34;
  void *v35;

  _Unwind_Resume(a1);
}

void sub_10000D4C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  SWCEntry *v7;
  SWCEntry *v8;
  char v9;
  SWCEntry *v10;
  SWCFields *v11;
  uint64_t v12;
  int v13;
  SWCFields *v14;
  int v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v16 = v3;
    v5 = _NSIsNSString(v3);
    v4 = v16;
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)_SWCApplicationIdentifier), "initWithString:", v16);
      v7 = [SWCEntry alloc];
      v8 = -[SWCEntry initWithApplicationIdentifier:service:domain:](v7, "initWithApplicationIdentifier:service:domain:", v6, _SWCServiceTypeAppLinks, *(_QWORD *)(a1 + 32));
      -[SWCEntry setPatterns:](v8, "setPatterns:", *(_QWORD *)(a1 + 40));
      -[SWCEntry setSubstitutionVariables:](v8, "setSubstitutionVariables:", *(_QWORD *)(a1 + 48));
      v9 = *(_BYTE *)(a1 + 72);
      v10 = objc_retainAutorelease(v8);
      v11 = -[SWCEntry fields](v10, "fields");
      *(_WORD *)v11 = *(_WORD *)v11 & 0xFF3F | ((v9 & 3) << 6);
      v12 = *(_QWORD *)(a1 + 56);
      if (v12 && (objc_opt_respondsToSelector(v12, "intValue") & 1) != 0)
      {
        v13 = objc_msgSend(*(id *)(a1 + 56), "intValue");
        v14 = -[SWCEntry fields](objc_retainAutorelease(v10), "fields");
        if (v13 >= 100)
          v15 = 100;
        else
          v15 = v13;
        if (v15 <= -100)
          LOBYTE(v15) = -100;
        v14->relativeOrder = v15;
      }
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v10);

      v4 = v16;
    }
  }

}

void sub_10000D5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000D7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10000D914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  va_list va;

  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D95C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  if (_NSIsNSString(v9) && _NSIsNSDictionary(v7))
  {
    v8 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("appID"));
    objc_msgSend(*(id *)(a1 + 72), "_addEntryToOrderedSet:forUniversalLinksFromSingleDetailsDictionary:domain:substitutionVariables:defaults:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= *(_QWORD *)(a1 + 80))
      *a4 = 1;

  }
}

void sub_10000DA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000DBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10000DC28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "entry");
  v2 = (void *)qword_1000371B8;
  qword_1000371B8 = (uint64_t)v1;

}

void sub_10000DCDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000DE3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000DFA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000E148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000E6B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000E7B0(id a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char *v6;
  const char *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];

  if (dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 1))
  {
    qword_1000371D8 = (uint64_t)NSClassFromString(CFSTR("MCProfileConnection"));
    if (qword_1000371D8)
      return;
    v1 = objc_alloc((Class)NSError);
    v14[0] = &off_1000327F8;
    v13[0] = CFSTR("Line");
    v13[1] = CFSTR("Function");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]_block_invoke"));
    v14[1] = v2;
    v13[2] = NSDebugDescriptionErrorKey;
    v14[2] = CFSTR("MCProfileConnection not found.");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
    v4 = objc_msgSend(v1, "initWithDomain:code:userInfo:", _SWCErrorDomain, 4, v3);
    v5 = (void *)qword_1000371C8;
    qword_1000371C8 = (uint64_t)v4;
  }
  else
  {
    v6 = dlerror();
    if (v6)
      v7 = v6;
    else
      v7 = "ManagedConfiguration.framework not loaded.";
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
    v8 = objc_alloc((Class)NSError);
    v12[0] = &off_100032810;
    v11[0] = CFSTR("Line");
    v11[1] = CFSTR("Function");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]_block_invoke"));
    v11[2] = NSDebugDescriptionErrorKey;
    v12[1] = v3;
    v12[2] = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    v9 = objc_msgSend(v8, "initWithDomain:code:userInfo:", _SWCErrorDomain, 4, v5);
    v10 = (void *)qword_1000371C8;
    qword_1000371C8 = (uint64_t)v9;

  }
}

void sub_10000E9CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000EA0C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "1701");
  v2 = (void *)qword_1000371E0;
  qword_1000371E0 = (uint64_t)v1;

}

void start()
{
  void *v0;
  int v1;
  NSObject *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  char *v12;

  v0 = objc_autoreleasePoolPush();
  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  if ((_set_user_dir_suffix("com.apple.swcd") & 1) == 0)
  {
    v1 = *__error();
    if (qword_100037208 != -1)
      dispatch_once(&qword_100037208, &stru_100030BC0);
    v2 = (id)qword_100037200;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109378;
      v10[1] = v1;
      v11 = 2082;
      v12 = strerror(v1);
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "### _set_user_dir_suffix() failed: %i %{public}s", (uint8_t *)v10, 0x12u);
    }

  }
  signal(13, (void (__cdecl *)(int))1);
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("SWC notification queue", v4);
  v6 = (void *)qword_1000371F0;
  qword_1000371F0 = (uint64_t)v5;

  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)qword_1000371F0, &stru_100030B60);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_1000371F0, &stru_100030B80);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_1000371F0);
  v8 = (void *)qword_1000371F8;
  qword_1000371F8 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000371F8, &stru_100030BA0);
  dispatch_resume((dispatch_object_t)qword_1000371F8);
  v9 = sub_10000F218();
  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void sub_10000EBF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000EC0C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  NSObject *v3;
  int v4;
  OS_xpc_object *v5;

  v2 = a2;
  if (qword_100037208 != -1)
    dispatch_once(&qword_100037208, &stru_100030BC0);
  v3 = qword_100037200;
  if (os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "XPC stream event (distnoted): %@", (uint8_t *)&v4, 0xCu);
  }
  sub_10000ECFC(v2);

}

void sub_10000ECE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000ECFC(void *a1)
{
  id v1;
  NSObject *v2;
  char *v3;
  NSObject *v4;
  const char *string;
  char *v6;
  NSObject *v7;
  const char *v8;
  const _xpc_type_s *type;
  _BYTE v10[24];
  __int128 v11;

  v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_error)
  {
    v3 = xpc_copy_description(v1);
    if (qword_100037208 != -1)
      dispatch_once(&qword_100037208, &stru_100030BC0);
    v4 = qword_100037200;
    if (!os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)v10 = 136446210;
    *(_QWORD *)&v10[4] = v3;
    v8 = "XPC error on event handler: %{public}s";
    goto LABEL_24;
  }
  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (qword_100037208 != -1)
      dispatch_once(&qword_100037208, &stru_100030BC0);
    v2 = (id)qword_100037200;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      type = xpc_get_type(v1);
      *(_DWORD *)v10 = 136446210;
      *(_QWORD *)&v10[4] = xpc_type_get_name(type);
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Unexpected XPC type on event handler: %{public}s", v10, 0xCu);
    }

    goto LABEL_18;
  }
  string = xpc_dictionary_get_string(v1, _xpc_event_key_name);
  if (!string)
  {
    v3 = xpc_copy_description(v1);
    if (qword_100037208 != -1)
      dispatch_once(&qword_100037208, &stru_100030BC0);
    v4 = qword_100037200;
    if (!os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)v10 = 136380675;
    *(_QWORD *)&v10[4] = v3;
    v8 = "XPC message is missing a notification name: %{private}s";
LABEL_24:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v8, v10, 0xCu);
LABEL_11:
    free(v3);
    goto LABEL_18;
  }
  v6 = xpc_copy_description(v1);
  if (qword_100037208 != -1)
    dispatch_once(&qword_100037208, &stru_100030BC0);
  v7 = qword_100037200;
  if (os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v10 = 136446467;
    *(_QWORD *)&v10[4] = string;
    *(_WORD *)&v10[12] = 2081;
    *(_QWORD *)&v10[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received notification %{public}s, updating entry list: %{private}s", v10, 0x16u);
  }
  free(v6);
  *(_QWORD *)&v10[8] = 0;
  v11 = 0u;
  *(_QWORD *)v10 = 0x3FD0000000000000;
  *(_QWORD *)&v10[16] = 0x3FD0000000000000;
  *(_QWORD *)&v11 = (id)qword_1000371F0;
  *((_QWORD *)&v11 + 1) = os_transaction_create("com.apple.swc.xpc-notification-update");
  sub_10001E064(&qword_100037210, (uint64_t)v10, &stru_100030BE0);

LABEL_18:
}

void sub_10000F028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000F078(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  NSObject *v3;
  int v4;
  OS_xpc_object *v5;

  v2 = a2;
  if (qword_100037208 != -1)
    dispatch_once(&qword_100037208, &stru_100030BC0);
  v3 = qword_100037200;
  if (os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "XPC stream event (libnotify): %@", (uint8_t *)&v4, 0xCu);
  }
  sub_10000ECFC(v2);

}

void sub_10000F150(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000F168(id a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint8_t v4[16];

  if (qword_100037208 != -1)
    dispatch_once(&qword_100037208, &stru_100030BC0);
  v1 = qword_100037200;
  if (os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v4, 2u);
  }
  v2 = sub_10000F218();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "receiveSIGTERMSignal");

  xpc_transaction_exit_clean();
}

void sub_10000F208(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10000F218()
{
  void *v0;

  v0 = objc_autoreleasePoolPush();
  if (qword_100037220 != -1)
    dispatch_once(&qword_100037220, &stru_100030C28);
  objc_autoreleasePoolPop(v0);
  return (id)qword_100037218;
}

void sub_10000F270(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "daemon");
  v2 = (void *)qword_100037200;
  qword_100037200 = (uint64_t)v1;

}

void sub_10000F2A0(id a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v1 = sub_10000F218();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F344;
  block[3] = &unk_100030C08;
  v6 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

void sub_10000F334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10000F344(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateEntriesForAllBundlesIgnoringCurrentState:", 0);
}

void sub_10000F350(id a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = objc_claimAutoreleasedReturnValue(+[SWCManager beginListening](SWCManager, "beginListening"));
  v2 = (void *)qword_100037218;
  qword_100037218 = v1;

  if (qword_100037208 != -1)
    dispatch_once(&qword_100037208, &stru_100030BC0);
  v3 = qword_100037200;
  if (os_log_type_enabled((os_log_t)qword_100037200, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "swcd started", v4, 2u);
  }
}

void sub_10000F458(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000F468(id a1)
{
  id v1;
  void *v2;

  v1 = -[SWCDatabase _initShared]([SWCDatabase alloc], "_initShared");
  v2 = (void *)qword_100037228;
  qword_100037228 = (uint64_t)v1;

}

void sub_10000F4B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000F654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000F724(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000F734(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    objc_msgSend(v2, "saveReturningError:", 0);
    sub_10001E2C4((dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

void sub_10000F7A4(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("SWC database queue", v4);
  v3 = (void *)qword_100037238;
  qword_100037238 = (uint64_t)v2;

}

void sub_10000F864(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_10000FB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000FCC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000FE18(uint64_t a1, void *a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "domain"));
    if (objc_msgSend(*(id *)(a1 + 32), "isEqual:"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void sub_10000FEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000FF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100010024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_100010044(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100010054(uint64_t a1)
{

}

void sub_10001005C(uint64_t a1, id obj, _BYTE *a3)
{
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
    goto LABEL_6;
  if ((objc_msgSend(*(id *)(a1 + 32), "isWildcard") & 1) != 0)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "domain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "host"));
    v10 = objc_msgSend(v9, "length");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "host"));
    if (v10 <= objc_msgSend(v12, "length"))
    {

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "domain"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "domain"));
      v15 = objc_msgSend(v13, "encompassesDomain:", v14);

      if (v15)
      {
        v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_6:
        objc_storeStrong(v6, obj);
      }
    }
  }
  else
  {
    *a3 = 1;
  }
}

void sub_1000101C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10001029C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000106B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1000106F0(uint64_t a1, void *a2)
{
  id v4;
  _WORD *v5;
  id v6;
  _WORD *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "setLastCheckedDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "setLastError:", 0);
  objc_msgSend(a2, "setRetryCount:", 0);
  v4 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", a2);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a2, "isDownloadable"))
    {
      v5 = objc_msgSend(objc_retainAutorelease(a2), "fields");
      *v5 = *v5 & 0xFFF3 | 8;
    }
  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v4));
    v6 = objc_retainAutorelease(a2);
    v7 = objc_msgSend(v6, "fields");
    *v7 = *v7 & 0xFFF3 | 4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "patterns"));
    objc_msgSend(v6, "setPatterns:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substitutionVariables"));
    objc_msgSend(v6, "setSubstitutionVariables:", v9);

  }
}

void sub_100010810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1000108C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100010B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_100010B64(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceType"));
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
}

void sub_100010BD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100010C58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100010E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_100010E80(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "applicationIdentifier"));
  if (v4)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "domain"));

    if (!v5)
      return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entryMatchingServiceSpecifier:", a2));

  if (!v6)
  {
    if (qword_100037250 != -1)
      dispatch_once(&qword_100037250, &stru_100030D78);
    v7 = qword_100037248;
    if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will remove settings for service specifier %@ because there are no more service entries matching it", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
}

void sub_100011254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100011950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

uint64_t sub_100011A68(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_opt_isKindOfClass(a2, *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0
    || (result = +[NSPropertyListSerialization propertyList:isValidForFormat:](NSPropertyListSerialization, "propertyList:isValidForFormat:", a3, 200), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

void sub_100011EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100012044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100012128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000121FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000122B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100012418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  id *v19;
  id *v20;

  v20 = v19;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100012454(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v6 = 0;
    v3 = objc_msgSend(WeakRetained, "saveReturningError:", &v6);
    v4 = v6;
    if ((v3 & 1) == 0)
    {
      if (qword_100037250 != -1)
        dispatch_once(&qword_100037250, &stru_100030D78);
      v5 = qword_100037248;
      if (os_log_type_enabled((os_log_t)qword_100037248, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error saving SWC database: %@", buf, 0xCu);
      }
    }

  }
}

void sub_10001255C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000127FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000128C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100012938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000129B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100012A2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100012A48(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "db");
  v2 = (void *)qword_100037248;
  qword_100037248 = (uint64_t)v1;

}

void sub_100012B14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100012B4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100012BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100012C68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100012D84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100012D98(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "_performUpdateWithActivity:", v4);
  objc_autoreleasePoolPop(v3);

}

void sub_100012DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000130D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL sub_1000130F8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performUpdatesWithTransaction:", *(_QWORD *)(a1 + 40));
  return xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 5);
}

void sub_100013204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100013234(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  v3 = a2;
  if ((objc_msgSend(v3, "isDownloadable") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextCheckDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "earlierDate:", v4));
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if (v6)
    {
      if (qword_100037260 != -1)
        dispatch_once(&qword_100037260, &stru_100030DE8);
      v7 = qword_100037258;
      if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_DEBUG))
      {
        v9 = 138412546;
        v10 = v3;
        v11 = 2114;
        v12 = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Entry %@ needed to be rechecked at %{public}@", (uint8_t *)&v9, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
    else
    {
      if (qword_100037260 != -1)
        dispatch_once(&qword_100037260, &stru_100030DE8);
      v8 = qword_100037258;
      if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_DEBUG))
      {
        v9 = 138412546;
        v10 = v3;
        v11 = 2114;
        v12 = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Entry %@ will need to be rechecked at %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }

  }
}

void sub_1000133F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000136A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000136F4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "dlsched");
  v2 = (void *)qword_100037258;
  qword_100037258 = (uint64_t)v1;

}

void sub_100013E98(id a1)
{
  SWCAnalyticsLogger *v1;
  void *v2;

  v1 = objc_alloc_init(SWCAnalyticsLogger);
  v2 = (void *)qword_100037270;
  qword_100037270 = (uint64_t)v1;

}

id sub_100013F18(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("route");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 32)));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

void sub_100014080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000140B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100014108(id a1)
{
  void *v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = (void *)os_transaction_create("com.apple.swc.begin");
  v2 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000141B0;
  block[3] = &unk_100030C08;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void sub_1000141A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1000141B0()
{
  SWCManager *v0;
  void *v1;
  SWCManager *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = [SWCManager alloc];
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SWCDatabase sharedDatabase](SWCDatabase, "sharedDatabase"));
  v2 = -[SWCManager initWithDatabase:](v0, "initWithDatabase:", v1);
  v3 = (void *)qword_100037278;
  qword_100037278 = (uint64_t)v2;

  v4 = objc_alloc((Class)NSXPCListener);
  v5 = objc_msgSend(v4, "initWithMachServiceName:", _SWCXPCServiceName);
  v6 = *(void **)(qword_100037278 + 8);
  *(_QWORD *)(qword_100037278 + 8) = v5;

  objc_msgSend(*(id *)(qword_100037278 + 8), "setDelegate:");
  v7 = *(void **)(qword_100037278 + 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  objc_msgSend(v7, "_setQueue:", v8);

  objc_msgSend(*(id *)(qword_100037278 + 8), "resume");
  objc_msgSend((id)qword_100037278, "updateEntriesForAllBundlesIgnoringCurrentState:", 0);
  return objc_msgSend(*(id *)(qword_100037278 + 40), "update");
}

void sub_100014294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100014890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id sub_100014968()
{
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  return (id)qword_100037288;
}

void sub_1000149A8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v3 = qword_100037288;
  if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error during LS enumeration. App list may be incomplete: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_100014A7C(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v2 = (id)qword_100037288;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = (int)objc_msgSend(WeakRetained, "processIdentifier");
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connection interrupted: %llu", (uint8_t *)&v3, 0xCu);
  }

}

void sub_100014B6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100014B88(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v2 = (id)qword_100037288;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = (int)objc_msgSend(WeakRetained, "processIdentifier");
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connection invalidated: %llu", (uint8_t *)&v3, 0xCu);
  }

}

void sub_100014C78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100014D30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100014D40(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateEntriesMatchingService:exactDomain:appID:block:", 0, *(_QWORD *)(a1 + 40), 0, &stru_100030EC8);
}

void sub_100014D5C(id a1, SWCEntry *a2, BOOL *a3)
{
  SWCFields *v3;

  v3 = -[SWCEntry fields](objc_retainAutorelease(a2), "fields");
  *(_WORD *)v3 |= 0x10u;
}

void sub_100014E44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100014E58(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "enumerateEntriesMatchingService:exactDomain:appID:block:", 0, a1[5], 0, &stru_100030EE8);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[SWCEntry entriesForJSONObject:domain:](SWCEntry, "entriesForJSONObject:domain:", a1[6], a1[5]));
  objc_msgSend(*(id *)(a1[4] + 24), "updateEntriesForDomain:canonicalEntries:", a1[5]);

}

void sub_100014EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100014ED8(id a1, SWCEntry *a2, BOOL *a3)
{
  SWCFields *v3;

  v3 = -[SWCEntry fields](objc_retainAutorelease(a2), "fields");
  *(_WORD *)v3 &= ~0x10u;
}

void sub_100014FC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100014FD4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000150BC;
  v6[3] = &unk_100030CE0;
  v5 = v2;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateEntriesMatchingService:exactDomain:appID:block:", 0, v3, 0, v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "scheduleNextSave");

}

void sub_100015094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1000150BC(uint64_t a1, void *a2)
{
  _WORD *v3;
  uint64_t v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  void *v8;
  id v9;

  v9 = objc_retainAutorelease(a2);
  v3 = objc_msgSend(v9, "fields");
  *v3 &= ~0x10u;
  objc_msgSend(v9, "setLastCheckedDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setLastError:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "retryCount"));
  v5 = (void *)v4;
  v6 = &off_100032888;
  if (v4)
    v6 = (_UNKNOWN **)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v7, "unsignedLongLongValue") + 1));
  objc_msgSend(v9, "setRetryCount:", v8);

}

void sub_10001517C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100015238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100015250(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_serviceDetailsWithEntry:"));
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
  }

}

void sub_1000152E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100015554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_100015A20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100015F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id sub_100015FD4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_100016444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000167F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

_WORD *sub_100016874(uint64_t a1, id a2)
{
  char v2;
  _WORD *result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v2 = *(_BYTE *)(a1 + 40);
  result = objc_msgSend(objc_retainAutorelease(a2), "fields");
  *result = *result & 0xFFFC | v2 & 3;
  return result;
}

void sub_100016AA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100017220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000173C0(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    _SWCLogSeparator(*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "logToFile:verbosity:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

void sub_100017428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001743C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  int v10;
  double v11;
  const __CFString *v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  id v18;

  v4 = *(_QWORD *)(a2 + 24);
  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)a2, "description"));
  v7 = *(unsigned __int8 *)(a2 + 8);
  if (v4)
  {
    v8 = sub_1000027F4(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = *(unsigned __int8 *)(a2 + 9);
    objc_msgSend(*(id *)(a2 + 24), "timeIntervalSinceNow");
    v12 = CFSTR(" discretionary");
    if (!v10)
      v12 = &stru_100031ED8;
    v13 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@ (%@%@ running for %.0fs)"), v6, v9, v12, floor(fabs(v11)));
  }
  else
  {
    v14 = sub_1000027F4(v7);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v9 = (void *)v15;
    if (*(_BYTE *)(a2 + 9))
      v16 = CFSTR(" discretionary");
    else
      v16 = &stru_100031ED8;
    v13 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@ (%@%@ in future)"), v6, v15, v16);
  }
  v18 = v13;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringFromByteCount:", *(_QWORD *)(a2 + 32)));
  _SWCLogValueForKey(*(_QWORD *)(a1 + 40), v18, v17, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

}

void sub_100017578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000175B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  int v9;
  double v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)a2, "description"));
  v5 = (id)v4;
  if (*(_QWORD *)(a2 + 24) && *(_BYTE *)(a1 + 40))
  {
    v13 = (id)v4;
    v6 = objc_alloc((Class)NSString);
    v7 = sub_1000027F4(*(unsigned __int8 *)(a2 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = *(unsigned __int8 *)(a2 + 9);
    objc_msgSend(*(id *)(a2 + 24), "timeIntervalSinceNow");
    v11 = CFSTR(" discretionary");
    if (!v9)
      v11 = &stru_100031ED8;
    v12 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@ (%@%@ %.0fs)"), v13, v8, v11, floor(fabs(v10)));

    v5 = v12;
  }
  v14 = v5;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void sub_1000176A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_1000176C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _SWCLogValueForKey(*(_QWORD *)(a1 + 32), a2, a3, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

void sub_1000176D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    _SWCLogSeparator(*(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  _SWCLogValueForKey(v6, v7, v5, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void sub_100017774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100017798(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 512, 0);
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationIdentifier"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "patterns"));
  if (v9)
    objc_msgSend(v6, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substitutionVariables"));
  if (v10)
    objc_msgSend(v6, "addObject:", v10);

}

void sub_100017898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

__n128 sub_1000178E8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_10001790C(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  sub_10001BE54(&v1);
}

void sub_100017934(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  size_t v7;
  id v8;
  size_t v9;
  uint64_t v10;
  void *i;
  const void *v12;
  objc_class *v13;
  size_t InstanceSize;
  size_t v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a2;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = a3;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v6);
        v12 = *(const void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v13 = (objc_class *)objc_opt_class(v12);
        InstanceSize = class_getInstanceSize(v13);
        v15 = malloc_size(v12);
        if (v15 > InstanceSize)
        {
          v7 = v15 - InstanceSize + v9;
          v9 = v7;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

  v16 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v18 = (_QWORD *)v16[7];
  v17 = v16[8];
  if ((unint64_t)v18 < v17)
  {
    *v18 = v5;
    v18[1] = v7;
    v19 = v18 + 2;
    goto LABEL_29;
  }
  v20 = v16[6];
  v21 = ((uint64_t)v18 - v20) >> 4;
  if ((unint64_t)(v21 + 1) >> 60)
    abort();
  v22 = v17 - v20;
  v23 = v22 >> 3;
  if (v22 >> 3 <= (unint64_t)(v21 + 1))
    v23 = v21 + 1;
  if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
    v24 = 0xFFFFFFFFFFFFFFFLL;
  else
    v24 = v23;
  if (v24)
  {
    if (v24 >> 60)
      sub_10000767C();
    v25 = (char *)operator new(16 * v24);
  }
  else
  {
    v25 = 0;
  }
  v26 = &v25[16 * v21];
  *(_QWORD *)v26 = v5;
  *((_QWORD *)v26 + 1) = v7;
  v27 = (_QWORD *)v16[6];
  v28 = (_QWORD *)v16[7];
  if (v28 == v27)
  {
    v19 = v26 + 16;
    v16[6] = v26;
    v16[7] = v26 + 16;
    v16[8] = &v25[16 * v24];
    if (!v27)
      goto LABEL_29;
    goto LABEL_28;
  }
  v29 = (_QWORD *)v16[7];
  v30 = v26;
  do
  {
    v31 = *(v29 - 2);
    v29 -= 2;
    *v29 = 0;
    *((_QWORD *)v30 - 2) = v31;
    v30 -= 16;
    *((_QWORD *)v30 + 1) = v29[1];
  }
  while (v29 != v27);
  v19 = v26 + 16;
  v16[6] = v30;
  v16[7] = v26 + 16;
  v16[8] = &v25[16 * v24];
  do
  {
    v32 = (void *)*(v28 - 2);
    v28 -= 2;

  }
  while (v28 != v27);
  if (v27)
LABEL_28:
    operator delete(v27);
LABEL_29:
  v16[7] = v19;

}

void sub_100017B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL sub_100017BBC(id a1, const void *a2, const void *a3)
{
  return *((_QWORD *)a2 + 1) > *((_QWORD *)a3 + 1);
}

void sub_100017D80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_100017FE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100018398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000186AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_100018998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100018A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100018CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100018D24(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (a2)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018DF4;
    v8[3] = &unk_100030810;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    dispatch_async(v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_100018DE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100018DF4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "_setDeveloperModeEnabled:error:", 1, &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100018E60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000192E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_100019574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100019714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100019E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_100019F6C(uint64_t a1, void *a2)
{
  id v3;

  v3 = objc_retainAutorelease(a2);
  if ((*(_WORD *)objc_msgSend(v3, "fields") & 0x1C00) != 0x800
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

void sub_100019FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001A180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10001A1D8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v3 = a2;
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v4 = qword_100037288;
  if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v22 = v3;
    v23 = 2112;
    v24 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Found entry %@ matching inputs %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v20 = 0;
    v6 = objc_msgSend(v3, "evaluateWithURLComponents:auditToken:matchingPattern:", v5, a1 + 56, &v20);
    v7 = v20;
    v8 = v7;
    if (v6)
    {
      if (v6 != (id)100)
      {
        if (v6 == (id)200)
        {
          if (v7)
          {
            if (qword_100037290 != -1)
              dispatch_once(&qword_100037290, &stru_1000311C0);
            v9 = qword_100037288;
            if (!os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
              goto LABEL_27;
            *(_DWORD *)buf = 138412546;
            v22 = v8;
            v23 = 2112;
            v24 = v3;
            v10 = "Inputs matched pattern %@ on entry %@";
            v11 = v9;
            v12 = 22;
          }
          else
          {
            if (qword_100037290 != -1)
              dispatch_once(&qword_100037290, &stru_1000311C0);
            v19 = qword_100037288;
            if (!os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
              goto LABEL_27;
            *(_DWORD *)buf = 138412290;
            v22 = v3;
            v10 = "Entry %@ did not have any patterns to match against";
            v11 = v19;
            v12 = 12;
          }
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
LABEL_27:
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
        }
LABEL_28:

        goto LABEL_29;
      }
      if (qword_100037290 != -1)
        dispatch_once(&qword_100037290, &stru_1000311C0);
      v13 = qword_100037288;
      if (!os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v3;
      v14 = "Inputs blocked by pattern %@ on entry %@";
      v15 = v13;
      v16 = 22;
    }
    else
    {
      if (qword_100037290 != -1)
        dispatch_once(&qword_100037290, &stru_1000311C0);
      v17 = qword_100037288;
      if (!os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      v14 = "Inputs did not match entry %@";
      v15 = v17;
      v16 = 12;
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, buf, v16);
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
LABEL_29:

}

void sub_10001A4FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10001A520(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char *v8;
  __int16 v9;
  int v10;
  id v11;
  char *v12;
  __int16 v13;
  int v14;
  _BOOL4 v16;
  int v17;
  int v18;
  _BOOL4 v20;
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  v7 = objc_retainAutorelease(v5);
  v8 = (char *)objc_msgSend(v7, "fields");
  v9 = *(_WORD *)v8;
  v10 = v8[2];
  v11 = objc_retainAutorelease(v6);
  v12 = (char *)objc_msgSend(v11, "fields");
  v13 = *(_WORD *)v12;
  v14 = v12[2];
  v16 = (v9 & 3) == 1 || (v9 & 0xC) == 4;
  v17 = v13 & 3;
  v18 = v13 & 0xC;
  v20 = v17 == 1 || v18 == 4;
  if (v16 && !v20)
    goto LABEL_17;
  if (!v16 && v20)
    goto LABEL_19;
  if (v10 >= v14)
  {
    if (v10 <= v14)
    {
      if (!*(_QWORD *)(a1 + 32))
        goto LABEL_26;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "patterns"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "patterns"));
      if (v23 && !v24)
        goto LABEL_17;
      if (v23 || !v24)
      {
LABEL_26:
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
        if ((objc_msgSend(v25, "isEqual:", v26) & 1) == 0)
        {
          if (objc_msgSend(v25, "isWildcard")
            && (objc_msgSend(v25, "encompassesDomain:", v26) & 1) != 0)
          {
            v21 = 1;
LABEL_34:

            goto LABEL_20;
          }
          if (objc_msgSend(v26, "isWildcard")
            && (objc_msgSend(v26, "encompassesDomain:", v25) & 1) != 0)
          {
            v21 = -1;
            goto LABEL_34;
          }
        }
        v21 = 0;
        goto LABEL_34;
      }
    }
LABEL_19:
    v21 = 1;
    goto LABEL_20;
  }
LABEL_17:
  v21 = -1;
LABEL_20:

  return v21;
}

void sub_10001A6C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001A774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10001AD5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10001AE84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  if (a2)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001AF64;
    v8[3] = &unk_100031150;
    v10 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    dispatch_async(v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_10001AF54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10001AF64(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_10001AFE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001B2A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001B360(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001B600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10001B7E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10001B9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10001B9F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001BA00(uint64_t a1)
{

}

void sub_10001BA08(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  id obj;

  v7 = a2;
  v8 = a3;
  if (_NSIsNSData()
    && (objc_opt_isKindOfClass(v7, *(_QWORD *)(a1 + 56)) & 1) != 0
    && (objc_msgSend(v7, "isValid") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rawValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("json")));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v10));
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v8, "writeToURL:options:error:", v11, 1, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if (v13)
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      else
        *a4 = 1;

    }
  }

}

void sub_10001BB28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10001BD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10001BE24(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "manager");
  v2 = (void *)qword_100037288;
  qword_100037288 = (uint64_t)v1;

}

void sub_10001BE54(void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 2);
        v4 -= 16;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_10001BEC0(void **a1, void **a2, uint64_t a3, uint64_t a4, char a5)
{
  void **v10;
  void **v11;
  uint64_t v12;
  unint64_t v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void **v18;
  void **v19;
  void **v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void **v27;
  int v28;
  void **v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  void **v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int64_t v44;
  int64_t v45;
  uint64_t v46;
  void **v47;
  void **v48;
  void *v49;
  void **v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void **v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void **v60;
  void **v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  void **v71;
  void *v72;
  void **v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD *v79;
  void **v80;
  _QWORD *v81;
  void *v82;
  void **v83;
  void *v84;
  void *v85;
  void *v86;
  void **v87;
  void **v88;
  void *v89;
  void **v90;
  int64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;

LABEL_1:
  v10 = a2 - 2;
  v88 = a2;
  v90 = a2 - 4;
  v87 = a2 - 6;
  v11 = a1;
  while (2)
  {
    a1 = v11;
    v12 = (char *)a2 - (char *)v11;
    v13 = v12 >> 4;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
          sub_10001CBD8(a1, v10);
        return;
      case 3uLL:
        sub_10001C8E0(a1, a1 + 2, v10, a3);
        return;
      case 4uLL:
        sub_10001CC38(a1, a1 + 2, a1 + 4, v10, a3);
        return;
      case 5uLL:
        sub_10001CCF8(a1, a1 + 2, a1 + 4, a1 + 6, v10, a3);
        return;
      default:
        if (v12 <= 383)
        {
          if ((a5 & 1) != 0)
          {
            if (a1 != a2)
            {
              v33 = a1 + 2;
              if (a1 + 2 != a2)
              {
                v34 = 0;
                v35 = a1;
                do
                {
                  v36 = v33;
                  if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                  {
                    v37 = (void *)*v36;
                    *v36 = 0;
                    v95 = v37;
                    v101 = v35[3];
                    v38 = v34;
                    while (1)
                    {
                      v39 = (void **)((char *)a1 + v38);
                      v40 = *(uint64_t *)((char *)a1 + v38);
                      *v39 = 0;
                      v41 = *(void **)((char *)a1 + v38 + 16);
                      v39[2] = v40;

                      v39[3] = v39[1];
                      if (!v38)
                        break;
                      v38 -= 16;
                      if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
                      {
                        v42 = (uint64_t)a1 + v38 + 16;
                        goto LABEL_66;
                      }
                    }
                    v42 = (uint64_t)a1;
LABEL_66:
                    v43 = *(void **)v42;
                    *(_QWORD *)v42 = v95;

                    *(_QWORD *)(v42 + 8) = v101;
                    a2 = v88;
                  }
                  v33 = v36 + 2;
                  v34 += 16;
                  v35 = (void **)v36;
                }
                while (v36 + 2 != a2);
              }
            }
          }
          else if (a1 != a2)
          {
            v79 = a1 + 2;
            if (a1 + 2 != a2)
            {
              v80 = a1 - 2;
              do
              {
                v81 = v79;
                if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                {
                  v82 = (void *)*v81;
                  *v81 = 0;
                  v98 = v82;
                  v104 = a1[3];
                  v83 = v80;
                  do
                  {
                    v84 = v83[2];
                    v83[2] = 0;
                    v85 = v83[4];
                    v83[4] = v84;

                    v83[5] = v83[3];
                    v83 -= 2;
                  }
                  while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
                  v86 = v83[4];
                  v83[4] = v98;

                  v83[5] = v104;
                }
                v79 = v81 + 2;
                v80 += 2;
                a1 = (void **)v81;
              }
              while (v81 + 2 != a2);
            }
          }
          return;
        }
        if (!a4)
        {
          if (a1 != a2)
          {
            v44 = (v13 - 2) >> 1;
            v91 = v44;
            do
            {
              v45 = v44;
              if (v91 >= v44)
              {
                v46 = (2 * v44) | 1;
                v47 = &a1[2 * v46];
                if (2 * v44 + 2 < (uint64_t)v13 && (*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                {
                  v47 += 2;
                  v46 = 2 * v45 + 2;
                }
                v48 = &a1[2 * v45];
                if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
                {
                  v49 = *v48;
                  *v48 = 0;
                  v96 = v49;
                  v102 = a1[2 * v45 + 1];
                  do
                  {
                    v50 = v47;
                    v51 = *v47;
                    *v47 = 0;
                    v52 = *v48;
                    *v48 = v51;

                    v48[1] = v47[1];
                    if (v91 < v46)
                      break;
                    v53 = (2 * v46) | 1;
                    v47 = &a1[2 * v53];
                    v46 = 2 * v46 + 2;
                    if (v46 >= (uint64_t)v13)
                    {
                      v46 = v53;
                    }
                    else if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                    {
                      v47 += 2;
                    }
                    else
                    {
                      v46 = v53;
                    }
                    v48 = v50;
                  }
                  while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
                  v54 = *v50;
                  *v50 = v96;

                  v50[1] = v102;
                }
              }
              v44 = v45 - 1;
            }
            while (v45);
            v55 = (unint64_t)v12 >> 4;
            v56 = v88;
            do
            {
              v57 = 0;
              v89 = a1[1];
              v92 = *a1;
              *a1 = 0;
              v58 = v55 - 2;
              if (v55 < 2)
                v58 = v55 - 1;
              v59 = v58 >> 1;
              v60 = a1;
              do
              {
                v61 = &v60[2 * v57 + 2];
                v62 = (2 * v57) | 1;
                v63 = 2 * v57 + 2;
                if (v63 < v55 && (*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                {
                  v61 += 2;
                  v62 = v63;
                }
                v64 = *v61;
                *v61 = 0;
                v65 = *v60;
                *v60 = v64;

                v60[1] = v61[1];
                v60 = v61;
                v57 = v62;
              }
              while (v62 <= v59);
              if (v61 == v56 - 2)
              {
                v77 = *v61;
                *v61 = v92;

                v61[1] = v89;
              }
              else
              {
                v66 = *(v56 - 2);
                *(v56 - 2) = 0;
                v67 = *v61;
                *v61 = v66;

                v61[1] = *(v56 - 1);
                v68 = *(v56 - 2);
                *(v56 - 2) = v92;

                *(v56 - 1) = v89;
                v69 = (char *)v61 - (char *)a1 + 16;
                if (v69 >= 17)
                {
                  v70 = (((unint64_t)v69 >> 4) - 2) >> 1;
                  v71 = &a1[2 * v70];
                  if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                  {
                    v72 = *v61;
                    *v61 = 0;
                    v97 = v72;
                    v103 = v61[1];
                    do
                    {
                      v73 = v71;
                      v74 = *v71;
                      *v71 = 0;
                      v75 = *v61;
                      *v61 = v74;

                      v61[1] = v71[1];
                      if (!v70)
                        break;
                      v70 = (v70 - 1) >> 1;
                      v71 = &a1[2 * v70];
                      v61 = v73;
                    }
                    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
                    v76 = *v73;
                    *v73 = v97;

                    v73[1] = v103;
                  }
                }
              }
              v56 -= 2;
            }
            while (v55-- > 2);
          }
          return;
        }
        v14 = &a1[2 * (v13 >> 1)];
        if ((unint64_t)v12 < 0x801)
        {
          sub_10001C8E0(&a1[2 * (v13 >> 1)], a1, v10, a3);
        }
        else
        {
          sub_10001C8E0(a1, &a1[2 * (v13 >> 1)], v10, a3);
          sub_10001C8E0(a1 + 2, v14 - 2, v90, a3);
          sub_10001C8E0(a1 + 4, &a1[2 * (v13 >> 1) + 2], v87, a3);
          sub_10001C8E0(v14 - 2, &a1[2 * (v13 >> 1)], &a1[2 * (v13 >> 1) + 2], a3);
          sub_10001CBD8(a1, &a1[2 * (v13 >> 1)]);
        }
        --a4;
        a2 = v88;
        if ((a5 & 1) == 0 && ((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
        {
          v25 = *a1;
          v26 = a1[1];
          *a1 = 0;
          v94 = v25;
          v100 = v26;
          if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0)
          {
            v11 = a1;
            do
              v11 += 2;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
          }
          else
          {
            v27 = a1 + 2;
            do
            {
              v11 = v27;
              if (v27 >= v88)
                break;
              v28 = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
              v27 = v11 + 2;
            }
            while (!v28);
          }
          v29 = v88;
          if (v11 < v88)
          {
            v29 = v88;
            do
              v29 -= 2;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
          }
          while (v11 < v29)
          {
            sub_10001CBD8(v11, v29);
            do
              v11 += 2;
            while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
            do
              v29 -= 2;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
          }
          if (v11 - 2 != a1)
          {
            v30 = *(v11 - 2);
            *(v11 - 2) = 0;
            v31 = *a1;
            *a1 = v30;

            a1[1] = *(v11 - 1);
          }
          v32 = *(v11 - 2);
          *(v11 - 2) = v94;

          *(v11 - 1) = v100;
          a5 = 0;
          continue;
        }
        v15 = 0;
        v16 = *a1;
        v17 = a1[1];
        *a1 = 0;
        v93 = v16;
        v99 = v17;
        do
          v15 += 2;
        while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
        v18 = &a1[v15];
        v19 = v88;
        if (v15 == 2)
        {
          v19 = v88;
          do
          {
            if (v18 >= v19)
              break;
            v19 -= 2;
          }
          while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
        }
        else
        {
          do
            v19 -= 2;
          while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
        }
        v11 = &a1[v15];
        if (v18 < v19)
        {
          v20 = v19;
          do
          {
            sub_10001CBD8(v11, v20);
            do
              v11 += 2;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
            do
              v20 -= 2;
            while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
          }
          while (v11 < v20);
        }
        if (v11 - 2 != a1)
        {
          v21 = *(v11 - 2);
          *(v11 - 2) = 0;
          v22 = *a1;
          *a1 = v21;

          a1[1] = *(v11 - 1);
        }
        v23 = *(v11 - 2);
        *(v11 - 2) = v93;

        *(v11 - 1) = v99;
        if (v18 < v19)
        {
LABEL_29:
          sub_10001BEC0(a1, v11 - 2, a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }
        v24 = sub_10001C9C4(a1, v11 - 2, a3);
        if (!sub_10001C9C4(v11, v88, a3))
        {
          if ((v24 & 1) != 0)
            continue;
          goto LABEL_29;
        }
        a2 = v11 - 2;
        if ((v24 & 1) == 0)
          goto LABEL_1;
        return;
    }
  }
}

void sub_10001C870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_10001C8E0(void **a1, void **a2, void **a3, uint64_t a4)
{
  char v8;
  int v9;
  void **v10;

  v8 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  if ((v8 & 1) != 0)
  {
    if (v9)
    {
      v10 = a1;
    }
    else
    {
      sub_10001CBD8(a1, a2);
      if (!(*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
        return;
      v10 = a2;
    }
    sub_10001CBD8(v10, a3);
  }
  else if (v9)
  {
    sub_10001CBD8(a2, a3);
    if ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
      sub_10001CBD8(a1, a2);
  }
}

uint64_t sub_10001C9C4(void **a1, void **a2, uint64_t a3)
{
  _BOOL8 v6;
  void **v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;

  v6 = 1;
  switch(((char *)a2 - (char *)a1) >> 4)
  {
    case 0:
    case 1:
      return v6;
    case 2:
      if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
        sub_10001CBD8(a1, a2 - 2);
      return v6;
    case 3:
      sub_10001C8E0(a1, a1 + 2, a2 - 2, a3);
      return v6;
    case 4:
      sub_10001CC38(a1, a1 + 2, a1 + 4, a2 - 2, a3);
      return v6;
    case 5:
      sub_10001CCF8(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2, a3);
      return v6;
    default:
      sub_10001C8E0(a1, a1 + 2, a1 + 4, a3);
      v7 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v8 = 0;
      v9 = 0;
      break;
  }
  while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
  {
LABEL_14:
    v8 += 16;
    v7 += 2;
    if (v7 == a2)
      return 1;
  }
  v10 = *v7;
  v11 = v7[1];
  *v7 = 0;
  v19 = v10;
  v20 = v11;
  v12 = v8;
  while (1)
  {
    v13 = (void **)((char *)a1 + v12);
    v14 = *(uint64_t *)((char *)a1 + v12 + 32);
    v13[4] = 0;
    v15 = *(void **)((char *)a1 + v12 + 48);
    v13[6] = v14;

    v13[7] = v13[5];
    if (v12 == -32)
      break;
    v12 -= 16;
    if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
    {
      v16 = (uint64_t)a1 + v12 + 48;
      goto LABEL_12;
    }
  }
  v16 = (uint64_t)a1;
LABEL_12:
  v17 = *(void **)v16;
  *(_QWORD *)v16 = v19;

  *(_QWORD *)(v16 + 8) = v20;
  if (++v9 != 8)
  {

    goto LABEL_14;
  }
  v6 = v7 + 2 == a2;

  return v6;
}

void sub_10001CBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_10001CBD8(void **a1, void **a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *a1;
  *a1 = 0;
  v5 = *a2;
  *a2 = 0;
  v6 = *a1;
  *a1 = v5;

  v7 = *a2;
  *a2 = v4;

  v8 = a1[1];
  a1[1] = a2[1];
  a2[1] = v8;
}

void sub_10001CC38(void **a1, void **a2, void **a3, void **a4, uint64_t a5)
{
  sub_10001C8E0(a1, a2, a3, a5);
  if ((*(unsigned int (**)(void))(*(_QWORD *)a5 + 16))())
  {
    sub_10001CBD8(a3, a4);
    if ((*(unsigned int (**)(void))(*(_QWORD *)a5 + 16))())
    {
      sub_10001CBD8(a2, a3);
      if ((*(unsigned int (**)(void))(*(_QWORD *)a5 + 16))())
        sub_10001CBD8(a1, a2);
    }
  }
}

void sub_10001CCF8(void **a1, void **a2, void **a3, void **a4, void **a5, uint64_t a6)
{
  sub_10001CC38(a1, a2, a3, a4, a6);
  if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
  {
    sub_10001CBD8(a4, a5);
    if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
    {
      sub_10001CBD8(a3, a4);
      if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
      {
        sub_10001CBD8(a2, a3);
        if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
          sub_10001CBD8(a1, a2);
      }
    }
  }
}

void sub_10001CE20(id a1)
{
  id v1;
  void *v2;

  v1 = -[SWCSecurityGuard _init]([SWCSecurityGuard alloc], "_init");
  v2 = (void *)qword_100037298;
  qword_100037298 = (uint64_t)v1;

}

void sub_10001CE70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001D130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_10001D3C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_10001DB70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10001DD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_10001DF90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10001E034(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)&_SWCLogSubsystem, "security");
  v2 = (void *)qword_1000372A8;
  qword_1000372A8 = (uint64_t)v1;

}

void sub_10001E064(dispatch_object_t *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  id v11;
  dispatch_time_t v12;
  uint64_t v13;
  dispatch_source_t v14;
  dispatch_object_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  dispatch_object_t *v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  id v30;

  v5 = a3;
  os_unfair_lock_lock(&stru_1000372B8);
  v6 = v5;
  v7 = *(double *)a2;
  v8 = *(double *)(a2 + 8);
  v9 = *(double *)(a2 + 16);
  v10 = *(id *)(a2 + 24);
  v11 = *(id *)(a2 + 32);
  v12 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  if (v8 <= 0.0 || fabs(v8) == INFINITY)
    v13 = -1;
  else
    v13 = (unint64_t)(v8 * 1000000000.0);
  if (*a1)
  {
    dispatch_suspend(*a1);
  }
  else
  {
    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);
    v15 = *a1;
    *a1 = v14;

    if (!*a1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void scheduleTimerNoLock(SWCTimer &, const SWCTimerSettings *, void (^__strong)())"));
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SWCTimer.mm"), 51, CFSTR("Unexpected failure to allocate a libdispatch timer source"));

    }
  }
  dispatch_source_set_timer(*a1, v12, v13, (unint64_t)(v9 * 1000000000.0));
  v16 = *a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3321888768;
  v22[2] = sub_10001E30C;
  v22[3] = &unk_100031228;
  v23 = v6;
  v24 = v13;
  v25 = a1;
  v26 = v7;
  v27 = v8;
  v28 = v9;
  v29 = v10;
  v30 = v11;
  v17 = v6;
  v18 = v10;
  v19 = v11;
  dispatch_source_set_event_handler(v16, v22);
  dispatch_resume(*a1);

  os_unfair_lock_unlock(&stru_1000372B8);
}

void sub_10001E290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10001E2C4(dispatch_source_t *a1)
{
  dispatch_source_t v2;

  os_unfair_lock_lock(&stru_1000372B8);
  if (*a1)
  {
    dispatch_source_cancel(*a1);
    v2 = *a1;
    *a1 = 0;

  }
  os_unfair_lock_unlock(&stru_1000372B8);
}

void sub_10001E30C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_QWORD *)(a1 + 40) == -1)
    sub_10001E2C4(*(dispatch_source_t **)(a1 + 48));
}

id sub_10001E350(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  id result;

  v4 = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v4;
  *(_QWORD *)(a1 + 80) = *(id *)(a2 + 80);
  result = *(id *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = result;
  return result;
}

void sub_10001E398(uint64_t a1)
{

}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_JSONObjectWithSignedJSONData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithSignedJSONData:error:");
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SDKVersion");
}

id objc_msgSend_SWCApplicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SWCApplicationIdentifier");
}

id objc_msgSend_SWCDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SWCDomain");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDRepresentation");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__CFURLRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_CFURLRequest");
}

id objc_msgSend__LSClearSchemaCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_LSClearSchemaCaches");
}

id objc_msgSend__URLRequestWithDomain_downloadRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_URLRequestWithDomain:downloadRoute:");
}

id objc_msgSend__addEntriesForAllBundlesWithEnumerator_toWorkingSet_enterpriseContext_developerModeEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:");
}

id objc_msgSend__addEntriesToOrderedSet_forService_fromAppsArray_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEntriesToOrderedSet:forService:fromAppsArray:domain:");
}

id objc_msgSend__addEntriesToOrderedSet_forUniversalLinksFromDetailsArray_domain_substitutionVariables_defaults_maximum_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEntriesToOrderedSet:forUniversalLinksFromDetailsArray:domain:substitutionVariables:defaults:maximum:");
}

id objc_msgSend__addEntriesToOrderedSet_forUniversalLinksFromDetailsDictionary_domain_substitutionVariables_defaults_maximum_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEntriesToOrderedSet:forUniversalLinksFromDetailsDictionary:domain:substitutionVariables:defaults:maximum:");
}

id objc_msgSend__addEntryToOrderedSet_forUniversalLinksFromSingleDetailsDictionary_domain_substitutionVariables_defaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEntryToOrderedSet:forUniversalLinksFromSingleDetailsDictionary:domain:substitutionVariables:defaults:");
}

id objc_msgSend__addJSONDataInDictionary_toStagingDirectoryAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addJSONDataInDictionary:toStagingDirectoryAtURL:error:");
}

id objc_msgSend__archivedDataFromStorage_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_archivedDataFromStorage:error:");
}

id objc_msgSend__associatedDomainsFromEntitlementForBundleRecord_applicationIdentifier_developerModeEnabled_enterpriseContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_associatedDomainsFromEntitlementForBundleRecord:applicationIdentifier:developerModeEnabled:enterpriseContext:");
}

id objc_msgSend__authorizeDeveloperModeChangeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authorizeDeveloperModeChangeWithCompletionHandler:");
}

id objc_msgSend__connectionIsEntitled_forMutation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionIsEntitled:forMutation:");
}

id objc_msgSend__connectionMayConnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionMayConnect:");
}

id objc_msgSend__copyStagingDirectoryAtURL_toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyStagingDirectoryAtURL:toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:error:");
}

id objc_msgSend__createStagingDirectoryForAdditionalServiceDetailsReturningError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createStagingDirectoryForAdditionalServiceDetailsReturningError:");
}

id objc_msgSend__dataFromStorageReturningError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dataFromStorageReturningError:");
}

id objc_msgSend__dataURLReturningError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dataURLReturningError:");
}

id objc_msgSend__deduplicateServicesByMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deduplicateServicesByMode:");
}

id objc_msgSend__deleteStorageItemReturningError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteStorageItemReturningError:");
}

id objc_msgSend__developerModeSemaphoreURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_developerModeSemaphoreURL");
}

id objc_msgSend__downloadAASAFileForDomain_applicationIdentifier_downloadRoute_discretionary_completionHandlers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:");
}

id objc_msgSend__eligibleSystemPlaceholderRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_eligibleSystemPlaceholderRecords");
}

id objc_msgSend__enterpriseEntriesWithContext_forBundleRecord_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enterpriseEntriesWithContext:forBundleRecord:applicationIdentifier:");
}

id objc_msgSend__entriesForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entriesForDomain:");
}

id objc_msgSend__entriesForDomain_operationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entriesForDomain:operationMode:");
}

id objc_msgSend__entriesFromBuiltInJSONForBundleRecord_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entriesFromBuiltInJSONForBundleRecord:applicationIdentifier:");
}

id objc_msgSend__entriesFromDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entriesFromDomain:");
}

id objc_msgSend__entriesWithServiceSpecifier_URL_limit_auditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entriesWithServiceSpecifier:URL:limit:auditToken:");
}

id objc_msgSend__enumerateJSONFilesForBundleRecord_applicationIdentifier_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateJSONFilesForBundleRecord:applicationIdentifier:block:");
}

id objc_msgSend__enumerateTaskStatesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateTaskStatesUsingBlock:");
}

id objc_msgSend__errorForUntrustedRootCertificateOfTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorForUntrustedRootCertificateOfTrust:");
}

id objc_msgSend__evaluateTrust_allowingKeychains_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_evaluateTrust:allowingKeychains:error:");
}

id objc_msgSend__evaluateTrust_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_evaluateTrust:error:");
}

id objc_msgSend__filterApplicationIdentifiers_toMatchEntitlementOfXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterApplicationIdentifiers:toMatchEntitlementOfXPCConnection:");
}

id objc_msgSend__getTrackingDomainInfoWithDomains_sources_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getTrackingDomainInfoWithDomains:sources:completionHandler:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_init");
}

id objc_msgSend__initShared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initShared");
}

id objc_msgSend__initWithServiceSpecifier_dictionary_generation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithServiceSpecifier:dictionary:generation:");
}

id objc_msgSend__initWithServiceSpecifier_fields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithServiceSpecifier:fields:");
}

id objc_msgSend__initWithServiceType_applicationIdentifier_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithServiceType:applicationIdentifier:domain:");
}

id objc_msgSend__invokeCompletionHandlerForState_JSONObject_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invokeCompletionHandlerForState:JSONObject:error:");
}

id objc_msgSend__isDeveloperModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDeveloperModeEnabled");
}

id objc_msgSend__isSystemTrusted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isSystemTrusted:");
}

id objc_msgSend__loadEnterpriseData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadEnterpriseData");
}

id objc_msgSend__maximumActiveTaskCountForSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maximumActiveTaskCountForSessionID:");
}

id objc_msgSend__performUpdateWithActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performUpdateWithActivity:");
}

id objc_msgSend__performUpdatesWithTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performUpdatesWithTransaction:");
}

id objc_msgSend__processDownloadedDataForState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processDownloadedDataForState:");
}

id objc_msgSend__removeSettingsForKeysNoSave_serviceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeSettingsForKeysNoSave:serviceSpecifier:");
}

id objc_msgSend__reorderAppLinks_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reorderAppLinks:domain:");
}

id objc_msgSend__resumePendingTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumePendingTasks");
}

id objc_msgSend__scheduleSave(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleSave");
}

id objc_msgSend__scheduleUpdateTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleUpdateTimer");
}

id objc_msgSend__serviceDetailsWithEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serviceDetailsWithEntry:");
}

id objc_msgSend__sessionForTaskState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sessionForTaskState:");
}

id objc_msgSend__sessionIDForTaskState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sessionIDForTaskState:");
}

id objc_msgSend__setDeveloperModeEnabled_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDeveloperModeEnabled:error:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__shouldIncludeServiceWithDomain_fromBundleRecord_applicationIdentifier_developerModeEnabled_enterpriseContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldIncludeServiceWithDomain:fromBundleRecord:applicationIdentifier:developerModeEnabled:enterpriseContext:");
}

id objc_msgSend__storageForArchiving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storageForArchiving");
}

id objc_msgSend__storageFromArchivedData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storageFromArchivedData:error:");
}

id objc_msgSend__taskStateForDomain_downloadRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_taskStateForDomain:downloadRoute:");
}

id objc_msgSend__updateAllEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAllEntries:");
}

id objc_msgSend__updateStorageItemWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStorageItemWithData:error:");
}

id objc_msgSend__updateableEntries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateableEntries");
}

id objc_msgSend__verifyExtendedValidationOfTrust_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifyExtendedValidationOfTrust:error:");
}

id objc_msgSend__waitForSiteApprovalWithServiceSpecifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_waitForSiteApprovalWithServiceSpecifier:completionHandler:");
}

id objc_msgSend_addEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntries:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_additionalServiceDetailsDirectoryURLForApplicationIdentifier_createParentIfNeeded_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appClipMetadata");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleDomain");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_applicationPersistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationPersistentIdentifier");
}

id objc_msgSend_applicationVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationVersion");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedDomainsForManagedApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedDomainsForManagedApps");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_beginListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginListening");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buffer");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleVersion");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelTaskWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTaskWithError:");
}

id objc_msgSend_cancellationError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancellationError");
}

id objc_msgSend_canonicalizeEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalizeEntries:");
}

id objc_msgSend_canonicalizeObjectAtAddress_objectCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalizeObjectAtAddress:objectCache:");
}

id objc_msgSend_canonicalizeWithObjectCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalizeWithObjectCache:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_cleanOldSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanOldSettings");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clear");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandlers");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containerURLReturningError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerURLReturningError:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_databaseVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseVersion");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateScheduled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateScheduled");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionOfAllPrefs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionOfAllPrefs");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainRequiringModeOfOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainRequiringModeOfOperation:");
}

id objc_msgSend_downloadAASAFileForDomain_applicationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadAASAFileForDomain:applicationIdentifier:completionHandler:");
}

id objc_msgSend_downloadAASAFileForDomain_applicationIdentifier_downloadRoute_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:");
}

id objc_msgSend_downloadRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadRoute");
}

id objc_msgSend_downloader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloader");
}

id objc_msgSend_downloader_didDownloadAASAFileContainingJSONObject_fromDomain_downloadRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloader:didDownloadAASAFileContainingJSONObject:fromDomain:downloadRoute:");
}

id objc_msgSend_downloader_failedToDownloadAASAFileFromDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloader:failedToDownloadAASAFileFromDomain:error:");
}

id objc_msgSend_downloader_willDownloadAASAFileFromDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloader:willDownloadAASAFileFromDomain:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encompassesDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encompassesDomain:");
}

id objc_msgSend_enterpriseState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterpriseState");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlements");
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entries");
}

id objc_msgSend_entriesForBundleRecord_enterpriseContext_developerModeEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entriesForBundleRecord:enterpriseContext:developerModeEnabled:");
}

id objc_msgSend_entriesForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entriesForDomain:");
}

id objc_msgSend_entriesForJSONObject_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entriesForJSONObject:domain:");
}

id objc_msgSend_entry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entry:");
}

id objc_msgSend_entryMatchingService_domain_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryMatchingService:domain:appID:");
}

id objc_msgSend_entryMatchingServiceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryMatchingServiceSpecifier:");
}

id objc_msgSend_enumerateActiveAASAFileDownloadsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateActiveAASAFileDownloadsWithBlock:");
}

id objc_msgSend_enumerateEntries_matchingService_domain_appID_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateEntries:matchingService:domain:appID:block:");
}

id objc_msgSend_enumerateEntriesMatchingService_domain_appID_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateEntriesMatchingService:domain:appID:block:");
}

id objc_msgSend_enumerateEntriesMatchingService_exactDomain_appID_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateEntriesMatchingService:exactDomain:appID:block:");
}

id objc_msgSend_enumerateEntriesMatchingServiceSpecifier_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateEntriesMatchingServiceSpecifier:block:");
}

id objc_msgSend_enumerateEntriesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateEntriesWithBlock:");
}

id objc_msgSend_enumerateJSONResourceURLsForBundleURL_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateJSONResourceURLsForBundleURL:block:");
}

id objc_msgSend_enumerateJSONResourceURLsForDirectoryAtURL_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateJSONResourceURLsForDirectoryAtURL:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateSettingsDictionariesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateSettingsDictionariesWithBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_evaluateWithURLComponents_auditToken_matchingPattern_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithURLComponents:auditToken:matchingPattern:");
}

id objc_msgSend_evaluateWithURLComponents_substitutionVariables_auditToken_matchingPattern_index_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithURLComponents:substitutionVariables:auditToken:matchingPattern:index:");
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedContentLength");
}

id objc_msgSend_failWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithError:");
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fields");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generation");
}

id objc_msgSend_generationByIncrementingSelf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generationByIncrementingSelf");
}

id objc_msgSend_getKnowledgeUUID_andSequenceNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getKnowledgeUUID:andSequenceNumber:");
}

id objc_msgSend_getValue_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValue:size:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initForBundleRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForBundleRecord:");
}

id objc_msgSend_initWithApplicationIdentifier_service_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationIdentifier:service:domain:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithBundleIdentifierOfSystemPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifierOfSystemPlaceholder:error:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:options:error:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDownloader_database_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDownloader:database:");
}

id objc_msgSend_initWithDownloader_domain_downloadRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDownloader:domain:downloadRoute:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithHost_port_wildcard_modeOfOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHost:port:wildcard:modeOfOperation:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:capacity:");
}

id objc_msgSend_initWithServiceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceSpecifier:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSince1970:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleInternal");
}

id objc_msgSend_isApplicationIdentifierEligibleForManagedMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicationIdentifierEligibleForManagedMode:error:");
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBeta");
}

id objc_msgSend_isDiscretionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiscretionary");
}

id objc_msgSend_isDownloadable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownloadable");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToApplicationIdentifierIgnoringPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToApplicationIdentifierIgnoringPrefix:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFastCheckEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFastCheckEnabled");
}

id objc_msgSend_isFullySpecified(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFullySpecified");
}

id objc_msgSend_isManaging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManaging");
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProfileValidated");
}

id objc_msgSend_isSystemPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemPlaceholder");
}

id objc_msgSend_isUPPValidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUPPValidated");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_isVersion_greaterThanOrEqualToVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVersion:greaterThanOrEqualToVersion:");
}

id objc_msgSend_isWildcard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWildcard");
}

id objc_msgSend_lastCheckedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastCheckedDate");
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastError");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchServicesDatabaseGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchServicesDatabaseGeneration");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_logAASAFileDownloadEventWithDomain_route_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logAASAFileDownloadEventWithDomain:route:");
}

id objc_msgSend_logToFile_verbosity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logToFile:verbosity:");
}

id objc_msgSend_maximumRetryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumRetryCount");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "member:");
}

id objc_msgSend_minusOrderedSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusOrderedSet:");
}

id objc_msgSend_modeOfOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modeOfOperation");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_needsFirstDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsFirstDownload");
}

id objc_msgSend_nextCheckDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextCheckDate");
}

id objc_msgSend_nonWildcardDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonWildcardDomain");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithChar:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objCType");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKey_ofClass_valuesOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:valuesOfClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orderedSetWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSetWithObject:");
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalRequest");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_patternListWithDetailsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patternListWithDetailsDictionary:");
}

id objc_msgSend_patternListWithDetailsDictionary_defaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patternListWithDetailsDictionary:defaults:");
}

id objc_msgSend_patterns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patterns");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_postChangeNotificationForServiceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postChangeNotificationForServiceSpecifier:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_propertyList_isValidForFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyList:isValidForFormat:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rawValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawValue");
}

id objc_msgSend_receiveSIGTERMSignal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveSIGTERMSignal");
}

id objc_msgSend_redactedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redactedDescription");
}

id objc_msgSend_removeAllEntries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllEntries");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeEntries:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeSettingsForKeys_serviceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSettingsForKeys:serviceSpecifier:");
}

id objc_msgSend_removeSettingsForKeys_serviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSettingsForKeys:serviceType:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeTask");
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryCount");
}

id objc_msgSend_retryIntervalAfterReachLimitWithFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryIntervalAfterReachLimitWithFailure:");
}

id objc_msgSend_retryIntervalAfterSuccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryIntervalAfterSuccess:");
}

id objc_msgSend_saveReturningError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveReturningError:");
}

id objc_msgSend_scheduleNextSave(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleNextSave");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSpecifier");
}

id objc_msgSend_serviceSpecifiersForApplicationIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSpecifiersForApplicationIdentifier:error:");
}

id objc_msgSend_serviceSpecifiersWithEntitlementValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSpecifiersWithEntitlementValue:error:");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceType");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setApplicationPersistentIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationPersistentIdentifier:");
}

id objc_msgSend_setApplicationVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationVersion:");
}

id objc_msgSend_setArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArray:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setCancellationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancellationError:");
}

id objc_msgSend_setDatabaseVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabaseVersion:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setEnterpriseState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnterpriseState:");
}

id objc_msgSend_setEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEntries:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHTTPCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPCookieAcceptPolicy:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setHTTPShouldHandleCookies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPShouldHandleCookies:");
}

id objc_msgSend_setHTTPShouldSetCookies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPShouldSetCookies:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastCheckedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastCheckedDate:");
}

id objc_msgSend_setLastError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastError:");
}

id objc_msgSend_setLaunchServicesDatabaseGeneration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchServicesDatabaseGeneration:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPatterns_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPatterns:");
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPort:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettings:");
}

id objc_msgSend_setSettingsDictionary_forServiceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettingsDictionary:forServiceSpecifier:");
}

id objc_msgSend_setSubstitutionVariables_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubstitutionVariables:");
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskDescription:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLCredentialStorage:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_set_performsEVCertCheck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_performsEVCertCheck:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_settingsDictionaryForServiceSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsDictionaryForServiceSpecifier:");
}

id objc_msgSend_settingsGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsGeneration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDatabase");
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLogger");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPrefs");
}

id objc_msgSend_sharedSecurityGuard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSecurityGuard");
}

id objc_msgSend_sortWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortWithOptions:usingComparator:");
}

id objc_msgSend_sortedArrayWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayWithOptions:usingComparator:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_storageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageURL");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringForObjectValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForObjectValue:");
}

id objc_msgSend_stringFromByteCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromByteCount:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substitutionVariableListWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substitutionVariableListWithDictionary:");
}

id objc_msgSend_substitutionVariables(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substitutionVariables");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_swc_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swc_decodeObjectOfClass:forKey:");
}

id objc_msgSend_swc_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swc_decodeObjectOfClasses:forKey:");
}

id objc_msgSend_swc_isBuiltForDevelopment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swc_isBuiltForDevelopment");
}

id objc_msgSend_swc_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swc_unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "task");
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskDescription");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingQueue");
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionOrderedSet:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "update");
}

id objc_msgSend_updateAASAFileForDomain_applicationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAASAFileForDomain:applicationIdentifier:completionHandler:");
}

id objc_msgSend_updateAASAFileForDomain_applicationIdentifier_downloadRoute_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:");
}

id objc_msgSend_updateCachedDomainsForEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCachedDomainsForEntries:");
}

id objc_msgSend_updateEntriesForAllBundlesIgnoringCurrentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEntriesForAllBundlesIgnoringCurrentState:");
}

id objc_msgSend_updateEntriesForDomain_canonicalEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEntriesForDomain:canonicalEntries:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_verifyExtendedValidation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyExtendedValidation");
}

id objc_msgSend_verifyTrust_allowInstalledRootCertificates_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyTrust:allowInstalledRootCertificates:error:");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
