@implementation SPKCDataStackshotFile

+ (id)sampleStoreForFile:(const char *)a3
{
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  int *v11;
  char *v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  malloc_type_id_t v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  int *v22;
  char *v23;
  const __CFString *v24;
  const __CFString *v25;
  const char *CStringPtr;
  char *v27;
  char *v28;
  int v29;
  NSObject *v30;
  BOOL v31;
  const __CFString *v32;
  char *v33;
  char *v34;
  _DWORD *v35;
  int v36;
  NSObject *v37;
  int v38;
  const __CFString *v39;
  const __CFString *v40;
  const char *v41;
  char *v42;
  char *v43;
  NSObject *v44;
  NSObject *v45;
  FILE *v46;
  malloc_type_id_t v47;
  FILE *v48;
  int *v49;
  id result;
  int v51;
  NSObject *v52;
  BOOL v53;
  uint64_t v54;
  int *v55;
  char *v56;
  const __CFString *v57;
  NSObject *v58;
  FILE *v59;
  id v60;
  int v61;
  NSObject *v62;
  int v63;
  const __CFString *v64;
  const __CFString *v65;
  const char *v66;
  char *v67;
  char *v68;
  FILE *v69;
  NSObject *v70;
  FILE *v71;
  int v72;
  NSObject *v73;
  uint64_t v74;
  const __CFString *v75;
  malloc_type_id_t v76;
  NSObject *v77;
  FILE *v78;
  NSObject *v79;
  NSObject *v80;
  FILE *v81;
  FILE *v82;
  id v83;
  id v84;
  uint8_t buf[16];
  stat v86;

  v4 = open(a3, 0);
  if (v4 == -1)
  {
    if (byte_1000EBD38)
    {
      v17 = *__error();
      v18 = sub_100030318();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10008A780();
      *__error() = v17;
    }
    if (byte_1000EBD39)
      v19 = dword_1000EB4E8 <= 3;
    else
      v19 = 0;
    if (!v19)
      return 0;
    v20 = *__error();
    v21 = *__error();
    v22 = __error();
    v23 = strerror(*v22);
    v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to open %s: %d (%s)"), a3, v21, v23);
    if (v24)
    {
      v25 = v24;
      CStringPtr = CFStringGetCStringPtr(v24, 0x8000100u);
      if (!CStringPtr)
      {
        v47 = 359905566;
LABEL_61:
        v27 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v47);
        CFStringGetCString(v25, v27, 1024, 0x8000100u);
        v28 = v27;
        goto LABEL_62;
      }
LABEL_26:
      v27 = (char *)CStringPtr;
      v28 = 0;
LABEL_62:
      if (qword_1000EBD40)
        v48 = (FILE *)qword_1000EBD40;
      else
        v48 = __stderrp;
      fprintf(v48, "%s\n", v27);
      if (v28)
        free(v28);
      CFRelease(v25);
      goto LABEL_68;
    }
    v45 = sub_100030318();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      sub_100091FE4();
LABEL_56:
    if (qword_1000EBD40)
      v46 = (FILE *)qword_1000EBD40;
    else
      v46 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v46);
LABEL_68:
    v49 = __error();
    result = 0;
    *v49 = v20;
    return result;
  }
  v5 = v4;
  memset(&v86, 0, sizeof(v86));
  if (fstat(v4, &v86))
  {
    if (byte_1000EBD38)
    {
      v6 = *__error();
      v7 = sub_100030318();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100092484();
      *__error() = v6;
    }
    if (byte_1000EBD39)
      v8 = dword_1000EB4E8 <= 3;
    else
      v8 = 0;
    if (!v8)
      goto LABEL_108;
    v9 = *__error();
    v10 = *__error();
    v11 = __error();
    v12 = strerror(*v11);
    v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to stat %s: %d (%s)"), a3, v10, v12);
    if (v13)
    {
      v14 = v13;
      v15 = CFStringGetCStringPtr(v13, 0x8000100u);
      if (!v15)
      {
        v16 = 4025148750;
LABEL_100:
        v33 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v16);
        CFStringGetCString(v14, v33, 1024, 0x8000100u);
        v34 = v33;
        goto LABEL_101;
      }
      goto LABEL_39;
    }
    v44 = sub_100030318();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      sub_100092410();
    goto LABEL_83;
  }
  if (v86.st_size <= 15)
  {
    if (byte_1000EBD38)
    {
      v29 = *__error();
      v30 = sub_100030318();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_1000920B8();
      *__error() = v29;
    }
    if (byte_1000EBD39)
      v31 = dword_1000EB4E8 <= 3;
    else
      v31 = 0;
    if (!v31)
      goto LABEL_108;
    v9 = *__error();
    v32 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s isn't big enough for a kcdata header (only %lld bytes)"), a3, v86.st_size);
    if (v32)
    {
      v14 = v32;
      v15 = CFStringGetCStringPtr(v32, 0x8000100u);
      if (!v15)
      {
        v16 = 2922397827;
        goto LABEL_100;
      }
LABEL_39:
      v33 = (char *)v15;
      v34 = 0;
LABEL_101:
      if (qword_1000EBD40)
        v69 = (FILE *)qword_1000EBD40;
      else
        v69 = __stderrp;
      fprintf(v69, "%s\n", v33);
      if (v34)
        free(v34);
      CFRelease(v14);
LABEL_107:
      *__error() = v9;
LABEL_108:
      close(v5);
      return 0;
    }
    v58 = sub_100030318();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
      sub_100092058();
LABEL_83:
    if (qword_1000EBD40)
      v59 = (FILE *)qword_1000EBD40;
    else
      v59 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v59);
    goto LABEL_107;
  }
  v35 = mmap(0, v86.st_size, 1, 1, v5, 0);
  close(v5);
  if (v35 == (_DWORD *)-1)
  {
    if (byte_1000EBD38)
    {
      v51 = *__error();
      v52 = sub_100030318();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        sub_10009219C();
      *__error() = v51;
    }
    if (byte_1000EBD39)
      v53 = dword_1000EB4E8 <= 3;
    else
      v53 = 0;
    if (!v53)
      return 0;
    v20 = *__error();
    v54 = *__error();
    v55 = __error();
    v56 = strerror(*v55);
    v57 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to map %s: %d (%s)"), a3, v54, v56);
    if (v57)
    {
      v25 = v57;
      CStringPtr = CFStringGetCStringPtr(v57, 0x8000100u);
      if (!CStringPtr)
      {
        v47 = 3861628004;
        goto LABEL_61;
      }
      goto LABEL_26;
    }
    v77 = sub_100030318();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      sub_100092128();
    goto LABEL_56;
  }
  if (v35 + 4 > (_DWORD *)((char *)v35 + v86.st_size)
    || (char *)v35 + v35[1] + 16 > (char *)v35 + v86.st_size)
  {
    if (byte_1000EBD38)
    {
      v36 = *__error();
      v37 = sub_100030318();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        sub_100092270();
      *__error() = v36;
    }
    if (!byte_1000EBD39 || dword_1000EB4E8 > 0)
      goto LABEL_139;
    v38 = *__error();
    v39 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Not a kcdata file: kcdata in %s not valid (file length %lld)"), a3, v86.st_size);
    if (v39)
    {
      v40 = v39;
      v41 = CFStringGetCStringPtr(v39, 0x8000100u);
      if (v41)
      {
LABEL_51:
        v42 = (char *)v41;
        v43 = 0;
LABEL_132:
        if (qword_1000EBD40)
          v78 = (FILE *)qword_1000EBD40;
        else
          v78 = __stderrp;
        fprintf(v78, "%s\n", v42);
        if (v43)
          free(v43);
        CFRelease(v40);
        goto LABEL_138;
      }
      v76 = 3020246809;
LABEL_131:
      v42 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v76);
      CFStringGetCString(v40, v42, 1024, 0x8000100u);
      v43 = v42;
      goto LABEL_132;
    }
    v70 = sub_100030318();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
      sub_100092210();
    goto LABEL_112;
  }
  if (*v35 != 1503811591)
  {
    if (byte_1000EBD38)
    {
      v72 = *__error();
      v73 = sub_100030318();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        sub_100092398();
      *__error() = v72;
    }
    if (!byte_1000EBD39 || dword_1000EB4E8 > 3)
      goto LABEL_139;
    v38 = *__error();
    LODWORD(v74) = *v35;
    if ((*v35 & 0xFFFFFFF0) == 0x20)
      v74 = 17;
    else
      v74 = v74;
    v75 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s isn't a kcdata stackshot file (header type %#x)"), a3, v74);
    if (v75)
    {
      v40 = v75;
      v41 = CFStringGetCStringPtr(v75, 0x8000100u);
      if (v41)
        goto LABEL_51;
      v76 = 1709161359;
      goto LABEL_131;
    }
    v79 = sub_100030318();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      sub_100092320();
LABEL_112:
    if (qword_1000EBD40)
      v71 = (FILE *)qword_1000EBD40;
    else
      v71 = __stderrp;
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v71);
LABEL_138:
    *__error() = v38;
LABEL_139:
    munmap(v35, v86.st_size);
    return 0;
  }
  v60 = objc_msgSend(objc_alloc((Class)SASampleStore), "initForFileParsing");
  if ((byte_1000EBD4C & 2) != 0 && sub_100025FB4())
  {
    if (byte_1000EBD38)
    {
      v61 = *__error();
      v62 = sub_100030318();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Avoiding inspecting live processes for stackshot file due to audio running", buf, 2u);
      }
      *__error() = v61;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 2)
    {
      v63 = *__error();
      v64 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Avoiding inspecting live processes for stackshot file due to audio running"));
      if (v64)
      {
        v65 = v64;
        v66 = CFStringGetCStringPtr(v64, 0x8000100u);
        if (v66)
        {
          v67 = (char *)v66;
          v68 = 0;
        }
        else
        {
          v67 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1C4EE10uLL);
          CFStringGetCString(v65, v67, 1024, 0x8000100u);
          v68 = v67;
        }
        if (qword_1000EBD40)
          v82 = (FILE *)qword_1000EBD40;
        else
          v82 = __stderrp;
        fprintf(v82, "%s\n", v67);
        if (v68)
          free(v68);
        CFRelease(v65);
      }
      else
      {
        v80 = sub_100030318();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
          sub_1000922E0(v80);
        if (qword_1000EBD40)
          v81 = (FILE *)qword_1000EBD40;
        else
          v81 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v81);
      }
      *__error() = v63;
    }
    objc_msgSend(v60, "setDataGatheringOptions:", (unint64_t)objc_msgSend(v60, "dataGatheringOptions") & 0xFFFFFFFFFFFFFFFDLL);
  }
  sub_10005993C(v60, (byte_1000EBD4C >> 3) & 1, (byte_1000EBD4C >> 2) & 1, (byte_1000EBD4C & 0x10) == 0);
  v83 = objc_alloc((Class)NSData);
  v84 = objc_msgSend(v83, "initWithBytesNoCopy:length:deallocator:", v35, v86.st_size, &stru_1000DD898);
  objc_msgSend(v60, "addKCDataStackshots:createSeparateSamplePerStackshot:", v84, 1);

  objc_msgSend(v60, "postprocess");
  return v60;
}

@end
