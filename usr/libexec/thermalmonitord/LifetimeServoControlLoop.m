@implementation LifetimeServoControlLoop

- (LifetimeServoControlLoop)initWithParams:(id)a3 perfStateVoltages:(int *)a4 voltageCount:(int)a5 loopType:(int)a6 persistancePath:(__CFString *)a7 filer:(id)a8
{
  uint64_t v10;
  LifetimeServoControlLoop *v14;
  LifetimeServoControlLoop *v15;
  NSObject *v16;
  __CFString **v17;
  const __CFString *v18;
  float v19;
  float v20;
  float v21;
  int64_t v22;
  NSObject *v23;
  int v24;
  __int128 v25;
  float v26;
  NSObject *v27;
  int loopType;
  double r;
  int Lmin;
  int Lmax;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  NSObject *v36;
  int v37;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  int *p_loopType;
  objc_super v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  _BYTE v52[10];
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  double v57;

  v10 = *(_QWORD *)&a6;
  v48.receiver = self;
  v48.super_class = (Class)LifetimeServoControlLoop;
  v14 = -[LifetimeServoControlLoop init](&v48, "init");
  v15 = v14;
  if (v14)
  {
    if (a3)
    {
      v14->_loopType = v10;
      p_loopType = &v14->_loopType;
      if (byte_1000A2480)
      {
        v16 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v50 = v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: init", buf, 8u);
        }
      }
      switch((int)v10)
      {
        case 0:
          v17 = off_10007E1F8;
          v18 = &stru_100081370;
          goto LABEL_14;
        case 1:
          v17 = off_10007E218;
          v18 = CFSTR("_E");
          goto LABEL_14;
        case 2:
          v17 = off_10007E238;
          v18 = CFSTR("_P");
          goto LABEL_14;
        case 3:
          v17 = off_10007E258;
          v18 = CFSTR("_G");
LABEL_14:
          v15->_persistenceKeyNames = (const void **)v17;
          v15->_tGraphHeaderSuffix = (__CFString *)v18;
          break;
        default:
          v39 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_100054C28(v10, v39, v40, v41, v42, v43, v44, v45);
          break;
      }
      v15->_persistancePath = a7;
      v15->_filer = (Filer *)a8;
      v15->_override_is = -1;
      v15->_override_af_i = -1;
      v15->_override_af_i_float = (float)-1;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("targetAF")), "floatValue");
      v15->_r = v19;
      v15->_afLUT = -[LifetimeServoAFLUT initWithAFTableColumns:]([LifetimeServoAFLUT alloc], "initWithAFTableColumns:", objc_msgSend(a3, "valueForKey:", CFSTR("AFLUT")));
      v15->_is = 0;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("seed")), "floatValue");
      v21 = v20;
      v22 = (int)objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("seed")), "intValue");
      v15->_is = v22;
      if (v21 != 0.0)
      {
        if (byte_1000A2480)
        {
          v23 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *p_loopType;
            *(_DWORD *)buf = 67109376;
            v50 = v24;
            v51 = 2048;
            *(_QWORD *)v52 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: seed %lld", buf, 0x12u);
          }
        }
        v15->_is = (int)vcvts_n_s32_f32(v21, 0xAuLL);
      }
      v15->_isUp = 0;
      v15->_isDown = 0;
      -[LifetimeServoControlLoop initializeLifetimeServoStateAsPersisted](v15, "initializeLifetimeServoStateAsPersisted");
      v15->_Lmin = objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("targetLmin")), "intValue");
      v15->_Lmax = objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("targetLmax")), "intValue");
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("ki")), "floatValue");
      LODWORD(v15->_ki_ls) = v25;
      if (byte_1000A2480)
      {
        v26 = *(float *)&v25;
        v27 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          loopType = v15->_loopType;
          r = v15->_r;
          Lmin = v15->_Lmin;
          Lmax = v15->_Lmax;
          *(_DWORD *)buf = 67110144;
          v50 = loopType;
          v51 = 2048;
          *(double *)v52 = r;
          *(_WORD *)&v52[8] = 1024;
          v53 = Lmin;
          v54 = 1024;
          v55 = Lmax;
          v56 = 2048;
          v57 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: _r %f, _Lmin %d, _Lmax %d, _ki_ls %f", buf, 0x28u);
        }
      }
      if (v15->_Lmin >= v15->_Lmax && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100054BC4();
      if (a5 <= 16)
      {
        if (a5 >= 1)
        {
          v32 = 0;
          v33 = a5;
          v34 = byte_1000A2480;
          *(_QWORD *)&v25 = 67109632;
          v46 = v25;
          do
          {
            v35 = a4[v32];
            v15->_perfStateVoltages[v32] = v35;
            if (v34)
            {
              v36 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
              {
                v37 = *p_loopType;
                *(_DWORD *)buf = v46;
                v50 = v37;
                v51 = 1024;
                *(_DWORD *)v52 = v32;
                *(_WORD *)&v52[4] = 1024;
                *(_DWORD *)&v52[6] = v35;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: state[%d] %d", buf, 0x14u);
                v34 = byte_1000A2480;
              }
            }
            ++v32;
          }
          while (v33 != v32);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100054B3C(p_loopType);
      }
      -[LifetimeServoControlLoop updateDieTempTarget](v15, "updateDieTempTarget", v46);
      -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v15);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100054B10();
      return 0;
    }
  }
  return v15;
}

- (void)updateDieTempTarget
{
  float v2;
  int Lmax;

  v2 = self->_ki_ls * (float)(100 * (self->_is / 1024));
  Lmax = self->_Lmax;
  if (Lmax >= (int)(float)((float)Lmax + (float)(v2 * 5.0)))
    Lmax = (int)(float)((float)Lmax + (float)(v2 * 5.0));
  if (self->_Lmin > Lmax)
    Lmax = self->_Lmin;
  self->_u = Lmax;
}

- (int)dieTempTarget
{
  return self->_u;
}

- (int)defaultDieTempTarget
{
  return self->_Lmax;
}

- (void)initializeLifetimeServoStateAsPersisted
{
  const void **persistenceKeyNames;
  const void ***p_persistenceKeyNames;
  Filer *filer;
  const __CFString *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int loopType;
  const void **v15;
  const void *v16;
  const void *v17;
  int64_t is;
  int64_t isUp;
  const void *v20;
  CFPropertyListRef v21;
  const __CFAllocator *v22;
  NSObject *v23;
  CFNumberRef v24;
  const __CFArray *v25;
  const __CFArray *v26;
  const __CFDictionary *v27;
  const __CFDictionary *v28;
  NSObject *v29;
  int v30;
  const void *v31;
  NSObject *v32;
  int v33;
  const void *v34;
  NSObject *v35;
  int v36;
  const void *v37;
  int64_t v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const void *v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  const void *v46;
  __int16 v47;
  int64_t v48;
  __int16 v49;
  const void *v50;
  __int16 v51;
  id v52;

  v38 = 0;
  p_persistenceKeyNames = &self->_persistenceKeyNames;
  persistenceKeyNames = self->_persistenceKeyNames;
  filer = self->_filer;
  v6 = (const __CFString *)persistenceKeyNames[3];
  if (filer)
  {
    if (!-[Filer getValueForKey:](filer, "getValueForKey:", v6))
    {
      -[LifetimeServoControlLoop updatePersistedState](self, "updatePersistedState");
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LS State reset", buf, 2u);
      }
      -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", &off_100085330, *((_QWORD *)self->_persistenceKeyNames + 3));
    }
    v8 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", *self->_persistenceKeyNames);
    if (v8)
    {
      self->_is = (int64_t)objc_msgSend(v8, "unsignedLongLongValue");
      v9 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", *((_QWORD *)self->_persistenceKeyNames + 1));
      if (v9)
      {
        self->_isUp = (int64_t)objc_msgSend(v9, "unsignedLongLongValue");
        v10 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", *((_QWORD *)self->_persistenceKeyNames + 2));
        if (v10)
        {
          v11 = objc_msgSend(v10, "unsignedLongLongValue");
          self->_isDown = (int64_t)v11;
          if (byte_1000A2480)
          {
            v12 = v11;
            v13 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              loopType = self->_loopType;
              v15 = self->_persistenceKeyNames;
              v16 = *v15;
              v17 = v15[1];
              is = self->_is;
              isUp = self->_isUp;
              v20 = v15[2];
              *(_DWORD *)buf = 67110658;
              v40 = loopType;
              v41 = 2112;
              v42 = v16;
              v43 = 2048;
              v44 = is;
              v45 = 2112;
              v46 = v17;
              v47 = 2048;
              v48 = isUp;
              v49 = 2112;
              v50 = v20;
              v51 = 2048;
              v52 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld; initializing %@ to %lld; initializing %@ to %lld",
                buf,
                0x44u);
            }
          }
          return;
        }
        if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          return;
      }
      else if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        return;
      }
    }
    else if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      return;
    }
    sub_100054D54();
    return;
  }
  v21 = CFPreferencesCopyValue(v6, self->_persistancePath, CFSTR("root"), kCFPreferencesCurrentHost);
  if (v21)
  {
    v22 = kCFAllocatorDefault;
  }
  else
  {
    -[LifetimeServoControlLoop updatePersistedState](self, "updatePersistedState");
    v23 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> LS State reset", buf, 2u);
    }
    buf[0] = 1;
    v22 = kCFAllocatorDefault;
    v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, buf);
    CFPreferencesSetValue(*((CFStringRef *)self->_persistenceKeyNames + 3), v24, self->_persistancePath, CFSTR("root"), kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(self->_persistancePath);
    if (v24)
      CFRelease(v24);
  }
  v25 = CFArrayCreate(v22, *p_persistenceKeyNames, 4, &kCFTypeArrayCallBacks);
  v26 = v25;
  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054C8C();
LABEL_52:
    v28 = 0;
    if (!v21)
      goto LABEL_37;
    goto LABEL_36;
  }
  v27 = CFPreferencesCopyMultiple(v25, self->_persistancePath, CFSTR("root"), kCFPreferencesCurrentHost);
  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054CF0();
    goto LABEL_52;
  }
  v28 = v27;
  if (sub_1000048B0(v27, (void *)**p_persistenceKeyNames, kCFNumberLongLongType, &v38))
  {
    if (byte_1000A2480)
    {
      v29 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v30 = self->_loopType;
        v31 = *self->_persistenceKeyNames;
        *(_DWORD *)buf = 67109634;
        v40 = v30;
        v41 = 2112;
        v42 = v31;
        v43 = 2048;
        v44 = v38;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld", buf, 0x1Cu);
      }
    }
    self->_is = v38;
  }
  if (sub_1000048B0(v28, (void *)(*p_persistenceKeyNames)[1], kCFNumberLongLongType, &v38))
  {
    if (byte_1000A2480)
    {
      v32 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_loopType;
        v34 = (const void *)*((_QWORD *)self->_persistenceKeyNames + 1);
        *(_DWORD *)buf = 67109634;
        v40 = v33;
        v41 = 2112;
        v42 = v34;
        v43 = 2048;
        v44 = v38;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld", buf, 0x1Cu);
      }
    }
    self->_isUp = v38;
  }
  if (sub_1000048B0(v28, (void *)(*p_persistenceKeyNames)[2], kCFNumberLongLongType, &v38))
  {
    if (byte_1000A2480)
    {
      v35 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v36 = self->_loopType;
        v37 = (const void *)*((_QWORD *)self->_persistenceKeyNames + 2);
        *(_DWORD *)buf = 67109634;
        v40 = v36;
        v41 = 2112;
        v42 = v37;
        v43 = 2048;
        v44 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld", buf, 0x1Cu);
      }
    }
    self->_isDown = v38;
  }
  if (!v21)
    goto LABEL_37;
LABEL_36:
  CFRelease(v21);
LABEL_37:
  if (v28)
    CFRelease(v28);
  if (v26)
    CFRelease(v26);
}

- (void)updatePersistedState
{
  Filer *filer;
  NSObject *v4;
  int loopType;
  id v6;
  const __CFDictionary *v7;
  NSObject *v8;
  int v9;
  uint64_t i;
  const void *v11;
  _DWORD v12[2];
  __int16 v13;
  const __CFDictionary *v14;
  uint8_t buf[8];
  __int128 v16;
  uint64_t v17;

  filer = self->_filer;
  if (filer)
  {
    -[Filer setValue:forKey:](filer, "setValue:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_is), *self->_persistenceKeyNames);
    -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_isUp), *((_QWORD *)self->_persistenceKeyNames + 1));
    -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_isDown), *((_QWORD *)self->_persistenceKeyNames + 2));
    if (byte_1000A2480)
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        loopType = self->_loopType;
        v6 = -[Filer copyDictionaryFromFile](self->_filer, "copyDictionaryFromFile");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = loopType;
        LOWORD(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 2) = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: persisting dictionary %@", buf, 0x12u);
      }
    }
    -[Filer synchronizeToFile](self->_filer, "synchronizeToFile");
  }
  else
  {
    *(_QWORD *)buf = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &self->_is);
    *(_QWORD *)&v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &self->_isUp);
    *((_QWORD *)&v16 + 1) = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &self->_isDown);
    v17 = 0;
    v7 = CFDictionaryCreate(kCFAllocatorDefault, self->_persistenceKeyNames, (const void **)buf, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v7)
    {
      if (byte_1000A2480)
      {
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_loopType;
          v12[0] = 67109378;
          v12[1] = v9;
          v13 = 2112;
          v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: persisting %@", (uint8_t *)v12, 0x12u);
        }
      }
      CFPreferencesSetMultiple(v7, 0, self->_persistancePath, CFSTR("root"), kCFPreferencesCurrentHost);
      CFPreferencesAppSynchronize(self->_persistancePath);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100054DB4();
    }
    for (i = 0; i != 32; i += 8)
    {
      v11 = *(const void **)&buf[i];
      if (v11)
        CFRelease(v11);
    }
    if (v7)
      CFRelease(v7);
  }
}

- (int)updateTempMax:(int)a3
{
  NSArray *sensorIndexSet;

  sensorIndexSet = self->_sensorIndexSet;
  if (sensorIndexSet)
    return sub_100006CA4(sensorIndexSet, (int *)&qword_1000A29AC, 0);
  else
    return a3;
}

- (void)updateForPerfStateResidency:(float *)a3 count:(int)a4 tempMax:(int)a5 tempAverage:(int)a6
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  float override_af_i_float;
  float r;
  uint64_t v18;
  NSObject *v19;
  uint64_t override_is;
  NSObject *v21;
  int loopType;
  double af_i;
  int64_t is;
  int64_t isUp;
  int64_t isDown;
  int u;
  int v28;
  _BYTE v29[10];
  double v30;
  _BYTE v31[10];
  int64_t v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  int v38;

  v7 = *(_QWORD *)&a5;
  self->_af_i = 0.0;
  if (a4 < 1)
  {
    v12 = 0.0;
  }
  else
  {
    v10 = 0;
    v11 = a4;
    v12 = 0.0;
    do
    {
      v13 = a3[v10];
      if (v13 > 0.0)
      {
        v14 = v7;
        if (!v10)
        {
          if (self->_loopType == 3)
            v14 = v7;
          else
            v14 = a6;
        }
        -[LifetimeServoControlLoop accelerationFactorForTemperature:cpuPerfStateIndex:](self, "accelerationFactorForTemperature:cpuPerfStateIndex:", v14, v10);
        v12 = self->_af_i + (float)(v13 * v15);
        self->_af_i = v12;
      }
      ++v10;
    }
    while (v11 != v10);
  }
  override_af_i_float = self->_override_af_i_float;
  if (override_af_i_float != (float)-1)
  {
    self->_af_i = override_af_i_float;
    v12 = override_af_i_float;
  }
  r = self->_r;
  v18 = vcvts_n_s32_f32(r - v12, 0xAuLL);
  if (byte_1000A2480)
  {
    v19 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134218752;
      *(_QWORD *)v29 = v18;
      *(_WORD *)&v29[8] = 2048;
      v30 = r;
      *(_WORD *)v31 = 2048;
      *(double *)&v31[2] = v12;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = 1024;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice>  e_ls %lld  _r %f _af_i %f LifetimeServoControllerIntegratorScale %d", (uint8_t *)&v28, 0x26u);
    }
  }
  override_is = self->_override_is;
  if ((_DWORD)override_is == -1)
    self->_is = sub_100035A1C(self->_is, v18);
  else
    self->_is = override_is << 10;
  if (v18 < 1)
    self->_isDown = sub_100035A1C(self->_isDown, -v18);
  else
    self->_isUp = sub_100035A1C(self->_isUp, v18);
  -[LifetimeServoControlLoop updateDieTempTarget](self, "updateDieTempTarget");
  if (byte_1000A2480)
  {
    v21 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      loopType = self->_loopType;
      af_i = self->_af_i;
      is = self->_is;
      isUp = self->_isUp;
      isDown = self->_isDown;
      u = self->_u;
      v28 = 67110912;
      *(_DWORD *)v29 = loopType;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v7;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = a6;
      HIWORD(v30) = 2048;
      *(double *)v31 = af_i;
      *(_WORD *)&v31[8] = 2048;
      v32 = is;
      v33 = 2048;
      v34 = isUp;
      v35 = 2048;
      v36 = isDown;
      v37 = 1024;
      v38 = u;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: tempMax %d, tempAverage %d, AFi %f, LS-ris %lld (up %lld, down %lld), target %d", (uint8_t *)&v28, 0x42u);
    }
  }
}

- (float)accelerationFactorForTemperature:(int)a3 cpuPerfStateIndex:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  float result;

  v4 = *(_QWORD *)&a3;
  v6 = self->_perfStateVoltages[a4];
  if (!(_DWORD)v6 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100054E18();
  -[LifetimeServoAFLUT accelerationFactor:voltage:](self->_afLUT, "accelerationFactor:voltage:", v4, v6);
  return result;
}

- (void)overrideIS:(int)a3
{
  self->_override_is = a3;
}

- (void)overrideAFi:(int)a3
{
  self->_override_af_i = a3;
}

- (void)overrideInstantaneousAF:(float)a3
{
  self->_override_af_i_float = a3;
}

- (BOOL)loopIsActive
{
  return self->_ki_ls > 0.0;
}

- (void)processSleepInterval:(int64_t)a3
{
  float v5;
  uint64_t v6;
  NSObject *v7;
  int loopType;
  _DWORD v9[2];
  __int16 v10;
  int64_t v11;
  __int16 v12;
  uint64_t v13;

  if (self->_override_is == -1)
  {
    v5 = (float)((float)(self->_r * (float)a3) * 1024.0) / 5.0;
    v6 = (uint64_t)v5;
    if ((uint64_t)v5 >= 1)
      self->_is = sub_100035A1C(self->_is, (uint64_t)v5);
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        loopType = self->_loopType;
        v9[0] = 67109632;
        v9[1] = loopType;
        v10 = 2048;
        v11 = a3;
        v12 = 2048;
        v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: delta %ld, is_sleep_adjustment %lld", (uint8_t *)v9, 0x1Cu);
      }
    }
  }
}

- (void)initSensorIndexSet:(id)a3
{
  NSObject *v5;
  int loopType;
  _DWORD v7[2];
  __int16 v8;
  id v9;

  self->_sensorIndexSet = (NSArray *)a3;
  v5 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    loopType = self->_loopType;
    v7[0] = 67109378;
    v7[1] = loopType;
    v8 = 2112;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> looptype %d sensorIndex %@", (uint8_t *)v7, 0x12u);
  }
}

- (int)numberOfFields
{
  return 5;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, *(&off_10007E2C8 + a3), self->_tGraphHeaderSuffix);
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  int64_t is;
  __CFString *result;

  switch(a3)
  {
    case 0:
      v3 = kCFAllocatorDefault;
      is = self->_is;
      goto LABEL_6;
    case 1:
      v3 = kCFAllocatorDefault;
      is = self->_isUp;
      goto LABEL_6;
    case 2:
      v3 = kCFAllocatorDefault;
      is = self->_isDown;
LABEL_6:
      result = (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%lld"), is);
      break;
    case 3:
      result = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%f"), self->_af_i);
      break;
    case 4:
      result = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), self->_u);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
