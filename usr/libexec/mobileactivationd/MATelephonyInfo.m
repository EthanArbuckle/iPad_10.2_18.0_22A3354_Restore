@implementation MATelephonyInfo

+ (id)sharedInstance
{
  id v2;
  MATelephonyInfo *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance_telephony)
  {
    v3 = objc_alloc_init(MATelephonyInfo);
    v4 = (void *)sharedInstance_telephony;
    sharedInstance_telephony = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sharedInstance_telephony;
}

- (MATelephonyInfo)init
{
  MATelephonyInfo *v2;
  id v3;
  NSObject *v4;
  CoreTelephonyClient *v5;
  CoreTelephonyClient *telephonyClient;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  id v11;
  NSString *v12;
  NSError *v13;
  NSString *phoneNumber;
  NSError *lastPhoneNumberError;
  NSString *v16;
  NSError *v17;
  NSString *phoneNumberTwo;
  NSError *lastPhoneNumberTwoError;
  NSString *v20;
  NSError *v21;
  NSString *simStatus;
  NSError *lastSimStatusError;
  NSString *v24;
  NSError *v25;
  NSString *simStatusTwo;
  NSError *v27;
  NSNumber *v28;
  NSError *v29;
  NSNumber *connectionAvailability;
  NSError *lastConnectionAvailabilityError;
  NSNumber *v32;
  NSError *v33;
  NSNumber *connectionAvailabilityTwo;
  NSError *lastConnectionAvailabilityTwoError;
  MATelephonyInfo *v36;
  const char *v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  const __CFString *v47;

  v45.receiver = self;
  v45.super_class = (Class)MATelephonyInfo;
  v2 = -[MATelephonyInfo init](&v45, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CoreTelephonyClient);
    v4 = dispatch_get_global_queue(0, 0);
    v5 = (CoreTelephonyClient *)objc_msgSend(v3, "initWithQueue:", v4);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = v5;

    if (v2->_telephonyClient)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = dispatch_queue_create("com.apple.mobileactivationd.dark", v7);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v8;

      if (v2->_queue)
      {
        v10 = (void *)MGCopyAnswer(CFSTR("jkr5aFPOh/d6zTzNKYthBw"), 0);
        v11 = isNSNumber(v10);

        if (v11)
        {
          v2->_dualSIMCapable = objc_msgSend(v10, "BOOLValue");
          v44 = 0;
          v12 = -[MATelephonyInfo _copyPhoneNumberWithSlotID:error:](v2, "_copyPhoneNumberWithSlotID:error:", 1, &v44);
          v13 = (NSError *)v44;
          phoneNumber = v2->_phoneNumber;
          v2->_phoneNumber = v12;

          lastPhoneNumberError = v2->_lastPhoneNumberError;
          v2->_lastPhoneNumberError = v13;

          if (v2->_dualSIMCapable)
          {
            v43 = 0;
            v16 = -[MATelephonyInfo _copyPhoneNumberWithSlotID:error:](v2, "_copyPhoneNumberWithSlotID:error:", 2, &v43);
            v17 = (NSError *)v43;
            phoneNumberTwo = v2->_phoneNumberTwo;
            v2->_phoneNumberTwo = v16;

            lastPhoneNumberTwoError = v2->_lastPhoneNumberTwoError;
            v2->_lastPhoneNumberTwoError = v17;

          }
          v42 = 0;
          v20 = -[MATelephonyInfo _copySIMStatusWithSlotID:error:](v2, "_copySIMStatusWithSlotID:error:", 1, &v42);
          v21 = (NSError *)v42;
          simStatus = v2->_simStatus;
          v2->_simStatus = v20;

          lastSimStatusError = v2->_lastSimStatusError;
          v2->_lastSimStatusError = v21;

          if (v2->_dualSIMCapable)
          {
            v41 = 0;
            v24 = -[MATelephonyInfo _copySIMStatusWithSlotID:error:](v2, "_copySIMStatusWithSlotID:error:", 2, &v41);
            v25 = (NSError *)v41;
            simStatusTwo = v2->_simStatusTwo;
            v2->_simStatusTwo = v24;

            v27 = v2->_lastSimStatusError;
            v2->_lastSimStatusError = v25;

          }
          v40 = 0;
          v28 = -[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:](v2, "_copyConnectionAvailabilityWithSlotID:error:", 1, &v40);
          v29 = (NSError *)v40;
          connectionAvailability = v2->_connectionAvailability;
          v2->_connectionAvailability = v28;

          lastConnectionAvailabilityError = v2->_lastConnectionAvailabilityError;
          v2->_lastConnectionAvailabilityError = v29;

          if (v2->_dualSIMCapable)
          {
            v39 = 0;
            v32 = -[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:](v2, "_copyConnectionAvailabilityWithSlotID:error:", 2, &v39);
            v33 = (NSError *)v39;
            connectionAvailabilityTwo = v2->_connectionAvailabilityTwo;
            v2->_connectionAvailabilityTwo = v32;

            lastConnectionAvailabilityTwoError = v2->_lastConnectionAvailabilityTwoError;
            v2->_lastConnectionAvailabilityTwoError = v33;

          }
          -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);

          goto LABEL_12;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = CFSTR("jkr5aFPOh/d6zTzNKYthBw");
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query '%@'.", buf, 0xCu);
        }

LABEL_21:
        v36 = 0;
        goto LABEL_22;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v37 = "Failed to create queue.";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v37 = "Failed to create Telephony client.";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    goto LABEL_21;
  }
LABEL_12:
  v36 = v2;
LABEL_22:

  return v36;
}

- (void)dealloc
{
  void *otaActivationAssertion;
  objc_super v4;

  otaActivationAssertion = self->_otaActivationAssertion;
  if (otaActivationAssertion)
    CFRelease(otaActivationAssertion);
  v4.receiver = self;
  v4.super_class = (Class)MATelephonyInfo;
  -[MATelephonyInfo dealloc](&v4, "dealloc");
}

- (BOOL)setCellularBootstrapAssertion:(BOOL)a3 withError:(id *)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  id v8;
  NSError *v9;
  BOOL v10;
  NSError *MobileActivationError;

  v5 = a3;
  if (objc_opt_class(CTCellularPlanManager))
  {
    v6 = +[CTCellularPlanManager sharedManager](CTCellularPlanManager, "sharedManager");
    if (v6)
    {
      v7 = v6;
      v8 = +[CTCellularPlanManager sharedManager](CTCellularPlanManager, "sharedManager");
      objc_msgSend(v8, "setUserInPurchaseFlow:", v5);

      v9 = 0;
      v10 = 1;
      goto LABEL_9;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MATelephonyInfo setCellularBootstrapAssertion:withError:]", 156, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query cellular plan manager."));
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MATelephonyInfo setCellularBootstrapAssertion:withError:]", 150, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("CellularPlanManager library is not loaded."));
  }
  v9 = MobileActivationError;
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *a4 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (BOOL)setOTAActivationAssertion:(BOOL)a3 withError:(id *)a4
{
  OS_dispatch_queue *v7;
  int v8;
  BOOL v9;
  _QWORD v11[7];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  v7 = -[MATelephonyInfo queue](self, "queue");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3254779904;
  v11[2] = __55__MATelephonyInfo_setOTAActivationAssertion_withError___block_invoke;
  v11[3] = &__block_descriptor_57_e8_32s40r48r_e5_v8__0l;
  v12 = a3;
  v11[4] = self;
  v11[5] = &v19;
  v11[6] = &v13;
  dispatch_sync((dispatch_queue_t)v7, v11);

  v8 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease((id)v14[5]);
    v8 = *((unsigned __int8 *)v20 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __55__MATelephonyInfo_setOTAActivationAssertion_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  NSError *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFTypeRef v8;
  NSError *v9;
  uint64_t v10;
  void *v11;
  CFTypeRef cf;

  cf = 0;
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_8;
  if (objc_msgSend(*(id *)(a1 + 32), "otaActivationAssertion"))
  {
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_8:
    v7 = *(void **)(a1 + 32);
    v8 = 0;
LABEL_9:
    objc_msgSend(v7, "setOtaActivationAssertion:", v8);
    goto LABEL_10;
  }
  v2 = _CTServerConnectionCreate(kCFAllocatorDefault, 0, 0);
  if (!v2)
  {
    v9 = createMobileActivationError((uint64_t)"-[MATelephonyInfo setOTAActivationAssertion:withError:]_block_invoke", 196, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to connect to CommCenter."));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    return;
  }
  v3 = _CTServerConnectionOTAActivationAssertionCreate(v2, CFSTR("MobileActivation"), &cf);
  if (!HIDWORD(v3))
  {
    v8 = cf;
    v7 = *(void **)(a1 + 32);
    goto LABEL_9;
  }
  v4 = createMobileActivationError((uint64_t)"-[MATelephonyInfo setOTAActivationAssertion:withError:]_block_invoke", 202, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create OTA activation assertion: %d.%d"), v3, HIDWORD(v3));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (cf)
    CFRelease(cf);
}

- (void)setOtaActivationAssertion:(void *)a3
{
  void *otaActivationAssertion;

  otaActivationAssertion = self->_otaActivationAssertion;
  if (otaActivationAssertion)
    CFRelease(otaActivationAssertion);
  self->_otaActivationAssertion = a3;
}

- (BOOL)bootstrapDataServiceAvailableWithError:(id *)a3
{
  CoreTelephonyClient *v4;
  id v5;
  NSError *v6;
  unsigned __int8 v7;
  NSError *v8;
  id v10;

  v4 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  v10 = 0;
  v5 = -[CoreTelephonyClient usingBootstrapDataService:](v4, "usingBootstrapDataService:", &v10);
  v6 = (NSError *)v10;

  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"-[MATelephonyInfo bootstrapDataServiceAvailableWithError:]", 240, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v6, CFSTR("Failed to query bootstrap data service state."));

    v7 = 0;
    v6 = v8;
    if (!a3)
      goto LABEL_7;
  }
  if ((v7 & 1) == 0)
    *a3 = objc_retainAutorelease(v6);
LABEL_7:

  return v7;
}

- (id)copyPhoneNumberWithSlotID:(int64_t)a3 error:(id *)a4
{
  OS_dispatch_queue *v7;
  NSError *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v7 = -[MATelephonyInfo queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v7);

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = -[MATelephonyInfo queue](self, "queue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3254779904;
    v15[2] = __51__MATelephonyInfo_copyPhoneNumberWithSlotID_error___block_invoke;
    v15[3] = &__block_descriptor_64_e8_32s40r48r_e5_v8__0l;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    dispatch_sync((dispatch_queue_t)v11, v15);
    v10 = v11;
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"-[MATelephonyInfo copyPhoneNumberWithSlotID:error:]", 264, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."));
    v9 = (OS_dispatch_queue *)v17[5];
    v17[5] = (uint64_t)v8;
    v10 = v9;
  }

  v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v12 = (void *)v23[5];
  }
  v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __51__MATelephonyInfo_copyPhoneNumberWithSlotID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "phoneNumberTwo");
    if (v4)
    {

    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "lastPhoneNumberTwoError");

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(id *)(v12 + 40);
        v13 = objc_msgSend(v11, "_copyPhoneNumberWithSlotID:error:", 2, &v17);
        objc_storeStrong((id *)(v12 + 40), v17);
        objc_msgSend(*(id *)(a1 + 32), "setPhoneNumberTwo:", v13);

        objc_msgSend(*(id *)(a1 + 32), "setLastPhoneNumberTwoError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "phoneNumberTwo");
  }
  else
  {
    if (v2 != 1)
      return;
    v3 = objc_msgSend(*(id *)(a1 + 32), "phoneNumber");
    if (v3)
    {

    }
    else
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "lastPhoneNumberError");

      if (v5)
      {
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        obj = *(id *)(v7 + 40);
        v8 = objc_msgSend(v6, "_copyPhoneNumberWithSlotID:error:", 1, &obj);
        objc_storeStrong((id *)(v7 + 40), obj);
        objc_msgSend(*(id *)(a1 + 32), "setPhoneNumber:", v8);

        objc_msgSend(*(id *)(a1 + 32), "setLastPhoneNumberError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "phoneNumber");
  }
  v14 = v9;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (id)copySIMStatusWithSlotID:(int64_t)a3 error:(id *)a4
{
  OS_dispatch_queue *v7;
  NSError *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v7 = -[MATelephonyInfo queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v7);

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = -[MATelephonyInfo queue](self, "queue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3254779904;
    v15[2] = __49__MATelephonyInfo_copySIMStatusWithSlotID_error___block_invoke;
    v15[3] = &__block_descriptor_64_e8_32s40r48r_e5_v8__0l;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    dispatch_sync((dispatch_queue_t)v11, v15);
    v10 = v11;
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"-[MATelephonyInfo copySIMStatusWithSlotID:error:]", 305, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."));
    v9 = (OS_dispatch_queue *)v17[5];
    v17[5] = (uint64_t)v8;
    v10 = v9;
  }

  v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v12 = (void *)v23[5];
  }
  v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __49__MATelephonyInfo_copySIMStatusWithSlotID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "simStatusTwo");
    if (v4)
    {

    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "lastSimStatusTwoError");

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(id *)(v12 + 40);
        v13 = objc_msgSend(v11, "_copySIMStatusWithSlotID:error:", 2, &v17);
        objc_storeStrong((id *)(v12 + 40), v17);
        objc_msgSend(*(id *)(a1 + 32), "setSimStatusTwo:", v13);

        objc_msgSend(*(id *)(a1 + 32), "setLastSimStatusTwoError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "simStatusTwo");
  }
  else
  {
    if (v2 != 1)
      return;
    v3 = objc_msgSend(*(id *)(a1 + 32), "simStatus");
    if (v3)
    {

    }
    else
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "lastSimStatusError");

      if (v5)
      {
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        obj = *(id *)(v7 + 40);
        v8 = objc_msgSend(v6, "_copySIMStatusWithSlotID:error:", 1, &obj);
        objc_storeStrong((id *)(v7 + 40), obj);
        objc_msgSend(*(id *)(a1 + 32), "setSimStatus:", v8);

        objc_msgSend(*(id *)(a1 + 32), "setLastSimStatusError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "simStatus");
  }
  v14 = v9;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (id)copyConnectionAvailabilityWithSlotID:(int64_t)a3 error:(id *)a4
{
  OS_dispatch_queue *v7;
  NSError *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v7 = -[MATelephonyInfo queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v7);

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = -[MATelephonyInfo queue](self, "queue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3254779904;
    v15[2] = __62__MATelephonyInfo_copyConnectionAvailabilityWithSlotID_error___block_invoke;
    v15[3] = &__block_descriptor_64_e8_32s40r48r_e5_v8__0l;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    dispatch_sync((dispatch_queue_t)v11, v15);
    v10 = v11;
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"-[MATelephonyInfo copyConnectionAvailabilityWithSlotID:error:]", 346, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."));
    v9 = (OS_dispatch_queue *)v17[5];
    v17[5] = (uint64_t)v8;
    v10 = v9;
  }

  v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v12 = (void *)v23[5];
  }
  v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __62__MATelephonyInfo_copyConnectionAvailabilityWithSlotID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "connectionAvailabilityTwo");
    if (v4)
    {

    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "lastConnectionAvailabilityTwoError");

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(id *)(v12 + 40);
        v13 = objc_msgSend(v11, "_copyConnectionAvailabilityWithSlotID:error:", 2, &v17);
        objc_storeStrong((id *)(v12 + 40), v17);
        objc_msgSend(*(id *)(a1 + 32), "setConnectionAvailabilityTwo:", v13);

        objc_msgSend(*(id *)(a1 + 32), "setLastConnectionAvailabilityTwoError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "connectionAvailabilityTwo");
  }
  else
  {
    if (v2 != 1)
      return;
    v3 = objc_msgSend(*(id *)(a1 + 32), "connectionAvailability");
    if (v3)
    {

    }
    else
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "lastConnectionAvailabilityError");

      if (v5)
      {
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        obj = *(id *)(v7 + 40);
        v8 = objc_msgSend(v6, "_copyConnectionAvailabilityWithSlotID:error:", 1, &obj);
        objc_storeStrong((id *)(v7 + 40), obj);
        objc_msgSend(*(id *)(a1 + 32), "setConnectionAvailability:", v8);

        objc_msgSend(*(id *)(a1 + 32), "setLastConnectionAvailabilityError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "connectionAvailability");
  }
  v14 = v9;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (id)_copySIMStatusWithSlotID:(int64_t)a3 error:(id *)a4
{
  NSError *v5;
  CTXPCServiceSubscriptionContext *v6;
  dispatch_semaphore_t v7;
  CoreTelephonyClient *v10;
  id v11;
  id v12;
  NSError *v13;
  id v15;

  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]", 388, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."));
    v6 = 0;
    v7 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v7 = dispatch_semaphore_create(0);
  if (!v7)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]", 394, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create semaphore."));
    v6 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v6 = +[CTXPCServiceSubscriptionContext contextWithSlot:](CTXPCServiceSubscriptionContext, "contextWithSlot:", a3);
  if (!v6)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]", 400, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve context for slot ID %ld."), a3);
    if (!a4)
    {
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
LABEL_11:
    v5 = objc_retainAutorelease(v5);
    v12 = 0;
    *a4 = v5;
    goto LABEL_14;
  }
  v10 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  v15 = 0;
  v11 = -[CoreTelephonyClient getSIMStatus:error:](v10, "getSIMStatus:error:", v6, &v15);
  v5 = (NSError *)v15;

  if (!v11)
  {
    v13 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]", 406, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v5, CFSTR("Failed to retrieve SIM status for SIM slot ID %d."), -[CTXPCServiceSubscriptionContext slotID](v6, "slotID"));

    v5 = v13;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v12 = v11;
LABEL_14:

  return v12;
}

- (id)_copyPhoneNumberWithSlotID:(int64_t)a3 error:(id *)a4
{
  NSError *v5;
  id v6;
  CTXPCServiceSubscriptionContext *v7;
  CoreTelephonyClient *v10;
  id v11;
  id v12;
  NSError *v14;
  id v15;

  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]", 429, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."));
    v6 = 0;
    v7 = 0;
    goto LABEL_10;
  }
  v7 = +[CTXPCServiceSubscriptionContext contextWithSlot:](CTXPCServiceSubscriptionContext, "contextWithSlot:");
  if (!v7)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]", 435, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve context for slot ID %ld."), a3);
    v6 = 0;
LABEL_10:
    v11 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v10 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  v15 = 0;
  v11 = -[CoreTelephonyClient getPhoneNumber:error:](v10, "getPhoneNumber:error:", v7, &v15);
  v5 = (NSError *)v15;

  if (v11)
  {
    if (!objc_msgSend(v11, "isPresent")
      || (v6 = objc_msgSend(v11, "number"), v6, v6))
    {
      v6 = objc_msgSend(v11, "number");
      if (!a4)
        goto LABEL_13;
      goto LABEL_11;
    }
    v14 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]", 446, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve phone number."));

  }
  else
  {
    v14 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]", 441, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v5, CFSTR("Failed to retrieve phone number information for subscription context."));

    v6 = 0;
  }
  v5 = v14;
  if (!a4)
    goto LABEL_13;
LABEL_11:
  if (!v6)
    *a4 = objc_retainAutorelease(v5);
LABEL_13:
  v12 = v6;

  return v12;
}

- (id)_copyConnectionAvailabilityWithSlotID:(int64_t)a3 error:(id *)a4
{
  NSError *v5;
  id v6;
  CTXPCServiceSubscriptionContext *v7;
  CoreTelephonyClient *v10;
  NSNumber *v11;
  NSError *v13;
  id v14;

  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]", 469, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."));
    v6 = 0;
    v7 = 0;
    goto LABEL_8;
  }
  v7 = +[CTXPCServiceSubscriptionContext contextWithSlot:](CTXPCServiceSubscriptionContext, "contextWithSlot:");
  if (!v7)
  {
    v5 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]", 475, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve context for slot ID %ld."), a3);
    v6 = 0;
LABEL_8:
    v11 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_9;
  }
  v10 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  v14 = 0;
  v6 = -[CoreTelephonyClient getConnectionAvailability:connectionType:error:](v10, "getConnectionAvailability:connectionType:error:", v7, 9, &v14);
  v5 = (NSError *)v14;

  if (v6)
  {
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "available"));
    if (!a4)
      goto LABEL_11;
  }
  else
  {
    v13 = createMobileActivationError((uint64_t)"-[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]", 481, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v5, CFSTR("Failed to retrieve connection availability for SIM slot id %ld."), -[CTXPCServiceSubscriptionContext slotID](v7, "slotID"));

    v6 = 0;
    v11 = 0;
    v5 = v13;
    if (!a4)
      goto LABEL_11;
  }
LABEL_9:
  if (!v11)
    *a4 = objc_retainAutorelease(v5);
LABEL_11:

  return v11;
}

- (void)phoneNumberChanged:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  unsigned int v10;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = objc_msgSend(v4, "slotID");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Phone number changed (%d).", buf, 8u);
  }
  v5 = -[MATelephonyInfo queue](self, "queue");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3254779904;
  v7[2] = __38__MATelephonyInfo_phoneNumberChanged___block_invoke;
  v7[3] = &__block_descriptor_48_e8_32s40s_e5_v8__0l;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async((dispatch_queue_t)v5, v7);

}

void __38__MATelephonyInfo_phoneNumberChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "slotID");
  v6 = 0;
  v4 = objc_msgSend(v2, "_copyPhoneNumberWithSlotID:error:", v3, &v6);
  v5 = v6;
  if (objc_msgSend(*(id *)(a1 + 40), "slotID") == (id)1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPhoneNumber:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setLastPhoneNumberError:", v5);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "slotID") == (id)2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPhoneNumberTwo:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setLastPhoneNumberTwoError:", v5);
  }

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MATelephonyInfo *v13;
  id v14;
  uint8_t buf[4];
  unsigned int v16;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = objc_msgSend(v6, "slotID");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SIM status changed (%d).", buf, 8u);
  }
  v8 = -[MATelephonyInfo queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __45__MATelephonyInfo_simStatusDidChange_status___block_invoke;
  block[3] = &__block_descriptor_56_e8_32s40s48s_e5_v8__0l;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async((dispatch_queue_t)v8, block);

}

id __45__MATelephonyInfo_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  id result;

  if (objc_msgSend(*(id *)(a1 + 32), "slotID") == (id)1)
  {
    objc_msgSend(*(id *)(a1 + 40), "setSimStatus:", *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 40), "setLastSimStatusError:", 0);
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "slotID");
    if (result == (id)2)
    {
      objc_msgSend(*(id *)(a1 + 40), "setSimStatusTwo:", *(_QWORD *)(a1 + 48));
      return objc_msgSend(*(id *)(a1 + 40), "setLastSimStatusTwoError:", 0);
    }
  }
  return result;
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MATelephonyInfo *v14;
  uint8_t buf[4];
  unsigned int v16;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = objc_msgSend(v6, "slotID");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Connection availability changed (%d).", buf, 8u);
  }
  v8 = -[MATelephonyInfo queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __63__MATelephonyInfo_connectionAvailability_availableConnections___block_invoke;
  block[3] = &__block_descriptor_56_e8_32s40s48s_e5_v8__0l;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async((dispatch_queue_t)v8, block);

}

id __63__MATelephonyInfo_connectionAvailability_availableConnections___block_invoke(id *a1)
{
  id v2;
  NSNumber *v3;
  id result;
  NSNumber *v5;

  v2 = objc_msgSend(a1[4], "containsObject:", kCTDataConnectionServiceTypeOTAActivation);
  if (objc_msgSend(a1[5], "slotID") == (id)1)
  {
    v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v2);
    objc_msgSend(a1[6], "setConnectionAvailability:", v3);

    return objc_msgSend(a1[6], "setLastConnectionAvailabilityError:", 0);
  }
  else
  {
    result = objc_msgSend(a1[5], "slotID");
    if (result == (id)2)
    {
      v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v2);
      objc_msgSend(a1[6], "setConnectionAvailabilityTwo:", v5);

      return objc_msgSend(a1[6], "setLastConnectionAvailabilityTwoError:", 0);
    }
  }
  return result;
}

- (BOOL)dualSIMCapable
{
  return self->_dualSIMCapable;
}

- (void)setDualSIMCapable:(BOOL)a3
{
  self->_dualSIMCapable = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)phoneNumberTwo
{
  return self->_phoneNumberTwo;
}

- (void)setPhoneNumberTwo:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberTwo, a3);
}

- (NSString)simStatus
{
  return self->_simStatus;
}

- (void)setSimStatus:(id)a3
{
  objc_storeStrong((id *)&self->_simStatus, a3);
}

- (NSString)simStatusTwo
{
  return self->_simStatusTwo;
}

- (void)setSimStatusTwo:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusTwo, a3);
}

- (NSNumber)connectionAvailability
{
  return self->_connectionAvailability;
}

- (void)setConnectionAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_connectionAvailability, a3);
}

- (NSNumber)connectionAvailabilityTwo
{
  return self->_connectionAvailabilityTwo;
}

- (void)setConnectionAvailabilityTwo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionAvailabilityTwo, a3);
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSError)lastPhoneNumberError
{
  return self->_lastPhoneNumberError;
}

- (void)setLastPhoneNumberError:(id)a3
{
  objc_storeStrong((id *)&self->_lastPhoneNumberError, a3);
}

- (NSError)lastPhoneNumberTwoError
{
  return self->_lastPhoneNumberTwoError;
}

- (void)setLastPhoneNumberTwoError:(id)a3
{
  objc_storeStrong((id *)&self->_lastPhoneNumberTwoError, a3);
}

- (NSError)lastSimStatusError
{
  return self->_lastSimStatusError;
}

- (void)setLastSimStatusError:(id)a3
{
  objc_storeStrong((id *)&self->_lastSimStatusError, a3);
}

- (NSError)lastSimStatusTwoError
{
  return self->_lastSimStatusTwoError;
}

- (void)setLastSimStatusTwoError:(id)a3
{
  objc_storeStrong((id *)&self->_lastSimStatusTwoError, a3);
}

- (NSError)lastConnectionAvailabilityError
{
  return self->_lastConnectionAvailabilityError;
}

- (void)setLastConnectionAvailabilityError:(id)a3
{
  objc_storeStrong((id *)&self->_lastConnectionAvailabilityError, a3);
}

- (NSError)lastConnectionAvailabilityTwoError
{
  return self->_lastConnectionAvailabilityTwoError;
}

- (void)setLastConnectionAvailabilityTwoError:(id)a3
{
  objc_storeStrong((id *)&self->_lastConnectionAvailabilityTwoError, a3);
}

- (void)otaActivationAssertion
{
  return self->_otaActivationAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionAvailabilityTwoError, 0);
  objc_storeStrong((id *)&self->_lastConnectionAvailabilityError, 0);
  objc_storeStrong((id *)&self->_lastSimStatusTwoError, 0);
  objc_storeStrong((id *)&self->_lastSimStatusError, 0);
  objc_storeStrong((id *)&self->_lastPhoneNumberTwoError, 0);
  objc_storeStrong((id *)&self->_lastPhoneNumberError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_connectionAvailabilityTwo, 0);
  objc_storeStrong((id *)&self->_connectionAvailability, 0);
  objc_storeStrong((id *)&self->_simStatusTwo, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_phoneNumberTwo, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
