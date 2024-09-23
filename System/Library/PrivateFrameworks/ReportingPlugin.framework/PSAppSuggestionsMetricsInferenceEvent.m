@implementation PSAppSuggestionsMetricsInferenceEvent

- (PSAppSuggestionsMetricsInferenceEvent)initWithIdentifier:(id)a3 suggestions:(id)a4
{
  id v6;
  id v7;
  PSAppSuggestionsMetricsInferenceEvent *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _PSAppSuggestionsMetricsInferenceEventInternal *v16;
  void *v17;
  uint64_t v18;
  _PSAppSuggestionsMetricsInferenceEventInternal *underlyingObject;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PSAppSuggestionsMetricsInferenceEvent;
  v8 = -[PSAppSuggestionsMetricsInferenceEvent init](&v25, sel_init);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "underlyingObject", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v12);
  }

  v16 = [_PSAppSuggestionsMetricsInferenceEventInternal alloc];
  v17 = (void *)objc_msgSend(v9, "copy");
  v18 = -[_PSAppSuggestionsMetricsInferenceEventInternal initWithId:suggestions:](v16, "initWithId:suggestions:", v6, v17);
  underlyingObject = v8->_underlyingObject;
  v8->_underlyingObject = (_PSAppSuggestionsMetricsInferenceEventInternal *)v18;

  return v8;
}

- (_PSAppSuggestionsMetricsInferenceEventInternal)underlyingObject
{
  return (_PSAppSuggestionsMetricsInferenceEventInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
