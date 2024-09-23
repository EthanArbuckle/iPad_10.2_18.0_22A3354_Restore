uint64_t start(int a1, char **a2)
{
  int v4;
  int *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;

  v10 = 0;
  while (1)
  {
    v4 = getopt_long(a1, a2, "dv", (const option *)&off_100004138, &v10);
    v5 = &dword_100008088;
    if (v4 == 100)
      goto LABEL_2;
    if (v4 != 118)
      break;
    v5 = &dword_10000808C;
LABEL_2:
    ++*v5;
  }
  if (v4 != -1)
  {
    fwrite("Usage: \tpkreporter [-d|--debug] [-v|--verbose]\n", 0x2FuLL, 1uLL, __stderrp);
    exit(2);
  }
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKHost defaultHost](PKHost, "defaultHost"));
  objc_msgSend(v7, "discoverPlugInsForAttributes:flags:found:", &__NSDictionary0__struct, 512, &stru_100004198);

  objc_autoreleasePoolPop(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v8, "run");

  return 0;
}

void sub_100002F88(id a1, NSSet *a2, NSError *a3)
{
  NSSet *v4;
  NSError *v5;
  void *v6;
  NSSet *v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  uint64_t v12;
  NSError *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uid_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  void *v59;
  uint64_t v60;
  char *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  _BYTE v78[28];
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v13 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v13, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v78 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Discovery of plugins fails: %{public}@", buf, 0xCu);

    }
    exit(1);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v7 = v4;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v8)
  {
    v15 = *(_QWORD *)v71;
    v16 = PKProtocolAttribute;
    do
    {
      v17 = 0;
      if ((unint64_t)v8 <= 1)
        v18 = 1;
      else
        v18 = (uint64_t)v8;
      do
      {
        if (*(_QWORD *)v71 != v15)
          objc_enumerationMutation(v7);
        v19 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "attributes"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v16));

        if (v21)
          v22 = (__CFString *)v21;
        else
          v22 = CFSTR("*Unknown*");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v22));
        if (!v23)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, v22);
        }
        objc_msgSend(v23, "addObject:", v19);

        ++v17;
      }
      while (v18 != v17);
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v8);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  v10 = 0;
  if (!v9)
  {
LABEL_4:

    v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      if (v10)
        v12 = 1 << (flsl((uint64_t)v10) - 1);
      else
        v12 = 0;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v78 = v10;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Total number of plugins: %ld (%ld)", buf, 0x16u);
    }

    if (v10)
      v53 = 1 << (flsl((uint64_t)v10) - 1);
    else
      v53 = 0;
    ADClientSetValueForScalarKey(CFSTR("com.apple.pluginkit.extensionsinstalled"), v53);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v54 = geteuid();
      v55 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v78 = v54;
      *(_WORD *)&v78[4] = 2048;
      *(_QWORD *)&v78[6] = v55;
      *(_WORD *)&v78[14] = 2048;
      *(_QWORD *)&v78[16] = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "(UID %d) Found %lu plugin types, %ld plugins", buf, 0x1Cu);
    }
    exit(0);
  }
  v56 = *(_QWORD *)v67;
LABEL_25:
  v24 = 0;
  if ((unint64_t)v9 <= 1)
    v25 = 1;
  else
    v25 = (uint64_t)v9;
  v57 = v25;
  while (1)
  {
    if (*(_QWORD *)v67 != v56)
      objc_enumerationMutation(obj);
    v60 = v24;
    v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v26, v56));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v78 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v61 = v10;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    v59 = v26;
    v30 = 0;
    v31 = 0;
    if (v29)
    {
      v32 = *(_QWORD *)v63;
      do
      {
        v33 = 0;
        if ((unint64_t)v29 <= 1)
          v34 = 1;
        else
          v34 = (uint64_t)v29;
        do
        {
          if (*(_QWORD *)v63 != v32)
            objc_enumerationMutation(v28);
          v35 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v33);
          if (objc_msgSend(v35, "userElection") == (id)1)
          {
            ++v30;
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
            v37 = objc_msgSend(v36, "hasPrefix:", CFSTR("com.apple."));

            v31 += v37 ^ 1;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
            v39 = objc_msgSend(v35, "userElection");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v78 = v38;
            *(_WORD *)&v78[8] = 2048;
            *(_QWORD *)&v78[10] = v39;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\t%@ - election: %ld", buf, 0x16u);

          }
          ++v33;
        }
        while (v34 != v33);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v29);
    }

    v40 = (uint64_t)objc_msgSend(v28, "count");
    v41 = objc_msgSend(v28, "count");
    v42 = v59;
    v43 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    if (v40)
    {
      v47 = 1 << (flsl(v40) - 1);
      if (v30)
      {
LABEL_58:
        v48 = 1 << (flsl(v30) - 1);
        if (!v31)
          goto LABEL_62;
        goto LABEL_59;
      }
    }
    else
    {
      v47 = 0;
      if (v30)
        goto LABEL_58;
    }
    v48 = 0;
    if (!v31)
    {
LABEL_62:
      v49 = 0;
      goto LABEL_63;
    }
LABEL_59:
    v49 = 1 << (flsl(v31) - 1);
LABEL_63:
    v50 = (uint64_t)v41 - v30;
    if (v41 == (id)v30)
    {
      v51 = 0;
    }
    else
    {
      v52 = flsl(v50);
      v50 = (uint64_t)v41 - v30;
      v51 = 1 << (v52 - 1);
    }
    *(_DWORD *)buf = 138414338;
    *(_QWORD *)v78 = v42;
    *(_WORD *)&v78[8] = 2048;
    *(_QWORD *)&v78[10] = v40;
    *(_WORD *)&v78[18] = 2048;
    *(_QWORD *)&v78[20] = v47;
    v79 = 2048;
    v80 = v30;
    v81 = 2048;
    v82 = v48;
    v83 = 2048;
    v84 = v31;
    v85 = 2048;
    v86 = v49;
    v87 = 2048;
    v88 = v50;
    v89 = 2048;
    v90 = v51;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "plugin type: %@: %ld (%ld) plugins; %ld (%ld) enabled; %ld (%ld) enabled 3rd party; %ld (%ld) disabled",
      buf,
      0x5Cu);
LABEL_48:

    if (v40)
      v40 = 1 << (flsl(v40) - 1);
    if (v30)
      v30 = 1 << (flsl(v30) - 1);
    v44 = v42;
    if (qword_100008090 != -1)
      dispatch_once(&qword_100008090, &stru_1000041D8);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100008098, "objectForKeyedSubscript:", v44));
    v46 = v45;
    if (v45)
    {
      ADClientSetValueForScalarKey(objc_msgSend(v45, "stringByAppendingString:", CFSTR(".extensionsinstalled")), v40);
      ADClientSetValueForScalarKey(objc_msgSend(v46, "stringByAppendingString:", CFSTR(".enabled")), v30);
    }

    v10 = &v61[(_QWORD)objc_msgSend(v28, "count")];
    v24 = v60 + 1;
    if (v60 + 1 == v57)
    {
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (!v9)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
}

void sub_10000374C(id a1)
{
  void *v1;

  v1 = (void *)qword_100008098;
  qword_100008098 = (uint64_t)&off_100004520;

}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_defaultHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultHost");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_discoverPlugInsForAttributes_flags_found_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverPlugInsForAttributes:flags:found:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_userElection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userElection");
}
