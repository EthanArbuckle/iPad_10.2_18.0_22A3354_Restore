@implementation _UIDatePickerCalendarTimeFormat

+ (_UIDatePickerCalendarTimeFormat)formatWithCalendar:(id)a3 locale:(id)a4
{
  return (_UIDatePickerCalendarTimeFormat *)objc_msgSend(a1, "formatWithCalendar:locale:followsSystemHourCycle:", a3, a4, 0);
}

+ (_UIDatePickerCalendarTimeFormat)formatWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCalendar:locale:followsSystemHourCycle:forceDoubleDigitHours:displaysTimeZone:", v8, v7, v5, 0, 0);

  return (_UIDatePickerCalendarTimeFormat *)v9;
}

- (_UIDatePickerCalendarTimeFormat)initWithCalendar:(id)a3 locale:(id)a4 forceDoubleDigitHours:(BOOL)a5 displaysTimeZone:(BOOL)a6
{
  return -[_UIDatePickerCalendarTimeFormat initWithCalendar:locale:followsSystemHourCycle:forceDoubleDigitHours:displaysTimeZone:](self, "initWithCalendar:locale:followsSystemHourCycle:forceDoubleDigitHours:displaysTimeZone:", a3, a4, 0, a5, a6);
}

- (_UIDatePickerCalendarTimeFormat)initWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 forceDoubleDigitHours:(BOOL)a6 displaysTimeZone:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  _UIDatePickerCalendarTimeFormat *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSTimeZone *timeZone;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *AMSymbol;
  uint64_t v24;
  NSString *PMSymbol;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  int v45;
  id v46;
  uint64_t v47;
  id v48;
  unint64_t v49;
  NSObject *v50;
  id v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  NSString *timeFormat;
  void *v66;
  void *v67;
  unint64_t v68;
  NSString *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _BOOL4 v76;
  uint64_t v77;
  NSNumberFormatter *v78;
  NSNumberFormatter *v79;
  NSNumberFormatter *hourFormatter;
  NSNumberFormatter *v81;
  NSNumberFormatter *v82;
  NSNumberFormatter *minuteFormatter;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  unint64_t v89;
  NSObject *v90;
  SEL v91;
  uint64_t v92;
  int v93;
  void *v94;
  void *v95;
  _UIDatePickerCalendarTimeFormat *v96;
  _BOOL4 v97;
  id v98;
  id v99;
  void *v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id obj;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  objc_super v116;
  uint8_t buf[4];
  int v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  id v122;
  __int16 v123;
  id v124;
  _BYTE v125[128];
  uint64_t v126;

  v7 = a7;
  v97 = a6;
  v8 = a5;
  v126 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v116.receiver = self;
  v116.super_class = (Class)_UIDatePickerCalendarTimeFormat;
  v14 = -[_UIDatePickerCalendarTimeFormat init](&v116, sel_init);
  if (!v14)
    goto LABEL_76;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setCalendar:", v12);
  objc_msgSend(v15, "setLocale:", v13);
  objc_msgSend(v12, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeZone:", v16);

  v91 = a2;
  if (v7)
  {
    objc_msgSend(v12, "timeZone");
    v17 = objc_claimAutoreleasedReturnValue();
    timeZone = v14->_timeZone;
    v14->_timeZone = (NSTimeZone *)v17;

    objc_storeStrong((id *)&v14->_locale, a4);
    v14->_timeZoneReferenceDate = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = CFSTR("jm zzz");
  }
  else
  {
    v19 = CFSTR("jm");
  }
  v93 = v8;
  _UIDatePickerDateFormatFromTemplate(v19, v13, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDateFormat:", v20);

  v14->_displaysTimeZone = v7;
  v99 = v12;
  v21 = (void *)objc_msgSend(v12, "copy");
  v98 = v13;
  objc_msgSend(v21, "setLocale:", v13);
  objc_msgSend(v21, "AMSymbol");
  v22 = objc_claimAutoreleasedReturnValue();
  AMSymbol = v14->_AMSymbol;
  v14->_AMSymbol = (NSString *)v22;

  v94 = v21;
  objc_msgSend(v21, "PMSymbol");
  v24 = objc_claimAutoreleasedReturnValue();
  PMSymbol = v14->_PMSymbol;
  v96 = v14;
  v14->_PMSymbol = (NSString *)v24;

  v95 = v15;
  objc_msgSend(v15, "dateFormat");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "_componentsFromFormatString:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v28 = v26;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
  v30 = *MEMORY[0x1E0C99730];
  v104 = v28;
  if (!v29)
  {
    obj = 0;
    v106 = -1;
    v107 = 0;
    v102 = 0x7FFFFFFFFFFFFFFFLL;
    v103 = 0;
    v105 = 0x7FFFFFFFFFFFFFFFLL;
    v101 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
  v31 = v29;
  obj = 0;
  v103 = 0;
  v107 = 0;
  v106 = -1;
  v102 = 0x7FFFFFFFFFFFFFFFLL;
  v32 = *(_QWORD *)v113;
  v108 = *MEMORY[0x1E0C99738];
  v109 = *MEMORY[0x1E0C99740];
  v105 = 0x7FFFFFFFFFFFFFFFLL;
  v101 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v33 = 0;
    v111 = v31;
    do
    {
      if (*(_QWORD *)v113 != v32)
        objc_enumerationMutation(v28);
      v34 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v33);
      objc_msgSend(v34, "objectForKeyedSubscript:", v30, v91);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "BOOLValue");

      if (v36)
      {
        objc_msgSend(v27, "addObject:", v34);
        goto LABEL_38;
      }
      v37 = v30;
      v38 = v27;
      objc_msgSend(v34, "objectForKeyedSubscript:", v109);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", v108);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "rangeValue");
      v43 = v42;

      v44 = objc_msgSend(v39, "characterAtIndex:", 0);
      v45 = v44;
      if (v44 <= 103)
      {
        switch(v44)
        {
          case 'H':
            v48 = v39;

            objc_msgSend(v38, "addObject:", v34);
            obj = v48;
            v27 = v38;
            v107 = v43;
            v105 = v41;
            v47 = 2;
            goto LABEL_32;
          case 'K':
            v52 = v39;

            objc_msgSend(v38, "addObject:", v34);
            v106 = 0;
            v107 = v43;
            obj = v52;
            v27 = v38;
            v105 = v41;
            goto LABEL_35;
          case 'a':
            v27 = v38;
            objc_msgSend(v38, "addObject:", v34);
            v101 = v41;
LABEL_35:
            v30 = v37;
            goto LABEL_36;
        }
      }
      else if (v44 > 108)
      {
        if (v44 == 109)
        {
          v27 = v38;
          objc_msgSend(v38, "addObject:", v34);
          v102 = v41;
          v103 = v43;
          goto LABEL_35;
        }
        if (v44 == 122)
        {
          v27 = v38;
          objc_msgSend(v38, "addObject:", v34);
          goto LABEL_35;
        }
      }
      else
      {
        if (v44 == 104)
        {
          v51 = v39;

          objc_msgSend(v38, "addObject:", v34);
          obj = v51;
          v28 = v104;
          v27 = v38;
          v107 = v43;
          v105 = v41;
          v47 = 1;
          goto LABEL_32;
        }
        if (v44 == 107)
        {
          v46 = v39;

          objc_msgSend(v38, "addObject:", v34);
          obj = v46;
          v27 = v38;
          v107 = v43;
          v105 = v41;
          v47 = 3;
LABEL_32:
          v106 = v47;
          goto LABEL_35;
        }
      }
      if (!os_variant_has_internal_diagnostics())
      {
        v49 = _MergedGlobals_1055;
        v30 = v37;
        if (!_MergedGlobals_1055)
        {
          v49 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v49, (unint64_t *)&_MergedGlobals_1055);
        }
        v50 = *(NSObject **)(v49 + 8);
        v31 = v111;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          v118 = v45;
          v119 = 2112;
          v120 = v100;
          v121 = 2112;
          v122 = v99;
          v123 = 2112;
          v124 = v98;
          _os_log_impl(&dword_185066000, v50, OS_LOG_TYPE_ERROR, "Internal UIKit inconsistency: found an unknown character (%C) in a date format. dateFormat: %@; calendar: %@; locale: %@",
            buf,
            0x26u);
        }
        v27 = v38;
        goto LABEL_37;
      }
      __UIFaultDebugAssertLog();
      v53 = objc_claimAutoreleasedReturnValue();
      v30 = v37;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109890;
        v118 = v45;
        v119 = 2112;
        v120 = v100;
        v121 = 2112;
        v122 = v99;
        v123 = 2112;
        v124 = v98;
        _os_log_fault_impl(&dword_185066000, v53, OS_LOG_TYPE_FAULT, "Internal UIKit inconsistency: found an unknown character (%C) in a date format. dateFormat: %@; calendar: %@; locale: %@",
          buf,
          0x26u);
      }

      v27 = v38;
LABEL_36:
      v31 = v111;
LABEL_37:

LABEL_38:
      ++v33;
    }
    while (v31 != v33);
    v54 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
    v31 = v54;
  }
  while (v54);
LABEL_46:

  objc_msgSend(v27, "firstObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v30);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "BOOLValue");

  if (v57)
  {
    objc_msgSend(v27, "firstObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    __121___UIDatePickerCalendarTimeFormat_initWithCalendar_locale_followsSystemHourCycle_forceDoubleDigitHours_displaysTimeZone___block_invoke(v58, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v96;
    if (v59)
    {
      objc_msgSend(v27, "replaceObjectAtIndex:withObject:", 0, v59);
      v96->_hasLeadingLiteral = 1;
    }
    else
    {
      objc_msgSend(v27, "removeObjectAtIndex:", 0);
    }
    v13 = v98;
    v12 = v99;
LABEL_54:

  }
  else
  {
    objc_msgSend(v27, "lastObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", v30);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");

    v13 = v98;
    v12 = v99;
    v14 = v96;
    if (v62)
    {
      objc_msgSend(v27, "lastObject");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      __121___UIDatePickerCalendarTimeFormat_initWithCalendar_locale_followsSystemHourCycle_forceDoubleDigitHours_displaysTimeZone___block_invoke(v63, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v27, "replaceObjectAtIndex:withObject:", objc_msgSend(v27, "count") - 1, v59);
        v96->_hasTrailingLiteral = 1;
      }
      else
      {
        objc_msgSend(v27, "removeLastObject");
      }
      goto LABEL_54;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3578], "_formatStringFromComponents:", v27, v91);
  v64 = objc_claimAutoreleasedReturnValue();
  timeFormat = v14->_timeFormat;
  v14->_timeFormat = (NSString *)v64;

  objc_storeStrong((id *)&v14->_hourFormat, obj);
  _UIDatePickerDateFormatFromTemplate(obj, v13, v93);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDateFormatStripOtherFormatCharacters(v66, objc_msgSend(obj, "characterAtIndex:", 0));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_msgSend(v67, "length");
  if (v68 > objc_msgSend(obj, "length"))
  {
    v69 = v14->_timeFormat;
    v70 = v67;
    -[NSString stringByReplacingOccurrencesOfString:withString:](v69, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), &stru_1E16EDF20);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), &stru_1E16EDF20);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = objc_msgSend(v71, "rangeOfString:", v72);
    if (v73 != 0x7FFFFFFFFFFFFFFFLL)
      objc_storeStrong((id *)&v14->_extendedHoursFormat, v67);
  }
  v74 = v106;
  if (v106 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", v92, v14, CFSTR("_UIDatePickerCalendarTimeFormat.m"), 244, CFSTR("Internal UIKit inconsistency: unable to find the clock format."));

    v74 = -1;
  }
  v75 = v105;
  if (v105 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", v92, v14, CFSTR("_UIDatePickerCalendarTimeFormat.m"), 245, CFSTR("Internal UIKit inconsistency: unable to find an hour format."));

    v75 = 0x7FFFFFFFFFFFFFFFLL;
    v74 = v106;
  }
  if (v102 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", v92, v14, CFSTR("_UIDatePickerCalendarTimeFormat.m"), 246, CFSTR("Internal UIKit inconsistency: unable to find a minute format."));

    v75 = v105;
    v74 = v106;
  }
  v76 = v97;
  if (v101 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14->_clockLayout = 0;
  }
  else
  {
    if (v101 >= v75)
      v77 = 1;
    else
      v77 = 2;
    v14->_clockLayout = v77;
  }
  v14->_wantsDoubleDigitHours = v107 > 1;
  v14->_forceDoubleDigitHours = v97;
  v14->_clock = v74;
  if (os_variant_has_internal_diagnostics())
  {
    if (v107 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      __UIFaultDebugAssertLog();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109890;
        v118 = v107;
        v119 = 2112;
        v120 = v100;
        v121 = 2112;
        v122 = v99;
        v123 = 2112;
        v124 = v98;
        _os_log_fault_impl(&dword_185066000, v88, OS_LOG_TYPE_FAULT, "Date format is reported with %d digits for the hour. We can't handle this. dateFormat: %@; calendar: %@; locale: %@",
          buf,
          0x26u);
      }

      v13 = v98;
      v12 = v99;
      v14 = v96;
      v76 = v97;
    }
  }
  else if (v107 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v89 = qword_1ECD7DD58;
    if (!qword_1ECD7DD58)
    {
      v89 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v89, (unint64_t *)&qword_1ECD7DD58);
    }
    v90 = *(NSObject **)(v89 + 8);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      v118 = v107;
      v119 = 2112;
      v120 = v100;
      v121 = 2112;
      v122 = v12;
      v123 = 2112;
      v124 = v13;
      _os_log_impl(&dword_185066000, v90, OS_LOG_TYPE_ERROR, "Date format is reported with %d digits for the hour. We can't handle this. dateFormat: %@; calendar: %@; locale: %@",
        buf,
        0x26u);
    }
  }
  v78 = (NSNumberFormatter *)objc_opt_new();
  -[NSNumberFormatter setLocale:](v78, "setLocale:", v13);
  -[NSNumberFormatter setMaximumFractionDigits:](v78, "setMaximumFractionDigits:", 0);
  -[NSNumberFormatter setMinimumIntegerDigits:](v78, "setMinimumIntegerDigits:", v107);
  objc_storeStrong((id *)&v14->_strictHourFormatter, v78);
  if (v76 && -[NSNumberFormatter minimumIntegerDigits](v78, "minimumIntegerDigits") <= 1)
  {
    v79 = (NSNumberFormatter *)-[NSNumberFormatter copy](v78, "copy");

    -[NSNumberFormatter setMinimumIntegerDigits:](v79, "setMinimumIntegerDigits:", 2);
    v78 = v79;
  }
  hourFormatter = v14->_hourFormatter;
  v14->_hourFormatter = v78;
  v81 = v78;

  v82 = (NSNumberFormatter *)objc_opt_new();
  -[NSNumberFormatter setLocale:](v82, "setLocale:", v13);
  -[NSNumberFormatter setMinimumIntegerDigits:](v82, "setMinimumIntegerDigits:", v103);
  -[NSNumberFormatter setMaximumFractionDigits:](v82, "setMaximumFractionDigits:", 0);
  minuteFormatter = v14->_minuteFormatter;
  v14->_minuteFormatter = v82;

LABEL_76:
  return v14;
}

- (id)localizedTimeStringWithHours:(unint64_t)a3 minutes:(unint64_t)a4 isPM:(BOOL)a5 ranges:(id *)a6
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  _UIDatePickerCalendarTimeFormat *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  void *v42;
  NSUInteger v43;
  NSUInteger v44;
  void *v45;
  NSString *hourFormat;
  NSString *v47;
  NSString *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  char v54;
  unint64_t i;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  NSUInteger v62;
  void *v64;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  NSUInteger v72;
  uint64_t v73;
  NSUInteger v74;
  uint64_t v76;
  NSUInteger v77;
  uint64_t v78;
  NSUInteger v79;
  _UIDatePickerCalendarTimeFormat *v80;
  void *v81;
  id obj;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = 0x1E0CB3000uLL;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3578], "_componentsFromFormatString:", self->_timeFormat);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (!v9)
  {
    v72 = 0;
    v39 = 0;
    v67 = 0x7FFFFFFFFFFFFFFFLL;
    v68 = 0;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_41;
  }
  v10 = v9;
  v78 = 0;
  v72 = 0;
  v68 = 0;
  v11 = *(_QWORD *)v84;
  v12 = *MEMORY[0x1E0C99730];
  v76 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = *MEMORY[0x1E0C99740];
  v73 = 0x7FFFFFFFFFFFFFFFLL;
  v67 = 0x7FFFFFFFFFFFFFFFLL;
  v80 = self;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v84 != v11)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v14);
      objc_msgSend(v15, "objectForKeyedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v15, "objectForKeyedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v8, "appendString:", v18);
        goto LABEL_21;
      }
      v20 = objc_msgSend(v18, "characterAtIndex:", 0);
      v21 = v20;
      if (v20 <= 103)
      {
        if (v20 == 72 || v20 == 75)
          goto LABEL_18;
        if (v20 != 97)
          goto LABEL_31;
        if (a5)
          -[_UIDatePickerCalendarTimeFormat PMSymbol](self, "PMSymbol");
        else
          -[_UIDatePickerCalendarTimeFormat AMSymbol](self, "AMSymbol");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v67 = objc_msgSend(v8, "length");
          v68 = objc_msgSend(v37, "length");
          objc_msgSend(v8, "appendString:", v37);
        }

      }
      else
      {
        if (v20 <= 108)
        {
          if (v20 == 104 || v20 == 107)
          {
LABEL_18:
            -[_UIDatePickerCalendarTimeFormat hourFormatter](self, "hourFormatter");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringFromNumber:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = objc_msgSend(v8, "length");
            v78 = objc_msgSend(v24, "length");
            objc_msgSend(v8, "appendString:", v24);
          }
          else
          {
LABEL_31:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v80, CFSTR("_UIDatePickerCalendarTimeFormat.m"), 335, CFSTR("Internal UIKit inconsistency: unknown character in format string: %C; dateFormat: %@"),
              v21,
              v80->_timeFormat);
          }

LABEL_20:
          self = v80;
          goto LABEL_21;
        }
        if (v20 == 109)
        {
          -[_UIDatePickerCalendarTimeFormat minuteFormatter](self, "minuteFormatter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringFromNumber:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          self = v80;
          v73 = objc_msgSend(v8, "length");
          v72 = objc_msgSend(v36, "length");
          objc_msgSend(v8, "appendString:", v36);

        }
        else
        {
          if (v20 != 122)
            goto LABEL_31;
          if (-[_UIDatePickerCalendarTimeFormat displaysTimeZone](self, "displaysTimeZone"))
          {
            -[_UIDatePickerCalendarTimeFormat timeZone](self, "timeZone");
            v25 = self;
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              -[_UIDatePickerCalendarTimeFormat timeZone](v25, "timeZone");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIDatePickerCalendarTimeFormat timeZoneReferenceDate](v25, "timeZoneReferenceDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v27, "isDaylightSavingTimeForDate:", v28);
              v30 = 3;
              if (!v29)
                v30 = 1;
              v66 = v30;

              -[_UIDatePickerCalendarTimeFormat timeZone](v25, "timeZone");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIDatePickerCalendarTimeFormat locale](v25, "locale");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "localizedName:locale:", v66, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v8, "appendString:", v33);
              goto LABEL_20;
            }
            self = v25;
          }
        }
      }
LABEL_21:

      ++v14;
    }
    while (v10 != v14);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    v10 = v38;
  }
  while (v38);
  v40 = v76;
  v39 = v78;
  v41 = v73;
  v7 = 0x1E0CB3000;
  if (v76 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarTimeFormat.m"), 340, CFSTR("Internal UIKit inconsistency: unable to replace hour."));

    v40 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarTimeFormat.m"), 341, CFSTR("Internal UIKit inconsistency: unable to replace minutes."));

  }
  v43 = v40;
  v44 = v39;
  if (self->_extendedHoursFormat)
  {
    v74 = v41;
    v77 = v40;
    v79 = v39;
    objc_msgSend(v8, "substringWithRange:", v40, v39);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    hourFormat = self->_hourFormat;
    v47 = self->_extendedHoursFormat;
    v48 = hourFormat;
    v49 = v45;
    v50 = -[NSString length](v47, "length");
    v81 = v49;
    v51 = objc_msgSend(v49, "length");
    v52 = v51 - -[NSString length](v48, "length") + v50;
    objc_msgSend(*(id *)(v7 + 1952), "stringWithCapacity:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v54 = 0;
      for (i = 0; i < v52; ++i)
      {
        v56 = -[NSString characterAtIndex:](v47, "characterAtIndex:", i);
        if ((_DWORD)v56 == 39)
        {
          v54 ^= 1u;
        }
        else
        {
          v57 = v56;
          if ((v54 & 1) != 0
            || (-[NSString substringWithRange:](v47, "substringWithRange:", i, -[NSString length](v48, "length")),
                v58 = (void *)objc_claimAutoreleasedReturnValue(),
                v59 = -[NSString isEqual:](v48, "isEqual:", v58),
                v58,
                !v59))
          {
            objc_msgSend(v53, "appendFormat:", CFSTR("%C"), v57);
          }
          else
          {
            objc_msgSend(v53, "appendString:", v81);
            v60 = objc_msgSend(v81, "length");
            v54 = 0;
            i = v60 + i - -[NSString length](v48, "length");
          }
        }
      }
    }

    v61 = objc_msgSend(v8, "rangeOfString:", v53);
    v40 = v77;
    v39 = v79;
    if (v61 == 0x7FFFFFFFFFFFFFFFLL)
      v43 = v77;
    else
      v43 = v61;
    if (v61 == 0x7FFFFFFFFFFFFFFFLL)
      v44 = v79;
    else
      v44 = v62;

    v41 = v74;
  }
  if (a6)
  {
    a6->var0.location = v40;
    a6->var0.length = v39;
    a6->var1.location = v41;
    a6->var1.length = v72;
    a6->var2.location = v67;
    a6->var2.length = v68;
    a6->var3.location = v43;
    a6->var3.length = v44;
  }

  return v8;
}

- (id)localizedTimeStringWithHours:(unint64_t)a3 minutes:(unint64_t)a4 isPM:(BOOL)a5
{
  return -[_UIDatePickerCalendarTimeFormat localizedTimeStringWithHours:minutes:isPM:ranges:](self, "localizedTimeStringWithHours:minutes:isPM:ranges:", a3, a4, a5, 0);
}

- (id)withForceDoubleDigitHours:(BOOL)a3
{
  _BOOL4 v3;
  _UIDatePickerCalendarTimeFormat *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  if (-[_UIDatePickerCalendarTimeFormat forceDoubleDigitHours](self, "forceDoubleDigitHours") == a3)
  {
    v5 = self;
  }
  else
  {
    v5 = (_UIDatePickerCalendarTimeFormat *)-[_UIDatePickerCalendarTimeFormat copy](self, "copy");
    v5->_forceDoubleDigitHours = v3;
    -[_UIDatePickerCalendarTimeFormat strictHourFormatter](v5, "strictHourFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "minimumIntegerDigits");
    if (!v3)
    {
      -[_UIDatePickerCalendarTimeFormat hourFormatter](v5, "hourFormatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMinimumIntegerDigits:", v7);

      goto LABEL_7;
    }

    if (v7 <= 1)
    {
      -[_UIDatePickerCalendarTimeFormat hourFormatter](v5, "hourFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMinimumIntegerDigits:", 2);
LABEL_7:

    }
  }
  return v5;
}

- (id)withDisplaysTimeZone:(BOOL)a3
{
  _UIDatePickerCalendarTimeFormat *v5;

  if (-[_UIDatePickerCalendarTimeFormat displaysTimeZone](self, "displaysTimeZone") == a3)
  {
    v5 = self;
  }
  else
  {
    v5 = (_UIDatePickerCalendarTimeFormat *)-[_UIDatePickerCalendarTimeFormat copy](self, "copy");
    v5->_displaysTimeZone = a3;
  }
  return v5;
}

- (id)withTimeZone:(id)a3
{
  id v5;
  void *v6;
  char v7;
  _UIDatePickerCalendarTimeFormat *v8;

  v5 = a3;
  -[_UIDatePickerCalendarTimeFormat timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = self;
  }
  else
  {
    v8 = (_UIDatePickerCalendarTimeFormat *)-[_UIDatePickerCalendarTimeFormat copy](self, "copy");
    objc_storeStrong((id *)&v8->_timeZone, a3);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  objc_opt_class();
  v4 = objc_opt_new();
  -[_UIDatePickerCalendarTimeFormat timeFormat](self, "timeFormat");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  -[_UIDatePickerCalendarTimeFormat hourFormat](self, "hourFormat");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  -[_UIDatePickerCalendarTimeFormat AMSymbol](self, "AMSymbol");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  -[_UIDatePickerCalendarTimeFormat PMSymbol](self, "PMSymbol");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  *(_BYTE *)(v4 + 8) = -[_UIDatePickerCalendarTimeFormat wantsDoubleDigitHours](self, "wantsDoubleDigitHours");
  *(_BYTE *)(v4 + 9) = -[_UIDatePickerCalendarTimeFormat forceDoubleDigitHours](self, "forceDoubleDigitHours");
  *(_QWORD *)(v4 + 48) = -[_UIDatePickerCalendarTimeFormat clock](self, "clock");
  *(_QWORD *)(v4 + 56) = -[_UIDatePickerCalendarTimeFormat clockLayout](self, "clockLayout");
  *(_BYTE *)(v4 + 10) = -[_UIDatePickerCalendarTimeFormat hasLeadingLiteral](self, "hasLeadingLiteral");
  *(_BYTE *)(v4 + 11) = -[_UIDatePickerCalendarTimeFormat hasTrailingLiteral](self, "hasTrailingLiteral");
  -[_UIDatePickerCalendarTimeFormat hourFormatter](self, "hourFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  v15 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v14;

  -[_UIDatePickerCalendarTimeFormat minuteFormatter](self, "minuteFormatter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  v18 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v17;

  -[_UIDatePickerCalendarTimeFormat strictHourFormatter](self, "strictHourFormatter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");
  v21 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v20;

  -[_UIDatePickerCalendarTimeFormat timeZone](self, "timeZone");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v22;

  -[_UIDatePickerCalendarTimeFormat locale](self, "locale");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v24;

  *(_BYTE *)(v4 + 12) = -[_UIDatePickerCalendarTimeFormat displaysTimeZone](self, "displaysTimeZone");
  *(_QWORD *)(v4 + 96) = -[_UIDatePickerCalendarTimeFormat timeZoneReferenceDate](self, "timeZoneReferenceDate");
  -[_UIDatePickerCalendarTimeFormat extendedHoursFormat](self, "extendedHoursFormat");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v26;

  return (id)v4;
}

- (NSString)timeFormat
{
  return self->_timeFormat;
}

- (NSString)hourFormat
{
  return self->_hourFormat;
}

- (NSString)AMSymbol
{
  return self->_AMSymbol;
}

- (NSString)PMSymbol
{
  return self->_PMSymbol;
}

- (BOOL)wantsDoubleDigitHours
{
  return self->_wantsDoubleDigitHours;
}

- (BOOL)forceDoubleDigitHours
{
  return self->_forceDoubleDigitHours;
}

- (int64_t)clock
{
  return self->_clock;
}

- (int64_t)clockLayout
{
  return self->_clockLayout;
}

- (BOOL)hasLeadingLiteral
{
  return self->_hasLeadingLiteral;
}

- (BOOL)hasTrailingLiteral
{
  return self->_hasTrailingLiteral;
}

- (NSNumberFormatter)hourFormatter
{
  return self->_hourFormatter;
}

- (NSNumberFormatter)minuteFormatter
{
  return self->_minuteFormatter;
}

- (NSString)extendedHoursFormat
{
  return self->_extendedHoursFormat;
}

- (NSNumberFormatter)strictHourFormatter
{
  return self->_strictHourFormatter;
}

- (NSDate)timeZoneReferenceDate
{
  return self->_timeZoneReferenceDate;
}

- (void)setTimeZoneReferenceDate:(id)a3
{
  self->_timeZoneReferenceDate = (NSDate *)a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)displaysTimeZone
{
  return self->_displaysTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_strictHourFormatter, 0);
  objc_storeStrong((id *)&self->_extendedHoursFormat, 0);
  objc_storeStrong((id *)&self->_minuteFormatter, 0);
  objc_storeStrong((id *)&self->_hourFormatter, 0);
  objc_storeStrong((id *)&self->_PMSymbol, 0);
  objc_storeStrong((id *)&self->_AMSymbol, 0);
  objc_storeStrong((id *)&self->_hourFormat, 0);
  objc_storeStrong((id *)&self->_timeFormat, 0);
}

@end
