void start()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v0 = dispatch_queue_create("restoreservice_queue", 0);
  v1 = (void *)qword_10002E588;
  qword_10002E588 = (uint64_t)v0;

  v2 = (id)qword_10002E588;
  if (v2)
  {

    v3 = (id)xpc_remote_connection_create_remote_service_listener("com.apple.RestoreRemoteServices.restoreserviced", qword_10002E588, 1);
    if (v3)
    {
      v4 = v3;

      xpc_remote_connection_set_event_handler(v4, &stru_100024928);
      xpc_remote_connection_activate(v4);
      dispatch_main();
    }
  }
  else
  {
    v5 = _os_assert_log();
    _os_crash(v5);
    __break(1u);
  }
  v6 = _os_assert_log();
  _os_crash(v6);
  __break(1u);
}

void sub_1000037F8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  OS_xpc_object *v17;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    v4 = sub_100003900();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100015D24();

    v6 = xpc_copy_clean_description(v2);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = sub_100003900();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100015CC0((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

      free(v7);
    }
  }
  else
  {
    v3 = v2;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003940;
    v16[3] = &unk_100024950;
    v17 = v3;
    xpc_remote_connection_set_event_handler(v3, v16);
    xpc_remote_connection_activate(v3);

  }
}

id sub_100003900()
{
  if (qword_10002E590 != -1)
    dispatch_once(&qword_10002E590, &stru_100024990);
  return (id)qword_10002E598;
}

void sub_100003940(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  id v5;
  void *v6;
  const char *string;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  io_registry_entry_t v35;
  io_registry_entry_t v36;
  CFDataRef v37;
  CFDataRef v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  xpc_object_t reply;
  uint64_t v51;
  __CFDictionary *updated;
  uint64_t v53;
  __CFDictionary *v54;
  void *v55;
  void *v56;
  __CFDictionary *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  NSObject *v75;
  id v76;
  id v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  void *v87;
  const char *v88;
  id v89;
  _BYTE cf[24];

  v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v5 = v3;
    v6 = objc_autoreleasePoolPush();
    if ((xpc_dictionary_expects_reply(v5) & 1) == 0)
    {
      v30 = sub_100003900();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_100016018();

      xpc_connection_cancel(v4);
      goto LABEL_68;
    }
    string = xpc_dictionary_get_string(v5, "command");
    v8 = sub_100003900();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (!string)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100015DF4();
LABEL_26:

      sub_1000044A4(v5, "error");
      v33 = v32;
LABEL_33:
      reply = v33;
LABEL_66:
      v86 = reply;
      if (!v86)
        sub_100015DE0();
      v87 = v86;

      xpc_dictionary_send_reply(v87);
LABEL_68:
      objc_autoreleasePoolPop(v6);

      goto LABEL_69;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)cf = 136446210;
      *(_QWORD *)&cf[4] = string;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Got command %{public}s", cf, 0xCu);
    }

    if (!strcmp(string, "recovery"))
    {
      v34 = v5;
      v35 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
      if (v35)
      {
        v36 = v35;
        v37 = CFDataCreate(0, (const UInt8 *)"false", 5);
        if (!v37)
          sub_100015DE0();
        v38 = v37;
        v39 = IORegistryEntrySetCFProperty(v36, CFSTR("auto-boot-once"), v37);
        v40 = sub_100003900();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        v42 = v41;
        if ((_DWORD)v39)
        {
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            sub_100015E90(v39, v42, v43, v44, v45, v46, v47, v48);
        }
        else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)cf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "auto-boot successfully disabled (via auto-boot-once)", cf, 2u);
        }

        CFRelease(v38);
        IOObjectRelease(v36);
        if (!(_DWORD)v39)
        {
          v68 = sub_100003FC8(v34);
          v69 = (id)objc_claimAutoreleasedReturnValue(v68);
LABEL_50:
          reply = v69;
          goto LABEL_65;
        }
LABEL_49:
        sub_1000044A4(v34, "error");
        v69 = v72;
        goto LABEL_50;
      }
      v58 = sub_100003900();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_100015E20(v59, v60, v61, v62, v63, v64, v65, v66);
    }
    else
    {
      if (!strcmp(string, "reboot"))
      {
        v49 = sub_100003FC8(v5);
        v33 = (id)objc_claimAutoreleasedReturnValue(v49);
        goto LABEL_33;
      }
      if (strcmp(string, "getnonces"))
      {
        if (strcmp(string, "getpreflightinfo"))
        {
          if (!strcmp(string, "getapparameters"))
          {
            v70 = sub_100004078(v5);
            v33 = (id)objc_claimAutoreleasedReturnValue(v70);
            goto LABEL_33;
          }
          if (!strcmp(string, "delayrecoveryimage"))
          {
            v73 = sub_100004188(v5);
            v33 = (id)objc_claimAutoreleasedReturnValue(v73);
            goto LABEL_33;
          }
          if (!strcmp(string, "restorelang"))
          {
            v88 = xpc_dictionary_get_string(v5, "argument");
            v89 = sub_100004318(v5, v88);
            v33 = (id)objc_claimAutoreleasedReturnValue(v89);
            goto LABEL_33;
          }
          v11 = sub_100003900();
          v10 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_100015FB4((uint64_t)string, v10, v12, v13, v14, v15, v16, v17);
          goto LABEL_26;
        }
        v34 = v5;
        *(_QWORD *)cf = 0;
        updated = ramrod_update_copy_deviceinfo(0, (CFErrorRef *)cf);
        if (updated)
        {
          reply = xpc_dictionary_create_reply(v34);
          v67 = (void *)_CFXPCCreateXPCObjectFromCFObject(updated);
          xpc_dictionary_set_value(reply, "preflightinfo", v67);

          xpc_dictionary_set_string(reply, "result", "preflightinfo");
        }
        else
        {
          if (*(_QWORD *)cf)
          {
            v77 = sub_100003900();
            v78 = objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              sub_100015F4C((uint64_t)cf, v78, v79, v80, v81, v82, v83, v84);

            CFRelease(*(CFTypeRef *)cf);
          }
          sub_1000044A4(v34, "error");
          reply = v85;
        }
        if (*(_QWORD *)cf)
          CFRelease(*(CFTypeRef *)cf);
        if (updated)
          goto LABEL_63;
LABEL_65:

        goto LABEL_66;
      }
      v34 = v5;
      v51 = MGCopyAnswer(CFSTR("ApNonce"), 0);
      if (v51)
      {
        updated = (__CFDictionary *)v51;
        v53 = MGCopyAnswer(CFSTR("SEPNonce"), 0);
        if (v53)
        {
          v54 = (__CFDictionary *)v53;
          reply = xpc_dictionary_create_reply(v34);
          v55 = (void *)_CFXPCCreateXPCObjectFromCFObject(updated);
          xpc_dictionary_set_value(reply, "apNonce", v55);

          v56 = (void *)_CFXPCCreateXPCObjectFromCFObject(v54);
          xpc_dictionary_set_value(reply, "sepNonce", v56);

          xpc_dictionary_set_string(reply, "result", "nonces");
          CFRelease(updated);
          v57 = v54;
LABEL_64:
          CFRelease(v57);
          goto LABEL_65;
        }
        v74 = sub_100003900();
        v75 = objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          sub_100015F20();

        sub_1000044A4(v34, "error");
        reply = v76;
LABEL_63:
        v57 = updated;
        goto LABEL_64;
      }
      v71 = sub_100003900();
      v59 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_100015EF4();
    }

    goto LABEL_49;
  }
  v18 = sub_100003900();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_100015DB4();

  v20 = xpc_copy_clean_description(v3);
  if (v20)
  {
    v21 = (void *)v20;
    v22 = sub_100003900();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100015D50((uint64_t)v21, v23, v24, v25, v26, v27, v28, v29);

    free(v21);
  }
LABEL_69:

}

void sub_100003F98(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RestoreRemoteServices.restoreservice", "restoreservice");
  v2 = (void *)qword_10002E598;
  qword_10002E598 = (uint64_t)v1;

}

id sub_100003FC8(void *a1)
{
  id v1;
  dispatch_time_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v8[16];

  v1 = a1;
  v2 = dispatch_time(0, 3000000000);
  dispatch_after(v2, (dispatch_queue_t)qword_10002E588, &stru_1000249B0);
  v3 = sub_100003900();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling reboot3 imminently", v8, 2u);
  }

  sub_1000044A4(v1, "success");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

id sub_100004078(void *a1)
{
  id v1;
  CFDictionaryRef updated;
  xpc_object_t reply;
  void *v4;
  id v5;
  CFTypeRef cf;

  v1 = a1;
  cf = 0;
  updated = ramrod_update_copy_ap_parameters_generating_nonces(0);
  if (updated)
  {
    reply = xpc_dictionary_create_reply(v1);
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject(updated);
    xpc_dictionary_set_value(reply, "apparameters", v4);

    xpc_dictionary_set_string(reply, "result", "apparameters");
  }
  else
  {
    sub_1000044A4(v1, "error");
    reply = v5;
  }
  if (cf)
    CFRelease(cf);
  if (updated)
    CFRelease(updated);

  return reply;
}

id sub_100004188(void *a1)
{
  id v1;
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  CFDataRef v4;
  CFDataRef v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  uint8_t v30[16];

  v1 = a1;
  if (MGGetProductType() != 376943508)
  {
LABEL_11:
    sub_1000044A4(v1, "error");
    v26 = v25;
    goto LABEL_12;
  }
  v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v2)
  {
    v16 = sub_100003900();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100015E20(v17, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_11;
  }
  v3 = v2;
  v4 = CFDataCreate(0, (const UInt8 *)"true", 4);
  if (!v4)
    sub_100015DE0();
  v5 = v4;
  v6 = IORegistryEntrySetCFProperty(v3, CFSTR("delay-recovery-image"), v4);
  v7 = sub_100003900();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100015E90(v6, v9, v10, v11, v12, v13, v14, v15);

    CFRelease(v5);
    IOObjectRelease(v3);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "delay-recovery-image successfully enabled", v30, 2u);
  }

  CFRelease(v5);
  IOObjectRelease(v3);
  sub_1000044A4(v1, "success");
  v26 = (id)objc_claimAutoreleasedReturnValue(v29);
LABEL_12:
  v27 = v26;

  return v27;
}

id sub_100004318(void *a1, const char *a2)
{
  id v3;
  size_t v4;
  CFDataRef v5;
  CFDataRef v6;
  io_registry_entry_t v7;
  io_object_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v34;

  v3 = a1;
  if (MGGetProductType() == 376943508)
  {
    if (a2)
    {
      v4 = strlen(a2);
      v5 = CFDataCreate(0, (const UInt8 *)a2, v4);
      if (!v5)
        sub_100015DE0();
      v6 = v5;
      v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
      if (v7)
      {
        v8 = v7;
        v9 = IORegistryEntrySetCFProperty(v7, CFSTR("restore-lang"), v6);
        if (!(_DWORD)v9)
        {
          CFRelease(v6);
          IOObjectRelease(v8);
          sub_1000044A4(v3, "success");
          v31 = (id)objc_claimAutoreleasedReturnValue(v34);
          goto LABEL_16;
        }
        v10 = v9;
        v11 = sub_100003900();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_100015E90(v10, v12, v13, v14, v15, v16, v17, v18);

        CFRelease(v6);
        IOObjectRelease(v8);
      }
      else
      {
        v21 = sub_100003900();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_100015E20(v22, v23, v24, v25, v26, v27, v28, v29);

        CFRelease(v6);
      }
    }
    else
    {
      v19 = sub_100003900();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100016044();

    }
  }
  sub_1000044A4(v3, "error");
  v31 = v30;
LABEL_16:
  v32 = v31;

  return v32;
}

void sub_1000044A4(void *a1, const char *a2)
{
  id v3;
  xpc_object_t reply;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    v5 = reply;
    xpc_dictionary_set_string(reply, "result", a2);

    v6 = v5;
  }
  else
  {
    v7 = sub_100003900();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100016070(v8, v9, v10, v11, v12, v13, v14, v15);

    __break(1u);
  }
}

void sub_10000451C(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v1 = sub_100003900();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Calling reboot3 now", v5, 2u);
  }

  if (reboot3(0))
  {
    v3 = sub_100003900();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_1000160E0(v4);

  }
}

void sub_1000045B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000045C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000045E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100004600()
{
  return _os_assert_log(0);
}

uint64_t AMRestorePartitionFWCopyTagData(const __CFURL *a1, const __CFString *a2, CFTypeRef *a3, off_t *a4, CFTypeRef *a5, off_t *a6)
{
  void *v6;
  int v11;
  int v12;
  ssize_t v13;
  ssize_t v14;
  off_t v15;
  unsigned int v16;
  const __CFString *v17;
  int v18;
  void *v19;
  off_t v20;
  ssize_t v21;
  CFIndex v22;
  int v23;
  uint64_t v24;
  CFDataRef v25;
  off_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  off_t *v31;
  CFTypeRef *v32;
  off_t *v33;
  off_t v34;
  char v35;
  CFDataRef cf;
  __int16 v38;
  size_t __size;
  _OWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v6 = a1;
  __size = 0;
  v63 = 0;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  memset(v40, 0, sizeof(v40));
  if (!a1)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "inURL is NULL");
    v19 = 0;
LABEL_53:
    v25 = 0;
    v17 = 0;
    v24 = 99;
    goto LABEL_46;
  }
  v11 = sub_100004B84(a1, 0);
  if (!v11)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Unable to open inURL %@", v6);
    v19 = 0;
    v6 = 0;
    goto LABEL_53;
  }
  v12 = v11;
  v6 = malloc(0x8000uLL);
  if (v6)
  {
    v13 = read(v12, v6, 0x8000uLL);
    if (v13)
    {
      v14 = v13;
      v32 = a3;
      v33 = a6;
      v31 = a4;
      v35 = 0;
      v34 = 0;
      v15 = 0;
      v16 = 0;
      cf = 0;
      v17 = 0;
      while (1)
      {
        __size = 0;
        v18 = Img4DecodeParseLengthFromBuffer(v6, v14, &__size);
        if (v18 || !__size)
          break;
        v19 = malloc(__size);
        if (!v19)
        {
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "failed to allocate IMG4buffer", v29, v30);
          goto LABEL_25;
        }
        v20 = lseek(v12, v15, 0);
        if (v20 != v15)
        {
          v27 = v20;
          v28 = __error();
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Unable to rewind to start of IMG4 segment lseek=%ll, errno=%d.", v27, *v28);
          goto LABEL_25;
        }
        v21 = read(v12, v19, __size);
        if (!v21)
        {
          __error();
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "0 bytes read, IMG4 image hit end of block device? - fail errno=%d..");
          goto LABEL_25;
        }
        v22 = v21;
        if (v21 != __size)
        {
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Bytes read didn't match derLen.");
          goto LABEL_25;
        }
        v23 = Img4DecodeInit(v19, v21, v40);
        if (v23)
        {
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Item %02d, der.length=%8d, Bad Img4 inside valid DER sequence. (derstat=%d)", v16 + 1, v22, v23);
        }
        else
        {
          AMSupportSafeRelease(v17);
          v17 = CFStringCreateWithBytes(kCFAllocatorDefault, *((const UInt8 **)&v41 + 1), v42, 0x8000100u, 0);
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Item %02d, offset=%8d, der.length=%8d, img4Tag=[%@]", v16 + 1, v15, v22, v17);
          if (a2 && CFStringCompare(a2, v17, 0) == kCFCompareEqualTo)
          {
            AMSupportLogInternal(6, "AMRestorePartitionFWCopyTagData", "   ^^ Found requested tag.", v16 + 1, v22, v17);
            if (a5)
            {
              if (!cf)
              {
                cf = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v19, v22);
                if (!cf)
                {
                  AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Failed to allocate Img4Data");
                  v25 = 0;
                  goto LABEL_60;
                }
              }
            }
            v35 = 1;
            v34 = v15;
          }
        }
        v15 += __size;
        AMSupportSafeFree(v19);
        v14 = read(v12, v6, 0x8000uLL);
        ++v16;
        if (!v14)
          goto LABEL_27;
      }
      AMSupportLogInternal(6, "AMRestorePartitionFWCopyTagData", "No more segments. (derstat=%d)", v18);
      if (!v16)
        goto LABEL_23;
LABEL_27:
      if (v16 >= 0x21)
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Too Many DER segments!", v29, v30);
        goto LABEL_24;
      }
      if (lseek(v12, v15, 0) != v15)
      {
        __error();
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Unable to seek to terminator segment errno=%d.");
        goto LABEL_24;
      }
      v38 = -1;
      if (read(v12, &v38, 2uLL) != 2)
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Failed to read terminator bytes.", v29, v30);
        goto LABEL_24;
      }
      if (v38 | HIBYTE(v38))
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Invalid termination bytes: [0x%02x, 0x%02x]");
        goto LABEL_24;
      }
      if ((a2 == 0) | v35 & 1)
        v24 = 0;
      else
        v24 = 8;
      if (v33)
        *v33 = v15;
      if (v31)
        *v31 = v34;
      v25 = cf;
      if (v32 && v17)
        *v32 = CFRetain(v17);
      v19 = 0;
      if (a5 && cf)
      {
        v19 = 0;
        *a5 = CFRetain(cf);
      }
    }
    else
    {
      cf = 0;
      v17 = 0;
LABEL_23:
      AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "No DER segments found.");
LABEL_24:
      v19 = 0;
LABEL_25:
      v24 = 99;
      v25 = cf;
    }
  }
  else
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "failed to allocate DER chunk buffer");
    v17 = 0;
    v25 = 0;
    v19 = 0;
LABEL_60:
    v24 = 99;
  }
  if (v12 >= 1)
    close(v12);
LABEL_46:
  AMSupportSafeFree(v6);
  AMSupportSafeFree(v19);
  AMSupportSafeRelease(v17);
  AMSupportSafeRelease(v25);
  return v24;
}

uint64_t sub_100004B84(const __CFURL *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v7;
  char *v8;
  uint64_t v9;
  UInt8 buffer[1024];

  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    AMSupportLogInternal(3, "_AMRestorePartitionOpenFileWithURL", "failed to convert url to file system representation");
    AMSupportLogInternal(7, "_AMRestorePartitionOpenFileWithURL", "%@", a1);
    return 0xFFFFFFFFLL;
  }
  v4 = open((const char *)buffer, a2);
  v5 = v4;
  if ((int)v4 <= 0)
  {
    v7 = __error();
    v8 = strerror(*v7);
    AMSupportLogInternal(3, "_AMRestorePartitionOpenFileWithURL", "open() returned %d, %s", v5, v8);
    return v5;
  }
  if (fcntl(v4, 48, 1))
  {
    AMSupportLogInternal(3, "_AMRestorePartitionOpenFileWithURL", "Unable to set F_NOCACHE on firmware storage", v9);
    return 0xFFFFFFFFLL;
  }
  return v5;
}

void sub_10000531C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_100005344(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_10001620C(&v2, v3);
  }
  return result;
}

uint64_t sub_1000054BC(char *a1, const __CFString *a2)
{
  const __CFData *v4;
  const __CFData *v5;
  CFTypeID v6;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v9;
  const char *v10;

  v4 = (const __CFData *)sub_100005D84(a1, a2);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID()
      || (BytePtr = CFDataGetBytePtr(v5), (Length = CFDataGetLength(v5)) != 0)
      && (Length > 4 || !memcmp(BytePtr, &unk_100019580, Length)))
    {
      v9 = 0;
      v10 = "NO";
    }
    else
    {
      v9 = 1;
      v10 = "YES";
    }
    ramrod_log_msg_cf(CFSTR("Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n"), a1, a2, v10, v5);
    CFRelease(v5);
  }
  else
  {
    ramrod_log_msg_cf(CFSTR("Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n"), a1, a2, "NO", 0);
    return 0;
  }
  return v9;
}

BOOL sub_100005604(const __CFString *a1)
{
  CFTypeRef v2;
  CFTypeRef v3;
  const char *v4;

  v2 = sub_100005D84("IODeviceTree:/defaults", a1);
  v3 = v2;
  if (v2)
  {
    CFRelease(v2);
    v4 = "YES";
  }
  else
  {
    v4 = "NO";
  }
  ramrod_log_msg_cf(CFSTR("Boot Firmware Updater: property_exists(%s, %@) = %s\n"), "IODeviceTree:/defaults", a1, v4);
  return v3 != 0;
}

void sub_100005BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005BE4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t result;

  v7 = objc_opt_class(NSData);
  result = objc_opt_isKindOfClass(a2, v7);
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void sub_100005C40(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void sub_100005C50(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

CFTypeRef sub_100005D84(char *path, const __CFString *a2)
{
  io_registry_entry_t v3;
  io_object_t v4;
  CFTypeRef CFProperty;

  v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3)
    return 0;
  v4 = v3;
  CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

uint64_t MSUBootFirmwareFindNamespace(io_registry_entry_t a1, uint64_t a2)
{
  CFMutableDictionaryRef v4;
  CFTypeRef v5;
  NSDictionary *v6;
  const __CFDictionary *v7;
  uint64_t entryID;
  uint64_t v10;
  NSNumber *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  entryID = 0;
  IORegistryEntryGetRegistryEntryID(a1, &entryID);
  IOServiceWaitQuiet(a1, 0);
  v12[0] = CFSTR("IOParentMatch");
  v4 = IORegistryEntryIDMatching(entryID);
  v5 = (id)CFMakeCollectable(v4);
  v12[1] = CFSTR("IOPropertyMatch");
  v13[0] = v5;
  v10 = a2;
  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
  v13[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  if (v6)
    v7 = (const __CFDictionary *)CFRetain(v6);
  else
    v7 = 0;
  return IOServiceGetMatchingService(kIOMasterPortDefault, v7);
}

uint64_t sub_10000809C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

BOOL sub_1000080B4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void sub_1000081D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008200(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_10001632C(&v2, v3);
  }
  return result;
}

void sub_1000085C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000085E8(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOServiceClose(result);
    if ((_DWORD)result)
      sub_100016430(&v2, v3);
  }
  return result;
}

double sub_100008690(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_1000086A8(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

void iBU_LOG_real(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  const char *v12;

  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a1, &a9);
  v11 = v10;
  if (off_10002E5A0)
  {
    v12 = (const char *)objc_msgSend(v10, "UTF8String");
    off_10002E5A0("%s: %s\n", a2, v12);
  }
  else
  {
    NSLog(CFSTR("%s: %@"), a2, v10);
  }

}

NSError *MSUBootFirmwareError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id *v12;
  NSErrorUserInfoKey *v13;
  uint64_t v14;
  NSErrorUserInfoKey v16;
  id v17;
  NSErrorUserInfoKey v18;
  NSErrorUserInfoKey v19;
  id v20;
  uint64_t v21;

  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a3, &a9);
  if (a2)
  {
    v18 = NSLocalizedDescriptionKey;
    v19 = NSUnderlyingErrorKey;
    v20 = v11;
    v21 = a2;
    v12 = &v20;
    v13 = &v18;
    v14 = 2;
  }
  else
  {
    v16 = NSLocalizedDescriptionKey;
    v17 = v11;
    v12 = &v17;
    v13 = &v16;
    v14 = 1;
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MSUFirmwareUpdaterErrorDomain"), a1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, v14, &a9, v16, v17, v18, v19, v20, v21));
}

BOOL sub_1000089A4(io_registry_entry_t a1)
{
  CFTypeRef CFProperty;
  CFTypeRef v2;

  CFProperty = IORegistryEntryCreateCFProperty(a1, CFSTR("low-level-fw-device-info"), 0, 0);
  v2 = CFProperty;
  if (CFProperty)
    CFRelease(CFProperty);
  return v2 != 0;
}

void sub_10000BE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  sub_10000BE34(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BE34(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_10001653C(&v2, v3);
  }
  return result;
}

void sub_10000BF34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
  _Unwind_Resume(exception_object);
}

void image3Discard(uint64_t *a1)
{
  uint64_t v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      if (*(_QWORD *)v2)
      {
        if ((*(_BYTE *)(v2 + 10) & 4) != 0)
        {
          image3Free(*(void **)v2);
          v2 = *a1;
        }
      }
      image3Free((void *)v2);
      *a1 = 0;
    }
  }
}

uint64_t image3InstantiateNew(_QWORD *a1, size_t a2, unsigned int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = image3Malloc(0x28uLL);
  if (!v6)
    return 12;
  v7 = v6;
  if (a2 <= 0x14)
    a2 = 20;
  v8 = image3Malloc(a2);
  *v7 = v8;
  if (!v8)
  {
    image3Free(v7);
    return 12;
  }
  *v8 = 0;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 0;
  v9 = (_DWORD *)*v7;
  *v9 = 1231906611;
  v9[4] = a3;
  v7[2] = a2;
  v7[3] = 0xFFFFFFFF00000000;
  *((_DWORD *)v7 + 2) = 0x40000;
  v7[4] = 0;
  if (a3 == 1667592820 || (v10 = image3SetTagUnsignedNumber((char **)v7, 1415139397, a3), !(_DWORD)v10))
  {
    v11 = 0;
    *a1 = v7;
  }
  else
  {
    v11 = v10;
    image3Free((void *)*v7);
    image3Free(v7);
  }
  return v11;
}

uint64_t image3SetTagUnsignedNumber(char **a1, int a2, unint64_t a3)
{
  uint64_t *v3;
  size_t v4;
  unint64_t v6;
  int v7;

  v7 = 0;
  v6 = 0;
  if (HIDWORD(a3))
  {
    v6 = a3;
    v3 = (uint64_t *)&v6;
    v4 = 8;
  }
  else
  {
    v7 = a3;
    v3 = (uint64_t *)&v7;
    v4 = 4;
  }
  return image3SetTagStructure(a1, a2, v3, v4, 0);
}

uint64_t image3Finalize(uint64_t a1, char **a2, _QWORD *a3, int a4, uint64_t a5)
{
  uint64_t result;
  char *v10;
  unsigned int v11;
  const void *v12;
  CC_LONG v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];
  int v17;
  unint64_t v18;
  int8x16_t v19;
  int v20;

  v18 = 0;
  v19 = 0uLL;
  v20 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v17 = 0;
  if (!a4)
    goto LABEL_8;
  result = image3AdvanceCursorWithZeroPad((char **)a1, (56 - *(_DWORD *)(a1 + 24)) & 0x3F);
  if (!(_DWORD)result)
  {
    v10 = *(char **)a1;
    v11 = *(_DWORD *)(a1 + 24);
    *((_DWORD *)v10 + 3) = v11 + a5;
    v12 = v10 + 12;
    v13 = v11 + 8;
    if (a5)
    {
      v18 = __PAIR64__(v11, a5);
      image3SHA1Partial(v12, v13, &v19);
    }
    else
    {
      image3SHA1Generate(v12, v13, (unsigned __int8 *)v16);
    }
    result = image3PKISignHash();
    if (!(_DWORD)result)
    {
      *(_DWORD *)(a1 + 8) |= 0x20000u;
LABEL_8:
      result = 0;
      v14 = *(char **)a1;
      *((_DWORD *)v14 + 2) = *(_DWORD *)(a1 + 24);
      v15 = (*(_DWORD *)(a1 + 24) + 20);
      *((_DWORD *)v14 + 1) = v15;
      *a2 = v14;
      *a3 = v15;
    }
  }
  return result;
}

uint64_t image3AdvanceCursorWithZeroPad(char **a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t result;

  if ((*((_BYTE *)a1 + 10) & 2) != 0)
    return 30;
  v4 = *((int *)a1 + 6);
  v3 = *((int *)a1 + 7);
  LODWORD(v5) = v4 + a2;
  *((_DWORD *)a1 + 6) = v4 + a2;
  v6 = *a1;
  if ((_DWORD)v3 != -1)
  {
    *(_DWORD *)&v6[v3 + 24] = v5 - v3;
    LODWORD(v5) = *((_DWORD *)a1 + 6);
  }
  v5 = (int)v5;
  v7 = (int)v5 + 20;
  if (v7 <= (unint64_t)a1[2])
    goto LABEL_7;
  v6 = (char *)realloc(v6, (int)v5 + 20);
  if (v6)
  {
    *a1 = v6;
    a1[2] = (char *)v7;
    v5 = *((int *)a1 + 6);
LABEL_7:
    bzero(&v6[v4 + 20], v5 - v4);
    result = 0;
    *((_DWORD *)*a1 + 2) = *((_DWORD *)a1 + 6);
    return result;
  }
  return 12;
}

uint64_t image3SetTagStructure(char **a1, int a2, void *__src, size_t __n, int a5)
{
  uint64_t v9;
  int v10;
  char *v11;
  uint64_t result;
  size_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  int v17;
  int v18;
  int v19;

  if ((*((_BYTE *)a1 + 10) & 2) != 0)
    return 30;
  if (a5)
  {
    v9 = *((int *)a1 + 7);
    v10 = (a5 + *((_DWORD *)a1 + 6) / a5 * a5 - *((_DWORD *)a1 + 6)) % a5 + *((_DWORD *)a1 + 6);
    *((_DWORD *)a1 + 6) = v10;
    v11 = *a1;
    if ((_DWORD)v9 != -1)
      *(_DWORD *)&v11[v9 + 24] = v10 - v9;
  }
  else
  {
    v11 = *a1;
  }
  if ((__n & 0xF) != 0)
    v13 = 16 - (__n & 0xF);
  else
    v13 = 0;
  v14 = *((int *)a1 + 6);
  v15 = __n + v13 + v14 + 32;
  if (v15 > (unint64_t)a1[2])
  {
    v11 = (char *)realloc(v11, __n + v13 + v14 + 32);
    if (!v11)
      return 12;
    *a1 = v11;
    a1[2] = (char *)v15;
    v14 = *((int *)a1 + 6);
  }
  v16 = &v11[v14];
  if ((((_DWORD)v13 + (_DWORD)__n) & 3) != 0)
    v17 = ((v13 + __n) & 0xFFFFFFFC) + 16;
  else
    v17 = v13 + __n + 12;
  *((_DWORD *)v16 + 5) = a2;
  *((_DWORD *)v16 + 6) = v17;
  *((_DWORD *)v16 + 7) = __n;
  memcpy(v16 + 32, __src, __n);
  bzero(&v16[__n + 32], v13);
  result = 0;
  v18 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 7) = v18;
  v19 = *((_DWORD *)v16 + 6) + v18;
  *((_DWORD *)a1 + 6) = v19;
  *((_DWORD *)*a1 + 2) = v19;
  return result;
}

uint64_t image3InstantiateFromBuffer(_QWORD *a1, _DWORD *a2, unint64_t a3, char a4)
{
  uint64_t result;
  unint64_t v6;
  _QWORD *v10;
  _QWORD *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  size_t v16;
  void *v17;

  if (a3 < 0x14)
    return 22;
  if (*a2 != 1231906611)
    return 22;
  v6 = a2[2];
  if (a3 - 20 < v6 || a2[3] > v6 || v6 + 20 > a2[1])
    return 22;
  v10 = image3Malloc(0x28uLL);
  if (!v10)
    return 12;
  v11 = v10;
  *((_DWORD *)v10 + 2) = 1;
  v10[4] = 0;
  if (a2[3])
  {
    *((_DWORD *)v10 + 2) = 131073;
    if ((a4 & 1) == 0)
    {
      *v10 = a2;
      v10[2] = a3;
LABEL_21:
      result = 0;
      *a1 = v11;
      return result;
    }
    goto LABEL_19;
  }
  *((_DWORD *)v10 + 6) = a2[2];
  *((_DWORD *)v10 + 7) = -1;
  v12 = a2[2];
  if (!v12)
  {
LABEL_19:
    v16 = a2[2] + 20;
    v11[2] = v16;
    v17 = image3Malloc(v16);
    *v11 = v17;
    if (v17)
    {
      memcpy(v17, a2, v11[2]);
      *((_DWORD *)v11 + 2) |= 0x40000u;
      goto LABEL_21;
    }
    image3Free(v11);
    return 12;
  }
  v13 = 0;
  while (1)
  {
    v14 = v13;
    v15 = *(_DWORD *)((char *)a2 + v13 + 24);
    v13 += v15;
    if (v13 > v12 || v15 <= 0xB)
      break;
    if (v13 == v12)
    {
      *((_DWORD *)v10 + 7) = v14;
      goto LABEL_19;
    }
  }
  image3Free(v10);
  return 22;
}

uint64_t image3GetTagStruct(uint64_t a1, int a2, _QWORD *a3, _QWORD *a4, int a5)
{
  uint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;

  v5 = *(unsigned int *)(*(_QWORD *)a1 + 8);
  if (!(_DWORD)v5)
    return 2;
  v6 = (_DWORD *)(*(_QWORD *)a1 + 20);
  v7 = (unint64_t)v6 + v5;
  while (1)
  {
    v8 = v6 + 3;
    if ((unint64_t)(v6 + 3) > v7)
      return 22;
    v9 = v6[2];
    if ((unint64_t)v8 + v9 > v7)
      return 22;
    if (a2 == -1 || *v6 == a2)
      break;
LABEL_9:
    v10 = v6[1];
    if (v9 + 12 > v10)
      return 22;
    v6 = (_DWORD *)((char *)v6 + v10);
    if ((unint64_t)v6 >= v7)
      return 2;
  }
  if (a5)
  {
    --a5;
    goto LABEL_9;
  }
  if (a4)
  {
    if (*a4 && *a4 != v9)
      return 22;
    *a4 = v9;
  }
  result = 0;
  *a3 = v8;
  return result;
}

uint64_t image3GetTagUnsignedNumber(uint64_t a1, int a2, _QWORD *a3, int a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;

  v7 = 0;
  v8 = 0;
  result = image3GetTagStruct(a1, a2, &v8, &v7, a4);
  if (!(_DWORD)result)
  {
    if (v7 == 8)
    {
      v6 = *(_QWORD *)v8;
      goto LABEL_6;
    }
    if (v7 == 4)
    {
      v6 = *v8;
LABEL_6:
      result = 0;
      *a3 = v6;
      return result;
    }
    return 22;
  }
  return result;
}

void sub_10000CCDC(uint64_t a1)
{
  uint64_t step_desc;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  int should_retry;
  char v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unsigned int v44;

  step_desc = checkpoint_closure_context_get_step_desc((uint64_t)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"));
  ramrod_log_msg("[AsyncCP][Start] Checkpoint %s start running.\n", v3, v4, v5, v6, v7, v8, v9, *(_QWORD *)(step_desc + 8));
  v10 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  dispatch_queue_set_specific(v10, kCheckpointAsyncStepContextKey, objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"), 0);
  v11 = 0;
  v12 = 1;
  do
  {
    while (1)
    {
      v44 = 0;
      v43 = 0;
      if ((v11 & 1) != 0)
      {
        v13 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
        if (checkpoint_closure_context_handle_simulator_actions(v13, 1, (int *)&v44, (const void **)&v43, v14, v15, v16, v17))goto LABEL_4;
      }
      else if ((v12 & 1) != 0)
      {
LABEL_4:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v44 = objc_msgSend(*(id *)(a1 + 32), "result");
        v43 = objc_msgSend(*(id *)(a1 + 32), "error");
        v12 = 1;
        goto LABEL_7;
      }
      v12 = 0;
LABEL_7:
      v18 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
      if (checkpoint_closure_context_handle_simulator_actions(v18, 0, (int *)&v44, (const void **)&v43, v19, v20, v21, v22))
      {
        v23 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
        v31 = checkpoint_closure_context_handle_simulator_match_name(v23, v24, v25, v26, v27, v28, v29, v30) != 0;
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "setResult:", v44);
      objc_msgSend(*(id *)(a1 + 32), "setError:", v43);
      if (!v44 || v31)
        break;
      should_retry = checkpoint_closure_context_should_retry((uint64_t)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"));
      v11 = 1;
      if (!should_retry)
        goto LABEL_18;
    }
    if (v44)
      v33 = 1;
    else
      v33 = v31;
    v11 = 1;
  }
  while ((v33 & 1) != 0);
LABEL_18:
  v34 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  dispatch_queue_set_specific(v34, kCheckpointAsyncStepContextKey, 0, 0);
  v35 = *(_QWORD *)(step_desc + 8);
  objc_msgSend(*(id *)(a1 + 32), "result");
  ramrod_log_msg("[AsyncCP][End] Checkpoint %s finished with result: %d.\n", v36, v37, v38, v39, v40, v41, v42, v35);
}

void sub_10000CE84(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 7);
}

void sub_10000CEC0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 7);
  _Block_object_dispose(*(const void **)(a1 + 32), 3);
}

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4;
  uint64_t MatchingService;
  unsigned int v6;
  const __CFString *v7;
  char CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = 0;
  do
  {
    CFRetain(cf);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if ((_DWORD)MatchingService)
      break;
    v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    v7 = CFCopyDescription(cf);
    CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }
  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFStringRef v21;
  char v23;

  v4 = IOServiceMatching("IOResources");
  if (v4)
  {
    v12 = v4;
    v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v13)
    {
      v21 = v13;
      CFDictionarySetValue(v12, CFSTR("IOResourceMatch"), v13);
      CFRelease(v21);
      return wait_for_io_service_matching_dict(v12, a2);
    }
    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
  }
  else
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
  }
  return 0;
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0;
  io_object_t v1;

  v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  v1 = v0;
  if (v0)
    IOObjectRelease(v0);
  return v1 != 0;
}

uint64_t ramrod_delete_NVRAM_variable()
{
  return 1;
}

uint64_t ramrod_copy_NVRAM_variable()
{
  return 0;
}

CFTypeRef ramrod_copy_NVRAM_variable_from_devicetree(CFStringRef theString)
{
  const __CFString *Copy;
  io_registry_entry_t v2;
  CFTypeRef CFProperty;
  io_registry_entry_t v5;

  Copy = CFStringCreateCopy(0, theString);
  v2 = atomic_load((unsigned int *)&unk_10002E5A8);
  if (!v2)
  {
    v5 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (v5)
    {
      while (1)
      {
        v2 = __ldaxr((unsigned int *)&unk_10002E5A8);
        if (v2)
          break;
        if (!__stlxr(v5, (unsigned int *)&unk_10002E5A8))
        {
          v2 = v5;
          goto LABEL_2;
        }
      }
      __clrex();
      IOObjectRelease(v5);
    }
    else
    {
      v2 = 0;
    }
  }
LABEL_2:
  CFProperty = IORegistryEntryCreateCFProperty(v2, Copy, 0, 0);
  CFRelease(Copy);
  return CFProperty;
}

uint64_t image3SHA1Generate(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  CC_SHA1_CTX v7;

  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a1, a2);
  return CC_SHA1_Final(a3, &v7);
}

uint64_t image3PKISignHash()
{
  return 0xFFFFFFFFLL;
}

int8x16_t image3SHA1Partial(const void *a1, CC_LONG a2, int8x16_t *a3)
{
  int8x16_t result;
  CC_SHA1_CTX v7;

  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a1, a2);
  result = vrev32q_s8(*(int8x16_t *)&v7.h0);
  *a3 = result;
  a3[1].i32[0] = bswap32(v7.h4);
  return result;
}

uint64_t ramrod_ticket_create_img3(CFDataRef *a1, CFErrorRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  char **v16;
  UInt8 *BytePtr;
  size_t Length;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFDataRef v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char **v28;
  CFIndex v29;
  const UInt8 *v30;

  v28 = 0;
  if (!qword_10002E5B0 || byte_10002E5B8 != 1)
    return 1;
  v29 = 0;
  v30 = 0;
  if (image3InstantiateNew(&v28, 0, 0x53434142u))
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: unable to create img3 ticket"), v4, v5, v6, (char)"ramrod_ticket_create_img3");
    v14 = "failed to create img3\n";
LABEL_10:
    ramrod_log_msg(v14, v7, v8, v9, v10, v11, v12, v13, v27);
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v16 = v28;
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)qword_10002E5B0);
  Length = CFDataGetLength((CFDataRef)qword_10002E5B0);
  if (image3SetTagStructure(v16, 1145132097, BytePtr, Length, 32))
  {
    v14 = "failed to create data tag for ticket";
    goto LABEL_10;
  }
  if (image3Finalize((uint64_t)v28, (char **)&v30, &v29, 0, 0))
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: unable to create CFData for img3 ticket"), v19, v20, v21, (char)"ramrod_ticket_create_img3");
    v14 = "could not finalize ticket img3";
    goto LABEL_10;
  }
  v23 = CFDataCreate(kCFAllocatorDefault, v30, v29);
  if (!v23)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: unable to create CFData for img3 ticket"), v24, v25, v26, (char)"ramrod_ticket_create_img3");
    goto LABEL_11;
  }
  *a1 = v23;
  v15 = 1;
LABEL_12:
  if (v28)
    image3Discard((uint64_t *)&v28);
  return v15;
}

uint64_t get_BOOLean_option(const __CFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v3;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  CFTypeID v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 valuePtr;
  char buffer[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v6 = Value;
      v7 = CFGetTypeID(Value);
      if (v7 == CFBooleanGetTypeID())
        return CFBooleanGetValue(v6);
      v9 = CFGetTypeID(v6);
      if (v9 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        *(_OWORD *)buffer = 0u;
        v19 = 0u;
        CFStringGetCString(a2, buffer, 255, 0x8000100u);
        ramrod_log_msg("%s: option '%s' has non-BOOLean value, using default\n", v10, v11, v12, v13, v14, v15, v16, (char)"get_BOOLean_option");
      }
    }
  }
  return v3;
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result;
  uint64_t v7;
  ssize_t v8;

  result = 0;
  if (a1 && a2)
  {
    v7 = 0;
    while (1)
    {
      v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1)
        break;
      v7 += v8;
      if (v7 == a2)
        return 0;
    }
    return *__error();
  }
  return result;
}

uint64_t sub_10000D84C(int a1)
{
  int v1;
  BOOL v2;
  uint64_t *v3;
  __CFSet *v4;
  CFNumberRef v5;
  CFNumberRef v6;
  int *v7;
  uint64_t v8;
  FILE *v9;
  int v10;
  char *v11;
  FILE *v12;
  const char *v13;
  size_t v14;
  stat v16;
  int valuePtr;

  valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  v1 = fstat(a1, &v16);
  v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  v3 = &qword_10002E5E0;
  if (v2)
    v3 = &qword_10002E5D8;
  v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    v12 = __stderrp;
    v13 = "can't remove logging fd since none were added";
    v14 = 45;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }
  v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    v12 = __stderrp;
    v13 = "failed to convert fd to number";
    v14 = 30;
    goto LABEL_13;
  }
  v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    v7 = __error();
    v8 = *v7;
    v9 = __stderrp;
    v10 = valuePtr;
    v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  int valuePtr;
  __int128 context;
  CFArrayRef theArray[2];

  context = 0u;
  *(_OWORD *)theArray = 0u;
  valuePtr = -1;
  pthread_mutex_lock(&stru_10002E010);
  if (a1 && xmmword_10002E5D8 != 0)
  {
    *(_QWORD *)&context = a1;
    *((_QWORD *)&context + 1) = a2;
    theArray[0] = 0;
    LOBYTE(theArray[1]) = 0;
    if (*((_QWORD *)&xmmword_10002E5D8 + 1))
      CFSetApplyFunction(*((CFSetRef *)&xmmword_10002E5D8 + 1), (CFSetApplierFunction)sub_10000DAD0, &context);
    qword_10002E5E8 += a2;
    if (qword_10002E5E8)
    {
      LOBYTE(theArray[1]) = 1;
      qword_10002E5E8 = 0;
    }
    if ((_QWORD)xmmword_10002E5D8)
      CFSetApplyFunction((CFSetRef)xmmword_10002E5D8, (CFSetApplierFunction)sub_10000DAD0, &context);
    if (theArray[0])
    {
      Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        v5 = Count;
        for (i = 0; i != v5; ++i)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr))
            sub_10000D84C(valuePtr);
          else
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
        }
      }
      CFRelease(theArray[0]);
    }
  }
  pthread_mutex_unlock(&stru_10002E010);
  return 0;
}

void sub_10000DAD0(const void *a1, uint64_t a2)
{
  __CFArray *Mutable;
  FILE *v5;
  const char *v6;
  size_t v7;
  int valuePtr;

  valuePtr = -1;
  if (!a1)
  {
    v5 = __stderrp;
    v6 = "NULL fd num in fd set, weird.\n";
    v7 = 30;
LABEL_11:
    fwrite(v6, v7, 1uLL, v5);
    return;
  }
  if (!a2)
  {
    v5 = __stderrp;
    v6 = "Missing logging context.\n";
    v7 = 25;
    goto LABEL_11;
  }
  if (*(_QWORD *)a2)
  {
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
    {
      if (ramrod_log_msg_to_fd(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), valuePtr))
      {
        fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
        Mutable = *(__CFArray **)(a2 + 16);
        if (!Mutable)
        {
          Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
          *(_QWORD *)(a2 + 16) = Mutable;
        }
        CFArrayAppendValue(Mutable, a1);
      }
      else if (*(_BYTE *)(a2 + 24))
      {
        fsync(valuePtr);
      }
    }
    else
    {
      fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
    }
  }
}

void ramrod_log_msg(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_10000DD34(1, a1, &a9);
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  const __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const char *CStringPtr;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  CFIndex Length;
  CFIndex v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  va_list va;

  va_start(va, format);
  v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }
  v9 = v1;
  CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    v30 = (char)CStringPtr;
    v18 = "%s";
  }
  else
  {
    Length = CFStringGetLength(v9);
    v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v21 = (char *)malloc(v20);
    if (v21)
    {
      v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u))
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      else
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      free(v22);
      goto LABEL_12;
    }
    v18 = "(Failed to alloc and convert log message)\n";
  }
  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void sub_10000DD34(int a1, const char *a2, va_list a3)
{
  size_t v4;
  char *v5;
  char v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  char *__s;

  __s = 0;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&stru_10002DFD0);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (off_10002E5F0)
        off_10002E5F0(__s);
    }
    v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!byte_10002E050)
      goto LABEL_23;
    v5 = (char *)qword_10002E5D0;
    if (!qword_10002E5D0)
    {
      v5 = (char *)malloc(0x100000uLL);
      qword_10002E5D0 = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000);
LABEL_23:
        pthread_mutex_unlock(&stru_10002DFD0);
        goto LABEL_24;
      }
      qword_10002E5C0 = (uint64_t)v5;
      qword_10002E5C8 = (uint64_t)v5;
    }
    v6 = *__s;
    if (*__s)
    {
      v7 = v5 + 0x100000;
      v8 = (char *)qword_10002E5C8;
      v9 = qword_10002E5C0;
      v10 = __s + 1;
      do
      {
        *v8 = v6;
        if (v8 + 1 == v7)
          v8 = v5;
        else
          ++v8;
        qword_10002E5C8 = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7)
            v9 = (uint64_t)v5;
          else
            v9 = (uint64_t)(v8 + 1);
          qword_10002E5C0 = v9;
        }
        v11 = *v10++;
        v6 = v11;
      }
      while (v11);
    }
    goto LABEL_23;
  }
  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

CFStringRef sub_10000DEAC()
{
  return CFStringCreateWithFormat(0, 0, CFSTR("UNKNOWN"));
}

CFStringRef sub_10000DEC0(uint64_t a1, const char **a2)
{
  const char *v2;
  size_t v3;

  if (!a2)
    return 0;
  v2 = *a2;
  if (!*a2)
    return 0;
  v3 = strlen(*a2);
  if (v3 > 0x100)
    return CFStringCreateWithFormat(0, 0, CFSTR("~%s"), &v2[v3 - 255]);
  else
    return CFStringCreateWithFormat(0, 0, CFSTR("%s"), v2);
}

CFStringRef sub_10000DF34(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  size_t v4;

  if (!a2)
    return 0;
  v3 = *((_QWORD *)a2 + 1);
  if (!v3)
    return 0;
  v4 = strlen(*((const char **)a2 + 1));
  if (v4 > 0xF2)
    return CFStringCreateWithFormat(0, 0, CFSTR("{0x%08X:\"~%s\"}"), *a2, v4 + v3 - 241);
  else
    return CFStringCreateWithFormat(0, 0, CFSTR("{0x%08X:\"%s\"}"), *a2, v3);
}

CFStringRef sub_10000DFB4(uint64_t a1, _QWORD *a2)
{
  if (a2)
    return CFStringCreateWithFormat(0, 0, CFSTR("%ld"), *a2);
  else
    return 0;
}

CFStringRef sub_10000DFF4(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  const char *v12;
  char v14;
  int v15;
  char *v16;

  v2 = a2;
  if (a2)
  {
    v16 = 0;
    asprintf(&v16, "{");
    v8 = v16;
    if (v16)
    {
      v9 = 0;
      v15 = 0;
      v10 = 1;
      do
      {
        v11 = v10;
        v12 = (const char *)*((_QWORD *)&v2->isa + v9);
        if (v12)
        {
          v8 = sub_1000108B4(v8, off_100024A30[v9], v12, &v15);
          v16 = v8;
        }
        v10 = 0;
        v9 = 1;
      }
      while ((v11 & 1) != 0);
      v16 = sub_1000109A0(v8, "}", (uint64_t)v12, v3, v4, v5, v6, v7, v14);
      v2 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v16);
      if (v16)
        free(v16);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000E0C0(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  const char *v10;
  char v12;
  int v13;
  char *v14;

  v2 = a2;
  if (a2)
  {
    v14 = 0;
    asprintf(&v14, "{");
    v8 = v14;
    if (v14)
    {
      v9 = 0;
      v13 = 0;
      do
      {
        v10 = *(const char **)((char *)&v2->info + v9);
        if (v10)
        {
          v8 = sub_100010A3C(v8, *(_DWORD *)((char *)&v2->isa + v9), v10, &v13);
          v14 = v8;
        }
        v9 += 16;
      }
      while (v9 != 128);
      v14 = sub_1000109A0(v8, "}", (uint64_t)v10, v3, v4, v5, v6, v7, v12);
      v2 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v14);
      if (v14)
        free(v14);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000E178(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  char *v12;
  int v13;
  char *v14;

  v2 = a2;
  if (a2)
  {
    v14 = 0;
    asprintf(&v14, "{");
    if (v14)
    {
      v9 = 0;
      v13 = 0;
      do
      {
        if (*(_DWORD *)((char *)&v2->isa + v9))
        {
          v12 = 0;
          asprintf(&v12, "%d", *(_DWORD *)((char *)&v2->isa + v9 + 4));
          v3 = v12;
          if (v12)
          {
            v14 = sub_100010A3C(v14, *(_DWORD *)((char *)&v2->isa + v9), v12, &v13);
            if (v12)
              free(v12);
          }
        }
        v9 += 8;
      }
      while (v9 != 64);
      v14 = sub_1000109A0(v14, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v11);
      v2 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v14);
      if (v14)
        free(v14);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000E274(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *p_info;
  int *v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  char *v15;
  char v17;
  int v18;
  char *v19;
  char *v20;
  int v21;
  char *v22;

  v2 = a2;
  if (a2)
  {
    v19 = 0;
    asprintf(&v19, "{");
    if (v19)
    {
      v9 = 0;
      v18 = 0;
      p_info = &v2->info;
      do
      {
        v11 = (int *)v2 + 18 * v9;
        if (*v11)
        {
          v22 = 0;
          asprintf(&v22, "{");
          if (v22)
          {
            v12 = 0;
            v21 = 0;
            do
            {
              v13 = (const char *)p_info[v12];
              if (v13)
              {
                v20 = 0;
                asprintf(&v20, "\"%s\"", v13);
                v3 = v20;
                if (v20)
                {
                  v22 = sub_100010AB0(v22, v12, v20, &v21);
                  if (v20)
                    free(v20);
                }
              }
              ++v12;
            }
            while (v12 != 8);
            v14 = sub_1000109A0(v22, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
            if (v14)
            {
              v15 = v14;
              v19 = sub_100010A3C(v19, *v11, v14, &v18);
              free(v15);
            }
          }
        }
        ++v9;
        p_info += 9;
      }
      while (v9 != 8);
      v19 = sub_1000109A0(v19, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
      v2 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v19);
      if (v19)
        free(v19);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000E408(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFStringRef v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char v16;
  int v17;
  char *v18;
  char *v19;
  int v20;
  char *v21;

  v2 = a2;
  if (a2)
  {
    v18 = 0;
    asprintf(&v18, "{");
    if (v18)
    {
      v9 = 0;
      v17 = 0;
      v10 = v2;
      do
      {
        v11 = (int *)v2 + 11 * v9;
        if (*v11)
        {
          v21 = 0;
          asprintf(&v21, "{");
          if (v21)
          {
            v12 = 0;
            v20 = 0;
            do
            {
              if (*((_BYTE *)&v10[1].isa + v12 + 4))
              {
                v19 = 0;
                asprintf(&v19, "%d", *((_DWORD *)&v10->isa + v12 + 1));
                v3 = v19;
                if (v19)
                {
                  v21 = sub_100010AB0(v21, v12, v19, &v20);
                  if (v19)
                    free(v19);
                }
              }
              ++v12;
            }
            while (v12 != 8);
            v13 = sub_1000109A0(v21, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
            if (v13)
            {
              v14 = v13;
              v18 = sub_100010A3C(v18, *v11, v13, &v17);
              free(v14);
            }
          }
        }
        ++v9;
        v10 = (CFStringRef)((char *)v10 + 44);
      }
      while (v9 != 8);
      v18 = sub_1000109A0(v18, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
      v2 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v18);
      if (v18)
        free(v18);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_10000E5A8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString **v13;
  uint64_t v14;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const __CFString *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int *v39;
  int v40;
  int v41;
  unsigned int *v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  const __CFString *v53;
  int v54;
  const __CFString *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  const __CFString *v65;
  const __CFString *v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  int *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  const __CFString **v80;
  unsigned int v81;
  char v82;
  char v83[1024];

  v8 = a3;
  v10 = *(_DWORD *)(a1 + 664);
  if (!v10)
    goto LABEL_160;
  if (v10 == 1)
  {
    v11 = 1;
    goto LABEL_20;
  }
  v11 = 0;
  if (a2)
  {
    if (v10 == 2)
    {
LABEL_160:
      if (ramrod_check_NVRAM_access())
      {
        if (*(_BYTE *)(a1 + 2272))
        {
          if (!*(_BYTE *)(a1 + 2273))
          {
LABEL_24:
            v17 = *(_DWORD *)(a1 + 664);
            if (*(_BYTE *)(a1 + 669))
            {
LABEL_149:
              v11 = 1;
              *(_DWORD *)(a1 + 664) = 1;
              if (!v8)
              {
                if (v17)
                  sub_10000EE9C(a1, 2, 1, 0, 256, "NVRAM access has become available", 0, 0, 0);
                else
                  sub_10000EE9C(a1, 2, 1, 0, 256, "NVRAM access available on initial check", 0, 0, 0);
              }
              goto LABEL_20;
            }
            v18 = *(_DWORD *)a1 == 1 && v17 == 2;
            v19 = 8;
            if (v18)
              v19 = 400;
            v20 = a1 + v19;
            v21 = (_QWORD *)(v20 + 664);
            if (*(_BYTE *)(v20 + 668))
              ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n", v12, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_handle_first_available");
            else
              sub_10000F964((int *)a1, (uint64_t)v21, a3, a4, a5, a6, a7, a8);
            if (*(_DWORD *)a1 == 1)
            {
              v29 = *(_DWORD *)(a1 + 88);
              if (*(_DWORD *)(a1 + 96))
              {
                if (v29 == 2)
                  v39 = (unsigned int *)&unk_100019864;
                else
                  v39 = (unsigned int *)&unk_1000199AC;
              }
              else
              {
                if (v29 == 2)
                {
                  v31 = sub_100010EBC(a1, (uint64_t)v21, dword_1000195D4, v24, v25, v26, v27, v28);
                  sub_1000110F0(a1, (uint64_t)v21);
                  goto LABEL_53;
                }
                v39 = (unsigned int *)&unk_100019754;
              }
              v31 = sub_100010EBC(a1, (uint64_t)v21, v39, v24, v25, v26, v27, v28);
LABEL_53:
              v43 = v21[6];
              if (!v43)
              {
LABEL_110:
                if (!(_DWORD)v43 && v31 && !*(_BYTE *)(a1 + 106) && !*(_BYTE *)(a1 + 100) && !*(_BYTE *)(a1 + 104))
                  sub_10000FB20(a1, v32, "[monitor_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
LABEL_116:
                if (*(_BYTE *)(a1 + 104))
                {
                  if (v17 == 2)
                  {
                    v73 = 0;
                    v74 = (_QWORD *)(a1 + 1496);
                    v75 = &dword_100024A50;
LABEL_119:
                    v76 = *v75;
                    if (v73 != v76)
                    {
                      v77 = a1 + 16 * (int)v76;
                      *(_BYTE *)(v77 + 1492) = *((_BYTE *)v74 - 4);
                      *((_BYTE *)v74 - 4) = 0;
                      v78 = *v74;
                      *v74 = *(_QWORD *)(v77 + 1496);
                      *(_QWORD *)(v77 + 1496) = v78;
                    }
                    while (v73 != 47)
                    {
                      v74 += 2;
                      v75 += 8;
                      ++v73;
                      if (*(_BYTE *)(a1 + 104))
                        goto LABEL_119;
                    }
                  }
                }
                else if (*(_DWORD *)a1 != 1 && *(_DWORD *)(a1 + 88) == 2)
                {
                  ramrod_log_msg("%s\n", v32, v33, v34, v35, v36, v37, v38, (char)"void clear_stale_ota_nvram(void)");
                  sub_1000112A0(CFSTR("boot-breadcrumbs"));
                  sub_1000112A0(CFSTR("OTA-pre-conversion"));
                  sub_1000112A0(CFSTR("OTA-post-conversion"));
                  sub_1000112A0(CFSTR("ota-conv-panic-indicator"));
                  sub_1000112A0(CFSTR("OTA-fsck-metrics"));
                  sub_1000112A0(CFSTR("OTA-sealvolume-metrics"));
                  sub_1000112A0(CFSTR("OTA-migrator-metrics"));
                  for (i = 0; i != 28; ++i)
                  {
                    v80 = (const __CFString **)&off_100024A40[4 * dword_100019EE4[i]];
                    sub_1000112A0(v80[1]);
                    sub_1000112A0(*v80);
                  }
                }
                if (*(_DWORD *)(a1 + 96))
                {
                  if (*(_BYTE *)(a1 + 101))
                  {
                    if (*(_BYTE *)(a1 + 104))
                    {
                      if (*(_BYTE *)(a1 + 106))
                      {
                        v81 = 9;
                      }
                      else if (*(_BYTE *)(a1 + 105))
                      {
                        v81 = 12;
                      }
                      else if (*(_BYTE *)(a1 + 100))
                      {
                        v81 = 10;
                      }
                      else
                      {
                        v81 = 11;
                      }
                    }
                    else if (*(_BYTE *)(a1 + 103))
                    {
                      v81 = 10;
                    }
                    else
                    {
                      v81 = 3;
                    }
                  }
                  else if (*(_BYTE *)(a1 + 102))
                  {
                    if (*(_BYTE *)(a1 + 104))
                      v81 = 7;
                    else
                      v81 = 6;
                  }
                  else
                  {
                    v81 = 2;
                  }
                  sub_10000FBBC(a1, v81, v33, v34, v35, v36, v37, v38);
                }
                else
                {
                  sub_100010B24(a1, 1, v33, v34, v35, v36, v37, v38);
                }
                *(_BYTE *)(a1 + 669) = 1;
                goto LABEL_149;
              }
              v44 = sub_10000FAA8(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
              if (v44 < 0x22)
              {
                v52 = &dword_100019F54[3 * v44];
              }
              else
              {
                ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n", v45, v46, v47, v48, v49, v50, v51, (char)"checkpoint_get_outcome_attributes");
                v52 = dword_100019F54;
              }
              v53 = (const __CFString *)v21[6];
              bzero(v83, 0x400uLL);
              if (*v52 == 2)
              {
                v54 = *((unsigned __int8 *)v52 + 8);
                if (*((_BYTE *)v52 + 8))
                  *(_BYTE *)(a1 + 106) = 1;
                if (*((_BYTE *)v52 + 7))
                {
                  v31 = 0;
                  *(_BYTE *)(a1 + 102) = 1;
                }
                if (!*((_BYTE *)v52 + 5))
                {
                  if (!*((_BYTE *)v52 + 4) || !*((_BYTE *)v52 + 6))
                  {
                    LODWORD(v43) = 0;
                    goto LABEL_110;
                  }
                  if (v54)
                  {
                    LODWORD(v43) = 0;
                    *(_BYTE *)(a1 + 101) = 1;
                    goto LABEL_110;
                  }
                  v43 = v21[8];
                  if (!v43)
                    goto LABEL_110;
LABEL_98:
                  v69 = (const __CFString *)v21[7];
                  *(_BYTE *)(a1 + 101) = 1;
                  if (v69 && CFStringCompare(v69, CFSTR("true"), 0) == kCFCompareEqualTo)
                  {
                    *(_BYTE *)(a1 + 100) = 1;
                    LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                    if (!*((_BYTE *)v52 + 5))
                    {
                      *(_BYTE *)(a1 + 103) = 1;
                      goto LABEL_110;
                    }
                    LODWORD(v43) = 0;
                    goto LABEL_65;
                  }
                  goto LABEL_100;
                }
                if (v54)
                {
                  LODWORD(v43) = 0;
                  *(_BYTE *)(a1 + 101) = 1;
LABEL_65:
                  *(_WORD *)(a1 + 104) = 257;
                  goto LABEL_110;
                }
                v43 = v21[8];
                if (v43)
                  goto LABEL_98;
              }
              else
              {
                LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                if (!*((_BYTE *)v52 + 5))
                  goto LABEL_110;
                if (!v21[8])
                {
                  sub_10000FD44(v53, v83);
                  sub_10000FB20(a1, v71, "[monitor_aware]outcome=%s(reboot_retry_not_in_zone)");
                  goto LABEL_102;
                }
                v55 = (const __CFString *)v21[7];
                if (!v55 || CFStringCompare(v55, CFSTR("true"), 0))
                {
LABEL_100:
                  sub_10000FD44(v53, v83);
                  sub_10000FB20(a1, v70, "[monitor_aware]outcome=%s(reboot_retry_disabled)");
LABEL_102:
                  LODWORD(v43) = 1;
                  goto LABEL_110;
                }
                LODWORD(v43) = 0;
              }
              *(_BYTE *)(a1 + 104) = 1;
              goto LABEL_110;
            }
            v30 = (const __CFString *)v21[7];
            if (v30 && CFStringCompare(v30, CFSTR("true"), 0) == kCFCompareEqualTo)
              *(_BYTE *)(a1 + 100) = 1;
            else
              ramrod_log_msg("AP nonce will not be touched\n", v22, v23, v24, v25, v26, v27, v28, v82);
            v40 = *(_DWORD *)(a1 + 88);
            if (*(_DWORD *)(a1 + 96))
            {
              if (v40 == 2)
              {
                v41 = sub_100010EBC(a1, (uint64_t)v21, dword_100019C4C, v24, v25, v26, v27, v28);
                sub_1000110F0(a1, (uint64_t)v21);
                goto LABEL_72;
              }
              v42 = (unsigned int *)&unk_100019DD4;
            }
            else if (v40 == 2)
            {
              v42 = (unsigned int *)&unk_100019A8C;
            }
            else
            {
              v42 = (unsigned int *)&unk_100019BA4;
            }
            v41 = sub_100010EBC(a1, (uint64_t)v21, v42, v24, v25, v26, v27, v28);
LABEL_72:
            if (!v21[6])
            {
              *(_BYTE *)(a1 + 1456) = 1;
              *(_QWORD *)(a1 + 1464) = "access now enabled";
              if (*(_DWORD *)(a1 + 88) == 2)
              {
                if (v21[8])
                  sub_10000FC44(a1, 7, 0, 0, v35, v36, v37, v38);
                v65 = (const __CFString *)v21[3];
                if (v65 && CFStringCompare(v65, CFSTR("recover"), 0))
                  sub_10000FC44(a1, 2, 1, 0, v35, v36, v37, v38);
                if (v21[4])
                  sub_10000FC44(a1, 3, 1, 0, v35, v36, v37, v38);
              }
              goto LABEL_105;
            }
            v56 = sub_10000FAA8(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
            if (v56 < 0x22)
            {
              v64 = &dword_100019F54[3 * v56];
            }
            else
            {
              ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n", v57, v58, v59, v60, v61, v62, v63, (char)"checkpoint_get_outcome_attributes");
              v64 = dword_100019F54;
            }
            v66 = (const __CFString *)v21[6];
            bzero(v83, 0x400uLL);
            if (*v64 != 1)
            {
              if (*((_BYTE *)v64 + 6))
              {
                if (v21[8])
                {
                  sub_1000111CC((_BYTE *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
                }
                else
                {
                  sub_10000FD44(v66, v83);
                  sub_10000FB20(a1, v72, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
                }
              }
              *(_BYTE *)(a1 + 1456) = 1;
              *(_QWORD *)(a1 + 1464) = "access now enabled";
              goto LABEL_105;
            }
            v67 = v21[8];
            if (*((_BYTE *)v64 + 5))
            {
              if (!v67)
              {
                sub_10000FD44(v66, v83);
                sub_10000FB20(a1, v68, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
LABEL_105:
                if (v41 && !*(_BYTE *)(a1 + 104))
                  sub_10000FB20(a1, v32, "[chassis_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                goto LABEL_116;
              }
            }
            else if (!v67)
            {
              goto LABEL_105;
            }
            sub_1000111CC((_BYTE *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
            goto LABEL_105;
          }
        }
        else
        {
          sub_100010BD8(a1, 1u, 0x2Fu, (const __CFString **)(a1 + 1056));
          if (!*(_QWORD *)(a1 + 1056))
          {
            *(_BYTE *)(a1 + 2272) = 1;
            goto LABEL_24;
          }
          if (*(_DWORD *)a1 == 2)
            sub_10000FC44(a1, 47, 0, 0, a5, a6, a7, a8);
          *(_BYTE *)(a1 + 2273) = 1;
          *(_BYTE *)(a1 + 668) = 0;
          v13 = (const __CFString **)(a1 + 992);
          v14 = -4;
          do
            sub_100010BD8(a1, 1u, v14 + 43, v13++);
          while (!__CFADD__(v14++, 1));
          *(_BYTE *)(a1 + 2272) = 1;
        }
      }
      *(_DWORD *)(a1 + 664) = 2;
      if (!v8)
        sub_10000EE9C(a1, 2, 1, 0, 256, "NVRAM access is not currently available", 0, 0, 0);
      v11 = 0;
    }
  }
LABEL_20:
  if (!*(_DWORD *)(a1 + 96))
    sub_100010B24(a1, v11, a3, a4, a5, a6, a7, a8);
  return v11;
}

_QWORD *sub_10000EE9C(uint64_t a1, int a2, int a3, int a4, int a5, const char *a6, int a7, int a8, const void *a9)
{
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  __CFError *v28;
  CFIndex Code;
  const __CFString *Domain;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int *v41;
  unint64_t v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  _DWORD *v52;
  unint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  unint64_t v60;
  int *v61;
  int v62;
  _QWORD *v63;
  void *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  _QWORD **v73;
  _QWORD *v74;
  _QWORD *v75;
  void *v76;
  const void *v77;
  uint64_t v78;
  const char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned int v87;
  char *v88;
  int v89;
  char *v90;
  int v91;
  char *v92;
  int v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  char *v112;
  char v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  _QWORD *v123;
  _QWORD *v124;
  int v125;
  uint64_t v127;
  char v128;
  char v129;
  char *v130;
  char *v131[2];
  size_t v132;
  tm buffer[18];
  int v134[2];

  v17 = calloc(1uLL, 0x78uLL);
  if (!v17)
    return v17;
  v130 = 0;
  asprintf(&v130, "%s", a6);
  if (!v130)
  {
    free(v17);
    return 0;
  }
  *((_DWORD *)v17 + 2) = a2;
  v17[2] = time(0);
  gettimeofday((timeval *)(v17 + 3), 0);
  *((_DWORD *)v17 + 10) = getpid();
  *((_DWORD *)v17 + 11) = getppid();
  *((_DWORD *)v17 + 12) = a3;
  *((_DWORD *)v17 + 13) = a4;
  *((_DWORD *)v17 + 14) = a5;
  v17[8] = v130;
  *((_DWORD *)v17 + 18) = a7;
  *((_DWORD *)v17 + 19) = a8;
  if (a9)
  {
    v17[10] = a9;
    CFRetain(a9);
    a5 = *((_DWORD *)v17 + 14);
  }
  *((_DWORD *)v17 + 22) = a5 | (*((_DWORD *)v17 + 2) << 16) | 0x11000000;
  *(_QWORD *)v134 = 0x1500000001;
  v131[0] = 0;
  v131[1] = 0;
  v132 = 16;
  if (sysctl(v134, 2u, v131, &v132, 0, 0))
    v25 = -1;
  else
    v25 = v17[2] - (unint64_t)v131[0];
  v26 = *((_DWORD *)v17 + 2);
  switch(v26)
  {
    case 1:
      sub_1000114C8(a1, 10, *((unsigned int *)v17 + 22), (const char *)v17[8], v21, v22, v23, v24);
      goto LABEL_69;
    case 2:
      goto LABEL_69;
    case 3:
      if (!*((_DWORD *)v17 + 18))
      {
        v38 = 23;
        if (!*(_BYTE *)(a1 + 104))
          v38 = 11;
        v39 = *(_DWORD *)(a1 + 1472) + 1;
        *(_DWORD *)(a1 + 1472) = v39;
        v40 = *((unsigned int *)v17 + 22);
        v41 = *(int **)(a1 + 16 * v38 + 1496);
        if (!v41)
          goto LABEL_28;
        v42 = 0;
        do
        {
          v44 = *v41;
          v41 += 2;
          v43 = v44;
          if (v42 > 6)
            break;
          ++v42;
        }
        while (v43);
        if (!v43)
        {
          *(v41 - 2) = v40;
          *(v41 - 1) = v39;
          *(_BYTE *)(a1 + 16 * v38 + 1492) = 1;
        }
        else
        {
LABEL_28:
          v45 = *(_DWORD *)(a1 + 1476);
          if (!v45)
          {
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", v18, v40, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_store_lost");
            v45 = *(_DWORD *)(a1 + 1476);
            v40 = *((unsigned int *)v17 + 22);
          }
          *(_DWORD *)(a1 + 1476) = v45 + 1;
        }
        sub_1000114C8(a1, 12, v40, (const char *)v17[8], v21, v22, v23, v24);
      }
      goto LABEL_68;
    case 4:
    case 7:
      goto LABEL_15;
    case 5:
      goto LABEL_13;
    case 6:
      sub_100011838(a1, 14, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), (const char *)v17[8], v22, v23, v24);
      goto LABEL_69;
    default:
      if (v26 == 32)
      {
LABEL_15:
        sub_1000116E8(a1, 13, *((_DWORD *)v17 + 14) | 0x11070000u, *((unsigned int *)v17 + 18), *((unsigned int *)v17 + 19), v22, v23, v24);
        v28 = (__CFError *)v17[10];
        if (v28)
        {
          Code = CFErrorGetCode(v28);
          Domain = CFErrorGetDomain((CFErrorRef)v17[10]);
          v31 = sub_10000FF44((CFErrorRef)v17[10]);
          sub_1000116E8(a1, 15, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), Code, v32, v33, v34);
          if (Domain)
          {
            bzero(buffer, 0x400uLL);
            CFStringGetCString(Domain, (char *)buffer, 1024, 0x8000100u);
            sub_100011838(a1, 16, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), (const char *)buffer, v35, v36, v37);
          }
          if (v31)
          {
            sub_1000114C8(a1, 17, *((unsigned int *)v17 + 22), v31, v21, v22, v23, v24);
            free(v31);
          }
        }
        goto LABEL_68;
      }
      if (v26 != 33)
        goto LABEL_69;
LABEL_13:
      v20 = *((unsigned int *)v17 + 18);
      v27 = *((_DWORD *)v17 + 14);
      if ((_DWORD)v20)
      {
        sub_1000116E8(a1, 13, v27 | 0x11070000u, v20, 0, v22, v23, v24);
        goto LABEL_68;
      }
      v46 = 23;
      if (!*(_BYTE *)(a1 + 104))
        v46 = 11;
      v47 = a1 + 16 * v46;
      v48 = *(_QWORD **)(v47 + 1496);
      if (!v48)
        goto LABEL_45;
      v49 = v27 | 0x11030000;
      if (*(_DWORD *)v48 == v49)
      {
        v50 = 0;
        *v48 = 0;
LABEL_37:
        v51 = v50;
        do
        {
          v48[v51] = v48[v51 + 1];
          ++v51;
        }
        while (v51 != 7);
        goto LABEL_39;
      }
      v52 = v48 + 1;
      v53 = -1;
      while (v53 != 6)
      {
        v54 = *v52;
        v52 += 2;
        ++v53;
        if (v54 == v49)
        {
          *((_QWORD *)v52 - 1) = 0;
          if (v53 <= 5)
          {
            v50 = v53 + 1;
            goto LABEL_37;
          }
LABEL_39:
          v48[7] = 0;
          *(_BYTE *)(v47 + 1492) = 1;
          goto LABEL_48;
        }
      }
LABEL_45:
      v55 = *(_DWORD *)(a1 + 1480);
      if (!v55)
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n", v18, v19, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_remove_lost");
        v55 = *(_DWORD *)(a1 + 1480);
      }
      *(_DWORD *)(a1 + 1480) = v55 + 1;
LABEL_48:
      v56 = 24;
      if (!*(_BYTE *)(a1 + 104))
        v56 = 12;
      if (((0x1001100uLL >> v56) & 1) == 0)
        goto LABEL_63;
      v57 = a1 + 16 * v56;
      v58 = *(_QWORD *)(v57 + 1496);
      if (!v58)
        goto LABEL_63;
      v59 = *((_DWORD *)v17 + 14) | 0x11030000;
      if (*(_DWORD *)v58 == v59)
      {
        v60 = 0;
LABEL_57:
        v63 = (_QWORD *)(v58 + 16 * v60);
        v64 = (void *)v63[1];
        if (v64)
          free(v64);
        *v63 = 0;
        v63[1] = 0;
        if (v60 <= 6)
        {
          v65 = 16 * v60;
          do
          {
            *(_OWORD *)(v58 + v65) = *(_OWORD *)(v58 + v65 + 16);
            v65 += 16;
          }
          while (v65 != 112);
        }
        *(_QWORD *)(v58 + 112) = 0;
        *(_QWORD *)(v58 + 120) = 0;
        *(_BYTE *)(v57 + 1492) = 1;
      }
      else
      {
        v60 = 0;
        v61 = (int *)(v58 + 16);
        while (v60 != 7)
        {
          ++v60;
          v62 = *v61;
          v61 += 4;
          if (v62 == v59)
            goto LABEL_57;
        }
LABEL_63:
        v66 = *(_DWORD *)(a1 + 1480);
        if (!v66)
        {
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n", v18, v19, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_remove_lost");
          v66 = *(_DWORD *)(a1 + 1480);
        }
        *(_DWORD *)(a1 + 1480) = v66 + 1;
      }
LABEL_68:
      sub_100011604(a1, 18, v25, v20, v21, v22, v23, v24);
      sub_100011604(a1, 21, (uint64_t)*((double *)v17 + 14), v67, v68, v69, v70, v71);
LABEL_69:
      *v17 = 0;
      **(_QWORD **)(a1 + 192) = v17;
      *(_QWORD *)(a1 + 192) = v17;
      v72 = *(_DWORD *)(a1 + 200) + 1;
      *(_DWORD *)(a1 + 200) = v72;
      if (v72 >= 0x201)
      {
        v73 = (_QWORD **)(a1 + 184);
        do
        {
          v74 = *v73;
          v75 = (_QWORD *)**v73;
          *v73 = v75;
          if (!v75)
            *(_QWORD *)(a1 + 192) = v73;
          *(_DWORD *)(a1 + 200) = v72 - 1;
          v76 = (void *)v74[8];
          if (v76)
          {
            free(v76);
            v74[8] = 0;
          }
          v77 = (const void *)v74[10];
          if (v77)
            CFRelease(v77);
          free(v74);
          v72 = *(_DWORD *)(a1 + 200);
        }
        while (v72 > 0x200);
      }
      memset(buffer, 0, 56);
      v131[0] = 0;
      gmtime_r(v17 + 2, buffer);
      v78 = *((unsigned int *)v17 + 2);
      if (v78 > 0x21)
        v79 = "GENERAL";
      else
        v79 = off_1000250C8[v78];
      asprintf(v131, "[%02u:%02u:%02u.%04u-GMT]{%u>%u} CHECKPOINT %s", buffer[0].tm_hour, buffer[0].tm_min, buffer[0].tm_sec, *((_DWORD *)v17 + 8) / 1000, *((_DWORD *)v17 + 11), *((_DWORD *)v17 + 10), v79);
      v80 = v131[0];
      *(_QWORD *)&buffer[0].tm_sec = 0;
      if (*((_DWORD *)v17 + 19))
      {
        asprintf((char **)buffer, "(FAILURE:%d) ");
      }
      else
      {
        v87 = *((_DWORD *)v17 + 2);
        if (v87 <= 0x1C && ((1 << v87) & 0x18000080) != 0)
          asprintf((char **)buffer, "(SUCCESS) ", v127);
        else
          asprintf((char **)buffer, " ", v127);
      }
      v88 = *(char **)&buffer[0].tm_sec;
      if (!v80 || !*(_QWORD *)&buffer[0].tm_sec)
        goto LABEL_149;
      *(_QWORD *)&buffer[0].tm_sec = 0;
      if (*((_DWORD *)v17 + 14))
      {
        v89 = *((_DWORD *)v17 + 2);
        if (v89 == 28 || v89 == 1)
        {
          asprintf((char **)buffer, "[0x%04X] %s");
        }
        else if (*((_DWORD *)v17 + 12) == 1)
        {
          asprintf((char **)buffer, "%s");
        }
        else
        {
          asprintf((char **)buffer, "%s:[0x%04X] %s");
        }
        v90 = *(char **)&buffer[0].tm_sec;
      }
      else
      {
        v90 = 0;
      }
      v131[0] = 0;
      v91 = *((_DWORD *)v17 + 2);
      if (v91 == 28)
      {
        *(_QWORD *)&buffer[0].tm_sec = 0;
        if (!*((_DWORD *)v17 + 19))
        {
          asprintf((char **)buffer, "... %s");
          goto LABEL_122;
        }
        v94 = sub_100011A38(a1, 9, v81, v82, v83, v84, v85, v86);
        v100 = sub_100011AE4(a1, a1 + 1064, 12, v95, v96, v97, v98, v99);
        v101 = v100;
        v102 = *(unsigned int *)(a1 + 108);
        if (v102 > 6)
          v103 = "GENERAL";
        else
          v103 = off_1000252C0[v102];
        if (v94)
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s] %s", v103, v94);
            v112 = v94;
            goto LABEL_121;
          }
          asprintf((char **)buffer, "[%s] %s %s", v103, v100, v94);
          free(v94);
        }
        else
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s]");
LABEL_122:
            v92 = *(char **)&buffer[0].tm_sec;
            if (v90)
              goto LABEL_106;
            goto LABEL_123;
          }
          asprintf((char **)buffer, "[%s] %s", v103, v100);
        }
        v112 = v101;
LABEL_121:
        free(v112);
        goto LABEL_122;
      }
      if (v91 == 27)
      {
        v92 = sub_100011A38(a1, 13, v81, v82, v83, v84, v85, v86);
        v93 = strcmp(v92, "{}");
        if (v92 && !v93)
        {
          free(v92);
          if (!v90)
            goto LABEL_125;
LABEL_108:
          asprintf(v131, "%s:%s%s", v80, v88, v90);
          v111 = 0;
          v92 = 0;
          goto LABEL_127;
        }
      }
      else
      {
        v92 = sub_10000FF44((CFErrorRef)v17[10]);
      }
      if (v90)
      {
LABEL_106:
        if (v92)
        {
          asprintf(v131, "%s:%s%s %s", v80, v88, v90, v92);
          v111 = 0;
          goto LABEL_127;
        }
        goto LABEL_108;
      }
LABEL_123:
      if (v92)
      {
        asprintf(v131, "%s:%s %s", v80, v88, v92);
        goto LABEL_126;
      }
LABEL_125:
      asprintf(v131, "%s:%s", v80, v88);
      v92 = 0;
LABEL_126:
      v111 = 1;
LABEL_127:
      v113 = (char)v131[0];
      if (v131[0])
      {
        v129 = v111;
        if (*((_DWORD *)v17 + 2) == 28)
        {
          if (*(_DWORD *)(a1 + 88) == 2)
            v114 = 1;
          else
            v114 = 3;
        }
        else
        {
          v114 = 1;
        }
        while (1)
        {
          ramrod_log_msg("%s\n", v104, v105, v106, v107, v108, v109, v110, v113);
          if (*((_DWORD *)v17 + 2) == 28)
            ramrod_log_msg("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v115, v116, v117, v118, v119, v120, v121, v128);
          if (v114 < 2)
            break;
          --v114;
          sleep(1u);
        }
        v122 = v131[0];
        v123 = calloc(1uLL, 0x10uLL);
        if (v123)
        {
          v124 = v123;
          v123[1] = v122;
          if (*(_DWORD *)a1 == 1)
          {
            *v123 = 0;
            **(_QWORD **)(a1 + 480) = v123;
            *(_QWORD *)(a1 + 480) = v123;
          }
          else
          {
            pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
            v125 = *(_DWORD *)a1;
            *v124 = 0;
            **(_QWORD **)(a1 + 480) = v124;
            *(_QWORD *)(a1 + 480) = v124;
            if (v125 != 1)
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232));
          }
          *(_BYTE *)(a1 + 208) = 1;
          v111 = v129;
        }
        else if (v122)
        {
          free(v122);
        }
      }
      if ((v111 & 1) == 0)
        free(v90);
      if (v92)
        free(v92);
LABEL_149:
      if (v80)
        free(v80);
      if (v88)
        free(v88);
      return v17;
  }
}

void sub_10000F964(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString **v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23[1024];

  if (*(_BYTE *)(a2 + 4))
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_collect");
    return;
  }
  v10 = (const __CFString **)(a2 + 8);
  for (i = 1; i != 49; ++i)
  {
    sub_100010BD8((uint64_t)a1, *(_DWORD *)a2, i - 1, v10);
    v16 = *a1;
    if ((i - 40) <= 3 && v16 == 2)
    {
      if (*(_QWORD *)(a2 + 8 * i))
        goto LABEL_12;
    }
    else if ((i - 44) <= 3 && v16 == 2)
    {
      v17 = *(const __CFString **)(a2 + 8 * i);
      if (v17)
      {
        bzero(v23, 0x400uLL);
        sub_10000FD44(v17, v23);
        sub_10000FD8C((uint64_t)a1, (i - 5), v23, v18, v19, v20, v21, v22);
LABEL_12:
        sub_10000FC44((uint64_t)a1, i - 1, 0, 0, v12, v13, v14, v15);
      }
    }
    ++v10;
  }
  *(_BYTE *)(a2 + 4) = 1;
}

uint64_t sub_10000FAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;

  v8 = sub_100011AE4(a1, a2, 5, a4, a5, a6, a7, a8);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  do
  {
    if (!strcmp(v9, off_1000252F8[v10]))
      v11 = v10;
    else
      v11 = 0;
    if ((_DWORD)v11)
      break;
  }
  while (v10++ < 0x21);
  free(v9);
  return v11;
}

void sub_10000FB20(uint64_t a1, uint64_t a2, char *a3, ...)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8[2];
  va_list va;

  va_start(va, a3);
  v8[0] = 0;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a3, va);
  if (v8[0])
  {
    sub_10000EE9C(a1, 30, 1, 0, 260, v8[0], 0, 0, 0);
    sub_1000114C8(a1, 8, *(unsigned int *)(a1 + 120), v8[0], v4, v5, v6, v7);
    if (v8[0])
    {
      free(v8[0]);
      v8[0] = 0;
    }
  }
  ++*(_DWORD *)(a1 + 120);
}

void sub_10000FBBC(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  const char *v13;

  v8 = *(unsigned int *)(a1 + 96);
  v9 = (uint64_t)*(&off_100025408 + v8);
  if (*(_DWORD *)(v9 + 4 * a2))
  {
    *(_DWORD *)(a1 + 92) = v8;
    v12 = *(unsigned int *)(v9 + 4 * a2);
    *(_DWORD *)(a1 + 96) = v12;
    if (v12 > 0x21)
      v13 = "unknown";
    else
      v13 = off_1000252F8[v12];
    sub_10000FD8C(a1, 5, v13, a4, a5, a6, a7, a8);
    sub_100011360(a1, a2);
  }
}

void sub_10000FC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFString **v9;
  CFStringRef *v10;
  const __CFString *v11;
  char buffer[1024];

  if (a2 < 0x30)
  {
    v9 = &off_100024A40[4 * a2];
    if ((_DWORD)a3 || (*((_DWORD *)v9 + 6) - 5) < 0xFFFFFFFD)
    {
      bzero(buffer, 0x400uLL);
      if (*(_DWORD *)(a1 + 88) == 1)
        v10 = (CFStringRef *)v9;
      else
        v10 = (CFStringRef *)(v9 + 1);
      v11 = *v10;
      CFStringGetCString(*v10, buffer, 1024, 0x8000100u);
      sub_1000112A0(v11);
    }
    else
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of BOOT-CONTROL NVRAM ID %u\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_delete_var");
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of NVRAM ID %u\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_delete_var");
  }
}

char *sub_10000FD44(const __CFString *a1, char *a2)
{
  if (a1)
    CFStringGetCString(a1, a2, 1024, 0x8000100u);
  else
    bzero(a2, 0x400uLL);
  return a2;
}

void sub_10000FD8C(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  void **v11;
  int v12;

  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      v10 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F)
    goto LABEL_12;
  v10 = a2;
LABEL_7:
  if (((0xFFFC000000FEuLL >> v10) & 1) != 0)
  {
    v11 = *(void ***)(a1 + 16 * v10 + 1496);
    if (v11)
    {
      if (*v11)
      {
        free(*v11);
        *v11 = 0;
      }
      sub_100011994(a1 + 1456, (char **)v11, a3, a4, a5, a6, a7, a8);
      *(_BYTE *)(a1 + 16 * v10 + 1492) = 1;
      return;
    }
  }
LABEL_12:
  v12 = *(_DWORD *)(a1 + 1476);
  if (!v12)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    v12 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v12 + 1;
}

void sub_10000FEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 != 1)
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_access_obtain");
  }
}

void sub_10000FEF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 != 1)
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_access_yield");
  }
}

char *sub_10000FF44(CFErrorRef err)
{
  __CFError *v1;
  char *v2;
  unsigned int v3;
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *Value;
  char *v12;
  const __CFString *v13;
  char *v14;
  const __CFString *v15;
  char *v16;
  const __CFString *v17;
  size_t v19;
  char *v21;
  char v22;

  if (!err)
    return 0;
  v1 = err;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = CFErrorCopyUserInfo(v1);
    v2 = sub_1000109A0(v2, "[%d]", v5, v6, v7, v8, v9, v10, v3);
    if (!v4)
      break;
    v22 = 0;
    Value = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedRecoverySuggestionKey);
    v12 = sub_100011BD8(v2, (char)"RS", Value, &v22);
    v13 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedDescriptionKey);
    v14 = sub_100011BD8(v12, (char)"LD", v13, &v22);
    v15 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorDescriptionKey);
    v16 = sub_100011BD8(v14, (char)"D", v15, &v22);
    v17 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedFailureReasonKey);
    v2 = sub_100011BD8(v16, (char)"FR", v17, &v22);
    v1 = (__CFError *)CFDictionaryGetValue(v4, kCFErrorUnderlyingErrorKey);
    CFRelease(v4);
    if (!v1)
      break;
  }
  while (v3++ < 0xF);
  v19 = strlen(v2);
  if (v19 >= 0xF3)
  {
    v21 = 0;
    asprintf(&v21, "%s", &v2[v19 - 242]);
    if (v2)
      free(v2);
    return v21;
  }
  return v2;
}

uint64_t checkpoint_closure_context_get_step_desc(uint64_t result)
{
  if (result)
    return *(_QWORD *)result;
  return result;
}

uint64_t checkpoint_closure_context_should_retry(uint64_t result)
{
  int v1;

  if (result)
  {
    v1 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v1 + 1;
    return !*(_BYTE *)(result + 11) && v1 < *(_DWORD *)(*(_QWORD *)result + 28);
  }
  return result;
}

uint64_t checkpoint_closure_context_handle_simulator_actions(uint64_t *a1, uint64_t a2, int *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (qword_10002E5F8)
      return sub_1000101EC(qword_10002E5F8, *a1, a2, a3, a4, a6, a7, a8);
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_actions");
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_actions");
  }
  return a2;
}

uint64_t sub_1000101EC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, const void **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFStringRef v28;
  CFIndex Count;
  CFIndex v30;
  const __CFString *ValueAtIndex;
  CFIndex v32;
  CFIndex v33;
  const __CFString *v34;
  CFComparisonResult v35;
  _BOOL4 v36;
  int v37;
  _BOOL4 v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t i;
  mach_port_t v49;
  int v50;
  int v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  char v92;
  pthread_mutexattr_t v93;
  pthread_mutex_t v94;

  v10 = a3;
  v13 = a3;
  sub_10000FEA4(a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  sub_100011CA8(a1, v14, v15, v16, v17, v18, v19, v20);
  if (!*(_DWORD *)(a1 + 2276) || !*(_QWORD *)(a1 + 2288))
    goto LABEL_14;
  v28 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
  if (Count < 1)
  {
    v36 = 0;
    if (!v28)
      goto LABEL_10;
    goto LABEL_9;
  }
  v30 = Count;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), 0);
  if (CFStringCompare(v28, ValueAtIndex, 0) == kCFCompareEqualTo)
  {
    v36 = 1;
    if (!v28)
      goto LABEL_10;
LABEL_9:
    CFRelease(v28);
    goto LABEL_10;
  }
  v32 = 1;
  do
  {
    v33 = v32;
    if (v30 == v32)
      break;
    v34 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v32);
    v35 = CFStringCompare(v28, v34, 0);
    v32 = v33 + 1;
  }
  while (v35);
  v36 = v33 < v30;
  if (v28)
    goto LABEL_9;
LABEL_10:
  if (!v36)
  {
LABEL_14:
    sub_10000FEF4(a1, v21, v22, v23, v24, v25, v26, v27);
    v38 = 0;
    goto LABEL_15;
  }
  v37 = *(_DWORD *)(a1 + 2284);
  if (v37)
  {
    if (!v13)
      *(_DWORD *)(a1 + 2284) = v37 - 1;
    goto LABEL_14;
  }
  if (v13)
    sub_10000EE9C(a1, *(_DWORD *)(a1 + 2276), 1, 0, *(_DWORD *)a2, *(const char **)(a2 + 8), *(_DWORD *)(a1 + 2280), *a4, *a5);
  sub_10000FEF4(a1, v21, v22, v23, v24, v25, v26, v27);
  v38 = 0;
  v47 = 0;
  switch(*(_DWORD *)(a1 + 2276))
  {
    case 9:
      goto LABEL_80;
    case 0xA:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        *a4 = 181;
        ramrod_create_error_cf((CFErrorRef *)a5, CFSTR("CheckpointErrorDomain"), 181, 0, CFSTR("checkpoint simulator error"), v44, v45, v46, v92);
      }
      goto LABEL_76;
    case 0xB:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
        abort();
      goto LABEL_76;
    case 0xC:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
        exit(182);
      goto LABEL_76;
    case 0xD:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
        _exit(183);
      goto LABEL_76;
    case 0xE:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        for (i = 0; ; i += 4)
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator signal executing after dereference of %p [%d]\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      }
      goto LABEL_76;
    case 0xF:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        while (1)
          ;
      }
      goto LABEL_76;
    case 0x10:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        memset(&v94, 0, sizeof(v94));
        v93.__sig = 0;
        *(_QWORD *)v93.__opaque = 0;
        pthread_mutexattr_init(&v93);
        pthread_mutex_init(&v94, &v93);
        pthread_mutex_lock(&v94);
        pthread_mutex_lock(&v94);
      }
      goto LABEL_76;
    case 0x11:
      if (*(unsigned __int8 *)(a1 + 2275) != v10)
        goto LABEL_76;
      v49 = mach_host_self();
      v50 = 0;
      goto LABEL_45;
    case 0x12:
      if (*(unsigned __int8 *)(a1 + 2275) != v10)
        goto LABEL_76;
      v49 = mach_host_self();
      v50 = 4096;
LABEL_45:
      host_reboot(v49, v50);
LABEL_76:
      v38 = 0;
      goto LABEL_77;
    case 0x13:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator PAUSE not supported\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x14:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator RESUME not supported\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x15:
      if (*(unsigned __int8 *)(a1 + 2275) != v10)
        goto LABEL_76;
      __break(1u);
LABEL_50:
      v38 = v10 == 0;
LABEL_77:
      v47 = v13;
LABEL_78:
      if (!v13)
        goto LABEL_80;
      v13 = v47;
      if (!v47)
        goto LABEL_80;
      goto LABEL_15;
    case 0x16:
      goto LABEL_50;
    case 0x17:
      v38 = 0;
      v51 = *(unsigned __int8 *)(a1 + 2275);
      if (v51 == v10)
        v47 = 0;
      else
        v47 = v10;
      if (v13 || v51 != v10)
        goto LABEL_78;
      if (!*a4)
      {
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator to ignore error on step %s, but step was successful\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
        goto LABEL_70;
      }
      ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s result: %d\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      *a4 = 0;
      if (!*a5)
      {
LABEL_70:
        v38 = 0;
        v47 = 0;
        goto LABEL_80;
      }
      v52 = sub_10000FF44((CFErrorRef)*a5);
      if (v52)
      {
        v60 = v52;
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s error: %s\n", v53, v54, v55, v56, v57, v58, v59, (char)"checkpoint_simulator_action");
        free(v60);
      }
      CFRelease(*a5);
      v38 = 0;
      v47 = 0;
      *a5 = 0;
LABEL_80:
      v90 = *(_DWORD *)(a1 + 2280);
      if (v90)
      {
        v91 = v90 - 1;
        *(_DWORD *)(a1 + 2280) = v91;
        if (!v91)
          *(_DWORD *)(a1 + 2276) = 0;
      }
      v13 = v47;
LABEL_15:
      if (v10)
        return v13;
      else
        return v38;
    case 0x18:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        sub_100011EC0();
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): returned from checkpoint jetsam attempt; continuing engine\n",
          v61,
          v62,
          v63,
          v64,
          v65,
          v66,
          v67,
          (char)"checkpoint_simulator_action");
      }
      goto LABEL_76;
    case 0x19:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        v68 = fork();
        if (v68 < 1)
        {
          if (!v68)
          {
            sub_100011EC0();
            exit(0);
          }
          __error();
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): error %d attempting to fork jetsam child\n", v76, v77, v78, v79, v80, v81, v82, (char)"checkpoint_simulator_action");
        }
        else
        {
          LODWORD(v94.__sig) = 0;
          if (waitpid(v68, (int *)&v94, 0) < 0)
          {
            __error();
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): error %d waiting for jetsam child\n", v83, v84, v85, v86, v87, v88, v89, (char)"checkpoint_simulator_action");
          }
          else if ((v94.__sig & 0x7F) == 0x7F)
          {
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unexpected status of jetsam child: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
          else if ((v94.__sig & 0x7F) != 0)
          {
            ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child signalled: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
          else
          {
            ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child exited: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
        }
      }
      goto LABEL_76;
    default:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unknown simulator command ignored\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      v38 = 0;
      v47 = 1;
      goto LABEL_78;
  }
}

uint64_t checkpoint_closure_context_handle_simulator_match_name(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (qword_10002E5F8)
      return sub_1000107E0(qword_10002E5F8, *a1, a3, a4, a5, a6, a7, a8);
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_match_name");
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_match_name");
  }
  return 0;
}

uint64_t sub_1000107E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFIndex Count;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  CFIndex v33;
  const __CFString *ValueAtIndex;
  uint64_t v35;

  sub_10000FEA4(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_100011CA8(a1, v10, v11, v12, v13, v14, v15, v16);
  if (*(_DWORD *)(a1 + 2276))
  {
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
    v32 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
    if (Count < 1)
    {
LABEL_6:
      v35 = 0;
    }
    else
    {
      v33 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v33);
        if (CFStringCompare(v32, ValueAtIndex, 0) == kCFCompareEqualTo)
          break;
        if (Count == ++v33)
          goto LABEL_6;
      }
      v35 = 1;
    }
    sub_10000FEF4(a1, v25, v26, v27, v28, v29, v30, v31);
    if (v32)
      CFRelease(v32);
  }
  else
  {
    sub_10000FEF4(a1, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  return v35;
}

char *sub_1000108B4(char *a1, const char *a2, const char *a3, int *a4)
{
  char *v6;
  size_t v7;
  size_t v8;
  uint64_t v9;
  char *v11;
  char *v12;

  v11 = 0;
  v12 = 0;
  asprintf(&v12, "%s:%s", a2, a3);
  v6 = v12;
  if (!v12)
    return a1;
  if (!a1)
    return v12;
  v7 = strlen(a1);
  v8 = strlen(v12);
  v9 = 1;
  if (*a4 > 0)
    v9 = 2;
  if (v8 + v7 + v9 >= 0x81)
  {
    v11 = a1;
LABEL_13:
    free(v6);
    return v11;
  }
  if (*a4 <= 0)
    asprintf(&v11, "%s%s");
  else
    asprintf(&v11, "%s;%s");
  ++*a4;
  free(a1);
  v6 = v12;
  if (v12)
    goto LABEL_13;
  return v11;
}

char *sub_1000109A0(char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v11;
  char *v12[2];

  v11 = 0;
  v12[0] = 0;
  v12[1] = &a9;
  vasprintf(v12, a2, &a9);
  if (!v12[0])
    return a1;
  if (!a1)
    return v12[0];
  asprintf(&v11, "%s%s", a1, v12[0]);
  if (v11)
    free(a1);
  else
    v11 = a1;
  if (v12[0])
  {
    free(v12[0]);
    v12[0] = 0;
  }
  return v11;
}

char *sub_100010A3C(char *a1, int a2, const char *a3, int *a4)
{
  char *v8;

  v8 = 0;
  asprintf(&v8, "0x%08X", a2);
  if (v8)
  {
    a1 = sub_1000108B4(a1, v8, a3, a4);
    if (v8)
      free(v8);
  }
  return a1;
}

char *sub_100010AB0(char *a1, int a2, const char *a3, int *a4)
{
  char *v8;

  v8 = 0;
  asprintf(&v8, "%d", a2);
  if (v8)
  {
    a1 = sub_1000108B4(a1, v8, a3, a4);
    if (v8)
      free(v8);
  }
  return a1;
}

void sub_100010B24(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  BOOL v10;

  if (*(_DWORD *)a1 == 1)
  {
    if (a2)
    {
      if (*(_BYTE *)(a1 + 104))
      {
        v9 = 17;
        goto LABEL_14;
      }
      v10 = *(_BYTE *)(a1 + 101) == 0;
      v9 = 5;
    }
    else
    {
      v10 = *(_DWORD *)(a1 + 88) == 2;
      v9 = 1;
    }
  }
  else if (a2)
  {
    if (*(_BYTE *)(a1 + 104))
    {
      v9 = 19;
      goto LABEL_14;
    }
    v10 = *(_BYTE *)(a1 + 101) == 0;
    v9 = 7;
  }
  else
  {
    v10 = *(_DWORD *)(a1 + 88) == 2;
    v9 = 3;
  }
  if (!v10)
    ++v9;
LABEL_14:
  *(_DWORD *)(a1 + 96) = v9;
  sub_10000FD8C(a1, 5, off_1000252F8[v9], a4, a5, a6, a7, a8);
  sub_100011360(a1, 1);
}

void sub_100010BD8(uint64_t a1, unsigned int a2, unsigned int a3, const __CFString **a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  __CFString **v16;
  const __CFString *v17;
  CFTypeID v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  const char *v43;
  char *valuePtr;
  CFTypeRef cf;
  char v46[1024];
  char buffer[1024];

  cf = 0;
  bzero(buffer, 0x400uLL);
  bzero(v46, 0x400uLL);
  if (a3 < 0x30)
  {
    if (*(_DWORD *)(a1 + 88) == 1)
      v16 = &off_100024A40[4 * a3];
    else
      v16 = &off_100024A40[4 * a3 + 1];
    CFStringGetCString(*v16, buffer, 1024, 0x8000100u);
    v17 = (const __CFString *)ramrod_copy_NVRAM_variable();
    if (!v17)
      return;
    v15 = v17;
    v18 = CFGetTypeID(v17);
    if (v18 == CFStringGetTypeID())
    {
      CFStringGetCString(v15, v46, 1024, 0x8000100u);
      *a4 = v15;
      v15 = 0;
      goto LABEL_22;
    }
    if (v18 == CFNumberGetTypeID())
    {
      LODWORD(valuePtr) = 0;
      if (!CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &valuePtr))
      {
        v27 = "CHECKPOINT_INTERNAL_ERROR(%s): number that is not an int %s\n";
        goto LABEL_29;
      }
      v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), valuePtr);
      if (!v26)
      {
        v27 = "CHECKPOINT_INTERNAL_ERROR(%s): failed to get valid number for %s\n";
LABEL_29:
        ramrod_log_msg(v27, v19, v20, v21, v22, v23, v24, v25, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }
    else
    {
      if (v18 != CFDataGetTypeID())
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unsupported nvram variable type for %s\n", v28, v29, v30, v31, v32, v33, v34, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
      v26 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)v15, 0x8000100u);
      if (!v26)
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): failed to get string from data %s\n", v35, v36, v37, v38, v39, v40, v41, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }
    v42 = v26;
    CFStringGetCString(v26, v46, 1024, 0x8000100u);
    *a4 = v42;
LABEL_22:
    valuePtr = 0;
    if (a2 > 2)
      v43 = "Unknown";
    else
      v43 = off_100025040[a2];
    asprintf(&valuePtr, "%s NVRAM variable: %s=%s", v43, buffer, v46);
    if (valuePtr)
    {
      sub_10000EE9C(a1, 2, 1, 0, 257, valuePtr, 0, 0, 0);
      free(valuePtr);
    }
    goto LABEL_3;
  }
  ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable id=%u\n", v8, v9, v10, v11, v12, v13, v14, (char)"checkpoint_nvram_collect_var");
  v15 = 0;
LABEL_3:
  if (cf)
    CFRelease(cf);
  if (v15)
    CFRelease(v15);
}

uint64_t sub_100010EBC(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  unsigned __int8 v11;
  char v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36[1024];
  char buffer[1024];
  _OWORD v38[3];

  memset(v38, 0, sizeof(v38));
  v10 = *a3;
  if (*a3)
  {
    v11 = 0;
    v12 = 0;
    v13 = a3 + 2;
    do
    {
      v14 = v10;
      *((_BYTE *)v38 + v10) = 1;
      if (*(_QWORD *)(a2 + 8 * v10 + 8))
      {
        if (*((_BYTE *)v13 - 3))
          v11 = 1;
        if (*((_BYTE *)v13 - 2))
          v12 = 1;
        if (*((_BYTE *)v13 - 1))
        {
          v15 = v10 <= 0x2F && (LODWORD(off_100024A40[4 * v10 + 3]) - 2) < 3;
          sub_10000FC44(a1, v10, v15, 1, a5, a6, a7, a8);
        }
      }
      else if (*((_BYTE *)v13 - 4))
      {
        bzero(buffer, 0x400uLL);
        sub_100011144(a1, v14, buffer, v16, v17, v18, v19, v20);
        sub_10000FB20(a1, v21, "[check_collection]%s(does_not_exist)", buffer);
      }
      v22 = *v13;
      v13 += 2;
      v10 = v22;
    }
    while (v22);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v23 = 0;
  v24 = a2 + 16;
  do
  {
    if (!*((_BYTE *)v38 + v23 + 1) && *(_QWORD *)(v24 + 8 * v23))
    {
      bzero(buffer, 0x400uLL);
      bzero(v36, 0x400uLL);
      sub_100011144(a1, (v23 + 1), buffer, v25, v26, v27, v28, v29);
      sub_10000FD44(*(const __CFString **)(v24 + 8 * v23), v36);
      sub_10000FB20(a1, v30, "[check_collection]%s=%s(exists_when_not_expected)", buffer, v36);
      sub_10000FC44(a1, (v23 + 1), 0, 1, v31, v32, v33, v34);
    }
    ++v23;
  }
  while (v23 != 47);
  if (v12)
    sub_10000EE9C(a1, 2, 1, 0, 262, "Old restore failure indication(s)", 0, 0, 0);
  return v11;
}

void sub_1000110F0(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(const __CFString **)(a2 + 24);
  if (v3)
  {
    if (CFStringCompare(v3, CFSTR("upgrade"), 0) == kCFCompareEqualTo)
      sub_10000FC44(a1, 2, 1, 0, v4, v5, v6, v7);
  }
}

char *sub_100011144(uint64_t a1, uint64_t a2, char *buffer, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFString **v10;

  if (a2 >= 0x30)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, (uint64_t)buffer, a4, a5, a6, a7, a8, (char)"checkpoint_get_nvram_name");
    LODWORD(a2) = 0;
  }
  if (*(_DWORD *)(a1 + 88) == 1)
    v10 = &off_100024A40[4 * a2];
  else
    v10 = &off_100024A40[4 * a2 + 1];
  CFStringGetCString(*v10, buffer, 1024, 0x8000100u);
  return buffer;
}

void sub_1000111CC(_BYTE *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  char v12[1024];

  if (a1[100])
  {
    a1[104] = 1;
    a1[101] = 1;
    ramrod_log_msg("AP nonce will not be touched\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    bzero(v12, 0x400uLL);
    sub_10000FD44(a2, v12);
    sub_10000FB20((uint64_t)a1, v11, "[reboot_retry_chassis]outcome=%s(pre_existing_reboot_retry_disabled)", v12);
  }
}

void sub_1000112A0(const __CFString *a1)
{
  char buffer[1024];

  bzero(buffer, 0x400uLL);
  CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  ramrod_delete_NVRAM_variable();
}

void sub_100011360(uint64_t a1, int a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  char *v7;

  v7 = 0;
  v3 = *(unsigned int *)(a1 + 92);
  if (v3 > 0x21)
    v4 = "unknown";
  else
    v4 = off_1000252F8[v3];
  v5 = *(unsigned int *)(a1 + 96);
  if (v5 > 0x21)
    v6 = "unknown";
  else
    v6 = off_1000252F8[v5];
  asprintf(&v7, "%s (%s) -> (%s)", off_100025058[a2], v4, v6);
  if (v7)
  {
    sub_10000EE9C(a1, 29, 1, 0, 260, v7, 0, 0, 0);
    if (v7)
      free(v7);
  }
}

uint64_t sub_100011424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      LODWORD(a2) = 0;
      goto LABEL_7;
    }
    LODWORD(a2) = off_100024A40[4 * a2 + 2];
  }
  if (a2 < 0x30)
  {
LABEL_7:
    v10 = a2;
    v9 = HIDWORD(off_100024A40[4 * a2 + 2]);
    return ((uint64_t (*)(uint64_t, _QWORD))checkpoint_nvram_encoder[v9])(a1, *(_QWORD *)(a1 + 16 * v10 + 1496));
  }
  v9 = 0;
  v10 = a2;
  return ((uint64_t (*)(uint64_t, _QWORD))checkpoint_nvram_encoder[v9])(a1, *(_QWORD *)(a1 + 16 * v10 + 1496));
}

void sub_1000114C8(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;

  v9 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      v11 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F)
    goto LABEL_18;
  v11 = a2;
LABEL_7:
  if (((0x20420400uLL >> v11) & 1) != 0)
  {
    a2 = *(_QWORD *)(a1 + 16 * v11 + 1496);
    if (a2)
      goto LABEL_21;
  }
  if (((0x1001100uLL >> v11) & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 16 * v11 + 1496);
    if (v12)
    {
      v13 = 0;
      a2 = v12 - 16;
      do
      {
        v15 = *(_DWORD *)(a2 + 16);
        a2 += 16;
        v14 = v15;
        if (v15)
          v16 = v13 >= 7;
        else
          v16 = 1;
        ++v13;
      }
      while (!v16);
      if (!v14)
      {
LABEL_21:
        *(_DWORD *)a2 = v9;
        sub_100011994(a1 + 1456, (char **)(a2 + 8), a4, (uint64_t)a4, a5, a6, a7, a8);
        *(_BYTE *)(a1 + 16 * v11 + 1492) = 1;
        return;
      }
    }
  }
LABEL_18:
  v17 = *(_DWORD *)(a1 + 1476);
  if (!v17)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    v17 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v17 + 1;
}

void sub_100011604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;

  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      v10 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F)
    goto LABEL_10;
  v10 = a2;
LABEL_7:
  if (((0x3C03C0000uLL >> v10) & 1) != 0)
  {
    v11 = a1 + 16 * v10;
    v12 = *(uint64_t **)(v11 + 1496);
    if (v12)
    {
      *v12 = a3;
      *(_BYTE *)(v11 + 1492) = 1;
      return;
    }
  }
LABEL_10:
  v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_1000116E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v12;
  int v13;
  _DWORD *v14;
  unint64_t v15;
  _DWORD *v16;
  _DWORD *v17;
  int v18;
  int v19;
  BOOL v20;
  BOOL v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      v12 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F)
    goto LABEL_8;
  v12 = a2;
LABEL_7:
  if (((0xA00A000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        v19 = *v17;
        v17 += 11;
        v18 = v19;
        if (v19)
          v20 = 1;
        else
          v20 = v10 == 0;
        if (!v20)
          v16 = v14;
        v21 = v18 == v10 || v15++ >= 7;
        v14 = v17;
      }
      while (!v21);
      if (v18 == v10)
        v16 = v17 - 11;
      if (v16)
      {
        *v16 = v10;
        v16[v9 + 1] = v8;
        *((_BYTE *)v16 + v9 + 36) = 1;
        *(_BYTE *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }
LABEL_8:
  v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_100011838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int v10;
  uint64_t v12;
  int v13;
  _DWORD *v14;
  unint64_t v15;
  _DWORD *v16;
  _DWORD *v17;
  int v18;
  int v19;
  BOOL v20;
  BOOL v21;

  v9 = a4;
  v10 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, (uint64_t)a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      v12 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F)
    goto LABEL_8;
  v12 = a2;
LABEL_7:
  if (((0x14014000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        v19 = *v17;
        v17 += 18;
        v18 = v19;
        if (v19)
          v20 = 1;
        else
          v20 = v10 == 0;
        if (!v20)
          v16 = v14;
        v21 = v18 == v10 || v15++ >= 7;
        v14 = v17;
      }
      while (!v21);
      if (v18 == v10)
        v16 = v17 - 18;
      if (v16)
      {
        *v16 = v10;
        sub_100011994(a1 + 1456, (char **)&v16[2 * v9 + 2], a5, a4, (uint64_t)a5, a6, a7, a8);
        *(_BYTE *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }
LABEL_8:
  v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, (uint64_t)a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_100011994(uint64_t a1, char **a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;

  if (a2)
  {
    if (*a2)
    {
      free(*a2);
      *a2 = 0;
    }
    if (a3)
      asprintf(a2, "%s", a3);
  }
  else
  {
    v11 = *(_DWORD *)(a1 + 20);
    if (!v11)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", 0, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
      v11 = *(_DWORD *)(a1 + 20);
    }
    *(_DWORD *)(a1 + 20) = v11 + 1;
  }
}

char *sub_100011A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *result;
  const __CFString *v9;
  char *v10;
  char buffer[1024];

  result = (char *)sub_100011424(a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = 0;
  if (result)
  {
    v9 = (const __CFString *)result;
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v9, buffer, 1024, 0x8000100u);
    asprintf(&v10, "%s", buffer);
    CFRelease(v9);
    return v10;
  }
  return result;
}

char *sub_100011AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  char *v11;
  char buffer[1024];

  v11 = 0;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a3 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      LODWORD(a3) = 0;
    }
    else
    {
      LODWORD(a3) = off_100024A40[4 * a3 + 2];
    }
  }
  v9 = *(const __CFString **)(a2 + 8 * a3 + 8);
  if (!v9)
    return 0;
  bzero(buffer, 0x400uLL);
  CFStringGetCString(v9, buffer, 1024, 0x8000100u);
  asprintf(&v11, "%s", buffer);
  return v11;
}

char *sub_100011BD8(char *a1, char a2, const __CFString *a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  char buffer[1024];

  if (a3)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(a3, buffer, 1024, 0x8000100u);
    if (*a4)
      v14 = "|%s(%s)";
    else
      v14 = "%s(%s)";
    a1 = sub_1000109A0(a1, v14, v8, v9, v10, v11, v12, v13, a2);
    *a4 = 1;
  }
  return a1;
}

void sub_100011CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  size_t v10;
  size_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFArray *ArrayBySeparatingStrings;
  CFIndex Count;
  CFIndex v23;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v26;
  const __CFString *v27;
  char v28[1024];
  char __s[5];
  _BYTE v30[3];

  if (!*(_BYTE *)(a1 + 2274) && sub_10000E5A8(a1, 0, 0, a4, a5, a6, a7, a8))
  {
    v9 = *(const __CFString **)(a1 + 992);
    if (!v9)
      goto LABEL_23;
    bzero(&v28[4], 0x3FCuLL);
    *(_DWORD *)(a1 + 2276) = 0;
    *(_QWORD *)(a1 + 2288) = 0;
    bzero(v30, 0x3FBuLL);
    strcpy(__s, "SIM_");
    v10 = strlen(__s);
    CFStringGetCString(v9, &__s[v10], 1024 - v10, 0x8000100u);
    strcpy(v28, "SIM");
    v11 = strlen(v28);
    CFStringGetCString(*(CFStringRef *)(a1 + 992), &v28[v11], 1024 - v11, 0x8000100u);
    v12 = 0;
    while (1)
    {
      v13 = off_1000250C8[v12];
      if (!strncasecmp(__s, v13, 0x400uLL))
      {
        *(_DWORD *)(a1 + 2276) = v12;
        goto LABEL_11;
      }
      if (!strncasecmp(v28, v13, 0x400uLL))
        break;
      if (++v12 == 34)
      {
        LODWORD(v12) = *(_DWORD *)(a1 + 2276);
        goto LABEL_11;
      }
    }
    *(_DWORD *)(a1 + 2276) = v12;
    *(_BYTE *)(a1 + 2275) = 1;
LABEL_11:
    if (!(_DWORD)v12)
      goto LABEL_23;
    v20 = *(const __CFString **)(a1 + 1016);
    if (v20)
    {
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v20, CFSTR(","));
      *(_QWORD *)(a1 + 2288) = ArrayBySeparatingStrings;
      if (ArrayBySeparatingStrings)
      {
        Count = CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count >= 1)
        {
          v23 = Count;
          for (i = 0; i != v23; ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), i);
            CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          }
        }
        v26 = *(const __CFString **)(a1 + 1000);
        if (v26)
          *(_DWORD *)(a1 + 2280) = CFStringGetIntValue(v26);
        v27 = *(const __CFString **)(a1 + 1008);
        if (v27)
          *(_DWORD *)(a1 + 2284) = CFStringGetIntValue(v27);
        goto LABEL_23;
      }
    }
    else
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator command without stepName\n", 0, v14, v15, v16, v17, v18, v19, (char)"checkpoint_simulator_configure");
    }
    *(_DWORD *)(a1 + 2276) = 0;
LABEL_23:
    *(_BYTE *)(a1 + 2274) = 1;
  }
}

_QWORD *sub_100011EC0()
{
  void **v0;
  size_t v1;
  void *v2;
  _QWORD *result;
  _QWORD *v4;
  void *v5;

  v5 = 0;
  v0 = &v5;
  v1 = 0x100000;
  do
  {
    v2 = malloc(v1);
    *v0 = v2;
    if (v2)
    {
      bzero(v2, v1);
      v0 = (void **)*v0;
    }
    else
    {
      v1 >>= 1;
    }
  }
  while ((int)v1 > 4095);
  result = v5;
  if (v5)
  {
    do
    {
      v4 = (_QWORD *)*result;
      free(result);
      result = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t ramrod_hardware_partition_supports_bics()
{
  return sub_100011F3C((uint64_t)CFSTR("SupportsBurninMitigation"));
}

uint64_t sub_100011F3C(uint64_t a1)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  CFTypeID v3;
  uint64_t Value;

  v1 = (const __CFBoolean *)MGCopyAnswer(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFGetTypeID(v1);
  if (v3 == CFBooleanGetTypeID())
    Value = CFBooleanGetValue(v2);
  else
    Value = 0;
  CFRelease(v2);
  return Value;
}

uint64_t ramrod_device_has_baseband()
{
  return 0;
}

const __CFDictionary *ramrod_device_has_stockholm()
{
  const __CFDictionary *result;

  result = IOServiceMatching("AppleStockholmControl");
  if (result)
  {
    result = (const __CFDictionary *)IOServiceGetMatchingService(kIOMasterPortDefault, result);
    if ((_DWORD)result)
    {
      IOObjectRelease((io_object_t)result);
      return (const __CFDictionary *)1;
    }
  }
  return result;
}

uint64_t _ramrod_device_has_sandcat()
{
  if (qword_10002E640 != -1)
    dispatch_once(&qword_10002E640, &stru_100025518);
  return byte_10002E638;
}

void sub_100012028(id a1)
{
  io_registry_entry_t v1;

  v1 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/Sandcat");
  if (v1)
  {
    byte_10002E638 = 1;
    IOObjectRelease(v1);
  }
}

uint64_t ramrod_connect_to_ioservice(const char *a1, io_service_t *a2, io_connect_t *a3)
{
  char v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_service_t MatchingService;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  io_service_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  io_connect_t connect;

  v5 = (char)a1;
  v6 = IOServiceMatching(a1);
  if (v6)
  {
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      v22 = MatchingService;
      connect = 0;
      if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        *a2 = v22;
        *a3 = connect;
        return 1;
      }
      ramrod_log_msg("IOServiceOpen failed for class '%s'\n", v23, v24, v25, v26, v27, v28, v29, v5);
    }
    else
    {
      ramrod_log_msg("IOServiceGetMatchingService failed\n", v15, v16, v17, v18, v19, v20, v21, v31);
    }
  }
  else
  {
    ramrod_log_msg("IOServiceMatching failed for %s\n", v7, v8, v9, v10, v11, v12, v13, v5);
  }
  return 0;
}

uint64_t ramrod_generate_apslot_copy_nonce(_DWORD *a1, CFDataRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  mach_error_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  CFDataRef v22;
  uint64_t v23;
  mach_error_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char outputStruct;
  size_t v34;
  size_t v35;
  mach_port_t connection[2];
  UInt8 bytes[16];
  __int128 v38;

  v35 = 4;
  *(_QWORD *)connection = 0;
  v34 = 32;
  *(_OWORD *)bytes = 0u;
  v38 = 0u;
  if (!ramrod_connect_to_ioservice("AppleMobileApNonce", &connection[1], connection))
  {
    ramrod_log_msg("Failed to connect to AppleMobileApNonce to generate AP nonce slot.\n", v4, v5, v6, v7, v8, v9, v10, outputStruct);
    goto LABEL_5;
  }
  v11 = connection[0];
  v12 = IOConnectCallMethod(connection[0], 0xC8u, 0, 0, 0, 0, 0, 0, bytes, &v34);
  if (v12)
  {
    mach_error_string(v12);
    ramrod_log_msg("IOConnectCallMethod(%s,%u) failed: %s\n", v13, v14, v15, v16, v17, v18, v19, (char)"AppleMobileApNonce");
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v20 = (int *)calloc(1uLL, 4uLL);
  v25 = IOConnectCallMethod(v11, 0xCBu, 0, 0, 0, 0, 0, 0, v20, &v35);
  if (v25)
  {
    mach_error_string(v25);
    ramrod_log_msg("IOConnectCallMethod(%s,%u) failed: %s\n", v26, v27, v28, v29, v30, v31, v32, (char)"AppleMobileApNonce");
LABEL_6:
    v21 = 0;
    v22 = 0;
    v23 = 0;
    if (!a1)
      goto LABEL_8;
    goto LABEL_7;
  }
  v21 = *v20;
  v22 = CFDataCreate(kCFAllocatorDefault, bytes, 32);
  v23 = 1;
  if (a1)
LABEL_7:
    *a1 = v21;
LABEL_8:
  if (a2)
  {
    *a2 = v22;
  }
  else if (v22)
  {
    CFRelease(v22);
  }
  if (v20)
    free(v20);
  if (connection[1])
    IOObjectRelease(connection[1]);
  if (connection[0])
    IOObjectRelease(connection[0]);
  return v23;
}

uint64_t ramrod_generate_sepslot_copy_nonce(_DWORD *a1, CFDataRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_object_t v11;
  mach_error_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  CFDataRef v22;
  char outputStruct;
  uint32_t outputCnt;
  CFIndex length;
  mach_port_t connection[2];
  uint64_t output;
  UInt8 bytes[8];
  uint64_t v30;
  int v31;

  *(_QWORD *)bytes = 0;
  v30 = 0;
  v31 = 0;
  length = 20;
  *(_QWORD *)connection = 0;
  output = 0;
  outputCnt = 1;
  if (ramrod_connect_to_ioservice("AppleSEPManager", &connection[1], connection))
  {
    v11 = connection[0];
    v12 = IOConnectCallMethod(connection[0], 0x53u, 0, 0, 0, 0, &output, &outputCnt, bytes, (size_t *)&length);
    if (v12)
    {
      mach_error_string(v12);
      ramrod_log_msg("IOConnectCallMethod(%s,%u) failed: %s\n", v13, v14, v15, v16, v17, v18, v19, (char)"AppleSEPManager");
      v20 = 0;
      v21 = 0;
      v22 = 0;
    }
    else
    {
      v21 = output;
      v22 = CFDataCreate(kCFAllocatorDefault, bytes, length);
      v20 = 1;
    }
    if (connection[1])
      IOObjectRelease(connection[1]);
    if (v11)
      IOObjectRelease(v11);
    if (a1)
      *a1 = v21;
    if (a2)
    {
      *a2 = v22;
    }
    else if (v22)
    {
      CFRelease(v22);
    }
  }
  else
  {
    ramrod_log_msg("Failed to connect to AppleSEPManager to generate sep nonce.\n", v4, v5, v6, v7, v8, v9, v10, outputStruct);
    return 0;
  }
  return v20;
}

uint64_t ramrod_should_do_legacy_restored_behaviors()
{
  return 0;
}

uint64_t ramrod_should_do_legacy_restored_internal_behaviors()
{
  return 0;
}

void ramrod_create_error_cf(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_1000124A4(a1, a2, a3, a4, a5, &a9);
}

void sub_1000124A4(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v13;
  CFStringRef v14;
  CFStringRef v15;

  if (a1)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v13 = Mutable;
      v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a5, a6);
      if (v14)
      {
        v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }
      if (a4)
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }
}

const __CFDictionary *ramrod_should_update_stockholm(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return ramrod_device_has_stockholm();
  ramrod_log_msg("Skipping checking stockholm for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ramrod_copy_updater_functions(void *a1, const char *a2, __CFDictionary *(***a3)(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4), CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFDictionary *(**v12)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFDictionary *(**v16)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFDictionary *(*v21)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *(*v26)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFDictionary *(*v31)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *);

  if (!a2 || !a3)
  {
    ramrod_create_error_cf(a4, CFSTR("RamrodErrorDomain"), 3, 0, CFSTR("%s: invalid parameters"), a6, a7, a8, (char)"ramrod_copy_updater_functions");
    return 0;
  }
  *a3 = 0;
  v12 = (__CFDictionary *(**)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))malloc(0x18uLL);
  if (!v12)
  {
    ramrod_create_error_cf(a4, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: failed to allocate tmp update_functions struct"), v13, v14, v15, (char)"ramrod_copy_updater_functions");
    return 0;
  }
  v16 = v12;
  *v12 = 0;
  v12[1] = 0;
  v12[2] = 0;
  if (!strcmp(a2, "Canary"))
  {
    *v16 = sub_100012864;
    v16[1] = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012974;
    v16[2] = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012998;
  }
  else
  {
    v21 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012744(a1, (uint64_t)a2, (uint64_t)"UpdaterCreate", a4, v17, v18, v19, v20);
    *v16 = v21;
    if (!v21
      || (v26 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012744(a1, (uint64_t)a2, (uint64_t)"UpdaterIsDone", a4, v22, v23, v24, v25),
          (v16[1] = v26) == 0)
      || (v31 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012744(a1, (uint64_t)a2, (uint64_t)"UpdaterExecCommand", a4, v27, v28, v29, v30),
          (v16[2] = v31) == 0))
    {
      free(v16);
      return 0;
    }
  }
  *a3 = v16;
  return 1;
}

void *sub_100012744(void *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char __symbol[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if (a1 && a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    *(_OWORD *)__symbol = 0u;
    v16 = 0u;
    __strlcpy_chk(__symbol, a2, 128, 128);
    __strlcat_chk(__symbol, a3, 128, 128);
    result = dlsym(a1, __symbol);
    if (result)
      return result;
    dlerror();
    ramrod_create_error_cf(a4, CFSTR("RamrodErrorDomain"), 1012, 0, CFSTR("%s: unable to find %s: %s"), v12, v13, v14, (char)"load_function");
  }
  else
  {
    ramrod_create_error_cf(a4, CFSTR("RamrodErrorDomain"), 3, 0, CFSTR("%s: invalid parameters"), a6, a7, a8, (char)"load_function");
  }
  return 0;
}

__CFDictionary *sub_100012864(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *Mutable;
  const void *Value;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (a1)
    {
      Value = CFDictionaryGetValue(a1, CFSTR("Options"));
      if (Value)
        CFDictionarySetValue(Mutable, CFSTR("Options"), Value);
    }
    CFDictionarySetValue(Mutable, CFSTR("IsDone"), kCFBooleanFalse);
    CFDictionarySetValue(Mutable, CFSTR("Loop0"), kCFBooleanTrue);
    CFDictionarySetValue(Mutable, CFSTR("QueryLoop0"), kCFBooleanTrue);
  }
  else
  {
    ramrod_create_error_cf(a4, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: state allocation failed"), v6, v7, v8, (char)"_CanaryUpdaterCreate");
  }
  return Mutable;
}

const __CFDictionary *sub_100012974(const __CFDictionary *result)
{
  const __CFBoolean *Value;

  if (result)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(result, CFSTR("IsDone"));
    return (const __CFDictionary *)CFBooleanGetValue(Value);
  }
  return result;
}

uint64_t sub_100012998(const __CFDictionary *a1, CFStringRef theString1, uint64_t a3, CFMutableDictionaryRef *a4, CFErrorRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v12;
  CFMutableDictionaryRef Mutable;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  __CFDictionary *v19;
  const void *v20;
  const __CFString *v21;
  __CFDictionary *v22;
  CFBooleanRef v23;
  const void *Value;

  if (!a1)
  {
    v12 = CFSTR("%s: state is NULL");
    goto LABEL_7;
  }
  if (!theString1)
  {
    v12 = CFSTR("%s: command is NULL");
    goto LABEL_7;
  }
  if (!a4)
  {
    v12 = CFSTR("%s: output is NULL");
    goto LABEL_7;
  }
  if (CFStringCompare(theString1, CFSTR("queryInfo"), 0))
  {
    if (CFStringCompare(theString1, CFSTR("performNextStage"), 0))
    {
      v12 = CFSTR("%s: %@ invalid command");
LABEL_7:
      ramrod_create_error_cf(a5, CFSTR("RamrodErrorDomain"), 3, 0, v12, a6, a7, a8, (char)"_CanaryUpdaterExecCmd");
      return 0;
    }
    Value = CFDictionaryGetValue(a1, CFSTR("Loop0"));
    AMSupportLogInternal(6, "_CanaryUpdaterExecCmd", "PerformNextStage Running, Loop0=%@.", Value);
    if (CFDictionaryGetValue(a1, CFSTR("Loop0")) == kCFBooleanFalse)
      CFDictionarySetValue(a1, CFSTR("IsDone"), kCFBooleanTrue);
    v21 = CFSTR("Loop0");
    v22 = a1;
    v23 = kCFBooleanFalse;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *a4 = Mutable;
    if (!Mutable)
    {
      ramrod_create_error_cf(a5, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: *output allocation failed"), v15, v16, v17, (char)"_CanaryUpdaterExecCmd");
      return 0;
    }
    v18 = CFDictionaryGetValue(a1, CFSTR("QueryLoop0"));
    AMSupportLogInternal(6, "_CanaryUpdaterExecCmd", "QueryInfo Running, Loop0=%@.", v18);
    CFDictionarySetValue(*a4, CFSTR("ECID"), CFSTR("1234567890"));
    v19 = *a4;
    v20 = CFDictionaryGetValue(a1, CFSTR("QueryLoop0"));
    CFDictionarySetValue(v19, CFSTR("QueryLoop0"), v20);
    CFDictionarySetValue(*a4, CFSTR("LocalSigningID"), kCFBooleanTrue);
    if (CFDictionaryGetValue(a1, CFSTR("QueryLoop0")) == kCFBooleanFalse)
      CFDictionarySetValue(a1, CFSTR("IsDone"), kCFBooleanTrue);
    v21 = CFSTR("QueryLoop0");
    v22 = a1;
    v23 = kCFBooleanFalse;
  }
  CFDictionarySetValue(v22, v21, v23);
  return 1;
}

uint64_t ramrod_update_nvram_overrides(const char *a1, __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *CStringPtr;
  const __CFData *v11;
  const __CFString *v12;
  const char *v13;
  CFStringRef v15;
  CFTypeID v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  char v33;

  if (!a2)
  {
    v32 = "options is NULL\n";
LABEL_21:
    ramrod_log_msg(v32, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v33);
    v11 = 0;
    v12 = 0;
    goto LABEL_7;
  }
  if (!a1)
  {
    v32 = "updaterName is NULL\n";
    goto LABEL_21;
  }
  CStringPtr = CFStringGetCStringPtr(CFSTR("T200"), 0x8000100u);
  if (!strcmp(a1, CStringPtr))
  {
    v11 = (const __CFData *)ramrod_copy_NVRAM_variable_from_devicetree(CFSTR("VeridianForceUpdate"));
    if (v11)
    {
      v15 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v11, 0x8000100u);
      v12 = v15;
      if (v15)
      {
        v16 = CFGetTypeID(v15);
        if (v16 == CFStringGetTypeID() && CFStringCompare(v12, CFSTR("yes"), 1uLL) == kCFCompareEqualTo)
        {
          ramrod_log_msg("Setting %s=false due to nvram variable %s=yes\n", v17, v18, v19, v20, v21, v22, v23, (char)"SkipSameVersion");
          CFDictionarySetValue(a2, CFSTR("SkipSameVersion"), kCFBooleanFalse);
          CFDictionarySetValue(a2, CFSTR("RestoreInternal"), kCFBooleanTrue);
        }
      }
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
LABEL_6:
  v13 = CFStringGetCStringPtr(CFSTR("AppleTCON"), 0x8000100u);
  if (!strcmp(a1, v13))
  {
    v11 = (const __CFData *)ramrod_copy_NVRAM_variable_from_devicetree(CFSTR("AppleTCONForceUpdate"));
    if (v11)
      v12 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v11, 0x8000100u);
    if (v12)
    {
      v24 = CFGetTypeID(v12);
      if (v24 == CFStringGetTypeID() && CFStringCompare(v12, CFSTR("yes"), 1uLL) == kCFCompareEqualTo)
      {
        ramrod_log_msg("Setting %s=false due to nvram variable %s=yes\n", v25, v26, v27, v28, v29, v30, v31, (char)"SkipSameVersion");
        CFDictionarySetValue(a2, CFSTR("SkipSameVersion"), kCFBooleanFalse);
        CFDictionarySetValue(a2, CFSTR("RestoreInternal"), kCFBooleanTrue);
      }
    }
  }
LABEL_7:
  AMSupportSafeRelease(v12);
  return AMSupportSafeRelease(v11);
}

__CFString **sub_100012EA4(const __CFString *a1)
{
  uint64_t v2;
  const char *v3;
  const __CFString *v4;

  sub_100015A10();
  if (a1)
  {
    v2 = 0;
    v3 = "Updater entry is NULL, defaulting to TRUE";
    while (1)
    {
      v4 = off_10002E348[v2];
      if (!v4)
        break;
      if (CFStringCompare(a1, v4, 0) == kCFCompareEqualTo)
        return &off_10002E348[v2];
      v2 += 6;
      if (v2 == 72)
        return 0;
    }
  }
  else
  {
    v3 = "updaterName is NULL";
  }
  AMSupportLogInternal(3, "_updater_named", v3);
  return 0;
}

__CFString *ramrod_update_get_dylib(const __CFString *a1)
{
  __CFString **v2;

  if (a1)
  {
    v2 = sub_100012EA4(a1);
    if (v2)
      return v2[3];
    AMSupportLogInternal(3, "ramrod_update_get_dylib", "updaterName %@ not found", a1);
  }
  else
  {
    AMSupportLogInternal(3, "ramrod_update_get_dylib", "updaterName is NULL");
  }
  return 0;
}

CFDictionaryRef ramrod_update_copy_ap_parameters_generating_nonces(CFDictionaryRef theDict)
{
  __CFDictionary *MutableCopy;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CFDictionaryRef updated;
  char v12;

  if (theDict)
    MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
  else
    MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, CFSTR("GenerateNonces"), kCFBooleanTrue);
    updated = ramrod_update_copy_ap_parameters(v9);
    CFRelease(v9);
    return updated;
  }
  else
  {
    ramrod_log_msg("Failed to allocate ap options dictionary.\n", v2, v3, v4, v5, v6, v7, v8, v12);
    return 0;
  }
}

CFDictionaryRef ramrod_update_copy_ap_parameters(const __CFDictionary *a1)
{
  int BOOLean_option;
  __CFDictionary *Mutable;
  io_registry_entry_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_object_t v11;
  const __CFData *CFProperty;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFData *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const UInt8 *BytePtr;
  CFNumberRef v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFNumberRef v39;
  CFNumberRef v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CFNumberRef v48;
  CFNumberRef v49;
  CFDictionaryRef Copy;
  char v52;
  CFTypeRef cf;
  void *value;
  int v55;
  int valuePtr;

  BOOLean_option = get_BOOLean_option(a1, CFSTR("GenerateNonces"), 0);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    AMSupportLogInternal(3, "ramrod_update_copy_ap_parameters", "apParameters failed to allocate");
    v30 = 0;
    Copy = 0;
    goto LABEL_29;
  }
  v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (v3)
  {
    v11 = v3;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("esdm-fuses"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v20 = CFProperty;
      v21 = CFGetTypeID(CFProperty);
      if (v21 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr(v20);
        v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, BytePtr);
        if (v30)
          goto LABEL_12;
        v31 = "could not create CFNumber for esdm-fuses\n";
      }
      else
      {
        v31 = "esdm-fuses property is not a CFData\n";
      }
      ramrod_log_msg(v31, v22, v23, v24, v25, v26, v27, v28, v52);
      v30 = 0;
LABEL_12:
      CFRelease(v20);
      IOObjectRelease(v11);
      if (v30)
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSiKA, v30);
      goto LABEL_14;
    }
    ramrod_log_msg("unable to lookup esdm-fuses property\n", v13, v14, v15, v16, v17, v18, v19, v52);
    IOObjectRelease(v11);
  }
  else
  {
    ramrod_log_msg("unable to find 'chosen' registry entry\n", v4, v5, v6, v7, v8, v9, v10, v52);
  }
  v30 = 0;
LABEL_14:
  if (BOOLean_option && _ramrod_device_has_sandcat())
  {
    v55 = 2;
    valuePtr = 0;
    cf = 0;
    value = 0;
    if (ramrod_generate_apslot_copy_nonce(&valuePtr, (CFDataRef *)&value))
    {
      v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      if (v39)
      {
        v40 = v39;
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterApNonceSlotID, v39);
        CFRelease(v40);
      }
      if (value)
      {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterApNonce, value);
        CFRelease(value);
      }
    }
    else
    {
      ramrod_log_msg("unable to read the AP slot id will not set.\n", v32, v33, v34, v35, v36, v37, v38, v52);
    }
    if (ramrod_generate_sepslot_copy_nonce(&v55, (CFDataRef *)&cf))
    {
      v48 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v55);
      if (v48)
      {
        v49 = v48;
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSepNonceSlotID, v48);
        CFRelease(v49);
      }
      if (cf)
      {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSepNonce, cf);
        CFRelease(cf);
      }
    }
    else
    {
      ramrod_log_msg("unable to read the SEP slot id will not set.\n", v41, v42, v43, v44, v45, v46, v47, v52);
    }
  }
  Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, Mutable);
LABEL_29:
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v30);
  return Copy;
}

__CFDictionary *ramrod_update_copy_deviceinfo_with_options(const __CFDictionary *a1, CFErrorRef *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFMutableDictionaryRef Mutable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFMutableDictionaryRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFMutableDictionaryRef v17;
  __CFDictionary *v18;
  CFDictionaryRef updated;
  const void *Value;
  CFBooleanRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  BOOL v26;
  uint64_t v27;
  __CFDictionary *v28;
  CFMutableArrayRef v29;
  __CFDictionary *v30;
  CFMutableDictionaryRef MutableCopy;
  const char *v32;
  CFStringRef *v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFArray *v36;
  const __CFArray *v37;
  CFIndex v38;
  const __CFString *ValueAtIndex;
  const __CFString *v40;
  CFTypeID v41;
  const char *v42;
  __CFString **v43;
  __CFString *v44;
  __CFString **v45;
  __CFString *v46;
  const __CFAllocator *v47;
  char v48;
  const char *CStringPtr;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  __CFDictionary *v79;
  int v80;
  int v81;
  __CFString **v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  CFTypeID TypeID;
  unint64_t v97;
  CFMutableArrayRef v98;
  __CFDictionary *v99;
  const char *v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __CFDictionary *result;
  char v109;
  const void **v110;
  _BYTE *v111;
  __CFDictionary *v112;
  CFDictionaryRef v113;
  CFMutableDictionaryRef v114;
  __CFDictionary *v115;
  __CFDictionary *cf;
  const void **v117;
  CFMutableDictionaryRef v118;
  _BYTE *v119;
  _BOOL4 v120;
  int key;
  void *keya;
  __CFDictionary *theDict;
  BOOL v125;
  __CFDictionary *v126;
  const __CFDictionary *v127;
  __CFDictionary *(**v128)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *);
  __CFDictionary *v129;
  const void *v130[2];

  v129 = 0;
  v130[0] = 0;
  v128 = 0;
  sub_100015A10();
  cf = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: Failed to allocate outDict"), v3, v4, v5, (char)"ramrod_update_copy_deviceinfo_with_options");
    Mutable = 0;
LABEL_150:
    v13 = 0;
LABEL_152:
    v17 = 0;
LABEL_156:
    v126 = 0;
LABEL_157:
    theDict = 0;
    v113 = 0;
    MutableCopy = 0;
    updated = 0;
LABEL_158:
    v30 = 0;
    v29 = 0;
    v28 = 0;
    v101 = 1;
    goto LABEL_140;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: Failed to allocate deviceInfo"), v6, v7, v8, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_150;
  }
  v13 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v13)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: Failed to allocate disabledInfo"), v10, v11, v12, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_152;
  }
  v17 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v17)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: Failed to allocate checkpointDict"), v14, v15, v16, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_156;
  }
  if (!a1)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 2, 0, CFSTR("%s: options is NULL"), v14, v15, v16, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_156;
  }
  v126 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v126)
  {
    AMSupportLogInternal(4, "ramrod_update_copy_deviceinfo_with_options", "updaterOptions failed to allocate");
    goto LABEL_156;
  }
  theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    AMSupportLogInternal(4, "ramrod_update_copy_deviceinfo_with_options", "subOptions failed to allocate");
    goto LABEL_157;
  }
  v18 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  updated = v18;
  if (!v18)
  {
    AMSupportLogInternal(4, "ramrod_update_copy_deviceinfo_with_options", "restoreOptions failed to allocate");
    v113 = 0;
    MutableCopy = 0;
    goto LABEL_158;
  }
  CFDictionarySetValue(v18, CFSTR("CreateFilesystemPartitions"), kCFBooleanFalse);
  v113 = updated;
  CFDictionarySetValue(v126, CFSTR("RestoreOptions"), updated);
  if (CFDictionaryContainsKey(a1, CFSTR("PreflightRequired")))
  {
    Value = CFDictionaryGetValue(a1, CFSTR("PreflightRequired"));
    CFDictionarySetValue(theDict, CFSTR("PreflightRequired"), Value);
  }
  v118 = v17;
  v114 = v13;
  if (CFDictionaryContainsKey(a1, CFSTR("BootedUpdate")))
  {
    v21 = (CFBooleanRef)CFDictionaryGetValue(a1, CFSTR("BootedUpdate"));
    CFDictionarySetValue(theDict, CFSTR("BootedUpdate"), v21);
    v120 = v21 == kCFBooleanTrue;
  }
  else
  {
    v120 = 0;
  }
  v115 = Mutable;
  v127 = a1;
  if (CFDictionaryContainsKey(a1, CFSTR("PreflightContext")))
  {
    v25 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("PreflightContext"));
    CFDictionarySetValue(theDict, CFSTR("PreflightContext"), v25);
    v26 = CFStringCompare(v25, CFSTR("Limited"), 0) != kCFCompareEqualTo;
  }
  else
  {
    v26 = 1;
  }
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  MutableCopy = 0;
  if (v120)
    v26 = 1;
  v125 = v26;
  v32 = "ramrod_update_copy_deviceinfo_with_options";
  while (1)
  {
    if (v28)
      CFRelease(v28);
    if (v129)
    {
      CFRelease(v129);
      v129 = 0;
    }
    if (v29)
      CFRelease(v29);
    if (v30)
      CFRelease(v30);
    if (v130[0])
    {
      CFRelease(v130[0]);
      v130[0] = 0;
    }
    if (MutableCopy)
      CFRelease(MutableCopy);
    if (v128)
    {
      free(v128);
      v128 = 0;
    }
    v33 = (CFStringRef *)&off_10002E348[6 * v27];
    if (!*v33)
    {
      ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, v130[0], CFSTR("%s: Updater Name is NULL at index %d"), v22, v23, v24, (char)v32);
LABEL_129:
      MutableCopy = 0;
LABEL_131:
      updated = 0;
      v30 = 0;
      v29 = 0;
      goto LABEL_137;
    }
    v34 = v27 + 1;
    AMSupportLogInternal(6, v32, "Preflight loop %d for updater %@..", v27 + 1, *v33);
    v35 = *v33;
    if (!*v33)
      break;
    v36 = (const __CFArray *)CFDictionaryGetValue(v127, CFSTR("SkipUpdaters"));
    if (!v36)
      break;
    v37 = v36;
    if (CFArrayGetCount(v36) < 1)
      break;
    v38 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v37, v38);
      if (ValueAtIndex)
      {
        v40 = ValueAtIndex;
        v41 = CFGetTypeID(ValueAtIndex);
        if (v41 == CFStringGetTypeID() && CFStringCompare(v35, v40, 0) == kCFCompareEqualTo)
          break;
      }
      if (++v38 >= CFArrayGetCount(v37))
        goto LABEL_43;
    }
    AMSupportLogInternal(6, v32, "Skipping updater %@", *v33);
    MutableCopy = 0;
    v30 = 0;
    v29 = 0;
    v28 = 0;
LABEL_71:
    v27 = v34;
    if (v34 == 12)
    {
      updated = ramrod_update_copy_ap_parameters(v127);
      Mutable = v115;
      CFDictionaryAddValue(cf, CFSTR("DeviceInfo"), v115);
      v13 = v114;
      CFDictionaryAddValue(cf, CFSTR("DeviceInfoDisabled"), v114);
      v17 = v118;
      CFDictionaryAddValue(cf, CFSTR("DeviceInfoFailures"), v118);
      CFDictionaryAddValue(cf, CFSTR("ApParameters"), updated);
      v101 = 0;
      goto LABEL_140;
    }
  }
LABEL_43:
  v42 = v32;
  v43 = &off_10002E348[6 * v27];
  v46 = v43[2];
  v45 = v43 + 2;
  v44 = v46;
  if (!v46)
    goto LABEL_55;
  if (v125)
  {
    v47 = kCFAllocatorDefault;
    goto LABEL_49;
  }
  v47 = kCFAllocatorDefault;
  if (((unsigned int (*)(uint64_t))v44)(1))
  {
    v48 = 0;
    goto LABEL_51;
  }
  v44 = *v45;
LABEL_49:
  if (!((unsigned int (*)(_BOOL4))v44)(v120))
  {
LABEL_55:
    v32 = v42;
    AMSupportLogInternal(6, v42, "Updater %@ not supported on this device..", *v33);
    MutableCopy = 0;
    v30 = 0;
    v29 = 0;
    goto LABEL_70;
  }
  v48 = 1;
LABEL_51:
  CStringPtr = CFStringGetCStringPtr(*v33, 0x8000100u);
  if (!CStringPtr)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, v130[0], CFSTR("%s: failed convert updaterName %@"), v50, v51, v52, (char)v42);
    goto LABEL_129;
  }
  v53 = CStringPtr;
  MutableCopy = CFDictionaryCreateMutableCopy(v47, 0, theDict);
  if (!MutableCopy)
  {
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, v130[0], CFSTR("%s: Failed to copy subOptions for %s"), v54, v55, v56, (char)v42);
    goto LABEL_131;
  }
  CFDictionarySetValue(v126, CFSTR("Options"), MutableCopy);
  ramrod_update_nvram_overrides(v53, MutableCopy, v57, v58, v59, v60, v61, v62);
  if (AMAuthInstallUpdaterTwoStageEnabled(*v33))
  {
    ramrod_log_msg("%s Updater configured for two-stage update. DeferredCommit: YES.\n", v63, v64, v65, v66, v67, v68, v69, (char)v53);
    CFDictionarySetValue(MutableCopy, CFSTR("DeferredCommit"), kCFBooleanTrue);
  }
  else
  {
    ramrod_log_msg("%s Updater: Legacy / single-stage updater.\n", v63, v64, v65, v66, v67, v68, v69, (char)v53);
  }
  if (BYTE4(off_10002E348[6 * v27 + 4]))
  {
    v29 = CFArrayCreateMutable(v47, 0, &kCFTypeArrayCallBacks);
    if (v29)
    {
      if ((v48 & 1) == 0)
        goto LABEL_60;
      goto LABEL_61;
    }
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 6, v130[0], CFSTR("%s: Failed to create queryResults array for %s"), v70, v71, v72, (char)v42);
LABEL_136:
    updated = 0;
    v30 = 0;
LABEL_137:
    v28 = 0;
LABEL_138:
    v101 = 1;
    Mutable = v115;
    goto LABEL_139;
  }
  v29 = 0;
  if ((v48 & 1) == 0)
  {
LABEL_60:
    AMSupportLogInternal(6, v42, "overriding updater context to BootedOS for %sUpdater", v53);
    CFDictionarySetValue(MutableCopy, CFSTR("PreflightContext"), CFSTR("BootedOS"));
  }
LABEL_61:
  v73 = dlopen((const char *)off_10002E348[6 * v27 + 3], 261);
  if (!v73)
  {
    dlerror();
    v32 = v42;
    AMSupportLogInternal(6, v42, "Failed to open updater library on device that should have %s: %s");
LABEL_69:
    v30 = 0;
LABEL_70:
    v28 = 0;
    goto LABEL_71;
  }
  if (!ramrod_copy_updater_functions(v73, v53, &v128, a2, v74, v75, v76, v77))
  {
    AMSupportLogInternal(3, "ramrod_update_copy_deviceinfo_with_options", "ramrod_copy_updater_functions failed on %s");
    goto LABEL_136;
  }
  v32 = v42;
  v78 = ((uint64_t (*)(_QWORD, const void **))v128[1])(0, v130);
  if (v130[0])
  {
    AMSupportLogInternal(3, "ramrod_update_copy_deviceinfo_with_options", "%sUpdater fp_isDone returned error: %@", v53, v130[0]);
    goto LABEL_136;
  }
  if (v78)
  {
    AMSupportLogInternal(6, v42, "Updater %s returned isDone(NULL)=true (ie: module should skip), continuing.");
    goto LABEL_69;
  }
  AMSupportLogInternal(6, v42, "creating %sUpdater obj", v53);
  v79 = (*v128)(v126, (uint64_t)sub_10001415C, (uint64_t)v53, (CFErrorRef *)v130);
  v28 = v79;
  if (!v79)
  {
    AMSupportLogInternal(3, v42, "fp_create failed on %s. error=%@", v53, v130[0]);
    ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 1013, v130[0], CFSTR("%s: Preflight Create failed on %s"), v105, v106, v107, (char)v42);
LABEL_126:
    updated = 0;
    v30 = 0;
    goto LABEL_138;
  }
  v80 = ((uint64_t (*)(__CFDictionary *, const void **))v128[1])(v79, v130);
  if (v130[0])
  {
    AMSupportLogInternal(3, "ramrod_update_copy_deviceinfo_with_options", "%sUpdater fp_isDone returned error: %@", v53, v130[0]);
    goto LABEL_126;
  }
  if (v80)
  {
    AMSupportLogInternal(6, v42, "Updater %s returned isDone(obj)=true (ie: module should skip), continuing.", v53);
    v30 = 0;
    goto LABEL_71;
  }
  v81 = 0;
  v112 = 0;
  v82 = &off_10002E348[6 * v27];
  v119 = (char *)v82 + 33;
  v117 = (const void **)(v82 + 1);
  v110 = (const void **)(v82 + 5);
  v111 = (char *)v82 + 34;
  while (2)
  {
    if (v81 <= 1024)
      v83 = 1024;
    else
      v83 = v81;
    key = v83;
    v84 = v81 - 1;
    while (2)
    {
      if (v129)
      {
        CFRelease(v129);
        v129 = 0;
      }
      if (key == v84 + 1)
      {
        AMSupportLogInternal(3, v42, "Exceeded maximum loops (%d) for %s. error=%@", 1024, v53);
        ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 1016, v130[0], CFSTR("%s: Exceeded maximum loops for %s"), v102, v103, v104, (char)v42);
LABEL_123:
        updated = 0;
        v101 = 1;
        Mutable = v115;
        goto LABEL_124;
      }
      if (!v29)
        goto LABEL_89;
      AMSupportLogInternal(6, v42, "Calling %sUpdater fp_isDone", v53);
      v85 = ((uint64_t (*)(__CFDictionary *, const void **))v128[1])(v28, v130);
      if (v130[0])
      {
        AMSupportLogInternal(3, "ramrod_update_copy_deviceinfo_with_options", "%sUpdater fp_isDone returned error: %@", v53, v130[0]);
        goto LABEL_123;
      }
      if (v85)
        goto LABEL_121;
LABEL_89:
      AMSupportLogInternal(6, v42, "Calling %sUpdater fp_ExecCmd", v53);
      if (!((unsigned int (*)(__CFDictionary *, const __CFString *, _QWORD, __CFDictionary **, const void **))v128[2])(v28, CFSTR("queryInfo"), 0, &v129, v130))
      {
        AMSupportLogInternal(3, v42, "fp_ExecCmd failed on %s, continuing to next updater.", v53);
        if (*v119 == 1)
        {
          ramrod_log_msg("%s updater failed but not reporting error since it is best effort\n", v86, v87, v88, v89, v90, v91, v92, (char)v53);
        }
        else
        {
          CFDictionarySetValue(v118, *v33, *v117);
          ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 1016, v130[0], CFSTR("%s: Preflight QueryInfo failed on %s"), v93, v94, v95, (char)v42);
        }
        ++v84;
        if (!v29)
          goto LABEL_121;
        continue;
      }
      break;
    }
    if (!v129)
    {
      Mutable = v115;
      goto LABEL_103;
    }
    TypeID = CFDictionaryGetTypeID();
    Mutable = v115;
    if (TypeID != CFGetTypeID(v129) || CFDictionaryGetValue(v127, CFSTR("PreflightRequired")) != kCFBooleanFalse)
    {
LABEL_103:
      v97 = (unint64_t)v129;
      if (v29)
      {
        CFArrayAppendValue(v29, v129);
        v97 = (unint64_t)v129;
      }
      if (v97 && !v130[0])
      {
        AMSupportLogInternal(6, v42, "Populated deviceinfo for %s, continuing.", v53);
        if (v29)
          v98 = v29;
        else
          v98 = v129;
        if (*v111)
          v99 = Mutable;
        else
          v99 = v114;
        CFDictionarySetValue(v99, *v33, v98);
        goto LABEL_120;
      }
      if (!(v97 | (unint64_t)v130[0]))
      {
        AMSupportLogInternal(6, v42, "Updater %s returned no personalization info (ie: module should skip), continuing.", v53);
        goto LABEL_120;
      }
      v100 = "NULL";
      if (v97)
        v100 = "NOT-NULL";
      AMSupportLogInternal(6, v42, "Updater %s QueryInfo succeeded, but bad results. Results=%s, Error=%@", v53, v100, v130[0]);
      if (!*v111)
      {
LABEL_120:
        v81 = v84 + 2;
        if (v29)
          continue;
LABEL_121:
        v32 = v42;
        v30 = v112;
        goto LABEL_71;
      }
      ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 1016, v130[0], CFSTR("%s: Preflight QueryInfo succeeded, but improper results on %s"), v22, v23, v24, (char)v42);
      updated = 0;
      v101 = 1;
LABEL_124:
      v13 = v114;
      v17 = v118;
      v30 = v112;
      goto LABEL_140;
    }
    break;
  }
  v112 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v129);
  if (v112)
  {
    if (*v110)
    {
      keya = (void *)*v110;
      if (CFDictionaryContainsKey(v112, *v110))
      {
        AMSupportLogInternal(3, v42, "Removing updater reference from DeviceInfo to avoid serialization failures.");
        CFDictionaryRemoveValue(v112, keya);
        CFRelease(v129);
        v129 = v112;
        v112 = 0;
      }
    }
    goto LABEL_103;
  }
  updated = 0;
  v30 = 0;
  v101 = 1;
LABEL_139:
  v13 = v114;
  v17 = v118;
LABEL_140:
  AMSupportSafeRelease(v28);
  AMSupportSafeRelease(v30);
  AMSupportSafeRelease(v129);
  AMSupportSafeRelease(v29);
  AMSupportSafeRelease(v130[0]);
  AMSupportSafeRelease(v126);
  AMSupportSafeRelease(theDict);
  AMSupportSafeRelease(v113);
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v13);
  AMSupportSafeRelease(v17);
  AMSupportSafeRelease(MutableCopy);
  AMSupportSafeRelease(updated);
  if (v128)
  {
    free(v128);
    v128 = 0;
  }
  result = cf;
  v109 = v101 ^ 1;
  if (!cf)
    v109 = 1;
  if ((v109 & 1) == 0)
  {
    CFRelease(cf);
    return 0;
  }
  return result;
}

void sub_10001415C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    ramrod_log_msg("updater_log: %s", a2, a3, a4, a5, a6, a7, a8, a2);
}

__CFDictionary *ramrod_update_copy_deviceinfo(int a1, CFErrorRef *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  const void **v6;
  __CFDictionary *updated;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = Mutable;
  if (Mutable)
  {
    v6 = (const void **)&kCFBooleanTrue;
    if (!a1)
      v6 = (const void **)&kCFBooleanFalse;
    CFDictionarySetValue(Mutable, CFSTR("PreflightRequired"), *v6);
    CFDictionarySetValue(v5, CFSTR("PreflightContext"), CFSTR("BootedOS"));
    updated = ramrod_update_copy_deviceinfo_with_options(v5, a2);
  }
  else
  {
    AMSupportLogInternal(3, "ramrod_update_copy_deviceinfo", "Failed allocate options");
    updated = 0;
  }
  AMSupportSafeRelease(v5);
  return updated;
}

BOOL ramrod_should_update_rose(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL8 v8;
  const char *v9;
  int has_rose;
  char v12;

  if (a1)
  {
    v8 = 0;
    v9 = "Skipping checking Rose for booted update\n";
  }
  else
  {
    has_rose = ramrod_device_has_rose();
    v8 = has_rose != 0;
    if (has_rose)
      v9 = "Rose is present. Will update\n";
    else
      v9 = "Rose not present\n";
  }
  ramrod_log_msg(v9, a2, a3, a4, a5, a6, a7, a8, v12);
  return v8;
}

uint64_t ramrod_device_has_rose()
{
  const __CFDictionary *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  io_service_t MatchingService;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  CFTypeID v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFNumber *v35;
  CFTypeID v36;
  const __CFNumber *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFNumber *v45;
  CFTypeID v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v58;
  char v59;
  char v60;
  char valuePtr;

  v0 = IOServiceNameMatching("rose");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (!MatchingService)
  {
    ramrod_log_msg("Service does not exist\n", v1, v2, v3, v4, v5, v6, v7, v59);
    v49 = 0;
    v17 = 0;
    v26 = 0;
    v35 = 0;
LABEL_31:
    v45 = 0;
    goto LABEL_20;
  }
  if (!ramrod_should_do_legacy_restored_internal_behaviors())
  {
    v17 = 0;
LABEL_17:
    v26 = 0;
LABEL_18:
    v35 = 0;
    v45 = 0;
    goto LABEL_19;
  }
  valuePtr = 0;
  v9 = (const __CFString *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  v17 = v9;
  if (!v9)
  {
    v48 = "Failed to get HW model\n";
    goto LABEL_16;
  }
  v18 = CFGetTypeID(v9);
  if (v18 != CFStringGetTypeID())
  {
    v48 = "HW model is not a string\n";
    goto LABEL_16;
  }
  if (!CFStringHasSuffix(v17, CFSTR("DEV")))
  {
    v48 = "Not a DEV board\n";
LABEL_16:
    ramrod_log_msg(v48, v10, v11, v12, v13, v14, v15, v16, v59);
    goto LABEL_17;
  }
  ramrod_log_msg("DEV board\n", v10, v11, v12, v13, v14, v15, v16, v59);
  v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &valuePtr);
  if (!v26)
  {
    ramrod_log_msg("Failed to create zero\n", v19, v20, v21, v22, v23, v24, v25, v60);
    goto LABEL_18;
  }
  v27 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("ECID"), kCFAllocatorDefault, 1u);
  v35 = v27;
  if (!v27)
  {
    v58 = "ECID property does not exist\n";
LABEL_30:
    ramrod_log_msg(v58, v28, v29, v30, v31, v32, v33, v34, v60);
    v49 = 0;
    goto LABEL_31;
  }
  v36 = CFGetTypeID(v27);
  if (v36 != CFNumberGetTypeID())
  {
    v58 = "ECID property is not a number\n";
    goto LABEL_30;
  }
  if (CFNumberCompare(v26, v35, 0) == kCFCompareEqualTo)
  {
    v58 = "ECID property is zero\n";
    goto LABEL_30;
  }
  v37 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("ChipID"), kCFAllocatorDefault, 1u);
  v45 = v37;
  if (!v37)
  {
    v47 = "ChipID property does not exist\n";
    goto LABEL_34;
  }
  v46 = CFGetTypeID(v37);
  if (v46 != CFNumberGetTypeID())
  {
    v47 = "ChipID property is not a number\n";
    goto LABEL_34;
  }
  if (CFNumberCompare(v26, v45, 0))
  {
LABEL_19:
    v49 = 1;
    goto LABEL_20;
  }
  v47 = "ChipID property is zero\n";
LABEL_34:
  ramrod_log_msg(v47, v38, v39, v40, v41, v42, v43, v44, v60);
  v49 = 0;
LABEL_20:
  AMSupportSafeRelease(v45);
  AMSupportSafeRelease(v35);
  AMSupportSafeRelease(v26);
  AMSupportSafeRelease(v17);
  if (MatchingService)
    IOObjectRelease(MatchingService);
  ramrod_log_msg("result: %u\n", v50, v51, v52, v53, v54, v55, v56, v49);
  return v49;
}

const __CFString *ramrod_update_supported(CFStringRef theString, const __CFString *a2)
{
  const __CFString *v2;
  const char *CStringPtr;
  __CFString *dylib;
  __CFDictionary *Mutable;
  void *v7;
  CFMutableDictionaryRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  CFTypeID v16;
  CFErrorRef v17;
  const __CFString *v18;
  char *v20;
  const __CFString *v21;
  CFErrorRef err;
  void *v23;
  uint64_t v24;
  CFTypeRef cf;

  v2 = theString;
  v24 = 0;
  cf = 0;
  v23 = 0;
  if (!theString)
  {
    AMSupportLogInternal(3, "_ramrod_update_supported", "ERROR updater NULL.");
    v7 = 0;
    Mutable = 0;
    v8 = 0;
    CStringPtr = 0;
    goto LABEL_28;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (!CStringPtr)
  {
    AMSupportLogInternal(3, "_ramrod_update_supported", "Failed to convert %@ name to C String.. skipping update.", v2);
    v7 = 0;
    Mutable = 0;
    v8 = 0;
    goto LABEL_16;
  }
  dylib = ramrod_update_get_dylib(v2);
  Mutable = (__CFDictionary *)dylib;
  if (!dylib)
  {
    AMSupportLogInternal(3, "_ramrod_update_supported", "ramrod_update_get_dylib returned NULL for %@, skipping update.", v2);
LABEL_38:
    v7 = 0;
    goto LABEL_39;
  }
  v7 = dlopen((const char *)dylib, 261);
  if (!v7)
  {
    v20 = dlerror();
    AMSupportLogInternal(3, "_ramrod_update_supported", "%@ dylib missing, skipping update: %s: %s", v2, Mutable, v20);
    Mutable = 0;
LABEL_39:
    v8 = 0;
    goto LABEL_15;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    AMSupportLogInternal(4, "_ramrod_update_supported", "updaterOptions failed to allocate");
    goto LABEL_38;
  }
  v8 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v8)
  {
    AMSupportLogInternal(4, "_ramrod_update_supported", "subOptions failed to allocate");
LABEL_41:
    v7 = 0;
    goto LABEL_15;
  }
  CFDictionarySetValue(Mutable, CFSTR("Options"), v8);
  CFDictionarySetValue(v8, CFSTR("PreflightRequired"), kCFBooleanTrue);
  if (!ramrod_copy_updater_functions(v7, CStringPtr, (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v23, 0, v9, v10, v11, v12)|| !*((_QWORD *)v23 + 2)|| !*((_QWORD *)v23 + 1)|| !*(_QWORD *)v23)
  {
    goto LABEL_41;
  }
  v13 = (*(uint64_t (**)(__CFDictionary *, void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), const char *, uint64_t *))v23)(Mutable, sub_10001415C, CStringPtr, &v24);
  v7 = (void *)v13;
  if (!v13)
  {
    AMSupportLogInternal(3, "_ramrod_update_supported", "Failed to create %s obj, error=%@", CStringPtr, v24);
    goto LABEL_15;
  }
  err = 0;
  if ((*((unsigned int (**)(uint64_t, _QWORD))v23 + 1))(v13, 0))
  {
    v21 = v2;
    v14 = "%@ instructed us not to attempt OTA (via isDone)";
LABEL_14:
    AMSupportLogInternal(4, "_ramrod_update_supported", v14, v21);
LABEL_15:
    CStringPtr = 0;
LABEL_16:
    v2 = 0;
    goto LABEL_28;
  }
  v15 = (*((uint64_t (**)(void *, const __CFString *, _QWORD, CFTypeRef *, CFErrorRef *))v23 + 2))(v7, CFSTR("queryInfo"), 0, &cf, &err);
  if ((_DWORD)v15 == 1 && !err)
  {
    if (!cf || (v16 = CFGetTypeID(cf), v16 == CFDictionaryGetTypeID()) && !CFDictionaryGetCount((CFDictionaryRef)cf))
    {
      v21 = v2;
      v14 = "%@ instructed us not to attempt OTA (via QueryInfo)";
      goto LABEL_14;
    }
  }
  CStringPtr = 0;
  v17 = err;
  if (a2 && err)
  {
    v18 = CFErrorCopyDescription(err);
    CStringPtr = (const char *)v18;
    if (v18 && CFStringCompare(v18, a2, 0) == kCFCompareEqualTo)
    {
      AMSupportLogInternal(4, "_ramrod_update_supported", "%@ instructed us not to attempt update (via QueryInfo Error string match)", v2);
      goto LABEL_16;
    }
    AMSupportLogInternal(4, "_ramrod_update_supported", "%@ returned error, but no indication to skip update: %@", v2, err);
    v17 = err;
  }
  AMSupportLogInternal(6, "_ramrod_update_supported", "%@ tells us to attempt Update.  success=%d, error=%d, result=%d.", v2, v15, v17 != 0, cf != 0);
  v2 = (const __CFString *)1;
LABEL_28:
  AMSupportSafeRelease(cf);
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v8);
  AMSupportSafeRelease(v24);
  AMSupportSafeRelease(v7);
  AMSupportSafeRelease(CStringPtr);
  if (v23)
    free(v23);
  return v2;
}

BOOL ramrod_device_has_savage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;

  v25 = 0;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libSavageUpdater_iOS.dylib");
  v8 = dlopen("/usr/lib/updaters/libSavageUpdater_iOS.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v17, v18, v19, v20, v21, v22, v23, (char)"/usr/lib/updaters/libSavageUpdater_iOS.dylib");
    return 0;
  }
  v13 = ramrod_copy_updater_functions(v8, "Savage", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v9, v10, v11, v12);
  v14 = v25;
  if (!v13)
  {
    v16 = 0;
    if (!v25)
      return v16;
    goto LABEL_5;
  }
  v15 = (unsigned int (*)(_QWORD, _QWORD))*((_QWORD *)v25 + 1);
  if (!v15)
  {
    v16 = 0;
    goto LABEL_5;
  }
  v16 = v15(0, 0) == 0;
  v14 = v25;
  if (v25)
LABEL_5:
    free(v14);
  return v16;
}

BOOL ramrod_should_update_savage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!(_DWORD)a1)
    return ramrod_device_has_savage(a1, a2, a3, a4, a5, a6, a7, a8);
  ramrod_log_msg("Skipping checking Savage for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ramrod_device_has_veridian()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  io_object_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  CFTypeID v19;
  __CFDictionary *v20;
  CFDictionaryRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFDictionaryRef v29;
  io_service_t v30;
  io_object_t v31;
  const __CFString *CFProperty;
  CFTypeID v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v50;
  const char *v51;
  char v52;
  void *keys;

  v0 = IOServiceMatching("AppleGasGaugeUpdate");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    v9 = MatchingService;
    if (ramrod_should_do_legacy_restored_internal_behaviors())
    {
      v10 = (const __CFString *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
      v18 = v10;
      if (v10)
      {
        v19 = CFGetTypeID(v10);
        if (v19 == CFStringGetTypeID())
        {
          if (CFStringHasSuffix(v18, CFSTR("DEV")))
          {
            keys = CFSTR("built-in");
            v20 = IOServiceMatching("IOPMPowerSource");
            v21 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            v29 = v21;
            if (v20)
            {
              if (v21)
              {
                CFDictionarySetValue(v20, CFSTR("IOPropertyMatch"), v21);
                v30 = IOServiceGetMatchingService(kIOMasterPortDefault, v20);
                if (v30)
                {
                  v31 = v30;
                  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v30, CFSTR("Serial"), kCFAllocatorDefault, 0);
                  IOObjectRelease(v31);
                  AMSupportSafeRelease(v29);
                  if (CFProperty)
                  {
                    v33 = CFGetTypeID(CFProperty);
                    if (v33 == CFStringGetTypeID())
                    {
                      if (!CFStringGetLength(CFProperty))
                      {
                        ramrod_log_msg("Dev board with no Veridian attached - pretending we don't support Veridian.\n", v41, v42, v43, v44, v45, v46, v47, v52);
                        v48 = 0;
LABEL_17:
                        IOObjectRelease(v9);
                        goto LABEL_18;
                      }
                    }
                    else
                    {
                      ramrod_log_msg("Veridian Serial not a string - not expected\n", v34, v35, v36, v37, v38, v39, v40, v52);
                    }
LABEL_16:
                    v48 = 1;
                    goto LABEL_17;
                  }
                  goto LABEL_25;
                }
                v51 = "unable to find IOPMPowerSource service\n";
              }
              else
              {
                v51 = "Failed to allocate properties\n";
              }
            }
            else
            {
              v51 = "Failed to allocate matching\n";
            }
            ramrod_log_msg(v51, v22, v23, v24, v25, v26, v27, v28, v52);
            AMSupportSafeRelease(v29);
LABEL_25:
            v50 = "Veridian Serial is NULL - not expected\n";
            goto LABEL_26;
          }
LABEL_15:
          CFProperty = 0;
          goto LABEL_16;
        }
        v50 = "HW model is not a string\n";
      }
      else
      {
        v50 = "Failed to get HW model\n";
      }
LABEL_26:
      ramrod_log_msg(v50, v11, v12, v13, v14, v15, v16, v17, v52);
      goto LABEL_15;
    }
    v18 = 0;
    goto LABEL_15;
  }
  ramrod_log_msg("Not a Veridian device.\n", v2, v3, v4, v5, v6, v7, v8, v52);
  CFProperty = 0;
  v18 = 0;
  v48 = 0;
LABEL_18:
  AMSupportSafeRelease(v18);
  AMSupportSafeRelease(CFProperty);
  return v48;
}

BOOL ramrod_device_ota_veridian(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return ramrod_device_has_veridian() != 0;
  ramrod_log_msg("Skipping checking Veridian for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ramrod_device_has_appletcon(uint64_t a1)
{
  io_registry_entry_t v2;
  io_object_t v3;
  CFTypeRef CFProperty;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeID TypeID;
  CFIndex Length;
  CFIndex v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  io_registry_entry_t v32;
  io_object_t v33;
  CFTypeRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFTypeID v42;
  const UInt8 *BytePtr;
  int v44;
  uint64_t updated;
  const char *v46;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  CFRange v59;

  v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product");
  if (!v2)
  {
    CFProperty = 0;
LABEL_19:
    v34 = 0;
    v24 = 0;
LABEL_20:
    updated = 0;
    goto LABEL_21;
  }
  v3 = v2;
  CFProperty = IORegistryEntryCreateCFProperty(v2, CFSTR("tcon-path"), kCFAllocatorDefault, 0);
  IOObjectRelease(v3);
  if (!CFProperty)
  {
    v46 = "tcon-path pointer not found.\n";
LABEL_18:
    ramrod_log_msg(v46, v5, v6, v7, v8, v9, v10, v11, v57);
    goto LABEL_19;
  }
  TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(CFProperty))
  {
    v46 = "IORegistryEntryCreateCFProperty returned non CFDataRef\n";
    goto LABEL_18;
  }
  Length = CFDataGetLength((CFDataRef)CFProperty);
  if (!Length)
  {
    v46 = "tcon-path contains invalid string\n";
    goto LABEL_18;
  }
  v14 = Length;
  v15 = Length + 15;
  v16 = (char *)malloc(Length + 15);
  v24 = v16;
  if (!v16)
  {
    v49 = "malloc returned NULL\n";
LABEL_31:
    ramrod_log_msg(v49, v17, v18, v19, v20, v21, v22, v23, v57);
    goto LABEL_32;
  }
  if (snprintf(v16, v15, "%s", "IODeviceTree:/") != 14)
  {
    v49 = "overflow";
    goto LABEL_31;
  }
  v59.length = CFDataGetLength((CFDataRef)CFProperty);
  v59.location = 0;
  CFDataGetBytes((CFDataRef)CFProperty, v59, (UInt8 *)v24 + 14);
  v24[v14 + 14] = 0;
  ramrod_log_msg("Looking for entry under %s\n", v25, v26, v27, v28, v29, v30, v31, (char)v24);
  v32 = IORegistryEntryFromPath(kIOMasterPortDefault, v24);
  if (!v32)
  {
    v49 = "tcon-path points to non-existent node\n";
    goto LABEL_31;
  }
  v33 = v32;
  v34 = IORegistryEntryCreateCFProperty(v32, CFSTR("firmware"), kCFAllocatorDefault, 0);
  IOObjectRelease(v33);
  if (!v34)
  {
    v48 = "No 'firmware' property found.\n";
LABEL_23:
    ramrod_log_msg(v48, v35, v36, v37, v38, v39, v40, v41, v57);
    goto LABEL_20;
  }
  v42 = CFDataGetTypeID();
  if (v42 != CFGetTypeID(v34))
  {
    v48 = "IORegistryEntryCreateCFProperty returned non CFDataRef\n";
    goto LABEL_23;
  }
  if (CFDataGetLength((CFDataRef)v34) != 4)
  {
    v58 = CFDataGetLength((CFDataRef)v34);
    ramrod_log_msg("version_data wrong length (%lu bytes)\n", v50, v51, v52, v53, v54, v55, v56, v58);
    goto LABEL_20;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)v34);
  if (!BytePtr)
  {
    v48 = "CFDataGetBytePtr returned NULL\n";
    goto LABEL_23;
  }
  v44 = *(_DWORD *)BytePtr;
  ramrod_log_msg("AppleTCON flashable node found. (firmware=%d)\n", v35, v36, v37, v38, v39, v40, v41, *(_DWORD *)BytePtr);
  CFRelease(v34);
  if (!v44)
  {
LABEL_32:
    v34 = 0;
    goto LABEL_20;
  }
  if (a1
    && (const CFBooleanRef)AMSupportGetValueForKeyPathInDict(kCFAllocatorDefault, a1, CFSTR("AppleTCONOptions.FuseSDOM")) == kCFBooleanTrue)
  {
    v34 = 0;
    updated = 1;
  }
  else
  {
    updated = (uint64_t)ramrod_update_supported(CFSTR("AppleTCON"), CFSTR("AppleTCONUpdaterErrorDomain: AppleTCONUpdaterExecCommand - execCommand error"));
    v34 = 0;
  }
LABEL_21:
  AMSupportSafeRelease(CFProperty);
  AMSupportSafeRelease(v34);
  AMSupportSafeFree(v24);
  return updated;
}

BOOL ramrod_device_ota_appletcon(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return ramrod_device_has_appletcon(0) != 0;
  ramrod_log_msg("Skipping checking TCON for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_device_has_appletconuarp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;

  v25 = 0;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libTconUpdaterUARP.dylib");
  v8 = dlopen("/usr/lib/updaters/libTconUpdaterUARP.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v17, v18, v19, v20, v21, v22, v23, (char)"/usr/lib/updaters/libTconUpdaterUARP.dylib");
    return 0;
  }
  v13 = ramrod_copy_updater_functions(v8, "AppleTconUARP", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v9, v10, v11, v12);
  v14 = v25;
  if (!v13)
  {
    v16 = 0;
    if (!v25)
      return v16;
    goto LABEL_5;
  }
  v15 = (unsigned int (*)(_QWORD, _QWORD))*((_QWORD *)v25 + 1);
  if (!v15)
  {
    v16 = 0;
    goto LABEL_5;
  }
  v16 = v15(0, 0) == 0;
  v14 = v25;
  if (v25)
LABEL_5:
    free(v14);
  return v16;
}

BOOL ramrod_should_update_appletconuarp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!(_DWORD)a1)
    return ramrod_device_has_appletconuarp(a1, a2, a3, a4, a5, a6, a7, a8);
  ramrod_log_msg("Skipping checking AppleTconUARP for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t _ramrod_device_has_usbcretimer_callback(_DWORD *a1, io_iterator_t iterator)
{
  io_object_t v3;

  v3 = IOIteratorNext(iterator);
  if (v3)
    ++*a1;
  return IOObjectRelease(v3);
}

BOOL _ramrod_device_has_usbcretimer(const __CFString *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  io_registry_entry_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _BOOL8 v22;
  io_object_t v24;
  io_registry_entry_t v25;
  const __CFData *CFProperty;
  const __CFData *v27;
  CFTypeID TypeID;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const char *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  IONotificationPort *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  void *v53;
  CFMutableDictionaryRef v54;
  NSDictionary *v55;
  const __CFDictionary *v56;
  kern_return_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  io_object_t v65;
  __CFRunLoop *Current;
  __CFRunLoop *v67;
  id v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  void *j;
  char v81;
  __CFRunLoopSource *source;
  io_registry_entry_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t entryID;
  int refCon;
  io_iterator_t iterator;
  _BYTE v96[128];
  const __CFString *v97;
  CFTypeRef v98;
  _BYTE v99[128];

  iterator = 0;
  v3 = (void *)objc_opt_new(NSMutableArray, a2);
  v5 = (void *)objc_opt_new(NSMutableArray, v4);
  v6 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io");
  refCon = 0;
  ramrod_log_msg("entering %s\n", v7, v8, v9, v10, v11, v12, v13, (char)"_ramrod_device_has_usbcretimer");
  if (ramrod_should_do_legacy_restored_internal_behaviors())
  {
    entryID = 0;
    if (os_parse_boot_arg_int("ramrod_disable_usbcretimer", &entryID))
    {
      if (entryID)
      {
        v21 = "ramrod_disable_usbcretimer set in boot-args, disabling hardware support and not waiting for retimers\n";
LABEL_9:
        ramrod_log_msg(v21, v14, v15, v16, v17, v18, v19, v20, v81);
        v22 = 0;
        goto LABEL_10;
      }
    }
  }
  if (!v6)
  {
    v21 = "Failed to create DT node for IODeviceTree\n";
    goto LABEL_9;
  }
  if (IORegistryEntryCreateIterator(v6, "IODeviceTree", 1u, &iterator))
  {
    v21 = "Failed to create iterator for DeviceTree.\n";
    goto LABEL_9;
  }
  v84 = v5;
  v24 = IOIteratorNext(iterator);
  if (v24)
  {
    v25 = v24;
    while (1)
    {
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v25, CFSTR("name"), kCFAllocatorDefault, 0);
      if (CFProperty)
        break;
LABEL_25:
      IOObjectRelease(v25);
      v25 = IOIteratorNext(iterator);
      if (!v25)
        goto LABEL_26;
    }
    v27 = CFProperty;
    entryID = 0;
    IORegistryEntryGetRegistryEntryID(v25, &entryID);
    TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v27))
    {
      v36 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v27, 0x8000100u);
      if (v36)
      {
        v37 = v36;
        if (CFStringHasPrefix(v36, a1))
          objc_msgSend(v3, "addObject:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", entryID));
        CFRelease(v37);
        goto LABEL_24;
      }
      v38 = "nameString NULL\n";
    }
    else
    {
      v38 = "nameData not CFDataRef\n";
    }
    ramrod_log_msg(v38, v29, v30, v31, v32, v33, v34, v35, v81);
LABEL_24:
    CFRelease(v27);
    goto LABEL_25;
  }
LABEL_26:
  if (iterator)
    IOObjectRelease(iterator);
  iterator = 0;
  if (objc_msgSend(v3, "count"))
  {
    v83 = v6;
    v39 = objc_msgSend(v3, "count");
    ramrod_log_msg("Found %lu nodes in the device tree. Waiting some (small) amount of time for them to register as an IOSerivce\n", v40, v41, v42, v43, v44, v45, v46, v39);
    v47 = IONotificationPortCreate(kIOMasterPortDefault);
    source = IONotificationPortGetRunLoopSource(v47);
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v48 = v3;
    v49 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v90 != v51)
            objc_enumerationMutation(v3);
          v53 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
          LODWORD(entryID) = 0;
          v97 = CFSTR("IOParentMatch");
          v54 = IORegistryEntryIDMatching((uint64_t)objc_msgSend(v53, "longLongValue"));
          v98 = (id)CFMakeCollectable(v54);
          v55 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          if (v55)
            v56 = (const __CFDictionary *)CFRetain(v55);
          else
            v56 = 0;
          v57 = IOServiceAddMatchingNotification(v47, "IOServiceFirstMatch", v56, (IOServiceMatchingCallback)_ramrod_device_has_usbcretimer_callback, &refCon, (io_iterator_t *)&entryID);
          if (v57)
          {
            ramrod_log_msg("IOServiceAddMatchingNotification() failed with return %d", v58, v59, v60, v61, v62, v63, v64, v57);
          }
          else
          {
            objc_msgSend(v84, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", entryID));
            v65 = IOIteratorNext(entryID);
            if (v65)
              ++refCon;
            IOObjectRelease(v65);
          }
        }
        v50 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      }
      while (v50);
    }
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, source, kCFRunLoopDefaultMode);
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5.0, 0);
    v67 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v67, source, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(v47);
    v68 = (id)refCon;
    if (objc_msgSend(v3, "count") != v68)
    {
      v69 = refCon;
      objc_msgSend(v3, "count");
      ramrod_log_msg("Found only %d when we should have found %d\n", v70, v71, v72, v73, v74, v75, v76, v69);
    }
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v5 = v84;
    v77 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v78; j = (char *)j + 1)
        {
          if (*(_QWORD *)v86 != v79)
            objc_enumerationMutation(v84);
          IOObjectRelease((io_object_t)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j), "unsignedIntValue"));
        }
        v78 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
      }
      while (v78);
    }
    v22 = refCon != 0;
    v3 = v48;
    v6 = v83;
  }
  else
  {
    v22 = 0;
  }
LABEL_10:

  if (v6)
    IOObjectRelease(v6);
  return v22;
}

BOOL ramrod_device_has_usbcretimer(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _ramrod_device_has_usbcretimer(CFSTR("atcrt"), a2) || _ramrod_device_has_usbcretimer(CFSTR("uatcrt"), v2);
}

BOOL ramrod_should_update_usbcretimer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!(_DWORD)a1)
    return ramrod_device_has_usbcretimer(a1, a2);
  ramrod_log_msg("Skipping checking retimer for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_should_update_usbcretimer_uarp(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return _ramrod_device_has_usbcretimer(CFSTR("uatcrt"), a2);
  ramrod_log_msg("Skipping checking retimer for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_device_has_ace3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;

  v25 = 0;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libAce3Updater.dylib");
  v8 = dlopen("/usr/lib/updaters/libAce3Updater.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v17, v18, v19, v20, v21, v22, v23, (char)"/usr/lib/updaters/libAce3Updater.dylib");
    return 0;
  }
  v13 = ramrod_copy_updater_functions(v8, "Ace3", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v9, v10, v11, v12);
  v14 = v25;
  if (!v13)
  {
    v16 = 0;
    if (!v25)
      return v16;
    goto LABEL_5;
  }
  v15 = (unsigned int (*)(_QWORD, _QWORD))*((_QWORD *)v25 + 1);
  if (!v15)
  {
    v16 = 0;
    goto LABEL_5;
  }
  v16 = v15(0, 0) == 0;
  v14 = v25;
  if (v25)
LABEL_5:
    free(v14);
  return v16;
}

BOOL ramrod_should_update_ace3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!(_DWORD)a1)
    return ramrod_device_has_ace3(a1, a2, a3, a4, a5, a6, a7, a8);
  ramrod_log_msg("Skipping checking Ace3 for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ramrod_device_has_manta_mcu(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFDictionary *v8;
  io_service_t MatchingService;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  io_object_t v17;
  const __CFData *CFProperty;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFData *v26;
  CFTypeID TypeID;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  UInt8 v45;
  char Length;

  ramrod_log_msg("entering %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"ramrod_device_has_manta_mcu");
  v8 = IOServiceNameMatching("manta-b");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8);
  if (MatchingService)
  {
    v17 = MatchingService;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("supports-mcu-restore"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v26 = CFProperty;
      TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v26))
      {
        if (CFDataGetLength(v26) <= 0)
        {
          Length = CFDataGetLength(v26);
          ramrod_log_msg("supports-mcu-restore wrong length (%lu bytes)\n", v38, v39, v40, v41, v42, v43, v44, Length);
          goto LABEL_12;
        }
        if (*CFDataGetBytePtr(v26) == 1)
        {
          v35 = 1;
LABEL_13:
          IOObjectRelease(v17);
          CFRelease(v26);
          return v35;
        }
        v45 = *CFDataGetBytePtr(v26);
        v36 = "supports-mcu-restore is %u, the device does not support manta mcu restore time firmware update.\n";
      }
      else
      {
        v36 = "IORegistryEntryCreateCFProperty returned non CFDataRef for supports-mcu-restore property.\n";
      }
      ramrod_log_msg(v36, v28, v29, v30, v31, v32, v33, v34, v45);
LABEL_12:
      v35 = 0;
      goto LABEL_13;
    }
    ramrod_log_msg("manta-b ioregistry entry does not have supports-mcu-restore property, the device does not support manta mcu restore time firmware update.\n", v19, v20, v21, v22, v23, v24, v25, v45);
    IOObjectRelease(v17);
  }
  else
  {
    ramrod_log_msg("Could not find manta-b ioregistry entry, the device does not support manta mcu.\n", v10, v11, v12, v13, v14, v15, v16, v45);
  }
  return 0;
}

BOOL ramrod_should_update_manta_mcu(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!(_DWORD)a1)
    return ramrod_device_has_manta_mcu(a1, a2, a3, a4, a5, a6, a7, a8) != 0;
  ramrod_log_msg("Skipping checking manta mcu for booted update.\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_device_has_vinyl()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  unsigned int (*v14)(_QWORD, uint64_t *);
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;

  v24 = 0;
  v25 = 0;
  if (!ramrod_device_has_baseband())
    return 0;
  ramrod_log_msg("opening %s\n", v0, v1, v2, v3, v4, v5, v6, (char)"/usr/lib/updaters/libVinylUpdater.dylib");
  v7 = dlopen("/usr/lib/updaters/libVinylUpdater.dylib", 261);
  if (!v7)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v16, v17, v18, v19, v20, v21, v22, (char)"/usr/lib/updaters/libVinylUpdater.dylib");
    return 0;
  }
  v12 = ramrod_copy_updater_functions(v7, "Vinyl", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v8, v9, v10, v11);
  v13 = v25;
  if (!v12)
  {
    v15 = 0;
    if (!v25)
      return v15;
    goto LABEL_6;
  }
  v14 = (unsigned int (*)(_QWORD, uint64_t *))*((_QWORD *)v25 + 1);
  if (!v14)
  {
    v15 = 0;
    goto LABEL_6;
  }
  v15 = v14(0, &v24) == 0;
  v13 = v25;
  if (v25)
LABEL_6:
    free(v13);
  return v15;
}

BOOL ramrod_should_update_vinyl(int a1)
{
  return !a1 && ramrod_device_has_vinyl();
}

void sub_100015A10()
{
  if ((ramrod_should_do_legacy_restored_behaviors() & 1) == 0 && qword_10002E648 != -1)
    dispatch_once(&qword_10002E648, &stru_100025540);
}

void sub_100015A50(id a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  char v11;

  for (i = 0; i != 72; i += 6)
  {
    if (CFEqual(off_10002E348[i + 1], CFSTR("update_rose")))
    {
      v9 = os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate");
      if (v9)
        v10 = "ramrod_update running in limited environment\n";
      else
        v10 = "ramrod_update running in normal env\n";
      ramrod_log_msg(v10, v2, v3, v4, v5, v6, v7, v8, v11);
      if (v9)
        BYTE1(off_10002E348[i + 4]) = 1;
    }
  }
}

void sub_100015CC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045B4((void *)&_mh_execute_header, a2, a3, "RSD Listener error description: %s", a5, a6, a7, a8, 2u);
  sub_1000045DC();
}

void sub_100015D24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "RSD Listener received an error", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100015D50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045B4((void *)&_mh_execute_header, a2, a3, "RSD Peer error description: %s", a5, a6, a7, a8, 2u);
  sub_1000045DC();
}

void sub_100015DB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "RSD Peer received an error", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100015DE0()
{
  uint64_t v0;

  v0 = sub_100004600();
  _os_crash(v0);
  __break(1u);
}

void sub_100015DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "request command missing", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100015E20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045B4((void *)&_mh_execute_header, a1, a3, "IORegistryEntryFromPath failed to find path: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000045DC();
}

void sub_100015E90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045E4((void *)&_mh_execute_header, a2, a3, "IORegistryEntrySetCFProperty failed: %d", a5, a6, a7, a8, 0);
  sub_1000045D4();
}

void sub_100015EF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "Unable to copy AP nonce", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100015F20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "Unable to copy SEP nonce", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100015F4C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045B4((void *)&_mh_execute_header, a2, a3, "Failed to get the preflight info with error: %{public}@", a5, a6, a7, a8, 2u);
  sub_1000045DC();
}

void sub_100015FB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045B4((void *)&_mh_execute_header, a2, a3, "Unsupported command: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000045DC();
}

void sub_100016018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "Bogus request: client doesn't expect reply", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100016044()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000045F4();
  sub_1000045C4((void *)&_mh_execute_header, v0, v1, "language argument missing", v2, v3, v4, v5, v6);
  sub_1000045D4();
}

void sub_100016070(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000045B4((void *)&_mh_execute_header, a1, a3, "%s: failed to extract xpc reply dictionary. Likely xpc_dictionary_create_reply() already extracted one. Likely programmer error", a5, a6, a7, a8, 2u);
  sub_1000045DC();
}

void sub_1000160E0(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "Failed to reboot the device: %{errno}d", (uint8_t *)v3, 8u);
  sub_1000045DC();
}

void sub_100016168(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000080B4())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_10000809C(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10001620C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000080B4())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_10000809C(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10001629C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100008690(a1, a2);
  sub_1000080B4();
  sub_100008674();
  v7 = sub_10000809C(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10001632C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100008690(a1, a2);
  sub_1000080B4();
  sub_100008674();
  v6 = sub_10000809C(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000086A8(v6);
  __break(1u);
}

void sub_1000163A0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100008690(a1, a2);
  sub_1000080B4();
  sub_100008674();
  v7 = sub_10000809C(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100016430(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100008690(a1, a2);
  sub_1000080B4();
  sub_100008674();
  v6 = sub_10000809C(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000086A8(v6);
  __break(1u);
}

void sub_1000164A4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000080B4();
  sub_100008674();
  v7 = sub_10000809C(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10001653C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000080B4();
  sub_100008674();
  v7 = sub_10000809C(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000165C0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000080B4();
  sub_100008674();
  v7 = sub_10000809C(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

id objc_msgSend_IOMatchingPropertyTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IOMatchingPropertyTable");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__commitHeader_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commitHeader:withError:");
}

id objc_msgSend__copyIBICFromPath_withOptions_intoArray_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyIBICFromPath:withOptions:intoArray:withError:");
}

id objc_msgSend__crossingRegionChangeBoundary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_crossingRegionChangeBoundary");
}

id objc_msgSend__encodeAndWriteFirmware_toWriter_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encodeAndWriteFirmware:toWriter:withError:");
}

id objc_msgSend__encodeAndWriteIMG3Data_isLLB_isTicket_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encodeAndWriteIMG3Data:isLLB:isTicket:withError:");
}

id objc_msgSend__encodeFirmware_withRestoreInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encodeFirmware:withRestoreInfo:");
}

id objc_msgSend__findFirmwareInfoEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findFirmwareInfoEntry");
}

id objc_msgSend__getSFRManifestHashForPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSFRManifestHashForPayload:");
}

id objc_msgSend__headerMatchesBootSFRManifestHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_headerMatchesBootSFRManifestHash:");
}

id objc_msgSend__loadRegionLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadRegionLayout:");
}

id objc_msgSend__maxExtendedRegionSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maxExtendedRegionSize");
}

id objc_msgSend__maxImageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maxImageSize");
}

id objc_msgSend__restoreInfoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreInfoDictionary");
}

id objc_msgSend__setupFileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupFileDescriptor");
}

id objc_msgSend__stitchFirmwareImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stitchFirmwareImage");
}

id objc_msgSend__updaterClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updaterClasses");
}

id objc_msgSend__usesExtendediBootRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_usesExtendediBootRegion");
}

id objc_msgSend__waitForDeviceNode_withTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_waitForDeviceNode:withTimeout:");
}

id objc_msgSend__writeBytes_atOffset_ofLength_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeBytes:atOffset:ofLength:withError:");
}

id objc_msgSend__writeFirmware_toHeader_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeFirmware:toHeader:withError:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_ans2Data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ans2Data");
}

id objc_msgSend_apNonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apNonce");
}

id objc_msgSend_apNonceSlotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apNonceSlotID");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendImage_snapID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendImage:snapID:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bootBlockImages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bootBlockImages");
}

id objc_msgSend_bumpGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bumpGeneration");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_checkpoint_closure_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkpoint_closure_context");
}

id objc_msgSend_compareTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compareTo:");
}

id objc_msgSend_computeHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeHash");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyFirmwareWithRestoreInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyFirmwareWithRestoreInfo:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePath");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eraseBytes_ofLength_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseBytes:ofLength:withError:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_findHeaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findHeaders");
}

id objc_msgSend_findPreparedHeader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findPreparedHeader");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finished");
}

id objc_msgSend_firmwareImages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareImages");
}

id objc_msgSend_firmwareWriter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareWriter");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_headerGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerGeneration");
}

id objc_msgSend_headerHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerHash");
}

id objc_msgSend_headerIsInvalid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerIsInvalid:");
}

id objc_msgSend_headerSignature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerSignature");
}

id objc_msgSend_headerVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerVersion");
}

id objc_msgSend_ibootData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ibootData");
}

id objc_msgSend_imageAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageAddress");
}

id objc_msgSend_increaseLengthBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increaseLengthBy:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithIOMedia_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIOMedia:");
}

id objc_msgSend_initWithIOService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIOService:");
}

id objc_msgSend_initWithIOServiceWriter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIOServiceWriter:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithServiceNamed_parent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceNamed:parent:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_invalidHeaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidHeaders");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAvailable");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isErase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isErase");
}

id objc_msgSend_isSingleStageBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSingleStageBoot");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_llbData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "llbData");
}

id objc_msgSend_llbWriter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "llbWriter");
}

id objc_msgSend_loadHeaderAtOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadHeaderAtOffset:");
}

id objc_msgSend_logoData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logoData");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_makeValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeValid");
}

id objc_msgSend_markHeaderAsInvalid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markHeaderAsInvalid:");
}

id objc_msgSend_matchedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchedService");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nodeDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nodeDescriptor");
}

id objc_msgSend_numberOfBytesRemainingInBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfBytesRemainingInBlock");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openService");
}

id objc_msgSend_packStructure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packStructure");
}

id objc_msgSend_preferredBlockSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredBlockSize");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_readDataAtOffset_ofLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataAtOffset:ofLength:");
}

id objc_msgSend_readDataAtOffset_ofLength_intoBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataAtOffset:ofLength:intoBuffer:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_requiresSEPInFW(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresSEPInFW");
}

id objc_msgSend_resetImages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetImages");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_secondaryPayloadOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryPayloadOffset");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnect");
}

id objc_msgSend_serviceWriter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWriter");
}

id objc_msgSend_setAns2Data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAns2Data:");
}

id objc_msgSend_setAsFirstGeneration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsFirstGeneration");
}

id objc_msgSend_setBootBlockImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBootBlockImages:");
}

id objc_msgSend_setCheckpoint_closure_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckpoint_closure_context:");
}

id objc_msgSend_setContextUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextUUID:");
}

id objc_msgSend_setDaliData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaliData:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setFirmwareImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirmwareImages:");
}

id objc_msgSend_setHeaderGeneration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderGeneration:");
}

id objc_msgSend_setHeaderHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderHash:");
}

id objc_msgSend_setHeaderReserved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderReserved:");
}

id objc_msgSend_setHeaderSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderSignature:");
}

id objc_msgSend_setHeaderVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderVersion:");
}

id objc_msgSend_setIbootData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIbootData:");
}

id objc_msgSend_setImageAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageAddress:");
}

id objc_msgSend_setIsErase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsErase:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLlbData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLlbData:");
}

id objc_msgSend_setLogoData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogoData:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setSecondaryPayloadOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryPayloadOffset:");
}

id objc_msgSend_setShouldCommit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCommit:");
}

id objc_msgSend_setStartLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartLocation:");
}

id objc_msgSend_setValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValid:");
}

id objc_msgSend_setWorkBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWorkBlock:");
}

id objc_msgSend_setWorkQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWorkQueue:");
}

id objc_msgSend_shouldCommit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCommit");
}

id objc_msgSend_spiDriverConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spiDriverConnect");
}

id objc_msgSend_startLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLocation");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_supportsAFUH(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsAFUH");
}

id objc_msgSend_supportsDualiBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDualiBoot");
}

id objc_msgSend_supportsPCIeNANDBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPCIeNANDBoot");
}

id objc_msgSend_supportsSlotIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSlotIDs");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemUptime");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updater(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updater");
}

id objc_msgSend_updaterWithIOService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updaterWithIOService:");
}

id objc_msgSend_usesAFUH(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usesAFUH");
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valid");
}

id objc_msgSend_validHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validHash");
}

id objc_msgSend_validHeaderSignature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validHeaderSignature");
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workBlock");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}

id objc_msgSend_writeBytes_ofLength_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytes:ofLength:withError:");
}

id objc_msgSend_writeData_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:withError:");
}

id objc_msgSend_writeFirmware_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFirmware:error:");
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writer");
}
