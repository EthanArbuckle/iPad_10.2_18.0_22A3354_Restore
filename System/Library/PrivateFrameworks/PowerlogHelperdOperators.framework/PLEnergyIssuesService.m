@implementation PLEnergyIssuesService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEnergyIssuesService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitionEnergySignatures
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionHighPowerDetection
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLEnergyIssuesService)init
{
  PLEnergyIssuesService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLEnergyIssuesService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLEnergyIssuesService setAssertionThresholds](self, "setAssertionThresholds");
    -[PLEnergyIssuesService initializeSafeguardsSystem](self, "initializeSafeguardsSystem");
  }
}

- (__CFDictionary)createAssertionThreshold:(int)a3 withAggregateLimit:(int)a4
{
  const __CFAllocator *v6;
  __CFDictionary *Mutable;
  CFNumberRef v8;
  CFNumberRef v9;
  int v11;
  int valuePtr;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = a3;
  v8 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  v11 = a4;
  v9 = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CFDictionarySetValue(Mutable, CFSTR("Asssertion Duration Limit"), v8);
  CFDictionarySetValue(Mutable, CFSTR("Aggregate Assertion Limit"), v9);
  CFRelease(v8);
  CFRelease(v9);
  return Mutable;
}

- (void)setAssertionThresholds
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setAssertionThresholds_classDebugEnabled = result;
  return result;
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setAssertionThresholds_classDebugEnabled_83 = result;
  return result;
}

- (void)handleAssertionNotifications
{
  dispatch_queue_t v2;

  v2 = dispatch_queue_create("PM test queue", 0);
  IOPMScheduleAssertionExceptionNotification();

}

void __53__PLEnergyIssuesService_handleAssertionNotifications__block_invoke()
{
  NSLog(CFSTR("AssertionException Created"));
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("UrsaDefinition");
  objc_msgSend(a1, "entryEventIntervalDefinitionsUrsaIssues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventIntervalDefinitionsUrsaIssues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[9];
  _QWORD v25[9];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v26 = *MEMORY[0x1E0D80318];
  v27 = &unk_1EA1DA688;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("radar");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("impact");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("timestampStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("hitIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v24[5] = CFSTR("fixedIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("isCritical");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("timestampInvalid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("driMessage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    return MEMORY[0x1E0C9AA70];
  v7[0] = CFSTR("UrsaSummary");
  objc_msgSend(a1, "entryEventPointDefinitionUrsaSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("UrsaInteraction");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventPointDefinitionUrsaInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventPointDefinitionUrsaSummary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DA698;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("requestId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("countBui");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("countNotification");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionUrsaInteraction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DA698;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("radar");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)createIssueEntriesFrom:(id)a3 forKey:(id)a4 now:(id)a5 midnight:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  uint64_t v59;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v64 = a4;
  v65 = a5;
  v62 = a6;
  if (v9)
  {
    PLLogUrsa();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v9;
      _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_DEFAULT, "CloudKit function connected successfully: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v61 = v9;
    v11 = v9;
    v68 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v68)
    {
      v12 = CFSTR("radar");
      v67 = *(_QWORD *)v77;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v77 != v67)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v13);
          objc_msgSend(v14, "objectForKeyedSubscript:", v12, v61);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("impact"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampStart"));
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hitIn"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("fixedIn"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("isCritical"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampInvalid"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("driMessage"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("notificationMessage"));
          v19 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v17;
          v70 = (void *)v19;
          if (!v15 || !v16 || !v17 || !v74 || !v73 || !v72 || !v18 || !v71 || !v75 || !v19)
          {
            PLLogUrsa();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              goto LABEL_32;
            *(_DWORD *)buf = 138412290;
            v82 = v14;
            v41 = v32;
            v42 = "Insufficient information for issue. Given information: %@";
            goto LABEL_51;
          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v15;
          if (v15 == (void *)v20)
            goto LABEL_30;
          v22 = (void *)v20;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v18;
          if (v18 == (void *)v23)
            goto LABEL_29;
          v25 = (void *)v23;
          v66 = v16;
          v26 = v12;
          v27 = v11;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v28 = objc_claimAutoreleasedReturnValue();
          if (v75 == (void *)v28)
          {

            v24 = v25;
            v12 = v26;
LABEL_29:

            v21 = v22;
LABEL_30:

LABEL_31:
            PLLogUrsa();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              goto LABEL_32;
            *(_DWORD *)buf = 138412290;
            v82 = v14;
            v41 = v32;
            v42 = "Null data found in issue: %@";
LABEL_51:
            _os_log_error_impl(&dword_1DA9D6000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);
            goto LABEL_32;
          }
          v29 = (void *)v28;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v70 == v30;
          v11 = v27;
          v12 = v26;
          v16 = v66;
          if (v31)
            goto LABEL_31;
          v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v64, v65);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "unsignedIntValue"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v33, v26);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v18, "BOOLValue"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v34, CFSTR("isCritical"));

          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v75, CFSTR("driMessage"));
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v70, CFSTR("notificationMessage"));
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71 == v35)
          {
            v37 = 0.0;
            v38 = v74;
LABEL_35:
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v62, CFSTR("timestampInvalid"));
            v40 = 0;
            goto LABEL_36;
          }
          objc_msgSend(v71, "doubleValue");
          v37 = v36;
          v38 = v74;
          if (v36 == 0.0)
            goto LABEL_35;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v39, CFSTR("timestampInvalid"));

          v40 = 1;
LABEL_36:
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66 != v43)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v66, "unsignedIntValue"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v44, CFSTR("impact"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69 != v45)
          {
            v46 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v69, "doubleValue");
            objc_msgSend(v46, "numberWithDouble:");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v47, CFSTR("timestampStart"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38 != v48)
          {
            v49 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v38, "doubleValue");
            objc_msgSend(v49, "numberWithDouble:");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v50, CFSTR("timestampEnd"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73 != v51)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v52, CFSTR("hitIn"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72 != v53)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v54, CFSTR("fixedIn"));

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v37);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55;
          if (!v40
            || (objc_msgSend(v55, "laterDate:", v65),
                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                v58 = objc_msgSend(v57, "isEqualToDate:", v65),
                v57,
                (v58 & 1) == 0))
          {
            objc_msgSend(v63, "addObject:", v32);
          }

          v16 = v66;
LABEL_32:

          ++v13;
        }
        while (v68 != v13);
        v59 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        v68 = v59;
      }
      while (v59);
    }

    v9 = v61;
  }
  else
  {
    v63 = 0;
  }

  return v63;
}

- (void)initializeSafeguardsSystem
{
  CSDaemon *v3;
  CSDaemon *safeguardsDaemon;
  PLStateTrackingComposition *v5;
  PLStateTrackingComposition *stateTrackerForSafeguards;
  PLStateTrackingComposition *v7;
  uint64_t v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0)
  {
    initComputeSafeguards();
    v3 = (CSDaemon *)objc_claimAutoreleasedReturnValue();
    safeguardsDaemon = self->_safeguardsDaemon;
    self->_safeguardsDaemon = v3;

    objc_msgSend(MEMORY[0x1E0D80038], "sharedInstance");
    v5 = (PLStateTrackingComposition *)objc_claimAutoreleasedReturnValue();
    stateTrackerForSafeguards = self->_stateTrackerForSafeguards;
    self->_stateTrackerForSafeguards = v5;

    v7 = self->_stateTrackerForSafeguards;
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke;
    v11[3] = &unk_1EA16D040;
    v11[4] = self;
    -[PLStateTrackingComposition registerForStates:withOperator:withBlock:](v7, "registerForStates:withOperator:withBlock:", 5, self, v11);
    v9 = dispatch_time(0, 5000000000);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2;
    v10[3] = &unk_1EA16D040;
    v10[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);
  }
}

uint64_t __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStateChangeForSafeguards");
}

uint64_t __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateDisplayState");
  return objc_msgSend(*(id *)(a1 + 32), "updatePluggedInState");
}

- (void)handleStateChangeForSafeguards
{
  if (-[PLStateTrackingComposition stateChanged:](self->_stateTrackerForSafeguards, "stateChanged:", 4))
    -[PLEnergyIssuesService updateDisplayState](self, "updateDisplayState");
  if (-[PLStateTrackingComposition stateChanged:](self->_stateTrackerForSafeguards, "stateChanged:", 1))
    -[PLEnergyIssuesService updatePluggedInState](self, "updatePluggedInState");
}

- (void)updateDisplayState
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "Display state has changed to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updatePluggedInState
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "PluggedIn state has changed to: %d", (uint8_t *)v2, 8u);
}

- (PLXPCListenerOperatorComposition)eventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)xpcListenerEnergyIssueTrigger
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcListenerEnergyIssueTrigger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLStateTrackingComposition)stateTrackerForSafeguards
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateTrackerForSafeguards:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CSDaemon)safeguardsDaemon
{
  return (CSDaemon *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSafeguardsDaemon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeguardsDaemon, 0);
  objc_storeStrong((id *)&self->_stateTrackerForSafeguards, 0);
  objc_storeStrong((id *)&self->_xpcListenerEnergyIssueTrigger, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
}

@end
