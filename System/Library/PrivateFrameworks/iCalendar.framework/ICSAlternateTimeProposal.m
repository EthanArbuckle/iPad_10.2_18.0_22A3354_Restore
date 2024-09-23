@implementation ICSAlternateTimeProposal

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = v6;
  if ((a3 & 0x10) != 0)
  {
    if (-[ICSProperty shouldObscureValue](self, "shouldObscureValue"))
      a3 |= 0x20uLL;
    v7 = v11;
  }
  else
  {
    v7 = v6;
  }
  objc_msgSend(v7, "appendString:", CFSTR("\"));
  -[ICSAlternateTimeProposal startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v11, "appendString:", CFSTR("DTSTART"));
    objc_msgSend(v11, "appendString:", CFSTR(":"));
    -[ICSAlternateTimeProposal startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ICSStringWithOptions:appendingToString:", a3, v11);

    objc_msgSend(v11, "appendString:", CFSTR(";"));
    objc_msgSend(v11, "appendString:", CFSTR("STATUS"));
    objc_msgSend(v11, "appendString:", CFSTR(":"));
    +[ICSAlternateTimeProposalStatusParameter statusParameterFromCode:](ICSAlternateTimeProposalStatusParameter, "statusParameterFromCode:", -[ICSAlternateTimeProposal status](self, "status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_ICSStringWithOptions:appendingToString:", a3, v11);
    objc_msgSend(v11, "appendString:", CFSTR(";"));

  }
  objc_msgSend(v11, "appendString:", CFSTR("\"));

}

- (void)setStartDate:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("DTSTART"));
}

- (ICSDateTimeValue)startDate
{
  return (ICSDateTimeValue *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("DTSTART"));
}

+ (id)ICSStringFromAlternateTimeProposalStatus:(int)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return off_1E953B210[a3 - 1];
}

+ (int)statusFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS-ACTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DECLINED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setStatus:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSAlternateTimeProposalStatusParameter statusParameterFromCode:](ICSAlternateTimeProposalStatusParameter, "statusParameterFromCode:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("STATUS"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("STATUS"));
  }
}

- (int)status
{
  void *v3;
  void *v4;
  int v5;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("STATUS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("STATUS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

+ (id)alternateTimeProposalFromICSCString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    +[ICSAlternateTimeProposal _parseICSString:](ICSAlternateTimeProposal, "_parseICSString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("DTSTART"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("STATUS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = (void *)objc_opt_new();
      +[ICSDateValue dateFromICSString:](ICSDateValue, "dateFromICSString:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setStartDate:", v7);
      if (v5)
        objc_msgSend(v6, "setStatus:", +[ICSAlternateTimeProposal statusFromICSString:](ICSAlternateTimeProposal, "statusFromICSString:", v5));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)_parseICSString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 2)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v4);
  return v13;
}

@end
