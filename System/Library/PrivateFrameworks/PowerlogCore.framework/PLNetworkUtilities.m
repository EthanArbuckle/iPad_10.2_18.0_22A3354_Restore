@implementation PLNetworkUtilities

+ (id)sockaddrToNSDictionary:(const char *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v9[4];
  __int16 v10;
  char v11[16];
  __int128 v12;
  _BYTE v13[25];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  *(_OWORD *)v11 = 0u;
  v10 = 0;
  *(_DWORD *)v9 = 0;
  v4 = (void *)objc_opt_new();
  if (getnameinfo((const sockaddr *)a3, *(unsigned __int8 *)a3, v11, 0x39u, v9, 6u, 10))
  {
    v5 = 0;
  }
  else
  {
    v13[24] = 0;
    HIBYTE(v10) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("address"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("port"));

    v5 = v4;
  }

  return v5;
}

+ (id)interfaceNameForIndex:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  char v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (interfaceNameForIndex__onceToken != -1)
    dispatch_once(&interfaceNameForIndex__onceToken, &__block_literal_global_40);
  v4 = (id)interfaceNameForIndex___interfaceNames;
  objc_sync_enter(v4);
  objc_msgSend((id)interfaceNameForIndex___interfaceNames, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8[0] = 0;
    if (if_indextoname(objc_msgSend(v3, "unsignedIntValue"), v8) && v8[0])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown%@"), v3);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v6;
    objc_msgSend((id)interfaceNameForIndex___interfaceNames, "setObject:forKeyedSubscript:", v6, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

void __44__PLNetworkUtilities_interfaceNameForIndex___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)interfaceNameForIndex___interfaceNames;
  interfaceNameForIndex___interfaceNames = v0;

}

+ (id)stringFromTrafficClass:(unsigned int)a3
{
  if ((int)a3 > 499)
  {
    if ((int)a3 <= 699)
    {
      if (a3 == 500)
        return CFSTR("AV:Multimedia_Audio/Video_Streaming");
      if (a3 == 600)
        return CFSTR("RV:Responsive_Multimedia_Audio/Video");
    }
    else
    {
      switch(a3)
      {
        case 0x2BCu:
          return CFSTR("VI:Interactive_Video");
        case 0x320u:
          return CFSTR("VO:Interactive_Voice");
        case 0x384u:
          return CFSTR("CTL:Network_Control");
      }
    }
  }
  else if ((int)a3 <= 199)
  {
    if (!a3)
      return CFSTR("BE:Best_Effort");
    if (a3 == 100)
      return CFSTR("BK_SYS:Background_System-Initiated");
  }
  else
  {
    switch(a3)
    {
      case 0xC8u:
        return CFSTR("BK:Background");
      case 0x12Cu:
        return CFSTR("RD:Responsive_Data");
      case 0x190u:
        return CFSTR("OAM:Operations_Administration_and_Management");
    }
  }
  return CFSTR("unknown?");
}

+ (id)decodeEtherType:(unsigned __int16)a3
{
  __CFString *v3;

  if ((int)a3 <= 2113)
  {
    if (a3 == 2048)
      return CFSTR("IPv4");
    if (a3 == 2054)
      return CFSTR("ARP");
    goto LABEL_14;
  }
  if (a3 == 2114)
    return CFSTR("Wake-on-LAN");
  if (a3 == 34525)
    return CFSTR("IPv6");
  if (a3 != 34824)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("other(%d)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("MAC_Control");
  return v3;
}

+ (id)getNetworkWakeInfo:(kern_event_msg *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  _QWORD v47[5];
  _QWORD block[5];
  char out[48];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a3->event_data, out);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
  v6 = objc_claimAutoreleasedReturnValue();
  if ((a3[1].event_data[0] & 2) != 0)
    v7 = 30;
  else
    v7 = 2;
  objc_msgSend(a1, "getIPAddress:withAddressFamily:", &a3[5].kev_class, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getIPAddress:withAddressFamily:", &a3[4].event_code, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "getInterfaceType:withPktIFName:withPktIFInfo:withPktPhyIFInfo:", &a3[7].kev_class, a3[5].event_data, a3[6].event_data, a3[7].event_data);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[PLNetworkUtilities getNetworkWakeInfo:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
  v45 = v10;
  v46 = (void *)v6;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v18 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v18;
    if (getNetworkWakeInfo__defaultOnce != -1)
      dispatch_once(&getNetworkWakeInfo__defaultOnce, block);
    if (getNetworkWakeInfo__classDebugEnabled)
    {
      v43 = v9;
      v44 = v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wake uuid %s ifname %s port %d flags 0x%x pid %d pname %s epid %d epname %s\n"), out, a3[5].event_data, bswap32(HIWORD(a3[1].event_code)) >> 16, LOWORD(a3[1].event_data[0]), a3[2].total_size, &a3[2].kev_class, a3[2].vendor_code, (char *)a3[2].event_data + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getNetworkWakeInfo:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 194);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v6 = (uint64_t)v46;
      v9 = v43;
      v8 = v44;
    }
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("wakeUUID"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3[5].event_data);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("Interface"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3[2].total_size);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("PID"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &a3[2].kev_class);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("ProcessName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3[2].vendor_code);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("EffectivePID"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a3[2].event_data + 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("EffectiveProcessName"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AttributedWake"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("InterfaceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "getCompanionLink:", a3[6].event_data));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("CompanionLink"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(HIWORD(a3[4].id)) >> 16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("sourcePort"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("sourceAddress"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(HIWORD(a3[1].event_code)) >> 16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("destinationPort"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("destinationAddress"));
  if ((a3[1].event_data[0] & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(a3[6].event_code));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("controlFlagType"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3[6].id);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("packetDataLength"));

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v35 = objc_opt_class();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke_85;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v35;
    if (getNetworkWakeInfo__defaultOnce_83 != -1)
      dispatch_once(&getNetworkWakeInfo__defaultOnce_83, v47);
    if (getNetworkWakeInfo__classDebugEnabled_84)
    {
      v36 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wake dictionary %@"), v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getNetworkWakeInfo:]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v39, v40, 216);

      PLLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v9 = v36;
    }
  }

  return v5;
}

BOOL __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getNetworkWakeInfo__classDebugEnabled = result;
  return result;
}

BOOL __41__PLNetworkUtilities_getNetworkWakeInfo___block_invoke_85(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getNetworkWakeInfo__classDebugEnabled_84 = result;
  return result;
}

+ (id)getIPAddress:(in_addr_4_6 *)a3 withAddressFamily:(int)a4
{
  int v4;
  _OWORD v6[3];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, 46);
  if (a4 == 2)
    v4 = 2;
  else
    v4 = 30;
  inet_ntop(v4, a3, (char *)v6, 0x2Eu);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)getCompanionLink:(npi_if_info *)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3->var0 == 18 && a3->var2 == 7)
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v3)
      +[PLNetworkUtilities getCompanionLink:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    LOBYTE(v11) = 1;
  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      +[PLNetworkUtilities getCompanionLink:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

+ (int)getInterfaceType:(char *)a3 withPktIFName:(char *)a4 withPktIFInfo:(npi_if_info *)a5 withPktPhyIFInfo:(npi_if_info *)a6
{
  unsigned int var0;
  unsigned int var2;
  unsigned int var1;
  unsigned int v10;
  _BOOL4 v11;
  BOOL v12;
  int v13;

  var0 = a5->var0;
  if ((int)a5->var0 > 16)
  {
    if (var0 == 17)
    {
      if (a6->var1 == 3)
        return 2;
      v12 = a6->var0 == 15;
      v13 = 3;
    }
    else
    {
      if (var0 != 18)
        return 0;
      var2 = a5->var2;
      if (!var2)
      {
        if (a6->var1 != 3)
        {
          var0 = a6->var0;
LABEL_3:
          if (var0 == 15)
            return 3;
          return 0;
        }
        return 2;
      }
      if (var2 != 7)
        return 0;
      var1 = a5->var1;
      if (var1 == 2)
        return 1;
      if (var1 != 7)
      {
        if (var1 != 3)
        {
          v10 = a6->var1;
          if (v10 != 3)
          {
            v11 = v10 == 2;
            if (a6->var0 == 15)
              return 3;
            else
              return v11;
          }
        }
        return 2;
      }
      if (a6->var1 == 3)
        return 4;
      v12 = a6->var0 == 15;
      v13 = 5;
    }
    if (v12)
      return v13;
    else
      return 0;
  }
  if (var0 != 2)
    goto LABEL_3;
  if (a5->var1 == 3)
    return 2;
  else
    return 6;
}

+ (id)getUnattributedWakeInfo:(kern_event_msg *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  _QWORD v43[5];
  _QWORD block[5];
  char out[48];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a3->event_data, out);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3[1].event_code & 0x20000) != 0)
    v7 = 30;
  else
    v7 = 2;
  objc_msgSend(a1, "getIPAddress:withAddressFamily:", &a3[6].kev_subclass, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getIPAddress:withAddressFamily:", a3[5].event_data, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "getInterfaceType:withPktIFName:withPktIFInfo:withPktPhyIFInfo:", &a3[8].kev_subclass, &a3[7], &a3[8], &a3[9]);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[PLNetworkUtilities getUnattributedWakeInfo:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
  v42 = v10;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v18 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v18;
    if (getUnattributedWakeInfo__defaultOnce != -1)
      dispatch_once(&getUnattributedWakeInfo__defaultOnce, block);
    if (getUnattributedWakeInfo__classDebugEnabled)
    {
      v39 = v9;
      v40 = v8;
      v41 = v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wake uuid %s ifname %s src port %d dst port %d \n"), out, &a3[7], bswap32(LOWORD(a3[5].event_code)) >> 16, bswap32(HIWORD(a3[5].id)) >> 16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getUnattributedWakeInfo:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 319);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v8 = v40;
      v6 = v41;
      v9 = v39;
    }
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("wakeUUID"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &a3[7]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("Interface"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(LOWORD(a3[5].event_code)) >> 16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("sourcePort"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("sourceAddress"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(HIWORD(a3[5].id)) >> 16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("destinationPort"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("destinationAddress"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("AttributedWake"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("InterfaceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "getCompanionLink:", &a3[8]));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("CompanionLink"));

  if ((a3[1].event_code & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(a3[7].event_data[0]));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("controlFlagType"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3[7].event_code);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("packetDataLength"));

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v31 = objc_opt_class();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke_92;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v31;
    if (getUnattributedWakeInfo__defaultOnce_90 != -1)
      dispatch_once(&getUnattributedWakeInfo__defaultOnce_90, v43);
    if (getUnattributedWakeInfo__classDebugEnabled_91)
    {
      v32 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unattributed wake dictionary %@"), v5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getUnattributedWakeInfo:]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v35, v36, 337);

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v9 = v32;
    }
  }

  return v5;
}

BOOL __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getUnattributedWakeInfo__classDebugEnabled = result;
  return result;
}

BOOL __46__PLNetworkUtilities_getUnattributedWakeInfo___block_invoke_92(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getUnattributedWakeInfo__classDebugEnabled_91 = result;
  return result;
}

+ (id)handlePowerWakeEvent:(int)a3
{
  uint64_t v3;
  ssize_t v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD block[5];

  v3 = *(_QWORD *)&a3;
  v5 = recv(a3, &handlePowerWakeEvent__buf, 0x41CuLL, 0);
  v6 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v5 == -1)
  {
    if (!v6)
      goto LABEL_28;
    v20 = objc_opt_class();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_102;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v20;
    if (handlePowerWakeEvent__defaultOnce_100 != -1)
      dispatch_once(&handlePowerWakeEvent__defaultOnce_100, v25);
    if (!handlePowerWakeEvent__classDebugEnabled_101)
      goto LABEL_28;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not receive data on power wake event %d"), v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities handlePowerWakeEvent:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v22, v23, 366);

    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    goto LABEL_27;
  }
  if (v6)
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (handlePowerWakeEvent__defaultOnce != -1)
      dispatch_once(&handlePowerWakeEvent__defaultOnce, block);
    if (handlePowerWakeEvent__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got kev message as vendor code %d class %d sub class %d event code %d !"), dword_1EF1481ED, dword_1EF1481F1, dword_1EF1481F5, dword_1EF1481FD);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities handlePowerWakeEvent:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 350);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (dword_1EF1481ED != 1 || dword_1EF1481F1 != 1 || dword_1EF1481F5 != 14)
    goto LABEL_18;
  if (dword_1EF1481FD == 2)
  {
    objc_msgSend(a1, "getUnattributedWakeInfo:", &handlePowerWakeEvent__buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    return v13;
  }
  if (dword_1EF1481FD != 1)
  {
LABEL_18:
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_28;
    v14 = objc_opt_class();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_99;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v14;
    if (handlePowerWakeEvent__defaultOnce_97 != -1)
      dispatch_once(&handlePowerWakeEvent__defaultOnce_97, v26);
    if (!handlePowerWakeEvent__classDebugEnabled_98)
      goto LABEL_28;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got kev message as vendor code %d class %d sub class %d event code %d !"), dword_1EF1481ED, dword_1EF1481F1, dword_1EF1481F5, dword_1EF1481FD);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities handlePowerWakeEvent:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v17, v18, 363);

    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_27:

LABEL_28:
    v13 = 0;
    return v13;
  }
  objc_msgSend(a1, "getNetworkWakeInfo:", &handlePowerWakeEvent__buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  return v13;
}

BOOL __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePowerWakeEvent__classDebugEnabled = result;
  return result;
}

BOOL __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_99(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePowerWakeEvent__classDebugEnabled_98 = result;
  return result;
}

BOOL __43__PLNetworkUtilities_handlePowerWakeEvent___block_invoke_102(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePowerWakeEvent__classDebugEnabled_101 = result;
  return result;
}

+ (id)handleIPSecEvent:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD block[5];
  _QWORD v25[5];

  v3 = *(_QWORD *)&a3;
  if (recv(a3, &handleIPSecEvent__buf, 0x9CuLL, 0) == -1)
  {
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_27;
    v18 = objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_112;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v18;
    if (handleIPSecEvent__defaultOnce_110 != -1)
      dispatch_once(&handleIPSecEvent__defaultOnce_110, v23);
    if (!handleIPSecEvent__classDebugEnabled_111)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not receive data on ipsec event %d"), v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities handleIPSecEvent:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v20, v21, 390);

    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    goto LABEL_26;
  }
  if (dword_1EF148635 != 1 || dword_1EF148639 != 1 || dword_1EF14863D != 13 || dword_1EF148645 != 1)
  {
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_27;
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_107;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (handleIPSecEvent__defaultOnce_105 != -1)
      dispatch_once(&handleIPSecEvent__defaultOnce_105, block);
    if (!handleIPSecEvent__classDebugEnabled_106)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got kev message as vendor code %d class %d sub class %d event code %d on socket %d"), dword_1EF148635, dword_1EF148639, dword_1EF14863D, dword_1EF148645, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities handleIPSecEvent:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 387);

    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_26:

LABEL_27:
    v11 = 0;
    return v11;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __39__PLNetworkUtilities_handleIPSecEvent___block_invoke;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v5;
    if (handleIPSecEvent__defaultOnce != -1)
      dispatch_once(&handleIPSecEvent__defaultOnce, v25);
    if (handleIPSecEvent__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got kev message as vendor code %d class %d sub class %d event code %d !"), dword_1EF148635, dword_1EF148639, dword_1EF14863D, dword_1EF148645);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities handleIPSecEvent:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 384);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(a1, "getIPSecWakeInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

BOOL __39__PLNetworkUtilities_handleIPSecEvent___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIPSecEvent__classDebugEnabled = result;
  return result;
}

BOOL __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_107(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIPSecEvent__classDebugEnabled_106 = result;
  return result;
}

BOOL __39__PLNetworkUtilities_handleIPSecEvent___block_invoke_112(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIPSecEvent__classDebugEnabled_111 = result;
  return result;
}

+ (id)getIPSecWakeInfo
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  size_t v15;
  _OWORD v16[8];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v15 = 152;
  memset(v16, 0, sizeof(v16));
  v17 = 0u;
  v18 = 0;
  if ((sysctlbyname("net.link.generic.system.ipsec_wake_pkt", v16, &v15, 0, 0) & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("headerInfo"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)&v16[6] + 4);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("wakeUUID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("seqNo"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v17));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("spi"));

LABEL_3:
    return v2;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLNetworkUtilities_getIPSecWakeInfo__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (getIPSecWakeInfo_defaultOnce != -1)
      dispatch_once(&getIPSecWakeInfo_defaultOnce, block);
    if (getIPSecWakeInfo_classDebugEnabled)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = __error();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("net.link.generic.system.ipsec_wake_pkt sysctl failed %s"), strerror(*v9));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getIPSecWakeInfo]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v11, v12, 406);

      PLLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      goto LABEL_3;
    }
  }
  return v2;
}

BOOL __38__PLNetworkUtilities_getIPSecWakeInfo__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getIPSecWakeInfo_classDebugEnabled = result;
  return result;
}

+ (id)getNormalizedIPV6Address:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  _QWORD block[5];
  _QWORD v21[2];
  char v22[46];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21[0] = 0;
  v21[1] = 0;
  if (!inet_pton(30, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v21))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v10 = objc_opt_class();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke_129;
      v18 = &__block_descriptor_40_e5_v8__0lu32l8;
      v19 = v10;
      if (getNormalizedIPV6Address__defaultOnce_127 != -1)
        dispatch_once(&getNormalizedIPV6Address__defaultOnce_127, &v15);
      if (getNormalizedIPV6Address__classDebugEnabled_128)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed in inet_pton %d"), 0, v15, v16, v17, v18, v19);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getNormalizedIPV6Address:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v12, v13, 435);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        v3 = 0;
        goto LABEL_16;
      }
    }
LABEL_17:
    v3 = 0;
    return v3;
  }
  if (!inet_ntop(30, v21, v22, 0x2Eu))
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (getNormalizedIPV6Address__defaultOnce != -1)
      dispatch_once(&getNormalizedIPV6Address__defaultOnce, block);
    if (getNormalizedIPV6Address__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Normalized Address is %@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getNormalizedIPV6Address:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 432);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_16:

    }
  }
  return v3;
}

BOOL __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getNormalizedIPV6Address__classDebugEnabled = result;
  return result;
}

BOOL __47__PLNetworkUtilities_getNormalizedIPV6Address___block_invoke_129(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getNormalizedIPV6Address__classDebugEnabled_128 = result;
  return result;
}

+ (id)decodeIPPacket:(id)a3 encryptedPath:(BOOL)a4
{
  const __CFData *v6;
  const __CFData *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  __CFString *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  int v62;
  int v63;
  _BOOL4 v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[5];
  UInt8 v100[16];
  __int128 v101;
  uint64_t v102;
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD block[5];
  UInt8 buffer[9];
  CFRange v107;
  CFRange v108;
  CFRange v109;

  v6 = (const __CFData *)a3;
  v7 = v6;
  buffer[0] = 0;
  if (!v6)
    goto LABEL_32;
  if (!CFDataGetLength(v6))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v15 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v15;
      if (decodeIPPacket_encryptedPath__defaultOnce != -1)
        dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce, block);
      if (decodeIPPacket_encryptedPath__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] Packet too short or no data available"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v17, v18, 464);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        goto LABEL_31;
      }
    }
    goto LABEL_32;
  }
  v107.location = 0;
  v107.length = 1;
  CFDataGetBytes(v7, v107, buffer);
  v8 = buffer[0] >> 4;
  buffer[0] >>= 4;
  if (v8 == 6)
  {
    if ((unint64_t)CFDataGetLength(v7) <= 0x27)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v19 = objc_opt_class();
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_143;
        v103[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v103[4] = v19;
        if (decodeIPPacket_encryptedPath__defaultOnce_141 != -1)
          dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_141, v103);
        if (decodeIPPacket_encryptedPath__classDebugEnabled_142)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] IPv6 Packet too short"));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v21, v22, 497);

          PLLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
          goto LABEL_31;
        }
      }
      goto LABEL_32;
    }
    v102 = 0;
    *(_OWORD *)v100 = 0u;
    v101 = 0u;
    v109.location = 0;
    v109.length = 40;
    CFDataGetBytes(v7, v109, v100);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = bswap32(*(unsigned int *)&v100[8]);
    v35 = bswap32(*(unsigned int *)&v100[12]);
    v36 = bswap32(v101);
    v37 = bswap32(DWORD1(v101));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x:%x:%x:%x:%x:%x:%x:%x"), HIWORD(v34), (unsigned __int16)v34, HIWORD(v35), (unsigned __int16)v35, HIWORD(v36), (unsigned __int16)v36, HIWORD(v37), (unsigned __int16)v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = bswap32(DWORD2(v101));
    v40 = bswap32(HIDWORD(v101));
    v41 = bswap32(v102);
    v42 = bswap32(HIDWORD(v102));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x:%x:%x:%x:%x:%x:%x:%x"), HIWORD(v39), (unsigned __int16)v39, HIWORD(v40), (unsigned __int16)v40, HIWORD(v41), (unsigned __int16)v41, HIWORD(v42), (unsigned __int16)v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getNormalizedIPV6Address:", v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getNormalizedIPV6Address:", v43);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v44 = objc_opt_class();
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_150;
      v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v99[4] = v44;
      if (decodeIPPacket_encryptedPath__defaultOnce_148 != -1)
        dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_148, v99);
      if (decodeIPPacket_encryptedPath__classDebugEnabled_149)
      {
        v91 = v32;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Normalized address is source %@ dest %@ orig s %@ orig d %@"), v32, v93, v38, v43);
        v45 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v47, v48, 519);

        v49 = (void *)v45;
        PLLogCommon();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v32 = v91;
      }
    }
    v33 = v100[6];

    v28 = 10;
    goto LABEL_42;
  }
  if (v8 == 4)
  {
    if ((unint64_t)CFDataGetLength(v7) <= 0x13)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v9 = objc_opt_class();
        v104[0] = MEMORY[0x1E0C809B0];
        v104[1] = 3221225472;
        v104[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_136;
        v104[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v104[4] = v9;
        if (decodeIPPacket_encryptedPath__defaultOnce_134 != -1)
          dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_134, v104);
        if (decodeIPPacket_encryptedPath__classDebugEnabled_135)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] IPv4 Packet too short"));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 475);

          PLLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_31:
          v27 = 0;
LABEL_91:

          goto LABEL_92;
        }
      }
      goto LABEL_32;
    }
    memset(v100, 0, sizeof(v100));
    LODWORD(v101) = 0;
    v108.location = 0;
    v108.length = 20;
    CFDataGetBytes(v7, v108, v100);
    v28 = v100[0] & 0xF;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = bswap32(*(unsigned int *)&v100[12]);
    v31 = bswap32(v101);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu.%lu.%lu"), HIBYTE(v30), BYTE2(v30), BYTE1(v30), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu.%lu.%lu"), HIBYTE(v31), BYTE2(v31), BYTE1(v31), v31);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v100[9];
LABEL_42:
    if (v33 == 50)
    {
      if (a4)
      {
        v51 = 0;
      }
      else
      {
        objc_msgSend(a1, "getSeqNoAndSPI:offset:", v7, (4 * v28));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v55 = objc_opt_class();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_185;
          v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v94[4] = v55;
          if (decodeIPPacket_encryptedPath__defaultOnce_183 != -1)
            dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_183, v94);
          if (decodeIPPacket_encryptedPath__classDebugEnabled_184)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invoked from non encrypted path (esp) - wifi or bb agent %@"), v51);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "lastPathComponent");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v58, v59, 560);

            PLLogCommon();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
      }
      v14 = 0;
      v52 = CFSTR("ESP");
      goto LABEL_86;
    }
    if (v33 != 17)
    {
      if (v33 == 6)
      {
        objc_msgSend(a1, "tcpParse:offset:", v7, (4 * v28));
        v14 = objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v52 = CFSTR("TCP");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), v33);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v14 = 0;
      }
      goto LABEL_86;
    }
    v92 = v32;
    v53 = (4 * v28);
    objc_msgSend(a1, "udpParse:offset:", v7, v53);
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("dest_port"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "intValue") == 4500)
    {

    }
    else
    {
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("source_port"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "intValue");

      if (v62 != 4500)
      {
        v51 = 0;
        v52 = CFSTR("UDP");
        goto LABEL_86;
      }
    }
    v63 = objc_msgSend(a1, "isESPPacket:offset:", v7, v53);
    v64 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    if (v63)
    {
      if (v64)
      {
        v65 = objc_opt_class();
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_168;
        v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v97[4] = v65;
        if (decodeIPPacket_encryptedPath__defaultOnce_166 != -1)
          dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_166, v97);
        if (decodeIPPacket_encryptedPath__classDebugEnabled_167)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found an ESP packet in UDP"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "lastPathComponent");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v90, v67, v68, 542);

          PLLogCommon();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          v32 = v92;
        }
      }
      if (!a4)
      {
        objc_msgSend(a1, "getSeqNoAndSPI:offset:", v7, (v53 + 8));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v70 = objc_opt_class();
          v96[0] = MEMORY[0x1E0C809B0];
          v96[1] = 3221225472;
          v96[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_173;
          v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v96[4] = v70;
          if (decodeIPPacket_encryptedPath__defaultOnce_171 != -1)
            dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_171, v96);
          if (decodeIPPacket_encryptedPath__classDebugEnabled_172)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invoked from non encrypted path - wifi or bb agent %@"), v51);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "lastPathComponent");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v71, v73, v74, 547);

            PLLogCommon();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
        goto LABEL_84;
      }
    }
    else if (v64)
    {
      v76 = objc_opt_class();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_178;
      v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v95[4] = v76;
      if (decodeIPPacket_encryptedPath__defaultOnce_176 != -1)
        dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_176, v95);
      if (decodeIPPacket_encryptedPath__classDebugEnabled_177)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found an IKE packet in UDP"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "lastPathComponent");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v77, v79, v80, 550);

        PLLogCommon();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v51 = 0;
LABEL_84:
    v52 = CFSTR("UDP");
LABEL_86:
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v52, CFSTR("protocol"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", buffer[0]);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v82, CFSTR("version"));

    objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("source"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v93, CFSTR("destination"));
    if (v51)
    {
      v83 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("seqNo"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "numberWithUnsignedInt:", objc_msgSend(v84, "unsignedIntValue"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v85, CFSTR("seqNo"));

      v86 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("spi"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "numberWithUnsignedInt:", objc_msgSend(v87, "unsignedIntValue"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v88, CFSTR("spi"));

    }
    if (v14)
      objc_msgSend(v29, "setObject:forKey:", v14, CFSTR("protocol_info"));
    v10 = v29;

    v27 = v10;
    goto LABEL_91;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v23 = objc_opt_class();
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_155;
    v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v98[4] = v23;
    if (decodeIPPacket_encryptedPath__defaultOnce_153 != -1)
      dispatch_once(&decodeIPPacket_encryptedPath__defaultOnce_153, v98);
    if (decodeIPPacket_encryptedPath__classDebugEnabled_154)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] unknown type: %d"), buffer[0]);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities decodeIPPacket:encryptedPath:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v25, v26, 525);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      goto LABEL_31;
    }
  }
LABEL_32:
  v27 = 0;
LABEL_92:

  return v27;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_136(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_135 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_143(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_142 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_150(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_149 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_155(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_154 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_168(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_167 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_173(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_172 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_178(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_177 = result;
  return result;
}

BOOL __51__PLNetworkUtilities_decodeIPPacket_encryptedPath___block_invoke_185(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decodeIPPacket_encryptedPath__classDebugEnabled_184 = result;
  return result;
}

+ (id)tcpParse:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4;
  uint64_t v6;
  void *v7;
  CFIndex Length;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t block;
  uint64_t v22;
  BOOL (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  UInt8 buffer[8];
  uint64_t v27;
  int v28;
  CFRange v29;

  v4 = a4;
  *(_QWORD *)buffer = 0;
  v27 = 0;
  v28 = 0;
  if (CFDataGetLength(a3) >= (unint64_t)a4 + 20)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29.location = v4;
    v29.length = 20;
    CFDataGetBytes(a3, v29, buffer);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned __int16 *)buffer) >> 16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("source_port"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned __int16 *)&buffer[2]) >> 16);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("dest_port"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned int *)&buffer[4]));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("seq"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(v27));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("ack"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", BYTE5(v27));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("control"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(HIWORD(v27)) >> 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("window"));
  }
  else
  {
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_11;
    v6 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __38__PLNetworkUtilities_tcpParse_offset___block_invoke;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    v25 = v6;
    if (tcpParse_offset__defaultOnce != -1)
      dispatch_once(&tcpParse_offset__defaultOnce, &block);
    if (!tcpParse_offset__classDebugEnabled)
    {
LABEL_11:
      v14 = 0;
      return v14;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    Length = CFDataGetLength(a3);
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[PacketDecoder] TCP Packet too short: %@ Length: %ld"), a3, Length, block, v22, v23, v24, v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities tcpParse:offset:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 588);

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    v14 = 0;
  }

  return v14;
}

BOOL __38__PLNetworkUtilities_tcpParse_offset___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  tcpParse_offset__classDebugEnabled = result;
  return result;
}

+ (id)udpParse:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  UInt8 buffer[8];
  CFRange v21;

  v4 = a4;
  *(_QWORD *)buffer = 0;
  if (CFDataGetLength(a3) >= (unint64_t)a4 + 8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21.location = v4;
    v21.length = 8;
    CFDataGetBytes(a3, v21, buffer);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned __int16 *)buffer) >> 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("source_port"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned __int16 *)&buffer[2]) >> 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("dest_port"));
  }
  else
  {
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_11;
    v6 = objc_opt_class();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __38__PLNetworkUtilities_udpParse_offset___block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v6;
    if (udpParse_offset__defaultOnce != -1)
      dispatch_once(&udpParse_offset__defaultOnce, &v15);
    if (!udpParse_offset__classDebugEnabled)
    {
LABEL_11:
      v12 = 0;
      return v12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] UDP Packet too short"), v15, v16, v17, v18, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities udpParse:offset:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 611);

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    v12 = 0;
  }

  return v12;
}

BOOL __38__PLNetworkUtilities_udpParse_offset___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  udpParse_offset__classDebugEnabled = result;
  return result;
}

+ (BOOL)isESPPacket:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4;
  CFIndex v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  BOOL v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  BOOL (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD block[5];
  UInt8 buffer[4];
  CFRange v35;

  v4 = a4;
  if (CFDataGetLength(a3) <= (unint64_t)a4 + 12)
    return 0;
  v6 = v4 + 8;
  *(_DWORD *)buffer = 0;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLNetworkUtilities_isESPPacket_offset___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (isESPPacket_offset__defaultOnce != -1)
      dispatch_once(&isESPPacket_offset__defaultOnce, block);
    if (isESPPacket_offset__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] Read marker value."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities isESPPacket:offset:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 631);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v35.location = v6;
  v35.length = 4;
  CFDataGetBytes(a3, v35, buffer);
  v13 = *(_DWORD *)buffer;
  v14 = *(_DWORD *)buffer != 0;
  v15 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (!v13)
  {
    if (v15)
    {
      v22 = objc_opt_class();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_216;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v22;
      if (isESPPacket_offset__defaultOnce_214 != -1)
        dispatch_once(&isESPPacket_offset__defaultOnce_214, v32);
      if (isESPPacket_offset__classDebugEnabled_215)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] Found an IKE packet"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities isESPPacket:offset:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v24, v25, 636);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        goto LABEL_23;
      }
    }
    return 0;
  }
  if (v15)
  {
    v16 = objc_opt_class();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_221;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = v16;
    if (isESPPacket_offset__defaultOnce_219 != -1)
      dispatch_once(&isESPPacket_offset__defaultOnce_219, &v27);
    if (isESPPacket_offset__classDebugEnabled_220)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] Found an ESP packet"), v27, v28, v29, v30, v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities isESPPacket:offset:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 639);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_23:

      return v14;
    }
  }
  return 1;
}

BOOL __41__PLNetworkUtilities_isESPPacket_offset___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isESPPacket_offset__classDebugEnabled = result;
  return result;
}

BOOL __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_216(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isESPPacket_offset__classDebugEnabled_215 = result;
  return result;
}

BOOL __41__PLNetworkUtilities_isESPPacket_offset___block_invoke_221(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isESPPacket_offset__classDebugEnabled_220 = result;
  return result;
}

+ (id)getSeqNoAndSPI:(__CFData *)a3 offset:(unsigned __int8)a4
{
  unsigned int v4;
  void *v6;
  unint64_t Length;
  CFRange v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  UInt8 buffer[8];

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buffer = 0;
  Length = CFDataGetLength(a3);
  v8.location = v4;
  if (Length >= (unint64_t)v4 + 8)
  {
    v8.length = 8;
    CFDataGetBytes(a3, v8, buffer);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned int *)&buffer[4]));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("seqNo"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned int *)buffer));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("spi"));

    v15 = v6;
  }
  else
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v9 = objc_opt_class();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __44__PLNetworkUtilities_getSeqNoAndSPI_offset___block_invoke;
      v22 = &__block_descriptor_40_e5_v8__0lu32l8;
      v23 = v9;
      if (getSeqNoAndSPI_offset__defaultOnce != -1)
        dispatch_once(&getSeqNoAndSPI_offset__defaultOnce, &v19);
      if (getSeqNoAndSPI_offset__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PacketDecoder] Cannot get spi and seq no"), v19, v20, v21, v22, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLNetworkUtilities.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLNetworkUtilities getSeqNoAndSPI:offset:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 652);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v15 = 0;
  }

  return v15;
}

BOOL __44__PLNetworkUtilities_getSeqNoAndSPI_offset___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getSeqNoAndSPI_offset__classDebugEnabled = result;
  return result;
}

+ (void)getNetworkWakeInfo:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "PLNetworkUtilities::getNetworkWakeInfo interfaceType: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)getCompanionLink:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "PLNetworkUtilities::getCompanionLink found companion", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)getCompanionLink:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "PLNetworkUtilities::getCompanionLink no companion found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)getUnattributedWakeInfo:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "PLNetworkUtilities::getUnattributedWakeInfo interfaceType: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
