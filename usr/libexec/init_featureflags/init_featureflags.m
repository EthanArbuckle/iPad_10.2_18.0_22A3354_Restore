char **sub_100002164()
{
  return off_100008138;
}

uint64_t start(int a1, const char **a2)
{
  const char *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  size_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  void *v53;
  FILE *v54;
  id v55;
  const char *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  size_t v60;
  id v61;
  id v62;
  id v63;
  void *k;
  void *v65;
  id v66;
  const char *v67;
  size_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  const char *v78;
  _QWORD *v79;
  BOOL v80;
  size_t v81;
  int v82;
  uint64_t v83;
  int64_t v84;
  unsigned int v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _OWORD *v100;
  _QWORD *v101;
  __int128 v102;
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  void *m;
  void *v109;
  void *v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  _QWORD *v114;
  _QWORD *v115;
  char *v116;
  int v117;
  uint64_t v118;
  int64_t v119;
  unsigned int v120;
  int v121;
  int v122;
  void *v123;
  void *v124;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  int *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  id v175;
  void *context;
  int contexta;
  id obj;
  id obja;
  id objb;
  uint64_t v181;
  void *v182;
  id v183;
  id v184;
  id v185;
  void *__nel;
  size_t __nela;
  size_t __nelb;
  size_t __nelc;
  void *v190;
  void *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _QWORD v205[16];
  _QWORD v206[16];
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  _BYTE v215[128];
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;

  if (a1 >= 2)
  {
    v4 = a2[1];
    if (!strcmp(v4, "-n"))
    {
      byte_100008150 = 1;
      byte_100008151 = 1;
    }
    if (!strcmp(v4, "-v"))
      ++dword_100008154;
    if (a1 >= 3)
    {
      if (!strcmp(a2[2], "-v"))
        ++dword_100008154;
      if (a1 >= 4 && !strcmp(a2[3], "-v"))
        ++dword_100008154;
    }
  }
  v174 = objc_autoreleasePoolPush();
  if (os_variant_allows_internal_security_policies("com.apple.featureflags") && (byte_100008151 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v205[0] = NSFileOwnerAccountID;
    v205[1] = NSFileGroupOwnerAccountID;
    v206[0] = &off_100004388;
    v206[1] = &off_100004388;
    v205[2] = NSFilePosixPermissions;
    v206[2] = &off_1000043A0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v206, v205, 3));
    *(_QWORD *)&v211 = NSFileOwnerAccountID;
    *((_QWORD *)&v211 + 1) = NSFileGroupOwnerAccountID;
    *(_QWORD *)&v216 = &off_100004388;
    *((_QWORD *)&v216 + 1) = &off_100004388;
    *(_QWORD *)&v212 = NSFilePosixPermissions;
    *(_QWORD *)&v217 = &off_1000043B8;
    v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v216, &v211, 3));
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100002164()[1]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v183 = (id)v6;
    *(_QWORD *)&v196 = 0;
    if (objc_msgSend(v5, "fileExistsAtPath:", v8))
      v9 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v6, v8, &v196);
    else
      v9 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, v6, &v196);
    v10 = v9;
    v11 = (id)v196;
    if ((v10 & 1) == 0)
    {
      v12 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
      objc_msgSend(v13, "UTF8String");
      sub_100002F0C(CFSTR("Failed to create or configure directory %s: %s"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v12);

    }
    v209 = 0u;
    v210 = 0u;
    v207 = 0u;
    v208 = 0u;
    *(_QWORD *)&v192 = v11;
    __nel = v5;
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v8, &v192));
    v23 = (id)v192;

    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v207, v215, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v208;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v208 != v26)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * (_QWORD)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pathExtension"));
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("plist"));

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v28));
            *(_QWORD *)&v202 = v23;
            v32 = objc_msgSend(__nel, "setAttributes:ofItemAtPath:error:", v190, v31, &v202);
            v33 = (id)v202;

            if ((v32 & 1) == 0)
            {
              v34 = objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
              v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "description")));
              objc_msgSend(v35, "UTF8String");
              sub_100002F0C(CFSTR("Failed to set permissions for file %s: %s"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)v34);

            }
            v23 = v33;
          }
        }
        v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v207, v215, 16);
      }
      while (v25);
    }

  }
  v43 = objc_alloc_init((Class)NSMutableArray);
  v44 = objc_msgSend(objc_alloc((Class)FFConfiguration), "initPrivateForBootTask");
  context = objc_autoreleasePoolPush();
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "domains"));
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  obj = v45;
  v191 = v44;
  v184 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v196, v206, 16);
  if (v184)
  {
    v181 = *(_QWORD *)v197;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v197 != v181)
          objc_enumerationMutation(obj);
        __nela = v46;
        v47 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "featuresForDomain:", v47));
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v192, v205, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v193;
          do
          {
            for (j = 0; j != v50; j = (char *)j + 1)
            {
              if (*(_QWORD *)v193 != v51)
                objc_enumerationMutation(v48);
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stateForFeature:domain:level:", *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)j), v47, 4));
              if (v53)
                objc_msgSend(v43, "addObject:", v53);
              if (dword_100008154 >= 2)
              {
                v54 = __stderrp;
                v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "name")));
                v56 = (const char *)objc_msgSend(v55, "UTF8String");
                v57 = objc_msgSend(v53, "value");
                v58 = "disabled";
                if (v57 == (id)1)
                  v58 = "enabled";
                fprintf(v54, "Feature %s = %s\n", v56, v58);

                v44 = v191;
              }

            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v192, v205, 16);
          }
          while (v50);
        }

        v46 = __nela + 1;
      }
      while ((id)(__nela + 1) != v184);
      v184 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v196, v206, 16);
    }
    while (v184);
  }

  objc_autoreleasePoolPop(context);
  v175 = v43;
  v59 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v60 = 0;
  contexta = 0;
  v203 = 0u;
  v204 = 0u;
  v200 = *(_OWORD *)"FEATFLAG";
  v201 = *(_OWORD *)&algn_100003A29[7];
  v202 = 0u;
  v182 = (void *)v59;
  do
  {
    arc4random_buf((char *)&v201 + 8, 8uLL);
    v218 = 0u;
    v219 = 0u;
    v216 = 0u;
    v217 = 0u;
    v185 = v175;
    v61 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v216, v215, 16);
    if (v61)
    {
      v62 = v61;
      __nelb = 0;
      v63 = *(id *)v217;
      obja = *(id *)v217;
      while (2)
      {
        for (k = 0; k != v62; k = (char *)k + 1)
        {
          if (*(id *)v217 != v63)
            objc_enumerationMutation(v185);
          v65 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * (_QWORD)k);
          v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "name")));
          v67 = (const char *)objc_msgSend(v66, "UTF8String");

          v68 = strlen(v67);
          if (v68 < 0x401)
          {
            v76 = *((_QWORD *)&v201 + 1) ^ (0xC6A4A7935BD1E995 * v68);
            *(_QWORD *)&v202 = v68;
            *((_QWORD *)&v202 + 1) = v76;
            *(_QWORD *)&v203 = 0;
            DWORD2(v203) = 0;
            v77 = (unint64_t)&v67[v68];
            v78 = v67;
            if (v68 >= 0x10)
            {
              do
              {
                v76 = 0xC6A4A7935BD1E995
                    * ((0xC6A4A7935BD1E995
                      * ((0xC6A4A7935BD1E995
                        * ((0xC6A4A7935BD1E995 * *(_QWORD *)v78) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v78) >> 47))) ^ v76)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v78 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v78 + 1)) >> 47))));
                v79 = v78 + 32;
                v78 += 16;
              }
              while ((unint64_t)v79 <= v77);
            }
            if ((unint64_t)(v78 + 8) <= v77)
            {
              do
              {
                v76 = 0xC6A4A7935BD1E995
                    * ((0xC6A4A7935BD1E995
                      * ((0xC6A4A7935BD1E995 * *(_QWORD *)v78) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v78) >> 47))) ^ v76);
                v80 = (unint64_t)(v78 + 16) > v77;
                v78 += 8;
              }
              while (!v80);
            }
            v81 = v60;
            if ((unint64_t)v78 >= v77)
            {
              v83 = 0;
              v82 = 0;
            }
            else
            {
              v82 = 0;
              v83 = 0;
              v84 = &v67[v68] - v78;
              do
              {
                v85 = *(unsigned __int8 *)v78++;
                v83 |= (unint64_t)v85 << v82;
                v82 += 8;
                --v84;
              }
              while (v84);
            }
            *(_QWORD *)&v202 = 0;
            *((_QWORD *)&v202 + 1) = v76;
            *(_QWORD *)&v203 = v83;
            DWORD2(v203) = v82;
            v86 = sub_100003008((uint64_t)&v202);
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v86));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "objectForKeyedSubscript:", v87));

            if (v88)
            {
              objc_msgSend(v182, "removeAllObjects");
              v60 = 0;
              goto LABEL_79;
            }
            v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v86));
            objc_msgSend(v182, "setObject:forKeyedSubscript:", v65, v89);

            if (objc_msgSend(v65, "value") == (id)1)
              v60 = v81 + 1;
            else
              v60 = v81;
            v63 = obja;
          }
          else
          {
            sub_100002F94(v68, v69, v70, v71, v72, v73, v74, v75, (uint64_t)v67);
            ++__nelb;
          }
        }
        v62 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v216, v215, 16);
        if (v62)
          continue;
        break;
      }
    }
    else
    {
      __nelb = 0;
    }
LABEL_79:

    v90 = (char *)objc_msgSend(v182, "count") + __nelb;
    if (v90 == objc_msgSend(v185, "count"))
      break;
    ++contexta;
  }
  while (contexta != 10);
  v91 = (char *)objc_msgSend(v182, "count") + __nelb;
  if (v91 != objc_msgSend(v185, "count"))
    sub_100003374(CFSTR("hash collision retry reached"), v92, v93, v94, v95, v96, v97, v98, v173);
  v99 = v60;
  v100 = malloc_type_malloc(8 * v60 + 32, 0xA9D2D092uLL);
  if (!v100)
  {
    __error();
    sub_100003374(CFSTR("could not malloc(%zu): %d"), v126, v127, v128, v129, v130, v131, v132, 8 * v60 + 32);
  }
  v101 = v100;
  objb = (id)(8 * v60 + 32);
  v102 = v201;
  *v100 = v200;
  v100[1] = v102;
  *((_QWORD *)v100 + 2) = v60;
  if (dword_100008154 >= 1)
    fprintf(__stderrp, "Generating hash table with %zu enabled features of %lu known\n", v60, objc_msgSend(v182, "count"));
  __nelc = v60;
  v213 = 0u;
  v214 = 0u;
  v211 = 0u;
  v212 = 0u;
  v103 = v182;
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v211, &v207, 16);
  if (v104)
  {
    v105 = v104;
    v106 = 0;
    v107 = *(_QWORD *)v212;
    do
    {
      for (m = 0; m != v105; m = (char *)m + 1)
      {
        if (*(_QWORD *)v212 != v107)
          objc_enumerationMutation(v103);
        v109 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * (_QWORD)m);
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", v109));
        if (objc_msgSend(v110, "value") == (id)1)
          v101[v106++ + 4] = objc_msgSend(v109, "unsignedLongLongValue");

      }
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v211, &v207, 16);
    }
    while (v105);
  }

  qsort_b(v101 + 4, __nelc, 8uLL, &stru_1000041B8);
  v111 = *((_QWORD *)&v201 + 1) ^ (0x35253C9ADE8F4CA8 * __nelc);
  *(_QWORD *)&v202 = v99 * 8;
  *((_QWORD *)&v202 + 1) = v111;
  *(_QWORD *)&v203 = 0;
  DWORD2(v203) = 0;
  v112 = (unint64_t)&v101[v99 + 4];
  if ((unint64_t)(v101 + 6) <= v112)
  {
    v114 = v101 + 4;
    do
    {
      v111 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v114) ^ ((0xC6A4A7935BD1E995 * *v114) >> 47))) ^ v111)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v114[1]) ^ ((0xC6A4A7935BD1E995 * v114[1]) >> 47))));
      v113 = (char *)(v114 + 2);
      v115 = v114 + 4;
      v114 += 2;
    }
    while ((unint64_t)v115 <= v112);
  }
  else
  {
    v113 = (char *)(v101 + 4);
  }
  if ((unint64_t)(v113 + 8) <= v112)
  {
    do
    {
      v116 = v113 + 8;
      v111 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(_QWORD *)v113) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v113) >> 47))) ^ v111);
      v80 = (unint64_t)(v113 + 16) > v112;
      v113 += 8;
    }
    while (!v80);
  }
  else
  {
    v116 = v113;
  }
  if ((unint64_t)v116 >= v112)
  {
    v118 = 0;
    v117 = 0;
  }
  else
  {
    v117 = 0;
    v118 = 0;
    v119 = (char *)&v101[v99 + 4] - v116;
    do
    {
      v120 = *v116++;
      v118 |= (unint64_t)v120 << v117;
      v117 += 8;
      --v119;
    }
    while (v119);
  }
  *(_QWORD *)&v202 = 0;
  *((_QWORD *)&v202 + 1) = v111;
  *(_QWORD *)&v203 = v118;
  DWORD2(v203) = v117;
  v101[1] = sub_100003008((uint64_t)&v202);

  if ((byte_100008150 & 1) == 0)
  {
    v121 = shm_open("com.apple.featureflags.shm", 2562, 420);
    if (v121 < 0)
    {
      v133 = __error();
      sub_100003374(CFSTR("shm_open failed: %d"), v134, v135, v136, v137, v138, v139, v140, *v133);
    }
    v122 = v121;
    if (ftruncate(v121, (off_t)objb) == -1)
    {
      v141 = __error();
      sub_100003374(CFSTR("failed to size shared memory: %d"), v142, v143, v144, v145, v146, v147, v148, *v141);
    }
    v123 = mmap(0, (size_t)objb, 3, 1, v122, 0);
    if (v123 == (void *)-1)
    {
      v149 = __error();
      sub_100003374(CFSTR("failed to mmap shared memory: %d"), v150, v151, v152, v153, v154, v155, v156, *v149);
    }
    v124 = v123;
    memcpy(v123, v101, (size_t)objb);
    if (munmap(v124, (size_t)objb) == -1)
    {
      v157 = __error();
      sub_100003374(CFSTR("failed to unmap shared memory: %d"), v158, v159, v160, v161, v162, v163, v164, *v157);
    }
    if (close(v122) == -1)
    {
      v165 = __error();
      sub_100003374(CFSTR("failed to close shared memory descriptor: %d"), v166, v167, v168, v169, v170, v171, v172, *v165);
    }
  }

  objc_autoreleasePoolPop(v174);
  return 0;
}

void sub_100002F0C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  FILE *v11;
  id v12;

  v9 = a1;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = __stderrp;
  v12 = objc_retainAutorelease(v10);
  fprintf(v11, "init_featureflags: %s\n", (const char *)objc_msgSend(v12, "UTF8String"));

}

void sub_100002F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  FILE *v10;
  id v11;

  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", CFSTR("feature name is too long: %s - ignored"), &a9);
  v10 = __stderrp;
  v11 = objc_retainAutorelease(v9);
  fprintf(v10, "init_featureflags: %s\n", (const char *)objc_msgSend(v11, "UTF8String"));

}

unint64_t sub_100003008(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  char *v13;
  BOOL v14;
  char *v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  char *v23;
  unsigned __int8 *v24;
  char *v25;
  char *v26;
  unsigned int v27;
  _OWORD v29[2];

  v1 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (!*(_DWORD *)(a1 + 24))
      return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
    goto LABEL_61;
  }
  memset(v29, 0, sizeof(v29));
  if (v1 > 0x1F)
  {
    v2 = *(_QWORD *)(a1 + 8);
    v3 = *(_QWORD *)(a1 + 16);
    v4 = v1;
    v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      v6 = v1 >= 0x20 ? 32 : v1;
      v7 = (char *)v29 + v6;
      if (!v5)
        break;
      if (v6 && v5 <= 0x3F)
      {
        v8 = 0;
        v9 = (char *)v29;
        do
        {
          v10 = v5 + v8;
          v11 = *v9++;
          v3 |= (unint64_t)v11 << (v5 + v8);
          v8 += 8;
        }
        while (v9 < v7 && v10 < 0x38);
        if (v10 > 0x37)
          goto LABEL_18;
        v5 += v8;
      }
      else if (v5 >= 0x40)
      {
        v9 = (char *)v29;
LABEL_18:
        v12 = 0xC6A4A7935BD1E995 * v3;
        v3 = 0;
        v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ v2);
LABEL_19:
        v13 = v9 + 16;
        while (v13 <= v7)
        {
          v2 = 0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v9 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v9 + 1)) >> 47))));
          v13 = v9 + 32;
          v9 += 16;
        }
        if (v9 + 8 <= v7)
        {
          do
          {
            v2 = 0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) >> 47))) ^ v2);
            v14 = v9 + 16 > v7;
            v9 += 8;
          }
          while (!v14);
        }
        if (v9 >= v7)
        {
          v5 = 0;
        }
        else
        {
          v5 = 0;
          v15 = (char *)((char *)v29 + v6 - v9);
          do
          {
            v16 = *v9++;
            v3 |= (unint64_t)v16 << v5;
            v5 += 8;
            --v15;
          }
          while (v15);
        }
      }
      v1 -= v6;
      v4 -= 32;
      if (v4 <= 0x1F)
      {
        *(_QWORD *)a1 = v1;
        *(_QWORD *)(a1 + 8) = v2;
        *(_QWORD *)(a1 + 16) = v3;
        *(_DWORD *)(a1 + 24) = v5;
        goto LABEL_35;
      }
    }
    v9 = (char *)v29;
    goto LABEL_19;
  }
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = v1;
  v5 = *(_DWORD *)(a1 + 24);
LABEL_35:
  if (v1 < v4)
    v4 = v1;
  v17 = (unsigned __int8 *)v29;
  v18 = (unsigned __int8 *)v29 + v4;
  if (v5)
  {
    if (v4 && v5 <= 0x3F)
    {
      v19 = 0;
      v17 = (unsigned __int8 *)v29;
      do
      {
        v20 = v5 + v19;
        v21 = *v17++;
        v3 |= (unint64_t)v21 << (v5 + v19);
        v19 += 8;
      }
      while (v17 < v18 && v20 < 0x38);
      if (v20 <= 0x37)
      {
        v5 += v19;
        goto LABEL_60;
      }
    }
    else
    {
      if (v5 < 0x40)
        goto LABEL_60;
      v17 = (unsigned __int8 *)v29;
    }
    v22 = 0xC6A4A7935BD1E995 * v3;
    v3 = 0;
    v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v22 ^ (v22 >> 47))) ^ v2);
  }
  if (v17 + 16 <= v18)
  {
    do
    {
      v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(_QWORD *)v17) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v17) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v17 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v17 + 1)) >> 47))));
      v23 = (char *)(v17 + 16);
      v24 = v17 + 32;
      v17 += 16;
    }
    while (v24 <= v18);
  }
  else
  {
    v23 = (char *)v17;
  }
  if (v23 + 8 <= (char *)v18)
  {
    do
    {
      v25 = v23 + 8;
      v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * *(_QWORD *)v23) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v23) >> 47))) ^ v2);
      v14 = v23 + 16 > (char *)v18;
      v23 += 8;
    }
    while (!v14);
  }
  else
  {
    v25 = v23;
  }
  if (v25 >= (char *)v18)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v26 = (char *)((char *)v29 + v4 - v25);
    do
    {
      v27 = *v25++;
      v3 |= (unint64_t)v27 << v5;
      v5 += 8;
      --v26;
    }
    while (v26);
  }
LABEL_60:
  *(_QWORD *)a1 = v1 - v4;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = v5;
  if (v5)
LABEL_61:
    v2 = 0xC6A4A7935BD1E995 * (*(_QWORD *)(a1 + 16) ^ v2);
  return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
}

void sub_100003374(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;

  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a1, &a9);
  fprintf(__stderrp, "init_featureflags: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  abort();
}

int sub_1000033D8(id a1, const void *a2, const void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)a2 == *(_QWORD *)a3)
    sub_100003374(CFSTR("duplicate hash found in table: 0x%llx"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, *(_QWORD *)a2);
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return 1;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domains");
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feature");
}

id objc_msgSend_featuresForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featuresForDomain:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_initPrivateForBootTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPrivateForBootTask");
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

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stateForFeature_domain_level_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateForFeature:domain:level:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}
