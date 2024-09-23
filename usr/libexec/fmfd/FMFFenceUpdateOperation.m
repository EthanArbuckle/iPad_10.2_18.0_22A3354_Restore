@implementation FMFFenceUpdateOperation

- (FMFFenceUpdateOperation)initWithOperationType:(unint64_t)a3 fence:(id)a4 clientSession:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  FMFFenceUpdateOperation *v13;
  NSUUID *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FMFFenceUpdateOperation;
  v13 = -[FMFFenceUpdateOperation init](&v21, "init");
  if (v13)
  {
    v14 = objc_opt_new(NSUUID);
    -[FMFFenceUpdateOperation setIdentifier:](v13, "setIdentifier:", v14);

    -[FMFFenceUpdateOperation setOperationType:](v13, "setOperationType:", a3);
    -[FMFFenceUpdateOperation setFence:](v13, "setFence:", v10);
    -[FMFFenceUpdateOperation setClientSession:](v13, "setClientSession:", v11);
    -[FMFFenceUpdateOperation setUpdateCompletionBlock:](v13, "setUpdateCompletionBlock:", v12);
    if ((id)-[FMFFenceUpdateOperation operationType](v13, "operationType") == (id)2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation fence](v13, "fence"));
      objc_msgSend(v15, "setActive:", 0);

    }
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation identifier](v13, "identifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation initialized: %@ for fenceIdentifier: %@", buf, 0x16u);

    }
  }

  return v13;
}

- (void)executeWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation identifier](self, "identifier"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation executing: %@", (uint8_t *)&v8, 0xCu);

  }
  -[FMFFenceUpdateOperation setExecutionCompletionBlock:](self, "setExecutionCompletionBlock:", v4);

  -[FMFFenceUpdateOperation sendUpdateGeoFenceCommand](self, "sendUpdateGeoFenceCommand");
}

- (void)finishWithFence:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void (**v14)(void);
  int v15;
  void *v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation identifier](self, "identifier"));
    v15 = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation: %@ finishWithFence %@", (uint8_t *)&v15, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation updateCompletionBlock](self, "updateCompletionBlock"));

  if (v11)
  {
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation updateCompletionBlock](self, "updateCompletionBlock"));
    ((void (**)(_QWORD, id, id))v12)[2](v12, v6, v7);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation executionCompletionBlock](self, "executionCompletionBlock"));

  if (v13)
  {
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation executionCompletionBlock](self, "executionCompletionBlock"));
    v14[2]();

  }
}

- (void)sendUpdateGeoFenceCommand
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation fence](self, "fence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation clientSession](self, "clientSession"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021C08;
  v6[3] = &unk_1000995E8;
  v6[4] = self;
  objc_msgSend(v3, "updateFence:clientSession:completion:", v4, v5, v6);

}

- (void)terminateWithFences:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v32;
  FMFFenceUpdateOperation *v33;
  id v34;
  uint64_t v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;

  v4 = a3;
  if ((id)-[FMFFenceUpdateOperation operationType](self, "operationType") == (id)2)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation identifier](self, "identifier"));
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      v8 = "FMFFenceUpdateOperation: %@ updateWithFences but we are deleting.";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);

      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (!-[FMFFenceUpdateOperation isUpdateGeoFenceCompleted](self, "isUpdateGeoFenceCompleted"))
  {
    v28 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation identifier](self, "identifier"));
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      v8 = "FMFFenceUpdateOperation: %@ updateWithFences but update is not over";
      goto LABEL_25;
    }
LABEL_26:
    v16 = v6;
    goto LABEL_32;
  }
  v35 = objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation fence](self, "fence"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation fence](self, "fence"));
  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceUpdateOperation identifier](self, "identifier"));
    *(_DWORD *)buf = 138412546;
    v46 = v12;
    v47 = 2112;
    v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation: %@ updateWithFences: %@", buf, 0x16u);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36 = v4;
  v13 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v13)
  {
    v16 = (void *)v35;
    goto LABEL_31;
  }
  v14 = v13;
  v32 = v9;
  v33 = self;
  v34 = v4;
  v15 = *(_QWORD *)v41;
  v16 = (void *)v35;
  v17 = v36;
  v38 = *(_QWORD *)v41;
  while (2)
  {
    v18 = 0;
    v39 = v14;
    do
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(v17);
      v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trigger", v32));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trigger"));
      if (!objc_msgSend(v20, "isEqualToString:", v21))
        goto LABEL_19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recipients"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recipients"));
      if (!objc_msgSend(v22, "isEqualToArray:", v23))
        goto LABEL_18;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "type"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "type"));
      if (!objc_msgSend(v24, "isEqualToString:", v25))
      {

        v15 = v38;
        v14 = v39;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "placemark"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "placemark"));
      v37 = objc_msgSend(v26, "isEqual:", v27);

      v16 = (void *)v35;
      v17 = v36;

      v15 = v38;
      v14 = v39;
      if (v37)
      {
        v29 = sub_100011D0C();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation: found fence matching current fence.", buf, 2u);
        }

        v9 = v19;
        self = v33;
        -[FMFFenceUpdateOperation setUpdatedFence:](v33, "setUpdatedFence:", v9);
        v4 = v34;
        goto LABEL_31;
      }
LABEL_20:
      v18 = (char *)v18 + 1;
    }
    while (v14 != v18);
    v14 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
      continue;
    break;
  }
  self = v33;
  v4 = v34;
  v9 = v32;
LABEL_31:

  -[FMFFenceUpdateOperation finishWithFence:error:](self, "finishWithFence:error:", v9, 0);
LABEL_32:

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (FMFFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (FMFFence)updatedFence
{
  return self->_updatedFence;
}

- (void)setUpdatedFence:(id)a3
{
  objc_storeStrong((id *)&self->_updatedFence, a3);
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (FMFClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
  objc_storeStrong((id *)&self->_clientSession, a3);
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void)setUpdateCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)executionCompletionBlock
{
  return self->_executionCompletionBlock;
}

- (void)setExecutionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isUpdateGeoFenceCompleted
{
  return self->_isUpdateGeoFenceCompleted;
}

- (void)setIsUpdateGeoFenceCompleted:(BOOL)a3
{
  self->_isUpdateGeoFenceCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionCompletionBlock, 0);
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_updatedFence, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
