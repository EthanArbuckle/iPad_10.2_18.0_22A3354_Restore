@implementation ICSProperty

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4 additionalParameters:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  ICSProperty *v29;
  id obj;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v29 = self;
  -[ICSProperty parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v11, "addEntriesFromDictionary:", v8);
  v28 = v8;
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v15 = v11;
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v34;
    v31 = v15;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
        v20 = a3;
        if ((a3 & 0x10) != 0)
        {
          if (-[ICSProperty shouldObscureParameter:](v29, "shouldObscureParameter:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v18)))
          {
            v20 = a3 | 0x20;
          }
          else
          {
            v20 = a3;
          }
        }
        objc_msgSend(v15, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v32;
        v23 = v19;
        objc_msgSend(v22, "appendString:", CFSTR(";"));
        objc_msgSend(v22, "appendString:", v23);

        objc_msgSend(v22, "appendString:", CFSTR("="));
        if (objc_msgSend(v23, "isEqualToString:", CFSTR("ALTREP")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "absoluteString");
          }
          else
          {
            NSLog(CFSTR("Parameter briding ALTREP (NSURL) type failed for %@"), v21);
            objc_msgSend(v21, "description");
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_ICSStringForParameterQuotedValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
          objc_msgSend(v22, "appendString:", CFSTR("\"));
          objc_msgSend(v24, "_ICSStringWithOptions:appendingToString:", v20, v22);
          objc_msgSend(v22, "appendString:", CFSTR("\"));
LABEL_30:

          goto LABEL_31;
        }
        if (objc_msgSend(v23, "isEqualToString:", CFSTR("RSVP")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "_ICSBoolAppendingToString:", v22);
            goto LABEL_32;
          }
        }
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CN")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("DIR")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("SENT-BY")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("X-CALENDARSERVER-ATTENDEE-REF")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("X-CALENDARSERVER-EMAIL")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("EMAIL")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("X-APPLE-TELEPHONE")) & 1) != 0
          || objc_msgSend(v23, "isEqualToString:", CFSTR("TITLE")))
        {
          objc_msgSend(v21, "_ICSStringForParameterQuotedValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        if (objc_msgSend(v23, "isEqualToString:", CFSTR("FBTYPE")))
        {
          objc_msgSend(v21, "_ICSFBTypeAppendingToString:", v22);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "_ICSParametersAppendingToString:", v22);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (_ICSStringWithOptions_appendingToString_additionalParameters__onceToken != -1)
                dispatch_once(&_ICSStringWithOptions_appendingToString_additionalParameters__onceToken, &__block_literal_global_184);
              if (objc_msgSend(v21, "rangeOfCharacterFromSet:", _ICSStringWithOptions_appendingToString_additionalParameters__sQuoteCharacters) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v21, "_ICSStringForParameterValue");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "_ICSStringWithOptions:appendingToString:", v20, v22);
                goto LABEL_30;
              }
              objc_msgSend(v22, "appendString:", CFSTR("\"));
              objc_msgSend(v21, "_ICSStringForParameterQuotedValue");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "_ICSStringWithOptions:appendingToString:", v20, v22);

              objc_msgSend(v22, "appendString:", CFSTR("\"));
LABEL_31:
              v15 = v31;
              goto LABEL_32;
            }
            objc_msgSend(v21, "_ICSStringWithOptions:appendingToString:", v20, v22);
          }
        }
LABEL_32:

        ++v18;
      }
      while (v16 != v18);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v16 = v27;
    }
    while (v27);
  }

}

void __87__ICSProperty_ICSWriter___ICSStringWithOptions_appendingToString_additionalParameters___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(";:,"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ICSStringWithOptions_appendingToString_additionalParameters__sQuoteCharacters;
  _ICSStringWithOptions_appendingToString_additionalParameters__sQuoteCharacters = v0;

}

- (void)_appendDateTimeInDate:(id)a3 asUTCToResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ICSCalendar *v12;

  v5 = a4;
  v6 = a3;
  v12 = objc_alloc_init(ICSCalendar);
  -[ICSCalendar systemDateForDate:options:](v12, "systemDateForDate:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0C99D48]);
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "components:fromDate:", 766, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%.4d%.2d%.2dT%.2d%.2d%.2dZ"), objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"), objc_msgSend(v11, "hour"), objc_msgSend(v11, "minute"), objc_msgSend(v11, "second"));

}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  unint64_t v40;
  id v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  id v57;

  v57 = a4;
  -[ICSProperty parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    -[ICSProperty _ICSStringWithOptions:appendingToString:additionalParameters:](self, "_ICSStringWithOptions:appendingToString:additionalParameters:", a3, v57, 0);
    goto LABEL_5;
  }
  if (-[ICSProperty alwaysHasParametersToSerialize](self, "alwaysHasParametersToSerialize"))
    goto LABEL_4;
LABEL_5:
  if ((a3 & 0x10) != 0 && -[ICSProperty shouldObscureValue](self, "shouldObscureValue"))
    a3 |= 0x20uLL;
  switch(-[ICSProperty type](self, "type"))
  {
    case 5003uLL:
      -[ICSProperty value](self, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_STATUS_VALUE failed for %@"), v16);
      break;
    case 5004uLL:
      -[ICSProperty value](self, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_TRANSP_VALUE failed for %@"), v16);
      break;
    case 5005uLL:
      -[ICSProperty value](self, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_CLASS_VALUE failed for %@"), v16);
      break;
    case 5006uLL:
      -[ICSProperty value](self, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_class();
      v23 = objc_opt_class();

      if (v22 == v23)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding ICSDate kICS_DATE_VALUE failed for %@"), v16);
      break;
    case 5007uLL:
    case 5010uLL:
      -[ICSProperty value](self, "value");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[ICSProperty value](self, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v10 = objc_opt_isKindOfClass();

        if ((v10 & 1) == 0)
        {
          -[ICSProperty value](self, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("PropertyValue briding NSString failed for %@"), v11);

        }
      }
      objc_msgSend(v57, "appendString:", CFSTR(":"));
      -[ICSProperty value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_ICSStringForProperyValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_ICSStringWithOptions:appendingToString:", a3, v57);

      goto LABEL_51;
    case 5008uLL:
      -[ICSProperty value](self, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber failed for %@"), v16);
      break;
    case 5009uLL:
      -[ICSProperty value](self, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_PERIOD_VALUE failed for %@"), v16);
      break;
    case 5011uLL:
      -[ICSProperty value](self, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding ICSDuration failed for %@"), v16);
      break;
    case 5012uLL:
      -[ICSProperty value](self, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
      {
        -[ICSProperty value](self, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("PropertyValue briding NSNumber kICS_BOOLEAN_VALUE failed for %@"), v32);

      }
      objc_msgSend(v57, "appendString:", CFSTR(":"));
      -[ICSProperty value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_ICSBoolAppendingToString:", v57);
      goto LABEL_51;
    case 5013uLL:
      -[ICSProperty value](self, "value");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v34 = objc_opt_isKindOfClass();

      if ((v34 & 1) == 0)
      {
        -[ICSProperty value](self, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSProperty value](self, "value");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_opt_class();
        NSLog(CFSTR("PropertyValue briding NSURL failed for %@ (%@)"), v35, v37);

      }
      v38 = v57;
      objc_msgSend(v38, "appendString:", CFSTR(";"));
      objc_msgSend(v38, "appendString:", CFSTR("VALUE"));
      objc_msgSend(v38, "appendString:", CFSTR("="));
      objc_msgSend(v38, "appendString:", CFSTR("URI"));

      objc_msgSend(v38, "appendString:", CFSTR(":"));
      -[ICSProperty value](self, "value");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v39;
      v40 = a3;
      v41 = v38;
      goto LABEL_50;
    case 5016uLL:
      -[ICSProperty value](self, "value");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v43 = objc_opt_isKindOfClass();

      if ((v43 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding ICSDateValue kICS_DATETIME_VALUE failed for %@"), v16);
      break;
    case 5018uLL:
      -[ICSProperty value](self, "value");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v45 = objc_opt_isKindOfClass();

      if ((v45 & 1) == 0)
      {
        -[ICSProperty value](self, "value");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("PropertyValue briding NSNumber kICS_UTCOFFSET_VALUE failed for %@"), v46);

      }
      objc_msgSend(v57, "appendString:", CFSTR(":"));
      -[ICSProperty value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_ICSUTCOffsetAppendingToString:", v57);
      goto LABEL_51;
    case 5020uLL:
      -[ICSProperty value](self, "value");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v48 = objc_opt_isKindOfClass();

      if ((v48 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_ACTION_VALUE failed for %@"), v16);
      break;
    case 5021uLL:
      -[ICSProperty value](self, "value");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = objc_opt_isKindOfClass();

      if ((v50 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding ICSUserAddress (NSURL) failed for %@"), v16);
      break;
    case 5025uLL:
      -[ICSProperty value](self, "value");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v52 = objc_opt_isKindOfClass();

      if ((v52 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_METHOD_VALUE failed for %@"), v16);
      break;
    case 5030uLL:
      -[ICSProperty value](self, "value");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v56 = objc_opt_isKindOfClass();

      if ((v56 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_CALENDARSERVERACCESS_VALUE failed for %@"), v16);
      break;
    case 5031uLL:
      -[ICSProperty value](self, "value");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v54 = objc_opt_isKindOfClass();

      if ((v54 & 1) != 0)
        goto LABEL_49;
      -[ICSProperty value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("PropertyValue briding NSNumber kICS_BUSYSTATUS_VALUE failed for %@"), v16);
      break;
    default:
      goto LABEL_49;
  }

LABEL_49:
  objc_msgSend(v57, "appendString:", CFSTR(":"));
  -[ICSProperty value](self, "value");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v39;
  v40 = a3;
  v41 = v57;
LABEL_50:
  objc_msgSend(v39, "_ICSStringWithOptions:appendingToString:", v40, v41);
LABEL_51:

}

- (BOOL)isMultiValued
{
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (id)parameterValueForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parameters, "objectForKey:", a3);
}

- (void)addParametersFromDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_parameters, "addEntriesFromDictionary:", a3);
}

- (void)setParameters:(id)a3
{
  char isKindOfClass;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary **p_parameters;
  NSMutableDictionary *parameters;
  NSMutableDictionary *obj;

  obj = (NSMutableDictionary *)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = obj;
  v6 = obj;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = obj;
  }
  parameters = self->_parameters;
  p_parameters = &self->_parameters;
  if (parameters != v5)
    objc_storeStrong((id *)p_parameters, v6);

}

- (void)setParameterValue:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *parameters;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  parameters = self->_parameters;
  if (v12)
  {
    if (!parameters)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_parameters;
      self->_parameters = v10;

      v7 = v12;
      parameters = self->_parameters;
    }
    -[NSMutableDictionary setObject:forKey:](parameters, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](parameters, "removeObjectForKey:", v8);
  }

}

- (void)removeParameterValueForName:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_parameters, "removeObjectForKey:", a3);
}

- (NSSet)propertiesToExcludeForChecksum
{
  return 0;
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return 0;
}

- (BOOL)shouldObscureValue
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *parameters;
  id v5;

  parameters = self->_parameters;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", parameters, CFSTR("Parameters"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("Value"));

}

+ (id)valueAndParameterClasses
{
  if (valueAndParameterClasses_onceToken != -1)
    dispatch_once(&valueAndParameterClasses_onceToken, &__block_literal_global_10);
  return (id)valueAndParameterClasses_valueAndParameterClasses;
}

void __39__ICSProperty_valueAndParameterClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 43);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)valueAndParameterClasses_valueAndParameterClasses;
  valueAndParameterClasses_valueAndParameterClasses = v2;

}

- (ICSProperty)initWithCoder:(id)a3
{
  id v4;
  ICSProperty *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *parameters;
  uint64_t v9;
  id value;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSProperty;
  v5 = -[ICSProperty init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "valueAndParameterClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("Parameters"));
    v7 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v7;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("Value"));
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v9;

  }
  return v5;
}

- (id)allParameters
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  -[ICSProperty parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ICSProperty)initWithValue:(id)a3 type:(unint64_t)a4
{
  id v6;
  ICSProperty *v7;
  ICSProperty *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSProperty;
  v7 = -[ICSProperty init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[ICSProperty setValue:type:](v7, "setValue:type:", v6, a4);

  return v8;
}

- (void)setValue:(id)a3 type:(unint64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (*(_OWORD *)&self->_type != __PAIR128__((unint64_t)v7, a4))
  {
    v8 = v7;
    objc_storeStrong(&self->_value, a3);
    v7 = v8;
    self->_type = a4;
  }

}

- (BOOL)alwaysHasParametersToSerialize
{
  return 0;
}

- (id)parameters
{
  return self->_parameters;
}

- (id)stringValue
{
  return (id)objc_msgSend(self->_value, "description");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSProperty stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p - %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)addParameter:(id)a3 withRawValue:(id)a4 options:(unint64_t)a5
{
  __CFString *v7;
  __CFString *v8;
  __objc2_class *v9;
  CFDataRef v10;
  __CFString *v11;
  id v12;

  v12 = a3;
  v7 = (__CFString *)a4;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("CUTYPE")))
  {
    +[ICSCalendarUserParameter calendarUserTypeParameterFromICSString:](ICSCalendarUserParameter, "calendarUserTypeParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ROLE")))
  {
    +[ICSRoleParameter roleParameterFromICSString:](ICSRoleParameter, "roleParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PARTSTAT")))
  {
    +[ICSParticipationStatusParameter participationStatusParameterFromICSString:](ICSParticipationStatusParameter, "participationStatusParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SCHEDULE-STATUS")))
  {
    +[ICSScheduleStatusParameter scheduleStatusParameterFromICSString:](ICSScheduleStatusParameter, "scheduleStatusParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SCHEDULE-AGENT")))
  {
    +[ICSScheduleAgentParameter scheduleAgentParameterFromICSString:](ICSScheduleAgentParameter, "scheduleAgentParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("RSVP")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "BOOLFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SCHEDULE-FORCE-SEND")))
  {
    +[ICSScheduleForceSendParameter scheduleForceSendParameterFromICSString:](ICSScheduleForceSendParameter, "scheduleForceSendParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("X-CALENDARSERVER-DTSTAMP")))
  {
    v9 = ICSDateValue;
LABEL_17:
    -[__objc2_class dateFromICSString:](v9, "dateFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("FBTYPE")))
  {
    +[ICSFreeBusyTypeParameter freeBusyTypeParameterFromICSString:](ICSFreeBusyTypeParameter, "freeBusyTypeParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("X-APPLE-RELATED-TRAVEL")))
  {
    +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("RELTYPE")))
  {
    +[ICSRelationshipTypeParameter relationshipTypeParameterFromICSString:](ICSRelationshipTypeParameter, "relationshipTypeParameterFromICSString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("X-APPLE-MAPKIT-HANDLE")))
  {
    v10 = ICSDecodeBase64(0, v7);
    CFAutorelease(v10);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ACKNOWLEDGED")))
  {
    v9 = ICSDateTimeUTCValue;
    goto LABEL_17;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("TO-ALL-PROPOSED-NEW-TIME")))
  {
    +[ICSAlternateTimeProposal alternateTimeProposalFromICSCString:](ICSAlternateTimeProposal, "alternateTimeProposalFromICSCString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
LABEL_31:
  v11 = v8;
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v8, v12);

}

- (void)_setParsedValues:(id)a3 type:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[ICSProperty setValue:type:](self, "setValue:type:", v6, a4);

}

- (void)setValueAsProperty:(id)a3 withRawValue:(const char *)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ICSProperty *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  ICSProperty *v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _BOOL4 v34;
  void *v35;
  __CFString *v36;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  void *v42;
  __CFString *v43;
  UniChar *v44;
  uint64_t v45;
  UniChar v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  UniChar *v50;
  uint64_t v51;
  UniChar v52;
  void *v53;
  uint64_t v54;
  __CFString *v55;
  __CFString *v57;
  void *v58;
  const __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  int v69;
  CFDataRef v70;
  uint64_t v71;
  int v72;
  ICSProperty *v73;
  void *v74;
  UniChar buffer[8];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CFStringRef theString;
  UniChar *v84;
  const char *v85;
  uint64_t v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  CFRange v90;
  CFRange v91;

  v5 = a5;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("UTF8 encoding failed for property: %@ and value (as base64): %@"), v8, v12);

    v9 = (__CFString *)CFStringCreateWithCString(0, a4, 0x201u);
    if (!v9)
    {
      v9 = (__CFString *)CFStringCreateWithCString(0, a4, 0);
      if (!v9)
      {
        v9 = (__CFString *)CFStringCreateWithCString(0, a4, 1u);
        if (!v9)
        {
          v9 = (__CFString *)CFStringCreateWithCString(0, a4, 0x500u);
          if (!v9)
          {
            objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("No correct encoding found for property: %@ and value (as base64): %@"), v8, v25);

            v9 = 0;
            goto LABEL_136;
          }
        }
      }
    }
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("DURATION")))
  {
    +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if ((v5 & 1) == 0 || v13)
    {
      v15 = self;
      v16 = v14;
      v17 = 5011;
LABEL_50:
      -[ICSProperty setValue:type:](v15, "setValue:type:", v16, v17);
LABEL_51:

      goto LABEL_136;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("METHOD")))
  {
    +[ICSMethodValue methodValueFromICSString:](ICSMethodValue, "methodValueFromICSString:", v9);
    v18 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v18;
    if ((v5 & 1) == 0 || v18)
    {
      v15 = self;
      v16 = v14;
      v17 = 5025;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ACTION")))
  {
    +[ICSActionValue actionValueFromICSString:](ICSActionValue, "actionValueFromICSString:", v9);
    v19 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v19;
    if ((v5 & 1) == 0 || v19)
    {
      v15 = self;
      v16 = v14;
      v17 = 5020;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS")))
  {
    +[ICSStatusValue statusValueFromICSString:](ICSStatusValue, "statusValueFromICSString:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v20;
    if ((v5 & 1) == 0 || v20)
    {
      v15 = self;
      v16 = v14;
      v17 = 5003;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("X-CALENDARSERVER-ACCESS")))
  {
    +[ICSCalendarServerAccessValue calendarServerAccessFromICSString:](ICSCalendarServerAccessValue, "calendarServerAccessFromICSString:", v9);
    v21 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v21;
    if ((v5 & 1) == 0 || v21)
    {
      v15 = self;
      v16 = v14;
      v17 = 5030;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("URL")))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_lp_URLWithUserTypedString:relativeToURL:", v9, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v22;
    if ((v5 & 1) == 0 || v22)
    {
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("VALUE"));
      v15 = self;
      v16 = v14;
      v17 = 5013;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSP")))
  {
    +[ICSTransparencyValue transparencyValueFromICSString:](ICSTransparencyValue, "transparencyValueFromICSString:", v9);
    v23 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v23;
    if ((v5 & 1) == 0 || v23)
    {
      v15 = self;
      v16 = v14;
      v17 = 5004;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("X-APPLE-EWS-BUSYSTATUS")))
  {
    +[ICSBusyStatusValue busyStatusValueFromICSString:](ICSBusyStatusValue, "busyStatusValueFromICSString:", v9);
    v24 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v24;
    if ((v5 & 1) == 0 || v24)
    {
      v15 = self;
      v16 = v14;
      v17 = 5031;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TRIGGER")))
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("VALUE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("DATE")) & 1) != 0
      || objc_msgSend(v14, "isEqualToString:", CFSTR("DATE-TIME")))
    {
      +[ICSDateValue dateFromICSString:](ICSDateValue, "dateFromICSString:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if ((v5 & 1) == 0 || v26)
      {
        v28 = (int)objc_msgSend(v26, "dateType");
        v29 = self;
        v30 = v27;
LABEL_144:
        -[ICSProperty setValue:type:](v29, "setValue:type:", v30, v28);

        goto LABEL_51;
      }
    }
    else
    {
      +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", v9);
      v33 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v33;
      if ((v5 & 1) == 0 || v33)
      {
        v29 = self;
        v30 = v27;
        v28 = 5011;
        goto LABEL_144;
      }
    }

LABEL_55:
    v32 = 0;
    goto LABEL_56;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ATTENDEE")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("ORGANIZER")))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v9, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v31;
    if ((v5 & 1) == 0 || (v32 = 0, v31))
    {
      v15 = self;
      v16 = v14;
      v17 = 5021;
      goto LABEL_50;
    }
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("ATTACH")))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CLASS")))
      {
        +[ICSClassificationValue classificationValueFromICSString:](ICSClassificationValue, "classificationValueFromICSString:", v9);
        v71 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v71;
        if ((v5 & 1) == 0 || v71)
        {
          v15 = self;
          v16 = v14;
          v17 = 5005;
          goto LABEL_50;
        }
      }
      goto LABEL_55;
    }
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ENCODING"));
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v65 = (void *)v64;
      -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ENCODING"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "isEqualToString:", CFSTR("BASE64"));

      if ((v67 & 1) == 0)
      {
        NSLog(CFSTR("Ignoring data for attachment that isn't base-64 encoded: %@"), self);
        -[ICSProperty setValue:type:](self, "setValue:type:", 0, 5026);
        goto LABEL_136;
      }
    }
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("VALUE"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("BINARY"));

    if (v69)
    {
      v70 = ICSDecodeBase64(0, v9);
      if (v70)
      {
        v35 = v70;
        -[ICSProperty setValue:type:](self, "setValue:type:", v70, 5026);
        goto LABEL_135;
      }
      goto LABEL_55;
    }
    v32 = 1;
  }
LABEL_56:
  v34 = -[ICSProperty isMultiValued](self, "isMultiValued");
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  v36 = (__CFString *)-[__CFString length](v9, "length");
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  *(_OWORD *)buffer = 0u;
  v76 = 0u;
  theString = v9;
  v86 = 0;
  v87 = v36;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v84 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  v88 = 0;
  v89 = 0;
  v85 = CStringPtr;
  if (!v36)
  {
LABEL_124:
    if (!v32)
      goto LABEL_131;
    goto LABEL_125;
  }
  if (v36 == (__CFString *)1)
  {
    v36 = 0;
    goto LABEL_124;
  }
  v72 = v32;
  v73 = self;
  v74 = v11;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  do
  {
    v43 = v87;
    if ((uint64_t)v87 <= v39)
      goto LABEL_120;
    v44 = v84;
    if (v84)
    {
      v45 = v86 + v39;
LABEL_67:
      v46 = v44[v45];
      goto LABEL_70;
    }
    if (!v85)
    {
      v55 = v88;
      if ((uint64_t)v89 <= v39 || (uint64_t)v88 > v39)
      {
        v57 = (__CFString *)(v39 - 4);
        if (v41 < 4)
          v57 = 0;
        if ((uint64_t)&v57[2] < (uint64_t)v87)
          v43 = v57 + 2;
        v88 = v57;
        v89 = v43;
        v90.location = (CFIndex)v57 + v86;
        v90.length = (char *)v43 - (char *)v57;
        CFStringGetCharacters(theString, v90, buffer);
        v55 = v88;
      }
      v45 = v39 - (_QWORD)v55;
      v44 = buffer;
      goto LABEL_67;
    }
    v46 = v85[v86 + v39];
LABEL_70:
    if (v46 != 44)
    {
      if (v46 != 92)
        goto LABEL_120;
      if (!v42)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[__CFString substringWithRange:](v9, "substringWithRange:", v40, v41 - v40);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "appendString:", v47);

      v48 = v41 + 1;
      v49 = v87;
      if ((uint64_t)v87 <= v48)
      {
        v52 = 0;
        goto LABEL_83;
      }
      v50 = v84;
      if (v84)
      {
        v51 = v86 + v48;
      }
      else
      {
        if (v85)
        {
          v52 = v85[v86 + v48];
LABEL_96:
          if (v52 > 0x4Du)
          {
            if (v52 > 0x6Du)
            {
              if (v52 != 110 && v52 != 114)
                goto LABEL_83;
            }
            else if (v52 != 78)
            {
              if (v52 == 92)
              {
                v58 = v42;
                v59 = CFSTR("\\");
LABEL_118:
                objc_msgSend(v58, "appendString:", v59);
                goto LABEL_119;
              }
              goto LABEL_83;
            }
            v58 = v42;
            v59 = CFSTR("\n");
            goto LABEL_118;
          }
          switch(v52)
          {
            case '"':
              v58 = v42;
              v59 = CFSTR("\");
              goto LABEL_118;
            case ',':
              v58 = v42;
              v59 = CFSTR(",");
              goto LABEL_118;
            case ';':
              v58 = v42;
              v59 = CFSTR(";");
              goto LABEL_118;
          }
LABEL_83:
          objc_msgSend(v42, "appendFormat:", CFSTR("\\%c"), v52);
LABEL_119:
          v40 = v41 + 2;
          ++v41;
          goto LABEL_120;
        }
        if ((uint64_t)v89 <= v48 || (v60 = v88, (uint64_t)v88 > v48))
        {
          v61 = (__CFString *)(v48 - 4);
          if (v48 < 4)
            v61 = 0;
          if ((uint64_t)&v61[2] < (uint64_t)v87)
            v49 = v61 + 2;
          v88 = v61;
          v89 = v49;
          v91.location = (CFIndex)v61 + v86;
          v91.length = (char *)v49 - (char *)v61;
          CFStringGetCharacters(theString, v91, buffer);
          v60 = v88;
        }
        v51 = v48 - (_QWORD)v60;
        v50 = buffer;
      }
      v52 = v50[v51];
      goto LABEL_96;
    }
    if (v34)
    {
      if (!v42)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[__CFString substringWithRange:](v9, "substringWithRange:", v40, v41 - v40);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "appendString:", v53);

      objc_msgSend(v35, "addObject:", v42);
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v54 = objc_claimAutoreleasedReturnValue();

      v40 = v41 + 1;
      v42 = (void *)v54;
    }
LABEL_120:
    v39 = ++v41;
  }
  while ((unint64_t)&v36[-1].length + 7 > v41);
  if (v42)
  {
    -[__CFString substringWithRange:](v9, "substringWithRange:", v40, (char *)v36 - v40);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "appendString:", v62);

    v36 = v42;
    v9 = v36;
  }
  else
  {
    v36 = 0;
  }
  self = v73;
  v11 = v74;
  if (!v72)
  {
LABEL_131:
    if (v34)
    {
      objc_msgSend(v35, "addObject:", v9);
      -[ICSProperty _setParsedValues:type:](self, "_setParsedValues:type:", v35, 5007);
    }
    else
    {
      -[ICSProperty setValue:type:](self, "setValue:type:", v9, 5007);
    }
    goto LABEL_134;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v9, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    -[ICSProperty setValue:type:](self, "setValue:type:", v63, 5013);
  else
    NSLog(CFSTR("Invalid URI (%@) in attachment: %@"), v9, self);

LABEL_134:
LABEL_135:

LABEL_136:
}

@end
