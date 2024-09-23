@implementation WFContentProperty(WFParameter)

- (id)parameterDefinition
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  const __CFString *v13;
  objc_class *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __CFString **v20;
  void *v21;
  int v22;
  objc_class *v23;
  void *v24;
  void *v25;

  v2 = (void *)objc_opt_new();
  WFLocalizedStringResourceWithKey(CFSTR("Value (ContentPropertyParameter)"), CFSTR("Value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Label"));

  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(a1, "multipleValues"))
    v5 = objc_msgSend(a1, "isLabeledValue") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "numberWithInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("AllowsMultipleValues"));

  v7 = (void *)objc_msgSend(a1, "propertyClass");
  if ((objc_msgSend(v7, "isEqual:", objc_opt_class()) & 1) == 0
    && (objc_msgSend(v7, "isEqual:", objc_opt_class()) & 1) == 0
    && !objc_msgSend(v7, "isEqual:", objc_opt_class()))
  {
    if (!objc_msgSend(v7, "isEqual:", objc_opt_class()))
    {
      if (!objc_msgSend(v7, "isEqual:", objc_opt_class())
        && !objc_msgSend(v7, "isEqual:", objc_opt_class())
        && !objc_msgSend(v7, "isEqual:", objc_opt_class())
        && !objc_msgSend(v7, "isEqual:", objc_opt_class())
        && !objc_msgSend(v7, "isEqual:", objc_opt_class()))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v7, "isEqual:", objc_opt_class());

        if (v22)
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("Class"));

          WFLocalizedStringResourceWithKey(CFSTR("Yes (ContentPropertyParameter)"), CFSTR("Yes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("OnDisplayName"));

          WFLocalizedStringResourceWithKey(CFSTR("No (ContentPropertyParameter)"), CFSTR("No"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = CFSTR("OffDisplayName");
          goto LABEL_10;
        }
        objc_msgSend(v7, "isEqual:", objc_opt_class());
      }
LABEL_9:
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("Class");
LABEL_10:
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v13);
      goto LABEL_11;
    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("Class"));

    if ((objc_msgSend(a1, "timeUnits") & 0x40) != 0)
      LODWORD(v17) = 1;
    else
      v17 = ((unint64_t)objc_msgSend(a1, "timeUnits") >> 5) & 1;
    if ((objc_msgSend(a1, "timeUnits") & 4) != 0
      || (objc_msgSend(a1, "timeUnits") & 8) != 0
      || (objc_msgSend(a1, "timeUnits") & 0x10) != 0)
    {
      LODWORD(v19) = 1;
    }
    else
    {
      v18 = objc_msgSend(a1, "timeUnits");
      v19 = (v18 >> 13) & 1;
      if ((_DWORD)v17 && (v18 & 0x2000) == 0)
      {
        v20 = WFDateFieldHintDateModeTime;
LABEL_29:
        objc_msgSend(v2, "setObject:forKeyedSubscript:", *v20, CFSTR("HintDateMode"));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("DetectsAllDayDates"));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("DisplaysAllDayString"));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("String"), CFSTR("ResultType"));
        return v2;
      }
    }
    if (v19 ^ 1 | v17)
      v20 = WFDateFieldHintDateModeDateAndTime;
    else
      v20 = WFDateFieldHintDateModeDate;
    goto LABEL_29;
  }
  if (!objc_msgSend(a1, "hasPossibleValues"))
    goto LABEL_9;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("Class"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ProvidesLocalizedValues"));
  objc_msgSend(a1, "possibleValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WFContentPropertyGetPossibleValuesSynchronouslyWithSemaphore();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("Items"));

LABEL_11:
  return v2;
}

@end
