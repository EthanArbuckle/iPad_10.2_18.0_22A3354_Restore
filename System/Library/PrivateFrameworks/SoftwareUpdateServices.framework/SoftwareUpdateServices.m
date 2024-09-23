void SULogInfoForSubsystem(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SULogForSubsystem(a1, 2, a2, (uint64_t)&a9);
}

void SULogForSubsystem(void *a1, int a2, void *a3, uint64_t a4)
{
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = (objc_class *)MEMORY[0x24BDD17C8];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, a4);

  if (a2 == 3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      SULog_cold_2();
  }
  else if (a2 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      SULog_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_2128D9000, v7, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v11, 0xCu);
  }

}

id SULogFollowUp()
{
  if (SULogFollowUp___once != -1)
    dispatch_once(&SULogFollowUp___once, &__block_literal_global_7);
  return (id)SULogFollowUp___instance;
}

void sub_2128DDBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_2128DDD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128DDE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id buildPreManifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  CFTypeID TypeID;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFTypeID v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  CFTypeID v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CFTypeID v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CFTypeID v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v8 = AMAuthInstallCreate();
  if (v8)
  {
    v16 = (const void *)v8;
    if (AMAuthInstallApSetParameters())
    {
      SULogInfo(CFSTR("%s failed to set NULL AP parameters in amai: %d"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"buildPreManifest");
    }
    else
    {
      v24 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 8);
      if (v24)
      {
        v32 = (void *)v24;
        v33 = *MEMORY[0x24BEDA7D0];
        TypeID = CFNumberGetTypeID();
        if ((addMGProperty(v32, (uint64_t)CFSTR("ChipID"), v33, TypeID, v35, v36, v37, v38) & 1) == 0)
          goto LABEL_15;
        v46 = *MEMORY[0x24BEDA7C8];
        v47 = CFNumberGetTypeID();
        if ((addMGProperty(v32, (uint64_t)CFSTR("BoardId"), v46, v47, v48, v49, v50, v51) & 1) == 0)
          goto LABEL_15;
        v52 = *MEMORY[0x24BEDA7D8];
        v53 = CFNumberGetTypeID();
        if ((addMGProperty(v32, (uint64_t)CFSTR("UniqueChipID"), v52, v53, v54, v55, v56, v57) & 1) != 0
          && (v58 = *MEMORY[0x24BEDA7F8],
              v59 = CFNumberGetTypeID(),
              (addMGProperty(v32, (uint64_t)CFSTR("SigningFuse"), v58, v59, v60, v61, v62, v63) & 1) != 0)
          && (v64 = *MEMORY[0x24BEDA810],
              v65 = CFNumberGetTypeID(),
              (addMGProperty(v32, (uint64_t)CFSTR("CertificateSecurityMode"), v64, v65, v66, v67, v68, v69) & 1) != 0))
        {
          objc_msgSend(v32, "setObject:forKey:", &unk_24CE6DFE0, *MEMORY[0x24BEDA808]);
          if ((addImageDict(v32, a1, a2, (uint64_t)CFSTR("SEP"), v70, v71, v72, v73) & 1) != 0)
          {
            if ((addImageDict(v32, a3, a4, (uint64_t)CFSTR("RestoreSEP"), v77, v78, v79, v80) & 1) != 0)
            {
              if (AMAuthInstallApImg4LocalCreatePreManifest())
                SULogInfo(CFSTR("%s failed to create pre-manifest: %d"), v88, v89, v90, v91, v92, v93, v94, (uint64_t)"buildPreManifest");
            }
            else
            {
              SULogInfo(CFSTR("%s couldn't add 'RestoreSEP' image to request dict"), v81, v82, v83, v84, v85, v86, v87, (uint64_t)"buildPreManifest");
            }
          }
          else
          {
            SULogInfo(CFSTR("%s couldn't add 'SEP' image to request dict"), v74, v75, v76, v77, v78, v79, v80, (uint64_t)"buildPreManifest");
          }
        }
        else
        {
LABEL_15:
          SULogInfo(CFSTR("%s couldn't add '%@' property to request dict"), v39, v40, v41, v42, v43, v44, v45, (uint64_t)"buildPreManifest");
        }
      }
      else
      {
        SULogInfo(CFSTR("%s couldn't allocate request dict"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)"buildPreManifest");
      }
    }
    CFRelease(v16);
  }
  else
  {
    SULogInfo(CFSTR("%s couldn't instantiate AMAuthInstall"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)"buildPreManifest");
  }
  return 0;
}

uint64_t addMGProperty(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (!a1)
  {
    SULogInfo(CFSTR("%s dict can't be NULL"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"addMGProperty");
    return 0;
  }
  if (!a2)
  {
    SULogInfo(CFSTR("%s question can't be NULL"), 0, a3, a4, a5, a6, a7, a8, (uint64_t)"addMGProperty");
    return 0;
  }
  if (!a3)
  {
    SULogInfo(CFSTR("%s key can't be NULL"), a2, 0, a4, a5, a6, a7, a8, (uint64_t)"addMGProperty");
    return 0;
  }
  v11 = (const void *)MGCopyAnswer();
  if (v11)
  {
    v19 = v11;
    if (CFGetTypeID(v11) == a4)
      objc_msgSend(a1, "setObject:forKey:", v19, a3);
    else
      SULogInfo(CFSTR("%s failed to get MG answer: %@ - skipping"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)"addMGProperty");
    CFRelease(v19);
  }
  else
  {
    SULogInfo(CFSTR("%s failed to get MG answer: %@ - skipping"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)"addMGProperty");
  }
  return 1;
}

uint64_t addImageDict(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    SULogInfo(CFSTR("%s dict can't be NULL"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"addImageDict");
    return 0;
  }
  if (!a2)
  {
    SULogInfo(CFSTR("%s digest can't be NULL"), 0, a3, a4, a5, a6, a7, a8, (uint64_t)"addImageDict");
    return 0;
  }
  if (!a4)
  {
    SULogInfo(CFSTR("%s requestTag can't be NULL"), a2, a3, 0, a5, a6, a7, a8, (uint64_t)"addImageDict");
    return 0;
  }
  if (a3)
  {
    v10 = *MEMORY[0x24BEDA8B0];
    v25[0] = *MEMORY[0x24BEDA890];
    v25[1] = v10;
    v26[0] = a2;
    v26[1] = a3;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v26;
    v13 = v25;
    v14 = 2;
  }
  else
  {
    v23 = *MEMORY[0x24BEDA890];
    v24 = a2;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v24;
    v13 = &v23;
    v14 = 1;
  }
  v16 = objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
  if (!v16)
  {
    SULogInfo(CFSTR("%s couldn't create image dict for '%@'"), v15, 0, v17, v18, v19, v20, v21, (uint64_t)"addImageDict");
    return 0;
  }
  objc_msgSend(a1, "setObject:forKey:", v16, a4);
  return 1;
}

void sub_2128E3788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128E5550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128E5698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_2128E9828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2128EB290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2128EBBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128EC218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2128EC5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128EC6C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128EC838(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128EC9A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128ECB30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128ECD1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128ECEA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128ED024(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128ED19C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2128EDDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_2128EE434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128EEC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2128EF3B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2128EF97C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL useInternalPowerPolicies()
{
  void *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "customerPowerPolicies");

  if (!v1)
    return +[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal");
  SULogInfo(CFSTR("customerPowerPolicies is set, returning NO for useInternalPowerPolicies"), v2, v3, v4, v5, v6, v7, v8, v10);
  return 0;
}

BOOL isPluggedIntoPower()
{
  uint32_t v0;
  _BOOL8 result;
  uint64_t v2;
  int out_token;

  out_token = 0;
  v0 = notify_register_check("com.apple.springboard.pluggedin", &out_token);
  result = 0;
  if (!v0)
  {
    v2 = 0;
    notify_get_state(out_token, &v2);
    notify_cancel(out_token);
    return v2 == 1;
  }
  return result;
}

uint64_t connectedToCharger(_BYTE *a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const void *v11;
  const __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFArray *v20;
  CFIndex v21;
  const __CFString *v22;
  __CFString *v23;
  const __CFString *v24;
  const void *ValueAtIndex;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const __CFArray *v37;
  const void *v38;
  const __CFString *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  int v43;
  uint64_t v44;
  CFDictionaryRef v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  _BYTE *v80;
  void *v81;

  v2 = (const void *)IOPSCopyPowerSourcesByType();
  v10 = 0x24CE3A000;
  if (!v2)
  {
    SULogInfo(CFSTR("Failed to copy powerSources"), v3, v4, v5, v6, v7, v8, v9, v79);
LABEL_12:
    v44 = 0;
    goto LABEL_21;
  }
  v11 = v2;
  v12 = IOPSCopyPowerSourcesList(v2);
  if (!v12)
  {
    SULogInfo(CFSTR("Failed to copy powerSourcesList"), v13, v14, v15, v16, v17, v18, v19, v79);
    CFRelease(v11);
    goto LABEL_12;
  }
  v20 = v12;
  if (CFArrayGetCount(v12) < 1)
  {
    v44 = 0;
    goto LABEL_20;
  }
  v80 = a1;
  v21 = 0;
  v22 = CFSTR("Type");
  v23 = CFSTR("deviceType: %@");
  v24 = CFSTR("InternalBattery");
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v20, v21);
    IOPSGetPowerSourceDescription(v11, ValueAtIndex);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(v23, v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);
    if (!objc_msgSend(v27, "isEqualToString:", v24))
      goto LABEL_8;
    objc_msgSend(v26, "objectForKey:", CFSTR("Is Charging"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "BOOLValue"))
      break;
    objc_msgSend(v26, "objectForKey:", CFSTR("Show Charging UI"));
    v81 = v27;
    v36 = v26;
    v37 = v20;
    v38 = v11;
    v39 = v24;
    v40 = v23;
    v41 = v22;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "BOOLValue");

    v22 = v41;
    v23 = v40;
    v24 = v39;
    v11 = v38;
    v20 = v37;
    v26 = v36;
    v27 = v81;

    if (v43)
      goto LABEL_15;
LABEL_8:

    if (++v21 >= CFArrayGetCount(v20))
    {
      v44 = 0;
      goto LABEL_19;
    }
  }

LABEL_15:
  v45 = IOPSCopyExternalPowerAdapterDetails();
  -[__CFDictionary objectForKey:](v45, "objectForKey:", CFSTR("FamilyCode"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKey:](v45, "objectForKey:", CFSTR("IsWireless"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  stringForFamilyCode(objc_msgSend(v46, "intValue"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("device connected to charger. Family code: %@ Wireless: %@"), v49, v50, v51, v52, v53, v54, v55, (uint64_t)v48);

  if (v80)
  {
    *v80 = objc_msgSend(v47, "BOOLValue");
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "batteryOverrideWirelessCharging");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "batteryOverrideWirelessCharging");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *v80 = objc_msgSend(v59, "BOOLValue");

      SULogInfo(CFSTR("SUBatteryInfoOverrideWirelessCharging preference is set, setting wirelesslyCharging to %hhd"), v60, v61, v62, v63, v64, v65, v66, *v80);
    }
  }

  v44 = 1;
LABEL_19:
  v10 = 0x24CE3A000uLL;
LABEL_20:
  CFRelease(v11);
  CFRelease(v20);
LABEL_21:
  objc_msgSend(*(id *)(v10 + 2544), "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "batteryOverridePluggedIn");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(*(id *)(v10 + 2544), "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "batteryOverridePluggedIn");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v70, "BOOLValue");

    SULogInfo(CFSTR("SUBatteryInfoOverridePluggedIn preference is set, setting pluggedIn to %hhd"), v71, v72, v73, v74, v75, v76, v77, v44);
  }
  return v44;
}

__CFString *stringForFamilyCode(uint64_t a1)
{
  __CFString *v1;
  __CFString *result;

  if ((int)a1 > -536838145)
  {
    switch(a1)
    {
      case 0xE0024000:
        result = CFSTR("kIOPSFamilyCodeAC");
        break;
      case 0xE0024001:
        result = CFSTR("kIOPSFamilyCodeExternal");
        break;
      case 0xE0024002:
        result = CFSTR("kIOPSFamilyCodeExternal2");
        break;
      case 0xE0024003:
        result = CFSTR("kIOPSFamilyCodeExternal3");
        break;
      case 0xE0024004:
        result = CFSTR("kIOPSFamilyCodeExternal4");
        break;
      case 0xE0024005:
        result = CFSTR("kIOPSFamilyCodeExternal5");
        break;
      default:
        if ((_DWORD)a1 == -536838144)
        {
          result = CFSTR("kIOPSFamilyCodeFirewire");
        }
        else if ((_DWORD)a1)
        {
LABEL_29:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown IOPSFamilyCode: %d"), a1);
          v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
          result = v1;
        }
        else
        {
          result = CFSTR("kIOPSFamilyCodeDisconnected");
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 0xE0004000:
        v1 = CFSTR("kIOPSFamilyCodeUSBHost");
        goto LABEL_4;
      case 0xE0004001:
        result = CFSTR("kIOPSFamilyCodeUSBHostSuspended");
        break;
      case 0xE0004002:
        result = CFSTR("kIOPSFamilyCodeUSBDevice");
        break;
      case 0xE0004003:
        result = CFSTR("kIOPSFamilyCodeUSBAdapter");
        break;
      case 0xE0004004:
        result = CFSTR("kIOPSFamilyCodeUSBChargingPortDedicated");
        break;
      case 0xE0004005:
        result = CFSTR("kIOPSFamilyCodeUSBChargingPortDownstream");
        break;
      case 0xE0004006:
        result = CFSTR("kIOPSFamilyCodeUSBChargingPort");
        break;
      case 0xE0004007:
        result = CFSTR("kIOPSFamilyCodeUSBUnknown");
        break;
      case 0xE0004008:
        result = CFSTR("kIOPSFamilyCodeUSBCBrick");
        break;
      case 0xE0004009:
        result = CFSTR("kIOPSFamilyCodeUSBCTypeC");
        break;
      case 0xE000400A:
        result = CFSTR("kIOPSFamilyCodeUSBCPD");
        break;
      default:
        if ((_DWORD)a1 != -536870201)
          goto LABEL_29;
        result = CFSTR("kIOPSFamilyCodeUnsupported");
        break;
    }
  }
  return result;
}

id requiredBatteryLevelQueryStateDescription(char a1)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v2, "appendString:", CFSTR("{"));
  if ((a1 & 1) != 0)
    v3 = CFSTR("internal,");
  else
    v3 = CFSTR("external,");
  objc_msgSend(v2, "appendString:", v3);
  if ((a1 & 2) != 0)
    v4 = CFSTR("splat,");
  else
    v4 = CFSTR("non-splat,");
  objc_msgSend(v2, "appendString:", v4);
  if ((a1 & 4) != 0)
    v5 = CFSTR("charging,");
  else
    v5 = CFSTR("not-charging,");
  objc_msgSend(v2, "appendString:", v5);
  if ((a1 & 8) != 0)
    v6 = CFSTR("wireless,");
  else
    v6 = CFSTR("not-wireless,");
  objc_msgSend(v2, "appendString:", v6);
  if ((a1 & 0x10) != 0)
    v7 = CFSTR("auto");
  else
    v7 = CFSTR("manual");
  objc_msgSend(v2, "appendString:", v7);
  objc_msgSend(v2, "appendString:", CFSTR("}"));
  return v2;
}

id getCurrentBatteryLevel()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;

  v0 = (void *)MGCopyAnswer();
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "batteryLevelOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "batteryLevelOverride");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("%s: SUBatteryLevelOverride is set to %@, overriding battery level"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"NSNumber *getCurrentBatteryLevel(void)");

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "batteryLevelOverride");
    v19 = objc_claimAutoreleasedReturnValue();

    v0 = (void *)v19;
  }
  if (!v0)
  {
    SULogError(CFSTR("%s: failed to get battery level; returning 0"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      (uint64_t)"NSNumber *getCurrentBatteryLevel(void)");
    v0 = &unk_24CE6E028;
  }
  return v0;
}

uint64_t _requiredBatteryLevelToAutoDownload(void *a1, char a2, int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;

  v5 = a1;
  v13 = 0;
  if ((objc_msgSend(v5, "isEmergencyOrCritical") & 1) == 0 && (a2 & 1) == 0)
  {
    if (objc_msgSend(v5, "isSplatOnly"))
    {
      if (objc_msgSend(v5, "releasedBefore:", 86400.0))
        v13 = 50;
      else
        v13 = 999;
      goto LABEL_13;
    }
    if ((objc_msgSend(v5, "allowAutoDownloadOnBattery") & 1) != 0)
    {
      if (!a3)
      {
        v13 = 999;
        goto LABEL_13;
      }
LABEL_12:
      v13 = objc_msgSend(v5, "autoDownloadOnBatteryMinBattery");
      goto LABEL_13;
    }
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "overrideAllowAutoDownloadOnBattery");

    v13 = 999;
    if (v15 && (a3 & 1) != 0)
      goto LABEL_12;
  }
LABEL_13:
  SULogInfo(CFSTR("%s: %@: require %u%% battery"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"unsigned int _requiredBatteryLevelToAutoDownload(SUDescriptor *__strong _Nonnull, BOOL, BOOL)");

  return v13;
}

id SURequiredBatteryLevelForAutoDownloadForDescriptor(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v39;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = connectedToCharger(0);
  if (v4)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productBuildVersion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("fullyUnrampedDate = %@ for %@; timeElapsed = %.0lf sec (~ %.2lf days)"),
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    (uint64_t)v9);

  v17 = objc_msgSend(v3, "autoDownloadOnBatteryDelay");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "overrideAutoDownloadOnBatteryDelay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "overrideAutoDownloadOnBatteryDelay");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (double)(unint64_t)objc_msgSend(v28, "unsignedLongLongValue");

    SULogInfo(CFSTR("autoDownloadOnBatteryDelay is set to %.0lf sec by default"), v30, v31, v32, v33, v34, v35, v36, *(uint64_t *)&v29);
  }
  else
  {
    v29 = (double)v17 * 86400.0;
  }
  SULogInfo(CFSTR("autoDownloadOnBatteryDelay = %.0lf sec (~ %.2lf days)"), v20, v21, v22, v23, v24, v25, v26, *(uint64_t *)&v29);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", _requiredBatteryLevelToAutoDownload(v3, v6, v8 >= v29));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

BOOL SUHasEnoughBatteryForAutoDownloadForDescriptor(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = a1;
  getCurrentBatteryLevel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  SURequiredBatteryLevelForAutoDownloadForDescriptor(v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  SULogInfo(CFSTR("%s: currentBatteryLevel = %llu, requiredBatteryLevel = %llu"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)"BOOL SUHasEnoughBatteryForAutoDownloadForDescriptor(SUDescriptor *__strong _Nonnull, NSDate *__strong _Nonnull)");
  return v6 >= v8;
}

uint64_t SUHasEnoughBatteryForDownloadForDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(CFSTR("%s: Non-auto-downloading doesn't have any power requirements"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"BOOL SUHasEnoughBatteryForDownloadForDescriptor(SUDescriptor *__strong _Nonnull)");
  return 1;
}

void *SURequiredBatteryLevelForDownloadForDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(CFSTR("%s: Non-auto-downloading doesn't have any power requirements"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"NSNumber * _Nonnull SURequiredBatteryLevelForDownloadForDescriptor(SUDescriptor *__strong _Nonnull)");
  return &unk_24CE6E028;
}

float SURequiredBatteryLevelForInstall()
{
  return SURequiredBatteryLevelForInstallation(0, 0);
}

float SURequiredBatteryLevelForInstallForDescriptor(void *a1)
{
  return SURequiredBatteryLevelForInstallation(a1, 0);
}

float SURequiredBatteryLevelForInstallation(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  int v7;
  char v8;
  char v9;
  char v10;
  float v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (objc_msgSend(v3, "isSplatOnly"))
      v6 = 2;
    else
      v6 = 0;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if (!v4)
      goto LABEL_8;
  }
  if (objc_msgSend(v5, "automaticInstallation"))
    v6 |= 0x10u;
LABEL_8:
  v21 = 0;
  v7 = connectedToCharger(&v21);
  v8 = 12;
  if (!v21)
    v8 = 4;
  if (v7)
    v9 = v8;
  else
    v9 = 0;
  v10 = v6 | useInternalPowerPolicies() | v9;
  v11 = SURequiredBatteryLevelForInstallForState(v10);
  requiredBatteryLevelQueryStateDescription(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("state=%@, required battery level = %d%%"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  return v11;
}

float SURequiredBatteryLevelForInstallForState(char a1)
{
  float result;

  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0)
    {
      if ((a1 & 0x10) != 0)
        goto LABEL_4;
      return 0.2;
    }
    return flt_21297FB90[(a1 & 4) == 0];
  }
  if ((a1 & 2) != 0)
    return flt_21297FB90[(a1 & 4) == 0];
  if ((a1 & 0x10) == 0)
    return 0.2;
LABEL_4:
  result = flt_21297FB98[(a1 & 8) == 0];
  if ((a1 & 4) == 0)
    return 0.3;
  return result;
}

BOOL SUHasEnoughBatteryForInstall()
{
  return SUHasEnoughBatteryForInstallation(0, 0);
}

BOOL SUHasEnoughBatteryForInstallForDescriptor(void *a1)
{
  return SUHasEnoughBatteryForInstallation(a1, 0);
}

BOOL SUHasEnoughBatteryForInstallation(void *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;

  v2 = (uint64_t)(SURequiredBatteryLevelForInstallation(a1, a2) * 100.0);
  getCurrentBatteryLevel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");
  SULogInfo(CFSTR("Current battery level: %lld, minimumCharge:%lld"), v5, v6, v7, v8, v9, v10, v11, v4);
  v12 = 0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "longLongValue") >= v2)
      v12 = 1;
  }

  return v12;
}

void SULogDebug(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SULog(1, a1, (uint64_t)&a9);
}

void SULog(int a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, a3);

  if (a1 == 3)
  {
    SULogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      SULog_cold_2();
  }
  else if (a1 == 1)
  {
    SULogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      SULog_cold_1();
  }
  else
  {
    SULogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

void SULogInfo(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SULog(2, a1, (uint64_t)&a9);
}

void SULogError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SULog(3, a1, (uint64_t)&a9);
}

void SULogDebugForSubsystem(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SULogForSubsystem(a1, 1, a2, (uint64_t)&a9);
}

void SULogErrorForSubsystem(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SULogForSubsystem(a1, 3, a2, (uint64_t)&a9);
}

id SULogCommon()
{
  if (SULogCommon___once != -1)
    dispatch_once(&SULogCommon___once, &__block_literal_global_5);
  return (id)SULogCommon___instance;
}

id SULogInstallConstraints()
{
  if (SULogInstallConstraints___once != -1)
    dispatch_once(&SULogInstallConstraints___once, &__block_literal_global_3);
  return (id)SULogInstallConstraints___instance;
}

id SULogBadging()
{
  if (SULogBadging___once != -1)
    dispatch_once(&SULogBadging___once, &__block_literal_global_5);
  return (id)SULogBadging___instance;
}

id SULogAnalytics()
{
  if (SULogAnalytics___once != -1)
    dispatch_once(&SULogAnalytics___once, &__block_literal_global_9);
  return (id)SULogAnalytics___instance;
}

id SULogAlerts()
{
  if (SULogAlerts___once != -1)
    dispatch_once(&SULogAlerts___once, &__block_literal_global_11);
  return (id)SULogAlerts___instance;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2129034CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129040F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_21290563C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_212905990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212905AE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212905BD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212905D88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212905F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_212906178(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212906254(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

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

void sub_212919F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21291AE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21291CABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_212920534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212920B40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, __int128 a10)
{
  id v10;
  NSObject *v11;

  if (a2 == 1)
  {
    v10 = objc_begin_catch(exception_object);
    SULogInstallConstraints();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      a9 = 138412546;
      WORD2(a10) = 2112;
      *(_QWORD *)((char *)&a10 + 6) = v10;
      _os_log_impl(&dword_2128D9000, v11, OS_LOG_TYPE_DEFAULT, "%@ - exception caught: %@", (uint8_t *)&a9, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x212920B10);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_21292255C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

uint64_t SUDownloadPhaseIsFetchingAnything(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t IsFetchingBrain;

  v3 = a1;
  v4 = v3;
  if (a2 && (objc_msgSend(v3, "isEqualToString:", CFSTR("SUDownloadPhaseStarting")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("SUDownloadPhaseFetching")) & 1) != 0)
  {
    IsFetchingBrain = 1;
  }
  else
  {
    IsFetchingBrain = SUDownloadPhaseIsFetchingBrain(v4);
  }

  return IsFetchingBrain;
}

uint64_t SUDownloadPhaseIsFetchingUpdate(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("SUDownloadPhaseFetching"));
}

uint64_t SUDownloadPhaseIsFetchingBrain(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetching")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetchingStalled")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetchingQueuedLocal")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetchingQueuedRemote"));
  }

  return v2;
}

uint64_t SUDownloadPhaseIsAttemptingToFetchUpdate(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseFetching")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseStarting")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseFetching")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseFetchingStalled"));
  }

  return v2;
}

uint64_t SUDownloadPhaseStartedDownloadNotPrepared(void *a1)
{
  id v1;
  uint64_t Update;

  v1 = a1;
  if ((SUDownloadPhaseIsBrainRelated(v1) & 1) != 0)
    Update = 1;
  else
    Update = SUDownloadPhaseIsAttemptingToFetchUpdate(v1);

  return Update;
}

uint64_t SUDownloadPhaseIsBrainRelated(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((SUDownloadPhaseIsFetchingBrain(v1) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainVerifying")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainExtracting"));
  }

  return v2;
}

uint64_t SUDownloadPhaseIsBeyondBrainLoad(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((SUDownloadPhaseIsBrainRelated(v1) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseStarting")) ^ 1;

  return v2;
}

uint64_t SUDownloadPhaseIsUpdateDownloading(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseFetching")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseFetchingStalled"));

  return v2;
}

uint64_t SUDownloadPhaseIsHalted(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetchingQueuedLocal")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetchingQueuedRemote"));

  return v2;
}

uint64_t SUDownloadPhaseIsStalled(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseBrainFetchingStalled")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SUDownloadPhaseFetchingStalled"));

  return v2;
}

const __CFString *SUStringFromClientType(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Foreground");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("Background");
}

__CFString *SUStringFromMDMSUPath(unint64_t a1)
{
  if (a1 < 4)
    return off_24CE3CFC8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown SUMDMSoftwareUpdatePath value: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *SUStringFromDownloadPriority(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CE3CFE8[a1];
}

const __CFString *SUStringFromUpdateType(int a1)
{
  if ((a1 - 1) > 3)
    return CFSTR("Not Specified");
  else
    return off_24CE3D000[a1 - 1];
}

__CFString *SUStringFromUpdateTypes(void *a1)
{
  id v1;
  uint64_t v2;
  __CFString *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v3 = &stru_24CE3EA48;
  if (v2)
  {
    v4 = v2;
    LODWORD(v5) = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      v5 = (int)v5;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (void *)MEMORY[0x24BDD17C8];
          v10 = objc_msgSend(v8, "intValue") - 1;
          v11 = CFSTR("Not Specified");
          if (v10 <= 3)
            v11 = off_24CE3D000[v10];
          ++v5;
          v12 = objc_msgSend(v1, "count");
          v13 = CFSTR(", ");
          if (v12 <= v5)
            v13 = &stru_24CE3EA48;
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v11, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v3 = (__CFString *)v15;
        }
        else
        {
          ++v5;
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v3;
}

__CFString *SUStringFromOSUpdateType(uint64_t a1)
{
  __CFString *v1;

  if ((_DWORD)a1 == 1)
    return CFSTR("Splat");
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknonw OSUpdateType: %u"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("OS");
  }
  return v1;
}

const __CFString *SUStringFromAgreementStatus(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown Status");
  else
    return off_24CE3D020[a1];
}

const __CFString *SUStringFromNetworkType(unsigned int a1)
{
  if (a1 > 9)
    return CFSTR("Unknown");
  else
    return off_24CE3D038[a1];
}

id SUStringFromInstallationConstraints(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  uint8x8_t v4;
  int v5;
  unint64_t v6;
  id v7;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  _QWORD v13[6];
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  char v22;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12;
  v20 = __Block_byref_object_dispose__12;
  v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __SUStringFromInstallationConstraints_block_invoke;
  v13[3] = &unk_24CE3CF80;
  v13[4] = &v16;
  v13[5] = v14;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v10 = __SUStringFromInstallationConstraints_block_invoke_2;
  v11 = &unk_24CE3CFA8;
  v2 = (id)MEMORY[0x212BF6094](v13);
  v12 = v2;
  v3 = v9;
  if (a1)
  {
    v22 = 0;
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.i32[0];
    if (v4.i32[0])
    {
      v6 = 0;
      do
      {
        if (((1 << v6) & a1) != 0)
        {
          ((void (*)(_QWORD *))v10)(v3);
          if (v22)
            break;
          --v5;
        }
        if (v6 > 0x3E)
          break;
        ++v6;
      }
      while (v5 > 0);
    }
  }

  v7 = (id)v17[5];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

void sub_212929248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

__CFString *SUStringFromDownloadPolicyType(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24CE3D088[a1];
}

__CFString *SUStringFromActivationMessageType(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CE3D0B0[a1];
}

const __CFString *SUStringFromAudienceType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_24CE3D0C8[a1];
}

const __CFString *SUStringFromPreferredUpdateType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_24CE3D0E0[a1];
}

const __CFString *SUStringFromVersionUpgradeType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_24CE3D0F8[a1];
}

__CFString *SUStringFromRollbackSuggestionReasonType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CE3D110[a1];
}

__CFString *SUStringFromSUScanTaskType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24CE3D128[a1];
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

void sub_21292C6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_21293161C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_212931BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21293285C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24CE3D3E0;
    v5 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SetupAssistantLibraryCore_frameworkLibrary)
    __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)SetupAssistantLibraryCore_frameworkLibrary, "BYSetupAssistantBundleIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantBundleIdentifierSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __softwareUpdateDaemonStarted(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  SULogDebug(CFSTR("softwareupdateservicesd launch detected."), (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_connectToServerIfNecessary, 0, 0);
}

void sub_212933070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_212936C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_212936F4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212937958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_212937E18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212938088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2129387F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_212938AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_212938D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_212939000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_212939264(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293948C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2129396B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293A574(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293C9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21293CC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21293CEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21293D1C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293D3D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293DDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21293E1C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293E548(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293E73C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21293F3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21293F5C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21294080C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212940898(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294091C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2129409B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_212940C28(_Unwind_Exception *a1)
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

void sub_212942BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129433F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212943538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212943678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129437B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129438F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212943B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212943C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212943E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212944080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_2129448DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212944A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212946230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212946594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212946820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212946950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212946C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129470D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212947210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129473A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129474E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212947648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129477A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129478E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212947B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212947FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21294816C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _eventIsBlacklisted(void *a1)
{
  id v1;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = objc_msgSend(&unk_24CE6E330, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(&unk_24CE6E330);
        if (objc_msgSend(v1, "containsString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v5)))
        {
          SULogInfo(CFSTR("Alarm %@ is on AutoInstall alarm blacklist. Ignoring alarm"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v1);
          v13 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_24CE6E330, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

void sub_21294A164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t purgeableAssetSpaceAvailableForOTAUpdate()
{
  uint64_t v0;

  v0 = purgeableAssetSpaceAvailable(&unk_24CE6E348);
  return purgeableAssetSpaceAvailableV2(&unk_24CE6E348) + v0;
}

void sub_21294A754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void purgeAssets(void *a1, int a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _QWORD *v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = a1;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  v5 = 0;
  if (v42)
  {
    v6 = *(_QWORD *)v51;
    v39 = a3;
    v40 = *(_QWORD *)v51;
    v38 = a2;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v51 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v49 = v5;
        _queryLocalAssetsForType(v8, a2, &v49);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v49;

        if (v10)
        {
          v43 = v9;
          SULogDebug(CFSTR("%@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
          if (a3 && !*a3)
          {
            v10 = objc_retainAutorelease(v10);
            v5 = 0;
            *a3 = v10;
          }
          else
          {
            v5 = 0;
          }
        }
        else
        {
          if (!v9)
          {
            v5 = 0;
            goto LABEL_28;
          }
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v43 = v9;
          v10 = v9;
          v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          if (v18)
          {
            v19 = v18;
            v5 = 0;
            v20 = *(_QWORD *)v46;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v46 != v20)
                  objc_enumerationMutation(v10);
                v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
                if (objc_msgSend(v22, "state") == 1)
                {
                  SULogDebug(CFSTR("Deleting %@ from MAV1 path\n"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v8);
                  v44 = v5;
                  objc_msgSend(v22, "purgeAndReturnError:", &v44);
                  v30 = v44;

                  if (v30)
                  {
                    SULogDebug(CFSTR("%@"), v31, v32, v33, v34, v35, v36, v37, (uint64_t)v30);
                    v5 = v30;
                  }
                  else
                  {
                    v5 = 0;
                  }
                }
              }
              v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
            }
            while (v19);
            a3 = v39;
            a2 = v38;
          }
          else
          {
            v5 = 0;
          }
          v6 = v40;
        }

        v9 = v43;
LABEL_28:

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v42);
  }

}

id queryLocalAssetsForTypeV2(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v3 = a1;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", v3);
    objc_msgSend(v4, "returnTypes:", 1);
    v5 = objc_msgSend(v4, "queryMetaDataSync");
    if (v5)
    {
      SULogInfo(CFSTR("failed to query metadata: %ld"), v6, v7, v8, v9, v10, v11, v12, v5);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 58, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v4, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    if (v13)
    {
      SULogDebug(CFSTR("queryAssetsForType(%@) - error %@\n"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v3);
      v23 = 0;
LABEL_9:

      goto LABEL_10;
    }
    if (v14)
    {
      objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_421);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      goto LABEL_9;
    }
    v23 = 0;
    v13 = 0;
  }
  else
  {
    v23 = 0;
    v13 = 0;
    v4 = 0;
  }
LABEL_10:
  if (a2)
    *a2 = objc_retainAutorelease(v13);
  v24 = v23;

  return v24;
}

uint64_t __queryLocalAssetsForTypeV2_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE66AB8];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE66AB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v9, "compare:", v8);
        goto LABEL_10;
      }
LABEL_12:
      v7 = 0;
    }
  }
LABEL_10:

  return v7;
}

id queryLocalAssetsForType(void *a1, _QWORD *a2)
{
  return _queryLocalAssetsForType(a1, 0, a2);
}

id _queryLocalAssetsForType(void *a1, int a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v5 = a1;
  if (!v5)
  {
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66B88]), "initWithAssetType:", v5);
  objc_msgSend(v6, "setQueriesLocalAssetInformationOnly:", 1);
  if (a2)
  {
    v7 = (void *)MGCopyAnswer();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN %K OR %K == NULL"), v7, CFSTR("SupportedDeviceModels"), CFSTR("SupportedDeviceModels"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v8);

    }
  }
  v22 = 0;
  objc_msgSend(v6, "runQueryAndReturnError:", &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  if (v10)
  {
    v18 = v10;
    SULogDebug(CFSTR("queryAssetsForType(%@) - error %@\n"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v5);
    v19 = 0;
    goto LABEL_10;
  }
  if (!v9)
  {
LABEL_14:
    v18 = 0;
    v19 = 0;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_427);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
LABEL_10:

  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v18);
LABEL_12:
  v20 = v19;

  return v20;
}

uint64_t ___queryLocalAssetsForType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BE66AB8];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE66AB8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "compare:", v12);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

uint64_t purgeableAssetSpaceAvailable(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v41;
      v7 = *MEMORY[0x24BE66AB8];
      v30 = *(_QWORD *)v41;
      v31 = v2;
      while (1)
      {
        v8 = 0;
        v32 = v4;
        do
        {
          if (*(_QWORD *)v41 != v6)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
          v39 = 0;
          _queryLocalAssetsForType(v9, 0, &v39);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v39;
          if (v11)
          {
            v12 = v11;
          }
          else
          {
            if (!v10)
              goto LABEL_22;
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v34 = v10;
            v12 = v10;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            if (v13)
            {
              v14 = v13;
              v33 = v8;
              v15 = *(_QWORD *)v36;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v36 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                  if (objc_msgSend(v17, "state") == 1)
                  {
                    objc_msgSend(v17, "attributes");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectForKeyedSubscript:", v7);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "unsignedLongLongValue");
                    SULogDebug(CFSTR("%@: %llu\n"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v9);

                    objc_msgSend(v17, "attributes");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "objectForKeyedSubscript:", v7);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v5 += objc_msgSend(v28, "unsignedLongLongValue");

                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
              }
              while (v14);
              v6 = v30;
              v2 = v31;
              v4 = v32;
              v8 = v33;
            }
            v10 = v34;
          }

LABEL_22:
          ++v8;
        }
        while (v8 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (!v4)
          goto LABEL_26;
      }
    }
  }
  v5 = 0;
LABEL_26:

  return v5;
}

uint64_t purgeableAssetSpaceAvailableV2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v43;
      v7 = *MEMORY[0x24BE66AB8];
      v32 = *(_QWORD *)v43;
      v33 = v2;
      while (1)
      {
        v8 = 0;
        v34 = v4;
        do
        {
          if (*(_QWORD *)v43 != v6)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
          v41 = 0;
          queryLocalAssetsForTypeV2(v9, &v41);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v41;
          if (v11)
          {
            v12 = v11;
          }
          else
          {
            if (!v10)
              goto LABEL_23;
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v36 = v10;
            v12 = v10;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (v13)
            {
              v14 = v13;
              v35 = v8;
              v15 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v38 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                  if (objc_msgSend(v17, "wasPurgeable"))
                  {
                    objc_msgSend(v17, "attributes");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectForKeyedSubscript:", v7);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v19)
                    {
                      objc_msgSend(v17, "attributes");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "objectForKeyedSubscript:", v7);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "unsignedLongLongValue");
                      SULogDebug(CFSTR("%@: %llu\n"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)v9);

                      objc_msgSend(v17, "attributes");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "objectForKeyedSubscript:", v7);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v5 += objc_msgSend(v30, "unsignedLongLongValue");

                    }
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
              }
              while (v14);
              v6 = v32;
              v2 = v33;
              v4 = v34;
              v8 = v35;
            }
            v10 = v36;
          }

LABEL_23:
          ++v8;
        }
        while (v8 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (!v4)
          goto LABEL_27;
      }
    }
  }
  v5 = 0;
LABEL_27:

  return v5;
}

unint64_t purgeAssetSpace(void *a1, unint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (v5 && a2)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v11)
    {
      v12 = v11;
      v9 = 0;
      v13 = *(_QWORD *)v58;
      v50 = *MEMORY[0x24BE66AB8];
      v45 = v10;
      v46 = v5;
      v42 = *(_QWORD *)v58;
      v43 = a3;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v58 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v56 = 0;
          _queryLocalAssetsForType(v15, 0, &v56);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v56;
          if (v17)
          {
            v18 = v17;
            v48 = v16;
            if (a3 && !*a3)
            {
              v18 = objc_retainAutorelease(v17);
              *a3 = v18;
            }
            goto LABEL_28;
          }
          if (v16)
          {
            v47 = i;
            v48 = v16;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v18 = v16;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (!v19)
              goto LABEL_27;
            v20 = v19;
            v44 = v12;
            v21 = *(_QWORD *)v53;
LABEL_15:
            v22 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v22);
              if (objc_msgSend(v23, "state") == 1)
              {
                v24 = v9;
                v25 = a2;
                objc_msgSend(v23, "attributes");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v50);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "unsignedLongLongValue");

                if (v28)
                {
                  SULogDebug(CFSTR("Deleting %llu (%@)\n"), v29, v30, v31, v32, v33, v34, v35, v28);
                  v51 = 0;
                  objc_msgSend(v23, "purgeAndReturnError:", &v51);
                  v36 = v51;
                  if (v36)
                  {
                    v6 = v36;
                    v9 = v24;
                    goto LABEL_33;
                  }
                  a2 = v25;
                  objc_msgSend(v23, "attributes");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "addObject:", v37);

                  v9 = v28 + v24;
                }
                else
                {
                  a2 = v25;
                  v9 = v24;
                }
                if (v9 >= a2)
                {
                  v6 = 0;
LABEL_33:

                  v7 = 0;
                  v8 = 0;
                  v5 = v46;
                  goto LABEL_40;
                }
              }
              if (v20 == ++v22)
              {
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
                if (v20)
                  goto LABEL_15;
                v13 = v42;
                a3 = v43;
                v12 = v44;
                v10 = v45;
LABEL_27:
                i = v47;
LABEL_28:

                v16 = v48;
                break;
              }
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        v5 = v46;
      }
      while (v12);
    }
    else
    {
      v9 = 0;
    }

    +[SUUtility systemContainerURL](SUUtility, "systemContainerURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v38;
    if (v38)
    {
      v39 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v38, "path");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("%@%@"), v40, CFSTR("/Library/SoftwareUpdate/deletedAssets.plist"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        writeArrayToFile(v49, v7);
      v6 = 0;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
  }
LABEL_40:

  return v9;
}

void writeArrayToFile(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "arrayWithContentsOfFile:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v5);

  LOBYTE(v5) = objc_msgSend(v14, "writeToFile:atomically:", v4, 1);
  if ((v5 & 1) == 0)
    SULogInfo(CFSTR("Failed to write deleted asset plist to disk"), v6, v7, v8, v9, v10, v11, v12, v13);

}

unint64_t purgeAssetSpaceV2(void *a1, unint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = v5;
  v51 = 0;
  if (v5 && a2)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (!v8)
    {
      v51 = 0;
      goto LABEL_38;
    }
    v9 = v8;
    v51 = 0;
    v10 = *(_QWORD *)v58;
    v50 = *MEMORY[0x24BE66AB8];
    v46 = v7;
    v47 = v6;
    v43 = *(_QWORD *)v58;
    v44 = a3;
    while (1)
    {
      v11 = 0;
      v45 = v9;
      do
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(v7);
        v49 = v11;
        v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v11);
        v56 = 0;
        queryLocalAssetsForTypeV2(v12, &v56);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v56;
        if (v14)
        {
          v15 = v14;
          v48 = v13;
          if (a3)
          {
            v16 = v49;
            if (!*a3)
            {
              v15 = objc_retainAutorelease(v14);
              *a3 = v15;
            }
            goto LABEL_30;
          }
LABEL_29:
          v16 = v49;
LABEL_30:

          v13 = v48;
          goto LABEL_31;
        }
        if (v13)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v48 = v13;
          v15 = v13;
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v53;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v53 != v19)
                  objc_enumerationMutation(v15);
                v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                if (objc_msgSend(v21, "wasPurgeable"))
                {
                  v22 = a2;
                  objc_msgSend(v21, "attributes");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKeyedSubscript:", v50);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "unsignedLongLongValue");

                  if (v25)
                  {
                    SULogDebug(CFSTR("Deleting %llu (%@)\n"), v26, v27, v28, v29, v30, v31, v32, v25);
                    if (objc_msgSend(v21, "purgeSync"))
                    {
                      objc_msgSend(v21, "assetId");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      SULogDebug(CFSTR("Failed to delete asset (%@) assetID: %@\n"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)v12);

                    }
                    else
                    {
                      v51 += v25;
                    }
                  }
                  if (v51 >= v22)
                  {

                    v7 = v46;
                    v6 = v47;
                    goto LABEL_38;
                  }
                  a2 = v22;
                }
              }
              v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
              if (v18)
                continue;
              break;
            }
            v7 = v46;
            v6 = v47;
            v10 = v43;
            a3 = v44;
          }
          v9 = v45;
          goto LABEL_29;
        }
        v16 = v49;
LABEL_31:

        v11 = v16 + 1;
      }
      while (v11 != v9);
      v40 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      v9 = v40;
      if (!v40)
      {
LABEL_38:

        break;
      }
    }
  }

  return v51;
}

unint64_t purgeAssetSpaceForOTAUpdate(unint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = purgeAssetSpace(&unk_24CE6E360, a1, a2);
  if ((uint64_t)(a1 - v4) < 1)
    v5 = 0;
  else
    v5 = purgeAssetSpaceV2(&unk_24CE6E360, a1 - v4, a2);
  return v5 + v4;
}

id specificTimeOnDate(void *a1, int a2, int a3, int a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x24BDBCE48];
  v8 = a1;
  objc_msgSend(v7, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 2097180, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setHour:", a2);
  objc_msgSend(v10, "setMinute:", a3);
  objc_msgSend(v10, "setSecond:", a4);
  objc_msgSend(v9, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_21294D158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D1BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D214(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D26C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D2CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D340(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D3B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D414(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D474(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D4D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D52C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D58C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D5E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D644(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D69C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D6FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D7AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21294D9A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212955504(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_212955740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212955820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2129559E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_212955AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212955BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212955DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212955F00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_212956064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_21295CFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_21295D358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
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

const __CFString *SUStringForAutoInstallForecastScheduleType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_24CE3E320[a1 - 1];
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_21296D404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SUPreferencesChanged(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD block[7];

  SULogInfo(CFSTR("%s: Got SUPreferencesChangedNotification"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"void __SUPreferencesChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ____SUPreferencesChanged_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a2;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void SULog_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2128D9000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SULog_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2128D9000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SetupAssistantLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUScanner.m"), 44, CFSTR("%s"), *a1);

  __break(1u);
  AMAuthInstallApImg4LocalCreatePreManifest();
}

uint64_t AMAuthInstallApImg4LocalCreatePreManifest()
{
  return MEMORY[0x24BEDA6A8]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x24BEDA6B8]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x24BEDA6C8]();
}

uint64_t AMAuthInstallRequestAbbreviatedSendSync()
{
  return MEMORY[0x24BEDA6D8]();
}

uint64_t AMAuthInstallSupportDictionarySetBoolean()
{
  return MEMORY[0x24BEDA710]();
}

uint64_t AMAuthInstallSupportDictionarySetInteger32()
{
  return MEMORY[0x24BEDA718]();
}

uint64_t ASServerURLForAssetType()
{
  return MEMORY[0x24BE66B28]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x24BE0BB38]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x24BE0BB48]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
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

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x24BDBBB80](calendar, at, options, componentDesc);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x24BDBBD28](theDate, otherDate, context);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC940](userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return MEMORY[0x24BDBC958](userNotification, flags, dictionary, timeout);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x24BE04658]();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return MEMORY[0x24BE04660]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x24BDC25B8]();
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x24BE12310]();
}

uint64_t CacheDeleteSetCacheable()
{
  return MEMORY[0x24BE12328]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x24BDD8770]();
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x24BDD87D0]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x24BDD87D8]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x24BDD87F0](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x24BDD8828](blob, ps);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

uint64_t MAGetPallasAudience()
{
  return MEMORY[0x24BE66B48]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MKBDeviceLockAssertion()
{
  return MEMORY[0x24BE67128]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t MKBKeyBagKeyStashCreateWithManifest()
{
  return MEMORY[0x24BE67190]();
}

uint64_t MKBKeyBagKeyStashCreateWithMode()
{
  return MEMORY[0x24BE67198]();
}

uint64_t MKBKeyBagKeyStashCreateWithOpts()
{
  return MEMORY[0x24BE671A0]();
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return MEMORY[0x24BE671A8]();
}

uint64_t MKBKeyBagKeyStashVerify()
{
  return MEMORY[0x24BE671B0]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x24BE65168]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x24BE65270]();
}

uint64_t MSUAssetCalculateApplySize()
{
  return MEMORY[0x24BE67250]();
}

uint64_t MSUAssetCalculatePrepareSize()
{
  return MEMORY[0x24BE67258]();
}

uint64_t MSUPurgeSuspendedUpdate()
{
  return MEMORY[0x24BE67260]();
}

uint64_t NEHelperSettingsSetArray()
{
  return MEMORY[0x24BDAC4A0]();
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t RVGetNeRDInfo()
{
  return MEMORY[0x24BE67270]();
}

uint64_t RVTriggerNeRDUpdate()
{
  return MEMORY[0x24BE67278]();
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x24BEB0CF8]();
}

uint64_t SUCoreBorder_MSUBrainIsLoadable()
{
  return MEMORY[0x24BEAE888]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x24BE67A40]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x24BE67B50]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x24BDADBB0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE010](label);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
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

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x24BDE17E8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x24BDE1818]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1828]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x24BDE1848]();
}

uint64_t nw_path_evaluator_start()
{
  return MEMORY[0x24BDE1858]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x24BDE19A0](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x24BDE19C8](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
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

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x24BDB0438]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

uint64_t xpc_activity_copy_identifier()
{
  return MEMORY[0x24BDB05D8]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

