@implementation PCSCKKSCreateIdentityOperation

- (PCSCKKSCreateIdentityOperation)initWithItemModifyContext:(id)a3
{
  id v5;
  void *v6;
  PCSCKKSCreateIdentityOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  PCSCKKSCreateIdentityOperation *v11;
  objc_super v13;
  uint8_t buf[16];

  v5 = a3;
  if ((PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v5, "set")) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    goto LABEL_8;
  }
  if (!v5
    || (objc_msgSend(v5, "service"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6)
    || (v13.receiver = self,
        v13.super_class = (Class)PCSCKKSCreateIdentityOperation,
        v7 = -[PCSCKKSCreateIdentityOperation init](&v13, sel_init),
        (self = v7) == 0))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_context, a3);
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PCSCKKSItemModifyContext service](self->_context, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("CreateIdentityOperation service: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSCreateIdentityOperation setName:](self, "setName:", v10);

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (void)start
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  _PCSIdentityData *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __PCSLogContext *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Starting: %s"), "-[PCSCKKSCreateIdentityOperation start]");
  if (-[PCSCKKSOperation startOperation](self, "startOperation"))
  {
    -[PCSCKKSCreateIdentityOperation context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

    if ((v4 & 1) != 0)
    {
      if (!-[PCSCKKSItemModifyContext roll](self->_context, "roll"))
      {
        -[PCSCKKSItemModifyContext existingItemReference](self->_context, "existingItemReference");
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v6 = (void *)v5;
          v7 = -[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity");

          if (v7)
          {
            PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Have an identity and no need to create a new"));
            -[PCSCKKSItemModifyContext setReturnedExistingIdentity:](self->_context, "setReturnedExistingIdentity:", 1);
            -[PCSCKKSItemModifyContext mtt](self->_context, "mtt");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setReturnedExistingIdentity:", 1);

            -[PCSCKKSOperation completeOperation](self, "completeOperation");
            return;
          }
        }
      }
      -[PCSCKKSItemModifyContext server_NextRollDate](self->_context, "server_NextRollDate");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_14;
      v10 = (void *)v9;
      -[PCSCKKSItemModifyContext server_NextRollDate](self->_context, "server_NextRollDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "compare:", v12);

      if (v13 != 1)
      {
LABEL_14:
        -[PCSCKKSCreateIdentityOperation createPCSIdentity](self, "createPCSIdentity");
        return;
      }
      v14 = -[PCSCKKSItemModifyContext log](self->_context, "log");
      -[PCSCKKSItemModifyContext server_NextRollDate](self->_context, "server_NextRollDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PCSMigrationLog((uint64_t)v14, CFSTR("Server denied keyrolling until %@"), v15);

      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = kPCSErrorDomain;
      v25 = *MEMORY[0x1E0CB2D50];
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSItemModifyContext server_NextRollDate](self->_context, "server_NextRollDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Server wants service %@ to keyroll next time at %@"), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 100, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSOperation setError:](self, "setError:", v23);

      -[PCSCKKSItemModifyContext resetIdentities](self->_context, "resetIdentities");
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    -[PCSCKKSOperation completeOperation](self, "completeOperation");
  }
}

- (void)createPCSIdentity
{
  void *v3;
  char v4;
  _PCSIdentitySetData *v5;
  const void *v6;
  const void *v7;
  void *v8;
  _BOOL4 IsManatee;
  char v10;
  const __CFNumber *v11;
  _QWORD *Service;
  void *v13;
  void *v14;
  uint8_t v15[8];
  void *v16;

  v16 = 0;
  -[PCSCKKSCreateIdentityOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v15, 2u);
    }
    goto LABEL_11;
  }
  v5 = -[PCSCKKSItemModifyContext set](self->_context, "set");
  v6 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v5, kPCSServiceMaster, (const void **)&v16);
  if (!v6)
  {
    v13 = v16;
    -[PCSCKKSOperation setError:](self, "setError:", v16);

LABEL_11:
    -[PCSCKKSOperation completeOperation](self, "completeOperation");
    return;
  }
  v7 = v6;
  -[PCSCKKSItemModifyContext service](self->_context, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IsManatee = PCSServiceItemTypeIsManatee((_BOOL8)v8);

  if (IsManatee)
    v10 = 5;
  else
    v10 = 1;
  -[PCSCKKSItemModifyContext service](self->_context, "service");
  v11 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
  Service = PCSIdentityCreateService((uint64_t)v7, v10, v11, (const void **)&v16);

  if (Service)
  {
    -[PCSCKKSCreateIdentityOperation storePCSIdentity:](self, "storePCSIdentity:", Service);
    CFRelease(Service);
  }
  else
  {
    v14 = v16;
    -[PCSCKKSOperation setError:](self, "setError:", v16);

    -[PCSCKKSOperation completeOperation](self, "completeOperation");
  }
  CFRelease(v7);
}

- (void)storePCSIdentity:(_PCSIdentityData *)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  dispatch_semaphore_t v14;
  dispatch_queue_t v15;
  PCSCKKSItemModifyContext *context;
  __CFDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t PublicKey;
  uint64_t ServiceViewHint;
  __CFString *ServiceAccessGroup;
  __CFString *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  __CFDictionary *MutableForCFTypesWith;
  uint64_t v32;
  CFTypeID v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CFTypeRef v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  dispatch_time_t v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  __PCSLogContext *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  __PCSLogContext *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  __PCSLogContext *v69;
  void *v70;
  void *v71;
  void *v72;
  __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  __PCSLogContext *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  __PCSLogContext *v84;
  void *v85;
  uint64_t v86;
  const void *v87;
  uint64_t v88;
  __CFString *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const void *v97;
  uint64_t v98;
  const void *v99;
  id *v100;
  dispatch_queue_t queue;
  dispatch_semaphore_t dsema;
  dispatch_semaphore_t v103;
  void *v104;
  __CFDictionary *theDict;
  _QWORD block[6];
  CFTypeRef cf;
  CFTypeRef *p_cf;
  uint64_t v109;
  char v110;
  _QWORD v111[4];
  dispatch_semaphore_t v112;
  id v113;
  dispatch_semaphore_t v114;
  dispatch_queue_t v115;
  _QWORD *v116;
  id v117[2];
  _QWORD v118[3];
  char v119;
  id location;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  _QWORD v132[3];

  v132[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x2020000000;
  v119 = 0;
  -[PCSCKKSCreateIdentityOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v5, "set"));

  if ((v6 & 1) != 0)
  {
    -[PCSCKKSCreateIdentityOperation context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mtt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "measurePoint:", CFSTR("PCSStoreIdentity"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    -[PCSCKKSItemModifyContext dsid](self->_context, "dsid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    theDict = (__CFDictionary *)_PCSIdentityCopyKeychainAttributes((uint64_t)a3);

    if (!theDict)
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = kPCSErrorDomain;
      v131 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get attributes from %@"), a3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v132[0] = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, &v131, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 101, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSOperation setError:](self, "setError:", v44);

      objc_msgSend(v104, "complete:", 0);
      -[PCSCKKSOperation completeOperation](self, "completeOperation");
LABEL_28:

      goto LABEL_29;
    }
    v10 = *MEMORY[0x1E0CD7020];
    v11 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0CD7020], (const void *)*MEMORY[0x1E0C9AE50]);
    v12 = *MEMORY[0x1E0CD7010];
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0CD7010], v11);
    v13 = dispatch_semaphore_create(0);
    v14 = dispatch_semaphore_create(0);
    v15 = dispatch_queue_create("PCSAddIdentitySyncQueue", 0);
    CFRetain(a3);
    context = self->_context;
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke;
    v111[3] = &unk_1E553DF20;
    v100 = v117;
    objc_copyWeak(v117, &location);
    v117[1] = a3;
    dsema = v13;
    v112 = dsema;
    v113 = v104;
    v103 = v14;
    v114 = v103;
    queue = v15;
    v115 = queue;
    v116 = v118;
    v17 = theDict;
    v18 = -[PCSCKKSCreateIdentityOperation addAndNotifyOnSync:attributes:returnAttributes:complete:](self, "addAndNotifyOnSync:attributes:returnAttributes:complete:", a3, theDict, &context->_rollAttributes, v111);
    v19 = v18;
    if ((_DWORD)v18)
    {
      if ((_DWORD)v18 == -25299)
      {
        PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Item already in keychain, find it so we can set it to current"));
        PublicKey = PCSIdentityGetPublicKey((uint64_t)a3);
        cf = 0;
        ServiceViewHint = PCSIdentityGetServiceViewHint((uint64_t)a3);
        if (ServiceViewHint)
        {
          ServiceAccessGroup = PCSIdentityGetServiceAccessGroup((uint64_t)a3);
          v23 = kPCSServiceName[0];
          -[PCSCKKSItemModifyContext dsid](self->_context, "dsid");
          v99 = v11;
          v97 = v11;
          v98 = v12;
          v95 = ServiceViewHint;
          v96 = v10;
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = *MEMORY[0x1E0CD6B78];
          v92 = *MEMORY[0x1E0CD6B50];
          v91 = *MEMORY[0x1E0CD68F8];
          v89 = ServiceAccessGroup;
          v90 = *MEMORY[0x1E0CD6B40];
          v87 = v11;
          v88 = *MEMORY[0x1E0CD6898];
          v86 = *MEMORY[0x1E0CD70A8];
          MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v93, v24, v25, v26, v27, v28, v29, v30, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);

          if (PCSUseSyncKeychain)
            CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], v11);
          v32 = _PCSKeychainForwardTable(MutableForCFTypesWith, &cf);
          CFRelease(MutableForCFTypesWith);
          if (!(_DWORD)v32)
          {
            if (cf)
            {
              v33 = CFGetTypeID(cf);
              if (v33 == CFDictionaryGetTypeID())
              {
                CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0CD6B38]);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0CD70E0]);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v35 || !v34)
                {
                  -[PCSCKKSCreateIdentityOperation context](self, "context");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "resetIdentities");

                  v79 = (void *)MEMORY[0x1E0CB35C8];
                  v80 = kPCSErrorDomain;
                  v125 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find manatee identity %@: %d"), a3, 0, v86, v87, v88, v89, v90, v23, v91, PublicKey, v92, v93, v94, v95, v96, v97,
                    v98,
                    v99,
                    0,
                    v117);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v126 = v81;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "errorWithDomain:code:userInfo:", v80, 114, v82);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PCSCKKSOperation setError:](self, "setError:", v83);

                  v84 = -[PCSCKKSItemModifyContext log](self->_context, "log");
                  -[PCSCKKSOperation error](self, "error");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  PCSMigrationLog((uint64_t)v84, CFSTR("Failed to find %@ from local keychain: %@"), a3, v85);

                  -[PCSCKKSOperation completeOperation](self, "completeOperation");
                  CFRelease(cf);
                  CFRelease(theDict);

                  goto LABEL_27;
                }
                PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Setting already stored identity %@ with pref %@ to current"), a3, v35, v86, v87, v88, v89, v90, v23, v91, PublicKey, v92, v93, v94, ServiceViewHint, v96, v97, v98,
                  v99,
                  0,
                  v117);
                -[PCSCKKSCreateIdentityOperation context](self, "context");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setRollItemReference:", v35);

                -[PCSCKKSCreateIdentityOperation context](self, "context");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setRollItemSHA1:", v34);

                v38 = CFRetain(a3);
                -[PCSCKKSCreateIdentityOperation context](self, "context");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setRollIdentity:", v38);

                -[PCSCKKSCreateIdentityOperation setIdentityToCurrent](self, "setIdentityToCurrent");
                CFRelease(cf);

                v17 = theDict;
                goto LABEL_23;
              }
            }
          }
          -[PCSCKKSCreateIdentityOperation context](self, "context");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "resetIdentities");

          v64 = (void *)MEMORY[0x1E0CB35C8];
          v65 = kPCSErrorDomain;
          v127 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find manatee identity %@: %d"), a3, v32, v86, v11, v88, v89, v90, v23, v91, PublicKey, v92, v93, v94, v95, v10, v11,
            v98,
            v11,
            0,
            v117);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = v66;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "errorWithDomain:code:userInfo:", v65, 114, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[PCSCKKSOperation setError:](self, "setError:", v68);

          v69 = -[PCSCKKSItemModifyContext log](self->_context, "log");
          -[PCSCKKSOperation error](self, "error");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          PCSMigrationLog((uint64_t)v69, CFSTR("Failed to find in local keychain: %@"), v70);
        }
        else
        {
          -[PCSCKKSCreateIdentityOperation context](self, "context");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "resetIdentities");

          v72 = (void *)MEMORY[0x1E0CB35C8];
          v73 = kPCSErrorDomain;
          v129 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed  get view hint from identity %@"), a3);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v74;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "errorWithDomain:code:userInfo:", v73, 113, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[PCSCKKSOperation setError:](self, "setError:", v76);

          v77 = -[PCSCKKSItemModifyContext log](self->_context, "log");
          -[PCSCKKSOperation error](self, "error");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          PCSMigrationLog((uint64_t)v77, CFSTR("Set current: %@"), v70);
        }

        -[PCSCKKSOperation completeOperation](self, "completeOperation");
        CFRelease(theDict);
        goto LABEL_27;
      }
      -[PCSCKKSCreateIdentityOperation context](self, "context");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "resetIdentities");

      v55 = (void *)MEMORY[0x1E0CB35C8];
      v56 = kPCSErrorDomain;
      v123 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to store manatee identity %@ with error: %d"), a3, v19);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", v56, 115, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSOperation setError:](self, "setError:", v59);

      v60 = -[PCSCKKSItemModifyContext log](self->_context, "log");
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSOperation error](self, "error");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      PCSMigrationLog((uint64_t)v60, CFSTR("Failed to store service %@ to local keychain: %@"), v61, v62);

      -[PCSCKKSOperation completeOperation](self, "completeOperation");
      v17 = theDict;
      CFRelease(a3);
    }
    else
    {
      dispatch_semaphore_signal(dsema);
      v45 = dispatch_time(0, 1000000000 * -[PCSCKKSItemModifyContext timeoutValue](self->_context, "timeoutValue"));
      if (dispatch_semaphore_wait(v103, v45))
      {
        cf = 0;
        p_cf = &cf;
        v109 = 0x2020000000;
        v110 = 0;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_2;
        block[3] = &unk_1E553DEF8;
        block[4] = &cf;
        block[5] = v118;
        dispatch_sync(queue, block);
        if (!*((_BYTE *)p_cf + 24))
        {
          v46 = (void *)MEMORY[0x1E0CB35C8];
          v47 = kPCSErrorDomain;
          v121 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to store manatee identity %@, operation timed out"), a3);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "errorWithDomain:code:userInfo:", v47, 116, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PCSCKKSOperation setError:](self, "setError:", v50);

          v51 = -[PCSCKKSItemModifyContext log](self->_context, "log");
          -[PCSCKKSItemModifyContext service](self->_context, "service");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[PCSCKKSOperation error](self, "error");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          PCSMigrationLog((uint64_t)v51, CFSTR("Failed to store service %@ to CKKS: %@"), v52, v53);

          -[PCSCKKSOperation completeOperation](self, "completeOperation");
          v17 = theDict;
        }
        _Block_object_dispose(&cf, 8);
      }
    }
LABEL_23:
    CFRelease(v17);
LABEL_27:

    objc_destroyWeak(v100);
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(cf) = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", (uint8_t *)&cf, 2u);
  }
  -[PCSCKKSOperation completeOperation](self, "completeOperation");
LABEL_29:
  _Block_object_dispose(v118, 8);
  objc_destroyWeak(&location);
}

void __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id *WeakRetained;
  id *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const void *Value;
  CFDictionaryRef *v23;
  const void *v24;
  const void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(NSObject **)(a1 + 32);
    v9 = dispatch_time(0, 1000000000 * objc_msgSend(WeakRetained[34], "timeoutValue"));
    if (dispatch_semaphore_wait(v8, v9))
    {
      v10 = objc_msgSend(v7[34], "log");
      objc_msgSend(v7[34], "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PCSMigrationLog(v10, CFSTR("Timed out waiting for add to complete: %@"), v11);

      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = kPCSErrorDomain;
      v48 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7[34], "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("timeout waiting SecItemAdd for service: %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 110, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setError:", v18);

      objc_msgSend(v7, "completeOperation");
      objc_msgSend(*(id *)(a1 + 40), "complete:", 0);
      CFRelease(*(CFTypeRef *)(a1 + 80));
    }
    else
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      *(_QWORD *)buf = 0;
      v41 = buf;
      v42 = 0x2020000000;
      v43 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_22;
      block[3] = &unk_1E553DEF8;
      v20 = *(NSObject **)(a1 + 56);
      v21 = *(_QWORD *)(a1 + 64);
      block[4] = buf;
      block[5] = v21;
      dispatch_sync(v20, block);
      if (!v41[24])
      {
        Value = CFDictionaryGetValue(*((CFDictionaryRef *)v7[34] + 1), (const void *)*MEMORY[0x1E0CD70E0]);
        v23 = (CFDictionaryRef *)v7[34];
        if (a2 && v23[1])
        {
          v24 = CFDictionaryGetValue(v23[1], (const void *)*MEMORY[0x1E0CD6B38]);
          if (Value && (v25 = v24) != 0)
          {
            PCSMigrationLog(objc_msgSend(v7[34], "log"), CFSTR("Stored identity with pref: %@"), Value);
            objc_msgSend(v7[34], "setRollItemReference:", Value);
            objc_msgSend(v7[34], "setRollItemSHA1:", v25);
            objc_msgSend(v7[34], "setRollIdentity:", CFRetain(*(CFTypeRef *)(a1 + 80)));
            _PCSIdentityCheckPCSAttributes(*(_QWORD *)(a1 + 80), *((void **)v7[34] + 1));
            objc_msgSend(*(id *)(a1 + 40), "complete:", 1);
            objc_msgSend(v7, "setIdentityToCurrent");
          }
          else
          {
            v34 = (void *)MEMORY[0x1E0CB35C8];
            v35 = kPCSErrorDomain;
            v46 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store manatee and sync, but didn't get a pref/sha1"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 112, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setError:", v38);

            objc_msgSend(v7, "completeOperation");
            objc_msgSend(*(id *)(a1 + 40), "complete:", 0);
          }
        }
        else
        {
          v26 = -[CFDictionaryRef log](v23, "log");
          objc_msgSend(v7[34], "service");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          PCSMigrationLog(v26, CFSTR("Failed to push service %@ to CKKS: %@"), v27, a3);

          if (a3)
          {
            objc_msgSend(v7, "setError:", a3);
          }
          else
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v29 = kPCSErrorDomain;
            v44 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed but no error on addandnotifyonsync: %@"), *((_QWORD *)v7[34] + 1));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 111, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setError:", v32);

          }
          objc_msgSend(v7, "context");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "resetIdentities");

          objc_msgSend(*(id *)(a1 + 40), "complete:", 0);
          objc_msgSend(v7, "completeOperation");
        }
      }
      CFRelease(*(CFTypeRef *)(a1 + 80));
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    pcsLogObjForScope("ckks");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, v19, OS_LOG_TYPE_DEFAULT, "Strong self no longer exists", buf, 2u);
    }

    CFRelease(*(CFTypeRef *)(a1 + 80));
  }

}

uint64_t __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_22(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                            + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                            + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (int)addAndNotifyOnSync:(_PCSIdentityData *)a3 attributes:(__CFDictionary *)a4 returnAttributes:(const __CFDictionary *)a5 complete:(id)a6
{
  void (**v10)(id, _QWORD, void *);
  void *v11;
  int v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint8_t buf[8];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD, void *))a6;
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Saving identity %@ to keychain"), a3);
  -[PCSCKKSCreateIdentityOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v11, "set"));

  if ((self & 1) != 0)
  {
    v12 = xmmword_1ECED4000(a4, a5, v10);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = kPCSErrorDomain;
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("dsid does not match current persona's account dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 146, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v16);
    v12 = -25291;
  }

  return v12;
}

- (void)setIdentityToCurrent
{
  void *v3;
  char v4;
  void *v5;
  const __CFString *CKKSViewByName;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *AccessGroupByName;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (*v25)(__CFString *, void *, const __CFString *, void *, void *, void *, void *, _QWORD *);
  _QWORD v26[5];
  id v27;
  uint8_t buf[8];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[PCSCKKSCreateIdentityOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

  if ((v4 & 1) != 0)
  {
    -[PCSCKKSItemModifyContext service](self->_context, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKKSViewByName = PCSServiceItemGetCKKSViewByName(v5);

    if (CKKSViewByName)
    {
      -[PCSCKKSCreateIdentityOperation context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mtt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "measurePoint:", CFSTR("CKKSSetCurrentIdentity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void (*)(__CFString *, void *, const __CFString *, void *, void *, void *, void *, _QWORD *))off_1ECED4010;
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      AccessGroupByName = PCSServiceItemGetAccessGroupByName(v10);
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSItemModifyContext rollItemReference](self->_context, "rollItemReference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSItemModifyContext rollItemSHA1](self->_context, "rollItemSHA1");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSItemModifyContext existingItemReference](self->_context, "existingItemReference");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSItemModifyContext existingItemSHA1](self->_context, "existingItemSHA1");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __54__PCSCKKSCreateIdentityOperation_setIdentityToCurrent__block_invoke;
      v26[3] = &unk_1E553DF48;
      v26[4] = self;
      v27 = v9;
      v17 = v9;
      v25(AccessGroupByName, v12, CKKSViewByName, v13, v14, v15, v16, v26);

    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = kPCSErrorDomain;
      v29 = *MEMORY[0x1E0CB2D50];
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("No view hint for %@"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 102, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSCreateIdentityOperation itemStored:](self, "itemStored:", v24);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
  }
}

void __54__PCSCKKSCreateIdentityOperation_setIdentityToCurrent__block_invoke(uint64_t a1, const void *a2)
{
  CFTypeRef v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CFTypeRef v8;
  CFTypeRef cf;

  v2 = a2;
  cf = 0;
  if (a2)
    goto LABEL_7;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "rollIdentity")
    || _PCSIdentityIsManatee(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "rollIdentity")))
  {
    goto LABEL_6;
  }
  v4 = PCSIdentitySetSetCurrentIdentityWithError(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "set"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "rollIdentity"), &cf);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "log");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "service");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    PCSMigrationLog(v5, CFSTR("Successfully set current 'type' bit for service %@"), v6);

LABEL_6:
    v2 = 0;
    goto LABEL_7;
  }
  PCSMigrationLog(v5, CFSTR("Failed to set current 'type' bit for service %@: %@"), v6, cf);

  v2 = cf;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "complete:", v2 == 0);
  objc_msgSend(*(id *)(a1 + 32), "itemStored:", v2);
  v8 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v8);
  }
}

- (void)itemStored:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  PCSCKKSItemModifyContext *context;
  uint64_t v12;
  uint8_t v13[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PCSCKKSCreateIdentityOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v5, "set"));

  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v13, 2u);
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = kPCSErrorDomain;
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("dsid does not match current persona's account dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 146, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSCKKSOperation setError:](self, "setError:", v10);

    goto LABEL_8;
  }
  if (!v4)
  {
    context = self->_context;
    v12 = -[PCSCKKSItemModifyContext rollIdentity](context, "rollIdentity");
    -[PCSCKKSItemModifyContext rollItemReference](self->_context, "rollItemReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSCKKSItemModifyContext setCurrentIdentity:persistentReference:](context, "setCurrentIdentity:persistentReference:", v12, v9);
LABEL_8:

    goto LABEL_9;
  }
  -[PCSCKKSOperation setError:](self, "setError:", v4);
LABEL_9:
  -[PCSCKKSOperation completeOperation](self, "completeOperation");

}

- (PCSCKKSItemModifyContext)context
{
  return (PCSCKKSItemModifyContext *)objc_getProperty(self, a2, 272, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
