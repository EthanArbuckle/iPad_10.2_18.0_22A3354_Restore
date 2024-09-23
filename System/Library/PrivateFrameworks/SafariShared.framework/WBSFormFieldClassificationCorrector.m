@implementation WBSFormFieldClassificationCorrector

- (WBSFormFieldClassificationCorrector)initWithDomain:(id)a3 formMetadata:(id)a4 formValues:(id)a5 uniqueIDsOfControlsThatWereAutoFilled:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WBSFormFieldClassificationCorrector *v14;
  uint64_t v15;
  NSString *domain;
  uint64_t v17;
  NSDictionary *formValues;
  uint64_t v19;
  NSSet *uniqueIDsOfControlsThatWereAutoFilled;
  WBSFormAutoFillClassificationToCorrectionsTransformer *v21;
  WBSFormAutoFillClassificationToCorrectionsTransformer *classificationToCorrectionsTransformer;
  WBSFormFieldClassificationCorrector *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WBSFormFieldClassificationCorrector;
  v14 = -[WBSFormFieldClassificationCorrector init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    domain = v14->_domain;
    v14->_domain = (NSString *)v15;

    objc_storeStrong((id *)&v14->_formMetadata, a4);
    v17 = objc_msgSend(v12, "copy");
    formValues = v14->_formValues;
    v14->_formValues = (NSDictionary *)v17;

    v19 = objc_msgSend(v13, "copy");
    uniqueIDsOfControlsThatWereAutoFilled = v14->_uniqueIDsOfControlsThatWereAutoFilled;
    v14->_uniqueIDsOfControlsThatWereAutoFilled = (NSSet *)v19;

    v21 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
    classificationToCorrectionsTransformer = v14->_classificationToCorrectionsTransformer;
    v14->_classificationToCorrectionsTransformer = v21;

    v23 = v14;
  }

  return v14;
}

- (WBSFormFieldClassificationCorrector)init
{
  return -[WBSFormFieldClassificationCorrector initWithDomain:formMetadata:formValues:uniqueIDsOfControlsThatWereAutoFilled:](self, "initWithDomain:formMetadata:formValues:uniqueIDsOfControlsThatWereAutoFilled:", 0, 0, 0, 0);
}

- (void)processCorrections
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_10(&dword_1A3D90000, a2, a3, "Processing AutoFill corrections for %lu fields", (uint8_t *)a1);
}

- (id)_classificationCorrectionsForControlWithMetadata:(id)a3 wasIdentifiedAsAddressBookField:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  NSSet *uniqueIDsOfControlsThatWereAutoFilled;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isTextField") & 1) != 0
    || (objc_msgSend(v6, "selectElementInfo"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v6, "addressBookLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v6, "isLabeledUsernameField") & 1) == 0 && objc_msgSend(v8, "length") != 0;
    *a4 = v9;
    if (objc_msgSend(v6, "isAutoFilledTextField"))
    {
      -[WBSFormAutoFillClassificationToCorrectionsTransformer transformedValue:](self->_classificationToCorrectionsTransformer, "transformedValue:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "fieldName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        -[NSDictionary safari_stringForKey:](self->_formValues, "safari_stringForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      if (!objc_msgSend(v12, "length"))
      {
        objc_msgSend(v6, "value");
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uniqueIDsOfControlsThatWereAutoFilled = self->_uniqueIDsOfControlsThatWereAutoFilled;
      if (uniqueIDsOfControlsThatWereAutoFilled)
      {
        objc_msgSend(v6, "uniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[NSSet containsObject:](uniqueIDsOfControlsThatWereAutoFilled, "containsObject:", v18);

      }
      else
      {
        v19 = 1;
      }
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend(WeakRetained, "formFieldClassificationCorrector:bestAddressBookLabelForControlValue:", self, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v8 && objc_msgSend(v20, "isEqualToString:", v8))
        {

          v21 = 0;
        }
        if (v9)
        {
          if ((objc_msgSend(WeakRetained, "formFieldClassificationCorrector:hasAddressBookDataForAddressBookLabel:", self, v8) & 1) == 0&& (objc_msgSend(WeakRetained, "formFieldClassificationCorrector:hasAddressBookDataForAddressBookLabel:", self, v21) & 1) == 0)
          {

            v21 = 0;
            *a4 = 0;
          }
        }
        else if (objc_msgSend(v21, "isEqualToString:", &stru_1E4B40D18))
        {

          v21 = 0;
        }
        if ((v19 & 1) == 0 && !objc_msgSend(v21, "length"))
        {

          v21 = 0;
          *a4 = 0;
        }
        -[WBSFormAutoFillClassificationToCorrectionsTransformer transformedValue:](self->_classificationToCorrectionsTransformer, "transformedValue:", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v19
          && v9
          && objc_msgSend(WeakRetained, "formFieldClassificationCorrector:hasAddressBookDataForAddressBookLabel:", self, v8))
        {
          -[WBSFormAutoFillClassificationToCorrectionsTransformer transformedValue:](self->_classificationToCorrectionsTransformer, "transformedValue:", &stru_1E4B40D18);
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          *a4 = 0;
          -[WBSFormAutoFillClassificationToCorrectionsTransformer transformedValue:](self->_classificationToCorrectionsTransformer, "transformedValue:", 0);
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v10 = (void *)v22;
      }

    }
  }
  else
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "fieldName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormFieldClassificationCorrector _classificationCorrectionsForControlWithMetadata:wasIdentifiedAsAddressBookField:].cold.1(v14, (uint64_t)v24, v13);
    }

    v10 = 0;
    *a4 = 0;
  }

  return v10;
}

- (WBSFormFieldClassificationCorrectorDelegate)delegate
{
  return (WBSFormFieldClassificationCorrectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (WBSFormMetadata)formMetadata
{
  return self->_formMetadata;
}

- (NSDictionary)formValues
{
  return self->_formValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formValues, 0);
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIDsOfControlsThatWereAutoFilled, 0);
  objc_storeStrong((id *)&self->_classificationToCorrectionsTransformer, 0);
}

- (void)_classificationCorrectionsForControlWithMetadata:(NSObject *)a3 wasIdentifiedAsAddressBookField:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_10(&dword_1A3D90000, a2, a3, "Field named '%@' is ineligible for AutoFill correction; returning nil corrections",
    (uint8_t *)a2);

}

@end
