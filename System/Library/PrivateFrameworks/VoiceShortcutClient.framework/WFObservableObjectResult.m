@implementation WFObservableObjectResult

- (WFObservableObjectResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4 initialValue:(id)a5 descriptor:(id)a6
{
  double height;
  double width;
  id v12;
  id v13;
  WFObservableObjectResult *v14;
  WFObservableObjectResult *v15;
  WFObservableObjectResult *v16;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFObservableObjectResult;
  v14 = -[WFObservableResult initWithValueType:glyphSize:](&v18, sel_initWithValueType_glyphSize_, a3, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_value, a5);
    objc_storeStrong((id *)&v15->_descriptor, a6);
    v16 = v15;
  }

  return v15;
}

- (void)handleChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];

  v10 = a3;
  objc_msgSend(v10, "updatedDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObservableObjectResult descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {

LABEL_4:
    -[WFObservableResult serialQueue](self, "serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke;
    block[3] = &unk_1E5FC7288;
    block[4] = self;
    dispatch_sync(v9, block);

    goto LABEL_5;
  }
  objc_msgSend(v10, "deletedDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObservableObjectResult descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[WFObservableResult valueType](self, "valueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObservableObjectResult value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObservableObjectResult descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, valueType: %@, value: %@, descriptor: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFDatabaseObjectDescriptor)value
{
  return self->_value;
}

- (WFDatabaseObjectDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "valueType");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_2;
  v5[3] = &unk_1E5FC6EE8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "getValueForDescriptor:resultClass:completion:", v3, v4, v5);

}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(*(id *)(a1 + 32), "glyphSize");
    v9 = v8;
    v11 = v10;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_3;
    v12[3] = &unk_1E5FC7AC0;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    +[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:](WFObservableResult, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:", v7, v12, v9, v11);
    if (v5)

  }
}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_4;
  v4[3] = &unk_1E5FC7AC0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "observerNotificationQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_5;
        v12[3] = &unk_1E5FC7AC0;
        v11 = *(_QWORD *)(a1 + 32);
        v12[4] = v9;
        v12[5] = v11;
        dispatch_async(v10, v12);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

uint64_t __53__WFObservableObjectResult_handleChangeNotification___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observableResultDidChange:", *(_QWORD *)(a1 + 40));
}

+ (void)getResultWithDescriptor:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  Class v22;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a6;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke;
  v16[3] = &unk_1E5FC6EC0;
  v18 = v12;
  v19 = a1;
  v20 = width;
  v21 = height;
  v22 = a4;
  v17 = v11;
  v14 = v11;
  v15 = v12;
  objc_msgSend(v13, "getValueForDescriptor:resultClass:completion:", v14, a4, v16);

}

+ (id)getResultWithDescriptor:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  WFObservableObjectResult *v16;
  id v18;
  _QWORD v19[2];

  height = a5.height;
  width = a5.width;
  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v12, "getValueForDescriptor:resultClass:error:", v11, a4, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;

  if (v13)
  {
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:", v15, width, height);

    v16 = -[WFObservableObjectResult initWithValueType:glyphSize:initialValue:descriptor:]([WFObservableObjectResult alloc], "initWithValueType:glyphSize:initialValue:descriptor:", a4, v13, v11, width, height);
  }
  else
  {
    v16 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }

  return v16;
}

void __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 48);
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5FC6E98;
    v11 = *(_QWORD *)(a1 + 72);
    v12 = *(_OWORD *)(a1 + 56);
    v8 = v4;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:", v6, v7, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke_2(uint64_t a1)
{
  WFObservableObjectResult *v2;

  v2 = -[WFObservableObjectResult initWithValueType:glyphSize:initialValue:descriptor:]([WFObservableObjectResult alloc], "initWithValueType:glyphSize:initialValue:descriptor:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
