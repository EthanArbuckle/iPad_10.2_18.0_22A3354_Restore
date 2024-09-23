@implementation PXGDataSourceChange

- (PXGDataSourceChange)initWithChangeDetails:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXGDataSourceChange *v12;
  PXGDataSourceChange *v13;
  void **p_changeDetails;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PXGDataSourceChange;
  v12 = -[PXGDataSourceChange init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    p_changeDetails = (void **)&v12->_changeDetails;
    objc_storeStrong((id *)&v12->_changeDetails, a3);
    objc_storeStrong((id *)&v13->_dataSourceBeforeChanges, a4);
    objc_storeStrong((id *)&v13->_dataSourceAfterChanges, a5);
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "toDataSourceIdentifier");
      if (v16 == objc_msgSend(v11, "identifier"))
      {
        objc_msgSend(v9, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "fromDataSourceIdentifier");
        v19 = objc_msgSend(v10, "identifier");

        if (v18 == v19)
          goto LABEL_10;
      }
      else
      {

      }
      PXAssertGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v25 = v9;
        v26 = 2112;
        v27 = v10;
        v28 = 2112;
        v29 = v11;
        _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "PXGDataSourceChange version mismatch, changeDetails:%@ before:%@ after:%@", buf, 0x20u);
      }

      v21 = *p_changeDetails;
      *p_changeDetails = 0;

    }
  }
LABEL_10:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceAfterChanges, 0);
  objc_storeStrong((id *)&self->_dataSourceBeforeChanges, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

- (PXGDataSourceChange)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDataSourceDrivenLayout.m"), 253, CFSTR("%s is not available as initializer"), "-[PXGDataSourceChange init]");

  abort();
}

- (NSArray)changeDetails
{
  return self->_changeDetails;
}

- (PXSectionedDataSource)dataSourceBeforeChanges
{
  return self->_dataSourceBeforeChanges;
}

- (PXSectionedDataSource)dataSourceAfterChanges
{
  return self->_dataSourceAfterChanges;
}

@end
