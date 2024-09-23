void sub_20A32AE84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32B248(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32B5F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32B8A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32C0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  uint64_t v18;

  _Block_object_dispose((const void *)(v18 - 240), 8);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A32C6A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32C994(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32CA00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id VGGetOEMApplicationLog()
{
  if (VGGetOEMApplicationLog_onceToken != -1)
    dispatch_once(&VGGetOEMApplicationLog_onceToken, &__block_literal_global_11_0);
  return (id)VGGetOEMApplicationLog_log;
}

id VGGetVirtualGarageLog()
{
  if (VGGetVirtualGarageLog_onceToken != -1)
    dispatch_once(&VGGetVirtualGarageLog_onceToken, &__block_literal_global_17_0);
  return (id)VGGetVirtualGarageLog_log;
}

id VGGetDataCoordinatorLog()
{
  if (VGGetDataCoordinatorLog_onceToken != -1)
    dispatch_once(&VGGetDataCoordinatorLog_onceToken, &__block_literal_global_9_0);
  return (id)VGGetDataCoordinatorLog_log;
}

void sub_20A32E074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A32E204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A32E58C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id VGGetPersistingLog()
{
  if (VGGetPersistingLog_onceToken != -1)
    dispatch_once(&VGGetPersistingLog_onceToken, &__block_literal_global_13);
  return (id)VGGetPersistingLog_log;
}

void sub_20A32F038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A32F458(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A32F81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A32F8E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSObject *VGAllowlistPayload()
{
  NSObject *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  GEOConfigGetString();
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3D010], "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataForResourceWithName:fallbackBundle:", v0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v15);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v15;
    if (v4)
    {
      VGGetVirtualGarageLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        v6 = "Error parsing manifest resource. error: %@";
LABEL_16:
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v3;
LABEL_18:

        goto LABEL_19;
      }
      VGGetVirtualGarageLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v3;
        v6 = "Unexpected class type for allowlist payload: %@";
        goto LABEL_16;
      }
    }

    v13 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BE3CF90], "sharedNetworkObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNetworkReachable");

  VGGetVirtualGarageLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v0;
      v10 = "data is nil. Error parsing manifest resource: %@ while network was reachable.";
      v11 = v4;
      v12 = OS_LOG_TYPE_FAULT;
LABEL_12:
      _os_log_impl(&dword_20A329000, v11, v12, v10, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v0;
    v10 = "data is nil. Error parsing manifest resource: %@ because network was not reachable.";
    v11 = v4;
    v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

id VGGetExternalAccessoryLog()
{
  if (VGGetExternalAccessoryLog_onceToken != -1)
    dispatch_once(&VGGetExternalAccessoryLog_onceToken, &__block_literal_global_5);
  return (id)VGGetExternalAccessoryLog_log;
}

uint64_t VGChargingNetworkStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t IsVirtualGarageEnabled()
{
  int IsEnabled_EVRouting;

  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  return IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta();
}

uint64_t IsEVRoutingSupported()
{
  void *v0;
  uint64_t v1;

  if (!GEOConfigGetBOOL())
    return 1;
  objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "currentCountrySupportsElectricVehicleRouting");

  return v1;
}

uint64_t IsEVRoutingAllowListingEnabled()
{
  return GEOConfigGetBOOL();
}

void startHostingVirtualGarageServiceWithPersister(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[VGVirtualGarageServer sharedServer](VGVirtualGarageServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startWithPersister:", v1);

}

void stopHostingVirtualGarageService()
{
  id v0;

  +[VGVirtualGarageServer sharedServer](VGVirtualGarageServer, "sharedServer");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stop");

}

__CFString *VGProcessNameForPID(int a1)
{
  int v1;
  __CFString *v2;
  size_t v4;
  int v5[2];
  int v6;
  int v7;
  _OWORD v8[40];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, 512);
  v4 = 648;
  *(_QWORD *)v5 = 0xE00000001;
  v6 = 1;
  v7 = a1;
  v1 = sysctl(v5, 4u, v8, &v4, 0, 0);
  v2 = 0;
  if (!v1)
    v2 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)&v8[15] + 3, 0x8000100u);
  return v2;
}

uint64_t GEOEvChargingConnectorTypeFromVGConnectorType(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;

  if (a1 > 31)
  {
    if (a1 == 256)
      v3 = 9;
    else
      v3 = 0;
    if (a1 == 128)
      v4 = 8;
    else
      v4 = v3;
    if (a1 == 64)
      v5 = 10;
    else
      v5 = 0;
    if (a1 == 32)
      v6 = 7;
    else
      v6 = v5;
    if (a1 <= 127)
      return v6;
    else
      return v4;
  }
  else
  {
    v1 = a1 - 1;
    result = 0;
    switch(v1)
    {
      case 0:
        result = 2;
        break;
      case 1:
        result = 4;
        break;
      case 2:
      case 4:
      case 5:
      case 6:
        return result;
      case 3:
        result = 5;
        break;
      case 7:
        result = 1;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

uint64_t VGVehiclesHaveMatchingVehicleStateProviders(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "iapIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  objc_msgSend(v4, "iapIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iapIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
LABEL_4:
    objc_msgSend(v3, "siriIntentsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "siriIntentsIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "siriIntentsIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqualToString:", v13);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

void sub_20A332660(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A33288C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A333474(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t VGVehicleStateStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 88;
          goto LABEL_68;
        case 2u:
          *(_WORD *)(a1 + 124) |= 8u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 32;
          goto LABEL_96;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_WORD *)(a1 + 124) |= 0x100u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            v29 = v28 + 1;
            if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_72:
          v57 = 96;
          goto LABEL_81;
        case 4u:
          *(_WORD *)(a1 + 124) |= 1u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 8;
          goto LABEL_96;
        case 5u:
          *(_WORD *)(a1 + 124) |= 4u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 24;
          goto LABEL_96;
        case 6u:
          *(_WORD *)(a1 + 124) |= 0x20u;
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 48;
          goto LABEL_96;
        case 7u:
          *(_WORD *)(a1 + 124) |= 0x40u;
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 56;
          goto LABEL_96;
        case 8u:
          *(_WORD *)(a1 + 124) |= 2u;
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 16;
          goto LABEL_96;
        case 9u:
          *(_WORD *)(a1 + 124) |= 0x10u;
          v41 = *v3;
          v42 = *(_QWORD *)(a2 + v41);
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v42 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v58 = 40;
LABEL_96:
          *(_QWORD *)(a1 + v58) = v23;
          continue;
        case 0xAu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 80;
          goto LABEL_68;
        case 0xBu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 72;
          goto LABEL_68;
        case 0xCu:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          *(_WORD *)(a1 + 124) |= 0x200u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                v15 = v44++ >= 9;
                if (v15)
                {
                  v45 = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v45 = 0;
LABEL_76:
          *(_BYTE *)(a1 + 120) = v45 != 0;
          continue;
        case 0xDu:
          v50 = 0;
          v51 = 0;
          v26 = 0;
          *(_WORD *)(a1 + 124) |= 0x80u;
          break;
        case 0xEu:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 112;
          goto LABEL_68;
        case 0xFu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 104;
LABEL_68:
          v56 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v52 = *v3;
        v53 = *(_QWORD *)(a2 + v52);
        v54 = v53 + 1;
        if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
        *(_QWORD *)(a2 + v52) = v54;
        v26 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_78;
        v50 += 7;
        v15 = v51++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_80;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_80:
      v57 = 64;
LABEL_81:
      *(_DWORD *)(a1 + v57) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
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

void sub_20A33700C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A339634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A33BEDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

CGColor *VGHexRepresentationFromCGColor(CGColor *a1)
{
  CGColor *v1;
  const CGFloat *Components;
  NSObject *v3;
  CGColorSpace *ColorSpace;
  NSObject *v5;
  unint64_t v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (a1)
  {
    v1 = a1;
    Components = CGColorGetComponents(a1);
    if (CGColorGetNumberOfComponents(v1) && CGColorGetNumberOfComponents(v1) <= 3)
    {
      VGGetUIHelperLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "Color does not have 4 components", buf, 2u);
      }

      ColorSpace = CGColorGetColorSpace(v1);
      if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
      {
        VGGetUIHelperLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "Color is not in RGB colorspace", v8, 2u);
        }

      }
      v7 = llround(*Components * 255.0);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02lX%02lX%02lX%02lX"), v7, v7, v7, llround(255.0));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02lX%02lX%02lX%02lX"), llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0), llround(Components[3] * 255.0));
    }
    a1 = (CGColor *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void sub_20A33EBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id VGDictionaryFromVGVehicleArguments(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    VGGetPersistingLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v1;
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_FAULT, "Failed to recreate a dictionary from serialized arguments: %@, with error: %@, dictionary: dictionary: %@", buf, 0x20u);
    }
LABEL_20:

    v11 = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "allKeys", 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            VGGetPersistingLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v21 = v1;
              v22 = 2112;
              v23 = v3;
              _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_FAULT, "Failed to recreate a dictionary from serialized arguments (wrong keys): %@, dictioanary: %@", buf, 0x16u);
            }

            goto LABEL_20;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    v11 = v3;
  }

  return v11;
}

id VGMap(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD, uint64_t);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), v9 + v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v9 += v11;
      }
      while (v8);
    }

    v13 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id VGFilter(void *a1, void *a2)
{
  id v3;
  unsigned int (**v4)(id, uint64_t, uint64_t, char *);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v15 = 0;
        if (v4[2](v4, v12, v9 + v11, &v15))
          objc_msgSend(v5, "addObject:", v12);
        if (v15)
          break;
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          v9 += v11;
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    v13 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v13;
}

id VGChargingConnectorTypeOptionsList()
{
  if (qword_253DA4238 != -1)
    dispatch_once(&qword_253DA4238, &__block_literal_global_3);
  return (id)_MergedGlobals_3;
}

id VGChargingConnectorTypeOptionsUnpacked(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  VGChargingConnectorTypeOptionsList();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "unsignedIntegerValue", (_QWORD)v10) & a1) != 0)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t VGChargingConnectorTypeOptionsPacked(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id NSStringFromVGChargingConnectorTypeOptions(uint64_t a1)
{
  id v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __NSStringFromVGChargingConnectorTypeOptions_block_invoke;
  v9[3] = &__block_descriptor_40_e18___NSString_16__0Q8l;
  v9[4] = a1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __NSStringFromVGChargingConnectorTypeOptions_block_invoke_30;
  v6[3] = &unk_24C2FB5E8;
  v8 = &v10;
  v2 = (id)MEMORY[0x20BD239CC](v9);
  v7 = v2;
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD239CC](v6);
  v3[2](v3, 1, a1);
  v3[2](v3, 2, a1);
  v3[2](v3, 4, a1);
  v3[2](v3, 8, a1);
  v3[2](v3, 16, a1);
  v3[2](v3, 32, a1);
  v3[2](v3, 64, a1);
  v3[2](v3, 128, a1);
  v3[2](v3, 256, a1);
  objc_msgSend((id)v11[5], "componentsJoinedByString:", CFSTR(" | "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_20A340FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

VGChargingNetworkStorage *VGChargingNetworkStorageFromVGChargingNetwork(void *a1)
{
  id v1;
  VGChargingNetworkStorage *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = objc_alloc_init(VGChargingNetworkStorage);
  -[VGChargingNetworkStorage setIdentifier:](v2, "setIdentifier:", objc_msgSend(v1, "globalBrandID"));
  objc_msgSend(v1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "copy");
  -[VGChargingNetworkStorage setName:](v2, "setName:", v4);

  return v2;
}

id VGGetAssertLog()
{
  if (VGGetAssertLog_onceToken != -1)
    dispatch_once(&VGGetAssertLog_onceToken, &__block_literal_global_5);
  return (id)VGGetAssertLog_log;
}

id VGGetChargingNetworksLog()
{
  if (VGGetChargingNetworksLog_onceToken != -1)
    dispatch_once(&VGGetChargingNetworksLog_onceToken, &__block_literal_global_3);
  return (id)VGGetChargingNetworksLog_log;
}

id VGGetExternalAccessoryModelFilterLog()
{
  if (VGGetExternalAccessoryModelFilterLog_onceToken != -1)
    dispatch_once(&VGGetExternalAccessoryModelFilterLog_onceToken, &__block_literal_global_7);
  return (id)VGGetExternalAccessoryModelFilterLog_log;
}

id VGGetUIHelperLog()
{
  if (VGGetUIHelperLog_onceToken != -1)
    dispatch_once(&VGGetUIHelperLog_onceToken, &__block_literal_global_15);
  return (id)VGGetUIHelperLog_log;
}

void sub_20A3459F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_20A345EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A345F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A346468(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A346904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A346B44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A346CD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A34718C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A3472FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A347474(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A347610(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A34774C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A347F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A3484E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  void *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_20A34876C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t VGChargingNetworksStorageReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  VGChargingNetworkStorage *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        a1[20] |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        a1[16] = v20 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(VGChargingNetworkStorage);
        objc_msgSend(a1, "addNetworks:", v17);
        if (!PBReaderPlaceMark() || (VGChargingNetworkStorageReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_20A34BD18(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20A34BFD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20A34C850(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20A34CB20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20A34D9AC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20A34DE98(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20A34E7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___connectorMapping_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD9838];
  v6[0] = *MEMORY[0x24BDD9860];
  v6[1] = v0;
  v7[0] = &unk_24C301E28;
  v7[1] = &unk_24C301E40;
  v1 = *MEMORY[0x24BDD9848];
  v6[2] = *MEMORY[0x24BDD9840];
  v6[3] = v1;
  v7[2] = &unk_24C301E58;
  v7[3] = &unk_24C301E70;
  v2 = *MEMORY[0x24BDD9858];
  v6[4] = *MEMORY[0x24BDD9850];
  v6[5] = v2;
  v7[4] = &unk_24C301E88;
  v7[5] = &unk_24C301EA0;
  v3 = *MEMORY[0x24BDD9870];
  v6[6] = *MEMORY[0x24BDD9878];
  v6[7] = v3;
  v7[6] = &unk_24C301EB8;
  v7[7] = &unk_24C301ED0;
  v6[8] = *MEMORY[0x24BDD9868];
  v7[8] = &unk_24C301EE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_253DA4248;
  qword_253DA4248 = v4;

}

void sub_20A34FA24(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_20A35011C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A350DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
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

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x24BE3C948]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x24BE3C968]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x24BE3C978]();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return MEMORY[0x24BE3C998]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x24BE3C9F8]();
}

uint64_t MapsFeature_IsEnabled_Alberta()
{
  return MEMORY[0x24BE3CB38]();
}

uint64_t MapsFeature_IsEnabled_EVRouting()
{
  return MEMORY[0x24BE3CB40]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return MEMORY[0x24BE3D148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x24BE3D198]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x24BE3D1A8]();
}

uint64_t geo_isolater_create_with_format()
{
  return MEMORY[0x24BE3D1B8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

