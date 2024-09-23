@implementation QPDataDetectorsParser

- (void)enumerateDatesInString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  __CFCalendar *v10;
  __CFCalendar *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int HasType;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int v46;
  void *v47;
  double v48;
  uint64_t v49;
  double v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void (**v81)(id, void *, uint64_t, uint64_t, char *);
  id v82;
  id v83;
  void *v84;
  id v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  id v89;
  id v90;
  uint64_t i;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CFAbsoluteTime at;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  id v104;
  char v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  char v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  _QWORD v116[4];
  _QWORD v117[4];
  uint8_t v118[4];
  uint64_t v119;
  _QWORD v120[4];
  _QWORD v121[4];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v79 = a3;
  v7 = a4;
  v81 = (void (**)(id, void *, uint64_t, uint64_t, char *))a5;
  v80 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", kQPQueryParserOptionReferenceCalendarKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (__CFCalendar *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v7, "objectForKeyedSubscript:", kQPQueryParserOptionLocaleKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v78 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v78 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", kQPQueryParserOptionReferenceDateKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v89 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v89 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", kQPQueryParserOptionIgnoreFutureDatesKey);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = (void *)MEMORY[0x24BDBD1C0];
  if (v16)
    v19 = (void *)v16;
  else
    v19 = (void *)MEMORY[0x24BDBD1C0];
  v85 = v19;

  objc_msgSend(v80, "objectForKeyedSubscript:", kQPQueryParserOptionIgnorePastDatesKey);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v18;
  v76 = v22;

  objc_msgSend(v80, "objectForKeyedSubscript:", kQPQueryParserOptionResolveDatesInFutureKey);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (void *)v23;
  else
    v25 = v18;
  v82 = v25;

  objc_msgSend(v80, "objectForKeyedSubscript:", kQPQueryParserOptionResolveDatesInPastKey);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (void *)v26;
  else
    v28 = v18;
  v83 = v28;

  v29 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v29, "setCalendar:", v11);
  objc_msgSend(v29, "setLocale:", v78);
  v115 = -1;
  v114 = -1;
  v113 = -1;
  v112 = -1;
  v111 = -1;
  v30 = MEMORY[0x219A2446C](v89);
  CFCalendarDecomposeAbsoluteTime(v11, v30, "dMyEw", &v115, &v114, &v113, &v112, &v111);
  v110 = 0;
  v84 = v29;
  objc_msgSend(MEMORY[0x24BE2B370], "scanString:", v79);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v77, "count"))
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    obj = v77;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
    if (!v31)
      goto LABEL_99;
    v88 = v31;
    v87 = *(_QWORD *)v107;
    while (1)
    {
      for (i = 0; i != v88; ++i)
      {
        if (*(_QWORD *)v107 != v87)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        v105 = 0;
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0;
        v92 = v32;
        objc_msgSend(v32, "dateFromReferenceDate:referenceTimezone:timezoneRef:allDayRef:", v89, v33, &v104, &v105);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v104;

        if (v93)
        {
          objc_msgSend(v32, "coreResult");
          HasType = DDResultHasType();
          objc_msgSend(v32, "coreResult");
          if ((DDResultHasType() & 1) == 0)
          {
            objc_msgSend(v32, "coreResult");
            if ((HasType | DDResultHasType()) != 1)
              goto LABEL_48;
          }
          v103 = -1;
          v102 = -1;
          v101 = -1;
          v100 = -1;
          v99 = -1;
          at = 0.0;
          at = MEMORY[0x219A2446C](v93);
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          objc_msgSend(v32, "subResults");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v122, 16);
          if (!v36)
            goto LABEL_44;
          v37 = *(_QWORD *)v95;
          while (1)
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v95 != v37)
                objc_enumerationMutation(v35);
              v39 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
              objc_msgSend(v39, "type");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("RelativeDayOfWeek"));

              if (v41)
              {
                CFCalendarDecomposeAbsoluteTime(v11, at, "E", &v100);
                continue;
              }
              objc_msgSend(v39, "type");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v42, "isEqualToString:", CFSTR("RelativeDay")))
              {

              }
              else
              {
                objc_msgSend(v39, "type");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("AbsoluteDate"));

                if (!v44)
                  continue;
              }
              CFCalendarDecomposeAbsoluteTime(v11, at, "dMy", &v103, &v102, &v101);
            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v122, 16);
            if (!v36)
            {
LABEL_44:

              v45 = objc_msgSend(v85, "BOOLValue");
              if (at > v30)
                v46 = v45;
              else
                v46 = 0;
              if (v46 == 1)
              {
LABEL_48:
                v47 = v93;
                goto LABEL_85;
              }
              if (objc_msgSend(v83, "BOOLValue", at) && (v48 = at, at > v30))
              {
                if (v100 != -1)
                {
                  if (v99 != -1)
                  {
                    v49 = 0xFFFFFFFFLL;
                    goto LABEL_60;
                  }
                  CFCalendarDecomposeAbsoluteTime(v11, at, "wY", &v99, &v101);
                  CFCalendarComposeAbsoluteTime(v11, &at, "wY", v99 - 1, v101);
LABEL_65:
                  CFCalendarAddComponents(v11, &at, 0, "E", v50, v100 - 1);
                  goto LABEL_66;
                }
                if (v101 != -1)
                {
                  CFCalendarAddComponents(v11, &at, 0, "y", at, 0xFFFFFFFFLL);
                  CFCalendarDecomposeAbsoluteTime(v11, at, "Y", &v101);
                }
              }
              else if (objc_msgSend(v82, "BOOLValue", v48))
              {
                v48 = at;
                if (at < v30 && v100 != -1)
                {
                  if (v99 == -1)
                  {
                    CFCalendarDecomposeAbsoluteTime(v11, at, "wY", &v99, &v101);
                    CFCalendarComposeAbsoluteTime(v11, &at, "wY", v99 + 1, v101);
                    goto LABEL_65;
                  }
                  v49 = 1;
LABEL_60:
                  CFCalendarAddComponents(v11, &at, 0, "d", v48, v49);
LABEL_66:
                  CFCalendarDecomposeAbsoluteTime(v11, at, "wEY", &v99, &v100, &v101);
                }
              }
              v51 = objc_alloc_init(MEMORY[0x24BDBCE68]);
              v52 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              if (v99 == -1)
              {
                if (v103 != -1)
                {
                  objc_msgSend(v51, "setDay:");
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v103);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKey:", v56, CFSTR("d"));

                }
                if (v102 != -1)
                {
                  objc_msgSend(v51, "setMonth:");
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v102);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKey:", v57, CFSTR("M"));

                }
                if (v101 != -1)
                {
                  objc_msgSend(v51, "setYear:");
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v101);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKey:", v55, CFSTR("y"));
LABEL_76:

                }
              }
              else
              {
                objc_msgSend(v51, "setWeekOfYear:");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v99);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKey:", v53, CFSTR("w"));

                objc_msgSend(v51, "setYearForWeekOfYear:", (int)v101);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v101);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKey:", v54, CFSTR("Y"));

                if (v100 != -1)
                {
                  objc_msgSend(v51, "setWeekday:");
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v100);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKey:", v55, CFSTR("E"));
                  goto LABEL_76;
                }
              }
              if (!objc_msgSend(v52, "count"))
              {
                v47 = v93;
LABEL_84:

                goto LABEL_85;
              }
              -[__CFCalendar dateFromComponents:](v11, "dateFromComponents:", v51);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v84, "setDateStyle:", 4);
              objc_msgSend(v84, "setTimeStyle:", 0);
              objc_msgSend(v84, "stringFromDate:", v47);
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = (void *)v58;
              if (!v58)
                goto LABEL_82;
              v120[0] = kQPParseAttributeValueDateDisplayKey;
              v120[1] = kQPParseAttributeValueDateComponentsKey;
              v121[0] = v58;
              v121[1] = v52;
              v120[2] = kQPParseAttributeValueDateTypeKey;
              v120[3] = kQPParseAttributeValueDateTemporalModifierKey;
              v121[2] = &unk_24DA339E0;
              v121[3] = &unk_24DA339F8;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 4);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                -[QPDataDetectorsParser enumerateDatesInString:options:withBlock:].cold.2(v118, objc_msgSend(obj, "count"), &v119);
              v61 = objc_msgSend(v92, "range");
              v81[2](v81, v60, v61, v62, &v110);
              v63 = v110 == 0;

              if (v63)
              {
LABEL_82:

                goto LABEL_84;
              }

LABEL_99:
              goto LABEL_100;
            }
          }
        }
        v47 = 0;
LABEL_85:

      }
      v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
      if (!v88)
        goto LABEL_99;
    }
  }
  if (objc_msgSend(v79, "length") == 4)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringByTrimmingCharactersInSet:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "length") == 0;

    if (v66)
    {
      v67 = objc_msgSend(v79, "integerValue");
      if (v67 >= 1971)
      {
        obj = objc_alloc_init(MEMORY[0x24BDBCE68]);
        objc_msgSend(obj, "setYear:", v67);
        v68 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:forKey:", v69, CFSTR("y"));

        if (objc_msgSend(v68, "count"))
        {
          -[__CFCalendar dateFromComponents:](v11, "dateFromComponents:", obj);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setDateStyle:", 4);
          objc_msgSend(v84, "setTimeStyle:", 0);
          objc_msgSend(v84, "stringFromDate:", v70);
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v71;
          if (v71)
          {
            v116[0] = kQPParseAttributeValueDateDisplayKey;
            v116[1] = kQPParseAttributeValueDateComponentsKey;
            v117[0] = v71;
            v117[1] = v68;
            v116[2] = kQPParseAttributeValueDateTypeKey;
            v116[3] = kQPParseAttributeValueDateTemporalModifierKey;
            v117[2] = &unk_24DA339E0;
            v117[3] = &unk_24DA339F8;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 4);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            {
              v74 = objc_msgSend(v77, "count");
              -[QPDataDetectorsParser enumerateDatesInString:options:withBlock:].cold.1((uint64_t)v118, v74, v75);
            }
            v81[2](v81, v73, 0, objc_msgSend(v79, "length"), &v110);

          }
        }

        goto LABEL_99;
      }
    }
  }
LABEL_100:

}

- (void)enumerateDatesInString:(uint64_t)a1 options:(uint64_t)a2 withBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_218E10000, MEMORY[0x24BDACB70], a3, "QueryParserManager: fallback date found: %lu", (uint8_t *)a1);
}

- (void)enumerateDatesInString:(uint8_t *)a1 options:(uint64_t)a2 withBlock:(_QWORD *)a3 .cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a3 = a2;
  OUTLINED_FUNCTION_0(&dword_218E10000, MEMORY[0x24BDACB70], (uint64_t)a3, "QueryParserManager: fallback date found: %lu", a1);
}

@end
