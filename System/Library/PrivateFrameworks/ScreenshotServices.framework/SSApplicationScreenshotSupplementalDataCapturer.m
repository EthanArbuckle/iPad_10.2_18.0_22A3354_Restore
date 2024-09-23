@implementation SSApplicationScreenshotSupplementalDataCapturer

- (SSApplicationScreenshotSupplementalDataCapturer)init
{
  SSApplicationScreenshotSupplementalDataCapturer *v2;
  uint64_t v3;
  FBSOpenApplicationService *openAppService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSApplicationScreenshotSupplementalDataCapturer;
  v2 = -[SSApplicationScreenshotSupplementalDataCapturer init](&v6, sel_init);
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v3 = objc_claimAutoreleasedReturnValue();
  openAppService = v2->_openAppService;
  v2->_openAppService = (FBSOpenApplicationService *)v3;

  return v2;
}

- (void)captureMetadataForEnvironmentElement:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "elementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settingsForDocumentCapture:elementIdentifier:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __108__SSApplicationScreenshotSupplementalDataCapturer_captureMetadataForEnvironmentElement_withCompletionBlock___block_invoke;
  v13[3] = &unk_24D06B8D8;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[SSApplicationScreenshotSupplementalDataCapturer _sendRequestForEnvironmentElement:info:completionBlock:](self, "_sendRequestForEnvironmentElement:info:completionBlock:", v11, v10, v13);

}

void __108__SSApplicationScreenshotSupplementalDataCapturer_captureMetadataForEnvironmentElement_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SSEnvironmentElementMetadataUpdate *v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "info");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForSetting:", 3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(SSEnvironmentElementMetadataUpdate);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSEnvironmentElementMetadataUpdate setEnvironmentElementIdentifier:](v4, "setEnvironmentElementIdentifier:", v5);

    -[SSEnvironmentElementMetadataUpdate setMetadata:](v4, "setMetadata:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)captureDocumentForEnvironmentElement:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "elementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settingsForDocumentCapture:elementIdentifier:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __108__SSApplicationScreenshotSupplementalDataCapturer_captureDocumentForEnvironmentElement_withCompletionBlock___block_invoke;
  v13[3] = &unk_24D06B8D8;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[SSApplicationScreenshotSupplementalDataCapturer _sendRequestForEnvironmentElement:info:completionBlock:](self, "_sendRequestForEnvironmentElement:info:completionBlock:", v11, v10, v13);

}

void __108__SSApplicationScreenshotSupplementalDataCapturer_captureDocumentForEnvironmentElement_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SSEnvironmentElementDocumentUpdate *v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "info");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForSetting:", 4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(SSEnvironmentElementDocumentUpdate);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSEnvironmentElementDocumentUpdate setEnvironmentElementIdentifier:](v4, "setEnvironmentElementIdentifier:", v5);

    -[SSEnvironmentElementDocumentUpdate setDocument:](v4, "setDocument:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

+ (id)settingsForDocumentCapture:(BOOL)a3 elementIdentifier:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE0BE40];
  v5 = a4;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setFlag:forSetting:", BSSettingFlagForBool(), 7);
  objc_msgSend(v6, "setObject:forSetting:", v5, 10);

  return v6;
}

- (void)_sendRequestForEnvironmentElement:(id)a3 info:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  FBSOpenApplicationService *openAppService;
  void *v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "supportsMetadataCapture") & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x24BDF6D48]);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __106__SSApplicationScreenshotSupplementalDataCapturer__sendRequestForEnvironmentElement_info_completionBlock___block_invoke;
    v20[3] = &unk_24D06B900;
    v21 = v10;
    v12 = (void *)objc_msgSend(v11, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v9, MEMORY[0x24BDAC9B8], v20, 0.0);
    v13 = (void *)MEMORY[0x24BE38478];
    v14 = *MEMORY[0x24BE382A0];
    v22 = v12;
    v23[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = *MEMORY[0x24BE382B8];
    v24[0] = v15;
    v24[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "optionsWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    openAppService = self->_openAppService;
    objc_msgSend(v8, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSOpenApplicationService openApplication:withOptions:completion:](openAppService, "openApplication:withOptions:completion:", v19, v17, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __106__SSApplicationScreenshotSupplementalDataCapturer__sendRequestForEnvironmentElement_info_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v3)
    v4 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAppService, 0);
}

@end
