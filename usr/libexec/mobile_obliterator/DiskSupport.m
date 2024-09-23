@implementation DiskSupport

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000078A8;
  block[3] = &unk_100024B98;
  block[4] = a1;
  if (qword_100028900 != -1)
    dispatch_once(&qword_100028900, block);
  return (id)qword_1000288F8;
}

- (DiskSupport)init
{
  DiskSupport *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DiskSupport;
  result = -[DiskSupport init](&v3, "init");
  if (result)
    result->_dryRunOnly = 0;
  return result;
}

- (BOOL)traverseFolderAndRemoveItems:(id)a3 exceptions:(id)a4
{
  unsigned int v6;
  _UNKNOWN **v7;
  const char *v8;
  NSString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *CStringPtr;
  const char *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  const __CFString *v32;
  const __CFString *v33;
  const char *v34;
  const char *v35;
  __CFString *v36;
  id v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  const char *v41;
  const char *v42;
  unsigned __int8 v43;
  const char *v44;
  unsigned __int8 v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *j;
  void *v52;
  uint64_t v53;
  id v54;
  const __CFString *v55;
  const __CFString *v56;
  const char *v57;
  const char *v58;
  id v59;
  NSRegularExpression *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *k;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  const __CFString *v72;
  const __CFString *v73;
  id v74;
  const __CFString *v75;
  const __CFString *v76;
  const char *v77;
  const char *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *m;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  id v87;
  char *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  char *v94;
  char *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  const __CFString *v100;
  NSRegularExpression *v101;
  id v102;
  NSArray *v103;
  id v104;
  id v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
  const __CFString *v112;
  const __CFString *v113;
  id v114;
  const __CFString *v115;
  const __CFString *v116;
  const char *v117;
  const char *v118;
  id v119;
  id v120;
  uint64_t v121;
  void *n;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  id v127;
  char *v128;
  id v129;
  id v130;
  id v131;
  char *v132;
  char *v133;
  id v134;
  void *v135;
  id v136;
  id v137;
  BOOL result;
  void *v139;
  id v140;
  uint64_t v141;
  id v142;
  id v143;
  const __CFString *v144;
  const __CFString *v145;
  const char *v146;
  const char *v147;
  void *v148;
  id v149;
  uint64_t v150;
  const __CFString *v151;
  const char *v152;
  const char *v153;
  const __CFString *v154;
  const char *v155;
  const __CFString *v156;
  unsigned int v157;
  NSArray *v159;
  id v160;
  NSArray *obj;
  uint64_t v162;
  id v163;
  unsigned __int8 v164;
  uint64_t v165;
  void *v166;
  id v167;
  uint64_t v168;
  id v169;
  uint64_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
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
  _QWORD v203[3];
  _BYTE v204[128];
  _BYTE v205[128];
  _QWORD v206[3];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];

  v6 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", off_1000286A0), "isEqualToString:", CFSTR("remove"));
  obj = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  v7 = &AKSIdentityCreateFirst_ptr;
  v8 = "Keeping";
  v157 = v6;
  if (v6)
    v8 = "Removing";
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s the contents of '%@' (exceptionList: %@)"), v8, a3, a4);
  v10 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v9);
  if (v10)
  {
    v11 = v10;
    CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
    if (CStringPtr)
      v13 = CStringPtr;
    else
      v13 = "<error getting string>";
    sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v13);
    CFRelease(v11);
  }
  else
  {
    sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
  }
  free(v9);
  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v163 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
  if (!v163)
    return 1;
  v14 = &AKSIdentityCreateFirst_ptr;
  v162 = *(_QWORD *)v200;
  v167 = a3;
  while (2)
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v200 != v162)
        objc_enumerationMutation(obj);
      v168 = v15;
      v16 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * v15);
      v169 = objc_msgSend(v7[143], "pathWithComponents:", objc_msgSend(v14[139], "arrayWithObjects:", a3, v16, 0));
      v17 = (__CFString *)objc_msgSend(a4, "objectForKeyedSubscript:", v16);
      if (v17)
      {
LABEL_42:
        v37 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("Found exception '%@' for '%@'"), v17, v16, v156);
      }
      else
      {
        v197 = 0u;
        v198 = 0u;
        v195 = 0u;
        v196 = 0u;
        v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v195, v211, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v196;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v196 != v20)
                objc_enumerationMutation(a4);
              v22 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * (_QWORD)i);
              if (!objc_msgSend(v22, "rangeOfString:", objc_msgSend(v7[143], "stringWithFormat:", CFSTR("%@/"), v16)))
              {
                v31 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("==> auto-traverse due to '%@'"), objc_msgSend(v22, "substringWithRange:", v23, (char *)objc_msgSend(v22, "length") - v23));
                v32 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v31);
                if (v32)
                {
                  v33 = v32;
                  v34 = CFStringGetCStringPtr(v32, 0x8000100u);
                  v35 = "<error getting string>";
                  if (v34)
                    v35 = v34;
                  sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v35);
                  CFRelease(v33);
                }
                else
                {
                  sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
                }
                free(v31);
                v17 = CFSTR("traverse");
                goto LABEL_42;
              }
            }
            v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v195, v211, 16);
            if (v19)
              continue;
            break;
          }
        }
        v193 = 0u;
        v194 = 0u;
        v191 = 0u;
        v192 = 0u;
        v24 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v191, v210, 16);
        if (!v24)
        {
LABEL_31:
          a3 = v167;
          v14 = &AKSIdentityCreateFirst_ptr;
          v30 = v169;
          if ((v157 & 1) == 0)
            goto LABEL_69;
          goto LABEL_68;
        }
        v25 = v24;
        v26 = *(_QWORD *)v192;
LABEL_25:
        v27 = 0;
        while (1)
        {
          if (*(_QWORD *)v192 != v26)
            objc_enumerationMutation(a4);
          v28 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * v27);
          -[NSRegularExpression rangeOfFirstMatchInString:options:range:](+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v28, 0, 0), "rangeOfFirstMatchInString:options:range:", v16, 0, 0, objc_msgSend(v16, "length"));
          if (v29 == objc_msgSend(v16, "length"))
            break;
          if (v25 == (id)++v27)
          {
            v25 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v191, v210, 16);
            if (v25)
              goto LABEL_25;
            goto LABEL_31;
          }
        }
        v36 = (__CFString *)objc_msgSend(a4, "objectForKeyedSubscript:", v28);
        if (!v36)
        {
          a3 = v167;
          v14 = &AKSIdentityCreateFirst_ptr;
          v30 = v169;
          if (v157)
            goto LABEL_68;
          goto LABEL_69;
        }
        v17 = v36;
        if (!v28)
          goto LABEL_42;
        v37 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("Found regexp-exception '%@' for '%@', regexp '%@'"), v36, v16, v28);
      }
      v38 = v37;
      v39 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v37);
      if (v39)
      {
        v40 = v39;
        v41 = CFStringGetCStringPtr(v39, 0x8000100u);
        v42 = "<error getting string>";
        if (v41)
          v42 = v41;
        sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v42);
        CFRelease(v40);
      }
      else
      {
        sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
      }
      free(v38);
      v43 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("remove"));
      v44 = "removed";
      if ((v43 & 1) != 0)
        goto LABEL_61;
      v45 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("keep"));
      v44 = "kept";
      if ((v45 & 1) != 0)
        goto LABEL_61;
      if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("traverse")))
      {
        v164 = v43;
        v46 = objc_alloc_init((Class)NSMutableDictionary);
        v47 = objc_msgSend(a4, "objectForKeyedSubscript:", off_1000286A0);
        objc_msgSend(v46, "setObject:forKey:", v47, off_1000286A0);
        v189 = 0u;
        v190 = 0u;
        v187 = 0u;
        v188 = 0u;
        v48 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v187, v209, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v188;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(_QWORD *)v188 != v50)
                objc_enumerationMutation(a4);
              v52 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * (_QWORD)j);
              if (!objc_msgSend(v52, "rangeOfString:", objc_msgSend(v16, "stringByAppendingString:", CFSTR("/"))))
                objc_msgSend(v46, "setObject:forKey:", objc_msgSend(a4, "objectForKeyedSubscript:", v52), objc_msgSend(v52, "substringWithRange:", v53, (char *)objc_msgSend(v52, "length") - v53));
            }
            v49 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v187, v209, 16);
          }
          while (v49);
        }
        -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", v169, v46);
        v44 = "kept";
        v7 = &AKSIdentityCreateFirst_ptr;
        v43 = v164;
LABEL_61:
        v54 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("According to rules, '%@' will be %s"), v16, v44);
        v55 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v54);
        v30 = v169;
        if (v55)
        {
          v56 = v55;
          v57 = CFStringGetCStringPtr(v55, 0x8000100u);
          if (v57)
            v58 = v57;
          else
            v58 = "<error getting string>";
          sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v58);
          CFRelease(v56);
        }
        else
        {
          sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
        }
        a3 = v167;
        v14 = &AKSIdentityCreateFirst_ptr;
        free(v54);
        if ((v43 & 1) == 0)
          goto LABEL_69;
LABEL_68:
        v170 = 0;
        if (!-[DiskSupport removeFSItem:error:](self, "removeFSItem:error:", v30, &v170))
        {
          v143 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("Error: Failed to delete '%@' with error %@!"), v30, v170);
          v144 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v143);
          if (!v144)
            goto LABEL_160;
          v145 = v144;
          v146 = CFStringGetCStringPtr(v144, 0x8000100u);
          if (v146)
            v147 = v146;
          else
            v147 = "<error getting string>";
LABEL_152:
          sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v147);
LABEL_159:
          CFRelease(v145);
          goto LABEL_161;
        }
        goto LABEL_69;
      }
      if (-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("removeExcept /")))
      {
        v59 = objc_alloc_init((Class)NSMutableDictionary);
        v60 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("/([^/]+)/[ \t]*([^ \t/]*)"), 0, 0);
        v61 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", objc_msgSend(CFSTR("removeExcept "), "length"));
        v62 = v59;
        objc_msgSend(v59, "setObject:forKey:", CFSTR("remove"), off_1000286A0);
        v185 = 0u;
        v186 = 0u;
        v183 = 0u;
        v184 = 0u;
        v63 = v61;
        v159 = -[NSRegularExpression matchesInString:options:range:](v60, "matchesInString:options:range:", v61, 0, 0, objc_msgSend(v61, "length"));
        v64 = -[NSArray countByEnumeratingWithState:objects:count:](v159, "countByEnumeratingWithState:objects:count:", &v183, v208, 16);
        if (v64)
        {
          v65 = v64;
          v165 = *(_QWORD *)v184;
          while (2)
          {
            for (k = 0; k != v65; k = (char *)k + 1)
            {
              if (*(_QWORD *)v184 != v165)
                objc_enumerationMutation(v159);
              v67 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * (_QWORD)k);
              objc_msgSend(v67, "rangeAtIndex:", 2);
              if (v68)
              {
                v139 = v7[143];
                v140 = objc_msgSend(v67, "rangeAtIndex:", 2);
                v142 = objc_msgSend(v139, "stringWithFormat:", CFSTR("Exception '%@' for '%@' is ill-formatted - found extra string '%@' or missing '/'!"), v63, v16, objc_msgSend(v63, "substringWithRange:", v140, v141));
                goto LABEL_154;
              }
              v69 = objc_msgSend(v67, "rangeAtIndex:", 1);
              v71 = objc_msgSend(v63, "substringWithRange:", v69, v70);
              v72 = (const __CFString *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v7[143], "stringWithFormat:", CFSTR("%@/%@"), v16, v71));
              if (v72)
              {
                v73 = v72;
                v156 = v72;
                v74 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("==> removeExcept for '%@/%@' has rule '%@', using it instead of 'keep'"), v16, v71);
                v75 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v74);
                if (v75)
                {
                  v76 = v75;
                  v77 = CFStringGetCStringPtr(v75, 0x8000100u);
                  if (v77)
                    v78 = v77;
                  else
                    v78 = "<error getting string>";
                  sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v78);
                  CFRelease(v76);
                }
                else
                {
                  sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
                }
                free(v74);
                v7 = &AKSIdentityCreateFirst_ptr;
              }
              else
              {
                v73 = CFSTR("keep");
              }
              objc_msgSend(v62, "setObject:forKey:", v73, v71);
            }
            v65 = -[NSArray countByEnumeratingWithState:objects:count:](v159, "countByEnumeratingWithState:objects:count:", &v183, v208, 16);
            if (v65)
              continue;
            break;
          }
        }
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        v79 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v179, v207, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v180;
          do
          {
            for (m = 0; m != v80; m = (char *)m + 1)
            {
              if (*(_QWORD *)v180 != v81)
                objc_enumerationMutation(a4);
              v83 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)m);
              if (!objc_msgSend(v83, "rangeOfString:", objc_msgSend(v7[143], "stringWithFormat:", CFSTR("%@/"), v16)))
              {
                v85 = v84;
                v86 = (char *)objc_msgSend(v83, "length") - v84;
                v87 = objc_msgSend(a4, "objectForKeyedSubscript:", v83);
                v88 = v86;
                v7 = &AKSIdentityCreateFirst_ptr;
                objc_msgSend(v62, "setObject:forKey:", v87, objc_msgSend(v83, "substringWithRange:", v85, v88));
              }
            }
            v80 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v179, v207, 16);
          }
          while (v80);
        }
LABEL_135:
        -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", v169, v62);
        a3 = v167;
        v14 = &AKSIdentityCreateFirst_ptr;
        goto LABEL_69;
      }
      if (-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("removeExcept ")))
      {
        v89 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v89, "setObject:forKey:", CFSTR("remove"), off_1000286A0);
        v90 = -[__CFString rangeOfString:](v17, "rangeOfString:", CFSTR("/"));
        v91 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", objc_msgSend(CFSTR("removeExcept "), "length"));
        v92 = v91;
        if (v90 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v93 = objc_msgSend(v91, "componentsSeparatedByString:", CFSTR("/"));
          v94 = (char *)objc_msgSend(v93, "count");
          if ((uint64_t)(v94 - 2) >= 0)
          {
            v95 = v94 - 1;
            do
            {
              v96 = objc_msgSend(v7[143], "pathWithComponents:", objc_msgSend(v93, "subarrayWithRange:", 0, v95));
              v97 = v7[143];
              v206[0] = v167;
              v206[1] = v16;
              v206[2] = v96;
              v98 = objc_msgSend(v97, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v206, 3));
              objc_msgSend(v89, "setObject:forKey:", CFSTR("keep"), objc_msgSend(v93, "objectAtIndexedSubscript:", v95));
              -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", v98, v89);
              objc_msgSend(v89, "removeObjectForKey:", objc_msgSend(v93, "objectAtIndexedSubscript:", v95--));
            }
            while (v95);
          }
          v92 = objc_msgSend(v93, "objectAtIndexedSubscript:", 0);
        }
        v99 = v89;
        v100 = CFSTR("keep");
      }
      else
      {
        if (-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("keepExcept /")))
        {
          v62 = objc_alloc_init((Class)NSMutableDictionary);
          v101 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("/([^/]+)/ *"), 0, 0);
          v102 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", objc_msgSend(CFSTR("keepExcept "), "length"));
          objc_msgSend(v62, "setObject:forKey:", CFSTR("keep"), off_1000286A0);
          v177 = 0u;
          v178 = 0u;
          v175 = 0u;
          v176 = 0u;
          v166 = v102;
          v103 = -[NSRegularExpression matchesInString:options:range:](v101, "matchesInString:options:range:", v102, 0, 0, objc_msgSend(v102, "length"));
          v104 = -[NSArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v175, v205, 16);
          if (v104)
          {
            v105 = v104;
            v160 = *(id *)v176;
LABEL_111:
            v106 = 0;
            while (1)
            {
              if (*(id *)v176 != v160)
                objc_enumerationMutation(v103);
              v107 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v106);
              objc_msgSend(v107, "rangeAtIndex:", 2);
              if (v108)
                break;
              v109 = objc_msgSend(v107, "rangeAtIndex:", 1);
              v111 = objc_msgSend(v166, "substringWithRange:", v109, v110);
              v112 = (const __CFString *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v7[143], "stringWithFormat:", CFSTR("%@/%@"), v16, v111));
              if (v112)
              {
                v113 = v112;
                v156 = v112;
                v114 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("==> keepExcept for '%@/%@' has rule '%@', using it instead of 'remove'"), v16, v111);
                v115 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v114);
                if (v115)
                {
                  v116 = v115;
                  v117 = CFStringGetCStringPtr(v115, 0x8000100u);
                  if (v117)
                    v118 = v117;
                  else
                    v118 = "<error getting string>";
                  sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v118);
                  CFRelease(v116);
                }
                else
                {
                  sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
                }
                free(v114);
                v7 = &AKSIdentityCreateFirst_ptr;
              }
              else
              {
                v113 = CFSTR("remove");
              }
              objc_msgSend(v62, "setObject:forKey:", v113, v111);
              if (v105 == (id)++v106)
              {
                v105 = -[NSArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v175, v205, 16);
                if (v105)
                  goto LABEL_111;
                goto LABEL_126;
              }
            }
            v148 = v7[143];
            v149 = objc_msgSend(v107, "rangeAtIndex:", 2);
            v142 = objc_msgSend(v148, "stringWithFormat:", CFSTR("Exception '%@' for '%@' is ill-formatted - found extra string '%@' or missing '/'!"), v166, v16, objc_msgSend(v166, "substringWithRange:", v149, v150));
LABEL_154:
            v143 = v142;
            v151 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v142);
            if (v151)
            {
              v145 = v151;
              v152 = CFStringGetCStringPtr(v151, 0x8000100u);
              if (v152)
                v153 = v152;
              else
                v153 = "<error getting string>";
              sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v153);
              goto LABEL_159;
            }
            goto LABEL_160;
          }
LABEL_126:
          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          v119 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v171, v204, 16);
          if (v119)
          {
            v120 = v119;
            v121 = *(_QWORD *)v172;
            do
            {
              for (n = 0; n != v120; n = (char *)n + 1)
              {
                if (*(_QWORD *)v172 != v121)
                  objc_enumerationMutation(a4);
                v123 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)n);
                if (!objc_msgSend(v123, "rangeOfString:", objc_msgSend(v7[143], "stringWithFormat:", CFSTR("%@/"), v16)))
                {
                  v125 = v124;
                  v126 = (char *)objc_msgSend(v123, "length") - v124;
                  v127 = objc_msgSend(a4, "objectForKeyedSubscript:", v123);
                  v128 = v126;
                  v7 = &AKSIdentityCreateFirst_ptr;
                  objc_msgSend(v62, "setObject:forKey:", v127, objc_msgSend(v123, "substringWithRange:", v125, v128));
                }
              }
              v120 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v171, v204, 16);
            }
            while (v120);
          }
          goto LABEL_135;
        }
        if (!-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("keepExcept ")))
        {
          v143 = objc_msgSend(v7[143], "stringWithFormat:", CFSTR("Exception '%@' for '%@' is ill-formatted!"), v17, v16);
          v154 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v143);
          if (v154)
          {
            v145 = v154;
            v155 = CFStringGetCStringPtr(v154, 0x8000100u);
            v147 = "<error getting string>";
            if (v155)
              v147 = v155;
            goto LABEL_152;
          }
LABEL_160:
          sub_10000489C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", "<error getting string>");
LABEL_161:
          free(v143);
          return 0;
        }
        v89 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v89, "setObject:forKey:", CFSTR("keep"), off_1000286A0);
        v129 = -[__CFString rangeOfString:](v17, "rangeOfString:", CFSTR("/"));
        v130 = -[__CFString substringFromIndex:](v17, "substringFromIndex:", objc_msgSend(CFSTR("keepExcept "), "length"));
        v92 = v130;
        if (v129 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v131 = objc_msgSend(v130, "componentsSeparatedByString:", CFSTR("/"));
          v132 = (char *)objc_msgSend(v131, "count");
          if ((uint64_t)(v132 - 2) >= 0)
          {
            v133 = v132 - 1;
            do
            {
              v134 = objc_msgSend(v7[143], "pathWithComponents:", objc_msgSend(v131, "subarrayWithRange:", 0, v133));
              v135 = v7[143];
              v203[0] = v167;
              v203[1] = v16;
              v203[2] = v134;
              v136 = objc_msgSend(v135, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v203, 3));
              objc_msgSend(v89, "setObject:forKey:", CFSTR("remove"), objc_msgSend(v131, "objectAtIndexedSubscript:", v133));
              -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", v136, v89);
              objc_msgSend(v89, "removeObjectForKey:", objc_msgSend(v131, "objectAtIndexedSubscript:", v133--));
            }
            while (v133);
          }
          v92 = objc_msgSend(v131, "objectAtIndexedSubscript:", 0);
        }
        v99 = v89;
        v100 = CFSTR("remove");
      }
      objc_msgSend(v99, "setObject:forKey:", v100, v92);
      -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", v169, v89);
      a3 = v167;
      v14 = &AKSIdentityCreateFirst_ptr;
LABEL_69:
      v15 = v168 + 1;
    }
    while ((id)(v168 + 1) != v163);
    v137 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
    result = 1;
    v163 = v137;
    if (v137)
      continue;
    return result;
  }
}

- (BOOL)removeFSItem:(id)a3 error:(id *)a4
{
  NSString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *CStringPtr;
  const char *v11;

  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Deleting FS item '%@'"), a3);
  v8 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v7);
  if (v8)
  {
    v9 = v8;
    CStringPtr = CFStringGetCStringPtr(v8, 0x8000100u);
    v11 = "<error getting string>";
    if (CStringPtr)
      v11 = CStringPtr;
    sub_10000489C(1, "%s: %s", "-[DiskSupport removeFSItem:error:]", v11);
    CFRelease(v9);
  }
  else
  {
    sub_10000489C(1, "%s: %s", "-[DiskSupport removeFSItem:error:]", "<error getting string>");
  }
  free(v7);
  if (-[DiskSupport dryRunOnly](self, "dryRunOnly"))
    return 1;
  else
    return -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", a3, a4);
}

- (BOOL)dryRunOnly
{
  return self->_dryRunOnly;
}

- (void)setDryRunOnly:(BOOL)a3
{
  self->_dryRunOnly = a3;
}

@end
