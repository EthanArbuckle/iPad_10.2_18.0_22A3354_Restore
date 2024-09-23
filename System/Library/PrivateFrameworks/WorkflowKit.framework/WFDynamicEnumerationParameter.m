@implementation WFDynamicEnumerationParameter

- (id)defaultSerializedRepresentation
{
  unint64_t v3;
  WFPropertyListObject *v4;
  void *v5;
  WFPropertyListObject *v6;
  WFPropertyListObject *defaultSerializedRepresentation;
  WFPropertyListObject *v8;
  objc_super v10;

  v3 = -[WFDynamicEnumerationParameter defaultValueLoadingState](self, "defaultValueLoadingState");
  if (v3 - 2 >= 2)
  {
    if (!v3)
    {
      if (-[WFDynamicEnumerationParameter dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation](self, "dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation"))
      {
        -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "defaultSerializedRepresentationForEnumeration:", self);
        v6 = (WFPropertyListObject *)objc_claimAutoreleasedReturnValue();
        defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
        self->_defaultSerializedRepresentation = v6;

        -[WFDynamicEnumerationParameter setDefaultValueLoadingState:](self, "setDefaultValueLoadingState:", 2);
        v4 = self->_defaultSerializedRepresentation;
        goto LABEL_6;
      }
      if (!-[WFDynamicEnumerationParameter dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation](self, "dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation"))
      {
        v10.receiver = self;
        v10.super_class = (Class)WFDynamicEnumerationParameter;
        -[WFParameter defaultSerializedRepresentation](&v10, sel_defaultSerializedRepresentation);
        v8 = (WFPropertyListObject *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      -[WFDynamicEnumerationParameter loadDefaultSerializedRepresentationWithCompletionHandler:](self, "loadDefaultSerializedRepresentationWithCompletionHandler:", 0);
    }
    v8 = 0;
    return v8;
  }
  v4 = self->_defaultSerializedRepresentation;
LABEL_6:
  v8 = v4;
  return v8;
}

- (unint64_t)defaultValueLoadingState
{
  return self->_defaultValueLoadingState;
}

- (void)loadDefaultSerializedRepresentationWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  if (-[WFDynamicEnumerationParameter defaultValueLoadingState](self, "defaultValueLoadingState")
    || !-[WFDynamicEnumerationParameter loadsDefaultStateAsynchronously](self, "loadsDefaultStateAsynchronously"))
  {
    if (v4)
    {
      -[WFDynamicEnumerationParameter defaultSerializedRepresentation](self, "defaultSerializedRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, 0);

    }
  }
  else
  {
    -[WFDynamicEnumerationParameter setDefaultValueLoadingState:](self, "setDefaultValueLoadingState:", 1);
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E7AEE680;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "loadDefaultSerializedRepresentationForEnumeration:completionHandler:", self, v7);

  }
}

- (void)setDefaultValueLoadingState:(unint64_t)a3
{
  self->_defaultValueLoadingState = a3;
}

- (BOOL)dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_msgSend(v5, "shouldLoadDefaultStateAsynchronouslyForEnumeration:", self);
  else
    v7 = objc_opt_respondsToSelector();
  v8 = v7;

  return v8 & 1;
}

- (BOOL)dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_msgSend(v5, "shouldLoadDefaultStateAsynchronouslyForEnumeration:", self) ^ 1;
  else
    v7 = objc_opt_respondsToSelector();

  return v7 & 1;
}

- (WFDynamicEnumerationDataSource)dataSource
{
  return (WFDynamicEnumerationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BOOL)loadsDefaultStateAsynchronously
{
  return !-[WFDynamicEnumerationParameter dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation](self, "dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation")&& -[WFDynamicEnumerationParameter dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation](self, "dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation");
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeration:localizedLabelForPossibleState:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDataSource:(id)a3
{
  WFDynamicEnumerationDataSource **p_dataSource;
  id v5;
  id WeakRetained;
  char v7;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v7 = objc_msgSend(WeakRetained, "isEqual:", v5);

  objc_storeWeak((id *)p_dataSource, v5);
  if ((v7 & 1) == 0)
  {
    -[WFDynamicEnumerationParameter clearPossibleStates](self, "clearPossibleStates");
    if (self->_defaultSerializedRepresentation)
      -[WFDynamicEnumerationParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
  }
}

- (void)clearPossibleStates
{
  NSArray *possibleStates;
  INObjectCollection *possibleStatesCollection;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  possibleStatesCollection = self->_possibleStatesCollection;
  self->_possibleStatesCollection = 0;

  self->_possibleStatesLoadingState = 0;
}

- (id)localizedSubtitleLabelForPossibleState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeration:localizedSubtitleLabelForPossibleState:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFDynamicEnumerationParameter;
    -[WFEnumerationParameter localizedSubtitleLabelForPossibleState:](&v10, sel_localizedSubtitleLabelForPossibleState_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStatesLoadingError, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_possibleStatesCollection, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (void)defaultSerializedRepresentationDidChange
{
  WFPropertyListObject *defaultSerializedRepresentation;
  objc_super v4;

  defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
  self->_defaultSerializedRepresentation = 0;

  -[WFDynamicEnumerationParameter setDefaultValueLoadingState:](self, "setDefaultValueLoadingState:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WFDynamicEnumerationParameter;
  -[WFParameter defaultSerializedRepresentationDidChange](&v4, sel_defaultSerializedRepresentationDidChange);
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeration:accessoryImageForPossibleState:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFDynamicEnumerationParameter;
    -[WFEnumerationParameter accessoryImageForPossibleState:](&v10, sel_accessoryImageForPossibleState_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E7AF8F70;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

- (INObjectCollection)possibleStatesCollection
{
  return self->_possibleStatesCollection;
}

uint64_t __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  uint64_t (*v7)(void);
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (!v3)
  {
    objc_msgSend(v2, "setDefaultValueLoadingState:", 2);
    v8 = *(void **)(a1 + 48);
    v9 = *(id *)(*(_QWORD *)(a1 + 40) + 232);
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v9, "isEqual:", v10);

        if ((v13 & 1) != 0)
          goto LABEL_16;
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 232), *(id *)(a1 + 48));
      v14.receiver = *(id *)(a1 + 40);
      v14.super_class = (Class)WFDynamicEnumerationParameter;
      objc_msgSendSuper2(&v14, sel_defaultSerializedRepresentationDidChange);
    }
LABEL_16:
    result = *(_QWORD *)(a1 + 56);
    if (!result)
      return result;
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  objc_msgSend(v2, "setDefaultValueLoadingState:", 0);
  getWFGeneralLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFDynamicEnumerationParameter loadDefaultSerializedRepresentationWithCompletionHandler:]_block_invoke_2";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_ERROR, "%s Error loading default serialized representation for dynamic enumeration: %{error}@", buf, 0x16u);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 2;
  objc_msgSend(*(id *)(a1 + 32), "setPossibleStatesCollection:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "possibleStatesLoadingError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)setPossibleStatesCollection:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_possibleStatesCollection, a3);
  v5 = a3;
  objc_msgSend(v5, "allItems");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WFDynamicEnumerationParameter setPossibleStates:](self, "setPossibleStates:", v6);
}

- (void)setPossibleStates:(id)a3
{
  NSArray *v4;
  NSArray *possibleStates;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  possibleStates = self->_possibleStates;
  self->_possibleStates = v4;

  -[WFDynamicEnumerationParameter possibleStatesDidChange](self, "possibleStatesDidChange");
}

- (NSError)possibleStatesLoadingError
{
  return self->_possibleStatesLoadingError;
}

- (void)possibleStatesDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFDynamicEnumerationParameter;
  -[WFEnumerationParameter possibleStatesDidChange](&v2, sel_possibleStatesDidChange);
}

- (void)loadPossibleStatesWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (-[WFDynamicEnumerationParameter isAsynchronous](self, "isAsynchronous"))
  {
    if (-[WFDynamicEnumerationParameter possibleStatesLoadingState](self, "possibleStatesLoadingState") == 1)
    {
      -[WFDynamicEnumerationParameter possibleStatesLoadingError](self, "possibleStatesLoadingError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
    else
    {
      self->_possibleStatesLoadingState = 1;
      -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke;
      v7[3] = &unk_1E7AF6938;
      v7[4] = self;
      v8 = v4;
      objc_msgSend(v6, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", self, 0, v7);

    }
  }
  else
  {
    v4[2](v4, 0);
  }

}

- (unint64_t)possibleStatesLoadingState
{
  return self->_possibleStatesLoadingState;
}

- (BOOL)isAsynchronous
{
  void *v2;
  char v3;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

void __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E7AF8F70;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

- (BOOL)allowsMultipleValues
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  objc_super v8;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "enumerationAllowsMultipleValues:", self);

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFDynamicEnumerationParameter;
    return -[WFParameter allowsMultipleValues](&v8, sel_allowsMultipleValues);
  }
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[WFDynamicEnumerationParameter possibleStatesLoadingState](self, "possibleStatesLoadingState") == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFDynamicEnumerationParameter;
    v5 = -[WFEnumerationParameter parameterStateIsValid:](&v7, sel_parameterStateIsValid_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)reloadPossibleStates
{
  _QWORD v3[5];

  -[WFDynamicEnumerationParameter clearPossibleStates](self, "clearPossibleStates");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WFDynamicEnumerationParameter_reloadPossibleStates__block_invoke;
  v3[3] = &unk_1E7AF7B78;
  v3[4] = self;
  -[WFDynamicEnumerationParameter loadPossibleStatesWithCompletionHandler:](self, "loadPossibleStatesWithCompletionHandler:", v3);
}

- (void)setPossibleStatesFromRemoteSource:(id)a3
{
  -[WFDynamicEnumerationParameter setPossibleStates:](self, "setPossibleStates:", a3);
  self->_possibleStatesLoadingState = 3;
}

- (id)possibleStatesForLocalization
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && (-[WFDynamicEnumerationParameter dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "enumerationShouldProvideValuesForParameterSummaryLocalization:", self),
        v5,
        !v6))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFDynamicEnumerationParameter;
    -[WFEnumerationParameter possibleStatesForLocalization](&v9, sel_possibleStatesForLocalization);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeration:accessoryIconForPossibleState:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFDynamicEnumerationParameter;
    -[WFEnumerationParameter accessoryIconForPossibleState:](&v10, sel_accessoryIconForPossibleState_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeration:accessoryColorForPossibleState:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)possibleStates
{
  unint64_t v3;
  NSArray *v4;
  void *v5;
  char v6;
  void *v7;
  NSArray *v8;
  void *v9;
  NSArray *possibleStates;
  NSArray *v11;

  v3 = -[WFDynamicEnumerationParameter possibleStatesLoadingState](self, "possibleStatesLoadingState");
  if (v3 - 2 >= 2)
  {
    if (v3
      || (-[WFDynamicEnumerationParameter dataSource](self, "dataSource"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_opt_respondsToSelector(),
          v5,
          (v6 & 1) == 0))
    {
      v4 = 0;
    }
    else
    {
      -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "possibleStatesForEnumeration:", self);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithItems:", v8);
      else
        v9 = 0;
      objc_storeStrong((id *)&self->_possibleStatesCollection, v9);
      if (v8)

      possibleStates = self->_possibleStates;
      self->_possibleStates = v8;
      v11 = v8;

      self->_possibleStatesLoadingState = 2;
      v4 = self->_possibleStates;

    }
  }
  else
  {
    v4 = self->_possibleStates;
  }
  return v4;
}

- (BOOL)shouldAlwaysReloadPossibleStates
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enumerationShouldAlwaysReloadPossibleStates:", self);

  return v6;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  WFDynamicEnumerationParameter *v20;
  id v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[WFDynamicEnumerationParameter possibleStatesLoadingState](self, "possibleStatesLoadingState") == 3
    && (-[WFDynamicEnumerationParameter possibleStates](self, "possibleStates"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "count"),
        v14,
        v15))
  {
    v22.receiver = self;
    v22.super_class = (Class)WFDynamicEnumerationParameter;
    -[WFEnumerationParameter createDialogRequestWithAttribution:defaultState:prompt:completionHandler:](&v22, sel_createDialogRequestWithAttribution_defaultState_prompt_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __106__WFDynamicEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke;
    v16[3] = &unk_1E7AEE6A8;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = self;
    v21 = v13;
    -[WFDynamicEnumerationParameter loadPossibleStatesWithCompletionHandler:](self, "loadPossibleStatesWithCompletionHandler:", v16);

  }
}

id __106__WFDynamicEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v6.receiver = *(id *)(a1 + 56);
  v6.super_class = (Class)WFDynamicEnumerationParameter;
  return objc_msgSendSuper2(&v6, sel_createDialogRequestWithAttribution_defaultState_prompt_completionHandler_, v1, v2, v3, v4);
}

void __53__WFDynamicEnumerationParameter_reloadPossibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[WFDynamicEnumerationParameter reloadPossibleStates]_block_invoke";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_ERROR, "%s Error reloading possible states: %{error}@", (uint8_t *)&v6, 0x16u);

    }
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isAsynchronous") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
  }

}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 0;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v7[3] = &unk_1E7AF9450;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[WFDynamicEnumerationParameter loadPossibleStatesWithCompletionHandler:](self, "loadPossibleStatesWithCompletionHandler:", v7);

}

- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CBDA10]);
    -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = v7;
    else
      v9 = MEMORY[0x1E0C9AA60];
    v10 = (void *)objc_msgSend(v6, "initWithItems:", v9);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __106__WFDynamicEnumerationParameter_WFParameterPicker__wf_reloadFromAttributesDidChangeWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E7AF76F0;
    v13 = v10;
    v14 = v4;
    v11 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

uint64_t __106__WFDynamicEnumerationParameter_WFParameterPicker__wf_reloadFromAttributesDidChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

void __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0CBDA10]);
    objc_msgSend(*(id *)(a1 + 32), "possibleStates");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = v4;
    else
      v6 = MEMORY[0x1E0C9AA60];
    v7 = (void *)objc_msgSend(v3, "initWithItems:", v6);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
    v10[3] = &unk_1E7AF76F0;
    v8 = *(id *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

@end
