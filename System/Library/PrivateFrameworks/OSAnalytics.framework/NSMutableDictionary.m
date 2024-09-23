@implementation NSMutableDictionary

void __86__NSMutableDictionary_OSAStackshotKCDataExtension__addTurnstileInfoDesc_count_elSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = *(_QWORD *)(a3 + 8);
  v5 = *(unsigned __int8 *)(a3 + 16);
  v6 = *(unsigned __int8 *)(a3 + 17);
  v7 = *(_QWORD *)(a3 + 18);
  v8 = *(__int16 *)(a3 + 26);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("thread %llu: "), *(_QWORD *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  if ((v7 & 2) != 0)
  {
    v10 = CFSTR("turnstile was in the process of being updated");
  }
  else
  {
    if ((v7 & 4) != 0)
    {
      objc_msgSend(v9, "appendFormat:", CFSTR("blocked on workqueue: 0x%llx, hops: %d, priority: %d"), v4, v6, v5);
      goto LABEL_13;
    }
    if ((v7 & 8) != 0)
    {
      objc_msgSend(v9, "appendFormat:", CFSTR("blocked on %lld, hops: %d, priority: %d"), v4, v6, v5);
      goto LABEL_13;
    }
    if ((v7 & 1) != 0)
    {
      v10 = CFSTR("turnstile has unknown inheritor");
    }
    else
    {
      if ((v7 & 0x10) == 0)
      {
        objc_msgSend(v9, "appendFormat:", CFSTR("turnstile had unknown status (flags: 0x%llx)!"), v7, v13, v14);
        goto LABEL_13;
      }
      v13 = v6;
      v14 = v5;
      v12 = v4;
      v10 = CFSTR("turnstile blocked on task pid %lld, hops: %d, priority: %d");
    }
  }
  objc_msgSend(v9, "appendFormat:", v10, v12, v13, v14);
LABEL_13:
  if ((v7 & 0xC0) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("portlabels"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendPortLabelInfo:portlabels:", v8, v11);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

}

void __81__NSMutableDictionary_OSAStackshotKCDataExtension__addWaitInfoDesc_count_elSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v4 = *((unsigned __int8 *)a3 + 24);
  v5 = *(__int16 *)((char *)a3 + 25);
  v6 = *a3;
  v7 = a3[2];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("thread %llu: "), a3[1]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  switch((int)v4)
  {
    case 1:
      objc_msgSend(v8, "appendFormat:", CFSTR("kernel mutex %#llx"), v7);
      if (!v6)
        goto LABEL_27;
      v8 = v18;
      if (v6 == -6)
      {
        v9 = CFSTR(" in spin mode");
        goto LABEL_39;
      }
      objc_msgSend(v18, "appendFormat:", CFSTR(" owned by thread %llu"), v6, v16, v17);
      goto LABEL_40;
    case 2:
      objc_msgSend(v8, "appendFormat:", CFSTR("mach_msg receive on "));
      switch(v6)
      {
        case -5:
LABEL_13:
          v15 = v7;
          v11 = CFSTR("intransit port %#llx");
          goto LABEL_51;
        case 0:
          v15 = v7;
          v11 = CFSTR("port %#llx");
          goto LABEL_51;
        case -3:
          objc_msgSend(v18, "appendFormat:", CFSTR("locked port %#llx"), v7, v16);
          break;
        default:
          objc_msgSend(v18, "appendFormat:", CFSTR("port %#llx name %#llx"), v7, v6);
          break;
      }
      goto LABEL_52;
    case 3:
      v10 = &stru_1E4DEECB8;
      if (v6 == -4)
        v10 = CFSTR("locked ");
      objc_msgSend(v8, "appendFormat:", CFSTR("mach_msg receive on %@port set %#llx"), v10, v7, v17);
      goto LABEL_40;
    case 4:
      objc_msgSend(v8, "appendFormat:", CFSTR("mach_msg send on "));
      switch(v6)
      {
        case -5:
          goto LABEL_13;
        case -3:
          v15 = v7;
          v11 = CFSTR("locked port %#llx");
          break;
        case -2:
          v15 = v7;
          v11 = CFSTR("port %#llx owned by kernel");
          break;
        case 0:
          v15 = v7;
          v11 = CFSTR("port %#llx with unknown owner");
          break;
        default:
          v15 = v7;
          v16 = v6;
          v11 = CFSTR("port %#llx owned by pid %llu");
          break;
      }
LABEL_51:
      objc_msgSend(v18, "appendFormat:", v11, v15, v16);
LABEL_52:
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("portlabels"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendPortLabelInfo:portlabels:", v5, v13);

      goto LABEL_40;
    case 5:
      objc_msgSend(v8, "appendFormat:", CFSTR("mach_msg send on port %#llx in transit to "), v7);
      if (v6)
      {
        v14 = v6;
        v9 = CFSTR("port %#llx");
      }
      else
      {
        v9 = CFSTR("unknown port");
      }
      goto LABEL_38;
    case 6:
      objc_msgSend(v8, "appendFormat:", CFSTR("semaphore port %#llx"), v7);
      if (!v6)
        goto LABEL_27;
      v14 = v6;
      v9 = CFSTR(" owned by pid %lld");
      goto LABEL_38;
    case 7:
      objc_msgSend(v8, "appendFormat:", CFSTR("krwlock %#llx for reading"), v7, v16);
      goto LABEL_24;
    case 8:
      objc_msgSend(v8, "appendFormat:", CFSTR("krwlock %#llx for writing"), v7, v16);
      goto LABEL_24;
    case 9:
      objc_msgSend(v8, "appendFormat:", CFSTR("krwlock %#llx for upgrading"), v7, v16);
      goto LABEL_24;
    case 10:
      v12 = CFSTR("unfair ");
      if (!v6)
        v12 = CFSTR("spin");
      objc_msgSend(v8, "appendFormat:", CFSTR("%@lock %#llx"), v12, v7);
LABEL_24:
      if (v6)
        goto LABEL_25;
      goto LABEL_40;
    case 11:
      objc_msgSend(v8, "appendFormat:", CFSTR("pthread mutex %#llx"), v7);
      if (v6)
      {
LABEL_25:
        v14 = v6;
        v9 = CFSTR(" owned by thread %lld");
      }
      else
      {
LABEL_27:
        v9 = CFSTR(" with unknown owner");
      }
LABEL_38:
      v8 = v18;
      goto LABEL_39;
    case 12:
      objc_msgSend(v8, "appendFormat:", CFSTR("pthread rwlock %#llx for reading"), v7, v16, v17);
      goto LABEL_40;
    case 13:
      objc_msgSend(v8, "appendFormat:", CFSTR("pthread rwlock %#llx for writing"), v7, v16, v17);
      goto LABEL_40;
    case 14:
      objc_msgSend(v8, "appendFormat:", CFSTR("pthread condvar %#llx"), v7, v16, v17);
      goto LABEL_40;
    case 16:
      switch(v6)
      {
        case -8:
          v9 = CFSTR("queue that is suspended");
          goto LABEL_39;
        case 0:
          v9 = CFSTR("queue in a transient state");
          goto LABEL_39;
        case -7:
          v9 = CFSTR("queue thread to be allocated");
LABEL_39:
          objc_msgSend(v8, "appendFormat:", v9, v14, v16, v17);
          goto LABEL_40;
      }
      objc_msgSend(v8, "appendFormat:", CFSTR("queue processed by thread %llu"), v6, v16, v17);
LABEL_40:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);

      return;
    case 20:
      objc_msgSend(v8, "appendFormat:", CFSTR("thread %llu in compressor segment %#llx"), v6, v7, v17);
      goto LABEL_40;
    default:
      objc_msgSend(v8, "appendFormat:", CFSTR("unknown type %u (owner %llu, context %#llx)"), v4, v6, v7);
      goto LABEL_40;
  }
}

void __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setCount:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOldestDate:", v4);

  objc_msgSend(v3, "setOldestLogPath:", 0);
  objc_msgSend(v3, "signatures");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeAllObjects");
}

void __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  ssize_t v5;
  void *v6;
  void *v7;
  ssize_t v8;
  void *v9;
  ssize_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v17 = objc_retainAutorelease(v3);
  v4 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
  v5 = getxattr(v4, "LogType", *(void **)(a1 + 64), 0x4FuLL, 0, 0);
  v6 = *(void **)(a1 + 64);
  if (v5 < 1)
  {
    v10 = getxattr(v4, "bug_type", v6, 0x4FuLL, 0, 0);
    if (v10 < 1)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      goto LABEL_17;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 64) + v10) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v7, 0, v4, 1);
      if (!osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel
        && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v7))
      {
        objc_msgSend(v17, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "copy");
        v13 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
        osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = v12;

      }
      goto LABEL_16;
    }
  }
  else
  {
    *((_BYTE *)v6 + v5) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = getxattr(v4, "Signature", *(void **)(a1 + 64), 0x4FuLL, 0, 0);
      if (v8 < 1)
      {
        v9 = 0;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 64) + v8) = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v7, v9, v4, 1);
      if (!osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel
        && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v7))
      {
        objc_msgSend(v17, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "copy");
        v16 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
        osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = v15;

      }
      goto LABEL_16;
    }
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
LABEL_16:

LABEL_17:
}

uint64_t __85__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_getForSubtype_forOwner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "osa_logTracker_trackLogTypes_internal:forOwner:rescan:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

@end
