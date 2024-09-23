void sub_1000051C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v6 == (id)3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeviceClassesOfInterest:", v5);
  }
  else if (v6 == (id)2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBillingCountriesOfInterest:", v5);
  }
  else if (v6 == (id)1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocatedCountriesOfInterest:withGracePeriod:", v5, objc_msgSend(*(id *)(a1 + 40), "gracePeriodInSeconds"));
  }
  else
  {
    v7 = sub_10000C5FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[SulfurDomain status]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Unsupported input type passed in to SulfurDomain", (uint8_t *)&v9, 0xCu);
    }

  }
}

const char *sub_100005948(uint64_t a1)
{
  const char *result;
  uint64_t v2;

  switch(a1)
  {
    case 1:
      result = "OS_ELIGIBILITY_DOMAIN_LOTX";
      break;
    case 2:
      result = "OS_ELIGIBILITY_DOMAIN_HYDROGEN";
      break;
    case 3:
      result = "OS_ELIGIBILITY_DOMAIN_HELIUM";
      break;
    case 4:
      result = "OS_ELIGIBILITY_DOMAIN_LITHIUM";
      break;
    case 5:
      result = "OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
      break;
    case 6:
      result = "OS_ELIGIBILITY_DOMAIN_BORON";
      break;
    case 7:
      result = "OS_ELIGIBILITY_DOMAIN_CARBON";
      break;
    case 8:
      result = "OS_ELIGIBILITY_DOMAIN_NITROGEN";
      break;
    case 9:
      result = "OS_ELIGIBILITY_DOMAIN_OXYGEN";
      break;
    case 10:
      result = "OS_ELIGIBILITY_DOMAIN_FLUORINE";
      break;
    case 11:
      result = "OS_ELIGIBILITY_DOMAIN_NEON";
      break;
    case 12:
      result = "OS_ELIGIBILITY_DOMAIN_SODIUM";
      break;
    case 13:
      result = "OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
      break;
    case 14:
      result = "OS_ELIGIBILITY_DOMAIN_ALUMINUM";
      break;
    case 15:
      result = "OS_ELIGIBILITY_DOMAIN_SILICON";
      break;
    case 16:
      result = "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
      break;
    case 17:
      result = "OS_ELIGIBILITY_DOMAIN_SULFUR";
      break;
    case 18:
      result = "OS_ELIGIBILITY_DOMAIN_CHLORINE";
      break;
    case 19:
      result = "OS_ELIGIBILITY_DOMAIN_ARGON";
      break;
    case 20:
      result = "OS_ELIGIBILITY_DOMAIN_POTASSIUM";
      break;
    case 21:
      result = "OS_ELIGIBILITY_DOMAIN_CALCIUM";
      break;
    case 22:
      result = "OS_ELIGIBILITY_DOMAIN_SCANDIUM";
      break;
    case 23:
      result = "OS_ELIGIBILITY_DOMAIN_TITANIUM";
      break;
    case 24:
      result = "OS_ELIGIBILITY_DOMAIN_VANADIUM";
      break;
    case 25:
      result = "OS_ELIGIBILITY_DOMAIN_CHROMIUM";
      break;
    case 26:
      result = "OS_ELIGIBILITY_DOMAIN_MANGANESE";
      break;
    case 27:
      result = "OS_ELIGIBILITY_DOMAIN_IRON";
      break;
    case 28:
      result = "OS_ELIGIBILITY_DOMAIN_COBALT";
      break;
    case 29:
      result = "OS_ELIGIBILITY_DOMAIN_NICKEL";
      break;
    case 30:
      result = "OS_ELIGIBILITY_DOMAIN_COPPER";
      break;
    case 31:
      result = "OS_ELIGIBILITY_DOMAIN_ZINC";
      break;
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
LABEL_5:
      result = 0;
      break;
    case 37:
      result = "OS_ELIGIBILITY_DOMAIN_KRYPTON";
      break;
    default:
      v2 = a1 - 120;
      result = "OS_ELIGIBILITY_DOMAIN_TEST";
      switch(v2)
      {
        case 0:
          return result;
        case 1:
          result = "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
          break;
        case 2:
          result = "OS_ELIGIBILITY_DOMAIN_GREYMATTER";
          break;
        case 3:
          result = "OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
          break;
        case 4:
          result = "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
          break;
        case 5:
          result = "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
          break;
        default:
          goto LABEL_5;
      }
      break;
  }
  return result;
}

char *sub_100005B5C()
{
  NSObject *v0;
  char *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  const char *v6;

  v2 = 0;
  if (asprintf(&v2, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    v0 = sub_10000C5FC();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v4 = "copy_eligibility_domain_public_answer_plist_path";
      v5 = 2080;
      v6 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  return v2;
}

void sub_100005F94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v6 == (id)3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeviceClassesOfInterest:", v5);
  }
  else if (v6 == (id)2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBillingCountriesOfInterest:", v5);
  }
  else if (v6 == (id)1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocatedCountriesOfInterest:withGracePeriod:", v5, objc_msgSend(*(id *)(a1 + 40), "gracePeriodInSeconds"));
  }
  else
  {
    v7 = sub_10000C5FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[PhosphorusDomain status]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Unsupported input type passed in to PhosphorusDomain", (uint8_t *)&v9, 0xCu);
    }

  }
}

void sub_10000A514(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void sub_10000A5E8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10003F3C0;
  qword_10003F3C0 = (uint64_t)v1;

}

void sub_10000C114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v6 == (id)3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeviceClassesOfInterest:", v5);
  }
  else if (v6 == (id)2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBillingCountriesOfInterest:", v5);
  }
  else if (v6 == (id)1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocatedCountriesOfInterest:withGracePeriod:", v5, objc_msgSend(*(id *)(a1 + 40), "gracePeriodInSeconds"));
  }
  else
  {
    v7 = sub_10000C5FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[KryptonDomain status]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Unsupported input type passed in to KryptonDomain", (uint8_t *)&v9, 0xCu);
    }

  }
}

char *sub_10000C3D4(unint64_t a1)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;

  if (a1 < 0xD)
    return (&off_100030A40)[a1];
  v3 = sub_10000C5FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "eligibility_input_to_str";
    v7 = 2048;
    v8 = a1;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Unsupported input type: %llu", (uint8_t *)&v5, 0x16u);
  }

  return 0;
}

id sub_10000C4A8(unint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  unint64_t v9;

  if (a1 >= 5)
  {
    v3 = sub_10000C5FC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "eligibility_answer_to_str";
      v8 = 2048;
      v9 = a1;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Unsupported answer type: %llu", buf, 0x16u);
    }

    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %llu>"), a1));
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_100030A18)[a1]));
  }
  return v2;
}

id sub_10000C5A4(unint64_t a1)
{
  void *v2;

  if (sub_10000C3D4(a1))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %llu>"), a1));
  return v2;
}

id sub_10000C5FC()
{
  if (qword_10003F3D8 != -1)
    dispatch_once(&qword_10003F3D8, &stru_100030B00);
  return (id)qword_10003F3D0;
}

void sub_10000C63C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.os_eligibility", "daemon");
  v2 = (void *)qword_10003F3D0;
  qword_10003F3D0 = (uint64_t)v1;

}

void start()
{
  void *v0;
  id v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  NSObject *v9;
  xpc_connection_t mach_service;
  id v11;
  NSObject *v12;
  _xpc_connection_s *v13;
  _QWORD handler[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v0 = objc_autoreleasePoolPush();
  v1 = sub_10000C5FC();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "main";
    v18 = 2080;
    v19 = "122.0.2";
    v20 = 2080;
    v21 = "Aug  3 2024";
    v22 = 2080;
    v23 = "11:08:35";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: eligibilityd (%s) built at %s %s started", buf, 0x2Au);
  }

  v3 = dispatch_workloop_create("com.apple.eligibility.xpc_workloop");
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_create_with_target_V2("com.apple.eligibility.xpc_handler", v5, v3);

  sub_1000159C8(v6, &stru_100030B20);
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = dispatch_queue_create("com.apple.eligibility.notifications", v8);

  xpc_set_event_stream_handler("com.apple.notifyd.matching", v9, &stru_100030B60);
  mach_service = xpc_connection_create_mach_service("com.apple.eligibilityd", v6, 1uLL);
  if (!mach_service)
  {
    v11 = sub_10000C5FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "main";
      v18 = 2080;
      v19 = "com.apple.eligibilityd";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: Unable to start xpc service %s", buf, 0x16u);
    }

    exit(1);
  }
  v13 = mach_service;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000C894;
  handler[3] = &unk_100030B88;
  v15 = v3;
  xpc_connection_set_event_handler(v13, handler);
  xpc_connection_activate(v13);

  dispatch_main();
}

void sub_10000C894(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  dispatch_source_t v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD handler[4];
  _xpc_connection_s *v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (_xpc_connection_s *)v3;
  v6 = v4;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(v5, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000CA08;
    handler[3] = &unk_100030B88;
    v7 = v5;
    v16 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(v7);
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
    v10 = objc_msgSend(v9, "isMemoryConstrainedDevice");

    if (v10)
    {
      v11 = qword_10003F3E0;
      if (!qword_10003F3E0)
      {
        v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
        v13 = (void *)qword_10003F3E0;
        qword_10003F3E0 = (uint64_t)v12;

        dispatch_source_set_event_handler((dispatch_source_t)qword_10003F3E0, &stru_100030BA8);
        v11 = qword_10003F3E0;
      }
      v14 = dispatch_time(0, 30000000000);
      dispatch_source_set_timer(v11, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_activate((dispatch_object_t)qword_10003F3E0);
    }

  }
}

void sub_10000CA08(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  id v5;
  __int128 v6;
  uint64_t pid;
  int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  char *v14;
  id v15;
  NSObject *v16;
  NSObject *reply;
  NSObject *v18;
  NSObject *v19;
  id v20;
  const char *string;
  id v22;
  NSObject *v23;
  uint64_t uint64;
  id v25;
  id v26;
  uint64_t v27;
  xpc_object_t value;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  char v34;
  void *v35;
  id v36;
  int64_t v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  xpc_object_t dictionary;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  char v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  xpc_object_t v63;
  void *v64;
  void *v65;
  char v66;
  unsigned __int8 v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  unsigned int v77;
  id v78;
  _BOOL8 v79;
  void *v80;
  unsigned int v81;
  id v82;
  id v83;
  NSObject *v84;
  const char *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  NSObject *v95;
  const char *v96;
  NSObject *v97;
  uint32_t v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  NSObject *v103;
  id v104;
  void *v105;
  unsigned int v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  unsigned __int8 v114;
  id v115;
  NSObject *v116;
  id v117;
  const char *v118;
  id v119;
  NSObject *v120;
  void *v121;
  unsigned __int8 v122;
  NSObject *v123;
  void *v124;
  id obj;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE buffer[4096];

  v3 = a2;
  v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  v5 = v3;
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  v127 = v6;
  v128 = v6;
  xpc_connection_get_audit_token(v4, &v127);
  pid = xpc_connection_get_pid(v4);
  v8 = proc_pidpath(pid, buffer, 0x1000u);
  if (v8 < 1)
  {
    v12 = CFSTR("(unknown)");
  }
  else
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringWithFileSystemRepresentation:length:", buffer, v9));

    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%d)"), v12, pid));

  v14 = xpc_copy_description(v5);
  v15 = sub_10000C5FC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 136315650;
    *(_QWORD *)&buffer[4] = "_connectionHandler";
    *(_WORD *)&buffer[12] = 2112;
    *(_QWORD *)&buffer[14] = v13;
    *(_WORD *)&buffer[22] = 2080;
    *(_QWORD *)&buffer[24] = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Message from %@: %s", buffer, 0x20u);
  }

  free(v14);
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    v20 = sub_10000C5FC();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
      *(_DWORD *)buffer = 136315394;
      *(_QWORD *)&buffer[4] = "_connectionHandler";
      *(_WORD *)&buffer[12] = 2080;
      *(_QWORD *)&buffer[14] = string;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Received xpc error: %s", buffer, 0x16u);
    }
    goto LABEL_89;
  }
  reply = xpc_dictionary_create_reply(v5);
  if (reply)
  {
    v18 = reply;
    if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary)
    {
      v19 = sub_10000C5FC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315138;
        *(_QWORD *)&buffer[4] = "eligibility_xpc_get_message_type";
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: xpc message type must be a dictionary", buffer, 0xCu);
      }
LABEL_88:
      xpc_connection_cancel(v4);
LABEL_89:

      goto LABEL_90;
    }
    uint64 = xpc_dictionary_get_uint64(v5, "eligibility_message_type");
    switch(uint64)
    {
      case 1uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.setInput"))
        {
          *(_OWORD *)buffer = v127;
          *(_OWORD *)&buffer[16] = v128;
          if ((sub_10000DDD8(buffer) & 1) != 0)
          {
            v25 = v13;
            v26 = v5;
            v27 = xpc_dictionary_get_uint64(v26, "input");
            value = xpc_dictionary_get_value(v26, "value");
            v29 = (void *)objc_claimAutoreleasedReturnValue(value);
            v30 = xpc_dictionary_get_uint64(v26, "status");

            if (v27 <= 9
              && ((0x216u >> v27) & 1) != 0
              && (!v29 || !v30)
              && (v29 || v30)
              && v30 <= 7
              && ((1 << v30) & 0xE1) != 0)
            {
              v121 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
              *(_QWORD *)buffer = 0;
              v122 = objc_msgSend(v121, "setInput:to:status:fromProcess:withError:", v27, v29, v30, v25, buffer);
              v33 = *(id *)buffer;

              v31 = v18;
              if ((v122 & 1) != 0)
              {
                v32 = v13;
                v35 = 0;
                v34 = 1;
                goto LABEL_27;
              }
              v32 = v13;
            }
            else
            {
              v31 = v18;
              v32 = v13;
              v33 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
            }
            v33 = objc_retainAutorelease(v33);
            v34 = 0;
            v35 = v33;
LABEL_27:

            v36 = v35;
            if ((v34 & 1) != 0)
            {
              v37 = 0;
              v13 = v32;
              goto LABEL_100;
            }
            v13 = v32;
            goto LABEL_103;
          }
        }
        v83 = sub_10000C5FC();
        v84 = objc_claimAutoreleasedReturnValue(v83);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          goto LABEL_87;
        *(_DWORD *)buffer = 136315394;
        *(_QWORD *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(_QWORD *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send set input message";
        goto LABEL_86;
      case 2uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.resetDomain"))
        {
          *(_OWORD *)buffer = v127;
          *(_OWORD *)&buffer[16] = v128;
          if ((sub_10000DDD8(buffer) & 1) != 0)
          {
            v126 = 0;
            v38 = xpc_dictionary_get_uint64(v5, "domain");
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
            v40 = objc_msgSend(v39, "resetDomain:withError:", v38, &v126);

            goto LABEL_43;
          }
        }
        v86 = sub_10000C5FC();
        v84 = objc_claimAutoreleasedReturnValue(v86);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          goto LABEL_87;
        *(_DWORD *)buffer = 136315394;
        *(_QWORD *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(_QWORD *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send reset domain message";
        goto LABEL_86;
      case 3uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.forceDomain")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000DDD8(buffer) & 1) == 0))
        {
          v87 = sub_10000C5FC();
          v84 = objc_claimAutoreleasedReturnValue(v87);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            goto LABEL_87;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(_QWORD *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send force domain message";
          goto LABEL_86;
        }
        v41 = v5;
        v42 = xpc_dictionary_get_uint64(v41, "domain");
        v43 = xpc_dictionary_get_uint64(v41, "answer");
        dictionary = xpc_dictionary_get_dictionary(v41, "context");
        v45 = (void *)objc_claimAutoreleasedReturnValue(dictionary);

        if (v43 - 2 >= 3)
        {
          v49 = v18;
          v50 = v13;
          v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        }
        else
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
          *(_QWORD *)buffer = 0;
          v47 = objc_msgSend(v46, "forceDomainAnswer:answer:context:withError:", v42, v43, v45, buffer);
          v48 = *(id *)buffer;

          v49 = v18;
          if ((v47 & 1) != 0)
          {
            v50 = v13;
            v51 = 0;
            v52 = 1;
            goto LABEL_138;
          }
          v50 = v13;
        }
        v48 = objc_retainAutorelease(v48);
        v52 = 0;
        v51 = v48;
LABEL_138:

        v36 = v51;
        if ((v52 & 1) != 0)
        {
          v37 = 0;
          v13 = v50;
          v18 = v49;
          goto LABEL_135;
        }
        v13 = v50;
        v18 = v49;
        goto LABEL_108;
      case 4uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.internalState"))
        {
          v126 = 0;
          v53 = v18;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
          v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "internalStateWithError:", &v126));
          v56 = (void *)v55;
          if (!v55)
            goto LABEL_55;
          v57 = (void *)_CFXPCCreateXPCObjectFromCFObject(v55);
          v58 = "internalStateDictionary";
          goto LABEL_54;
        }
        v91 = sub_10000C5FC();
        v84 = objc_claimAutoreleasedReturnValue(v91);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          goto LABEL_87;
        *(_DWORD *)buffer = 136315394;
        *(_QWORD *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(_QWORD *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send internal state message";
        goto LABEL_86;
      case 5uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.resetAllDomains")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000DDD8(buffer) & 1) == 0))
        {
          v88 = sub_10000C5FC();
          v84 = objc_claimAutoreleasedReturnValue(v88);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            goto LABEL_87;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(_QWORD *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send reset all domains message";
          goto LABEL_86;
        }
        v126 = 0;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
        v40 = objc_msgSend(v59, "resetAllDomainsWithError:", &v126);

LABEL_43:
        v36 = v126;
        v37 = 0;
        if ((v40 & 1) == 0)
          goto LABEL_108;
        goto LABEL_135;
      case 6uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.forceDomainSet")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000DDD8(buffer) & 1) == 0))
        {
          v89 = sub_10000C5FC();
          v84 = objc_claimAutoreleasedReturnValue(v89);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            goto LABEL_87;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(_QWORD *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send force domain set message";
          goto LABEL_86;
        }
        v31 = v18;
        v60 = v5;
        v61 = xpc_dictionary_get_uint64(v60, "domainSet");
        v62 = xpc_dictionary_get_uint64(v60, "answer");
        v63 = xpc_dictionary_get_dictionary(v60, "context");
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

        if (v61 == 1 && v62 - 2 <= 2)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
          *(_QWORD *)buffer = 0;
          v66 = 1;
          v67 = objc_msgSend(v65, "forceDomainSetAnswers:answer:context:withError:", 1, v62, v64, buffer);
          v68 = *(id *)buffer;

          v69 = v13;
          if ((v67 & 1) != 0)
          {
            v70 = 0;
            goto LABEL_98;
          }
        }
        else
        {
          v69 = v13;
          v68 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        }
        v68 = objc_retainAutorelease(v68);
        v66 = 0;
        v70 = v68;
LABEL_98:

        v36 = v70;
        if ((v66 & 1) != 0)
        {
          v37 = 0;
          v13 = v69;
LABEL_100:
          v18 = v31;
          goto LABEL_135;
        }
        v13 = v69;
LABEL_103:
        v18 = v31;
        goto LABEL_108;
      case 7uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.stateDump"))
        {
          v92 = sub_10000C5FC();
          v84 = objc_claimAutoreleasedReturnValue(v92);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            goto LABEL_87;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(_QWORD *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send state dump message";
          goto LABEL_86;
        }
        v126 = 0;
        v53 = v18;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
        v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stateDumpWithError:", &v126));
        v56 = (void *)v71;
        if (v71)
        {
          v57 = (void *)_CFXPCCreateXPCObjectFromCFObject(v71);
          v58 = "stateDumpDictionary";
LABEL_54:
          xpc_dictionary_set_value(v53, v58, v57);

        }
LABEL_55:

        v36 = v126;
        if (v56)
          goto LABEL_67;
        goto LABEL_108;
      case 8uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.dumpSysdiagnoseDataToDir"))
        {
          v72 = xpc_dictionary_get_string(v5, "dirPath");
          if (v72)
          {
            v73 = v72;
            v74 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v72, 1, 0));
            if (v74)
            {
              v75 = (void *)v74;
              v76 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
              *(_QWORD *)&v129 = 0;
              v77 = objc_msgSend(v76, "dumpToDirectory:withError:", v75, &v129);
              v78 = (id)v129;

              if (v77)
              {

                goto LABEL_66;
              }
              goto LABEL_106;
            }
            v100 = sub_10000C5FC();
            v95 = objc_claimAutoreleasedReturnValue(v100);
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
LABEL_105:

              v78 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
LABEL_106:
              v99 = v78;
              goto LABEL_107;
            }
            *(_DWORD *)buffer = 136315394;
            *(_QWORD *)&buffer[4] = "_dumpToDirectory";
            *(_WORD *)&buffer[12] = 2080;
            *(_QWORD *)&buffer[14] = v73;
            v96 = "%s: Failed to convert directory path %s to an NSURL, aborting.";
            v97 = v95;
            v98 = 22;
          }
          else
          {
            v94 = sub_10000C5FC();
            v95 = objc_claimAutoreleasedReturnValue(v94);
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              goto LABEL_105;
            *(_DWORD *)buffer = 136315138;
            *(_QWORD *)&buffer[4] = "_dumpToDirectory";
            v96 = "%s: File path read from xpc message was nil, aborting.";
            v97 = v95;
            v98 = 12;
          }
          _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, v96, buffer, v98);
          goto LABEL_105;
        }
        v93 = sub_10000C5FC();
        v84 = objc_claimAutoreleasedReturnValue(v93);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          goto LABEL_87;
        *(_DWORD *)buffer = 136315394;
        *(_QWORD *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(_QWORD *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send sysdiagnose dump message";
        goto LABEL_86;
      case 9uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DC80((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.setTestMode")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000DDD8(buffer) & 1) == 0))
        {
          v90 = sub_10000C5FC();
          v84 = objc_claimAutoreleasedReturnValue(v90);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            goto LABEL_87;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(_QWORD *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send set test mode message";
LABEL_86:
          _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, v85, buffer, 0x16u);
LABEL_87:

          goto LABEL_88;
        }
        v79 = xpc_dictionary_get_BOOL(v5, "enabled");
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
        *(_QWORD *)buffer = 0;
        v81 = objc_msgSend(v80, "setTestMode:withError:", v79, buffer);
        v82 = *(id *)buffer;

        if (v81)
        {

LABEL_66:
          v36 = 0;
LABEL_67:
          v37 = 0;
          goto LABEL_135;
        }
        v99 = v82;
LABEL_107:
        v101 = objc_retainAutorelease(v99);

        v36 = v101;
LABEL_108:
        v102 = sub_10000C5FC();
        v103 = objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buffer = 136315650;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2048;
          *(_QWORD *)&buffer[14] = uint64;
          *(_WORD *)&buffer[22] = 2112;
          *(_QWORD *)&buffer[24] = v36;
          _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%s: Message %llu failed: %@", buffer, 0x20u);
        }

        v104 = v36;
        v36 = v104;
        if (v104)
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "domain"));
          v106 = objc_msgSend(v105, "isEqualToString:", NSPOSIXErrorDomain);

          if (v106)
          {
            v107 = v36;
            goto LABEL_127;
          }
          v123 = v18;
          v124 = v13;
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "underlyingErrors"));
          v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, buffer, 16);
          if (!v108)
            goto LABEL_121;
          v109 = v108;
          v110 = *(_QWORD *)v130;
LABEL_115:
          v111 = 0;
          while (1)
          {
            if (*(_QWORD *)v130 != v110)
              objc_enumerationMutation(obj);
            v112 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v111);
            v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "domain"));
            v114 = objc_msgSend(v113, "isEqualToString:", NSPOSIXErrorDomain);

            if ((v114 & 1) != 0)
              break;
            if (v109 == (id)++v111)
            {
              v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, buffer, 16);
              if (!v109)
              {
LABEL_121:

                v18 = v123;
                v13 = v124;
                goto LABEL_122;
              }
              goto LABEL_115;
            }
          }
          v107 = v112;

          v18 = v123;
          v13 = v124;
          if (v107)
          {
LABEL_127:
            v37 = (int64_t)objc_msgSend(v107, "code");
LABEL_128:
            if (v36)
            {
              v117 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description")));
              v118 = (const char *)objc_msgSend(v117, "UTF8String");

              if (v118)
              {
                xpc_dictionary_set_string(v18, "errorDesc", v118);
              }
              else
              {
                v119 = sub_10000C5FC();
                v120 = objc_claimAutoreleasedReturnValue(v119);
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buffer = 136315394;
                  *(_QWORD *)&buffer[4] = "_connectionHandler";
                  *(_WORD *)&buffer[12] = 2112;
                  *(_QWORD *)&buffer[14] = v36;
                  _os_log_error_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%s: Received an error, but couldn't obtain its c-string description: %@", buffer, 0x16u);
                }

              }
            }

LABEL_135:
            xpc_dictionary_set_int64(v18, "errorNum", v37);
            xpc_connection_send_message(v4, v18);

            goto LABEL_91;
          }
        }
        else
        {
LABEL_122:

        }
        v115 = sub_10000C5FC();
        v116 = objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(_QWORD *)&buffer[14] = v36;
          _os_log_fault_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_FAULT, "%s: Unknown underlying POSIX error for - %@", buffer, 0x16u);
        }

        v107 = 0;
        v37 = 107;
        goto LABEL_128;
      default:
        goto LABEL_88;
    }
  }
  v22 = sub_10000C5FC();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buffer = 136315138;
    *(_QWORD *)&buffer[4] = "_connectionHandler";
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to construct reply message, canceling connection", buffer, 0xCu);
  }

  xpc_connection_cancel(v4);
LABEL_90:
  v36 = 0;
LABEL_91:

}

void sub_10000DBC8(id a1)
{
  id v1;
  NSObject *v2;
  int v3;
  const char *v4;

  if (!dispatch_source_testcancel((dispatch_source_t)qword_10003F3E0))
  {
    v1 = sub_10000C5FC();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "_tryExitWhenCleanOnWorkloop_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Running on a memory-constrained device; eager exiting when clean",
        (uint8_t *)&v3,
        0xCu);
    }

    xpc_transaction_exit_clean();
  }
}

BOOL sub_10000DC80(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  _BOOL8 value;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;

  v3 = (void *)xpc_copy_entitlement_for_token(a2, a1);
  v4 = v3;
  if (v3)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_BOOL)
    {
      value = xpc_BOOL_get_value(v4);
      goto LABEL_8;
    }
    v5 = sub_10000C5FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "_checkEntitlement";
      v13 = 2080;
      v14 = a2;
      v7 = "%s: Entitlement %s was the wrong type";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    v8 = sub_10000C5FC();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "_checkEntitlement";
      v13 = 2080;
      v14 = a2;
      v7 = "%s: Missing entitlement %s";
      goto LABEL_10;
    }
  }

  value = 0;
LABEL_8:

  return value;
}

uint64_t sub_10000DDD8(_OWORD *a1)
{
  void *v2;
  unsigned int v3;
  __int128 v4;
  id v6;
  NSObject *v7;
  _OWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  v3 = objc_msgSend(v2, "testMode");

  if (!v3)
    return 1;
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  if (sub_10000DC80((uint64_t)v8, (uint64_t)"com.apple.private.eligibilityd.setTestMode"))
    return 1;
  v6 = sub_10000C5FC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v8[0]) = 136315138;
    *(_QWORD *)((char *)v8 + 4) = "_checkTestModeEntitlement";
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Missing the com.apple.private.eligibilityd.setTestMode entitlement while test mode is enabled", (uint8_t *)v8, 0xCu);
  }

  return 0;
}

void sub_10000DED8(id a1, OS_xpc_object *a2)
{
  const char *string;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  v3 = sub_10000C5FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "main_block_invoke_2";
    v8 = 2080;
    v9 = string;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Got darwin notification %s", (uint8_t *)&v6, 0x16u);
  }

  if (!strcmp(string, "AppleLanguagePreferencesChangedNotification")
    || !strcmp(string, "AFLanguageCodeDidChangeDarwinNotification")
    || !strcmp(string, "com.apple.coregraphics.GUIConsoleSessionChanged"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
    objc_msgSend(v5, "recomputeAllDomainAnswers");

  }
}

void sub_10000DFF8(id a1)
{
  uint32_t v1;
  uint32_t v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  char *v8;
  id v9;
  void *v10;
  char *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  char *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;

  v1 = notify_post("com.apple.os-eligibility-domain.input-needed");
  if (v1)
  {
    v2 = v1;
    v3 = sub_10000C5FC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "_sendInputsNeededNotification";
      v19 = 1024;
      LODWORD(v20) = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Could not send inputs needed notification \"com.apple.os-eligibility-domain.input-needed\": %u", buf, 0x12u);
    }

  }
  v16 = 0;
  if (asprintf(&v16, "%s%s", "/", "/private/var/db/os_eligibility") == -1)
  {
    v5 = sub_10000C5FC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "copy_eligibility_domain_data_vault_directory_path";
      v19 = 2080;
      v20 = "/private/var/db/os_eligibility";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v6 = v16;
  sub_10000E304(v16, 1);
  free(v6);
  v16 = 0;
  if (asprintf(&v16, "%s%s", "/", "/private/var/db/eligibilityd") == -1)
  {
    v7 = sub_10000C5FC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "copy_eligibility_domain_daemon_directory_path";
      v19 = 2080;
      v20 = "/private/var/db/eligibilityd";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v8 = v16;
  sub_10000E304(v16, 0);
  free(v8);
  v16 = 0;
  v9 = sub_100018710(&v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v16;
  if (v10)
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches/NeverRestore/"), 1)));
    sub_10000E304((const char *)-[NSObject fileSystemRepresentation](v12, "fileSystemRepresentation"), 0);
  }
  else
  {
    v13 = sub_10000C5FC();
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "_createDirectories";
      v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to obtain the URL for data container: %@", buf, 0x16u);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
  objc_msgSend(v14, "recomputeAllDomainAnswers");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
  objc_msgSend(v15, "scheduleDailyRecompute");

}

void sub_10000E304(const char *a1, int a2)
{
  int v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  id v10;
  DIR *v11;
  DIR *v12;
  int v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  int *v18;
  char *v19;
  int *v20;
  char *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;

  if (mkdir(a1, 0x1EDu))
  {
    v4 = *__error();
    if (v4 == 17)
      goto LABEL_8;
    v5 = sub_10000C5FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315906;
    v23 = "_createDirectoryAtPath";
    v24 = 2080;
    v25 = a1;
    v26 = 2080;
    v27 = strerror(v4);
    v28 = 1024;
    v29 = v4;
    v7 = "%s: mkdir of path \"%s\" failed; this directory should already exist: %s(%d)";
    v8 = v6;
    v9 = 38;
    goto LABEL_18;
  }
  if (!a2)
    goto LABEL_8;
  v10 = sub_10000C5FC();
  v6 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "_createDirectoryAtPath";
    v24 = 2080;
    v25 = a1;
    v7 = "%s: Successfully created directory \"%s\"; this should already exist";
    v8 = v6;
    v9 = 22;
LABEL_18:
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
  }
LABEL_7:

LABEL_8:
  v11 = opendir(a1);
  if (v11)
  {
    v12 = v11;
    v13 = dirfd(v11);
    if (fcntl(v13, 64, 4))
    {
      v14 = sub_10000C5FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = __error();
        v19 = strerror(*v18);
        *(_DWORD *)buf = 136315650;
        v23 = "_setDataProtectionClassDForPath";
        v24 = 2080;
        v25 = a1;
        v26 = 2080;
        v27 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to setclass(PROTECTION_CLASS_D) on directory %s: %s", buf, 0x20u);
      }

    }
    closedir(v12);
  }
  else
  {
    v16 = sub_10000C5FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 136315650;
      v23 = "_setDataProtectionClassDForPath";
      v24 = 2080;
      v25 = a1;
      v26 = 2080;
      v27 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: opendir of %s failed: %s", buf, 0x20u);
    }

  }
}

void sub_10000EDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000EE80(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "testModeEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10000EEB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTestModeEnabled:", *(unsigned __int8 *)(a1 + 40));
}

void sub_10000EEBC(id a1)
{
  byte_10003F410 = MGGetSInt64Answer(CFSTR("DeviceMemorySize"), 0) < 1073741825;
}

void sub_10000EEF4(id a1)
{
  byte_10003F400 = os_variant_has_internal_content("com.apple.eligibilityd");
}

void sub_10000EF58(id a1)
{
  GlobalConfiguration *v1;
  void *v2;

  v1 = objc_alloc_init(GlobalConfiguration);
  v2 = (void *)qword_10003F3E8;
  qword_10003F3E8 = (uint64_t)v1;

}

void sub_100010CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001105C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001113C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001121C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000112FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000113DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000114BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001159C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001167C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001175C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001183C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001191C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000119FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001201C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000120FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000121DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000122BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001239C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001247C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001255C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001263C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001271C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000127FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000128DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000129BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014134(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[2];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;

  v11 = a2;
  v12 = a5;
  v13 = a6;
  if (a3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "path"));
    v15 = sub_10000C5FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "summary"));
        *(_DWORD *)buf = 136315650;
        v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        v41 = 2112;
        v42 = v33;
        v43 = 2112;
        v44 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: Config auto-asset %@ successfully locked at path:%@", buf, 0x20u);

      }
      v18 = sub_10000C5FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v12)
      {
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "summary"));
          *(_DWORD *)buf = 136315394;
          v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
          v41 = 2112;
          v42 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: Newer version in progress: %@", buf, 0x16u);

        }
      }
      else if (v20)
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: No newer version currently being downloaded", buf, 0xCu);
      }

      v38[0] = v14;
      v38[1] = CFSTR("Config.plist");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v26));

      v37 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v27, &v37));
      v25 = v37;
      if (v28)
      {
        objc_msgSend(*(id *)(a1 + 32), "_initDomainsWithConfigPlist:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](EligibilityEngine, "sharedInstance"));
        objc_msgSend(v29, "asyncUpdateAndRecomputeAllAnswers");

        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000145E0;
        v35[3] = &unk_100030D50;
        v30 = *(void **)(a1 + 40);
        v36 = *(id *)(a1 + 48);
        objc_msgSend(v30, "endLockUsage:completion:", CFSTR("lockEligibilityConfigOptions"), v35);

      }
      else
      {
        v31 = sub_10000C5FC();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
          *(_DWORD *)buf = 136315650;
          v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
          v41 = 2112;
          v42 = v34;
          v43 = 2112;
          v44 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s: Failed to open Mobile Asset configuration plist at %@: %@", buf, 0x20u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Sucessfully locked content, but the URL given by MobileAsset was nil", buf, 0xCu);
      }

      v24 = *(_QWORD *)(a1 + 48);
      v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, v25);
    }

  }
  else
  {
    v22 = sub_10000C5FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
      v41 = 2112;
      v42 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to get content lock on Mobile Asset: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_1000145E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = sub_10000C5FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "summary"));
      v11 = 136315650;
      v12 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to release lock on %@: %@", (uint8_t *)&v11, 0x20u);
LABEL_7:

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "summary"));
    v11 = 136315394;
    v12 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s: Successfully released lock on %@", (uint8_t *)&v11, 0x16u);
    goto LABEL_7;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10001475C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:", &stru_100030D70);
}

void sub_10001476C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  NSError *v8;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10000C5FC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[MobileAssetManager asyncRefetchMobileAsset]_block_invoke_2";
      v7 = 2112;
      v8 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Failed to fetch MobileAsset: %@", (uint8_t *)&v5, 0x16u);
    }

  }
}

void sub_100014830(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = sub_10000C5FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "summary"));
      v11 = 136315650;
      v12 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to register interest in Mobile Asset %@: %@", (uint8_t *)&v11, 0x20u);
LABEL_7:

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "summary"));
    v11 = 136315394;
    v12 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]_block_invoke";
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s: Sucessfully registered interest in Mobile Asset: %@", (uint8_t *)&v11, 0x16u);
    goto LABEL_7;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1000149AC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v2 = sub_10000C5FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: AUTO-ASSET-NOTIFICATION: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:", &stru_100030D00);
}

void sub_100014A74(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  NSError *v10;

  v2 = a2;
  v3 = sub_10000C5FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s: Done updating values with new MobileAsset", (uint8_t *)&v7, 0xCu);
  }

  if (v2)
  {
    v5 = sub_10000C5FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
      v9 = 2112;
      v10 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to update MobileAsset on update notification: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void sub_100014B94(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;

  v2 = sub_10000C5FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[MobileAssetManager init]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: Marking interest in MobileAsset", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014C84;
  v5[3] = &unk_100030CE0;
  v6 = v4;
  objc_msgSend(v6, "_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:", v5);

}

void sub_100014C84(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a2;
  v4 = sub_10000C5FC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[MobileAssetManager init]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to express interest in MobileAsset: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[MobileAssetManager init]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: Fetching MobileAsset", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:", &stru_100030CB8);
  }

}

void sub_100014DB4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  NSError *v8;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10000C5FC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[MobileAssetManager init]_block_invoke";
      v7 = 2112;
      v8 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Failed to fetch MobileAsset: %@", (uint8_t *)&v5, 0x16u);
    }

  }
}

id sub_100014E78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLotXAsset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setGreymatterAsset:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setXcodeLLMAsset:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setPodcastsTranscriptsAsset:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setSearchMarketplacesAsset:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setSwiftAssistAsset:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setHydrogenAsset:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setHeliumAsset:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "setLithiumAsset:", *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 32), "setBerylliumAsset:", *(_QWORD *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 32), "setBoronAsset:", *(_QWORD *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 32), "setCarbonAsset:", *(_QWORD *)(a1 + 128));
  objc_msgSend(*(id *)(a1 + 32), "setNitrogenAsset:", *(_QWORD *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 32), "setOxygenAsset:", *(_QWORD *)(a1 + 144));
  objc_msgSend(*(id *)(a1 + 32), "setFluorineAsset:", *(_QWORD *)(a1 + 152));
  objc_msgSend(*(id *)(a1 + 32), "setNeonAsset:", *(_QWORD *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 32), "setSodiumAsset:", *(_QWORD *)(a1 + 168));
  objc_msgSend(*(id *)(a1 + 32), "setMagnesiumAsset:", *(_QWORD *)(a1 + 176));
  objc_msgSend(*(id *)(a1 + 32), "setAluminumAsset:", *(_QWORD *)(a1 + 184));
  objc_msgSend(*(id *)(a1 + 32), "setSiliconAsset:", *(_QWORD *)(a1 + 192));
  objc_msgSend(*(id *)(a1 + 32), "setPhosphorusAsset:", *(_QWORD *)(a1 + 200));
  objc_msgSend(*(id *)(a1 + 32), "setSulfurAsset:", *(_QWORD *)(a1 + 208));
  objc_msgSend(*(id *)(a1 + 32), "setChlorineAsset:", *(_QWORD *)(a1 + 216));
  objc_msgSend(*(id *)(a1 + 32), "setArgonAsset:", *(_QWORD *)(a1 + 224));
  objc_msgSend(*(id *)(a1 + 32), "setPotassiumAsset:", *(_QWORD *)(a1 + 232));
  objc_msgSend(*(id *)(a1 + 32), "setScandiumAsset:", *(_QWORD *)(a1 + 240));
  objc_msgSend(*(id *)(a1 + 32), "setTitaniumAsset:", *(_QWORD *)(a1 + 248));
  objc_msgSend(*(id *)(a1 + 32), "setVanadiumAsset:", *(_QWORD *)(a1 + 256));
  objc_msgSend(*(id *)(a1 + 32), "setChromiumAsset:", *(_QWORD *)(a1 + 264));
  objc_msgSend(*(id *)(a1 + 32), "setManganeseAsset:", *(_QWORD *)(a1 + 272));
  objc_msgSend(*(id *)(a1 + 32), "setIronAsset:", *(_QWORD *)(a1 + 280));
  objc_msgSend(*(id *)(a1 + 32), "setCobaltAsset:", *(_QWORD *)(a1 + 288));
  objc_msgSend(*(id *)(a1 + 32), "setCopperAsset:", *(_QWORD *)(a1 + 296));
  objc_msgSend(*(id *)(a1 + 32), "setKryptonAsset:", *(_QWORD *)(a1 + 304));
  return objc_msgSend(*(id *)(a1 + 32), "setAssetVersion:", *(_QWORD *)(a1 + 312));
}

uint64_t sub_100015030(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015040(uint64_t a1)
{

}

void sub_100015048(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 280));
}

void sub_10001505C(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

void sub_100015070(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

void sub_100015084(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

void sub_100015098(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 248));
}

void sub_1000150AC(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 240));
}

void sub_1000150C0(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 232));
}

void sub_1000150D4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 224));
}

void sub_1000150E8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

void sub_1000150FC(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 208));
}

void sub_100015110(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 200));
}

void sub_100015124(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 192));
}

void sub_100015138(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

void sub_10001514C(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 176));
}

void sub_100015160(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
}

void sub_100015174(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

void sub_100015188(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

void sub_10001519C(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 144));
}

void sub_1000151B0(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

void sub_1000151C4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

void sub_1000151D8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

void sub_1000151EC(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

void sub_100015200(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

void sub_100015214(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

void sub_100015228(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

void sub_10001523C(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

void sub_100015250(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

void sub_100015264(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

void sub_100015278(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void sub_10001528C(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void sub_1000152A0(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void sub_1000152B4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void sub_1000152C8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void sub_1000152DC(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void sub_1000152F0(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

void sub_100015378(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10003F418;
  qword_10003F418 = (uint64_t)v1;

}

void sub_1000159C8(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015A78;
  v7[3] = &unk_100030DC0;
  v8 = (id)os_transaction_create("com.apple.eligibilityd.async-block");
  v9 = v3;
  v5 = v8;
  v6 = v3;
  dispatch_async(v4, v7);

}

void sub_100015A78(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_1000163A4(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if ((v3 != 0) != (v4 != 0))
      v6 = 0;
    else
      v6 = (uint64_t)objc_msgSend((id)v3, "isEqual:", v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t sub_100016424(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), a2) & 1) == 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

void sub_100017140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v15, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100036950, "objectForKeyedSubscript:", v15));
    v8 = v7;
    if (!v7)
    {
LABEL_8:

      goto LABEL_9;
    }
    v9 = objc_msgSend(v7, "unsignedIntValue");

    if (v9)
    {
      v10 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
      {
        v11 = objc_opt_class(NSString);
        if (sub_100016424(v5, v11))
        {
          v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
          if (v12)
          {
            v8 = (void *)v12;
            v13 = *(void **)(a1 + 32);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v14);

            goto LABEL_8;
          }
        }
      }
    }
  }
LABEL_9:

}

id sub_100018710(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t path;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t last_error;
  void *v12;
  id v13;
  NSObject *v14;
  NSError *v15;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;

  v2 = container_query_create();
  v3 = v2;
  if (!v2)
  {
    v8 = sub_10000C5FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315138;
      v19 = "OEURLForContainerWithError";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to create query for container", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_7;
  }
  container_query_set_class(v2, 12);
  v4 = xpc_string_create("com.apple.eligibilityd");
  container_query_set_identifiers(v3, v4);

  container_query_set_persona_unique_string(v3, CONTAINER_PERSONA_PRIMARY);
  container_query_operation_set_flags(v3, 0x100000003);
  if (container_query_get_single_result(v3))
  {
    path = container_get_path();
    if (path)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", path));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 1));
LABEL_8:
      v10 = 0;
      goto LABEL_12;
    }
    v17 = sub_10000C5FC();
    v9 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "OEURLForContainerWithError";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to read path from returned container", (uint8_t *)&v18, 0xCu);
    }
LABEL_7:

    v6 = 0;
    v7 = 0;
    goto LABEL_8;
  }
  last_error = container_query_get_last_error(v3);
  v12 = (void *)container_error_copy_unlocalized_description();
  v13 = sub_10000C5FC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "OEURLForContainerWithError";
    v20 = 2080;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Failed to query container manager: %s", (uint8_t *)&v18, 0x16u);
  }

  free(v12);
  v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, (int)container_error_get_posix_errno(last_error), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v6 = 0;
  v7 = 0;
LABEL_12:
  container_query_free(v3);
  if (a1 && !v7)
    *a1 = objc_retainAutorelease(v10);

  return v7;
}

void sub_10001AA3C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10001B25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001BA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001BBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001BED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001CA5C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleRecompute:", a2);
}

void sub_10001CA68(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  v2 = sub_10000C5FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[EligibilityEngine _onQueue_handleRecompute:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s: Expiration handler called for %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

id sub_10001CB34(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domains", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "updateParameters");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_recomputeAllDomainAnswers");
}

void sub_10001CC40(uint64_t a1)
{
  void *v2;
  void *v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  _QWORD v14[4];
  NSMutableDictionary *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "debugDictionary"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("OS_ELIGIBILITY_STATE_DUMP_INPUTS"));

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "domains"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001CDF0;
  v14[3] = &unk_100030EA8;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);

  v6 = -[NSMutableDictionary copy](v13, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("OS_ELIGIBILITY_STATE_DUMP_DOMAINS"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eligibilityOverrides"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("OS_ELIGIBILITY_STATE_DUMP_OVERRIDES"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "debugDescription"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("OS_ELIGIBILITY_STATE_DUMP_GLOBAL_STATE"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "debugDescription"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, CFSTR("OS_ELIGIBILITY_STATE_DUMP_MOBILE_ASSET"));

}

void sub_10001CDF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void sub_10001CE50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInputValue:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("OS_ELIGIBILITY_INTERNAL_STATE_COUNTRY_LOCATION"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "domains", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = (uint64_t)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasActiveGracePeriod") & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v8 = (uint64_t)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("OS_ELIGIBILITY_INTERNAL_STATE_GRACE_PERIOD_IN_EFFECT"));

}

uint64_t sub_10001CFF8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001D008(uint64_t a1)
{

}

void sub_10001D010(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  unint64_t v24;
  __int128 v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domains"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v28;
    *(_QWORD *)&v5 = 136315650;
    v25 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v10 = (unint64_t)objc_msgSend(v9, "domain", v25);
        v11 = v10;
        v12 = *(_QWORD *)(a1 + 64);
        if (v12 == 1)
        {
          if (v10 - 1 < 0x14
            || (v10 <= 0x25 ? (v13 = ((1 << v10) & 0x2007C00000) == 0) : (v13 = 1),
                !v13 || (v10 - 120 <= 4 ? (v14 = ((1 << (v10 - 120)) & 0x13) == 0) : (v14 = 1), !v14)))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eligibilityOverrides"));
            objc_msgSend(v15, "forceDomain:answer:context:", objc_msgSend(v9, "domain"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsToSend"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainChangeNotificationName"));
            objc_msgSend(v16, "addObject:", v17);

          }
        }
        else
        {
          v18 = sub_10000C5FC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v25;
            v33 = "eligibility_domain_in_domain_set";
            v34 = 2048;
            v35 = v11;
            v36 = 2048;
            v37 = v12;
            _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s: Checking if a domain %llu is in unknown domain set %llu", buf, 0x20u);
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  v19 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v20 + 40);
  v21 = objc_msgSend(v19, "_onQueue_saveDomainsWithError:", &obj);
  objc_storeStrong((id *)(v20 + 40), obj);
  if ((v21 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v22 = sub_10000C5FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v33 = "-[EligibilityEngine forceDomainSetAnswers:answer:context:withError:]_block_invoke";
      v34 = 2112;
      v35 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
    }

  }
}

void sub_10001D324(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 64)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domains"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v2));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eligibilityOverrides"));
    objc_msgSend(v5, "forceDomain:answer:context:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));

    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v6, "_onQueue_saveDomainsWithError:", &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsToSend"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainChangeNotificationName"));
      objc_msgSend(v9, "addObject:", v10);

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      v16 = sub_10000C5FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v22 = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]_block_invoke";
        v23 = 2112;
        v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v11 = sub_10000C5FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 136315394;
      v22 = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]_block_invoke";
      v23 = 2048;
      v24 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Unknown domain: %llu", buf, 0x16u);
    }

    v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void sub_10001D588(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsToSend"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domains"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eligibilityOverrides"));
        objc_msgSend(v10, "resetAnswerForDomain:", objc_msgSend(v9, "domain"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainChangeNotificationName"));
        objc_msgSend(v2, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }

  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v13 + 40);
  v14 = objc_msgSend(v12, "_onQueue_saveDomainsWithError:", &obj);
  objc_storeStrong((id *)(v13 + 40), obj);
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.os-eligibility-domain.input-needed"));
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v15 = sub_10000C5FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v24 = "-[EligibilityEngine resetAllDomainsWithError:]_block_invoke";
      v25 = 2112;
      v26 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
    }

  }
}

void sub_10001D7C0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 56)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domains"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v2));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eligibilityOverrides"));
    objc_msgSend(v5, "resetAnswerForDomain:", *(_QWORD *)(a1 + 64));

    v6 = *(void **)(a1 + 32);
    v20 = 0;
    v7 = objc_msgSend(v6, "_onQueue_saveDomainsWithError:", &v20);
    v8 = v20;
    v9 = v20;
    if ((v7 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsToSend"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainChangeNotificationName"));
      objc_msgSend(v10, "addObject:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsToSend"));
      objc_msgSend(v12, "addObject:", CFSTR("com.apple.os-eligibility-domain.input-needed"));

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v17 = sub_10000C5FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[EligibilityEngine resetDomain:withError:]_block_invoke";
        v23 = 2112;
        v24 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
    }
  }
  else
  {
    v13 = sub_10000C5FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      v22 = "-[EligibilityEngine resetDomain:withError:]_block_invoke";
      v23 = 2048;
      v24 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unknown domain: %llu", buf, 0x16u);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(id *)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;
  }

}

void sub_10001DA3C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(v2, "setInput:withError:", v3, &v8);
  v5 = v8;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_recomputeAllDomainAnswers");
  }
  else
  {
    v6 = sub_10000C5FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Failed to set input value: %@", buf, 0x16u);
    }

  }
}

void sub_10001DB48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "answer");
  v13 = 0;
  v8 = objc_msgSend(v6, "computeWithError:", &v13);
  v9 = v13;
  if ((v8 & 1) == 0)
  {
    v12 = sub_10000C5FC();
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[EligibilityEngine _onQueue_recomputeAllDomainAnswers]_block_invoke";
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to compute eligibility for domain %@: %@", buf, 0x20u);
    }
    goto LABEL_6;
  }
  if (v7 != objc_msgSend(v6, "answer"))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsToSend"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domainChangeNotificationName"));
    -[NSObject addObject:](v10, "addObject:", v11);

LABEL_6:
  }

}

id sub_10001DCA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_recomputeAllDomainAnswers");
}

void sub_10001DCB0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = a2;
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 100, 0, &v16));
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    v15 = v7;
    v9 = objc_msgSend(v6, "writeToURL:options:error:", v5, 268435457, &v15);
    v10 = v15;

    if ((v9 & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_8;
    }
    v8 = v10;
  }
  v11 = sub_10000C5FC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    *(_DWORD *)buf = 136315650;
    v18 = "-[EligibilityEngine _onQueue_saveDomainAnswerOutputsWithError:]_block_invoke";
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to write answer plist %@: %@", buf, 0x20u);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(id *)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v8;
LABEL_8:

}

void sub_10001DE40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  char *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;

  v5 = a2;
  v6 = a3;
  v7 = (uint64_t)objc_msgSend(v6, "domain");
  if ((unint64_t)(v7 - 22) < 0x64)
    goto LABEL_2;
  if (v7 <= 20)
  {
    if ((unint64_t)(v7 - 1) >= 0x14)
      goto LABEL_16;
    goto LABEL_2;
  }
  if ((unint64_t)(v7 - 123) < 3)
  {
LABEL_2:
    v18 = 0;
    if (asprintf(&v18, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
    {
      v8 = sub_10000C5FC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "copy_eligibility_domain_answer_plist_path";
        v21 = 2080;
        v22 = "/private/var/db/os_eligibility/eligibility.plist";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
      }
    }
    v9 = v18;
    if (v18)
      goto LABEL_6;
    goto LABEL_16;
  }
  if (v7 == 21 || v7 == 122)
  {
    v9 = sub_100005B5C();
    if (v9)
    {
LABEL_6:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
      free(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11));

      if (!v12)
      {
        v13 = objc_opt_new(NSMutableDictionary);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v11);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_onQueue_finalEligibilityDictionaryForDomain:", v6));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v5);

      goto LABEL_19;
    }
  }
LABEL_16:
  v16 = sub_10000C5FC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[EligibilityEngine _onQueue_urlToDomainData]_block_invoke";
    v21 = 2112;
    v22 = (const char *)v6;
    _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s: Skipping domain %@ because it doesn't have a plist specified", buf, 0x16u);
  }

LABEL_19:
}

void sub_10001E0D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "domain");
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_finalEligibilityDictionaryForDomain:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("os_eligibility_answer_t")));
  v7 = *(void **)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

void sub_10001E1E8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10003F428;
  qword_10003F428 = (uint64_t)v1;

}

void sub_10001F168(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  CFOptionFlags v21;
  uint8_t buf[4];
  const char *v23;

  v21 = 0;
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), CFSTR("File A Bug"), CFSTR("No Thanks"), 0, &v21);
  if (!v21)
  {
    v2 = *(void **)(a1 + 56);
    v3 = *(id *)(a1 + 48);
    v4 = v2;
    v5 = objc_alloc_init((Class)NSURLComponents);
    objc_msgSend(v5, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v5, "setHost:", CFSTR("new"));
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ComponentName"), CFSTR("os_eligibility"));
    objc_msgSend(v6, "addObject:", v7);

    v8 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("all"));
    objc_msgSend(v6, "addObject:", v8);

    v9 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ComponentID"), CFSTR("1533410"));
    objc_msgSend(v6, "addObject:", v9);

    v10 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
    objc_msgSend(v6, "addObject:", v10);

    v11 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
    objc_msgSend(v6, "addObject:", v11);

    v12 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
    objc_msgSend(v6, "addObject:", v12);

    if (v3 && objc_msgSend(v3, "length"))
    {
      v13 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Title"), v3);
      objc_msgSend(v6, "addObject:", v13);

    }
    if (v4 && objc_msgSend(v4, "length"))
    {
      v14 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Description"), v4);
      objc_msgSend(v6, "addObject:", v14);

    }
    objc_msgSend(v5, "setQueryItems:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001F4EC;
      v19[3] = &unk_100030FE8;
      v20 = v15;
      objc_msgSend(v16, "openURL:configuration:completionHandler:", v20, 0, v19);

      v17 = v20;
    }
    else
    {
      v18 = sub_10000C5FC();
      v17 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "_ShowUserNoticeWithTapToRadarButton_block_invoke";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to construct TTR URL", buf, 0xCu);
      }
    }

  }
}

void sub_10001F4EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10000C5FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "_ShowUserNoticeWithTapToRadarButton_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to open url %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__computeInputStatusForSet_withObject_isInverted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computeInputStatusForSet:withObject:isInverted:");
}

id objc_msgSend__createDefaultDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDefaultDomains");
}

id objc_msgSend__createDefaultInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDefaultInputs");
}

id objc_msgSend__decodeObjectOfClasses_atURL_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decodeObjectOfClasses:atURL:withError:");
}

id objc_msgSend__deviceMinimiumRequiredConfidence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceMinimiumRequiredConfidence");
}

id objc_msgSend__initDomainsWithConfigPlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initDomainsWithConfigPlist:");
}

id objc_msgSend__initEnabledKeyWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initEnabledKeyWithDictionary:");
}

id objc_msgSend__interestedDataString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_interestedDataString");
}

id objc_msgSend__internal_doInit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_internal_doInit");
}

id objc_msgSend__isGreenTeaDeviceCapable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isGreenTeaDeviceCapable");
}

id objc_msgSend__loadDomainsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadDomainsWithError:");
}

id objc_msgSend__loadInputsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadInputsWithError:");
}

id objc_msgSend__loadOverridesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadOverridesWithError:");
}

id objc_msgSend__mgDeviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mgDeviceClass");
}

id objc_msgSend__mgDeviceRegionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mgDeviceRegionCode");
}

id objc_msgSend__mgSupportsGenerativeModelSystems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mgSupportsGenerativeModelSystems");
}

id objc_msgSend__onMobileAssetQueue_fetchMobileAssetContentWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:");
}

id objc_msgSend__onMobileAssetQueue_markInterestInMobileAssetWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:");
}

id objc_msgSend__onQueue_finalEligibilityDictionaryForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_finalEligibilityDictionaryForDomain:");
}

id objc_msgSend__onQueue_notifySADSupportFramework(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_notifySADSupportFramework");
}

id objc_msgSend__onQueue_recomputeAllDomainAnswers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_recomputeAllDomainAnswers");
}

id objc_msgSend__onQueue_saveDomainAnswerOutputsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_saveDomainAnswerOutputsWithError:");
}

id objc_msgSend__onQueue_saveDomainsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_saveDomainsWithError:");
}

id objc_msgSend__onQueue_sendNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_sendNotifications");
}

id objc_msgSend__onQueue_serializeInternalDomainStateToDiskWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_serializeInternalDomainStateToDiskWithError:");
}

id objc_msgSend__onQueue_serializeOverrideDataToDiskWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_serializeOverrideDataToDiskWithError:");
}

id objc_msgSend__onQueue_urlToDomainData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_urlToDomainData");
}

id objc_msgSend__parseConfidenceFromInputDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseConfidenceFromInputDict:");
}

id objc_msgSend__policiesForRawArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_policiesForRawArray:");
}

id objc_msgSend__saveInputsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveInputsWithError:");
}

id objc_msgSend__sendNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendNotification:");
}

id objc_msgSend__serializeObject_toURL_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serializeObject:toURL:withError:");
}

id objc_msgSend__supportedInputsString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportedInputsString");
}

id objc_msgSend_addContextForKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContextForKey:value:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_aluminumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aluminumAsset");
}

id objc_msgSend_answer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "answer");
}

id objc_msgSend_answerSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "answerSource");
}

id objc_msgSend_argonAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "argonAsset");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetVersion");
}

id objc_msgSend_asyncRefetchMobileAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asyncRefetchMobileAsset");
}

id objc_msgSend_asyncUpdateAndRecomputeAllAnswers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asyncUpdateAndRecomputeAllAnswers");
}

id objc_msgSend_berylliumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "berylliumAsset");
}

id objc_msgSend_billingCountriesOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "billingCountriesOfInterest");
}

id objc_msgSend_billingCountryCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "billingCountryCodes");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boronAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boronAsset");
}

id objc_msgSend_carbonAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carbonAsset");
}

id objc_msgSend_chinaCellularDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chinaCellularDevice");
}

id objc_msgSend_chlorineAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chlorineAsset");
}

id objc_msgSend_chromiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chromiumAsset");
}

id objc_msgSend_cobaltAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cobaltAsset");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_computeAnswerFromStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeAnswerFromStatus:");
}

id objc_msgSend_computeAnswerFromStatusWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeAnswerFromStatusWithError:");
}

id objc_msgSend_computeInputStatusForBillingCountryInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForBillingCountryInput:");
}

id objc_msgSend_computeInputStatusForChinaCellularInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForChinaCellularInput:");
}

id objc_msgSend_computeInputStatusForDeviceClassInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForDeviceClassInput:");
}

id objc_msgSend_computeInputStatusForDeviceLanguageInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForDeviceLanguageInput:");
}

id objc_msgSend_computeInputStatusForDeviceLocaleInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForDeviceLocaleInput:");
}

id objc_msgSend_computeInputStatusForDeviceRegionCodesInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForDeviceRegionCodesInput:");
}

id objc_msgSend_computeInputStatusForExternalBootDriveInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForExternalBootDriveInput:");
}

id objc_msgSend_computeInputStatusForGenerativeModelSystemInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForGenerativeModelSystemInput:");
}

id objc_msgSend_computeInputStatusForGreymatterQueueInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForGreymatterQueueInput:");
}

id objc_msgSend_computeInputStatusForInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForInput:");
}

id objc_msgSend_computeInputStatusForLocatedCountryInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForLocatedCountryInput:");
}

id objc_msgSend_computeInputStatusForSharediPadInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForSharediPadInput:");
}

id objc_msgSend_computeInputStatusForSiriLanguageInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInputStatusForSiriLanguageInput:");
}

id objc_msgSend_computeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeWithError:");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidence");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_copperAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copperAsset");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_countryCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCodes");
}

id objc_msgSend_currentUsername(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUsername");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_debugDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDictionary");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultAnswer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAnswer");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceClass");
}

id objc_msgSend_deviceClassesOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceClassesOfInterest");
}

id objc_msgSend_deviceLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLanguages");
}

id objc_msgSend_deviceLanguagesOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLanguagesOfInterest");
}

id objc_msgSend_deviceLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLocale");
}

id objc_msgSend_deviceLocalesOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLocalesOfInterest");
}

id objc_msgSend_deviceRegionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRegionCode");
}

id objc_msgSend_deviceRegionCodesOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRegionCodesOfInterest");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainChangeNotificationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainChangeNotificationName");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domains");
}

id objc_msgSend_dumpToDirectory_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpToDirectory:withError:");
}

id objc_msgSend_eligibilityInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eligibilityInputs");
}

id objc_msgSend_eligibilityOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eligibilityOverrides");
}

id objc_msgSend_enable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enable");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_endLockUsage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endLockUsage:completion:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_expectedCountryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedCountryCode");
}

id objc_msgSend_fallbackDeviceLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fallbackDeviceLocale");
}

id objc_msgSend_fallbackVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fallbackVersion");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fluorineAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fluorineAsset");
}

id objc_msgSend_forceDomain_answer_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDomain:answer:context:");
}

id objc_msgSend_forceDomainAnswer_answer_context_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDomainAnswer:answer:context:withError:");
}

id objc_msgSend_forceDomainSetAnswers_answer_context_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDomainSetAnswers:answer:context:withError:");
}

id objc_msgSend_gracePeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gracePeriodInSeconds");
}

id objc_msgSend_hasActiveGracePeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasActiveGracePeriod");
}

id objc_msgSend_hasExpired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasExpired");
}

id objc_msgSend_hasExternalBootDrive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasExternalBootDrive");
}

id objc_msgSend_hasInternalContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasInternalContent");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_heliumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heliumAsset");
}

id objc_msgSend_hydrogenAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hydrogenAsset");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initForAssetType_withAssetSpecifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForAssetType:withAssetSpecifier:");
}

id objc_msgSend_initForClientName_selectingAsset_completingFromQueue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForClientName:selectingAsset:completingFromQueue:error:");
}

id objc_msgSend_initForMobileAssetRootKey_withDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForMobileAssetRootKey:withDictionary:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initOnQueue_status_process_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initOnQueue:status:process:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAnswer_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAnswer:context:");
}

id objc_msgSend_initWithBillingCountry_status_process_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBillingCountry:status:process:");
}

id objc_msgSend_initWithCountryCodes_status_process_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCountryCodes:status:process:");
}

id objc_msgSend_initWithDeviceLocale_status_process_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceLocale:status:process:");
}

id objc_msgSend_initWithInputType_status_process_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInputType:status:process:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSeconds:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_interestInContent_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interestInContent:completion:");
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalQueue");
}

id objc_msgSend_internalStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalStateWithError:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_invertBillingCountries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertBillingCountries");
}

id objc_msgSend_invertLocales(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertLocales");
}

id objc_msgSend_invertLocatedCountries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertLocatedCountries");
}

id objc_msgSend_ironAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ironAsset");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInterestedInInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInterestedInInput:");
}

id objc_msgSend_isMemoryConstrainedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemoryConstrainedDevice");
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharedIPad");
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharediPad");
}

id objc_msgSend_kryptonAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kryptonAsset");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "language");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lithiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lithiumAsset");
}

id objc_msgSend_loadedTimeInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadedTimeInSeconds");
}

id objc_msgSend_locatedCountriesOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locatedCountriesOfInterest");
}

id objc_msgSend_locatedCountryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locatedCountryTimer");
}

id objc_msgSend_lockContent_withTimeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockContent:withTimeout:completion:");
}

id objc_msgSend_lotXAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lotXAsset");
}

id objc_msgSend_magnesiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magnesiumAsset");
}

id objc_msgSend_manganeseAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manganeseAsset");
}

id objc_msgSend_mobileAssetQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileAssetQueue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_neonAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "neonAsset");
}

id objc_msgSend_nitrogenAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nitrogenAsset");
}

id objc_msgSend_notificationsToSend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationsToSend");
}

id objc_msgSend_notifyRegistrationName_forAssetType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyRegistrationName:forAssetType:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForInputValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInputValue:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onGreymatterQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onGreymatterQueue");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_overrideMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideMap");
}

id objc_msgSend_overrideResultDictionaryForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideResultDictionaryForDomain:");
}

id objc_msgSend_oxygenAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oxygenAsset");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_phosphorusAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phosphorusAsset");
}

id objc_msgSend_podcastsTranscriptsAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastsTranscriptsAsset");
}

id objc_msgSend_policies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policies");
}

id objc_msgSend_potassiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "potassiumAsset");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_primaryLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryLanguage");
}

id objc_msgSend_queryHasExternalBootDrive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryHasExternalBootDrive");
}

id objc_msgSend_recomputeAllDomainAnswers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeAllDomainAnswers");
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regionCode");
}

id objc_msgSend_regionSKUs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regionSKUs");
}

id objc_msgSend_registerForMobileAssetUpdateNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForMobileAssetUpdateNotification");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetAllDomainsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAllDomainsWithError:");
}

id objc_msgSend_resetAnswerForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAnswerForDomain:");
}

id objc_msgSend_resetDomain_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetDomain:withError:");
}

id objc_msgSend_resetInputsOfInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetInputsOfInterest");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scandiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scandiumAsset");
}

id objc_msgSend_scheduleDailyRecompute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleDailyRecompute");
}

id objc_msgSend_searchMarketplacesAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchMarketplacesAsset");
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialize");
}

id objc_msgSend_setAluminumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAluminumAsset:");
}

id objc_msgSend_setAnswer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnswer:");
}

id objc_msgSend_setArgonAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArgonAsset:");
}

id objc_msgSend_setBerylliumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBerylliumAsset:");
}

id objc_msgSend_setBillingCountriesOfInterest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBillingCountriesOfInterest:");
}

id objc_msgSend_setBillingCountriesOfInterest_isInverted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBillingCountriesOfInterest:isInverted:");
}

id objc_msgSend_setBillingCountryCodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBillingCountryCodes:");
}

id objc_msgSend_setBoronAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoronAsset:");
}

id objc_msgSend_setCarbonAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarbonAsset:");
}

id objc_msgSend_setChinaCellularDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChinaCellularDevice:");
}

id objc_msgSend_setChlorineAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChlorineAsset:");
}

id objc_msgSend_setChromiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChromiumAsset:");
}

id objc_msgSend_setCobaltAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCobaltAsset:");
}

id objc_msgSend_setConfidence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfidence:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setCopperAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCopperAsset:");
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCountryCode:");
}

id objc_msgSend_setCountryCodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCountryCodes:");
}

id objc_msgSend_setDeviceClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceClass:");
}

id objc_msgSend_setDeviceClassesOfInterest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceClassesOfInterest:");
}

id objc_msgSend_setDeviceLanguagesOfInterest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLanguagesOfInterest:");
}

id objc_msgSend_setDeviceLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLocale:");
}

id objc_msgSend_setDeviceLocalesOfInterest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLocalesOfInterest:");
}

id objc_msgSend_setDeviceLocalesOfInterest_isInverted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLocalesOfInterest:isInverted:");
}

id objc_msgSend_setDeviceRegionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceRegionCode:");
}

id objc_msgSend_setDeviceRegionCodesOfInterest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceRegionCodesOfInterest:");
}

id objc_msgSend_setDeviceRegionInterest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceRegionInterest");
}

id objc_msgSend_setDurationWithSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDurationWithSeconds:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setFallbackVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFallbackVersion:");
}

id objc_msgSend_setFluorineAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFluorineAsset:");
}

id objc_msgSend_setGracePeriodInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGracePeriodInSeconds:");
}

id objc_msgSend_setGreymatterAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGreymatterAsset:");
}

id objc_msgSend_setHasExternalBootDrive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasExternalBootDrive:");
}

id objc_msgSend_setHeliumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeliumAsset:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHydrogenAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHydrogenAsset:");
}

id objc_msgSend_setInput_to_status_fromProcess_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInput:to:status:fromProcess:withError:");
}

id objc_msgSend_setInput_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInput:withError:");
}

id objc_msgSend_setInvertBillingCountries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvertBillingCountries:");
}

id objc_msgSend_setInvertLocales_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvertLocales:");
}

id objc_msgSend_setInvertLocatedCountries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvertLocatedCountries:");
}

id objc_msgSend_setIronAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIronAsset:");
}

id objc_msgSend_setKryptonAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKryptonAsset:");
}

id objc_msgSend_setLithiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLithiumAsset:");
}

id objc_msgSend_setLoadedTimeInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadedTimeInSeconds:");
}

id objc_msgSend_setLocatedCountriesOfInterest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocatedCountriesOfInterest:");
}

id objc_msgSend_setLocatedCountriesOfInterest_isInverted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocatedCountriesOfInterest:isInverted:");
}

id objc_msgSend_setLocatedCountriesOfInterest_withGracePeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocatedCountriesOfInterest:withGracePeriod:");
}

id objc_msgSend_setLocatedCountriesOfInterest_withGracePeriod_isInverted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocatedCountriesOfInterest:withGracePeriod:isInverted:");
}

id objc_msgSend_setLocatedCountryTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocatedCountryTimer:");
}

id objc_msgSend_setLotXAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLotXAsset:");
}

id objc_msgSend_setMagnesiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMagnesiumAsset:");
}

id objc_msgSend_setManganeseAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManganeseAsset:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeonAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeonAsset:");
}

id objc_msgSend_setNitrogenAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNitrogenAsset:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnGreymatterQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOnGreymatterQueue:");
}

id objc_msgSend_setOverrideMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideMap:");
}

id objc_msgSend_setOxygenAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOxygenAsset:");
}

id objc_msgSend_setPhosphorusAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhosphorusAsset:");
}

id objc_msgSend_setPodcastsTranscriptsAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPodcastsTranscriptsAsset:");
}

id objc_msgSend_setPolicies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPolicies:");
}

id objc_msgSend_setPotassiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPotassiumAsset:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRegionSKUs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegionSKUs:");
}

id objc_msgSend_setScandiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScandiumAsset:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSearchMarketplacesAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchMarketplacesAsset:");
}

id objc_msgSend_setSetTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetTime:");
}

id objc_msgSend_setSiliconAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiliconAsset:");
}

id objc_msgSend_setSodiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSodiumAsset:");
}

id objc_msgSend_setSulfurAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSulfurAsset:");
}

id objc_msgSend_setSupportedInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedInputs:");
}

id objc_msgSend_setSupportsGenerativeModelSystems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsGenerativeModelSystems:");
}

id objc_msgSend_setSwiftAssistAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwiftAssistAsset:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTaskExpiredWithRetryAfter_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:");
}

id objc_msgSend_setTestMode_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestMode:withError:");
}

id objc_msgSend_setTestModeQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestModeQueue:");
}

id objc_msgSend_setTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTime");
}

id objc_msgSend_setTimeStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStart:");
}

id objc_msgSend_setTitaniumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitaniumAsset:");
}

id objc_msgSend_setVanadiumAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVanadiumAsset:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXcodeLLMAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXcodeLLMAsset:");
}

id objc_msgSend_settingProccessName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingProccessName");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_siliconAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siliconAsset");
}

id objc_msgSend_sodiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sodiumAsset");
}

id objc_msgSend_stateDumpWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateDumpWithError:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_sulfurAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sulfurAsset");
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summary");
}

id objc_msgSend_supportedInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedInputs");
}

id objc_msgSend_supportsGenerativeModelSystems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsGenerativeModelSystems");
}

id objc_msgSend_swiftAssistAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swiftAssistAsset");
}

id objc_msgSend_systemLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLanguages");
}

id objc_msgSend_testMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testMode");
}

id objc_msgSend_testModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testModeEnabled");
}

id objc_msgSend_testModeQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testModeQueue");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeStart");
}

id objc_msgSend_titaniumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titaniumAsset");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingErrors");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateParameters");
}

id objc_msgSend_vanadiumAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vanadiumAsset");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xcodeLLMAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xcodeLLMAsset");
}
