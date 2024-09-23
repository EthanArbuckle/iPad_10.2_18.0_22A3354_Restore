void sub_21B3F14A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B3F156C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SUAllowsLandscapePhone()
{
  int v0;

  v0 = SUAllowsLandscapePhone_sValue;
  if (SUAllowsLandscapePhone_sValue == 255)
  {
    v0 = MGGetBoolAnswer();
    if (v0)
      v0 = MGGetBoolAnswer();
    SUAllowsLandscapePhone_sValue = v0;
  }
  return v0 != 0;
}

void sub_21B3F22FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initICUserIdentity()
{
  Class result;

  if (iTunesCloudLibrary_sOnce != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("ICUserIdentity");
  classICUserIdentity = (uint64_t)result;
  getICUserIdentityClass = ICUserIdentityFunction;
  return result;
}

uint64_t ICUserIdentityFunction()
{
  return classICUserIdentity;
}

void *__iTunesCloudLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 2);
  iTunesCloudLibrary_sLib = (uint64_t)result;
  return result;
}

Class initICMusicSubscriptionStatusMonitor()
{
  Class result;

  if (iTunesCloudLibrary_sOnce != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("ICMusicSubscriptionStatusMonitor");
  classICMusicSubscriptionStatusMonitor = (uint64_t)result;
  getICMusicSubscriptionStatusMonitorClass = ICMusicSubscriptionStatusMonitorFunction;
  return result;
}

uint64_t ICMusicSubscriptionStatusMonitorFunction()
{
  return classICMusicSubscriptionStatusMonitor;
}

void sub_21B3F33C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B3F34A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUSetStatusBarStyleWithBarStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = objc_msgSend(v4, "statusBarStyle");
  v6 = 1;
  if (a1 != 2)
    v6 = v5;
  if (a1 == 1)
    v7 = 0;
  else
    v7 = v6;
  return objc_msgSend(v4, "setStatusBarStyle:animated:", v7, a2);
}

BOOL SUPositionEqualToPosition(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL SUPositionIsLast(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 24);
  return !v1 || *(_QWORD *)(a1 + 16) == v1 - 1;
}

BOOL SUPositionIsLastInSection(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[1];
  return !v1 || *a1 == v1 - 1;
}

void sub_21B3FA004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21B3FA96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_21B3FB4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B3FC774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  id *v12;
  uint64_t v13;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 152));
  _Unwind_Resume(a1);
}

void sub_21B3FEB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B400FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4023C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v36 - 152));
  _Unwind_Resume(a1);
}

void sub_21B403930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B403A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B403E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B40404C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4044BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4046BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B404838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4049E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4053B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4054C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4057B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4058CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B406584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B4068A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class initFACircleContext()
{
  Class result;

  if (FamilyCircleUILibrary_sOnce != -1)
    dispatch_once(&FamilyCircleUILibrary_sOnce, &__block_literal_global_1394);
  result = objc_getClass("FACircleContext");
  classFACircleContext = (uint64_t)result;
  getFACircleContextClass = (uint64_t (*)())FACircleContextFunction;
  return result;
}

id FACircleContextFunction()
{
  return (id)classFACircleContext;
}

id initValFACircleEventTypeInitiate()
{
  id *v0;

  if (FamilyCircleUILibrary_sOnce != -1)
    dispatch_once(&FamilyCircleUILibrary_sOnce, &__block_literal_global_1394);
  v0 = (id *)dlsym((void *)FamilyCircleUILibrary_sLib, "FACircleEventTypeInitiate");
  if (v0)
    objc_storeStrong((id *)&constantValFACircleEventTypeInitiate, *v0);
  getFACircleEventTypeInitiate = (uint64_t (*)())FACircleEventTypeInitiateFunction;
  return (id)constantValFACircleEventTypeInitiate;
}

id FACircleEventTypeInitiateFunction()
{
  return (id)constantValFACircleEventTypeInitiate;
}

Class initFACircleStateController()
{
  Class result;

  if (FamilyCircleUILibrary_sOnce != -1)
    dispatch_once(&FamilyCircleUILibrary_sOnce, &__block_literal_global_1394);
  result = objc_getClass("FACircleStateController");
  classFACircleStateController = (uint64_t)result;
  getFACircleStateControllerClass = (uint64_t (*)())FACircleStateControllerFunction;
  return result;
}

id FACircleStateControllerFunction()
{
  return (id)classFACircleStateController;
}

Class initAMSUICardMetadata()
{
  Class result;

  if (AppleMediaServicesUILibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesUILibrary_sOnce, &__block_literal_global_1399);
  result = objc_getClass("AMSUICardMetadata");
  classAMSUICardMetadata = (uint64_t)result;
  getAMSUICardMetadataClass = (uint64_t (*)())AMSUICardMetadataFunction;
  return result;
}

id AMSUICardMetadataFunction()
{
  return (id)classAMSUICardMetadata;
}

void sub_21B40A9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B40F934(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void *__CreateLabel(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  v6 = (void *)objc_msgSend(a1, "stringForLabelAtIndex:", a2);
  if (!objc_msgSend(v6, "length"))
    return 0;
  v7 = objc_alloc(MEMORY[0x24BDF6B68]);
  objc_msgSend(a1, "frameForLabelAtIndex:", a2);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:");
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 0);
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v8, "setFont:", objc_msgSend(a1, "fontForLabelAtIndex:", a2));
  objc_msgSend(v8, "setHighlightedTextColor:", objc_msgSend(a1, "colorForLabelAtIndex:withModifiers:", a2, 1));
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setTag:", a2 + 50000);
  objc_msgSend(v8, "setText:", v6);
  objc_msgSend(v8, "setTextColor:", objc_msgSend(a1, "colorForLabelAtIndex:withModifiers:", a2, a3));
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);
  v11 = 0;
  v10 = *MEMORY[0x24BDBF148];
  if (objc_msgSend(a1, "getShadowColor:offset:forLabelAtIndex:withModifiers:", &v11, &v10, a2, a3))
  {
    objc_msgSend(v8, "setShadowColor:", v11);
    objc_msgSend(v8, "setShadowOffset:", v10);
  }
  return v8;
}

void sub_21B41FF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B42001C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SUCreateHTMLForPlainText(__CFString *a1, uint64_t a2)
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  UniChar *v16;
  uint64_t v17;
  UniChar v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  void *v38;
  id v39;
  UniChar chars;
  UniChar buffer[8];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __CFString *v49;
  UniChar *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CFRange v56;

  v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("<html>"));
  v5 = v4;
  if (a2)
    -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("<head><style type=\"text/css\">%@</style></head>"), a2);
  -[__CFString appendString:](v5, "appendString:", CFSTR("<body>"));
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  *(_OWORD *)buffer = 0u;
  v42 = 0u;
  v6 = -[__CFString length](a1, "length");
  v49 = a1;
  v52 = 0;
  v53 = v6;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v50 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v51 = CStringPtr;
  v54 = 0;
  v55 = 0;
  v37 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE2B380], "urlMatchesForString:includingTel:", a1, 0), "objectEnumerator");
  v9 = objc_msgSend(v37, "nextObject");
  if (v6 >= 1)
  {
    v10 = (void *)v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0x24BDD1000uLL;
    v35 = v6;
    v36 = v5;
    do
    {
      v39 = objc_alloc_init(*(Class *)(v14 + 1120));
      chars = 0;
      if (v11 < 0 || (v15 = v53, v53 <= v11))
      {
        v18 = 0;
      }
      else
      {
        v16 = v50;
        if (v50)
        {
          v17 = v52 + v11;
LABEL_11:
          v18 = v16[v17];
          goto LABEL_13;
        }
        if (!v51)
        {
          if (v55 <= v11 || (v32 = v54, v54 > v11))
          {
            v33 = v11 - 4;
            if ((unint64_t)v11 < 4)
              v33 = 0;
            if (v33 + 64 < v53)
              v15 = v33 + 64;
            v54 = v33;
            v55 = v15;
            v56.location = v52 + v33;
            v56.length = v15 - v33;
            CFStringGetCharacters(v49, v56, buffer);
            v32 = v54;
          }
          v17 = v11 - v32;
          v16 = buffer;
          goto LABEL_11;
        }
        v18 = v51[v52 + v11];
      }
LABEL_13:
      chars = v18;
      if (v10)
      {
        if (v11 == objc_msgSend(v10, "range"))
        {
          v19 = (void *)objc_msgSend(v10, "url");
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<a href=\"%@\">"), v19);
          v21 = objc_msgSend(v19, "length");
          v38 = v10;
          if (v21)
          {
            v22 = v21;
            v23 = 0;
            v24 = v21;
            do
            {
              if (v24 >= 18 - v12)
                v25 = 18 - v12;
              else
                v25 = v24;
              objc_msgSend(v20, "appendFormat:", CFSTR("%@&#8203;"), objc_msgSend(v19, "substringWithRange:", v23, v25));
              v12 = 0;
              v26 = 0;
              v23 += 18;
              v24 -= 18;
            }
            while (v23 < v22);
          }
          else
          {
            v26 = v12;
          }
          objc_msgSend(v20, "appendString:", CFSTR("</a>"));
          v5 = v36;
          -[__CFString appendString:](v36, "appendString:", v20);
          objc_msgSend(v38, "range");
          v11 = v11 + v29 - 1;

          v10 = (void *)objc_msgSend(v37, "nextObject");
          v12 = v26;
          v6 = v35;
          v14 = 0x24BDD1000;
          goto LABEL_44;
        }
        v18 = chars;
      }
      if (v18 <= 0x25u)
      {
        if (v18 == 10)
        {
          if (v13 != 13)
          {
LABEL_41:
            v30 = v5;
            v31 = CFSTR("<br>");
            goto LABEL_42;
          }
LABEL_43:
          v12 = 0;
          goto LABEL_44;
        }
        if (v18 == 13)
          goto LABEL_41;
      }
      else
      {
        switch(v18)
        {
          case '&':
            v27 = v5;
            v28 = CFSTR("&amp;");
            goto LABEL_39;
          case '<':
            v27 = v5;
            v28 = CFSTR("&lt;");
            goto LABEL_39;
          case '>':
            v27 = v5;
            v28 = CFSTR("&gt;");
LABEL_39:
            -[__CFString appendString:](v27, "appendString:", v28);
            goto LABEL_44;
        }
      }
      CFStringAppendCharacters(v5, &chars, 1);
      if (chars == 32)
        goto LABEL_43;
      if (v12 > 17)
      {
        v30 = v5;
        v31 = CFSTR("&#8203;");
LABEL_42:
        -[__CFString appendString:](v30, "appendString:", v31);
        goto LABEL_43;
      }
      ++v12;
LABEL_44:
      v13 = chars;

      ++v11;
    }
    while (v11 < v6);
  }
  -[__CFString appendString:](v5, "appendString:", CFSTR("</body></html>"));
  return v5;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

BOOL SUApplicationIsPlayable(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v16[4];
  unsigned int v17;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x24BEB2A60]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "bundleExecutable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("sinf"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v4, CFSTR("SC_Info"), v6, 0);
      objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v10);
        v13 = v12;
        if (v12)
        {
          v16[0] = objc_msgSend(v12, "length");
          v16[1] = objc_msgSend(objc_retainAutorelease(v13), "bytes");
          v16[2] = 0;
          v16[3] = 0;
          v17 = 0;
          if (__GetFairPlayContext_sOnce != -1)
            dispatch_once(&__GetFairPlayContext_sOnce, &__block_literal_global_2);
          XtCqEf5X(0, (uint64_t)&__GetFairPlayContext_sHardwareInfo, objc_msgSend((id)__GetFairPlayContext_sFolderPath, "UTF8String"), (uint64_t)&v17);
          HN0R(v17, (uint64_t)v16);
          v8 = v14 == 0;
        }
        else
        {
          v8 = 1;
        }

      }
      else
      {
        v8 = 1;
      }

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

id SUCopyLibraryIdentifierForURL(void *a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_msgSend(a1, "copyQueryStringDictionaryWithUnescapedValues:", 1);
  v2 = (id)objc_msgSend(v1, "objectForKey:", CFSTR("libraryid"));

  return v2;
}

CGColor *SUColorGetRGBA(CGColor *result, double *a2, double *a3, double *a4, double *a5)
{
  double v9;
  CGColor *v10;
  CGColorSpace *v11;
  const CGFloat *Components;
  size_t NumberOfComponents;
  double v14;
  double v15;
  double v16;
  uint64_t v17;

  v9 = 1.0;
  if (!result)
    goto LABEL_12;
  v10 = result;
  result = CGColorGetColorSpace(result);
  if (!result)
    goto LABEL_12;
  v11 = result;
  Components = CGColorGetComponents(v10);
  NumberOfComponents = CGColorGetNumberOfComponents(v10);
  result = (CGColor *)(int)CGColorSpaceGetModel(v11);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1 && NumberOfComponents >= 3)
    {
      v14 = *Components;
      v15 = Components[1];
      v16 = Components[2];
      if (NumberOfComponents != 3)
      {
        v17 = 3;
        goto LABEL_23;
      }
LABEL_13:
      if (!a2)
        goto LABEL_15;
      goto LABEL_14;
    }
LABEL_12:
    v14 = 1.0;
    v15 = 1.0;
    v16 = 1.0;
    goto LABEL_13;
  }
  if (!NumberOfComponents)
    goto LABEL_12;
  v14 = *Components;
  if (NumberOfComponents == 1)
  {
    v15 = *Components;
    v16 = *Components;
    if (!a2)
      goto LABEL_15;
LABEL_14:
    *a2 = v14;
    goto LABEL_15;
  }
  v17 = 1;
  v15 = *Components;
  v16 = *Components;
LABEL_23:
  v9 = Components[v17];
  if (a2)
    goto LABEL_14;
LABEL_15:
  if (a3)
    *a3 = v15;
  if (a4)
    *a4 = v16;
  if (a5)
    *a5 = v9;
  return result;
}

uint64_t SUCopyProgressStringForSeconds(uint64_t a1, int a2)
{
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v15;
  uint64_t v16;

  if (a1 >= 0)
    v4 = a1;
  else
    v4 = -a1;
  v5 = 60 * (v4 / 0x3C);
  v6 = v4 % 0x3C;
  v7 = v5 / 60 % 0x3CuLL;
  v8 = v5 - 60 * v7;
  v9 = v8 / 3600;
  v10 = v8 + 3599;
  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (a1 < 0)
  {
    if (a2)
    {
      if (v10 < 0x1C1F)
      {
        v13 = CFSTR("NEG_FULL_WIDTH_MINUTES_SECONDS");
        return objc_msgSend(v11, "initWithFormat:", objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24DE83F60, 0), v7, v6, v16);
      }
      v15 = CFSTR("NEGATIVE_FULL_WIDTH_HOURS_MINUTES_SECONDS");
    }
    else
    {
      if (v10 < 0x1C1F)
      {
        v13 = CFSTR("NEGATIVE_MINUTES_SECONDS");
        return objc_msgSend(v11, "initWithFormat:", objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24DE83F60, 0), v7, v6, v16);
      }
      v15 = CFSTR("NEGATIVE_HOURS_MINUTES_SECONDS");
    }
  }
  else if (a2)
  {
    if (v10 < 0x1C1F)
    {
      v13 = CFSTR("FULL_WIDTH_MINUTES_SECONDS");
      return objc_msgSend(v11, "initWithFormat:", objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24DE83F60, 0), v7, v6, v16);
    }
    v15 = CFSTR("FULL_WIDTH_HOURS_MINUTES_SECONDS");
  }
  else
  {
    if (v10 < 0x1C1F)
    {
      v13 = CFSTR("MINUTES_SECONDS");
      return objc_msgSend(v11, "initWithFormat:", objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24DE83F60, 0), v7, v6, v16);
    }
    v15 = CFSTR("HOURS_MINUTES_SECONDS");
  }
  return objc_msgSend(v11, "initWithFormat:", objc_msgSend(v12, "localizedStringForKey:value:table:", v15, &stru_24DE83F60, 0), v9, v7, v6);
}

const __CFDate *SUCopyDateStringForDate(const __CFDate *a1, CFDateFormatterStyle a2)
{
  const __CFDate *StringWithDate;
  const __CFLocale *v4;
  const __CFLocale *v5;
  __CFDateFormatter *v6;
  __CFDateFormatter *v7;

  StringWithDate = a1;
  if (a1)
  {
    v4 = CFLocaleCopyCurrent();
    if (v4)
    {
      v5 = v4;
      v6 = CFDateFormatterCreate(0, v4, a2, kCFDateFormatterNoStyle);
      if (v6)
      {
        v7 = v6;
        StringWithDate = (const __CFDate *)CFDateFormatterCreateStringWithDate(0, v6, StringWithDate);
        CFRelease(v7);
      }
      else
      {
        StringWithDate = 0;
      }
      CFRelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return StringWithDate;
}

id SUCopyLocalizedReviewsStringForCount(uint64_t a1, int a2)
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  const __CFString *v8;

  if (a1 == 1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (a2)
      v5 = CFSTR("ONE_REVIEW_CAPS");
    else
      v5 = CFSTR("ONE_REVIEW");
    return (id)objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DE83F60, 0);
  }
  if (!a1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (a2)
      v5 = CFSTR("NO_REVIEWS_IN_LISTING_CAPS");
    else
      v5 = CFSTR("NO_REVIEWS_IN_LISTING");
    return (id)objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DE83F60, 0);
  }
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (a2)
    v8 = CFSTR("REVIEW_COUNT_FORMAT_CAPS");
  else
    v8 = CFSTR("REVIEW_COUNT_FORMAT");
  return (id)objc_msgSend(v6, "initWithFormat:", objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24DE83F60, 0), a1);
}

id SUGetDataForDataURL(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB74A0]), "initWithURL:", a1);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __SUGetDataForDataURL_block_invoke;
  v9[3] = &unk_24DE7BB38;
  v9[5] = &v10;
  v9[6] = &v16;
  v9[4] = v5;
  v6 = (void *)objc_msgSend(v4, "dataTaskWithRequest:completionHandler:", v3, v9);
  if (v6)
  {
    objc_msgSend(v6, "resume");
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a2 && v11[5])
    *a2 = objc_msgSend((id)v17[5], "MIMEType");

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

void sub_21B4337EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t SUGetFormattedDecimalStringForNumber(uint64_t a1)
{
  void *v2;

  v2 = (void *)SUGetFormattedDecimalStringForNumber_sFormatter;
  if (!SUGetFormattedDecimalStringForNumber_sFormatter)
  {
    SUGetFormattedDecimalStringForNumber_sFormatter = (uint64_t)objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend((id)SUGetFormattedDecimalStringForNumber_sFormatter, "setNumberStyle:", 1);
    v2 = (void *)SUGetFormattedDecimalStringForNumber_sFormatter;
  }
  return objc_msgSend(v2, "stringFromNumber:", a1);
}

CFStringRef SUCopyUTIForFilePath(void *a1, int a2)
{
  __CFString *v4;
  const __CFString *v5;
  uint64_t v7;

  v4 = (__CFString *)objc_msgSend(a1, "pathExtension");
  v5 = v4;
  if (a2 && !-[__CFString caseInsensitiveCompare:](v4, "caseInsensitiveCompare:", CFSTR("zip")))
  {
    v7 = objc_msgSend((id)objc_msgSend(a1, "stringByDeletingPathExtension"), "pathExtension");
    if (v7)
      v5 = (const __CFString *)v7;
    if (v5)
      return UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v5, 0);
  }
  else if (v5)
  {
    return UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v5, 0);
  }
  return 0;
}

uint64_t SUOpenExternalURL(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v5 = (void *)objc_msgSend(v4, "URLOverrideForURL:", a1);
  v6 = (void *)objc_msgSend(a2, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_msgSend(v6, "clientInterface:isAllowedToOpenExternalURL:", a2, v5) & 1) == 0)
      return 0;
  }
  else if (!objc_msgSend(v5, "isSafeExternalURL"))
  {
    return 0;
  }
  return objc_msgSend(v4, "openSensitiveURL:withOptions:", v5, 0);
}

uint64_t SUOpenURLInClient(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  id v7;
  uint64_t v8;

  v6 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v7 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v6);
  if (!v7)
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C40]), "initWithDictionary:context:", 0, v6);
  v8 = objc_msgSend(v7, "URLForURL:clientIdentifier:", a1, a2);

  return SUOpenExternalURL(v8, a3);
}

void sub_21B435118(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_21B435838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 80));
  _Unwind_Resume(a1);
}

void sub_21B435924(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class initAMSBiometrics()
{
  Class result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_4);
  result = objc_getClass("AMSBiometrics");
  classAMSBiometrics = (uint64_t)result;
  getAMSBiometricsClass = (uint64_t (*)())AMSBiometricsFunction;
  return result;
}

id AMSBiometricsFunction()
{
  return (id)classAMSBiometrics;
}

Class initAMSUIPasswordSettingsViewController()
{
  Class result;

  if (AppleMediaServicesUILibrary_sOnce_0 != -1)
    dispatch_once(&AppleMediaServicesUILibrary_sOnce_0, &__block_literal_global_213);
  result = objc_getClass("AMSUIPasswordSettingsViewController");
  classAMSUIPasswordSettingsViewController = (uint64_t)result;
  getAMSUIPasswordSettingsViewControllerClass = (uint64_t (*)())AMSUIPasswordSettingsViewControllerFunction;
  return result;
}

id AMSUIPasswordSettingsViewControllerFunction()
{
  return (id)classAMSUIPasswordSettingsViewController;
}

void sub_21B437D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUGetReviewListBorderColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.894117647, 0.898039216, 0.901960784, 1.0);
}

uint64_t SUGetReviewListEvenRowColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.780392157, 0.792156863, 0.8, 1.0);
}

uint64_t SUGetReviewListOddRowColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.823529412, 0.835294118, 0.839215686, 1.0);
}

void sub_21B43DA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B43E378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B4403D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SUPurchaseBatchErrorEqual(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, "isEqual:compareUserInfo:", a2, 1);
}

uint64_t __SUPurchaseBatchAddModifiedError(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v4;

  v4 = a1;
  if (a2 >= 2)
    v4 = objc_msgSend(a3[1], "mergedErrorForError:withCount:", a1, a2);
  return objc_msgSend(*a3, "addObject:", v4);
}

void sub_21B441E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B441F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B442048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4425A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B442694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4429D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUConformsValidator(void *a1, const char *a2)
{
  return objc_msgSend(a1, "conformsToProtocol:", a2);
}

uint64_t SUISAValidator()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t SURespondsValidator()
{
  return objc_opt_respondsToSelector() & 1;
}

BOOL SUURLValidator(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a1);
  v3 = v2 != 0;

  return v3;
}

void SUJSObjectSetBooleanProperty(const OpaqueJSContext *a1, OpaqueJSValue *a2, CFStringRef string)
{
  JSStringRef v5;
  OpaqueJSString *v6;
  const OpaqueJSValue *Boolean;

  v5 = JSStringCreateWithCFString(string);
  if (v5)
  {
    v6 = v5;
    Boolean = JSValueMakeBoolean(a1, 1);
    JSObjectSetProperty(a1, a2, v6, Boolean, 0, 0);
    JSStringRelease(v6);
  }
}

uint64_t SUScriptPropertyListFromString(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(a1, "dataUsingEncoding:", 4);
  v11 = 0;
  v2 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v1, 0, 0, &v11);
  if (v11)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v12 = 138412290;
      v13 = v11;
      LODWORD(v10) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v12, v10);
        free(v8);
        SSFileLog();
      }
    }
  }
  return v2;
}

uint64_t SUWebScriptAddPropertyKeysToArray(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 >= 1)
  {
    v13 = v6;
    v14 = v5;
    v15 = v4;
    v16 = v3;
    v17 = v7;
    v18 = v8;
    v9 = a3;
    v10 = (void *)result;
    v11 = (uint64_t *)(a2 + 8);
    do
    {
      v12 = *v11;
      v11 += 2;
      result = objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12, v13, v14, v15, v16, v17, v18));
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t SUWebScriptNameForKey(char *__s2, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const char **i;

  if (a3 < 1)
    return 0;
  v3 = a3;
  for (i = (const char **)(a2 + 8); strcmp(*i, __s2); i += 2)
  {
    if (!--v3)
      return 0;
  }
  return (uint64_t)*(i - 1);
}

uint64_t SUWebScriptNameForSelector(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t i;
  const char *v6;

  if (!a3)
    return 0;
  v3 = a3;
  for (i = a2 + 8; ; i += 16)
  {
    v6 = NSSelectorFromString(*(NSString **)(i - 8));
    if (sel_isEqual(a1, v6))
      break;
    if (!--v3)
      return 0;
  }
  return *(_QWORD *)i;
}

uint64_t SUWebScriptNameForSelector2(SEL lhs, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t i;

  if (a3 < 1)
    return 0;
  v3 = a3;
  for (i = a2 + 8; !sel_isEqual(lhs, *(SEL *)(i - 8)); i += 16)
  {
    if (!--v3)
      return 0;
  }
  return *(_QWORD *)i;
}

void sub_21B445350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B445438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B445538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44566C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B445AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUScriptObjectDispatchEventForName(void *a1, _QWORD *a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "dispatchEvent:forName:", *a2, a2[1]);
  return result;
}

id SUScriptObjectGetImageURL(void *a1)
{
  return objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.SUScriptObject.imageURL");
}

Class initAKAppleIDAuthenticationInAppContext()
{
  Class result;

  if (AuthKitUILibrary_sOnce != -1)
    dispatch_once(&AuthKitUILibrary_sOnce, &__block_literal_global_7);
  result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  classAKAppleIDAuthenticationInAppContext = (uint64_t)result;
  getAKAppleIDAuthenticationInAppContextClass = (uint64_t (*)())AKAppleIDAuthenticationInAppContextFunction;
  return result;
}

id AKAppleIDAuthenticationInAppContextFunction()
{
  return (id)classAKAppleIDAuthenticationInAppContext;
}

Class initAKAppleIDAuthenticationController()
{
  Class result;

  if (AuthKitLibrary_sOnce != -1)
    dispatch_once(&AuthKitLibrary_sOnce, &__block_literal_global_49);
  result = objc_getClass("AKAppleIDAuthenticationController");
  classAKAppleIDAuthenticationController = (uint64_t)result;
  getAKAppleIDAuthenticationControllerClass = (uint64_t (*)())AKAppleIDAuthenticationControllerFunction;
  return result;
}

id AKAppleIDAuthenticationControllerFunction()
{
  return (id)classAKAppleIDAuthenticationController;
}

void sub_21B44A444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B44A6CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21B44B494(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_21B44BD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B44CD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44CE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44CF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B44D088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44D198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44D29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SUAutocapitalizationTypeForString(void *a1)
{
  if (!a1)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("sentences")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("none")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("words")) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("all")))
    return 3;
  return -1;
}

uint64_t __SUAutocorrectionTypeForString(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "isEqualToString:", CFSTR("default")) & 1) != 0)
    {
      return 0;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("no")) & 1) != 0)
    {
      return 1;
    }
    else if (objc_msgSend(v1, "isEqualToString:", CFSTR("yes")))
    {
      return 2;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

uint64_t __SUKeyboardTypeForString(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "isEqualToString:", CFSTR("default")) & 1) != 0)
    {
      return 0;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("email")) & 1) != 0)
    {
      return 7;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("number")) & 1) != 0)
    {
      return 2;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tel")) & 1) != 0)
    {
      return 5;
    }
    else if (objc_msgSend(v1, "isEqualToString:", CFSTR("url")))
    {
      return 3;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

void sub_21B44DD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44DE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44DF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B44F27C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21B450008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __AddObjectToNSMutableSet(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", a1);
}

void sub_21B4519A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4520E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B452230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B452380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B452F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B453074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45317C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B453254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B453358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __SUButtonValidator(void *a1)
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "title");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = 0;
  else
    v2 = (void *)objc_msgSend(a1, "title");
  if (objc_msgSend(v2, "length"))
    return 1;
  objc_msgSend(a1, "image");
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(a1, "image") != 0;
}

void sub_21B456568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_21B45B864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

uint64_t __SUOrientationValidator(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return SUOrientationStringIsValid(a1);
  else
    return 0;
}

void sub_21B45C7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B45DE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B45DF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45E0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45E1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45EDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45EED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45F000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45F130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B45F248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B461F4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21B462924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B462ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B462C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B462D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B462E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46318C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46330C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B463570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B463678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B464118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46424C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B464528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4646AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4647D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B465ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B466400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4665FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4666F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4667F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B466910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B466A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B466B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B466C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_21B466DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B466F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4670BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4671F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B468FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46910C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46A254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B46A360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46A570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46A68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46B66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B46B938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B46C524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46C9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B46CED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B475BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B475D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B475E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4768D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4769D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B476B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B476C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B476DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B476EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B476F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B478888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4789BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B478AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B478DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B479140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGColorRef SUCreateColorFromStyleString(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  unint64_t v10;
  CGColorSpace *DeviceRGB;
  int8x16_t v12;
  CGColor *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  CGColorSpace *v23;
  int8x16_t v24;
  void *v25;
  float64x2_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "hasPrefix:", CFSTR("#")))
  {
    v2 = (void *)objc_msgSend(a1, "substringFromIndex:", 1);
    v3 = objc_msgSend(v2, "length");
    v4 = v3;
    if (v3 == 6 || v3 == 3)
    {
      v5 = 0;
      v6 = 0;
      while (1)
      {
        v7 = objc_msgSend(v2, "characterAtIndex:", v6);
        if ((v7 - 48) >= 0xAu && ((v7 | 0x20) - 97) > 5u)
          break;
        if (v7 >= 65)
          v9 = (v7 + 9) & 0xF;
        else
          v9 = (v7 - 48);
        v5 = v9 | (16 * v5);
        if (v4 == ++v6)
        {
          if (v4 == 3)
            v10 = ((v5 & 0xF00) << 12) & 0xFFFFFFFFFFF00FF0 | ((unint64_t)(v5 >> 4) << 12) | (16 * (v5 & 0xF0 | (unint64_t)(v9 & 0xF))) | v9 & 0xF;
          else
            v10 = v5;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          v12.i64[0] = 255;
          v12.i64[1] = 255;
          v26 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v10), (uint64x2_t)xmmword_21B5583F0), v12))), (float32x2_t)vdup_n_s32(0x437F0000u)));
          v27 = (float)((float)v10 / 255.0);
          v28 = 0x3FF0000000000000;
          v13 = CGColorCreate(DeviceRGB, v26.f64);
          CGColorSpaceRelease(DeviceRGB);
          return v13;
        }
      }
    }
    return 0;
  }
  if (objc_msgSend(a1, "hasPrefix:", CFSTR("rgb("))
    && objc_msgSend(a1, "hasSuffix:", CFSTR(")")))
  {
    v14 = objc_msgSend(a1, "length") - 5;
    v15 = a1;
    v16 = 4;
    return __SUCreateColorFromRGBAString((void *)objc_msgSend(v15, "substringWithRange:", v16, v14));
  }
  if (objc_msgSend(a1, "hasPrefix:", CFSTR("rgba("))
    && objc_msgSend(a1, "hasSuffix:", CFSTR(")")))
  {
    v14 = objc_msgSend(a1, "length") - 6;
    v15 = a1;
    v16 = 5;
    return __SUCreateColorFromRGBAString((void *)objc_msgSend(v15, "substringWithRange:", v16, v14));
  }
  if (objc_msgSend(a1, "hasPrefix:", CFSTR("hsl("))
    && objc_msgSend(a1, "hasSuffix:", CFSTR(")")))
  {
    v18 = objc_msgSend(a1, "length") - 5;
    v19 = a1;
    v20 = 4;
    return __SUCreateColorFromHSLAString((void *)objc_msgSend(v19, "substringWithRange:", v20, v18));
  }
  if ((objc_msgSend(a1, "hasPrefix:", CFSTR("hsla(")) & 1) != 0
    && objc_msgSend(a1, "hasSuffix:", CFSTR(")")))
  {
    v18 = objc_msgSend(a1, "length") - 6;
    v19 = a1;
    v20 = 5;
    return __SUCreateColorFromHSLAString((void *)objc_msgSend(v19, "substringWithRange:", v20, v18));
  }
  v21 = 0;
  while ((-[__CFString isEqualToString:](*(__CFString **)((char *)&__NamedColors + v21), "isEqualToString:", a1) & 1) == 0)
  {
    v21 += 16;
    if (v21 == 272)
      goto LABEL_37;
  }
  v22 = *(unint64_t *)((char *)&__NamedColors + v21 + 8);
  v23 = CGColorSpaceCreateDeviceRGB();
  v24.i64[0] = 255;
  v24.i64[1] = 255;
  v26 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v22), (uint64x2_t)xmmword_21B5583F0), v24))), (float32x2_t)vdup_n_s32(0x437F0000u)));
  v27 = (float)((float)v22 / 255.0);
  v28 = 0x3FF0000000000000;
  v13 = CGColorCreate(v23, v26.f64);
  CGColorSpaceRelease(v23);
  if (v13)
    return v13;
LABEL_37:
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("x-apple-ios-pinstripe")))
  {
    v25 = (void *)_UIPinStripeImageColorRef();
  }
  else if (objc_msgSend(a1, "isEqualToString:", CFSTR("x-apple-ios-scrollview-texture")))
  {
    v25 = (void *)objc_msgSend(MEMORY[0x24BDF6950], "scrollViewTexturedBackgroundColor");
  }
  else
  {
    if (!objc_msgSend(a1, "isEqualToString:", CFSTR("x-apple-ios-underpage-background")))
    {
      v13 = 0;
      goto LABEL_44;
    }
    v25 = (void *)objc_msgSend(MEMORY[0x24BDF6950], "underPageBackgroundColor");
  }
  v13 = (CGColor *)objc_msgSend(v25, "CGColor");
LABEL_44:
  CGColorRetain(v13);
  return v13;
}

CGColorRef __SUCreateColorFromRGBAString(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  CGColorSpace *DeviceRGB;
  CGColorRef v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
  v2 = objc_msgSend(v1, "count");
  if ((unint64_t)(v2 - 3) > 1)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v5 = 0;
  v10 = xmmword_21B558408;
  v11 = unk_21B558418;
  do
  {
    v6 = fmax(__SUFloatValueFromCSSString((void *)objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", v5, v10, v11), "stringByTrimmingCharactersInSet:", v4)), 0.0);
    if (v6 > 1.0)
      v6 = 1.0;
    *((double *)&v10 + v5++) = v6;
  }
  while (v3 != v5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CGColorCreate(DeviceRGB, (const CGFloat *)&v10);
  CGColorSpaceRelease(DeviceRGB);
  return v8;
}

CGColorRef __SUCreateColorFromHSLAString(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGColorRef v11;

  v1 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
  v2 = objc_msgSend(v1, "count");
  if ((unint64_t)(v2 - 3) > 1)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v5 = (int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 0), "stringByTrimmingCharactersInSet:", v4), "intValue")% 360;
  if (v5 > 0xFFFFFE97)
    v5 += 360;
  v6 = (float)((float)v5 / 360.0);
  v7 = __SUFloatValueFromCSSString((void *)objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 1), "stringByTrimmingCharactersInSet:", v4));
  v8 = __SUFloatValueFromCSSString((void *)objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 2), "stringByTrimmingCharactersInSet:", v4));
  v9 = 1.0;
  if (v3 == 4)
    v9 = __SUFloatValueFromCSSString((void *)objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 3), "stringByTrimmingCharactersInSet:", v4));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithHue:saturation:brightness:alpha:", v6, v7, v8, v9);
  v11 = CGColorRetain((CGColorRef)objc_msgSend(v10, "CGColor"));

  return v11;
}

double __SUFloatValueFromCSSString(void *a1)
{
  float v2;
  float v3;
  uint64_t v4;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("%")))
  {
    v2 = (float)(int)objc_msgSend((id)objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1), "intValue");
    v3 = 100.0;
    return (float)(v2 / v3);
  }
  v4 = objc_msgSend(a1, "rangeOfString:", CFSTR("."));
  objc_msgSend(a1, "floatValue");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 255.0;
    return (float)(v2 / v3);
  }
  return v2;
}

void sub_21B47DC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void sub_21B47DD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47DEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47E020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47E23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47E378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47E4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47E610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47E768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47EFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B47F0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUScriptNavigationItemIsFlagged(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.SUScriptNavigationItem.flagged");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

void SUScriptNavigationItemSetFlagged(void *a1, uint64_t a2)
{
  void *v3;
  id object;

  object = a1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", a2);
  if (object)
    objc_setAssociatedObject(object, "com.apple.iTunesStoreUI.SUScriptNavigationItem.flagged", v3, (void *)1);

}

void sub_21B480C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B480F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__20(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B48154C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B481B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B482030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B48252C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21B482DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B483C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B483F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B484384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4845E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4848C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B484B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B484C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B48588C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B485994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B485D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B486398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4864F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B486600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B486CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B486FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

BOOL __SUMediaTypeValidator(uint64_t a1)
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && +[SUScriptMediaItem nativeMediaTypesForScriptMediaTypes:](SUScriptMediaItem, "nativeMediaTypesForScriptMediaTypes:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a1)) != 0;
}

void sub_21B487218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B487328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B487440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B488334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B48843C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4885C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B48872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B488884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B48A5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__28(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B48A6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B48C1A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __CallPurchaseCallback(uint64_t a1, int a2, SUScriptError *a3)
{
  SUScriptError *v3;
  SUScriptFunction *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];

  v3 = a3;
  v9[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a3);
  v6 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a1);
  -[SUScriptFunction setThisObject:](v6, "setThisObject:", objc_msgSend(MEMORY[0x24BDFA958], "undefined"));
  v7 = (_QWORD *)MEMORY[0x24BDBD270];
  if (!a2)
    v7 = (_QWORD *)MEMORY[0x24BDBD268];
  v9[0] = *v7;
  v8 = (uint64_t)v3;
  if (!v3)
    v8 = objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  v9[1] = v8;
  -[SUScriptFunction callWithArguments:](v6, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2));

}

void sub_21B48E82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4901B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__31(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B490390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B490494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4907B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B49088C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4909AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B490F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__32(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_21B492250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__34(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4923A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4924E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4925C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4926A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B492794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B49289C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4929C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B492AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4934C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4935AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4936BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4937AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B494F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__35(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B498A1C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21B4989E8);
  }
  _Unwind_Resume(a1);
}

void sub_21B498B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__36(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__36(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B49911C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initAKAppleIDServerResourceLoadDelegate()
{
  Class result;

  if (AuthKitLibrary_sOnce_0 != -1)
    dispatch_once(&AuthKitLibrary_sOnce_0, &__block_literal_global_424);
  result = objc_getClass("AKAppleIDServerResourceLoadDelegate");
  classAKAppleIDServerResourceLoadDelegate = (uint64_t)result;
  getAKAppleIDServerResourceLoadDelegateClass = AKAppleIDServerResourceLoadDelegateFunction;
  return result;
}

uint64_t AKAppleIDServerResourceLoadDelegateFunction()
{
  return classAKAppleIDServerResourceLoadDelegate;
}

uint64_t SUInterfaceOrientationForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("landscape-left")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("landscape-right")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("portrait-upside-down")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

__CFString *SUOrientationStringForDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_24DE7D118[a1 - 1];
}

uint64_t SUOrientationStringIsValid(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("landscape-left")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("landscape-right")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("portrait")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("portrait-upside-down"));
  }

  return v2;
}

void sub_21B49A490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B49A63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__37(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B49F8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B49FDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4A1014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __InterpolateGradient(void *a1, double *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double *v15;
  double v16;

  if (!objc_msgSend(a1, "count"))
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  v6 = objc_msgSend(a1, "objectAtIndex:", 0);
  result = objc_msgSend(a1, "lastObject");
  v8 = *a2;
  if (*a2 <= 0.0 || v8 <= *(double *)(v6 + 40))
  {
    *(_QWORD *)a3 = *(_QWORD *)(v6 + 8);
    *(_QWORD *)(a3 + 8) = *(_QWORD *)(v6 + 16);
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(v6 + 24);
    v14 = *(double *)(v6 + 32);
  }
  else if (v8 >= 1.0 || v8 >= *(double *)(result + 40))
  {
    *(_QWORD *)a3 = *(_QWORD *)(result + 8);
    *(_QWORD *)(a3 + 8) = *(_QWORD *)(result + 16);
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(result + 24);
    v14 = *(double *)(result + 32);
  }
  else
  {
    v9 = objc_msgSend(a1, "count");
    if (v9 < 1)
    {
      v12 = 0;
    }
    else
    {
      v11 = v9;
      v12 = 0;
      while (1)
      {
        v13 = objc_msgSend(a1, "objectAtIndex:", v12);
        v10 = *a2;
        if (*a2 < *(double *)(v13 + 40))
          break;
        if (v11 == ++v12)
        {
          v12 = v11;
          break;
        }
      }
    }
    v15 = (double *)objc_msgSend(a1, "objectAtIndex:", v12 - 1, v10);
    result = objc_msgSend(a1, "objectAtIndex:", v12);
    v16 = (*a2 - v15[5]) / (*(double *)(result + 40) - v15[5]);
    *(double *)a3 = v15[1] + (*(double *)(result + 8) - v15[1]) * v16;
    *(double *)(a3 + 8) = v15[2] + (*(double *)(result + 16) - v15[2]) * v16;
    *(double *)(a3 + 16) = v15[3] + (*(double *)(result + 24) - v15[3]) * v16;
    v14 = v15[4] + (*(double *)(result + 32) - v15[4]) * v16;
  }
  *(double *)(a3 + 24) = v14;
  return result;
}

uint64_t SUGradientColorIsPatternColor(void *a1, _QWORD *a2)
{
  id AssociatedObject;
  uint64_t result;
  id v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedObject = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.SUGradient.iscolor");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  result = objc_msgSend(AssociatedObject, "BOOLValue");
  if (a2 && (_DWORD)result)
  {
    v6 = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.SUGradient.size");
    if (v6)
    {
      objc_msgSend(v6, "CGSizeValue");
      *a2 = v7;
      a2[1] = v8;
    }
    else
    {
      *(_OWORD *)a2 = *MEMORY[0x24BDBF148];
    }
    return 1;
  }
  return result;
}

void sub_21B4A3260(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21B4A4444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__40(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t SUBarButtonItemApplyStyling(uint64_t a1)
{
  return objc_msgSend(+[SUUIAppearance defaultAppearance](SUUIAppearance, "defaultAppearance"), "styleBarButtonItem:", a1);
}

uint64_t SUNavigationBarApplyStyling(uint64_t a1)
{
  return objc_msgSend(+[SUUIAppearance defaultAppearance](SUUIAppearance, "defaultAppearance"), "styleNavigationBar:", a1);
}

uint64_t SUNavigationBarRemoveStyling(void *a1)
{
  objc_msgSend(a1, "_setBackButtonBackgroundImage:mini:forStates:", 0, 0, 0);
  objc_msgSend(a1, "_setBackButtonBackgroundImage:mini:forStates:", 0, 0, 1);
  objc_msgSend(a1, "setBackgroundImage:forBarMetrics:", 0, 0);
  objc_msgSend(a1, "setBackgroundImage:forBarMetrics:", 0, 1);
  objc_msgSend(a1, "setTitleTextAttributes:", 0);
  objc_msgSend(a1, "_setButtonItemTextColor:shadowColor:", 0, 0);
  return objc_msgSend(a1, "_setButtonTextShadowOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

void SUNavigationItemRemoveButton(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v4 = (void *)objc_msgSend(a1, "leftBarButtonItems");
  if (v4 && (v5 = v4, v6 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", a2), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = v6;
    v12 = (id)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v12, "removeObjectAtIndex:", v10);
    objc_msgSend(a1, "setLeftBarButtonItems:", v12);

  }
  else
  {
    v7 = (void *)objc_msgSend(a1, "rightBarButtonItems");
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", a2);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v9;
        v13 = (id)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v13, "removeObjectAtIndex:", v11);
        objc_msgSend(a1, "setRightBarButtonItems:", v13);

      }
    }
  }
}

void sub_21B4A7BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__41(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4A8884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4AB498(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21B4AB4B8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21B4AB470);
}

SUBackgroundTaskOperation *SUMakeBackgroundTask(uint64_t a1, uint64_t a2)
{
  return -[SUBackgroundTaskOperation initWithOperation:identifier:]([SUBackgroundTaskOperation alloc], "initWithOperation:identifier:", a1, a2);
}

BOOL SUItemTypeIsMediaType(uint64_t a1)
{
  return (unint64_t)(a1 - 1000) < 0xC;
}

uint64_t SUItemTypeIsVideoType(uint64_t a1)
{
  return ((unint64_t)(a1 - 1002) < 9) & (0x183u >> (a1 + 22));
}

uint64_t SUTableCellGetMediaIcon(uint64_t a1, int a2)
{
  const __CFString *v2;

  if (!a2)
  {
    if (a1 == 1)
    {
      v2 = CFSTR("MediaTypeRingtone.png");
      return objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v2, objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
    }
    if (a1 == 2)
    {
      v2 = CFSTR("MediaTypeVideo.png");
      return objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v2, objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
    }
    return 0;
  }
  if (a1 == 1)
  {
    v2 = CFSTR("MediaTypeRingtoneSelected.png");
    return objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v2, objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
  }
  if (a1 != 2)
    return 0;
  v2 = CFSTR("MediaTypeVideoSelected.png");
  return objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v2, objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
}

SUImageDataProvider *SUTableCellCopyImageProviderForSize(double a1, double a2)
{
  return SUTableCellCopyImageProviderForSizeWithStrokedEdges(a1, a2, 0.0, 0.0, 0.0, 1.0);
}

SUImageDataProvider *SUTableCellCopyImageProviderForSizeWithStrokedEdges(double a1, double a2, double a3, double a4, double a5, double a6)
{
  SUImageDataProvider *v12;
  SUStrokeEdgesImageModifier *v13;
  SUFrameAdjustmentImageModifier *v14;
  SUArrayImageModifier *v15;

  v12 = objc_alloc_init(SUImageDataProvider);
  -[SUImageDataProvider setFillColor:](v12, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
  -[SUImageDataProvider setFinalSize:](v12, "setFinalSize:", a1, a2);
  v13 = objc_alloc_init(SUStrokeEdgesImageModifier);
  -[SUStrokeEdgesImageModifier setEdgeInsets:](v13, "setEdgeInsets:", a3, a4, a5, a6);
  -[SUStrokeEdgesImageModifier setStrokeColor:](v13, "setStrokeColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.150000006));
  v14 = objc_alloc_init(SUFrameAdjustmentImageModifier);
  -[SUFrameAdjustmentImageModifier setShouldSizeDownToFit:](v14, "setShouldSizeDownToFit:", 1);
  -[SUFrameAdjustmentImageModifier setSizingMask:](v14, "setSizingMask:", 45);
  v15 = objc_alloc_init(SUArrayImageModifier);
  -[SUArrayImageModifier setModifiers:](v15, "setModifiers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v14, v13, 0));
  -[SUImageDataProvider setModifier:](v12, "setModifier:", v15);

  return v12;
}

uint64_t SUTableCellGetCleanColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.266666667, 1.0);
}

uint64_t SUTableCellGetExplicitColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.8, 0.0, 0.0, 1.0);
}

uint64_t SUTableCellGetHighlightedTextColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.321568627, 0.91372549, 1.0);
}

Class initICStoreRequestContext()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICStoreRequestContext");
  classICStoreRequestContext = (uint64_t)result;
  getICStoreRequestContextClass[0] = (uint64_t (*)())ICStoreRequestContextFunction;
  return result;
}

id ICStoreRequestContextFunction()
{
  return (id)classICStoreRequestContext;
}

void *__iTunesCloudLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 2);
  iTunesCloudLibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initICUserIdentity_0()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICUserIdentity");
  classICUserIdentity_0 = (uint64_t)result;
  getICUserIdentityClass_0[0] = (uint64_t (*)())ICUserIdentityFunction_0;
  return result;
}

id ICUserIdentityFunction_0()
{
  return (id)classICUserIdentity_0;
}

Class initICUserIdentityStore()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICUserIdentityStore");
  classICUserIdentityStore = (uint64_t)result;
  getICUserIdentityStoreClass[0] = (uint64_t (*)())ICUserIdentityStoreFunction;
  return result;
}

id ICUserIdentityStoreFunction()
{
  return (id)classICUserIdentityStore;
}

Class initICURLResponseAuthenticationProvider()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICURLResponseAuthenticationProvider");
  classICURLResponseAuthenticationProvider = (uint64_t)result;
  getICURLResponseAuthenticationProviderClass[0] = (uint64_t (*)())ICURLResponseAuthenticationProviderFunction;
  return result;
}

id ICURLResponseAuthenticationProviderFunction()
{
  return (id)classICURLResponseAuthenticationProvider;
}

Class initICMusicSubscriptionStatusRequest()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICMusicSubscriptionStatusRequest");
  classICMusicSubscriptionStatusRequest = (uint64_t)result;
  getICMusicSubscriptionStatusRequestClass[0] = (uint64_t (*)())ICMusicSubscriptionStatusRequestFunction;
  return result;
}

id ICMusicSubscriptionStatusRequestFunction()
{
  return (id)classICMusicSubscriptionStatusRequest;
}

Class initICMusicSubscriptionStatusController()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICMusicSubscriptionStatusController");
  classICMusicSubscriptionStatusController = (uint64_t)result;
  getICMusicSubscriptionStatusControllerClass[0] = (uint64_t (*)())ICMusicSubscriptionStatusControllerFunction;
  return result;
}

id ICMusicSubscriptionStatusControllerFunction()
{
  return (id)classICMusicSubscriptionStatusController;
}

Class initICMusicSubscriptionStatusMonitor_0()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_0 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_0, &__block_literal_global_97);
  result = objc_getClass("ICMusicSubscriptionStatusMonitor");
  classICMusicSubscriptionStatusMonitor_0 = (uint64_t)result;
  getICMusicSubscriptionStatusMonitorClass_0 = (uint64_t (*)())ICMusicSubscriptionStatusMonitorFunction_0;
  return result;
}

id ICMusicSubscriptionStatusMonitorFunction_0()
{
  return (id)classICMusicSubscriptionStatusMonitor_0;
}

SUDelayedQuitController *_create_shared_instance()
{
  SUDelayedQuitController *result;

  result = objc_alloc_init(SUDelayedQuitController);
  __SharedInstance_4 = (uint64_t)result;
  return result;
}

void sub_21B4BA004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4BA2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4BA3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4BAC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4BB580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21B4BB704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4BB8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4BB9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4BBB9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21B4BD6B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21B4C2BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__43(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4C4CC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21B4C50CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B4C5C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__44(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4C646C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C6EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C72D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__45(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4C7418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4C7510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUCreatePreviewHistoryOperation(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  v3 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v3, "setURLBagKey:", CFSTR("updatePreviewHistoryBaseUrl"));
  objc_msgSend(v3, "setValue:forRequestParameter:", CFSTR("add"), CFSTR("action"));
  objc_msgSend(v3, "setValue:forRequestParameter:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), a1), CFSTR("ids"));
  objc_msgSend(v2, "setRequestProperties:", v3);

  return v2;
}

void sub_21B4CF2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__46(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__46(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t SUSLRequestClass()
{
  return ISWeakLinkedClassForString();
}

uint64_t SUSLServiceTypeFacebook()
{
  return ISWeakLinkedStringConstantForString();
}

void sub_21B4D2D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__47(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__47(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4D2E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUACAccountStoreClass()
{
  return ISWeakLinkedClassForString();
}

uint64_t SUACAccountTypeIdentifierFacebook()
{
  return ISWeakLinkedStringConstantForString();
}

uint64_t SUACAccountTypeIdentifierSinaWeibo()
{
  return ISWeakLinkedStringConstantForString();
}

uint64_t SUACAccountTypeIdentifierTwitter()
{
  return 0;
}

uint64_t SUACFacebookAppIdKey()
{
  return ISWeakLinkedStringConstantForString();
}

uint64_t SUACFacebookPermissionsKey()
{
  return ISWeakLinkedStringConstantForString();
}

const __CFString *SUACPurposeStatementKey()
{
  return CFSTR("ACPurposeStatementKey");
}

void sub_21B4D6630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__48(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4D691C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4D8E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B4D90CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initICUserIdentity_1()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_1 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_1, &__block_literal_global_26);
  result = objc_getClass("ICUserIdentity");
  classICUserIdentity_1 = (uint64_t)result;
  getICUserIdentityClass_1 = (uint64_t (*)())ICUserIdentityFunction_1;
  return result;
}

id ICUserIdentityFunction_1()
{
  return (id)classICUserIdentity_1;
}

void *__iTunesCloudLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 2);
  iTunesCloudLibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initICMusicSubscriptionStatusMonitor_1()
{
  Class result;

  if (iTunesCloudLibrary_sOnce_1 != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce_1, &__block_literal_global_26);
  result = objc_getClass("ICMusicSubscriptionStatusMonitor");
  classICMusicSubscriptionStatusMonitor_1 = (uint64_t)result;
  getICMusicSubscriptionStatusMonitorClass_1 = (uint64_t (*)())ICMusicSubscriptionStatusMonitorFunction_1;
  return result;
}

id ICMusicSubscriptionStatusMonitorFunction_1()
{
  return (id)classICMusicSubscriptionStatusMonitor_1;
}

uint64_t ISUIMobileStoreUIFramework()
{
  if (ISUIMobileStoreUIFramework_sOnce != -1)
    dispatch_once(&ISUIMobileStoreUIFramework_sOnce, &__block_literal_global_16);
  return ISUIMobileStoreUIFramework_sHandle;
}

id ISUIWeakLinkedClassForString(NSString *a1, uint64_t a2)
{
  if (!a2)
    return 0;
  NSClassFromString(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id *ISUIVWeakLinkedStringConstantForString(char *__symbol, void *__handle)
{
  id *v2;

  if (__handle)
  {
    v2 = (id *)dlsym(__handle, __symbol);
    if (v2)
      return (id *)*v2;
  }
  else
  {
    NSLog(CFSTR("Could not load library [%ld]"), 0);
    v2 = 0;
  }
  return v2;
}

void __Block_byref_object_copy__49(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4DA0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DA1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DA2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DA484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DA5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DAC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DC510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__50(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4DC7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DC900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DCA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DCB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4DDB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__51(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id SUPreviewOverlayForViewController(void *a1)
{
  id result;

  if (!objc_msgSend(a1, "isDescendantOfViewController:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow"), "rootViewController")))return 0;
  result = +[SUClientDispatch previewOverlayViewController](SUClientDispatch, "previewOverlayViewController");
  if (!result)
    return (id)objc_msgSend(+[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"), "previewOverlay");
  return result;
}

void *SUViewFirstUIScrollView(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", a1, 0);
  v2 = objc_msgSend(v1, "count");
  if (v2 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(v1, "objectAtIndex:", v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v6;
      }
      else
      {
        v7 = objc_msgSend(v6, "subviews");
        if (v7)
        {
          objc_msgSend(v1, "addObjectsFromArray:", v7);
          v3 = objc_msgSend(v1, "count");
        }
      }
      ++v4;
    }
    while (v4 < v3);
  }

  return v5;
}

double SUPreviewOverlayScrollViewIsPreviewAdjusted(void *a1)
{
  id AssociatedObject;
  double result;

  AssociatedObject = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.previewAdjusted");
  if (!AssociatedObject)
    return *MEMORY[0x24BDF7718];
  objc_msgSend(AssociatedObject, "UIEdgeInsetsValue");
  return result;
}

void SUPreviewOverlayScrollViewSetPreviewAdjusted(void *a1, double a2, double a3, double a4, double a5)
{
  id AssociatedObject;
  double v11;
  double v12;
  double v13;
  double v14;

  AssociatedObject = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.previewAdjusted");
  if (AssociatedObject)
  {
    objc_msgSend(AssociatedObject, "UIEdgeInsetsValue");
  }
  else
  {
    v11 = *MEMORY[0x24BDF7718];
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v13 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  if (v12 != a3 || v11 != a2 || v14 != a5 || v13 != a4)
    objc_setAssociatedObject(a1, "com.apple.iTunesStoreUI.previewAdjusted", (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a2, a3, a4, a5), (void *)1);
}

double SUUIScrollViewGetDefaultContentInset(void *a1)
{
  id AssociatedObject;
  double result;

  AssociatedObject = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.defaultContentInset");
  if (!AssociatedObject)
    return *MEMORY[0x24BDF7718];
  objc_msgSend(AssociatedObject, "UIEdgeInsetsValue");
  return result;
}

void SUUIScrollViewSetDefaultContentInset(void *a1, double a2, double a3, double a4, double a5)
{
  id AssociatedObject;
  double v11;
  double v12;
  double v13;
  double v14;

  AssociatedObject = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.defaultContentInset");
  if (AssociatedObject)
  {
    objc_msgSend(AssociatedObject, "UIEdgeInsetsValue");
  }
  else
  {
    v11 = *MEMORY[0x24BDF7718];
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v13 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  if (v12 != a3 || v11 != a2 || v14 != a5 || v13 != a4)
  {
    objc_msgSend(a1, "setContentInset:", a2, a3, a4, a5);
    objc_setAssociatedObject(a1, "com.apple.iTunesStoreUI.defaultContentInset", (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a2, a3, a4, a5), (void *)1);
  }
}

SUButtonAction *SUButtonActionAttachToBarButtonItem(void *a1)
{
  SUButtonAction *v2;

  v2 = objc_alloc_init(SUButtonAction);
  objc_msgSend(a1, "setAction:", sel__buttonAction_);
  objc_msgSend(a1, "setTarget:", v2);
  objc_setAssociatedObject(a1, "com.apple.iTunesStoreUI.buttonAction", v2, (void *)1);
  return v2;
}

uint64_t SUButtonActionDeactivateNavigationItem(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(a1, "leftBarButtonItems");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(objc_getAssociatedObject(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "com.apple.iTunesStoreUI.buttonAction"), "_setActivated:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }
  v7 = (void *)objc_msgSend(a1, "rightBarButtonItems");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(objc_getAssociatedObject(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "com.apple.iTunesStoreUI.buttonAction"), "_setActivated:", 0);
      }
      while (v9 != v11);
      result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

id SUButtonActionPopFromBarButtonItem(void *a1)
{
  id v2;

  v2 = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.buttonAction");
  if ((id)objc_msgSend(a1, "target") == v2)
  {
    objc_msgSend(a1, "setAction:", 0);
    objc_msgSend(a1, "setTarget:", 0);
  }
  objc_setAssociatedObject(a1, "com.apple.iTunesStoreUI.buttonAction", 0, (void *)1);
  return v2;
}

uint64_t SUSLFacebookGraphUtilsClass()
{
  return ISWeakLinkedClassForString();
}

void _callTwoArgumentFunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  SUScriptFacebookLikeStatus *v8;
  SUScriptError *v9;
  SUScriptFunction *v10;

  v10 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a1);
  -[SUScriptFunction setThisObject:](v10, "setThisObject:", a2);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!a3)
  {
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDFA958], "undefined"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDFA958], "undefined"));
    goto LABEL_6;
  }
  v8 = -[SUScriptFacebookLikeStatus initWithLikeStatusDictionary:]([SUScriptFacebookLikeStatus alloc], "initWithLikeStatusDictionary:", a3);
  objc_msgSend(v7, "addObject:", v8);

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a4);
  objc_msgSend(v7, "addObject:", v9);

LABEL_6:
  -[SUScriptFunction callWithArguments:](v10, "callWithArguments:", v7);

  -[SUScriptFunction setThisObject:](v10, "setThisObject:", 0);
}

uint64_t SUSLFacebookSessionClass()
{
  return ISWeakLinkedClassForString();
}

void _callOneArgumentFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  SUScriptError *v6;
  SUScriptFunction *v7;

  v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a1);
  -[SUScriptFunction setThisObject:](v7, "setThisObject:", a2);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3)
  {
    v6 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a3);
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDFA958], "undefined"));
  }
  -[SUScriptFunction callWithArguments:](v7, "callWithArguments:", v5);

  -[SUScriptFunction setThisObject:](v7, "setThisObject:", 0);
}

uint64_t SUSLServiceClass()
{
  return ISWeakLinkedClassForString();
}

void sub_21B4E7764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__52(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__52(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4E7878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B4E854C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__53(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__53(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4E896C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21B4E8C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21B4E8FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21B4EA24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__54(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__54(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_21B4EA464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initAMSUIWebViewController()
{
  Class result;

  if (AppleMediaServicesUILibrary_sOnce_1 != -1)
    dispatch_once(&AppleMediaServicesUILibrary_sOnce_1, &__block_literal_global_17);
  result = objc_getClass("AMSUIWebViewController");
  classAMSUIWebViewController = (uint64_t)result;
  getAMSUIWebViewControllerClass = (uint64_t (*)())AMSUIWebViewControllerFunction;
  return result;
}

id AMSUIWebViewControllerFunction()
{
  return (id)classAMSUIWebViewController;
}

void sub_21B4EC858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_21B4ECB58(_QWORD *result)
{
  *result = ++qword_255187268;
  return result;
}

uint64_t sub_21B4ECB74(mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, _QWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v17;
  mach_port_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  mach_msg_header_t msg;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v30 = 1;
  v31 = a4;
  v32 = 16777472;
  v33 = a5;
  v34 = *MEMORY[0x24BDAC470];
  v17 = *a3;
  v35 = a2;
  v36 = v17;
  v37 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        v20 = 4294966988;
      }
      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v20 = 4294966996;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            v21 = v33;
            if (v33 == v47)
            {
              v20 = 0;
              v22 = v34;
              *a3 = v38;
              v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v20 = 4294966996;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port)
              v20 = 4294966996;
            else
              v20 = HIDWORD(v31);
          }
        }
        else
        {
          v20 = 4294966996;
        }
      }
      else
      {
        v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t sub_21B4ECDCC(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_msg_header_t msg;
  uint64_t v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3[5];
  v19 = a3[4];
  v20 = v4;
  v5 = a3[7];
  v21 = a3[6];
  v22 = v5;
  v6 = a3[1];
  v15 = *a3;
  v16 = v6;
  v7 = a3[3];
  v17 = a3[2];
  v13 = *MEMORY[0x24BDAC470];
  v14 = a2;
  v18 = v7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (msg.msgh_id == 71)
  {
    v10 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }
  if (msg.msgh_id != 1301)
  {
    v10 = 4294966995;
    goto LABEL_17;
  }
  v10 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v10 = v14;
  if (v14)
    goto LABEL_17;
  return v10;
}

uint64_t sub_21B4ECF58(mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _BYTE v23[28];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = 1;
  v19 = a6;
  v20 = 16777472;
  v21 = a7;
  v22 = *MEMORY[0x24BDAC470];
  *(_DWORD *)v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  v24 = a7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              v14 = 0;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port)
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v14;
}

uint64_t sub_21B4ED144(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  int v16;
  mach_msg_header_t msg;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }
    if (msg.msgh_id == 71)
    {
      v12 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            v12 = v18;
            if (!v18)
            {
              v15 = v20;
              *a2 = v19;
              *a3 = v15;
              v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v13 = 1;
          else
            v13 = v18 == 0;
          if (v13)
            v12 = 4294966996;
          else
            v12 = v18;
          goto LABEL_23;
        }
      }
      v12 = 4294966996;
    }
    else
    {
      v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

uint64_t sub_21B4ED2BC(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 241568881 * ((2 * (a1 & 0x1F607D4) - a1 - 32901077) ^ 0x2818FC69);
  v2 = *(_DWORD *)(a1 + 16) + v1;
  v3 = *(_DWORD *)(a1 + 4) ^ v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x70F4C230EE5E63EBLL);
  v6 = v4 - 1284376108;
  v5 = v4 - 1284376108 < 0;
  v7 = 1284376108 - v4;
  if (!v5)
    v7 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + v2 - 669)
                              + ((((v3 - 1575261667) < 4 * (unint64_t)v7)
                                * ((29 * (v2 ^ 0x2FC)) ^ 0x625)) ^ v2))
                            - 4))();
}

uint64_t sub_21B4ED394(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * (((32
                                                                           * (((v2 == 1575261667) ^ v4) & 1)) & 0xBF | ((((v2 == 1575261667) ^ v4) & 1) << 6)) ^ v4))
                                                            - 8))(a1, a2, 1378710378);
}

uint64_t sub_21B4ED3D0()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1982 * (((((v1 - 1587) | 0x482) - 437) ^ 0x2F5) == 32)) ^ (((v1 - 1587) | 0x482) - 270)))
                            - 12))();
}

uint64_t sub_21B4ED450@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 8) + (a4 + a5)) = (a3 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1631 * (a4 - 1 != a2 + v6 + a2 + 167)) ^ a2)) - 4))();
}

uint64_t sub_21B4ED49C(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1982 * (v3 + 8 == ((a2 - 167) ^ 0x2F5))) ^ a2)) - 12))();
}

uint64_t sub_21B4ED4D0(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v7 = v2 > 0x308118B7;
  if (v7 == v6 - 640352626 < -813766840)
    v7 = v6 - 640352626 < v5;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                                         + 8
                                                                                         * (int)((((25 * (a2 ^ 0x361)) ^ 0x74F)
                                                                                                * v7) ^ a2))
                                                                             - 12))(a1, a2, 25 * (a2 ^ 0x361), 4147718108, v3);
}

uint64_t sub_21B4ED54C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  int v3;
  _QWORD *v4;
  int v5;

  return sub_21B4ED450(a1, a2 ^ 0x1A9u, *(_DWORD *)(*v4 + 4 * (v5 - 1974069434)), v3, a3);
}

_DWORD *sub_21B4ED580(_DWORD *result, uint64_t a2, int a3)
{
  *result = a3;
  return result;
}

void sub_21B4ED588(uint64_t a1)
{
  int v1;
  BOOL v2;
  char v3;

  v1 = 268847287 * ((a1 - 2 * (a1 & 0x4542390B) + 1161967883) ^ 0xBAE82823);
  if (*(_QWORD *)(a1 + 24))
    v2 = (*(_DWORD *)(a1 + 4) ^ v1) == 1138661688;
  else
    v2 = 1;
  v3 = v2;
  __asm { BR              X8 }
}

uint64_t sub_21B4ED648()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * ((v1 ^ 0x5B2) - 1486)))(32, 0x101004023FF3BD5) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)((v3 * (((35 * (v1 ^ 0x314)) ^ 0xFFFFFF3C) + 38 * (v1 ^ 0x31E))) ^ v1 ^ 0x5B2))
                            - 4))();
}

uint64_t sub_21B4ED6CC()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((v1 != (v3 ^ (v0 + 984))) * ((v3 - 294) ^ 0x319)) ^ v3)) - 12))();
}

uint64_t sub_21B4ED714@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v11 = v2 - 1138661689;
  v12 = v2 - 1;
  v13 = *(unsigned __int8 *)(v8 + v11);
  if (v13 == 229)
    __asm { BR              X11 }
  if (v13 == 101)
  {
    v14 = -611232798;
    v15 = *(_QWORD *)(v4 + 16);
    v16 = (*(_BYTE *)(v4 + 8) + v5);
    *(_QWORD *)result = v8;
    *(_DWORD *)(result + 8) = v7;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 126)
      v17 = 916476699;
    else
      v17 = 916476698;
    *(_DWORD *)(result + 16) = 36732058;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = -611232798;
    *(_QWORD *)(v15 - 0x686D7EE90C476A6) = a2;
  }
  else
  {
    result = (*(uint64_t (**)(void))(v6 + 8 * (v9 - 744)))();
    v14 = 611190843;
  }
  *(_DWORD *)(v4 + 12) = v14;
  return result;
}

void sub_21B4ED7F4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 944348131 * ((2 * (a1 & 0x4CB3C068) - a1 - 1286848617) ^ 0x10559BD9);
  __asm { BR              X10 }
}

uint64_t sub_21B4ED8BC@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, int a6, unint64_t *a7, unsigned int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1178560073 * ((&a4 & 0xFB6BBF04 | ~(&a4 | 0xFB6BBF04)) ^ 0xB727DE3A);
  a8 = 536002032 - v12;
  a6 = v10 - v12 - 89;
  a7 = &STACK[0x27D4077E41C0C6AC];
  a4 = v11;
  a5 = &STACK[0x3F1580AD5A7A96D0];
  v13 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(a1 + 8 * (v10 ^ 0x14C)) - 8))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v11 - 0x4FF269813004C2D3) == v8) * (v10 + 68)) ^ v10))
                                          - 8))(v13);
}

uint64_t sub_21B4ED998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  uint64_t v12;
  int v13;

  return (*(uint64_t (**)(void))(v12
                              + 8
                              * ((224
                                * (((v13 - 84) ^ (a11 == v11 + ((v13 - 489180672) & 0x1D284DFF) - 451)) & 1)) ^ (v13 + 684))))();
}

void sub_21B4ED9E4(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;

  *a1 = v2;
  *(_DWORD *)(v1 + 20) = 611190999;
}

void sub_21B4EDA9C(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;

  v1 = 1178560073 * ((1008313876 - (a1 | 0x3C19A614) + (a1 | 0xC3E659EB)) ^ 0x7055C72A);
  v2 = *(_DWORD *)(a1 + 32) ^ v1;
  if (*(_QWORD *)(a1 + 48) | *(_QWORD *)(a1 + 24))
    v3 = *(_DWORD *)a1 + v1 == 1453052816;
  else
    v3 = 1;
  v4 = v3;
  __asm { BR              X10 }
}

uint64_t sub_21B4EDBF4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  _BOOL4 v8;

  v3 = v0 + 4;
  v4 = v0 + 2103898117;
  v5 = (v0 + 226) | 8;
  v6 = v4 & 0x82990FFA;
  v8 = *(_QWORD *)(v1 + 40) != 0x42B926EACA762EB9 && *(_OWORD *)(v1 + 64) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((v8 * (v6 + v5 + 802)) ^ v3)) - 12))();
}

uint64_t sub_21B4EDC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *(_QWORD *)(v13 + 56);
  *(_DWORD *)(v11 - 0x42B926EACA762EB9) = 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * (((v15 == 0x70F4C230EE5E63EFLL) * ((v10 - 234) ^ 0x798)) ^ v10)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, v12);
}

uint64_t sub_21B4EDD1C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v22 = ((((v21 - 144) ^ 0xB6D5E870 | 0xBBDC5D56)
        - ((v21 - 144) ^ 0xB6D5E870)
        + (((v21 - 144) ^ 0xB6D5E870) & 0x4423A2A8)) ^ 0xBEBA2BE7)
      * a1;
  *(_QWORD *)(v21 - 144) = &a17 + v17;
  *(_DWORD *)(v21 - 136) = (v18 + 899) ^ v22;
  *(_DWORD *)(v21 - 132) = v22 + 680848648;
  sub_21B528208(v21 - 144);
  return (*(uint64_t (**)(uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t)))(v20 + 8 * (((154 * (v18 ^ 0x1FA) + ((v18 + 718) | 0x10) - 1957) * (v19 == 0)) ^ (v18 + 770))))(&off_24DE82D70);
}

uint64_t sub_21B4EDDF0@<X0>(uint64_t a1@<X0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v24;
  BOOL v26;

  v20 = (a2 - 1135) | 0x704;
  v21 = v12;
  v22 = ((2 * ((v19 - 144) & 0x13B6C810) - (v19 - 144) - 330745873) ^ 0x75E8E7CB) * v12;
  *(_QWORD *)(v19 - 120) = v18;
  *(_QWORD *)(v19 - 144) = v16;
  *(_DWORD *)(v19 - 132) = v22 + v14 + (v20 ^ 0xB0D1D6CD);
  *(_DWORD *)(v19 - 128) = a2 - v22 - 556;
  v26 = v13 == 0;
  ((void (*)(uint64_t))(*(_QWORD *)(a1 + 8 * (a2 - 1204)) - 8))(v19 - 144);
  *(_DWORD *)(v19 - 128) = v20 - ((((2 * (v19 - 144)) | 0xACB97CAE) - (v19 - 144) + 698565033) ^ 0x4FFD6E73) * v21 - 364;
  *(_QWORD *)(v19 - 144) = a11;
  *(_QWORD *)(v19 - 136) = v15;
  (*(void (**)(uint64_t))(a1 + 8 * (v20 ^ 0x7D8)))(v19 - 144);
  *(_DWORD *)(v19 - 112) = v20 + 2078219279 * ((v19 - 144) ^ 0xDAFA9674) + 56;
  *(_QWORD *)(v19 - 104) = a6;
  *(_QWORD *)(v19 - 144) = a11;
  *(_QWORD *)(v19 - 136) = a12;
  *(_QWORD *)(v19 - 128) = a10;
  *(_QWORD *)(v19 - 120) = v15;
  v24 = (*(uint64_t (**)(uint64_t))(a1 + 8 * (v20 - 1712)))(v19 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * (((4 * ((v26 ^ (37 * (v20 ^ 0x74))) & 1)) & 0xF7 | (8 * ((v26 ^ (37 * (v20 ^ 0x74))) & 1))) ^ v20))
                                          - ((v20 + 319884058) & 0xECEEEFF5)
                                          + 621))(v24);
}

uint64_t sub_21B4EE034()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  _DWORD *v10;

  v6 = 69008221 * ((((2 * (v5 - 144)) | 0x7736CF4C) - (v5 - 144) + 1147443290) ^ 0x683935AC);
  *(_DWORD *)(v5 - 120) = v4 - v6 + 1377;
  *(_DWORD *)(v5 - 144) = v1 - v6 + ((2 * v4) ^ 0x8E6810A);
  *(_QWORD *)(v5 - 136) = v2;
  *(_QWORD *)(v5 - 128) = v8;
  result = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v4 - 554)))(v5 - 144);
  *v10 = v9;
  *(_DWORD *)(v0 + 16) = -611232798;
  return result;
}

uint64_t sub_21B4EE180(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  v1 = 831981571 * ((a1 - 1785860129 - 2 * (a1 & 0x958DEFDF)) ^ 0xC2C3FFB);
  v2 = *(_DWORD *)a1 - v1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_DWORD *)(a1 + 16) - v1 - 1036168091;
  v5 = v4
     + (*(_DWORD *)(v3 - 0x520F56D3BDEB7BB3) ^ 0x91475483)
     - ((2 * (v4 + (*(_DWORD *)(v3 - 0x520F56D3BDEB7BB3) ^ 0x91475483))) & 0x228EA906)
     - 1857596285;
  *(_DWORD *)(v3 - 0x520F56D3BDEB7BB3) = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + v2 - 864) + ((1986 * ((v5 ^ 0x91475483) < v4)) ^ v2)) - 12))();
}

void sub_21B4EE244(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x520F56D3BDEB7BB7) = (*(_DWORD *)(a1 - 0x520F56D3BDEB7BB7) ^ 0xA609BEA0)
                                         - 1509310816
                                         - ((2 * (*(_DWORD *)(a1 - 0x520F56D3BDEB7BB7) ^ 0xA609BEA0) + 2) & 0x4C137D40)
                                         + 1;
}

uint64_t sub_21B4EE28C(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(_DWORD *)result ^ (831981571 * ((result - 1028669528 - 2 * (result & 0xC2AFBFA8)) ^ 0x5B0E6F8C));
  *(_DWORD *)(v1 - 0x520F56D3BDEB7B97) = ((v2 & 0x1FF ^ 0x11C) + (v2 & 0xB0 ^ 0x153EA0) - ((v2 & 0x1FF ^ 0x11C) & 0xB0)) & 0xFFF3FFFF ^ 0xBA47ADCC;
  *(_QWORD *)(v1 - 0x520F56D3BDEB7BB7) = 0x91475483A609BEA0;
  *(_DWORD *)(v1 - 0x520F56D3BDEB7B9BLL) = 1922694427;
  v3 = v2 ^ 0xC4;
  if (v3 == 1)
  {
    v4 = 1922694443;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x520F56D3BDEB7B9FLL) = -1938813198;
    v4 = 1922694447;
LABEL_5:
    *(_QWORD *)(v1 - 0x520F56D3BDEB7BAFLL) = 0xA06F448B28E7CC03;
    *(_QWORD *)(v1 - 0x520F56D3BDEB7BA7) = 0x5F90BB74D71833FCLL;
    *(_DWORD *)(v1 - 0x520F56D3BDEB7B9BLL) = v4;
  }
  *(_DWORD *)(result + 16) = 1723469489;
  return result;
}

void Fc3vhtJDvr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v6;

  if (a4)
    v5 = a5 == 0;
  else
    v5 = 1;
  v6 = !v5;
  __asm { BR              X9 }
}

uint64_t sub_21B4EE47C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18)
{
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  *a4 = 0;
  *a5 = 0;
  a18 = 944348131
      * (((&a17 | 0x629F1FFF) - &a17 + (&a17 & 0x9D60E000)) ^ 0xC186BBB1)
      - 504207030;
  v21 = sub_21B532C9C(&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * ((1727 * (a17 == v20)) ^ v18)) - 4))(v21);
}

uint64_t sub_21B4EE50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, unsigned int a18, unsigned int a19, unsigned int a20)
{
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v21 = 2 * &a17;
  v22 = 2078219279 * (((v21 | 0xCC4768BA) - &a17 - 1713615965) ^ 0xBCD92229);
  a19 = v22 + 1054;
  a20 = 1517302066 - v22;
  HIDWORD(a17) = v22 + 1699736800;
  a18 = 1079066126 - v22;
  sub_21B52DF08((uint64_t)&a17);
  a18 = (831981571 * (((v21 | 0xC2685EFE) - &a17 + 516673665) ^ 0x7895FF5B)) ^ 0x250;
  a17 = &STACK[0x543300C3A69A2041];
  sub_21B524100((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 + 8 * ((2642 * (a19 == -611232798)) ^ 0x25Eu)) - 4))(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10);
}

uint64_t sub_21B4EE64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20,unsigned int a21)
{
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;

  v26 = 460628867 * (&a17 ^ 0x4C96827D);
  LODWORD(a18) = v26 + 1975134435 * v23 + 1486647557;
  HIDWORD(a18) = v26 + 857;
  a17 = a16;
  sub_21B52D870(&a17);
  v27 = 235795823 * (((&a17 | 0x24E3C456) - (&a17 & 0x24E3C456)) ^ 0xB04E8D0F);
  a21 = ((v22 ^ 0xDFFFFDF8) + 606 + ((2 * v22) & 0xBFFFFBF0) + 2121988450) ^ v27;
  a18 = v21;
  a20 = a16;
  a19 = 552 - v27;
  v28 = sub_21B51BD9C(&a17);
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((1450 * ((_DWORD)a17 == v25)) ^ 0x271u)))(v28);
}

uint64_t sub_21B4EE788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, int a19, int a20,unint64_t *a21,unsigned int a22)
{
  int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;

  if (a12 >= 0x5B8D66C4)
    v26 = 824007587;
  else
    v26 = -710303426;
  v27 = (((&a17 | 0x2752C34D) - &a17 + (&a17 & 0xD8AD3CB0)) ^ 0xF4F09147)
      * v22;
  a18 = a16;
  a22 = 1236506845 - v27;
  a19 = v26 ^ v27;
  a20 = (v23 - 2024873708) ^ v27;
  a21 = &STACK[0x236606C007542B5A];
  v28 = sub_21B5327E0((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t))(v24 + 8
                                                  * ((233 * (a17 == (((v23 ^ 0x4C4) - 1111) ^ (v25 - 550)))) ^ v23)))(v28);
}

uint64_t sub_21B4EE868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12)
{
  int v12;
  unsigned int v13;
  uint64_t v14;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * (v12 ^ (483 * (a12 < v13))))
                                                   - 10 * (v12 ^ 0x6A3u)
                                                   + 212))(a1, a2);
}

uint64_t sub_21B4EE904@<X0>(uint64_t a1@<X8>, char *a2, uint64_t a3, uint64_t a4, int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char **);
  int v19;
  uint64_t v20;

  LODWORD(a13) = v15 - 944348131 * (&a11 ^ 0xA319A44E) - 1262;
  a11 = &a6 + a1;
  a12 = a9;
  v18(&a11);
  LODWORD(a12) = v15
               - 1497
               + 3804331
               * (((&a11 | 0xB4B31BF9) - &a11 + (&a11 & 0x4B4CE400)) ^ 0xCA663E0F)
               + 1372;
  a13 = a9;
  a14 = v14;
  a11 = v17;
  ((void (*)(char **))((char *)*(&off_24DE82D70 + ((v15 - 1497) ^ 0x55)) - 12))(&a11);
  a11 = a2;
  a12 = a9;
  LODWORD(a13) = v15 - 1497 - 944348131 * (&a11 ^ 0xA319A44E) + 235;
  v18(&a11);
  HIDWORD(a11) = v15
               - 1497
               - 1543737703 * ((2 * (&a11 & 0x6E05BF88) - &a11 - 1845870474) ^ 0xEF0E100A)
               + 660;
  a12 = a9;
  v20 = sub_21B5200C0((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16
                                                      + 8
                                                      * ((((_DWORD)a11 == v19) * ((v15 - 1092) ^ 0x25D)) ^ (v15 - 1497)))
                                          - 4))(v20);
}

uint64_t sub_21B4EEA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  int v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((781 * (a14 == v16 + 25 * (v14 ^ 0xC5) - 625)) ^ v14)) - 4))();
}

uint64_t sub_21B4EEAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;

  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8 * ((276 * (a13 != ((v13 - 1836263693) & 0x6D732EB6 ^ (v15 + 386)))) ^ v13))
                            - ((v13 - 643570023) & 0x265C1AFB ^ 0x275)))();
}

uint64_t sub_21B4EEB10@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  int v3;
  _BOOL4 v4;

  v4 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24DE82D70 + (v1 ^ 0x664)))((v1 + 60575729) & 0xFC63ABF9 ^ a1 ^ (v3 + 10 * (v1 ^ 0x6DF) - 1481), 1523128792) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((87 * v4) ^ v1)) - 8))();
}

uint64_t sub_21B4EEB90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;

  v16 = (a13 ^ v15) - ((2 * (a13 ^ v15)) & 0xDDFF4890) - 285236152;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * ((188
                                          * (((((v13 - 61713435) & 0x3ADA9AE) + 2145644272) & (2 * v16) ^ 0x5DE34890)
                                           + (v16 ^ 0xD10E53B7)
                                           - 33646448 == 1039175823)) ^ v13))
                            - 12))();
}

uint64_t sub_21B4EEC30(uint64_t a1)
{
  int v1;
  int v2;
  _QWORD *v3;
  int v4;
  int v5;
  void (*v7)(unsigned int *);
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v5 = (v2 - 254) | 0x261;
  *v3 = a1;
  *v8 = v1;
  v11 = (v5 + 672) ^ (69008221
                    * (((&v11 | 0x5D0DCEC5) - &v11 + (&v11 & 0xA2F23138)) ^ 0x8EAF9CCF));
  v12 = v9;
  v7(&v11);
  v12 = v10;
  v11 = ((v5 ^ 0x2F) + 691) ^ (69008221
                             * ((-1124791517 - (&v11 | 0xBCF50B23) + (&v11 | 0x430AF4DC)) ^ 0x90A8A6D6));
  v7(&v11);
  return v4 ^ 0xDB9153E2;
}

void sub_21B4EF068(uint64_t a1)
{
  int v1;

  v1 = (*(_DWORD *)(a1 + 16)
      + 831981571 * ((((2 * (a1 ^ 0x8B4C78D1)) | 0xDE8E8AAE) - (a1 ^ 0x8B4C78D1) - 1866941783) ^ 0x7DAAEDA2)
      - 1514) | 0x460;
  __asm { BR              X19 }
}

uint64_t sub_21B4EF220(uint64_t a1, uint64_t a2, int a3, int a4, int a5, unsigned int a6, int a7, int a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8 * ((((((v8 + v9) & v10 ^ a3) * a4) ^ a7) * (a8 == 31)) ^ (v8 + v9) & v10))
                            - ((((v8 + v9) & v10) + a5) & a6)
                            + 330))();
}

void sub_21B4EF28C()
{
  JUMPOUT(0x21B4EF1F0);
}

uint64_t sub_21B4EF294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  _BOOL4 v25;

  *(_DWORD *)(a11 - 0x71987668E270734DLL) = -1675451436 - v16;
  v22 = 1178560073 * ((v21 - 136) ^ 0xB3B39EC1);
  *(_QWORD *)(v21 - 136) = v17;
  *(_DWORD *)(v21 - 128) = (v20 + 1059) ^ v22;
  *(_DWORD *)(v21 - 124) = v22 + 680783112;
  sub_21B528208(v21 - 136);
  v23 = 1224239923
      * ((2 * (((v21 - 136) ^ 0x977DA2D3) & 0x166438A1) - ((v21 - 136) ^ 0x977DA2D3) - 375666854) ^ 0x8C55985E);
  *(_QWORD *)(v21 - 136) = v17;
  *(_DWORD *)(v21 - 128) = (v20 + 1564) ^ v23;
  *(_DWORD *)(v21 - 124) = v23 + ((v18 << 6) & 0xBCEAB340) + ((32 * v18) ^ 0x5E7559BF) - 438325256;
  sub_21B52DAFC(v21 - 136);
  *(_DWORD *)(v21 - 136) = v20 + 1224239923 * ((v21 - 136) ^ 0xF2B3FDD7) + 107;
  *(_QWORD *)(v21 - 120) = &STACK[0x70F4C230EE5E642F];
  *(_QWORD *)(v21 - 128) = a16;
  sub_21B522F20(v21 - 136);
  *(_DWORD *)(v21 - 112) = (v20 - 242) ^ (241568881
                                        * (((((v21 - 136) | 0xEB002236) ^ 0xFFFFFFFE) - (~(v21 - 136) | 0x14FFDDC9)) ^ 0xC2EED98B));
  *(_QWORD *)(v21 - 136) = v17;
  *(_QWORD *)(v21 - 120) = a16;
  v24 = ((uint64_t (*)(uint64_t))((char *)*(&off_24DE82D70 + (v20 ^ 0x1E0)) - 8))(v21 - 136);
  v25 = *(_DWORD *)(v21 - 128) > ((((v20 - 78) | 0xB) + 268) ^ 0x45CFF8F0);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * ((v25 | (4 * v25)) ^ v20)) - 8))(v24);
}

uint64_t sub_21B4EF498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)(v19 - 128) = v16;
  *(_QWORD *)(v19 - 120) = a16;
  *(_DWORD *)(v19 - 136) = v18 + 1224239923 * ((v19 - 136) ^ 0xF2B3FDD7) + 174;
  v20 = sub_21B522F20(v19 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17 + 8 * (v18 ^ (1359 * (a11 < 1))))
                                          - (((v18 + 1258) - 1279) ^ (v18 - 25))))(v20);
}

uint64_t sub_21B4EF50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  *(_QWORD *)(v19 - 128) = a16;
  *(_QWORD *)(v19 - 120) = a14;
  *(_DWORD *)(v19 - 136) = v18
                         + 1224239923 * ((((v19 - 136) | 0x8A46F787) + (~(v19 - 136) | 0x75B90878)) ^ 0x78F50A51)
                         - 1084;
  sub_21B522F20(v19 - 136);
  v20 = 1224239923 * ((((2 * (v19 - 136)) | 0xFB28F40) - (v19 - 136) + 2015803488) ^ 0x756ABA77);
  *(_QWORD *)(v19 - 136) = a15;
  *(_DWORD *)(v19 - 128) = (v18 + 373) ^ v20;
  *(_DWORD *)(v19 - 124) = v20 + 1146423736;
  sub_21B52DAFC(v19 - 136);
  *(_QWORD *)(v19 - 120) = a16;
  *(_QWORD *)(v19 - 136) = a15;
  *(_DWORD *)(v19 - 112) = (v18 - 1433) ^ (241568881
                                         * ((((v19 - 136) | 0xC6AF4BFE) - ((v19 - 136) & 0xC6AF4BFE)) ^ 0x10BE4FBC));
  v21 = v16(v19 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * ((*(_DWORD *)(v19 - 128) > ((v18 - 1063) ^ 0x45CFF9FF ^ ((v18 - 1017) | 0xC6u))) ^ (v18 - 1009)))
                                          - 12))(v21);
}

uint64_t sub_21B4EF6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  int v14;

  return (*(uint64_t (**)(void))(v13
                              + 8
                              * (int)((((((v14 + 722) | 0x10A) ^ 0xEADECA60)
                                      + (a13 ^ 0x5FE3F53D)
                                      - 1254278413
                                      + ((2 * a13) & 0xBFC7EA7A) < 0x7FFFFFFE)
                                     * ((v14 + 2072794153) & 0x8473AFFD ^ 0x5C3)) ^ v14)))();
}

void sub_21B4F0358(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) ^ (944348131 * ((a1 - 271326871 - 2 * (a1 & 0xEFD3E169)) ^ 0x4CCA4527));
  __asm { BR              X15 }
}

uint64_t sub_21B4F047C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  _BOOL4 v17;

  v14 = v12 - 1526440340;
  *(_DWORD *)(a9 + 4 * (v9 + a1)) = *(_DWORD *)(*(_QWORD *)(v11 - 0x70F4C230EE5E63E7) + 4 * (v9 + a1));
  v15 = ((v10 + 350106362) & 0xEB21CBFF ^ 0x85EBA4DD) + v9;
  v17 = v15 > 621043307 || v15 < v14;
  return (*(uint64_t (**)(uint64_t))(v13 + 8 * ((779 * v17) ^ v10)))(621043307);
}

uint64_t sub_21B4F050C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v18;

  v16 = ((v14 - 2) ^ 0xA99EF19B) + v13;
  v18 = v16 > 1219995956 || v16 < a13 - 927487691;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((84 * v18) ^ v14)) - 8))();
}

uint64_t sub_21B4F057C@<X0>(int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  _BOOL4 v19;

  *(_DWORD *)(a10 + 4 * (v10 + a2)) = a1;
  v17 = v12 + v10 + 146;
  v19 = v17 > ((v11 - 155607034) & 0x9465FF7) + v13 || v17 < v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((v19 * v15) ^ v11)) - 8))();
}

uint64_t sub_21B4F05D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                                          + 8
                                                                                          * ((((v5 == 0) ^ (v6 - 53) ^ 0x75) & 1 | ((((v5 == 0) ^ (v6 - 53) ^ 0x75) & 1) << 6)) ^ v6))
                                                                              - 4))(a1, a2, a3, a4, a5);
}

uint64_t sub_21B4F060C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  signed int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  _BOOL4 v17;

  v12 = a1 | 0x128;
  v13 = a1 & 0xAE3AF803;
  v14 = (*(_DWORD *)(*(_QWORD *)(a4 + 24) - 0x71987668E270734DLL) - 1966800080) * (*a10 ^ 0xF73927DC);
  v15 = 268847287 * ((((v11 - 128) | 0x4508C801) - ((v11 - 128) & 0x4508C801)) ^ 0xBAA2D929);
  *(_QWORD *)(v11 - 128) = a7;
  *(_QWORD *)(v11 - 104) = a8;
  *(_DWORD *)(v11 - 112) = v15 + 1284376108;
  *(_DWORD *)(v11 - 120) = (v14 ^ 0xFDBFB3DF) - v15 + (((v12 - 691) ^ 0xFB7F6749) & (2 * v14)) + 2120056064;
  *(_DWORD *)(v11 - 116) = (v12 + 723) ^ v15;
  v16 = ((uint64_t (*)(uint64_t))((char *)*(&off_24DE82D70 + v13) - 12))(v11 - 128);
  v17 = (int)((v12 ^ 0x17F8101A) + a6) > 402133937;
  if (a6 > 0x6807EC4F)
    v17 = 1;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10 + 8 * ((29 * !v17) ^ v12)) - 4))(v16);
}

void sub_21B4F07A4()
{
  JUMPOUT(0x21B4F0680);
}

uint64_t sub_21B4F07AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, int a10, int a11, uint64_t a12, int a13, int a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  int v17;

  v17 = 268847287 * ((555550643 - ((v16 - 128) | 0x211D07B3) + ((v16 - 128) | 0xDEE2F84C)) ^ 0x2148E964);
  *(_QWORD *)(v16 - 120) = a15;
  *(_DWORD *)(v16 - 128) = (a11 + 534) ^ v17;
  *(_DWORD *)(v16 - 124) = v17 + ((32 * a14) ^ 0x7397BFF6) + (((a11 + 394) ^ 0xE72F7D40) & (a14 << 6)) - 25564162;
  sub_21B4F27E4(v16 - 128);
  return ((uint64_t (*)(void))(*(_QWORD *)(v15
                                        + 8 * ((376 * (*a9 - 1284376109 < ((a11 - 176) | 0xA8u) + 2147483408)) ^ a11))
                            - 8))();
}

uint64_t sub_21B4F0898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_DWORD *)(v17 - 128) = v14 + 1224239923 * ((v17 - 689808879 - 2 * ((v17 - 128) & 0xD6E25A91)) ^ 0x2451A746) + 206;
  *(_QWORD *)(v17 - 120) = a14;
  *(_QWORD *)(v17 - 112) = &STACK[0x70F4C230EE5E642F];
  sub_21B522F20(v17 - 128);
  *(_DWORD *)(v17 - 104) = (v14 - 143) ^ (241568881 * ((v17 - 128) ^ 0xD6110442));
  *(_QWORD *)(v17 - 112) = a14;
  *(_QWORD *)(v17 - 128) = v16;
  v18 = ((uint64_t (*)(uint64_t))((char *)*(&off_24DE82D70 + v14 - 61) - 8))(v17 - 128);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15
                                                      + 8
                                                      * (((((v14 - 6) ^ (*(_DWORD *)(v17 - 120) > 0x45CFFAEBu)) & 1)
                                                        * ((v14 + 402) ^ 0x299)) ^ v14))
                                          - 8))(v18);
}

uint64_t sub_21B4F0990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  uint64_t v16;
  int v17;
  int v18;

  v18 = a16 - 1284376108;
  if (a16 - 1284376108 < 0)
    v18 = 1284376108 - a16;
  return (*(uint64_t (**)(void))(v16
                              + 8
                              * ((((int)((v18 ^ 0x6FAF97FC) + ((v18 << ((v17 - 65) ^ 0x41)) & 0xDF5F2FF8) - 1873778685) >= 0)
                                * ((v17 + 574) ^ 0x11D)) | (v17 - 65))))();
}

uint64_t sub_21B4F0A24()
{
  int v0;
  uint64_t v1;
  unsigned int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)(((*(_DWORD *)(v1 + 4 * v2) == v3) * (((v0 + 8684671) & 0xFF7B7DFF) - 1022)) ^ v0)))();
}

uint64_t sub_21B4F0A5C()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 - 1 >= 0) * ((v0 + 639) ^ 0x11D)) | v0)))();
}

uint64_t sub_21B4F0A8C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v5;

  v3 = *v5;
  *(_DWORD *)(v2 - 128) = v0 + 1224239923 * ((((v2 - 128) | 0x2CB4BAE1) - ((v2 - 128) & 0x2CB4BAE1)) ^ 0xDE074736) - 770;
  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = v3;
  return sub_21B522F20(v2 - 128);
}

uint64_t sub_21B4F0E80(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))(qword_24DE7E490[(47 * (*(_DWORD *)(a2 + 4) == 1503180299)) ^ 0xCDu] - 4))(4294925278);
}

uint64_t sub_21B4F0EC4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 448) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2 + 6560) - 4))(0);
}

void sub_21B4F0F3C()
{
  JUMPOUT(0x21B4F0F0CLL);
}

uint64_t sub_21B4F0F48(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(qword_24DE7E490[(799 * (*(_DWORD *)(a2 + 4) == 1503180287)) ^ 0x502u] - 8))();
}

uint64_t sub_21B4F0F84(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xCEFB6DC7)
                       + 2078798844
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0xFF8F);
  return 0;
}

uint64_t sub_21B4F0FBC()
{
  return 4294925278;
}

void sub_21B4F0FC4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 48)
     + 241568881 * (((a1 ^ 0xDE6953B9 | 0x61B4BFFC) - ((a1 ^ 0xDE6953B9) & 0x61B4BFFC)) ^ 0x69CCE807);
  __asm { BR              X10 }
}

uint64_t sub_21B4F10F4()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v5;

  v5 = *(_DWORD *)v2 + v0 == 1556690660 || *(_OWORD *)(v2 + 32) == 0;
  return (*(uint64_t (**)(void))(v3 + 8 * (v1 ^ (4 * (((v1 + 1) ^ v5) & 1)))))();
}

uint64_t sub_21B4F1138()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  _BOOL4 v4;

  v4 = v1[3] == 0xC8F409392290867 || (v1[8] | v1[1]) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((((((v0 + 484) ^ v4) & 1) == 0) * (((v0 + 1510) | 7) ^ 0x333)) ^ v0)))();
}

uint64_t sub_21B4F119C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  int v17;
  uint64_t v18;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *))(*(_QWORD *)(v18 + 8 * ((v17 | 0x80) ^ (71 * (v16 == 0)))) - (((v17 | 0x80) + 243584120) ^ 0xE84C90C ^ ((v17 | 0x80) + 243584120) & 0xF17B36F3 ^ 8)))(a1, a2, a8 + 0x14D1A3E56842DC88, a3, a4, a5, a6, a7, a2, a10, a11, a12, a13, a14, a15, a16, a8 + 0x14D1A3E56842DFB8, &STACK[0x70F4C230EE5E6497]);
}

uint64_t sub_21B4F12C8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  void (*v48)(uint64_t);
  void (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;

  v33 = v24 ^ 0x7BB;
  v34 = ((-251006750 - ((v32 - 144) ^ 0x4A37F3D1 | 0xF109F0E2) + ((v32 - 144) ^ 0x4A37F3D1 | 0xEF60F1D)) ^ 0xDD602CE8)
      * v31;
  *(_QWORD *)(v32 - 120) = v26;
  *(_QWORD *)(v32 - 144) = v22;
  *(_DWORD *)(v32 - 132) = v34 + v25 - 1432064757 + (v24 ^ 0x7BB);
  *(_DWORD *)(v32 - 128) = v24 - v34 - 1102;
  v50 = a1 + v23;
  ((void (*)(uint64_t))(*(_QWORD *)(v28 + 8 * (v24 - 1750)) - 8))(v32 - 144);
  LODWORD(a8) = v33 ^ 0x646;
  HIDWORD(a9) = v33 + 1478;
  v51 = v27;
  *(_DWORD *)(v32 - 128) = v33 + 1200 - (((v32 - 144) & 0x45AB583A | ~((v32 - 144) | 0x45AB583A)) ^ 0x23F577E1) * v31;
  *(_QWORD *)(v32 - 144) = a19;
  *(_QWORD *)(v32 - 136) = a18;
  v49 = *(void (**)(uint64_t))(v28 + 8 * (v33 - 140));
  v49(v32 - 144);
  HIDWORD(a5) = v33 + 886;
  *(_QWORD *)(v32 - 120) = a19;
  *(_QWORD *)(v32 - 112) = a18;
  *(_DWORD *)(v32 - 136) = (v33 + 886) ^ (944348131
                                        * (((v32 - 144) & 0xC34BCDFC | ~((v32 - 144) | 0xC34BCDFC)) ^ 0x9FAD964D));
  *(_QWORD *)(v32 - 144) = v30;
  *(_QWORD *)(v32 - 128) = v26;
  v48 = *(void (**)(uint64_t))(v28 + 8 * (v33 ^ 0x178));
  v48(v32 - 144);
  HIDWORD(v47) = v33 + 1141;
  *(_QWORD *)(v32 - 128) = v30;
  *(_QWORD *)(v32 - 120) = v27;
  *(_DWORD *)(v32 - 104) = v33
                         + 1141
                         - 831981571 * (((v32 - 144) & 0x5075AAFC | ~((v32 - 144) | 0x5075AAFC)) ^ 0x362B8527);
  *(_QWORD *)(v32 - 112) = a18;
  *(_QWORD *)(v32 - 144) = a19;
  *(_QWORD *)(v32 - 136) = v30;
  v35 = v28;
  v36 = (void (*)(uint64_t))(*(_QWORD *)(v28 + 8 * (v33 ^ 0x1D7)) - 8);
  v36(v32 - 144);
  LODWORD(v47) = v33 + 390;
  *(_QWORD *)(v32 - 120) = a18;
  *(_QWORD *)(v32 - 112) = v30;
  *(_DWORD *)(v32 - 104) = v33
                         + 390
                         - 268847287
                         * ((20409577 - ((v32 - 144) ^ 0x90080465 | 0x1376CE9) + ((v32 - 144) ^ 0x90080465 | 0xFEC89316)) ^ 0x916A865B);
  *(_QWORD *)(v32 - 144) = v30;
  *(_QWORD *)(v32 - 136) = a19;
  *(_QWORD *)(v32 - 128) = a10;
  v37 = (void (*)(uint64_t))(*(_QWORD *)(v35 + 8 * (v33 - 141)) - 4);
  v37(v32 - 144);
  *(_DWORD *)(v32 - 128) = v33 + 1200 - 831981571 * ((v32 - 144) ^ 0x99A1D024);
  *(_QWORD *)(v32 - 144) = a19;
  *(_QWORD *)(v32 - 136) = a14;
  v49(v32 - 144);
  *(_QWORD *)(v32 - 144) = a11;
  *(_DWORD *)(v32 - 136) = (v33 + 886) ^ (944348131
                                        * ((((2 * (v32 - 144)) | 0xB5905C5E) - (v32 - 144) - 1523068463) ^ 0xF9D18A61));
  *(_QWORD *)(v32 - 128) = v26;
  *(_QWORD *)(v32 - 120) = a19;
  *(_QWORD *)(v32 - 112) = a14;
  v48(v32 - 144);
  *(_DWORD *)(v32 - 104) = v33
                         + 1141
                         - 831981571 * ((((2 * (v32 - 144)) | 0x4D5E69C2) - (v32 - 144) + 1498467103) ^ 0x3F0EE4C5);
  *(_QWORD *)(v32 - 120) = v51;
  *(_QWORD *)(v32 - 112) = a14;
  *(_QWORD *)(v32 - 144) = a19;
  *(_QWORD *)(v32 - 136) = a11;
  *(_QWORD *)(v32 - 128) = a11;
  v36(v32 - 144);
  *(_QWORD *)(v32 - 128) = a12;
  *(_QWORD *)(v32 - 120) = a14;
  *(_QWORD *)(v32 - 112) = a11;
  *(_QWORD *)(v32 - 144) = a11;
  *(_QWORD *)(v32 - 136) = a19;
  *(_DWORD *)(v32 - 104) = v33 + 390 - 268847287 * ((v32 - 144) ^ 0xFFAA1128);
  v37(v32 - 144);
  *(_QWORD *)(v32 - 144) = a11;
  *(_DWORD *)(v32 - 136) = (v33 - 75) ^ (69008221
                                       * ((((v32 - 144) | 0xC77706D8) - ((v32 - 144) & 0xC77706D8)) ^ 0x14D554D2));
  *(_QWORD *)(v32 - 128) = v30;
  ((void (*)(uint64_t))((char *)*(&off_24DE82D70 + (v33 ^ 0x1CB)) - 8))(v32 - 144);
  *(_QWORD *)(v32 - 136) = a11;
  *(_DWORD *)(v32 - 144) = v33 + 241568881 * ((v32 - 144) ^ 0xD6110442) - 101;
  sub_21B4F2DA8(v32 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), _QWORD, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8 * ((1922 * (*(_DWORD *)(v32 - 140) - 1072246154 < ((v33 + 1478) ^ v33 ^ 0x646 ^ 0x30273B6u))) ^ v33)) - 12))(v38, v39, v40, v41, v42, v43, v44, v45, a2, v47, v48, a5, v49, *(&off_24DE82D70 + v33 - 213), a8, a9, v36, a11, a12,
           v50,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           v30,
           a21,
           a22);
}

uint64_t sub_21B4F17B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void (*a14)(uint64_t), uint64_t a15, uint64_t a16, void (*a17)(uint64_t), uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  *(_DWORD *)(v42 - 144) = (v40 - 691) ^ (3804331
                                        * ((((v42 - 144) | 0xF9D8DA24) - (v42 - 144) + ((v42 - 144) & 0x62725D8)) ^ 0x870DFFD2));
  *(_QWORD *)(v42 - 136) = v38;
  *(_QWORD *)(v42 - 128) = v41;
  v37(v42 - 144);
  *(_QWORD *)(v42 - 120) = a37;
  *(_QWORD *)(v42 - 112) = v41;
  *(_DWORD *)(v42 - 104) = v40 - 337 - 831981571 * ((v42 - 144) ^ 0x99A1D024);
  *(_QWORD *)(v42 - 144) = a26;
  *(_QWORD *)(v42 - 136) = v38;
  *(_QWORD *)(v42 - 128) = v38;
  a17(v42 - 144);
  *(_DWORD *)(v42 - 104) = v40
                         - 337
                         - 831981571
                         * ((1977182358 - ((v42 - 144) | 0x75D96896) + ((v42 - 144) | 0x8A269769)) ^ 0x1387474D);
  *(_QWORD *)(v42 - 120) = v38;
  *(_QWORD *)(v42 - 112) = v41;
  *(_QWORD *)(v42 - 144) = a26;
  *(_QWORD *)(v42 - 136) = a20;
  *(_QWORD *)(v42 - 128) = v38;
  a17(v42 - 144);
  *(_QWORD *)(v42 - 136) = a25;
  *(_QWORD *)(v42 - 128) = v38;
  *(_DWORD *)(v42 - 144) = v40
                         - 3804331 * (((v42 - 144) & 0xCB11D50C | ~((v42 - 144) | 0xCB11D50C)) ^ 0x4A3B0F05)
                         + 426521210;
  sub_21B532E80(v42 - 144);
  *(_DWORD *)(v42 - 144) = (v40 - 691) ^ (3804331
                                        * ((2 * ((v42 - 144) & 0xFAAFA28) - (v42 - 144) - 262863407) ^ 0x8E802027));
  *(_QWORD *)(v42 - 136) = v38;
  *(_QWORD *)(v42 - 128) = a27;
  a14(v42 - 144);
  *(_DWORD *)(v42 - 144) = v40
                         + 1224239923
                         * ((((v42 - 144) | 0x76883D7D) - (v42 - 144) + ((v42 - 144) & 0x8977C280)) ^ 0x843BC0AA)
                         - 1362;
  *(_QWORD *)(v42 - 136) = v38;
  *(_QWORD *)(v42 - 128) = a27;
  v43 = sub_21B522F20(v42 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v39 + 8 * (((v40 - 1788) * (a24 == 0)) ^ (v40 - 711)))
                                          - ((v40 + 1141609200) & 0xBBF466FF ^ 0xF3)))(v43);
}

uint64_t sub_21B4F19F8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v4 = 241568881 * (((v3 - 144) & 0xC308C045 | ~((v3 - 144) | 0xC308C045)) ^ 0xEAE63BF8);
  *(_DWORD *)(v3 - 140) = (((v0 + 860001471) & 0xCCBD6B63 ^ 0x11B5FDD) + v8) ^ v4;
  *(_QWORD *)(v3 - 136) = v6;
  *(_QWORD *)(v3 - 120) = v2;
  *(_DWORD *)(v3 - 128) = v0 - v4 + 460;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_24DE82D70 + (v0 ^ 0xF4)) - 12))(v3 - 144);
  *(_DWORD *)(v7 - 0xC8F409392290867) = v8;
  *(_DWORD *)(v1 + 16) = -611232798;
  return result;
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_21B4F1BBC@<X0>(uint64_t a1@<X8>)
{
  (*(void (**)(void))(a1 + 208))();
  return 0;
}

uint64_t sub_21B4F1BD0()
{
  return 4294925273;
}

void sub_21B4F1BDC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21B4F1C40()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((77 * (v1 != 1503180286)) | 0x132u)) - 8))();
}

uint64_t sub_21B4F1C74@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;

  v4 = v1 - (**(_BYTE **)(v3 + 8) == 0);
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 528) = 368992379;
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 532) = 1284376108;
  *(_QWORD *)(*(_QWORD *)(v2 + 96) + 536) = *(_QWORD *)(v2 + 96) + 544;
  v5 = *(_QWORD *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  v6 = 831981571 * ((((2 * &v9) | 0x2D5E3B20) - &v9 + 1766908528) ^ 0xF0ECDB4);
  v13 = *(_QWORD *)(v2 + 96) + 0x70F4C230EE5E65FFLL;
  v11 = v6 + v4 - 1378554054;
  v12 = 676 - v6;
  v9 = v5;
  ((void (*)(uint64_t *))(*(_QWORD *)(a1 + 224) - 8))(&v9);
  v7 = v10;
  *(_QWORD *)(*(_QWORD *)(v2 + 96) + 512) = *(_QWORD *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  return (-304873269 * v7 - 595195047);
}

void sub_21B4F1DDC(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (3804331 * ((-2 - ((a1 | 0x7DBA3951) + (~(_DWORD)a1 | 0x8245C6AE))) ^ 0xFC90E358));
  __asm { BR              X15 }
}

uint64_t sub_21B4F1E9C(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((196
                                     * (((*(_DWORD *)(*(_QWORD *)(a1 + 8) + v4) == v2) ^ ((v1 & 0xF7 ^ 0x71) + 97)) & 1)) ^ v1 & 0xEBA7A3F7)))();
}

uint64_t sub_21B4F1EE0()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((((v0 - 1284377224 + 62 * (v2 ^ 0x471u)) * (v3 - 1284376108)) >> 31)
                                     * ((v2 - 7) ^ 0x497)) ^ v2)))();
}

uint64_t sub_21B4F1F2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v5 = a1;
  v6 = v1;
  v8 = v1;
  v7 = (v3 - 179) ^ (460628867
                   * ((((&v5 | 0xDBA1FC92) ^ 0xFFFFFFFE) - (~&v5 | 0x245E036D)) ^ 0x68C88110));
  return ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v2 + 8 * (v3 ^ 0x475)) - 8))(&v5);
}

void sub_21B4F2078(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v3 = *(_DWORD *)(*(_QWORD *)a1 - 0x70F4C230EE5E63EBLL) == 1284376108
    || *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x70F4C230EE5E63EBLL) == 1284376108;
  v1 = *(_DWORD *)(a1 + 8) ^ (1178560073 * (((a1 | 0x63D2D47D) - a1 + (a1 & 0x9C2D2B82)) ^ 0xD0614ABC));
  __asm { BR              X14 }
}

void sub_21B4F2178()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void sub_21B4F27E4(uint64_t a1)
{
  int v1;

  v1 = 268847287 * ((a1 + 1542151452 - 2 * (a1 & 0x5BEB5D1C)) ^ 0xA4414C34);
  __asm { BR              X14 }
}

uint64_t sub_21B4F28A8@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v7;
  uint64_t v8;
  int v9;

  v5 = 3804331 * (((&v7 | 0x67885178) - (&v7 & 0x67885178)) ^ 0x195D748E);
  v8 = v2;
  v7 = ((71 * ((v4 - 121) ^ 0x29F)) ^ 0xD92F7152) - (a1 + v5 + ((-467445784 - v3) & 0xCE3B8CD6));
  v9 = (v4 + 37) ^ v5;
  return (*(uint64_t (**)(unsigned int *))(v1 + 8 * (v4 - 716)))(&v7);
}

void sub_21B4F2A0C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (69008221 * ((-2 - ((a1 | 0xFC1C80D3) + (~(_DWORD)a1 | 0x3E37F2C))) ^ 0xD0412D26));
  __asm { BR              X9 }
}

uint64_t sub_21B4F2AC0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * ((252 * (*(_BYTE *)(v2 - 0x4FF269813004C2D7) & 1)) ^ a1 & 0x7D0ACB71u))
                            - (a1 & 0x7D0ACB71 ^ 0x36Fu)
                            - (((a1 & 0x7D0ACB71) + 2034994862) & 0x86B473FF ^ 0xFFFFFFFFFFFFFFF5)))();
}

void sub_21B4F2B28()
{
  uint64_t v1;
  unint64_t v3;
  _BYTE v4[80];

  v3 = ((unint64_t)v4 ^ 0x7F65E7F6EF45FFEDLL)
     - 0x2000002200409CEDLL
     + ((2 * (_QWORD)v4) & 0xFECBCFEDDE8BFFD0);
  *(_BYTE *)(v1 - 0x4FF269813004C2CCLL) = (v3 ^ 0xBA) * (v3 + 17);
  __asm { BR              X15 }
}

void sub_21B4F2D64()
{
  JUMPOUT(0x21B4F2D34);
}

void sub_21B4F2D70()
{
  int v0;
  uint64_t v1;

  (*(void (**)(void))(v1 + 8 * (v0 ^ 0x50B)))();
  JUMPOUT(0x21B4F2D8CLL);
}

void sub_21B4F2DA8(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)a1 - 241568881 * ((((2 * a1) | 0xE12CB758) - a1 + 258581588) ^ 0x26875FEE);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v1 - 69008221 * (&v2 ^ 0xD3A2520A) + 670;
  sub_21B5224EC((uint64_t)&v2);
  __asm { BR              X9 }
}

void sub_21B4F2E8C()
{
  uint64_t v0;
  int v1;

  *(_DWORD *)(v0 + 4) = v1 + 1;
}

void sub_21B4F2F0C(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  v2 = (*(_DWORD *)(a2 + 4) - 1503180286) > 4;
  __asm { BR              X9 }
}

uint64_t sub_21B4F2F68()
{
  return 4294925278;
}

void sub_21B4F30E8(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 24) == 0x4FF269813004C2EBLL
    || *(_QWORD *)(a1 + 8) == 0x72725D8527681A84
    || *(_QWORD *)(a1 + 40) == 0x624568E6AE91F1FELL;
  v1 = *(_DWORD *)(a1 + 16) - 1178560073 * ((~(_DWORD)a1 & 0x30FFA8AA | a1 & 0xCF005755) ^ 0x834C366B);
  __asm { BR              X10 }
}

uint64_t sub_21B4F31F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  int v20;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8 * (((*(_DWORD *)(a19 - 0x4FF269813004C2D3) == (((v20 ^ 0x51) - 79) ^ 0xDB915065)) * ((v20 ^ 0x51) + 250)) ^ v20 ^ 0x51)))(a1, a2, a3, a4, a5, a6, 3683734498, a8);
}

uint64_t sub_21B4F3248(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  __n128 v28;
  __n128 v29;
  _BOOL4 v30;
  unsigned int v32;

  v27 = 2 * (v23 + 893);
  v32 = *(_DWORD *)(a23 - 0x4FF269813004C2DBLL) - 743821003;
  v28.n128_u64[0] = 0xCACACACACACACACALL;
  v28.n128_u64[1] = 0xCACACACACACACACALL;
  v29.n128_u64[0] = 0xE5E5E5E5E5E5E5E5;
  v29.n128_u64[1] = 0xE5E5E5E5E5E5E5E5;
  *(_QWORD *)(v26 - 144) = (v25 - 2116615048) & 0x7E28FEE9 ^ 0xFFFFFFFFFFFFF91DLL;
  v30 = v32 < 0xD5DAADCF;
  if (v30 == (((v27 ^ 0xF0E) + 558) ^ 0xD5DAAD9E ^ (21 * (v27 ^ 0xE8D))) > 0xD5DAADCF)
    v30 = v32 > 0xD5DAADCF;
  return ((uint64_t (*)(uint64_t, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v24 + 8 * (v30 ^ v27 ^ 0xF0E)) - 12))(a1, 4195714347, a2, a3, a4, a5, v28, v29);
}

uint64_t sub_21B4F3488()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 8 * (v0 - 896)) - 8))(*(_DWORD *)(v2 - 148) & 0x20000000, 2 * ((v0 + 486) ^ 0x418u) - 746);
}

uint64_t sub_21B4F4254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15)
{
  int v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  _BOOL4 v19;

  *(_BYTE *)(*v18 + (v16 ^ 0x7C6 ^ (a8 + 981)) + v15) = 101;
  v19 = v15 - 50794658 < (a15 + 227972406);
  if ((a15 + 227972406) < 0x4FB7AF54 != (v15 - 50794658) < 0x4FB7AF54)
    v19 = (a15 + 227972406) < 0x4FB7AF54;
  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * (v16 | (7 * !v19))) - 12))();
}

uint64_t sub_21B4F42D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14;
  _BOOL4 v15;
  unsigned int v16;
  int v17;
  _BOOL4 v18;

  v15 = v12 < v11;
  *(_BYTE *)(*v14 + (v8 + a8)) = -27;
  v16 = v8 + 1 + v9;
  v17 = v15 ^ (v16 < v11);
  v18 = v16 < v12;
  if (!v17)
    v15 = v18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((7 * !v15) ^ v10)) - (v10 - 58) + 970))();
}

void sub_21B4F4338(int a1@<W8>)
{
  int v1;
  _QWORD *v2;
  int v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;

  *(_QWORD *)(v5 - 0x72725D8527681A84) = *v2;
  *(_DWORD *)(v6 - 0x624568E6AE91F1FELL) = a1;
  *v2 = 0;
  *(_QWORD *)(v9 - 0x4FF269813004C2E3) = 0x43DE993843DE9938;
  v3 = *(_DWORD *)(v9 - 0x4FF269813004C2D7);
  *v4 = 36732058;
  *(_DWORD *)(v9 - 0x4FF269813004C2D7) = ((v3 & 0xFFFFFFFE ^ 0x2E0879DA)
                                          + (v3 & (v1 - 477860486) ^ 0xC1840000)
                                          - ((v3 & 0xFFFFFFFE ^ 0x2E0879DA) & 0xE3847150)) ^ 0xCD8C088B;
  *v8 = *v7;
}

uint64_t sub_21B4F4454(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  int v3;
  unsigned __int8 v4;
  uint64_t v5;
  int v6;
  char v8;

  v2 = (unint64_t)&v8 ^ qword_2551854C0 ^ qword_255184948;
  qword_2551854C0 = 1209664481 * v2 + 0x3D486B14357345CFLL;
  qword_255184948 = 1209664481 * (v2 ^ 0xD2F218D37B7E7FAFLL);
  v3 = *(_DWORD *)(a2 + 4);
  v4 = -31 * ((qword_255184948 + -31 * v2 - 49) ^ 0xAF);
  v5 = (uint64_t)*(&off_24DE82D70 + (v4 ^ byte_21B567AC0[~byte_21B564200[v4]]) - 180);
  if (v3 == 1503180289)
    __asm { BR              X16 }
  if (v3 == 1503180296)
  {
    v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X1 }
  }
  return 4294925278;
}

void sub_21B4F4B48(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_21B4F4B84(uint64_t a1)
{
  uint64_t v1;
  int v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (*(uint64_t (**)(void))(v1 + 1352))();
  if (v3 == 16)
    v4 = -42029;
  else
    v4 = -42030;
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  (*(void (**)(uint64_t))(v1 + 208))(a1);
  return v5;
}

void sub_21B4F4BCC(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  int v6;
  int v7;

  v1 = 69008221 * (((a1 | 0xFE76185A) - (a1 & 0xFE76185A)) ^ 0x2DD44A50);
  v2 = *(_DWORD *)(a1 + 24) + v1;
  v3 = *(_DWORD *)a1 + v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x70F4C230EE5E63EBLL);
  v6 = v4 - 1284376108;
  v5 = v4 - 1284376108 < 0;
  v7 = 1284376108 - v4;
  if (!v5)
    v7 = v6;
  __asm { BR              X13 }
}

uint64_t sub_21B4F4C90(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v1
                                                               + 8
                                                               * ((29 * (v2 == (((v3 ^ 0x5D3) + 1489) ^ 0x5F825EA6))) ^ v3 ^ 0x5D3))
                                                   - ((2 * (v3 ^ 0x5D3u)) ^ 0x40ELL)))(a1, 1794188113);
}

uint64_t sub_21B4F4CE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t sub_21B4F4CF0(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v1
                                                             + 8
                                                             * (((((v2 - 35) ^ 1) & 1)
                                                               * (431 * ((v2 + 478) ^ 0x503) - 1280)) ^ (v2 + 478))))(a1, (v2 - 274) | 8u, 4147718108);
}

uint64_t sub_21B4F4D78@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W4>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 16) + a4 + a5 + ((a2 + 362) | 0x454u)) = ((a3 ^ v7) >> v8)
                                                                     + ((a2 - 24) ^ 0xE6)
                                                                     + (~(2 * ((a3 ^ v7) >> v8)) | 0x35);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (a2 ^ (314 * (a4 - 1 != v6)))) - 4))();
}

uint64_t sub_21B4F4DE4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  int v5;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v4
                                                             + 8
                                                             * (((((v5 == 24) ^ (a4 - 1)) & 1)
                                                               * (431 * ((a4 | 0x400) ^ 0x503) - 1280)) ^ (a4 | 0x400))))(a1, ((a4 | 0x400) - 752) | 8u, a3);
}

uint64_t sub_21B4F4E30(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  _BOOL4 v8;

  v8 = v4 > 0x29132104;
  if (v8 == v7 + 756380803 < ((2 * a4) ^ 0x802) - 689120029)
    v8 = v7 + 756380803 < v6;
  return (*(uint64_t (**)(void))(v5 + 8 * ((621 * v8) ^ a4)))();
}

uint64_t sub_21B4F4EA0@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  int v3;
  _QWORD *v4;
  int v5;

  return sub_21B4F4D78(a1, a2, *(_DWORD *)(*v4 + 4 * (v5 - 701983352)), v3, a3);
}

void sub_21B4F4ECC(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 241568881 * (((_DWORD)a1 - 348976960 - 2 * (a1 & 0xEB3308C0)) ^ 0x3D220C82);
  __asm { BR              X8 }
}

uint64_t sub_21B4F4F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18)
{
  uint64_t v18;
  int v19;
  uint64_t v20;

  a18 = v19
      + 944348131 * (((&a17 | 0x9944087A) - (&a17 & 0x9944087A)) ^ 0x3A5DAC34)
      - 504207722;
  v20 = sub_21B532C9C(&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((118 * (a17 == -611232798)) ^ v19)) - 12))(v20);
}

uint64_t sub_21B4F4FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, unsigned int a18, int a19)
{
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  a18 = (v21 - 100) ^ (831981571 * ((&a17 & 0xCFB3837C | ~(&a17 | 0xCFB3837C)) ^ 0xA9EDACA7));
  a17 = &STACK[0x543300C3A69A2031];
  sub_21B524100((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * (((a19 == v20) * ((v21 + 753) ^ 0x3B5)) ^ v21)) - 12))(v22, v23, v24, v25, v26, v27, v28, v29, a9);
}

uint64_t sub_21B4F5088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t *);
  uint64_t v26;
  uint64_t v28;

  v23 = v19[4];
  v28 = v19[5];
  v24 = v19[1];
  LODWORD(a17) = v22
               - 386
               + 1224239923
               * (((&a17 | 0x87AA180A) - &a17 + (&a17 & 0x7855E7F0)) ^ 0x7519E5DD);
  a18 = a14;
  a19 = v24;
  v25 = *(void (**)(uint64_t *))(v21 + 8 * (v22 - 1391));
  v25(&a17);
  LODWORD(a17) = v22
               - 386
               + 1224239923 * ((&a17 - 1284435760 - 2 * (&a17 & 0xB37110D0)) ^ 0x41C2ED07);
  a18 = a14;
  a19 = v23;
  v25(&a17);
  a17 = v28;
  LODWORD(a18) = (v22 - 702) ^ (831981571
                              * (((&a17 | 0x4D9C4E76) - (&a17 & 0x4D9C4E76)) ^ 0xD43D9E52));
  a19 = a14;
  v26 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v21 + 8 * (v22 - 1406)) - 4))(&a17);
  return (*(uint64_t (**)(uint64_t))(v20
                                            + 8
                                            * (((((((v22 ^ 9) - 760) ^ (HIDWORD(a18) == -611232798)) & 1) == 0) | (8 * (((((v22 ^ 9) - 760) ^ (HIDWORD(a18) == -611232798)) & 1) == 0))) ^ v22)))(v26);
}

uint64_t sub_21B4F51F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, unsigned int a20,int a21,unint64_t *a22,unsigned int a23)
{
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;

  v25 = (((&a18 | 0x2AFAC2E3) + (~&a18 | 0xD5053D1C)) ^ 0xF95890E8) * v24;
  a19 = a15;
  a23 = 1442065968 - v25;
  a22 = &STACK[0x236606C007542B5A];
  a20 = v25 ^ 0xD5A9A13E;
  a21 = (a11 - 2024874535) ^ v25;
  v26 = sub_21B5327E0((uint64_t)&a18);
  return (*(uint64_t (**)(uint64_t))(v23
                                            + 8
                                            * (int)(((a18 == ((a11 + 558877011) & 0xDEB033B4 ^ 0xDB915156))
                                                   * (((a11 + 41089583) & 0xFD8D07A7) - 987)) ^ a11)))(v26);
}

uint64_t sub_21B4F52E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, unsigned int a19)
{
  uint64_t v19;
  uint64_t v20;
  int v21;
  void (*v22)(unint64_t **);
  uint64_t v23;

  a19 = v21
      - 1468
      - 944348131 * ((-509127409 - (&a17 | 0xE1A7550F) + (&a17 | 0x1E58AAF0)) ^ 0xBD410EBE);
  a17 = &STACK[0x509D13A7D8C2F430];
  a18 = a15;
  v22 = (void (*)(unint64_t **))(*(_QWORD *)(v20 + 8 * (v21 - 1791)) - 12);
  v22(&a17);
  a19 = v21 - 1468 - 944348131 * ((2 * (&a17 & 0x2308738) - &a17 - 36734780) ^ 0x5ED6DC8A);
  a17 = &STACK[0x509D13A7D8C2F418];
  a18 = a15;
  v22(&a17);
  HIDWORD(a17) = v21 - 1543737703 * (&a17 ^ 0x7EF4507C) - 1043;
  a18 = a15;
  v23 = sub_21B5200C0((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * ((((_DWORD)a17 != -611232798)
                                                        * (((v21 - 1161582790) & 0x453C53F6) - 661)) ^ v21))
                                          - ((v21 - 1684320264) & 0x6464AFDF ^ 0x753)))(v23);
}

uint64_t sub_21B4F544C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  int v15;
  int v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * (((((a14 == v15) ^ (v16 + 90)) & 1) * (v16 - 1684)) ^ v16))
                            - 8))();
}

uint64_t sub_21B4F5480()
{
  uint64_t v0;
  int *v1;
  int v2;
  int v3;
  uint64_t result;
  void (*v5)(unsigned int *);
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;

  *v1 = v8 ^ v2;
  v9 = (v3 + 605) ^ (69008221 * (((&v9 | 0xD9A317AD) - (&v9 & 0xD9A317AD)) ^ 0xA0145A7));
  v10 = v7;
  v5(&v9);
  v9 = (v3 + 605) ^ (69008221 * (&v9 ^ 0xD3A2520A));
  v10 = v6;
  result = ((uint64_t (*)(unsigned int *))v5)(&v9);
  *(_DWORD *)(v0 + 24) = -611232798;
  return result;
}

void Mib5yocT(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  int v12;

  if (a2)
    v8 = a3 == 0;
  else
    v8 = 1;
  v12 = !v8 && a6 != 0 && a7 != 0 && a8 != 0;
  __asm { BR              X9 }
}

uint64_t sub_21B4F55E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _DWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, unsigned int a20)
{
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t v25;

  *a6 = 0;
  *a7 = 0;
  a20 = 944348131 * (((&a19 | 0x728156AB) - (&a19 & 0x728156AB)) ^ 0xD198F2E5) - 504207030;
  v25 = v20;
  v23 = sub_21B532C9C(&a19);
  return (*(uint64_t (**)(uint64_t))(v25 + 8 * ((1303 * (a19 == ((v22 - 192) ^ 0xC0))) ^ v21)))(v23);
}

uint64_t sub_21B4F5694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20,int a21,unsigned int a22)
{
  int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v23 = 2078219279 * ((&a19 - 1679926039 - 2 * (&a19 & 0x9BDE5CE9)) ^ 0x4124CA9D);
  HIDWORD(a19) = v23 + 1699736800;
  a20 = 1079066126 - v23;
  a21 = v23 + v22 + 862;
  a22 = 1517302066 - v23;
  ((void (*)(unint64_t **))((char *)*(&off_24DE82D70 + (v22 ^ 0xD4)) - 12))(&a19);
  HIDWORD(a10) = (_DWORD)a19;
  a19 = &STACK[0x543300C3A69A2039];
  a20 = (v22 + 400) ^ (831981571 * (&a19 ^ 0x99A1D024));
  sub_21B524100((uint64_t)&a19);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a13 + 8 * (((4 * (((v22 + 59) ^ (a21 == -611232798)) & 1)) & 0xF7 | (8 * (((v22 + 59) ^ (a21 == -611232798)) & 1))) ^ v22)))(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12);
}

uint64_t sub_21B4F57B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23)
{
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  void (*v31)(uint64_t *);
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;

  v29 = v23 & 0xDF688FEF;
  v30 = 460628867
      * (((&a19 | 0x9E7B58F1) - &a19 + (&a19 & 0x6184A708)) ^ 0xD2EDDA8C);
  a19 = a15;
  LODWORD(a20) = v30 + 1975134435 * v28 + 1486647557;
  HIDWORD(a20) = v29 + 366 + v30;
  v31 = (void (*)(uint64_t *))((char *)*(&off_24DE82D70 + (int)(v29 ^ 0x15C)) - 12);
  v31(&a19);
  a20 = a15;
  a21 = v27;
  LODWORD(a19) = v29
               + 1224239923 * ((&a19 - 59525104 - 2 * (&a19 & 0xFC73B810)) ^ 0xEC045C7)
               + 568;
  ((void (*)(uint64_t *))*(&off_24DE82D70 + (int)(v29 - 437)))(&a19);
  v32 = 460628867 * ((2 * (&a19 & 0x26AB3818) - &a19 + 1498728422) ^ 0x15C2459B);
  LODWORD(a20) = v32 + 1975134435 * v26 + 1486647557;
  HIDWORD(a20) = v29 + 366 + v32;
  a19 = a15;
  v31(&a19);
  v33 = 235795823 * ((&a19 & 0x4C3246F1 | ~(&a19 | 0x4C3246F1)) ^ 0x2760F057);
  a23 = ((v25 ^ 0x7E7AFFFF) - 536872519 + ((6 * (v29 ^ 0x1C9) - 50987214) & (2 * v25))) ^ v33;
  LODWORD(a21) = v29 - v33 + 61;
  a22 = a15;
  a20 = v24;
  v34 = ((uint64_t (*)(uint64_t *))*(&off_24DE82D70 + (int)(v29 ^ 0x1F4)))(&a19);
  return (*(uint64_t (**)(uint64_t))(a13
                                            + 8
                                            * (int)((((_DWORD)a19 == -611232798) | (4 * ((_DWORD)a19 == -611232798))) ^ v29)))(v34);
}

uint64_t sub_21B4F59F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,uint64_t a21,int a22,int a23,unint64_t *a24,unsigned int a25)
{
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;

  if (a11 >= ((v27 + 1944058669) & 0xBF31BEBF) + 679193623)
    v29 = 824007587;
  else
    v29 = -710303426;
  v30 = (&a20 ^ 0xD3A2520A) * v26;
  a21 = a16;
  a22 = v29 ^ v30;
  a23 = (v25 - 2024873574) ^ v30;
  a25 = -794285358 - v30;
  a24 = &STACK[0x236606C007542B62];
  v31 = sub_21B5327E0((uint64_t)&a20);
  return (*(uint64_t (**)(uint64_t))(a14
                                            + 8
                                            * ((1799 * (a20 == ((v28 + ((v25 - 193) | 0x51) - 559) ^ (v25 - 287)))) ^ v25)))(v31);
}

uint64_t sub_21B4F5ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unint64_t *a20,unsigned int a21,uint64_t a22,unint64_t *a23)
{
  uint64_t v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;

  a21 = v25 + 3804331 * ((2 * (&a20 & 0x76D035A8) - &a20 - 1993356717) ^ 0xF7FAEFA5) + 1213;
  a20 = &STACK[0x48FEE254074E96A8];
  a22 = a17;
  a23 = &STACK[0x6C482493D26EC635];
  v26 = v23;
  v27 = ((uint64_t (*)(unint64_t **))((char *)*(&off_24DE82D70 + (v25 ^ 0x1F2)) - 12))(&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26
                                                      + 8
                                                      * (int)((((v25 + 349734468) & 0xEB277AF7 ^ 0x259) * (a11 < v24)) ^ v25))
                                          - 12))(v27);
}

uint64_t sub_21B4F5BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char *a19, uint64_t a20,unsigned int a21)
{
  char *v21;
  int v22;
  void (*v23)(char **);
  uint64_t v24;
  int v25;
  uint64_t v26;

  a21 = v22
      - 944348131 * ((((2 * &a19) | 0xD7961DA4) - &a19 - 1808469714) ^ 0xC8D2AA9C)
      + 76;
  v25 = (v22 - 343) | 0x293;
  a19 = &a17 + v24;
  a20 = a16;
  v23(&a19);
  a21 = v25 - 240 - 944348131 * ((&a19 & 0x76A5E8B0 | ~(&a19 | 0x76A5E8B0)) ^ 0x2A43B301);
  a19 = v21;
  a20 = a16;
  v23(&a19);
  a21 = v25 - 240 - 944348131 * (((&a19 | 0x38F0D577) + (~&a19 | 0xC70F2A88)) ^ 0x9BE97138);
  a19 = a9;
  a20 = a16;
  v23(&a19);
  HIDWORD(a19) = v25
               - 1543737703
               * ((756299541 - (&a19 | 0x2D143715) + (&a19 | 0xD2EBC8EA)) ^ 0xAC1F9896)
               + 185;
  a20 = a16;
  v26 = sub_21B5200C0((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a13
                                                      + 8
                                                      * ((1621 * ((_DWORD)a19 == (v25 ^ 0x35C) - 611233289)) ^ v25))
                                          - 4))(v26);
}

uint64_t sub_21B4F5DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  int v19;
  int v20;
  _BOOL4 v21;

  v21 = a18 != v20 + v19 + 943 - 1614;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * (((8 * v21) | (32 * v21)) ^ v19))
                            - ((v19 - 180) ^ 0x1EFLL)))();
}

uint64_t sub_21B4F5DE8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, char a8)
{
  uint64_t v8;
  _BYTE *v9;
  int v10;

  *v9 = a8 ^ 0xE2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * ((222 * ((((a1 ^ 0xF9) + 52) ^ (a7 == v10)) & 1)) ^ a1))
                            - 12))();
}

uint64_t sub_21B4F5E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  _BOOL4 v17;

  v17 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24DE82D70 + (v15 ^ 0x255)))(v13 ^ v16, 1644418179) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a13 + 8 * ((1636 * ((((v15 - 1056898233) ^ v17) & 1) == 0)) ^ v15))
                            - (v14 ^ 0x1EF)))();
}

uint64_t sub_21B4F5EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14)
{
  int v14;
  int v15;
  int v16;

  v16 = (32 * (v14 & 0x3EFEFE6F ^ 0x471)) ^ (v15 - 992) ^ a14;
  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8
                                        * ((813
                                          * ((((v16 - ((2 * v16) & 0xDDFF4890) - 285236152) << (((v14 & 0x6F) + 73) ^ 0xB6)) & 0x7FE3EFFE ^ 0x5DE34890)
                                           + ((v16 - ((2 * v16) & 0xDDFF4890) - 285236152) ^ 0xD10E53B7)
                                           - 33646448 != 1039175823)) ^ v14 & 0x3EFEFE6Fu))
                            - 8))();
}

uint64_t sub_21B4F5F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;

  return (*(uint64_t (**)(uint64_t, _QWORD))(a8
                                                    + 8
                                                    * (((4
                                                       * ((((v9 + v8 - 1072822271) < 8) ^ (v10 - 100 + v10 - 35)) & 1)) & 0xEF | (16 * ((((v9 + v8 - 1072822271) < 8) ^ (v10 - 100 + v10 - 35)) & 1))) ^ v10)))(a1, (v10 + 999668701) & 0xF77BFAEF);
}

uint64_t sub_21B4F5FDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8
                                        * (a3 & 0x286D07FB ^ (250 * ((unint64_t)(v8 - a1) < 0x20))))
                            - (((a3 & 0x286D07FB) + v9) ^ (v9 + 1378))
                            + 50))();
}

uint64_t sub_21B4F6020(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8 * ((((a4 - 1208878155) & 0x7B1FBEBD ^ (v9 + 1235)) * (v8 < 0x20)) ^ a4))
                            - 4))();
}

uint64_t sub_21B4F6064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v15 = v13 + v12 + v11 + 992;
  v16 = v8 + v15;
  v17 = *(_OWORD *)(v16 - 31);
  v18 = a1 + v15;
  *(_OWORD *)(v18 - 15) = *(_OWORD *)(v16 - 15);
  *(_OWORD *)(v18 - 31) = v17;
  return (*(uint64_t (**)(void))(a8 + 8 * ((((v10 & 0xFFFFFFE0) == 32) * ((v14 + v9) ^ 0x3AD)) ^ (v14 + v9 + 1197))))();
}

void sub_21B4F60BC()
{
  JUMPOUT(0x21B4F6084);
}

uint64_t sub_21B4F60C8(uint64_t a1)
{
  int v1;
  int v2;
  void (*v3)(unsigned int *);
  int v4;
  int v5;
  unsigned int v6;
  _QWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  *v8 = a1;
  *v9 = v2;
  v6 = ((v1 ^ 0x35C) + 1763163667) & 0x96E840CD;
  v12 = ((v1 ^ 0x35C) + 806) ^ (((((&v12 | 0x3689672) ^ 0xFFFFFFFE) - (~&v12 | 0xFC97698D)) ^ 0x2F353B87)
                              * v4);
  v13 = v11;
  v3(&v12);
  v12 = (v6 + 1093) ^ (((((&v12 | 0x5ACF7326) ^ 0xFFFFFFFE) - (~&v12 | 0xA5308CD9)) ^ 0x7692DED3)
                     * v4);
  v13 = v10;
  v3(&v12);
  return v5 ^ 0xDB9153E2;
}

void sub_21B4F6388(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  char *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  unint64_t *v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  unsigned int v39;
  char v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  int v46;
  unint64_t *v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)a1 + 831981571 * ((a1 - 2 * (a1 & 0x2CD83689) + 752367241) ^ 0xB579E6AD);
  v37 = *(_DWORD *)(a1 + 32) ^ (831981571 * ((a1 - 2 * (a1 & 0x2CD83689) + 752367241) ^ 0xB579E6AD));
  v3 = *(_DWORD *)(a1 + 8);
  v16 = 831981571 * ((a1 - 2 * (a1 & 0xE703D1572CD83689) - 0x18FC2EA8D327C977) ^ 0x36F39017B579E6ADLL);
  v4 = v3 ^ (831981571 * ((a1 - 2 * (a1 & 0x2CD83689) + 752367241) ^ 0xB579E6AD));
  v5 = 831981571
     * (((&v46 | 0xF7AF542C) - &v46 + (&v46 & 0x850ABD0)) ^ 0x6E0E8408);
  v46 = v5 ^ 0x28D728C6;
  v48 = v2 + v5 - 1882357516;
  v23 = &STACK[0x520F56D3BDEB7EEF];
  v47 = &STACK[0x520F56D3BDEB7EEF];
  sub_21B4EE28C((uint64_t)&v46);
  v34 = v4 + 1718511535;
  v33 = -868280525;
  v15 = v4 - 1705352642;
  v17 = v4 - 672007145;
  v27 = &v44;
  v8 = (char *)&v8 - 123221708;
  v11 = v2 ^ 0x79F;
  v10 = (v2 - 1204666682) & 0x47CDC3E5;
  v38 = v2 ^ 0x613;
  v24 = 25 * (v2 ^ 0xB);
  v26 = v2 ^ 0x61E ^ v24;
  v32 = v2 - 1320078423;
  v30 = (v2 - 238590277) & 0xE389F5F;
  v31 = v30 - 868282337;
  v39 = (v2 + 1973925829) & 0x8A584BD6;
  v12 = v2 ^ 0x48;
  v13 = v2 ^ 0x96AC9E23;
  v9 = v2 - 1814874169;
  v25 = (v2 - 1814874169);
  v36 = v25;
  v28 = v4 + 827492388;
  v29 = v2;
  v18 = a1;
  v14 = v10 + 829332702;
  v21 = vdupq_n_s32(0xDB9153E2);
  v22 = vdupq_n_s32(0x5B9153FAu);
  v20 = vdupq_n_s32(0x5B9153E7u);
  v35 = *(_QWORD *)(a1 + 16);
  v6 = (uint64_t)*(&off_24DE82D70 + v2 - 6);
  v19 = *(_QWORD *)(v6 + 8 * v2) - 4;
  v7 = v37 + (v2 ^ 0x96AC9E23) - ((2 * v37 + 1005231216) & (v10 + 829332702));
  v40 = (HIBYTE(v7) ^ 0x98) - ((v7 >> 23) & 0xCA) - 27;
  v41 = (BYTE2(v7) ^ 0xB7) - ((2 * (BYTE2(v7) ^ 0xB7)) & 0xCA) - 27;
  v42 = (BYTE1(v7) ^ 0x4F) + (~(2 * (BYTE1(v7) ^ 0x4F)) | 0x35) - 26;
  v43 = (v37 + (v2 ^ 0x23) - ((2 * v37 + 112) & (v10 - 34))) ^ 0x3A;
  __asm { BR              X9 }
}

uint64_t sub_21B4F67F0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;

  v16 = v11 + a4;
  if (v16 <= 0x40)
    v16 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15
                                                                                 + 8
                                                                                 * ((((a11 - 542) ^ 0x226 ^ ((a11 - 219) | 0x104))
                                                                                   * (v14 - v12 - v13 + v16 < 0xF)) ^ a11))
                                                                     - 8))(3445233613, a2, a3, -1225318619);
}

uint64_t sub_21B4F6874()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  BOOL v7;

  v5 = v2 + v1 + 1291849924;
  if (v5 <= 0x40)
    v6 = 64;
  else
    v6 = v2 + v1 + 1291849924;
  v7 = __CFADD__(v5 - 1, v3 + v6);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((((v7 ^ (v0 - 71)) & 1) * (v0 - 1954)) ^ v0))
                            - 8))();
}

uint64_t sub_21B4F68CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  int v31;
  uint64_t v32;
  int v33;
  _OWORD *v34;
  uint64_t v35;

  *(_OWORD *)(a2 + (a8 + v33)) = *v34;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 + 8 * ((1436 * ((((v31 - 596) | 0x14u) ^ 0x584) == ((v32 + 1) & 0x1FFFFFFF0))) ^ (v31 - 1141))) - 8))(a1, a2, a3, 20, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

uint64_t sub_21B4F693C@<X0>(uint64_t a1@<X1>, int a2@<W3>, int a3@<W8>, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,char a39,char a40)
{
  int v40;
  uint64_t v41;

  *(_BYTE *)(a1 + ((a6 + 319) ^ (a2 + 1048)) + v40) = a39;
  *(_BYTE *)(a1 + a3 + ((a6 + 143062431) & 0xF77907B4 ^ 0xCD5A17F9)) = a40;
  return (*(uint64_t (**)(void))(v41 + 8 * (a6 + 319)))();
}

uint64_t sub_21B4F69E8@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(a1 + (v5 + a2 + 1)) = *(_BYTE *)(v7 + (v4 - 1225318617));
  return (*(uint64_t (**)(void))(v8 + 8 * ((((2 * (v3 + 1)) ^ 0x99C) * ((v2 & 0xFFFFFFFC) == v6)) ^ (v3 + 1))))();
}

uint64_t sub_21B4F6A3C@<X0>(uint64_t a1@<X1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t), uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  *(_BYTE *)(a1 + ((v20 - 1004) ^ (v22 + 46)) + a2) = *(_BYTE *)(v23 + (v21 - 1225318616));
  v25 = 831981571 * ((~((v24 - 160) | 0x31EC5CC1) + ((v24 - 160) & 0x31EC5CC1)) ^ 0x57B2731A);
  *(_DWORD *)(v24 - 160) = v25 + v20 - 1004 + 858;
  *(_DWORD *)(v24 - 144) = v25 + 1036168095;
  *(_QWORD *)(v24 - 152) = a20;
  v26 = sub_21B4EE180(v24 - 160);
  return a12(v26);
}

uint64_t sub_21B4F6AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34)
{
  uint64_t v34;

  return (*(uint64_t (**)(uint64_t, unint64_t *))(v34
                                                                + 8
                                                                * ((446
                                                                  * (a15
                                                                   + (a12 & (2 * LODWORD(STACK[0x33C])) ^ (((a34 + 29) | 0x10C) - 345))
                                                                   + (STACK[0x33C] & 0x3F ^ 0xFFD4EDFD) < 0xFFFFFFC0)) ^ (a34 + 1560))))(3122253083, &STACK[0x2F8]);
}

uint64_t sub_21B4F6B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  unsigned int v33;

  v33 = v31 + (((a3 ^ 0xF0) + 544) ^ 0x2B10E7);
  if (v33 <= 0x40)
    v33 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * (int)((2031 * (-v29 - 2822659 - v30 + v33 > 0xE)) ^ a3 ^ 0xF0)) - 8))(a1, a2, a3, 3875251455, 419715621, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_21B4F6BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  _BOOL4 v11;

  v9 = v5 + v4;
  v10 = v9 + ((v3 - 2044848629) & 0x79E1EDBD ^ 0x2B168E);
  if (v10 <= 0x40)
    v10 = 64;
  v11 = !__CFADD__(v9 + 2822658, v7 + v10);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * ((573 * v11) ^ v3))
                                                                     - v6
                                                                     + 732))(a1, a2, a3, 3875251455);
}

uint64_t sub_21B4F6C84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  int v30;
  uint64_t v31;
  int v32;
  int8x16_t *v33;
  uint64_t v34;
  int8x16_t v35;
  int8x16_t v36;

  *(int8x16_t *)(a2 + v30 + v32 + a9 - 969) = vaddq_s8(vsubq_s8(*v33, vandq_s8(vaddq_s8(*v33, *v33), v36)), v35);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 + 8 * ((60 * (((v31 + 1) & 0x1FFFFFFF0) == 16)) ^ a9)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30);
}

void sub_21B4F6CEC()
{
  JUMPOUT(0x21B4F6CB4);
}

uint64_t sub_21B4F6CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                                 + 8
                                                                                 * (int)(((v3 != v4)
                                                                                        * ((v5 + 398557387) & 0xE83E79AF ^ 0x3ED)) ^ v5))
                                                                     - 4))(a1, a2, a3, -1225318619);
}

uint64_t sub_21B4F6D54@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X3>, int a4@<W4>, int a5@<W8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;

  *(_BYTE *)(a2 + (a5 + v7)) = *(_BYTE *)(v6 + v9 + a3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((a5 + a1 >= ((v5 + v8) & v11) + 49) * a4) ^ v5)) - 4))();
}

uint64_t sub_21B4F6D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41)
{
  int v41;
  uint64_t v42;
  int v43;
  int v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, _QWORD, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t);
  int v61;
  _BOOL4 v63;
  uint64_t v64;
  int v65;

  v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8 * v41);
  v64 = v42;
  v48 = STACK[0x344];
  v49 = STACK[0x344];
  v50 = STACK[0x348];
  v51 = STACK[0x34C];
  v52 = STACK[0x348];
  v65 = STACK[0x34C];
  v53 = LOBYTE(STACK[0x358]) ^ 0xA4;
  if (v53 == 2)
  {
    v61 = a3 + 1743;
    v63 = (unint64_t)&STACK[0x2F8] < a30 && v45 < (unint64_t)&STACK[0x338];
    return (*(uint64_t (**)(uint64_t))(v46 + 8 * (int)((a29 * v63) ^ v61)))(128118530);
  }
  else if (v53 == 1)
  {
    v54 = (a3 + 1165);
    v55 = a3 + 916;
    v57 = (unint64_t)&STACK[0x2F8] < a30 && v45 < (unint64_t)&STACK[0x338];
    v58 = (a41 - 952);
    v59 = (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v46 + 8 * (int)((v58 * v57) ^ v55)) - (v54 ^ 0x4CD));
    return v59(v54, v59, v58, 4294967204, &STACK[0x2F8], a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             v64,
             a29,
             a30,
             a31);
  }
  else
  {
    LODWORD(STACK[0x340]) = 2 * (LODWORD(STACK[0x340]) ^ v43) + v43 - (v44 & (4 * (LODWORD(STACK[0x340]) ^ v43)));
    LODWORD(STACK[0x344]) = (v49 ^ v43) + (v48 ^ v43) + v43 - (v44 & (2 * ((v49 ^ v43) + (v48 ^ v43))));
    LODWORD(STACK[0x348]) = (v52 ^ v43) + (v50 ^ v43) + v43 - (v44 & (2 * ((v52 ^ v43) + (v50 ^ v43))));
    LODWORD(STACK[0x34C]) = (v51 ^ v43) + (v65 ^ v43) + v43 - (v44 & (2 * ((v51 ^ v43) + (v65 ^ v43))));
    return v47(3122253083, a2, a3, 105253599, 659);
  }
}

uint64_t sub_21B4F7BF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,int a34,unsigned int a35,unsigned int a36,uint64_t a37,uint64_t a38,int a39)
{
  uint64_t v39;
  _BOOL4 v40;

  if (a36 < a35 != a39 - 2040994674 < (a33 ^ a34 & 0x4EAECD7Fu))
    v40 = a39 - 2040994674 < (a33 ^ a34 & 0x4EAECD7Fu);
  else
    v40 = a39 - 2040994674 > a36;
  return (*(uint64_t (**)(void))(v39 + 8 * ((104 * v40) ^ (a3 + 1520))))();
}

uint64_t sub_21B4F7C74@<X0>(int a1@<W0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27)
{
  uint64_t v27;

  return ((uint64_t (*)(void))(*(_QWORD *)(v27
                                        + 8 * (a27 ^ (56 * (a2 + a1 + 63 < (a2 + a1)))))
                            - ((a27 + 40) ^ 0x67FLL)))();
}

uint64_t sub_21B4F7CB8@<X0>(int a1@<W0>, uint64_t a2@<X1>, char a3@<W7>, int a4@<W8>)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_BYTE *)(a2 + v4) = *(_BYTE *)(v7 + (a4 + a1))
                      + (a3 | ~(2 * *(_BYTE *)(v7 + (a4 + a1))))
                      - 26;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v4 + 1 == (((v5 - 1628) | 4) ^ v9)) * v6) ^ v5)) - 8))();
}

uint64_t sub_21B4F7D08@<X0>(int a1@<W0>, int8x16_t *a2@<X1>, unsigned int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;

  *a2 = vaddq_s8(vaddq_s8(*(int8x16_t *)(v7 + (a5 + a1)), v10), vmvnq_s8(vandq_s8(vaddq_s8(*(int8x16_t *)(v7 + (a5 + a1)), *(int8x16_t *)(v7 + (a5 + a1))), v9)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * (((((v5 + v6) & a3 ^ 0xFLL) == 64) * a4) ^ (v5 + 1313)))
                            - 8))();
}

uint64_t sub_21B4F7D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28)
{
  uint64_t v28;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28
                                                                        + 8
                                                                        * ((213
                                                                          * (a28 - 1225318560 >= (_DWORD)a3
                                                                                               + 16
                                                                                               + (a3 ^ 0x414)
                                                                                               - 1129)) ^ ((int)a3 + 1815)))
                                                            - 12))(a1, a2, a3);
}

uint64_t sub_21B4F7DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  uint64_t v12;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12
                                                                        + 8
                                                                        * ((213
                                                                          * (a12 - 1225318560 >= (_DWORD)a3
                                                                                               + 16
                                                                                               + (a3 ^ 0x414)
                                                                                               - 1129)) ^ ((int)a3 + 1815)))
                                                            - 12))(a1, a2, a3);
}

void sub_21B4F7E1C()
{
  JUMPOUT(0x21B4F6EC8);
}

uint64_t sub_21B4F7E48@<X0>(unsigned int a1@<W5>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = a1 < 0x972337A8;
  if (v4 == (a2 + 1362953411) < 0x972337A8)
    v4 = a2 + 1362953411 < a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((v4 * (((v2 - 349) | 0x35B) - 799)) ^ v2)) - 12))();
}

uint64_t sub_21B4F7EB0@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, char a4@<W3>, unsigned int a5@<W5>, char a6@<W6>, int a7@<W8>)
{
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v13 = a5 < v10;
  *(_BYTE *)(a2 + (v7 + v9)) = *(_BYTE *)(v11 + (a7 + a1))
                                           + ((v8 - 2) ^ a4)
                                           - (a6 & (2 * *(_BYTE *)(v11 + (a7 + a1))));
  v14 = a7 + 1 + a3;
  v15 = v13 ^ (v14 < v10);
  v16 = v14 < a5;
  if (!v15)
    v13 = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((60 * v13) ^ v8)) - 12))();
}

uint64_t sub_21B4F7F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v30 = 831981571 * ((((v29 - 160) | 0xEFB9675C) - (v29 - 160) + ((v29 - 160) & 0x104698A0)) ^ 0x7618B778);
  *(_DWORD *)(v29 - 144) = a16 + v30;
  *(_QWORD *)(v29 - 152) = a27;
  *(_DWORD *)(v29 - 160) = v30 + v27 + 51;
  sub_21B4EE180(v29 - 160);
  v31 = STACK[0x33C] & 0x3F;
  *((_BYTE *)&STACK[0x2F8] + (v31 ^ 3)) = 101;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v28 + 8 * ((62 * ((v31 ^ 3) > 0x37)) ^ v27))
                                          - ((v27 ^ 0x1D1u)
                                           - 598)
                                          + 40))(3122253083);
}

uint64_t sub_21B4F8018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35)
{
  uint64_t v35;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35
                                                                                 + 8
                                                                                 * ((7 * (a4 == ((a35 - 48) ^ 0x265))) ^ a35))
                                                                     - (((a35 - 632) | 4u) ^ 0x1ELL)))(a1, a2, a3, 607);
}

uint64_t sub_21B4F8068()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((224 * (((13 * (v1 ^ 0x25E) + ((v1 - 569) | 0x100) - 281) ^ v0) > 7)) ^ v1))
                            - 12))();
}

uint64_t sub_21B4F80AC(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a2 + v3 + v5) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((756 * (((v4 - 265) | 0x242u) - 594 == (v2 & 0x38))) ^ v4)) - 4))();
}

uint64_t sub_21B4F80FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                                 + 8
                                                                                 * (int)((((v3 - 123221425) < 0x38)
                                                                                        * (((v4 + 1058571205) & 0xC0E77FF7)
                                                                                         + 894)) ^ (v4 + 876)))
                                                                     - 12))(a1, a2, a3, 435);
}

uint64_t sub_21B4F8154@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v1;
  v5 = v2 + v1;
  if ((unint64_t)(v5 + 1) > 0x38)
    v6 = v5 + 1;
  else
    v6 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((2018 * (v6 - v4 + (unint64_t)(2 * (a1 ^ 0xDAu)) + 123219803 < 8)) ^ a1))
                            - ((a1 ^ 0xDAu)
                             - 759)
                            + 44))();
}

uint64_t sub_21B4F81B8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(a9 + v11 + 149 * (v9 ^ 0x651u)) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((((v10 & 0xFFFFFFFFFFFFFFF8) == 8) * a4) ^ v9)) - 12))();
}

uint64_t sub_21B4F8200(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v7 + v5) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v6 == 0) * a4) ^ v4)) - 12))();
}

uint64_t sub_21B4F8228()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (207 * (v0 == v1)))) - ((v2 + 1389342820) & 0xAD304BBC) + 44))();
}

uint64_t sub_21B4F8264@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  *(_BYTE *)(a1 + a2 + v3) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((((unint64_t)(a2 + 1 + v3) > 0x37) | (32
                                                                                      * ((unint64_t)(a2 + 1 + v3) > 0x37))) ^ (v2 + 845)))
                            - 12))();
}

void sub_21B4F8294(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char a8, uint64_t a9, char a10)
{
  int v10;
  unsigned int v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  char v18;
  unint64_t v19;

  v10 = LOBYTE(STACK[0x358]) ^ 0xA4;
  if (v10 == 1)
  {
    v16 = STACK[0x33C];
    v17 = STACK[0x338];
    v18 = ((LODWORD(STACK[0x33C]) >> 5) ^ 0xA4)
        - 2 * (((LODWORD(STACK[0x33C]) >> 5) ^ 0xA4) & 0xE7 ^ (LODWORD(STACK[0x33C]) >> 5) & 2);
    LOBYTE(STACK[0x330]) = (a3 ^ 0x26 ^ (8 * LOBYTE(STACK[0x33C])) ^ 0xA) - ((16 * LOBYTE(STACK[0x33C])) & 0xC0) - 27;
    LOBYTE(STACK[0x331]) = v18 - 27;
    LOBYTE(STACK[0x332]) = ((v16 >> 13) ^ 0x3A) - (a7 & (2 * ((v16 >> 13) ^ 0x3A))) - 27;
    LOBYTE(STACK[0x333]) = ((v16 >> 21) ^ 0x8A) + (a8 | ~(v16 >> 20)) - 26;
    HIDWORD(v19) = v17;
    LODWORD(v19) = v16 ^ 0x80000000;
    LOBYTE(STACK[0x334]) = (v19 >> 29) - (a7 & (2 * (v19 >> 29))) - 27;
    LOBYTE(STACK[0x335]) = ((v17 >> 5) ^ 0xF5) - (a7 & (2 * ((v17 >> 5) ^ 0xF5))) - 27;
    LOBYTE(STACK[0x336]) = ((v17 >> 13) ^ 0x4D) - 2 * (((v17 >> 13) ^ 0x4D) & 0xE7 ^ (v17 >> 13) & 2) - 27;
    v15 = ((v17 >> 21) ^ 0x30) + ~(2 * (((v17 >> 21) ^ 0x30) & 0x67 ^ (v17 >> 21) & 2)) - 26;
  }
  else
  {
    if (v10 != 2)
      goto LABEL_6;
    v11 = STACK[0x33C];
    v12 = ((LODWORD(STACK[0x338]) >> 13) ^ 0x4D)
        - 2 * (((LODWORD(STACK[0x338]) >> 13) ^ 0x4D) & ((a10 & 0x16) + 85) ^ (LODWORD(STACK[0x338]) >> 13) & 2);
    v13 = ((LODWORD(STACK[0x338]) >> 5) ^ 0xFFFFFFF5)
        - 2 * (((LODWORD(STACK[0x338]) >> 5) ^ 0xFFFFFFF5) & 0xFFFFFFE7 ^ (LODWORD(STACK[0x338]) >> 5) & 2);
    HIDWORD(v14) = STACK[0x338];
    LODWORD(v14) = LODWORD(STACK[0x33C]) ^ 0x80000000;
    LOBYTE(STACK[0x330]) = ((LODWORD(STACK[0x338]) >> 21) ^ 0x30)
                         - (a7 & (2 * ((LODWORD(STACK[0x338]) >> 21) ^ 0x30)))
                         - 27;
    LOBYTE(STACK[0x331]) = v12 - 27;
    LOBYTE(STACK[0x332]) = v13 - 27;
    LOBYTE(STACK[0x333]) = (v14 >> 29) - (a7 & (2 * (v14 >> 29))) - 27;
    LOBYTE(STACK[0x334]) = ((v11 >> 21) ^ 0x8A) - (a7 & (v11 >> 20)) - 27;
    LOBYTE(STACK[0x335]) = ((v11 >> 13) ^ 0x3A) - (a7 & (2 * ((v11 >> 13) ^ 0x3A))) - 27;
    LOBYTE(STACK[0x336]) = ((v11 >> 5) ^ 0xA4) - (a7 & (2 * ((v11 >> 5) ^ 0xA4))) - 27;
    v15 = ((8 * v11) ^ 0x18) - (v11 >> 2 << 6) - 27;
  }
  LOBYTE(STACK[0x337]) = v15;
LABEL_6:
  JUMPOUT(0x21B4F6EC4);
}

uint64_t sub_21B4F84E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                                 + 8
                                                                                 * (((((v5 - 582) | 0x20) + 1789)
                                                                                   * (v4 == v3)) ^ v5))
                                                                     - ((2 * v5) ^ 0x4A2u)
                                                                     + 10))(a1, a2, a3, 607);
}

uint64_t sub_21B4F8524@<X0>(uint64_t a1@<X1>, int a2@<W3>, int a3@<W8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  *(_BYTE *)(a1 + v3 + v4) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8 * ((((unint64_t)(v3 + 1 + v4) < 0x40) * (a3 ^ a2)) ^ (a3 + 1335)))
                            - 12))();
}

void sub_21B4F855C()
{
  JUMPOUT(0x21B4F6EB4);
}

uint64_t sub_21B4F856C@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((11 * (v1 + v2 < 13 * (a1 ^ 0x424u) - 48)) ^ a1)))();
}

uint64_t sub_21B4F85B4@<X0>(int a1@<W8>)
{
  int v1;
  unsigned int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  LOBYTE(STACK[0x2F8]) = *(_BYTE *)(v4 + v2);
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1728 * (v3 + v1 + ((5 * (a1 ^ 0x4F3) + 518342174) & 0xE11AB5F6) - 51 > 3)) ^ a1 ^ 0x6C0)))();
}

void sub_21B4F860C()
{
  JUMPOUT(0x21B4F6980);
}

uint64_t sub_21B4F8624(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;

  if (a37 == 2)
    return (*(uint64_t (**)(uint64_t))(v42
                                              + 8
                                              * ((210 * (LODWORD(STACK[0x354]) == 161 * (a3 ^ 0x36) + 1922694105)) ^ (a3 + 270))))(a17);
  if (a37 == 1)
    return (*(uint64_t (**)(void))(v42 + 8 * ((1452 * (LODWORD(STACK[0x354]) != (a3 ^ 0x7299FD2F))) ^ (a3 + 348))))();
  v44 = 7 * (a3 ^ 0xF1u);
  v45 = ((unint64_t)&a42 ^ 0xF3FB3FDF7BFFFDF6)
      + ((2 * (_QWORD)&a42) & 0xE7F67FBEF7FFFBE0)
      + 0xE17E3AFD7FF0DA7
      + v44;
  LOBYTE(STACK[0x353]) = (v45 ^ (7 * (a3 ^ 0xF1) + 87)) * (v45 + 17);
  return ((uint64_t (*)(void))(*(_QWORD *)(v42 + 8 * (int)v44) - 4))();
}

void sub_21B4F8950()
{
  JUMPOUT(0x21B4F8920);
}

uint64_t sub_21B4F8958@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;

  v2 = *(_QWORD *)(v6 + 40);
  v3 = *(_QWORD *)(v6 + 24);
  v4 = 235795823 * (((v1 - 160) & 0x6178081D | ~((v1 - 160) | 0x6178081D)) ^ 0xA2ABEBB);
  *(_QWORD *)(v1 - 120) = &STACK[0x19A1466F6B33134];
  *(_DWORD *)(v1 - 152) = v4 + 1894514085;
  *(_QWORD *)(v1 - 144) = v1 - 180;
  *(_QWORD *)(v1 - 136) = v3;
  *(_DWORD *)(v1 - 124) = (a1 + 1839) ^ v4;
  *(_QWORD *)(v1 - 160) = v2;
  result = ((uint64_t (*)(uint64_t))*(&off_24DE82D70 + a1 + 102))(v1 - 160);
  *(_DWORD *)(v6 + 4) = *(_DWORD *)(v1 - 128);
  return result;
}

void sub_21B4F8A54(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 24) ^ (3804331 * (((a1 | 0x4D9A820B) - (a1 & 0x4D9A820B)) ^ 0x334FA7FD));
  v2 = (*(_BYTE *)(a1 + 8) - 85 * (((a1 | 0xB) - (a1 & 0xB)) ^ 0xFD));
  ((void (*)(_QWORD, void (*)()))*(&off_24DE82D70 + v1 - 909))(*(&off_24DE82D70 + v1 - 1070), sub_21B533434);
  v3 = *(_QWORD *)*(&off_24DE82D70 + v1 - 1130);
  v4 = (1543737703 * ((2 * (&v4 & 0x1D3B3870) - &v4 + 1657063306) ^ 0x1C3097F6)) ^ (v1 - 927);
  v5 = v3;
  sub_21B51FFA4((uint64_t)&v4);
  __asm { BR              X8 }
}

uint64_t sub_21B4F8B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, unsigned int a17)
{
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  a16 = 93 * (((~&a16 | 0x78) + (&a16 | 0x87)) ^ 0x8C) + 67;
  a17 = (v17 - 548) ^ (69008221 * (((~&a16 | 0xEFCFED78) + (&a16 | 0x10301287)) ^ 0xC392408C));
  sub_21B52F9F4((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * ((1646 * (**(_DWORD **)(v19 + 8 * (v17 - 915)) == ((((v17 - 499959678) & 0x1DCCC77D) - 680) ^ 0x1C5))) | (v17 - 1005))) - 4))(v20, v21, v22, v23, v24, v25, v26, v27);
}

uint64_t sub_21B4F8C44@<X0>(int a1@<W8>)
{
  uint64_t *v1;
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t (*v13)(uint64_t, _BYTE *, _DWORD *);
  int v14;
  unsigned int v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  unsigned int v19;
  uint64_t result;
  uint64_t v21;
  _BYTE v22[30];
  _BYTE v23[140];

  v8 = *(unsigned int **)(v6 + 8 * (a1 & 0x1A71EA98));
  v9 = *v8;
  v10 = *(_QWORD **)(v6 + 8 * (a1 ^ 0x415u));
  v11 = (_BYTE *)*v10;
  v22[0] = *(_BYTE *)*v10 - 31;
  v22[1] = v11[1] - 31;
  v22[2] = v11[2] - 31;
  v22[3] = v11[3] - 31;
  v22[4] = v11[4] - 31;
  v22[5] = v11[5] - 31;
  v22[6] = v11[6] - 31;
  v22[7] = v11[7] - 31;
  v22[8] = v11[8] - 31;
  v22[9] = v11[9] - 31;
  v22[10] = v11[10] - 31;
  v22[11] = v11[11] - 31;
  v22[12] = v11[12] - 31;
  v22[13] = v11[13] - 31;
  v22[14] = v11[14] - 31;
  v22[15] = v11[15] - 31;
  v22[16] = v11[16] - 31;
  v22[17] = v11[17] - 31;
  v22[18] = v11[18] - 31;
  v22[19] = v11[19] - 31;
  v22[20] = v11[20] - 31;
  v22[21] = v11[21] - 31;
  v12 = (_BYTE *)*v10;
  v22[22] = v12[22] - 31;
  v22[23] = v12[23] - 31;
  v22[24] = v12[24] - 31;
  v22[25] = v12[25] - 31;
  v22[26] = v12[26] - 31;
  v22[27] = v12[27] - 31;
  v22[28] = v12[28] - 31;
  v22[29] = v12[29] - 31;
  v13 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v6 + 8 * (a1 ^ 0x484u));
  v14 = v13(v9, v22, v2);
  v15 = ((2 * v14) & 0xDF6DFFEE) + (v14 ^ 0x6FB6FFF7);
  if (v15 != 1874264055)
  {
    if (v15 == 1874265157)
    {
      v16 = *v8;
      v17 = **(_BYTE ***)(v6 + 8 * (v4 ^ 0x45A));
      v23[0] = *v17 - 31;
      v23[1] = v17[1] - 31;
      v23[2] = v17[2] - 31;
      v23[3] = v17[3] - 31;
      v23[4] = v17[4] - 31;
      v23[5] = v17[5] - 31;
      v23[6] = v17[6] - 31;
      v23[7] = v17[7] - 31;
      v23[8] = v17[8] - 31;
      v23[9] = v17[9] - 31;
      v23[10] = v17[10] - 31;
      v23[11] = v17[11] - 31;
      v23[12] = v17[12] - 31;
      v23[13] = v17[13] - 31;
      v23[14] = v17[14] - 31;
      v23[15] = v17[15] - 31;
      v23[16] = v17[16] - 31;
      v23[17] = v17[17] - 31;
      v23[18] = v17[18] - 31;
      v23[19] = v17[19] - 31;
      v18 = v13(v16, v23, v2);
      v19 = (2 * v18) & 0xFF63EEBE;
      v15 = (v18 ^ 0x7FB1F75F) - 856752140;
    }
    else
    {
      v19 = -588646564;
    }
    __asm { BR              X8 }
  }
  *(_DWORD *)(v7 + 348) |= (151 * (v4 ^ 0x46E)) ^ 0x1CF;
  *(_DWORD *)(v7 + 48) = 1994143143;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8 * (v4 - 1026)))(*v2, v7 + 336, v7 + 340, v7 + 344, v3);
  v21 = *v1;
  *(_DWORD *)(v1[2] - 0x6EDAADCA9171F84DLL) = *v2;
  *(_DWORD *)(v21 - 0x3DB438D5FEF87141) = *v3;
  *((_DWORD *)v1 + 7) = -611232798;
  return result;
}

void sub_21B4F9080(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 12) - 1224239923 * ((((2 * a1) | 0x124C8F9E) - a1 - 153503695) ^ 0xFB95BA18);
  __asm { BR              X9 }
}

uint64_t sub_21B4F9158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;
  int v9;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v17;

  v17 = (*(_DWORD *)(a1 + 24) ^ v13) + *(_DWORD *)(v8 - 0x4FF269813004C2DBLL);
  v14 = 460628867 * (&a5 ^ 0x4C96827D);
  a5 = (v9 - 613) ^ v14;
  a6 = v8;
  a7 = (v17 + 1740602968) ^ v14;
  a8 = v14 ^ 0x71429417;
  v15 = ((uint64_t (*)(int *))(*(_QWORD *)(a2 + 8 * (v9 ^ 0x319)) - 8))(&a5);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v12 + 8 * ((2962 * (*v10 == v11 + v9 + 1020 - 1916)) ^ v9))
                                          - 12))(v15);
}

uint64_t sub_21B4F9218()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((227 * (((v2 ^ (*(_QWORD *)(v0 + 16) == 0x4670A1604A080045)) & 1) == 0)) ^ v2))
                            - ((v2 - 1916) | 0x380u)
                            + 884))();
}

uint64_t sub_21B4F9274@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  _DWORD *v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(v2 - 0x4670A1604A080045) = (*v3 + a1) + *(_QWORD *)(v4 - 0x4FF269813004C2EBLL) + 8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((1585 * (*v5 == v6)) ^ v1)) - 12))();
}

void sub_21B4F92D0(int a1@<W8>)
{
  int v1;
  _DWORD *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(v3 - 0x4FF269813004C2EBLL);
  v6 = *v2 + a1;
  *(_BYTE *)(v5 + v6) = (HIBYTE(v1) ^ 0xE5) - ((2 * (HIBYTE(v1) ^ 0xE5)) & 0xCA) - 27;
  *(_BYTE *)(v5 + v6 + 1) = (BYTE2(v1) ^ 0xEF) - ((2 * (BYTE2(v1) ^ 0xEF)) & 0xCA) - 27;
  *(_BYTE *)(v5 + v6 + 2) = (BYTE1(v1) ^ 0x48) + (~(2 * (BYTE1(v1) ^ 0x48)) | 0x35) - 26;
  *(_BYTE *)(v5 + v6 + 3) = v1 ^ 0x4F;
  v7 = *(_QWORD *)(v3 - 0x4FF269813004C2EBLL);
  v8 = v4 - ((2 * v4 + 611495526) & 0x316E9FBE) - 1963940078;
  v9 = ((2 * (a1 + *v2 + 4)) & 0xCE5DDFF6) + ((a1 + *v2 + 4) ^ 0xE72EEFFB) + 416354309;
  *(_BYTE *)(v7 + v9) = (HIBYTE(v8) ^ 0x98) - ((v8 >> 23) & 0xCA) - 27;
  *(_BYTE *)(v7 + v9 + 1) = (BYTE2(v8) ^ 0xB7) - ((2 * (BYTE2(v8) ^ 0xB7)) & 0xCA) - 27;
  *(_BYTE *)(v7 + v9 + 2) = (BYTE1(v8) ^ 0x4F) + (~(2 * (BYTE1(v8) ^ 0x4F)) | 0x35) - 26;
  *(_BYTE *)(v7 + v9 + 3) = (v4 - ((2 * v4 + 102) & 0xBE) + 18) ^ 0x3A;
  *v2 = v10 - 231123141;
}

void sub_21B4F9508(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1224239923 * (a1 ^ 0xF2B3FDD7);
  __asm { BR              X15 }
}

uint64_t sub_21B4F95E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;

  v15 = v13 + a9;
  if (v15 >= 0)
    v16 = v15;
  else
    v16 = -v15;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * ((69 * (v16 > ((568 * ((((v12 - 1510319809) & 0x5A05A2FB) - 1105681582) & 0x41E75EB7 ^ 0x2B7)) ^ 0x4F2u))) ^ (v12 - 1510319809) & 0x5A05A2FBu)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12);
}

uint64_t sub_21B4F965C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_DWORD *a24)
{
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  _BOOL4 v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, _QWORD, BOOL, _BOOL8, unint64_t *, uint64_t, uint64_t, uint64_t);

  v27 = (v25 - 1409158342) & 0x53FE0EFE ^ 0xEEB72526;
  *a24 = -147249188;
  v28 = (int)v27 > 1857495497;
  if (v24 > 0x1148DE37 != v28)
    v29 = (int)v27 > 1857495497;
  else
    v29 = (int)(v24 + 1857495496) < 1857495497;
  v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, BOOL, _BOOL8, unint64_t *, uint64_t, uint64_t, uint64_t))(v26 + 8 * ((2709 * v29) ^ v25));
  HIDWORD(a10) = (v24 ^ 0x7D57EFED) - 1090781377 + ((2 * v24) & 0xFAAFDFDA);
  return v30(a1, v27, 2709, v30, (int)(v24 + 1857495496) < 1857495497, v28, &STACK[0x70F4C230EE5E645F], a8, a9, a10);
}

void sub_21B4F9740()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v2 + v1) = v0;
}

void sub_21B4FA420()
{
  uint64_t v0;
  int v1;

  v0 = MEMORY[0x24BDAC7A8]();
  v1 = *(_DWORD *)(v0 + 40) + 268847287 * ((v0 & 0x2D1C9480 | ~(v0 | 0x2D1C9480)) ^ 0x2D497A57);
  __asm { BR              X13 }
}

uint64_t sub_21B4FA5A0()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(v3 + v1) = v0;
  *(_QWORD *)(v6 - 136) = v4;
  *(_QWORD *)(v6 - 128) = v3;
  *(_DWORD *)(v6 - 144) = ((v2 - 22119145) & 0x15182EF)
                        + (((v6 - 144) & 0x9AC9BE2E | ~((v6 - 144) | 0x9AC9BE2E)) ^ 0x9785BC06) * v5
                        - 274;
  return sub_21B522F20(v6 - 144);
}

void sub_21B4FB8BC()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  int v3;

  v0 = MEMORY[0x24BDAC7A8]();
  if (*(_QWORD *)(v0 + 16))
    v2 = *(_QWORD *)(v0 + 24) == 0x236606C007542B2ALL;
  else
    v2 = 1;
  v3 = v2;
  v1 = *(_DWORD *)v0 - 831981571 * ((v0 - 2 * (v0 & 0xED19B5D8) - 317082152) ^ 0x74B865FC);
  __asm { BR              X8 }
}

void sub_21B4FB9D0()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = v0 | 4;
}

uint64_t sub_21B4FB9D8()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  int v7;
  _BOOL4 v8;

  LODWORD(STACK[0x3C4]) = v0;
  *(_BYTE *)(v4 - 192) = 54 - -85 * ((v4 + 56) ^ 0xF6);
  STACK[0x268] = (unint64_t)&STACK[0x3DB438D5FEF87591];
  *(_QWORD *)(v4 - 200) = &STACK[0x3DB438D5FEF87591];
  STACK[0x270] = (unint64_t)&STACK[0x6EDAADCA9171FCB1];
  *(_QWORD *)(v4 - 184) = &STACK[0x6EDAADCA9171FCB1];
  *(_DWORD *)(v4 - 176) = (v1 + 1088) ^ (3804331 * ((v4 - 200) ^ 0x7ED525F6));
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (v1 - 15)) - 8);
  STACK[0x260] = (unint64_t)v5;
  v6 = v5(v4 - 200);
  v7 = *(_DWORD *)(v4 - 172);
  LODWORD(STACK[0x4DC]) = v7;
  v8 = v7 == ((v1 + 1409338834) & 0xABFF3346 ^ 0xDB9152A4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * ((v8 | (2 * v8)) ^ v1)) - 12))(v6);
}

uint64_t sub_21B4FBAB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,int a36,unint64_t *a37,int a38,unsigned int a39,int a40,int a41,unint64_t a42,unsigned int a43,int a44,unint64_t a45,uint64_t *a46,unint64_t *a47,uint64_t a48,int a49,int a50,uint64_t a51,unint64_t *a52,uint64_t a53,int a54,int a55,int a56,int a57,int a58,int a59,unint64_t *a60,int a61,int a62,unint64_t *a63)
{
  int32x4_t a64;
  int32x4_t a65;
  unint64_t a67;
  int a69;
  uint64_t a70;
  char *a71;
  int a72;
  unint64_t *a73;
  unint64_t *a74;
  unint64_t *a75;
  unint64_t *a76;
  int v76;
  int v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  int v85;
  int v86;
  unint64_t v87;
  int v88;
  unsigned int v89;
  unint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t, uint64_t);

  STACK[0x248] = v80;
  a48 = v79;
  STACK[0x320] = 0;
  a37 = &STACK[0x42B926EACA76332D];
  STACK[0x360] = (unint64_t)&STACK[0x74D1826BB13E7D66];
  STACK[0x358] = (unint64_t)&STACK[0x49D4471502D2158];
  STACK[0x350] = (unint64_t)&STACK[0x494C66A0B3647396];
  STACK[0x348] = (unint64_t)&STACK[0x691BF935B213C5D0];
  a76 = &STACK[0x49EB7E5E2EA5CCFD];
  a75 = &STACK[0x371EF9AFBEAB29DB];
  a74 = &STACK[0x49EB7E5E2EA5CDF5];
  a73 = &STACK[0x371EF9AFBEAB297B];
  a52 = &STACK[0xC8F409392290DF3];
  a63 = &STACK[0x42B926EACA763375];
  STACK[0x280] = (unint64_t)&STACK[0x49EB7E5E2EA5CE6D];
  STACK[0x278] = (unint64_t)&STACK[0x371EF9AFBEAB28F3];
  a60 = &STACK[0x17742063B1AF4D85];
  STACK[0x228] = (unint64_t)&STACK[0x17742063B1AF4CCD];
  STACK[0x240] = (unint64_t)&STACK[0x72725D8527681E7C];
  STACK[0x238] = (unint64_t)&STACK[0x624568E6AE91F7CA];
  a47 = &STACK[0x509D13A7D8C2F970];
  v85 = *(_DWORD *)(v78 + 4) + v77;
  STACK[0x218] = v78;
  v86 = *(_DWORD *)(v78 + 12) + v77;
  a67 = ((unint64_t)&STACK[0x4F8] ^ 0x1DFAFFFC7EEDF7FBLL)
      - 0x520B0CC3600412BLL
      + ((2 * (_QWORD)&STACK[0x4F8]) & 0x3BF5FFF8FDDBEFF0);
  a45 = ((unint64_t)&STACK[0x530] ^ 0xABCEE9FDE7A6FCF1)
      + 0x7FFDBED61E5B6FEFLL
      + ((2 * (_QWORD)&STACK[0x530]) & 0x579DD3FBCF4DF9E0);
  a55 = 2 * v86;
  LODWORD(STACK[0x29C]) = (v86 ^ 0xA6D03FF4) + 2002449388 + ((2 * v86) & 0x155F7BB8 ^ 0x105F0010);
  v87 = ((unint64_t)&STACK[0x4E8] ^ 0xFBFFFFBE79D70AD9)
      + 0x4DCCCEF1BFBCF627
      + ((2 * (_QWORD)&STACK[0x4E8]) & 0xF7FFFF7CF3AE15B0);
  a42 = ((unint64_t)&STACK[0x418] ^ 0x6FEFFFF7EFECF77FLL)
      - 0x6024449481C424CBLL
      + ((2 * (_QWORD)&STACK[0x418]) & 0xDFDFFFEFDFD9EEF0);
  a64 = vdupq_n_s32(0xDB9153E2);
  a65 = vdupq_n_s32(0x5B9153E7u);
  v88 = STACK[0x3C4];
  LODWORD(a70) = (LODWORD(STACK[0x3C4]) - 1051421457) & 0x3EAB69FF;
  a70 = a70;
  STACK[0x2B8] = (unint64_t)&STACK[0x4F0] % 0x25 + ((v76 + 567) ^ 0x65Fu) - 1067;
  a41 = v85;
  LODWORD(STACK[0x234]) = v85 - 237267513;
  a56 = v86;
  LODWORD(STACK[0x230]) = v86 ^ 0x2C7F8228;
  a71 = (char *)&a9 - 0x6866AD2F319F0BAALL;
  STACK[0x208] = (unint64_t)&a9 - 0x6866AD2F319F0CB1;
  a46 = &a9 - 0xD0CD5A5E633E18BLL;
  a59 = 137 * (v88 ^ 0x12A);
  a72 = 522992408;
  a44 = v88 + 1494271649;
  v89 = (v88 + 1494271649) & 0xA6EF39B5;
  a39 = v89 + 884906921;
  a69 = v88 + 291381960;
  a58 = v88 + 75126481;
  LODWORD(STACK[0x31C]) = v88 ^ 0x205;
  a62 = v88 + 1974493377;
  a36 = v88 ^ 0x110;
  STACK[0x310] = v81 | 0x4174B56311E61AF7;
  STACK[0x3A8] = 1178560073
               * (((v81 | 0x772EA2C8FBC7D787) - v81 + (v81 & 0x88D15D3704382878)) ^ 0xE9C4388E48744946);
  LODWORD(STACK[0x394]) = v88 - 538335572;
  v90 = 1178560073 * (((v81 | 0x378F41ED5E027705) - v81 + (v81 & 0xC870BE12A1FD88F8)) ^ 0xA965DBABEDB1E9C4);
  v91 = (v76 + 567) ^ 0x65F;
  STACK[0x210] = v87;
  STACK[0x200] = v87 + 17;
  LODWORD(STACK[0x2C0]) = 85978858;
  a57 = -1605439321;
  a50 = 41179198;
  a43 = v89;
  a40 = (2 * v89) ^ 0x224;
  a51 = v88 ^ 0x746u;
  STACK[0x308] = v90;
  STACK[0x300] = 1326756716 - v90;
  LODWORD(STACK[0x2C4]) = 805678352;
  LODWORD(STACK[0x2FC]) = 1109465630;
  LODWORD(STACK[0x594]) = v84;
  STACK[0x528] = (unint64_t)&STACK[0x660];
  v92 = *(_QWORD *)(v82 + 8 * (v91 - 1017));
  v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83
                                                                      + 8
                                                                      * ((669 * (*(_DWORD *)(v92 - 8) == 0)) ^ v91))
                                                          - ((v91 + 98357625) & 0xFA232EFF)
                                                          + 1192);
  STACK[0x2D8] = *(_QWORD *)(v82 + 8 * ((v76 + 567) ^ 0x2DE));
  STACK[0x328] = *(_QWORD *)(v82 + 8 * ((v76 + 567) ^ 0x274)) - 12;
  STACK[0x2D0] = *(_QWORD *)(v82 + 8 * ((v76 + 567) ^ 0x2B8));
  STACK[0x2E0] = v92 - 8;
  return v93(a1, a2, 611190843);
}

uint64_t sub_21B4FC16C@<X0>(int a1@<W8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;

  STACK[0x2A0] = v1;
  v5 = a1 - 245;
  v6 = (a1 + 62);
  v7 = (a1 - 781);
  STACK[0x580] = 0;
  v8 = 1178560073 * ((((v4 - 200) | 0x7737EC56) - ((v4 - 200) & 0x7737EC56)) ^ 0xC4847297);
  *(_DWORD *)(v4 - 180) = (a1 - 219) ^ v8;
  *(_DWORD *)(v4 - 168) = v8 ^ 0x5348BA8E;
  *(_QWORD *)(v4 - 176) = STACK[0x278];
  *(_QWORD *)(v4 - 200) = 0x19187A5A45A2D5C0;
  *(_QWORD *)(v4 - 192) = STACK[0x280];
  v9 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((a1 - 245) ^ 0x365)) - 4);
  STACK[0x290] = (unint64_t)v9;
  v10 = v9(v4 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * ((185 * (*(_DWORD *)(v4 - 184) == -611232798)) ^ v5))
                                          - ((v7 + 847) ^ v6)))(v10);
}

uint64_t sub_21B4FC24C()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((LODWORD(STACK[0x40C]) - 1503182335) > 0xFFFFF7FE)
                                          * ((v0 - 1063775995) & 0x3F67EBAF ^ 0x1D3)) ^ v0))
                            - 4))();
}

uint64_t sub_21B4FC29C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v5 = v3 - ((2 * v3 + 1288606724) & 0xDDFF4890) - 1788416438;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4
                                                                       + 8
                                                                       * ((226
                                                                         * (((v2 + 50) ^ 0x5DE349F0 ^ (2 * v5) & 0x7FE3EFFE)
                                                                          + (v5 ^ 0xD10E53B7)
                                                                          - 33646448 != 1039175823)) ^ (v2 + 313))))(a1, a2, 611190843, 1039175823);
}

uint64_t sub_21B4FC400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 + 8 * ((210 * (v6 + v5 + 151 * (v4 ^ 0x162u) - 1072824269 + 1696 < 8)) ^ v4))
                                                                                       - 8))(a1, a2, a3, a4, 3255791472, 1112);
}

uint64_t sub_21B4FC45C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ 0x5AE ^ (19 * ((unint64_t)(v1 - a1) > 0x1F)))) - 12))();
}

uint64_t sub_21B4FC49C()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((11 * (v0 < (((v1 ^ 0x10F) - 1431) ^ 0x470 ^ (((v1 ^ 0x10F) - 1431) | 0x104) ^ 0x554u))) ^ v1 ^ 0x10F)))();
}

uint64_t sub_21B4FC4E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v7 = v5 - 1072824269 + v3 + ((v4 + 794) | 0x385u);
  v8 = *(_OWORD *)(v1 + v7 - 15);
  v9 = *(_OWORD *)(v1 + v7 - 31);
  v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6 + 8 * ((1894 * ((v2 & 0xFFFFFFE0) == 32)) ^ (v4 + 591))))();
}

void sub_21B4FC544()
{
  JUMPOUT(0x21B4FC504);
}

uint64_t sub_21B4FC550()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((v2 - 1953) | 0x102) - 258) * (v0 == v1)) ^ v2))
                            - (v2 - 515)
                            + 1478))();
}

uint64_t sub_21B4FC584()
{
  char v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((909 * ((v0 & 0x18) == v1 - 368 + v1 - 1180 - 1416)) ^ v1)))();
}

uint64_t sub_21B4FC5B8@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(a2 - 7 + (v3 + a1 - v5)) = *(_QWORD *)(v2 - 7 + (v3 + a1 - v5));
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((13 * (((2 * ((v6 - 72) | 0x45)) ^ 0x8A6) + v5 != ((((v6 - 72) | 0x45) - 1119) & v4))) ^ ((v6 - 72) | 0x45))))();
}

uint64_t sub_21B4FC618(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((a1 ^ 0x91C) - 132) ^ 0x638) * (v1 == v2)) ^ a1 ^ 0x91C))
                            - (((a1 ^ 0x91Cu) - 132) ^ 0x126)))();
}

uint64_t sub_21B4FC650@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W5>, uint64_t a4@<X8>)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(a4 + (v5 + a2)) = *(_BYTE *)(v4 + (v5 + a2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v5 - 1 == a1) * a3) ^ (v6 + 462))) - 8))();
}

uint64_t sub_21B4FC680()
{
  int v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v2 = *(uint64_t (**)(void))(v1 + 8 * ((93 * (STACK[0x580] != 0)) ^ (v0 + 1531)));
  STACK[0x2C8] = (unint64_t)*(&off_24DE82D70 + v0 - 276);
  return v2();
}

uint64_t sub_21B4FC6C8()
{
  uint64_t (*v0)(void);
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = v0();
  LODWORD(STACK[0x594]) = v2;
  return ((uint64_t (*)(uint64_t, __n128))(*(_QWORD *)(v4 + 8 * ((((v1 + 161) ^ 0x633) * v3) ^ (v1 + 136)))
                                                  - 12))(v5, (__n128)0);
}

uint64_t sub_21B4FC718()
{
  int v0;
  char v1;
  uint64_t v2;

  LODWORD(STACK[0x554]) = 2;
  STACK[0x5C0] = 0;
  LODWORD(STACK[0x400]) = 0;
  LODWORD(STACK[0x4A4]) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1067
                                          * ((((v0 + 85) ^ ((v1 & 2) == ((v0 + 1039538655) & 0xC209E57F) - 302)) & 1) == 0)) ^ v0))
                            - 8))();
}

uint64_t sub_21B4FC788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a68;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  int v79;
  int v80;
  char *v81;
  uint64_t (*v82)(__n128);
  int v84;
  int v85;
  int v86;

  *(_DWORD *)(STACK[0x2E0] + 360) = 1494468669;
  v76 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t *, unint64_t, _QWORD, uint64_t, unint64_t *, unint64_t *))(v73 + 8 * (v68 - 229)))(v71, 2, &STACK[0x554], STACK[0x528], (v70 - 1503180286), v69, &STACK[0x5C0], &STACK[0x400]);
  v78 = ((2 * v76) & 0x6F9FBC9A) + (v76 ^ 0x37CFDE4D);
  if (v78 == 1204805200)
  {
    LODWORD(STACK[0x594]) = 611191002;
    v84 = STACK[0x3C4];
  }
  else
  {
    v79 = STACK[0x3C4];
    if (v78 == 936369741)
    {
      STACK[0x338] = STACK[0x5C0];
      LODWORD(STACK[0x330]) = STACK[0x400];
      STACK[0x2B0] = STACK[0x2A0] + 2304;
      v80 = (a52 - 1054706277) & 0x3EDD8A5C;
      LODWORD(STACK[0x3EC]) = a68;
      v81 = (char *)&STACK[0x640] + v72 - 0x6866AD2F319F08AALL;
      STACK[0x288] = v72 + 4144;
      STACK[0x480] = v72 + 4144;
      *(_QWORD *)v81 = 0x6370646600;
      v81[8] = 1;
      STACK[0x220] = (unint64_t)v81;
      STACK[0x3B0] = STACK[0x548];
      STACK[0x340] = (unint64_t)&STACK[0x640]
                   + v72
                   + (((((_QWORD)&STACK[0x640] + v72 - 0x6866AD2F319F01FALL) << ((a52 - 101) & 0x5C ^ 0x18u))
                     + 16) & 0x20)
                   - 0x6866AD2F319F01EALL;
      STACK[0x370] = (unint64_t)&STACK[0x640] + v72 - 0x6866AD2F319F08A1;
      v82 = *(uint64_t (**)(__n128))(v74
                                             + 8
                                             * ((((((v80 - 530) ^ 1) & 1) == 0) * (((v80 - 508) | 0x204) - 497)) ^ v80));
      STACK[0x378] = *(_QWORD *)(v73 + 8 * (v80 - 314));
      STACK[0x398] = *(_QWORD *)(v73 + 8 * (v80 ^ 0x262));
      STACK[0x3A0] = *(_QWORD *)(v73 + 8 * (v80 ^ 0x26E));
      return v82((__n128)0);
    }
    v85 = 1543737703 * (((~(v75 - 200) & 0xA011BBA8) - (~(v75 - 200) | 0xA011BBA9)) ^ 0xDEE5EBD5);
    *(_DWORD *)(v75 - 192) = v85 + v78 - ((2 * v78 - 1872739482) & 0xB722A7C4) - 1547602539;
    *(_DWORD *)(v75 - 188) = v85 + v79 + 639;
    *(_QWORD *)(v75 - 200) = a53;
    v86 = v79;
    v76 = sub_21B523F98(v75 - 200);
    v84 = v86;
  }
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74
                                                                                          + 8
                                                                                          * (((((STACK[0x5C0] == 0) ^ (57 * (v84 ^ 0x3D))) & 1)
                                                                                            * ((v84 - 1943974195) & 0x73DEB266 ^ 0x338)) ^ (v84 + 308)))
                                                                              - 8))(v76, STACK[0x5C0], 611190843, v77);
}

uint64_t sub_21B4FC874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  LODWORD(STACK[0x594]) = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(_QWORD *)(v8 + 8 * ((((v5 + 161) ^ 0x633) * v7) ^ (v5 + 136))) - 12))(a1, a2, a3, a4, a5, 2915381170, 48, 46, (__n128)0);
}

void sub_21B4FC8C8()
{
  LODWORD(STACK[0x330]) = 0;
  STACK[0x338] = 0;
  JUMPOUT(0x21B4FC8E8);
}

uint64_t sub_21B4FCA28@<X0>(char a1@<W8>)
{
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  unint64_t v10;
  char v11;

  v8 = (_BYTE *)(v4 + (v5 - 632296290));
  v9 = ((*(_DWORD *)(*(_QWORD *)STACK[0x3A0] + (*(_DWORD *)STACK[0x398] & 0x5567ABC8)) ^ v8) & (v1 ^ 0x7FFFFDDB))
     * ((v1 + 1517720907) & 0xA58968D8 ^ 0xF956F08F);
  v10 = -111742777 * (v9 ^ HIWORD(v9));
  v11 = *(_BYTE *)(*(_QWORD *)(v6 + 8 * (v1 - 337)) + (v10 >> 24)) ^ ((v2 ^ v3) >> a1) ^ *(_BYTE *)(*(_QWORD *)(v6 + 8 * (v1 - 508)) + (v10 >> 24)) ^ *(_BYTE *)(*(_QWORD *)(v6 + 8 * (v1 - 316)) + (v10 >> 24) - 6) ^ v10 ^ (-93 * BYTE3(v10));
  *v8 = v11;
  return (*(uint64_t (**)(void))(v7 + 8 * ((263 * (v5 - (v11 != 0) == 632296289)) ^ v1)))();
}

void sub_21B4FD980()
{
  JUMPOUT(0x21B4FC9C4);
}

uint64_t sub_21B4FD988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  BOOL v67;
  int v68;

  STACK[0x498] = v63;
  STACK[0x548] = STACK[0x3B0];
  STACK[0x4B0] = *(_QWORD *)(v65 + 8 * v64);
  v66 = STACK[0x338];
  STACK[0x480] = STACK[0x288] + 112;
  STACK[0x3D8] = v66;
  if (v66)
    v67 = a63 == 0;
  else
    v67 = 1;
  v68 = !v67;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v65
                                                                                + 8
                                                                                * (int)((1436 * v68) ^ (v64 + 1142528951) & 0xBBE667AF)))(a1, 229, 611190843, a4, 1972);
}

uint64_t sub_21B4FDA64(__n128 a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v6 = (char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1358;
  *(_DWORD *)v6 = 331120864;
  *((_QWORD *)v6 + 1) = 0;
  *((_DWORD *)v6 + 4) = 1256415683;
  *((_DWORD *)v6 + 6) = 1503180286;
  *((_QWORD *)v6 + 4) = 0;
  *(_DWORD *)((char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1330) = 1503180286;
  STACK[0x4D0] = (unint64_t)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1330;
  *(unint64_t *)((char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1328) = 0;
  STACK[0x468] = (unint64_t)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1328;
  *(_DWORD *)((char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1320) = 1503180286;
  STACK[0x598] = (unint64_t)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1320;
  *(unint64_t *)((char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1318) = 0;
  STACK[0x438] = (unint64_t)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1318;
  *(_DWORD *)((char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1310) = 1503180286;
  STACK[0x518] = (unint64_t)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1310;
  *(unint64_t *)((char *)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1308) = 0;
  STACK[0x560] = (unint64_t)&STACK[0x640] + v4 + v2 - 0x6866AD2F319F1308;
  v6[88] = 119;
  *(_DWORD *)v3 = 331120864;
  *(__n128 *)(v3 + 4) = a1;
  *(_DWORD *)(v3 + 20) = 0;
  *(_DWORD *)(v3 + 24) = 1503180286;
  *(_DWORD *)(v3 + 28) = 1975980023;
  STACK[0x2F0] = v3 + 28;
  *(_DWORD *)(v3 + 232) = 1975980023;
  STACK[0x2E8] = v3 + 232;
  *(__n128 *)(v3 + 436) = a1;
  *(__n128 *)(v3 + 452) = a1;
  *(_QWORD *)(v3 + 468) = 0;
  *(_QWORD *)(v3 + 1128) = 0xE5E5E5E5E5E5E5E5;
  *(_QWORD *)(v3 + 1136) = 0xE5E5E5E5E5E5E5E5;
  *(_QWORD *)(v3 + 1144) = 3857049061;
  *(_QWORD *)(v3 + 1152) = 0;
  *(_QWORD *)(v3 + 1160) = 0;
  *(__n128 *)(v3 + 1168) = a1;
  *(__n128 *)(v3 + 1184) = a1;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5
                                                               + 8
                                                               * ((499
                                                                 * (((((v1 ^ 0x7E6) + 71) | 0x365u) ^ 0x7D5) == 256)) ^ v1 ^ 0x7E6))
                                                   - 12))(4065, 1379586125);
}

uint64_t sub_21B4FDBD0@<X0>(uint64_t (*a1)(void)@<X8>)
{
  unint64_t v1;
  int v2;
  uint64_t v3;

  STACK[0x338] = v1;
  STACK[0x480] = v1 - 112;
  STACK[0x3B8] = *(_QWORD *)(v3 + 8 * (v2 ^ 0x1AD)) - 8;
  return a1();
}

uint64_t sub_21B4FDBFC(int a1, __n128 a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  STACK[0x288] = v6;
  *(_DWORD *)(v5 + 1424) = 1158179193;
  *(_DWORD *)(v5 + 1428) = 1147367148;
  *(_QWORD *)(v5 + 1432) = v3;
  *(_QWORD *)(v5 + 1440) = v3;
  *(_DWORD *)(v5 + 1448) = v4;
  *(__n128 *)(v5 + 1452) = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((((v2 - 2005) ^ 0x30) == 64) * a1) ^ v2)) - 8))();
}

uint64_t sub_21B4FDC54@<X0>(int a1@<W0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(__n128 *)(v3 + v5) = a3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((a2 ^ 0x30) + v5 == 64) * a1) ^ v4)) - 8))();
}

uint64_t sub_21B4FDC7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  unint64_t a65;
  uint64_t v65;
  int v66;
  unint64_t v67;
  unint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t (*v74)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v71 = (a9 - 829865585) & 0x3176BFF3;
  *(_QWORD *)(v67 + 1516) = v65;
  *(_QWORD *)(v67 + 1524) = v65;
  *(_DWORD *)(v67 + 1532) = v66;
  *(_QWORD *)(v68 + 96) = v67;
  STACK[0x250] = v67;
  *(_DWORD *)(v67 + 476) = 1365500566;
  STACK[0x3A0] = STACK[0x3D8];
  STACK[0x388] = *(_QWORD *)(v70 + 8 * a9) + (v71 ^ 0xFFFFFFFFFFFFFE5BLL);
  v72 = STACK[0x480];
  v73 = (char *)&a10 + STACK[0x480] - 0x6866AD2F319F0BEALL;
  STACK[0x338] = STACK[0x480];
  STACK[0x330] = v72 + 432;
  STACK[0x3B0] = (unint64_t)v73;
  STACK[0x258] = (unint64_t)(v73 + 392);
  a65 = v68;
  STACK[0x340] = v68;
  LODWORD(v71) = (v71 + 733) | 0x21A;
  STACK[0x480] = STACK[0x330];
  LODWORD(STACK[0x504]) = 1116059964;
  LODWORD(STACK[0x3E8]) = 1503180286;
  STACK[0x448] = 0;
  LODWORD(STACK[0x4AC]) = 1658377546;
  *(_DWORD *)STACK[0x3B0] = 376241975;
  LODWORD(STACK[0x380]) = v71 + 2063160194;
  LODWORD(STACK[0x3B8]) = -115974253;
  LODWORD(STACK[0x368]) = -324253260;
  LODWORD(STACK[0x370]) = 119804226;
  v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 + 8 * (int)(v71 ^ 0x23)) - (((v71 ^ a5) + 1014) ^ 0x52CLL));
  LODWORD(STACK[0x398]) = v69;
  return v74(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64);
}

uint64_t sub_21B4FDE1C(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4 + 8 * ((25 * (v2 == a2 + ((v3 - 1030155619) & 0x3D66EDBF) - 1192 - 217)) ^ v3)))();
}

uint64_t sub_21B4FDE64()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((26
                                * (((((v0 - 895) | 0x119) - 799) & (v1 - 1503180283)) - LODWORD(STACK[0x398]) != -1503180286)) | v0)))();
}

uint64_t sub_21B4FDEAC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = v0 == 376241975 || LODWORD(STACK[0x4AC]) - v2 != 155197260;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((58 * ((((v1 + 229) ^ v5) & 1) == 0)) ^ v1)) - 12))();
}

uint64_t sub_21B4FDF04()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (58 * (v0 != 376241975)))) - (((v1 + 261) | 0x104u) ^ 0x528)))();
}

uint64_t sub_21B4FDF44(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  int v13;
  _DWORD *v14;
  int v15;

  v11 = 94 * (v8 ^ 0x315);
  v12 = (_DWORD *)STACK[0x3B0];
  *v12 = v7 - 1;
  v12 += 2;
  v13 = v7 - 376243292;
  v14 = &v12[6 * (v7 - 376241976)];
  v15 = *v14;
  STACK[0x3A0] = *((_QWORD *)v14 + 1);
  LODWORD(STACK[0x4AC]) = v12[6 * (v13 + v11) + 4];
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (((*(_DWORD *)(v9 + (v15 + a6) * (uint64_t)a7 + 36) == a2 + ((v11 - 1297) | 0xA4) - 183)
                                * (v11 - 717)) ^ v11)))();
}

uint64_t sub_21B4FE00C()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;

  v3 = ((v0 - 208) | 0x696) + LODWORD(STACK[0x4AC]) - 1481287324;
  v4 = v1 + (((v0 + 15) | 0x111) ^ 0xB0F57EB6);
  v5 = (v4 < 0xA8E354D) ^ (v3 < 0xA8E354D);
  v6 = v3 < v4;
  if (v5)
    v6 = v4 < 0xA8E354D;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((37 * !v6) ^ v0)) - 4))();
}

uint64_t sub_21B4FE090@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((3724
                                          * (*(_DWORD *)(v5 + (a1 + v3 + v4 - 578 - 1117) * (uint64_t)a2 + 36) != a3)) ^ v4))
                            - ((v4 - 1512) ^ 0xBFLL)))();
}

uint64_t sub_21B4FE0EC(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  _BOOL4 v8;

  v8 = v2 == v6 + 61 * (((v3 + 547) | 0x12) ^ 0x691) - 183 && v4 != a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((340 * v8) ^ v3)) - 4))();
}

uint64_t sub_21B4FE140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8
                                        * (v8 ^ (8
                                               * ((((v8 ^ 0x68E) * a8 - 1280) & *(_DWORD *)(v10
                                                                                          + (v9 + a6) * (uint64_t)a7
                                                                                          + 40)) == 0))))
                            - 8))();
}

uint64_t sub_21B4FE178@<X0>(int a1@<W1>, int a2@<W6>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BOOL4 v8;
  _BOOL4 v9;

  v6 = *(_DWORD *)(v4 + v3 * (uint64_t)a2 + 36);
  v8 = v6 - 1495560405 > 2031509368 || v6 - 1495560405 < SLODWORD(STACK[0x3B8]);
  v9 = v6 != ((a1 + ((a3 + 2025349583) & 0x87479FBA) - 719) ^ (a3 - 171)) && v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (v9 | a3)) - 4))();
}

uint64_t sub_21B4FE1E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;

  v9 = (v5 + 277383834) & 0xEF7771BF;
  if (v6)
    v10 = v8;
  else
    v10 = a3 + 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)((276 * (v10 == v8)) ^ v9)) - ((v9 + 119) ^ a5 ^ 0x696)))();
}

uint64_t sub_21B4FE9DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  int v5;
  int v6;
  uint64_t v7;
  _BOOL4 v9;

  v9 = *(_DWORD *)STACK[0x3B0] != 376241975 || v6 != a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((35 * v9) ^ v5)) - (((v5 ^ a5) + 1014) ^ 0x52CLL)))();
}

uint64_t sub_21B4FEA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v11 = (v7 - 1984968397) & 0x765033FB;
  v12 = *(unsigned __int8 *)(STACK[0x448] + (((v11 + 103) | 0x10u) ^ 0xC783A96327FF09B2) + 0x387C569CD800F43ELL)
      - (*(_BYTE *)(*(_QWORD *)(v9 + v8 * (uint64_t)a7 + 24)
                                   - 0x7879E49CB3AA5AD2
                                   + (((v11 + 103) | 0x10u) ^ 0xC783A96327FF09B2)
                                   + 0x387C569CD800F43ELL)
                        - 21);
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * ((736
                                * (((v12 << ((((v7 + 51) & 0xFB) + 53) ^ 0x2F)) & 0xF3BF7EFA) + (v12 ^ 0x79DFBF7D) == 2044706685)) ^ v11)))();
}

uint64_t sub_21B4FEB00()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = v0 < 0x3948959E;
  if (v4 == v1 - 0x387C569C9EB85E9FLL < (unint64_t)((v2 - 441) ^ 0x14Eu) + 961057701)
    v4 = v1 - 0x387C569C9EB85E9FLL < v0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1722 * v4) ^ v2)) - 8))();
}

void sub_21B4FEB6C()
{
  JUMPOUT(0x21B4FEA78);
}

uint64_t sub_21B4FEB78()
{
  STACK[0x480] = STACK[0x338];
  return ((uint64_t (*)(void))STACK[0x388])();
}

uint64_t sub_21B4FEB88(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((a4 - 290) ^ (1676 * (v4 == v6)))) - (a4 ^ 0x136u) + 20))();
}

void sub_21B4FEBB8(int a1@<W8>)
{
  uint64_t v1;
  unint64_t *v2;

  v2 = (unint64_t *)STACK[0x468];
  STACK[0x340] = STACK[0x2F0];
  STACK[0x3A0] = *v2;
  STACK[0x388] = *(_QWORD *)(v1 + 8 * a1) + ((9 * (a1 ^ 0x3D) - 759285150) & 0x2D41C5F3 ^ 0xFFFFFFFFFFFFFE5FLL);
  JUMPOUT(0x21B4FDD24);
}

uint64_t sub_21B4FEC7C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a71;
  uint64_t a72;
  uint64_t v72;
  unint64_t v73;

  v73 = STACK[0x250];
  *(_QWORD *)(v73 + 1560) = *(_QWORD *)STACK[0x560];
  *(_DWORD *)(v73 + 1552) = *(_DWORD *)STACK[0x518];
  *(_QWORD *)(*(_QWORD *)(a71 + 96) + 488) = *(_QWORD *)(a71 + 8);
  *(_DWORD *)(*(_QWORD *)(a71 + 96) + 480) = *(_DWORD *)a71;
  *(_BYTE *)(STACK[0x208] + STACK[0x288] + a72) = (STACK[0x210] ^ 0xBA) * STACK[0x200];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 8 * (a4 + 868)))(186, 229);
}

uint64_t sub_21B4FED38@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  STACK[0x4E8] = 104 - a1;
  v4 = (uint64_t (*)(void))STACK[0x4B0];
  STACK[0x480] = v2 - 112;
  STACK[0x3B8] = *(_QWORD *)(v3 + 8 * (int)((v1 + 1943501823) & 0x8C28817F ^ 0x1AD)) - 8;
  return v4();
}

uint64_t sub_21B4FED80(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v4;
  int v5;
  uint64_t v6;
  int v7;

  STACK[0x288] = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((((a4 + 1298) | 6) ^ 0x482) * (v5 == v7)) ^ (a4 + 796))) - 12))();
}

uint64_t sub_21B4FEDB8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  uint64_t v57;
  uint64_t v58;

  STACK[0x410] = 0;
  LODWORD(STACK[0x4F4]) = 1503180286;
  STACK[0x508] = 0;
  LODWORD(STACK[0x494]) = 1503180286;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v58
                                                                                         + 8
                                                                                         * (int)((((((((a1 - 74) & 0xF7) - 29) & 0xFE) + *(_BYTE *)(a57 - 0x27D79D353BB31545) - *(_BYTE *)(*(_QWORD *)(v57 + 8 * (a1 ^ 0x6CC)) - 12)) == 216)
                                                                                                * ((((a1 - 455675466) & 0x1B290FF7)
                                                                                                  + 1760867851) & 0x970B47D6 ^ 0xA2B)) ^ (a1 - 455675466) & 0x1B290FF7)))(654, 1103, 3640129578, 654837719, 0xD82862CAC44CEABBLL);
}

uint64_t sub_21B4FEEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((((v9 == 11) ^ (v8 + 1)) & 1) * a8) ^ v8))
                            - (v8 - 1192)
                            + 298))();
}

void sub_21B4FEED0()
{
  JUMPOUT(0x21B4FEE60);
}

uint64_t sub_21B4FEEE0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1642 * (v4 == (((a4 - 292) | 0x145) ^ (v6 - 309)))) ^ (a4 + 488)))
                            - 8))();
}

uint64_t sub_21B4FEF1C()
{
  int v0;
  int v1;
  char v2;
  uint64_t v3;
  int v4;

  v4 = ((*(_BYTE *)(STACK[0x4C8] + 1516) ^ (((v0 + 39) & 0x9F ^ v2) + 33)) ^ 0xAA)
     - (*(_BYTE *)STACK[0x538] - 10);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1171 * (((2 * v4) & 0x9CE93FEA) + (v4 ^ v1) == v1)) ^ (v0 - 1993520601) & 0x76D2B79F))
                            - 8))();
}

uint64_t sub_21B4FEFA0@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)((63 * ((v1 ^ 0xFFFFFFFFFFFFFDA4) + a1 + ((v1 + 179) | 0x114) == 20)) ^ v1))
                            - 8))();
}

uint64_t sub_21B4FEFF0(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  int v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  return (*(uint64_t (**)(void))(v10
                              + 8
                              * ((14
                                * ((*(_BYTE *)(v8 + a5)
                                                   - *(_BYTE *)(*(_QWORD *)(v9 + 8 * (2 * (v5 ^ 0x541) - 285)) - 8)
                                                   + ((((2 * (v5 ^ 0x41)) ^ v6) * v7 + a3) & a4)) != 69)) ^ (2 * (v5 ^ 0x541) + 1542))))();
}

uint64_t sub_21B4FF09C()
{
  int v0;
  int v1;
  unsigned int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v0 ^ (2 * (v1 == 11))))
                            - ((((v0 - 829) | v2) - 12) ^ (v0 - 531))))();
}

void sub_21B4FF0C8()
{
  JUMPOUT(0x21B4FF058);
}

uint64_t sub_21B4FF0D4@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((7
                                          * ((*(_BYTE *)(v2 + a1)
                                                             - *(_BYTE *)(*(_QWORD *)(v3 + 8 * (a2 ^ 0x326)) - 4)) == 2)) ^ ((a2 ^ 0x26D) + 1114)))
                            - ((a2 ^ 0x296u)
                             - 5)
                            + 452))();
}

uint64_t sub_21B4FF19C(char a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((v3 == ((a1 ^ (2 * v2)) - 35)) * ((v2 + 634) ^ a2)) | v2))
                            - 4))();
}

void sub_21B4FF1C8()
{
  JUMPOUT(0x21B4FF15CLL);
}

uint64_t sub_21B4FF1D4()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v2 = (v0 - 397) | 0x402;
  v3 = ((uint64_t (*)(uint64_t, uint64_t))STACK[0x378])(1576, 2940923044);
  STACK[0x4C8] = v3;
  STACK[0x250] = v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((35 * (v3 != 0)) ^ v2)) - ((v2 - 83745907) & 0x4FDDE3B) + 1543))();
}

uint64_t sub_21B4FF294()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = ((uint64_t (*)(uint64_t, uint64_t))STACK[0x378])(1576, 3012117910);
  STACK[0x488] = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((((v0 - 288812057) & 0x1136E675 ^ 0xFFFFFE83) + (v0 ^ 0x73D))
                                               * (v2 == 0)) ^ v0))
                            - 8))();
}

uint64_t sub_21B4FF2FC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((v1 ^ 0xCB) - 174) * (v0 != 232520198)) ^ v1))
                            - ((v1 + 817) ^ 0x3A5)))();
}

uint64_t sub_21B4FF34C@<X0>(unsigned int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((2 * (((v2 == v1) ^ a1) & 1)) & 0xF7 | (8 * (((v2 == v1) ^ a1) & 1))) ^ a1))
                            - 12))();
}

uint64_t sub_21B4FF38C()
{
  int v0;
  unsigned int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((126 * (v2 == ((v1 + 610003579) & 0x5BA417DF ^ (v0 - 246)))) ^ v1)))();
}

uint64_t sub_21B4FF3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a69;
  uint64_t a70;
  uint64_t v70;
  unsigned int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;

  v77 = (v74 ^ 0xB3B39EC1) * v73;
  *(_DWORD *)(v76 - 180) = (v71 + 677) ^ v77;
  *(_DWORD *)(v76 - 168) = v77 ^ 0x5348BA8B;
  *(_QWORD *)(v76 - 200) = v70;
  *(_QWORD *)(v76 - 192) = a70;
  *(_QWORD *)(v76 - 176) = a69;
  v78 = ((uint64_t (*)(uint64_t))STACK[0x290])(v76 - 200);
  return (*(uint64_t (**)(uint64_t))(v75
                                            + 8
                                            * ((850
                                              * (*(_DWORD *)(v76 - 184) == v72
                                                                         + ((v71 - 185) | 0x314)
                                                                         + ((v71 + 587) | 0x10)
                                                                         - 1580)) ^ v71)))(v78);
}

uint64_t sub_21B4FF480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a69;
  uint64_t a70;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;

  v73 = 1178560073 * ((((v72 - 200) ^ 0x2757485) & 0xF7DF73A9 | ~((v72 - 200) ^ 0x2757485 | 0xF7DF73A9)) ^ 0xB9E66612);
  *(_DWORD *)(v72 - 168) = v73 ^ 0x5348BA8B;
  *(_QWORD *)(v72 - 176) = a69;
  *(_DWORD *)(v72 - 180) = (v70 + 677) ^ v73;
  *(_QWORD *)(v72 - 200) = 0x19187A5A45A2D5C0;
  *(_QWORD *)(v72 - 192) = a70;
  v74 = ((uint64_t (*)(uint64_t))STACK[0x290])(v72 - 200);
  return (*(uint64_t (**)(uint64_t))(v71
                                            + 8
                                            * ((850
                                              * (*(_DWORD *)(v72 - 184) == ((v70 + 603) ^ 0xDB9153E2 ^ v70 ^ 0x3AD))) ^ v70)))(v74);
}

uint64_t sub_21B4FF560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a69;
  uint64_t a70;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;

  v74 = 1178560073 * ((v73 + 1562745279 - 2 * ((v73 - 200) & 0x5D259A87)) ^ 0xEE960446);
  *(_DWORD *)(v73 - 168) = v74 ^ 0x5348BA89;
  *(_QWORD *)(v73 - 176) = a69;
  *(_QWORD *)(v73 - 200) = v70;
  *(_QWORD *)(v73 - 192) = a70;
  *(_DWORD *)(v73 - 180) = (v71 + 677) ^ v74;
  v75 = ((uint64_t (*)(uint64_t))STACK[0x290])(v73 - 200);
  return (*(uint64_t (**)(uint64_t))(v72
                                            + 8
                                            * ((850
                                              * (*(_DWORD *)(v73 - 184) == ((v71 - 2125950173) & 0x7EB76F37) - 611233588)) ^ v71)))(v75);
}

uint64_t sub_21B4FF64C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  unint64_t v63;
  int v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  int v72;

  v70 = ((((2 * v67) | 0x4BACB1E2) - v67 - 634804465) ^ 0x9665C630) * v66;
  *(_DWORD *)(v69 - 180) = (v64 + 74) ^ v70;
  *(_QWORD *)(v69 - 200) = v61;
  *(_QWORD *)(v69 - 192) = a61;
  *(_DWORD *)(v69 - 168) = a1 ^ v70;
  *(_QWORD *)(v69 - 176) = a60;
  v71 = v62(v69 - 200);
  v72 = *(_DWORD *)(v69 - 184);
  STACK[0x538] = v63;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(_QWORD *)(v68 + 8 * ((1541 * (v72 == v65)) ^ v64)) - ((v64 - 721) ^ (v64 - 488) ^ 0x163)))(v71, 229, 611190843, LODWORD(STACK[0x3C4]), 1972, 2915381170, 48, 46, (__n128)0);
}

void sub_21B4FF720()
{
  JUMPOUT(0x21B4FF740);
}

uint64_t sub_21B4FF824()
{
  unint64_t v0;
  int v1;
  uint64_t v2;

  STACK[0x538] = v0;
  return (*(uint64_t (**)(void))(v2 + 8 * (((8 * (STACK[0x508] == 0)) | (32 * (STACK[0x508] == 0))) ^ (v1 + 839))))();
}

uint64_t sub_21B500218()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v1 + 8 * ((2817 * (STACK[0x410] != 0)) ^ (v0 + 471))))();
}

uint64_t sub_21B50023C()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((49 * (STACK[0x4C8] == 0)) ^ (v0 + 1199))) - 8))();
}

uint64_t sub_21B50026C()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x2C8])();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((626 * (STACK[0x488] != 0)) ^ (v0 + 12))) - 4))();
}

uint64_t sub_21B50029C()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = ((uint64_t (*)(void))STACK[0x2C8])();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * ((992 * (v1 == ((6 * (v0 ^ 0x199)) ^ 0xDB9157A8))) ^ (v0 + 796)))
                                          - 12))(v3);
}

uint64_t sub_21B5002F4()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x2C8])();
  return (*(uint64_t (**)(void))(v1 + 8 * ((2817 * (STACK[0x410] != 0)) ^ (v0 + 471))))();
}

uint64_t sub_21B500320()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x2C8])();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((49 * (STACK[0x4C8] == 0)) ^ (v0 + 1199))) - 8))();
}

uint64_t sub_21B500358()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((626 * (STACK[0x488] != 0)) ^ (v0 + 12))) - 4))();
}

uint64_t sub_21B500380(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                        + 8
                                                                        * ((992
                                                                          * (v3 == ((6 * (v2 ^ 0x199)) ^ 0xDB9157A8))) ^ (v2 + 796)))
                                                            - 12))(a1, a2, 611190843);
}

uint64_t sub_21B5003D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;

  LODWORD(STACK[0x3EC]) = 522992128;
  LODWORD(STACK[0x4BC]) = 128;
  v58 = 1178560073
      * ((((v57 - 200) ^ 0xFDF2FE7F | 0xA372392C)
        - ((v57 - 200) ^ 0xFDF2FE7F)
        + (((v57 - 200) ^ 0xFDF2FE7F) & 0x5C8DC6D3)) ^ 0xED335992);
  *(_DWORD *)(v57 - 200) = 1453052944 - v58;
  *(_QWORD *)(v57 - 128) = a48;
  *(_QWORD *)(v57 - 160) = a54;
  *(_QWORD *)(v57 - 152) = 0;
  *(_QWORD *)(v57 - 144) = v54 + 0x70F4C230EE5E678FLL;
  *(_QWORD *)(v57 - 136) = 0;
  *(_QWORD *)(v57 - 176) = v54;
  *(_QWORD *)(v57 - 192) = v54 + 0x70F4C230EE5E667FLL;
  *(_DWORD *)(v57 - 168) = (v55 - 600) ^ v58;
  v59 = ((uint64_t (*)(uint64_t))STACK[0x3B8])(v57 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v56
                                                      + 8
                                                      * ((585
                                                        * (*(_DWORD *)(v57 - 184) == ((v55 + 846654820) & 0xCD890F7F ^ 0xDB9152CC))) ^ v55))
                                          - 12))(v59);
}

uint64_t sub_21B5004F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  unint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;

  v4 = v1 + 127 - a1;
  v5 = vrev64q_s8(*(int8x16_t *)(v4 - 15));
  v6 = vextq_s8(v5, v5, 8uLL);
  v7 = vrev64q_s8(*(int8x16_t *)(v4 - 31));
  v8 = vextq_s8(v7, v7, 8uLL);
  v9 = STACK[0x2B0] + 127 - a1;
  v10.i64[0] = 0xCACACACACACACACALL;
  v10.i64[1] = 0xCACACACACACACACALL;
  v11.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v11.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v12 = vrev64q_s8(vaddq_s8(vsubq_s8(v6, vandq_s8(vaddq_s8(v6, v6), v10)), v11));
  *(int8x16_t *)(v9 - 15) = vextq_s8(v12, v12, 8uLL);
  v13 = vrev64q_s8(vaddq_s8(vsubq_s8(v8, vandq_s8(vaddq_s8(v8, v8), v10)), v11));
  *(int8x16_t *)(v9 - 31) = vextq_s8(v13, v13, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a1 == 96) * (((v2 - 769) | 4) - 358)) ^ v2)) - 12))();
}

uint64_t sub_21B500590()
{
  int v0;
  uint64_t v1;
  int v2;

  LODWORD(STACK[0x594]) = v2;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((49
                                * (((v0 - 1) ^ (*(_DWORD *)(STACK[0x2E0] + 360) - 1494468669 < ((v0 - 740) | 0x10Cu) - 304)) & 1)) | v0)))();
}

uint64_t sub_21B5005E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v10 = STACK[0x338];
  v11 = (v8 - 1269049311) & 0x4BA427F7;
  v12 = (char *)&STACK[0x640] + STACK[0x338] - 0x6866AD2F319F122ALL;
  v13 = (uint64_t)&v12[v11 - 2151];
  STACK[0x458] = v13;
  STACK[0x398] = (unint64_t)&v12[v11 - 1923];
  LODWORD(STACK[0x58C]) = 1556690788;
  STACK[0x480] = v10 + ((2 * v8) ^ 0x64Au) - 1238;
  STACK[0x3C8] = 0;
  LODWORD(STACK[0x5B4]) = 1503180286;
  STACK[0x3A0] = v13;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8 * ((126 * (&v12[v11] == (char *)1903)) ^ (v8 - 7))) - 12))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_21B500730@<X0>(int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t v11;
  uint64_t v12;

  STACK[0x480] = v11 - 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (((a1 == (a2 ^ 0x69 ^ a11)) * (((a2 - 246) | 0x8E) + 1498)) ^ a2))
                            - 4))();
}

uint64_t sub_21B50078C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  *(_DWORD *)(v2 - 196) = v0
                        - 460628867 * ((((v2 - 200) | 0xB4AEA3D1) + (~(v2 - 200) | 0x4B515C2E)) ^ 0xF83821AD)
                        - 231789836;
  nullsub_1(v2 - 200);
  v3 = (uint64_t (*)(void))(*(_QWORD *)(v1
                                     + 8
                                     * (((((uint64_t (*)(uint64_t, uint64_t))STACK[0x378])(336, 318119320) == 0)
                                       * (17 * (v0 ^ 0x453) - 1114)) ^ v0))
                         - 12);
  return v3();
}

uint64_t sub_21B500840(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3
                                                                       + 8
                                                                       * (int)((((unint64_t)(*(_QWORD *)(v2 + 8 * (v1 - 1067))
                                                                                                  - 12
                                                                                                  - a1) < 0x20)
                                                                              * (((v1 + 1635666794) & 0x9E81B47F) - 642)) ^ v1)))(4255746495, 335, 734, 1683);
}

uint64_t sub_21B5008C8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + (v2 + v3)) = *(_BYTE *)(a1 + (v2 + v3))
                                           - (((v1 + 18) ^ 0x5B) & (2 * *(_BYTE *)(a1 + (v2 + v3))))
                                           - 27;
  return (*(uint64_t (**)(void))(v7 + 8 * (((v2 - 1 != v5) * v4) ^ v1)))();
}

uint64_t sub_21B500908()
{
  int v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v16;

  v6 = (v2 ^ 0x393) * v0;
  STACK[0x4E0] = v3;
  v16 = (_QWORD *)(v1 - 208);
  *v16 = 0x1A1A1A1A1A1A1A1ALL;
  v16[1] = 0xE5E5E5E5E3E5E5F7;
  v7 = 241568881 * ((-1709639019 - ((v5 - 200) | 0x9A18FA95) + ((v5 - 200) | 0x65E7056A)) ^ 0xB3F60128);
  *(_DWORD *)(v5 - 196) = -12521833 - v7;
  *(_DWORD *)(v5 - 192) = v2 - v7 + 1064655778;
  nullsub_1(v5 - 200);
  LODWORD(STACK[0x524]) = 1503180622;
  v8 = ((uint64_t (*)(uint64_t, uint64_t))STACK[0x378])(336, 1690680581);
  STACK[0x5B8] = v8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 + 8 * (((v8 == 0) * (v6 ^ 0x15D)) ^ v2))
                                                                                                - 159 * (v2 ^ 0x392u)
                                                                                                + 465))(v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_21B500A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15)
{
  int v15;
  uint64_t v16;

  LODWORD(STACK[0x5F0]) = a15;
  return (*(uint64_t (**)(void))(v16 + 8 * ((986 * (STACK[0x4E0] != 0)) ^ (v15 - 158))))();
}

uint64_t sub_21B500A4C@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;

  v8 = (a2 - v3);
  v9 = vrev64q_s8(*(int8x16_t *)(a3 + v8 - 15));
  v10 = vextq_s8(v9, v9, 8uLL);
  v11 = vrev64q_s8(*(int8x16_t *)(a3 + v8 - 31));
  v12 = vextq_s8(v11, v11, 8uLL);
  v13 = v6 + v8;
  v14.i64[0] = 0xCACACACACACACACALL;
  v14.i64[1] = 0xCACACACACACACACALL;
  v15.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v15.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v16 = vrev64q_s8(vaddq_s8(vsubq_s8(v10, vandq_s8(vaddq_s8(v10, v10), v14)), v15));
  *(int8x16_t *)(v13 - 15) = vextq_s8(v16, v16, 8uLL);
  v17 = vrev64q_s8(vaddq_s8(vsubq_s8(v12, vandq_s8(vaddq_s8(v12, v12), v14)), v15));
  *(int8x16_t *)(v13 - 31) = vextq_s8(v17, v17, 8uLL);
  LODWORD(v13) = v3 + 32 == ((v5 + v4) & a1) + 18;
  return (*(uint64_t (**)(void))(v7 + 8 * (int)(((4 * v13) | (8 * v13)) ^ v5)))();
}

uint64_t sub_21B500ADC@<X0>(unsigned int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int8x8_t v5;
  int8x8_t v6;
  uint64_t v7;
  int8x8_t v8;

  v7 = ((11 * (v2 ^ 0x17D)) ^ a1) - 320;
  v8 = vrev64_s8(*(int8x8_t *)(a2 + v7 - 7));
  *(int8x8_t *)(v3 - 7 + v7) = vrev64_s8(vadd_s8(vsub_s8(v8, vand_s8(vadd_s8(v8, v8), v6)), v5));
  return (*(uint64_t (**)(void))(v4 + 8 * (v2 + 446)))();
}

void sub_21B500B44()
{
  int v0;

  ((void (*)(unint64_t))STACK[0x2C8])(STACK[0x250]);
  LODWORD(STACK[0x594]) = v0;
  JUMPOUT(0x21B500B78);
}

uint64_t sub_21B500BD4@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v3 = a2 + 473;
  v4 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD))STACK[0x2D8])(*(unsigned int *)STACK[0x2D0], a1, LODWORD(STACK[0x400]));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * ((((301 * ((v3 - 2021359805) & 0x787B7DAF ^ 0x12A)) ^ 0x4CB)
                                                        * (LODWORD(STACK[0x594]) != -611232798)) ^ v3))
                                          - 12))(v4);
}

uint64_t sub_21B500C4C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  ++*(_DWORD *)(v2 + 52);
  STACK[0x480] = v1 - 2432;
  LODWORD(STACK[0x4DC]) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((STACK[0x3F8] == 0) * ((v0 + 66) ^ 0x486)) ^ v0)) - 12))();
}

uint64_t sub_21B500C94@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a1 ^ 0x4A2;
  v6 = 1178560073 * ((((v4 - 200) | 0xEE0EB7E2) - (v4 - 200) + ((v4 - 200) & 0x11F14818)) ^ 0x5DBD2923);
  *(_QWORD *)(v4 - 160) = STACK[0x238];
  *(_QWORD *)(v4 - 176) = STACK[0x248];
  *(_DWORD *)(v4 - 184) = v6 + v5 + 819;
  v7 = LODWORD(STACK[0x234]) ^ v6;
  *(_QWORD *)(v4 - 192) = STACK[0x240];
  *(_DWORD *)(v4 - 168) = v7;
  *(_DWORD *)(v4 - 164) = v6 + 244812180 + v1;
  v8 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (v5 ^ 0x79)) - 12))(v4 - 200);
  v9 = *(_DWORD *)(v4 - 200);
  LODWORD(STACK[0x4DC]) = v9;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8 * ((1946 * (v9 == ((v5 - 36) | 0x484) - 611234002)) ^ v5))
                                          - 8))(v8);
}

uint64_t sub_21B500D80()
{
  int v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t (*v4)(void);

  v3 = STACK[0x3F8];
  LODWORD(STACK[0x2FC]) = STACK[0x5CC];
  v4 = (uint64_t (*)(void))(*(_QWORD *)(v2
                                     + 8
                                     * ((494 * (((((v1 ^ 0x42) - 1186) ^ ((v0 & 0xFFFFFFFE) == 1494468668)) & 1) == 0)) ^ v1 ^ 0x42))
                         - ((151 * (v1 ^ 0x4B6u)) ^ 0x126));
  STACK[0x320] = v3;
  return v4();
}

uint64_t sub_21B500DF8()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = STACK[0x3F8];
  v7 = STACK[0x5CC];
  v8 = 235795823 * ((-1367672089 - ((v5 - 200) | 0xAE7AFAE7) + ((v5 - 200) | 0x51850518)) ^ 0xC5284C41);
  *(_DWORD *)(v5 - 184) = v8 - 1061646906 + v1;
  *(_DWORD *)(v5 - 200) = (1531616453 * v7 - 977836520) ^ v8;
  *(_DWORD *)(v5 - 164) = (v2 + 368400093) ^ v8;
  *(_QWORD *)(v5 - 176) = v3 + 0x38046E592152BE6ELL;
  *(_QWORD *)(v5 - 160) = v0;
  *(_QWORD *)(v5 - 152) = v3 + 0x19A1466F6B33280;
  *(_QWORD *)(v5 - 192) = v6;
  v9 = sub_21B532F54(v5 - 200);
  v10 = *(_DWORD *)(v5 - 168);
  LODWORD(STACK[0x4DC]) = v10;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4 + 8 * (((v10 == -611232798) * (v2 + 538)) ^ v2)) - 8))(v9);
}

uint64_t sub_21B500EF8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;

  v5 = 831981571 * ((~((v4 - 200) | 0xF6B32518) + ((v4 - 200) & 0xF6B32518)) ^ 0x90ED0AC3);
  v6 = *(_DWORD *)(v1 + 52) - v5 + (v0 ^ 0xD7A666F7);
  *(_DWORD *)(v4 - 192) = (LODWORD(STACK[0x2FC]) + 598709606) ^ v5;
  *(_DWORD *)(v4 - 188) = v6;
  *(_DWORD *)(v4 - 168) = LODWORD(STACK[0x29C]) ^ v5;
  *(_DWORD *)(v4 - 200) = v0 - v5 - 32;
  *(_QWORD *)(v4 - 184) = STACK[0x320];
  *(_QWORD *)(v4 - 176) = v1 + 0x38046E592152BE8ELL;
  *(_QWORD *)(v4 - 160) = &STACK[0x620];
  v7 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (v0 ^ 0x91)) - 8))(v4 - 200);
  v8 = *(_DWORD *)(v4 - 196);
  LODWORD(STACK[0x4DC]) = v8;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * ((326 * (v8 == (v0 ^ 0x2F8) - 611233482)) ^ v0)) - 8))(v7);
}

uint64_t sub_21B501008()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1631 * ((v0 - 1494468667 + v1 - 686) < 0xFFFFFFFE)) ^ v1))
                            - 8))();
}

uint64_t sub_21B50103C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49,int a50,int a51)
{
  int v51;
  int v52;
  uint64_t v53;
  int v54;
  unsigned int *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  int v66;
  unint64_t v67;
  int v68;
  unsigned int v69;
  uint64_t v70;
  int v71;

  v59 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, unint64_t *, unint64_t, _QWORD, unint64_t *))(v56 + 8 * (v54 ^ 0x2AC)))(*v55, (v52 + v51), LODWORD(STACK[0x230]), v55[13] - 711215909, &STACK[0x620], STACK[0x320], ((v54 - 382) ^ 0xBDDEE4CC) + LODWORD(STACK[0x2FC]), &STACK[0x630]);
  v61 = (v59 ^ 0xBC45BDF4) + 1941958428 + ((2 * v59) & 0x788B7BE8);
  v62 = STACK[0x3C4];
  if (v61 == 1074113811)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v57
                                                       + 8
                                                       * (((LODWORD(STACK[0x2C0]) - 85980591 + ((v62 + 1299) | 0x84u) < 3)
                                                         * (((v62 - 222) | 4) - 25)) ^ (v62 + 851))))(v59, v60);
  if (v61 == 805678352)
  {
    ((void (*)(_QWORD, unint64_t, _QWORD))STACK[0x2D8])(*(unsigned int *)STACK[0x2D0], STACK[0x320], LODWORD(STACK[0x2FC]) - 1109467130 + ((v62 + 922) | 0x114u));
    v66 = *(_DWORD *)(STACK[0x2E0] + 52);
    v67 = STACK[0x510];
    v68 = 2078219279 * (((v58 - 200) & 0x17875EBA | ~((v58 - 200) | 0x17875EBA)) ^ 0x32823731);
    v69 = ((LODWORD(STACK[0x4A8]) ^ 0x5DEFFFFF) - 1149857396 + ((2 * LODWORD(STACK[0x4A8])) & 0xBBDFFFFE)) ^ v68;
    *(_DWORD *)(v58 - 188) = v68 + v62 - 223;
    *(_DWORD *)(v58 - 184) = v69;
    *(_QWORD *)(v58 - 176) = v67;
    *(_QWORD *)(v58 - 168) = &STACK[0x630];
    *(_QWORD *)(v58 - 200) = v53;
    *(_DWORD *)(v58 - 160) = v66 - v68 - 618962231;
    *(_DWORD *)(v58 - 156) = ((a51 & 0x7FFFFFFF ^ 0x39003FD7) + 1879046663 + (a50 & 0x2AFF7BFE ^ 0x8FF0050) - 2584) ^ v68;
    v70 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v56 + 8 * (v62 - 198)) - 8))(v58 - 200);
    v71 = *(_DWORD *)(v58 - 192);
    LODWORD(STACK[0x4DC]) = v71;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v57
                                                        + 8
                                                        * (((4 * (v71 == -611232798)) | (8 * (v71 == -611232798))) ^ (v62 - 77)))
                                            - 4))(v70);
  }
  else
  {
    v63 = 1543737703 * ((v58 + 1651053860 - 2 * ((v58 - 200) & 0x626915EC)) ^ 0x1C9D4590);
    LODWORD(STACK[0x2C4]) = v61;
    *(_DWORD *)(v58 - 192) = v63 + v61 - ((((v62 - 218) ^ 0x9FF4A5B4) + 2 * v61) & 0xB722A7C4) - 1416911150;
    *(_DWORD *)(v58 - 188) = v63 + v62 + 639;
    *(_QWORD *)(v58 - 200) = STACK[0x228];
    v64 = sub_21B523F98(v58 - 200);
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v57
                                                        + 8
                                                        * ((1074 * (LODWORD(STACK[0x4DC]) == -611232798)) ^ (v62 - 218)))
                                            - (((v62 - 218) ^ 0x17Au)
                                             + 781)
                                            + 1075))(v64);
  }
}

uint64_t sub_21B50120C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8
                                             * ((26 * ((v1 & 0xFFFFFFFE) == ((v0 + 1494468615) ^ (v0 + 43)))) ^ v0))
                            - 12))();
}

uint64_t sub_21B501248@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v7 = a1 - 1692;
  v8 = STACK[0x5CC];
  v9 = (LODWORD(STACK[0x5CC]) + 1038018018) & 0x52D74BED ^ STACK[0x5CC] & 1;
  v10 = 944348131 * (((~(v6 - 200) & 0x811B63F2) - (~(v6 - 200) | 0x811B63F3)) ^ 0x2202C7BD);
  *(_QWORD *)(v6 - 168) = STACK[0x3F8];
  *(_QWORD *)(v6 - 160) = v4;
  *(_DWORD *)(v6 - 192) = (a1 + 1695025676) ^ v10;
  *(_DWORD *)(v6 - 200) = v8 - v10 - 2 * v9 + 280375758;
  *(_QWORD *)(v6 - 184) = v3;
  *(_QWORD *)(v6 - 176) = v2;
  *(_DWORD *)(v6 - 188) = v10 + (a1 + 1472114575) * v1 + 1684297497;
  v11 = sub_21B532544(v6 - 200);
  v12 = *(_DWORD *)(v6 - 196);
  LODWORD(STACK[0x4DC]) = v12;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5
                                                      + 8
                                                      * ((1679 * (v12 == ((v7 - 1143411350) & 0x4427136F) - 611233100)) ^ v7))
                                          - (((v7 + 8) | 0x382u) ^ 0x3D6)))(v11);
}

void sub_21B501378()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 - 200) = 1224239923 * ((2 * ((v1 - 200) & 0x5225B798) - (v1 - 200) + 769280102) ^ 0xDF69B5B1)
                        + 2138962370
                        + v0;
  sub_21B532B94((_DWORD *)(v1 - 200));
  LODWORD(STACK[0x2C0]) = LODWORD(STACK[0x2C0]) + ((v0 - 974) | 0x44) - 83;
  *(_BYTE *)(v1 - 192) = 55 - -85 * ((v1 + 56) ^ 0xF6);
  *(_QWORD *)(v1 - 184) = STACK[0x270];
  *(_QWORD *)(v1 - 200) = STACK[0x268];
  *(_DWORD *)(v1 - 176) = (v0 + 143) ^ (3804331 * ((v1 - 200) ^ 0x7ED525F6));
  ((void (*)(uint64_t))STACK[0x260])(v1 - 200);
  LODWORD(STACK[0x4DC]) = *(_DWORD *)(v1 - 172);
  LODWORD(STACK[0x2C4]) = 1074113811;
  JUMPOUT(0x21B50145CLL);
}

uint64_t sub_21B501520(unint64_t a1)
{
  int v1;
  unint64_t v2;
  uint64_t v3;

  STACK[0x480] = STACK[0x338] - 176;
  STACK[0x430] = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((((v1 + 1988890138) & 0x8973F1EC ^ 0x1DD) * (v2 > a1)) ^ v1))
                            - 8))();
}

uint64_t sub_21B5015DC@<X0>(uint64_t a1@<X0>, char a2@<W3>, int a3@<W4>, int a4@<W5>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(a1 + (v8 + a4)) = *(_BYTE *)(v10 + (v8 + a4)) ^ *(_BYTE *)(a5
                                                                                                  + ((v8 + a4) & 0xFLL)) ^ *(_BYTE *)(v5 + (((_BYTE)v8 + (_BYTE)a4) & 0xF)) ^ *(_BYTE *)((((_BYTE)v8 + (_BYTE)a4) & 0xF) + v6 + 2) ^ (((v8 + a4) & 0xF) * ((v7 + 16) ^ a2)) ^ v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((v8 + 1 + a4) > 0x14F) * a3) ^ v7)) - 8))();
}

uint64_t sub_21B501640@<X0>(uint64_t a1@<X0>, char a2@<W1>, int a3@<W2>, int a4@<W7>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = (v7 + a4);
  *(_BYTE *)(a1 + v12) = (v9 + 23) ^ *(_BYTE *)(v10 + v12) ^ *(_BYTE *)(a5 + (v12 & 0xF)) ^ *(_BYTE *)(v5 + (v12 & 0xF)) ^ *(_BYTE *)((v12 & 0xF) + v6 + 2) ^ ((v12 & 0xF) * a2) ^ 0x11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((v7 - 1 == a3) * v8) ^ v9)) - 8))();
}

uint64_t sub_21B5016A0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int8x16_t *a15)
{
  int v15;
  uint64_t v16;
  int8x16_t *v17;

  v17 = (int8x16_t *)((char *)&STACK[0x640] + STACK[0x338] - 0x6866AD2F319F122ALL);
  v17[-12] = veorq_s8(*a15, (int8x16_t)xmmword_21B567BC0);
  STACK[0x5D0] = (v15 + 484) + STACK[0x5D0] - 952;
  STACK[0x5D8] = a1;
  STACK[0x5E0] = a1;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 8 * (v15 ^ (1685 * (&v17[-12] == (int8x16_t *)a1))))
                                                                                       - 8))(a1, a2, 152, a4, a5);
}

#error "21B50396C: call analysis failed (funcsize=2087)"

void sub_21B503970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,unsigned __int8 a26,int a27,int a28,unsigned __int8 a29,int a30,unsigned __int8 a31,int a32,int a33,unsigned __int8 a34,__int16 a35,unsigned __int8 a36,int a37,int a38,char a39,__int16 a40,char a41)
{
  char v41;

  LODWORD(STACK[0x340]) = (a26 | ((a29 ^ 0xEF) << 8) | ((a36 ^ 0x92) << 16) | ((a34 ^ 0xC) << (((a41 + 44) | 0x61) ^ 0x7D))) ^ 0xC4710200;
  LODWORD(STACK[0x2AC]) = a32 ^ 0x2FFA2B30;
  LODWORD(STACK[0x370]) = ((a33 << 8) | (a28 << 24) | ((a37 ^ 0x3B) << 16) | a30) ^ 0xFED368E0;
  LODWORD(STACK[0x3B0]) = ((((a38 ^ 0xF2) << 16) + ((a27 ^ 0x1A) << 24)) | a31 | ((a39 ^ v41) << 8)) ^ 0x8BFAAA53;
  JUMPOUT(0x21B501A9CLL);
}

uint64_t sub_21B503A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v20 = STACK[0x430];
  STACK[0x5D0] -= 32;
  *(_BYTE *)(v20 + 335) = *(_BYTE *)(a13 + 335) ^ 0xCD ^ *(_BYTE *)(*(_QWORD *)(v18 + 8 * (a18 - 139)) + 15) ^ *(_BYTE *)(*(_QWORD *)(v18 + 8 * (a18 ^ 0x99)) + ((a18 - 162) & 0xFFFFFBC7) + 15 - 12) ^ *(_BYTE *)(*(_QWORD *)(v18 + 8 * (a18 - 37)) + 10) ^ 0xE5;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * a18) - 4))(4294966215, 151, 99);
}

void sub_21B503B28()
{
  JUMPOUT(0x21B503AA8);
}

uint64_t sub_21B503B30()
{
  int v0;
  uint64_t v1;

  STACK[0x480] -= 16;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((v0 | 0x438) + 1480984004) ^ 0x584608D0 ^ ((v0 | 0x438) + 1480984004) & 0xA7B9F72F ^ (v0 | 0x438) ^ 0x82)))();
}

uint64_t sub_21B503B80@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  _BYTE *v2;
  uint64_t v3;
  _BYTE *v4;
  unsigned int v5;

  v4 = (_BYTE *)STACK[0x5B8];
  v5 = (0x10u >> ((21 * (a2 ^ 0x35)) ^ 0x33)) - ((2 * (0x10u >> ((21 * (a2 ^ 0x35)) ^ 0x33))) & 0x116E9FBE) - 1732816929;
  v2[12] = (HIBYTE(v5) ^ 0x98) - ((v5 >> 23) & 0xCA) - 27;
  v2[13] = (BYTE2(v5) ^ 0xB7) - ((2 * (BYTE2(v5) ^ 0xB7)) & 0xCA) - 27;
  v2[14] = (BYTE1(v5) ^ 0x4F) + (~(2 * (BYTE1(v5) ^ 0x4F)) | 0x35) - 26;
  v2[15] = v5 ^ 0x3A;
  v4[16] ^= *v2 ^ 0xE5;
  v4[17] ^= v2[1] ^ 0xE5;
  v4[18] ^= v2[2] ^ 0xE5;
  v4[19] ^= v2[3] ^ 0xE5;
  v4[20] ^= v2[4] ^ 0xE5;
  v4[21] ^= v2[5] ^ 0xE5;
  v4[22] ^= v2[6] ^ 0xE5;
  v4[23] ^= v2[7] ^ 0xE5;
  v4[24] ^= v2[8] ^ 0xE5;
  v4[25] ^= v2[9] ^ 0xE5;
  v4[26] ^= v2[10] ^ 0xE5;
  v4[27] ^= v2[11] ^ 0xE5;
  v4[28] ^= v2[12] ^ 0xE5;
  v4[29] ^= v2[13] ^ 0xE5;
  v4[30] ^= v2[14] ^ 0xE5;
  v4[31] ^= v2[15] ^ 0xE5;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * (a2 + 314)) - 4))(3624580114, a1, 670385983, 573, 4294965530, 309, 563, 292462526);
}

void sub_21B503DA4()
{
  JUMPOUT(0x21B503BCCLL);
}

uint64_t sub_21B503DAC(int a1, uint64_t a2, int a3, int a4)
{
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((((v4 ^ 0x4D2) + a1) & a3 ^ a4) * (LODWORD(STACK[0x524]) != 1503180286)) ^ v4 ^ 0x4D2))
                            - 4))();
}

uint64_t sub_21B503DF0@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = *(unsigned __int8 *)(v2 + (v1 + v3 - 1)) != 229;
  return (*(uint64_t (**)(void))(v4 + 8 * (((2 * v5) | (8 * v5)) ^ a1)))();
}

uint64_t sub_21B503E2C(int a1, uint64_t a2, int a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((v4 + a1) & a3 ^ a4) * (v5 != 1503180286)) ^ v4)) - 4))();
}

uint64_t sub_21B503E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  int v39;
  uint64_t v40;
  unint64_t v41;

  LODWORD(STACK[0x524]) = 1503180286;
  v41 = STACK[0x5B8];
  STACK[0x418] = 335;
  *(_BYTE *)(v41 + 335) = ((a39 + (((v39 ^ 0x61) + 31) & 0xDD)) ^ 0xBA) * (a39 + 93);
  return (*(uint64_t (**)(void))(v40 + 8 * ((232 * (STACK[0x418] == 0)) ^ v39 ^ 0x361)))();
}

void sub_21B504388()
{
  JUMPOUT(0x21B504348);
}

uint64_t sub_21B504390(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = (v2 ^ 0x54Eu) * a2;
  v6 = ((uint64_t (*)(void))STACK[0x2C8])();
  LODWORD(STACK[0x5F0]) = v3;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4
                                                      + 8
                                                      * (v2 | (2 * (v3 == -611232798)) | ((v3 == -611232798) << 7)))
                                          - v5
                                          + 290))(v6);
}

uint64_t sub_21B5043D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v10;

  v7 = LODWORD(STACK[0x3C4]);
  v8 = STACK[0x3A0];
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 8 * (v5 - 259))
                                                                                    - 8);
  v10 = STACK[0x2A0];
  STACK[0x388] = STACK[0x2A0] + 2353;
  STACK[0x380] = v8 + 49;
  STACK[0x378] = v10 + 2333;
  STACK[0x370] = v8 + 29;
  STACK[0x368] = v10 + 2313;
  STACK[0x340] = v8 + 9;
  return v9(a1, 3072501700, 611190843, a4, a5, v7);
}

void sub_21B504C40()
{
  int v0;

  LODWORD(STACK[0x5E8]) = v0;
  JUMPOUT(0x21B504BC4);
}

uint64_t sub_21B504C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;

  STACK[0x3B0] = v6;
  v9 = (a6 + 722) | 0xC9;
  v10 = STACK[0x424];
  *(_DWORD *)(STACK[0x618] + ((LODWORD(STACK[0x424]) - 1189979397) & 0xFFFFFFFC)) = v7;
  LODWORD(STACK[0x424]) = v10 + v9 - 1221;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (int)((((v10 + v9 - 1189980618) < 0x40)
                                               * ((v9 + 1999958102) & 0x88CB0AE6 ^ 0x1C9)) ^ v9))
                            - 4))();
}

uint64_t sub_21B506340@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;

  v10 = a1 + v5;
  v11 = *(_DWORD *)(a3 + 4 * (v5 + ((v3 - 483) ^ (a1 - 742)))) ^ *(_DWORD *)(a3
                                                                                           + 4
                                                                                           * (a1 + v5 - 3));
  v12 = v11 + v9 - (a2 & (2 * v11));
  v13 = *(_DWORD *)(a3 + 4 * (v10 - 16)) ^ *(_DWORD *)(a3 + 4 * (v10 - 14));
  HIDWORD(v14) = v13 ^ v7 ^ v12;
  LODWORD(v14) = v13 ^ ~v12;
  *(_DWORD *)(a3 + 4 * (v4 + a1)) = (v14 >> 31) + v9 - (a2 & (2 * (v14 >> 31)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((v4 + 1 + a1) > 0x4F) * v6) ^ v3)) - 4))();
}

uint64_t sub_21B5063D0()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v0 - 76) ^ 0x7C)) - 4))();
}

void sub_21B5064F8()
{
  JUMPOUT(0x21B506420);
}

uint64_t sub_21B506510(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((16 * ((a4 + 1 + v5) > 0x27)) | (32
                                                                               * ((a4 + 1 + v5) > 0x27))) ^ v4)))();
}

uint64_t sub_21B5065C8(uint64_t a1, int a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t))(v5 + 8 * ((571 * ((a2 + 1 + v4) > 0x3B)) ^ v3)))(a3);
}

uint64_t sub_21B506688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * ((30 * ((a5 + 1 + v6) > 0x4F)) ^ v5)))();
}

void sub_21B506734(int a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;

  LODWORD(STACK[0x56C]) = v1;
  LODWORD(STACK[0x42C]) = v4;
  LODWORD(STACK[0x454]) = v2;
  LODWORD(STACK[0x5A4]) = v3;
  LODWORD(STACK[0x3F0]) = v5;
  v9 = STACK[0x608];
  v10 = *(_DWORD *)(STACK[0x608] - 0x520F56D3BDEB7B9FLL);
  LODWORD(STACK[0x424]) = v8 + 80;
  v11 = ((a1 - 267) ^ (v6 - 214) ^ v10) + (v5 ^ v6);
  *(_DWORD *)(v9 - 0x520F56D3BDEB7B9FLL) = v11 + v6 - (v7 & (2 * v11));
  JUMPOUT(0x21B5067CCLL);
}

uint64_t sub_21B5068A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;
  unint64_t v61;
  int v62;

  v61 = STACK[0x3E0];
  v62 = *(unsigned __int8 *)(STACK[0x3E0] - 0x520F56D3BDEB7B97) ^ 0xA4;
  if (v62 == 2)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60
                                                                                            + 8
                                                                                            * ((23
                                                                                              * (*(_DWORD *)(v61 - 0x520F56D3BDEB7B9BLL) == 1922694427)) ^ (a6 + 1267)))
                                                                                - ((a6 + 367) ^ 0x295)))(a1, a2, 611190843, 3611206428, 3281388523);
  if (v62 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60
                                                                                   + 8
                                                                                   * ((1774
                                                                                     * (((*(_DWORD *)(v61 - 0x520F56D3BDEB7B9BLL) == 1922694427) ^ (a6 - 21)) & 1)) ^ (a6 + 366)))
                                                                       - 12))(a1, a2, 611190843, 4104671933);
  STACK[0x4F8] = 91;
  *(_BYTE *)(v61 - 0x520F56D3BDEB7B9CLL) = ((a60 + 48) ^ 0xBA) * (a60 + 65);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60
                                                                                 + 8
                                                                                 * ((194 * (STACK[0x4F8] == 0)) ^ a6 ^ 0x329))
                                                                     - 8))(a1, a2, 611190843, 4104671933);
}

void sub_21B507088()
{
  JUMPOUT(0x21B50703CLL);
}

uint64_t sub_21B507098()
{
  return ((uint64_t (*)(void))STACK[0x558])();
}

uint64_t sub_21B5070C8@<X0>(unsigned int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v6 = 334 * (v4 ^ 0x29F);
  v7 = STACK[0x5A8];
  v8 = *(_DWORD *)(a3 - 0x520F56D3BDEB7BAFLL + ((a2 + 1013578773) & 0xFFFFFFFC));
  v9 = (v8 >> (((v6 - 122) | 0xC) - 22)) ^ 0x4F;
  *(_BYTE *)(v7 + (a2 + 1013578773)) = v9 - ((2 * v9) & 0xCA) - 27;
  *(_BYTE *)(v7 + (a2 + 1013578774)) = (BYTE2(v8) ^ 0xA2) - ((2 * (BYTE2(v8) ^ 0xA2)) & 0xCA) - 27;
  *(_BYTE *)(v7 + (a2 + 1013578775)) = (BYTE1(v8) ^ 0xEF) + (~(2 * (BYTE1(v8) ^ 0xEF)) | 0x35) - 26;
  *(_BYTE *)(v7 + (a2 + 1013578776)) = v8 ^ 0xE7;
  v10 = *v3 + 1688512001;
  v11 = v10 < a1;
  v12 = v10 > 0xD73EA320;
  if (a1 > 0xD73EA320 != v11)
    v12 = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (v12 ^ v6)) - 12))();
}

void sub_21B5071CC()
{
  JUMPOUT(0x21B5070F8);
}

uint64_t sub_21B5071D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;

  v10 = (LODWORD(STACK[0x5EC]) ^ (v9 - 90) ^ ((a6 - 262) | 0x42)) + (v6 ^ v9);
  *(_DWORD *)(v7 + 52) = ((v10 % 0x2710) ^ 0xBAF5DF65) + 1869507520 + ((2 * (v10 % 0x2710)) & 0x3ECA);
  v11 = STACK[0x5F4];
  LODWORD(STACK[0x594]) = STACK[0x5F4];
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((1197 * (v11 == v9)) ^ (a6 - 196))) - 12))();
}

uint64_t sub_21B50726C@<X0>(int a1@<W8>)
{
  _DWORD *v2;
  uint64_t v3;

  *v2 = STACK[0x4A4];
  v2[85] = STACK[0x3EC];
  v2[86] = STACK[0x590];
  v2[87] = STACK[0x408];
  v2[88] = STACK[0x404];
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((STACK[0x5C0] == 0) ^ (57 * (a1 ^ 0x79))) & 1)
                                          * (((a1 ^ 0x144) - 1943974195) & 0x73DEB266 ^ 0x338)) ^ ((a1 ^ 0x144) + 308)))
                            - 8))();
}

uint64_t sub_21B5072A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7;

  STACK[0x480] -= 1616;
  LODWORD(STACK[0x594]) = a3 + 154;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((STACK[0x5C0] == 0) ^ (57 * (a6 ^ 0x3D))) & 1)
                                          * ((a6 - 1943974195) & 0x73DEB266 ^ 0x338)) ^ (a6 + 308)))
                            - 8))();
}

uint64_t sub_21B5072BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((STACK[0x5C0] == 0) ^ (57 * (a6 ^ 0x3D))) & 1)
                                          * ((a6 - 1943974195) & 0x73DEB266 ^ 0x338)) ^ (a6 + 308)))
                            - 8))();
}

uint64_t sub_21B5072C4(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;

  LODWORD(STACK[0x4DC]) = a3 - 46;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((((v3 - 44) ^ (STACK[0x320] == 0)) & 1) == 0)
                                          * (((v3 - 293) | 0x24) ^ 0x819)) ^ (v3 - 257)))
                            - 12))();
}

uint64_t sub_21B507430()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8
                                             * ((60 * ((v0 & 0xFFFFFFFE) == 154 * (v1 ^ 0x5D7) + 1494466974)) ^ v1))
                            - (((v1 - 1456) | 0x102u) ^ 0x12ALL)))();
}

uint64_t sub_21B507484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;

  v51 = STACK[0x510];
  v52 = 944348131 * ((((v50 - 200) | 0xC4443E) - ((v50 - 200) & 0xC4443E)) ^ 0xA3DDE070);
  v53 = (LODWORD(STACK[0x4A8]) ^ 0x4BFFDF0F)
      - v52
      - 1125174276
      + (((v47 ^ 0x67F) - 1744847555) & (2 * LODWORD(STACK[0x4A8])));
  *(_DWORD *)(v50 - 164) = v47 - v52 - 1338;
  *(_DWORD *)(v50 - 160) = v53;
  *(_QWORD *)(v50 - 184) = v45;
  *(_QWORD *)(v50 - 176) = a44;
  *(_DWORD *)(v50 - 196) = v52 + 499189394 + v44;
  *(_QWORD *)(v50 - 192) = v51;
  *(_QWORD *)(v50 - 152) = a43;
  *(_QWORD *)(v50 - 144) = v46;
  *(_BYTE *)(v50 - 200) = -29 * ((((v50 + 56) | 0x3E) - ((v50 + 56) & 0x3E)) ^ 0x70) + 120;
  v54 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v48 + 8 * (v47 ^ 0x697)) - 12))(v50 - 200);
  v55 = *(_DWORD *)(v50 - 168);
  LODWORD(STACK[0x4DC]) = v55;
  return (*(uint64_t (**)(uint64_t))(v49
                                            + 8
                                            * ((v55 == ((2 * v47) ^ 0xDB915EDE)) | (32
                                                                                  * (v55 == ((2 * v47) ^ 0xDB915EDE))) | v47)))(v54);
}

uint64_t sub_21B50758C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39)
{
  int v39;
  int v40;
  uint64_t v41;

  return ((uint64_t (*)(void))(*(_QWORD *)(v41
                                        + 8
                                        * ((((LODWORD(STACK[0x57C]) ^ v39) != a39 - 349099035)
                                          * (((v40 - 185) | 0x106) + 1599)) ^ v40))
                            - 4))();
}

uint64_t sub_21B5075D4@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);

  LODWORD(STACK[0x4DC]) = v1 + 385;
  v5 = 69008221 * ((v3 - 200) ^ 0x529C46E3D3A2520ALL);
  v6 = (a1 + 375001539) ^ v5;
  *(_QWORD *)(v3 - 192) = LODWORD(STACK[0x4DC]) ^ (unint64_t)v5;
  *(_DWORD *)(v3 - 200) = v5;
  *(_DWORD *)(v3 - 168) = v6 ^ 0x16;
  *(_DWORD *)(v3 - 164) = v6 ^ 0x42;
  *(_DWORD *)(v3 - 184) = v5 + a1 + 2104632088;
  *(_QWORD *)(v3 - 176) = 611190840 - v5;
  *(_DWORD *)(v3 - 160) = v6;
  v7 = ((uint64_t (*)(uint64_t))STACK[0x328])(v3 - 200);
  STACK[0x320] = 0;
  v8 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * *(int *)(v3 - 156)) - 8);
  LODWORD(STACK[0x2FC]) = 1109465630;
  return v8(v7);
}

void sub_21B5075E4()
{
  JUMPOUT(0x21B5075F4);
}

void sub_21B50764C(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  v3 = a2 + 281;
  ((void (*)(_QWORD, uint64_t, _QWORD))STACK[0x2D8])(*(unsigned int *)STACK[0x2D0], a1, (LODWORD(STACK[0x2FC]) - 1109467130 + a2 + 281 + 1174));
  *(_DWORD *)(v2 - 200) = 1224239923 * ((((2 * (v2 - 200)) | 0x5F397E52) - (v2 - 200) + 1348681943) ^ 0x5D2F42FE)
                        + 2138962370
                        + v3
                        + 664;
  sub_21B532B94((_DWORD *)(v2 - 200));
  JUMPOUT(0x21B5076D0);
}

uint64_t sub_21B507714(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;

  LODWORD(STACK[0x4DC]) = v1 - 46;
  v4 = STACK[0x510];
  v5 = LODWORD(STACK[0x4A8]);
  STACK[0x3D0] = v5;
  v6 = v5 == 29 * (v2 ^ 0x123) - 377;
  return ((uint64_t (*)(uint64_t, unint64_t))(*(_QWORD *)(v3 + 8 * ((v6 | (4 * v6)) ^ (v2 - 94)))
                                                            - (v2 - 77)
                                                            + 213))(a1, v4);
}

void sub_21B507768(uint64_t a1, uint64_t a2)
{
  ((void (*)(_QWORD, uint64_t, _QWORD))STACK[0x2D8])(*(unsigned int *)STACK[0x2D0], a2, 0);
  JUMPOUT(0x21B507840);
}

uint64_t sub_21B5078F4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t (*v3)(void);

  STACK[0x320] = 0;
  v2 = *(_DWORD *)(v0 + 56);
  *(_DWORD *)(v0 + 56) = v2 + 1;
  v3 = (uint64_t (*)(void))(*(_QWORD *)(v1
                                     + 8
                                     * ((794 * ((v2 - 1994143148) < 0xFFFFFFFA)) ^ (LODWORD(STACK[0x3C4])
                                                                                                - 218)))
                         - (LODWORD(STACK[0x3C4]) - 218)
                         + 76);
  LODWORD(STACK[0x2FC]) = 1109465630;
  return v3();
}

void sub_21B50794C()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 - 200) = 1224239923 * ((((v1 - 200) | 0x2951B061) - ((v1 - 200) & 0x2951B061)) ^ 0xDBE24DB6)
                        + 2138962370
                        + v0
                        + 906;
  sub_21B532B94((_DWORD *)(v1 - 200));
  *(_DWORD *)(v1 - 176) = (v0 + 1049) ^ (3804331
                                       * ((2 * ((v1 - 200) & 0x20A6DA20) - (v1 - 200) - 547805731) ^ 0xA18C002B));
  *(_QWORD *)(v1 - 184) = STACK[0x270];
  *(_QWORD *)(v1 - 200) = STACK[0x268];
  *(_BYTE *)(v1 - 192) = 55 - -85 * ((2 * ((v1 + 56) & 0x20) - (v1 + 56) - 35) ^ 0x2B);
  ((void (*)(uint64_t))STACK[0x260])(v1 - 200);
  STACK[0x320] = 0;
  LODWORD(STACK[0x2FC]) = 1109465630;
  JUMPOUT(0x21B5075F8);
}

void cp2g1b9ro(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_21B507AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  a14 = 944348131 * (&a13 ^ 0xA319A44E) - 504207030;
  v16 = sub_21B532C9C(&a13);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((52 * (a13 == -611232798)) ^ v15)))(v16);
}

uint64_t sub_21B507B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, unsigned int a14, int a15)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  a13 = &STACK[0x543300C3A69A2021];
  a14 = (831981571 * (((&a13 | 0xCCD8D81D) + (~&a13 | 0x332727E2)) ^ 0x55790838)) ^ 0x250;
  sub_21B524100((uint64_t)&a13);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16
                                                                                + 8 * ((1529 * (a15 == v15)) ^ 0x9D)))(v17, v18, v19, v20, v21);
}

uint64_t sub_21B507BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  a13 = 1224239923 * ((&a13 - 1617307407 - 2 * ((unint64_t)&a13 & 0x9F99D8F1)) ^ 0x6D2A2526) + 1059;
  a15 = a12;
  a16 = v16;
  v20 = (*(uint64_t (**)(int *))(v19 + 432))(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((222 * (a14 == v17)) ^ 0x404)) - 12))(v20);
}

uint64_t sub_21B507CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, unsigned int a15, int a16, unint64_t *a17, unsigned int a18)
{
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;

  v23 = ((((2 * &a13) | 0xD23F7F04) - &a13 + 383795326) ^ 0x3ABDED88) * v19;
  a17 = &STACK[0x236606C007542B32];
  a14 = a12;
  a18 = -1534935546 - v23;
  a15 = v23 ^ 0xD5A9A13E;
  a16 = (v21 - 2024874081) ^ v23;
  v24 = sub_21B5327E0((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((2018 * (a13 != v18)) ^ v21))
                                          - ((v21 - v22 + 299) ^ 0x5956FA9DLL)))(v24);
}

uint64_t sub_21B507D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, unsigned int a15)
{
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(unint64_t **);
  uint64_t v20;

  a15 = v15
      + 124
      - 944348131 * ((((2 * &a13) | 0x2AD9959A) - &a13 - 359451341) ^ 0xB6756E83);
  a13 = &STACK[0x509D13A7D8C2F408];
  a14 = a10;
  v19 = (void (*)(unint64_t **))(*(_QWORD *)(v18 + 8 * (v15 - 199)) - 12);
  v19(&a13);
  a15 = v15 + 124 - 944348131 * ((&a13 - 393436873 - 2 * (&a13 & 0xE88CA137)) ^ 0x4B950579);
  a13 = &STACK[0x509D13A7D8C2F404];
  a14 = a10;
  v19(&a13);
  HIDWORD(a13) = v15
               - 1543737703 * ((&a13 & 0x34966BEF | ~(&a13 | 0x34966BEF)) ^ 0xB59DC46C)
               + 549;
  a14 = a10;
  v20 = sub_21B5200C0((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17 + 8 * ((((_DWORD)a13 == v16) * (v15 + 572)) ^ v15)) - 4))(v20);
}

uint64_t sub_21B507EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  int v11;
  int v12;
  uint64_t v13;

  return ((uint64_t (*)(void))(1498872461 - (v11 ^ 0x5956FBDAu) + *(_QWORD *)(v13 + 8 * ((30 * (a11 == v12)) ^ v11))))();
}

uint64_t sub_21B507EEC()
{
  _QWORD *v0;
  int v1;
  int v2;
  int v3;
  void (*v5)(unsigned int *);
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = (v1 - 571016598) & 0x7B5FFEDB;
  *v0 = v7 ^ 0x82C7A973 ^ v3;
  v9 = (v3 - 1498871168) ^ (69008221
                          * (((&v9 | 0x3C42271F) + (~&v9 | 0xC3BDD8E0)) ^ 0xEFE07514));
  v10 = v6;
  v5(&v9);
  v9 = (v3 - 1498871168) ^ (69008221
                          * (((&v9 | 0xAC5B8EA5) + (~&v9 | 0x53A4715A)) ^ 0x7FF9DCAE));
  v10 = v8;
  v5(&v9);
  return v2 ^ 0xDB9153E2;
}

void sub_21B508014(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) ^ (69008221 * ((-2 - ((a1 | 0x12D8BC8) + (~(_DWORD)a1 | 0xFED27437))) ^ 0x2D70263D));
  v2 = *(_QWORD *)a1;
  ((void (*)(char *, void (*)()))*(&off_24DE82D70 + (v1 ^ 0x24F)))((char *)*(&off_24DE82D70 + v1 - 618) - 8, sub_21B5336D0);
  __asm { BR              X11 }
}

uint64_t sub_21B5080F4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1992 * (*(_QWORD *)(*(_QWORD *)(v2 + 8 * (v0 - 478)) - 4) == 0)) ^ v0))
                            - ((v0 + 696) ^ (v0 - 10) ^ 0x7DALL)))();
}

uint64_t sub_21B508144@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 1246)))(v1);
}

void sub_21B508160(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X16 }
}

uint64_t sub_21B5082B4()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1023
                                          * (((v1 << ((v0 + 76) ^ 0x21)) & 0x3EDFDFDA ^ 0x2EDB49D0)
                                           + (v1 ^ 0xE8124B15)
                                           + 2142713535 != ((v0 - 967863836) & 0x39B06D7F) + 522658164)) ^ v0))
                            - 4))();
}

uint64_t sub_21B50833C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1751
                                          * (a3 + v5 + ((a4 + 1059) ^ 0x60901650u) >= ((a4 + 1059) | 0x120u) - 1883)) ^ a4))
                            - 4))();
}

uint64_t sub_21B508398(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((((31 * (a6 ^ 0xBF)) ^ 0x704) * ((a2 + a7 - 16) < 0xFFFFFFF0)) ^ a6))
                            - 8))();
}

uint64_t sub_21B5083D8(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v25;

  v13 = a6 ^ 0x67;
  v14 = (a3 + v11 + a2);
  v15 = *(_QWORD *)(v12 - 120);
  v16 = v14 + v15;
  v17 = (v13 - 214) & v14;
  v18 = v7 - v16;
  v19 = (v17 | v8) - v16;
  v20 = (v17 | v9) - v16;
  v21 = v18 + v17;
  v25 = (unint64_t)(v6 - v15) < 0x10 || v21 < 0x10 || v19 < 0x10 || v20 < 0x10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((494 * ((v13 ^ v25) & 1)) ^ v13)) - 8))();
}

uint64_t sub_21B508454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                                + 8
                                                                                * ((1017
                                                                                  * (v6 < ((25 * (a6 ^ 0xFA) + 212) ^ ((a6 ^ 0x118) + 599688654) & 0xDC417BFF))) ^ a6 ^ 0x118))
                                                                    - 4))(a1, a2, a3, 0);
}

uint64_t sub_21B5084B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  int8x16_t v54;
  int8x16x4_t v56;
  int8x16x4_t v57;

  v56.val[1].i64[0] = ((_BYTE)v47 + 1) & 0xF;
  v56.val[1].i64[1] = v47 & 0xF;
  v56.val[2].i64[0] = ((_BYTE)v47 - 1) & 0xF;
  v56.val[2].i64[1] = ((_BYTE)v47 + 14) & 0xF;
  v56.val[3].i64[0] = ((_BYTE)v47 + 13) & 0xF;
  v56.val[3].i64[1] = ((_BYTE)v47 + 12) & 0xF;
  v57.val[0].i64[0] = ((_BYTE)v47 + 11) & 0xF;
  v57.val[0].i64[1] = ((_BYTE)v47 + 10) & 0xF;
  v57.val[1].i64[0] = ((_BYTE)v47 + 9) & 0xF;
  v57.val[1].i64[1] = ((_BYTE)v47 + 8) & 0xF;
  v57.val[2].i64[0] = ((_BYTE)v47 + 7) & 0xF;
  v57.val[2].i64[1] = (v47 + 6) & 0xF;
  v57.val[3].i64[0] = ((_BYTE)v47 + 5) & 0xF;
  v57.val[3].i64[1] = ((_BYTE)v47 + 4) & 0xF;
  v50.i64[0] = 0x6161616161616161;
  v50.i64[1] = 0x6161616161616161;
  v51.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v51.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v56.val[0].i64[0] = ((_BYTE)v47 + (_BYTE)v46) & 0xF;
  v56.val[0].i64[1] = ((_BYTE)v47 + 2) & 0xF;
  v52.i64[0] = vqtbl4q_s8(v56, (int8x16_t)xmmword_21B567BD0).u64[0];
  v52.i64[1] = vqtbl4q_s8(v57, (int8x16_t)xmmword_21B567BD0).u64[0];
  v53 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v42 - 15 + (v47 + v46)), *(int8x16_t *)(v43 + v56.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v44 + v56.val[0].i64[0] - 15), *(int8x16_t *)(v45 + v56.val[0].i64[0] - 15))));
  v54 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v53, v53, 8uLL), v51), vmulq_s8(v52, v50)));
  *(int8x16_t *)(*(_QWORD *)(v49 - 120) - 15 + (v47 + v46)) = vextq_s8(v54, v54, 8uLL);
  return (*(uint64_t (**)(uint64_t))(a42
                                            + 8 * ((1223 * (((a5 - 226) | 0x5C8) - 2013 == (v48 & 0xFFFFFFF0))) ^ a5)))(v48);
}

uint64_t sub_21B508624(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * (v1 ^ (77 * (v2 == 0x777DA4F8)))))(a1, 216474213);
}

uint64_t sub_21B50867C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  _BOOL4 v18;

  v14 = v8 > v10;
  *(_BYTE *)(*(_QWORD *)(v13 - 120) + v6 + 13 + a2 - 216475549) = *(_BYTE *)(v2 + v6 + 13 + a2 - 216475549) ^ *(_BYTE *)(v3 + (((_BYTE)v6 + 13 + (_BYTE)a2 + 99) & 0xF)) ^ *(_BYTE *)(v4 + (((_BYTE)v6 + 13 + (_BYTE)a2 + 99) & 0xF)) ^ *(_BYTE *)(v5 + ((v6 + 13 + a2 - 216475549) & 0xFLL)) ^ (97 * ((v6 + 13 + a2 + 99) & 0xF)) ^ 0xE5;
  v15 = a2 + 767244697;
  v16 = (a2 + 1);
  v17 = v14 ^ (v15 < v7);
  v18 = v15 < v9;
  if (!v17)
    v14 = v18;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8 * ((!v14 * v11) ^ v6)))(a1, v16);
}

uint64_t sub_21B508714(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11 + 8 * (int)((((v10 ^ 0x2D5) - 1310) * (a1 == a4)) ^ v10))
                                          - (v10 ^ 0x7E1)))(a10);
}

uint64_t sub_21B508754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;
  _BOOL4 v10;

  v10 = (((a7 + 1375) ^ 0x76B) & v8) == 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v9
                                                                                                 + 8
                                                                                                 * (((4 * v10) | (32 * v10)) ^ a7))
                                                                                     - 4))(a1, a2, a3, a4, (v7 - a4), (a7 + 1375) ^ 0x4A8u);
}

uint64_t sub_21B50878C(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  int v47;
  char v48;
  int v49;
  uint64_t v50;
  int v51;
  unsigned int v52;
  int v53;
  char v54;
  uint64_t v55;
  int8x16x4_t v57;

  v51 = a6 - 7;
  *(_DWORD *)(v50 - 136) = v47;
  v52 = (v51 ^ 0xFFFFFC3C) & v47;
  *(_QWORD *)(v50 - 128) = *(_QWORD *)(v50 - 120) - 7;
  v53 = -a4;
  *(_DWORD *)(v50 - 144) = v52;
  v54 = v48 + a3 + v49;
  v55 = (v53 + a3 + v49 + a2);
  v57.val[0].i64[0] = ((_BYTE)v53 + (_BYTE)a3 + (_BYTE)v49 + (_BYTE)a2) & 0xF;
  v57.val[0].i64[1] = ((_BYTE)v53 + v54 + 2) & 0xF;
  v57.val[1].i64[0] = ((_BYTE)v53 + v54 + 1) & 0xF;
  v57.val[1].i64[1] = ((_BYTE)v53 + v46) & 0xF;
  v57.val[2].i64[0] = ((_BYTE)v53 + v54 + 15) & 0xF;
  v57.val[2].i64[1] = ((_BYTE)v53 + v46 + ((v51 + 92) ^ 0xE)) & 0xF;
  v57.val[3].i64[0] = ((_BYTE)v53 + v54 + 13) & 0xF;
  v57.val[3].i64[1] = ((_BYTE)v53 + v54 + 12) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v50 - 128) + v55) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v42 - 7 + v55), *(int8x8_t *)(v43 + (v55 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v44 + (v55 & 0xF) - 7), *(int8x8_t *)(v45 + (v55 & 0xF) - 7)))), (int8x8_t)0xE5E5E5E5E5E5E5E5), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v57, (int8x16_t)xmmword_21B567BE0), (int8x8_t)0x6161616161616161)));
  return (*(uint64_t (**)(__n128))(a42 + 8 * ((15 * (v53 != 8 - v52)) ^ v51)))((__n128)xmmword_21B567BE0);
}

void sub_21B5088D4()
{
  JUMPOUT(0x21B5087FCLL);
}

uint64_t sub_21B5088F8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10
                                                      + 8
                                                      * (a2 ^ (2036 * (*(_DWORD *)(v11 - 136) == *(_DWORD *)(v11 - 144)))))
                                          - 31 * (((a2 + 504) | 0x120) ^ 0x505u)
                                          + 1887))(a10);
}

uint64_t sub_21B508944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = (a5 + v13);
  *(_BYTE *)(*(_QWORD *)(v15 - 120) + v16) = *(_BYTE *)(v8 + v16) ^ *(_BYTE *)(v9 + (v16 & 0xF)) ^ *(_BYTE *)(v10 + (v16 & 0xF)) ^ *(_BYTE *)(v11 + (v16 & 0xF)) ^ (97 * (v16 & 0xF)) ^ 0xE5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((1613 * (a8 - 555 + a5 - 1337 == v12 + 1336)) ^ (a8 - 1648)))
                            - 8))();
}

uint64_t sub_21B5089B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  int v39;

  v37 = *(_QWORD *)(a1 + 24);
  *(int8x16_t *)(v36 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(a1 + 40) - 0x19A1466F6B3326CLL), (int8x16_t)xmmword_21B567BF0);
  if (*(_QWORD *)(v36 - 120))
    v38 = v37 == 0x38046E592152BE6ALL;
  else
    v38 = 1;
  v39 = !v38;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 + 8 * (int)((167 * v39) ^ a6)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_21B508A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,int a44)
{
  uint64_t v44;
  int v45;
  _BOOL4 v47;

  v45 = a11 - ((2 * a11 + 505939158) & 0x8F21A8C6) + a44 + 1453642107;
  v47 = (((((_BYTE)v45 << (a6 ^ 0x39)) & 0xEE ^ 0xC6) + (v45 ^ 0x14) + 9) & 0xF) != (((a6 ^ 0x8D) - 98) ^ 0x553)
     || ((v45 << (a6 ^ 0x39)) & 0xBFFFEAEE ^ 0x8F21A8C6) + (v45 ^ 0x986F2114) == (((a6 ^ 0x8D) - 625) | 0x90)
                                                                               + 1610609059;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 + 8 * (int)((101 * v47) ^ a6 ^ 0x8D)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_21B508AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,int a45)
{
  uint64_t v45;
  unsigned int v46;

  v46 = a12 - ((a10 << ((((a45 - 82) | 0x62) + 104) ^ 0xCA)) & 0xB52D156C) + 1772784929;
  return ((uint64_t (*)(void))(*(_QWORD *)(v45
                                        + 8
                                        * ((198
                                          * (((2 * v46) & 0x5F8FFE9A ^ 0x150D1408) + (v46 ^ 0x755175FB) + 1517884175 != 172036700)) ^ a45))
                            - 4))();
}

uint64_t sub_21B508BC8(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4 + 8 * ((((a4 + 1432) ^ 0x770) * ((a3 + a2 + 1345847475) > 7)) ^ a4)))();
}

uint64_t sub_21B508C3C(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((1215 * (a1 + ((a4 - 1816126252) & 0x6C3FE7E7u) + a7 - 1687 >= (a6 ^ 0xFFFFF893))) ^ a4)))();
}

uint64_t sub_21B508C88(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _BOOL4 v25;
  int v27;

  v13 = (a3 + a2 + a1);
  v14 = *(_QWORD *)(v12 - 120);
  v15 = v13 + a8 + 220 + v14 - 1890;
  v16 = ((_BYTE)a3 + (_BYTE)a2 + (_BYTE)a1) & 0xF;
  v17 = v16 - v13;
  v18 = v8 + v16 - v13;
  v19 = v16 + v8 + 1;
  v20 = v16 + v9 - v13 + 2;
  v21 = v16 + v9 + 3;
  v22 = v10 + ((a8 - 1130) ^ 0x219) + v17;
  v23 = v16 + v10 + 5;
  v25 = v19 > v14 && v18 < v15;
  v27 = v21 > v14 && v20 < v15 || v25;
  if (v23 > v14 && v22 < v15)
    v27 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((14 * (v27 ^ 1)) ^ a8)) - 8))();
}

uint64_t sub_21B508D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                                + 8
                                                                                * ((362
                                                                                  * (((v7 < 0x10) ^ (a7 - 54)) & 1)) ^ a7))
                                                                    - 12))(a1, a2, a3, 0);
}

uint64_t sub_21B508D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  int8x16_t v49;
  uint64_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16x4_t v54;
  int8x16x4_t v55;

  v54.val[1].i64[0] = ((_BYTE)v46 + 4) & 0xF;
  v54.val[1].i64[1] = ((_BYTE)v46 + 3) & 0xF;
  v54.val[2].i64[0] = ((_BYTE)v46 + 2) & 0xF;
  v54.val[2].i64[1] = ((_BYTE)v46 + 1) & 0xF;
  v54.val[3].i64[0] = v46 & 0xF;
  v54.val[3].i64[1] = ((_BYTE)v46 - 1) & 0xF;
  v49.i64[0] = 0x7777777777777777;
  v49.i64[1] = 0x7777777777777777;
  v50 = (v46 + v43);
  v54.val[0].i64[0] = ((_BYTE)v46 + (_BYTE)v43) & 0xF;
  v54.val[0].i64[1] = ((_BYTE)v46 + 5) & 0xF;
  v51.i64[0] = vqtbl4q_s8(v54, (int8x16_t)xmmword_21B567BD0).u64[0];
  v55.val[0].i64[1] = ((_BYTE)v46 + 13) & 0xF;
  v55.val[1].i64[1] = ((_BYTE)v46 + 11) & 0xF;
  v55.val[2].i64[1] = (v46 + 9) & 0xF;
  v55.val[3].i64[1] = ((_BYTE)v46 + 7) & 0xF;
  v55.val[0].i64[0] = ((_BYTE)v46 + 14) & 0xF;
  v55.val[1].i64[0] = ((_BYTE)v46 + 12) & 0xF;
  v55.val[2].i64[0] = (v46 + 10) & 0xF;
  v55.val[3].i64[0] = ((_BYTE)v46 + 8) & 0xF;
  v51.i64[1] = vqtbl4q_s8(v55, (int8x16_t)xmmword_21B567BD0).u64[0];
  v52 = vrev64q_s8(vmulq_s8(v51, v49));
  *(int8x16_t *)(*(_QWORD *)(v48 - 120) - 15 + v50) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v42 + (v50 & 0xF) - 15), *(int8x16_t *)(*(_QWORD *)(v48 - 120) - 15 + v50)), veorq_s8(*(int8x16_t *)((v50 & 0xF) + v44 - 13), *(int8x16_t *)((v50 & 0xF) + v45 - 11))), vextq_s8(v52, v52, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a42
                                        + 8
                                        * ((2025 * (((a7 - 1159650359) & 0x451EDBBB ^ 0x1DE) - 108 == (v47 & 0xFFFFFFF0))) ^ (a7 - 1159650359) & 0x451EDBBBu))
                            - 12))();
}

uint64_t sub_21B508EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  int v42;
  unsigned __int8 *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  char *v47;
  int v48;
  unint64_t v49;
  int v50;
  char *v51;
  int v52;
  int v53;
  char *v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  unsigned int v68;
  int v69;
  char *v70;
  int v71;
  uint64_t v72;
  int v73;
  char *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  int v90;
  int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  int v103;
  int v104;
  unsigned int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  unsigned int v112;
  char *v113;
  char *v114;
  char *v115;
  int v116;
  char *v117;
  unsigned int v118;
  int v119;
  unsigned __int8 *v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  char *v133;
  uint64_t v134;
  char *v135;
  unsigned int v136;
  int v137;
  char *v138;
  int v139;
  int v140;
  int v141;
  unsigned int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  unsigned int v149;
  int v150;
  unsigned int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  unsigned int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  int v164;
  int v165;
  int v166;
  unsigned int v167;
  unsigned int v168;
  unsigned int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  unsigned int v176;
  unsigned int v177;
  int v178;
  int v179;
  int v180;
  unsigned int v181;
  int v182;
  int v183;
  unsigned int v184;
  unsigned int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  unsigned int v191;
  int v192;
  int v193;
  unsigned int v194;
  int v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  int v201;
  char *v202;
  uint64_t v203;
  unsigned int v204;
  int v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  char *v221;
  char *v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  unint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  int v241;
  int v242;
  unsigned int v243;
  int v244;
  unsigned int v245;
  unsigned int v246;

  v47 = (char *)*(&off_24DE82D70 + v42 - 967) - 4;
  v48 = v47[*(unsigned __int8 *)(v44 - 0x38046E592152BE69) ^ 0x85];
  HIDWORD(v49) = v48 ^ 0x24;
  LODWORD(v49) = ~v48 << 24;
  v50 = ((v49 >> 30) ^ (v42 - 53)) << 16;
  v51 = (char *)*(&off_24DE82D70 + (v42 ^ 0x3AE)) - 8;
  v52 = v51[*(unsigned __int8 *)(v44 - 0x38046E592152BE5FLL) ^ 0xBFLL];
  HIDWORD(v49) = v52 ^ 3;
  LODWORD(v49) = ~v52 << 24;
  LOBYTE(v52) = v49 >> 28;
  v53 = v47[*(unsigned __int8 *)(v44 - 0x38046E592152BE65) ^ 0x6FLL];
  HIDWORD(v49) = v53 ^ 0x24;
  LODWORD(v49) = ~v53 << 24;
  v54 = (char *)*(&off_24DE82D70 + (v42 ^ 0x37B)) - 8;
  v55 = v52 | ((v54[*(unsigned __int8 *)(v44 - 0x38046E592152BE60) ^ 0xB7] ^ 0x47) << 8);
  v56 = (uint64_t)*(&off_24DE82D70 + v42 - 883);
  LOBYTE(v53) = *(_BYTE *)(v56 + (*(unsigned __int8 *)(v44 - 0x38046E592152BE5ELL) ^ 0xD8));
  v57 = ((v54[*(unsigned __int8 *)(v44 - 0x38046E592152BE5CLL) ^ 0xC7] ^ 0xA7) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v53 ^ 0xECu) << 24);
  v58 = (((v49 >> 30) ^ 0x68) << 16) | ((v54[*(unsigned __int8 *)(v44
                                                                                                  - 0x38046E592152BE64) ^ 0xDFLL] ^ 0x66) << 8);
  v59 = v51[*(unsigned __int8 *)(v44 - 0x38046E592152BE5BLL) ^ 0xBCLL];
  HIDWORD(v49) = v59 ^ 3;
  LODWORD(v49) = ~v59 << 24;
  LOBYTE(v59) = v49 >> 28;
  v60 = v59 ^ 0x68;
  v61 = v51[*(unsigned __int8 *)(v44 - 0x38046E592152BE63) ^ 0x98];
  HIDWORD(v49) = v61 ^ 3;
  LODWORD(v49) = ~v61 << 24;
  v62 = v58 & 0xFFFFFF00 | ((*(unsigned __int8 *)(v56 + (*(unsigned __int8 *)(v44 - 0x38046E592152BE66) ^ 0xAFLL)) ^ 0x3C) << 24) | (v49 >> 28);
  LODWORD(v51) = v51[*(unsigned __int8 *)(v44 - 0x38046E592152BE67) ^ 0xD0];
  HIDWORD(v49) = v51 ^ 3;
  LODWORD(v49) = ~(_DWORD)v51 << 24;
  LOBYTE(v51) = v49 >> 28;
  v63 = v47[*(unsigned __int8 *)(v44 - 0x38046E592152BE5DLL) ^ 0xB6];
  HIDWORD(v49) = v63 ^ 0x24;
  LODWORD(v49) = ~v63 << 24;
  v64 = v50 & 0xFFFFFF00 | ((v54[*(unsigned __int8 *)(v44 - 0x38046E592152BE68) ^ 0x49] ^ 0xEC) << 8) | ((*(unsigned __int8 *)(v56 + (*v43 ^ 0xFELL)) ^ 0xE5) << 24) | v51 ^ 0x3C;
  v65 = (v49 >> 30) ^ 0x21;
  LODWORD(v47) = v47[*(unsigned __int8 *)(v44 - 0x38046E592152BE61) ^ 0xC8];
  HIDWORD(v49) = v47 ^ 0x24;
  LODWORD(v49) = ~(_DWORD)v47 << 24;
  v66 = (v57 | (v65 << 16) | v60) ^ 0x75F49EF4;
  v67 = (char *)*(&off_24DE82D70 + v42 - 821) - 4;
  v68 = v55 & 0xFF00FFFF | (((v49 >> 30) ^ 0x37) << 16) | ((*(unsigned __int8 *)(v56
                                                                                                + (*(unsigned __int8 *)(v44 - 0x38046E592152BE62) ^ 0x18)) ^ 0xA3) << 24);
  v69 = (((unsigned __int16)((v57 | v60) ^ 0x9EF4) >> 8) - ((2 * (v66 >> 8)) & 8) - 947690236) ^ *(_DWORD *)&v67[4 * (((unsigned __int16)((v57 | v60) ^ 0x9EF4) >> 8) ^ 0xF5)];
  v70 = (char *)*(&off_24DE82D70 + (v42 ^ 0x3B8)) - 12;
  v71 = *(_DWORD *)&v70[4 * (v53 ^ 0xF3)];
  LODWORD(v60) = v69 - ((2 * v69) & 0xCCF7A488);
  HIDWORD(v49) = v71 ^ 2;
  LODWORD(v49) = v71 ^ 0xEEB78604;
  v72 = (uint64_t)*(&off_24DE82D70 + (v42 ^ 0x3ED));
  LODWORD(v60) = (v49 >> 2) ^ *(_DWORD *)(v72 + 4 * (v65 ^ 0xDD)) ^ (v60 - 428092860);
  v73 = v60 - ((2 * v60) & 0xCC02F106);
  v74 = (char *)*(&off_24DE82D70 + v42 - 856) - 8;
  v245 = v64;
  v246 = v62;
  v75 = *(_DWORD *)&v74[4 * (v59 ^ 0xD9)] ^ v64 ^ (v73 + 1711372419);
  v243 = v68;
  v241 = v75 ^ v62 ^ 0x2789BBD4;
  v76 = v68 ^ 0xE6 ^ v241;
  LODWORD(v51) = *(_DWORD *)&v70[4 * (((v76 ^ v66) >> 24) ^ 0x21)];
  HIDWORD(v49) = v51 ^ 2;
  LODWORD(v49) = v51 ^ 0xEEB78604;
  LODWORD(v51) = ((v49 >> 2) - ((2 * (v49 >> 2)) & 0xCC02F106) + 1711372419) ^ *(_DWORD *)&v74[4
                                                                                             * ((v76 ^ v66) ^ 0xDE)];
  HIDWORD(v239) = v76 ^ v66;
  v242 = v75;
  LODWORD(v239) = *(_DWORD *)&v67[4 * (((unsigned __int16)(v76 ^ v66) >> 8) ^ 0x1E)] ^ *(_DWORD *)(v72 + 4 * (((v76 ^ v66) >> 16) ^ 0x8Fu)) ^ v75 ^ ((((unsigned __int16)(v76 ^ v66) >> 8) ^ 0xEB) - (((v76 ^ v66) >> 7) & 8) - 947690236) ^ ((_DWORD)v51 - ((2 * (_DWORD)v51) & 0xCCF7A488) - 428092860);
  v77 = v239 ^ 0x76E748E2 ^ v75 ^ v62;
  v244 = v66;
  v78 = *(_DWORD *)&v70[4 * (((v77 ^ v66) >> 24) ^ 0xA2)];
  HIDWORD(v49) = v78 ^ 2;
  LODWORD(v49) = v78 ^ 0xEEB78604;
  v79 = v77 ^ v66 ^ 0xC84590C6;
  v80 = *(_DWORD *)&v67[4 * (BYTE1(v79) ^ 0xF5)] ^ *(_DWORD *)(v72
                                                             + 4
                                                             * (((v77 ^ v66) >> 16) ^ 0x6Cu)) ^ (BYTE1(v79) - (((v77 ^ v66) >> 7) & 8) - 947690236) ^ ((v49 >> 2) - ((2 * (v49 >> 2)) & 0xCCF7A488) - 428092860);
  HIDWORD(v237) = v239 ^ 0x76E748E2 ^ *(_DWORD *)&v74[4 * ((v77 ^ v66) ^ 0x83)] ^ (v80
                                                                                                  - ((2 * v80) & 0xCC02F106)
                                                                                                  + 1711372419);
  LODWORD(v238) = v77 ^ v66;
  v81 = HIDWORD(v237) ^ 0x2789BBD4 ^ v77 ^ 0x8EDEEA78;
  v240 = v76;
  HIDWORD(v238) = v77;
  HIDWORD(v236) = v77 ^ v76;
  LODWORD(v237) = HIDWORD(v237) ^ 0x2789BBD4 ^ v77;
  v82 = v81 ^ v77 ^ v76;
  LODWORD(v66) = v82 ^ v79;
  v83 = *(_DWORD *)&v70[4 * (((v82 ^ v79) >> 24) ^ 0x67)];
  HIDWORD(v49) = v83 ^ 2;
  LODWORD(v49) = v83 ^ 0xEEB78604;
  v84 = (v49 >> 2) ^ *(_DWORD *)&v67[4 * (((unsigned __int16)(v82 ^ v79) >> 8) ^ 0x97)] ^ ((((unsigned __int16)(v82 ^ v79) >> 8) ^ 0x62) - (((v82 ^ v79) >> 7) & 8) - 947690236);
  v85 = v82 ^ v79 ^ 0x2142BA5;
  v86 = (v84 - ((2 * v84) & 0xCC02F106) + 1711372419) ^ *(_DWORD *)&v74[4 * (v85 ^ 0x44)];
  v87 = HIDWORD(v237) ^ 0x2789BBD4 ^ *(_DWORD *)(v72 + 4 * (BYTE2(v85) ^ 0xB6u)) ^ (v86
                                                                                    - ((2 * v86) & 0xCCF7A488)
                                                                                    - 428092860);
  LODWORD(v236) = v82;
  LODWORD(v234) = v87 ^ v81 ^ 0x307C325C ^ v82 ^ 0x5EF1BA37;
  LODWORD(v51) = *(_DWORD *)&v70[4 * (((v234 ^ v66) >> 24) ^ 0xA4)];
  HIDWORD(v49) = v51 ^ 2;
  LODWORD(v49) = v51 ^ 0xEEB78604;
  LODWORD(v51) = ((v49 >> 2) - ((2 * (v49 >> 2)) & 0xCC02F106) + 1711372419) ^ *(_DWORD *)&v74[4
                                                                                             * ((v234 ^ v66) ^ 0x18)];
  v88 = v234 ^ v66 ^ 0xCEE37B5D;
  HIDWORD(v233) = v234 ^ v66;
  HIDWORD(v234) = v87 ^ v81;
  v235 = __PAIR64__(v66, v87);
  LODWORD(v66) = *(_DWORD *)(v72 + 4 * (((v234 ^ v66) >> 16) ^ 0xCAu)) ^ *(_DWORD *)&v67[4 * (BYTE1(v88) ^ 0xF5)] ^ v87 ^ (BYTE1(v88) - (((v234 ^ v66) >> 7) & 8) - 947690236) ^ 0xE7E8D0DC ^ ((_DWORD)v51 - ((2 * (_DWORD)v51) & 0xCCF7A488) - 428092860);
  v89 = v66 ^ ((v82 ^ 0x5EF1BA37) - ((2 * (v82 ^ 0x5EF1BA37)) & 0xCFD1A1B8) - 404172580);
  v90 = *(_DWORD *)&v70[4 * (((v89 ^ v88) >> 24) ^ 0x70)];
  HIDWORD(v49) = v90 ^ 2;
  LODWORD(v49) = v90 ^ 0xEEB78604;
  v91 = ((v49 >> 2) - ((2 * (v49 >> 2)) & 0xCCF7A488) - 428092860) ^ *(_DWORD *)(v72
                                                                               + 4
                                                                               * (((v89 ^ v88 ^ 0xF3443494) >> 16) ^ 0xE4u));
  v92 = (v91 - ((2 * v91) & 0xCC02F106) + 1711372419) ^ *(_DWORD *)&v74[4
                                                                      * ((v66 ^ ((v82 ^ 0x37)
                                                                                                - ((2 * (v82 ^ 0x37)) & 0xB8)
                                                                                                - 36) ^ v88) ^ 0x91)];
  LODWORD(v232) = v89 ^ v88;
  v93 = v89 ^ v88 ^ 0x1A89BBD4;
  v94 = (v92 - ((2 * v92) & 0x8F06CA08) - 947690236) ^ *(_DWORD *)&v67[4 * (BYTE1(v93) ^ 0xF5)];
  v95 = v66 ^ BYTE1(v93) ^ (v94 - ((2 * v94) & 0xCFD1A1B8) - 404172580);
  HIDWORD(v232) = v89;
  LODWORD(v233) = v66;
  LODWORD(v231) = v66 ^ ((HIDWORD(v234) ^ 0x307C325C)
                       - 2 * ((HIDWORD(v234) ^ 0x307C325C) & 0x67E8D0DF ^ BYTE4(v234) & 3)
                       - 404172580);
  HIDWORD(v230) = v95 ^ v231;
  v96 = v95 ^ v231 ^ 0xE6F58988;
  v97 = v96 ^ v89;
  LODWORD(v66) = v96 ^ v89 ^ v93;
  v98 = *(_DWORD *)&v70[4 * (BYTE3(v66) ^ 0x43)];
  HIDWORD(v49) = v98 ^ 2;
  LODWORD(v49) = v98 ^ 0xEEB78604;
  v99 = *(_DWORD *)&v67[4 * (((unsigned __int16)(v66 ^ 0x7ABE) >> 8) ^ 0xF5)] ^ *(_DWORD *)(v72 + 4 * (((v66 ^ 0x4D501F31) >> 16) ^ 0xE2u)) ^ (((unsigned __int16)(v66 ^ 0x7ABE) >> 8) - ((v66 >> 7) & 8) - 947690236) ^ ((v49 >> 2) - ((2 * (v49 >> 2)) & 0xCCF7A488) - 428092860);
  HIDWORD(v231) = v95;
  v100 = v95 ^ *(_DWORD *)&v74[4 * (v66 ^ 0xFB)] ^ (v99 - ((2 * v99) & 0xCC02F106) + 1711372419);
  HIDWORD(v228) = v100 ^ v96;
  v101 = v100 ^ v96 ^ 0x5BF36347;
  LODWORD(v230) = v97;
  LODWORD(v228) = v101 ^ v97;
  LODWORD(v51) = v101 ^ v97 ^ 0x2745D0FF;
  v102 = v51 ^ v66 ^ 0x299B7ABE;
  v103 = v102 ^ 0x3DCC6B2B;
  v104 = (((unsigned __int16)(v102 ^ 0x6B2B) >> 8) - ((v102 >> 7) & 8) - 947690236) ^ *(_DWORD *)&v67[4 * (((unsigned __int16)(v102 ^ 0x6B2B) >> 8) ^ 0xF5)];
  v105 = (v104 - ((2 * v104) & 0xCC02F106) + 1711372419) ^ *(_DWORD *)&v74[4 * (v102 ^ 0x6E)];
  HIDWORD(v227) = v102;
  v106 = *(_DWORD *)&v70[4 * (HIBYTE(v102) ^ 0x57)];
  HIDWORD(v49) = v106 ^ 2;
  LODWORD(v49) = v106 ^ 0xEEB78604;
  v229 = __PAIR64__(v66, v100);
  LODWORD(v227) = (v49 >> 2) ^ *(_DWORD *)(v72 + 4 * (((v102 ^ 0x516EF336) >> 16) ^ 0x8Bu)) ^ v100 ^ (v105 - ((2 * v105) & 0xCCF7A488) - 428092860);
  v107 = v227 ^ 0x930000ED ^ v101;
  LODWORD(v226) = v107 ^ 0x8D06EA22 ^ v51;
  v108 = *(_DWORD *)&v70[4 * (((v226 ^ v103) >> 24) ^ 0x39)];
  HIDWORD(v49) = v108 ^ 2;
  LODWORD(v49) = v108 ^ 0xEEB78604;
  HIDWORD(v225) = v226 ^ v103;
  LODWORD(v66) = v226 ^ v103 ^ 0x53DEAA41;
  v109 = ((unsigned __int16)(v226 ^ v103 ^ 0xAA41) >> 8);
  v110 = *(_DWORD *)&v67[4 * (v109 ^ 0xF5)] ^ *(_DWORD *)&v74[4 * ((v226 ^ v103) ^ 4)] ^ (v49 >> 2);
  v111 = *(_DWORD *)(v72 + 4 * (((v226 ^ v103 ^ 0x9289BB39) >> 16) ^ 0x7Eu)) ^ v227 ^ 0x930000ED ^ v109 ^ 0xA2E04E55 ^ ((v110 ^ 0xA1821D87) - 2 * ((v110 ^ 0xA1821D87) & 0x667BD264 ^ v110 & 0x20) - 428092860);
  HIDWORD(v226) = v107;
  v112 = (v107 ^ 0x8D06EA22) - 2 * ((v107 ^ 0x8D06EA22) & 0x22E04E5D ^ v107 & 8);
  LODWORD(v51) = v111 ^ ((_DWORD)v51 - ((2 * (_DWORD)v51) & 0x45C09CAA) - 1562358187);
  LODWORD(v70) = *(_DWORD *)&v70[4 * (((v51 ^ v66) >> 24) ^ 0x44)];
  HIDWORD(v49) = v70 ^ 2;
  LODWORD(v49) = v70 ^ 0xEEB78604;
  LODWORD(v67) = *(_DWORD *)&v67[4 * (((unsigned __int16)((unsigned __int16)v51 ^ v66) >> 8) ^ 0xFD)] ^ *(_DWORD *)&v74[4 * ((v51 ^ v66) ^ 0xC4)] ^ ((((unsigned __int16)((unsigned __int16)v51 ^ v66) >> 8) ^ 8) - (((v51 ^ v66) >> 7) & 8) - 947690236) ^ ((v49 >> 2) - ((2 * (v49 >> 2)) & 0xCC02F106) + 1711372419);
  HIDWORD(v224) = v51 ^ v66 ^ 0x51800E2B;
  LODWORD(v67) = ((_DWORD)v67 - ((2 * (_DWORD)v67) & 0xCCF7A488) - 428092860) ^ *(_DWORD *)(v72
                                                                                          + 4
                                                                                          * (((v51 ^ v66) >> 16) ^ 0x16u));
  LODWORD(v65) = v51 ^ 0x626A2240;
  v113 = (char *)*(&off_24DE82D70 + v42 - 795) - 4;
  v114 = (char *)*(&off_24DE82D70 + v42 - 840) - 8;
  v115 = (char *)*(&off_24DE82D70 + v42 - 750) - 8;
  v116 = v115[*(unsigned __int8 *)(v46 - 109) ^ 0xA5];
  HIDWORD(v49) = v116 ^ 0x25;
  LODWORD(v49) = (v116 ^ 0x40) << 24;
  v117 = (char *)*(&off_24DE82D70 + v42 - 913) - 12;
  v221 = v115;
  v223 = v113;
  v220 = v117;
  v222 = v114;
  v118 = ((v115[*(unsigned __int8 *)(v46 - 101) ^ 0x60] ^ 0xAE) & 0xFFFF00FF | ((v114[*(unsigned __int8 *)(v46 - 103) ^ 5] ^ 0x1D) << 16) | (((v113[*(unsigned __int8 *)(v46 - 102) ^ 4] + (*(_BYTE *)(v46 - 102) ^ 0xB) - 98) ^ 0x33) << 8) | ((v117[*(unsigned __int8 *)(v46 - 104) ^ 0x1CLL] ^ 0xBD) << 24)) ^ 0x6AE44AF1;
  LODWORD(v66) = ((v115[*(unsigned __int8 *)(v46 - 105) ^ 0x28] ^ 0x6F) & 0xFFFF00FF | ((((*(_BYTE *)(v46 - 106) ^ 0xAC) + v113[*(unsigned __int8 *)(v46 - 106) ^ 0xA3] - 98) ^ 0xF6) << 8) | ((v117[*(unsigned __int8 *)(v46 - 108) ^ 0xB2] ^ 0x4A) << 24) | ((v114[*(unsigned __int8 *)(v46 - 107) ^ 0x27] ^ 0x79) << 16)) ^ 0x24C28C0F;
  LODWORD(v115) = ((v115[*(unsigned __int8 *)(v46 - 97) ^ 0x7BLL] ^ 0x1A) & 0xFFFF00FF | ((((*(_BYTE *)(v46 - 98) ^ 0xD0) + v113[*(unsigned __int8 *)(v46 - 98) ^ 0xDFLL] - 98) ^ 0xE4) << 8) | ((v114[*(unsigned __int8 *)(v46 - 99) ^ 0xAALL] ^ 0x2F) << 16) | ((v117[*(unsigned __int8 *)(v46 - 100) ^ 0x45] ^ 0x72) << 24)) ^ 0x8B7D9817;
  HIDWORD(v219) = v45 - 1610610039;
  LODWORD(v51) = (_DWORD)v67 - ((2 * (_DWORD)v67) & 0x45C09CAA) - 1562358187;
  v119 = (((((v49 >> 30) ^ 0xDB) >> 2) | (((v49 >> 30) ^ 0xDB) << 6)) | ((v114[*(unsigned __int8 *)(v46 - 111) ^ 0x7ALL] ^ 0x4C) << 16) | ((v117[*(unsigned __int8 *)(v46 - 112) ^ 0x78] ^ 0x48) << 24) | (((v113[*(unsigned __int8 *)(v46 - 110) ^ 0x5DLL] + (*(_BYTE *)(v46 - 110) ^ 0x52) - 98) ^ 0x5D) << 8)) ^ 0x268F0D5A;
  HIDWORD(v218) = (v42 + 911) ^ 0x7C9;
  HIDWORD(v217) = v111 ^ (v112 - 1562358187);
  LODWORD(v218) = (v42 + 911) ^ 0x7A8;
  LODWORD(v217) = (v42 + 911) ^ 0x77E;
  HIDWORD(v216) = (v42 + 911) ^ 0x751;
  LODWORD(v216) = (v42 + 911) ^ 0x7C3;
  *(_DWORD *)(v46 - 128) = v42 + 911;
  LODWORD(v225) = v111;
  LODWORD(v215) = v51 ^ v111;
  HIDWORD(v215) = (v42 + 911) ^ 0x701;
  LODWORD(v224) = v65;
  LODWORD(v219) = (v112 - 1562358187) ^ 0x3DC8BA5D ^ v51;
  HIDWORD(a11) = v219 ^ v65;
  *(_DWORD *)(v46 - 252) = -1498938414;
  *(_QWORD *)(v46 - 208) = 7;
  v120 = *(unsigned __int8 **)(v46 - 120);
  v121 = v120[7];
  v122 = (29 * ((v42 + 911) ^ 0x74C) - 1376) & 0xA6A803D2 ^ 0xA6A803DE;
  *(_QWORD *)(v46 - 168) = v122;
  v123 = v221[v121 ^ 0x41];
  v124 = v120[v122] ^ 0x60;
  *(_QWORD *)(v46 - 160) = 8;
  *(_QWORD *)(v46 - 136) = 1;
  LODWORD(v67) = v117[v124] ^ 0xC9;
  LODWORD(v122) = v117[v120[8] ^ 0xC1] ^ 0x7D;
  LODWORD(v124) = v114[v120[1] ^ 0x66] ^ 0xA0;
  *(_QWORD *)(v46 - 144) = 15;
  v125 = v120[15] ^ 0xE9;
  *(_QWORD *)(v46 - 176) = 11;
  v126 = (_DWORD)v124 << 16;
  LODWORD(v124) = v221[v125] ^ 0xB8;
  LODWORD(v125) = v124 | ((_DWORD)v67 << 24);
  LODWORD(v67) = v221[v120[11] ^ 0xC3];
  *(_QWORD *)(v46 - 184) = 0;
  v127 = v126 | ((v117[*v120 ^ 0x30] ^ 0xFFFFFFF9) << 24);
  LODWORD(v67) = v67 ^ 0x72;
  v128 = v67 | ((_DWORD)v122 << 24);
  *(_QWORD *)(v46 - 152) = 2;
  v129 = v127 & 0xFFFF00FF | (((v113[v120[2] ^ 0xC0] + (v120[2] ^ 0xCF) - 98) ^ 0xF9) << 8);
  *(_QWORD *)(v46 - 216) = 4;
  LODWORD(v122) = v117[v120[4] ^ 0xFCLL] ^ 0x47;
  v123 ^= 0x68u;
  *(_QWORD *)(v46 - 240) = 5;
  *(_QWORD *)(v46 - 224) = 9;
  *(_QWORD *)(v46 - 200) = 10;
  LODWORD(v47) = ((v114[v120[9] ^ 0x5DLL] ^ 0x73) << 16) | (((v113[v120[10] ^ 0xD5]
                                                                                              + (v120[10] ^ 0xDA)
                                                                                              - 98) ^ 0xCF) << 8) | v128;
  *(_QWORD *)(v46 - 192) = 14;
  LODWORD(v117) = (v113[v120[14] ^ 0xE4] + (v120[14] ^ 0xEB) + 30) << 8;
  *(_QWORD *)(v46 - 232) = 3;
  *(_QWORD *)(v46 - 248) = 13;
  LODWORD(v74) = v221[v120[3] ^ 0xDCLL] ^ 0xAC;
  LODWORD(v125) = v117 | ((v114[v120[13] ^ 0x92] ^ 0x4E) << 16) | v125;
  LODWORD(v122) = ((v114[v120[5] ^ 0xA9] ^ 0x9D) << 16) | (((v113[v120[6] ^ 0x4FLL]
                                                                                               + (v120[6] ^ 0x40)
                                                                                               - 98) ^ 0xB7) << 8) | v123 | ((_DWORD)v122 << 24);
  LODWORD(v122) = v122 - 2 * (v122 & 0x1D7B35BF ^ v123 & 9) - 1652869706;
  v130 = v119 ^ v245 ^ ((v74 | v129)
                      - 2 * ((v74 | v129) & 0x1F36B467 ^ v74 & 4)
                      - 1623804829);
  v131 = v66 ^ v246 ^ v122;
  LODWORD(v124) = v115 ^ v244 ^ (v125 + 851714478 - 2 * (v125 & 0x32C421AF ^ v124 & 1));
  v132 = v118 ^ v243 ^ ((_DWORD)v47 - 2 * (v47 & 0x535DF35D ^ v67 & 0x15) - 748817592);
  v133 = (char *)*(&off_24DE82D70 + SHIDWORD(v218)) - 12;
  v134 = (uint64_t)*(&off_24DE82D70 + *(_DWORD *)(v46 - 128) - 1840);
  LODWORD(v125) = *(_DWORD *)(v134 + 4 * (HIBYTE(v132) ^ 0x3F));
  HIDWORD(v49) = ~(_DWORD)v125;
  LODWORD(v49) = v125 ^ 0xBFCCB51E;
  LODWORD(v117) = (v49 >> 1) ^ ((BYTE2(v124) ^ 0x68) + 419867271 - ((v124 >> 15) & 0x10E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v124) ^ 0x34)];
  v135 = (char *)*(&off_24DE82D70 + (int)v218) - 8;
  v136 = *(_DWORD *)&v135[4 * (v132 ^ 0xC6)] ^ ((BYTE2(v130) ^ 0xD5)
                                                               + 419867271
                                                               - ((2 * (HIWORD(v130) ^ 0x6CD5)) & 0x10E)) ^ ((v132 ^ 0xAB) + 471049630 + ((2 * (v132 ^ 0xAB) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v133[4 * (BYTE2(v130) ^ 0x89)];
  v137 = *(_DWORD *)(v134 + 4 * (HIBYTE(v131) ^ 0xC8));
  HIDWORD(v49) = ~v137;
  LODWORD(v49) = v137 ^ 0xBFCCB51E;
  LODWORD(v125) = *(_DWORD *)&v133[4 * (BYTE2(v131) ^ 0x8C)] ^ *(_DWORD *)&v135[4 * (v124 ^ 0xB6)] ^ ((v124 ^ 0xDB) + 471049630 + ((2 * (v124 ^ 0xDB) + 254) & 0x23C ^ 0xFFD67BFF)) ^ ((BYTE2(v131) ^ 0xD0) + 419867271 - ((2 * (HIWORD(v131) ^ 0xC8D0)) & 0x10E));
  v138 = (char *)*(&off_24DE82D70 + *(_DWORD *)(v46 - 128) - 1778) - 12;
  LODWORD(v74) = (v136 - 1550805045 - ((2 * v136) & 0x47212F96)) ^ *(_DWORD *)&v138[4 * (BYTE1(v131) ^ 0x2F)];
  v139 = *(_DWORD *)(v134 + 4 * (HIBYTE(v130) ^ 0x6C));
  LODWORD(v122) = ((BYTE2(v132) ^ 0xAD) + 419867271 - ((2 * (HIWORD(v132) ^ 0x3FAD)) & 0x10E)) ^ *(_DWORD *)&v135[4 * (v130 ^ 0x1C)] ^ ((v130 ^ 0x71) + 471049630 + ((2 * (v130 ^ 0x71) + 254) & 0x23C ^ 0xFFD67BFF)) ^ (v49 >> 1) ^ *(_DWORD *)&v133[4 * (BYTE2(v132) ^ 0xF1)];
  HIDWORD(v49) = ~v139;
  LODWORD(v49) = v139 ^ 0xBFCCB51E;
  v140 = v49 >> 1;
  v141 = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0xB7));
  v142 = (v131 ^ 0x10) + 471049630 + ((2 * (v131 ^ 0x10) + 254) & 0x23C ^ 0xFFD67BFF);
  HIDWORD(v49) = ~v141;
  LODWORD(v49) = v141 ^ 0xBFCCB51E;
  v143 = *(_DWORD *)&v138[4 * (BYTE1(v130) ^ 0xDE)] ^ v240 ^ *(_DWORD *)&v135[4 * (v131 ^ 0x7D)] ^ ((_DWORD)v117 - 1550805045 - ((2 * (_DWORD)v117) & 0x47212F96));
  LODWORD(v117) = *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0x66)];
  LODWORD(v74) = (v74 ^ (v49 >> 1)) - ((2 * (v74 ^ (v49 >> 1))) & 0x58B78CC8);
  LODWORD(v67) = v143 ^ v142;
  LODWORD(v124) = *(_DWORD *)&v138[4 * (BYTE1(v132) ^ 0x29)] ^ v242 ^ v140 ^ (v125
                                                                            - 1550805045
                                                                            - ((2 * v125) & 0x47212F96));
  LODWORD(v122) = v117 ^ v241 ^ (v122 - 1550805045 - ((2 * v122) & 0x47212F96));
  v144 = *(_DWORD *)(v134 + 4 * ((v143 ^ ~v142) >> 24));
  HIDWORD(v49) = ~v144;
  LODWORD(v49) = v144 ^ 0xBFCCB51E;
  v145 = v49 >> 1;
  v146 = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0x91));
  HIDWORD(v49) = ~v146;
  LODWORD(v49) = v146 ^ 0xBFCCB51E;
  v147 = v49 >> 1;
  v148 = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0xA3));
  HIDWORD(v49) = ~v148;
  LODWORD(v49) = v148 ^ 0xBFCCB51E;
  v149 = v147 ^ *(_DWORD *)&v133[4 * (BYTE2(v122) ^ 0xF0)] ^ ((BYTE2(v122) ^ 0xAC)
                                                            + 419867271
                                                            - ((2 * (WORD1(v122) ^ 0xA3AC)) & 0x10E));
  LODWORD(v125) = *(_DWORD *)&v135[4 * (v124 ^ 0x7B)] ^ (v49 >> 1) ^ *(_DWORD *)&v133[4 * (BYTE2(v67) ^ 0x15)] ^ ((BYTE2(v67) ^ 0x49) + 419867271 - 2 * (((v67 >> 16) ^ 0xFF49) & 0x97 ^ (v67 >> 16) & 0x10)) ^ ((v124 ^ 0x16) + 471049629 - ((2 * (v124 ^ 0x16) + 4031742) & 0x29863C));
  LODWORD(v74) = ((_DWORD)v74 + 744212068) ^ HIDWORD(v239);
  v150 = (v149 - 1550805045 - ((2 * v149) & 0x47212F96)) ^ *(_DWORD *)&v138[4 * (BYTE1(v67) ^ 0x2C)];
  LODWORD(v117) = v145 ^ *(_DWORD *)&v135[4 * (v122 ^ 3)] ^ ((v122 ^ 0x6E)
                                                                            + 471049629
                                                                            - ((2 * (v122 ^ 0x6E)
                                                                              + 4031742) & 0x29863C)) ^ ((BYTE2(v74) ^ 0x62) + 419867271 - ((2 * ((v74 >> 16) ^ 0x4262)) & 0x10E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v74) ^ 0x3E)];
  v151 = *(_DWORD *)&v133[4 * (BYTE2(v124) ^ 0x2E)] ^ ((BYTE2(v124) ^ 0x72)
                                                     + 419867271
                                                     - ((2 * (WORD1(v124) ^ 0x9172)) & 0x10E));
  v152 = *(_DWORD *)(v134 + 4 * ((v74 >> 24) ^ 0x42));
  HIDWORD(v49) = ~v152;
  LODWORD(v49) = v152 ^ 0xBFCCB51E;
  LODWORD(v122) = ((v67 ^ 0xFC) + 471049629 - ((2 * (v67 ^ 0xFC) + 4031742) & 0x29863C)) ^ *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0xBD)] ^ *(_DWORD *)&v135[4 * (v67 ^ 0x91)] ^ (v151 - 1550805045 - ((2 * v151) & 0x47212F96));
  LODWORD(v67) = *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0x57)];
  LODWORD(v124) = ((v74 ^ 0x29) - 1726037377) ^ v239 ^ *(_DWORD *)&v135[4
                                                                                       * (v74 ^ 0x44)] ^ (v150 - 2097880290 - ((2 * v150) & 0x5E9C63C));
  LODWORD(v67) = v67 ^ HIDWORD(v236) ^ ((_DWORD)v117 - 1550805045 - ((2 * (_DWORD)v117) & 0x47212F96));
  LODWORD(v122) = ((v122 ^ (v49 >> 1)) - ((2 * (v122 ^ (v49 >> 1))) & 0x84653C64) - 1036870094) ^ v238;
  LODWORD(v117) = *(_DWORD *)&v138[4 * (BYTE1(v74) ^ 0x5D)] ^ HIDWORD(v238);
  LODWORD(v74) = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0x2F));
  LODWORD(v125) = v117 ^ (v125 - 1550805045 - ((2 * v125) & 0x47212F96));
  HIDWORD(v49) = ~(_DWORD)v74;
  LODWORD(v49) = v74 ^ 0xBFCCB51E;
  LODWORD(v74) = ((v125 ^ 0xA1)
                + 471049630
                + ((2 * (v125 ^ 0xA1) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v125 ^ 0xCC)];
  v153 = *(_DWORD *)&v133[4 * (BYTE2(v124) ^ 0xDB)] ^ ((BYTE2(v124) ^ 0x87)
                                                     + 419867271
                                                     - 2 * ((WORD1(v124) ^ 0x3A87) & 0x97 ^ WORD1(v124) & 0x10)) ^ (v49 >> 1);
  LODWORD(v117) = ((_DWORD)v74 - 1550805045 - ((2 * (_DWORD)v74) & 0x47212F96)) ^ *(_DWORD *)&v138[4
                                                                                                 * (BYTE1(v124) ^ 0xDE)];
  LODWORD(v74) = ((v124 ^ 0x9E)
                + 471049630
                + ((2 * (v124 ^ 0x9E) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v124 ^ 0xF3)];
  v154 = *(_DWORD *)(v134 + 4 * ((v67 >> 24) ^ 0x37));
  v155 = (v153 - 1550805045 - ((2 * v153) & 0x47212F96)) ^ *(_DWORD *)&v138[4 * (BYTE1(v125) ^ 0x57)];
  HIDWORD(v49) = ~v154;
  LODWORD(v49) = v154 ^ 0xBFCCB51E;
  v156 = v49 >> 1;
  LODWORD(v124) = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0x3A));
  HIDWORD(v49) = ~(_DWORD)v124;
  LODWORD(v49) = v124 ^ 0xBFCCB51E;
  LODWORD(v124) = *(_DWORD *)&v138[4 * ((unsigned __int16)((unsigned __int16)v67 ^ 0xBC3A) >> 8)] ^ BYTE2(v125) ^ *(_DWORD *)&v133[4 * (BYTE2(v125) ^ 0xF6)] ^ (v49 >> 1);
  LODWORD(v124) = ((v122 ^ 0x22) - 1726037377) ^ HIDWORD(v237) ^ *(_DWORD *)&v135[4
                                                                                                 * (v122 ^ 0x4F)] ^ ((v124 ^ 0xBA963DE6) - 2097880290 - 2 * ((v124 ^ 0xBA963DE6) & 0x2F4E31F ^ v124 & 1));
  LODWORD(v125) = *(_DWORD *)(v134 + 4 * (BYTE3(v125) ^ 0x7C));
  HIDWORD(v49) = ~(_DWORD)v125;
  LODWORD(v49) = v125 ^ 0xBFCCB51E;
  v157 = ((v67 ^ 0x3A) - 1726037377) ^ HIDWORD(v235) ^ *(_DWORD *)&v135[4
                                                                                       * (v67 ^ 0x57)] ^ (v155 - 2097880290 - ((2 * v155) & 0x5E9C63C));
  LODWORD(v117) = *(_DWORD *)&v133[4 * (BYTE2(v122) ^ 0xB4)] ^ v236 ^ BYTE2(v122) ^ v156 ^ ((_DWORD)v117
                                                                                          + 419867271
                                                                                          - ((2 * (_DWORD)v117) & 0x320D550E));
  LODWORD(v122) = *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0x7E)] ^ v237 ^ (((v67 ^ 0x740CBC3A) >> 16)
                                                                     + 419867271
                                                                     - (((v67 ^ 0x740CBC3A) >> 15) & 0x10E)) ^ *(_DWORD *)&v133[4 * (((v67 ^ 0x740CBC3A) >> 16) ^ 0x5C)] ^ (v49 >> 1) ^ ((_DWORD)v74 - 1550805045 - ((2 * (_DWORD)v74) & 0x47212F96));
  LODWORD(v67) = v117 ^ 0xFA64A52B;
  LODWORD(v125) = ((v117 ^ 0x2B)
                 + 471049630
                 + ((2 * (v117 ^ 0x2B) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v117 ^ 0x46)];
  LODWORD(v74) = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0x5B));
  HIDWORD(v49) = ~(_DWORD)v74;
  LODWORD(v49) = v74 ^ 0xBFCCB51E;
  v158 = (v49 >> 1) ^ *(_DWORD *)&v135[4 * (v157 ^ 0x1F)];
  LODWORD(v74) = *(_DWORD *)(v134 + 4 * (HIBYTE(v157) ^ 0x28));
  HIDWORD(v49) = ~(_DWORD)v74;
  LODWORD(v49) = v74 ^ 0xBFCCB51E;
  LODWORD(v74) = v49 >> 1;
  v159 = v158 ^ ((v157 ^ 0x72) + 471049629 - ((2 * (v157 ^ 0x72) + 4031742) & 0x29863C));
  LODWORD(v117) = *(_DWORD *)(v134 + 4 * ((v117 >> 24) ^ 0xB9));
  HIDWORD(v49) = ~(_DWORD)v117;
  LODWORD(v49) = v117 ^ 0xBFCCB51E;
  v160 = v49 >> 1;
  LODWORD(v117) = v159 - 1550805044 + ~((2 * v159) & 0x47212F96);
  v161 = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0xB4));
  HIDWORD(v49) = ~v161;
  LODWORD(v49) = v161 ^ 0xBFCCB51E;
  v162 = v160 ^ *(_DWORD *)&v135[4 * (v122 ^ 0x8B)] ^ ((v122 ^ 0xE6)
                                                                      + 471049630
                                                                      + ((2 * (v122 ^ 0xE6) + 254) & 0x23C ^ 0xFFD67BFF));
  v163 = (WORD1(v124) ^ 0x5B95) & 0x8F ^ WORD1(v124) & 8;
  v164 = BYTE2(v124) ^ 0x95;
  v165 = v124;
  v166 = (v124 ^ 0xF4) + 471049629 - ((2 * (v124 ^ 0xF4) + 4031742) & 0x29863C);
  v167 = ((BYTE2(v157) ^ 0x14) + 419867271 - ((2 * (HIWORD(v157) ^ 0x2814)) & 0x10E)) ^ v234 ^ *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0x1F)] ^ (v162 - 1550805045 - ((2 * v162) & 0x47212F96)) ^ *(_DWORD *)&v133[4 * (BYTE2(v157) ^ 0x48)];
  LODWORD(v124) = *(_DWORD *)&v138[4 * BYTE1(v67)] ^ v235 ^ ((BYTE2(v122) ^ 0x59)
                                                           + 419867271
                                                           - ((2 * (WORD1(v122) ^ 0xB459)) & 0x10E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v122) ^ 5)] ^ v117;
  v168 = (BYTE2(v67) + 419867271 - ((v67 >> 15) & 0x10E)) ^ HIDWORD(v234) ^ *(_DWORD *)&v135[4 * (v165 ^ 0x99)] ^ v166 ^ ((v49 >> 1) - 1550805044 + ~((2 * (v49 >> 1)) & 0x47212F96)) ^ *(_DWORD *)&v138[4 * (BYTE1(v157) ^ 0x12)] ^ *(_DWORD *)&v133[4 * (BYTE2(v67) ^ 0x5C)];
  LODWORD(v122) = *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0x34)] ^ HIDWORD(v233) ^ *(_DWORD *)&v133[4 * (v164 ^ 0x5C)] ^ (v164 + 419867271 - 2 * v163) ^ (v125 - 1550805045 - ((2 * v125) & 0x47212F96)) ^ v74;
  LODWORD(v67) = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0xEB));
  HIDWORD(v49) = ~(_DWORD)v67;
  LODWORD(v49) = v67 ^ 0xBFCCB51E;
  LODWORD(v67) = (v49 >> 1) - 1550805045 - ((2 * (v49 >> 1)) & 0x47212F96);
  LODWORD(v72) = ((BYTE2(v168) ^ 0x81) + 419867271 - 2 * ((HIWORD(v168) ^ 0x1481) & 0x97 ^ HIWORD(v168) & 0x10)) ^ *(_DWORD *)&v133[4 * (BYTE2(v168) ^ 0xDD)];
  v169 = ((v168 ^ 0x51) + 471049630 + ((2 * (v168 ^ 0x51) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v168 ^ 0x3C)];
  v170 = *(_DWORD *)&v133[4 * (BYTE2(v167) ^ 0xDB)] ^ ((BYTE2(v167) ^ 0x87)
                                                     + 419867271
                                                     - 2 * ((HIWORD(v167) ^ 0x7787) & 0x9F ^ HIWORD(v167) & 0x18));
  v171 = *(_DWORD *)(v134 + 4 * (HIBYTE(v168) ^ 0x14));
  HIDWORD(v49) = ~v171;
  LODWORD(v49) = v171 ^ 0xBFCCB51E;
  v172 = v49 >> 1;
  v173 = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0x9A));
  HIDWORD(v49) = ~v173;
  LODWORD(v49) = v173 ^ 0xBFCCB51E;
  LODWORD(v65) = *(_DWORD *)&v133[4 * (((v122 ^ 0xA87CE98B) >> 16) ^ 0x5C)] ^ ((v122 ^ 0xA87CE98B) >> 16) ^ (v169 + 419867271 - ((2 * v169) & 0x320D550E));
  LODWORD(v72) = *(_DWORD *)&v135[4 * (v122 ^ 0xE6)] ^ *(_DWORD *)&v138[4 * (BYTE1(v167) ^ 0xDE)] ^ ((v122 ^ 0x8B) + 471049630 + ((2 * (v122 ^ 0x8B) + 254) & 0x23C ^ 0xFFD67BFF)) ^ (v72 - 1550805045 - ((2 * v72) & 0x47212F96)) ^ (v49 >> 1);
  v174 = *(_DWORD *)(v134 + 4 * (HIBYTE(v167) ^ 0x77));
  HIDWORD(v49) = ~v174;
  LODWORD(v49) = v174 ^ 0xBFCCB51E;
  v175 = *(_DWORD *)&v138[4 * (BYTE1(v168) ^ 0x34)] ^ v232 ^ ((BYTE2(v124) ^ 0xE9)
                                                            + 419867271
                                                            - ((2 * (WORD1(v124) ^ 0x9AE9)) & 0x10E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v124) ^ 0xB5)] ^ v67 ^ ((v167 ^ 0x9E) + 471049630 + ((2 * (v167 ^ 0x9E) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v167 ^ 0xF3)];
  LODWORD(v125) = *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0xB)] ^ v231 ^ ((v124 ^ 0xA8)
                                                                    + 471049629
                                                                    - ((2 * (v124 ^ 0xA8) + 4031742) & 0x29863C)) ^ *(_DWORD *)&v135[4 * (v124 ^ 0xC5)] ^ v172 ^ (v170 - 1550805045 - ((2 * v170) & 0x47212F96));
  LODWORD(v124) = *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0x2D)] ^ HIDWORD(v232) ^ (v49 >> 1) ^ (v65
                                                                                           - 1550805045
                                                                                           - ((2 * v65) & 0x47212F96));
  BYTE1(v122) = BYTE1(v125) ^ 0x65;
  LODWORD(v117) = *(_DWORD *)(v134 + 4 * (BYTE3(v125) ^ 0x6D));
  HIDWORD(v49) = ~(_DWORD)v117;
  LODWORD(v49) = v117 ^ 0xBFCCB51E;
  LODWORD(v74) = v49 >> 1;
  LODWORD(v67) = (v72 - 404172580 - ((2 * v72) & 0xCFD1A1B8)) ^ v233;
  LODWORD(v117) = *(_DWORD *)(v134 + 4 * ((v67 >> 24) ^ 0xFD));
  LODWORD(v72) = *(_DWORD *)&v133[4 * (((v125 ^ 0x2E0E654A) >> 16) ^ 0x5C)] ^ (~(_DWORD)v117 << 31) ^ (v117 >> 1) ^ (((v125 ^ 0x2E0E654A) >> 16) + 419867271 - (((v125 ^ 0x2E0E654A) >> 15) & 0x10E)) ^ 0x5FE65A8F;
  LODWORD(v125) = ((v125 ^ 0x4A)
                 + 471049630
                 + ((2 * (v125 ^ 0x4A) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v125 ^ 0x27)];
  LODWORD(v65) = v125 - 1550805045 - ((2 * v125) & 0x47212F96);
  LODWORD(v125) = v72 - 1550805045 - ((2 * v72) & 0x47212F96);
  LODWORD(v72) = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0xAE));
  HIDWORD(v49) = ~(_DWORD)v72;
  LODWORD(v49) = v72 ^ 0xBFCCB51E;
  LODWORD(v72) = (v49 >> 1) ^ v65 ^ *(_DWORD *)&v138[4 * (BYTE1(v67) ^ 0xA4)];
  LODWORD(v117) = v72 + 419867271 - ((2 * v72) & 0x320D550E);
  LODWORD(v72) = *(_DWORD *)&v133[4 * (BYTE2(v124) ^ 0x3A)] ^ v74 ^ ((BYTE2(v124) ^ 0x66)
                                                                                 + 419867271
                                                                                 - ((2 * (WORD1(v124) ^ 0xAE66)) & 0x10E)) ^ *(_DWORD *)&v135[4 * (v67 ^ 0x4D)] ^ ((v67 ^ 0x20) + 471049629 - ((2 * (v67 ^ 0x20) + 4031742) & 0x29863C));
  LODWORD(v122) = ((v124 ^ 0xB3)
                 + 1018124875
                 + ((2 * (v124 ^ 0xB3) + 254) & 0x396 ^ 0xFDDEFBFF)) ^ *(_DWORD *)&v138[4 * BYTE1(v122)];
  LODWORD(v122) = (v122 - 2097880290 - ((2 * v122) & 0x5E9C63C)) ^ *(_DWORD *)&v135[4 * (v124 ^ 0xDE)];
  LODWORD(v67) = *(_DWORD *)&v133[4 * (BYTE2(v67) ^ 0x40)] ^ ((BYTE2(v67) ^ 0x1C)
                                                            + 419867271
                                                            - ((2 * ((v67 >> 16) ^ 0xFD1C)) & 0x10E));
  LODWORD(v122) = (v67 ^ 0xD9E215AF ^ -(v67 ^ 0xD9E215AF) ^ ((v67 ^ v122 ^ 0x431D28D3)
                                                                                       + (v122 ^ 0x6500C283)
                                                                                       + 1))
                + (v122 ^ 0x6500C283);
  LODWORD(v67) = *(_DWORD *)(v134 + 4 * ((v175 ^ 0x3F162902u) >> 24));
  HIDWORD(v49) = ~(_DWORD)v67;
  LODWORD(v49) = v67 ^ 0xBFCCB51E;
  v176 = ((v175 ^ 0x3F162902u) >> 16) ^ v230 ^ *(_DWORD *)&v133[4
                                                                                             * (((v175 ^ 0x3F162902u) >> 16) ^ 0x5C)] ^ v117;
  LODWORD(v67) = (v49 >> 1) ^ HIDWORD(v229) ^ v122;
  LODWORD(v122) = *(_DWORD *)&v138[4 * (BYTE1(v175) ^ 0xCB)] ^ HIDWORD(v230) ^ (v72
                                                                              - 1550805045
                                                                              - ((2 * v72) & 0x47212F96));
  v177 = *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0x7C)] ^ HIDWORD(v231) ^ ((v175 ^ 2)
                                                                     + 471049630
                                                                     + ((2 * (v175 ^ 2) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * (v175 ^ 0x6F)] ^ v125;
  LODWORD(v124) = ((BYTE2(v177) ^ 0xE9) + 419867271 - ((2 * (HIWORD(v177) ^ 0xB8E9)) & 0x10E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v177) ^ 0xB5)];
  LODWORD(v125) = v124 - 1550805045 - ((2 * v124) & 0x47212F96);
  v178 = *(_DWORD *)(v134 + 4 * (HIBYTE(v176) ^ 0x9D));
  HIDWORD(v49) = ~v178;
  LODWORD(v49) = v178 ^ 0xBFCCB51E;
  v179 = v49 >> 1;
  v180 = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0x61));
  HIDWORD(v49) = ~v180;
  LODWORD(v49) = v180 ^ 0xBFCCB51E;
  LODWORD(v72) = *(_DWORD *)&v135[4 * (v177 ^ 0xC5)] ^ *(_DWORD *)&v133[4 * (BYTE2(v176) ^ 0x28)] ^ ((v177 ^ 0xA8) + 471049629 - ((2 * (v177 ^ 0xA8) + 4031742) & 0x29863C)) ^ ((BYTE2(v176) ^ 0x74) + 419867271 - ((2 * (HIWORD(v176) ^ 0x9D74)) & 0x10E)) ^ (v49 >> 1);
  LODWORD(v65) = v179 ^ ((BYTE2(v67) ^ 0xE6)
                       + 419867271
                       - 2 * (((v67 >> 16) ^ 0xB0E6) & 0x8F ^ (v67 >> 16) & 8)) ^ *(_DWORD *)&v133[4 * (BYTE2(v67) ^ 0xBA)];
  LODWORD(v117) = v176;
  v181 = (v176 ^ 0xD9) + 471049630 + ((2 * (v176 ^ 0xD9) + 254) & 0x23C ^ 0xFFD67BFF);
  v182 = *(_DWORD *)(v134 + 4 * (HIBYTE(v177) ^ 0xB8));
  HIDWORD(v49) = ~v182;
  LODWORD(v49) = v182 ^ 0xBFCCB51E;
  v183 = v122;
  v184 = (v122 ^ 0x85) + 471049630 + ((2 * (v122 ^ 0x85) + 254) & 0x23C ^ 0xFFD67BFF);
  LODWORD(v74) = ((BYTE2(v122) ^ 8) + 419867271 - ((v122 >> 15) & 0x10E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v122) ^ 0x54)] ^ *(_DWORD *)&v135[4 * (v67 ^ 0x29)] ^ ((v67 ^ 0x44) + 471049629 - ((2 * (v67 ^ 0x44) + 4031742) & 0x29863C)) ^ (v49 >> 1);
  LODWORD(v124) = *(_DWORD *)&v138[4 * (BYTE1(v67) ^ 0xDD)] ^ HIDWORD(v228) ^ (v72
                                                                             - 1550805045
                                                                             - ((2 * v72) & 0x47212F96));
  LODWORD(v67) = *(_DWORD *)(v134 + 4 * ((v67 >> 24) ^ 0xB0));
  HIDWORD(v49) = ~(_DWORD)v67;
  LODWORD(v49) = v67 ^ 0xBFCCB51E;
  v185 = *(_DWORD *)&v138[4 * (BYTE1(v176) ^ 0xBD)] ^ v229 ^ ((_DWORD)v74 - 1550805045 - ((2 * (_DWORD)v74) & 0x47212F96));
  LODWORD(v122) = *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0x8F)] ^ HIDWORD(v227) ^ *(_DWORD *)&v135[4
                                                                                              * (v117 ^ 0xB4)] ^ v181 ^ (v49 >> 1) ^ v125;
  LODWORD(v67) = v184 ^ v228 ^ *(_DWORD *)&v135[4 * (v183 ^ 0xE8)] ^ *(_DWORD *)&v138[4 * (BYTE1(v177) ^ 0x2D)] ^ (v65 - 1550805045 - ((2 * v65) & 0x47212F96));
  LODWORD(v72) = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0x18));
  LODWORD(v65) = ((BYTE2(v67) ^ 0x66)
                + 419867271
                - 2 * (((v67 >> 16) ^ 0xAE66) & 0x8F ^ (v67 >> 16) & 8)) ^ *(_DWORD *)&v133[4 * (BYTE2(v67) ^ 0x3A)];
  HIDWORD(v49) = ~(_DWORD)v72;
  LODWORD(v49) = v72 ^ 0xBFCCB51E;
  LODWORD(v74) = ((v49 >> 1) + 419867271 - ((2 * (v49 >> 1)) & 0x320D550E)) ^ *(_DWORD *)&v133[4 * (BYTE2(v185) ^ 0x40)];
  v186 = *(_DWORD *)(v134 + 4 * (HIBYTE(v185) ^ 0xEF));
  HIDWORD(v49) = ~v186;
  LODWORD(v49) = v186 ^ 0xBFCCB51E;
  LODWORD(v72) = (v49 >> 1) ^ *(_DWORD *)&v135[4 * (v122 ^ 0x90)] ^ ((v122 ^ 0xFD)
                                                                                    + 471049630
                                                                                    + ((2
                                                                                      * (v122 ^ 0xFD)
                                                                                      + 254) & 0x23C ^ 0xFFD67BFF));
  LODWORD(v117) = v65 - 1550805045 - ((2 * v65) & 0x47212F96);
  LODWORD(v65) = *(_DWORD *)&v135[4 * (v124 ^ 0x27)] ^ ((v124 ^ 0x4A)
                                                                       + 471049630
                                                                       + ((2 * (v124 ^ 0x4A) + 254) & 0x23C ^ 0xFFD67BFF));
  v187 = *(_DWORD *)(v134 + 4 * ((v67 >> 24) ^ 0xAE));
  HIDWORD(v49) = ~v187;
  LODWORD(v49) = v187 ^ 0xBFCCB51E;
  LODWORD(v65) = (v49 >> 1) ^ *(_DWORD *)&v133[4 * (BYTE2(v122) ^ 0xF)] ^ (v65 + 419867271 - ((2 * v65) & 0x320D550E));
  v188 = *(_DWORD *)(v134 + 4 * (BYTE3(v124) ^ 0xDC));
  HIDWORD(v49) = ~v188;
  LODWORD(v49) = v188 ^ 0xBFCCB51E;
  v189 = ((BYTE2(v124) ^ 0xE) + 419867271 - ((2 * (WORD1(v124) ^ 0xDC0E)) & 0x10E)) ^ v227 ^ *(_DWORD *)&v138[4 * (BYTE1(v67) ^ 0x7C)] ^ *(_DWORD *)&v133[4 * (BYTE2(v124) ^ 0x52)] ^ (v72 - 1550805045 - ((2 * v72) & 0x47212F96));
  v190 = v67;
  v191 = (v67 ^ 0xB3) + 471049630 + ((2 * (v67 ^ 0xB3) + 254) & 0x23C ^ 0xFFD67BFF);
  LODWORD(v67) = *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0x1B)] ^ HIDWORD(v226) ^ *(_DWORD *)&v135[4
                                                                                             * (v185 ^ 0x4D)] ^ ((v185 ^ 0x20) + 471049630 + ((2 * (v185 ^ 0x20) + 254) & 0x23C ^ 0xFFD67BFF)) ^ (v49 >> 1) ^ v117;
  LODWORD(v72) = WORD1(v122);
  LODWORD(v124) = ((_DWORD)v74 - 1550805045 - ((2 * (_DWORD)v74) & 0x47212F96)) ^ HIDWORD(v225) ^ v191 ^ *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0x65)] ^ *(_DWORD *)&v135[4 * (v190 ^ 0xDE)];
  LODWORD(v125) = v124 ^ BYTE2(v185);
  LODWORD(v122) = *(_DWORD *)&v138[4 * (BYTE1(v185) ^ 0xA4)] ^ v226 ^ (v65 - 1550805045 - ((2 * v65) & 0x47212F96));
  LODWORD(v117) = *(_DWORD *)(v134 + 4 * ((v125 ^ 0x7641388B) >> 24));
  HIDWORD(v49) = ~(_DWORD)v117;
  LODWORD(v49) = v117 ^ 0xBFCCB51E;
  v192 = v49 >> 1;
  LODWORD(v117) = *(_DWORD *)(v134 + 4 * ((v189 ^ 0xF7E9CFA8) >> 24));
  HIDWORD(v49) = ~(_DWORD)v117;
  LODWORD(v49) = v117 ^ 0xBFCCB51E;
  v193 = v49 >> 1;
  v194 = (((v125 ^ 0x7641388B) >> 16)
        + 419867271
        - (((v125 ^ 0x7641388B) >> 15) & 0x10E)) ^ *(_DWORD *)&v133[4
                                                                                * (((v125 ^ 0x7641388B) >> 16) ^ 0x5C)];
  LODWORD(v74) = *(_DWORD *)(v134 + 4 * (BYTE3(v122) ^ 0xE7));
  HIDWORD(v49) = ~(_DWORD)v74;
  LODWORD(v49) = v74 ^ 0xBFCCB51E;
  LODWORD(v74) = v49 >> 1;
  LODWORD(v72) = v192 ^ *(_DWORD *)&v135[4 * ((v122 ^ v72) ^ 0x18)] ^ (((v189 ^ 0xF7E9CFA8) >> 16)
                                                                                      + 419867271
                                                                                      - (((v189 ^ 0xF7E9CFA8) >> 15) & 0x10E)) ^ *(_DWORD *)&v133[4 * (((v189 ^ 0xF7E9CFA8) >> 16) ^ 0x5C)] ^ (((v122 ^ v72) ^ 0x75) + 471049630 + ((2 * ((v122 ^ v72) ^ 0x75) + 254) & 0x23C ^ 0xFFD67BFF));
  LODWORD(v72) = (v72 - 1550805045 - ((2 * v72) & 0x47212F96)) ^ *(_DWORD *)&v138[4 * (BYTE1(v67) ^ 0xEC)];
  LODWORD(v134) = *(_DWORD *)(v134 + 4 * ((v67 >> 24) ^ 0x57));
  HIDWORD(v49) = ~(_DWORD)v134;
  LODWORD(v49) = v134 ^ 0xBFCCB51E;
  LODWORD(v125) = v193 ^ *(_DWORD *)&v133[4 * (BYTE2(v67) ^ 0xA7)] ^ ((BYTE2(v67) ^ 0xFB)
                                                                    + 419867271
                                                                    - ((2 * ((v67 >> 16) ^ 0x57FB)) & 0x10E)) ^ ((v125 ^ 0x8B) + 471049630 + ((2 * (v125 ^ 0x8B) + 254) & 0x23C ^ 0xFFD67BFF)) ^ *(_DWORD *)&v135[4 * ((v124 ^ BYTE2(v185)) ^ 0xE6)];
  LODWORD(v125) = (v125 - 1550805045 - ((2 * v125) & 0x47212F96)) ^ *(_DWORD *)&v138[4 * (BYTE1(v122) ^ 0x6D)];
  LODWORD(v122) = WORD1(v122);
  LODWORD(v122) = ((v189 ^ 0xA8)
                 + 471049629
                 - ((2 * (v189 ^ 0xA8) + 4031742) & 0x29863C)) ^ ((v122 ^ 0x31)
                                                                                 + 419867271
                                                                                 - 2
                                                                                 * ((v122 ^ 0xE731) & 0x8F ^ v122 & 8)) ^ *(_DWORD *)&v135[4 * (v189 ^ 0xC5)] ^ *(_DWORD *)&v133[4 * (v122 ^ 0x6D)] ^ (v49 >> 1);
  LODWORD(v124) = HIDWORD(v217) ^ *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0xDA)] ^ (v122
                                                                              - 1550805045
                                                                              - ((2 * v122) & 0x47212F96));
  LODWORD(v122) = (v125 - 1562358187 - ((2 * v125) & 0x45C09CAA)) ^ v225;
  LODWORD(v134) = (v72 + 2143225514 - ((2 * v72) & 0xFF7E0D54)) ^ HIDWORD(v224);
  LODWORD(v135) = *(_DWORD *)&v138[4 * (BYTE1(v189) ^ 0x2D)] ^ v224 ^ ((v67 ^ 0x2F)
                                                                     + 471049630
                                                                     + ((2 * (v67 ^ 0x2F) + 254) & 0x23C ^ 0xFFD67BFF)) ^ v74 ^ *(_DWORD *)&v135[4 * (v67 ^ 0x42)] ^ (v194 - 1550805045 - ((2 * v194) & 0x47212F96));
  BYTE2(v67) = BYTE2(v124) ^ 0x8C;
  v195 = v134 ^ 0x351D74B9;
  v196 = (uint64_t)*(&off_24DE82D70 + SHIDWORD(v216));
  v197 = (uint64_t)*(&off_24DE82D70 + (int)v216);
  LODWORD(v117) = *(_DWORD *)(v196 + 4 * (((v125 + 85 - ((2 * v125) & 0xAA)) ^ v225) ^ 0xA2u));
  v198 = (uint64_t)*(&off_24DE82D70 + SHIDWORD(v215));
  LODWORD(v72) = (*(_DWORD *)(v198 + 4 * (BYTE2(v122) ^ 0x9Eu)) - 242435676) ^ (*(_DWORD *)(v196
                                                                                            + 4
                                                                                            * (v135 ^ 0xC9u))
                                                                                + 1446293387);
  v199 = *(_QWORD *)(v46 - 120);
  v200 = *(_DWORD *)(v196 + 4 * (v124 ^ 0xC8u));
  LODWORD(v125) = *(_DWORD *)(v196 + 4 * (v134 ^ 0xB9u));
  LODWORD(v196) = *(_DWORD *)(v197 + 4 * (BYTE3(v122) ^ 0xE7));
  v201 = *(_DWORD *)(v197 + 4 * ((v135 >> 24) ^ 0xB8));
  LODWORD(v117) = (*(_DWORD *)(v198 + 4 * (BYTE2(v135) ^ 0x38u)) - 242435676) ^ (*(_DWORD *)(v197
                                                                                             + 4
                                                                                             * ((v124 ^ 0x898C5DC8) >> 24))
                                                                                 - 1203870942) ^ ((_DWORD)v117
                                                                                                + 1446293387);
  LODWORD(v134) = *(_DWORD *)(v197 + 4 * (BYTE3(v134) ^ 0x65));
  v202 = (char *)*(&off_24DE82D70 + (int)v217) - 8;
  LODWORD(v124) = *(_DWORD *)&v202[4 * (BYTE1(v124) ^ 0x61)] ^ (v134 - 1203870942);
  LODWORD(v134) = BYTE1(v135);
  LODWORD(v135) = *(_DWORD *)&v202[4 * (BYTE1(v122) ^ 0xA0)];
  v203 = *(unsigned int *)&v202[4 * (v134 ^ 0xE9)];
  LODWORD(v138) = *(_DWORD *)(v198 + 4 * BYTE2(v67));
  LODWORD(v124) = (v72 - 1621216954 - ((2 * v72) & 0x3EBC628C)) ^ v124;
  LODWORD(v72) = *(_DWORD *)(v198 + 4 * BYTE2(v195));
  v204 = *(_DWORD *)&v202[4 * BYTE1(v195)] ^ v219 ^ ((_DWORD)v117 - 1621216954 - ((2 * (_DWORD)v117) & 0x3EBC628C));
  LODWORD(v134) = HIDWORD(a11) ^ HIDWORD(v224) ^ (v124 + 2143225514 - ((2 * v124) & 0xFF7E0D54));
  v205 = *(_DWORD *)(v46 - 128);
  v206 = (uint64_t)*(&off_24DE82D70 + v205 - 1868);
  *(_BYTE *)(v199 + 6) = *(_BYTE *)(v206 + (BYTE1(v204) ^ 0x99)) ^ 0x66;
  v207 = (char *)*(&off_24DE82D70 + v205 - 1660) - 8;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 248)) = (v207[BYTE2(v134) ^ 0xADLL] + 52) ^ 0xC5;
  LODWORD(v124) = v135 ^ HIDWORD(a11) ^ (v200 - ((2 * v200 + 745103126) & 0x3EBC628C) - 174923567) ^ (v201 - 1203870942) ^ (v72 - 242435676);
  v208 = (uint64_t)*(&off_24DE82D70 + v205 - 1872);
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 208)) = *(_BYTE *)(v208 + (v204 ^ 0xFCLL)) ^ 0x64;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 224)) = (v207[BYTE2(v124) ^ 0x8CLL] + 52) ^ 0x47;
  v209 = (uint64_t)*(&off_24DE82D70 + v205 - 1757);
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 216)) = (*(_BYTE *)(v209 + (HIBYTE(v204) ^ 0xDELL)) - 30) ^ 0x1B;
  LODWORD(v202) = v207[BYTE2(v204) ^ 0x15];
  v210 = ((_DWORD)v202 + 52) ^ 0xDAu;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 240)) = (((_BYTE)v202 + (((_BYTE)v202 + 52) ^ 0xDA) + 53) ^ 0xFE)
                                            + (_BYTE)v202
                                            + 52;
  v211 = v215 ^ v203;
  LODWORD(v125) = v211 ^ ((_DWORD)v138 - 242435676) ^ (v125 + 1446293387) ^ (v196
                                                                           + 1469879401
                                                                           + ~((2 * v196 + 813483588) & 0x3EBC628C));
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 232)) = *(_BYTE *)(v208 + (v125 ^ 5)) ^ 0x96;
  v212 = *(_QWORD *)(v46 - 160);
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 168)) = (*(_BYTE *)(v209 + (BYTE3(v134) ^ 0x4ELL)) - 30) ^ 0xE6;
  *(_BYTE *)(v199 + v212) = (*(_BYTE *)(v209 + (BYTE3(v124) ^ 0x9CLL)) - 30) ^ 0xB8;
  v213 = *(_QWORD *)(v46 - 184);
  *(_BYTE *)(v199 + v213) = (*(_BYTE *)(v209 + (BYTE3(v125) ^ 0x67)) - 30) ^ 0x91;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 176)) = *(_BYTE *)(v208 + (v124 ^ 0xF2)) ^ 0x9C;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 200)) = *(_BYTE *)(v206 + (BYTE1(v124) ^ 0x1ELL)) ^ 0xC5;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 152)) = *(_BYTE *)(v206 + (BYTE1(v125) ^ 0x33)) ^ 0xDC;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 192)) = *(_BYTE *)(v206 + (BYTE1(v134) ^ 0xBCLL)) ^ 0x12;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 144)) = *(_BYTE *)(v208 + (v134 ^ 0x9FLL)) ^ 0x64;
  *(_BYTE *)(v199 + *(_QWORD *)(v46 - 136)) = (v207[BYTE2(v125) ^ 0xDLL] + 52) ^ 0x8E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a42 + 8 * (((((_DWORD)v213 - 1498938398 - 2 * (((_DWORD)v213 + 16) & 0x26A803D6 ^ *(_DWORD *)(v46 - 252) & 4)) ^ 0xA6A803D2) < HIDWORD(v219)) | (v205 - 555))) - 12))(v208, 242, 188, v213, v211, v203, &off_24DE82D70, v210, a9, a10, a11, v215, v216, v217, v218, v219, v220, v221, v222,
           v223,
           v224,
           v225,
           v226,
           v227,
           v228,
           v229,
           v230,
           v231,
           v232,
           v233,
           v234,
           v235,
           v236,
           v237,
           v238,
           v239);
}

void sub_21B50BF54()
{
  JUMPOUT(0x21B509D48);
}

uint64_t sub_21B50BF88(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8 * (((((a7 ^ (v7 == a4)) & 1) == 0) * (a7 ^ 0x14C)) ^ a7)))();
}

uint64_t sub_21B50BFB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  int v8;
  char v9;
  uint64_t v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v10
                                                                                                 + 8
                                                                                                 * (((a8 & ~(((a7 ^ 0x190) + 1488) ^ ((v9 & 8) == 0))) * ((a7 ^ 0x190) + 517)) ^ a7 ^ 0x190))
                                                                                     - 12))(a1, a2, a3, a4, (v8 - a4), (a7 ^ 0x190u) + 1399);
}

uint64_t sub_21B50BFF0(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  int v46;
  char v47;
  int v48;
  int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int8x16x4_t v56;

  *(_DWORD *)(v50 - 128) = v49;
  *(_DWORD *)(v50 - 136) = v46;
  v51 = ((v48 - 14) ^ 0xFFFFF856) & v46;
  v52 = *(_QWORD *)(v50 - 120) - 7;
  v53 = -a4;
  *(_DWORD *)(v50 - 144) = v51;
  v54 = (v53 + a3 + a2 + a1);
  v56.val[0].i64[0] = ((_BYTE)v53 + (_BYTE)a3 + (_BYTE)a2 + (_BYTE)a1) & 0xF;
  v56.val[0].i64[1] = ((_BYTE)v53 + v47 + (_BYTE)a3 + (_BYTE)a2 - 78) & 0xF;
  v56.val[1].i64[0] = ((_BYTE)v53 + v47 + (_BYTE)a3 + (_BYTE)a2 - 79) & 0xF;
  v56.val[1].i64[1] = ((_BYTE)v53 + v47 + (_BYTE)a3 + (_BYTE)a2 - 80) & 0xF;
  v56.val[2].i64[0] = ((_BYTE)v53 + v47 + (_BYTE)a3 + (_BYTE)a2 - 81) & 0xF;
  v56.val[2].i64[1] = ((_BYTE)v53 + v47 + (_BYTE)a3 + (_BYTE)a2 - 82) & 0xF;
  v56.val[3].i64[0] = ((_BYTE)v53 + v45) & 0xF;
  v56.val[3].i64[1] = ((_BYTE)v53 + (_BYTE)a3 + (_BYTE)a2 + (_BYTE)v48 + v47) & 0xF;
  *(int8x8_t *)(v52 + v54) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v42 + (v54 & 0xF) - 7), *(int8x8_t *)(v52 + v54)), veor_s8(*(int8x8_t *)((v54 & 0xF) + v43 - 5), *(int8x8_t *)((v54 & 0xF) + v44 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v56, (int8x16_t)xmmword_21B567BE0), (int8x8_t)0x7777777777777777)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a42
                                                     + 8
                                                     * (((2 * (v53 != 8 - v51)) | (16 * (v53 != 8 - v51))) ^ (v48 - 14)))
                                         - 4))((__n128)xmmword_21B567BE0);
}

void sub_21B50C128()
{
  JUMPOUT(0x21B50C05CLL);
}

uint64_t sub_21B50C150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W8>)
{
  uint64_t v6;
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6
                                                                                        + 8
                                                                                        * (((a6 ^ 0x1CB)
                                                                                          * (*(_DWORD *)(v7 - 136) != *(_DWORD *)(v7 - 144))) ^ a6)))(a1, a2, a3, a4, a5, a6 ^ 0x71Fu);
}

uint64_t sub_21B50C188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_BYTE *)(*(_QWORD *)(v12 - 120) + (a5 + v8)) ^= *(_BYTE *)(v7 + ((a5 + v8) & 0xFLL)) ^ *(_BYTE *)((((_BYTE)a5 + (_BYTE)v8) & 0xF) + v9 + 2) ^ *(_BYTE *)((((_BYTE)a5 + (_BYTE)v8) & 0xF) + v10 + 4) ^ (119 * ((a5 + v8) & 0xF));
  return (*(uint64_t (**)(void))(v11 + 8 * ((116 * (a5 - 1 == v6)) | (a6 - 1883))))();
}

void sub_21B50C1EC()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 482001478)
    v1 = -611232798;
  else
    v1 = 611190842;
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_21B50C250(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X14 }
}

uint64_t sub_21B50C360()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  v4 = (v1 ^ (v2 + 1321317723) & 0xB13E45FF ^ 0xD0A2C569) + v2 + 1 + 1879037252 + ((2 * v1) & 0xBFDA7F76 ^ v0) == 1340939160;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((16 * v4) | (v4 << 6)) ^ v2)) - 12))();
}

uint64_t sub_21B50C3D8(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((((v3 - 1680) | 0x482) - 1103) * ((a2 + a3 + 538099781) > 7)) ^ v3))
                            - 8))();
}

uint64_t sub_21B50C44C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (int)(((a4 + ((a7 - 394161312) & 0x177E6B75u) + v7 + 185 < 0xFFFFFFF0)
                                               * (((a7 + 936948131) & 0xC8274DFB) - 958)) ^ a7))
                            - 4))();
}

uint64_t sub_21B50C4AC(uint64_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v18;
  unint64_t v19;
  int v21;

  v12 = (a4 + a2 + a3 + 1066) + v10;
  v13 = ((_BYTE)a4 + (_BYTE)a2 + (_BYTE)a3 + 42) & 0xF;
  v14 = v13 - v12;
  v15 = (v7 | v13) - v12;
  v16 = (v8 | v13) - v12;
  v18 = (unint64_t)(v6 - v10) >= 0x10
     && (unint64_t)(v14 + v9) >= 0x10
     && (unint64_t)(v15 + 4) >= 0x10;
  v19 = v16 + 3;
  v21 = !v18 || v19 < ((67 * (a6 ^ 0x37B)) ^ 0xFFFFFFFFFFFFFD28) + (a6 ^ 0x74B);
  return (*(uint64_t (**)(void))(v11 + 8 * ((226 * v21) ^ a6)))();
}

uint64_t sub_21B50C538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v6;
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v8
                                                                                                 + 8
                                                                                                 * ((((v7 ^ 0x555) - 464) * (v6 < 0x10)) ^ v7)))(a1, a2, a3, a4, a5, a6, (v7 ^ 0x555u) - 500);
}

uint64_t sub_21B50C564(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  int8x16_t v69;
  uint64_t v70;
  int8x16_t v71;
  int8x16_t v72;
  int8x16x4_t v74;
  int8x16x4_t v75;

  v65 = 6 * (a8 ^ 0x30C);
  v66 = v60 & 0xFFFFFFF0;
  v67 = v63;
  *(_DWORD *)(v64 - 128) = a5 + 13;
  *(_DWORD *)(v64 - 140) = a5 + 12;
  *(_DWORD *)(v64 - 136) = a5 + 10;
  *(_DWORD *)(v64 - 148) = a5 + 8;
  *(_DWORD *)(v64 - 144) = a5 + 9;
  *(_QWORD *)(v64 - 160) = ((_BYTE)a5 + 6 * (a8 ^ 0xC) - 123) & 0xF;
  *(_QWORD *)(v64 - 168) = ((_BYTE)a5 + 14) & 0xF;
  v74.val[1].i64[0] = ((_BYTE)a5 + 5) & 0xF;
  v74.val[1].i64[1] = ((_BYTE)a5 + 4) & 0xF;
  v74.val[2].i64[0] = ((_BYTE)a5 + 3) & 0xF;
  v74.val[2].i64[1] = ((_BYTE)a5 + 2) & 0xF;
  v74.val[3].i64[0] = ((_BYTE)a5 + 1) & 0xF;
  v74.val[3].i64[1] = a5 & 0xF;
  v68 = v62 + a2 + a4 + a3 - v61;
  v69.i64[0] = 0x5959595959595959;
  v69.i64[1] = 0x5959595959595959;
  v70 = (((v65 - 640) | 0xA5) - 416) & v68;
  v74.val[0].i64[0] = v70;
  v74.val[0].i64[1] = ((_BYTE)a5 + 6) & 0xF;
  v71.i64[0] = vqtbl4q_s8(v74, (int8x16_t)xmmword_21B567BD0).u64[0];
  v75.val[0].i64[1] = *(_QWORD *)(v64 - 168);
  v75.val[1].i64[1] = *(_DWORD *)(v64 - 140) & 0xF;
  v75.val[2].i64[1] = *(_DWORD *)(v64 - 136) & 0xF;
  v75.val[3].i64[1] = *(_DWORD *)(v64 - 148) & 0xF;
  v75.val[0].i64[0] = *(_QWORD *)(v64 - 160);
  v75.val[1].i64[0] = *(_DWORD *)(v64 - 128) & 0xF;
  v75.val[2].i64[0] = ((_BYTE)a5 + 11) & 0xF;
  v75.val[3].i64[0] = *(_DWORD *)(v64 - 144) & 0xF;
  v71.i64[1] = vqtbl4q_s8(v75, (int8x16_t)xmmword_21B567BD0).u64[0];
  v72 = vrev64q_s8(vmulq_s8(v71, v69));
  *(int8x16_t *)(v67 - 15 + v68) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v59 + v70 - 15), *(int8x16_t *)(v56 - 15 + v68)), veorq_s8(*(int8x16_t *)(v70 + v57 - 11), *(int8x16_t *)(v70 + v58 - 12))), vextq_s8(v72, v72, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a56 + 8 * ((v66 != 16) | (16 * (v66 != 16)) | v65)) - 12))();
}

void sub_21B50C70C()
{
  JUMPOUT(0x21B50C68CLL);
}

uint64_t sub_21B50C718()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v0 & 0x43D9AF73 | (63 * (v1 != 0xF4FFB21)))) - 8))();
}

uint64_t sub_21B50C76C()
{
  uint64_t v0;
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  *(_BYTE *)(v6 + (v5 - 296806364)) = *(_BYTE *)(*(_QWORD *)(v7 + 8 * (v1 ^ 0x6D4))
                                                             + (((_BYTE)v5 + 36) & 0xF)
                                                             - 12) ^ *(_BYTE *)(v0 + (v5 - 296806364)) ^ (23 * ((v5 + 36) & 0xF)) ^ *(_BYTE *)(*(_QWORD *)(v7 + 8 * (int)(v1 - 1408)) + (((_BYTE)v5 + 36) & 0xF) - 4) ^ *(_BYTE *)(*(_QWORD *)(v7 + 8 * (v1 ^ 0x627)) + ((v5 - 296806364) & 0xFLL) - 11);
  v9 = v2 > 0x12DAE3E3;
  if (v9 == v5 - 613141439 < v3)
    v9 = v5 - 613141439 < v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((63 * v9) | v1)) - 8))();
}

uint64_t sub_21B50C828@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((26 * (((a1 == v3) ^ (v1 + 56)) & 1)) ^ v1)))();
}

uint64_t sub_21B50C868@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((758 * (((v1 - 64) ^ ((((v1 - 189) ^ 0x422) & a1) == 0)) & 1)) ^ v1))
                            - 4))();
}

uint64_t sub_21B50C8A8(char a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  unsigned int v66;
  int v67;
  char v68;
  unsigned int v69;
  int8x16x4_t v71;

  *(_DWORD *)(v65 - 140) = v60;
  v66 = v60 & 0xFFFFFFF8;
  *(_QWORD *)(v65 - 128) = v56 - 7;
  *(_QWORD *)(v65 - 136) = v63 - 7;
  *(_DWORD *)(v65 - 144) = v66;
  v67 = v62 + a2 + a3;
  v68 = a1 + v67 - v64 - v61;
  v69 = v67 + a4 - v64 - v61;
  v71.val[0].i64[0] = v69 & 0xF;
  v71.val[0].i64[1] = (v68 + 117) & 0xF;
  v71.val[1].i64[0] = (v68 + 116) & 0xF;
  v71.val[1].i64[1] = (v68 + 111 + (((a7 - 3) | 0x43) ^ 3)) & 0xF;
  v71.val[2].i64[0] = (v68 + 114) & 0xF;
  v71.val[2].i64[1] = (v68 + 113) & 0xF;
  v71.val[3].i64[0] = (v68 + 112) & 0xF;
  v71.val[3].i64[1] = (v68 + 111) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v65 - 136) + v69) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v59 + v71.val[0].i64[0] - 7), *(int8x8_t *)(*(_QWORD *)(v65 - 128) + v69)), veor_s8(*(int8x8_t *)(v71.val[0].i64[0] + v57 - 3), *(int8x8_t *)(v71.val[0].i64[0] + v58 - 4))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v71, (int8x16_t)xmmword_21B567BE0), (int8x8_t)0x5959595959595959)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a56 + 8 * ((604 * (v64 - v66 == -8)) ^ a7)) - 4))((__n128)xmmword_21B567BE0);
}

void sub_21B50C9FC()
{
  JUMPOUT(0x21B50C918);
}

uint64_t sub_21B50CA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7 + 8 * (((v6 ^ 0x681) * (*(_DWORD *)(v8 - 140) == *(_DWORD *)(v8 - 144))) ^ v6))
                                                                                               - ((v6 - 189) ^ 0x42ELL)))(a1, a2, a3, a4, a5, a6, v6 ^ 0x514u);
}

uint64_t sub_21B50CA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = (a8 - 1340939161);
  *(_BYTE *)(v14 + v16) = *(_BYTE *)(v12 + (v16 & 0xF)) ^ *(_BYTE *)(v8 + v16) ^ *(_BYTE *)((v16 & 0xF) + v10 + 4) ^ *(_BYTE *)(v11 + (v16 & 0xF) + ((v13 - 2023101491) & 0x789611FB ^ 0x1F0)) ^ (89 * (v16 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((1012 * (a8 - 1 == v9)) ^ (v13 + 394))) - 8))();
}

uint64_t sub_21B50CAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  int v54;

  v52 = *(_QWORD *)(v48 + 24);
  *(int8x16_t *)(v51 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v48 + 16) - 0x7EC954F5752627A1), (int8x16_t)xmmword_21B567C00);
  if (v49)
    v53 = v52 == 0x38046E592152BE6ALL;
  else
    v53 = 1;
  v54 = !v53;
  LODWORD(a25) = 2 * v47;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 + 8 * (int)((v54 * (((a7 - 115) | 0x406) ^ 0x11C)) ^ a7)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_21B50CB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v47;
  uint64_t v48;
  int v49;
  _BOOL4 v51;

  v49 = (a7 + 1245228019) & 0xB5C753FB;
  v51 = ((((v47 ^ (a7 - 13) & 0xFB) ^ 0x39) + (a25 & 0xB6) + 5) & 0xF) != 0
     || (v47 ^ v49 ^ 0x3F8F7E39) + (a25 & 0x7F1EFFB6) == 1066368987;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 + 8 * (((v49 ^ 0x166 ^ (v49 - 904012845) & 0x35E222DF) * v51) | v49)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_21B50CBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,uint64_t a25,int a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57)
{
  uint64_t v57;
  int v58;

  v58 = a24 - (a26 & 0x102B64DC) + ((26 * (a57 ^ 0x5AF)) ^ 0xFCD4F95);
  return (*(uint64_t (**)(void))(v57
                              + 8
                              * ((44
                                * ((v58 ^ (((a57 - 571) | 0x20) + 1471464872))
                                 + 2147483645
                                 + ((2 * v58) & 0xBF42F6FA ^ 0x100264D8) != 1604418426)) ^ a57)))();
}

uint64_t sub_21B50CCC8(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((((a1 + v2 + 543065219) < 8) ^ (v1 - 64)) & 1)
                                * ((v1 + 1140) ^ 0x318)) ^ v1)))();
}

uint64_t sub_21B50CD3C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8
                                             * ((4061 * (v6 + a6 - 16 < (((a4 ^ 0x3F5) - 528) ^ 0xFFFFFDEA))) ^ a4))
                            - 4))();
}

uint64_t sub_21B50CD7C(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  int v22;
  int v24;

  v9 = (a1 + v6 + v5);
  v10 = v9 + v7 + 1;
  v11 = ((_BYTE)a1 + (_BYTE)v6 + (_BYTE)v5) & 0xF;
  v12 = v11 - v9;
  v13 = v4 + v12;
  ++v11;
  v14 = v4 + v11;
  v15 = v2 + v12;
  v16 = v2 + v11;
  v17 = v3 + v12;
  v18 = v3 + v11;
  v20 = v16 > v7 && v15 < v10;
  v22 = v14 > v7 && v13 < v10 || v20;
  if (v18 <= v7 || v17 >= v10)
    v24 = v22;
  else
    v24 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a2 | (1376 * (v24 ^ 1)))) - (((a2 ^ 0x630u) - 147) ^ 0x39BLL)))();
}

uint64_t sub_21B50CE08(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v5
                                                    + 8
                                                    * ((1835
                                                      * (((v4 < ((a4 + 74) ^ 0x3F1u)) ^ (a4 + 20)) & 1)) ^ a4)))(a1, 0);
}

uint64_t sub_21B50CE54(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16x4_t v19;
  int8x16x4_t v20;

  v19.val[1].i64[0] = ((_BYTE)v6 + 9) & 0xF;
  v19.val[1].i64[1] = ((_BYTE)v6 + 8) & 0xF;
  v19.val[2].i64[0] = ((_BYTE)v6 + 7) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)v6 + 6) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v6 + 5) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v6 + 4) & 0xF;
  v20.val[0].i64[0] = ((_BYTE)v6 + 3) & 0xF;
  v20.val[0].i64[1] = ((_BYTE)v6 + 2) & 0xF;
  v20.val[1].i64[0] = (v6 + 1) & 0xF;
  v20.val[1].i64[1] = v6 & 0xF;
  v20.val[2].i64[0] = (v6 - 1) & 0xF;
  v20.val[2].i64[1] = ((_BYTE)v6 + 14) & 0xF;
  v20.val[3].i64[0] = ((_BYTE)v6 + 13) & 0xF;
  v20.val[3].i64[1] = ((_BYTE)v6 + 12) & 0xF;
  v12 = a1 + v9 + v8;
  v13.i64[0] = 0x505050505050505;
  v13.i64[1] = 0x505050505050505;
  v14.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v14.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v19.val[0].i64[0] = v12 & 0xF;
  v19.val[0].i64[1] = ((_BYTE)v6 + 10) & 0xF;
  v15.i64[0] = vqtbl4q_s8(v19, (int8x16_t)xmmword_21B567BD0).u64[0];
  v15.i64[1] = vqtbl4q_s8(v20, (int8x16_t)xmmword_21B567BD0).u64[0];
  v16 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v10 - 15 + v12), *(int8x16_t *)(v5 + v19.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v3 + v19.val[0].i64[0] - 15), *(int8x16_t *)(v4 + v19.val[0].i64[0] - 15))));
  v17 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v16, v16, 8uLL), v14), vmulq_s8(v15, v13)));
  *(int8x16_t *)(v10 - 15 + v12) = vextq_s8(v17, v17, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((v7 & 0xFFFFFFF0) == 16) * ((a3 + 322) ^ 0x366)) ^ a3)) - 4))();
}

void sub_21B50CFB0()
{
  JUMPOUT(0x21B50CF28);
}

uint64_t sub_21B50CFBC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  unsigned __int8 *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int v62;
  uint64_t v63;
  int v64;
  int v65;
  unsigned __int8 v66;
  int v67;
  unsigned int v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  unsigned int v82;
  int v83;
  int v84;
  int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  int v91;
  unsigned int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  int v104;
  int v105;
  unsigned int v106;
  int v107;
  int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  int v112;
  int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  int v118;
  unsigned int v119;
  int v120;
  int v121;
  int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  int v127;
  int v128;
  unsigned int v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  char *v134;
  unsigned int v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  int v139;
  char *v140;
  int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  int v150;
  int v151;
  unsigned int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  unsigned int v161;
  unsigned int v162;
  int v163;
  unsigned int v164;
  unsigned int v165;
  unsigned int v166;
  unsigned int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  int v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  unsigned int v177;
  int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  int v182;
  int v183;
  int v184;
  unsigned int v185;
  int v186;
  unsigned int v187;
  int v188;
  int v189;
  unsigned int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  unsigned int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  unsigned int v202;
  unsigned int v203;
  int v204;
  unsigned int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  int v214;
  unsigned int v215;
  int v216;
  int v217;
  unsigned int v218;
  int v219;
  unsigned __int8 *v220;
  unsigned __int8 v221;
  uint64_t v222;
  int v223;
  int v224;
  uint64_t v225;
  int v226;
  uint64_t v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  uint64_t v233;
  uint64_t v234;
  char *v235;
  unsigned int v236;
  unsigned int v237;
  uint64_t v238;
  int v239;
  int v240;
  unsigned int v241;
  char *v242;
  int v243;
  unint64_t v244;
  int v245;
  uint64_t v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  unsigned int v254;
  unsigned int v255;
  unsigned int v256;
  int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  int v262;
  int v263;
  unsigned int v264;
  unsigned int v265;
  unsigned int v266;
  int v267;
  int v268;
  unsigned int v269;
  int v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  int v274;
  int v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  int v282;
  unsigned int v283;
  int v284;
  unsigned int v285;
  unsigned int v286;
  unsigned int v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  unsigned int v295;
  unsigned int v296;
  unsigned int v297;
  unsigned int v298;
  int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  unsigned int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned int v313;
  int v314;
  unsigned int v315;
  int v316;
  int v317;
  int v318;
  unsigned int v319;
  unsigned int v320;
  unsigned int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  int v330;
  int v331;
  int v332;
  int v333;
  unsigned int v334;
  int v335;
  int v336;
  int v337;
  unsigned int v338;
  int v339;
  unsigned int v340;
  int v341;
  int v342;
  unsigned int v343;
  int v344;
  unsigned int v345;
  int v346;
  int v347;
  unsigned int v348;
  unsigned int v349;
  unsigned int v350;
  int v351;
  int v352;
  int v353;
  int v354;
  unsigned int v355;
  int v356;
  unsigned int v357;
  int v358;
  unsigned int v359;
  unsigned int v360;
  char *v361;
  int v362;
  int v363;
  int v364;
  uint64_t v365;
  char *v366;
  int v367;
  unsigned int v368;
  uint64_t v369;
  uint64_t v370;
  int v371;
  int v372;
  int v373;
  int v374;
  uint64_t v375;
  unsigned int v376;
  char *v377;
  int v378;
  unsigned int v379;
  unsigned int v380;
  char *v381;
  char *v382;
  int v383;
  int v384;
  int v385;
  uint64_t v386;
  uint64_t v387;
  int v388;
  char *v389;
  uint64_t v390;
  int v391;
  int v392;
  unsigned int v393;
  int v394;
  uint64_t v395;
  int v396;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  int v403;
  uint64_t v404;
  unsigned int v405;
  uint64_t v406;
  uint64_t v407;
  unsigned __int8 v408;
  unsigned int v409;
  uint64_t v410;
  int v411;
  unsigned int v412;
  uint64_t v413;
  unsigned int v414;
  unsigned int v415;
  uint64_t v416;
  int v417;
  int v418;
  uint64_t v419;
  int v420;
  uint64_t v421;
  unsigned int v422;
  int v423;
  unsigned int v424;
  unsigned int v425;
  int v426;
  unsigned int v427;
  int v428;
  uint64_t v429;
  int v430;
  unsigned int v431;
  int v432;
  int v433;
  int v434;
  uint64_t v435;
  int v436;
  unsigned int v437;
  unsigned int v438;
  uint64_t v439;
  unsigned int v440;
  int v441;
  int v442;
  unsigned int v443;
  int v444;
  uint64_t v445;
  int v446;
  unsigned int v447;
  int v448;
  int v449;
  unsigned int v450;
  uint64_t v451;
  unsigned __int8 v452;
  int v453;
  int v454;
  int v455;
  unsigned int v456;
  uint64_t v457;
  unsigned int v458;
  unsigned int v459;
  int v460;
  unsigned int v461;
  unsigned int v462;
  uint64_t v463;
  __int16 v464;
  unsigned int v465;
  int v466;
  unsigned int v467;
  uint64_t v468;
  unsigned int v469;
  int v470;
  int v471;
  unsigned int v472;
  int v473;
  uint64_t v474;
  int v475;
  int v476;
  int v477;
  uint64_t v478;
  int v479;
  unsigned int v480;
  unsigned int v481;
  int v482;
  uint64_t v483;
  int v484;
  int v485;
  unsigned int v486;
  int v487;
  uint64_t v488;
  int v489;
  unsigned int v490;
  unsigned int v491;
  int v492;
  unsigned int v493;
  uint64_t v494;
  unsigned int v495;
  unsigned int v496;
  int v497;
  int v498;
  unsigned int v499;
  uint64_t v500;
  unsigned int v501;
  int v502;
  int v503;
  int v504;
  uint64_t v505;
  int v506;
  unsigned int v507;
  int v508;
  int v509;
  uint64_t v510;
  int v511;
  int v512;
  unsigned int v513;
  unsigned int v514;
  int v515;
  uint64_t v516;
  int v517;
  int v518;
  int v519;
  int v520;
  unsigned int v521;
  uint64_t v522;
  int v523;
  unsigned int v524;
  unsigned int v525;
  int v526;
  uint64_t v527;
  unsigned int v528;
  int v529;
  uint64_t v530;
  int v531;
  unsigned int v532;
  int v533;
  unsigned int v534;
  char *v535;
  int v536;
  int v537;
  char *v538;
  int v539;
  char *v540;
  int v541;
  char *v542;
  uint64_t v543;
  uint64_t v544;
  unint64_t v545;
  uint64_t v546;
  int v547;
  uint64_t v548;
  unsigned int v549;
  unsigned int v550;
  unsigned int v551;
  unsigned int v552;
  int v553;
  int v554;
  int v555;
  int v556;
  int v557;
  unsigned int v558;
  int v559;
  int v560;
  unsigned int v561;
  unsigned int v562;
  int v563;
  int v564;
  unsigned int v565;
  int v566;

  v54 = *(_QWORD *)(v52 + 8 * (a1 & 0x361AF3CB)) - 12;
  v55 = *v50 ^ 0xB1;
  v56 = (*(unsigned __int8 *)(v54 + ((a1 + 66) ^ *(_BYTE *)(v49 - 0x38046E592152BE68))) ^ 0x28) << 8;
  v57 = *(_QWORD *)(v52 + 8 * (a1 + 31));
  LODWORD(v55) = *(unsigned __int8 *)(v57 + v55);
  v58 = *(unsigned __int8 *)(v49 - 0x38046E592152BE5DLL);
  *(_DWORD *)(v53 - 184) = v51;
  v59 = *(_QWORD *)(v52 + 8 * (a1 + 24)) - 12;
  LODWORD(v58) = *(unsigned __int8 *)(v59 + (v58 ^ 0x49));
  HIDWORD(v60) = ~(_DWORD)v58;
  LODWORD(v60) = (v58 ^ 0x18) << 24;
  LOBYTE(v58) = v60 >> 26;
  v62 = v56 | ((v55 ^ 0xF2) << 24);
  v63 = *(_QWORD *)(v52 + 8 * (a1 ^ 0x1Du));
  LODWORD(v55) = *(unsigned __int8 *)(v57 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE5ELL) ^ 0xB8));
  v64 = *(unsigned __int8 *)(v59 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE61) ^ 0x6BLL));
  HIDWORD(v60) = ~v64;
  LODWORD(v60) = (v64 ^ 0x18) << 24;
  v65 = ((v60 >> 26) ^ 0x53) << 16;
  v66 = *(_BYTE *)(v54 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE5CLL) ^ 0x2ELL));
  v67 = *(unsigned __int8 *)(v59 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE69) ^ 0x47));
  HIDWORD(v60) = ~v67;
  LODWORD(v60) = (v67 ^ 0x18) << 24;
  v68 = v62 & 0xFF00FF00 | (*(_BYTE *)(v63 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE67) ^ 0xECLL))
                                           + 63) ^ 9 | (((v60 >> 26) ^ 0x1E) << 16);
  v69 = v65 | ((*(unsigned __int8 *)(v54 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE60) ^ 0x77)) ^ 0xE7) << 8);
  v70 = (*(_BYTE *)(v63 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE63) ^ 0xA9)) + 63) | ((*(unsigned __int8 *)(v54 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE64) ^ 0x30)) ^ 0x1D) << 8);
  v71 = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE5BLL) ^ 0x36)) + 63;
  v72 = ((v58 ^ 0xFB) << 16) | ((v55 ^ 0x4A) << 24) | ((v66 ^ 0xED) << 8);
  LODWORD(v54) = *(unsigned __int8 *)(v59 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE65) ^ 0xCBLL));
  HIDWORD(v60) = ~(_DWORD)v54;
  LODWORD(v60) = (v54 ^ 0x18) << 24;
  LOBYTE(v54) = *(_BYTE *)(v63 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE5FLL) ^ 0xB5));
  v73 = v70 & 0xFF00FFFF | (((v60 >> 26) ^ 0xBA) << 16) | ((*(unsigned __int8 *)(v57
                                                                                                + (*(unsigned __int8 *)(v49 - 0x38046E592152BE66) ^ 0x35)) ^ 0x3D) << 24);
  v74 = *(_QWORD *)(v52 + 8 * (a1 - 53)) - 8;
  v75 = v69 | ((*(unsigned __int8 *)(v57 + (*(unsigned __int8 *)(v49 - 0x38046E592152BE62) ^ 0xBFLL)) ^ 0x24) << 24);
  v76 = *(_QWORD *)(v52 + 8 * (a1 - 90)) - 4;
  LODWORD(v58) = *(_DWORD *)(v74 + 4 * (v71 ^ 0xFDu)) ^ 0x9067F7C3 ^ *(_DWORD *)(v76
                                                                                                  + 4 * (v58 ^ 0x61u));
  v77 = v55 ^ 0xDFu;
  v78 = *(_QWORD *)(v52 + 8 * (a1 ^ 0x92u)) - 4;
  LODWORD(v59) = (v58 - ((2 * v58) & 0xF8820D0A) + 2084636293) ^ *(_DWORD *)(v78 + 4 * v77);
  v79 = *(_QWORD *)(v52 + 8 * (a1 ^ 0x53u)) - 4;
  HIDWORD(v546) = v68;
  v80 = *(_DWORD *)(v79 + 4 * (v66 ^ 0xD5u)) ^ v68 ^ (v59 - ((2 * v59) & 0x95941174) - 892729158);
  LODWORD(v546) = v72 & 0xFFFFFF00 | v71 ^ 0x2A;
  v81 = v546 - 2 * ((v72 & 0x53A93E00 | v71 ^ 0x2A) ^ (v71 ^ 0x2A) & 0xA) + 1403600629;
  LOBYTE(v77) = (v54 + 63) ^ 0xA8;
  v82 = v75 & 0xFFFFFF00 | v77;
  v430 = v80;
  LODWORD(v54) = v80 ^ v73 ^ 0x4D;
  v83 = v80 ^ v73;
  *(_DWORD *)(v53 - 160) = v80 ^ v73;
  v452 = v80 ^ v73 ^ 0x4D;
  *(_DWORD *)(v53 - 148) = v54 ^ v82;
  v84 = v54 ^ v82 ^ v81;
  v479 = BYTE1(v84);
  v466 = BYTE2(v84);
  v85 = *(_DWORD *)(v79 + 4 * (BYTE1(v84) ^ 0xC4u)) ^ *(_DWORD *)(v76 + 4 * (BYTE2(v84) ^ 0x17u)) ^ 0x6E7D04D9;
  v86 = v84 ^ 0xE95E135C;
  v87 = v84;
  v88 = (v85 + 886111137 + (~(2 * v85) | 0x965E08BF)) ^ *(_DWORD *)(v74 + 4 * (v84 ^ 0xDCu));
  v472 = HIBYTE(v86);
  v475 = v87;
  v89 = v80 ^ *(_DWORD *)(v78 + 4 * (HIBYTE(v86) ^ 0x65)) ^ (v88 - ((2 * v88) & 0xF8820D0A) + 2084636293);
  v90 = (v83 ^ 0xBAF72DE4) - ((2 * (v83 ^ 0xBAF72DE4)) & 0xE8482904);
  v545 = __PAIR64__(v73, v82);
  v549 = v89 ^ 0xF4241482;
  *(_DWORD *)(v53 - 144) = v89;
  v91 = v89 ^ 0xF4241482 ^ (v82 - 198962046 - 2 * (v82 & 0x742414A2 ^ v77 & 0x20));
  v92 = v91 ^ v86;
  *(_DWORD *)(v53 - 128) = v91;
  v489 = BYTE2(v92);
  v492 = BYTE1(v92);
  v93 = *(_DWORD *)(v76 + 4 * (BYTE2(v92) ^ 0x2Eu)) ^ *(_DWORD *)(v79 + 4 * (BYTE1(v92) ^ 0x9Bu)) ^ 0x6E7D04D9;
  *(_DWORD *)(v53 - 240) = v92;
  v94 = (v93 - ((2 * v93) & 0x69A1F740) + 886111136) ^ *(_DWORD *)(v74 + 4 * (v92 ^ 0xD2u));
  v95 = v92 ^ 0x77A6BBF0;
  *(_DWORD *)(v53 - 192) = HIBYTE(v92);
  v96 = (v94 + 2084636293 + (~(2 * v94) | 0x77DF2F5) + 1) ^ *(_DWORD *)(v78 + 4 * (HIBYTE(v92) ^ 0x69));
  v97 = v96 ^ v54 ^ 0x702AC687;
  v511 = v96 ^ v54;
  LODWORD(v57) = v97 ^ v91;
  v523 = v97 ^ v91;
  v98 = ((v57 ^ 0xEAACCB6D) - ((2 * (v57 ^ 0xEAACCB6D)) & 0x6023572) + 50404025) ^ v95;
  v529 = ((v98 ^ 0x9547167F) >> 16);
  v547 = ((unsigned __int16)(v98 ^ 0x167F) >> 8);
  v99 = *(_DWORD *)(v76 + 4 * (v529 ^ 0x89u)) ^ *(_DWORD *)(v79 + 4 * (v547 ^ 0x3Au)) ^ 0x6E7D04D9;
  v533 = (((v57 ^ 0x6D) - ((2 * (v57 ^ 0x6D)) & 0x72) - 71) ^ v95);
  v100 = (v99 - ((2 * v99) & 0x69A1F740) + 886111136) ^ *(_DWORD *)(v74 + 4 * (v533 ^ 0xE4u));
  v552 = (v98 ^ 0x9547167F) >> 24;
  v101 = (v100 - ((2 * v100) & 0xF8820D0A) + 2084636293) ^ *(_DWORD *)(v78 + 4 * (v552 ^ 0x1D));
  v495 = v96 ^ v89;
  v565 = (v101 - ((2 * v101) & 0xFF3EA6CA) - 6335643) ^ v96 ^ v89;
  v102 = v565 ^ 0xFF9F5365 ^ v96 ^ v54;
  *(_DWORD *)(v53 - 224) = v565 ^ 0xFF9F5365;
  *(_DWORD *)(v53 - 248) = v102;
  v103 = ((v102 ^ 0xFE25CD6D) - ((2 * (v102 ^ 0xFE25CD6D)) & 0x6023572) + 50404025) ^ v95;
  *(_DWORD *)(v53 - 200) = BYTE1(v103);
  v104 = *(_DWORD *)(v79 + 4 * (BYTE1(v103) ^ 0x6Fu));
  *(_DWORD *)(v53 - 208) = BYTE2(v103);
  v105 = v104 ^ *(_DWORD *)(v76 + 4 * (BYTE2(v103) ^ 0xA8u)) ^ 0x6E7D04D9;
  v106 = (v105 - ((2 * v105) & 0xF8820D0A) + 2084636293) ^ *(_DWORD *)(v78 + 4 * (HIBYTE(v103) ^ 0x85));
  v107 = (v106 - ((2 * v106) & 0x69A1F740) + 886111136) ^ *(_DWORD *)(v74 + 4 * (v103 ^ 0x25u));
  LODWORD(v77) = (v107 - ((2 * v107) & 0x95BBD65C) - 891426002) ^ v97;
  v561 = v102 ^ v97 ^ v91;
  v437 = v77 ^ v561;
  *(_DWORD *)(v53 - 168) = v77;
  v108 = v77 ^ v561 ^ 0x1D0A1C7A;
  v417 = v108;
  *(_DWORD *)(v53 - 232) = v103;
  v109 = v103 ^ v108 ^ 0xE0D26014;
  v461 = HIBYTE(v109);
  v442 = BYTE2(v109);
  v110 = *(_DWORD *)(v78 + 4 * (HIBYTE(v109) ^ 0x1D)) ^ *(_DWORD *)(v76 + 4 * (BYTE2(v109) ^ 0x89u)) ^ 0xD8F60AE6;
  v454 = BYTE1(v109);
  v111 = (v110 - ((2 * v110) & 0x95941174) - 892729158) ^ *(_DWORD *)(v79 + 4 * (BYTE1(v109) ^ 0x3Au));
  v446 = (v103 ^ v108);
  LODWORD(v77) = *(_DWORD *)(v74 + 4 * (v446 ^ 0x8Fu));
  *(_DWORD *)(v53 - 176) = v565 ^ 0xFF9F5365 ^ v107;
  LODWORD(v77) = v565 ^ 0xFF9F5365 ^ v107 ^ v77 ^ (v111 - ((2 * v111) & 0x69A1F740) + 886111136);
  v458 = (v107 - ((2 * v107) & 0x95BBD65C) - 891426002) ^ v97 ^ 0x7C166C11;
  v112 = v77 ^ v458;
  v113 = v77;
  v541 = v77;
  LODWORD(v77) = (v77 ^ v458 ^ v103) >> 24;
  *(_DWORD *)(v53 - 216) = v77;
  v536 = (v112 ^ v103);
  v114 = *(_DWORD *)(v78 + 4 * (v77 ^ 0x9B)) ^ *(_DWORD *)(v74 + 4 * (v536 ^ 0x31u)) ^ 0x4891FD25;
  v513 = ((v112 ^ v103) >> 8) ^ 0x86839A;
  v520 = ((unsigned __int16)(v112 ^ v103) >> 8) ^ 0x9A;
  v115 = (v114 - ((2 * v114) & 0x95941174) - 892729158) ^ *(_DWORD *)(v79
                                                                    + 4
                                                                    * (((unsigned __int16)(v112 ^ v103) >> 8) ^ 0xA0u));
  LODWORD(v77) = v115 - ((2 * v115) & 0x496E18C6);
  v116 = v112 ^ v103 ^ 0xADB20875;
  v506 = ((v112 ^ v103) >> 16);
  v117 = (v77 - 1531507613) ^ *(_DWORD *)(v76 + 4 * (v506 ^ 0xAu));
  LODWORD(v59) = (v117 - ((2 * v117) & 0xD8DCA4D0) + 1819169384) ^ v113;
  *(_DWORD *)(v53 - 136) = v59;
  v477 = v59 ^ 0x91EDC8C2 ^ v112;
  v118 = v59 ^ 0x91EDC8C2;
  v464 = v59 ^ 0xC8C2;
  v525 = v112 ^ v108;
  v498 = v112;
  v517 = v112 ^ v108 ^ 0x7CEF42B3;
  LODWORD(v59) = ((v477 ^ 0x5A137D54) - 952963692 + (~(2 * (v477 ^ 0x5A137D54)) | 0x719A24D9)) ^ v517;
  *(_DWORD *)(v53 - 140) = v59;
  LODWORD(v77) = ((v59 ^ 0x18C1142E) - ((2 * (v59 ^ 0x18C1142E)) & 0x566325BE) + 724669151) ^ v116 ^ 0x479AB031;
  v554 = (((v59 ^ 0x2E) - ((2 * (v59 ^ 0x2E)) & 0xBE) - 33) ^ v116);
  v119 = *(_DWORD *)(v74 + 4 * (v554 ^ 0xAAu)) ^ 0xFE1AF31A;
  *(_DWORD *)(v53 - 256) = ((unsigned __int16)(((v59 ^ 0x142E) - ((2 * (v59 ^ 0x142E)) & 0x25BE) - 27937) ^ v116 ^ 0xB031) >> 8);
  v120 = *(_DWORD *)(v79
                   + 4
                   * (((unsigned __int16)(((v59 ^ 0x142E) - ((2 * (v59 ^ 0x142E)) & 0x25BE) - 27937) ^ v116 ^ 0xB031) >> 8) ^ 0x3Au)) ^ v119;
  v121 = BYTE2(v77);
  v122 = (v120 - ((2 * v120) & 0x496E18C6) - 1531507613) ^ *(_DWORD *)(v76 + 4 * (BYTE2(v77) ^ 0x89u));
  v469 = BYTE3(v77);
  v123 = (v122 - ((2 * v122) & 0xF8820D0A) + 2084636293) ^ *(_DWORD *)(v78 + 4 * (BYTE3(v77) ^ 0x1D));
  LODWORD(v77) = v123 ^ v112;
  v124 = ((v123 ^ v112 ^ 0xA6C48CD5) - ((2 * (v123 ^ v112 ^ 0xA6C48CD5)) & 0x566325BE) + 724669151) ^ v116;
  v125 = HIBYTE(v124);
  LODWORD(v59) = ((unsigned __int16)(((v123 ^ v112 ^ 0x8CD5)
                                                     - ((2 * (v123 ^ v112 ^ 0x8CD5)) & 0x25BE)
                                                     - 27937) ^ v116) >> 8);
  v126 = *(_DWORD *)(v78 + 4 * (HIBYTE(v124) ^ 5)) ^ *(_DWORD *)(v79 + 4 * (BYTE1(v124) ^ 0x6Fu)) ^ 0xB68B0E3F;
  v539 = v124;
  LODWORD(v54) = (v126 - ((2 * v126) & 0x69A1F740) + 886111136) ^ *(_DWORD *)(v74 + 4
                                                                                  * (v124 ^ 0x25u));
  v127 = v118 ^ v123;
  v128 = BYTE2(v124);
  v129 = v118 ^ v123 ^ *(_DWORD *)(v76 + 4 * (BYTE2(v124) ^ 0xA8u)) ^ (v54 - ((2 * v54) & 0x496E18C6) - 1531507613);
  v130 = ((v477 ^ 0x5A137D54) - 952963692 + (~(2 * (v477 ^ 0x5A137D54)) | 0x719A24D9)) ^ v517 ^ 0x9F5ECC2E;
  LODWORD(v54) = v130 ^ v129 ^ v124;
  v503 = v130 ^ v129;
  v563 = BYTE1(v54);
  v131 = *(_DWORD *)(v79 + 4 * (BYTE1(v54) ^ 0x44u));
  v425 = BYTE3(v54);
  LODWORD(v79) = v549 ^ (v90 - 198962046);
  LODWORD(v78) = v131 ^ *(_DWORD *)(v78 + 4 * (BYTE3(v54) ^ 0x47));
  v433 = v54;
  v132 = ((v78 ^ 0xB68B0E3F) + 886111137 + (~(2 * (v78 ^ 0xB68B0E3F)) | 0x965E08BF)) ^ *(_DWORD *)(v74
                                                                                                 + 4
                                                                                                 * (v54 ^ 0xD5u));
  v420 = BYTE2(v54);
  v133 = (v132 - ((2 * v132) & 0x496E18C6) - 1531507613) ^ *(_DWORD *)(v76 + 4 * (BYTE2(v54) ^ 0xCBu));
  HIDWORD(v544) = v129 ^ 0x718413D5 ^ (v133 - ((2 * v133) & 0xE2E67CF8) - 244105604);
  v423 = v129 ^ v77;
  v418 = v130 ^ v129 ^ 0x42632BF0;
  LODWORD(v544) = v129 ^ v77 ^ 0x90BE0242 ^ (HIDWORD(v544) - ((2 * HIDWORD(v544)) & 0x68399AAC) - 1273180842);
  HIDWORD(v543) = v544 ^ v418 ^ 0x4662A266;
  LODWORD(v543) = (HIDWORD(v543) - 2 * (HIDWORD(v543) & 0x4287C51E ^ (v544 ^ v418) & 8) - 1031289578) ^ v54;
  v134 = (char *)*(&off_24DE82D70 + (a1 ^ 0x93u)) - 4;
  v135 = (((v127 ^ 0x1B9155BDu) >> 16)
        - 826085522
        + ((2 * ((v127 ^ 0x1B9155BDu) >> 16) + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (((v127 ^ 0x1B9155BDu) >> 16) ^ 0x2D)];
  LODWORD(v57) = ((v128 ^ 0x89) - 826085522 + ((2 * (v128 ^ 0x89) + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (v128 ^ 0xA4)];
  LODWORD(v78) = v135 - ((2 * v135) & 0xCF087F34);
  v136 = (uint64_t)*(&off_24DE82D70 + (a1 ^ 0xE0u));
  v137 = (v78 + 1736720282) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v127) ^ 0x47u));
  LODWORD(v78) = v57 - ((2 * v57) & 0xF6830054);
  v138 = (uint64_t)*(&off_24DE82D70 + a1 - 144);
  v139 = (v78 + 2067890218) ^ *(_DWORD *)(v138 + 4 * (v125 ^ 0xCC));
  v140 = (char *)*(&off_24DE82D70 + a1 - 105) - 4;
  v141 = *(_DWORD *)&v140[4 * ((v130 ^ v77) ^ 0x53)];
  v408 = BYTE1(v130) ^ BYTE1(v77);
  v142 = *(_DWORD *)&v134[4 * (((v130 ^ v77) >> 16) ^ 0xAA)] ^ *(_DWORD *)(v138 + 4 * (((v130 ^ v77) >> 24) ^ 0x3E)) ^ ((((v130 ^ v77) >> 16) ^ 0x87) - 826085522 + ~((2 * (((v130 ^ v77) >> 16) ^ 0x87) + 25990232) & 0x1880282)) ^ (181304767 * v141 - ((362609534 * v141 + 272701798) & 0xF6830054) - 2090726179);
  v143 = *(_DWORD *)&v140[4 * (v77 ^ 0x74)];
  v144 = (181304767 * v143 - ((362609534 * v143 + 272701798) & 0xCF087F34) + 1873071181) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v77) ^ 0x5Au));
  v550 = v144 - ((2 * v144) & 0xF6830054);
  v508 = BYTE2(v77);
  v558 = (BYTE2(v77) ^ 0x4C) - 826085522 + ((2 * (BYTE2(v77) ^ 0x4C) + 88) & 0x282 ^ 0xFE77FFFF);
  v501 = v59 ^ 0xB0;
  v531 = v139 - ((2 * v139) & 0xCF087F34);
  v528 = v142 - ((2 * v142) & 0xCF087F34);
  HIDWORD(v548) = (v137 - ((2 * v137) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4
                                                                                     * ((v127 ^ 0x1B9155BDu) >> 24)) ^ (181304767 * *(_DWORD *)&v140[4 * (v127 ^ 0x7D)] + 136350899);
  LODWORD(v59) = *(_DWORD *)&v134[4 * (((v79 ^ 0xE9B45E6C) >> 16) ^ 0xF5)] ^ ((((v79 ^ 0xE9B45E6C) >> 16) ^ 0xD8) - 826085522 + ((2 * (((v79 ^ 0xE9B45E6C) >> 16) ^ 0xD8) + 88) & 0x282 ^ 0xFE77FFFF));
  v145 = *(_DWORD *)(v53 - 128) ^ 0x31676F78;
  v146 = *(_DWORD *)&v134[4 * (BYTE2(v145) ^ 0x7B)] ^ ((BYTE2(v145) ^ 0x56)
                                                     - 826085522
                                                     + ((2 * (BYTE2(v145) ^ 0x56) + 88) & 0x282 ^ 0xFE77FFFF));
  v147 = (v146 - ((2 * v146) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * HIBYTE(v145));
  v148 = *(_DWORD *)&v134[4 * (v489 ^ 0x34)] ^ ((v489 ^ 0x19)
                                              - 826085522
                                              + ((2 * (v489 ^ 0x19) + 88) & 0x282 ^ 0xFE77FFFF));
  v149 = (v148 - ((2 * v148) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (v492 ^ 5u));
  v490 = v147 - ((2 * v147) & 0xCF087F34);
  v150 = *(_DWORD *)(v53 - 144);
  v151 = *(_DWORD *)&v140[4 * (v150 ^ 0xDF)];
  v493 = v149 - ((2 * v149) & 0xF6830054);
  v152 = *(_DWORD *)(v138 + 4 * ((v150 ^ 0x5A18571Fu) >> 24)) ^ ((((v150 ^ 0x5A18571Fu) >> 16) ^ 0xC1)
                                                                 - 826085522
                                                                 + ((2
                                                                   * (((v150 ^ 0x5A18571Fu) >> 16) ^ 0xC1)
                                                                   + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (((v150 ^ 0x5A18571Fu) >> 16) ^ 0xEC)] ^ (181304767 * v151 - ((362609534 * v151 + 272701798) & 0xF6830054) - 2090726179);
  v486 = v152 - ((2 * v152) & 0xCF087F34);
  v153 = *(_DWORD *)(v138 + 4 * ((v79 ^ 0xE9B45E6C) >> 24)) ^ (v59
                                                                             - ((2 * v59) & 0xF6830054)
                                                                             + 2067890218);
  v427 = v79 ^ 0xAC;
  v481 = BYTE1(v79) ^ 0xB4;
  v484 = v153 - ((2 * v153) & 0xCF087F34);
  LODWORD(v79) = *(_DWORD *)&v134[4 * (v121 ^ 0xDE)] ^ ((v121 ^ 0xF3)
                                                      - 826085522
                                                      + ((2 * (v121 ^ 0xF3) + 88) & 0x282 ^ 0xFE77FFFF));
  LODWORD(v59) = *(_DWORD *)&v134[4 * (((v477 ^ 0x35C48CD5u) >> 16) ^ 0xFE)] ^ ((((v477 ^ 0x35C48CD5u) >> 16) ^ 0xD3)
                                                                                               - 826085522
                                                                                               + ((2
                                                                                                 * (((v477 ^ 0x35C48CD5u) >> 16) ^ 0xD3)
                                                                                                 + 88) & 0x282 ^ 0xFE77FFFF));
  v154 = *(_DWORD *)&v140[4 * ((((v477 ^ 0x54) - 108 + (~(2 * (v477 ^ 0x54)) | 0xD9)) ^ v517) ^ 0xEB)];
  v155 = (v79 - ((2 * v79) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * (v469 ^ 0x36));
  LODWORD(v79) = BYTE2(*(_DWORD *)(v53 - 136));
  LODWORD(v79) = *(_DWORD *)&v134[4 * (v79 ^ 0xC1)] ^ ((v79 ^ 0xEC)
                                                                   - 826085522
                                                                   + ((2 * (v79 ^ 0xEC) + 88) & 0x282 ^ 0xFE77FFFF));
  v156 = (v79 - ((2 * v79) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (HIBYTE(v464) ^ 0x8Bu));
  v470 = v155 - ((2 * v155) & 0xCF087F34);
  v157 = *(_DWORD *)(v53 - 140) ^ 0xFDC1142E;
  v158 = *(_DWORD *)(v136 + 4 * (BYTE1(v157) ^ 0x20u)) ^ ((BYTE2(v157) ^ 0xD7)
                                                          - 826085522
                                                          + ((2 * (BYTE2(v157) ^ 0xD7) + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (BYTE2(v157) ^ 0xFA)] ^ (181304767 * v154 - ((362609534 * v154 + 272701798) & 0xCF087F34) + 1873071181);
  v159 = (v59 - ((2 * v59) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * ((v477 ^ 0x35C48CD5u) >> 24)) ^ (181304767 * *(_DWORD *)&v140[4 * (v477 ^ 0x3D)] + 136350899);
  v415 = v464 ^ 0xA3;
  v449 = v159 - ((2 * v159) & 0xCF087F34);
  v465 = v158 - ((2 * v158) & 0xF6830054);
  v440 = v430 ^ 0x2BEAE26B;
  v160 = *(_DWORD *)&v134[4 * (((v430 ^ 0x2BEAE26Bu) >> 16) ^ 0xEC)] ^ ((((v430 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                       - 826085522
                                                                                       + ((2
                                                                                         * (((v430 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                         + 88) & 0x282 ^ 0xFE77FFFF)) ^ (181304767 * *(_DWORD *)&v140[4 * (v430 ^ 0x1E)] + 136350899);
  v161 = (v160 - ((2 * v160) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v430) ^ 8u));
  v162 = *(_DWORD *)&v134[4 * (v466 ^ 0x89)] ^ ((v466 ^ 0xA4)
                                              - 826085522
                                              + ((2 * (v466 ^ 0xA4) + 88) & 0x282 ^ 0xFE77FFFF));
  v163 = *(_DWORD *)&v140[4 * (v452 ^ 0x55)];
  v467 = v161 - ((2 * v161) & 0xF6830054);
  v164 = *(_DWORD *)(v53 - 148);
  v453 = (BYTE2(v164) ^ 0xA7)
       - 826085522
       + ((2 * (((BYTE2(v164) ^ 0xA7) + 44) & 0x143 ^ (HIWORD(v164) ^ 0xBAF7 | 0x7FFFFFFD))) ^ 0x1880005);
  v165 = (v162 - ((2 * v162) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (v479 ^ 0xAEu)) ^ (181304767 * *(_DWORD *)&v140[4 * (v475 ^ 0xAF)] + 136350899);
  v166 = *(_DWORD *)(v53 - 160);
  v480 = v165 - ((2 * v165) & 0xF6830054);
  v167 = (181304767 * v163 - ((362609534 * v163 + 272701798) & 0xF6830054) - 2090726179) ^ ((BYTE2(v166) ^ 0xBA)
                                                                                          - 826085522
                                                                                          + ((2 * (BYTE2(v166) ^ 0xBA)
                                                                                            + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)(v138 + 4 * (HIBYTE(v166) ^ 0x2F)) ^ *(_DWORD *)&v134[4 * (BYTE2(v166) ^ 0x97)];
  v431 = v167 - ((2 * v167) & 0xCF087F34);
  v168 = *(_DWORD *)&v134[4 * (BYTE2(v417) ^ 0x25)] ^ ((BYTE2(v417) ^ 8)
                                                     - 826085522
                                                     + ((2 * (BYTE2(v417) ^ 8) + 88) & 0x282 ^ 0xFE77FFFF));
  v169 = *(_DWORD *)(v53 - 176);
  v170 = *(_DWORD *)&v134[4 * (BYTE2(v169) ^ 0x56)] ^ ((BYTE2(v169) ^ 0x7B)
                                                     - 826085522
                                                     + ((2 * (BYTE2(v169) ^ 0x7B) + 88) & 0x282 ^ 0xFE77FFFF));
  v171 = (v168 - ((2 * v168) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v417) ^ 0x20u)) ^ (181304767 * *(_DWORD *)&v140[4 * (v417 ^ 0x67)] + 136350899);
  v172 = *(_DWORD *)&v140[4 * (*(_DWORD *)(v53 - 168) ^ 0xFB)];
  v173 = (181304767 * v172 - ((362609534 * v172 + 272701798) & 0xCF087F34) + 1873071181) ^ *(_DWORD *)(v136 + 4 * (BYTE1(*(_DWORD *)(v53 - 168)) ^ 0xEFu));
  v412 = BYTE3(v77) ^ 0xB2;
  v414 = HIBYTE(v437) ^ 0xB2;
  v438 = v171 - ((2 * v171) & 0xF6830054);
  HIDWORD(v416) = v173 - ((2 * v173) & 0xF6830054);
  v174 = (v170 - ((2 * v170) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * (HIBYTE(v169) ^ 0xD9)) ^ (181304767 * *(_DWORD *)&v140[4 * (v169 ^ 0x79)] + 136350899);
  LODWORD(v77) = *(_DWORD *)&v134[4 * (v442 ^ 0x86)] ^ ((v442 ^ 0xAB)
                                                      - 826085522
                                                      + ((2 * (v442 ^ 0xAB) + 88) & 0x282 ^ 0xFE77FFFF));
  LODWORD(v77) = (v77 - ((2 * v77) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * v461);
  v443 = v454 ^ 0xEE;
  v409 = v446 ^ 0x29;
  v455 = v77 - ((2 * v77) & 0xCF087F34);
  v447 = v174 - ((2 * v174) & 0xCF087F34);
  v411 = BYTE2(v458);
  v476 = (BYTE2(v458) ^ 0x65)
       - 826085522
       + ((2 * (((BYTE2(v458) ^ 0x65) + 44) & 0x143 ^ (HIWORD(v458) | 0x7FFFFFFD))) ^ 0x1880005);
  v175 = *(_DWORD *)&v134[4 * (v420 ^ 0x8B)] ^ ((v420 ^ 0xA6)
                                              - 826085522
                                              + ((2 * (v420 ^ 0xA6) + 88) & 0x282 ^ 0xFE77FFFF));
  v462 = (BYTE2(v418) ^ 0xEC) - 826085522 + ((2 * (BYTE2(v418) ^ 0xEC) + 88) & 0x282 ^ 0xFE77FFFF);
  LODWORD(v77) = v425 ^ 0x22;
  LODWORD(v59) = *(_DWORD *)&v134[4 * (BYTE2(v129) ^ 0xE8)] ^ ((BYTE2(v129) ^ 0xC5)
                                                             - 826085522
                                                             + ((2 * (BYTE2(v129) ^ 0xC5) + 88) & 0x282 ^ 0xFE77FFFF));
  LODWORD(v59) = (181304767 * *(_DWORD *)&v140[4 * (v129 ^ 0xCA)] + 136350899) ^ *(_DWORD *)(v138 + 4 * (HIBYTE(v129) ^ 0x8E)) ^ (v59 - ((2 * v59) & 0xF6830054) + 2067890218);
  v459 = v423 ^ 0x44039AAA;
  v176 = (181304767 * *(_DWORD *)&v140[4 * (v423 ^ 0xDB)] + 136350899) ^ (((v423 ^ 0x44039AAAu) >> 16)
                                                                                         - 826085522
                                                                                         + ((2
                                                                                           * ((v423 ^ 0x44039AAAu) >> 16)
                                                                                           + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (((v423 ^ 0x44039AAAu) >> 16) ^ 0x2D)];
  v422 = BYTE1(v129) ^ 0x16;
  v426 = v59 - ((2 * v59) & 0xCF087F34);
  LODWORD(v59) = (v176 - ((2 * v176) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v423) ^ 0xC0u));
  v177 = *(_DWORD *)(v138 + 4 * v77) ^ (181304767 * *(_DWORD *)&v140[4 * (v433 ^ 0xFE)] + 136350899) ^ (v175 - ((2 * v175) & 0xF6830054) + 2067890218);
  v434 = v59 - ((2 * v59) & 0xF6830054);
  LODWORD(v59) = *(_DWORD *)&v140[4 * (v495 ^ 0xEC)];
  v424 = v177 - ((2 * v177) & 0xCF087F34);
  v178 = 181304767 * v59 - ((362609534 * v59 + 272701798) & 0xF6830054);
  LODWORD(v59) = *(_DWORD *)&v134[4 * (v529 ^ 0x32)] ^ ((v529 ^ 0x1F)
                                                      - 826085522
                                                      + ((2 * (v529 ^ 0x1F) + 88) & 0x282 ^ 0xFE77FFFF));
  LODWORD(v77) = *(_DWORD *)&v140[4 * (v511 ^ 0xE6)];
  v179 = *(_DWORD *)(v138 + 4 * (HIBYTE(v495) ^ 0xCA)) ^ ((BYTE2(v495) ^ 0x2F)
                                                          - 826085522
                                                          + ((2 * (BYTE2(v495) ^ 0x2F) + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (BYTE2(v495) ^ 2)] ^ (v178 - 2090726179);
  LODWORD(v59) = (v59 - ((2 * v59) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (v547 ^ 0x8Cu)) ^ (181304767 * *(_DWORD *)&v140[4 * (v533 ^ 0xD9)] + 136350899);
  LODWORD(v77) = *(_DWORD *)(v138 + 4 * ((v511 ^ 0x49A657C7u) >> 24)) ^ ((((v511 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                                         - 826085522
                                                                         + ((2
                                                                           * (((v511 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                                           + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (((v511 ^ 0x49A657C7u) >> 16) ^ 0x18)] ^ (181304767 * v77 - ((362609534 * v77 + 272701798) & 0xF6830054) - 2090726179);
  v180 = *(_DWORD *)&v134[4 * (((v523 ^ 0xD451DD12) >> 16) ^ 0x2D)] ^ (((v523 ^ 0xD451DD12) >> 16)
                                                                                      - 826085522
                                                                                      + ((2
                                                                                        * ((v523 ^ 0xD451DD12) >> 16)
                                                                                        + 88) & 0x282 ^ 0xFE77FFFF));
  v534 = v552 ^ 0xAA;
  LODWORD(v548) = (v179 - ((2 * v179) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v495) ^ 0x2Eu));
  v553 = v59 + 2067890218 + (~(2 * v59) | 0x97CFFAB);
  v181 = (v180 - ((2 * v180) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * ((v523 ^ 0xD451DD12) >> 24)) ^ (181304767 * *(_DWORD *)&v140[4 * (v523 ^ 0x82)] + 136350899);
  v496 = BYTE1(v523) ^ 0x5D;
  v524 = v181 - ((2 * v181) & 0xCF087F34);
  LODWORD(v59) = *(_DWORD *)&v134[4 * (v506 ^ 0xC1)] ^ ((v506 ^ 0xEC)
                                                      - 826085522
                                                      + ((2 * (v506 ^ 0xEC) + 88) & 0x282 ^ 0xFE77FFFF));
  v182 = (v59 - ((2 * v59) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136
                                                                   + 4 * ((v520 - ((2 * v513) & 0x166) + 179) ^ 0x54)) ^ (181304767 * *(_DWORD *)&v140[4 * (v536 ^ 0xE2)] + 136350899);
  LODWORD(v59) = *(_DWORD *)&v140[4 * (v517 ^ 0xE9)];
  LODWORD(v59) = (181304767 * v59 - ((362609534 * v59 + 272701798) & 0xF6830054) - 2090726179) ^ *(_DWORD *)(v138 + 4 * (HIBYTE(v525) ^ 0xB3));
  v514 = BYTE1(v517) ^ 0xF5;
  v537 = v182 - ((2 * v182) & 0xF6830054);
  v518 = v59 - ((2 * v59) & 0xCF087F34);
  v521 = v498 ^ 0xEEA2BFA8;
  LODWORD(v59) = ((v498 ^ 0xEEA2BFA8) >> 16);
  LODWORD(v59) = *(_DWORD *)&v134[4 * (v59 ^ 0x86)] ^ ((v59 ^ 0xAB)
                                                                   - 826085522
                                                                   + ((2
                                                                     * (((v59 ^ 0xAB) + 44) & 0x143 ^ (v59 ^ 0xAB | 0x7FFFFFFD))) ^ 0x1880005));
  v183 = (181304767 * *(_DWORD *)&v140[4 * (v498 ^ 0x68)] + 136350899) ^ *(_DWORD *)(v136 + 4 * (BYTE1(v498) ^ 0x55u)) ^ (v59 - ((2 * v59) & 0xCF087F34) + 1736720282);
  v403 = ((v541 ^ 0x231B9DB5u) >> 16);
  v507 = (v403 ^ 0xC1) - 826085522 + ((2 * (v403 ^ 0xC1) + 88) & 0x282 ^ 0xFE77FFFF);
  LODWORD(v407) = v183 - ((2 * v183) & 0xF6830054);
  v184 = BYTE2(v525);
  v499 = (BYTE2(v525) ^ 0x96) - 826085522 + ((2 * (BYTE2(v525) ^ 0x96) + 88) & 0x282 ^ 0xFE77FFFF);
  v185 = v565 ^ 0x6E3D9C71;
  v405 = HIBYTE(v103) ^ 0x7B;
  LODWORD(v78) = *(_DWORD *)&v140[4 * (v103 ^ 0x74)];
  v186 = *(_DWORD *)&v140[4 * v409];
  v187 = v503;
  LODWORD(v79) = *(_DWORD *)&v140[4 * (v503 ^ 0x78)];
  v188 = *(_DWORD *)&v140[4 * (v541 ^ 0x75)];
  v189 = *(_DWORD *)&v140[4 * (v561 ^ 0x2F)];
  v190 = *(_DWORD *)(v53 - 248);
  v191 = *(_DWORD *)&v140[4 * (v190 ^ 0x2A)];
  v192 = *(_DWORD *)&v140[4 * (v565 ^ 0x48)];
  v526 = 181304767 * *(_DWORD *)&v140[4 * (v539 ^ 0x60)] + 136350899;
  v566 = 181304767 * *(_DWORD *)&v140[4 * (*(_DWORD *)(v53 - 240) ^ 0xFB)] + 136350899;
  v559 = 181304767 * *(_DWORD *)&v140[4 * (*(_DWORD *)(v53 - 128) ^ 0xB8)] + 136350899;
  v560 = 181304767 * *(_DWORD *)&v140[4 * v427] + 136350899;
  LODWORD(v410) = 181304767 * *(_DWORD *)&v140[4 * v415] + 136350899;
  HIDWORD(v406) = 181304767 * *(_DWORD *)&v140[4 * (v554 ^ 0xF0)] + 136350899;
  *(_DWORD *)(v53 - 240) = 181304767 * *(_DWORD *)&v140[4 * (v164 ^ 0x57)] + 136350899;
  v555 = 181304767 * v186 + 136350899;
  LODWORD(v406) = 181304767 * v79 + 136350899;
  LODWORD(v416) = 181304767 * v188 + 136350899;
  v428 = 181304767 * v192 + 136350899;
  v193 = (181304767 * v78 - ((362609534 * v78 + 272701798) & 0xF6830054) - 2090726179) ^ *(_DWORD *)(v138 + 4 * v405);
  LODWORD(v140) = *(_DWORD *)&v134[4 * (BYTE2(v561) ^ 0x71)] ^ ((BYTE2(v561) ^ 0x5C)
                                                              - 826085522
                                                              + ((2 * (BYTE2(v561) ^ 0x5C) + 88) & 0x282 ^ 0xFE77FFFF)) ^ (181304767 * v189 + 136350899);
  LODWORD(v140) = ((_DWORD)v140 - ((2 * (_DWORD)v140) & 0xCF087F34) + 1736720282) ^ *(_DWORD *)(v136
                                                                                              + 4
                                                                                              * (BYTE1(v561) ^ 0x6Fu));
  LODWORD(v78) = *(_DWORD *)&v134[4 * (BYTE2(v185) ^ 0x3C)] ^ ((BYTE2(v185) ^ 0x11)
                                                             - 826085522
                                                             + ((2 * (BYTE2(v185) ^ 0x11) + 88) & 0x282 ^ 0xFE77FFFF));
  LODWORD(v79) = (181304767 * v191 + 136350899) ^ ((BYTE2(v190) ^ 0x37)
                                                 - 826085522
                                                 + ((2 * (BYTE2(v190) ^ 0x37) + 88) & 0x282 ^ 0xFE77FFFF)) ^ *(_DWORD *)&v134[4 * (BYTE2(v190) ^ 0x1A)];
  LODWORD(v76) = v193 - ((2 * v193) & 0xCF087F34);
  LODWORD(v79) = (v79 - ((2 * v79) & 0xF6830054) + 2067890218) ^ *(_DWORD *)(v138 + 4 * (HIBYTE(v190) ^ 0xF9));
  v509 = *(_DWORD *)&v134[4 * (v508 ^ 0x61)];
  HIDWORD(v419) = *(_DWORD *)&v134[4 * (BYTE2(v164) ^ 0x8A)];
  HIDWORD(v404) = *(_DWORD *)&v134[4 * (v411 ^ 0x48)];
  LODWORD(v402) = *(_DWORD *)&v134[4 * (BYTE2(v418) ^ 0xC1)];
  LODWORD(v404) = *(_DWORD *)&v134[4 * (v403 ^ 0xEC)];
  HIDWORD(v402) = *(_DWORD *)&v134[4 * (v184 ^ 0xBB)];
  LODWORD(v59) = *(_DWORD *)(v53 - 208);
  HIDWORD(v410) = *(_DWORD *)&v134[4 * (v59 ^ 0x1A)];
  v502 = *(_DWORD *)(v136 + 4 * v501);
  HIDWORD(v401) = *(_DWORD *)(v136 + 4 * (v408 ^ 0x8Eu));
  v194 = ((*(_DWORD *)(v53 - 232) >> 15) & 0x58 ^ 0x48) + (v59 ^ 0x4C64A1B);
  *(_DWORD *)(v53 - 128) = *(_DWORD *)(v136 + 4 * (BYTE1(*(_DWORD *)(v53 - 128)) ^ 0x85u));
  LODWORD(v421) = *(_DWORD *)(v136 + 4 * (BYTE1(*(_DWORD *)(v53 - 144)) ^ 0xBDu));
  *(_DWORD *)(v53 - 208) = *(_DWORD *)(v136 + 4 * v481);
  LODWORD(v401) = *(_DWORD *)(v136 + 4 * (*(_DWORD *)(v53 - 256) ^ 0x1Au));
  v436 = *(_DWORD *)(v136 + 4 * (((unsigned __int16)(v477 ^ 0x8EA4) >> 8) ^ 0x14u));
  *(_DWORD *)(v53 - 232) = *(_DWORD *)(v136 + 4 * (BYTE1(v164) ^ 0xF5u));
  *(_DWORD *)(v53 - 160) = *(_DWORD *)(v136 + 4 * (BYTE1(*(_DWORD *)(v53 - 160)) ^ 0xD6u));
  *(_DWORD *)(v53 - 256) = *(_DWORD *)(v136 + 4 * v443);
  v482 = *(_DWORD *)(v136 + 4 * (BYTE1(*(_DWORD *)(v53 - 176)) ^ 0xD7u));
  HIDWORD(v400) = *(_DWORD *)(v136 + 4 * (BYTE1(v503) ^ 0x76u));
  v195 = *(_DWORD *)(v136 + 4 * v422);
  *(_DWORD *)(v53 - 176) = v194 - 906189502 + ((2 * v194) & 0x282 ^ 0xFE77FFFF);
  LODWORD(v400) = *(_DWORD *)(v136 + 4 * (v563 ^ 0xBEu));
  v196 = (_DWORD)v140 - ((2 * (_DWORD)v140) & 0xF6830054);
  v564 = *(_DWORD *)(v136 + 4 * (BYTE1(v511) ^ 0xB9u));
  v444 = *(_DWORD *)(v136 + 4 * v496);
  v497 = *(_DWORD *)(v136 + 4 * (BYTE1(v541) ^ 0x77u));
  v504 = *(_DWORD *)(v136 + 4 * v514);
  *(_DWORD *)(v53 - 200) = *(_DWORD *)(v136 + 4 * (*(_DWORD *)(v53 - 200) ^ 0x84u));
  HIDWORD(v421) = *(_DWORD *)(v136 + 4 * (BYTE1(v190) ^ 0x2Eu));
  LODWORD(v140) = *(_DWORD *)(v136 + 4 * (BYTE1(*(_DWORD *)(v53 - 224)) ^ 0xC8u));
  v512 = v531 + 1736720282;
  HIDWORD(v399) = v528 + 1736720282;
  *(_DWORD *)(v53 - 224) = v490 + 1736720282;
  HIDWORD(v407) = v486 + 1736720282;
  *(_DWORD *)(v53 - 248) = v484 + 1736720282;
  v515 = v470 + 1736720282;
  LODWORD(v399) = v449 + 1736720282;
  v450 = v431 + 1736720282;
  v487 = v455 + 1736720282;
  v491 = v447 + 1736720282;
  v197 = v426 + 1736720282;
  v532 = v424 + 1736720282;
  v471 = v77 - ((2 * v77) & 0xCF087F34) + 1736720282;
  v456 = v524 + 1736720282;
  v485 = v518 + 1736720282;
  HIDWORD(a18) = v76 + 1736720282;
  LODWORD(a16) = v79 - ((2 * v79) & 0xCF087F34) + 1736720282;
  v519 = *(_DWORD *)(v138 + 4 * v412);
  *(_DWORD *)(v53 - 192) = *(_DWORD *)(v138 + 4 * (*(_DWORD *)(v53 - 192) ^ 7u));
  HIDWORD(v398) = *(_DWORD *)(v138 + 4 * (HIBYTE(*(_DWORD *)(v53 - 136)) ^ 0x7Du));
  LODWORD(v413) = *(_DWORD *)(v138 + 4 * (HIBYTE(*(_DWORD *)(v53 - 140)) ^ 0x8Au));
  v432 = *(_DWORD *)(v138 + 4 * (HIBYTE(*(_DWORD *)(v53 - 148)) ^ 0xB8u));
  v448 = *(_DWORD *)(v138 + 4 * HIBYTE(v440));
  v441 = *(_DWORD *)(v138 + 4 * (v472 ^ 0x4B));
  v473 = *(_DWORD *)(v138 + 4 * v414);
  HIDWORD(v413) = *(_DWORD *)(v138 + 4 * (HIBYTE(*(_DWORD *)(v53 - 168)) ^ 0xE8u));
  v198 = *(_DWORD *)(v138 + 4 * (HIBYTE(v187) ^ 0xA6));
  v199 = *(_DWORD *)(v138 + 4 * HIBYTE(v459));
  *(_DWORD *)(v53 - 168) = *(_DWORD *)(v138 + 4 * v534);
  v200 = *(_DWORD *)(v138 + 4 * ((v541 ^ 0x231B9DB5u) >> 24));
  LODWORD(v398) = *(_DWORD *)(v138 + 4 * (*(_DWORD *)(v53 - 216) ^ 0x38u));
  v201 = *(_DWORD *)(v138 + 4 * HIBYTE(v521));
  v460 = *(_DWORD *)(v138 + 4 * (HIBYTE(v561) ^ 0x40));
  LODWORD(v419) = *(_DWORD *)(v138 + 4 * HIBYTE(v185));
  v202 = v550 + 2067890218;
  v551 = v493 + 2067890218;
  v203 = v465 + 2067890218;
  *(_DWORD *)(v53 - 216) = v467 + 2067890218;
  v562 = v480 + 2067890218;
  v204 = v537 + 2067890218;
  v205 = v196 + 2067890218;
  v206 = (v140 ^ (v78 - ((2 * v78) & 0xCF087F34) + 1736720282))
       - ((2 * (v140 ^ (v78 - ((2 * v78) & 0xCF087F34) + 1736720282))) & 0xF6830054)
       + 2067890218;
  v207 = HIDWORD(v548) ^ v548 ^ 0x6285F181;
  v208 = v197 ^ v195 ^ v207;
  v209 = a1;
  v210 = (char *)*(&off_24DE82D70 + (a1 + 51)) - 8;
  v211 = (char *)*(&off_24DE82D70 + (a1 ^ 0xDu)) - 8;
  v212 = (char *)*(&off_24DE82D70 + (a1 ^ 0xFCu)) - 12;
  v213 = (char *)*(&off_24DE82D70 + (a1 + 15)) - 12;
  LODWORD(v136) = (v213[*(unsigned __int8 *)(v53 - 105) ^ 0xE4] ^ 0x6F) & 0xFF00FFFF | ((v211[*(unsigned __int8 *)(v53 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v53 - 108) - ((2 * *(unsigned __int8 *)(v53 - 108)) & 0x40) + 32) ^ 0xFFFFFFE1) << 24) | (((v210[*(unsigned __int8 *)(v53 - 107) ^ 0x27] + 29) ^ 0x96) << 16);
  v214 = ((v211[*(unsigned __int8 *)(v53 - 104) ^ 0xD3] ^ (*(unsigned __int8 *)(v53 - 104)
                                                                            - ((2 * *(unsigned __int8 *)(v53 - 104)) & 0x40)
                                                                            + 32) ^ 0xE0) << 24) | ((v212[*(unsigned __int8 *)(v53 - 102) ^ 0xBELL] ^ 0x38) << 8);
  v215 = (v213[*(unsigned __int8 *)(v53 - 109) ^ 0x41] ^ 0x59) & 0xFF00FFFF | (((v210[*(unsigned __int8 *)(v53 - 111) ^ 0x40] + 29) ^ 0x5A) << 16) | ((v212[*(unsigned __int8 *)(v53 - 110) ^ 0xBBLL] ^ 0x9A) << 8) | ((v211[*(unsigned __int8 *)(v53 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v53 - 112) - ((2 * *(unsigned __int8 *)(v53 - 112)) & 0x40) + 32) ^ 0x84) << 24);
  v538 = v212;
  v540 = v211;
  v216 = v213[*(unsigned __int8 *)(v53 - 97) ^ 0x74] ^ 0xFE | (((v210[*(unsigned __int8 *)(v53 - 99) ^ 0xF3] + 29) ^ 2) << 16) | ((v212[*(unsigned __int8 *)(v53 - 98) ^ 0x20] ^ 0x70) << 8) | ((v211[*(unsigned __int8 *)(v53 - 100) ^ 0xF3] ^ (*(unsigned __int8 *)(v53 - 100) - ((2 * *(unsigned __int8 *)(v53 - 100)) & 0x40) + 32) ^ 0x85) << 24);
  v535 = v213;
  v542 = v210;
  v217 = v136 | ((v212[*(unsigned __int8 *)(v53 - 106) ^ 9] ^ 0x9F) << 8);
  v218 = (v213[*(unsigned __int8 *)(v53 - 101) ^ 0xF2] ^ 0xD6 | v214) & 0xFF00FFFF | (((v210[*(unsigned __int8 *)(v53 - 103) ^ 0xE9] + 29) ^ 0x8A) << 16);
  if ((v208 & 0x80) != 0)
    v219 = -128;
  else
    v219 = 128;
  *(_DWORD *)(v53 - 136) = v216 ^ 0xA7F61A46;
  v220 = *(unsigned __int8 **)(v53 - 120);
  *(_DWORD *)(v53 - 140) = v215 ^ 0xB0AC5360;
  *(_DWORD *)(v53 - 144) = v217 ^ 0x5653437B;
  *(_DWORD *)(v53 - 148) = v218 ^ 0xE20CABAA;
  HIDWORD(v530) = v532 ^ v400;
  LODWORD(v530) = v198 ^ HIDWORD(v400) ^ v462 ^ v402 ^ v406;
  HIDWORD(v527) = (v434 + 2067890218) ^ v199;
  LODWORD(v527) = v526 ^ v502 ^ v512;
  HIDWORD(v522) = HIDWORD(v399) ^ HIDWORD(v401);
  LODWORD(v522) = v519 ^ v558 ^ v509 ^ v202;
  HIDWORD(v516) = v399 ^ v436;
  LODWORD(v516) = v515 ^ v401 ^ HIDWORD(v406);
  HIDWORD(v510) = (v156 - ((2 * v156) & 0xF6830054) + 2067890218) ^ HIDWORD(v398) ^ v410;
  LODWORD(v510) = v203 ^ v413;
  HIDWORD(v505) = v497 ^ v200 ^ v507 ^ v404 ^ v416;
  LODWORD(v505) = v504 ^ v499 ^ HIDWORD(v402) ^ v485;
  HIDWORD(v500) = (v407 + 2067890218) ^ v201;
  LODWORD(v500) = v204 ^ v398;
  HIDWORD(v494) = v491 ^ v482;
  LODWORD(v494) = HIDWORD(v413) ^ v476 ^ HIDWORD(v404) ^ (HIDWORD(v416) + 2067890218);
  HIDWORD(v488) = (v438 + 2067890218) ^ v473;
  LODWORD(v488) = v555 ^ *(_DWORD *)(v53 - 256) ^ v487;
  HIDWORD(v483) = v428 ^ v419 ^ v206;
  LODWORD(v483) = a16 ^ HIDWORD(v421);
  HIDWORD(v478) = v205 ^ v460;
  LODWORD(v478) = *(_DWORD *)(v53 - 200) ^ *(_DWORD *)(v53 - 176) ^ HIDWORD(v410) ^ HIDWORD(a18);
  HIDWORD(v474) = (v553 + 1) ^ *(_DWORD *)(v53 - 168);
  LODWORD(v474) = v564 ^ v471;
  HIDWORD(v468) = v456 ^ v444;
  LODWORD(v468) = HIDWORD(v407) ^ v421;
  HIDWORD(v463) = *(_DWORD *)(v53 - 224) ^ *(_DWORD *)(v53 - 128) ^ v559;
  LODWORD(v463) = v560 ^ *(_DWORD *)(v53 - 208) ^ *(_DWORD *)(v53 - 248);
  HIDWORD(v457) = v566 ^ *(_DWORD *)(v53 - 192) ^ v551;
  LODWORD(v457) = v450 ^ *(_DWORD *)(v53 - 160);
  HIDWORD(v451) = *(_DWORD *)(v53 - 232) ^ v432 ^ HIDWORD(v419) ^ v453 ^ *(_DWORD *)(v53 - 240);
  LODWORD(v451) = v562 ^ v441;
  HIDWORD(v445) = *(_DWORD *)(v53 - 216) ^ v448;
  LODWORD(v445) = *(_DWORD *)(v53 - 184) - 1066368987;
  HIDWORD(v439) = (v219 + (v208 ^ 0x2497E332)) ^ v207;
  LODWORD(v439) = v209 - 282104534;
  HIDWORD(v435) = (v209 + 917) ^ 0x4FD;
  LODWORD(v435) = (v209 + 917) ^ 0x4AD;
  HIDWORD(v429) = (v209 + 917) ^ 0x491;
  LODWORD(v429) = (v209 + 917) ^ 0x401;
  *(_DWORD *)(v53 - 128) = v209 + 917;
  HIDWORD(a18) = (v209 + 917) ^ 0x466;
  *(_QWORD *)(v53 - 184) = 13;
  v221 = v210[v220[13] ^ 0xF3] + 29;
  *(_QWORD *)(v53 - 160) = 1;
  v222 = v220[1];
  *(_QWORD *)(v53 - 168) = 10;
  v223 = ((v210[v222 ^ 0x57] + 29) ^ 0xF6) << 16;
  v224 = v538[v220[10] ^ 0xB6];
  *(_QWORD *)(v53 - 200) = 4;
  v225 = v220[4];
  v226 = v540[v225 ^ 0x9A];
  *(_QWORD *)(v53 - 232) = 7;
  LODWORD(v225) = v226 ^ (v225 - ((2 * v225) & 0x40) + 32) ^ 0xFFFFFFCF;
  v227 = v220[7] ^ 0xD6;
  *(_QWORD *)(v53 - 224) = 2;
  LODWORD(v225) = v213[v227] ^ 0x3C | ((_DWORD)v225 << 24);
  LODWORD(v227) = v538[v220[2]] ^ 7;
  *(_QWORD *)(v53 - 192) = 3;
  v228 = v213[v220[3] ^ 0x74];
  *(_QWORD *)(v53 - 176) = 12;
  v229 = v223 | ((_DWORD)v227 << 8) | v228 ^ 0xFE;
  LODWORD(v227) = v540[v220[12] ^ 0x6ELL] ^ (v220[12] - ((2 * v220[12]) & 0x40) + 32) ^ 0x51;
  *(_QWORD *)(v53 - 208) = 0;
  v230 = v229 | ((v540[*v220 ^ 0x15] ^ (*v220 - ((2 * *v220) & 0x40) + 32) ^ 0xAE) << 24);
  LODWORD(v222) = ((v224 ^ 0x15) << 8) | ((v540[v220[8] ^ 0x46] ^ (v220[8]
                                                                                    - ((2 * v220[8]) & 0x40)
                                                                                    + 32) ^ 0xFFFFFFE7) << 24);
  *(_QWORD *)(v53 - 216) = 14;
  v231 = v538[v220[14] ^ 0xD5] ^ 0x8F;
  *(_QWORD *)(v53 - 240) = 5;
  v232 = ((v221 ^ 2) << ((v209 + 42) & 0xC6 ^ 0x96)) | ((_DWORD)v227 << 24) | (v231 << 8);
  v233 = v220[5];
  *(_QWORD *)(v53 - 256) = 11;
  LOBYTE(v231) = (v210[v233 ^ 0x9D] + 29) ^ 0xF7;
  v234 = v220[6] ^ 0xA4;
  LODWORD(v233) = (v213[v220[11] ^ 0xC2] ^ 0xDB | v222) & 0xFF00FFFF | (((v542[v220[9] ^ 0x3ELL] + 29) ^ 0xDF) << 16);
  *(_QWORD *)(v53 - 248) = 15;
  v557 = v225 & 0xFF00FFFF | (v231 << 16) | ((v538[v234] ^ 0xDF) << 8);
  v235 = (char *)*(&off_24DE82D70 + v435) - 4;
  v236 = ((((unsigned __int16)(v557 ^ v544) >> 8) ^ 0x4C)
        - 248360646
        - 2 * ((((v557 ^ v544) >> 8) ^ 0xB71C4C) & 0x3B ^ ((v557 ^ v544) >> 8) & 1)) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v557 ^ v544) >> 8) ^ 0x21)];
  v237 = v230 ^ HIDWORD(v544) ^ 0x730032AA;
  v238 = (uint64_t)*(&off_24DE82D70 + HIDWORD(v435));
  v239 = (v236 - 1503789221 - ((2 * v236) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238
                                                                     + 4
                                                                     * ((v230 ^ BYTE4(v544)) ^ 0xAAu));
  v556 = v535[v220[15] ^ 0x47] ^ 0xFE | v232;
  LODWORD(v225) = *(_DWORD *)&v235[4 * (((unsigned __int16)(v543 ^ v556) >> 8) ^ 0xC9)] ^ ((((unsigned __int16)(v543 ^ v556) >> 8) ^ 0xA4) - 248360646 - ((2 * (((v543 ^ v556) >> 8) ^ 0x9477A4)) & 0x74));
  v240 = v225 + 2080042334 - ((2 * v225) & 0xF7F5DABC);
  v241 = v239 + 2080042334 - ((2 * v239) & 0xF7F5DABC);
  v242 = (char *)*(&off_24DE82D70 + *(_DWORD *)(v53 - 128) - 875) - 4;
  LODWORD(v225) = *(_DWORD *)&v242[4 * (((v233 ^ HIDWORD(v543)) >> 16) ^ 0x68)];
  HIDWORD(v244) = v225 ^ 0x37;
  LODWORD(v244) = v225 ^ 0x57AAE000;
  v243 = v244 >> 12;
  v245 = *(_DWORD *)&v242[4 * (BYTE2(v230) ^ BYTE6(v544))];
  HIDWORD(v244) = v245 ^ 0x37;
  LODWORD(v244) = v245 ^ 0x57AAE000;
  v246 = (uint64_t)*(&off_24DE82D70 + *(_DWORD *)(v53 - 128) - 887);
  v247 = *(_DWORD *)(v246 + 4 * (((v557 ^ v544) >> 24) ^ 0xB7)) ^ (v244 >> 12);
  LODWORD(v220) = *(_DWORD *)&v242[4 * (((v543 ^ v556) >> 16) ^ 0x77)];
  HIDWORD(v244) = v220 ^ 0x37;
  LODWORD(v244) = v220 ^ 0x57AAE000;
  v248 = v240 ^ v247;
  v249 = *(_DWORD *)(v238 + 4 * ((v557 ^ v544) ^ 0xFBu)) ^ ((unsigned __int16)(v233 ^ WORD2(v543)) >> 8) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v233 ^ WORD2(v543)) >> 8) ^ 0x23)] ^ 0x576FAE2F ^ (v244 >> 12);
  LODWORD(v234) = *(_DWORD *)&v242[4 * (((v557 ^ v544) >> 16) ^ 0x1C)];
  HIDWORD(v244) = v234 ^ 0x37;
  LODWORD(v244) = v234 ^ 0x57AAE000;
  LODWORD(v234) = *(_DWORD *)(v246 + 4 * (((v233 ^ HIDWORD(v543)) >> 24) ^ 0xF6)) ^ (BYTE1(v237) - 248360646 - ((v237 >> 7) & 0x74)) ^ *(_DWORD *)&v235[4 * (BYTE1(v237) ^ 0x6D)] ^ ((v244 >> 12) + 2080042334 - ((2 * (v244 >> 12)) & 0xF7F5DABC));
  v250 = v248 - 1503789221 - ((2 * v248) & 0x4CBBFEB6);
  v251 = HIDWORD(v530) ^ *(_DWORD *)(v246 + 4 * (((v543 ^ v556) >> 24) ^ 0x94)) ^ v243;
  v252 = *(_DWORD *)(v246 + 4 * HIBYTE(v237));
  v253 = v251 ^ v241;
  LODWORD(v234) = v530 ^ *(_DWORD *)(v238 + 4 * ((v543 ^ v556) ^ 0x59u)) ^ (v234
                                                                                             - 1503789221
                                                                                             - ((2 * v234) & 0x4CBBFEB6));
  v254 = HIDWORD(v527) ^ *(_DWORD *)(v238 + 4 * ((v233 ^ BYTE4(v543)) ^ 0x5Fu)) ^ v250;
  v255 = HIDWORD(v439) ^ v252 ^ (v249 + 2080042334 - ((2 * v249) & 0xF7F5DABC));
  LOBYTE(v249) = ((unsigned __int16)(WORD2(v439) ^ v252 ^ (v249 - 4770 - ((2 * v249) & 0xDABC))) >> 8) ^ 0x68;
  v256 = v253 ^ 0xF9388C2F;
  v257 = *(_DWORD *)&v242[4 * ((v253 ^ 0xF9388C2F) >> 16)];
  HIDWORD(v244) = v257 ^ 0x37;
  LODWORD(v244) = v257 ^ 0x57AAE000;
  LODWORD(v220) = v244 >> 12;
  v258 = *(_DWORD *)&v242[4 * (BYTE2(v234) ^ 0xBD)];
  HIDWORD(v244) = v258 ^ 0x37;
  LODWORD(v244) = v258 ^ 0x57AAE000;
  v259 = v244 >> 12;
  v260 = *(_DWORD *)&v242[4 * (BYTE2(v254) ^ 0x66)];
  HIDWORD(v244) = v260 ^ 0x37;
  LODWORD(v244) = v260 ^ 0x57AAE000;
  v261 = (v244 >> 12) ^ *(_DWORD *)&v235[4 * (v249 ^ 0x6D)] ^ (v249
                                                                              - 248360646
                                                                              - 2 * (v249 & 0x3E ^ (v255 >> 8) & 4));
  v262 = ((_DWORD)v220 - 1503789221 - ((2 * (_DWORD)v220) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238
                                                                                     + 4
                                                                                     * (v254 ^ 0xB6u));
  v263 = (v261 - 1503789221 - ((2 * v261) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v253 ^ 0x61u));
  v264 = (BYTE1(v256) - 248360646 - ((v256 >> 7) & 0x74)) ^ 0xD678EAEF ^ *(_DWORD *)&v235[4 * (BYTE1(v256) ^ 0x6D)];
  v265 = *(_DWORD *)(v246 + 4 * (HIBYTE(v254) ^ 0x43)) ^ 0xD9E0B6E0;
  v266 = v264 + v265;
  v267 = v264 & v265;
  v268 = *(_DWORD *)&v242[4 * (BYTE2(v255) ^ 0xBD)];
  HIDWORD(v244) = v268 ^ 0x37;
  LODWORD(v244) = v268 ^ 0x57AAE000;
  LODWORD(v233) = (v266 - 2 * v267) ^ (v244 >> 12);
  v269 = *(_DWORD *)(v246 + 4 * HIBYTE(v256)) ^ (v259 + 2080042334 - ((2 * v259) & 0xF7F5DABC));
  v270 = (v269 - 1503789221 - ((2 * v269) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v255 ^ 0xABu));
  v271 = *(_DWORD *)(v246 + 4 * (HIBYTE(v255) ^ 0x42)) ^ HIDWORD(v548) ^ *(_DWORD *)&v235[4 * (BYTE1(v234) ^ 0x49)] ^ ((BYTE1(v234) ^ 0x24) - 248360646 - 2 * (((v234 >> 8) ^ 0xC9BD24) & 0x3B ^ (v234 >> 8) & 1)) ^ (v262 + 2080042334 - ((2 * v262) & 0xF7F5DABC));
  v272 = v527 ^ *(_DWORD *)&v235[4 * (BYTE1(v254) ^ 0x39)] ^ (v270 - 248360646 - ((2 * v270) & 0xE264A274));
  LODWORD(v220) = HIDWORD(v399) ^ HIDWORD(v401) ^ *(_DWORD *)(v246 + 4 * (BYTE3(v234) ^ 0xC9)) ^ (v263
                                                                                                  + 2080042334
                                                                                                  - ((2 * v263) & 0xF7F5DABC));
  v273 = v522 ^ *(_DWORD *)(v238 + 4 * (v234 ^ 0xD8u)) ^ (v233
                                                                           - 1503789221
                                                                           - ((2 * v233) & 0x4CBBFEB6));
  v274 = *(_DWORD *)&v242[4 * (BYTE2(v273) ^ 0x79)];
  HIDWORD(v244) = v274 ^ 0x37;
  LODWORD(v244) = v274 ^ 0x57AAE000;
  BYTE1(v255) = BYTE1(v220) ^ 0x68;
  v275 = ((v244 >> 12) + 2080042334 - ((2 * (v244 >> 12)) & 0xF7F5DABC)) ^ *(_DWORD *)(v246
                                                                                     + 4
                                                                                     * ((v220 ^ 0x2261685E) >> 24));
  v276 = ((BYTE1(v273) ^ 0xD0) - 248360646 - 2 * ((BYTE1(v273) ^ 0xD0) & 0x3F ^ (v273 >> 8) & 5)) ^ *(_DWORD *)&v235[4 * (BYTE1(v273) ^ 0xBD)];
  v277 = (v276 - 1503789221 - ((2 * v276) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v271 ^ 0x76u));
  LODWORD(v234) = ((BYTE1(v272) ^ 0xEC) - 248360646 - ((2 * ((v272 >> 8) ^ 0xE5FEC)) & 0x74)) ^ *(_DWORD *)&v235[4 * (BYTE1(v272) ^ 0x81)];
  LODWORD(v233) = *(_DWORD *)&v242[4 * (BYTE2(v272) ^ 0x5F)];
  HIDWORD(v244) = v233 ^ 0x37;
  LODWORD(v244) = v233 ^ 0x57AAE000;
  LODWORD(v233) = v244 >> 12;
  HIDWORD(v244) = *(_DWORD *)(v238 + 4 * (v220 ^ 0x5Eu)) ^ 0x4F4AD8D3;
  LODWORD(v244) = HIDWORD(v244);
  v278 = (v244 >> 28) ^ __ROR4__(*(_DWORD *)(v246 + 4 * (HIBYTE(v273) ^ 6)) ^ 0x7462B151 ^ (v234+ 2080042334- ((2 * v234) & 0xF7F5DABC)), 28);
  LODWORD(v233) = (v233 + 2080042334 - ((2 * v233) & 0xF7F5DABC)) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v271) ^ 0xD2));
  v279 = *(_DWORD *)&v242[4 * (BYTE2(v220) ^ 0x1B)];
  HIDWORD(v244) = v279 ^ 0x37;
  LODWORD(v244) = v279 ^ 0x57AAE000;
  v280 = v244 >> 12;
  LODWORD(v233) = (v233 - 1503789221 - ((2 * v233) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238
                                                                              + 4 * (v273 ^ 0x4Cu));
  LODWORD(v220) = v275 - 1503789221 - ((2 * v275) & 0x4CBBFEB6);
  v281 = *(_DWORD *)&v242[4 * (BYTE2(v271) ^ 0xCC)];
  HIDWORD(v244) = v281 ^ 0x37;
  LODWORD(v244) = v281 ^ 0x57AAE000;
  v282 = HIDWORD(v516) ^ (v244 >> 12) ^ __ROR4__(v278 ^ 0x78071371, 4);
  LOBYTE(v254) = v272 ^ BYTE1(v254) ^ 0x54;
  v283 = v516 ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v272) ^ 0xE)) ^ v280 ^ (v277 + 2080042335 + ~((2 * v277) & 0xF7F5DABC));
  v284 = BYTE1(v255);
  v285 = HIDWORD(v510) ^ *(_DWORD *)&v235[4 * (BYTE1(v255) ^ 0x6D)] ^ (v233 - 248360646 - ((2 * v233) & 0xE264A274));
  v286 = v203 ^ v413 ^ ((BYTE1(v271) ^ 0xC0) - 248360646 - ((v271 >> 7) & 0x74)) ^ *(_DWORD *)(v238
                                                                                             + 4
                                                                                             * (v254 ^ 0xCAu)) ^ *(_DWORD *)&v235[4 * (BYTE1(v271) ^ 0xAD)] ^ v220;
  v287 = v284 ^ 0x4552953C ^ v285;
  v288 = *(_DWORD *)&v242[4 * BYTE2(v287)];
  HIDWORD(v244) = v288 ^ 0x37;
  LODWORD(v244) = v288 ^ 0x57AAE000;
  v289 = v244 >> 12;
  BYTE1(v254) = BYTE1(v282) ^ 0xE7;
  LODWORD(v220) = *(_DWORD *)&v242[4 * ((v282 ^ 0x99FEE750) >> 16)];
  HIDWORD(v244) = v220 ^ 0x37;
  LODWORD(v244) = v220 ^ 0x57AAE000;
  v290 = BYTE1(v283) ^ 0x29;
  v291 = v290 - 248360646 - ((2 * ((v283 >> 8) ^ 0xA73B29)) & 0x74);
  v292 = (BYTE1(v287) - 248360646 - ((v287 >> 7) & 0x74)) ^ *(_DWORD *)(v238 + 4 * (v283 ^ 0x72u)) ^ *(_DWORD *)&v235[4 * (BYTE1(v287) ^ 0x6D)] ^ ((v244 >> 12) - 1503789221 - ((2 * (v244 >> 12)) & 0x4CBBFEB6));
  v293 = *(_DWORD *)&v242[4 * (BYTE2(v286) ^ 2)];
  HIDWORD(v244) = v293 ^ 0x37;
  LODWORD(v244) = v293 ^ 0x57AAE000;
  v294 = v244 >> 12;
  LODWORD(v220) = *(_DWORD *)&v242[4 * (BYTE2(v283) ^ 0x3B)];
  HIDWORD(v244) = v220 ^ 0x37;
  LODWORD(v244) = v220 ^ 0x57AAE000;
  v295 = *(_DWORD *)(v238 + 4 * v287) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v283) ^ 0xA7)) ^ v294 ^ 0xDDA71205;
  LODWORD(v233) = HIDWORD(v505) ^ ((BYTE1(v286) ^ 0xD9) - 248360646 - ((2 * ((v286 >> 8) ^ 0x9802D9)) & 0x74)) ^ *(_DWORD *)(v238 + 4 * (v282 ^ 0x1Eu)) ^ *(_DWORD *)&v235[4 * (BYTE1(v286) ^ 0xB4)] ^ (v244 >> 12) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v285) ^ 0x61));
  v296 = v505 ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v286) ^ 0x98)) ^ (v292 + 2080042334 - ((2 * v292) & 0xF7F5DABC));
  v297 = HIDWORD(v500) ^ *(_DWORD *)(v238 + 4 * (v286 ^ 0x3Du)) ^ v291 ^ *(_DWORD *)(v246 + 4 * ((v282 ^ 0x99FEE750) >> 24)) ^ *(_DWORD *)&v235[4 * (v290 ^ 0x6D)] ^ v289;
  v298 = v500 ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v282 ^ 0xE750) >> 8) ^ 0x6D)] ^ (v295 - 248360646 - ((2 * v295) & 0xE264A274));
  v299 = *(_DWORD *)&v242[4 * (BYTE2(v233) ^ 0x84)];
  HIDWORD(v244) = v299 ^ 0x37;
  LODWORD(v244) = v299 ^ 0x57AAE000;
  v300 = v244 >> 12;
  v301 = *(_DWORD *)&v242[4 * (BYTE2(v297) ^ 0x4F)];
  HIDWORD(v244) = v301 ^ 0x37;
  LODWORD(v244) = v301 ^ 0x57AAE000;
  v302 = BYTE1(v297) ^ 0xED;
  v303 = v302 - 248360646 - ((2 * ((v297 >> 8) ^ 0x84FED)) & 0x74);
  v304 = v233 ^ 0x57FE3515;
  v305 = *(_DWORD *)(v238 + 4 * ((v298 ^ BYTE1(v254)) ^ 0x41u)) ^ (((unsigned __int16)(v233 ^ 0x3515) >> 8)
                                                                                    - 248360646
                                                                                    - (((v233 ^ 0x57FE3515) >> 7) & 0x74)) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v233 ^ 0x3515) >> 8) ^ 0x6D)] ^ ((v244 >> 12) - 1503789221 - ((2 * (v244 >> 12)) & 0x4CBBFEB6));
  LODWORD(v233) = v305 + 2080042334 - ((2 * v305) & 0xF7F5DABC);
  v306 = *(_DWORD *)&v242[4 * (BYTE2(v298) ^ 0x81)];
  HIDWORD(v244) = v306 ^ 0x37;
  LODWORD(v244) = v306 ^ 0x57AAE000;
  v307 = ((v244 >> 12) + 2080042334 - ((2 * (v244 >> 12)) & 0xF7F5DABC)) ^ *(_DWORD *)(v246 + 4 * HIBYTE(v304));
  v308 = (v307 - 1503789221 - ((2 * v307) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * v297);
  v309 = *(_DWORD *)&v242[4 * (BYTE2(v296) ^ 0xC6)];
  v310 = ((BYTE1(v298) ^ 0xA0) - 248360645 + (~(2 * ((v298 >> 8) ^ 0x6881A0)) | 0xFFFFFF8B)) ^ (v300
                                                                                              - 1503789221
                                                                                              - ((2 * v300) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v296 ^ 0xFCu)) ^ *(_DWORD *)&v235[4 * (BYTE1(v298) ^ 0xCD)];
  LODWORD(v244) = __ROR4__((v309 >> 12) ^ 0x268A78C, 17) ^ 0xEE910136;
  HIDWORD(v244) = v244;
  v311 = HIDWORD(v494) ^ *(_DWORD *)&v235[4 * (BYTE1(v296) ^ 0x75)] ^ (v308 - 248360646 - ((2 * v308) & 0xE264A274));
  v312 = v494 ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v297) ^ 8)) ^ (v310 + 2080042334 - ((2 * v310) & 0xF7F5DABC));
  LODWORD(v220) = HIDWORD(v488) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v296) ^ 0x5A)) ^ v233;
  v313 = v488 ^ v303 ^ *(_DWORD *)(v238 + 4 * v304) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v298) ^ 0x68)) ^ *(_DWORD *)&v235[4 * (v302 ^ 0x6D)] ^ ((v244 >> 15) + (v309 << 20));
  v314 = ((BYTE1(v311) ^ 0x9D) - 248360646 - ((2 * ((v311 >> 8) ^ 0xC2489D)) & 0x74)) ^ *(_DWORD *)&v235[4 * (BYTE1(v311) ^ 0xF0)];
  v315 = *(_DWORD *)&v242[4 * (BYTE2(v312) ^ 0x8F)];
  v316 = *(_DWORD *)(v238 + 4 * (v313 ^ 0x8Fu)) ^ (v315 << 20) ^ (v315 >> 12) ^ (v314
                                                                                                  - 1503789221
                                                                                                  - ((2 * v314) & 0x4CBBFEB6));
  v317 = *(_DWORD *)&v242[4 * ((v220 ^ 0xCFB8D782) >> 16)];
  HIDWORD(v244) = v317 ^ 0x37;
  LODWORD(v244) = v317 ^ 0x57AAE000;
  LODWORD(v233) = ((v244 >> 12) - 1503789221 - ((2 * (v244 >> 12)) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238
                                                                                              + 4
                                                                                              * ((v311 ^ BYTE1(v296)) ^ 0x3Fu));
  LODWORD(v234) = *(_DWORD *)&v242[4 * (BYTE2(v311) ^ 0x48)];
  HIDWORD(v244) = v234 ^ 0x37;
  LODWORD(v244) = v234 ^ 0x57AAE000;
  v318 = ((BYTE1(v313) ^ 0x72) - 248360646 - 2 * (((v313 >> 8) ^ 0xF85C72) & 0x3B ^ (v313 >> 8) & 1)) ^ *(_DWORD *)(v238 + 4 * (v220 ^ 0xCCu)) ^ *(_DWORD *)&v235[4 * (BYTE1(v313) ^ 0x1F)] ^ ((v244 >> 12) - 1503789221 - ((2 * (v244 >> 12)) & 0x4CBBFEB6));
  LODWORD(v234) = *(_DWORD *)&v242[4 * (BYTE2(v313) ^ 0x5C)];
  HIDWORD(v244) = v234 ^ 0x37;
  LODWORD(v244) = v234 ^ 0x57AAE000;
  LODWORD(v234) = HIDWORD(v483) ^ (((unsigned __int16)((unsigned __int16)v220 ^ 0xD782) >> 8)
                                 - 248360646
                                 - (((v220 ^ 0xCFB8D782) >> 7) & 0x74)) ^ *(_DWORD *)(v238
                                                                                                  + 4 * (v312 ^ 0x50u)) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)((unsigned __int16)v220 ^ 0xD782) >> 8) ^ 0x6D)] ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v311) ^ 0xC2)) ^ (v244 >> 12);
  v319 = a16 ^ HIDWORD(v421) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v312) ^ 0xC7)) ^ (v318
                                                                                + 2080042334
                                                                                - ((2 * v318) & 0xF7F5DABC));
  v320 = HIDWORD(v478) ^ *(_DWORD *)(v246 + 4 * ((v220 ^ 0xCFB8D782) >> 24)) ^ ((v316 ^ 0x3757AAE)
                                                                                              + 2080042334
                                                                                              - 2
                                                                                              * ((v316 ^ 0x3757AAE) & 0x7BFAED5F ^ v316 & 1));
  v321 = v478 ^ ((BYTE1(v312) ^ 0xD9) - 248360646 - ((2 * ((v312 >> 8) ^ 0xC78FD9)) & 0x74)) ^ *(_DWORD *)&v235[4 * (BYTE1(v312) ^ 0xB4)] ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v313) ^ 0xF8)) ^ (v233 + 2080042334 - ((2 * v233) & 0xF7F5DABC));
  v322 = ((unsigned __int16)(a16 ^ WORD2(v421) ^ *(_WORD *)(v246 + 4 * (HIBYTE(v312) ^ 0xC7)) ^ (v318 - 4770 - ((2 * v318) & 0xDABC))) >> 8) ^ 0xB4;
  v323 = *(_DWORD *)&v242[4 * (BYTE2(v319) ^ 0xE6)];
  HIDWORD(v244) = v323 ^ 0x37;
  LODWORD(v244) = v323 ^ 0x57AAE000;
  v324 = v244 >> 12;
  v325 = *(_DWORD *)&v242[4 * (BYTE2(v320) ^ 0x1C)];
  HIDWORD(v244) = v325 ^ 0x37;
  LODWORD(v244) = v325 ^ 0x57AAE000;
  LODWORD(v233) = (((unsigned __int16)(v321 ^ 0xCCA2) >> 8)
                 - 248360646
                 - (((v321 ^ 0x33C8CCA2) >> 7) & 0x74)) ^ *(_DWORD *)&v235[4
                                                                         * (((unsigned __int16)(v321 ^ 0xCCA2) >> 8) ^ 0x6D)];
  v326 = (v244 >> 12) ^ *(_DWORD *)&v235[4 * (v322 ^ 0x6D)] ^ (v322 - 248360646 - ((2 * ((v319 >> 8) ^ 0x4FE6B4)) & 0x74));
  v327 = (v326 - 1503789221 - ((2 * v326) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v234 ^ 0xEFu));
  v328 = (v233 - 1503789221 - ((2 * v233) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v320 ^ 0x3Au));
  v329 = *(_DWORD *)(v238
                   + 4
                   * ((a16 ^ BYTE4(v421) ^ *(_BYTE *)(v246 + 4 * (HIBYTE(v312) ^ 0xC7)) ^ (v318 + 94 - ((2 * v318) & 0xBC))) ^ 0x96u));
  HIDWORD(v244) = v329 ^ 0x65DFF5B;
  LODWORD(v244) = v329 ^ 0xBFFFFFFF;
  LODWORD(v233) = *(_DWORD *)(v238 + 4 * (v321 ^ 0xA2u)) ^ (((unsigned __int16)(v234 ^ 0x6EF) >> 8)
                                                                             - 248360646
                                                                             - (((v234 ^ 0xC49406EF) >> 7) & 0x74)) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v234 ^ 0x6EF) >> 8) ^ 0x6D)] ^ (v324 - 1503789221 - ((2 * v324) & 0x4CBBFEB6));
  HIDWORD(v244) = (v244 >> 29) ^ 0x6615DA09;
  LODWORD(v244) = HIDWORD(v244);
  v330 = (v244 >> 3) - 248360646 - ((2 * (v244 >> 3)) & 0xE264A274);
  v331 = *(_DWORD *)&v242[4 * ((v234 ^ 0xC49406EF) >> 16)];
  HIDWORD(v244) = v331 ^ 0x37;
  LODWORD(v244) = v331 ^ 0x57AAE000;
  v332 = v244 >> 12;
  v333 = *(_DWORD *)&v242[4 * ((v321 ^ 0x33C8CCA2) >> 16)];
  HIDWORD(v244) = v333 ^ 0x37;
  LODWORD(v244) = v333 ^ 0x57AAE000;
  v334 = HIDWORD(v474) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v321) ^ 0x17)) ^ (v327 + 2080042334 - ((2 * v327) & 0xF7F5DABC));
  v335 = BYTE1(v320);
  v336 = v330 ^ *(_DWORD *)&v235[4 * (BYTE1(v320) ^ 0xD1)] ^ (v244 >> 12);
  v337 = v474 ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v319) ^ 0x4F)) ^ v332;
  v338 = HIDWORD(v468) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v320) ^ 0x1B)) ^ (v233 + 2080042334 - ((2 * v233) & 0xF7F5DABC));
  LODWORD(v233) = *(_DWORD *)&v242[4 * (BYTE2(v338) ^ 0x7E)];
  HIDWORD(v244) = v233 ^ 0x37;
  LODWORD(v244) = v233 ^ 0x57AAE000;
  v339 = v244 >> 12;
  v340 = v337 ^ (v328 + 2080042334 - ((2 * v328) & 0xF7F5DABC));
  LODWORD(v233) = *(_DWORD *)&v242[4 * (BYTE2(v340) ^ 1)];
  LODWORD(v234) = *(_DWORD *)(v246 + 4 * (BYTE3(v234) ^ 0xE0)) ^ v548 ^ (v336 + 2080042334 - ((2 * v336) & 0xF7F5DABC));
  HIDWORD(v244) = v233 ^ 0x37;
  LODWORD(v244) = v233 ^ 0x57AAE000;
  v341 = ((v244 >> 12) - 1503789221 - ((2 * (v244 >> 12)) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238
                                                                                     + 4
                                                                                     * (v334 ^ 0xC6u));
  v342 = ((BYTE1(v334) ^ 0x71) - 248360646 - ((2 * ((v334 >> 8) ^ 0xF25B71)) & 0x74)) ^ *(_DWORD *)&v235[4 * (BYTE1(v334) ^ 0x1C)];
  v343 = (v342 + 2080042334 - ((2 * v342) & 0xF7F5DABC)) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v340) ^ 0x1F));
  LODWORD(v233) = *(_DWORD *)&v242[4 * (BYTE2(v334) ^ 0x5B)];
  HIDWORD(v244) = v233 ^ 0x37;
  LODWORD(v244) = v233 ^ 0x57AAE000;
  LODWORD(v233) = v244 >> 12;
  v344 = v343 - 1503789221 - ((2 * v343) & 0x4CBBFEB6);
  v345 = v335 ^ 0x73F4E0AF ^ v234;
  v346 = *(_DWORD *)&v242[4 * BYTE2(v345)];
  HIDWORD(v244) = v346 ^ 0x37;
  LODWORD(v244) = v346 ^ 0x57AAE000;
  v347 = v244 >> 12;
  HIDWORD(v244) = v339 ^ ((BYTE1(v340) ^ 0x81) - 248360646 - ((v340 >> 7) & 0x74)) ^ 0xD678EAEF ^ *(_DWORD *)&v235[4 * (BYTE1(v340) ^ 0xEC)];
  LODWORD(v244) = HIDWORD(v244);
  LODWORD(v244) = (v244 >> 11) ^ __ROR4__(*(_DWORD *)(v246 + 4 * (HIBYTE(v334) ^ 0xF2)) ^ 0xD9E0B6E0, 11) ^ 0xD490839A;
  HIDWORD(v244) = v244;
  LODWORD(v234) = HIDWORD(v407) ^ v421 ^ *(_DWORD *)(v238 + 4 * (v340 ^ 0xB8u)) ^ ((BYTE1(v338) ^ 0xAA) - 248360646 - 2 * ((BYTE1(v338) ^ 0xAA) & 0x3F ^ (v338 >> 8) & 5)) ^ *(_DWORD *)(v246 + 4 * (BYTE3(v234) ^ 0x57)) ^ *(_DWORD *)&v235[4 * (BYTE1(v338) ^ 0xC7)] ^ v233;
  v348 = HIDWORD(v463) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v338) ^ 0x96)) ^ (BYTE1(v345)
                                                                          - 248360646
                                                                          - ((v345 >> 7) & 0x74)) ^ *(_DWORD *)&v235[4 * (BYTE1(v345) ^ 0x6D)] ^ (v341 + 2080042334 - ((2 * v341) & 0xF7F5DABC));
  v349 = v463 ^ *(_DWORD *)(v238 + 4 * (v338 ^ 0x88u)) ^ v347 ^ v344;
  v350 = HIDWORD(v457) ^ *(_DWORD *)(v238 + 4 * v345) ^ ((v244 >> 21)
                                                                          - 1503789221
                                                                          - ((2 * (v244 >> 21)) & 0x4CBBFEB6));
  LODWORD(v233) = *(_DWORD *)&v242[4 * (BYTE2(v234) ^ 0x4C)];
  HIDWORD(v244) = v233 ^ 0x37;
  LODWORD(v244) = v233 ^ 0x57AAE000;
  LODWORD(v233) = v244 >> 12;
  v351 = *(_DWORD *)&v235[4 * (BYTE1(v348) ^ 0x96)] ^ ((BYTE1(v348) ^ 0xFB)
                                                     - 248360646
                                                     - ((2 * ((v348 >> 8) ^ 0x3EA2FB)) & 0x74));
  v352 = *(_DWORD *)&v242[4 * (BYTE2(v348) ^ 0xA2)];
  HIDWORD(v244) = v352 ^ 0x37;
  LODWORD(v244) = v352 ^ 0x57AAE000;
  v353 = (v351 - 1503789221 - ((2 * v351) & 0x4CBBFEB6)) ^ *(_DWORD *)(v238 + 4 * (v349 ^ 0x75u));
  v354 = (((unsigned __int16)(v349 ^ 0xF075) >> 8) - 248360646 - (((v349 ^ 0xB54AF075) >> 7) & 0x74)) ^ (v244 >> 12) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v349 ^ 0xF075) >> 8) ^ 0x6D)];
  v355 = (v354 + 2080042334 - ((2 * v354) & 0xF7F5DABC)) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v350) ^ 0xED));
  v356 = *(_DWORD *)(v246 + 4 * (BYTE3(v234) ^ 0x1A));
  LODWORD(v220) = *(_DWORD *)(v238 + 4 * (v234 ^ 0x6Au));
  v357 = *(_DWORD *)&v242[4 * (BYTE2(v350) ^ 0xAF)];
  LODWORD(v242) = *(_DWORD *)&v242[4 * (BYTE2(v349) ^ 0x4A)];
  HIDWORD(v244) = v242 ^ 0x37;
  LODWORD(v244) = v242 ^ 0x57AAE000;
  LODWORD(v242) = v355 - 1503789221 - ((2 * v355) & 0x4CBBFEB6);
  LODWORD(v234) = (v234 >> 8) ^ 0x1A4CD2;
  v358 = *(_DWORD *)&v235[4 * (v234 ^ 0x6D)];
  LODWORD(v235) = v457 ^ *(_DWORD *)(v238 + 4 * (v348 ^ 0x9Au)) ^ v233 ^ (((unsigned __int16)(v350 ^ 0x1D8F) >> 8)
                                                                                           - 248360645
                                                                                           + (~((v350 ^ 0xC9AF1D8F) >> 7) | 0xFFFFFF8B)) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v349) ^ 0x91)) ^ *(_DWORD *)&v235[4 * (((unsigned __int16)(v350 ^ 0x1D8F) >> 8) ^ 0x6D)];
  LODWORD(v234) = HIDWORD(v451) ^ (v234 - 248360646 - ((2 * v234) & 0x74)) ^ *(_DWORD *)(v246 + 4 * (HIBYTE(v348) ^ 0x3E)) ^ v358 ^ *(_DWORD *)(v238 + 4 * (v350 ^ 0x8Fu));
  v359 = v451 ^ v220 ^ v242;
  v360 = HIDWORD(v445) ^ v356 ^ (v357 >> 12) ^ (v357 << 20) ^ (v353 + 2080042334 - ((2 * v353) & 0xF7F5DABC));
  v361 = (char *)*(&off_24DE82D70 + v429) - 8;
  LODWORD(v242) = *(_DWORD *)&v361[4 * (BYTE1(v235) ^ 0x63)];
  v362 = *(_DWORD *)&v361[4
                        * (((unsigned __int16)(WORD2(v445) ^ v356 ^ (v357 >> 12) ^ (v353 - 4770 - ((2 * v353) & 0xDABC))) >> 8) ^ 0x59)];
  v363 = *(_DWORD *)&v361[4 * ((unsigned __int16)(v359 ^ 0x6F07) >> 8)];
  LODWORD(v246) = v234 ^ (v244 >> 12);
  v364 = *(_DWORD *)&v361[4 * (BYTE1(v246) ^ 0xE8)];
  v365 = (uint64_t)*(&off_24DE82D70 + HIDWORD(v429));
  v366 = (char *)*(&off_24DE82D70 + HIDWORD(a18)) - 12;
  LODWORD(v234) = *(_DWORD *)&v366[4 * (HIBYTE(v359) ^ 0xEF)];
  v367 = *(_DWORD *)&v366[4 * (BYTE3(v246) ^ 0x3F)];
  LODWORD(v220) = *(_DWORD *)&v366[4 * (HIBYTE(v360) ^ 0x9E)];
  v368 = *(_DWORD *)(v365 + 4 * (v359 ^ 7u)) ^ v362 ^ 0xE9BC08DB;
  LODWORD(v233) = *(_DWORD *)&v366[4 * ((v235 >> 24) ^ 0xEC)];
  v369 = *(unsigned int *)(v53 - 128);
  v370 = (uint64_t)*(&off_24DE82D70 + (int)v369 - 898);
  LODWORD(v366) = *(_DWORD *)(v370 + 4 * (BYTE2(v360) ^ 0xC9u));
  LODWORD(v238) = *(_DWORD *)(v370 + 4 * (BYTE2(v359) ^ 0x2Au));
  v371 = v367 ^ (v368 + 389832077 - ((2 * v368) & 0x2E78BB1A));
  v372 = *(_DWORD *)(v370 + 4 * (BYTE2(v246) ^ 0xE8u));
  v373 = *(_DWORD *)(v365 + 4 * (v235 ^ 0xD9u));
  v374 = *(_DWORD *)(v365 + 4 * (v246 ^ 0x92u));
  v375 = *(unsigned int *)(v365 + 4 * (v360 ^ 0x75u));
  v376 = *(_DWORD *)(v370 + 4 * (BYTE2(v235) ^ 0x2Cu)) ^ (v371 - 328832002 - ((2 * v371) & 0xD8CCD7FC));
  LODWORD(v246) = *(_DWORD *)(v53 - 148) ^ v545 ^ (v376 - ((2 * v376) & 0xC11C5250) + 1619929384);
  v377 = (char *)*(&off_24DE82D70 + (int)v369 - 845) - 8;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + 8) = v377[BYTE3(v246) ^ 0xD7] ^ 0x35;
  v378 = ((v366 ^ 0xD3BB2342 ^ v363)
        + 389832077
        - ((2 * (v366 ^ 0xD3BB2342 ^ v363)) & 0x2E78BB1A)) ^ v233;
  v379 = (v378 - 698269593 - ((2 * v378) & 0xACC280CE)) ^ v374;
  v380 = *(_DWORD *)(v53 - 144) ^ HIDWORD(v545) ^ (v379 - ((2 * v379) & 0xA9A383F2) - 724450823);
  v381 = (char *)*(&off_24DE82D70 + (int)v369 - 1045) - 4;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 232)) = (v381[v380 ^ 0xC7] - 114) ^ 0x5F;
  v382 = (char *)*(&off_24DE82D70 + (int)v369 - 977) - 8;
  v383 = v382[BYTE1(v380) ^ 0x13];
  HIDWORD(v244) = v383 ^ 9;
  LODWORD(v244) = (v383 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + 6) = (v244 >> 30) ^ 0x40;
  v384 = ((v373 ^ 0x3A072B99 ^ v238) + 389832077 - ((2 * (v373 ^ 0x3A072B99 ^ v238)) & 0x2E78BB1A)) ^ v220;
  v385 = (v384 - ((2 * v384) & 0x7FBA9178) + 1071466684) ^ v364;
  v386 = *(unsigned int *)(v53 - 140);
  v387 = v386 ^ HIDWORD(v546) ^ (v385 - ((2 * v385) & 0x645DA3C4) + 841929186);
  v388 = v382[(unsigned __int16)(v386 ^ WORD2(v546) ^ (v385 - ((2 * v385) & 0xA3C4) - 11806)) >> 8];
  HIDWORD(v244) = v388 ^ 9;
  LODWORD(v244) = (v388 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 224)) = (v244 >> 30) ^ 0x7E;
  v389 = (char *)*(&off_24DE82D70 + (int)v369 - 979) - 8;
  v390 = *(_QWORD *)(v53 - 120);
  *(_BYTE *)(v390 + 9) = v389[BYTE2(v246) ^ 0xFBLL] ^ 0xC6;
  v391 = ((v242 ^ 0x28E11531 ^ v234)
        - 328832002
        - ((2 * (v242 ^ 0x28E11531 ^ v234)) & 0xD8CCD7FC)) ^ v372;
  v392 = v375 ^ (v391 - 698269593 - ((2 * v391) & 0xACC280CE));
  v393 = *(_DWORD *)(v53 - 136) ^ v546 ^ (v392 - ((2 * v392) & 0x4AE930CE) + 628398183);
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 184)) = v389[BYTE2(v393) ^ 0xB8] ^ 0x15;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 256)) = (v381[v246 ^ 0x1BLL] - 114) ^ 0x7D;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 240)) = v389[BYTE2(v380) ^ 3] ^ 0x6B;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 200)) = v377[HIBYTE(v380) ^ 0x6DLL] ^ 0xCD;
  v394 = v382[BYTE1(v246) ^ 0x92];
  HIDWORD(v244) = v394 ^ 9;
  LODWORD(v244) = (v394 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 168)) = (v244 >> 30) ^ 0xD2;
  v395 = *(_QWORD *)(v53 - 208);
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + v395) = v377[BYTE3(v387) ^ 0x53] ^ 0x21;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 192)) = (v381[v387 ^ 0x95] - 114) ^ 0xAF;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 248)) = (v381[v393 ^ 0x64] - 114) ^ 0x27;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 176)) = v377[HIBYTE(v393) ^ 0x6ELL] ^ 0xB7;
  v396 = v382[BYTE1(v393) ^ 0x1FLL];
  HIDWORD(v244) = v396 ^ 9;
  LODWORD(v244) = (v396 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 216)) = (v244 >> 30) ^ 0x58;
  *(_BYTE *)(*(_QWORD *)(v53 - 120) + *(_QWORD *)(v53 - 160)) = v389[BYTE2(v387) ^ 0xC8] ^ 0x44;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(a49 + 8 * ((1583 * ((((_DWORD)v395 + 1070254924 - ((2 * (_DWORD)v395 + 32) & 0x7F959698) + 16) ^ 0x3FCACB4Cu) < v445)) ^ ((int)v369 - 567))) - 8))(v386, 109, v375, v390, 3596697703, v387, v369, 9, a2, v398, v399, v400, v401, v402, v404, v406, v407, v410, v413,
           v416,
           v419,
           v421,
           a16,
           a17,
           a18,
           v429,
           v435,
           v439,
           v445,
           v451,
           v457,
           v463,
           v468,
           v474,
           v478,
           v483,
           v488,
           v494,
           v500,
           v505,
           v510,
           v516,
           v522,
           v527,
           v530,
           v535,
           v538,
           v540,
           v542,
           v543,
           v544,
           v545,
           v546,
           v548);
}

void sub_21B51174C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,int a59,int a60,int a61)
{
  uint64_t v61;

  *(_DWORD *)(v61 - 136) = a58 ^ 0xFE46C34B;
  *(_DWORD *)(v61 - 148) = a60 ^ 0xDBD74887;
  *(_DWORD *)(v61 - 140) = a61 ^ 0x4638181A;
  *(_DWORD *)(v61 - 144) = a59 ^ 0x2D8D5EE5;
  JUMPOUT(0x21B50FA74);
}

uint64_t sub_21B5117A0(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (v3 ^ (103 * (v2 == a2))))
                            - ((v3 - 440) ^ 0xFFFFFFFFFFFFF8B1)
                            - 533 * (v3 ^ 0x521u)))();
}

uint64_t sub_21B5117E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v6
                                                             + 8 * ((252 * ((((a4 - 320) ^ 0x223) & v5) != 0)) ^ a4)))(a1, a2, (v4 - a2));
}

uint64_t sub_21B511814(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  int v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  uint64_t v74;
  int8x16x4_t v76;

  *(_DWORD *)(v64 - 128) = v60;
  v65 = ((a6 - 4) ^ 0xFFFFFDDF) & v60;
  v66 = -a2;
  *(_DWORD *)(v64 - 136) = v65;
  v67 = a1 + v62;
  v68 = a1 + v62 - 5;
  v69 = v67 - 4;
  v70 = v67 - 3;
  v71 = v67 - 2;
  v72 = v67 - 1;
  v73 = v67;
  v74 = (v66 + v67 + v61);
  v76.val[0].i64[0] = v74 & 0xF;
  v76.val[0].i64[1] = ((_BYTE)v66 + v59 + (_BYTE)a6 - 17) & 0xF;
  v76.val[1].i64[0] = ((_BYTE)v66 + v73) & 0xF;
  v76.val[1].i64[1] = ((_BYTE)v66 + v72) & 0xF;
  v76.val[2].i64[0] = ((_BYTE)v66 + v71) & 0xF;
  v76.val[2].i64[1] = ((_BYTE)v66 + v70) & 0xF;
  v76.val[3].i64[0] = ((_BYTE)v66 + v69) & 0xF;
  v76.val[3].i64[1] = ((_BYTE)v66 + v68) & 0xF;
  *(int8x8_t *)(v63 - 7 + v74) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v63 - 7 + v74), *(int8x8_t *)(v58 + v76.val[0].i64[0] - 7)), veor_s8(*(int8x8_t *)(v56 + v76.val[0].i64[0] - 7), *(int8x8_t *)(v57 + v76.val[0].i64[0] - 7)))), (int8x8_t)0xE5E5E5E5E5E5E5E5), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v76, (int8x16_t)xmmword_21B567BE0), (int8x8_t)0x505050505050505)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a56
                                                     + 8
                                                     * (((4 * (v66 != 8 - v65)) | (8 * (v66 != 8 - v65))) ^ (a6 - 4)))
                                         - 4))((__n128)xmmword_21B567BE0);
}

void sub_21B511958()
{
  JUMPOUT(0x21B511880);
}

uint64_t sub_21B511980()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((((v0 + 610221412) & 0xDBA0C4AB ^ 0xFFFFFFDD)
                                                + ((v0 - 520897439) & 0x1F0C45AE))
                                               * (*(_DWORD *)(v2 - 128) == *(_DWORD *)(v2 - 136))) | v0))
                            - 12))();
}

uint64_t sub_21B5119E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a3 - 1604417653);
  *(_BYTE *)(v9 + v11) ^= *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)(v6 + (v11 & 0xF)) ^ *(_BYTE *)(v7 + (v11 & 0xF)) ^ (5 * (v11 & 0xF)) ^ 0xE5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((47 * (a3 - 1 == v5)) ^ (a5 - 534))) - 12))();
}

void sub_21B511A4C()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 381838871)
    v1 = -611232798;
  else
    v1 = 611190842;
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_21B511AB0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21B511B00@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  unsigned int v4;

  *(_DWORD *)(*(_QWORD *)(a2 + 96) + 24) = v3;
  v4 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 1288606724) & 0xDDFF4890) - 1788416438;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2
                                                     + 8
                                                     * ((29
                                                       * (((2 * v4) & 0x7FE3EFFE ^ 0x5DE34890)
                                                        + (v4 ^ 0xD10E53B7)
                                                        - 33646448 == 1039175823)) ^ 0x2ADu))
                                         - 8))(0);
}

uint64_t sub_21B511B98()
{
  uint64_t v0;
  int v1;
  int v2;

  return (*(uint64_t (**)(void))(v0 + 8 * ((98 * ((v2 + v1 - 1072822271) >= 8)) ^ 0x7A7u)))();
}

uint64_t sub_21B511BFC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((119
                                          * (v5 - a1 - (unint64_t)((a4 - 1831) | 0x414u) + 1168 < (((a4 - 1957) | 0x334u) ^ 0x316uLL))) ^ (a4 - 638)))
                            - 4))();
}

uint64_t sub_21B511C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  unsigned int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (int)(((v9 < (((a7 - 592) | 0x430) ^ 0x654u))
                                               * (((a7 + 279722244) | 0x8212C220) ^ (v8 + 1971))) ^ a7))
                            - 4))();
}

uint64_t sub_21B511CAC@<X0>(int a1@<W2>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v7 = (a1 + v5);
  v8 = *(_OWORD *)(v4 + v7 - 15);
  v9 = *(_OWORD *)(v4 + v7 - 31);
  v10 = a3 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1097 * (((a2 + 1832977000) | 0x115) - 789 == (v6 & 0xFFFFFFE0))) ^ (a2 + 1832976831)))
                            - 8))();
}

uint64_t sub_21B511D18(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v8 + 8 * (a8 ^ (1144 * (v9 != a4))))
                                         + a2
                                         - (((a8 - 817) | 0x488u)
                                          - a5
                                          - 789)))(0);
}

uint64_t sub_21B511D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  char v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((a7 ^ 0x48A) + 1646) ^ 0x55F ^ (137 * (a7 ^ 0x48A))) * ((v8 & 0x18) == 0)) ^ a7))
                            - 12))();
}

uint64_t sub_21B511D94@<X0>(int a1@<W0>, int a2@<W3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  *(_QWORD *)(a3 - 7 + v9 + v8 + v6 - a2 + ((344 * (a1 ^ 0x676)) ^ (v5 - 432))) = *(_QWORD *)(v4 - 7 + v9 + v8 + v6 - a2 + ((344 * (a1 ^ 0x676)) ^ (v5 - 432)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((241 * (a2 - (v7 & 0xFFFFFFF8) == -8)) ^ a1)) - 12))();
}

void sub_21B511DFC()
{
  JUMPOUT(0x21B511DD4);
}

uint64_t sub_21B511E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;
  int v8;

  return ((uint64_t (*)(_QWORD))(a2
                                         + *(_QWORD *)(v6 + 8 * (v7 ^ (432 * (v8 != a6))))
                                         - (v7 + 134)
                                         - ((v7 - 138478260) & 0x9AFFFFBB)
                                         + 826))(0);
}

uint64_t sub_21B511E54@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  char v7;

  *(_BYTE *)(a3 + (a1 + v6)) = *(_BYTE *)(v5 + (a1 + v6));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v3
                                                     + 8
                                                     * ((((a1 - 1 == v4) ^ (v7 + (a2 ^ 3))) & 1 | (2 * (((a1 - 1 == v4) ^ (v7 + (a2 ^ 3))) & 1))) ^ a2 ^ 3))
                                         - 12))(0);
}

uint64_t sub_21B511E94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  unsigned __int8 v5;
  int v6;
  int v7;

  *(_BYTE *)(a1 + (v7 + v4)) = *(_BYTE *)(v3 + (v7 + v4));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v1
                                                     + 8
                                                     * ((((v7 - 1 == v2) ^ v5) & 1 | (2 * (((v7 - 1 == v2) ^ v5) & 1))) ^ v6))
                                         - 12))(0);
}

void gLg1CWr7p()
{
  int v0[10];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 944348131 * ((909149724 - (v0 | 0x3630861C) + (v0 | 0xC9CF79E3)) ^ 0x6AD6DDAD)
        - 504207030;
  sub_21B532C9C(v0);
  __asm { BR              X8 }
}

uint64_t sub_21B511FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20,unsigned int a21,unsigned int a22)
{
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v24 = 2078219279 * ((817112243 - (&a19 | 0x30B424B3) + (&a19 | 0xCF4BDB4C)) ^ 0x15B14D38);
  a21 = v24 + 1054;
  a22 = 1517302066 - v24;
  HIDWORD(a19) = v24 + 1699736800;
  a20 = 1079066126 - v24;
  ((void (*)(unint64_t **))(*(_QWORD *)(v23 + 160) - 12))(&a19);
  LODWORD(a11) = (_DWORD)a19;
  a20 = (831981571 * ((((2 * &a19) | 0x60C31C16) - &a19 + 1335783925) ^ 0x29C05E2F)) ^ 0x250;
  a19 = &STACK[0x543300C3A69A2041];
  sub_21B524100((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8 * ((1041 * (a21 == -611232798)) | 0x324u)) - 12))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12);
}

uint64_t sub_21B5120F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unsigned int a22,uint64_t a23,unsigned int a24)
{
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  void (*v33)(uint64_t *);
  unsigned int v34;
  uint64_t v35;

  v31 = 460628867 * ((2 * (&a20 & 0x2798A600) - &a20 - 664315399) ^ 0x94F1DB84);
  LODWORD(a21) = v31 + 1975134435 * v27 + 1486647557;
  HIDWORD(a21) = v31 + v24 + 659;
  a20 = a17;
  ((void (*)(uint64_t *))(*(_QWORD *)(v30 + 8 * (v24 - 15)) - 12))(&a20);
  v32 = 235795823
      * ((-881070578 - (&a20 ^ 0x8DBF2EC3 | 0xCB7BEE0E) + (&a20 ^ 0x8DBF2EC3 | 0x348411F1)) ^ 0x2D96766B);
  a22 = v24 + 354 - v32;
  a21 = v25;
  a24 = v32 ^ ((v26 ^ 0xFEFEFBF9) + 1601961407 + ((2 * v26) & 0xFDFDF7F2));
  a23 = a17;
  v33 = *(void (**)(uint64_t *))(v30 + 8 * (v24 ^ 0xD9));
  v33(&a20);
  v34 = 235795823 * (&a20 ^ 0x94AD4959);
  a23 = a17;
  a24 = (((2 * a13) & 0xFDF5F774) - 545260034 + ((v24 + 2130377460) ^ a13)) ^ v34;
  a21 = a14;
  a22 = v24 + 354 - v34;
  v35 = ((uint64_t (*)(uint64_t *))v33)(&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v29 + 8 * ((436 * ((_DWORD)a20 == v28)) ^ v24)) - 4))(v35);
}

uint64_t sub_21B5122C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20,int a21,int a22,unint64_t *a23,unsigned int a24)
{
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;

  if ((a11 - 1423837950) >= 0x6AF5BC6)
    v28 = 824007587;
  else
    v28 = -710303426;
  v29 = ((2 * (&a19 & 0x790BC98) - &a19 - 126925980) ^ 0x2BCD116E) * v25;
  a20 = a16;
  a24 = 1783566965 - v29;
  a21 = v28 ^ v29;
  a22 = (v24 - 2024873281) ^ v29;
  a23 = &STACK[0x236606C007542B5A];
  v30 = sub_21B5327E0((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27
                                                      + 8
                                                      * (((a19 == (v24 ^ 0x119 ^ (v26 - 421)))
                                                        * (((v24 + 350) | 0x100) + 743)) ^ v24))
                                          - 4))(v30);
}

uint64_t sub_21B5123BC(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8 * (((v4 - 431) * (v3 < v2)) ^ v4)))(a1, a2);
}

uint64_t sub_21B512438@<X0>(uint64_t a1@<X8>, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char **);
  char *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;

  LODWORD(a14) = v16
               - 944348131 * ((&a12 & 0x54D754D0 | ~(&a12 | 0x54D754D0)) ^ 0x8310F61)
               - 24;
  v21 = (v16 + 242303486) & 0xF18EBFE7;
  a12 = &a7 + a1;
  a13 = a8;
  v19(&a12);
  LODWORD(a13) = v21
               + 3804331 * ((2 * (&a12 & 0x5416D5A0) - &a12 + 736701021) ^ 0x553C0FAB)
               + 627;
  a12 = v20;
  a14 = a8;
  a15 = v15;
  ((void (*)(char **))(*(_QWORD *)(v18 + 8 * (int)(v21 - 828)) - 12))(&a12);
  v22 = 2 * &a12;
  LODWORD(a14) = v21 - 944348131 * (((v22 | 0x8FC29E3E) - &a12 - 1205948191) ^ 0xE4F8EB51) - 510;
  a12 = a3;
  a13 = a8;
  v19(&a12);
  HIDWORD(a12) = v21 - 1543737703 * (((v22 | 0x69282BB6) - &a12 + 1265363493) ^ 0xCA6045A7) - 85;
  a13 = a8;
  v23 = sub_21B5200C0((uint64_t)&a12);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8
                                            * (int)((((_DWORD)a12 == (((v21 - 159) | 1) ^ 0xDB9150C5))
                                                   * ((6 * (v21 ^ 0x3E4)) ^ 0x61E)) ^ v21)))(v23);
}

uint64_t sub_21B512614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15)
{
  int v15;
  int v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * (((a15 == v16) * ((66 * (v15 ^ 0x324)) ^ 0x608)) ^ v15)) - 4))();
}

uint64_t sub_21B51264C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v20;
  unsigned int v21;
  uint64_t v22;

  return ((uint64_t (*)(void))(*(_QWORD *)(v22
                                        + 8
                                        * ((1110
                                          * ((((a20 ^ v21) > a13) ^ (((v20 - 57) & 0xD7) - 1)) & 1)) ^ v20))
                            - 4))();
}

uint64_t sub_21B5126A4()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((1856
                                * ((((v0 - 767) ^ 0x7FBD572A) & (2 * (v1 - ((2 * v1) & 0x236AC5FC) - 1850383618)) ^ 0x232845EC)
                                 + ((v1 - ((2 * v1) & 0x236AC5FC) - 1850383618) ^ 0xAE6BC908)
                                 + ((121 * (v0 ^ 0x3C2)) ^ 0xDFB77DD3) != 529934994)) ^ v0)))();
}

uint64_t sub_21B51273C()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(_QWORD, uint64_t))(*(_QWORD *)(v3
                                                              + 8
                                                              * (v2 ^ (240 * ((v0 - 1071557622) < 8))))
                                                  - ((v2 + 987749167) & 0xFDF8EBCB ^ ((v2 - 535) | 0x287) ^ 0x38D8C9F1)))((v2 - 535) | 0x287u, v1);
}

uint64_t sub_21B5127B4(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1544
                                          * ((((unint64_t)(v1 - v2) < 0x20) ^ (a1 - 127 + a1 + 61 + 1)) & 1)) ^ a1))
                            - 4))();
}

uint64_t sub_21B512810(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v6
                                                     + 8
                                                     * (int)(((v4 + (((a4 & 0xD74C1FDB) + 2061027619) & 0xBDFFFB4E) - 766)
                                                            * (v5 < 0x20)) ^ a4 & 0xD74C1FDB))
                                         - 12))(0);
}

uint64_t sub_21B512868(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = v6 + ((a2 - v7) ^ (v4 + 315));
  v11 = *(_OWORD *)(v3 + v10 - 15);
  v12 = *(_OWORD *)(v3 + v10 - 31);
  v13 = v8 + v10;
  *(_OWORD *)(v13 - 15) = v11;
  *(_OWORD *)(v13 - 31) = v12;
  return (*(uint64_t (**)(void))(v9 + 8 * ((894 * ((v5 & 0xFFFFFFE0) == 32)) ^ (v2 + a2 + 631))))();
}

void sub_21B5128C0()
{
  JUMPOUT(0x21B51287CLL);
}

uint64_t sub_21B5128CC(int a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4 + 8 * (((((a3 - 1964690654) & 0x751AC9DE) - 186) * (v3 != a1)) ^ a3)))();
}

uint64_t sub_21B512900(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  char v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v6
                                                                      + 8
                                                                      * ((198
                                                                        * (((a3 - 97) ^ 0x23 ^ ((v4 & 0x18) == a3 - 965)) & 1)) ^ (a3 + 159)))
                                                          - 8))(a1, (v5 - a1), (a3 + 159 - v3 - 317));
}

uint64_t sub_21B512948(int a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 - 7 + (v8 + v9 + v7 + v5 - a1)) = *(_QWORD *)(v4
                                                                            - 7
                                                                            + (v8 + v9 + v7 + v5 - a1));
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((119 * (((a4 ^ 0xFFFFFDBF) & v6) != a1 + 8)) ^ a4 ^ 0x77))
                            - ((((a4 ^ 0x77) - 303) | 0x226u) ^ 0x32BLL)))();
}

void sub_21B5129B8()
{
  JUMPOUT(0x21B512990);
}

uint64_t sub_21B5129C4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((v6 - v4) ^ (v7 + 1101)) * (v5 != a4)) ^ v6))
                            - (((v6 - 615) | 6u) ^ 0xC2)))();
}

uint64_t sub_21B5129FC@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + (a1 + v5)) = *(_BYTE *)(v4 + (a1 + v5));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((a1 - 1 != a3) * (((a2 + v3 - 611) | 2) ^ 0xAC)) ^ (a2 + v3)))
                            - 4))();
}

uint64_t sub_21B512A3C()
{
  int v0;
  int v1;
  unsigned int v2;
  int v3;
  void (*v5)(unsigned int *);
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v8 = (v0 + 1099) ^ (((((2 * &v8) | 0xEBA9FE4) - &v8 + 2023927822) ^ 0x54FF1DF8) * v1);
  v9 = v6;
  v5(&v8);
  v8 = ((v0 ^ 0x3E2) + 493) ^ (((((&v8 | 0xBD6D8F6A) ^ 0xFFFFFFFE) - (~&v8 | 0x42927095)) ^ 0x9130229F)
                             * v1);
  v9 = v7;
  v5(&v8);
  return v3 ^ v2;
}

void sub_21B512B28(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8) ^ (235795823 * (((a1 | 0xF0A8912F) - (a1 & 0xF0A8912F)) ^ 0x6405D876));
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x70F4C230EE5E63EBLL) - 1284376108 >= 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x70F4C230EE5E63EBLL) - 1284376108;
  else
    v3 = 1284376108 - *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x70F4C230EE5E63EBLL);
  v2 = *(_QWORD *)a1;
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x70F4C230EE5E63EBLL) - 1284376108 >= 0)
    v4 = *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL) - 1284376108;
  else
    v4 = 1284376108 - *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL);
  v7 = *(_QWORD *)(a1 + 16);
  v6 = v1 + 241568881 * (((&v6 | 0x1D29E80E) - (&v6 & 0x1D29E80E)) ^ 0xCB38EC4C) - 1576;
  sub_21B4F2DA8((uint64_t)&v6);
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  __asm { BR              X15 }
}

uint64_t sub_21B512CA8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  _BOOL4 v16;

  v11 = v3 - 1970387928;
  v12 = 2 * (v9 ^ 0x6A3);
  v13 = 4 * (v6 + v4);
  v14 = v7
      + 690734871
      + (*(_DWORD *)(*(_QWORD *)(v10 - 0x70F4C230EE5E63E7) + v13) ^ v8)
      + (*(_DWORD *)(*(_QWORD *)(a2 - 0x70F4C230EE5E63E7) + v13) ^ v8);
  *(_DWORD *)(*(_QWORD *)(a1 - 0x70F4C230EE5E63E7) + v13) = v14 + v8 - ((v14 << (v12 - 93)) & v5);
  v16 = v6 + 324739795 < 177095720 && v6 + 324739795 >= v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1520 * v16) ^ v12)) - 4))();
}

uint64_t sub_21B512DB8()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v6;

  v6 = v4 + 344499211 > (int)((v2 + 2027976984) & 0x871F87B6 ^ 0xBBBC0D2) || v4 + 344499211 < v3 - 1950628511;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((v6 * ((v2 ^ v1) - 801)) ^ v2)) - 8))();
}

uint64_t sub_21B512E1C@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  _BOOL4 v19;

  v13 = v6 - 346;
  v14 = v6 - 1273;
  v15 = 4 * (v9 + v7);
  v16 = v10 + v3 + v13 + (*(_DWORD *)(*(_QWORD *)(v12 - 0x70F4C230EE5E63E7) + v15) ^ v11) - 1458;
  *(_DWORD *)(*(_QWORD *)(a2 - 0x70F4C230EE5E63E7) + v15) = v16 + v11 - (v8 & (2 * v16));
  v17 = v9 + 1 + v4;
  v19 = v17 <= a1 + 1166 && v17 >= v5;
  return ((uint64_t (*)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)(v2 + 8 * ((1776 * v19) ^ v14)) - 8))(0x7F7DAFFFAF3FD717, 0x15E7FAE2ELL, 0xABC7F0C279EBF000);
}

uint64_t sub_21B512EE4()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 - 367596361 < (int)(v3 + 1632243213);
  if (v2 - 367596361 < -515240435 != v3 > ((v1 + 158887603) & 0xF6878FBF ^ 0x1EB5F5D7))
    v4 = v3 > ((v1 + 158887603) & 0xF6878FBF ^ 0x1EB5F5D7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((747 * v4) ^ v1)) - ((v1 - 786) | 0x153u) + 1003))();
}

uint64_t sub_21B512F74@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  int v18;
  _BOOL4 v19;

  v15 = v14 > a1;
  v16 = 4 * (v11 + v9);
  v17 = v4 + v12 + (*(_DWORD *)(*(_QWORD *)(a3 - 0x70F4C230EE5E63E7) + v16) ^ v13);
  *(_DWORD *)(*(_QWORD *)(a2 - 0x70F4C230EE5E63E7) + v16) = v13
                                                            + ((v7 + 1388288378) & 0xAD4066B7)
                                                            + v17
                                                            - (v10 & (2 * v17))
                                                            - 1061;
  v18 = v11 + 1 + v5;
  LODWORD(v16) = v15 ^ (v18 < v6);
  v19 = v18 < v8;
  if (!(_DWORD)v16)
    v15 = v19;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1601 * !v15) ^ v7)) - 8))();
}

uint64_t sub_21B513068()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8 * ((425 * ((((v2 + 1) ^ (v1 == 0x2B45A0C2292BC717)) & 1) == 0)) ^ v2))
                            - 4))();
}

void sub_21B5130A8(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;

  *(_DWORD *)(*(_QWORD *)(a1 - 0x70F4C230EE5E63E7) + 4 * ((((v3 + 735) | 8) ^ (v4 - 1284)) + v6)) = v2 - ((2 * v2 - 1381469742) & v5) - 837984059;
  *(_DWORD *)(a1 - 0x70F4C230EE5E63EBLL) = (((v6 + 1 + v4) * (v1 - 1122738496)) ^ 0xDFFF46BF)
                                         + 1821294445
                                         + ((2 * (v6 + 1 + v4) * (v1 - 1122738496)) & 0xBFFE8D7E);
}

void sub_21B513188(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) ^ (69008221 * ((a1 - 1655620505 - 2 * (a1 & 0x9D513C67)) ^ 0x4EF36E6D));
  __asm { BR              X9 }
}

uint64_t sub_21B51323C(_QWORD *a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((921 * (*(_DWORD *)(*a1 + v4) == v1)) ^ v3))
                            - ((v3 - 1050416160) & 0x3E9C16FF)
                            + 1139))();
}

uint64_t sub_21B513284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t result;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v6 = a1;
  v7 = v1;
  v5 = v2
     - 157
     + 1224239923
     * (((&v5 | 0xFE4D7CD9) - &v5 + (&v5 & 0x1B28320)) ^ 0xCFE810E)
     + 191;
  result = sub_21B522F20((uint64_t)&v5);
  *v3 = -1726215080 - *v3;
  return result;
}

void sub_21B51342C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 1178560073 * ((2 * (a1 & 0x8EA88996) - a1 + 1901557353) ^ 0xC2E4E8A8);
  __asm { BR              X9 }
}

uint64_t sub_21B5134D4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8 * ((1296 * (*(_DWORD *)(v2 - 0x4FF269813004C2D3) == -611232798)) ^ v1))
                            - ((v1 + 1145) ^ 0x5EBLL)))();
}

uint64_t sub_21B513520@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = v2 - 147 + *(_DWORD *)(v1 - 0x4FF269813004C2DBLL) + 2018674437;
  v4 = *(_DWORD *)(v1 - 0x4FF269813004C2DFLL) + 916746163;
  v5 = v3 < 0x7A8308EB;
  v6 = v3 > v4;
  if (v5 != v4 < 0x7A8308EB)
    v6 = v5;
  return (*(uint64_t (**)(void))(a1 + 8 * ((v6 * ((v2 - 1145) ^ 0x2E4)) ^ v2)))();
}

uint64_t sub_21B5135B4@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;

  v7 = *(_QWORD *)(v5 - 0x4FF269813004C2EBLL);
  v8 = *(unsigned __int8 *)(v7 + (v4 - 36732055)) ^ 0xE5;
  v9 = ((*(unsigned __int8 *)(v7 + (v4 - 36732058)) ^ 0xE5) << 24) | ((*(unsigned __int8 *)(v7 + (v4 - 36732057)) ^ 0xE5) << 16) | ((*(unsigned __int8 *)(v7 + (v4 - 36733740 + a2 + 320)) ^ (((a2 - 10) | 0x24) + 119)) << 8) | v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * ((212
                                          * (((v3 + v9 - 2 * (v9 & 0x5B9153FA ^ v8 & 0x18) + 0x1000000) & 0xFFFFFF ^ 0x9153E2)
                                           - (v6
                                            + *(_DWORD *)(a1 + 32)) != -519546008)) ^ a2))
                            - 12))();
}

void sub_21B513698()
{
  _DWORD *v0;

  *v0 = 611190999;
}

uint64_t sub_21B513850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;
  int v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 8) - 0x3F1580AD5A7A96D0) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((710 * (*v2 == v3)) ^ v4)) - 12))();
}

uint64_t sub_21B513890@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = (a2 - 208) ^ 0x1F0u;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) - 0x3F1580AD5A7A96D0) = v6 + v5 + v7 - 358;
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (int)((710 * (*v3 == v4)) ^ v7)) - 12))();
}

void sub_21B5138EC(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x27D4077E41C0C6A0) = v3;
  *v1 = v2;
  JUMPOUT(0x21B513848);
}

void sub_21B51390C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 - 1224239923 * ((2 * (a1 & 0x200B205B) - (_DWORD)a1 - 537600092) ^ 0x2D472273);
  __asm { BR              X11 }
}

uint64_t sub_21B5139E0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((((v2 == 0) ^ v0) & 1) * (v0 - 239)) ^ v0)) - 4))();
}

uint64_t sub_21B513A14()
{
  int v0;
  uint64_t v1;
  _DWORD *v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((193 * (*v2 < 0x15u)) ^ v0 ^ 0x54Cu))
                            - (((v0 ^ 0x54Cu) - 1019) ^ 0x4ELL)))();
}

uint64_t sub_21B513A54@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, unsigned int a4, int a5, unint64_t *a6, int a7)
{
  uint64_t (*v7)(uint64_t *);
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v12 = ((&a3 + 1305377834 - 2 * ((unint64_t)&a3 & 0x4DCE7C2A)) ^ 0xBF7D81FD) * a1;
  a7 = (((2 * v11) & 0x3FCDDFFA) - 1377847088 + ((3 * (v10 ^ 0x1AA) + 1608969178) ^ v11)) ^ v12;
  a6 = &STACK[0x4670A1604A080045];
  a3 = v8;
  a4 = v12 ^ 0xE567BFEE;
  a5 = v12 + v10 + 693;
  v13 = v7(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((898 * (*(_DWORD *)(v8 - 0x4FF269813004C2D3) == -611232798)) ^ v10))
                                          - 12))(v13);
}

uint64_t sub_21B513B44()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((759
                                          * (((2 * (v2 - (v3 & 0x41A39812) + 550620169)) & 0x3BDE5FF0 ^ 0x1821810)
                                           + ((v2 - (v3 & 0x41A39812) + 550620169) ^ 0x7D3EE3F1)
                                           + ((v1 + 2098862833) & 0x82E5E753 ^ 0xBE7DDA50) != ((v1 + 856) ^ 0x1C6D0D1B))) ^ v1))
                            - 12))();
}

uint64_t sub_21B513BE4()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * ((((v2 - 574) ^ 0x44D) * ((v1 - 1575956472) > 7)) ^ v2))
                                          - 8))(v0);
}

uint64_t sub_21B513C2C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * (((v2 + 749 + ((v2 - 320263222) & 0x1316D1F7) + 3)
                                                        * ((unint64_t)(v4 - v0 + 4) > 0x1F)) ^ v2))
                                          - 8))(v1);
}

uint64_t sub_21B513C78(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 >= (a3 ^ 0x5DDu)) * (a3 ^ 0x67C)) ^ a3)))();
}

uint64_t sub_21B513CAC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  uint64_t v16;
  int8x16_t v17;
  int8x16_t v18;

  v9.i64[0] = 0xCACACACACACACACALL;
  v9.i64[1] = 0xCACACACACACACACALL;
  v10.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v10.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v11 = (v6 + v5);
  v12 = vrev64q_s8(*(int8x16_t *)(v4 + v11 - 15));
  v13 = vextq_s8(v12, v12, 8uLL);
  v14 = vrev64q_s8(*(int8x16_t *)(v4 + v11 - 31));
  v15 = vextq_s8(v14, v14, 8uLL);
  v16 = v3 + v11;
  v17 = vrev64q_s8(vaddq_s8(vsubq_s8(v13, vandq_s8(vaddq_s8(v13, v13), v9)), v10));
  *(int8x16_t *)(v16 - 15) = vextq_s8(v17, v17, 8uLL);
  v18 = vrev64q_s8(vaddq_s8(vsubq_s8(v15, vandq_s8(vaddq_s8(v15, v15), v9)), v10));
  *(int8x16_t *)(v16 - 31) = vextq_s8(v18, v18, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((111 * ((a3 ^ 0x5DD) == (v7 & 0xFFFFFFE0))) ^ ((a3 ^ 0x1DE) + 28)))
                            - 12))();
}

void sub_21B513D60()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 4) = 611190843;
}

void sub_21B513FFC()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE v2[1208];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v2[qword_2551854B0 + qword_255184948];
  qword_2551854B0 = (1209664481 * v0) ^ 0xD2F218D37B7E7FAFLL;
  qword_255184948 = 1209664481 * (v0 ^ 0xD2F218D37B7E7FAFLL);
  *(_DWORD *)*(&off_24DE82D70
             + ((-31 * ((qword_255184948 - qword_2551854B0) ^ 0xAF)) ^ byte_21B567AC0[byte_21B564200[(-31 * ((qword_255184948 - qword_2551854B0) ^ 0xAF))] ^ 0x16])
             - 33) = -611232798;
  v1 = ((uint64_t (*)(uint64_t, uint64_t))*(&off_24DE82D70
                                                  + ((-31
                                                                                   * (qword_2551854B0 ^ 0xAF ^ qword_255184948)) ^ byte_21B55FB50[byte_21B55C490[(-31 * (qword_2551854B0 ^ 0xAF ^ qword_255184948))] ^ 0x4F])
                                                  + 90))(512, 1509315540);
  *(_QWORD *)*(&off_24DE82D70
             + ((-31 * (qword_2551854B0 ^ 0xAF ^ qword_255184948)) ^ byte_21B55FE50[byte_21B55C790[(-31 * (qword_2551854B0 ^ 0xAF ^ qword_255184948))] ^ 0xC8])
             - 85) = v1;
  __asm { BR              X8 }
}

void sub_21B5141AC()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void sub_21B51B600(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  _BOOL4 v5;

  v1 = 460628867 * ((-601098620 - (a1 | 0xDC2BF684) + (a1 | 0x23D4097B)) ^ 0x6F428B06);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF269813004C2DFLL) + 1136581150;
  v3 = (*(_DWORD *)(a1 + 16) ^ v1) + 266784671;
  v4 = (v3 < 0x879D7356) ^ (v2 < 0x879D7356);
  v5 = v2 < v3;
  if (v4)
    v5 = v3 < 0x879D7356;
  __asm { BR              X11 }
}

uint64_t sub_21B51B714()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v0 ^ (8
                                               * (((((v0 ^ 0x6E1) + 400) ^ 0x193) & *(_DWORD *)(v1 - 0x4FF269813004C2D7)) != 146 * (v0 ^ 0x6E1) - 292))))
                            - 12))();
}

void sub_21B51B764()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 0x4FF269813004C2D3) = 611190838;
}

void sub_21B51BD9C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 235795823 * (a1 ^ 0x94AD4959);
  __asm { BR              X11 }
}

uint64_t sub_21B51BE40()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v0 ^ 0x53C ^ (174 * (v1 != 0))))
                            - ((((v0 ^ 0x53C) - 658) | 4u)
                             - 606)
                            + 548))();
}

uint64_t sub_21B51BE80()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v5 = ((v1 - 27) ^ 0x58A) + (*(_DWORD *)(v2 + 32) ^ v0) - 1585118170 > 0xFFFFFFBE;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((*(_BYTE *)(v3 - 0x4FF269813004C2D7) | v5) & 1 | (8
                                                                                              * ((*(_BYTE *)(v3 - 0x4FF269813004C2D7) | v5) & 1))) ^ v1))
                            - 4))();
}

uint64_t sub_21B51BEF4@<X0>(uint64_t (*a1)(uint64_t *)@<X8>, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v12 = 1224239923 * ((&a3 - 1391913244 - 2 * ((unint64_t)&a3 & 0xAD0916E4)) ^ 0x5FBAEB33);
  a3 = v8;
  a7 = (v10 - 1353994475) ^ v12;
  a6 = v7;
  a4 = v12 ^ 0xE5B08822;
  a5 = v12 + v11 - 235;
  v13 = a1(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v8 - 0x4FF269813004C2D3) == -611232798)
                                                        * (v11 - 149)) ^ v11))
                                          - 12))(v13);
}

uint64_t sub_21B51BFA4()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  v3 = v1 - ((((v2 - 970) | 0x71E) + 2 * v1 + 1124730065) & 0x4313C7B0) + 1125050912;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((27
                                          * (((2 * v3) & 0x7C3FF4FE ^ 0x4013C4B0) + (v3 ^ 0x1F9619A7) + 1340997100 != 235796587)) ^ (v2 - 423)))
                            - 8))();
}

uint64_t sub_21B51C040()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4
                                                      + 8 * (v3 ^ (102 * ((v1 + v0 + 1105200513) < 8))))
                                          - ((v3 - 941) ^ 0x578u)
                                          + 354))(v2);
}

uint64_t sub_21B51C094(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t))(v5 + 8 * ((199 * (v4 - v2 < ((26 * (a2 ^ 0x177u)) ^ 0x2D2uLL))) ^ a2)))(v3);
}

uint64_t sub_21B51C0D8(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((a3 - 202 + ((a3 + 975) | 0x20) - 1828) * (v3 > 0x1F)) ^ a3))
                            - 4))();
}

uint64_t sub_21B51C10C(int a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  int8x16_t v15;
  int8x16_t v16;

  v7.i64[0] = 0xCACACACACACACACALL;
  v7.i64[1] = 0xCACACACACACACACALL;
  v8.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v8.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v9 = (v4 + v2);
  v10 = vrev64q_s8(*(int8x16_t *)(v5 + v9 - 15));
  v11 = vextq_s8(v10, v10, 8uLL);
  v12 = vrev64q_s8(*(int8x16_t *)(v5 + v9 - 31));
  v13 = vextq_s8(v12, v12, 8uLL);
  v14 = v1 + v9;
  v15 = vrev64q_s8(vaddq_s8(vsubq_s8(v11, vandq_s8(vaddq_s8(v11, v11), v7)), v8));
  *(int8x16_t *)(v14 - 15) = vextq_s8(v15, v15, 8uLL);
  v16 = vrev64q_s8(vaddq_s8(vsubq_s8(v13, vandq_s8(vaddq_s8(v13, v13), v7)), v8));
  *(int8x16_t *)(v14 - 31) = vextq_s8(v16, v16, 8uLL);
  LODWORD(v14) = ((3 * (a1 ^ 0x351)) ^ 0x44B) == (v3 & 0xFFFFFFE0);
  return (*(uint64_t (**)(void))(v6 + 8 * (int)((v14 | (2 * v14)) ^ (a1 - 95))))();
}

void sub_21B51C1B4()
{
  _DWORD *v0;

  *v0 = 611190843;
}

void sub_21B51C660(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40)
     + 831981571
     * (((a1 ^ 0xAB7398F9 | 0x4D3BC5A5) - (a1 ^ 0xAB7398F9) + ((a1 ^ 0xAB7398F9) & 0xB2C43A5A)) ^ 0x7FE98D78);
  __asm { BR              X15 }
}

uint64_t sub_21B51C78C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (v2 >= 0)
    v4 = v2;
  else
    v4 = -v2;
  if (v1 >= 0)
    v5 = v1;
  else
    v5 = -v1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((((v0 + 505861814) & 0xE1D92DFF ^ 0xC9E) * (v4 > v5)) ^ v0))
                            - 14 * (v0 ^ 0x161u)
                            + 1458))();
}

uint64_t sub_21B51C7EC()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1259 * (v1 <= 76 * (v0 ^ 0x5B3u) - 858)) ^ (v0 - 587))) - 4))();
}

void sub_21B51C824(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)(a2 + v2) = 1284376108;
}

void sub_21B51D63C(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  unsigned __int8 v7;
  char v8;

  v2 = (qword_255184948 + qword_255184928) ^ (unint64_t)&v8;
  v3 = 1209664481 * v2 - 0x2D0DE72C84818051;
  v4 = 1209664481 * (v2 ^ 0xD2F218D37B7E7FAFLL);
  v5 = (-31 * (v3 ^ 0xAF ^ v4));
  v6 = byte_21B5679C0[v5];
  qword_255184928 = v3;
  v7 = byte_21B55C690[v6 ^ 0x7E];
  qword_255184948 = v4;
  ((void (*)(char *, void (*)()))*(&off_24DE82D70
                                            + ((-31 * (v3 ^ 0xAF ^ v4)) ^ v7)
                                            + 58))((char *)*(&off_24DE82D70+ ((-31 * (v3 ^ 0xAF ^ v4)) ^ byte_21B55FE50[byte_21B55C790[v5] ^ 0x93])+ 39)- 8, sub_21B5336D0);
  __asm { BR              X9 }
}

uint64_t sub_21B51D738@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))(a1 + 8 * ((1175 * (*(_QWORD *)(*(_QWORD *)(v1 + 1752) - 4) != 0)) ^ 0x2AEu)))();
}

uint64_t sub_21B51D760()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(v1 + 1176))(v0);
}

void pggRSNuJfiTW0g(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X9 }
}

uint64_t sub_21B51D808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  a16 = 944348131 * ((&a15 & 0x14974470 | ~(&a15 | 0x14974470)) ^ 0x48711FC1) - 504207030;
  v18 = sub_21B532C9C(&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16 + 8 * ((1183 * (a15 == -611232798)) ^ v17)) - 12))(v18);
}

uint64_t sub_21B51D898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, unsigned int a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  a16 = (831981571 * ((-1570993426 - (&a15 | 0xA25C8AEE) + (&a15 | 0x5DA37511)) ^ 0xC402A535)) ^ 0x250;
  a15 = &STACK[0x543300C3A69A2011];
  sub_21B524100((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * (((a17 == v17) * (v19 + 1092203846)) ^ 0x277))
                                                                                                - 12))(v20, v21, v22, v23, v24, v25, v26);
}

uint64_t sub_21B51D93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, unsigned int a17, unsigned int a18, unint64_t *a19, unsigned int a20)
{
  int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;

  v22 = 69008221 * ((((2 * &a15) | 0x155A514E) - &a15 + 1968363353) ^ 0x590F7AAD);
  a20 = -2036443760 - v22;
  a16 = a10;
  a17 = v22 ^ 0xD5A9A13E;
  a18 = v22 ^ 0x874EE385;
  a19 = &STACK[0x236606C007542B42];
  v23 = sub_21B5327E0((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((1241 * (a15 == v20)) ^ 0x320)) - 4))(v23);
}

uint64_t sub_21B51DA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, uint64_t a16, unsigned int a17, int a18)
{
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  a17 = v22
      - (((&a15 | 0xA5329F4A) - &a15 + (&a15 & 0x5ACD60B0)) ^ 0x62B3B04) * v20
      + 299;
  a15 = &STACK[0x509D13A7D8C2F408];
  a16 = a12;
  v23 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(v21 + 8 * (v22 ^ 0x18)) - 12))(&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8
                                                            * ((1656 * (a18 == (v22 ^ 0x3BC ^ (v18 - 800)))) ^ v22))
                                          - 12))(v23);
}

uint64_t sub_21B51DAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  int v12;
  uint64_t v13;
  int v14;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((737 * (a12 == v12)) ^ v14))
                            - ((v14 - 1066924318) & 0x3F97FBA1 ^ 0x32CLL)))();
}

uint64_t sub_21B51DB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, int a16, int a17, uint64_t a18, unint64_t *a19)
{
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  a16 = v22
      + 3804331 * ((&a15 + 2094478319 - 2 * ((unint64_t)&a15 & 0x7CD733EF)) ^ 0x2021619)
      + 1436;
  a15 = &STACK[0x48FEE254074E96AC];
  a18 = a12;
  a19 = &STACK[0x6C482493D26EC60D];
  v23 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(v21 + 8 * (v22 - 19)) - 12))(&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((448 * (a17 == v19)) ^ v22))
                                          - ((v22 + 356) | 0x120u)
                                          + 788))(v23);
}

uint64_t sub_21B51DBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16, uint64_t a17)
{
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  a16 = v19 - 1543737703 * ((2 * (&a15 & 0x2D37B548) - &a15 - 758625613) ^ 0xAC3C1ACF) + 724;
  a17 = a12;
  v20 = sub_21B5200C0((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * (((a15 == v17) * (v19 ^ 0x618)) ^ v19)) - 12))(v20);
}

uint64_t sub_21B51DC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  int v12;
  uint64_t v13;
  int v14;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13
                                        + 8 * (int)(((a12 == v12) * (((v14 + 1386091711) & 0xAD61EAE7) + 2115)) ^ v14))
                            - 5 * (v14 ^ 0x3Cu)
                            + 788))();
}

uint64_t sub_21B51DC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;

  v19 = (*(uint64_t (**)(_QWORD, uint64_t))(v18 + 8 * (v17 ^ 0xA1)))((((188 * (v17 ^ 0x40)) ^ (v15 - 236)) + (v17 ^ 0x363)) ^ a15, 691728023) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((223 * v19) ^ v17)) - 12))();
}

uint64_t sub_21B51DD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15)
{
  int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;

  v18 = (a15 ^ v15) - ((2 * (a15 ^ v15)) & 0xDDFF4890) - 285236152;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * (v17 ^ (2
                                                * ((((31 * (v17 ^ 0x205) - 743582481) & 0x2C5225BD ^ 0x7FE3EF62) & (2 * v18) ^ 0x5DE34890)
                                                 + (v18 ^ 0xD10E53B7)
                                                 - 33646448 == 1039175823))))
                            - 12))();
}

uint64_t sub_21B51DDA4(uint64_t a1)
{
  int v1;
  int v2;
  _DWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  void (*v8)(int *);
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  *v4 = a1;
  *v3 = v2;
  v6 = v1 + 475;
  v12 = v10;
  v11 = (v1 + 1141) ^ (69008221
                     * ((&v11 - 616109758 - 2 * ((unint64_t)&v11 & 0xDB46E942)) ^ 0x8E4BB48));
  v8(&v11);
  v11 = (v6 + 666) ^ (69008221 * ((&v11 & 0x11C0F576 | ~(&v11 | 0x11C0F576)) ^ 0x3D9D5883));
  v12 = v9;
  v8(&v11);
  return v5 ^ 0xDB9153E2;
}

void sub_21B51E20C(uint64_t a1, uint64_t a2)
{
  int v3;
  int v5;
  unint64_t *v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  v3 = 831981571 * ((&v5 + 781345321 - 2 * ((unint64_t)&v5 & 0x2E926229)) ^ 0xB733B20D);
  v7 = v3 - 1882357464;
  v6 = &STACK[0x520F56D3BDEB7E2B];
  v5 = v3 ^ 0x28D728C6;
  sub_21B4EE28C((uint64_t)&v5);
  __asm { BR              X9 }
}

uint64_t sub_21B51E3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;

  v16 = v13 + 1842917981 < (a13 - 1264378731);
  if ((a13 - 1264378731) < 0xC85F9D75 != v13 + 1842917981 < ((v14 - 170) ^ 0xC85F9D45))
    v16 = (a13 - 1264378731) < 0xC85F9D75;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((57 * !v16) ^ v14)) - 8))(4198314665);
}

uint64_t sub_21B51E420(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v20;

  v20 = a6 + (a5 ^ (a4 + 48));
  v15 = 831981571 * ((~((v14 - 120) | 0xB32103A3) + ((v14 - 120) & 0xB32103A3)) ^ 0xD57F2C78);
  *(_DWORD *)(v14 - 120) = v15 + a5 + 862;
  *(_DWORD *)(v14 - 104) = v15 + a13 + 705047227;
  *(_QWORD *)(v14 - 112) = a10;
  v16 = sub_21B4EE180(v14 - 120);
  v17 = *(_DWORD *)(v14 - 152) & 0x3F;
  *(_BYTE *)(v14 - 220 + (v17 ^ 3)) = 101;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13
                                                      + 8 * ((((v17 ^ 3) > 0x37) * (v20 - 108)) ^ a5))
                                          - 12))(v16);
}

uint64_t sub_21B51E504(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v3
                                                               + 8 * ((v2 + 753) ^ ((v1 == 63) | (4 * (v1 == 63)))))
                                                   - (((v2 - 596130067) & 0xFBB93CC7)
                                                    + 667877252)
                                                   + 1981))(a1, -315478184);
}

uint64_t sub_21B51E560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v7 - 1974) * ((v6 ^ 0x3Cu) > 7)) ^ v7))
                            - ((v7 - a6 - 825) ^ 0xD8310849)))();
}

uint64_t sub_21B51E598@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  char v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;

  *(_QWORD *)(v5 - 220 + a2 + a1) = 0xE5E5E5E5E5E5E5E5;
  v6 = ((v3 - 1478) ^ 0x20BLL) == (v2 & 0x38);
  return (*(uint64_t (**)(void))(v4 + 8 * (((4 * v6) | (16 * v6)) ^ (v3 - 1478))))();
}

uint64_t sub_21B51E5F0@<X0>(int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v12 = v4 < a2;
  *(_BYTE *)(v11 - 220 + (a4 + a1)) = *(_BYTE *)(v9 + (v5 + v10))
                                                  - ((*(unsigned __int8 *)(v9 + (v5 + v10)) << (v6 + 39)) & 0xCA)
                                                  - 27;
  v13 = v5 + 1 + a3;
  v14 = v12 ^ (v13 < a2);
  v15 = v13 < v4;
  if (!v14)
    v12 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((!v12 * v7) ^ v6)) - 8))();
}

uint64_t sub_21B51E664(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9 + 8 * (((v7 != v6) * (a6 + (v8 ^ (a4 + 177)) - 1098)) ^ v8)))();
}

uint64_t sub_21B51E6A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int32x4_t a30,int32x4_t a31,int32x4_t a32,int32x4_t a33)
{
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, __n128, __n128, __n128, __n128, __n128);
  const char *v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  int v48;
  int v49;
  int v50;
  int v51;
  uint8x16_t v52;
  uint16x8_t v53;
  int8x16_t v54;
  int8x16_t v55;
  uint16x8_t v56;
  int8x16_t v57;
  int8x16_t v58;
  uint8x16_t v59;
  uint16x8_t v60;
  uint16x8_t v61;
  uint8x16_t v62;
  int8x16_t v65;
  int8x16_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int v76;
  uint8x16_t v77;
  uint16x8_t v78;
  uint16x8_t v79;
  uint8x16_t v80;
  uint8x16_t v85;
  uint16x8_t v86;
  uint16x8_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  _DWORD *v92;
  int v93;
  unsigned int v94;
  int v95;
  unint64_t v96;
  int8x16x4_t v97;
  int8x16x4_t v98;

  v41 = (uint64_t (*)(uint64_t, uint64_t, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v35 + 8 * (a6 + v33 - 1120))
                                                                                         - 12);
  v42 = (const char *)(v40 - 220);
  v43 = (__n128)vdupq_n_s32(0x5B9153FAu);
  v44 = (__n128)vdupq_n_s32(0xDB9153E2);
  v45.n128_u64[0] = 0xE5E5E5E5E5E5E5E5;
  v45.n128_u64[1] = 0xE5E5E5E5E5E5E5E5;
  v46.n128_u64[0] = 0xCACACACACACACACALL;
  v46.n128_u64[1] = 0xCACACACACACACACALL;
  v47 = (__n128)vdupq_n_s32(0x5B9153E7u);
  a22 = 79;
  v48 = *(_DWORD *)(v40 - 144);
  v49 = *(_DWORD *)(v40 - 140);
  v50 = *(_DWORD *)(v40 - 136);
  v51 = *(_BYTE *)(v40 - 124) ^ 0xA4;
  if (v51 == 2)
  {
    v98 = vld4q_s8(v42);
    v76 = a6 + a4 - 211;
    v77 = (uint8x16_t)veorq_s8(v98.val[0], (int8x16_t)v45);
    v78 = vmovl_u8(*(uint8x8_t *)v77.i8);
    v79 = vmovl_high_u8(v77);
    v80 = (uint8x16_t)veorq_s8(v98.val[1], (int8x16_t)v45);
    _Q22 = vmovl_u8(*(uint8x8_t *)v80.i8);
    _Q21 = vmovl_high_u8(v80);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v85 = (uint8x16_t)veorq_s8(v98.val[2], (int8x16_t)v45);
    v86 = vmovl_high_u8(v85);
    v87 = vmovl_u8(*(uint8x8_t *)v85.i8);
    v98.val[0] = veorq_s8(v98.val[3], (int8x16_t)v45);
    v98.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v98.val[0]);
    v98.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[1]);
    v98.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[1].i8);
    v98.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v98.val[0].i8);
    v98.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[0]);
    v98.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[0].i8);
    v88 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v87.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v78.i8), 0x18uLL)), v98.val[0]);
    v89 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v87, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v78), 0x18uLL)), v98.val[3]);
    v90 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v86.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v79.i8), 0x18uLL)), v98.val[1]);
    v91 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v86, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v79), 0x18uLL)), v98.val[2]);
    v98.val[0] = veorq_s8(vandq_s8((int8x16_t)v88, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)v98.val & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v98.val[3] = veorq_s8(vandq_s8((int8x16_t)v89, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[3] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v98.val[1] = veorq_s8(vandq_s8((int8x16_t)v90, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[1] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v98.val[2] = veorq_s8(vandq_s8((int8x16_t)v91, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[2] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    a32 = vaddq_s32(vsubq_s32(v90, vaddq_s32((int32x4_t)v98.val[1], (int32x4_t)v98.val[1])), (int32x4_t)v44);
    a33 = vaddq_s32(vsubq_s32(v91, vaddq_s32((int32x4_t)v98.val[2], (int32x4_t)v98.val[2])), (int32x4_t)v44);
    a30 = vaddq_s32(vsubq_s32(v88, vaddq_s32((int32x4_t)v98.val[0], (int32x4_t)v98.val[0])), (int32x4_t)v44);
    a31 = vaddq_s32(vsubq_s32(v89, vaddq_s32((int32x4_t)v98.val[3], (int32x4_t)v98.val[3])), (int32x4_t)v44);
    v92 = (_DWORD *)&a30 + v39 + v37 + 16;
    v93 = *(v92 - 8) ^ *(v92 - 3);
    v94 = v34 + ((a6 + a4 + 713682730) & 0xD5760FF5) + v93 - ((2 * v93) & 0xB722A7C4) - 944;
    v95 = *(v92 - 16) ^ *(v92 - 14);
    HIDWORD(v96) = v95 ^ 0x5B9153E2 ^ v94;
    LODWORD(v96) = v95 ^ ~v94;
    *v92 = (v96 >> 31) + v34 - ((2 * (v96 >> 31)) & 0xB722A7C4);
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v35 + 8 * ((1996 * (v39 + 17 != v39 + 80)) ^ v76))
                                                     - 12))(1207959552, 1045);
  }
  else if (v51 == 1)
  {
    v97 = vld4q_s8(v42);
    v52 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v45);
    v53 = vmovl_u8(*(uint8x8_t *)v52.i8);
    v54 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v53.i8);
    v55 = (int8x16_t)vmovl_high_u16(v53);
    v56 = vmovl_high_u8(v52);
    v57 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v56.i8);
    v58 = (int8x16_t)vmovl_high_u16(v56);
    v59 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v45);
    v60 = vmovl_high_u8(v59);
    v61 = vmovl_u8(*(uint8x8_t *)v59.i8);
    v62 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v45);
    _Q26 = (int8x16_t)vmovl_high_u8(v62);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v62.i8);
    v65 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v70 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v45);
    v97.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v97.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[1]);
    v97.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v97.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[0]);
    v97.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8), 0x18uLL), v65), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v61.i8, 8uLL), v54));
    v97.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v97.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v61, 8uLL), v55));
    v97.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8), 0x18uLL), v70), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v60.i8, 8uLL), v57));
    v97.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v97.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v60, 8uLL), v58));
    v71 = (int32x4_t)veorq_s8(vandq_s8(v97.val[0], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v54 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v72 = (int32x4_t)veorq_s8(vandq_s8(v97.val[3], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v55 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v73 = (int32x4_t)veorq_s8(vandq_s8(v97.val[1], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v57 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v74 = (int32x4_t)veorq_s8(vandq_s8(v97.val[2], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v58 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    a32 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[1], vaddq_s32(v73, v73)), (int32x4_t)v44);
    a33 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[2], vaddq_s32(v74, v74)), (int32x4_t)v44);
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[0], vaddq_s32(v71, v71)), (int32x4_t)v44);
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[3], vaddq_s32(v72, v72)), (int32x4_t)v44);
    return ((uint64_t (*)(uint64_t, uint64_t, __n128))(*(_QWORD *)(v35
                                                                         + 8 * ((1432 * (v39 == 446849169)) ^ 0x1AAu))
                                                             - 12))(1207959552, 1045, v43);
  }
  else
  {
    *(_DWORD *)(v40 - 148) = 2 * (*(_DWORD *)(v40 - 148) ^ v38) + v38 - (v36 & (4 * (*(_DWORD *)(v40 - 148) ^ v38)));
    *(_DWORD *)(v40 - 144) = 2 * (v48 ^ v38) + v38 - (v36 & (4 * (v48 ^ v38)));
    *(_DWORD *)(v40 - 140) = 2 * (v49 ^ v38) + v38 - (v36 & (4 * (v49 ^ v38)));
    *(_DWORD *)(v40 - 136) = 2 * (v50 ^ v38) + v38 - (v36 & (4 * (v50 ^ v38)));
    return v41(1207959552, 1045, v43, v44, v45, v46, v47);
  }
}

uint64_t sub_21B51F5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, unsigned int a17, unsigned int a18)
{
  uint64_t v18;
  BOOL v19;

  if (a18 < a17 != (a15 + 138834642) < 0x62CD5DAA)
    v19 = (a15 + 138834642) < 0x62CD5DAA;
  else
    v19 = a15 + 138834642 > a18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * ((689 * ((v19 ^ 0x8F) & 1)) ^ 0x40D)) - 12))();
}

uint64_t sub_21B51F67C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;
  int v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                        + 8
                                                                        * ((15
                                                                          * (v7 + v4 + 63 >= (v5 ^ (a4 + 319) ^ 0x7D481CADu)
                                                                                           + v4)) ^ v5))
                                                            - 8))(a1, a2, 19);
}

uint64_t sub_21B51F6CC@<X0>(int a1@<W5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * (((a7
                                           + v9
                                           - (unint64_t)((((v8 - 805241281) | 0x8300845) ^ 0x7D481CADu) + v7) > 0xF)
                                          * (a1 + a2 + 171)) ^ v8))
                            - 8))();
}

uint64_t sub_21B51F72C@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W5>, unint64_t a4@<X6>, int a5@<W7>, int a6@<W8>, int8x16_t a7@<Q2>, int8x16_t a8@<Q3>)
{
  int v8;
  int8x16_t *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  *v9 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v11 + (v8 + v12)), vandq_s8(vaddq_s8(*(int8x16_t *)(v11 + (v8 + v12)), *(int8x16_t *)(v11 + (v8 + v12))), a8)), a7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((((((a6 ^ (a2 + 1)) * a1) ^ a4) != 16) * a5) ^ (a3 + a6 + 165)))
                            - 8))();
}

uint64_t sub_21B51F790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;

  *(_BYTE *)(v8 + v7) = *(_BYTE *)(v12 + (v6 + v13))
                      - ((*(_BYTE *)(v12 + (v6 + v13)) << ((a6 + v9 - 87) ^ 0x38)) & v14)
                      - 27;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((v7 != 63) * v10) ^ (a6 + v9 + 165))) - 8))();
}

uint64_t sub_21B51F7E4@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1
                                                      + 8
                                                      * (int)((((a1 - 315478184) > 0x37)
                                                             * (v2 ^ 0xD83109A1)) ^ (v2 + 667875509)))
                                          - 8))(-315478184);
}

void sub_21B51F83C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  char v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unsigned int v16;
  int v17;

  v7 = *(unsigned __int8 *)(v6 - 124) ^ 0xA4;
  if (v7 == 1)
  {
    v14 = *(_DWORD *)(v6 - 156);
    v13 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((v13 << (a6 + a4 + 115)) ^ 0x18) - ((16 * v13) & 0xC0) - 27;
    *(_BYTE *)(v6 - 163) = ((v13 >> 5) ^ 0xA4) - 2 * (((v13 >> 5) ^ 0xA4) & 0xE7 ^ (v13 >> 5) & 2) - 27;
    *(_BYTE *)(v6 - 162) = ((v13 >> 13) ^ 0x3A) - ((2 * ((v13 >> 13) ^ 0x3A)) & 0xCA) - 27;
    *(_BYTE *)(v6 - 161) = ((v13 >> 21) ^ 0x8A) - ((v13 >> 20) & 0xCA) - 27;
    HIDWORD(v15) = v14;
    LODWORD(v15) = v13 ^ 0x80000000;
    *(_BYTE *)(v6 - 160) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0xCA) - 27;
    *(_BYTE *)(v6 - 159) = ((v14 >> 5) ^ 0xF5) - 2 * (((v14 >> 5) ^ 0xF5) & 0xE7 ^ (v14 >> 5) & 2) - 27;
    *(_BYTE *)(v6 - 158) = ((v14 >> 13) ^ 0x4D) - 2 * (((v14 >> 13) ^ 0x4D) & 0xE7 ^ (v14 >> 13) & 2) - 27;
    v16 = v14 >> 21;
    v17 = (v14 >> 21) ^ 0x30;
    LOBYTE(v14) = v17 & 0x67;
    v12 = v17 - 27;
    v11 = 2 * (v14 ^ v16 & 2);
  }
  else
  {
    if (v7 != 2)
      goto LABEL_6;
    v8 = *(_DWORD *)(v6 - 156);
    v9 = *(_DWORD *)(v6 - 152);
    HIDWORD(v10) = v8;
    LODWORD(v10) = v9 ^ 0x80000000;
    *(_BYTE *)(v6 - 164) = ((a4 - 78) & 0x4F)
                         + ((v8 >> 21) ^ 0x30)
                         - 2 * (((v8 >> 21) ^ 0x30) & 0xE7 ^ (v8 >> 21) & 2)
                         - 98;
    *(_BYTE *)(v6 - 163) = ((v8 >> 13) ^ 0x4D) - 2 * (((v8 >> 13) ^ 0x4D) & 0xE7 ^ (v8 >> 13) & 2) - 27;
    *(_BYTE *)(v6 - 162) = ((v8 >> 5) ^ 0xF5) - ((2 * ((v8 >> 5) ^ 0xF5)) & 0xCA) - 27;
    *(_BYTE *)(v6 - 161) = (v10 >> 29) - ((2 * (v10 >> 29)) & 0xCA) - 27;
    *(_BYTE *)(v6 - 160) = ((v9 >> 21) ^ 0x8A) - ((v9 >> 20) & 0xCA) - 27;
    *(_BYTE *)(v6 - 159) = ((v9 >> 13) ^ 0x3A) - ((2 * ((v9 >> 13) ^ 0x3A)) & 0xCA) - 27;
    *(_BYTE *)(v6 - 158) = ((v9 >> 5) ^ 0xA4) - ((2 * ((v9 >> 5) ^ 0xA4)) & 0xCA) - 27;
    v11 = (16 * v9) & 0xC0;
    v12 = ((8 * v9) ^ 0x18) - 27;
  }
  *(_BYTE *)(v6 - 157) = v12 - v11;
LABEL_6:
  JUMPOUT(0x21B51E9B4);
}

uint64_t sub_21B51FCB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (v8 ^ (362 * (v6 == v7))))
                            - ((a6 + ((v8 - 1743781466) | 0x40210045u) - 423) ^ 0x2EDLL)))();
}

uint64_t sub_21B51FD04@<X0>(uint64_t a1@<X0>, int a2@<W3>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 220 + a3 + a1) = -27;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1015
                                          * (a3 - 3942570220 + (unint64_t)(a2 + v3 - 459 - 286) < 0x38)) ^ (v3 - 459)))
                            - 8))();
}

void sub_21B51FD50()
{
  JUMPOUT(0x21B51FD1CLL);
}

uint64_t sub_21B51FDBC@<X0>(char a1@<W0>, uint64_t a2@<X2>, unsigned int a3@<W8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v9 = *(_DWORD *)(v8 - 220 + 4 * ((v6 + v3) >> (((v4 - 82) | 1) ^ (a1 + 2))) + 72);
  *(_BYTE *)(a2 + (v6 + v3 + 1)) = (BYTE2(v9) ^ 0xA2) - ((2 * (BYTE2(v9) ^ 0xA2)) & 0xCA) - 27;
  *(_BYTE *)(a2 + (v6 + v3)) = (HIBYTE(v9) ^ 0x4F) - ((2 * (HIBYTE(v9) ^ 0x4F)) & 0xCA) - 27;
  *(_BYTE *)(a2 + (v6 + v3 + 2)) = (BYTE1(v9) ^ 0xEF) + (~(2 * (BYTE1(v9) ^ 0xEF)) | 0x35) - 26;
  *(_BYTE *)(a2 + (v6 + v3 + 3)) = v9 ^ 0xE7;
  v10 = *(_DWORD *)(v8 - 128) + 1583993915;
  v11 = v10 < a3;
  v12 = v6 + 1844239642 < v10;
  if (v6 + 1844239642 < a3 != v11)
    v12 = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((v12 * v5) ^ v4)) - 12))();
}

void sub_21B51FF58()
{
  JUMPOUT(0x21B51FF2CLL);
}

uint64_t sub_21B51FF64()
{
  return 0;
}

void sub_21B51FFA4(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)a1 ^ (1543737703 * ((a1 + 44110967 - 2 * (a1 & 0x2A11477)) ^ 0x7C55440B));
  v2 = *(_QWORD *)(a1 + 8);
  ((void (*)(char *, void (*)()))*(&off_24DE82D70 + (v1 ^ 0x2E)))((char *)*(&off_24DE82D70 + (v1 ^ 0x8B)) - 8, sub_21B5336D0);
  __asm { BR              X11 }
}

uint64_t sub_21B520058()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((*(_QWORD *)(*(_QWORD *)(v2 + 8 * (int)((v3 - 20) ^ 0x61)) - 4) != 0)
                                               * v0) ^ (v3 - 20)))
                            - (v3 ^ 0xC6)))();
}

uint64_t sub_21B520094@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 45)))(v1);
}

uint64_t sub_21B5200C0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) + 1543737703 * ((-2 - ((a1 | 0xF6A3585D) + (~(_DWORD)a1 | 0x95CA7A2))) ^ 0x77A8F7DE);
  return (*((uint64_t (**)(void))*(&off_24DE82D70 + (v1 ^ 0x35E))
          + (((*(_QWORD *)(a1 + 8) != 0x4FF269813004C2EBLL) * (v1 - 731)) ^ v1)))();
}

uint64_t sub_21B520150()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((44
                                * (((v1 ^ (*(_DWORD *)(v2 - 0x4FF269813004C2D3) == ((v1 - 20) ^ 0xDB9150BE))) & 1) == 0)) ^ (v1 - 20))))();
}

uint64_t sub_21B5201A4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x4FF269813004C2DBLL) + 363240512;
  v4 = *(_DWORD *)(v1 - 0x4FF269813004C2DFLL) - 738689118;
  v5 = v4 < 0x17D718DA;
  v6 = v3 < v4;
  if (v3 < 0x17D718DA != v5)
    v6 = v5;
  return (*(uint64_t (**)(void))(v0 + 8 * ((1956 * v6) ^ v2)))();
}

_DWORD *sub_21B520228@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  _DWORD *v2;

  *v2 = a2;
  *result = 611190999;
  return result;
}

uint64_t sub_21B52023C(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t result;
  unsigned int v6;
  _BOOL4 v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = 460628867 * ((-303025253 - (a1 | 0xEDF0339B) + (a1 | 0x120FCC64)) ^ 0x5E994E19);
  v3 = a1[7] + v2;
  v4 = a1[10] ^ v2;
  v8[1] = v3 - 460628867 * (v8 ^ 0x4C96827D) - 1404134225;
  result = nullsub_1(v8);
  if (v4 > 935477430)
  {
    if (v4 == 1220690102)
    {
      v6 = 3;
    }
    else
    {
      if (v4 != 935477431)
        goto LABEL_11;
      v6 = 1;
    }
LABEL_10:
    v7 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24DE82D70 + (int)(v3 ^ 0x45E092B9)))((v3 ^ 0x45E09220) - 1503180409 + *((_DWORD *)*(&off_24DE82D70 + (int)(v3 ^ 0x45E09284)) + 6 * v6 + 2), 3511634213) != 0;
    __asm { BR              X9 }
  }
  if (v4 == 935477427)
  {
    v6 = 0;
    goto LABEL_10;
  }
  if (v4 == 935477430)
  {
    v6 = 2;
    goto LABEL_10;
  }
LABEL_11:
  a1[6] = 611190878;
  return result;
}

void sub_21B520854(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x70F4C230EE5E63EBLL);
  v4 = v2 - 1284376108;
  v3 = v2 - 1284376108 < 0;
  v5 = 1284376108 - v2;
  if (!v3)
    v5 = v4;
  v1 = *(_DWORD *)(a1 + 4) - 235795823 * (a1 ^ 0x94AD4959);
  __asm { BR              X4 }
}

uint64_t sub_21B520970@<X0>(int a1@<W2>, int a2@<W5>, unsigned int a3@<W6>, int a4@<W8>)
{
  _QWORD *v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8 * (((*(_DWORD *)(*v4 + 4 * a3) != a4) * (12 * (a2 ^ a1) - 1068)) ^ a2))
                            - 4))();
}

void sub_21B5209A4()
{
  JUMPOUT(0x21B520934);
}

_DWORD *sub_21B5209B8(_DWORD *result)
{
  *result = 100409530;
  return result;
}

void sub_21B520A40(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_21B520ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a66;
  uint64_t v66;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, unint64_t *))(*(_QWORD *)(v66 + 13408) - 4))(a1, a2, a3, a4, a5, a6, a7, 4094998552, a9, &a66, a11, &STACK[0x691BF935B213C1D8]);
}

uint64_t sub_21B520BF4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((51 * (v3 == ((v1 + v0 + 491380207) & 0xA2989FEB) + 1438603857)) ^ v0))
                            - 12))();
}

uint64_t sub_21B520C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;

  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * ((11
                                          * (((((v17 - 1962663556) & 0x74FBDC8E ^ 0xA6674A8B) + v19) & 0xFFFFFFFC) - a17 == -1503180286)) ^ v17))
                            - ((v17 - 246614948) & 0xEB309AE ^ 0x86)))();
}

uint64_t sub_21B520CC8@<X0>(int a1@<W8>)
{
  unsigned int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a1 == ((v2 + v1 - 142) ^ 0x73CA0686)) * (v1 ^ 0xB0)) ^ v1)) - 4))();
}

uint64_t sub_21B520D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  unsigned __int8 v25;
  int v26;
  BOOL v27;

  v24 = v20 - 1182;
  v25 = v24 - 29;
  v26 = v24 + v23;
  v27 = a20 - 1858346146 < (v22 - 1703148886);
  if (a20 - 1858346146 < (v26 ^ a8) != v22 - 1703148886 < a8 + 144)
    v27 = v22 - 1703148886 < a8 + 144;
  return (*(uint64_t (**)(void))(v21 + 8 * ((11 * ((v25 ^ v27) & 1)) ^ (v26 + 1843))))();
}

uint64_t sub_21B520EB8()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1442
                                          * (*(_DWORD *)(v2
                                                       + 48
                                                       * (v4 - 1438604677 + (v0 & 0x6F72965F ^ (v1 + 573)) - v1 + 176)
                                                       + 36) != v4)) ^ v0 & 0x6F72965Fu))
                            - 12))();
}

uint64_t sub_21B520F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, unint64_t a13, unint64_t a14, unint64_t a15, uint64_t a16, unint64_t a17)
{
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v22 = 460628867 * ((((2 * (v21 - 160)) | 0x3DBBEA46) - (v21 - 160) - 517862691) ^ 0x524B775E);
  *(_DWORD *)(v21 - 152) = v22 + v20 + 20 * (v18 ^ 0x9F) - 665219836;
  *(_DWORD *)(v21 - 132) = v18 - v22 + 1199;
  STACK[0x2A0] = a17;
  STACK[0x2C0] = a12;
  STACK[0x2B0] = a15;
  STACK[0x290] = a14;
  STACK[0x2B8] = a13;
  v23 = (*(uint64_t (**)(uint64_t))(a6 + 8 * (v18 ^ 0xB4)))(v21 - 160);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * (((*(_DWORD *)(v21 - 136) == -611232798)
                                                        * ((v18 - 927101506) & 0x775FF19B ^ (v17 + 807))) ^ v18))
                                          - 4))(v23);
}

uint64_t sub_21B521030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * ((118 * (*(_DWORD *)(v7 + 48 * (v9 - 1438604677 + ((v5 + v6 - 940) ^ (v5 + 176)))) == 1683998726)) ^ v6))
                                                                                       - 12))(a1, a2, a3, a4, a5, v10);
}

uint64_t sub_21B521090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;

  if ((v5 - 1116059936) <= 0x10 && ((1 << (v5 - 32)) & 0x18105) != 0)
    __asm { BR              X10 }
  return a5 ^ 0x246E083Cu;
}

uint64_t sub_21B52172C(uint64_t a1)
{
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v2 = *(_DWORD *)(*(_QWORD *)a1 - 0x70F4C230EE5E63EBLL) - 1761099493;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x70F4C230EE5E63EBLL) - 1761099493;
  v4 = (v2 < 1670760263) ^ (v3 < 1670760263);
  v5 = v2 > v3;
  if (v4)
    v6 = v2 < 1670760263;
  else
    v6 = v5;
  v1 = *(_DWORD *)(a1 + 24) ^ (241568881 * ((((2 * a1) | 0x85239BA2) - a1 - 1116851665) ^ 0x9480C993));
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + (int)(v1 ^ 0x4E)) + (int)((359 * !v6) ^ v1)) - (v1 ^ 0x64)))();
}

uint64_t sub_21B521810(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v5 = (((v3 - 1598) | 0x60) ^ 0x4F45907D) + v2;
  v6 = v5 < 466851401;
  v7 = v4 + 1329958941 < v5;
  if (v4 + 1329958941 < (int)((v3 + 1769123231) & 0x968D4F3F ^ 0x1BD39554) != v6)
    v7 = v6;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 8 * (v7 ^ v3)) - 12))(a1, 1171258091);
}

uint64_t sub_21B521894@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  if (v4 + 863107540 <= (int)(v3 ^ 0xFFFFFCE2))
    v5 = v4;
  else
    v5 = -1726215080 - v4;
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v2 + 8
                                                                   * ((1077 * (v5 - 1284376109 >= 0)) ^ v3 ^ 0x37D))
                                                  - 4))(a1, (a2 + 1));
}

uint64_t sub_21B521920(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v1
                                                               + 8
                                                               * ((690
                                                                 * ((*(_DWORD *)(*v7 + 4 * v8) ^ (v2 + 795)) <= (v4 ^ v3 ^ v2 ^ *(_DWORD *)(*v6 + 4 * v8)))) ^ v4))
                                                   - 4))(a1, v5);
}

uint64_t sub_21B52196C(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v4;
  unsigned int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (a3 ^ (1707 * (v5 < a4)))) - (((a3 - 797) | 0x60u) ^ 0x68)))();
}

uint64_t sub_21B52199C@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  int v4;

  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v2 + 8 * ((1077 * (v4 - 1284376109 >= 0)) ^ v3)) - 4))(a1, (a2 + 1));
}

uint64_t sub_21B5219D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 8) = -1952451112 - v1;
  return result;
}

void jfkdDAjba3jd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _DWORD *a6)
{
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *a5 = 0;
  *a6 = 0;
  v6[1] = 944348131 * ((2 * (v6 & 0x5730B0B8) - v6 + 684674881) ^ 0x8BD6EB0F) - 504207030;
  sub_21B532C9C(v6);
  __asm { BR              X8 }
}

uint64_t sub_21B521AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, unsigned int a18, int a19)
{
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  a17 = &STACK[0x543300C3A69A2021];
  a18 = (831981571
       * ((((&a17 | 0x123AA7DA) ^ 0xFFFFFFFE) - (~&a17 | 0xEDC55825)) ^ 0x74648801)) ^ 0x250;
  sub_21B524100((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 + 8 * ((609 * (a19 == v20)) ^ v19)) - 12))(v22, v23, v24, v25, v26, v27, v28, v29, a9);
}

uint64_t sub_21B521B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20,unsigned int a21)
{
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v28 = 460628867 * ((&a17 + 1659195462 - 2 * (&a17 & 0x62E55046)) ^ 0x2E73D23B);
  a17 = a12;
  LODWORD(a18) = v28 + 1975134435 * v24 + 1486647557;
  HIDWORD(a18) = v28 + 857;
  sub_21B52D870(&a17);
  v29 = 460628867
      * (((&a17 | 0xCED1E99F) - &a17 + (&a17 & 0x312E1660)) ^ 0x82476BE2);
  a17 = a12;
  LODWORD(a18) = v29 + 1975134435 * v21 + 1486647557;
  HIDWORD(a18) = v29 + 857;
  sub_21B52D870(&a17);
  v30 = 235795823 * ((&a17 & 0x3A4B01DF | ~(&a17 | 0x3A4B01DF)) ^ 0x5119B779);
  a19 = 552 - v30;
  a21 = v30 ^ ((v22 ^ 0xFE7EFFFD) + 1610348987 + ((2 * v22) & 0xFCFDFFFA));
  a18 = v23;
  a20 = a12;
  sub_21B51BD9C((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * ((104 * ((_DWORD)a17 == -611232798)) ^ 0x136u)))(v31, v32, v33, v34, v35, v36, v37, v38, v26, v25, v23, a12);
}

uint64_t sub_21B521D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, unsigned int a19, int a20,unint64_t *a21,unsigned int a22)
{
  unsigned int v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;

  v26 = ((((2 * &a17) | 0xAE7A288C) - &a17 - 1463620678) ^ 0x849F464C) * v23;
  a21 = &STACK[0x236606C007542B52];
  a18 = a12;
  a22 = -1663770392 - v26;
  a19 = v26 ^ 0xD5A9A13E;
  a20 = (v22 - 2024873393) ^ v26;
  v27 = sub_21B5327E0((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t))(v25
                                            + 8
                                            * (((a17 == v24 + ((v22 - 677531959) & 0x15DF) - 1503)
                                              * (7 * (v22 ^ 0x17D) + 855)) ^ v22)))(v27);
}

uint64_t sub_21B521DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, uint64_t a19, unint64_t *a20)
{
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  a17 = &STACK[0x48FEE254074E96A4];
  a19 = a14;
  a20 = &STACK[0x6C482493D26EC61D];
  LODWORD(a18) = v20
               + 3804331 * ((&a17 + 1871208055 - 2 * (&a17 & 0x6F885E77)) ^ 0x115D7B81)
               + 1067;
  ((void (*)(unint64_t **))((char *)*(&off_24DE82D70 + v20 - 388) - 12))(&a17);
  LODWORD(a19) = v20
               - 944348131 * ((2 * (&a17 & 0x9D2CF08) - &a17 - 164810505) ^ 0x553494B9)
               - 70;
  a17 = &STACK[0x509D13A7D8C2F430];
  a18 = a14;
  ((void (*)(unint64_t **))((char *)*(&off_24DE82D70 + v20 - 393) - 12))(&a17);
  HIDWORD(a17) = v20
               - 1543737703
               * (((&a17 | 0xBF0FF712) - &a17 + (&a17 & 0x40F008E8)) ^ 0xC1FBA76E)
               + 355;
  a18 = a14;
  v23 = sub_21B5200C0((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t))(v22
                                            + 8
                                            * ((1853 * ((_DWORD)a17 == (((v20 - 489) | 0x112) ^ (v21 - 270)))) ^ v20)))(v23);
}

uint64_t sub_21B521F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  int v18;
  uint64_t v19;

  return (*(uint64_t (**)(void))(v19 + 8 * (((a17 == v18) * (((v17 - 1089561807) & 0x40F163F7) - 5)) ^ v17)))();
}

uint64_t sub_21B521FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  int v15;
  uint64_t v16;

  return (*(uint64_t (**)(void))(v16 + 8 * ((1453 * (((a14 == v15) ^ ((v14 ^ 0x3B) - 65)) & 1)) ^ v14)))();
}

uint64_t sub_21B521FFC@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24DE82D70 + (v1 ^ 0x117)))(a1 ^ (v2 - 551) ^ ((v1 ^ 0x1FF) + 869) ^ (31 * (v1 ^ 0x1FFu)), 1049023243) == 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((1016 * v4) ^ v1)))();
}

uint64_t sub_21B522060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  int v15;
  uint64_t v16;
  int v17;

  v17 = (v15 + ((v14 - 332) | 0x1C0) - 995) ^ a14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * ((2035
                                          * (((((v14 - 366) | 0xC) ^ 0x7FE3EDF3) & (2
                                                                                  * (v17
                                                                                   - ((2 * v17) & 0xDDFF4890)
                                                                                   - 285236152)) ^ 0x5DE34890)
                                           + ((v17 - ((2 * v17) & 0xDDFF4890) - 285236152) ^ 0xD10E53B7)
                                           - 33646448 != 1039175823)) ^ v14))
                            - 8))();
}

uint64_t sub_21B522100(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5
                                                               + 8
                                                               * (((v2 + v1 - 1072822271 < (v4 ^ 0xF3A98AFA) + 206993135)
                                                                 * ((v4 ^ 0x4AB) - 1860)) ^ v4))
                                                   - 12))(a1, v3);
}

uint64_t sub_21B522170(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (a4 ^ (152 * ((unint64_t)(v4 - a1) < 0x20)))) - 4))();
}

uint64_t sub_21B5221A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((a6 - 68580363) & 0x106CE6FC ^ 0x6F2)
                                           - 935
                                           + 237 * ((a6 - 68580363) & 0x106CE6FC ^ 0x6F2))
                                          * (v6 > 0x1F)) ^ (a6 - 68580363) & 0x106CE6FC))
                            - 4))();
}

uint64_t sub_21B5221F8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v11 = v9 + ((a2 - a5) ^ v7);
  v12 = *(_OWORD *)(v6 + v11 - 15);
  v13 = *(_OWORD *)(v6 + v11 - 31);
  v14 = a1 + v11;
  *(_OWORD *)(v14 - 15) = v12;
  *(_OWORD *)(v14 - 31) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((633 * ((v8 & 0xFFFFFFE0) == 32)) ^ (v5 + a2 + 1249))) - 12))();
}

void sub_21B522250()
{
  JUMPOUT(0x21B52220CLL);
}

uint64_t sub_21B52225C(uint64_t a1)
{
  int v1;
  int v2;
  void (*v3)(unsigned int *);
  int v4;
  int v5;
  int v6;
  _QWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  *v8 = a1;
  *v9 = v2;
  v6 = (v1 - 215) ^ 0x4E9;
  v13 = v11;
  v12 = (v1 + 772) ^ (((&v12 & 0x972A639C | ~(&v12 | 0x972A639C)) ^ 0xBB77CE69) * v4);
  v3(&v12);
  v13 = v10;
  v12 = (v6 - 206) ^ (((&v12 & 0x5487B312 | ~(&v12 | 0x5487B312)) ^ 0x78DA1EE7) * v4);
  v3(&v12);
  return v5 ^ 0xDB9153E2;
}

uint64_t sub_21B5224EC(uint64_t a1)
{
  int v1;
  signed int v2;

  v1 = (*(_DWORD *)(a1 + 16) + 69008221 * (((a1 | 0x546C0C1E) - (a1 & 0x546C0C1E)) ^ 0x87CE5E14) - 488) | 0x205;
  v2 = (v1 ^ 0xB371FA4B) + *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x70F4C230EE5E63EBLL);
  if (v2 < 0)
    v2 = -v2;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + (v1 ^ 0x3B1))
                              + ((1925
                                * ((v2 ^ 0x6BBFDD37) - 36325377 + ((2 * v2) & 0xD77FBA6E) + (v1 ^ 0x966A6956) < ((v1 - 157) | 0x80u) + 2147482749)) ^ v1))
                            - 4))();
}

uint64_t sub_21B52260C(uint64_t a1, int a2, unint64_t a3, unsigned int a4, uint64_t a5)
{
  int v5;
  _QWORD *v6;
  unsigned int v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * (int)(((*(_DWORD *)(*v6 + 4 * a4) != a2) * v7) ^ v5 ^ v7))
                            - (((v5 ^ v7) + 29) ^ a3)))();
}

void sub_21B522644()
{
  JUMPOUT(0x21B5225D0);
}

_DWORD *sub_21B52264C(_DWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *result = a6;
  return result;
}

void sub_21B522654(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) - 3804331 * (((a1 | 0x51A664) - (a1 & 0x51A664)) ^ 0x7E848392);
  __asm { BR              X10 }
}

uint64_t sub_21B522714@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, int a6, unint64_t *a7, unsigned int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1178560073 * ((&a4 & 0x5E268719 | ~(&a4 | 0x5E268719)) ^ 0x126AE627);
  a7 = &STACK[0x27D4077E41C0C6AC];
  a6 = v10 - v12 - 1226;
  a4 = v11;
  a5 = &STACK[0x3F1580AD5A7A96D0];
  a8 = 525821216 - v12;
  v13 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(a1 + 8 * (v10 ^ 0x6B3)) - 8))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((87 * (*(_DWORD *)(v11 - 0x4FF269813004C2D3) == v8)) ^ v10))
                                          - (v10 - 671)
                                          + 913))(v13);
}

uint64_t sub_21B5227F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  uint64_t v12;
  int v13;
  _BOOL4 v14;

  v14 = a11 != v11 + ((v13 + 192823971) & 0xF481BFFB) - 1592;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((v14 | (4 * v14)) ^ v13)) - 8))();
}

uint64_t sub_21B522854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  *(_BYTE *)(v11 + (v13 + v12)) = (v16 - 97) ^ *(_BYTE *)(a9 + (v13 + v12)) ^ 0xDD;
  v17 = v13 + 1 + v12 < (a11 ^ v14);
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((v17 | (4 * v17)) ^ v16)) - 8))();
}

void sub_21B52289C(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v3[3] - 0x6C482493D26EC5EDLL) = v1;
  *(_DWORD *)(v4 - 0x48FEE254074E9680) = v2;
  *((_DWORD *)v3 + 3) = *a1;
}

void sub_21B522908(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 12) ^ (268847287 * ((2 * (a1 & 0x4F09AF0B) - a1 - 1326034700) ^ 0x4F5C41DC));
  __asm { BR              X14 }
}

uint64_t sub_21B5229FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v11;

  v8 = (v7 - 321273252);
  v9 = *(_QWORD *)(a4 - 0x70F4C230EE5E63E7);
  v11 = v4 - 1605649360 <= ((v6 - 40) ^ 0x40C) + 1826209794 && v4 - 1605649360 >= (int)v8;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5
                                                                                                 + 8
                                                                                                 * ((v11 | (8 * v11)) ^ (v6 - 40)))
                                                                                     - 8))(0x76ACB9E51CDEE47FLL, a2, 0, v9, (a2 + 417674341), v8);
}

uint64_t sub_21B522B10@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, _QWORD *a6@<X7>, int a7@<W8>)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL4 v20;

  v18 = a1
      - 0x76ACB9E51CDEE7DALL
      + (v12 ^ 0xF73927DC)
      + v14 * (unint64_t)((v12 + ((v10 - 331535098) & v16) - 1621) ^ *(_DWORD *)(*a6 + 4 * a3))
      + 859;
  *(_DWORD *)(a4 + 4 * v15) = v18 + v12 - ((2 * v18) & 0xEE724FB8);
  v19 = ((v18 >> (((v10 - 90) & v17) - 47)) ^ v7)
      + v11
      + (v13 & (2 * (v18 >> (((v10 - 90) & v17) - 47))));
  v20 = a3 + 417674342 < a5;
  if (a2 > 0x671ACB9A != a3 + 417674342 < a7)
    v20 = a2 > 0x671ACB9A;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v8 + 8 * (v10 ^ (!v20 * v9))) - 12))(v19);
}

uint64_t sub_21B522C0C(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((30 * (((a1 == 0x76ACB9E51CDEE47FLL) ^ (v2 - 82)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_21B522C6C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;

  v4 = (a1 & 0xE7B08DF7) - 590;
  v5 = v1 + 557756049 < (int)(v3 + 1842132157);
  if (v3 > (v4 ^ 0x123348E5) != v1 + 557756049 < (int)(a1 & 0xE7B08DF7 ^ 0xEDCCB148))
    v5 = v3 > (v4 ^ 0x123348E5);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((1395 * v5) ^ v4)) - 8))();
}

uint64_t sub_21B522D48(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v14 = ((v9 - 590) ^ 0x8953461AE3211826) + a1 + (*(_DWORD *)(v11 + 4 * v12) ^ v10);
  *(_DWORD *)(v11 + 4 * v12) = v14 + v10 - (((_DWORD)v14 << (((v9 + a3) & a4) - 86)) & 0xEE724FB8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8
                                             * ((((a5 ^ HIDWORD(v14)) + (a6 & (v14 >> 31)) + a7 == v13) * a8) ^ v9))
                            - 4))();
}

uint64_t sub_21B522DD8()
{
  int v0;
  uint64_t v1;
  int v2;
  _DWORD *v3;
  int v4;
  int v5;
  _BOOL4 v6;

  v4 = *v3 + 1617776951;
  v5 = (v0 + 1617776951 < 754669411) ^ (v4 < (v2 ^ 0x2CFB5234));
  v6 = v0 + 1617776951 > v4;
  if (v5)
    v6 = v0 + 1617776951 < 754669411;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((59 * v6) ^ v2)) - 8))();
}

void sub_21B522E38()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

uint64_t sub_21B522E5C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))(qword_24DE7E490[((*(_DWORD *)(a2 + 4) == 1503180299) | (16
                                                                                                  * (*(_DWORD *)(a2 + 4) == 1503180299))) ^ 0x167u]
                                          - 8))(4294925278);
}

uint64_t sub_21B522E9C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 468) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2 + 5064) - 8))(0);
}

void sub_21B522F14()
{
  JUMPOUT(0x21B522EE4);
}

uint64_t sub_21B522F20(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)a1 - 1224239923 * (((a1 | 0x57647C51) - (a1 & 0x57647C51)) ^ 0xA5D78186);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + (v1 ^ 0x193))
                              + (((*(_QWORD *)(a1 + 8) != *(_QWORD *)(a1 + 16)) * ((v1 ^ 0x72E) - 549)) ^ v1))
                            - 4))();
}

uint64_t sub_21B522F98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v4 = *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL);
  v5 = v4 - 1284376108;
  if (v4 - 1284376108 < 0)
    v5 = 1284376108 - v4;
  *(_DWORD *)(v1 - 0x70F4C230EE5E63EBLL) = v4;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (v3 ^ (4
                                     * (((v3 + 1559110506) & 0xA311D7BF)
                                      + ((v3 + 1325738346) & 0xB0FAD1BE ^ 0xFEBDEE4E ^ v5)
                                      + ((2 * v5) & 0xFD7BDFE4) == -21106257)))))();
}

uint64_t sub_21B523048@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(v3 - 0x70F4C230EE5E63E7) + 4 * (int)((v2 ^ 0xA1CB1131) + v5)) = *(_DWORD *)(*(_QWORD *)(v4 - 0x70F4C230EE5E63E7) + 4 * (int)((v2 ^ 0xA1CB1131) + v5));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((v5 - 1 == v1) | v2)) - 4))();
}

uint64_t sub_21B5230A0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;

  *(_DWORD *)(*v3 + 4 * (v5 + v6)) = *(_DWORD *)(*v4 + 4 * (v5 + v6));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((v6 - 1 == v1) | v2)) - 4))();
}

void sub_21B5230D8(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 2078219279 * ((-2 - ((a1 | 0xC3B1469C) + (~(_DWORD)a1 | 0x3C4EB963))) ^ 0xE6B42F17);
  __asm { BR              X9 }
}

uint64_t sub_21B5231B4@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, int a6, unint64_t *a7, unsigned int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1178560073
      * ((((&a4 | 0xAFED9384) ^ 0xFFFFFFFE) - (~&a4 | 0x50126C7B)) ^ 0xE3A1F2BA);
  a8 = 528522204 - v12;
  a4 = v10;
  a5 = &STACK[0x3F1580AD5A7A96D0];
  a7 = &STACK[0x27D4077E41C0C6AC];
  a6 = v11 - v12 + 199;
  v13 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(a1 + 8 * (v11 - 28)) - 8))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((1945
                                                        * (*(_DWORD *)(v10 - 0x4FF269813004C2D3) == (((v11 + 1409) | 6) ^ (v8 + 1476)))) ^ v11))
                                          - 4))(v13);
}

uint64_t sub_21B5232A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11)
{
  int v11;
  uint64_t v12;
  unsigned int v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (int)((109 * (((v13 - 580) ^ v11 ^ a11) < 0x15)) ^ v13))
                            - (v13 ^ 0x622)))();
}

uint64_t sub_21B5232DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  _DWORD *v5;
  uint64_t v6;

  *v5 = v4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                + 8
                                                                                * (v3 ^ (1713
                                                                                       * ((((v4
                                                                                           - ((2 * v4) & 0x2F1047DA)
                                                                                           + 394798061) << ((v3 ^ 0xD2) - 31)) & 0x76EFDAFC ^ 0x260042D8)
                                                                                        + ((v4
                                                                                          - ((2 * v4) & 0x2F1047DA)
                                                                                          + 394798061) ^ 0x6CFFCE93)
                                                                                        - 855713122 != 1215744028))))
                                                                    - 12))(a1, a2, a3, (v3 ^ 0x4D2u) - 1657);
}

uint64_t sub_21B52336C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((124
                                          * ((((v6 + v5 - 2071457150) < 8) ^ (a5 + 5)) & 1)) ^ a5))
                            - 8))();
}

uint64_t sub_21B5233B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (a5 ^ (149 * ((unint64_t)(v5 - v6 - 4) > 0x1F)))) - 8))();
}

uint64_t sub_21B5233EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v6
                                                     + 8
                                                     * ((((23 * (a5 ^ 0x72D) + 703) ^ 0x4A8) * (v5 > 0x1F)) ^ (23 * (a5 ^ 0x72D))))
                                         - 12))(0);
}

uint64_t sub_21B523430(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x16_t v13;

  v9 = v6 + v5 + v7;
  v10.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v10.i64[1] = 0xE5E5E5E5E5E5E5E5;
  v11 = v2 + v9;
  v12 = v3 + v9;
  v13 = veorq_s8(*(int8x16_t *)(v11 - 31), v10);
  *(int8x16_t *)(v12 - 15) = veorq_s8(*(int8x16_t *)(v11 - 15), v10);
  *(int8x16_t *)(v12 - 31) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((((v4 & 0xFFFFFFE0) == 32) * (((a2 - 1000) | 0x1D1) ^ 0x2AB)) ^ (a2 + 83)))
                            - 12))();
}

void sub_21B52349C()
{
  JUMPOUT(0x21B523458);
}

void sub_21B5234A8()
{
  uint64_t v0;
  int v1;

  *(_DWORD *)(v0 + 4) = v1;
}

void IPaI1oem5iL(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_21B523750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  a14 = 944348131 * ((&a13 & 0xFE52DDB6 | ~(&a13 | 0xFE52DDB6)) ^ 0xA2B48607) - 504207030;
  v17 = sub_21B532C9C(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16 + 8 * ((1945 * (a13 == v14)) ^ v15)) - 4))(v17);
}

uint64_t sub_21B5237D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, unsigned int a14, int a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  a13 = &STACK[0x543300C3A69A2011];
  a14 = (831981571 * (((&a13 | 0x4BA30718) - (&a13 & 0x4BA30718)) ^ 0xD202D73C)) ^ 0x250;
  sub_21B524100((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15
                                                                                          + 8
                                                                                          * ((125 * (a15 == -611232798)) ^ 0x116u))
                                                                              - 4))(v16, v17, v18, v19, v20);
}

uint64_t sub_21B52386C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15, int a16)
{
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;

  v20 = 460628867 * ((1372156574 - (&a13 | 0x51C9729E) + (&a13 | 0xAE368D61)) ^ 0xE2A00F1C);
  a13 = a10;
  a14 = v20 + 1975134435 * v16 + 1486647557;
  a15 = v20 + 857;
  v21 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v18 + 1464) - 12))(&a13);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * ((47 * (((a16 == v17) ^ 0x2F) & 1)) | 0x400u)))(v21);
}

uint64_t sub_21B523948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, unsigned int a15, int a16, unint64_t *a17, unsigned int a18)
{
  int v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;

  v22 = (((&a13 | 0x8EFFFC00) - (&a13 & 0x8EFFFC00)) ^ 0x5D5DAE0A) * v21;
  a14 = a10;
  a17 = &STACK[0x236606C007542B3A];
  a15 = v22 ^ 0xD5A9A13E;
  a16 = (v20 - 2024874154) ^ v22;
  a18 = 1986314707 - v22;
  v23 = sub_21B5327E0((uint64_t)&a13);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * (((a13 == v18) * (v20 ^ 0x790)) ^ v20)))(v23);
}

uint64_t sub_21B523A00()
{
  void (*v0)(unint64_t **);
  unsigned int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t *v11;
  uint64_t v12;
  unsigned int v13;

  v13 = v4 - ((((2 * &v11) | 0xD1617142) - &v11 - 1756412065) ^ 0xCBA91CEF) * v3 - 616;
  v11 = &STACK[0x509D13A7D8C2F360];
  v12 = v9;
  ((void (*)(unint64_t **))(*(_QWORD *)(v2 + 8 * (v4 - 939)) - 12))(&v11);
  v12 = v9;
  HIDWORD(v11) = v4
               - 1543737703
               * ((((&v11 | 0xF272070A) ^ 0xFFFFFFFE) - (~&v11 | 0xD8DF8F5)) ^ 0x7379A889)
               - 191;
  sub_21B5200C0((uint64_t)&v11);
  if ((_DWORD)v11 == ((v4 - 793) ^ (v1 - 238)))
    v6 = v10;
  else
    v6 = (int)v11;
  LODWORD(v11) = (v4 + 226) ^ (((2 * (&v11 & 0x487A4730) - &v11 - 1215973173) ^ 0x6427EAC1)
                             * v5);
  v12 = v9;
  v0(&v11);
  v12 = v8;
  LODWORD(v11) = (v4 + 226) ^ ((((&v11 ^ 0x1D024A1 | 0xCC251B0C)
                               + (&v11 ^ 0x40051904 | 0x33DAE4F3)) ^ 0x92776FAE)
                             * v5);
  v0(&v11);
  return v6 ^ v1;
}

void sub_21B523BC4(uint64_t a1)
{
  int v1;

  v1 = 831981571 * ((a1 & 0x19B2699D | ~(a1 | 0x19B2699D)) ^ 0x7FEC4646);
  __asm { BR              X10 }
}

uint64_t sub_21B523C58@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((v1 - 235) ^ (4 * (v2 == ((v1 - 118) | 0x180) + 243036299))))
                            - (((v1 - 1182) | 0x88u) ^ 0xA4)))();
}

uint64_t sub_21B523CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a2 + 8 * (v3 ^ 0x4DD)) - 12))(a1, 229, (v2 - 104), 4000468920);
}

uint64_t sub_21B523D74@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W7>, uint64_t a4@<X8>)
{
  int v4;
  int v5;
  _QWORD *v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;

  v14 = (v13 + a1) & a2;
  *(_DWORD *)(*v6 + 4 * ((v14 ^ (v4 + 1392)) + v5)) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * (v14 ^ ((v8 == 0) * v11))) - (v14 ^ a3 ^ (v14 + v9) & v10 ^ v12)))();
}

void sub_21B523DD4()
{
  JUMPOUT(0x21B523D28);
}

uint64_t sub_21B523DDC(uint64_t result)
{
  *(_DWORD *)(result + 16) = 1143847808;
  return result;
}

uint64_t sub_21B523F98(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 1543737703 * ((1810749715 - (a1 | 0x6BEDD913) + (a1 | 0x941226EC)) ^ 0xEAE67690);
  v2 = *(_DWORD *)(a1 + 12) - v1;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + v2 - 895)
                              + (((((v2 - 34) ^ (((*(_DWORD *)(a1 + 8) - v1) ^ 0xDB9153E2) - 1 < 0x63)) & 1)
                                * (55 * (v2 ^ 0x3B8) - 1128)) ^ v2))
                            - 8))();
}

uint64_t sub_21B524048()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * (int)((999 * (v0 + (v1 & 0xD7E857F7) - 1255 > 0x9B)) ^ v1 & 0xD7E857F7))
                            - 12))();
}

_QWORD *sub_21B524084@<X0>(_QWORD *result@<X0>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;

  if ((((v4 - 214) ^ 0xC0E3u) + v2) >> 1 < 0xF9F)
    v3 = a2;
  *(_DWORD *)(*result - 0x17742063B1AF47F1) = v3;
  return result;
}

void sub_21B524100(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) ^ (831981571
                            * (((a1 ^ 0x8A003497) - 575953088 - 2 * ((a1 ^ 0x8A003497) & 0xDDABA740)) ^ 0xCE0A43F3));
  v2 = *((_QWORD *)*(&off_24DE82D70 + v1 - 546)
       + (((((uint64_t (*)(uint64_t, uint64_t))*(&off_24DE82D70 + (v1 ^ 0x2B2)))(32, 0x101004023FF3BD5) == 0)
         * ((13 * (v1 ^ 0x27E)) ^ 0x250)) | v1));
  __asm { BR              X8 }
}

void sub_21B5241C0()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 12) = 611190838;
}

void sub_21B524240(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_21B5242C4@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1582 * (**(_BYTE **)(a1 + 8) == 0)) ^ a2)))();
}

uint64_t sub_21B5242F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;

  *(_QWORD *)(*(_QWORD *)(a16 + 96) + 504) = v42 + 1;
  *(_DWORD *)(*(_QWORD *)(a16 + 96) + 496) = a18 - 1;
  v45 = 831981571 * ((((v44 - 160) | 0xF78E9411) - (v44 - 160) + ((v44 - 160) & 0x8716BE8)) ^ 0x6E2F4435);
  *(_DWORD *)(v44 - 140) = v45 - 1882357464;
  *(_DWORD *)(v44 - 160) = v45 ^ 0x28D728C6;
  STACK[0x2F8] = (unint64_t)&STACK[0x520F56D3BDEB7CB3];
  v46 = sub_21B4EE28C(v44 - 160);
  return (*(uint64_t (**)(uint64_t))(v43
                                            + 8
                                            * ((28
                                              * (a18 - 1351578878 + ((2 * (a42 & 0x3F)) ^ 6) + (a42 & 0x3F ^ 0xF6F6BEBC) > 0xFFFFFFBF)) ^ 0x2EDu)))(v46);
}

uint64_t sub_21B5244E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  int v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;

  if ((a18 + 1066081483) < 0x9923D2CA != v18 + 1113788706 < (((v20 - 472) | 0x19) ^ 0x9923D2F7))
    v21 = (a18 + 1066081483) < 0x9923D2CA;
  else
    v21 = v18 + 1113788706 < (a18 + 1066081483);
  return (*(uint64_t (**)(void))(v19 + 8 * ((1015 * v21) ^ v20)))();
}

uint64_t sub_21B524560(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;

  v45 = (a2 - 538460519) & 0xAEF9D3FD;
  v46 = 831981571 * ((~((v44 - 160) | 0xEE000A3E) + ((v44 - 160) & 0xEE000A3E)) ^ 0x885E25E5);
  *(_DWORD *)(v44 - 144) = v46 + a18 - 467012196;
  *(_DWORD *)(v44 - 160) = v46 + a2 + 849;
  STACK[0x2F8] = a15;
  v47 = sub_21B4EE180(v44 - 160);
  v48 = a43 & (v45 + 1897819499);
  *(&a34 + (v48 ^ 3)) = 101;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v43 + 8 * ((1422 * ((v48 ^ 3) > 0x37)) ^ a2))
                                          - 12))(v47);
}

uint64_t sub_21B524668(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5 + 8 * ((173 * (v3 != ((v4 + 797) ^ (a3 - 326)) - a3 + 63)) ^ (v4 + 797))))();
}

uint64_t sub_21B524698(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((207 * ((v3 ^ (a3 + 20) ^ (v4 + 1127) ^ (a3 + 991)) < 8)) ^ (v4 + 1148)))
                            - 12))();
}

uint64_t sub_21B5246D8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,char a26)
{
  int v26;
  char v27;
  uint64_t v28;

  *(_QWORD *)(&a26 + a1 - 200911448) = 0xE5E5E5E5E5E5E5E5;
  return (*(uint64_t (**)(void))(v28 + 8 * ((((v27 & 0x38) == 8) * ((33 * (v26 ^ 0x47D)) ^ 0x292)) ^ v26)))();
}

uint64_t sub_21B52472C(double a1)
{
  double *v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *v1 = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 == 0) * v3) ^ v2)))();
}

uint64_t sub_21B52474C@<X0>(int a1@<W2>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4 + 8 * ((211 * ((((a1 + a2 - 858) ^ (v3 == v2)) & 1) == 0)) ^ a2)))();
}

uint64_t sub_21B52477C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,int a43,int a44,int a45,unsigned int a46,int a47,int a48,unsigned __int8 a49,int32x4_t a50,int32x4_t a51,int32x4_t a52,int32x4_t a53)
{
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t (*v60)(__n128, __n128, __n128, __n128, __n128);
  int v61;
  __n128 v62;
  __n128 v63;
  __n128 v64;
  __n128 v65;
  __n128 v66;
  uint64_t v67;
  int v68;
  uint8x16_t v69;
  uint16x8_t v70;
  int8x16_t v71;
  int8x16_t v72;
  uint16x8_t v73;
  int8x16_t v74;
  int8x16_t v75;
  uint8x16_t v76;
  uint16x8_t v77;
  uint16x8_t v78;
  uint8x16_t v79;
  int8x16_t v82;
  int8x16_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  uint8x16_t v93;
  uint16x8_t v94;
  uint16x8_t v95;
  uint8x16_t v96;
  uint8x16_t v101;
  uint16x8_t v102;
  uint16x8_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  _DWORD *v108;
  int v109;
  unsigned int v110;
  int v111;
  unint64_t v112;
  int8x16x4_t v113;
  int8x16x4_t v114;

  v60 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v59 + 8 * (a8 + v53 - 2)) - 12);
  v61 = 37 * (a3 ^ (a3 - 13));
  v62.n128_u64[0] = 0xE5E5E5E5E5E5E5E5;
  v62.n128_u64[1] = 0xE5E5E5E5E5E5E5E5;
  v63 = (__n128)vdupq_n_s32(0x5B9153FAu);
  v64 = (__n128)vdupq_n_s32(0xDB9153E2);
  v65 = (__n128)vdupq_n_s32(0x5B9153E7u);
  v66.n128_u64[0] = 0xCACACACACACACACALL;
  v66.n128_u64[1] = 0xCACACACACACACACALL;
  v67 = a46;
  v68 = a49 ^ 0xA4;
  if (v68 == 2)
  {
    v114 = vld4q_s8(&a33);
    v93 = (uint8x16_t)veorq_s8(v114.val[0], (int8x16_t)v62);
    v94 = vmovl_u8(*(uint8x8_t *)v93.i8);
    v95 = vmovl_high_u8(v93);
    v96 = (uint8x16_t)veorq_s8(v114.val[1], (int8x16_t)v62);
    _Q22 = vmovl_u8(*(uint8x8_t *)v96.i8);
    _Q21 = vmovl_high_u8(v96);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v101 = (uint8x16_t)veorq_s8(v114.val[2], (int8x16_t)v62);
    v102 = vmovl_high_u8(v101);
    v103 = vmovl_u8(*(uint8x8_t *)v101.i8);
    v114.val[0] = veorq_s8(v114.val[3], (int8x16_t)v62);
    v114.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v114.val[0]);
    v114.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v114.val[1]);
    v114.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v114.val[1].i8);
    v114.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v114.val[0].i8);
    v114.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v114.val[0]);
    v114.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v114.val[0].i8);
    v104 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v103.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v94.i8), 0x18uLL)), v114.val[0]);
    v105 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v103, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v94), 0x18uLL)), v114.val[3]);
    v106 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v102.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v95.i8), 0x18uLL)), v114.val[1]);
    v107 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v102, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v95), 0x18uLL)), v114.val[2]);
    v114.val[0] = veorq_s8(vandq_s8((int8x16_t)v104, (int8x16_t)v63), (int8x16_t)(*(_OWORD *)v114.val & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v114.val[3] = veorq_s8(vandq_s8((int8x16_t)v105, (int8x16_t)v63), (int8x16_t)(*(_OWORD *)&v114.val[3] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v114.val[1] = veorq_s8(vandq_s8((int8x16_t)v106, (int8x16_t)v63), (int8x16_t)(*(_OWORD *)&v114.val[1] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v114.val[2] = veorq_s8(vandq_s8((int8x16_t)v107, (int8x16_t)v63), (int8x16_t)(*(_OWORD *)&v114.val[2] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    a52 = vaddq_s32(vsubq_s32(v106, vaddq_s32((int32x4_t)v114.val[1], (int32x4_t)v114.val[1])), (int32x4_t)v64);
    a53 = vaddq_s32(vsubq_s32(v107, vaddq_s32((int32x4_t)v114.val[2], (int32x4_t)v114.val[2])), (int32x4_t)v64);
    a50 = vaddq_s32(vsubq_s32(v104, vaddq_s32((int32x4_t)v114.val[0], (int32x4_t)v114.val[0])), (int32x4_t)v64);
    a51 = vaddq_s32(vsubq_s32(v105, vaddq_s32((int32x4_t)v114.val[3], (int32x4_t)v114.val[3])), (int32x4_t)v64);
    v108 = (_DWORD *)&a50 + v57 + 471981372;
    v109 = *((_DWORD *)&a50 + v57 + (v61 ^ 0x6Fu) + 471980644) ^ *(v108 - 3);
    v110 = v109 + v56 - ((2 * v109) & 0xB722A7C4);
    v111 = *(v108 - 16) ^ *(v108 - 14);
    HIDWORD(v112) = v111 ^ 0x5B9153E2 ^ v110;
    LODWORD(v112) = v111 ^ ~v110;
    *v108 = (v112 >> 31) + v56 - ((2 * (v112 >> 31)) & 0xB722A7C4);
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v59 + 8 * ((111 * (v54 == 471981309)) ^ v61)) - 8))(v54 - 16, v67);
  }
  else if (v68 == 1)
  {
    v113 = vld4q_s8(&a33);
    v69 = (uint8x16_t)veorq_s8(v113.val[0], (int8x16_t)v62);
    v70 = vmovl_u8(*(uint8x8_t *)v69.i8);
    v71 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v70.i8);
    v72 = (int8x16_t)vmovl_high_u16(v70);
    v73 = vmovl_high_u8(v69);
    v74 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v73.i8);
    v75 = (int8x16_t)vmovl_high_u16(v73);
    v76 = (uint8x16_t)veorq_s8(v113.val[1], (int8x16_t)v62);
    v77 = vmovl_high_u8(v76);
    v78 = vmovl_u8(*(uint8x8_t *)v76.i8);
    v79 = (uint8x16_t)veorq_s8(v113.val[2], (int8x16_t)v62);
    _Q26 = (int8x16_t)vmovl_high_u8(v79);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v79.i8);
    v82 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v87 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v113.val[0] = veorq_s8(v113.val[3], (int8x16_t)v62);
    v113.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v113.val[0]);
    v113.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v113.val[1]);
    v113.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v113.val[0].i8);
    v113.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v113.val[0]);
    v113.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v113.val[0].i8), 0x18uLL), v82), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v78.i8, 8uLL), v71));
    v113.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v113.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v78, 8uLL), v72));
    v113.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v113.val[1].i8), 0x18uLL), v87), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v77.i8, 8uLL), v74));
    v113.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v113.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v77, 8uLL), v75));
    v88 = (int32x4_t)veorq_s8(vandq_s8(v113.val[0], (int8x16_t)v65), (int8x16_t)(*(_OWORD *)&v71 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v89 = (int32x4_t)veorq_s8(vandq_s8(v113.val[3], (int8x16_t)v65), (int8x16_t)(*(_OWORD *)&v72 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v90 = (int32x4_t)veorq_s8(vandq_s8(v113.val[1], (int8x16_t)v65), (int8x16_t)(*(_OWORD *)&v74 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v91 = (int32x4_t)veorq_s8(vandq_s8(v113.val[2], (int8x16_t)v65), (int8x16_t)(*(_OWORD *)&v75 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    a52 = vaddq_s32(vsubq_s32((int32x4_t)v113.val[1], vaddq_s32(v90, v90)), (int32x4_t)v64);
    a53 = vaddq_s32(vsubq_s32((int32x4_t)v113.val[2], vaddq_s32(v91, v91)), (int32x4_t)v64);
    a50 = vaddq_s32(vsubq_s32((int32x4_t)v113.val[0], vaddq_s32(v88, v88)), (int32x4_t)v64);
    a51 = vaddq_s32(vsubq_s32((int32x4_t)v113.val[3], vaddq_s32(v89, v89)), (int32x4_t)v64);
    return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v59 + 8 * (a3 ^ (a3 + 253))) - 8))(471981372, a46);
  }
  else
  {
    a43 = 2 * (a43 ^ v55) + v55 - (v58 & (4 * (a43 ^ v55)));
    a44 = 2 * (a44 ^ v55) + v55 - (v58 & (4 * (a44 ^ v55)));
    a45 = 2 * (a45 ^ v55) + v55 - (v58 & (4 * (a45 ^ v55)));
    a46 = 2 * (a46 ^ v55) + v55 - (v58 & (4 * (a46 ^ v55)));
    return v60(v62, v63, v64, v65, v66);
  }
}

uint64_t sub_21B52566C(uint64_t a1, uint64_t a2, int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20,unsigned int a21)
{
  uint64_t v21;
  _BOOL4 v22;

  if (a21 < a4 != a19 + 418042139 < ((5 * (a3 ^ (a3 - 187))) ^ (a4 + 1023)))
    v22 = a19 + 418042139 < ((5 * (a3 ^ (a3 - 187))) ^ (a4 + 1023));
  else
    v22 = a19 + 418042139 > a21;
  return (*(uint64_t (**)(void))(v21 + 8 * ((1403 * ((((a8 + a3 + 209) ^ v22) & 1) == 0)) ^ (a8 + a3 + 690))))();
}

uint64_t sub_21B525708(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v7
                                                               + 8
                                                               * ((14
                                                                 * (((a3 + v6 - 1025) ^ (v6 - 1573827746) & 0x5DCEB4AF ^ 0x27DEA84Cu)
                                                                  + v5 < v5 + a5)) ^ v6))
                                                   - 8))(4214055035, 202);
}

uint64_t sub_21B525784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  return ((uint64_t (*)(void))(*(_QWORD *)(v21
                                        + 8
                                        * (v19 ^ (869 * ((unint64_t)(~a18 + v18 - v20) > 0xF))))
                            - (((v19 + 69237) | 0x8EE08050) ^ 0x8EE192DCLL)))();
}

uint64_t sub_21B5257E0@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W6>, int a4@<W7>, int a5@<W8>, int8x16_t a6@<Q0>, int8x16_t a7@<Q4>)
{
  int v7;
  int8x16_t *v8;
  uint64_t v9;
  uint64_t v10;
  int8x16_t v11;

  v11 = *(int8x16_t *)(v9 + v7 + ((a5 + a2) & a3 ^ (a1 - 88)));
  *v8 = vaddq_s8(vsubq_s8(v11, vandq_s8(vaddq_s8(v11, v11), a7)), a6);
  return (*(uint64_t (**)(void))(v10 + 8 * (a4 + a5 + 127)))();
}

uint64_t sub_21B525840@<X0>(int a1@<W0>, char a2@<W1>, int a3@<W4>, int a4@<W7>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  *(_BYTE *)(v7 + v5) = *(_BYTE *)(v8 + (v6 + a3))
                      - (a2 & (2 * *(_BYTE *)(v8 + (v6 + a3))))
                      - 27;
  return (*(uint64_t (**)(void))(v9 + 8 * (((v5 == 63) * (((a5 + v10) & a1) + 148)) ^ (a4 + a5 + 1550))))();
}

uint64_t sub_21B525890@<X0>(int a1@<W2>, int a2@<W7>, int a3@<W8>)
{
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((635 * (a3 - 200911448 < ((4 * (v4 ^ (a1 + 78))) ^ 0x7E0u))) ^ (a2 + v4 + 1237)))
                            - 4))();
}

uint64_t sub_21B5258D4@<X0>(int a1@<W2>, unsigned int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  v5 = a2 - 200911448;
  if ((unint64_t)(v5 + 1) > 0x38)
    v6 = v5 + 1;
  else
    v6 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((4062
                                          * (((v2 + 57) ^ (v6
                                                                          - v4
                                                                          + (unint64_t)(a1 + v2 - 2008)
                                                                          - 2196236412u < 8)) & 1)) ^ v2))
                            - 4))();
}

uint64_t sub_21B525940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33)
{
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  *(_QWORD *)(&a33 + v35 - 200911448) = 0xE5E5E5E5E5E5E5E5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v36
                                        + 8
                                        * ((((v34 & 0xFFFFFFFFFFFFFFF8) == 8) * (((v33 - 1037) | 0x510) - 511)) ^ v33))
                            - 12))();
}

uint64_t sub_21B525994(double a1)
{
  int v1;
  double *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *v2 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v4 == 0) * v3) ^ v1)) - 12))();
}

uint64_t sub_21B5259B8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((716 * (((v0 == v1) ^ (v2 - 1)) & 1)) ^ v2)) - 4))();
}

void sub_21B5259FC()
{
  JUMPOUT(0x21B524AA4);
}

uint64_t sub_21B525E68(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45)
{
  int v45;
  unsigned int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  unsigned int v51;
  int v52;
  _BOOL4 v53;

  v51 = a3 + v47 - 672 + v49 - 228898697;
  v52 = *(_DWORD *)(&a33 + (v51 & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a5 + v51) = (HIBYTE(v52) ^ 0x4F) - ((2 * (HIBYTE(v52) ^ 0x4F)) & 0xCA) - 27;
  *(_BYTE *)(a5 + (v49 + v45)) = (BYTE2(v52) ^ 0xA2) - ((2 * (BYTE2(v52) ^ 0xA2)) & 0xCA) - 27;
  *(_BYTE *)(a5 + (v49 + v45 + 1)) = (BYTE1(v52) ^ 0xEF) + (~(2 * (BYTE1(v52) ^ 0xEF)) | 0x35) - 26;
  *(_BYTE *)(a5 + (v49 + v45 + 2)) = v52 ^ 0xE7;
  v53 = v49 - 586459597 < (a45 - 382435895);
  if (v49 - 586459597 < v46 != a45 - 382435895 < v46)
    v53 = a45 - 382435895 < v46;
  return (*(uint64_t (**)(void))(v50 + 8 * ((v53 * v48) ^ v47)))();
}

void sub_21B525FF0()
{
  JUMPOUT(0x21B525FC0);
}

uint64_t sub_21B525FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  int v45;
  uint64_t v46;

  *(_DWORD *)(&a45 + a28) = 1243141020;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *))(v46 + 8 * (((v45 - 471) | 0x130) ^ 0x41F)))(&a45 + a28, a2, a3, 1362443836, 2932524607, a6, 2666527291, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           &a45 + a28 + 392);
}

uint64_t sub_21B5260CC()
{
  unsigned int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (int)((15 * (v2 != ((v0 - 537816896) & 0xAEEFFBDE ^ 0xB68B5D24))) ^ v0))
                            - (v0 ^ 0x63DLL)))();
}

uint64_t sub_21B526130@<X0>(int a1@<W1>, int a2@<W7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  uint64_t v27;
  unsigned int v28;
  int v29;
  _BOOL4 v30;

  v28 = (a3 - 1737770725) & 0xD8B2B4F6;
  v29 = a2 + a3 + 1693;
  v30 = a27 + 84640725 < (a1 + 239837985);
  if (a27 + 84640725 < ((3 * (v28 ^ 0x143)) ^ 0x67E45DF0) != (a1 + 239837985) < 0x67E4591F)
    v30 = (a1 + 239837985) < 0x67E4591F;
  return (*(uint64_t (**)(void))(v27 + 8 * ((471 * v30) ^ v29)))();
}

uint64_t sub_21B526388(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;

  v30 = (v27 - a8 - 167);
  v31 = 460628867 * ((v29 - 679488881 - 2 * ((v29 - 160) & 0xD77FD32F)) ^ 0x9BE95152);
  STACK[0x300] = v26;
  STACK[0x320] = a10;
  STACK[0x2F0] = a12;
  *(_DWORD *)(v29 - 152) = v31 + a2 + ((v27 + 561129225) & 0xDE8DDFBD) - 665220861;
  *(_DWORD *)(v29 - 132) = v27 - v31 + 1145;
  STACK[0x310] = a13;
  STACK[0x318] = a11;
  ((void (*)(uint64_t))*(&off_24DE82D70 + (v27 ^ 0xE2)))(v29 - 160);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v28 + 8 * ((486 * (*(_DWORD *)(v29 - 136) == v25)) ^ v27))
                                          - (v30 ^ 0x8EE192D8)))(a25);
}

uint64_t sub_21B5264D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v11
                                                               + 8
                                                               * ((28
                                                                 * (*(_DWORD *)(v10 + 48 * (v12 + v8)) == ((49 * (v13 ^ 0x7A4)) ^ 0x2F5303BC))) ^ v13))
                                                   - (((v13 ^ 0x7A4u) - a8 + 54) ^ 0x8EE192D0)))(a1, v9);
}

uint64_t sub_21B526540@<X0>(int a1@<W2>, int a2@<W7>, int a3@<W8>)
{
  int v4;

  if ((a3 - 1116059936) <= 0x10 && ((1 << (a3 - 32)) & 0x18105) != 0)
    __asm { BR              X11 }
  return v4 ^ 0x246E083Cu;
}

void sub_21B5269DC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

uint64_t sub_21B526A20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1604 * (**(_BYTE **)(a2 + 8) == 0)) | v3)) - 12))();
}

uint64_t sub_21B526A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;

  v4 = v3 - ((2 * v3 + 214864898) & 0x236AC5FC) + 941403391;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v2
                                                                       + 8
                                                                       * ((1420
                                                                         * (((2 * v4) & 0x7FBD57EC ^ 0x232845EC)
                                                                          + (v4 ^ 0xAE6BC908)
                                                                          - 541622628 != 529934994)) ^ 0x372u))
                                                           - 4))(a1, a2, *(_QWORD *)(a1 + 96));
}

uint64_t sub_21B526AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((2469
                                * ((((v7 + v6 - 1071557622) < 8) ^ (89 * (a5 ^ 0xAC) + 13)) & 1)) ^ a5)))();
}

uint64_t sub_21B526B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (int)((82
                                               * (a6 - a3 - 1167 >= (unint64_t)(((a7 & 0x860A4CD7) - 742) ^ 0x103)
                                                                  - 146)) ^ a7 & 0x860A4CD7))
                            - 12))();
}

uint64_t sub_21B526B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  unsigned int v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v7
                                                             + 8
                                                             * ((756
                                                               * (((a7 - 26) ^ (v8 < ((a7 + 802452966) ^ 0x2FD47777u) - 192)) & 1)) ^ a7)))(a1, a2, 0);
}

uint64_t sub_21B526BDC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = (v7 + v9 + 882);
  v11 = *(_OWORD *)(v6 + v10 - 15);
  v12 = *(_OWORD *)(v6 + v10 - 31);
  v13 = v5 + v10;
  *(_OWORD *)(v13 - 15) = v11;
  *(_OWORD *)(v13 - 31) = v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((361
                                               * ((((a4 & 0xF3FBEB7D) - 1542611768) & 0x3822067B) - 1593 == (v8 & 0xFFFFFFE0))) ^ ((a4 & 0xF3FBEB7D) - 600857781)))
                            - 8))();
}

uint64_t sub_21B526C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;

  *(_DWORD *)(a3 + 1424) = ((v4 - 1476428942) & 0x7BD0E717 ^ 0xC8BFD06F) + v3;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 520) = *(_QWORD *)(a2 + 8) + 1;
  return 0;
}

void zxcm2Qme0x(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X9 }
}

uint64_t sub_21B526EB8@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned int a3@<W8>)
{
  uint64_t v3;
  BOOL v4;
  int v5;

  if (a1)
    v4 = a2 == 0;
  else
    v4 = 0;
  v5 = !v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((116 * v5) ^ a3)) - 4))();
}

uint64_t sub_21B526EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v14;
  uint64_t v15;

  a14 = 944348131 * ((&a13 & 0x5BB80E91 | ~(&a13 | 0x5BB80E91)) ^ 0x75E5520) - 504207030;
  v15 = sub_21B532C9C(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v14 + 8 * ((1787 * (a13 == -611232798)) ^ 0x2BDu)) - 4))(v15);
}

uint64_t sub_21B526F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, unsigned int a14, int a15)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  a14 = (831981571 * (((&a13 | 0xDC59C073) + (~&a13 | 0x23A63F8C)) ^ 0x45F81056)) ^ 0x250;
  a13 = &STACK[0x543300C3A69A2021];
  sub_21B524100((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16
                                                                                          + 8
                                                                                          * ((14 * (a15 != v15)) ^ 0x2B3))
                                                                              - 4))(v17, v18, v19, v20, v21);
}

uint64_t sub_21B527034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, int a15, uint64_t a16, unsigned int a17)
{
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;

  v23 = 235795823 * ((1668014413 - (&a13 | 0x636BE14D) + (&a13 | 0x9C941EB2)) ^ 0x83957EB);
  a16 = a12;
  a14 = v17;
  a17 = (((2 * v18) & 0xBEF7F3F4) + (v18 ^ 0x5F7BF9FA) + ((v22 - 784) ^ 0xFEFEFD03)) ^ v23;
  a15 = v22 - v23 - 933;
  v24 = (*(uint64_t (**)(int *))(v20 + 8 * (int)(v22 - 1454)))(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((37 * (a13 == v19)) ^ v22)) - 4))(v24);
}

uint64_t sub_21B527110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, unsigned int a15, int a16, unint64_t *a17, unsigned int a18)
{
  int v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;

  v23 = (((&a13 | 0x48B45D6) - &a13 + (&a13 & 0xFB74BA28)) ^ 0xD72917DC) * v21;
  a14 = a12;
  a17 = &STACK[0x236606C007542B32];
  a18 = -2073744676 - v23;
  a15 = v23 ^ 0xD5A9A13E;
  a16 = (v20 - 2024874568) ^ v23;
  v24 = sub_21B5327E0((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * ((607 * (a13 == (v20 ^ 9 ^ (v18 + 580)))) ^ v20))
                                          - (v22 ^ 0x2B9)))(v24);
}

uint64_t sub_21B5271DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, unint64_t *a14, uint64_t a15, int a16)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  a14 = &STACK[0x509D13A7D8C2F408];
  a15 = a10;
  a16 = v16
      - 944348131 * ((&a14 - 865928092 - 2 * ((unint64_t)&a14 & 0xCC62FC64)) ^ 0x6F7B582A)
      - 1021;
  v19 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(v17 + 8 * (v16 & 0xA4)) - 12))(&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((37 * (a12 == 2 * (v16 - 1017211275) + 1423186800)) ^ v16))
                                          - 8))(v19);
}

uint64_t sub_21B527294()
{
  uint64_t v0;
  void (*v1)(_DWORD *);
  unsigned int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _DWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11[0] = v4
         - 2078219279
         * ((((v11 | 0xF27C1544) ^ 0xFFFFFFFE) - (~v11 | 0xD83EABB)) ^ 0xD7797CCF)
         + v6
         - 474;
  v14 = v8;
  v12 = v0;
  v13 = 0x5E89E940DF8E90DDLL;
  ((void (*)(_DWORD *))(*(_QWORD *)(v3 + 8 * (v4 + v6 - 1334)) - 4))(v11);
  v12 = v8;
  v11[1] = v4
         - 1543737703
         * (((v11 | 0xFA5ABB44) - v11 + (v11 & 0x5A544B8)) ^ 0x84AEEB38)
         + v6
         - 596;
  sub_21B5200C0((uint64_t)v11);
  v12 = v8;
  v11[0] = (v4 + v6 - 179) ^ ((((v11 | 0xD4195C35) - (v11 & 0xD4195C35)) ^ 0x7BB0E3F) * v5);
  v1(v11);
  v11[0] = (v4 + v6 - 179) ^ (((2 * (v11 & 0x4945760) - v11 + 2070653086) ^ 0xA8C9FA94) * v5);
  v12 = v10;
  v1(v11);
  return v9 ^ v2;
}

uint64_t sub_21B527450(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 1224239923 * ((-2 - ((a1 | 0x7F4DB85) + (~(_DWORD)a1 | 0xF80B247A))) ^ 0xAB8D9AD);
  v2 = *(_DWORD *)(a1 + 16) - v1;
  v3 = *(_DWORD *)a1 + v1;
  if (v3 < 0)
    v3 = -v3;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x70F4C230EE5E63EBLL);
  v6 = v4 - 1284376108;
  v5 = v4 - 1284376108 < 0;
  v7 = 1284376108 - v4;
  if (!v5)
    v7 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + (v2 ^ 0x196)) + ((1149 * (v3 >> 5 < v7)) ^ v2))
                            - 8))();
}

uint64_t sub_21B527514@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  char v2;
  uint64_t v3;
  unsigned int v4;

  *(_DWORD *)(result + 20) = ((*(_DWORD *)(*(_QWORD *)(v3 - 0x70F4C230EE5E63E7) + 4 * v4) ^ 0xF73927DC) >> v2) & 1 | a2;
  return result;
}

uint64_t sub_21B52754C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 20) = a2;
  return result;
}

void sub_21B527554(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  _DWORD v8[4];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = 944348131 * ((~(_DWORD)a1 & 0x769503AF | a1 & 0x896AFC50) ^ 0xD58CA7E1);
  v2 = *(_DWORD *)(a1 + 36) + v1;
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v5 = *(_DWORD *)(a1 + 40) + v1;
  v6 = 944348131 * ((2 * (v8 & 0x595D40F0) - v8 - 1499283701) ^ 0x5BB1B45);
  v7 = v6 + 1472116351 * (*(_DWORD *)(a1 + 4) - v1);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = v3;
  v8[0] = v5 - v6 - ((2 * v5 - 299771414) & 0xA5AE97D8) + 1239955681;
  v8[2] = v6 ^ (v2 + 1695027096);
  v8[3] = v7 - 392542037;
  v11 = v4;
  v12 = v4;
  sub_21B532544((uint64_t)v8);
  __asm { BR              X8 }
}

uint64_t sub_21B5276C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, char a12, int a13, unint64_t *a14, uint64_t a15)
{
  uint64_t v15;
  _BYTE *v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;

  v23 = *v16 - v22;
  v24 = 268847287 * ((((2 * &a10) | 0x33FBC118) - &a10 + 1711415156) ^ 0x6657F1A4);
  a10 = v24 + v20 + 414;
  a11 = (v17 + 988775981) ^ v24;
  a14 = &STACK[0x686D7EE90C476A6];
  a15 = v21;
  a12 = (((v20 - 100) | 0x8C) ^ 0xF2 ^ (-35 * v23 + 105))
      - -73 * ((((2 * &a10) | 0x18) - &a10 + 116) ^ 0xA4)
      + ((2 * (-35 * v23 + 105)) & 0xFC);
  v25 = ((uint64_t (*)(int *))(*(_QWORD *)(v15 + 8 * (v20 ^ 0x150)) - 12))(&a10);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * ((1350 * (a13 == v18)) ^ v20)) - 12))(v25);
}

uint64_t sub_21B5277B4()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((v0 - 1993658063 >= ((2 * (v2 ^ 0x33E)) ^ 0xFFFFFE9A))
                                          * ((v2 ^ 0x680) - 1268)) ^ v2))
                            - 4))();
}

void sub_21B5277FC(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(a1 - 0x509D13A7D8C2F3F4) = v2 + 1;
  *(_DWORD *)(v1 + 32) = -611232798;
}

void sub_21B527958(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) ^ (460628867 * ((((2 * a1) | 0x5510E07A) - a1 - 713584701) ^ 0x661EF240));
  v2 = *(_QWORD *)(a1 + 24);
  if (*(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL) - 1284376108 >= 0)
    v4 = *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL) - 1284376108;
  else
    v4 = 1284376108 - *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL);
  v3 = *(_QWORD *)a1;
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x70F4C230EE5E63EBLL) - 1284376108 >= 0)
    v5 = *(_DWORD *)(v3 - 0x70F4C230EE5E63EBLL) - 1284376108;
  else
    v5 = 1284376108 - *(_DWORD *)(v3 - 0x70F4C230EE5E63EBLL);
  v7 = v1
     + 241568881
     * (((&v7 | 0xEFECFE81) - &v7 + (&v7 & 0x10130178)) ^ 0x39FDFAC3)
     - 709;
  v8 = v2;
  sub_21B4F2DA8((uint64_t)&v7);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  __asm { BR              X13 }
}

uint64_t sub_21B527AF0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  _BOOL4 v15;

  v11 = v3 - 1045314498;
  v12 = 4 * (v6 + v4);
  v13 = v10
      + 1749277233
      + (*(_DWORD *)(*(_QWORD *)(v8 - 0x70F4C230EE5E63E7) + v12) ^ v5)
      - (*(_DWORD *)(*(_QWORD *)(a2 - 0x70F4C230EE5E63E7) + v12) ^ v5);
  *(_DWORD *)(*(_QWORD *)(a1 - 0x70F4C230EE5E63E7) + v12) = v13 + v5 - ((v9 ^ 0x1B ^ (v7 - 942)) & (2 * v13));
  v15 = v6 - 1534739467 < 1102169150 && v6 - 1534739467 >= v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((205 * v15) ^ v9 ^ 0xCD)) - 4))();
}

uint64_t sub_21B527BE8()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 + 819890160 < (int)(v3 + 1309315130);
  if (v3 > 0x31F56FC5 != v2 + 819890160 < v1 - 838169464)
    v4 = v3 > 0x31F56FC5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1969 * !v4) ^ v1)) - ((v1 - 443) ^ 0x1FFLL)))();
}

uint64_t sub_21B527C60()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 + 1543685340 < (int)(v3 + 2033110310);
  if (v2 + 1543685340 < -114373338 != v3 > (((v1 ^ 0x35F) + 1027) ^ 0x6D13472u))
    v4 = v3 > (((v1 ^ 0x35F) + 1027) ^ 0x6D13472u);
  return (*(uint64_t (**)(void))(v0 + 8 * ((981 * v4) ^ v1)))();
}

uint64_t sub_21B527CD0@<X0>(int a1@<W1>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;
  _BOOL4 v18;
  int v19;
  _BOOL4 v20;

  v15 = (a1 - 1071545521) & 0x3FDE7BFF;
  v16 = 4 * (v12 + v10);
  v17 = v4 + v15 + 1204 - 1749278939 + (*(_DWORD *)(*(_QWORD *)(a3 - 0x70F4C230EE5E63E7) + v16) ^ 0x8C6D823);
  *(_DWORD *)(*(_QWORD *)(a2 - 0x70F4C230EE5E63E7) + v16) = v17 + v11 - (v13 & (2 * v17));
  v18 = v14 > v9;
  LODWORD(v16) = v12 + 1 + v6;
  v19 = v18 ^ ((int)v16 < v5);
  v20 = (int)v16 < v8;
  if (!v19)
    v18 = v20;
  return (*(uint64_t (**)(void))(v3 + 8 * ((v18 * v7) ^ v15)))();
}

uint64_t sub_21B527DD0(int a1)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((28 * (((v2 == 0x472A6C266843DA30) ^ (a1 - 2)) & 1)) ^ a1))
                            - 12))();
}

uint64_t sub_21B527E28()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (int)((((v2 + v3 - 1) < 0x7FFFFFFF)
                                               * (((v1 + 1268657238) & 0xB461D198) + 1204)) ^ (v1 - 487)))
                            - 8))();
}

uint64_t sub_21B5280A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((*(_DWORD *)(*(_QWORD *)(a1 - 0x70F4C230EE5E63E7)
                                                       + 4 * (v3 + v5 - 1)) == v4)
                                          * (((2 * (v2 ^ 0x179) - 66) | 0x18) + 1490)) ^ (2 * (v2 ^ 0x179))))
                            - 8))();
}

uint64_t sub_21B5280F8()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (int)(((((v1 + 1605977685) & 0xA046BBBB) - 847)
                                               * ((v3 + v2 - 2) > 0x7FFFFFFE)) ^ v1))
                            - 8))();
}

uint64_t sub_21B528140()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((*(_DWORD *)(v1 + 4 * (v3 + v5 - 1)) == v4)
                                          * (((v2 - 24) | 0x18) + 1490)) ^ (v2 + 42)))
                            - 8))();
}

void sub_21B52817C(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(a1 - 0x70F4C230EE5E63EBLL) = (((v3 + v2) * (v1 - 1122738496)) ^ 0x7C9F46BD)
                                         - 806437009
                                         + ((2 * (v3 + v2) * (v1 - 1122738496)) & 0xF93E8D7A);
}

uint64_t sub_21B528208(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  v1 = 1178560073 * ((2 * (a1 & 0x7F215B86) - a1 - 2132892551) ^ 0x336D3AB8);
  v2 = *(_DWORD *)(a1 + 8) ^ v1;
  v3 = *(_DWORD *)(a1 + 12) - v1;
  v5 = v3 - 680783111;
  v4 = v3 - 680783111 < 0;
  LODWORD(v6) = 680783111 - v3;
  if (v4)
    v6 = v6;
  else
    v6 = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DE82D70 + (v2 ^ 0x55B))
                              + ((162 * (v6 != ((2 * (_DWORD)v6) & 0x497C79CE))) ^ v2))
                            - 8))();
}

void sub_21B5282B8(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  **(_DWORD **)(v1 - 0x70F4C230EE5E63E7) = (v2 + 616447207) ^ 0xD3871B3B;
  *(_DWORD *)(v1 - 0x70F4C230EE5E63EBLL) = a1 + 1;
}

void sub_21B528310(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 4) - 1543737703 * (a1 ^ 0x7EF4507C);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v1 - 69008221 * ((((2 * &v2) | 0xD1A77812) - &v2 + 388776951) ^ 0x3B71EE03) + 725;
  sub_21B5224EC((uint64_t)&v2);
  __asm { BR              X9 }
}

uint64_t sub_21B52842C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v7;

  v5 = (((v4 - v3) >> 4) & 0xBBBBBFE ^ 0x28339F6)
     + (((v4 - v3) >> 5) ^ 0x76BC4104)
     - 841281197;
  v7 = v5 <= 0x43B8EF51 || v5 >= v2 + ((v1 - 1852646168) & 0x6E6D1EEDu) + 1136193189;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((47 * v7) ^ v1)) - 4))();
}

void sub_21B5284B4()
{
  _DWORD *v0;

  *v0 = 1284376108;
}

void sub_21B528840(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) ^ (3804331 * ((a1 - 1457963832 - 2 * (a1 & 0xA9193CC8)) ^ 0xD7CC193E));
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL);
  v4 = v1 + 241568881 * ((&v4 & 0x618026E8 | ~(&v4 | 0x618026E8)) ^ 0x486EDD55) - 590;
  v5 = v2;
  sub_21B4F2DA8((uint64_t)&v4);
  __asm { BR              X9 }
}

uint64_t sub_21B52896C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a1 + 8 * ((111 * (((v3 + v2) & 0x1F ^ 0xB) == ((v1 + 297) | 0x207) - 1631)) ^ v1)))();
}

uint64_t sub_21B5289D4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (int)((1094
                                               * ((v2 & 0x3F7BDF7E)
                                                + (v3 ^ 0x1FBDEFBF)
                                                + ((v1 + 218850428) & 0xF2F49BF6 ^ 0xE3F67774)
                                                - 62153878 < (((((v1 + 218850428) & 0xF2F49BF6) - 775) | 0x344) ^ (((v1 + 218850428) & 0xF2F49BF6) + 210174557) & 0xF378FBBF ^ 0x7FFFFD9F))) ^ (v1 + 218850428) & 0xF2F49BF6))
                            - 4))();
}

uint64_t sub_21B528A84@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = v4 - 61;
  *(_DWORD *)(*(_QWORD *)(v5 - 0x70F4C230EE5E63E7) + 4 * ((v6 ^ 0x1C51C3D7) + v1 + v2)) = *(_DWORD *)(*(_QWORD *)(v5 - 0x70F4C230EE5E63E7) + 4 * (v3 + v2 + (v6 ^ 0x21Du)));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a1
                                                      + 8
                                                      * ((125 * ((v3 + v2 + 446) < 0x7FFFFFFF)) ^ v6))
                                          - 4))(0x7FFFFFFFLL);
}

void sub_21B528AF4()
{
  JUMPOUT(0x21B528AB8);
}

uint64_t sub_21B528AFC@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((((((int)((v4 ^ 0x5FEBFEE9) - 1551959048 + (v2 & 0xBFD7FDD2) - 57342690) >= 0) ^ a1) & 1)
                                          * ((v3 | 0x431) ^ 0x408)) ^ a1))
                            - 8))();
}

uint64_t sub_21B528B94@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v5 - 0x70F4C230EE5E63E7) + 4 * (v4 + v2)) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((v4 + v2 > 0) * (((v3 - 1062) | 0x270) - 630)) ^ v3)) - 12))();
}

uint64_t sub_21B528BE0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  _QWORD *v3;
  int v4;
  int v5;

  *(_DWORD *)(*v3 + 4 * (v1 + v5 - 1)) = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v1 + v5 - 2 >= 0) * (((v4 - 553) | 0x73) ^ 0x27E)) ^ v4)) - 12))();
}

void sub_21B528C28()
{
  int v0;
  int v1;
  int v2;
  int v3;
  _QWORD *v4;
  int v5;
  _DWORD *v6;
  _BOOL4 v7;

  v7 = *(_DWORD *)(*v4 + 4 * (v0 + v2)) == v3;
  *v6 = v1 + v1 * (v2 + v0 - v7) + (v0 - v7) * (((v5 - 379) | 0x25D) ^ 0xBD145D9D) + 1708708140;
}

void sub_21B528E84(uint64_t a1)
{
  int v1;
  unsigned int v2;
  _BOOL4 v3;
  int v4;
  int v5;
  unint64_t *v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 12) - 2078219279 * ((-2 - ((~(_DWORD)a1 | 0x5D772C97) + (a1 | 0xA288D368))) ^ 0x878DBAE3);
  v2 = 831981571 * (((&v5 | 0xB725B5FD) + (~&v5 | 0x48DA4A02)) ^ 0x2E8465D8);
  v5 = v2 ^ 0x28D728C6;
  v7 = v1 + v2 - 1882357543;
  v6 = &STACK[0x520F56D3BDEB7EAB];
  sub_21B4EE28C((uint64_t)&v5);
  v3 = ((2 * v4) & 0x7A ^ 2) + (v4 & 0x3F ^ 0x6EDFFD7Eu) - 1860173241 > 0xFFFFFFBF;
  __asm { BR              X16 }
}

uint64_t sub_21B529290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  char v21;
  int v22;
  uint64_t v23;
  int v24;

  v24 = (v20 + 922) ^ 0x542;
  *(_BYTE *)(a5 + (v22 + v24 - 640)) = v21;
  *(_BYTE *)(a5 + a9 + ((v24 - 560) ^ 0x9FA92287)) = *(_BYTE *)(a7 + 1);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8 * (v24 ^ 0xEA)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_21B52A65C@<X0>(uint64_t a1@<X4>, uint64_t a2@<X6>, int a3@<W8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  *(_BYTE *)(a1 + (v7 + a3 + 66)) = *(_BYTE *)(a2 + (v6 - 287462677));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((1133 * ((v4 & 0xFFFFFFFC) == v5 + 287462597)) ^ v3)) - 8))();
}

uint64_t sub_21B52A6AC@<X0>(uint64_t a1@<X4>, uint64_t a2@<X6>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t (*a22)(uint64_t))
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  *(_BYTE *)(a1 + (a3 + 67)) = *(_BYTE *)(a2 + ((v22 + 4294967216) & (v23 + 4007504620)));
  v25 = 831981571 * ((-1907916877 - ((v24 - 168) | 0x8E477FB3) + ((v24 - 168) | 0x71B8804C)) ^ 0xE8195068);
  *(_QWORD *)(v24 - 160) = a21;
  *(_DWORD *)(v24 - 152) = v25 + 1036168095;
  *(_DWORD *)(v24 - 168) = v25 + v22 + 831;
  v26 = sub_21B4EE180(v24 - 168);
  return a22(v26);
}

uint64_t sub_21B52A750@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, int a4, unsigned int a5)
{
  int v5;
  uint64_t v6;
  _BOOL4 v7;

  v7 = a5 < 0x30C26843;
  if (v7 == (a1 - 251920163) < 0x30C26843)
    LOBYTE(v7) = a1 - 251920163 < a5;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v6
                                                      + 8 * ((1001 * (((v5 + 117) ^ v7) & 1)) ^ v5))
                                          - 12))(2727769040);
}

uint64_t sub_21B52A7CC@<X0>(int a1@<W0>, unsigned int a2@<W1>, unsigned int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, int a8@<W8>)
{
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  char v13;
  _BOOL4 v14;
  unsigned int v15;
  int v16;
  _BOOL4 v17;

  v14 = a3 < a2;
  v15 = (((v9 - 462) | a4) ^ v10) + a8;
  *(_BYTE *)(a5 + (v8 + a1)) = *(_BYTE *)(a7 + (a8 + v11))
                                           - (v13 & (2 * *(_BYTE *)(a7 + (a8 + v11))))
                                           - 27;
  v16 = v14 ^ (v15 < a2);
  v17 = v15 < a3;
  if (!v16)
    v14 = v17;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((!v14 * a6) ^ v9)) - 12))();
}

uint64_t sub_21B52A83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,unsigned int a29)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;

  v31 = (a8 + 884) ^ 0x380u;
  v32 = 831981571 * ((((v30 - 168) | 0xE5A776CE) - (v30 - 168) + ((v30 - 168) & 0x1A588930)) ^ 0x7C06A6EA);
  *(_QWORD *)(v30 - 160) = a26;
  *(_DWORD *)(v30 - 152) = a11 + v32;
  *(_DWORD *)(v30 - 168) = v32 + a8 + 819;
  sub_21B4EE180(v30 - 168);
  v33 = STACK[0x2F8] & 0x3F;
  *((_BYTE *)&STACK[0x2B4] + (v33 ^ 3)) = 101;
  return ((uint64_t (*)(_QWORD, uint64_t))(*(_QWORD *)(v29
                                                              + 8 * ((1424 * ((v33 ^ 3) > 0x37)) ^ a8))
                                                  - (v31 ^ 0x4B)))(a29, 4007504550);
}

uint64_t sub_21B52A940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31)
{
  int v31;
  uint64_t v32;

  return (*(uint64_t (**)(void))(v32 + 8 * ((22 * (v31 != ((a31 + 978) ^ 0xFFFFF845) + (a31 ^ 0x394))) ^ a31)))();
}

uint64_t sub_21B52A990@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;

  v3 = (a1 ^ 0x3Cu) >= (v1 ^ 0x7EEu) - 71;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((v3 | (v3 << 6)) ^ v1)) - 12))();
}

uint64_t sub_21B52A9C4@<X0>(char a1@<W8>, uint64_t a2)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a2 + v2) = v5;
  return (*(uint64_t (**)(void))(v4
                              + 8 * ((((a1 & 0x38) == 8) * ((v3 - 723987568) & 0x2B272FEF ^ 0x3C8)) ^ (v3 + 586))))();
}

uint64_t sub_21B52AA18()
{
  _QWORD *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *v0 = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 == 0) * v2) ^ v1)))();
}

uint64_t sub_21B52AA38@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v2 == a1) ^ (v1 - 80)) & 1)
                                * (((v1 - 953781600) & 0x38D989DF) + 1016)) ^ v1)))();
}

uint64_t sub_21B52AA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;

  *(_BYTE *)(v5 + v7 + a5 + (v6 + 12) - 92) = v8;
  return (*(uint64_t (**)(void))(v10 + 8 * ((((unint64_t)(v5 + v7) < 0x40) * v9) ^ (v6 + 896))))();
}

void sub_21B52AACC()
{
  JUMPOUT(0x21B529830);
}

uint64_t sub_21B52AAEC(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * ((19
                                                                          * (v2 + (((v4 + 473) | 0x42) ^ 0xE00B9E24) > 0x37)) ^ (v4 + 282)))
                                                            - 8))(a1, a2, 559);
}

uint64_t sub_21B52AB48()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = v0;
  v5 = v0 + v2;
  if (v5 <= 0x38)
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((v5 - v4 + 536110002 < 8) ^ (v1 - 27)) & 1)
                                          * (((v1 - 554) | 0x315) ^ 0x3A9)) ^ v1))
                            - 8))();
}

uint64_t sub_21B52ABAC@<X0>(unsigned int a1@<W2>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v5 + a3 + a2 - 1) = v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((((v4 ^ a1) - 370 == (v3 & 0xFFFFFFFFFFFFFFF8)) * v6) ^ v4))
                            - 4))();
}

uint64_t sub_21B52ABF4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((784 * (((v0 == v1) ^ (v2 - 43)) & 1)) ^ v2))
                            - 8))();
}

uint64_t sub_21B52AC40@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(a2 + v5 + a1 - 1) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((unint64_t)(a2 + v5) < 0x38) * v3) ^ (v2 + 299))) - 8))();
}

void sub_21B52AC70(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  char v11;
  int v12;
  int v13;
  unsigned int v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  char v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  int v24;

  v12 = LOBYTE(STACK[0x314]) ^ 0xA4;
  if (v12 == 1)
  {
    v20 = STACK[0x2F8];
    v21 = STACK[0x2F4];
    LOBYTE(STACK[0x2EC]) = ((8 * LOBYTE(STACK[0x2F8])) ^ 0x18) - ((a11 - 84) & (16 * LOBYTE(STACK[0x2F8]))) - 27;
    LOBYTE(STACK[0x2ED]) = ((v20 >> 5) ^ 0xA4) + ~(2 * (((v20 >> 5) ^ 0xA4) & 0x6D ^ (v20 >> 5) & 8)) - 26;
    LOBYTE(STACK[0x2EE]) = ((v20 >> 13) ^ 0x3A) - (v11 & (2 * ((v20 >> 13) ^ 0x3A))) - 27;
    HIDWORD(v22) = v21;
    LODWORD(v22) = v20 ^ 0x80000000;
    LOBYTE(STACK[0x2EF]) = ((v20 >> 21) ^ 0x8A) - (v11 & (v20 >> 20)) - 27;
    LOBYTE(STACK[0x2F0]) = (v22 >> 29) - (v11 & (2 * (v22 >> 29))) - 27;
    LOBYTE(STACK[0x2F1]) = ((v21 >> 5) ^ 0xF5) - 2 * (((v21 >> 5) ^ 0xF5) & 0x6D ^ (v21 >> 5) & 8) - 27;
    LOBYTE(STACK[0x2F2]) = ((v21 >> 13) ^ 0x4D) + ~(2 * (((v21 >> 13) ^ 0x4D) & 0xE7 ^ (v21 >> 13) & 2)) - 26;
    v23 = (v21 >> 21) ^ 0x30;
    v24 = v23 & 0x67 ^ (v21 >> 21) & 2;
    v19 = v23 - 27;
    v18 = 2 * v24;
  }
  else
  {
    if (v12 != 2)
      goto LABEL_6;
    v13 = STACK[0x2F4];
    v14 = STACK[0x2F8];
    v15 = ((a1 - 59) ^ 0x59 ^ (LODWORD(STACK[0x2F4]) >> 13))
        - 2 * (((a1 - 59) ^ 0x59 ^ (LODWORD(STACK[0x2F4]) >> 13)) & 0xE7 ^ (LODWORD(STACK[0x2F4]) >> 13) & 2);
    v16 = ((LODWORD(STACK[0x2F4]) >> 5) ^ 0xFFFFFFF5)
        - 2 * (((LODWORD(STACK[0x2F4]) >> 5) ^ 0xFFFFFFF5) & 0x6D ^ (LODWORD(STACK[0x2F4]) >> 5) & 8);
    LOBYTE(STACK[0x2EC]) = ((LODWORD(STACK[0x2F4]) >> 21) ^ 0x30)
                         - 2 * (((LODWORD(STACK[0x2F4]) >> 21) ^ 0x30) & 0xE7 ^ (LODWORD(STACK[0x2F4]) >> 21) & 2)
                         - 27;
    LOBYTE(STACK[0x2ED]) = v15 - 27;
    LOBYTE(STACK[0x2EE]) = v16 - 27;
    HIDWORD(v17) = v13;
    LODWORD(v17) = v14 ^ 0x80000000;
    LOBYTE(STACK[0x2EF]) = (v17 >> 29) - (v11 & (2 * (v17 >> 29))) - 27;
    LOBYTE(STACK[0x2F0]) = ((v14 >> 21) ^ 0x8A) - (v11 & (v14 >> 20)) - 27;
    LOBYTE(STACK[0x2F1]) = ((v14 >> 13) ^ 0x3A) - (v11 & (2 * ((v14 >> 13) ^ 0x3A))) - 27;
    LOBYTE(STACK[0x2F2]) = ((v14 >> 5) ^ 0xA4) - 2 * (((v14 >> 5) ^ 0xA4) & 0xE7 ^ (v14 >> 5) & 2) - 27;
    v18 = (16 * v14) & 0xC0;
    v19 = ((8 * v14) ^ 0x18) - 27;
  }
  LOBYTE(STACK[0x2F3]) = v19 - v18;
LABEL_6:
  JUMPOUT(0x21B529830);
}

uint64_t sub_21B52AED8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;
  unint64_t v39;

  if (a31 == 2)
    return ((uint64_t (*)(void))(*(_QWORD *)(v37
                                          + 8
                                          * (((16 * (LODWORD(STACK[0x310]) != 1922694427)) | (32
                                                                                            * (LODWORD(STACK[0x310]) != 1922694427))) ^ (a1 + 1164)))
                              - ((a1 - 1777338448) & 0x69F00CDB)
                              + 1235))();
  if (a31 == 1)
    return ((uint64_t (*)(void))(*(_QWORD *)(v37
                                          + 8
                                          * ((630
                                            * (((LODWORD(STACK[0x310]) == 1922694427) ^ (a1 - 116)) & 1)) ^ (a1 + 1164)))
                              - 8))();
  v39 = ((unint64_t)&a37 ^ 0x3ECFE6FBEEECDBBBLL)
      - 0x260C60184E8852AALL
      + (((_QWORD)&a37 << (((a1 - 14) | 0x86) ^ 0xC6u)) & 0x7D9FCDF7DDD9B770);
  LOBYTE(STACK[0x30F]) = ((v39 - 17) ^ 0xBA) * v39;
  return ((uint64_t (*)(void))(*(_QWORD *)(v37 + 8
                                              * ((((((a1 + 498) | 0x86) - 689) | 0x49) - 69) ^ ((a1 + 498) | 0x86)))
                            - 12))();
}

void sub_21B52B234()
{
  JUMPOUT(0x21B52B204);
}

uint64_t sub_21B52B23C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t *a17)
{
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;

  v21 = *a17;
  v22 = (_QWORD *)(v20 - 200);
  *v22 = 0xE5E5E5E5E5E5E5E5;
  v22[1] = 0xE5E5E5E5E5E5E5E5;
  v23 = 235795823 * ((((v20 - 168) ^ 0x201CB3A3 | 0xE1D97925) - (((v20 - 168) ^ 0x201CB3A3) & 0xE1D97925)) ^ 0x556883DF);
  v22[4] = v20 - 184;
  v22[9] = v20 + 0x19A1466F6B331A4;
  *(_DWORD *)(v20 - 160) = v23 + 1894514085;
  *(_DWORD *)(v20 - 132) = (v17 + 1796) ^ v23;
  v22[6] = &STACK[0x2A0];
  v22[7] = v21;
  v24 = ((uint64_t (*)(uint64_t))*(&off_24DE82D70 + (v17 ^ 0xC5)))(v20 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((*(_DWORD *)(v20 - 136) == v19)
                                                        * (((v17 - 815591585) & 0x309CF26F) + 67)) ^ v17))
                                          - ((v17 - 815591585) ^ 0xCF630FF1)
                                          + 71))(v24);
}

uint64_t sub_21B52B36C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _BOOL4 v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 32) + v0 - 0x1059A3B3F9A07FEALL)
     - *(unsigned __int8 *)(v5 + v0 - 0x1059A3B3F9A07FEALL);
  v7 = v0 + 1;
  v9 = (v6 ^ 0x977F4EFD) + 2044853647 + ((2 * v6) & 0x2EFE9DFA) != (v4 ^ 0x261) + 291589181 || v7 == v2 + 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((107 * v9) ^ v4)) - 8))();
}

uint64_t sub_21B52B3F8@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 241568881
     * ((((v3 - 168) | 0xF0FCF57AD9C90D2ELL) - ((v3 - 168) | 0xF030A852636F2D1) + 0xF030A852636F2D1) ^ 0xFFA921F30FD8096CLL);
  *(_DWORD *)(v3 - 148) = (a1 + 789971292) ^ v4;
  *(_DWORD *)(v3 - 144) = v4 + a1 + 2021363698;
  *(_DWORD *)(v3 - 140) = v4;
  v5 = v3 - 200;
  *(_QWORD *)(v5 + 40) = v4 + v1;
  *(_QWORD *)(v5 + 64) = v4 + 291589260;
  *(_DWORD *)(v3 - 168) = (a1 + 789971365) ^ v4;
  *(_DWORD *)(v3 - 152) = a1 + 789971365 - v4 - 39;
  v6 = ((uint64_t (*)(uint64_t))((char *)*(&off_24DE82D70 + (a1 ^ 0xE3u)) - 8))(v3 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * *(int *)(v3 - 128)) - 8))(v6);
}

void sub_21B52B4EC()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 8) = -611232798;
}

void sub_21B52B538(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v1 = 1178560073 * ((a1 & 0x11262C88 | ~(a1 | 0x11262C88)) ^ 0x5D6A4DB6);
  v2 = *(_DWORD *)(a1 + 20) ^ v1;
  v3 = *(_DWORD *)(a1 + 32) ^ v1;
  v5 = (~v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 318767104;
  __asm { BR              X11 }
}

uint64_t sub_21B52B604@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4, unint64_t *a5, unint64_t *a6, int a7, int a8, unint64_t *a9, unsigned int a10, uint64_t a11)
{
  int v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;

  v15 = *v12;
  v16 = 460628867 * ((((2 * &a4) | 0x7CA67BBE) - &a4 - 1045642719) ^ 0x72C5BFA2);
  a4 = (-125 * ((((2 * &a4) | 0xBE) - &a4 + 33) ^ 0xA2)) ^ 0x5B;
  a11 = v15;
  a8 = v14 - v16 + 1172344571;
  a9 = &STACK[0x494572B7009F59A8];
  a10 = ((v11 ^ 0x24A75C30) - 1076733448 + ((2 * v11) & 0xEDDFCD70 ^ 0xA4914510)) ^ v16;
  a5 = &STACK[0x2A05F9DD1F188556];
  a6 = &STACK[0x7E41FC83DC39FF3];
  v17 = ((uint64_t (*)(char *))(*(_QWORD *)(a1 + 8 * (v14 - 719)) - 8))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13 + 8 * ((2042 * (a7 == -611232798)) ^ v14))
                                          - (v14 - 701)
                                          + 151))(v17);
}

uint64_t sub_21B52B738()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v2 ^ (81 * (v1 == 318767104))))
                            - ((430 * (v2 ^ 0xA0u) + 769) ^ (137 * (v2 ^ 0xACu)))))();
}

uint64_t sub_21B52B784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  int v10;
  uint64_t v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((31 * (a10 + 4 < a10)) ^ v10)) - (((v10 - 2023) | 0x83u) ^ 0xA7)))();
}

uint64_t sub_21B52B7F4()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v0 ^ (1457
                                               * (((v1 << (((v0 + 95) | 0xC) ^ 0xF)) & 0x4FB7DFFE ^ 0x9B3C754)
                                                + (v1 ^ 0x7B220C55)
                                                + 2146426700 != 667668299))))
                            - 12))();
}

uint64_t sub_21B52B86C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((733
                                          * ((((v1 + v0 + 1478758401) < 0xC) ^ (v2 - 1)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_21B52B8D0()
{
  char v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (int)(((((((((v2 + 1698003473) & 0x9ACA87FA) + 2014147682) & 0x87F287E3) - 868) & (v1 - (v0 & 3))) <= v1 + 3)
                                               * ((((v2 + 1698003473) & 0x9ACA87FA) - 1178) ^ 0x2B6)) ^ (v2 + 1698003473) & 0x9ACA87FA))
                            - 4))();
}

uint64_t sub_21B52B944@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (v6 - 293);
  a3.i32[0] = *(_DWORD *)(v8 + a1 + a2 - 346);
  *(_DWORD *)(a2 - 3 + (v4 + v3)) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)((987 * ((((_DWORD)v8 - 184) ^ 0xA7) != v5)) ^ v8)) - 8))();
}

uint64_t sub_21B52B9A8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((v0 - 1892) ^ ((16 * (v1 != 0xDCF9E3AA)) | ((v1 != 0xDCF9E3AA) << 8))))
                            - (((v0 - 1789) | 0x400u) ^ 0x506)))();
}

uint64_t sub_21B52B9FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  _BOOL4 v8;

  v8 = v4 > 0xD4E08EDF;
  *(_BYTE *)(a1 + (v6 - 1182266661)) = *(_BYTE *)(v1 + (v6 - 1182266661));
  if (v8 == v6 - 458785796 < v3)
    v8 = v6 - 458785796 < v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)((v8 * (((v2 + 522761467) & 0xE0D74F6B) - 1018)) | v2)) - 12))();
}

uint64_t sub_21B52BA7C@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(a2 - 3 + (v4 + v3)) = *(_DWORD *)(v2 - 3 + (v4 + v3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((210 * (((a1 - 832) | 0x83) - 159 != v5)) ^ (a1 - 517))) - 8))();
}

uint64_t sub_21B52BAD4(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((a1 ^ 0x3C3) + 426) ^ 0xA7) * (v1 != v2)) ^ a1)) - 12))();
}

uint64_t sub_21B52BB04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + (v4 + v3)) = *(_BYTE *)(v1 + (v4 + v3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((1225 * ((((v5 - 856) ^ (v4 - 1 == v2)) & 1) == 0)) ^ (v5 - 701)))
                            - 12))();
}

uint64_t sub_21B52BB50()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * (((*(_QWORD *)(v1 + 24) != 0x371EF9AFBEAB24E7) * (v0 ^ 0x52D)) ^ v0))
                            - 4))();
}

uint64_t sub_21B52BB88@<X0>(uint64_t a1@<X8>, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(a1 - 0x371EF9AFBEAB24E7) = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1933 * (*(_QWORD *)(v3 + 8) != 0x49EB7E5E2EA5C8EDLL)) ^ (6 * (v2 ^ 0x59A))))
                            - 12))();
}

void sub_21B52BBEC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 - 0x49EB7E5E2EA5C8EDLL) = v2;
  *(_DWORD *)(v1 + 16) = -611232798;
}

void HN0R(uint64_t a1, uint64_t a2)
{
  __asm { BR              X8 }
}

uint64_t sub_21B52BD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  a14 = 944348131 * ((((2 * &a13) | 0x56CA6E9A) - &a13 + 1419430067) ^ 0x87C9303)
      - 504207030;
  v18 = sub_21B532C9C(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16 + 8 * ((936 * (a13 == v14)) ^ v17)) - (v15 ^ 0xC8F3C10ELL)))(v18);
}

uint64_t sub_21B52BD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, unsigned int a14, int a15)
{
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  a13 = &STACK[0x543300C3A69A2019];
  a14 = (831981571 * ((1437488735 - (&a13 | 0x55AE565F) + (&a13 | 0xAA51A9A0)) ^ 0x33F07984)) ^ 0x250;
  sub_21B524100((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16
                                                                                          + 8
                                                                                          * (int)(((a15 == v15)
                                                                                                 * (v17 ^ 0xC8F3C102)) | 0x4C0))
                                                                              - 4))(v18, v19, v20, v21, v22);
}

uint64_t sub_21B52BE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, uint64_t a16, unsigned int a17)
{
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  void (*v25)(uint64_t *);
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;

  v22 = 460628867 * ((1529309226 - (&a13 | 0x5B27682A) + (&a13 | 0xA4D897D5)) ^ 0xE84E15A8);
  a13 = a11;
  LODWORD(a14) = v22 + 1975134435 * v18 + 1486647557;
  HIDWORD(a14) = v22 + 857;
  ((void (*)(uint64_t *))(*(_QWORD *)(v20 + 1464) - 12))(&a13);
  v23 = *(_QWORD *)(v17 + 8);
  v24 = 235795823
      * (((&a13 | 0x66C24E69) - &a13 + (&a13 & 0x993DB190)) ^ 0xF26F0730);
  a17 = ((*(_DWORD *)v17 ^ 0x5F7BF9BA) - 16842754 + ((2 * *(_DWORD *)v17) & 0xBEF7F374)) ^ v24;
  a14 = v23;
  a16 = a11;
  a15 = 552 - v24;
  v25 = *(void (**)(uint64_t *))(v20 + 248);
  v25(&a13);
  v26 = *(_QWORD *)(v17 + 24);
  v27 = (*(_DWORD *)(v17 + 16) ^ 0xFE7BFDFD) + 1610546107 + ((2 * *(_DWORD *)(v17 + 16)) & 0xFCF7FBFA);
  v28 = 235795823 * ((2 * (&a13 & 0x5DF8EFA0) - &a13 + 570888284) ^ 0xB6AA5905);
  a16 = a11;
  a14 = v26;
  a17 = v27 ^ v28;
  a15 = 552 - v28;
  v29 = ((uint64_t (*)(uint64_t *))v25)(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((1509 * ((_DWORD)a13 == v19)) ^ 0x2F0u)) - 8))(v29);
}

uint64_t sub_21B52C020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, unsigned int a15, int a16, unint64_t *a17, unsigned int a18)
{
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;

  v23 = (((&a13 | 0xD70EB012) - (&a13 & 0xD70EB012)) ^ 0x4ACE218) * v19;
  a17 = &STACK[0x236606C007542B32];
  a14 = a11;
  a18 = 293267427 - v23;
  a15 = v23 ^ 0xD5A9A13E;
  a16 = (v22 - 2024873835) ^ v23;
  v24 = sub_21B5327E0((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((1274 * (a13 == v18)) ^ v22)) - (v21 ^ 0x4C8)))(v24);
}

uint64_t sub_21B52C0D8()
{
  void (*v0)(unint64_t **);
  unsigned int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t *v9;
  uint64_t v10;
  unsigned int v11;

  v9 = &STACK[0x509D13A7D8C2F360];
  v10 = v6;
  v11 = v4 - 944348131 * (((&v9 | 0xDE495C6B) - (&v9 & 0xDE495C6B)) ^ 0x7D50F825) - 297;
  ((void (*)(unint64_t **))(*(_QWORD *)(v2 + 8 * (v4 - 620)) - 12))(&v9);
  HIDWORD(v9) = v4
              - 1543737703 * ((&v9 & 0x395EF543 | ~(&v9 | 0x395EF543)) ^ 0xB8555AC0)
              + 128;
  v10 = v6;
  sub_21B5200C0((uint64_t)&v9);
  LODWORD(v9) = (v4 + 545) ^ ((((&v9 | 0x23D67D8B) - &v9 + (&v9 & 0xDC298270)) ^ 0xF0742F81)
                            * v3);
  v10 = v6;
  v0(&v9);
  v10 = v7;
  LODWORD(v9) = (((v4 + 1705163748) & 0x5EB) + 81) ^ (((((2 * &v9) | 0x20E29964)
                                                      - &v9
                                                      + 1871622990) ^ 0x43D31EB8)
                                                    * v3);
  v0(&v9);
  return v8 ^ v1;
}

void sub_21B52C288(uint64_t a1)
{
  int v1;

  v1 = 831981571 * ((a1 & 0x847A176C | ~(a1 | 0x847A176C)) ^ 0xE22438B7);
  __asm { BR              X9 }
}

uint64_t sub_21B52C330@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  int v2;

  return (*(uint64_t (**)(void))(a2 + 8 * ((((a1 + 615) ^ a1 ^ 0x472 ^ 0x7BB) * (v2 == 124626232)) ^ a1)))();
}

uint64_t sub_21B52C384@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (a1 + 761)) - 12))();
}

uint64_t sub_21B52C494@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W7>, uint64_t a4@<X8>)
{
  int v4;
  int v5;

  return (*(uint64_t (**)(void))(a4 + 8 * (((((v5 - 3) | a3) + ((v5 + a1) & a2) - 1180) * (v4 == 0)) ^ v5)))();
}

uint64_t sub_21B52C4C8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return (*(uint64_t (**)(void))(a1 + 8 * ((53 * (((v1 == 0) ^ (v2 + 60)) & 1)) ^ v2)))();
}

uint64_t sub_21B52C4FC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v6 = v3 + v1;
  v7 = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(v2 - 0x70F4C230EE5E63E7) + 4 * (v6 + v5 + 583)) = v4;
  *(_DWORD *)(v2 - 0x70F4C230EE5E63EBLL) = v7;
  v8 = v1 + v7;
  v9 = v8 + 1820;
  if (v8 + 1820 < 0)
    v9 = -1820 - v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((60
                                          * ((int)(v1
                                                 + (v9 ^ (v5 + 2106469161))
                                                 + ((2 * v9) & 0xFB1C5FFC)
                                                 - 822094290
                                                 + ((v5 + 1843223241) & 0x9222A77D)) > 0)) ^ (v5 + 690)))
                            - 12))();
}

uint64_t sub_21B52C5D8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  _QWORD *v2;
  int v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((155 * (*(_DWORD *)(*v2 + 4 * v4) != v1)) ^ v3)) - 12))();
}

uint64_t sub_21B52C600@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (int)((60
                                               * ((int)(v1
                                                      + v2
                                                      + 47 * ((v3 + 663394507) & 0xD87562BC ^ 0x28D)
                                                      - 1928
                                                      + ((47 * ((v3 + 663394507) & 0xD87562BC ^ 0x28D) + 1843222551) & 0x9222A77D)) > 0)) ^ (47 * ((v3 + 663394507) & 0xD87562BC ^ 0x28D))))
                            - 12))();
}

uint64_t sub_21B52C674(uint64_t result)
{
  int v1;
  _DWORD *v2;
  int v3;
  int v4;

  if ((v1 + 1819) >= 0x7FFFFFFF)
    v4 = -1726215080 - v3;
  else
    v4 = v3;
  *v2 = v4;
  *(_DWORD *)(result + 8) = 1400450069;
  return result;
}

void sub_21B52C6BC(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) - 0x74D1826BB13E78BALL) + 573386835;
  v3 = *(_DWORD *)(a1 + 8) - v1 + 1393802990;
  v4 = v2 < 0x8506059C;
  v5 = v2 > v3;
  if (v3 < 0x8506059C != v4)
    v5 = v4;
  __asm { BR              X9 }
}

uint64_t sub_21B52C7B4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((*(unsigned __int8 *)(*(_QWORD *)(a1 + 16)
                                                                  + (v2 - 1658377546))
                                             - ((2
                                               * *(unsigned __int8 *)(*(_QWORD *)(a1 + 16)
                                                                    + (v2 - 1658377546))) & 0x78)
                                             + 1116059964) & 0x1F) != 3)
                                          * (((v3 + 627) | 0x140) ^ 0x55C)) ^ v3))
                            - 4))();
}

uint64_t sub_21B52C81C()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  _BOOL4 v4;

  if (v2 + 1804221811 < ((v3 - 1240) ^ 0xCE6312D2) != v0 - 1670329331 < ((v3 + 892891806) & 0xCAC78D7F) - 832369316)
    v4 = v2 + 1804221811 < ((v3 - 1240) ^ 0xCE6312D2);
  else
    v4 = v2 + 1804221811 > (v0 - 1670329331);
  return (*(uint64_t (**)(void))(v1 + 8 * ((30 * v4) ^ v3)))();
}

uint64_t sub_21B52C8A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v5 = *(char *)(v1 + (v3 + 1));
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v2
                                                              + 8
                                                              * ((549 * (v5 <= (char)(v4 ^ 0x36 ^ (v4 + 37) ^ 0x2E))) ^ v4))
                                                  - 4))(a1, ((2 * v5) & 0x1FC) + (*(unsigned __int8 *)(v1 + (v3 + 1)) ^ 0xFDFFBDFE) + 1536751616);
}

uint64_t sub_21B52C918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((2038
                                          * (((((v7 + (a6 ^ 0x774) - 1784) & 0x7F ^ 0x7D6DEEEF)
                                             + ((2 * (v7 + (a6 ^ 0x774) - 1784)) & 0xDE)) & 0x7D6DEFFC) == a6 + 2104356194)) ^ a6))
                            - 4))();
}

uint64_t sub_21B52C97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v9 = v7 + a5 - 252197477;
  v10 = v9 < 0xD13E89D2;
  v11 = v9 > v5 - 1622392028;
  if ((v5 - 1622392028) < 0xD13E89D2 != v10)
    v11 = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (v8 ^ (489 * !v11)))
                            - ((11 * ((v8 - 619894595) & 0x24F2D568 ^ 0x55Du)) ^ 0x557)))();
}

uint64_t sub_21B52CA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;

  v10 = *(unsigned __int8 *)(v5 + (v8 + v7 + 2));
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v6
                                                              + 8
                                                              * ((14
                                                                * (((v9 - 1093410181) & 0x412C19FE)
                                                                 + (((v9 - 1037) | 0x44C) ^ 0xFBBB737B)
                                                                 + a5 != 2032756398)) ^ v9))
                                                  - 8))(a1, (v10 ^ 0xDDFDF7FE) + 2073738752 + ((2 * v10) & 0x1FC));
}

uint64_t sub_21B52CAB8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, unsigned int a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v8 + (a6 + v11 + 1375)) | (a2 << 8);
  return (*(uint64_t (**)(uint64_t, _QWORD))(v9 + 8 * ((1618 * (v10 - 1 == a7)) ^ a8)))(a1, ((v12 + 1732903424) ^ 0x5DB9FDFE) - 69289984 + ((2 * (v12 + 1732903424)) & 0xBB73FBFC));
}

uint64_t sub_21B52CB2C(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  _BOOL4 v11;

  v8 = a2 + v5 + v6 + v7 + 687430421 + 427754160;
  v9 = v3 + 1248170316;
  v10 = (v9 < a3 + 2086130331) ^ (v8 < 0x7C57D7FA);
  v11 = v8 > v9;
  if (v10)
    v11 = v8 < 0x7C57D7FA;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1234 * !v11) ^ (a3 - 977))) - 4))();
}

uint64_t *sub_21B52CBB8@<X0>(uint64_t *result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v9 = result[5];
  v8 = result[6];
  v10 = *result;
  *a3 = v5;
  *(_DWORD *)(v10 - 0x49D4471502D1C54) = v4;
  *(_DWORD *)(v9 - 0x494C66A0B3646FAELL) = a2;
  *(_QWORD *)(v8 - 0x691BF935B213C188) = v3 + v7 - 155198635 + 5 * (v6 ^ 0x9Du);
  *((_DWORD *)result + 6) = -611232798;
  return result;
}

void sub_21B52CC34(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 32) - 2078219279 * ((a1 & 0x58BF7D47 | ~(a1 | 0x58BF7D47)) ^ 0x7DBA14CC);
  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(*(_QWORD *)a1 - 0x71987668E2707355);
  v11 = v4;
  v12 = v1 - 831981571 * (((&v7 | 0x6BA93D2F) + (~&v7 | 0x9456C2D0)) ^ 0xF208ED0A) - 479;
  v8 = v3;
  v9 = &STACK[0x70F4C230EE5E641F];
  v7 = v2;
  ((void (*)(uint64_t *))((char *)*(&off_24DE82D70 + (v1 ^ 0x703)) - 8))(&v7);
  v6 = *(_QWORD *)(v2 - 0x71987668E270735DLL);
  LODWORD(v7) = v1 + 1224239923 * (&v7 ^ 0xF2B3FDD7) - 1504;
  v8 = v6;
  v9 = &STACK[0x70F4C230EE5E640F];
  sub_21B522F20((uint64_t)&v7);
  HIDWORD(v7) = v1
              + 235795823
              * (((&v7 | 0x9DE08D79) - &v7 + (&v7 & 0x621F7280)) ^ 0x94DC420)
              - 36;
  v8 = v5;
  sub_21B520854((uint64_t)&v7);
  __asm { BR              X8 }
}

uint64_t sub_21B52CE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t), uint64_t a11)
{
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)(v18 - 120) = v15;
  *(_QWORD *)(v18 - 112) = v14;
  *(_DWORD *)(v18 - 104) = v16
                         - 831981571 * ((((v18 - 144) | 0x998897CF) - ((v18 - 144) & 0x998897CF)) ^ 0x2947EB)
                         + 230;
  *(_QWORD *)(v18 - 144) = v13;
  *(_QWORD *)(v18 - 136) = a11;
  *(_QWORD *)(v18 - 128) = v15;
  v19 = a10(v18 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11
                                                      + 8
                                                      * ((89 * (v17 + v12 - 1 < ((v16 + 60) | 0x289u) + 2147481698)) ^ ((v16 + 60) | 0x289)))
                                          - 8))(v19);
}

uint64_t sub_21B52CF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  *(_QWORD *)(v18 - 144) = v16;
  *(_QWORD *)(v18 - 136) = v15;
  *(_QWORD *)(v18 - 120) = v14;
  *(_QWORD *)(v18 - 112) = v16;
  *(_DWORD *)(v18 - 128) = v17
                         + 1224239923 * ((((2 * (v18 - 144)) | 0x3E2D04DA) - (v18 - 144) + 1625914771) ^ 0x6DA57FBA)
                         - 104;
  ((void (*)(uint64_t))((char *)*(&off_24DE82D70 + (int)(v17 - 1084)) - 4))(v18 - 144);
  v19 = 1224239923 * ((~((v18 - 144) | 0x81E2D239) + ((v18 - 144) & 0x81E2D239)) ^ 0x8CAED011);
  *(_QWORD *)(v18 - 136) = a12;
  *(_DWORD *)(v18 - 144) = -100409531 - v19 + v13;
  *(_DWORD *)(v18 - 128) = v19 + v17 - 800;
  v20 = sub_21B527450(v18 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v12
                                                      + 8 * (int)((492 * (*(_DWORD *)(v18 - 124) != 908458790)) ^ v17))
                                          - (v17 ^ 0x4DCLL)))(v20);
}

uint64_t sub_21B52D00C()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((89 * (v3 + v1 - 1 < (v2 + 2147481698))) ^ v2)) - 8))();
}

uint64_t sub_21B52D048()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = *(_QWORD *)(v9 + 8);
  v7 = 1178560073 * ((v5 - 144) ^ 0xB3B39EC1);
  *(_QWORD *)(v5 - 144) = v11;
  *(_DWORD *)(v5 - 136) = (v3 - 552) ^ v7;
  *(_DWORD *)(v5 - 132) = v7 + 680783112;
  sub_21B528208(v5 - 144);
  *(_DWORD *)(v5 - 104) = v3 - 831981571 * (((v5 - 144) & 0x996BC2F7 | ~((v5 - 144) | 0x996BC2F7)) ^ 0xFF35ED2C) - 479;
  *(_QWORD *)(v5 - 128) = v4;
  *(_QWORD *)(v5 - 120) = v4;
  *(_QWORD *)(v5 - 112) = v2;
  *(_QWORD *)(v5 - 144) = v1;
  *(_QWORD *)(v5 - 136) = v11;
  v10(v5 - 144);
  *(_QWORD *)(v5 - 136) = v4;
  *(_QWORD *)(v5 - 128) = v6;
  *(_DWORD *)(v5 - 144) = v3 + ((v5 + 916830519 - 2 * ((v5 - 144) & 0x36A5B9C7)) ^ 0xC4164410) * v0 - 1504;
  return sub_21B522F20(v5 - 144);
}

void sub_21B52D164(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) ^ (831981571 * ((a1 & 0x1D931503 | ~(a1 | 0x1D931503)) ^ 0x7BCD3AD8));
  __asm { BR              X8 }
}

uint64_t sub_21B52D224()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1211 * (*v1 == 0)) ^ v0))
                            - ((v0 - 1004101588) & 0x3BD95FB6)
                            + 522))();
}

uint64_t sub_21B52D2A8@<X0>(int a1@<W8>)
{
  uint64_t (*v1)(uint64_t *);
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v6 = (((&v8 | 0x158D4A80) - (&v8 & 0x158D4A80)) ^ 0xE73EB757) * v2;
  v11 = 0x4670A1604A080045;
  v8 = v5;
  v9 = v6 ^ a1;
  v10 = v6 + v3 + 411 - 78;
  v12 = v6 ^ 0xDC6A8CD;
  result = v1(&v8);
  *(_DWORD *)(v4 + 12) = *(_DWORD *)(v5 - 0x4FF269813004C2D3);
  return result;
}

uint64_t sub_21B52D58C(_DWORD *a1, uint64_t a2)
{
  return ((uint64_t (*)(void))qword_24DE7E490[(1643 * ((*a1 + *(_DWORD *)(a2 + 4) + 815806988) < 0xC9)) ^ 0x225u])();
}

uint64_t sub_21B52D5D0@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return (*(uint64_t (**)(void))(a1 + 8 * ((1358 * (v1 != 1503180286)) ^ 0x351u)))();
}

uint64_t sub_21B52D604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;
  _BOOL4 v7;

  *(_BYTE *)(a1 + (v3 + v4) + 4) = (**(_BYTE **)(a2 + 8) ^ 0x2B)
                                               + ((2 * **(_BYTE **)(a2 + 8)) & 0x56)
                                               - 32;
  v5 = *(_DWORD *)(a2 + 4) - 1207255109;
  v6 = v5 < 0x11A375B9;
  v7 = v5 > 0x11A375BA;
  if (v6)
    v7 = v6;
  return (*(uint64_t (**)(void))(a3 + 8 * ((121 * !v7) ^ 0x328u)))();
}

void sub_21B52D6A4()
{
  JUMPOUT(0x21B52D634);
}

uint64_t sub_21B52D6AC()
{
  return 4294925278;
}

uint64_t sub_21B52D6B4(_DWORD *a1)
{
  int v1;
  int v2;
  int v3;

  *((_BYTE *)a1 + (v3 ^ (v2 + 547)) + v1 + 4) = 11;
  *a1 = v1;
  return 0;
}

void sub_21B52D6D8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1543737703 * (((a1 | 0x3B4869BB) - a1 + (a1 & 0xC4B79644)) ^ 0x45BC39C7);
  __asm { BR              X8 }
}

uint64_t sub_21B52D77C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v1 ^ 0x617)))(200, 2354554103) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((v3 * ((v1 + 703162314) & 0xD61695F0 ^ 0x532)) ^ v1)) - 8))();
}

uint64_t sub_21B52D7DC(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 8 * (v6 - 1656)))(a1, 0);
  if ((_DWORD)result == 16)
  {
    v3 = -1189680931;
    goto LABEL_7;
  }
  if ((_DWORD)result == 12)
  {
LABEL_7:
    result = (*(uint64_t (**)(uint64_t))(v5 + 8 * (v2 - 1174)))(a1);
    goto LABEL_8;
  }
  if ((_DWORD)result)
  {
    v3 = -1878395056;
    goto LABEL_7;
  }
  *v4 = a1;
  v3 = 991670950;
LABEL_8:
  *v1 = 2042935621 * v3 - 799612094;
  return result;
}

void sub_21B52D870(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 12) - 460628867 * ((a1 - 2 * (a1 & 0x5F08693C) + 1594386748) ^ 0x139EEB41);
  __asm { BR              X10 }
}

uint64_t sub_21B52D940@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unsigned int a4, int a5, unint64_t *a6, int a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v10 = 1224239923 * ((&a3 + 630909902 - 2 * ((unint64_t)&a3 & 0x259AEBCE)) ^ 0xD7291619);
  a6 = &STACK[0x4670A1604A080045];
  a4 = v10 ^ 0xE51451F2;
  a5 = v10 + v8 + 26;
  a3 = v7;
  a7 = v10 ^ 0xDC6A8D1;
  v11 = (*(uint64_t (**)(uint64_t *))(a1 + 8 * (v8 - 771)))(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v7 - 0x4FF269813004C2D3) == -611232798)
                                                        * ((v8 - 13) ^ 0x555)) ^ v8))
                                          - 8))(v11);
}

void sub_21B52DA18(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;
  _BYTE *v5;

  v4 = 1972395211 * (*(_DWORD *)(v1 + 8) - v2)
     - (((*(_DWORD *)(v1 + 8) - v2) * (v3 ^ 0x2B20BACF) + 252258834) & 0x316E9FBE)
     + 1077667048;
  *v5 = (HIBYTE(v4) ^ 0x98) - ((v4 >> 23) & 0xCA) - 27;
  v5[1] = (BYTE2(v4) ^ 0xB7) - ((2 * (BYTE2(v4) ^ 0xB7)) & 0xCA) - 27;
  v5[2] = (BYTE1(v4) ^ 0x4F) + (~(2 * (BYTE1(v4) ^ 0x4F)) | 0x35) - 26;
  v5[3] = v4 ^ 0x3A;
  *(_DWORD *)(v1 + 16) = *a1;
}

void sub_21B52DAFC(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 1224239923 * (((a1 | 0xB0B3EA14) - (a1 & 0xB0B3EA14)) ^ 0x420017C3);
  v2 = *(_DWORD *)(a1 + 8) ^ v1;
  __asm { BR              X14 }
}

uint64_t sub_21B52DBBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v5 = ((v3 ^ 0x88AA1108) - v4) & 0xD8673ECE;
  v6 = 1543737703 * ((2 * (v8 & 0x3C83A498) - v8 + 1132223328) ^ 0x3D880B1C);
  v9 = a1;
  v8[0] = v6 - v2 - v5 - 1333221090;
  v8[1] = v6 + v3 - 441;
  return ((uint64_t (*)(_DWORD *))(*(_QWORD *)(v1 + 8 * (v3 ^ 0x2BF)) - 8))(v8);
}

uint64_t sub_21B52DD20(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(qword_24DE7E490[(1102 * (*(_DWORD *)(a2 + 4) == 1503180287)) | 0x130u] - 4))();
}

uint64_t sub_21B52DD5C(uint64_t a1, uint64_t a2)
{
  char v2;

  if (**(_BYTE **)(a2 + 8))
    v2 = 120;
  else
    v2 = 119;
  *(_BYTE *)(a1 + 88) = v2;
  return 0;
}

uint64_t sub_21B52DD8C()
{
  return 4294925278;
}

void sub_21B52DD94(uint64_t a1)
{
  unint64_t v2;
  _BYTE v3[8];

  v2 = (unint64_t)&v3[qword_255184948 - qword_255184950];
  qword_255184950 = 1209664481 * v2 - 0x2D0DE72C84818051;
  qword_255184948 = 1209664481 * (v2 ^ 0xD2F218D37B7E7FAFLL);
  ((void (*)(char *, void (*)()))*(&off_24DE82D70
                                            + ((-31
                                                                             * (qword_255184950 ^ 0xAF ^ qword_255184948)) ^ byte_21B55FC50[byte_21B55C590[(-31 * (qword_255184950 ^ 0xAF ^ qword_255184948))] ^ 0x81])
                                            + 201))((char *)*(&off_24DE82D70+ ((-31 * ((qword_255184948 + qword_255184950) ^ 0xAF)) ^ byte_21B55FB50[byte_21B55C490[(-31 * ((qword_255184948 + qword_255184950) ^ 0xAF))] ^ 0x69])- 104)- 8, sub_21B5336D0);
  __asm { BR              X10 }
}

uint64_t sub_21B52DEB4()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8 * ((638 * (*(_QWORD *)(*(_QWORD *)(v1 + 1752) - 4) == 0)) | 0x180u))
                            - 12))();
}

uint64_t sub_21B52DEEC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 821)))(v1);
}

uint64_t sub_21B52DF08(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  _BOOL4 v4;

  v1 = *(_DWORD *)(a1 + 12) - 2078219279 * ((2 * (a1 & 0x479290AB) - a1 - 1200787628) ^ 0x6297F920);
  v2 = *((_DWORD *)*(&off_24DE82D70 + v1 - 988) + 84);
  v3 = *(_DWORD *)(a1 + 8) + 2078219279 * ((2 * (a1 & 0x479290AB) - a1 - 1200787628) ^ 0x6297F920) - 292729275;
  if (v3 < 0x2EDE8C1D != v2 > 0xD12173E2)
    v4 = v2 > 0xD12173E2;
  else
    v4 = v2 + 786336797 > v3;
  return (*((uint64_t (**)(void))*(&off_24DE82D70 + v1 - 1008) + ((!v4 * ((54 * (v1 ^ 0x40D)) ^ 0x5F1)) ^ v1)))();
}

uint64_t sub_21B52DFFC()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = v1 - 1642878095;
  v5 = v4 < ((((v3 + 546) | 0x48) - 590) ^ 0xDE64ED57);
  v6 = v2 - 563812023 < v4;
  if (v2 > 0x219B16B6 != v5)
    v6 = v5;
  return (*(uint64_t (**)(void))(v0 + 8 * ((28 * v6) ^ v3)))();
}

uint64_t sub_21B52E074(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  _BOOL4 v8;

  v5 = *(_DWORD *)(v4 + 340);
  v6 = ((v3 + 1014900723) & 0xC381D5BE) + *(_DWORD *)(a1 + 16) + v1 + 1019514231;
  v7 = (v5 > 0x68CB3D80) ^ (v6 < 0x9734C27F);
  v8 = v5 - 1758150017 > v6;
  if (v7)
    v8 = v5 > 0x68CB3D80;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((329 * !v8) ^ v3)) - 12))();
}

uint64_t sub_21B52E104()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = v2 + ((v1 - 594) | 4) - 1291052942 + 71 * (v1 ^ 0x67B);
  v5 = v4 < 0xD7C53DB;
  v6 = v3 + 226251739 < v4;
  if (v3 > 0xF283AC24 != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((30 * !v6) ^ v1)) - 12))();
}

uint64_t sub_21B52E18C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _BOOL4 v7;

  v5 = *(_DWORD *)(v3 + 352);
  v6 = *(_DWORD *)(a1 + 4) - v1 + 2097455302;
  if (v5 > 0x1DAB7259 != v6 < 0xE2548DA6)
    v7 = v5 > 0x1DAB7259;
  else
    v7 = v5 - 497775194 > v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((13 * v7) ^ v4)) - ((v4 - 579) ^ 0x412)))();
}

_DWORD *sub_21B52E204@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;

  v4 = v2 + 1052256821;
  v5 = v4 < 0xA4081715;
  v6 = v3 - 1542973675 < v4;
  if (v3 > 0x5BF7E8EA != v5)
    v6 = v5;
  if (v6)
    v7 = a2;
  else
    v7 = a2 + 1;
  *result = v7;
  return result;
}

void sub_21B52E258(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_21B52E388(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  _BOOL4 v11;

  v9 = *(unsigned __int8 **)(v5 + 8 * (a3 + v7 - 382));
  v11 = ((**(unsigned __int8 **)(v8 + 80) - (*v9 ^ 0xE5)) ^ 0x79D5F7BD)
      + ((2 * (**(unsigned __int8 **)(v8 + 80) - (*v9 ^ 0xE5))) & 0xF3ABEF7A)
      - 553649280 == ((v7 + 415) ^ 0x663) - 1713016625
     && a5 != 1570457202;
  __asm { BR              X15 }
}

uint64_t sub_21B52F4B4@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = a1 + v5 + 20 * (a2 ^ 0x605u);
  *(_BYTE *)(v4 + v7) = *(_BYTE *)(a3 + v7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((289 * (a1 - 1 == v3)) | a2)) - 8))();
}

void sub_21B52F4FC(_DWORD *a1)
{
  unsigned int v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *a1 + 1543737703 * (a1 ^ 0x7EF4507C);
  v2[1] = v1
        + 944348131 * ((-47560184 - (v2 | 0xFD2A4A08) + (v2 | 0x2D5B5F7)) ^ 0xA1CC11B9)
        - 504207724;
  sub_21B532C9C(v2);
  __asm { BR              X8 }
}

uint64_t sub_21B52F5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, unsigned int a14, int a15)
{
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  a13 = &STACK[0x543300C3A69A2019];
  a14 = (v16 - 102) ^ (831981571 * (((&a13 | 0xDD96D32D) - (&a13 & 0xDD96D32D)) ^ 0x44370309));
  sub_21B524100((uint64_t)&a13);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17
                                                                                + 8
                                                                                * ((1457
                                                                                  * (a15 == ((v16 + 477586441) & 0xE3889DFB ^ (v15 + 1581)))) ^ v16)))(v18, v19, v20, v21, v22);
}

uint64_t sub_21B52F698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, int a16)
{
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;

  v22 = *(_DWORD *)(v16 + 8) + v20;
  v23 = 460628867 * ((&a13 & 0xDE65B475 | ~(&a13 | 0xDE65B475)) ^ 0x6D0CC9F7);
  a13 = a11;
  a14 = v23 + 1975134435 * v22 - 580120072;
  a15 = v23 + v18 - 354;
  v24 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v19 + 8 * (v18 - 1028)) - 12))(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21
                                                      + 8
                                                      * (((2 * (a16 == v17 + 694)) | (4 * (a16 == v17 + 694))) ^ v18))
                                          - ((v18 - 517) ^ 0x2BELL)))(v24);
}

uint64_t sub_21B52F75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, unsigned int a15, int a16, unint64_t *a17, unsigned int a18)
{
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;

  v21 = 69008221 * ((&a13 & 0x777DE88 | ~(&a13 | 0x777DE88)) ^ 0x2B2A737D);
  a18 = -1601384568 - v21;
  a17 = &STACK[0x236606C007542B42];
  a14 = a11;
  a15 = v21 ^ 0xD5A9A13E;
  a16 = (v19 - 2024874294) ^ v21;
  v22 = sub_21B5327E0((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20
                                                      + 8
                                                      * ((839 * (a13 == ((v19 + 1600661252) & 0xA097D6F6) + v18)) ^ v19))
                                          - 8))(v22);
}

uint64_t sub_21B52F830()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  void (*v6)(unint64_t **);
  int v7;
  int v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  unsigned int v15;

  v7 = (v4 - 1159) | 0x282;
  v15 = v4
      - ((-452153877 - (&v13 | 0xE50CADEB) + (&v13 | 0x1AF35214)) ^ 0xB9EAF65A) * v3
      - 756;
  v13 = &STACK[0x509D13A7D8C2F350];
  v14 = v12;
  ((void (*)(unint64_t **))(*(_QWORD *)(v5 + 8 * (v4 - 1079)) - 12))(&v13);
  HIDWORD(v13) = v4
               - (((&v13 | 0xCA362C9F) - &v13 + (&v13 & 0x35C9D360)) ^ 0xB4C27CE3)
               * v2
               - 331;
  v14 = v12;
  sub_21B5200C0((uint64_t)&v13);
  if ((_DWORD)v13 == v7 + v1)
    v8 = v10;
  else
    v8 = (int)v13;
  v14 = v12;
  LODWORD(v13) = (v4 + 86) ^ (69008221
                            * (((&v13 | 0x4FA550F0) - (&v13 & 0x4FA550F0)) ^ 0x9C0702FA));
  v6(&v13);
  LODWORD(v13) = (v7 + 603) ^ (69008221
                             * ((&v13 & 0x59DC50EA | ~(&v13 | 0x59DC50EA)) ^ 0x7581FD1F));
  v14 = v11;
  result = ((uint64_t (*)(unint64_t **))v6)(&v13);
  *(_DWORD *)(v0 + 4) = v8;
  return result;
}

void sub_21B52F9F4(uint64_t a1)
{
  int v1;
  _BOOL4 v2;

  v1 = *(_DWORD *)(a1 + 4) ^ (69008221 * ((2 * (a1 & 0x38A42EE8) - a1 - 950284009) ^ 0x14F9831D));
  v2 = (*(_BYTE *)a1 - 93 * ((2 * (a1 & 0xE8) - a1 + 23) ^ 0x1D)) == 66;
  __asm { BR              X11 }
}

uint64_t sub_21B52FAB8@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((206 * (*v1 != (a1 ^ 0x272))) ^ a1)) - 4))();
}

uint64_t sub_21B52FAF8@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  unsigned int *v4;
  int v5;
  uint64_t v6;

  v5 = a1 - 33;
  v6 = v3(*v4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8 * ((1344 * (((*v1 == 0) ^ v5) & 1)) ^ v5))
                                          - 8))(v6);
}

uint64_t sub_21B52FB30()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t (*v2)(_QWORD);
  unsigned int *v3;
  uint64_t result;

  result = v2(*v3);
  *v1 = 0;
  *(_DWORD *)v0 = 0;
  *(_QWORD *)(v0 + 344) = 0;
  *(_QWORD *)(v0 + 352) = 0;
  *(_DWORD *)(v0 + 360) = 1494468667;
  *(_DWORD *)(v0 + 56) = 1994143143;
  return result;
}

uint64_t sub_21B52FB70@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((1344 * (((*v1 == 0) ^ a1 ^ 0x23) & 1)) ^ a1 ^ 0x23))
                            - 8))();
}

void sub_21B52FBA4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_21B52FC28@<X0>(int a1@<W8>)
{
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((58
                                          * (((a1 - 1503180286) ^ 0x7DDF7BE79F56FFBFLL)
                                           - 0x7DDF7BE7774F109ALL
                                           + ((2 * (a1 - 1503180286)) & 0x13EADFF7ELL) == 671608613)) ^ 0x98u))
                            - 4))();
}

uint64_t sub_21B52FCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = ((v9 - a6 - 544) ^ (v9 - 452) ^ 0x88E4AED053E9CFD0) + v10;
  LODWORD(v12) = *(unsigned __int8 *)(v8 + v12) - *(unsigned __int8 *)(v7 + v12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11
                                                      + 8
                                                      * ((1304
                                                        * (((2 * (_DWORD)v12) & 0xE7D4BB66) + (v12 ^ v6) == v6)) ^ v9))
                                          - 12))(4294925278);
}

uint64_t sub_21B52FD4C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  int v8;
  _BOOL4 v9;

  v6 = v1 < v2;
  v7 = v4 - 0x771B512F5CF65F71 + ((v3 - 135) | 0xC0u);
  v8 = v6 ^ (v7 < (unint64_t)(v3 + 452) + v0);
  v9 = v7 < v1;
  if (!v8)
    v6 = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((58 * !v6) ^ v3)) - 4))();
}

uint64_t sub_21B52FDB8@<X0>(int a1@<W0>, int a2@<W8>)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * (((a2 == ((a1 + 686324897) ^ 0x7170CB75)) * ((a1 - 90) ^ 0x75)) | a1))
                                          - 8))(4294925278);
}

uint64_t sub_21B52FE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                                 + 8
                                                                                 * ((236
                                                                                   * (((2 * (*v3 - 42)) & 0xF3ABEF7A)
                                                                                    + ((v4 - 8) ^ 0x79D5F7D2 ^ (*v3 - 42)) == 2044065725)) ^ v4))
                                                                     - 12))(a1, a2, a3, -686325110);
}

uint64_t sub_21B52FE6C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  v5 = 28 * (v3 ^ 0x5F) + *(unsigned __int8 *)(v2 + 1) - 1254;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1962 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0 + 3 * (v3 ^ 0x52) - 111)) ^ v3))
                            - 12))();
}

uint64_t sub_21B52FED4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v5 = (((v3 - 1080) | 0x47) ^ 0xFFFFFFD7) + *(unsigned __int8 *)(v2 + 2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((386 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) | v3)) - 8))();
}

uint64_t sub_21B52FF28()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((529
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
                                           + ((v0 + ((v3 - 81323113) & 0x4D8E07F) - 119) ^ (*(unsigned __int8 *)(v2 + 3)
                                                                                          - 134)) == v0)) ^ v3))
                            - 8))();
}

uint64_t sub_21B52FF8C()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((294
                                          * ((((*(unsigned __int8 *)(v2 + 4) - 247) << ((v3 - 8) ^ 0x6E)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_21B52FFDC()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0)
                                          * ((v3 - 1656213640) & 0x22B7D07F ^ 0x12C)) ^ v3))
                            - 12))();
}

uint64_t sub_21B530038()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  int v5;

  v5 = ((v3 + 1976506360) ^ 0x75CF1C0F) + *(unsigned __int8 *)(v2 + 6) - 1121;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((801 * (((v5 << (v3 - 118)) & v1) + (v5 ^ v0) == v0)) ^ v3)) - 12))();
}

uint64_t sub_21B5300A4()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v3 ^ 0x40F ^ (v1 - 101)) & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                          + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0 + ((v3 - 1117) | 0x74) - 119) | v3))
                            - 8))();
}

uint64_t sub_21B530100()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1060
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 4)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 4) ^ v0) == v0)) ^ v3))
                            - ((v3 - 84) | 0x4Cu)
                            + 99))();
}

uint64_t sub_21B530150(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 1147367164;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1367 * (*(_DWORD *)(a2 + 4) == ((((v2 + 1225) | 0x209) - 1754) ^ 0x5998B668))) ^ (v2 + 192)))
                            - 8))();
}

uint64_t sub_21B5301B0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((233 * (((v3 + (v4 ^ 0x6D) + 132 - 134) & (2 * v6)) + (v6 ^ v2) != v2)) ^ v4))
                            - 68 * (v4 ^ 0x6Du)
                            + 124))();
}

uint64_t sub_21B530210()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((905
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0
                                                                                          + ((v3 - 339676310) & 0x143F0FFF)
                                                                                          + 68 * (v3 ^ 0x84)
                                                                                          - 1144)) ^ v3))
                            - 12))();
}

uint64_t sub_21B530278()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)
                                          * (((v2 - 1000) | 0x80) + 1767)) ^ v2))
                            - 8))();
}

uint64_t sub_21B5302B4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == v0)
                                          * ((v2 - 2) ^ 0x3F8)) ^ (v2 - 2)))
                            - 12))();
}

uint64_t sub_21B5302F0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = ((((v2 - 6) | 8) ^ (v1 + 120)) & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
     + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((4 * v5) | (v5 << 9)) ^ v2)) - 12))();
}

uint64_t sub_21B530334()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = v2 + 2 + *(unsigned __int8 *)(v3 + 5) - 149;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1443 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)) - 12))();
}

uint64_t sub_21B530370()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((819
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 6) - 1) ^ v0) == ((8 * v2) ^ 0x7C0 ^ (v0 - 880)))) ^ v2))
                            - 12))();
}

uint64_t sub_21B5303B8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1030
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0)) | v3))
                            - ((v3 - 872) ^ 0xEu)
                            + 126))();
}

uint64_t sub_21B5303F8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2001
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 5)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 5) ^ v0) == v0)) ^ v3))
                            - 68 * (v3 ^ 0x84u)
                            - (((v3 - 134) | 0x137u) ^ 0xFFFFFFFFFFFFFEB3)))();
}

uint64_t sub_21B530454(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 1147367168;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((*(_DWORD *)(a2 + 4) == ((v2 + 1055201144) & 0xC11AE7D8) + 1503180159)
                                          * (((v2 - 461764924) & 0x1B85FF4D) - 1154)) ^ v2))
                            - 8))();
}

uint64_t sub_21B5304D0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1911 * ((v3 & (2 * v6)) + ((v4 + 1345771337) & 0xAFC928FF ^ (v2 - 81) ^ v6) == v2)) | v4)))();
}

uint64_t sub_21B530524()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v5 = *(unsigned __int8 *)(v3 + 1) + (v2 ^ 0xFFFFFFF2);
  return (*(uint64_t (**)(void))(v4 + 8 * ((2035 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_21B530564()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = ((v2 + 8) | 0x41) + *(unsigned __int8 *)(v3 + 2) - 281;
  return (*(uint64_t (**)(void))(v4 + 8 * ((745 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_21B5305A4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = ((v2 - 72) | 0x91) + *(unsigned __int8 *)(v3 + 3) - 343;
  return (*(uint64_t (**)(void))(v4 + 8 * ((578 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) | v2)))();
}

uint64_t sub_21B5305E4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((28
                                * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                 + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ (v0 + 19 * (v2 ^ 0x83) - 209)) == v0)) ^ v2)))();
}

uint64_t sub_21B53062C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                 + ((*(unsigned __int8 *)(v3 + 5) - 13) ^ v0) == v0)
                                * ((v2 ^ 0x59) + 1529)) ^ v2)))();
}

uint64_t sub_21B530664()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v5 = ((11 * (v2 ^ 0x9B)) ^ 0xFFFFFF2E) + *(unsigned __int8 *)(v3 + 6);
  return (*(uint64_t (**)(void))(v4 + 8 * ((923 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_21B5306AC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((445
                                * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
                                 + ((v2 - 881601967) & 0x348C2DF7 ^ v4 ^ (*(unsigned __int8 *)(v3 + 7) - 1)) == v0)) ^ v2)))();
}

uint64_t sub_21B5306F8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v5 = ((v2 - 2026074795) & 0x78C372F3 ^ 0xFFFFFF24) + *(unsigned __int8 *)(v3 + 8);
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v1 & (2 * v5)) + (v5 ^ v0) == v0) * ((v2 + 175) ^ 0x7D5)) ^ v2)))();
}

uint64_t sub_21B530750@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  int v11;

  *(_DWORD *)(*(_QWORD *)(v3 + 96) + 1428) = 1147367180;
  v11 = v1 ^ 0x67E;
  v5 = ((v1 ^ 0x67E) + 1870029167) & 0x908997FF;
  v6 = 831981571 * (((v4 - 120) & 0x8238450D | ~((v4 - 120) | 0x8238450D)) ^ 0xE4666AD6);
  *(_DWORD *)(v4 - 100) = v6 + (v1 ^ 0x67E) - 1882359329;
  *(_QWORD *)(v4 - 112) = v4 + 0x520F56D3BDEB7B1BLL;
  *(_DWORD *)(v4 - 120) = (a1 - 931544543) ^ v6;
  v7 = ((v1 ^ 0x67E) - 1833) | 0x55;
  v8 = sub_21B4EE28C(v4 - 120);
  v9 = *(_DWORD *)v3
     - 326607054
     + ((v7 - 25) & (2 * *(_DWORD *)(v4 - 152)) ^ 4)
     + (*(_DWORD *)(v4 - 152) & (v5 - 121) ^ 0xFFBB1FAD) < 0xFFFFFFC0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 + 8 * ((4 * v9) | (32 * v9) | v11)) - 4))(v8, 686325106, 3072501700);
}

uint64_t sub_21B530948(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;

  v10 = v8 + 4513875;
  if (v10 <= 0x40)
    v10 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((219 * (((a4 - v6 - v7 + v10 < 0xF) ^ (a2 + a6 - 116)) & 1)) ^ a6))
                            - 4))();
}

uint64_t sub_21B5309BC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7)
{
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;

  v12 = v8 + v7;
  v13 = v12 + a6 - a7 - 681811288;
  if (v13 <= 0x40)
    v13 = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1187 * (a4 - v12 >= v10 + v13)) ^ a6)) - 4))();
}

uint64_t sub_21B530A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * ((1008
                                          * (a14 + v17 - 220 + (unint64_t)(v15 + (v14 ^ 0x28AC9D20u)) > 0xF)) ^ a6))
                            - 4))();
}

uint64_t sub_21B530A48@<X0>(int a1@<W1>, int a2@<W6>, int a3@<W8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  int8x16_t v9;
  int8x16_t v10;

  v9.i64[0] = 0xCACACACACACACACALL;
  v9.i64[1] = 0xCACACACACACACACALL;
  v10.i64[0] = 0xE5E5E5E5E5E5E5E5;
  v10.i64[1] = 0xE5E5E5E5E5E5E5E5;
  *(int8x16_t *)(v5 + (a3 + v3 + 10)) = vaddq_s8(vsubq_s8(*v8, vandq_s8(vaddq_s8(*v8, *v8), v9)), v10);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((v6 + 1) & 0x1FFFFFFF0) != 16) * ((v4 - a1 + 117) ^ 0x1A)) ^ (a2 + v4 + 386)))
                            - 12))();
}

void sub_21B530ABC()
{
  JUMPOUT(0x21B530A80);
}

uint64_t sub_21B530AC8()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(v0 ^ (1746 * (v1 == v2))))
                            - (v0 ^ 0x6FLL ^ (v0 + 58087433) & 0xFC89A79F)))();
}

uint64_t sub_21B530B34@<X0>(int a1@<W4>, int a2@<W6>, unsigned int a3@<W8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v8 - 220 + ((a2 + v4 - 30) ^ a3) + v3) = *(_BYTE *)(v5 + v7 - 980889371)
                                                    - ((2 * *(_BYTE *)(v5 + v7 - 980889371)) & 0xCA)
                                                    - 27;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((2008 * ((a1 + v3 + 1) > 0x3F)) ^ (a2 + v4 + 957)))
                            - 12))();
}

uint64_t sub_21B530BA4(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, int a17, int a18, unsigned int a19, int a20,int a21,int a22,uint64_t (*a23)(_QWORD, __n128, __n128, __n128, __n128, __n128),int a24,int a25,uint64_t a26,uint64_t a27,int32x4_t a28,int32x4_t a29,int32x4_t a30,int32x4_t a31)
{
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(_QWORD, __n128, __n128, __n128, __n128, __n128);
  const char *v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  uint8x16_t v52;
  uint16x8_t v53;
  int8x16_t v54;
  int8x16_t v55;
  uint16x8_t v56;
  int8x16_t v57;
  int8x16_t v58;
  uint8x16_t v59;
  uint16x8_t v60;
  uint16x8_t v61;
  uint8x16_t v62;
  int8x16_t v65;
  int8x16_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  uint8x16_t v76;
  uint16x8_t v77;
  uint16x8_t v78;
  uint8x16_t v79;
  uint8x16_t v84;
  uint16x8_t v85;
  uint16x8_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  _DWORD *v91;
  int v92;
  int v93;
  int v94;
  unint64_t v95;
  int v96;
  int8x16x4_t v97;
  int8x16x4_t v98;

  a16 = v32;
  v40 = *(uint64_t (**)(_QWORD, __n128, __n128, __n128, __n128, __n128))(v34 + 8 * v31);
  a20 = a14 + 509163450 + ((v31 - 848374003) & 0x32912AFE ^ (a2 + 486));
  v41 = (const char *)(v39 - 220);
  v42.n128_u64[0] = 0xE5E5E5E5E5E5E5E5;
  v42.n128_u64[1] = 0xE5E5E5E5E5E5E5E5;
  v43 = (__n128)vdupq_n_s32(0x5B9153FAu);
  v44 = (__n128)vdupq_n_s32(0xDB9153E2);
  a26 = v36 - 16;
  v45 = (__n128)vdupq_n_s32(0x5B9153E7u);
  v46.n128_u64[0] = 0xCACACACACACACACALL;
  v46.n128_u64[1] = 0xCACACACACACACACALL;
  v48 = *(_DWORD *)(v39 - 148);
  v47 = *(_DWORD *)(v39 - 144);
  a24 = v48;
  a25 = v47;
  v50 = *(_DWORD *)(v39 - 140);
  v49 = *(_DWORD *)(v39 - 136);
  v51 = *(_BYTE *)(v39 - 124) ^ 0xA4;
  a19 = *(unsigned __int8 *)(v39 - 124) ^ 0xFFFFFFA4;
  if (v51 == 2)
  {
    a21 = v50;
    a22 = v49;
    a23 = v40;
    v98 = vld4q_s8(v41);
    a18 = *(_DWORD *)(v39 - 132);
    v76 = (uint8x16_t)veorq_s8(v98.val[0], (int8x16_t)v42);
    v77 = vmovl_u8(*(uint8x8_t *)v76.i8);
    v78 = vmovl_high_u8(v76);
    v79 = (uint8x16_t)veorq_s8(v98.val[1], (int8x16_t)v42);
    _Q22 = vmovl_u8(*(uint8x8_t *)v79.i8);
    _Q21 = vmovl_high_u8(v79);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v84 = (uint8x16_t)veorq_s8(v98.val[2], (int8x16_t)v42);
    v85 = vmovl_high_u8(v84);
    v86 = vmovl_u8(*(uint8x8_t *)v84.i8);
    v98.val[0] = veorq_s8(v98.val[3], (int8x16_t)v42);
    v98.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v98.val[0]);
    v98.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[1]);
    v98.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[1].i8);
    v98.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v98.val[0].i8);
    v98.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[0]);
    v98.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[0].i8);
    v87 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v86.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v77.i8), 0x18uLL)), v98.val[0]);
    v88 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v86, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v77), 0x18uLL)), v98.val[3]);
    v89 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v85.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v78.i8), 0x18uLL)), v98.val[1]);
    v90 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v85, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v78), 0x18uLL)), v98.val[2]);
    v98.val[0] = veorq_s8(vandq_s8((int8x16_t)v87, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)v98.val & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v98.val[3] = veorq_s8(vandq_s8((int8x16_t)v88, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[3] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v98.val[1] = veorq_s8(vandq_s8((int8x16_t)v89, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[1] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    v98.val[2] = veorq_s8(vandq_s8((int8x16_t)v90, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[2] & __PAIR128__(0xFFFFFF18FFFFFF18, 0xFFFFFF18FFFFFF18)));
    a30 = vaddq_s32(vsubq_s32(v89, vaddq_s32((int32x4_t)v98.val[1], (int32x4_t)v98.val[1])), (int32x4_t)v44);
    a31 = vaddq_s32(vsubq_s32(v90, vaddq_s32((int32x4_t)v98.val[2], (int32x4_t)v98.val[2])), (int32x4_t)v44);
    a28 = vaddq_s32(vsubq_s32(v87, vaddq_s32((int32x4_t)v98.val[0], (int32x4_t)v98.val[0])), (int32x4_t)v44);
    a29 = vaddq_s32(vsubq_s32(v88, vaddq_s32((int32x4_t)v98.val[3], (int32x4_t)v98.val[3])), (int32x4_t)v44);
    v91 = (_DWORD *)&a28 + v38 + 1142003576;
    v92 = *(v91 - 8) ^ *((_DWORD *)&a28 + ((v38 + 182) ^ 0x1DB) + 1142003576);
    v93 = v92 + v37 - (a3 & (2 * v92));
    v94 = *(v91 - 16) ^ *(v91 - 14);
    HIDWORD(v95) = v94 ^ 0x5B9153E2 ^ v93;
    LODWORD(v95) = v94 ^ ~v93;
    *v91 = (v95 >> 31) + v37 - (a3 & (2 * (v95 >> 31)));
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v34 + 8 * ((117 * (v36 == 1142003513)) ^ 0x6ACu)) - 4))(1207959552);
  }
  else if (v51 == 1)
  {
    a21 = v50;
    a22 = v49;
    a23 = v40;
    v97 = vld4q_s8(v41);
    v52 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v42);
    v53 = vmovl_u8(*(uint8x8_t *)v52.i8);
    v54 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v53.i8);
    v55 = (int8x16_t)vmovl_high_u16(v53);
    v56 = vmovl_high_u8(v52);
    v57 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v56.i8);
    v58 = (int8x16_t)vmovl_high_u16(v56);
    v59 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v42);
    v60 = vmovl_high_u8(v59);
    v61 = vmovl_u8(*(uint8x8_t *)v59.i8);
    v62 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v42);
    _Q26 = (int8x16_t)vmovl_high_u8(v62);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v62.i8);
    v65 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v70 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v42);
    v97.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v97.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[1]);
    v97.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v97.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[0]);
    v97.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8), 0x18uLL), v65), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v61.i8, 8uLL), v54));
    v97.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v97.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v61, 8uLL), v55));
    v97.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8), 0x18uLL), v70), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v60.i8, 8uLL), v57));
    v97.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v97.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v60, 8uLL), v58));
    v71 = (int32x4_t)veorq_s8(vandq_s8(v97.val[0], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v54 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v72 = (int32x4_t)veorq_s8(vandq_s8(v97.val[3], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v55 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v73 = (int32x4_t)veorq_s8(vandq_s8(v97.val[1], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v57 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    v74 = (int32x4_t)veorq_s8(vandq_s8(v97.val[2], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v58 & __PAIR128__(0xFFFFFF05FFFFFF05, 0xFFFFFF05FFFFFF05)));
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[1], vaddq_s32(v73, v73)), (int32x4_t)v44);
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[2], vaddq_s32(v74, v74)), (int32x4_t)v44);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[0], vaddq_s32(v71, v71)), (int32x4_t)v44);
    a29 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[3], vaddq_s32(v72, v72)), (int32x4_t)v44);
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v34
                                                        + 8 * ((836 * (a26 + 1 == v36)) ^ (2 * (a2 ^ (a2 + 537)))))
                                            - 4))(1207959552);
  }
  else
  {
    v96 = (v47 ^ v35) + (a25 ^ v35) + v35 - (v33 & (2 * ((v47 ^ v35) + (a25 ^ v35))));
    *(_DWORD *)(v39 - 148) = (v48 ^ v35) + (a24 ^ v35) + v35 - (v33 & (2 * ((v48 ^ v35) + (a24 ^ v35))));
    *(_DWORD *)(v39 - 144) = v96;
    *(_DWORD *)(v39 - 140) = 2 * (v50 ^ v35) + v35 - (v33 & (4 * (v50 ^ v35)));
    *(_DWORD *)(v39 - 136) = 2 * (v49 ^ v35) + v35 - (v33 & (4 * (v49 ^ v35)));
    return v40(1207959552, v42, v43, v44, v45, v46);
  }
}

uint64_t sub_21B53175C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, int a17, unsigned int a18)
{
  uint64_t v18;
  _BOOL4 v19;

  if (a18 < a5 != a15 + 545720113 < a5)
    v19 = a15 + 545720113 < a5;
  else
    v19 = a15 + 545720113 > a18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * ((107 * v19) ^ (a7 + a2 + 1766)))
                            - ((a2 ^ (a2 - 966))
                             - 1062)
                            + 180))();
}

uint64_t sub_21B5317E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((274 * (v10 + v8 + 63 >= v10 + v8 + a7 + ((v7 + 1793620249) & 0xBDFFFF7A) + 1124 - 1184)) ^ v7)))();
}

uint64_t sub_21B53183C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  return (*(uint64_t (**)(void))(v17
                              + 8
                              * (((a14 + v15 - (unint64_t)(v14 - 1667214477 + ((v16 + 704248159) & 0xFEEE7F72)) < 0x10)
                                * (((v16 + 547884914) | 0x8406960) ^ (a2 - 102))) ^ v16)))();
}

uint64_t sub_21B5318B0@<X0>(char a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;

  *(_BYTE *)(v5 + a3) = *(_BYTE *)(v8 + (v4 + v9))
                      - (a1 & (2 * *(_BYTE *)(v8 + (v4 + v9))))
                      - 27;
  return (*(uint64_t (**)(void))(v7 + 8 * (((((v3 + a2) ^ v10) + a3 != 64) * v6) ^ (v3 + a2 + 584))))();
}

uint64_t sub_21B5318F8(int8x16_t a1, double a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  int v12;
  int v13;
  int8x16_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int8x16_t v19;

  v19 = *(int8x16_t *)(v16 + v13 + ((v12 + a12) ^ (v17 - 12)));
  *v14 = vaddq_s8(vsubq_s8(v19, vandq_s8(vaddq_s8(v19, v19), a5)), a1);
  return (*(uint64_t (**)(void))(v15 + 8 * (v18 | (v12 + a12 + 584))))();
}

uint64_t sub_21B531950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  int v18;
  _BOOL4 v19;
  _BOOL4 v20;

  v17 = v16 + 1136 + v14 + 732275118;
  v18 = ((a14 + 1382044945) < 0x661CD5F1) ^ (v17 < 0x661CD5F1);
  v19 = v17 < a14 + 1382044945;
  if (v18)
    v20 = (a14 + 1382044945) < 0x661CD5F1;
  else
    v20 = v19;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((83 * v20) ^ v16)) - 12))(3329614164);
}

uint64_t sub_21B5319C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v18;
  uint64_t v19;

  v16 = 831981571 * ((v15 + 1955590304 - 2 * ((v15 - 120) & 0x748FF118)) ^ 0xED2E213C);
  *(_QWORD *)(v15 - 112) = a11;
  *(_DWORD *)(v15 - 120) = v16 + a5 - 410;
  *(_DWORD *)(v15 - 104) = v16 + a14 + 705047227;
  v18 = sub_21B4EE180(v15 - 120);
  v19 = *(_DWORD *)(v15 - 152) & 0x3F;
  *(_BYTE *)(v15 - 220 + (v19 ^ 3)) = 101;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14
                                                              + 8 * ((102 * ((v19 ^ 3) > 0x37)) ^ a5)))(v18, 686325106, 3072501700);
}

uint64_t sub_21B531AC4()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((86 * (v0 == (((v1 ^ 0x5DA) - 1825) ^ 0x7E))) ^ v1)) - 8))();
}

uint64_t sub_21B531AF4(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((31
                                          * ((v2 ^ 0x3Cu) >= (((v3 + 2123008) | 0x28C81110) ^ (a2 + 8)))) ^ v3))
                            - 12))();
}

uint64_t sub_21B531B38@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 220 + a2 - 640442942) = 0xE5E5E5E5E5E5E5E5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8 * ((((v3 & 0x38) == 8) * ((a1 + v2 + 690) ^ 0x2F4)) ^ (a1 + v2 + 206)))
                            - 4))();
}

uint64_t sub_21B531B90(double a1)
{
  int v1;
  double *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *v2 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v4 == 0) * v3) ^ v1)) - 4))();
}

uint64_t sub_21B531BB4@<X0>(int a1@<W1>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((307 * (((v3 == v2) ^ (a2 + 83)) & 1)) ^ a2))
                            - ((a1 + a2 - 750) ^ 0x28E87D7ALL)))();
}

void sub_21B531BF4()
{
  JUMPOUT(0x21B530BCCLL);
}

uint64_t sub_21B531C00@<X0>(int a1@<W0>, unsigned int a2@<W2>, int a3@<W3>, unsigned int a4@<W8>)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v12 = a4 < a2;
  *(_BYTE *)(v11 - 220 + (v4 + a1)) = *(_BYTE *)(v8 + (v6 + v9))
                                                  - ((*(unsigned __int8 *)(v8 + (v6 + v9)) << ((2 * v10) ^ 0x71)) & 0xCA)
                                                  - 27;
  v13 = a3 + v6 + 1321;
  v14 = v12 ^ (v13 < a2);
  v15 = v13 < a4;
  if (!v14)
    v12 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((v12 * v5) ^ v10)) - 12))();
}

uint64_t sub_21B531C84@<X0>(int a1@<W6>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((a2 - 640442942) < 0x38) * ((v3 + 283457639) & 0xC6324FFF ^ 0x5A1)) ^ (a1 + v3 + 222))))();
}

uint64_t sub_21B531CD0@<X0>(int a1@<W6>, unsigned int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = a2;
  v5 = a2 + (unint64_t)(v2 - a1 - 1437) + (v2 - a1 - 1437) - 2013093153;
  if (v5 <= 0x38)
    v5 = 56;
  return (*(uint64_t (**)(void))(v3 + 8 * ((960 * (v5 - v4 + 640442942 > 7)) ^ v2)))();
}

uint64_t sub_21B531D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v12 - 220 + v10 - 640442942) = 0xE5E5E5E5E5E5E5E5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8
                                        * ((1740 * ((v8 & 0xFFFFFFFFFFFFFFF8) - (v9 - 1215) == -274)) ^ (a7 + v7 + 446)))
                            - 4))();
}

uint64_t sub_21B531D94(double a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(double *)(v3 + v5) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v2 == v5) * v4) ^ v1)) - 4))();
}

uint64_t sub_21B531DB8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((v2 - 51741476) & 0x2BFDFF7B ^ ((v2 + 677406550) | 0x881502) ^ 0x4C3) * (v0 != v1)) ^ v2)))();
}

void sub_21B531E0C()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  unsigned int v3;
  unint64_t v4;
  char v5;
  char v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  int v12;
  char v13;

  v1 = *(unsigned __int8 *)(v0 - 124) ^ 0xA4;
  if (v1 == 1)
  {
    v9 = *(_DWORD *)(v0 - 156);
    v8 = *(_DWORD *)(v0 - 152);
    *(_BYTE *)(v0 - 164) = ((8 * v8) ^ 0x18) - ((16 * v8) & 0xC0) - 27;
    *(_BYTE *)(v0 - 163) = ((v8 >> 5) ^ 0xA4) + (~(2 * ((v8 >> 5) ^ 0xA4)) | 0x35) - 26;
    *(_BYTE *)(v0 - 162) = ((v8 >> 13) ^ 0x3A) - ((2 * ((v8 >> 13) ^ 0x3A)) & 0xCA) - 27;
    *(_BYTE *)(v0 - 161) = ((v8 >> 21) ^ 0x8A) - ((v8 >> 20) & 0xCA) - 27;
    HIDWORD(v10) = v9;
    LODWORD(v10) = v8 ^ 0x80000000;
    *(_BYTE *)(v0 - 160) = (v10 >> 29) - ((2 * (v10 >> 29)) & 0xCA) - 27;
    *(_BYTE *)(v0 - 159) = ((v9 >> 5) ^ 0xF5) - ((2 * ((v9 >> 5) ^ 0xF5)) & 0xCA) - 27;
    *(_BYTE *)(v0 - 158) = ((v9 >> 13) ^ 0x4D) - ((2 * ((v9 >> 13) ^ 0x4D)) & 0xCA) - 27;
    v11 = v9 >> 21;
    v12 = (v9 >> 21) ^ 0x30;
    v13 = v12 & 0x6D;
    v7 = v12 - 27;
    v6 = 2 * (v13 ^ v11 & 8);
  }
  else
  {
    if (v1 != 2)
      goto LABEL_6;
    v2 = *(_DWORD *)(v0 - 156);
    v3 = *(_DWORD *)(v0 - 152);
    HIDWORD(v4) = v2;
    LODWORD(v4) = v3 ^ 0x80000000;
    *(_BYTE *)(v0 - 164) = ((v2 >> 21) ^ 0x30) - 2 * (((v2 >> 21) ^ 0x30) & 0x6D ^ (v2 >> 21) & 8) - 27;
    *(_BYTE *)(v0 - 163) = ((v2 >> 13) ^ 0x4D) - 2 * (((v2 >> 13) ^ 0x4D) & 0xE7 ^ (v2 >> 13) & 2) - 27;
    *(_BYTE *)(v0 - 162) = ((v2 >> 5) ^ 0xF5) - ((2 * ((v2 >> 5) ^ 0xF5)) & 0xCA) - 27;
    *(_BYTE *)(v0 - 161) = (v4 >> 29) - ((2 * (v4 >> 29)) & 0xCA) - 27;
    *(_BYTE *)(v0 - 160) = ((v3 >> 21) ^ 0x8A) - ((v3 >> 20) & 0xCA) - 27;
    *(_BYTE *)(v0 - 159) = ((v3 >> 13) ^ 0x3A) - ((2 * ((v3 >> 13) ^ 0x3A)) & 0xCA) - 27;
    *(_BYTE *)(v0 - 158) = ((v3 >> 5) ^ 0xA4) - ((2 * ((v3 >> 5) ^ 0xA4)) & 0xCA) - 27;
    v5 = (8 * v3) ^ 0x18;
    v6 = (16 * v3) & 0xC0;
    v7 = v5 - 27;
  }
  *(_BYTE *)(v0 - 157) = v7 - v6;
LABEL_6:
  JUMPOUT(0x21B530BCCLL);
}

uint64_t sub_21B53228C(uint64_t a1, char a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v8 = (v5 + v2);
  v9 = *(_DWORD *)(v7 - 220 + v8 + 72);
  *(_BYTE *)(a1 + v8) = (HIBYTE(v9) ^ 0x4F) - (((HIBYTE(v9) ^ 0x4F) << (v4 ^ (a2 + 54) ^ 0x73)) & 0xCA) - 27;
  *(_BYTE *)(a1 + (v8 + 1)) = (BYTE2(v9) ^ 0xA2) - ((2 * (BYTE2(v9) ^ 0xA2)) & 0xCA) - 27;
  *(_BYTE *)(a1 + (v8 + 2)) = (BYTE1(v9) ^ 0xEF) + (~(2 * (BYTE1(v9) ^ 0xEF)) | 0x35) - 26;
  *(_BYTE *)(a1 + (v8 + 3)) = v9 ^ 0xE7;
  LODWORD(v8) = *(_DWORD *)(v7 - 128) + 319993064;
  v10 = v8 < v3;
  v11 = v5 + 2079799115 < v8;
  if (v5 + 2079799115 < v3 != v10)
    v11 = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((508 * v11) ^ v4)) - 12))();
}

void sub_21B53241C()
{
  JUMPOUT(0x21B5323E8);
}

void sub_21B532460(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = (1543737703 * ((&v1 & 0x784F387D | ~(&v1 | 0x784F387D)) ^ 0xF94497FE)) ^ 0xCE;
  v2 = a1;
  sub_21B51FFA4((uint64_t)&v1);
}

uint64_t sub_21B5324F4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_21B53250C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 88) = 119;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_21B53252C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_21B532544(uint64_t a1)
{
  int v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t result;
  uint64_t v9;
  unsigned int v10;
  __int128 v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = 944348131 * ((-2 - ((a1 | 0xD8AFC5C0) + (~(_DWORD)a1 | 0x27503A3F))) ^ 0x84499E71);
  v3 = *(_DWORD *)(a1 + 8) ^ v2;
  v4 = *(_OWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)a1 + v2;
  v7 = 1224239923 * (((&v9 | 0x1D231224) - (&v9 & 0x1D231224)) ^ 0xEF90EFF3);
  v3 -= 1695027331;
  v12 = *(_QWORD *)(a1 + 40);
  v10 = (v6 ^ 0x2F3A3D53) - v7 - 94703632 + ((2 * v6) & 0xFBDAED7E ^ 0xA18A8558);
  v9 = v5;
  v11 = v4;
  v14 = v3 + v7 + 945;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_24DE82D70 + v3) - 12))(&v9);
  *(_DWORD *)(a1 + 4) = v13;
  return result;
}

uint64_t sub_21B5326A0(uint64_t result)
{
  unint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;

  v1 = 241568881 * ((~result & 0xE0D775522E6CD85FLL | result & 0x1F288AADD19327A0) ^ 0xEF82A1DBF87DDC1DLL);
  v2 = *(_DWORD *)result ^ v1;
  v3 = *(_QWORD *)(result + 32);
  v4 = v3 - v1;
  v5 = *(_DWORD *)(result + 16) + v1;
  v6 = *(_DWORD *)(result + 20) ^ v1;
  v7 = *(_DWORD *)(result + 28) - v1;
  v8 = *(_QWORD *)(result + 8);
  v9 = v8 != v3;
  v10 = v8 - v1 >= v4;
  if ((v7 & 1) == 0)
    v10 = v9;
  if (v10)
    v11 = v2;
  else
    v11 = v5;
  *(_DWORD *)(result + 40) = v6 ^ v11;
  return result;
}

uint64_t sub_21B532738(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  BOOL v7;
  uint64_t v8;

  v1 = 235795823 * ((2 * (result & 0x6456F84F606C9827) - result + 0x1BA907B09F9367D8) ^ 0x1319BD4E0B3E2E81);
  v2 = *(_QWORD *)result - v1;
  v3 = *(_QWORD *)(result + 16) + v1;
  v4 = v2 >= (unint64_t)v3;
  v5 = v2 < v3;
  v6 = !v4;
  if (((*(_DWORD *)(result + 40) + 235795823 * ((2 * (result & 0x606C9827) - (_DWORD)result - 1617729576) ^ 0xB3E2E81)) & 1) == 0)
    v5 = v6;
  v7 = !v5;
  v8 = 8;
  if (!v7)
    v8 = 28;
  *(_DWORD *)(result + 32) = (*(_DWORD *)(result + v8)
                            + 235795823 * ((2 * (result & 0x606C9827) - result - 1617729576) ^ 0xB3E2E81)) ^ (*(_DWORD *)(result + 24) + 235795823 * ((2 * (result & 0x606C9827) - result - 1617729576) ^ 0xB3E2E81));
  return result;
}

uint64_t sub_21B5327E0(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  uint64_t result;
  _DWORD v10[4];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = 69008221 * (((a1 | 0x5730DA18) - a1 + (a1 & 0xA8CF25E7)) ^ 0x84928812);
  v3 = *(_DWORD *)(a1 + 20) ^ v2;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = -1691607457 * (*(_DWORD *)(a1 + 32) + v2);
  v7 = 831981571 * ((((2 * v10) | 0x7018C496) - v10 - 940335691) ^ 0xA1ADB26F);
  v8 = -1616943251 * (*(_DWORD *)(a1 + 16) ^ v2) + 526673563;
  v3 += 2024873211;
  v10[3] = v6 - v7 - 2 * ((v6 + 561199368) & 0x2C7F822A ^ v6 & 2) - 839730384;
  v11 = v4;
  v12 = v5;
  v10[0] = v3 + v7 + 174;
  v10[1] = (v8 ^ 0x9EDED69F) - v7 + ((2 * v8) & 0x3DBDAD3E) + 1978662268;
  result = ((uint64_t (*)(_DWORD *))((char *)*(&off_24DE82D70 + v3) - 4))(v10);
  *(_DWORD *)a1 = v10[2];
  return result;
}

_BYTE *sub_21B53297C(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_21B532A0C + 4 * byte_21B55C897[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t XtCqEf5X(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (qword_255184948 - qword_255184898) ^ (unint64_t)&v6;
  qword_255184898 = (1209664481 * v4) ^ 0xD2F218D37B7E7FAFLL;
  qword_255184948 = 1209664481 * (v4 ^ 0xD2F218D37B7E7FAFLL);
  v11 = a2;
  v12 = a3;
  v8 = a1;
  v9 = a4;
  v7 = 692 - 241568881 * (&v7 ^ 0xD6110442);
  ((void (*)(unsigned int *))((char *)*(&off_24DE82D70
                                                 + ((-31
                                                                                  * ((qword_255184948 + qword_255184898) ^ 0xAF)) ^ byte_21B567AC0[byte_21B564200[(-31 * ((qword_255184948 + qword_255184898) ^ 0xAF))] ^ 0x77])
                                                 + 19)
                                       - 8))(&v7);
  return v10 ^ 0xDB9153E2;
}

void sub_21B532B94(_DWORD *a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1 - 1224239923 * ((a1 & 0x5D8FAFAA | ~(a1 | 0x5D8FAFAA)) ^ 0x50C3AD82);
  v2 = *(_QWORD *)*(&off_24DE82D70 + (int)(v1 ^ 0x7F7DFDA3));
  v4 = (69008221 * ((&v3 - 2104566451 - 2 * ((unint64_t)&v3 & 0x828EDD4D)) ^ 0x512C8F47)) ^ (v1 - 2138962673);
  v3 = v2;
  sub_21B508014((uint64_t)&v3);
}

uint64_t sub_21B532C84(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 24);
  return 0;
}

uint64_t sub_21B532C9C(int *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;

  v2 = a1[1] - 944348131 * ((2 * (a1 & 0x63083214) - (_DWORD)a1 + 486002155) ^ 0xBFEE69A5);
  result = ((uint64_t (*)(char *, char *))*(&off_24DE82D70 + (int)(v2 + 504207254)))((char *)*(&off_24DE82D70 + (int)(v2 + 504207214)) - 4, (char *)*(&off_24DE82D70 + (int)(v2 ^ 0xE1F26972)) - 8);
  v4 = *(_DWORD *)*(&off_24DE82D70 + (int)(v2 ^ 0xE1F26924));
  if ((_DWORD)result)
    v4 = 611191132;
  *a1 = v4;
  return result;
}

uint64_t sub_21B532D5C(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = 1543737703 * ((&v2 & 0xB49E26B8 | ~(&v2 | 0xB49E26B8)) ^ 0x3595893B) + 1200;
  sub_21B52D6D8((uint64_t)&v2);
  return v2;
}

uint64_t sub_21B532DF0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 8);
  return 0;
}

void sub_21B532E08(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (69008221 * (&v1 ^ 0xD3A2520A)) ^ 0x2AF;
  sub_21B508014((uint64_t)&v1);
}

uint64_t sub_21B532E80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_DWORD *)a1 + 3804331 * (a1 ^ 0x7ED525F6) - 426522922;
  v6 = (1178560073 * (((&v5 | 0xFDD65059) + (~&v5 | 0x229AFA6)) ^ 0x4E65CE99)) ^ (*(_DWORD *)a1 + 3804331 * (a1 ^ 0x7ED525F6) - 426522537);
  v7 = v2;
  v5 = v1;
  return ((uint64_t (*)(uint64_t *))((char *)*(&off_24DE82D70 + v3) - 4))(&v5);
}

uint64_t sub_21B532F54(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = 235795823 * (((a1 | 0x4BFCC8C0) - (a1 & 0x4BFCC8C0)) ^ 0xDF518199);
  v3 = *(_DWORD *)(a1 + 36) ^ v2;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = 1624408589 * (*(_DWORD *)a1 ^ v2) - 771324246;
  v3 -= 368400023;
  v8 = (((2 * &v10) | 0xD4D00F5E) - &v10 - 1785202607) ^ 0xFEC54EF6;
  v16 = *(_QWORD *)(a1 + 48);
  v10 = v6;
  v15 = (235795823 * v8) ^ (v3 + 1737);
  v12 = v5;
  v13 = v4;
  v11 = 235795823 * v8 + (v7 ^ 0xF3FBFDB7) + ((2 * v7) & 0xE7F7FB6E) + 2096103390;
  result = ((uint64_t (*)(uint64_t *))*(&off_24DE82D70 + v3))(&v10);
  *(_DWORD *)(a1 + 32) = v14;
  return result;
}

uint64_t sub_21B5330A8(char a1, unsigned int a2)
{
  return byte_21B55FB50[(byte_21B55C490[a2] ^ a1)] ^ a2;
}

uint64_t sub_21B5330D4(char a1, unsigned int a2)
{
  return byte_21B55FC50[(byte_21B55C590[a2] ^ a1)] ^ a2;
}

uint64_t sub_21B533100(char a1, unsigned int a2)
{
  return byte_21B55C690[(byte_21B5679C0[a2] ^ a1)] ^ a2;
}

uint64_t sub_21B53312C(char a1, unsigned int a2)
{
  return byte_21B567AC0[(byte_21B564200[a2] ^ a1)] ^ a2;
}

uint64_t sub_21B533158(char a1, unsigned int a2)
{
  return byte_21B564300[(byte_21B55FD50[a2] ^ a1)] ^ a2;
}

uint64_t sub_21B533184(char a1, unsigned int a2)
{
  return byte_21B55FE50[(byte_21B55C790[a2] ^ a1)] ^ a2;
}

uint64_t sub_21B5331B0(unsigned int a1)
{
  return byte_21B567AC0[~byte_21B564200[a1]] ^ a1;
}

uint64_t sub_21B5331DC(unsigned int a1)
{
  return byte_21B567AC0[byte_21B564200[a1] ^ 0x16] ^ a1;
}

uint64_t sub_21B533208(unsigned int a1)
{
  return byte_21B55FB50[byte_21B55C490[a1] ^ 0x69] ^ a1;
}

uint64_t sub_21B533234(unsigned int a1)
{
  return byte_21B55FE50[byte_21B55C790[a1] ^ 0xC8] ^ a1;
}

uint64_t VLxCLgDpiF(int a1)
{
  unint64_t v1;
  unsigned int v2;
  uint64_t v4;
  _DWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = (qword_255184948 + qword_2551854B8) ^ (unint64_t)&v4;
  qword_2551854B8 = 1209664481 * v1 + 0x3D486B14357345CFLL;
  qword_255184948 = 1209664481 * (v1 ^ 0xD2F218D37B7E7FAFLL);
  v2 = 1543737703 * (v5 ^ 0x7EF4507C);
  v5[2] = (a1 ^ 0xFBFFCFCF) + ((2 * a1) & 0xF7FF9F9E) - v2 + 2111060864;
  v5[0] = 694 - v2;
  ((void (*)(_DWORD *))*(&off_24DE82D70
                                  + ((-31 * ((qword_255184948 - (-31 * v1 - 49)) ^ 0xAF)) ^ byte_21B564300[byte_21B55FD50[(-31 * ((qword_255184948 - (-31 * v1 - 49)) ^ 0xAF))] ^ 0x56])
                                  - 136))(v5);
  return v5[1] ^ 0xDB9153E2;
}

uint64_t sub_21B5333A8(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;

  v1 = 1178560073 * (((result | 0x965CC9136B721F61) - (result & 0x965CC9136B721F61)) ^ 0x8B65355D8C181A0);
  v2 = *(_DWORD *)(result + 4) ^ v1;
  v3 = *(_DWORD *)result ^ v1;
  v4 = *(_QWORD *)(result + 16) ^ v1;
  v5 = *(_QWORD *)(result + 24) + v1;
  v6 = *(_DWORD *)(result + 8) - v1;
  v7 = *(_DWORD *)(result + 32) - v1;
  v8 = v5 > v4;
  v9 = v5 == v4;
  v10 = v8;
  if ((v6 & 1) != 0)
    v9 = v10;
  if (!v9)
    v7 = v3;
  *(_DWORD *)(result + 36) = v2 ^ v7;
  return result;
}

void sub_21B533434()
{
  unint64_t v0;
  unsigned int v1;
  _BYTE v2[8];
  _BYTE v3[4];
  int v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v2[qword_255184948 - qword_2551848A0];
  qword_2551848A0 = (1209664481 * v0) ^ 0xD2F218D37B7E7FAFLL;
  qword_255184948 = 1209664481 * (v0 ^ 0xD2F218D37B7E7FAFLL);
  v6 = 1543737703 * ((v3 - 277940247 - 2 * (v3 & 0xEF6EF7E9)) ^ 0x919AA795) + 1200;
  v5 = (char *)*(&off_24DE82D70
               + ((-31 * ((qword_255184948 + qword_2551848A0) ^ 0xAF)) ^ byte_21B55FE50[byte_21B55C790[(-31 * ((qword_255184948 + qword_2551848A0) ^ 0xAF))] ^ 0xD5])
               - 57);
  sub_21B52D6D8((uint64_t)v3);
  v5 = (char *)*(&off_24DE82D70
               + ((-31 * ((qword_255184948 + qword_2551848A0) ^ 0xAF)) ^ byte_21B55FC50[byte_21B55C590[(-31 * ((qword_255184948 + qword_2551848A0) ^ 0xAF))] ^ 0xC0])
               - 1)
     - 4;
  v6 = 1543737703
     * (((v3 ^ 0xECEF1236) & 0x762C0D61 | ~(v3 ^ 0xECEF1236 | 0x762C0D61)) ^ 0x1BC8B0D4)
     + 1200;
  sub_21B52D6D8((uint64_t)v3);
  v1 = 69008221 * (v3 ^ 0xD3A2520A);
  v3[0] = v1 + 66;
  v4 = v1 ^ 0x249;
  sub_21B52F9F4((uint64_t)v3);
}

uint64_t sub_21B533638(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t v9;

  v1 = 69008221 * ((~result & 0xAB6152BB0D4C7340 | result & 0x549EAD44F2B38CBFLL) ^ 0xF9FD1458DEEE214ALL);
  v2 = *(_QWORD *)(result + 24) + v1;
  v3 = *(_QWORD *)(result + 8) ^ v1;
  v4 = v3 > v2;
  v5 = v3 == v2;
  v6 = v4;
  if (((*(_DWORD *)result ^ v1) & 1) != 0)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7 == 0;
  v9 = 32;
  if (!v8)
    v9 = 40;
  *(_DWORD *)(result + 44) = *(_DWORD *)(result + 36) ^ v1 ^ *(_DWORD *)(result + v9) ^ v1;
  return result;
}

void sub_21B5336D0()
{
  unint64_t v0;
  _BYTE v1[8];
  _BYTE v2[8];
  char *v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v1[qword_255184948 - qword_255184958];
  qword_255184958 = 1209664481 * v0 + 0x2D0DE72C84818051;
  qword_255184948 = 1209664481 * (v0 ^ 0xD2F218D37B7E7FAFLL);
  v3 = (char *)*(&off_24DE82D70
               + ((-31 * ((qword_255184948 + qword_255184958) ^ 0xAF)) ^ byte_21B55FE50[byte_21B55C790[(-31 * ((qword_255184948 + qword_255184958) ^ 0xAF))] ^ 0xD0])
               + 136)
     - 4;
  v4 = 1543737703 * ((v2 & 0x57D7269F | ~(v2 | 0x57D7269F)) ^ 0xD6DC891C) + 1200;
  sub_21B52D6D8((uint64_t)v2);
}

uint64_t sub_21B5337F8(unsigned int a1)
{
  return byte_21B55FB50[byte_21B55C490[a1] ^ 0x4F] ^ a1;
}

uint64_t sub_21B533824(unsigned int a1)
{
  return byte_21B55FC50[byte_21B55C590[a1] ^ 0x81] ^ a1;
}

uint64_t sub_21B533850(unsigned int a1)
{
  return byte_21B55C690[byte_21B5679C0[a1] ^ 0x7E] ^ a1;
}

uint64_t sub_21B533878(unsigned int a1)
{
  return byte_21B567AC0[byte_21B564200[a1] ^ 0x77] ^ a1;
}

uint64_t sub_21B5338A4(unsigned int a1)
{
  return byte_21B564300[byte_21B55FD50[a1] ^ 0x56] ^ a1;
}

uint64_t sub_21B5338D0(unsigned int a1)
{
  return byte_21B55FE50[byte_21B55C790[a1] ^ 0xD0] ^ a1;
}

uint64_t sub_21B5338FC(unsigned int a1)
{
  return byte_21B55FC50[byte_21B55C590[a1] ^ 0xC0] ^ a1;
}

uint64_t sub_21B533924(unsigned int a1)
{
  return byte_21B55FE50[byte_21B55C790[a1] ^ 0x93] ^ a1;
}

uint64_t sub_21B533950(unsigned int a1)
{
  return byte_21B55FE50[byte_21B55C790[a1] ^ 0xD5] ^ a1;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB798](allocator, context);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC4E8](*(_QWORD *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC4F0](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x24BDBC4F8](theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x24BDBC528](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDA80](color);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x24BDBDB10](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x24BDBDCB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x24BDBDCB8](c, x1, y1, x2, y2, radius);
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCC0](c, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextAddQuadCurveToPoint(CGContextRef c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCE8](c, cpx, cpy, x, y);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCF0](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x24BDBDD08](c, auxiliaryInfo);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawShading(CGContextRef c, CGShadingRef shading)
{
  MEMORY[0x24BDBDE30](c, shading);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextGetAlpha()
{
  return MEMORY[0x24BDBDE80]();
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x24BDBDE88]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDE98](retstr, c);
}

uint64_t CGContextGetCompositeOperation()
{
  return MEMORY[0x24BDBDEA8]();
}

uint64_t CGContextGetLineCap()
{
  return MEMORY[0x24BDBDEC8]();
}

uint64_t CGContextGetLineJoin()
{
  return MEMORY[0x24BDBDED0]();
}

uint64_t CGContextGetLineWidth()
{
  return MEMORY[0x24BDBDED8]();
}

uint64_t CGContextGetMiterLimit()
{
  return MEMORY[0x24BDBDEE0]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

BOOL CGContextPathContainsPoint(CGContextRef c, CGPoint point, CGPathDrawingMode mode)
{
  return MEMORY[0x24BDBDF28](c, *(_QWORD *)&mode, (__n128)point, *(__n128 *)&point.y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextReplacePathWithStrokedPath(CGContextRef c)
{
  MEMORY[0x24BDBDF38](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x24BDBDF68](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x24BDBDFA8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x24BDBDFB8]();
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x24BDBDFC0]();
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBDFD0](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
  MEMORY[0x24BDBE048](c, limit);
}

void CGContextSetShadow(CGContextRef c, CGSize offset, CGFloat blur)
{
  MEMORY[0x24BDBE078](c, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGFunctionRef CGFunctionCreate(void *info, size_t domainDimension, const CGFloat *domain, size_t rangeDimension, const CGFloat *range, const CGFunctionCallbacks *callbacks)
{
  return (CGFunctionRef)MEMORY[0x24BDBE3D8](info, domainDimension, domain, rangeDimension, range, callbacks);
}

void CGFunctionRelease(CGFunctionRef function)
{
  MEMORY[0x24BDBE400](function);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x24BDBEDB0](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDE0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEE30](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

CGPoint CGPointFromString(NSString *string)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x24BDF65A8](string);
  result.y = v2;
  result.x = v1;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGShadingRef CGShadingCreateAxial(CGColorSpaceRef space, CGPoint start, CGPoint end, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x24BDBF0E0](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, (__n128)end, *(__n128 *)&end.y);
}

CGShadingRef CGShadingCreateRadial(CGColorSpaceRef space, CGPoint start, CGFloat startRadius, CGPoint end, CGFloat endRadius, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x24BDBF0E8](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, startRadius, (__n128)end, *(__n128 *)&end.y, endRadius);
}

void CGShadingRelease(CGShadingRef shading)
{
  MEMORY[0x24BDBF118](shading);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t CPCanSendMail()
{
  return MEMORY[0x24BE04648]();
}

uint64_t CPFSSizeStrings()
{
  return MEMORY[0x24BE04680]();
}

uint64_t CPFreeSpaceRequestBytesAtPathWithCompletionBlock()
{
  return MEMORY[0x24BE04688]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x24BE046F0]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x24BE046F8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

uint64_t CTRegistrationCopyDataStatus()
{
  return MEMORY[0x24BDC2648]();
}

uint64_t HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier()
{
  return MEMORY[0x24BE3F2F8]();
}

uint64_t HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier()
{
  return MEMORY[0x24BE3F300]();
}

uint64_t ISBiometricsHTTPHeaderValueForBiometricStateWithStore()
{
  return MEMORY[0x24BEC8A78]();
}

uint64_t ISCompareSoftwareVersions()
{
  return MEMORY[0x24BEC8A98]();
}

uint64_t ISCopyEncodedBase64()
{
  return MEMORY[0x24BEC8AA8]();
}

uint64_t ISDictionaryValueForCaseInsensitiveString()
{
  return MEMORY[0x24BEC8AC0]();
}

uint64_t ISError()
{
  return MEMORY[0x24BEC8AC8]();
}

uint64_t ISErrorIndicatesSlowNetwork()
{
  return MEMORY[0x24BEC8AE0]();
}

uint64_t ISErrorIsEqual()
{
  return MEMORY[0x24BEC8AE8]();
}

uint64_t ISURLCachePurgeMemoryCache()
{
  return MEMORY[0x24BEC8B40]();
}

uint64_t ISURLCacheSaveMemoryCache()
{
  return MEMORY[0x24BEC8B48]();
}

uint64_t ISWeakLinkedClassForString()
{
  return MEMORY[0x24BEC8B50]();
}

uint64_t ISWeakLinkedStringConstantForString()
{
  return MEMORY[0x24BEC8B58]();
}

JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA550](ctx, script, thisObject, sourceURL, *(_QWORD *)&startingLineNumber, exception);
}

void JSGlobalContextRelease(JSGlobalContextRef ctx)
{
  MEMORY[0x24BDDA570](ctx);
}

JSGlobalContextRef JSGlobalContextRetain(JSGlobalContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x24BDDA578](ctx);
}

JSPropertyNameArrayRef JSObjectCopyPropertyNames(JSContextRef ctx, JSObjectRef object)
{
  return (JSPropertyNameArrayRef)MEMORY[0x24BDDA588](ctx, object);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)MEMORY[0x24BDDA5B8](ctx, jsClass, data);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
  MEMORY[0x24BDDA5D0](ctx, object, propertyName, value, *(_QWORD *)&attributes, exception);
}

size_t JSPropertyNameArrayGetCount(JSPropertyNameArrayRef array)
{
  return MEMORY[0x24BDDA610](array);
}

void JSPropertyNameArrayRelease(JSPropertyNameArrayRef array)
{
  MEMORY[0x24BDDA618](array);
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return (JSStringRef)MEMORY[0x24BDDA640](string);
}

const JSChar *__cdecl JSStringGetCharactersPtr(JSStringRef string)
{
  return (const JSChar *)MEMORY[0x24BDDA650](string);
}

size_t JSStringGetLength(JSStringRef string)
{
  return MEMORY[0x24BDDA658](string);
}

void JSStringRelease(JSStringRef string)
{
  MEMORY[0x24BDDA670](string);
}

JSValueRef JSValueMakeBoolean(JSContextRef ctx, BOOL BOOLean)
{
  return (JSValueRef)MEMORY[0x24BDDA6C8](ctx, BOOLean);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x24BDDA710](ctx, value, exception);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSMapTable *__cdecl NSCreateMapTable(NSMapTableKeyCallBacks *keyCallBacks, NSMapTableValueCallBacks *valueCallBacks, NSUInteger capacity)
{
  return (NSMapTable *)MEMORY[0x24BDD0B90](keyCallBacks, valueCallBacks, capacity);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x24BDD0BD0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x24BDD0BD8](retstr, table);
}

void NSFreeMapTable(NSMapTable *table)
{
  MEMORY[0x24BDD0D58](table);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x24BDD1038](table, key);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x24BDD10F0](enumerator, key, value);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBSLaunchApplicationWithIdentifier()
{
  return MEMORY[0x24BEB0CA8]();
}

uint64_t SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions()
{
  return MEMORY[0x24BEB0CB0]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t SBScrollToIconWithDisplayIdentifier()
{
  return MEMORY[0x24BEB0DC8]();
}

uint64_t SSAccountGetUniqueIdentifierFromValue()
{
  return MEMORY[0x24BEB20E0]();
}

uint64_t SSCheckInAppPurchaseQueue()
{
  return MEMORY[0x24BEB2178]();
}

uint64_t SSDebugShouldTrackPerformance()
{
  return MEMORY[0x24BEB21C8]();
}

uint64_t SSDownloadKindForAssetType()
{
  return MEMORY[0x24BEB2290]();
}

uint64_t SSDownloadKindForItemKind()
{
  return MEMORY[0x24BEB2298]();
}

uint64_t SSError()
{
  return MEMORY[0x24BEB2480]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x24BEB24D8]();
}

uint64_t SSGetItemIdentifierFromValue()
{
  return MEMORY[0x24BEB24E8]();
}

uint64_t SSGetStringForNetworkType()
{
  return MEMORY[0x24BEB24F8]();
}

uint64_t SSGetUnsignedLongLongFromValue()
{
  return MEMORY[0x24BEB2500]();
}

uint64_t SSIsInternalBuild()
{
  return MEMORY[0x24BEB2600]();
}

uint64_t SSItemMediaKindForItemKind()
{
  return MEMORY[0x24BEB2718]();
}

uint64_t SSNetworkTypeApplyBlock()
{
  return MEMORY[0x24BEB2998]();
}

uint64_t SSNetworkTypeIsCellularType()
{
  return MEMORY[0x24BEB29A0]();
}

uint64_t SSRestrictionsCopyRankForMediaType()
{
  return MEMORY[0x24BEB2A28]();
}

uint64_t SSRestrictionsShouldRestrictExplicitContent()
{
  return MEMORY[0x24BEB2A38]();
}

uint64_t SSURLBagTypeForAccountScope()
{
  return MEMORY[0x24BEB2AA8]();
}

uint64_t SSVPurchaseAddDownloadPropertiesForBuyParameters()
{
  return MEMORY[0x24BEC8C88]();
}

uint64_t SSVStoreFrontIdentifierForAccount()
{
  return MEMORY[0x24BEB2B68]();
}

uint64_t SSXPCDictionaryCopyObjectWithClass()
{
  return MEMORY[0x24BEB2C10]();
}

uint64_t SSXPCDictionarySetObject()
{
  return MEMORY[0x24BEB2C20]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BDF7228]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x24BDF7268]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x24BDF72B8]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x24BDF74F0]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x24BDF7560](*(_QWORD *)&argc, argv, principalClassName, delegateClassName);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIITunesStoreResolvedURLForHTTPURL()
{
  return MEMORY[0x24BDF78F8]();
}

uint64_t UIImageGetTableNext()
{
  return MEMORY[0x24BDF7900]();
}

uint64_t UIImageGetTableNextSelected()
{
  return MEMORY[0x24BDF7910]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIInterfaceGetContentDisabledAlpha()
{
  return MEMORY[0x24BDF7940]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFrame(CGRect rect)
{
  MEMORY[0x24BDF7CD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

uint64_t WebThreadCallDelegate()
{
  return MEMORY[0x24BDFAA28]();
}

uint64_t WebThreadIsCurrent()
{
  return MEMORY[0x24BDFAA30]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x24BDFAA38]();
}

uint64_t WebThreadLockPopModal()
{
  return MEMORY[0x24BDFAA40]();
}

uint64_t WebThreadLockPushModal()
{
  return MEMORY[0x24BDFAA48]();
}

uint64_t WebThreadRun()
{
  return MEMORY[0x24BDFAA50]();
}

uint64_t WebThreadRunOnMainThread()
{
  return MEMORY[0x24BDFAA58]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityButtonShapesEnabled()
{
  return MEMORY[0x24BDF8050]();
}

uint64_t _UIAccessibilityIsSingleColorSelected()
{
  return MEMORY[0x24BDF8068]();
}

uint64_t _UIAccessibilitySingleSystemColor()
{
  return MEMORY[0x24BDF8070]();
}

uint64_t _UIAccessibilityUseDarkerKeyboard()
{
  return MEMORY[0x24BDF8080]();
}

uint64_t _UIApplicationLoadWebKit()
{
  return MEMORY[0x24BDF80A0]();
}

uint64_t _UIApplicationUsesLegacyUI()
{
  return MEMORY[0x24BDF80A8]();
}

uint64_t _UIPinStripeImageColorRef()
{
  return MEMORY[0x24BDF8168]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x24BDACBB8]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x24BDACBC8]();
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x24BEDD4E8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x24BEDD510](lhs, rhs);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

