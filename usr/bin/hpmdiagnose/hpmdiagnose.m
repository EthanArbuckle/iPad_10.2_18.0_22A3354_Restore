uint64_t sub_100001B00(int a1, char *const *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *m;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  id v37;
  id v38;
  const char *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *n;
  void *v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  void *v50;
  uint64_t v51;
  int *v52;
  int v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *j;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *k;
  void *v64;
  id v65;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  int v91[16];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];

  v5 = a3;
  v6 = malloc_type_malloc(0x40uLL, 0x78C5A1BAuLL);
  if (!v6)
  {
    v25 = 3758097085;
    goto LABEL_76;
  }
  v7 = v6;
  v8 = 0;
  while (2)
  {
    v91[0] = 0;
    v9 = getopt_long(a1, a2, "VUPS", (const option *)&off_100021750, v91);
    switch(v9)
    {
      case 'P':
        v8 = 3;
        continue;
      case 'Q':
      case 'R':
      case 'T':
        goto LABEL_77;
      case 'S':
        v8 = 4;
        continue;
      case 'U':
        v8 = 2;
        continue;
      case 'V':
        v8 = 1;
        continue;
      default:
        if (!v9)
          continue;
        if (v9 != -1)
LABEL_77:
          exit(1);
        switch(v8)
        {
          case 1:
            v67 = v7;
            v68 = v5;
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v10 = v5;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v86;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v86 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userClient"));
                  v17 = objc_msgSend(v16, "routeString");

                  if (!v17)
                  {
                    v18 = objc_msgSend(v15, "address");
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userClient"));
                    v20 = objc_msgSend(v19, "routerID");
                    v21 = objc_msgSend(v15, "address");
                    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "readFullVersionWithConfig")));
                    v23 = objc_msgSend(v22, "UTF8String");
                    v24 = "R/D %d/0x%x = %s\n";
                    if (v18 < 0xA)
                      v24 = "R/D %d/%d = %s\n";
                    printf(v24, v20, v21, v23);

                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
              }
              while (v12);
            }

            goto LABEL_54;
          case 2:
            v67 = v7;
            v68 = v5;
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v26 = v5;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
            if (!v27)
              goto LABEL_39;
            v28 = v27;
            v29 = *(_QWORD *)v82;
            break;
          case 3:
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v54 = v5;
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
            if (!v55)
              goto LABEL_73;
            v56 = v55;
            v57 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v56; j = (char *)j + 1)
              {
                if (*(_QWORD *)v74 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
                putchar(10);
                v25 = (uint64_t)objc_msgSend(v59, "printAll");
                if (!(_DWORD)v25)
                  v25 = (uint64_t)objc_msgSend(v59, "printStateHistory");
              }
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
            }
            while (v56);
            goto LABEL_74;
          case 4:
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v54 = v5;
            v60 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
            if (v60)
            {
              v61 = v60;
              v62 = *(_QWORD *)v70;
              do
              {
                for (k = 0; k != v61; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v70 != v62)
                    objc_enumerationMutation(v54);
                  v64 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)k);
                  putchar(10);
                  v65 = objc_msgSend(v64, "printAll");
                }
                v25 = (uint64_t)v65;
                v61 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
              }
              while (v61);
            }
            else
            {
LABEL_73:
              v25 = 0;
            }
LABEL_74:

            goto LABEL_75;
          default:
            v25 = 0;
            goto LABEL_75;
        }
        break;
    }
    break;
  }
  do
  {
    for (m = 0; m != v28; m = (char *)m + 1)
    {
      if (*(_QWORD *)v82 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)m);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userClient"));
      if (!objc_msgSend(v32, "routeString"))
      {
        v33 = objc_msgSend(v31, "isSPIMaster");

        if (!v33)
          continue;
        v34 = objc_msgSend(v31, "address");
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userClient"));
        v35 = objc_msgSend(v32, "routerID");
        v36 = objc_msgSend(v31, "address");
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "readFullVersionWithConfig")));
        v38 = objc_msgSend(v37, "UTF8String");
        v39 = "R/D %d/0x%x = %s\n";
        if (v34 < 0xA)
          v39 = "R/D %d/%d = %s\n";
        printf(v39, v35, v36, v38);

      }
    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  }
  while (v28);
LABEL_39:

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v40 = v26;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v78;
    do
    {
      for (n = 0; n != v42; n = (char *)n + 1)
      {
        if (*(_QWORD *)v78 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)n);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "userClient"));
        if (objc_msgSend(v46, "routeString"))
        {

        }
        else
        {
          v47 = objc_msgSend(v45, "isSPIMaster");

          if (v47)
          {
            v48 = objc_msgSend(v45, "readUUIDIntoBuffer:ofLength:", v91, 64);
            if (v48)
            {
              v49 = v48;
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "userClient"));
              printf("UUID%d=", objc_msgSend(v50, "routerID"));

              v51 = v49;
              v52 = v91;
              do
              {
                v53 = *(unsigned __int8 *)v52;
                v52 = (int *)((char *)v52 + 1);
                printf("%02x", v53);
                --v51;
              }
              while (v51);
              putchar(32);
            }
          }
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    }
    while (v42);
  }

  putchar(10);
LABEL_54:
  v25 = 0;
  v7 = v67;
  v5 = v68;
LABEL_75:
  free(v7);
LABEL_76:

  return v25;
}

uint64_t start(int a1, char *const *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PDController knownPDControllers:](PDController, "knownPDControllers:", -1));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v6, "address");

  }
  if (a1 < 2)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
          putchar(10);
          objc_msgSend(v12, "printAll", (_QWORD)v14);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    sub_100001B00(a1, a2, v5);
  }

  objc_autoreleasePoolPop(v4);
  return 0;
}

id sub_100005B48(uint64_t a1, unsigned __int16 *a2)
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "decodeGeneralPolicyConfigWithData:", *a2));

  return v4;
}

NSString *__cdecl sub_100005B88(id a1, NSArray *a2)
{
  NSArray *v2;
  void *v3;
  unsigned int v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 0));
  v4 = objc_msgSend(v3, "unsignedShortValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 1));
  LODWORD(v2) = objc_msgSend(v5, "unsignedCharValue");

  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.3f %@"), (float)((float)((float)v4 * (float)v2) * 1500.0) / 1000.0 / 4095.0, CFSTR("V"));
}

id objc_msgSend_IECSAtomicCommand_cmdBuffer_dataBuffer_extDataBuffer_returnDataBuffer_returnExtDataBuffer_inputDataLength_returnDataBufferLength_timeoutInSeconds_forDevice_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:forDevice:flags:");
}

id objc_msgSend_PDControllerType1WithDeviceAddress_userClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PDControllerType1WithDeviceAddress:userClient:");
}

id objc_msgSend_PDControllerType3MicroWithDeviceAddress_userClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PDControllerType3MicroWithDeviceAddress:userClient:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_burstLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "burstLimit");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cached_sequence_num(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cached_sequence_num");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_chrisTracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chrisTracy:");
}

id objc_msgSend_commandMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandMap");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createUserClientForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createUserClientForService:");
}

id objc_msgSend_createWithDeviceAddress_userClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWithDeviceAddress:userClient:");
}

id objc_msgSend_createWithDeviceAddress_userClient_VID_DID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWithDeviceAddress:userClient:VID:DID:");
}

id objc_msgSend_decodeGeneralPolicyConfigWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeGeneralPolicyConfigWithData:");
}

id objc_msgSend_decodeSingleBit_title_arg0_arg1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeSingleBit:title:arg0:arg1:");
}

id objc_msgSend_destroyUserClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyUserClient");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_did(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "did");
}

id objc_msgSend_dpmrConfigs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dpmrConfigs");
}

id objc_msgSend_dpmrSubCommandFormatterHexDumpWithBuffer_length_inputBuffer_andInputLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dpmrSubCommandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:");
}

id objc_msgSend_executeIECSAtomicCommand_cmdBuffer_dataBuffer_extDataBuffer_returnDataBuffer_returnExtDataBuffer_inputDataLength_returnDataBufferLength_timeoutInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:");
}

id objc_msgSend_executeIECSCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeIECSCommand:");
}

id objc_msgSend_expanderGpioMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expanderGpioMap");
}

id objc_msgSend_expanderRegisterRead16_atOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expanderRegisterRead16:atOffset:");
}

id objc_msgSend_findUserClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findUserClients");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getCCRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCCRole:");
}

id objc_msgSend_getDeviceInfoNameWithConfigOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceInfoNameWithConfigOnly:");
}

id objc_msgSend_getPDMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPDMode:");
}

id objc_msgSend_getVDM_ofLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVDM:ofLength:");
}

id objc_msgSend_gpioMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gpioMap");
}

id objc_msgSend_i2cRead_ofLength_atAddress_andOutReadLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "i2cRead:ofLength:atAddress:andOutReadLength:");
}

id objc_msgSend_i2cWrite_ofLength_atAddress_andRead_ofLength_andOutReadLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "i2cWrite:ofLength:atAddress:andRead:ofLength:andOutReadLength:");
}

id objc_msgSend_iecsCommand_forDevice_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iecsCommand:forDevice:flags:");
}

id objc_msgSend_iecsReadCommandForDevice_withAddress_buffer_length_flags_andOutReadLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:");
}

id objc_msgSend_iecsWriteCommandForDevice_withAddress_buffer_length_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:");
}

id objc_msgSend_initWithAddress_userClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:userClient:");
}

id objc_msgSend_initWithAddress_userClient_VID_DID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:userClient:VID:DID:");
}

id objc_msgSend_isPDControllerType1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPDControllerType1:");
}

id objc_msgSend_isPDControllerType3HPM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPDControllerType3HPM:");
}

id objc_msgSend_isSPIMaster(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSPIMaster");
}

id objc_msgSend_isVCONNOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVCONNOn:");
}

id objc_msgSend_knownPDControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownPDControllers:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_majorVersionNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "majorVersionNumber");
}

id objc_msgSend_micro_user_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "micro_user_client");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSet");
}

id objc_msgSend_pdControllerForVID_DID_address_userClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pdControllerForVID:DID:address:userClient:");
}

id objc_msgSend_printAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printAll");
}

id objc_msgSend_printAllDPMrSubcommands(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printAllDPMrSubcommands");
}

id objc_msgSend_printCCRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCCRole");
}

id objc_msgSend_printCCState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCCState");
}

id objc_msgSend_printCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCommand:");
}

id objc_msgSend_printCommand_withTitle_andDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCommand:withTitle:andDescription:");
}

id objc_msgSend_printCommand_withTitle_andFormatter_andData_andLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCommand:withTitle:andFormatter:andData:andLength:");
}

id objc_msgSend_printCommand_withWriteData_withWriteLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCommand:withWriteData:withWriteLength:");
}

id objc_msgSend_printCommandDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printCommandDescription:");
}

id objc_msgSend_printDPMrSubCommand_withDeviceConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDPMrSubCommand:withDeviceConfig:");
}

id objc_msgSend_printDPMrSubCommand_withDeviceConfig_writeBuffer_writeLength_readBuffer_readLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:");
}

id objc_msgSend_printDPMrSubCommand_withTitle_andDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDPMrSubCommand:withTitle:andDescription:");
}

id objc_msgSend_printDXState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDXState");
}

id objc_msgSend_printExpanderGPIOState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printExpanderGPIOState");
}

id objc_msgSend_printGPIOState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printGPIOState");
}

id objc_msgSend_printGPIOWithPort_pin_title_andState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printGPIOWithPort:pin:title:andState:");
}

id objc_msgSend_printIECSPDControllerType1SpecificInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printIECSPDControllerType1SpecificInfo");
}

id objc_msgSend_printIECSPDControllerType3SpecificInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printIECSPDControllerType3SpecificInfo");
}

id objc_msgSend_printIECSStandardInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printIECSStandardInfo");
}

id objc_msgSend_printInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printInfo");
}

id objc_msgSend_printROMInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printROMInfo");
}

id objc_msgSend_printRegister_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printRegister:");
}

id objc_msgSend_printRegister_withTitle_andDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printRegister:withTitle:andDescription:");
}

id objc_msgSend_printRegister_withTitle_andFormatter_andData_andLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printRegister:withTitle:andFormatter:andData:andLength:");
}

id objc_msgSend_printRegisterDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printRegisterDescription:");
}

id objc_msgSend_printRegisterTitle_andDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printRegisterTitle:andDescription:");
}

id objc_msgSend_printSSState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printSSState");
}

id objc_msgSend_printStateHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printStateHistory");
}

id objc_msgSend_printStateWithTitle_andDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printStateWithTitle:andDescription:");
}

id objc_msgSend_printTBRrIfIntelRetimerPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printTBRrIfIntelRetimerPresent");
}

id objc_msgSend_printTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printTitle");
}

id objc_msgSend_printUSBCInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printUSBCInfo");
}

id objc_msgSend_printVBUSState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printVBUSState");
}

id objc_msgSend_printVCONNState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printVCONNState");
}

id objc_msgSend_printVDETState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printVDETState");
}

id objc_msgSend_readDirection_forExpanderGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirection:forExpanderGPIO:");
}

id objc_msgSend_readDirection_forGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDirection:forGPIO:");
}

id objc_msgSend_readFullVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFullVersion");
}

id objc_msgSend_readFullVersionWithConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFullVersionWithConfig");
}

id objc_msgSend_readIECSRegister_ofLength_atRegister_andOutReadLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readIECSRegister:ofLength:atRegister:andOutReadLength:");
}

id objc_msgSend_readInputLevel_forExpanderGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readInputLevel:forExpanderGPIO:");
}

id objc_msgSend_readLevel_forExpanderGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readLevel:forExpanderGPIO:");
}

id objc_msgSend_readLevel_forGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readLevel:forGPIO:");
}

id objc_msgSend_readOutputLevel_forExpanderGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readOutputLevel:forExpanderGPIO:");
}

id objc_msgSend_readUUIDIntoBuffer_ofLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readUUIDIntoBuffer:ofLength:");
}

id objc_msgSend_receiveVDMAttentionForDevice_buffer_length_flags_outSOP_outSequence_outLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveVDMAttentionForDevice:buffer:length:flags:outSOP:outSequence:outLength:");
}

id objc_msgSend_receiveVDMForDevice_buffer_length_flags_outSOP_outSequence_outLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveVDMForDevice:buffer:length:flags:outSOP:outSequence:outLength:");
}

id objc_msgSend_registerConfigs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerConfigs");
}

id objc_msgSend_registerFormatterGenericWithBuffer_andLength_andConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerFormatterGenericWithBuffer:andLength:andConfig:");
}

id objc_msgSend_registerFormatterHexDumpWithBuffer_andLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerFormatterHexDumpWithBuffer:andLength:");
}

id objc_msgSend_registerMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerMap");
}

id objc_msgSend_registerRead32_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRead32:atAddress:");
}

id objc_msgSend_registerRead8_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRead8:atAddress:");
}

id objc_msgSend_registerRead_ofLength_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRead:ofLength:atAddress:");
}

id objc_msgSend_registerRead_ofLength_atAddress_andOutReadLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRead:ofLength:atAddress:andOutReadLength:");
}

id objc_msgSend_registerReadRemote_ofLength_atAddress_andOutReadLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerReadRemote:ofLength:atAddress:andOutReadLength:");
}

id objc_msgSend_registerWrite32_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWrite32:atAddress:");
}

id objc_msgSend_registerWrite8_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWrite8:atAddress:");
}

id objc_msgSend_registerWrite_ofLength_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWrite:ofLength:atAddress:");
}

id objc_msgSend_registerWriteRemote_ofLength_atAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWriteRemote:ofLength:atAddress:");
}

id objc_msgSend_remote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remote");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_routeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeString");
}

id objc_msgSend_routerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routerID");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_sendVDM_ofLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendVDM:ofLength:");
}

id objc_msgSend_sendVDMForDevice_sop_buffer_length_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendVDMForDevice:sop:buffer:length:flags:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setCached_sequence_num_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCached_sequence_num:");
}

id objc_msgSend_setDPMrConfigs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDPMrConfigs");
}

id objc_msgSend_setDid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDid:");
}

id objc_msgSend_setDpmrConfigs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDpmrConfigs:");
}

id objc_msgSend_setMicro_user_client_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicro_user_client:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemote:");
}

id objc_msgSend_setRouteString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRouteString:");
}

id objc_msgSend_setRouterID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRouterID:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setUserClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserClient:");
}

id objc_msgSend_setUserClientSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserClientSet:");
}

id objc_msgSend_setVid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVid:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_stateStringForExpanderGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateStringForExpanderGPIO:");
}

id objc_msgSend_stateStringForGPIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateStringForGPIO:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForTitle_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForTitle:value:table:");
}

id objc_msgSend_stringForTitle_valueString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForTitle:valueString:");
}

id objc_msgSend_stringForValue_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForValue:table:");
}

id objc_msgSend_stringForValue_table_prefixString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForValue:table:prefixString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportsRemote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRemote");
}

id objc_msgSend_uint32ForRegistryEntry_andKey_outValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uint32ForRegistryEntry:andKey:outValue:");
}

id objc_msgSend_uint64ForRegistryEntry_andKey_outValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uint64ForRegistryEntry:andKey:outValue:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_userClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userClient");
}

id objc_msgSend_userClientSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userClientSet");
}

id objc_msgSend_vid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vid");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_writeIECSRegister_ofLength_atRegister_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeIECSRegister:ofLength:atRegister:");
}
