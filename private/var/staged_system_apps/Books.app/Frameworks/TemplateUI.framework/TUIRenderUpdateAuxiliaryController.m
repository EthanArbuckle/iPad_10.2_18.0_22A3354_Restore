@implementation TUIRenderUpdateAuxiliaryController

- (TUIRenderUpdateAuxiliaryController)init
{
  TUIRenderUpdateAuxiliaryController *v2;
  TUIRenderUpdateAuxiliaryController *v3;
  TUIRenderModelAuxiliary *currentModel;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIRenderUpdateAuxiliaryController;
  v2 = -[TUIRenderUpdateAuxiliaryController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    currentModel = v2->_currentModel;
    v2->_currentModel = 0;

    v5 = dispatch_queue_create("TUIRenderUpdateAuxiliaryController.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (id)registerDelegate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_EE768;
  v16 = sub_EE778;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EE780;
  block[3] = &unk_23D7A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  TUIRenderUpdateAuxiliaryController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EE838;
  block[3] = &unk_23D7D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)updateWithRenderModel:(id)a3 transactionGroup:(id)a4
{
  id v7;
  void *v8;
  TUIRenderModelAuxiliary *v9;

  v9 = (TUIRenderModelAuxiliary *)a3;
  v7 = a4;
  if (self->_currentModel != v9 || !-[TUIRenderModelAuxiliary isEqualToRenderModel:](v9, "isEqualToRenderModel:", v9))
  {
    objc_storeStrong((id *)&self->_currentModel, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateAuxiliaryController delegate](self, "delegate"));
    objc_msgSend(v8, "applyUpdate:", v9);

  }
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (TUIRenderUpdateAuxiliaryControllerDelegate)delegate
{
  return (TUIRenderUpdateAuxiliaryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUIRenderModelAuxiliary)currentModel
{
  return self->_currentModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
