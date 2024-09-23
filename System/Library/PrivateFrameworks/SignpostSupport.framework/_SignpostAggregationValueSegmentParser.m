@implementation _SignpostAggregationValueSegmentParser

- (void)_clearFields
{
  -[_SignpostAggregationValueSegmentParser setGroup:](self, "setGroup:", 0);
  -[_SignpostAggregationValueSegmentParser setType:](self, "setType:", 0);
  -[_SignpostAggregationValueSegmentParser setValue:](self, "setValue:", 0);
  -[_SignpostAggregationValueSegmentParser setUnit:](self, "setUnit:", 0);
  -[_SignpostAggregationValueSegmentParser setTelemetryEnabled:](self, "setTelemetryEnabled:", 0);
}

- (id)processSegment:(id)a3 placeholderType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v4 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v4 > 0xD)
  {
    v11 = 0;
  }
  else
  {
    if (((1 << v4) & 0x3003) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected placeholder type: %u"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithCode:description:", 9, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    }
    v11 = ((1 << v4) & 0xC) != 0;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = v6;
  objc_msgSend(v6, "placeholderTokens");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v12)
    goto LABEL_28;
  v13 = v12;
  v14 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v53 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("telemetry=enabled")))
      {
        if (v11)
        {
          if (!-[_SignpostAggregationValueSegmentParser telemetryEnabled](self, "telemetryEnabled"))
          {
            -[_SignpostAggregationValueSegmentParser setTelemetryEnabled:](self, "setTelemetryEnabled:", 1);
            continue;
          }
          -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
          v33 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate telemetry enabled placeholder token for type: %u"), v4);
        }
        else
        {
          -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
          v33 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected telemetry enabled placeholder token for type: %u"), v4);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithCode:description:", 9, v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v50;
        goto LABEL_48;
      }
      _stringAfterPrefix(v16, (uint64_t)CFSTR("group="));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = v17;
        _checkTokenString(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          goto LABEL_40;
        -[_SignpostAggregationValueSegmentParser group](self, "group");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          v7 = v50;
          objc_msgSend(v50, "type");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("Duplicate groups for placeholder type '%@'"), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v37);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_47;
        }
        -[_SignpostAggregationValueSegmentParser setGroup:](self, "setGroup:", v18);
      }
      else
      {
        _stringAfterPrefix(v16, (uint64_t)CFSTR("type="));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v18 = v21;
          _checkTokenString(v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
LABEL_40:
            -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v19);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v50;
            goto LABEL_47;
          }
          -[_SignpostAggregationValueSegmentParser type](self, "type");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
            v43 = (void *)MEMORY[0x1E0CB3940];
            v7 = v50;
            objc_msgSend(v50, "type");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("Duplicate types for placeholder type '%@'"), v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v45);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_47:
LABEL_48:

            goto LABEL_49;
          }
          -[_SignpostAggregationValueSegmentParser setType:](self, "setType:", v18);
        }
        else
        {
          _stringAfterPrefix(v16, (uint64_t)CFSTR("measure_unit="));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[_SignpostAggregationValueSegmentParser unit](self, "unit");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
              v47 = (void *)MEMORY[0x1E0CB3940];
              v7 = v50;
              objc_msgSend(v50, "type");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "stringWithFormat:", CFSTR("Duplicate units for placeholder type '%@'"), v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v49);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_48;
            }
            -[_SignpostAggregationValueSegmentParser setUnit:](self, "setUnit:", v18);
          }
        }
      }

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v13)
      continue;
    break;
  }
LABEL_28:

  -[_SignpostAggregationValueSegmentParser group](self, "group");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
    v34 = (void *)MEMORY[0x1E0CB3940];
    v7 = v50;
    objc_msgSend(v50, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Missing group token for placeholder type '%@'"), v32);
LABEL_44:
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_49;
  }
  -[_SignpostAggregationValueSegmentParser type](self, "type");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v50;
  if (!v25)
  {
    -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v50, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("Missing type token for placeholder type '%@'"), v32);
    goto LABEL_44;
  }
  objc_msgSend(v50, "argument");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "type");

  if (v27 != 3)
  {
    -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v50, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Invalid (non-number) argument type for placeholder type '%@'"), v32);
    goto LABEL_44;
  }
  if (processSegment_placeholderType__onceToken != -1)
    dispatch_once(&processSegment_placeholderType__onceToken, &__block_literal_global_20);
  v28 = (void *)processSegment_placeholderType__kNanNumber;
  objc_msgSend(v50, "argument");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "argumentObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = objc_msgSend(v28, "isEqualToNumber:", v30);

  if ((_DWORD)v28)
  {
    -[_SignpostAggregationValueSegmentParser _clearFields](self, "_clearFields");
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v50, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Invalid NaN encountered for value of placeholder type '%@'"), v32);
    goto LABEL_44;
  }
  objc_msgSend(v50, "argument");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "argumentObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SignpostAggregationValueSegmentParser setValue:](self, "setValue:", v42);

  v10 = 0;
LABEL_49:

  return v10;
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
