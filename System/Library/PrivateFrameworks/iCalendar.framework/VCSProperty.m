@implementation VCSProperty

- (VCSProperty)initWithName:(id)a3 values:(id)a4
{
  id v7;
  id v8;
  VCSProperty *v9;
  VCSProperty *v10;
  uint64_t v11;
  NSMutableArray *values;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCSProperty;
  v9 = -[VCSProperty init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    values = v10->_values;
    v10->_values = (NSMutableArray *)v11;

  }
  return v10;
}

- (VCSProperty)initWithName:(id)a3 value:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  VCSProperty *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[VCSProperty initWithName:values:](self, "initWithName:values:", v8, v9, v12, v13);
  return v10;
}

- (VCSProperty)initWithName:(id)a3 rawValues:(id)a4 type:(unint64_t)a5
{
  id v7;
  void *v8;
  VCSProperty *v9;
  _QWORD v11[5];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__VCSProperty_initWithName_rawValues_type___block_invoke;
  v11[3] = &__block_descriptor_40_e26___VCSPropertyValue_16__0_8l;
  v11[4] = a5;
  v7 = a3;
  objc_msgSend(a4, "VCS_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VCSProperty initWithName:values:](self, "initWithName:values:", v7, v8);

  return v9;
}

VCSPropertyValue *__43__VCSProperty_initWithName_rawValues_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VCSPropertyValue *v4;

  v3 = a2;
  v4 = -[VCSPropertyValue initWithValue:type:]([VCSPropertyValue alloc], "initWithValue:type:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (VCSProperty)initWithName:(id)a3 rawValue:(id)a4 type:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  VCSProperty *v13;
  VCSProperty *v14;
  id v15;
  VCSProperty *v16;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v18 = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a3;
    objc_msgSend(v10, "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VCSProperty initWithName:rawValues:type:](self, "initWithName:rawValues:type:", v11, v12, a5, v18, v19);

    v14 = v13;
  }
  else
  {
    v15 = a3;
    v16 = -[VCSProperty initWithName:rawValues:type:](self, "initWithName:rawValues:type:", v15, MEMORY[0x1E0C9AA60], a5);

    v14 = v16;
  }

  return v14;
}

- (VCSProperty)initWithVCSLine:(id)a3 parseState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  const $E9F79BE52C26C7385FEA6DDCC3A6974D *v10;
  const $E9F79BE52C26C7385FEA6DDCC3A6974D *v11;
  id v12;
  NSObject *v13;
  VCSProperty *v14;
  __int128 v15;
  id v16;
  int v17;
  NSObject *v18;
  VCSProperty *v19;
  void *v21;
  VCSAlarm *v22;
  id v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  VCSPropertyValue *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  void *v48;
  void *v49;
  id var4;
  VCSAttachment *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "tokenID");
  v9 = objc_msgSend(v7, "context");
  v10 = +[VCSParsedLine lookupProperty:](VCSParsedLine, "lookupProperty:", v8);
  if (!v10)
  {
    VCSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VCSProperty initWithVCSLine:parseState:].cold.1(v6);
    goto LABEL_9;
  }
  v11 = v10;
  if ((v10->var1 & v9) == 0)
  {
    VCSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VCSProperty initWithVCSLine:parseState:].cold.2(v6);
LABEL_9:

LABEL_10:
    v14 = 0;
    goto LABEL_28;
  }
  switch(v10->var2)
  {
    case 5uLL:
      v12 = -[VCSProperty initIntProperty:withParseState:property:](self, "initIntProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 7uLL:
      v12 = -[VCSProperty initISO8061Property:withParseState:property:](self, "initISO8061Property:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 8uLL:
      v12 = -[VCSProperty initRFC822AddressProperty:withParseState:property:](self, "initRFC822AddressProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 9uLL:
      v12 = -[VCSProperty initStatusProperty:withParseState:property:](self, "initStatusProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0xAuLL:
      v12 = -[VCSProperty initEncodedTextProperty:withParseState:property:](self, "initEncodedTextProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0xBuLL:
      v12 = -[VCSProperty initRecurrenceProperty:withParseState:property:](self, "initRecurrenceProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0xCuLL:
      v12 = -[VCSProperty initISO8061DateListProperty:withParseState:property:](self, "initISO8061DateListProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0xDuLL:
      v12 = -[VCSProperty initKeywordListProperty:withParseState:property:](self, "initKeywordListProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0xEuLL:
      v12 = -[VCSProperty initURIProperty:withParseState:property:](self, "initURIProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0x11uLL:
      v12 = -[VCSProperty initClassificationProperty:withParseState:property:](self, "initClassificationProperty:withParseState:property:", v6, v7, v10);
      goto LABEL_26;
    case 0x12uLL:
      v12 = -[VCSProperty initTranspProperty:withParseState:property:](self, "initTranspProperty:withParseState:property:", v6, v7, v10);
LABEL_26:
      v19 = (VCSProperty *)v12;
      goto LABEL_27;
    case 0x13uLL:
      objc_msgSend(v7, "currentEntity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[VCSAlarm initWithLine:parseState:property:]([VCSAlarm alloc], "initWithLine:parseState:property:", v6, v7, v11);
      objc_msgSend(v21, "addChildEntity:", v22);

      goto LABEL_10;
    default:
      self = -[VCSProperty init](self, "init");
      *((_QWORD *)&v15 + 1) = v8;
      *(_QWORD *)&v15 = v8 - 8;
      switch((unint64_t)(v15 >> 1))
      {
        case 0uLL:
          objc_msgSend(v6, "content");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = strcmp((const char *)objc_msgSend(v16, "bytes"), "PalmDesktop Generated");

          if (!v17)
          {
            VCSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              -[VCSProperty initWithVCSLine:parseState:].cold.6(v18);

            objc_msgSend(v7, "setPalmImport:", 1);
          }
          goto LABEL_55;
        case 1uLL:
          objc_msgSend(v6, "content");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = strcmp((const char *)objc_msgSend(v23, "bytes"), "1.0");

          if (!v24)
            goto LABEL_55;
          VCSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[VCSProperty initWithVCSLine:parseState:].cold.5(v6);

          objc_msgSend(v7, "setStatus:", 2);
          goto LABEL_10;
        case 2uLL:
          objc_msgSend(v6, "params");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", CFSTR("VALUE"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            if (objc_msgSend(v27, "isEqual:", CFSTR("URL")))
            {
              v29 = (void *)MEMORY[0x1E0C99E98];
              v30 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v6, "content");
              v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v30, "stringWithUTF8String:", objc_msgSend(v31, "bytes"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "URLWithString:encodingInvalidCharacters:", v32, 0);
              v33 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              if (!objc_msgSend(v28, "isEqual:", CFSTR("CONTENT-ID")))
              {
LABEL_51:
                VCSLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  -[VCSProperty initWithVCSLine:parseState:].cold.4(v33, v52, v53, v54, v55, v56, v57, v58);
                goto LABEL_53;
              }
              v31 = (id)objc_msgSend(CFSTR("CID:"), "mutableCopy");
              objc_msgSend(v6, "content");
              v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v47 = (const char *)objc_msgSend(v46, "bytes");

              if (*v47 == 60 && v47[strlen(v47) - 1] == 62)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v47 + 1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "appendString:", v48);

                objc_msgSend(v31, "deleteCharactersInRange:", objc_msgSend(v31, "length") - 1, 1);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v47);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "appendString:", v49);

              }
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v31, 0);
              v33 = objc_claimAutoreleasedReturnValue();
            }

            if (v33)
            {
              var4 = v11->var4;
              v51 = -[VCSAttachment initWithURL:]([VCSAttachment alloc], "initWithURL:", v33);
              self = -[VCSProperty initWithName:value:](self, "initWithName:value:", var4, v51);

              goto LABEL_53;
            }
            goto LABEL_51;
          }
          VCSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[VCSProperty initWithVCSLine:parseState:].cold.3(v33, v39, v40, v41, v42, v43, v44, v45);
LABEL_53:

LABEL_54:
LABEL_55:
          v19 = self;
LABEL_27:
          self = v19;
          v14 = v19;
          break;
        case 9uLL:
          objc_msgSend(v6, "convertedContent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("; "));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[VCSPropertyValue initWithValue:type:]([VCSPropertyValue alloc], "initWithValue:type:", v28, 3);
          objc_msgSend(v6, "params");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("VALUE"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v36 && objc_msgSend(v36, "isEqual:", CFSTR("URL")))
          {
            -[VCSProperty singleValue](self, "singleValue");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCSPropertyValue addParameter:withValue:](v34, "addParameter:withValue:", CFSTR("ALTREP"), v38);

          }
          self = -[VCSProperty initWithName:value:](self, "initWithName:value:", v11->var4, v34);

          goto LABEL_54;
        default:
          goto LABEL_55;
      }
      break;
  }
LABEL_28:

  return v14;
}

- (id)initISO8061Property:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7;
  id v8;
  VCSDate *v9;
  id v10;
  VCSDate *v11;
  VCSProperty *v12;

  v7 = a3;
  v8 = a5->var4;
  v9 = [VCSDate alloc];
  objc_msgSend(v7, "content");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = -[VCSDate initWithDateString:](v9, "initWithDateString:", objc_msgSend(v10, "bytes"));

  if (!v8)
  {
    objc_msgSend(v7, "keyword");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v8, v11, 7);

  return v12;
}

- (id)initISO8061DateListProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  VCSProperty *v11;

  v7 = a3;
  v8 = a5->var4;
  objc_msgSend(v7, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCSDate dateListFromData:](VCSDate, "dateListFromData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v7, "keyword");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[VCSProperty initWithName:rawValues:type:](self, "initWithName:rawValues:type:", v8, v10, 7);

  return v11;
}

- (id)initEncodedTextProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  VCSProperty *v10;

  v7 = a3;
  v8 = a5->var4;
  if (!v8)
  {
    objc_msgSend(v7, "keyword");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "convertedContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v8, v9, 3);

  return v10;
}

- (id)initIntProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  VCSProperty *v14;
  unsigned int v16;

  v8 = a3;
  v9 = a4;
  v10 = a5->var4;
  if (!v10)
  {
    objc_msgSend(v8, "keyword");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = 0;
  objc_msgSend(v8, "content");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = sscanf((const char *)objc_msgSend(v11, "bytes"), "%d", &v16);

  if (v12 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v13 = objc_claimAutoreleasedReturnValue();
    self = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v10, v13, 4);
    v14 = self;
  }
  else
  {
    VCSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VCSProperty initIntProperty:withParseState:property:].cold.1((uint64_t)v10, v8, v13);
    v14 = 0;
  }

  return v14;
}

- (id)initURIProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  VCSProperty *v14;

  v7 = a3;
  v8 = a5->var4;
  if (!v8)
  {
    objc_msgSend(v7, "keyword");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x1E0C99E98];
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "content");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "bytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:encodingInvalidCharacters:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v8, v13, 6);
  return v14;
}

- (id)initClassificationProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  VCSProperty *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5->var4;
  if (!v10)
  {
    objc_msgSend(v8, "keyword");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "content");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "bytes");

  if (!strcmp(v12, "PUBLIC"))
  {
    v13 = 0;
  }
  else if (!strcmp(v12, "PRIVATE"))
  {
    v13 = 1;
  }
  else
  {
    v13 = 2 * (strcmp(v12, "CONFIDENTIAL") == 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v10, v14, 2);

  return v15;
}

- (id)initStatusProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  VCSProperty *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5->var4;
  if (!v10)
  {
    objc_msgSend(v8, "keyword");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "content");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "bytes");

  if (!strcmp(v12, "TENTATIVE"))
  {
    v13 = 0;
  }
  else if (!strcmp(v12, "CONFIRMED"))
  {
    v13 = 1;
  }
  else if (!strcmp(v12, "NEEDS ACTION"))
  {
    v13 = 2;
  }
  else
  {
    if (strcmp(v12, "COMPLETED"))
    {
LABEL_13:
      v17 = 0;
      goto LABEL_14;
    }
    v13 = 3;
  }
  objc_msgSend(v9, "currentEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isValidStatus:", v13);

  if (!v15)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v10, v16, 0);

  v17 = self;
LABEL_14:

  return v17;
}

- (id)initRecurrenceProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8;
  id v9;
  id v10;
  VCSRecurrenceRule *v11;
  id v12;
  VCSRecurrenceRule *v13;
  void *v14;
  void *v15;
  void *v16;
  VCSProperty *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5->var4;
  v11 = [VCSRecurrenceRule alloc];
  objc_msgSend(v8, "content");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = -[VCSRecurrenceRule initWithString:](v11, "initWithString:", objc_msgSend(v12, "bytes"));

  if (!v10)
  {
    objc_msgSend(v8, "keyword");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "palmImport"))
  {
    -[VCSRecurrenceRule endDate](v13, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "dateForEndOfDay");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCSRecurrenceRule setEndDate:](v13, "setEndDate:", v16);

    }
  }
  v17 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v10, v13, 9);

  return v17;
}

- (id)initTranspProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7;
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  VCSProperty *v12;

  v7 = a3;
  v8 = a5->var4;
  if (!v8)
  {
    objc_msgSend(v7, "keyword");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "content");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = strcmp((const char *)objc_msgSend(v9, "bytes"), "0") != 0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v8, v11, 1);

  return v12;
}

- (id)initKeywordListProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  char *v11;
  __CFString *v12;
  char *v13;
  char *v14;
  char *v15;
  __CFString *v16;
  VCSProperty *v17;

  v7 = a3;
  v8 = a5->var4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "content");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = strdup((const char *)objc_msgSend(v10, "bytes"));

  if (!v8)
  {
    objc_msgSend(v7, "keyword");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
  v13 = v11;
  do
  {
    v14 = strchr(v13, 59);
    v15 = v14;
    if (v14)
    {
      *v14 = 0;
      v15 = v14 + 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", v13);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    CFStringTrimWhitespace(v16);
    if (-[__CFString length](v16, "length"))
      objc_msgSend(v9, "addObject:", v16);
    v13 = v15;
    v12 = v16;
  }
  while (v15);
  free(v11);
  v17 = -[VCSProperty initWithName:rawValues:type:](self, "initWithName:rawValues:type:", v8, v9, 3);

  return v17;
}

- (id)initRFC822AddressProperty:(id)a3 withParseState:(id)a4 property:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  VCSProperty *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5->var4;
  if (!v10)
  {
    objc_msgSend(v8, "keyword");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "content");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "stringWithUTF8String:", objc_msgSend(v12, "bytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "VCS_uncommentedAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "VCS_URLForMail:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VCSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[VCSProperty initRFC822AddressProperty:withParseState:property:].cold.1(v8);

    v15 = 0;
  }
  v17 = -[VCSProperty initWithName:rawValue:type:](self, "initWithName:rawValue:type:", v10, v15, 8);

  return v17;
}

- (VCSPropertyValue)singleValue
{
  return (VCSPropertyValue *)-[NSMutableArray firstObject](self->_values, "firstObject");
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)values
{
  return &self->_values->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithVCSLine:(void *)a1 parseState:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "keyword");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1D3456000, v2, v3, "Unknown property: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)initWithVCSLine:(void *)a1 parseState:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "keyword");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1D3456000, v2, v3, "Property %@ is not in the right context.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)initWithVCSLine:(uint64_t)a3 parseState:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3456000, a1, a3, "ATTACH property has no VALUE param. iCal require an URL. No free form content.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithVCSLine:(uint64_t)a3 parseState:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3456000, a1, a3, "ATTACH property has an unknown VALUE param.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithVCSLine:(void *)a1 parseState:.cold.5(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "content");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "bytes");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1D3456000, v2, v3, "Incorrect version for vCal file. Got '%s'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)initWithVCSLine:(os_log_t)log parseState:.cold.6(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D3456000, log, OS_LOG_TYPE_DEBUG, "Activating PalmDesktop hooks", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initIntProperty:(uint64_t)a1 withParseState:(void *)a2 property:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "content");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = objc_msgSend(v5, "bytes");
  _os_log_error_impl(&dword_1D3456000, a3, OS_LOG_TYPE_ERROR, "Invalid property content for property '%@': '%s'", (uint8_t *)&v6, 0x16u);

}

- (void)initRFC822AddressProperty:(void *)a1 withParseState:property:.cold.1(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "content");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "bytes");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1D3456000, v2, v3, "'%s' does not contain an address.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
