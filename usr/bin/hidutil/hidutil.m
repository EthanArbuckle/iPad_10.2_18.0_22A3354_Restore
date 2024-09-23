uint64_t sub_100002660(int a1, char **a2)
{
  char *i;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __IOHIDEventSystemClient *v8;
  IOHIDManagerRef v9;
  IOHIDManagerRef v10;
  CFArrayRef v11;
  CFArrayRef v12;
  id v13;
  const __CFArray *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  CFSetRef v23;
  id v24;
  const __CFSet *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  for (i = 0; ; i = optarg)
  {
    while (1)
    {
      v5 = getopt_long(a1, a2, "hnm:", (const option *)&off_1000082B8, 0);
      if (v5 != 110)
        break;
      byte_10000C290 = 1;
    }
    if (v5 == -1)
      break;
    if (v5 != 109)
    {
      if (v5 == 104)
      {
        puts("\nList HID Event System services and devices\n\nUsage:\n\n  hidutil list [--ndjson] [ --matching <matching> ]\n\nFlags:\n\n  -n  --ndjson................print service/device information in ndjson format\n  -m  --matching..............Set matching services/devices\n                              Input can be either json style dictionary or common\n                              device string e.g. keyboard, mouse, digitizer.\n                                  Supported properties:\n                                      ProductID        - numeric value (decimal or hex)\n                                      VendorID         - numeric value (decimal or hex)\n                                      LocationID       - numeric value (decimal or hex)\n                                      PrimaryUsagePage - numeric value (decimal or hex)\n                                      PrimaryUsage     - numeric value (decimal or hex)\n"
          "                                      Transport        - string value\n"
          "                                      Product          - string value\n"
          "                                  For matching against generic properties, you will need to include\n"
          "                                  the \"IOPropertyMatch\" key (see example below).\n"
          "                                  Example strings:\n"
          "                                      'keyboard'\n"
          "                                      'digi'\n"
          "                                      '{\"ProductID\":0x8600,\"VendorID\":0x5ac}'\n"
          "                                      '[{\"ProductID\":0x8600},{\"PrimaryUsagePage\":1,\"PrimaryUsage\":6}]'\n"
          "                                      '{\"IOPropertyMatch\":{\"ReportInterval\":1000}}'\n"
          "\n"
          "Examples:\n"
          "\n"
          "  hidutil list\n"
          "  hidutil list --matching '{\"ProductID\":0x54c}'\n"
          "  hidutil list --matching '{\"ProductID\":0x54c,\"VendorID\":746}'");
        return 0;
      }
      return 1;
    }
  }
  v7 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 4, 0);
  if (v7)
  {
    v8 = (__IOHIDEventSystemClient *)v7;
    v9 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    if (v9)
    {
      v10 = v9;
      if (i)
      {
        if ((sub_100004544((uint64_t)v8, (uint64_t)i) & 1) == 0)
          goto LABEL_29;
      }
      else
      {
        IOHIDEventSystemClientSetMatching(v8, 0);
      }
      v11 = IOHIDEventSystemClientCopyServices(v8);
      if (v11)
      {
        v12 = v11;
        v13 = objc_alloc_init((Class)NSMutableArray);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v14 = v12;
        v15 = -[__CFArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v35;
          do
          {
            v19 = 0;
            v20 = v17;
            do
            {
              if (*(_QWORD *)v35 != v18)
                objc_enumerationMutation(v14);
              v21 = sub_100003D94(*(__IOHIDServiceClient **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v19));
              v17 = (void *)objc_claimAutoreleasedReturnValue(v21);

              if (v17)
                objc_msgSend(v13, "addObject:", v17);
              v19 = (char *)v19 + 1;
              v20 = v17;
            }
            while (v16 != v19);
            v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v16);

        }
        v22 = sub_1000029E8(v13, 0);

        if (v22)
          goto LABEL_30;
      }
      if (i)
      {
        if ((sub_1000045DC(v10, (uint64_t)i) & 1) == 0)
        {
LABEL_29:
          printf("bad matching string: %s\n", i);
LABEL_30:
          v6 = 1;
LABEL_46:
          CFRelease(v8);
          CFRelease(v10);
          return v6;
        }
      }
      else
      {
        IOHIDManagerSetDeviceMatching(v10, 0);
      }
      v23 = IOHIDManagerCopyDevices(v10);
      if (v23)
      {
        v24 = objc_alloc_init((Class)NSMutableArray);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v25 = v23;
        v26 = -[__CFSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v26)
        {
          v27 = v26;
          v28 = 0;
          v29 = *(_QWORD *)v35;
          do
          {
            v30 = 0;
            v31 = v28;
            do
            {
              if (*(_QWORD *)v35 != v29)
                objc_enumerationMutation(v25);
              v32 = sub_100003EEC(*(__IOHIDDevice **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v30));
              v28 = (void *)objc_claimAutoreleasedReturnValue(v32);

              if (v28)
                objc_msgSend(v24, "addObject:", v28);
              v30 = (char *)v30 + 1;
              v31 = v28;
            }
            while (v27 != v30);
            v27 = -[__CFSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v27);

        }
        v6 = sub_1000029E8(v24, 1);

      }
      else
      {
        v6 = 0;
      }

      goto LABEL_46;
    }
    CFRelease(v8);
  }
  return 1;
}

uint64_t sub_1000029E8(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  __CFString *v30;
  const char *v31;
  uint64_t k;
  id v33;
  void *v34;
  void *v35;
  uint64_t m;
  void *v37;
  void *v38;
  id v39;
  __CFString *v40;
  int v41;
  __CFString *v42;
  void *v44;
  id v45;
  uint64_t v46;
  unsigned int obj;
  id obja;
  id objb;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];

  v3 = a1;
  v4 = v3;
  if ((byte_10000C290 & 1) == 0)
  {
    for (i = 0; i != 44; i += 4)
      *(&off_10000C128 + i + 2) = (__CFString *)-[__CFString length](*(&off_10000C128 + i + 3), "length");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obja = v4;
    v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    v44 = v4;
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v55;
      do
      {
        v24 = 0;
        v25 = v22;
        do
        {
          if (*(_QWORD *)v55 != v23)
            objc_enumerationMutation(obja);
          v22 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v24);

          for (j = 0; j != 44; j += 4)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", (&off_10000C128)[j]));
            v28 = sub_100004768(v27, (uint64_t)*(&off_10000C128 + j + 1));
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v30 = (__CFString *)objc_msgSend(v29, "length");

            if (v30 > *(&off_10000C128 + j + 2))
              *(&off_10000C128 + j + 2) = v30;
          }
          v24 = (char *)v24 + 1;
          v25 = v22;
        }
        while (v24 != v21);
        v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v21);

      v4 = v44;
    }

    if (a2)
      v31 = "Devices:";
    else
      v31 = "Services:";
    puts(v31);
    for (k = 0; k != 44; k += 4)
      printf("%-*s", *((_DWORD *)&off_10000C128 + 2 * k + 4) + 1, (const char *)-[__CFString cStringUsingEncoding:](*(&off_10000C128 + k + 3), "cStringUsingEncoding:", 4));
    putchar(10);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v45 = obja;
    objb = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (objb)
    {
      v33 = 0;
      v46 = *(_QWORD *)v51;
      do
      {
        v34 = 0;
        v35 = v33;
        do
        {
          if (*(_QWORD *)v51 != v46)
            objc_enumerationMutation(v45);
          v33 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v34);

          for (m = 0; m != 44; m += 4)
          {
            if (-[__CFString isEqualToString:]((&off_10000C128)[m], "isEqualToString:", CFSTR("Built-In"))&& (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", (&off_10000C128)[m])), v37, !v37))
            {
              v40 = CFSTR("0");
            }
            else
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", (&off_10000C128)[m]));
              v39 = sub_100004768(v38, (uint64_t)*(&off_10000C128 + m + 1));
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);

            }
            v41 = *((_DWORD *)&off_10000C128 + 2 * m + 4) + 1;
            v42 = objc_retainAutorelease(v40);
            printf("%-*s", v41, (const char *)-[__CFString UTF8String](v42, "UTF8String"));

          }
          putchar(10);
          v34 = (char *)v34 + 1;
          v35 = v33;
        }
        while (v34 != objb);
        objb = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (objb);

      v4 = v44;
    }

    putchar(10);
    goto LABEL_50;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (!v5)
  {
LABEL_50:
    v18 = 0;
    goto LABEL_51;
  }
  v6 = v5;
  v7 = 0;
  obj = 0;
  v8 = *(_QWORD *)v60;
  if (a2)
    v9 = CFSTR("device");
  else
    v9 = CFSTR("service");
  do
  {
    v10 = v4;
    v11 = 0;
    v12 = v7;
    do
    {
      if (*(_QWORD *)v60 != v8)
        objc_enumerationMutation(v10);
      v7 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("type"));
      v58 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v13, 8, &v58));
      v15 = v58;
      v16 = v15;
      if (v15)
      {
        NSLog(CFSTR("NSJSONSerialization %@"), v15);
        obj = 1;
      }
      else
      {
        v17 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v14, 4));
        puts((const char *)objc_msgSend(v17, "UTF8String"));

      }
      v11 = (char *)v11 + 1;
      v12 = v7;
    }
    while (v6 != v11);
    v4 = v10;
    v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  }
  while (v6);

  v18 = obj;
LABEL_51:

  return v18;
}

uint64_t start(int a1, char **a2)
{
  const char *v5;

  if (a1 <= 1)
    goto LABEL_2;
  v5 = a2[optind];
  if (!strcmp(v5, "help") || !strcmp(v5, "-h") || !strcmp(v5, "--help"))
  {
    puts("\nUsage:\n\n  hidutil [command]\n\nAvailable commands:\n  help       - print this help message\n  dump       - dump HID Event System state\n  property   - read/write HID Event System property\n  list       - list HID Event System services and devices\n\nUse \"hidutil [command] --help\" for more information about a command.");
    return 0;
  }
  else if (!strcmp(v5, "dump"))
  {
    return sub_10000391C(a1, a2);
  }
  else if (!strcmp(v5, "list"))
  {
    return sub_100002660(a1, a2);
  }
  else
  {
    if (strcmp(v5, "property"))
    {
      printf("Unknown command: %s\n", v5);
LABEL_2:
      puts("\nUsage:\n\n  hidutil [command]\n\nAvailable commands:\n  help       - print this help message\n  dump       - dump HID Event System state\n  property   - read/write HID Event System property\n  list       - list HID Event System services and devices\n\nUse \"hidutil [command] --help\" for more information about a command.");
      return 1;
    }
    return sub_1000035C0(a1, a2);
  }
}

void sub_10000304C(void *a1)
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  if (objc_msgSend(v1, "UTF8String"))
    printf("%s", (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));

}

uint64_t sub_100003098(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000030F0;
  v3[3] = &unk_100008338;
  v3[4] = a1;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v3);
  return 0;
}

void sub_1000030F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  __CFString *key;

  v5 = a3;
  key = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@\n"), key, v5));
  sub_10000304C(v6);

  IOHIDEventSystemClientSetProperty(*(IOHIDEventSystemClientRef *)(a1 + 32), key, v5);
}

uint64_t sub_100003174(__IOHIDEventSystemClient *a1, void *a2)
{
  id v3;
  CFArrayRef v4;
  const __CFArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __IOHIDServiceClient *v10;
  CFTypeRef RegistryID;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  __IOHIDServiceClient *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a2;
  v4 = IOHIDEventSystemClientCopyServices(a1);
  if (v4)
  {
    printf("%-8s  %-20s  %s\n", "RegistryID", "Key", "Value");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v4;
    v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(__IOHIDServiceClient **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          RegistryID = IOHIDServiceClientGetRegistryID(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(RegistryID);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10000331C;
          v15[3] = &unk_100008360;
          v16 = v12;
          v17 = v10;
          v13 = v12;
          objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);

        }
        v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

  }
  return 0;
}

void sub_10000331C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  __CFString *key;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  key = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%-8lx   %-20@   %@\n"), objc_msgSend(v5, "unsignedLongValue"), key, v6));
  sub_10000304C(v7);

  IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(a1 + 40), key, v6);
}

uint64_t sub_1000033BC(__IOHIDEventSystemClient *a1, const __CFString *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)IOHIDEventSystemClientCopyProperty(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n"), v2));
  sub_10000304C(v3);

  return 0;
}

uint64_t sub_100003414(__IOHIDEventSystemClient *a1, void *a2)
{
  __CFString *v3;
  CFArrayRef v4;
  const __CFArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __IOHIDServiceClient *v10;
  void *v11;
  CFTypeRef RegistryID;
  void *v13;
  void *v14;
  const __CFArray *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a2;
  v4 = IOHIDEventSystemClientCopyServices(a1);
  if (v4)
  {
    printf("%-8s  %-20s  %s\n", "RegistryID", "Key", "Value");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v4;
    v5 = v4;
    v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(__IOHIDServiceClient **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v11 = (void *)IOHIDServiceClientCopyProperty(v10, v3);
          RegistryID = IOHIDServiceClientGetRegistryID(v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(RegistryID);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%-8lx   %-20@   %@\n"), objc_msgSend(v13, "unsignedLongValue"), v3, v11));
          sub_10000304C(v14);

        }
        v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v4 = v16;
  }

  return 0;
}

uint64_t sub_1000035C0(int a1, char *const *a2)
{
  uint64_t v4;
  __IOHIDEventSystemClient *v5;
  uint64_t v6;
  char v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v19;
  uint64_t v20;
  _QWORD v21[5];

  v4 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 4, 0);
  if (v4)
  {
    v5 = (__IOHIDEventSystemClient *)v4;
    v20 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v8 = getopt_long(a1, a2, "hm:g:s:", (const option *)&off_100008380, 0);
          if (v8 != 109)
            break;
          v7 = sub_100004544((uint64_t)v5, (uint64_t)optarg);
          if ((v7 & 1) == 0)
            printf("bad matching string: %s\n", optarg);
        }
        if (v8 <= 103)
          break;
        if (v8 != 115)
        {
          if (v8 == 104)
          {
            puts("\nRead/Write HID Event System property\n\nUsage:\n\n  hidutil property [ --matching <matching> ][ --get <key> ][ --set <key> ]\n\nFlags:\n\n  -g  --get...................Get property with key (where key is string value)\n  -s  --set...................Set property (key/value pair JSON style dictionary)\n  -m  --matching..............Set matching services/devices\n                              Input can be either json style dictionary or common\n                              device string e.g. keyboard, mouse, digitizer.\n                                  Supported properties:\n                                      ProductID        - numeric value (decimal or hex)\n                                      VendorID         - numeric value (decimal or hex)\n                                      LocationID       - numeric value (decimal or hex)\n                                      PrimaryUsagePage - numeric value (decimal or hex)\n"
              "                                      PrimaryUsage     - numeric value (decimal or hex)\n"
              "                                      Transport        - string value\n"
              "                                      Product          - string value\n"
              "                                  For matching against generic properties, you will need to include\n"
              "                                  the \"IOPropertyMatch\" key (see example below).\n"
              "                                  Example strings:\n"
              "                                      'keyboard'\n"
              "                                      'digi'\n"
              "                                      '{\"ProductID\":0x8600,\"VendorID\":0x5ac}'\n"
              "                                      '[{\"ProductID\":0x8600},{\"PrimaryUsagePage\":1,\"PrimaryUsage\":6}"
              "]'\n"
              "                                      '{\"IOPropertyMatch\":{\"ReportInterval\":1000}}'\n"
              "\n"
              "Examples:\n"
              "\n"
              "  hidutil property --matching '{\"ProductID\":0x54c}' --get \"HIDPointerAcceleration\"\n"
              "  hidutil property --matching '{\"ProductID\":0x54c,\"VendorID\":746}' --set '{\"HIDPointerAcceleration\":"
              "0}'\n"
              "  hidutil property --get \"HIDPointerAcceleration\"");
            v16 = 0;
          }
          else
          {
LABEL_23:
            v16 = 1;
          }
          v17 = (void *)v20;
          goto LABEL_27;
        }
        v11 = sub_100004060(optarg);
        v19 = (__CFString *)v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = sub_100004200(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);

        v6 = (uint64_t)v19;
        if (v14)
        {
          v15 = objc_opt_class(NSDictionary);
          v20 = v14;
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            continue;
        }
        printf("\nERROR!!!! Unable to create property object for '%s'\n", optarg);
        v20 = v14;
      }
      if (v8 == -1)
        break;
      if (v8 != 103)
        goto LABEL_23;
      v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
      v10 = (void *)v6;
      v6 = v9;

    }
    v17 = (void *)v20;
    if (v6 | v20)
    {
      if (!v6 || !v20)
      {
        if (v20)
        {
          objc_msgSend((id)v20, "enumerateKeysAndObjectsUsingBlock:", &stru_100008440);
          if ((v7 & 1) != 0)
          {
            sub_100003174(v5, (void *)v20);
          }
          else
          {
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_1000030F0;
            v21[3] = &unk_100008338;
            v21[4] = v5;
            objc_msgSend((id)v20, "enumerateKeysAndObjectsUsingBlock:", v21);
          }
          v16 = 0;
        }
        else
        {
          if ((v7 & 1) != 0)
            sub_100003414(v5, (void *)v6);
          else
            sub_1000033BC(v5, (const __CFString *)v6);
          v16 = 0;
          v17 = 0;
        }
        goto LABEL_27;
      }
    }
    else
    {
      v17 = 0;
      v6 = 0;
    }
    v16 = 1;
LABEL_27:
    CFRelease(v5);

    return v16;
  }
  return 1;
}

id sub_100003844(void *a1, const char *a2)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &stru_100008440);
}

void sub_100003850(id a1, NSString *a2, id a3, BOOL *a4)
{
  id v5;
  uint64_t v6;
  NSString *v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      if (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("UserKeyMapping"))
        || -[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("HIDKeyboardModifierMappingPairs")))
      {
        if ((_IOHIDIsRestrictedRemappingProperty(v5) & 1) == 0)
          goto LABEL_10;
      }
      else if (!-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("CtrlKeyboardUsageMap"))
             || !_IOHIDIsRestrictedRemappingProperty(v5))
      {
        goto LABEL_10;
      }
      if (IOHIDCheckAccess(kIOHIDRequestTypeListenEvent))
        puts("Attempt to remap alphanumerics / special characters. If setting fails, ensure Terminal has input monitoring permissions. ");
    }
  }
LABEL_10:

}

uint64_t sub_10000391C(int a1, char **a2)
{
  void (*v4)();
  void (*v5)(void);
  int v6;
  char *v7;
  int v8;
  int v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void (*v13)();
  uint64_t v14;

  v4 = sub_100003BA8;
LABEL_2:
  v5 = v4;
  while (1)
  {
    while (1)
    {
      v6 = getopt_long(a1, a2, "o:f:h", (const option *)&off_100008460, 0);
      if (v6 <= 110)
        break;
      if (v6 == 111)
      {
        if (dword_10000C288 >= 3)
          close(dword_10000C288);
        dword_10000C288 = open(optarg, 513, 420);
        if (dword_10000C288 == -1)
        {
          puts("Error opening output file");
          return 1;
        }
      }
    }
    if (v6 == -1)
      break;
    if (v6 == 102)
    {
      v7 = optarg;
      v8 = strcmp(optarg, "xml");
      v4 = sub_100003BA8;
      if (v8)
      {
        v9 = strcmp(v7, "text");
        v4 = sub_100003C50;
        if (v9)
          v4 = v5;
      }
      goto LABEL_2;
    }
    if (v6 == 104)
    {
      puts("\nDump HID Event System state\n\nUsage:\n\n  hidutil dump [object] [flags]\n\nExamples:\n\n  hidutil dump system -f xml\n  hidutil dump system -o /tmp/state_dump.txt -f text\n\nObject:\n\n  system.....................HID Event System\n  clients....................HID Event System Clients\n  services...................HID Event System services\n\nFlags:\n"
        "\n"
        "  -f  --format ..............Format type (xml, text)\n"
        "  -o  --output...............Output file (or stdout if not specified)");
      return 0;
    }
  }
  v10 = optind + 1;
  if ((_DWORD)v10 == a1 || (v11 = a2[v10], !strcmp(v11, "system")))
  {
    v13 = sub_100003CE8;
  }
  else if (!strcmp(v11, "clients"))
  {
    v13 = sub_100003D7C;
  }
  else
  {
    if (strcmp(v11, "services"))
    {
      printf("unrecognized object: %s\n", v11);
      goto LABEL_29;
    }
    v13 = sub_100003D88;
  }
  v14 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 4, 0);
  qword_10000C298 = v14;
  if (v14)
  {
    IOHIDEventSystemClientSetMatching(v14, &off_100008C28);
    qword_10000C2A0 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (qword_10000C2A0)
    {
      v13();
      if (v5)
        v5();
      v12 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    puts("Unable to create client");
  }
LABEL_29:
  v12 = 1;
LABEL_30:
  if (qword_10000C298)
    CFRelease((CFTypeRef)qword_10000C298);
  if (qword_10000C2A0)
    CFRelease((CFTypeRef)qword_10000C2A0);
  if (dword_10000C288 >= 3)
    close(dword_10000C288);
  return v12;
}

void sub_100003BA8()
{
  const __CFData *Data;
  const __CFData *v1;
  int v2;
  const UInt8 *BytePtr;
  size_t Length;
  ssize_t v5;

  Data = CFPropertyListCreateData(kCFAllocatorDefault, (CFPropertyListRef)qword_10000C2A0, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    v1 = Data;
    v2 = dword_10000C288;
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(v1);
    v5 = write(v2, BytePtr, Length);
    if (v5 != CFDataGetLength(v1))
      puts("Error writing to output.");
    CFRelease(v1);
  }
}

void sub_100003C50()
{
  const __CFString *v0;
  const __CFString *v1;
  int v2;
  const char *CStringPtr;
  size_t Length;
  ssize_t v5;

  v0 = CFCopyDescription((CFTypeRef)qword_10000C2A0);
  if (v0)
  {
    v1 = v0;
    v2 = dword_10000C288;
    CStringPtr = CFStringGetCStringPtr(v0, 0x8000100u);
    Length = CFStringGetLength(v1);
    v5 = write(v2, CStringPtr, Length);
    if (v5 != CFStringGetLength(v1))
      puts("Error writing to output.");
    CFRelease(v1);
  }
}

void sub_100003CE8()
{
  sub_100003D18(CFSTR("ClientRecords"));
  sub_100003D18(CFSTR("ServiceRecords"));
  sub_100003D18(CFSTR("SessionFilterDebug"));
}

void sub_100003D18(CFStringRef key)
{
  CFTypeRef v2;

  v2 = IOHIDEventSystemClientCopyProperty((IOHIDEventSystemClientRef)qword_10000C298, key);
  if (v2)
  {
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C2A0, key, v2);
    CFRelease(v2);
  }
  else
  {
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C2A0, key, CFSTR("Unavailable"));
  }
}

void sub_100003D7C()
{
  sub_100003D18(CFSTR("ClientRecords"));
}

void sub_100003D88()
{
  sub_100003D18(CFSTR("ServiceRecords"));
}

id sub_100003D94(__IOHIDServiceClient *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  const __CFString *v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (v2)
  {
    objc_msgSend(v2, "setValue:forKey:", IOHIDServiceClientGetRegistryID(a1), CFSTR("IORegistryEntryID"));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = objc_msgSend(&off_100008CC8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(&off_100008CC8);
          v7 = *(const __CFString **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          v8 = (void *)IOHIDServiceClientCopyProperty(a1, v7);
          objc_msgSend(v2, "setValue:forKey:", v8, v7);

        }
        v4 = objc_msgSend(&off_100008CC8, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }
    v9 = v2;
  }

  return v2;
}

id sub_100003EEC(__IOHIDDevice *a1)
{
  id v2;
  io_service_t Service;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t entryID;
  _BYTE v16[128];

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  entryID = 0xAAAAAAAAAAAAAAAALL;
  if (v2)
  {
    Service = IOHIDDeviceGetService(a1);
    IORegistryEntryGetRegistryEntryID(Service, &entryID);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", entryID));
    objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("IORegistryEntryID"));

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(&off_100008CC8, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(&off_100008CC8);
          objc_msgSend(v2, "setValue:forKey:", IOHIDDeviceGetProperty(a1, *(CFStringRef *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(&off_100008CC8, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }
    v9 = v2;
  }

  return v2;
}

id sub_100004064(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithUTF8String:](NSMutableString, "stringWithUTF8String:", a1));
  v17 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("0[xX][0-9a-f]+"), 1, &v17));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length")));
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = objc_msgSend(v4, "range");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringWithRange:", v5, v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v7));

      v16 = 0;
      objc_msgSend(v8, "scanHexLongLong:", &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v16));
      v10 = objc_msgSend(v4, "range");
      objc_msgSend(v1, "replaceCharactersInRange:withString:", v10, v11, v9);
      v12 = objc_msgSend(v4, "range");
      v13 = (char *)objc_msgSend(v9, "length") + (_QWORD)v12;

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, v13, (_BYTE *)objc_msgSend(v1, "length") - v13));
      v4 = (void *)v14;
    }
    while (v14);
  }

  return v1;
}

id sub_100004200(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  id v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dataUsingEncoding:", 4));
  v5 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v1, 1, &v5));
  v3 = v5;

  if (v3)
    NSLog(CFSTR("NSJSONSerialization %@"), v3);

  return v2;
}

id sub_10000428C(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v1 = sub_100004064(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 1));
    if (objc_msgSend(v4, "isEqual:", CFSTR("[")))
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 1));
      v7 = objc_msgSend(v6, "isEqual:", CFSTR("{"));

      if (!v7)
      {
        v10 = sub_1000043A0(v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_9;
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
    v12 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 1, &v12));
    v9 = v12;

  }
  else
  {
    v5 = 0;
  }
LABEL_9:

  return v5;
}

id sub_1000043A0(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  _UNKNOWN ***v4;
  const __CFString **v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  _UNKNOWN **v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "keyboard"));
  v3 = objc_msgSend(v2, "containsString:", v1);

  if (v3)
  {
    v17[0] = CFSTR("PrimaryUsagePage");
    v17[1] = CFSTR("PrimaryUsage");
    v18[0] = &off_100008C68;
    v18[1] = &off_100008C80;
    v4 = (_UNKNOWN ***)v18;
    v5 = (const __CFString **)v17;
LABEL_5:
    v8 = 2;
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "mouse"));
  v7 = objc_msgSend(v6, "containsString:", v1);

  if (v7)
  {
    v15[0] = CFSTR("PrimaryUsagePage");
    v15[1] = CFSTR("PrimaryUsage");
    v16[0] = &off_100008C68;
    v16[1] = &off_100008C98;
    v4 = (_UNKNOWN ***)v16;
    v5 = (const __CFString **)v15;
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "digitizer"));
  v12 = objc_msgSend(v11, "containsString:", v1);

  if (!v12)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v13 = CFSTR("PrimaryUsagePage");
  v14 = &off_100008CB0;
  v4 = &v14;
  v5 = &v13;
  v8 = 1;
LABEL_6:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v5, v8));
LABEL_7:

  return v9;
}

uint64_t sub_100004544(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_10000428C(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
    goto LABEL_7;
  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v6 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      IOHIDEventSystemClientSetMatchingMultiple(a1, v4);
      goto LABEL_6;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  IOHIDEventSystemClientSetMatching(a1, v4);
LABEL_6:
  v7 = 1;
LABEL_8:

  return v7;
}

uint64_t sub_1000045DC(__IOHIDManager *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  const __CFDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v3 = sub_100004064(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", 1));
  if (objc_msgSend(v5, "isEqual:", CFSTR("[")))
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", 1));
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("{"));

    if ((v7 & 1) == 0)
    {
      v11 = sub_1000043A0(v4);
      v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_7;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
  v16 = 0;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 1, &v16));
  v10 = v16;

  if (v10)
  {
    NSLog(CFSTR("Serialization error: %@"), v10);

LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_7:
  v12 = 0;
  if (a1 && v9)
  {
    v13 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
    {
      IOHIDManagerSetDeviceMatching(a1, v9);
    }
    else
    {
      v14 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v9, v14) & 1) == 0)
        goto LABEL_14;
      IOHIDManagerSetDeviceMatchingMultiple(a1, v9);
    }
    v12 = 1;
  }
LABEL_15:

  return v12;
}

id sub_100004768(void *a1, uint64_t a2)
{
  _UNKNOWN **v3;
  BOOL v4;
  _UNKNOWN **v5;
  uint64_t v6;
  const __CFString *v7;
  NSString *v8;
  void *v9;
  id v11;

  v3 = a1;
  if (a2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
    v5 = &off_100008C50;
  else
    v5 = v3;
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (a2 == 16)
    {
      v11 = objc_msgSend(v5, "longLongValue");
      v7 = CFSTR("0x%llx");
    }
    else
    {
      v11 = objc_msgSend(v5, "unsignedLongValue");
      v7 = CFSTR("%lu");
    }
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v11);
  }
  else
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v5);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

BOOL sub_10000482C(void *a1, _DWORD *a2)
{
  id v3;
  unint64_t v4;
  id *v5;
  BOOL v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = a1;
  v4 = 0;
  v11 = unk_100008500;
  v12 = unk_100008510;
  v13 = unk_100008520;
  v9 = unk_1000084E0;
  v10 = unk_1000084F0;
  v5 = (id *)&v9 + 1;
  v6 = 1;
  while (!objc_msgSend(*v5, "containsString:", v3, v9, v10, v11, v12, v13))
  {
    v6 = v4 < 4;
    v5 += 2;
    if (++v4 == 5)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  *a2 = *((_DWORD *)v5 - 2);
LABEL_6:
  for (i = 72; i != -8; i -= 16)

  return v6;
}

void sub_100004924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 72; i != -8; i -= 16)

  _Unwind_Resume(a1);
}

NSMutableString *sub_100004954(void *a1)
{
  id v1;
  NSMutableString *v2;
  uint64_t v3;
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v1 = a1;
  v2 = objc_opt_new(NSMutableString);
  v3 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v1, v3) & 1) != 0)
  {
    v4 = v1;
    -[NSMutableString appendString:](v2, "appendString:", CFSTR("("));
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      do
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v5));
        v7 = sub_100004954();
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        -[NSMutableString appendString:](v2, "appendString:", v8);

        if (v5 < (char *)objc_msgSend(v4, "count") - 1)
          -[NSMutableString appendString:](v2, "appendString:", CFSTR(", "));
        ++v5;
      }
      while (v5 < objc_msgSend(v4, "count"));
    }
    -[NSMutableString appendString:](v2, "appendString:", CFSTR(")"));

  }
  else
  {
    v9 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v1, v9) & 1) != 0)
    {
      -[NSMutableString appendString:](v2, "appendString:", CFSTR("{"));
      v22 = v1;
      v10 = v1;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            -[NSMutableString appendFormat:](v2, "appendFormat:", CFSTR("%@:"), v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v16));
            v18 = sub_100004954();
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            -[NSMutableString appendString:](v2, "appendString:", v19);

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
            if (v16 != v20)
              -[NSMutableString appendString:](v2, "appendString:", CFSTR(", "));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }
      -[NSMutableString appendString:](v2, "appendString:", CFSTR("}"));

      v1 = v22;
    }
    else
    {
      -[NSMutableString appendFormat:](v2, "appendFormat:", CFSTR("%@"), v1);
    }
  }

  return v2;
}

BOOL sub_100004C14()
{
  return geteuid() == 0;
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "range");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_scanHexLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexLongLong:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}
