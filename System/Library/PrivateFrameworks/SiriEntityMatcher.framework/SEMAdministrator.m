@implementation SEMAdministrator

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

+ (id)sharedQueue
{
  if (qword_25441F910 != -1)
    dispatch_once(&qword_25441F910, &unk_25175F1F8);
  return (id)qword_25441F908;
}

- (SEMAdministrator)init
{
  SEMAdminXPCClient *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  SEMAdministrator *v9;

  v3 = objc_alloc_init(SEMAdminXPCClient);
  v4 = (void *)objc_opt_class();
  objc_msgSend_sharedQueue(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (SEMAdministrator *)objc_msgSend_initWithAdminService_timeout_queue_(self, v8, (uint64_t)v3, v7, 30.0);

  return v9;
}

- (SEMAdministrator)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v9;
  id v10;
  SEMAdministrator *v11;
  SEMAdministrator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SEMAdministrator;
  v11 = -[SEMAdministrator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_adminService, a3);
    v12->_timeout = a4;
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  SEMAdminService *adminService;
  const char *v11;
  _QWORD v12[4];
  void (**v13)(id, uint64_t);
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v7, v8))
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SEMAdministrator triggerMaintenance:completion:]";
      _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v6)
      v6[2](v6, 3);
  }
  else
  {
    adminService = self->_adminService;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_2462E7E90;
    v12[3] = &unk_25175F220;
    v13 = v6;
    objc_msgSend_triggerMaintenance_completion_(adminService, v11, v4, v12);

  }
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  SEMAdminService *adminService;
  const char *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v8, v9))
  {
    v10 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SEMAdministrator beginEvaluation:completion:]";
      _os_log_impl(&dword_2462C4000, v10, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v11 = qword_25441F970;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[SEMAdministrator beginEvaluation:completion:]";
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_2462C4000, v11, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation with serializedSets: %@", buf, 0x16u);
      }
      adminService = self->_adminService;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_2462E80A8;
      v14[3] = &unk_25175F220;
      v15 = v7;
      objc_msgSend_beginEvaluation_completion_(adminService, v13, (uint64_t)v6, v14);

      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SEMAdministrator beginEvaluation:completion:]";
      _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s serializedSets cannot be nil.", buf, 0xCu);
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (v7)
LABEL_11:
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 3);
LABEL_12:

}

- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = a4;
  v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v9 = objc_msgSend_count(v5, v7, v8);
  v11 = (void *)objc_msgSend_initWithCapacity_(v6, v10, v9);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v5;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v33;
    while (2)
    {
      v18 = 0;
      v19 = v16;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
        v21 = objc_alloc(MEMORY[0x24BE156D0]);
        v31 = v19;
        v23 = (void *)objc_msgSend_initWithData_error_(v21, v22, v20, &v31);
        v16 = v31;

        if (!v23)
        {
          v26 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v37 = "-[SEMAdministrator beginEvaluationWithSerializedSets:completion:]";
            v38 = 2112;
            v39 = v20;
            v40 = 2112;
            v41 = v16;
            _os_log_error_impl(&dword_2462C4000, v26, OS_LOG_TYPE_ERROR, "%s Failed to initialize serialized set from data: %@ error: %@", buf, 0x20u);
          }
          v27 = v30;
          if (v30)
            (*((void (**)(id, uint64_t))v30 + 2))(v30, 3);

          goto LABEL_17;
        }
        objc_msgSend_addObject_(v11, v24, (uint64_t)v23);

        ++v18;
        v19 = v16;
      }
      while (v15 != v18);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v25, (uint64_t)&v32, v42, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }

  v27 = v30;
  objc_msgSend_beginEvaluation_completion_(self, v28, (uint64_t)v11, v30);
LABEL_17:

}

- (unsigned)beginEvaluation:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2462E844C;
  v8[3] = &unk_25175F248;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  LOBYTE(self) = objc_msgSend__synchronouslyWrapRequest_(self, v6, (uint64_t)v8);

  return self;
}

- (unsigned)beginEvaluationWithSerializedSets:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2462E84DC;
  v8[3] = &unk_25175F248;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  LOBYTE(self) = objc_msgSend__synchronouslyWrapRequest_(self, v6, (uint64_t)v8);

  return self;
}

- (void)endEvaluation:(id)a3
{
  void (**v4)(id, uint64_t);
  const char *v5;
  uint64_t v6;
  int isCustomerInstall;
  NSObject *v8;
  _BOOL4 v9;
  SEMAdminService *adminService;
  const char *v11;
  _QWORD v12[4];
  void (**v13)(id, uint64_t);
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  isCustomerInstall = objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v5, v6);
  v8 = qword_25441F970;
  v9 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
  if (isCustomerInstall)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SEMAdministrator endEvaluation:]";
      _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4)
      v4[2](v4, 3);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SEMAdministrator endEvaluation:]";
      _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, "%s Submitting request to end evaluation", buf, 0xCu);
    }
    adminService = self->_adminService;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_2462E865C;
    v12[3] = &unk_25175F220;
    v13 = v4;
    objc_msgSend_endEvaluation_(adminService, v11, (uint64_t)v12);

  }
}

- (unsigned)endEvaluation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_2462E879C;
  v3[3] = &unk_25175F270;
  v3[4] = self;
  return objc_msgSend__synchronouslyWrapRequest_(self, a2, (uint64_t)v3);
}

- (unsigned)_synchronouslyWrapRequest:(id)a3
{
  void (**v4)(id, _QWORD *);
  dispatch_group_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  dispatch_time_t v10;
  NSObject *queue;
  unsigned __int8 v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = (void (**)(id, _QWORD *))a3;
  v5 = dispatch_group_create();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2462E894C;
  v18[3] = &unk_25175F298;
  v20 = &v21;
  v18[4] = self;
  v7 = v5;
  v19 = v7;
  v8 = (void *)MEMORY[0x2495571C4](v18);
  dispatch_group_enter(v7);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = sub_2462E8A74;
  v16[3] = &unk_25175F2E8;
  v16[4] = self;
  v9 = v8;
  v17 = v9;
  v4[2](v4, v16);
  v10 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v7, v10))
  {
    queue = self->_queue;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = sub_2462E8B00;
    v14[3] = &unk_25175EBA8;
    v15 = v9;
    dispatch_sync(queue, v14);

  }
  v12 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_adminService, 0);
}

@end
