@implementation RPSiriDaemon

- (RPSiriDaemon)init
{
  RPSiriDaemon *v2;
  RPSiriDaemon *v3;
  RPSiriDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPSiriDaemon;
  v2 = -[RPSiriDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  RPMessageable *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  const __CFString *v23;
  _UNKNOWN **v24;

  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(-[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue"));
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v13 = self->_messenger;
  if (v13)
  {
    if (dword_100131CB8 <= 30
      && (dword_100131CB8 != -1 || _LogCategory_Initialize(&dword_100131CB8, 30)))
    {
      LogPrintF(&dword_100131CB8, "-[RPSiriDaemon activateAndReturnError:]", 30, "Activate\n");
    }
    v23 = CFSTR("statusFlags");
    v24 = &off_10011ACF8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000AF610;
    v22[3] = &unk_100112AE0;
    v22[4] = self;
    -[RPMessageable registerEventID:options:handler:](v13, "registerEventID:options:handler:", CFSTR("_siA"), v16, v22);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AF61C;
    v21[3] = &unk_100111BF8;
    v21[4] = self;
    -[RPMessageable registerRequestID:options:handler:](v13, "registerRequestID:options:handler:", CFSTR("_siriStart"), v16, v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AF6C0;
    v20[3] = &unk_100111BF8;
    v20[4] = self;
    -[RPMessageable registerRequestID:options:handler:](v13, "registerRequestID:options:handler:", CFSTR("_siriStop"), v16, v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AF6D4;
    v19[3] = &unk_100111BF8;
    v19[4] = self;
    -[RPMessageable registerRequestID:options:handler:](v13, "registerRequestID:options:handler:", CFSTR("_siriStartWhileRecording"), v16, v19);

  }
  else
  {
    v14 = RPErrorF(4294960591, (uint64_t)"No messenger provided", v7, v8, v9, v10, v11, v12, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100131CB8 <= 90
      && (dword_100131CB8 != -1 || _LogCategory_Initialize(&dword_100131CB8, 90)))
    {
      LogPrintF(&dword_100131CB8, "-[RPSiriDaemon activateAndReturnError:]", 90, "### Activate failed: %{error}\n", v15);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v15);

  }
  return v13 != 0;
}

- (void)invalidate
{
  RPSiriAudioSession *siriAudioSession;
  RPMessageable *messenger;

  if (dword_100131CB8 <= 30 && (dword_100131CB8 != -1 || _LogCategory_Initialize(&dword_100131CB8, 30)))
    LogPrintF(&dword_100131CB8, "-[RPSiriDaemon invalidate]", 30, "Invalidate\n");
  -[RPSiriAudioSession invalidate](self->_siriAudioSession, "invalidate");
  siriAudioSession = self->_siriAudioSession;
  self->_siriAudioSession = 0;

  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_siA"));
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_siriStart"));
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", CFSTR("_siriStop"));
  messenger = self->_messenger;
  self->_messenger = 0;

}

- (void)_handleSiriAudio:(id)a3
{
  id v4;
  RPSiriAudioSession *siriAudioSession;
  int v6;
  id v7;

  v4 = a3;
  siriAudioSession = self->_siriAudioSession;
  if (siriAudioSession)
  {
    v7 = v4;
    -[RPSiriAudioSession receivedSiriAudioEvent:](siriAudioSession, "receivedSiriAudioEvent:");
LABEL_3:
    v4 = v7;
    goto LABEL_8;
  }
  if (dword_100131CB8 <= 60)
  {
    v7 = v4;
    if (dword_100131CB8 != -1 || (v6 = _LogCategory_Initialize(&dword_100131CB8, 60), v4 = v7, v6))
    {
      LogPrintF(&dword_100131CB8, "-[RPSiriDaemon _handleSiriAudio:]", 60, "### Ignoring Siri audio message without audio session\n");
      goto LABEL_3;
    }
  }
LABEL_8:

}

- (void)_handleSiriStart:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  v6 = a5;
  v13 = RPErrorF(4294960561, (uint64_t)"Remote Siri not supported on this platform", v7, v8, v9, v10, v11, v12, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue(v13);
  (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(v6, 0, 0, v15);

}

- (void)_handleSiriStop:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  if (dword_100131CB8 <= 30 && (dword_100131CB8 != -1 || _LogCategory_Initialize(&dword_100131CB8, 30)))
    LogPrintF(&dword_100131CB8, "-[RPSiriDaemon _handleSiriStop:options:responseHandler:]", 30, "SiriStop: %##.32@\n", v9);
  (*((void (**)(id, void *, _QWORD, _QWORD))v8 + 2))(v8, &__NSDictionary0__struct, 0, 0);

}

- (void)_handleSiriStartWhileRecording:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v14 = a5;
  if (dword_100131CB8 <= 30 && (dword_100131CB8 != -1 || _LogCategory_Initialize(&dword_100131CB8, 30)))
    LogPrintF(&dword_100131CB8, "-[RPSiriDaemon _handleSiriStartWhileRecording:options:responseHandler:]", 30, "SiriStartWhileRecording: %##.32@\n", v18);
  v15 = RPErrorF(4294960561, (uint64_t)"Remote Siri not supported on this platform", v8, v9, v10, v11, v12, v13, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  (*((void (**)(id, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, v16);

}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_siriSenderIDS, 0);
  objc_storeStrong((id *)&self->_siriAudioSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
