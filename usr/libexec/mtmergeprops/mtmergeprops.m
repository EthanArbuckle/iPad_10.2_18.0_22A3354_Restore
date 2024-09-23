id MergePersonalityDictionaryFromPathWithName(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v9;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contentsOfDirectoryAtPath:error:", v7, 0));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  v31 = v11;
  v35 = v11;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    v35 = v11;
    v32 = *(_QWORD *)v37;
    do
    {
      v15 = 0;
      v33 = v13;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v15)));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathExtension"));
        v18 = objc_msgSend(v17, "isEqualToString:", v8);

        if (v18)
        {
          v19 = objc_autoreleasePoolPush();
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v16));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v10));
          if (v21)
          {
            v22 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
            v23 = v10;
            v24 = v8;
            v25 = v7;
            printf("found %s in %s\n", v22, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
            v26 = recursiveMerge(v35, v21, 3);
            v27 = objc_claimAutoreleasedReturnValue(v26);

            v35 = (id)v27;
            v7 = v25;
            v8 = v24;
            v10 = v23;
            v14 = v32;
            v13 = v33;
          }

          objc_autoreleasePoolPop(v19);
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

  v28 = v35;
  return v28;
}

id recursiveMerge(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (!v5)
  {
    v12 = v6;
LABEL_6:
    v11 = v12;
    goto LABEL_7;
  }
  if (!v6)
  {
    v12 = v5;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v5));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __recursiveMerge_block_invoke;
  v14[3] = &unk_1000042B0;
  v15 = v5;
  v17 = a3;
  v9 = v8;
  v16 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
  v10 = v16;
  v11 = v9;

LABEL_7:
  return v11;
}

id GetMergePersonalityNameForDriver(io_registry_entry_t a1)
{
  void *CFProperty;
  uint64_t v2;
  id v3;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, CFSTR("mt-merge-personality"), kCFAllocatorDefault, 0);
  v2 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(CFProperty, v2) & 1) != 0)
    v3 = CFProperty;
  else
    v3 = 0;

  return v3;
}

uint64_t CreateIteratorForDriverOfType(IONotificationPort *a1, CFAbsoluteTime *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  io_iterator_t notification;

  notification = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v5, CFSTR("HID Bootloadable"), kCFBooleanTrue);
  CFDictionarySetValue(Mutable, CFSTR("IOPropertyMatch"), v5);
  if (a2)
    *a2 = CFAbsoluteTimeGetCurrent();
  if (!IOServiceAddMatchingNotification(a1, "IOServiceMatched", Mutable, (IOServiceMatchingCallback)DriverAppeared, a2, &notification))return notification;
  syslog(3, "Failed to create matching iterator\n");
  return 0;
}

void DriverAppeared(double *a1, uint64_t a2)
{
  double v3;
  __CFRunLoop *Main;

  if (a1)
    v3 = CFAbsoluteTimeGetCurrent() - *a1;
  else
    v3 = 0.0;
  if (MergePropertiesWithIterator(a2))
  {
    syslog(5, "Found the mt driver after %f seconds. Exiting.\n", v3);
    Main = CFRunLoopGetMain();
    CFRunLoopStop(Main);
  }
}

void MergePropertiesForDriver(void *a1, io_service_t a2, void *a3)
{
  id v5;
  id v6;
  kern_return_t v7;
  __int128 v8;
  size_t outputStructCnt;
  io_connect_t connect;
  _BYTE __b[516];
  int inputStruct;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
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
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v5 = a1;
  v6 = a3;
  if (v5)
  {
    connect = 0;
    if (!IOServiceOpen(a2, mach_task_self_, 0, &connect))
    {
      v7 = IOConnectSetCFProperties(connect, v5);
      if (v7)
        syslog(3, "Merge properties for %s returned error 0x%08x\n", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), v7);
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v8;
      v44 = v8;
      v41 = v8;
      v42 = v8;
      v39 = v8;
      v40 = v8;
      v37 = v8;
      v38 = v8;
      v35 = v8;
      v36 = v8;
      v33 = v8;
      v34 = v8;
      v31 = v8;
      v32 = v8;
      v29 = v8;
      v30 = v8;
      v28 = v8;
      v27 = v8;
      v26 = v8;
      v25 = v8;
      v24 = v8;
      v23 = v8;
      v22 = v8;
      v21 = v8;
      v20 = v8;
      v19 = v8;
      v18 = v8;
      v17 = v8;
      v16 = v8;
      v15 = v8;
      v14 = v8;
      v13 = v8;
      memset(__b, 170, sizeof(__b));
      inputStruct = 1;
      outputStructCnt = 516;
      IOConnectCallStructMethod(connect, 4u, &inputStruct, 0x204uLL, __b, &outputStructCnt);
      IOServiceClose(connect);
    }
  }

}

uint64_t MergePropertiesWithIterator(uint64_t result)
{
  io_iterator_t v1;
  io_object_t v2;
  io_registry_entry_t v3;
  char v4;
  id MergePersonalityNameForDriver;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  if ((_DWORD)result)
  {
    v1 = result;
    v2 = IOIteratorNext(result);
    if (v2)
    {
      v3 = v2;
      v4 = 0;
      do
      {
        MergePersonalityNameForDriver = GetMergePersonalityNameForDriver(v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue(MergePersonalityNameForDriver);
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
          v8 = MergePersonalityDictionaryFromPathWithName(CFSTR("/usr/share/firmware/multitouch/"), CFSTR("mtprops"), v7, v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

          v10 = MergePersonalityDictionaryFromPathWithName(CFSTR("/var/mobile/Library/Application Support/Multitouch/"), CFSTR("dycal"), v9, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

          MergePropertiesForDriver(v11, v3, v6);
          v4 = 1;
        }
        IOObjectRelease(v3);

        v3 = IOIteratorNext(v1);
      }
      while (v3);
    }
    else
    {
      v4 = 0;
    }
    return v4 & 1;
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  CFAbsoluteTime *v3;
  IONotificationPortRef v4;
  IONotificationPort *v5;
  void *v6;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  uint64_t IteratorForDriverOfType;
  io_object_t v10;
  NSObject *v11;
  dispatch_time_t v13;

  v3 = (CFAbsoluteTime *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v4 = IONotificationPortCreate(0);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)os_transaction_create("com.apple.mtmergeprops.transaction");
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    IteratorForDriverOfType = CreateIteratorForDriverOfType(v5, v3);
    v10 = IteratorForDriverOfType;
    if ((MergePropertiesWithIterator(IteratorForDriverOfType) & 1) != 0)
    {
      syslog(5, "Successfully merged properties. Exiting.\n");
      v11 = 0;
    }
    else
    {
      v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      if (v11)
      {
        v13 = dispatch_time(0, 60000000000);
        dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        dispatch_source_set_event_handler(v11, &__block_literal_global);
        dispatch_resume(v11);
        CFRunLoopRun();
      }
      else
      {
        syslog(3, "Failed to create dispatch timer. Exiting.\n");
      }
    }
    IONotificationPortDestroy(v5);
    if (v10)
      IOObjectRelease(v10);
    if (v11)

    if (v3)
      free(v3);

    return 0;
  }
  else
  {
    free(v3);
    syslog(3, "Failed to create IONotificationPort\n");
    return -1;
  }
}

void __main_block_invoke(id a1)
{
  __CFRunLoop *Main;

  syslog(3, "Driver did not appear after %d seconds. Exiting.\n", 60);
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

void __recursiveMerge_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  uint64_t v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v15));
  if (!v8)
    goto LABEL_6;
  v9 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = recursiveMerge(v8, v7, *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v11, v15);

    goto LABEL_7;
  }
  v12 = objc_opt_class(v7);
  isKindOfClass = objc_opt_isKindOfClass(v8, v12);
  v14 = *(_QWORD *)(a1 + 48);
  if ((isKindOfClass & 1) != 0)
  {
    if ((v14 & 1) == 0)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v15);
    goto LABEL_7;
  }
  if ((v14 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    *a4 = 1;
  }
LABEL_7:

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}
