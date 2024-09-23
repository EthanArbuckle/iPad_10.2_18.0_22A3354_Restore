@implementation RXObjectSetProperty

void __RXObjectSetProperty_block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeID v3;
  CFTypeID TypeID;
  const __CFString *v5;
  int v6;
  const void *v7;
  int v8;
  __CFString *v9;
  CFTypeID v10;
  int v11;
  uint64_t v12;
  const void *v13;
  const char *v14;
  uint64_t v15;
  RXRecognitionSystem **v16;
  CFTypeID v17;
  const __CFString *v18;
  CFTypeID v19;
  const __CFString *v20;
  CFTypeID v21;
  const __CFArray *v22;
  const char *v23;

  v2 = *(const void **)(a1 + 32);
  if (!v2)
  {
    v8 = *(_DWORD *)(a1 + 48);
    v9 = *(__CFString **)(a1 + 40);
    if (v8 <= 1819505778)
    {
      switch(v8)
      {
        case 1667326824:
          if (!v9 || (__CFString *)*MEMORY[0x24BDBD268] == v9)
            RDNukeCache(0);
          return;
        case 1668049262:
          if (v9 && (v19 = CFGetTypeID(v9), v19 == CFStringGetTypeID()))
          {
            RXXPC::CancelInstallationForLanguage(v9, v20);
          }
          else
          {
            byte_25547CF04 = 0;
            __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 420, 0, CFSTR("Global property %s wasn't passed CFString argument."), &RXPropertyKeyName::sTmpProp);
          }
          return;
        case 1818324583:
          goto LABEL_15;
      }
    }
    else
    {
      if (v8 <= 1936617574)
      {
        if (v8 != 1819505779)
        {
          if (v8 == 1885957747)
          {
            byte_25547CF04 = 0;
            __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 425, 0, CFSTR("Global property %s is read only"), &RXPropertyKeyName::sTmpProp);
            return;
          }
          goto LABEL_34;
        }
LABEL_15:
        v14 = RXPropertyKeyName(v8);
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 404, 0, CFSTR("Global property %s is read only"), v14);
        return;
      }
      if (v8 == 1936617575)
      {
        if (v9 && (v21 = CFGetTypeID(v9), v21 == CFArrayGetTypeID()))
        {
          RXXPC::SetNonPurgeabilityForLanguages((RXXPC *)v9, v22);
        }
        else
        {
          byte_25547CF04 = 0;
          __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 433, 0, CFSTR("Global property %s wasn't passed CFString argument."), &RXPropertyKeyName::sTmpProp);
        }
        return;
      }
      if (v8 == 1937009769)
      {
        if (v9 && (v17 = CFGetTypeID(v9), v17 == CFStringGetTypeID()))
        {
          RXXPC::StartInstallationForLanguage(v9, v18);
        }
        else
        {
          byte_25547CF04 = 0;
          __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 411, 0, CFSTR("Global property %s wasn't passed CFString argument."), &RXPropertyKeyName::sTmpProp);
        }
        return;
      }
    }
LABEL_34:
    v23 = RXPropertyKeyName(v8);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 442, 0, CFSTR("Global property %s not defined"), v23);
    return;
  }
  v3 = CFGetTypeID(v2);
  TypeID = CFStringGetTypeID();
  v5 = *(const __CFString **)(a1 + 32);
  if (v3 == TypeID)
  {
    v6 = *(_DWORD *)(a1 + 48);
    v7 = *(const void **)(a1 + 40);
LABEL_11:
    RXSetLocaleProperty(v5, v6, v7);
    return;
  }
  v10 = CFGetTypeID(v5);
  if (v10 == CFLocaleGetTypeID())
  {
    v11 = *(_DWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(const void **)(a1 + 40);
    v5 = (const __CFString *)MEMORY[0x2207B863C](v12);
    v6 = v11;
    v7 = v13;
    goto LABEL_11;
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    v16 = (RXRecognitionSystem **)(v15 + 16);
  else
    v16 = 0;
  RXRecognitionSystem::StartChanges(v16[2]);
  (*((void (**)(RXRecognitionSystem **, _QWORD, _QWORD))*v16 + 10))(v16, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  RXRecognitionSystem::CommitChanges(v16[2]);
}

@end
