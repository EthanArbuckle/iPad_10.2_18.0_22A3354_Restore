@implementation WBSFormTelemetryDataMonitor

- (WBSFormTelemetryDataMonitor)initWithWebpageLocale:(id)a3
{
  id v4;
  WBSFormTelemetryDataMonitor *v5;
  uint64_t v6;
  NSString *webpageLocale;
  WBSFormTelemetryDataMonitor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormTelemetryDataMonitor;
  v5 = -[WBSFormTelemetryDataMonitor init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    webpageLocale = v5->_webpageLocale;
    v5->_webpageLocale = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)updateFormTelemetryWithFormMetadata:(id)a3 textFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSFormTelemetryDataMonitor _isMonitoringTextFieldWithID:forFormID:](self, "_isMonitoringTextFieldWithID:forFormID:", v10, objc_msgSend(v12, "uniqueID"));

    if (!v11)
      -[WBSFormTelemetryDataMonitor _updateMonitorDataWithFormMetadata:](self, "_updateMonitorDataWithFormMetadata:", v12);
    -[WBSFormTelemetryDataMonitor _updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:](self, "_updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:", v9, a5, objc_msgSend(v12, "uniqueID"));
  }
  else
  {
    -[WBSFormTelemetryDataMonitor _updateMonitorDataWithFormMetadata:](self, "_updateMonitorDataWithFormMetadata:", v12);
  }

}

- (void)_updateMonitorDataWithFormMetadata:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *formIDToFormData;
  void *v7;
  void *v8;
  WBSFormTelemetryData *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  WBSSingleFieldTelemetryData *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_formIDToFormData)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    formIDToFormData = self->_formIDToFormData;
    self->_formIDToFormData = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_formIDToFormData, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[WBSFormTelemetryData initWithFormType:formID:]([WBSFormTelemetryData alloc], "initWithFormType:formID:", objc_msgSend(v4, "type"), (int)objc_msgSend(v7, "intValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_formIDToFormData, "setObject:forKeyedSubscript:", v9, v7);

  }
  objc_msgSend(v4, "controls");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_formIDToFormData, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fieldIDToSingleFieldData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v11 == v14)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "controls");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v20, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSFormTelemetryDataMonitor _updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:](self, "_updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:", v20, objc_msgSend(v21, "length"), (int)objc_msgSend(v7, "intValue"));

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v17);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = v4;
    objc_msgSend(v4, "controls");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v22)
    {
      v23 = v22;
      v37 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v25, "uniqueID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v7;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_formIDToFormData, "objectForKeyedSubscript:", v7);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "fieldIDToSingleFieldData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, v26);
          }
          else
          {
            v31 = -[WBSSingleFieldTelemetryData initWithFieldType:fieldID:elementType:]([WBSSingleFieldTelemetryData alloc], "initWithFieldType:fieldID:elementType:", objc_msgSend((id)objc_opt_class(), "formFieldTypeForFormControlMetadata:formMetadata:", v25, v35), v26, -[WBSFormTelemetryDataMonitor _elementTypeForFormControlMetadata:](self, "_elementTypeForFormControlMetadata:", v25));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, v26);

          }
          objc_msgSend(v15, "objectForKeyedSubscript:", v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "value");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSFormTelemetryDataMonitor _updateTelemetryFieldData:withTextFieldMetadata:textFieldValueLength:](self, "_updateTelemetryFieldData:withTextFieldMetadata:textFieldValueLength:", v32, v25, objc_msgSend(v33, "length"));

          v7 = v27;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v23);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_formIDToFormData, "objectForKeyedSubscript:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFieldIDToSingleFieldData:", v15);

    v4 = v35;
  }

}

- (BOOL)_isMonitoringTextFieldWithID:(id)a3 forFormID:(int64_t)a4
{
  id v6;
  NSMutableDictionary *formIDToFormData;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  formIDToFormData = self->_formIDToFormData;
  if (formIDToFormData)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](formIDToFormData, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "fieldIDToSingleFieldData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(formIDToFormData) = v11 != 0;

    }
    else
    {
      LOBYTE(formIDToFormData) = 0;
    }

  }
  return (char)formIDToFormData;
}

- (void)_updateMonitorDataWithTextFieldMetadata:(id)a3 textFieldValueLength:(unint64_t)a4 forFormID:(int64_t)a5
{
  NSMutableDictionary *formIDToFormData;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  formIDToFormData = self->_formIDToFormData;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](formIDToFormData, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fieldIDToSingleFieldData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormTelemetryDataMonitor _updateTelemetryFieldData:withTextFieldMetadata:textFieldValueLength:](self, "_updateTelemetryFieldData:withTextFieldMetadata:textFieldValueLength:", v15, v10, a4);
}

- (void)_updateTelemetryFieldData:(id)a3 withTextFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5
{
  id v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = objc_msgSend(v15, "wasPreviouslyAutoFilled");
  v9 = objc_msgSend(v7, "isAutoFilledTextField");
  v10 = objc_msgSend(v7, "isUserEditedTextField");
  v11 = 1;
  if (!v10)
    v11 = 2;
  if (!a5)
    v11 = 0;
  v12 = 4;
  if (a5)
    v12 = 5;
  if (v8)
    v11 = v12;
  if ((v9 & 1) != 0)
    v13 = 3;
  else
    v13 = v11;
  objc_msgSend(v15, "setModificationType:", v13);
  objc_msgSend(v15, "setIsAutoFilled:", v9);
  if (a5)
    v14 = v10;
  else
    v14 = 0;
  objc_msgSend(v15, "setIsManuallyFilledByUser:", v14);
  if (!objc_msgSend(v15, "fieldType") && objc_msgSend(v7, "looksLikeOneTimeCodeField"))
    objc_msgSend(v15, "setFieldType:", 24);
  if ((_DWORD)v9 && objc_msgSend(v15, "fieldType") == 24)
    objc_msgSend(v15, "setAutoFillOfferedType:", 2);

}

- (void)updateAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormMetadata:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if (!-[WBSFormTelemetryDataMonitor _isMonitoringTextFieldWithID:forFormID:](self, "_isMonitoringTextFieldWithID:forFormID:", v9, objc_msgSend(v8, "uniqueID")))-[WBSFormTelemetryDataMonitor _updateMonitorDataWithFormMetadata:](self, "_updateMonitorDataWithFormMetadata:", v8);
  -[WBSFormTelemetryDataMonitor _updateAutoFillOfferedType:forTextFieldWithID:forFormID:](self, "_updateAutoFillOfferedType:forTextFieldWithID:forFormID:", a3, v9, objc_msgSend(v8, "uniqueID"));

}

- (void)_updateAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormID:(int64_t)a5
{
  NSMutableDictionary *formIDToFormData;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  formIDToFormData = self->_formIDToFormData;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](formIDToFormData, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fieldIDToSingleFieldData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAutoFillOfferedType:", a3);
}

- (void)sendTelemetryEventsOnFormSubmission
{
  -[WBSFormTelemetryDataMonitor _sendModificationTelemetryEventsPerFormField](self, "_sendModificationTelemetryEventsPerFormField");
  -[WBSFormTelemetryDataMonitor _sendModificationTelemetryEventsPerForm](self, "_sendModificationTelemetryEventsPerForm");
  -[WBSFormTelemetryDataMonitor _sendUsageTelemetryEventsPerForm](self, "_sendUsageTelemetryEventsPerForm");
}

- (void)_sendModificationTelemetryEventsPerForm
{
  NSMutableDictionary *formIDToFormData;
  _QWORD v3[5];

  formIDToFormData = self->_formIDToFormData;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke;
  v3[3] = &unk_1E4B3A800;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](formIDToFormData, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[11];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[7];
  _QWORD v59[9];

  v59[7] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "formType") != 2 && objc_msgSend(v6, "formType"))
  {
    objc_msgSend(v6, "fieldIDToSingleFieldData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke_2;
    v29[3] = &unk_1E4B3A7D8;
    v29[4] = &v54;
    v29[5] = &v50;
    v29[6] = &v30;
    v29[7] = &v34;
    v29[8] = &v42;
    v29[9] = &v46;
    v29[10] = &v38;
    objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v29);
    if (v55[3])
    {
      v7 = objc_msgSend(v6, "formType");
      v8 = v51[3];
      v9 = v55[3];
      v10 = v31[3];
      v11 = v35[3];
      v12 = v10 + v8 + v11;
      if (v12)
      {
        v13 = (uint64_t)((double)v11 * 100.0 / (double)v12);
        v14 = (uint64_t)((double)v10 * 100.0 / (double)v12);
      }
      else
      {
        v13 = -1;
        v14 = -1;
      }
      v15 = v43[3];
      v16 = v47[3];
      v17 = v39[3];
      v58[0] = CFSTR("totalNumberOfFields");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9, v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v27;
      v58[1] = CFSTR("percentageOfFieldsAutoFilled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)((double)v8 * 100.0 / (double)v9));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v18;
      v58[2] = CFSTR("percentageOfFieldsManuallyFilledByUser");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)((double)v15 * 100.0 / (double)v9));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2] = v19;
      v58[3] = CFSTR("percentageOfFieldsManuallyFilledByWebsite");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)((double)v16 * 100.0 / (double)v9));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v59[3] = v20;
      v58[4] = CFSTR("percentageOfBlankFields");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)((double)v17 * 100.0 / (double)v9));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v59[4] = v21;
      v58[5] = CFSTR("percentageOfFieldsAutofilledThenModifiedOverFieldsEverAutoFilled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v59[5] = v22;
      v58[6] = CFSTR("percentageOfFieldsAutoFilledThenClearedOverFieldsEverAutoFilled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v59[6] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "didSubmitFormOfType:withPerFormModificationsDictionary:webpageLocale:", v26, v24, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);

  }
}

void __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "elementType");
  v5 = v8;
  if (v4 == 3)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v6 = objc_msgSend(v8, "modificationType");
    v5 = v8;
    switch(v6)
    {
      case 0:
        v7 = a1[10];
        goto LABEL_9;
      case 1:
        v7 = a1[8];
        goto LABEL_9;
      case 2:
        v7 = a1[9];
        goto LABEL_9;
      case 3:
        v7 = a1[5];
        goto LABEL_9;
      case 4:
        v7 = a1[6];
        goto LABEL_9;
      case 5:
        v7 = a1[7];
LABEL_9:
        ++*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
        break;
      default:
        break;
    }
  }

}

- (void)_sendModificationTelemetryEventsPerFormField
{
  NSMutableDictionary *formIDToFormData;
  _QWORD v3[5];

  formIDToFormData = self->_formIDToFormData;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke;
  v3[3] = &unk_1E4B3A800;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](formIDToFormData, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "fieldIDToSingleFieldData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke_2;
  v8[3] = &unk_1E4B3A828;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "elementType") == 3)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didSubmitFormOfType:withFieldType:elementType:isAutoFilled:isManuallyFilledByUser:modificationType:autoFillOfferedType:webpageLocale:", objc_msgSend(*(id *)(a1 + 32), "formType"), objc_msgSend(v5, "fieldType"), objc_msgSend(v5, "elementType"), objc_msgSend(v5, "isAutoFilled"), objc_msgSend(v5, "isManuallyFilledByUser"), objc_msgSend(v5, "modificationType"), objc_msgSend(v5, "autoFillOfferedType"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));

  }
}

- (void)_sendUsageTelemetryEventsPerForm
{
  NSMutableDictionary *formIDToFormData;
  _QWORD v3[5];

  formIDToFormData = self->_formIDToFormData;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke;
  v3[3] = &unk_1E4B3A800;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](formIDToFormData, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[16];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[7];
  _QWORD v75[9];

  v75[7] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "formType") != 2 && objc_msgSend(v6, "formType"))
  {
    objc_msgSend(v6, "fieldIDToSingleFieldData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke_2;
    v29[3] = &unk_1E4B3A850;
    v29[4] = *(_QWORD *)(a1 + 32);
    v29[5] = &v70;
    v29[6] = &v62;
    v29[7] = &v66;
    v29[8] = &v50;
    v29[9] = &v34;
    v29[10] = &v46;
    v29[11] = &v30;
    v29[12] = &v58;
    v29[13] = &v42;
    v29[14] = &v54;
    v29[15] = &v38;
    objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v29);
    if (v67[3])
    {
      v7 = objc_msgSend(v6, "formType");
      v8 = v51[3];
      if (v8)
        v9 = (uint64_t)((double)(unint64_t)v35[3] * 100.0 / (double)v8);
      else
        v9 = -1;
      v10 = v47[3];
      if (v10)
        v11 = (uint64_t)((double)(unint64_t)v31[3] * 100.0 / (double)v10);
      else
        v11 = -1;
      v12 = v59[3];
      if (v12)
        v13 = (uint64_t)((double)(unint64_t)v43[3] * 100.0 / (double)v12);
      else
        v13 = -1;
      v14 = v55[3];
      v26 = v7;
      if (v14)
        v15 = (uint64_t)((double)(unint64_t)v39[3] * 100.0 / (double)v14);
      else
        v15 = -1;
      v16 = v63[3];
      v17 = v67[3];
      v74[0] = CFSTR("totalNumberOfFields");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v71[3]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v27;
      v74[1] = CFSTR("totalNumberOfFieldsWhereAutoFillWasOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v67[3]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v18;
      v74[2] = CFSTR("percentageOfFieldsWhereAutoFillWasUsedOverOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)((double)v16 * 100.0 / (double)v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v19;
      v74[3] = CFSTR("percentageOfFieldsWherePasswordAutoFillWasUsedOverOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v20;
      v74[4] = CFSTR("percentageOfFieldsWhereOneTimeCodeAutoFillWasUsedOverOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v75[4] = v21;
      v74[5] = CFSTR("percentageOfFieldsWhereCreditCardAutoFillWasUsedOverOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v75[5] = v22;
      v74[6] = CFSTR("percentageOfFieldsWhereContactAutoFillWasUsedOverOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v75[6] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "didSubmitFormOfType:withPerFormUsageDictionary:webpageLocale:", v26, v24, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);

  }
}

void __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "elementType");
  v5 = v9;
  if (v4 == 3)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6 = objc_msgSend(*(id *)(a1 + 32), "_wasAutoFillUsedForModificationType:", objc_msgSend(v9, "modificationType"));
    if (v6)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v7 = objc_msgSend(v9, "autoFillOfferedType") - 1;
    v5 = v9;
    switch(v7)
    {
      case 0:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v5 = v9;
        if (v6)
        {
          v8 = *(_QWORD *)(a1 + 72);
          goto LABEL_13;
        }
        break;
      case 1:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v5 = v9;
        if (v6)
        {
          v8 = *(_QWORD *)(a1 + 88);
          goto LABEL_13;
        }
        break;
      case 2:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        v5 = v9;
        if (v6)
        {
          v8 = *(_QWORD *)(a1 + 104);
          goto LABEL_13;
        }
        break;
      case 3:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        v5 = v9;
        if (v6)
        {
          v8 = *(_QWORD *)(a1 + 120);
LABEL_13:
          ++*(_QWORD *)(*(_QWORD *)(v8 + 8) + 24);
          v5 = v9;
        }
        break;
      default:
        break;
    }
  }

}

- (BOOL)_wasAutoFillUsedForModificationType:(unint64_t)a3
{
  return a3 > 2;
}

+ (int64_t)formFieldTypeForFormControlMetadata:(id)a3 formMetadata:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  int v48;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "looksLikeOneTimeCodeField") & 1) == 0)
  {
    v8 = objc_msgSend(v6, "type") - 3;
    if ((objc_msgSend(v5, "isSecureTextField") & 1) != 0)
    {
      if (v8 >= 3)
        goto LABEL_9;
    }
    else
    {
      v9 = objc_msgSend(v5, "looksLikePasswordCredentialField");
      if (v8 > 2 || (v9 & 1) == 0)
      {
LABEL_9:
        if (+[WBSFormDataController isFieldUnidentified:](WBSFormDataController, "isFieldUnidentified:", v5)|| +[WBSFormDataController textFieldLooksLikeCreditCardFormField:inForm:](WBSFormDataController, "textFieldLooksLikeCreditCardFormField:inForm:", v5, v6))
        {
          if ((objc_msgSend(v5, "looksLikeCreditCardNumberField") & 1) != 0)
          {
            v7 = 2;
            goto LABEL_62;
          }
          if ((objc_msgSend(v5, "looksLikeCreditCardTypeField") & 1) != 0)
          {
            v7 = 6;
            goto LABEL_62;
          }
          if ((objc_msgSend(v5, "looksLikeCreditCardCardholderField") & 1) != 0)
          {
            v7 = 4;
            goto LABEL_62;
          }
          if ((objc_msgSend(v5, "looksLikeCreditCardCompositeExpirationDateField") & 1) != 0)
          {
            v7 = 3;
            goto LABEL_62;
          }
          if ((objc_msgSend(v5, "looksLikeCreditCardSecurityCodeField") & 1) != 0)
          {
            v7 = 5;
            goto LABEL_62;
          }
        }
        objc_msgSend(v5, "addressBookLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("email"));

        v12 = objc_msgSend(v5, "isLabeledUsernameField");
        if (objc_msgSend(v6, "type") == 4 && ((v11 | v12) & 1) != 0)
        {
          v7 = 23;
          goto LABEL_62;
        }
        objc_msgSend(v6, "userNameElementUniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uniqueID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "type") == 3 && (objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
        {
          v7 = 23;
LABEL_61:

          goto LABEL_62;
        }
        objc_msgSend(v5, "addressBookLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[WBSFormDataController specifierForAddressBookLabel:](WBSFormDataController, "specifierForAddressBookLabel:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "property");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D89D80]);

          if ((v20 & 1) != 0)
          {
            v7 = 7;
LABEL_46:

LABEL_60:
            goto LABEL_61;
          }
          objc_msgSend(v18, "property");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D89D68]);

          if ((v22 & 1) != 0)
          {
            v7 = 8;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D89D78]);

          if ((v24 & 1) != 0)
          {
            v7 = 9;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D89D70]);

          if ((v26 & 1) != 0)
          {
            v7 = 10;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D89D48]);

          if ((v28 & 1) != 0)
          {
            v7 = 18;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0D89D60]);

          if ((v30 & 1) != 0)
          {
            v7 = 19;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D89D40]);

          if ((v32 & 1) != 0)
          {
            v7 = 17;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0D89D58]);

          if ((v34 & 1) != 0)
          {
            v7 = 20;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("URLs"));

          if ((v36 & 1) != 0)
          {
            v7 = 21;
            goto LABEL_46;
          }
          objc_msgSend(v18, "property");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0D89D38]);

          if (v38)
          {
            objc_msgSend(v18, "component");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Street"));

            if ((v40 & 1) != 0)
            {
              v7 = 12;
              goto LABEL_46;
            }
            objc_msgSend(v18, "component");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("City"));

            if ((v42 & 1) != 0)
            {
              v7 = 13;
              goto LABEL_46;
            }
            objc_msgSend(v18, "component");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("State"));

            if ((v44 & 1) != 0)
            {
              v7 = 14;
              goto LABEL_46;
            }
            objc_msgSend(v18, "component");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("Country"));

            if ((v46 & 1) != 0)
            {
              v7 = 15;
              goto LABEL_46;
            }
            objc_msgSend(v18, "component");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("ZIP"));

            if (v48)
            {
              v7 = 16;
              goto LABEL_46;
            }
          }

        }
        v7 = objc_msgSend(v5, "looksLikeIgnoredDataTypeField");
        goto LABEL_60;
      }
    }
    v7 = 22;
    goto LABEL_62;
  }
  v7 = 24;
LABEL_62:

  return v7;
}

- (unint64_t)_elementTypeForFormControlMetadata:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isTextField"))
  {
    objc_msgSend(v3, "tagName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("TEXTAREA")))
      v5 = 4;
    else
      v5 = 3;

  }
  else
  {
    objc_msgSend(v3, "radioButtonInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v5 = 2;
    }
    else
    {
      objc_msgSend(v3, "selectElementInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v7 != 0;
    }
  }

  return v5;
}

- (NSString)webpageLocale
{
  return self->_webpageLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webpageLocale, 0);
  objc_storeStrong((id *)&self->_formIDToFormData, 0);
}

@end
