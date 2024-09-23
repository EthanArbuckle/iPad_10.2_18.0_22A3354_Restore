@implementation CCDServer

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_opt_new(NSOperationQueue, a2);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_opt_new(CCDEnrollmentProvisionallyEnrollRequest, v8);
  objc_msgSend(v9, "setNonce:", v7);

  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:](self, "_startProcessForEnrollmentRequest:completionBlock:", v9, v6);
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = +[CCDAuthKitUtilities shouldActivateAnisette](CCDAuthKitUtilities, "shouldActivateAnisette");
  v6 = v5;
  v9 = *(NSObject **)(DEPLogObjects(v5, v7, v8) + 8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Retrieving cloud configuration and mid", buf, 2u);
    }
    -[CCDServer fetchConfigurationAndActivateAnisetteWithCompletionBlock:](self, "fetchConfigurationAndActivateAnisetteWithCompletionBlock:", v4);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Only retrieving cloud configuration", v11, 2u);
    }
    -[CCDServer fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:](self, "fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:", v4);
  }

}

- (void)fetchConfigurationAndActivateAnisetteWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[3];
  char v34;

  v4 = a3;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10000928C;
  v27[4] = sub_10000929C;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10000928C;
  v25[4] = sub_10000929C;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10000928C;
  v23[4] = sub_10000929C;
  v24 = objc_alloc_init((Class)NSLock);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000092A4;
  v15[3] = &unk_100018A78;
  v17 = v23;
  v18 = v31;
  v5 = v4;
  v16 = v5;
  v19 = v29;
  v20 = v27;
  v21 = v25;
  v22 = v33;
  +[CCDAuthKitUtilities midWithCompletion:](CCDAuthKitUtilities, "midWithCompletion:", v15);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009378;
  v7[3] = &unk_100018AA0;
  v9 = v23;
  v10 = v33;
  v6 = v5;
  v8 = v6;
  v11 = v29;
  v12 = v27;
  v13 = v25;
  v14 = v31;
  -[CCDServer fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:](self, "fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:", v7);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

- (void)fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new(CCDEnrollmentRetrieveCloudConfigurationRequest, v5);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:](self, "_startProcessForEnrollmentRequest:completionBlock:", v6, v4);

}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new(CCDEnrollmentRetrieveCloudConfigurationWithoutValidationRequest, v5);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:](self, "_startProcessForEnrollmentRequest:completionBlock:", v6, v4);

}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new(CCDEnrollmentUnenrollRequest, v5);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:](self, "_startProcessForEnrollmentRequest:completionBlock:", v6, v4);

}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_opt_new(CCDEnrollmentUploadPushTokenRequest, v11);
  objc_msgSend(v12, "setPushToken:", v10);

  objc_msgSend(v12, "setPushTopic:", v9);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:](self, "_startProcessForEnrollmentRequest:completionBlock:", v12, v8);

}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CCDServer _requestForDeviceUploadRequestType:userCredentials:](self, "_requestForDeviceUploadRequestType:userCredentials:", 0, a3));
  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:](self, "_startProcessForDeviceUploadRequest:completionBlock:", v7, v6);

}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CCDServer _requestForDeviceUploadRequestType:userCredentials:](self, "_requestForDeviceUploadRequestType:userCredentials:", 1, a3));
  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:](self, "_startProcessForDeviceUploadRequest:completionBlock:", v7, v6);

}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CCDServer _requestForDeviceUploadRequestType:userCredentials:](self, "_requestForDeviceUploadRequestType:userCredentials:", 2, a4));
  objc_msgSend(v10, "setOrganization:", v9);

  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:](self, "_startProcessForDeviceUploadRequest:completionBlock:", v10, v8);
}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CCDServer _requestForDeviceUploadRequestType:userCredentials:](self, "_requestForDeviceUploadRequestType:userCredentials:", 3, a4));
  objc_msgSend(v10, "setSubmitDeviceRequestPayload:", v9);

  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:](self, "_startProcessForDeviceUploadRequest:completionBlock:", v10, v8);
}

- (void)_startProcessForDeviceUploadRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDServer _operationForDeviceUploadRequest:](self, "_operationForDeviceUploadRequest:", a3));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000098E0;
  v9[3] = &unk_100018AC8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "setDeviceUploadCompletionBlock:", v9);
  -[CCDServer _addOperationToQueue:](self, "_addOperationToQueue:", v7);

}

- (id)_requestForDeviceUploadRequestType:(int64_t)a3 userCredentials:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v6 = a4;
  if ((unint64_t)a3 > 3)
    v7 = 0;
  else
    v7 = (void *)objc_opt_new(*off_100018B10[a3], v5);
  objc_msgSend(v7, "setUserCredentials:", v6);

  return v7;
}

- (id)_operationForDeviceUploadRequest:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "requestType");
  if (v4 > 3)
    v6 = 0;
  else
    v6 = (void *)objc_opt_new(*off_100018B30[v4], v5);
  objc_msgSend(v6, "setTeslaRequest:", v3);

  return v6;
}

- (void)pingWithCompletionBlock:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a3 + 2))(a3, 1, 0, 0);
}

- (void)_startProcessForEnrollmentRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CCDServer *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v9 = (void *)objc_opt_new(CCDRetrieveClientCertificateOperation, v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009A9C;
  v12[3] = &unk_100018AF0;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "setCertificateRetrievalCompletionBlock:", v12);
  -[CCDServer _addOperationToQueue:](self, "_addOperationToQueue:", v9);

}

- (void)_addOperationToQueue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v7 = *(NSObject **)(DEPLogObjects(v4, v5, v6) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding operation to the queue: %@", (uint8_t *)&v9, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDServer operationQueue](self, "operationQueue"));
  objc_msgSend(v8, "addOperation:", v4);

}

- (id)_operationForEnrollmentRequest:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "requestType");
  if (v4 > 4)
    v6 = 0;
  else
    v6 = (void *)objc_opt_new(*off_100018B50[v4], v5);
  objc_msgSend(v6, "setTeslaRequest:", v3);

  return v6;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
