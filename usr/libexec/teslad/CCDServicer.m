@implementation CCDServicer

- (CCDServicer)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v7;
  id v8;
  CCDServicer *v9;
  CCDServicer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCDServicer;
  v9 = -[CCDServicer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeStrong((id *)&v10->_server, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CCDServicer;
  -[CCDServicer dealloc](&v3, "dealloc");
}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v8, "provisionallyEnrollWithNonce:completionBlock:", v7, v6);

}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v5, "fetchConfigurationWithCompletionBlock:", v4);

}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v5, "fetchConfigurationWithoutValidationWithCompletionBlock:", v4);

}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v5, "unenrollWithCompletionBlock:", v4);

}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v8, "retrieveDeviceUploadOrganizationsWithCredentials:completionBlock:", v7, v6);

}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v8, "retrieveDeviceUploadRequestTypesWithCredentials:completionBlock:", v7, v6);

}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v11, "retrieveDeviceUploadSoldToIdsForOrganization:credentials:completionBlock:", v10, v9, v8);

}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v11, "submitDeviceUploadRequest:credentials:completionBlock:", v10, v9, v8);

}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[DMCFeatureFlags isDEPPushEnabled](DMCFeatureFlags, "isDEPPushEnabled");
  if ((v11 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
    objc_msgSend(v14, "syncDEPPushToken:pushTopic:completionBlock:", v8, v9, v10);

  }
  else
  {
    v15 = *(NSObject **)(DEPLogObjects(v11, v12, v13) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DEPPush feature flag is not enabled. Return...", v16, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);

  }
}

- (void)pingWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  objc_msgSend(v5, "pingWithCompletionBlock:", v4);

}

- (CCDServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
