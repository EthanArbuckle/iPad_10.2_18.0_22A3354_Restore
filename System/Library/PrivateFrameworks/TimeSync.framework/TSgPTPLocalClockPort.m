@implementation TSgPTPLocalClockPort

- (TSgPTPLocalClockPort)initWithImplDC:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "[portImpl isKindOfClass:[TSDgPTPLocalClockPort class]]";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      v19 = 1024;
      v20 = 406;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSgPTPLocalClockPort;
  v5 = -[TSgPTPPort initWithImplDC:](&v8, sel_initWithImplDC_, v4);
  if (v5)
  {
    v6 = v4;
    self = (TSgPTPLocalClockPort *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v6;
LABEL_4:

  }
  return (TSgPTPLocalClockPort *)v5;
}

+ (id)keyPathsForValuesAffectingLocalOscillatorType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localOscillatorType"), 0);
}

- (unsigned)localOscillatorType
{
  return -[_TSF_TSDgPTPLocalClockPort localOscillatorType](self->_impl, "localOscillatorType");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyToleranceLower"), 0);
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return -[_TSF_TSDgPTPLocalClockPort hasLocalFrequencyToleranceLower](self->_impl, "hasLocalFrequencyToleranceLower");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyToleranceLower"), 0);
}

- (int)localFrequencyToleranceLower
{
  return -[_TSF_TSDgPTPLocalClockPort localFrequencyToleranceLower](self->_impl, "localFrequencyToleranceLower");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyToleranceUpper"), 0);
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return -[_TSF_TSDgPTPLocalClockPort hasLocalFrequencyToleranceUpper](self->_impl, "hasLocalFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyToleranceUpper"), 0);
}

- (int)localFrequencyToleranceUpper
{
  return -[_TSF_TSDgPTPLocalClockPort localFrequencyToleranceUpper](self->_impl, "localFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyStabilityLower"), 0);
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return -[_TSF_TSDgPTPLocalClockPort hasLocalFrequencyStabilityLower](self->_impl, "hasLocalFrequencyStabilityLower");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyStabilityLower"), 0);
}

- (int)localFrequencyStabilityLower
{
  return -[_TSF_TSDgPTPLocalClockPort localFrequencyStabilityLower](self->_impl, "localFrequencyStabilityLower");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyToleranceUpper"), 0);
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return -[_TSF_TSDgPTPLocalClockPort hasLocalFrequencyToleranceUpper](self->_impl, "hasLocalFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyStabilityUpper"), 0);
}

- (int)localFrequencyStabilityUpper
{
  return -[_TSF_TSDgPTPLocalClockPort localFrequencyStabilityUpper](self->_impl, "localFrequencyStabilityUpper");
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v43.receiver = a1;
  v43.super_class = (Class)&OBJC_METACLASS___TSgPTPLocalClockPort;
  objc_msgSendSuper2(&v43, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Priority 1: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockPriority1"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v9, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Class: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v11, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Accuracy: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockAccuracy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v12, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Offset Scaled Log Variance: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OffsetScaledLogVariance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v13, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Priority 2: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockPriority2"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v14, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Grandmaster Identity: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GrandmasterID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v8, "appendFormat:", CFSTR("%016llx\n"), objc_msgSend(v15, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Steps Removed: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("StepsRemoved"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v16, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Time Source: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TimeSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v17, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Priority 1: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockPriority1"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v18, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Class: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockClass"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v19, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Accuracy: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockAccuracy"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v20, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Offset Scaled Log Variance: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedOffsetScaledLogVariance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v21, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Priority 2: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockPriority2"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v22, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Grandmaster Identity: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedGrandmasterID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v8, "appendFormat:", CFSTR("%016llx\n"), objc_msgSend(v23, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Steps Removed: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedStepsRemoved"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v24, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Time Source: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedTimeSource"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v25, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Battery Powered: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BatteryPowered"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (objc_msgSend(v26, "BOOLValue"))
      v27 = CFSTR("YES\n");
    else
      v27 = CFSTR("NO\n");
    objc_msgSend(v8, "appendString:", v27);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    External Power Connected: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ExternalPowerConnected"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (objc_msgSend(v28, "BOOLValue"))
      v29 = CFSTR("YES\n");
    else
      v29 = CFSTR("NO\n");
    objc_msgSend(v8, "appendString:", v29);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Has Wired Ethernet Link Active: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HasWiredEthernetLinkActive"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    if (objc_msgSend(v30, "BOOLValue"))
      v31 = CFSTR("YES\n");
    else
      v31 = CFSTR("NO\n");
    objc_msgSend(v8, "appendString:", v31);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Has Ethernet Hardware Timestamping: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HasEthernetHardwareTimestamping"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (objc_msgSend(v32, "BOOLValue"))
      v33 = CFSTR("YES\n");
    else
      v33 = CFSTR("NO\n");
    objc_msgSend(v8, "appendString:", v33);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Has WiFi Hardware Timestamping: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HasWiFiHardwareTimestamping"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (objc_msgSend(v34, "BOOLValue"))
      v35 = CFSTR("YES\n");
    else
      v35 = CFSTR("NO\n");
    objc_msgSend(v8, "appendString:", v35);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Oscillator Type: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalOscillatorType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    switch(objc_msgSend(v36, "unsignedCharValue"))
    {
      case 0u:
        v37 = CFSTR("Unknown\n");
        goto LABEL_78;
      case 1u:
        v37 = CFSTR("Crystal\n");
        goto LABEL_78;
      case 2u:
        v37 = CFSTR("MEMS\n");
        goto LABEL_78;
      case 3u:
        v37 = CFSTR("TCXO\n");
        goto LABEL_78;
      case 4u:
        v37 = CFSTR("VCO\n");
        goto LABEL_78;
      case 5u:
        v37 = CFSTR("VCYCXO\n");
        goto LABEL_78;
      case 6u:
        v37 = CFSTR("OCXO\n");
        goto LABEL_78;
      case 7u:
        v37 = CFSTR("DOCXO\n");
        goto LABEL_78;
      case 8u:
        v37 = CFSTR("VCOCXO\n");
        goto LABEL_78;
      case 9u:
        v37 = CFSTR("VCDOCXO\n");
        goto LABEL_78;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined oscillator type %hhu\n"), objc_msgSend(v36, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v37 = CFSTR("Could not read property\n");
LABEL_78:
    objc_msgSend(v8, "appendString:", v37);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Tolerance Lower: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyToleranceLower"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v38, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Tolerance Upper: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyToleranceUpper"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v39, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Stability Lower: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyStabilityLower"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v40, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Stability Upper: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyStabilityUpper"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v41, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
