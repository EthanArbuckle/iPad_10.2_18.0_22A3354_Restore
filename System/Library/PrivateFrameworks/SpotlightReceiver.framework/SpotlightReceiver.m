void sub_21066FBB0()
{
  objc_end_catch();
  JUMPOUT(0x21066FBC4);
}

void SpotlightReceiverRegister(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SpotlightReceiverRegister_block_invoke;
  block[3] = &unk_24CA42D40;
  v9 = v4;
  v10 = v3;
  v5 = SpotlightReceiverRegister_onceToken;
  v6 = v3;
  v7 = v4;
  if (v5 != -1)
    dispatch_once(&SpotlightReceiverRegister_onceToken, block);

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void SpotlightDaemonClientRegister(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SpotlightDaemonClientRegister_block_invoke;
  block[3] = &unk_24CA42D40;
  v9 = v4;
  v10 = v3;
  v5 = SpotlightDaemonClientRegister_onceToken;
  v6 = v3;
  v7 = v4;
  if (v5 != -1)
    dispatch_once(&SpotlightDaemonClientRegister_onceToken, block);

}

uint64_t _SpotlightDaemonClientHandleCommand(const char *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t uint64;
  id *v24;
  dispatch_group_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v43;
  os_signpost_id_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  id obj;
  void *v51;
  void *v52;
  _QWORD block[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  NSObject *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  void (**v64)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v65[4];
  void (**v66)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v67[4];
  void (**v68)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v69[4];
  void (**v70)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  void (**v74)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v75[4];
  void (**v76)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v77[4];
  void (**v78)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v79[4];
  id v80;
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v83 = (uint64_t)a1;
    v84 = 2048;
    v85 = (uint64_t)v5;
    _os_log_impl(&dword_21066D000, v7, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] _SpotlightDaemonClientHandleCommand daemon client command %s info:%p", buf, 0x16u);
  }

  v79[0] = MEMORY[0x24BDAC760];
  v79[1] = 3221225472;
  v79[2] = ___SpotlightDaemonClientHandleCommand_block_invoke;
  v79[3] = &unk_24CA42D68;
  v8 = v5;
  v80 = v8;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BC9010](v79);
  if (!strcmp(a1, "s"))
  {
    v9[2](v9, 0, 0, 0, 0);
    v20 = 1;
    goto LABEL_50;
  }
  if (!strcmp(a1, "ri"))
  {
    obj = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v8);
    v52 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v8);
    v26 = (void *)MEMORY[0x24BDC24C8];
    xpc_dictionary_get_value(v8, "idsa");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v26, "copyNSStringArrayFromXPCArray:", v27);

    v22 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "rire", v8);
    if (v21)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_43;
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_2;
      v77[3] = &unk_24CA42D90;
      v24 = (id *)&v78;
      v78 = v9;
      v25 = (dispatch_group_t)MEMORY[0x212BC9010](v77);
      objc_msgSend(v6, "reindexItemsWithIdentifiers:bundleID:protectionClass:acknowledgementHandler:", v21, v52, obj, v25);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v73[0] = MEMORY[0x24BDAC760];
          v73[1] = 3221225472;
          v73[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_4;
          v73[3] = &unk_24CA42D90;
          v24 = (id *)&v74;
          v74 = v9;
          v25 = (dispatch_group_t)MEMORY[0x212BC9010](v73);
          objc_msgSend(v6, "reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:", v52, obj, v25);
          goto LABEL_42;
        }
        goto LABEL_43;
      }
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_3;
      v75[3] = &unk_24CA42D90;
      v24 = (id *)&v76;
      v76 = v9;
      v25 = (dispatch_group_t)MEMORY[0x212BC9010](v75);
      objc_msgSend(v6, "reindexAllItemsForBundleID:protectionClass:reason:acknowledgementHandler:", v52, obj, v22, v25);
    }
    goto LABEL_42;
  }
  v10 = strcmp(a1, "pd");
  if (!v10 || !strcmp(a1, "pu"))
  {
    obj = (id)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "id", v8);
    if (!obj)
      goto LABEL_45;
    v52 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v8);
    if (!v52)
      goto LABEL_44;
    v21 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v8);
    v22 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "t", v8);
    uint64 = xpc_dictionary_get_uint64(v8, "po");
    if (!v10)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v69[0] = MEMORY[0x24BDAC760];
        v69[1] = 3221225472;
        v69[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_36;
        v69[3] = &unk_24CA42DE0;
        v24 = (id *)&v70;
        v70 = v9;
        v25 = (dispatch_group_t)MEMORY[0x212BC9010](v69);
        objc_msgSend(v6, "provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", v52, v21, obj, v22, uint64, v25);
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_43;
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_2_41;
    v67[3] = &unk_24CA42E08;
    v24 = (id *)&v68;
    v68 = v9;
    v25 = (dispatch_group_t)MEMORY[0x212BC9010](v67);
    objc_msgSend(v6, "provideFileURLForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", v52, v21, obj, v22, uint64, v25);
LABEL_42:

    v9 = 0;
    goto LABEL_43;
  }
  if (strcmp(a1, "pus"))
  {
    if (!strcmp(a1, "siu"))
    {
      v11 = (void *)MEMORY[0x24BDC24C8];
      xpc_dictionary_get_value(v8, "si");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "copyNSArrayFromXPCArray:", v12);

      v14 = v8;
      v15 = xpc_dictionary_get_uint64(v8, "iam");
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_5;
      v71[3] = &unk_24CA42DB8;
      v17 = v16;
      v72 = v17;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v71);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || !v17)
        {

          goto LABEL_54;
        }
        v19 = objc_msgSend(v17, "count");

        if (!v19)
        {
LABEL_54:
          logForCSLogCategoryDaemonClient();
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = os_signpost_id_generate(v43);

          logForCSLogCategoryDaemonClient();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
          {
            v47 = objc_msgSend(v17, "count");
            *(_DWORD *)buf = 134218240;
            v83 = v47;
            v84 = 2048;
            v85 = v15;
            _os_signpost_emit_with_name_impl(&dword_21066D000, v46, OS_SIGNPOST_EVENT, v44, "ClientNotified", "count:%ld, mask:0x%lx", buf, 0x16u);
          }

          objc_msgSend(v6, "searchableItemsDidUpdate:mask:", v17, v15);
        }
      }
      v9[2](v9, 0, 0, 0, 0);

      v20 = 1;
      v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13;
      v8 = v14;
      goto LABEL_50;
    }
    goto LABEL_46;
  }
  v28 = (void *)MEMORY[0x24BDC24C8];
  xpc_dictionary_get_array(v8, "idsa");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "copyNSStringArrayFromXPCArray:", v29);

  obj = v30;
  if (v30)
  {
    v52 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "b", v8);
    if (v52)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v8);
      v22 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "t", v8);
      v31 = xpc_dictionary_get_uint64(v8, "po");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_3_47;
        v65[3] = &unk_24CA42E30;
        v24 = (id *)&v66;
        v66 = v9;
        v25 = (dispatch_group_t)MEMORY[0x212BC9010](v65);
        objc_msgSend(v6, "provideFileURLsForBundleID:protectionClass:itemIdentifiers:typeIdentifier:options:completionHandler:", v52, v21, v30, v22, v31, v25);
        goto LABEL_42;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v51 = v22;
        v49 = a1;
        v32 = v6;
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_4_51;
        v63[3] = &unk_24CA42E30;
        v64 = v9;
        v48 = (void *)MEMORY[0x212BC9010](v63);
        v25 = dispatch_group_create();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        obj = v30;
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v60 != v36)
                objc_enumerationMutation(obj);
              v38 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
              dispatch_group_enter(v25);
              v56[0] = MEMORY[0x24BDAC760];
              v56[1] = 3221225472;
              v56[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_5_52;
              v56[3] = &unk_24CA42E58;
              v57 = v33;
              v58 = v25;
              objc_msgSend(v32, "provideFileURLForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", v52, v21, v38, v51, v31, v56);

            }
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
          }
          while (v35);
        }

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = ___SpotlightDaemonClientHandleCommand_block_invoke_6;
        block[3] = &unk_24CA42E80;
        v54 = v33;
        v55 = v48;
        v39 = v33;
        v40 = v48;
        dispatch_group_notify(v25, MEMORY[0x24BDAC9B8], block);

        v6 = v32;
        a1 = v49;
        v22 = v51;
        v24 = (id *)&v64;
        goto LABEL_42;
      }
LABEL_43:

    }
LABEL_44:

  }
LABEL_45:

LABEL_46:
  if (!v9)
  {
    v20 = 1;
    goto LABEL_52;
  }
  logForCSLogCategoryDefault();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v83 = (uint64_t)a1;
    v84 = 2048;
    v85 = (uint64_t)v8;
    _os_log_impl(&dword_21066D000, v41, OS_LOG_TYPE_DEFAULT, "command not handled: %s info:%p", buf, 0x16u);
  }

  v20 = 0;
LABEL_50:

LABEL_52:
  return v20;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x24BE66730]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x24BE66738]();
}

uint64_t _MDPlistArrayIterate()
{
  return MEMORY[0x24BE66740]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x24BE66788]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x24BE66800]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

uint64_t logForCSLogCategoryDaemonClient()
{
  return MEMORY[0x24BDC2580]();
}

uint64_t logForCSLogCategoryDefault()
{
  return MEMORY[0x24BDC2588]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0770](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0920](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

