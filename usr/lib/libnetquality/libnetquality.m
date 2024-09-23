const char *NetworkQualityStages_to_string(unsigned int a1)
{
  if (a1 > 0xB)
    return "UnknownStage";
  else
    return off_24C976670[a1];
}

void sub_20E626414(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20E627A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __getSymptomReporter_block_invoke()
{
  uint64_t result;

  result = symptom_framework_init();
  getSymptomReporter_symptomReporter = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t CreateSelfSignedIdentity(void *a1, void **a2, CFArrayRef *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  __SecKey *RandomKey;
  __SecKey *v10;
  SecKeyRef v11;
  SecKeyRef v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t SelfSignedCertificate;
  const void *v21;
  uint64_t v22;
  __SecIdentity *v23;
  uint64_t v24;
  CFArrayRef v25;
  sec_identity_t v26;
  void *v27;
  uint64_t v28;
  CFArrayRef *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];
  void *v35;
  _QWORD v36[2];
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = *MEMORY[0x24BDE9080];
  v7 = *MEMORY[0x24BDE9048];
  v39[0] = *MEMORY[0x24BDE9050];
  v39[1] = v7;
  v40[0] = v6;
  v40[1] = &unk_24C97CC40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  RandomKey = SecKeyCreateRandomKey(v8, 0);
  if (RandomKey)
  {
    v10 = RandomKey;
    v11 = SecKeyCopyPublicKey(RandomKey);
    if (v11)
    {
      v12 = v11;
      v30 = a3;
      v36[0] = *MEMORY[0x24BDE93E0];
      v36[1] = CFSTR("Apple Inc.");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v14;
      v34[0] = *MEMORY[0x24BDE93D0];
      v34[1] = v5;
      v31 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = *MEMORY[0x24BDE9218];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      SelfSignedCertificate = SecGenerateSelfSignedCertificate();
      if (SelfSignedCertificate)
      {
        v21 = (const void *)SelfSignedCertificate;
        v22 = SecIdentityCreate();
        if (v22)
        {
          v23 = (__SecIdentity *)v22;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v21);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *v30;
          *v30 = (CFArrayRef)v24;

          v26 = sec_identity_create_with_certificates(v23, *v30);
          v27 = *a2;
          *a2 = v26;

          CFRelease(v23);
          CFRelease(v21);
          v28 = 0;
LABEL_18:
          v5 = v31;
          CFRelease(v12);
          CFRelease(v10);

          goto LABEL_19;
        }
        netqual_log_init();
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
          CreateSelfSignedIdentity_cold_4();
        CFRelease(v21);
      }
      else
      {
        netqual_log_init();
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
          CreateSelfSignedIdentity_cold_3();
      }
      v28 = 4294966387;
      goto LABEL_18;
    }
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      CreateSelfSignedIdentity_cold_2();
    CFRelease(v10);
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      CreateSelfSignedIdentity_cold_1();
  }
  v28 = 4294966387;
LABEL_19:

  return v28;
}

const char *nw_connection_client_accurate_ecn_state_to_string(unsigned int a1)
{
  if (a1 > 9)
    return "ecn_unknown_state";
  else
    return off_24C9766D0[a1];
}

const char *nw_interface_type_to_string(unsigned int a1)
{
  if (a1 > 4)
    return "unknown";
  else
    return off_24C976720[a1];
}

void sub_20E62EDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20E6313A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

float get_average(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  float v8;
  float v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v2);
          v5 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue", (_QWORD)v11);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
      v8 = (float)v5;
    }
    else
    {
      v8 = 0.0;
    }

    v9 = v8 / (float)(unint64_t)objc_msgSend(v2, "count");
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

void netqual_log_init()
{
  if (netqual_log_init_onceToken != -1)
    dispatch_once(&netqual_log_init_onceToken, &__block_literal_global_0);
}

void __netqual_log_init_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkQuality", "netqual");
  v1 = (void *)os_log_netqual;
  os_log_netqual = (uint64_t)v0;

}

void sub_20E632ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E635580(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20E636D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void CreateSelfSignedIdentity_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - SecKeyCreateRandomKey failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void CreateSelfSignedIdentity_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - SecKeyCopyPublicKey failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void CreateSelfSignedIdentity_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - SecGenerateSelfSignedCertificate() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void CreateSelfSignedIdentity_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - SecIdentityCreate() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return (CFStringRef)MEMORY[0x24BDF5660](store);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x24BDE8A40]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLRequestSetAllowedProtocolTypes()
{
  return MEMORY[0x24BDB75A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x24BDADD80](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0950]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0960]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0990]();
}

uint64_t nw_activity_is_complete()
{
  return MEMORY[0x24BDE09D8]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x24BDE09E8]();
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x24BDE0A00](name, type, domain);
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x24BDE0A48]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x24BDE0A50]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x24BDE0B48](connection);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0D00](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x24BDE0D10](context_identifier);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
  MEMORY[0x24BDE0D40](context, protocol_metadata);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x24BDE0E30](endpoint);
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x24BDE0E50](endpoint);
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E78](name, type, domain);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x24BDE0EC0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0EE0](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F20](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F40](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x24BDE0FB8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x24BDE0FC8](error);
}

uint64_t nw_establishment_report_enumerate_protocol_l4s_state()
{
  return MEMORY[0x24BDE0FD8]();
}

void nw_establishment_report_enumerate_protocols(nw_establishment_report_t report, nw_report_protocol_enumerator_t enumerate_block)
{
  MEMORY[0x24BDE0FE0](report, enumerate_block);
}

uint64_t nw_http2_set_idle_timeout()
{
  return MEMORY[0x24BDE11C0]();
}

uint64_t nw_http3_set_idle_timeout()
{
  return MEMORY[0x24BDE11D0]();
}

uint64_t nw_http_create_metadata_for_response()
{
  return MEMORY[0x24BDE11F0]();
}

uint64_t nw_http_fields_append()
{
  return MEMORY[0x24BDE1240]();
}

uint64_t nw_http_messaging_create_options()
{
  return MEMORY[0x24BDE1270]();
}

uint64_t nw_http_metadata_copy_request()
{
  return MEMORY[0x24BDE1280]();
}

uint64_t nw_http_request_access_path()
{
  return MEMORY[0x24BDE12B8]();
}

uint64_t nw_http_response_create_well_known()
{
  return MEMORY[0x24BDE1338]();
}

uint64_t nw_http_response_get_status_code()
{
  return MEMORY[0x24BDE1348]();
}

uint64_t nw_http_response_set_status_code()
{
  return MEMORY[0x24BDE1360]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x24BDE1380]();
}

uint64_t nw_interface_get_radio_type()
{
  return MEMORY[0x24BDE13C8]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

uint64_t nw_interface_radio_type_to_string()
{
  return MEMORY[0x24BDE13E0]();
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x24BDE1440](listener);
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1448](parameters);
}

uint64_t nw_listener_create_with_launchd_key()
{
  return MEMORY[0x24BDE1450]();
}

nw_listener_t nw_listener_create_with_port(const char *port, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1458](port, parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x24BDE1460](listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x24BDE1468](listener, advertise_descriptor);
}

void nw_listener_set_advertised_endpoint_changed_handler(nw_listener_t listener, nw_listener_advertised_endpoint_changed_handler_t handler)
{
  MEMORY[0x24BDE1478](listener, handler);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x24BDE1488](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1498](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x24BDE14A0](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x24BDE14A8](listener);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x24BDE1528](parameters);
}

nw_endpoint_t nw_parameters_copy_local_endpoint(nw_parameters_t parameters)
{
  return (nw_endpoint_t)MEMORY[0x24BDE1538](parameters);
}

uint64_t nw_parameters_create_quic_stream()
{
  return MEMORY[0x24BDE1580]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_attach_protocol_listener()
{
  return MEMORY[0x24BDE1638]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x24BDE1658]();
}

uint64_t nw_parameters_set_prohibit_joining_protocols()
{
  return MEMORY[0x24BDE1730]();
}

uint64_t nw_parameters_set_receive_any_interface()
{
  return MEMORY[0x24BDE1738]();
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x24BDE1758](parameters, reuse_local_address);
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x24BDE1760]();
}

uint64_t nw_protocol_copy_http_definition()
{
  return MEMORY[0x24BDE1B40]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x24BDE1B60]();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1B80]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1B88]();
}

BOOL nw_protocol_definition_is_equal(nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x24BDE1BD8](definition1, definition2);
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x24BDE2040](stack, protocol);
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x24BDE20E8]();
}

uint64_t nw_resolver_cancel()
{
  return MEMORY[0x24BDE2398]();
}

uint64_t nw_resolver_create_with_endpoint()
{
  return MEMORY[0x24BDE2468]();
}

uint64_t nw_resolver_set_update_handler()
{
  return MEMORY[0x24BDE2488]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

sec_identity_t sec_identity_create_with_certificates(SecIdentityRef identity, CFArrayRef certificates)
{
  return (sec_identity_t)MEMORY[0x24BDE9588](identity, certificates);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x24BDE95D8](options, application_protocol);
}

void sec_protocol_options_append_tls_ciphersuite_group(sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
  MEMORY[0x24BDE95E8](options, group);
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x24BDE9620](options, identity);
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
  MEMORY[0x24BDE9640](options, peer_authentication_required);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x24BDB00A0]();
}

uint64_t symptom_new()
{
  return MEMORY[0x24BDB00A8]();
}

uint64_t symptom_send()
{
  return MEMORY[0x24BDB00B0]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x24BDB00B8]();
}

