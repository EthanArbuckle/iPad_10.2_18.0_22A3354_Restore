@implementation CRLAssertionHandler

+ (id)performBlockIgnoringAssertions:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

+ (id)performBlockIgnoringAssertionsAndReturnList:(id)a3
{
  return objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 0);
}

+ (id)performBlockIgnoringFatalAssertions:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

+ (id)performBlockIgnoringQAFatalAssertions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", v4, objc_msgSend(a1, "isQAFatalAssertionsEnabled")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  return v6;
}

+ (BOOL)isQAFatalAssertionsEnabled
{
  return 0;
}

+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4
{
  void (**v5)(_QWORD);
  void *v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v5 = (void (**)(_QWORD))a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_retainBlock((id)qword_10006DC40);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000F96C;
  v14[3] = &unk_100062070;
  v16 = a4;
  v8 = v6;
  v15 = v8;
  v9 = objc_retainBlock(v14);
  v10 = (void *)qword_10006DC40;
  qword_10006DC40 = (uint64_t)v9;

  v5[2](v5);
  v11 = objc_retainBlock(v7);
  v12 = (void *)qword_10006DC40;
  qword_10006DC40 = (uint64_t)v11;

  return v8;
}

+ (void)logFullBacktrace
{
  void *v3;

  if (CRLAssertCat_init_token != -1)
    dispatch_once(&CRLAssertCat_init_token, &stru_100062090);
  v3 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
    sub_10004CBD4(v3);
  objc_msgSend(a1, "simulateCrashWithMessage:", CFSTR("+[CRLAssert logBacktrace]"));
}

+ (void)_logBacktraceWithCallStackSymbols:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (CRLAssertCat_init_token != -1)
    dispatch_once(&CRLAssertCat_init_token, &stru_1000620B0);
  v5 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
    sub_10004CC74(v5, (uint64_t)v4);
  objc_msgSend(a1, "simulateCrashWithMessage:", CFSTR("+[CRLAssert logBacktrace]"));

}

+ (id)packedBacktraceString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackReturnAddresses](NSThread, "callStackReturnAddresses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "packedBacktraceStringWithReturnAddresses:", v3));

  return v4;
}

+ (id)packedBacktraceStringWithReturnAddresses:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  const mach_header_64 *v22;
  int magic;
  const mach_header_64 *p_reserved;
  uint32_t ncmds;
  unsigned int v26;
  uint64_t cputype;
  BOOL v29;
  uint8_t *v30;
  uint8_t *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *m;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  Dl_info v79;
  _BYTE v80[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (qword_10006DC48 != -1)
    dispatch_once(&qword_10006DC48, &stru_1000620D0);
  v55 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableSet);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v9)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i), "pointerValue");
        memset(&v79, 0, sizeof(v79));
        if (dladdr(v11, &v79))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v79.dli_fbase));
          if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v12);
            os_unfair_lock_lock((os_unfair_lock_t)&dword_10006DC60);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10006DC58, "objectForKeyedSubscript:", v12));
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_10006DC60);
            if (v13)
            {
              v14 = v55;
              v15 = v13;
            }
            else
            {
              v14 = v6;
              v15 = v12;
            }
            objc_msgSend(v14, "addObject:", v15);

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v8);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  v54 = v16;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v69 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
        v22 = (const mach_header_64 *)objc_msgSend(v21, "pointerValue");
        magic = v22->magic;
        if ((int)v22->magic > -17958195)
        {
          if (magic != -17958193)
          {
            if (magic != -17958194)
              continue;
LABEL_28:
            p_reserved = (const mach_header_64 *)&v22->reserved;
            goto LABEL_30;
          }
        }
        else
        {
          if (magic == -822415874)
            goto LABEL_28;
          if (magic != -805638658)
            continue;
        }
        p_reserved = v22 + 1;
LABEL_30:
        ncmds = v22->ncmds;
        if (ncmds)
        {
          v26 = 1;
          while (1)
          {
            cputype = p_reserved->cputype;
            if (p_reserved->magic == 27 && (_DWORD)cputype == 24)
              break;
            p_reserved = (const mach_header_64 *)((char *)p_reserved + cputype);
            if (p_reserved)
              v29 = v26 >= ncmds;
            else
              v29 = 1;
            ++v26;
            if (v29)
              goto LABEL_44;
          }
          v79.dli_fname = 0;
          v30 = getsegmentdata(v22, "__TEXT", (unint64_t *)&v79);
          if (v30)
          {
            v31 = v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", qword_10006DC50));
            v33 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &p_reserved->cpusubtype);
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("uuid"));

            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v31));
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("loadaddr"));

            os_unfair_lock_lock((os_unfair_lock_t)&dword_10006DC60);
            objc_msgSend((id)qword_10006DC58, "setObject:forKeyedSubscript:", v32, v21);
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_10006DC60);
            objc_msgSend(v55, "addObject:", v32);

            v16 = v54;
          }
        }
LABEL_44:
        ;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v18);
  }

  v67 = objc_msgSend(v55, "count");
  objc_msgSend(v4, "appendBytes:length:", &v67, 8);
  v66 = objc_msgSend(obj, "count");
  objc_msgSend(v4, "appendBytes:length:", &v66, 8);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v35 = v55;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)k);
        v79.dli_fname = 0;
        v79.dli_fbase = 0;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("uuid")));
        objc_msgSend(v41, "getUUIDBytes:", &v79);

        v61 = 0;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("loadaddr")));
        v43 = objc_msgSend(v42, "pointerValue");

        v61 = v43;
        objc_msgSend(v4, "appendBytes:length:", &v79, 16);
        objc_msgSend(v4, "appendBytes:length:", &v61, 8);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    }
    while (v37);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v44 = obj;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v46; m = (char *)m + 1)
      {
        if (*(_QWORD *)v58 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)m);
        v79.dli_fname = 0;
        v79.dli_fname = (const char *)objc_msgSend(v49, "pointerValue");
        objc_msgSend(v4, "appendBytes:length:", &v79, 8);
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    }
    while (v46);
  }

  v50 = objc_alloc_init((Class)NSMutableData);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_compressWithAlgorithm:operation:", 774, 0));
  LODWORD(v61) = 843347010;
  objc_msgSend(v50, "appendBytes:length:", &v61, 4);
  v79.dli_fname = (const char *)objc_msgSend(v51, "length");
  objc_msgSend(v50, "appendBytes:length:", &v79, 8);
  objc_msgSend(v50, "appendData:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "base64EncodedStringWithOptions:", 0));

  return v52;
}

+ (void)simulateCrashWithMessage:(id)a3
{
  id v3;
  void (*v4)(uint64_t, _QWORD, id);
  uint64_t v5;
  id v6;
  id v7;

  v3 = a3;
  if (qword_10006DC70 != -1)
  {
    v7 = v3;
    dispatch_once(&qword_10006DC70, &stru_1000620F0);
    v3 = v7;
  }
  v4 = (void (*)(uint64_t, _QWORD, id))off_10006DC68;
  if (off_10006DC68)
  {
    v6 = v3;
    v5 = getpid();
    v4(v5, 0, v6);
    v3 = v6;
  }

}

+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 format:(id)a7 args:(char *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[6];

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = objc_msgSend(objc_alloc((Class)NSString), "crl_initUnRedactedWithFormat:arguments:", v16, a8);

  if (qword_10006DC40)
  {
    (*(void (**)(void))(qword_10006DC40 + 16))();
  }
  else
  {
    v24[0] = CFSTR("CRLAssertNotificationDescriptionKey");
    v24[1] = CFSTR("CRLAssertNotificationFileKey");
    v25[0] = v17;
    v25[1] = v15;
    v24[2] = CFSTR("CRLAssertNotificationLineNumberKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    v25[2] = v18;
    v25[3] = v14;
    v24[3] = CFSTR("CRLAssertNotificationFunctionNameKey");
    v24[4] = CFSTR("CRLAssertNotificationAssertionCountKey");
    v19 = atomic_load((unsigned int *)&unk_10006DC78);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
    v25[4] = v20;
    v24[5] = CFSTR("CRLAssertNotificationFatalnessNameKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v25[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 6));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("CRLAssertNotification"), a1, v22);

  }
}

+ (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 isFatal:(BOOL)a6 description:(const char *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;

  v8 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a7));
  objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:format:args:", v13, v12, a5, v8, v14, &v15);

}

+ (int)_atomicIncrementAssertCount
{
  int result;

  do
    result = __ldaxr((unsigned int *)&unk_10006DC78);
  while (__stlxr(result + 1, (unsigned int *)&unk_10006DC78));
  return result;
}

@end
