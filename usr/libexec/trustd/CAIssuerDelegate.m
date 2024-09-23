@implementation CAIssuerDelegate

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "context");
  if (v8)
    v9 = v8[34];
  else
    v9 = 0;
  v12.receiver = self;
  v12.super_class = (Class)CAIssuerDelegate;
  v10 = -[TrustURLSessionDelegate fetchNext:context:](&v12, "fetchNext:context:", v7, v6);

  if (!v10 && v9)
    ++*(_DWORD *)(v9 + 24);
  return v10;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  const __CFData *v23;
  SecCertificateRef v24;
  SecCertificateRef v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double Current;
  NSObject *v35;
  _QWORD *v36;
  NSObject *v37;
  id *v38;
  void ***p_block;
  _QWORD *v40;
  double v41;
  void **block;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  uint64_t *v47;
  void **v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  id v64;
  objc_super v65;
  _BYTE buf[24];
  void *v67;
  uint64_t v68;
  void *v69;
  double v70;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v65.receiver = self;
  v65.super_class = (Class)CAIssuerDelegate;
  -[TrustURLSessionDelegate URLSession:task:didCompleteWithError:](&v65, "URLSession:task:didCompleteWithError:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "taskId"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v12));
  v14 = v13;
  if (v13)
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = (id)0xAAAAAAAAAAAAAAAALL;
    v64 = objc_msgSend(v13, "context");
    v15 = v62[3];
    if (!v15)
    {
      -[TrustURLSessionDelegate removeTask:](self, "removeTask:", v12);
LABEL_37:
      _Block_object_dispose(&v61, 8);
      goto LABEL_38;
    }
    v41 = *(double *)(v15 + 272);
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = sub_100038484;
    v59 = sub_100038494;
    v60 = 0;
    if (v10)
    {
      v16 = sub_100011628("caissuer");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URL"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to download issuer %@, with error %@", buf, 0x16u);

      }
      if (v41 != 0.0)
        ++*(_DWORD *)(*(_QWORD *)&v41 + 40);
      goto LABEL_23;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "response"));

    if (!v22)
      goto LABEL_23;
    v23 = (const __CFData *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "response"));
    v24 = SecCertificateCreateWithData(0, v23);
    v25 = v24;
    if (v24)
      goto LABEL_14;
    v26 = SecCMSCertificatesOnlyMessageCopyCertificates(v23);
    if (!v26)
    {
      v24 = (SecCertificateRef)SecCertificateCreateWithPEM(0, v23);
      v25 = v24;
      if (v24)
      {
LABEL_14:
        *(_QWORD *)buf = v24;
        v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 1));
        CFRelease(v25);
        goto LABEL_18;
      }
      v26 = 0;
    }
LABEL_18:

    v27 = (void *)v56[5];
    v56[5] = v26;

    if (v41 != 0.0)
    {
      v28 = (void *)v56[5];
      if (v28)
      {
        if ((unint64_t)objc_msgSend(v28, "count") >= 2)
          *(_BYTE *)(*(_QWORD *)&v41 + 45) = 1;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)&v41 + 44) = 1;
      }
    }
LABEL_23:
    v29 = v56[5];
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URL"));
      objc_msgSend(v14, "maxAge");
      v33 = v32;
      Current = CFAbsoluteTimeGetCurrent();
      if (qword_100082CE0 != -1)
      {
        v41 = Current;
        dispatch_once(&qword_100082CE0, &stru_100076AC8);
        Current = v41;
      }
      if (qword_100082CE8)
      {
        v35 = *(NSObject **)qword_100082CE8;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)&buf[8] = 0x40000000;
        *(_QWORD *)&buf[16] = sub_100037064;
        v67 = &unk_100076AE8;
        v68 = v29;
        v69 = v31;
        v70 = v33 + Current;
        dispatch_sync(v35, buf);
      }

      v36 = (_QWORD *)v62[3];
      if (v36)
        v36 = (_QWORD *)v36[2];
      v37 = v36;
      v48 = _NSConcreteStackBlock;
      v49 = 3221225472;
      v50 = sub_10003849C;
      v51 = &unk_100076C58;
      v38 = &v52;
      v52 = v14;
      v53 = &v61;
      v54 = &v55;
      p_block = &v48;
    }
    else
    {
      if (!-[CAIssuerDelegate fetchNext:context:](self, "fetchNext:context:", v8, v14))
      {
LABEL_36:
        -[TrustURLSessionDelegate removeTask:](self, "removeTask:", v12, *(_QWORD *)&v41, block, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55);
        _Block_object_dispose(&v55, 8);

        goto LABEL_37;
      }
      v40 = (_QWORD *)v62[3];
      if (v40)
        v40 = (_QWORD *)v40[2];
      v37 = v40;
      block = _NSConcreteStackBlock;
      v43 = 3221225472;
      v44 = sub_1000384D8;
      v45 = &unk_100076C80;
      v38 = &v46;
      v46 = v14;
      v47 = &v61;
      p_block = &block;
    }
    dispatch_async(v37, p_block);

    goto LABEL_36;
  }
  v20 = sub_100011628("http");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", buf, 0xCu);
  }

LABEL_38:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  const void *v16;
  int v17;
  void *v18;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "originalRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskId"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v9));
  v11 = v10;
  if (!v10)
  {
    v16 = sub_100011628("http");
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_7;
  }
  v12 = objc_msgSend(v10, "context");
  if (v12)
  {
    v13 = v12[34];
    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskInterval"));
      -[NSObject duration](v14, "duration");
      *(_QWORD *)(v13 + 32) += (unint64_t)(v15 * 1000000000.0);
LABEL_7:

    }
  }

}

@end
