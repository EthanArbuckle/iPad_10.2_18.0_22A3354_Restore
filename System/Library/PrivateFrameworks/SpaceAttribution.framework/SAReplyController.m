@implementation SAReplyController

- (NSUUID)controllerID
{
  SAReplyController *v2;
  NSUUID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_controllerID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setControllerID:(id)a3
{
  NSUUID *v4;
  NSUUID *controllerID;
  SAReplyController *obj;

  v4 = (NSUUID *)a3;
  obj = self;
  objc_sync_enter(obj);
  controllerID = obj->_controllerID;
  obj->_controllerID = v4;

  objc_sync_exit(obj);
}

- (void)callAppSizerHandlerWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[SAReplyController appSizerUpdateHandler](self, "appSizerUpdateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SAReplyController appSizerUpdateHandler](self, "appSizerUpdateHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v6);

  }
}

- (void)callURLSizerHandlerWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[SAReplyController urlSizerUpdateHandler](self, "urlSizerUpdateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SAReplyController urlSizerUpdateHandler](self, "urlSizerUpdateHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v6);

  }
}

- (void)callAppSizerHandlerWithResults:(id)a3 error:(id)a4 withHandlerResultBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  -[SAReplyController appSizerUpdateHandler](self, "appSizerUpdateHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SAReplyController appSizerUpdateHandler](self, "appSizerUpdateHandler");
    v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v13, v8);

    v9[2](v9, v12);
    if ((_DWORD)v12)
    {
      -[SAReplyController setAppSizerUpdateHandler:](self, "setAppSizerUpdateHandler:", 0);
      -[SAReplyController setControllerID:](self, "setControllerID:", 0);
    }
  }
  else
  {
    v9[2](v9, 0);
  }

}

- (void)callURLSizerHandlerWithResults:(id)a3 error:(id)a4 withHandlerResultsBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  -[SAReplyController urlSizerUpdateHandler](self, "urlSizerUpdateHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SAReplyController urlSizerUpdateHandler](self, "urlSizerUpdateHandler");
    v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v13, v8);

    v9[2](v9, v12);
    if ((_DWORD)v12)
      -[SAReplyController setUrlSizerUpdateHandler:](self, "setUrlSizerUpdateHandler:", 0);
  }
  else
  {
    v9[2](v9, 0);
  }

}

- (id)appSizerUpdateHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAppSizerUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)urlSizerUpdateHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUrlSizerUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlSizerUpdateHandler, 0);
  objc_storeStrong(&self->_appSizerUpdateHandler, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);
}

@end
