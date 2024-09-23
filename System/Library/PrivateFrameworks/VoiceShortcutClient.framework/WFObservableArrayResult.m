@implementation WFObservableArrayResult

- (WFObservableArrayResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4 initialValues:(id)a5 query:(id)a6 resultState:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  WFObservableArrayResult *v16;
  uint64_t v17;
  NSArray *values;
  WFObservableArrayResult *v19;
  objc_super v21;

  height = a4.height;
  width = a4.width;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)WFObservableArrayResult;
  v16 = -[WFObservableResult initWithValueType:glyphSize:](&v21, sel_initWithValueType_glyphSize_, a3, width, height);
  if (v16)
  {
    v17 = objc_msgSend(v13, "copy");
    values = v16->_values;
    v16->_values = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_query, a6);
    objc_storeStrong((id *)&v16->_resultState, a7);
    v19 = v16;
  }

  return v16;
}

- (void)handleChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFObservableResult serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke;
  block[3] = &unk_1E5FC7AC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[WFObservableResult valueType](self, "valueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObservableArrayResult values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[WFObservableArrayResult query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObservableArrayResult values](self, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, valueType: %@, values count: %lu, query: %@, values: %@>"), v5, self, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)values
{
  return self->_values;
}

- (WFDatabaseResultState)resultState
{
  return self->_resultState;
}

- (WFResultQuery)query
{
  return self->_query;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_resultState, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "resultState");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        v4 = *(void **)(a1 + 40),
        objc_msgSend(*(id *)(a1 + 32), "resultState"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = objc_msgSend(v4, "appliesToResultState:", v5),
        v5,
        v3,
        (_DWORD)v4))
  {
    +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "valueType");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_2;
    v9[3] = &unk_1E5FC6E70;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "getResultsForQuery:resultClass:completion:", v7, v8, v9);

  }
}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "glyphSize");
  v8 = v7;
  v10 = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_3;
  v13[3] = &unk_1E5FC7260;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v11 = v6;
  v12 = v5;
  +[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:](WFObservableResult, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:", v12, v13, v8, v10);

}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_4;
  block[3] = &unk_1E5FC7260;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke_4(id *a1)
{
  id v2;
  id v3;
  BOOL v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v19 = *((id *)a1[4] + 8);
  v3 = v2;
  if (v19 == v3)
  {

    return;
  }
  if (v19)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {

  }
  else
  {
    v5 = objc_msgSend(v19, "isEqual:", v3);

    if ((v5 & 1) != 0)
      return;
  }
  v6 = objc_msgSend(a1[5], "copy");
  v7 = a1[4];
  v8 = (void *)v7[8];
  v7[8] = v6;

  objc_storeStrong((id *)a1[4] + 9, a1[6]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1[4], "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(a1[4], "observerNotificationQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_5;
        block[3] = &unk_1E5FC7AC0;
        v18 = a1[4];
        block[4] = v16;
        block[5] = v18;
        dispatch_async(v17, block);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

uint64_t __52__WFObservableArrayResult_handleChangeNotification___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observableResultDidChange:", *(_QWORD *)(a1 + 40));
}

+ (void)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 completionHandler:(id)a6
{
  objc_msgSend(a1, "getResultWithQuery:valueType:glyphSize:roundedIcon:completionHandler:", a3, a4, 1, a6, a5.width, a5.height);
}

+ (void)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 roundedIcon:(BOOL)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  CGFloat v22;
  CGFloat v23;
  Class v24;
  BOOL v25;

  height = a5.height;
  width = a5.width;
  v13 = a3;
  v14 = a7;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke;
  v18[3] = &unk_1E5FC6E48;
  v20 = v14;
  v21 = a1;
  v22 = width;
  v23 = height;
  v25 = a6;
  v24 = a4;
  v19 = v13;
  v16 = v13;
  v17 = v14;
  objc_msgSend(v15, "getResultsForQuery:resultClass:completion:", v16, a4, v18);

}

+ (id)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  WFObservableArrayResult *v16;
  id v18;
  id v19;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = 0;
  objc_msgSend(v12, "getResultsForQuery:resultClass:resultState:error:", v11, a4, &v19, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  v15 = v18;

  if (v15)
  {
    v16 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }
  else
  {
    objc_msgSend(a1, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:", v13, width, height);
    v16 = -[WFObservableArrayResult initWithValueType:glyphSize:initialValues:query:resultState:]([WFObservableArrayResult alloc], "initWithValueType:glyphSize:initialValues:query:resultState:", a4, v13, v11, v14, width, height);
  }

  return v16;
}

+ (id)getEmptyResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  WFObservableArrayResult *v9;
  WFObservableArrayResult *v10;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = [WFObservableArrayResult alloc];
  v10 = -[WFObservableArrayResult initWithValueType:glyphSize:initialValues:query:resultState:](v9, "initWithValueType:glyphSize:initialValues:query:resultState:", a4, MEMORY[0x1E0C9AA60], v8, 0, width, height);

  return v10;
}

void __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(unsigned __int8 *)(a1 + 80);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5FC6E20;
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(_OWORD *)(a1 + 56);
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:", v10, v8, 0, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke_2(uint64_t a1)
{
  WFObservableArrayResult *v2;

  v2 = -[WFObservableArrayResult initWithValueType:glyphSize:initialValues:query:resultState:]([WFObservableArrayResult alloc], "initWithValueType:glyphSize:initialValues:query:resultState:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
