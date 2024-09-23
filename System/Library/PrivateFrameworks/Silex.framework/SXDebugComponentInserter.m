@implementation SXDebugComponentInserter

- (id)conditionsForDOMObjectProvider:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (unint64_t)componentTraits
{
  return 0;
}

- (BOOL)validateMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  return 1;
}

- (id)componentInsertForMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  id v5;
  SXInsertedDebugComponent *v6;
  SXInsertComponentLayout *v7;
  void *v8;
  void *v9;
  SXInsertComponentLayout *v10;
  SXComponentInsert *v11;

  v5 = a5;
  v6 = objc_alloc_init(SXInsertedDebugComponent);
  v7 = [SXInsertComponentLayout alloc];
  objc_msgSend(v5, "columnLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "documentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SXInsertComponentLayout initWithColumnRange:](v7, "initWithColumnRange:", 0, objc_msgSend(v9, "columns"));

  -[SXInsertComponentLayout setIgnoreDocumentMargin:](v10, "setIgnoreDocumentMargin:", 3);
  v11 = -[SXComponentInsert initWithComponent:componentLayout:]([SXComponentInsert alloc], "initWithComponent:componentLayout:", v6, v10);

  return v11;
}

- (SXComponentInsertionConditionEngine)conditionEngine
{
  return self->_conditionEngine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionEngine, 0);
}

@end
