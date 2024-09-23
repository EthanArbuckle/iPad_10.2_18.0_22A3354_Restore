id sub_10000188C()
{
  void *v0;
  uint64_t v1;
  NSSet *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKDaemonConnectionProtocol));
  v1 = objc_opt_class(SKEraseVolume);
  v2 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, objc_opt_class(SKEraseDisk), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, "eraseWithEraser:reply:", 0, 0);

  v4 = objc_opt_class(NSDate);
  v5 = objc_opt_class(NSArray);
  v6 = objc_opt_class(NSString);
  v7 = objc_opt_class(NSNull);
  v8 = objc_opt_class(NSNumber);
  v9 = objc_opt_class(NSData);
  v10 = objc_opt_class(NSOrderedSet);
  v11 = objc_opt_class(NSDictionary);
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(NSError), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v13, "eraseWithEraser:reply:", 0, 1);

  return v0;
}

id sub_100001A24()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKHelperClientProtocol));
  v1 = objc_opt_class(NSDate);
  v2 = objc_opt_class(NSArray);
  v3 = objc_opt_class(NSString);
  v4 = objc_opt_class(NSNull);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSData);
  v7 = objc_opt_class(NSOrderedSet);
  v8 = objc_opt_class(NSDictionary);
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(NSError), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, "requestWithUUID:didCompleteWithResult:", 1, 0);

  return v0;
}

uint64_t sub_100001BD0(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("Sealed"));

  if (v2)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Broken")) & 1) != 0)
    {
      v3 = 2;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Yes")) & 1) != 0)
    {
      v3 = 3;
    }
    else
    {
      v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("No"));
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_100002760(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_1000027EC(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKAPFSSnapshotDisk+Daemon.m", 76);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_1000037EC(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKMountOperation.m", 168);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

void sub_1000044EC(uint64_t a1)
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v2 = objc_msgSend(v3, "_recacheSyncDisk:", *(_QWORD *)(a1 + 32));

}

void sub_1000047B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000047C8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "installedFilesystemsMapping"));
  v3 = (void *)qword_100051A68;
  qword_100051A68 = v2;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionFilesystemsMapping"));
  byte_100051A70 = objc_msgSend(v4, "count") != 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v18));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100044BB8));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v12));

        if (objc_msgSend(v13, "count")
          || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100051A68, "valueForKey:", v10)),
              v15,
              !v15))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
          objc_msgSend((id)qword_100051A68, "setObject:forKeyedSubscript:", v14, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = objc_claimAutoreleasedReturnValue(+[SKFilesystem collectFilesystemsWithPersonalityMapping:](SKFilesystem, "collectFilesystemsWithPersonalityMapping:", qword_100051A68));
  v17 = (void *)qword_100051A60;
  qword_100051A60 = v16;

}

BOOL sub_1000049D8(id a1, SKFilesystem *a2, NSDictionary *a3)
{
  return -[SKFilesystem shouldShow](a2, "shouldShow", a3);
}

void sub_10000512C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_UNKNOWN **sub_100005ED8(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Base")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Partition ID")));

  v6 = sub_10000FA68(v4);
  if (v6)
    v6 = sub_10000FA68(v5);
  if (a2)
    *a2 = v6;
  if (v6)
    v7 = (_UNKNOWN **)v4;
  else
    v7 = &off_100047EB0;
  v8 = v7;

  return v8;
}

void sub_100007070(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_1000076E0(id a1, id a2, id a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

void sub_100007A34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007BA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100008A4C(uint64_t a1, uint64_t a2)
{
  SKPartitionTable *v4;
  void *v5;
  SKPartitionTable *v6;
  void *v7;
  SKPartitionTable *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  char *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v21;
  _QWORD v22[4];
  NSObject *p_super;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;

  v4 = [SKPartitionTable alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v6 = -[SKPartitionTable initWithDisk:error:](v4, "initWithDisk:error:", v5, a2);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100008CA8;
    v22[3] = &unk_100044C40;
    v8 = v6;
    p_super = &v8->super;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v21 = 0;
    v10 = objc_msgSend(v9, "cleanupWithError:", &v21);
    v11 = v21;

    if ((v10 & 1) == 0 && v11)
    {
      v12 = sub_10000BA9C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
        *(_DWORD *)buf = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);

      }
    }
    v15 = -[SKPartitionTable writePartitionScheme:error:](v8, "writePartitionScheme:error:", 0, a2);
    v16 = 0;
    if (v15)
      v16 = *(id *)(a1 + 40);

    v17 = p_super;
  }
  else
  {
    v18 = sub_10000BA9C();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      *(_DWORD *)buf = 136315394;
      v25 = "-[SKEraseDisk(Daemon) createStateMachineWithError:]_block_invoke";
      v26 = 2112;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to create partition table for %@", buf, 0x16u);

    }
    v16 = 0;
  }

  return v16;
}

void sub_100008CA8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "partitions"));
  v4 = objc_msgSend(v3, "newPartition");

  objc_msgSend(v5, "addObject:", v4);
}

id sub_100008D08(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  SKFilesystemCreator *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  int v27;
  NSMutableArray *v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "children"));

  if (v5 && objc_msgSend(v5, "count"))
  {
    v25 = a2;
    v6 = objc_opt_new(NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      while (1)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100009050;
        v26[3] = &unk_100044C88;
        v27 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v26, v25));
        v11 = (SKFilesystemCreator *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v10));

        if (-[SKFilesystemCreator count](v11, "count") != (id)1)
          break;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "innerDescriptor"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemCreator objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toVolumeWithDisk:", v15));

        -[NSMutableArray addObject:](v6, "addObject:", v16);
        ++v9;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
        v18 = objc_msgSend(v17, "count");

        if ((unint64_t)v18 <= v9)
          goto LABEL_7;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 300, v11, 0));
      v21 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v24, v25));

    }
    else
    {
LABEL_7:
      v11 = objc_opt_new(SKFilesystemCreator);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemCreator progress](v11, "progress"));
      objc_msgSend(v19, "chainChildProgress:withPendingUnitCount:", v20, (uint64_t)((double)(0x64 / (unint64_t)objc_msgSend(v5, "count")) * 0.5));

      if (-[SKFilesystemCreator createWithVolumes:error:](v11, "createWithVolumes:error:", v6, v25))
        v21 = *(id *)(a1 + 40);
      else
        v21 = 0;
    }
  }
  else
  {
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v28 = v6;
    v11 = (SKFilesystemCreator *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 300, v11, 0));
    v21 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v22, a2));

  }
  return v21;
}

BOOL sub_100009050(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKPartitionTable partitionIDFromDisk:](SKPartitionTable, "partitionIDFromDisk:", a2));
  v4 = objc_msgSend(v3, "unsignedLongValue") == (id)(*(int *)(a1 + 32) + 1);

  return v4;
}

id sub_1000090A0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "children"));

  if (v5
    && objc_msgSend(v5, "count")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors")),
        v7 = objc_msgSend(v6, "count"),
        v8 = objc_msgSend(v5, "count"),
        v6,
        v7 == v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v11));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filesystem"));
        +[SKEraseVolume reProbeWithDisk:isEncrypted:](SKEraseVolume, "reProbeWithDisk:isEncrypted:", v12, objc_msgSend(v15, "isEncrypted"));

        ++v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
        v17 = objc_msgSend(v16, "count");

      }
      while ((unint64_t)v17 > v11);
    }
    v18 = *(id *)(a1 + 40);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v23 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 105, v20, 0));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v21, a2));

  }
  return v18;
}

id sub_1000092BC(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];
  void *v45;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "children"));

  if (v5
    && objc_msgSend(v5, "count")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors")),
        v7 = objc_msgSend(v6, "count"),
        v8 = objc_msgSend(v5, "count"),
        v6,
        v7 == v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v12 = 0;
      v37 = kSKDiskMountOptionRecursive;
      v13 = kSKDiskUnmountOptionForce;
      *(_QWORD *)&v11 = 138412546;
      v36 = v11;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors", v36));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v12));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "innerDescriptor"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filesystem"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "majorType"));
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("apfs"));

        if ((v19 & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v12));
          v43[0] = v37;
          v43[1] = v13;
          v44[0] = &__kCFBooleanTrue;
          v44[1] = &__kCFBooleanTrue;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
          v38 = 0;
          v22 = +[SKUnmountOperation unmountWithDisk:options:error:](SKUnmountOperation, "unmountWithDisk:options:error:", v20, v21, &v38);
          v23 = v38;

          if ((v22 & 1) == 0 && v23)
          {
            v24 = sub_10000BA9C();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "children"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", v12));
              *(_DWORD *)buf = v36;
              v40 = v28;
              v41 = 2112;
              v42 = v23;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to unmount after reprobe %@, %@", buf, 0x16u);

            }
          }

        }
        ++v12;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors"));
        v30 = objc_msgSend(v29, "count");

      }
      while ((unint64_t)v30 > v12);
    }
    v31 = *(id *)(a1 + 40);
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v45 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 105, v33, 0));
    v31 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v34, a2));

  }
  return v31;
}

SKStateTransitionEntry *sub_10000A200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:event:action:nextState:](SKStateTransitionEntry, "entryWithState:event:action:nextState:", a1, a2, a3, a4);
}

SKStateTransitionEntry *sub_10000A21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:event:selector:nextState:](SKStateTransitionEntry, "entryWithState:event:selector:nextState:", a1, a2, a3, a4);
}

id sub_10000A238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SKStateTransitionEntry entryWithState:event:selector:](SKStateTransitionEntry, "entryWithState:event:selector:", a1, a2, a3);
}

id sub_10000A250(uint64_t a1, uint64_t a2)
{
  return +[SKStateTransitionEntry entryWithState:event:](SKStateTransitionEntry, "entryWithState:event:", a1, a2);
}

void sub_10000A2A8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
  v2 = (void *)qword_100051A78;
  qword_100051A78 = v1;

}

void sub_10000A604(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("<plist"), "dataUsingEncoding:", 4));
  v2 = (void *)qword_100051A88;
  qword_100051A88 = v1;

}

void sub_10000A674(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("</plist>"), "dataUsingEncoding:", 4));
  v2 = (void *)qword_100051A98;
  qword_100051A98 = v1;

}

void sub_10000B280(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3, a4));
  objc_msgSend(v4, "launch");

}

BOOL sub_10000B2B0(id a1, SKTask *a2, NSDictionary *a3)
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3));
  v4 = objc_msgSend(v3, "isRunning");

  return v4;
}

void sub_10000B2E8(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKTask *v12;

  v12 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v12, "stdoutHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readDataUpToLength:error:", 4096, 0));
    objc_msgSend(v5, "parseData:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v12, "stderrHandle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readDataUpToLength:error:", 4096, 0));
    objc_msgSend(v9, "parseData:", v11);

  }
}

BOOL sub_10000B3E0(id a1, SKTask *a2, NSDictionary *a3)
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3));
  v4 = objc_msgSend(v3, "isRunning");

  return v4;
}

void sub_10000B418(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3, a4));
  objc_msgSend(v4, "waitUntilExit");

}

void sub_10000B448(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKTask *v12;

  v12 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v12, "stdoutHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readDataToEndOfFile"));
    objc_msgSend(v5, "parseData:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v12, "stderrHandle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readDataToEndOfFile"));
    objc_msgSend(v9, "parseData:", v11);

  }
}

BOOL sub_10000B530(id a1, SKTask *a2, NSDictionary *a3)
{
  return !-[SKTask endedSuccessfully](a2, "endedSuccessfully", a3);
}

id sub_10000BA24(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d"), a1, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));

  return v4;
}

id sub_10000BA9C()
{
  id *v0;

  if (qword_100051AA8 != -1)
    dispatch_once(&qword_100051AA8, &stru_100044E48);
  if (byte_100051AB0)
    v0 = (id *)&off_100051780;
  else
    v0 = (id *)&off_100051778;
  return *v0;
}

void sub_10000BAF8(id a1)
{
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;

  v1 = os_log_create("com.apple.storagekit", "general");
  v2 = off_100051778;
  off_100051778 = v1;

  v3 = os_log_create("com.apple.storagekit", "storagekit-install");
  v4 = off_100051780;
  off_100051780 = v3;

}

void SKLogSetLogsToConsole()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = sub_10000BA9C();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToConsole/Std is deprecated. Please remove this call", v2, 2u);
  }

}

void SKLogSetLogsToStd()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = sub_10000BA9C();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToStd is deprecated. Please remove this call", v2, 2u);
  }

}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  byte_100051AB0 = result;
  return result;
}

void sub_10000BC28(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;

  v5 = a3;
  v6 = sub_10000BA9C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, a1))
  {
    *(_DWORD *)buf = 136315138;
    v22 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, a1, "%s", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = sub_10000BA9C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, a1))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, a1, "%@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

void sub_10000C04C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10000C75C(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "valueForEntitlement:", a1));
  v4 = 0;
  if (v2)
  {
    v3 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0 && (objc_msgSend(v2, "BOOLValue") & 1) != 0)
      v4 = 1;
  }

  return v4;
}

void sub_10000C9F4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Progress handler failed:%@", (uint8_t *)&v5, 0xCu);
  }

}

id sub_10000CD34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[12];
  _QWORD v17[12];

  v16[0] = CFSTR("api");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *(_QWORD *)(a1 + 40), 4));
  v17[0] = v2;
  v16[1] = CFSTR("diskType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
  v17[1] = v3;
  v16[2] = CFSTR("isDiskImage");
  if (objc_msgSend(*(id *)(a1 + 32), "isDiskImage"))
    v4 = &__kCFBooleanTrue;
  else
    v4 = &__kCFBooleanFalse;
  v17[2] = v4;
  v16[3] = CFSTR("isWritable");
  if (objc_msgSend(*(id *)(a1 + 32), "isWritable"))
    v5 = &__kCFBooleanTrue;
  else
    v5 = &__kCFBooleanFalse;
  v17[3] = v5;
  v16[4] = CFSTR("isLocked");
  if (objc_msgSend(*(id *)(a1 + 32), "isLocked"))
    v6 = &__kCFBooleanTrue;
  else
    v6 = &__kCFBooleanFalse;
  v17[4] = v6;
  v16[5] = CFSTR("isExternal");
  if (objc_msgSend(*(id *)(a1 + 32), "isExternal"))
    v7 = &__kCFBooleanTrue;
  else
    v7 = &__kCFBooleanFalse;
  v17[5] = v7;
  v16[6] = CFSTR("isInternalDisk");
  if (objc_msgSend(*(id *)(a1 + 32), "isInternal"))
    v8 = &__kCFBooleanTrue;
  else
    v8 = &__kCFBooleanFalse;
  v17[6] = v8;
  v16[7] = CFSTR("isJournaled");
  if (objc_msgSend(*(id *)(a1 + 32), "isJournaled"))
    v9 = &__kCFBooleanTrue;
  else
    v9 = &__kCFBooleanFalse;
  v17[7] = v9;
  v16[8] = CFSTR("isWholeDisk");
  if (objc_msgSend(*(id *)(a1 + 32), "isWholeDisk"))
    v10 = &__kCFBooleanTrue;
  else
    v10 = &__kCFBooleanFalse;
  v17[8] = v10;
  v16[9] = CFSTR("isOSInternal");
  if (objc_msgSend(*(id *)(a1 + 32), "isOSInternal"))
    v11 = &__kCFBooleanTrue;
  else
    v11 = &__kCFBooleanFalse;
  v17[9] = v11;
  v16[10] = CFSTR("isPhysicalDisk");
  if (objc_msgSend(*(id *)(a1 + 32), "isPhysicalDisk"))
    v12 = &__kCFBooleanTrue;
  else
    v12 = &__kCFBooleanFalse;
  v17[10] = v12;
  v16[11] = CFSTR("role");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "role"));
  v17[11] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 12));

  return v14;
}

id sub_10000D660(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &off_100047E98);
}

void sub_10000D7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D810(_QWORD *a1, int a2)
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  if (a2)
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(v3, "requestWithUUID:didCompleteWithResult:", v2, v6);

}

void sub_10000DA1C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "minimalDictionaryRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_safe_object:", v4));

  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), v6);

}

void sub_10000DC54(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "minimalDictionaryRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_safe_object:", v4));

  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), v6);

}

void sub_10000DE8C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "minimalDictionaryRepresentation", (_QWORD)v15));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v11 + 8);
  v19 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  objc_msgSend(v13, "requestWithUUID:didCompleteWithResult:", v12, v14);

}

void sub_10000E12C(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  v5 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), v4);
}

id sub_10000E360(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestWithUUID:didCompleteWithResult:", *(_QWORD *)(a1 + 40), &__NSArray0__struct);
}

void sub_10000E4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "requestWithUUID:didCompleteWithResult:", v2, v5);

}

void sub_10000E6C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "minimalDictionaryRepresentation", (_QWORD)v16));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = (void *)v11[1];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_safe_object:", v4));
  v20 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v13, "requestWithUUID:didCompleteWithResult:", v12, v15);

}

void sub_10000E9C8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "minimalDictionaryRepresentation", (_QWORD)v16));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = (void *)v11[1];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_safe_object:", v4));
  v20 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v13, "requestWithUUID:didCompleteWithResult:", v12, v15);

}

NSArray *__cdecl sub_10000EC44(id a1)
{
  void *v1;
  void *v2;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 112, 0));
  v4 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));

  return (NSArray *)v2;
}

void sub_10000ECD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "requestWithUUID:didCompleteWithResult:", v2, v5);

}

NSArray *__cdecl sub_10000EE70(id a1)
{
  void *v1;
  void *v2;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 112, 0));
  v4 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));

  return (NSArray *)v2;
}

void sub_10000EF00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "requestWithUUID:didCompleteWithResult:", v2, v5);

}

void sub_10000F184(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "requestWithUUID:didCompleteWithResult:", v2, v5);

}

NSArray *__cdecl sub_10000F304(id a1)
{
  void *v1;
  void *v2;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 112, 0));
  v4 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));

  return (NSArray *)v2;
}

void sub_10000F394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "requestWithUUID:didCompleteWithResult:", v2, v5);

}

void sub_10000F65C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (!a2 || v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v13[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", v6));
    v13[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "minimalDictionaryRepresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_safe_object:", v9));
    v14[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v14[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v12);

  }
}

uint64_t sub_10000F8CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000F99C(void *a1, const void *a2)
{
  _QWORD *v3;
  NSObject *queue;

  queue = a1;
  v3 = malloc_type_calloc(8uLL, 1uLL, 0x50B26848uLL);
  *v3 = 1;
  dispatch_queue_set_specific(queue, a2, v3, (dispatch_function_t)&_free);

}

_QWORD *sub_10000FA00()
{
  _QWORD *result;

  if (qword_100051AB8 != -1)
    dispatch_once(&qword_100051AB8, &stru_100045090);
  result = dispatch_get_specific("isMainQueue");
  if (result)
    return (_QWORD *)(*result != 0);
  return result;
}

void sub_10000FA54(id a1)
{
  sub_10000F99C(&_dispatch_main_q, "isMainQueue");
}

uint64_t sub_10000FA68(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

BOOL sub_10000FABC(void *a1)
{
  id v1;
  uint64_t v2;
  _BOOL8 v3;

  v1 = a1;
  v3 = v1
    && (v2 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)
    && objc_msgSend(v1, "length") != 0;

  return v3;
}

uint64_t sub_10000FB1C(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSDictionary);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FB70(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FBC4(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSData);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

id sub_10000FC18(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (sub_10000FA68(v1))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

id sub_10000FC5C(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (sub_10000FA68(v1))
    v2 = objc_msgSend(v1, "unsignedLongLongValue");
  else
    v2 = 0;

  return v2;
}

__CFString *sub_10000FCA0(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if (sub_10000FABC(v1))
    v2 = v1;
  else
    v2 = &stru_100046738;
  v3 = v2;

  return v3;
}

BOOL sub_10000FCE4(void *a1)
{
  id v1;
  id v2;
  _BOOL8 v3;

  v1 = a1;
  if (sub_10000FABC(v1))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v1);
    v3 = v2 != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t sub_10000FD3C(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FD90(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FDE4(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSDictionary);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FE38(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSData);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FE8C(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    v2 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v1, v2);

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10000FEE0(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return (uint64_t)objc_msgSend((id)a1, "isEqual:", a2);
  else
    return 1;
}

void sub_100010754(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010780(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _UNKNOWN **v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _UNKNOWN **v18;
  id v19;
  unsigned int v20;
  BOOL v21;
  id v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = &APFSCancelContainerResize_ptr;
    v8 = &kSKDiskFileSystemAPFS;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v10 = objc_msgSend(objc_alloc((Class)v7[131]), "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
        if (objc_msgSend(v11, "isEqualToString:", *v8)
          && (v12 = objc_msgSend(v10, "isEncrypted"),
              v12 == objc_msgSend(*(id *)(a1 + 32), "isEncrypted")))
        {
          v23 = objc_msgSend(v10, "isCaseSensitive");
          v13 = objc_msgSend(*(id *)(a1 + 32), "isCaseSensitive");
          v14 = v5;
          v15 = v6;
          v16 = a1;
          v17 = v8;
          v18 = v7;
          v19 = v3;
          v20 = v13;

          v21 = v23 == v20;
          v3 = v19;
          v7 = v18;
          v8 = v17;
          a1 = v16;
          v6 = v15;
          v5 = v14;
          if (v21)
            objc_msgSend(*(id *)(a1 + 32), "setFilesystem:", v10);
        }
        else
        {

        }
        v9 = (char *)v9 + 1;
      }
      while (v5 != v9);
      v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v5 = v22;
    }
    while (v22);
  }

}

void sub_100010E64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011B20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011C10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011C54(id a1)
{
  id v1;
  NSObject *v2;
  int v3;
  size_t v4;
  unsigned int v5;
  uint8_t buf[4];
  unsigned int v7;

  v5 = 0;
  v4 = 4;
  sysctlbyname("hw.logicalcpu", &v5, &v4, 0, 0);
  v1 = sub_10000BA9C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "# CPUs: %u", buf, 8u);
  }

  v3 = v5;
  if (v5 <= 1)
    v3 = 1;
  dword_100051AC8 = v3;
}

void sub_100011D70(id a1)
{
  SKDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(SKDaemon);
  v2 = (void *)qword_100051AD8;
  qword_100051AD8 = (uint64_t)v1;

}

void sub_100011DFC(id a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v1 = sub_10000BA9C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM received", v4, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  objc_msgSend(v3, "_scheduleGenericOperationWithCompletionBlock:", &stru_100045138);

}

void sub_100011E84(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_10000BA9C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM handling complete, quitting now", v3, 2u);
  }

  exit(0);
}

id sub_100012368(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWithMatchingEvent:", a2);
}

void sub_100012604(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012628(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  unsigned int v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(SKDaemonConnection);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    objc_msgSend(v4, "removeListener:", *(_QWORD *)(a1 + 32));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientConnections"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientConnections"));
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));

  v7 = sub_10000BA9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientConnections"));
    v13 = 138412546;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ removed. There are now %d client(s) connected to storagetkid", (uint8_t *)&v13, 0x12u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientConnections"));
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
    objc_msgSend(*(id *)(a1 + 40), "setActiveClientsTransaction:", 0);
  objc_sync_exit(v5);

}

void sub_1000127AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100012D28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "diskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diskIdentifier"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void sub_10001325C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100013CE4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disk"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncDiskFromDaemon:error:", v5, a2));
  objc_msgSend(*(id *)(a1 + 32), "setDisk:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  if (v7)
  {
    v8 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filesystem"));
    objc_msgSend(v8, "reProbeWithDisk:isEncrypted:", v9, objc_msgSend(v11, "isEncrypted"));

    return *(id *)(a1 + 40);
  }
  else
  {
    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to sync disk from Daemon", (uint8_t *)&v15, 0xCu);
    }

    return 0;
  }
}

id sub_100013E60(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v17[0] = kSKDiskMountOptionRecursive;
  v17[1] = kSKDiskUnmountOptionForce;
  v18[0] = &__kCFBooleanTrue;
  v18[1] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v12 = 0;
  v4 = +[SKUnmountOperation unmountWithDisk:options:error:](SKUnmountOperation, "unmountWithDisk:options:error:", v2, v3, &v12);
  v5 = v12;

  if ((v4 & 1) == 0 && v5)
  {
    v6 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to unmount after repbore %@, %@", buf, 0x16u);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
  objc_msgSend(v9, "setCompletedUnitCount:", 100);

  v10 = *(id *)(a1 + 40);
  return v10;
}

id sub_100013FF8(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v24 = 0;
  v5 = objc_msgSend(v4, "cleanupWithError:", &v24);
  v6 = v24;

  if ((v5 & 1) == 0 && v6)
  {
    v7 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      *(_DWORD *)buf = 138412546;
      v28 = v9;
      v29 = 2112;
      v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v11 = objc_opt_class(SKAPFSDisk);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "container"));

    if (!v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      v26 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v19, 0));
      v17 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v20, a2));

      goto LABEL_13;
    }
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "designatedPhysicalStore"));
    if (!v15)
    {
      v25 = v14;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v21, 0));
      v17 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v22, a2));

      goto LABEL_13;
    }
    v16 = (void *)v15;
    objc_msgSend(*(id *)(a1 + 32), "setDisk:", v15);

  }
  v17 = *(id *)(a1 + 40);
LABEL_13:

  return v17;
}

id sub_100014280(uint64_t a1, uint64_t a2)
{
  SKFilesystemCreator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v4 = objc_opt_new(SKFilesystemCreator);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemCreator progress](v4, "progress"));
  objc_msgSend(v5, "chainChildProgress:withPendingUnitCount:", v6, 50);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toVolumeWithDisk:", v8));
  v13 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  LODWORD(a2) = -[SKFilesystemCreator createWithVolumes:error:](v4, "createWithVolumes:error:", v10, a2);

  if ((_DWORD)a2)
    v11 = *(id *)(a1 + 40);
  else
    v11 = 0;

  return v11;
}

id sub_1000143CC(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  SKPartitionTable *v9;
  void *v10;
  SKPartitionTable *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  v5 = objc_msgSend(v4, "isWholeDisk");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v7 = objc_msgSend(v6, "wipeDiskWithError:", a2);

    if (v7)
      return *(id *)(a1 + 40);
    else
      return 0;
  }
  else
  {
    v9 = [SKPartitionTable alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v11 = -[SKPartitionTable initWithDisk:error:](v9, "initWithDisk:error:", v10, a2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKPartitionTable partitionIDFromDisk:](SKPartitionTable, "partitionIDFromDisk:", v12));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filesystem"));
      v16 = -[SKPartitionTable overwritePartitionAt:filesystem:error:](v11, "overwritePartitionAt:filesystem:error:", v13, v15, a2);

      if (v16)
        v17 = *(id *)(a1 + 40);
      else
        v17 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      v21 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 300, v19, 0));
      v17 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v20, a2));

    }
    return v17;
  }
}

id sub_1000145D8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  SKIOMedia *v61;
  void *v62;
  SKIOMedia *v63;
  void *v64;
  void *v66;
  id v67;
  _QWORD v68[4];
  _QWORD v69[4];
  void *v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  NSObject *v74;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disk"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncDiskFromDaemon:error:", v5, a2));
  objc_msgSend(*(id *)(a1 + 32), "setDisk:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v67 = 0;
    v9 = objc_msgSend(v8, "cleanupWithError:", &v67);
    v10 = v67;

    if ((v9 & 1) == 0 && v10)
    {
      v11 = sub_10000BA9C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
        *(_DWORD *)buf = 138412546;
        v72 = v13;
        v73 = 2112;
        v74 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);

      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v15 = objc_opt_class(SKAPFSStoreDisk);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "container"));
      v18 = objc_msgSend(v17, "isLiveFSAPFSDisk");

      if (v18)
      {
        v19 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v20 = (id)objc_claimAutoreleasedReturnValue(v19);
        goto LABEL_35;
      }
    }
    else
    {

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v24 = objc_opt_class(SKAPFSDisk);
    isKindOfClass = objc_opt_isKindOfClass(v23, v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v27 = v26;
    if ((isKindOfClass & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "diskIdentifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringFromIndex:", 4));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("s")));

      if ((unint64_t)objc_msgSend(v30, "count") <= 1)
      {
        v57 = sub_10000BA9C();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
          v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "diskIdentifier"));
          *(_DWORD *)buf = 136315394;
          v72 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
          v73 = 2114;
          v74 = v60;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s: Invalid BSD name for APFS volume: %{public}@", buf, 0x16u);

        }
        v20 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 22, a2));
        goto LABEL_34;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", 1));
      v32 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v31, "integerValue") - 1));

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "container"));

      v35 = v30;
      v22 = (void *)v32;
      v30 = (void *)v34;
    }
    else
    {
      v36 = objc_opt_class(SKAPFSStoreDisk);
      v37 = objc_opt_isKindOfClass(v27, v36);

      if ((v37 & 1) == 0)
        goto LABEL_28;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "container"));
    }

    if (v30)
    {
      v68[0] = kAPFSVolumeNameKey;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "name"));
      v69[0] = v39;
      v69[1] = v22;
      v66 = v22;
      v68[1] = kAPFSVolumeFSIndexKey;
      v68[2] = kAPFSVolumeCaseSensitiveKey;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "filesystem"));
      v42 = objc_msgSend(v41, "isCaseSensitive");
      v43 = &__kCFBooleanFalse;
      if (v42)
        v43 = &__kCFBooleanTrue;
      v68[3] = kAPFSVolumeCreateSynchronousKey;
      v69[2] = v43;
      v69[3] = &__kCFBooleanTrue;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v44));

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "password"));

      if (v47)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "password"));
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v49, kAPFSVolumeEncryptedKey);

      }
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "diskIdentifier")));
      v51 = APFSVolumeCreate(objc_msgSend(v50, "UTF8String"), v45);

      if ((_DWORD)v51)
      {
        v52 = sub_10000BA9C();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        v22 = v66;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
          *(_DWORD *)buf = 136315394;
          v72 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
          v73 = 2112;
          v74 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s: Failed to create volume %@", buf, 0x16u);

        }
        v20 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithOSStatus:error:](SKError, "nilWithOSStatus:error:", v51, a2));
      }
      else
      {
        v61 = [SKIOMedia alloc];
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "diskIdentifier"));
        v63 = -[SKIOMedia initWithDevName:](v61, "initWithDevName:", v62);

        -[SKIOObject waitIOKitQuiet](v63, "waitIOKitQuiet");
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
        objc_msgSend(v64, "setCompletedUnitCount:", 100);

        v20 = *(id *)(a1 + 40);
        v22 = v66;
      }

      goto LABEL_34;
    }
LABEL_28:
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disk"));
    v70 = v30;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v70, 1));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v55, 0));
    v20 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v56, a2));

LABEL_34:
    goto LABEL_35;
  }
  v21 = sub_10000BA9C();
  v10 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v72 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke_3";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to sync disk from Daemon", buf, 0xCu);
  }
  v20 = 0;
LABEL_35:

  return v20;
}

NSDictionary *__cdecl sub_100015E68(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKBaseDiskArbOperation.m", 118);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

id sub_100017048(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  v6 = sub_10000BA9C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "void _diskArbOperationCallback(DADiskRef, DADissenterRef, void *)";
    v11 = 2112;
    v12 = a1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: diskRef = %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(a3, "diskArbCallbackWithDissenter:", a2);
}

void sub_1000173B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, char a17)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000173E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000173F4(uint64_t a1)
{

}

void sub_1000173FC(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  id obj;
  uint8_t buf[4];
  const char *v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[10], "finished"))
    {
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3[9], "disk"));
      v5 = v3[7];
      v3[7] = (id)v4;

LABEL_10:
      objc_msgSend(v3, "finished");
      goto LABEL_11;
    }
    v9 = v3[10];
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v10 + 40);
    v11 = objc_msgSend(v9, "nextWithError:", &obj);
    objc_storeStrong((id *)(v10 + 40), obj);
    if ((v11 & 1) == 0)
    {
      objc_storeStrong(v3 + 6, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      goto LABEL_10;
    }
    v8 = objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v12 = objc_loadWeakRetained(v3 + 12);
    -[NSObject syncAllDisksWithCompletionBlock:](v8, "syncAllDisksWithCompletionBlock:", v12);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v6, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_1000452A0);

    v7 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SKEraseOperation run]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s: Failed to get strongref from weakself", buf, 0xCu);
    }
  }

LABEL_11:
}

NSDictionary *__cdecl sub_1000175C0(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKEraseOperation.m", 95);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemon sharedDaemon](SKDaemon, "sharedDaemon"));
  objc_msgSend(v1, "startServer");

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v2, "run");

  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_100018814(uint64_t a1)
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v2 = objc_msgSend(v3, "_recacheSyncDisk:", *(_QWORD *)(a1 + 32));

}

void sub_100018950(id a1)
{
  SKDaemonManager *v1;
  void *v2;

  if (sub_10000FA00())
  {
    v1 = objc_alloc_init(SKDaemonManager);
    v2 = (void *)qword_100051AE0;
    qword_100051AE0 = (uint64_t)v1;

  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_100045308);
  }
}

void sub_100018998(id a1)
{
  SKDaemonManager *v1;
  void *v2;

  v1 = objc_alloc_init(SKDaemonManager);
  v2 = (void *)qword_100051AE0;
  qword_100051AE0 = (uint64_t)v1;

}

void sub_100019244(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;
  id v8;

  v2 = dispatch_semaphore_create(0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000192E8;
  v6[3] = &unk_100045330;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "dispatchToWorkThread:", v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t sub_1000192E8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_1000193A8(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "void DiskDisappearedCallback(DADiskRef, void *)";
    v9 = 2112;
    v10 = a1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Received DA disappear notification for %@", (uint8_t *)&v7, 0x16u);
  }

  return objc_msgSend(a2, "_handleDANotificationWithDisk:operation:", a1, off_100051A30);
}

id sub_100019480(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v6 = sub_10000BA9C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "void DiskDescriptionChangedCallback(DADiskRef, CFArrayRef, void *)";
    v11 = 2112;
    v12 = a1;
    v13 = 2114;
    v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Received DA changed notification for %@. Changed keys: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  return objc_msgSend(a3, "_handleDANotificationWithDisk:operation:", a1, off_100051A28);
}

id sub_100019568(void *a1)
{
  id v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = sub_10000BA9C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "void DiskListCompleteCallback(void *)";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Received DA list complete callback", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(a1, "setDiskListCompleteReceived:", 1);
}

id sub_10001961C(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "void DiskAppearedCallback(DADiskRef, void *)";
    v9 = 2112;
    v10 = a1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Received DA appear notification for %@", (uint8_t *)&v7, 0x16u);
  }

  return objc_msgSend(a2, "_handleDANotificationWithDisk:operation:", a1, off_100051A20);
}

void sub_100019798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019814(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019D14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019E80(uint64_t a1)
{
  char *v2;
  SKLastPartitionResizer *v3;
  id v4;
  NSObject *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;

  v2 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootWholeDisk"));
  if (v2)
  {
    v3 = -[SKDiskResizerBase initWithDisk:requestedSize:]([SKLastPartitionResizer alloc], "initWithDisk:requestedSize:", v2, *(_QWORD *)(a1 + 40));
    v4 = sub_10000BA9C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v2;
      v15 = 2048;
      v16 = -[SKLastPartitionResizer currentSize](v3, "currentSize");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current size of %@: %lld bytes", (uint8_t *)&v13, 0x16u);
    }

    v6 = -[SKLastPartitionResizer currentSize](v3, "currentSize") & 0xFFF;
    v7 = -[SKLastPartitionResizer currentSize](v3, "currentSize");
    if (v6)
      v7 = &v7[-(-[SKLastPartitionResizer currentSize](v3, "currentSize") & 0xFFF) + 4096];
    v8 = -[SKDiskResizerBase requestedSize](v3, "requestedSize") & 0xFFF;
    v9 = -[SKDiskResizerBase requestedSize](v3, "requestedSize");
    if (v8)
      v9 = &v9[-(-[SKDiskResizerBase requestedSize](v3, "requestedSize") & 0xFFF) + 4096];
    if (v7 == v9)
    {
      v10 = sub_10000BA9C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Disk was already resized", (uint8_t *)&v13, 0xCu);
      }

    }
    else
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "resize:toSize:completionBlock:", v2, *(_QWORD *)(a1 + 40), &stru_100045378);
    }

  }
}

void sub_10001A05C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSError *v13;

  v2 = a2;
  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
      v12 = 2112;
      v13 = v2;
      v6 = "%s: VM disk resize failed: %@, shutting down";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
    v6 = "%s: VM disk resized successfully, shutting down";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 12;
    goto LABEL_6;
  }

  reboot3(0x8000000000000008);
}

void sub_10001A234(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

id sub_10001A274(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A2C8;
  v3[3] = &unk_100044B78;
  v3[4] = v1;
  return objc_msgSend(v1, "dispatchToWorkThread:", v3);
}

id sub_10001A2C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_diskQueueHeartbeat");
}

void sub_10001A630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

double sub_10001A678(uint64_t a1)
{
  double v2;
  double result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "timeIntervalSinceNow");
  result = -v2;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_10001A6B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_diskQueueWatchdog");
}

void sub_10001A830(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A9D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001ABD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001ABFC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001AC0C(uint64_t a1)
{

}

void sub_10001AC14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_processDiskNotificationsForMap:isCompleteDiskList:", *(_QWORD *)(a1 + 40), 0));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10001AF3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001AFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001B1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001B23C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001B88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_10001B8C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_processDiskNotificationsForMap:isCompleteDiskList:", *(_QWORD *)(a1 + 40), 0));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t sub_10001BA54(uint64_t a1)
{
  id v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_fullRecacheWithDisks:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001BBEC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void **v4;
  uint64_t v5;
  _QWORD *(*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_10001BC7C;
  v7 = &unk_100044ED8;
  v2 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v2;
  objc_msgSend(v8, "dispatchToWorkThread:", &v4);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "finishedSemaphore", v4, v5, v6, v7, v8));
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

}

_QWORD *sub_10001BC7C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  dispatch_time_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *result;
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (!v2 && !*(_QWORD *)(v3 + 96))
  {
    v4 = sub_10000BA9C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v18 = "-[SKDaemonManager _scheduleOperation:]_block_invoke_2";
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Scheduling operation: %@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v7;

    v10 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BE74;
    block[3] = &unk_100044B78;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    v11 = dispatch_time(0, 15000000000);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001BED0;
    v15[3] = &unk_100044B78;
    v15[4] = v12;
    dispatch_after(v11, v13, v15);
    v3 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v3 + 88), "addObject:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD **)(a1 + 32);
  if (!result[12])
    return objc_msgSend(result, "_advanceOperationQueueOnWorkQueue");
  return result;
}

id sub_10001BE74(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001BEC8;
  v3[3] = &unk_100044B78;
  v3[4] = v1;
  return objc_msgSend(v1, "dispatchToWorkThread:", v3);
}

id sub_10001BEC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_diskQueueHeartbeat");
}

id sub_10001BED0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_diskQueueWatchdog");
}

id sub_10001BF28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_advanceOperationQueueOnWorkQueue");
}

void sub_10001C444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001C5D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001C9A0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleDiskRoles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("role")));

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

id sub_10001CAF8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_10000BA9C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timeout waiting for DA idle", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_idleCallback");
}

void sub_10001CD08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CD24(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  char v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  unsigned int v27;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count");
  objc_sync_exit(v2);

  v4 = *(_BYTE *)(a1 + 40);
  if (!v3)
  {
    if (!*(_BYTE *)(a1 + 40))
      goto LABEL_5;
    v4 = 1;
  }
  v5 = *(void **)(a1 + 32);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001CF74;
  v21[3] = &unk_1000454B8;
  v22 = v4;
  v21[4] = v5;
  v21[5] = v3;
  objc_msgSend(v5, "dispatchSyncToWorkThread:", v21);
LABEL_5:
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores"));
  v7 = objc_msgSend(v6, "count") == 0;

  if (!v7)
  {
    v8 = sub_10000BA9C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores"));
      v11 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 136315394;
      v25 = "-[SKDaemonManager _idleCallback]_block_invoke";
      v26 = 1024;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Notifying %u client(s)", buf, 0x12u);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v13);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores"));
    objc_msgSend(v16, "removeAllObjects");

  }
}

void sub_10001CF58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CF74(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;

  v2 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D098;
  v7[3] = &unk_100045490;
  v7[4] = v2;
  v8 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "dispatchSyncToEjectThread:", v7);
  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
      v6 = CFSTR(" (complete disk list)");
    else
      v6 = &stru_100046738;
    *(_DWORD *)buf = 136315650;
    v10 = "-[SKDaemonManager _idleCallback]_block_invoke_2";
    v11 = 1024;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %u DA notification(s) handled%@", buf, 0x1Cu);
  }

}

id sub_10001D098(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDiskNotificationsWithCompleteDiskList:", *(unsigned __int8 *)(a1 + 40));
}

void sub_10001D320(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D714(uint64_t a1)
{
  const void *v2;

  if ((objc_opt_respondsToSelector(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), "dmAsyncFinishedForDisk:mainError:detailError:dictionary:") & 1) != 0)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "dmAsyncFinishedForDisk:mainError:detailError:dictionary:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void sub_10001D810(uint64_t a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  dispatch_semaphore_t v10;

  v2 = dispatch_semaphore_create(0);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diskArbCallbacksQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D8C8;
  v9[3] = &unk_100044ED8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v4 = v2;
  dispatch_async(v3, v9);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v6, v7, v8);

}

void sub_10001D8C8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationsSyncQueue"));
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_10001D990;
  v7 = &unk_100044ED8;
  v3 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  dispatch_async(v2, &v4);

  DAUnregisterCallback(*(DASessionRef *)(*(_QWORD *)(a1 + 32) + 72), j__objc_msgSend__idleCallback, *(void **)(a1 + 32));
  DARegisterIdleCallback(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), j__objc_msgSend__idleCallback, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "startForceIdleTimer", v4, v5, v6, v7, v8);

}

void sub_10001D990(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores"));
    v6 = 136315394;
    v7 = "-[SKDaemonManager syncAllDisksWithCompletionBlock:]_block_invoke_3";
    v8 = 1024;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %d client(s) are now waiting for idle", (uint8_t *)&v6, 0x12u);

  }
}

uint64_t sub_10001DAF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001DBA4(uint64_t a1)
{
  int v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  stat v11;
  uint8_t v12[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  char *v21;

  memset(&v11, 0, sizeof(v11));
  if (!fstatat(-2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), &v11, 544))
  {
    if (devname_r(v11.st_dev, 0x6000u, (char *)buf, 1024))
    {
      v8 = DADiskCreateFromBSDName(0, *(DASessionRef *)(*(_QWORD *)(a1 + 40) + 72), (const char *)buf);
      if (v8)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_diskWithDADisk:", v8));
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v9 = sub_10000BA9C();
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v12 = 136315394;
        v13 = "-[SKDaemonManager diskForPath:withCallbackBlock:]_block_invoke";
        v14 = 2112;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Can't get BSD name for %@", v12, 0x16u);
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  v2 = *__error();
  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = strerror(v2);
    *(_DWORD *)buf = 136315650;
    v17 = "-[SKDaemonManager diskForPath:withCallbackBlock:]_block_invoke";
    v18 = 2112;
    v19 = v5;
    v20 = 2080;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: fstatat of %@ failed: %s", buf, 0x20u);
  }

  v7 = 0;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10001DEF8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wholeDiskForDisk:", *(_QWORD *)(a1 + 40)));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10001DFE8(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "isWholeDisk") & 1) != 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "privateCache"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedChildren"));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
    if (objc_msgSend(v8, "count"))
    {
      v4 = 0;
      do
      {
        v5 = *(void **)(a1 + 40);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v4));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_diskWithDADisk:", v6));

        objc_msgSend(v3, "addObject:", v7);
        ++v4;
      }
      while ((unint64_t)objc_msgSend(v8, "count") > v4);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void sub_10001E184(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastOperationName"));
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);

}

BOOL sub_10001E23C(id a1, SKFilesystem *a2, NSDictionary *a3)
{
  return -[SKFilesystem shouldShow](a2, "shouldShow", a3);
}

uint64_t sub_10001F79C(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dispatchSyncToEjectThread:", &stru_100045598);
  return 0;
}

uint64_t sub_1000208FC(uint64_t a1)
{
  unsigned int v1;

  if (a1)
    v1 = 1;
  else
    v1 = 16;
  if (a1 == 1)
    return 8;
  else
    return v1;
}

uint64_t sub_100020918(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", kSKDiskTypeGPTWholeDisk) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", kSKDiskTypeMBRWholeDisk) & 1) != 0)
  {
    v2 = 8;
  }
  else if (objc_msgSend(v1, "isEqualToString:", kSKDiskTypeAPMWholeDisk))
  {
    v2 = 1;
  }
  else
  {
    v2 = 512;
  }

  return v2;
}

NSDictionary *__cdecl sub_100020AC8(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKPartitionTable.m", 67);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_1000213DC(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKPartitionTable.m", 141);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_100021478(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKPartitionTable.m", 149);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_100021894(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKPartitionTable.m", 180);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_100021930(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKPartitionTable.m", 187);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

void sub_100023018(id a1)
{
  id v1;
  NSObject *v2;
  int v3;
  const char *v4;

  v1 = sub_10000BA9C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection to fsrunner interrupted", (uint8_t *)&v3, 0xCu);
  }

}

void sub_1000230BC(id a1)
{
  id v1;
  NSObject *v2;
  int v3;
  const char *v4;

  v1 = sub_10000BA9C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection to fsrunner invalidated", (uint8_t *)&v3, 0xCu);
  }

}

void sub_100023394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000233B8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000233C8(uint64_t a1)
{

}

void sub_1000233D0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1000233E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

NSDictionary *__cdecl sub_100023984(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKFilesystemMaintainer.m", 204);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

id sub_1000240D8(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v5 = a1;
  v15 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000233B8;
  v13 = sub_1000233C8;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000241E0;
  v8[3] = &unk_100045710;
  v8[4] = &v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOptionsBundle bundleForArguments:count:extension:operationType:errorHandler:](FSTaskOptionsBundle, "bundleForArguments:count:extension:operationType:errorHandler:", &v15, 0, v5, a2, v8));
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1000241C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000241E0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v3 = a2;
  v4 = sub_10000BA9C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "FSTaskOptionsBundle *createOptionsBundle(NSString *__strong, FSTaskType, NSError *__autoreleasing *)_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Error in creating options bundle %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_1000249BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100024BEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10000BA9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[SKFilesystemMaintainer createReceiverUsingFSKit:opts:taskGroup:writable:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to perform maintenance with %@", buf, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "msgHandler"));
    objc_msgSend(v9, "setError:", v6);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "client"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100024D60;
  v12[3] = &unk_100045738;
  v11 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v11;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v10, "getFSProgressForTask:replyHandler:", v5, v12);

}

void sub_100024D60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disks"));
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v8, 0x64 / (unint64_t)objc_msgSend(v9, "count"));

  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "disks"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 0x64 / (unint64_t)objc_msgSend(v11, "count")));
    objc_msgSend(v10, "addChild:withPendingUnitCount:", v12, 0);

    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 136315650;
      v17 = "-[SKFilesystemMaintainer createReceiverUsingFSKit:opts:taskGroup:writable:]_block_invoke";
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to get progress for %@, %@", (uint8_t *)&v16, 0x20u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

BOOL sub_100025578(id a1, SKDisk *a2, NSDictionary *a3)
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](a2, "filesystem", a3));
  v4 = v3 == 0;

  return v4;
}

NSArray *__cdecl sub_1000257DC(id a1, SKDisk *a2, id *a3)
{
  SKDisk *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v3 = a2;
  v4 = -[SKDisk isWritable](v3, "isWritable");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](v3, "filesystem"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "verificationArgs"));
  v7 = (void *)v6;
  if (v4)
  {
    v13[0] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](v3, "filesystem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "liveVerificationArgs"));
    v13[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

  }
  else
  {
    v12 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  }

  return (NSArray *)v10;
}

NSArray *__cdecl sub_100025CE0(id a1, SKDisk *a2, id *a3)
{
  SKDisk *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  SKDisk *v15;
  uint64_t v16;
  void *v17;

  v4 = a2;
  v16 = kSKDiskMountOptionRecursive;
  v17 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  LOBYTE(a3) = -[SKDisk unmountWithOptions:error:](v4, "unmountWithOptions:error:", v5, a3);

  if ((a3 & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](v4, "filesystem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject repairArgs](v6, "repairArgs"));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  }
  else
  {
    v9 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SKFilesystemMaintainer repairWithError:]_block_invoke";
      v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to unmount disk %@ for repair", buf, 0x16u);
    }
    v8 = 0;
  }

  return (NSArray *)v8;
}

void sub_100026074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002608C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  id v31;

  v5 = a2;
  v6 = a3;
  v7 = sub_10000BA9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskID"));
      *(_DWORD *)buf = 136315906;
      v25 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke";
      v26 = 2112;
      v27 = v10;
      v28 = 1024;
      v29 = objc_msgSend(v5, "taskState");
      v30 = 2112;
      v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Task update %@ received, state %d, error: %@", buf, 0x26u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskID"));
    *(_DWORD *)buf = 136315650;
    v25 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke";
    v26 = 2112;
    v27 = v11;
    v28 = 1024;
    v29 = objc_msgSend(v5, "taskState");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Task update %@ received, state %d", buf, 0x1Cu);

  }
  if (objc_msgSend(v5, "taskState") == 3)
  {
    v12 = *(id *)(a1 + 32);
    objc_sync_enter(v12);
    v13 = *(void **)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("msgHandler.taskID == %@"), v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v15));

    if (objc_msgSend(v16, "count") == (id)1)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject msgHandler](v17, "msgHandler"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "group"));
      dispatch_group_leave(v19);

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
      objc_msgSend(v20, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_100045820);

      v21 = sub_10000BA9C();
      v17 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskID"));
        v23 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 136315650;
        v25 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke_2";
        v26 = 2112;
        v27 = v22;
        v28 = 1024;
        v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s: Task %@ completed, matching tasks: %d", buf, 0x1Cu);

      }
    }

    objc_sync_exit(v12);
  }

}

void sub_1000263B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_1000263D8(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("faultCode");
  v1 = sub_10000BA24((uint64_t)"SKFilesystemMaintainer.m", 685);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return (NSDictionary *)v3;
}

void sub_100026474(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v4 = a2;
  if (v4)
  {
    v5 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke";
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed setting task update handler: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100026F48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026F64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = sub_10000BA9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SKFilesystemCreator createWithVolumes:error:]_block_invoke";
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Reached reply of task %@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "msgHandler"));
  objc_msgSend(v9, "setTaskID:", v5);

  if (v6)
  {
    v10 = sub_10000BA9C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SKFilesystemCreator createWithVolumes:error:]_block_invoke";
      v21 = 2112;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Failed to format: %@", buf, 0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "msgHandler"));
    objc_msgSend(v12, "completed:replyHandler:", v6, &stru_1000458B0);

  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100027148;
    v16[3] = &unk_100045738;
    v13 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 64);
    v17 = v14;
    v18 = v15;
    objc_msgSend(v13, "getFSProgressForTask:replyHandler:", v5, v16);

  }
}

void sub_100027148(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "progress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v8, 0x64 / (unint64_t)objc_msgSend(a1[5], "count"));

  }
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "progress"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 0));
    objc_msgSend(v9, "addChild:withPendingUnitCount:", v10, 0x64 / (unint64_t)objc_msgSend(a1[5], "count"));

    v11 = sub_10000BA9C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "disk"));
      v14 = 136315650;
      v15 = "-[SKFilesystemCreator createWithVolumes:error:]_block_invoke_2";
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to get progress for %@, %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

void sub_1000272DC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "progress"));
    objc_msgSend(v4, "setLocalizedAdditionalDescription:", v3);

  }
}

void sub_100027330(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "progress"));
    objc_msgSend(v4, "setLocalizedAdditionalDescription:", v3);

  }
}

void sub_1000281D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002831C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028514(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028848(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "childrenOperations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v2, "_processNotificationWithDiskOperation:", v3);

}

void sub_100028C28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "notificationsCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "disksToProcess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v2, "_processNotificationsWithDiskOperations:", v4);

}

void sub_10002965C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_10002A8D4(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);

  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callbackBlock"));
  v2[2](v2, 0);

  return objc_msgSend(*(id *)(a1 + 32), "finished");
}

void sub_10002ACAC(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), _NSProgressRemoteLocalizedAdditionalDescriptionKey);

}

void sub_10002B8F8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  const char *v7;

  v2 = sub_10000BA9C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SKLastPartitionResizer fsResize:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Cancelling APFS resize", (uint8_t *)&v6, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resizablePart"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskIdentifier")));
  APFSCancelContainerResize(objc_msgSend(v5, "UTF8String"));

}

uint64_t _deleteVolumeGroup(void *a1, void *a2, uint64_t a3, NSObject **a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t Volumes;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject **v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  NSObject *v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[18];
  __int16 v44;
  int v45;

  v9 = a1;
  v10 = objc_retainAutorelease(a2);
  v11 = objc_msgSend(v10, "UTF8String");
  v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a3);
  v38 = 0;
  Volumes = APFSContainerVolumeGroupGetVolumes(v11, a3, &v38);
  if ((_DWORD)Volumes)
  {
    v14 = Volumes;
    v15 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNumber"
            " *> *__autoreleasing *, NSString *__autoreleasing *)";
      v42 = 2114;
      *(_QWORD *)v43 = v12;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)&v43[10] = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to get volumes in group %{public}@, res=%d", buf, 0x1Cu);
    }
  }
  else
  {
    v16 = v38;
    v17 = sub_10000BA9C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[NSObject count](v16, "count");
      *(_DWORD *)buf = 136315650;
      v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNumber"
            " *> *__autoreleasing *, NSString *__autoreleasing *)";
      v42 = 1024;
      *(_DWORD *)v43 = v19;
      *(_WORD *)&v43[4] = 2114;
      *(_QWORD *)&v43[6] = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: There are %d volumes in group %{public}@", buf, 0x1Cu);
    }

    if (-[NSObject count](v16, "count") == (id)2)
    {
      v20 = APFSContainerVolumeGroupRemove(v11, a3);
      if ((_DWORD)v20)
      {
        v14 = v20;
        v21 = sub_10000BA9C();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNu"
                "mber *> *__autoreleasing *, NSString *__autoreleasing *)";
          v42 = 2114;
          *(_QWORD *)v43 = v12;
          *(_WORD *)&v43[8] = 2114;
          *(_QWORD *)&v43[10] = v10;
          v44 = 1024;
          v45 = v14;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to remove volume group %{public}@ from %{public}@, res = %d", buf, 0x26u);
        }

      }
      else
      {
        v33 = a4;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v23 = v16;
        v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v35;
          while (2)
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v26)
                objc_enumerationMutation(v23);
              v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@s%@"), v10, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i));
              if ((objc_msgSend(v28, "isEqualToString:", v9) & 1) == 0)
              {
                v29 = objc_retainAutorelease(v28);
                *a5 = v29;

                goto LABEL_22;
              }

            }
            v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
            if (v25)
              continue;
            break;
          }
        }
LABEL_22:

        v30 = sub_10000BA9C();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNu"
                "mber *> *__autoreleasing *, NSString *__autoreleasing *)";
          v42 = 2114;
          *(_QWORD *)v43 = v12;
          *(_WORD *)&v43[8] = 2114;
          *(_QWORD *)&v43[10] = v10;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: Volume group %{public}@ removed from %{public}@", buf, 0x20u);
        }

        v16 = objc_retainAutorelease(v23);
        v14 = 0;
        *v33 = v16;
      }
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

uint64_t SK_DM_APFSUtils_deleteVolume(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  int v12;
  BOOL v13;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  int v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  NSObject *v37;
  int v39;
  __int16 v40;
  id v41;
  NSObject *v42;
  __int16 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = a1;
  v54 = 0;
  v55 = 0;
  v52 = 0;
  v53 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringFromIndex:", 4));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("s")));

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("disk%@"), v4));

  }
  v6 = objc_retainAutorelease(v1);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "UTF8String");
  v10 = 22;
  if (v7)
  {
    v11 = v9;
    if (v9)
    {
      v12 = APFSGetVolumeGroupID(v7, &v54);
      if (v12)
        v13 = 0;
      else
        v13 = v54 != v52 || v55 != v53;
      v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v54);
      v16 = sub_10000BA9C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
        v46 = 2114;
        v47 = v6;
        v48 = 2114;
        v49 = v15;
        v50 = 1024;
        v51 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Volume %{public}@, group %{public}@ (get volume group res = %d)", buf, 0x26u);
      }

      if (v13)
      {
        v43 = 0;
        v18 = APFSVolumeRole(v7, &v43, 0);
        if (v18)
        {
          v19 = sub_10000BA9C();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
            v46 = 2114;
            v47 = v6;
            v48 = 1024;
            LODWORD(v49) = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to get APFS volume role for %{public}@, res = %d, assuming role = none", buf, 0x1Cu);
          }

        }
        v41 = 0;
        v42 = 0;
        v10 = _deleteVolumeGroup(v6, v8, (uint64_t)&v54, &v42, &v41);
        v21 = v42;
        v22 = v41;
        if (!(_DWORD)v10)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_cachedDiskWithDiskIdentifier:", v22));

          if (!v24)
          {
            v25 = sub_10000BA9C();
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
              v46 = 2114;
              v47 = v22;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: Failed to find %{public}@ in SK cache", buf, 0x16u);
            }

            v24 = objc_opt_new(NSObject);
          }
          v27 = v24;
          objc_sync_enter(v27);
          v10 = APFSVolumeDelete(v7);
          v28 = sub_10000BA9C();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
            v46 = 2114;
            v47 = v6;
            v48 = 2114;
            v49 = v15;
            v50 = 1024;
            v51 = v10;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Delete of APFS volume %{public}@ of group %{public}@ returned %d", buf, 0x26u);
          }

          if ((_DWORD)v10)
          {
            v30 = APFSContainerVolumeGroupAdd(v11, v21, &v54);
            v31 = sub_10000BA9C();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
              v46 = 2114;
              v47 = v15;
              v48 = 1024;
              LODWORD(v49) = v30;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Volume group %{public}@ restore returned %d", buf, 0x1Cu);
            }

          }
          else
          {
            v40 = 0;
            v35 = objc_retainAutorelease(v22);
            v39 = APFSVolumeRole(objc_msgSend(v35, "UTF8String"), 0, &v40);
            v36 = sub_10000BA9C();
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
              v46 = 2114;
              v47 = v35;
              v48 = 1024;
              LODWORD(v49) = v39;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: Remove volume role for %{public}@ returned %d", buf, 0x1Cu);
            }

          }
          objc_sync_exit(v27);

        }
      }
      else
      {
        v10 = APFSVolumeDelete(v7);
        v33 = sub_10000BA9C();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v45 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
          v46 = 2114;
          v47 = v6;
          v48 = 1024;
          LODWORD(v49) = v10;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: Delete of APFS volume %{public}@ returned %d", buf, 0x1Cu);
        }

      }
    }
  }

  return v10;
}

void sub_10002C5F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SK_DM_updateFileVaultProperties(void *a1, char a2)
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C6C8;
  v4[3] = &unk_100045978;
  v7 = a2;
  v5 = a1;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v2 = v6;
  v3 = v5;
  objc_msgSend(v2, "dispatchToWorkThread:", v4);

}

void sub_10002C6C8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;

  v2 = sub_10000BA9C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v40 = "void SK_DM_updateFileVaultProperties(NSString *__strong, BOOL)_block_invoke";
    v41 = 2114;
    v42 = v4;
    v43 = 1024;
    v44 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Updating FileVault property of %{public}@ (and group members) to %d", buf, 0x1Cu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_cachedDiskWithDiskIdentifier:", *(_QWORD *)(a1 + 32)));
  v7 = objc_opt_class(SKAPFSDisk);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "container"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "apfsVolumeGroupUUID"));
      v11 = objc_opt_new(NSMutableArray);
      v12 = v11;
      if (v10)
      {
        v27 = v8;
        v28 = v6;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v26 = v9;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "volumes"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v34 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "apfsVolumeGroupUUID"));
              v20 = objc_msgSend(v10, "isEqual:", v19);

              if (v20)
                -[NSMutableArray addObject:](v12, "addObject:", v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v15);
        }

        v8 = v27;
        v6 = v28;
        v9 = v26;
      }
      else
      {
        -[NSMutableArray addObject:](v11, "addObject:", v8);
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = v12;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), "setDefaultEffaceable:", *(_BYTE *)(a1 + 48) == 0);
          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v23);
      }

      objc_msgSend(*(id *)(a1 + 40), "_disksChanged:", v21);
    }

  }
}

void sub_10002C9B0()
{
  __assert_rtn("+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]", "SKStateMachine.m", 85, "[target respondsToSelector:entry.selector]");
}

void sub_10002C9D8()
{
  __assert_rtn("+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]", "SKStateMachine.m", 83, "events[entry.event] == nil");
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BSDName");
}

id objc_msgSend_DAstatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DAstatus");
}

id objc_msgSend_DAstatusString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DAstatusString");
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

id objc_msgSend__addToExtendedDiskInfoCacheWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addToExtendedDiskInfoCacheWithDictionary:");
}

id objc_msgSend__advanceOperationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_advanceOperationQueue");
}

id objc_msgSend__advanceOperationQueueOnWorkQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_advanceOperationQueueOnWorkQueue");
}

id objc_msgSend__cacheCanSupportRecoveryPartitionWithWholeDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheCanSupportRecoveryPartitionWithWholeDisk:");
}

id objc_msgSend__cacheContainerInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheContainerInfo");
}

id objc_msgSend__cacheFilesystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheFilesystem");
}

id objc_msgSend__cacheInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheInfo");
}

id objc_msgSend__cacheInfoForDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheInfoForDADisk:");
}

id objc_msgSend__cacheInfoWithDiskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheInfoWithDiskDescription:");
}

id objc_msgSend__cacheInfoWithIOMedia_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheInfoWithIOMedia:");
}

id objc_msgSend__cacheIsWholeDiskWithDiskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheIsWholeDiskWithDiskDescription:");
}

id objc_msgSend__cacheNoFilesystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheNoFilesystem");
}

id objc_msgSend__cacheSpacesWithPurgeable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheSpacesWithPurgeable:");
}

id objc_msgSend__cacheVolumeGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheVolumeGroup");
}

id objc_msgSend__cachedDiskWithDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cachedDiskWithDADisk:");
}

id objc_msgSend__cachedDiskWithDiskIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cachedDiskWithDiskIdentifier:");
}

id objc_msgSend__deepUnmountWithWholeDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deepUnmountWithWholeDisk:");
}

id objc_msgSend__diskOperationIdentifierWithDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_diskOperationIdentifierWithDADisk:");
}

id objc_msgSend__diskWithDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_diskWithDADisk:");
}

id objc_msgSend__disksAppeared_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disksAppeared:");
}

id objc_msgSend__disksChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disksChanged:");
}

id objc_msgSend__disksDisappeared_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disksDisappeared:");
}

id objc_msgSend__fastRecacheWithDisks_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fastRecacheWithDisks:options:");
}

id objc_msgSend__filesystemForDMFilesystemType_isEncrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filesystemForDMFilesystemType:isEncrypted:");
}

id objc_msgSend__filesystemForIOContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filesystemForIOContent:");
}

id objc_msgSend__filesystemForUnlocalizedName_dmPersonality_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filesystemForUnlocalizedName:dmPersonality:");
}

id objc_msgSend__firstFilesystemForMajorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_firstFilesystemForMajorType:");
}

id objc_msgSend__fullRecacheWithDisks_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fullRecacheWithDisks:options:");
}

id objc_msgSend__getFilesystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getFilesystem");
}

id objc_msgSend__getIdentifierForStat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getIdentifierForStat");
}

id objc_msgSend__getOwnerUsingStat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getOwnerUsingStat");
}

id objc_msgSend__handleDANotificationWithDisk_operation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDANotificationWithDisk:operation:");
}

id objc_msgSend__idleCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_idleCallback");
}

id objc_msgSend__invalidateExtendedDiskInfoCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateExtendedDiskInfoCache");
}

id objc_msgSend__notifyLockedDisksNotificationsWaitersWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyLockedDisksNotificationsWaitersWithDisk:");
}

id objc_msgSend__performDiskStateUpdateSelector_onListener_withDisks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performDiskStateUpdateSelector:onListener:withDisks:");
}

id objc_msgSend__processAppearedOrChangedWithDisk_operation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processAppearedOrChangedWithDisk:operation:");
}

id objc_msgSend__processDiskNotificationsForMap_isCompleteDiskList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processDiskNotificationsForMap:isCompleteDiskList:");
}

id objc_msgSend__processNotificationWithDiskOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processNotificationWithDiskOperation:");
}

id objc_msgSend__processNotificationsWithDiskOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processNotificationsWithDiskOperations:");
}

id objc_msgSend__recacheSyncDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recacheSyncDisk:");
}

id objc_msgSend__safe_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_safe_object:");
}

id objc_msgSend__scheduleGenericOperationWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleGenericOperationWithCompletionBlock:");
}

id objc_msgSend__scheduleOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleOperation:");
}

id objc_msgSend__supportsRecaching(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsRecaching");
}

id objc_msgSend__unmountWithDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unmountWithDADisk:");
}

id objc_msgSend__unmountWithDisk_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unmountWithDisk:error:");
}

id objc_msgSend__wholeDisksToEject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wholeDisksToEject");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_activeClientsTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeClientsTransaction");
}

id objc_msgSend_activeFSM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeFSM");
}

id objc_msgSend_addAppearedDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAppearedDisk:");
}

id objc_msgSend_addChangedDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChangedDisk:");
}

id objc_msgSend_addChild_withPendingUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChild:withPendingUnitCount:");
}

id objc_msgSend_addDisappearedDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDisappearedDisk:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addListener:");
}

id objc_msgSend_addMissingDisappearedDisks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMissingDisappearedDisks");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOption:");
}

id objc_msgSend_addPort_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPort:forMode:");
}

id objc_msgSend_allDisks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDisks");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allocateMediaRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocateMediaRef:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_apfsContainerIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apfsContainerIdentifier");
}

id objc_msgSend_apfsContainerUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apfsContainerUUID");
}

id objc_msgSend_apfsRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apfsRole");
}

id objc_msgSend_apfsUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apfsUUID");
}

id objc_msgSend_apfsVolumeGroupUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apfsVolumeGroupUUID");
}

id objc_msgSend_appearedDisks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearedDisks");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attempt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attempt");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticateOnInit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateOnInit");
}

id objc_msgSend_authorizeRequestForRoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizeRequestForRoot");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boosterQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boosterQueue");
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buffer");
}

id objc_msgSend_buildFilesystems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildFilesystems");
}

id objc_msgSend_buildWithScheme_sectorSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildWithScheme:sectorSize:");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleForArguments_count_extension_operationType_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForArguments:count:extension:operationType:errorHandler:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cacheEncryptionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheEncryptionInfo");
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callback");
}

id objc_msgSend_callbackBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callbackBlock");
}

id objc_msgSend_canPartitionDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPartitionDisk");
}

id objc_msgSend_canResize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canResize");
}

id objc_msgSend_canUpdateDiskIdentifierWithDiskInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canUpdateDiskIdentifierWithDiskInfo:");
}

id objc_msgSend_cancelWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelWithError:");
}

id objc_msgSend_caseSensitive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseSensitive");
}

id objc_msgSend_chainChildProgress_withPendingUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chainChildProgress:withPendingUnitCount:");
}

id objc_msgSend_changedDisks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedDisks");
}

id objc_msgSend_checkPrivilegeLevelWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkPrivilegeLevelWithConnection:");
}

id objc_msgSend_checkResource_usingBundle_options_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResource:usingBundle:options:connection:replyHandler:");
}

id objc_msgSend_childDisksForWholeDisk_withCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childDisksForWholeDisk:withCallbackBlock:");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "children");
}

id objc_msgSend_childrenOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childrenOperations");
}

id objc_msgSend_cleanupWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupWithError:");
}

id objc_msgSend_clearMountState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearMountState:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_clientConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnections");
}

id objc_msgSend_clientUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientUID");
}

id objc_msgSend_collectFilesystemsWithPersonalityMapping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectFilesystemsWithPersonalityMapping:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeDiskArbOp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeDiskArbOp");
}

id objc_msgSend_completed_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completed:replyHandler:");
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedUnitCount");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectionToService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionToService");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "container");
}

id objc_msgSend_containerBSDName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerBSDName");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentMask");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDesignatedPhysicalStoreUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDesignatedPhysicalStoreUUID");
}

id objc_msgSend_copyExtendedDiskInfoWithDiskIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyExtendedDiskInfoWithDiskIdentifier:");
}

id objc_msgSend_copyExtendedSpaceInfoWithDiskIdentifier_containerBSDName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyExtendedSpaceInfoWithDiskIdentifier:containerBSDName:");
}

id objc_msgSend_copyHumanIOContentWithMediaDict_isWholeDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyHumanIOContentWithMediaDict:isWholeDisk:");
}

id objc_msgSend_copyMountURLWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyMountURLWithDisk:");
}

id objc_msgSend_copyNextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyNextObject");
}

id objc_msgSend_copyParent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyParent");
}

id objc_msgSend_copyParentPropertyWithClass_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyParentPropertyWithClass:key:");
}

id objc_msgSend_copyPhysicalStoresIOMedia(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPhysicalStoresIOMedia");
}

id objc_msgSend_copyPhysicalStoresMediaWithDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPhysicalStoresMediaWithDADisk:");
}

id objc_msgSend_copyPhysicalStoresUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPhysicalStoresUUIDs");
}

id objc_msgSend_copyProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyProperties");
}

id objc_msgSend_copyPropertyWithClass_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPropertyWithClass:key:");
}

id objc_msgSend_copySortedChildrenWithDADisk_ioMedia_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySortedChildrenWithDADisk:ioMedia:");
}

id objc_msgSend_copyUpdatedDADiskForDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUpdatedDADiskForDisk:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_counter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "counter");
}

id objc_msgSend_createDASession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDASession");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createMediaRefWithDisk_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMediaRefWithDisk:error:");
}

id objc_msgSend_createReceiverUsingFSKit_opts_taskGroup_writable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createReceiverUsingFSKit:opts:taskGroup:writable:");
}

id objc_msgSend_createStateMachineWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createStateMachineWithError:");
}

id objc_msgSend_createWithVolumes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWithVolumes:error:");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentOperationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentOperationName");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSize");
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentThread");
}

id objc_msgSend_daDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daDisk");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultEffaceable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultEffaceable");
}

id objc_msgSend_defaultErrorCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultErrorCode");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delayedAPFSDiskNotificationWithDisk_wholeDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayedAPFSDiskNotificationWithDisk:wholeDisk:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_descriptorWithVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorWithVolume:");
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptors");
}

id objc_msgSend_designatedPhysicalStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "designatedPhysicalStore");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disappearedDisks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disappearedDisks");
}

id objc_msgSend_disk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disk");
}

id objc_msgSend_diskArbCallbackWithDissenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskArbCallbackWithDissenter:");
}

id objc_msgSend_diskArbCallbacksQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskArbCallbacksQueue");
}

id objc_msgSend_diskArbOpDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskArbOpDone");
}

id objc_msgSend_diskArbSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskArbSession");
}

id objc_msgSend_diskForPath_withCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskForPath:withCallbackBlock:");
}

id objc_msgSend_diskForString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskForString:");
}

id objc_msgSend_diskHasMutated_rawIOContent_diskDesc_mediaUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskHasMutated:rawIOContent:diskDesc:mediaUUID:");
}

id objc_msgSend_diskIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskIdentifier");
}

id objc_msgSend_diskIsSnapshot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskIsSnapshot:");
}

id objc_msgSend_diskListCompleteReceived(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskListCompleteReceived");
}

id objc_msgSend_diskObjectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskObjectID");
}

id objc_msgSend_diskRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskRepresentation");
}

id objc_msgSend_diskToEject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskToEject");
}

id objc_msgSend_diskWithFSRefresh_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskWithFSRefresh:");
}

id objc_msgSend_disks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disks");
}

id objc_msgSend_disksForOperationWithTarget_ignoreGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disksForOperationWithTarget:ignoreGroup:");
}

id objc_msgSend_disksNotificationsWaiters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disksNotificationsWaiters");
}

id objc_msgSend_disksToMount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disksToMount");
}

id objc_msgSend_disksToProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disksToProcess");
}

id objc_msgSend_disksToUnmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disksToUnmount");
}

id objc_msgSend_dispatchBoostedToWorkThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchBoostedToWorkThread:");
}

id objc_msgSend_dispatchSyncToEjectThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchSyncToEjectThread:");
}

id objc_msgSend_dispatchSyncToWorkThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchSyncToWorkThread:");
}

id objc_msgSend_dispatchToWorkThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchToWorkThread:");
}

id objc_msgSend_dispatchWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchWithBlock:");
}

id objc_msgSend_dispatchWithGroup_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchWithGroup:block:");
}

id objc_msgSend_dissenterPID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dissenterPID");
}

id objc_msgSend_dmAsyncFinishedForDisk_mainError_detailError_dictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmAsyncFinishedForDisk:mainError:detailError:dictionary:");
}

id objc_msgSend_dmAsyncMessageForDisk_string_dictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmAsyncMessageForDisk:string:dictionary:");
}

id objc_msgSend_dmPersonality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmPersonality");
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveGroupIdentifier");
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserIdentifier");
}

id objc_msgSend_ejectDisk_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ejectDisk:withCompletionBlock:");
}

id objc_msgSend_endedSuccessfully(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endedSuccessfully");
}

id objc_msgSend_entriesMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entriesMap");
}

id objc_msgSend_entryForState_event_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryForState:event:");
}

id objc_msgSend_entryWithState_event_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryWithState:event:action:");
}

id objc_msgSend_entryWithState_event_action_nextState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryWithState:event:action:nextState:");
}

id objc_msgSend_entryWithState_event_selector_nextState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryWithState:event:selector:nextState:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eraseDiskWithRootDisk_descriptors_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseDiskWithRootDisk:descriptors:error:");
}

id objc_msgSend_eraseWithEraser_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseWithEraser:completionBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithCode_debugDescription_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:debugDescription:error:");
}

id objc_msgSend_errorWithCode_disks_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:disks:userInfo:");
}

id objc_msgSend_errorWithCode_underlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:underlyingError:");
}

id objc_msgSend_errorWithCode_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:userInfo:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithOSStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithOSStatus:error:");
}

id objc_msgSend_errorWithPOSIXCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithPOSIXCode:error:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "event");
}

id objc_msgSend_eventFromSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventFromSize");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_expectedDiskIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedDiskIdentifier");
}

id objc_msgSend_extensionFilesystemsMapping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionFilesystemsMapping");
}

id objc_msgSend_failWithError_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithError:error:");
}

id objc_msgSend_failWithPOSIXCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithPOSIXCode:error:");
}

id objc_msgSend_failWithSKErrorCode_debugDescription_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithSKErrorCode:debugDescription:error:");
}

id objc_msgSend_failWithSKErrorCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithSKErrorCode:error:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReading");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filesystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystem");
}

id objc_msgSend_filesystemFor_caseSensitive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemFor:caseSensitive:");
}

id objc_msgSend_filesystemFor_caseSensitive_encrypted_isExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemFor:caseSensitive:encrypted:isExtension:");
}

id objc_msgSend_filesystemType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemType");
}

id objc_msgSend_filesystemWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemWithType:");
}

id objc_msgSend_filesystemsWithCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemsWithCallbackBlock:");
}

id objc_msgSend_filterEFIWithDisks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEFIWithDisks:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finished");
}

id objc_msgSend_finishedSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedSemaphore");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flushMediaRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushMediaRef");
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "force");
}

id objc_msgSend_formatAPFSWithName_diskIdentifier_caseSensitive_password_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatAPFSWithName:diskIdentifier:caseSensitive:password:withReply:");
}

id objc_msgSend_formatArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatArgs");
}

id objc_msgSend_formatExecutable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatExecutable");
}

id objc_msgSend_formatResource_usingBundle_options_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatResource:usingBundle:options:connection:replyHandler:");
}

id objc_msgSend_frameworkBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameworkBundle");
}

id objc_msgSend_freeSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeSpace");
}

id objc_msgSend_fs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs");
}

id objc_msgSend_fsInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fsInfo");
}

id objc_msgSend_fsType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fsType");
}

id objc_msgSend_getAPFSVolumeRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAPFSVolumeRole");
}

id objc_msgSend_getConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConnection");
}

id objc_msgSend_getDataVolumeBSD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDataVolumeBSD");
}

id objc_msgSend_getFSProgressForTask_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFSProgressForTask:replyHandler:");
}

id objc_msgSend_getMediaKitFilesystemInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMediaKitFilesystemInfo:");
}

id objc_msgSend_getMediaKitFilesystemType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMediaKitFilesystemType:");
}

id objc_msgSend_getMountState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMountState:");
}

id objc_msgSend_getSectorSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSectorSize");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "group");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hfsMinimalSizeForDisk_currentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hfsMinimalSizeForDisk:currentSize:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCallback:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDADisk:");
}

id objc_msgSend_initWithDADisk_isLiveFSContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDADisk:isLiveFSContainer:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDevName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevName:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:");
}

id objc_msgSend_initWithDisk_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:error:");
}

id objc_msgSend_initWithDisk_filesystem_name_password_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:filesystem:name:password:");
}

id objc_msgSend_initWithDisk_name_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:name:withCompletionBlock:");
}

id objc_msgSend_initWithDisk_options_connection_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:options:connection:completionBlock:");
}

id objc_msgSend_initWithDisk_options_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:options:withCompletionBlock:");
}

id objc_msgSend_initWithDisk_requestedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:requestedSize:");
}

id objc_msgSend_initWithDisk_toSize_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:toSize:withCompletionBlock:");
}

id objc_msgSend_initWithDisk_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisk:withCompletionBlock:");
}

id objc_msgSend_initWithDiskIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDiskIdentifier:");
}

id objc_msgSend_initWithDiskOperationMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDiskOperationMap:");
}

id objc_msgSend_initWithDisks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisks:");
}

id objc_msgSend_initWithEraser_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEraser:withCompletionBlock:");
}

id objc_msgSend_initWithFSInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFSInfo:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIOObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIOObject:");
}

id objc_msgSend_initWithIOObject_retain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIOObject:retain:");
}

id objc_msgSend_initWithIteratorNext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIteratorNext:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessageHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessageHandler:");
}

id objc_msgSend_initWithMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMountPoint:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_disk_caseSensitive_password_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:disk:caseSensitive:password:");
}

id objc_msgSend_initWithPhysicalStoreDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhysicalStoreDisk:");
}

id objc_msgSend_initWithProgress_dispatchGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgress:dispatchGroup:");
}

id objc_msgSend_initWithSKIOObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSKIOObject:");
}

id objc_msgSend_initWithServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:options:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:selector:object:");
}

id objc_msgSend_initWithTaskPairs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTaskPairs:");
}

id objc_msgSend_initWithTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTasks:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedLongLong:");
}

id objc_msgSend_initWithWaitables_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWaitables:");
}

id objc_msgSend_initWithWholeDiskOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWholeDiskOperation:");
}

id objc_msgSend_innerDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "innerDescriptor");
}

id objc_msgSend_installedFilesystemsMapping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedFilesystemsMapping");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidated");
}

id objc_msgSend_ioContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioContent");
}

id objc_msgSend_ioObj(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioObj");
}

id objc_msgSend_ioObjectWithClassName_iterateParents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioObjectWithClassName:iterateParents:");
}

id objc_msgSend_isBusy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBusy:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCaseSensitive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCaseSensitive");
}

id objc_msgSend_isDiskImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiskImage");
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEncrypted");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExtension");
}

id objc_msgSend_isExternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExternal");
}

id objc_msgSend_isIOMediaDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIOMediaDisk");
}

id objc_msgSend_isIOMediaStoreWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIOMediaStoreWithDisk:");
}

id objc_msgSend_isIOSRootSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIOSRootSnapshot");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternal");
}

id objc_msgSend_isJournaled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isJournaled");
}

id objc_msgSend_isLIFSAPFSWithDiskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLIFSAPFSWithDiskDescription:");
}

id objc_msgSend_isLiveFSAPFSDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLiveFSAPFSDisk");
}

id objc_msgSend_isLiveFSContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLiveFSContainer");
}

id objc_msgSend_isLiveFSStoreWithRawIOContent_diskDesc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLiveFSStoreWithRawIOContent:diskDesc:");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isOSInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOSInternal");
}

id objc_msgSend_isPhysicalDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPhysicalDisk");
}

id objc_msgSend_isRealEFIPartition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRealEFIPartition");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrusted");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isValidName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidName:error:");
}

id objc_msgSend_isVirtualDiskType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVirtualDiskType");
}

id objc_msgSend_isWholeDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWholeDisk");
}

id objc_msgSend_isWritable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWritable");
}

id objc_msgSend_isiOSRootSnapshotWithDiskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiOSRootSnapshotWithDiskDescription:");
}

id objc_msgSend_knownDiskForDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownDiskForDictionary:");
}

id objc_msgSend_lastDiskObjectIDLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDiskObjectIDLock");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastOperationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastOperationName");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launch");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lineData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineData");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_liveDiskIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveDiskIdentifier");
}

id objc_msgSend_liveDiskIdentifierWithDiskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveDiskIdentifierWithDiskDescription:");
}

id objc_msgSend_liveVerificationArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveVerificationArgs");
}

id objc_msgSend_localizedAdditionalDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedAdditionalDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logEvent_eventPayloadBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logEvent:eventPayloadBuilder:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_machineWithStateTransitionTable_startState_startEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machineWithStateTransitionTable:startState:startEvent:");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_majorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "majorType");
}

id objc_msgSend_managerResumed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerResumed");
}

id objc_msgSend_managerStalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerStalled");
}

id objc_msgSend_mediaRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaRef");
}

id objc_msgSend_mediaUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaUUID");
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messages");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_minimalDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimalDictionaryRepresentation");
}

id objc_msgSend_mountFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountFlags");
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountPoint");
}

id objc_msgSend_mountWithDisk_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountWithDisk:options:error:");
}

id objc_msgSend_mountWithOptionsDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountWithOptionsDictionary:error:");
}

id objc_msgSend_msgHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "msgHandler");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newDAError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDAError");
}

id objc_msgSend_newIteratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newIteratorWithOptions:");
}

id objc_msgSend_newPartition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newPartition");
}

id objc_msgSend_newPerformOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newPerformOperation");
}

id objc_msgSend_newSortedChildrenWithIOMedia_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSortedChildrenWithIOMedia:");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newlineCharacterSet");
}

id objc_msgSend_nextDiskObjectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextDiskObjectID");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextState");
}

id objc_msgSend_nextWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextWithError:");
}

id objc_msgSend_nilWithBlock_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nilWithBlock:error:");
}

id objc_msgSend_nilWithError_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nilWithError:error:");
}

id objc_msgSend_nilWithOSStatus_debugDescription_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nilWithOSStatus:debugDescription:error:");
}

id objc_msgSend_nilWithOSStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nilWithOSStatus:error:");
}

id objc_msgSend_nilWithPOSIXCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nilWithPOSIXCode:error:");
}

id objc_msgSend_nilWithSKErrorCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nilWithSKErrorCode:error:");
}

id objc_msgSend_nonResizableSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonResizableSize");
}

id objc_msgSend_notificationsCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationsCache");
}

id objc_msgSend_notificationsProcessingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationsProcessingQueue");
}

id objc_msgSend_notificationsSyncQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationsSyncQueue");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_option_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "option:value:");
}

id objc_msgSend_optionWithoutValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionWithoutValue:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_originalSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalSize");
}

id objc_msgSend_overwriteExistingMediaLayout_opts_partitionScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overwriteExistingMediaLayout:opts:partitionScheme:");
}

id objc_msgSend_overwriteExistingMediaLayout_opts_partitionScheme_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overwriteExistingMediaLayout:opts:partitionScheme:size:");
}

id objc_msgSend_overwritePartitionAt_filesystem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overwritePartitionAt:filesystem:error:");
}

id objc_msgSend_ownerUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerUID");
}

id objc_msgSend_parseData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseData:");
}

id objc_msgSend_partitionIDFromDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partitionIDFromDisk:");
}

id objc_msgSend_partitions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partitions");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:onThread:withObject:waitUntilDone:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performVMDiskResizeWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performVMDiskResizeWithSize:");
}

id objc_msgSend_physicalStores(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physicalStores");
}

id objc_msgSend_physicalStoresForAPFSVolume_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physicalStoresForAPFSVolume:completionBlock:");
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipe");
}

id objc_msgSend_plistEndTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistEndTag");
}

id objc_msgSend_plistStartTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistStartTag");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_postProcessWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postProcessWithDisk:");
}

id objc_msgSend_preIdleOperationMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preIdleOperationMap");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preflightRequestWithDiskDict_entitlementLevel_completionUUID_prettyFunc_failResGenFunc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:");
}

id objc_msgSend_preflightRequestWithDiskDict_entitlementLevel_prettyFunc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRequestWithDiskDict:entitlementLevel:prettyFunc:");
}

id objc_msgSend_preflightRequestWithSKDisk_entitlementLevel_completionUUID_prettyFunc_authorizationNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:");
}

id objc_msgSend_preflightRequestWithSKDisk_entitlementLevel_prettyFunc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRequestWithSKDisk:entitlementLevel:prettyFunc:");
}

id objc_msgSend_prepareWithDiskOperationMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareWithDiskOperationMap:");
}

id objc_msgSend_privateCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateCache");
}

id objc_msgSend_privilege(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privilege");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processedDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processedDisk");
}

id objc_msgSend_processingGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processingGroup");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_progressHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressHandler");
}

id objc_msgSend_progressWithTotalUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressWithTotalUnitCount:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proxyResourceForBSDName_writable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyResourceForBSDName:writable:");
}

id objc_msgSend_purgeableSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeableSpace");
}

id objc_msgSend_queues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queues");
}

id objc_msgSend_raidTraverse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raidTraverse");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_rangeOfData_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfData:options:range:");
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:range:");
}

id objc_msgSend_rawIOContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawIOContent");
}

id objc_msgSend_reProbeWithDisk_isEncrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reProbeWithDisk:isEncrypted:");
}

id objc_msgSend_reProbeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reProbeWithError:");
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataToEndOfFile");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_recacheDisk_options_callbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recacheDisk:options:callbackBlock:");
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiver");
}

id objc_msgSend_receiverWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiverWithDelegate:");
}

id objc_msgSend_recursive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recursive");
}

id objc_msgSend_registerDiskArbCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDiskArbCallbacks");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLIFSAPFSContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLIFSAPFSContainers");
}

id objc_msgSend_removeListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeListener:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removePostProcessWithCachedDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePostProcessWithCachedDisk:");
}

id objc_msgSend_removeWithMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeWithMountPoint:");
}

id objc_msgSend_renameDisk_to_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renameDisk:to:withCompletionBlock:");
}

id objc_msgSend_repairArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "repairArgs");
}

id objc_msgSend_requestWithUUID_didCompleteWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithUUID:didCompleteWithResult:");
}

id objc_msgSend_requestedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestedSize");
}

id objc_msgSend_requiresEraseDiskForAPFS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresEraseDiskForAPFS");
}

id objc_msgSend_resizablePart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resizablePart");
}

id objc_msgSend_resize_toSize_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resize:toSize:completionBlock:");
}

id objc_msgSend_resizeError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resizeError");
}

id objc_msgSend_resizeLastPartitionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resizeLastPartitionWithError:");
}

id objc_msgSend_resizePartitionID_size_offset_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resizePartitionID:size:offset:error:");
}

id objc_msgSend_resizeStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resizeStateMachine:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rollbackResize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rollbackResize:");
}

id objc_msgSend_rootWholeDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootWholeDisk");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runMaintenanceOperationWithArgsCreator_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMaintenanceOperationWithArgsCreator:error:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithError:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_schemeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schemeID");
}

id objc_msgSend_secondaryPartitionTableSizeWithDiskType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryPartitionTableSizeWithDiskType:");
}

id objc_msgSend_sectorSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectorSize");
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selector");
}

id objc_msgSend_selectorTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectorTarget");
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semaphore");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActiveClientsTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveClientsTransaction:");
}

id objc_msgSend_setActiveFSM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveFSM:");
}

id objc_msgSend_setApfsContainerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApfsContainerIdentifier:");
}

id objc_msgSend_setApfsContainerUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApfsContainerUUID:");
}

id objc_msgSend_setApfsRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApfsRole:");
}

id objc_msgSend_setApfsUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApfsUUID:");
}

id objc_msgSend_setApfsVolumeGroupUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApfsVolumeGroupUUID:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttempt:");
}

id objc_msgSend_setAuthenticateOnInit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticateOnInit:");
}

id objc_msgSend_setAvailableSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvailableSpace:");
}

id objc_msgSend_setBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuffer:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallback:");
}

id objc_msgSend_setCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallbackBlock:");
}

id objc_msgSend_setCanPartitionDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanPartitionDisk:");
}

id objc_msgSend_setCancellationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancellationHandler:");
}

id objc_msgSend_setChildCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChildCount:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCounter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCounter:");
}

id objc_msgSend_setCurrentOperationName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentOperationName:");
}

id objc_msgSend_setDAstatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDAstatus:");
}

id objc_msgSend_setDAstatusString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDAstatusString:");
}

id objc_msgSend_setDaDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaDisk:");
}

id objc_msgSend_setDaemonOptionsWithLanguage_authRef_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemonOptionsWithLanguage:authRef:withCompletionBlock:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDefaultEffaceable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultEffaceable:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesignatedPSUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesignatedPSUUID:");
}

id objc_msgSend_setDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisk:");
}

id objc_msgSend_setDiskArbOpDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiskArbOpDone:");
}

id objc_msgSend_setDiskIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiskIdentifier:");
}

id objc_msgSend_setDiskListCompleteReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiskListCompleteReceived:");
}

id objc_msgSend_setDiskObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiskObjectID:");
}

id objc_msgSend_setDisksToUnmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisksToUnmount:");
}

id objc_msgSend_setDissenterPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDissenterPID:");
}

id objc_msgSend_setEntriesMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEntriesMap:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEvent:");
}

id objc_msgSend_setExecutableURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExecutableURL:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFilesystem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilesystem:");
}

id objc_msgSend_setFilesystemType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilesystemType:");
}

id objc_msgSend_setFreeSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFreeSpace:");
}

id objc_msgSend_setFs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFs:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIoContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIoContent:");
}

id objc_msgSend_setIsCaseSensitive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCaseSensitive:");
}

id objc_msgSend_setIsDiskImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDiskImage:");
}

id objc_msgSend_setIsEncrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEncrypted:");
}

id objc_msgSend_setIsInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInternal:");
}

id objc_msgSend_setIsJournaled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsJournaled:");
}

id objc_msgSend_setIsLiveFSContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLiveFSContainer:");
}

id objc_msgSend_setIsLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLocked:");
}

id objc_msgSend_setIsMediaWritable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsMediaWritable:");
}

id objc_msgSend_setIsOSInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsOSInternal:");
}

id objc_msgSend_setIsPartitionDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPartitionDisk:");
}

id objc_msgSend_setIsPhysicalDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPhysicalDisk:");
}

id objc_msgSend_setIsRemovable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRemovable:");
}

id objc_msgSend_setIsValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsValid:");
}

id objc_msgSend_setIsWholeDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsWholeDisk:");
}

id objc_msgSend_setIsWritable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsWritable:");
}

id objc_msgSend_setLastOperationName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastOperationName:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLiveDiskIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveDiskIdentifier:");
}

id objc_msgSend_setLocalizedAdditionalDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalizedAdditionalDescription:");
}

id objc_msgSend_setMediaRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaRef:");
}

id objc_msgSend_setMediaUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaUUID:");
}

id objc_msgSend_setMountFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMountFlags:");
}

id objc_msgSend_setMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMountPoint:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNextState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextState:");
}

id objc_msgSend_setNotificationsCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationsCache:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOriginalSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalSize:");
}

id objc_msgSend_setOwnerUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOwnerUID:");
}

id objc_msgSend_setPreviousMount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousMount:");
}

id objc_msgSend_setPrivateCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrivateCache:");
}

id objc_msgSend_setProcessedDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessedDisk:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setPurgeableSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurgeableSpace:");
}

id objc_msgSend_setQuotaSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuotaSpace:");
}

id objc_msgSend_setRawIOContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRawIOContent:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestedSize:");
}

id objc_msgSend_setReserveSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReserveSpace:");
}

id objc_msgSend_setResizeError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResizeError:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setSchemeID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSchemeID:");
}

id objc_msgSend_setSealStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSealStatus:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setSelectorTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectorTarget:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSkProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkProgress:");
}

id objc_msgSend_setSnapshotName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshotName:");
}

id objc_msgSend_setSortedChildren_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortedChildren:");
}

id objc_msgSend_setStandardError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardError:");
}

id objc_msgSend_setStandardOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardOutput:");
}

id objc_msgSend_setStartLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartLocation:");
}

id objc_msgSend_setStartRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartRange:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStderrParser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStderrParser:");
}

id objc_msgSend_setStdoutParser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStdoutParser:");
}

id objc_msgSend_setSupportsJournaling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsJournaling:");
}

id objc_msgSend_setSupportsRepair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsRepair:");
}

id objc_msgSend_setSupportsVerify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsVerify:");
}

id objc_msgSend_setTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTable:");
}

id objc_msgSend_setTargetDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetDisk:");
}

id objc_msgSend_setTaskID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskID:");
}

id objc_msgSend_setTaskUpdateHandler_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskUpdateHandler:replyHandler:");
}

id objc_msgSend_setTotalSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalSpace:");
}

id objc_msgSend_setTotalUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalUnitCount:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnformattedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnformattedSize:");
}

id objc_msgSend_setUsedSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsedSpace:");
}

id objc_msgSend_setUserInfoObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfoObject:forKey:");
}

id objc_msgSend_setVolumeKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeKind:");
}

id objc_msgSend_setVolumeName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeName:");
}

id objc_msgSend_setVolumeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeType:");
}

id objc_msgSend_setVolumeUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeUUID:");
}

id objc_msgSend_setWholeDADisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWholeDADisk:");
}

id objc_msgSend_setWholeDiskOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWholeDiskOperation:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_adoptChildUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_adoptChildUserInfo:");
}

id objc_msgSend_setupSigtermHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSigtermHandler");
}

id objc_msgSend_setupTaskUpdateHandlerWithClient_taskPairs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupTaskUpdateHandlerWithClient:taskPairs:error:");
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDaemon");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_skProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skProgress");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedChildren(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedChildren");
}

id objc_msgSend_standardError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardError");
}

id objc_msgSend_standardOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardOutput");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startForceIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startForceIdleTimer");
}

id objc_msgSend_startLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLocation");
}

id objc_msgSend_startRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRange");
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startServer");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stderrHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stderrHandle");
}

id objc_msgSend_stderrParser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stderrParser");
}

id objc_msgSend_stdoutHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stdoutHandle");
}

id objc_msgSend_stdoutParser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stdoutParser");
}

id objc_msgSend_storeMountState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeMountState:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supportsJournaling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsJournaling");
}

id objc_msgSend_syncAllDisksSemaphores(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncAllDisksSemaphores");
}

id objc_msgSend_syncAllDisksWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncAllDisksWithCompletionBlock:");
}

id objc_msgSend_syncDiskFromDaemon_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDiskFromDaemon:error:");
}

id objc_msgSend_syncSharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSharedManager");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "table");
}

id objc_msgSend_tableWithTransitionEntries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableWithTransitionEntries:");
}

id objc_msgSend_tableWithTransitionEntries_selectorTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableWithTransitionEntries:selectorTarget:");
}

id objc_msgSend_targetDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetDisk");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "task");
}

id objc_msgSend_taskDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskDone");
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskID");
}

id objc_msgSend_taskPairs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskPairs");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tasks");
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationStatus");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_toOperateWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toOperateWithDisk:");
}

id objc_msgSend_toVolumeWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toVolumeWithDisk:");
}

id objc_msgSend_totalSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalSpace");
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalUnitCount");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_unformattedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unformattedSize");
}

id objc_msgSend_unlocalizedEncryptedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlocalizedEncryptedName");
}

id objc_msgSend_unlocalizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlocalizedName");
}

id objc_msgSend_unmountDisk_options_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountDisk:options:withCompletionBlock:");
}

id objc_msgSend_unmountSnapshotsWithDisk_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountSnapshotsWithDisk:error:");
}

id objc_msgSend_unmountWithDisk_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountWithDisk:options:error:");
}

id objc_msgSend_unmountWithOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountWithOptions:error:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updatePartitionTypeWithPartitions_partID_newType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePartitionTypeWithPartitions:partID:newType:error:");
}

id objc_msgSend_updatePhysicalStoresWithContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePhysicalStoresWithContainer:");
}

id objc_msgSend_updatePhysicalStoresWithDisks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePhysicalStoresWithDisks:");
}

id objc_msgSend_updateRAIDDisks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRAIDDisks");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateMountOptionsWithDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateMountOptionsWithDisk:");
}

id objc_msgSend_validateMountPointWithConnection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateMountPointWithConnection:error:");
}

id objc_msgSend_validateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateWithError:");
}

id objc_msgSend_validateWithRecachedDisk_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateWithRecachedDisk:error:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_verificationArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verificationArgs");
}

id objc_msgSend_visibleDiskRoles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleDiskRoles");
}

id objc_msgSend_volumeKind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeKind");
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeName");
}

id objc_msgSend_volumeNameWithDiskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeNameWithDiskDescription:");
}

id objc_msgSend_volumeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeType");
}

id objc_msgSend_volumes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumes");
}

id objc_msgSend_volumesForAPFSPS_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumesForAPFSPS:completionBlock:");
}

id objc_msgSend_waitForCompletionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForCompletionQueue");
}

id objc_msgSend_waitIOKitQuiet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitIOKitQuiet");
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilExit");
}

id objc_msgSend_waitWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitWithError:");
}

id objc_msgSend_waitables(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitables");
}

id objc_msgSend_wholeDADisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wholeDADisk");
}

id objc_msgSend_wholeDiskForDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wholeDiskForDisk:");
}

id objc_msgSend_wholeDiskForDisk_withCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wholeDiskForDisk:withCallbackBlock:");
}

id objc_msgSend_wholeDiskOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wholeDiskOperation");
}

id objc_msgSend_wipeDiskWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wipeDiskWithError:");
}

id objc_msgSend_writeNewMediaLayout_partitionScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeNewMediaLayout:partitionScheme:");
}

id objc_msgSend_writePartitionScheme_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePartitionScheme:error:");
}

id objc_msgSend_xmlOutputArg(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xmlOutputArg");
}
