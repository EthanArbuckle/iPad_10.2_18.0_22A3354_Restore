@implementation WFMeasureResult

- (WFMeasureResult)initWithType:(unint64_t)a3
{
  WFMeasureResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFMeasureResult;
  v4 = -[WFMeasureResult init](&v6, sel_init);
  -[WFMeasureResult setType:](v4, "setType:", a3);
  -[WFMeasureResult setBackhaulResultsValid:](v4, "setBackhaulResultsValid:", 0);
  -[WFMeasureResult setGatewayResultsValid:](v4, "setGatewayResultsValid:", 0);
  -[WFMeasureResult setLocalResultsValid:](v4, "setLocalResultsValid:", 0);
  -[WFMeasureResult setPublicResultsValid:](v4, "setPublicResultsValid:", 0);
  -[WFMeasureResult setDnsResultsValid:](v4, "setDnsResultsValid:", 0);
  -[WFMeasureResult setSiriTCPResultsValid:](v4, "setSiriTCPResultsValid:", 0);
  -[WFMeasureResult setSiriTLSResultsValid:](v4, "setSiriTLSResultsValid:", 0);
  -[WFMeasureResult setSeenSpecificAcFailure:](v4, "setSeenSpecificAcFailure:", 0);
  -[WFMeasureResult setTrafficClassBEAttemptedSmall:](v4, "setTrafficClassBEAttemptedSmall:", 0);
  -[WFMeasureResult setTrafficClassBKAttemptedSmall:](v4, "setTrafficClassBKAttemptedSmall:", 0);
  -[WFMeasureResult setTrafficClassVOAttemptedSmall:](v4, "setTrafficClassVOAttemptedSmall:", 0);
  -[WFMeasureResult setTrafficClassVIAttemptedSmall:](v4, "setTrafficClassVIAttemptedSmall:", 0);
  -[WFMeasureResult setTrafficClassBESucceededSmall:](v4, "setTrafficClassBESucceededSmall:", 0);
  -[WFMeasureResult setTrafficClassBKSucceededSmall:](v4, "setTrafficClassBKSucceededSmall:", 0);
  -[WFMeasureResult setTrafficClassVOSucceededSmall:](v4, "setTrafficClassVOSucceededSmall:", 0);
  -[WFMeasureResult setTrafficClassVISucceededSmall:](v4, "setTrafficClassVISucceededSmall:", 0);
  -[WFMeasureResult setTrafficClassBEAttemptedLarge:](v4, "setTrafficClassBEAttemptedLarge:", 0);
  -[WFMeasureResult setTrafficClassBKAttemptedLarge:](v4, "setTrafficClassBKAttemptedLarge:", 0);
  -[WFMeasureResult setTrafficClassVOAttemptedLarge:](v4, "setTrafficClassVOAttemptedLarge:", 0);
  -[WFMeasureResult setTrafficClassVIAttemptedLarge:](v4, "setTrafficClassVIAttemptedLarge:", 0);
  -[WFMeasureResult setTrafficClassBESucceededLarge:](v4, "setTrafficClassBESucceededLarge:", 0);
  -[WFMeasureResult setTrafficClassBKSucceededLarge:](v4, "setTrafficClassBKSucceededLarge:", 0);
  -[WFMeasureResult setTrafficClassVOSucceededLarge:](v4, "setTrafficClassVOSucceededLarge:", 0);
  -[WFMeasureResult setTrafficClassVISucceededLarge:](v4, "setTrafficClassVISucceededLarge:", 0);
  return v4;
}

- (id)statusForLocal
{
  int64_t gatewayPacketLoss;
  __CFString **v3;
  BOOL v5;

  if (!self->_gatewayResultsValid)
    return 0;
  gatewayPacketLoss = self->_gatewayPacketLoss;
  if (gatewayPacketLoss == 100)
  {
    v3 = &kWFMeasureStatusBroken;
  }
  else
  {
    v5 = self->_gatewayMaxRTT < 100 && gatewayPacketLoss < 50;
    v3 = &kWFMeasureStatusSlow;
    if (v5)
      v3 = &kWFMeasureStatusOK;
  }
  return *v3;
}

- (id)statusForInternet
{
  __CFString **v2;

  if (!self->_dnsResultsValid || !self->_gatewayResultsValid || !self->_publicResultsValid)
    return 0;
  if (self->_dnsSuccess)
  {
    if (self->_gatewayMaxRTT <= 100)
      v2 = &kWFMeasureStatusOK;
    else
      v2 = &kWFMeasureStatusSlow;
  }
  else
  {
    v2 = &kWFMeasureStatusLimited;
    if (self->_publicDNSPacketLoss >= 50 && self->_gatewayPacketLoss >= 50)
      v2 = &kWFMeasureStatusBroken;
  }
  return *v2;
}

- (id)statusForDNS
{
  __CFString **v2;

  if (!self->_dnsResultsValid)
    return 0;
  v2 = &kWFMeasureStatusBroken;
  if (self->_dnsSuccess)
    v2 = &kWFMeasureStatusOK;
  return *v2;
}

- (id)statusForSiriTCP
{
  __CFString **v2;

  if (!self->_siriTCPResultsValid)
    return 0;
  v2 = &kWFMeasureStatusBroken;
  if (self->_siriTCPSuccess)
    v2 = &kWFMeasureStatusOK;
  return *v2;
}

- (id)statusForSiriTLS
{
  __CFString **v2;

  if (!self->_siriTLSResultsValid)
    return 0;
  v2 = &kWFMeasureStatusBroken;
  if (self->_siriTLSSuccess)
    v2 = &kWFMeasureStatusOK;
  return *v2;
}

- (unint64_t)numAcAttempted
{
  _BOOL4 v2;
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  unsigned int v6;
  int v7;

  v2 = self->_trafficClassBEAttemptedSmall > 0 || self->_trafficClassBEAttemptedLarge > 0;
  v3 = self->_trafficClassBKAttemptedSmall > 0 || self->_trafficClassBKAttemptedLarge > 0;
  v4 = self->_trafficClassVOAttemptedSmall > 0 || self->_trafficClassVOAttemptedLarge > 0;
  if (self->_trafficClassVIAttemptedSmall >= 1)
  {
    if (v2)
      v5 = 2;
    else
      v5 = 1;
    if (v3)
      v2 = v5;
    v6 = v4 + v2;
    return ++v6;
  }
  if (v2)
    v7 = 2;
  else
    v7 = 1;
  if (v3)
    v2 = v7;
  v6 = v4 + v2;
  if (self->_trafficClassVIAttemptedLarge >= 1)
    return ++v6;
  return v6;
}

- (unint64_t)numAcSuccess
{
  unint64_t v3;

  v3 = -[WFMeasureResult numAcAttempted](self, "numAcAttempted");
  return v3 - -[WFMeasureResult numAcFailed](self, "numAcFailed");
}

- (unint64_t)numAcFailed
{
  _BOOL4 v2;
  _BOOL8 v3;
  _BOOL4 v4;
  _BOOL8 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;

  v2 = self->_trafficClassBEAttemptedSmall > 0 || self->_trafficClassBEAttemptedLarge > 0;
  if (self->_trafficClassBESucceededSmall)
    v3 = 0;
  else
    v3 = self->_trafficClassBESucceededLarge == 0;
  v4 = self->_trafficClassBKAttemptedSmall > 0 || self->_trafficClassBKAttemptedLarge > 0;
  if (self->_trafficClassBKSucceededSmall)
    v5 = 0;
  else
    v5 = self->_trafficClassBKSucceededLarge == 0;
  v6 = self->_trafficClassVOAttemptedSmall > 0 || self->_trafficClassVOAttemptedLarge > 0;
  if (self->_trafficClassVOSucceededSmall)
    v7 = 0;
  else
    v7 = self->_trafficClassVOSucceededLarge == 0;
  v8 = self->_trafficClassVIAttemptedSmall > 0 || self->_trafficClassVIAttemptedLarge > 0;
  if (self->_trafficClassVISucceededSmall)
    v9 = 0;
  else
    v9 = self->_trafficClassVISucceededLarge == 0;
  v10 = v2 && v3;
  v11 = v4 && v5;
  v12 = v11 + v10;
  v13 = v6 && v7;
  v14 = v8 && v9;
  return v12 + v13 + v14;
}

- (unint64_t)numSmallPingPacketsAttempted
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBEAttemptedSmall, *(int64x2_t *)&self->_trafficClassVOAttemptedSmall));
}

- (unint64_t)numLargePingPacketsAttempted
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBEAttemptedLarge, *(int64x2_t *)&self->_trafficClassVOAttemptedLarge));
}

- (unint64_t)numPingPacketsAttempted
{
  unint64_t v3;

  v3 = -[WFMeasureResult numSmallPingPacketsAttempted](self, "numSmallPingPacketsAttempted");
  return -[WFMeasureResult numLargePingPacketsAttempted](self, "numLargePingPacketsAttempted") + v3;
}

- (unint64_t)numSmallPingPacketsSuccess
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBESucceededSmall, *(int64x2_t *)&self->_trafficClassVOSucceededSmall));
}

- (unint64_t)numLargePingPacketsSuccess
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_trafficClassBESucceededLarge, *(int64x2_t *)&self->_trafficClassVOSucceededLarge));
}

- (unint64_t)numPingPacketsSuccess
{
  unint64_t v3;

  v3 = -[WFMeasureResult numSmallPingPacketsSuccess](self, "numSmallPingPacketsSuccess");
  return -[WFMeasureResult numLargePingPacketsSuccess](self, "numLargePingPacketsSuccess") + v3;
}

- (unint64_t)numSmallPingPacketsFailed
{
  unint64_t v3;

  v3 = -[WFMeasureResult numSmallPingPacketsAttempted](self, "numSmallPingPacketsAttempted");
  return v3 - -[WFMeasureResult numSmallPingPacketsSuccess](self, "numSmallPingPacketsSuccess");
}

- (unint64_t)numLargePingPacketsFailed
{
  unint64_t v3;

  v3 = -[WFMeasureResult numLargePingPacketsAttempted](self, "numLargePingPacketsAttempted");
  return v3 - -[WFMeasureResult numLargePingPacketsSuccess](self, "numLargePingPacketsSuccess");
}

- (unint64_t)numPingPacketsFailed
{
  unint64_t v3;

  v3 = -[WFMeasureResult numPingPacketsAttempted](self, "numPingPacketsAttempted");
  return v3 - -[WFMeasureResult numPingPacketsSuccess](self, "numPingPacketsSuccess");
}

- (id)statusForAcFailure
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  const __CFString *v11;
  unint64_t v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_trafficClassBEAttemptedSmall > 0 || self->_trafficClassBEAttemptedLarge > 0;
  v5 = self->_trafficClassBKAttemptedSmall > 0 || self->_trafficClassBKAttemptedLarge > 0;
  v6 = self->_trafficClassVOAttemptedSmall > 0 || self->_trafficClassVOAttemptedLarge > 0;
  v7 = self->_trafficClassVIAttemptedSmall > 0 || self->_trafficClassVIAttemptedLarge > 0;
  v8 = -[WFMeasureResult numAcAttempted](self, "numAcAttempted");
  v9 = -[WFMeasureResult numAcFailed](self, "numAcFailed");
  if (self->_seenSpecificAcFailure)
  {
    if (v8 < 2)
    {
      if (!v4)
        goto LABEL_16;
      goto LABEL_26;
    }
    if (v8 == v9)
    {
      v11 = CFSTR("_All");
    }
    else
    {
      v12 = v9;
      v13 = v8 - v9;
      v11 = CFSTR("_%luACF_%luP");
    }
  }
  else
  {
    v11 = CFSTR("_OK");
  }
  objc_msgSend(v3, "appendFormat:", v11, v12, v13);
  if (!v4)
  {
LABEL_16:
    if (!v5)
      goto LABEL_17;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "appendFormat:", CFSTR("_BEL%d:%d_S%d:%d"), self->_trafficClassBESucceededLarge, self->_trafficClassBEAttemptedLarge, self->_trafficClassBESucceededSmall, self->_trafficClassBEAttemptedSmall);
  if (!v5)
  {
LABEL_17:
    if (!v6)
      goto LABEL_18;
LABEL_28:
    objc_msgSend(v3, "appendFormat:", CFSTR("_VOL%d:%d_S%d:%d"), self->_trafficClassVOSucceededLarge, self->_trafficClassVOAttemptedLarge, self->_trafficClassVOSucceededSmall, self->_trafficClassVOAttemptedSmall);
    if (!v7)
      return v3;
    goto LABEL_19;
  }
LABEL_27:
  objc_msgSend(v3, "appendFormat:", CFSTR("_BKL%d:%d_S%d:%d"), self->_trafficClassBKSucceededLarge, self->_trafficClassBKAttemptedLarge, self->_trafficClassBKSucceededSmall, self->_trafficClassBKAttemptedSmall);
  if (v6)
    goto LABEL_28;
LABEL_18:
  if (v7)
LABEL_19:
    objc_msgSend(v3, "appendFormat:", CFSTR("_VIL%d:%d_S%d:%d"), self->_trafficClassVISucceededLarge, self->_trafficClassVIAttemptedLarge, self->_trafficClassVISucceededSmall, self->_trafficClassVIAttemptedSmall);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_backhaulResultsValid)
    objc_msgSend(v3, "appendFormat:", CFSTR("Backhaul:Tput:(%d)mbps Error:(%@) "), (int)self->_backhaulThroughput, self->_downloadError);
  if (self->_gatewayResultsValid)
    objc_msgSend(v4, "appendFormat:", CFSTR("Gateway:RTT:(%d-%d)ms PER:(%d)%% "), self->_gatewayMinRTT, self->_gatewayMaxRTT, self->_gatewayPacketLoss);
  if (self->_localResultsValid)
    objc_msgSend(v4, "appendFormat:", CFSTR("LocalDNS:RTT(%d-%d)ms PER:(%d)%% "), self->_localDNSMinRTT, self->_localDNSMaxRTT, self->_localDNSPacketLoss);
  if (self->_publicResultsValid)
    objc_msgSend(v4, "appendFormat:", CFSTR("PublicDNS:RTT(%d-%d)ms PER:(%d)%% "), self->_publicDNSMinRTT, self->_publicDNSMaxRTT, self->_publicDNSPacketLoss);
  if (self->_seenSpecificAcFailure)
    objc_msgSend(v4, "appendFormat:", CFSTR("SeenSpecificAcFailure %d "), 1);
  if (self->_siriTCPResultsValid)
  {
    -[WFMeasureResult statusForSiriTCP](self, "statusForSiriTCP");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("SiriTCP: %@ (TrafficClass %ld) "), v5, self->_siriTrafficClass);

  }
  if (self->_siriTLSResultsValid)
  {
    -[WFMeasureResult statusForSiriTLS](self, "statusForSiriTLS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("SiriTLS: %@ (TrafficClass %ld) "), v6, self->_siriTrafficClass);

  }
  -[WFMeasureResult statusForLocal](self, "statusForLocal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasureResult statusForInternet](self, "statusForInternet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasureResult statusForDNS](self, "statusForDNS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasureResult statusForAcFailure](self, "statusForAcFailure");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Status:Local:%@ Internet:%@ DNS:%@ PerAC:%@ "), v7, v8, v9, v10);

  return v4;
}

- (id)allPrimitiveProperties
{
  objc_class *v3;
  objc_property_t *v4;
  objc_property_t *v5;
  unint64_t i;
  const char *Attributes;
  const char *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  unsigned int outCount;

  outCount = 0;
  v28 = (void *)objc_opt_new();
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyPropertyList(v3, &outCount);
  v5 = v4;
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Attributes = property_getAttributes(v5[i]);
      if (!Attributes)
        goto LABEL_7;
      v8 = Attributes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Attributes);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("T@"));

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("T#"));

        if ((v12 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("T:"));

          if ((v14 & 1) == 0)
          {
LABEL_7:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", property_getName(v5[i]), objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "rangeOfCharacterFromSet:", v16);
            v19 = v18;

            if ((objc_msgSend(v15, "hasSuffix:", CFSTR("ResultsValid")) & 1) == 0
              && (v17 != 0x7FFFFFFFFFFFFFFFLL || v19 != 0))
            {
              objc_msgSend(v15, "substringToIndex:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ResultsValid"), v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              v24 = objc_retainAutorelease(v22);
              if (class_getProperty(v23, (const char *)objc_msgSend(v24, "UTF8String")))
              {
                -[WFMeasureResult valueForKey:](self, "valueForKey:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    if (objc_msgSend(v25, "BOOLValue"))
                      objc_msgSend(v28, "addObject:", v15);
                  }
                }
              }
              else
              {
                v25 = 0;
              }

            }
          }
        }
      }
    }
    goto LABEL_23;
  }
  if (v4)
LABEL_23:
    free(v5);
  v26 = (void *)objc_msgSend(v28, "copy");

  return v26;
}

- (id)binnedProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  -[WFMeasureResult valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)WFMeasureResult_PropertyToBinMethod, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    switch(v7)
    {
      case 0:
        v8 = v5;
        break;
      case 1:
        +[WiFiUsageLQMTransformations getBinThroughput:As:](WiFiUsageLQMTransformations, "getBinThroughput:As:", objc_msgSend(v5, "unsignedIntegerValue"), 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v5, "description");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        +[WiFiUsageLQMTransformations getBinRTT:As:](WiFiUsageLQMTransformations, "getBinRTT:As:", objc_msgSend(v5, "unsignedIntegerValue"), 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", objc_msgSend(v5, "unsignedIntegerValue"), 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v9 = v8;
  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v14 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "initWithObjectsAndKeys:", v15, CFSTR("backhaulThroughput"), v2, CFSTR("downloadError"), v3, CFSTR("gatewayMinRTT"), v4, CFSTR("gatewayMaxRTT"), v5, CFSTR("localDNSMinRTT"), v6, CFSTR("localDNSMaxRTT"), v7, CFSTR("publicDNSMinRTT"), v8, CFSTR("publicDNSMaxRTT"), v9,
          CFSTR("gatewayPacketLoss"),
          v10,
          CFSTR("localDNSPacketLoss"),
          v11,
          CFSTR("publicDNSPacketLoss"),
          0);
  v13 = (void *)WFMeasureResult_PropertyToBinMethod;
  WFMeasureResult_PropertyToBinMethod = v12;

}

- (id)typeAsString
{
  unint64_t type;
  const __CFString *v3;

  type = self->_type;
  v3 = CFSTR("Unknown Test");
  if (type == 2)
    v3 = CFSTR("Link Test");
  if (type == 1)
    return CFSTR("Throughput Test");
  else
    return (id)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[3] = self->_type;
  v4[4] = self->_options;
  v4[5] = *(_QWORD *)&self->_backhaulThroughput;
  v5 = -[NSError copy](self->_downloadError, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v4[7] = self->_gatewayMinRTT;
  v4[8] = self->_gatewayMaxRTT;
  v4[9] = self->_gatewayPacketLoss;
  v4[10] = self->_localDNSMinRTT;
  v4[11] = self->_localDNSMaxRTT;
  v4[12] = self->_localDNSPacketLoss;
  v4[13] = self->_publicDNSMinRTT;
  v4[14] = self->_publicDNSMaxRTT;
  v4[15] = self->_publicDNSPacketLoss;
  *((_BYTE *)v4 + 8) = self->_dnsSuccess;
  *((_BYTE *)v4 + 9) = self->_backhaulResultsValid;
  *((_BYTE *)v4 + 10) = self->_gatewayResultsValid;
  *((_BYTE *)v4 + 11) = self->_localResultsValid;
  *((_BYTE *)v4 + 12) = self->_publicResultsValid;
  *((_BYTE *)v4 + 13) = self->_dnsResultsValid;
  *((_BYTE *)v4 + 15) = self->_siriTCPResultsValid;
  *((_BYTE *)v4 + 16) = self->_siriTLSResultsValid;
  *((_BYTE *)v4 + 14) = self->_seenSpecificAcFailure;
  v4[16] = self->_trafficClassBEAttemptedSmall;
  v4[17] = self->_trafficClassBKAttemptedSmall;
  v4[18] = self->_trafficClassVOAttemptedSmall;
  v4[19] = self->_trafficClassVIAttemptedSmall;
  v4[20] = self->_trafficClassBESucceededSmall;
  v4[21] = self->_trafficClassBKSucceededSmall;
  v4[22] = self->_trafficClassVOSucceededSmall;
  v4[23] = self->_trafficClassVISucceededSmall;
  v4[24] = self->_trafficClassBEAttemptedLarge;
  v4[25] = self->_trafficClassBKAttemptedLarge;
  v4[26] = self->_trafficClassVOAttemptedLarge;
  v4[27] = self->_trafficClassVIAttemptedLarge;
  v4[28] = self->_trafficClassBESucceededLarge;
  v4[29] = self->_trafficClassBKSucceededLarge;
  v4[30] = self->_trafficClassVOSucceededLarge;
  v4[31] = self->_trafficClassVISucceededLarge;
  v4[32] = self->_siriTrafficClass;
  *((_BYTE *)v4 + 17) = self->_siriTCPSuccess;
  *((_BYTE *)v4 + 18) = self->_siriTLSSuccess;
  v7 = -[NSString copy](self->_gatewayAddress, "copy");
  v8 = (void *)v4[33];
  v4[33] = v7;

  v9 = -[NSMutableSet copy](self->_dnsServers, "copy");
  v10 = (void *)v4[34];
  v4[34] = v9;

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)backhaulThroughput
{
  return self->_backhaulThroughput;
}

- (void)setBackhaulThroughput:(double)a3
{
  self->_backhaulThroughput = a3;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)gatewayMinRTT
{
  return self->_gatewayMinRTT;
}

- (void)setGatewayMinRTT:(int64_t)a3
{
  self->_gatewayMinRTT = a3;
}

- (int64_t)gatewayMaxRTT
{
  return self->_gatewayMaxRTT;
}

- (void)setGatewayMaxRTT:(int64_t)a3
{
  self->_gatewayMaxRTT = a3;
}

- (int64_t)gatewayPacketLoss
{
  return self->_gatewayPacketLoss;
}

- (void)setGatewayPacketLoss:(int64_t)a3
{
  self->_gatewayPacketLoss = a3;
}

- (int64_t)localDNSMinRTT
{
  return self->_localDNSMinRTT;
}

- (void)setLocalDNSMinRTT:(int64_t)a3
{
  self->_localDNSMinRTT = a3;
}

- (int64_t)localDNSMaxRTT
{
  return self->_localDNSMaxRTT;
}

- (void)setLocalDNSMaxRTT:(int64_t)a3
{
  self->_localDNSMaxRTT = a3;
}

- (int64_t)localDNSPacketLoss
{
  return self->_localDNSPacketLoss;
}

- (void)setLocalDNSPacketLoss:(int64_t)a3
{
  self->_localDNSPacketLoss = a3;
}

- (int64_t)publicDNSMinRTT
{
  return self->_publicDNSMinRTT;
}

- (void)setPublicDNSMinRTT:(int64_t)a3
{
  self->_publicDNSMinRTT = a3;
}

- (int64_t)publicDNSMaxRTT
{
  return self->_publicDNSMaxRTT;
}

- (void)setPublicDNSMaxRTT:(int64_t)a3
{
  self->_publicDNSMaxRTT = a3;
}

- (int64_t)publicDNSPacketLoss
{
  return self->_publicDNSPacketLoss;
}

- (void)setPublicDNSPacketLoss:(int64_t)a3
{
  self->_publicDNSPacketLoss = a3;
}

- (BOOL)dnsSuccess
{
  return self->_dnsSuccess;
}

- (void)setDnsSuccess:(BOOL)a3
{
  self->_dnsSuccess = a3;
}

- (BOOL)backhaulResultsValid
{
  return self->_backhaulResultsValid;
}

- (void)setBackhaulResultsValid:(BOOL)a3
{
  self->_backhaulResultsValid = a3;
}

- (BOOL)gatewayResultsValid
{
  return self->_gatewayResultsValid;
}

- (void)setGatewayResultsValid:(BOOL)a3
{
  self->_gatewayResultsValid = a3;
}

- (BOOL)localResultsValid
{
  return self->_localResultsValid;
}

- (void)setLocalResultsValid:(BOOL)a3
{
  self->_localResultsValid = a3;
}

- (BOOL)publicResultsValid
{
  return self->_publicResultsValid;
}

- (void)setPublicResultsValid:(BOOL)a3
{
  self->_publicResultsValid = a3;
}

- (BOOL)dnsResultsValid
{
  return self->_dnsResultsValid;
}

- (void)setDnsResultsValid:(BOOL)a3
{
  self->_dnsResultsValid = a3;
}

- (BOOL)seenSpecificAcFailure
{
  return self->_seenSpecificAcFailure;
}

- (void)setSeenSpecificAcFailure:(BOOL)a3
{
  self->_seenSpecificAcFailure = a3;
}

- (int64_t)trafficClassBEAttemptedSmall
{
  return self->_trafficClassBEAttemptedSmall;
}

- (void)setTrafficClassBEAttemptedSmall:(int64_t)a3
{
  self->_trafficClassBEAttemptedSmall = a3;
}

- (int64_t)trafficClassBKAttemptedSmall
{
  return self->_trafficClassBKAttemptedSmall;
}

- (void)setTrafficClassBKAttemptedSmall:(int64_t)a3
{
  self->_trafficClassBKAttemptedSmall = a3;
}

- (int64_t)trafficClassVOAttemptedSmall
{
  return self->_trafficClassVOAttemptedSmall;
}

- (void)setTrafficClassVOAttemptedSmall:(int64_t)a3
{
  self->_trafficClassVOAttemptedSmall = a3;
}

- (int64_t)trafficClassVIAttemptedSmall
{
  return self->_trafficClassVIAttemptedSmall;
}

- (void)setTrafficClassVIAttemptedSmall:(int64_t)a3
{
  self->_trafficClassVIAttemptedSmall = a3;
}

- (int64_t)trafficClassBESucceededSmall
{
  return self->_trafficClassBESucceededSmall;
}

- (void)setTrafficClassBESucceededSmall:(int64_t)a3
{
  self->_trafficClassBESucceededSmall = a3;
}

- (int64_t)trafficClassBKSucceededSmall
{
  return self->_trafficClassBKSucceededSmall;
}

- (void)setTrafficClassBKSucceededSmall:(int64_t)a3
{
  self->_trafficClassBKSucceededSmall = a3;
}

- (int64_t)trafficClassVOSucceededSmall
{
  return self->_trafficClassVOSucceededSmall;
}

- (void)setTrafficClassVOSucceededSmall:(int64_t)a3
{
  self->_trafficClassVOSucceededSmall = a3;
}

- (int64_t)trafficClassVISucceededSmall
{
  return self->_trafficClassVISucceededSmall;
}

- (void)setTrafficClassVISucceededSmall:(int64_t)a3
{
  self->_trafficClassVISucceededSmall = a3;
}

- (int64_t)trafficClassBEAttemptedLarge
{
  return self->_trafficClassBEAttemptedLarge;
}

- (void)setTrafficClassBEAttemptedLarge:(int64_t)a3
{
  self->_trafficClassBEAttemptedLarge = a3;
}

- (int64_t)trafficClassBKAttemptedLarge
{
  return self->_trafficClassBKAttemptedLarge;
}

- (void)setTrafficClassBKAttemptedLarge:(int64_t)a3
{
  self->_trafficClassBKAttemptedLarge = a3;
}

- (int64_t)trafficClassVOAttemptedLarge
{
  return self->_trafficClassVOAttemptedLarge;
}

- (void)setTrafficClassVOAttemptedLarge:(int64_t)a3
{
  self->_trafficClassVOAttemptedLarge = a3;
}

- (int64_t)trafficClassVIAttemptedLarge
{
  return self->_trafficClassVIAttemptedLarge;
}

- (void)setTrafficClassVIAttemptedLarge:(int64_t)a3
{
  self->_trafficClassVIAttemptedLarge = a3;
}

- (int64_t)trafficClassBESucceededLarge
{
  return self->_trafficClassBESucceededLarge;
}

- (void)setTrafficClassBESucceededLarge:(int64_t)a3
{
  self->_trafficClassBESucceededLarge = a3;
}

- (int64_t)trafficClassBKSucceededLarge
{
  return self->_trafficClassBKSucceededLarge;
}

- (void)setTrafficClassBKSucceededLarge:(int64_t)a3
{
  self->_trafficClassBKSucceededLarge = a3;
}

- (int64_t)trafficClassVOSucceededLarge
{
  return self->_trafficClassVOSucceededLarge;
}

- (void)setTrafficClassVOSucceededLarge:(int64_t)a3
{
  self->_trafficClassVOSucceededLarge = a3;
}

- (int64_t)trafficClassVISucceededLarge
{
  return self->_trafficClassVISucceededLarge;
}

- (void)setTrafficClassVISucceededLarge:(int64_t)a3
{
  self->_trafficClassVISucceededLarge = a3;
}

- (int64_t)siriTrafficClass
{
  return self->_siriTrafficClass;
}

- (void)setSiriTrafficClass:(int64_t)a3
{
  self->_siriTrafficClass = a3;
}

- (BOOL)siriTCPResultsValid
{
  return self->_siriTCPResultsValid;
}

- (void)setSiriTCPResultsValid:(BOOL)a3
{
  self->_siriTCPResultsValid = a3;
}

- (BOOL)siriTLSResultsValid
{
  return self->_siriTLSResultsValid;
}

- (void)setSiriTLSResultsValid:(BOOL)a3
{
  self->_siriTLSResultsValid = a3;
}

- (BOOL)siriTCPSuccess
{
  return self->_siriTCPSuccess;
}

- (void)setSiriTCPSuccess:(BOOL)a3
{
  self->_siriTCPSuccess = a3;
}

- (BOOL)siriTLSSuccess
{
  return self->_siriTLSSuccess;
}

- (void)setSiriTLSSuccess:(BOOL)a3
{
  self->_siriTLSSuccess = a3;
}

- (NSString)gatewayAddress
{
  return self->_gatewayAddress;
}

- (void)setGatewayAddress:(id)a3
{
  objc_storeStrong((id *)&self->_gatewayAddress, a3);
}

- (NSMutableSet)dnsServers
{
  return self->_dnsServers;
}

- (void)setDnsServers:(id)a3
{
  objc_storeStrong((id *)&self->_dnsServers, a3);
}

- (BOOL)siriACEResultsValid
{
  return self->_siriACEResultsValid;
}

- (void)setSiriACEResultsValid:(BOOL)a3
{
  self->_siriACEResultsValid = a3;
}

- (BOOL)siriACESuccess
{
  return self->_siriACESuccess;
}

- (void)setSiriACESuccess:(BOOL)a3
{
  self->_siriACESuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsServers, 0);
  objc_storeStrong((id *)&self->_gatewayAddress, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
}

@end
