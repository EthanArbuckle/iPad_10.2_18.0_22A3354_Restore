@implementation WFLinkActionPlacemarkParameterDefinition

- (WFLinkActionPlacemarkParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionPlacemarkParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "placemarkValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPlacemarkParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43A98], 0) == 2)objc_msgSend(v3, "setValue:forKey:", CFSTR("ThreeKilometers"), CFSTR("CurrentLocationAccuracy"));
  v7.receiver = self;
  v7.super_class = (Class)WFLinkActionPlacemarkParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v7, sel_parameterDefinitionDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "definitionByAddingEntriesInDictionary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placemark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0C9E3F0]);
    objc_msgSend(v9, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "placemark");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithPlacemark:", v14);

    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[5];
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE buf[24];
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (v11)
  {
    v16 = v11;
    objc_opt_class();
    v17 = objc_opt_isKindOfClass() & 1;
    if (v17)
      v18 = v16;
    else
      v18 = 0;
    v19 = v18;

    if (v17)
    {
      v20 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __156__WFLinkActionPlacemarkParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
      v25[3] = &unk_1E7AF3D60;
      v25[4] = self;
      v26 = v15;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v21 = (void *)getCLPlacemarkClass_softClass;
      v30 = getCLPlacemarkClass_softClass;
      if (!getCLPlacemarkClass_softClass)
      {
        *(_QWORD *)buf = v20;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCLPlacemarkClass_block_invoke;
        v32 = &unk_1E7AF9520;
        v33 = &v27;
        __getCLPlacemarkClass_block_invoke((uint64_t)buf);
        v21 = (void *)v28[3];
      }
      v22 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v27, 8);
      objc_msgSend(v16, "getObjectRepresentation:forClass:", v25, v22);

    }
    else
    {
      getWFActionsLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFLinkActionPlacemarkParameterDefinition getLinkValueFromProcessedParameterValue:paramete"
                             "rState:permissionRequestor:runningFromToolKit:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = objc_opt_class();
        v24 = *(id *)&buf[14];
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s Action expected WFContentCollection as processed parameter type for placemark, but got %@ instead", buf, 0x16u);

      }
      v15[2](v15, 0, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  WFLocationValue *v13;
  WFLocationParameterState *v14;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "objectIsMemberOfType:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = -[WFLocationValue initWithPlacemark:]([WFLocationValue alloc], "initWithPlacemark:", v12);
    v14 = -[WFLocationParameterState initWithValue:]([WFLocationParameterState alloc], "initWithValue:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  uint64_t v4;
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = *MEMORY[0x1E0D43A98];
  v5 = a3;
  v6 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", v4, 0);
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 2)
  {
    objc_msgSend(v7, "locality");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 == 1)
      -[WFLinkActionPlacemarkParameterDefinition addressForPlacemark:](self, "addressForPlacemark:", v7);
    else
      -[WFLinkActionPlacemarkParameterDefinition nameForPlacemark:](self, "nameForPlacemark:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)nameForPlacemark:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v4, "name");
  else
    -[WFLinkActionPlacemarkParameterDefinition addressForPlacemark:](self, "addressForPlacemark:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addressForPlacemark:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "formattedAddressLines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "formattedAddressLines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v8 = (void *)getCNPostalAddressFormatterClass_softClass;
    v16 = getCNPostalAddressFormatterClass_softClass;
    if (!getCNPostalAddressFormatterClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getCNPostalAddressFormatterClass_block_invoke;
      v12[3] = &unk_1E7AF9520;
      v12[4] = &v13;
      __getCNPostalAddressFormatterClass_block_invoke((uint64_t)v12);
      v8 = (void *)v14[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v3, "postalAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "singleLineStringFromPostalAddress:addCountryName:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

void __156__WFLinkActionPlacemarkParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3F0]), "initWithPlacemark:", v8);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_alloc(MEMORY[0x1E0D43E38]);
    objc_msgSend(*(id *)(a1 + 32), "valueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithValue:valueType:", v3, v6);
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v7, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
