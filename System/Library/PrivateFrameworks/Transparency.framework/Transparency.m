void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21A251F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A2520A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21A25261C(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getCNContactClass()
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
  v0 = (void *)getCNContactClass_softClass;
  v7 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNContactClass_block_invoke;
    v3[3] = &unk_24DC8FAF8;
    v3[4] = &v4;
    __getCNContactClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21A2545B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ContactsLibraryCore_frameworkLibrary)
  {
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ContactsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getCNContactClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("CNContact");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getCNContactClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __initializeApplicationIdentifierMaps_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[5];
  _QWORD v25[7];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v24[0] = CFSTR("IDS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v0;
  v24[1] = CFSTR("TLT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v1;
  v24[2] = CFSTR("CK");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v2;
  v24[3] = CFSTR("MP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v3;
  v24[4] = CFSTR("FT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)kApplicationIdentifierMap;
  kApplicationIdentifierMap = v5;

  v22[0] = CFSTR("IDS");
  v22[1] = CFSTR("MP");
  v23[0] = CFSTR("im");
  v23[1] = CFSTR("mp1");
  v22[2] = CFSTR("FT");
  v23[2] = CFSTR("ftm");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)kApplicationIdentifierToUriPrefixMap;
  kApplicationIdentifierToUriPrefixMap = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v21[0] = CFSTR("IDS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  v21[1] = CFSTR("TLT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  v21[2] = CFSTR("CK");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v12;
  v21[3] = CFSTR("MP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v13;
  v21[4] = CFSTR("FT");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)kApplicationEnumMap;
  kApplicationEnumMap = v14;

  v18[0] = CFSTR("IDS");
  v18[1] = CFSTR("FT");
  v19[0] = CFSTR("com.apple.madrid");
  v19[1] = CFSTR("com.apple.private.alloy.facetime.multi");
  v18[2] = CFSTR("MP");
  v19[2] = CFSTR("com.apple.private.alloy.multiplex1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)kApplicationIDSServiceMap;
  kApplicationIDSServiceMap = v16;

}

void sub_21A255354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *KTValidateTypeGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Peer");
  else
    return off_24DC8E910[a1 - 1];
}

const __CFString *KTResultGetString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("OK");
  else
    return off_24DC8E940[a1];
}

const __CFString *KTUIStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC)
    return CFSTR("Unavailable");
  else
    return off_24DC8E960[a1 - 1];
}

const __CFString *KTStaticKeyPeerValidateResultGetString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("Pending");
  else
    return off_24DC8E9C8[a1];
}

void sub_21A258918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A258C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A258F98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A2595B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A259BDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *KTOptInGetString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Off");
  if (a1 == 1)
    v1 = CFSTR("On");
  if (a1 == 2)
    return CFSTR("Pending");
  else
    return v1;
}

void sub_21A25D75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *KTAccountStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_24DC8F218[a1 - 1];
}

const __CFString *KTSystemStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("OK");
  else
    return off_24DC8F248[a1 - 1];
}

const __CFString *KTSelfStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("OK");
  else
    return off_24DC8F270[a1 - 1];
}

const __CFString *KTIDSAccountStatusGetString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("IDSAccountStatusInvalid");
  else
    return off_24DC8F290[a1 - 1];
}

void sub_21A260C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21A26448C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A265430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21A265FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21A269B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21A269F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21A26D598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A26E6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A26EA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A26F0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A2714A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A273018(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A2731BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A2758A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21A275D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A27B7A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A27B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21A27BA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21A27BB3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A27C810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21A27CBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A27CFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A27D420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A27D898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A27DD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A27E1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A27E818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A27EBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A27EFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A27F370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21A27F71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21A27FA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21A27FDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21A280108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21A280450(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A2805A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A280958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *sub_21A282128()
{
  return "KC877N55J7";
}

uint64_t TransparencyTeamID.getter()
{
  return 0x35354E373738434BLL;
}

uint64_t sub_21A282150()
{
  return 0;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.env.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.env.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.env.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.app.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.app.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.app.modify())()
{
  return nullsub_1;
}

uint64_t sub_21A282240()
{
  return 0;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.patLogBeginMs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.patLogBeginMs.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.patLogBeginMs.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.tltLogBeginMs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.tltLogBeginMs.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.tltLogBeginMs.modify())()
{
  return nullsub_1;
}

uint64_t sub_21A2822A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21A282E6C((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.fetchTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  return sub_21A2837F8(v1 + *(int *)(v3 + 32), a1, &qword_2550D14B8);
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1)
{
  return sub_21A28456C(a1, (uint64_t *)&unk_2550D2060);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22073E9E8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.fetchTime.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  return sub_21A28385C(a1, v1 + *(int *)(v3 + 32), &qword_2550D14B8);
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.fetchTime.modify())()
{
  type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  return nullsub_1;
}

uint64_t sub_21A2823A4()
{
  return 0;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.trustedAppSPKI.getter()
{
  type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.trustedAppSPKI.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.PublicKeybag.trustedAppSPKI.modify())()
{
  type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.init(env:app:patLogBeginMs:tltLogBeginMs:fetchTime:trustedAppSPKI:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;

  v18 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v19 = a9 + *(int *)(v18 + 32);
  v20 = sub_21A2893B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  v21 = *(int *)(v18 + 36);
  *(_QWORD *)(a9 + v21) = 0;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_BYTE *)(a9 + 40) = a6 & 1;
  *(_QWORD *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 56) = a8 & 1;
  sub_21A28385C(a10, v19, &qword_2550D14B8);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v21) = a11;
  return result;
}

BOOL sub_21A28252C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21A282544()
{
  return sub_21A28947C();
}

uint64_t sub_21A282570()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21A282598 + 4 * byte_21A28EBF0[*v0]))(7761509, 0xE300000000000000);
}

uint64_t sub_21A282598()
{
  return 7368801;
}

uint64_t sub_21A2825A4()
{
  return 0x6542676F4C746170;
}

uint64_t sub_21A2825E0()
{
  return 0x6D69546863746566;
}

uint64_t sub_21A2825FC()
{
  return 0x4164657473757274;
}

uint64_t sub_21A282620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21A288C48(a1, a2);
  *a3 = result;
  return result;
}

void sub_21A282644(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_21A282650()
{
  sub_21A282904();
  return sub_21A2894AC();
}

uint64_t sub_21A282678()
{
  sub_21A282904();
  return sub_21A2894B8();
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1538);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A282904();
  sub_21A2894A0();
  v17 = 0;
  sub_21A289428();
  if (!v2)
  {
    v16 = 1;
    sub_21A289428();
    v15 = 2;
    sub_21A289440();
    v14 = 3;
    sub_21A289440();
    v9 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    v13 = 4;
    sub_21A2893B0();
    sub_21A282D48(&qword_2550D14B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_21A289434();
    v12 = *(_QWORD *)(v3 + *(int *)(v9 + 36));
    v11[15] = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1528);
    sub_21A282D88(&qword_2550D1530, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_21A289434();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21A282904()
{
  unint64_t result;

  result = qword_2550D2080;
  if (!qword_2550D2080)
  {
    result = MEMORY[0x22073EA00](&unk_21A28F36C, &type metadata for TransparencySWSysdiagnose.PublicKeybag.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D2080);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22073E9F4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v26 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
  MEMORY[0x24BDAC7A8]();
  v28 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1B58);
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v7 = MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)v9 + 4) = 0;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[40] = 1;
  *((_QWORD *)v9 + 6) = 0;
  v9[56] = 1;
  v10 = (uint64_t)&v9[*(int *)(v7 + 32)];
  v11 = sub_21A2893B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = *(int *)(v6 + 36);
  *(_QWORD *)&v9[v12] = 0;
  v13 = a1[3];
  v30 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_21A282904();
  v14 = v31;
  sub_21A289494();
  if (!v14)
  {
    v31 = v10;
    v25 = v12;
    v15 = v27;
    v16 = (uint64_t)v28;
    v38 = 0;
    v17 = v29;
    *(_QWORD *)v9 = sub_21A2893EC();
    *((_QWORD *)v9 + 1) = v18;
    v37 = 1;
    *((_QWORD *)v9 + 2) = sub_21A2893EC();
    *((_QWORD *)v9 + 3) = v19;
    v36 = 2;
    *((_QWORD *)v9 + 4) = sub_21A289404();
    v9[40] = v20 & 1;
    v35 = 3;
    *((_QWORD *)v9 + 6) = sub_21A289404();
    v9[56] = v21 & 1;
    v34 = 4;
    sub_21A282D48(&qword_2550D1B60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_21A2893F8();
    sub_21A28385C(v16, v31, &qword_2550D14B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1528);
    v33 = 5;
    sub_21A282D88(&qword_2550D1B68, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_21A2893F8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v17);
    v23 = v32;
    v24 = v25;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v9[v24] = v23;
    sub_21A28375C((uint64_t)v9, v26, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return sub_21A283720((uint64_t)v9, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21A282D48(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22073EA00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A282D88(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550D1528);
    v8 = a2;
    result = MEMORY[0x22073EA00](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A282DE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWSysdiagnose.PublicKeybag.init(from:)(a1, a2);
}

uint64_t sub_21A282DFC(_QWORD *a1)
{
  return TransparencySWSysdiagnose.PublicKeybag.encode(to:)(a1);
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.state.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.flags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWSysdiagnose.StateMachine.flags.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.flags.modify())()
{
  return nullsub_1;
}

uint64_t sub_21A282E60@<X0>(uint64_t a1@<X8>)
{
  return sub_21A282E6C(type metadata accessor for TransparencySWSysdiagnose.PublicKeybag, a1);
}

uint64_t sub_21A282E6C@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
}

uint64_t TransparencySWSysdiagnose.StateMachine.publicKeybag.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  return sub_21A2837F8(v1 + *(int *)(v3 + 24), a1, &qword_2550D14F0);
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.StateMachine(uint64_t a1)
{
  return sub_21A28456C(a1, (uint64_t *)&unk_2550D2070);
}

uint64_t TransparencySWSysdiagnose.StateMachine.publicKeybag.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  return sub_21A28385C(a1, v1 + *(int *)(v3 + 24), &qword_2550D14F0);
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.publicKeybag.modify())()
{
  type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.containerPath.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TransparencySWSysdiagnose.StateMachine(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.containerPath.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TransparencySWSysdiagnose.StateMachine(0) + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TransparencySWSysdiagnose.StateMachine.containerPath.modify())()
{
  type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.StateMachine.init(state:flags:publicKeybag:containerPath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t result;

  v14 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  v15 = (uint64_t)a7 + *(int *)(v14 + 24);
  v16 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = (_QWORD *)((char *)a7 + *(int *)(v14 + 28));
  *v17 = 0;
  v17[1] = 0;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  sub_21A28385C(a4, v15, &qword_2550D14F0);
  result = swift_bridgeObjectRelease();
  *v17 = a5;
  v17[1] = a6;
  return result;
}

uint64_t sub_21A2830C8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21A2830F4 + 4 * byte_21A28EBF6[*v0]))(0x6574617473, 0xE500000000000000);
}

uint64_t sub_21A2830F4()
{
  return 0x7367616C66;
}

uint64_t sub_21A283104()
{
  return 0x654B63696C627570;
}

uint64_t sub_21A283124()
{
  return 0x656E6961746E6F63;
}

uint64_t sub_21A283148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21A288EFC(a1, a2);
  *a3 = result;
  return result;
}

void sub_21A28316C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_21A283178()
{
  sub_21A2833B4();
  return sub_21A2894AC();
}

uint64_t sub_21A2831A0()
{
  sub_21A2833B4();
  return sub_21A2894B8();
}

uint64_t TransparencySWSysdiagnose.StateMachine.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A2833B4();
  sub_21A2894A0();
  v12 = 0;
  sub_21A289428();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + 16);
    v10[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1528);
    sub_21A282D88(&qword_2550D1530, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_21A289434();
    type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
    v10[14] = 2;
    type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    sub_21A282D48(&qword_2550D14E8, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag, (uint64_t)&protocol conformance descriptor for TransparencySWSysdiagnose.PublicKeybag);
    sub_21A289434();
    v10[13] = 3;
    sub_21A289428();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_21A2833B4()
{
  unint64_t result;

  result = qword_2550D1D98;
  if (!qword_2550D1D98)
  {
    result = MEMORY[0x22073EA00](&unk_21A28F31C, &type metadata for TransparencySWSysdiagnose.StateMachine.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D1D98);
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.StateMachine.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;

  v27 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
  MEMORY[0x24BDAC7A8]();
  v29 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1B70);
  v28 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  v7 = MEMORY[0x24BDAC7A8]();
  v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v9 = 0;
  v9[1] = 0;
  v9[2] = 0;
  v10 = (uint64_t)v9 + *(int *)(v7 + 24);
  v11 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (uint64_t *)((char *)v9 + *(int *)(v6 + 28));
  *v12 = 0;
  v12[1] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A2833B4();
  v30 = v5;
  v13 = (uint64_t)v32;
  sub_21A289494();
  if (v13)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v25 = v12;
    v26 = v10;
    v32 = a1;
    v15 = v28;
    v14 = (uint64_t)v29;
    v37 = 0;
    v16 = v30;
    v17 = v31;
    *v9 = sub_21A2893EC();
    v9[1] = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1528);
    v36 = 1;
    sub_21A282D88(&qword_2550D1B68, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_21A2893F8();
    v9[2] = v33;
    v35 = 2;
    sub_21A282D48(&qword_2550D1B78, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag, (uint64_t)&protocol conformance descriptor for TransparencySWSysdiagnose.PublicKeybag);
    sub_21A2893F8();
    sub_21A28385C(v14, v26, &qword_2550D14F0);
    v34 = 3;
    v20 = sub_21A2893EC();
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
    v23 = v25;
    swift_bridgeObjectRelease();
    *v23 = v20;
    v23[1] = v22;
    sub_21A28375C((uint64_t)v9, v27, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  return sub_21A283720((uint64_t)v9, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
}

uint64_t sub_21A283720(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21A28375C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A2837A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWSysdiagnose.StateMachine.init(from:)(a1, a2);
}

uint64_t sub_21A2837B4(_QWORD *a1)
{
  return TransparencySWSysdiagnose.StateMachine.encode(to:)(a1);
}

uint64_t sub_21A2837C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21A282E6C(type metadata accessor for TransparencySWSysdiagnose.StateMachine, a1);
}

uint64_t TransparencySWSysdiagnose.stateMachine.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21A2837F8(v1, a1, &qword_2550D1500);
}

uint64_t sub_21A2837F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t TransparencySWSysdiagnose.stateMachine.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_21A28385C(a1, v1, &qword_2550D1500);
}

uint64_t sub_21A28385C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t (*TransparencySWSysdiagnose.stateMachine.modify())()
{
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.fallback.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TransparencySWSysdiagnose(0);
  return sub_21A2837F8(v1 + *(int *)(v3 + 20), a1, &qword_2550D14B8);
}

uint64_t type metadata accessor for TransparencySWSysdiagnose(uint64_t a1)
{
  return sub_21A28456C(a1, qword_2550D1FC0);
}

uint64_t TransparencySWSysdiagnose.fallback.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TransparencySWSysdiagnose(0);
  return sub_21A28385C(a1, v1 + *(int *)(v3 + 20), &qword_2550D14B8);
}

uint64_t (*TransparencySWSysdiagnose.fallback.modify())()
{
  type metadata accessor for TransparencySWSysdiagnose(0);
  return nullsub_1;
}

uint64_t TransparencySWSysdiagnose.init(stateMachine:fallback:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a3, 1, 1, v6);
  v7 = a3 + *(int *)(type metadata accessor for TransparencySWSysdiagnose(0) + 20);
  v8 = sub_21A2893B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_21A28385C(a1, a3, &qword_2550D1500);
  return sub_21A28385C(a2, v7, &qword_2550D14B8);
}

BOOL sub_21A283A10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21A283A28()
{
  sub_21A289470();
  sub_21A28947C();
  return sub_21A289488();
}

uint64_t sub_21A283A6C()
{
  sub_21A289470();
  sub_21A28947C();
  return sub_21A289488();
}

uint64_t sub_21A283AAC()
{
  _BYTE *v0;

  if (*v0)
    return 0x6B6361626C6C6166;
  else
    return 0x63614D6574617473;
}

uint64_t sub_21A283AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21A2890E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_21A283B14(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21A283B20()
{
  sub_21A283CF4();
  return sub_21A2894AC();
}

uint64_t sub_21A283B48()
{
  sub_21A283CF4();
  return sub_21A2894B8();
}

uint64_t TransparencySWSysdiagnose.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A283CF4();
  sub_21A2894A0();
  v8[15] = 0;
  type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  sub_21A282D48(&qword_2550D14C8, type metadata accessor for TransparencySWSysdiagnose.StateMachine, (uint64_t)&protocol conformance descriptor for TransparencySWSysdiagnose.StateMachine);
  sub_21A289434();
  if (!v1)
  {
    type metadata accessor for TransparencySWSysdiagnose(0);
    v8[14] = 1;
    sub_21A2893B0();
    sub_21A282D48(&qword_2550D14B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_21A289434();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_21A283CF4()
{
  unint64_t result;

  result = qword_2550D1BF0;
  if (!qword_2550D1BF0)
  {
    result = MEMORY[0x22073EA00](&unk_21A28F2CC, &type metadata for TransparencySWSysdiagnose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D1BF0);
  }
  return result;
}

uint64_t TransparencySWSysdiagnose.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;

  v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
  MEMORY[0x24BDAC7A8]();
  v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
  MEMORY[0x24BDAC7A8]();
  v22 = (uint64_t)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1B80);
  v20 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TransparencySWSysdiagnose(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (uint64_t)&v9[*(int *)(v7 + 20)];
  v12 = sub_21A2893B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A283CF4();
  v13 = v24;
  sub_21A289494();
  if (!v13)
  {
    v24 = v11;
    v14 = v20;
    v15 = (uint64_t)v21;
    v26 = 0;
    sub_21A282D48(&qword_2550D1B88, type metadata accessor for TransparencySWSysdiagnose.StateMachine, (uint64_t)&protocol conformance descriptor for TransparencySWSysdiagnose.StateMachine);
    sub_21A2893F8();
    sub_21A28385C(v22, (uint64_t)v9, &qword_2550D1500);
    v25 = 1;
    sub_21A282D48(&qword_2550D1B60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v16 = v23;
    sub_21A2893F8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v16);
    v17 = v19;
    sub_21A28385C(v15, v24, &qword_2550D14B8);
    sub_21A28375C((uint64_t)v9, v17, type metadata accessor for TransparencySWSysdiagnose);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_21A283720((uint64_t)v9, type metadata accessor for TransparencySWSysdiagnose);
}

uint64_t sub_21A28404C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWSysdiagnose.init(from:)(a1, a2);
}

uint64_t sub_21A284060(_QWORD *a1)
{
  return TransparencySWSysdiagnose.encode(to:)(a1);
}

uint64_t TransparencySWSysdiagnose.json()()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  sub_21A289374();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCB2A8];
  MEMORY[0x24BDAC7A8]();
  sub_21A2893A4();
  swift_allocObject();
  sub_21A289398();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1540);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_21A28F3C0;
  sub_21A289368();
  sub_21A28935C();
  sub_21A282D48(&qword_2550D14E0, v0, MEMORY[0x24BDCB2C8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1518);
  sub_21A284D84(&qword_2550D1520, &qword_2550D1518, MEMORY[0x24BEE12C8]);
  sub_21A2893D4();
  sub_21A289380();
  type metadata accessor for TransparencySWSysdiagnose(0);
  sub_21A282D48(&qword_2550D1510, type metadata accessor for TransparencySWSysdiagnose, (uint64_t)&protocol conformance descriptor for TransparencySWSysdiagnose);
  v1 = sub_21A28938C();
  swift_release();
  return v1;
}

Transparency::SWTFollowUpType_optional __swiftcall SWTFollowUpType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  Transparency::SWTFollowUpType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21A2893E0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

void *static SWTFollowUpType.allCases.getter()
{
  return &unk_24DC8D360;
}

uint64_t SWTFollowUpType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6B726F4665657274;
  else
    return 0x6B6361626C6C6F72;
}

uint64_t sub_21A2842DC(char *a1, char *a2)
{
  return sub_21A2842E8(*a1, *a2);
}

uint64_t sub_21A2842E8(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x6B726F4665657274;
  else
    v2 = 0x6B6361626C6C6F72;
  if ((a2 & 1) != 0)
    v3 = 0x6B726F4665657274;
  else
    v3 = 0x6B6361626C6C6F72;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_21A289464();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_21A284364()
{
  sub_21A289470();
  sub_21A2893BC();
  swift_bridgeObjectRelease();
  return sub_21A289488();
}

uint64_t sub_21A2843D8()
{
  sub_21A2893BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A284420()
{
  sub_21A289470();
  sub_21A2893BC();
  swift_bridgeObjectRelease();
  return sub_21A289488();
}

Transparency::SWTFollowUpType_optional sub_21A284490(Swift::String *a1)
{
  return SWTFollowUpType.init(rawValue:)(*a1);
}

void sub_21A28449C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 0x6B6361626C6C6F72;
  if (*v1)
    v2 = 0x6B726F4665657274;
  *a1 = v2;
  a1[1] = 0xE800000000000000;
}

void sub_21A2844D4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24DC8D468;
}

uint64_t TransparencySWIssue.issue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TransparencySWIssue.posted.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TransparencySWIssue(0) + 20);
  v4 = sub_21A2893B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for TransparencySWIssue(uint64_t a1)
{
  return sub_21A28456C(a1, (uint64_t *)&unk_2550D22A0);
}

uint64_t sub_21A28456C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TransparencySWIssue.slh.getter()
{
  type metadata accessor for TransparencySWIssue(0);
  return swift_bridgeObjectRetain();
}

uint64_t TransparencySWIssue.init(issue:posted:slh:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;

  *a5 = a1;
  a5[1] = a2;
  v8 = type metadata accessor for TransparencySWIssue(0);
  v9 = (char *)a5 + *(int *)(v8 + 20);
  v10 = sub_21A2893B0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a3, v10);
  *(_QWORD *)((char *)a5 + *(int *)(v8 + 24)) = a4;
  return result;
}

uint64_t sub_21A284634()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x646574736F70;
  if (*v0 != 1)
    v1 = 6843507;
  if (*v0)
    return v1;
  else
    return 0x6575737369;
}

uint64_t sub_21A284680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21A2891E8(a1, a2);
  *a3 = result;
  return result;
}

void sub_21A2846A4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_21A2846B0()
{
  sub_21A2848C0();
  return sub_21A2894AC();
}

uint64_t sub_21A2846D8()
{
  sub_21A2848C0();
  return sub_21A2894B8();
}

uint64_t TransparencySWIssue.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1B90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A2848C0();
  sub_21A2894A0();
  v14 = 0;
  sub_21A28944C();
  if (!v2)
  {
    v9 = type metadata accessor for TransparencySWIssue(0);
    v13 = 1;
    sub_21A2893B0();
    sub_21A282D48(&qword_2550D14B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_21A289458();
    v12 = *(_QWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1B98);
    sub_21A284C64(&qword_2550D1BA0, (uint64_t (*)(void))sub_21A284904, MEMORY[0x24BEE12A0]);
    sub_21A289458();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_21A2848C0()
{
  unint64_t result;

  result = qword_2550D22D8[0];
  if (!qword_2550D22D8[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F27C, &type metadata for TransparencySWIssue.CodingKeys);
    atomic_store(result, qword_2550D22D8);
  }
  return result;
}

unint64_t sub_21A284904()
{
  unint64_t result;

  result = qword_2550D1BA8;
  if (!qword_2550D1BA8)
  {
    result = MEMORY[0x22073EA00](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2550D1BA8);
  }
  return result;
}

uint64_t TransparencySWIssue.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v18 = a2;
  v21 = sub_21A2893B0();
  v19 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1BB0);
  v5 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TransparencySWIssue(0);
  MEMORY[0x24BDAC7A8]();
  v10 = (uint64_t *)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21A2848C0();
  v22 = v7;
  v11 = (uint64_t)v23;
  sub_21A289494();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12 = v5;
  v23 = a1;
  v14 = v20;
  v13 = v21;
  v27 = 0;
  *v10 = sub_21A289410();
  v10[1] = v15;
  v26 = 1;
  sub_21A282D48(&qword_2550D1B60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_21A28941C();
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))((char *)v10 + *(int *)(v8 + 20), v4, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1B98);
  v25 = 2;
  sub_21A284C64(&qword_2550D1BB8, (uint64_t (*)(void))sub_21A284CCC, MEMORY[0x24BEE12D0]);
  sub_21A28941C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v14);
  *(uint64_t *)((char *)v10 + *(int *)(v8 + 24)) = v24;
  sub_21A28375C((uint64_t)v10, v18, type metadata accessor for TransparencySWIssue);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return sub_21A283720((uint64_t)v10, type metadata accessor for TransparencySWIssue);
}

uint64_t sub_21A284C64(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550D1B98);
    v8 = a2();
    result = MEMORY[0x22073EA00](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21A284CCC()
{
  unint64_t result;

  result = qword_2550D1BC0;
  if (!qword_2550D1BC0)
  {
    result = MEMORY[0x22073EA00](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2550D1BC0);
  }
  return result;
}

unint64_t sub_21A284D14()
{
  unint64_t result;

  result = qword_2550D1BC8;
  if (!qword_2550D1BC8)
  {
    result = MEMORY[0x22073EA00](&protocol conformance descriptor for SWTFollowUpType, &type metadata for SWTFollowUpType);
    atomic_store(result, (unint64_t *)&qword_2550D1BC8);
  }
  return result;
}

uint64_t sub_21A284D58()
{
  return sub_21A284D84(&qword_2550D1BD0, &qword_2550D1BD8, MEMORY[0x24BEE12E0]);
}

uint64_t sub_21A284D84(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22073EA00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A284DC4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TransparencySWIssue.init(from:)(a1, a2);
}

uint64_t sub_21A284DD8(_QWORD *a1)
{
  return TransparencySWIssue.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for TransparencySWSysdiagnose(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(uint64_t *, _QWORD, uint64_t, uint64_t);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  char *__dst;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v45 = v8;
      v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      a1[2] = a2[2];
      v12 = *(int *)(v7 + 24);
      v13 = (uint64_t *)((char *)a1 + v12);
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
      v16 = *(_QWORD *)(v15 - 8);
      v17 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48);
      v18 = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v17(v14, 1, v18))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        v20 = v45;
      }
      else
      {
        v43 = v16;
        v44 = v18;
        v21 = v14[1];
        *v13 = *v14;
        v13[1] = v21;
        v22 = v14[3];
        v13[2] = v14[2];
        v13[3] = v22;
        v13[4] = v14[4];
        *((_BYTE *)v13 + 40) = *((_BYTE *)v14 + 40);
        v13[6] = v14[6];
        *((_BYTE *)v13 + 56) = *((_BYTE *)v14 + 56);
        v23 = *(int *)(v18 + 32);
        __dst = (char *)v13 + v23;
        v24 = (char *)v14 + v23;
        v25 = sub_21A2893B0();
        v41 = *(_QWORD *)(v25 - 8);
        v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v26(v24, 1, v25))
        {
          v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
          memcpy(__dst, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v41 + 16))(__dst, v24, v25);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(__dst, 0, 1, v25);
        }
        v20 = v45;
        *(_QWORD *)((char *)v13 + *(int *)(v44 + 36)) = *(_QWORD *)((char *)v14 + *(int *)(v44 + 36));
        v28 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v43 + 56);
        swift_bridgeObjectRetain();
        v28(v13, 0, 1, v44);
      }
      v29 = *(int *)(v7 + 28);
      v30 = (uint64_t *)((char *)a1 + v29);
      v31 = (uint64_t *)((char *)a2 + v29);
      v32 = v31[1];
      *v30 = *v31;
      v30[1] = v32;
      v33 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v20 + 56);
      swift_bridgeObjectRetain();
      v33(a1, 0, 1, v7);
    }
    v34 = *(int *)(a3 + 20);
    v35 = (char *)a1 + v34;
    v36 = (char *)a2 + v34;
    v37 = sub_21A2893B0();
    v38 = *(_QWORD *)(v37 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
    }
  }
  return a1;
}

uint64_t destroy for TransparencySWSysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v4 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = a1 + *(int *)(v4 + 24);
    v6 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = v5 + *(int *)(v6 + 32);
      v8 = sub_21A2893B0();
      v9 = *(_QWORD *)(v8 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v10 = a1 + *(int *)(a2 + 20);
  v11 = sub_21A2893B0();
  v12 = *(_QWORD *)(v11 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  return result;
}

_QWORD *initializeWithCopy for TransparencySWSysdiagnose(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void (*v28)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  char *__dst;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v40 = v7;
    v41 = a3;
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    v10 = *(int *)(v6 + 24);
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    v13 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15(v12, 1, v13))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v17 = v12[1];
      *v11 = *v12;
      v11[1] = v17;
      v18 = v12[3];
      v11[2] = v12[2];
      v11[3] = v18;
      v11[4] = v12[4];
      *((_BYTE *)v11 + 40) = *((_BYTE *)v12 + 40);
      v11[6] = v12[6];
      *((_BYTE *)v11 + 56) = *((_BYTE *)v12 + 56);
      v19 = *(int *)(v13 + 32);
      __dst = (char *)v11 + v19;
      v39 = v14;
      v20 = (char *)v12 + v19;
      v21 = sub_21A2893B0();
      v36 = *(_QWORD *)(v21 - 8);
      v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v37(v20, 1, v21))
      {
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
        memcpy(__dst, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(__dst, v20, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(__dst, 0, 1, v21);
      }
      *(_QWORD *)((char *)v11 + *(int *)(v13 + 36)) = *(_QWORD *)((char *)v12 + *(int *)(v13 + 36));
      v23 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56);
      swift_bridgeObjectRetain();
      v23(v11, 0, 1, v13);
    }
    v24 = *(int *)(v6 + 28);
    v25 = (_QWORD *)((char *)a1 + v24);
    v26 = (_QWORD *)((char *)a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v40 + 56);
    swift_bridgeObjectRetain();
    v28(a1, 0, 1, v6);
    a3 = v41;
  }
  v29 = *(int *)(a3 + 20);
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = sub_21A2893B0();
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  }
  return a1;
}

_QWORD *assignWithCopy for TransparencySWSysdiagnose(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  void (*v44)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t v50;
  uint64_t (*v51)(void *, uint64_t, uint64_t);
  int v52;
  size_t v53;
  void *v54;
  void (*v55)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(char *, uint64_t, uint64_t);
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(char *, uint64_t, uint64_t);
  unsigned int (*v72)(char *, uint64_t, uint64_t);
  char *v73;
  _QWORD *v74;
  char *__src;
  _QWORD *__srca;
  _QWORD *__dst;
  void *__dsta;
  void *__dstb;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_21A283720((uint64_t)a1, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
      goto LABEL_7;
    }
    *a1 = *a2;
    a1[1] = a2[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20 = *(int *)(v6 + 24);
    v21 = (uint64_t)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    v24 = *(_QWORD *)(v23 - 8);
    v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
    v26 = v25(v21, 1, v23);
    v27 = v25((uint64_t)v22, 1, v23);
    if (v26)
    {
      if (!v27)
      {
        *(_QWORD *)v21 = *(_QWORD *)v22;
        *(_QWORD *)(v21 + 8) = *((_QWORD *)v22 + 1);
        *(_QWORD *)(v21 + 16) = *((_QWORD *)v22 + 2);
        *(_QWORD *)(v21 + 24) = *((_QWORD *)v22 + 3);
        v28 = *((_QWORD *)v22 + 4);
        *(_BYTE *)(v21 + 40) = v22[40];
        *(_QWORD *)(v21 + 32) = v28;
        v29 = *((_QWORD *)v22 + 6);
        *(_BYTE *)(v21 + 56) = v22[56];
        *(_QWORD *)(v21 + 48) = v29;
        v30 = *(int *)(v23 + 32);
        __dsta = (void *)(v21 + v30);
        v81 = a3;
        __src = &v22[v30];
        v31 = sub_21A2893B0();
        v70 = *(_QWORD *)(v31 - 8);
        v72 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v72(__src, 1, v31))
        {
          v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
          memcpy(__dsta, __src, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, char *, uint64_t))(v70 + 16))(__dsta, __src, v31);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v70 + 56))(__dsta, 0, 1, v31);
        }
        a3 = v81;
        *(_QWORD *)(v21 + *(int *)(v23 + 36)) = *(_QWORD *)&v22[*(int *)(v23 + 36)];
        v55 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56);
        swift_bridgeObjectRetain();
        v55(v21, 0, 1, v23);
        goto LABEL_31;
      }
      goto LABEL_16;
    }
    if (v27)
    {
      sub_21A283720(v21, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
LABEL_16:
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
      memcpy((void *)v21, v22, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
LABEL_31:
      v56 = *(int *)(v6 + 28);
      v57 = (_QWORD *)((char *)a1 + v56);
      v58 = (_QWORD *)((char *)a2 + v56);
      *v57 = *v58;
      v57[1] = v58[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    v82 = a3;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    *(_QWORD *)(v21 + 8) = *((_QWORD *)v22 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v21 + 16) = *((_QWORD *)v22 + 2);
    *(_QWORD *)(v21 + 24) = *((_QWORD *)v22 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v45 = *((_QWORD *)v22 + 4);
    *(_BYTE *)(v21 + 40) = v22[40];
    *(_QWORD *)(v21 + 32) = v45;
    v46 = *((_QWORD *)v22 + 6);
    *(_BYTE *)(v21 + 56) = v22[56];
    *(_QWORD *)(v21 + 48) = v46;
    v47 = *(int *)(v23 + 32);
    v48 = (void *)(v21 + v47);
    v49 = &v22[v47];
    v50 = sub_21A2893B0();
    v74 = *(_QWORD **)(v50 - 8);
    v51 = (uint64_t (*)(void *, uint64_t, uint64_t))v74[6];
    __dstb = v48;
    LODWORD(v48) = v51(v48, 1, v50);
    v52 = v51(v49, 1, v50);
    if ((_DWORD)v48)
    {
      if (!v52)
      {
        ((void (*)(void *, char *, uint64_t))v74[2])(__dstb, v49, v50);
        ((void (*)(void *, _QWORD, uint64_t, uint64_t))v74[7])(__dstb, 0, 1, v50);
        goto LABEL_30;
      }
      v53 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v54 = __dstb;
    }
    else
    {
      if (!v52)
      {
        ((void (*)(void *, char *, uint64_t))v74[3])(__dstb, v49, v50);
        goto LABEL_30;
      }
      ((void (*)(void *, uint64_t))v74[1])(__dstb, v50);
      v53 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v54 = __dstb;
    }
    memcpy(v54, v49, v53);
LABEL_30:
    *(_QWORD *)(v21 + *(int *)(v23 + 36)) = *(_QWORD *)&v22[*(int *)(v23 + 36)];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    a3 = v82;
    goto LABEL_31;
  }
  if (v10)
  {
LABEL_7:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_32;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v11 = *(int *)(v6 + 24);
  v12 = a2;
  v13 = (_QWORD *)((char *)a1 + v11);
  __dst = v12;
  v80 = a3;
  v14 = (_QWORD *)((char *)v12 + v11);
  v15 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v16 = *(_QWORD **)(v15 - 8);
  v17 = (unsigned int (*)(_QWORD *, uint64_t, uint64_t))v16[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17(v14, 1, v15))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    a3 = v80;
  }
  else
  {
    *v13 = *v14;
    v13[1] = v14[1];
    v13[2] = v14[2];
    v13[3] = v14[3];
    v33 = v14[4];
    *((_BYTE *)v13 + 40) = *((_BYTE *)v14 + 40);
    v13[4] = v33;
    v34 = v14[6];
    *((_BYTE *)v13 + 56) = *((_BYTE *)v14 + 56);
    v13[6] = v34;
    v35 = *(int *)(v15 + 32);
    v73 = (char *)v13 + v35;
    __srca = v16;
    v36 = (char *)v14 + v35;
    v37 = sub_21A2893B0();
    v69 = *(_QWORD *)(v37 - 8);
    v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v71(v36, 1, v37))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
      memcpy(v73, v36, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v73, v36, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56))(v73, 0, 1, v37);
    }
    a3 = v80;
    *(_QWORD *)((char *)v13 + *(int *)(v15 + 36)) = *(_QWORD *)((char *)v14 + *(int *)(v15 + 36));
    v40 = (void (*)(_QWORD *, _QWORD, uint64_t, uint64_t))__srca[7];
    swift_bridgeObjectRetain();
    v40(v13, 0, 1, v15);
  }
  a2 = __dst;
  v41 = *(int *)(v6 + 28);
  v42 = (_QWORD *)((char *)a1 + v41);
  v43 = (_QWORD *)((char *)__dst + v41);
  *v42 = *v43;
  v42[1] = v43[1];
  v44 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain();
  v44(a1, 0, 1, v6);
LABEL_32:
  v59 = *(int *)(a3 + 20);
  v60 = (char *)a1 + v59;
  v61 = (char *)a2 + v59;
  v62 = sub_21A2893B0();
  v63 = *(_QWORD *)(v62 - 8);
  v64 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v63 + 48);
  v65 = v64(v60, 1, v62);
  v66 = v64(v61, 1, v62);
  if (!v65)
  {
    if (!v66)
    {
      (*(void (**)(char *, char *, uint64_t))(v63 + 24))(v60, v61, v62);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v63 + 8))(v60, v62);
    goto LABEL_37;
  }
  if (v66)
  {
LABEL_37:
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v60, v61, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v60, v61, v62);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v60, 0, 1, v62);
  return a1;
}

_QWORD *initializeWithTake for TransparencySWSysdiagnose(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  char *__dst;

  v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v9 = *(int *)(v6 + 24);
    v10 = (_OWORD *)((char *)a1 + v9);
    v11 = (_OWORD *)((char *)a2 + v9);
    v12 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v15 = v11[1];
      *v10 = *v11;
      v10[1] = v15;
      *((_QWORD *)v10 + 4) = *((_QWORD *)v11 + 4);
      *((_BYTE *)v10 + 40) = *((_BYTE *)v11 + 40);
      *((_QWORD *)v10 + 6) = *((_QWORD *)v11 + 6);
      *((_BYTE *)v10 + 56) = *((_BYTE *)v11 + 56);
      v16 = *(int *)(v12 + 32);
      v28 = v13;
      __dst = (char *)v10 + v16;
      v17 = (char *)v11 + v16;
      v18 = sub_21A2893B0();
      v27 = *(_QWORD *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v17, 1, v18))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
        memcpy(__dst, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 32))(__dst, v17, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(__dst, 0, 1, v18);
      }
      *(_QWORD *)((char *)v10 + *(int *)(v12 + 36)) = *(_QWORD *)((char *)v11 + *(int *)(v12 + 36));
      (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v10, 0, 1, v12);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v6 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 28));
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v20 = *(int *)(a3 + 20);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = sub_21A2893B0();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

_QWORD *assignWithTake for TransparencySWSysdiagnose(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  int v25;
  int v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t (*v46)(void *, uint64_t, uint64_t);
  int v47;
  size_t v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(char *, uint64_t, uint64_t);
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  void *__dst;
  char *__dsta;
  void *__dstb;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v6 = type metadata accessor for TransparencySWSysdiagnose.StateMachine(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_21A283720((uint64_t)a1, type metadata accessor for TransparencySWSysdiagnose.StateMachine);
      goto LABEL_7;
    }
    v18 = a2[1];
    *a1 = *a2;
    a1[1] = v18;
    swift_bridgeObjectRelease();
    a1[2] = a2[2];
    swift_bridgeObjectRelease();
    v19 = *(int *)(v6 + 24);
    v20 = (uint64_t)a1 + v19;
    v21 = (char *)a2 + v19;
    v22 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
    v25 = v24(v20, 1, v22);
    v26 = v24((uint64_t)v21, 1, v22);
    if (v25)
    {
      if (!v26)
      {
        v27 = *((_OWORD *)v21 + 1);
        *(_OWORD *)v20 = *(_OWORD *)v21;
        *(_OWORD *)(v20 + 16) = v27;
        *(_QWORD *)(v20 + 32) = *((_QWORD *)v21 + 4);
        *(_BYTE *)(v20 + 40) = v21[40];
        *(_QWORD *)(v20 + 48) = *((_QWORD *)v21 + 6);
        *(_BYTE *)(v20 + 56) = v21[56];
        v28 = *(int *)(v22 + 32);
        __dst = (void *)(v20 + v28);
        v70 = a3;
        v29 = &v21[v28];
        v30 = sub_21A2893B0();
        v31 = *(_QWORD *)(v30 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
        {
          v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
          memcpy(__dst, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, char *, uint64_t))(v31 + 32))(__dst, v29, v30);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v31 + 56))(__dst, 0, 1, v30);
        }
        a3 = v70;
        *(_QWORD *)(v20 + *(int *)(v22 + 36)) = *(_QWORD *)&v21[*(int *)(v22 + 36)];
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
        goto LABEL_31;
      }
      goto LABEL_16;
    }
    if (v26)
    {
      sub_21A283720(v20, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
LABEL_16:
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
      memcpy((void *)v20, v21, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
LABEL_31:
      v50 = *(int *)(v6 + 28);
      v51 = (_QWORD *)((char *)a1 + v50);
      v52 = (_QWORD *)((char *)a2 + v50);
      v54 = *v52;
      v53 = v52[1];
      *v51 = v54;
      v51[1] = v53;
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    v72 = a3;
    v40 = *((_QWORD *)v21 + 1);
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *(_QWORD *)(v20 + 8) = v40;
    swift_bridgeObjectRelease();
    v41 = *((_QWORD *)v21 + 3);
    *(_QWORD *)(v20 + 16) = *((_QWORD *)v21 + 2);
    *(_QWORD *)(v20 + 24) = v41;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v20 + 32) = *((_QWORD *)v21 + 4);
    *(_BYTE *)(v20 + 40) = v21[40];
    *(_QWORD *)(v20 + 48) = *((_QWORD *)v21 + 6);
    *(_BYTE *)(v20 + 56) = v21[56];
    v42 = *(int *)(v22 + 32);
    v43 = (void *)(v20 + v42);
    v44 = &v21[v42];
    v45 = sub_21A2893B0();
    v66 = *(_QWORD *)(v45 - 8);
    v46 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v66 + 48);
    __dstb = v43;
    LODWORD(v43) = v46(v43, 1, v45);
    v47 = v46(v44, 1, v45);
    if ((_DWORD)v43)
    {
      if (!v47)
      {
        (*(void (**)(void *, char *, uint64_t))(v66 + 32))(__dstb, v44, v45);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v66 + 56))(__dstb, 0, 1, v45);
        goto LABEL_30;
      }
      v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v49 = __dstb;
    }
    else
    {
      if (!v47)
      {
        (*(void (**)(void *, char *, uint64_t))(v66 + 40))(__dstb, v44, v45);
        goto LABEL_30;
      }
      (*(void (**)(void *, uint64_t))(v66 + 8))(__dstb, v45);
      v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v49 = __dstb;
    }
    memcpy(v49, v44, v48);
LABEL_30:
    *(_QWORD *)(v20 + *(int *)(v22 + 36)) = *(_QWORD *)&v21[*(int *)(v22 + 36)];
    swift_bridgeObjectRelease();
    a3 = v72;
    goto LABEL_31;
  }
  if (v10)
  {
LABEL_7:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_32;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = a2[2];
  v11 = *(int *)(v6 + 24);
  v12 = (_OWORD *)((char *)a1 + v11);
  v13 = (_OWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v65 = v15;
    v33 = v13[1];
    *v12 = *v13;
    v12[1] = v33;
    *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
    *((_BYTE *)v12 + 40) = *((_BYTE *)v13 + 40);
    *((_QWORD *)v12 + 6) = *((_QWORD *)v13 + 6);
    *((_BYTE *)v12 + 56) = *((_BYTE *)v13 + 56);
    v34 = *(int *)(v14 + 32);
    __dsta = (char *)v12 + v34;
    v71 = a3;
    v35 = (char *)v13 + v34;
    v36 = sub_21A2893B0();
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
      memcpy(__dsta, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(__dsta, v35, v36);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(__dsta, 0, 1, v36);
    }
    a3 = v71;
    *(_QWORD *)((char *)v12 + *(int *)(v14 + 36)) = *(_QWORD *)((char *)v13 + *(int *)(v14 + 36));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v65 + 56))(v12, 0, 1, v14);
  }
  *(_OWORD *)((char *)a1 + *(int *)(v6 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 28));
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_32:
  v55 = *(int *)(a3 + 20);
  v56 = (char *)a1 + v55;
  v57 = (char *)a2 + v55;
  v58 = sub_21A2893B0();
  v59 = *(_QWORD *)(v58 - 8);
  v60 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v59 + 48);
  v61 = v60(v56, 1, v58);
  v62 = v60(v57, 1, v58);
  if (!v61)
  {
    if (!v62)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v56, v57, v58);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v56, v58);
    goto LABEL_37;
  }
  if (v62)
  {
LABEL_37:
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v56, v57, v58);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A2864C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A28654C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D1500);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_21A2865D0()
{
  unint64_t v0;
  unint64_t v1;

  sub_21A286674(319, &qword_2550D1508, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.StateMachine);
  if (v0 <= 0x3F)
  {
    sub_21A286674(319, &qword_2550D14C0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_21A286674(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_21A2893C8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(const void *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[2];
    v9 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v9;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
    v10 = *(int *)(a3 + 32);
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    *(_QWORD *)(a1 + 16) = v8;
    v13 = sub_21A2893B0();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15(v12, 1, v13))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    *(_QWORD *)((char *)v4 + *(int *)(a3 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 36));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_21A2893B0();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v9 = *(int *)(a3 + 32);
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  *(_QWORD *)(a1 + 16) = v7;
  v12 = sub_21A2893B0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14(v11, 1, v12))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(int *)(a3 + 32);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_21A2893B0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  v8 = *(int *)(a3 + 32);
  v9 = (void *)(a1 + v8);
  v10 = (char *)a2 + v8;
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  v11 = sub_21A2893B0();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t assignWithTake for TransparencySWSysdiagnose.PublicKeybag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v8 = *(int *)(a3 + 32);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_21A2893B0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.PublicKeybag()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A286DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose.PublicKeybag()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A286E38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void sub_21A286EB0()
{
  unint64_t v0;

  sub_21A286674(319, &qword_2550D14C0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for TransparencySWSysdiagnose.StateMachine(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(_QWORD *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v28;
  char *__dst;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = *(int *)(a3 + 24);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v30 = v12;
      v16 = v10[1];
      *v9 = *v10;
      v9[1] = v16;
      v17 = v10[3];
      v9[2] = v10[2];
      v9[3] = v17;
      v9[4] = v10[4];
      *((_BYTE *)v9 + 40) = *((_BYTE *)v10 + 40);
      v9[6] = v10[6];
      *((_BYTE *)v9 + 56) = *((_BYTE *)v10 + 56);
      v18 = *(int *)(v11 + 32);
      __dst = (char *)v9 + v18;
      v19 = (char *)v10 + v18;
      v20 = sub_21A2893B0();
      v28 = *(_QWORD *)(v20 - 8);
      v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v31(v19, 1, v20))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
        memcpy(__dst, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(__dst, v19, v20);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v20);
      }
      *(_QWORD *)((char *)v9 + *(int *)(v11 + 36)) = *(_QWORD *)((char *)v10 + *(int *)(v11 + 36));
      v22 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v30 + 56);
      swift_bridgeObjectRetain();
      v22(v9, 0, 1, v11);
    }
    v23 = *(int *)(a3 + 28);
    v24 = (uint64_t *)((char *)v4 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = v4 + *(int *)(v5 + 32);
    v7 = sub_21A2893B0();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TransparencySWSysdiagnose.StateMachine(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(_QWORD *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  void (*v21)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  char *v27;
  char *__dst;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v29 = v11;
    v30 = v3;
    v14 = v9[1];
    *v8 = *v9;
    v8[1] = v14;
    v15 = v9[3];
    v8[2] = v9[2];
    v8[3] = v15;
    v8[4] = v9[4];
    *((_BYTE *)v8 + 40) = *((_BYTE *)v9 + 40);
    v8[6] = v9[6];
    *((_BYTE *)v8 + 56) = *((_BYTE *)v9 + 56);
    v16 = *(int *)(v10 + 32);
    v27 = (char *)v9 + v16;
    __dst = (char *)v8 + v16;
    v17 = sub_21A2893B0();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19(v27, 1, v17))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
      memcpy(__dst, v27, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(__dst, v27, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
    }
    *(_QWORD *)((char *)v8 + *(int *)(v10 + 36)) = *(_QWORD *)((char *)v9 + *(int *)(v10 + 36));
    v21 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v29 + 56);
    swift_bridgeObjectRetain();
    v21(v8, 0, 1, v10);
    v3 = v30;
  }
  v22 = *(int *)(v3 + 28);
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TransparencySWSysdiagnose.StateMachine(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(void *, uint64_t, uint64_t);
  int v29;
  size_t v30;
  void *v31;
  void (*v32)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  void *v39;
  void *__dst;
  uint64_t v41;
  uint64_t v42;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (uint64_t)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11((uint64_t)v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_21A283720(v7, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
      goto LABEL_7;
    }
    v42 = a3;
    *(_QWORD *)v7 = *(_QWORD *)v8;
    *(_QWORD *)(v7 + 8) = *((_QWORD *)v8 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v7 + 16) = *((_QWORD *)v8 + 2);
    *(_QWORD *)(v7 + 24) = *((_QWORD *)v8 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21 = *((_QWORD *)v8 + 4);
    *(_BYTE *)(v7 + 40) = v8[40];
    *(_QWORD *)(v7 + 32) = v21;
    v22 = *((_QWORD *)v8 + 6);
    *(_BYTE *)(v7 + 56) = v8[56];
    *(_QWORD *)(v7 + 48) = v22;
    v23 = *(int *)(v9 + 32);
    v24 = (void *)(v7 + v23);
    v25 = &v8[v23];
    v26 = sub_21A2893B0();
    v27 = *(_QWORD *)(v26 - 8);
    v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v27 + 48);
    v39 = v24;
    LODWORD(v24) = v28(v24, 1, v26);
    v29 = v28(v25, 1, v26);
    if ((_DWORD)v24)
    {
      if (!v29)
      {
        (*(void (**)(void *, char *, uint64_t))(v27 + 16))(v39, v25, v26);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v39, 0, 1, v26);
        goto LABEL_18;
      }
      v30 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v31 = v39;
    }
    else
    {
      if (!v29)
      {
        (*(void (**)(void *, char *, uint64_t))(v27 + 24))(v39, v25, v26);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v27 + 8))(v39, v26);
      v30 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v31 = v39;
    }
    memcpy(v31, v25, v30);
LABEL_18:
    *(_QWORD *)(v7 + *(int *)(v9 + 36)) = *(_QWORD *)&v8[*(int *)(v9 + 36)];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    a3 = v42;
    goto LABEL_19;
  }
  if (v13)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    memcpy((void *)v7, v8, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_19;
  }
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_QWORD *)(v7 + 8) = *((_QWORD *)v8 + 1);
  *(_QWORD *)(v7 + 16) = *((_QWORD *)v8 + 2);
  *(_QWORD *)(v7 + 24) = *((_QWORD *)v8 + 3);
  v14 = *((_QWORD *)v8 + 4);
  *(_BYTE *)(v7 + 40) = v8[40];
  *(_QWORD *)(v7 + 32) = v14;
  v15 = *((_QWORD *)v8 + 6);
  *(_BYTE *)(v7 + 56) = v8[56];
  *(_QWORD *)(v7 + 48) = v15;
  v16 = *(int *)(v9 + 32);
  __dst = (void *)(v7 + v16);
  v41 = a3;
  v17 = &v8[v16];
  v18 = sub_21A2893B0();
  v37 = *(_QWORD *)(v18 - 8);
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v38(v17, 1, v18))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(__dst, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v37 + 16))(__dst, v17, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v37 + 56))(__dst, 0, 1, v18);
  }
  a3 = v41;
  *(_QWORD *)(v7 + *(int *)(v9 + 36)) = *(_QWORD *)&v8[*(int *)(v9 + 36)];
  v32 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  v32(v7, 0, 1, v9);
LABEL_19:
  v33 = *(int *)(a3 + 28);
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TransparencySWSysdiagnose.StateMachine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *__dst;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = (_OWORD *)(a1 + v6);
  v8 = (_OWORD *)(a2 + v6);
  v9 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = v8[1];
    *v7 = *v8;
    v7[1] = v12;
    *((_QWORD *)v7 + 4) = *((_QWORD *)v8 + 4);
    *((_BYTE *)v7 + 40) = *((_BYTE *)v8 + 40);
    *((_QWORD *)v7 + 6) = *((_QWORD *)v8 + 6);
    *((_BYTE *)v7 + 56) = *((_BYTE *)v8 + 56);
    v13 = *(int *)(v9 + 32);
    __dst = (char *)v7 + v13;
    v14 = (char *)v8 + v13;
    v15 = sub_21A2893B0();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
      memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(__dst, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
    *(_QWORD *)((char *)v7 + *(int *)(v9 + 36)) = *(_QWORD *)((char *)v8 + *(int *)(v9 + 36));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

_QWORD *assignWithTake for TransparencySWSysdiagnose.StateMachine(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t (*v28)(void *, uint64_t, uint64_t);
  int v29;
  size_t v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *__dst;
  void *__dsta;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = (uint64_t)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for TransparencySWSysdiagnose.PublicKeybag(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12((uint64_t)v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_21A283720(v8, type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
      goto LABEL_7;
    }
    v22 = *((_QWORD *)v9 + 1);
    *(_QWORD *)v8 = *(_QWORD *)v9;
    *(_QWORD *)(v8 + 8) = v22;
    swift_bridgeObjectRelease();
    v23 = *((_QWORD *)v9 + 3);
    *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
    *(_QWORD *)(v8 + 24) = v23;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    *(_BYTE *)(v8 + 40) = v9[40];
    *(_QWORD *)(v8 + 48) = *((_QWORD *)v9 + 6);
    *(_BYTE *)(v8 + 56) = v9[56];
    v24 = *(int *)(v10 + 32);
    v25 = (void *)(v8 + v24);
    v26 = &v9[v24];
    v27 = sub_21A2893B0();
    v38 = *(_QWORD *)(v27 - 8);
    v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v38 + 48);
    __dsta = v25;
    LODWORD(v25) = v28(v25, 1, v27);
    v29 = v28(v26, 1, v27);
    if ((_DWORD)v25)
    {
      if (!v29)
      {
        (*(void (**)(void *, char *, uint64_t))(v38 + 32))(__dsta, v26, v27);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v38 + 56))(__dsta, 0, 1, v27);
        goto LABEL_18;
      }
      v30 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v31 = __dsta;
    }
    else
    {
      if (!v29)
      {
        (*(void (**)(void *, char *, uint64_t))(v38 + 40))(__dsta, v26, v27);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v38 + 8))(__dsta, v27);
      v30 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8) - 8) + 64);
      v31 = __dsta;
    }
    memcpy(v31, v26, v30);
LABEL_18:
    *(_QWORD *)(v8 + *(int *)(v10 + 36)) = *(_QWORD *)&v9[*(int *)(v10 + 36)];
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_7:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    memcpy((void *)v8, v9, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_19;
  }
  v15 = *((_OWORD *)v9 + 1);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v15;
  *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
  *(_BYTE *)(v8 + 40) = v9[40];
  *(_QWORD *)(v8 + 48) = *((_QWORD *)v9 + 6);
  *(_BYTE *)(v8 + 56) = v9[56];
  v16 = *(int *)(v10 + 32);
  __dst = (void *)(v8 + v16);
  v17 = &v9[v16];
  v18 = sub_21A2893B0();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14B8);
    memcpy(__dst, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v19 + 32))(__dst, v17, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  *(_QWORD *)(v8 + *(int *)(v10 + 36)) = *(_QWORD *)&v9[*(int *)(v10 + 36)];
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_19:
  v32 = *(int *)(a3 + 28);
  v33 = (_QWORD *)((char *)a1 + v32);
  v34 = (_QWORD *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.StateMachine()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A287CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose.StateMachine()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A287D60(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D14F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_21A287DD8()
{
  unint64_t v0;

  sub_21A286674(319, &qword_2550D14F8, (void (*)(uint64_t))type metadata accessor for TransparencySWSysdiagnose.PublicKeybag);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SWTFollowUpType()
{
  return &type metadata for SWTFollowUpType;
}

uint64_t *initializeBufferWithCopyOfBuffer for TransparencySWIssue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21A2893B0();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TransparencySWIssue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21A2893B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TransparencySWIssue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A2893B0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TransparencySWIssue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A2893B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for TransparencySWIssue(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A2893B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for TransparencySWIssue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A2893B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransparencySWIssue()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A2881E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A2893B0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TransparencySWIssue()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A288268(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_21A2893B0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A2882DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A2893B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TransparencySWIssue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TransparencySWIssue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21A288438 + 4 * byte_21A28EBFF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21A28846C + 4 * byte_21A28EBFA[v4]))();
}

uint64_t sub_21A28846C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A288474(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A28847CLL);
  return result;
}

uint64_t sub_21A288488(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A288490);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21A288494(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A28849C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWIssue.CodingKeys()
{
  return &type metadata for TransparencySWIssue.CodingKeys;
}

uint64_t _s12Transparency15SWTFollowUpTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s12Transparency15SWTFollowUpTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21A288594 + 4 * byte_21A28EC09[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21A2885C8 + 4 * byte_21A28EC04[v4]))();
}

uint64_t sub_21A2885C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A2885D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A2885D8);
  return result;
}

uint64_t sub_21A2885E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A2885ECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21A2885F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A2885F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A288604(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21A28860C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.StateMachine.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose.StateMachine.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_21A288704 + 4 * byte_21A28EC13[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21A288738 + 4 * byte_21A28EC0E[v4]))();
}

uint64_t sub_21A288738(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A288740(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A288748);
  return result;
}

uint64_t sub_21A288754(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A28875CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21A288760(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A288768(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.StateMachine.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.StateMachine.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TransparencySWSysdiagnose.PublicKeybag.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TransparencySWSysdiagnose.PublicKeybag.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_21A288860 + 4 * byte_21A28EC1D[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21A288894 + 4 * byte_21A28EC18[v4]))();
}

uint64_t sub_21A288894(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A28889C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A2888A4);
  return result;
}

uint64_t sub_21A2888B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A2888B8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21A2888BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A2888C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21A2888D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransparencySWSysdiagnose.PublicKeybag.CodingKeys()
{
  return &type metadata for TransparencySWSysdiagnose.PublicKeybag.CodingKeys;
}

unint64_t sub_21A2888EC()
{
  unint64_t result;

  result = qword_2550D2760[0];
  if (!qword_2550D2760[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F02C, &type metadata for TransparencySWSysdiagnose.PublicKeybag.CodingKeys);
    atomic_store(result, qword_2550D2760);
  }
  return result;
}

unint64_t sub_21A288934()
{
  unint64_t result;

  result = qword_2550D2870[0];
  if (!qword_2550D2870[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F0E4, &type metadata for TransparencySWSysdiagnose.StateMachine.CodingKeys);
    atomic_store(result, qword_2550D2870);
  }
  return result;
}

unint64_t sub_21A28897C()
{
  unint64_t result;

  result = qword_2550D2980[0];
  if (!qword_2550D2980[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F19C, &type metadata for TransparencySWSysdiagnose.CodingKeys);
    atomic_store(result, qword_2550D2980);
  }
  return result;
}

unint64_t sub_21A2889C4()
{
  unint64_t result;

  result = qword_2550D2B90[0];
  if (!qword_2550D2B90[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F254, &type metadata for TransparencySWIssue.CodingKeys);
    atomic_store(result, qword_2550D2B90);
  }
  return result;
}

unint64_t sub_21A288A0C()
{
  unint64_t result;

  result = qword_2550D2CA0;
  if (!qword_2550D2CA0)
  {
    result = MEMORY[0x22073EA00](&unk_21A28F1C4, &type metadata for TransparencySWIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D2CA0);
  }
  return result;
}

unint64_t sub_21A288A54()
{
  unint64_t result;

  result = qword_2550D2CA8[0];
  if (!qword_2550D2CA8[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F1EC, &type metadata for TransparencySWIssue.CodingKeys);
    atomic_store(result, qword_2550D2CA8);
  }
  return result;
}

unint64_t sub_21A288A9C()
{
  unint64_t result;

  result = qword_2550D1C00[0];
  if (!qword_2550D1C00[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F10C, &type metadata for TransparencySWSysdiagnose.CodingKeys);
    atomic_store(result, qword_2550D1C00);
  }
  return result;
}

unint64_t sub_21A288AE4()
{
  unint64_t result;

  result = qword_2550D1BF8;
  if (!qword_2550D1BF8)
  {
    result = MEMORY[0x22073EA00](&unk_21A28F134, &type metadata for TransparencySWSysdiagnose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D1BF8);
  }
  return result;
}

unint64_t sub_21A288B2C()
{
  unint64_t result;

  result = qword_2550D1DB0[0];
  if (!qword_2550D1DB0[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28F054, &type metadata for TransparencySWSysdiagnose.StateMachine.CodingKeys);
    atomic_store(result, qword_2550D1DB0);
  }
  return result;
}

unint64_t sub_21A288B74()
{
  unint64_t result;

  result = qword_2550D1DA8;
  if (!qword_2550D1DA8)
  {
    result = MEMORY[0x22073EA00](&unk_21A28F07C, &type metadata for TransparencySWSysdiagnose.StateMachine.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D1DA8);
  }
  return result;
}

unint64_t sub_21A288BBC()
{
  unint64_t result;

  result = qword_2550D2090[0];
  if (!qword_2550D2090[0])
  {
    result = MEMORY[0x22073EA00](&unk_21A28EF9C, &type metadata for TransparencySWSysdiagnose.PublicKeybag.CodingKeys);
    atomic_store(result, qword_2550D2090);
  }
  return result;
}

unint64_t sub_21A288C04()
{
  unint64_t result;

  result = qword_2550D2088;
  if (!qword_2550D2088)
  {
    result = MEMORY[0x22073EA00](&unk_21A28EFC4, &type metadata for TransparencySWSysdiagnose.PublicKeybag.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2550D2088);
  }
  return result;
}

uint64_t sub_21A288C48(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7761509 && a2 == 0xE300000000000000;
  if (v2 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7368801 && a2 == 0xE300000000000000 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6542676F4C746170 && a2 == 0xED0000734D6E6967 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6542676F4C746C74 && a2 == 0xED0000734D6E6967 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D69546863746566 && a2 == 0xE900000000000065 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4164657473757274 && a2 == 0xEE00494B50537070)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_21A289464();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_21A288EFC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
  if (v2 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7367616C66 && a2 == 0xE500000000000000 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xEC00000067616279 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656E6961746E6F63 && a2 == 0xED00006874615072)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_21A289464();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_21A2890E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x63614D6574617473 && a2 == 0xEC000000656E6968;
  if (v2 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B6361626C6C6166 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_21A289464();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21A2891E8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6575737369 && a2 == 0xE500000000000000;
  if (v2 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646574736F70 && a2 == 0xE600000000000000 || (sub_21A289464() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 6843507 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_21A289464();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

void __getCNContactClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_21A28935C();
}

uint64_t sub_21A28935C()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t sub_21A289368()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_21A289374()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_21A289380()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_21A28938C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21A289398()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_21A2893A4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21A2893B0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21A2893BC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21A2893C8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21A2893D4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21A2893E0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21A2893EC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21A2893F8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21A289404()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_21A289410()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21A28941C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21A289428()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21A289434()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21A289440()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_21A28944C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21A289458()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21A289464()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21A289470()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A28947C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A289488()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21A289494()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21A2894A0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21A2894AC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21A2894B8()
{
  return MEMORY[0x24BEE4A10]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC170](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PCSPublicIdentityCopyPublicKeyInfo()
{
  return MEMORY[0x24BE7AE40]();
}

uint64_t PCSPublicIdentityCreateWithPublicKeyInfo()
{
  return MEMORY[0x24BE7AE48]();
}

uint64_t PCSReportManateeStatus()
{
  return MEMORY[0x24BE7AE50]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x24BDAD6B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x24BDAD6B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x24BDAD6C0]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

