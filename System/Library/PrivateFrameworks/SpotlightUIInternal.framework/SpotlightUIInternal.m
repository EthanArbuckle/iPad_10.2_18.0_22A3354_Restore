void sub_22E081618(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22E083D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E086C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E0882C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t lockStateChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateFooterViewsIfNecessary");
}

void sub_22E08D048(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22E08D170(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void HardwareKeyboardAvailabilityChanged(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __HardwareKeyboardAvailabilityChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t homeScreenPrefChanged(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint8_t v5[16];

  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E078000, v3, OS_LOG_TYPE_DEFAULT, "toggling zkw pref", v5, 2u);
  }

  return objc_msgSend(a2, "_refreshRequested");
}

void lockStateChanged_0(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  NSObject **v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  uint8_t v13[16];

  v2 = a2;
  v3 = (void *)MEMORY[0x24BE85288];
  objc_msgSend(v2, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "deviceIsAuthenticatedForView:", v4);

  if (!objc_msgSend(v2, "lastQueryWasAuthenticated") || (v5 & 1) != 0)
  {
    if ((objc_msgSend(v2, "lastQueryWasAuthenticated") & 1) == 0 && ((v5 ^ 1) & 1) == 0)
    {
      objc_msgSend(v2, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_appearState");

      if (v9)
      {
        objc_msgSend(v2, "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "topViewController");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v2)
        {
          objc_msgSend(v2, "searchHeader");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "triggerSearchForUnlock");

        }
      }
    }
  }
  else
  {
    v6 = (NSObject **)MEMORY[0x24BEB0818];
    v7 = *MEMORY[0x24BEB0818];
    if (!*MEMORY[0x24BEB0818])
    {
      SPUIInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22E078000, v7, OS_LOG_TYPE_DEFAULT, "clearing since last query was authenticated but looks to be no longer authenticated", v13, 2u);
    }
    objc_msgSend(v2, "clearSearchResultsAndFetchZKW:", 1);
  }

}

void sub_22E096260(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t PS_PSKillProcessNamed()
{
  uint64_t (*v0)(const __CFString *);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(const __CFString *))getPSKillProcessNamedSymbolLoc_ptr;
  v6 = getPSKillProcessNamedSymbolLoc_ptr;
  if (!getPSKillProcessNamedSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getPSKillProcessNamedSymbolLoc_block_invoke;
    v2[3] = &unk_24F9D6720;
    v2[4] = &v3;
    __getPSKillProcessNamedSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(const __CFString *))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    PS_PSKillProcessNamed_cold_1();
  return v0(CFSTR("parsecd"));
}

void sub_22E09995C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E09A5BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22E09A6BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22E09AB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E09B0A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22E09B298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_22E09B4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E09B6FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22E09C174(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void *__getPSKillProcessNamedSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PreferencesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
  }
  else
  {
    PreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
    if (!PreferencesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PSKillProcessNamed");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPSKillProcessNamedSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_22E09D4D0()
{
  return sub_22E09F2C8();
}

uint64_t sub_22E09D4F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_22E09F2A4();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22E09F2D4();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E3259D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_22E09D5AC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for SPUIFTEView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_253E945F0 = (uint64_t)result;
  return result;
}

uint64_t sub_22E09D5FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94498);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94450);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94458);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_22E09F31C();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94418);
  sub_22E09D820(v1, (uint64_t *)&v5[*(int *)(v13 + 44)]);
  v14 = sub_22E09F334();
  KeyPath = swift_getKeyPath();
  sub_22E09EE5C((uint64_t)v5, (uint64_t)v8, &qword_253E94498);
  v16 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  *v16 = KeyPath;
  v16[1] = v14;
  sub_22E09EEB0((uint64_t)v5, &qword_253E94498);
  sub_22E09E3E0();
  sub_22E09F34C();
  sub_22E09EEB0((uint64_t)v8, &qword_253E94450);
  v17 = (void *)objc_opt_self();
  objc_msgSend(v17, sel_standardTableCellContentInset);
  v19 = v18;
  objc_msgSend(v17, sel_standardTableCellContentInset);
  v21 = v20;
  LOBYTE(v17) = sub_22E09F328();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(a1, v12, v9);
  v22 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E94440) + 36);
  *(_BYTE *)v22 = (_BYTE)v17;
  *(_QWORD *)(v22 + 8) = 0x402E000000000000;
  *(_QWORD *)(v22 + 16) = v19;
  *(_QWORD *)(v22 + 24) = 0;
  *(_QWORD *)(v22 + 32) = v21;
  *(_BYTE *)(v22 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_22E09D820@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t KeyPath;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;

  v80 = a1;
  v77 = a2;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94410);
  v67 = *(_QWORD *)(v68 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v66 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94468);
  v81 = *(_QWORD *)(v3 - 8);
  v82 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E94470);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v84 = (uint64_t)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v86 = (uint64_t)&v64 - v7;
  v8 = type metadata accessor for FTEView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v78 = (uint64_t)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94480);
  v12 = *(_QWORD *)(v11 - 8);
  v70 = v11;
  v71 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94460);
  v85 = *(_QWORD *)(v83 - 8);
  v15 = MEMORY[0x24BDAC7A8](v83);
  v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v64 - v18;
  sub_22E09F310();
  if (qword_253E944C0 != -1)
    swift_once();
  swift_beginAccess();
  v20 = (id)qword_253E945F0;
  LOWORD(v63) = 256;
  v62 = 0;
  v21 = sub_22E09F340();
  v74 = v22;
  v75 = v21;
  v72 = v23;
  v76 = v24;
  KeyPath = swift_getKeyPath();
  v25 = v78;
  sub_22E09E4FC(v80, v78);
  v26 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v27 = swift_allocObject();
  sub_22E09ED78(v25, v27 + v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E94428);
  sub_22E09EDF8();
  sub_22E09F394();
  sub_22E09F008(&qword_253E94478, &qword_253E94480, MEMORY[0x24BDF43B0]);
  v28 = v70;
  sub_22E09F358();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v28);
  v29 = v85;
  v30 = v83;
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v19, v17, v83);
  v31 = objc_msgSend((id)objc_opt_self(), sel_shouldDisplayTapToRadar);
  v32 = 1;
  v33 = v82;
  v34 = v29;
  v79 = v19;
  if (v31)
  {
    v35 = sub_22E09F310();
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v42 = v78;
    sub_22E09E4FC(v80, v78);
    v43 = swift_allocObject();
    v44 = sub_22E09ED78(v42, v43 + v26);
    MEMORY[0x24BDAC7A8](v44);
    *(&v64 - 6) = v35;
    *(&v64 - 5) = v37;
    *((_BYTE *)&v64 - 32) = v39 & 1;
    *(&v64 - 3) = v41;
    v62 = 0x6C6C69662E746E61;
    v63 = 0xE800000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E94408);
    sub_22E09F008(&qword_253E94400, &qword_253E94408, MEMORY[0x24BDF41A8]);
    v45 = v66;
    sub_22E09F394();
    v30 = v83;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22E09F008(&qword_253E94488, &qword_253E94410, MEMORY[0x24BDF43B0]);
    v46 = v65;
    v47 = v68;
    sub_22E09F358();
    v19 = v79;
    v34 = v85;
    v48 = v45;
    v33 = v82;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v47);
    (*(void (**)(uint64_t, char *, uint64_t))(v81 + 32))(v86, v46, v33);
    v32 = 0;
  }
  v49 = v86;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v81 + 56))(v86, v32, 1, v33);
  v50 = v72 & 1;
  v87 = v72 & 1;
  v51 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v51(v17, v19, v30);
  v52 = v17;
  v69 = v17;
  sub_22E09EE5C(v49, v84, &qword_253E94470);
  v53 = v76;
  v54 = v77;
  v56 = v74;
  v55 = v75;
  *v77 = v75;
  v54[1] = v56;
  *((_BYTE *)v54 + 16) = v50;
  v57 = KeyPath;
  v54[3] = v53;
  v54[4] = v57;
  *((_BYTE *)v54 + 40) = 1;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E94430);
  v51((char *)v54 + *(int *)(v58 + 48), v52, v30);
  v59 = v84;
  sub_22E09EE5C(v84, (uint64_t)v54 + *(int *)(v58 + 64), &qword_253E94470);
  sub_22E09EEA0(v55, v56, v50);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22E09EEA0(v55, v56, v50);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22E09EEB0(v86, &qword_253E94470);
  v60 = *(void (**)(char *, uint64_t))(v85 + 8);
  v60(v79, v30);
  sub_22E09EEEC(v55, v56, v50);
  swift_release();
  swift_bridgeObjectRelease();
  sub_22E09EEB0(v59, &qword_253E94470);
  v60(v69, v30);
  sub_22E09EEEC(v55, v56, v87);
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_22E09DF1C@<D0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double result;

  sub_22E09F310();
  if (qword_253E944C0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (id)qword_253E945F0;
  v3 = sub_22E09F340();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = sub_22E09F328();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v9;
  *(_BYTE *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  result = 20.0;
  *(_OWORD *)(a1 + 56) = xmmword_22E0A2AA0;
  *(_BYTE *)(a1 + 72) = 0;
  return result;
}

uint64_t sub_22E09E03C()
{
  return sub_22E09F37C();
}

id sub_22E09E058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  objc_super v23;

  v5 = v4;
  v10 = type metadata accessor for FTEView();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (id *)((char *)&v23.receiver - v15);
  *v16 = a1;
  v16[1] = a2;
  v16[2] = a3;
  v16[3] = a4;
  v17 = (uint64_t *)((char *)&v23 + *(int *)(v14 + 24) - v15);
  *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
  swift_storeEnumTagMultiPayload();
  sub_22E09E4FC((uint64_t)v16, (uint64_t)v13);
  v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_253E943E8));
  swift_retain();
  swift_retain();
  v19 = (void *)sub_22E09F2BC();
  v23.receiver = v5;
  v23.super_class = (Class)SPUIFTEView;
  v20 = objc_msgSendSuper2(&v23, sel_initWithHostedView_, v19);
  v21 = objc_msgSend(v20, sel_layer);
  objc_msgSend(v21, sel_setAllowsGroupOpacity_, 0);

  swift_release();
  swift_release();

  sub_22E09E540((uint64_t)v16);
  return v20;
}

void __swiftcall SPUIFTEView.init(hostedView:)(SPUIFTEView *__return_ptr retstr, UIView_optional *hostedView)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHostedView_, hostedView);

}

void SPUIFTEView.init(hostedView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22E09E310()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_22E09F388();
}

uint64_t sub_22E09E390@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22E09F2F8();
  *a1 = result;
  return result;
}

uint64_t sub_22E09E3B8()
{
  swift_retain();
  return sub_22E09F304();
}

unint64_t sub_22E09E3E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253E94448;
  if (!qword_253E94448)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253E94450);
    v2[0] = sub_22E09F008(&qword_253E94490, &qword_253E94498, MEMORY[0x24BDF4700]);
    v2[1] = sub_22E09F008(&qword_253E943F0, &qword_253E943F8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E3259E8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253E94448);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E3259DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for FTEView()
{
  uint64_t result;

  result = qword_253E94550;
  if (!qword_253E94550)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22E09E4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FTEView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E09E540(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FTEView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E09E57C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for FTEConstants()
{
  return &type metadata for FTEConstants;
}

uint64_t sub_22E09E59C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(_QWORD *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = v5;
    v6 = a2[3];
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (_QWORD *)(a1 + v7);
    v9 = (uint64_t *)((char *)a2 + v7);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_22E09F2A4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22E09E690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_22E09F2A4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_22E09E710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_22E09F2A4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_22E09E7D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    sub_22E09EEB0((uint64_t)a1 + v8, &qword_253E943D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_22E09F2A4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_22E09E8C0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_22E09F2A4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_22E09E968(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_22E09EEB0((uint64_t)a1 + v6, &qword_253E943D8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_22E09F2A4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22E09EA48()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E09EA54(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DF60E8);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_22E09EAD4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22E09EAE0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DF60E8);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_22E09EB58()
{
  unint64_t v0;

  sub_22E09EBD0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_22E09EBD0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E943E0)
  {
    sub_22E09F2A4();
    v0 = sub_22E09F2B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E943E0);
  }
}

unint64_t type metadata accessor for SPUIFTEView()
{
  unint64_t result;

  result = qword_253E94560;
  if (!qword_253E94560)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E94560);
  }
  return result;
}

unint64_t sub_22E09EC64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_253E94438;
  if (!qword_253E94438)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253E94440);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253E94450);
    v2[3] = sub_22E09E3E0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22E3259E8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253E94438);
  }
  return result;
}

uint64_t sub_22E09ECF8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22E09ED1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_22E09ED28@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22E09F2E0();
  *a1 = result;
  return result;
}

uint64_t sub_22E09ED50()
{
  return sub_22E09F2EC();
}

uint64_t sub_22E09ED78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FTEView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E09EDBC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FTEView() - 8) + 80);
  return (*(uint64_t (**)(void))(v0 + ((v1 + 16) & ~v1)))();
}

unint64_t sub_22E09EDF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253E94420;
  if (!qword_253E94420)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253E94428);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22E3259E8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253E94420);
  }
  return result;
}

uint64_t sub_22E09EE5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E09EEA0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_22E09EEB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22E09EEEC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for FTEView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E943D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_22E09F2A4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_22E09EFB8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FTEView() - 8) + 80);
  return (*(uint64_t (**)(void))(v0 + ((v1 + 16) & ~v1) + 16))();
}

uint64_t sub_22E09EFF4()
{
  return sub_22E09E310();
}

uint64_t sub_22E09F008(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E3259E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void PS_PSKillProcessNamed_cold_1()
{
  dlerror();
  abort_report_np();
  sub_22E09F2A4();
}

uint64_t sub_22E09F2A4()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_22E09F2B0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_22E09F2BC()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_22E09F2C8()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_22E09F2D4()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_22E09F2E0()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_22E09F2EC()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_22E09F2F8()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_22E09F304()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_22E09F310()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_22E09F31C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_22E09F328()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_22E09F334()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_22E09F340()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_22E09F34C()
{
  return MEMORY[0x24BE851E0]();
}

uint64_t sub_22E09F358()
{
  return MEMORY[0x24BE851F0]();
}

uint64_t sub_22E09F364()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22E09F370()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22E09F37C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22E09F388()
{
  return MEMORY[0x24BDF4160]();
}

uint64_t sub_22E09F394()
{
  return MEMORY[0x24BDF4340]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x24BE3D5A8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SPBlueButtonBehavior()
{
  return MEMORY[0x24BE849B8]();
}

uint64_t SPCommittedScreenMatchingBehavior()
{
  return MEMORY[0x24BE849C8]();
}

uint64_t SPLogForSPLogCategoryDefault()
{
  return MEMORY[0x24BE84A40]();
}

uint64_t SPLogForSPLogCategoryTelemetry()
{
  return MEMORY[0x24BE84A50]();
}

uint64_t SPSetInternetDomainsEnabled()
{
  return MEMORY[0x24BE84AB8]();
}

uint64_t SPSuggestionDetailTextBehavior()
{
  return MEMORY[0x24BE84AC8]();
}

uint64_t SPUIInitLogging()
{
  return MEMORY[0x24BEB0810]();
}

uint64_t SSExtensionIdentifiersForSections()
{
  return MEMORY[0x24BEB05A0]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BEBDE50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
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

uint64_t sp_analytics_log_timing()
{
  return MEMORY[0x24BEB0088]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

