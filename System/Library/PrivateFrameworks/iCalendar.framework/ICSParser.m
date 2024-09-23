@implementation ICSParser

- (ICSParser)initWithData:(id)a3 options:(unint64_t)a4
{
  id v6;
  ICSParser *v7;
  ICSParser *v8;
  ICSTokenizer *v9;
  uint64_t v10;
  ICSTokenizer *lexer;
  ICSLazyDigestUIDGenerator *v12;
  ICSUIDGenerator *uidGenerator;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSParser;
  v7 = -[ICSParser init](&v15, sel_init);
  if ((unint64_t)objc_msgSend(v6, "length") < 0x1400001)
  {
    v7->_options = a4;
    v9 = [ICSTokenizer alloc];
    if ((a4 & 0x80) != 0)
      v10 = -[ICSTokenizer initWithCompressedData:](v9, "initWithCompressedData:", v6);
    else
      v10 = -[ICSTokenizer initWithData:](v9, "initWithData:", v6);
    lexer = v7->_lexer;
    v7->_lexer = (ICSTokenizer *)v10;

    v12 = -[ICSLazyDigestUIDGenerator initWithData:]([ICSLazyDigestUIDGenerator alloc], "initWithData:", v6);
    uidGenerator = v7->_uidGenerator;
    v7->_uidGenerator = (ICSUIDGenerator *)v12;

    v8 = v7;
  }
  else
  {
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("ICS file exceeds maximum supported size: %lu"), objc_msgSend(v6, "length"));
    v8 = 0;
  }

  return v8;
}

- (id)makeComponent:(const char *)a3
{
  ICSComponent *v4;
  void *v5;
  __objc2_class *v6;
  ICSComponent *v7;

  if (!strcmp(a3, "VEVENT"))
  {
    v6 = ICSEvent;
LABEL_24:
    v7 = (ICSComponent *)objc_alloc_init(v6);
    goto LABEL_25;
  }
  if (!strcmp(a3, "VTODO"))
  {
    v6 = ICSTodo;
    goto LABEL_24;
  }
  if (!strcmp(a3, "VCALENDAR"))
  {
    v7 = -[ICSCalendar _init]([ICSCalendar alloc], "_init");
LABEL_25:
    v4 = v7;
    return v4;
  }
  if (!strcmp(a3, "VJOURNAL"))
  {
    v6 = ICSJournal;
    goto LABEL_24;
  }
  if (!strcmp(a3, "VALARM"))
  {
    v6 = ICSAlarm;
    goto LABEL_24;
  }
  if (!strcmp(a3, "VTIMEZONE"))
  {
    v6 = ICSTimeZone;
    goto LABEL_24;
  }
  if (!strcmp(a3, "DAYLIGHT"))
  {
    v6 = ICSTimeZoneDaylightBlock;
    goto LABEL_24;
  }
  if (!strcmp(a3, "STANDARD"))
  {
    v6 = ICSTimeZoneStandardBlock;
    goto LABEL_24;
  }
  if (!strcmp(a3, "VAVAILABILITY"))
  {
    v6 = ICSAvailability;
    goto LABEL_24;
  }
  if (!strcmp(a3, "AVAILABLE"))
  {
    v6 = ICSAvailable;
    goto LABEL_24;
  }
  if (!strcmp(a3, "VFREEBUSY"))
  {
    v6 = ICSFreeBusy;
    goto LABEL_24;
  }
  v4 = objc_alloc_init(ICSComponent);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setUnrecognizedComponentName:](v4, "setUnrecognizedComponentName:", v5);

  return v4;
}

- (BOOL)parseParameter:(id)a3 fatalError:(BOOL *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;

  v6 = a3;
  -[ICSTokenizer currentToken](self->_lexer, "currentToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") <= 0x80000)
  {
    -[ICSTokenizer nextToken](self->_lexer, "nextToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "length") <= 0x80000)
    {
      if (v9)
      {
        objc_msgSend(v6, "addParameter:withRawValue:options:", v7, v9, self->_options);
        v8 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("ICS parameter value exceeds maximum supported length: %lu"), objc_msgSend(v9, "length"));
      if (a4)
      {
        v8 = 0;
        *a4 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    v8 = 0;
    goto LABEL_10;
  }
  +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("ICS parameter name exceeds maximum supported length: %lu"), objc_msgSend(v7, "length"));
  v8 = 0;
  if (a4)
    *a4 = 1;
LABEL_11:

  return v8;
}

- (BOOL)createPropertyType:(int)a3 component:(id)a4 withName:(id)a5 fatalError:(BOOL *)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  __objc2_class **v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  ICSDate *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  ICSPeriod *v48;
  ICSPeriod *v49;
  ICSPeriod *v50;
  void *v51;
  void *v52;
  ICSFreeBusyTime *v53;
  void *v54;
  unsigned int v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  id obj;
  id obja;
  __CFString *v84;
  __CFString *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  unsigned int v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (__CFString *)a5;
  v12 = v11;
  v13 = off_1E953A0B8;
  switch(a3)
  {
    case 0:
    case 1:
    case 6:
    case 7:
    case 10:
    case 11:
    case 14:
      v13 = off_1E9539FF8;
      goto LABEL_16;
    case 2:
      goto LABEL_16;
    case 3:
      v13 = off_1E9539EE8;
      goto LABEL_16;
    case 4:
    case 5:
      if (CFSTR("TRIGGER") == v11)
        v13 = off_1E953A0A8;
      else
        v13 = off_1E9539F50;
      goto LABEL_16;
    case 8:
      v13 = off_1E953A048;
      goto LABEL_16;
    case 9:
      v13 = off_1E9539F48;
      goto LABEL_16;
    case 12:
      v13 = off_1E953A0A0;
      goto LABEL_16;
    case 13:
      v13 = off_1E953A098;
      goto LABEL_16;
    case 15:
      if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("TRIGGER")) & 1) != 0)
      {
        v13 = off_1E953A0A8;
      }
      else
      {
        v15 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("ATTACH"));
        v13 = off_1E9539FD0;
        if (v15)
          v13 = off_1E9539EE0;
      }
LABEL_16:
      v14 = objc_alloc_init(*v13);
      break;
    default:
      v14 = 0;
      break;
  }
  -[ICSTokenizer nextToken](self->_lexer, "nextToken");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    LOBYTE(v18) = 0;
    goto LABEL_134;
  }
  v17 = (void *)v16;
  while (1)
  {
    if (!objc_msgSend(v17, "length") || -[ICSTokenizer tokenType](self->_lexer, "tokenType") != 2)
    {
      v98[0] = CFSTR("ATTACH");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v77, "containsObject:", v12) & 1) == 0
        && (unint64_t)objc_msgSend(v17, "length") > 0x80000)
      {
        +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("ICS property value exceeds maximum supported size (%@): %lu"), v12, objc_msgSend(v17, "length"));
        LOBYTE(v18) = 0;
        *a6 = 1;
LABEL_132:

        goto LABEL_133;
      }
      v86 = v14;
      switch(a3)
      {
        case 0:
          v95 = 0;
          v19 = objc_retainAutorelease(v17);
          if (sscanf((const char *)objc_msgSend(v19, "UTF8String"), "%d", &v95) != 1)
            goto LABEL_105;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v95);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v14;
          v21 = v18;
          v22 = 5008;
          goto LABEL_129;
        case 1:
          goto LABEL_104;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v17, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v14, "setValue:type:", v18, 5021);
            v23 = CFSTR("VALUE");
            v24 = v14;
            goto LABEL_42;
          }
          +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid address property:%@"), v17);
          goto LABEL_132;
        case 3:
          v18 = v17;
          if (!objc_msgSend(v18, "length"))
            goto LABEL_125;
          v25 = objc_retainAutorelease(v18);
          v18 = v25;
          goto LABEL_116;
        case 4:
          +[ICSDateValue dateFromICSString:](ICSDateValue, "dateFromICSString:", v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v26;
          if (v26)
          {
            objc_msgSend(v14, "setValue:type:", v26, (int)objc_msgSend(v26, "dateType"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v14, "parameterValueForName:", CFSTR("TZID"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
                v24 = v14;
                v23 = CFSTR("TZID");
LABEL_42:
                objc_msgSend(v24, "removeParameterValueForName:", v23);
              }
            }
          }
          else
          {
            if (CFSTR("TRIGGER") != v12 && CFSTR("X-WR-OCCTRIGGER") != v12)
            {
              +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Date validation error:%@ = '%@'"), v12, v17);
              goto LABEL_126;
            }
            v25 = objc_retainAutorelease(v17);
LABEL_116:
            objc_msgSend(v14, "setValueAsProperty:withRawValue:options:", v12, objc_msgSend(v25, "UTF8String"), self->_options);
          }
          goto LABEL_130;
        case 5:
          v84 = v12;
          v28 = v17;
          objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(","));
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
          if (v29)
          {
            v30 = v29;
            v80 = v28;
            v31 = *(_QWORD *)v92;
            while (1)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v92 != v31)
                  objc_enumerationMutation(obj);
                v33 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                v34 = objc_alloc_init(ICSDate);
                objc_msgSend(v86, "parameters");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICSProperty setParameters:](v34, "setParameters:", v35);

                +[ICSDateValue dateFromICSUTF8String:](ICSDateValue, "dateFromICSUTF8String:", objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v36;
                if (!v36)
                {
                  v28 = v80;
                  v12 = v84;
                  +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Date validation error:%@ = '%@'"), v84, v80);

                  v14 = v86;
                  goto LABEL_118;
                }
                -[ICSProperty setValue:type:](v34, "setValue:type:", v36, (int)objc_msgSend(v36, "dateType"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[ICSProperty parameterValueForName:](v34, "parameterValueForName:", CFSTR("TZID"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v37)
                    -[ICSProperty removeParameterValueForName:](v34, "removeParameterValueForName:", CFSTR("TZID"));
                }
                objc_msgSend(v10, "addProperty:withValue:", v84, v34);

              }
              v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
              if (!v30)
              {
                LOBYTE(v18) = 1;
                v12 = v84;
                v14 = v86;
                v28 = v80;
                goto LABEL_118;
              }
            }
          }
          LOBYTE(v18) = 1;
LABEL_118:

LABEL_119:
          goto LABEL_132;
        case 6:
          v28 = v17;
          v38 = objc_msgSend(v28, "length");
          LOBYTE(v18) = v38 != 0;
          if (v38)
          {
            v85 = v12;
            v79 = v10;
            v76 = v28;
            objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(","));
            v87 = 0u;
            v88 = 0u;
            v89 = 0u;
            v90 = 0u;
            obja = (id)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v88;
              v78 = v17;
              do
              {
                v42 = 0;
                v81 = v40;
                do
                {
                  if (*(_QWORD *)v88 != v41)
                    objc_enumerationMutation(obja);
                  objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v42), "componentsSeparatedByString:", CFSTR("/"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v43, "count") == 2)
                  {
                    objc_msgSend(v43, "objectAtIndex:", 0);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    +[ICSDateValue dateFromICSString:](ICSDateValue, "dateFromICSString:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v43, "objectAtIndex:", 1);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    +[ICSDateValue dateFromICSString:](ICSDateValue, "dateFromICSString:", v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    v48 = [ICSPeriod alloc];
                    v49 = v48;
                    if (v47)
                    {
                      v50 = -[ICSPeriod initWithStart:end:](v48, "initWithStart:end:", v45, v47);
                    }
                    else
                    {
                      objc_msgSend(v43, "objectAtIndex:", 1);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", v51);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = -[ICSPeriod initWithStart:duration:](v49, "initWithStart:duration:", v45, v52);

                    }
                    v53 = -[ICSFreeBusyTime initWithPeriod:]([ICSFreeBusyTime alloc], "initWithPeriod:", v50);
                    objc_msgSend(v86, "parameters");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ICSProperty setParameters:](v53, "setParameters:", v54);

                    objc_msgSend(v79, "addProperty:withValue:", v85, v53);
                    v14 = v86;

                    v17 = v78;
                    v40 = v81;
                  }

                  ++v42;
                }
                while (v40 != v42);
                v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
              }
              while (v40);
            }

            v10 = v79;
            v12 = v85;
            LOBYTE(v18) = 1;
            v28 = v76;
          }
          goto LABEL_119;
        case 7:
          v95 = 0;
          v19 = objc_retainAutorelease(v17);
          if (sscanf((const char *)objc_msgSend(v19, "UTF8String"), "%d", &v95) == 1)
          {
            if ((int)v95 >= 1)
              v55 = v95 % 0x64 + 60 * (v95 / 0x64);
            else
              v55 = v95 + 100 * (-v95 / 0x64) - 60 * (-v95 / 0x64);
            v95 = v55;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 60 * v55);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v20 = v14;
            v21 = v18;
            v22 = 5018;
            goto LABEL_129;
          }
LABEL_105:
          v67 = v14;
          v68 = v19;
LABEL_106:
          v69 = 5007;
LABEL_107:
          objc_msgSend(v67, "setValue:type:", v68, v69);
          goto LABEL_131;
        case 8:
          v56 = v17;
          if ((unint64_t)objc_msgSend(v56, "length") >= 2
            && objc_msgSend(v56, "characterAtIndex:", 0) == 34
            && objc_msgSend(v56, "characterAtIndex:", objc_msgSend(v56, "length") - 1) == 34)
          {
            objc_msgSend(v56, "substringWithRange:", 1, objc_msgSend(v56, "length") - 2);
            v57 = objc_claimAutoreleasedReturnValue();

            v56 = (id)v57;
          }
          objc_msgSend(v56, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), &stru_1E953C148);
          v58 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v58, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18)
            goto LABEL_85;
          +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid location property:%@"), v58);
          goto LABEL_121;
        case 9:
          v58 = v17;
          if ((unint64_t)objc_msgSend(v58, "length") >= 2
            && objc_msgSend(v58, "characterAtIndex:", 0) == 34
            && objc_msgSend(v58, "characterAtIndex:", objc_msgSend(v58, "length") - 1) == 34)
          {
            objc_msgSend(v58, "substringWithRange:", 1, objc_msgSend(v58, "length") - 2);
            v59 = objc_claimAutoreleasedReturnValue();

            v58 = (id)v59;
          }
          objc_msgSend(MEMORY[0x1E0C99E98], "_lp_URLWithUserTypedString:relativeToURL:", v58, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
LABEL_85:
            objc_msgSend(v14, "setValue:type:", v18, 5013);
            objc_msgSend(v14, "removeParameterValueForName:", CFSTR("VALUE"));

            goto LABEL_131;
          }
          +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid conference property:%@"), v58);
LABEL_121:

          goto LABEL_132;
        case 10:
          v18 = v17;
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v18, 0);
          v60 = objc_claimAutoreleasedReturnValue();
          if (v60)
          {
            v61 = (void *)v60;
            v62 = v14;
            v63 = v61;
            v64 = 5013;
            goto LABEL_90;
          }
          +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid activity property:%@"), v18);
          goto LABEL_125;
        case 11:
          v18 = v17;
          v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v18, 1);
          if (!v65)
          {
            +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid app link data property:%@"), v18);
            goto LABEL_125;
          }
          v61 = (void *)v65;
          v62 = v14;
          v63 = v61;
          v64 = 5026;
LABEL_90:
          objc_msgSend(v62, "setValue:type:", v63, v64);
          objc_msgSend(v14, "removeParameterValueForName:", CFSTR("VALUE"));
          goto LABEL_93;
        case 12:
          v18 = v17;
          +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", v18);
          v66 = objc_claimAutoreleasedReturnValue();
          if (!v66)
          {
            +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid travel duration property:%@"), v18);
            goto LABEL_125;
          }
          v61 = (void *)v66;
          objc_msgSend(v14, "removeParameterValueForName:", CFSTR("VALUE"));
          objc_msgSend(v14, "setValue:type:", v61, 5011);
LABEL_93:

          goto LABEL_130;
        case 13:
          v67 = v14;
          v68 = v17;
          goto LABEL_106;
        case 14:
          v67 = v14;
          v68 = v17;
          v69 = 5015;
          goto LABEL_107;
        case 15:
          if ((-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("RRULE")) & 1) != 0
            || -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("EXRULE")))
          {
            v70 = objc_retainAutorelease(v17);
            +[ICSRecurrenceRule recurrenceRuleFromICSCString:withTokenizer:](ICSRecurrenceRule, "recurrenceRuleFromICSCString:withTokenizer:", objc_msgSend(v70, "UTF8String"), self->_lexer);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "freq"))
            {
              if (objc_msgSend(v18, "freq") == 5)
                objc_msgSend(v18, "setBymonthday:", 0);
              objc_msgSend(v10, "dtstart");
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              if (v71)
              {
                objc_msgSend(v10, "dtstart");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "value");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "cleanUpForStartDate:", v73);

                v14 = v86;
              }
              v20 = v14;
              v21 = v18;
              v22 = 5029;
            }
            else
            {
              if ((self->_options & 1) == 0)
              {
LABEL_125:

LABEL_126:
                LOBYTE(v18) = 0;
                goto LABEL_132;
              }
              v20 = v14;
              v21 = v70;
              v22 = 5007;
            }
LABEL_129:
            objc_msgSend(v20, "setValue:type:", v21, v22);
LABEL_130:

          }
          else
          {
LABEL_104:
            objc_msgSend(v14, "setValueAsProperty:withRawValue:options:", v12, objc_msgSend(objc_retainAutorelease(v17), "UTF8String"), self->_options);
          }
LABEL_131:
          objc_msgSend(v10, "addProperty:withValue:", v12, v14);
          LOBYTE(v18) = 1;
          goto LABEL_132;
        default:
          goto LABEL_131;
      }
    }
    LOBYTE(v95) = 0;
    -[ICSParser parseParameter:fatalError:](self, "parseParameter:fatalError:", v14, &v95);
    if ((_BYTE)v95)
      break;
    -[ICSTokenizer nextToken](self->_lexer, "nextToken");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v18;
    if (!v18)
      goto LABEL_134;
  }
  if (a6)
    *a6 = 1;
  LOBYTE(v18) = 0;
LABEL_133:

LABEL_134:
  return (char)v18;
}

- (BOOL)parseProperty:(id)a3 fatalError:(BOOL *)a4
{
  id v6;
  __CFString *v7;
  const char *v8;
  const __CFString *v9;
  ICSParser *v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  __CFString **v14;
  BOOL v15;
  __CFString **v17;
  __CFString **v18;
  __CFString **v19;
  __CFString **v20;
  __CFString **v21;
  __CFString **v22;

  v6 = a3;
  -[ICSTokenizer currentToken](self->_lexer, "currentToken");
  v7 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)-[__CFString UTF8String](v7, "UTF8String");
  if (!strcmp(v8, "SEQUENCE"))
  {
    v14 = kICSSTR_sequence_prop;
LABEL_52:
    v13 = *v14;
    v10 = self;
    v11 = 0;
LABEL_53:
    v12 = v6;
    goto LABEL_54;
  }
  if (!strcmp(v8, "PRIORITY"))
  {
    v14 = kICSSTR_priority_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "X-APPLE-SORT-ORDER"))
  {
    v14 = kICSSTR_XAPPLE_sort_order_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "PERCENT-COMPLETE"))
  {
    v14 = kICSSTR_percentcomplete_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "DESCRIPTION"))
  {
    v17 = kICSSTR_description_prop;
LABEL_65:
    v13 = *v17;
    v10 = self;
    v11 = 1;
    goto LABEL_53;
  }
  if (!strcmp(v8, "SUMMARY"))
  {
    v17 = kICSSTR_summary_prop;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-CONTACT-IDENTIFIERS"))
  {
    v17 = kICSSTR_XAPPLE_contact_identifiers;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-EXTERNAL-REFERENCE-ID"))
  {
    v17 = kICSSTR_external_reference_id;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-UNIVERSAL-ID"))
  {
    v17 = kICSSTR_XAPPLE_universal_id;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-SPECIAL-DAY"))
  {
    v17 = kICSSTR_XAPPLE_special_day_prop;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-CREATOR-IDENTITY"))
  {
    v17 = kICSSTR_XAPPLE_creator_identity_prop;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-CREATOR-TEAM-IDENTITY"))
  {
    v17 = kICSSTR_XAPPLE_creator_team_identity_prop;
    goto LABEL_65;
  }
  v9 = CFSTR("X-APPLE-LANGUAGE");
  if (!strcmp(v8, (const char *)objc_msgSend(CFSTR("X-APPLE-LANGUAGE"), "UTF8String"))
    || (v9 = CFSTR("X-APPLE-REGION"), !strcmp(v8, (const char *)objc_msgSend(CFSTR("X-APPLE-REGION"), "UTF8String"))))
  {
    v10 = self;
    v11 = 1;
LABEL_63:
    v12 = v6;
    v13 = v9;
    goto LABEL_54;
  }
  if (!strcmp(v8, "DTSTART"))
  {
    v18 = kICSSTR_dtstart_prop;
LABEL_77:
    v13 = *v18;
    v10 = self;
    v11 = 4;
    goto LABEL_53;
  }
  if (!strcmp(v8, "DTEND"))
  {
    v18 = kICSSTR_dtend_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "DTSTAMP"))
  {
    v18 = kICSSTR_dtstamp_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "CREATED"))
  {
    v18 = kICSSTR_created_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "LAST-MODIFIED"))
  {
    v18 = kICSSTR_lastmodified_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "COMPLETED"))
  {
    v18 = kICSSTR_completed_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "DUE"))
  {
    v18 = kICSSTR_due_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "RDATE"))
  {
    v18 = kICSSTR_rdate_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "RECURRENCE-ID"))
  {
    v18 = kICSSTR_recurrenceid_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "ACKNOWLEDGED"))
  {
    v18 = kICSSTR_acknowledged_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "TRIGGER"))
  {
    v18 = kICSSTR_trigger_prop;
    goto LABEL_77;
  }
  v9 = CFSTR("X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR");
  if (!strcmp(v8, (const char *)objc_msgSend(CFSTR("X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR"), "UTF8String")))
  {
    v10 = self;
    v11 = 4;
    goto LABEL_63;
  }
  if (!strcmp(v8, "EXDATE"))
  {
    v13 = CFSTR("EXDATE");
    v10 = self;
    v11 = 5;
    goto LABEL_53;
  }
  if (!strcmp(v8, "ORGANIZER"))
  {
    v19 = kICSSTR_organizer_prop;
LABEL_83:
    v13 = *v19;
    v10 = self;
    v11 = 2;
    goto LABEL_53;
  }
  if (!strcmp(v8, "ATTENDEE"))
  {
    v19 = kICSSTR_attendee_prop;
    goto LABEL_83;
  }
  if (!strcmp(v8, "X-WR-ATTENDEE"))
  {
    v19 = kICSSTR_XWR_attendee_prop;
    goto LABEL_83;
  }
  if (!strcmp(v8, "TZOFFSETFROM"))
  {
    v20 = kICSSTR_tzoffsetfrom_prop;
LABEL_86:
    v13 = *v20;
    v10 = self;
    v11 = 7;
    goto LABEL_53;
  }
  if (!strcmp(v8, "TZOFFSETTO"))
  {
    v20 = kICSSTR_tzoffsetto_prop;
    goto LABEL_86;
  }
  if (!strcmp(v8, "X-APPLE-STRUCTURED-LOCATION"))
  {
    v21 = kICSSTR_XAPPLE_structured_location_prop;
LABEL_90:
    v13 = *v21;
    v10 = self;
    v11 = 8;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-TRAVEL-START"))
  {
    v21 = kICSSTR_XAPPLE_travel_start;
    goto LABEL_90;
  }
  if (!strcmp(v8, "X-APPLE-END-LOCATION"))
  {
    v21 = kICSSTR_XAPPLE_end_location;
    goto LABEL_90;
  }
  if (!strcmp(v8, "X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"))
  {
    v14 = kICSSTR_XAPPLE_suggestion_info_changed_fields_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "X-APPLE-SUGGESTION-INFO-TIMESTAMP"))
  {
    v18 = kICSSTR_XAPPLE_suggestion_info_timestamp_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "X-CALENDARSERVER-ATTENDEE-COMMENT"))
  {
    v13 = CFSTR("X-CALENDARSERVER-ATTENDEE-COMMENT");
    v10 = self;
    v11 = 3;
    goto LABEL_53;
  }
  if (!strcmp(v8, "FREEBUSY"))
  {
    v13 = CFSTR("FREEBUSY");
    v10 = self;
    v11 = 6;
    goto LABEL_53;
  }
  if (!strcmp(v8, "CONFERENCE"))
  {
    v13 = CFSTR("CONFERENCE");
    v10 = self;
    v11 = 9;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-ACTIVITY"))
  {
    v13 = CFSTR("X-APPLE-ACTIVITY");
    v10 = self;
    v11 = 10;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-APP-LINK-DATA"))
  {
    v22 = kICSSTR_XAPPLE_app_link_data_prop;
LABEL_98:
    v13 = *v22;
    v10 = self;
    v11 = 11;
    goto LABEL_53;
  }
  if (!strcmp(v8, "GEO"))
  {
    v13 = CFSTR("GEO");
    v10 = self;
    v11 = 14;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-TRAVEL-DURATION"))
  {
    v13 = CFSTR("X-APPLE-TRAVEL-DURATION");
    v10 = self;
    v11 = 12;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-TRAVEL-ADVISORY-BEHAVIOR"))
  {
    v13 = CFSTR("X-APPLE-TRAVEL-ADVISORY-BEHAVIOR");
    v10 = self;
    v11 = 13;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-STRUCTURED-DATA"))
  {
    v22 = kICSSTR_XAPPLE_structured_data_prop;
    goto LABEL_98;
  }
  v10 = self;
  v11 = 15;
  v12 = v6;
  v13 = v7;
LABEL_54:
  v15 = -[ICSParser createPropertyType:component:withName:fatalError:](v10, "createPropertyType:component:withName:fatalError:", v11, v12, v13, a4);

  return v15;
}

- (BOOL)_parseComponent:(id)a3
{
  char v4;

  v4 = 0;
  -[ICSParser _parseComponent:depth:fatalError:](self, "_parseComponent:depth:fatalError:", a3, 0, &v4);
  return v4 == 0;
}

- (void)_parseComponent:(id)a3 depth:(unint64_t)a4 fatalError:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  ICSTokenizer *lexer;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  id v22;
  char v23;

  v8 = a3;
  if (a4 >= 0x65)
  {
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Reached maximum component depth. Aborting parser."));
    *a5 = 1;
    goto LABEL_32;
  }
  -[ICSTokenizer nextToken](self->_lexer, "nextToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Expected component name but got NULL"));
    goto LABEL_32;
  }
  v22 = objc_retainAutorelease(v9);
  -[ICSParser makeComponent:](self, "makeComponent:", objc_msgSend(v22, "UTF8String"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSTokenizer nextToken](self->_lexer, "nextToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a4 + 1;
  do
  {
    if (!v11)
      goto LABEL_25;
    v12 = (void *)MEMORY[0x1D824FCDC]();
    if (-[ICSTokenizer tokenType](self->_lexer, "tokenType") || !objc_msgSend(v11, "length"))
    {
      +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Unexpected token %@ for PropertyName."), v11);
LABEL_8:
      -[ICSTokenizer nextToken](self->_lexer, "nextToken");
      v13 = 0;
      v14 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("BEGIN")))
    {
      -[ICSParser _parseComponent:depth:fatalError:](self, "_parseComponent:depth:fatalError:", v10, v21, a5);
      if (*a5)
        goto LABEL_29;
      goto LABEL_8;
    }
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("END")))
    {
      v23 = 0;
      -[ICSParser parseProperty:fatalError:](self, "parseProperty:fatalError:", v10, &v23);
      if (v23)
      {
        if (a5)
          *a5 = 1;
LABEL_29:
        objc_autoreleasePoolPop(v12);
        goto LABEL_30;
      }
      goto LABEL_8;
    }
    -[ICSTokenizer nextToken](self->_lexer, "nextToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    if (v15)
    {
      if ((objc_msgSend(v15, "isEqualToString:", v22) & 1) != 0)
      {
        v13 = 3;
        goto LABEL_9;
      }
      lexer = self->_lexer;
      v19 = v22;
      v20 = v14;
      v17 = CFSTR("BEGIN (%@) END (%@) mismatch!");
    }
    else
    {
      lexer = self->_lexer;
      v17 = CFSTR("No END value!");
    }
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, lexer, v17, v19, v20);
    v13 = 1;
LABEL_9:

    objc_autoreleasePoolPop(v12);
  }
  while (!v13);
  if (v13 == 3)
  {
LABEL_25:
    v18 = v22;
    objc_msgSend(v8, "addComponent:withUIDGenerator:", v10, self->_uidGenerator);
    goto LABEL_31;
  }
LABEL_30:
  v18 = v22;
LABEL_31:

LABEL_32:
}

- (id)parseData
{
  ICSComponent *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ICSComponent *v8;

  v3 = objc_alloc_init(ICSComponent);
  -[ICSTokenizer nextToken](self->_lexer, "nextToken");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_8:
    v8 = v3;
    goto LABEL_9;
  }
  v5 = (void *)v4;
  while (1)
  {
    v6 = (void *)MEMORY[0x1D824FCDC]();
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("BEGIN")))
    {
      +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self->_lexer, CFSTR("Invalid ICS format, no VCALENDAR"));
      goto LABEL_7;
    }
    if (!-[ICSParser _parseComponent:](self, "_parseComponent:", v3))
      break;
LABEL_7:
    -[ICSTokenizer nextToken](self->_lexer, "nextToken");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v6);
    v5 = (void *)v7;
    if (!v7)
      goto LABEL_8;
  }
  objc_autoreleasePoolPop(v6);

  v8 = 0;
LABEL_9:

  return v8;
}

+ (id)entitiesFromNSData:(id)a3 options:(unint64_t)a4
{
  id v5;
  ICSParser *v6;
  ICSParser *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  ICSParser *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[ICSParser initWithData:options:]([ICSParser alloc], "initWithData:options:", v5, a4);
  v7 = v6;
  if (v6)
  {
    -[ICSParser parseData](v6, "parseData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v32 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v31 = v8;
      objc_msgSend(v8, "components");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v12)
        goto LABEL_20;
      v13 = v12;
      v14 = *(_QWORD *)v35;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[ICSParser lexer](v7, "lexer");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v18, CFSTR("ICS: Cal not a ICSCalendar %@"), v16);
            goto LABEL_16;
          }
          v17 = v16;
          v18 = v17;
          if ((a4 & 1) != 0)
          {
            objc_msgSend(v17, "fixPropertiesInheritance");
            goto LABEL_15;
          }
          v19 = v11;
          v20 = v7;
          v21 = a4;
          objc_msgSend(v17, "version");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22
            || (objc_msgSend(v18, "version"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("2.0")),
                v23,
                (v24 & 1) != 0))
          {
            objc_msgSend(v18, "fixPropertiesInheritance");
            objc_msgSend(v18, "fixEntities");
            a4 = v21;
            v7 = v20;
            v11 = v19;
LABEL_15:
            objc_msgSend(v33, "addObject:", v18);
            goto LABEL_16;
          }
          -[ICSParser lexer](v20, "lexer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "version");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v25, CFSTR("Bad version of iCalendar %@"), v26);

          a4 = v21;
          v7 = v20;
          v11 = v19;
LABEL_16:

          ++v15;
        }
        while (v13 != v15);
        v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v13 = v27;
        if (!v27)
        {
LABEL_20:

          v8 = v31;
          v5 = v32;
          goto LABEL_23;
        }
      }
    }
    -[ICSParser lexer](v7, "lexer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v29, CFSTR("No components found"));

    v33 = 0;
LABEL_23:

  }
  else
  {
    objc_msgSend(0, "lexer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v28, CFSTR("Failed to create ICSParser"));

    v33 = 0;
  }

  return v33;
}

- (ICSTokenizer)lexer
{
  return self->_lexer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uidGenerator, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_lexer, 0);
}

@end
