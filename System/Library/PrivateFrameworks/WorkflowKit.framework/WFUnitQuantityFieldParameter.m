@implementation WFUnitQuantityFieldParameter

- (WFUnitQuantityFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  WFUnitQuantityFieldParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *unitType;
  void *v10;
  uint64_t v11;
  void *v12;
  WFUnitQuantityFieldParameter *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFUnitQuantityFieldParameter;
  v5 = -[WFQuantityFieldParameter initWithDefinition:](&v15, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("WFUnitType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    unitType = v5->_unitType;
    v5->_unitType = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("FallbackToAllSupportedUnits"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fallbackToAllSupportedUnits = objc_msgSend(v12, "BOOLValue");

    -[WFUnitQuantityFieldParameter updatePossibleUnits](v5, "updatePossibleUnits");
    v13 = v5;
  }

  return v5;
}

- (void)setUnitType:(id)a3
{
  NSString *v4;
  NSString *unitType;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSUnit **p_defaultUnit;
  NSUnit *v10;
  NSString *v11;

  v4 = (NSString *)a3;
  unitType = self->_unitType;
  if (unitType != v4)
  {
    v11 = v4;
    v6 = -[NSString isEqualToString:](unitType, "isEqualToString:", v4);
    v4 = v11;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v11, "copy");
      v8 = self->_unitType;
      self->_unitType = v7;

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0DC7BE8], "unitClassForUnitType:");
        p_defaultUnit = &self->_defaultUnit;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_8;
      }
      else
      {
        p_defaultUnit = &self->_defaultUnit;
      }
      v10 = *p_defaultUnit;
      *p_defaultUnit = 0;

LABEL_8:
      -[WFUnitQuantityFieldParameter updatePossibleUnits](self, "updatePossibleUnits");
      -[WFParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
      v4 = v11;
    }
  }

}

- (void)setDefaultUnit:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFUnitQuantityFieldParameter unitType](self, "unitType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v8
      || (v6 = (void *)MEMORY[0x1E0DC7BE8],
          -[WFUnitQuantityFieldParameter unitType](self, "unitType"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "unitClassForUnitType:", v7),
          v7,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_storeStrong((id *)&self->_defaultUnit, a3);
      -[WFParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
    }
  }

}

- (void)setFallbackToAllSupportedUnits:(BOOL)a3
{
  void *v4;

  if (self->_fallbackToAllSupportedUnits != a3)
  {
    self->_fallbackToAllSupportedUnits = a3;
    -[WFUnitQuantityFieldParameter unitType](self, "unitType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[WFUnitQuantityFieldParameter updatePossibleUnits](self, "updatePossibleUnits");
      -[WFParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
    }
  }
}

- (id)availableUnitForStringValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sec")))
  {
    objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("min")))
  {
    objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("hr")))
    {
      -[WFUnitQuantityFieldParameter unitSymbolMap](self, "unitSymbolMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (void)updatePossibleUnits
{
  WFUnitQuantityFieldParameter *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *possibleUnits;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *v26;
  uint64_t v27;
  NSDictionary *unitSymbolMap;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSArray *v44;
  uint64_t v45;
  NSDictionary *v46;
  NSArray *v47;
  NSDictionary *v48;
  WFUnitQuantityFieldParameter *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v2 = self;
  v71 = *MEMORY[0x1E0C80C00];
  -[WFUnitQuantityFieldParameter unitType](self, "unitType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFParameter definition](v2, "definition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("PossibleUnits"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = (void *)objc_opt_new();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v64 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(MEMORY[0x1E0DC7BE8], "unitFromString:unitType:caseSensitive:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i), v3, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "symbol");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v12, v13);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        }
        while (v9);
      }

      v14 = objc_msgSend(v7, "copy");
      possibleUnits = v2->_possibleUnits;
      v2->_possibleUnits = (NSArray *)v14;

      v16 = v6;
    }
    else
    {

      v7 = (id)objc_opt_new();
      v6 = (void *)objc_opt_new();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(MEMORY[0x1E0DC7BE8], "availableUnitsForUnitType:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v60 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_msgSend(v22, "symbol");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v22, v23);

            objc_msgSend(v22, "symbol");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v24);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        }
        while (v19);
      }

      v25 = objc_msgSend(v6, "copy");
      v26 = v2->_possibleUnits;
      v2->_possibleUnits = (NSArray *)v25;

      v16 = v7;
    }
    v27 = objc_msgSend(v16, "copy");
    unitSymbolMap = v2->_unitSymbolMap;
    v2->_unitSymbolMap = (NSDictionary *)v27;

  }
  else if (-[WFUnitQuantityFieldParameter fallbackToAllSupportedUnits](v2, "fallbackToAllSupportedUnits"))
  {
    v49 = v2;
    v29 = (void *)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(MEMORY[0x1E0DC7BE8], "availableUnitTypes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v56 != v32)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k);
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(MEMORY[0x1E0DC7BE8], "availableUnitsForUnitType:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v52;
            do
            {
              for (m = 0; m != v37; ++m)
              {
                if (*(_QWORD *)v52 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * m);
                objc_msgSend(v40, "symbol");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setObject:forKey:", v40, v41);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
            }
            while (v37);
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v31);
    }

    objc_msgSend(v29, "allKeys");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
    v43 = objc_claimAutoreleasedReturnValue();
    v2 = v49;
    v44 = v49->_possibleUnits;
    v49->_possibleUnits = (NSArray *)v43;

    v45 = objc_msgSend(v29, "copy");
    v46 = v49->_unitSymbolMap;
    v49->_unitSymbolMap = (NSDictionary *)v45;

    v3 = 0;
  }
  else
  {
    v47 = v2->_possibleUnits;
    v2->_possibleUnits = (NSArray *)MEMORY[0x1E0C9AA60];

    v48 = v2->_unitSymbolMap;
    v2->_unitSymbolMap = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  -[WFParameter attributesDidChange](v2, "attributesDidChange");

}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  uint64_t v29;

  -[WFUnitQuantityFieldParameter availableUnitForStringValue:](self, "availableUnitForStringValue:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3AD0], "bytes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        v9 = CFSTR("bytes");
LABEL_22:
        WFLocalizedString(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isEqual:", v11);

      if (v12)
      {
        v9 = CFSTR("KB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "megabytes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "isEqual:", v13);

      if (v14)
      {
        v9 = CFSTR("MB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "gigabytes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v6, "isEqual:", v15);

      if (v16)
      {
        v9 = CFSTR("GB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "terabytes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "isEqual:", v17);

      if (v18)
      {
        v9 = CFSTR("TB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "petabytes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v6, "isEqual:", v19);

      if (v20)
      {
        v9 = CFSTR("PB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "exabytes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "isEqual:", v21);

      if (v22)
      {
        v9 = CFSTR("EB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "zettabytes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v6, "isEqual:", v23);

      if (v24)
      {
        v9 = CFSTR("ZB");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3AD0], "yottabytes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v6, "isEqual:", v25);

      if (v26)
      {
        v9 = CFSTR("YB");
        goto LABEL_22;
      }
    }
    v27 = objc_alloc_init(MEMORY[0x1E0CB3760]);
    v28 = v27;
    if (a5)
    {
      if (a5 != 1)
      {
LABEL_28:
        objc_msgSend(v28, "stringFromUnit:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      }
      v29 = 3;
    }
    else
    {
      v29 = 1;
    }
    objc_msgSend(v27, "setUnitStyle:", v29);
    goto LABEL_28;
  }
  v10 = 0;
LABEL_29:

  return v10;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "unitString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[WFUnitQuantityFieldParameter availableUnitForStringValue:](self, "availableUnitForStringValue:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

    }
    else
    {
      v11 = v4;
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();
      if ((v12 & 1) != 0)
        v13 = v11;
      else
        v13 = 0;
      v8 = v13;

      if ((v12 & 1) != 0)
      {
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v20 = 1;
        objc_msgSend(v11, "parameterStates");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __54__WFUnitQuantityFieldParameter_parameterStateIsValid___block_invoke;
        v16[3] = &unk_1E7AF9A38;
        v16[4] = self;
        v16[5] = &v17;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

        v10 = *((_BYTE *)v18 + 24) != 0;
        _Block_object_dispose(&v17, 8);
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)defaultUnitString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  -[WFUnitQuantityFieldParameter defaultUnit](self, "defaultUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbol");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[WFParameter definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("DefaultUnit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC7BE8], "unitFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v4 = v8;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC7BE8];
      -[WFUnitQuantityFieldParameter unitType](self, "unitType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultUnitForUnitType:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "symbol");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      -[WFUnitQuantityFieldParameter possibleUnits](self, "possibleUnits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = objc_msgSend(v13, "containsObject:", v4);

      if ((v12 & 1) == 0)
      {
        -[WFUnitQuantityFieldParameter possibleUnits](self, "possibleUnits");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v15;
      }
    }

  }
  return (NSString *)v4;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  WFNumberStringSubstitutableState *v8;
  void *v9;
  WFNumberStringSubstitutableState *v10;
  void *v11;
  void *v12;
  WFQuantityParameterState *v13;

  -[WFUnitQuantityFieldParameter unitType](self, "unitType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFParameter definition](self, "definition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("DefaultValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    WFEnforceClass(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [WFNumberStringSubstitutableState alloc];
      objc_msgSend(v7, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFNumberStringSubstitutableState initWithValue:](v8, "initWithValue:", v9);

    }
    else
    {
      v10 = 0;
    }
    -[WFUnitQuantityFieldParameter defaultUnitString](self, "defaultUnitString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[WFQuantityParameterState initWithMagnitudeState:unitString:]([WFQuantityParameterState alloc], "initWithMagnitudeState:unitString:", v10, v12);
      -[WFQuantityParameterState serializedRepresentation](v13, "serializedRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)possibleUnits
{
  return self->_possibleUnits;
}

- (void)setPossibleUnits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)unitType
{
  return self->_unitType;
}

- (NSUnit)defaultUnit
{
  return self->_defaultUnit;
}

- (BOOL)fallbackToAllSupportedUnits
{
  return self->_fallbackToAllSupportedUnits;
}

- (NSDictionary)unitSymbolMap
{
  return self->_unitSymbolMap;
}

- (void)setUnitSymbolMap:(id)a3
{
  objc_storeStrong((id *)&self->_unitSymbolMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitSymbolMap, 0);
  objc_storeStrong((id *)&self->_defaultUnit, 0);
  objc_storeStrong((id *)&self->_unitType, 0);
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

void __54__WFUnitQuantityFieldParameter_parameterStateIsValid___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;

  v6 = a2;
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "parameterStateIsValid:", v10);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v9 = 0;
  }
  *(_BYTE *)(v8 + 24) = v9;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

@end
