@implementation PSPeopleSuggestionsMetricsInferenceEvent

- (PSPeopleSuggestionsMetricsInferenceEvent)initWithIdentifier:(id)a3 responseType:(int64_t)a4 suggestions:(id)a5
{
  id v8;
  id v9;
  PSPeopleSuggestionsMetricsInferenceEvent *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _PSPeopleSuggestionsMetricsInferenceEventInternal *v18;
  void *v19;
  uint64_t v20;
  _PSPeopleSuggestionsMetricsInferenceEventInternal *underlyingObject;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PSPeopleSuggestionsMetricsInferenceEvent;
  v10 = -[PSPeopleSuggestionsMetricsInferenceEvent init](&v27, sel_init);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "underlyingObject", (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v14);
  }

  v18 = [_PSPeopleSuggestionsMetricsInferenceEventInternal alloc];
  v19 = (void *)objc_msgSend(v11, "copy");
  v20 = -[_PSPeopleSuggestionsMetricsInferenceEventInternal initWithId:responseType:suggestions:](v18, "initWithId:responseType:suggestions:", v8, a4, v19);
  underlyingObject = v10->_underlyingObject;
  v10->_underlyingObject = (_PSPeopleSuggestionsMetricsInferenceEventInternal *)v20;

  return v10;
}

- (_PSPeopleSuggestionsMetricsInferenceEventInternal)underlyingObject
{
  return (_PSPeopleSuggestionsMetricsInferenceEventInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
