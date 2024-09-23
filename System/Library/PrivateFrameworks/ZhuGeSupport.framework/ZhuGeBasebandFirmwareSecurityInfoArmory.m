@implementation ZhuGeBasebandFirmwareSecurityInfoArmory

+ (id)query:(id)a3 forceCacheable:(BOOL)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[ZhuGeSingletonArmory sharedInstance](ZhuGeBasebandFirmwareSecurityInfoArmory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "query:forceCacheable:withError:", v7, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)loadFirmwareSecurityInfoRestoreOS:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *fn;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFDictionaryRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  CFTypeRef v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CFTypeRef cf;
  void *v41;

  cf = 0;
  v41 = 0;
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 628, CFSTR("Restore OS: loading firmware security info via BBUpdater"), v3, v4, v5, v37);
  if (loadFirmwareSecurityInfoRestoreOS__once != -1)
    dispatch_once(&loadFirmwareSecurityInfoRestoreOS__once, &__block_literal_global_120);
  if (loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn
    && loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn
    && loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn)
  {
    fn = (const void *)loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn();
    if (fn)
    {
      v18 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v18)
      {
        cf = 0;
        if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn(fn, v18, &cf) || cf)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 652, CFSTR("BBUpdaterSetOptions failed: %@"), v19, v20, v21, (uint64_t)cf);
        }
        else
        {
          if (loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn(fn, CFSTR("CopyIdentifier"), &v41, &cf)&& !cf)
          {
            v22 = v41;
            if (v41)
            {
              -[ZhuGeBasebandFirmwareSecurityInfoArmory setFirmwareSecurityInfo:](self, "setFirmwareSecurityInfo:", v41);

              v41 = 0;
              -[ZhuGeBasebandFirmwareSecurityInfoArmory firmwareSecurityInfo](self, "firmwareSecurityInfo");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 694, CFSTR("firmwareSecurityInfo is reloaded: %@"), v24, v25, v26, (uint64_t)v23);

              v27 = 1;
              goto LABEL_30;
            }
            v32 = CFSTR("No firmwareSecurityInfo found");
            v33 = 697;
            goto LABEL_24;
          }
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 658, CFSTR("BBUpdaterExecCommand(CopyIdentifier) failed: %@"), v15, v16, v17, (uint64_t)cf);
        }
        v34 = (void *)MEMORY[0x24BDD1540];
        v35 = cf;
        goto LABEL_28;
      }
      v32 = CFSTR("fail to create an option CFDictionary for BBUpdater");
      v33 = 665;
LABEL_24:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", v33, v32, v15, v16, v17, v38);
      v34 = (void *)MEMORY[0x24BDD1540];
      v35 = 0;
LABEL_28:
      objc_msgSend(v34, "errorWithZhuGeErrorCode:underlyingError:", 4, v35);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      goto LABEL_29;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 671, CFSTR("BBUpdaterExtremeCreate failed to create an updater"), v11, v12, v13, v38);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 677, CFSTR("didn't retrieve functions from BBUpdater dylib properly"), v8, v9, v10, v38);
    if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn)
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 679, CFSTR("fail to load BBUpdaterExtremeCreate from BBUpdater dylib"), v28, v29, v30, v39);
    if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn)
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 682, CFSTR("fail to load BBUpdaterSetOptions from BBUpdater dylib"), v28, v29, v30, v39);
    if (!loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn)
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]", 685, CFSTR("fail to load BBUpdaterExecCommand from BBUpdater dylib"), v28, v29, v30, v39);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    fn = 0;
  }
  v18 = 0;
LABEL_29:
  *a3 = v31;
LABEL_30:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v18)
    CFRelease(v18);
  if (fn)
    CFRelease(fn);
  return v27;
}

void __77__ZhuGeBasebandFirmwareSecurityInfoArmory_loadFirmwareSecurityInfoRestoreOS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v9 = dlopen("/usr/lib/libBBUpdaterDynamic.dylib", 1);
  if (v9)
  {
    v13 = v9;
    loadFirmwareSecurityInfoRestoreOS__BBUpdaterExtremeCreate_fn = (uint64_t (*)(void))dlsym(v9, "BBUpdaterExtremeCreate");
    loadFirmwareSecurityInfoRestoreOS__BBUpdaterSetOptions_fn = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v13, "BBUpdaterSetOptions");
    loadFirmwareSecurityInfoRestoreOS__BBUpdaterExecCommand_fn = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))dlsym(v13, "BBUpdaterExecCommand");
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:]_block_invoke", 641, CFSTR("fail to dlopen BBUpdater dylib"), v10, v11, v12, a9);
  }
}

- (BOOL)loadFirmwareSecurityInfoBootedOS:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CTServerConnection *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CTServerConnection *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = 0;
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 716, CFSTR("Booted OS: loading firmware security info via CoreTelephony"), v3, v4, v5, v23);
  v8 = +[ZhuGeBasebandConnectionArmory getCTServerConnection](ZhuGeBasebandConnectionArmory, "getCTServerConnection");
  if (v8)
  {
    v12 = v8;
    v13 = _CTServerConnectionCopyFirmwareSecurityInfo();
    v25 = v13;
    v14 = (_DWORD)v13 == 0;
    if ((_DWORD)v13)
    {
      CTError_error_string(&v25);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 729, CFSTR("Failed to get fwSecurityInfo: %d:%d(%s)"), v15, v16, v17, v13);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ZhuGeBasebandFirmwareSecurityInfoArmory setFirmwareSecurityInfo:](self, "setFirmwareSecurityInfo:", v26);

      v26 = 0;
      -[ZhuGeBasebandFirmwareSecurityInfoArmory firmwareSecurityInfo](self, "firmwareSecurityInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 737, CFSTR("firmwareSecurityInfo is reloaded: %@"), v19, v20, v21, (uint64_t)v18);

    }
    CFRelease(v12);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:]", 719, CFSTR("Failed to get CTServerConnection instance"), v9, v10, v11, v24);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 39, 0);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (id)query:(id)a3 forceCacheable:(BOOL)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v8 = a3;
  -[ZhuGeBasebandFirmwareSecurityInfoArmory firmwareSecurityInfo](self, "firmwareSecurityInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !a4)
  {
    if (isZhuGeInRestoreOS())
    {
      if (-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoRestoreOS:](self, "loadFirmwareSecurityInfoRestoreOS:", a5))
      {
        goto LABEL_3;
      }
    }
    else if (-[ZhuGeBasebandFirmwareSecurityInfoArmory loadFirmwareSecurityInfoBootedOS:](self, "loadFirmwareSecurityInfoBootedOS:", a5))
    {
      goto LABEL_3;
    }
    v15 = 0;
    goto LABEL_13;
  }
LABEL_3:
  -[ZhuGeBasebandFirmwareSecurityInfoArmory firmwareSecurityInfo](self, "firmwareSecurityInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory query:forceCacheable:withError:]", 763, CFSTR("firmwareSecurityInfo can not be nil"), v11, v12, v13, v20);
    goto LABEL_10;
  }
  -[ZhuGeBasebandFirmwareSecurityInfoArmory firmwareSecurityInfo](self, "firmwareSecurityInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandFirmwareSecurityInfoArmory query:forceCacheable:withError:]", 770, CFSTR("key %@ does not exist in firmwareSecurityInfo"), v16, v17, v18, (uint64_t)v8);
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v15;
}

- (NSDictionary)firmwareSecurityInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirmwareSecurityInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareSecurityInfo, 0);
}

@end
