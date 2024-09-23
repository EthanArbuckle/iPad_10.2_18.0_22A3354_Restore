@implementation AVCaptureDevice

+ (void)crl_checkAuthorizationForMediaType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  char *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void (*v12)(void);
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (char *)objc_msgSend(a1, "authorizationStatusForMediaType:", v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004E19C;
  v13[3] = &unk_10122F678;
  v9 = v7;
  v14 = v9;
  v10 = objc_retainBlock(v13);
  v11 = v10;
  if ((unint64_t)(v8 - 1) < 2)
  {
    v12 = (void (*)(void))v10[2];
    goto LABEL_6;
  }
  if (!v8)
  {
    +[AVCaptureDevice requestAccessForMediaType:completionHandler:](AVCaptureDevice, "requestAccessForMediaType:completionHandler:", v6, v10);
    goto LABEL_8;
  }
  if (v8 == (char *)3)
  {
    v12 = (void (*)(void))v10[2];
LABEL_6:
    v12();
  }
LABEL_8:

}

@end
