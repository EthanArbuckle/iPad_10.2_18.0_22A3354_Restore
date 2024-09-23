id SVXClientServiceCreateXPCInterface()
{
  if (SVXClientServiceCreateXPCInterface_onceToken != -1)
    dispatch_once(&SVXClientServiceCreateXPCInterface_onceToken, &__block_literal_global);
  return (id)SVXClientServiceCreateXPCInterface_sharedInterface;
}

id SVXClientServiceDelegateCreateXPCInterface()
{
  if (SVXClientServiceDelegateCreateXPCInterface_onceToken != -1)
    dispatch_once(&SVXClientServiceDelegateCreateXPCInterface_onceToken, &__block_literal_global_79);
  return (id)SVXClientServiceDelegateCreateXPCInterface_sharedInterface;
}

void sub_21493C3BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id SVXLocalizationGetAllTables()
{
  if (SVXLocalizationGetAllTables_onceToken != -1)
    dispatch_once(&SVXLocalizationGetAllTables_onceToken, &__block_literal_global_1043);
  return (id)SVXLocalizationGetAllTables_tables;
}

id SVXLocalizationGetKeysInTable(void *a1)
{
  id v1;
  id v2;
  void *v3;
  const __CFArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  +[SVXBundleUtils sharedInstance](SVXBundleUtils, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getSiriVOXFramework");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)objc_msgSend(v3, "localizations"), (CFArrayRef)&unk_24D26E9B0);
  v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "URLForResource:withExtension:subdirectory:localization:", v1, CFSTR("strings"), 0, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v9);
        else
          v10 = 0;
        if (objc_msgSend(v10, "count"))
        {
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __SVXLocalizationGetKeysInTable_block_invoke;
          v15[3] = &unk_24D24BDE8;
          v16 = v2;
          objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

        }
      }
      v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id SVXLocalizationGetLocalizedString(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a1;
  +[SVXBundleUtils sharedInstance](SVXBundleUtils, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getLocalizedStringWithBundle:table:key:languageCode:gender:", 0, 0, v5, v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL SVXBooleanGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SVXBooleanGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SVXBooleanGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_24D24BE28[a1];
}

uint64_t SVXBooleanGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXBooleanGetFromName_onceToken != -1)
      dispatch_once(&SVXBooleanGetFromName_onceToken, &__block_literal_global_1059);
    objc_msgSend((id)SVXBooleanGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_214941CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SVXDeactivationSourceGetIsValid(unint64_t a1)
{
  return a1 < 6;
}

BOOL SVXDeactivationSourceGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 5;
}

const __CFString *SVXDeactivationSourceGetName(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("(unknown)");
  else
    return off_24D24BF00[a1];
}

uint64_t SVXDeactivationSourceGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXDeactivationSourceGetFromName_onceToken != -1)
      dispatch_once(&SVXDeactivationSourceGetFromName_onceToken, &__block_literal_global_1721);
    objc_msgSend((id)SVXDeactivationSourceGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXStoreDemoTranscriptIDGetIsValid(unint64_t a1)
{
  return a1 < 0x16;
}

BOOL SVXStoreDemoTranscriptIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0x15;
}

const __CFString *SVXStoreDemoTranscriptIDGetName(unint64_t a1)
{
  if (a1 > 0x15)
    return CFSTR("(unknown)");
  else
    return off_24D24BF78[a1];
}

uint64_t SVXStoreDemoTranscriptIDGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXStoreDemoTranscriptIDGetFromName_onceToken != -1)
      dispatch_once(&SVXStoreDemoTranscriptIDGetFromName_onceToken, &__block_literal_global_1791);
    objc_msgSend((id)SVXStoreDemoTranscriptIDGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

CFDictionaryRef _SVXAnnouncerCreateInstanceMethodSignatureMap(Protocol *a1, BOOL a2)
{
  objc_method_description *v2;
  __CFDictionary *Mutable;
  unint64_t v4;
  char **p_types;
  const void *v6;
  void *v7;
  CFDictionaryRef Copy;
  unsigned int outCount;

  outCount = 0;
  v2 = protocol_copyMethodDescriptionList(a1, a2, 1, &outCount);
  Mutable = CFDictionaryCreateMutable(0, outCount, 0, MEMORY[0x24BDBD6B0]);
  if (v2 && outCount)
  {
    v4 = 0;
    p_types = &v2->types;
    do
    {
      v6 = *(p_types - 1);
      objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", *p_types);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(Mutable, v6, v7);

      ++v4;
      p_types += 2;
    }
    while (v4 < outCount);
  }
  free(v2);
  Copy = CFDictionaryCreateCopy(0, Mutable);
  CFRelease(Mutable);
  return Copy;
}

void sub_21494A0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21494A510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21494B8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location,id a32)
{
  id *v32;
  id *v33;
  id *v34;
  id *v35;

  objc_destroyWeak(v35);
  objc_destroyWeak(v33);
  objc_destroyWeak(v32);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_21494C508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *a11, id *a12, id *location, id *a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id a62)
{
  id *v62;
  id *v63;
  uint64_t v64;

  objc_destroyWeak(v62);
  objc_destroyWeak(v63);
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(&a62);
  _Block_object_dispose((const void *)(v64 - 176), 8);
  objc_destroyWeak((id *)(v64 - 232));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t SVXSpeechSynthesisOptionsValidate(char a1)
{
  return a1 & 3;
}

id SVXSpeechSynthesisOptionsGetNames(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("allowsSynthesizingOnServer"));
    if ((v1 & 2) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("disableDeviceRacing"));
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v4;
}

uint64_t SVXSpeechSynthesisOptionsGetFromNames(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = v1;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v2);
          v8 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v7);
          if (objc_msgSend(v8, "length"))
          {
            if (_SVXSpeechSynthesisOptionsGetFromName_onceToken != -1)
              dispatch_once(&_SVXSpeechSynthesisOptionsGetFromName_onceToken, &__block_literal_global_2319);
            objc_msgSend((id)_SVXSpeechSynthesisOptionsGetFromName_map, "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "unsignedIntegerValue");

          }
          else
          {
            v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

    v1 = v12;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL SVXSpeechSynthesisGenderGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SVXSpeechSynthesisGenderGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

const __CFString *SVXSpeechSynthesisGenderGetName(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_24D24C478[a1];
}

uint64_t SVXSpeechSynthesisGenderGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXSpeechSynthesisGenderGetFromName_onceToken != -1)
      dispatch_once(&SVXSpeechSynthesisGenderGetFromName_onceToken, &__block_literal_global_2636);
    objc_msgSend((id)SVXSpeechSynthesisGenderGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_214953000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SVXTaskOriginGetIsValid(unint64_t a1)
{
  return a1 < 0xD;
}

BOOL SVXTaskOriginGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xC;
}

const __CFString *SVXTaskOriginGetName(unint64_t a1)
{
  if (a1 > 0xC)
    return CFSTR("(unknown)");
  else
    return off_24D24C6E0[a1];
}

uint64_t SVXTaskOriginGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXTaskOriginGetFromName_onceToken != -1)
      dispatch_once(&SVXTaskOriginGetFromName_onceToken, &__block_literal_global_3649);
    objc_msgSend((id)SVXTaskOriginGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXDeviceSetupFlowDisplayKeyFrameIDGetIsValid(unint64_t a1)
{
  return a1 < 0xC;
}

BOOL SVXDeviceSetupFlowDisplayKeyFrameIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xB;
}

const __CFString *SVXDeviceSetupFlowDisplayKeyFrameIDGetName(unint64_t a1)
{
  if (a1 > 0xB)
    return CFSTR("(unknown)");
  else
    return off_24D24C790[a1];
}

uint64_t SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_onceToken != -1)
      dispatch_once(&SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_onceToken, &__block_literal_global_4050);
    objc_msgSend((id)SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t _getSchemaInvocationSourceForVoiceTrigger(void *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = 17;
  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", CFSTR("triggeredPhraseId"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedLongValue");

    if (v3 == 1)
      return 80;
    else
      return 17;
  }
  return v1;
}

uint64_t SVXInstrumentationEmitUIStateTransition(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = (NSObject **)MEMORY[0x24BE08FB0];
  if (a2 == 1 && a3 == 2)
    goto LABEL_15;
  switch(a2)
  {
    case 4:
      if (a3 == 2)
        goto LABEL_15;
      goto LABEL_11;
    case 3:
      if (a3 == 4)
      {
        a3 = 5;
        goto LABEL_15;
      }
LABEL_11:
      if (a3 == 1)
        goto LABEL_15;
      break;
    case 2:
      if (a3 == 3)
        goto LABEL_15;
      goto LABEL_11;
  }
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = "SVXInstrumentationEmitUIStateTransition";
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s Emitting unknown UIStateTransition; this implies there are unaccounted session state transitions, add them here",
      (uint8_t *)&v17,
      0xCu);
  }
  a3 = 0;
LABEL_15:
  v10 = objc_alloc_init(MEMORY[0x24BE95C28]);
  objc_msgSend(v10, "setPresentationType:", 6);
  v11 = objc_alloc_init(MEMORY[0x24BE95C30]);
  objc_msgSend(v11, "setPresenting:", v10);
  objc_msgSend(v11, "setPreviousState:", a4);
  objc_msgSend(v11, "setCurrentState:", a3);
  v12 = *v8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if ((a4 - 1) > 4)
      v13 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
    else
      v13 = off_24D24CA90[(a4 - 1)];
    if ((a3 - 1) > 4)
      v14 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
    else
      v14 = off_24D24CA90[(a3 - 1)];
    v17 = 136315650;
    v18 = "SVXInstrumentationEmitUIStateTransition";
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v15 = v12;
    _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit state transition event (current: %@, next: %@)", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(v7, "emitInstrumentation:", v11);

  return a3;
}

void SVXInstrumentationEmitViewAppearContextEnd(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;

  v1 = (objc_class *)MEMORY[0x24BE95BB0];
  v2 = a1;
  v4 = objc_alloc_init(v1);
  v3 = objc_alloc_init(MEMORY[0x24BE95BB8]);
  objc_msgSend(v3, "setExists:", 1);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "emitInstrumentation:", v4);

}

uint64_t SVXAudioSessionIsNoRoutesAvailableError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t IsNoRoutesAvailableError;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    IsNoRoutesAvailableError = 0;
    goto LABEL_8;
  }
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1100]))
  {

    goto LABEL_7;
  }
  v4 = objc_msgSend(v2, "code");

  if (v4 != -11784)
  {
LABEL_7:
    objc_msgSend(v2, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD1398]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    IsNoRoutesAvailableError = SVXAudioSessionIsNoRoutesAvailableError(v7);
    goto LABEL_8;
  }
  IsNoRoutesAvailableError = 1;
LABEL_8:

  return IsNoRoutesAvailableError;
}

BOOL SVXAudioPowerTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SVXAudioPowerTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SVXAudioPowerTypeGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_24D24CCC8[a1];
}

uint64_t SVXAudioPowerTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXAudioPowerTypeGetFromName_onceToken != -1)
      dispatch_once(&SVXAudioPowerTypeGetFromName_onceToken, &__block_literal_global_4670);
    objc_msgSend((id)SVXAudioPowerTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXSpeechSynthesisPriorityGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SVXSpeechSynthesisPriorityGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

const __CFString *SVXSpeechSynthesisPriorityGetName(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_24D24CD50[a1];
}

uint64_t SVXSpeechSynthesisPriorityGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXSpeechSynthesisPriorityGetFromName_onceToken != -1)
      dispatch_once(&SVXSpeechSynthesisPriorityGetFromName_onceToken, &__block_literal_global_4920);
    objc_msgSend((id)SVXSpeechSynthesisPriorityGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SVXSessionResignActiveOptionsGetNames(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("playsSound"));
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v4;
}

void sub_21495F840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRadarDraftClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  TapToRadarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RadarDraft");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRadarDraftClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRadarDraftClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SVXRadarDraftFactory.m"), 16, CFSTR("Unable to find class %s"), "RadarDraft");

    __break(1u);
  }
}

void __getRadarComponentClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  TapToRadarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RadarComponent");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRadarComponentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRadarComponentClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SVXRadarDraftFactory.m"), 17, CFSTR("Unable to find class %s"), "RadarComponent");

    __break(1u);
  }
}

void TapToRadarKitLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!TapToRadarKitLibraryCore_frameworkLibrary)
    TapToRadarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!TapToRadarKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *TapToRadarKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SVXRadarDraftFactory.m"), 15, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_214961DB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_2149622EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5690(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5691(uint64_t a1)
{

}

uint64_t _SVXClientActivationServiceValidateSystemEventForActivation(void *a1)
{
  __CFString *v1;
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  unint64_t v8;
  __CFString *v9;
  NSObject *v10;
  os_log_t v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  os_log_t v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  os_log_t v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  const char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v25 = 136315394;
    v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
    v27 = 2112;
    v28 = v1;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s Validating system event %@ for activation...", (uint8_t *)&v25, 0x16u);
  }
  if (v1)
  {
    v4 = 1;
    switch(-[__CFString type](v1, "type"))
    {
      case 1:
      case 2:
      case 3:
      case 12:
        goto LABEL_21;
      case 7:
        -[__CFString deviceSetupFlowScene](v1, "deviceSetupFlowScene");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_20;
        v6 = *v2;
        if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
          break;
        v7 = v6;
        v8 = -[__CFString type](v1, "type");
        if (v8 > 0xD)
          v9 = CFSTR("(unknown)");
        else
          v9 = off_24D24DC28[v8];
        v23 = v9;
        v25 = 136315394;
        v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
        v27 = 2112;
        v28 = v23;
        v24 = "%s Rejected system event for activation because the type is %@, but the deviceSetupFlowScene is nil.";
        goto LABEL_33;
      case 8:
        -[__CFString storeDemo](v1, "storeDemo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_20;
        v15 = *v2;
        if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
          break;
        v7 = v15;
        v16 = -[__CFString type](v1, "type");
        if (v16 > 0xD)
          v17 = CFSTR("(unknown)");
        else
          v17 = off_24D24DC28[v16];
        v23 = v17;
        v25 = 136315394;
        v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
        v27 = 2112;
        v28 = v23;
        v24 = "%s Rejected system event for activation because the type is %@, but the storeDemo is nil.";
        goto LABEL_33;
      case 13:
        -[__CFString speechSynthesisRequest](v1, "speechSynthesisRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
LABEL_20:
          v4 = 1;
          goto LABEL_21;
        }
        v20 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        {
          v7 = v20;
          v21 = -[__CFString type](v1, "type");
          if (v21 > 0xD)
            v22 = CFSTR("(unknown)");
          else
            v22 = off_24D24DC28[v21];
          v23 = v22;
          v25 = 136315394;
          v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
          v27 = 2112;
          v28 = v23;
          v24 = "%s Rejected system event for activation because the type is %@, but speechSynthesisRequest is nil.";
LABEL_33:
          _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v25, 0x16u);

        }
        break;
      default:
        v11 = *v2;
        if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
          break;
        v7 = v11;
        v12 = -[__CFString type](v1, "type");
        if (v12 > 0xD)
          v13 = CFSTR("(unknown)");
        else
          v13 = off_24D24DC28[v12];
        v23 = v13;
        v25 = 136315394;
        v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
        v27 = 2112;
        v28 = v23;
        v24 = "%s Rejected system event for activation because the type is %@.";
        goto LABEL_33;
    }
  }
  else
  {
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315138;
      v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
      _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s Rejected system event for activation because it is nil.", (uint8_t *)&v25, 0xCu);
    }
  }
  v4 = 0;
LABEL_21:

  return v4;
}

uint64_t SVXAlarmAndTimerFiringContextGetIsSpeakable(void *a1)
{
  id v1;
  SVXAlarmAndTimerUtilities *v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_alloc_init(SVXAlarmAndTimerUtilities);
  v3 = -[SVXAlarmAndTimerUtilities getIsSpeakable:](v2, "getIsSpeakable:", v1);

  return v3;
}

id SVXAlarmAndTimerFiringContextCreateSpeechSynthesisRequest(void *a1, void *a2)
{
  id v3;
  id v4;
  SVXAlarmAndTimerUtilities *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init(SVXAlarmAndTimerUtilities);
  -[SVXAlarmAndTimerUtilities createSpeechSynthesisRequestWithContext:instanceContext:](v5, "createSpeechSynthesisRequestWithContext:instanceContext:", v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id SVXClientInfoGetCurrent()
{
  if (SVXClientInfoGetCurrent_onceToken != -1)
    dispatch_once(&SVXClientInfoGetCurrent_onceToken, &__block_literal_global_5868);
  return (id)SVXClientInfoGetCurrent_clientInfo;
}

uint64_t SVXClientInfoIsCurrent(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  SVXClientInfoGetCurrent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", v1);

  return v3;
}

BOOL SVXPlatformDependencyTypeGetIsValid(unint64_t a1)
{
  return a1 < 0xC;
}

BOOL SVXPlatformDependencyTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xB;
}

const __CFString *SVXPlatformDependencyTypeGetName(unint64_t a1)
{
  if (a1 > 0xB)
    return CFSTR("(unknown)");
  else
    return off_24D24D028[a1];
}

uint64_t SVXPlatformDependencyTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXPlatformDependencyTypeGetFromName_onceToken != -1)
      dispatch_once(&SVXPlatformDependencyTypeGetFromName_onceToken, &__block_literal_global_6062);
    objc_msgSend((id)SVXPlatformDependencyTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id getTapToRadarServiceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTapToRadarServiceClass_softClass;
  v7 = getTapToRadarServiceClass_softClass;
  if (!getTapToRadarServiceClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getTapToRadarServiceClass_block_invoke;
    v3[3] = &unk_24D24D1E0;
    v3[4] = &v4;
    __getTapToRadarServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21496A4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTapToRadarServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!TapToRadarKitLibraryCore_frameworkLibrary_7237)
    TapToRadarKitLibraryCore_frameworkLibrary_7237 = _sl_dlopen();
  if (!TapToRadarKitLibraryCore_frameworkLibrary_7237)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *TapToRadarKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SVXRadarFiler.m"), 13, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("TapToRadarService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getTapToRadarServiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SVXRadarFiler.m"), 14, CFSTR("Unable to find class %s"), "TapToRadarService");

LABEL_8:
    __break(1u);
  }
  getTapToRadarServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL SVXSoundIDGetIsValid(unint64_t a1)
{
  return a1 < 7;
}

BOOL SVXSoundIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 6;
}

const __CFString *SVXSoundIDGetName(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("(unknown)");
  else
    return off_24D24D238[a1];
}

uint64_t SVXSoundIDGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXSoundIDGetFromName_onceToken != -1)
      dispatch_once(&SVXSoundIDGetFromName_onceToken, &__block_literal_global_7400);
    objc_msgSend((id)SVXSoundIDGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXSpeechSynthesisResultTypeGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SVXSpeechSynthesisResultTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

const __CFString *SVXSpeechSynthesisResultTypeGetName(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return off_24D24D308[a1];
}

uint64_t SVXSpeechSynthesisResultTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXSpeechSynthesisResultTypeGetFromName_onceToken != -1)
      dispatch_once(&SVXSpeechSynthesisResultTypeGetFromName_onceToken, &__block_literal_global_7657);
    objc_msgSend((id)SVXSpeechSynthesisResultTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_21496FD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  id *v38;

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214973628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_2149738B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8215(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8216(uint64_t a1)
{

}

void sub_214975068(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _recordStartEndBiomeEvent(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCE60];
  v8 = a1;
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___recordStartEndBiomeEvent_block_invoke;
  block[3] = &unk_24D24EF00;
  v14 = v5;
  v15 = v6;
  v16 = v9;
  v10 = v9;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

void ___recordStartEndBiomeEvent_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Siri");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &stru_24D24F378;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.siri.ui.end")))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("DISMISSAL_REASON"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (__CFString *)v7;
    else
      v9 = &stru_24D24F378;
    v6 = v9;

    v10 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    v10 = MEMORY[0x24BDBD1C8];
  }
  v11 = objc_alloc(MEMORY[0x24BE0C780]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("sessionUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("activityUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24D26F268, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithSessionID:uuid:viewMode:dismissalReason:starting:absoluteTimestamp:", v12, v13, v14, v6, v10, *(_QWORD *)(a1 + 48));

  if (v15)
  {
    v16 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v17 = 136315138;
      v18 = "_recordStartEndBiomeEvent_block_invoke";
      _os_log_impl(&dword_214934000, v16, OS_LOG_TYPE_INFO, "%s Donating biome event from SVXSession Manager", (uint8_t *)&v17, 0xCu);
    }
    objc_msgSend(v5, "sendEvent:", v15);
  }

}

void sub_214975C38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_214975CF0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _myriadStereoPartnerDataChanged(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___myriadStereoPartnerDataChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t ___myriadStereoPartnerDataChanged_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_myriadStereoPartnerDataChanged");
}

uint64_t SVXPerformingOptionsValidate(char a1)
{
  return a1 & 3;
}

id SVXPerformingOptionsGetNames(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("waitsUntilDone"));
    if ((v1 & 2) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("allowsFastPath"));
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v4;
}

uint64_t SVXPerformingOptionsGetFromNames(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = v1;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v2);
          v8 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v7);
          if (objc_msgSend(v8, "length"))
          {
            if (_SVXPerformingOptionsGetFromName_onceToken != -1)
              dispatch_once(&_SVXPerformingOptionsGetFromName_onceToken, &__block_literal_global_8476);
            objc_msgSend((id)_SVXPerformingOptionsGetFromName_map, "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "unsignedIntegerValue");

          }
          else
          {
            v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

    v1 = v12;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id SBSDebugInterfaceFunction()
{
  return (id)classSBSDebugInterface;
}

id initSBSDebugInterface()
{
  if (initSBSDebugInterface_sOnce != -1)
    dispatch_once(&initSBSDebugInterface_sOnce, &__block_literal_global_8807);
  return (id)classSBSDebugInterface;
}

Class __initSBSDebugInterface_block_invoke()
{
  Class result;

  if (SoundBoardServicesLibrary_sOnce != -1)
    dispatch_once(&SoundBoardServicesLibrary_sOnce, &__block_literal_global_118);
  result = objc_getClass("SBSDebugInterface");
  classSBSDebugInterface = (uint64_t)result;
  getSBSDebugInterfaceClass = SBSDebugInterfaceFunction;
  return result;
}

void sub_21497830C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL SVXActivationSourceGetIsValid(unint64_t a1)
{
  return a1 < 0xA;
}

BOOL SVXActivationSourceGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 9;
}

const __CFString *SVXActivationSourceGetName(unint64_t a1)
{
  if (a1 > 9)
    return CFSTR("(unknown)");
  else
    return off_24D24D798[a1];
}

uint64_t SVXActivationSourceGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXActivationSourceGetFromName_onceToken != -1)
      dispatch_once(&SVXActivationSourceGetFromName_onceToken, &__block_literal_global_8982);
    objc_msgSend((id)SVXActivationSourceGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

__CFString *SVXStoreDemoGetLocalizationKey(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString ***v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "SVXStoreDemoGetLocalizationKey";
    v11 = 2048;
    v12 = a1;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_DEFAULT, "%s SVXStoreDemoTranscriptID = %lu", (uint8_t *)&v9, 0x16u);
  }
  v3 = MGGetProductType();
  if (v3 <= 3348380075)
  {
    if (v3 != 1540760353)
    {
      v4 = 2702125347;
      goto LABEL_8;
    }
    v6 = a1 - 16;
    if ((unint64_t)(a1 - 16) > 5)
      return (__CFString *)0;
    v7 = off_24D24DA28;
LABEL_14:
    v5 = *v7[v6];
    return v5;
  }
  if (v3 == 3348380076)
  {
    v6 = a1 - 10;
    if ((unint64_t)(a1 - 10) > 5)
      return (__CFString *)0;
    v7 = off_24D24D9F8;
    goto LABEL_14;
  }
  v4 = 4240173202;
LABEL_8:
  if (v3 == v4)
  {
    _SVXStoreDemoGetLocalizationKeyForStyle1(a1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  return (__CFString *)0;
}

__CFString *_SVXStoreDemoGetLocalizationKeyForStyle1(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return (__CFString *)0;
  else
    return *off_24D24DA58[a1 - 1];
}

SVXAudioStreamBasicDescription *SVXAudioStreamBasicDescriptionCreateFromUIAudioDescription(void *a1)
{
  id v1;
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  SVXAudioStreamBasicDescription *v13;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  SVXAudioStreamBasicDescription *v19;
  void *v20;
  void *v21;
  void *v22;

  if (a1)
  {
    v1 = a1;
    v19 = [SVXAudioStreamBasicDescription alloc];
    objc_msgSend(v1, "sampleRate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v3 = v2;
    objc_msgSend(v1, "formatID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v21, "unsignedIntValue");
    objc_msgSend(v1, "formatFlags");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v20, "unsignedIntValue");
    objc_msgSend(v1, "bytesPerPacket");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v18, "unsignedIntValue");
    objc_msgSend(v1, "framesPerPacket");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntValue");
    objc_msgSend(v1, "bytesPerFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");
    objc_msgSend(v1, "channelsPerFrame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");
    objc_msgSend(v1, "bitsPerChannel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");
    objc_msgSend(v1, "reserved");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:](v19, "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", v17, v16, v15, v5, v7, v9, v3, __PAIR64__(objc_msgSend(v12, "unsignedIntValue"), v11));
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

uint64_t SVXSessionIsSpeechRecordingAllowed(void *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  void *v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "source");
  v3 = 0;
  if (v2 <= 8)
  {
    if (((1 << v2) & 0x156) != 0)
    {
      v3 = 1;
    }
    else if (v2 == 7)
    {
      objc_msgSend(v1, "requestInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "isSpeechRequest");

    }
  }

  return v3;
}

BOOL SVXButtonEventTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SVXButtonEventTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SVXButtonEventTypeGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_24D24DBF0[a1];
}

uint64_t SVXButtonEventTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXButtonEventTypeGetFromName_onceToken != -1)
      dispatch_once(&SVXButtonEventTypeGetFromName_onceToken, &__block_literal_global_10589);
    objc_msgSend((id)SVXButtonEventTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXSystemEventTypeGetIsValid(unint64_t a1)
{
  return a1 < 0xE;
}

BOOL SVXSystemEventTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xD;
}

const __CFString *SVXSystemEventTypeGetName(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("(unknown)");
  else
    return off_24D24DC28[a1];
}

uint64_t SVXSystemEventTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXSystemEventTypeGetFromName_onceToken != -1)
      dispatch_once(&SVXSystemEventTypeGetFromName_onceToken, &__block_literal_global_10636);
    objc_msgSend((id)SVXSystemEventTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_21498B95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21498BC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21498C2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214994304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214994CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214995D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214997960(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _SVXSessionCreateSetApplicationContext(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  int IsActive;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BE81630]);
  v3 = objc_alloc_init(MEMORY[0x24BE81118]);
  objc_msgSend(v3, "setAppName:", CFSTR("SiriVOXService"));
  v4 = objc_alloc_init(MEMORY[0x24BE817D8]);
  objc_msgSend(v4, "setBundleId:", CFSTR("com.apple.SiriVOXService"));
  objc_msgSend(v3, "setAppIdentifyingInfo:", v4);
  objc_msgSend(v1, "beginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsActive = AFDeviceSetupIsActive();

  if (IsActive)
  {
    objc_msgSend(v1, "flowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sceneID");

    if (v9 == 5)
      v10 = (id)*MEMORY[0x24BE81B30];
    else
      v10 = 0;
    v11 = objc_alloc_init(MEMORY[0x24BE811F8]);
    objc_msgSend(v11, "setSetupSceneId:", v10);
    objc_msgSend(v3, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(v11, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOrderedContext:", v15);

  }
  else
  {
    objc_msgSend(v3, "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOrderedContext:", v12);
  }

  return v2;
}

id UAUserActivityTypeSiriFunction()
{
  return (id)constantUAUserActivityTypeSiri;
}

id initUAUserActivityTypeSiri()
{
  if (initUAUserActivityTypeSiri_sOnce != -1)
    dispatch_once(&initUAUserActivityTypeSiri_sOnce, &__block_literal_global_660);
  return (id)constantUAUserActivityTypeSiri;
}

void __initUAUserActivityTypeSiri_block_invoke()
{
  id *v0;

  if (UserActivityLibrary_sOnce != -1)
    dispatch_once(&UserActivityLibrary_sOnce, &__block_literal_global_662);
  v0 = (id *)dlsym((void *)UserActivityLibrary_sLib, "UAUserActivityTypeSiri");
  if (v0)
    objc_storeStrong((id *)&constantUAUserActivityTypeSiri, *v0);
  getUAUserActivityTypeSiri = UAUserActivityTypeSiriFunction;
}

BOOL SiriVOXErrorCodeGetIsValid(unint64_t a1)
{
  return a1 < 0xE;
}

BOOL SiriVOXErrorCodeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xD;
}

const __CFString *SiriVOXErrorCodeGetName(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("(unknown)");
  else
    return off_24D24E6A8[a1];
}

uint64_t SiriVOXErrorCodeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SiriVOXErrorCodeGetFromName_onceToken != -1)
      dispatch_once(&SiriVOXErrorCodeGetFromName_onceToken, &__block_literal_global_11287);
    objc_msgSend((id)SiriVOXErrorCodeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXDeviceSetupFlowSceneIDGetIsValid(unint64_t a1)
{
  return a1 < 0xA;
}

BOOL SVXDeviceSetupFlowSceneIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 9;
}

const __CFString *SVXDeviceSetupFlowSceneIDGetName(unint64_t a1)
{
  if (a1 > 9)
    return CFSTR("(unknown)");
  else
    return off_24D24E738[a1];
}

uint64_t SVXDeviceSetupFlowSceneIDGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXDeviceSetupFlowSceneIDGetFromName_onceToken != -1)
      dispatch_once(&SVXDeviceSetupFlowSceneIDGetFromName_onceToken, &__block_literal_global_11463);
    objc_msgSend((id)SVXDeviceSetupFlowSceneIDGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXSessionStateGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SVXSessionStateGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

const __CFString *SVXSessionStateGetName(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return off_24D24E7A8[a1];
}

uint64_t SVXSessionStateGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXSessionStateGetFromName_onceToken != -1)
      dispatch_once(&SVXSessionStateGetFromName_onceToken, &__block_literal_global_11605);
    objc_msgSend((id)SVXSessionStateGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL SVXAudioPowerUpdateFrequencyGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SVXAudioPowerUpdateFrequencyGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

const __CFString *SVXAudioPowerUpdateFrequencyGetName(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_24D24E810[a1];
}

uint64_t SVXAudioPowerUpdateFrequencyGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SVXAudioPowerUpdateFrequencyGetFromName_onceToken != -1)
      dispatch_once(&SVXAudioPowerUpdateFrequencyGetFromName_onceToken, &__block_literal_global_11626);
    objc_msgSend((id)SVXAudioPowerUpdateFrequencyGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t _audioFileReadData(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = a1;
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "length");
    if (a2 < 0)
    {
      a3 = 0;
      v12 = 4294967256;
    }
    else if (v11 <= a2)
    {
      a3 = 0;
      v12 = 4294967257;
    }
    else
    {
      if (v11 - a2 < a3)
        a3 = v11 - a2;
      objc_msgSend(v10, "getBytes:range:", a4, a2, a3);
      v12 = 0;
    }
  }
  else
  {
    a3 = 0;
    v12 = 4294967246;
  }
  *a5 = a3;

  return v12;
}

void sub_2149A0790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11850(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11851(uint64_t a1)
{

}

void sub_2149A1584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149AAC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12599(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12600(uint64_t a1)
{

}

SVXSpeechSynthesisRequest *SVXDeviceSetupCreateSpeechSynthesisRequestForSceneWithID(uint64_t a1)
{
  if (a1 == 5)
    return -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 0, 0, 0, 0, 0, 0);
  else
    return (SVXSpeechSynthesisRequest *)0;
}

id SVXDeviceSetupCreateOptionsArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  char *obja;
  _QWORD v52[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v1;
  if (v2)
  {
    objc_msgSend(v1, "languageCode");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v83[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    AFPreferencesSupportedLanguages();
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v74;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v74 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v8);
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          objc_msgSend(MEMORY[0x24BE093A0], "allVoicesForSiriSessionLanguage:", v9, v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v70;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v70 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v14), "languageCode");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v15);

                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v6);
    }

    objc_msgSend(v3, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v34;
  }

  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v1, "gender") == 2)
  {
    v16 = &unk_24D26F7D8;
  }
  else if (objc_msgSend(v1, "gender") == 1)
  {
    v16 = &unk_24D26F7F0;
  }
  else
  {
    if (objc_msgSend(v1, "gender") != 3)
    {
      objc_msgSend(v38, "addObject:", &unk_24D26F7D8);
      objc_msgSend(v38, "addObject:", &unk_24D26F7F0);
    }
    v16 = &unk_24D26F808;
  }
  objc_msgSend(v38, "addObject:", v16, v34);
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v1, "hasActiveAccount") == 2)
  {
    v17 = &unk_24D26F7D8;
  }
  else
  {
    if (objc_msgSend(v1, "hasActiveAccount") != 1)
      objc_msgSend(v42, "addObject:", &unk_24D26F7D8);
    v17 = &unk_24D26F7F0;
  }
  objc_msgSend(v42, "addObject:", v17);
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v1, "isNewsRestricted") == 2)
  {
    v18 = &unk_24D26F7D8;
  }
  else
  {
    if (objc_msgSend(v1, "isNewsRestricted") != 1)
      objc_msgSend(v47, "addObject:", &unk_24D26F7D8);
    v18 = &unk_24D26F7F0;
  }
  objc_msgSend(v47, "addObject:", v18);
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v36 = v4;
  v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v66;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v66 != v37)
          objc_enumerationMutation(v36);
        v40 = v20;
        v21 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v20);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v41 = v38;
        v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
        if (v44)
        {
          v43 = *(_QWORD *)v62;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v62 != v43)
                objc_enumerationMutation(v41);
              v45 = v22;
              v23 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v22);
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              v46 = v42;
              v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
              if (v49)
              {
                v48 = *(_QWORD *)v58;
                do
                {
                  v24 = 0;
                  do
                  {
                    if (*(_QWORD *)v58 != v48)
                      objc_enumerationMutation(v46);
                    obja = v24;
                    v25 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v24);
                    v53 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v56 = 0u;
                    v26 = v47;
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
                    if (v27)
                    {
                      v28 = v27;
                      v29 = *(_QWORD *)v54;
                      do
                      {
                        v30 = 0;
                        do
                        {
                          if (*(_QWORD *)v54 != v29)
                            objc_enumerationMutation(v26);
                          v31 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v30);
                          v52[0] = MEMORY[0x24BDAC760];
                          v52[1] = 3221225472;
                          v52[2] = __SVXDeviceSetupCreateOptionsArray_block_invoke;
                          v52[3] = &unk_24D24EFC8;
                          v52[4] = v21;
                          v52[5] = v23;
                          v52[6] = v25;
                          v52[7] = v31;
                          v32 = +[SVXDeviceSetupOptions newWithBuilder:](SVXDeviceSetupOptions, "newWithBuilder:", v52);
                          objc_msgSend(v19, "addObject:", v32);

                          ++v30;
                        }
                        while (v28 != v30);
                        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
                      }
                      while (v28);
                    }

                    v24 = obja + 1;
                  }
                  while (obja + 1 != (char *)v49);
                  v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
                }
                while (v49);
              }

              v22 = v45 + 1;
            }
            while (v45 + 1 != v44);
            v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
          }
          while (v44);
        }

        v20 = v40 + 1;
      }
      while (v40 + 1 != v39);
      v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    }
    while (v39);
  }

  return v19;
}

void sub_2149AC984(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_2149AD188(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_2149ADA40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2149ADBBC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x24BE08B68]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x24BE08B88]();
}

uint64_t AFAudioSessionAssertionGetCurrentAcquisitionService()
{
  return MEMORY[0x24BE08BB8]();
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x24BE08BD0]();
}

uint64_t AFDeviceSetupIsActive()
{
  return MEMORY[0x24BE08C68]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x24BE08CB8]();
}

uint64_t AFDispatchScheduleWithDelay()
{
  return MEMORY[0x24BE08CF0]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFLogInitIfNeeded()
{
  return MEMORY[0x24BE08E08]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x24BE08E18]();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return MEMORY[0x24BE08E90]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x24BE08ED8]();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x24BE08EF0]();
}

uint64_t AFRecordCoreDuetEvent()
{
  return MEMORY[0x24BE08F10]();
}

uint64_t AFRequiredAssetsForFullUOD()
{
  return MEMORY[0x24BE08F48]();
}

uint64_t AFSiriDeactivationOptionsGetNames()
{
  return MEMORY[0x24BE08F90]();
}

uint64_t AFSiriDeactivationReasonGetName()
{
  return MEMORY[0x24BE08F98]();
}

uint64_t AFSpeechEndpointerOperationModeGetName()
{
  return MEMORY[0x24BE09038]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x24BE09040]();
}

uint64_t AFSupportsWAPI()
{
  return MEMORY[0x24BE09068]();
}

uint64_t AFTurnIdentifierGenerate()
{
  return MEMORY[0x24BE09078]();
}

uint64_t AFTurnIdentifierGetBytes()
{
  return MEMORY[0x24BE09080]();
}

uint64_t AFTurnIdentifierGetString()
{
  return MEMORY[0x24BE09088]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x24BDB6830](inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6850](inAudioFile, *(_QWORD *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenWithCallbacks(void *inClientData, AudioFile_ReadProc inReadFunc, AudioFile_WriteProc inWriteFunc, AudioFile_GetSizeProc inGetSizeFunc, AudioFile_SetSizeProc inSetSizeFunc, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x24BDB6888](inClientData, inReadFunc, inWriteFunc, inGetSizeFunc, inSetSizeFunc, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB69A0](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x24BDBBA60](locArray, prefArray);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MDModeGetName()
{
  return MEMORY[0x24BE9C028]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SRUIFSiriSessionEventGetDescription()
{
  return MEMORY[0x24BEA86F8]();
}

uint64_t _AFPreferencesBoolFromValueWithDefault()
{
  return MEMORY[0x24BE09400]();
}

uint64_t _AFPreferencesValueForKey()
{
  return MEMORY[0x24BE09450]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE018](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x24BDAE048]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

