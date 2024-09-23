@implementation PKPaymentSetupAssistantCoreProvisioningContext

- (PKPaymentSetupAssistantCoreProvisioningContext)initWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5
{
  id v9;
  id v10;
  PKPaymentSetupAssistantCoreProvisioningContext *v11;
  PKPaymentSetupAssistantCoreProvisioningContext *v12;
  id *p_provisioningController;
  id *p_setupAssistantCoreCredentials;
  NSMutableIndexSet *v15;
  NSMutableIndexSet *mutableSelectedIndices;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSMutableIndexSet *v40;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  objc_super v46;
  uint8_t buf[4];
  NSMutableIndexSet *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PKPaymentSetupAssistantCoreProvisioningContext;
  v11 = -[PKPaymentSetupAssistantCoreProvisioningContext init](&v46, sel_init);
  v12 = v11;
  if (v11)
  {
    p_provisioningController = (id *)&v11->_provisioningController;
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    p_setupAssistantCoreCredentials = (id *)&v12->_setupAssistantCoreCredentials;
    objc_storeStrong((id *)&v12->_setupAssistantCoreCredentials, a4);
    if (objc_msgSend(v10, "count") <= a5)
      a5 = objc_msgSend(v10, "count");
    v12->_maximumSelectable = a5;
    v15 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    mutableSelectedIndices = v12->_mutableSelectedIndices;
    v12->_mutableSelectedIndices = v15;

    if ((PKDisableDynamicSEAllocation() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v12->_maximumSelectable);
      v18 = objc_msgSend(v17, "mutableCopy");
      v19 = v12->_mutableSelectedIndices;
      v12->_mutableSelectedIndices = (NSMutableIndexSet *)v18;
      goto LABEL_30;
    }
    v20 = objc_msgSend(*p_setupAssistantCoreCredentials, "count");
    objc_msgSend(*p_provisioningController, "storageSnapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_provisioningController, "webService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "targetDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deviceClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v45 = v19;
      v42 = v10;
      v43 = v9;
      v23 = 0;
      v44 = v20;
      while (1)
      {
        objc_msgSend(*p_setupAssistantCoreCredentials, "objectAtIndexedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "credential");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "remoteCredential");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (!v26 || objc_msgSend(v26, "status") != 5)
          goto LABEL_16;
        objc_msgSend(v27, "transferableFromDevices");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "deviceClass");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v17;
          v33 = v30;
          v34 = v45;
          v35 = v34;
          if (v33 == v34)
          {

            v17 = v32;
            v20 = v44;
            p_setupAssistantCoreCredentials = (id *)&v12->_setupAssistantCoreCredentials;
LABEL_16:
            objc_msgSend(v25, "appletTypes");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v37;
            if (v37 && objc_msgSend(v37, "count"))
            {
              if (!objc_msgSend(v17, "addAppletTypesToSnapshot:", v29))
              {

LABEL_29:
                v10 = v42;
                v9 = v43;
                v19 = v45;
                break;
              }
            }
            else
            {
              PKLogFacilityTypeGetObject(0x23uLL);
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "Allowing credential to be selected because no applet type specified", buf, 2u);
              }

            }
            -[NSMutableIndexSet addIndex:](v12->_mutableSelectedIndices, "addIndex:", v23);
            goto LABEL_24;
          }
          if (v45)
          {
            v36 = objc_msgSend(v33, "isEqualToString:", v34);

            v17 = v32;
            v20 = v44;
            p_setupAssistantCoreCredentials = (id *)&v12->_setupAssistantCoreCredentials;
            if ((v36 & 1) == 0)
              goto LABEL_25;
            goto LABEL_16;
          }

          v17 = v32;
          v20 = v44;
          p_setupAssistantCoreCredentials = (id *)&v12->_setupAssistantCoreCredentials;
        }

LABEL_24:
LABEL_25:

        if (v20 == ++v23)
          goto LABEL_29;
      }
    }
LABEL_30:

    PKLogFacilityTypeGetObject(0x28uLL);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v12->_mutableSelectedIndices;
      *(_DWORD *)buf = 138412290;
      v48 = v40;
      _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "[PKPaymentSetupAssistantCoreProvisioningContext init] - selected: %@", buf, 0xCu);
    }

    -[PKPaymentProvisioningController addDelegate:](v12->_provisioningController, "addDelegate:", v12);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentProvisioningController removeDelegate:](self->_provisioningController, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupAssistantCoreProvisioningContext;
  -[PKPaymentSetupAssistantCoreProvisioningContext dealloc](&v3, sel_dealloc);
}

- (BOOL)canSelectIndex:(unint64_t)a3
{
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v5 = -[NSArray count](self->_setupAssistantCoreCredentials, "count");
  v6 = -[NSMutableIndexSet containsIndex:](self->_mutableSelectedIndices, "containsIndex:", a3);
  if (PKDynamicSEAllocationFakeFullSE())
  {
    -[NSArray objectAtIndexedSubscript:](self->_setupAssistantCoreCredentials, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "credential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appletTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentProvisioningController storageSnapshot](self->_provisioningController, "storageSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      objc_msgSend(v10, "removeAppletTypesFromSnapshot:", v9);
      LOBYTE(v6) = 1;
    }
    else
    {
      v6 = objc_msgSend(v10, "addAppletTypesToSnapshot:", v9);
    }

  }
  else
  {
    v12 = -[NSMutableIndexSet count](self->_mutableSelectedIndices, "count");
    if (v5 <= a3)
    {
      LOBYTE(v6) = 0;
    }
    else if (v12 < self->_maximumSelectable)
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)selectIndex:(unint64_t)a3
{
  BOOL v5;
  int v6;
  NSMutableIndexSet *mutableSelectedIndices;
  NSObject *v8;
  NSUInteger v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSMutableIndexSet *v14;
  int v16;
  unint64_t v17;
  __int16 v18;
  NSUInteger v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[PKPaymentSetupAssistantCoreProvisioningContext canSelectIndex:](self, "canSelectIndex:");
  if (v5)
  {
    v6 = -[NSMutableIndexSet containsIndex:](self->_mutableSelectedIndices, "containsIndex:", a3);
    mutableSelectedIndices = self->_mutableSelectedIndices;
    if (v6)
      -[NSMutableIndexSet removeIndex:](mutableSelectedIndices, "removeIndex:", a3);
    else
      -[NSMutableIndexSet addIndex:](mutableSelectedIndices, "addIndex:", a3);
    PKLogFacilityTypeGetObject(0x28uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_mutableSelectedIndices;
      v16 = 138412290;
      v17 = (unint64_t)v14;
      v11 = "[PKPaymentSetupAssistantCoreProvisioningContext selectIndex:] - selected: %@";
      v12 = v8;
      v13 = 12;
      goto LABEL_9;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NSArray count](self->_setupAssistantCoreCredentials, "count");
      v10 = -[NSMutableIndexSet count](self->_mutableSelectedIndices, "count");
      v16 = 134218496;
      v17 = a3;
      v18 = 2048;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v11 = "Error: Attempting to enable selection of index %lu, within range of (0-%lu). Selected count (%lu). No-Op.";
      v12 = v8;
      v13 = 32;
LABEL_9:
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }

  return v5;
}

- (id)availablePaymentCredentials
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[PKPaymentSetupAssistantCoreProvisioningContext selectedCredentials](self, "selectedCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningController associatedCredentials](self->_provisioningController, "associatedCredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKPaymentSetupAssistantCoreProvisioningContext_availablePaymentCredentials__block_invoke;
  v8[3] = &unk_1E2AC17A0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "pk_objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __77__PKPaymentSetupAssistantCoreProvisioningContext_availablePaymentCredentials__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (NSIndexSet)selectedIndices
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_mutableSelectedIndices, "copy");
}

- (id)selectedCredentials
{
  void *v3;
  NSMutableIndexSet *mutableSelectedIndices;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  PKPaymentSetupAssistantCoreProvisioningContext *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableIndexSet count](self->_mutableSelectedIndices, "count"));
  mutableSelectedIndices = self->_mutableSelectedIndices;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__PKPaymentSetupAssistantCoreProvisioningContext_selectedCredentials__block_invoke;
  v11 = &unk_1E2AC17C8;
  v12 = v3;
  v13 = self;
  v5 = v3;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](mutableSelectedIndices, "enumerateIndexesUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

void __69__PKPaymentSetupAssistantCoreProvisioningContext_selectedCredentials__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; setupAssistantCredentials: %@; with selected: %@>"),
    v5,
    self,
    self->_setupAssistantCoreCredentials,
    self->_mutableSelectedIndices);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)setupAssistantCoreCredentials
{
  return self->_setupAssistantCoreCredentials;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_setupAssistantCoreCredentials, 0);
  objc_storeStrong((id *)&self->_mutableSelectedIndices, 0);
}

@end
