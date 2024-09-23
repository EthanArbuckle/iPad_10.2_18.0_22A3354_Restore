@implementation PLDateRangeTitleGenerator

- (PLDateRangeTitleGenerator)init
{
  PLDateRangeTitleGenerator *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  PLLazyObject *lazyRecentDateRangeFormatter;
  id v8;
  id v9;
  uint64_t v10;
  PLLazyObject *lazyDateRangeFormatter;
  id v12;
  id v13;
  uint64_t v14;
  PLLazyObject *lazyYearlessDateRangeFormatter;
  id v16;
  id v17;
  uint64_t v18;
  PLLazyObject *lazyMonthYearWithDelimiterDateRangeFormatter;
  id v20;
  id v21;
  uint64_t v22;
  PLLazyObject *lazyShortMonthYearWithDelimiterDateRangeFormatter;
  id v24;
  id v25;
  uint64_t v26;
  PLLazyObject *lazyShortMonthYearDateRangeFormatter;
  id v28;
  id v29;
  uint64_t v30;
  PLLazyObject *lazyYearDateRangeFormatter;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)PLDateRangeTitleGenerator;
  v2 = -[PLDateRangeTitleGenerator init](&v48, sel_init);
  if (v2)
  {
    v3 = objc_initWeak(&location, v2);

    v4 = objc_alloc(MEMORY[0x1E0D73248]);
    v5 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __33__PLDateRangeTitleGenerator_init__block_invoke;
    v45[3] = &unk_1E36759D8;
    objc_copyWeak(&v46, &location);
    v6 = objc_msgSend(v4, "initWithBlock:", v45);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    lazyRecentDateRangeFormatter = v2->_lazyRecentDateRangeFormatter;
    v2->_lazyRecentDateRangeFormatter = (PLLazyObject *)v6;

    v8 = objc_initWeak(&location, v2);
    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v43[0] = v5;
    v43[1] = 3221225472;
    v43[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_2;
    v43[3] = &unk_1E36759D8;
    objc_copyWeak(&v44, &location);
    v10 = objc_msgSend(v9, "initWithBlock:", v43);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    lazyDateRangeFormatter = v2->_lazyDateRangeFormatter;
    v2->_lazyDateRangeFormatter = (PLLazyObject *)v10;

    v12 = objc_initWeak(&location, v2);
    v13 = objc_alloc(MEMORY[0x1E0D73248]);
    v41[0] = v5;
    v41[1] = 3221225472;
    v41[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_3;
    v41[3] = &unk_1E36759D8;
    objc_copyWeak(&v42, &location);
    v14 = objc_msgSend(v13, "initWithBlock:", v41);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    lazyYearlessDateRangeFormatter = v2->_lazyYearlessDateRangeFormatter;
    v2->_lazyYearlessDateRangeFormatter = (PLLazyObject *)v14;

    v16 = objc_initWeak(&location, v2);
    v17 = objc_alloc(MEMORY[0x1E0D73248]);
    v39[0] = v5;
    v39[1] = 3221225472;
    v39[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_4;
    v39[3] = &unk_1E36759D8;
    objc_copyWeak(&v40, &location);
    v18 = objc_msgSend(v17, "initWithBlock:", v39);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    lazyMonthYearWithDelimiterDateRangeFormatter = v2->_lazyMonthYearWithDelimiterDateRangeFormatter;
    v2->_lazyMonthYearWithDelimiterDateRangeFormatter = (PLLazyObject *)v18;

    v20 = objc_initWeak(&location, v2);
    v21 = objc_alloc(MEMORY[0x1E0D73248]);
    v37[0] = v5;
    v37[1] = 3221225472;
    v37[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_5;
    v37[3] = &unk_1E36759D8;
    objc_copyWeak(&v38, &location);
    v22 = objc_msgSend(v21, "initWithBlock:", v37);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
    lazyShortMonthYearWithDelimiterDateRangeFormatter = v2->_lazyShortMonthYearWithDelimiterDateRangeFormatter;
    v2->_lazyShortMonthYearWithDelimiterDateRangeFormatter = (PLLazyObject *)v22;

    v24 = objc_initWeak(&location, v2);
    v25 = objc_alloc(MEMORY[0x1E0D73248]);
    v35[0] = v5;
    v35[1] = 3221225472;
    v35[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_6;
    v35[3] = &unk_1E36759D8;
    objc_copyWeak(&v36, &location);
    v26 = objc_msgSend(v25, "initWithBlock:", v35);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    lazyShortMonthYearDateRangeFormatter = v2->_lazyShortMonthYearDateRangeFormatter;
    v2->_lazyShortMonthYearDateRangeFormatter = (PLLazyObject *)v26;

    v28 = objc_initWeak(&location, v2);
    v29 = objc_alloc(MEMORY[0x1E0D73248]);
    v33[0] = v5;
    v33[1] = 3221225472;
    v33[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_7;
    v33[3] = &unk_1E36759D8;
    objc_copyWeak(&v34, &location);
    v30 = objc_msgSend(v29, "initWithBlock:", v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
    lazyYearDateRangeFormatter = v2->_lazyYearDateRangeFormatter;
    v2->_lazyYearDateRangeFormatter = (PLLazyObject *)v30;

  }
  return v2;
}

- (PLDateRangeTitleGenerator)initWithLocale:(id)a3
{
  id v5;
  PLDateRangeTitleGenerator *v6;
  PLDateRangeTitleGenerator *v7;

  v5 = a3;
  v6 = -[PLDateRangeTitleGenerator init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locale, a3);

  return v7;
}

- (id)dateRangeTitleWithStartDate:(id)a3 endDate:(id)a4 category:(unsigned __int16)a5 kind:(unsigned __int16)a6 type:(unsigned __int16)a7
{
  return -[PLDateRangeTitleGenerator dateRangeTitleWithStartDate:endDate:category:kind:type:options:](self, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", a3, a4, a5, a6, a7, 0);
}

- (id)dateRangeTitleWithStartDate:(id)a3 endDate:(id)a4 category:(unsigned __int16)a5 kind:(unsigned __int16)a6 type:(unsigned __int16)a7 options:(unint64_t)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = v15;
  v17 = 0;
  if (v14 && v15)
  {
    -[PLDateRangeTitleGenerator dateRangeFormatterForCategory:kind:type:options:](self, "dateRangeFormatterForCategory:kind:type:options:", v11, v10, v9, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a8 & 8) != 0)
        objc_msgSend(v18, "setAllowUseTime:", 0);
      if (v9 <= 4 && ((1 << v9) & 0x16) != 0)
        objc_msgSend(v19, "setAllowUseRelativeDayFormatting:", 0);
      if ((a8 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLocale:", v20);

      }
      if (v10 >= 2)
        v21 = v16;
      else
        v21 = v14;
      objc_msgSend(v19, "stringFromDate:toDate:", v14, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (id)dateRangeFormatterForCategory:(unsigned __int16)a3 kind:(unsigned __int16)a4 type:(unsigned __int16)a5 options:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  switch(a4)
  {
    case 0u:
    case 3u:
      if ((a6 & 0x10) != 0)
      {
        -[PLDateRangeTitleGenerator shortMonthYearDateRangeFormatter](self, "shortMonthYearDateRangeFormatter", a3, v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 1)
        {
          if (a3)
            goto LABEL_8;
          if ((a6 & 2) != 0)
            -[PLDateRangeTitleGenerator yearlessDateRangeFormatter](self, "yearlessDateRangeFormatter", v6, v7);
          else
            -[PLDateRangeTitleGenerator dateRangeFormatter](self, "dateRangeFormatter", v6, v7);
          goto LABEL_7;
        }
        -[PLDateRangeTitleGenerator recentDateRangeFormatter](self, "recentDateRangeFormatter", v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 1u:
LABEL_8:
      if ((a6 & 4) != 0)
        -[PLDateRangeTitleGenerator shortMonthYearWithDelimiterDateRangeFormatter](self, "shortMonthYearWithDelimiterDateRangeFormatter", a3, v6, v7);
      else
        -[PLDateRangeTitleGenerator monthYearWithDelimiterDateRangeFormatter](self, "monthYearWithDelimiterDateRangeFormatter", a3, v6, v7);
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      -[PLDateRangeTitleGenerator yearDateRangeFormatter](self, "yearDateRangeFormatter", a3, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (id)newRecentDateRangeFormatter
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  +[PLDateRangeFormatter autoupdatingFormatterWithPreset:](PLDateRangeFormatter, "autoupdatingFormatterWithPreset:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseLocalDates:", 1);
  if (self->_locale)
    objc_msgSend(v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)newDateRangeFormatter
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  +[PLDateRangeFormatter autoupdatingFormatterWithPreset:](PLDateRangeFormatter, "autoupdatingFormatterWithPreset:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseLocalDates:", 1);
  if (self->_locale)
    objc_msgSend(v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)newYearlessDateRangeFormatter
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  +[PLDateRangeFormatter autoupdatingFormatterWithPreset:](PLDateRangeFormatter, "autoupdatingFormatterWithPreset:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseLocalDates:", 1);
  if (self->_locale)
    objc_msgSend(v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)newMonthYearWithDelimiterDateRangeFormatter
{
  void *v3;
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = -[PLDateRangeFormatter initWithPreset:]([PLDateRangeFormatter alloc], "initWithPreset:", 8);
  v5 = v4;
  if (self->_locale)
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)newShortMonthYearWithDelimiterDateRangeFormatter
{
  void *v3;
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = -[PLDateRangeFormatter initWithPreset:]([PLDateRangeFormatter alloc], "initWithPreset:", 9);
  v5 = v4;
  if (self->_locale)
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)newShortMonthYearDateRangeFormatter
{
  void *v3;
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = -[PLDateRangeFormatter initWithPreset:]([PLDateRangeFormatter alloc], "initWithPreset:", 10);
  v5 = v4;
  if (self->_locale)
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)newYearDateRangeFormatter
{
  void *v3;
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = -[PLDateRangeFormatter initWithPreset:]([PLDateRangeFormatter alloc], "initWithPreset:", 4);
  v5 = v4;
  if (self->_locale)
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)recentDateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyRecentDateRangeFormatter, "objectValue");
}

- (id)dateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyDateRangeFormatter, "objectValue");
}

- (id)yearlessDateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyYearlessDateRangeFormatter, "objectValue");
}

- (id)monthYearWithDelimiterDateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyMonthYearWithDelimiterDateRangeFormatter, "objectValue");
}

- (id)shortMonthYearWithDelimiterDateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyShortMonthYearWithDelimiterDateRangeFormatter, "objectValue");
}

- (id)shortMonthYearDateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyShortMonthYearDateRangeFormatter, "objectValue");
}

- (id)yearDateRangeFormatter
{
  return (id)-[PLLazyObject objectValue](self->_lazyYearDateRangeFormatter, "objectValue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lazyYearDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyShortMonthYearDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyShortMonthYearWithDelimiterDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyMonthYearWithDelimiterDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyYearlessDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyRecentDateRangeFormatter, 0);
}

id __33__PLDateRangeTitleGenerator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newRecentDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newYearlessDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newMonthYearWithDelimiterDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newShortMonthYearWithDelimiterDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newShortMonthYearDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newYearDateRangeFormatter");
  else
    v3 = 0;

  return v3;
}

@end
