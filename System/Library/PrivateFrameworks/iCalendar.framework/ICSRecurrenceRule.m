@implementation ICSRecurrenceRule

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ICSStringWriter *v17;
  void *v18;
  void *v19;
  void *v20;
  ICSStringWriter *v21;
  void *v22;
  void *v23;
  void *v24;
  ICSStringWriter *v25;
  void *v26;
  void *v27;
  void *v28;
  ICSStringWriter *v29;
  void *v30;
  void *v31;
  void *v32;
  ICSStringWriter *v33;
  void *v34;
  void *v35;
  void *v36;
  ICSStringWriter *v37;
  void *v38;
  void *v39;
  void *v40;
  ICSStringWriter *v41;
  void *v42;
  void *v43;
  void *v44;
  ICSStringWriter *v45;
  void *v46;
  void *v47;
  void *v48;
  ICSStringWriter *v49;
  void *v50;
  void *v51;
  void *v52;
  ICSStringWriter *v53;
  void *v54;
  void *v55;
  void *v56;
  ICSStringWriter *v57;
  void *v58;
  unint64_t v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;

  v64 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICSRecurrenceRule freq](self, "freq") - 1;
  if (v7 <= 6)
    objc_msgSend(v6, "addObject:", off_1E953B038[v7]);
  -[ICSRecurrenceRule interval](self, "interval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[ICSRecurrenceRule interval](self, "interval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("INTERVAL=%ld"), objc_msgSend(v10, "integerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

  }
  -[ICSRecurrenceRule count](self, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[ICSRecurrenceRule count](self, "count");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("COUNT=%ld"), objc_msgSend(v14, "integerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v15);

  }
  -[ICSRecurrenceRule until](self, "until");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("UNTIL="));
    -[ICSRecurrenceRule until](self, "until");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_ICSStringWithOptions:appendingToString:", a3, v17);

    -[ICSStringWriter result](v17, "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v19);

  }
  -[ICSRecurrenceRule bymonth](self, "bymonth");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYMONTH="));
    -[ICSRecurrenceRule bymonth](self, "bymonth");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_ICSStringWithOptions:appendingToString:", a3, v21);

    -[ICSStringWriter result](v21, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v23);

  }
  -[ICSRecurrenceRule byweekno](self, "byweekno");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYWEEKNO="));
    -[ICSRecurrenceRule byweekno](self, "byweekno");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_ICSStringWithOptions:appendingToString:", a3, v25);

    -[ICSStringWriter result](v25, "result");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v27);

  }
  -[ICSRecurrenceRule bysetpos](self, "bysetpos");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYSETPOS="));
    -[ICSRecurrenceRule bysetpos](self, "bysetpos");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_ICSStringWithOptions:appendingToString:", a3, v29);

    -[ICSStringWriter result](v29, "result");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v31);

  }
  -[ICSRecurrenceRule byyearday](self, "byyearday");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYYEARDAY="));
    -[ICSRecurrenceRule byyearday](self, "byyearday");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ICSStringWithOptions:appendingToString:", a3, v33);

    -[ICSStringWriter result](v33, "result");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v35);

  }
  -[ICSRecurrenceRule bymonthday](self, "bymonthday");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYMONTHDAY="));
    -[ICSRecurrenceRule bymonthday](self, "bymonthday");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_ICSStringWithOptions:appendingToString:", a3, v37);

    -[ICSStringWriter result](v37, "result");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v39);

  }
  -[ICSRecurrenceRule byday](self, "byday");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYDAY="));
    -[ICSRecurrenceRule byday](self, "byday");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_ICSStringWithOptions:appendingToString:", a3, v41);

    -[ICSStringWriter result](v41, "result");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v43);

  }
  -[ICSRecurrenceRule byhour](self, "byhour");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYHOUR="));
    -[ICSRecurrenceRule byhour](self, "byhour");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_ICSStringWithOptions:appendingToString:", a3, v45);

    -[ICSStringWriter result](v45, "result");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v47);

  }
  -[ICSRecurrenceRule byminute](self, "byminute");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYMINUTE="));
    -[ICSRecurrenceRule byminute](self, "byminute");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_ICSStringWithOptions:appendingToString:", a3, v49);

    -[ICSStringWriter result](v49, "result");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v51);

  }
  -[ICSRecurrenceRule bysecond](self, "bysecond");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v53 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("BYSECOND="));
    -[ICSRecurrenceRule bysecond](self, "bysecond");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "_ICSStringWithOptions:appendingToString:", a3, v53);

    -[ICSStringWriter result](v53, "result");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v55);

  }
  -[ICSRecurrenceRule wkst](self, "wkst");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", CFSTR("WKST="));
    -[ICSRecurrenceRule wkst](self, "wkst");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "integerValue") - 1;
    if (v59 > 6)
      v60 = CFSTR("ERROR");
    else
      v60 = off_1E953B070[v59];
    -[ICSStringWriter appendString:](v57, "appendString:", v60);

    -[ICSStringWriter result](v57, "result");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v61);

  }
  if ((a3 & 8) != 0)
  {
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "componentsJoinedByString:", CFSTR(";"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "appendString:", v63);

  }
  else
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(";"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "appendString:", v62);
  }

}

- (NSSet)propertiesToExcludeForChecksum
{
  return 0;
}

+ (id)recurrenceRuleFromICSString:(id)a3
{
  return +[ICSRecurrenceRule recurrenceRuleFromICSCString:withTokenizer:](ICSRecurrenceRule, "recurrenceRuleFromICSCString:withTokenizer:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0);
}

- (ICSRecurrenceRule)initWithFrequency:(unint64_t)a3
{
  ICSRecurrenceRule *v4;
  ICSRecurrenceRule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSRecurrenceRule;
  v4 = -[ICSRecurrenceRule init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ICSRecurrenceRule setFreq:](v4, "setFreq:", a3);
  return v5;
}

- (id)parameterValueForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parameters, "objectForKey:", a3);
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

- (unint64_t)freq
{
  return self->_freq;
}

- (void)setFreq:(unint64_t)a3
{
  self->_freq = a3;
}

- (ICSDateValue)until
{
  return (ICSDateValue *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("UNTIL"));
}

- (void)setUntil:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("UNTIL"));
}

- (NSNumber)count
{
  return (NSNumber *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("COUNT"));
}

- (void)setCount:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("COUNT"));
}

- (NSNumber)interval
{
  return (NSNumber *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("INTERVAL"));
}

- (void)setInterval:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("INTERVAL"));
}

- (NSArray)bysecond
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYSECOND"));
}

- (void)setBysecond:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYSECOND"));
}

- (NSArray)byminute
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYMINUTE"));
}

- (void)setByminute:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYMINUTE"));
}

- (NSArray)byhour
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYHOUR"));
}

- (void)setByhour:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYHOUR"));
}

- (NSArray)byday
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYDAY"));
}

- (void)setByday:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYDAY"));
}

- (NSArray)bymonthday
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYMONTHDAY"));
}

- (void)setBymonthday:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYMONTHDAY"));
}

- (NSArray)byyearday
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYYEARDAY"));
}

- (void)setByyearday:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYYEARDAY"));
}

- (NSArray)byweekno
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYWEEKNO"));
}

- (void)setByweekno:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYWEEKNO"));
}

- (NSArray)bymonth
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYMONTH"));
}

- (void)setBymonth:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYMONTH"));
}

- (NSArray)bysetpos
{
  return (NSArray *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("BYSETPOS"));
}

- (void)setBysetpos:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("BYSETPOS"));
}

- (NSNumber)wkst
{
  return (NSNumber *)-[ICSRecurrenceRule parameterValueForName:](self, "parameterValueForName:", CFSTR("WKST"));
}

- (void)setWkst:(id)a3
{
  -[ICSRecurrenceRule setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("WKST"));
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
  uint64_t freq_low;
  id v5;

  freq_low = LODWORD(self->_freq);
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", freq_low, CFSTR("Frequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("Parameters"));

}

- (ICSRecurrenceRule)initWithCoder:(id)a3
{
  id v4;
  ICSRecurrenceRule *v5;
  uint64_t v6;
  NSMutableDictionary *parameters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSRecurrenceRule;
  v5 = -[ICSRecurrenceRule init](&v9, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_13);
    v5->_freq = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("Frequency"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__parametersPermittedList, CFSTR("Parameters"));
    v6 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v6;

  }
  return v5;
}

void __35__ICSRecurrenceRule_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__parametersPermittedList;
  initWithCoder__parametersPermittedList = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (id)occurrencesForStartDate:(id)a3 fromDate:(id)a4 toDate:(id)a5 inTimeZone:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
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
  char isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  ICSRecurrenceRule *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  ICSRecurrenceRule *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  BOOL v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  ICSRecurrenceRule *v95;
  void *v96;
  void *v97;
  id obj;
  unint64_t v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0C99D48]);
  v15 = *MEMORY[0x1E0C996C8];
  v16 = (void *)objc_msgSend(v14, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v90 = v13;
  objc_msgSend(v16, "setTimeZone:", v13);
  objc_msgSend(v10, "components");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "components");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v18;
  objc_msgSend(v18, "laterDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = v12;
  objc_msgSend(v12, "components");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSRecurrenceRule until](self, "until");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = self;
  if (v24)
  {
    -[ICSRecurrenceRule until](self, "until");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v15);
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTimeZone:", v28);

      -[ICSRecurrenceRule until](self, "until");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "components");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dateFromComponents:", v30);
      v31 = v23;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "earlierDate:", v23);
      v32 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICSRecurrenceRule until](self, "until");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "components");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateFromComponents:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "earlierDate:", v30);
      v32 = objc_claimAutoreleasedReturnValue();
    }

    v23 = (void *)v32;
  }
  v33 = v95;
  -[ICSRecurrenceRule interval](v95, "interval");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[ICSRecurrenceRule interval](v95, "interval");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v35, "integerValue");

    v33 = v95;
  }
  else
  {
    v93 = 1;
  }
  v97 = v23;

  -[ICSRecurrenceRule count](v33, "count");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[ICSRecurrenceRule count](v33, "count");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v37, "unsignedIntegerValue");

  }
  else
  {
    v99 = -1;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v100 = (id)objc_claimAutoreleasedReturnValue();
  if (-[ICSRecurrenceRule freq](v33, "freq") == 7)
  {
    -[ICSRecurrenceRule bymonth](v33, "bymonth");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v39 == 1)
    {
      -[ICSRecurrenceRule bymonthday](v33, "bymonthday");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (!v41)
      {
        -[ICSRecurrenceRule byday](v33, "byday");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v72, "count") == 1)
        {
          -[ICSRecurrenceRule byday](v33, "byday");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectAtIndex:", 0);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "number");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v75)
            goto LABEL_67;
          objc_msgSend(v16, "components:fromDate:", 228, v92);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICSRecurrenceRule bymonth](v33, "bymonth");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectAtIndex:", 0);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setMonth:", objc_msgSend(v77, "integerValue"));

          -[ICSRecurrenceRule byday](v33, "byday");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectAtIndex:", 0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setWeekday:", objc_msgSend(v79, "weekday"));

          -[ICSRecurrenceRule byday](v33, "byday");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectAtIndex:", 0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "number");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setWeekdayOrdinal:", objc_msgSend(v82, "integerValue"));

          objc_msgSend(v16, "dateFromComponents:", v72);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v72, "year");
          if (objc_msgSend(v100, "count") < v99)
          {
            v85 = v84 + v93;
            while (objc_msgSend(v83, "compare:", v97) != 1)
            {
              if (objc_msgSend(v83, "compare:", v21) != -1)
                objc_msgSend(v100, "addObject:", v83);
              objc_msgSend(v72, "setYear:", v85);
              objc_msgSend(v16, "dateFromComponents:", v72);
              v86 = (void *)objc_claimAutoreleasedReturnValue();

              v85 += v93;
              v83 = v86;
              if (objc_msgSend(v100, "count") >= v99)
                goto LABEL_65;
            }
          }
          v86 = v83;
LABEL_65:

        }
        goto LABEL_67;
      }
      objc_msgSend(v16, "components:fromDate:", 228, v92);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSRecurrenceRule bymonth](v33, "bymonth");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndex:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setMonth:", objc_msgSend(v44, "integerValue"));

      v45 = v92;
      v46 = objc_msgSend(v42, "year");
      if (objc_msgSend(v100, "count") < v99)
      {
        v94 = v46;
        v88 = v11;
        v89 = v10;
        v47 = v95;
        v96 = v16;
        while (1)
        {
          if (objc_msgSend(v45, "compare:", v23) == 1)
            goto LABEL_53;
          -[ICSRecurrenceRule byday](v47, "byday");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count");

          if (!v49)
            break;
          -[ICSRecurrenceRule byday](v47, "byday");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v50, "count") != 1)
            goto LABEL_34;
          -[ICSRecurrenceRule byday](v47, "byday");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectAtIndex:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "number");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v97;
          if (!v53)
          {
            -[ICSRecurrenceRule byday](v47, "byday");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectAtIndex:", 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            -[ICSRecurrenceRule bymonthday](v47, "bymonthday");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
            v16 = v96;
            if (v61)
            {
              v62 = v61;
              v63 = *(_QWORD *)v102;
              do
              {
                for (i = 0; i != v62; ++i)
                {
                  v65 = v45;
                  if (*(_QWORD *)v102 != v63)
                    objc_enumerationMutation(obj);
                  objc_msgSend(v42, "setDay:", objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "integerValue"));
                  objc_msgSend(v16, "dateFromComponents:", v42);
                  v45 = (id)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v100, "count") < v99
                    && objc_msgSend(v45, "compare:", v21) != -1
                    && objc_msgSend(v45, "compare:", v23) != 1)
                  {
                    v66 = v21;
                    v67 = objc_msgSend(v50, "weekday");
                    objc_msgSend(v16, "components:fromDate:", 512, v45);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = objc_msgSend(v68, "weekday");

                    v70 = v67 == v69;
                    v21 = v66;
                    v16 = v96;
                    v23 = v97;
                    if (v70)
                      objc_msgSend(v100, "addObject:", v45);
                  }
                }
                v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
              }
              while (v62);
            }

            goto LABEL_49;
          }
          v16 = v96;
          v54 = v94;
LABEL_51:
          objc_msgSend(v42, "setDay:", 1);
          v94 = v54 + v93;
          objc_msgSend(v42, "setYear:", v54 + v93);
          objc_msgSend(v16, "dateFromComponents:", v42);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = v71;
          if (objc_msgSend(v100, "count") >= v99)
            goto LABEL_54;
        }
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        -[ICSRecurrenceRule bymonthday](v47, "bymonthday");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v106;
          v23 = v97;
          do
          {
            for (j = 0; j != v56; ++j)
            {
              v59 = v45;
              if (*(_QWORD *)v106 != v57)
                objc_enumerationMutation(v50);
              objc_msgSend(v42, "setDay:", objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "integerValue"));
              objc_msgSend(v16, "dateFromComponents:", v42);
              v45 = (id)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v100, "count") < v99
                && objc_msgSend(v45, "compare:", v21) != -1
                && objc_msgSend(v45, "compare:", v97) != 1)
              {
                objc_msgSend(v100, "addObject:", v45);
              }
            }
            v56 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
          }
          while (v56);
LABEL_49:
          v11 = v88;
          v10 = v89;
          v47 = v95;
        }
        else
        {
LABEL_34:
          v23 = v97;
        }
        v54 = v94;

        goto LABEL_51;
      }
LABEL_53:
      v71 = v45;
LABEL_54:

    }
  }
LABEL_67:

  return v100;
}

+ (id)recurrenceRuleFromICSCString:(const char *)a3 withTokenizer:(id)a4
{
  id v5;
  ICSRecurrenceRule *v6;
  unint64_t v7;
  char *v9;
  const char *i;
  ICSRecurrenceRule *v11;
  uint64_t v12;
  int v13;
  const char *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int64_t v30;
  const char *v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  int v39;
  uint64_t v40;
  unsigned int v41;
  void *v42;
  uint64_t v43;
  unsigned int v44;
  void *v45;
  const char *v46;
  int v47;
  uint64_t v48;
  unsigned int v49;
  void *v50;
  uint64_t v51;
  unsigned int v52;
  void *v53;
  const char *v54;
  int v55;
  uint64_t v56;
  unsigned int v57;
  void *v58;
  uint64_t v59;
  unsigned int v60;
  void *v61;
  const char *v62;
  int v63;
  unint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  unsigned int v68;
  void *v69;
  const char *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  const char *v77;
  int v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  ICSRecurrenceRule *v87;
  uint64_t v88;
  char *v89;
  void *v90;

  v5 = a4;
  v6 = objc_alloc_init(ICSRecurrenceRule);
  if (a3)
  {
    v7 = 0x1E9539000uLL;
    if (strncmp_s(a3, "FREQ=", 5uLL) || strlen(a3) <= 5)
    {
      +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("Invalid RRULE %s"), a3);
      a3 = 0;
      goto LABEL_5;
    }
    v9 = strdup(a3);
    i = v9 + 5;
    if (strncmp_s("YEARLY", v9 + 5, 6uLL))
    {
      if (!strncmp_s("MONTHLY", i, 7uLL))
      {
        -[ICSRecurrenceRule setFreq:](v6, "setFreq:", 6);
        i = v9 + 12;
        goto LABEL_20;
      }
      if (strncmp_s("WEEKLY", i, 6uLL))
      {
        if (!strncmp_s("DAILY", i, 5uLL))
        {
          -[ICSRecurrenceRule setFreq:](v6, "setFreq:", 4);
          i = v9 + 10;
          goto LABEL_20;
        }
        if (strncmp_s("HOURLY", i, 6uLL))
        {
          if (strncmp_s("MINUTELY", i, 8uLL))
          {
            if (strncmp_s("SECONDLY", i, 8uLL))
            {
              +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Unrecognized frequency %s"), a3, i);
              goto LABEL_20;
            }
            v87 = v6;
            v88 = 1;
          }
          else
          {
            v87 = v6;
            v88 = 2;
          }
          -[ICSRecurrenceRule setFreq:](v87, "setFreq:", v88);
          i = v9 + 13;
LABEL_20:
          if (*i)
            ++i;
          while (1)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
                  v13 = *(unsigned __int8 *)i;
                  if ((v13 - 9) >= 2 && v13 != 13)
                    break;
                  ++i;
                }
                if (!*i)
                {
LABEL_255:
                  free(v9);
                  v6 = v6;
                  a3 = (const char *)v6;
                  goto LABEL_5;
                }
                if (strncmp_s("COUNT=", i, 6uLL))
                  break;
                v20 = i + 6;
                for (i += 6; *i; ++i)
                {
                  if (*i == 59)
                  {
                    *i++ = 0;
                    break;
                  }
                }
                v21 = atoi(v20);
                if ((int)v21 >= 1)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ICSRecurrenceRule setCount:](v6, "setCount:", v22);
                  goto LABEL_92;
                }
                objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("Invalid COUNT value in recurrence:%s"), a3);
              }
              if (strncmp_s("UNTIL=", i, 6uLL))
                break;
              for (i += 6; *i; ++i)
              {
                if (*i == 59)
                {
                  *i++ = 0;
                  break;
                }
              }
              +[ICSDateValue dateFromICSUTF8String:](ICSDateValue, "dateFromICSUTF8String:");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
                -[ICSRecurrenceRule setUntil:](v6, "setUntil:", v22);
LABEL_92:

            }
            if (strncmp_s("INTERVAL=", i, 9uLL))
            {
              if (strncmp_s("WKST=", i, 5uLL))
              {
                if (!strncmp_s("BYMONTH=", i, 8uLL))
                {
                  v25 = i + 8;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_79:
                  for (i = v25; ; ++i)
                  {
                    v26 = *(unsigned __int8 *)i;
                    if (!*i)
                      break;
                    if (v26 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v26 == 44)
                    {
                      *i = 0;
                      v27 = atoi(v25);
                      if ((v27 - 1) > 0xB)
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYMONTH %d"), a3, v27);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v28);

                      }
                      v25 = i + 1;
                      goto LABEL_79;
                    }
                  }
                  v36 = atoi(v25);
                  if ((v36 - 1) > 0xB)
                  {
                    objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYMONTH %d"), a3, v36);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "addObject:", v37);

                  }
                  if (objc_msgSend(v16, "count"))
                    -[ICSRecurrenceRule setBymonth:](v6, "setBymonth:", v16);
                  goto LABEL_250;
                }
                if (!strncmp_s("BYYEARDAY=", i, 0xAuLL))
                {
                  v31 = i + 10;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_94:
                  for (i = v31; ; ++i)
                  {
                    v32 = *(unsigned __int8 *)i;
                    if (!*i)
                      break;
                    if (v32 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v32 == 44)
                    {
                      *i = 0;
                      v33 = atoi(v31);
                      if ((int)v33 >= 0)
                        v34 = v33;
                      else
                        v34 = -(int)v33;
                      if ((_DWORD)v33 && v34 <= 0x16E)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v35);

                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYYEARDAY %d"), a3, v33);
                      }
                      v31 = i + 1;
                      goto LABEL_94;
                    }
                  }
                  v43 = atoi(v31);
                  if ((int)v43 >= 0)
                    v44 = v43;
                  else
                    v44 = -(int)v43;
                  if ((_DWORD)v43 && v44 <= 0x16E)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "addObject:", v45);

                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYYEARDAY %d"), a3, v43);
                  }
                  if (objc_msgSend(v16, "count"))
                    -[ICSRecurrenceRule setByyearday:](v6, "setByyearday:", v16);
                  goto LABEL_250;
                }
                if (!strncmp_s("BYSETPOS=", i, 9uLL))
                {
                  v38 = i + 9;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_114:
                  for (i = v38; ; ++i)
                  {
                    v39 = *(unsigned __int8 *)i;
                    if (!*i)
                      break;
                    if (v39 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v39 == 44)
                    {
                      *i = 0;
                      v40 = atoi(v38);
                      if ((int)v40 >= 0)
                        v41 = v40;
                      else
                        v41 = -(int)v40;
                      if ((_DWORD)v40 && v41 <= 0x16E)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v42);

                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYSETPOS %d"), a3, v40);
                      }
                      v38 = i + 1;
                      goto LABEL_114;
                    }
                  }
                  v51 = atoi(v38);
                  if ((int)v51 >= 0)
                    v52 = v51;
                  else
                    v52 = -(int)v51;
                  if ((_DWORD)v51 && v52 <= 0x16E)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "addObject:", v53);

                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYSETPOS %d"), a3, v51);
                  }
                  if (objc_msgSend(v16, "count"))
                    -[ICSRecurrenceRule setBysetpos:](v6, "setBysetpos:", v16);
                  goto LABEL_250;
                }
                if (!strncmp_s("BYMONTHDAY=", i, 0xBuLL))
                {
                  v46 = i + 11;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_138:
                  for (i = v46; ; ++i)
                  {
                    v47 = *(unsigned __int8 *)i;
                    if (!*i)
                      break;
                    if (v47 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v47 == 44)
                    {
                      *i = 0;
                      v48 = atoi(v46);
                      if ((int)v48 >= 0)
                        v49 = v48;
                      else
                        v49 = -(int)v48;
                      if ((_DWORD)v48 && v49 <= 0x1F)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v50);

                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYMONTHDAY %d"), a3, v48);
                      }
                      v46 = i + 1;
                      goto LABEL_138;
                    }
                  }
                  v59 = atoi(v46);
                  if ((int)v59 >= 0)
                    v60 = v59;
                  else
                    v60 = -(int)v59;
                  if ((_DWORD)v59 && v60 <= 0x1F)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "addObject:", v61);

                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYMONTHDAY %d"), a3, v59);
                  }
                  if (objc_msgSend(v16, "count"))
                    -[ICSRecurrenceRule setBymonthday:](v6, "setBymonthday:", v16);
                  goto LABEL_250;
                }
                if (!strncmp_s("BYWEEKNO=", i, 9uLL))
                {
                  v54 = i + 9;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_162:
                  for (i = v54; ; ++i)
                  {
                    v55 = *(unsigned __int8 *)i;
                    if (!*i)
                      break;
                    if (v55 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v55 == 44)
                    {
                      *i = 0;
                      v56 = atoi(v54);
                      if ((int)v56 >= 0)
                        v57 = v56;
                      else
                        v57 = -(int)v56;
                      if ((_DWORD)v56 && v57 <= 0x35)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v58);

                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYWEEKNO %d"), a3, v56);
                      }
                      v54 = i + 1;
                      goto LABEL_162;
                    }
                  }
                  v67 = atoi(v54);
                  if ((int)v67 >= 0)
                    v68 = v67;
                  else
                    v68 = -(int)v67;
                  if ((_DWORD)v67 && v68 <= 0x35)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v67);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "addObject:", v69);

                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYWEEKNO %d"), a3, v67);
                  }
                  if (objc_msgSend(v16, "count"))
                    -[ICSRecurrenceRule setByweekno:](v6, "setByweekno:", v16);
                  goto LABEL_250;
                }
                if (strncmp_s("BYDAY=", i, 6uLL))
                {
                  if (strncmp_s("BYMINUTE=", i, 9uLL))
                  {
                    if (strncmp_s("BYSECOND=", i, 9uLL))
                    {
                      if (strncmp_s("BYHOUR=", i, 7uLL))
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("Unrecognized value in RRULE %s, (%s)"), a3, i);

                        v6 = 0;
                        goto LABEL_255;
                      }
                      v15 = i + 7;
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
                      for (i = v15; ; ++i)
                      {
                        v17 = *(unsigned __int8 *)i;
                        if (!*i)
                          break;
                        if (v17 == 59)
                        {
                          *i++ = 0;
                          break;
                        }
                        if (v17 == 44)
                        {
                          *i = 0;
                          v18 = atoi(v15);
                          if (v18 > 0x17)
                          {
                            objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYHOUR %d"), a3, v18);
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
                            v19 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v16, "addObject:", v19);

                          }
                          v15 = i + 1;
                          goto LABEL_43;
                        }
                      }
                      v81 = atoi(v15);
                      if (v81 > 0x17)
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYHOUR %d"), a3, v81);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v81);
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v82);

                      }
                      if (objc_msgSend(v16, "count"))
                        -[ICSRecurrenceRule setByhour:](v6, "setByhour:", v16);
                    }
                    else
                    {
                      v77 = i + 9;
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_219:
                      for (i = v77; ; ++i)
                      {
                        v78 = *(unsigned __int8 *)i;
                        if (!*i)
                          break;
                        if (v78 == 59)
                        {
                          *i++ = 0;
                          break;
                        }
                        if (v78 == 44)
                        {
                          *i = 0;
                          v79 = atoi(v77);
                          if (v79 > 0x3B)
                          {
                            objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYSECOND %d"), a3, v79);
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v79);
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v16, "addObject:", v80);

                          }
                          v77 = i + 1;
                          goto LABEL_219;
                        }
                      }
                      v85 = atoi(v77);
                      if (v85 > 0x3B)
                      {
                        objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYSECOND %d"), a3, v85);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v85);
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObject:", v86);

                      }
                      if (objc_msgSend(v16, "count"))
                        -[ICSRecurrenceRule setBysecond:](v6, "setBysecond:", v16);
                    }
                  }
                  else
                  {
                    v70 = i + 9;
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_206:
                    for (i = v70; ; ++i)
                    {
                      v71 = *(unsigned __int8 *)i;
                      if (!*i)
                        break;
                      if (v71 == 59)
                      {
                        *i++ = 0;
                        break;
                      }
                      if (v71 == 44)
                      {
                        *i = 0;
                        v72 = atoi(v70);
                        if (v72 > 0x3B)
                        {
                          objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYMINUTE %d"), a3, v72);
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v72);
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v16, "addObject:", v73);

                        }
                        v70 = i + 1;
                        goto LABEL_206;
                      }
                    }
                    v83 = atoi(v70);
                    if (v83 > 0x3B)
                    {
                      objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYMINUTE %d"), a3, v83);
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v83);
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "addObject:", v84);

                    }
                    if (objc_msgSend(v16, "count"))
                      -[ICSRecurrenceRule setByminute:](v6, "setByminute:", v16);
                  }
LABEL_250:

                }
                else
                {
                  v62 = i + 6;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v89 = v9;
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_186:
                  for (i = v62; ; ++i)
                  {
                    v63 = *(unsigned __int8 *)i;
                    if (!*i)
                      break;
                    if (v63 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v63 == 44)
                    {
                      v64 = v7;
                      *i = 0;
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v62);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      +[ICSByDayValue byDayValueFromICSString:](ICSByDayValue, "byDayValueFromICSString:", v65);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v66)
                        objc_msgSend(v90, "addObject:", v66);
                      else
                        objc_msgSend(*(id *)(v64 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYDAY  %s"), a3, v62);
                      v62 = i + 1;

                      v7 = v64;
                      goto LABEL_186;
                    }
                  }
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v62);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  +[ICSByDayValue byDayValueFromICSString:](ICSByDayValue, "byDayValueFromICSString:", v74);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v75)
                  {
                    v76 = v90;
                    objc_msgSend(v90, "addObject:", v75);
                    v9 = v89;
                  }
                  else
                  {
                    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Bad value in BYDAY %s"), a3, v62);
                    v9 = v89;
                    v76 = v90;
                  }
                  if (objc_msgSend(v76, "count"))
                    -[ICSRecurrenceRule setByday:](v6, "setByday:", v76);

                  v7 = 0x1E9539000;
                }
              }
              else
              {
                for (i += 5; *i; ++i)
                {
                  if (*i == 59)
                  {
                    *i++ = 0;
                    break;
                  }
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = +[ICSByDayValue weekdayFromICSString:](ICSByDayValue, "weekdayFromICSString:", v29);

                if (v30 != -1)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v30);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ICSRecurrenceRule setWkst:](v6, "setWkst:", v22);
                  goto LABEL_92;
                }
              }
            }
            else
            {
              v23 = i + 9;
              for (i += 9; *i; ++i)
              {
                if (*i == 59)
                {
                  *i++ = 0;
                  break;
                }
              }
              v24 = atoi(v23);
              if ((int)v24 >= 1)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICSRecurrenceRule setInterval:](v6, "setInterval:", v22);
                goto LABEL_92;
              }
              objc_msgSend(*(id *)(v7 + 4032), "logAtLevel:forTokenizer:message:", 3, v5, CFSTR("RRULE %s Invalid INTERVAL value in recurrence:%s"), a3, v23);
            }
          }
        }
        v11 = v6;
        v12 = 3;
      }
      else
      {
        v11 = v6;
        v12 = 5;
      }
    }
    else
    {
      v11 = v6;
      v12 = 7;
    }
    -[ICSRecurrenceRule setFreq:](v11, "setFreq:", v12);
    i = v9 + 11;
    goto LABEL_20;
  }
LABEL_5:

  return (id)(id)a3;
}

- (void)cleanUpForStartDate:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  ICSDateValue *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v8;
    if ((isKindOfClass & 1) == 0)
    {
      -[ICSRecurrenceRule until](self, "until");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = -[ICSDateValue initWithYear:month:day:]([ICSDateValue alloc], "initWithYear:month:day:", objc_msgSend(v6, "year"), objc_msgSend(v6, "month"), objc_msgSend(v6, "day"));
          -[ICSRecurrenceRule setUntil:](self, "setUntil:", v7);

        }
      }

      v4 = v8;
    }
  }

}

@end
