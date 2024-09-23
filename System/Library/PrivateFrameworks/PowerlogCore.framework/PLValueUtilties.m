@implementation PLValueUtilties

+ (BOOL)isFormater:(signed __int16)a3 validForObject:(id)a4
{
  id v5;
  id v6;
  char v7;
  char isKindOfClass;

  v5 = a4;
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((unsigned __int16)a3 - 3 >= 4)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 7:
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      break;
    case 3:
    case 4:
    case 5:
    case 6:
      isKindOfClass = objc_opt_respondsToSelector();
      break;
    default:
      goto LABEL_8;
  }
  v7 = isKindOfClass;
LABEL_6:

  return v7 & 1;
}

+ (signed)formatterFromDataType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  signed __int16 v6;

  v3 = formatterFromDataType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&formatterFromDataType__onceToken, &__block_literal_global_43);
  objc_msgSend((id)formatterFromDataType__PPSPBDatatypeToPLVFormater, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "shortValue");
  return v6;
}

+ (int64_t)compare:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = a3;
  v6 = a4;
  if (!+[PLValueUtilties isNil:](PLValueUtilties, "isNil:", v5)
    && !+[PLValueUtilties isNil:](PLValueUtilties, "isNil:", v6)
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0))
  {
    v7 = objc_msgSend(v5, "compare:", v6);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)isNil:(id)a3
{
  void *v3;
  id v4;
  id v5;
  BOOL v6;

  if (!a3)
    return 1;
  v3 = (void *)MEMORY[0x1E0C99E38];
  v4 = a3;
  objc_msgSend(v3, "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5 == v4;

  return v6;
}

+ (id)formattedStringForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_sync_enter(CFSTR("kSharedTimestampFormater"));
  v4 = (void *)timestampFormatter;
  if (!timestampFormatter)
  {
    +[PLValueUtilties resetTimestampFormaterTimezone](PLValueUtilties, "resetTimestampFormaterTimezone");
    v4 = (void *)timestampFormatter;
  }
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("kSharedTimestampFormater"));

  return v5;
}

void __41__PLValueUtilties_formatterFromDataType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6ABEB70;
  v2[1] = &unk_1E6ABEBA0;
  v3[0] = &unk_1E6ABEB88;
  v3[1] = &unk_1E6ABEBB8;
  v2[2] = &unk_1E6ABEBD0;
  v2[3] = &unk_1E6ABEC00;
  v3[2] = &unk_1E6ABEBE8;
  v3[3] = &unk_1E6ABEC18;
  v2[4] = &unk_1E6ABEC30;
  v2[5] = &unk_1E6ABEC60;
  v3[4] = &unk_1E6ABEC48;
  v3[5] = &unk_1E6ABEC78;
  v2[6] = &unk_1E6ABEC90;
  v2[7] = &unk_1E6ABECC0;
  v3[6] = &unk_1E6ABECA8;
  v3[7] = &unk_1E6ABECD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)formatterFromDataType__PPSPBDatatypeToPLVFormater;
  formatterFromDataType__PPSPBDatatypeToPLVFormater = v0;

}

+ (void)resetTimestampFormaterTimezone
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_sync_enter(CFSTR("kSharedTimestampFormater"));
  v2 = objc_opt_new();
  v3 = (void *)timestampFormatter;
  timestampFormatter = v2;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)timestampFormatter, "setLocale:", v4);
  v5 = (void *)timestampFormatter;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C99790]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  v7 = (void *)timestampFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  objc_msgSend((id)timestampFormatter, "setDateFormat:", CFSTR("MM/dd/yy HH:mm:ss.SSS"));
  objc_sync_exit(CFSTR("kSharedTimestampFormater"));
}

@end
