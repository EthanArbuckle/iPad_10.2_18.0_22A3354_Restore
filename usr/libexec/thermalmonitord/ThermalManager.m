@implementation ThermalManager

- (BOOL)useTcalAdjust:(unsigned int)a3
{
  return -[CommonProduct useTcalAdjust:](self->product, "useTcalAdjust:", *(_QWORD *)&a3);
}

- (void)updateSystemLoad:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  v3 = a3;
  -[CommonProduct updateAllThermalLoad:](self->product, "updateAllThermalLoad:");
  if (byte_10009A1F0)
    -[CommonProduct updateDisplayDriver:](self->product, "updateDisplayDriver:", v3);
  if (-[HidSensors isSending2DTempGridToDisplayDriverEnabled](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "isSending2DTempGridToDisplayDriverEnabled"))
  {
    v5 = byte_10009A1F0 == 0;
  }
  else
  {
    v5 = 1;
  }
  if (!v5)
    -[CommonProduct send2DGridTempsToDisplayDriver:](self->product, "send2DGridTempsToDisplayDriver:", -[CommonProduct compute2DGridTemps](self->product, "compute2DGridTemps"));
  if (-[CommonProduct isSendingMaxTempToDisplayDriverEnabled](self->product, "isSendingMaxTempToDisplayDriverEnabled")
    && byte_10009A1F0)
  {
    v6 = -[CommonProduct computeMaxCGTemp](self->product, "computeMaxCGTemp");
    v7 = dword_10009A3A0 - v6;
    if (dword_10009A3A0 - (int)v6 < 0)
      v7 = v6 - dword_10009A3A0;
    if (v7 >= 0x33)
    {
      dword_10009A3A0 = v6;
      -[CommonProduct sendMaxTempToDisplayDriver:](self->product, "sendMaxTempToDisplayDriver:", v6);
    }
  }
  if (sub_1000038C4())
    -[CommonProduct predictSignal](self->product, "predictSignal");
  -[CommonProduct updateAccessories:](self->product, "updateAccessories:", v3);
  if (dword_10009A39C == 1)
  {
    -[CommonProduct updateLifetimeServo](self->product, "updateLifetimeServo");
    dword_10009A39C = 0;
  }
  -[CommonProduct updateContextualClamp](self->product, "updateContextualClamp");
  -[CommonProduct updatePowerzoneTelemetry](self->product, "updatePowerzoneTelemetry");
  v8 = dword_10009A398;
  if (dword_10009A398 == 120)
  {
    -[CommonProduct updateCoreAnalyticsInfo](self->product, "updateCoreAnalyticsInfo");
    v8 = 0;
  }
  dword_10009A398 = v8 + 1;
  ++dword_10009A39C;
}

- (void)probeAllSupervisorControlLoadingIndex
{
  -[CommonProduct probeAllSupervisorControlLoadingIndex](self->product, "probeAllSupervisorControlLoadingIndex");
}

- (void)hintComponentControlTakeAction
{
  -[CommonProduct tryTakeAction](self->product, "tryTakeAction");
}

- (__CFString)getTGraphData:(int)a3
{
  return -[TGraphSampler getTGraphData:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "getTGraphData:", *(_QWORD *)&a3);
}

- (int)desiredLoopInterval
{
  return -[CommonProduct desiredLoopInterval](self->product, "desiredLoopInterval");
}

- (ThermalManager)initWithConfig:(__CFDictionary *)a3
{
  ThermalManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ThermalManager;
  result = -[ThermalManager init](&v5, "init");
  if (result)
  {
    result->product = 0;
    result->_plistConfig = a3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ThermalManager;
  -[ThermalManager dealloc](&v3, "dealloc");
}

- (void)createConnectionToCT
{
  -[CommonProduct createConnectionToCT](self->product, "createConnectionToCT");
}

- (void)createNewProduct:(__CFRunLoop *)a3
{
  int productName;
  __objc2_class **v4;
  int v5;
  int v6;
  int v7;
  int v8;

  self->localMainRunloop = a3;
  productName = self->productName;
  if (productName > 14731679)
  {
    if (productName <= 17151999)
    {
      if (productName > 15865519)
      {
        if (productName > 16500799)
        {
          if (productName <= 16826399)
          {
            if (productName > 16800719)
            {
              if (productName == 16800720)
              {
                v4 = off_10007C700;
              }
              else
              {
                if (productName != 16822000)
                  return;
                v4 = off_10007C688;
              }
            }
            else if (productName == 16500800)
            {
              v4 = off_10007C780;
            }
            else
            {
              if (productName != 16796240)
                return;
              v4 = off_10007C5E0;
            }
            goto LABEL_265;
          }
          if (productName <= 17132239)
          {
            if (productName != 16826400)
            {
              if (productName != 17127760)
                return;
              v4 = off_10007C760;
              goto LABEL_265;
            }
LABEL_210:
            v4 = off_10007C630;
            goto LABEL_265;
          }
          if (productName != 17132240)
          {
            if (productName != 17147600)
              return;
            v4 = &off_10007C860;
            goto LABEL_265;
          }
LABEL_230:
          v4 = off_10007C5F0;
          goto LABEL_265;
        }
        if (productName > 16155599)
        {
          if (productName <= 16210959)
          {
            if (productName == 16155600)
            {
              v4 = off_10007C798;
              goto LABEL_265;
            }
            if (productName != 16189200)
              return;
LABEL_221:
            v4 = off_10007C7E0;
            goto LABEL_265;
          }
          if (productName != 16210960)
          {
            if (productName != 16496400)
              return;
            v4 = off_10007C5C8;
            goto LABEL_265;
          }
LABEL_227:
          v4 = off_10007C730;
          goto LABEL_265;
        }
        if (productName != 15865520)
        {
          if (productName != 15893200)
          {
            v8 = 16104400;
            goto LABEL_216;
          }
LABEL_225:
          v4 = off_10007C628;
          goto LABEL_265;
        }
LABEL_219:
        v4 = off_10007C5B0;
        goto LABEL_265;
      }
      if (productName <= 15018799)
      {
        if (productName > 14973519)
        {
          if (productName <= 14994604)
          {
            if (productName == 14973520)
            {
              v4 = off_10007C668;
            }
            else
            {
              if (productName != 14991360)
                return;
              v4 = off_10007C650;
            }
            goto LABEL_265;
          }
          if (productName != 14994605)
          {
            v7 = 14995280;
            goto LABEL_170;
          }
LABEL_224:
          v4 = off_10007C830;
          goto LABEL_265;
        }
        if (productName != 14731680)
        {
          if (productName == 14733200)
          {
            v4 = off_10007C828;
          }
          else
          {
            if (productName != 14969680)
              return;
            v4 = off_10007C6A8;
          }
          goto LABEL_265;
        }
LABEL_220:
        v4 = off_10007C810;
        goto LABEL_265;
      }
      if (productName <= 15285359)
      {
        switch(productName)
        {
          case 15018800:
            v4 = off_10007C7B8;
            break;
          case 15025200:
            v4 = off_10007C858;
            break;
          case 15281440:
            v4 = off_10007C838;
            break;
          default:
            return;
        }
        goto LABEL_265;
      }
      if (productName <= 15541839)
      {
        if (productName == 15285360)
        {
          v4 = off_10007C720;
        }
        else
        {
          if (productName != 15325200)
            return;
          v4 = off_10007C618;
        }
        goto LABEL_265;
      }
      if (productName != 15541840)
      {
        if (productName != 15826000)
          return;
        v4 = off_10007C640;
        goto LABEL_265;
      }
LABEL_228:
      v4 = off_10007C5B8;
      goto LABEL_265;
    }
    if (productName > 18122319)
    {
      if (productName > 30122399)
      {
        if (productName <= 32305999)
        {
          if (productName <= 32144719)
          {
            if (productName != 30122400)
            {
              v5 = 32135760;
              goto LABEL_166;
            }
LABEL_193:
            v4 = off_10007C768;
            goto LABEL_265;
          }
          if (productName != 32144720)
          {
            if (productName != 32298160)
              return;
            v4 = off_10007C808;
            goto LABEL_265;
          }
LABEL_206:
          v4 = off_10007C648;
          goto LABEL_265;
        }
        if (productName <= 32762959)
        {
          if (productName == 32306000)
          {
            v4 = off_10007C670;
            goto LABEL_265;
          }
          if (productName != 32754000)
            return;
          goto LABEL_193;
        }
        if (productName != 32762960)
        {
          v8 = 1803554640;
          goto LABEL_216;
        }
LABEL_231:
        v4 = off_10007C820;
        goto LABEL_265;
      }
      if (productName <= 18135759)
      {
        if (productName == 18122320)
        {
          v4 = off_10007C6F8;
          goto LABEL_265;
        }
        if (productName != 18126800)
        {
          if (productName != 18128800)
            return;
          v4 = off_10007C7F0;
          goto LABEL_265;
        }
        goto LABEL_220;
      }
      if (productName <= 18458319)
      {
        if (productName == 18135760)
        {
          v4 = off_10007C848;
          goto LABEL_265;
        }
        if (productName != 18450400)
          return;
        goto LABEL_224;
      }
      if (productName == 18458320)
      {
        v4 = off_10007C7F8;
        goto LABEL_265;
      }
      v6 = 30114160;
      goto LABEL_188;
    }
    if (productName <= 17790799)
    {
      if (productName <= 17463759)
      {
        switch(productName)
        {
          case 17152000:
            v4 = off_10007C770;
            break;
          case 17331600:
            v4 = off_10007C5C0;
            break;
          case 17459280:
            v4 = off_10007C7C8;
            break;
          default:
            return;
        }
        goto LABEL_265;
      }
      if (productName <= 17477599)
      {
        if (productName == 17463760)
        {
          v4 = off_10007C600;
        }
        else
        {
          if (productName != 17473200)
            return;
          v4 = off_10007C680;
        }
        goto LABEL_265;
      }
      if (productName != 17477600)
      {
        if (productName != 17486400)
          return;
        v4 = off_10007C818;
        goto LABEL_265;
      }
      goto LABEL_226;
    }
    if (productName > 17803199)
    {
      if (productName > 17811999)
      {
        if (productName == 17812000)
        {
          v4 = off_10007C6B8;
        }
        else
        {
          if (productName != 17938000)
            return;
          v4 = off_10007C6E8;
        }
        goto LABEL_265;
      }
      if (productName != 17803200)
      {
        if (productName != 17804240)
          return;
        v4 = off_10007C690;
        goto LABEL_265;
      }
      goto LABEL_223;
    }
    if (productName == 17790800)
    {
      v4 = off_10007C738;
      goto LABEL_265;
    }
    if (productName != 17795280)
    {
      if (productName != 17798800)
        return;
      v4 = off_10007C620;
      goto LABEL_265;
    }
    goto LABEL_222;
  }
  if (productName <= 11938759)
  {
    if (productName <= 242074)
    {
      if (productName <= 233234)
      {
        if (productName <= 224719)
        {
          switch(productName)
          {
            case 220170:
              v4 = off_10007C6B0;
              break;
            case 220235:
              v4 = off_10007C608;
              break;
            case 224655:
              v4 = off_10007C6D0;
              break;
            default:
              return;
          }
          goto LABEL_265;
        }
        if (productName <= 229139)
        {
          if (productName == 224720)
          {
            v4 = off_10007C7A8;
          }
          else
          {
            if (productName != 229075)
              return;
            v4 = off_10007C790;
          }
          goto LABEL_265;
        }
        if (productName == 229140)
        {
          v4 = off_10007C660;
          goto LABEL_265;
        }
        v5 = 233170;
        goto LABEL_166;
      }
      if (productName <= 233624)
      {
        if (productName != 233235)
        {
          if (productName == 233495)
          {
            v4 = off_10007C708;
          }
          else
          {
            if (productName != 233560)
              return;
            v4 = off_10007C800;
          }
          goto LABEL_265;
        }
        goto LABEL_206;
      }
      if (productName > 237654)
      {
        if (productName == 237655)
          goto LABEL_193;
        if (productName != 237720)
          return;
        goto LABEL_231;
      }
      if (productName == 233625)
      {
        v4 = off_10007C638;
        goto LABEL_265;
      }
      v6 = 237590;
LABEL_188:
      if (productName != v6)
        return;
      v4 = off_10007C750;
      goto LABEL_265;
    }
    if (productName <= 255334)
    {
      if (productName <= 246559)
      {
        switch(productName)
        {
          case 242075:
            v4 = off_10007C788;
            break;
          case 242140:
            v4 = off_10007C698;
            break;
          case 246495:
            v4 = off_10007C778;
            break;
          default:
            return;
        }
      }
      else if (productName > 250914)
      {
        if (productName == 250915)
        {
          v4 = off_10007C5F8;
        }
        else
        {
          if (productName != 250980)
            return;
          v4 = off_10007C758;
        }
      }
      else if (productName == 246560)
      {
        v4 = off_10007C6A0;
      }
      else
      {
        if (productName != 246885)
          return;
        v4 = off_10007C7A0;
      }
      goto LABEL_265;
    }
    if (productName <= 11215374)
    {
      switch(productName)
      {
        case 255335:
          v4 = off_10007C6F0;
          break;
        case 255400:
          v4 = off_10007C678;
          break;
        case 300055:
          v4 = off_10007C840;
          break;
        default:
          return;
      }
      goto LABEL_265;
    }
    if (productName > 11431954)
    {
      if (productName != 11431955)
      {
        if (productName != 11730370)
          return;
        v4 = off_10007C7D8;
        goto LABEL_265;
      }
      goto LABEL_206;
    }
    if (productName != 11215375)
    {
      v5 = 11428770;
LABEL_166:
      if (productName != v5)
        return;
      goto LABEL_167;
    }
    goto LABEL_229;
  }
  if (productName <= 14062319)
  {
    if (productName <= 13087959)
    {
      if (productName > 12631399)
      {
        if (productName <= 12916879)
        {
          if (productName != 12631400)
          {
            if (productName != 12894390)
              return;
            goto LABEL_219;
          }
          goto LABEL_228;
        }
        if (productName == 12916880)
          goto LABEL_225;
        v8 = 13083865;
LABEL_216:
        if (productName != v8)
          return;
        goto LABEL_217;
      }
      if (productName != 11938760)
      {
        if (productName == 11969635)
        {
          v4 = off_10007C5D8;
          goto LABEL_265;
        }
        v7 = 12187320;
LABEL_170:
        if (productName != v7)
          return;
        v4 = off_10007C740;
        goto LABEL_265;
      }
LABEL_218:
      v4 = off_10007C710;
      goto LABEL_265;
    }
    if (productName <= 13675104)
    {
      if (productName != 13087960)
      {
        if (productName == 13157380)
          goto LABEL_221;
        if (productName != 13175060)
          return;
        goto LABEL_227;
      }
LABEL_217:
      v4 = off_10007C6C8;
      goto LABEL_265;
    }
    if (productName <= 13799679)
    {
      if (productName != 13675105)
      {
        if (productName != 13795760)
          return;
        v4 = off_10007C748;
        goto LABEL_265;
      }
      goto LABEL_210;
    }
    if (productName != 13799680)
    {
      if (productName == 13923600)
        goto LABEL_230;
      return;
    }
LABEL_229:
    v4 = off_10007C6C0;
    goto LABEL_265;
  }
  if (productName <= 14438639)
  {
    if (productName <= 14204204)
    {
      if (productName == 14062320)
      {
LABEL_167:
        v4 = off_10007C5D0;
LABEL_265:
        self->product = (CommonProduct *)objc_msgSend(objc_alloc(*v4), "initProduct:", self);
        return;
      }
      if (productName != 14066240)
      {
        if (productName != 14121040)
          return;
        v4 = off_10007C610;
        goto LABEL_265;
      }
      goto LABEL_206;
    }
    if (productName > 14415119)
    {
      if (productName == 14415120)
      {
        v4 = off_10007C7D0;
      }
      else
      {
        if (productName != 14434720)
          return;
        v4 = off_10007C5E8;
      }
      goto LABEL_265;
    }
    if (productName != 14204205)
    {
      if (productName != 14401360)
        return;
      v4 = off_10007C7C0;
      goto LABEL_265;
    }
LABEL_226:
    v4 = off_10007C658;
    goto LABEL_265;
  }
  if (productName > 14689359)
  {
    if (productName > 14724799)
    {
      if (productName == 14724800)
      {
        v4 = off_10007C6D8;
      }
      else
      {
        if (productName != 14729200)
          return;
        v4 = off_10007C718;
      }
      goto LABEL_265;
    }
    if (productName != 14689360)
    {
      if (productName != 14701280)
        return;
      v4 = off_10007C7B0;
      goto LABEL_265;
    }
    goto LABEL_218;
  }
  if (productName > 14468754)
  {
    if (productName != 14468755)
    {
      if (productName != 14685520)
        return;
      v4 = off_10007C728;
      goto LABEL_265;
    }
LABEL_223:
    v4 = off_10007C7E8;
    goto LABEL_265;
  }
  if (productName == 14438640)
  {
    v4 = off_10007C850;
    goto LABEL_265;
  }
  if (productName == 14462320)
  {
LABEL_222:
    v4 = off_10007C6E0;
    goto LABEL_265;
  }
}

- (void)getConfigurationFor:(__CFString *)a3
{
  return (void *)CFDictionaryGetValue(self->_plistConfig, a3);
}

- (int)getProductCalibrationDefault
{
  return -[CommonProduct calibrationResistorTempDefault](self->product, "calibrationResistorTempDefault");
}

- (int)getProductCalibrationSensorID
{
  return -[CommonProduct calibrationResistorSensor](self->product, "calibrationResistorSensor");
}

- (unsigned)getRequiredCalibrationResistorSamples
{
  return -[CommonProduct requiredCalibrationResistorSamples](self->product, "requiredCalibrationResistorSamples");
}

- (unint64_t)getMaxSensorValue
{
  return -[CommonProduct getMaxSensorValue](self->product, "getMaxSensorValue");
}

- (iir_filter_t)getProductFilterValues
{
  return -[CommonProduct getFilterValues](self->product, "getFilterValues");
}

- (int)getProductTotalSensors
{
  return -[CommonProduct totalSensors](self->product, "totalSensors");
}

- (int)getProductTotalPowerSensors
{
  return -[CommonProduct powerSensors](self->product, "powerSensors");
}

- (void)initializeReadPrefs:(__SCPreferences *)a3
{
  -[CommonProduct getAllComponentID:](self->product, "getAllComponentID:", a3);
}

- (void)SaveProductString:(int)a3
{
  self->productName = a3;
}

- (int)getModeratePressureVersion
{
  return -[CommonProduct getModeratePressureVersion](self->product, "getModeratePressureVersion");
}

- (void)updatePrefs:(__SCPreferences *)a3 :(BOOL)a4
{
  CFBooleanRef Value;
  int v7;
  const __CFBoolean *v8;
  NSObject *v9;
  const char *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFTypeID v13;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v15;
  NSObject *v16;
  const __CFNumber *v17;
  CFNumberRef v18;
  CFBooleanRef v19;
  int v20;
  const __CFBoolean *v21;
  NSObject *v22;
  const char *v23;
  const __CFArray *v24;
  const __CFArray *v25;
  CFTypeID v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  NSObject *v29;
  const __CFArray *v30;
  const __CFArray *v31;
  CFTypeID v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  NSObject *v35;
  const __CFArray *v36;
  const __CFArray *v37;
  CFTypeID v38;
  const __CFNumber *v39;
  const __CFNumber *v40;
  NSObject *v41;
  const __CFArray *v42;
  const __CFArray *v43;
  CFTypeID v44;
  const __CFNumber *v45;
  const __CFNumber *v46;
  NSObject *v47;
  const __CFNumber *v48;
  const __CFNumber *v49;
  CFTypeID v50;
  NSObject *v51;
  const __CFNumber *v52;
  const __CFNumber *v53;
  CFTypeID v54;
  const __CFNumber *v55;
  const __CFNumber *v56;
  CFTypeID v57;
  CFBooleanRef v58;
  int v59;
  const __CFBoolean *v60;
  NSObject *v61;
  const char *v62;
  const __CFDictionary *v63;
  io_service_t MatchingService;
  io_registry_entry_t v65;
  const __CFNumber *v66;
  const __CFNumber *v67;
  CFTypeID v68;
  CFNumberRef v69;
  CFNumberRef v70;
  kern_return_t v71;
  int v72;
  kern_return_t v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  const __CFNumber *v77;
  const __CFNumber *v78;
  CFTypeID v79;
  const __CFNumber *v80;
  const __CFNumber *v81;
  CFTypeID v82;
  const __CFNumber *v83;
  const __CFNumber *v84;
  CFTypeID v85;
  const __CFNumber *v86;
  const __CFNumber *v87;
  CFTypeID v88;
  const __CFNumber *v89;
  const __CFNumber *v90;
  CFTypeID v91;
  const __CFNumber *v92;
  const __CFNumber *v93;
  CFTypeID v94;
  const __CFNumber *v95;
  const __CFNumber *v96;
  CFTypeID v97;
  uint64_t v98;
  unsigned int valuePtr;
  uint8_t buf[4];
  _QWORD v101[2];

  sub_10002EBCC(a3, (uint64_t)self, a4);
  Value = (CFBooleanRef)SCPreferencesGetValue(a3, CFSTR("overrideSensorLI"));
  v7 = Value == kCFBooleanTrue;
  byte_1000A2DC1 = Value == kCFBooleanTrue;
  if (byte_1000A2480)
  {
    v8 = Value;
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "dis";
      if (v8 == kCFBooleanTrue)
        v10 = "en";
      *(_DWORD *)buf = 136315138;
      v101[0] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status thermalOverrideLoadingIndex %sabled", buf, 0xCu);
      v7 = byte_1000A2DC1;
    }
  }
  if (v7)
  {
    v11 = (const __CFArray *)SCPreferencesGetValue(a3, CFSTR("setSensorLI"));
    if (v11)
    {
      v12 = v11;
      v13 = CFGetTypeID(v11);
      if (v13 == CFArrayGetTypeID() && CFArrayGetCount(v12) == 2)
      {
        LODWORD(v98) = 0;
        valuePtr = 0;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 0);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v98);
        v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 1);
        CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
        if (byte_1000A2480)
        {
          v16 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            LODWORD(v101[0]) = v98;
            WORD2(v101[0]) = 1024;
            *(_DWORD *)((char *)v101 + 6) = valuePtr;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Component ID: %d with loading index of %d", buf, 0xEu);
          }
        }
        -[CommonProduct updateMaxLIFor::](self->product, "updateMaxLIFor::", v98, valuePtr, v98);
        SCPreferencesRemoveValue(a3, CFSTR("setSensorLI"));
      }
    }
    byte_1000A2DC1 = 0;
  }
  if (SCPreferencesGetValue(a3, CFSTR("removeOverrideSensorLI")) == kCFBooleanTrue)
  {
    -[CommonProduct clearLoadingIndexOverrides](self->product, "clearLoadingIndexOverrides");
    SCPreferencesRemoveValue(a3, CFSTR("removeOverrideSensorLI"));
    SCPreferencesRemoveValue(a3, CFSTR("overrideSensorLI"));
    SCPreferencesCommitChanges(a3);
  }
  v17 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("currentComponent"));
  if (v17)
  {
    *(_DWORD *)buf = 0;
    CFNumberGetValue(v17, kCFNumberIntType, buf);
    SCPreferencesRemoveValue(a3, CFSTR("currentComponent"));
    LODWORD(v98) = 0;
    LODWORD(v98) = -[CommonProduct getCurrentMaxLIForComponent:](self->product, "getCurrentMaxLIForComponent:", *(unsigned int *)buf, v98);
    v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v98);
    SCPreferencesSetValue(a3, CFSTR("getCurrentLI"), v18);
    SCPreferencesCommitChanges(a3);
    CFRelease(v18);
  }
  v19 = (CFBooleanRef)SCPreferencesGetValue(a3, CFSTR("overrideControlEffort"));
  v20 = v19 == kCFBooleanTrue;
  byte_1000A2DC2 = v19 == kCFBooleanTrue;
  if (byte_1000A2480)
  {
    v21 = v19;
    v22 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "dis";
      if (v21 == kCFBooleanTrue)
        v23 = "en";
      *(_DWORD *)buf = 136315138;
      v101[0] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status thermalOverrideControlEffort %sabled", buf, 0xCu);
      v20 = byte_1000A2DC2;
    }
  }
  if (v20)
  {
    v24 = (const __CFArray *)SCPreferencesGetValue(a3, CFSTR("setSensorControlEffort"));
    if (v24)
    {
      v25 = v24;
      v26 = CFGetTypeID(v24);
      if (v26 == CFArrayGetTypeID() && CFArrayGetCount(v25) == 2)
      {
        LODWORD(v98) = 0;
        valuePtr = 0;
        v27 = (const __CFNumber *)CFArrayGetValueAtIndex(v25, 0);
        CFNumberGetValue(v27, kCFNumberIntType, &v98);
        v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v25, 1);
        CFNumberGetValue(v28, kCFNumberIntType, &valuePtr);
        if (byte_1000A2480)
        {
          v29 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            LODWORD(v101[0]) = v98;
            WORD2(v101[0]) = 1024;
            *(_DWORD *)((char *)v101 + 6) = valuePtr;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Component ID: %d with control effort of %d", buf, 0xEu);
          }
        }
        -[CommonProduct updateControlEffortFor::](self->product, "updateControlEffortFor::", v98, valuePtr);
      }
    }
  }
  else
  {
    -[CommonProduct clearControlEffortOverrides](self->product, "clearControlEffortOverrides");
  }
  v30 = (const __CFArray *)SCPreferencesGetValue(a3, CFSTR("hotSpotPIDTargetKey"));
  if (v30)
  {
    v31 = v30;
    v32 = CFGetTypeID(v30);
    if (v32 == CFArrayGetTypeID() && CFArrayGetCount(v31) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      v33 = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 0);
      CFNumberGetValue(v33, kCFNumberIntType, &v98);
      v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 1);
      CFNumberGetValue(v34, kCFNumberIntType, &valuePtr);
      if (byte_1000A2480)
      {
        v35 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Hotspot PID Target ID: %d with Target of %d", buf, 0xEu);
        }
      }
      -[CommonProduct updateHotSpotPIDTargetFor::](self->product, "updateHotSpotPIDTargetFor::", v98, valuePtr);
      if (SCPreferencesGetValue(a3, CFSTR("hotSpotPIDTargetKeyPersistentlyEnabled")) != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, CFSTR("hotSpotPIDTargetKey"));
        SCPreferencesCommitChanges(a3);
      }
    }
  }
  if (SCPreferencesGetValue(a3, CFSTR("removeHotspotTargetOverrides")) == kCFBooleanTrue)
  {
    -[CommonProduct removeHotspotTargetOverrides](self->product, "removeHotspotTargetOverrides");
    SCPreferencesRemoveValue(a3, CFSTR("removeHotspotTargetOverrides"));
    SCPreferencesCommitChanges(a3);
  }
  v36 = (const __CFArray *)SCPreferencesGetValue(a3, CFSTR("trapTarget"));
  if (v36)
  {
    v37 = v36;
    v38 = CFGetTypeID(v36);
    if (v38 == CFArrayGetTypeID() && CFArrayGetCount(v37) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      v39 = (const __CFNumber *)CFArrayGetValueAtIndex(v37, 0);
      CFNumberGetValue(v39, kCFNumberIntType, &v98);
      v40 = (const __CFNumber *)CFArrayGetValueAtIndex(v37, 1);
      CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
      if (byte_1000A2480)
      {
        v41 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Trap Hotspot ID: %d with Target of %d", buf, 0xEu);
        }
      }
      -[CommonProduct updateTrapTargetFor::](self->product, "updateTrapTargetFor::", v98, valuePtr);
      if (SCPreferencesGetValue(a3, CFSTR("trapTargetPersistentlyEnabled")) != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, CFSTR("trapTarget"));
        SCPreferencesCommitChanges(a3);
      }
    }
  }
  v42 = (const __CFArray *)SCPreferencesGetValue(a3, CFSTR("sleepTarget"));
  if (v42)
  {
    v43 = v42;
    v44 = CFGetTypeID(v42);
    if (v44 == CFArrayGetTypeID() && CFArrayGetCount(v43) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      v45 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 0);
      CFNumberGetValue(v45, kCFNumberIntType, &v98);
      v46 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 1);
      CFNumberGetValue(v46, kCFNumberIntType, &valuePtr);
      if (byte_1000A2480)
      {
        v47 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Sleep Hotspot ID: %d with Target of %d", buf, 0xEu);
        }
      }
      -[CommonProduct updateSleepTargetFor::](self->product, "updateSleepTargetFor::", v98, valuePtr);
      if (SCPreferencesGetValue(a3, CFSTR("sleepTargetPersistentlyEnabled")) != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, CFSTR("sleepTarget"));
        SCPreferencesCommitChanges(a3);
      }
    }
  }
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoStateSaveIntervalMinutes"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoDieTempMaxMax"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoDieTempMaxAverage"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoIntegratorState_E"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoInstantaneousAF_E"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoIntegratorState_P"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoInstantaneousAF_P"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoIntegratorState_G"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoInstantaneousAF_G"));
  -[ThermalManager checkForLifetimeServoOverride:key:](self, "checkForLifetimeServoOverride:key:", a3, CFSTR("LifetimeServoDieTempTarget"));
  v48 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kBatteryPercentRemainingKey"));
  if (v48)
  {
    v49 = v48;
    v50 = CFGetTypeID(v48);
    if (v50 == CFNumberGetTypeID())
    {
      LODWORD(v98) = 0;
      CFNumberGetValue(v49, kCFNumberIntType, &v98);
      sub_1000347E0(v98);
      if (byte_1000A2480)
      {
        v51 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v101[0]) = v98;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "<Notice> Battery percent overriden to %d%%", buf, 8u);
        }
      }
    }
    if (SCPreferencesGetValue(a3, CFSTR("kBatteryPercentRemainingKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kBatteryPercentRemainingKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v52 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kBatteryRawGasGaugeSOCKey"));
  if (v52)
  {
    v53 = v52;
    v54 = CFGetTypeID(v52);
    if (v54 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v53, kCFNumberIntType, buf);
      sub_100034AD8(*(unsigned int *)buf);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kBatteryRawGasGaugeSOCKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kBatteryRawGasGaugeSOCKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v55 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kBatteryChemSOCKey"));
  if (v55)
  {
    v56 = v55;
    v57 = CFGetTypeID(v55);
    if (v57 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v56, kCFNumberIntType, buf);
      sub_100034A34(*(int *)buf);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kBatteryChemSOCKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kBatteryChemSOCKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  -[ThermalManager checkForArcOverride:key:](self, "checkForArcOverride:key:", a3, CFSTR("ArcModuleThresholdKey"));
  -[ThermalManager checkForArcOverride:key:](self, "checkForArcOverride:key:", a3, CFSTR("ArcVirtualThresholdKey"));
  v58 = (CFBooleanRef)SCPreferencesGetValue(a3, CFSTR("overrideCameraStrobeMaxLoad"));
  v59 = v58 == kCFBooleanTrue;
  byte_1000A2DC3 = v58 == kCFBooleanTrue;
  if (byte_1000A2480)
  {
    v60 = v58;
    v61 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v62 = "dis";
      if (v60 == kCFBooleanTrue)
        v62 = "en";
      *(_DWORD *)buf = 136315138;
      v101[0] = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "<Notice> Camera strobe override %sabled", buf, 0xCu);
      v59 = byte_1000A2DC3;
    }
  }
  if (v59)
  {
    v63 = IOServiceMatching("AppleDieTempController");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v63);
    if (!MatchingService)
    {
      if (byte_1000A2480)
      {
        v76 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "<Notice> dieTempCtlService is NULL\n", buf, 2u);
        }
      }
      goto LABEL_104;
    }
    v65 = MatchingService;
    v98 = 0;
    v66 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("setCameraStrobeMaxLoad"));
    if (v66)
    {
      v67 = v66;
      v68 = CFGetTypeID(v66);
      if (v68 == CFNumberGetTypeID())
        CFNumberGetValue(v67, kCFNumberSInt64Type, &v98);
    }
    v69 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v98);
    if (!v69)
    {
LABEL_104:
      if (SCPreferencesGetValue(a3, CFSTR("overrideCameraStrobeMaxLoadPersistentlyEnabled")) != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, CFSTR("overrideCameraStrobeMaxLoad"));
        if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F0E8();
      }
      goto LABEL_108;
    }
    v70 = v69;
    v71 = IORegistryEntrySetCFProperty(v65, CFSTR("CameraStrobeMaxLoad"), v69);
    v72 = byte_1000A2480;
    if (v71 && byte_1000A2480)
    {
      v73 = v71;
      v74 = qword_1000A28A0;
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_98;
      *(_DWORD *)buf = 67109120;
      LODWORD(v101[0]) = v73;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "<Notice> IORegistryEntrySetCFProperty returned %d\n", buf, 8u);
      v72 = byte_1000A2480;
    }
    if (!v72)
    {
LABEL_100:
      CFRelease(v70);
      goto LABEL_104;
    }
LABEL_98:
    v75 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v101[0] = v98;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "<Notice> Camera strobe max load overriden to %lld", buf, 0xCu);
    }
    goto LABEL_100;
  }
LABEL_108:
  v77 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kBatteryRaKey"));
  if (v77)
  {
    v78 = v77;
    v79 = CFGetTypeID(v77);
    if (v79 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v78, kCFNumberIntType, buf);
      sub_100035268(*(int *)buf);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kBatteryRaKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kBatteryRaKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v80 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kBatteryWRaKey"));
  if (v80)
  {
    v81 = v80;
    v82 = CFGetTypeID(v80);
    if (v82 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v81, kCFNumberIntType, buf);
      sub_100035320(*(int *)buf);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kBatteryWRaKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kBatteryWRaKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v83 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kBatteryUPOCountKey"));
  if (v83)
  {
    v84 = v83;
    v85 = CFGetTypeID(v83);
    if (v85 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v84, kCFNumberIntType, buf);
      sub_100035560(*(unsigned int *)buf);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kBatteryUPOCountKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kBatteryUPOCountKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v86 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kStepperDisabledKey"));
  if (v86)
  {
    v87 = v86;
    v88 = CFGetTypeID(v86);
    if (v88 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v87, kCFNumberIntType, buf);
      sub_100035578(*(_DWORD *)buf != 0);
    }
    SCPreferencesRemoveValue(a3, CFSTR("kStepperDisabledKey"));
    if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004F0E8();
  }
  v89 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kUseNewMitigationsKey"));
  if (v89)
  {
    v90 = v89;
    v91 = CFGetTypeID(v89);
    if (v91 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v90, kCFNumberIntType, buf);
      sub_100035584(*(_DWORD *)buf == 1);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kUseNewMitigationsPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kUseNewMitigationsKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v92 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kAgingControllerDisabledKey"));
  if (v92)
  {
    v93 = v92;
    v94 = CFGetTypeID(v92);
    if (v94 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v93, kCFNumberIntType, buf);
      sub_1000355A8(*(_DWORD *)buf != 0);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kAgingControllerDisabledPersistentKey")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kAgingControllerDisabledKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
  v95 = (const __CFNumber *)SCPreferencesGetValue(a3, CFSTR("kOnChargerStatusKey"));
  if (v95)
  {
    v96 = v95;
    v97 = CFGetTypeID(v95);
    if (v97 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v96, kCFNumberIntType, buf);
      sub_1000355E8(*(unsigned int *)buf);
    }
    if (SCPreferencesGetValue(a3, CFSTR("kOnChargerStatusKeyPersistentlyEnabled")) != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, CFSTR("kOnChargerStatusKey"));
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004F0E8();
    }
  }
}

- (void)checkForLifetimeServoOverride:(__SCPreferences *)a3 key:(__CFString *)a4
{
  const __CFNumber *Value;
  uint64_t v7;
  const __CFNumber *v8;
  CFTypeID v9;
  unsigned int valuePtr;

  Value = (const __CFNumber *)SCPreferencesGetValue(a3, a4);
  v7 = 0xFFFFFFFFLL;
  valuePtr = -1;
  if (Value)
  {
    v8 = Value;
    v9 = CFGetTypeID(Value);
    if (v9 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
      v7 = valuePtr;
    }
  }
  -[CommonProduct overrideLifetimeServoParam:value:](self->product, "overrideLifetimeServoParam:value:", a4, v7);
}

- (void)checkForArcOverride:(__SCPreferences *)a3 key:(__CFString *)a4
{
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFTypeID v8;
  unsigned int valuePtr;

  Value = (const __CFNumber *)SCPreferencesGetValue(a3, a4);
  if (Value)
  {
    v7 = Value;
    v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
      -[CommonProduct overrideArcParam:value:](self->product, "overrideArcParam:value:", a4, valuePtr);
    }
  }
}

- (void)updateSystemPowerState:(BOOL)a3
{
  -[CommonProduct updateSystemPowerState:](self->product, "updateSystemPowerState:", a3);
}

- (int)canSystemSleep
{
  return -[CommonProduct canSystemSleep](self->product, "canSystemSleep");
}

- (void)initDataCollection
{
  if (self->product)
    -[TGraphSampler setProduct:withComponents:andHotspotSupervisors:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "setProduct:withComponents:andHotspotSupervisors:", self->product, -[CommonProduct listofComponentControl](self->product, "listofComponentControl"), -[CommonProduct listOfSupervisorControl](self->product, "listOfSupervisorControl"));
}

- (int)canaryTempSensorIndex
{
  return -[CommonProduct canaryTempSensorIndex](self->product, "canaryTempSensorIndex");
}

- (int)canaryTempThreshold
{
  return -[CommonProduct canaryTempThreshold](self->product, "canaryTempThreshold");
}

- (void)canaryModeExitEarly:(int)a3
{
  -[CommonProduct canaryModeExitEarly:](self->product, "canaryModeExitEarly:", *(_QWORD *)&a3);
}

- (BOOL)getPotentialForcedThermalPressureLevel
{
  return -[CommonProduct getPotentialForcedThermalPressureLevel](self->product, "getPotentialForcedThermalPressureLevel");
}

- (__CFRunLoop)localMainRunloop
{
  return self->localMainRunloop;
}

@end
