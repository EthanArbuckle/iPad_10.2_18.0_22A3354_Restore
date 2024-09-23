@implementation CRFormFieldLabelAssociationStep

- (CRFormFieldLabelAssociationStep)init
{
  CRFormFieldLabelAssociationStep *v2;
  CRFormParser *v3;
  CRFormParser *parser;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRFormFieldLabelAssociationStep;
  v2 = -[CRFormFieldLabelAssociationStep init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRFormParser);
    parser = v2->_parser;
    v2->_parser = v3;

  }
  return v2;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  CROSLogForCategory(6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134217984;
    v24 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLabelAssociationStep is running (#input:%lu).", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ShouldUpdateExternalFieldsOption"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v10, "_flattenedFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRFormParser parseFieldsInDocument:allFields:shouldUpdateExternalFields:](self->_parser, "parseFieldsInDocument:allFields:shouldUpdateExternalFields:", v12, v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(6);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend(v19, "count");
    v23 = 134217984;
    v24 = v21;
    _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLabelAssociationStep is completed (#output:%lu).", (uint8_t *)&v23, 0xCu);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
}

@end
