@implementation QOSErrorMessage

- (QOSErrorMessage)initWithConfig:(id)a3 logger:(id)a4 metricsRecorder:(id)a5 defaultAlert:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  QOSErrorMessage *v14;
  QOSConfigInternal *v15;
  uint64_t v16;
  void *v17;
  QOSConfigInternal *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  ObjcQOSErrorMessageProtocolInternal *underlyingObject;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[4];
  id v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)QOSErrorMessage;
  v14 = -[QOSErrorMessage init](&v31, sel_init);
  if (v14)
  {
    v15 = [QOSConfigInternal alloc];
    v16 = objc_msgSend(v10, "appTarget");
    objc_msgSend(v10, "locale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[QOSConfigInternal initWithAppTarget:locale:](v15, "initWithAppTarget:locale:", v16, v17);

    v19 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke;
    aBlock[3] = &unk_2515E7B20;
    v30 = v11;
    v20 = _Block_copy(aBlock);
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke_2;
    v27[3] = &unk_2515E7B48;
    v28 = v13;
    v21 = _Block_copy(v27);
    v26 = 0;
    +[QOSErrorMessageInternal getObjcInstanceWithConfig:error:logger:metricsRecorder:defaultAlert:](QOSErrorMessageInternal, "getObjcInstanceWithConfig:error:logger:metricsRecorder:defaultAlert:", v18, &v26, v20, v12, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v26;
    underlyingObject = v14->_underlyingObject;
    v14->_underlyingObject = (ObjcQOSErrorMessageProtocolInternal *)v22;

  }
  return v14;
}

uint64_t __70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

QOSAlertMessageInternal *__70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke_2(uint64_t a1)
{
  void *v1;
  QOSAlertMessageInternal *v2;
  void *v3;
  void *v4;
  QOSAlertMessageInternal *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = [QOSAlertMessageInternal alloc];
  objc_msgSend(v1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[QOSAlertMessageInternal initWithTitle:body:](v2, "initWithTitle:body:", v3, v4);

  return v5;
}

- (id)getLocalizedErrorMessageForItems:(id)a3 usingError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  QOSAlertMessage *v11;
  void *v12;
  void *v13;
  QOSAlertMessage *v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_initWeak(&location, self);
  -[QOSErrorMessage underlyingObject](self, "underlyingObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getLocalizedErrorMessageForItems::", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [QOSAlertMessage alloc];
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[QOSAlertMessage initWithTitle:body:](v11, "initWithTitle:body:", v12, v13);

  objc_destroyWeak(&location);
  return v14;
}

- (void)fetchLocalizedErrorMessageForItems:(id)a3 usingError:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_initWeak(&location, self);
  -[QOSErrorMessage underlyingObject](self, "underlyingObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke;
  v14[3] = &unk_2515E7B98;
  v13 = v10;
  v15 = v13;
  objc_msgSend(v12, "fetchLocalizedErrorMessageForItems::completionHandler:", v8, v9, v14);

  objc_destroyWeak(&location);
}

void __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  QOSAlertMessage *v4;
  void *v5;
  void *v6;
  QOSAlertMessage *v7;
  id v8;
  QOSAlertMessage *v9;
  _QWORD v10[4];
  QOSAlertMessage *v11;
  id v12;

  v3 = a2;
  v4 = [QOSAlertMessage alloc];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[QOSAlertMessage initWithTitle:body:](v4, "initWithTitle:body:", v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke_2;
  v10[3] = &unk_2515E7B70;
  v8 = *(id *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (ObjcQOSErrorMessageProtocolInternal)underlyingObject
{
  return (ObjcQOSErrorMessageProtocolInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
