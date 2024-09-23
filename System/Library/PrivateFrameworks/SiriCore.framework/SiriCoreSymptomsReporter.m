@implementation SiriCoreSymptomsReporter

- (void)_getTypeForError:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _BOOL8, _QWORD);
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = (void (**)(id, _BOOL8, _QWORD))a4;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "code");
  v9 = 0;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE09488]))
  {
    if (v8 > 199)
    {
      if ((unint64_t)(v8 - 200) <= 0x16)
      {
        if (((1 << (v8 + 56)) & 0x700327) != 0)
          goto LABEL_13;
        if (v8 == 203)
        {
          objc_msgSend(v5, "userInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDD1398]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "domain");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE09018]);

          v9 = 0;
          if (v13)
          {
            v14 = objc_msgSend(v11, "code");
            if (v14 == 1 || v14 == 201 || v14 == 102)
              v9 = 1;
          }

          goto LABEL_14;
        }
      }
      if (v8 != 1107 && v8 != 1101)
        goto LABEL_14;
LABEL_13:
      v9 = 1;
      goto LABEL_14;
    }
    if ((unint64_t)v8 <= 0x16 && ((1 << v8) & 0x4000B6) != 0)
      goto LABEL_13;
  }
LABEL_14:
  v15 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  AFErrorEnumerate();
  if (v6)
  {
    if (objc_msgSend(v15, "length"))
      v16 = v15;
    else
      v16 = 0;
    ((void (**)(id, _BOOL8, id))v6)[2](v6, v9, v16);
  }

}

- (id)_processNameForPid:(int)a3
{
  int v4;
  id v5;
  void *v6;
  uint64_t v8;
  __int128 buffer;
  _OWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  buffer = 0u;
  memset(v10, 0, sizeof(v10));
  v4 = proc_pidinfo(a3, 13, 1uLL, &buffer, 64);
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v4 < 1)
    v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("pid(%ld)"), a3, v8);
  else
    v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%.*s"), 16, v10);
  return v6;
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7 triggerForIDSIdentifiers:(id)a8
{
  -[SiriCoreSymptomsReporter reportIssueForError:type:subtype:context:processIdentifier:walkboutStatus:triggerForIDSIdentifiers:](self, "reportIssueForError:type:subtype:context:processIdentifier:walkboutStatus:triggerForIDSIdentifiers:", a3, a4, 0, a5, *(_QWORD *)&a6, a7, a8);
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6 processIdentifier:(int)a7 walkboutStatus:(BOOL)a8 triggerForIDSIdentifiers:(id)a9
{
  _BOOL8 v9;
  uint64_t v10;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;

  v9 = a8;
  v10 = *(_QWORD *)&a7;
  v16 = (void *)MEMORY[0x24BE09270];
  v17 = a9;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v16, "sharedPreferences");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v22, "includeProbePacketCaptureForABC");
  -[SiriCoreSymptomsReporter reportIssueForError:type:subtype:context:processIdentifier:walkboutStatus:triggerForIDSIdentifiers:withPcap:](self, "reportIssueForError:type:subtype:context:processIdentifier:walkboutStatus:triggerForIDSIdentifiers:withPcap:", v20, a4, v19, v18, v10, v9, v17, v21);

}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6 processIdentifier:(int)a7 walkboutStatus:(BOOL)a8 triggerForIDSIdentifiers:(id)a9 withPcap:(BOOL)a10
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  BOOL v36;

  v11 = *(_QWORD *)&a7;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v18 = a3;
  AFAnalyticsEventTypeGetName();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSymptomsReporter _processNameForPid:](self, "_processNameForPid:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3478]), "initWithQueue:", 0);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __136__SiriCoreSymptomsReporter_reportIssueForError_type_subtype_context_processIdentifier_walkboutStatus_triggerForIDSIdentifiers_withPcap___block_invoke;
  v28[3] = &unk_24CCE65C0;
  v35 = a8;
  v29 = v19;
  v30 = v21;
  v31 = v15;
  v32 = v20;
  v36 = a10;
  v33 = v17;
  v34 = v16;
  v22 = v16;
  v23 = v17;
  v24 = v20;
  v25 = v15;
  v26 = v21;
  v27 = v19;
  -[SiriCoreSymptomsReporter _getTypeForError:completion:](self, "_getTypeForError:completion:", v18, v28);

}

- (id)_subtypeContextStringFromContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__SiriCoreSymptomsReporter__subtypeContextStringFromContext___block_invoke_2;
    v11[3] = &unk_24CCE6628;
    v12 = v3;
    v7 = v4;
    v13 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
    v8 = v13;
    v9 = (__CFString *)v7;

  }
  else
  {
    v9 = &stru_24CCE7768;
  }

  return v9;
}

- (void)reportIssueForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v12 = (void *)MEMORY[0x24BE09270];
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "sharedPreferences");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSymptomsReporter reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:](self, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:withPcap:", v15, v14, v13, v8, v7, objc_msgSend(v16, "includeProbePacketCaptureForABC"));

}

- (void)reportIssueForType:(id)a3 subType:(id)a4 context:(id)a5 processIdentifier:(int)a6 walkboutStatus:(BOOL)a7 withPcap:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v8 = a8;
  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[SiriCoreSymptomsReporter _processNameForPid:](self, "_processNameForPid:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v18 = CFSTR("_Carry");
  else
    v18 = CFSTR("_NonCarry");
  objc_msgSend(v15, "stringByAppendingString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3478]), "initWithQueue:", 0);
  -[SiriCoreSymptomsReporter _subtypeContextStringFromContext:](self, "_subtypeContextStringFromContext:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("SiriAssistant"), v16, v19, v21, v17, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  if (v8)
  {
    v27 = *MEMORY[0x24BEB3498];
    v25 = *MEMORY[0x24BEB3490];
    v26 = &unk_24CCF54B0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v20, "snapshotWithSignature:duration:events:payload:actions:reply:", v22, 0, v14, v23, 0, 120.0);

}

void __61__SiriCoreSymptomsReporter__subtypeContextStringFromContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v11, "description");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3)
    v10 = CFSTR(", %@: %@");
  else
    v10 = CFSTR("%@: %@");
  objc_msgSend(v7, "appendFormat:", v10, v6, v8);

}

uint64_t __61__SiriCoreSymptomsReporter__subtypeContextStringFromContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 512);
}

void __136__SiriCoreSymptomsReporter_reportIssueForError_type_subtype_context_processIdentifier_walkboutStatus_triggerForIDSIdentifiers_withPcap___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Not ";
    v8 = *(_QWORD *)(a1 + 32);
    v19 = "-[SiriCoreSymptomsReporter reportIssueForError:type:subtype:context:processIdentifier:walkboutStatus:triggerFo"
          "rIDSIdentifiers:withPcap:]_block_invoke";
    v20 = 2080;
    *(_DWORD *)buf = 136315906;
    if (a2)
      v7 = "";
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_DEFAULT, "%s %sReporting error with signature %@ %@", buf, 0x2Au);
  }
  if (a2)
  {
    if ((AFIsHorseman() & 1) != 0 || AFIsNano())
    {
      if (*(_BYTE *)(a1 + 80))
        v9 = CFSTR("_Carry");
      else
        v9 = CFSTR("_NonCarry");
      objc_msgSend(v5, "stringByAppendingString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }
    objc_msgSend(*(id *)(a1 + 40), "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("SiriAssistant"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 81))
    {
      v16 = *MEMORY[0x24BEB3498];
      v14 = *MEMORY[0x24BEB3490];
      v15 = &unk_24CCF54B0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "snapshotWithSignature:withIDSDestinations:validFor:duration:events:payload:actions:reply:", v11, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 72), v13, 0, 600.0, 120.0);

  }
}

void __56__SiriCoreSymptomsReporter__getTypeForError_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "domain");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "code");

  if (v5)
    v8 = CFSTR("_%@.%ld");
  else
    v8 = CFSTR("%@.%ld");
  objc_msgSend(v6, "appendFormat:", v8, v9, v7);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1680 != -1)
    dispatch_once(&sharedInstance_onceToken_1680, &__block_literal_global_1681);
  return (id)sharedInstance_sharedInstance;
}

void __42__SiriCoreSymptomsReporter_sharedInstance__block_invoke()
{
  SiriCoreSymptomsReporter *v0;
  void *v1;

  if (AFIsInternalInstall())
  {
    v0 = objc_alloc_init(SiriCoreSymptomsReporter);
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;

  }
}

@end
