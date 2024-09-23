@implementation SPTailspinFile

+ (id)sampleStoreForFile:(const char *)a3 stackshotsOnly:(BOOL)a4 parsePastLastStackshot:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  const char *v7;
  id v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  char *v16;
  char *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *CStringPtr;
  malloc_type_id_t v25;
  int v26;
  NSObject *v27;
  BOOL v28;
  id result;
  const __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  FILE *v34;
  FILE *v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  id v39;
  uint64_t v40;
  void *i;
  uint64_t v42;
  int v43;
  NSObject *v44;
  BOOL v45;
  int v46;
  const char *v47;
  const __CFString *v48;
  const __CFString *v49;
  const char *v50;
  char *v51;
  char *v52;
  NSObject *v53;
  FILE *v54;
  FILE *v55;
  int v56;
  NSObject *v57;
  const __CFString *v58;
  int v59;
  NSObject *v60;
  const __CFString *v61;
  char *v62;
  char *v63;
  NSObject *v64;
  NSObject *v65;
  FILE *v66;
  FILE *v67;
  int *v68;
  unsigned __int8 v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v76 = 0;
  if ((+[SASampleStore canOpenFileAsKTraceFile:errorOut:](SASampleStore, "canOpenFileAsKTraceFile:errorOut:", a3, &v76) & 1) == 0)
  {
    if (v76)
    {
      if (byte_1000E3CF8)
      {
        v18 = *__error();
        v19 = sub_10002ABEC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_100091DA0();
        *__error() = v18;
      }
      if (byte_1000E3CF9)
        v20 = dword_1000E34A8 <= 0;
      else
        v20 = 0;
      if (!v20)
        return 0;
      v21 = *__error();
      v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Could not open %s as a ktrace file: %@"), v7, v76);
      if (!v22)
      {
        v31 = sub_10002ABEC();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          sub_100091D40();
        goto LABEL_123;
      }
      v23 = v22;
      CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
      if (CStringPtr)
        goto LABEL_118;
      v25 = 4020962941;
    }
    else
    {
      if (byte_1000E3CF8)
      {
        v26 = *__error();
        v27 = sub_10002ABEC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          sub_100091CD4();
        *__error() = v26;
      }
      if (byte_1000E3CF9)
        v28 = dword_1000E34A8 <= 0;
      else
        v28 = 0;
      if (!v28)
        return 0;
      v21 = *__error();
      v30 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Could not open %s as a ktrace file for unknown reason"), v7);
      if (!v30)
      {
        v32 = sub_10002ABEC();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          sub_100091C74();
        goto LABEL_123;
      }
      v23 = v30;
      CStringPtr = CFStringGetCStringPtr(v30, 0x8000100u);
      if (CStringPtr)
        goto LABEL_118;
      v25 = 2906130801;
    }
LABEL_128:
    v62 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v25);
    CFStringGetCString(v23, v62, 1024, 0x8000100u);
    v63 = v62;
    goto LABEL_129;
  }
  v71 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = objc_msgSend(objc_alloc((Class)SASampleStore), "initForFileParsing");
  if ((byte_1000E3D0C & 2) != 0 && sub_100020888())
  {
    if (byte_1000E3CF8)
    {
      v9 = *__error();
      v10 = sub_10002ABEC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Avoiding inspecting live processes for tailspin file due to audio running", buf, 2u);
      }
      *__error() = v9;
    }
    if (byte_1000E3CF9)
      v11 = dword_1000E34A8 <= 2;
    else
      v11 = 0;
    if (v11)
    {
      v12 = *__error();
      v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Avoiding inspecting live processes for tailspin file due to audio running"));
      if (v13)
      {
        v14 = v13;
        v15 = CFStringGetCStringPtr(v13, 0x8000100u);
        if (v15)
        {
          v16 = (char *)v15;
          v17 = 0;
        }
        else
        {
          v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x2FB58C3FuLL);
          CFStringGetCString(v14, v16, 1024, 0x8000100u);
          v17 = v16;
        }
        if (qword_1000E3D00)
          v35 = (FILE *)qword_1000E3D00;
        else
          v35 = __stderrp;
        fprintf(v35, "%s\n", v16);
        if (v17)
          free(v17);
        CFRelease(v14);
      }
      else
      {
        v33 = sub_10002ABEC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          sub_100091C34(v33);
        if (qword_1000E3D00)
          v34 = (FILE *)qword_1000E3D00;
        else
          v34 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
      }
      *__error() = v12;
    }
    objc_msgSend(v8, "setDataGatheringOptions:", (unint64_t)objc_msgSend(v8, "dataGatheringOptions") & 0xFFFFFFFFFFFFFFFDLL);
  }
  sub_10005A478(v8, (byte_1000E3D0C >> 3) & 1, (byte_1000E3D0C >> 2) & 1, (byte_1000E3D0C & 0x10) == 0);
  v70 = v8;
  if (v6)
  {
    v36 = v71;
    v37 = objc_msgSend(v8, "parseStackshotsFromKTraceFile:warningsOut:errorOut:", v7, v71, &v76);
  }
  else
  {
    if (v5)
      objc_msgSend(v8, "setKPerfPETParsePastLastStackshot:", 1);
    v36 = v71;
    v37 = objc_msgSend(v8, "parseKTraceFile:warningsOut:errorOut:", v7, v71, &v76);
  }
  v69 = v37;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v40)
          objc_enumerationMutation(v36);
        v42 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        if (byte_1000E3CF8)
        {
          v43 = *__error();
          v44 = sub_10002ABEC();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v78 = v7;
            v79 = 2112;
            v80 = v42;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "WARNING creating sample store from %s: %@", buf, 0x16u);
          }
          *__error() = v43;
        }
        if (byte_1000E3CF9)
          v45 = dword_1000E34A8 <= 3;
        else
          v45 = 0;
        if (v45)
        {
          v46 = *__error();
          v47 = v7;
          v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("WARNING creating sample store from %s: %@"), v7, v42);
          if (v48)
          {
            v49 = v48;
            v50 = CFStringGetCStringPtr(v48, 0x8000100u);
            if (v50)
            {
              v51 = (char *)v50;
              v52 = 0;
            }
            else
            {
              v51 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9177DA42uLL);
              CFStringGetCString(v49, v51, 1024, 0x8000100u);
              v52 = v51;
            }
            if (qword_1000E3D00)
              v55 = (FILE *)qword_1000E3D00;
            else
              v55 = __stderrp;
            fprintf(v55, "%s\n", v51);
            if (v52)
              free(v52);
            CFRelease(v49);
            v7 = v47;
          }
          else
          {
            v53 = sub_10002ABEC();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v78 = v7;
              v79 = 2112;
              v80 = v42;
              _os_log_fault_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "Unable to format: WARNING creating sample store from %s: %@", buf, 0x16u);
            }
            if (qword_1000E3D00)
              v54 = (FILE *)qword_1000E3D00;
            else
              v54 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v54);
          }
          v36 = v71;
          *__error() = v46;
        }
      }
      v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v39);
  }
  if ((v69 & 1) != 0)
    return v70;

  if (v76)
  {
    if (byte_1000E3CF8)
    {
      v56 = *__error();
      v57 = sub_10002ABEC();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        sub_100091BC4();
      *__error() = v56;
    }
    result = 0;
    if (byte_1000E3CF9 && dword_1000E34A8 <= 3)
    {
      v21 = *__error();
      v58 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("ERROR trying to create sample store from %s: %@"), v7, v76);
      if (v58)
      {
        v23 = v58;
        CStringPtr = CFStringGetCStringPtr(v58, 0x8000100u);
        if (!CStringPtr)
        {
          v25 = 1814295888;
          goto LABEL_128;
        }
LABEL_118:
        v62 = (char *)CStringPtr;
        v63 = 0;
LABEL_129:
        if (qword_1000E3D00)
          v67 = (FILE *)qword_1000E3D00;
        else
          v67 = __stderrp;
        fprintf(v67, "%s\n", v62);
        if (v63)
          free(v63);
        CFRelease(v23);
LABEL_135:
        v68 = __error();
        result = 0;
        *v68 = v21;
        return result;
      }
      v64 = sub_10002ABEC();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        sub_100091B64();
      goto LABEL_123;
    }
  }
  else
  {
    if (byte_1000E3CF8)
    {
      v59 = *__error();
      v60 = sub_10002ABEC();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        sub_100091AF8();
      *__error() = v59;
    }
    result = 0;
    if (byte_1000E3CF9 && dword_1000E34A8 <= 3)
    {
      v21 = *__error();
      v61 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("ERROR trying to create sample store from %s: Unknown error"), v7);
      if (v61)
      {
        v23 = v61;
        CStringPtr = CFStringGetCStringPtr(v61, 0x8000100u);
        if (!CStringPtr)
        {
          v25 = 1928315350;
          goto LABEL_128;
        }
        goto LABEL_118;
      }
      v65 = sub_10002ABEC();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        sub_100091A98();
LABEL_123:
      if (qword_1000E3D00)
        v66 = (FILE *)qword_1000E3D00;
      else
        v66 = __stderrp;
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v66);
      goto LABEL_135;
    }
  }
  return result;
}

@end
