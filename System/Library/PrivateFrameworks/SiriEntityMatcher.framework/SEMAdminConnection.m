@implementation SEMAdminConnection

- (SEMAdminConnection)initWithSettings:(id)a3 indexSiteManager:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  SEMAdminConnection *v12;
  SEMAdminConnection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SEMAdminConnection;
  v12 = -[SEMAdminConnection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_settings, a3);
    objc_storeStrong((id *)&v13->_manager, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_246303494;
  block[3] = &unk_251783108;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)endEvaluation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_246303700;
  v7[3] = &unk_251783130;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2463038E4;
  block[3] = &unk_251783158;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (BOOL)_isCustomerInstall:(id)a3
{
  void (**v3)(id, uint64_t);
  const char *v4;
  uint64_t v5;
  int isCustomerInstall;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, uint64_t))a3;
  isCustomerInstall = objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, v4, v5);
  if (isCustomerInstall)
  {
    v7 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[SEMAdminConnection _isCustomerInstall:]";
      _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v9, 0xCu);
    }
    if (v3)
      v3[2](v3, 2);
  }

  return isCustomerInstall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
