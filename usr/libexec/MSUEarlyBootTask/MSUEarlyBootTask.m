void MSUCleanupUUIDTextFolder(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", a1, 1));

}

void debug(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  if (serialLogLevel >= 2)
    vfprintf(__stderrp, a1, va);
  debugv((uint64_t)a1, (uint64_t)va);
}

void debugv(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11[1024];

  if (log_file)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v5, "setDateFormat:", CFSTR("HH:mm:ss"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));
    v7 = objc_alloc((Class)NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
    v9 = objc_msgSend(v7, "initWithFormat:arguments:", v8, a2);

    bzero(v11, 0x400uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v6, v9));
    objc_msgSend(v10, "getCString:maxLength:encoding:", v11, 1023, 4);

    fputs(v11, (FILE *)log_file);
  }
}

void error(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  if (serialLogLevel)
    vfprintf(__stderrp, a1, va);
  debugv((uint64_t)a1, (uint64_t)va);
}

FILE *init_log(int a1, int a2)
{
  int v3;
  passwd *v4;
  uid_t pw_uid;
  gid_t pw_gid;
  const char *v7;
  FILE *result;

  serialLogLevel = a2;
  mkdir("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", 0x1EDu);
  v3 = MSUEarlyBootTaskSetupACLForPath(CFSTR("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask"));
  if ((v3 & 1) != 0)
  {
    debug("MSUEarlyBootTask: Set up ACL on log folder\n");
  }
  else
  {
    error("MSUEarlyBootTask: Failed to set up ACL on log folder\n");
    v4 = getpwnam("mobile");
    if (v4)
    {
      pw_uid = v4->pw_uid;
      pw_gid = v4->pw_gid;
    }
    else
    {
      pw_gid = 501;
      pw_uid = 501;
    }
    lchown("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", pw_uid, pw_gid);
    lchmod("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", 0x1EDu);
  }
  if (a1)
    v7 = "a+";
  else
    v7 = "w+";
  result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", v7);
  log_file = (uint64_t)result;
  if (v3)
  {
    fclose(result);
    if ((MSUEarlyBootTaskSetupACLForPath(CFSTR("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log")) & 1) != 0)
      debug("MSUEarlyBootTas: Set up ACL on log file\n");
    else
      error("MSUEarlyBootTask: Failed to set up acl on log file\n");
    result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", "a+");
    log_file = (uint64_t)result;
  }
  return result;
}

uint64_t MSUEarlyBootTaskSetupACLForPath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSFileAttributeType v5;
  NSFileAttributeType v6;
  NSFileAttributeType v7;
  void *v8;
  uint64_t v9;
  passwd *v10;
  gid_t pw_gid;
  uid_t pw_uid;
  id v13;
  int *v14;
  char *v15;
  id v16;
  char v18;
  _OWORD v19[8];

  v1 = a1;
  v18 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v1, &v18))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributesOfItemAtPath:error:", v1, 0));
    v4 = v3;
    if (!v3)
    {
      objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
      error("Failed to read attributes of item at path: %s\n");
      goto LABEL_19;
    }
    v5 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileType"));
    v6 = v5;
    if (v5 == NSFileTypeDirectory)
    {

    }
    else
    {
      v7 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileType"));

      if (v7 != NSFileTypeRegular)
      {
        memset(v19, 0, sizeof(v19));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileType"));
        objc_msgSend(v8, "getCString:maxLength:encoding:", v19, 127, 4);

        objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
        error("File %s is a unsupported type(%s)");
LABEL_19:
        v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    if (v18)
    {
      v9 = MSUEarlyBootTaskSetupACLForPath_dirAcl;
      if (!MSUEarlyBootTaskSetupACLForPath_dirAcl)
      {
        v9 = (uint64_t)MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(1);
        MSUEarlyBootTaskSetupACLForPath_dirAcl = v9;
        if (!v9)
        {
LABEL_22:
          error("%s: Failed to alloc acl..bailing\n", "MSUEarlyBootTaskSetupACLForPath");
          goto LABEL_23;
        }
      }
    }
    else
    {
      v9 = MSUEarlyBootTaskSetupACLForPath_fileAcl;
      if (!MSUEarlyBootTaskSetupACLForPath_fileAcl)
      {
        v9 = (uint64_t)MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(0);
        MSUEarlyBootTaskSetupACLForPath_fileAcl = v9;
        if (!v9)
          goto LABEL_22;
      }
    }
    v10 = getpwnam("nobody");
    if (v10)
    {
      pw_uid = v10->pw_uid;
      pw_gid = v10->pw_gid;
      v13 = objc_retainAutorelease(v1);
      if (acl_set_link_np((const char *)objc_msgSend(v13, "fileSystemRepresentation"), ACL_TYPE_EXTENDED, (acl_t)v9))
      {
        v14 = __error();
        v15 = strerror(*v14);
        error("%s: Call to acl_set_file failed(%s)\n", "MSUEarlyBootTaskSetupACLForPath", v15);
      }
      else
      {
        v16 = objc_retainAutorelease(v13);
        lchown((const char *)objc_msgSend(v16, "fileSystemRepresentation"), pw_uid, pw_gid);
        lchmod((const char *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation"), 0);
      }
      v9 = 1;
      goto LABEL_23;
    }
    error("%s: Failed to get uid to set up acl\n");
    goto LABEL_19;
  }
  v9 = 1;
LABEL_24:

  return v9;
}

uint64_t flush_log()
{
  uint64_t result;

  result = log_file;
  if (log_file)
  {
    fflush((FILE *)log_file);
    return fclose((FILE *)log_file);
  }
  return result;
}

char *copy_path_for_booted_os_data()
{
  const __CFData *v0;
  const __CFData *v1;
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v4;
  CFMutableStringRef Mutable;
  __CFString *v6;
  unsigned int v7;
  char *v8;
  char *v9;
  char buffer[16];
  __int128 v12;
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

  v0 = (const __CFData *)MGCopyAnswer(CFSTR("BootManifestHash"), 0);
  if (!v0)
  {
    printf("%s: Failed to query gestalt for the BootManifestHash\n", "copy_path_for_booted_os_data");
    return 0;
  }
  v1 = v0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)buffer = 0u;
  v12 = 0u;
  Length = CFDataGetLength(v0);
  BytePtr = CFDataGetBytePtr(v1);
  if (!BytePtr)
  {
    printf("%s: Failed to get byte pointer from bootManifestHash data returned by gestalt\n");
LABEL_12:
    CFRelease(v1);
    return 0;
  }
  v4 = BytePtr;
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    printf("%s: Failed to create bootManifestHashString\n");
    goto LABEL_12;
  }
  v6 = Mutable;
  if (Length >= 1)
  {
    do
    {
      v7 = *v4++;
      CFStringAppendFormat(v6, 0, CFSTR("%02x"), v7);
      --Length;
    }
    while (Length);
  }
  CFStringGetCString(v6, buffer, 512, 0x8000100u);
  if (buffer[0])
  {
    v8 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    v9 = v8;
    if (v8)
    {
      bzero(v8, 0x400uLL);
      snprintf(v9, 0x3FFuLL, "%s/%s-MSUData", "/private/var/MobileSoftwareUpdate/", buffer);
    }
    else
    {
      printf("%s: Failed to allocate memory for storing the path to the bootedOSData folder\n", "copy_path_for_booted_os_data");
    }
  }
  else
  {
    printf("%s: Failed to get C string representation of bootManifestHash\n", "copy_path_for_booted_os_data");
    v9 = 0;
  }
  CFRelease(v1);
  CFRelease(v6);
  return v9;
}

uint64_t move_directory_hierarchy(char *a1, const char *a2)
{
  FTS *v4;
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  size_t v8;
  int fts_info;
  double v10;
  double v11;
  double v12;
  int *v13;
  char *v14;
  int *v16;
  uint64_t v17;
  char __str[1024];
  char *v19[2];

  v19[0] = a1;
  v19[1] = 0;
  if (!a1 || !a2)
  {
    error("Invalid argument passed to %s", "move_directory_hierarchy");
    return 22;
  }
  v4 = fts_open(v19, 20, 0);
  if (!v4)
  {
    v13 = __error();
    v14 = strerror(*v13);
    error("Failed to open source directory hierarchy: %s\n", v14);
    return *__error();
  }
  v5 = v4;
  v6 = fts_read(v4);
  if (!v6)
  {
LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  v7 = v6;
  while (1)
  {
    if (v7->fts_info == 7)
    {
      error("Got error while traversing source directory %s", a1);
      goto LABEL_21;
    }
    bzero(__str, 0x400uLL);
    v8 = strlen(a1);
    snprintf(__str, 0x3FFuLL, "%s%s", a2, &v7->fts_path[v8]);
    fts_info = v7->fts_info;
    if ((fts_info - 12) >= 2)
      break;
    if (copyfile(v7->fts_path, __str, 0, 0x12C000Fu))
    {
      v17 = *__error();
      error("Failed to recreate symlink %s at %s: %d\n");
      goto LABEL_22;
    }
LABEL_16:
    v7 = fts_read(v5);
    if (!v7)
      goto LABEL_21;
  }
  if (fts_info != 8)
  {
    if (fts_info == 1 && copyfile(v7->fts_path, __str, 0, 7u))
    {
      v16 = __error();
      v17 = *v16;
      error("Failed to recreate folder %s at %s: %d\n", v7->fts_path, __str, *v16);
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  if (!copyfile(v7->fts_path, __str, 0, 0x13C000Fu))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    totalDataMoved += v7->fts_statp->st_size;
    *(double *)&totalTimeSpentInFileMoves = v12 - v11 + *(double *)&totalTimeSpentInFileMoves;
    goto LABEL_16;
  }
  v17 = *__error();
  error("Failed to move regular file %s to %s: %d\n");
LABEL_22:
  fts_close(v5);
  return v17;
}

uint64_t moveFolderContentsIfItExists(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v12;
  char v13;
  _OWORD v14[32];
  char v15[1024];
  char v16[1024];

  v3 = a1;
  v4 = a2;
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (v3 && v4)
  {
    bzero(v16, 0x400uLL);
    bzero(v15, 0x400uLL);
    objc_msgSend(v3, "getCString:maxLength:encoding:", v16, 1023, 4);
    objc_msgSend(v4, "getCString:maxLength:encoding:", v15, 1023, 4);
    if (!v16[0] || !v15[0])
      error("%s: Unable to convert source/destination paths to C strings", "moveFolderContentsIfItExists");
    debug("%s: Checking for source folder at: %s\n", "moveFolderContentsIfItExists", v16);
    objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v3, &v13);
    if (!v13)
    {
      debug("%s: Source folder %s does not exist\n");
      goto LABEL_18;
    }
    debug("%s: Folder exists..Attempting to move to %s\n", "moveFolderContentsIfItExists", v15);
    if ((move_directory_hierarchy(v16, v15) & 0x80000000) == 0)
    {
      v12 = 0;
      objc_msgSend(v5, "removeItemAtPath:error:", v3, &v12);
      v6 = v12;
      if (v6)
      {
        v7 = v6;
        memset(v14, 0, sizeof(v14));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
        objc_msgSend(v8, "getCString:maxLength:encoding:", v14, 511, 4);

        if (LOBYTE(v14[0]))
          v9 = (const char *)v14;
        else
          v9 = "Unable to parse error reason";
        error("%s: Failed to remove %s folder(%s)\n", "moveFolderContentsIfItExists", v16, v9);

        goto LABEL_14;
      }
      debug("%s: Successfully moved %s to %s\n");
LABEL_18:
      v10 = 1;
      goto LABEL_19;
    }
    error("%s: Failed to move folder contents\n");
  }
  else
  {
    error("%s: Invalid arguments passed to source/destination");
  }
LABEL_14:
  v10 = 0;
LABEL_19:

  return v10;
}

int main(int argc, const char **argv, const char **envp)
{
  int v3;
  const char *v4;
  void *v5;
  char *v6;
  const char *v7;
  id v8;
  int v9;
  const char *v10;
  id v11;
  id v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  char *v18;
  char *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  _UNKNOWN **v30;
  void *i;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  const char *v36;
  id v37;
  char *f_mntfromname;
  char *v39;
  int *v40;
  char *v41;
  void *v42;
  char *v43;
  char *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  const char *v53;
  __CFString *v54;
  FTS *v55;
  FTS *v56;
  void *v57;
  FTSENT *v58;
  FTSENT *v59;
  int fts_info;
  int st_mode;
  int *v62;
  char *v63;
  stat *fts_statp;
  uid_t st_uid;
  gid_t st_gid;
  int *v67;
  int *v68;
  int fts_errno;
  int *v70;
  char *v71;
  int *v72;
  char *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  int v80;
  int v81;
  int *v82;
  int *v83;
  _UNKNOWN **v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  const __CFDictionary *v89;
  io_service_t MatchingService;
  io_registry_entry_t v91;
  id v92;
  id v93;
  const __CFString *CFProperty;
  const __CFString *v95;
  CFTypeID v96;
  int v97;
  char *v98;
  int *v99;
  int v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  off_t v104;
  int v105;
  int v106;
  int *v107;
  char *v108;
  int *v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  const char *v115;
  id v116;
  void *v117;
  const char *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  unsigned int v123;
  id v124;
  const char *v125;
  const char *v126;
  id v127;
  unsigned int v128;
  id v129;
  _BYTE *v130;
  _BYTE *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  void *v137;
  id v138;
  _UNKNOWN **v139;
  void *v140;
  const char *v141;
  FTS *v142;
  FTS *v143;
  FTSENT *v144;
  FTSENT *v145;
  void *v146;
  void *v147;
  char *v148;
  void *v149;
  char v150;
  char *v151;
  int *v153;
  int *v154;
  int *v155;
  int *v156;
  int *v157;
  int *v158;
  char *v159;
  int *v160;
  char *v161;
  int *v162;
  char *v163;
  int *v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  const char *v179;
  char *v180;
  void *v181;
  id v182;
  void *v183;
  time_t v184;
  id v185;
  id v186;
  id v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  id v193;
  id v194;
  time_t v195;
  char v196;
  uint64_t v197;
  int v198;
  uint64_t v199;
  off_t v200;
  __int128 v201;
  __int128 v202;
  stat v203;
  stat v204;
  _BYTE v205[128];
  statfs v206;
  char *v207[128];
  stat v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _OWORD v232[64];
  const __CFString *v233;
  void *v234;
  const __CFString *v235;
  void *v236;
  _QWORD v237[2];
  _QWORD v238[2];
  _OWORD buf[2];

  bzero(&v206, 0x878uLL);
  if (statfs("/", &v206))
    main_cold_1();
  if ((v206.f_flags & 0x40000000) == 0)
  {
    v3 = access("/usr/appleinternal/bin/snapshottool", 0);
    v4 = "/usr/local/bin/snapshottool";
    if (!v3)
      v4 = "/usr/appleinternal/bin/snapshottool";
    *(_QWORD *)&v232[0] = v4;
    *((_QWORD *)&v232[0] + 1) = "golive";
    *(_QWORD *)&v232[1] = "cryptexes";
    *((_QWORD *)&v232[1] + 1) = 0;
    execForMSUEarlyBootTask((const char **)v232);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v196 = 0;
  puts("MSUEarlyBootTask: MSUEarlyBootTask running");
  v195 = 0;
  time(&v195);
  v6 = copy_path_for_booted_os_data();
  if (!v6)
  {
    printf("%s: Unable to get path for booted OS data\n", "main");
    goto LABEL_244;
  }
  v7 = v6;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), v6);
  if (&_os_variant_uses_ephemeral_storage)
  {
    v9 = os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate");
    if (v9)
      v10 = "MSUEarlyBootTask running in limited env";
    else
      v10 = "MSUEarlyBootTask running in normal env";
    puts(v10);
    if (v9)
    {
      printf("%s: MSUEarlyBootTask running in a limited environment and is not supported..Goodbye!\n", "main");
      goto LABEL_243;
    }
  }
  else
  {
    puts("MSUEarlyBootTask is running in normal env(default)");
  }
  printf("%s: Content from the ramdisk will be present at %s if it exists\n", "main", v7);
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%s"), v8, "EarlyBootTaskHasCompleted.txt");
  objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v8, &v196);
  if (!v196)
  {
    puts("MSUEarlyBootTask: I have nothing to do. Goodbye!!");

    goto LABEL_243;
  }
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%s"), v8, "PluginHasCompleted.txt");
  if (objc_msgSend(v5, "fileExistsAtPath:", v12))
  {
    init_log(1, 3);
    v13 = ctime(&v195);
    debug("MSUEarlyBootTask running. Found cookie written by DataMigrator indicating the first boot operations have already completed: %s\n", v13);
    v194 = 0;
    objc_msgSend(v5, "removeItemAtPath:error:", v8, &v194);
    v14 = v194;
    v15 = v14;
    if (v14)
    {
      memset(v232, 0, 512);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
      objc_msgSend(v16, "getCString:maxLength:encoding:", v232, 511, 4);

      if (LOBYTE(v232[0]))
        v17 = (const char *)v232;
      else
        v17 = "Unable to parse error reason";
      error("%s: Failed to remove folder stashed by previous ramdisk : %s : Task exiting cleanly\n", "main", v17);
    }
    else
    {
      debug("%s: Successfully removed folder stashed by previous ramdisk\n", "main");
    }
    v19 = ctime(&v195);
    printf("%s: MSUDataMigrator has nothing more to do(%s)..Goodbye!!\n", "main", v19);

    goto LABEL_243;
  }
  init_log(0, 3);
  v18 = ctime(&v195);
  debug("%s: MSUEarlyBootTask running..Found data created by previous ramdisk. Assuming first boot after update at time %s\n", "main", v18);
  debug("%s: MSUEarlyBootTask: Enabling vnode rapid aging\n", "main");
  *(_QWORD *)&v232[0] = 0x4400000001;
  v208.st_dev = 1;
  if (sysctl((int *)v232, 2u, 0, 0, &v208, 0))
    error("%s: MSUEarlyBootTask: Failed to enable vnode rapid aging\n", "main");
  else
    debug("%s: MSUEarlyBootTask: Successfully enabled rapid vnode aging\n", "main");
  if ((MSUEarlyBootTaskSetupACLForPath(v8) & 1) != 0)
    debug("MSUEarlyBootTask: Successfully set up ACL for folder stashed by ramdisk\n");
  else
    error("MSUEarlyBootTask: Failed to set up ACL for folder stashed by ramdisk\n");

  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%s"), v8, "LOW_SPACE_CLEANUP_RUN.txt");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%s"), v8, "SYSTEM_APPS_STAGE_FAILED.txt");
  if (objc_msgSend(v5, "fileExistsAtPath:", v20))
    debug("MSUEarlyBootTask: Low space cleanup was done on last restore\n");
  if (objc_msgSend(v5, "fileExistsAtPath:", v21))
    debug("MSUEarlyBootTask: Staging of staged_system_apps failed during the last restore\n");
  debug("MSUEarlyBootTasks: Cleaning up stale stashed paths\n");
  v193 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/MobileSoftwareUpdate/"), &v193));
  v23 = v193;
  v182 = v8;
  if (v23)
  {
    memset(v232, 0, 512);
    v183 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
    objc_msgSend(v24, "getCString:maxLength:encoding:", v232, 511, 4);

    if (LOBYTE(v232[0]))
      v25 = (const char *)v232;
    else
      v25 = "Unable to parse error reason";
    error("%s: Failed to search for stale stashed folders: %s\n", "main", v25);
  }
  else
  {
    v173 = v21;
    v177 = v20;
    v179 = v7;
    v191 = 0u;
    v192 = 0u;
    v189 = 0u;
    v190 = 0u;
    v175 = v22;
    v26 = v22;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v189, v205, 16);
    if (v27)
    {
      v28 = v27;
      v183 = 0;
      v29 = *(_QWORD *)v190;
      v30 = &APFSOverProvModel_ptr;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v190 != v29)
            objc_enumerationMutation(v26);
          v32 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * (_QWORD)i);
          bzero(v232, 0x400uLL);
          v33 = objc_msgSend(objc_alloc((Class)v30[22]), "initWithFormat:", CFSTR("%s/%@"), "/private/var/MobileSoftwareUpdate/", v32);
          if (objc_msgSend(v33, "containsString:", CFSTR("-MSUData"))
            && (objc_msgSend(v33, "isEqualToString:", v182) & 1) == 0)
          {
            objc_msgSend(v33, "getCString:maxLength:encoding:", v232, 1023, 1);
            debug("%s: Removing folder :%s:\n", "main", (const char *)v232);

            v188 = 0;
            objc_msgSend(v5, "removeItemAtPath:error:", v33, &v188);
            v34 = v188;
            if (v34)
            {
              v231 = 0u;
              v230 = 0u;
              v229 = 0u;
              v228 = 0u;
              v227 = 0u;
              v226 = 0u;
              v225 = 0u;
              v224 = 0u;
              v223 = 0u;
              v222 = 0u;
              v221 = 0u;
              v220 = 0u;
              v219 = 0u;
              v218 = 0u;
              v217 = 0u;
              v216 = 0u;
              v215 = 0u;
              v214 = 0u;
              v213 = 0u;
              v212 = 0u;
              v211 = 0u;
              v210 = 0u;
              v209 = 0u;
              memset(&v208, 0, sizeof(v208));
              v183 = v34;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "description"));
              objc_msgSend(v35, "getCString:maxLength:encoding:", &v208, 511, 4);

              v36 = (const char *)&v208;
              if (!LOBYTE(v208.st_dev))
                v36 = "Unable to parse error reason";
              error("%s: Failed to erase folder %s : %s\n", "main", (const char *)v232, v36);
            }
            else
            {
              v183 = 0;
            }
            v30 = &APFSOverProvModel_ptr;
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v189, v205, 16);
      }
      while (v28);
    }
    else
    {
      v183 = 0;
    }

    v8 = v182;
    v21 = v173;
    v20 = v177;
    v7 = v179;
    v22 = v175;
  }
  if (objc_msgSend(v5, "fileExistsAtPath:", v11))
  {
    debug("EarlyBootTask has already completed but DataMigrator plugin has not been run for this build\n");

    goto LABEL_243;
  }
  v174 = v21;
  v176 = v22;
  v178 = v20;
  v180 = (char *)v7;
  MSUCleanupUUIDTextFolder((uint64_t)CFSTR("/"));
  debug("%s: Running fixup var operations\n", "main");
  debug("entering %s\n", "update_var_directory_hierarchy");
  v181 = v5;
  if (mkdir("/private/var/MobileSoftwareUpdate/mnt1", 0x1C0u) && *__error() != 17)
  {
    v40 = __error();
    v41 = strerror(*v40);
    error("Failed to create system volume mount point at %s : %s\n", "/private/var/MobileSoftwareUpdate/mnt1", v41);
    goto LABEL_127;
  }
  debug("Created system mount point at %s\n", "/private/var/MobileSoftwareUpdate/mnt1");
  if ((v206.f_flags & 0x40000000) != 0)
  {
    v37 = v8;
    v39 = strrchr(v206.f_mntfromname, 64);
    if (v39)
      f_mntfromname = v39 + 1;
    else
      f_mntfromname = v206.f_mntfromname;
  }
  else
  {
    v37 = v8;
    f_mntfromname = v206.f_mntfromname;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", f_mntfromname));
  if (!v42)
  {
    error("Failed to get bsd node for root dev...\n");
    goto LABEL_126;
  }
  if ((v206.f_flags & 0x40000000) == 0)
  {
    debug("System is currently rooted from a live filesystem\n");
    v43 = copy_root_snapshot_name_from_dt();
    if (!v43)
    {
      error("Failed to copy default boot snapshot name");

      v8 = v37;
      goto LABEL_77;
    }
    v44 = v43;
    debug("Will attempt to mount snapshot %s at %s\n", v43, "/private/var/MobileSoftwareUpdate/mnt1");
    v45 = objc_retainAutorelease(v42);
    if (msuearlyboottask_mount_filesystem((const char *)objc_msgSend(v45, "fileSystemRepresentation"), v44, 1))
    {
      free(v44);
      error("Failed to mount snapshot..\n");

LABEL_126:
      v8 = v37;
      goto LABEL_127;
    }
    debug("Successfully mounted system snapshot..\n");
    msuearlyboottask_dump_mounted_filesystem_info();
    free(v44);
    goto LABEL_85;
  }
  debug("System is currently rooted from a snapshot\n");
  v46 = objc_retainAutorelease(v42);
  if (msuearlyboottask_mount_filesystem((const char *)objc_msgSend(v46, "fileSystemRepresentation"), 0, 0))
  {
    error("Failed to mount system volume..\n");
LABEL_125:

    goto LABEL_126;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v206.f_mntfromname));
  v48 = v47;
  if (v47)
  {
    v49 = v47;
    *(_QWORD *)&v208.st_dev = 0;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(.+@)?(\\/dev\\/.+$)"), 1, &v208));
    v51 = *(id *)&v208.st_dev;
    v169 = v50;
    v171 = v49;
    if (v51)
    {
      bzero(v232, 0x400uLL);
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "description"));
      objc_msgSend(v52, "getCString:maxLength:encoding:", v232, 1024, 4);

      if (LOBYTE(v232[0]))
        v53 = (const char *)v232;
      else
        v53 = "Unknown";
      error("Error %s encountered creating regular expression..\n", v53);
      v54 = &stru_100008688;
    }
    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstMatchInString:options:range:", v49, 0, 0, objc_msgSend(v49, "length")));
      v75 = v74;
      if (v74)
      {
        v76 = objc_msgSend(v74, "rangeAtIndex:", 1);
        if (v77)
          v78 = v76;
        else
          v78 = 0;
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "substringWithRange:", v78, v77));
      }
      else
      {
        v54 = &stru_100008688;
      }

      v5 = v181;
    }

    if (-[__CFString hasSuffix:](v54, "hasSuffix:", CFSTR("@")))
    {
      v79 = objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v54, "substringToIndex:", (char *)-[__CFString length](v54, "length") - 1));

      v54 = (__CFString *)v79;
    }
  }
  else
  {
    error("could not create string from f_mntfromname %s\n", v206.f_mntfromname);
    v54 = &stru_100008688;
  }

  bzero(v232, 0x400uLL);
  -[__CFString getCString:maxLength:encoding:](v54, "getCString:maxLength:encoding:", v232, 1024, 4);
  v80 = open("/private/var/MobileSoftwareUpdate/mnt1", 0);
  if (v80 < 0)
  {
    v83 = __error();
    strerror(*v83);
    error("Failed to open system volume mount point(%s): %s\n");
LABEL_124:

    goto LABEL_125;
  }
  v81 = v80;
  debug("Reverting to snapshot(%s)\n", (const char *)v232);
  if (fs_snapshot_revert(v81, (const char *)v232, 0))
  {
    v82 = __error();
    strerror(*v82);
    error("revert snapshot operation failed: %s\n");
LABEL_148:

    close(v81);
    v8 = v37;
    goto LABEL_127;
  }
  debug("Reverting system snapshot succeeded. Remounting.\n");
  if (close(v81))
  {
    v99 = __error();
    strerror(*v99);
    error("Unable to close dir(%s): %s\n");
    goto LABEL_148;
  }
  debug("Unmounting system volume..\n");
  msuearlyboottask_unmount_filesystem();
  debug("Remounting system volume at %s\n", "/private/var/MobileSoftwareUpdate/mnt1");
  if (msuearlyboottask_mount_filesystem((const char *)objc_msgSend(objc_retainAutorelease(v46), "fileSystemRepresentation"), 0, 0))
  {
    error("Failed to mount system volume..\n");
    goto LABEL_124;
  }
  debug("Successfully re-mounted system volume...\n");
  msuearlyboottask_dump_mounted_filesystem_info();

LABEL_85:
  *(_OWORD *)v207 = off_100008418;
  v55 = fts_open(v207, 84, 0);
  if (!v55)
  {
    v72 = __error();
    v73 = strerror(*v72);
    error("unable to open restored /private/var: %s\n", v73);
    fts_errno = -1;
    goto LABEL_169;
  }
  v56 = v55;
  v57 = v5;
  v58 = fts_read(v55);
  if (!v58)
  {
LABEL_106:
    if (*__error())
    {
      fts_errno = *__error();
      v70 = __error();
      v71 = strerror(*v70);
      error("fts_read failed: %s\n", v71);
    }
    else
    {
      fts_errno = 0;
    }
    goto LABEL_168;
  }
  v59 = v58;
  while (1)
  {
    fts_info = v59->fts_info;
    if (fts_info == 1)
    {
      memset(&v208, 0, sizeof(v208));
      memcpy(v232, "/private/var", sizeof(v232));
      __strlcat_chk(v232, v59->fts_path + 50, 1024, 1024);
      if (lstat((const char *)v232, &v208))
      {
        if (*__error() == 2)
        {
          if (ramrod_create_directory_with_class(v232, v59->fts_statp->st_mode, v59->fts_statp->st_uid, v59->fts_statp->st_gid, -1, 0))error("ramrod_create_directory failed for %s\n");
          else
            debug("Successfully created directory %s\n");
        }
        else
        {
          v68 = __error();
          strerror(*v68);
          debug("stat failed on %s: %s\n");
        }
      }
      else if ((v208.st_mode & 0xF000) == 0x4000)
      {
        st_mode = v59->fts_statp->st_mode;
        if (v208.st_mode != st_mode)
        {
          debug("fixing permissions on %s: %o -> %o\n", (const char *)v232, v208.st_mode, st_mode);
          if (chmod((const char *)v232, v59->fts_statp->st_mode))
          {
            v62 = __error();
            v63 = strerror(*v62);
            error("unable to fix permissions: %s\n", v63);
          }
        }
        fts_statp = v59->fts_statp;
        st_uid = fts_statp->st_uid;
        st_gid = fts_statp->st_gid;
        if (*(_QWORD *)&v208.st_uid != __PAIR64__(st_gid, st_uid))
        {
          debug("fixing ownership on %s: %d:%d -> %d:%d\n", (const char *)v232, v208.st_uid, v208.st_gid, st_uid, st_gid);
          if (chown((const char *)v232, v59->fts_statp->st_uid, v59->fts_statp->st_gid))
          {
            v67 = __error();
            strerror(*v67);
            error("unable to fix ownership: %s\n");
          }
        }
      }
      else
      {
        debug("%s is a directory in the new image but not on the existing partition\n");
      }
      goto LABEL_105;
    }
    if (fts_info == 7)
      break;
LABEL_105:
    v59 = fts_read(v56);
    if (!v59)
      goto LABEL_106;
  }
  v108 = strerror(v59->fts_errno);
  error("fts_read error %d: %s\n", 7, v108);
  fts_errno = v59->fts_errno;
  if (!fts_errno)
    goto LABEL_106;
LABEL_168:
  fts_close(v56);
  v5 = v57;
LABEL_169:
  debug("Unmounting system volume from %s.\n", "/private/var/MobileSoftwareUpdate/mnt1");
  msuearlyboottask_unmount_filesystem();
  msuearlyboottask_dump_mounted_filesystem_info();

  v8 = v37;
  if (!fts_errno)
  {
LABEL_77:
    debug("%s: Successfully completed fixup_var operations\n", "main");
    goto LABEL_128;
  }
LABEL_127:
  error("%s: Failed to fixup var(Not fatal)..\n", "main");
LABEL_128:
  v84 = &APFSOverProvModel_ptr;
  debug("%s: Checking for and creating overprovisioning file if needed\n", "main");
  v85 = APFSOverProvModel();
  if (v85 != 1)
  {
    debug("%s: APFS overprovisioning model is %d. Not reserving space for overprovisioning file \n", "msu_reserve_space_for_overprovisioning", v85);
LABEL_139:
    debug("%s: Succesfully handled checks for overprovisioning file/volume\n", "main");
    goto LABEL_175;
  }
  v202 = 0u;
  memset(&v203, 0, sizeof(v203));
  v201 = 0u;
  v199 = 0;
  v200 = 0;
  v237[0] = CFSTR("IOParentMatch");
  v235 = CFSTR("IOPropertyMatch");
  v233 = CFSTR("EmbeddedDeviceTypeRoot");
  v234 = &__kCFBooleanTrue;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1));
  v236 = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v236, &v235, 1));
  v237[1] = CFSTR("IOPropertyMatch");
  v238[0] = v87;
  v238[1] = &off_1000087C0;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v238, v237, 2));

  if (!stat("/private/var/.overprovisioning_file", &v203))
  {
    debug("%s: Space already reserved for overprovisioning\n", "msu_reserve_space_for_overprovisioning");

    goto LABEL_139;
  }
  v89 = v88;
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v89);
  if (!MatchingService)
  {
    error("%s: Failed to get IOService for %s\n");
LABEL_142:

    goto LABEL_174;
  }
  v91 = MatchingService;
  v92 = v11;
  v93 = v8;
  debug("%s: Successfully obtained ioService for %s\n", "msu_reserve_space_for_overprovisioning", "EmbeddedDeviceTypeRoot");
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v91, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    v11 = v92;
    v84 = &APFSOverProvModel_ptr;
    error("%s: no BSD device name for service %s");
    goto LABEL_142;
  }
  v95 = CFProperty;
  v96 = CFGetTypeID(CFProperty);
  if (v96 != CFStringGetTypeID())
  {
    error("%s: returnbed BSD device name for service %s is wrong type");
LABEL_145:
    v97 = 5;
LABEL_172:
    CFRelease(v95);
    v8 = v93;
    goto LABEL_173;
  }
  bzero(v232, 0x400uLL);
  if (!CFStringGetCString(v95, (char *)v232, 1023, 0x8000100u))
  {
    error("%s: failed to create C string from BSD name\n");
    goto LABEL_145;
  }
  bzero(&v208, 0x400uLL);
  snprintf((char *)&v208, 0x3FFuLL, "/dev/%s", (const char *)v232);
  debug("%s: Full path to device node for service %s is :%s:\n", "msu_reserve_space_for_overprovisioning", "EmbeddedDeviceTypeRoot", (const char *)&v208);
  bzero(v207, 0x400uLL);
  memset(&v204, 0, sizeof(v204));
  if (!stat((const char *)&v208, &v204))
  {
    if ((v204.st_mode & 0xF000) == 0x6000)
    {
      memset(buf, 0, sizeof(buf));
      devname_r(v204.st_rdev, 0x2000u, (char *)buf, 32);
      snprintf((char *)v207, 0x3FFuLL, "/dev/%s", (const char *)buf);
      goto LABEL_151;
    }
    error("%s: %s is not a block device\n", "msu_partition_raw_device_for_block_device", (const char *)&v208);
    v97 = -1;
    goto LABEL_164;
  }
  v97 = *__error();
  v98 = strerror(v97);
  error("%s: unable to stat block device %s: %s\n", "msu_partition_raw_device_for_block_device", (const char *)&v208, v98);
  if (v97)
  {
LABEL_164:
    error("%s: Failed to get raw device node for block device %s\n");
    goto LABEL_172;
  }
LABEL_151:
  v100 = open((const char *)v207, 0);
  if (v100 == -1)
  {
    v97 = *__error();
    v109 = __error();
    strerror(*v109);
    error("%s: Unable to open device: %s\n");
    goto LABEL_172;
  }
  v101 = v100;
  v198 = 0;
  v197 = 0;
  if (ioctl(v100, 0x40046418uLL, &v198) == -1)
  {
    v97 = *__error();
    v153 = __error();
    strerror(*v153);
    error("%s: unable to get DKIOCGETBLOCKSIZE: %s\n");
LABEL_248:
    v106 = -1;
    goto LABEL_258;
  }
  if (ioctl(v101, 0x40086419uLL, &v197) == -1)
  {
    v97 = *__error();
    v154 = __error();
    strerror(*v154);
    error("%s: unable to get DKIOCGETBLOCKCOUNT: %s \n");
    goto LABEL_248;
  }
  v102 = v197 * v198;
  v103 = v102 + 0x3FFFFFFF;
  if (v102 >= 0)
    v103 = v197 * v198;
  debug("%s: device_size = %llu (%lld GB)\n", "msu_reserve_space_for_overprovisioning", v197 * v198, v103 >> 30);
  if (v102 <= 0x1900000063)
    v104 = v102 / 100;
  else
    v104 = 0x40000000;
  debug("%s: file_size = %llu (%lld GB)\n", "msu_reserve_space_for_overprovisioning", v104, v104 / 0x40000000);
  v105 = open_dprotected_np("/private/var/.overprovisioning_file", 2562, 4, 0, 384);
  v106 = v105;
  if (v105 == -1)
  {
    v97 = *__error();
    v155 = __error();
    strerror(*v155);
    error("%s: Could not open %s with error %s\n");
    goto LABEL_257;
  }
  v201 = 0x30000000EuLL;
  *(_QWORD *)&v202 = v104;
  if (fcntl(v105, 42, &v201) != -1)
    goto LABEL_161;
  if (*__error() != 28)
  {
    if (!*__error())
      goto LABEL_161;
    v158 = __error();
    v159 = strerror(*v158);
    error("%s: fcntl(2) failed trying to allocate contiguous space all at once with error: %s", "msu_reserve_space_for_overprovisioning", v159);
    goto LABEL_265;
  }
  LODWORD(v201) = 10;
  if (fcntl(v106, 42, &v201) != -1)
    goto LABEL_161;
  if (*__error() == 28)
  {
    LODWORD(v201) = 8;
    if (fcntl(v106, 42, &v201) == -1)
    {
      v97 = *__error();
      v156 = __error();
      strerror(*v156);
      error("%s: preallocation of %llu bytes failed with error: (%s). (Allocated %llu bytes)\n");
      goto LABEL_257;
    }
LABEL_161:
    if (ftruncate(v106, v104))
    {
      v97 = *__error();
      v107 = __error();
      strerror(*v107);
      error("%s: failed to write to %s file to establish the size (%s).\n");
      goto LABEL_257;
    }
    if (fcntl(v106, 51, 0))
    {
      v97 = *__error();
      v157 = __error();
      strerror(*v157);
      error("%s: failed to fullsync %s file with %s.\n");
      goto LABEL_257;
    }
    v199 = 0;
    v200 = v104;
    if (fcntl(v106, 100, &v199) == -1)
    {
      v97 = *__error();
      v160 = __error();
      v161 = strerror(*v160);
      error("%s: F_TRIM_ACTIVE_FILE failed with: %s \n", "msu_reserve_space_for_overprovisioning", v161);
      close(v106);
      if (unlink("/private/var/.overprovisioning_file"))
      {
        v162 = __error();
        v163 = strerror(*v162);
        error("%s: failed to unlink %s: %s \n", "msu_reserve_space_for_overprovisioning", "/private/var/.overprovisioning_file", v163);
        v97 = *__error();
      }
      v106 = -1;
    }
    else
    {
LABEL_265:
      v97 = 0;
    }
  }
  else
  {
    if (!*__error())
      goto LABEL_161;
    v97 = *__error();
    v164 = __error();
    strerror(*v164);
    error("%s: fcntl(2) failed trying to allocate contiguous space with error: %s");
  }
LABEL_257:
  v5 = v181;
LABEL_258:
  CFRelease(v95);
  if ((v101 & 0x80000000) == 0)
    close(v101);
  v8 = v93;
  if ((v106 & 0x80000000) == 0)
    close(v106);
LABEL_173:
  v11 = v92;

  v84 = &APFSOverProvModel_ptr;
  if (!v97)
    goto LABEL_139;
LABEL_174:
  error("%s: Unable to reserve space for overprovisioning. Continuing anyways\n", "main");
LABEL_175:
  debug("%s: Checking if clearing out of FIPS data file is needed\n", "main");
  v110 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", CFSTR("%@/ClearFIPSDataFile.txt"), v8);
  if (objc_msgSend(v5, "fileExistsAtPath:", v110))
  {
    v111 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", CFSTR("%s/db/FIPS/fips_data"), "/private/var");
    if (!objc_msgSend(v5, "fileExistsAtPath:", v111))
    {
      debug("%s: Nothing to do since no FIPS data file present at %s/db/FIPS/fips_data\n", "main", "/private/var");
      v113 = v183;
      goto LABEL_184;
    }
    debug("%s: Clearing out FIPS data file\n", "main");

    v187 = 0;
    objc_msgSend(v5, "removeItemAtPath:error:", v111, &v187);
    v112 = v187;
    if (v112)
    {
      memset(v232, 0, 512);
      v113 = v112;
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "description"));
      objc_msgSend(v114, "getCString:maxLength:encoding:", v232, 511, 4);

      if (LOBYTE(v232[0]))
        v115 = (const char *)v232;
      else
        v115 = "Unable to parse error reason";
      v84 = &APFSOverProvModel_ptr;
      error("%s: Failed to clear fips data file: %s\n", "main", v115);
LABEL_184:

    }
    v186 = 0;
    objc_msgSend(v5, "removeItemAtPath:error:", v110, &v186);
    v116 = v186;
    if (v116)
    {
      memset(v232, 0, 512);
      v183 = v116;
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "description"));
      objc_msgSend(v117, "getCString:maxLength:encoding:", v232, 511, 4);

      if (LOBYTE(v232[0]))
        v118 = (const char *)v232;
      else
        v118 = "Unable to parse error reason";
      v84 = &APFSOverProvModel_ptr;
      error("%s: Failed to clear fips data cookie: %s\n", "main", v118);
    }
    else
    {
      v183 = 0;
    }
  }
  else
  {
    debug("%s: Clearing of FIPS data file not required.\n", "main");
    v111 = 0;
  }
  v119 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", CFSTR("%@/MobileAsset/PreinstalledAssetsV2"), v8);
  v167 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", CFSTR("%s"), "/private/var/MobileAsset/PreinstalledAssetsV2");
  v168 = v119;
  if ((moveFolderContentsIfItExists(v119, v167) & 1) != 0)
    debug("Done moving of preinstalled MobileAssets to data volume\n");
  else
    error("Failed to move preinstalled MobileAssets to data volume\n");
  v120 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", CFSTR("%@/wireless/Library/Logs"), v8);
  v165 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", CFSTR("%s"), "/private/var/wireless/Library");
  v166 = v120;
  if ((moveFolderContentsIfItExists(v120, v165) & 1) != 0)
    debug("Done moving of Wireless/Library folder to data volume\n");
  else
    error("Failed to move Wireless/Library folder to data volume\n");
  debug("Creating cookie file for earlyBootTaskHasCompletedOnce\n");
  v170 = v110;
  v172 = v111;
  v121 = v11;
  if ((objc_msgSend(v5, "createFileAtPath:contents:attributes:", v11, 0, 0) & 1) != 0)
    debug("Successfully created earlyBootTaskHasCompletedOnceCookie\n");
  else
    error("Failed to create earlyBootTaskHasCompletedOnceCookie\n");
  v122 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/staged_system_apps"), v8);
  v123 = objc_msgSend(v5, "fileExistsAtPath:", v122);
  v124 = objc_retainAutorelease(v122);
  v125 = (const char *)objc_msgSend(v124, "UTF8String");
  if (v125)
    v126 = v125;
  else
    v126 = "(update volume MSUData staged_system_apps directory)";
  v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "/private/var/staged_system_apps");
  v128 = objc_msgSend(v5, "fileExistsAtPath:", v127);
  v129 = objc_retainAutorelease(v127);
  v130 = objc_msgSend(v129, "UTF8String");
  v131 = v130;
  if (v130)
    v132 = v130;
  else
    v132 = "(data volume staged_system_apps directory)";
  v133 = "does not exist";
  if (v128)
    v134 = "exists";
  else
    v134 = "does not exist";
  v135 = "Creating the latter.";
  if (v128)
    v135 = "Clearing the latter.";
  if (v123)
    v133 = "exists";
  v136 = "Skipping.";
  if (v123)
    v136 = v135;
  debug("%s: Datamigrator is supported on target. %s %s, and %s %s. %s\n", "main", v126, v133, v132, v134, v136);
  if (v123)
  {
    v137 = v121;
    if (v128)
    {

      v185 = 0;
      objc_msgSend(v181, "removeItemAtPath:error:", v129, &v185);
      v138 = v185;
      v139 = &APFSOverProvModel_ptr;
      if (v138)
      {
        memset(v232, 0, 512);
        v183 = v138;
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "description"));
        objc_msgSend(v140, "getCString:maxLength:encoding:", v232, 511, 4);

        if (LOBYTE(v232[0]))
          v141 = (const char *)v232;
        else
          v141 = "Unable to parse error reason";
        error("%s: Failed to remove %s on the data volume: %s. Skipping.\n", "main", v132, v141);
      }
      else
      {
        v183 = 0;
      }
    }
    else
    {
      v139 = &APFSOverProvModel_ptr;
    }
    v232[0] = (unint64_t)objc_msgSend(objc_retainAutorelease(v124), "fileSystemRepresentation");
    v142 = fts_open((char *const *)v232, 84, 0);
    if (v142)
    {
      v143 = v142;
      debug("Setting up ACL's for the staged_system_apps on update volume\n");
      v144 = fts_read(v143);
      if (v144)
      {
        v145 = v144;
        while (2)
        {
          v146 = objc_autoreleasePoolPush();
          switch(v145->fts_info)
          {
            case 1u:
            case 8u:
              v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v145->fts_path));
              MSUEarlyBootTaskSetupACLForPath(v147);

              goto LABEL_231;
            case 6u:
              goto LABEL_231;
            case 7u:
              v148 = strerror(v145->fts_errno);
              error("fts_read error %d: %s\n", 7, v148);
              error("Failed to setup ACL for staged system apps\n");
              objc_autoreleasePoolPop(v146);
              break;
            default:
              error("fts_read found unsupported file type: %d\n", v145->fts_info);
LABEL_231:
              objc_autoreleasePoolPop(v146);
              v145 = fts_read(v143);
              if (!v145)
                break;
              continue;
          }
          break;
        }
      }
      fts_close(v143);
      v8 = v182;
      v139 = &APFSOverProvModel_ptr;
    }
    debug("Done setting up ACL's for staged_system_apps\n");
    if (v131)
    {
      v5 = v181;
      if (ramrod_create_directory_with_class(v131, 509, 0x1F5u, 0x1F5u, 4, 1))
      {
        error("%s: Failed to create %s - ramrod_create_directory_with_class error %lld. Skipping\n");
      }
      else
      {
        debug("MSUEarlyBootTask: Created staged_system_apps folder. Updating permissions\n");
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139[22], "stringWithUTF8String:", v131));
        v150 = MSUEarlyBootTaskSetupACLForPath(v149);

        if ((v150 & 1) != 0)
          debug("Successfully setup ACL for staged_system_apps folder\n");
        else
          error("Failed to setup ACL for staged_system_apps folder\n");
      }
    }
    else
    {
      error("%s: Failed to create %s - path was NULL. Skipping.\n", "main", "(data volume staged_system_apps directory)");
      v5 = v181;
    }
  }
  else
  {
    v5 = v181;
    v137 = v121;
  }
  v184 = 0;
  time(&v184);
  v151 = ctime(&v184);
  debug("Operations completed at %s\n", v151);
  flush_log();
  free(v180);

LABEL_243:
LABEL_244:

  return 0;
}

uint64_t execForMSUEarlyBootTask(const char **a1)
{
  const char *v2;
  int *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  char *v8;
  int v10;
  ssize_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  int *v20;
  char *v21;
  int v22;
  posix_spawn_file_actions_t v23;
  pid_t v24;
  _BYTE v25[1024];
  int v26[2];

  v24 = 0;
  *(_QWORD *)v26 = -1;
  if (pipe(v26))
  {
    v2 = *a1;
    v3 = __error();
    v4 = strerror(*v3);
    error("%s: pipe failed while preparing to execute %s: %s\n", "execForMSUEarlyBootTask", v2, v4);
    return 0xFFFFFFFFLL;
  }
  v23 = 0;
  posix_spawn_file_actions_init(&v23);
  posix_spawn_file_actions_adddup2(&v23, v26[1], 1);
  posix_spawn_file_actions_addclose(&v23, v26[0]);
  v6 = posix_spawn(&v24, *a1, &v23, 0, (char *const *)a1, 0);
  if ((_DWORD)v6)
  {
    v5 = v6;
    v7 = *a1;
    v8 = strerror(v6);
    error("%s: posix_spawn %s failed: %s\n", "execForMSUEarlyBootTask", v7, v8);
    close(v26[0]);
    goto LABEL_5;
  }
  bzero(v25, 0x400uLL);
  v10 = v26[0];
  close(v26[1]);
  v26[1] = -1;
  v11 = read(v10, v25, 0x400uLL);
  if (v11 >= 1)
  {
    do
    {
      execlogfunction(v11, v12, v13, v14, v15, v16, v17, v18, v11);
      v11 = read(v10, v25, 0x400uLL);
    }
    while (v11 > 0);
  }
  v22 = 0;
  if (waitpid(v24, &v22, 0) == -1)
  {
    v5 = *__error();
    v19 = *a1;
    v20 = __error();
    v21 = strerror(*v20);
    error("%s: waitpid failed for %s: %s\n", "execForMSUEarlyBootTask", v19, v21);
  }
  else
  {
    if ((v22 & 0x7F) == 0x7F)
    {
      printf("%s: %s was stopped by signal %d\n", "execForMSUEarlyBootTask", *a1, v22 >> 8);
    }
    else
    {
      if ((v22 & 0x7F) == 0)
      {
        v5 = BYTE1(v22);
        goto LABEL_5;
      }
      error("%s: %s was terminated by signal %d\n", "execForMSUEarlyBootTask", *a1, v22 & 0x7F);
    }
    v5 = 0xFFFFFFFFLL;
  }
LABEL_5:
  posix_spawn_file_actions_destroy(&v23);
  if (v26[1] != -1)
    close(v26[1]);
  return v5;
}

uint64_t ramrod_create_directory_with_class(_BYTE *a1, int a2, uid_t a3, gid_t a4, int a5, int a6)
{
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int *v16;
  int *v17;
  int *v18;
  int *v19;
  int *v20;
  int v22;
  __int128 v23;
  uint64_t v24;
  stat v25;
  char v26;
  _BYTE v27[7];

  if (!a1 || *a1 != 47)
    return 22;
  bzero(&v26, 0x400uLL);
  v12 = v27;
  __strlcpy_chk(&v26, a1, 1024, 1024);
  while (1)
  {
    v13 = strchr(v12, 47);
    v14 = v13;
    if (v13)
      *v13 = 0;
    memset(&v25, 0, sizeof(v25));
    if (lstat(&v26, &v25))
    {
      if (*__error() != 2)
      {
        v15 = *__error();
        v16 = __error();
        strerror(*v16);
        error("lstat %s failed: %s\n");
        return v15;
      }
      if (a6)
        error("creating directory (owner=%d group=%d mode=%o, class=%d) %s\n", a3, a4, a2, a5, &v26);
      if (mkdir(&v26, a2 & 0x1FF))
      {
        v15 = *__error();
        v17 = __error();
        strerror(*v17);
        error("mkdir failed: %s\n");
        return v15;
      }
      if (chmod(&v26, a2))
      {
        v15 = *__error();
        v18 = __error();
        strerror(*v18);
        error("chmod failed: %s\n");
        return v15;
      }
      if (chown(&v26, a3, a4))
      {
        v15 = *__error();
        v19 = __error();
        strerror(*v19);
        error("chown failed: %s\n");
        return v15;
      }
      if ((a5 & 0x80000000) == 0)
      {
        v24 = 0;
        v23 = xmmword_100007C34;
        v22 = a5;
        if (setattrlist(&v26, &v23, &v22, 4uLL, 0))
          break;
      }
    }
    if (!v14)
      return 0;
    *v14 = 47;
    v12 = v14 + 1;
  }
  v15 = *__error();
  v20 = __error();
  strerror(*v20);
  error("setattrlist failed: %s\n");
  return v15;
}

void execlogfunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  char v10[1024];

  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", CFSTR("%.*s"), &a9);
  bzero(v10, 0x400uLL);
  objc_msgSend(v9, "getCString:maxLength:encoding:", v10, 1023, 134217984);
  debug("MSUEarlyBootTaskExecLog: %s\n", v10);

}

uint64_t msuearlyboottask_mount_filesystem(const char *a1, const char *a2, int a3)
{
  int v6;
  int v8;
  const char *v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  if (!a1)
  {
    error("%s: Invalid arguments passed\n", "msuearlyboottask_mount_filesystem");
    return 0xFFFFFFFFLL;
  }
  debug("%s: Attempting to mount %s at %s\n", "msuearlyboottask_mount_filesystem", a1, "/private/var/MobileSoftwareUpdate/mnt1");
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v9[0] = "/sbin/mount_apfs";
  v9[1] = "-o";
  v9[2] = "nobrowse";
  if (a3)
  {
    debug("%s: Mounting read-only\n", "msuearlyboottask_mount_filesystem");
    *(_QWORD *)&v10 = "-o";
    *((_QWORD *)&v10 + 1) = "rdonly";
    v6 = 5;
    if (!a2)
      goto LABEL_8;
    goto LABEL_7;
  }
  v6 = 3;
  if (a2)
  {
LABEL_7:
    debug("%s: Mounting snapshot %s\n", "msuearlyboottask_mount_filesystem", a2);
    v8 = v6 + 1;
    v9[v6] = "-s";
    v6 += 2;
    v9[v8] = a2;
  }
LABEL_8:
  v9[v6] = a1;
  v9[v6 + 1] = "/private/var/MobileSoftwareUpdate/mnt1";
  v9[v6 + 2] = 0;
  return execForMSUEarlyBootTask(v9);
}

void msuearlyboottask_unmount_filesystem()
{
  int v0;
  int v1;
  BOOL v2;
  BOOL v3;
  int *v4;
  char *v5;
  char *v6;

  v0 = -3;
  do
  {
    if (!unmount("/private/var/MobileSoftwareUpdate/mnt1", 0x80000))
      break;
    v1 = *__error();
    v2 = v1 == 35 || v1 == 16;
    v3 = v2;
    if (v1 == 22)
    {
      debug("MSUEarlyBootTask: Tried to unmount a volume at '%s' that wasn't mounted. Ignoring the error.\n", "/private/var/MobileSoftwareUpdate/mnt1");
    }
    else
    {
      v4 = __error();
      v5 = strerror(*v4);
      error("MSUEarlyBootTask: error unmounting '%s': %s\n", "/private/var/MobileSoftwareUpdate/mnt1", v5);
      if (v1 == 35 || v1 == 16)
      {
        v6 = strerror(v1);
        error("Unmounting %s failed with %d: %s. Will retry in %d seconds", "/private/var/MobileSoftwareUpdate/mnt1", v1, v6, 3);
        sleep(3u);
      }
    }
  }
  while (v0++ && v3);
}

void msuearlyboottask_dump_mounted_filesystem_info()
{
  int v0;
  unint64_t v1;
  statfs *v2;

  debug("%s:**********DUMPING MOUNTED FILESYSTEMS********\n", "msuearlyboottask_dump_mounted_filesystem_info");
  v2 = 0;
  v0 = getmntinfo(&v2, 2);
  debug("%s: %d filesystems are mounted\n", "msuearlyboottask_dump_mounted_filesystem_info", v0);
  if (v2)
  {
    if (v0 >= 1)
    {
      v1 = v0 + 1;
      do
      {
        debug("%s is mounted at %s\n", v2[(v1 - 2)].f_mntfromname, v2[(v1 - 2)].f_mntonname);
        --v1;
      }
      while (v1 > 1);
    }
  }
  else
  {
    debug("Failed to get info regarding mounted filesystems\n");
  }
  debug("%s: *********DONE DUMPING MOUNTED FILESYSTEMS********\n", "msuearlyboottask_dump_mounted_filesystem_info");
}

acl_t MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(int a1)
{
  acl_perm_t v2;
  acl_flag_t v3;
  int *v4;
  char *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  int permset;
  int v10;
  int flagset_np;
  int v12;
  int v13;
  int v14;
  int v15;
  acl_t result;
  acl_t acl_p;
  acl_flagset_t flagset_p;
  acl_permset_t permset_p;
  acl_entry_t entry_p;

  acl_p = acl_init(1);
  if (!acl_p)
  {
    v4 = __error();
    v5 = strerror(*v4);
    error("MSUEarlyBootTask: acl_init() failed: %s", v5);
    return 0;
  }
  if (a1)
    v2 = ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_DELETE_CHILD|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_SEARCH|ACL_ADD_FILE|ACL_LIST_DIRECTORY;
  else
    v2 = ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_SEARCH|ACL_ADD_FILE|ACL_LIST_DIRECTORY;
  entry_p = 0;
  if (a1)
    v3 = ACL_ENTRY_DIRECTORY_INHERIT|ACL_ENTRY_FILE_INHERIT;
  else
    v3 = ACL_ENTRY_INHERITED;
  flagset_p = 0;
  permset_p = 0;
  if (acl_create_entry(&acl_p, &entry_p))
  {
    error("MSUEarlyBootTask: Unable to create acl entry(%d)\n");
  }
  else
  {
    v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    if (v6)
    {
      v7 = v6;
      v8 = mbr_identifier_to_uuid(5, "systemusers", 0xBuLL, v6);
      if (v8)
      {
        strerror(v8);
        error("MSUEarlyBootTask: Failed to convert mbr identifier to uuid : %d (%s)\n");
      }
      else
      {
        permset = acl_get_permset(entry_p, &permset_p);
        if (permset)
        {
          strerror(permset);
          error("acl_get_permset() failed: %d: %s\n");
        }
        else
        {
          v10 = acl_add_perm(permset_p, v2);
          if (v10)
          {
            strerror(v10);
            error("acl_add_perm() failed to set perms %x: %d: %s\n");
          }
          else if (acl_set_permset(entry_p, permset_p))
          {
            strerror(0);
            error("acl_set_permset() failed: %d: %s");
          }
          else
          {
            flagset_np = acl_get_flagset_np(entry_p, &flagset_p);
            if (flagset_np)
            {
              strerror(flagset_np);
              error("MSUEarlyBootTask: acl_get_flagset_np() failed: %d: %s");
            }
            else
            {
              v12 = acl_add_flag_np(flagset_p, v3);
              if (v12)
              {
                strerror(v12);
                error("MSUEarlyBootTask: acl_add_flag_np() failed to set flags %x: %d %s\n");
              }
              else
              {
                v13 = acl_set_flagset_np(entry_p, flagset_p);
                if (v13)
                {
                  strerror(v13);
                  error("acl_set_flagset_np() failed: %d: %s\n");
                }
                else
                {
                  v14 = acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW);
                  if (v14)
                  {
                    strerror(v14);
                    error("acl_set_tag_type() failed: %d: %s");
                  }
                  else
                  {
                    v15 = acl_set_qualifier(entry_p, v7);
                    if (!v15)
                    {
                      free(v7);
                      return acl_p;
                    }
                    strerror(v15);
                    error("acl_set_qualifier() failed: %d: %s");
                  }
                }
              }
            }
          }
        }
      }
      free(v7);
    }
    else
    {
      error("MSUEarlyBootTask: Unable to allocate nameUUID\n");
    }
  }
  error("MSUEarlyBootTask: Failed in call to MSUEarlyBootTaskCreateSystemUserACEInACL\n");
  result = acl_p;
  if (acl_p)
  {
    acl_free(acl_p);
    return 0;
  }
  return result;
}

uint64_t _partition_log(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr)
    return _loggingPtr(result, &a9);
  return result;
}

char *copy_root_snapshot_name_from_dt()
{
  io_registry_entry_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  io_object_t v8;
  const __CFData *CFProperty;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFData *v17;
  CFTypeID v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *BytePtr;
  size_t Length;
  char *v28;
  uint64_t v30;

  v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (!v0)
  {
    _partition_log((uint64_t)"uanble to find chosen node", v1, v2, v3, v4, v5, v6, v7, v30);
    return 0;
  }
  v8 = v0;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, CFSTR("root-snapshot-name"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    _partition_log((uint64_t)"unable to look up root-snapshot-name on chosen node", v10, v11, v12, v13, v14, v15, v16, v30);
    IOObjectRelease(v8);
    return 0;
  }
  v17 = CFProperty;
  v18 = CFGetTypeID(CFProperty);
  if (v18 == CFDataGetTypeID())
  {
    BytePtr = (const char *)CFDataGetBytePtr(v17);
    Length = CFDataGetLength(v17);
    v28 = strndup(BytePtr, Length);
  }
  else
  {
    _partition_log((uint64_t)"device tree root-snapshot-name type mismatch", v19, v20, v21, v22, v23, v24, v25, v30);
    v28 = 0;
  }
  IOObjectRelease(v8);
  CFRelease(v17);
  return v28;
}

void main_cold_1()
{
  err(71, "statfs() failed for /");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCString:maxLength:encoding:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
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

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}
