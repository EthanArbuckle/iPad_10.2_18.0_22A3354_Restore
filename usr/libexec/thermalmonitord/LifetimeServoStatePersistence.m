@implementation LifetimeServoStatePersistence

- (LifetimeServoStatePersistence)init
{
  void *v3;
  LifetimeServoStatePersistence *v4;
  LifetimeServoStatePersistence *v5;
  Filer *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *statePersistenceTimer;
  dispatch_time_t v11;
  _QWORD v13[5];
  _QWORD handler[5];
  objc_super v15;

  v3 = objc_autoreleasePoolPush();
  v15.receiver = self;
  v15.super_class = (Class)LifetimeServoStatePersistence;
  v4 = -[LifetimeServoStatePersistence init](&v15, "init");
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054250();
    goto LABEL_9;
  }
  v5 = v4;
  v6 = +[LifetimeServoStatePersistence copyFiler](LifetimeServoStatePersistence, "copyFiler");
  v5->_filer = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005427C();
LABEL_9:
    v5 = 0;
    goto LABEL_13;
  }
  v5->_pmpLTSStateversion = 2;
  v5->_ltsStateSaveInterval = 1800000000000;
  v5->_nvramPersistence = +[LifetimeServoStatePersistence copyPersistenceNvramPath](LifetimeServoStatePersistence, "copyPersistenceNvramPath");
  -[LifetimeServoStatePersistence sendLTSStateToPMP](v5, "sendLTSStateToPMP");
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = dispatch_queue_create("com.apple.thermalmonitor.lts-ctrl-state", v7);
  if (v8)
  {
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
    v5->_statePersistenceTimer = (OS_dispatch_source *)v9;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003F77C;
    handler[3] = &unk_10007D248;
    handler[4] = v5;
    dispatch_source_set_event_handler(v9, handler);
    statePersistenceTimer = v5->_statePersistenceTimer;
    v11 = dispatch_time(0x8000000000000000, v5->_ltsStateSaveInterval);
    dispatch_source_set_timer(statePersistenceTimer, v11, v5->_ltsStateSaveInterval, 0x2540BE400uLL);
    dispatch_resume((dispatch_object_t)v5->_statePersistenceTimer);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000542A8();
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003F7F8;
  v13[3] = &unk_10007DB58;
  v13[4] = v5;
  xpc_activity_register("com.apple.thermalMonitor.1weekTask", XPC_ACTIVITY_CHECK_IN, v13);
LABEL_13:
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)dealloc
{
  __CFString *nvramPersistence;
  objc_super v4;

  self->_filer = 0;
  nvramPersistence = self->_nvramPersistence;
  if (nvramPersistence)
    CFRelease(nvramPersistence);
  self->_nvramPersistence = 0;

  v4.receiver = self;
  v4.super_class = (Class)LifetimeServoStatePersistence;
  -[LifetimeServoStatePersistence dealloc](&v4, "dealloc");
}

- (void)overrideParam:(id)a3 value:(int)a4
{
  NSObject *v7;
  uint64_t v8;
  NSObject *statePersistenceTimer;
  dispatch_time_t v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;

  if (a4 != -1)
  {
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412546;
        v12 = a3;
        v13 = 1024;
        v14 = a4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: setting %@ to %d", (uint8_t *)&v11, 0x12u);
      }
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("LifetimeServoStateSaveIntervalMinutes")))
    {
      v8 = 60000000000 * a4;
      self->_ltsStateSaveInterval = v8;
      statePersistenceTimer = self->_statePersistenceTimer;
      v10 = dispatch_time(0x8000000000000000, v8);
      dispatch_source_set_timer(statePersistenceTimer, v10, self->_ltsStateSaveInterval, 0x2540BE400uLL);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100054300();
    }
  }
}

- (BOOL)saveLTSStateToNand:(ltsState *)a3 dataSize:(unint64_t)a4
{
  unsigned int var2;
  unsigned int var3;
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  CFStringRef v13;
  CFStringRef v14;
  CFDataRef v15;
  CFDataRef v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v21;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;

  var2 = a3->var2;
  var3 = a3->var3;
  if (8 * var2 * (unint64_t)var3 + 16 == a4)
  {
    if (-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:", a3->var0, CFSTR("version")))
    {
      if (-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:", a3->var2, CFSTR("lts-ctrl-die-count")))
      {
        if (-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:", a3->var3, CFSTR("lts-ctrl-loop-count")))
        {
          v8 = a3->var2;
          if (v8)
          {
            v9 = 0;
            v10 = 0;
            v11 = a3->var3;
            while (!v11)
            {
LABEL_16:
              v9 = (v9 + 1);
              if (v9 >= v8)
                goto LABEL_17;
            }
            v12 = 0;
            while (1)
            {
              v13 = CFStringCreateWithFormat(0, 0, CFSTR("lts-ctrl-%u-%u-is"), v9, v12);
              if (!v13)
                break;
              v14 = v13;
              v15 = CFDataCreate(0, (const UInt8 *)&a3->var4[(v10 + v12)], 8);
              if (v15)
              {
                v16 = v15;
                -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", v15, v14);
                CFRelease(v16);
              }
              else
              {
                v17 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v24 = (unint64_t)v14;
                  _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "<Error> Failed to create CFData for key %@", buf, 0xCu);
                }
              }
              CFRelease(v14);
              v12 = (v12 + 1);
              v11 = a3->var3;
              if (v12 >= v11)
              {
                v8 = a3->var2;
                v10 += v12;
                goto LABEL_16;
              }
            }
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_1000543B8();
            goto LABEL_24;
          }
LABEL_17:
          if (-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:", a3->var1, CFSTR("counter")))
          {
            if (-[Filer synchronizeToFile](self->_filer, "synchronizeToFile"))
            {
              if (byte_1000A2480)
              {
                v18 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<Notice> Saved updated LTS stats data to Nand", buf, 2u);
                }
              }
LABEL_24:
              LOBYTE(v19) = 1;
              return v19;
            }
            v19 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
            if (!v19)
              return v19;
            sub_100054360();
          }
          else
          {
            v19 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
            if (!v19)
              return v19;
            sub_10005438C();
          }
        }
        else
        {
          v19 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
          if (!v19)
            return v19;
          sub_100054420();
        }
      }
      else
      {
        v19 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
        if (!v19)
          return v19;
        sub_10005444C();
      }
    }
    else
    {
      v19 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
      if (!v19)
        return v19;
      sub_100054478();
    }
  }
  else
  {
    v21 = qword_1000A28A0;
    v19 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!v19)
      return v19;
    *(_DWORD *)buf = 134218752;
    v24 = a4;
    v25 = 2048;
    v26 = 8 * var2 * (unint64_t)var3 + 16;
    v27 = 1024;
    v28 = var2;
    v29 = 1024;
    v30 = var3;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "<Error> NVRam data length %lu does not match expected length %lu bytes. Die count:%d Loop count:%d", buf, 0x22u);
  }
  LOBYTE(v19) = 0;
  return v19;
}

- (BOOL)sendLTSStateToPMP
{
  __CFData *v3;
  const __CFData *v4;
  const UInt8 *BytePtr;
  CFIndex Length;
  unsigned int v7;
  int v8;
  id v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  CFStringRef v26;
  CFStringRef v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  __CFData *v34;
  BOOL v35;
  NSObject *v36;
  NSObject *v37;
  __CFData *cf;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[8];
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;

  v40 = 0;
  v41 = 0;
  v3 = +[LifetimeServoStatePersistence copyPersistedStateNvram:](LifetimeServoStatePersistence, "copyPersistedStateNvram:", self->_nvramPersistence);
  cf = v3;
  if (v3)
  {
    v4 = v3;
    BytePtr = CFDataGetBytePtr(v3);
    Length = CFDataGetLength(v4);
    if (*(_DWORD *)BytePtr == self->_pmpLTSStateversion && *((double *)BytePtr + 2) < 3.1536e10)
    {
      v7 = *((_DWORD *)BytePtr + 1);
      v8 = 1;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054630();
    v7 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054604();
    v7 = 0;
    BytePtr = 0;
    Length = 0;
  }
  v8 = 0;
LABEL_12:
  v9 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", CFSTR("lts-ctrl-0-0-is"));
  if (v9)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(v9, "getBytes:length:", buf, 8);
    v10 = *(double *)buf;
  }
  else
  {
    v10 = 0.0;
  }
  if (-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v40, CFSTR("version"))
    && (_DWORD)v40 == self->_pmpLTSStateversion)
  {
    if (v10 <= 3.1536e10)
    {
      if (!-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", (char *)&v41 + 4, CFSTR("counter")))
      {
        if (byte_1000A2480)
        {
          v36 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<Notice> Failed to read 'counter' from disk. On-disk file is missing\n", buf, 2u);
          }
        }
      }
      goto LABEL_23;
    }
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100054528(v11, v12, v13, v14, v15, v16, v17, v18);
      if ((v8 & 1) == 0)
        goto LABEL_64;
LABEL_23:
      if (v7 > HIDWORD(v41))
        v19 = v8;
      else
        v19 = 0;
      if (v19 == 1)
      {
        if (byte_1000A2480)
        {
          v20 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> NVRam contains more recent version of LTS Stats", buf, 2u);
          }
        }
        -[LifetimeServoStatePersistence saveLTSStateToNand:dataSize:](self, "saveLTSStateToNand:dataSize:", BytePtr, Length);
      }
      if (-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v41, CFSTR("lts-ctrl-die-count")))
      {
        if (-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", (char *)&v40 + 4, CFSTR("lts-ctrl-loop-count")))
        {
          if (byte_1000A2480)
          {
            v21 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v41;
              v43 = 1024;
              v44 = HIDWORD(v40);
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> sendLTSStateToPMP: dieCount:%u loopCount:%u", buf, 0xEu);
            }
          }
          v22 = v41;
          if ((_DWORD)v41)
          {
            v23 = 0;
            v24 = HIDWORD(v40);
            do
            {
              if (v24)
              {
                v25 = 0;
                do
                {
                  v26 = CFStringCreateWithFormat(0, 0, CFSTR("lts-ctrl-%u-%u-is"), v23, v25);
                  if (v26)
                  {
                    v27 = v26;
                    v28 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", v26);
                    if (v28)
                    {
                      v29 = v28;
                      -[LifetimeServoStatePersistence sendDataToPMP:forKey:](self, "sendDataToPMP:forKey:", v28, v27);
                      if (byte_1000A2480)
                      {
                        v30 = qword_1000A28A0;
                        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 67109634;
                          *(_DWORD *)&buf[4] = v23;
                          v43 = 1024;
                          v44 = v25;
                          v45 = 2112;
                          v46 = v29;
                          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> Sending data to PMP: die %u loop %u is: %@", buf, 0x18u);
                        }
                      }
                    }
                    else
                    {
                      v32 = qword_1000A28A0;
                      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109376;
                        *(_DWORD *)&buf[4] = v23;
                        v43 = 1024;
                        v44 = v25;
                        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "<Error> Failed to send data to PMP: die %u loop %u", buf, 0xEu);
                      }
                    }
                    CFRelease(v27);
                  }
                  else
                  {
                    v31 = qword_1000A28A0;
                    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)&buf[4] = v23;
                      v43 = 1024;
                      v44 = v25;
                      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "<Error> Failed to create key for die %u loop %u\n", buf, 0xEu);
                    }
                  }
                  v25 = (v25 + 1);
                  v24 = HIDWORD(v40);
                }
                while (v25 < HIDWORD(v40));
                v22 = v41;
              }
              v23 = (v23 + 1);
            }
            while (v23 < v22);
          }
          if (byte_1000A2480)
          {
            v33 = qword_1000A28A0;
            v34 = cf;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> Updated PMP with saved LTS State", buf, 2u);
            }
            goto LABEL_70;
          }
          v35 = 1;
LABEL_57:
          v34 = cf;
          if (!cf)
            return v35;
          goto LABEL_71;
        }
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000544A4();
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_1000544D0();
      }
      v35 = 0;
      goto LABEL_57;
    }
    goto LABEL_22;
  }
  if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
LABEL_22:
    if ((v8 & 1) != 0)
      goto LABEL_23;
    goto LABEL_64;
  }
  sub_1000545A0();
  if ((v8 & 1) != 0)
    goto LABEL_23;
LABEL_64:
  v37 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "<Error> NVRam and NAND data is invalid. Nothing to send to PMP", buf, 2u);
    v37 = qword_1000A28A0;
  }
  v34 = cf;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    sub_1000544FC();
  if (!-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:", HIDWORD(v41), CFSTR("counter")))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054478();
    v35 = 0;
    if (cf)
      goto LABEL_71;
    return v35;
  }
  -[LifetimeServoStatePersistence updateNvramLTSState](self, "updateNvramLTSState");
LABEL_70:
  v35 = 1;
  if (v34)
LABEL_71:
    CFRelease(v34);
  return v35;
}

+ (id)copyFiler
{
  NSObject *v2;
  int v4;
  _BYTE *v5;
  _BYTE v6[1024];

  bzero(v6, 0x400uLL);
  if (!&_lookupPathForPersistentData)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005465C();
    return 0;
  }
  if (lookupPathForPersistentData(104, v6, 1024))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054688();
    return 0;
  }
  if (byte_1000A2480)
  {
    v2 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = v6;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<Notice> Persitence filepath:%s", (uint8_t *)&v4, 0xCu);
    }
  }
  return -[Filer initWithFileName:inDirectory:]([Filer alloc], "initWithFileName:inDirectory:", "com.apple.cltm", v6);
}

+ (__CFString)copyPersistenceNvramPath
{
  CFUUIDRef v2;
  __CFString *v3;
  NSObject *v4;
  uint8_t buf[4];
  __CFString *v7;

  v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x40u, 0xA0u, 0xDDu, 0xD2u, 0x77u, 0xF8u, 0x43u, 0x92u, 0xB4u, 0xA3u, 0x1Eu, 0x73u, 4u, 0x20u, 0x65u, 0x16u);
  v3 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%@:%s"), v2, "lts-persistance");
  if (v3)
  {
    if (byte_1000A2480)
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v7 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> NVRam path: %@", buf, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000546E8();
  }
  return v3;
}

- (BOOL)readInteger:(unsigned int *)a3 forKey:(__CFString *)a4
{
  id v6;
  id v7;
  NSObject *v9;
  int v10;
  __CFString *v11;

  v6 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", a4);
  v7 = v6;
  if (v6)
  {
    *a3 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else if (byte_1000A2480)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Failed to read value for key %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7 != 0;
}

- (BOOL)writeInteger:(unsigned int)a3 withKey:(__CFString *)a4
{
  uint64_t v5;
  void *v7;
  NSNumber *v8;
  NSObject *v10;
  _DWORD v11[2];

  v5 = *(_QWORD *)&a3;
  v7 = objc_autoreleasePoolPush();
  v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5);
  if (v8)
  {
    -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", v8, a4);
  }
  else if (byte_1000A2480)
  {
    v10 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Failed to create CFNumber for integer %d\n", (uint8_t *)v11, 8u);
    }
  }
  objc_autoreleasePoolPop(v7);
  return v8 != 0;
}

+ (__CFData)copyPersistedStateNvram:(__CFString *)a3
{
  io_registry_entry_t v4;
  io_object_t v5;
  __CFData *CFProperty;
  __CFData *v7;
  CFTypeID v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054714();
    return 0;
  }
  v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v4)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054740(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  v5 = v4;
  CFProperty = (__CFData *)IORegistryEntryCreateCFProperty(v4, a3, kCFAllocatorDefault, 0);
  v7 = CFProperty;
  if (CFProperty)
  {
    v8 = CFGetTypeID(CFProperty);
    if (v8 != CFDataGetTypeID() && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000547DC();
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000547B0();
  }
  IOObjectRelease(v5);
  return v7;
}

+ (BOOL)writePersistedStateNvram:(const void *)a3 dataSize:(unint64_t)a4 path:(__CFString *)a5
{
  io_registry_entry_t v8;
  io_registry_entry_t v9;
  void *v10;
  kern_return_t v11;
  BOOL v12;

  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054714();
    return 0;
  }
  v8 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v8)
    return 0;
  v9 = v8;
  v10 = objc_autoreleasePoolPush();
  v11 = IORegistryEntrySetCFProperty(v9, a5, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4));
  v12 = v11 == 0;
  if (v11 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100054808();
  objc_autoreleasePoolPop(v10);
  IOObjectRelease(v9);
  return v12;
}

+ (unsigned)getPMPSvc
{
  unsigned int result;
  const __CFDictionary *v3;

  result = dword_1000A23E8;
  if (!dword_1000A23E8)
  {
    v3 = IOServiceNameMatching("ApplePMPv2");
    result = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    dword_1000A23E8 = result;
  }
  return result;
}

- (__CFData)copyKeyFromPMP:(__CFString *)a3 is_64:(BOOL)a4
{
  _BOOL4 v4;
  io_registry_entry_t v6;
  const __CFData *CFProperty;
  const __CFData *v8;
  CFTypeID v9;
  CFIndex Length;
  uint64_t v11;
  NSObject *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a4;
  v6 = +[LifetimeServoStatePersistence getPMPSvc](LifetimeServoStatePersistence, "getPMPSvc");
  if (!v6)
  {
    v14 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054834(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v6, a3, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000548A4();
    return 0;
  }
  v8 = CFProperty;
  v9 = CFGetTypeID(CFProperty);
  if (v9 == CFDataGetTypeID())
  {
    Length = CFDataGetLength(v8);
    v11 = 4;
    if (v4)
      v11 = 8;
    if (Length != v11)
    {
      v12 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100054904(v8, (uint64_t)a3, v12);
      CFRelease(v8);
      return 0;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100054998();
  }
  return v8;
}

- (BOOL)sendDataToPMP:(__CFData *)a3 forKey:(__CFString *)a4
{
  io_registry_entry_t v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = +[LifetimeServoStatePersistence getPMPSvc](LifetimeServoStatePersistence, "getPMPSvc");
  if (v6)
  {
    if (!IORegistryEntrySetCFProperty(v6, a4, a3))
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    v7 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    sub_1000549F8();
  }
  else
  {
    v8 = qword_1000A28A0;
    v7 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    sub_100054834(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (unint64_t)copyLTSStateFromPMP:(ltsState *)a3
{
  __CFData *v5;
  __CFData *v6;
  __CFData *v7;
  __CFData *v8;
  ltsState *v9;
  ltsState *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  CFStringRef v18;
  CFStringRef v19;
  __CFData *v20;
  const __CFData *v21;
  const UInt8 *BytePtr;
  NSObject *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t result;
  ltsState **v28;
  size_t v29;
  __CFData *v30;
  __CFData *cf;
  int v32;
  uint64_t v33;
  uint8_t buf[4];
  _BYTE v35[10];
  __int16 v36;
  const __CFData *v37;

  v33 = 0;
  v32 = 0;
  v5 = -[LifetimeServoStatePersistence copyKeyFromPMP:is_64:](self, "copyKeyFromPMP:is_64:", CFSTR("lts-ctrl-die-count"), 0);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054A58();
    return 0;
  }
  v6 = v5;
  -[__CFData getBytes:length:](v5, "getBytes:length:", (char *)&v33 + 4, 4);
  v7 = -[LifetimeServoStatePersistence copyKeyFromPMP:is_64:](self, "copyKeyFromPMP:is_64:", CFSTR("lts-ctrl-loop-count"), 0);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054A84();
    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  -[__CFData getBytes:length:](v7, "getBytes:length:", &v33, 4);
  LODWORD(v33) = v33 / HIDWORD(v33);
  v29 = 8 * HIDWORD(v33) * (unint64_t)v33 + 16;
  v9 = (ltsState *)malloc_type_calloc(1uLL, v29, 0x4D9CD70BuLL);
  v10 = v9;
  if (!v9)
  {
    cf = v8;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100054AB0();
LABEL_32:
    CFRelease(cf);
    CFRelease(v6);
    if (v10)
      free(v10);
    return 0;
  }
  v28 = a3;
  v11 = v33;
  v9->var2 = HIDWORD(v33);
  v9->var3 = v11;
  v9->var0 = self->_pmpLTSStateversion;
  if (byte_1000A2480)
  {
    v12 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v35 = HIDWORD(v33);
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v33;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> dieCount:%u loopCount:%u", buf, 0xEu);
    }
  }
  v13 = HIDWORD(v33);
  if (HIDWORD(v33))
  {
    v14 = 0;
    v15 = 0;
    v16 = v33;
    v30 = v6;
    cf = v8;
    while (!v16)
    {
LABEL_18:
      v14 = (v14 + 1);
      if (v14 >= v13)
        goto LABEL_19;
    }
    v17 = 0;
    while (1)
    {
      v18 = CFStringCreateWithFormat(0, 0, CFSTR("lts-ctrl-%u-%u-is-inuse"), v14, v17);
      if (!v18)
        break;
      v19 = v18;
      v20 = -[LifetimeServoStatePersistence copyKeyFromPMP:is_64:](self, "copyKeyFromPMP:is_64:", v18, 1);
      if (!v20)
      {
        v6 = v30;
        if (byte_1000A2480)
        {
          v25 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v35 = v19;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "<Notice> Failed to read integrator state for key %@", buf, 0xCu);
          }
        }
        CFRelease(v19);
        goto LABEL_32;
      }
      v21 = v20;
      CFRelease(v19);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v35 = v14;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = v17;
        v36 = 2114;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "die %u loop %u is: %{public}@", buf, 0x18u);
      }
      BytePtr = CFDataGetBytePtr(v21);
      if (!BytePtr)
      {
        CFRelease(v21);
        v6 = v30;
        goto LABEL_32;
      }
      v10->var4[(v15 + v17)] = *(_QWORD *)BytePtr;
      CFRelease(v21);
      v17 = (v17 + 1);
      v16 = v33;
      if (v17 >= v33)
      {
        v13 = HIDWORD(v33);
        v15 += v17;
        v6 = v30;
        v8 = cf;
        goto LABEL_18;
      }
    }
    v6 = v30;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000543B8();
    goto LABEL_32;
  }
LABEL_19:
  if (-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v32, CFSTR("counter")))
  {
LABEL_23:
    v24 = byte_1000A2480;
    v10->var1 = ++v32;
    if (!v24)
      goto LABEL_38;
    goto LABEL_36;
  }
  v32 = 0;
  if (!byte_1000A2480)
  {
    v32 = 1;
    v10->var1 = 1;
    goto LABEL_38;
  }
  v23 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> Initalizing PMP LTS state counter", buf, 2u);
    goto LABEL_23;
  }
  v32 = 1;
  v10->var1 = 1;
LABEL_36:
  v26 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "<Notice> Copied LTS state data from PMP", buf, 2u);
  }
LABEL_38:
  CFRelease(v8);
  CFRelease(v6);
  if (v10)
  {
    result = v29;
    *v28 = v10;
    return result;
  }
  return 0;
}

- (BOOL)updateNvramLTSState
{
  unint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  NSObject *v7;
  uint8_t v9[8];
  void *v10;

  v10 = 0;
  v3 = -[LifetimeServoStatePersistence copyLTSStateFromPMP:](self, "copyLTSStateFromPMP:", &v10);
  if (v3)
  {
    v4 = v3;
    -[LifetimeServoStatePersistence saveLTSStateToNand:dataSize:](self, "saveLTSStateToNand:dataSize:", v10, v3);
    v5 = +[LifetimeServoStatePersistence writePersistedStateNvram:dataSize:path:](LifetimeServoStatePersistence, "writePersistedStateNvram:dataSize:path:", v10, v4, self->_nvramPersistence);
    if (v5 && byte_1000A2480 != 0)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Saved LTS state to NVRam", v9, 2u);
      }
    }
    free(v10);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_1000542D4();
    LOBYTE(v5) = 0;
  }
  return v5;
}

@end
