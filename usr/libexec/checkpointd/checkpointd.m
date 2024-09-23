void start()
{
  uint64_t v0;

  v0 = MOXPCTransportOpen("com.apple.mobilecheckpoint.checkpointd", 1);
  MOXPCTransportSetMessageHandler(v0, &_dispatch_main_q, &stru_100058220);
  MOXPCTransportResume(v0);
  dispatch_main();
}

void sub_100003C48(id a1, OS_xpc_object *a2, __CFDictionary *a3)
{
  OS_xpc_object *v4;
  void *v5;
  __CFDictionary *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  dispatch_time_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  BOOL v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  unsigned int v61;
  const __CFString *v62;
  const __CFString *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _UNKNOWN **v90;
  _UNKNOWN **v91;
  __CFString *v92;
  void *v93;
  __CFString *v94;
  __CFString *v95;
  __CFString *v96;
  __CFString *v97;
  __CFString *v98;
  __CFString *v99;
  __CFString *v100;
  __CFString *v101;
  __CFString *v102;
  __CFString *v103;
  __CFString *v104;
  __CFString *v105;
  void *v106;
  __CFString *v107;
  __CFString *v108;
  __CFString *v109;
  void *v110;
  void *v111;
  char *v112;
  char *v113;
  id v114;
  char *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t (*v120)(void);
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSString *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *i;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t j;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  std::error_code *v146;
  void *v147;
  void *context;
  void *v149;
  __CFDictionary *v150;
  void *v151;
  OS_xpc_object *v152;
  uint64_t v153;
  id v154;
  id obj;
  id obja;
  uint64_t v157;
  const __CFString *v158;
  id v159;
  stat v160;
  timeval v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  CFRange v167;

  v4 = a2;
  v5 = objc_autoreleasePoolPush();
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("command")));
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v10 = 0xFFFFFFFFLL;
LABEL_8:
    v20 = objc_autoreleasePoolPush();
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));

    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: unknown command %d"), v22, 437, v10)));
    syslog(5, "%s", (const char *)objc_msgSend(v23, "UTF8String"));

    v24 = v20;
LABEL_9:
    objc_autoreleasePoolPop(v24);
LABEL_10:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    goto LABEL_11;
  }
  v9 = objc_msgSend(v7, "intValue");
  if ((_DWORD)v9 == 1)
  {
    v26 = objc_autoreleasePoolPush();
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));

    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: shutting down..."), v28, 427)));
    syslog(5, "%s", (const char *)objc_msgSend(v29, "UTF8String"));

    objc_autoreleasePoolPop(v26);
    v30 = dispatch_time(0, 2000000000);
    dispatch_after(v30, (dispatch_queue_t)&_dispatch_main_q, &stru_100058260);
    goto LABEL_10;
  }
  v10 = (uint64_t)v9;
  if ((_DWORD)v9)
    goto LABEL_8;
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));

  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: rebuilding checkpoint"), v13, 401)));
  syslog(5, "%s", (const char *)objc_msgSend(v14, "UTF8String"));

  objc_autoreleasePoolPop(v11);
  v15 = objc_autoreleasePoolPush();
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/Checkpoint.xml")));
  if (!v17)
  {
    v31 = objc_autoreleasePoolPush();
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v33 = v15;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));

    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: failed to create dictionary from %s"), v34, 339, "/System/Library/CoreServices/Checkpoint.xml")));
    syslog(5, "%s", (const char *)objc_msgSend(v35, "UTF8String"));

    objc_autoreleasePoolPop(v31);
    v24 = v33;
    goto LABEL_9;
  }
  v18 = (void *)v17;
  v19 = objc_claimAutoreleasedReturnValue(+[FigCheckpointSupport makeDictionary](FigCheckpointSupport, "makeDictionary"));
  context = v15;
  v149 = v7;
  v147 = (void *)v19;
  if (v19)
  {
    objc_msgSend(v18, "addEntriesFromDictionary:", v19);
  }
  else
  {
    v36 = objc_autoreleasePoolPush();
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastPathComponent"));

    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: no checkpoint info from EmbeddedMedia"), v38, 348)));
    syslog(5, "%s", (const char *)objc_msgSend(v39, "UTF8String"));

    objc_autoreleasePoolPop(v36);
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("__removals__"));
  v40 = v18;
  v41 = (void *)MGCopyAnswer(CFSTR("DeviceClassNumber"), 0);
  v42 = v41;
  if (v41)
    v43 = objc_msgSend(v41, "intValue");
  else
    v43 = -1;

  v165 = 0u;
  v166 = 0u;
  LOBYTE(v165) = v43 == 5;
  BYTE1(v165) = v43 == 3;
  BYTE2(v165) = v43 == 1;
  v44 = (void *)MGCopyAnswer(CFSTR("HasBaseband"), 0);
  v45 = v44;
  if (v44)
    v46 = objc_msgSend(v44, "intValue") != 0;
  else
    v46 = 0;

  BYTE6(v165) = v46;
  v47 = (void *)MGCopyAnswer(CFSTR("main-screen-scale"), 0);
  v48 = v47;
  if (v47)
    v49 = (int)objc_msgSend(v47, "intValue") > 1;
  else
    v49 = 0;

  BYTE7(v165) = v49;
  v50 = (void *)MGCopyAnswer(CFSTR("jMiqevikb6QWeHOhvLsw6A"), 0);
  v51 = v50;
  if (v50)
    v52 = objc_msgSend(v50, "intValue") != 0;
  else
    v52 = 0;

  BYTE8(v165) = v52;
  if (v43 == 1)
  {
    v53 = 1;
  }
  else
  {
    v54 = (void *)MGCopyAnswer(CFSTR("5MSZn7w3nnJp22VbpqaxLQ"), 0);
    v55 = v54;
    if (v54)
      v53 = objc_msgSend(v54, "intValue") != 0;
    else
      v53 = 0;

  }
  BYTE9(v165) = v53;
  v56 = (void *)MGCopyAnswer(CFSTR("iTunesFamilyID"), 0);
  v57 = v56;
  if (v56)
    v58 = objc_msgSend(v56, "intValue");
  else
    v58 = 0;

  HIDWORD(v165) = v58;
  v59 = (void *)MGCopyAnswer(CFSTR("main-screen-class"), 0);
  v60 = v59;
  if (v59)
    v61 = objc_msgSend(v59, "intValue");
  else
    v61 = -1;

  LODWORD(v166) = v61;
  BYTE3(v165) = v61 == 5;
  BYTE4(v165) = v61 == 8;
  BYTE5(v165) = v61 == 9;
  v62 = (const __CFString *)MGCopyAnswer(CFSTR("MinimumSupportediTunesVersion"), 0);
  if (v62)
  {
    v63 = v62;
    v167.length = CFStringGetLength(v62);
    v167.location = 0;
    CFStringGetBytes(v63, v167, 0x600u, 0, 0, (UInt8 *)&v166 + 4, 10, 0);
    CFRelease(v63);
    if (BYTE4(v166))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", (char *)&v166 + 4, 1));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v64, CFSTR("MinITunesVersion"));

    }
  }
  if (BYTE6(v165))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("SupportsCarrierBundleInstall"));
  obj = v16;
  if (!(_BYTE)v165)
  {
    v157 = 0;
    sub_1000197F8((uint64_t)&v157 + 4, (uint64_t)&v157);
    if ((_DWORD)v65)
    {
      v66 = v65;
      v67 = objc_autoreleasePoolPush();
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
      v69 = v40;
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "lastPathComponent"));

      v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: Can't get stuff: %d"), v70, 120, v66, v147, context)));
      syslog(5, "%s", (const char *)objc_msgSend(v71, "UTF8String"));

      v40 = v69;
      objc_autoreleasePoolPop(v67);
    }
    else
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v157)));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v72, CFSTR("FairPlayDeviceType"));

      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v157));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v73, CFSTR("KeyTypeSupportVersion"));

    }
    sub_10002CDD0();
    if ((_DWORD)v74)
    {
      v75 = v74;
      v76 = objc_autoreleasePoolPush();
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
      v78 = v40;
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "lastPathComponent"));

      v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: Can't get CB stuff: %d"), v79, 127, v75)));
      syslog(5, "%s", (const char *)objc_msgSend(v80, "UTF8String"));

      v40 = v78;
      objc_autoreleasePoolPop(v76);
    }
    else
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v81, CFSTR("FairPlayCBMinVersion"));

      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v82, CFSTR("FairPlayCBMaxVersion"));

    }
  }
  if (HIDWORD(v165))
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v83, CFSTR("FamilyID"));

  }
  v84 = MGCopyAnswer(CFSTR("main-screen-width"), 0);
  if (v84)
  {
    v85 = (void *)v84;
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v84, CFSTR("ScreenWidth"));

  }
  v86 = MGCopyAnswer(CFSTR("main-screen-height"), 0);
  if (v86)
  {
    v87 = (void *)v86;
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v86, CFSTR("ScreenHeight"));

  }
  v88 = MGCopyAnswer(CFSTR("main-screen-scale"), 0);
  if (v88)
  {
    v89 = (void *)v88;
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v88, CFSTR("ScreenScaleFactor"));

  }
  if (BYTE1(v165))
  {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_10005D560, CFSTR("HomeScreenIconWidth"));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_10005D560, CFSTR("HomeScreenIconHeight"));
    v90 = &off_10005D530;
  }
  else
  {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_10005D500, CFSTR("HomeScreenIconWidth"));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_10005D500, CFSTR("HomeScreenIconHeight"));
    v90 = &off_10005D548;
    if (!BYTE3(v165))
    {
      if (BYTE4(v165) | BYTE5(v165))
        v91 = &off_10005D530;
      else
        v91 = &off_10005D548;
      goto LABEL_63;
    }
  }
  v91 = &off_10005D518;
LABEL_63:
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v91, CFSTR("HomeScreenIconRows"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_10005D548, CFSTR("HomeScreenIconColumns"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v90, CFSTR("HomeScreenIconDockMaxCount"));
  if (BYTE1(v165))
  {
    sub_100004FE4(v40, CFSTR("AlbumArt"), CFSTR("3001"));
    v92 = CFSTR("3002");
    v93 = v40;
    v94 = CFSTR("AlbumArt");
  }
  else
  {
    sub_100004FE4(v40, CFSTR("AlbumArt"), CFSTR("3013"));
    sub_100004FE4(v40, CFSTR("AlbumArt"), CFSTR("3018"));
    sub_100004FE4(v40, CFSTR("AlbumArt"), CFSTR("3019"));
    sub_100004FE4(v40, CFSTR("AlbumArt"), CFSTR("3020"));
    sub_100004FE4(v40, CFSTR("AlbumArt"), CFSTR("3021"));
    v94 = CFSTR("ChapterImageSpecs");
    v93 = v40;
    v92 = CFSTR("3013");
  }
  sub_100004FE4(v93, v94, v92);
  if (BYTE7(v165))
    v95 = CFSTR("3001");
  else
    v95 = CFSTR("3101");
  if (BYTE7(v165))
    v96 = CFSTR("3002");
  else
    v96 = CFSTR("3102");
  if (BYTE7(v165))
    v97 = CFSTR("3005");
  else
    v97 = CFSTR("3105");
  if (BYTE7(v165))
    v98 = CFSTR("3006");
  else
    v98 = CFSTR("3106");
  if (BYTE7(v165))
    v99 = CFSTR("3007");
  else
    v99 = CFSTR("3107");
  if (BYTE7(v165))
    v100 = CFSTR("3012");
  else
    v100 = CFSTR("3112");
  sub_100004FE4(v40, CFSTR("AlbumArt"), v95);
  sub_100004FE4(v40, CFSTR("AlbumArt"), v96);
  sub_100004FE4(v40, CFSTR("AlbumArt"), v97);
  sub_100004FE4(v40, CFSTR("AlbumArt"), v98);
  sub_100004FE4(v40, CFSTR("AlbumArt"), v99);
  sub_100004FE4(v40, CFSTR("ChapterImageSpecs"), v100);
  sub_100004FE4(v40, CFSTR("ChapterImageSpecs"), v97);
  v150 = v6;
  v151 = v5;
  v152 = v4;
  if (BYTE7(v165))
  {
    v101 = CFSTR("4040");
    v102 = CFSTR("4032");
    v103 = CFSTR("3041");
    v104 = CFSTR("3034");
    v105 = CFSTR("4036");
    v106 = obj;
    if (BYTE1(v165))
    {
      v107 = CFSTR("4035");
      goto LABEL_96;
    }
    v107 = CFSTR("4140");
    v108 = CFSTR("4132");
    v109 = CFSTR("4037");
    goto LABEL_94;
  }
  v106 = obj;
  if (!BYTE1(v165))
  {
    sub_100004FE4(v40, CFSTR("ImageSpecifications"), CFSTR("4040"));
    v101 = CFSTR("4140");
    v102 = CFSTR("4132");
    v103 = CFSTR("4131");
    v104 = CFSTR("3141");
    v105 = CFSTR("3143");
    v107 = CFSTR("4037");
    v108 = CFSTR("4035");
    v109 = CFSTR("4032");
LABEL_94:
    sub_100004FE4(v40, CFSTR("ImageSpecifications"), v109);
    goto LABEL_95;
  }
  v101 = CFSTR("4140");
  v102 = CFSTR("4132");
  v103 = CFSTR("4131");
  v104 = CFSTR("3141");
  v105 = CFSTR("3143");
  v107 = CFSTR("4037");
  v108 = CFSTR("4036");
LABEL_95:
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v108);
LABEL_96:
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v107);
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v105);
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v104);
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v103);
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v102);
  sub_100004FE4(v40, CFSTR("ImageSpecifications"), v101);
  if (!BYTE8(v165))
  {
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ImageSpecifications")));
    v111 = v110;
    if (v110)
    {
      v112 = (char *)objc_msgSend(v110, "count");
      if (v112)
      {
        v113 = v112;
        v114 = v40;
        v115 = 0;
        v116 = 0;
        do
        {
          v117 = v116;
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectAtIndex:", v115));

          v118 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v116, v118) & 1) != 0)
            objc_msgSend(v116, "removeObjectForKey:", CFSTR("PreserveSourceColorSpace"));
          ++v115;
        }
        while (v113 != v115);

        v40 = v114;
        v106 = obj;
      }
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v111, CFSTR("ImageSpecifications"));
    }

  }
  if (BYTE9(v165))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Ringtones"));
  v119 = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  if (!v119)
  {
    v123 = objc_autoreleasePoolPush();
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "lastPathComponent"));

    v126 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: couldn't dlopen UIKit"), v125, 322);
LABEL_114:
    v128 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v126));
    syslog(5, "%s", (const char *)objc_msgSend(v128, "UTF8String"));

    objc_autoreleasePoolPop(v123);
    goto LABEL_117;
  }
  v120 = (uint64_t (*)(void))dlsym(v119, "UIKeyboardGetSupportedInputModes");
  if (!v120)
  {
    v123 = objc_autoreleasePoolPush();
    v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "lastPathComponent"));

    v126 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: couldn't look up UIKeyboardGetSupportedInputModes"), v125, 319);
    goto LABEL_114;
  }
  v121 = v120();
  v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
  if (v122)
  {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v122, CFSTR("SupportedKeyboards"));
  }
  else
  {
    v129 = objc_autoreleasePoolPush();
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "lastPathComponent"));

    v132 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: UIKeyboardGetSupportedInputModes returned NULL"), v131, 316)));
    syslog(5, "%s", (const char *)objc_msgSend(v132, "UTF8String"));

    objc_autoreleasePoolPop(v129);
  }

LABEL_117:
  v163 = 0u;
  v164 = 0u;
  v161 = (timeval)0;
  v162 = 0u;
  obja = v106;
  v154 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v161, &v160, 16);
  if (v154)
  {
    v153 = *(_QWORD *)v162;
    do
    {
      for (i = 0; i != v154; i = (char *)i + 1)
      {
        if (*(_QWORD *)v162 != v153)
          objc_enumerationMutation(obja);
        v134 = *(_QWORD *)(*(_QWORD *)&v161.tv_usec + 8 * (_QWORD)i);
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "objectForKeyedSubscript:", v134));
        v136 = v40;
        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v134));
        v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v139 = (uint64_t)objc_msgSend(v137, "count");
        if (v139 >= 1)
        {
          v140 = v139;
          for (j = 0; j < v140; j += 2)
          {
            v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "objectAtIndex:", j));
            if ((objc_msgSend(v135, "containsObject:", v142) & 1) == 0)
            {
              objc_msgSend(v138, "addObject:", v142);
              v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "objectAtIndex:", j + 1));
              objc_msgSend(v138, "addObject:", v143);

            }
          }
        }
        v40 = v136;
        objc_msgSend(v136, "setObject:forKey:", v138, v134);

      }
      v154 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v161, &v160, 16);
    }
    while (v154);
  }

  objc_msgSend(v40, "removeObjectForKey:", CFSTR("__removals__"));
  v144 = v40;

  objc_autoreleasePoolPop(context);
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v144, 200, 0, 0));
  v5 = v151;
  v4 = v152;
  v6 = v150;
  if (objc_msgSend(v145, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Caches/Checkpoint.plist.tmp"), 1))
  {
    memset(&v160, 0, sizeof(v160));
    if (!stat("/System/Library/CoreServices/Checkpoint.xml", &v160))
    {
      v161.tv_sec = v160.st_mtimespec.tv_sec;
      *(&v161.tv_usec + 1) = 0;
      v161.tv_usec = SLODWORD(v160.st_mtimespec.tv_nsec) / 1000;
      *(_QWORD *)&v162 = v160.st_mtimespec.tv_sec;
      *((_QWORD *)&v162 + 1) = (SLODWORD(v160.st_mtimespec.tv_nsec) / 1000);
      if (!utimes("/var/mobile/Library/Caches/Checkpoint.plist.tmp", &v161))
        rename((const std::__fs::filesystem::path *)"/var/mobile/Library/Caches/Checkpoint.plist.tmp", (const std::__fs::filesystem::path *)"/var/mobile/Library/Caches/Checkpoint.plist", v146);
    }
  }
  v158 = CFSTR("checkpoint");
  v159 = v144;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1));

  v7 = v149;
  if (!v25)
    goto LABEL_10;
LABEL_11:
  MOXPCTransportSendMessageOnConnection(v4, v25);

  objc_autoreleasePoolPop(v5);
}

void sub_100004F48(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d: done"), v3, 430)));
  syslog(5, "%s", (const char *)objc_msgSend(v4, "UTF8String"));

  objc_autoreleasePoolPop(v1);
  exit(0);
}

void sub_100004FE4(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a1;
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("__removals__")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));

  if (!v8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("__removals__")));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  }
  objc_msgSend(v8, "addObject:", v6);

}

_QWORD *sub_1000050B4(_QWORD *result)
{
  *result = ++qword_100060360;
  return result;
}

uint64_t sub_1000050D0(mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, _QWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v17;
  mach_port_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  mach_msg_header_t msg;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  NDR_record_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;

  v30 = 1;
  v31 = a4;
  v32 = 16777472;
  v33 = a5;
  v34 = NDR_record;
  v17 = *a3;
  v35 = a2;
  v36 = v17;
  v37 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        v20 = 4294966988;
      }
      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v20 = 4294966996;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            v21 = v33;
            if (v33 == v47)
            {
              v20 = 0;
              v22 = *(_DWORD *)&v34.mig_vers;
              *a3 = v38;
              v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v20 = 4294966996;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port)
              v20 = 4294966996;
            else
              v20 = HIDWORD(v31);
          }
        }
        else
        {
          v20 = 4294966996;
        }
      }
      else
      {
        v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t sub_100005328(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_msg_header_t msg;
  NDR_record_t v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v4 = a3[5];
  v19 = a3[4];
  v20 = v4;
  v5 = a3[7];
  v21 = a3[6];
  v22 = v5;
  v6 = a3[1];
  v15 = *a3;
  v16 = v6;
  v7 = a3[3];
  v17 = a3[2];
  v13 = NDR_record;
  v14 = a2;
  v18 = v7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (msg.msgh_id == 71)
  {
    v10 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }
  if (msg.msgh_id != 1301)
  {
    v10 = 4294966995;
    goto LABEL_17;
  }
  v10 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v10 = v14;
  if (v14)
    goto LABEL_17;
  return v10;
}

uint64_t sub_1000054B4(mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  NDR_record_t v22;
  _BYTE v23[28];
  int v24;

  v18 = 1;
  v19 = a6;
  v20 = 16777472;
  v21 = a7;
  v22 = NDR_record;
  *(_DWORD *)v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  v24 = a7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              v14 = 0;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port)
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v14;
}

uint64_t sub_1000056A0(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  int v16;
  mach_msg_header_t msg;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B300000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }
    if (msg.msgh_id == 71)
    {
      v12 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            v12 = v18;
            if (!v18)
            {
              v15 = v20;
              *a2 = v19;
              *a3 = v15;
              v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v13 = 1;
          else
            v13 = v18 == 0;
          if (v13)
            v12 = 4294966996;
          else
            v12 = v18;
          goto LABEL_23;
        }
      }
      v12 = 4294966996;
    }
    else
    {
      v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

void sub_100005818(uint64_t a1)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v1 = *(_DWORD *)a1 ^ (1178560073 * ((-2 - ((a1 | 0x5930FF1B) + (~(_DWORD)a1 | 0xA6CF00E4))) ^ 0x1C5B7886));
  v3 = *(_QWORD *)(a1 + 8);
  v2[0] = v1
        - 108757529 * ((v2 - 1271267561 - 2 * ((unint64_t)v2 & 0xB439FF17)) ^ 0x54A59D3C)
        - 938;
  sub_1000190D8((uint64_t)v2);
  __asm { BR              X9 }
}

uint64_t sub_100005950@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;

  v5 = (((v4 - v3) >> 4) & 0x95F4D3C ^ 0x9080C10)
     + (((v4 - v3) >> 5) ^ 0xFA2BA997)
     - 19938724;
  v6 = v1 > (((v2 - 1030) | 0x406) ^ 0x4809313u);
  v7 = (v5 < 0xFB7F68FA) ^ v6;
  v8 = v5 < v1 - 75536134;
  if (!v7)
    v6 = v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((14 * v6) ^ (v2 + 224))) - ((5 * ((v2 + 224) ^ 0x5B9u)) ^ 0x68FLL)))();
}

uint64_t sub_100005A00@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return (*(uint64_t (**)(void))(a1 + 8 * ((59 * ((((v1 & 0x1F) == 0x1A) ^ (v2 + 52)) & 1)) ^ v2)))();
}

uint64_t sub_100005A40@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (int)(((((v2 + 286555820) & 0xEEEB7BFF) + 995)
                                               * ((v1 - 55597412) < 0x7FFFFFFF)) ^ (v2 + 286555820) & 0xEEEB7BFF))
                            - ((v2 + 286555820) & 0xEEEB7BFF ^ 0x521)
                            + 1038))();
}

uint64_t sub_100005AA8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  char v3;
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  unsigned int v9;
  _BOOL4 v10;

  v8 = (_QWORD *)(v7 - 0x79262543413A9647);
  v9 = ((2 * (*(_DWORD *)(*v8 + 4 * (v1 + 55597411)) ^ v4)) << (v3 ^ 0x1F)) | ((*(_DWORD *)(*v8 + 4 * (v1 + 55597410)) ^ v4) >> v3);
  *(_DWORD *)*v8 = v9 + v4 - ((v6 + 224 + v5) & (2 * v9));
  v10 = v2 + 1274593521 > 1330190933;
  if (v2 + 1274593521 < -817292716)
    v10 = 1;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a1 + 8 * ((13 * v10) ^ (v6 - 735))) - 8))(3477674580);
}

void sub_100005B84()
{
  JUMPOUT(0x100005AFCLL);
}

void sub_100005B8C()
{
  _DWORD *v0;

  *v0 = 137555249;
}

uint64_t sub_100005D78(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;

  v1 = 1755732067 * ((650609490 - (a1 | 0x26C78352) + (a1 | 0xD9387CAD)) ^ 0x7FEC176);
  v2 = *(_DWORD *)(a1 + 8) - v1;
  v3 = v1 + *(_DWORD *)(a1 + 12) - 1314192222;
  v4 = (*(_DWORD *)(*(_QWORD *)a1 - 0x133E1E075B35BC0FLL) ^ 0xC5FEF88B) + v3;
  v5 = v4 - ((2 * v4) & 0x8BFDF116) - 973145973;
  *(_DWORD *)(*(_QWORD *)a1 - 0x133E1E075B35BC0FLL) = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v2 ^ 0xB)) + ((1645 * ((v5 ^ 0xC5FEF88B) < v3)) ^ v2))
                            - 8))();
}

void sub_100005E48(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x133E1E075B35BC13) = (*(_DWORD *)(a1 - 0x133E1E075B35BC13) ^ 0x74199178)
                                         + 1947832696
                                         - ((2 * (*(_DWORD *)(a1 - 0x133E1E075B35BC13) ^ 0x74199178) + 2) & 0xE83322F0)
                                         + 1;
}

void sub_100005E90(uint64_t a1)
{
  int v1;
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 12) + 1759421093 * (((a1 | 0x9EBEB665) - a1 + (a1 & 0x6141499A)) ^ 0x2DC30631);
  v2 = *(_QWORD *)a1;
  v3[0] = v1
        - 108757529 * ((((v3 | 0x1B6875D8) ^ 0xFFFFFFFE) - (~v3 | 0xE4978A27)) ^ 0x40BE80C)
        - 791;
  v4 = v2;
  sub_1000190D8((uint64_t)v3);
  __asm { BR              X9 }
}

void sub_100005F94()
{
  uint64_t v0;
  int v1;

  *(_DWORD *)(v0 + 8) = v1 | 1;
}

uint64_t sub_100006014(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x79262543413A964BLL) + 26263212;
  v3 = *(_DWORD *)(*(_QWORD *)a1 - 0x79262543413A964BLL) + 26263212;
  v4 = (v2 < -1983665187) ^ (v3 < -1983665187);
  v5 = v2 > v3;
  if (v4)
    v5 = v2 < -1983665187;
  v1 = *(_DWORD *)(a1 + 8) - 3804331 * (a1 ^ 0x8FA51BC6);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v1 ^ 0x1D9)) + (!v5 | v1)) - 12))();
}

uint64_t sub_1000060C0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = v2 - 662159835;
  v5 = v4 < 1622879062;
  v6 = v3 - 662159835 < v4;
  if (v3 - 662159835 < 1622879062 != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (((v1 + 433) * !v6) ^ v1)) - 12))();
}

uint64_t sub_100006120()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  int v4;

  v3 = (v1 + 1006113411) & 0xC407ED7C;
  if ((int)((v3 ^ 0x77CD13C3) + v2) < 0)
    v4 = v2;
  else
    v4 = 275110498 - v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (int)((1233 * (v4 - 137555250 >= 0)) | v3)) - 12))();
}

uint64_t sub_1000061C4()
{
  uint64_t v0;
  unsigned int v1;
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  unsigned int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((((*(_DWORD *)(*v2 + 4 * v5) ^ v1) <= (*(_DWORD *)(*v3 + 4 * v5) ^ v1))
                                          * ((v4 ^ 0x7B4) - 262)) ^ v4))
                            - 4))();
}

uint64_t sub_10000620C(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((134 * ((a3 + 424) ^ 0x2B6) + 886) * (v4 < a2)) ^ (a3 + 424)))
                            - ((a3 + 424) ^ 0x3B8u)
                            + 260))();
}

uint64_t sub_10000624C()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1233 * (v1 - 137555250 >= 0)) | v2)) - 12))();
}

uint64_t sub_100006288(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 12) = 1489811178 - v1;
  return result;
}

void sub_10000629C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 1224239923 * (((a1 | 0x8E383864) - (a1 & 0x8E383864)) ^ 0x7C8BC5B3);
  __asm { BR              X10 }
}

uint64_t sub_100006358(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((((v3 - 1439) | 8) ^ 0xFFFFFF63) + ((v3 - 1363) | 5))
                                     * (*(_DWORD *)(*(_QWORD *)(a1 + 8) + v4) == v1)) ^ v3)))();
}

uint64_t sub_10000639C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v7 = v1;
  v5 = a1;
  v6 = v2
     + 3804331 * ((-1267227818 - (&v5 | 0xB477A356) + (&v5 | 0x4B885CA9)) ^ 0xC42D476F)
     + 1512;
  result = sub_100027074((uint64_t)&v5);
  *v3 = 275110498 - *v3;
  return result;
}

uint64_t sub_10000654C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)*(&off_100058280 + ((39 * (*(_DWORD *)(a2 + 4) != 1991213897)) ^ 0x41Au)) - 8))();
}

uint64_t sub_100006588()
{
  return 4294925278;
}

uint64_t sub_100006590(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xFB5DFF8F)
                       + 1458488831
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0xFF1F);
  return 0;
}

void sub_1000065C8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;

  v1 = *(_DWORD *)(a1 + 8) + 3804331 * ((((2 * a1) | 0x83BDF70C) - a1 + 1042351226) ^ 0x4E7BE040);
  v2 = *(_QWORD *)a1;
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x79262543413A964BLL) - 137555249 >= 0)
    v3 = *(_DWORD *)(*(_QWORD *)a1 - 0x79262543413A964BLL) - 137555249;
  else
    v3 = 137555249 - *(_DWORD *)(*(_QWORD *)a1 - 0x79262543413A964BLL);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x79262543413A964BLL) - 137555249 >= 0)
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x79262543413A964BLL) - 137555249;
  else
    v4 = 137555249 - *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x79262543413A964BLL);
  v7 = v1
     - 1759421093
     * (((&v6 | 0x4292037D) - &v6 + (&v6 & 0xBD6DFC80)) ^ 0xF1EFB329)
     + 565;
  v6 = v2;
  sub_100005E90((uint64_t)&v6);
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  __asm { BR              X13 }
}

uint64_t sub_100006748(int a1)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 - 854389835 < (int)(v3 + 721203780);
  if (v3 > 0x55034DBB != v2 - 854389835 < -1426279868)
    v4 = v3 > 0x55034DBB;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v4 * (((a1 - 468328595) & 0x1BEA1F5E) - 827)) ^ a1)) - 4))();
}

uint64_t sub_1000067C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  _BOOL4 v18;

  v14 = 4 * (v10 + v8);
  v15 = v2 + 687086300 + (*(_DWORD *)(*(_QWORD *)(v13 - 0x79262543413A9647) + v14) ^ v9) + 1162;
  *(_DWORD *)(*(_QWORD *)(a1 - 0x79262543413A9647) + v14) = v15 + v9 - (v11 & (2 * v15));
  v16 = v10 + 1 + v3;
  v17 = (v12 > v7) ^ (v16 < v4);
  v18 = v16 < v6;
  if (v17)
    v18 = v12 > v7;
  return ((uint64_t (*)(unint64_t))(*(_QWORD *)(v1 + 8 * ((2012 * !v18) ^ v5)) - 4))(0xF7560AF028F41ADCLL);
}

uint64_t sub_1000068CC()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v5 = v2 - 1891436732 > 1831640530 || v2 - 1891436732 < (int)((((v1 + 152) | 0x2A9) ^ 0xED2C9E2C) + v3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1030 * v5) ^ v1)) - (((v1 - 30) | 0xCu) ^ 0xA8)))();
}

uint64_t sub_100006930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  _BOOL4 v16;

  v12 = 4 * (v9 + v7);
  v13 = v2 + 687087463 + (*(_DWORD *)(*(_QWORD *)(v11 - 0x79262543413A9647) + v12) ^ 0x8BBF2AC5);
  *(_DWORD *)(*(_QWORD *)(a1 - 0x79262543413A9647) + v12) = v13
                                                            + v8
                                                            - ((v10 + ((v5 + 122) | 0x2D9) - 1023) & (2 * v13));
  v14 = v9 + 1 + v3;
  v16 = v14 <= v4 && v14 >= v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((2 * v16) | (16 * v16) | v5)) - 4))();
}

uint64_t sub_100006A10()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((v1 == 0x8A9F510D70BE099) * (((v2 ^ 0x2B1) + 945) ^ (v2 - 239))) ^ v2))
                            - 12))();
}

uint64_t sub_100006A54()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((95 * (v2 + v3 + ((v1 + 984593627) & 0xC5504BDF) - 637 - 335 > 0x7FFFFFFE)) ^ v1))
                            - 12))();
}

uint64_t sub_100006AA0(int a1)
{
  uint64_t v1;
  unsigned int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((v2 < 0x7FFFFFFF) * (a1 ^ 0x4DB)) ^ ((a1 ^ 0x285) + 316))) - 4))();
}

uint64_t sub_100006C08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((*(_DWORD *)(*(_QWORD *)(a1 - 0x79262543413A9647)
                                                            + 4 * (v3 + v5 - 1)) != v4)
                                               * (((((v2 ^ 0x75B) + 1817491894) & 0x93AB42B7) + 7) ^ 0x283)) ^ ((v2 ^ 0x75B) + 1817491894) & 0x93AB42B7))
                            - ((((v2 ^ 0x75B) + 1817491894) & 0x93AB42B7)
                             - 309)
                            + 330))();
}

uint64_t sub_100006C7C()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v1 ^ (1183 * ((v3 + v2 - 2) < 0x7FFFFFFF))))
                            - (((v1 + 1170782404) & 0xBA3745FF)
                             + 309)
                            + 639))();
}

uint64_t sub_100006CCC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((*(_DWORD *)(v1 + 4 * (v3 + v5 - 1)) != v4)
                                          * ((v2 + 7) ^ 0x283)) ^ v2))
                            - (v2 - 309)
                            + 330))();
}

void sub_100006D0C(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(a1 - 0x79262543413A964BLL) = (((v3 + v2) * (v1 - 1273225095)) ^ 0x9BBFFB9)
                                         - 25760392
                                         + ((2 * (v3 + v2) * (v1 - 1273225095)) & 0x1377FF72);
}

void sub_100006E68(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v15;

  v1 = 1374699841 * (a1 ^ 0x6DF41809);
  v2 = *(_DWORD *)a1 + v1;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_DWORD *)(a1 + 4) - v1;
  v7 = 1225351577 * ((1667340836 - (&v8 | 0x63619A24) + (&v8 | 0x9C9E65DB)) ^ 0xE261FFE9);
  v12 = v7 ^ (*(_DWORD *)(a1 + 56) - v1 + 1330389426);
  v13 = v5;
  v15 = v5;
  v9 = v7 ^ (v2 + 1695027201);
  v10 = 60770465 * v6 - v7 - 709925104;
  v8 = v3;
  v11 = v4;
  sub_100045EA8((uint64_t)&v8);
  __asm { BR              X8 }
}

uint64_t sub_100006FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unint64_t *a12, char a13, unsigned int a14, uint64_t a15, int a16)
{
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  char v22;
  unsigned int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v23 = 1759421093 * ((&a11 - 2 * (&a11 & 0xDE579572) - 564685454) ^ 0x6D2A2526);
  v24 = (((v21 + 19) | 0xF1) ^ 0x9B) - 113 * (*(_BYTE *)(v16 + 24) + v22);
  a13 = ((v24 ^ 0xF6) + ((v21 + 8) & 0xD7 ^ 0xA9) + ((2 * v24) & 0xEC)) ^ (-91
                                                                         * ((&a11
                                                                           - 2 * (&a11 & 0x72)
                                                                           + 114) ^ 0x26));
  a16 = v21 - v23 - 83;
  a12 = &STACK[0x2C843C8B7CE89A36];
  a15 = v20;
  a14 = v19 + 28985119 + v23;
  sub_1000255CC((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * (((4 * (a11 != v17)) | (8 * (a11 != v17))) ^ v21))
                                                                                       - 4))(v25, v26, v27, v28, v29, v30);
}

uint64_t sub_1000070C4()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((v2 + 1485320360) & 0xA777CFCF ^ 0xD5D25643) + v0 > 0xFFFFFFFD)
                                          * ((v2 - 732) ^ 0xF1)) ^ v2))
                            - 12))();
}

void sub_100007118(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(a1 - 0x77F38C6ED9C42F88) = v2 + 1;
  *(_DWORD *)(v1 + 8) = 2017444214;
}

void sub_100007288(uint64_t a1, uint64_t a2)
{
  __asm { BR              X8 }
}

uint64_t sub_10000730C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((60 * (**(_BYTE **)(a2 + 8) == 0)) ^ 0x31Fu)) - 12))();
}

uint64_t sub_100007354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;

  *(_QWORD *)(*(_QWORD *)(a16 + 96) + 504) = v43 + 1;
  HIDWORD(a9) = a17 - 1;
  *(_DWORD *)(*(_QWORD *)(a16 + 96) + 496) = a17 - 1;
  v46 = 235795823 * ((((v45 - 152) | 0x14C5FA4E) - (v45 - 152) + ((v45 - 152) & 0xEB3A05B0)) ^ 0x8068B317);
  *(_DWORD *)(v45 - 148) = v46 - 953040206;
  *(_DWORD *)(v45 - 144) = -1882357464 - v46;
  *(_QWORD *)(v45 - 136) = &STACK[0x133E1E075B35BD1F];
  sub_100021DEC(v45 - 152);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, unint64_t *))(*(_QWORD *)(v44 + 8 * ((23 * (a17 + 164675833 + ((2 * a43) & 0x7C ^ 0x14) + (a43 & 0x3F ^ 0x7F7FBB75u) < 0xFFFFFFC0)) ^ 0x1AAu)) - 12))(2139077501, 2967356773, 1036, v47, 2141334807, 2153632584, 2633763667, v48, a9, &STACK[0x54BE37768DEB67FC], &STACK[0x3BFE8E53F98A3CF7]);
}

uint64_t sub_100007550(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;

  v10 = v6 + a3 - a6 + 14554047;
  if (v10 <= 0x40)
    v10 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((103 * (a1 - v7 - v8 + v10 > 0xE)) ^ a3)) - 12))();
}

uint64_t sub_1000075BC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;

  v9 = v5 + v4;
  v10 = v9 - 2139077501;
  if ((v9 - 2139077501) <= 0x40)
    v10 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((294 * (v3 - v9 - 2257306 >= (v7 + v10))) ^ a3))
                            - ((a3 - 662) ^ 0x17ALL)))();
}

uint64_t sub_100007610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35)
{
  int v35;
  int v36;
  uint64_t v37;

  return ((uint64_t (*)(void))(*(_QWORD *)(v37
                                        + 8
                                        * ((719
                                          * (((v36 + 19) ^ ((unint64_t)(&a35
                                                                                              + ~a18
                                                                                              + v35
                                                                                              + ((v36 - 102911) & 0x7FA3BD9F ^ 0xFF226995)) < 0x10)) & 1)) ^ v36))
                            - 8))();
}

uint64_t sub_10000767C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  int8x16_t v8;

  v7.i64[0] = 0xCECECECECECECECELL;
  v7.i64[1] = 0xCECECECECECECECELL;
  v8.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v8.i64[1] = 0xE7E7E7E7E7E7E7E7;
  *(int8x16_t *)(v3 + v1 + (v4 & 0x4616D7FFu) - 531 + a1) = vaddq_s8(vsubq_s8(*v6, vandq_s8(vaddq_s8(*v6, *v6), v7)), v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((239 * (((((v4 & 0x4616D7FFu) - 35) ^ 0x1FFFFFC96) & (v2 + 1)) != 16)) ^ ((v4 & 0x4616D7FF) - 35)))
                            - 8))();
}

void sub_100007704()
{
  JUMPOUT(0x1000076CCLL);
}

uint64_t sub_10000770C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v4 + 8 * (v1 ^ (228 * (v2 == v3))))
                                                   - ((v1 - 355) | 0x44u)
                                                   + 79))(a1, 2967356773);
}

uint64_t sub_100007758@<X0>(int a1@<W3>, int a2@<W5>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,char a30)
{
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;

  *(&a30 + ((((v32 - 1452458520) & 0xD6F09557) + 4294967208) & (a3 + v30 + 374))) = *(_BYTE *)(v31 + v34 - 1661203629)
                                                                                    - ((2
                                                                                      * *(_BYTE *)(v31 + v34 - 1661203629)) & 0xCF)
                                                                                    - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v33 + 8
                                              * ((1186 * ((a1 + v30 + 1) < 0x40)) ^ (a2 + v32 + 307)))
                            - 8))();
}

uint64_t sub_1000077E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,int a45,int a46,unsigned int a47,int a48,int a49,int a50,unsigned __int8 a51,int32x4_t a52,int32x4_t a53,int32x4_t a54,int32x4_t a55)
{
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t (*v62)(__n128, __n128, __n128, __n128, __n128, __n128);
  __n128 v63;
  __n128 v64;
  __n128 v65;
  uint64_t v66;
  __n128 v67;
  __n128 v68;
  __n128 v69;
  uint64_t v70;
  int v71;
  uint8x16_t v72;
  uint16x8_t v73;
  int8x16_t v74;
  int8x16_t v75;
  uint16x8_t v76;
  int8x16_t v77;
  int8x16_t v78;
  uint8x16_t v79;
  uint16x8_t v80;
  uint16x8_t v81;
  uint8x16_t v82;
  int8x16_t v85;
  int8x16_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int v96;
  uint8x16_t v97;
  uint16x8_t v98;
  uint16x8_t v99;
  uint8x16_t v100;
  uint8x16_t v105;
  uint16x8_t v106;
  uint16x8_t v107;
  int32x4_t v108;
  int32x4_t v109;
  _DWORD *v110;
  int v111;
  unsigned int v112;
  unint64_t v113;
  int8x16x4_t v114;
  int8x16x4_t v115;

  v62 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128, __n128))(v61 + 8 * v55);
  v63 = (__n128)vdupq_n_s32(0xF07F82EC);
  v64.n128_u64[0] = 0xE7E7E7E7E7E7E7E7;
  v64.n128_u64[1] = 0xE7E7E7E7E7E7E7E7;
  v65 = (__n128)vdupq_n_s32(0x783FC176u);
  v66 = (v59 - 3);
  v67.n128_u64[0] = 0xCECECECECECECECELL;
  v67.n128_u64[1] = 0xCECECECECECECECELL;
  v68.n128_u64[0] = 0xE8E8E8E8E8E8E8E8;
  v68.n128_u64[1] = 0xE8E8E8E8E8E8E8E8;
  v69 = (__n128)vdupq_n_s32(0x783FC17Eu);
  v70 = a47;
  v71 = a51 ^ 0xED;
  if (v71 == 2)
  {
    v96 = a5 ^ (a5 + 505);
    v115 = vld4q_s8(&a35);
    v97 = (uint8x16_t)veorq_s8(v115.val[0], (int8x16_t)v64);
    v98 = vmovl_u8(*(uint8x8_t *)v97.i8);
    v99 = vmovl_high_u8(v97);
    v100 = (uint8x16_t)veorq_s8(v115.val[1], (int8x16_t)v64);
    _Q23 = vmovl_u8(*(uint8x8_t *)v100.i8);
    _Q22 = vmovl_high_u8(v100);
    __asm
    {
      SHLL2           V24.4S, V22.8H, #0x10
      SHLL2           V25.4S, V23.8H, #0x10
    }
    v105 = (uint8x16_t)veorq_s8(v115.val[2], (int8x16_t)v64);
    v106 = vmovl_high_u8(v105);
    v107 = vmovl_u8(*(uint8x8_t *)v105.i8);
    v115.val[0] = veorq_s8(v115.val[3], (int8x16_t)v64);
    v115.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v115.val[0]);
    v115.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v115.val[1]);
    v115.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v115.val[0].i8);
    v115.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v115.val[0]);
    v115.val[0] = vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q23.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v107.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v98.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v115.val[0].i8));
    v108 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q25, (int8x16_t)vshll_high_n_u16(v107, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v98), 0x18uLL)), v115.val[3]);
    v115.val[1] = vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v106.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v99.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v115.val[1].i8));
    v109 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v106, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v99), 0x18uLL)), v115.val[2]);
    a54 = vaddq_s32(vsubq_s32((int32x4_t)v115.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v115.val[1], (int32x4_t)v115.val[1]), (int8x16_t)v63)), (int32x4_t)v65);
    a55 = vaddq_s32(vsubq_s32(v109, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v109, v109), (int8x16_t)v63)), (int32x4_t)v65);
    a52 = vaddq_s32(vsubq_s32((int32x4_t)v115.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v115.val[0], (int32x4_t)v115.val[0]), (int8x16_t)v63)), (int32x4_t)v65);
    a53 = vaddq_s32(vsubq_s32(v108, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v108, v108), (int8x16_t)v63)), (int32x4_t)v65);
    v110 = (_DWORD *)&a52 + v56 + 1099507103;
    v111 = *((_DWORD *)&a52 + (((v96 + 113) | 0x181u) ^ (unint64_t)(v56 - 225)) + 1099507103) ^ *(v110 - 3);
    v112 = *(v110 - 16) ^ *(v110 - 14) ^ (v111 + v57 - ((2 * v111) & 0xF07F82EC));
    HIDWORD(v113) = v112 ^ v57;
    LODWORD(v113) = v112;
    *v110 = (v113 >> 31) + v57 - ((2 * (v113 >> 31)) & 0xF07F82EC);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61
                                                                                   + 8
                                                                                   * ((1701 * (v58 == 1099507040)) ^ v96))
                                                                       - 12))(v70, 3489660928, v66, 58663199);
  }
  else if (v71 == 1)
  {
    v114 = vld4q_s8(&a35);
    v72 = (uint8x16_t)veorq_s8(v114.val[0], (int8x16_t)v64);
    v73 = vmovl_u8(*(uint8x8_t *)v72.i8);
    v74 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v73.i8);
    v75 = (int8x16_t)vmovl_high_u16(v73);
    v76 = vmovl_high_u8(v72);
    v77 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v76.i8);
    v78 = (int8x16_t)vmovl_high_u16(v76);
    v79 = (uint8x16_t)veorq_s8(v114.val[1], (int8x16_t)v64);
    v80 = vmovl_high_u8(v79);
    v81 = vmovl_u8(*(uint8x8_t *)v79.i8);
    v82 = (uint8x16_t)veorq_s8(v114.val[2], (int8x16_t)v64);
    _Q27 = (int8x16_t)vmovl_high_u8(v82);
    _Q26 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v82.i8);
    v85 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v90 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q27.i8, 0x10uLL);
    __asm { SHLL2           V27.4S, V27.8H, #0x10 }
    v114.val[0] = veorq_s8(v114.val[3], (int8x16_t)v64);
    v114.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v114.val[0]);
    v114.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v114.val[1]);
    v114.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v114.val[0].i8);
    v114.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v114.val[0]);
    v114.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v114.val[0].i8), 0x18uLL), v85), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v81.i8, 8uLL), v74));
    v114.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v114.val[3], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v81, 8uLL), v75));
    v114.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v114.val[1].i8), 0x18uLL), v90), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v80.i8, 8uLL), v77));
    v114.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v114.val[2], 0x18uLL), _Q27), vorrq_s8((int8x16_t)vshll_high_n_u16(v80, 8uLL), v78));
    v91 = (int32x4_t)veorq_s8(vandq_s8(v114.val[0], (int8x16_t)v69), (int8x16_t)(*(_OWORD *)&v74 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v92 = (int32x4_t)veorq_s8(vandq_s8(v114.val[3], (int8x16_t)v69), (int8x16_t)(*(_OWORD *)&v75 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v93 = (int32x4_t)veorq_s8(vandq_s8(v114.val[1], (int8x16_t)v69), (int8x16_t)(*(_OWORD *)&v77 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v94 = (int32x4_t)veorq_s8(vandq_s8(v114.val[2], (int8x16_t)v69), (int8x16_t)(*(_OWORD *)&v78 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    a54 = vaddq_s32(vsubq_s32((int32x4_t)v114.val[1], vaddq_s32(v93, v93)), (int32x4_t)v65);
    a55 = vaddq_s32(vsubq_s32((int32x4_t)v114.val[2], vaddq_s32(v94, v94)), (int32x4_t)v65);
    a52 = vaddq_s32(vsubq_s32((int32x4_t)v114.val[0], vaddq_s32(v91, v91)), (int32x4_t)v65);
    a53 = vaddq_s32(vsubq_s32((int32x4_t)v114.val[3], vaddq_s32(v92, v92)), (int32x4_t)v65);
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, __n128))(*(_QWORD *)(v61
                                                                                 + 8
                                                                                 * (int)((a5 - 2038200668) & 0xF9DA4DDF))
                                                                     - 8))(a47, a2, v66, v63);
  }
  else
  {
    a45 = v59 + 2 * (a45 ^ v59) - (v60 & (4 * (a45 ^ v59)));
    a46 = 2 * (a46 ^ v59) + v59 - (v60 & (4 * (a46 ^ v59)));
    a47 = 2 * (a47 ^ v59) + v59 - (v60 & (4 * (a47 ^ v59)));
    a48 = 2 * (a48 ^ v59) + v59 - (v60 & (4 * (a48 ^ v59)));
    return v62(v63, v64, v65, v67, v68, v69);
  }
}

uint64_t sub_1000083A0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20,int a21,unsigned int a22)
{
  uint64_t v22;
  _BOOL4 v23;

  if (a4 < a22 != a19 + 933265269 < ((a6 + a5 + 511) ^ 0x9AA471BC))
    v23 = a19 + 933265269 < ((a6 + a5 + 511) ^ 0x9AA471BC);
  else
    v23 = a19 + 933265269 > a4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v22 + 8 * ((633 * !v23) ^ (a6 + a5 + 331)))
                            - ((17 * (a5 ^ (a5 + 95))) ^ 0x67DLL)))();
}

uint64_t sub_100008438@<X0>(int a1@<W6>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * ((153
                                              * (((((v2 - 90) ^ 0x3B) + 1) ^ (a2
                                                                                             + 492428923
                                                                                             + ((v2 - 5506906) & 0x7FF62DFFu) < a2 + a1)) & 1)) ^ v2)))(89);
}

uint64_t sub_10000849C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  return (*(uint64_t (**)(void))(v21
                              + 8
                              * (((a6 + ((a5 + v19 - 2141373796) & 0x7FA2BF37) - 2)
                                * ((unint64_t)(~a18 + v18 - v20) < 0x10)) ^ v19)))();
}

uint64_t sub_1000084F0@<X0>(int a1@<W0>, int a2@<W5>, int a3@<W6>, int a4@<W8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  v10 = *(_BYTE *)(v8 + a4 + ((a2 + v5 - 43) ^ (a3 + 20)));
  *(_BYTE *)(v6 + v4) = v10 + (v9 | ~(2 * v10)) - 24;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v4 == 63) * a1) ^ (a2 + v5 + 929))) - 4))();
}

uint64_t sub_100008544@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W6>, int a4@<W7>, int a5@<W8>, int8x16_t a6@<Q3>, int8x16_t a7@<Q4>)
{
  int v7;
  int8x16_t *v8;
  uint64_t v9;
  uint64_t v10;
  int8x16_t v11;

  v11 = *(int8x16_t *)(v10 + a5 + ((v7 - a1 + 52) ^ (a3 + 20)));
  *v8 = vaddq_s8(vaddq_s8(v11, a7), vmvnq_s8(vandq_s8(vaddq_s8(v11, v11), a6)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (a4 ^ (a2 + v7 + 1018))) - 4))();
}

uint64_t sub_1000085AC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  int v10;
  uint64_t v11;
  _BOOL4 v12;

  v12 = a1 - 908242469 < (a10 - 1238252737);
  if ((a10 - 1238252737) < 0x2CE14688 != (a1 - 908242469) < 0x2CE14688)
    v12 = (a10 - 1238252737) < 0x2CE14688;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((v12 * ((v10 ^ 0x6F6) - 945)) ^ v10)) - 8))();
}

uint64_t sub_10000861C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v49;
  uint64_t v50;

  v46 = a2 ^ (a5 - 856);
  v47 = 1755732067 * ((((2 * (v45 - 152)) | 0x581E1344) - (v45 - 152) - 739183010) ^ 0xF2C9B479);
  *(_QWORD *)(v45 - 152) = a15;
  *(_DWORD *)(v45 - 144) = v47 + a2 - 970;
  *(_DWORD *)(v45 - 140) = a17 - v47 + ((a2 - 832) ^ 0xD7A5797D);
  v49 = sub_100005D78(v45 - 152);
  v50 = a44 & 0x3F;
  *(&a35 + (v50 ^ 0xB)) = 103;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v44
                                                     + 8
                                                     * ((((v50 ^ 0xB) > 0x37) * (v46 ^ 0x7FA22D7E)) ^ a2)))(v49, 2967356773);
}

uint64_t sub_100008710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28)
{
  int v28;
  uint64_t v29;

  return ((uint64_t (*)(void))(*(_QWORD *)(v29
                                        + 8 * (int)(((((a28 + 869966069) & 0xCC255DE6) + 150) * (v28 == 63)) ^ a28))
                            - 12))();
}

uint64_t sub_10000874C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (int)(((((v6 + 1046) ^ (a5 - 1198) ^ 0xFFFFFEDD) + ((v6 + 1046) ^ (a5 - 1198)))
                                               * ((v5 ^ 0x34u) < 8)) ^ (v6 + 1046)))
                            - 12))();
}

uint64_t sub_100008788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35)
{
  int v35;
  char v36;
  unsigned int v37;
  uint64_t v38;

  *(_QWORD *)(&a35 + v37 + 1) = 0xE7E7E7E7E7E7E7E7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v38 + 8 * ((1923 * ((v36 & 0x38) == 8)) ^ (a6 + v35 + 925)))
                            - ((v35 - a5 + 434) ^ 0x1BALL)))();
}

void sub_1000087E0()
{
  JUMPOUT(0x1000087B8);
}

uint64_t sub_1000087E8@<X0>(unsigned int a1@<W0>, int a2@<W6>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,char a30)
{
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  unsigned int v38;
  int v39;
  _BOOL4 v40;

  v37 = v31 < a1;
  *(&a30 + (v30 + v33)) = *(_BYTE *)(v36 + (a3 + a2))
                                      - ((*(unsigned __int8 *)(v36 + (a3 + a2)) << (v34 - 93)) & 0xCE)
                                      - 25;
  v38 = a3 + 1 + v32;
  v39 = v37 ^ (v38 < a1);
  v40 = v38 < v31;
  if (!v39)
    v37 = v40;
  return ((uint64_t (*)(void))(*(_QWORD *)(v35 + 8 * ((247 * v37) ^ v34)) - 8))();
}

uint64_t sub_100008860@<X0>(int a1@<W5>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((872 * (a2 - 363529884 < ((a1 + v3 - 79) | 0x44u) - 28)) ^ (a1 + v3 + 290)))
                            - 8))();
}

uint64_t sub_1000088A4@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a1 - 363529884;
  if ((unint64_t)(v4 + 1) > 0x38)
    v5 = v4 + 1;
  else
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((189
                                          * (v5 - v3 + ((v1 + 2142236011) & 0xFFF23F57 ^ 0x6A092B8BuLL) >= (unint64_t)(v1 + 784) - 860)) ^ v1))
                            - 8))();
}

uint64_t sub_10000891C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35)
{
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  *(_QWORD *)(&a35 + v37 - 363529884) = 0xE7E7E7E7E7E7E7E7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v38
                                        + 8 * ((((v36 & 0xFFFFFFFFFFFFFFF8) == 8) * ((v35 ^ 0x330) + 132)) ^ v35))
                            - 8))();
}

uint64_t sub_10000896C(double a1)
{
  int v1;
  double *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *v2 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v4 == 0) * v3) ^ v1)) - 8))();
}

uint64_t sub_100008990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v7 ^ (469 * (v5 == v6))))
                            - (v7 ^ (a5 + 44) ^ 0x7FA22D1FLL)))();
}

void sub_1000089C8()
{
  JUMPOUT(0x100007800);
}

uint64_t sub_100008DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((((a5 + ((v6 - 656470211) & 0x2720EF54) - 68) ^ (a5 - 989)) * (v7 != v5)) ^ v6))
                            - 12))();
}

void sub_100008E24()
{
  JUMPOUT(0x100007800);
}

uint64_t sub_100008E38@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,char a30)
{
  int v30;
  uint64_t v31;

  *(&a30 + a3 - 363529884) = -25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v31
                                        + 8
                                        * ((694 * (a3 - 363529883 < (unint64_t)(v30 - a1 + 68) - 4)) ^ (a2 + v30 + 339)))
                            - 12))();
}

uint64_t sub_100008EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47)
{
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  int v51;
  uint64_t v52;
  unsigned int v53;
  int v54;
  _BOOL4 v55;

  v53 = ((v49 - 5030056) & 0x7FA22D5F ^ 0xC96A05C0) + v51;
  v54 = *(_DWORD *)(&a35 + (v53 & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a8 + v53) = (HIBYTE(v54) ^ 0xD3) - 2 * ((HIBYTE(v54) ^ 0xD3) & 0xEF ^ HIBYTE(v54) & 8) - 25;
  *(_BYTE *)(a8 + (v51 + v47)) = (BYTE2(v54) ^ 0x7F) - ((2 * (BYTE2(v54) ^ 0x7F)) & 0xCF) - 25;
  *(_BYTE *)(a8 + (v51 + v47 + 1)) = (BYTE1(v54) ^ 0x21)
                                                 + ~(2 * ((BYTE1(v54) ^ 0x21) & 0xEF ^ BYTE1(v54) & 8))
                                                 - 24;
  *(_BYTE *)(a8 + (v51 + v47 + 2)) = v54 ^ 0xF8;
  v55 = v51 - 18969413 < (a47 + 1146681108);
  if (v51 - 18969413 < v48 != a47 + 1146681108 < v48)
    v55 = a47 + 1146681108 < v48;
  return ((uint64_t (*)(void))(*(_QWORD *)(v52 + 8 * ((v55 * v50) ^ v49)) - 4))();
}

void sub_1000090AC()
{
  JUMPOUT(0x100009074);
}

uint64_t sub_1000090B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  int v47;
  uint64_t v48;

  *(_DWORD *)(&a47 + a33) = 1701137805;
  return (*(uint64_t (**)(uint64_t))(v48 + 8 * ((681 * ((v47 - 685) ^ 0xC1)) ^ 0x629 ^ (v47 - 685))))(2147484444);
}

uint64_t sub_10000915C(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((v2 == ((v1 + 2147477605) & 0xFFA23F5F ^ 0x53F3849A))
                                          * (((a1 + v1 + 2147477605 + 3901) | 0x32C) ^ 0x336)) ^ v1))
                            - 12))();
}

uint64_t sub_1000091C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;

  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * ((119
                                          * ((((v17 - 36) ^ (((((8 * v17) ^ 0x1AF8) - 796) & (v19 - 1991213893)) - a17 == -1991213897)) & 1) == 0)) ^ v17))
                            - 12))();
}

uint64_t sub_100009220@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26)
{
  int v26;
  uint64_t v27;
  int v28;
  _BOOL4 v30;

  v30 = a1 == 1701137805 || a26 - v28 != -1767924686;
  return ((uint64_t (*)(void))(*(_QWORD *)(v27 + 8 * ((v30 * ((v26 + 515) ^ 0x51C)) ^ v26)) - 12))();
}

uint64_t sub_10000926C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,int a33)
{
  int v33;
  uint64_t v34;
  int v35;
  unsigned __int8 v36;
  int v37;
  int v38;
  unsigned int v39;
  BOOL v40;

  v36 = v33 ^ (a5 + 59);
  v37 = 17 * (v33 ^ (a5 + 33));
  v38 = a6 + v33 + 288;
  v39 = v35 + (v37 ^ 0xAEDD1961);
  v40 = a33 + 406683212 < v39;
  if ((a33 + 406683212) < 0x258C9DC6 != v39 < 0x258C9DC6)
    v40 = v39 < 0x258C9DC6;
  return (*(uint64_t (**)(void))(v34 + 8 * ((250 * ((v36 ^ v40) & 1)) ^ v38)))();
}

uint64_t sub_1000093EC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((*(_DWORD *)(v4 + 48 * (((v0 + 474) ^ (v1 - 261)) + v2) + 36) != v2)
                                          * (v0 - 270)) ^ v0))
                            - 8))();
}

uint64_t sub_100009430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;

  v33 = 628203409 * ((8872314 - ((v32 - 152) | 0x87617A) + ((v32 - 152) | 0xFF789E85)) ^ 0x7DF092B6);
  *(_QWORD *)(v32 - 152) = a12;
  *(_QWORD *)(v32 - 144) = a10;
  *(_QWORD *)(v32 - 128) = a13;
  *(_DWORD *)(v32 - 136) = v27 - v33 - 221;
  *(_DWORD *)(v32 - 132) = v30 - v33 - 1237823394;
  *(_QWORD *)(v32 - 112) = v31;
  *(_QWORD *)(v32 - 104) = a11;
  ((void (*)(uint64_t))((char *)*(&off_10005BF50 + v27 - 724) - 8))(v32 - 152);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v29
                                                               + 8
                                                               * (((*(_DWORD *)(v32 - 120) == v28)
                                                                 * (((v27 + 195167476) | 0x74002504) ^ 0x7FA22B18)) ^ v27))
                                                   - (v27 ^ 0x6BDu)
                                                   + 1430))(2147484444, a27);
}

uint64_t sub_100009540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;

  v10 = *(_DWORD *)(v9 + 48 * (v6 + v5)) == ((v7 + 1252140917) | 0x35000000) - a5 + 1233426915;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * ((4 * v10) | (8 * v10) | v7)) - 4))(a1, a2, v9);
}

uint64_t sub_1000095A0@<X0>(int a1@<W5>, int a2@<W8>)
{
  int v3;

  if ((a2 + 1811463635) <= 0x12 && ((1 << (a2 - 45)) & 0x50121) != 0)
    __asm { BR              X10 }
  return v3 ^ 0x87C09AA8;
}

uint64_t sub_1000099A8(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))*(&off_100058280 + ((1188 * (*(_DWORD *)(a2 + 4) == 1991213897)) | 0x219u)))();
}

uint64_t sub_1000099E0(uint64_t a1, uint64_t a2)
{
  char v2;

  if (**(_BYTE **)(a2 + 8))
    v2 = 0;
  else
    v2 = -2;
  *(_BYTE *)(a1 + 88) = ((**(_BYTE **)(a2 + 8) != 0) ^ 0x13) + v2;
  return 0;
}

uint64_t sub_100009A1C()
{
  return 4294925278;
}

uint64_t sub_100009A24(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 + 127962867 - 2 * (a1 & 0x7A08EF3)) ^ 0xD9663328));
  return (*((uint64_t (**)(void))*(&off_10005BF50 + v1 - 29)
          + ((1122 * (*(_QWORD *)(a1 + 8) != 0x43C85E0409B7388DLL)) ^ v1)))();
}

uint64_t sub_100009AA0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((869
                                * (*(_DWORD *)(v2 - 0x43C85E0409B73875) == ((v1 - 1083079411) & 0x408E7FEC ^ 0x783FC49A))) ^ v1)))();
}

uint64_t sub_100009AFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x43C85E0409B7387DLL) + 132538956;
  v4 = *(_DWORD *)(v1 - 0x43C85E0409B73881) - 933801284;
  v5 = v3 < 0x208CBAD5;
  v6 = v3 > v4;
  if (v5 != v4 < 0x208CBAD5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((26 * v6) ^ v2)) - 121 * (v2 ^ 0x5EE) + 234))();
}

uint64_t sub_100009B98@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;

  v5 = *(_QWORD *)(v3 - 0x43C85E0409B7388DLL);
  v6 = ((*(unsigned __int8 *)(v5 + (v2 - 413554833)) ^ 0xFFFFFFE7) << 24) | ((*(unsigned __int8 *)(v5 + (v2 - 413554832)) ^ 0xE7) << 16) | ((*(unsigned __int8 *)(v5 + (((v4 ^ 0x65) + 1133525510) & 0xBC6FC3FB ^ ((v4 ^ 0x65) - 413556879)) + v2) ^ 0xE7) << 8) | *(unsigned __int8 *)(v5 + (v2 - 413554830)) ^ 0xE7;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((25
                                          * (((v1 + v6 - ((2 * v6) & 0xF07F82EC) + 0x1000000) & 0xFFFFFF) == 12900398)) ^ v4 ^ 0x65u))
                            - 8))();
}

uint64_t sub_100009C6C@<X0>(int a1@<W2>, int a2@<W5>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * (int)(a1 ^ ((4 * (((-1 - a2) >> 30) & 1)) | (32 * (((-1 - a2) >> 30) & 1)))))
                            - ((a1 ^ 0x7E4u)
                             - 564)
                            + 563))();
}

uint64_t sub_100009D18@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a2 + 8 * ((238 * (v3 != v2)) ^ a1)))();
}

void sub_100009D34()
{
  _DWORD *v0;

  *v0 = -2017420733;
}

uint64_t sub_100009DEC@<X0>(_QWORD *a1@<X0>, int a2@<W4>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;

  *(_QWORD *)(*a1 - 0x1500148A4D1A050BLL) = 0;
  return (*(uint64_t (**)(void))(a3 + 8 * ((973 * (*v3 == v4)) ^ (22 * (a2 ^ 0x464)))))();
}

uint64_t sub_100009E3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  *(_QWORD *)(*a1 - 0x1500148A4D1A050BLL) = v5 + v4 + 8;
  return (*(uint64_t (**)(void))(a2 + 8 * (int)((973 * (*v2 == v3)) ^ (v6 + 2043840131) & 0x862D75FF)))();
}

void sub_100009EA4(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x107D0947D4240281) = v3;
  *v1 = v2;
  JUMPOUT(0x100009DE8);
}

void sub_100009EC4()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE v2[1200];

  v0 = (unint64_t)&v2[qword_100060148 + qword_100060118];
  qword_100060148 = (45734839 * v0) ^ 0x95387C5A7726064;
  qword_100060118 = 45734839 * (v0 ^ 0x95387C5A7726064);
  *(_DWORD *)*(&off_10005BF50
             + ((-73 * ((qword_100060118 - qword_100060148) ^ 0x64)) ^ byte_100053CE0[byte_10004F0C0[(-73 * ((qword_100060118 - qword_100060148) ^ 0x64))] ^ 0xA3])
             - 93) = 2017444214;
  v1 = ((uint64_t (*)(uint64_t, uint64_t))*(&off_10005BF50
                                                  + ((-73
                                                                                   * ((qword_100060118 - qword_100060148) ^ 0x64)) ^ byte_1000577C0[byte_100053AE0[(-73 * ((qword_100060118 - qword_100060148) ^ 0x64))] ^ 0x97])
                                                  + 163))(512, 1509315540);
  *(_QWORD *)*(&off_10005BF50
             + ((-73 * (qword_100060148 ^ 0x64 ^ qword_100060118)) ^ byte_100057AC0[byte_100053DE0[(-73 * (qword_100060148 ^ 0x64 ^ qword_100060118))] ^ 0x52])
             + 184) = v1;
  __asm { BR              X8 }
}

void sub_10000A074()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

uint64_t sub_100010FA0(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x79262543413A964BLL);
  v4 = v2 - 137555249;
  v3 = v2 - 137555249 < 0;
  v5 = 137555249 - v2;
  if (!v3)
    v5 = v4;
  v1 = (*(_DWORD *)(a1 + 4) + 1755732067 * ((a1 - 1759316641 - 2 * (a1 & 0x9722F55F)) ^ 0x49E44884) - 558) | 0x20;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v1 ^ 0x2E4))
                              + (((v1 + (v5 ^ 0xAEFF5FFB) + ((2 * v5) & 0x5DFEBFF6) + 1358994899 < 0x7FFFFFFF)
                                * (v1 + 634)) ^ v1))
                            - 4))();
}

uint64_t sub_1000110A4()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  unsigned int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((180 * (*(_DWORD *)(*v2 + 4 * v3) != ((v4 - 1605609860) & 0x5FB3A7FF) + v0)) ^ v4))
                            - 17 * (v4 ^ 0x41Eu)
                            + 557))();
}

uint64_t sub_1000110F8@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(*(_QWORD *)(v1 + 8 * (v2 ^ 0x2E4))
                                        + 8 * ((((a1 - 687824333) < 0x7FFFFFFF) * (v2 + 634)) ^ v2))
                            - 4))();
}

_DWORD *sub_10001113C(_DWORD *result)
{
  *result = 1928968890;
  return result;
}

uint64_t sub_10001114C()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((((v2 ^ (v0 + 699)) >> 31) * (17 * (v3 ^ 0x29A) + 1012)) ^ v3))
                            - 4))();
}

uint64_t sub_10001118C()
{
  unsigned int v0;
  uint64_t v1;
  char v2;
  int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (int)((((v0 >> (v2 + 31)) & 1) * v3) ^ v4)) - 4))();
}

_DWORD *sub_1000111B0@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  char v2;
  int v3;

  *result = (a2 << ((v2 - 50) & 0x3F ^ 0x3A)) + v3 + 1393426779;
  return result;
}

void sub_1000111EC(unint64_t a1)
{
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  _QWORD v11[2];
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  _DWORD *v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  unint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  _BYTE v40[4];
  unsigned int v41;
  int v42;
  unint64_t *v43;

  v1 = 1224239923 * ((2 * ((a1 ^ 0x6CFE4100) & 0x6997F88A) - (a1 ^ 0x6CFE4100) - 1771567243) ^ 0x825BBA2);
  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 44);
  v24 = (_DWORD *)a1;
  v4 = v2 - v1;
  v34 = (v2 - v1 + 109297128) & 0xF97C47DF;
  v5 = 235795823
     * (((v40 ^ 0x46C05FDF | 0xC9B2DC24)
       - (v40 ^ 0x46C05FDF)
       + ((v40 ^ 0x46C05FDF) & 0x364D23DB)) ^ 0x1BDFCAA2);
  v6 = *(_DWORD *)(a1 + 12) + v1;
  v23 = 1224239923
      * ((2 * ((a1 ^ 0xDCF66856CFE4100) & 0x712F41ED6997F88ALL) - (a1 ^ 0xDCF66856CFE4100) - 0x712F41ED6997F88BLL) ^ 0xAB456DFE0825BBA2);
  v7 = v3 - v1;
  v41 = v5 - 953040206;
  v42 = v4 - v5 - 1882357549;
  v28 = &STACK[0x133E1E075B35BED7];
  v43 = &STACK[0x133E1E075B35BED7];
  sub_100021DEC((uint64_t)v40);
  v8 = v6;
  v9 = (uint64_t)*(&off_10005BF50 + v4 + 128);
  v30 = *(_QWORD *)(v9 + 8 * v4) - 8;
  v19 = v7 + 2086824093;
  v18 = -85743793;
  v22 = v7 + 160159281;
  v16 = v7 - 982471027;
  v15 = v34 ^ 0x43F1EB22;
  v14 = v7 - 808207188;
  v11[1] = (char *)&v11[-147735435] + 3;
  v17 = 133 * (v4 ^ 0x50);
  v33 = v17 ^ 0xFFFFFD62;
  v21 = v4 ^ 0x16C;
  v13 = 1928482559;
  v12 = v4 - 253167712;
  v31 = (v4 - 253167712);
  v20 = v31;
  v32 = v4;
  v26 = vdupq_n_s32(0x783FC176u);
  v27 = vdupq_n_s32(0xF07F82EC);
  v25 = vdupq_n_s32(0x783FC17Eu);
  v29 = *((_QWORD *)v24 + 3);
  v10 = v8 - ((2 * v8 - 84832688) & 0xEAE43D16) + 1927996851;
  v35 = (HIBYTE(v10) ^ 0x75)
      - 2
      * ((HIBYTE(v10) ^ 0x75) & (((((v4 - 24) & 0xDF) - 13) | 0x81) ^ 0x7E) ^ HIBYTE(v10) & (((((v4 - 24) & 0xDF) - 27) | 0x20)
                                                                                           - 26))
      - 25;
  v36 = (BYTE2(v10) ^ 0x72) - ((2 * (BYTE2(v10) ^ 0x72)) & 0xCF) - 25;
  v37 = (BYTE1(v10) ^ 0x1E) + (~(2 * (BYTE1(v10) ^ 0x1E)) | 0x31) - 24;
  v38 = (v8 - ((2 * v8 + 80) & 0x16) - 77) ^ 0x6C;
  __asm { BR              X15 }
}

uint64_t sub_100011678(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;

  v7 = v5 + 1625;
  if ((v5 + 1625) <= 0x40)
    v7 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                        + 8
                                                                        * (v2 ^ (28
                                                                               * ((-v3
                                                                                               - 134284372
                                                                                               - v4
                                                                                               + v7
                                                                                               + 656) > 0xE))))
                                                            - ((v2 ^ 0x7B2u)
                                                             + 914)
                                                            + 1566))(940160230, a2, -2014839312);
}

uint64_t sub_100011700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36)
{
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  _BOOL4 v43;

  v41 = v37 + v36 + 134282091;
  v42 = v41 + 325 * (v38 ^ 0x627);
  if (v42 <= 0x40)
    v42 = 64;
  v43 = __CFADD__(v41 + 1624, a36 - 134284372 + v39 + 164 * (v38 ^ 0x626) + v42);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 + 8 * ((26 * v43) ^ v38)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_100011790@<X0>(int a1@<W1>, _OWORD *a2@<X3>, uint64_t a3@<X6>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  int v31;
  uint64_t v32;

  *(_OWORD *)(a3 + (a4 + a1)) = *a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v32
                                        + 8
                                        * ((201 * (((v31 - 1623) | 0x2C0u) - 690 == ((a31 + 1) & 0x1FFFFFFF0))) ^ v31))
                            - 12))();
}

uint64_t sub_1000117F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                        + 8
                                                                        * (((((v2 == v3) ^ (v4 - 1)) & 1)
                                                                          * ((v4 - 656) ^ 0x1F2)) ^ v4))
                                                            - 12))(a1, a2, -2014839312);
}

uint64_t sub_100011848@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned int a5@<W5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  int v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;

  *(_BYTE *)(a6 + (((v7 + a1) & a5 ^ v9) & (a7 + a2))) = *(_BYTE *)(v8 + a4 + a3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((a2 + a7 + 1) > 0x3F) * v10) ^ v7)) - 12))();
}

uint64_t sub_100011898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  int v48;
  int8x16_t v49;
  uint64_t (*v50)(_QWORD, _QWORD, _QWORD);
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  uint8x16_t v57;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  unsigned int v70;
  int v71;
  uint64_t v73;
  uint64_t v74;
  uint8x16_t v75;
  uint64_t v80;
  _DWORD *v81;
  int v82;
  uint64_t v83;
  int v84;
  int v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(_QWORD, _QWORD, _QWORD);
  int8x16x4_t v90;
  int8x16x4_t v91;

  v50 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))((v38 + 161) + *(_QWORD *)(v42 + 8 * v38) - 223);
  v88 = v39;
  v51 = STACK[0x2CC];
  v52 = STACK[0x2D0];
  v53 = STACK[0x2D8];
  v54 = STACK[0x2D4];
  LODWORD(a36) = STACK[0x2D8];
  v55 = LOBYTE(STACK[0x2E4]) ^ 0xED;
  HIDWORD(a32) = LOBYTE(STACK[0x2E4]) ^ 0xFFFFFFED;
  HIDWORD(a34) = STACK[0x2D0];
  LODWORD(a35) = STACK[0x2D4];
  if (v55 == 2)
  {
    v89 = v50;
    v73 = (a5 + 1095) | 0x42u;
    v74 = LODWORD(STACK[0x2DC]);
    v91 = vld4q_s8((const char *)&STACK[0x284]);
    v75 = (uint8x16_t)veorq_s8(v91.val[1], v49);
    _Q17 = vmovl_u8(*(uint8x8_t *)v75.i8);
    _Q16 = vmovl_high_u8(v75);
    __asm
    {
      SHLL2           V18.4S, V16.8H, #0x10
      SHLL2           V19.4S, V17.8H, #0x10
    }
    v80 = (v73 - 777);
    v81 = (_DWORD *)(v41 + 4 * (v47 + 1366665365));
    v82 = *(v81 - 8) ^ *(v81 - 3);
    v83 = *(v81 - 16);
    v84 = v83 ^ *(v81 - 14) ^ (v82 + v44 - ((2 * v82) & 0xF07F82EC));
    HIDWORD(v86) = v84 ^ (v44 + v80 - 469);
    LODWORD(v86) = v84;
    v85 = v86 >> 31;
    v87 = (2 * v85) & 0xF07F82EC;
    *v81 = v85 + v44 - v87;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(_QWORD, _QWORD, _QWORD), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 8 * (int)((58 * (v40 == 1366665302)) ^ v73)))(v74, v73, v87, v74, v80, v83, 4034888428, v40 - 16, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             v88,
             a31,
             a32,
             v89,
             a34,
             a35,
             a36,
             a37,
             a38);
  }
  else if (v55 == 1)
  {
    v90 = vld4q_s8((const char *)&STACK[0x284]);
    v56 = (a5 + 1133);
    v57 = (uint8x16_t)veorq_s8(v90.val[2], v49);
    _Q21 = vmovl_high_u8(v57);
    _Q20 = vmovl_u8(*(uint8x8_t *)v57.i8);
    __asm
    {
      SHLL2           V20.4S, V20.8H, #0x10
      SHLL2           V21.4S, V21.8H, #0x10
    }
    v64 = v40 - 16;
    v65 = (a5 + 1428);
    v66 = *(_QWORD *)(v43 + 8 * ((int)v56 - 1054)) - 8;
    v67 = *(_QWORD *)(v43 + 8 * (int)(v56 ^ 0x4CC)) - 4;
    v68 = (v51 ^ v46)
        + a8
        + ((v52 ^ v48) & (v53 ^ v46) | (v52 ^ v46) & (v54 ^ v46))
        + *(_DWORD *)(v67 + 4 * (v64 + v47))
        + (*(_DWORD *)(v41 + 4 * (*(_BYTE *)(v66 + v64 + v47) - 43)) ^ (v44 + v65 - 1513));
    v69 = *(_QWORD *)(v43 + 8 * (int)(v56 ^ 0x4C7));
    v70 = (v68 + v46 - (v45 & (2 * v68))) ^ v46;
    v71 = ((v70 << (*(_BYTE *)(v69 + v64 + v47) - 102)) | (v70 >> (102 - *(_BYTE *)(v69 + v64 + v47)))) + (v52 ^ v46);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(_QWORD, _QWORD, _QWORD), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 + 8 * (int)v56) - 8))(v66, v67, v69, v56, v65, v71 + v46 - (v45 & (2 * v71)), v40 - 15, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             v88,
             a31,
             a32,
             v50,
             a34,
             a35,
             a36,
             a37,
             a38);
  }
  else
  {
    LODWORD(STACK[0x2CC]) = 2 * (v51 ^ v46) + v46 - (v45 & (4 * (v51 ^ v46)));
    LODWORD(STACK[0x2D0]) = (v52 ^ v46)
                          + (HIDWORD(a34) ^ v46)
                          + v46
                          - (v45 & (2 * ((v52 ^ v46) + (HIDWORD(a34) ^ v46))));
    LODWORD(STACK[0x2D4]) = (v54 ^ v46) + (a35 ^ v46) + v46 - (v45 & (2 * ((v54 ^ v46) + (a35 ^ v46))));
    LODWORD(STACK[0x2D8]) = (v53 ^ v46) + (a36 ^ v46) + v46 - (v45 & (2 * ((v53 ^ v46) + (a36 ^ v46))));
    return v50(2280127984, a2, 774);
  }
}

uint64_t sub_100012A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,uint64_t a31,unsigned int a32)
{
  uint64_t v32;
  int v33;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * ((29 * (v33 + a30 + 134 < a32)) ^ ((int)a5 + 975))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

void sub_100012ACC()
{
  JUMPOUT(0x100011FC4);
}

uint64_t sub_100012AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, unsigned int a17, int a18)
{
  uint64_t v18;
  _BOOL4 v19;

  if (a17 < a16 != a18 - 719143351 < ((a5 + 1009) ^ 0xFAE3A309))
    v19 = a18 - 719143351 < ((a5 + 1009) ^ 0xFAE3A309);
  else
    v19 = a18 - 719143351 > a17;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * ((308 * !v19) ^ (a5 + 681))) - (a5 + 602) + 675))();
}

uint64_t sub_100012B80()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((17 * (v1 ^ 0x2AA)) ^ (v1 - 660))
                                          * (v0 - 633399559 < (v0 - 633399622))) ^ v1))
                            - 8))();
}

uint64_t sub_100012BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)(a7 + v8) = *(_BYTE *)(v12 + (v7 + v11))
                      - ((2 * *(_BYTE *)(v12 + (v7 + v11))) & 0xCF)
                      - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (((v8 == 63) * v10) ^ v9)) - 8))();
}

void sub_100012C24()
{
  JUMPOUT(0x100011FBCLL);
}

uint64_t sub_100012C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int8x16_t *a3@<X6>, int a4@<W8>)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;

  *a3 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v7 + (v4 + v5)), vandq_s8(vaddq_s8(*(int8x16_t *)(v7 + (v4 + v5)), *(int8x16_t *)(v7 + (v4 + v5))), v10)), v9);
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8 + 8 * (a4 + 960))
                                                           - ((a4 + v6) & 0x55BA503F)
                                                           + 7))(a1, a2, (v4 + 64));
}

uint64_t sub_100012CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15)
{
  int v15;
  uint64_t v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * (((((a15 - 83745474) & 0x4FDD87D) + 1071) * ((v15 & 0xFFFFFFFC) == 2014839312)) ^ a15))
                            - 12))();
}

uint64_t sub_100012D08@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X6>, int a5@<W8>)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(a4 + (a5 + a2)) = *(_BYTE *)(a3 + (v6 + a1));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v5 ^ (8 * (((v6 + v5 - 572 - 84) & 0xFFFFFFFC) != v7)))) - 12))();
}

uint64_t sub_100012D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t (*a29)(uint64_t))
{
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;

  v31 = 1755732067 * ((~((v30 - 168) | 0xBF7F5A4B) + ((v30 - 168) & 0xBF7F5A4B)) ^ 0x9E46186F);
  *(_QWORD *)(v30 - 168) = a27;
  *(_DWORD *)(v30 - 160) = v31 + v29 + 137;
  *(_DWORD *)(v30 - 156) = 1314192226 - v31;
  v32 = sub_100005D78(v30 - 168);
  return a29(v32);
}

uint64_t sub_100012DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 8 * (int)((63 * ((v5 - 1181884121) > 0x37)) ^ (v7 + 1290)))
                                                                                       - (v7 ^ 0x59)))(a1, a2, a3, a4, a5, 947);
}

uint64_t sub_100012E1C@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = v1;
  v5 = (a1 ^ 0x535u ^ (unint64_t)(v2 + 1516)) + v1;
  if (v5 <= 0x38)
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((38 * (v5 - v4 + 1181884121 >= ((a1 - 697) ^ 0x5DuLL))) ^ a1))
                            - 4))();
}

uint64_t sub_100012E80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(a10 + v12) = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((((v11 & 0xFFFFFFFFFFFFFFF8) == 8) * v13) ^ v10))
                            - ((v10 - 813) ^ a3)))();
}

uint64_t sub_100012EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  *v4 = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v6 == 0) * v7) ^ v3)) - (v5 ^ a3)))();
}

uint64_t sub_100012EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * (((((v7 ^ 0x31F) + 68) ^ 0x427 ^ (5 * (v7 ^ 0x31F))) * (v5 == v6)) ^ v7))
                                                                                       - 4))(a1, a2, a3, a4, a5, 947);
}

uint64_t sub_100012F30@<X0>(int a1@<W5>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  *(_BYTE *)(a2 + a3 + v4) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((unint64_t)(a3 + 1 + v4) < 0x38) * a1) ^ (v3 + 1291)))
                            - 12))();
}

void sub_100012F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12)
{
  int v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unint64_t v19;

  v12 = LOBYTE(STACK[0x2E4]) ^ 0xED;
  if (v12 == 1)
  {
    v16 = STACK[0x2C8];
    v17 = STACK[0x2C4];
    v18 = (LODWORD(STACK[0x2C8]) << (a12 & 0xFA ^ 0xF3)) ^ 0x58;
    LOBYTE(STACK[0x2BC]) = v18 - ((2 * v18) & 0xC0) - 25;
    LOBYTE(STACK[0x2BD]) = ((v16 >> 5) ^ 0xC4) - ((2 * ((v16 >> 5) ^ 0xC4)) & 0xCF) - 25;
    LOBYTE(STACK[0x2BE]) = ((v16 >> 13) ^ 0xF7) - ((2 * ((v16 >> 13) ^ 0xF7)) & 0xCF) - 25;
    LOBYTE(STACK[0x2BF]) = ((v16 >> 21) ^ 0x2F) - ((2 * ((v16 >> 21) ^ 0x2F)) & 0xCF) - 25;
    HIDWORD(v19) = v17 ^ 0x18;
    LODWORD(v19) = v16 ^ 0xC0000000;
    LOBYTE(STACK[0x2C0]) = (v19 >> 29) - ((2 * (v19 >> 29)) & 0xCF) - 25;
    LOBYTE(STACK[0x2C1]) = ((v17 >> 5) ^ 0x8B) - ((2 * ((v17 >> 5) ^ 0x8B)) & 0xCF) - 25;
    LOBYTE(STACK[0x2C2]) = ((v17 >> 13) ^ 0xCC) - ((2 * ((v17 >> 13) ^ 0xCC)) & 0xCF) - 25;
    v15 = ((v17 >> 21) ^ 0xFFFFFFA0) - 2 * (((v17 >> 21) ^ 0xFFFFFFA0) & 0x6F ^ (v17 >> 21) & 8) - 25;
  }
  else
  {
    if (v12 != 2)
      goto LABEL_6;
    v15 = STACK[0x2C4];
    v13 = STACK[0x2C8];
    LOBYTE(STACK[0x2BC]) = ((LODWORD(STACK[0x2C4]) >> 21) ^ 0xA0)
                         - ((((LODWORD(STACK[0x2C4]) >> 21) ^ 0xFFFFFFA0) << (((a5 + 11) | 0x90) + 17)) & 0xCE)
                         - 25;
    LOBYTE(STACK[0x2BD]) = ((v15 >> 13) ^ 0xCC) - ((2 * ((v15 >> 13) ^ 0xCC)) & 0xCF) - 25;
    LOBYTE(STACK[0x2BE]) = ((v15 >> 5) ^ 0x8B) - ((2 * ((v15 >> 5) ^ 0x8B)) & 0xCF) - 25;
    HIDWORD(v14) = v15 ^ 0x18;
    LODWORD(v14) = v13 ^ 0xC0000000;
    LOBYTE(STACK[0x2BF]) = (v14 >> 29) + (~(2 * (v14 >> 29)) | 0x31) - 24;
    LOBYTE(STACK[0x2C0]) = ((v13 >> 21) ^ 0x2F) - ((2 * ((v13 >> 21) ^ 0x2F)) & 0xCF) - 25;
    LOBYTE(STACK[0x2C1]) = ((v13 >> 13) ^ 0xF7) - ((2 * ((v13 >> 13) ^ 0xF7)) & 0xCF) - 25;
    LOBYTE(STACK[0x2C2]) = ((v13 >> 5) ^ 0xC4) - ((2 * ((v13 >> 5) ^ 0xC4)) & 0xCF) - 25;
    LOBYTE(v15) = ((8 * v13) ^ 0x58) + (~(2 * ((8 * v13) ^ 0x58)) | 0x3F) - 24;
  }
  LOBYTE(STACK[0x2C3]) = v15;
LABEL_6:
  JUMPOUT(0x100011FBCLL);
}

uint64_t sub_1000131E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;
  uint64_t v41;
  unint64_t v42;

  if (a33 == 2)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39
                                                                                   + 8
                                                                                   * ((1529
                                                                                     * (LODWORD(STACK[0x2E0]) != 62745804)) ^ (a5 + 387)))
                                                                       - ((236 * (a5 ^ 0x57u)) ^ 0x1D4)))(a1, a2, a3, 235795823);
  if (a33 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39
                                                                                   + 8
                                                                                   * (((LODWORD(STACK[0x2E0]) == 62745804)
                                                                                     * (((a5 - 77) | 0x1B4) - 344)) ^ (a5 + 359)))
                                                                       - 12))(a1, a2, a3, 235795823);
  v41 = (a5 + 655);
  v42 = ((2 * (_QWORD)&a39) & 0xF2DDF6BCF7F35E90)
      + ((unint64_t)&a39 ^ 0xF96EFB5E7BF9AF4FLL)
      + (v41 ^ 0x5FFFE5A5865EDC56);
  LOBYTE(STACK[0x2DF]) = ((v42 + ((a5 - 113) ^ 0x92) - 119) ^ 0xBA) * (v42 + 16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 + 8 * (int)v41) - 8))(a1, a2, a3, 235795823);
}

void sub_100013558()
{
  JUMPOUT(0x100013524);
}

uint64_t sub_100013564(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t *a20)
{
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  int v26;
  uint64_t v27;

  v24 = *a20;
  v25 = (_QWORD *)(v23 - 200);
  *v25 = 0xE7E7E7E7E7E7E7E7;
  v25[1] = 0xE7E7E7E7E7E7E7E7;
  v26 = ((((2 * (v23 - 168)) | 0xFBA80D6A) - (v23 - 168) + 36436299) ^ 0x69794FEC) * a4;
  v25[9] = v25;
  *(_DWORD *)(v23 - 160) = v26 + 1947394857;
  *(_DWORD *)(v23 - 132) = (v21 + 1699) ^ v26;
  v25[6] = &STACK[0x270];
  v25[7] = v24;
  v25[4] = v23 - 184;
  v27 = ((uint64_t (*)(uint64_t))*(&off_10005BF50 + v21 + 64))(v23 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20
                                                      + 8
                                                      * (((*(_DWORD *)(v23 - 136) == ((v21 - 33) ^ (v22 - 83)))
                                                        * ((v21 + 944) ^ 0x2CD)) ^ v21))
                                          - 4))(v27);
}

uint64_t sub_100013650()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 32) + v0 - 0x10351A5850350A30)
     - *(unsigned __int8 *)(v4 + v0 - 0x10351A5850350A30);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((131
                                          * (((v2 - 727454673) & 0x2B5C0FFF ^ 0x7EFF4EAA ^ v5)
                                           - 336333322
                                           + ((2 * v5) & 0xFDFE9DFE) == 1794327797)) ^ v2))
                            - 12))();
}

uint64_t sub_1000136E0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((63
                                          * ((((5 * ((v2 - 13) ^ 0x408) - 79) ^ (((v0 + 1) & 0x7FFFFFFFFFFFFFF0) == v1)) & 1) == 0)) ^ (v2 - 13)))
                            - 12))();
}

uint64_t sub_100013730@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 1759421093
     * ((((v3 - 168) | 0x60E2BDCEF914AA9ELL) - (v3 - 168) + ((v3 - 168) & 0x9F1D423106EB5560)) ^ 0x4E5C7C9E4A691ACALL);
  v5 = v3 - 200;
  *(_QWORD *)(v5 + 40) = v4 + 1794327797;
  *(_QWORD *)(v5 + 56) = v1 - v4;
  *(_DWORD *)(v3 - 136) = v4 ^ (a1 + 2072422627) ^ 0x76;
  *(_DWORD *)(v3 - 168) = v4 + a1 - 1689051587;
  *(_DWORD *)(v3 - 164) = a1 + 2072422627 - v4;
  *(_DWORD *)(v3 - 152) = (a1 + 2072422629) ^ v4;
  *(_DWORD *)(v3 - 148) = v4;
  v6 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF50 + a1 + 73) - 8))(v3 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * *(int *)(v3 - 132)) - 4))(v6);
}

void sub_100013820()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 8) = 2017444214;
}

void sub_10001386C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1374699841 * ((-2 - ((a1 | 0xA88133EE) + (~(_DWORD)a1 | 0x577ECC11))) ^ 0x3A8AD418));
  __asm { BR              X8 }
}

uint64_t sub_100013914()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  _BOOL4 v4;

  v3 = (v0 + 92007510) & 0xFA841645;
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (int)(v3 - 1378)))(200, 2354554103) != 0;
  return (*(uint64_t (**)(void))(v2 + 8 * (int)((2 * v4) | (8 * v4) | v3)))();
}

uint64_t sub_100013968(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 8 * ((v6 ^ 0x5EC) - 811)))(a1, 0);
  if ((_DWORD)result == 16)
  {
    v5 = 656735282;
    goto LABEL_7;
  }
  if ((_DWORD)result == 12)
  {
LABEL_7:
    result = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v2 ^ 0x3B2)))(a1);
    goto LABEL_8;
  }
  if ((_DWORD)result)
  {
    v5 = -1176472839;
    goto LABEL_7;
  }
  *v4 = a1;
  v5 = 1142529847;
LABEL_8:
  *(_DWORD *)(v1 + 4) = 394368265 * v5 - 2051578863;
  return result;
}

void sub_100013A00(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)a1 - 628203409 * ((a1 & 0x7EE22050 | ~(a1 | 0x7EE22050)) ^ 0x395D39C);
  v2 = *(_QWORD *)(a1 + 8);
  ((void (*)(char *, void (*)()))*(&off_10005BF50 + (v1 ^ 0x227)))((char *)*(&off_10005BF50 + (int)(v1 & 0xE3D550CB)) - 8, sub_1000461E4);
  __asm { BR              X11 }
}

uint64_t sub_100013AC0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((127
                                * (((a1 ^ (*(_QWORD *)(*(_QWORD *)(v2 + 8 * (a1 ^ 0x269)) - 4) == 0)) & 1) == 0)) ^ a1)))();
}

uint64_t sub_100013AFC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 - 549)))(v1);
}

uint64_t sub_100013B28(_DWORD *a1)
{
  unsigned int v2;
  int v3;
  int v4;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;
  _DWORD v8[2];

  v2 = 1224239923
     * (((a1 ^ 0x84C2A454) & 0x3874D31 | ~(a1 ^ 0x84C2A454 | 0x3874D31)) ^ 0x8A09EB4D);
  v3 = a1[2] ^ v2;
  v4 = a1[6] ^ v2;
  v8[1] = (235795823
         * (((v8 | 0xFA820D6C) - v8 + (v8 & 0x57DF290)) ^ 0x6E2F4435)) ^ (v3 - 1404134225);
  result = nullsub_1(v8);
  if (v4 > 1251668096)
  {
    if (v4 == 1536880768)
    {
      v6 = 3;
    }
    else
    {
      if (v4 != 1251668097)
        goto LABEL_11;
      v6 = 1;
    }
LABEL_10:
    v7 = *((_QWORD *)*(&off_10005BF50 + v3 - 1172345222)
         + ((1611
           * (((uint64_t (*)(_QWORD, uint64_t))*(&off_10005BF50 + v3 - 1172345209))((*((_DWORD *)*(&off_10005BF50 + (v3 ^ 0x45E09273)) + 6 * v6 + 2) - 1991213896), 3511634213) != 0)) ^ (v3 - 1172345298)))- (((v3 - 1172344081) | 0x80u) ^ 0x5CELL);
    __asm { BR              X9 }
  }
  if (v4 == 1251668093)
  {
    v6 = 0;
    goto LABEL_10;
  }
  if (v4 == 1251668096)
  {
    v6 = 2;
    goto LABEL_10;
  }
LABEL_11:
  a1[3] = -2017420598;
  return result;
}

void sub_100014164(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X11 }
}

uint64_t sub_100014274()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((52
                                          * (((v0 << ((v1 + 27) ^ 0xE5)) & 0xDBFB7F46 ^ 0x52BB4540)
                                           + (v0 ^ 0xD4A25D07)
                                           - 80285350 != 1765060861)) ^ v1))
                            - 12))();
}

uint64_t sub_100014300(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((((v2 - 96) | 0x50) + 634) ^ (v2 + 1640738519) & 0x9E34575D)
                                     * ((a2 + v3 - 1845346211) > 7)) ^ v2)))();
}

uint64_t sub_100014380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = v7 + a6 - 16 < (((v6 - 6) | 1) ^ 0xFFFFF818) + 23 * (v6 ^ 0x9B);
  return (*(uint64_t (**)(void))(v8 + 8 * (((16 * v9) | (32 * v9)) ^ v6)))();
}

uint64_t sub_1000143CC@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  unint64_t v17;
  int v19;

  v10 = (a1 + v7 + v8) + a3;
  v11 = ((_BYTE)a1 + (_BYTE)v7 + (_BYTE)v8) & 0xF;
  v12 = v11 - v10 + v6;
  v13 = (v4 | v11) - v10;
  v14 = (v5 | v11) - v10;
  v16 = v12 >= 0x10
     && v3 - a3 >= (unint64_t)((a2 + 1410479790) & 0xABEDCF9B) - 1801
     && (unint64_t)(v13 + 3) >= 0x10;
  v17 = v14 + 1;
  v19 = !v16 || v17 < ((a2 + 2025081006) & 0x874BB7FA ^ 0x168uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((57 * v19) ^ a2)) - 8))();
}

uint64_t sub_100014470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, _QWORD);

  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5 + 8 * ((879 * (v3 > 0xF)) ^ v4))
                                                                 - 4);
  *(_DWORD *)(v6 - 136) = v3;
  return v7(a1, a2, a3, 0);
}

uint64_t sub_1000144A4@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  int8x16_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  int8x16x4_t v51;
  int8x16x4_t v52;

  v51.val[1].i64[0] = ((_BYTE)a2 + 12) & 0xF;
  v51.val[1].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  v51.val[2].i64[0] = ((_BYTE)a2 + 10) & 0xF;
  v51.val[2].i64[1] = ((_BYTE)a2 + 9) & 0xF;
  v51.val[3].i64[0] = ((_BYTE)a2 + 8) & 0xF;
  v51.val[3].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v52.val[0].i64[0] = ((_BYTE)a2 + 6) & 0xF;
  v52.val[0].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v44 = a1 + v42 + v43;
  v52.val[1].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v52.val[1].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v52.val[2].i64[0] = (a2 + 2) & 0xF;
  v52.val[2].i64[1] = ((_BYTE)a2 + 1) & 0xF;
  v52.val[3].i64[0] = a2 & 0xF;
  v52.val[3].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v45.i64[0] = 0x2121212121212121;
  v45.i64[1] = 0x2121212121212121;
  v46.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v46.i64[1] = 0xE7E7E7E7E7E7E7E7;
  v51.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v42 + (_BYTE)v43) & 0xF;
  v51.val[0].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  v47.i64[0] = vqtbl4q_s8(v51, (int8x16_t)xmmword_100047720).u64[0];
  v47.i64[1] = vqtbl4q_s8(v52, (int8x16_t)xmmword_100047720).u64[0];
  v48 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v36 - 15 + v44), *(int8x16_t *)(v39 + v51.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v51.val[0].i64[0] + v37 - 12), *(int8x16_t *)(v51.val[0].i64[0] + v38 - 14))));
  v49 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v48, v48, 8uLL), v46), vmulq_s8(v47, v45)));
  *(int8x16_t *)(a3 - 15 + v44) = vextq_s8(v49, v49, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(a36
                                        + 8 * ((((v40 & 0xFFFFFFF0) == 16) * ((v41 + 443) ^ 0x6D0)) ^ (v41 + 443)))
                            - 8))();
}

void sub_100014618()
{
  JUMPOUT(0x100014598);
}

uint64_t sub_100014624()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((v0 - 560) ^ 0x4EF) - 1184898402 == v1)
                                          * ((214 * ((v0 - 560) ^ 0x4EF)) ^ 0x4EA)) ^ (v0 - 560)))
                            - 8))();
}

uint64_t sub_100014684@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  *(_BYTE *)(a1 + (v6 - 1693688386)) = *(_BYTE *)(*(_QWORD *)(v8 + 8 * (v3 ^ 0x5D2))
                                                              + (((_BYTE)v6 - 66) & 0xF)) ^ *(_BYTE *)(v1 + (v6 - 1693688386)) ^ (3 * (v3 ^ 0x65) - 29) ^ (97 * ((v6 - 66) & 0xF)) ^ *(_BYTE *)(*(_QWORD *)(v8 + 8 * (v3 ^ 0x5CF)) + ((v6 - 1693688386) & 0xFLL) - 12) ^ *(_BYTE *)(*(_QWORD *)(v8 + 8 * (v3 - 1249)) + (((_BYTE)v6 - 66) & 0xF) - 12);
  v9 = v4 > 0x6C26CDDC;
  if (v9 == v6 + 786796514 < v2)
    v9 = v6 + 786796514 < v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((898 * v9) ^ v3)) - 12))();
}

uint64_t sub_100014750(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  uint64_t v11;
  uint64_t v12;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11
                                                      + 8
                                                      * ((((v10 - 1854182690) & 0x6E8493FD ^ ((v10 ^ 0x798) - 905))
                                                        * (*(_DWORD *)(v12 - 136) == a4)) | v10))
                                          - 4))(a10);
}

uint64_t sub_10001479C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                                         + 8
                                                                                         * ((157
                                                                                           * ((((a7 + 563) ^ 0x3A3) & v7) == 0)) ^ a7))
                                                                             - ((a7 - 104) | 0x609)
                                                                             + 1813))(a1, a2, a3, a4, (a3 - a4));
}

uint64_t sub_1000147DC@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  unsigned int v46;
  int v47;
  int v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  int8x16x4_t v54;

  v46 = ((v43 - 18) ^ 0xFFFFFC61) & v41;
  *(_QWORD *)(v45 - 120) = v36 - 7;
  *(_QWORD *)(v45 - 128) = a3 - 7;
  v47 = -a2;
  *(_DWORD *)(v45 - 144) = v46;
  v48 = a1 + v42;
  v49 = a1 + v42 + v43 + v37;
  v50 = v37 + v48;
  v51 = v37 + v48 - 84;
  *(_DWORD *)(v45 - 152) = v43 - 711;
  v52 = (v47 + v48 + v44);
  v54.val[0].i64[0] = v52 & 0xF;
  v54.val[0].i64[1] = ((_BYTE)v47 + v50 - 79) & 0xF;
  v54.val[1].i64[0] = ((_BYTE)v47 + v50 - 80) & 0xF;
  v54.val[1].i64[1] = ((_BYTE)v47 + v50 - 81) & 0xF;
  v54.val[2].i64[0] = ((_BYTE)v47 + v50 - 82) & 0xF;
  v54.val[2].i64[1] = ((_BYTE)v47 + v50 - 83) & 0xF;
  v54.val[3].i64[0] = ((_BYTE)v47 + v51) & 0xF;
  v54.val[3].i64[1] = ((_BYTE)v47 + v49) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v45 - 128) + v52) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(*(_QWORD *)(v45 - 120) + v52), *(int8x8_t *)(v40 + v54.val[0].i64[0] - 7)), veor_s8(*(int8x8_t *)(v54.val[0].i64[0] + v38 - 4), *(int8x8_t *)(v54.val[0].i64[0] + v39 - 6)))), (int8x8_t)0xE7E7E7E7E7E7E7E7), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v54, (int8x16_t)xmmword_100047730), (int8x8_t)0x2121212121212121)));
  return (*(uint64_t (**)(__n128))(a36 + 8 * ((50 * (v47 != 8 - v46)) ^ (v43 - 18))))((__n128)xmmword_100047730);
}

void sub_10001492C()
{
  JUMPOUT(0x100014858);
}

uint64_t sub_100014954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return (*(uint64_t (**)(uint64_t))(v10
                                            + 8
                                            * (((((*(_DWORD *)(v11 - 152) ^ 0x7FD) - 533) ^ 0x95)
                                              * (*(_DWORD *)(v11 - 136) == *(_DWORD *)(v11 - 144))) ^ *(_DWORD *)(v11 - 152))))(a10);
}

uint64_t sub_100014998@<X0>(int a1@<W4>, int a2@<W7>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = (a1 - 1765061794);
  *(_BYTE *)(a3 + v9) = *(_BYTE *)(v3 + v9) ^ *(_BYTE *)(v7 + (v9 & 0xF)) ^ *(_BYTE *)((v9 & 0xF) + v5 + 3) ^ *(_BYTE *)((v9 & 0xF) + v6 + 1) ^ (v9 & 0xF | (32 * (v9 & 0xF))) ^ 0xE7;
  return (*(uint64_t (**)(void))(v8 + 8 * ((1433 * (a1 - 1 == (((a2 - 1561) | 0x404) ^ v4))) ^ (a2 - 1581))))();
}

uint64_t sub_100014A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  int v39;

  v37 = *(_QWORD *)(a1 + 24);
  *(int8x16_t *)(v36 - 112) = veorq_s8(*(int8x16_t *)*(_QWORD *)(a1 + 40), (int8x16_t)xmmword_100047740);
  if (a9)
    v38 = v37 == 0x621D43C813E50582;
  else
    v38 = 1;
  v39 = !v38;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 + 8 * (int)((v39 | (v39 << 7)) ^ a6)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_100014A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,int a43)
{
  int v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  _BOOL4 v48;

  v45 = HIDWORD(a11) - ((2 * HIDWORD(a11) + 400177614) & 0x5CFE5C10) - 1167308049;
  v46 = ((2 * v45) & 0xBF79BF5C ^ a43 ^ 0x1C781952) + (v45 ^ 0x71C3F1A6);
  v48 = (((_BYTE)v46 + (_BYTE)v43 - 102 - 64) & 0xF) != ((29 * (v43 ^ 0x588)) ^ 0x3A0) || v46 == 1606213550;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 + 8 * (v43 ^ (2 * v48))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_100014B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,int a45)
{
  uint64_t v45;

  return (*(uint64_t (**)(void))(v45
                              + 8
                              * ((54
                                * (((((a45 + 471) ^ 0x6A9) + 689387824) ^ (a13 - ((2 * a10) & 0xEC51AA3C) - 2112491003))
                                 + 1878875888
                                 + ((2 * (a13 - ((2 * a10) & 0xEC51AA3C) - 2112491003)) & 0xBE7FDFFC ^ 0xAC518A3C) != 1329417966)) ^ a45)))();
}

uint64_t sub_100014BE8(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v1 ^ (109 * ((v2 + a1 + 549457922) < 8))))
                            - (((v1 + 1385) - 1282) ^ v1 ^ 0x3AFu)))();
}

uint64_t sub_100014C54(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v6
                                                      + 8
                                                      * ((1882
                                                        * (a5 + ((v5 + 1274) ^ (a2 - 1817)) > 0xFFFFFFEF)) ^ v5))
                                          - 4))(a1);
}

uint64_t sub_100014C8C@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v21;
  int v23;
  int v25;

  v10 = (v8 + a1 + a2);
  v11 = v10 + a4 + 1;
  v12 = ((_BYTE)v8 + (_BYTE)a1 + (_BYTE)a2) & 0xF;
  v13 = v4 + v12 - v10;
  v14 = v4 + (a3 ^ 0x718) + v12;
  v15 = v5 + ((v7 - 195891746) & 0xBAD11FE ^ 0x1FELL) + v12 - v10;
  v16 = v12 + v5 + 3;
  v17 = v12 + v6;
  v18 = v17 - v10 + 4;
  v19 = v17 + 5;
  v21 = v13 < v11 && v14 > a4;
  v23 = v16 > a4 && v15 < v11 || v21;
  if (v19 <= a4 || v18 >= v11)
    v25 = v23;
  else
    v25 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((1081 * (v25 ^ 1)) ^ v7)) - 4))();
}

uint64_t sub_100014D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v9
                                                                       + 8
                                                                       * ((681
                                                                         * (((v8 < 0x10) ^ (((a8 + 3) & 0xCB) - 6)) & 1)) ^ a8))
                                                           - 4))(a1, a2, 0);
}

uint64_t sub_100014D84@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  int8x16_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  v17.val[1].i64[0] = ((_BYTE)v7 - 1) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)v7 + 14) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)v7 + 13) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)v7 + 12) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)v7 + 11) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)v7 + 10) & 0xF;
  v11 = a1 + v9 + a2;
  v12.i64[0] = 0x7777777777777777;
  v12.i64[1] = 0x7777777777777777;
  v13 = (((a3 - 309) | 8) - 137) & v11;
  v17.val[0].i64[0] = v13;
  v17.val[0].i64[1] = v7 & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_100047720).u64[0];
  v18.val[0].i64[1] = ((_BYTE)v7 + 8) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)v7 + 6) & 0xF;
  v18.val[2].i64[1] = (v7 + 4) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v7 + 2) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)v7 + 9) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)v7 + 7) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)v7 + 5) & 0xF;
  v18.val[3].i64[0] = (v7 + 3) & 0xF;
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_100047720).u64[0];
  v15 = vrev64q_s8(vmulq_s8(v14, v12));
  *(int8x16_t *)(a4 - 15 + v11) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v4 + v13 - 15), *(int8x16_t *)(a4 - 15 + v11)), veorq_s8(*(int8x16_t *)(v13 + v5 - 13), *(int8x16_t *)(v13 + v6 - 11))), vextq_s8(v15, v15, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((1086 * ((v8 & 0xFFFFFFF0) == 16)) ^ a3)) - 8))();
}

void sub_100014ED8()
{
  JUMPOUT(0x100014E58);
}

uint64_t sub_100014EE4@<X0>(unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  int v34;
  uint64_t v35;
  unsigned __int8 *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  unsigned __int8 v51;
  unsigned __int8 v52;
  unsigned __int8 v53;
  int v54;
  unsigned __int8 v55;
  int v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  int v99;
  int v100;
  uint64_t v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  unsigned int v115;
  unsigned int v116;
  char *v117;
  int v118;
  int v119;
  int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  int v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  unsigned int v139;
  int v140;
  int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  int v153;
  int v154;
  int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  int v160;
  unsigned int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  unsigned int v173;
  int v174;
  unsigned int v175;
  int v176;
  unsigned int v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  int v184;
  uint64_t v185;
  int v186;
  int v187;
  uint64_t v188;
  int v189;
  uint64_t v190;
  int v191;
  char *v192;
  uint64_t v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  char *v197;
  uint64_t v198;
  char *v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  unint64_t v219;
  unint64_t v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  uint64_t v224;
  int v225;
  int v226;
  unsigned int v227;
  unsigned int v228;
  int v229;
  unsigned int v230;
  unsigned int v231;
  int v232;
  int v233;
  unsigned int v234;

  v40 = v34 ^ 0x4B9;
  v41 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x3AA));
  v42 = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50581) ^ 0x85));
  HIDWORD(v43) = v42 ^ 0x3D;
  LODWORD(v43) = (v42 ^ 0x80) << 24;
  v44 = *(unsigned __int8 *)(v35 - 0x621D43C813E50577);
  *(_DWORD *)(v38 - 128) = v37;
  v45 = *(_QWORD *)(v39 + 8 * (v34 - 743)) - 4;
  v46 = (v43 >> 30) ^ 0x9F;
  HIDWORD(v43) = *(unsigned __int8 *)(v45 + (v44 ^ 0xBF));
  LODWORD(v43) = (HIDWORD(v43) ^ 0x55555555) << 24;
  LOBYTE(v44) = v43 >> 28;
  v47 = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x621D43C813E5057DLL) ^ 0x6FLL));
  HIDWORD(v43) = v47 ^ 0x3D;
  LODWORD(v43) = (v47 ^ 0x80) << 24;
  v48 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x335));
  v49 = v44 | ((*(unsigned __int8 *)(v48 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50578) ^ 0xB7)) ^ 0x98) << 8);
  v50 = *(_QWORD *)(v39 + 8 * (v34 - 839)) - 12;
  v51 = *(_BYTE *)(v50 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50576) ^ 0xD8));
  LODWORD(v44) = (((v43 >> 30) ^ 0x68) << 16) | ((*(unsigned __int8 *)(v48
                                                                                      + (*(unsigned __int8 *)(v35 - 0x621D43C813E5057CLL) ^ 0xDFLL)) ^ 0xB9) << 8);
  HIDWORD(v43) = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50573) ^ 0xBCLL));
  LODWORD(v43) = (HIDWORD(v43) ^ 0x55555555) << 24;
  v52 = v43 >> 28;
  HIDWORD(v43) = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x621D43C813E5057BLL) ^ 0x98));
  LODWORD(v43) = (HIDWORD(v43) ^ 0x55555555) << 24;
  v53 = v43 >> 28;
  v54 = v44 | ((*(unsigned __int8 *)(v50 + (*(unsigned __int8 *)(v35 - 0x621D43C813E5057ELL) ^ 0xAFLL)) ^ 0x40) << 24);
  LODWORD(v44) = (v46 << ((v34 ^ 0xB9) - 9)) | ((*(unsigned __int8 *)(v48
                                                                    + (*(unsigned __int8 *)(v35 - 0x621D43C813E50580) ^ 0x49)) ^ 0x33) << 8) | ((*(unsigned __int8 *)(v50 + (*v36 ^ 0xFELL)) ^ 0x99999999) << 24);
  HIDWORD(v43) = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x621D43C813E5057FLL) ^ 0xD0));
  LODWORD(v43) = (HIDWORD(v43) ^ 0x55555555) << 24;
  LODWORD(v45) = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50575) ^ 0xB6));
  v55 = (v43 >> 28) ^ 0x3C;
  HIDWORD(v43) = v45 ^ 0x3D;
  LODWORD(v43) = (v45 ^ 0x80) << 24;
  v56 = v44 | v55;
  v57 = (v43 >> 30) ^ 0x21;
  LODWORD(v45) = ((((*(unsigned __int8 *)(v48 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50574) ^ 0xC7)) ^ 0x78) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v51 ^ 0x90u) << 24) | (v57 << 16)) >> 8) ^ 0x75F49E;
  LODWORD(v41) = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50579) ^ 0xC8));
  HIDWORD(v43) = v41 ^ 0x3D;
  LODWORD(v43) = (v41 ^ 0x80) << 24;
  v58 = *(unsigned __int8 *)(v50 + (*(unsigned __int8 *)(v35 - 0x621D43C813E5057ALL) ^ 0x18));
  v59 = (((*(unsigned __int8 *)(v48 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50574) ^ 0xC7)) ^ 0x78) << 8) & 0xFFFF00 | ((v51 ^ 0x90) << 24) | ((_DWORD)v57 << 16) | v52 ^ 0x68) ^ 0x54ACE48E;
  LODWORD(v41) = *(_BYTE *)(v48 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50574) ^ 0xC7)) ^ 0xE6;
  v60 = *(unsigned __int8 *)(v48 + (*(unsigned __int8 *)(v35 - 0x621D43C813E50574) ^ 0xC7)) ^ 0x13;
  v61 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x3EF)) - 8;
  v62 = v49 & 0xFF00FFFF | (((v43 >> 30) ^ 0x37) << 16) | ((v58 ^ 0xFFFFFFDF) << 24);
  LODWORD(v60) = (v41 - ((2 * v45) & 0x1CA) - 1136390171) ^ *(_DWORD *)(v61 + 4 * v60);
  v63 = *(_QWORD *)(v39 + 8 * (v34 - 842)) - 8;
  v64 = *(_DWORD *)(v63 + 4 * (v51 ^ 0x8Fu));
  HIDWORD(v43) = ~v64;
  LODWORD(v43) = v64 ^ 0x96B57D98;
  v65 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x328)) - 8;
  LODWORD(v57) = (v43 >> 2) ^ *(_DWORD *)(v65 + 4 * (v57 ^ 0xDD)) ^ (v60
                                                                                   - ((2 * v60) & 0x52163352)
                                                                                   - 1458890327);
  LOBYTE(v60) = v52 ^ 0xD9;
  v66 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x3E3)) - 4;
  LODWORD(v41) = v56 ^ *(_DWORD *)(v66 + 4 * v60) ^ 0xC20FD31C ^ (v57
                                                                                   - ((2 * v57) & 0x94126892)
                                                                                   - 905366455);
  v233 = v56;
  v234 = v54 & 0xFFFFFF00 | v53;
  LODWORD(v57) = v234 - 2 * ((v54 & 0x420FD300 | v53 & 0x1E) ^ v53 & 2) - 1039150308;
  v231 = v62;
  v232 = v59;
  v229 = v57 ^ 0x2789BBD4 ^ v41;
  v67 = v62 ^ 0x9C2022FB ^ v229;
  v68 = *(_DWORD *)(v63 + 4 * (((v67 ^ v59) >> 24) ^ 0x9C));
  HIDWORD(v43) = ~v68;
  LODWORD(v43) = v68 ^ 0x96B57D98;
  v69 = ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x94126892) - 905366455) ^ *(_DWORD *)(v66
                                                                               + 4
                                                                               * ((v67 ^ v59) ^ 0xB9u));
  v70 = (v67 ^ v59) >> 8;
  v71 = v67 ^ v59 ^ 0x9BBEE250;
  LODWORD(v60) = *(_DWORD *)(v61 + 4 * (v70 ^ 0x46u)) ^ *(_DWORD *)(v65
                                                                                     + 4
                                                                                     * (((v67 ^ v59) >> 16) ^ 0xF7u)) ^ ((v70 ^ 0xB3) - 2 * ((v70 ^ 0xF6DEB3) & 0xED ^ v70 & 8) - 1136390171) ^ (v69 - ((2 * v69) & 0x52163352) - 1458890327);
  LODWORD(v60) = v60 - 1039150308 + (~(2 * v60) | 0x7BE059C7) + 1;
  v72 = v57 ^ 0x86095FBD ^ v60;
  v227 = v71;
  v228 = v67;
  v73 = v72 ^ v67;
  LODWORD(v57) = *(_DWORD *)(v63 + 4 * (((v73 ^ v71) >> 24) ^ 0xE8));
  HIDWORD(v43) = ~(_DWORD)v57;
  LODWORD(v43) = v57 ^ 0x96B57D98;
  v74 = v73 ^ v71 ^ 0x824D1FB3;
  LODWORD(v57) = *(_DWORD *)(v61 + 4 * (BYTE1(v74) ^ 0xF5u)) ^ *(_DWORD *)(v65
                                                                           + 4
                                                                           * (((v73 ^ v71) >> 16) ^ 0x64u)) ^ (BYTE1(v74) - ((v74 >> 7) & 0x1CA) - 1136390171) ^ ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x52163352) - 1458890327);
  v230 = v41;
  HIDWORD(v224) = v60 ^ v41;
  v225 = v73 ^ v71;
  LODWORD(v41) = v60 ^ v41 ^ *(_DWORD *)(v66 + 4 * ((v73 ^ v71) ^ 0xF6u)) ^ (v57
                                                                                              - ((2 * v57) & 0x94126892)
                                                                                              - 905366455);
  v226 = v73;
  v75 = ((v41 ^ 0x516EF336) - ((2 * (v41 ^ 0x516EF336)) & 0xE1DC2EBE) - 252831905) ^ v72;
  v76 = v75 ^ 0x8EDEEA78 ^ v73;
  LODWORD(v60) = *(_DWORD *)(v63 + 4 * (((v76 ^ v74) >> 24) ^ 0xB));
  HIDWORD(v43) = ~(_DWORD)v60;
  LODWORD(v43) = v60 ^ 0x96B57D98;
  LODWORD(v60) = (v43 >> 2) ^ *(_DWORD *)(v61 + 4 * (((unsigned __int16)(v76 ^ v74) >> 8) ^ 0xA2u)) ^ ((((unsigned __int16)(v76 ^ v74) >> 8) ^ 0x57) - ((2 * (((v76 ^ v74) >> 8) ^ 0x614557)) & 0x1CA) - 1136390171);
  LODWORD(v60) = (v60 - ((2 * v60) & 0x94126892) - 905366455) ^ *(_DWORD *)(v66
                                                                          + 4 * ((v76 ^ v74) ^ 0xA3u));
  LODWORD(v224) = v41;
  LODWORD(v60) = v41 ^ *(_DWORD *)(v65 + 4 * (((v76 ^ v74) >> 16) ^ 0x6Cu)) ^ (v60
                                                                                                - ((2 * v60) & 0x52163352)
                                                                                                - 1458890327);
  LODWORD(v222) = v60 ^ 0x704D3285;
  HIDWORD(v222) = v76 ^ v74;
  LODWORD(v41) = v60 ^ 0x704D3285 ^ ((v75 ^ 0x8EDEEA78) - 2 * ((v75 ^ 0x8EDEEA78) & 0x2123C1B7 ^ v75 & 4) + 555991475);
  v223 = __PAIR64__(v75, v76);
  LODWORD(v57) = v76 ^ 0x323F8F75;
  LODWORD(v221) = v41 ^ 0x307C325C ^ v76 ^ 0x323F8F75;
  HIDWORD(v221) = v41;
  v77 = v221 ^ v76 ^ v74;
  v78 = *(_DWORD *)(v63 + 4 * (HIBYTE(v77) ^ 0xC8));
  HIDWORD(v43) = ~v78;
  LODWORD(v43) = v78 ^ 0x96B57D98;
  v79 = ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x94126892) - 905366455) ^ *(_DWORD *)(v66
                                                                               + 4 * (v77 ^ 0x5Au));
  LODWORD(v60) = *(_DWORD *)(v61 + 4 * (((unsigned __int16)(v77 ^ 0x4E1F) >> 8) ^ 0xF5u)) ^ *(_DWORD *)(v65 + 4 * (BYTE2(v77) ^ 4u)) ^ v60 ^ (((unsigned __int16)(v77 ^ 0x4E1F) >> 8) - (((v77 ^ 0xA22D4E1F) >> 7) & 0x1CA) - 1136390171) ^ (v79 - ((2 * v79) & 0x52163352) - 1458890327);
  v80 = v60 ^ 0xE899B972;
  v81 = v60 ^ v57;
  v82 = v60 ^ v57 ^ v77 ^ 0xA22D4E1F;
  LODWORD(v60) = *(_DWORD *)(v63 + 4 * (HIBYTE(v82) ^ 0x21));
  HIDWORD(v43) = ~(_DWORD)v60;
  LODWORD(v43) = v60 ^ 0x96B57D98;
  LODWORD(v57) = ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x52163352) - 1458890327) ^ *(_DWORD *)(v65
                                                                                         + 4 * (BYTE2(v82) ^ 0xCEu));
  LODWORD(v57) = (v57 - ((2 * v57) & 0x94126892) - 905366455) ^ *(_DWORD *)(v66 + 4 * (v82 ^ 0xA7u));
  v219 = __PAIR64__(v81, v82);
  v83 = ((unsigned __int16)(v82 ^ 0x48E2) >> 8);
  LODWORD(v57) = (v57 - ((2 * v57) & 0x78881FCA) - 1136390171) ^ *(_DWORD *)(v61 + 4 * (v83 ^ 0xF5u));
  LODWORD(v57) = v80 ^ v83 ^ (v57 - ((2 * v57) & 0x73EE9488) - 1174975932);
  v220 = __PAIR64__(v77, v80);
  HIDWORD(v218) = v80 ^ ((v41 ^ 0x307C325C) - 1174975932 + (~(2 * (v41 ^ 0x307C325C)) | 0x8C116B77) + 1);
  LODWORD(v218) = v57 ^ 0x8A8A5D94;
  HIDWORD(v217) = v57 ^ 0x8A8A5D94 ^ (HIDWORD(v218) - 1970643564 + (~(2 * HIDWORD(v218)) | 0xEAEB44D7) + 1);
  v84 = HIDWORD(v217) ^ 0xE6F58988 ^ v81;
  v85 = v84 ^ v82 ^ 0x4BE748E2;
  LODWORD(v60) = *(_DWORD *)(v63 + 4 * (HIBYTE(v85) ^ 0x12));
  HIDWORD(v43) = ~(_DWORD)v60;
  LODWORD(v43) = v60 ^ 0x96B57D98;
  LODWORD(v217) = v85;
  LODWORD(v60) = *(_DWORD *)(v61 + 4 * (((unsigned __int16)(v85 ^ 0x8988) >> 8) ^ 0xF5u)) ^ *(_DWORD *)(v65 + 4 * (BYTE2(v85) ^ 0xDCu)) ^ (((unsigned __int16)(v85 ^ 0x8988) >> 8) - (((v85 ^ 0x78F58988) >> 7) & 0x1CA) - 1136390171) ^ ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x52163352) - 1458890327);
  v86 = *(_DWORD *)(v66 + 4 * ((v84 ^ v82 ^ 0xE2) ^ 0xCDu)) ^ v57 ^ 0xE4A4A473 ^ (v60 - ((2 * v60) & 0x94126892) - 905366455);
  v87 = v86 ^ ((HIDWORD(v217) ^ 0xE6F58988) - ((2 * (HIDWORD(v217) ^ 0xE6F58988)) & 0xC94948E6) - 458972045);
  LODWORD(v57) = v87 ^ 0x5BF36347;
  HIDWORD(v215) = v87;
  HIDWORD(v216) = v84 ^ 0xE1B7BB43;
  LODWORD(v41) = ((v87 ^ 0x5BF36347) - 2 * ((v87 ^ 0x5BF36347) & 0x30D9487D ^ v87 & 8) - 1327937419) ^ v84 ^ 0xE1B7BB43;
  v88 = v41 ^ v85 ^ 0x78F58988;
  LODWORD(v60) = ((((unsigned __int16)(v41 ^ v85 ^ 0x8988) >> 8) ^ 0xBB)
                - 1136390171
                + (~(2 * ((v88 >> 8) ^ 0x1A89BB)) | 0xFFFFFE35)
                + 1) ^ *(_DWORD *)(v61 + 4 * (((unsigned __int16)(v41 ^ v85 ^ 0x8988) >> 8) ^ 0x4Eu));
  LODWORD(v60) = (v60 - ((2 * v60) & 0x94126892) - 905366455) ^ *(_DWORD *)(v66
                                                                          + 4
                                                                          * ((((v87 ^ 0x47)
                                                                                              - 2
                                                                                              * ((v87 ^ 0x47) & 0x7D ^ v87 & 8)
                                                                                              + 117) ^ v84 ^ 0x43 ^ v85 ^ 0x88) ^ 0x91u));
  v89 = *(_DWORD *)(v63 + 4 * (HIBYTE(v88) ^ 0x70));
  HIDWORD(v43) = ~v89;
  LODWORD(v43) = v89 ^ 0x96B57D98;
  LODWORD(v60) = (v43 >> 2) ^ *(_DWORD *)(v65 + 4 * (BYTE2(v88) ^ 0xA0u)) ^ (v60
                                                                             - ((2 * v60) & 0x52163352)
                                                                             - 1458890327);
  LODWORD(v216) = v86;
  LODWORD(v214) = (v60 - ((2 * v60) & 0xC94948E6) - 458972045) ^ v86;
  HIDWORD(v214) = v88;
  HIDWORD(v213) = v214 ^ 0x930000ED ^ v57;
  LODWORD(v213) = v41 ^ 0x2608AF3A ^ ((HIDWORD(v213) ^ 0x8D06EA22)
                                    - 2 * ((HIDWORD(v213) ^ 0x8D06EA22) & 0x14D7FDD ^ BYTE4(v213) & 0x18)
                                    + 21856197);
  v90 = *(_DWORD *)(v63 + 4 * (((v213 ^ v88) >> 24) ^ 0x23));
  HIDWORD(v43) = ~v90;
  LODWORD(v43) = v90 ^ 0x96B57D98;
  v91 = v213 ^ v88 ^ 0x49571195;
  LODWORD(v50) = *(_DWORD *)(v66
                           + 4
                           * (v41 ^ 0x3A ^ ((BYTE4(v213) ^ 0x22)
                                                                            - 2
                                                                            * ((BYTE4(v213) ^ 0x22) & 0xDD ^ BYTE4(v213) & 0x18)
                                                                            - 59) ^ v88 ^ 0xD0u)) ^ *(_DWORD *)(v61 + 4 * (BYTE1(v91) ^ 0xF5u)) ^ 0x764D3BAC ^ (v43 >> 2);
  HIDWORD(v212) = v213 ^ v88;
  LODWORD(v50) = (v50 - ((2 * v50) & 0x52163352) - 1458890327) ^ *(_DWORD *)(v65
                                                                           + 4
                                                                           * (((v213 ^ v88) >> 16) ^ 0x7Eu)) ^ v214 ^ 0x930000ED ^ BYTE1(v91);
  LODWORD(v215) = v41;
  LODWORD(v57) = v50 ^ v41;
  LODWORD(v60) = v50 ^ v41 ^ v91;
  LODWORD(v63) = *(_DWORD *)(v63 + 4 * (BYTE3(v60) ^ 0x63));
  HIDWORD(v43) = ~(_DWORD)v63;
  LODWORD(v43) = v63 ^ 0x96B57D98;
  LODWORD(v212) = v60 ^ 0x99CC858C;
  LODWORD(v41) = *(_DWORD *)(v61 + 4 * (((unsigned __int16)(v60 ^ 0xD0FF) >> 8) ^ 0xFDu)) ^ *(_DWORD *)(v66 + 4 * (~(_BYTE)v60 ^ 0xC4u)) ^ ((((unsigned __int16)(v60 ^ 0xD0FF) >> 8) ^ 8) - (((v60 ^ 0x2745D0FF) >> 7) & 0x1CA) - 1136390171) ^ ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x94126892) - 905366455);
  LODWORD(v41) = (v41 - ((2 * v41) & 0x52163352) - 1458890327) ^ *(_DWORD *)(v65
                                                                           + 4
                                                                           * (((v60 ^ 0x2745D0FF) >> 16) ^ 0x16u));
  v92 = v57 ^ 0x452FF2BF;
  v93 = *(_QWORD *)(v39 + 8 * (v34 - 705)) - 12;
  LODWORD(v57) = *(unsigned __int8 *)(v93 + (*(unsigned __int8 *)(v38 - 109) ^ 0xA5));
  HIDWORD(v43) = v57 ^ 0x23;
  LODWORD(v43) = (v57 ^ 0x80) << 24;
  v210 = v93;
  v211 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x3EE)) - 12;
  v208 = *(_QWORD *)(v39 + 8 * (v34 - 892)) - 4;
  v209 = *(_QWORD *)(v39 + 8 * (v34 ^ 0x37A)) - 8;
  v94 = (((((v43 >> 30) ^ 0xDB) >> 2) | (((v43 >> 30) ^ 0xDB) << 6)) | ((*(unsigned __int8 *)(v209 + (*(unsigned __int8 *)(v38 - 111) ^ 0x7ALL)) ^ 0x7D) << 16) | ((*(unsigned __int8 *)(v208 + (*(unsigned __int8 *)(v38 - 112) ^ 0x78)) ^ 0xFFFFFFF9) << 24) | (((*(_BYTE *)(v211 + (*(unsigned __int8 *)(v38 - 110) ^ 0x5DLL)) + (*(_BYTE *)(v38 - 110) ^ 0x52) + 63) ^ 0x5D) << 8)) ^ 0xEAEE9940;
  v95 = ((*(unsigned __int8 *)(v93 + (*(unsigned __int8 *)(v38 - 101) ^ 0x60)) ^ 0x68) & 0xFFFF00FF | ((*(unsigned __int8 *)(v209 + (*(unsigned __int8 *)(v38 - 103) ^ 5)) ^ 0x2C) << 16) | (((*(_BYTE *)(v211 + (*(unsigned __int8 *)(v38 - 102) ^ 4)) + (*(_BYTE *)(v38 - 102) ^ 0xB) + 63) ^ 0x33) << 8) | ((*(unsigned __int8 *)(v208 + (*(unsigned __int8 *)(v38 - 104) ^ 0x1CLL)) ^ 0xC) << 24)) ^ 0x4E4198C7;
  v96 = ((*(unsigned __int8 *)(v93 + (*(unsigned __int8 *)(v38 - 105) ^ 0x28)) ^ 0xA9) & 0xFFFF00FF | ((((*(_BYTE *)(v38 - 106) ^ 0xAC) + *(_BYTE *)(v211 + (*(unsigned __int8 *)(v38 - 106) ^ 0xA3)) + 63) ^ 0xF6) << 8) | ((*(unsigned __int8 *)(v208 + (*(unsigned __int8 *)(v38 - 108) ^ 0xB2)) ^ 0xFFFFFFFB) << 24) | ((*(unsigned __int8 *)(v209 + (*(unsigned __int8 *)(v38 - 107) ^ 0x27)) ^ 0x48) << 16)) ^ 0xB4E72F92;
  v97 = ((*(unsigned __int8 *)(v93 + (*(unsigned __int8 *)(v38 - 97) ^ 0x7BLL)) ^ 0xDC) & 0xFFFF00FF | ((((*(_BYTE *)(v38 - 98) ^ 0xD0) + *(_BYTE *)(v211 + (*(unsigned __int8 *)(v38 - 98) ^ 0xDFLL)) + 63) ^ 0xE4) << 8) | ((*(unsigned __int8 *)(v209 + (*(unsigned __int8 *)(v38 - 99) ^ 0xAALL)) ^ 0x1E) << 16) | ((*(unsigned __int8 *)(v208 + (*(unsigned __int8 *)(v38 - 100) ^ 0x45)) ^ 0xFFFFFFC3) << 24)) ^ 0xDADB3DEC;
  HIDWORD(v207) = *(_DWORD *)(v38 - 128) - 1606213550;
  v98 = (HIDWORD(v213) ^ 0x8D06EA22) - ((2 * (HIDWORD(v213) ^ 0x8D06EA22)) & 0xACBEE758) + 1449096108;
  v99 = v41 - ((2 * v41) & 0xACBEE758) + 1449096108;
  LODWORD(v206) = v40 ^ 0x70A;
  HIDWORD(v205) = v50 ^ 0x565F73AC ^ v98;
  *(_DWORD *)(v38 - 120) = v40;
  HIDWORD(v206) = v98 ^ 0x3DC8BA5D ^ v99;
  LODWORD(v207) = v50 ^ 0x565F73AC;
  HIDWORD(v204) = v99 ^ v50 ^ 0x565F73AC;
  LODWORD(v205) = v40 & 0x2878B89B;
  HIDWORD(a14) = v92;
  LODWORD(v204) = HIDWORD(v206) ^ v92;
  v100 = *(_DWORD *)(v38 - 120);
  *(_QWORD *)(v38 - 200) = 7;
  v101 = a1[7];
  *(_QWORD *)(v38 - 168) = 12;
  LODWORD(v101) = *(unsigned __int8 *)(v93 + (v101 ^ 0x41));
  LOBYTE(v57) = ((v100 - 23) | 0x40) ^ a1[12] ^ 0x22;
  *(_QWORD *)(v38 - 160) = 8;
  LODWORD(v57) = *(unsigned __int8 *)(v208 + v57);
  *(_QWORD *)(v38 - 128) = 1;
  LODWORD(v60) = *(unsigned __int8 *)(v208 + (a1[8] ^ 0xC1)) ^ 0xCCCCCCCC;
  v102 = *(unsigned __int8 *)(v209 + (a1[1] ^ 0x66)) ^ 0x91;
  *(_QWORD *)(v38 - 136) = 15;
  LODWORD(v45) = v102 << 16;
  v103 = *(unsigned __int8 *)(v93 + (a1[15] ^ 0xE9));
  *(_QWORD *)(v38 - 152) = 11;
  v104 = v103 ^ 0x7E | ((v57 ^ 0x78) << 24);
  LODWORD(v57) = *(unsigned __int8 *)(v93 + (a1[11] ^ 0xC3));
  *(_QWORD *)(v38 - 176) = 0;
  LODWORD(v45) = v45 | ((*(unsigned __int8 *)(v208 + (*a1 ^ 0x30)) ^ 0x48) << 24);
  *(_QWORD *)(v38 - 144) = 2;
  LODWORD(v57) = v57 ^ 0xB4 | ((_DWORD)v60 << 24);
  LOBYTE(v60) = (*(_BYTE *)(v211 + (a1[2] ^ 0xC0)) + (a1[2] ^ 0xCF) + 63) ^ 0xF9;
  *(_QWORD *)(v38 - 208) = 4;
  LODWORD(v45) = v45 & 0xFFFF00FF | (v60 << 8);
  LODWORD(v60) = *(unsigned __int8 *)(v208 + (a1[4] ^ 0xFCLL)) ^ 0xF6;
  LODWORD(v101) = v101 ^ 0xAE;
  *(_QWORD *)(v38 - 232) = 5;
  *(_QWORD *)(v38 - 224) = 9;
  LODWORD(v57) = v57 | ((*(unsigned __int8 *)(v209 + (a1[9] ^ 0x5DLL)) ^ 0x42) << 16);
  *(_QWORD *)(v38 - 192) = 10;
  LODWORD(v57) = v57 & 0xFFFF00FF | (((*(_BYTE *)(v211 + (a1[10] ^ 0xD5)) + (a1[10] ^ 0xDA) + 63) ^ 0xCF) << 8);
  *(_QWORD *)(v38 - 184) = 14;
  v105 = v104 & 0xFFFF00FF | ((*(_BYTE *)(v211 + (a1[14] ^ 0xE4)) + (a1[14] ^ 0xEB) - 65) << 8);
  *(_DWORD *)(v38 - 256) = -673008139;
  *(_QWORD *)(v38 - 216) = 3;
  v106 = *(unsigned __int8 *)(v93 + (a1[3] ^ 0xDCLL)) ^ 0x6A;
  *(_QWORD *)(v38 - 240) = 13;
  LODWORD(v41) = v105 | ((*(unsigned __int8 *)(v209 + (a1[13] ^ 0x92)) ^ 0x7F) << 16);
  *(_QWORD *)(v38 - 248) = 6;
  v107 = ((*(unsigned __int8 *)(v209 + (a1[5] ^ 0xA9)) ^ 0xAC) << 16) | (((*(_BYTE *)(v211 + (a1[6] ^ 0x4FLL))
                                                                                            + (a1[6] ^ 0x40)
                                                                                            + 63) ^ 0xB7) << 8) | v101 | ((_DWORD)v60 << 24);
  v108 = v94 ^ v233 ^ ((v106 | v45) + 1398218873 - 2 * ((v106 | v45) & 0x5357207B ^ v106 & 2));
  v109 = v96 ^ v234 ^ (v107 + 224302635 - 2 * (v107 & 0xD5E963F ^ v101 & 0x14));
  v110 = (v41 - ((2 * v41) & 0xC6C508AA) + 1667400789) ^ v97;
  v111 = (v110 - ((2 * v110) & 0x42B0F4F4) + 559446650) ^ v232;
  LODWORD(v41) = v95 ^ v231 ^ (v57 - ((2 * v57) & 0xEFF042FC) - 134733442);
  LODWORD(v60) = (v94 ^ v233 ^ ((v106 | v45) + 121 - 2 * ((v106 | v45) & 0x7B ^ v106 & 2)));
  v112 = *(_QWORD *)(v39 + 8 * (v100 - 1755)) - 12;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0x3F));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v113 = *(_QWORD *)(v39 + 8 * (v100 - 1669)) - 8;
  LODWORD(v57) = (v43 >> 1) ^ ((BYTE2(v111) ^ 0x68) - 1203171692 - ((v111 >> 15) & 0x128)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v111) ^ 0x34u));
  v114 = (char *)*(&off_10005BF50 + v100 - 1770) - 12;
  v115 = *(_DWORD *)&v114[4 * (v41 ^ 0xC6)] ^ ((v41 ^ 0xAB)
                                                              - 785536457
                                                              + ((2 * (v41 ^ 0xAB) + 254) & 0x36E ^ 0xCFE27BFF)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v108) ^ 0x89u)) ^ ((BYTE2(v108) ^ 0xD5) - 1203171692 - 2 * ((HIWORD(v108) ^ 0x6CD5) & 0x96 ^ HIWORD(v108) & 2));
  v116 = *(_DWORD *)(v113 + 4 * (BYTE2(v109) ^ 0x8Cu)) ^ *(_DWORD *)&v114[4 * (v111 ^ 0xB6)] ^ ((v111 ^ 0xDB) - 785536457 + ((2 * (v111 ^ 0xDB) + 254) & 0x36E ^ 0xCFE27BFF)) ^ ((BYTE2(v109) ^ 0xD0) - 1203171692 - ((2 * (HIWORD(v109) ^ 0xC8D0)) & 0x128));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v109) ^ 0xC8));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v117 = (char *)*(&off_10005BF50 + (v40 ^ 0x70A)) - 12;
  LODWORD(v101) = ((BYTE2(v41) ^ 0xAD) - 1203171692 - ((2 * (WORD1(v41) ^ 0x3FAD)) & 0x128)) ^ *(_DWORD *)&v114[4 * (v60 ^ 0x1C)] ^ ((v60 ^ 0x71) - 785536457 + ((2 * (v60 ^ 0x71) + 254) & 0x36E ^ 0xCFE27BFF)) ^ (v43 >> 1) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0xF1u));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v108) ^ 0x6C));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v41) = (v43 >> 1) ^ *(_DWORD *)&v117[4 * (BYTE1(v41) ^ 0x29)] ^ (v116 - 813714329 - ((2 * v116) & 0x9EFF68CE));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v111) ^ 0xB7));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v57) = *(_DWORD *)&v114[4 * (v109 ^ 0x7D)] ^ *(_DWORD *)&v117[4 * (BYTE1(v108) ^ 0xDE)] ^ ((v109 ^ 0x10) - 785536457 + ((2 * (v109 ^ 0x10) + 254) & 0x36E ^ 0xCFE27BFF)) ^ (v57 - 813714329 - ((2 * v57) & 0x9EFF68CE));
  LODWORD(v60) = v57 - 1675615715 - ((2 * v57) & 0x3840443A);
  LODWORD(v57) = (v115 - 813714329 - ((2 * v115) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v109) ^ 0x2F)] ^ (v43 >> 1);
  v118 = v41 - 1039150308 - ((2 * v41) & 0x841FA638);
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * ((v60 ^ ~v228) >> 24));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v45) = v43 >> 1;
  LODWORD(v41) = *(_DWORD *)&v117[4 * (BYTE1(v111) ^ 0x66)] ^ v229 ^ (v101 - 813714329 - ((2 * v101) & 0x9EFF68CE));
  v119 = (v117[4 * (BYTE1(v111) ^ 0x66)] ^ v229 ^ (v101 + 103 - ((2 * v101) & 0xCE)));
  LOWORD(v101) = v60 ^ v228;
  v120 = ((v60 ^ v228) >> 16);
  v121 = (v120 ^ 0x49) - 1203171692 - (((v60 ^ v228) >> 15) & 0x128);
  LODWORD(v60) = v118 ^ v230;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (((v118 ^ v230) >> 24) ^ 0x91));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v122 = v43 >> 1;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0xA3));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v123 = v122 ^ *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0xF0u)) ^ ((BYTE2(v41) ^ 0xAC)
                                                                - 1203171692
                                                                - 2 * ((WORD1(v41) ^ 0xA3AC) & 0x96 ^ WORD1(v41) & 2));
  v124 = (v43 >> 1) ^ *(_DWORD *)(v113 + 4 * (v120 ^ 0x15u)) ^ *(_DWORD *)&v114[4 * (v60 ^ 0x7B)] ^ v121 ^ ((v60 ^ 0x16) - 785536457 + ((2 * (v60 ^ 0x16) + 254) & 0x36E ^ 0xCFE27BFF));
  v125 = (v57 - ((2 * v57) & 0xDAC0A358) + 1835028908) ^ v227;
  v126 = (v124 - 813714329 - ((2 * v124) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v125) ^ 0x70)];
  v127 = (v123 - 813714329 - ((2 * v123) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v101) ^ 0x2C)];
  LODWORD(v57) = v45 ^ *(_DWORD *)&v114[4 * (v119 ^ 3)] ^ ((v119 ^ 0x6E)
                                                         - 785536458
                                                         - ((2 * (v119 ^ 0x6E) + 842892542) & 0x301D876E)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v125) ^ 0xC3u)) ^ ((BYTE2(v125) ^ 0x9F) - 1203171692 - ((2 * (HIWORD(v125) ^ 0x259F)) & 0x128));
  LODWORD(v45) = ((BYTE2(v60) ^ 0x72) - 1203171692 - ((2 * (WORD1(v60) ^ 0x9172)) & 0x128)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v60) ^ 0x2Eu));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v125) ^ 0x25));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v41) = ((v101 ^ 0xFC)
                - 785536458
                - ((2 * (v101 ^ 0xFC) + 842892542) & 0x301D876E)) ^ *(_DWORD *)&v117[4 * (BYTE1(v41) ^ 0xBD)] ^ *(_DWORD *)&v114[4 * (v101 ^ 0x91)] ^ (v43 >> 1);
  LODWORD(v101) = *(_DWORD *)&v117[4 * (BYTE1(v60) ^ 0x57)];
  LODWORD(v41) = v41 ^ (v45 - 813714329 - ((2 * v45) & 0x9EFF68CE));
  LODWORD(v60) = ((v125 ^ 0xD6) - 1726037377) ^ HIDWORD(v224) ^ *(_DWORD *)&v114[4
                                                                                                * (v125 ^ 0xBB)] ^ (v127 + 940500919 - ((2 * v127) & 0x701DCF6E));
  v128 = v101 ^ v226 ^ (v57 - 813714329 - ((2 * v57) & 0x9EFF68CE));
  v129 = (v41 - ((2 * v41) & 0x35CC9DC) + 28206318) ^ v225;
  LODWORD(v41) = (v126 - 252831905 - ((2 * v126) & 0xE1DC2EBE)) ^ v72;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v129) ^ 0xA6));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v101) = ((v126 + 95 - ((2 * v126) & 0xBE)) ^ v72);
  LODWORD(v101) = ((v101 ^ 0xA1) - 785536458 - ((2 * (v101 ^ 0xA1) + 842892542) & 0x301D876E)) ^ *(_DWORD *)&v114[4 * (v101 ^ 0xCC)];
  v130 = *(_DWORD *)(v113 + 4 * (BYTE2(v60) ^ 0xDBu)) ^ ((BYTE2(v60) ^ 0x87)
                                                         - 1203171692
                                                         - ((2 * (WORD1(v60) ^ 0x3A87)) & 0x128)) ^ (v43 >> 1);
  LODWORD(v57) = (v101 - 813714329 - ((2 * v101) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v60) ^ 0xDE)];
  LODWORD(v101) = ((v60 ^ 0x9E)
                 - 785536458
                 - ((2 * (v60 ^ 0x9E) + 842892542) & 0x301D876E)) ^ *(_DWORD *)&v114[4 * (v60 ^ 0xF3)];
  v131 = (v130 - 813714329 - ((2 * v130) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4
                                                                         * (((unsigned __int16)((v126 + 5983 - ((2 * v126) & 0x2EBE)) ^ v72) >> 8) ^ 0x57)];
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v128) ^ 0x5B));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v57) = *(_DWORD *)(v113 + 4 * (BYTE2(v129) ^ 0x20u)) ^ BYTE2(v129) ^ (v43 >> 1) ^ (v57 - 1203171692 - ((2 * v57) & 0x70921D28));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v60) ^ 0x3A));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v60) = BYTE2(v41) ^ *(_DWORD *)&v117[4 * (BYTE1(v128) ^ 0x89)] ^ *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0xF6u)) ^ (v43 >> 1);
  *(_DWORD *)(v38 - 252) = 940500920;
  v132 = ((v129 ^ 0x8B) - 1726037377) ^ v224 ^ *(_DWORD *)&v114[4 * (v129 ^ 0xE6)] ^ ((v60 ^ 0x7736BA59) + 940500920 + ((2 * ((v60 ^ 0x7736BA59) & 0x380EE7BF ^ v60 & 8)) ^ 0xFFFFFFEF));
  v133 = *(_DWORD *)&v114[4 * (v128 ^ 0x15)] ^ ((v128 ^ 0x78) - 1726037377) ^ (v131 + 940500919 - ((2 * v131) & 0x701DCF6E));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0x7C));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v41) = ((v57 ^ 0x7C) - ((2 * (v57 ^ 0x7C)) & 0xAEFE5918) - 679531380) ^ v223;
  v134 = *(_DWORD *)&v117[4 * (BYTE1(v129) ^ 0xB)] ^ HIDWORD(v223) ^ ((BYTE2(v128) ^ 0xC2)
                                                                    - 1203171692
                                                                    - 2
                                                                    * ((HIWORD(v128) ^ 0x18C2) & 0x9C ^ HIWORD(v128) & 8)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v128) ^ 0x9Eu)) ^ (v43 >> 1) ^ (v101 - 813714329 - ((2 * v101) & 0x9EFF68CE));
  LODWORD(v101) = ((v41 ^ 0xD)
                 - 785536457
                 + ((2 * (v41 ^ 0xD) + 254) & 0x36E ^ 0xCFE27BFF)) ^ *(_DWORD *)&v114[4 * (v41 ^ 0x60)];
  v135 = v101 - 813714329 - ((2 * v101) & 0x9EFF68CE);
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v132) ^ 0x2D));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v60) = (v133 - ((2 * v133) & 0x4250FA54) - 1591182038) ^ HIDWORD(v222);
  v136 = ((v133 - ((2 * v133) & 0x54) + 42) ^ BYTE4(v222));
  v137 = (v43 >> 1) ^ ((v136 ^ 0x1A) - 785536458 - ((2 * (v136 ^ 0x1A) + 842892542) & 0x301D876E)) ^ *(_DWORD *)&v114[4 * (v136 ^ 0x77)];
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v60) ^ 0xE5));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v138 = v43 >> 1;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 2));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v101) = v43 >> 1;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v134) ^ 0xB4));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v101) = v101 ^ *(_DWORD *)&v114[4 * (v134 ^ 0x8B)] ^ ((v134 ^ 0xE6)
                                                                               - 785536457
                                                                               + ((2 * (v134 ^ 0xE6)
                                                                                 + 254) & 0x36E ^ 0xCFE27BFF));
  v139 = ((BYTE2(v134) ^ 0x59) - 1203171692 - ((2 * (HIWORD(v134) ^ 0xB459)) & 0x128)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v134) ^ 5u)) ^ *(_DWORD *)&v117[4 * (((unsigned __int16)(((v57 ^ 0x7C) - ((2 * (v57 ^ 0x7C)) & 0x5918) + 11404) ^ v223) >> 8) ^ 0xBC)] ^ (v137 - 813714329 - ((2 * v137) & 0x9EFF68CE));
  v140 = (HIWORD(v132) ^ 0x2D72) & 0x95 ^ HIWORD(v132) & 1;
  LODWORD(v45) = BYTE2(v132) ^ 0x72;
  v141 = v132;
  LODWORD(v93) = (v132 ^ 0x16)
               - 785536458
               - ((2 * (v132 ^ 0x16) + 842892542) & 0x301D876E);
  v142 = ((BYTE2(v60) ^ 0xF2) - 1203171692 - ((2 * (WORD1(v60) ^ 0xE5F2)) & 0x128)) ^ v221 ^ *(_DWORD *)&v117[4 * (BYTE1(v132) ^ 0x57)] ^ *(_DWORD *)(v113 + 4 * (BYTE2(v60) ^ 0xAEu)) ^ (v101 - 813714329 - ((2 * v101) & 0x9EFF68CE));
  LODWORD(v41) = WORD1(v41);
  LODWORD(v101) = HIDWORD(v221) ^ ((v43 >> 1) - 813714329 - ((2 * (v43 >> 1)) & 0x9EFF68CE)) ^ *(_DWORD *)&v114[4 * (v141 ^ 0x7B)] ^ v93 ^ *(_DWORD *)(v113 + 4 * (v41 ^ 0x89u)) ^ ((v41 ^ 0xD5) - 1203171692 - 2 * ((v41 ^ 0x41D5) & 0x96 ^ v41 & 2));
  LODWORD(v41) = (v139 + 555991475 - ((2 * v139) & 0x42478366)) ^ v222;
  v143 = *(_DWORD *)&v117[4 * (BYTE1(v134) ^ 0x34)] ^ HIDWORD(v220) ^ *(_DWORD *)(v113 + 4
                                                                                       * (v45 ^ 0x5C)) ^ (v45 - 1203171692 - 2 * v140) ^ v135 ^ v138;
  LODWORD(v45) = *(_DWORD *)&v117[4 * (BYTE1(v60) ^ 0x5A)] ^ v101;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v143) ^ 0x87));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v144 = (v43 >> 1) - 813714329 - ((2 * (v43 >> 1)) & 0x9EFF68CE);
  v145 = ((BYTE2(v45) ^ 0x81) - 1203171692 - ((2 * (WORD1(v45) ^ 0x1481)) & 0x128)) ^ *(_DWORD *)(v113
                                                                                                + 4
                                                                                                * (BYTE2(v45) ^ 0xDDu));
  LODWORD(v60) = (v117[4 * (BYTE1(v60) ^ 0x5A)] ^ v101);
  LODWORD(v60) = ((v60 ^ 0x51) - 785536457 + ((2 * (v60 ^ 0x51) + 254) & 0x36E ^ 0xCFE27BFF)) ^ *(_DWORD *)&v114[4 * (v60 ^ 0x3C)];
  LODWORD(v93) = *(_DWORD *)(v113 + 4 * (BYTE2(v142) ^ 0xDBu)) ^ ((BYTE2(v142) ^ 0x87)
                                                                  - 1203171692
                                                                  - ((2 * (HIWORD(v142) ^ 0x7787)) & 0x128));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v45) ^ 0x14));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v48) = v43 >> 1;
  LODWORD(v57) = ((v143 ^ 0xC4B2DCC9) >> 16) ^ *(_DWORD *)(v113
                                                                          + 4
                                                                          * (((v143 ^ 0xC4B2DCC9) >> 16) ^ 0x5Cu)) ^ (v60 - 1203171692 - ((2 * v60) & 0x70921D28));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0x9A));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v146 = *(_DWORD *)&v114[4 * (v143 ^ 0xA4)] ^ *(_DWORD *)&v117[4 * (BYTE1(v142) ^ 0xDE)] ^ (v145 - 813714329 - ((2 * v145) & 0x9EFF68CE)) ^ ((v143 ^ 0xC9) - 785536458 - ((2 * (v143 ^ 0xC9) + 842892542) & 0x301D876E)) ^ (v43 >> 1);
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v142) ^ 0x77));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v57) = (v43 >> 1) ^ *(_DWORD *)&v117[4 * (BYTE1(v41) ^ 0x2D)] ^ (v57 - 813714329 - ((2 * v57) & 0x9EFF68CE));
  v147 = *(_DWORD *)&v117[4 * (BYTE1(v45) ^ 0x34)] ^ v219 ^ v144 ^ *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0xB5u)) ^ ((v142 ^ 0x9E) - 785536458 - ((2 * (v142 ^ 0x9E) + 842892542) & 0x301D876E)) ^ ((BYTE2(v41) ^ 0xE9) - 1203171692 - ((2 * (WORD1(v41) ^ 0x9AE9)) & 0x128)) ^ *(_DWORD *)&v114[4 * (v142 ^ 0xF3)];
  LODWORD(v41) = *(_DWORD *)&v117[4 * (BYTE1(v143) ^ 0x3E)] ^ HIDWORD(v218) ^ ((v41 ^ 0xA8)
                                                                             - 785536457
                                                                             + ((2 * (v41 ^ 0xA8) + 254) & 0x36E ^ 0xCFE27BFF)) ^ v48 ^ (v93 - 813714328 + ~((2 * v93) & 0x9EFF68CE)) ^ *(_DWORD *)&v114[4 * (v41 ^ 0xC5)];
  LODWORD(v101) = v57 - ((2 * v57) & 0x2EE7C136);
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0x6D));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v45) = v43 >> 1;
  v148 = (v146 - 1174975932 - ((2 * v146) & 0x73EE9488)) ^ v220;
  v149 = *(_DWORD *)(v112 + 4 * (HIBYTE(v148) ^ 0xFD));
  v150 = *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0x52u)) ^ (v149 << 31) ^ (v149 >> 1) ^ ((BYTE2(v41) ^ 0xE)
                                                                                      - 1203171692
                                                                                      - ((2 * (WORD1(v41) ^ 0x2E0E)) & 0x128));
  LODWORD(v57) = ((v41 ^ 0x4A)
                - 785536458
                - ((2 * (v41 ^ 0x4A) + 842892542) & 0x301D876E)) ^ *(_DWORD *)&v114[4 * (v41 ^ 0x27)];
  v151 = (v101 + 393470107) ^ HIDWORD(v219);
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v151) ^ 0xE8));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v101) = (v43 >> 1) ^ *(_DWORD *)&v117[4 * (BYTE1(v148) ^ 0xA4)] ^ (v57 - 813714328 + ~((2 * v57) & 0x9EFF68CE));
  LODWORD(v57) = *(_DWORD *)(v113 + 4 * (BYTE2(v151) ^ 0x27u)) ^ v45 ^ *(_DWORD *)&v114[4
                                                                                        * (v148 ^ 0x4D)] ^ ((v148 ^ 0x20) - 785536458 - ((2 * (v148 ^ 0x20) + 842892542) & 0x301D876E)) ^ ((BYTE2(v151) ^ 0x7B) - 1203171692 - ((2 * (HIWORD(v151) ^ 0xE87B)) & 0x128));
  LODWORD(v60) = v57 - 813714329 - ((2 * v57) & 0x9EFF68CE);
  v152 = ((v147 ^ 0x34) - 785536457 + ((2 * (v147 ^ 0x34) + 254) & 0x36E ^ 0xCFE27BFF)) ^ *(_DWORD *)&v114[4 * (v147 ^ 0x59)] ^ *(_DWORD *)&v117[4 * (BYTE1(v151) ^ 0x6F)] ^ ((v150 ^ 0x2CECB063) - 813714329 - 2 * ((v150 ^ 0x2CECB063) & 0x4F7FB46F ^ v150 & 8));
  LODWORD(v41) = ((v151 ^ 0x1E)
                - ((2 * (v151 ^ 0x1E) + 306021630) & 0x123D00CE)
                + 1755215590) ^ *(_DWORD *)&v117[4 * (BYTE1(v41) ^ 0x65)];
  LODWORD(v41) = (v41 + *(_DWORD *)(v38 - 252) + ~((2 * v41) & 0x701DCF6E)) ^ *(_DWORD *)&v114[4
                                                                                             * (v151 ^ 0x73)];
  LODWORD(v57) = *(_DWORD *)(v113 + 4 * (BYTE2(v148) ^ 0x40u)) ^ ((BYTE2(v148) ^ 0x1C)
                                                                  - 1203171692
                                                                  - ((2 * (HIWORD(v148) ^ 0xFD1C)) & 0x128));
  v153 = v57 ^ 0x41BFBD34 ^ (v41 + 44209639 - ((2 * v41) & 0x5452BCE));
  LODWORD(v41) = v41 ^ 0x6500C283;
  v154 = (v41 + v153 + 1) ^ ((v57 ^ 0x261DEA50) + 1);
  LODWORD(v101) = BYTE2(v147) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v147) ^ 0x24u)) ^ (v101
                                                                                 - 1203171692
                                                                                 - ((2 * v101) & 0x70921D28)) ^ 0x78;
  v155 = *(_DWORD *)&v117[4 * (BYTE1(v147) ^ 0x38)];
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v147) ^ 0x6E));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v156 = (v101 - 1327937419 - ((2 * v101) & 0x61B290EA)) ^ HIDWORD(v216);
  LODWORD(v41) = ((v57 ^ 0xDB408048 ^ (v154 + 44209639 - ((2 * v154) & 0x5452BCE))) + v41) ^ (v43 >> 1);
  LODWORD(v101) = v41 - ((2 * v41) & 0x2C3173E);
  v157 = v155 ^ HIDWORD(v217) ^ v60;
  v158 = (v152 - 1970643564 - ((2 * v152) & 0x1514BB28)) ^ v218;
  LODWORD(v41) = ((BYTE2(v158) ^ 0xE9) - 1203171692 - 2 * ((HIWORD(v158) ^ 0xB8E9) & 0x96 ^ HIWORD(v158) & 2)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v158) ^ 0xB5u));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v156) ^ 0x9D));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v45) = v43 >> 1;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v157) ^ 0x61));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v159 = *(_DWORD *)&v114[4 * (v158 ^ 0xC5)] ^ *(_DWORD *)(v113 + 4 * (BYTE2(v156) ^ 0x28u)) ^ (v43 >> 1) ^ ((v158 ^ 0xA8) - 785536458 - ((2 * (v158 ^ 0xA8) + 842892542) & 0x301D876E)) ^ ((BYTE2(v156) ^ 0x74) - 1203171692 - 2 * ((HIWORD(v156) ^ 0x9D74) & 0x95 ^ HIWORD(v156) & 1));
  LODWORD(v101) = (v101 + 23169951) ^ v217;
  LODWORD(v57) = v45 ^ ((BYTE2(v101) ^ 0xE9) - 1203171692 - 2 * ((WORD1(v101) ^ 0xE0E9) & 0x96 ^ WORD1(v101) & 2)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v101) ^ 0xB5u));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v158) ^ 0xB8));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v160 = ((v155 ^ BYTE4(v217) ^ v60) ^ 0x85)
       - 785536458
       - ((2 * ((v155 ^ BYTE4(v217) ^ v60) ^ 0x85) + 842892542) & 0x301D876E);
  LODWORD(v60) = *(_DWORD *)&v114[4 * (v101 ^ 0x80)] ^ *(_DWORD *)(v113 + 4 * (BYTE2(v157) ^ 0x54u)) ^ ((BYTE2(v157) ^ 8) - 1203171692 - ((v157 >> 15) & 0x128)) ^ (v43 >> 1) ^ ((v101 ^ 0xED) - 785536457 + ((2 * (v101 ^ 0xED) + 254) & 0x36E ^ 0xCFE27BFF));
  v161 = *(_DWORD *)&v117[4 * (BYTE1(v101) ^ 0xA5)] ^ HIDWORD(v215) ^ (v159 - 813714329 - ((2 * v159) & 0x9EFF68CE));
  v162 = (v60 - 813714329 - ((2 * v60) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v156) ^ 0xBD)];
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v101) ^ 0xE0));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v41) = *(_DWORD *)&v114[4 * (v156 ^ 0xB4)] ^ *(_DWORD *)&v117[4 * (BYTE1(v157) ^ 0x8F)] ^ ((v156 ^ 0xD9) - 785536457 + ((2 * (v156 ^ 0xD9) + 254) & 0x36E ^ 0xCFE27BFF)) ^ (v41 - 813714329 - ((2 * v41) & 0x9EFF68CE)) ^ (v43 >> 1);
  LODWORD(v60) = *(_DWORD *)&v114[4 * (v157 ^ 0xE8)];
  v163 = (v41 - ((2 * v41) & 0xAB1BD29E) + 1435363663) ^ HIDWORD(v214);
  LODWORD(v41) = v160 ^ v215 ^ v60 ^ *(_DWORD *)&v117[4 * (BYTE1(v158) ^ 0x2D)] ^ (v57
                                                                                 - 813714329
                                                                                 - ((2 * v57) & 0x9EFF68CE));
  v164 = (v162 - 458972045 - ((2 * v162) & 0xC94948E6)) ^ v216;
  v165 = ((BYTE2(v41) ^ 0x66) - 1203171692 - 2 * ((WORD1(v41) ^ 0xAE66) & 0x9D ^ WORD1(v41) & 9)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0x3Au));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v163) ^ 0x6A));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v101) = (v43 >> 1) - 1203171692 - ((2 * (v43 >> 1)) & 0x70921D28);
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v164) ^ 0xEF));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v57) = v101 ^ *(_DWORD *)(v113 + 4 * (BYTE2(v164) ^ 0x40u));
  LODWORD(v60) = (v43 >> 1) ^ *(_DWORD *)&v114[4 * (v163 ^ 0x20)] ^ ((v163 ^ 0x4D)
                                                                                    - 785536458
                                                                                    - ((2
                                                                                      * (v163 ^ 0x4D)
                                                                                      + 842892542) & 0x301D876E));
  LODWORD(v93) = ((v161 ^ 0x4A)
                - 785536457
                + ((2 * (v161 ^ 0x4A) + 254) & 0x36E ^ 0xCFE27BFF)) ^ *(_DWORD *)&v114[4 * (v161 ^ 0x27)];
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0xAE));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v93) = (v43 >> 1) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v163) ^ 0xC7u)) ^ (v93
                                                                               - 1203171692
                                                                               - ((2 * v93) & 0x70921D28));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v161) ^ 0xDC));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v166 = ((BYTE2(v161) ^ 0xE) - 1203171692 - ((2 * (HIWORD(v161) ^ 0xDC0E)) & 0x128)) ^ v214 ^ *(_DWORD *)(v113 + 4 * (BYTE2(v161) ^ 0x52u)) ^ *(_DWORD *)&v117[4 * (BYTE1(v41) ^ 0x7C)] ^ (v60 - 813714329 - ((2 * v60) & 0x9EFF68CE));
  LODWORD(v41) = v41;
  LODWORD(v60) = (v41 ^ 0xB3) - 785536458 - ((2 * (v41 ^ 0xB3) + 842892542) & 0x301D876E);
  v167 = *(_DWORD *)&v114[4 * (v41 ^ 0xDE)];
  LODWORD(v41) = *(_DWORD *)&v117[4 * (BYTE1(v163) ^ 0x22)] ^ HIDWORD(v213) ^ *(_DWORD *)&v114[4
                                                                                             * (v164 ^ 0x4D)] ^ (v43 >> 1) ^ ((v164 ^ 0x20) - 785536457 + ((2 * (v164 ^ 0x20) + 254) & 0x36E ^ 0xCFE27BFF)) ^ (v165 - 813714329 - ((2 * v165) & 0x9EFF68CE));
  v168 = (v57 - 813714329 - ((2 * v57) & 0x9EFF68CE)) ^ HIDWORD(v212) ^ *(_DWORD *)&v117[4 * (BYTE1(v161) ^ 0x65)] ^ v167 ^ v60;
  LODWORD(v60) = *(_DWORD *)&v117[4 * (BYTE1(v164) ^ 0xA4)] ^ v213 ^ (v93 - 813714329 - ((2 * v93) & 0x9EFF68CE));
  v169 = (v117[4 * (BYTE1(v164) ^ 0xA4)] ^ v213 ^ (v93 + 103 - ((2 * v93) & 0xCE)) ^ BYTE2(v163));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v168) ^ 0x6C));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v170 = v43 >> 1;
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (HIBYTE(v166) ^ 0xF7));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  LODWORD(v48) = v43 >> 1;
  LODWORD(v45) = ((BYTE2(v168) ^ 0xC8) - 1203171692 - ((2 * (HIWORD(v168) ^ 0x6CC8)) & 0x128)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v168) ^ 0x94u));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v60) ^ 0xE7));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v171 = v43 >> 1;
  v172 = v170 ^ *(_DWORD *)&v114[4 * (v169 ^ 0xD0)] ^ ((BYTE2(v166) ^ 0xE9)
                                                     - 1203171692
                                                     - ((2 * (HIWORD(v166) ^ 0xF7E9)) & 0x128)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v166) ^ 0xB5u)) ^ ((v169 ^ 0xBD) - 785536458 - ((2 * (v169 ^ 0xBD) + 842892542) & 0x301D876E));
  v173 = (v172 - 813714329 - ((2 * v172) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v41) ^ 0xEC)];
  v174 = v48 ^ *(_DWORD *)(v113 + 4 * (BYTE2(v41) ^ 0xA7u)) ^ *(_DWORD *)&v114[4
                                                                               * ((v168 ^ BYTE2(v164)) ^ 0x32)] ^ (((v168 ^ BYTE2(v164)) ^ 0x5F) - 785536458 - ((2 * ((v168 ^ BYTE2(v164)) ^ 0x5F) + 842892542) & 0x301D876E)) ^ ((BYTE2(v41) ^ 0xFB) - 1203171692 - ((2 * (WORD1(v41) ^ 0x57FB)) & 0x128));
  HIDWORD(v43) = *(_DWORD *)(v112 + 4 * (BYTE3(v41) ^ 0x57));
  LODWORD(v43) = HIDWORD(v43) ^ 0x59D960C6;
  v175 = (v174 - 813714329 - ((2 * v174) & 0x9EFF68CE)) ^ *(_DWORD *)&v117[4 * (BYTE1(v60) ^ 0x6D)];
  LODWORD(v101) = ((BYTE2(v60) ^ 0x31) - 1203171692 - ((2 * (WORD1(v60) ^ 0xE731)) & 0x128)) ^ *(_DWORD *)&v114[4 * (v166 ^ 0xC5)] ^ ((v166 ^ 0xA8) - 785536457 + ((2 * (v166 ^ 0xA8) + 254) & 0x36E ^ 0xCFE27BFF)) ^ *(_DWORD *)(v113 + 4 * (BYTE2(v60) ^ 0x6Du));
  LODWORD(v60) = *(_DWORD *)&v117[4 * (BYTE1(v166) ^ 0x2D)];
  LODWORD(v41) = v41;
  v176 = *(_DWORD *)&v114[4 * (v41 ^ 0x42)];
  LODWORD(v57) = (v41 ^ 0x2F) - 785536457 + ((2 * (v41 ^ 0x2F) + 254) & 0x36E ^ 0xCFE27BFF);
  v177 = HIDWORD(v205) ^ *(_DWORD *)&v117[4 * (BYTE1(v168) ^ 0x61)] ^ ((v101 ^ (v43 >> 1))
                                                                     - 813714329
                                                                     - ((2 * (v101 ^ (v43 >> 1))) & 0x9EFF68CE));
  LODWORD(v114) = v177 ^ 0xADE748E2;
  LODWORD(v101) = (v175 + 1449096108 - ((2 * v175) & 0xACBEE758)) ^ v50 ^ 0x565F73AC;
  LODWORD(v41) = (v173 - 1867096590 - ((2 * v173) & 0x216CBBE4)) ^ v212;
  v178 = v60 ^ HIDWORD(a14) ^ v171 ^ v176 ^ v57 ^ (v45 - 813714329 - ((2 * v45) & 0x9EFF68CE));
  v179 = HIBYTE(v177) ^ 0x89;
  v180 = (v60 ^ BYTE4(a14) ^ v171 ^ v176 ^ v57 ^ (v45 + 103 - ((2 * v45) & 0xCE))) ^ 0xC9;
  v181 = *(unsigned int *)(v38 - 120);
  v182 = (uint64_t)*(&off_10005BF50 + (int)v181 - 1727);
  v183 = (char *)*(&off_10005BF50 + (int)v181 - 1682) - 8;
  v184 = *(_DWORD *)(v182 + 4 * (v101 ^ 0xA2u));
  v185 = (uint64_t)*(&off_10005BF50 + v205);
  v186 = (*(_DWORD *)(v185 + 4 * (BYTE2(v101) ^ 0x9Eu)) - 1009155551) ^ (*(_DWORD *)(v182 + 4 * v180) + 1231950471);
  v187 = *(_DWORD *)(v182 + 4 * (v177 ^ 0xC8u));
  v188 = v187 - ((2 * v187 + 316417294) & 0x681C7D70u);
  v189 = *(_DWORD *)(v182 + 4 * (v41 ^ 0xB9u));
  v190 = *(unsigned int *)&v183[4 * (BYTE3(v101) ^ 0xE7)];
  LODWORD(v182) = *(_DWORD *)&v183[4 * (HIBYTE(v178) ^ 0xB8)];
  v191 = (*(_DWORD *)(v185 + 4 * (BYTE2(v178) ^ 0x38u)) - 1009155551) ^ (*(_DWORD *)&v183[4 * v179] - 990354862) ^ (v184 + 1231950471);
  v192 = (char *)*(&off_10005BF50 + (int)v181 - 1679) - 4;
  v193 = *(unsigned int *)&v192[4 * (BYTE1(v114) ^ 0x29)];
  v194 = (v186 + 873348792 - ((2 * v186) & 0x681C7D70)) ^ v193 ^ (*(_DWORD *)&v183[4 * (BYTE3(v41) ^ 0x65)] - 990354862);
  LODWORD(v183) = *(_DWORD *)&v192[4 * (BYTE1(v101) ^ 0xA0)];
  LODWORD(v101) = *(_DWORD *)&v192[4 * (BYTE1(v178) ^ 0xE9)];
  LODWORD(v113) = *(_DWORD *)(v185 + 4 * (BYTE2(v114) ^ 0x6Bu));
  LODWORD(v114) = *(_DWORD *)&v192[4 * (BYTE1(v41) ^ 0x74)] ^ HIDWORD(v206) ^ (v191
                                                                             + 873348792
                                                                             - ((2 * v191) & 0x681C7D70));
  v195 = v204 ^ v212 ^ (v194 - 1867096590 - ((2 * v194) & 0x216CBBE4));
  v196 = v183 ^ v204 ^ (v188 + 2105299263) ^ (v182 - 990354862) ^ (*(_DWORD *)(v185
                                                                                           + 4 * (BYTE2(v41) ^ 0x1Du))
                                                                               - 1009155551);
  v197 = (char *)*(&off_10005BF50 + (int)v181 - 1714) - 8;
  v198 = *(_QWORD *)(v38 - 240);
  a1[*(_QWORD *)(v38 - 248)] = v197[BYTE1(v114) ^ 0x99] ^ 0xE8;
  v199 = (char *)*(&off_10005BF50 + (int)v181 - 1758) - 4;
  a1[v198] = (v199[BYTE2(v195) ^ 0xADLL] + 39) ^ 0xC5;
  v200 = (char *)*(&off_10005BF50 + (int)v181 - 1658) - 4;
  a1[*(_QWORD *)(v38 - 200)] = v200[v114 ^ 0xFCLL] ^ 0x4F;
  a1[*(_QWORD *)(v38 - 224)] = (v199[BYTE2(v196) ^ 0x8CLL] + 39) ^ 0x47;
  v201 = (uint64_t)*(&off_10005BF50 + (int)v181 - 1650);
  a1[*(_QWORD *)(v38 - 208)] = (*(_BYTE *)(v201 + ((v114 >> 24) ^ 0xDELL)) - 93) ^ 0x1B;
  a1[*(_QWORD *)(v38 - 232)] = ((v199[BYTE2(v114) ^ 0x15] + ((v199[BYTE2(v114) ^ 0x15] + 39) ^ 0xDA) + 40) ^ 0xFE)
                             + v199[BYTE2(v114) ^ 0x15]
                             + 39;
  LODWORD(v101) = HIDWORD(v204) ^ v101 ^ (v113 - 1009155551) ^ (v189 + 1231950471) ^ (v190
                                                                                    - ((2 * v190 + 166773924) & 0x681C7D70)
                                                                                    - 117006070);
  a1[*(_QWORD *)(v38 - 216)] = v200[v101 ^ 5] ^ 0xBD;
  a1[*(_QWORD *)(v38 - 168)] = (*(_BYTE *)(v201 + (HIBYTE(v195) ^ 0x4ELL)) - 93) ^ 0xE6;
  a1[*(_QWORD *)(v38 - 160)] = (*(_BYTE *)(v201 + (HIBYTE(v196) ^ 0x9CLL)) - 93) ^ 0xB8;
  v202 = *(_QWORD *)(v38 - 176);
  a1[v202] = (*(_BYTE *)(v201 + (BYTE3(v101) ^ 0x67)) - 93) ^ 0x91;
  a1[*(_QWORD *)(v38 - 152)] = v200[v196 ^ 0xF2] ^ 0xB7;
  a1[*(_QWORD *)(v38 - 192)] = v197[BYTE1(v196) ^ 0x1ELL] ^ 0x4B;
  a1[*(_QWORD *)(v38 - 144)] = v197[BYTE1(v101) ^ 0x33] ^ 0x52;
  a1[*(_QWORD *)(v38 - 184)] = v197[BYTE1(v195) ^ 0xBCLL] ^ 0x9C;
  a1[*(_QWORD *)(v38 - 136)] = v200[v195 ^ 0x9FLL] ^ 0x4F;
  a1[*(_QWORD *)(v38 - 128)] = (v199[BYTE2(v101) ^ 0xDLL] + 39) ^ 0x8E;
  LODWORD(v199) = (((_DWORD)v202 - 673008123 - 2 * (((_DWORD)v202 + 16) & 0x57E2B5F7 ^ *(_DWORD *)(v38 - 256) & 2)) ^ 0xD7E2B5F5) >= HIDWORD(v207);
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(_QWORD *)(a34 + 8 * (((2 * (int)v199) | (4 * (int)v199)) ^ ((int)v181 - 535))) - 8))(HIDWORD(v204), 79, 116, v190, 197, v181, v188, v193, a2, a3, a4, a1, v204, v205, v206, v207, v208, v209, v210,
           v211,
           a14,
           v212,
           v213,
           v214,
           v215,
           v216,
           v217,
           v218,
           v219,
           v220,
           v221,
           v222,
           v223,
           v224);
}

void sub_100018220()
{
  JUMPOUT(0x100015DC4);
}

uint64_t sub_100018254(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (int)(((((127 * (v4 ^ 0x9C) + 1976505827) & 0x8A30EF39) - 1433) * (v3 != a3)) ^ v4))
                            - 12))();
}

uint64_t sub_1000182A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                + 8
                                                                                * ((995
                                                                                  * (((((v5 + 519) | 0xC8) - 1219) & v4) == (((v5 - 227) | 0x600) ^ 0x719))) ^ v5))
                                                                    - 4))(a1, a2, a3, (v3 - a3));
}

uint64_t sub_1000182E8@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W4>, char a5@<W5>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  int8x16x4_t v51;

  *(_DWORD *)(v46 - 120) = v45;
  *(_DWORD *)(v46 - 128) = v43;
  *(_DWORD *)(v46 - 136) = v43 & 0xFFFFFFF8;
  v47 = -8 - a3;
  v48 = a1 + v44;
  v49 = (v48 + a2 + v47 + 8);
  v51.val[0].i64[0] = ((_BYTE)v48 + (_BYTE)a2 + (_BYTE)v47 + 8) & 0xF;
  v51.val[0].i64[1] = (v42 + (_BYTE)v47 + 8) & 0xF;
  v51.val[1].i64[0] = (a5 + (_BYTE)v48 + 15 + (_BYTE)v47 + 8) & 0xF;
  v51.val[1].i64[1] = (a5 + (_BYTE)v48 + 14 + (_BYTE)v47 + 8) & 0xF;
  v51.val[2].i64[0] = (a5 + (_BYTE)v48 + 13 + (_BYTE)v47 + 8) & 0xF;
  v51.val[2].i64[1] = (a5 + (_BYTE)v48 + 12 + (_BYTE)v47 + 8) & 0xF;
  v51.val[3].i64[0] = (v42 + (_BYTE)v47 + 8 + ((a4 + 84) ^ 4)) & 0xF;
  v51.val[3].i64[1] = (a5 + (_BYTE)v48 + 10 + (_BYTE)v47 + 8) & 0xF;
  *(int8x8_t *)(a6 - 7 + v49) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v39 + (v49 & 0xF) - 7), *(int8x8_t *)(a6 - 7 + v49)), veor_s8(*(int8x8_t *)((v49 & 0xF) + v40 - 5), *(int8x8_t *)((v49 & 0xF) + v41 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v51, (int8x16_t)xmmword_100047730), (int8x8_t)0x7777777777777777)));
  return (*(uint64_t (**)(__n128))(a39 + 8 * ((45 * (-(v43 & 0xFFFFFFF8) == v47)) ^ a4)))((__n128)xmmword_100047730);
}

void sub_100018424()
{
  JUMPOUT(0x100018340);
}

uint64_t sub_10001842C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v3 = *(_DWORD *)(v2 - 128) == *(_DWORD *)(v2 - 136);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (a1 ^ ((32 * v3) | (v3 << 6))))
                            - ((79 * (a1 ^ 0x208)) ^ (a1 + 1762030942) & 0x96F98F9B ^ 4)))();
}

uint64_t sub_100018488@<X0>(int a1@<W3>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (a1 - 1329417967);
  *(_BYTE *)(a3 + v8) ^= *(_BYTE *)(v4 + (v8 & 0xF)) ^ *(_BYTE *)((v8 & 0xF) + v5 + 2) ^ *(_BYTE *)((v8 & 0xF) + v6 + 4) ^ (119 * (v8 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((56 * (a1 - 1 != v3)) ^ (a2 - 1665))) - 12))();
}

void sub_1000184F4()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 785517299)
    v1 = 2017444214;
  else
    v1 = -2017420626;
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_100018558(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;

  v1 = *(_DWORD *)(a1 + 32) ^ (535753261 * (((a1 | 0x3F53CC1) - (a1 & 0x3F53CC1)) ^ 0x90132EE));
  v3 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(*(_QWORD *)a1 - 0xAD445910E4CF18);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  v8 = &STACK[0x79262543413A967F];
  v9 = v2;
  v10 = v3;
  v11 = v1 + 235795823 * ((&v6 - 1802953736 - 2 * (&v6 & 0x94891BF8)) ^ 0x2452A1) + 435;
  ((void (*)(uint64_t *))*(&off_10005BF50 + v1 - 3))(&v6);
  v6 = *(_QWORD *)(v3 - 0xAD445910E4CF20);
  v8 = &STACK[0x79262543413A966F];
  LODWORD(v7) = v1
              + 3804331 * ((((2 * &v6) | 0x24D906D2) - &v6 - 309101417) ^ 0x9DC998AF)
              + 1647;
  sub_100027074((uint64_t)&v6);
  HIDWORD(v6) = v1
              - 1755732067 * ((2 * (&v6 & 0x7291AB68) - &v6 + 225334417) ^ 0xD3A8E94A)
              + 945;
  v7 = v4;
  sub_100010FA0((uint64_t)&v6);
  __asm { BR              X8 }
}

uint64_t sub_100018798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  *(_DWORD *)(v18 - 104) = v17
                         + 235795823 * ((2 * ((v18 - 144) & 0x56DD6590) - (v18 - 144) - 1457350033) ^ 0x3D8FD336)
                         + 135;
  *(_QWORD *)(v18 - 136) = v14;
  *(_QWORD *)(v18 - 128) = v14;
  *(_QWORD *)(v18 - 120) = a12;
  *(_QWORD *)(v18 - 112) = v15;
  *(_QWORD *)(v18 - 144) = v12;
  v19 = a11(v18 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13
                                                      + 8
                                                      * ((27
                                                        * (((((v17 - 312) | 0xC) + 256) ^ 0x8D0644CA) + v16 > 0x7FFFFFFE)) ^ ((v17 - 312) | 0xC)))
                                          - 8))(v19);
}

uint64_t sub_100018844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  *(_DWORD *)(v7 - 112) = v6
                        + 1225351577 * ((54402917 - ((v7 - 144) | 0x33E1F65) + ((v7 - 144) | 0xFCC1E09A)) ^ 0x823E7AA8)
                        + 1297;
  *(_QWORD *)(v7 - 144) = v2;
  *(_QWORD *)(v7 - 136) = v2;
  *(_QWORD *)(v7 - 128) = v4;
  *(_QWORD *)(v7 - 120) = v0;
  ((void (*)(uint64_t))((char *)*(&off_10005BF50 + (v6 ^ 0x1CF)) - 12))(v7 - 144);
  v8 = 535753261 * ((~((v7 - 144) | 0x71B4EA7E) + ((v7 - 144) & 0x71B4EA7E)) ^ 0x84BF1BAE);
  *(_DWORD *)(v7 - 144) = -1928968891 - v8 + v5;
  *(_DWORD *)(v7 - 140) = v6 - v8 + 191;
  *(_QWORD *)(v7 - 136) = v3;
  v9 = sub_100026760(v7 - 144);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (int)(((*(_DWORD *)(v7 - 128) == -729072096)
                                                   * (((v6 + 1920190060) & 0x8D8C39BF) - 390)) ^ v6)))(v9);
}

uint64_t sub_100018960()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((27 * (((v2 - 44) ^ 0x8D0644CA) + v1 > 0x7FFFFFFE)) ^ (v2 - 300)))
                            - 8))();
}

uint64_t sub_1000189A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;

  v5 = *(_QWORD *)(v9 + 24);
  v6 = 108757529 * ((((v4 - 144) | 0xDBA6EF8F) + (~(v4 - 144) | 0x24591070)) ^ 0x3B3A8DA5);
  *(_QWORD *)(v4 - 136) = v11;
  *(_DWORD *)(v4 - 144) = (v3 + 609) ^ v6;
  *(_DWORD *)(v4 - 140) = v6 ^ 0x4AF4E3E7;
  v7 = v0;
  sub_1000457D8((_DWORD *)(v4 - 144));
  *(_QWORD *)(v4 - 120) = v11;
  *(_QWORD *)(v4 - 112) = v2;
  *(_DWORD *)(v4 - 104) = v3
                        + 235795823 * ((2 * ((v4 - 144) & 0x7A33CFE0) - (v4 - 144) - 2050215910) ^ 0x11617943)
                        + 435;
  *(_QWORD *)(v4 - 144) = v7;
  *(_QWORD *)(v4 - 136) = v1;
  *(_QWORD *)(v4 - 128) = v1;
  v10(v4 - 144);
  *(_QWORD *)(v4 - 144) = v1;
  *(_DWORD *)(v4 - 136) = v3
                        + 3804331 * ((((v4 - 144) | 0xF76D89FF) - (v4 - 144) + ((v4 - 144) & 0x8927600)) ^ 0x78C89239)
                        + 1647;
  *(_QWORD *)(v4 - 128) = v5;
  return sub_100027074(v4 - 144);
}

uint64_t sub_100018AF8(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*(&off_100058280 + ((87 * (*(_DWORD *)(a2 + 4) == 1991213909)) ^ 0x513u)))(4294925278);
}

uint64_t sub_100018B38@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 468) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return (*(uint64_t (**)(_QWORD))(v2 + 11144))(0);
}

void sub_100018BA8()
{
  JUMPOUT(0x100018B78);
}

void sub_100018BB4(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x4CDEDD00D2C2D74FLL) - 1810582080;
  v3 = *(_DWORD *)(a1 + 20) + v1 + 1954283923;
  v4 = v2 < 0xA163D539;
  v5 = v2 > v3;
  if (v3 < 0xA163D539 != v4)
    v5 = v4;
  __asm { BR              X12 }
}

uint64_t sub_100018C8C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((224
                                          * (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + (v3 - 223289210))
                                             - ((*(unsigned __int8 *)(*(_QWORD *)(a1 + 40)
                                                                    + (v3 - 223289210)) << ((v1 ^ 0xAA) + 25)) & 0x42)
                                             - 1811463647) & 0x1F) != 30)) ^ v1 ^ 0x42B))
                            - 12))();
}

uint64_t sub_100018CF4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;

  v4 = v0 + 740382418 + ((v3 - 1538681325) & 0x5BB66746);
  v5 = ((v2 + 1270484290) < 0x59092CBA) ^ (v4 < 0x59092CBA);
  v6 = v2 + 1270484290 > v4;
  if (v5)
    v6 = (v2 + 1270484290) < 0x59092CBA;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (int)((v6 * (((v3 - 1538681325) ^ 0xA4499B9A) - 330)) | v3)) - 4))();
}

uint64_t sub_100018D7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;

  v5 = *(unsigned __int8 *)(v1 + (v3 + 1));
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v2 + 8 * (int)(((v5 >> 7) | (2 * (v5 >> 7))) ^ v4))
                                                  - 12))(a1, (v4 ^ 0xF7EFFE9E ^ v5) + 2 * v5 + ((v4 + 240) ^ 0x7EBF8118));
}

uint64_t sub_100018DD8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  int v5;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((418
                                * (((((17 * (a4 ^ 0x273) - 451) & (v5 + 1) ^ 0x55DFBFFF)
                                   + (((17 * (a4 ^ 0x273) - 451) & (v5 + 1)) << (a4 - 80))) & 0x55DFFFFC) == 1440727040)) | a4)))();
}

uint64_t sub_100018E3C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  unsigned int v12;
  _BOOL4 v13;
  BOOL v14;

  v10 = a4 + 701;
  v11 = a4 - 96;
  v12 = v9 + a7 + a4 - 1476965217;
  v13 = v12 < 0xB262E67;
  v14 = v12 > v7 - 566338879;
  if ((v7 - 566338879) < 0xB262E67 != v13)
    v14 = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((41 * ((v11 ^ v14) & 1)) ^ v10)) - 8))();
}

uint64_t sub_100018EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v7 + (v10 + v9 + 2));
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v8
                                                              + 8 * ((518 * (a7 != 1440727040)) | v11 & 0x722DDB6Fu))
                                                  - 12))(a1, (v12 ^ 0xFEEF83FF) + 2 * v12 + 2009071433);
}

uint64_t sub_100018F50(uint64_t a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v8 + (v11 + a4)) | ((a2 << (a8 ^ 0x51)) + 1350350848);
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v9 + 8 * ((854 * (v10 - 1 == a5)) ^ a8)) - 12))(a1, (v12 ^ 0xF6FF975F) + 2142235625 + ((2 * v12) & 0xEDFF2EBE));
}

uint64_t sub_100018FC4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v13 = a2 + v10 + v11 + v12 + 220860657 + ((2 * (a8 ^ 0x31B)) ^ 0x56FBBA68);
  v14 = v8 + 287071990;
  v15 = (v14 < 0x3E04329C) ^ (v13 < 0x3E04329C);
  v16 = v13 > v14;
  if (v15)
    v16 = v13 < 0x3E04329C;
  return (*(uint64_t (**)(void))(v9 + 8 * ((511 * !v16) ^ ((a8 ^ 0x31B) + 15))))();
}

uint64_t *sub_100019054@<X0>(uint64_t *result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = v6 ^ 0x18A;
  v9 = result[6];
  v11 = *result;
  v10 = result[1];
  *a3 = v8 + v5 + 642164412;
  *(_DWORD *)(v11 - 0x30A48DFCEFC5E18FLL) = v4;
  *(_DWORD *)(v9 - 0x3BFE8E53F98A3C43) = a2;
  *(_QWORD *)(v10 - 0x54BE37768DEB6754) = v3 + (v7 - 1884876904);
  *((_DWORD *)result + 8) = 2017444214;
  return result;
}

uint64_t sub_1000190D8(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v1 = *(_DWORD *)a1 + 108757529 * ((2 * (a1 & 0x5EAB9BD4) - a1 - 1588304853) ^ 0x41C80600) + 4;
  v2 = v1 + *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x79262543413A964BLL);
  v4 = v2 - 137555361;
  v3 = v2 - 137555361 < 0;
  v5 = 137555361 - v2;
  if (!v3)
    v5 = v4;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v1 ^ 0xA5))
                              + ((((v5 ^ 0x7FFF3FFC) - 2147434493 + ((2 * v5) & 0xFFFE7FF8) < (((v1 - 36) | 0x20) ^ 0x7FFFFF93u))
                                * (((v1 - 1500483586) & 0x596F8FFD) + 519)) ^ v1))
                            - 4))();
}

uint64_t sub_100019204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                                 + 8
                                                                                 * (int)((28
                                                                                        * (*(_DWORD *)(*v3 + 4 * v4) != (_DWORD)a2)) ^ a3))
                                                                     - 4))(a1, a2, a3, 1898261415);
}

void sub_100019234()
{
  JUMPOUT(0x1000191C4);
}

uint64_t sub_100019244(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(result + 4) = a4;
  return result;
}

uint64_t sub_10001924C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 1755732067 * ((a1 - 903090360 - 2 * (a1 & 0xCA2BEF48)) ^ 0x14ED5293);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v1 ^ 0x348))
                              + ((1437
                                * (((*(_QWORD *)(a1 + 8) == 0x43C85E0409B7388DLL) ^ (v1 - 48)) & 1)) ^ v1))
                            - 4))();
}

uint64_t sub_1000192E4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8 * ((240 * (*(_DWORD *)(v1 - 0x43C85E0409B73875) != 2017444214)) ^ v2))
                            - ((v2 + 48) ^ 0x399)))();
}

uint64_t sub_100019330()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x43C85E0409B7387DLL) + 1693395917;
  v4 = *(_DWORD *)(v1 - 0x43C85E0409B73881) + 627055685;
  v5 = v4 < 0x7D95845E;
  v6 = v3 < v4;
  if (v3 < 0x7D95845E != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1370 * v6) ^ v2)) - 4))();
}

_DWORD *sub_1000193BC@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  _DWORD *v2;

  *v2 = a2;
  *result = -2017420733;
  return result;
}

uint64_t sub_1000193D0(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = 3804331 * ((((2 * (_DWORD)a1) | 0xB15C7908) - (_DWORD)a1 - 1487813764) ^ 0xD70B2742);
  v2 = a1[1] + v1;
  return (*((uint64_t (**)(void))*(&off_10005BF50 + (int)(v2 ^ 0x47F))
          + (int)((((*a1 ^ v1 ^ 0x783FC176) - 1 > 0x62)
                 * (((v2 - 374744735) ^ 0x16562000) + ((v2 - 374744735) & 0x165623FF))) ^ v2)))();
}

uint64_t sub_100019474()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((26 * (v0 - 100 >= (((v1 + 629) | 0x2A) ^ 0x436))) ^ v1)) - 8))();
}

uint64_t sub_1000194B4@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;

  if (v2 + 49998 < (v4 + 7475))
    v3 = a2;
  *(_DWORD *)(*(_QWORD *)(result + 8) - 0x4EC116CC59E1F3EDLL) = v3;
  return result;
}

void sub_10001952C(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  int v6;
  int v7;
  int v8;

  v1 = 460628867 * (((a1 | 0x7391008F) - a1 + (a1 & 0x8C6EFF70)) ^ 0x3F0782F2);
  v2 = *(_DWORD *)(a1 + 8) + v1;
  v3 = *(_DWORD *)(a1 + 24) + v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x79262543413A964BLL);
  v6 = v4 - 137555249;
  v5 = v4 - 137555249 < 0;
  v7 = 137555249 - v4;
  if (v5)
    v8 = v7;
  else
    v8 = v6;
  __asm { BR              X12 }
}

uint64_t sub_100019610()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((462 * (((v0 == 794068634) ^ (((v2 - 107) | 0x42) + 59)) & 1)) ^ ((v2 - 619) | 0x42)))
                            - 4))();
}

uint64_t sub_100019658(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  _BOOL4 v4;

  v3 = ((v2 | 0x218) - 828) | 0xD0;
  v4 = ((v3 + 700015918) & 0xD6469AF3 ^ 0xD3) != 32;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1
                                                                                 + 8 * (((2 * v4) | (32 * v4)) ^ v3))
                                                                     - (((v3 + 56) | 0x234u) ^ 0x331)))(a1, 700015918, 3594951411, 211);
}

uint64_t sub_100019730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v14;

  v14 = v10 + a7 > a8 || v10 + a7 < v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v12 ^ (v14 * v11))) - ((v12 + 586) ^ a5)))();
}

uint64_t sub_100019768@<X0>(_QWORD *a1@<X0>, int a2@<W5>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;
  char v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v13 = (v12 + v9) & v10;
  *(_BYTE *)(*a1 + (v13 + v3 + a3 + 982)) = *(_DWORD *)(*v7 + 4 * ((v13 ^ v11) + v8)) ^ v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((((v13 - 620) ^ a2) * (v3 - 1 == v5)) ^ v13)) - 4))();
}

void sub_1000197D4()
{
  JUMPOUT(0x1000196F8);
}

uint64_t sub_1000197DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 28) = v1;
  return result;
}

void sub_1000197F8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_10001986C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, int a17)
{
  int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;

  a16 = (1178560073 * ((2 * (&a16 & 0x52392F10) - &a16 + 768004332) ^ 0x9752A88E)) ^ 0xE1F2694A;
  v20 = sub_100045A38(&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((2028 * (a17 == v17)) ^ v19)) - 12))(v20);
}

uint64_t sub_100019904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t *a16, int a17, unsigned int a18)
{
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  a18 = 1497
      - 460628867
      * (((&a16 | 0xDBE923A9) - &a16 + (&a16 & 0x2416DC50)) ^ 0x977FA1D4);
  a16 = &STACK[0x45F55F544B4A64C9];
  sub_10002483C((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 - 2963656559 + *(_QWORD *)(v19 + 8 * ((586 * (a17 == v18)) ^ 0x150u))))(v21, v22, v23, v24, v25, v26, v27, v28, a9);
}

uint64_t sub_1000199A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, unint64_t *a19, unsigned int a20,unsigned int a21)
{
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;

  v24 = 1755732067 * ((&a16 + 1504961492 - 2 * ((unint64_t)&a16 & 0x59B3E3D4)) ^ 0x87755E0F);
  a17 = v24 ^ 0x4583020D;
  a20 = v24 ^ 0x874EE385;
  a21 = v24 ^ 0xE7A6325D;
  a18 = a13;
  a19 = &STACK[0x28B7397347159521];
  v25 = sub_1000458EC((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22
                                                      + 8
                                                      * (((a16 == v21) * ((v23 - 19061706) & 0x507D13BE ^ 0x3C0)) ^ 0xBCu))
                                          - 4))(v25);
}

uint64_t sub_100019A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, unsigned int a16, unint64_t *a17, unint64_t *a18)
{
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  void (*v22)(unsigned int *);
  uint64_t v23;

  a17 = &STACK[0x77F38C6ED9C42FA0];
  a18 = a14;
  a16 = (v21 - 445) ^ (1374699841 * ((&a16 & 0x3A281C42 | ~(&a16 | 0x3A281C42)) ^ 0xA823FBB4));
  v22 = (void (*)(unsigned int *))(*(_QWORD *)(v19 + 8 * (v21 ^ 0x3DA)) - 12);
  v22(&a16);
  a16 = (v21 - 445) ^ (1374699841
                     * ((((2 * &a16) | 0xF610D1B2) - &a16 - 2064148697) ^ 0x16FC70D0));
  a17 = &STACK[0x77F38C6ED9C42FA4];
  a18 = a14;
  v22(&a16);
  a16 = (v21 - 445) ^ (1374699841
                     * ((((&a16 | 0x3FC1A968) ^ 0xFFFFFFFE) - (~&a16 | 0xC03E5697)) ^ 0xADCA4E9E));
  a17 = &STACK[0x77F38C6ED9C42FBC];
  a18 = a14;
  v22(&a16);
  LODWORD(a18) = v21
               - 1755732067
               * (((&a16 ^ 0x3C32CFEE) + 814069247 - 2 * ((&a16 ^ 0x3C32CFEE) & 0x3085B5FF)) ^ 0xD271C7CA)
               - 21;
  a17 = a14;
  v23 = sub_10001924C((uint64_t)&a16);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((1867 * (a16 == v21 + v20 - 946212345)) ^ v21)))(v23);
}

uint64_t sub_100019C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  uint64_t v16;
  int v17;
  unsigned int v18;

  return (*(uint64_t (**)(void))(v16 + 8 * ((1855 * (a16 == ((v18 - v17 + 329) ^ 0xC89A0E19))) ^ v18)))();
}

uint64_t sub_100019C78@<X0>(int a1@<W8>)
{
  int *v1;
  unsigned int *v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  void (*v8)(_BYTE *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[4];
  unsigned int v14;
  uint64_t v15;

  v6 = (v5 - 139473971) & 0xB8F5FFEF;
  *v2 = v9 ^ a1 ^ v6;
  *v1 = v10 ^ v3;
  v14 = v4 + 535753261 * ((v13 & 0xA9ABCCEA | ~(v13 | 0xA9ABCCEA)) ^ 0x5CA03D3A) + v6;
  v15 = v12;
  v8(v13);
  v15 = v11;
  v14 = v4
      + 535753261
      * (((v13 | 0x5A0877C7) - v13 + (v13 & 0xA5F78838)) ^ 0x50FC79E8)
      + v6;
  v8(v13);
  return v3 ^ 0x783FC176u;
}

void sub_100019DAC(uint64_t a1)
{
  int v1;
  unsigned int v2;
  _BYTE v4[4];
  unsigned int v5;
  int v6;
  unint64_t *v7;

  v1 = *(_DWORD *)(a1 + 24) ^ (108757529 * (a1 ^ 0xE09C622B));
  v2 = 235795823 * ((1211322473 - (v4 | 0x48335069) + (v4 | 0xB7CCAF96)) ^ 0x2361E6CF);
  v5 = v2 - 953040206;
  v6 = v1 - v2 - 1882357513;
  v7 = &STACK[0x133E1E075B35BEEB];
  sub_100021DEC((uint64_t)v4);
  __asm { BR              X12 }
}

uint64_t sub_10001A1DC(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;

  v9 = v5 + a3;
  if (v9 <= 0x40)
    v9 = 64;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7
                                                     + 8
                                                     * ((((v8 + 34) ^ (v8 - 278) ^ 0x116) * (v6 - v3 - v4 + v9 < 0xF)) ^ (v8 - 913))))(2453094833, 4064961680);
}

uint64_t sub_10001A268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  _BOOL4 v33;

  v31 = v27 + v26 + a3;
  if (v31 <= 0x40)
    v32 = 64;
  else
    v32 = v31;
  v33 = !__CFADD__(v31 + ((401 * (v28 ^ 0x5FC) + 345430972) & 0xEB6925E7) - 1223, v29 + v32);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((1004 * v33) ^ v28)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_10001A2DC@<X0>(int a1@<W0>, uint64_t a2@<X4>, _OWORD *a3@<X7>, int a4@<W8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;

  *(_OWORD *)(a2 + (a4 + a1)) = *a3;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((466
                                * ((((v5 - 50) ^ 0x1FFFFFD00) & (v4 + 1)) - (v5 - 189) != -597)) ^ (v5 - 50))))();
}

uint64_t sub_10001A338(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  *(_OWORD *)(a5 + (v10 + v11)) = *(_OWORD *)(a8 + v11);
  return (*(uint64_t (**)(void))(v12 + 8 * (((v9 != v11) * a3) ^ v8)))();
}

uint64_t sub_10001A360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v28 + 609 + 10 * (v28 ^ 0x266) - 88) * (v26 == v27)) ^ v28)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_10001A3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,int a28,unint64_t a29)
{
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  BOOL v42;
  _BOOL4 v45;
  uint64_t (*v46)(uint64_t, uint64_t, unint64_t *);

  v46 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t *))(v32 + 8 * v29);
  v35 = STACK[0x2E4];
  v36 = STACK[0x2E8];
  v37 = STACK[0x2EC];
  v38 = STACK[0x2E8];
  v39 = STACK[0x2EC];
  v40 = LOBYTE(STACK[0x2F8]) ^ 0xED;
  if (v40 == 2)
  {
    v45 = (unint64_t)&STACK[0x298] < a29 && v34 < (unint64_t)&STACK[0x2D8];
    return (*(uint64_t (**)(uint64_t))(v32 + 8 * (((a28 + v30 + 479) * v45) ^ (v30 + 469))))(58663199);
  }
  else if (v40 == 1)
  {
    v42 = (unint64_t)&STACK[0x298] < a29 && v34 < (unint64_t)&STACK[0x2D8];
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v32
                                                        + 8
                                                        * ((1046 * ((v42 ^ (v30 + 52)) & 1)) ^ (v30 + 351)))
                                            - (3 * a27)
                                            + 353))(850898926);
  }
  else
  {
    LODWORD(STACK[0x2E0]) = 2 * (LODWORD(STACK[0x2E0]) ^ v31) + v31 - (v33 & (4 * (LODWORD(STACK[0x2E0]) ^ v31)));
    LODWORD(STACK[0x2E4]) = 2 * (v35 ^ v31) + v31 - (v33 & (4 * (v35 ^ v31)));
    LODWORD(STACK[0x2E8]) = (v38 ^ v31) + (v36 ^ v31) + v31 - (v33 & (2 * ((v38 ^ v31) + (v36 ^ v31))));
    LODWORD(STACK[0x2EC]) = (v39 ^ v31) + (v37 ^ v31) + v31 - (v33 & (2 * ((v39 ^ v31) + (v37 ^ v31))));
    return v46(1032081454, a2, &STACK[0x298]);
  }
}

uint64_t sub_10001B928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,uint64_t a30,uint64_t a31,uint64_t a32,unsigned int a33)
{
  int v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;

  if (a33 < 0xE8C80D16 != (a29 - 1348555956) < 0xE8C80D16)
    v36 = (a29 - 1348555956) < 0xE8C80D16;
  else
    v36 = a29 - 1348555956 > a33;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 + 8 * (v36 | (2 * v36) | (v33 + 263)))
                                                            - ((v35 - 110) ^ ((v33 + 1107) | 0x201u))))(a1, a2, 206);
}

uint64_t sub_10001B9C0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  unsigned int v6;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((496 * (((v6 - 64) ^ (v4 + a4 + v6 - 1023 - 697 < v4 + a4)) & 1)) ^ v6)))();
}

uint64_t sub_10001BA14@<X0>(int a1@<W0>, int a2@<W3>, int8x16_t *a3@<X4>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int8x16_t v36;
  int8x16_t v37;

  *a3 = vaddq_s8(vsubq_s8(*(int8x16_t *)(a32 + (v32 + a2)), vandq_s8(vaddq_s8(*(int8x16_t *)(a32 + (v32 + a2)), *(int8x16_t *)(a32 + (v32 + a2))), v37)), v36);
  return ((uint64_t (*)(void))(*(_QWORD *)(v35 + 8 * (int)(v34 ^ ((a4 & 0xB75C2379) + 711)))
                            - (((a4 & 0xB75C2379) + a1) & v33)
                            + 17))();
}

uint64_t sub_10001BA80(uint64_t a1, uint64_t a2, char a3, int a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  int v12;

  *(_BYTE *)(a5 + v6) = *(_BYTE *)(v8 + (v5 + a4))
                      - ((*(_BYTE *)(v8 + (v5 + a4)) << (((v7 + v9) & v10) - 28)) & a3)
                      - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((v6 != 63) * v12) ^ v7)) - 12))();
}

uint64_t sub_10001BAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34)
{
  int v34;
  uint64_t v35;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v35
                                                               + 8
                                                               * ((67 * (((a11 + 737) ^ 0xDCFC5490) + a34 < 0xFFFFFFFB)) ^ (v34 + 1388)))
                                                   - 4))(a1, a2);
}

void sub_10001BB2C()
{
  JUMPOUT(0x10001AC74);
}

uint64_t sub_10001BB58()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((950 * (v0 - 1667689646 < ((v2 + 1042) ^ 0x47Bu))) ^ (v2 + 1410)))
                            - 12))();
}

uint64_t sub_10001BBA0()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v0;
  v5 = v2 + v0;
  if ((unint64_t)(v5 + 1) > 0x38)
    v6 = v5 + 1;
  else
    v6 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((v1 ^ 0x472) + v1 - 637 - 484)
                                          * ((unint64_t)(v6 - v4 + 1667689646) < 8)) ^ v1))
                            - 12))();
}

uint64_t sub_10001BBFC@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  *(_QWORD *)(a1 + a2 + v4) = v6;
  v7 = (((v3 - 390) | 0x410u) ^ 0x458) != (((v3 - 63) - 399) & v2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((v7 | (v7 << 6)) ^ (v3 - 63))) - 4))();
}

uint64_t sub_10001BC54()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v2 + (v2 ^ 0x461) - 670) * (v0 == v1)) ^ v2)) - 12))();
}

uint64_t sub_10001BC88@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  *(_BYTE *)(a1 + a2 + v4) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((unint64_t)(a2 + 1 + v4) > 0x37) * v3) ^ (v2 + 299)))
                            - 12))();
}

void sub_10001BCB8()
{
  char v0;
  int v1;
  char v2;
  unsigned int v3;
  unsigned int v4;
  unint64_t v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;

  v1 = LOBYTE(STACK[0x2F8]) ^ 0xED;
  if (v1 == 1)
  {
    v8 = STACK[0x2DC];
    v9 = STACK[0x2D8];
    v10 = (LODWORD(STACK[0x2DC]) >> 5) ^ 0xFFFFFFC4;
    LOBYTE(STACK[0x2D0]) = ((8 * LOBYTE(STACK[0x2DC])) ^ 0x58) - ((2 * ((8 * LOBYTE(STACK[0x2DC])) ^ 0x58)) & 0xC0) - 25;
    v6 = -50;
    LOBYTE(STACK[0x2D1]) = v10 - ((v10 << (((v0 - 112) ^ 0xC0) & 0xD3)) & 0xCE) - 25;
    LOBYTE(STACK[0x2D2]) = ((v8 >> 13) ^ 0xF7) - 2 * (((v8 >> 13) ^ 0xF7) & 0xEF ^ (v8 >> 13) & 8) - 25;
    LOBYTE(STACK[0x2D3]) = ((v8 >> 21) ^ 0x2F) - ((2 * ((v8 >> 21) ^ 0x2F)) & 0xCF) - 25;
    HIDWORD(v11) = v9 ^ 0x18;
    LODWORD(v11) = v8 ^ 0xC0000000;
    LOBYTE(STACK[0x2D4]) = (v11 >> 29) - ((2 * (v11 >> 29)) & 0xCF) - 25;
    LOBYTE(STACK[0x2D5]) = ((v9 >> 5) ^ 0x8B) - ((2 * ((v9 >> 5) ^ 0x8B)) & 0xCF) - 25;
    LOBYTE(STACK[0x2D6]) = ((v9 >> 13) ^ 0xCC) - ((2 * ((v9 >> 13) ^ 0xCC)) & 0xCF) - 25;
    v2 = (v0 - 112) | 0x2C;
    v7 = (v9 >> 21) ^ 0xFFFFFFA0;
  }
  else
  {
    if (v1 != 2)
      goto LABEL_6;
    v2 = v0 ^ 0xDC;
    v7 = STACK[0x2D8];
    v3 = STACK[0x2DC];
    v4 = (LODWORD(STACK[0x2D8]) >> ((v0 ^ 0xDC) + 40)) ^ 0xFFFFFFA0;
    LOBYTE(STACK[0x2D0]) = v4 - ((2 * v4) & 0xCF) - 25;
    LOBYTE(STACK[0x2D1]) = ((v7 >> 13) ^ 0xCC) - ((2 * ((v7 >> 13) ^ 0xCC)) & 0xCF) - 25;
    HIDWORD(v5) = v7 ^ 0x18;
    LODWORD(v5) = v3 ^ 0xC0000000;
    LOBYTE(STACK[0x2D2]) = ((v7 >> 5) ^ 0x8B) - ((2 * ((v7 >> 5) ^ 0x8B)) & 0xCF) - 25;
    LOBYTE(STACK[0x2D3]) = (v5 >> 29) - ((2 * (v5 >> 29)) & 0xCF) - 25;
    LOBYTE(STACK[0x2D4]) = ((v3 >> 21) ^ 0x2F) - ((2 * ((v3 >> 21) ^ 0x2F)) & 0xCF) - 25;
    LOBYTE(STACK[0x2D5]) = ((v3 >> 13) ^ 0xF7) - 2 * (((v3 >> 13) ^ 0xF7) & 0xEF ^ (v3 >> 13) & 8) - 25;
    LOBYTE(STACK[0x2D6]) = ((v3 >> 5) ^ 0xC4) - 2 * (((v3 >> 5) ^ 0xC4) & 0xEF ^ (v3 >> 5) & 8) - 25;
    v6 = -64;
    LOBYTE(v7) = (8 * v3) ^ 0x58;
  }
  LOBYTE(STACK[0x2D7]) = ((v2 + 68) ^ 0xD6) + v7 - (v6 & (2 * v7));
LABEL_6:
  JUMPOUT(0x10001AC70);
}

uint64_t sub_10001BEFC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * (((((v1 - 1492486726) & 0x58F58771) + 1602)
                                                        * ((v2 + v0 + 770) < 4)) ^ v1))
                                          - ((v1 - 677) | 0x8Au)
                                          + 226))(3707524184);
}

uint64_t sub_10001BF58@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  int v2;
  unsigned int v3;
  uint64_t v4;

  LOBYTE(STACK[0x298]) = *(_BYTE *)(a1 + v3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1007 * ((v2 + 771) > 3)) ^ a2)) - 8))();
}

void sub_10001BF88()
{
  JUMPOUT(0x10001A400);
}

uint64_t sub_10001BFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  int v38;
  uint64_t v39;

  if (a34 == 2)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39
                                                                                   + 8
                                                                                   * ((19
                                                                                     * (LODWORD(STACK[0x2F4]) != 62745804)) ^ (v38 + 882)))
                                                                       - (v38 ^ 0x392u)
                                                                       + 927))(a1, a2, 235795823, a17);
  if (a34 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39
                                                                                   + 8
                                                                                   * ((2015
                                                                                     * (LODWORD(STACK[0x2F4]) != 62745804)) ^ (v38 + 882)))
                                                                       - ((v38 - 1236353146) & 0x49B143EB ^ 0x3A7)))(a1, a2, 235795823, a17);
  LOBYTE(STACK[0x2F3]) = ((((unint64_t)&a38 ^ 0xFFF7E57DFEDE3EDFLL) + 33 + ((v38 - 120) & (2 * (_QWORD)&a38))) ^ 0xBA)
                       * (((unint64_t)&a38 ^ 0xFFF7E57DFEDE3EDFLL)
                        + 33
                        + ((v38 - 120) & (2 * (_QWORD)&a38))
                        + 17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39
                                                                       + 8
                                                                       * ((((v38 - 48) | 0x30) - 43) ^ (v38 + 1416))))(a1, a2, 235795823, a17);
}

void sub_10001C320()
{
  JUMPOUT(0x10001C2F4);
}

uint64_t sub_10001C328@<X0>(int a1@<W2>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[39];

  v3 = *(_QWORD *)(v7 + 32);
  v4 = *(_QWORD *)(v7 + 40);
  v8[0] = 0xE7E7E7E7E7E7E7E7;
  v8[1] = 0xE7E7E7E7E7E7E7E7;
  v5 = (((v2 - 160) & 0xA46671A9 | ~((v2 - 160) | 0xA46671A9)) ^ 0xCF34C70F) * a1;
  *(_QWORD *)(v2 - 160) = v3;
  *(_QWORD *)(v2 - 120) = v8;
  *(_DWORD *)(v2 - 124) = (a2 + 1768) ^ v5;
  *(_QWORD *)(v2 - 144) = v2 - 180;
  *(_QWORD *)(v2 - 136) = v4;
  *(_DWORD *)(v2 - 152) = v5 + 1947394857;
  result = ((uint64_t (*)(uint64_t))*(&off_10005BF50 + (a2 ^ 0x87)))(v2 - 160);
  *(_DWORD *)(v7 + 16) = *(_DWORD *)(v2 - 128);
  return result;
}

void sub_10001C404()
{
  _DWORD v0[8];

  v0[0] = (1178560073 * ((((2 * v0) | 0xAAB34380) - v0 - 1431937472) ^ 0xEFCDD9A2)) ^ 0xE1F2694A;
  sub_100045A38(v0);
  __asm { BR              X8 }
}

uint64_t sub_10001C4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unint64_t *a20,int a21,unsigned int a22)
{
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  a20 = &STACK[0x45F55F544B4A64E1];
  a22 = 1497
      - 460628867
      * ((-1402127699 - (&a20 ^ 0xA1613669 | 0xAC6D3AAD) + (&a20 ^ 0xA1613669 | 0x5392C552)) ^ 0xBE657146);
  sub_10002483C((uint64_t)&a20);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * ((44 * (a21 == (v22 ^ 0xBBE67587) - 1134997198)) | v22)))(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13);
}

uint64_t sub_10001C584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned int a20,int a21,uint64_t a22,int a23)
{
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;

  v28 = 1225351577 * (((&a20 | 0x7B9B81A3) + (~&a20 | 0x84647E5C)) ^ 0x5641B90);
  a20 = v24 - ((2 * v24) & 0x6D2D202A) - v28 + ((14 * ((v23 + 1457) ^ 0xBBE67044)) ^ 0xB6969661);
  a21 = v28 ^ 0x316;
  a22 = a16;
  v29 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v26 + 224) - 8))(&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * ((125 * (a23 != v25)) ^ 0x609u)) - 8))(v29);
}

uint64_t sub_10001C674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,uint64_t a22,unint64_t *a23,int a24,unsigned int a25)
{
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;

  v29 = 1755732067 * (&a20 ^ 0xDEC6BDDB);
  a24 = (v25 - 2024874735) ^ v29;
  a25 = v29 ^ 0xF8713EA4;
  a21 = v29 ^ 0x4583020D;
  a22 = a16;
  a23 = &STACK[0x28B7397347159539];
  v30 = sub_1000458EC((uint64_t)&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v28
                                                      + 8
                                                      * (((a20 == v27) * ((v25 - v26 + 176713661) & 0x39911E76 ^ 0x317)) ^ v25))
                                          - 8))(v30);
}

uint64_t sub_10001C730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, uint64_t a19, unsigned int a20,unint64_t *a21,unint64_t *a22)
{
  int v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  void (*v27)(unsigned int *);
  uint64_t v28;

  a20 = (v25 - 129) ^ (1374699841
                     * ((2 * (&a20 & 0x54F9DA60) - &a20 - 1425660514) ^ 0xC6F23D97));
  a21 = &STACK[0x77F38C6ED9C42FD8];
  a22 = a17;
  v27 = (void (*)(unsigned int *))(*(_QWORD *)(v24 + 8 * (int)(v25 - 526)) - 12);
  v27(&a20);
  a20 = (v25 - 129) ^ (1374699841
                     * (((&a20 | 0xA4701DEF) + (~&a20 | 0x5B8FE210)) ^ 0xC98405E7));
  a21 = &STACK[0x77F38C6ED9C42FDC];
  a22 = a17;
  v27(&a20);
  a20 = (v25 - 129) ^ (1374699841
                     * (((&a20 | 0x724CF555) - (&a20 & 0x724CF555)) ^ 0x1FB8ED5C));
  a21 = &STACK[0x77F38C6ED9C42FD0];
  a22 = a17;
  v27(&a20);
  a20 = (v25 - 129) ^ (1374699841
                     * ((((2 * &a20) | 0xE28A525E) - &a20 + 247125713) ^ 0x9CB13126));
  a21 = &STACK[0x77F38C6ED9C42FD4];
  a22 = a17;
  v27(&a20);
  LODWORD(a22) = v25 - ((&a20 & 0xF822126F | ~(&a20 | 0xF822126F)) ^ 0xD91B504B) * v23 + 295;
  a21 = a17;
  v28 = sub_10001924C((uint64_t)&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26
                                                      + 8
                                                      * ((((a20 == ((v25 - v22) ^ 0xC3D9B132)) << 6) | ((a20 == ((v25 - v22) ^ 0xC3D9B132)) << 7)) ^ v25))
                                          - 8))(v28);
}

uint64_t sub_10001C920@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  unsigned int v12;
  uint64_t v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((1240 * (a12 == a1)) ^ v12)) - 8))();
}

uint64_t sub_10001C944()
{
  int v0;
  void (*v1)(_BYTE *);
  int v2;
  int v3;
  int *v5;
  unsigned int *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  _BYTE v13[4];
  unsigned int v14;
  uint64_t v15;

  *v7 = v11 ^ v2;
  *v5 = v12 ^ v2;
  *v6 = v3 ^ 0xBBE67232 ^ v0 ^ v10;
  v15 = v9;
  v14 = 535753261 * ((-863361720 - (v13 | 0xCC8A2548) + (v13 | 0x3375DAB7)) ^ 0x3981D498)
      + 1142526514
      + (v3 ^ 0xBBE67232)
      + 645;
  v1(v13);
  v14 = 535753261
      * (((v13 | 0x27283D55) - v13 + (v13 & 0xD8D7C2A8)) ^ 0x2DDC337A)
      + 1142526514
      + (v3 ^ 0xBBE67232)
      + 645;
  v15 = v8;
  v1(v13);
  return v2 ^ 0x783FC176u;
}

uint64_t sub_10001CA90(_DWORD *a1, uint64_t a2)
{
  _BOOL4 v2;

  v2 = (*a1 + *(_DWORD *)(a2 + 4) + 1252765349) > 0xC8;
  return ((uint64_t (*)(void))*(&off_100058280 + (((16 * v2) | (32 * v2)) ^ 0x9Eu)))();
}

uint64_t sub_10001CAD4()
{
  return 4294925278;
}

uint64_t sub_10001CADC@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((23 * (v1 != 1991213896)) ^ 0x543u)) - 4))();
}

uint64_t sub_10001CB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;

  *(_BYTE *)(a1 + (v3 - 1050988052) + 4) = **(_BYTE **)(a2 + 8) + 82;
  v5 = *(_DWORD *)(a2 + 4) + 2076081263;
  v6 = (v4 ^ 0xF26DFEF4) < v5;
  if (v5 < 0xF26DFFB7)
    v6 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * ((1039 * !v6) ^ v4)) - 4))();
}

void sub_10001CBC8()
{
  JUMPOUT(0x10001CB54);
}

uint64_t sub_10001CBD0(_DWORD *a1)
{
  int v1;
  int v2;

  *((_BYTE *)a1 + v1 + ((v2 - 8687795) & 0xFFD4DFFD) - 1039474185) = 82;
  *a1 = v1;
  return 0;
}

void sub_10001CC0C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

uint64_t sub_10001CC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((618 * (**(_BYTE **)(a2 + 8) == 0)) ^ v3)) - 8))();
}

uint64_t sub_10001CC7C()
{
  uint64_t v0;
  int v1;
  unsigned int v2;

  v2 = v1 - ((2 * v1 + 312539502) & 0xB88D1BC2) + 1704397464;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((511
                                          * ((v2 ^ 0x82A92A36) - 655508 + ((2 * v2) & 0xBDDF4FAE ^ 0xB88D0B82) == 1592108867)) ^ 0xEBu))
                            - 4))();
}

uint64_t sub_10001CD28(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 1424) = ((v3 + 658503778) & 0xFDF2EBF6 ^ 0x99C30A25) + v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 520) = *(_QWORD *)(a2 + 8) + 1;
  return 0;
}

void sub_10001D0A8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 28) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X9 }
}

uint64_t sub_10001D168@<X0>(uint64_t a1@<X8>, unsigned int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  _DWORD *v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;

  v10 = *(_DWORD *)(v5 - 0x43C85E0409B7387DLL);
  v11 = 1178560073 * (((&a2 | 0xB78A9F27) + (~&a2 | 0x487560D8)) ^ 0xD1EE744);
  a2 = v11 + 2004994174;
  a3 = v11 + v10 + ((v9 + 304) | 0x411) + 1513223242;
  a5 = (v9 + 1398) ^ v11;
  a4 = v5;
  v12 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(a1 + 8 * (v9 ^ 0x1EE)) - 12))(&a2);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v8 + 8 * ((1318 * (*v7 == v6)) ^ v9)) - 8))(v12);
}

uint64_t sub_10001D234()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1 + 8 * (((*v0 != 0x440BBB7769F03182) * (169 * (v2 ^ 0x691) - 325)) ^ v2)))();
}

uint64_t sub_10001D274()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  int v4;
  _DWORD *v5;
  uint64_t v6;

  *(_QWORD *)(v1 - 0x440BBB7769F03182) = (*v3 - 413554833)
                                         + *(_QWORD *)(v2 - 0x43C85E0409B7388DLL)
                                         + 8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((4 * (*v5 == v4)) | (8 * (*v5 == v4))) ^ v0)) - 8))();
}

void sub_10001D2D8(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v5 = *(_QWORD *)(v2 + v1);
  v6 = *v3 + a1;
  *(_BYTE *)(v5 + v6) = -25;
  *(_BYTE *)(v5 + v6 + 1) = 28;
  *(_BYTE *)(v5 + v6 + 2) = -2;
  *(_BYTE *)(v5 + v6 + 3) = -65;
  v7 = *(_QWORD *)(v2 + v1);
  v8 = ((2 * (a1 + *v3 + 4)) & 0xFEE4E34E) + ((a1 + *v3 + 4) ^ 0x7F7271A7) - 2138206631;
  *(_BYTE *)(v7 + v8) = -25;
  *(_BYTE *)(v7 + v8 + 1) = -25;
  *(_BYTE *)(v7 + v8 + 2) = -25;
  *(_BYTE *)(v7 + v8 + 3) = -29;
  *v3 = v4 + 12;
}

void sub_10001D3BC(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_10001D3FC()
{
  return 4294925273;
}

void sub_10001D468(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_10001D4D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W8>)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4
                                                                       + 8
                                                                       * ((59
                                                                         * (((a4 - 1991213896) ^ 0x641F7F3D4F7FFE7BLL)
                                                                          + ((2 * (a4 - 1991213896)) & 0x9EFFFCF6)
                                                                          - 0x641F7F3D4CABF41ALL != 47450721)) ^ 0x49Bu)))(a1, a2, a3, 2275432328);
}

uint64_t sub_10001D570(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v9 = *(unsigned __int8 *)(v7 + v6 - 0x41E634DA92C1009ALL) - *(unsigned __int8 *)(v4 + v6 - 0x41E634DA92C1009ALL);
  return (*(uint64_t (**)(uint64_t))(v8
                                            + 8
                                            * ((44
                                              * (((v9 << (v5 - 14)) & 0xE75F6DE6)
                                               + (v9 ^ ((v5 ^ (a4 - 1537)) - 334536853)) == 1940895475)) ^ v5)))(4294925278);
}

uint64_t sub_10001D5E8()
{
  unint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = v2 < v0;
  if (v5 == v3 - 0x41E634DA8FECF638 < v0 + ((v1 - 372) ^ 0x1CEu) + ((v1 - 1032) | 0x408u) - 2916)
    v5 = v3 - 0x41E634DA8FECF638 < v2;
  return (*(uint64_t (**)(void))(v4 + 8 * ((59 * v5) ^ (v1 - 372))))();
}

uint64_t sub_10001D65C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * (int)(((((v1 + 2116531) | 0x87800680) + 2019535740)
                                                             * (a1 == 1991213905)) ^ v1))
                                          - ((v1 - 1093) | 0x28Eu)
                                          + 914))(4294925278);
}

uint64_t sub_10001D6B8()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1779
                                          * (((2 * (*v0 - 42)) & 0x2D3CFDB4)
                                           + ((((v1 - 1538391463) & 0x5BB1FB3E) + 379485604) ^ (*v0 - 42)) == 379485914)) ^ v1))
                            - 12))();
}

uint64_t sub_10001D730()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((207
                                          * ((((*(unsigned __int8 *)(v2 + 1) - 134) << ((v3 + 33) ^ 0xBE)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) != v0)) ^ (v3 - 77)))
                            - 12))();
}

uint64_t sub_10001D794(char a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (int)((1508
                                               * ((((*(unsigned __int8 *)(v3 + 2) - 72) << (((v4 & 0xDE) - 104) ^ a1)) & v2)
                                                + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v1) == v1)) ^ v4 & 0xDCA903DE))
                            - 12))();
}

uint64_t sub_10001D7F0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1903
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0)) ^ v3))
                            - (v3 ^ 0x2A8u)
                            + 298))();
}

uint64_t sub_10001D83C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1532
                                          * (((v2 ^ (v1 - 306)) & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)) ^ v4))
                            - 12))();
}

uint64_t sub_10001D884()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1663
                                          * ((((*(unsigned __int8 *)(v2 + 5) - 13) << ((v3 ^ 0xA8) - 53)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_10001D8D4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v5 = ((31 * (v3 ^ 0x394)) ^ 0xFFFFFEC9) + *(unsigned __int8 *)(v2 + 6);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1997 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v3)) - 12))();
}

uint64_t sub_10001D92C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1555
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == (v4 ^ (v0 + 274)))) ^ v3))
                            - 12))();
}

uint64_t sub_10001D978()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1453
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 4)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 4) ^ v0) == v0
                                                                                        + 31
                                                                                        * ((v3 - 559080399) & 0x2152E370 ^ 0x34A)
                                                                                        - 310)) ^ v3))
                            - 12))();
}

uint64_t sub_10001D9E8(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v5 + 96) + 1428) = 1355454122;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((222 * (*(_DWORD *)(a2 + 4) == v2)) ^ v3))
                            - ((205 * (v3 ^ 0x348)) ^ 0x75E)
                            + 298))();
}

uint64_t sub_10001DA40(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((2017
                                          * ((v3 & (2 * (**(unsigned __int8 **)(a2 + 8) - 42)))
                                           + ((**(unsigned __int8 **)(a2 + 8) - 42) ^ v2) == v2)) ^ v4))
                            - ((v4 - 38) ^ 0x11CLL)))();
}

uint64_t sub_10001DA88()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1838
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == (v4 ^ (v0 + 240)))) ^ v2))
                            - 12))();
}

uint64_t sub_10001DAC8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = v4 + *(unsigned __int8 *)(v3 + 2) - 344;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1015 * ((v1 & (2 * v6)) + (v6 ^ v0) == v0)) ^ v2)) - 12))();
}

uint64_t sub_10001DB04()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1852
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == v0)) ^ v2))
                            - (v2 ^ 0x26u)
                            + 260))();
}

uint64_t sub_10001DB44()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = ((v2 - 310) | 0x110) + *(unsigned __int8 *)(v3 + 4) - 519;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((114 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)) - 12))();
}

uint64_t sub_10001DB88()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1992
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                           + ((v2 + 1198387203) & 0xB8920FD6 ^ (v0 + 240) ^ (*(unsigned __int8 *)(v3 + 5)
                                                                                           - 13)) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_10001DBDC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1411
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 6) - 1) ^ (v0 + v4 - 272)) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_10001DC1C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2039
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 7) - 1) ^ v0) == v0)) ^ v2))
                            - (v2 ^ 0x26u)
                            + 260))();
}

uint64_t sub_10001DC5C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((969
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 8) - 5)))
                                           + ((*(unsigned __int8 *)(v3 + 8) - 5) ^ v0) == v0)) ^ v2))
                            - ((v2 - 1890245144) & 0x70AAD9F1 ^ 0x11CLL)))();
}

uint64_t sub_10001DCB0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v5 + 96) + 1428) = 1355454126;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((((v3 + 1) ^ (*(_DWORD *)(a2 + 4) == v2)) & 1)
                                          * ((v3 - 1042610633) & 0x3E24FEFA ^ 0x41E)) ^ v3))
                            - 12))();
}

uint64_t sub_10001DD20(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1927 * ((v3 & (2 * v6)) + (v6 ^ v2) == v2)) ^ v4))
                            - ((v4 - 916028819) & 0x36997FC2 ^ 0x34CLL)))();
}

uint64_t sub_10001DD78()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((551
                                          * (((v1 + (v3 ^ 0x250) - 832) & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_10001DDBC()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (v3 | (2
                                               * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
                                                + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0 + v3 + 560 - 832))))
                            - 12))();
}

uint64_t sub_10001DDF8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((725
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0)) ^ v3))
                            - (v4 ^ 0x34C)))();
}

uint64_t sub_10001DE38()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((735
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3))
                            - (((v3 + 240) | 0x140u) ^ 0x34CLL)))();
}

uint64_t sub_10001DE80()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((926
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0 + (v3 ^ 0x250) - 832)) ^ v3))
                            - 12))();
}

uint64_t sub_10001DEC4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) == v0)
                                          * ((v3 - 1003906366) & 0x3BD6676D ^ 0x374)) ^ v3))
                            - 12))();
}

uint64_t sub_10001DF14()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((793
                                          * ((v1 & (2 * (((v3 + 496) | 0x40) + *(unsigned __int8 *)(v2 + 7) - 833)))
                                           + ((((v3 + 496) | 0x40) + *(unsigned __int8 *)(v2 + 7) - 833) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_10001DF54()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 11)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 11) ^ v0) == v0)
                                          * ((v3 ^ 0x250) + 154)) ^ v3))
                            - 12))();
}

void sub_10001DF90(int a1@<W8>)
{
  int v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  int v7;

  *(_DWORD *)(*(_QWORD *)(v3 + 96) + 1428) = 1355454138;
  v7 = (v1 + 296) | 0x200;
  v5 = 3 * ((v1 + 40) ^ 0x95);
  v6 = 235795823 * ((v4 - 2123568225 - 2 * ((v4 - 120) & 0x816CEC17)) ^ 0x15C1A54E);
  *(_DWORD *)(v4 - 116) = ((a1 + 3) ^ 0x626DB6CC) + v6;
  *(_DWORD *)(v4 - 112) = v7 - v6 - 1882359104;
  *(_QWORD *)(v4 - 104) = v4 + 0x133E1E075B35BB77;
  sub_100021DEC(v4 - 120);
  __asm { BR              X8 }
}

uint64_t sub_10001E1B8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  v12 = v10 + 268569478;
  if (v12 <= 0x40)
    v12 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8
                                        * ((25
                                          * (a8 - v8 - v9 + v12 < ((425 * (a6 ^ 0x3C3)) ^ (a4 - 686) ^ (a4 - 1)))) ^ a6))
                            - 8))();
}

uint64_t sub_10001E23C(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  _BOOL4 v15;

  v13 = v9 + v8;
  v14 = v13 + v10;
  if ((v13 + v10) <= 0x40)
    v14 = a1;
  v15 = a8 - v13 + ((a4 + v11 - 850) ^ (a4 - 1103)) - 1201 < a2 + v14;
  return (*(uint64_t (**)(void))(v12 + 8 * (((16 * v15) | (32 * v15)) ^ v11)))();
}

uint64_t sub_10001E288(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17
                                        + 8
                                        * ((7
                                          * (a14
                                           + v18
                                           - 220
                                           + (unint64_t)(v14
                                                              + ((94 * (v16 ^ a3 ^ (a4 + 17))) ^ (v15 + 565))) > 0xF)) ^ v16))
                            - 4))();
}

uint64_t sub_10001E2D8@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  int8x16_t v8;

  v7.i64[0] = 0xCECECECECECECECELL;
  v7.i64[1] = 0xCECECECECECECECELL;
  v8.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v8.i64[1] = 0xE7E7E7E7E7E7E7E7;
  *(int8x16_t *)(v2 + v1 + (((v3 ^ 2) - 1181) ^ a1)) = vaddq_s8(vsubq_s8(*v6, vandq_s8(vaddq_s8(*v6, *v6), v7)), v8);
  return ((uint64_t (*)(int8x16_t *))(*(_QWORD *)(v5
                                                          + 8 * (v3 ^ 2 | (2 * (((v4 + 1) & 0x1FFFFFFF0) != 16))))
                                              - 4))(&v6[1]);
}

void sub_10001E340()
{
  JUMPOUT(0x10001E308);
}

uint64_t sub_10001E34C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (55 * (v0 == v1))))
                            - ((v2 - 944974243) & 0xBFF37F8B ^ 0x87A05784)))();
}

uint64_t sub_10001E398@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v8 - 220 + (a3 + v3 + 367)) = *(_BYTE *)(v4 + v7 - 1996097662)
                                                       - ((2 * *(_BYTE *)(v4 + v7 - 1996097662)) & 0xCF)
                                                       - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((1010 * ((a2 + v3 + 1) < 0x40)) ^ (a1 + v5 + 44)))
                            - 12))();
}

uint64_t sub_10001E404(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, int a17, int a18, unsigned int a19, int a20,int a21,int a22,uint64_t (*a23)(_QWORD, __n128, __n128, __n128, __n128, __n128),int a24,int a25,uint64_t a26,uint64_t a27,int32x4_t a28,int32x4_t a29,int32x4_t a30,int32x4_t a31)
{
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t (*v40)(_QWORD, __n128, __n128, __n128, __n128, __n128);
  unsigned int v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint8x16_t v53;
  uint16x8_t v54;
  int8x16_t v55;
  int8x16_t v56;
  uint16x8_t v57;
  int8x16_t v58;
  int8x16_t v59;
  uint8x16_t v60;
  uint16x8_t v61;
  uint16x8_t v62;
  uint8x16_t v63;
  int8x16_t v66;
  int8x16_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  uint8x16_t v77;
  uint16x8_t v78;
  uint16x8_t v79;
  uint8x16_t v80;
  uint8x16_t v85;
  uint16x8_t v86;
  uint16x8_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  _DWORD *v91;
  int v92;
  int v93;
  unint64_t v94;
  int v95;
  int8x16x4_t v96;
  int8x16x4_t v97;

  a16 = v32;
  v40 = (uint64_t (*)(_QWORD, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v33 + 8
                                                                                                 * (a5 + v31 - 302))
                                                                               - 8);
  a20 = a14 + 2141279973;
  v41 = (a4 - 523059913) & 0x978CEBFD;
  v42 = (const char *)(v39 - 220);
  v43.n128_u64[0] = 0xE7E7E7E7E7E7E7E7;
  v43.n128_u64[1] = 0xE7E7E7E7E7E7E7E7;
  v44 = (__n128)vdupq_n_s32(0xF07F82EC);
  v45 = (__n128)vdupq_n_s32(0x783FC176u);
  a26 = v36 - 16;
  v46 = (__n128)vdupq_n_s32(0x783FC17Eu);
  v47.n128_u64[0] = 0xCECECECECECECECELL;
  v47.n128_u64[1] = 0xCECECECECECECECELL;
  v49 = *(_DWORD *)(v39 - 148);
  v48 = *(_DWORD *)(v39 - 144);
  a24 = v49;
  a25 = v48;
  v51 = *(_DWORD *)(v39 - 140);
  v50 = *(_DWORD *)(v39 - 136);
  v52 = *(_BYTE *)(v39 - 124) ^ 0xED;
  a19 = *(unsigned __int8 *)(v39 - 124) ^ 0xFFFFFFED;
  if (v52 == 2)
  {
    a21 = v51;
    a22 = v50;
    a23 = v40;
    v97 = vld4q_s8(v42);
    a18 = *(_DWORD *)(v39 - 132);
    v77 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v43);
    v78 = vmovl_u8(*(uint8x8_t *)v77.i8);
    v79 = vmovl_high_u8(v77);
    v80 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v43);
    _Q22 = vmovl_u8(*(uint8x8_t *)v80.i8);
    _Q21 = vmovl_high_u8(v80);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v85 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v43);
    v86 = vmovl_high_u8(v85);
    v87 = vmovl_u8(*(uint8x8_t *)v85.i8);
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v43);
    v97.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v97.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v88 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v87.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v78.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8));
    v89 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v87, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v78), 0x18uLL)), (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[0]));
    v97.val[0] = vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v86.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v79.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8));
    v90 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v86, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v79), 0x18uLL)), (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[1]));
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v97.val[0], (int32x4_t)v97.val[0]), (int8x16_t)v44)), (int32x4_t)v45);
    a31 = vaddq_s32(vsubq_s32(v90, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v90, v90), (int8x16_t)v44)), (int32x4_t)v45);
    a28 = vaddq_s32(vsubq_s32(v88, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v88, v88), (int8x16_t)v44)), (int32x4_t)v45);
    a29 = vaddq_s32(vsubq_s32(v89, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v89, v89), (int8x16_t)v44)), (int32x4_t)v45);
    v91 = (_DWORD *)&a28 + v37 + 1983665154;
    v92 = *(v91 - 8) ^ *(v91 - 3);
    v93 = *(v91 - 16) ^ *(v91 - 14) ^ (v92 + v35 - ((v41 - 260079057) & (2 * v92)));
    HIDWORD(v94) = v93 ^ v35;
    LODWORD(v94) = v93;
    *v91 = (v94 >> 31) + v35 - ((2 * (v94 >> 31)) & 0xF07F82EC);
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v33 + 8 * (int)((1101 * (v36 == 1983665091)) ^ v41)) - 4))(507);
  }
  else if (v52 == 1)
  {
    a21 = v51;
    a22 = v50;
    a23 = v40;
    v96 = vld4q_s8(v42);
    v53 = (uint8x16_t)veorq_s8(v96.val[0], (int8x16_t)v43);
    v54 = vmovl_u8(*(uint8x8_t *)v53.i8);
    v55 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v54.i8);
    v56 = (int8x16_t)vmovl_high_u16(v54);
    v57 = vmovl_high_u8(v53);
    v58 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v57.i8);
    v59 = (int8x16_t)vmovl_high_u16(v57);
    v60 = (uint8x16_t)veorq_s8(v96.val[1], (int8x16_t)v43);
    v61 = vmovl_high_u8(v60);
    v62 = vmovl_u8(*(uint8x8_t *)v60.i8);
    v63 = (uint8x16_t)veorq_s8(v96.val[2], (int8x16_t)v43);
    _Q26 = (int8x16_t)vmovl_high_u8(v63);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v63.i8);
    v66 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v96.val[0] = veorq_s8(v96.val[3], (int8x16_t)v43);
    v96.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v96.val[0]);
    v96.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v96.val[1]);
    v96.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v96.val[0].i8);
    v96.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v96.val[0]);
    v96.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.val[0].i8), 0x18uLL), v66), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), v55));
    v96.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v96.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v56));
    v96.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.val[1].i8), 0x18uLL), v71), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v61.i8, 8uLL), v58));
    v96.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v96.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v61, 8uLL), v59));
    v72 = (int32x4_t)veorq_s8(vandq_s8(v96.val[0], (int8x16_t)v46), (int8x16_t)(*(_OWORD *)&v55 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v73 = (int32x4_t)veorq_s8(vandq_s8(v96.val[3], (int8x16_t)v46), (int8x16_t)(*(_OWORD *)&v56 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v74 = (int32x4_t)veorq_s8(vandq_s8(v96.val[1], (int8x16_t)v46), (int8x16_t)(*(_OWORD *)&v58 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v75 = (int32x4_t)veorq_s8(vandq_s8(v96.val[2], (int8x16_t)v46), (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[1], vaddq_s32(v74, v74)), (int32x4_t)v45);
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[2], vaddq_s32(v75, v75)), (int32x4_t)v45);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[0], vaddq_s32(v72, v72)), (int32x4_t)v45);
    a29 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[3], vaddq_s32(v73, v73)), (int32x4_t)v45);
    return (*(uint64_t (**)(uint64_t))(v33 + 8 * ((1828 * (a26 + 1 != v36)) ^ (a5 + a4 + 190))))(507);
  }
  else
  {
    v95 = (v48 ^ v38) + (a25 ^ v38);
    *(_DWORD *)(v39 - 148) = (v49 ^ v38) + (a24 ^ v38) + v38 - (v34 & (2 * ((v49 ^ v38) + (a24 ^ v38))));
    *(_DWORD *)(v39 - 144) = v95 + v38 - (v34 & (2 * v95));
    *(_DWORD *)(v39 - 140) = 2 * (v51 ^ v38) + v38 - (v34 & (4 * (v51 ^ v38)));
    *(_DWORD *)(v39 - 136) = 2 * (v50 ^ v38) + v38 - (v34 & (4 * (v50 ^ v38)));
    return v40(507, v43, v44, v45, v46, v47);
  }
}

void sub_10001E4A8()
{
  JUMPOUT(0x10001E4D0);
}

void sub_10001E740()
{
  JUMPOUT(0x10001E638);
}

uint64_t sub_10001E74C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v1 + 8 * ((982 * (a1 + 1 != v3 + 16)) ^ v2)))();
}

uint64_t sub_10001E82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a7 | (16 * (a8 + 1 != v9 + 32)))) - 8))();
}

uint64_t sub_10001E904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((109 * (v6 + 1 != v7 + 48)) ^ a5)) - 8))();
}

void sub_10001E9D4()
{
  JUMPOUT(0x10001EF30);
}

uint64_t sub_10001EB98@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((22 * (a1 + 1 == v3 + 4)) ^ v1)) - 12))();
}

uint64_t sub_10001EC7C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (a3 + 8 * (v3 + 1 != v5 + 24))) - 4))();
}

uint64_t sub_10001ED24(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((1125 * (a8 + 1 == v9 + 44)) ^ a3)) - 4))();
}

uint64_t sub_10001EDFC()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((903 * (v0 + 1 == v3 + 64)) ^ v1)) - 4))();
}

void sub_10001EECC(int a1@<W3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  int v12;
  uint64_t v13;

  *(_DWORD *)(v13 - 132) = (a1 ^ v12)
                         + (a11 ^ v12)
                         - (v11 & (2 * ((a1 ^ v12) + (a11 ^ v12))))
                         + ((a2 - 2019535109) ^ 0x54DF7697);
  JUMPOUT(0x10001EF2CLL);
}

uint64_t sub_10001EFB0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, int a17, unsigned int a18)
{
  uint64_t v18;
  int v19;
  unsigned int v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;

  v19 = a4 ^ (a4 + 7);
  v20 = ((193 * v19) ^ 0x7CA3B33B) + a15;
  v21 = v20 < 0xF39DBEBA;
  v22 = v20 > a18;
  if (a18 < 0xF39DBEBA != v21)
    v23 = v21;
  else
    v23 = v22;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * ((249 * !v23) ^ (a5 + a4 + 1260)))
                            - (v19 + 752)
                            + 755))();
}

uint64_t sub_10001F04C@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = v3 + a1 + 63 >= (v3 + a1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (a3 ^ (v5 | (8 * v5))))
                            + 2275432324
                            - (a2 + a3 - 1351)))();
}

uint64_t sub_10001F094@<X0>(uint64_t a1@<X6>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((971
                                          * (a8 + v8 - v9 >= a1
                                                           + (unint64_t)((a2 - 1342909881) & 0xD7AB7FF9)
                                                           + 15)) ^ a2))
                            + 2275432324
                            - ((a2 - 2080358591) | 0x3A01300u)))();
}

uint64_t sub_10001F110(int8x16_t a1, double a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, int a8, int a9, int a10, int a11, uint64_t a12, unint64_t a13)
{
  int8x16_t *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  *v13 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v17 + (v14 + a8)), vandq_s8(vaddq_s8(*(int8x16_t *)(v17 + (v14 + a8)), *(int8x16_t *)(v17 + (v14 + a8))), a5)), a1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * (((((20 * (v15 ^ (a9 + 3))) ^ a13) != 64) * a11) ^ (a10 + v15 - 122)))
                            - 8))();
}

uint64_t sub_10001F178(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)(v6 + v5) = *(_BYTE *)(v10 + (v7 + a3))
                      - ((2 * *(_BYTE *)(v10 + (v7 + a3))) & 0xCF)
                      - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((v5 == 63) * a1) ^ (a5 + v8 - 131))) - 8))();
}

uint64_t sub_10001F1CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  v17 = v14 + 331067284 < (a14 + 381243453);
  if ((a14 + 381243453) < 0x8AB5B812 != (v14 + 331067284) < 0x8AB5B812)
    v17 = (a14 + 381243453) < 0x8AB5B812;
  return (*(uint64_t (**)(void))(v15 + 8 * ((!v17 * ((v16 - 711) ^ 0x1DE)) ^ v16)))();
}

uint64_t sub_10001F234(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  int v23;

  v22 = v14 + 1291;
  v23 = v14;
  v17 = v14 ^ (a4 + 48);
  v18 = 1755732067 * ((((v16 - 120) | 0xE413AAA9) + (~(v16 - 120) | 0x1BEC5556)) ^ 0x3AD51773);
  *(_QWORD *)(v16 - 120) = a11;
  *(_DWORD *)(v16 - 112) = v18 + v14 + 174;
  *(_DWORD *)(v16 - 108) = a14 - v18 - 631729271;
  v19 = sub_100005D78(v16 - 120);
  v20 = *(_DWORD *)(v16 - 152) & (v17 + 2019535031);
  *(_BYTE *)(v16 - 220 + (v20 ^ 0xB)) = 103;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15
                                                      + 8
                                                      * ((1582 * ((v20 ^ 0xB) > (v22 ^ 0x50Cu))) ^ v23))
                                          - 4))(v19);
}

uint64_t sub_10001F340()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((90 * (((v0 == 63) ^ ((v1 - 78) ^ (v1 - 59))) & 1)) ^ v1))
                            - 12))();
}

uint64_t sub_10001F388@<X0>(int a1@<W3>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((508 * ((a2 ^ (a1 + 52) ^ (a1 + (v2 ^ 0x6B6u) - 1115)) > 7)) ^ v2)))();
}

uint64_t sub_10001F3C4()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 220 + v0 - 1737512899) = 0xE7E7E7E7E7E7E7E7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((((v2 - 923440572) & 0x370A956F) - 983) & v1) != 8)
                                          * ((107 * ((v2 - 923440572) & 0x370A956F ^ 0x408)) ^ 0x2B9)) ^ (v2 - 923440572) & 0x370A956F))
                            - 4))();
}

uint64_t sub_10001F444(double a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(double *)(v2 + v5) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v3 != v5) * v4) ^ v1)) - 4))();
}

uint64_t sub_10001F468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8 * (int)(((a5 + ((v5 - 403286852) & 0x9FA9FFDE) + 56) * (v7 == v6)) ^ v5)))();
}

void sub_10001F4A8()
{
  JUMPOUT(0x10001E4D0);
}

uint64_t sub_10001FB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  _BOOL4 v13;

  v11 = *(_DWORD *)(v10 - 220 + ((v8 + v5) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a2 + (v8 + v5 + 1)) = (BYTE2(v11) ^ 0x7F) - ((2 * (BYTE2(v11) ^ 0x7F)) & 0xCF) - 25;
  *(_BYTE *)(a2 + (v8 + v5)) = (HIBYTE(v11) ^ 0xD3)
                                           - 2 * ((HIBYTE(v11) ^ 0xD3) & (v7 - a5 - 25) ^ HIBYTE(v11) & 8)
                                           - 25;
  *(_BYTE *)(a2 + (v8 + v5 + 3)) = v11 ^ 0xF8;
  *(_BYTE *)(a2 + (v8 + v5 + 2)) = (BYTE1(v11) ^ 0x21)
                                               + ~(2 * ((BYTE1(v11) ^ 0x21) & 0xEF ^ BYTE1(v11) & 8))
                                               - 24;
  v12 = *(_DWORD *)(v10 - 128) + 229170454;
  if (v8 - 661617423 < v6 != v12 < v6)
    v13 = v12 < v6;
  else
    v13 = v8 - 661617423 < v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((248 * !v13) ^ v7)) - 4))();
}

void sub_10001FCDC()
{
  JUMPOUT(0x10001FCB0);
}

void sub_10001FCE8(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  _BOOL4 v5;

  v1 = 1178560073 * ((2 * (a1 & 0x78F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x43C85E0409B73881) + 1302652813;
  v3 = *(_DWORD *)(a1 + 4) - v1 + 855768132;
  v4 = (v3 < 0xA5DA4FA6) ^ (v2 < 0xA5DA4FA6);
  v5 = v2 < v3;
  if (v4)
    v5 = v3 < 0xA5DA4FA6;
  __asm { BR              X11 }
}

uint64_t sub_10001FDEC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (((v0 + 1704819247) & 0x9A62873F ^ 0x20F) & *(_DWORD *)(v1 - 0x43C85E0409B73879)) == ((v0 + 1936572256) & 0x8C92446D ^ 0x46D);
  return (*(uint64_t (**)(void))(v2 + 8 * (((16 * v3) | (32 * v3)) ^ v0)))();
}

void sub_10001FE60()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 0x43C85E0409B73875) = -2017420638;
}

void sub_100020508(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_10002062C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v10;
  int v11;
  _BOOL4 v12;

  v11 = **(unsigned __int8 **)(a8 + 80) - (*(_BYTE *)(*(_QWORD *)(v8 + 1320) - 1) ^ 0xE7);
  v12 = (v11 ^ 0x169E7EDA) + ((2 * v11) & 0x2D3CFDB4) - 100682960 == v10;
  __asm { BR              X15 }
}

uint64_t sub_100021774@<X0>(int a1@<W0>, int a2@<W3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(v3 + (a1 - 1157819038)) = *(_BYTE *)(a3 + (a1 - 1157819038));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((897 * (a1 - 1 == v4)) ^ (a2 + v5 - 289))) - 8))();
}

void sub_1000217B8(uint64_t a1)
{
  int v1;

  v1 = 1225351577 * ((-2 - ((a1 | 0x69BC7507) + (~(_DWORD)a1 | 0x96438AF8))) ^ 0xE8BC10CA);
  __asm { BR              X9 }
}

uint64_t sub_100021854@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v1 ^ ((v2 != 1565878993) | (4 * (v2 != 1565878993)))))
                            - (((v1 - 968) | 0x406u) ^ 0x423)))();
}

uint64_t sub_1000218AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 8 * (int)((v2 + 899022718) & 0xCA69FE7F)) - 4))(a1, 3900811892);
}

uint64_t sub_100021968@<X0>(int a1@<W3>, int a2@<W4>, unsigned int a3@<W5>, int a4@<W6>, unint64_t a5@<X7>, uint64_t a6@<X8>)
{
  int v6;
  int v7;
  _QWORD *v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v12 = (v11 + a1) & a2;
  *(_DWORD *)(*v8 + 4 * ((v12 ^ (v6 + 1790)) + v7)) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(a6 + 8 * (v12 ^ ((v10 == 0) * a4))) - ((((v12 - 1059) | a3) + 452) ^ a5)))();
}

void sub_1000219C4()
{
  JUMPOUT(0x100021918);
}

uint64_t sub_1000219CC(uint64_t result)
{
  *(_DWORD *)(result + 16) = 795088701;
  return result;
}

void sub_100021B98(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 235795823 * (((a1 | 0xA666D7F8) - a1 + (a1 & 0x59992807)) ^ 0x32CB9EA1);
  v2 = *(_DWORD *)(a1 + 16) - v1;
  __asm { BR              X13 }
}

uint64_t sub_100021C68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;
  int v6;
  uint64_t v7;
  int v8;

  v4 = 1178560073
     * (((&v6 | 0x3D9987B0) - &v6 + (&v6 & 0xC2667848)) ^ 0x870DFFD2);
  v6 = (v3 + 283) ^ v4;
  v8 = v2 + v4 - (((v2 + 1790986734) & 0x5081E13B ^ v2 & 1) << ((v3 + 127) & 0xBF ^ 0x3B)) - 1153291480;
  v7 = v1;
  return ((uint64_t (*)(int *))(*(_QWORD *)(a1 + 8 * (v3 ^ 0x2F0)) - 8))(&v6);
}

uint64_t sub_100021DEC(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 16);
  v2 = *(_DWORD *)(result + 4) - 235795823 * (((result | 0xDF39865F) - result + (result & 0x20C679A0)) ^ 0x4B94CF06);
  *(_DWORD *)(v1 - 0x133E1E075B35BBF3) = ((v2 & 0x186 ^ 0x103) - (v2 & 0x79) - 1825585544) ^ 0xC9A3A026;
  *(_QWORD *)(v1 - 0x133E1E075B35BC13) = 0xC5FEF88B74199178;
  *(_DWORD *)(v1 - 0x133E1E075B35BBF7) = 62745804;
  v3 = v2 ^ 0xB0;
  if (v3 == 1)
  {
    v4 = 62745820;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x133E1E075B35BBFBLL) = 279822575;
    v4 = 62745824;
LABEL_5:
    *(_QWORD *)(v1 - 0x133E1E075B35BC0BLL) = 0x3CB28A96B43A021ELL;
    *(_QWORD *)(v1 - 0x133E1E075B35BC03) = 0xC34D75694BC5FDE1;
    *(_DWORD *)(v1 - 0x133E1E075B35BBF7) = v4;
  }
  *(_DWORD *)result = 1024404524;
  return result;
}

void sub_100021F58(_DWORD *a1)
{
  unsigned int v1;

  v1 = (*a1 - 535753261
            * (((a1 | 0xB4CC401E) - (_DWORD)a1 + (a1 & 0x4B33BFE1)) ^ 0xBE384E31)) ^ 0x771;
  __asm { BR              X3 }
}

uint64_t sub_1000220DC(uint64_t a1, int a2, int a3)
{
  int v3;
  unint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5 + 8 * ((((a3 + 881) ^ v3) * (a2 == 31)) ^ (a3 + 881)))
                                          - ((a3 + 1255) ^ v4)))(a1);
}

void sub_10002213C()
{
  JUMPOUT(0x1000220B0);
}

uint64_t sub_100022148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;

  *(_DWORD *)(a9 - 0xAD445910E4CF10) = ((((v19 - 717) | 0x251) - 237) ^ 0xA3326101) - v16;
  v23 = 108757529
      * ((((v22 - 136) ^ 0x1E543FEE | 0xD1B85227)
        - ((v22 - 136) ^ 0x1E543FEE)
        + (((v22 - 136) ^ 0x1E543FEE) & 0x2E47ADD8)) ^ 0x2F700FE2);
  *(_QWORD *)(v22 - 128) = v21;
  *(_DWORD *)(v22 - 136) = (v19 - 1026) ^ v23;
  *(_DWORD *)(v22 - 132) = v23 ^ 0x4AF4E3E7;
  sub_1000457D8((_DWORD *)(v22 - 136));
  v24 = 535753261 * ((((2 * (v22 - 136)) | 0xEBB3BF32) - (v22 - 136) + 170270823) ^ 0xFF2DD1B6);
  *(_QWORD *)(v22 - 136) = v21;
  *(_DWORD *)(v22 - 128) = v24 + ((v17 << 6) & 0xDFFD7FC0) + ((32 * v17) ^ 0x6FFEBFF6) - 1126730080;
  *(_DWORD *)(v22 - 124) = (v19 - 1450) ^ v24;
  sub_1000445A8(v22 - 136);
  *(_QWORD *)(v22 - 136) = a16;
  *(_DWORD *)(v22 - 128) = v19
                         + 3804331 * (((~(v22 - 136) & 0xCD5261FC) - (~(v22 - 136) | 0xCD5261FD)) ^ 0x42F77A3B)
                         + 12;
  *(_QWORD *)(v22 - 120) = &STACK[0x79262543413A968F];
  sub_100027074(v22 - 136);
  *(_QWORD *)(v22 - 136) = a16;
  *(_QWORD *)(v22 - 120) = v21;
  *(_DWORD *)(v22 - 128) = v19 + 3804331 * ((v22 - 933916987 - 2 * ((v22 - 136) & 0xC8558F4D)) ^ 0x47F0948B) - 1509;
  v25 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * (v19 - 1725)) - 8))(v22 - 136);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((505 * (*(_DWORD *)(v22 - 124) != 744905588)) ^ v19)))(v25);
}

uint64_t sub_10002237C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)(v19 - 120) = a15;
  *(_QWORD *)(v19 - 136) = v18;
  *(_DWORD *)(v19 - 128) = v15 + ((v19 - 136) ^ 0x8FA51BC6) * v16 + 373;
  v20 = sub_100027074(v19 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * ((928 * (((a11 < 1) ^ (v15 - 1)) & 1)) ^ v15))
                                          - ((v15 + 1355790839) & 0xAF3045FB ^ 0x57FLL)))(v20);
}

uint64_t sub_10002242C@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((109
                                          * (((((v3 - 173) ^ (v5 + 1227) ^ (2 * a1))
                                             + v2
                                             - (v5 & (2 * ((v3 - 173) ^ (v5 + 1227) ^ (2 * a1))))) ^ v2) > v1)) ^ v3))
                            - 4))();
}

uint64_t sub_10002246C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t (*a15)(uint64_t), uint64_t a16)
{
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  *(_QWORD *)(v18 - 120) = a12;
  *(_DWORD *)(v18 - 128) = v17
                         + 3804331 * ((((v18 - 136) | 0x59E99CB8) - ((v18 - 136) & 0x59E99CB8)) ^ 0xD64C877E)
                         + 386;
  *(_QWORD *)(v18 - 136) = a16;
  sub_100027074(v18 - 136);
  v19 = 535753261 * (((v18 - 136) & 0x153AF112 | ~((v18 - 136) | 0x153AF112)) ^ 0xE03100C2);
  *(_QWORD *)(v18 - 136) = a14;
  *(_DWORD *)(v18 - 128) = v19 + 752236183;
  *(_DWORD *)(v18 - 124) = (v17 - 1076) ^ v19;
  sub_1000445A8(v18 - 136);
  *(_QWORD *)(v18 - 136) = a16;
  *(_DWORD *)(v18 - 128) = v17
                         + 3804331
                         * ((((v18 - 136) ^ 0x6A781FD2) & 0x2F4F9D48 | ~((v18 - 136) ^ 0x6A781FD2 | 0x2F4F9D48)) ^ 0x356D66A3)
                         - 1135;
  *(_QWORD *)(v18 - 120) = a14;
  v20 = a15(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (((*(_DWORD *)(v18 - 124) == 744905588)
                                              * ((v17 - 791757724) & 0x2F313F28 ^ 0xE5)) ^ (v17 - 155))))(v20);
}

uint64_t sub_1000228B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  int v11;
  uint64_t v12;
  _BOOL4 v13;

  v13 = ((2 * a11) & 0xD5F5B96A)
      + ((v11 - 110099601) & 0x68FFD7F)
      + ((((v11 - 575) | 0x100) - 352659096) ^ a11)
      + 352656846 < 0x7FFFFFFE;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((v13 | (16 * v13)) ^ v11)) - 4))();
}

uint64_t sub_100023254(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*(&off_100058280 + ((525 * (*(_DWORD *)(a2 + 4) == 1991213909)) ^ 0xFFu)))(4294925278);
}

uint64_t sub_100023290@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 448) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return (*(uint64_t (**)(_QWORD))(v2 + 2264))(0);
}

uint64_t sub_1000232EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  *(_BYTE *)(a1 + (v7 + v5)) = *(_BYTE *)(v4 + (v7 + v5));
  return (*(uint64_t (**)(_QWORD))(v1 + 8 * (((((v7 - 1 == v2) ^ v3) & 1) * v6) ^ v3)))(0);
}

uint64_t sub_100023324(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;

  v1 = 1374699841 * ((315119540 - (a1 | 0x12C857B4) + (a1 | 0xED37A84B)) ^ 0x80C3B042);
  v2 = *(_DWORD *)(a1 + 16) - v1;
  v3 = *(_DWORD *)(a1 + 20) ^ v1;
  v4 = *(_DWORD *)(*(_QWORD *)a1 - 0x79262543413A964BLL);
  v6 = v4 - 137555249;
  v5 = v4 - 137555249 < 0;
  v7 = 137555249 - v4;
  if (!v5)
    v7 = v6;
  v8 = (v3 - 1808684808) >= 4 * (unint64_t)v7;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v2 ^ 0x1BE)) + (((8 * v8) | (16 * v8)) ^ v2))
                            - 23 * (v2 ^ 0x160u)
                            + 245))();
}

uint64_t sub_100023404(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * ((503
                                                                          * (((v2 == 1808684808) ^ (((11 * (v4 ^ 0xDC)) ^ 0x57) + 1)) & 1)) ^ v4))
                                                            - 4))(a1, a2, 3753424894);
}

uint64_t sub_100023458(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2
                                                                                        + 8
                                                                                        * (((v3 - 124) | 0x3D) ^ 0x429 | (v3 - 17)))
                                                                            - 8))(a1, (v3 - 17), (v3 - 124) | 0x3Du, 1950405946, v1);
}

uint64_t sub_1000234D0@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 8) + (a4 + a5)) = ((a3 ^ v7) >> v8) - ((2 * ((a3 ^ v7) >> v8)) & 0xCF) - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((449 * (a4 + a2 + 46 - 300 != (a2 ^ (v6 + 237)))) ^ a2)) - 4))();
}

uint64_t sub_100023530(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (((v3 == 24) * (((a2 - 107) | 0x3D) ^ 0x429)) | a2))
                                          - 8))(a1);
}

uint64_t sub_100023568(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  int v4;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v6 = v2 > 0x4457628C;
  v7 = v5 - 765484209 + ((a2 - 1436118830) & 0x55996EFF);
  v8 = v6 ^ (v7 < -1146577549);
  v9 = v7 < v4;
  if (!v8)
    v6 = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1856 * v6) ^ a2)) - 8))();
}

uint64_t sub_1000235EC@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  int v3;
  _QWORD *v4;
  int v5;

  return sub_1000234D0(a1, (a2 - 386205230) & 0x170505FF, *(_DWORD *)(*v4 + 4 * (v5 - 1766390055)), v3, a3);
}

uint64_t sub_10002362C(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 24) = a3;
  return result;
}

void sub_100023634(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v4;

  v1 = 535753261 * (((a1 | 0xC65CACBE) - (a1 & 0xC65CACBE)) ^ 0xCCA8A291);
  v2 = *(_DWORD *)(a1 + 72) - v1;
  v4 = *(_OWORD *)(a1 + 48) == 0 || *(_DWORD *)(a1 + 8) - v1 == 868240921;
  __asm { BR              X8 }
}

uint64_t sub_100023790()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  _BOOL4 v4;

  v4 = v1[8] == 0x2990969C2C6EC44ELL || (*v1 | v1[4]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((44 * v4) ^ v0)) - ((v0 + 28) ^ 0x72Eu) + 1745))();
}

uint64_t sub_1000237EC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *(_QWORD *)(v24 + 16);
  *(_DWORD *)(v23 - 0x2990969C2C6EC44ELL) = 0;
  return ((uint64_t (*)(char *, char *, char *))(*(_QWORD *)(v25
                                                                     + 8
                                                                     * ((468 * (v26 == 0x79262543413A964FLL)) ^ a1))
                                                         - ((a1 - 1380) | 0x82u)
                                                         + 495))(&a15, &a19, &a23);
}

uint64_t sub_100023884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;

  v35 = 108757529 * ((((v34 - 144) | 0x1284A53F) - (v34 - 144) + ((v34 - 144) & 0xED7B5AC0)) ^ 0xF218C714);
  *(_QWORD *)(v34 - 136) = &a24 + v32;
  *(_DWORD *)(v34 - 144) = (v30 + 248) ^ v35;
  *(_DWORD *)(v34 - 140) = v35 ^ 0x4AF5E3E7;
  sub_1000457D8((_DWORD *)(v34 - 144));
  return ((uint64_t (*)(char *, char *, char *))(*(_QWORD *)(v33
                                                                     + 8
                                                                     * (((v31 != 0) * ((4 * v30) ^ 0x7C8)) ^ (v30 + 1193)))
                                                         - 4))(&a22, &a26, &a30);
}

uint64_t sub_10002398C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v34;

  v29 = (v23 - 254142196) & 0xF25E5FC;
  v30 = v29 ^ 0x4BD;
  v31 = 1225351577 * (((v28 - 144) & 0xB6FEF26 | ~((v28 - 144) | 0xB6FEF26)) ^ 0x8A6F8AEB);
  *(_QWORD *)(v28 - 136) = v24;
  *(_DWORD *)(v28 - 144) = (v22 + 697636603 + (v29 ^ 0x4BD)) ^ v31;
  *(_DWORD *)(v28 - 124) = v29 - v31 + 421;
  *(_QWORD *)(v28 - 120) = v20;
  v34 = v21 == 0;
  ((void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v29 - 128)) - 8))(v28 - 144);
  *(_DWORD *)(v28 - 144) = v30
                         + 535753261 * ((((2 * (v28 - 144)) | 0x9FFC68C8) - (v28 - 144) + 805424028) ^ 0xC50A3A4B)
                         - 66;
  *(_QWORD *)(v28 - 136) = a18;
  *(_QWORD *)(v28 - 128) = v25;
  (*(void (**)(uint64_t))(v26 + 8 * (v30 ^ 0x527)))(v28 - 144);
  *(_QWORD *)(v28 - 104) = v25;
  *(_QWORD *)(v28 - 128) = a19;
  *(_QWORD *)(v28 - 120) = a20;
  *(_QWORD *)(v28 - 144) = a18;
  *(_QWORD *)(v28 - 136) = a16;
  *(_DWORD *)(v28 - 112) = (v30 - 1327) ^ (535753261
                                         * ((-892046159 - ((v28 - 144) | 0xCAD474B1) + ((v28 - 144) | 0x352B8B4E)) ^ 0x3FDF8561));
  v32 = (*(uint64_t (**)(uint64_t))(v26 + 8 * (v30 ^ 0x590)))(v28 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * (v30 ^ (v34 | (v34 << 6))))
                                          - ((3 * (v30 ^ 0x5CC) - 291429344) & 0x115EDBDF)
                                          + 327))(v32);
}

uint64_t sub_100023BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  int v9;
  _DWORD *v10;

  v5 = 460628867 * (((v4 - 144) & 0x6B75664C | ~((v4 - 144) | 0x6B75664C)) ^ 0xD81C1BCE);
  *(_QWORD *)(v4 - 128) = v1;
  *(_QWORD *)(v4 - 144) = v7;
  *(_DWORD *)(v4 - 120) = v9 - v5 + ((v3 + 164) ^ 0xFB943976);
  *(_DWORD *)(v4 - 136) = v3 - v5 + 1472;
  result = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v3 - 142)))(v4 - 144);
  *v10 = v8;
  *(_DWORD *)(v0 + 40) = 2017444214;
  return result;
}

void sub_100023D14(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) + 1178560073 * ((-2 - ((a1 | 0xA6FD25DC) + (~(_DWORD)a1 | 0x5902DA23))) ^ 0xE396A241);
  __asm { BR              X15 }
}

uint64_t sub_100023E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;

  if (a6 > 0x31E4A4A0 != v6 + 1043263013 < (int)((4 * v7) ^ 0xCE1B4953))
    v9 = a6 > 0x31E4A4A0;
  else
    v9 = v6 + 1043263013 < (int)(a6 + 1310415711);
  return (*(uint64_t (**)(void))(v8 + 8 * ((49 * v9) ^ v7)))();
}

uint64_t sub_100023EC8@<X0>(int a1@<W0>, int a2@<W4>, unsigned int a3@<W5>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  _BOOL4 v19;
  int v20;
  int v21;
  _BOOL4 v22;

  v19 = a3 > v17;
  *(_DWORD *)(a12 + 4 * (v12 + a4 + ((v13 - 289543823) & 0x114213EF))) = a2;
  v20 = v12 + 1 + v15;
  v21 = v19 ^ (v20 < v14 + 164);
  v22 = v20 < v16;
  if (!v21)
    v19 = v22;
  return (*(uint64_t (**)(void))(v18 + 8 * ((v19 * a1) ^ v13)))();
}

uint64_t sub_100023F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                                          + 8
                                                                                          * ((654 * (v5 != 0)) ^ v6))
                                                                              - 4))(a1, a2, a3, a4, a5);
}

uint64_t sub_100023F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _DWORD *a17)
{
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  uint64_t v24;

  v20 = a12 - 792041009 + v17 + 90;
  v21 = v17;
  v22 = (*(_DWORD *)(*(_QWORD *)(a13 + 24) - 0xAD445910E4CF10) - 1427656983)
      * ((v17 + 339430904) & 0xEBC4B2FB ^ 0x7440D7E2 ^ *a17);
  v23 = 1224239923 * (((((v19 - 128) | 0xD5326E8A) ^ 0xFFFFFFFE) - (~(v19 - 128) | 0x2ACD9175)) ^ 0xD87E6CA2);
  *(_DWORD *)(v19 - 104) = v17 - v23 - 291;
  *(_DWORD *)(v19 - 100) = v23 ^ 0x832ED31;
  *(_QWORD *)(v19 - 112) = a15;
  *(_DWORD *)(v19 - 120) = (v22 ^ 0xDFE7FBFF) - v23 + ((2 * v22) & 0xBFCFF7FE) + 801042419;
  *(_QWORD *)(v19 - 128) = a14;
  v24 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF50 + v17 - 428) - 4))(v19 - 128);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((986 * (v20 > -792040434)) ^ v21)) - 4))(v24);
}

void sub_1000240F4()
{
  JUMPOUT(0x100023FCCLL);
}

uint64_t sub_1000240FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, int a11, int a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v17 = 235795823 * ((v16 + 1373711073 - 2 * ((v16 - 128) & 0x51E12B61)) ^ 0xC54C6238);
  *(_DWORD *)(v16 - 112) = v17 + v15 + 354;
  *(_QWORD *)(v16 - 120) = a14;
  *(_DWORD *)(v16 - 128) = ((a12 << 6) & 0x2FFF7F40) + ((32 * a12) ^ 0x17FFBFB6) + (v15 ^ 0xFD3FF484) + v17;
  sub_100021B98(v16 - 128);
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((489 * ((*a10 - 137555250) < 0x7FFFFFFF)) ^ v15))
                            - 4))();
}

uint64_t sub_1000241D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)(v18 - 128) = a14;
  *(_QWORD *)(v18 - 112) = &STACK[0x79262543413A968F];
  *(_DWORD *)(v18 - 120) = v17 + ((((v18 - 128) | 0xFE067FB4) - ((v18 - 128) & 0xFE067FB4)) ^ 0x71A36472) * v16 + 1061;
  sub_100027074(v18 - 128);
  *(_DWORD *)(v18 - 120) = v17 + ((((v18 - 128) | 0x5611C0B8) - ((v18 - 128) & 0x5611C0B8)) ^ 0xD9B4DB7E) * v16 - 460;
  *(_QWORD *)(v18 - 128) = a14;
  *(_QWORD *)(v18 - 112) = v15;
  v19 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF50 + v17 - 676) - 8))(v18 - 128);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v14
                                                      + 8
                                                      * (((*(_DWORD *)(v18 - 116) != 744905588)
                                                        * (((v17 - 2030394601) & 0x79055EB7) + 372)) ^ v17))
                                          - 4))(v19);
}

uint64_t sub_1000242DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  unsigned int v16;
  uint64_t v17;
  int v18;

  if (a16 - 137555249 >= 0)
    v18 = a16 - 137555249;
  else
    v18 = ~(a16 - 137555250);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * (int)((227
                                                             * ((int)((v18 ^ 0x197FEF71)
                                                                    + (v16 ^ 0xEEB2F967)
                                                                    + ((2 * v18) & 0x32FFDEE2)
                                                                    - 137555250) >= 0)) ^ v16 ^ 0x6F4))
                                          - (v16 ^ 0x4AFLL)))(3804331);
}

uint64_t sub_100024374()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((*(_DWORD *)(v2 + 4 * v3) == v4) * v0) ^ v1))
                            - ((491 * (v1 ^ 0x250u)) ^ 0x5C9)))();
}

uint64_t sub_1000243AC(uint64_t a1, int a2)
{
  unsigned int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)((227 * (v3 - 1 + a2 >= 0)) ^ v2)) - (v2 ^ 0x25BLL)))();
}

uint64_t sub_1000243E4(int a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)(v6 + 16);
  *(_QWORD *)(v3 - 128) = v2;
  *(_QWORD *)(v3 - 112) = v4;
  *(_DWORD *)(v3 - 120) = v1 + ((((v3 - 128) | 0xC9F0C769) - ((v3 - 128) & 0xC9F0C769)) ^ 0x4655DCAF) * a1 + 316;
  return sub_100027074(v3 - 128);
}

void sub_10002483C(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  v2 = *((_QWORD *)*(&off_10005BF50 + (v1 ^ 0x50C))
       + (((((uint64_t (*)(uint64_t, uint64_t))*(&off_10005BF50 + v1 - 1271))(32, 0x101004023FF3BD5) == 0)
         * ((v1 + 47) ^ 0x5D9)) ^ v1))
     - 12;
  __asm { BR              X8 }
}

void sub_1000248E4()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 8) = -2017420638;
}

void sub_100024964(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1000249E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a66;
  uint64_t v66;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v66 + 13688) - 4))(a1, a2, a3, a4, a5, 1945150308, a7, a8, &a66, a10);
}

uint64_t sub_100024B10()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  _BOOL4 v4;

  v4 = v1 == ((v0 + 904) ^ (v3 - 919) ^ 0xC6B1DDAB);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((2 * v4) | (16 * v4)) ^ v0)) - 12))();
}

uint64_t sub_100024B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v16;
  int v17;
  uint64_t v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * ((30
                                          * (((v17 - 1991213893) & 0xFFFFFFFC) - a16 == ((v16 + 1581158132) & 0xA1C16DF6)
                                                                                      - 1991214300)) ^ v16))
                            - 8))();
}

uint64_t sub_100024BB0@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (1936 * (a1 != 1727997412))))
                            - ((v3 + ((v1 + 364) | 0x21u) - 801) ^ ((v1 + 134896268) | 0x84050210))))();
}

uint64_t sub_100024C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;

  v21 = v17 ^ (v20 - 281);
  v22 = a6 + v17 + 774;
  v23 = v18 + 1893920739 < ((101 * (v17 ^ (v20 + 4))) ^ 0xE79272BF);
  v24 = a17 - 633121871 < (v18 + 1893920739);
  if ((a17 - 633121871) < 0xE792732B != v23)
    v24 = v23;
  return (*(uint64_t (**)(void))(v19 + 8 * ((v24 * (v21 ^ 0x322)) | v22)))();
}

uint64_t sub_100024DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, unint64_t a14)
{
  int v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v20 = 628203409 * ((~((v19 - 160) | 0x5F9A5A08) + ((v19 - 160) & 0x5F9A5A08)) ^ 0x22EDA9C4);
  STACK[0x2A8] = v15;
  STACK[0x298] = a14;
  STACK[0x2B0] = a12;
  STACK[0x288] = a11;
  *(_DWORD *)(v19 - 144) = v17 - v20 + 174;
  *(_DWORD *)(v19 - 140) = v14 - v20 - 1237823394;
  STACK[0x280] = a13;
  v21 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(a8 + 8 * (v17 ^ 0x1DF)) - 8))(v19 - 160);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16
                                                      + 8
                                                      * (int)(((*(_DWORD *)(v19 - 128) == 2017444214)
                                                             * (((v17 - 1117790938) & 0xCEAF7F75) - v18 + 70)) ^ v17))
                                          - 4))(v21);
}

uint64_t sub_100024EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8 * ((37 * (*(_DWORD *)(v7 + 48 * (int)((((v10 + 128) | 0x114) ^ 0xB5417DF0) + v8)) == ((v10 - 1642103107) & 0xEDEFDF72) - 1372809460)) ^ (v10 + 1156))) - 4))(a1, a2, a3, a4, a5, a6, a7, v11);
}

uint64_t sub_100024F40@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  _BOOL4 v11;
  int v13;

  if ((v3 + 1811463635) <= 0x12 && ((1 << (v3 - 45)) & 0x50121) != 0)
  {
    v7 = a3;
    v8 = a3 & 0xFFFFFFFFFFFFFFFLL;
    if ((v7 & 0xFFFFFFFFFFFFFFFLL) != 0)
    {
      if (v8 == 3)
      {
        v9 = v6 + a1;
        v10 = (*(uint64_t (**)())(v4 + 48 * (int)v7 + 8))();
        __asm { BR              X8 }
      }
      v11 = ((v6 + a1) ^ (v13 - 1991213896) ^ 0x4C9EF95F7F777E4BLL)
          + ((2 * (v13 - 1991213896)) & 0xFEEEFFBE)
          - 0x4C9EF95F6C93CB62 != 316912765;
      __asm { BR              X1 }
    }
    __asm { BR              X11 }
  }
  return a2 ^ 0x87C09AA8;
}

void sub_1000255CC(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(_QWORD *)(a1 + 24))
    v2 = *(_DWORD *)(a1 + 20) - v1 == 1479895065;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_100025670()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0x46)))(32, 0x101004023FF3BD5) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((v3 * (v0 ^ 0x12D)) ^ v0)) - 4))();
}

uint64_t sub_1000256BC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ 0x172 ^ (63 * (v0 != v1))))
                            - (((v2 ^ 0x172) - 1397919458) & 0x53528DAF ^ 0xA0)))();
}

uint64_t sub_10002571C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  int v6;
  int v8;
  uint64_t v9;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v11 = v2 - 1479895066;
  v12 = v2 - 1;
  v13 = *(unsigned __int8 *)(v5 + v11);
  if (v13 == 231)
    __asm { BR              X11 }
  if (v13 == 103)
  {
    v14 = 2017444214;
    v15 = *(_QWORD *)(v3 + 8);
    v16 = *(unsigned __int8 *)(v3 + 16) ^ v4;
    *(_QWORD *)result = v5;
    *(_DWORD *)(result + 8) = v6;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 116)
      v17 = 1604277838;
    else
      v17 = 1604277839;
    *(_DWORD *)(result + 16) = 413554833;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = 2017444214;
    *(_QWORD *)(v15 - 0x2C843C8B7CE89A2ELL) = a2;
  }
  else
  {
    result = (*(uint64_t (**)(void))(v9 + 8 * (v8 - 138)))();
    v14 = -2017420625;
  }
  *(_DWORD *)v3 = v14;
  return result;
}

void sub_1000257FC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40) - 235795823 * ((a1 + 1866794728 - 2 * (a1 & 0x6F4506E8)) ^ 0xFBE84FB1);
  __asm { BR              X15 }
}

uint64_t sub_1000258F8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  v4 = (v0 + 1126209702) & 0xBCDF67BE;
  if (v2 >= 0)
    v5 = v2;
  else
    v5 = -v2;
  if (v1 >= 0)
    v6 = v1;
  else
    v6 = -v1;
  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((2 * (v5 > v6)) | (8 * (v5 > v6))) ^ v4)))();
}

uint64_t sub_100025940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((35 * (a7 < 0x83)) ^ (v7 + 153))) - 8))();
}

void sub_100025964()
{
  uint64_t v0;
  uint64_t v1;

  *(_DWORD *)(v1 + v0) = 137555249;
}

uint64_t sub_100026760(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 535753261 * ((a1 & 0x20D467A0 | ~(a1 | 0x20D467A0)) ^ 0xD5DF9670);
  v2 = *(_DWORD *)(a1 + 4) + v1;
  v3 = *(_DWORD *)a1 + v1;
  if (v3 < 0)
    v3 = -v3;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x79262543413A964BLL);
  v6 = v4 - 137555249;
  v5 = v4 - 137555249 < 0;
  v7 = 137555249 - v4;
  if (!v5)
    v7 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v2 ^ 0x298)) + ((1616 * (v3 >> 5 < v7)) ^ v2))
                            - 4))();
}

uint64_t sub_100026810@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;

  v4 = ((*(_DWORD *)(*(_QWORD *)(v2 - 0x79262543413A9647) + 4 * v3) ^ 0x7440D53Au) >> a2) ^ 0x520FE2B2;
  *(_DWORD *)(result + 16) = v4 & 0x9ABC346 ^ 0xD878E558 ^ (-2
                                                          - ((~(v4 & 0x9ABC347) | 0xCF3DB78)
                                                           + (v4 & 0x8A3C340 | 0xF30C2487)));
  return result;
}

uint64_t sub_100026894(uint64_t result)
{
  *(_DWORD *)(result + 16) = -729072096;
  return result;
}

void sub_1000268A4(uint64_t a1)
{
  int v1;
  _BOOL4 v2;

  v1 = *(_DWORD *)(a1 + 16) + 1178560073 * (((a1 | 0xD9A9EA42) - a1 + (a1 & 0x265615BD)) ^ 0x633D9220);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x79262543413A964BLL) == 137555249;
  __asm { BR              X9 }
}

uint64_t sub_10002695C(_QWORD *a1)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)(((*(_DWORD *)(*a1 + v4) != v1) * (((v3 - 887) | 0xBA) ^ 0x182)) ^ v3))
                            - (v3 ^ 0x4BFLL)))();
}

uint64_t sub_1000269A4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  _BOOL4 v4;

  v4 = (v3 - 137555249) * (v0 - 137555249) > ((v2 - 1944) ^ (v2 - 923));
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v4 | (4 * v4)) ^ v2)) - 4))();
}

uint64_t sub_1000269E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v8 = v1;
  v7 = v3
     + 628203409
     * (((&v5 | 0xA3013AD2) - &v5 + (&v5 & 0x5CFEC528)) ^ 0x218936E1)
     - 385;
  v5 = a1;
  v6 = v1;
  return ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v2 + 8 * (v3 ^ 0x1F7)) - 4))(&v5);
}

void sub_100026B10(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24) + 1224239923 * ((((2 * a1) | 0x6988450E) - a1 + 1262214521) ^ 0x4677DF50);
  __asm { BR              X13 }
}

uint64_t sub_100026C1C(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  _BOOL4 v8;

  v6 = (v5 - 920978088);
  v8 = v2 - 1058533337 > 1226505559 || v2 - 1058533337 < (int)v6;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 + 8 * ((124 * v8) ^ v4 ^ 0x7AA))
                                                                    - 8))(0x4761FBC5C4A7446ALL, a2, (a2 + 1372017762), v6);
}

uint64_t sub_100026D54@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, _QWORD *a4@<X5>, unsigned int a5@<W6>, int a6@<W7>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  _BOOL4 v22;

  v20 = (v15 - 1192) | 0x302;
  v21 = a1
      - 0x4761FBC5C4A7446ALL
      + (*(_DWORD *)(v7 + 4 * v10) ^ v12)
      + a5 * (unint64_t)(*(_DWORD *)(*a4 + 4 * (v14 + ((v20 + v17) & v18))) ^ v12);
  *(_DWORD *)(v7 + 4 * v10) = v21 + v12 - ((2 * v21) & 0xE881AA74);
  if (a2 > v16 != a6 < v11)
    v22 = a2 > v16;
  else
    v22 = a6 < a3;
  return ((uint64_t (*)(unint64_t))(*(_QWORD *)(v8 + 8 * (v20 ^ (!v22 * v9))) - 12))((v19 ^ HIDWORD(v21)) + (a7 & (v21 >> 31)) + v13);
}

void sub_100026E10()
{
  JUMPOUT(0x100026CF0);
}

uint64_t sub_100026E1C(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v2 - 1004) ^ (799 * (a1 != 0x4761FBC5C4A7446ALL))))
                            - ((((v2 + 276) | 6u) - 52) ^ 0x597)))();
}

uint64_t sub_100026E70@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;

  if (v5 > 0xB1A2B47 != v2 + 1823664007 < -186264392)
    v6 = v5 > 0xB1A2B47;
  else
    v6 = v2 + 1823664007 < (int)(v5 + (a2 ^ 0x457) + 1961218804);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 8 * ((v6 * ((a2 ^ 0x457) - 432)) ^ a2 ^ 0x457)))(a1, 1823664007, 4108702904, 1854453839, 2440513527, (v4 - 1085), 0x6763FBFFCFFF5C6ELL, 0x19FFEB8DCLL);
}

uint64_t sub_100026F4C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unsigned int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  unint64_t v16;

  v16 = a1 - 0x4761FBC5C4A7446ALL + (*(_DWORD *)(v8 + 4 * v10) ^ a6 ^ (v14 + a4) & a5);
  *(_DWORD *)(v8 + 4 * v10) = v16 + v11 - ((2 * v16) & 0xE881AA74);
  return (*(uint64_t (**)(void))(v9 + 8 * ((((a7 ^ HIDWORD(v16)) + (a8 & (v16 >> 31)) + v12 != v15) * v13) ^ v14)))();
}

void sub_100026FC8()
{
  JUMPOUT(0x100026EF8);
}

uint64_t sub_100026FD0()
{
  int v0;
  uint64_t v1;
  int v2;
  _DWORD *v3;
  int v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v4 = ((v2 - 1075542522) & 0x401B74F3 ^ 0x4255EB9E) + v0;
  v5 = *v3 + (v2 ^ 0x4255EE98);
  v6 = v4 < -897001328;
  v7 = v4 > v5;
  if (v5 < -897001328 != v6)
    v7 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((811 * v7) ^ v2)) - 4))();
}

void sub_100027050()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

uint64_t sub_100027074(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) - 3804331 * (a1 ^ 0x8FA51BC6);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + v1 - 1576)
                              + ((487 * (*(_QWORD *)a1 != *(_QWORD *)(a1 + 16))) ^ v1))
                            - (v1 - 176)
                            + 1609))();
}

uint64_t sub_1000270D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v4 = *(_DWORD *)(v2 - 0x79262543413A964BLL);
  v5 = (v3 - 1608) | 0x2C8;
  v6 = 137555966 - (v4 + v5);
  if (v4 + v5 - 137555966 >= 0)
    v6 = v4 + v5 - 137555966;
  *(_DWORD *)(v1 - 0x79262543413A964BLL) = v4;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((((v6 ^ 0xDF9FFFBB) + 1005186549 + ((2 * v6) & 0xBF3FFF76) != 462024112) * (v3 ^ 0x65E)) ^ v3)))();
}

uint64_t sub_100027164@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  *(_DWORD *)(*(_QWORD *)(v3 - 0x79262543413A9647) + 4 * (v5 - 462024113)) = *(_DWORD *)(*(_QWORD *)(v4 - 0x79262543413A9647)
                                                                                           + 4 * (v5 - 462024113));
  v6 = ((v2 - 1060152270) & 0x3F30A7FD ^ 0xFFFFF902) + v5 == v1;
  return (*(uint64_t (**)(void))(a1 + 8 * (((v6 << 7) | (v6 << 10)) ^ v2)))();
}

void sub_1000271DC()
{
  JUMPOUT(0x1000271A4);
}

void sub_1000271E8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100027238@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(a2 + 96) + 24) = v4;
  v5 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 312539504) & 0x73C00BF6) + 1127252659;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2
                                                     + 8
                                                     * ((11
                                                       * (((2 * v5) & 0x9FF7F5FE ^ 0x13C001F6)
                                                        + (v5 ^ 0xF61BFF04)
                                                        - 184094818 != 1157819037)) ^ v3))
                                         - 8))(0);
}

uint64_t sub_1000272F0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  _BOOL4 v6;

  v6 = v5 + v4 - 1341913855 >= 296 * (a3 ^ 0x52E) - 880;
  return (*(uint64_t (**)(void))(v3 + 8 * (((2 * v6) | (16 * v6)) ^ a3)))();
}

uint64_t sub_100027344(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v4 - a1 - (unint64_t)(a3 - 437) + 884 > 0x1F)
                                * ((a3 - 86) ^ 0x462)) ^ a3)))();
}

uint64_t sub_10002737C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v8 + ((a7 - 338) ^ (v9 + 1277)) + 9) * (v10 < 0x20)) ^ a7))
                            - 12))();
}

uint64_t sub_1000273B0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(v3 + (v5 - 1157819038) - 31);
  v7 = a2 + (v5 - 1157819038);
  *(_OWORD *)(v7 - 15) = *(_OWORD *)(v3 + (v5 - 1157819038) - 15);
  *(_OWORD *)(v7 - 31) = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((753 * ((((a1 + 17) | 0xEC) ^ 0xDE) == (v4 & 0xFFFFFFE0))) ^ (a1 + 294)))
                            - 8))();
}

uint64_t sub_100027420(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v3 + 8 * (v5 ^ (497 * (v4 != a3))))
                                         - (((v5 - 182) | 0x34u) ^ 0x78)))(0);
}

uint64_t sub_100027454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  char v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((209 * ((v8 & 0x18) == (a7 ^ 0x3F9 ^ (a7 + 764) ^ 0xFD))) ^ a7))
                            - 4))();
}

uint64_t sub_100027494@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W5>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  *(_QWORD *)(a4 - 7 + (v8 + v7 + a1 - a2)) = *(_QWORD *)(v5 - 7 + (v8 + v7 + a1 - a2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((235 * ((((a3 - 23) ^ 0xFFFFFC96) & v6) - a2 != 8)) ^ (a3 - 23)))
                            - ((a3 - 728) ^ 0xA5)))();
}

void sub_1000274F8()
{
  JUMPOUT(0x1000274CCLL);
}

uint64_t sub_100027500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5
                                                                                        + 8 * (v8 ^ (83 * (v7 == a5))))
                                                                            - ((v8 ^ (v6 + 997))
                                                                             - v6)
                                                                            + 884))(0, a2, a3, a4, (v8 ^ (v6 + 997)) - v6);
}

uint64_t sub_100027544@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a3 + (a1 - 1157819038)) = *(_BYTE *)(v6 + (a1 - 1157819038));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v3
                                                     + 8
                                                     * (int)(((a1 - 1 != v4)
                                                            * (v5 + (((a2 ^ 0x25D) + 1602223185) & 0xFDFE73FB) + 604)) ^ a2 ^ 0x25D))
                                         - 8))(0);
}

void sub_1000275A4()
{
  JUMPOUT(0x100027574);
}

void sub_1000275AC(uint64_t a1)
{
  int v1;

  v1 = 1374699841 * ((~(_DWORD)a1 & 0x2CB30A96 | a1 & 0xD34CF569) ^ 0x4147129F);
  __asm { BR              X10 }
}

uint64_t sub_100027658()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((583 * (*v1 != 20 * ((v0 + 268) ^ 0x55E) - 1120)) ^ (v0 + 268)))
                            - 8))();
}

uint64_t sub_1000276AC()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  unsigned int *v4;
  int v5;
  uint64_t v6;

  v5 = 280 * (v0 ^ 0x562);
  v6 = v3(*v4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((224 * (*v1 != 0)) ^ v5))
                                          - ((v5 - 2133223169) & 0x7F2666FA)
                                          + 1110))(v6);
}

uint64_t sub_100027704()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t (*v2)(_QWORD);
  unsigned int *v3;
  uint64_t result;

  result = v2(*v3);
  *v1 = 0;
  *(_DWORD *)v0 = 0;
  *(_QWORD *)(v0 + 344) = 0;
  *(_QWORD *)(v0 + 352) = 0;
  *(_DWORD *)(v0 + 360) = 1115729964;
  *(_DWORD *)(v0 + 56) = 1894912817;
  return result;
}

uint64_t sub_100027744()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((224 * (*v1 != 0)) ^ v0))
                            - ((v0 - 2133223169) & 0x7F2666FA)
                            + 1110))();
}

void sub_100027784(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v3 = *(_QWORD *)(a1 + 8) != 0x7E959159EFBD1FD2
    && (unsigned __int16)(*(_WORD *)a1 - 2705 * ((a1 - 2 * (a1 & 0x65A) + 1626) ^ 0x4F03)) != 5395;
  v1 = *(_DWORD *)(a1 + 20) + 235795823 * ((a1 - 2 * (a1 & 0x9028065A) - 1876425126) ^ 0x4854F03);
  __asm { BR              X8 }
}

uint64_t sub_100027860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  uint64_t v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;

  v54 = (v49 - 1151088600) & 0x449C37F7;
  HIDWORD(a10) = v52 ^ 0x35;
  HIDWORD(v57) = 70 * (v52 ^ 0x91);
  LODWORD(v57) = v52 - 109510811;
  HIDWORD(v56) = v52 ^ 0xDF;
  LODWORD(v56) = v52 ^ 0xBD;
  HIDWORD(a19) = v52 ^ 0xA8;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, unint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 8 * (int)((((((_DWORD)v54 - 53) ^ 0xBB) == 32) * (((v54 - 200) | 0x93) + 283)) ^ v54)))(a1, v48 - 0x7E959159EFBD1FD2, (unsigned __int16)(v50 - 5395), 147, 187, -1285109772, 4294967227, a8, a9, a10, &a48, (unint64_t)&a31 % (v54 ^ 0xF5uLL) + 16, a13, (1178560073* (((~(v53 - 152) | 0x176F98EB730DDAFELL) + ((v53 - 152) | 0xE89067148CF22501)) ^ 0xF36C37FC36665D62)) ^ 0x13FF, 1178560073* (((~(v53 - 152) | 0x176F98EB730DDAFELL) + ((v53 - 152) | 0xE89067148CF22501)) ^ 0xF36C37FC36665D62), ((~(v53 - 152) | 0x89D588405E525F14) + ((v53 - 152) | 0x762A77BFA1ADA0EBLL)) ^ 0x83C82AD2AB59AEC5, v48 - 0x7E959159EFBD1FD2,
           a18,
           a19,
           v56,
           v57);
}

uint64_t sub_100027A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_DWORD *)(v19 - 112) = 535753261 * a16 + v16 - 724643228 - 93;
  *(_DWORD *)(v19 - 108) = (v16 - 724643228) ^ (535753261 * a16);
  *(_DWORD *)(v19 - 152) = (v16 - 724643344) ^ (535753261 * a16);
  *(_DWORD *)(v19 - 148) = -535753261 * a16;
  *(_DWORD *)(v19 - 144) = 535753261 * a16 + v16 + 2021363622;
  v20 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v16 - 2)))(v19 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17 + 8 * *(int *)(v19 - 128)) - 8))(v20);
}

uint64_t sub_100027B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  (*(void (**)(uint64_t, uint64_t))(v24 + 8 * (v23 + 71)))(a12, 2965982036);
  v25 = (*(uint64_t (**)(void))(v24 + 8 * SHIDWORD(a10)))();
  *v21 = v25;
  v21[1] = 1812433253 * (v25 ^ (v25 >> 30)) + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8 * ((v23 + 133) | 0x10)))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, v20, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_100027BD4()
{
  unsigned int v0;
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)(v5 + 4 * v0) = v0 + (v1 ^ (v1 >> 30)) * v2;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v0 > 0x26E) * v3) ^ v4)))();
}

uint64_t sub_100027BFC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,uint64_t a21,_DWORD *a22)
{
  uint64_t (*v22)(uint64_t);
  void (*v23)(void);
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v28 = 31 * (a1 ^ 0x2D9);
  v29 = (*(uint64_t (**)(uint64_t, _QWORD))(v26 + 8 * (a1 - 655)))(a4, 0);
  ((void (*)(uint64_t))v23)(v29);
  v23();
  v24[1] = *a22 + ((1664525 * (*v24 ^ (*v24 >> 30))) ^ v24[1]);
  v30 = 1178560073 * ((-178469864 - ((v27 - 152) | 0xF55CC418) + a20) ^ 0xB0374385);
  *(_DWORD *)(v27 - 128) = ((v28 + 559723232) & 0x717FBF41) + v30;
  *(_DWORD *)(v27 - 152) = (v28 + 2104632235) ^ v30;
  *(_DWORD *)(v27 - 132) = (v28 + 559723232) ^ v30;
  *(_DWORD *)(v27 - 112) = v30 + v28 + 559723232 - 60;
  *(_DWORD *)(v27 - 108) = -1178560073 * ((-178469864 - ((v27 - 152) | 0xF55CC418) + a20) ^ 0xB0374385);
  v31 = v22(v27 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v25 + 8 * *(int *)(v27 - 136)) - 12))(v31);
}

uint64_t sub_100027D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,int a26,int a27,int a28,int a29)
{
  uint64_t (*v29)(uint64_t);
  _DWORD *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;

  *v30 = v30[623];
  v34 = 1178560073 * ((-696468385 - ((v33 - 152) | 0xD67CBC5F) + a24) ^ 0x93173BC2);
  *(_DWORD *)(v33 - 108) = -1178560073 * ((-696468385 - ((v33 - 152) | 0xD67CBC5F) + a24) ^ 0x93173BC2);
  *(_DWORD *)(v33 - 128) = a27 + v34;
  *(_DWORD *)(v33 - 112) = a28 + v34;
  *(_DWORD *)(v33 - 132) = a29 ^ v34;
  *(_DWORD *)(v33 - 152) = (v32 + 2104632235) ^ v34;
  v35 = v29(v33 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v31 + 8 * *(int *)(v33 - 136)) - 8))(v35);
}

uint64_t sub_100027E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v36;
  uint64_t v37;
  int v38;

  v38 = v36 - 1 != ((31 * (HIDWORD(a21) ^ 0x2B9)) ^ 0xFFFFFFFE) + 31 * (HIDWORD(a21) ^ 0x2B9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (((32 * v38) | (v38 << 6)) ^ HIDWORD(a21))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36);
}

void sub_100027F24()
{
  JUMPOUT(0x100027C50);
}

uint64_t sub_100027F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30)
{
  _DWORD *v30;
  uint64_t v31;
  int v32;

  *v30 = v30[623];
  return (*(uint64_t (**)(void))(v31 + 8 * ((338 * (v32 + ((a30 - 147) | 0x21) == 42)) ^ (a30 + 545))))();
}

uint64_t sub_100027F6C()
{
  uint64_t (*v0)(uint64_t);
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v7 = *(_DWORD *)(v4 + 4 * (v3 - 1));
  *(_DWORD *)(v4 + 4 * v3) = ((1566083941 * (v7 ^ (v7 >> 30))) ^ *(_DWORD *)(v4 + 4 * v3)) - v3;
  *(_DWORD *)(v6 - 112) = ((v2 - 913761563) | 0x37) + v1;
  *(_DWORD *)(v6 - 108) = -v1;
  *(_DWORD *)(v6 - 152) = (v2 + 2104632235) ^ v1;
  *(_DWORD *)(v6 - 132) = (v2 - 913761563) ^ v1;
  *(_DWORD *)(v6 - 128) = v1 + v2 - 913761563 + 77;
  v8 = v0(v6 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5 + 8 * *(int *)(v6 - 136)) - 4))(v8);
}

uint64_t sub_100028014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30)
{
  uint64_t v30;
  int v31;

  return (*(uint64_t (**)(void))(v30 + 8 * ((338 * (v31 + ((a30 - 147) | 0x21) == 42)) ^ (a30 + 545))))();
}

uint64_t sub_100028048@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;

  v24 = (a1 + 1136240818) & 0xBC4657BF;
  *v22 = 0x80000000;
  ((void (*)(uint64_t))*(&off_10005BF50 + (a1 ^ 0x33)))(a21);
  v25 = v22[1];
  v26 = v22[2];
  v27 = v22[398];
  v28 = *(_DWORD *)(v21 + 4 * (v26 & 1));
  *v22 = v22[397] ^ ((v25 & (((v24 + 619) | 0xA0) ^ 0x7FFFFC58) | *v22 & 0x80000000) >> 1) ^ *(_DWORD *)(v21 + 4 * (v25 & 1));
  v22[1] = v27 ^ ((v26 & 0x7FFFFFFE | v25 & 0x80000000) >> 1) ^ v28;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * (int)((v24 + 779) ^ 0x1C)) - 12))();
}

uint64_t sub_100028160@<X0>(int a1@<W4>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;

  v7 = (unsigned int *)(v5 + 4 * v3);
  v8 = (a2 - 779) + v3 - 154;
  *v7 = *(_DWORD *)(v4 + 4 * (*(_DWORD *)(v5 + 4 * v8) & 1)) ^ v7[397] ^ ((*(_DWORD *)(v5 + 4 * v8) & 0x7FFFFFFE | v2 & 0x80000000) >> 1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v8 == 227) * a1) ^ a2)) - 12))();
}

uint64_t sub_1000281B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  int v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;

  v9[227] = *(_DWORD *)(v8 + 4 * (v9[228] & 1)) ^ *v9 ^ ((v9[228] & 0x7FFFFFFE | v9[227] & 0x80000000) >> (((v7 + a6) & a7) - 126));
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (v7 + 450)) - 8))();
}

void sub_10002821C()
{
  JUMPOUT(0x1000281C0);
}

uint64_t sub_100028224@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,unsigned int a24)
{
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;

  v25[623] = *(_DWORD *)(v24 + 4 * (*v25 & 1)) ^ v25[396] ^ ((*v25 & 0x7FFFFFFE | v25[623] & 0x80000000) >> (5 * (a1 ^ 0x60) + 102));
  return ((uint64_t (*)(void))(*(_QWORD *)(v26 + 8 * ((231 * (a24 > 0x26F)) ^ a1)) - 8))();
}

uint64_t sub_100028288@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t (*v8)(uint64_t);
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v12 = (a1 - 1645) | 0x89;
  *v9 = 1;
  *(_DWORD *)(v11 - 108) = -a8;
  *(_DWORD *)(v11 - 152) = (v12 + 2104632235) ^ a8;
  *(_DWORD *)(v11 - 112) = ((v12 - 863034206) ^ 0x1B) + a8;
  *(_DWORD *)(v11 - 132) = (v12 - 863034206) ^ a8;
  *(_DWORD *)(v11 - 128) = a8 + v12 - 863034206 + 18;
  v13 = v8(v11 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10 + 8 * *(int *)(v11 - 136)) - 4))(v13);
}

void sub_100028328()
{
  _DWORD *v0;

  *v0 = 0;
  JUMPOUT(0x100028384);
}

void sub_100028440()
{
  JUMPOUT(0x100027A4CLL);
}

void sub_100028448()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 16) = v0;
}

void sub_10002848C(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) + 1374699841 * (((a1 | 0x3B067EF8) - (a1 & 0x3B067EF8)) ^ 0x56F266F1);
  v2 = *(_QWORD *)a1;
  ((void (*)(char *, void (*)()))*(&off_10005BF50 + v1 - 162))((char *)*(&off_10005BF50 + (v1 ^ 0x141)) - 8, sub_1000461E4);
  __asm { BR              X10 }
}

uint64_t sub_10002853C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((*(_QWORD *)(*(_QWORD *)(v1 + 8 * (v2 - 177)) - 4) == 0)
                                          * ((v2 + 300) ^ 0x182)) ^ v2))
                            - 8))();
}

uint64_t sub_100028580@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x223)))(v1);
}

void sub_1000285A0(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  v2 = (*(_DWORD *)(a2 + 4) - 1991213896) > 0x101;
  __asm { BR              X9 }
}

uint64_t sub_100028600()
{
  return 4294925278;
}

void sub_1000287C0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 1225351577 * ((2 * (a1 & 0x54E14326) - a1 - 1424048935) ^ 0xD5E126EB);
  __asm { BR              X13 }
}

uint64_t sub_10002891C()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)(v3 + v2) = v0;
  *(_DWORD *)(v6 - 136) = v1 + ((((2 * (v6 - 144)) | 0xC393DF78) - (v6 - 144) + 506859588) ^ 0x6E6CF47A) * v4 + 1060;
  *(_QWORD *)(v6 - 128) = v3;
  *(_QWORD *)(v6 - 144) = v5;
  return sub_100027074(v6 - 144);
}

void sub_100029C48(uint64_t a1)
{
  unint64_t v2;
  void (*v3)(char *, void (*)());
  char v4;

  v2 = (unint64_t)&v4 ^ qword_100060358 ^ qword_100060118;
  qword_100060358 = 45734839 * v2 - 0x36FEF50E04838C84;
  qword_100060118 = 45734839 * (v2 ^ 0x95387C5A7726064);
  v3 = (void (*)(char *, void (*)()))*(&off_10005BF50
                                                + ((-73
                                                                                 * ((-73 * v2 + 124) ^ 0x64 ^ qword_100060118)) ^ byte_100053CE0[byte_10004F0C0[(-73 * ((-73 * v2 + 124) ^ 0x64 ^ qword_100060118))] ^ 8])
                                                + 71);
  LOBYTE(v2) = -73 * ((qword_100060118 + -73 * v2 + 124) ^ 0x64);
  v3((char *)*(&off_10005BF50+ (v2 ^ byte_1000577C0[byte_100053AE0[v2] ^ 0xCB])+ 118)- 8, sub_1000461E4);
  __asm { BR              X10 }
}

uint64_t sub_100029D64()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8
                                             * ((329 * (*(_QWORD *)(*(_QWORD *)(v1 + 1672) - 4) == 0)) ^ 0x80u))
                            - 4))();
}

uint64_t sub_100029D9C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x15Au)))(v1);
}

void sub_100029DBC(uint64_t a1)
{
  int v1;

  v1 = 460628867 * ((a1 + 617932952 - 2 * (a1 & 0x24D4E898)) ^ 0x68426AE5);
  __asm { BR              X9 }
}

uint64_t sub_100029E60@<X0>(uint64_t a1@<X8>)
{
  int v1;
  unsigned int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v1 != 1078009232) * (v2 + 436)) ^ v2)) - 4))();
}

uint64_t sub_100029EB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2
                                                      + 8
                                                      * ((1259 * ((((v2 + 150) | 1) ^ 0x1C0) == 217)) ^ ((v2 + 150) | 1)))
                                          - 12))(a1);
}

uint64_t sub_100029FA4@<X0>(int a1@<W3>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (((5 * (((a2 + 47) | a1) ^ 0x60) + 85) * (v3 == 0)) ^ a2)) - 4))();
}

uint64_t sub_100029FD8@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  int v2;

  return (*(uint64_t (**)(void))(a2
                              + 8 * ((394 * (((v2 == ((a1 - 1531) ^ 0x9A)) ^ (a1 - 84)) & 1)) ^ a1)))();
}

uint64_t sub_10002A014@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char v9;
  int v10;
  int v11;

  v6 = 37 * (v4 ^ 0x85);
  v7 = (v6 ^ (v1 + 998)) + v2;
  v8 = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(v3 - 0x79262543413A9647) + 4 * v7) = v5;
  v9 = 4 * v6;
  v10 = (4 * v6) ^ 0x1260;
  *(_DWORD *)(v3 - 0x79262543413A964BLL) = v8;
  if (v1 + v8 + 1 >= 0)
    v11 = v1 + v8 + 1;
  else
    v11 = ~(v1 + v8);
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((((int)((v11 ^ 0x9C7FFFB1) + 1806888320 + ((v11 << (v9 ^ 0xED)) & 0x38FFFF62) + v1) >= 0)
                                * (((v10 - 740) | 0x105) ^ 0x1B5)) ^ v10)))();
}

uint64_t sub_10002A0F8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  _QWORD *v2;
  int v3;
  unsigned int v4;

  return (*(uint64_t (**)(void))(a1 + 8 * ((2039 * (*(_DWORD *)(*v2 + 4 * v4) == v1)) ^ v3)))();
}

uint64_t sub_10002A11C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((((int)(((v2 - 367238541) & 0x15E39BAD ^ 0xFFFFFE52) + v3 + v1) >= 0)
                                * ((v4 | 0x105) ^ 0x1B5)) ^ v2)))();
}

_DWORD *sub_10002A16C(_DWORD *result)
{
  int v1;
  int v2;
  _DWORD *v3;
  int v4;
  int v5;

  if ((v2 + v1) >= 0x7FFFFFFF)
    v5 = 275110498 - v4;
  else
    v5 = v4;
  *v3 = v5;
  *result = 1132308871;
  return result;
}

void sub_10002A1AC(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  _BYTE v5[4];
  unsigned int v6;
  unsigned int v7;
  unint64_t *v8;

  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  v3 = 235795823 * (((v5 | 0x6937D69) - v5 + (v5 & 0xF96C8290)) ^ 0x923E3430);
  v8 = &STACK[0x133E1E075B35BE97];
  v6 = v3 - 953040206;
  v7 = -1882357464 - v3;
  sub_100021DEC((uint64_t)v5);
  __asm { BR              X8 }
}

uint64_t sub_10002A34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;

  v13 = v10 + 809603146;
  if (v13 <= 0x40)
    v13 = 64;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 + 8 * ((122 * (v11 - v8 - v9 + v13 < 0xF)) ^ 0x234)) - 4))(64, (v11 - v8 - v9), a3, a4, a5, 4165459034, a7, a8);
}

uint64_t sub_10002A3D0(int a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;

  v8 = v2 + 26;
  v9 = v4 + v3;
  v10 = v9 + v5;
  if ((v9 + v5) <= 0x40)
    v10 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((((5 * (v8 ^ 0x312)) ^ 0x2AF) * (v6 - v9 >= (a2 + v10))) ^ v8))
                            - 4))();
}

uint64_t sub_10002A424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17
                                        + 8
                                        * (v16 ^ (23
                                                * (a14
                                                               + v18
                                                               - 220
                                                               + (unint64_t)(v15 + v14 - 1) > 0xF))))
                            - ((31 * (v16 ^ 0x6C1)) ^ 0x132u)
                            + 153))();
}

uint64_t sub_10002A478@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  int8x16_t v8;
  int8x16_t v9;

  v8.i64[0] = 0xCECECECECECECECELL;
  v8.i64[1] = 0xCECECECECECECECELL;
  v9.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v9.i64[1] = 0xE7E7E7E7E7E7E7E7;
  *(int8x16_t *)(v4 + v2 + (((v3 - 395) | 0x530) ^ a1)) = vaddq_s8(vsubq_s8(*v7, vandq_s8(vaddq_s8(*v7, *v7), v8)), v9);
  return ((uint64_t (*)(int8x16_t *))(*(_QWORD *)(v6
                                                          + 8
                                                          * ((61 * (((v5 + v1 - 160) & 0x1FFFFFFF0) == 16)) ^ v3))
                                              - 12))(&v7[1]);
}

void sub_10002A4F4()
{
  JUMPOUT(0x10002A4B8);
}

uint64_t sub_10002A500()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((1012 * (((v0 == v1) ^ (v2 - 1)) & 1)) ^ v2))
                            - (v2 ^ 0x530)))();
}

uint64_t sub_10002A544@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);

  v18 = *(unsigned __int8 *)(a13 + v16 - 558631818);
  v19 = (a5 + v13 + 760);
  v20 = (2 * v18) & 0xFFFFFFCF;
  *(_BYTE *)(v17 - 220 + v19) = (((v14 ^ 0x5F) - 17) & 0x52 ^ 0xA7) + v18 - ((2 * v18) & 0xCF);
  v21 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * ((454 * ((a2 + v13 + 1) > 0x3F)) ^ v14 ^ 0x45F)) - 8);
  return v21(v21, v19, v20, ((v14 ^ 0x45F) + 1116330735) & 0xBD762052 ^ 0xA7, a1, a2, a3, a4);
}

void sub_10002A5D0()
{
  JUMPOUT(0x10002A574);
}

uint64_t sub_10002A5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int32x4_t a31,int32x4_t a32,int32x4_t a33,int32x4_t a34)
{
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t (*v44)(__n128, __n128, __n128, __n128, __n128);
  const char *v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  uint8x16_t v56;
  uint16x8_t v57;
  int8x16_t v58;
  int8x16_t v59;
  uint16x8_t v60;
  int8x16_t v61;
  int8x16_t v62;
  uint8x16_t v63;
  uint16x8_t v64;
  uint16x8_t v65;
  uint8x16_t v66;
  int8x16_t v69;
  int8x16_t v74;
  int32x4_t v75;
  int32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  int v82;
  uint8x16_t v84;
  uint16x8_t v85;
  uint16x8_t v86;
  uint8x16_t v87;
  uint8x16_t v92;
  uint16x8_t v93;
  uint16x8_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  _DWORD *v98;
  int v99;
  unsigned int v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  int8x16x4_t v104;
  int8x16x4_t v105;

  v44 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v35 + 8 * v34) - 4);
  LODWORD(v102) = -1179453510;
  v45 = (const char *)(v42 - 220);
  v46.n128_u64[0] = 0xE7E7E7E7E7E7E7E7;
  v46.n128_u64[1] = 0xE7E7E7E7E7E7E7E7;
  v47 = (__n128)vdupq_n_s32(0xF07F82EC);
  v48 = (__n128)vdupq_n_s32(0x783FC176u);
  a23 = v40 - 16;
  v49.n128_u64[0] = 0xCECECECECECECECELL;
  v49.n128_u64[1] = 0xCECECECECECECECELL;
  v50 = (__n128)vdupq_n_s32(0x783FC17Eu);
  v51 = *(_DWORD *)(v42 - 148);
  v52 = *(_DWORD *)(v42 - 144);
  v53 = *(_DWORD *)(v42 - 140);
  v54 = *(_DWORD *)(v42 - 136);
  v55 = *(_BYTE *)(v42 - 124) ^ 0xED;
  HIDWORD(a17) = *(unsigned __int8 *)(v42 - 124) ^ 0xFFFFFFED;
  if (v55 == 2)
  {
    v105 = vld4q_s8(v45);
    v84 = (uint8x16_t)veorq_s8(v105.val[0], (int8x16_t)v46);
    v85 = vmovl_u8(*(uint8x8_t *)v84.i8);
    v86 = vmovl_high_u8(v84);
    v87 = (uint8x16_t)veorq_s8(v105.val[1], (int8x16_t)v46);
    _Q22 = vmovl_u8(*(uint8x8_t *)v87.i8);
    _Q21 = vmovl_high_u8(v87);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v92 = (uint8x16_t)veorq_s8(v105.val[2], (int8x16_t)v46);
    v93 = vmovl_high_u8(v92);
    v94 = vmovl_u8(*(uint8x8_t *)v92.i8);
    v105.val[0] = veorq_s8(v105.val[3], (int8x16_t)v46);
    v105.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v105.val[0]);
    v105.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v105.val[0].i8);
    v95 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v94.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v85.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v105.val[0].i8));
    v96 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v94, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v85), 0x18uLL)), (int8x16_t)vmovl_high_u16((uint16x8_t)v105.val[0]));
    v105.val[0] = vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v93.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v86.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v105.val[1].i8));
    v97 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v93, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v86), 0x18uLL)), (int8x16_t)vmovl_high_u16((uint16x8_t)v105.val[1]));
    a33 = vaddq_s32(vsubq_s32((int32x4_t)v105.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v105.val[0], (int32x4_t)v105.val[0]), (int8x16_t)v47)), (int32x4_t)v48);
    a34 = vaddq_s32(vsubq_s32(v97, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v97, v97), (int8x16_t)v47)), (int32x4_t)v48);
    a31 = vaddq_s32(vsubq_s32(v95, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v95, v95), (int8x16_t)v47)), (int32x4_t)v48);
    a32 = vaddq_s32(vsubq_s32(v96, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v96, v96), (int8x16_t)v47)), (int32x4_t)v48);
    v98 = (_DWORD *)&a31 + v39 + 772838679;
    v99 = *(v98 - 8) ^ *(v98 - 3);
    v100 = *(v98 - 16) ^ *(v98 - 14) ^ (v99 + v36 - ((2 * v99) & 0xF07F82EC));
    HIDWORD(v101) = v100 ^ v36;
    LODWORD(v101) = v100;
    *v98 = (v101 >> 31) + v36 - ((2 * (v101 >> 31)) & 0xF07F82EC);
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v35
                                                               + 8 * ((237 * (v40 != 772838616)) ^ (a5 + v37 + 238))))(v51, 58663199, 36);
  }
  else if (v55 == 1)
  {
    v103 = __PAIR64__(v54, v53);
    v104 = vld4q_s8(v45);
    v56 = (uint8x16_t)veorq_s8(v104.val[0], (int8x16_t)v46);
    v57 = vmovl_u8(*(uint8x8_t *)v56.i8);
    v58 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v57.i8);
    v59 = (int8x16_t)vmovl_high_u16(v57);
    v60 = vmovl_high_u8(v56);
    v61 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v60.i8);
    v62 = (int8x16_t)vmovl_high_u16(v60);
    v63 = (uint8x16_t)veorq_s8(v104.val[1], (int8x16_t)v46);
    v64 = vmovl_high_u8(v63);
    v65 = vmovl_u8(*(uint8x8_t *)v63.i8);
    v66 = (uint8x16_t)veorq_s8(v104.val[2], (int8x16_t)v46);
    _Q26 = (int8x16_t)vmovl_high_u8(v66);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v66.i8);
    v69 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v74 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v104.val[0] = veorq_s8(v104.val[3], (int8x16_t)v46);
    v104.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v104.val[0]);
    v104.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v104.val[1]);
    v104.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v104.val[0].i8);
    v104.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v104.val[0]);
    v104.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v104.val[0].i8), 0x18uLL), v69), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v65.i8, 8uLL), v58));
    v104.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v104.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v65, 8uLL), v59));
    v104.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v104.val[1].i8), 0x18uLL), v74), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v64.i8, 8uLL), v61));
    v104.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v104.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v64, 8uLL), v62));
    v75 = (int32x4_t)veorq_s8(vandq_s8(v104.val[0], (int8x16_t)v50), (int8x16_t)(*(_OWORD *)&v58 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v76 = (int32x4_t)veorq_s8(vandq_s8(v104.val[3], (int8x16_t)v50), (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v77 = (int32x4_t)veorq_s8(vandq_s8(v104.val[1], (int8x16_t)v50), (int8x16_t)(*(_OWORD *)&v61 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    v78 = (int32x4_t)veorq_s8(vandq_s8(v104.val[2], (int8x16_t)v50), (int8x16_t)(*(_OWORD *)&v62 & __PAIR128__(0xFFFFFF08FFFFFF08, 0xFFFFFF08FFFFFF08)));
    a33 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[1], vaddq_s32(v77, v77)), (int32x4_t)v48);
    a34 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[2], vaddq_s32(v78, v78)), (int32x4_t)v48);
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[0], vaddq_s32(v75, v75)), (int32x4_t)v48);
    a32 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[3], vaddq_s32(v76, v76)), (int32x4_t)v48);
    v79 = (v51 ^ v38)
        + v43
        + ((v53 ^ v38) & (v52 ^ v38) | (v52 ^ 0x2C80DEE0) & (v54 ^ v38))
        + dword_10004C644[a23 + v39]
        + (a31.i32[(byte_100054960[a23 + v39] - 43)] ^ v36);
    v80 = (v79 + v38 - (v41 & (2 * v79))) ^ v38;
    v81 = v80 << (byte_100048960[a23 + v39] - 102);
    v82 = (v81 | (v80 >> (102 - byte_100048960[a23 + v39]))) + (v52 ^ v38);
    HIDWORD(v102) = HIDWORD(a13) + 1169592293;
    return (*(uint64_t (**)(_QWORD, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, _QWORD, _BYTE *, _QWORD, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 8 * ((7 * (a23 + 1 != v40)) ^ 0x511u)))(v54, &off_10005BF50, 36, v81, -(byte_100048960[a23 + v39] - 102), byte_100054960, v82 + v38 - (v41 & (2 * v82)), dword_10004C644, a9, a10, a11, a12, a13, a14, a15, a16, a17, v102, __PAIR64__(v52, v51),
             v103,
             v44,
             0xA400000005,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30);
  }
  else
  {
    *(_DWORD *)(v42 - 148) = 2 * (v51 ^ v38) + v38 - (v41 & (4 * (v51 ^ v38)));
    *(_DWORD *)(v42 - 144) = 2 * (v52 ^ v38) + v38 - (v41 & (4 * (v52 ^ v38)));
    *(_DWORD *)(v42 - 140) = 2 * (v53 ^ v38) + v38 - (v41 & (4 * (v53 ^ v38)));
    *(_DWORD *)(v42 - 136) = 2 * (v54 ^ v38) + v38 - (v41 & (4 * (v54 ^ v38)));
    return v44(v46, v47, v48, v49, v50);
  }
}

uint64_t sub_10002B164(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, uint64_t a17, unsigned int a18, unsigned int a19)
{
  uint64_t v19;
  int v20;
  unsigned int v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;

  v21 = (((a5 + v20 + 406) | a3) ^ 0x9866E85C) + a16;
  v22 = v21 < ((a5 + v20 - 447) ^ a6);
  v23 = v21 > a19;
  if (a19 < a18 != v22)
    v24 = v22;
  else
    v24 = v23;
  return (*(uint64_t (**)(void))(v19 + 8 * ((950 * !v24) ^ (a5 + v20 + 657))))();
}

uint64_t sub_10002B1F0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((109 * (a4 + v4 + 63 < ((v5 + 1716124555) & 0xBFBE5DEB ^ 0xF8BBA9D5) + v4)) ^ v5))
                            - 8))();
}

uint64_t sub_10002B244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17
                                        + 8
                                        * (((a14
                                           + v16
                                           - (unint64_t)(v14 - 1196714285 + v18 + v15 + 21 - 1089) > 0xF)
                                          * ((v15 - 1352115849) & 0x769FFFFF ^ (v18 - 238))) ^ (v15 + 21)))
                            - 8))();
}

uint64_t sub_10002B2A8(int8x16_t a1, double a2, double a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, int a9)
{
  int v9;
  int v10;
  int8x16_t *v11;
  uint64_t v12;
  uint64_t v13;

  *v11 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v13 + (v9 + a8)), vandq_s8(vaddq_s8(*(int8x16_t *)(v13 + (v9 + a8)), *(int8x16_t *)(v13 + (v9 + a8))), a4)), a1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((((v10 + a9 - 577) | 4) - 45) | (v10 + a9))) - 12))();
}

uint64_t sub_10002B304@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W6>, char a4@<W7>, uint64_t a5@<X8>)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  *(_BYTE *)(v7 + a5) = *(_BYTE *)(v10 + (v6 + a1))
                      - ((*(_BYTE *)(v10 + (v6 + a1)) << ((v5 ^ (v9 - 13)) - 52)) & a4)
                      - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a5 != 63) * a3) ^ (v5 + a2))) - 12))();
}

uint64_t sub_10002B358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  int v15;
  uint64_t v16;
  _BOOL4 v17;

  v17 = v14 + 987064623 < (a14 - 400225052);
  if (a14 - 400225052 < (v15 + 1545696262) != (v14 + 987064623) < 0x5C2174B9)
    v17 = a14 - 400225052 < (v15 + 1545696262);
  return (*(uint64_t (**)(void))(v16 + 8 * ((!v17 | (8 * !v17)) ^ v15)))();
}

uint64_t sub_10002B3C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v21;

  v21 = (a3 - 1089560877) & 0x40F167F7;
  v16 = 1755732067 * ((738867677 - ((v15 - 120) | 0x2C0A39DD) + ((v15 - 120) | 0xD3F5C622)) ^ 0xD337BF9);
  *(_QWORD *)(v15 - 120) = a11;
  *(_DWORD *)(v15 - 112) = v16 + a3 + 151;
  *(_DWORD *)(v15 - 108) = a14 - v16 - 631729271;
  v17 = sub_100005D78(v15 - 120);
  v18 = *(_DWORD *)(v15 - 152) & 0x3F;
  *(_BYTE *)(v15 - 220 + (v18 ^ 0xB)) = 103;
  return ((uint64_t (*)(uint64_t, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t)))(*(_QWORD *)(v14 + 8 * ((((v18 ^ 0xB) > 0x37) * (v21 ^ 0x2A4)) ^ a3)) - 8))(v17, &off_10005BF50);
}

uint64_t sub_10002B4E0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (15 * (v0 == 63))))
                            - ((v3 + v1 + 1332250442) & 0x8A8F17FE)
                            + 1010))();
}

uint64_t sub_10002B524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  return (*(uint64_t (**)(void))(v7 + 8 * ((((v6 - a5 - 396) ^ (v8 - 1071) ^ (v6 - 201)) * ((v5 ^ 0x34u) > 7)) ^ v6)))();
}

uint64_t sub_10002B560@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 220 + a1 - 461079621) = 0xE7E7E7E7E7E7E7E7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1854 * ((v1 & 0x38) == 8)) ^ v2))
                            - ((v2 + 177) ^ 0x3E2)))();
}

uint64_t sub_10002B5B4@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  int v2;
  double *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *v3 = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 0) * v4) ^ v2)) - (a1 ^ 0x3E2)))();
}

uint64_t sub_10002B5E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8
                                                                                         + 8
                                                                                         * (((((v7 == v6) ^ (a6 - 63)) & 1)
                                                                                           * ((a6 + 664336833) ^ 0x190A004 ^ (v9 + 24))) ^ a6)))(a1, a2, a3, a4, a5, 3115513609);
}

void sub_10002B634()
{
  JUMPOUT(0x10002A5ECLL);
}

uint64_t sub_10002B644@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W3>, unsigned int a4@<W8>)
{
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  int v13;
  _BOOL4 v14;

  v11 = a4 < v4;
  *(_BYTE *)(v10 - 220 + (v5 - 129508262)) = *(_BYTE *)(v9 + (v6 + a3))
                                                         - ((*(unsigned __int8 *)(v9 + (v6 + a3)) << ((((v7 + 79) | 0x45) ^ 2) & 0xBB)) & 0xCE)
                                                         - 25;
  v12 = v6 + 1 + a2;
  v13 = v11 ^ (v12 < a1);
  v14 = v12 < a4;
  if (!v13)
    v11 = v14;
  return (*(uint64_t (**)(void))(v8 + 8 * ((!v11 | (8 * !v11)) ^ v7)))();
}

uint64_t sub_10002B6D0@<X0>(int a1@<W4>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3 + 8 * ((1020 * (a2 - 461079621 >= ((v2 - v4 + 882) ^ 0x34Au))) ^ (a1 + v2 - 130))))();
}

uint64_t sub_10002B710@<X0>(unsigned int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = a1;
  v4 = ((v1 - 1851957107) & 0x6E629E5B ^ 0xFFFFFFFFE48479E7) + a1;
  if (v4 <= 0x38)
    v4 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((214 * (v4 - v3 + 461079621 >= (v1 ^ 0x37AuLL))) ^ v1)) - 8))();
}

uint64_t sub_10002B78C@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 220 + v2 + ((441 * (v1 ^ 0x259)) ^ 0xFFFFFFFFE48478C9)) = 0xE7E7E7E7E7E7E7E7;
  return (*(uint64_t (**)(void))(v3 + 8 * ((1558 * ((a1 & 0xFFFFFFFFFFFFFFF8) == 8)) ^ v1)))();
}

void sub_10002B7E4()
{
  JUMPOUT(0x10002B7C8);
}

uint64_t sub_10002B7F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v8 - 220 + v5 - 461079621) = -25;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((unint64_t)(v5 - 461079620) < 0x40) | (16
                                                                               * ((unint64_t)(v5 - 461079620) < 0x40))) ^ (a5 + v6 + 372))))();
}

uint64_t sub_10002B834@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((a1 + (v3 ^ (v5 + 302)) + 724) * (a2 == v2)) ^ v3))
                            - ((v3 - 1653949352) & 0x629541F7)
                            + 442))();
}

void sub_10002B88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;

  v7 = *(unsigned __int8 *)(v6 - 124) ^ 0xED;
  if (v7 == 1)
  {
    v13 = *(_DWORD *)(v6 - 156);
    v12 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((8 * v12) ^ 0x58) - ((2 * ((8 * v12) ^ 0x58)) & 0xC0) - 25;
    *(_BYTE *)(v6 - 163) = ((a5 + v5 + 107) ^ (v12 >> 5) ^ 0x19)
                         - ((2 * ((a5 + v5 + 107) ^ (v12 >> 5) ^ 0x19)) & 0xCF)
                         - 25;
    *(_BYTE *)(v6 - 162) = ((v12 >> 13) ^ 0xF7) - 2 * (((v12 >> 13) ^ 0xF7) & 0xEF ^ (v12 >> 13) & 8) - 25;
    HIDWORD(v14) = v13 ^ 0x18;
    LODWORD(v14) = v12 ^ 0xC0000000;
    *(_BYTE *)(v6 - 161) = ((v12 >> 21) ^ 0x2F) - ((2 * ((v12 >> 21) ^ 0x2F)) & 0xCF) - 25;
    *(_BYTE *)(v6 - 160) = (v14 >> 29) + (~(2 * (v14 >> 29)) | 0x31) - 24;
    *(_BYTE *)(v6 - 159) = ((v13 >> 5) ^ 0x8B) - ((2 * ((v13 >> 5) ^ 0x8B)) & 0xCF) - 25;
    *(_BYTE *)(v6 - 158) = ((v13 >> 13) ^ 0xCC) + (~(2 * ((v13 >> 13) ^ 0xCC)) | 0x31) - 24;
    v11 = ((v13 >> 21) ^ 0xFFFFFFA0) + (~(2 * ((v13 >> 21) ^ 0xFFFFFFA0)) | 0x31) - 24;
  }
  else
  {
    if (v7 != 2)
      goto LABEL_6;
    v8 = *(_DWORD *)(v6 - 156);
    v9 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((v8 >> 21) ^ 0xA0) - ((((v8 >> 21) ^ 0xFFFFFFA0) << (((v5 + 90) & 0xDF) + 36)) & 0xCE) - 25;
    *(_BYTE *)(v6 - 163) = ((v8 >> 13) ^ 0xCC) - ((2 * ((v8 >> 13) ^ 0xCC)) & 0xCF) - 25;
    *(_BYTE *)(v6 - 162) = ((v8 >> 5) ^ 0x8B) - ((2 * ((v8 >> 5) ^ 0x8B)) & 0xCF) - 25;
    HIDWORD(v10) = v8 ^ 0x18;
    LODWORD(v10) = v9 ^ 0xC0000000;
    *(_BYTE *)(v6 - 161) = (v10 >> 29) - ((2 * (v10 >> 29)) & 0xCF) - 25;
    *(_BYTE *)(v6 - 160) = ((v9 >> 21) ^ 0x2F) - ((2 * ((v9 >> 21) ^ 0x2F)) & 0xCF) - 25;
    *(_BYTE *)(v6 - 159) = ((v9 >> 13) ^ 0xF7) - ((2 * ((v9 >> 13) ^ 0xF7)) & 0xCF) - 25;
    *(_BYTE *)(v6 - 158) = ((v9 >> 5) ^ 0xC4) - ((2 * ((v9 >> 5) ^ 0xC4)) & 0xCF) - 25;
    v11 = ((8 * v9) ^ 0x58) - (((8 * v9) ^ 0x58) >> 5 << 6) - 25;
  }
  *(_BYTE *)(v6 - 157) = v11;
LABEL_6:
  JUMPOUT(0x10002A5ECLL);
}

uint64_t sub_10002BCA4@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v7 = *(_DWORD *)(v6 - 220 + ((v4 + a2) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a1 + (v4 + a2 + 1)) = (BYTE2(v7) ^ 0x7F) - ((2 * (BYTE2(v7) ^ 0x7F)) & 0xCF) - 25;
  *(_BYTE *)(a1 + (v4 + a2)) = (HIBYTE(v7) ^ 0xD3)
                                           - 2 * ((HIBYTE(v7) ^ 0xD3) & 0xEF ^ HIBYTE(v7) & (((v3 + 33) | 0x21) + 101))
                                           - 25;
  *(_BYTE *)(a1 + (v4 + a2 + 2)) = (BYTE1(v7) ^ 0x21)
                                               + ~(2 * ((BYTE1(v7) ^ 0x21) & 0xEF ^ BYTE1(v7) & 8))
                                               - 24;
  *(_BYTE *)(a1 + (v4 + a2 + 3)) = v7 ^ 0xF8;
  v8 = *(_DWORD *)(v6 - 128) + 1513295470;
  v9 = v8 < v2;
  v10 = v4 + 993095173 < v8;
  if (v4 + 993095173 < v2 != v9)
    v10 = v9;
  return (*(uint64_t (**)(void))(v5 + 8 * ((2 * v10) | (16 * v10) | v3)))();
}

void sub_10002BE64()
{
  JUMPOUT(0x10002BE2CLL);
}

uint64_t sub_10002BE6C()
{
  return 0;
}

void sub_10002BEAC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v1 = *(_DWORD *)(a1 + 16) ^ (3804331 * ((a1 & 0x8EFFDE1B | ~(a1 | 0x8EFFDE1B)) ^ 0xFEA53A22));
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_DWORD *)(v2 - 0x79262543413A964BLL);
  v5 = v1 - 1759421093 * ((2 * (&v4 & 0x11D00BC0) - &v4 + 1848636475) ^ 0xDD52446F) + 360;
  v4 = v2;
  sub_100005E90((uint64_t)&v4);
  __asm { BR              X9 }
}

uint64_t sub_10002BFDC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a1
                              + 8 * (int)((((v1 + 191568613) & 0xF494DFF8 ^ 0x1FA) * (((v3 + v2) & 0x1F) == 2)) ^ v1)))();
}

uint64_t sub_10002C04C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((1207
                                          * (((((((v1 - 1138623431) & 0x43DDFDED) + 1168721180) & 0xBA56BAF6)
                                             - 1513801774) ^ ((((v1 - 1138623431) & 0x43DDFDED) + 295) | 0x140))
                                           + (v2 & 0xBF778DE6)
                                           + ((((v1 - 1138623431) & 0x43DDFDED) - 541342190) ^ v3)
                                           + 2055142782 < 0x7FFFFFFF)) ^ (v1 - 1138623431) & 0x43DDFDEDu))
                            - 8))();
}

uint64_t sub_10002C0F4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;

  v7 = v5 ^ 0x15;
  *(_DWORD *)(*(_QWORD *)(v6 - 0x79262543413A9647) + 4 * (v1 + v7 + v3 + 1179107182)) = *(_DWORD *)(*(_QWORD *)(v6 - 0x79262543413A9647) + 4 * (v2 + v3 + 956));
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 8 * ((21 * (v2 + v3 + 955 < v4)) ^ v7))
                                                           - 8))((v7 - 291941737), 291942351, 1179107182);
}

void sub_10002C170()
{
  JUMPOUT(0x10002C12CLL);
}

uint64_t sub_10002C17C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (v2 ^ (51
                                               * ((int)((v3 ^ 0x7FBFFB77) - 161486864 + (v1 & 0xFF7FF6EE) - 1981801320) >= 0))))
                            - (v2 ^ 0x544u)
                            + 1236))();
}

uint64_t sub_10002C228@<X0>(int a1@<W1>, int a2@<W3>, int a3@<W4>, uint64_t a4@<X8>)
{
  int v4;
  int v5;
  int v6;
  char v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;

  v11 = a2 - 836;
  v12 = a1 - 1;
  v13 = *(_DWORD *)(*(_QWORD *)(v10 - 0x79262543413A9647) + 4 * (a1 + v8)) ^ v6;
  *(_DWORD *)(*(_QWORD *)(v10 - 0x79262543413A9647) + 4 * (v5 + v4 + v11 + 651 - 1059)) = ((v13 >> (32 - v7)) | a3 ^ v6)
                                                                                            + v6
                                                                                            - ((2
                                                                                              * ((v13 >> (32 - v7)) | a3 ^ v6)) & 0xE881AA74);
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * (((v12 + v8 >= 0) * v9) ^ v11)) - 8))();
}

void sub_10002C2C8()
{
  JUMPOUT(0x10002C254);
}

uint64_t sub_10002C2D0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return (*(uint64_t (**)(void))(a1 + 8 * ((((v2 ^ 0xA0828788) + v1 > 0x7FFFFFFE) * (v2 ^ 0x36F)) ^ v2)))();
}

uint64_t sub_10002C318@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  *(_DWORD *)(*(_QWORD *)(v4 - 0x79262543413A9647) + 4 * (v1 + v2 + 1)) = 1950405946;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((((v1 + v2) < 0x7FFFFFFF) * (5 * (v3 ^ 0x31A) + 1383)) ^ ((v3 ^ 0x153) + 340))))();
}

uint64_t sub_10002C380@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  _QWORD *v4;
  int v5;
  unsigned int v6;
  int v7;

  *(_DWORD *)(*v4 + 4 * (v7 + v2 + 1)) = v3;
  return (*(uint64_t (**)(void))(a2 + 8 * (((v7 + v2 < v6) * a1) ^ v5)))();
}

void sub_10002C3AC()
{
  int v0;
  int v1;
  int v2;
  int v3;
  _DWORD *v4;
  int v5;

  v5 = -1275398567 - v0;
  if (*v4 + 2009928399 < v3 - 410)
    v5 = v1;
  *v4 += v2 + v5 + 2;
}

void sub_10002C4F4(uint64_t a1)
{
  unint64_t v2;
  _BYTE v3[8];

  v2 = (unint64_t)&v3[qword_100060118 ^ qword_100060120];
  qword_100060120 = 45734839 * v2 - 0x95387C5A7726064;
  qword_100060118 = 45734839 * (v2 ^ 0x95387C5A7726064);
  ((void (*)(char *, void (*)()))*(&off_10005BF50
                                            + ((-73
                                                                             * (qword_100060120 ^ 0x64 ^ qword_100060118)) ^ byte_1000578C0[byte_100053BE0[(-73 * (qword_100060120 ^ 0x64 ^ qword_100060118))] ^ 0x9A])
                                            + 116))((char *)*(&off_10005BF50+ ((-73 * ((qword_100060118 - qword_100060120) ^ 0x64)) ^ byte_10004BEA0[byte_1000579C0[(-73 * ((qword_100060118 - qword_100060120) ^ 0x64))] ^ 0xAB])+ 73)- 8, sub_1000461E4);
  __asm { BR              X10 }
}

uint64_t sub_10002C618@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1635
                                          * (((*(_QWORD *)(*(_QWORD *)(v2 + 8 * (int)(a1 - 376)) - 4) == 0) ^ (a1 - 28)) & 1)) ^ a1))
                            - 12))();
}

uint64_t sub_10002C658@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x280u)))(v1);
}

void sub_10002C688(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v1 = 535753261 * ((-2 - ((a1 | 0x6D3F96EA) + (~(_DWORD)a1 | 0x92C06915))) ^ 0x9834673A);
  v2 = *(_DWORD *)(a1 + 8) ^ v1;
  v3 = *(_DWORD *)(a1 + 4) + v1;
  v5 = (v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 570425344;
  __asm { BR              X11 }
}

uint64_t sub_10002C754@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, int a7, int a8, unint64_t *a9, unsigned int a10, unint64_t *a11, char a12, uint64_t a13)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;

  v17 = *(_QWORD *)(v14 + 32);
  v18 = 1224239923
      * (((&a6 | 0xB684D67) - &a6 + (&a6 & 0xF497B298)) ^ 0xF9DBB0B0);
  a12 = 41 - 51 * (((&a6 | 0x67) - &a6 + (&a6 & 0x98)) ^ 0xB0);
  a7 = (v16 + 1172345150) ^ v18;
  a13 = v17;
  a9 = &STACK[0x7B15464A77B991FE];
  a11 = &STACK[0x5278D7E035630DE4];
  a6 = &STACK[0x185D909FC13F6E10];
  a10 = ((v13 ^ 0x7AD62ED3) + 1876620795 + ((v13 << (((v16 + 40) | 0x30) ^ 0x74)) & 0xB37FF4FE ^ 0x253A058)) ^ v18;
  v19 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v16 ^ 0x142)) - 4))(&a6);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((1359 * (a8 == 2017444214)) ^ v16)) - 12))(v19);
}

uint64_t sub_10002C8A0()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (int)((((((v2 + 26456952) & 0xFE6C4F5B) + 356) ^ 0x56D) * (v1 == 570425344)) ^ v2))
                            - 8))();
}

uint64_t sub_10002C8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  int v11;
  uint64_t v12;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12
                                                                                 + 8 * ((193 * (a11 + 4 < a11)) ^ v11))
                                                                     - 8))(a1, a2, a3, a4);
}

uint64_t sub_10002C950()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)((((((v0 + 475467336) & 0xE3A8F5EF) - 220) ^ (v0 + 861))
                                               * (((2 * v1) & 0xD5F66EEE ^ 0x454646AE) + (v1 ^ 0x5C5894A8) - 8544 == 1794840087)) ^ (v0 + 208)))
                            - 12))();
}

uint64_t sub_10002C9CC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v1 + v2 - 1794848631 < ((v0 + 304) ^ 0x60Eu)) * ((3 * (v0 ^ 0x48D)) ^ 0xB6)) ^ v0)))();
}

uint64_t sub_10002CA24(uint64_t a1, uint64_t a2, int a3)
{
  char v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((v4 + 354805531) & 0xEADA13FF ^ 0xFFFFFEE1) & (v6 - (v3 & 3))) <= a3 + ((v4 + 354805531) ^ 0x1525EBED ^ (v5 + 1523))) ^ v4))
                            - 8))();
}

uint64_t sub_10002CA84@<X0>(int a1@<W0>, unsigned int a2@<W2>, uint64_t a3@<X8>, uint8x8_t a4@<D0>)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (a1 - 1412);
  a4.i32[0] = *(_DWORD *)(a3 + (v8 ^ 0x16D) + a2);
  *(_DWORD *)(a3 - 3 + (v5 + v4)) = vmovn_s16((int16x8_t)vmovl_u8(a4)).u32[0];
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)((1948 * ((((_DWORD)v8 + 218) ^ 0x242) != v6)) ^ v8)) - 4))();
}

uint64_t sub_10002CAE8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((134 * ((v1 ^ 0x36A3A3DF) != ((v0 + 951) | 0x81) - 1453)) ^ v0))
                            - 8))();
}

uint64_t sub_10002CB3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = v4 > 0x3819CB10;
  *(_BYTE *)(a1 + (v7 - 267857836)) = *(_BYTE *)(v1 + (v7 - 267857836));
  if (v9 == v7 - 1209072316 < (((v2 + 1035) | 0x2D) ^ v3))
    v9 = v7 - 1209072316 < v5;
  return ((uint64_t (*)(BOOL))(*(_QWORD *)(v8 + 8 * ((v9 * v6) ^ v2)) - 8))(v7 - 1209072316 < v5);
}

uint64_t sub_10002CBB0@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(a2 - 3 + (v4 + v3)) = *(_DWORD *)(v2 - 3 + (v4 + v3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 4) * ((a1 ^ 0x35B) - 549)) ^ (a1 + 48))) - 4))();
}

uint64_t sub_10002CBFC(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_DWORD *)(a1 + (v5 - a3)) = *(_DWORD *)(v4 + (v5 - a3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((a3 + 4 == v6) * a4) ^ a2)) - 4))();
}

uint64_t sub_10002CC28()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (int)(((19 * (v2 ^ 0x249) + ((v2 + 871) ^ 0xFFFFFA54)) * (v0 != v1)) ^ v2))
                            - 12))();
}

uint64_t sub_10002CC64@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a2 + (v4 + v5 + a1 + 1168 - 1453)) = *(_BYTE *)(v2
                                                                         + (v4 + v5 + a1 + 1168 - 1453));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((124 * (v5 - 1 == v3)) ^ (a1 - 20))) - 8))();
}

uint64_t sub_10002CCA4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((844 * (*(_QWORD *)(v1 + 16) != 0x4A65459BC62410CFLL)) ^ v0))
                            - (v0 - 1168)
                            + 273))();
}

uint64_t sub_10002CCE0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_DWORD *)(a1 - 0x4A65459BC62410CFLL) = a6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * ((793 * (*(_QWORD *)(v7 + 24) != 0x3887978A43A9E934)) ^ v6 ^ 0x4B0))
                            - 12))();
}

void sub_10002CD3C(uint64_t a1@<X8>)
{
  _DWORD *v1;
  uint64_t v2;

  *(_QWORD *)(a1 - 0x3887978A43A9E934) = v2;
  *v1 = 2017444214;
}

void sub_10002CDD0()
{
  _DWORD v0[8];

  v0[0] = (1178560073 * (((v0 | 0x945DDB82) - (v0 & 0x945DDB82)) ^ 0x2EC9A3E0)) ^ 0xE1F2694A;
  sub_100045A38(v0);
  __asm { BR              X8 }
}

uint64_t sub_10002CE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t *a16, int a17, unsigned int a18)
{
  int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  a16 = &STACK[0x45F55F544B4A64C1];
  a18 = 1497 - 460628867 * (((&a16 | 0x8BB0E6D) - (&a16 & 0x8BB0E6D)) ^ 0x442D8C10);
  sub_10002483C((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * (((2 * (a17 == v18)) | (16 * (a17 == v18))) ^ v20)) - 8))(v21, v22, v23, v24, v25, v26, v27, v28, a9);
}

uint64_t sub_10002CF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, unint64_t *a19, unsigned int a20,int a21)
{
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;

  v23 = 1755732067
      * ((2 * ((&a16 ^ 0x4D536147) & 0x46C3A983) - (&a16 ^ 0x4D536147) + 960255612) ^ 0xAAA98AE0);
  a18 = a12;
  a19 = &STACK[0x28B7397347159519];
  a20 = v23 ^ 0x874EE385;
  a21 = v23 ^ 0x1788AFA8;
  a17 = v23 ^ 0x4583020D;
  v24 = sub_1000458EC((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22
                                                      + 8
                                                      * (((8 * (a16 == ((v21 + 615) ^ 0x2AB))) | (16
                                                                                                * (a16 == ((v21 + 615) ^ 0x2AB)))) ^ 0x407u))
                                          - 12))(v24);
}

uint64_t sub_10002D020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, uint64_t a15, unsigned int a16, unint64_t *a17, unint64_t *a18)
{
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void (*v22)(unsigned int *);
  uint64_t v23;

  a17 = &STACK[0x77F38C6ED9C42FBC];
  a18 = a13;
  a16 = (v20 - 119) ^ (1374699841
                     * ((2 * (&a16 & 0x3E37FD38) - &a16 - 1043856698) ^ 0xAC3C1ACF));
  v22 = (void (*)(unsigned int *))(*(_QWORD *)(v21 + 8 * (v20 ^ 0x204u)) - 12);
  v22(&a16);
  a16 = (v20 - 119) ^ (1374699841 * (((&a16 | 0x3811F97) - (&a16 & 0x3811F97)) ^ 0x6E75079E));
  a17 = &STACK[0x77F38C6ED9C42FB4];
  a18 = a13;
  v22(&a16);
  a16 = (v20 - 119) ^ (1374699841
                     * (((&a16 | 0x7695AD7B) + (~&a16 | 0x896A5284)) ^ 0x1B61B573));
  a17 = &STACK[0x77F38C6ED9C42FB8];
  a18 = a13;
  v22(&a16);
  LODWORD(a18) = v20
               - 1755732067
               * ((-493616554 - (&a16 | 0xE2940256) + (&a16 | 0x1D6BFDA9)) ^ 0xC3AD4072)
               + 305;
  a17 = a13;
  v23 = sub_10001924C((uint64_t)&a16);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * (((a16 == v18) * (((v20 + 886778507) & 0x570F) - 820)) ^ v20)))(v23);
}

uint64_t sub_10002D1D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15)
{
  int v15;
  uint64_t v16;
  unsigned int v17;

  return (*(uint64_t (**)(void))(v16 + 8 * ((1830 * (a15 == (((v17 + 407) | 4) ^ (v15 + 1019)))) ^ v17)))();
}

uint64_t sub_10002D204@<X0>(int a1@<W8>)
{
  int *v1;
  int *v2;
  int v3;
  int v4;
  void (*v6)(_BYTE *);
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  _BYTE v11[4];
  unsigned int v12;
  uint64_t v13;

  *v2 = v10 ^ v3;
  *v1 = (v4 + 411) ^ a1 ^ v9;
  v13 = v8;
  v12 = v4
      + 411
      + 535753261 * ((v11 + 1480479000 - 2 * ((unint64_t)v11 & 0x583E5118)) ^ 0x52CA5F37)
      + 244;
  v6(v11);
  v13 = v7;
  v12 = ((v4 - 105) | 0xA8)
      + 535753261
      * (((v11 | 0x58605BFA) - v11 + (v11 & 0xA79FA400)) ^ 0x529455D5)
      + 592;
  v6(v11);
  return v3 ^ 0x783FC176u;
}

void sub_10002D324(uint64_t a1)
{
  _BOOL4 v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x79262543413A964BLL) != 137555249
    && *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x79262543413A964BLL) != 137555249;
  __asm { BR              X14 }
}

uint64_t sub_10002D400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  int v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * ((((v4 - 433122531) & 0x19D0E7F7 ^ 0x322)
                                                                          * ((v5 + a3 - 133) >= 0x7FFFFF7D)) ^ v4))
                                                            - (((v4 - 995) | 1u) ^ 0x1C3)))(a1, a2, 2147482190);
}

uint64_t sub_10002D464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);

  v7 = (6 * (v6 ^ 0xD6)) ^ 0x683u;
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                             + 8 * (((v5 <= v6 - 463) * (int)v7) ^ v6))
                                                                 - 12);
  return v8(v8, v7, a3, a4);
}

uint64_t sub_10002D4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  _BOOL4 v20;

  v20 = a13 > -1559552513;
  *(_DWORD *)(a15 + 4 * (v19 - 139957518)) = v16;
  if (v20 == v19 - 727888653 < 1559552512)
    v20 = v19 - 727888653 < v18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((86 * !v20) ^ v17)) - 4))();
}

uint64_t sub_10002D54C()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((((158 * (v2 ^ 0x695) + 502) ^ 0xED) * (v1 == 0)) ^ (158 * (v2 ^ 0x695))))
                            - ((158 * (v2 ^ 0x695u) + 776) ^ 0x4EELL)))();
}

uint64_t sub_10002D590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  int v15;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * (int)((((v15 + 271145231) & 0xEFD6A3E6 ^ 0x707) * (a14 <= a10)) ^ v15))
                                                                                       - (v15 + 481)
                                                                                       + 1449))(a1, a2, a3, a4, a5, 2147482190);
}

uint64_t sub_10002D604()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(v2 - 108) = v1 - 558 - 1759421093 * ((v2 - 120) ^ 0xB37DB054);
  *(_QWORD *)(v2 - 120) = v4;
  sub_100005E90(v2 - 120);
  *(_DWORD *)(v2 - 108) = v1
                        - 558
                        - 1759421093 * ((((2 * (v2 - 120)) | 0x1F4924FA) - (v2 - 120) - 262443645) ^ 0xBCD92229);
  *(_QWORD *)(v2 - 120) = v5;
  sub_100005E90(v2 - 120);
  *(_QWORD *)(v2 - 120) = v0;
  *(_DWORD *)(v2 - 112) = v1 + 3804331 * ((((v2 - 120) | 0x8F66C20F) + (~(v2 - 120) | 0x70993DF0)) ^ 0xC3D9C8) + 332;
  *(_QWORD *)(v2 - 104) = v5;
  return sub_100027074(v2 - 120);
}

void sub_10002DB38(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  if (*(_QWORD *)(a1 + 24))
    v2 = *(_QWORD *)a1 == 0x28B73973471594F9;
  else
    v2 = 1;
  v3 = !v2;
  v1 = *(_DWORD *)(a1 + 12) - 235795823 * (a1 ^ 0x94AD4959);
  __asm { BR              X8 }
}

uint64_t sub_10002DC3C()
{
  unint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  STACK[0x308] = v0;
  LOBYTE(STACK[0x1A14]) = (-103 * ((2 * ((v4 + 56) & 0xE8) - (v4 + 56) + 17) ^ 0x23)) ^ 0x7F;
  *(_QWORD *)(v4 - 200) = &STACK[0x4757C876028022EF];
  *(_QWORD *)(v4 - 184) = &STACK[0x3F156345BCC53B8];
  *(_DWORD *)(v4 - 176) = (v1 + 242) ^ (1225351577
                                      * ((2 * ((v4 - 200) & 0x3CAEDAE8) - (v4 - 200) + 1129391377) ^ 0x3DAEBF23));
  v5 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v1 - 282)) - 4))(v4 - 200);
  v6 = *(_DWORD *)(v4 - 192);
  LODWORD(STACK[0x4C4]) = v6;
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (((v6 == 2017444214) * ((20 * (v1 ^ 0x168)) ^ 0x3B0)) ^ v1)))(v5);
}

uint64_t sub_10002DD44()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t (*v6)(uint64_t);

  STACK[0x298] = (unint64_t)&STACK[0x4CDEDD00D2C2DCA3];
  STACK[0x290] = (unint64_t)&STACK[0x30A48DFCEFC5E62B];
  STACK[0x288] = (unint64_t)&STACK[0x3BFE8E53F98A4047];
  STACK[0x280] = (unint64_t)&STACK[0x54BE37768DEB6C3C];
  *(_QWORD *)(v3 - 192) = &STACK[0x7E959159EFBD24D6];
  *(_WORD *)(v3 - 200) = 5399 - -2705 * ((((v3 - 200) | 0xB6B) - (v3 - 200) + ((v3 - 200) & 0xF490)) ^ 0x4232);
  *(_DWORD *)(v3 - 180) = v0
                        - 235795823
                        * ((((v3 - 200) | 0x8F6D0B6B) - (v3 - 200) + ((v3 - 200) & 0x7092F490)) ^ 0x1BC04232)
                        - 705;
  v4 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 - 829)))(v3 - 200);
  v5 = (LOBYTE(STACK[0x505]) << (v0 ^ 0x4C)) | (LOBYTE(STACK[0x504]) << 24) | (LOBYTE(STACK[0x506]) << 8) | LOBYTE(STACK[0x507]);
  LODWORD(STACK[0x3EC]) = v5 - ((2 * v5) & 0x2A6571BE) + 355645663;
  v6 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v1 + 8 * ((201 * ((LODWORD(STACK[0x3BC]) >> 3) & 1)) ^ v0)) - 8);
  STACK[0x230] = *(_QWORD *)(v2 + 8 * (v0 ^ 0x346));
  STACK[0x228] = *(_QWORD *)(v2 + 8 * (v0 ^ 0x3D5)) - 4;
  STACK[0x238] = *(_QWORD *)(v2 + 8 * (v0 ^ 0x30B)) - 12;
  return v6(v4);
}

uint64_t sub_10002E0A4@<X0>(char a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;

  if ((a1 & 2) != 0)
    v3 = 1115729965;
  else
    v3 = 1115729966;
  LODWORD(STACK[0x318]) = v3;
  LODWORD(STACK[0x2E8]) = 1413046585;
  LODWORD(STACK[0x2F0]) = 1548196254;
  STACK[0x2D0] = (unint64_t)&STACK[0xE20];
  STACK[0x2D8] = (unint64_t)&STACK[0xEA0];
  STACK[0x300] = (unint64_t)&STACK[0x620];
  STACK[0x2E0] = (unint64_t)&STACK[0xF20];
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((LODWORD(STACK[0x4C4]) == (v1 ^ 0x1E2) + 2017443512) * ((v1 ^ 0x3D0) - 120)) ^ ((v1 ^ 0x738) - 886))))();
}

uint64_t sub_10002E100(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 8) = v1 - 4;
  return result;
}

uint64_t sub_10002E108@<X0>(char a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  int v6;

  v4 = v2 + 3;
  if ((a1 & 0x20) != 0)
    v4 = v2;
  LODWORD(STACK[0x3DC]) = v4;
  v5 = STACK[0x308];
  if (v1 > -893133000)
  {
    if (v1 == -893132999 || v1 == 2093330203)
      goto LABEL_11;
    v6 = -452306508;
  }
  else
  {
    if (v1 == -2118282488 || v1 == -1510574798)
      goto LABEL_11;
    v6 = -1160454130;
  }
  if (v1 != v6)
    JUMPOUT(0x10002E0D4);
LABEL_11:
  *(_OWORD *)&STACK[0x1910] = xmmword_100047750;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((v5 + 117) ^ (53 * ((a1 & 0x20) == 0))))
                            - (((_DWORD)v5 + 177675003) & 0xF568E0A9 ^ 5)))();
}

uint64_t sub_10002E214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v63;
  int v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t);

  v66 = ((((_DWORD)a5 - 611) | 0x68u) ^ 0xFFFFFFFFFFFFFD91) + *(_QWORD *)(v65 + 8 * ((int)a5 - 1115));
  STACK[0x468] = v63 + 64;
  v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 + 8 * (int)((a5 - 611) | 0x68)) - 8);
  STACK[0x2F8] = v65;
  LODWORD(STACK[0x2C8]) = v64;
  return v67(a1, a2, 198082359, a4, a5, a6, 2559716826, 1735250469, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           v66,
           a59,
           &STACK[0x5F0],
           a61,
           a62,
           a63);
}

uint64_t sub_10002E244@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,int a42,uint64_t a43)
{
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;

  STACK[0x5F8] = 0x4CFA13F4805F36FBLL;
  STACK[0x5F0] = 0xA7443622ECC26587;
  v46 = a1 + 314;
  v47 = STACK[0x3DC];
  LODWORD(STACK[0x318]) = STACK[0x3DC];
  v48 = 460628867 * ((-2067849607 - ((v45 - 200) | 0x84BF1E79) + ((v45 - 200) | 0x7B40E186)) ^ 0x37D663FB);
  *(_DWORD *)(v45 - 176) = (268327533 * a42 + 624843326) ^ v48;
  *(_DWORD *)(v45 - 200) = a1 + 1115 - v48 - 491;
  *(_QWORD *)(v45 - 168) = &STACK[0x5F0];
  *(_QWORD *)(v45 - 152) = &STACK[0x1AA7AA324157A7DC];
  *(_QWORD *)(v45 - 144) = a43;
  *(_DWORD *)(v45 - 156) = (v47 - ((2 * v47 + 2063507368) & 0x58D6BC9E) + 1776987683) ^ v48;
  *(_QWORD *)(v45 - 192) = &STACK[0x17D9C19AEC6C5F73];
  *(_QWORD *)(v45 - 184) = &STACK[0x621D43C813E51E92];
  v49 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v44 + 8 * ((a1 + 1115) ^ 0x4EA)) - 8))(v45 - 200);
  v50 = *(_DWORD *)(v45 - 160);
  LODWORD(STACK[0x4C4]) = v50;
  return (*(uint64_t (**)(uint64_t))(v43 + 8 * ((1808 * (v50 == 2017444214)) ^ v46)))(v49);
}

uint64_t sub_10002E3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t (*a31)(_QWORD, _QWORD, _QWORD, _QWORD, unint64_t *, unint64_t, _QWORD, unint64_t *),uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,int a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int *a66;
  uint64_t (*a67)(_QWORD, unint64_t, _QWORD);
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  unsigned int v71;
  uint64_t v72;

  if (v67 == 1115729972 || v67 == 1115729969)
  {
    LOBYTE(STACK[0x193F]) = LOBYTE(STACK[0x5FF]) ^ 0xE7;
    LOBYTE(STACK[0x193E]) = LOBYTE(STACK[0x5FE]) ^ 0xE7;
    LOBYTE(STACK[0x193D]) = LOBYTE(STACK[0x5FD]) ^ 0xE7;
    LOBYTE(STACK[0x193C]) = LOBYTE(STACK[0x5FC]) ^ 0xE7;
    LOBYTE(STACK[0x193B]) = LOBYTE(STACK[0x5FB]) ^ 0xE7;
    LOBYTE(STACK[0x193A]) = LOBYTE(STACK[0x5FA]) ^ 0xE7;
    LOBYTE(STACK[0x1939]) = LOBYTE(STACK[0x5F9]) ^ 0xE7;
    LOBYTE(STACK[0x1938]) = LOBYTE(STACK[0x5F8]) ^ 0xE7;
    LOBYTE(STACK[0x1937]) = LOBYTE(STACK[0x5F7]) ^ 0xE7;
    LOBYTE(STACK[0x1936]) = LOBYTE(STACK[0x5F6]) ^ 0xE7;
    LOBYTE(STACK[0x1935]) = LOBYTE(STACK[0x5F5]) ^ 0xE7;
    LOBYTE(STACK[0x1934]) = LOBYTE(STACK[0x5F4]) ^ 0xE7;
    LOBYTE(STACK[0x1933]) = LOBYTE(STACK[0x5F3]) ^ 0xE7;
    LOBYTE(STACK[0x1932]) = LOBYTE(STACK[0x5F2]) ^ 0xE7;
    LOBYTE(STACK[0x1931]) = LOBYTE(STACK[0x5F1]) ^ 0xE7;
    LOBYTE(STACK[0x1930]) = LOBYTE(STACK[0x5F0]) ^ 0xE7;
  }
  v69 = STACK[0x308] - 783;
  v70 = a31(LODWORD(STACK[0x41C]), v67 - 1115729966 + 17 * (STACK[0x308] ^ 0x477) - 321, a42 ^ 0x93FE24CD, LODWORD(STACK[0x3EC]) ^ 0x1532B8DFu, &STACK[0x1930], STACK[0x548], LODWORD(STACK[0x3A0]), &STACK[0x1900]);
  v71 = ((2 * v70) & 0xBDDF73BC) + (v70 ^ 0x5EEFB9DE);
  v72 = a67(*a66, STACK[0x548], LODWORD(STACK[0x3A0]));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v68 + 8 * ((47 * (v71 != 1592768990)) ^ v69)) - 8))(v72);
}

void sub_10002E598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;

  v33 = 3804331 * ((((v32 - 200) | 0x211E3AE4) - ((v32 - 200) & 0x211E3AE4)) ^ 0xAEBB2122);
  *(_QWORD *)(v32 - 192) = a29;
  *(_DWORD *)(v32 - 200) = (v30 - (((v29 + 801) ^ 0xF07F8688) & (2 * v30 + 1109429316)) + 424675224) ^ v33;
  *(_DWORD *)(v32 - 196) = v29 - v33 + 871;
  sub_1000193D0((_DWORD *)(v32 - 200));
  *(_DWORD *)(v32 - 200) = (((~(v32 - 200) & 0xA39E7912) - (~(v32 - 200) | 0xA39E7913)) ^ 0x512D84C4) * v31
                         + 2138962236
                         + v29
                         + 801;
  sub_10004696C((_DWORD *)(v32 - 200));
  JUMPOUT(0x10002F2C4);
}

uint64_t sub_10002E628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t (*a27)(uint64_t),uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  char v49;
  unint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  int v54;

  if (v44 == 1115729969 || v44 == 1115729972)
  {
    v47 = STACK[0x308];
    v48 = STACK[0x308] ^ 0x1CB;
    LOBYTE(STACK[0x192F]) = LOBYTE(STACK[0x190F]) - ((2 * LOBYTE(STACK[0x190F])) & 0xCF) - 25;
    LOBYTE(STACK[0x192E]) = LOBYTE(STACK[0x190E]) - ((LOBYTE(STACK[0x190E]) << (v47 ^ 0x65)) & 0xCE) - 25;
    LOBYTE(STACK[0x192D]) = LOBYTE(STACK[0x190D]) - ((2 * LOBYTE(STACK[0x190D])) & 0xCF) - 25;
    LOBYTE(STACK[0x192C]) = LOBYTE(STACK[0x190C]) - ((2 * LOBYTE(STACK[0x190C])) & 0xCF) - 25;
    LOBYTE(STACK[0x192B]) = LOBYTE(STACK[0x190B]) - ((2 * LOBYTE(STACK[0x190B])) & 0xCF) - 25;
    LOBYTE(STACK[0x192A]) = LOBYTE(STACK[0x190A]) - ((2 * LOBYTE(STACK[0x190A])) & 0xCF) - 25;
    LOBYTE(STACK[0x1929]) = LOBYTE(STACK[0x1909]) - ((2 * LOBYTE(STACK[0x1909])) & 0xCF) - 25;
    LOBYTE(STACK[0x1928]) = LOBYTE(STACK[0x1908]) - ((2 * LOBYTE(STACK[0x1908])) & 0xCF) - 25;
    LOBYTE(STACK[0x1927]) = LOBYTE(STACK[0x1907]) - ((2 * LOBYTE(STACK[0x1907])) & 0xCF) - 25;
    LOBYTE(STACK[0x1926]) = LOBYTE(STACK[0x1906]) - ((2 * LOBYTE(STACK[0x1906])) & 0xCF) - 25;
    LOBYTE(STACK[0x1925]) = LOBYTE(STACK[0x1905]) - ((2 * LOBYTE(STACK[0x1905])) & 0xCF) - 25;
    LOBYTE(STACK[0x1924]) = LOBYTE(STACK[0x1904]) - ((2 * LOBYTE(STACK[0x1904])) & 0xCF) - 25;
    LOBYTE(STACK[0x1923]) = LOBYTE(STACK[0x1903]) - ((2 * LOBYTE(STACK[0x1903])) & 0xCF) - 25;
    LOBYTE(STACK[0x1922]) = LOBYTE(STACK[0x1902]) - ((2 * LOBYTE(STACK[0x1902])) & 0xCF) - 25;
    LOBYTE(STACK[0x1921]) = LOBYTE(STACK[0x1901]) - ((2 * LOBYTE(STACK[0x1901])) & 0xCF) - 25;
    v44 = STACK[0x318];
    v49 = LOBYTE(STACK[0x1900]) - ((2 * LOBYTE(STACK[0x1900])) & 0xCF) - 25;
  }
  else
  {
    v48 = STACK[0x308] + 331;
    LOBYTE(STACK[0x192F]) = STACK[0x5FF];
    LODWORD(STACK[0x192B]) = STACK[0x5FB];
    STACK[0x1923] = STACK[0x5F3];
    LOWORD(STACK[0x1921]) = STACK[0x5F1];
    v49 = STACK[0x5F0];
  }
  LOBYTE(STACK[0x1920]) = v49;
  v50 = STACK[0x310];
  v51 = STACK[0x474];
  v52 = 1374699841 * ((2 * ((v46 - 200) & 0x23661F28) - (v46 - 200) - 593895214) ^ 0xB16DF8DB);
  *(_DWORD *)(v46 - 200) = v48 - v52 - 1204;
  *(_DWORD *)(v46 - 196) = v52 + (v51 ^ 0xD6FFBEFA) + ((v51 << (v48 ^ 0xAE)) & 0xADFF7DF4) + 2138792448;
  *(_DWORD *)(v46 - 144) = v52 + v44 - 408093242;
  *(_QWORD *)(v46 - 160) = a28;
  *(_QWORD *)(v46 - 152) = v43;
  *(_QWORD *)(v46 - 136) = a43;
  LOBYTE(STACK[0x1A10]) = -49 - 65 * ((2 * ((v46 + 56) & 0x28) - (v46 + 56) - 46) ^ 0xDB);
  *(_QWORD *)(v46 - 168) = &STACK[0x1920];
  *(_QWORD *)(v46 - 184) = v50;
  v53 = a27(v46 - 200);
  v54 = *(_DWORD *)(v46 - 192);
  LODWORD(STACK[0x4C4]) = v54;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v45
                                                      + 8
                                                      * (((v54 == 2017444214) * ((v48 - 1523437160) & 0x5ACDC9FB ^ 0x156)) ^ v48))
                                          - 4))(v53);
}

uint64_t sub_10002E94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49)
{
  int v49;
  int v50;
  uint64_t v51;

  return (*(uint64_t (**)(void))(v51
                              + 8
                              * ((1128
                                * (((((((v50 ^ 0x4EC) - 319) | 0x460) ^ (v49 - 2048))
                                   + (((v50 ^ 0x4EC) - 598160086) & 0x23A735F6)) ^ LODWORD(STACK[0x564])) != a49 - 374483023)) ^ v50 ^ 0x4EC)))();
}

void sub_10002E9BC(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  LODWORD(STACK[0x4C4]) = v2 + 121;
  *(_DWORD *)(v3 - 200) = (((~(v3 - 200) & 0xA39E7912) - (~(v3 - 200) | 0xA39E7913)) ^ 0x512D84C4) * v1
                        + 2138962236
                        + a1;
  sub_10004696C(v3 - 200);
  JUMPOUT(0x10002F2C4);
}

void sub_10002E9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int *a65;
  void (*a66)(_QWORD, unint64_t, _QWORD);

  a66(*a65, STACK[0x310], LODWORD(STACK[0x474]));
  JUMPOUT(0x10002F274);
}

uint64_t sub_10002E9E4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = ((uint64_t (*)(void))STACK[0x230])();
  LODWORD(STACK[0x42C]) = v0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * ((v1 + 236) ^ v2)) - (v1 ^ 0xDBu) + 1207))(v4);
}

void sub_10002EA28()
{
  int v0;

  LODWORD(STACK[0x4C4]) = v0;
  JUMPOUT(0x10002EA30);
}

uint64_t sub_10002EA6C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  LODWORD(STACK[0x42C]) = v2;
  STACK[0x518] = STACK[0x300];
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (((*(_DWORD *)STACK[0x238] == 0) * (((a1 - 124) | 0x4B0) - 1674)) ^ a1))
                            - 8))();
}

uint64_t sub_10002EAB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a69;
  uint64_t a70;
  int v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;

  STACK[0x4F8] = 0;
  v73 = 535753261 * ((v72 - 188424848 - 2 * ((v72 - 200) & 0xF4C4DE38)) ^ 0xFE30D017);
  *(_QWORD *)(v72 - 176) = a70;
  *(_QWORD *)(v72 - 184) = a69;
  *(_QWORD *)(v72 - 168) = 0x5D1402DDCC693777;
  *(_DWORD *)(v72 - 196) = -1570122582 - v73;
  *(_DWORD *)(v72 - 192) = (v70 - 1493) ^ v73;
  v74 = ((uint64_t (*)(uint64_t))STACK[0x228])(v72 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v71
                                                      + 8
                                                      * ((7
                                                        * ((((v70 - 1089) ^ 0xFB ^ (*(_DWORD *)(v72 - 200) == 2017444214)) & 1) == 0)) ^ v70))
                                          - 12))(v74);
}

uint64_t sub_10002EB84()
{
  int v0;
  unint64_t v1;
  uint64_t v2;
  int v3;

  STACK[0x2F8] = v1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((v3 + LODWORD(STACK[0x3A4]) + v0 + 538 - 3173) < 0xFFFFF7FF)
                                          * ((14 * (v0 ^ 0x258)) ^ 0x21)) ^ v0))
                            - 8))();
}

uint64_t sub_10002EBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int *a65;
  void (*a66)(_QWORD, unint64_t *, uint64_t);
  int v66;
  uint64_t v67;
  int v68;
  uint64_t (*v69)(void);

  a66(*a65, &STACK[0x518], 2048);
  v69 = (uint64_t (*)(void))(*(_QWORD *)(v67
                                      + 8
                                      * (((((unsigned int (*)(_QWORD, unint64_t *, _QWORD, uint64_t))*(&off_10005BF50 + v66 - 47))(*a65, &STACK[0x4C8], (LODWORD(STACK[0x3A4]) + v68), 1) == 0)* ((4 * v66) ^ 0x70D)) ^ v66))- 8);
  return v69();
}

uint64_t sub_10002EC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  v7 = ((v5 ^ 0x3F5) + 69871982) & 0xFBD5D7EC;
  STACK[0x518] = STACK[0x4C8];
  v8 = LODWORD(STACK[0x3A4]) - ((2 * LODWORD(STACK[0x3A4]) + 312539504) & (v7 ^ 0x73C00F92)) + 1127252659;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (int)((1663
                                               * (((2 * v8) & 0x9FF7F5FE ^ 0x13C001F6) + (v8 ^ 0xF61BFF04) - 184094818 != a5)) ^ (v7 - 872)))
                            - 8))();
}

uint64_t sub_10002ED34()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((v2 - 1341913856 + v1 + v0 - 1123) < 8) * ((v2 ^ 0x1C0) - 1368)) ^ v2 ^ 0x1C0)))();
}

uint64_t sub_10002ED78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((v2 - 647) ^ 0x779) - 999) * ((unint64_t)(v1 - a1) > 0x1F)) ^ (v2 - 1278)))
                            - 8))();
}

uint64_t sub_10002EDB0(int a1)
{
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((52 * (v1 < ((a1 + 973050824) & 0xC6006D7E ^ 0x4E6 ^ ((a1 - 765) | 0x82)))) ^ a1))
                            - 8))();
}

uint64_t sub_10002EE08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v7 = v4 - 1341913856 + v3;
  v8 = v1 + v7;
  v9 = *(_OWORD *)(v8 - 31);
  v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = *(_OWORD *)(v8 - 15);
  *(_OWORD *)(v10 - 31) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((v2 & 0xFFFFFFE0) != 32) * ((v5 - 897) ^ 0xA5)) ^ (v5 - 220)))
                            - 4))();
}

void sub_10002EE68()
{
  JUMPOUT(0x10002EE24);
}

uint64_t sub_10002EE74(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((4 * a1) ^ 0x32A) + 316) * (v1 == v2)) ^ a1)) - 8))();
}

uint64_t sub_10002EEA8(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((911
                                          * ((((a2 - 70) ^ (((((a2 - 1675466919) & 0x63DD98A2) - 138) & v2) == 0)) & 1) == 0)) ^ a2))
                            - 8))();
}

uint64_t sub_10002EF04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(a1 - 7 + (v4 - 1341913856 + v3 - v5)) = *(_QWORD *)(v1
                                                                              - 7
                                                                              + (v4 - 1341913856 + v3 - v5));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((((v6 - 144) | 0x84) ^ 0xFFFFFF6E) & v2) - v5 != 8)
                                          * ((((v6 - 144) | 0x84) ^ 0x30) - 114)) ^ ((v6 - 144) | 0x84)))
                            - 4))();
}

uint64_t sub_10002EF70(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a1 + (v2 + a2)) = *(_QWORD *)(v6 + (v2 + a2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v5 + a2 != 8) * v3) ^ v4)) - 4))();
}

uint64_t sub_10002EFA0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v1 + 257) * (v0 == v2)) ^ v1))
                            - (((v1 - 162) | 0x460u) ^ 0x46CLL)))();
}

uint64_t sub_10002EFDC@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a2 + (v4 + v5)) = *(_BYTE *)(v2 + (v4 + v5));
  return (*(uint64_t (**)(void))(v6 + 8 * ((8 * (v4 - 1 != a1)) | (16 * (v4 - 1 != a1)) | (v3 + 189))))();
}

uint64_t sub_10002F010()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v1 + 8 * ((176 * (STACK[0x4F8] == 0)) ^ (v0 + 268))))();
}

uint64_t sub_10002F04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  LODWORD(STACK[0x42C]) = v4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(*(_QWORD *)(v7 + 8 * ((v5 + 236) ^ v6))
                                                                                       - (v5 ^ 0xDBu)
                                                                                       + 1207))(a1, a2, a3, a4, STACK[0x308]);
}

uint64_t sub_10002F080@<X0>(int a1@<W8>)
{
  char v1;
  uint64_t v2;

  LODWORD(STACK[0x40C]) = STACK[0x2E8];
  LODWORD(STACK[0x43C]) = STACK[0x2F0];
  STACK[0x348] = STACK[0x2D0];
  STACK[0x570] = STACK[0x2D8];
  STACK[0x398] = STACK[0x2E0];
  STACK[0x468] = STACK[0x2F8];
  LODWORD(STACK[0x484]) = 2;
  STACK[0x378] = 0;
  LODWORD(STACK[0x500]) = 0;
  LODWORD(STACK[0x418]) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((a1 - 1179) | 0x440) ^ 0x436) * ((v1 & 2) == 0)) ^ a1)) - 12))();
}

uint64_t sub_10002F0F4@<X0>(uint64_t a1@<X5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  int v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  char *v37;
  int v38;
  int v39;
  uint64_t v40;

  *(_DWORD *)(STACK[0x238] + 360) = 1115729966;
  v31 = ((uint64_t (*)(uint64_t, uint64_t, unint64_t *, unint64_t, _QWORD, uint64_t, unint64_t *, unint64_t *))*(&off_10005BF50 + ((a2 - 91) ^ 0x42D)))(v26, 2, &STACK[0x484], STACK[0x518], (v24 - 1991213896), a1, &STACK[0x378], &STACK[0x500]);
  v34 = STACK[0x308];
  v35 = ((2 * v31) & 0xEFBE9EBA) + (v31 ^ 0xF7DF4F5D);
  LODWORD(STACK[0x330]) = v35 + 993522688;
  if (v35 == -136360099)
  {
    LODWORD(STACK[0x4B4]) = 583829168;
    STACK[0x490] = STACK[0x378];
    STACK[0x3C0] = v27;
    STACK[0x420] = v25;
    v37 = (char *)&STACK[0x600] + v29 + ((((_DWORD)v34 - 548) | 0x29u) ^ 0x87FEE19BAF3B240BLL);
    STACK[0x340] = (unint64_t)v37;
    STACK[0x360] = (unint64_t)(v37 + 128);
    *(_QWORD *)v37 = 0x6370646600;
    v37[8] = 1;
    JUMPOUT(0x10002F45CLL);
  }
  if (v35 == 132075360)
  {
    LODWORD(STACK[0x42C]) = -2017420722;
    return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28
                                                                                            + 8
                                                                                            * ((638 * (STACK[0x378] != 0)) ^ ((int)v34 - 70)))
                                                                                - (((_DWORD)v34 - 580) | 0x91u)
                                                                                + 685))(v31, STACK[0x378], v32, v33);
  }
  else
  {
    v38 = 3804331 * ((v30 - 42613452 - 2 * ((v30 - 200) & 0xFD75C5FC)) ^ 0x72D0DE3A);
    *(_QWORD *)(v30 - 192) = a24;
    *(_DWORD *)(v30 - 200) = (v35 - 2141162982 + (~(2 * (v35 + 993522688) - 1714325178) | 0xF807D13)) ^ v38;
    *(_DWORD *)(v30 - 196) = v34 - v38 + 70;
    v39 = v34;
    v40 = sub_1000193D0((_DWORD *)(v30 - 200));
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v28 + 8 * ((638 * (STACK[0x378] != 0)) ^ (v39 - 70)))
                                            - ((v39 - 580) | 0x91u)
                                            + 685))(v40);
  }
}

uint64_t sub_10002F200()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((STACK[0x548] == 0) * (17 * ((v0 - 1048744230) & 0x3E8294FD ^ 0x477) - 321)) ^ (((v0 - 1048744230) & 0x3E8294FD) - 803))))();
}

void sub_10002F254()
{
  JUMPOUT(0x10002F26CLL);
}

uint64_t sub_10002F308()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  LODWORD(STACK[0x40C]) = STACK[0x2E8];
  LODWORD(STACK[0x43C]) = STACK[0x2F0];
  STACK[0x348] = STACK[0x2D0];
  STACK[0x570] = STACK[0x2D8];
  STACK[0x398] = STACK[0x2E0];
  ++*(_DWORD *)(v0 + 52);
  LODWORD(STACK[0x318]) = *(_DWORD *)(v0 + 360);
  STACK[0x468] = ((v2 - 128) ^ 0xFF2) + v1 - 2432;
  LODWORD(STACK[0x4C4]) = v4;
  LODWORD(STACK[0x2F0]) = STACK[0x43C];
  LODWORD(STACK[0x2E8]) = STACK[0x40C];
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (int)(((STACK[0x488] == 0)
                                               * (133 * ((v2 - 128) ^ 0x671) + ((v2 + 944951531) & 0xC7AD2E76) - 1674)) ^ (v2 - 128)))
                            - 4))();
}

void sub_10002F350(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  unint64_t v3;
  char *v4;

  LODWORD(STACK[0x40C]) = STACK[0x2E8];
  LODWORD(STACK[0x43C]) = STACK[0x2F0];
  STACK[0x348] = STACK[0x2D0];
  STACK[0x570] = STACK[0x2D8];
  STACK[0x398] = STACK[0x2E0];
  LODWORD(STACK[0x42C]) = a1;
  v3 = ((v1 - 290) ^ 0xFFFFFFFFFFFFF70FLL) + v2 + (v1 - 290) + 2033;
  STACK[0x468] = v3;
  LODWORD(STACK[0x4C4]) = a1;
  LODWORD(STACK[0x2F0]) = STACK[0x43C];
  LODWORD(STACK[0x2E8]) = STACK[0x40C];
  v4 = (char *)&STACK[0x600] + v3 - 0x78011E6450C4E31ELL;
  STACK[0x2D0] = (unint64_t)(v4 + 2048);
  STACK[0x2D8] = (unint64_t)(v4 + 2176);
  STACK[0x300] = (unint64_t)v4;
  STACK[0x2E0] = (unint64_t)(v4 + 2304);
  JUMPOUT(0x10002EA30);
}

void sub_10002F38C()
{
  LODWORD(STACK[0x330]) = 857162589;
  JUMPOUT(0x10002F3A8);
}

uint64_t sub_10002F4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,unint64_t a61,int a62,int a63)
{
  int a64;
  unint64_t a65;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _BOOL4 v74;
  uint64_t (*v75)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v69 = (a8 - 1162521198) & 0x454AA995;
  v70 = (char *)&a9 + v65 - 0x78011E6450C4DD1ELL;
  v71 = ((v69 ^ 0x181u) + 16 * (_DWORD)v70) & ((a8 + 2036915347) & 0x86972567 ^ 0x444);
  v72 = (v69 + 808);
  a65 = (v72 ^ 0x4A9) + (unint64_t)&STACK[0x4F4] % 0x25;
  v73 = (unint64_t)&v70[v71];
  STACK[0x258] = (v68 - 200) | 0x384911B430DD2077;
  a64 = (a4 + 114666378) & 0xF92A539F;
  a62 = a4 ^ 0x4CA;
  STACK[0x2E8] = (1178560073
                * ((((v68 - 200) | 0x576FD5F7CC5860D8) - (v68 - 200) + ((v68 - 200) & 0xA8902A0833A79F20)) ^ 0x4C93851F76CC18BALL)) ^ 0xC2A93EFD;
  STACK[0x2E0] = (1178560073
                * ((2 * ((v68 - 200) & 0x1E3A8EFD540DC180) - (v68 - 200) - 0x1E3A8EFD540DC187) ^ 0xFA3921EA1166461BLL)) ^ 0x4B644C29;
  LODWORD(STACK[0x2C0]) = a4 ^ 0x40B;
  LODWORD(STACK[0x2B8]) = a4 + 1761061275;
  LODWORD(STACK[0x2A0]) = a4 ^ 0x41C;
  STACK[0x2F0] = STACK[0x530];
  STACK[0x300] = v73;
  a61 = v73 + 16;
  *(int32x4_t *)&STACK[0x240] = vdupq_n_s32(0x7FFFFFFEu);
  *(int32x4_t *)&STACK[0x200] = vdupq_n_s32(0xE96D67F4);
  *(int32x4_t *)&STACK[0x210] = vdupq_n_s32(0xD2DACFE8);
  v74 = ((2 * ((v69 + 1671253576) & 0x9C62B1B7 ^ 0x3A3)) ^ 0x444) != 32;
  v75 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 8 * (int)((v74 | (2 * v74)) ^ v72));
  STACK[0x2D8] = *(_QWORD *)(v67 + 8 * (v69 - 275));
  STACK[0x2D0] = *(_QWORD *)(v67 + 8 * (v69 - 194));
  return v75(a1, a2, a3, 3916261364, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

uint64_t sub_10002F768(uint64_t a1, uint64_t a2, int a3)
{
  char v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  unint64_t v13;

  v11 = (_BYTE *)(v7 + (a3 - 198082344));
  v12 = 828307833
      * ((*(_DWORD *)(*(_QWORD *)STACK[0x2D8]
                    + (int)(*(_DWORD *)STACK[0x2D0] & (((v5 - 969854738) & 0x39CECFF7 ^ 0xA0C36C0C) + (v5 ^ 0x528)))) ^ v11) & 0x7FFFFFFF);
  v13 = 828307833 * (v12 ^ HIWORD(v12));
  LOBYTE(v13) = *(_BYTE *)(*(_QWORD *)(v10 + 8 * (v5 - 289)) + (v13 >> 24)) ^ ((v4 ^ v6) >> v3) ^ *(_BYTE *)(*(_QWORD *)(v10 + 8 * (v5 - 172)) + (v13 >> 24) - 4) ^ *(_BYTE *)((v13 >> 24) + *(_QWORD *)(v10 + 8 * (v5 ^ 0x142)) + 1) ^ v13 ^ (-123 * BYTE3(v13));
  *v11 = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((1338 * (a3 - (v13 != 0) == v9)) ^ v5)) - 8))();
}

void sub_1000304A0()
{
  JUMPOUT(0x10002F70CLL);
}

uint64_t sub_1000304A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t (*a58)(void))
{
  unint64_t v58;

  STACK[0x538] = v58;
  STACK[0x530] = STACK[0x2F0];
  return a58();
}

uint64_t sub_1000304D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,unint64_t a59,uint64_t a60,unint64_t a61,char *a62,uint64_t a63)
{
  uint64_t a65;
  uint64_t a72;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  BOOL v77;
  int v78;

  v75 = STACK[0x490];
  STACK[0x588] = *(_QWORD *)(v74 + 8 * (a5 - 1065));
  a62 = (char *)&a9 - 0x78011E6450C4E11BLL;
  v76 = a72;
  a61 = ((unint64_t)&STACK[0x440] ^ 0xEFDF7EFDF9EFF7F6)
      + v73
      + (((_QWORD)&STACK[0x440] << (4 * a5 + 113)) & 0xDFBEFDFBF3DFEFE0);
  a59 = a61 + 17;
  LODWORD(STACK[0x200]) = 27 * (a5 ^ 0x440);
  a58 = a5 - 337;
  a65 = (4 * a5) ^ 0x13F4u;
  LODWORD(STACK[0x260]) = a5 + 2064065363;
  STACK[0x468] = v76 + 112;
  STACK[0x3E0] = v75;
  if (v75)
    v77 = v72 == 0;
  else
    v77 = 1;
  v78 = v77;
  return ((uint64_t (*)(uint64_t, __n128))(*(_QWORD *)(v74 + 8 * ((55 * v78) ^ (4 * a5) ^ 0x1100))
                                                  - (((4 * a5) ^ 0x1100u)
                                                   + 636)
                                                  + 772))(281, (__n128)0);
}

uint64_t sub_1000305DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  int v64;
  uint64_t v65;
  uint64_t v66;

  STACK[0x468] = v65 - 112;
  STACK[0x300] = *(_QWORD *)(v66 + 8 * (v64 ^ 0x441)) - 8;
  return a9(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64);
}

uint64_t sub_100030608(uint64_t a1, uint64_t a2, __n128 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;

  v68 = (char *)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E782;
  *(_DWORD *)v68 = 1945921493;
  *((_QWORD *)v68 + 1) = 0;
  *((_DWORD *)v68 + 4) = 1380763022;
  *((_DWORD *)v68 + 6) = 1991213896;
  *((_QWORD *)v68 + 4) = 0;
  *(_DWORD *)((char *)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E75ALL) = 1991213896;
  STACK[0x320] = (unint64_t)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E75ALL;
  *((_QWORD *)v68 + 6) = 0;
  STACK[0x540] = (unint64_t)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E752;
  *((_DWORD *)v68 + 14) = 1991213896;
  STACK[0x410] = (unint64_t)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E74ALL;
  *((_QWORD *)v68 + 8) = 0;
  STACK[0x590] = (unint64_t)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E742;
  *((_DWORD *)v68 + 18) = 1991213896;
  STACK[0x3A8] = (unint64_t)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E73ALL;
  *((_QWORD *)v68 + 10) = 0;
  STACK[0x4A8] = (unint64_t)&STACK[0x600] + v64 + v66 - 0x78011E6450C4E732;
  v68[88] = 17;
  *(_DWORD *)v65 = 1945921493;
  *(__n128 *)(v65 + 4) = a3;
  *(_DWORD *)(v65 + 20) = 0;
  *(_DWORD *)(v65 + 24) = 1991213896;
  *(_DWORD *)(v65 + 28) = 1050988052;
  STACK[0x258] = v65 + 28;
  *(_DWORD *)(v65 + 232) = 1050988052;
  STACK[0x240] = v65 + 232;
  *(__n128 *)(v65 + 436) = a3;
  *(__n128 *)(v65 + 452) = a3;
  *(_QWORD *)(v65 + 468) = 0;
  *(_QWORD *)(v65 + 1128) = 0xE7E7E7E7E7E7E7E7;
  *(_QWORD *)(v65 + 1136) = 0xE7E7E7E7E7E7E7E7;
  *(_QWORD *)(v65 + 1144) = 3890735079;
  *(__n128 *)(v65 + 1152) = a3;
  *(__n128 *)(v65 + 1168) = a3;
  *(__n128 *)(v65 + 1184) = a3;
  return ((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 + 8 * v63) - 4))(a1, a2, v68, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           v66);
}

uint64_t sub_100030740(__n128 a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;

  v6 = (__n128 *)(v4 + v2);
  v6[73] = a1;
  v6[74] = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v2 == 224) * v1) ^ v3)) - 4))();
}

uint64_t sub_10003076C@<X0>(int a1@<W8>, __n128 a2@<Q0>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_DWORD *)(v2 + 1424) = 866215440;
  *(_DWORD *)(v2 + 1428) = 1355454106;
  *(_QWORD *)(v2 + 1432) = v3;
  *(_QWORD *)(v2 + 1440) = v3;
  *(_DWORD *)(v2 + 1448) = v4;
  *(__n128 *)(v2 + 1452) = a2;
  return (*(uint64_t (**)(void))(v5 + 8 * ((577 * (((a1 - 1107) ^ 0x1BLL) == 16)) | a1)))();
}

uint64_t sub_1000307C8@<X0>(int a1@<W1>, int a2@<W8>, __n128 a3@<Q0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(__n128 *)(v6 + v4) = a3;
  return (*(uint64_t (**)(void))(v7 + 8 * (((v4 - 1436 == (v3 ^ v5)) * a1) | a2)))();
}

uint64_t sub_1000307F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,unint64_t a62,uint64_t a63)
{
  uint64_t a65;
  int v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  int v74;
  _DWORD *v75;
  _BOOL4 v77;
  uint64_t v78;

  v71 = v65 ^ 0x126u;
  *(_QWORD *)(v66 + 1516) = v67;
  *(_QWORD *)(v66 + 1524) = v67;
  *(_DWORD *)(v66 + 1532) = v69;
  *(_QWORD *)(a3 + 96) = v66;
  a65 = v66;
  *(_DWORD *)(v66 + 476) = 895738218;
  STACK[0x2E0] = STACK[0x3E0];
  STACK[0x2D8] = *(_QWORD *)(v70 + 8 * v65) - 8;
  v72 = STACK[0x468];
  v73 = (char *)&a9 + STACK[0x468] - 0x78011E6450C4DD1ELL;
  STACK[0x2A0] = STACK[0x468];
  STACK[0x268] = v71 + v72 + 51;
  STACK[0x2E8] = (unint64_t)v73;
  STACK[0x210] = (unint64_t)(v73 + 392);
  a62 = a3;
  STACK[0x270] = a3;
  v74 = (2 * v71) ^ 0x370;
  STACK[0x468] = STACK[0x268];
  LODWORD(STACK[0x49C]) = -1811463647;
  LODWORD(STACK[0x404]) = 1991213896;
  STACK[0x4E8] = 0;
  LODWORD(STACK[0x554]) = 223289210;
  v75 = (_DWORD *)STACK[0x2E8];
  *v75 = 831158449;
  LODWORD(STACK[0x2D0]) = -1957639129;
  LODWORD(STACK[0x2F0]) = 1750077933;
  LODWORD(STACK[0x300]) = v74 - 356752077;
  LODWORD(STACK[0x2B8]) = 1738800943;
  v77 = *v75 != 831158449 || (_DWORD)a8 + 1 != (_DWORD)a8 + ((v74 - 298) | 0x82) - 226;
  v78 = *(_QWORD *)(v70 + 8 * ((v77 * ((v74 + 730) ^ 0x62A)) ^ v74));
  LODWORD(STACK[0x2C0]) = -1857752705;
  LODWORD(STACK[0x2C8]) = v68;
  return ((uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v78 - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59);
}

uint64_t sub_100030984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;

  return (*(uint64_t (**)(void))(v10 + 8 * ((26 * (v8 != a8)) ^ v9)))();
}

uint64_t sub_1000309B0()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((30 * (v0 ^ 0xF6) + 1) ^ 0x2A9)
                                          * (((v1 - 1991213893) & 0xFFFFFFFC) - LODWORD(STACK[0x2C8]) == -1991213896)) ^ (30 * (v0 ^ 0xF6))))
                            - 4))();
}

uint64_t sub_100030A04()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((429 * (((v0 == 831158449) ^ (v1 - 96)) & 1)) ^ v1))
                            - 4))();
}

uint64_t sub_100030A40()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = v0 != 831158449 && LODWORD(STACK[0x554]) - v2 == -1767924686;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((429 * v5) ^ v1)) - ((v1 + 11655075) & 0xFF4E26FB ^ 0xFCLL)))();
}

uint64_t sub_100030A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  int v15;

  v13 = (_DWORD *)STACK[0x2E8];
  *v13 = v8 - 1;
  v14 = &v13[6 * (v8 - 831158450)];
  v15 = v14[2];
  STACK[0x2E0] = *((_QWORD *)v14 + 2);
  LODWORD(STACK[0x554]) = v14[6];
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * (int)(((*(_DWORD *)(v12 + (v15 + a7) * (uint64_t)v10 + 36) == a8
                                                                                           + ((((v9 + 1805728931) & 0x945EC1FB)
                                                                                             - 908315209) & 0x3623CFF3)
                                                                                           - 1699)
                                     * (((v9 + 1805728931) & 0x945EC1FB) + 815)) ^ (v9 + 1805728931) & 0x945EC1FB)))();
}

uint64_t sub_100030B74()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;

  v3 = LODWORD(STACK[0x554]) + ((v0 - 1305) ^ 0x37C91BE5);
  v4 = (v0 ^ 0x430) + v1 - 831998962;
  v5 = (v4 < 0x451839E9) ^ (v3 < 0x451839E9);
  v6 = v3 < v4;
  if (v5)
    v6 = v4 < 0x451839E9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((108 * !v6) ^ v0)) - 4))();
}

uint64_t sub_100030BEC@<X0>(int a1@<W6>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((7
                                          * (*(_DWORD *)(v6
                                                       + (v3 - 71 + v2 + ((v3 - 278) ^ (a1 - 743))) * (uint64_t)v4
                                                       + 36) == a2)) ^ v3))
                            - 12))();
}

uint64_t sub_100030C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  _BOOL4 v14;

  v14 = v8 == v12 && v10 != (((v9 - 450) | 0x100) ^ (a8 + 394));
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((v14 * ((v9 - 450) ^ 0x789)) ^ v9)) - 8))();
}

uint64_t sub_100030C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((((*(unsigned __int8 *)(v11 + (v8 + a7) * (uint64_t)v9 + 40) >> 3) & 1)
                                          * (2 * (((v7 - 90) | 0x403) ^ 0x701) - 229)) ^ v7))
                            - 8))();
}

uint64_t sub_100030CD4@<X0>(int a1@<W7>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BOOL4 v8;

  v6 = *(_DWORD *)(v5 + v2 * (uint64_t)v3 + 36);
  v8 = v6 + 14827437 > -397405742 && v6 + 14827437 < SLODWORD(STACK[0x2F0]) && v6 != a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((v8 * (a2 - 1207)) ^ a2))
                            - ((a2 + 542085451) & 0xDFB06BCD ^ 0x244)))();
}

uint64_t sub_100030D4C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v5 = v0 ^ 0x331;
  if (v1)
    v6 = v4;
  else
    v6 = v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((247 * (v6 != v4)) ^ v5))
                            - ((v5 - 1785691401) & 0x6A6F7FEF ^ 0x46CLL)))();
}

uint64_t sub_100031630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL4 v13;

  v11 = (v8 + 1718023762) & 0x999909BA;
  v13 = *(_DWORD *)STACK[0x2E8] != 831158449 || v9 != a8 + ((v11 - 298) | 0x82) - 226;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (int)((v13 * ((v11 + 730) ^ 0x62A)) ^ v11)) - 8))();
}

uint64_t sub_1000316AC()
{
  STACK[0x468] = STACK[0x2A0];
  return ((uint64_t (*)(void))STACK[0x2D8])();
}

uint64_t sub_1000316BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((((a5 - 1123) | 0x58) + 372) * (v6 == v7)) ^ (a5 - 54))) - 8))();
}

void sub_1000316EC()
{
  int v0;
  uint64_t v1;
  unint64_t *v2;

  v2 = (unint64_t *)STACK[0x540];
  STACK[0x270] = STACK[0x258];
  STACK[0x2E0] = *v2;
  STACK[0x2D8] = *(_QWORD *)(v1 + 8 * v0);
  JUMPOUT(0x100030888);
}

uint64_t sub_100031794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a67;
  uint64_t a71;
  uint64_t v71;

  *(_QWORD *)(a67 + 1560) = *(_QWORD *)STACK[0x4A8];
  *(_DWORD *)(a67 + 1552) = *(_DWORD *)STACK[0x3A8];
  *(_QWORD *)(*(_QWORD *)(a62 + 96) + 488) = *(_QWORD *)(a62 + 8);
  *(_DWORD *)(*(_QWORD *)(a62 + 96) + 480) = *(_DWORD *)a62;
  *(_BYTE *)(a61 + a71 + a63) = ((a5 + 67) ^ a60 ^ 0x1D) * a58;
  return ((uint64_t (*)(void))(*(_QWORD *)(v71 + 8 * (a5 - 452)) - 4))();
}

uint64_t sub_100031840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  STACK[0x440] = 104 - a9;
  v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))STACK[0x588];
  STACK[0x468] = v65 - 112;
  STACK[0x300] = *(_QWORD *)(v66 + 8 * ((v64 + 957) ^ 0x441)) - 8;
  return v67(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64);
}

uint64_t sub_100031878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58)
{
  uint64_t v58;
  int v59;
  int v60;
  _BOOL4 v61;

  v61 = v59 == (LODWORD(STACK[0x200]) ^ (v60 + 324));
  return ((uint64_t (*)(void))(*(_QWORD *)(v58 + 8 * (((2 * v61) | (4 * v61)) ^ a58)) - 4))();
}

uint64_t sub_1000318AC(int a1)
{
  uint64_t v1;
  int v2;
  int v3;
  char v4;
  unint64_t v5;

  v2 = STACK[0x200];
  v3 = (LODWORD(STACK[0x200]) ^ 0x3C8) * a1;
  v4 = LODWORD(STACK[0x200]) - 108;
  v5 = STACK[0x360];
  STACK[0x458] = STACK[0x360];
  STACK[0x508] = 0;
  LODWORD(STACK[0x31C]) = 1991213896;
  STACK[0x478] = 0;
  LODWORD(STACK[0x334]) = 1991213896;
  STACK[0x568] = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1990 * (((v5 == 0) ^ (v4 + v3 + 1)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_10003191C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((*(_BYTE *)(a1 + 32)
                                                             - **(_BYTE **)(v4 + 8 * ((v1 | 0x404) - 1076))) != 224)
                                          * ((((v1 | 0x404) - 1045541205) & 0x3E51ADF5 ^ 0x10C) * v2 - 27)) ^ ((v1 | 0x404) + 283)))
                            - 12))();
}

uint64_t sub_1000319B0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9 + 8 * ((((((v7 ^ a7) * a1 - 64) | 0x40) - 1099) * (v8 != 82)) ^ v7)))();
}

void sub_1000319DC()
{
  JUMPOUT(0x10003196CLL);
}

uint64_t sub_1000319E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  unint64_t v64;
  uint64_t v65;
  int v66;
  int v67;

  STACK[0x2A0] = v64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65
                                                                                 + 8
                                                                                 * ((a5 - 1061) ^ (1517 * (v66 == v67))))
                                                                     - a64
                                                                     + 600))(a1, 1056930698, 1571, 43);
}

uint64_t sub_100031A3C(char a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a64;
  int v64;
  int v65;
  char v66;
  uint64_t v67;
  int v68;

  v68 = (*(unsigned __int8 *)(STACK[0x568] + 1516) ^ v65) - (*(_BYTE *)STACK[0x3D0] - 45);
  return ((uint64_t (*)(void))(*(_QWORD *)(v67
                                        + 8
                                        * (((((v68 << ((((a64 - 37) ^ v66) * a1) ^ 0x65)) & a2) + (v68 ^ v64) == v64)
                                          * a3) ^ (a64 - 549)))
                            - 12))();
}

uint64_t sub_100031AA8@<X0>(unint64_t a1@<X3>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8 * (((a2 + 1 == (((((v3 ^ 0x600) + 480) | 0x20u) - 1061) ^ a1)) * v2) ^ v3 ^ 0x600)))();
}

uint64_t sub_100031ADC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v6 = v3 + 863;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                                          + 8
                                                                                          * ((60
                                                                                            * ((((v6 + 30) | 0x78) + *(_BYTE *)(a3 + a2) - *(_BYTE *)(*(_QWORD *)(v5 + 8 * (v6 - 943)) - 12)) == 218)) ^ (v6 - 77)))
                                                                              - ((v6 + 1804699538) & 0x946E77FF)
                                                                              + 1006))(1804699538, a1, 2490267647, 376, 524);
}

uint64_t sub_100031BB4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((v6 == (v5 + 106 + ((v5 + 102) | a2) - 118)) * a5) ^ v5))
                            - 12))();
}

void sub_100031BE4()
{
  JUMPOUT(0x100031B68);
}

uint64_t sub_100031BF0@<X0>(int a1@<W1>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v6 = (v3 + 668236423) & 0xD82B85E6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                        + 8
                                                                        * (int)((((*(_BYTE *)(a3 + a2)
                                                                                                  - *(_BYTE *)(*(_QWORD *)(v5 + 8 * (int)(v6 ^ a1)) - 12)
                                                                                                  + 31) == (((4 * v6) ^ 0x84) - 21))
                                                                               * (v6 - 640)) ^ (v6 + 642)))
                                                            - 8))(509303271, 3785664279, 54);
}

uint64_t sub_100031CB8(int a1, int a2, char a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((v4 != ((v3 + 80) ^ a3)) * (((v3 + a1) & a2) + 903)) ^ v3))
                            - 12))();
}

void sub_100031CE8()
{
  JUMPOUT(0x100031C78);
}

uint64_t sub_100031CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t (*a68)(uint64_t, uint64_t);
  int v68;
  char v69;
  char v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v72 = (v68 - 680276137) & 0x288C2F57;
  v73 = (char)(v69 - 82) - (char)(v70 - 114);
  LODWORD(STACK[0x2E8]) = (v73 ^ 0x9FBF7E61) + 1734078464 + ((v73 << ((v68 + 87) & 0x57 ^ 0x12)) & 0x3F7EFCC2);
  v74 = a68(1576, 2940923044);
  STACK[0x568] = v74;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 + 8 * ((95 * (v74 != 0)) ^ v72)) - 11 * (((v72 + 333) | 4) ^ 0x423u) + 777))(v74, v75, v76, v77, v78, v79, v80, v81, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59);
}

uint64_t sub_100031DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t (*a68)(uint64_t, uint64_t);
  unint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;

  STACK[0x2A0] = v68;
  v71 = a68(1576, 3012117910);
  STACK[0x3B0] = v71;
  return (*(uint64_t (**)(void))(v70
                              + 8 * ((((17 * ((v69 - 1077165593) & 0x40343F6F ^ 0x428)) ^ 0x537) * (v71 == 0)) ^ v69)))();
}

uint64_t sub_100031E3C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((v0 == 119238241) ^ ((v1 ^ 0x86) + 85)) & 1)
                                          * ((9 * (v1 ^ 0x586)) ^ 0x4F6)) ^ v1))
                            - 12))();
}

uint64_t sub_100031E98@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((46 * (((a1 + 5) ^ (v2 == v1 + a1 - 763 - 479)) & 1)) ^ a1)))();
}

uint64_t sub_100031ED0()
{
  unint64_t v0;
  int v1;
  int v2;
  uint64_t v3;

  STACK[0x2F0] = v0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v2 ^ 0x64C) * (LODWORD(STACK[0x2E8]) == v1)) ^ v2)) - 12))();
}

uint64_t sub_100031F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  int v62;
  uint64_t v63;

  v61 = ((2 * ((v53 ^ 0xF9551F6D) & 0x10143999) - (v53 ^ 0xF9551F6D) - 269760924) ^ 0x1C4AD726) * v55;
  *(_DWORD *)(v60 - 196) = -1570122577 - v61;
  *(_DWORD *)(v60 - 192) = (v56 - 194) ^ v61;
  v62 = (v56 - 445) | v54;
  *(_QWORD *)(v60 - 176) = a53;
  *(_QWORD *)(v60 - 168) = v59;
  *(_QWORD *)(v60 - 184) = a52;
  v63 = ((uint64_t (*)(uint64_t))STACK[0x228])(v60 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v58
                                                      + 8 * (((*(_DWORD *)(v60 - 200) == v57) * (v62 + 928)) ^ v56))
                                          - 12))(v63);
}

uint64_t sub_100031FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  unint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;

  STACK[0x2F0] = v53;
  *(_QWORD *)(v56 - 168) = 0x5D1402DDCC693777;
  v57 = 535753261 * ((((v56 - 200) | 0xCB336D8B) - ((v56 - 200) & 0xCB336D8B)) ^ 0xC1C763A4);
  *(_DWORD *)(v56 - 196) = -1570122577 - v57;
  *(_DWORD *)(v56 - 192) = (v54 - 194) ^ v57;
  *(_QWORD *)(v56 - 184) = a52;
  *(_QWORD *)(v56 - 176) = a53;
  v58 = ((uint64_t (*)(uint64_t))STACK[0x228])(v56 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55
                                                      + 8
                                                      * ((991
                                                        * (*(_DWORD *)(v56 - 200) == ((v54 - 454) | 0x26)
                                                                                   + ((v54 - 416) ^ 0x783FC108))) ^ v54))
                                          - 12))(v58);
}

uint64_t sub_1000320B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);

  v57 = 535753261 * (((v53 | 0xC8F0DEF3) - v53 + (v53 & 0x370F2108)) ^ 0xC204D0DC);
  *(_QWORD *)(v56 - 176) = a53;
  *(_QWORD *)(v56 - 168) = 0x5D1402DDCC693777;
  *(_QWORD *)(v56 - 184) = a52;
  *(_DWORD *)(v56 - 196) = -1570122579 - v57;
  *(_DWORD *)(v56 - 192) = (v54 - 194) ^ v57;
  v58 = ((uint64_t (*)(uint64_t))STACK[0x228])(v56 - 200);
  v59 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v55 + 8 * ((991 * (*(_DWORD *)(v56 - 200) == 2017444214)) ^ v54))
                                        - ((v54 + 1982246624) & 0x89D94F7F)
                                        + 51);
  STACK[0x2F0] = (unint64_t)*(&off_10005BF50 + (v54 ^ 0x1DB)) - 12;
  return v59(v58);
}

uint64_t sub_1000321AC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  void (*v44)(uint64_t);
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;

  v52 = (((v45 | 0x1EA818B6) - (v45 & 0x1EA818B6)) ^ 0x145C1699) * v46;
  *(_QWORD *)(v51 - 176) = a44;
  *(_QWORD *)(v51 - 168) = v50;
  *(_QWORD *)(v51 - 184) = a43;
  *(_DWORD *)(v51 - 196) = a1 - v52;
  *(_DWORD *)(v51 - 192) = (v47 + 222) ^ v52;
  v44(v51 - 200);
  v53 = *(_DWORD *)(v51 - 200);
  STACK[0x3D0] = STACK[0x2F0];
  return ((uint64_t (*)(uint64_t, __n128))(*(_QWORD *)(v49
                                                              + 8
                                                              * (((v53 == v48 + ((v47 + 1773100093) & 0x9650A7E7) - 1124)
                                                                * ((v47 - 724691403) & 0x2B31EDEF ^ 0x35D)) ^ v47))
                                                  - 12))(281, (__n128)0);
}

void sub_10003229C()
{
  JUMPOUT(0x1000322ACLL);
}

uint64_t sub_1000322E0()
{
  int v0;
  uint64_t v1;

  STACK[0x3D0] = STACK[0x2F0];
  return (*(uint64_t (**)(unint64_t))(v1
                                                     + 8 * ((552 * (STACK[0x478] != 0)) ^ (562 * (v0 ^ 0x3D) + 210))))(STACK[0x478]);
}

uint64_t sub_100032CC8()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x230])();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1970 * (STACK[0x508] != 0)) ^ (v0 - 955))) - 4))();
}

uint64_t sub_100032CF8()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x230])();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (((4 * (STACK[0x568] != 0)) | (16 * (STACK[0x568] != 0))) ^ (v0 - 36)))
                            - 12))();
}

uint64_t sub_100032D30()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x230])();
  return (*(uint64_t (**)(void))(v1 + 8 * ((935 * (STACK[0x3B0] != 0)) ^ (v0 - 907))))();
}

uint64_t sub_100032D60()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v3 = ((uint64_t (*)(void))STACK[0x230])();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1 + 8 * ((v0 - 152) ^ (1569 * (v2 == 2017444214))))
                                          - (v0 - 337)
                                          + 775))(v3);
}

uint64_t sub_100032D9C()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1970 * (STACK[0x508] != 0)) ^ (v0 - 955))) - 4))();
}

uint64_t sub_100032DC4()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (((4 * (STACK[0x568] != 0)) | (16 * (STACK[0x568] != 0))) ^ (v0 - 36)))
                            - 12))();
}

uint64_t sub_100032DF4()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(v1 + 8 * ((935 * (STACK[0x3B0] != 0)) ^ (v0 - 907))))(STACK[0x3B0]);
}

uint64_t sub_100032E1C()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v0 - 152) ^ (1569 * (v2 == 2017444214))))
                            - (v0 - 337)
                            + 775))();
}

uint64_t sub_100032E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  uint64_t v51;

  LODWORD(STACK[0x4B4]) = 583828888;
  LODWORD(STACK[0x550]) = 128;
  v47 = STACK[0x360] + 0x79262543413A985FLL;
  v48 = STACK[0x340];
  v49 = STACK[0x3C0];
  v50 = 535753261 * ((((2 * (v46 - 200)) | 0x7B43AD7C) - (v46 - 200) + 1113467202) ^ 0xB755D891);
  *(_QWORD *)(v46 - 184) = STACK[0x360] + 0x79262543413A996FLL;
  *(_QWORD *)(v46 - 176) = v47;
  *(_DWORD *)(v46 - 128) = v50 + v44 - 284;
  *(_QWORD *)(v46 - 200) = v49;
  *(_QWORD *)(v46 - 144) = v48;
  *(_QWORD *)(v46 - 136) = a44;
  *(_DWORD *)(v46 - 192) = v50 + 868241049;
  *(_QWORD *)(v46 - 152) = 0;
  *(_QWORD *)(v46 - 168) = 0;
  v51 = ((uint64_t (*)(uint64_t))STACK[0x300])(v46 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v45
                                                      + 8
                                                      * ((1526
                                                        * (*(_DWORD *)(v46 - 160) == ((v44 - 719) | 0x420) + 2017443090)) ^ v44))
                                          - ((v44 - 341681282) & 0x145DA36F)
                                          + 509))(v51);
}

uint64_t sub_100032F78()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((345 * (v0 - STACK[0x420] > 0x1F)) ^ v1))
                            - (((v1 - 513) | 0x240) ^ 0x248)))();
}

uint64_t sub_100032FC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  uint64_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;

  v5 = v3 + 127 - v1;
  v6 = vrev64q_s8(*(int8x16_t *)(v5 - 15));
  v7 = vextq_s8(v6, v6, 8uLL);
  v8 = vrev64q_s8(*(int8x16_t *)(v5 - 31));
  v9 = vextq_s8(v8, v8, 8uLL);
  v10 = a1 + 127 - v1;
  v11.i64[0] = 0xCECECECECECECECELL;
  v11.i64[1] = 0xCECECECECECECECELL;
  v12.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v12.i64[1] = 0xE7E7E7E7E7E7E7E7;
  v13 = vrev64q_s8(vaddq_s8(vsubq_s8(v7, vandq_s8(vaddq_s8(v7, v7), v11)), v12));
  *(int8x16_t *)(v10 - 15) = vextq_s8(v13, v13, 8uLL);
  v14 = vrev64q_s8(vaddq_s8(vsubq_s8(v9, vandq_s8(vaddq_s8(v9, v9), v11)), v12));
  *(int8x16_t *)(v10 - 31) = vextq_s8(v14, v14, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((280 * ((((v2 - 32) ^ (v1 == 96)) & 1) == 0)) | v2)) - 8))();
}

uint64_t sub_100033068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  *(_BYTE *)(a1 + v1 - 1932017505) = *(_BYTE *)(v3 + v1 - 1932017505)
                                   - (((v4 - 95) ^ 0x6C) & (2 * *(_BYTE *)(v3 + v1 - 1932017505)))
                                   - 25;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v1 - 1 == v2) | ((v1 - 1 == v2) << 6)) ^ v4)) - 8))();
}

uint64_t sub_1000330B4()
{
  int v0;
  uint64_t v1;
  int v2;

  LODWORD(STACK[0x42C]) = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1387 * (*(_DWORD *)(STACK[0x238] + 360) - 1115729966 < (v0 ^ 0x7C6u) - 1126)) ^ v0))
                            - 4))();
}

uint64_t sub_1000330FC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unint64_t v38;
  char *v40;
  uint64_t (*v41)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v42;
  int v43;
  int v44;
  uint64_t v45;

  v29 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t))(v27 + 8 * (v24 ^ 0x383)))(LODWORD(STACK[0x418]), (v23 + a1 + 2), STACK[0x570]);
  v37 = (v29 ^ 0xFB57F3DF) + 935284606 + ((v24 - 156244964) & (2 * v29));
  v38 = STACK[0x308];
  if (v37 == 857162589)
  {
    v40 = (char *)&STACK[0x600] + v25 - 0x78011E6450C4E31ELL;
    STACK[0x3F8] = (unint64_t)(v40 - 1824);
    LODWORD(STACK[0x408]) = 2120227613;
    STACK[0x468] = ((v38 + 266) ^ 0xFFFFFFFFFFFFFA2ELL) + v25;
    STACK[0x528] = 0;
    LODWORD(STACK[0x584]) = 1991213896;
    v41 = (uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 + 8 * (int)((((v38 - 161) ^ 0x7C1) * (v40 != (char *)1576)) ^ (v38 - 666))) - 4);
    v42 = STACK[0x348];
    STACK[0x2C8] = STACK[0x398];
    STACK[0x2D8] = (unint64_t)(v40 - 1596);
    STACK[0x2E8] = (unint64_t)(v40 - 1824);
    return v41(v42, v30, v31, v32, v33, v34, v35, v36);
  }
  else if (v37 == 1125598048)
  {
    LODWORD(STACK[0x42C]) = -2017420722;
    return ((uint64_t (*)(void))(*(_QWORD *)(v26 + 8 * ((638 * (STACK[0x378] != 0)) ^ ((int)v38 - 70)))
                              - (((_DWORD)v38 - 580) | 0x91u)
                              + 685))();
  }
  else
  {
    v43 = 3804331 * ((((v28 - 200) | 0x81BE4809) - ((v28 - 200) & 0x81BE4809)) ^ 0xE1B53CF);
    *(_QWORD *)(v28 - 192) = a23;
    *(_DWORD *)(v28 - 200) = (v37 - ((2 * v37 - 1714325178) & 0xF07F82EC) + 1160281625) ^ v43;
    *(_DWORD *)(v28 - 196) = v38 - v43 + 70;
    v44 = v38;
    v45 = sub_1000193D0((_DWORD *)(v28 - 200));
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26 + 8 * ((638 * (STACK[0x378] != 0)) ^ (v44 - 70)))
                                            - ((v44 - 580) | 0x91u)
                                            + 685))(v45);
  }
}

uint64_t sub_1000337E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a67;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;

  v70 = ((uint64_t (*)(uint64_t))STACK[0x230])(a67);
  STACK[0x468] = STACK[0x2A0] - 1824;
  LODWORD(STACK[0x42C]) = v68;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v69 + 8 * ((638 * (STACK[0x378] != 0)) ^ (v67 - 70)))
                                          - ((v67 - 580) | 0x91u)
                                          + 685))(v70);
}

uint64_t sub_100033850()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8 * ((110 * (LODWORD(STACK[0x42C]) == v2 + ((v0 - 97) | 0x422) - 1251 - 399)) ^ v0)))();
}

uint64_t sub_1000338C0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  STACK[0x468] = a1 - 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v1 == v4) * ((v2 - 266) ^ 0x7EE)) ^ v2)) - 12))();
}

uint64_t sub_1000338F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  STACK[0x468] = STACK[0x2A0] - 176;
  v9 = *(_QWORD *)(v7 + 8 * ((1627 * (((v8 > a1) ^ (v6 + 10)) & 1)) ^ v6));
  STACK[0x3F0] = a1;
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v9 - 4))(1497258799, a1, a3, a4, a5, a6, a1);
}

uint64_t sub_1000339CC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = (a1 - 1497258464);
  *(_BYTE *)(a7 + v14) = (v10 - 114) ^ *(_BYTE *)(v13 + v14) ^ *(_BYTE *)(v8 + (v14 & 0xF)) ^ *(_BYTE *)(v7 + (v14 & 0xF)) ^ *(_BYTE *)((v14 & 0xF) + v11 + 2) ^ (-73 * (v14 & 0xF)) ^ 0xA9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((1624 * (a1 - 1 != v9)) ^ v10)) - 4))();
}

uint64_t sub_100033A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v15 = v11 + 398;
  *(_BYTE *)(a7 + v9 + v12 + v15) = *(_BYTE *)(v14 + v9 + v12 + v15) ^ *(_BYTE *)(v8 + ((v9 + v12 + v15) & 0xFLL)) ^ *(_BYTE *)(v7 + (((_BYTE)v9 + (_BYTE)v12 + (_BYTE)v11 - 114) & 0xF)) ^ *(_BYTE *)((((_BYTE)v9 + (_BYTE)v12 + (_BYTE)v11 - 114) & 0xF) + v10 + 2) ^ (-73 * ((v9 + v12 + v15) & 0xF)) ^ 0xE7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13
                                        + 8
                                        * ((((v9 + v12 + 1103) < 0x150) | (2
                                                                                       * ((v9 + v12 + 1103) < 0x150))) ^ v11))
                            - 4))();
}

uint64_t sub_100033AA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X6>, int8x16_t *a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int8x16_t *a13)
{
  int v13;
  uint64_t v14;

  *a7 = veorq_s8(*a13, (int8x16_t)xmmword_100047760);
  STACK[0x5A0] += 32;
  STACK[0x5A8] = a6;
  STACK[0x5B0] = a6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14
                                                                                          + 8
                                                                                          * (v13 ^ (316
                                                                                                  * (a7 == (int8x16_t *)a6))))
                                                                              - (((v13 - 971) | 0x220u) ^ 0x2ABLL)))(a1, a2, a3, a4, a5);
}

uint64_t sub_100033B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  char *v66;
  char v67;
  uint64_t v68;
  unsigned __int8 *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  int v80;
  char v81;
  unsigned int v82;
  int v83;
  int v84;
  int v85;
  unsigned __int8 v86;
  unsigned int v87;
  int v88;
  unint64_t v89;
  uint64_t v90;
  int v91;
  unsigned __int8 v92;
  int v93;
  uint64_t v94;
  int v95;
  int v96;
  int v97;
  unint64_t v98;
  unint64_t v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  char v104;
  int v105;
  unsigned __int8 v106;
  int v107;
  int v108;
  unsigned int v109;
  int v110;
  BOOL v111;
  char v112;
  char v113;
  int v114;
  unsigned __int8 v115;
  int v116;
  int v117;
  int v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  int v122;
  unint64_t v123;
  char *v124;
  int v125;
  int v126;
  uint64_t v127;
  int v128;
  unsigned int v129;
  unsigned int v130;
  int v131;
  unsigned int v132;
  int v133;
  unsigned int v134;
  int v135;
  int v136;
  unsigned int v137;
  int v138;
  int v139;
  int v140;
  unsigned int v141;
  int v142;
  unsigned int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  int v149;
  unsigned int v150;
  int v151;
  unsigned int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  int v165;
  int v166;
  int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  int v171;
  unsigned int v172;
  int v173;
  int v174;
  int v175;
  unsigned int v176;
  int v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  int v181;
  int v182;
  int v183;
  unsigned int v184;
  unsigned int v185;
  int v186;
  int v187;
  unsigned int v188;
  int v189;
  int v190;
  int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  int v197;
  int v198;
  unint64_t v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  unsigned int v205;
  unsigned int v206;
  int v207;
  int v208;
  unsigned int v209;
  int v210;
  int v211;
  int v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  int v216;
  unsigned __int8 v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  int v226;
  int v227;
  int v228;
  unsigned int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  __int16 v235;
  int v236;
  unsigned int v237;
  int v238;
  unsigned int v239;
  int v240;
  unsigned int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  int v248;
  unsigned int v249;
  int v250;
  int v251;
  unsigned int v252;
  unsigned int v253;
  int v254;
  unsigned int v255;
  int v256;
  unsigned int v257;
  int v258;
  int v259;
  unsigned int v260;
  int v261;
  int v262;
  unsigned int v263;
  int v264;
  int v265;
  int v266;
  int v267;
  unsigned int v268;
  int v269;
  unsigned int v270;
  int v271;
  int v272;
  int v273;
  unsigned int v274;
  int v275;
  unsigned int v276;
  int v277;
  unint64_t v278;
  unsigned int v279;
  int v280;
  int v281;
  int v282;
  unsigned int v283;
  int v284;
  char *v285;
  unsigned int v286;
  int v287;
  int v288;
  unsigned int v289;
  int v290;
  char *v291;
  unsigned int v292;
  unsigned int v293;
  char *v294;
  int v295;
  unsigned int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  unsigned int v301;
  int v302;
  char *v303;
  int v304;
  int v305;
  int v306;
  unsigned int v307;
  uint64_t v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  uint64_t v312;
  uint64_t v313;
  char *v314;
  int v315;
  unsigned int v316;
  unsigned int v317;
  int v318;
  int v319;
  int v320;
  unsigned int v321;
  uint64_t v322;
  uint64_t v323;
  int v324;
  unint64_t v325;
  unint64_t v326;
  int v327;
  int v328;
  unsigned int v329;
  unsigned int v330;
  unsigned int v331;
  int v332;
  int v333;
  unsigned int v334;
  int v335;
  unint64_t v336;
  unsigned int v337;
  int v338;
  _BYTE *v340;
  unsigned __int8 *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  int v353;
  uint64_t v354;
  int v355;
  int v356;

  v65 = v62 ^ 0x6ED;
  v66 = (char *)&STACK[0x1940] + v63;
  v67 = *(_BYTE *)a7;
  *(_QWORD *)(v66 + 17) = *(_QWORD *)(a7 + 1);
  *(_DWORD *)(v66 + 25) = *(_DWORD *)(a7 + 9);
  *(_WORD *)(v66 + 29) = *(_WORD *)(a7 + 13);
  v66[31] = *(_BYTE *)(a7 + 15);
  v68 = *(_QWORD *)(a7 + 8);
  *(_QWORD *)v66 = *(_QWORD *)a7;
  *((_QWORD *)v66 + 1) = v68;
  v66[16] = v67;
  v69 = (unsigned __int8 *)&STACK[0x1940] + v63 + 16;
  v70 = *(_QWORD *)(v64 + 8 * (v65 - 498)) - 4;
  v71 = *(_QWORD *)(v64 + 8 * (v65 - 483)) - 12;
  v72 = *(_QWORD *)(v64 + 8 * (v65 ^ 0x2F3)) - 4;
  LOBYTE(v68) = *(_BYTE *)(v72 + (*((_BYTE *)&STACK[0x1940] + v63 + 30) ^ (v65 - 29)));
  v73 = *((unsigned __int8 *)&STACK[0x1940] + v63 + 24);
  v74 = v73 ^ 0x34;
  v75 = *(unsigned __int8 *)(v71 + (v73 ^ 0x65));
  LOBYTE(v73) = v68 ^ (16 * v68) ^ 0x1D;
  LOBYTE(v68) = *(_BYTE *)(v72 + (v69[10] ^ 0xCBLL));
  v76 = (((v75 + v74 - 45) ^ 0xF5) << 24) | (((v68 ^ (16 * v68)) ^ 0xD1) << 8);
  v77 = *(_QWORD *)(v64 + 8 * (v65 ^ 0x2C2)) - 8;
  v78 = *(unsigned __int8 *)(v77 + (v69[1] ^ 0x1ALL));
  v79 = (v78 >> 1) ^ (((((v78 ^ 0xC) + (v78 & 0xD5 ^ 0xFB) + 1) ^ v78 & 0xDF) & 0xF0) >> 4) ^ 0x61;
  v80 = ((v69[3] ^ 0xB8) + *(_BYTE *)(v70 + (v69[3] ^ 0x54)) - 15) | ((v78 ^ 0xA5 ^ (v79 + (~(2 * v79) | 0x2B) + 107)) << 16);
  v81 = *(_BYTE *)(v72 + (v69[6] ^ 0x2ELL));
  v82 = *(unsigned __int8 *)(v77 + (v69[13] ^ 0x5BLL));
  LODWORD(v68) = ((v69[7] ^ 0x90) + *(_BYTE *)(v70 + (v69[7] ^ 0x7CLL)) - 15) | ((((v69[4] ^ 0x13)
                                                                                                  + *(unsigned __int8 *)(v71 + (v69[4] ^ 0x42))
                                                                                                  - 45) ^ 0xE6) << 24) | (((v81 ^ (16 * v81)) ^ 0xCD) << 8);
  v83 = v82 ^ 0x39 ^ (((v82 >> 4) ^ (v82 >> 1) ^ 0x61)
                    + ~(2 * (((v82 >> 4) ^ (v82 >> 1) ^ 0x61) & 0x64 ^ ((v82 >> 4) ^ (v82 >> 1)) & 4))
                    - 31);
  v84 = (unsigned __int16)(v73 << 8) | ((v83 - ((2 * v83) & 0x2E) + 23) << 16);
  LODWORD(v73) = v80 | (((*(unsigned __int8 *)(v71 + (*v69 ^ 0x81)) + (*v69 ^ 0xD0) - 45) ^ 0x3C) << 24);
  LOBYTE(v80) = *(_BYTE *)(v77 + (v69[5] ^ 0xEDLL));
  v85 = ((v80 ^ 0xD9) >> 4) ^ ((v80 ^ 0xD9) >> 1);
  v86 = v80 ^ 0x6C ^ (v85 - ((2 * v85) & 0x34) - 102);
  v342 = v77;
  v87 = *(unsigned __int8 *)(v77 + (v69[9] ^ 0x38));
  v343 = v71;
  v344 = v70;
  HIDWORD(v351) = (v73 & 0xFFFF00FF | (((*(_BYTE *)(v72 + (v69[2] ^ 0x22)) ^ (16
                                                                                               * *(_BYTE *)(v72 + (v69[2] ^ 0x22)))) ^ 0xE3) << 8)) ^ 0xD57A2805;
  v353 = (v68 & 0xFF00FFFF | (v86 << 16)) ^ 0x4FA72B1A;
  LODWORD(v352) = (v76 & 0xFF00FF00 | ((v69[11] ^ 0x3E) + *(_BYTE *)(v70 + (v69[11] ^ 0xD2)) - 15) | (((v87 ^ (((v87 >> 4) ^ (v87 >> 1) ^ 0x61) - 2 * (((v87 >> 4) ^ (v87 >> 1) ^ 0x61) & 3) - 125)) ^ 0xF1) << 16)) ^ 0xDA7CEE59;
  v88 = v65 - 53;
  HIDWORD(v352) = (v84 & 0xFFFFFF00 | ((((v69[12] ^ 0x13) + *(unsigned __int8 *)(v71 + (v69[12] ^ 0x42)) - 45) ^ 0xE6) << 24) | (*(_BYTE *)(v70 + (v69[15] ^ 0x38)) + (v69[15] ^ 0xD4) - 15)) ^ 0xD9528CD1;
  v340 = (_BYTE *)STACK[0x5B0];
  v341 = (unsigned __int8 *)STACK[0x5A8];
  STACK[0x2D0] = 14;
  LODWORD(v69) = *(unsigned __int8 *)(v72 + (v341[14] ^ 0xD9));
  LODWORD(v351) = (v65 - 53) ^ 0xCD;
  v89 = ((_DWORD)v351 - 680) & 0x65B64E09 ^ 0x65B64E0Du;
  STACK[0x260] = v89;
  HIDWORD(a17) = v65 - 256;
  v90 = v341[v89];
  LODWORD(STACK[0x2F0]) = (((v65 - 256) ^ (16 * (_DWORD)v69) ^ 0x43) - 114) ^ v69;
  LOBYTE(v69) = v90 ^ 0xB7;
  LOBYTE(v65) = *(_BYTE *)(v71 + (v90 ^ 0xE6));
  STACK[0x2E0] = 15;
  v91 = v341[15];
  v92 = (v65 + (_BYTE)v69 - 45) ^ 0xE5;
  if ((v91 & 0x20) != 0)
    v93 = -32;
  else
    v93 = 32;
  v94 = (v93 + v91);
  v95 = v88;
  v96 = *(unsigned __int8 *)(v70 + (v94 ^ 0xDD));
  STACK[0x2C0] = 6;
  v97 = *(unsigned __int8 *)(v72 + (v341[6] ^ 0x51));
  LODWORD(STACK[0x300]) = v96 + (v94 ^ 0x31);
  STACK[0x270] = 12;
  HIDWORD(v98) = v97 ^ (((16 * v97) ^ 0xFFFFFFE0) - 114) ^ 0x3F;
  LODWORD(v98) = BYTE4(v98) & 0xF8;
  STACK[0x258] = 0;
  v99 = ((v98 >> 3) | ((unint64_t)v92 << 13)) ^ 0x58F620A6;
  v100 = (v99 >> 21) | ((_DWORD)v99 << 11);
  v356 = *(unsigned __int8 *)(v71 + (v341[12] ^ 0xF7) - 2 * ((v341[12] ^ 0xFFFFFFE7) & 0xAE) + 174) + (v341[12] ^ 8);
  v101 = *v341;
  STACK[0x2A0] = 3;
  v102 = v341[3];
  v103 = *(unsigned __int8 *)(v71 + (v101 ^ 0xD8)) + (v101 ^ 0x76) - 2 * (v101 ^ 0x76);
  STACK[0x2B8] = 8;
  v355 = (v102 ^ 0xFFFFFFBB) + *(unsigned __int8 *)(v70 + (v102 ^ 0x57));
  v104 = (v341[8] ^ 0xA7) + *(_BYTE *)(v71 + (v341[8] ^ 0xF6));
  STACK[0x268] = 7;
  LOBYTE(v96) = (v341[7] ^ 0xE9) + *(_BYTE *)(v70 + (v341[7] ^ 5));
  STACK[0x240] = 13;
  LODWORD(v102) = *(unsigned __int8 *)(v342 + (v341[13] ^ 0x12));
  v105 = (unint64_t)((v102 >> 3) & 0xFFFFFFFB ^ v102 & 0x5A | (v102 >> 3) & 4 ^ v102 & 0xA4) >> 1;
  v106 = v102 ^ 0xD4 ^ ((v105 ^ 0x61) - 2 * ((v105 ^ 0x61) & 0x57 ^ v105 & 4) - 45);
  LOBYTE(v102) = *(_BYTE *)(v342 + (v341[5] ^ 0x9CLL));
  v107 = ((v102 ^ 0xD9) >> 4) ^ ((v102 ^ 0xD9) >> 1);
  v108 = (v96 - 15) | ((v102 ^ 0xE6 ^ (v107
                                                                                        + (~(2 * v107) | 0xCB)
                                                                                        - 101)) << 16);
  STACK[0x210] = 9;
  v109 = *(unsigned __int8 *)(v342 + (v341[9] ^ 0x76));
  LODWORD(v102) = (2 * (v109 & 8)) ^ 0x10 | v109 & 8;
  v110 = (v109 >> 3) ^ 0x1B;
  v111 = (((_DWORD)v102 - 40) & v110) == 0;
  v112 = v102 + 84;
  v113 = 100 - v102;
  if (v111)
    v113 = v112;
  STACK[0x200] = 10;
  v114 = ((((v110 + v113 - 92) ^ v109 & 0xF7) & 0xFE) >> 1) ^ 0x68;
  v115 = v109 ^ (v114 - ((2 * v114) & 0x87) + 67);
  v116 = *(unsigned __int8 *)(v342 + (v341[1] ^ 0xCFLL)) ^ 0x43;
  v117 = (v116 >> 4) ^ ((*(_BYTE *)(v342 + (v341[1] ^ 0xCFLL)) ^ 0x43) >> 1) ^ 0x44;
  v118 = (v117 + (~(2 * v117) | 0x41) + 96) ^ v116;
  v119 = *(_QWORD *)(v64 + 8 * (v88 ^ 0x2DA)) - 12;
  HIDWORD(v350) = v106;
  v120 = *(_DWORD *)(v119 + 4 * (v106 ^ 0xABu));
  v121 = (uint64_t)*(&off_10005BF50 + (v88 ^ 0x216));
  HIDWORD(v349) = (*(_BYTE *)(v72 + (v341[10] ^ 0xFBLL)) ^ (16 * *(_BYTE *)(v72 + (v341[10] ^ 0xFBLL)))) ^ 0xD7;
  v122 = *(_DWORD *)(v121
                   + 4
                   * ((*(_BYTE *)(v72 + (v341[10] ^ 0xFBLL)) ^ (16
                                                                               * *(_BYTE *)(v72 + (v341[10] ^ 0xFBLL)))) ^ 0x58u));
  HIDWORD(v123) = v122 ^ 0xFB2F;
  LODWORD(v123) = v122 ^ 0x56690000;
  LODWORD(v349) = v103 - 46;
  LODWORD(a62) = v88;
  v124 = (char *)*(&off_10005BF50 + v88 - 419) - 12;
  v125 = (v123 >> 16) ^ *(_DWORD *)&v124[4 * ((v103 - 46) ^ 0xF9)] ^ (16 * (v120 ^ 0xD43EDC0C)
                                                                                     + 1338723912
                                                                                     - ((32 * (v120 ^ 0xD43EDC0C)) & 0x9F969C80));
  v126 = v108 ^ v100;
  v127 = (uint64_t)*(&off_10005BF50 + (v88 ^ 0x233));
  v128 = *(_DWORD *)(v121 + 4 * (LODWORD(STACK[0x2F0]) ^ 0x71u));
  HIDWORD(v123) = v128 ^ 0xFB2F;
  LODWORD(v123) = v128 ^ 0x56690000;
  v129 = *(_DWORD *)(v127 + 4 * (v126 ^ 0x78u)) ^ v120 ^ (v125 + 712344059 - ((2 * v125) & 0x54EB03F6));
  LODWORD(v350) = v118;
  v130 = *(_DWORD *)(v119 + 4 * (v118 ^ 0x7Au)) ^ 0xD43EDC0C;
  v131 = (v123 >> 16) ^ (16 * v130 + 1338723912 - ((32 * v130) & 0x9F969C80)) ^ *(_DWORD *)&v124[4
                                                                                               * (HIBYTE(v100) ^ 0xDD)];
  HIDWORD(v347) = (*(_BYTE *)(v70 + (v341[11] ^ 0x12)) + (v341[11] ^ 0xFE) - 15);
  v132 = *(_DWORD *)(v127 + 4 * (HIDWORD(v347) ^ 0xB9u)) ^ v130 ^ (v131 + 712344059 - ((2 * v131) & 0x54EB03F6));
  v133 = *(unsigned __int8 *)(v72 + (v341[2] ^ 0x26)) ^ 0x36;
  LODWORD(v348) = v133 ^ (16 * v133);
  HIDWORD(v348) = v126;
  v134 = *(_DWORD *)(v119 + 4 * (BYTE2(v126) ^ 3u)) ^ 0xD43EDC0C;
  v135 = *(_DWORD *)(v121 + 4 * (v348 ^ 0xFBu));
  HIDWORD(v123) = v135 ^ 0xFB2F;
  LODWORD(v123) = v135 ^ 0x56690000;
  HIDWORD(v346) = (v104 - ((2 * v104 + 38) & 0x4E) - 6);
  v136 = (v123 >> 16) ^ *(_DWORD *)&v124[4 * (HIDWORD(v346) ^ 0x40)] ^ (16 * v134
                                                                      + 1338723912
                                                                      - ((32 * v134) & 0x9F969C80));
  LODWORD(v347) = LODWORD(STACK[0x300]) - 15;
  v137 = *(_DWORD *)(v127 + 4 * (v347 ^ 0xEBu)) ^ v134 ^ (v136 + 712344059 - ((2 * v136) & 0x54EB03F6));
  HIDWORD(v345) = v115 ^ 0x9F;
  v138 = *(_DWORD *)(v119 + 4 * (v115 ^ 0xE6u));
  v139 = *(_DWORD *)(v121 + 4 * (BYTE1(v100) ^ 0x31u));
  HIDWORD(v123) = v139 ^ 0xFB2F;
  LODWORD(v123) = v139 ^ 0x56690000;
  LODWORD(v346) = v356 - 45;
  v140 = (v123 >> 16) ^ *(_DWORD *)&v124[4 * ((v356 - 45) ^ 0xF7)] ^ (16 * (v138 ^ 0xD43EDC0C)
                                                                                     + 1338723912
                                                                                     - ((32 * (v138 ^ 0xD43EDC0C)) & 0x9F969C80));
  LODWORD(v345) = v355 - 15;
  v141 = *(_DWORD *)(v127 + 4 * ((v355 - 15) ^ 0x33u)) ^ v138 ^ (v140
                                                                                  + 712344059
                                                                                  - ((2 * v140) & 0x54EB03F6));
  v142 = *(_DWORD *)(v121 + 4 * (BYTE1(v137) ^ 0xF4u));
  HIDWORD(v123) = v142 ^ 0xFB2F;
  LODWORD(v123) = v142 ^ 0x56690000;
  v143 = *(_DWORD *)(v119 + 4 * (BYTE2(v141) ^ 0x85u)) ^ 0xD43EDC0C;
  v144 = v143 ^ *(_DWORD *)&v124[4 * (HIBYTE(v129) ^ 0x83)] ^ *(_DWORD *)(v127 + 4 * (v132 ^ 0xDBu)) ^ (v123 >> 16) ^ (16 * v143 + 1338723912 - ((32 * v143) & 0x9F969C80));
  v145 = *(_DWORD *)(v119 + 4 * (BYTE2(v129) ^ 0xD2u));
  v146 = *(_DWORD *)(v121 + 4 * ((unsigned __int16)(v141 ^ 0xDE22) >> 8));
  HIDWORD(v123) = v146 ^ 0xFB2F;
  LODWORD(v123) = v146 ^ 0x56690000;
  v147 = (16 * (v145 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v145 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v132) ^ 0xF)] ^ (v123 >> 16);
  v148 = *(_DWORD *)(v127 + 4 * (v137 ^ 0x80u)) ^ v145 ^ (v147 + 712344059 - ((2 * v147) & 0x54EB03F6));
  v149 = *(_DWORD *)(v121 + 4 * (BYTE1(v129) ^ 0x3Au));
  HIDWORD(v123) = v149 ^ 0xFB2F;
  LODWORD(v123) = v149 ^ 0x56690000;
  v150 = *(_DWORD *)(v119 + 4 * (BYTE2(v132) ^ 0xD6u)) ^ 0xD43EDC0C;
  v151 = *(_DWORD *)&v124[4 * (HIBYTE(v137) ^ 0x19)];
  v152 = (16 * v150 + 1338723912 - ((32 * v150) & 0x9F969C80)) ^ v151;
  LODWORD(STACK[0x300]) = 712344063;
  v153 = *(_DWORD *)(v127 + 4 * (v141 ^ 0x22u)) ^ v150 ^ (v123 >> 16);
  v154 = *(_DWORD *)(v119 + 4 * (BYTE2(v137) ^ 0x32u));
  v155 = *(_DWORD *)(v121 + 4 * (BYTE1(v132) ^ 0xADu));
  HIDWORD(v123) = v155 ^ 0xFB2F;
  LODWORD(v123) = v155 ^ 0x56690000;
  v156 = (v123 >> 16) ^ *(_DWORD *)&v124[4 * (HIBYTE(v141) ^ 0x69)] ^ (16 * (v154 ^ 0xD43EDC0C)
                                                                     + 1338723912
                                                                     - ((32 * (v154 ^ 0xD43EDC0C)) & 0x9F969C80));
  v157 = v154 ^ *(_DWORD *)(v127 + 4 * (v129 ^ 0xACu)) ^ 0xA5F70AC8 ^ (v156
                                                                                        + 712344059
                                                                                        - ((2 * v156) & 0x54EB03F6));
  v158 = v157
       - ((2 * v157) & 0x5F186BF6)
       + 797718011
       - ((2 * (v157 - ((2 * v157) & 0x5F186BF6) + 797718011)) & 0xC34B6836)
       + 1638249499;
  v159 = *(_DWORD *)(v119 + 4 * (BYTE2(v158) ^ 0x66u));
  v160 = v153 ^ (v152 + 712344059 - 2 * (v152 & 0x2A7581FF ^ v151 & 4));
  v161 = *(_DWORD *)(v121
                   + 4
                   * (((unsigned __int16)(v153 ^ (v152 - 32261 - 2 * (v152 & 0x81FF ^ v151 & 4))) >> 8) ^ 0xDFu));
  LOWORD(v151) = v144 ^ 0x573F;
  v162 = (16 * (v159 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v159 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v144) ^ 0xBC)] ^ (((v161 ^ 0x5669FB2Fu) >> ((v144 ^ 0x3F) & 0x10) >> ((v144 ^ 0x3F) & 0x10 ^ 0x10)) + ((v161 << 16) ^ 0xFB2F0000));
  v163 = *(_DWORD *)(v127 + 4 * (v148 ^ 0xD5u)) ^ v159 ^ (v162 + 712344059 - ((2 * v162) & 0x54EB03F6));
  v164 = *(_DWORD *)(v119 + 4 * (((v144 ^ 0x5BBC573F) >> 16) ^ 0x93u)) ^ 0xD43EDC0C;
  v165 = *(_DWORD *)(v121 + 4 * (BYTE1(v158) ^ 0x27u));
  HIDWORD(v123) = v165 ^ 0xFB2F;
  LODWORD(v123) = v165 ^ 0x56690000;
  v166 = (16 * v164 + 1338723912 - ((32 * v164) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v148) ^ 0x9F)] ^ (v123 >> 16);
  v167 = *(_DWORD *)&v124[4 * (HIBYTE(v160) ^ 5)];
  HIDWORD(v123) = v167 ^ 0x248;
  LODWORD(v123) = v167 ^ 0x4FCB4C00;
  v168 = *(_DWORD *)(v127 + 4 * (v160 ^ 0xF9u)) ^ v164 ^ (v166 + 712344059 - ((2 * v166) & 0x54EB03F6));
  v169 = *(_DWORD *)(v119 + 4 * (BYTE2(v148) ^ 0xBu)) ^ 0xD43EDC0C;
  v170 = (((v123 >> 10) ^ 0x25EB099C) << 10) ^ (16 * v169) ^ (((v123 >> 10) ^ 0x25EB099C) >> 22);
  v171 = *(_DWORD *)(v121 + 4 * (BYTE1(v151) ^ 2u));
  HIDWORD(v123) = v171 ^ 0xFB2F;
  LODWORD(v123) = v171 ^ 0x56690000;
  v172 = *(_DWORD *)(v127 + 4 * (v158 ^ 0x28u)) ^ v169 ^ (v123 >> 16) ^ (v170
                                                                                          + 712344059
                                                                                          - ((2 * v170) & 0x54EB03F6));
  v173 = *(_DWORD *)(v121 + 4 * (BYTE1(v148) ^ 0x11u));
  HIDWORD(v123) = v173 ^ 0xFB2F;
  LODWORD(v123) = v173 ^ 0x56690000;
  v174 = *(_DWORD *)(v119 + 4 * (BYTE2(v160) ^ 0xEBu));
  v175 = (v123 >> 16) ^ (16 * (v174 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v174 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v158) ^ 0x88)];
  v176 = *(_DWORD *)(v127 + 4 * (v151 ^ 0xD7u)) ^ v174 ^ (v175 + 712344059 - ((2 * v175) & 0x54EB03F6));
  v177 = *(_DWORD *)(v121 + 4 * (BYTE1(v172) ^ 0xE4u));
  HIDWORD(v123) = v177 ^ 0xFB2F;
  LODWORD(v123) = v177 ^ 0x56690000;
  v178 = *(_DWORD *)(v119 + 4 * (BYTE2(v176) ^ 0x5Cu)) ^ 0xD43EDC0C;
  v179 = (16 * v178 + 1338723912 - ((32 * v178) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v163) ^ 9)];
  v180 = *(_DWORD *)(v127 + 4 * (v168 ^ 0x68u)) ^ v178 ^ (v123 >> 16) ^ (v179
                                                                                          + 712344059
                                                                                          - 2
                                                                                          * (v179 & STACK[0x300] ^ *(_DWORD *)&v124[4 * (HIBYTE(v163) ^ 9)] & 4));
  v181 = *(_DWORD *)(v119 + 4 * (BYTE2(v163) ^ 0x65u));
  v182 = *(_DWORD *)(v121 + 4 * ((unsigned __int16)(v176 ^ 0xF55B) >> 8));
  HIDWORD(v123) = v182 ^ 0xFB2F;
  LODWORD(v123) = v182 ^ 0x56690000;
  v183 = (16 * (v181 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v181 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v168) ^ 0xCE)] ^ (v123 >> 16);
  v184 = *(_DWORD *)(v127 + 4 * (v172 ^ 0x15u)) ^ v181 ^ (v183 + 712344059 - ((2 * v183) & 0x54EB03F6));
  v185 = *(_DWORD *)(v119 + 4 * (BYTE2(v168) ^ 0x60u)) ^ 0xD43EDC0C;
  v186 = *(_DWORD *)(v121 + 4 * (BYTE1(v163) ^ 0x47u));
  HIDWORD(v123) = v186 ^ 0xFB2F;
  LODWORD(v123) = v186 ^ 0x56690000;
  v187 = (16 * v185 + 1338723912 - ((32 * v185) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v172) ^ 0xF1)] ^ (v123 >> 16);
  v188 = *(_DWORD *)(v127 + 4 * (v176 ^ 0x5Bu)) ^ v185 ^ (v187 + 712344059 - ((2 * v187) & 0x54EB03F6));
  v111 = (v168 & 0x1000) == 0;
  v189 = BYTE1(v168) ^ 0xC;
  if (v111)
    v190 = 16;
  else
    v190 = -16;
  v191 = v189 + v190;
  v192 = *(_DWORD *)(v119 + 4 * (BYTE2(v172) ^ 0xF7u)) ^ 0xD43EDC0C;
  v193 = *(_DWORD *)(v121 + 4 * (v191 ^ 0x83u));
  v194 = *(_DWORD *)&v124[4 * (HIBYTE(v176) ^ 0x75)] ^ HIWORD(v193);
  v195 = v194 ^ (v193 << 16) ^ (16 * v192 + 1338723912 - ((32 * v192) & 0x9F969C80)) ^ 0xFB2F5669;
  v196 = *(_DWORD *)(v127 + 4 * (v163 ^ 0x6Fu)) ^ v192 ^ (v195
                                                                           + 712344059
                                                                           - 2 * (v195 & STACK[0x300] ^ v194 & 4));
  v197 = *(_DWORD *)(v119 + 4 * (BYTE2(v196) ^ 0xBCu));
  v198 = *(_DWORD *)(v121 + 4 * (BYTE1(v188) ^ 0x8Du));
  HIDWORD(v199) = v198 ^ 0xFB2F;
  LODWORD(v199) = v198 ^ 0x56690000;
  v200 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * (HIBYTE(v180) ^ 0xCC)] ^ (16 * (v197 ^ 0xD43EDC0C)
                                                                     + 1338723912
                                                                     - ((32 * (v197 ^ 0xD43EDC0C)) & 0x9F969C80));
  v201 = *(_DWORD *)(v127 + 4 * (v184 ^ 0xA5u)) ^ v197 ^ (v200 + 712344059 - ((2 * v200) & 0x54EB03F6));
  v202 = *(_DWORD *)(v119 + 4 * (BYTE2(v180) ^ 0x9Cu));
  v203 = *(_DWORD *)(v121 + 4 * (BYTE1(v196) ^ 0x3Bu));
  HIDWORD(v199) = v203 ^ 0xFB2F;
  LODWORD(v199) = v203 ^ 0x56690000;
  v204 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * (HIBYTE(v184) ^ 0xD4)] ^ (16 * (v202 ^ 0xD43EDC0C)
                                                                     + 1338723912
                                                                     - ((32 * (v202 ^ 0xD43EDC0C)) & 0x9F969C80));
  v205 = *(_DWORD *)(v127 + 4 * (v188 ^ 0x48u)) ^ v202 ^ (v204 + 712344059 - ((2 * v204) & 0x54EB03F6));
  v206 = *(_DWORD *)(v119 + 4 * ((v184 ^ 0x3D0ACDA5) >> 16)) ^ 0xD43EDC0C;
  LODWORD(STACK[0x300]) = 1338723913;
  v207 = *(_DWORD *)(v121 + 4 * (BYTE1(v180) ^ 0xD5u));
  HIDWORD(v199) = v207 ^ 0xFB2F;
  LODWORD(v199) = v207 ^ 0x56690000;
  v208 = (16 * v206 + 1338723913 + ~((32 * v206) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v188) ^ 0x80)] ^ (v199 >> 16);
  v209 = *(_DWORD *)(v127 + 4 * (v196 ^ 0x77u)) ^ v206 ^ (v208 + 712344059 - ((2 * v208) & 0x54EB03F6));
  v210 = *(_DWORD *)(v119 + 4 * (BYTE2(v188) ^ 0xBEu));
  v211 = *(_DWORD *)(v121 + 4 * (BYTE1(v184) ^ 0x5Eu));
  HIDWORD(v199) = v211 ^ 0xFB2F;
  LODWORD(v199) = v211 ^ 0x56690000;
  v212 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * (HIBYTE(v196) ^ 0xEF)] ^ (16 * (v210 ^ 0xD43EDC0C)
                                                                     + 1338723912
                                                                     - ((32 * (v210 ^ 0xD43EDC0C)) & 0x9F969C80));
  v213 = *(_DWORD *)(v127 + 4 * (v180 ^ 0x83u)) ^ v210 ^ (v212 + 712344059 - ((2 * v212) & 0x54EB03F6));
  v214 = *(_DWORD *)(v119 + 4 * ((v213 ^ 0x41337F91) >> 16)) ^ 0xD43EDC0C;
  v215 = (16 * v214 + 1338723912 - ((32 * v214) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * ((v201 ^ 0xC56CC7C6) >> 24)];
  v216 = *(_DWORD *)(v121 + 4 * (BYTE1(v209) ^ 0x89u));
  HIDWORD(v199) = v216 ^ 0xFB2F;
  LODWORD(v199) = v216 ^ 0x56690000;
  v217 = BYTE1(v205) ^ 0xD;
  v218 = *(_DWORD *)(v127 + 4 * (v205 ^ 0x84u)) ^ v214 ^ (v199 >> 16) ^ 0x71C9D6C4 ^ (v215 + 712344059 - ((2 * v215) & 0x54EB03F6));
  v219 = *(_DWORD *)(v119 + 4 * ((v201 ^ 0xC56CC7C6) >> 16));
  v220 = v218 - ((2 * v218) & 0x3DB56D30);
  v221 = *(_DWORD *)(v121 + 4 * (BYTE1(v213) ^ 0xECu));
  HIDWORD(v199) = v221 ^ 0xFB2F;
  LODWORD(v199) = v221 ^ 0x56690000;
  v222 = (16 * (v219 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v219 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v205) ^ 0xB)] ^ (v199 >> 16);
  v223 = *(_DWORD *)(v127 + 4 * (v209 ^ 0x43u)) ^ v219 ^ (v222 + 712344059 - ((2 * v222) & 0x54EB03F6));
  v224 = ((HIBYTE(v209) ^ 0xFFFFFF6C) + 234) ^ ((HIBYTE(v209) ^ 0xFFFFFF85) + 1);
  v225 = *(_DWORD *)(v119 + 4 * (BYTE2(v205) ^ 0x99u)) ^ 0xD43EDC0C;
  v226 = *(_DWORD *)(v121 + 4 * (BYTE1(v201) ^ 0x54u));
  HIDWORD(v199) = v226 ^ 0xFB2F;
  LODWORD(v199) = v226 ^ 0x56690000;
  v227 = (16 * v225 + 1338723912 - ((32 * v225) & 0x9F969C80)) ^ (v199 >> 16) ^ *(_DWORD *)&v124[4
                                                                                               * (HIBYTE(v209) ^ 0x9EFC8BFF ^ (v224 - 1627616378 + (~(2 * v224) | 0xC206E8F5)))
                                                                                               + 932];
  v228 = *(_DWORD *)(v119 + 4 * (BYTE2(v209) ^ 0x85u));
  v229 = *(_DWORD *)(v127 + 4 * (v213 ^ 0x91u)) ^ v225 ^ (v227 + 712344059 - ((2 * v227) & 0x54EB03F6));
  v230 = *(_DWORD *)(v121 + 4 * v217);
  HIDWORD(v199) = v230 ^ 0xFB2F;
  LODWORD(v199) = v230 ^ 0x56690000;
  v231 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * (HIBYTE(v213) ^ 0xA8)] ^ (16 * (v228 ^ 0xD43EDC0C)
                                                                     + 1338723912
                                                                     - ((32 * (v228 ^ 0xD43EDC0C)) & 0x9F969C80));
  v232 = *(_DWORD *)(v127 + 4 * (v201 ^ 0xF5u)) ^ v228 ^ (v231 + 712344059 - ((2 * v231) & 0x54EB03F6));
  v233 = *(_DWORD *)(v119 + 4 * (BYTE2(v232) ^ 0xB9u));
  v234 = *(_DWORD *)(v121 + 4 * (BYTE1(v229) ^ 0xDEu));
  HIDWORD(v199) = v234 ^ 0xFB2F;
  LODWORD(v199) = v234 ^ 0x56690000;
  v235 = v220 - 18792;
  v236 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * (((v220 - 1629833576) >> 24) ^ 0xF7)] ^ (16 * (v233 ^ 0xD43EDC0C)
                                                                                                  + 1338723912
                                                                                                  - ((32 * (v233 ^ 0xD43EDC0C)) & 0x9F969C80));
  v237 = *(_DWORD *)(v127 + 4 * (v223 ^ 0xDFu)) ^ v233 ^ (v236 + 712344059 - ((2 * v236) & 0x54EB03F6));
  v238 = *(_DWORD *)(v121 + 4 * (BYTE1(v232) ^ 0xE3u));
  HIDWORD(v199) = v238 ^ 0xFB2F;
  LODWORD(v199) = v238 ^ 0x56690000;
  v239 = *(_DWORD *)(v119 + 4 * (((v220 - 1629833576) >> 16) ^ 0xB0u)) ^ 0xD43EDC0C;
  v240 = *(_DWORD *)(v119 + 4 * (BYTE2(v223) ^ 0xC4u));
  v241 = v239 ^ *(_DWORD *)&v124[4 * (HIBYTE(v223) ^ 9)] ^ *(_DWORD *)(v127 + 4 * (v229 ^ 0x69u)) ^ ((v199 >> 16) + 712344059 - ((2 * (v199 >> 16)) & 0x54EB03F6)) ^ (LODWORD(STACK[0x300]) + 16 * v239 + ~((32 * v239) & 0x9F969C80));
  v242 = *(_DWORD *)(v121 + 4 * (HIBYTE(v235) ^ 0xDDu));
  HIDWORD(v199) = v242 ^ 0xFB2F;
  LODWORD(v199) = v242 ^ 0x56690000;
  v243 = (16 * (v240 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v240 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v229) ^ 0x5F)] ^ (v199 >> 16);
  v244 = *(_DWORD *)(v127
                   + 4
                   * ((((v232 ^ 0x43) + (v232 ^ 0xFFFFFF8F) + 1) ^ 0xFFFFFFFE)
                    + (v232 ^ 0x43))) ^ v240 ^ (v243 + 712344059 - ((2 * v243) & 0x54EB03F6));
  v245 = *(_DWORD *)(v119 + 4 * (BYTE2(v229) ^ 0x2Du));
  v246 = *(_DWORD *)(v121 + 4 * (BYTE1(v223) ^ 3u));
  HIDWORD(v199) = v246 ^ 0xFB2F;
  LODWORD(v199) = v246 ^ 0x56690000;
  v247 = (v199 >> 16) ^ *(_DWORD *)&v124[4
                                       * ((HIBYTE(v232) ^ 0xC1) & 0x90 ^ 0x86 ^ (~(2
                                                                                                  * (HIBYTE(v232) ^ 0xC1 | 0x90))
                                                                                                + (HIBYTE(v232) ^ 0xC1 | 0x90)))] ^ (16 * (v245 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v245 ^ 0xD43EDC0C)) & 0x9F969C80));
  v248 = *(_DWORD *)(v121
                   + 4
                   * ((unsigned __int16)(*(_WORD *)(v127
                                                                   + 4
                                                                   * ((((v232 ^ 0x43)
                                                                      + (v232 ^ 0xFFFFFF8F)
                                                                      + 1) ^ 0xFFFFFFFE)
                                                                    + (v232 ^ 0x43))) ^ v240 ^ (v243 - 32261 - ((2 * v243) & 0x3F6)) ^ 0x5B27) >> 8));
  HIDWORD(v199) = v248 ^ 0xFB2F;
  LODWORD(v199) = v248 ^ 0x56690000;
  v249 = *(_DWORD *)(v127 + 4 * (v235 ^ 0xC3u)) ^ v245 ^ (v247 + 712344059 - ((2 * v247) & 0x54EB03F6));
  v250 = *(_DWORD *)(v119 + 4 * ((v249 ^ 0x8D9B28BB) >> 16));
  v251 = (16 * (v250 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v250 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v237) ^ 6)] ^ (v199 >> 16);
  v252 = *(_DWORD *)(v127 + 4 * (v241 ^ 0xEEu)) ^ v250 ^ (v251 + 712344059 - ((2 * v251) & 0x54EB03F6));
  v253 = *(_DWORD *)(v119 + 4 * (BYTE2(v237) ^ 0x1Bu)) ^ 0xD43EDC0C;
  v254 = *(_DWORD *)(v121 + 4 * (BYTE1(v249) ^ 0xBBu));
  HIDWORD(v199) = v254 ^ 0xFB2F;
  LODWORD(v199) = v254 ^ 0x56690000;
  v255 = v253 ^ *(_DWORD *)&v124[4 * (HIBYTE(v241) ^ 0xD6)] ^ *(_DWORD *)(v127 + 4 * (v244 ^ 0x14u)) ^ (16 * v253 + 1338723912 - ((32 * v253) & 0x9F969C80)) ^ ((v199 >> 16) + 712344059 - ((2 * (v199 >> 16)) & 0x54EB03F6));
  v256 = *(_DWORD *)(v121 + 4 * (BYTE1(v237) ^ 0x67u));
  HIDWORD(v199) = v256 ^ 0xFB2F;
  LODWORD(v199) = v256 ^ 0x56690000;
  v257 = *(_DWORD *)(v119 + 4 * (BYTE2(v241) ^ 0x56u)) ^ 0xD43EDC0C;
  v258 = *(_DWORD *)&v124[4 * ((v244 ^ 0x45255B27u) >> 24)] ^ v257 ^ 0x6D41727E ^ (16 * v257
                                                                                 + 1338723912
                                                                                 - ((32 * v257) & 0x9F969C80)) ^ (v199 >> 16);
  HIDWORD(v199) = *(_DWORD *)(v127 + 4 * (v249 ^ 0xBBu)) ^ 0x36FD2541;
  LODWORD(v199) = HIDWORD(v199);
  LODWORD(v199) = (v199 >> 21) ^ __ROR4__(v258, 21) ^ 0x549BF9D9;
  HIDWORD(v199) = v199;
  v259 = (v199 >> 11) - ((2 * (v199 >> 11)) & 0x924BA742);
  v260 = *(_DWORD *)(v119 + 4 * (BYTE2(v244) ^ 0xE6u)) ^ 0xD43EDC0C;
  v261 = *(_DWORD *)(v121 + 4 * (BYTE1(v241) ^ 0xE4u));
  HIDWORD(v199) = v261 ^ 0xFB2F;
  LODWORD(v199) = v261 ^ 0x56690000;
  v262 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * (HIBYTE(v249) ^ 0x64)] ^ (16 * v260
                                                                     + 1338723912
                                                                     - ((32 * v260) & 0x9F969C80));
  v263 = *(_DWORD *)(v127 + 4 * (v237 ^ 0xAAu)) ^ v260 ^ (v262 + 712344059 - ((2 * v262) & 0x54EB03F6));
  v264 = v259 + 1227215777;
  v265 = *(_DWORD *)(v121 + 4 * (((unsigned __int16)(v259 - 11359) >> 8) ^ 0x73u));
  HIDWORD(v199) = v265 ^ 0xFB2F;
  LODWORD(v199) = v265 ^ 0x56690000;
  v266 = *(_DWORD *)(v119 + 4 * (BYTE2(v263) ^ 0x72u));
  v267 = (v199 >> 16) ^ *(_DWORD *)&v124[4 * HIBYTE(v252)] ^ (16 * (v266 ^ 0xD43EDC0C)
                                                            + 1338723912
                                                            - ((32 * (v266 ^ 0xD43EDC0C)) & 0x9F969C80));
  v268 = *(_DWORD *)(v127 + 4 * (v255 ^ 0xEAu)) ^ v266 ^ (v267 + 712344059 - ((2 * v267) & 0x54EB03F6));
  v269 = *(_DWORD *)(v121 + 4 * (BYTE1(v263) ^ 0x66u));
  HIDWORD(v199) = v269 ^ 0xFB2F;
  LODWORD(v199) = v269 ^ 0x56690000;
  v270 = *(_DWORD *)(v119 + 4 * (BYTE2(v252) ^ 0x4Au)) ^ 0xD43EDC0C;
  v271 = *(_DWORD *)&v124[4 * (HIBYTE(v255) ^ 0x17)] ^ 0x6D41727E ^ v270 ^ (v199 >> 16) ^ (16 * v270
                                                                                         + 1338723912
                                                                                         - ((32 * v270) & 0x9F969C80));
  v272 = *(_DWORD *)(v127 + 4 * (v264 ^ 0x4Eu));
  v273 = v271 & 0x200 | 0x16BA50BD;
  if ((v271 & 0x200 & (unsigned __int16)v272) != 0)
    v273 = 762618234 - v273;
  v274 = ((v272 ^ 0x36FD2541) - 381309117 + v273) ^ v271 & 0xFFFFFDFF;
  v275 = *(_DWORD *)(v119 + 4 * (BYTE2(v255) ^ 0x7Cu));
  v276 = (LODWORD(STACK[0x300]) + 16 * (v275 ^ 0xD43EDC0C) + ~((32 * (v275 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * ((v264 ^ 0x5784E04Eu) >> 24)];
  v277 = *(_DWORD *)(v121 + 4 * (BYTE1(v252) ^ 0x72u));
  HIDWORD(v278) = v277 ^ 0xFB2F;
  LODWORD(v278) = v277 ^ 0x56690000;
  v279 = *(_DWORD *)(v127 + 4 * (v263 ^ 0xDu)) ^ v275 ^ (v278 >> 16) ^ (v276
                                                                                         + 712344059
                                                                                         - ((2 * v276) & 0x54EB03F6));
  v280 = *(_DWORD *)(v119 + 4 * (BYTE2(v264) ^ 0x47u));
  v281 = *(_DWORD *)(v121 + 4 * (BYTE1(v255) ^ 0xD9u));
  HIDWORD(v278) = v281 ^ 0xFB2F;
  LODWORD(v278) = v281 ^ 0x56690000;
  v282 = (16 * (v280 ^ 0xD43EDC0C) + 1338723912 - ((32 * (v280 ^ 0xD43EDC0C)) & 0x9F969C80)) ^ *(_DWORD *)&v124[4 * (HIBYTE(v263) ^ 0x32)] ^ (v278 >> 16);
  v283 = *(_DWORD *)(v127 + 4 * (v252 ^ 0x78u)) ^ v280 ^ (v282 + 712344059 - ((2 * v282) & 0x54EB03F6));
  v284 = v95;
  v285 = (char *)*(&off_10005BF50 + (v95 ^ 0x211)) - 4;
  v286 = HIBYTE(v268);
  v287 = *(_DWORD *)&v285[4 * (HIBYTE(v268) ^ 7)];
  v288 = *(_DWORD *)&v285[4 * (HIBYTE(v274) ^ 0x45)];
  v289 = HIBYTE(v279);
  LODWORD(STACK[0x300]) = *(_DWORD *)&v285[4 * (HIBYTE(v279) ^ 0x60)];
  LODWORD(a61) = HIBYTE(v283);
  LODWORD(a60) = *(_DWORD *)&v285[4 * (HIBYTE(v283) ^ 0x45)];
  v290 = (HIBYTE(v274) ^ 0x9FD529D8) - 1346814987 + v288;
  v291 = (char *)*(&off_10005BF50 + (v95 ^ 0x2C8)) - 4;
  v292 = *(_DWORD *)&v291[4 * (BYTE2(v283) ^ 0x3B)];
  v293 = *(_DWORD *)&v291[4 * (BYTE2(v268) ^ 0xA7)];
  v294 = (char *)*(&off_10005BF50 + (v95 ^ 0x279)) - 4;
  v295 = *(_DWORD *)&v294[4 * (BYTE1(v283) ^ 0xA0)] ^ 0x741F7B95;
  v296 = *(_DWORD *)&v291[4 * (BYTE2(v274) ^ 0x37)];
  v297 = (v293 >> 4) ^ 0x39F43E7D ^ (v293 >> 2) ^ v290 ^ (1515496080 * v295);
  HIDWORD(v354) = *(_DWORD *)&v291[4 * (BYTE2(v279) ^ 0x35)];
  v298 = v297 - ((2 * v297) & 0x411E0782);
  v299 = *(_DWORD *)&v294[4 * (BYTE1(v279) ^ 0x1F)];
  v300 = v279;
  v301 = (v279 ^ 0x77) - 1819687176 + ((2 * (v279 ^ 0x77) + 224) & 0x10E ^ 0xD6DFDFFF);
  v302 = *(_DWORD *)&v294[4 * (BYTE1(v268) ^ 0x6A)];
  LODWORD(a58) = *(_DWORD *)&v294[4 * (BYTE1(v274) ^ 0x5E)];
  LODWORD(v294) = v274;
  v303 = (char *)*(&off_10005BF50 + (int)a62 - 564) - 4;
  v304 = *(_DWORD *)&v303[4 * (v294 ^ 0x9D)];
  v305 = *(_DWORD *)&v303[4 * (v300 ^ 0x75)];
  v306 = *(_DWORD *)&v303[4 * (v283 ^ 0x92)];
  LODWORD(a41) = v268;
  HIDWORD(a57) = *(_DWORD *)&v303[4 * (v268 ^ 0xA8)];
  v307 = v301 ^ v353 ^ v305 ^ v293 ^ v295 ^ (v298 + 546243521) ^ 0xEE79702C;
  LODWORD(v354) = v301 ^ v353 ^ v305 ^ v293 ^ v295 ^ (v298 + 546243521);
  v308 = (uint64_t)*(&off_10005BF50 + (int)a62 - 407);
  v340[5] = *(_BYTE *)(v308 + (BYTE2(v307) ^ 0x5ELL)) ^ BYTE2(v307) ^ 0x8A ^ ((BYTE2(v307) ^ 0x8A)
                                                                            - ((2 * (BYTE2(v307) ^ 0x8A) - 18) & 0xB2)
                                                                            - 48) ^ 0xB9;
  v309 = ((v286 ^ 0x9FD5299A) - 1346814987 + v287) ^ 0x39F43E7D ^ (v292 >> 2) ^ (v292 >> 4) ^ (1515496080
                                                                                             * (v299 ^ 0x741F7B95));
  v310 = v292 ^ HIDWORD(v351) ^ v299 ^ 0x741F7B95 ^ v304 ^ ((v294 ^ 0x9F)
                                                          - 1819687176
                                                          + ((2 * (v294 ^ 0x9F) + 224) & 0x10E ^ 0xD6DFDFFF)) ^ (v309 - ((2 * v309) & 0x8D5091EE) - 962049801);
  v311 = v310 ^ 0xE26ECC83;
  v312 = (BYTE1(v311) | 0x88) ^ (v311 >> 8) & 0x88;
  v313 = (uint64_t)*(&off_10005BF50 + (int)(a62 ^ 0x230));
  v340[2] = (((unsigned __int16)(v310 ^ 0xCC83) >> 8) | 0x88) ^ ((unsigned __int16)(v310 ^ 0xCC83) >> 8) & 0x88 ^ 0x35 ^ ((*(_BYTE *)(v313 + (v312 ^ 0x14)) ^ 0x13) + ((2 * *(_BYTE *)(v313 + (v312 ^ 0x14))) | 0xDF) - 111);
  v314 = (char *)*(&off_10005BF50 + (int)(a62 ^ 0x20B)) - 12;
  v315 = v314[BYTE3(v354) ^ 0x53];
  HIDWORD(v278) = v315 ^ 0xD;
  LODWORD(v278) = (v315 ^ 0x20) << 24;
  v340[STACK[0x260]] = (v278 >> 29) ^ 0x83;
  v316 = ((v289 ^ 0x9FD529FD) - 1346814987 + LODWORD(STACK[0x300])) ^ 0x39F43E7D ^ (v296 >> 2) ^ (v296 >> 4);
  v317 = (v316 - ((2 * v316) & 0xA6C61314) - 748484214) ^ v296;
  v318 = (v317 & 0x1000000 ^ 0x7BF3C7E5) + 2 * (v317 & 0x1000000);
  v111 = ((v318 - 2079573989) & (v306 ^ 0x16000000)) == 0;
  v319 = v318 - 136349184;
  v320 = -272168502 - v318;
  if (v111)
    v320 = v319;
  v321 = (1515496080 * (v302 ^ 0x741F7B95)) ^ v317 & 0xFEFFFFFF ^ 0x7697E6 ^ ((v306 ^ ((v283 ^ 0x90)
                                                                                     - 1819687176
                                                                                     + ((2
                                                                                       * (v283 ^ 0x90)
                                                                                       + 224) & 0x10E ^ 0xD6DFDFFF)))
                                                                            - 1943224805
                                                                            + v320);
  v322 = v302 ^ v352 ^ (v321 - 629346785 - ((2 * v321) & 0xB4F9DC3E));
  v323 = (uint64_t)*(&off_10005BF50 + (v284 ^ 0x289));
  v340[11] = *(_BYTE *)(v323 + ((v302 ^ v352 ^ (v321 + 31 - ((2 * v321) & 0x3E))) ^ 0xBDLL)) ^ 0x4D;
  v324 = v314[HIBYTE(v310) ^ 0x39];
  HIDWORD(v325) = v324 ^ 0xD;
  LODWORD(v325) = (v324 ^ 0x20) << 24;
  v326 = STACK[0x258];
  v340[STACK[0x258]] = (v325 >> 29) ^ 0xFB;
  v340[1] = BYTE2(v311) ^ 0x61 ^ ((BYTE2(v311) ^ 0x61) - ((2 * (BYTE2(v311) ^ 0x61) - 18) & 0xB2) - 48) ^ 0xB8 ^ *(_BYTE *)(v308 + (BYTE2(v311) ^ 0xB5));
  v327 = (a61 ^ 0x9FD529D8) - 1346814987 + a60;
  v328 = HIDWORD(v354) ^ 0x3182F7D ^ (((HIDWORD(v354) >> 4) ^ 0x39F43E7D ^ (HIDWORD(v354) >> 2))
                                    - ((2 * ((HIDWORD(v354) >> 4) ^ 0x39F43E7D ^ (HIDWORD(v354) >> 2))) & 0x201B6222)
                                    - 804409071);
  v329 = (v328 & 0x80000 ^ 0xF2797F76) + 2 * (v328 & 0x80000);
  v111 = ((v329 + 226918538) & v327) == 0;
  v330 = v329 + 1845484464;
  v331 = 1391647388 - v329;
  if (v111)
    v331 = v330;
  v332 = v328 & 0xFFF7FFFF ^ (1515496080 * (a58 ^ 0x741F7B95)) ^ (v327 - 1618565926 + v331);
  v333 = HIDWORD(a57) ^ ((a41 ^ 0xAA) + 2096205936) ^ (v332 - ((2 * v332) & 0x2D306D0E) + 379074183);
  v334 = a58 ^ HIDWORD(v352) ^ (v333 - 648901423 - ((2 * v333) & 0xB2A519C2) + 16);
  v340[STACK[0x240]] = *(_BYTE *)(v308 + (BYTE2(v334) ^ 0x84) + ((v334 >> 15) & 0x1A8 ^ 0xFFFFFEF7) + 213) ^ BYTE2(v334) ^ ((BYTE2(v334) ^ 0x84) - ((2 * (BYTE2(v334) ^ 0x84) - 18) & 0xB2) - 48) ^ 2;
  v335 = v314[HIBYTE(v334) ^ 0x8ELL];
  HIDWORD(v336) = v335 ^ 0xD;
  LODWORD(v336) = (v335 ^ 0x20) << 24;
  v340[STACK[0x270]] = (v336 >> 29) ^ 0x50;
  v340[STACK[0x210]] = ((v322 ^ 0xBBC2A2F2) >> 16) ^ 0x94 ^ ((((v322 ^ 0xBBC2A2F2) >> 16) ^ 0x94)
                                                                         - ((2
                                                                           * (((v322 ^ 0xBBC2A2F2) >> 16) ^ 0x94)
                                                                           - 18) & 0xB2)
                                                                         - 48) ^ *(_BYTE *)(v308
                                                                                          + (((v322 ^ 0xBBC2A2F2) >> 16) ^ 0x40)) ^ 0xC;
  v337 = (((v334 ^ 0x2B2AE9BA) >> 4) & 0xF0 | ((unsigned __int16)(v334 ^ 0xE9BA) >> 12)) ^ 0xE6;
  v340[STACK[0x2D0]] = *(_BYTE *)(v313 + (((v337 >> 4) & 0xFFFFFF0F | (16 * (v337 & 0xF))) ^ 0xAELL)) ^ (((v337 >> 4) & 0xF | (16 * (v337 & 0xF))) - ((2 * ((v337 >> 4) & 0xF | (16 * (v337 & 0xF)))) & 0x26) + 19) ^ 0x2B;
  v340[STACK[0x200]] = (((unsigned __int16)(v322 ^ 0xA2F2) >> 8) - (((v322 ^ 0xBBC2A2F2) >> 7) & 0x26) + 19) ^ 0xDB ^ *(_BYTE *)(v313 + (((unsigned __int16)(v322 ^ 0xA2F2) >> 8) ^ 0xA0));
  v340[STACK[0x2C0]] = (BYTE1(v307) - ((v307 >> 7) & 0x26) + 19) ^ *(_BYTE *)(v313 + (BYTE1(v307) ^ 0x75)) ^ 0x80;
  v340[STACK[0x2A0]] = *(_BYTE *)(v323 + (v310 ^ 0xB0)) ^ 0xE0;
  v340[STACK[0x268]] = *(_BYTE *)(v323 + (v354 ^ 0xE0)) ^ 0x71;
  v340[STACK[0x2E0]] = *(_BYTE *)(v323 + (v334 ^ 0x15)) ^ 0xDE;
  v338 = v314[BYTE3(v322) ^ 0x3DLL];
  HIDWORD(v336) = v338 ^ 0xD;
  LODWORD(v336) = (v338 ^ 0x20) << 24;
  v340[STACK[0x2B8]] = (v336 >> 29) ^ 0x2E;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x2F8] + 8 * ((251 * ((((_DWORD)v326 + 1706446345 - ((2 * (_DWORD)v326 + 32) & 0xCB6C9C12) + 16) ^ 0x65B64E00) < 0x150)) ^ v284)))(3604996095, v308, 13, v313, v322, 1515496080, v323, STACK[0x2F8], a9, a10, a11, a12, a13, a14, a15, a16, a17, v340, v341,
           v342,
           v72,
           v343,
           v344,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           v345,
           v346,
           v347,
           v348,
           v349,
           v350,
           v351,
           v352,
           v354,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           2);
}

void sub_100035F88()
{
  JUMPOUT(0x100033ECCLL);
}

uint64_t sub_10003606C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  unsigned int v22;

  v19 = a18 - 37;
  v20 = STACK[0x3F0];
  STACK[0x5A0] -= 32;
  if (((a18 - 37) ^ 0xA9370BC) == 0xA9371C2)
    v21 = 2017444214;
  else
    v21 = -2017420626;
  LODWORD(STACK[0x300]) = v21;
  v22 = (172 * (v19 ^ 0x17C)) ^ 0xF2D84727;
  *(_BYTE *)(v20 + v22 + 220707536) = *(_BYTE *)(a13 + v22 + 220707536) ^ *(_BYTE *)(*(_QWORD *)(v18 + 8 * (v19 - 265))
                                                                                   + (((_BYTE)v22 - 48) & 0xF)
                                                                                   - 12) ^ *(_BYTE *)((((_BYTE)v22 - 48) & 0xF) + *(_QWORD *)(v18 + 8 * (v19 - 325)) + 2) ^ (99 * ((v22 - 48) & 0xF)) ^ *(_BYTE *)(*(_QWORD *)(v18 + 8 * (v19 ^ 0x110)) + (((_BYTE)v22 - 48) & 0xF) - 9) ^ 0xE7;
  return (*(uint64_t (**)(void))(a8 + 8 * (v19 ^ 0xDD)))();
}

void sub_100036168()
{
  JUMPOUT(0x1000360F8);
}

uint64_t sub_100036170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;

  STACK[0x468] -= 16;
  return (*(uint64_t (**)(void))(a8 + 8 * (((2 * (v9 ^ 0x53C) - 261) * (v10 == v8)) ^ v9)))();
}

uint64_t sub_1000361A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _BYTE *a14)
{
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  _BYTE *v19;

  v15 = STACK[0x4B8];
  v16 = STACK[0x2F8];
  v17 = 9 * (v14 ^ 0x444u) - 272;
  v18 = (v17 >> 4) - ((v17 >> 3) & 0xAE43D16) + 1970413195;
  a14[12] = (HIBYTE(v18) ^ 0x75) - 2 * ((HIBYTE(v18) ^ 0x75) & 0xEF ^ HIBYTE(v18) & 8) - 25;
  a14[13] = (BYTE2(v18) ^ 0x72) - ((2 * (BYTE2(v18) ^ 0x72)) & 0xCF) - 25;
  a14[14] = (BYTE1(v18) ^ 0x1E) + (~(2 * (BYTE1(v18) ^ 0x1E)) | 0x31) - 24;
  a14[15] = ((v17 >> 4) - ((v17 >> 3) & 0x16) - 117) ^ 0x6C;
  v19 = (_BYTE *)(v15 + v17);
  *v19 ^= *a14 ^ 0xE7;
  v19[1] ^= a14[1] ^ 0xE7;
  v19[2] ^= a14[2] ^ 0xE7;
  v19[3] ^= a14[3] ^ 0xE7;
  v19[4] ^= a14[4] ^ 0xE7;
  v19[5] ^= a14[5] ^ 0xE7;
  v19[6] ^= a14[6] ^ 0xE7;
  v19[7] ^= a14[7] ^ 0xE7;
  v19[8] ^= a14[8] ^ 0xE7;
  v19[9] ^= a14[9] ^ 0xE7;
  v19[10] ^= a14[10] ^ 0xE7;
  v19[11] ^= a14[11] ^ 0xE7;
  v19[12] ^= a14[12] ^ 0xE7;
  v19[13] ^= a14[13] ^ 0xE7;
  v19[14] ^= a14[14] ^ 0xE7;
  v19[15] ^= a14[15] ^ 0xE7;
  return (*(uint64_t (**)(void))(v16 + 8 * (v14 - 657)))();
}

void sub_1000363B4()
{
  JUMPOUT(0x1000361E4);
}

uint64_t sub_1000363BC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8
                                        * ((95
                                          * ((((4 * (a2 ^ 0xD) - 80) ^ (LODWORD(STACK[0x32C]) == ((4 * (a2 ^ 0xD)) ^ 0x594)
                                                                                               + 1991213608)) & 1) == 0)) ^ (4 * (a2 ^ 0xD))))
                            - 12))();
}

uint64_t sub_100036434@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((1321
                                          * (*(unsigned __int8 *)(v2 + v3 + ((a2 + 916) ^ (v4 - 1205))) != 231)) ^ a2))
                            - ((a2 + 1818798811) & 0x9397555C ^ 0x15CLL)))();
}

uint64_t sub_100036494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8
                                        * ((95 * ((((v8 - 80) ^ (v9 == (v8 ^ 0x594) + 1991213608)) & 1) == 0)) ^ v8))
                            - 12))();
}

uint64_t sub_1000364DC()
{
  int v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  LODWORD(STACK[0x32C]) = 1991213896;
  v1 = (v0 - 864);
  v2 = STACK[0x4B8];
  v3 = ((unint64_t)&STACK[0x558] ^ 0xD89FBF75F6DFDBDELL)
     + 0x7FE379FF5FEB4022
     + ((v1 ^ 0xB13F7EEBEDBFB6B0) & (2 * (_QWORD)&STACK[0x558]));
  v4 = STACK[0x2F8];
  v5 = ((v0 - 167) ^ 0xFFFFFFFFFFFFFC42) + 336;
  STACK[0x558] = v5;
  *(_BYTE *)(v2 + v5) = (v3 ^ 0xBA) * (v3 + 17);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)((2 * (STACK[0x558] == 0)) | (8 * (STACK[0x558] == 0)) | v1))
                            - 4))();
}

void sub_1000369DC()
{
  JUMPOUT(0x100036998);
}

uint64_t sub_1000369E4()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v3 = ((uint64_t (*)(void))STACK[0x230])();
  LODWORD(STACK[0x5C0]) = v2;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1
                                                      + 8
                                                      * (((((v0 - 893) | 0x424) ^ 0x41B) * (v2 != 2017444214)) ^ v0))
                                          - 12))(v3);
}

uint64_t sub_100036A28()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(v1 + 8 * ((1977 * (STACK[0x4D8] != 0)) ^ (v0 - 143))))(STACK[0x4D8]);
}

uint64_t sub_100036A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  int a67;
  unint64_t a68;
  unint64_t a69;
  int v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v73;
  unint64_t v74;

  v71 = STACK[0x2E8];
  v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 + 8 * (v69 - 944)) - 8);
  v73 = STACK[0x2C8];
  STACK[0x258] = STACK[0x2C8] + 49;
  STACK[0x240] = v71 + 49;
  STACK[0x210] = v73 + 29;
  STACK[0x200] = v71 + 29;
  a69 = v73 + 9;
  a68 = v71 + 9;
  STACK[0x2D0] = (unint64_t)&a9 - 0x78011E6450C4DCDELL;
  STACK[0x2B8] = ((unint64_t)&STACK[0x430] ^ 0x5A3FEF197EFB7FF9)
               - 0x423500190450145DLL
               + ((2 * (_QWORD)&STACK[0x430]) & 0xB47FDE32FDF6FFF0);
  v74 = STACK[0x308];
  LODWORD(STACK[0x2C0]) = STACK[0x308] - 1097;
  a67 = v74 ^ 0x5DF;
  a64 = (4 * (_DWORD)v74) ^ 0x14F8u;
  LODWORD(a63) = v74 + 1454527387;
  LODWORD(a62) = v74 + 2120928007;
  LODWORD(a61) = v74 - 1139332997;
  a60 = 173 * (v74 ^ 0x46C);
  LODWORD(STACK[0x2E0]) = 183 * (v74 ^ 0x466);
  *(int32x4_t *)&STACK[0x2A0] = vdupq_n_s32(0x783FC17Eu);
  *(int32x4_t *)&STACK[0x270] = vdupq_n_s32(0x783FC176u);
  LODWORD(STACK[0x268]) = 11 * (v74 ^ 0x401);
  LODWORD(STACK[0x260]) = v74 - 2118790509;
  a58 = (int)v74;
  LODWORD(STACK[0x300]) = v74 ^ 0x50A;
  return v72(a1, a2, a3, a4, 4034888428, 4054184978, a7, v74, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_100036A74(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;

  *(_BYTE *)(a1 + (v7 - 372831179)) = *(_BYTE *)(a7 + (v7 - 372831179));
  return (*(uint64_t (**)(void))(a6 + 8 * (((v7 - 1 != a4) * ((v8 - 780) ^ 0x148)) | (v8 - 763))))();
}

uint64_t sub_100036ABC@<X0>(int a1@<W7>, int a2@<W8>)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((53 * (((a1 - 1123) & a2) == 0)) ^ (a1 - 932))) - 8))();
}

uint64_t sub_100036AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;
  unsigned int v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((51 * ((v9 ^ v10) < (a8 ^ 0x665u))) ^ (a8 - 986))) - 8))();
}

uint64_t sub_100036B30@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((523 * ((5 * v4) + v1 - 1120 == v3 + v2)) ^ a1))
                            - 8))();
}

uint64_t sub_100036B6C@<X0>(int a1@<W8>)
{
  _QWORD *v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  int v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  unsigned int v18;
  int v19;
  void (*v20)(uint64_t);
  unint64_t v21;
  unsigned int v22;
  int v23;
  unint64_t v24;

  v7 = (a1 + 506215514) & 0xE1D3C77F;
  v1[31] = 0x832ED317C4881B0;
  v1[32] = v1 + 33;
  v1[65] = 0x832ED317C4881B0;
  v1[66] = v1 + 67;
  STACK[0x2A0] = (unint64_t)v1 + 0x79262543413A9857;
  v1[99] = 0x832ED317C4881B0;
  v1[100] = v1 + 101;
  STACK[0x2B8] = (unint64_t)v1 + 0x79262543413A9967;
  v1[133] = 0x832ED317C4881B0;
  v1[134] = v1 + 135;
  STACK[0x2C0] = (unint64_t)v1 + 0x79262543413A9A77;
  v1[167] = 0x832ED317C4881B0;
  v1[168] = v1 + 169;
  STACK[0x2D0] = (unint64_t)v1 + 0x79262543413A9B87;
  v8 = STACK[0x528] + 4;
  LODWORD(STACK[0x2F0]) = 2 * v4;
  LODWORD(STACK[0x300]) = a1 + 539;
  v9 = 1225351577 * ((v6 + 562447963 - 2 * ((v6 - 200) & 0x21864723)) ^ 0x5F79DD11);
  *(_DWORD *)(v6 - 180) = a1 + 539 - v9;
  *(_QWORD *)(v6 - 192) = v8;
  *(_DWORD *)(v6 - 200) = ((v4 ^ 0xA5CA3A81) + 2136960730 + ((2 * v4) & 0xBBEBF7EE ^ 0xB06B82EC)) ^ v9;
  *(_QWORD *)(v6 - 176) = (char *)v1 + 0x79262543413A9747;
  v10 = (void (*)(uint64_t))(*(_QWORD *)(v5 + 8 * (int)(a1 & 0xF6D96ED1)) - 8);
  STACK[0x2E0] = (unint64_t)v10;
  v10(v6 - 200);
  v11 = v8 + v3;
  STACK[0x270] = v8 + v3;
  LODWORD(v8) = STACK[0x2F0];
  v12 = 1225351577 * ((((v6 - 200) | 0x155097C1) + (~(v6 - 200) | 0xEAAF683E)) ^ 0x6BAF0DF2);
  *(_QWORD *)(v6 - 176) = STACK[0x2A0];
  v13 = STACK[0x300];
  *(_DWORD *)(v6 - 180) = LODWORD(STACK[0x300]) - v12;
  *(_QWORD *)(v6 - 192) = v11;
  *(_DWORD *)(v6 - 200) = ((v4 ^ 0x748AAA9) - 572653838 + ((v7 ^ 0xFEEED3DA) & v8 ^ 0xF06E82AC)) ^ v12;
  ((void (*)(uint64_t))STACK[0x2E0])(v6 - 200);
  v14 = STACK[0x270] + v3;
  STACK[0x2A0] = v14;
  v15 = 1225351577 * ((896332480 - ((v6 - 200) | 0x356CF2C0) + ((v6 - 200) | 0xCA930D3F)) ^ 0xB46C970D);
  *(_DWORD *)(v6 - 200) = ((v4 ^ 0x7C22FAF) - 581469192 + (v8 & 0xFFFBDDB2 ^ 0xF07B80A0)) ^ v15;
  *(_QWORD *)(v6 - 192) = v14;
  *(_DWORD *)(v6 - 180) = v13 - v15;
  *(_QWORD *)(v6 - 176) = STACK[0x2B8];
  v16 = (void (*)(uint64_t))STACK[0x2E0];
  ((void (*)(uint64_t))STACK[0x2E0])(v6 - 200);
  v17 = STACK[0x2A0] + v3;
  v18 = (v4 ^ 0x7CAAAAF) - 580911368 + (STACK[0x2F0] & 0xFFEAD7B2 ^ 0xF06A82A0);
  v19 = 1225351577 * ((((v6 - 200) | 0xC99D9FFD) - (v6 - 200) + ((v6 - 200) & 0x36626000)) ^ 0xB76205CF);
  *(_QWORD *)(v6 - 176) = STACK[0x2C0];
  *(_DWORD *)(v6 - 200) = v18 ^ v19;
  *(_DWORD *)(v6 - 180) = LODWORD(STACK[0x300]) - v19;
  *(_QWORD *)(v6 - 192) = v17;
  v16(v6 - 200);
  v20 = v16;
  v21 = STACK[0x2F8];
  v22 = (v4 ^ 0x2742BBA7) - 36179968 + (STACK[0x2F0] & 0xBEFAF5A2 ^ 0xB07A80A0);
  v23 = 1225351577
      * ((-2 - (((v6 - 200) ^ 0x90B48304 | 0x67434C63) + ((v6 - 200) ^ 0x42030042 | 0x98BCB39C))) ^ 0x53B7E68B);
  *(_DWORD *)(v6 - 180) = LODWORD(STACK[0x300]) - v23;
  *(_QWORD *)(v6 - 176) = STACK[0x2D0];
  *(_DWORD *)(v6 - 200) = v22 ^ v23;
  *(_QWORD *)(v6 - 192) = v17 + v3;
  v20(v6 - 200);
  v24 = STACK[0x528];
  STACK[0x358] = (v2 - 1991213896);
  return (*(uint64_t (**)(unint64_t))(v21
                                                     + 8
                                                     * (int)((230
                                                            * (((v2 == 1991213896) ^ (v7 - 1)) & 1)) ^ (v7 - 527))))(v24);
}

uint64_t sub_100037020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = (v2 - 527);
  v5 = ((2 * (_QWORD)&STACK[0x358]) & 0xBF1EF7E3E9FD1FD0)
     - 0x5081300084828041
     + ((v4 + 0x5F8F7BF1F4FE8D9ALL) ^ (unint64_t)&STACK[0x358]);
  v6 = a2 - 1;
  STACK[0x358] = v6;
  *(_BYTE *)(a1 + v6) = ((v5 + 82) ^ 0xBA) * (v5 + 99);
  return (*(uint64_t (**)(void))(v3 + 8 * (int)((1779 * (STACK[0x358] != 0)) ^ v4)))();
}

void sub_1000370C8()
{
  JUMPOUT(0x10003708CLL);
}

uint64_t sub_1000370D4()
{
  int v0;
  uint64_t v1;

  ((void (*)(void))STACK[0x230])();
  return (*(uint64_t (**)(void))(v1 + 8 * ((1977 * (STACK[0x4D8] != 0)) ^ (v0 - 143))))();
}

uint64_t sub_100037104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  int v17;
  uint64_t v18;

  ((void (*)(void))STACK[0x230])();
  STACK[0x468] -= 16;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((a17 == 2017444214) * ((((v17 + 222) | 0x2C) - 266) ^ 0x7EE)) ^ ((v17 + 222) | 0x2C)))
                                          - 12))(a15);
}

uint64_t sub_10003718C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;

  v55 = (v51 + 2072154376 + v50) | 0x420;
  v56 = (v51 + 2072154376) & (v50 + 1055);
  v57 = ((~((v54 - 200) | v45) + ((v54 - 200) & v45)) ^ 0x99B88C2D) * v47;
  *(_QWORD *)(v54 - 192) = 0;
  *(_QWORD *)(v54 - 184) = v46;
  *(_DWORD *)(v54 - 160) = v51 - v57 - 951;
  *(_QWORD *)(v54 - 152) = a45;
  *(_QWORD *)(v54 - 144) = 0;
  *(_QWORD *)(v54 - 176) = a1;
  *(_QWORD *)(v54 - 168) = v49;
  *(_DWORD *)(v54 - 136) = v57 ^ v48;
  v58 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v53 + 8 * (v51 - 1267)) - 8))(v54 - 200);
  v59 = *(_DWORD *)(v54 - 200);
  LODWORD(STACK[0x5C4]) = v59;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v52
                                                      + 8
                                                      * (((2 * (v59 == (v56 ^ 0x783FC176 ^ v55))) | (16 * (v59 == (v56 ^ 0x783FC176 ^ v55)))) ^ v51))
                                          - 12))(v58);
}

void sub_100037244()
{
  JUMPOUT(0x100037258);
}

void sub_1000373EC()
{
  JUMPOUT(0x100037418);
}

uint64_t sub_10003747C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;

  STACK[0x2F0] = v7;
  v10 = STACK[0x384];
  *(_DWORD *)(STACK[0x5E8] + ((LODWORD(STACK[0x384]) + v6) & 0xFFFFFFFC)) = v9;
  v11 = LODWORD(STACK[0x2C0]) + v10 - 23;
  v12 = STACK[0x2C0];
  LODWORD(STACK[0x384]) = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * ((99 * ((v11 + v6) < 0x40)) ^ v12))
                                                                                                - (v12 - 27)
                                                                                                - 4))(1625, a2, a3, 1426812582, a5, a6, 3489660928);
}

uint64_t sub_100038BF8@<X0>(int a1@<W0>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unint64_t v13;

  v10 = v7 + v5;
  v11 = *(_DWORD *)(a3 + 4 * (v10 - 8)) ^ *(_DWORD *)(a3 + 4 * (v10 - 3));
  v12 = *(_DWORD *)(a3 + 4 * (v10 - 16)) ^ *(_DWORD *)(a3 + 4 * (v10 - 14)) ^ (v9 + (v3 ^ v6) + v11 - (a2 & (2 * v11)) - 180);
  HIDWORD(v13) = v12 ^ v9;
  LODWORD(v13) = v12;
  *(_DWORD *)(a3 + 4 * (v4 + v7)) = (v13 >> 31) + v9 - (a2 & (2 * (v13 >> 31)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((v4 + 1 + v7) > 0x4F) * a1) ^ v3)) - 4))();
}

uint64_t sub_100038C84()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * v0) - 12))();
}

void sub_100038D5C()
{
  JUMPOUT(0x100038CA4);
}

uint64_t sub_100038D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8 * ((269 * ((a8 + 21 + v9) < 0x28)) ^ ((v8 - 774) | 0x203)))
                            - 8))();
}

void sub_100038E30()
{
  JUMPOUT(0x100038D8CLL);
}

uint64_t sub_100038E48(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((31 * ((a2 + 1 + v3) < 0x3C)) ^ v2)) - 8))();
}

uint64_t sub_100038F08(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v6 + 8 * ((1994 * ((a3 + 1 + v5) > 0x4F)) ^ v4))
                                          - 8))(v3);
}

void sub_100038FCC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;

  LODWORD(STACK[0x4E4]) = v12;
  LODWORD(STACK[0x464]) = a2;
  LODWORD(STACK[0x438]) = v9;
  LODWORD(STACK[0x3CC]) = v10;
  LODWORD(STACK[0x384]) = a8 + 80;
  v15 = STACK[0x5D8];
  v16 = *(_DWORD *)(STACK[0x5D8] - 0x133E1E075B35BBFBLL);
  LODWORD(STACK[0x428]) = v8;
  *(_DWORD *)(v15 - 0x133E1E075B35BBFBLL) = v14
                                          + 2 * (v11 ^ 0x66E)
                                          + (v16 ^ v14)
                                          + (v8 ^ v14)
                                          - (v13 & (2 * ((v16 ^ v14) + (v8 ^ v14))))
                                          - 1124;
  JUMPOUT(0x100039030);
}

uint64_t sub_10003911C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a67;
  uint64_t v67;
  unint64_t v68;
  int v69;
  unint64_t v71;

  v68 = STACK[0x450];
  v69 = *(unsigned __int8 *)(STACK[0x450] - 0x133E1E075B35BBF3) ^ 0xED;
  if (v69 == 2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 8 * ((90 * (*(_DWORD *)(v68 - 0x133E1E075B35BBF7) != 3 * a67 + 62744475)) ^ (a8 - 684))))(a1, a2, a59, 2854199772, a5, a6, 2605084358, 1045887664);
  if (v69 == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 8 * (int)((533 * (*(_DWORD *)(v68 - 0x133E1E075B35BBF7) != STACK[0x308] + 62744680)) ^ (STACK[0x308] - 684))))(a1, a2, a59, 2511374323, a5, a6, 2605084358, 2316432709);
  v71 = STACK[0x2B8];
  STACK[0x430] = 91;
  *(_BYTE *)(v68 - 0x133E1E075B35BBF8) = ((v71 + ((((a8 + 43) | 0x30) - 73) & 0xED)) ^ 0xBA) * (v71 + 117);
  return (*(uint64_t (**)(void))(v67 + 8 * ((1502 * (STACK[0x430] == 0)) ^ ((a8 - 725) | 0x30))))();
}

void sub_100039A44()
{
  JUMPOUT(0x100039A04);
}

uint64_t sub_100039A4C()
{
  return ((uint64_t (*)(void))STACK[0x350])();
}

uint64_t sub_100039A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;

  *(_DWORD *)(STACK[0x238] + 52) = ((((LODWORD(STACK[0x5BC]) ^ v10) + (v9 ^ v10)) % 0x2710) ^ 0x7BB7BF7F)
                                 - 1343389792
                                 + ((a8 ^ 0x7A9A) & (2 * (((LODWORD(STACK[0x5BC]) ^ v10) + (v9 ^ v10)) % 0x2710)));
  v11 = STACK[0x5C4];
  STACK[0x468] -= 1616;
  LODWORD(STACK[0x42C]) = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((1625 * (v11 == v10)) ^ (a8 - 901))) - 4))();
}

uint64_t sub_100039B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  _DWORD *v8;
  uint64_t v9;

  *v8 = STACK[0x418];
  v8[85] = STACK[0x4B4];
  v8[86] = STACK[0x4D4];
  v8[87] = STACK[0x394];
  v8[88] = STACK[0x514];
  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((638 * (STACK[0x378] != 0)) ^ ((((a8 ^ 0x4BB) - 1771561698) & 0x6997E666) - 70)))
                            - (((((a8 ^ 0x4BB) - 1771561698) & 0x6997E666) - 580) | 0x91u)
                            + 685))();
}

uint64_t sub_100039B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;

  STACK[0x468] -= 1616;
  LODWORD(STACK[0x42C]) = -2017420735;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((638 * (STACK[0x378] != 0)) ^ (a8 - 70)))
                            - ((a8 - 580) | 0x91u)
                            + 685))();
}

uint64_t sub_100039BF8@<X0>(uint64_t a1@<X1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,unsigned int *a59,uint64_t (*a60)(_QWORD, uint64_t, _QWORD))
{
  uint64_t v60;
  int v61;
  uint64_t v62;

  v61 = a2 - 365;
  v62 = a60(*a59, a1, LODWORD(STACK[0x500]));
  return (*(uint64_t (**)(uint64_t))(v60
                                            + 8
                                            * ((110 * (LODWORD(STACK[0x42C]) == ((v61 - 97) | 0x422) + 2017442564)) ^ v61)))(v62);
}

void sub_100039C50()
{
  JUMPOUT(0x100039C5CLL);
}

uint64_t sub_100039CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49,uint64_t a50)
{
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;

  v54 = 3804331 * ((-1740393391 - ((v53 - 200) | 0x9843B451) + ((v53 - 200) | 0x67BC4BAE)) ^ 0xE8195068);
  v55 = v54 + LODWORD(STACK[0x318]) - 813278403;
  *(_QWORD *)(v53 - 184) = a47;
  *(_DWORD *)(v53 - 172) = v55;
  *(_DWORD *)(v53 - 168) = v54 + 455012791 * a49 - 1120514103;
  *(_DWORD *)(v53 - 176) = v54 + v50 + 50;
  *(_QWORD *)(v53 - 200) = a46;
  *(_QWORD *)(v53 - 192) = a50;
  v56 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v52 + 8 * (v50 ^ 0x156)) - 4))(v53 - 200);
  v57 = *(_DWORD *)(v53 - 164);
  LODWORD(STACK[0x4C4]) = v57;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v51
                                                      + 8
                                                      * ((1080 * (v57 == ((v50 - 938220834) & 0x37EC1FF6) + 2017443090)) ^ v50))
                                          - 12))(v56);
}

uint64_t sub_100039DEC()
{
  int v0;
  uint64_t v1;

  STACK[0x548] = STACK[0x488];
  LODWORD(STACK[0x3A0]) = STACK[0x524];
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((LODWORD(STACK[0x318]) - 1115729965) > 1)
                                * ((3 * ((v0 - 1990535832) & 0x76A52F5C ^ 0x6D1)) ^ 0x17E)) ^ (v0 - 1990535832) & 0x76A52F5C)))();
}

uint64_t sub_100039E64@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  int v56;

  v52 = STACK[0x548];
  v53 = LODWORD(STACK[0x524]) - ((2 * LODWORD(STACK[0x524])) & 0xBB500992) - 576191287;
  v54 = 1374699841 * ((v51 - 200) ^ 0x6DF41809);
  *(_DWORD *)(v51 - 200) = v49 - v54 + 368399778;
  *(_QWORD *)(v51 - 192) = a47;
  *(_QWORD *)(v51 - 184) = a48;
  *(_DWORD *)(v51 - 160) = v53 ^ v54;
  *(_DWORD *)(v51 - 156) = v54 + v48 - ((((4 * v49) ^ 0x7AFE9994) + 2 * v48) & 0x74E6F632) - 135083283;
  *(_QWORD *)(v51 - 176) = v52;
  *(_QWORD *)(v51 - 168) = a1;
  v55 = sub_100046750(v51 - 200);
  v56 = *(_DWORD *)(v51 - 152);
  LODWORD(STACK[0x4C4]) = v56;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50 + 8 * ((1689 * (v56 == 2017444214)) ^ v49)) - 12))(v55);
}

uint64_t sub_100039F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,int a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  int v70;

  v66 = STACK[0x3A0];
  v67 = *(_DWORD *)(STACK[0x238] + 52) + 14354260 + ((v62 - 390985157) & 0x174DF767);
  v68 = 108757529 * ((v65 - 200) ^ 0xE09C622B);
  *(_QWORD *)(v65 - 200) = v60;
  *(_DWORD *)(v65 - 192) = (v66 ^ 0xDF5FFBFF) - v68 + ((2 * v66) & 0xBEBFF7FE) + 2045242810;
  *(_DWORD *)(v65 - 188) = v67 ^ v68;
  *(_QWORD *)(v65 - 168) = &STACK[0x1930];
  *(_QWORD *)(v65 - 160) = a60;
  *(_DWORD *)(v65 - 180) = ((a42 ^ 0x7C6558B7) + 1021628416 + ((2 * a42) & 0xDF36F8F4 ^ 0x7344890)) ^ v68;
  *(_DWORD *)(v65 - 176) = (v61 - 350) ^ v68;
  v69 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v64 + 8 * (v61 - 369)) - 4))(v65 - 200);
  v70 = *(_DWORD *)(v65 - 184);
  LODWORD(STACK[0x4C4]) = v70;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v63 + 8 * ((1108 * (v70 == 2017444214)) ^ v61)) - 12))(v69);
}

uint64_t sub_10003A084()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v1 ^ (46 * ((v0 - 1115729966) < 0xFFFFFFFE))))
                            - (v1 - 419)
                            + 1112))();
}

uint64_t sub_10003A0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t (*a31)(_QWORD, _QWORD, _QWORD, _QWORD, unint64_t *, uint64_t, uint64_t, unint64_t *),uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,int a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int *a66;
  void (*a67)(_QWORD, uint64_t, uint64_t);
  int v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  int v80;
  char *v81;
  unsigned int v82;
  int v83;
  int v85;
  int v86;
  unint64_t v87;
  int v88;
  int v89;
  int v90;
  uint64_t v91;
  int v92;

  v77 = a31(*(unsigned int *)STACK[0x238], (v70 + v67 + 2), a42 ^ 0x93FE24CD, ((v72 + 109455853) & 0x3979D46F ^ 0xD45AC485) + *(_DWORD *)(STACK[0x238] + 52), &STACK[0x1930], v68, v69, &STACK[0x1900]);
  v79 = STACK[0x308];
  v80 = (v77 ^ 0x7F7FDBBF) - 590889505 + ((2 * v77) & 0xFEFFB77E);
  if (v80 == 1816631713)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v73
                                                       + 8
                                                       * ((LODWORD(STACK[0x2E8])
                                                         + (v79 ^ 0x18F)
                                                         - 1413048100 > 2) | ((int)v79 + 454))))(v77, v78);
  if (v80 != 1548196254)
  {
    LODWORD(STACK[0x2F0]) = v80;
    v82 = v80 - ((2 * v80 + 1198574788) & 0xF07F82EC) + 469247960;
    v83 = 3804331 * ((2 * ((v76 - 200) & 0x3D4A22D8) - (v76 - 200) + 1119214880) ^ 0xCD10C6E6);
    *(_DWORD *)(v76 - 200) = v82 ^ v83;
    *(_DWORD *)(v76 - 196) = v79 - v83 + 70;
    *(_QWORD *)(v76 - 192) = a29;
    sub_1000193D0((_DWORD *)(v76 - 200));
    v81 = (char *)&STACK[0x600] + v74 - 0x78011E6450C4E31ELL;
    STACK[0x2D0] = (unint64_t)(v81 + 2048);
    STACK[0x2D8] = (unint64_t)(v81 + 2176);
    STACK[0x300] = (unint64_t)v81;
    STACK[0x2E0] = (unint64_t)(v81 + 2304);
    JUMPOUT(0x10002EA30);
  }
  v85 = (v79 - 548) | 0x439;
  v86 = v79 - 76;
  a67(*a66, v68, v69);
  STACK[0x548] = 0;
  LODWORD(STACK[0x3A0]) = 0;
  v87 = STACK[0x310];
  v88 = *(_DWORD *)(STACK[0x238] + 52) - 689833543;
  v89 = 1224239923 * ((-1065362320 - ((v76 - 200) | 0xC07FDC70) + ((v76 - 200) | 0x3F80238F)) ^ 0xCD33DE58);
  v90 = v89 + (LODWORD(STACK[0x474]) ^ 0x7E9BFFFF) + ((2 * LODWORD(STACK[0x474])) & 0xFD37FFFE) - 1753421;
  *(_DWORD *)(v76 - 160) = v89 + STACK[0x308] - 1039;
  *(_DWORD *)(v76 - 156) = v90;
  *(_QWORD *)(v76 - 200) = a60;
  *(_DWORD *)(v76 - 188) = (a42 & 0x7FFFFFFF ^ 0xCC019B10) - v89 + (v71 & 0xBFFF7FBA ^ v85 ^ 0x27FC4FE3) - 1568179973;
  *(_DWORD *)(v76 - 184) = v88 ^ v89;
  *(_QWORD *)(v76 - 176) = v87;
  *(_QWORD *)(v76 - 168) = &STACK[0x1900];
  v91 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v75 + 8 * (int)(STACK[0x308] ^ 0x410)) - 12))(v76 - 200);
  v92 = *(_DWORD *)(v76 - 192);
  LODWORD(STACK[0x4C4]) = v92;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v73 + 8 * ((537 * (v92 == 2017444214)) ^ v86)) - 12))(v91);
}

uint64_t sub_10003A174()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((LODWORD(STACK[0x318]) - 1115729965) > 1) * ((3 * (v0 ^ 0x6D1)) ^ 0x17E)) ^ v0)))();
}

void sub_10003A1C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  LODWORD(STACK[0x4C4]) = a6 - 22;
  JUMPOUT(0x10003A1C8);
}

void sub_10003A330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  char *v6;
  uint64_t v7;

  LODWORD(STACK[0x2F0]) = 1816631713;
  LODWORD(STACK[0x4C4]) = a6 - 97;
  v6 = (char *)&STACK[0x600] + v7 - 0x78011E6450C4E31ELL;
  STACK[0x2D0] = (unint64_t)(v6 + 2048);
  STACK[0x2D8] = (unint64_t)(v6 + 2176);
  STACK[0x300] = (unint64_t)v6;
  STACK[0x2E0] = (unint64_t)(v6 + 2304);
  JUMPOUT(0x10002EA30);
}

uint64_t sub_10003A34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((638 * (STACK[0x378] != 0)) ^ (a8 - 70)))
                            - ((a8 - 580) | 0x91u)
                            + 685))();
}

uint64_t sub_10003A384@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((562 * (a1 ^ 0x5E9)) ^ 0x475) * ((v2 + v1 + 1) > 1)) ^ a1)))();
}

uint64_t sub_10003A3BC()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  v3 = STACK[0x4C4];
  LODWORD(STACK[0x2F0]) = 1816631713;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((929 * (v3 == (((v0 - 857) | 0x84) ^ (v2 - 125)))) ^ (v0 - 725)))
                            - 12))();
}

void sub_10003A4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void (*a42)(uint64_t))
{
  int v42;
  int v43;
  uint64_t v44;

  *(_DWORD *)(v44 - 200) = (((((v44 - 200) ^ 0x41440848 | 0xA61BD714) ^ 0xFFFFFFFE)
                           - ((v44 - 200) ^ 0xA0181414 | 0x59E428EB)) ^ 0xEC101E74)
                         * v43
                         + 2138962236
                         + v42
                         + 725;
  sub_10004696C((_DWORD *)(v44 - 200));
  LOBYTE(STACK[0x1A14]) = (-103 * ((((2 * (v44 + 56)) | 0x64) - (v44 + 56) + 78) ^ 0x80)) ^ 0x80;
  *(_DWORD *)(v44 - 176) = (v42 + 166) ^ (1225351577
                                        * ((((2 * (v44 - 200)) | 0xB022F764) - (v44 - 200) + 669942862) ^ 0xA6EEE180));
  LODWORD(STACK[0x2E8]) += v42 ^ 0x18E;
  *(_QWORD *)(v44 - 184) = a26;
  *(_QWORD *)(v44 - 200) = a25;
  a42(v44 - 200);
  JUMPOUT(0x10003A1C4);
}

uint64_t sub_10003A764()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((251 * (v0 - 1115729966 + (v1 ^ 0x5F3u) + 218 - 1123 > 1)) ^ v1))
                            - 8))();
}

uint64_t sub_10003A7A4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _BOOL4 v5;

  LODWORD(STACK[0x4C4]) = v2 - 22;
  v4 = STACK[0x310];
  v5 = LODWORD(STACK[0x474]) == 0;
  STACK[0x448] = LODWORD(STACK[0x474]);
  return ((uint64_t (*)(uint64_t, unint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * ((v5 * ((13 * (v1 ^ 0x455)) ^ 0x25E)) ^ (v1 - 286)))
                                                            - ((v1 + 2008865432) & 0x8843251B)
                                                            + 1036))(a1, v4);
}

void sub_10003A98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int *a65;
  void (*a66)(_QWORD, uint64_t, _QWORD);

  a66(*a65, a2, 0);
  JUMPOUT(0x10003AA4CLL);
}

uint64_t sub_10003AB24()
{
  int v0;
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(STACK[0x238] + 56);
  *(_DWORD *)(STACK[0x238] + 56) = v2 + ((v0 + 1089385307) & 0xBF1148CC) - 139;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * ((1560 * ((v2 - 1894912822) < 0xFFFFFFFA)) ^ (v0 - 984)))
                            - 8))();
}

void sub_10003AB80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void (*a42)(uint64_t))
{
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;

  *(_DWORD *)(v46 - 200) = ((-932950423 - ((v46 - 200) | 0xC8644E69) + ((v46 - 200) | 0x379BB196)) ^ 0xC5284C41) * v45
                         + 2138962236
                         + v42
                         + 984;
  sub_10004696C((_DWORD *)(v46 - 200));
  LOBYTE(STACK[0x1A14]) = (-103 * ((v46 + 56) ^ 0x32)) ^ 0x80;
  *(_DWORD *)(v46 - 176) = (v42 + 425) ^ (1225351577 * ((v46 - 200) ^ 0x7EFF9A32));
  *(_QWORD *)(v46 - 184) = v43;
  *(_QWORD *)(v46 - 200) = v44;
  a42(v46 - 200);
  JUMPOUT(0x10002F220);
}

void sub_10003AC30(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v6[3];
  int v7;
  unsigned int v8;
  unsigned int v9;

  v1 = 460628867 * (a1 ^ 0x4C96827D);
  v2 = *(_DWORD *)a1 + v1;
  v3 = (*(_DWORD *)(a1 + 44) ^ v1 ^ 0x967C6134) + ((2 * (*(_DWORD *)(a1 + 44) ^ v1)) & 0x742E7EF6 ^ 0x50063C96);
  v4 = 3804331 * ((2 * (v6 & 0x347AC888) - v6 - 880461965) ^ 0x44202CB5);
  v5 = v4 - 571873741 * (*(_DWORD *)(a1 + 24) ^ v1);
  v6[1] = *(_QWORD *)(a1 + 56);
  v6[2] = &STACK[0xF32FE879D78317F];
  v9 = v5 - 1538743953;
  v7 = v2 + v4 - 184;
  v8 = v3 + v4 - 672150546;
  v6[0] = &STACK[0x34E7A15D1F153290];
  ((void (*)(_QWORD *))((char *)*(&off_10005BF50 + v2 - 416) - 4))(v6);
  __asm { BR              X9 }
}

uint64_t sub_10003ADD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17, unsigned int a18, int a19)
{
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;

  v24 = *(_QWORD *)(v19 + 32);
  v25 = *(_QWORD *)(v19 + 16);
  v26 = 1374699841 * (&a12 ^ 0x6DF41809);
  a15 = a9;
  a16 = a9;
  a13 = v24;
  a14 = v25;
  a12 = v22 - v26 + 368399835;
  a17 = (a11 - ((2 * a11) & 0xBB500992) - 576191287) ^ v26;
  a18 = v26 + (v21 ^ 0x96182556);
  v27 = sub_100046750((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v23
                                                      + 8
                                                      * ((222 * (((v22 + 35) ^ (a19 == v20)) & 1)) ^ v22))
                                          - 4))(v27);
}

uint64_t sub_10003AE88()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  unsigned int v6;

  result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v1 + 8 * (v3 ^ 0x2C3)))(**(unsigned int **)(v1 + 8 * (v3 ^ 0x26C)), v5, v6);
  *(_DWORD *)(v0 + 40) = v2;
  return result;
}

void sub_10003AF30(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X17 }
}

uint64_t sub_10003B05C(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(v3 + 8 * ((743 * ((a2 ^ (v2 - 336) ^ 0x9619D962) != 0)) ^ (v2 - 362))))(597729977);
}

uint64_t sub_10003B0A4@<X0>(int a1@<W0>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  _BOOL4 v16;

  v12 = v9 > 0xCDC4D20F;
  *(_BYTE *)(a3 + (a1 - 597729977)) = *(_BYTE *)(v6 + ((a1 - 597729977) & 0xFLL)) ^ *(_BYTE *)(v3 + (a1 - 597729977)) ^ *(_BYTE *)(v4 + (((_BYTE)a1 + 71) & 0xF)) ^ *(_BYTE *)((((_BYTE)a1 + 71) & 0xF) + v5 + 1) ^ (23 * ((a1 + 71) & 0xF));
  v13 = a1 + 245009208;
  v14 = (a1 + 1);
  v15 = v12 ^ (v13 < v8);
  v16 = v13 < v10;
  if (!v15)
    v12 = v16;
  return (*(uint64_t (**)(uint64_t))(v11 + 8 * ((v12 * (a2 ^ 0x300)) ^ v7)))(v14);
}

uint64_t sub_10003B134(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((19
                                          * (((2 * a2) & 0x4BE7EDFE ^ 0x823A10A) + (a2 ^ 0x33EA2E7A) + 2139062197 != ((v2 - 1354) | 0xC3) + 628323533)) ^ v2))
                            - 8))();
}

uint64_t sub_10003B1A0(int a1, int a2)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((a2 + a1 + ((v2 - 154409584) & 0x934173B ^ 0x5A0C0A3Bu) > 7)
                                * (331 * ((v2 - 136) ^ 0x5E5) - 37)) ^ (v2 - 136))))();
}

uint64_t sub_10003B204(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((((a4 ^ 0x339) * a5) ^ 0x46B) * (a8 >> 4 == 174014320)) ^ a4))
                            - 4))();
}

uint64_t sub_10003B240@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, unsigned int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BOOL4 v22;

  v10 = (a2 + a1 + a3);
  v11 = v10 + v5;
  v12 = v10 + a5;
  v13 = v11 - v12;
  v14 = ((a4 - 836416583) & 0x11DAB7CF ^ 0x6CC) & (a2 + a1);
  v15 = v8 - v12;
  v16 = (v14 | v6) - v12;
  v17 = (v14 | v7) - v12;
  v18 = v15 + v14;
  v22 = v13 > 0xF && v18 > 0xF && v16 > 0xF && (unint64_t)(v17 + 1) > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((101 * v22) ^ a4)) - 4))();
}

uint64_t sub_10003B2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  unsigned int v8;
  uint64_t v9;
  _BOOL4 v10;

  v10 = v8 >= ((a8 - 1311) ^ (a8 - 802) ^ 0x215);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v9
                                                                                + 8 * (((2 * v10) | (4 * v10)) ^ a8))
                                                                    - 12))(a1, a2, a3, 0);
}

uint64_t sub_10003B300@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W5>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  int8x16_t v63;
  uint64_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16x4_t v68;
  int8x16x4_t v69;

  v60 = (a4 - 11) | 9;
  v61 = (v60 ^ 0xFFFFFC6F) & v59;
  v68.val[1].i64[0] = ((_BYTE)v58 + 9) & 0xF;
  v68.val[1].i64[1] = ((_BYTE)v58 + 8) & 0xF;
  v68.val[2].i64[0] = ((_BYTE)v58 + 7) & 0xF;
  v68.val[2].i64[1] = ((_BYTE)v58 + 6) & 0xF;
  v68.val[3].i64[0] = ((_BYTE)v58 + 5) & 0xF;
  v68.val[3].i64[1] = ((_BYTE)v58 + 4) & 0xF;
  v62 = a2 + a1 + a3;
  v63.i64[0] = 0x1717171717171717;
  v63.i64[1] = 0x1717171717171717;
  v64 = v62 & ((v60 - 481) ^ 0x1B1);
  v68.val[0].i64[0] = v64;
  v68.val[0].i64[1] = ((_BYTE)v58 + 10) & 0xF;
  v65.i64[0] = vqtbl4q_s8(v68, (int8x16_t)xmmword_100047720).u64[0];
  v69.val[0].i64[1] = ((_BYTE)v58 + 2) & 0xF;
  v69.val[1].i64[1] = v58 & 0xF;
  v69.val[2].i64[1] = (v58 + 14) & 0xF;
  v69.val[3].i64[1] = ((_BYTE)v58 + 12) & 0xF;
  v69.val[0].i64[0] = ((_BYTE)v58 + 3) & 0xF;
  v69.val[1].i64[0] = ((_BYTE)v58 + 1) & 0xF;
  v69.val[2].i64[0] = (v58 - 1) & 0xF;
  v69.val[3].i64[0] = (v58 + 13) & 0xF;
  v65.i64[1] = vqtbl4q_s8(v69, (int8x16_t)xmmword_100047720).u64[0];
  v66 = vrev64q_s8(vmulq_s8(v65, v63));
  *(int8x16_t *)(a5 - 15 + v62) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v57 + v64 - 15), *(int8x16_t *)(v54 - 15 + v62)), veorq_s8(*(int8x16_t *)(v55 + v64 - 15), *(int8x16_t *)(v64 + v56 - 14))), vextq_s8(v66, v66, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a54 + 8 * ((62 * (v61 != 16)) ^ v60)) - 12))();
}

void sub_10003B474()
{
  JUMPOUT(0x10003B3F0);
}

uint64_t sub_10003B47C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (int)(((14 * (v5 ^ 0x1D7) + ((v5 + 1468662337) & 0xA875FDE7) - 1842) * (v4 == a4)) ^ v5)))();
}

uint64_t sub_10003B4C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  char v9;
  uint64_t v10;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(v10
                                                                                       + 8
                                                                                       * ((((v9 & 8) == (a8 ^ 0x5BE))
                                                                                         * ((a8 - 477) ^ 0x3B9)) ^ a8)))(a1, a2, a3, a4, a8 ^ 0x41Au, (v8 - a4));
}

uint64_t sub_10003B508@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  int v62;
  uint64_t v63;
  int v64;
  char v65;
  uint64_t v66;
  int8x16x4_t v68;

  *(_DWORD *)(v63 - 152) = v55;
  *(_QWORD *)(v63 - 128) = a6 - 7;
  *(_QWORD *)(v63 - 120) = v56 - 7;
  *(_DWORD *)(v63 - 140) = v62 & 0xFFFFFFF8;
  *(_DWORD *)(v63 - 136) = v62;
  *(_DWORD *)(v63 - 132) = -(v62 & 0xFFFFFFF8);
  v64 = -8 - a4;
  v65 = v61 + a2 + a1;
  v66 = (a2 + a1 + a3 + v64 + 8);
  v68.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3 + (_BYTE)v64 + 8) & 0xF;
  v68.val[0].i64[1] = (v65 + 10 + (_BYTE)v64 + 8) & 0xF;
  v68.val[1].i64[0] = (v60 + (_BYTE)v64 + ((a5 + 41) ^ 4) + 8) & 0xF;
  v68.val[1].i64[1] = (v65 + 8 + (_BYTE)v64 + 8) & 0xF;
  v68.val[2].i64[0] = (v65 + 7 + (_BYTE)v64 + 8) & 0xF;
  v68.val[2].i64[1] = (v65 + 6 + (_BYTE)v64 + 8) & 0xF;
  v68.val[3].i64[0] = (v65 + 5 + (_BYTE)v64 + 8) & 0xF;
  v68.val[3].i64[1] = (v65 + 4 + (_BYTE)v64 + 8) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v63 - 128) + v66) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v59 + (v66 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v63 - 120) + v66)), veor_s8(*(int8x8_t *)(v57 + (v66 & 0xF) - 7), *(int8x8_t *)((v66 & 0xF) + v58 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v68, (int8x16_t)xmmword_100047730), (int8x8_t)0x1717171717171717)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a55 + 8 * ((1504 * (*(_DWORD *)(v63 - 132) == v64)) ^ a5))
                                         - 12))((__n128)xmmword_100047730);
}

void sub_10003B66C()
{
  JUMPOUT(0x10003B564);
}

uint64_t sub_10003B678(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((*(_DWORD *)(v4 - 136) == *(_DWORD *)(v4 - 140)) ^ a3) & 1)
                                * ((331 * (a3 ^ 0x1CE)) ^ 0x7CA)) ^ a3)))();
}

uint64_t sub_10003B6C4@<X0>(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;

  v9 = a2 - 506;
  *(_BYTE *)(a3 + (v9 + a1 - 628324508)) = *(_BYTE *)(v6 + ((v9 + a1 - 628324508) & 0xFLL)) ^ *(_BYTE *)(v3 + (v9 + a1 - 628324508)) ^ *(_BYTE *)(v4 + (((_BYTE)a2 + 6 + (_BYTE)a1 + 100) & 0xF)) ^ *(_BYTE *)((((_BYTE)a2 + 6 + (_BYTE)a1 + 100) & 0xF) + v5 + 1) ^ (23 * ((v9 + a1 + 100) & 0xF));
  return (*(uint64_t (**)(void))(v8 + 8 * ((1063 * (a1 - 1 != v7 + 487)) ^ (a2 - 532))))();
}

uint64_t sub_10003B734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  char v55;

  v53 = *(_QWORD *)(v50 + 24);
  *(int8x16_t *)(v52 - 112) = veorq_s8(*(int8x16_t *)*(_QWORD *)(v50 + 16), (int8x16_t)xmmword_100047770);
  if (a9)
    v54 = v53 == 0x621D43C813E50582;
  else
    v54 = 1;
  v55 = v54;
  HIDWORD(a26) = 2 * v49;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 + 8 * (int)((1275 * (((a5 - 68) ^ v55) & 1)) ^ a5)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

uint64_t sub_10003B7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  uint64_t v49;
  unsigned int v50;
  _BOOL4 v52;

  v50 = (HIDWORD(a25) & 0xEEFB63FC) + (v48 ^ 0x777DB1FE);
  v52 = (((((_DWORD)a5 + 141393878) & 0xF7927EE7 ^ 0xFFFFFBC9) + (((_DWORD)a5 + 73794508) & 0xFB99FEEF)) & (v50 + 2)) == 0
     && v50 != 2004726270;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 + 8 * (int)((13 * v52) ^ a5)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_10003B834@<X0>(unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  uint64_t v50;
  unsigned __int8 *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  char *v58;
  int v59;
  char *v60;
  int v61;
  unint64_t v62;
  char *v63;
  int v64;
  char v65;
  int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  int v70;
  unsigned __int8 v71;
  char *v72;
  char *v73;
  int v74;
  uint64_t v75;
  int v76;
  char *v77;
  int v78;
  unsigned __int8 v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  int v95;
  int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  int v119;
  unsigned int v120;
  int v121;
  int v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int v126;
  char *v127;
  int v128;
  uint64_t v129;
  int v130;
  int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  int v146;
  int v147;
  int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  unsigned int v159;
  int v160;
  unsigned int v161;
  int v162;
  unsigned int v163;
  int v164;
  unsigned int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  unsigned int v172;
  unsigned int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  unsigned __int8 v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  int v189;
  unsigned int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  unsigned int v196;
  unsigned int v197;
  int v198;
  unsigned int v199;
  int v200;
  int v201;
  char *v202;
  uint64_t v203;
  char *v204;
  char *v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  char v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  int v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  uint64_t v228;
  int v229;
  uint64_t v230;
  int v231;
  unsigned int v232;
  char *v233;
  char *v234;
  unsigned int v235;
  int v236;
  char *v237;
  unint64_t v238;
  int v239;
  int v240;
  char *v241;
  int v242;
  int v243;
  int v244;
  int v245;
  unsigned int v246;
  unsigned int v247;
  unsigned int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  unsigned int v255;
  int v256;
  int v257;
  int v258;
  int v259;
  int v260;
  unsigned int v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int v264;
  int v265;
  int v266;
  int v267;
  int v268;
  int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  int v279;
  int v280;
  int v281;
  int v282;
  int v283;
  unsigned int v284;
  unsigned int v285;
  int v286;
  int v287;
  unsigned int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  unsigned int v294;
  unsigned int v295;
  int v296;
  unsigned int v297;
  unsigned int v298;
  int v299;
  unsigned int v300;
  int v301;
  unsigned int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  unsigned int v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  unsigned int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  unsigned int v321;
  int v322;
  unsigned int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  int v330;
  int v331;
  int v332;
  int v333;
  unsigned int v334;
  unsigned int v335;
  int v336;
  int v337;
  int v338;
  int v339;
  int v340;
  int v341;
  int v342;
  int v343;
  int v344;
  int v345;
  unsigned int v346;
  int v347;
  int v348;
  int v349;
  int v350;
  unsigned int v351;
  int v352;
  uint64_t v353;
  uint64_t v354;
  int v355;
  uint64_t v356;
  int v357;
  uint64_t v358;
  unsigned int v359;
  int v360;
  unsigned int v361;
  int v362;
  unsigned int v363;
  int v364;
  int v365;
  int v366;
  unsigned int v367;
  char *v368;
  char *v369;
  char *v370;
  int v371;
  int v372;
  uint64_t v373;
  unsigned int v374;
  unsigned int v375;
  unsigned int v376;
  uint64_t v377;
  int v378;
  unsigned int v380;
  unsigned int v381;
  int v382;
  int v383;
  unsigned int v384;
  int v385;
  int v386;
  int v387;
  int v388;
  unsigned int v389;
  unsigned int v390;
  int v391;
  int v392;
  int v393;
  int v394;
  unsigned int v395;
  int v396;
  unsigned int v397;
  unsigned int v398;
  unsigned int v399;
  int v400;
  unsigned int v401;
  int v402;
  unsigned int v403;
  int v404;
  int v405;
  int v406;
  unsigned __int8 v407;
  int v408;
  int v409;
  int v410;
  unsigned int v411;
  int v412;
  __int16 v413;
  int v414;
  unsigned int v415;
  int v416;
  int v417;
  unsigned int v418;
  int v419;
  unsigned int v420;
  unsigned int v421;
  unsigned int v423;
  int v424;
  int v425;
  int v426;
  unsigned int v427;
  unsigned int v428;
  int v429;
  int v430;
  unsigned int v431;
  int v432;
  int v433;
  unsigned int v434;
  unsigned int v435;
  unsigned int v436;
  int v437;
  int v438;
  int v439;
  int v440;
  unsigned __int8 v441;
  unsigned int v442;
  unsigned int v443;
  int v444;
  unsigned int v445;
  unsigned int v446;
  int v447;
  unsigned int v448;
  int v449;
  int v450;
  unsigned int v451;
  int v452;
  unsigned int v453;
  __int16 v454;
  unsigned int v455;
  int v456;
  int v457;
  unsigned int v458;
  int v459;
  int v460;
  int v461;
  unsigned int v462;
  int v463;
  int v464;
  int v465;
  int v466;
  int v467;
  unsigned int v468;
  unsigned int v469;
  int v470;
  int v471;
  unsigned int v472;
  unsigned int v473;
  unsigned int v474;
  int v475;
  int v476;
  unsigned int v477;
  int v478;
  unsigned int v479;
  unsigned int v480;
  unsigned int v481;
  int v482;
  int v483;
  unsigned int v484;
  int v485;
  unsigned int v486;
  unsigned int v487;
  int v488;
  unsigned int v489;
  int v490;
  int v491;
  int v492;
  unsigned int v493;
  unsigned int v494;
  int v495;
  unsigned int v496;
  unsigned int v497;
  int v498;
  int v499;
  int v500;
  int v501;
  int v502;
  unsigned int v503;
  unsigned int v504;
  int v505;
  int v506;
  int v507;
  int v508;
  unsigned int v509;
  int v510;
  int v511;
  int v512;
  unsigned int v513;
  int v514;
  int v515;
  int v516;
  int v517;
  int v518;
  int v519;
  unsigned int v520;
  unsigned int v521;
  int v522;
  int v523;
  int v524;
  int v525;
  int v526;
  int v527;
  int v528;
  unsigned int v529;
  int v530;
  int v531;
  int v532;
  int v533;
  int v534;
  unsigned int v535;
  unsigned int v536;
  int v537;
  int v538;
  int v539;
  int v540;
  unsigned int v541;
  int v542;
  int v543;
  int v544;
  int v545;
  unsigned int v546;
  unsigned int v547;
  int v548;
  unsigned int v549;
  int v550;
  unsigned int v551;
  char *v552;
  unsigned int v553;
  char *v554;
  int v555;
  unsigned int v556;
  uint64_t v557;
  int v558;
  char *v559;
  unsigned int v560;
  unsigned int v561;
  unsigned int v562;
  unsigned int v563;
  unsigned int v564;
  unsigned int v565;
  unsigned int v566;
  unsigned int v567;
  int v568;
  unsigned int v569;
  unsigned int v570;
  int v571;
  unsigned int v572;
  int v573;
  int v574;
  int v575;
  unsigned int v576;
  int v577;
  unsigned int v578;
  int v579;
  unsigned int v580;
  int v581;
  unsigned int v582;
  unsigned int v583;
  int v584;
  int v585;
  unsigned int v586;
  int v587;
  unsigned int v588;
  int v589;

  v55 = *(unsigned __int8 *)(v50 - 0x621D43C813E50580);
  *(_DWORD *)(v54 - 120) = v53 + 828;
  v56 = (char *)*(&off_10005BF50 + (v53 ^ 0x99)) - 8;
  v57 = (v56[v55 ^ 0xD7] ^ 0x80) << 8;
  v58 = (char *)*(&off_10005BF50 + v53 - 141) - 12;
  v59 = v58[*v51 ^ 0xB1];
  *(_DWORD *)(v54 - 208) = v52;
  v60 = (char *)*(&off_10005BF50 + v53 + 19) - 4;
  v61 = v57 | ((v59 ^ 0xE4) << 24);
  HIDWORD(v62) = v60[(v53 + 60) ^ 0xA8 ^ *(_BYTE *)(v50 - 0x621D43C813E50575)];
  LODWORD(v62) = (HIDWORD(v62) ^ 0x94) << 24;
  LOBYTE(v57) = v62 >> 26;
  v63 = (char *)*(&off_10005BF50 + (v53 ^ 0xF1)) - 4;
  v64 = v58[*(unsigned __int8 *)(v50 - 0x621D43C813E50576) ^ 0xB8];
  HIDWORD(v62) = v60[*(unsigned __int8 *)(v50 - 0x621D43C813E50579) ^ 0x6BLL];
  LODWORD(v62) = (HIDWORD(v62) ^ 0x94) << 24;
  v65 = v56[*(unsigned __int8 *)(v50 - 0x621D43C813E50574) ^ 0x2ELL];
  v66 = ((v62 >> 26) ^ 0x53) << 16;
  HIDWORD(v62) = v60[*(unsigned __int8 *)(v50 - 0x621D43C813E50581) ^ 0x47];
  LODWORD(v62) = (HIDWORD(v62) ^ 0x94) << 24;
  v67 = v61 & 0xFF00FF00 | (v63[*(unsigned __int8 *)(v50 - 0x621D43C813E5057FLL) ^ 0xECLL] + 97) ^ 9 | (((v62 >> 26) ^ 0x1E) << 16);
  v68 = ((v57 ^ 0xFB) << 16) | ((v64 ^ 0x5C) << 24) | ((v65 ^ 0x45) << 8);
  HIDWORD(v62) = v60[*(unsigned __int8 *)(v50 - 0x621D43C813E5057DLL) ^ 0xCBLL];
  LODWORD(v62) = (HIDWORD(v62) ^ 0x94) << 24;
  LOBYTE(v60) = v63[*(unsigned __int8 *)(v50 - 0x621D43C813E50577) ^ 0xB5];
  v69 = ((v63[*(unsigned __int8 *)(v50 - 0x621D43C813E5057BLL) ^ 0xA9] + 97) | ((v56[*(unsigned __int8 *)(v50 - 0x621D43C813E5057CLL) ^ 0x30] ^ 0xB5) << 8)) & 0xFF00FFFF | (((v62 >> 26) ^ 0xBA) << 16) | ((v58[*(unsigned __int8 *)(v50 - 0x621D43C813E5057ELL) ^ 0x35] ^ 0x2B) << 24);
  v70 = v66 | ((v56[*(unsigned __int8 *)(v50 - 0x621D43C813E50578) ^ 0x77] ^ 0x4F) << 8) | ((v58[*(unsigned __int8 *)(v50 - 0x621D43C813E5057ALL) ^ 0xBFLL] ^ 0x32) << 24);
  v71 = v63[*(unsigned __int8 *)(v50 - 0x621D43C813E50573) ^ 0x36] + 97;
  v72 = (char *)*(&off_10005BF50 + (v53 ^ 0xB7)) - 4;
  v73 = (char *)*(&off_10005BF50 + (v53 ^ 0x77)) - 4;
  v74 = *(_DWORD *)&v73[4 * (v57 ^ 0x61)] ^ *(_DWORD *)&v72[4 * (v71 ^ 0xFD)];
  LODWORD(v63) = (v74 ^ 0x8911A5E1) - 2 * ((v74 ^ 0x8911A5E1) & 0x63BFED9F ^ v74 & 2);
  v75 = (uint64_t)*(&off_10005BF50 + (v53 ^ 0xA9));
  v76 = ((_DWORD)v63 + 1673522589) ^ *(_DWORD *)(v75 + 4 * (v64 ^ 0xC9u));
  LODWORD(v63) = v76 - ((2 * v76) & 0x87908AD8);
  v77 = (char *)*(&off_10005BF50 + v53 - 31) - 12;
  v567 = v67;
  LODWORD(v58) = *(_DWORD *)&v77[4 * (v65 ^ 0x7D)] ^ v67 ^ ((_DWORD)v63 - 1010285204);
  v566 = v68 & 0xFFFFFF00 | v71 ^ 0x2A;
  v78 = v566 - 2 * ((v68 & 0x6DEA7400 | (v71 ^ 0x2A) & 0xD) ^ (v71 ^ 0x2A) & 4) - 303401975;
  v79 = ((_BYTE)v60 + 97) ^ 0xA8;
  v80 = v70 & 0xFFFFFF00 | v79;
  v565 = v69;
  v81 = v58 ^ v69;
  v82 = (int)v58;
  v417 = (int)v58;
  LODWORD(v58) = v58 ^ v69 ^ 0x4D;
  *(_DWORD *)(v54 - 128) = v58 ^ v80;
  v83 = (int)v58;
  v407 = v58;
  LODWORD(v60) = v58 ^ v80 ^ v78;
  v471 = BYTE1(v60);
  v461 = ((v60 ^ 0x571D59A0) >> 16);
  v84 = *(_DWORD *)&v77[4 * (BYTE1(v60) ^ 0x8E)] ^ 0x1C37C95D ^ *(_DWORD *)&v73[4 * (v461 ^ 0x49)];
  v464 = v60;
  v85 = (v84 - ((2 * v84) & 0xADDC53A0) + 1458448848) ^ *(_DWORD *)&v72[4 * (v60 ^ 0x20)];
  v86 = v60 ^ 0x571D59A0;
  v423 = v60 ^ 0x571D59A0;
  v458 = (v60 ^ 0x571D59A0) >> 24;
  LODWORD(v60) = v82 ^ *(_DWORD *)(v75 + 4 * (v458 ^ 0x65)) ^ (v85 - ((2 * v85) & 0xC77FDB3A) + 1673522589);
  *(_DWORD *)(v54 - 168) = v81;
  v564 = v80;
  *(_DWORD *)(v54 - 152) = (_DWORD)v60;
  v87 = v60 ^ 0xE174B769 ^ (v80 - 2 * (v80 & 0x6174B77D ^ v79 & 0x14) - 512444567);
  *(_DWORD *)(v54 - 132) = v87;
  v503 = ((v87 ^ v86) >> 16) ^ 0x74A7;
  v492 = ((v87 ^ v86) >> 16) ^ 0xA7;
  v88 = *(_DWORD *)&v73[4 * (((v87 ^ v86) >> 16) ^ 0x2E)];
  v479 = ((v81 ^ 0xBAF72DE4) - 2 * ((v81 ^ 0xBAF72DE4) & 0x6174B76B ^ v81 & 2) - 512444567) ^ v60 ^ 0xE174B769;
  LODWORD(v58) = ((unsigned __int16)(v87 ^ v86) >> 8);
  *(_DWORD *)(v54 - 200) = (_DWORD)v58;
  v89 = *(_DWORD *)&v77[4 * (v58 ^ 0x9B)] ^ v88;
  v571 = (v87 ^ v86);
  v90 = ((v89 ^ 0x1C37C95D) - 2 * ((v89 ^ 0x1C37C95D) & 0x56EE29F0 ^ v89 & 0x20) + 1458448848) ^ *(_DWORD *)&v72[4 * (v571 ^ 0xD2)];
  v91 = v87 ^ v86 ^ 0x8CF367FC;
  v92 = (v87 ^ v86) >> 24;
  *(_DWORD *)(v54 - 216) = v92;
  v93 = (v90 - ((2 * v90) & 0xC77FDB3A) + 1673522589) ^ *(_DWORD *)(v75 + 4 * (v92 ^ 0x69));
  v94 = v93 ^ v83 ^ 0x83F90033;
  v512 = v93 ^ v83;
  v516 = v94 ^ v87;
  v95 = ((v94 ^ v87 ^ 0x197F0DD9) - 128661835 - 2 * ((v94 ^ v87 ^ 0x197F0DD9) & 0x7854C6B7 ^ (v94 ^ v87) & 2)) ^ v91;
  v519 = ((v95 ^ 0x9547167F) >> 16);
  v568 = ((unsigned __int16)(v95 ^ 0x167F) >> 8);
  v96 = *(_DWORD *)&v73[4 * (v519 ^ 0x89)] ^ *(_DWORD *)&v77[4 * (v568 ^ 0x3A)] ^ 0x1C37C95D;
  v532 = (((v94 ^ v87 ^ 0xD9) - 75 - 2 * ((v94 ^ v87 ^ 0xD9) & 0xB7 ^ (v94 ^ v87) & 2)) ^ v91);
  v97 = (v96 - ((2 * v96) & 0xADDC53A0) + 1458448848) ^ *(_DWORD *)&v72[4 * (v532 ^ 0xE4)];
  v98 = (v95 ^ 0x9547167F) >> 24;
  *(_DWORD *)(v54 - 224) = v98;
  v99 = (v97 - ((2 * v97) & 0xC77FDB3A) + 1673522589) ^ *(_DWORD *)(v75 + 4 * (v98 ^ 0x1D));
  v496 = v93 ^ v60;
  v588 = (v99 - ((2 * v99) & 0x6E2D192C) - 1223258986) ^ v93 ^ v60;
  *(_DWORD *)(v54 - 248) = v588 ^ 0xB7168C96;
  v578 = v588 ^ 0xB7168C96 ^ v93 ^ v83;
  v100 = ((v578 ^ 0xFE25CD6D) - ((2 * (v578 ^ 0xFE25CD6D)) & 0xF0A98D6A) - 128661835) ^ v91;
  *(_DWORD *)(v54 - 232) = BYTE1(v100);
  v101 = *(_DWORD *)&v77[4 * (BYTE1(v100) ^ 0x6F)];
  *(_DWORD *)(v54 - 240) = BYTE2(v100);
  v102 = v101 ^ *(_DWORD *)&v73[4 * (BYTE2(v100) ^ 0xA8)] ^ 0x1C37C95D;
  *(_DWORD *)(v54 - 256) = HIBYTE(v100);
  v103 = (v102 - ((2 * v102) & 0xC77FDB3A) + 1673522589) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v100) ^ 0x85));
  v574 = v100;
  v104 = (v103 - ((2 * v103) & 0xADDC53A0) + 1458448848) ^ *(_DWORD *)&v72[4 * (v100 ^ 0x25)];
  LODWORD(v58) = (v104 - ((2 * v104) & 0x721C5B34) + 957230490) ^ v94;
  v576 = v578 ^ v94 ^ v87;
  *(_DWORD *)(v54 - 176) = (_DWORD)v58;
  v413 = (unsigned __int16)v58 ^ v576 ^ 0xCF25;
  *(_DWORD *)(v54 - 136) = v58 ^ v576;
  v105 = v100 ^ v58 ^ v576 ^ 0xFCBACF25;
  v586 = v100;
  v442 = (v105 ^ 0xF2B175FF) >> 24;
  v434 = ((v105 ^ 0xF2B175FF) >> 16) - 256928843;
  v430 = (v434 - (((v105 ^ 0xF2B175FF) >> 15) & 0x4A) - 16);
  v106 = *(_DWORD *)&v73[4 * (v430 ^ 0x2C)] ^ *(_DWORD *)(v75 + 4 * (v442 ^ 0x1D));
  v538 = ((unsigned __int16)(v105 ^ 0x75FF) >> 8);
  v107 = ((v106 ^ 0xBC4061AC) - 2 * ((v106 ^ 0xBC4061AC) & 0x43C8456D ^ v106 & 1) - 1010285204) ^ *(_DWORD *)&v77[4 * (v538 ^ 0x3A)];
  *(_DWORD *)(v54 - 184) = v588 ^ 0xB7168C96 ^ v104;
  v555 = (v100 ^ v58 ^ v576 ^ 0x25);
  v441 = BYTE2(v58) ^ 0x16;
  v553 = v588 ^ 0xB7168C96 ^ v104 ^ *(_DWORD *)&v72[4 * (v555 ^ 0x64)] ^ (v107 - ((2 * v107) & 0xADDC53A0) + 1458448848) ^ v58 ^ 0x7C166C11;
  v108 = v588 ^ 0xB7168C96 ^ v104 ^ *(_DWORD *)&v72[4 * (v555 ^ 0x64)] ^ (v107 - ((2 * v107) & 0xADDC53A0) + 1458448848);
  v551 = v108;
  v109 = v553 ^ 0xC504770C ^ v100;
  v580 = HIBYTE(v109);
  v526 = v588 ^ 0x96 ^ v104 ^ v72[4 * (v555 ^ 0x64)] ^ (v107 - ((2 * v107) & 0xA0) - 48) ^ v58 ^ 0x11 ^ 0xC ^ v100;
  v110 = *(_DWORD *)(v75 + 4 * (HIBYTE(v109) ^ 0x5E)) ^ *(_DWORD *)&v72[4 * (v526 ^ 0x3D)] ^ 0x3551C44D;
  v506 = BYTE1(v109);
  v111 = (v110 - ((2 * v110) & 0x87908AD8) - 1010285204) ^ *(_DWORD *)&v77[4 * (BYTE1(v109) ^ 0xD7)];
  v499 = BYTE2(v109);
  v489 = v109;
  v112 = (v111 - ((2 * v111) & 0xBFFF1862) - 536900559) ^ *(_DWORD *)&v73[4 * (BYTE2(v109) ^ 0xE)];
  v113 = (v112 - ((2 * v112) & 0x7568B62) + 61556145) ^ v108;
  *(_DWORD *)(v54 - 140) = v113;
  v509 = v553 ^ 0xC504770C ^ v58 ^ v576 ^ 0xCE43A89A;
  v114 = v113 ^ 0x66B10CE1 ^ v553 ^ 0xC504770C;
  LODWORD(v58) = v113 ^ 0x66B10CE1 ^ v58 ^ v576 ^ 0xCE43A89A;
  *(_DWORD *)(v54 - 160) = (_DWORD)v58;
  v115 = v58 ^ 0xE21420C4 ^ v109 ^ 0xB1A3C73C;
  v543 = v58 ^ 0xC4 ^ v109 ^ 0x3C;
  v584 = BYTE1(v115);
  v116 = *(_DWORD *)&v77[4 * (BYTE1(v115) ^ 0xE7)] ^ *(_DWORD *)&v72[4
                                                                   * (v58 ^ 0xC4 ^ v109 ^ 0x3C)] ^ 0x95266CBC;
  v467 = BYTE2(v115);
  v117 = (v116 - ((2 * v116) & 0xBFFF1862) - 536900559) ^ *(_DWORD *)&v73[4 * (BYTE2(v115) ^ 0x2F)];
  v454 = v113 ^ 0xDF1B;
  v473 = HIBYTE(v115);
  v118 = (v117 - ((2 * v117) & 0xC77FDB3A) + 1673522589) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v115) ^ 0xB)) ^ v113 ^ 0xFE28DF1B;
  v119 = v114 ^ v118 ^ 0xCBD0D7;
  LODWORD(v63) = v119 ^ v109 ^ 0xB1A3C73C;
  v120 = v63 >> 24;
  v121 = BYTE1(v63);
  LODWORD(v56) = *(_DWORD *)&v77[4 * (BYTE1(v63) ^ 0xBD)] ^ *(_DWORD *)(v75 + 4 * ((v63 >> 24) ^ 0xC));
  v483 = (v119 ^ v109 ^ 0x3C);
  LODWORD(v56) = ((v56 ^ 0xA077A8F1)
                - 2 * ((v56 ^ 0xA077A8F1) & 0x56EE29DE ^ v56 & 0xE)
                + 1458448848) ^ *(_DWORD *)&v72[4 * (v483 ^ 0x4B)];
  v122 = BYTE2(v63);
  v398 = v118 ^ *(_DWORD *)&v73[4 * (BYTE2(v63) ^ 0x1E)] ^ ((_DWORD)v56 - ((2 * (_DWORD)v56) & 0xBFFF1862) - 536900559);
  LODWORD(v60) = v398 ^ 0x90A3AECA ^ v58 ^ 0xE21420C4;
  v123 = v60 ^ v63;
  *(_DWORD *)(v54 - 192) = (_DWORD)v60;
  v426 = ((unsigned __int16)((unsigned __int16)v60 ^ (unsigned __int16)v63) >> 8);
  LODWORD(v77) = *(_DWORD *)&v77[4 * (v426 ^ 0xA7)];
  v415 = (v60 ^ v63) >> 24;
  LODWORD(v75) = *(_DWORD *)(v75 + 4 * (v415 ^ 0xFA));
  LODWORD(v63) = v119 ^ v58 ^ 0xE21420C4;
  v401 = v398 ^ 0x90A3AECA ^ v119;
  v410 = v123;
  LODWORD(v72) = ((v77 ^ v75 ^ 0xA077A8F1)
                - ((2 * (v77 ^ v75 ^ 0xA077A8F1)) & 0xADDC53A0)
                + 1458448848) ^ *(_DWORD *)&v72[4 * (v123 ^ 0x41)];
  v394 = BYTE2(v123);
  LODWORD(v58) = ((_DWORD)v72 - ((2 * (_DWORD)v72) & 0xBFFF1862) - 536900559) ^ *(_DWORD *)&v73[4 * (BYTE2(v123) ^ 0x59)];
  v563 = v398 ^ 0xA28E20AE ^ ((_DWORD)v58 - ((2 * (_DWORD)v58) & 0x44F21A0E) + 578358535);
  v562 = (v563 - ((2 * v563) & 0xD2AE2BFE) - 380168705) ^ v401;
  v561 = v60 ^ 0xB025B86C ^ v562;
  v560 = (v561 - ((2 * v561) & 0x815EBA9E) - 1062249137) ^ v123;
  v124 = (uint64_t)*(&off_10005BF50 + (v53 ^ 0x2A));
  LODWORD(v58) = (((v118 ^ 0x1B9155BD) >> 16)
                - 118331353
                + ((2 * ((v118 ^ 0x1B9155BD) >> 16) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)(v124 + 4 * (((v118 ^ 0x1B9155BD) >> 16) ^ 0x2Du));
  LODWORD(v75) = ((v122 ^ 0x3F) - 118331353 + ((2 * (v122 ^ 0x3F) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)(v124 + 4 * (v122 ^ 0x12u));
  v125 = (uint64_t)*(&off_10005BF50 + (v53 ^ 0xC7));
  v126 = ((_DWORD)v58 - ((2 * (_DWORD)v58) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (BYTE1(v118) ^ 0x47u));
  v558 = v53;
  v127 = (char *)*(&off_10005BF50 + v53 - 13) - 12;
  v128 = (v75 - ((2 * v75) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * (v120 ^ 0xC5)];
  v129 = (uint64_t)*(&off_10005BF50 + v53 - 157);
  v130 = *(_DWORD *)(v129 + 4 * (v63 ^ 0x42u));
  v131 = *(_DWORD *)(v129 + 4 * ((v114 ^ v118) ^ 0x82u));
  v132 = *(_DWORD *)(v124 + 4 * (BYTE2(v63) ^ 0x7Bu)) ^ *(_DWORD *)&v127[4 * ((v63 >> 24) ^ 0x47)] ^ ((BYTE2(v63) ^ 0x56) - 118331353 + ((2 * (BYTE2(v63) ^ 0x56) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ (181304767 * v130 - ((362609534 * v130 + 1999880548) & 0x52CFBFD8) - 1526611810);
  v546 = v114 ^ v118;
  v133 = (181304767 * v131 - ((362609534 * v131 - 147603100) & 0xFA8D3D5C) - 119505056) ^ *(_DWORD *)(v125 + 4 * (((unsigned __int16)(v114 ^ v118) >> 8) ^ 0xFEu));
  v549 = v133 - ((2 * v133) & 0x52CFBFD8);
  v523 = ((v114 ^ v118) >> 16);
  v583 = (v523 ^ 0xD1) - 118331353 + ((2 * (v523 ^ 0xD1) + 88) & 0x3F4 ^ 0xF7F7EFFF);
  v529 = v121 ^ 0x62;
  v540 = v128 - ((2 * v128) & 0xFA8D3D5C);
  v535 = v132 - ((2 * v132) & 0xFA8D3D5C);
  v570 = (v126 + 694673389 + (~(2 * v126) | 0xAD304027)) ^ *(_DWORD *)&v127[4 * ((v118 ^ 0x1B9155BD) >> 24)] ^ (181304767 * *(_DWORD *)(v129 + 4 * (v118 ^ 0x7Du)) + 2073682098);
  v134 = *(_DWORD *)(v124 + 4 * (((v479 ^ 0xE9B45E6C) >> 16) ^ 0xF5u)) ^ ((((v479 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                           - 118331353
                                                                                           + ((2
                                                                                             * (((((v479 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                               + 44) & 0xFFFFFFFB ^ (((v479 ^ 0xE9B45E6C) >> 16) | 0x7FFFFFFE))) ^ 0x8081003));
  v135 = *(_DWORD *)(v54 - 132) ^ 0x31676F78;
  v136 = *(_DWORD *)(v124 + 4 * (BYTE2(v135) ^ 0x7Bu)) ^ ((BYTE2(v135) ^ 0x56)
                                                          - 118331353
                                                          + ((2 * (BYTE2(v135) ^ 0x56) + 88) & 0x3F4 ^ 0xF7F7EFFF));
  v137 = (v136 - ((2 * v136) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * HIBYTE(v135)];
  v138 = *(_DWORD *)(v124 + 4 * (v492 ^ 0x93u)) ^ ((v492 ^ 0xBE)
                                                   - 118331353
                                                   + ((2 * (((v492 ^ 0xBE) + 44) & 0xFFFFFFFB ^ (v503 | 0x7FFFFFFE))) ^ 0x8081003));
  v139 = (v138 - ((2 * v138) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (*(_DWORD *)(v54 - 200) ^ 5u));
  v493 = v137 - ((2 * v137) & 0xFA8D3D5C);
  v504 = v139 - ((2 * v139) & 0x52CFBFD8);
  v140 = *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v54 - 152) ^ 0xDFu));
  v141 = *(_DWORD *)(v54 - 152) ^ 0x5A18571F;
  v142 = *(_DWORD *)&v127[4 * HIBYTE(v141)] ^ ((BYTE2(v141) ^ 0xC1)
                                             - 118331353
                                             + ((2 * (BYTE2(v141) ^ 0xC1) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v141) ^ 0xECu)) ^ (181304767 * v140 - ((362609534 * v140 + 1999880548) & 0x52CFBFD8) - 1526611810);
  v486 = v142 - ((2 * v142) & 0xFA8D3D5C);
  LODWORD(v60) = *(_DWORD *)&v127[4 * ((v479 ^ 0xE9B45E6C) >> 24)] ^ (v134 - ((2 * v134) & 0x52CFBFD8) + 694673388);
  v403 = v479 ^ 0xAC;
  v477 = BYTE1(v479) ^ 0xB4;
  v480 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0xFA8D3D5C);
  LOWORD(v60) = v114 ^ 0x2A52;
  v143 = v114 ^ 0x68592823;
  LOBYTE(v77) = v454;
  v144 = *(_DWORD *)(v54 - 160);
  v145 = *(_DWORD *)(v124 + 4 * (v467 ^ 0x78u)) ^ ((v467 ^ 0x55)
                                                   - 118331353
                                                   + ((2 * (v467 ^ 0x55) + 88) & 0x3F4 ^ 0xF7F7EFFF));
  *(_DWORD *)(v54 - 200) = -118331354;
  v146 = *(_DWORD *)(v124 + 4 * (BYTE2(v143) ^ 0xFEu)) ^ ((BYTE2(v143) ^ 0xD3)
                                                          - 118331354
                                                          - ((2 * (BYTE2(v143) ^ 0xD3) + 160207960) & 0x80813F4));
  v147 = (v145 - ((2 * v145) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * (v473 ^ 0x20)];
  v148 = BYTE2(*(_DWORD *)(v54 - 140));
  v149 = *(_DWORD *)(v124 + 4 * (v148 ^ 4u)) ^ ((v148 ^ 0x29)
                                                - 118331353
                                                + ((2 * (((v148 ^ 0x29) + 44) & 0xFFFFFFFB ^ (v148 ^ 0x29 | 0x7FFFFFFE))) ^ 0x8081003));
  v150 = (v149 - ((2 * v149) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (HIBYTE(v454) ^ 0x8Bu));
  v468 = v147 - ((2 * v147) & 0xFA8D3D5C);
  v474 = v150 - ((2 * v150) & 0x52CFBFD8);
  v151 = *(_DWORD *)(v125 + 4 * (BYTE1(v144) ^ 0x47u)) ^ ((BYTE2(v144) ^ 0xDB)
                                                          - 118331353
                                                          + ((2 * (BYTE2(v144) ^ 0xDB) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v144) ^ 0xF6u)) ^ (181304767 * *(_DWORD *)(v129 + 4 * (v144 ^ 0x31u)) - ((362609534 * *(_DWORD *)(v129 + 4 * (v144 ^ 0x31u)) - 147603100) & 0xFA8D3D5C) - 119505056);
  v152 = (v146 - ((2 * v146) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * HIBYTE(v143)] ^ (181304767
                                                                                              * *(_DWORD *)(v129 + 4 * (v60 ^ 0x99u))
                                                                                              + 2073682098);
  v448 = BYTE1(v60) ^ 0x14;
  v451 = v152 - ((2 * v152) & 0xFA8D3D5C);
  v455 = v151 - ((2 * v151) & 0x52CFBFD8);
  v153 = *(_DWORD *)(v54 - 128);
  v420 = BYTE1(v153) ^ 0xF5;
  v445 = v417 ^ 0x2BEAE26B;
  LODWORD(v60) = *(_DWORD *)(v124 + 4 * (((v417 ^ 0x2BEAE26Bu) >> 16) ^ 0xECu)) ^ ((((v417 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1) - 118331353 + ((2 * (((v417 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ (181304767 * *(_DWORD *)(v129 + 4 * (v417 ^ 0x1Eu)) + 2073682098);
  LODWORD(v60) = ((_DWORD)v60 - ((2 * (_DWORD)v60) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125
                                                                                           + 4 * (BYTE1(v417) ^ 8u));
  v154 = *(_DWORD *)(v124 + 4 * (v461 ^ 0xD7u)) ^ ((v461 ^ 0xFA)
                                                   - 118331353
                                                   + ((2
                                                     * (((v461 ^ 0xFA) + 44) & 0xFFFFFFFB ^ (HIWORD(v423) | 0x7FFFFFFE))) ^ 0x8081003));
  v155 = *(_DWORD *)(v129 + 4 * (v407 ^ 0x55u));
  v424 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0x52CFBFD8);
  v408 = BYTE2(v153) ^ 0xF7;
  v462 = (BYTE2(v153) ^ 0xA7)
       - 118331353
       + ((2 * (((BYTE2(v153) ^ 0xA7) + 44) & 0xFFFFFFFB ^ (HIWORD(v153) ^ 0xBAF7 | 0x7FFFFFFE))) ^ 0x8081003);
  LODWORD(v60) = (v154 - ((2 * v154) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (v471 ^ 0xE4u)) ^ (181304767 * *(_DWORD *)(v129 + 4 * (v464 ^ 0x53u)) + 2073682098);
  v465 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0x52CFBFD8);
  LODWORD(v75) = *(_DWORD *)(v54 - 168);
  LODWORD(v60) = (181304767 * v155 - 1526611809 + (~(362609534 * v155 + 1999880548) | 0xAD304027)) ^ ((BYTE2(v75) ^ 0xBA) - 118331353 + ((2 * (BYTE2(v75) ^ 0xBA) + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)&v127[4 * (BYTE3(v75) ^ 0x2F)] ^ *(_DWORD *)(v124 + 4 * (BYTE2(v75) ^ 0x97u));
  v418 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0xFA8D3D5C);
  LODWORD(v60) = BYTE2(*(_DWORD *)(v54 - 136));
  v156 = *(_DWORD *)(v54 - 200);
  LODWORD(v60) = *(_DWORD *)(v124 + 4 * (v60 ^ 0xFC)) ^ ((v60 ^ 0xD1)
                                                                       + v156
                                                                       - ((2 * (v60 ^ 0xD1) + 160207960) & 0x80813F4));
  v157 = *(_DWORD *)(v124 + 4 * (BYTE2(*(_DWORD *)(v54 - 184)) ^ 0x56u)) ^ ((BYTE2(*(_DWORD *)(v54 - 184)) ^ 0x7B)
                                                                            + v156
                                                                            - ((2
                                                                              * (BYTE2(*(_DWORD *)(v54 - 184)) ^ 0x7B)
                                                                              + 160207960) & 0x80813F4));
  LODWORD(v60) = ((_DWORD)v60 - ((2 * (_DWORD)v60) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125
                                                                                           + 4
                                                                                           * (HIBYTE(v413) ^ 0x35u)) ^ (181304767 * *(_DWORD *)(v129 + 4 * (v413 ^ 0x8Cu)) + 2073682098);
  v158 = *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v54 - 176) ^ 0xFBu));
  v159 = (181304767 * v158 - ((362609534 * v158 - 147603100) & 0xFA8D3D5C) - 119505056) ^ *(_DWORD *)(v125 + 4 * (BYTE1(*(_DWORD *)(v54 - 176)) ^ 0xEFu));
  v414 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0x52CFBFD8);
  v397 = v159 - ((2 * v159) & 0x52CFBFD8);
  v160 = (v157 - ((2 * v157) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v54 - 184)) ^ 0xD9)] ^ (181304767 * *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v54 - 184) ^ 0x79u)) + 2073682098);
  v161 = *(_DWORD *)(v124 + 4 * (v430 ^ 0x23u)) ^ ((v430 ^ 0xE)
                                                   - 118331353
                                                   + ((2 * (((v430 ^ 0xE) + 44) & 0xFFFFFFFB ^ (v434 | 0x7FFFFFFE))) ^ 0x8081003));
  v162 = (v161 - ((2 * v161) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * v442];
  v435 = v162 - ((2 * v162) & 0xFA8D3D5C);
  v431 = v160 - ((2 * v160) & 0xFA8D3D5C);
  v438 = v441;
  v472 = (v438 ^ 0x65) - 118331353 + ((2 * (v438 ^ 0x65) + 88) & 0x3F4 ^ 0xF7F7EFFF);
  v163 = *(_DWORD *)(v124 + 4 * (v394 ^ 0x19u)) ^ ((v394 ^ 0x34)
                                                   - 118331353
                                                   + ((2 * (v394 ^ 0x34) + 88) & 0x3F4 ^ 0xF7F7EFFF));
  v164 = *(_DWORD *)(v54 - 192);
  v443 = (BYTE2(v164) ^ 0xAB) - 118331353 + ((2 * (BYTE2(v164) ^ 0xAB) + 88) & 0x3F4 ^ 0xF7F7EFFF);
  v165 = *(_DWORD *)(v124 + 4 * (BYTE2(v398) ^ 0xE8u)) ^ ((BYTE2(v398) ^ 0xC5)
                                                          - 118331353
                                                          + ((2
                                                            * (((BYTE2(v398) ^ 0xC5) + 44) & 0xFFFFFFFB ^ (BYTE2(v398) ^ 0xC5 | 0x7FFFFFFE))) ^ 0x8081003));
  v166 = (181304767 * *(_DWORD *)(v129 + 4 * (v398 ^ 0xCAu)) + 2073682098) ^ *(_DWORD *)&v127[4 * (HIBYTE(v398) ^ 0x8E)] ^ (v165 - ((2 * v165) & 0x52CFBFD8) + 694673388);
  v395 = v401 ^ 0x89F64041;
  v167 = (181304767 * *(_DWORD *)(v129 + 4 * (v401 ^ 0x30u)) + 2073682098) ^ (((v401 ^ 0x89F64041) >> 16)
                                                                                               + v156
                                                                                               - ((2
                                                                                                 * ((v401 ^ 0x89F64041) >> 16)
                                                                                                 + 160207960) & 0x80813F4)) ^ *(_DWORD *)(v124 + 4 * (((v401 ^ 0x89F64041) >> 16) ^ 0x2Du));
  v389 = BYTE1(v398) ^ 0x16;
  v399 = v166 - ((2 * v166) & 0xFA8D3D5C);
  LODWORD(v56) = (v167 - ((2 * v167) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (BYTE1(v401) ^ 0x1Au));
  v168 = *(_DWORD *)&v127[4 * (v415 ^ 0x9F)] ^ (181304767 * *(_DWORD *)(v129 + 4 * (v410 ^ 0x6Au)) + 2073682098) ^ (v163 - ((2 * v163) & 0x52CFBFD8) + 694673388);
  v416 = (_DWORD)v56 - ((2 * (_DWORD)v56) & 0x52CFBFD8);
  v411 = v426 ^ 0x5D;
  v427 = v168 - ((2 * v168) & 0xFA8D3D5C);
  v169 = *(_DWORD *)(v129 + 4 * (v496 ^ 0xECu));
  LODWORD(v56) = *(_DWORD *)(v124 + 4 * (v519 ^ 0x32u)) ^ ((v519 ^ 0x1F)
                                                           - 118331353
                                                           + ((2
                                                             * (((v519 ^ 0x1F) + 44) & 0xFFFFFFFB ^ (v519 ^ 0x1F | 0x7FFFFFFE))) ^ 0x8081003));
  v170 = *(_DWORD *)(v129 + 4 * (v512 ^ 0xE6u));
  v171 = *(_DWORD *)&v127[4 * (HIBYTE(v496) ^ 0xCA)] ^ ((BYTE2(v496) ^ 0x2F)
                                                      + v156
                                                      - ((2 * (BYTE2(v496) ^ 0x2F) + 160207960) & 0x80813F4)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v496) ^ 2u)) ^ (181304767 * v169 - ((362609534 * v169 + 1999880548) & 0x52CFBFD8) - 1526611810);
  LODWORD(v60) = ((_DWORD)v56 - ((2 * (_DWORD)v56) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (v568 ^ 0x8Cu)) ^ (181304767 * *(_DWORD *)(v129 + 4 * (v532 ^ 0xD9u)) + 2073682098);
  v172 = *(_DWORD *)&v127[4 * ((v512 ^ 0x49A657C7u) >> 24)] ^ ((((v512 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                             - 118331353
                                                             + ((2
                                                               * (((v512 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                               + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)(v124 + 4 * (((v512 ^ 0x49A657C7u) >> 16) ^ 0x18u)) ^ (181304767 * v170 - ((362609534 * v170 + 1999880548) & 0x52CFBFD8) - 1526611810);
  v173 = *(_DWORD *)(v124 + 4 * (((v516 ^ 0x27821BA6u) >> 16) ^ 0x2Du)) ^ (((v516 ^ 0x27821BA6u) >> 16)
                                                                                            - 118331353
                                                                                            + ((2
                                                                                              * ((((v516 ^ 0x27821BA6u) >> 16)
                                                                                                + 44) & 0xFFFFFFFB ^ (((v516 ^ 0x27821BA6u) >> 16) | 0x7FFFFFFE))) ^ 0x8081003));
  v569 = (v171 - ((2 * v171) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * (BYTE1(v496) ^ 0x2Eu));
  v533 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0x52CFBFD8);
  v497 = BYTE1(v512) ^ 0xB9;
  LODWORD(v60) = (v173 + 694673389 + (~(2 * v173) | 0xAD304027)) ^ *(_DWORD *)&v127[4 * ((v516 ^ 0x27821BA6u) >> 24)] ^ (181304767 * *(_DWORD *)(v129 + 4 * (v516 ^ 0x36u)) + 2073682098);
  v520 = v172 - ((2 * v172) & 0xFA8D3D5C);
  v513 = (_DWORD)v60 - ((2 * (_DWORD)v60) & 0xFA8D3D5C);
  v384 = (v506 ^ 0xED) + ((v489 >> 7) & 0x166 ^ 0xFFFFFEBD);
  LODWORD(v60) = *(_DWORD *)(v124 + 4 * (v499 ^ 0xC5u)) ^ ((v499 ^ 0xE8)
                                                           - 118331353
                                                           + ((2
                                                             * (((v499 ^ 0xE8) + 44) & 0xFFFFFFFB ^ (HIWORD(v489) | 0x7FFFFFFE))) ^ 0x8081003));
  v500 = *(_DWORD *)(v129 + 4 * (v571 ^ 0xFBu));
  v572 = v538 ^ 0xEE;
  v174 = *(_DWORD *)(v129 + 4 * (v509 ^ 2u));
  v175 = *(_DWORD *)(v129 + 4 * (v574 ^ 0x74u));
  v176 = *(_DWORD *)(v129 + 4 * (v555 ^ 0xC2u));
  v556 = BYTE1(v516) ^ 0x9B;
  v177 = *(_DWORD *)(v129 + 4 * (v526 ^ 0xEEu));
  v178 = BYTE1(v578);
  v575 = 181304767 * *(_DWORD *)(v129 + 4 * (v483 ^ 0xEu)) + 2073682098;
  v402 = 181304767 * *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v54 - 132) ^ 0xB8u)) + 2073682098;
  v404 = 181304767 * *(_DWORD *)(v129 + 4 * v403) + 2073682098;
  v405 = 181304767 * v500 + 2073682098;
  v527 = 181304767 * *(_DWORD *)(v129 + 4 * (v77 ^ 0xA3u)) + 2073682098;
  v507 = 181304767 * *(_DWORD *)(v129 + 4 * (v543 ^ 0x5Au)) + 2073682098;
  v406 = 181304767 * *(_DWORD *)(v129 + 4 * (*(_DWORD *)(v54 - 128) ^ 0x57u)) + 2073682098;
  v501 = 181304767 * v176 + 2073682098;
  v544 = 181304767 * *(_DWORD *)(v129 + 4 * (v164 ^ 0x82u)) + 2073682098;
  v517 = 181304767 * *(_DWORD *)(v129 + 4 * (v551 ^ 0x75u)) + 2073682098;
  v490 = 181304767 * *(_DWORD *)(v129 + 4 * (v588 ^ 0xBBu)) + 2073682098;
  v179 = ((_DWORD)v60 - ((2 * (_DWORD)v60) & 0xFA8D3D5C) + 2101780142) ^ *(_DWORD *)(v125 + 4 * ((v384 + 180) ^ 0x54)) ^ (181304767 * v177 + 2073682098);
  v380 = v580 ^ 0xFD;
  LODWORD(v77) = (181304767 * v174 - ((362609534 * v174 + 1999880548) & 0x52CFBFD8) - 1526611810) ^ *(_DWORD *)&v127[4 * (HIBYTE(v509) ^ 0x56)];
  v180 = *(_DWORD *)(v124 + 4 * (BYTE2(v553) ^ 0x24u)) ^ ((BYTE2(v553) ^ 9)
                                                          - 118331353
                                                          + ((2 * (BYTE2(v553) ^ 9) + 88) & 0x3F4 ^ 0xF7F7EFFF));
  v181 = (181304767 * *(_DWORD *)(v129 + 4 * (v553 ^ 0x68u)) + 2073682098) ^ *(_DWORD *)(v125 + 4 * (BYTE1(v553) ^ 0x55u)) ^ (v180 - ((2 * v180) & 0xFA8D3D5C) + 2101780142);
  v581 = (((v551 ^ 0x231B9DB5) >> 16) ^ 0xC1)
       + *(_DWORD *)(v54 - 200)
       - ((2 * (((v551 ^ 0x231B9DB5) >> 16) ^ 0xC1) + 160207960) & 0x80813F4);
  v484 = (BYTE2(v509) ^ 8) - 118331353 + ((2 * (BYTE2(v509) ^ 8) + 88) & 0x3F4 ^ 0xF7F7EFFF);
  v182 = (181304767 * v175 - 1526611809 + (~(362609534 * v175 + 1999880548) | 0xAD304027)) ^ *(_DWORD *)&v127[4 * (*(_DWORD *)(v54 - 256) ^ 0x7B)];
  v183 = *(_DWORD *)(v124 + 4 * (BYTE2(v576) ^ 0xA2u)) ^ ((BYTE2(v576) ^ 0x8F)
                                                          - 118331353
                                                          + ((2
                                                            * (((BYTE2(v576) ^ 0x8F) + 44) & 0xFFFFFFFB ^ (BYTE2(v576) ^ 0x8F | 0x7FFFFFFE))) ^ 0x8081003)) ^ (181304767 * *(_DWORD *)(v129 + 4 * (v576 ^ 0x9Bu)) + 2073682098);
  v184 = (v183 + 2101780143 + (~(2 * v183) | 0x572C2A3)) ^ *(_DWORD *)(v125 + 4 * (BYTE1(v576) ^ 0xA9u));
  v185 = HIBYTE(v588) ^ 0x26;
  v186 = *(_DWORD *)(v124 + 4 * (BYTE2(v588) ^ 0x88u)) ^ ((BYTE2(v588) ^ 0xA5)
                                                          - 118331353
                                                          + ((2 * (BYTE2(v588) ^ 0xA5) + 88) & 0x3F4 ^ 0xF7F7EFFF));
  v187 = (181304767 * *(_DWORD *)(v129 + 4 * (v578 ^ 0x2Au)) + 2073682098) ^ ((BYTE2(v578) ^ 0x37)
                                                                                               - 118331353
                                                                                               + ((2
                                                                                                 * (BYTE2(v578) ^ 0x37)
                                                                                                 + 88) & 0x3F4 ^ 0xF7F7EFFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v578) ^ 0x1Au));
  v188 = (v187 - ((2 * v187) & 0x52CFBFD8) + 694673388) ^ *(_DWORD *)&v127[4 * (HIBYTE(v578) ^ 0xF9)];
  *(_DWORD *)(v54 - 200) = *(_DWORD *)(v124 + 4 * (v523 ^ 0xFCu));
  LODWORD(v75) = *(_DWORD *)(v54 - 240);
  *(_DWORD *)(v54 - 256) = *(_DWORD *)(v124 + 4 * (v408 ^ 0x7Du));
  v439 = *(_DWORD *)(v124 + 4 * (v438 ^ 0x48u));
  v539 = *(_DWORD *)(v124 + 4 * (BYTE2(v164) ^ 0x86u));
  v393 = *(_DWORD *)(v124 + 4 * (((v551 ^ 0x231B9DB5) >> 16) ^ 0xECu));
  v524 = *(_DWORD *)(v124 + 4 * (BYTE2(v509) ^ 0x25u));
  v589 = *(_DWORD *)(v124 + 4 * (v75 ^ 0x1A));
  LODWORD(v72) = ((v586 >> 15) & 0x58 ^ 0x48) + (v75 ^ 0x4C64A1B);
  v587 = (_DWORD)v72 - ((2 * (_DWORD)v72) & 0x80813F4) - 198435334;
  LODWORD(v72) = HIBYTE(v576) ^ 0xB3;
  v189 = v184 - ((2 * v184) & 0x52CFBFD8);
  *(_DWORD *)(v54 - 240) = *(_DWORD *)(v125 + 4 * v529);
  v530 = *(_DWORD *)(v125 + 4 * (BYTE1(v63) ^ 0x65u));
  v579 = *(_DWORD *)(v125 + 4 * (BYTE1(*(_DWORD *)(v54 - 132)) ^ 0x85u));
  v409 = *(_DWORD *)(v125 + 4 * (BYTE1(*(_DWORD *)(v54 - 152)) ^ 0xBDu));
  v577 = *(_DWORD *)(v125 + 4 * v477);
  v392 = *(_DWORD *)(v125 + 4 * (v584 ^ 0xC7u));
  v190 = HIBYTE(*(_DWORD *)(v54 - 140)) ^ 0x12;
  v391 = *(_DWORD *)(v125 + 4 * v448);
  v585 = *(_DWORD *)(v125 + 4 * v420);
  v449 = *(_DWORD *)(v125 + 4 * (BYTE1(*(_DWORD *)(v54 - 168)) ^ 0xD6u));
  v573 = *(_DWORD *)(v125 + 4 * v572);
  v478 = *(_DWORD *)(v125 + 4 * (BYTE1(*(_DWORD *)(v54 - 184)) ^ 0xD7u));
  LODWORD(v129) = *(_DWORD *)(v54 - 192);
  LODWORD(v73) = *(_DWORD *)(v125 + 4 * v389);
  v385 = *(_DWORD *)(v125 + 4 * v411);
  v386 = *(_DWORD *)(v125 + 4 * (BYTE1(v129) ^ 0x47u));
  *(_DWORD *)(v54 - 184) = *(_DWORD *)(v125 + 4 * v497);
  *(_DWORD *)(v54 - 192) = *(_DWORD *)(v125 + 4 * v556);
  v387 = *(_DWORD *)(v125 + 4 * (BYTE1(v551) ^ 0x77u));
  v510 = *(_DWORD *)(v125 + 4 * (BYTE1(v509) ^ 0xB2u));
  *(_DWORD *)(v54 - 232) = *(_DWORD *)(v125 + 4 * (*(_DWORD *)(v54 - 232) ^ 0x84u));
  v498 = *(_DWORD *)(v125 + 4 * (v178 ^ 0x2Eu));
  v191 = *(_DWORD *)(v125 + 4 * (BYTE1(*(_DWORD *)(v54 - 248)) ^ 0xC8u));
  v412 = v188 + 2101780143 + (~(2 * v188) | 0x572C2A3);
  *(_DWORD *)(v54 - 152) = *(_DWORD *)&v127[4 * (HIBYTE(v546) ^ 0xEF)];
  *(_DWORD *)(v54 - 168) = v540 + 2101780142;
  v541 = v535 + 2101780142;
  *(_DWORD *)(v54 - 216) = *(_DWORD *)&v127[4 * (*(_DWORD *)(v54 - 216) ^ 7)];
  *(_DWORD *)(v54 - 248) = v493 + 2101780142;
  v390 = v486 + 2101780142;
  v421 = v480 + 2101780142;
  v536 = v468 + 2101780142;
  v381 = v451 + 2101780142;
  v382 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v54 - 160)) ^ 0xD3)];
  v383 = *(_DWORD *)&v127[4 * v190];
  v388 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v54 - 128)) ^ 0xB8)];
  v452 = *(_DWORD *)&v127[4 * HIBYTE(v445)];
  v446 = v418 + 2101780142;
  v494 = v435 + 2101780142;
  v436 = v431 + 2101780142;
  LODWORD(v75) = v399 + 2101780142;
  v547 = v427 + 2101780142;
  v481 = v520 + 2101780142;
  v469 = v513 + 2101780142;
  v521 = (_DWORD)v77 - ((2 * (_DWORD)v77) & 0xFA8D3D5C) + 2101780142;
  v487 = v182 - ((2 * v182) & 0xFA8D3D5C) + 2101780142;
  v459 = *(_DWORD *)&v127[4 * (v458 ^ 0x4B)];
  v432 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v54 - 136)) ^ 0x41)];
  v419 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v54 - 176)) ^ 0xE8)];
  v192 = *(_DWORD *)&v127[4 * (BYTE3(v129) ^ 0x12)];
  v193 = *(_DWORD *)&v127[4 * HIBYTE(v395)];
  *(_DWORD *)(v54 - 224) = *(_DWORD *)&v127[4 * (*(_DWORD *)(v54 - 224) ^ 0xAA)];
  v194 = *(_DWORD *)&v127[4 * ((v551 ^ 0x231B9DB5) >> 24)];
  v514 = *(_DWORD *)&v127[4 * v380];
  v195 = *(_DWORD *)&v127[4 * ((v553 ^ 0xEEA2BFA8) >> 24)];
  v400 = *(_DWORD *)&v127[4 * v72];
  v396 = *(_DWORD *)&v127[4 * v185];
  *(_DWORD *)(v54 - 160) = v549 + 694673388;
  v428 = v504 + 694673388;
  v196 = v474 + 694673388;
  v197 = v455 + 694673388;
  *(_DWORD *)(v54 - 176) = v424 + 694673388;
  v456 = v465 + 694673388;
  v475 = v533 + 694673388;
  v198 = v189 + 694673388;
  v199 = (v191 ^ (v186 - ((2 * v186) & 0xFA8D3D5C) + 2101780142))
       - ((2 * (v191 ^ (v186 - ((2 * v186) & 0xFA8D3D5C) + 2101780142))) & 0x52CFBFD8)
       + 694673388;
  v200 = v570 ^ v569 ^ 0x6285F181;
  v201 = v75 ^ v73 ^ v200;
  v202 = (char *)*(&off_10005BF50 + v558 - 121) - 8;
  v203 = (uint64_t)*(&off_10005BF50 + (v558 ^ 0xB1));
  v204 = (char *)*(&off_10005BF50 + v558 + 18) - 12;
  v205 = (char *)*(&off_10005BF50 + v558 + 43) - 12;
  v206 = (*(unsigned __int8 *)(v203 + (*(unsigned __int8 *)(v54 - 109) ^ 0x41)) ^ 0x67) & 0xFF00FFFF | (((v204[*(unsigned __int8 *)(v54 - 111) ^ 0x40] + 38) ^ 0x5A) << 16) | ((v205[*(unsigned __int8 *)(v54 - 110) ^ 0xBBLL] ^ 0x9F) << 8) | ((v202[*(unsigned __int8 *)(v54 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v54 - 112) - ((2 * *(unsigned __int8 *)(v54 - 112)) & 0x9C) - 50) ^ 0x84) << 24);
  v557 = v203;
  v559 = v202;
  v552 = v205;
  v554 = v204;
  v207 = (*(unsigned __int8 *)(v203 + (*(unsigned __int8 *)(v54 - 105) ^ 0xE4)) ^ 0x51) & 0xFF00FFFF | ((v202[*(unsigned __int8 *)(v54 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v54 - 108) - ((2 * *(unsigned __int8 *)(v54 - 108)) & 0x9C) - 50) ^ 0xFFFFFFE1) << 24) | (((v204[*(unsigned __int8 *)(v54 - 107) ^ 0x27] + 38) ^ 0x96) << 16) | ((v205[*(unsigned __int8 *)(v54 - 106) ^ 9] ^ 0x9A) << 8);
  v208 = (*(unsigned __int8 *)(v203 + (*(unsigned __int8 *)(v54 - 101) ^ 0xF2)) ^ 0xE8) & 0xFF00FFFF | ((v202[*(unsigned __int8 *)(v54 - 104) ^ 0xD3] ^ (*(unsigned __int8 *)(v54 - 104) - ((2 * *(unsigned __int8 *)(v54 - 104)) & 0x9C) - 50) ^ 0xE0) << 24) | ((v205[*(unsigned __int8 *)(v54 - 102) ^ 0xBELL] ^ 0x3D) << 8) & 0xFF00FFFF | (((v204[*(unsigned __int8 *)(v54 - 103) ^ 0xE9] + 38) ^ 0x8A) << 16);
  v209 = v201 ^ 0x2497E332;
  if ((v201 & 0x80) != 0)
    v210 = -128;
  else
    v210 = 128;
  *(_DWORD *)(v54 - 128) = (*(unsigned __int8 *)(v203 + (*(unsigned __int8 *)(v54 - 97) ^ 0x74)) ^ 0xC0 | (((v204[*(unsigned __int8 *)(v54 - 99) ^ 0xF3] + 38) ^ 2) << 16) | ((v205[*(unsigned __int8 *)(v54 - 98) ^ 0x20] ^ 0x75) << 8) | ((v202[*(unsigned __int8 *)(v54 - 100) ^ 0xF3] ^ (*(unsigned __int8 *)(v54 - 100) - ((2 * *(unsigned __int8 *)(v54 - 100)) & 0x9C) - 50) ^ 0x85) << 24)) ^ 0xAF87950C;
  *(_DWORD *)(v54 - 132) = v206 ^ 0xA8FEE930;
  *(_DWORD *)(v54 - 140) = v207 ^ 0x6D534EEF;
  *(_DWORD *)(v54 - 136) = v208 ^ 0x7FA6D1A;
  v550 = v547 ^ v385;
  v548 = v192 ^ v443 ^ v386 ^ v539 ^ v544;
  v545 = (v416 + 694673388) ^ v193;
  v542 = v541 ^ v530;
  v537 = v536 ^ v392 ^ v507;
  v534 = v196 ^ v383 ^ v527;
  v531 = v197 ^ v382;
  v528 = v387 ^ v581 ^ v194 ^ v393 ^ v517;
  v525 = v510 ^ v484 ^ v524 ^ v521;
  v522 = (v181 - ((2 * v181) & 0x52CFBFD8) + 694673388) ^ v195;
  v518 = (v179 - ((2 * v179) & 0x52CFBFD8) + 694673388) ^ v514;
  v515 = v436 ^ v478;
  v511 = v419 ^ v472 ^ v439 ^ (v397 + 694673388);
  v508 = (v414 + 694673388) ^ v432;
  v505 = v501 ^ v573 ^ v494;
  v502 = v490 ^ v396 ^ v199;
  v495 = v198 ^ v400;
  v491 = *(_DWORD *)(v54 - 232) ^ v587 ^ v589 ^ v487;
  v488 = v475 ^ *(_DWORD *)(v54 - 224);
  v485 = *(_DWORD *)(v54 - 184) ^ v481;
  v482 = v469 ^ *(_DWORD *)(v54 - 192);
  v476 = *(_DWORD *)(v54 - 248) ^ v579 ^ v402;
  v470 = v405 ^ *(_DWORD *)(v54 - 216) ^ v428;
  v466 = v446 ^ v449;
  v463 = v585 ^ v388 ^ *(_DWORD *)(v54 - 256) ^ v462 ^ v406;
  v460 = v456 ^ v459;
  v457 = *(_DWORD *)(v54 - 176) ^ v452;
  v453 = *(_DWORD *)(v54 - 208) - 2004726270;
  v450 = (v210 + v209) ^ v200;
  v447 = *(_DWORD *)(v54 - 168) ^ *(_DWORD *)(v54 - 240) ^ v575;
  v444 = *(_DWORD *)(v54 - 152) ^ v583 ^ *(_DWORD *)(v54 - 200) ^ *(_DWORD *)(v54 - 160);
  v211 = *(_DWORD *)(v54 - 120);
  v440 = v211 ^ 0x38E;
  v437 = v211 ^ 0x360;
  v433 = v211 ^ 0x33C;
  v429 = v211 ^ 0x352;
  v425 = v211 ^ 0x33A;
  v212 = v211;
  *(_QWORD *)(v54 - 184) = 13;
  v213 = v204[a1[13] ^ 0xF3];
  *(_QWORD *)(v54 - 152) = 1;
  v214 = ((v211 - 62 + v213 - 125) ^ 2) << 16;
  v215 = a1[1] ^ 0x57;
  *(_QWORD *)(v54 - 160) = 10;
  v216 = a1[10] ^ 0xB6;
  LODWORD(v215) = ((v554[v215] + 38) ^ 0xF6) << 16;
  *(_QWORD *)(v54 - 192) = 4;
  v217 = (v205[v216] ^ 0x10) << 8;
  v218 = a1[4];
  v219 = v559[v218 ^ 0x9A];
  *(_QWORD *)(v54 - 224) = 7;
  LODWORD(v218) = v219 ^ (v218 - ((2 * v218) & 0x9C) - 50) ^ 0xFFFFFFCF;
  v220 = a1[7] ^ 0xD6;
  *(_QWORD *)(v54 - 216) = 2;
  LODWORD(v218) = *(unsigned __int8 *)(v557 + v220) ^ 2 | ((_DWORD)v218 << 24);
  LODWORD(v220) = v205[a1[2]] ^ 2;
  *(_QWORD *)(v54 - 176) = 3;
  v221 = *(unsigned __int8 *)(v557 + (a1[3] ^ 0x74));
  *(_QWORD *)(v54 - 168) = 12;
  LODWORD(v215) = v215 | ((_DWORD)v220 << 8) | v221 ^ 0xC0;
  LODWORD(v220) = v559[a1[12] ^ 0x6ELL] ^ (a1[12] - ((2 * a1[12]) & 0x9C) - 50) ^ 0x51;
  *(_QWORD *)(v54 - 208) = 0;
  v222 = *a1;
  v223 = v559[v222 ^ 0x15];
  *(_QWORD *)(v54 - 256) = 8;
  v224 = v215 | ((v223 ^ ((_DWORD)v222 + (~(2 * (_DWORD)v222) | 0x63) - 49) ^ 0xAE) << 24);
  LODWORD(v215) = v217 | ((v559[a1[8] ^ 0x46] ^ (a1[8] - ((2 * a1[8]) & 0x9C) - 50) ^ 0xFFFFFFE7) << 24);
  *(_QWORD *)(v54 - 200) = 14;
  v225 = v205[a1[14] ^ 0xD5] ^ 0x8A;
  v226 = (v225 << 8) - 410856391 - ((v225 << 9) & 0x1A800);
  LODWORD(v220) = ((v214 | ((_DWORD)v220 << 24)) ^ 0x5DFF77EF)
                - 1577023471
                + ((2 * (v214 | ((_DWORD)v220 << 24))) & 0xBBFE0000);
  LODWORD(v222) = (v220 - (v226 ^ 0xE782D439 | v220)) ^ ((v226 ^ 0x187D2BC6) + 1);
  LODWORD(v220) = ((v222 - 410856391 - ((2 * v222) & 0xCF05A872)) ^ v226) + v220;
  *(_QWORD *)(v54 - 248) = 11;
  *(_QWORD *)(v54 - 240) = 5;
  LODWORD(v218) = v218 & 0xFF00FFFF | (((v554[a1[5] ^ 0x9DLL] + 38) ^ 0xF7) << 16);
  v227 = *(unsigned __int8 *)(v557 + (a1[11] ^ 0xC2)) ^ 0xE5 | v215;
  LOBYTE(v215) = (v554[a1[9] ^ 0x3ELL] + 38) ^ 0xDF;
  v228 = a1[6] ^ 0xA4;
  *(_QWORD *)(v54 - 232) = 15;
  v229 = v552[v228];
  v230 = a1[15];
  v231 = v218 | ((v229 ^ 0xDA) << 8);
  v232 = *(unsigned __int8 *)(v557 + (v230 ^ 0x47)) ^ v220;
  v233 = (char *)*(&off_10005BF50 + v440) - 12;
  LODWORD(v220) = *(_DWORD *)&v233[4 * (((unsigned __int16)(v231 ^ v562) >> 8) ^ 0x21)] ^ ((((unsigned __int16)(v231 ^ v562) >> 8) ^ 0x4C) - 379062123 - ((2 * (((v231 ^ v562) >> 8) ^ 0xB71C4C)) & 0x12A));
  v234 = (char *)*(&off_10005BF50 + v212 - 797) - 8;
  LODWORD(v230) = (v220 + 525950429 - ((2 * v220) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4
                                                                                  * ((v224 ^ v563) ^ 0xAA)];
  v235 = v560 ^ v232 ^ 0xC0;
  v236 = ((BYTE1(v235) ^ 0xDF) - 379062123 - ((2 * ((v235 >> 8) ^ 0x2BCDDF)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v235) ^ 0xB2)];
  v582 = v227 & 0xFF00FFFF | (v215 << 16);
  v237 = (char *)*(&off_10005BF50 + v212 - 802) - 8;
  LODWORD(v220) = *(_DWORD *)&v237[4 * (((v582 ^ v561) >> 16) ^ 0x68)];
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  LODWORD(v220) = v238 >> 12;
  v239 = *(_DWORD *)&v237[4 * ((v224 ^ v563) >> 16)];
  HIDWORD(v238) = v239 ^ 0x502;
  LODWORD(v238) = v239 ^ 0xB01A000;
  v240 = v230 - 1718228156 - ((2 * v230) & 0x332BD688);
  v241 = (char *)*(&off_10005BF50 + v212 - 927) - 4;
  v242 = *(_DWORD *)&v241[4 * (((v231 ^ v562) >> 24) ^ 0xB7)] ^ (v238 >> 12);
  v243 = *(_DWORD *)&v237[4 * (BYTE2(v235) ^ 0xCD)];
  HIDWORD(v238) = v243 ^ 0x502;
  LODWORD(v238) = v243 ^ 0xB01A000;
  v244 = (v236 - 1718228156 - ((2 * v236) & 0x332BD688)) ^ v242;
  v245 = ((unsigned __int16)(v227 ^ v561) >> 8) ^ *(_DWORD *)&v234[4
                                                                                  * ((v231 ^ v562) ^ 0xFB)] ^ *(_DWORD *)&v233[4 * (((unsigned __int16)(v227 ^ v561) >> 8) ^ 0x23)] ^ (v238 >> 12);
  LODWORD(v215) = *(_DWORD *)&v237[4 * (((v231 ^ v562) >> 16) ^ 0x1C)];
  HIDWORD(v238) = v215 ^ 0x502;
  LODWORD(v238) = v215 ^ 0xB01A000;
  LODWORD(v215) = *(_DWORD *)&v241[4 * (((v582 ^ v561) >> 24) ^ 0xF6)] ^ ((((unsigned __int16)(v224 ^ v563) >> 8) ^ 0x32)
                                                                        - 379062123
                                                                        - 2
                                                                        * ((((v224 ^ v563) >> 8) ^ 0x730032) & 0x9D ^ ((v224 ^ v563) >> 8) & 8)) ^ *(_DWORD *)&v233[4 * (((unsigned __int16)(v224 ^ v563) >> 8) ^ 0x5F)] ^ ((v238 >> 12) - 1718228156 - ((2 * (v238 >> 12)) & 0x332BD688));
  v246 = v550 ^ v220 ^ v240 ^ *(_DWORD *)&v241[4 * (HIBYTE(v235) ^ 0x2B)];
  v247 = v548 ^ (v215 + 525950429 - ((2 * v215) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v235 ^ 0x94)];
  v248 = v545 ^ *(_DWORD *)&v234[4 * ((v582 ^ v561) ^ 0x5F)] ^ (v244
                                                                               + 525950429
                                                                               - ((2 * v244) & 0x3EB2BBBA));
  LODWORD(v215) = v450 ^ *(_DWORD *)&v241[4 * (((v224 ^ v563) >> 24) ^ 0x73)] ^ ((v245 ^ 0xF63EA506)
                                                                               - 1718228155
                                                                               + ((2
                                                                                 * ((v245 ^ 0xF63EA506) & 0x1995EB47 ^ v245 & 3)) ^ 0xFFFFFFFB));
  v249 = *(_DWORD *)&v237[4 * (BYTE2(v246) ^ 0x38)];
  HIDWORD(v238) = v249 ^ 0x502;
  LODWORD(v238) = v249 ^ 0xB01A000;
  v250 = v238 >> 12;
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v247) ^ 0x59)];
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  v251 = v238 >> 12;
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v248) ^ 0x66)];
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  v252 = (v238 >> 12) ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 5)] ^ ((BYTE1(v215) ^ 0x68)
                                                                 - 379062123
                                                                 - ((v215 >> 7) & 0x12A));
  v253 = (v250 + 525950429 - ((2 * v250) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4
                                                                         * ((v545 ^ v234[4 * ((v582 ^ v561) ^ 0x5F)] ^ (v244 - 35 - ((2 * v244) & 0xBA))) ^ 0xB6)];
  v254 = (v252 + 525950429 - ((2 * v252) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v246 ^ 0x61)];
  v255 = ((BYTE1(v246) ^ 0x8C) - 379062123 - 2 * (((v246 >> 8) ^ 0xF9388C) & 0x97 ^ (v246 >> 8) & 2)) ^ 0xD678EAEF ^ *(_DWORD *)&v233[4 * (BYTE1(v246) ^ 0xE1)];
  v256 = *(_DWORD *)&v241[4 * (HIBYTE(v248) ^ 0x43)] ^ 0x3B8FB0FA;
  v257 = v255 + v256 - 2 * (v255 & v256);
  v258 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 0xBD)];
  HIDWORD(v238) = v258 ^ 0x502;
  LODWORD(v238) = v258 ^ 0xB01A000;
  v259 = *(_DWORD *)&v241[4 * (HIBYTE(v246) ^ 0xF9)] ^ (v251 - 1718228156 - ((2 * v251) & 0x332BD688));
  v260 = (v259 + 525950429 - ((2 * v259) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v215 ^ 0xAB)];
  v261 = *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0x42)] ^ v570 ^ *(_DWORD *)&v233[4 * (BYTE1(v247) ^ 0xB7)] ^ ((BYTE1(v247) ^ 0xDA) - 379062123 - ((2 * ((v247 >> 8) ^ 0x8159DA)) & 0x12A)) ^ (v253 - 1718228156 - ((2 * v253) & 0x332BD688));
  LOBYTE(v246) = BYTE1(v248) ^ 0x54;
  v262 = v447 ^ *(_DWORD *)&v233[4 * (BYTE1(v248) ^ 0x39)] ^ (v260 - 379062123 - ((2 * v260) & 0xD2CFF12A));
  LODWORD(v215) = v444 ^ *(_DWORD *)&v234[4 * (v247 ^ 0x2A)] ^ ((v257 ^ (v238 >> 12))
                                                                               + 525950429
                                                                               - ((2 * (v257 ^ (v238 >> 12))) & 0x3EB2BBBA));
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 0x79)];
  v263 = v542 ^ *(_DWORD *)&v241[4 * (HIBYTE(v247) ^ 0x81)] ^ (v254 - 1718228156 - ((2 * v254) & 0x332BD688));
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  LODWORD(v220) = ((v238 >> 12) - 1718228155 + ~((2 * (v238 >> 12)) & 0x332BD688)) ^ *(_DWORD *)&v241[4 * (HIBYTE(v263) ^ 0x22)];
  v264 = ((BYTE1(v215) ^ 0xD0)
        - 379062123
        - 2 * (((v215 >> 8) ^ 0x679D0) & 0x97 ^ (v215 >> 8) & 2)) ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 0xBD)];
  v265 = (v264 + 525950429 - ((2 * v264) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v261 ^ 0x76)];
  v266 = ((BYTE1(v262) ^ 0xEC) - 379062123 - ((2 * ((v262 >> 8) ^ 0xE5FEC)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v262) ^ 0x81)];
  v267 = *(_DWORD *)&v237[4 * (BYTE2(v262) ^ 0x5F)];
  HIDWORD(v238) = v267 ^ 0x502;
  LODWORD(v238) = v267 ^ 0xB01A000;
  v268 = v238 >> 12;
  HIDWORD(v238) = *(_DWORD *)&v234[4 * (v263 ^ 0x5E)] ^ 0xF64E7A55;
  LODWORD(v238) = HIDWORD(v238);
  v269 = (v238 >> 28) ^ __ROR4__(*(_DWORD *)&v241[4 * (BYTE3(v215) ^ 6)] ^ 0x7462B151 ^ (v266- 1718228156- ((2 * v266) & 0x332BD688)), 28);
  v270 = (v268 - 1718228156 - ((2 * v268) & 0x332BD688)) ^ *(_DWORD *)&v241[4 * (HIBYTE(v261) ^ 0xD2)];
  LODWORD(v215) = (v270 + 525950429 - ((2 * v270) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v215 ^ 0x4C)];
  v271 = *(_DWORD *)&v237[4 * (BYTE2(v263) ^ 0x1B)];
  HIDWORD(v238) = v271 ^ 0x502;
  LODWORD(v238) = v271 ^ 0xB01A000;
  v272 = v238 >> 12;
  v273 = ((v261 >> 8) ^ 0xD2CCC0) & 0x9F ^ (v261 >> 8) & 0xA;
  v274 = BYTE1(v261) ^ 0xC0;
  v275 = *(_DWORD *)&v237[4 * (BYTE2(v261) ^ 0xCC)];
  HIDWORD(v238) = v275 ^ 0x502;
  LODWORD(v238) = v275 ^ 0xB01A000;
  v276 = v381 ^ v391 ^ (v238 >> 12) ^ __ROR4__(v269 ^ 0x78071371, 4);
  LOBYTE(v269) = v262 ^ v246;
  v277 = v537 ^ *(_DWORD *)&v241[4 * (HIBYTE(v262) ^ 0xE)] ^ v272 ^ (v265 - 1718228156 - ((2 * v265) & 0x332BD688));
  v278 = v534 ^ *(_DWORD *)&v233[4 * (BYTE1(v263) ^ 5)] ^ (v215 - 379062123 - ((2 * v215) & 0xD2CFF12A));
  LODWORD(v215) = v531 ^ (v274 - 379062123 - 2 * v273) ^ *(_DWORD *)&v234[4 * (v269 ^ 0xCA)] ^ *(_DWORD *)&v233[4 * (v274 ^ 0x6D)] ^ (v220 + 525950429 - ((2 * v220) & 0x3EB2BBBA));
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v278) ^ 0x52)];
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  LODWORD(v220) = v238 >> 12;
  v279 = *(_DWORD *)&v237[4 * (BYTE2(v276) ^ 0xFE)];
  HIDWORD(v238) = v279 ^ 0x502;
  LODWORD(v238) = v279 ^ 0xB01A000;
  v280 = *(_DWORD *)&v233[4 * (BYTE1(v278) ^ 0xF8)] ^ *(_DWORD *)&v234[4 * (v277 ^ 0x72)] ^ ((BYTE1(v278) ^ 0x95) - 379062123 - 2 * (((v278 >> 8) ^ 0x455295) & 0x97 ^ (v278 >> 8) & 2)) ^ ((v238 >> 12) + 525950429 - ((2 * (v238 >> 12)) & 0x3EB2BBBA));
  v281 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 2)];
  HIDWORD(v238) = v281 ^ 0x502;
  LODWORD(v238) = v281 ^ 0xB01A000;
  v282 = *(_DWORD *)&v234[4 * ((v278 ^ BYTE1(v263)) ^ 0x54)] ^ *(_DWORD *)&v241[4
                                                                                               * (HIBYTE(v277) ^ 0xA7)] ^ 0x86CCB699 ^ (v238 >> 12);
  v283 = *(_DWORD *)&v237[4 * (BYTE2(v277) ^ 0x3B)];
  HIDWORD(v238) = v283 ^ 0x502;
  LODWORD(v238) = v283 ^ 0xB01A000;
  v284 = v528 ^ *(_DWORD *)&v234[4 * (v276 ^ 0x1E)] ^ *(_DWORD *)&v241[4 * (HIBYTE(v278) ^ 0x61)] ^ ((BYTE1(v215) ^ 0xD9) - 379062123 - 2 * (((v215 >> 8) ^ 0x9802D9) & 0x97 ^ (v215 >> 8) & 2)) ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 0xB4)] ^ (v238 >> 12);
  v285 = v525 ^ *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0x98)] ^ (v280 - 1718228156 - ((2 * v280) & 0x332BD688));
  v286 = v522 ^ *(_DWORD *)&v241[4 * (HIBYTE(v276) ^ 0x99)] ^ *(_DWORD *)&v234[4 * (v215 ^ 0x3D)] ^ ((BYTE1(v277) ^ 0x29) - 379062123 - 2 * (((v277 >> 8) ^ 0xA73B29) & 0x97 ^ (v277 >> 8) & 2));
  LODWORD(v215) = *(_DWORD *)&v237[4 * (BYTE2(v284) ^ 0xB)];
  HIDWORD(v238) = v215 ^ 0x502;
  LODWORD(v238) = v215 ^ 0xB01A000;
  v287 = v238 >> 12;
  v288 = v286 ^ v220 ^ *(_DWORD *)&v233[4 * (BYTE1(v277) ^ 0x44)];
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v288) ^ 0x24)];
  LODWORD(v215) = v518 ^ *(_DWORD *)&v233[4 * (BYTE1(v276) ^ 0x8A)] ^ (v282 - 379062123 - ((2 * v282) & 0xD2CFF12A));
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  LODWORD(v220) = BYTE1(v288) ^ 0x49;
  v289 = v220 - 379062123 - ((2 * ((v288 >> 8) ^ 0x532449)) & 0x12A);
  v290 = *(_DWORD *)&v234[4 * ((v215 ^ BYTE1(v276)) ^ 0xA6)] ^ ((BYTE1(v284) ^ 0x6F)
                                                                               - 379062123
                                                                               - ((2 * ((v284 >> 8) ^ 0x44716F)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v284) ^ 2)] ^ ((v238 >> 12) + 525950429 - ((2 * (v238 >> 12)) & 0x3EB2BBBA));
  v291 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 0x81)];
  HIDWORD(v238) = v291 ^ 0x502;
  LODWORD(v238) = v291 ^ 0xB01A000;
  v292 = ((v238 >> 12) - 1718228156 - ((2 * (v238 >> 12)) & 0x332BD688)) ^ *(_DWORD *)&v241[4 * (HIBYTE(v284) ^ 0x44)];
  v293 = (v292 + 525950429 - ((2 * v292) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v288 ^ 0x9C)];
  v294 = ((BYTE1(v215) ^ 0xA0) - 379062123 - ((2 * ((v215 >> 8) ^ 0x6881A0)) & 0x12A)) ^ (v287 + 525950429 - ((2 * v287) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v285 ^ 0xFC)] ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 0xCD)];
  v295 = *(_DWORD *)&v237[4 * (BYTE2(v285) ^ 0xC6)];
  LODWORD(v238) = __ROR4__((v295 >> 12) ^ 0x26D6D38, 17) ^ 0xEE910136;
  HIDWORD(v238) = v238;
  v296 = (v238 >> 15) + (v295 << 20);
  v297 = v515 ^ *(_DWORD *)&v233[4 * (BYTE1(v285) ^ 0x75)] ^ (v293 - 379062123 - ((2 * v293) & 0xD2CFF12A));
  v298 = v511 ^ *(_DWORD *)&v241[4 * (HIBYTE(v288) ^ 0x53)] ^ (v294 - 1718228156 - ((2 * v294) & 0x332BD688));
  v299 = *(_DWORD *)&v234[4 * (v284 ^ 0x7B)];
  v300 = v508 ^ *(_DWORD *)&v241[4 * (HIBYTE(v285) ^ 0x5A)] ^ (v290 - 1718228156 - ((2 * v290) & 0x332BD688));
  LODWORD(v215) = v505 ^ v289 ^ v299 ^ *(_DWORD *)&v233[4 * (v220 ^ 0x6D)] ^ *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0x68)] ^ v296;
  v301 = ((BYTE1(v297) ^ 0x9D) - 379062123 - ((2 * ((v297 >> 8) ^ 0xC2489D)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v297) ^ 0xF0)];
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v298) ^ 0x8F)];
  v302 = *(_DWORD *)&v234[4 * (v215 ^ 0x13)] ^ ((_DWORD)v220 << 20) ^ (v220 >> 12) ^ 0x5020B01A ^ (v301 + 525950429 - ((2 * v301) & 0x3EB2BBBA));
  v303 = *(_DWORD *)&v237[4 * (BYTE2(v300) ^ 0xB8)];
  HIDWORD(v238) = v303 ^ 0x502;
  LODWORD(v238) = v303 ^ 0xB01A000;
  v304 = ((v238 >> 12) + 525950429 - ((2 * (v238 >> 12)) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4
                                                                                         * ((v297 ^ BYTE1(v285)) ^ 0x3F)];
  LODWORD(v220) = v302 - 1718228156 - ((2 * v302) & 0x332BD688);
  v305 = *(_DWORD *)&v237[4 * (BYTE2(v297) ^ 0x48)];
  HIDWORD(v238) = v305 ^ 0x502;
  LODWORD(v238) = v305 ^ 0xB01A000;
  v306 = ((BYTE1(v215) ^ 0xD6) - 379062123 - ((2 * ((v215 >> 8) ^ 0xF067D6)) & 0x12A)) ^ *(_DWORD *)&v234[4 * (v300 ^ 0xCC)] ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 0xBB)] ^ ((v238 >> 12) + 525950429 - ((2 * (v238 >> 12)) & 0x3EB2BBBA));
  v307 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 0x67)];
  HIDWORD(v238) = v307 ^ 0x502;
  LODWORD(v238) = v307 ^ 0xB01A000;
  v308 = v502 ^ ((BYTE1(v300) ^ 0xD7) - 379062123 - 2 * (((v300 >> 8) ^ 0xCFB8D7) & 0x9D ^ (v300 >> 8) & 8)) ^ *(_DWORD *)&v234[4 * (v298 ^ 0x50)] ^ *(_DWORD *)&v233[4 * (BYTE1(v300) ^ 0xBA)] ^ (v238 >> 12) ^ *(_DWORD *)&v241[4 * (HIBYTE(v297) ^ 0xC2)];
  v309 = HIBYTE(v300) ^ 0xCF;
  v310 = v412 ^ v498 ^ *(_DWORD *)&v241[4 * (HIBYTE(v298) ^ 0xC7)] ^ (v306 - 1718228156 - ((2 * v306) & 0x332BD688));
  v311 = v495 ^ *(_DWORD *)&v241[4 * v309] ^ v220;
  LODWORD(v215) = v491 ^ ((BYTE1(v298) ^ 0xD9) - 379062123 - ((2 * ((v298 >> 8) ^ 0xC78FD9)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v298) ^ 0xB4)] ^ *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0xF0)] ^ (v304 - 1718228156 - ((2 * v304) & 0x332BD688));
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v310) ^ 0xE6)];
  HIDWORD(v238) = v220 ^ 0x502;
  LODWORD(v238) = v220 ^ 0xB01A000;
  LODWORD(v220) = v238 >> 12;
  v312 = *(_DWORD *)&v237[4 * (BYTE2(v311) ^ 0x1C)];
  v313 = ((BYTE1(v215) ^ 0xCC) - 379062123 - ((2 * ((v215 >> 8) ^ 0x33C8CC)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 0xA1)];
  HIDWORD(v238) = v312 ^ 0x502;
  LODWORD(v238) = v312 ^ 0xB01A000;
  v314 = (v238 >> 12) ^ *(_DWORD *)&v233[4 * (BYTE1(v310) ^ 0xD9)] ^ ((BYTE1(v310) ^ 0xB4)
                                                                    - 379062123
                                                                    - 2
                                                                    * (((v310 >> 8) ^ 0x4FE6B4) & 0x97 ^ (v310 >> 8) & 2));
  v315 = (v314 + 525950429 - ((2 * v314) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v308 ^ 0x73)];
  v316 = (v313 + 525950429 - ((2 * v313) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v311 ^ 0x3A)];
  LODWORD(v220) = *(_DWORD *)&v234[4 * (v215 ^ 0xA2)] ^ ((BYTE1(v308) ^ 0xA2)
                                                                        - 379062123
                                                                        - ((2 * ((v308 >> 8) ^ 0x9FFFA2)) & 0x12A)) ^ *(_DWORD *)&v233[4 * (BYTE1(v308) ^ 0xCF)] ^ (v220 + 525950429 - ((2 * v220) & 0x3EB2BBBA));
  HIDWORD(v238) = *(_DWORD *)&v234[4 * (v310 ^ 0x96)] ^ 0x1F595DDD;
  LODWORD(v238) = *(_DWORD *)&v234[4 * (v310 ^ 0x96)];
  HIDWORD(v238) = (v238 >> 29) ^ 0x6615DA09;
  LODWORD(v238) = HIDWORD(v238);
  v317 = (v238 >> 3) - 379062123 - ((2 * (v238 >> 3)) & 0xD2CFF12A);
  v318 = *(_DWORD *)&v237[4 * ~HIWORD(v308)];
  HIDWORD(v238) = v318 ^ 0x502;
  LODWORD(v238) = v318 ^ 0xB01A000;
  v319 = v238 >> 12;
  v320 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 0xC8)];
  HIDWORD(v238) = v320 ^ 0x502;
  LODWORD(v238) = v320 ^ 0xB01A000;
  v321 = v488 ^ *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0x17)] ^ (v315 - 1718228156 - ((2 * v315) & 0x332BD688));
  v322 = v317 ^ *(_DWORD *)&v233[4 * (BYTE1(v311) ^ 0xD1)] ^ (v238 >> 12);
  LODWORD(v215) = v485 ^ *(_DWORD *)&v241[4 * (HIBYTE(v310) ^ 0x4F)] ^ v319 ^ (v316
                                                                             - 1718228156
                                                                             - ((2 * v316) & 0x332BD688));
  v323 = v482 ^ *(_DWORD *)&v241[4 * (HIBYTE(v311) ^ 0x1B)] ^ (v220 - 1718228156 - ((2 * v220) & 0x332BD688));
  v324 = *(_DWORD *)&v237[4 * (BYTE2(v323) ^ 0x7E)];
  HIDWORD(v238) = v324 ^ 0x502;
  LODWORD(v238) = v324 ^ 0xB01A000;
  v325 = v238 >> 12;
  v326 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 1)];
  HIDWORD(v238) = v326 ^ 0x502;
  LODWORD(v238) = v326 ^ 0xB01A000;
  LODWORD(v220) = *(_DWORD *)&v241[4 * (HIBYTE(v308) ^ 0xBB)] ^ v569 ^ (v322 - 1718228156 - ((2 * v322) & 0x332BD688));
  v327 = ((v238 >> 12) + 525950429 - ((2 * (v238 >> 12)) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4
                                                                                         * (v321 ^ 0xC6)];
  v328 = ((BYTE1(v321) ^ 0x71) - 379062123 - 2 * (((v321 >> 8) ^ 0xF25B71) & 0x9F ^ (v321 >> 8) & 0xA)) ^ *(_DWORD *)&v233[4 * (BYTE1(v321) ^ 0x1C)];
  v329 = (v328 - 1718228155 + ~((2 * v328) & 0x332BD688)) ^ *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0x1F)];
  v330 = *(_DWORD *)&v237[4 * (BYTE2(v321) ^ 0x5B)];
  HIDWORD(v238) = v330 ^ 0x502;
  LODWORD(v238) = v330 ^ 0xB01A000;
  v331 = v238 >> 12;
  v332 = *(_DWORD *)&v237[4 * (BYTE2(v220) ^ 0xF4)];
  HIDWORD(v238) = v332 ^ 0x502;
  LODWORD(v238) = v332 ^ 0xB01A000;
  v333 = v238 >> 12;
  HIDWORD(v238) = v325 ^ ((BYTE1(v215) ^ 0x81)
                        - 379062123
                        - 2 * (((v215 >> 8) ^ 0x1F0181) & 0x9D ^ (v215 >> 8) & 8)) ^ 0xD678EAEF ^ *(_DWORD *)&v233[4 * (BYTE1(v215) ^ 0xEC)];
  LODWORD(v238) = HIDWORD(v238);
  LODWORD(v238) = (v238 >> 11) ^ __ROR4__(*(_DWORD *)&v241[4 * (HIBYTE(v321) ^ 0xF2)] ^ 0x3B8FB0FA, 11) ^ 0xD490839A;
  HIDWORD(v238) = v238;
  LODWORD(v215) = v390 ^ v409 ^ *(_DWORD *)&v234[4 * (v215 ^ 0xB8)] ^ ((BYTE1(v323) ^ 0xAA)
                                                                                      - 379062123
                                                                                      - ((2 * ((v323 >> 8) ^ 0x967EAA)) & 0x12A)) ^ *(_DWORD *)&v241[4 * (BYTE3(v220) ^ 0x57)] ^ *(_DWORD *)&v233[4 * (BYTE1(v323) ^ 0xC7)] ^ v331;
  LOBYTE(v331) = v220 ^ BYTE1(v311);
  v334 = v476 ^ *(_DWORD *)&v241[4 * (HIBYTE(v323) ^ 0x96)] ^ ((BYTE1(v220) ^ 0xE0)
                                                             - 379062123
                                                             - 2
                                                             * (((v220 >> 8) ^ 0x73F4E0) & 0x9F ^ (v220 >> 8) & 0xA)) ^ *(_DWORD *)&v233[4 * (BYTE1(v220) ^ 0x8D)] ^ (v327 - 1718228156 - ((2 * v327) & 0x332BD688));
  v335 = v404 ^ v577 ^ v421 ^ *(_DWORD *)&v234[4 * (v323 ^ 0x88)] ^ v333 ^ (v329
                                                                                           + 525950429
                                                                                           - ((2 * v329) & 0x3EB2BBBA));
  LODWORD(v220) = v470 ^ *(_DWORD *)&v234[4 * (v331 ^ 0xAF)] ^ ((v238 >> 21)
                                                                               + 525950429
                                                                               - ((2 * (v238 >> 21)) & 0x3EB2BBBA));
  v336 = *(_DWORD *)&v237[4 * (BYTE2(v215) ^ 0x27)];
  HIDWORD(v238) = v336 ^ 0x502;
  LODWORD(v238) = v336 ^ 0xB01A000;
  v337 = v238 >> 12;
  v338 = *(_DWORD *)&v233[4 * (BYTE1(v334) ^ 0x96)] ^ ((BYTE1(v334) ^ 0xFB)
                                                     - 379062123
                                                     - ((2 * ((v334 >> 8) ^ 0x3EA2FB)) & 0x12A));
  v339 = *(_DWORD *)&v237[4 * (BYTE2(v334) ^ 0xA2)];
  v340 = (v338 + 525950429 - ((2 * v338) & 0x3EB2BBBA)) ^ *(_DWORD *)&v234[4 * (v335 ^ 0x75)];
  HIDWORD(v238) = v339 ^ 0x502;
  LODWORD(v238) = v339 ^ 0xB01A000;
  v341 = ((BYTE1(v335) ^ 0xF0) - 379062123 - 2 * (((v335 >> 8) ^ 0xB54AF0) & 0x9D ^ (v335 >> 8) & 8)) ^ (v238 >> 12) ^ *(_DWORD *)&v233[4 * (BYTE1(v335) ^ 0x9D)];
  v342 = (v341 - 1718228156 - ((2 * v341) & 0x332BD688)) ^ *(_DWORD *)&v241[4 * (BYTE3(v220) ^ 0xED)];
  v343 = *(_DWORD *)&v241[4 * (HIBYTE(v335) ^ 0x91)];
  v344 = *(_DWORD *)&v241[4 * (HIBYTE(v334) ^ 0x3E)];
  LODWORD(v241) = *(_DWORD *)&v241[4 * (BYTE3(v215) ^ 0x41)];
  v345 = BYTE1(v220) ^ 0x1D;
  v346 = v345 - 379062123 - 2 * (((v220 >> 8) ^ 0xC9AF1D) & 0x97 ^ (v220 >> 8) & 2);
  v347 = *(_DWORD *)&v234[4 * (v220 ^ 0x8F)];
  v348 = *(_DWORD *)&v234[4 * (v334 ^ 0x9A)];
  LODWORD(v234) = *(_DWORD *)&v234[4 * (v215 ^ 0xF6)];
  LODWORD(v220) = *(_DWORD *)&v237[4 * (BYTE2(v220) ^ 0xAF)];
  LODWORD(v237) = *(_DWORD *)&v237[4 * (BYTE2(v335) ^ 0x4A)];
  HIDWORD(v238) = v237 ^ 0x502;
  LODWORD(v238) = v237 ^ 0xB01A000;
  LODWORD(v215) = (v215 >> 8) ^ 0x412776;
  v349 = *(_DWORD *)&v233[4 * (v345 ^ 0x6D)];
  LODWORD(v233) = *(_DWORD *)&v233[4 * (v215 ^ 0x6D)];
  v350 = v215 - 379062123 - ((2 * v215) & 0x12A);
  LODWORD(v215) = v466 ^ v348 ^ v337 ^ v343 ^ v346 ^ v349;
  LODWORD(v233) = v463 ^ v350 ^ v344 ^ v233 ^ v347 ^ (v238 >> 12);
  v351 = v460 ^ v234 ^ (v342 + 525950429 - ((2 * v342) & 0x3EB2BBBA));
  LODWORD(v241) = v457 ^ v241 ^ (v220 >> 12) ^ ((_DWORD)v220 << 20) ^ (v340
                                                                                                 - 1718228156
                                                                                                 - ((2 * v340) & 0x332BD688));
  v352 = *(_DWORD *)(v54 - 120);
  v353 = (uint64_t)*(&off_10005BF50 + v352 - 803);
  BYTE1(v340) = BYTE1(v351) ^ 0x6F;
  v354 = (uint64_t)*(&off_10005BF50 + v437);
  v355 = *(_DWORD *)(v353 + 4 * (BYTE1(v241) ^ 0x93u)) ^ *(_DWORD *)(v354 + 4 * (v351 ^ 7u));
  v356 = (uint64_t)*(&off_10005BF50 + v433);
  v357 = *(_DWORD *)(v354 + 4 * (v215 ^ 0x45u)) ^ 0x626023B5 ^ *(_DWORD *)(v356
                                                                                            + 4
                                                                                            * (BYTE2(v351) ^ 0x2Au));
  v358 = (uint64_t)*(&off_10005BF50 + v352 - 843);
  LODWORD(v237) = *(_DWORD *)(v358 + 4 * (HIBYTE(v351) ^ 0xEF)) ^ *(_DWORD *)(v353 + 4 * (BYTE1(v215) ^ 0xC7u));
  v359 = ((v355 ^ 0xC7205B6C) - 1156302129 - 2 * ((v355 ^ 0xC7205B6C) & 0x3B143ADF ^ v355 & 0x10)) ^ *(_DWORD *)(v358 + 4 * ((v233 >> 24) ^ 0x2C));
  v360 = (v357 - 1156302129 - ((2 * v357) & 0x7628759E)) ^ *(_DWORD *)(v358 + 4 * ((v241 >> 24) ^ 0xCD));
  v361 = *(_DWORD *)(v356 + 4 * (BYTE2(v241) ^ 0x9Cu)) ^ 0xA54078D9 ^ *(_DWORD *)(v353 + 4 * BYTE1(v340));
  LODWORD(v353) = (v360 - ((2 * v360) & 0x16AD2C5E) + 190223919) ^ *(_DWORD *)(v353 + 4 * (BYTE1(v233) ^ 0xB2u));
  v362 = (v361 - 1156302129 - ((2 * v361) & 0x7628759E)) ^ *(_DWORD *)(v358 + 4 * (BYTE3(v215) ^ 0xB7));
  v363 = (v362 - 864629437 - ((2 * v362) & 0x98ED9A86)) ^ *(_DWORD *)(v354 + 4 * (v233 ^ 0xFCu));
  v364 = *(_DWORD *)(v356 + 4 * (BYTE2(v233) ^ 0x67u));
  v365 = *(_DWORD *)(v356 + 4 * (BYTE2(v215) ^ 0x47u)) ^ (v359 - 1374228746 - ((2 * v359) & 0x5C2DDDEC));
  v366 = *(_DWORD *)(v354 + 4 * (v241 ^ 0xC1u));
  LODWORD(v358) = *(_DWORD *)(v54 - 140) ^ v565 ^ (v363 - ((2 * v363) & 0xDFA398DA) - 271463315);
  v367 = *(_DWORD *)(v54 - 136) ^ v564 ^ (v365 - ((2 * v365) & 0xAF1DF30) - 2055671912);
  v368 = (char *)*(&off_10005BF50 + v352 - 823) - 12;
  LODWORD(v233) = *(_DWORD *)(v54 - 132) ^ v567 ^ (v353 - ((2 * v353) & 0x54F8D764) + 712797106);
  a1[*(_QWORD *)(v54 - 256)] = v368[HIBYTE(v367) ^ 0xD7] ^ 0xA2;
  v369 = (char *)*(&off_10005BF50 + v429) - 8;
  a1[*(_QWORD *)(v54 - 224)] = (v369[v358 ^ 0xC7] - 94) ^ 0x5F;
  v370 = (char *)*(&off_10005BF50 + v425) - 8;
  v371 = v370[BYTE1(v358) ^ 0x13];
  HIDWORD(v238) = v371 ^ 6;
  LODWORD(v238) = ~v371 << 24;
  a1[6] = (v238 >> 30) ^ 0x40;
  v372 = v370[BYTE1(v233)];
  HIDWORD(v238) = v372 ^ 6;
  LODWORD(v238) = ~v372 << 24;
  a1[*(_QWORD *)(v54 - 216)] = (v238 >> 30) ^ 0x7E;
  v373 = (uint64_t)*(&off_10005BF50 + v352 - 912);
  a1[9] = *(_BYTE *)(v373 + (BYTE2(v367) ^ 0xFBLL)) ^ 0x9A;
  v374 = ((v237 ^ 0xB042ACE0)
        - 1374228746
        - 2 * ((v237 ^ 0xB042ACE0) & 0x2E16EEFE ^ v237 & 8)) ^ v364;
  v375 = (v374 - 864629437 - ((2 * v374) & 0x98ED9A86)) ^ v366;
  v376 = *(_DWORD *)(v54 - 128) ^ v566 ^ (v375 - ((2 * v375) & 0x5A0A2E5A) + 755308333);
  a1[*(_QWORD *)(v54 - 184)] = *(_BYTE *)(v373 + (BYTE2(v376) ^ 0xB8)) ^ 0x49;
  a1[*(_QWORD *)(v54 - 248)] = (v369[v367 ^ 0x1BLL] - 94) ^ 0x7D;
  a1[*(_QWORD *)(v54 - 240)] = *(_BYTE *)(v373 + (BYTE2(v358) ^ 3)) ^ 0x37;
  a1[*(_QWORD *)(v54 - 192)] = v368[BYTE3(v358) ^ 0x6DLL] ^ 0x5A;
  LODWORD(v237) = v370[BYTE1(v367) ^ 0x92];
  HIDWORD(v238) = v237 ^ 6;
  LODWORD(v238) = ~(_DWORD)v237 << 24;
  a1[*(_QWORD *)(v54 - 160)] = (v238 >> 30) ^ 0xD2;
  v377 = *(_QWORD *)(v54 - 208);
  a1[v377] = v368[(v233 >> 24) ^ 0x53] ^ 0xB6;
  a1[*(_QWORD *)(v54 - 176)] = (v369[v233 ^ 0x95] - 94) ^ 0xAF;
  a1[*(_QWORD *)(v54 - 232)] = (v369[v376 ^ 0x64] - 94) ^ 0x27;
  a1[*(_QWORD *)(v54 - 168)] = v368[HIBYTE(v376) ^ 0x6ELL] ^ 0x20;
  v378 = v370[BYTE1(v376) ^ 0x1FLL];
  HIDWORD(v238) = v378 ^ 6;
  LODWORD(v238) = ~v378 << 24;
  a1[*(_QWORD *)(v54 - 200)] = (v238 >> 30) ^ 0x58;
  a1[*(_QWORD *)(v54 - 152)] = *(_BYTE *)(v373 + (BYTE2(v233) ^ 0xC8)) ^ 0x18;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a50
                                                      + 8
                                                      * ((1196
                                                        * ((((_DWORD)v377
                                                           + 732163552
                                                           - ((2 * (_DWORD)v377 + 32) & 0x5747DBC0)
                                                           + 16) ^ 0x2BA3EDE0u) < v453)) ^ (v352 - 506)))
                                          - 8))(3915905173);
}

void sub_100040234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,int a59,int a60,int a61,int a62)
{
  uint64_t v62;

  *(_DWORD *)(v62 - 128) = a59 ^ 0xF6374C01;
  *(_DWORD *)(v62 - 136) = a61 ^ 0x3E218E37;
  *(_DWORD *)(v62 - 132) = a62 ^ 0x5E6AA24A;
  *(_DWORD *)(v62 - 140) = a60 ^ 0x168D5371;
  JUMPOUT(0x10003E388);
}

uint64_t sub_100040288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,uint64_t a25,int a26,int a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,int a59)
{
  uint64_t v59;
  int v60;

  v60 = a24 - (((a59 ^ 0x742) + 486922135) & a27) + 392374548;
  return (*(uint64_t (**)(void))(v59
                              + 8
                              * ((463
                                * (((2 * v60) & 0xBA7FA6FE ^ 0x18058278) + (v60 ^ 0x53BD3EC3) + 2130673564 != 1547653915)) ^ a59)))();
}

uint64_t sub_10004034C(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((14 * (a1 + v2 + ((v1 - 1573) | 0x104) + (((v1 - 1471) | 0x320) ^ 0x22C028C3u) > 7)) | v1)))();
}

uint64_t sub_1000403D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (a3 ^ (866 * (a6 >> 4 == 231996728))))
                            - ((a3 + 642) ^ (a3 - 1307013122) & 0x4DE76FFFu ^ 0x2B0)))();
}

uint64_t sub_100040424@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W5>, unint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  int v23;

  v9 = (a1 + v7 + a2);
  v10 = v9 + a4 + 1;
  v11 = (a3 - 334) & (a1 + v7);
  v12 = v11 - v9;
  v13 = v4 + v12;
  ++v11;
  v14 = v4 + v11;
  v15 = v6 + v12;
  v16 = v6 + v11;
  v17 = v5 + v12;
  v18 = v5 + v11;
  v20 = v14 > a4 && v13 < v10;
  if (v16 > a4 && v15 < v10)
    v20 = 1;
  v23 = v18 > a4 && v17 < v10 || v20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a3 | (2 * v23))) - (a3 ^ 0x2BCu) + 981))();
}

uint64_t sub_1000404A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * ((507 * (((v6 < 0x10) ^ (a6 + 122)) & 1)) ^ (a6 + 925))))();
}

uint64_t sub_1000404DC@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  uint64_t v59;
  unsigned int v60;
  int8x16_t v61;
  int8x16_t v62;
  uint64_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16x4_t v68;
  int8x16x4_t v69;

  v60 = a3 & 0xAD6E33EF;
  *(_DWORD *)(v59 - 120) = v56 + 10;
  v68.val[1].i64[0] = ((_BYTE)v56 + 2) & 0xF;
  v68.val[1].i64[1] = ((_BYTE)v56 + 1) & 0xF;
  v68.val[2].i64[0] = v56 & 0xF;
  v68.val[2].i64[1] = ((_BYTE)v56 - 1) & 0xF;
  v68.val[3].i64[0] = ((_BYTE)v56 + 14) & 0xF;
  v68.val[3].i64[1] = ((_BYTE)v56 + 13) & 0xF;
  v69.val[0].i64[0] = ((_BYTE)v56 + 12) & 0xF;
  v69.val[0].i64[1] = ((_BYTE)v56 + 11) & 0xF;
  v69.val[1].i64[0] = *(_DWORD *)(v59 - 120) & 0xF;
  v69.val[1].i64[1] = ((_BYTE)v56 + 9) & 0xF;
  v69.val[2].i64[0] = ((_BYTE)v56 + 8) & 0xF;
  v69.val[2].i64[1] = ((_BYTE)v56 + 7) & 0xF;
  v69.val[3].i64[0] = ((_BYTE)v56 + 6) & 0xF;
  v69.val[3].i64[1] = (v56 + 5) & 0xF;
  v61.i64[0] = 0x505050505050505;
  v61.i64[1] = 0x505050505050505;
  v62.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v62.i64[1] = 0xE7E7E7E7E7E7E7E7;
  v63 = a2 + a1 + v57 - 1187 + ((v60 - 168082380) & 0xA04BCA7);
  v68.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)v57 + 93 + (((_BYTE)v60 + 52) & 0xA7)) & 0xF;
  v68.val[0].i64[1] = ((_BYTE)v56 + 3) & 0xF;
  v64.i64[0] = vqtbl4q_s8(v68, (int8x16_t)xmmword_100047720).u64[0];
  v64.i64[1] = vqtbl4q_s8(v69, (int8x16_t)xmmword_100047720).u64[0];
  v65 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(a4 - 15 + v63), *(int8x16_t *)(v53 + (v63 & 0xF) - 15)), veorq_s8(*(int8x16_t *)(v55 + (v63 & 0xF) - 15), *(int8x16_t *)(v54 + (v63 & 0xF) - 15))));
  v66 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v65, v65, 8uLL), v62), vmulq_s8(v64, v61)));
  *(int8x16_t *)(a4 - 15 + v63) = vextq_s8(v66, v66, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(a53 + 8 * (int)((1665 * ((v58 & 0xFFFFFFF0) == 16)) ^ v60)) - 4))();
}

void sub_100040668()
{
  JUMPOUT(0x1000405E8);
}

uint64_t sub_100040674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((442 * (((v7 == v8) ^ (39 * ((a7 + 70) & 0xF7 ^ 0xE8))) & 1)) ^ a7)))();
}

uint64_t sub_1000406C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (int)(((((a8 ^ 0x2BE) - 430) ^ 0xEC) * ((v8 >> 3) & 1)) ^ a8))
                            - 12))();
}

uint64_t sub_1000406F4@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W5>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  int v63;
  char v64;
  uint64_t v65;
  int8x16x4_t v67;

  v62 = (a3 - 527) | 0x203;
  *(_DWORD *)(v61 - 120) = v60;
  v63 = (v62 - 559) & v60;
  *(_DWORD *)(v61 - 128) = v63;
  v64 = v57 + a1 + v58;
  *(_DWORD *)(v61 - 132) = (v62 - 1600701512) & 0x5F68C37F;
  v65 = (a1 + v58 + a2 - v59);
  v67.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v58 + (_BYTE)a2 - (_BYTE)v59) & 0xF;
  v67.val[0].i64[1] = (v56 - (_BYTE)v59 + ((v62 - 72) ^ 0xC)) & 0xF;
  v67.val[1].i64[0] = (v64 + 2 - (_BYTE)v59) & 0xF;
  v67.val[1].i64[1] = (v64 + 1 - (_BYTE)v59) & 0xF;
  v67.val[2].i64[0] = (v56 - (_BYTE)v59) & 0xF;
  v67.val[2].i64[1] = (v64 + 15 - (_BYTE)v59) & 0xF;
  v67.val[3].i64[0] = (v64 + 14 - (_BYTE)v59) & 0xF;
  v67.val[3].i64[1] = (v64 + 13 - (_BYTE)v59) & 0xF;
  *(int8x8_t *)(a4 - 7 + v65) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(a4 - 7 + v65), *(int8x8_t *)(v53 + (v65 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v55 + (v65 & 0xF) - 7), *(int8x8_t *)(v54 + (v65 & 0xF) - 7)))), (int8x8_t)0xE7E7E7E7E7E7E7E7), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v67, (int8x16_t)xmmword_100047730), (int8x8_t)0x505050505050505)));
  return (*(uint64_t (**)(__n128))(a53 + 8 * (((4 * (-v59 != 8 - v63)) | (16 * (-v59 != 8 - v63))) ^ v62)))((__n128)xmmword_100047730);
}

void sub_100040844()
{
  JUMPOUT(0x100040770);
}

uint64_t sub_100040868()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((((*(_DWORD *)(v1 - 132) - 366842228) & 0x15DD93F5) - 143)
                                          * (*(_DWORD *)(v1 - 120) == *(_DWORD *)(v1 - 128))) ^ *(_DWORD *)(v1 - 132)))
                            - 12))();
}

uint64_t sub_1000408AC@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(a3 + (a1 - 1547653916)) ^= *(_BYTE *)(v4 + ((a1 - 1547653916) & 0xFLL)) ^ *(_BYTE *)(v6 + (((_BYTE)a1 - 28) & 0xF)) ^ *(_BYTE *)(v5 + (((_BYTE)a1 - 28) & 0xF)) ^ (5 * ((a1 - 28) & 0xF)) ^ 0xE7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((46 * (a1 - 1 != v3)) ^ (a2 - 468))) - 12))();
}

void sub_100040910()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1874323721)
    v1 = 2017444214;
  else
    v1 = -2017420626;
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_100040974(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v1 = *(_DWORD *)(a1 + 16) - 628203409 * ((a1 - 1763701788 - 2 * (a1 & 0x96E00BE4)) ^ 0x146807D7);
  v2 = *(_QWORD *)(a1 + 24);
  if (*(_DWORD *)(v2 - 0x79262543413A964BLL) - 137555249 >= 0)
    v4 = *(_DWORD *)(v2 - 0x79262543413A964BLL) - 137555249;
  else
    v4 = 137555249 - *(_DWORD *)(v2 - 0x79262543413A964BLL);
  v3 = *(_QWORD *)a1;
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x79262543413A964BLL) - 137555249 >= 0)
    v5 = *(_DWORD *)(v3 - 0x79262543413A964BLL) - 137555249;
  else
    v5 = 137555249 - *(_DWORD *)(v3 - 0x79262543413A964BLL);
  v8 = v1 - 1759421093 * ((2 * (&v7 & 0x1EE2A9C8) - &v7 + 1629312561) ^ 0xD260E665) + 774;
  v7 = v2;
  sub_100005E90((uint64_t)&v7);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  __asm { BR              X14 }
}

uint64_t sub_100040B20()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v6;

  v4 = ((v1 + 1042) ^ 0x718D3663) + v3;
  v6 = v4 > 1312317772 || v4 < v2 - 835165875;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((v6 * (((v1 - 337) | 0x35) + 449)) ^ v1)) - 12))();
}

uint64_t sub_100040B80()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL4 v16;

  v13 = 4 * (v11 + v7);
  v14 = v1 + v9 + (*(_DWORD *)(*(_QWORD *)(v12 - 0x79262543413A9647) + v13) ^ v10);
  *(_DWORD *)(*(_QWORD *)(v6 - 0x79262543413A9647) + v13) = v14 + v10 - ((v14 << (v4 - 124)) & v8);
  v16 = v11 + v2 <= v3 && v11 + v2 >= v5;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v0 + 8 * ((176 * v16) ^ (v4 + 172))) - 12))((v4 + 1326));
}

uint64_t sub_100040C44(int a1)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  _BOOL4 v4;

  v4 = v3 - 1153016953 < (int)(v2 + 401705228);
  if (v2 > 0x680E76F3 != v3 - 1153016953 < -1745778420)
    v4 = v2 > 0x680E76F3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v4 * ((a1 - 561) ^ a1 ^ 0x62D ^ 0x341)) ^ a1)) - 8))();
}

uint64_t sub_100040CBC(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  _BOOL4 v26;

  v23 = *(_DWORD *)(*(_QWORD *)(a9 - 0x79262543413A9647) + 4 * (v22 + v17));
  *(_DWORD *)(*(_QWORD *)(v16 - 0x79262543413A9647) + 4 * (v22 + v17)) = v10
                                                                           + v19
                                                                           + (v23 ^ v20)
                                                                           + v20
                                                                           - (v18 & (2 * (v10 + v19 + (v23 ^ v20))));
  v24 = v22 + 1 + v11;
  v25 = (v21 > a2) ^ (v24 < v12);
  v26 = v24 < v15;
  if (v25)
    v26 = v21 > a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((!v26 * v13) ^ v14)) - 8))();
}

uint64_t sub_100040DA0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (((v1 == 0x49904DC5E2D614EBLL) * (v2 - 664)) ^ v2))
                            - ((v2 + 30) ^ 0x394)))();
}

void sub_100040DDC()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(v0 - 0x79262543413A964BLL) = (((v2 + v1) * (v3 - 1273225095)) ^ 0x4DB6FD77)
                                         - 1166282822
                                         + ((2 * (v2 + v1) * (v3 - 1273225095)) & 0x9B6DFAEE);
}

void sub_100040FE4(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v1 = 1225351577 * (((a1 | 0x24F55ED3) - a1 + (a1 & 0xDB0AA12C)) ^ 0x5A0AC4E1);
  v2 = *(_DWORD *)(a1 + 24) ^ v1;
  v3 = (*(_BYTE *)(a1 + 28) ^ v1);
  ((void (*)(_QWORD, void (*)()))*(&off_10005BF50 + v2 - 341))(*(&off_10005BF50 + v2 - 410), sub_100045AF8);
  v4 = *(_QWORD *)((char *)*(&off_10005BF50 + v2 - 474) - 4);
  v6 = v2
     - 1374699841 * ((&v5 + 1102890120 - 2 * ((unint64_t)&v5 & 0x41BCC488)) ^ 0x2C48DC81)
     - 179;
  v5 = v4;
  sub_10002848C((uint64_t)&v5);
  __asm { BR              X8 }
}

uint64_t sub_100041124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, char a17)
{
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  a16 = (v18 + 549) ^ ((((&a16 ^ 0xD379E85A | 0xE551A89D)
                       - (&a16 ^ 0xD379E85A)
                       + ((&a16 ^ 0xD379E85A) & 0x1AAE5762)) ^ 0x5BDC58CE)
                     * v17);
  a17 = (((&a16 ^ 0x5A | 0x9D)
        - (&a16 ^ 0x5A)
        + ((&a16 ^ 0x5A) & 0x62)) ^ 0xCE)
      * v17
      + 71;
  sub_1000275AC((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * ((1140 * (**(_DWORD **)(v20 + 8 * ((v18 - 19) ^ 0x22D)) == ((v18 - 19) ^ 0xFFFFFEC0) + v18 + 233)) ^ (v18 - 19)))
                                                                                                - 4))(v21, v22, v23, v24, v25, v26, v27);
}

uint64_t sub_1000411D8()
{
  uint64_t *v0;
  _DWORD *v1;
  _DWORD *v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int *v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t (*v14)(uint64_t, _BYTE *, _DWORD *);
  int v15;
  unsigned int v16;
  uint64_t v17;
  _BYTE *v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t result;
  uint64_t v23;
  _BYTE v24[30];
  _BYTE v25[140];

  v8 = v7 ^ 0x17;
  v9 = *(unsigned int **)(v5 + 8 * (v7 ^ 0x202));
  v10 = *v9;
  v11 = *(_QWORD **)(v5 + 8 * (v8 - 522));
  v12 = (_BYTE *)*v11;
  v24[0] = *(_BYTE *)*v11 - 86;
  v24[1] = v12[1] - 86;
  v24[2] = v12[2] - 86;
  v24[3] = v12[3] - 86;
  v24[4] = v12[4] - 86;
  v24[5] = v12[5] - 86;
  v24[6] = v12[6] - 86;
  v24[7] = v12[7] - 86;
  v24[8] = v12[8] - 86;
  v24[9] = v12[9] - 86;
  v24[10] = v12[10] - 86;
  v24[11] = v12[11] - 86;
  v24[12] = v12[12] - 86;
  v24[13] = v12[13] - 86;
  v24[14] = v12[14] - 86;
  v24[15] = v12[15] - 86;
  v24[16] = v12[16] - 86;
  v24[17] = v12[17] - 86;
  v24[18] = v12[18] - 86;
  v24[19] = v12[19] - 86;
  v24[20] = v12[20] - 86;
  v24[21] = v12[21] - 86;
  v13 = (_BYTE *)*v11;
  v24[22] = v13[22] - 86;
  v24[23] = v13[23] - 86;
  v24[24] = v13[24] - 86;
  v24[25] = v13[25] - 86;
  v24[26] = v13[26] - 86;
  v24[27] = v13[27] - 86;
  v24[28] = v13[28] - 86;
  v24[29] = v13[29] - 86;
  v14 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v5 + 8 * (v8 ^ 0x2F9));
  v15 = v14(v10, v24, v1);
  v16 = ((2 * v15) & 0xFE57FFD6) + (v15 ^ 0xFF2BFFEB);
  if (v16 != -13893653)
  {
    if (v16 == -13892551)
    {
      v17 = *v9;
      v18 = *(_BYTE **)(*(_QWORD *)(v5 + 8 * (v3 - 446)) - 4);
      v25[0] = *v18 - 90;
      v25[1] = v18[1] - 90;
      v25[2] = v18[2] - 90;
      v25[3] = v18[3] - 90;
      v25[4] = v18[4] - 90;
      v25[5] = v18[5] - 90;
      v25[6] = v18[6] - 90;
      v25[7] = v18[7] - 90;
      v25[8] = v18[8] - 90;
      v25[9] = v18[9] - 90;
      v25[10] = v18[10] - 90;
      v25[11] = v18[11] - 90;
      v25[12] = v18[12] - 90;
      v25[13] = v18[13] - 90;
      v25[14] = v18[14] - 90;
      v25[15] = v18[15] - 90;
      v25[16] = v18[16] - 90;
      v25[17] = v18[17] - 90;
      v25[18] = v18[18] - 90;
      v25[19] = v18[19] - 90;
      v19 = v14(v17, v25, v1);
      v20 = (2 * v19) & 0xEBFFBFDA;
      v16 = (v19 ^ 0xF5FFDFED) + 1528921852;
    }
    else
    {
      v20 = 1375035134;
    }
    __asm { BR              X8 }
  }
  v21 = (v3 + 1970905481) & 0x8A865F5F;
  *(_DWORD *)(v6 + 344) |= v21 ^ 0x314;
  *(_DWORD *)(v6 + 44) = 1894912817;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _DWORD *))(v5 + 8 * (v3 - 458)))(*v1, v6 + 332, v6 + 336, v6 + 340, v2);
  v23 = *v0;
  *(_DWORD *)(v0[2] - 0x3F156345BCC4F9CLL) = *v1;
  *(_DWORD *)(v23 - 0x4757C87602801F33) = ((v21 - 253) | 0x14) + *v2 - ((2 * *v2) & 0xAE6CDF7C) - 684298871;
  *((_DWORD *)v0 + 2) = 2017444214;
  return result;
}

void sub_10004164C(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 8) != 0x43C85E0409B7388DLL
    && *(_QWORD *)(a1 + 16) != 0xF32FE879D78317FLL
    && *(_QWORD *)a1 != 0x34E7A15D1F153284;
  v1 = *(_DWORD *)(a1 + 24) - 3804331 * (((a1 | 0xF1219854) - (a1 & 0xF1219854)) ^ 0x7E848392);
  __asm { BR              X9 }
}

uint64_t sub_100041748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * (((*(_DWORD *)(a7 - 0x43C85E0409B73875) == 2017444214) * ((571 * (v9 ^ 0x1C3)) ^ 0x1C6)) ^ v9)) - 12))(a1, a2, a3, a4, a5, 454, a7, a8);
}

uint64_t sub_1000417A0@<X0>(uint64_t a1@<X6>, int a2@<W8>, __n128 a3@<Q0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  __n128 v19;
  __n128 v20;
  _BOOL4 v21;
  unsigned int v23;

  v18 = (v15 + 296266568) & 0xEE5755ED;
  v23 = *(_DWORD *)(a1 - 0x43C85E0409B7387DLL) - 1114121577;
  *(_DWORD *)(v17 - 140) = -394019833 * (*(_DWORD *)(a15 + 32) - a2)
                         - (((v18 ^ 0xD1077DA2) * (*(_DWORD *)(a15 + 32) - a2) - 1115809180) & 0xEAE43D16)
                         + 1412508605;
  v19.n128_u64[0] = 0xCECECECECECECECELL;
  v19.n128_u64[1] = 0xCECECECECECECECELL;
  v20.n128_u64[0] = 0xE7E7E7E7E7E7E7E7;
  v20.n128_u64[1] = 0xE7E7E7E7E7E7E7E7;
  v21 = v23 < 0xD63E3328;
  if (v23 >= 0xD63E3328)
    v21 = v23 > 0xD63E3328;
  return ((uint64_t (*)(uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v16 + 8 * (int)((v21 * (v18 - 1426)) ^ v18))
                                                                                          - (((v18 - 1068) | 0x41) ^ 0x1C9)))(2877096322, a3, a4, a5, a6, v19, v20);
}

uint64_t sub_1000419E8()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 8 * (v0 - 1449)))(((5 * ((v0 - 95) ^ 0x5AB) - 893) | 0xC0) ^ 0x1C1u);
}

uint64_t sub_1000426D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  int v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  _BOOL4 v21;
  _BOOL4 v22;

  v18 = (v15 + 107408691) & 0xF99915DB;
  *(_BYTE *)(*v17 + (a8 + v14 + 449)) = 103;
  v19 = (((v18 - 847) | 0x40) ^ 0xC5F1F7C2) + v14;
  v20 = (a14 > 0xE43FC855) ^ (v19 < 0x1BC037AA);
  v21 = v19 < a14 + 465581994;
  if (v20)
    v22 = a14 > 0xE43FC855;
  else
    v22 = v21;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * (int)((11 * v22) | v18)) - 8))();
}

uint64_t sub_10004276C@<X0>(unsigned int a1@<W2>, int a2@<W7>, int a3@<W8>)
{
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  _BOOL4 v11;

  v11 = a1 > v7;
  *(_BYTE *)(*v10 + v3 + 1 + a2 + ((a3 + 1077509373) & 0xBFC67FF3)) = -25;
  if (v11 == v3 + v4 < v5)
    v11 = v3 + v4 < v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((v11 * v8) ^ a3)) - 8))();
}

void sub_1000427D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  int v8;
  unsigned int v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;

  *(_QWORD *)(v11 - 0xF32FE879D78317FLL) = *v7;
  *(_DWORD *)(v12 - 0x34E7A15D1F153284) = a3;
  *v7 = 0;
  *(_QWORD *)(a7 - 0x43C85E0409B73885) = 0x5835681958356819;
  v8 = *(_DWORD *)(a7 - 0x43C85E0409B73879);
  *v10 = 413554833;
  v9 = ((2 * (v8 & 0xFFFFFFFE ^ 0xAD06AD6)) | 0x175EA10E) - (v8 & 0xFFFFFFFE ^ 0xAD06AD6) + 1951444857;
  *(_DWORD *)(a7 - 0x43C85E0409B73879) = ((v9 & 0x55042257 ^ 0x44040240)
                                          + (v9 ^ 0x9BE37C17)
                                          - ((v9 ^ 0x9BE37C17) & 0x55042256)) ^ 0x4F986411;
  *(_DWORD *)(v14 + 36) = *v13;
}

void sub_100042918(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) - 1225351577 * ((2 * (a1 & 0x3AE15D2F) - a1 + 1159635664) ^ 0x3BE138E2);
  __asm { BR              X14 }
}

void sub_100042A24(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  *(_DWORD *)(a2 + v3) = v2;
}

void sub_10004393C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X11 }
}

uint64_t sub_100043A10@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;

  v12 = v8 + 3;
  v13 = (v8 - 273769238) & 0x105165EE;
  v14 = 1755732067 * (((&a4 | 0x545E70D) + (~&a4 | 0xFABA18F2)) ^ 0xDB835AD7);
  a7 = &STACK[0x107D0947D424028D];
  a4 = &STACK[0x1500148A4D1A050B];
  a5 = v11;
  a6 = (v8 - 259) ^ v14;
  a8 = v14 ^ 0x6D04F380;
  v15 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * ((v8 + 3) ^ 0x1C9)) - 8))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10
                                                      + 8
                                                      * (((*(_DWORD *)(v11 - 0x43C85E0409B73875) == (v12 ^ (v9 - 232)))
                                                        * (v13 ^ 0x6FF)) ^ v12))
                                          - 4))(v15);
}

uint64_t sub_100043B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  uint64_t v12;
  unsigned int v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((22 * (a11 != v11 - 4)) ^ v13)) - 4))();
}

void sub_100043B3C(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;

  *a1 = v2;
  *(_DWORD *)(v1 + 4) = -2017420733;
}

uint64_t sub_100043C08(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  char v5;

  qword_100060150 = 45734839 * (((qword_100060118 ^ qword_100060150) - (_QWORD)&v5) ^ 0x95387C5A7726064);
  qword_100060118 = qword_100060150;
  v2 = *(_DWORD *)(a2 + 4);
  v3 = (uint64_t)*(&off_10005BF50 + (unk_10004BF40 ^ 0x7C) - 30);
  if (v2 == 1991213899)
    __asm { BR              X16 }
  if (v2 == 1991213906)
    __asm { BR              X1 }
  return 4294925278;
}

void sub_100044290(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }
}

void sub_100044310()
{
  _DWORD *v0;

  *v0 = -1500179754;
}

void sub_1000445A8(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 535753261 * (((a1 | 0xD816FE13) - (a1 & 0xD816FE13)) ^ 0xD2E2F03C);
  v2 = *(_DWORD *)(a1 + 12) ^ v1;
  __asm { BR              X14 }
}

uint64_t sub_10004466C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v9;
  uint64_t v10;
  int v11;

  v5 = v3 ^ 0x1EF;
  v6 = (v3 ^ 0x77CDC183) & (v4 + 643011284);
  v7 = 3804331 * (((&v9 | 0x8C3F22A4) - (&v9 & 0x8C3F22A4)) ^ 0x39A3962);
  v10 = v2;
  v9 = v1 - v7 - v6 - 1894733364;
  v11 = (v5 + 371) ^ v7;
  return ((uint64_t (*)(int *))(*(_QWORD *)(a1 + 8 * (v5 ^ 0xEF)) - 12))(&v9);
}

void sub_1000447A0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40) + 460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86);
  __asm { BR              X12 }
}

uint64_t sub_1000448B4()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = (*(_DWORD *)(v2 + 64) ^ v0) == (v1 ^ 0x7E601B2A) || (*(_QWORD *)(v2 + 24) | *(_QWORD *)(v2 + 8)) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((v1 - 4) ^ (4 * v5))) - 8))();
}

uint64_t sub_100044900()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  _BOOL4 v4;

  v4 = v1[6] == 0x1FF6B319107136C2 || (v1[7] | v1[2]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((v4 * ((((v0 ^ 0x47C) - 1446) | 0x192) - 413)) ^ v0 ^ 0x47C))
                            - (((v0 ^ 0x47C) - 2051727329) & 0x7A4ADE5F)
                            + 1094))();
}

uint64_t sub_100044978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                       + 8
                                                                       * (int)(((v3 != 0)
                                                                              * ((v4 + 18433278) & 0xFEE6B7FF ^ 0x153)) ^ v4)))(a1, a2, a3, 1225351577);
}

uint64_t sub_100044A90@<X0>(int a1@<W3>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  void (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v48)(uint64_t);
  uint64_t v49;
  void (*v50)(uint64_t);
  void (*v51)(uint64_t);
  int v52;
  uint64_t v53;

  v35 = (v27 - 776280157) & 0x2E45155A;
  v36 = v35 ^ 0x38D;
  v37 = ((v34 - 144) ^ 0x7EFF9A32) * a1;
  *(_QWORD *)(v34 - 136) = v25;
  *(_DWORD *)(v34 - 124) = v35 - v37 + 349;
  *(_QWORD *)(v34 - 120) = v30;
  *(_DWORD *)(v34 - 144) = ((v35 ^ 0xDEF5517C) + v28) ^ v37;
  v53 = a2 + v26;
  ((void (*)(uint64_t))(*(_QWORD *)(v29 + 8 * (v35 - 200)) - 8))(v34 - 144);
  HIDWORD(a11) = v36 + 694;
  *(_QWORD *)(v34 - 136) = a22;
  *(_QWORD *)(v34 - 128) = a21;
  *(_DWORD *)(v34 - 144) = v36
                         + 694
                         + 535753261
                         * ((((v34 - 144) | 0x90371EFA) - (v34 - 144) + ((v34 - 144) & 0x6FC8E100)) ^ 0x9AC310D5);
  v51 = *(void (**)(uint64_t))(v29 + 8 * (v36 - 555));
  v51(v34 - 144);
  HIDWORD(a9) = v36 + 764;
  v52 = 2 * (v34 - 144);
  *(_QWORD *)(v34 - 144) = a21;
  *(_QWORD *)(v34 - 128) = a23;
  *(_QWORD *)(v34 - 120) = a22;
  *(_QWORD *)(v34 - 112) = v30;
  *(_DWORD *)(v34 - 136) = v36 + 764 - 1178560073 * (((v52 | 0x34657936) - (v34 - 144) + 1707950949) ^ 0x20A6C4F9);
  v50 = (void (*)(uint64_t))(*(_QWORD *)(v29 + 8 * (v36 ^ 0x247u)) - 12);
  v50(v34 - 144);
  HIDWORD(v49) = v36 - 132;
  *(_DWORD *)(v34 - 104) = v36
                         - 132
                         + 235795823
                         * ((((v34 - 144) ^ 0xFB8C79AA) - 1432301377 - 2 * (((v34 - 144) ^ 0xFB8C79AA) & 0xAAA0D0BF)) ^ 0xC581E04C);
  *(_QWORD *)(v34 - 144) = a21;
  *(_QWORD *)(v34 - 136) = v32;
  *(_QWORD *)(v34 - 120) = a23;
  *(_QWORD *)(v34 - 112) = a22;
  *(_QWORD *)(v34 - 128) = a23;
  v38 = *(void (**)(uint64_t))(v29 + 8 * (v36 - 570));
  v38(v34 - 144);
  LODWORD(v49) = v36 + 20;
  *(_DWORD *)(v34 - 128) = v36
                         + 20
                         - 1225351577 * ((((v34 - 144) | 0x47DE7FEB) - ((v34 - 144) & 0x47DE7FEB)) ^ 0x3921E5D9);
  *(_QWORD *)(v34 - 112) = a22;
  *(_QWORD *)(v34 - 104) = a23;
  *(_QWORD *)(v34 - 144) = a21;
  *(_QWORD *)(v34 - 136) = a14;
  *(_QWORD *)(v34 - 120) = a23;
  v48 = (void (*)(uint64_t))*(&off_10005BF50 + v36 - 564);
  v48(v34 - 144);
  *(_QWORD *)(v34 - 136) = a22;
  *(_QWORD *)(v34 - 128) = a17;
  *(_DWORD *)(v34 - 144) = v36
                         + 694
                         + 535753261
                         * ((-803403039 - ((v34 - 144) | 0xD01D0AE1) + ((v34 - 144) | 0x2FE2F51E)) ^ 0x2516FB31);
  v51(v34 - 144);
  *(_QWORD *)(v34 - 144) = a17;
  *(_DWORD *)(v34 - 136) = v36
                         + 764
                         - 1178560073 * (((v34 - 144) & 0x3A81D27D | ~((v34 - 144) | 0x3A81D27D)) ^ 0x7FEA55E0);
  *(_QWORD *)(v34 - 128) = v33;
  *(_QWORD *)(v34 - 120) = a22;
  *(_QWORD *)(v34 - 112) = v30;
  v50(v34 - 144);
  *(_DWORD *)(v34 - 104) = v36 - 132 + 235795823 * (((v52 | 0x58B860E0) - (v34 - 144) + 1403244432) ^ 0x38F17929);
  *(_QWORD *)(v34 - 120) = v33;
  *(_QWORD *)(v34 - 112) = a22;
  *(_QWORD *)(v34 - 136) = v32;
  *(_QWORD *)(v34 - 128) = v33;
  *(_QWORD *)(v34 - 144) = a17;
  v38(v34 - 144);
  *(_DWORD *)(v34 - 128) = v36 + 20 - 1225351577 * ((v34 - 144) ^ 0x7EFF9A32);
  *(_QWORD *)(v34 - 112) = a22;
  *(_QWORD *)(v34 - 104) = v33;
  *(_QWORD *)(v34 - 120) = v33;
  *(_QWORD *)(v34 - 144) = a17;
  *(_QWORD *)(v34 - 136) = a15;
  v48(v34 - 144);
  *(_QWORD *)(v34 - 144) = a23;
  *(_QWORD *)(v34 - 136) = v33;
  *(_DWORD *)(v34 - 128) = v36
                         - 1224239923 * ((((v34 - 144) | 0xB3BC8C3B) + (~(v34 - 144) | 0x4C4373C4)) ^ 0x410F71ED)
                         - 432;
  ((void (*)(uint64_t))((char *)*(&off_10005BF50 + (v36 & 0xE1F848C)) - 4))(v34 - 144);
  *(_QWORD *)(v34 - 144) = v33;
  *(_DWORD *)(v34 - 132) = v36 - 1759421093 * (((v52 | 0xD101A53A) - (v34 - 144) - 1753272989) ^ 0xDBFD62C9) + 190;
  sub_100005E90(v34 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), uint64_t, char *, _QWORD, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 + 8 * ((((*(_DWORD *)(v34 - 136) - 1232152173) < 0x272B91A) * ((v36 - 270) ^ 0x717)) ^ v36)) - (v36 - 270) + 431))(v39, v40, v41, v42, v43, v44, v45, v46, a3, a4, v30, v48, v49, v50, a9, v51, a11, (char *)*(&off_10005BF50 + v36 - 655) - 8, (v36 - 270),
           v38,
           a15,
           v53,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_100044FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void (*a18)(uint64_t), uint64_t a19, void (*a20)(uint64_t),uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  void (*v39)(uint64_t);
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  int v50;

  *(_DWORD *)(v44 - 128) = v40
                         - 1178560073
                         * ((((v44 - 144) ^ 0x55FC345A) & 0x28D6E822 | ~((v44 - 144) ^ 0x55FC345A | 0x28D6E822)) ^ 0x38415BE5)
                         + 37;
  *(_QWORD *)(v44 - 144) = v43;
  *(_QWORD *)(v44 - 136) = v41;
  v39(v44 - 144);
  v45 = v40 + 590;
  v46 = v40;
  v47 = v40 + 138;
  *(_DWORD *)(v44 - 104) = v47 + 235795823 * ((v44 - 323564042 - 2 * ((v44 - 144) & 0xECB6CE86)) ^ 0x781B87DF);
  *(_QWORD *)(v44 - 120) = v43;
  *(_QWORD *)(v44 - 112) = a28;
  *(_QWORD *)(v44 - 144) = v41;
  *(_QWORD *)(v44 - 136) = a39;
  v50 = v45 | 0x82;
  *(_QWORD *)(v44 - 128) = v43;
  a20(v44 - 144);
  *(_DWORD *)(v44 - 104) = v47
                         + 235795823 * ((((2 * (v44 - 144)) | 0xED55BEB4) - (v44 - 144) - 1990909786) ^ 0xE2079603);
  *(_QWORD *)(v44 - 144) = v41;
  *(_QWORD *)(v44 - 136) = v43;
  *(_QWORD *)(v44 - 128) = v43;
  *(_QWORD *)(v44 - 120) = a22;
  *(_QWORD *)(v44 - 112) = a28;
  a20(v44 - 144);
  *(_QWORD *)(v44 - 128) = v43;
  *(_DWORD *)(v44 - 136) = v46
                         + 1755732067 * (((v44 - 144) & 0x3CE12F49 | ~((v44 - 144) | 0x3CE12F49)) ^ 0x1DD86D6D)
                         + 426522578;
  *(_QWORD *)(v44 - 144) = a27;
  sub_100046014(v44 - 144);
  *(_DWORD *)(v44 - 128) = v46
                         - 1178560073
                         * ((1697882597 - ((v44 - 144) | 0x6533A1E5) + ((v44 - 144) | 0x9ACC5E1A)) ^ 0x20582678)
                         + 37;
  *(_QWORD *)(v44 - 144) = v43;
  *(_QWORD *)(v44 - 136) = a29;
  a18(v44 - 144);
  *(_DWORD *)(v44 - 136) = v46
                         + 3804331 * (((~(v44 - 144) & 0x8D35EC0E) - (~(v44 - 144) | 0x8D35EC0F)) ^ 0x290F7C9)
                         + 1350;
  *(_QWORD *)(v44 - 144) = v43;
  *(_QWORD *)(v44 - 128) = a29;
  v48 = sub_100027074(v44 - 144);
  return (*(uint64_t (**)(uint64_t))(v42
                                            + 8
                                            * (int)(((v50 + ((v46 + 1824058856) & 0x934714E7) - 2292) * (a26 == 0)) ^ (v46 + 689))))(v48);
}

uint64_t sub_100045218()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v4 = 460628867 * ((((2 * (v3 - 144)) | 0xC14A8B9C) - (v3 - 144) + 526039602) ^ 0xAC33C7B3);
  *(_QWORD *)(v3 - 128) = v2;
  *(_QWORD *)(v3 - 144) = v6;
  *(_DWORD *)(v3 - 120) = v8 - v4 - 1326160010 + v0;
  *(_DWORD *)(v3 - 136) = v0 - v4 + 652;
  result = ((uint64_t (*)(uint64_t))*(&off_10005BF50 + v0 - 962))(v3 - 144);
  *(_DWORD *)(v7 - 0x1FF6B319107136C2) = v8;
  *v1 = 2017444214;
  return result;
}

void sub_100045374(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1000453D4()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1317 * (v1 != 1991213896)) ^ 0x349u)) - 4))();
}

uint64_t sub_100045400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  _DWORD v8[2];
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = v3 - (**(_BYTE **)(a2 + 8) == 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 800) = 2085126576;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 804) = 137555249;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 808) = *(_QWORD *)(a1 + 96) + 816;
  v5 = *(_QWORD *)(a1 + 96) + 0x79262543413A996FLL;
  v6 = 460628867 * ((v8 + 1137917537 - 2 * ((unint64_t)v8 & 0x43D33E61)) ^ 0xF45BC1C);
  v11 = *(_QWORD *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - v4);
  v10 = (v4 - 913204664) ^ v6;
  v9 = v5;
  v8[1] = v6 + 429;
  ((void (*)(_DWORD *))(*(_QWORD *)(a3 + 1424) - 12))(v8);
  return v8[0] ^ 0x437DA987u;
}

void sub_100045544(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) ^ (1225351577 * ((-2 - ((~(_DWORD)a1 | 0x83317A5F) + (a1 | 0x7CCE85A0))) ^ 0xFDCEE06D));
  __asm { BR              X10 }
}

uint64_t sub_10004562C@<X0>(uint64_t a1@<X8>, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5, unsigned int a6, int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v10 = 108757529 * ((293386251 - (&a3 | 0x117CB80B) + (&a3 | 0xEE8347F4)) ^ 0xE1F25DF);
  a4 = v10 ^ 0xEA8635E9;
  a6 = 1123996314 - v10;
  a7 = v7 - v10 - 473;
  a3 = &STACK[0x440BBB7769F03182];
  a5 = v8;
  v11 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v7 - 655)) - 8))(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v8 - 0x43C85E0409B73875) == 2017444214)
                                                        * ((v7 - 21) ^ 0x3D2)) ^ v7))
                                          - 8))(v11);
}

void sub_100045714(_DWORD *a1@<X8>)
{
  _DWORD *v1;
  int v2;
  char v3;
  unsigned int v4;
  _BYTE *v5;

  v4 = *v1 + v2;
  *v5 = (HIBYTE(v4) ^ 0xB6) - (((HIBYTE(v4) ^ 0xFFFFFFB6) & 0x6F ^ HIBYTE(v4) & 8) << ((v3 ^ 0x3D) - 21)) - 25;
  v5[1] = (BYTE2(v4) ^ 0x96) - ((2 * (BYTE2(v4) ^ 0x96)) & 0xCF) - 25;
  v5[2] = (BYTE1(v4) ^ 0x90) + (~(v4 >> 7) | 0x31) - 24;
  v5[3] = v4 ^ 0xF2;
  v1[4] = *a1;
}

uint64_t sub_1000457D8(_DWORD *a1)
{
  unsigned int v1;
  int v2;
  int v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  v1 = 108757529 * ((-1057227633 - (a1 | 0xC0FBFC8F) + (a1 | 0x3F040370)) ^ 0xDF98615B);
  v2 = *a1 ^ v1;
  v3 = a1[1] ^ v1;
  v5 = v3 - 1257563110;
  v4 = v3 - 1257563110 < 0;
  LODWORD(v6) = 1257563110 - v3;
  if (v4)
    v6 = v6;
  else
    v6 = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_10005BF50 + (v2 ^ 0x23A))
                              + ((1227 * (v6 != ((2 * (_DWORD)v6) & 0x72DE067C))) ^ v2))
                            - 4))();
}

void sub_100045890(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  **(_DWORD **)(v1 - 0x79262543413A9647) = (v2 - 1183907010) ^ 0xCD2FD604;
  *(_DWORD *)(v1 - 0x79262543413A964BLL) = a1 + 1;
}

uint64_t sub_1000458EC(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t result;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;

  v2 = 1755732067 * (a1 ^ 0xDEC6BDDB);
  v3 = *(_DWORD *)(a1 + 24) ^ v2;
  v4 = *(_DWORD *)(a1 + 28) ^ v2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = 235795823
     * (((&v9 | 0x9DCFE726) - &v9 + (&v9 & 0x623018D8)) ^ 0x962AE7F);
  v7 = (*(_DWORD *)(a1 + 4) ^ v2) - v6;
  v3 += 2024873085;
  v14 = *(_QWORD *)(a1 + 8);
  v9 = v5;
  v11 = v3 + v6 + 1122;
  v12 = -1393424941 * v4 - ((434375590 * v4 + 683233434) & 0x27FC499A) - v6 - 1470444262;
  v13 = v7 - 791730621;
  result = ((uint64_t (*)(uint64_t *))*(&off_10005BF50 + v3))(&v9);
  *(_DWORD *)a1 = v10;
  return result;
}

uint64_t sub_100045A38(_DWORD *a1)
{
  unsigned int v2;
  signed int v3;
  uint64_t result;
  int v5;

  v2 = *a1 ^ (1178560073 * (((a1 | 0x9834C8C3) - (a1 & 0x9834C8C3)) ^ 0x22A0B0A1));
  v3 = v2 + 504207104;
  result = ((uint64_t (*)(char *, char *))*(&off_10005BF50 + (int)(v2 ^ 0xE1F269AA)))((char *)*(&off_10005BF50 + (int)(v2 + 504207113)) - 4, (char *)*(&off_10005BF50 + (int)(v2 ^ 0xE1F269D7)) - 12);
  v5 = *(_DWORD *)*(&off_10005BF50 + v3);
  if ((_DWORD)result)
    v5 = -2017420344;
  a1[1] = v5;
  return result;
}

void sub_100045AF8()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  char v4;
  char *v5;

  v0 = qword_100060128 - (_QWORD)&v2 + qword_100060118;
  qword_100060128 = 45734839 * (v0 - 0x95387C5A7726064);
  qword_100060118 = 45734839 * (v0 ^ 0x95387C5A7726064);
  v3 = (1374699841 * ((2 * (&v3 & 0x19DD0CF8) - &v3 - 433917178) ^ 0x8BD6EB0F)) ^ 0x3A8;
  v5 = (char *)*(&off_10005BF50
               + ((-73 * ((qword_100060118 - qword_100060128) ^ 0x64)) ^ byte_10004F1C0[byte_10004BDA0[(-73 * ((qword_100060118 - qword_100060128) ^ 0x64))] ^ 0xA5])
               + 90)
     - 4;
  sub_10001386C(&v3);
  v3 = (1374699841 * (&v3 ^ 0x6DF41809)) ^ 0x3A8;
  v5 = (char *)*(&off_10005BF50
               + ((-73 * ((qword_100060118 - qword_100060128) ^ 0x64)) ^ byte_100057AC0[byte_100053DE0[(-73 * ((qword_100060118 - qword_100060128) ^ 0x64))] ^ 0x7C])
               - 211)
     - 4;
  sub_10001386C(&v3);
  v1 = 1374699841 * ((2 * (&v3 & 0x1CF1FAC8) - &v3 + 1661863223) ^ 0xEFA1D3E);
  v3 = v1 ^ 0x45A;
  v4 = v1 + 70;
  sub_1000275AC((uint64_t)&v3);
}

uint64_t sub_100045D00(uint64_t a1)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = a1;
  v2[0] = (1374699841 * ((2 * (v2 & 0x72D60108) - v2 - 1926627593) ^ 0xE0DDE6FE)) ^ 0x3A8;
  sub_10001386C(v2);
  return v2[1];
}

uint64_t sub_100045D9C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 8);
  return 0;
}

_BYTE *sub_100045DB4(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_100045E44 + 4 * byte_10004BFA7[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t sub_100045EA8(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;

  v2 = 1225351577 * ((a1 & 0x45F4E8E1 | ~(a1 | 0x45F4E8E1)) ^ 0xC4F48D2C);
  v3 = *(_DWORD *)(a1 + 8) ^ v2;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = 875338593 * (*(_DWORD *)(a1 + 12) + v2) - 2014830090;
  v8 = 1224239923 * ((2 * (&v10 & 0x296E5BF0) - &v10 + 1452385292) ^ 0xA42259DB);
  v13 = *(_QWORD *)a1;
  v14 = v5;
  v10 = v6;
  v12 = v4;
  v16 = v3 - 1695026459 + v8;
  v11 = (v7 ^ 0xFF9FCEBC) - v8 + ((2 * v7) & 0xFF3F9D78) + 2004874732;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_10005BF50 + (v3 ^ 0x65081022)) - 12))(&v10);
  *(_DWORD *)(a1 + 40) = v15;
  return result;
}

uint64_t sub_100046014(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 & 0xE52700F6 | ~(a1 | 0xE52700F6)) ^ 0xC41E42D2);
  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  v5 = v1
     - 1178560073
     * (((&v5 | 0xE1E865C5) - &v5 + (&v5 & 0x1E179A38)) ^ 0x5B7C1DA7)
     - 426522819;
  v6 = v2;
  v7 = v3;
  return ((uint64_t (*)(unsigned int *))((char *)*(&off_10005BF50 + (v1 ^ 0x196C3925)) - 8))(&v5);
}

uint64_t sub_10004610C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_100046124(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_10004613C(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  int v7;
  _DWORD *v8;

  v1 = 535753261
     * ((-2 - ((~result | 0xCE9083717906D1D1) + (result | 0x316F7C8E86F92E2ELL))) ^ 0x3B72DE1C73F2DFFELL);
  v2 = *(_QWORD *)(result + 32) ^ v1;
  v3 = *(_QWORD *)(result + 16) + v1;
  v4 = v2 > v3;
  v5 = v2 == v3;
  v6 = v4;
  if (((*(_DWORD *)(result + 4) + (_DWORD)v1) & 1) != 0)
    v7 = v6;
  else
    v7 = v5;
  if (v7)
    v8 = (_DWORD *)(result + 44);
  else
    v8 = (_DWORD *)result;
  *(_DWORD *)(result + 24) = *v8 ^ v1 ^ (*(_DWORD *)(result + 40) - v1);
  return result;
}

void sub_1000461E4()
{
  unint64_t v0;
  _BYTE v1[8];
  int v2;
  char *v3;

  v0 = 45734839 * ((unint64_t)&v1[qword_100060118 ^ qword_100060308] ^ 0x95387C5A7726064);
  qword_100060308 = 45734839 * (_QWORD)&v1[(qword_100060118 ^ qword_100060308) - 0x95387C5A7726064];
  qword_100060118 = v0;
  v2 = (1374699841 * ((&v2 - 685824170 - 2 * ((unint64_t)&v2 & 0xD71F2756)) ^ 0xBAEB3F5F)) ^ 0x3A8;
  v3 = (char *)*(&off_10005BF50
               + ((-73 * ((v0 + qword_100060308) ^ 0x64)) ^ byte_10004F1C0[byte_10004BDA0[(-73 * ((v0 + qword_100060308) ^ 0x64))] ^ 0xC2])
               + 11)
     - 4;
  sub_10001386C(&v2);
}

void sub_100046310(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = a1;
  v2 = 386
     - 1374699841 * ((1444875314 - (&v1 | 0x561F0C32) + (&v1 | 0xA9E0F3CD)) ^ 0xC414EBC4);
  sub_10002848C((uint64_t)&v1);
}

uint64_t sub_1000463AC(char a1, unsigned int a2)
{
  return byte_1000577C0[(byte_100053AE0[a2] ^ a1)] ^ a2;
}

uint64_t sub_1000463D8(unsigned int a1)
{
  return byte_1000577C0[byte_100053AE0[a1] ^ 0x97] ^ a1;
}

uint64_t sub_100046404(char a1, unsigned int a2)
{
  return byte_1000578C0[(byte_100053BE0[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046430(char a1, unsigned int a2)
{
  return byte_100053CE0[(byte_10004F0C0[a2] ^ a1)] ^ a2;
}

uint64_t sub_10004645C(char a1, unsigned int a2)
{
  return byte_10004F1C0[(byte_10004BDA0[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046488(char a1, unsigned int a2)
{
  return byte_10004BEA0[(byte_1000579C0[a2] ^ a1)] ^ a2;
}

uint64_t sub_1000464B4(char a1, unsigned int a2)
{
  return byte_100057AC0[(byte_100053DE0[a2] ^ a1)] ^ a2;
}

uint64_t sub_1000464E0(unsigned int a1)
{
  return byte_1000577C0[byte_100053AE0[a1] ^ 0xCB] ^ a1;
}

uint64_t sub_10004650C(unsigned int a1)
{
  return byte_100053CE0[byte_10004F0C0[a1] ^ 0xA3] ^ a1;
}

uint64_t sub_100046538(unsigned int a1)
{
  return byte_10004F1C0[byte_10004BDA0[a1] ^ 0xA5] ^ a1;
}

void sub_100046564(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;

  v1 = 628203409 * (((&v1 | 0xB375491A) - (&v1 & 0xB375491A)) ^ 0x31FD4529) + 711;
  v2 = a1;
  sub_100013A00((uint64_t)&v1);
}

uint64_t sub_1000465F4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 24);
  return 0;
}

uint64_t sub_10004660C(uint64_t result)
{
  unint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v1 = 1178560073 * ((result - 2 * (result & 0x88D88836770F0327) - 0x772777C988F0FCD9) ^ 0x9324D8DECD9B7B45);
  v2 = *(_DWORD *)(result + 20) ^ (1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45));
  v3 = *(_QWORD *)(result + 8) ^ v1;
  v4 = *(_QWORD *)(result + 32) ^ v1;
  v5 = v3 < v4;
  v6 = (uint64_t)v3 < (uint64_t)v4;
  if (((*(_DWORD *)(result + 44) + 1178560073
                                  * (((_DWORD)result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45)) & 1) != 0)
    v5 = v6;
  if (!v5)
    v2 = *(_DWORD *)(result + 40) - 1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45);
  *(_DWORD *)(result + 16) = v2 ^ (*(_DWORD *)(result + 24)
                                 - 1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45));
  return result;
}

uint64_t sub_100046698(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  _BOOL4 v10;

  v1 = 1374699841
     * (((result ^ 0x1C901A3C001822A1) & 0x1FB61EFE8E9BEAE7 | (result ^ 0xE008E10020040010) & 0xE049E10171641518) ^ 0xF29465304DE83AB8);
  v2 = *(_DWORD *)(result + 36) + v1;
  v3 = *(_DWORD *)result ^ v1;
  v4 = *(_QWORD *)(result + 8);
  v5 = v4 - v1;
  v6 = *(_DWORD *)(result + 32) - v1;
  v7 = *(_QWORD *)(result + 24);
  v8 = v7 - v1;
  v9 = *(_DWORD *)(result + 4) + v1;
  if ((v3 & 1) != 0)
    v10 = v8 > v5;
  else
    v10 = v7 == v4;
  if (v10)
    v2 = v6;
  *(_DWORD *)(result + 16) = v2 ^ v9;
  return result;
}

uint64_t sub_100046750(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t result;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;

  v2 = 1374699841 * ((2 * (a1 & 0x2C1640CD) - a1 + 1407827762) ^ 0x3E1DA73B);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(a1 + 40) ^ v2;
  v8 = *(_DWORD *)a1 - 368399995 + v2;
  v9 = 235795823 * ((&v11 & 0xF4A3154B | ~(&v11 | 0xF4A3154B)) ^ 0x9FF1A3ED);
  v16 = v9 ^ (v8 + 1635);
  v17 = v4;
  v13 = v5;
  v14 = v3;
  v11 = v6;
  v12 = v9 + (v7 ^ 0xAA53EF36) - 65603814 + ((2 * v7) & 0xEFF7D7FE ^ 0xAB500192);
  result = ((uint64_t (*)(uint64_t *))*(&off_10005BF50 + v8))(&v11);
  *(_DWORD *)(a1 + 48) = v15;
  return result;
}

uint64_t sub_1000468A4(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 88) = 17;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1000468C4(uint64_t result)
{
  unint64_t v1;
  int v2;
  unint64_t v3;
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v1 = 1759421093
     * ((-2 - ((~result | 0xA799CC8FED74AA68) + (result | 0x58663370128B5597))) ^ 0x89270DDF5E091A3CLL);
  v2 = *(_DWORD *)(result + 20) ^ v1;
  v3 = *(_QWORD *)(result + 24) + v1;
  v4 = *(_DWORD *)(result + 4) + v1;
  v5 = *(_DWORD *)(result + 32) ^ v1;
  v6 = *(_QWORD *)(result + 8) - v1;
  v7 = *(_DWORD *)(result + 16) ^ v1;
  v8 = v3 >= v6;
  v9 = v3 != v6;
  if ((v2 & 1) != 0)
    v10 = v8;
  else
    v10 = v9;
  if (v10)
    v7 = v4;
  *(_DWORD *)(result + 36) = v5 ^ v7;
  return result;
}

void sub_10004696C(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  uint64_t v3;

  v1 = *a1 - 1224239923 * ((a1 & 0x3B94B05C | ~(a1 | 0x3B94B05C)) ^ 0x36D8B274);
  v3 = *(_QWORD *)((char *)*(&off_10005BF50 + (int)(v1 ^ 0x7F7DFDFB)) - 4);
  v2 = v1
     + 628203409 * ((2 * (&v2 & 0x6DC59F68) - &v2 - 1841667952) ^ 0x10B26CA3)
     - 2138962649;
  sub_100013A00((uint64_t)&v2);
}

uint64_t sub_100046A5C(unsigned int a1)
{
  return byte_1000578C0[byte_100053BE0[a1] ^ 0x9A] ^ a1;
}

uint64_t sub_100046A88(unsigned int a1)
{
  return byte_100053CE0[byte_10004F0C0[a1] ^ 8] ^ a1;
}

uint64_t sub_100046AB0(unsigned int a1)
{
  return byte_10004F1C0[byte_10004BDA0[a1] ^ 0xC2] ^ a1;
}

uint64_t sub_100046ADC(unsigned int a1)
{
  return byte_10004BEA0[byte_1000579C0[a1] ^ 0x21] ^ a1;
}

uint64_t sub_100046B08(unsigned int a1)
{
  return byte_100057AC0[byte_100053DE0[a1] ^ 0x52] ^ a1;
}

uint64_t sub_100046B34(unsigned int a1)
{
  return byte_10004BEA0[byte_1000579C0[a1] ^ 0xAB] ^ a1;
}

uint64_t sub_100046B60(unsigned int a1)
{
  return byte_100057AC0[byte_100053DE0[a1] ^ 0x7C] ^ a1;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_makeDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeDictionary");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
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

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
