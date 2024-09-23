@implementation WFLinkActionMeasurementParameterDefinition

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  objc_super v65;
  objc_super v66;
  void *v67;
  _QWORD v68[22];
  _QWORD v69[24];

  v69[22] = *MEMORY[0x1E0C80C00];
  -[WFLinkActionParameterDefinition valueType](self, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = *MEMORY[0x1E0DC8230];
  v68[0] = &unk_1E7B8B008;
  v68[1] = &unk_1E7B8B020;
  v7 = *MEMORY[0x1E0DC8258];
  v69[0] = v6;
  v69[1] = v7;
  v8 = *MEMORY[0x1E0DC8238];
  v68[2] = &unk_1E7B8B038;
  v68[3] = &unk_1E7B8B050;
  v9 = *MEMORY[0x1E0DC8260];
  v69[2] = v8;
  v69[3] = v9;
  v10 = *MEMORY[0x1E0DC8250];
  v68[4] = &unk_1E7B8B068;
  v68[5] = &unk_1E7B8B080;
  v11 = *MEMORY[0x1E0DC8208];
  v69[4] = v10;
  v69[5] = v11;
  v12 = *MEMORY[0x1E0DC81E0];
  v68[6] = &unk_1E7B8B098;
  v68[7] = &unk_1E7B8B0B0;
  v13 = *MEMORY[0x1E0DC81B8];
  v69[6] = v12;
  v69[7] = v13;
  v14 = *MEMORY[0x1E0DC81C0];
  v68[8] = &unk_1E7B8B0C8;
  v68[9] = &unk_1E7B8B0E0;
  v15 = *MEMORY[0x1E0DC81C8];
  v69[8] = v14;
  v69[9] = v15;
  v16 = *MEMORY[0x1E0DC81D0];
  v68[10] = &unk_1E7B8B0F8;
  v68[11] = &unk_1E7B8B110;
  v17 = *MEMORY[0x1E0DC81D8];
  v69[10] = v16;
  v69[11] = v17;
  v18 = *MEMORY[0x1E0DC81E8];
  v68[12] = &unk_1E7B8B128;
  v68[13] = &unk_1E7B8B140;
  v19 = *MEMORY[0x1E0DC81F0];
  v69[12] = v18;
  v69[13] = v19;
  v20 = *MEMORY[0x1E0DC81F8];
  v68[14] = &unk_1E7B8B158;
  v68[15] = &unk_1E7B8B170;
  v21 = *MEMORY[0x1E0DC8200];
  v69[14] = v20;
  v69[15] = v21;
  v22 = *MEMORY[0x1E0DC8210];
  v68[16] = &unk_1E7B8B188;
  v68[17] = &unk_1E7B8B1A0;
  v23 = *MEMORY[0x1E0DC8218];
  v69[16] = v22;
  v69[17] = v23;
  v24 = *MEMORY[0x1E0DC8220];
  v68[18] = &unk_1E7B8B1B8;
  v68[19] = &unk_1E7B8B1D0;
  v25 = *MEMORY[0x1E0DC8228];
  v69[18] = v24;
  v69[19] = v25;
  v68[20] = &unk_1E7B8B1E8;
  v68[21] = &unk_1E7B8B200;
  v26 = *MEMORY[0x1E0DC8248];
  v69[20] = *MEMORY[0x1E0DC8240];
  v69[21] = v26;
  v27 = (void *)MEMORY[0x1E0C99D80];
  v28 = v5;
  objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v69, v68, 22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend(v28, "unitType");

  objc_msgSend(v30, "numberWithInteger:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    v66.receiver = self;
    v66.super_class = (Class)WFLinkActionMeasurementParameterDefinition;
    -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v66, sel_parameterDefinitionDictionary);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "typeSpecificMetadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0D43B00]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "BOOLValue");

  objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0D43B08]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0D43B10]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0D43AF8]);
  v41 = objc_claimAutoreleasedReturnValue();
  if (v40)
    v42 = v40;
  else
    v42 = (void *)v41;
  objc_msgSend(MEMORY[0x1E0DC7BE8], "unitFromString:unitType:caseSensitive:", v42, v33, 0, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v39)
  {
    v46 = v44;
    WFMetricToImperialUnitMapping();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "containsObject:", v46);

    WFImperialToMetricUnitMapping();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "allKeys");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "containsObject:", v46);

    if ((v49 & 1) == 0 && (v52 & 1) == 0)
    {
      v45 = v46;
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0DC7BE8], "unitTypeForUnitClass:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(MEMORY[0x1E0DC7BE8], "usesMetricSystemForUnitType:", v53);
    if ((v49 & v54) != 1 && ((v52 ^ 1 | v54) & 1) != 0)
    {
      if (v49)
      {
        WFMetricToImperialUnitMapping();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        v56 = v55;
        objc_msgSend(v55, "objectForKey:", v46);
        v45 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
        goto LABEL_24;
      }
      if (v52)
      {
        WFImperialToMetricUnitMapping();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    v45 = v46;
    goto LABEL_23;
  }
LABEL_25:
  v57 = (void *)objc_opt_new();
  objc_msgSend(v57, "setValue:forKey:", v33, CFSTR("WFUnitType"));
  objc_msgSend(v45, "symbol");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setValue:forKey:", v58, CFSTR("DefaultUnit"));

  if (v40)
  {
    objc_msgSend(v45, "symbol");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setValue:forKey:", v60, CFSTR("PossibleUnits"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setValue:forKey:", v61, CFSTR("AllowsNegativeNumbers"));

  v65.receiver = self;
  v65.super_class = (Class)WFLinkActionMeasurementParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v65, sel_parameterDefinitionDictionary);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "definitionByAddingEntriesInDictionary:", v57);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  return v43;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (id)unitFromUnitString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC7BE8], "unitFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("sec")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v5;
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("min")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("hr")))
    {
      objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    getWFAppIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315394;
      v9 = "-[WFLinkActionMeasurementParameterDefinition unitFromUnitString:]";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Unexpected nil WFMeasurementUnit for unit string: %@", (uint8_t *)&v8, 0x16u);
    }

    v4 = 0;
  }
LABEL_9:

  return v4;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "magnitudeState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "decimalNumber");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v8, "unitString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v18 = 0;
          v19 = v8;
          goto LABEL_11;
        }
        objc_msgSend(v8, "unitString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFLinkActionMeasurementParameterDefinition unitFromUnitString:](self, "unitFromUnitString:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(v8, "magnitudeState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v17 = (void *)objc_msgSend(v14, "initWithDoubleValue:unit:", v9);

        -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }
      v19 = v8;
    }
    else
    {
      v19 = 0;
      v18 = 0;
      v9 = v8;
    }
  }
  else
  {
    v9 = 0;
    v19 = 0;
    v18 = 0;
  }

LABEL_11:
  return v18;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  id v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = v11;
  v23 = v15;
  if (v15 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v15 = v23, (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v23, "unitString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkActionMeasurementParameterDefinition unitFromUnitString:](self, "unitFromUnitString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3758]);
      objc_msgSend(v23, "magnitude");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v21 = (void *)objc_msgSend(v19, "initWithDoubleValue:unit:", v18);

      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v22, 0);

    }
    else
    {
      v14[2](v14, 0, 0);
    }

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  WFNumberStringSubstitutableState *v6;
  void *v7;
  WFNumberStringSubstitutableState *v8;
  WFQuantityParameterState *v9;
  void *v10;
  void *v11;
  WFQuantityParameterState *v12;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3598]);
    objc_msgSend(v3, "doubleValue");
    v5 = (void *)objc_msgSend(v4, "initWithDouble:");
    v6 = [WFNumberStringSubstitutableState alloc];
    objc_msgSend(v5, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFNumberStringSubstitutableState initWithValue:](v6, "initWithValue:", v7);

    v9 = [WFQuantityParameterState alloc];
    objc_msgSend(v3, "unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "symbol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v9, "initWithMagnitudeState:unitString:", v8, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3760];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v5, "stringFromMeasurement:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
