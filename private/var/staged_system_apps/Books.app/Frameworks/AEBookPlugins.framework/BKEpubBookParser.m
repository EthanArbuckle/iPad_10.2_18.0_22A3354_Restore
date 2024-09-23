@implementation BKEpubBookParser

+ (BOOL)canParse:(id)a3
{
  ITEpubFolder *v3;
  int v4;
  unint64_t v5;
  BOOL v6;

  v3 = (ITEpubFolder *)a3;
  v4 = BookFormatByFilePath();
  if (!v4)
  {
    if (ITEpubFolder::isMimeCorrect(v3, 0, 0, v5))
      v4 = 0;
    else
      v4 = -1;
  }
  v6 = v4 == 0;

  return v6;
}

- (void)createEpubParser:(int)a3 errorCode:(int *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookBundlePath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_perUserBookURLForBookURL:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
  v12 = objc_msgSend(v11, "mutableCopy");

  if ((objc_msgSend(v12, "hasSuffix:", CFSTR("/")) & 1) == 0)
    objc_msgSend(v12, "appendString:", CFSTR("/"));
  operator new();
}

- (int)_fullParse
{
  _QWORD *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  void *v27;
  void *v28;
  const void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  const void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  void *v44;
  void *v45;
  const void *v46;
  void *v47;
  void *v48;
  const void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  id v57;
  void *v58;
  void *v59;
  const void *v60;
  void *v61;
  void *v62;
  const void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned __int8 v70;
  id v71;
  void *v72;
  void *v73;
  const void *v74;
  void *v75;
  void *v76;
  const void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned __int8 v84;
  id v85;
  void *v86;
  void *v87;
  const void *v88;
  void *v89;
  void *v90;
  const void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned __int8 v98;
  id v99;
  void *v100;
  void *v101;
  const void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t active;
  void *v110;
  const __CFString *v111;
  const __CFString *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  unsigned int v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  unsigned int v123;
  void *v124;
  const __CFString *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  const __CFString *v129;
  void *v130;
  void *v131;
  void *v132;
  BOOL v133;
  void *v134;
  void *v135;
  _BOOL4 v136;
  void *v137;
  void *v138;
  unsigned int v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  const void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  void *v156;
  unsigned __int8 v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  NSObject *v165;
  void *v166;
  void *v167;
  void *v168;
  unsigned __int8 v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  NSObject *v177;
  void *v178;
  void *v179;
  void *v180;
  unsigned __int8 v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  void *v188;
  NSObject *v189;
  void *v190;
  void *v191;
  void *v192;
  unsigned __int8 v193;
  id v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  NSMutableDictionary *v199;
  NSMutableDictionary *v200;
  NSMutableDictionary *v201;
  void *v202;
  _BOOL4 v203;
  NSObject *v204;
  int result;
  id v206;
  NSObject *v207;
  void *v208;
  __CFString *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  int v214;
  uint8_t buf[4];
  const __CFString *v216;
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  id v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  void *v224;

  v214 = 0;
  v3 = -[BKEpubBookParser createEpubParser:errorCode:](self, "createEpubParser:errorCode:", 0, &v214);
  if (!v214)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v10, "resetAsNewlyDownloaded");

    v11 = (void *)(*(uint64_t (**)(_QWORD *))(*v3 + 136))(v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bookBundlePath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v13, &stru_1C3088));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v15, "setBookContentSubpath:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bookAuthor"));
    LODWORD(v12) = v17 == 0;

    if (!(_DWORD)v12)
      goto LABEL_23;
    v18 = (const void *)v3[4];
    if (v18)
    {
      CFRetain(v18);
      v19 = (void *)v3[4];
    }
    else
    {
      v19 = 0;
    }
    v20 = v19;
    v21 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookAuthor](v21, "bookAuthor"));
    if (objc_msgSend(v22, "length"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bookAuthor"));
      v25 = objc_msgSend(v20, "isEqualToString:", v24);

      if ((v25 & 1) != 0)
        goto LABEL_18;
      v26 = _ITEpubParsingLog();
      v21 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bookAuthor"));
        *(_DWORD *)buf = 138544386;
        v216 = CFSTR("self.book.bookAuthor");
        v217 = 2160;
        v218 = 1752392040;
        v219 = 2112;
        v220 = v20;
        v221 = 2160;
        v222 = 1752392040;
        v223 = 2112;
        v224 = v28;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

      }
    }
    else
    {

    }
LABEL_18:

    v29 = (const void *)v3[4];
    if (v29 && (CFRetain(v29), (v30 = (void *)v3[4]) != 0))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v31, "setBookAuthor:", v30);

    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v30, "setBookAuthor:", 0);
    }

LABEL_23:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bookTitle"));
    v34 = v33 == 0;

    if (!v34)
      goto LABEL_38;
    v35 = (const void *)v3[5];
    if (v35)
    {
      CFRetain(v35);
      v36 = (void *)v3[5];
    }
    else
    {
      v36 = 0;
    }
    v37 = v36;
    v38 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookTitle](v38, "bookTitle"));
    if (objc_msgSend(v39, "length"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bookTitle"));
      v42 = objc_msgSend(v37, "isEqualToString:", v41);

      if ((v42 & 1) != 0)
        goto LABEL_33;
      v43 = _ITEpubParsingLog();
      v38 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bookTitle"));
        *(_DWORD *)buf = 138544386;
        v216 = CFSTR("self.book.bookTitle");
        v217 = 2160;
        v218 = 1752392040;
        v219 = 2112;
        v220 = v37;
        v221 = 2160;
        v222 = 1752392040;
        v223 = 2112;
        v224 = v45;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

      }
    }
    else
    {

    }
LABEL_33:

    v46 = (const void *)v3[5];
    if (v46 && (CFRetain(v46), (v47 = (void *)v3[5]) != 0))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v48, "setBookTitle:", v47);

    }
    else
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v47, "setBookTitle:", 0);
    }

LABEL_38:
    v49 = (const void *)v3[6];
    if (v49)
    {
      CFRetain(v49);
      v50 = (void *)v3[6];
    }
    else
    {
      v50 = 0;
    }
    v51 = v50;
    v52 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookLanguage](v52, "bookLanguage"));
    if (objc_msgSend(v53, "length"))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bookLanguage"));
      v56 = objc_msgSend(v51, "isEqualToString:", v55);

      if ((v56 & 1) != 0)
      {
LABEL_47:

        v60 = (const void *)v3[6];
        if (v60 && (CFRetain(v60), (v61 = (void *)v3[6]) != 0))
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
          objc_msgSend(v62, "setBookLanguage:", v61);

        }
        else
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
          objc_msgSend(v61, "setBookLanguage:", 0);
        }

        v63 = (const void *)v3[7];
        if (v63)
        {
          CFRetain(v63);
          v64 = (void *)v3[7];
        }
        else
        {
          v64 = 0;
        }
        v65 = v64;
        v66 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject genre](v66, "genre"));
        if (objc_msgSend(v67, "length"))
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "genre"));
          v70 = objc_msgSend(v65, "isEqualToString:", v69);

          if ((v70 & 1) != 0)
          {
LABEL_60:

            v74 = (const void *)v3[7];
            if (v74 && (CFRetain(v74), (v75 = (void *)v3[7]) != 0))
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
              objc_msgSend(v76, "setGenre:", v75);

            }
            else
            {
              v75 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
              objc_msgSend(v75, "setGenre:", 0);
            }

            v77 = (const void *)v3[8];
            if (v77)
            {
              CFRetain(v77);
              v78 = (void *)v3[8];
            }
            else
            {
              v78 = 0;
            }
            v79 = v78;
            v80 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookEpubId](v80, "bookEpubId"));
            if (objc_msgSend(v81, "length"))
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "bookEpubId"));
              v84 = objc_msgSend(v79, "isEqualToString:", v83);

              if ((v84 & 1) != 0)
              {
LABEL_73:

                v88 = (const void *)v3[8];
                if (v88 && (CFRetain(v88), (v89 = (void *)v3[8]) != 0))
                {
                  v90 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                  objc_msgSend(v90, "setBookEpubId:", v89);

                }
                else
                {
                  v89 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                  objc_msgSend(v89, "setBookEpubId:", 0);
                }

                v91 = (const void *)v3[9];
                if (v91)
                {
                  CFRetain(v91);
                  v92 = (void *)v3[9];
                }
                else
                {
                  v92 = 0;
                }
                v93 = v92;
                v94 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookEpubIdWithUUIDScheme](v94, "bookEpubIdWithUUIDScheme"));
                if (objc_msgSend(v95, "length"))
                {
                  v96 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "bookEpubIdWithUUIDScheme"));
                  v98 = objc_msgSend(v93, "isEqualToString:", v97);

                  if ((v98 & 1) != 0)
                  {
LABEL_86:

                    v102 = (const void *)v3[9];
                    if (v102 && (CFRetain(v102), (v103 = (void *)v3[9]) != 0))
                    {
                      v104 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v104, "setBookEpubIdWithUUIDScheme:", v103);

                    }
                    else
                    {
                      v103 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v103, "setBookEpubIdWithUUIDScheme:", 0);
                    }

                    v105 = ITEpubFolder::dcTermsModified((ITEpubFolder *)v3);
                    v106 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v106, "setDcTermsModified:", v105);

                    v107 = ITEpubFolder::readingDirection((ITEpubFolder *)v3);
                    v108 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v108, "setReadingDirection:", v107);

                    active = ITEpubFolder::mediaActiveClass((ITEpubFolder *)v3);
                    v110 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v110, "setMediaActiveClass:", active);

                    v111 = (const __CFString *)ITEpubFolder::pageProgressionDirection((ITEpubFolder *)v3);
                    if (v111)
                      v112 = v111;
                    else
                      v112 = CFSTR("default");
                    v113 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v113, "setPageProgressionDirection:", v112);

                    v114 = ITEpubFolder::dcTermsContributor((ITEpubFolder *)v3);
                    v115 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v115, "setDcTermsContributor:", v114);

                    v116 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "bookLanguage"));
                    if ((+[IMLanguageUtilities languageIsArabic:](IMLanguageUtilities, "languageIsArabic:", v117) & 1) != 0)
                    {
                      v118 = 1;
                    }
                    else
                    {
                      v119 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "bookLanguage"));
                      v118 = +[IMLanguageUtilities languageIsHebrew:](IMLanguageUtilities, "languageIsHebrew:", v120);

                    }
                    v121 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "pageProgressionDirection"));
                    v123 = objc_msgSend(v122, "isEqualToString:", CFSTR("default"));

                    if ((v123 & v118) != 0)
                    {
                      v124 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v124, "setPageProgressionDirection:", CFSTR("rtl"));

                    }
                    v125 = (const __CFString *)ITEpubFolder::coverWritingMode((ITEpubFolder *)v3);
                    if (v125)
                      v126 = v125;
                    else
                      v126 = CFSTR("default");
                    v127 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v127, "setCoverWritingModeString:", v126);

                    v128 = (const __CFString *)ITEpubFolder::scrollDirection((ITEpubFolder *)v3);
                    if (v128)
                      v129 = v128;
                    else
                      v129 = CFSTR("default");
                    v130 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v130, "setScrollDirection:", v129);

                    if (ITEpubFolder::ebpajGuideVersion((ITEpubFolder *)v3))
                    {
                      v131 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "bookLanguage"));
                      v133 = objc_msgSend(v132, "caseInsensitiveCompare:", CFSTR("ja")) == 0;

                      if (v133)
                        goto LABEL_109;
                      v134 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "bookLanguage"));
                      v136 = objc_msgSend(v135, "rangeOfString:options:", CFSTR("ja"), 9) == 0;

                      if (v136)
                      {
                        v137 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                        v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "bookLanguage"));
                        v139 = objc_msgSend(v138, "characterAtIndex:", 2);

                        if (v139 == 95 || v139 == 45)
                        {
LABEL_109:
                          v140 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                          objc_msgSend(v140, "setRespectImageSizeClass:", CFSTR("gaiji"));

                          v141 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                          objc_msgSend(v141, "setRespectImageSizeClassIsPrefix:", 1);

                        }
                      }
                    }
                    -[BKEpubBookParser setPublisherInfoFromParser:](self, "setPublisherInfoFromParser:", v3);
                    -[BKEpubBookParser setAppleDisplayOptionsFromParser:](self, "setAppleDisplayOptionsFromParser:", v3);
                    -[BKEpubBookParser resetItunesMetadata](self, "resetItunesMetadata");
                    v142 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "bookLanguage"));
                    v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale canonicalLanguageIdentifierFromString:](NSLocale, "canonicalLanguageIdentifierFromString:", v143));
                    v145 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v145, "setBookLanguage:", v144);

                    v146 = ITEpubFolder::spineIndexInPackage((ITEpubFolder *)v3);
                    if ((v146 & 0x80000000) != 0)
                      v147 = 0;
                    else
                      v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v146));
                    v148 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v148, "setSpineIndexInPackage:", v147);

                    if ((int)v146 >= 0)
                    v149 = (const void *)(*(uint64_t (**)(_QWORD *))(*v3 + 96))(v3);
                    -[BKEpubBookParser tryEmbeddedHrefForCoverArtHref:](self, "tryEmbeddedHrefForCoverArtHref:", v149);
                    if (v149)
                      CFRelease(v149);
                    v150 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    objc_msgSend(v150, "setDateLastOpened:", 0);

                    v151 = (*(uint64_t (**)(_QWORD *))(*v3 + 152))(v3);
                    v152 = (void *)objc_claimAutoreleasedReturnValue(v151);
                    v153 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v154 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject parserOPFPath](v153, "parserOPFPath"));
                    if (objc_msgSend(v154, "length"))
                    {
                      v155 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "parserOPFPath"));
                      v157 = objc_msgSend(v152, "isEqualToString:", v156);

                      if ((v157 & 1) != 0)
                        goto LABEL_123;
                      v158 = _ITEpubParsingLog();
                      v153 = objc_claimAutoreleasedReturnValue(v158);
                      if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                      {
                        v159 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                        v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "parserOPFPath"));
                        *(_DWORD *)buf = 138544386;
                        v216 = CFSTR("self.book.parserOPFPath");
                        v217 = 2160;
                        v218 = 1752392040;
                        v219 = 2112;
                        v220 = v152;
                        v221 = 2160;
                        v222 = 1752392040;
                        v223 = 2112;
                        v224 = v160;
                        _os_log_impl(&dword_0, v153, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

                      }
                    }
                    else
                    {

                    }
LABEL_123:

                    v161 = (void *)(*(uint64_t (**)(_QWORD *))(*v3 + 152))(v3);
                    if (v161)
                    {
                      v162 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v162, "setParserOPFPath:", v161);

                    }
                    else
                    {
                      v161 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v161, "setParserOPFPath:", 0);
                    }

                    v163 = (*(uint64_t (**)(_QWORD *))(*v3 + 160))(v3);
                    v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
                    v165 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v166 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject parserNCXPath](v165, "parserNCXPath"));
                    if (objc_msgSend(v166, "length"))
                    {
                      v167 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "parserNCXPath"));
                      v169 = objc_msgSend(v164, "isEqualToString:", v168);

                      if ((v169 & 1) != 0)
                        goto LABEL_132;
                      v170 = _ITEpubParsingLog();
                      v165 = objc_claimAutoreleasedReturnValue(v170);
                      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
                      {
                        v171 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                        v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "parserNCXPath"));
                        *(_DWORD *)buf = 138544386;
                        v216 = CFSTR("self.book.parserNCXPath");
                        v217 = 2160;
                        v218 = 1752392040;
                        v219 = 2112;
                        v220 = v164;
                        v221 = 2160;
                        v222 = 1752392040;
                        v223 = 2112;
                        v224 = v172;
                        _os_log_impl(&dword_0, v165, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

                      }
                    }
                    else
                    {

                    }
LABEL_132:

                    v173 = (void *)(*(uint64_t (**)(_QWORD *))(*v3 + 160))(v3);
                    if (v173)
                    {
                      v174 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v174, "setParserNCXPath:", v173);

                    }
                    else
                    {
                      v173 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v173, "setParserNCXPath:", 0);
                    }

                    v175 = (*(uint64_t (**)(_QWORD *))(*v3 + 80))(v3);
                    v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
                    v177 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v178 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstDocumentHref](v177, "firstDocumentHref"));
                    if (objc_msgSend(v178, "length"))
                    {
                      v179 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "firstDocumentHref"));
                      v181 = objc_msgSend(v176, "isEqualToString:", v180);

                      if ((v181 & 1) != 0)
                        goto LABEL_141;
                      v182 = _ITEpubParsingLog();
                      v177 = objc_claimAutoreleasedReturnValue(v182);
                      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
                      {
                        v183 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                        v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "firstDocumentHref"));
                        *(_DWORD *)buf = 138544386;
                        v216 = CFSTR("self.book.firstDocumentHref");
                        v217 = 2160;
                        v218 = 1752392040;
                        v219 = 2112;
                        v220 = v176;
                        v221 = 2160;
                        v222 = 1752392040;
                        v223 = 2112;
                        v224 = v184;
                        _os_log_impl(&dword_0, v177, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

                      }
                    }
                    else
                    {

                    }
LABEL_141:

                    v185 = (void *)(*(uint64_t (**)(_QWORD *))(*v3 + 80))(v3);
                    if (v185)
                    {
                      v186 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v186, "setFirstDocumentHref:", v185);

                    }
                    else
                    {
                      v185 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      objc_msgSend(v185, "setFirstDocumentHref:", 0);
                    }

                    v187 = (*(uint64_t (**)(_QWORD *))(*v3 + 104))(v3);
                    v188 = (void *)objc_claimAutoreleasedReturnValue(v187);
                    v189 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v190 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject tocPageHref](v189, "tocPageHref"));
                    if (objc_msgSend(v190, "length"))
                    {
                      v191 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                      v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "tocPageHref"));
                      v193 = objc_msgSend(v188, "isEqualToString:", v192);

                      if ((v193 & 1) != 0)
                      {
LABEL_150:

                        v197 = (void *)(*(uint64_t (**)(_QWORD *))(*v3 + 104))(v3);
                        if (v197)
                        {
                          v198 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                          objc_msgSend(v198, "setTocPageHref:", v197);

                        }
                        else
                        {
                          v197 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                          objc_msgSend(v197, "setTocPageHref:", 0);
                        }

                        v199 = objc_opt_new(NSMutableDictionary);
                        v200 = objc_opt_new(NSMutableDictionary);
                        v201 = objc_opt_new(NSMutableDictionary);
                        -[BKEpubBookParser constructBKNavigationInfoWithReadable:withAnchorInfo:](self, "constructBKNavigationInfoWithReadable:withAnchorInfo:", v3, v199);
                        -[BKEpubBookParser constructBKLandmarkInfoWithReadable:withAnchorInfo:](self, "constructBKLandmarkInfoWithReadable:withAnchorInfo:", v3, v200);
                        -[BKEpubBookParser constructBKPhysicalPageWithReadable:withAnchorInfo:](self, "constructBKPhysicalPageWithReadable:withAnchorInfo:", v3, v201);
                        -[BKEpubBookParser constructBKIdCfiMappingsWithEpub:](self, "constructBKIdCfiMappingsWithEpub:", v3);
                        -[BKEpubBookParser constructBKDocumentWithReadable:chapters:landmarks:physicalPages:](self, "constructBKDocumentWithReadable:chapters:landmarks:physicalPages:", v3, v199, v200, v201);
                        -[BKEpubBookParser constructBKProtectionInfoWithReadable:](self, "constructBKProtectionInfoWithReadable:", v3);

                        v202 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                        LODWORD(v200) = +[BKEpubBookParser recomputeFixedLayoutDimensionsForBook:](BKEpubBookParser, "recomputeFixedLayoutDimensionsForBook:", v202);

                        if ((_DWORD)v200)
                        {
                          v214 = -998;
                          v9 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                          -[NSObject resetAsNewlyDownloaded](v9, "resetAsNewlyDownloaded");
                        }
                        else
                        {
                          v203 = !self->_illegalEncryptionAlgorithm;
                          v204 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                          v9 = v204;
                          if (v203)
                            -[NSObject setParserVersion:](v204, "setParserVersion:", CFSTR("BookEPUB Parser - 2024.05.01"));
                          else
                            -[NSObject setParserVersion:](v204, "setParserVersion:", CFSTR("BKEpubBookParser - IllegalEncryption - 10.04.2011"));
                        }
                        goto LABEL_158;
                      }
                      v194 = _ITEpubParsingLog();
                      v189 = objc_claimAutoreleasedReturnValue(v194);
                      if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                      {
                        v195 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                        v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "tocPageHref"));
                        *(_DWORD *)buf = 138544386;
                        v216 = CFSTR("self.book.tocPageHref");
                        v217 = 2160;
                        v218 = 1752392040;
                        v219 = 2112;
                        v220 = v188;
                        v221 = 2160;
                        v222 = 1752392040;
                        v223 = 2112;
                        v224 = v196;
                        _os_log_impl(&dword_0, v189, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

                      }
                    }
                    else
                    {

                    }
                    goto LABEL_150;
                  }
                  v99 = _ITEpubParsingLog();
                  v94 = objc_claimAutoreleasedReturnValue(v99);
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                  {
                    v100 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "bookEpubIdWithUUIDScheme"));
                    *(_DWORD *)buf = 138544386;
                    v216 = CFSTR("self.book.bookEpubIdWithUUIDScheme");
                    v217 = 2160;
                    v218 = 1752392040;
                    v219 = 2112;
                    v220 = v93;
                    v221 = 2160;
                    v222 = 1752392040;
                    v223 = 2112;
                    v224 = v101;
                    _os_log_impl(&dword_0, v94, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

                  }
                }
                else
                {

                }
                goto LABEL_86;
              }
              v85 = _ITEpubParsingLog();
              v80 = objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                v86 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "bookEpubId"));
                *(_DWORD *)buf = 138544386;
                v216 = CFSTR("self.book.bookEpubId");
                v217 = 2160;
                v218 = 1752392040;
                v219 = 2112;
                v220 = v79;
                v221 = 2160;
                v222 = 1752392040;
                v223 = 2112;
                v224 = v87;
                _os_log_impl(&dword_0, v80, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

              }
            }
            else
            {

            }
            goto LABEL_73;
          }
          v71 = _ITEpubParsingLog();
          v66 = objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "genre"));
            *(_DWORD *)buf = 138544386;
            v216 = CFSTR("self.book.genre");
            v217 = 2160;
            v218 = 1752392040;
            v219 = 2112;
            v220 = v65;
            v221 = 2160;
            v222 = 1752392040;
            v223 = 2112;
            v224 = v73;
            _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

          }
        }
        else
        {

        }
        goto LABEL_60;
      }
      v57 = _ITEpubParsingLog();
      v52 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bookLanguage"));
        *(_DWORD *)buf = 138544386;
        v216 = CFSTR("self.book.bookLanguage");
        v217 = 2160;
        v218 = 1752392040;
        v219 = 2112;
        v220 = v51;
        v221 = 2160;
        v222 = 1752392040;
        v223 = 2112;
        v224 = v59;
        _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", buf, 0x34u);

      }
    }
    else
    {

    }
    goto LABEL_47;
  }
  v4 = _ITEpubParsingLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v216) = v214;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "createEpubParser error: %d", buf, 8u);
  }

  v6 = BCIMLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v216 = (const __CFString *)"-[BKEpubBookParser _fullParse]";
    v217 = 2080;
    v218 = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
    v219 = 1024;
    LODWORD(v220) = 145;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  v8 = BCIMLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v216) = v214;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "@\"createEpubParser error: %d\", buf, 8u);
  }
LABEL_158:

  ITRetain::release((ITRetain *)v3);
  result = v214;
  if ((v214 + 42005) < 2 || v214 == -42597)
    return -998;
  if (!v214)
  {
    if (self->_illegalEncryptionAlgorithm)
    {
      v206 = _ITEpubParsingLog();
      v207 = objc_claimAutoreleasedReturnValue(v206);
      if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
      {
        v208 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v209 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "assetLogID"));
        v210 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "bookBundlePath"));
        v212 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "assetID"));
        *(_DWORD *)buf = 138543874;
        v216 = v209;
        v217 = 2112;
        v218 = (uint64_t)v211;
        v219 = 2112;
        v220 = v213;
        _os_log_impl(&dword_0, v207, OS_LOG_TYPE_ERROR, "Illegal encryption for book %{public}@ %@:%@", buf, 0x20u);

      }
      return -999;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isDifferentParserVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parserVersion"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parserVersion"));
    v6 = objc_msgSend(CFSTR("BookEPUB Parser - 2024.05.01"), "isEqualToString:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (int)_touchUpParse
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v4 = -[BKEpubBookParser isDifferentParserVersion:](self, "isDifferentParserVersion:", v3);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parserVersion"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parserVersion"));
    v9 = objc_msgSend(CFSTR("BKEpubBookParser - IllegalEncryption - 10.04.2011"), "isEqualToString:", v8);

    if ((v9 & 1) != 0)
      return -999;
  }
  else
  {

  }
  return -[BKEpubBookParser _fullParse](self, "_fullParse");
}

- (int)parse:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  char *v17;
  char *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  id v28;
  NSObject *v29;
  char *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void *v41;
  void *v42;
  int v44;
  id v45;
  NSObject *v46;
  char *v47;
  char *v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  int v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;

  if (a3)
  {
    v4 = _ITEpubParsingLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v7 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetLogID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v9 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookBundlePath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
      v55 = 138543874;
      v56 = v7;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v11;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Skipping all parsing for %{public}@ - %@:%@ -- Why would we do this?", (uint8_t *)&v55, 0x20u);

    }
    goto LABEL_28;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bookBundlePath"));

  if (!v13)
  {
    v28 = _ITEpubParsingLog();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject databaseKey](v5, "databaseKey"));
      v31 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject bookAuthor](v5, "bookAuthor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookTitle](v5, "bookTitle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetLogID](v5, "assetLogID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookBundlePath](v5, "bookBundlePath"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetID](v5, "assetID"));
      v55 = 138413570;
      v56 = v30;
      v57 = 2112;
      v58 = v31;
      v59 = 2112;
      v60 = v32;
      v61 = 2114;
      v62 = v33;
      v63 = 2112;
      v64 = v34;
      v65 = 2112;
      v66 = v35;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Parsing Not Possible -- No Bundle Path: [%@] {%@ - %@} - %{public}@ - %@:%@", (uint8_t *)&v55, 0x3Eu);

    }
    v36 = BCIMLog();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v55 = 136315650;
      v56 = "-[BKEpubBookParser parse:]";
      v57 = 2080;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      v59 = 1024;
      LODWORD(v60) = 368;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v55, 0x1Cu);
    }

    v38 = BCIMLog();
    v26 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v39 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject databaseKey](v5, "databaseKey"));
      v40 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject bookAuthor](v5, "bookAuthor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookTitle](v5, "bookTitle"));
      v55 = 138412802;
      v56 = v39;
      v57 = 2112;
      v58 = v40;
      v59 = 2112;
      v60 = v41;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "@\"Parsing Not Possible -- No Bundle Path: [%@] {%@ - %@}\", (uint8_t *)&v55, 0x20u);

    }
    v20 = -1000;
    goto LABEL_26;
  }
  if (!-[NSObject wasParsed](v5, "wasParsed"))
    goto LABEL_9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject isDirty](v5, "isDirty"));
  if ((objc_msgSend(v14, "BOOLValue") & 1) != 0
    || (-[NSObject needsReparsing](v5, "needsReparsing") & 1) != 0)
  {

LABEL_9:
    v15 = _ITEpubParsingLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject assetLogID](v5, "assetLogID"));
      v18 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject bookBundlePath](v5, "bookBundlePath"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetID](v5, "assetID"));
      v55 = 138543874;
      v56 = v17;
      v57 = 2112;
      v58 = v18;
      v59 = 2112;
      v60 = v19;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Performing full parse on %{public}@ - %@:%@", (uint8_t *)&v55, 0x20u);

    }
    v20 = -[BKEpubBookParser _fullParse](self, "_fullParse");
    if (!v20)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSObject setParseDate:](v5, "setParseDate:", v42);

      -[NSObject setIsDirty:](v5, "setIsDirty:", &__kCFBooleanFalse);
LABEL_28:
      v20 = 0;
      goto LABEL_29;
    }
    v21 = _ITEpubParsingLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v55 = 67109120;
      LODWORD(v56) = v20;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Full parse failure: %d", (uint8_t *)&v55, 8u);
    }

    v23 = BCIMLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v55 = 136315650;
      v56 = "-[BKEpubBookParser parse:]";
      v57 = 2080;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      v59 = 1024;
      LODWORD(v60) = 347;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v55, 0x1Cu);
    }

    v25 = BCIMLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    v55 = 67109120;
    LODWORD(v56) = v20;
    v27 = "@\"_fullParse: %d\";
    goto LABEL_18;
  }
  v44 = BEAlwaysFullParseEPUB();

  if (v44)
    goto LABEL_9;
  v45 = _ITEpubParsingLog();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject assetLogID](v5, "assetLogID"));
    v48 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject bookBundlePath](v5, "bookBundlePath"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetID](v5, "assetID"));
    v55 = 138543874;
    v56 = v47;
    v57 = 2112;
    v58 = v48;
    v59 = 2112;
    v60 = v49;
    _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Performing touchup parse on %{public}@ - %@:%@", (uint8_t *)&v55, 0x20u);

  }
  v20 = -[BKEpubBookParser _touchUpParse](self, "_touchUpParse");
  if (v20)
  {
    v50 = _ITEpubParsingLog();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v55 = 67109120;
      LODWORD(v56) = v20;
      _os_log_impl(&dword_0, v51, OS_LOG_TYPE_ERROR, "Touch up parse failure: %d", (uint8_t *)&v55, 8u);
    }

    v52 = BCIMLog();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v55 = 136315650;
      v56 = "-[BKEpubBookParser parse:]";
      v57 = 2080;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      v59 = 1024;
      LODWORD(v60) = 360;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v55, 0x1Cu);
    }

    v54 = BCIMLog();
    v26 = objc_claimAutoreleasedReturnValue(v54);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_26;
    v55 = 67109120;
    LODWORD(v56) = v20;
    v27 = "@\"_touchUpParse: %d\";
LABEL_18:
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v55, 8u);
LABEL_26:

  }
LABEL_29:

  return v20;
}

- (int)parse
{
  return -[BKEpubBookParser parse:](self, "parse:", 0);
}

- (void)tryEmbeddedHrefForCoverArtHref:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookContentSubpath"));
    v8 = objc_msgSend(v7, "length");

    v9 = v5;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookContentSubpath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v5));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v12, "setEmbeddedArtHref:", v9);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v13, "setEmbeddedArtHrefRejected:", 0);

    v4 = v14;
  }

}

- (void)constructBKProtectionInfoWithReadable:(BKReadableFormat *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  __CFDictionary *v20;
  id v21;
  id v22;
  __CFDictionary *v23;

  if (a3)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sinfInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sinfInfo"));
      objc_msgSend(v22, "removeSinfInfo:", v9);

    }
    if (self->_illegalEncryptionAlgorithm)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v23 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));

      v20 = +[BKProtectionInfo newEmptyProtectionInfo:](BKProtectionInfo, "newEmptyProtectionInfo:", v23);
      v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0xFFFFFFFFLL);
      -[__CFDictionary setSinfNumber:](v20, "setSinfNumber:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v12, "addSinfInfoObject:", v20);
    }
    else
    {
      v23 = a3->var17;
      v20 = a3->var16;
      if (!v20)
        goto LABEL_7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book", v20));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "managedObjectContext"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary keyEnumerator](v23, "keyEnumerator"));
      for (i = 0; ; i = v15)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextObject"));

        if (!v15)
          break;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v23, "objectForKey:", v15));
        v17 = +[BKProtectionInfo newEmptyProtectionInfo:](BKProtectionInfo, "newEmptyProtectionInfo:", v11);
        v18 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v15, "intValue"));
        objc_msgSend(v17, "setSinfNumber:", v18);
        objc_msgSend(v17, "setSinfBlob:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        objc_msgSend(v19, "addSinfInfoObject:", v17);

      }
    }

LABEL_7:
  }
}

- (BOOL)isLegalEncryption:(id)a3
{
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v3 = (char *)a3;
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "rangeOfString:", CFSTR(".apple.com")), v5)
    || (objc_msgSend(v4, "rangeOfString:", BEAdobeFontManglingAlgorithm), v6)
    || (v7 = objc_msgSend(v4, "rangeOfString:", BEIDPFFontManglingAlgorithm), v8))
  {
    v9 = 1;
  }
  else
  {
    v11 = BCIMLog(v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 136315650;
      v17 = "-[BKEpubBookParser isLegalEncryption:]";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      v20 = 1024;
      v21 = 462;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v16, 0x1Cu);
    }

    v14 = BCIMLog(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "@\"***** Unrecognized Encryption Algorithm: %@\", (uint8_t *)&v16, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)isLegalCompression:(id)a3
{
  char *v3;
  id v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v3 = (char *)a3;
  if (objc_msgSend(v3, "length")
    && (v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("none")), (v4 & 1) == 0))
  {
    v6 = BCIMLog(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      v13 = "-[BKEpubBookParser isLegalCompression:]";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      v16 = 1024;
      v17 = 483;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = BCIMLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "@\"***** Unrecognized Compression Algorithm: %@\", (uint8_t *)&v12, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)mediaOverlayHrefForManifestInfo:(__CFDictionary *)a3 readable:(BKReadableFormat *)a4
{
  const void *Value;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  Value = CFDictionaryGetValue(a3, CFSTR("media-overlay"));
  if (Value
    && (v6 = (const __CFDictionary *)(*((uint64_t (**)(BKReadableFormat *, const void *))a4->var0 + 6))(a4, Value)) != 0)
  {
    v7 = v6;
    v8 = CFDictionaryGetValue(v6, CFSTR("unescaped_href"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByRemovingPercentEncoding"));
      v12 = (void *)v11;
      if (v11)
        v13 = (void *)v11;
      else
        v13 = v10;
      v14 = v13;

    }
    else
    {
      v14 = 0;
    }
    CFRelease(v7);

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)constructBKDocumentWithReadable:(BKReadableFormat *)a3 chapters:(id)a4 landmarks:(id)a5 physicalPages:(id)a6
{
  void *v10;
  __CFDictionary *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFDictionary *v16;
  void *Value;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _BOOL4 illegalEncryptionAlgorithm;
  BKReadableFormat *v29;
  int v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  const __CFBoolean *v43;
  const __CFBoolean *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *context;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  __CFDictionary *v67;
  BKReadableFormat *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;

  v58 = a4;
  v57 = a5;
  v56 = a6;
  if (!a3)
    goto LABEL_48;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));

  LODWORD(v10) = (*((uint64_t (**)(BKReadableFormat *))a3->var0 + 4))(a3);
  v68 = a3;
  v11 = a3->var16;
  v61 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0xFFFFFFFFLL);
  v12 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", 1);
  v53 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", 0);
  v54 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", 1);
  v65 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v10);
  v55 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = objc_autoreleasePoolPush();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  context = v13;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "databaseKey"));

  v15 = ((_DWORD)v10 - 1);
  v67 = v11;
  v64 = v12;
  while ((_DWORD)v15 != -1)
  {
    v16 = (const __CFDictionary *)(*((uint64_t (**)(BKReadableFormat *, uint64_t))v68->var0 + 5))(v68, v15);
    Value = (void *)CFDictionaryGetValue(v16, CFSTR("unescaped_href"));
    if (v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", Value));
      v19 = v18;
      if (v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("encryptionAlgorithm")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("compressionAlgorithm")));
        if (!-[BKEpubBookParser isLegalEncryption:](self, "isLegalEncryption:", v20)
          || !-[BKEpubBookParser isLegalCompression:](self, "isLegalCompression:", v21))
        {
          self->_illegalEncryptionAlgorithm = 1;
        }

      }
    }
    else
    {
      v19 = 0;
    }
    if (self->_illegalEncryptionAlgorithm)
    {
      if (!v16)
        goto LABEL_23;
    }
    else
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubBookParser mediaOverlayHrefForManifestInfo:readable:](self, "mediaOverlayHrefForManifestInfo:readable:", v16, v68));
      v22 = +[BKDocument newEmptyDocument:](BKDocument, "newEmptyDocument:", v62);
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(Value, "stringByRemovingPercentEncoding"));
      v63 = (void *)v23;
      if (v23)
        v24 = (void *)v23;
      else
        v24 = Value;
      objc_msgSend(v22, "setHref:", v24);
      objc_msgSend(v22, "setMediaOverlayHref:", v66);
      objc_msgSend(v22, "setMime:", CFDictionaryGetValue(v16, CFSTR("media-type")));
      objc_msgSend(v22, "setManifestId:", CFDictionaryGetValue(v16, CFSTR("id")));
      objc_msgSend(v22, "setFallbackId:", CFDictionaryGetValue(v16, CFSTR("fallback")));
      objc_msgSend(v22, "setManifestProperties:", CFDictionaryGetValue(v16, CFSTR("properties")));
      objc_msgSend(v22, "setDocumentOrdinal:", v61);
      objc_msgSend(v22, "setBookDatabaseKey:", v60);
      if (v19)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("encryptionAlgorithm")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("compressionAlgorithm")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("fairplay-id")));
        if (v26)
        {
          v27 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v26, "intValue"));
          objc_msgSend(v22, "setSinfNumber:", v27);

        }
        objc_msgSend(v22, "setCompressionAlgorithm:", v25);
        objc_msgSend(v22, "setEncryptionAlgorithm:", v59);

      }
      objc_msgSend(v65, "setObject:forKey:", v22, Value);

      if (!v16)
        goto LABEL_23;
    }
    CFRelease(v16);
LABEL_23:
    illegalEncryptionAlgorithm = self->_illegalEncryptionAlgorithm;

    v15 = (v15 - 1);
    v11 = v67;
    if (illegalEncryptionAlgorithm)
      break;
  }

  objc_autoreleasePoolPop(context);
  v29 = v68;
  if (!self->_illegalEncryptionAlgorithm)
  {
    v30 = (*((uint64_t (**)(BKReadableFormat *))v68->var0 + 7))(v68);
    if (v30)
    {
      v31 = (v30 - 1);
      do
      {
        v32 = (void *)(*((uint64_t (**)(BKReadableFormat *, uint64_t))v29->var0 + 8))(v29, v31);
        if (objc_msgSend(v32, "length"))
        {
          v33 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", v32));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "documentOrdinal"));
          v36 = objc_msgSend(v35, "integerValue");

          if (v36 != (id)-1)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[BKDocument documentKeyWithHref:documentOrdinal:](BKDocument, "documentKeyWithHref:documentOrdinal:", v32, v33));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", v37));

            if (!v38)
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", v32));
              if (!v39)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                objc_msgSend(v55, "setObject:forKey:", v40, v32);
                v39 = v40;
                objc_msgSend(v40, "addObject:", v32);
              }
              objc_msgSend(v39, "addObject:", v37);
              v41 = +[BKDocument newEmptyDocument:](BKDocument, "newEmptyDocument:", v62);
              objc_msgSend(v41, "copyPropertiesFrom:", v34);
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
              objc_msgSend(v41, "setNonlinearElement:", v42);

              objc_msgSend(v65, "setObject:forKey:", v41, v37);
              v34 = v41;
            }

          }
          if (v34)
          {
            objc_msgSend(v34, "setDocumentOrdinal:", v33);
            v43 = (const __CFBoolean *)(*((uint64_t (**)(BKReadableFormat *, uint64_t))v68->var0 + 9))(v68, v31);
            v44 = v43;
            if (v43)
            {
              if (!CFBooleanGetValue(v43))
                objc_msgSend(v34, "setNonlinearElement:", v54);
              CFRelease(v44);
            }
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKey:", v32));

            if (v45)
              objc_msgSend(v34, "setHasTocElements:", v64);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", v32));

            if (v46)
              objc_msgSend(v34, "setHasLandmarkElements:", v64);
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKey:", v32));

            if (v47)
              objc_msgSend(v34, "setHasPhysicalElements:", v64);
          }

          v32 = 0;
        }

        v31 = (v31 - 1);
        v29 = v68;
      }
      while ((_DWORD)v31 != -1);
    }
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "allValues"));
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_98858;
  v69[3] = &unk_1C0E48;
  v49 = v65;
  v70 = v49;
  v50 = v53;
  v71 = v50;
  v51 = v64;
  v72 = v51;
  objc_msgSend(v48, "enumerateObjectsUsingBlock:", v69);

LABEL_48:
}

- (int)constructEntity:(id)a3 withNavPoint:(void *)a4 absoluteOrder:(int)a5 indentationLevel:(int)a6 withAnchorInfo:(id)a7 createdObjects:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v46 = a5;
  if (a5 < 0)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));

    v41 = (void *)v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v13, v17));
    v19 = ITNavPoint::contentFileIncludingHash((ITNavPoint *)a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v40 = *((id *)a4 + 11);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "path"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "basePlusContentPath"));

    v38 = (void *)v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathRelativeToContentBase:forRelativePath:startingFromAbsoluteFolderPath:](NSString, "pathRelativeToContentBase:forRelativePath:startingFromAbsoluteFolderPath:", v22, v20, v44));

    v43 = v23;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByRemovingPercentEncoding"));
    if (objc_msgSend(v42, "length"))
      objc_msgSend(v18, "setValue:forKey:", v42, CFSTR("href"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByRemovingURLFragment"));
    if (objc_msgSend(v45, "length"))
    {
      objc_msgSend(v18, "setValue:forKey:", v45, CFSTR("baseHref"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      objc_msgSend(v14, "setObject:forKey:", v24, v45);

    }
    else
    {
      objc_msgSend(v18, "setValue:forKey:", &stru_1C3088, CFSTR("baseHref"));
    }
    v27 = (__CFString *)*((id *)a4 + 10);
    if (!-[__CFString length](v27, "length"))
    {

      v27 = &stru_1C3088;
    }
    objc_msgSend(v18, "setValue:forKey:", v27, CFSTR("name"));
    v28 = (__CFString *)*((id *)a4 + 12);
    if (!-[__CFString length](v28, "length"))
    {

      v28 = &stru_1C3088;
    }
    objc_msgSend(v18, "setValue:forKey:", v28, CFSTR("htmlName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a6));
    objc_msgSend(v18, "setValue:forKey:", v29, CFSTR("indentationLevel"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v46));
    objc_msgSend(v18, "setValue:forKey:", v30, CFSTR("absoluteOrder"));

    v31 = *((id *)a4 + 7);
    if (objc_msgSend(v31, "length"))
      objc_msgSend(v18, "setValue:forKey:", v31, CFSTR("type"));
    objc_msgSend(v15, "addObject:", v18);
    v25 = (a6 + 1);

    v26 = v46 + 1;
  }
  v32 = *((_QWORD *)a4 + 3) - *((_QWORD *)a4 + 2);
  if (v32)
  {
    v33 = 0;
    v34 = v32 >> 3;
    if (v34 <= 1)
      v35 = 1;
    else
      v35 = v34;
    do
    {
      v36 = ITNavPoint::childAtIndex((ITNavPoint *)a4, v33);
      if (v36)
        v26 = -[BKEpubBookParser constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:](self, "constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:", v13, v36, v26, v25, v14, v15);
      ++v33;
    }
    while (v35 != v33);
  }

  return v26;
}

- (void)constructBKNavigationInfoWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4
{
  ITNavPoint *var13;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (a3)
  {
    var13 = a3->var13;
    if (var13)
    {
      v7 = objc_autoreleasePoolPush();
      v8 = objc_opt_new(NSMutableSet);
      -[BKEpubBookParser constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:](self, "constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:", CFSTR("BKNavigationInfo"), var13, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v10, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v9, "addChapters:", v8);

      objc_autoreleasePoolPop(v7);
    }
  }

}

- (void)constructBKLandmarkInfoWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4
{
  ITNavPoint *var14;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (a3)
  {
    var14 = a3->var14;
    if (var14)
    {
      v7 = objc_autoreleasePoolPush();
      v8 = objc_opt_new(NSMutableSet);
      -[BKEpubBookParser constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:](self, "constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:", CFSTR("BKLandmarkInfo"), var14, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v10, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v9, "addLandmarks:", v8);

      objc_autoreleasePoolPop(v7);
    }
  }

}

- (void)constructBKPhysicalPageWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4
{
  ITNavPoint *var15;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (a3)
  {
    var15 = a3->var15;
    if (var15)
    {
      v7 = objc_autoreleasePoolPush();
      v8 = objc_opt_new(NSMutableSet);
      -[BKEpubBookParser constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:](self, "constructEntity:withNavPoint:absoluteOrder:indentationLevel:withAnchorInfo:createdObjects:", CFSTR("BKPhysicalPage"), var15, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v10, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v9, "addPhysicalPages:", v8);

      objc_autoreleasePoolPop(v7);
    }
  }

}

+ (id)bookExtraInfoCacheDirectory
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BookCachedData")));
  return v5;
}

- (id)createBookExtraInfoCacheDirectoryIfNecessary
{
  double v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookExtraInfoCacheDirectory", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  return v4;
}

+ (id)bookCachedDataPathForBookWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookExtraInfoCacheDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v6));

  return v7;
}

- (void)constructBKIdCfiMappingsWithEpub:(void *)a3
{
  uint64_t v4;
  const void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  const void *v18;

  v4 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)a3 + 176))(a3, a2);
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = -[BKEpubBookParser createBookExtraInfoCacheDirectoryIfNecessary](self, "createBookExtraInfoCacheDirectoryIfNecessary");
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "databaseKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookCachedDataPathForBookWithKey:", v11));

    v17 = CFSTR("tocCfiIdMap");
    v18 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v16 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v13, 200, 0, &v16));
    v15 = v16;
    if (v14)
      objc_msgSend(v14, "writeToFile:atomically:", v12, 1);
    CFRelease(v5);

  }
}

+ (id)cachedDataForBookDatabaseKey:(id)a3 cacheKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bookCachedDataPathForBookWithKey:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  return v9;
}

+ (CGSize)_computeFixedLayoutDimensionsFrom:(id)a3 forBook:(id)a4
{
  id v5;
  id v6;
  double width;
  double height;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ITEpubFixedLayoutParser *v26;
  id v27;
  const __CFData *v28;
  uint64_t v29;
  int v30;
  id v31;
  NSObject *v32;
  const char *v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  double v38;
  double v39;
  uint8_t buf[16];
  id v41;
  char v42;
  CGSize result;

  v5 = a3;
  v6 = a4;
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sinfNumber"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sinfNumber"));
      v11 = objc_msgSend(v10, "intValue");

      if (v11 < 1)
      {
        v9 = 0;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sinfNumber"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sinfNumber ==[n] %@"), v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sinfInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredSetUsingPredicate:", v13));

        if (objc_msgSend(v15, "count") == (char *)&dword_0 + 1)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookBundlePath"));
          +[NSException raise:format:](NSException, "raise:format:", CFSTR("NSIllegalState"), CFSTR("Book sinf information appears invalid: %@"), v16);

          v9 = 0;
        }

      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookBundlePath"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookContentSubpath"));
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookContentSubpath"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", v20));

    }
    else
    {
      v21 = v17;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "href"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v22));

    v24 = objc_autoreleasePoolPush();
    v42 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sinfBlob"));
    v41 = 0;
    v26 = (ITEpubFixedLayoutParser *)objc_claimAutoreleasedReturnValue(+[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:sinfData:refetch:error:](ft9cupR7u6OrU4m1pyhB, "pK0gFZ9QOdm17E9p9cpP:sinfData:refetch:error:", v23, v25, &v42, &v41));
    v27 = v41;

    if (v26)
    {
      if (-[ITEpubFixedLayoutParser length](v26, "length"))
      {
        v29 = ITEpubFixedLayoutParser::dimensionsFromData(v26, v28);
        v30 = v29;
        if (v29 <= 0)
        {
          v35 = _ITEpubParsingLog();
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Width read from decrypted data is 0 for fixed layout.", buf, 2u);
          }

        }
        else
        {
          width = (double)SHIDWORD(v29);
        }
        if (v30 > 0)
        {
          height = (double)v30;
LABEL_29:

          objc_autoreleasePoolPop(v24);
          goto LABEL_30;
        }
        v37 = _ITEpubParsingLog();
        v32 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v33 = "Height read from decrypted data is 0 for fixed layout.";
          goto LABEL_27;
        }
LABEL_28:

        goto LABEL_29;
      }
      v34 = _ITEpubParsingLog();
      v32 = objc_claimAutoreleasedReturnValue(v34);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v33 = "Decrypted data length is 0. Cannot read fixed layout size from it.";
    }
    else
    {
      v31 = _ITEpubParsingLog();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v33 = "Decrypted data is nil";
    }
LABEL_27:
    _os_log_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, v33, buf, 2u);
    goto LABEL_28;
  }
LABEL_30:

  v38 = width;
  v39 = height;
  result.height = v39;
  result.width = v38;
  return result;
}

+ (BOOL)recomputeFixedLayoutDimensionsForBook:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v24;
  NSObject *v25;
  void *v26;
  NSString *v27;
  id v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSString *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  NSString *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  NSString *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSString *v53;
  id v54;
  NSString *v55;
  void *v56;
  id v57;
  void *v58;
  __int128 v60;
  uint64_t v61;
  id obj;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  CGSize v76;
  CGSize v77;
  CGSize v78;
  CGSize v79;
  CGSize v80;
  CGSize v81;
  CGSize v82;

  v64 = a3;
  if (objc_msgSend(v64, "isFixedLayout"))
  {
    if ((BEAlwaysFullParseEPUB() & 1) == 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "hasComputedFixedLayoutSize"));
      if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "isDirty"));
        v5 = objc_msgSend(v4, "BOOLValue");

        if (!v5)
          goto LABEL_45;
      }
      else
      {

      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "firstDocumentLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "documentContainingLocation:", v6));
    objc_msgSend(a1, "_computeFixedLayoutDimensionsFrom:forBook:", v7, v64);
    v9 = v8;
    v11 = v10;

    v12 = v9 == CGSizeZero.width;
    v13 = v11 == CGSizeZero.height;
    if (v12 && v13)
      v11 = 768.0;
    v65 = 0u;
    v66 = 0u;
    if (v12 && v13)
      v9 = 1024.0;
    v67 = 0uLL;
    v68 = 0uLL;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "sortedDocuments"));
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (!v14)
    {
      v61 = 0;
      goto LABEL_44;
    }
    v61 = 0;
    v16 = *(_QWORD *)v66;
    *(_QWORD *)&v15 = 138412802;
    v60 = v15;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v66 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v17);
        objc_msgSend(a1, "_computeFixedLayoutDimensionsFrom:forBook:", v18, v64, v60);
        v21 = v19;
        v22 = v20;
        if (v19 == CGSizeZero.width && v20 == CGSizeZero.height)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "href"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "tocPageHref"));
          v33 = objc_msgSend(v31, "isEqualToString:", v32);

          if (v33)
          {
            v34 = _ITEpubParsingLog();
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "href"));
              v78.width = v9;
              v78.height = v11;
              v37 = NSStringFromCGSize(v78);
              v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              *(_DWORD *)buf = 138412546;
              v70 = v36;
              v71 = 2112;
              v72 = v38;
              _os_log_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "Book document (%@) size computed from epub was 0, setting size to %@ and ignoring error because it's the TOC.", buf, 0x16u);

            }
          }
          else
          {
            v39 = _ITEpubParsingLog();
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "href"));
              v79.width = v9;
              v79.height = v11;
              v42 = NSStringFromCGSize(v79);
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              *(_DWORD *)buf = 138412546;
              v70 = v41;
              v71 = 2112;
              v72 = v43;
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, "Book document (%@) size computed from epub was 0, setting size to %@ and marking book info as dirty.", buf, 0x16u);

            }
            ++v61;
          }
          v22 = v11;
          v21 = v9;
        }
        else
        {
          if (v20 == 0.0)
          {
            v24 = _ITEpubParsingLog();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            v22 = round(v11 * (v21 / v9));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "href"));
              v76.width = v21;
              v76.height = v22;
              v27 = NSStringFromCGSize(v76);
              v28 = (id)objc_claimAutoreleasedReturnValue(v27);
              v77.width = v9;
              v77.height = v11;
              v29 = NSStringFromCGSize(v77);
              v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              *(_DWORD *)buf = v60;
              v70 = v26;
              v71 = 2114;
              v72 = v28;
              v73 = 2114;
              v74 = v30;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Book document (%@) height computed from epub was 0, using %{public}@ based on aspect ratio of previous size %{public}@.", buf, 0x20u);

            }
LABEL_23:

            goto LABEL_32;
          }
          if (v19 == 0.0)
          {
            v51 = _ITEpubParsingLog();
            v25 = objc_claimAutoreleasedReturnValue(v51);
            v21 = round(v9 * (v22 / v11));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "href"));
              v81.width = v21;
              v81.height = v22;
              v53 = NSStringFromCGSize(v81);
              v54 = (id)objc_claimAutoreleasedReturnValue(v53);
              v82.width = v9;
              v82.height = v11;
              v55 = NSStringFromCGSize(v82);
              v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
              *(_DWORD *)buf = v60;
              v70 = v52;
              v71 = 2114;
              v72 = v54;
              v73 = 2114;
              v74 = v56;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Book document (%@) width computed from epub was 0, using %{public}@ based on aspect ratio of previous size %{public}@.", buf, 0x20u);

            }
            goto LABEL_23;
          }
          v11 = v20;
          v9 = v19;
        }
LABEL_32:
        v44 = _ITEpubParsingLog();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "href"));
          v80.width = v21;
          v80.height = v22;
          v47 = NSStringFromCGSize(v80);
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          *(_DWORD *)buf = 138412546;
          v70 = v46;
          v71 = 2114;
          v72 = v48;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Book document (%@) validated size: %{public}@", buf, 0x16u);

        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
        objc_msgSend(v18, "setFixedLayoutWidth:", v49);

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
        objc_msgSend(v18, "setFixedLayoutHeight:", v50);

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      v14 = v57;
      if (!v57)
      {
LABEL_44:

        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v61 == 0));
        objc_msgSend(v64, "setHasComputedFixedLayoutSize:", v58);

        break;
      }
    }
  }
LABEL_45:

  return 0;
}

- (void)setPublisherInfoFromParser:(BKReadableFormat *)a3
{
  __CFString *var10;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *var11;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  __CFString *var12;
  __CFString *v35;
  __CFString *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  int v60;
  const __CFString *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;

  var10 = a3->var10;
  if (var10)
  {
    CFRetain(var10);
    v6 = a3->var10;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publisherName"));
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisherName"));
    v12 = -[__CFString isEqualToString:](v7, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = _ITEpubParsingLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisherName"));
        v60 = 138544386;
        v61 = CFSTR("self.book.publisherName");
        v62 = 2160;
        v63 = 1752392040;
        v64 = 2112;
        v65 = v7;
        v66 = 2160;
        v67 = 1752392040;
        v68 = 2112;
        v69 = v16;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", (uint8_t *)&v60, 0x34u);

      }
    }
  }
  else
  {

  }
  v17 = a3->var10;
  if (v17 && (CFRetain(v17), (v18 = a3->var10) != 0))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v19, "setPublisherName:", v18);

  }
  else
  {
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    -[__CFString setPublisherName:](v18, "setPublisherName:", 0);
  }

  var11 = a3->var11;
  if (var11)
  {
    CFRetain(var11);
    v21 = a3->var11;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;
  v23 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject publisherLocation](v23, "publisherLocation"));
  if (!objc_msgSend(v24, "length"))
  {

LABEL_22:
    goto LABEL_23;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "publisherLocation"));
  v27 = -[__CFString isEqualToString:](v22, "isEqualToString:", v26);

  if ((v27 & 1) == 0)
  {
    v28 = _ITEpubParsingLog();
    v23 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "publisherLocation"));
      v60 = 138544386;
      v61 = CFSTR("self.book.publisherLocation");
      v62 = 2160;
      v63 = 1752392040;
      v64 = 2112;
      v65 = v22;
      v66 = 2160;
      v67 = 1752392040;
      v68 = 2112;
      v69 = v30;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", (uint8_t *)&v60, 0x34u);

    }
    goto LABEL_22;
  }
LABEL_23:

  v31 = a3->var11;
  if (v31 && (CFRetain(v31), (v32 = a3->var11) != 0))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v33, "setPublisherLocation:", v32);

  }
  else
  {
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    -[__CFString setPublisherLocation:](v32, "setPublisherLocation:", 0);
  }

  var12 = a3->var12;
  if (var12)
  {
    CFRetain(var12);
    v35 = a3->var12;
  }
  else
  {
    v35 = 0;
  }
  v36 = v35;
  v37 = objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject publisherYear](v37, "publisherYear"));
  if (!objc_msgSend(v38, "length"))
  {

LABEL_35:
    goto LABEL_36;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "publisherYear"));
  v41 = -[__CFString isEqualToString:](v36, "isEqualToString:", v40);

  if ((v41 & 1) == 0)
  {
    v42 = _ITEpubParsingLog();
    v37 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "publisherYear"));
      v60 = 138544386;
      v61 = CFSTR("self.book.publisherYear");
      v62 = 2160;
      v63 = 1752392040;
      v64 = 2112;
      v65 = v36;
      v66 = 2160;
      v67 = 1752392040;
      v68 = 2112;
      v69 = v44;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\", (uint8_t *)&v60, 0x34u);

    }
    goto LABEL_35;
  }
LABEL_36:

  v45 = a3->var12;
  if (v45 && (CFRetain(v45), (v46 = a3->var12) != 0))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v47, "setPublisherYear:", v46);

  }
  else
  {
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    -[__CFString setPublisherYear:](v46, "setPublisherYear:", 0);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "publisherName"));
  v50 = v49 == 0;

  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v51, "setPublisherName:", &stru_1C3088);

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "publisherLocation"));
  v54 = v53 == 0;

  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v55, "setPublisherLocation:", &stru_1C3088);

  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "publisherYear"));
  v58 = v57 == 0;

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v59, "setPublisherYear:", &stru_1C3088);

  }
}

- (void)setAppleDisplayOptionsFromParser:(BKReadableFormat *)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));

  if (v5)
  {
    v6 = (*((uint64_t (**)(BKReadableFormat *))a3->var0 + 14))(a3);
    v67 = (id)objc_claimAutoreleasedReturnValue(v6);
    if (!v67)
    {
LABEL_26:

      return;
    }
    *(_QWORD *)&v7 = objc_opt_class(NSString).n128_u64[0];
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("fixed-layout"), v7));
    v11 = BUDynamicCast(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (objc_msgSend(v12, "isEqualToString:", CFSTR("true")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v13, "setFixedLayout:", 1);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("interactive")));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("true"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v16, "setInteractive:", 1);

    }
    *(_QWORD *)&v17 = objc_opt_class(NSString).n128_u64[0];
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("specified-fonts"), v17));
    v21 = BUDynamicCast(v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (objc_msgSend(v22, "isEqualToString:", CFSTR("true")))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v23, "setHasBuiltInFonts:", 1);

    }
    *(_QWORD *)&v24 = objc_opt_class(NSString).n128_u64[0];
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("binding"), v24));
    v28 = BUDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (objc_msgSend(v29, "isEqualToString:", CFSTR("false")))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v30, "setHidesSpine:", 1);

    }
    *(_QWORD *)&v31 = objc_opt_class(NSString).n128_u64[0];
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("spread"), v31));
    v35 = BUDynamicCast(v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v37, "setFixedLayoutSpread:", v36);

    *(_QWORD *)&v38 = objc_opt_class(NSString).n128_u64[0];
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("flow"), v38));
    v42 = BUDynamicCast(v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v44, "setFixedLayoutFlow:", v43);

    *(_QWORD *)&v45 = objc_opt_class(NSString).n128_u64[0];
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("open-to-spread"), v45));
    v49 = BUDynamicCast(v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    if (v50)
    {
      if (objc_msgSend(v50, "isEqualToString:", CFSTR("true")))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        objc_msgSend(v51, "setOpenToSpread:", 1);
      }
      else
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        objc_msgSend(v51, "setOpenToSpread:", 0);
      }
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v51, "setOpenToSpread:", 0x7FFFFFFFFFFFFFFFLL);
    }

    *(_QWORD *)&v52 = objc_opt_class(NSString).n128_u64[0];
    v54 = v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("orientation-lock"), v52));
    v56 = BUDynamicCast(v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

    if (v57)
    {
      if (objc_msgSend(v57, "isEqualToString:", CFSTR("portrait-only")))
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        objc_msgSend(v58, "setLandscapeProhibited:", 1);
LABEL_22:

        goto LABEL_23;
      }
      if (objc_msgSend(v57, "isEqualToString:", CFSTR("landscape-only")))
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
        objc_msgSend(v58, "setPortraitProhibited:", 1);
        goto LABEL_22;
      }
    }
LABEL_23:
    *(_QWORD *)&v59 = objc_opt_class(NSString).n128_u64[0];
    v61 = v60;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "valueForKey:", CFSTR("respect-image-size-class"), v59));
    v63 = BUDynamicCast(v61, v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

    if (objc_msgSend(v64, "length"))
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v65, "setRespectImageSizeClass:", v64);

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v66, "setRespectImageSizeClassIsPrefix:", 0);

    }
    goto LABEL_26;
  }
}

- (void)setObeyPageBreaksFromPlist:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("obeyPageBreaks")));
  v7 = (id)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "BOOLValue") & 1) != 0)
    v5 = objc_msgSend(v7, "BOOLValue");
  else
    v5 = &dword_0 + 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  objc_msgSend(v6, "setObeyPageBreaks:", v5);

}

- (void)setArtworkTemplateFromPlist:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("artwork-template-name")));
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v4) & 1) != 0)
  {
    v5 = v9;
LABEL_5:
    v7 = v5;
    goto LABEL_7;
  }
  objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v8, "setGenericCoverTemplate:", v7);

  }
}

- (void)setLanguageFromPlist:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist languageFromPlistEntry:](IMLibraryPlist, "languageFromPlistEntry:", a3));
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v4, "setBookLanguage:", v5);

  }
}

- (void)setCoverWritingModeFromPlist:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist coverWritingModeFromPlistEntry:](IMLibraryPlist, "coverWritingModeFromPlistEntry:", a3));
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "imIsDefaultWritingMode");
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
      objc_msgSend(v7, "setCoverWritingModeString:", v8);

      v5 = v8;
    }
  }

}

- (void)setScrollAxisModeFromPlist:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist scrollDirectionFromPlistEntry:](IMLibraryPlist, "scrollDirectionFromPlistEntry:", a3));
  if (v5
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("horizontal")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("vertical"))))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
    objc_msgSend(v4, "setScrollDirection:", v5);

  }
}

- (void)setEndOfBookExperienceFromPlist:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id obj;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist endOfBookExperiencesFromItunesMetadataEntry:](IMLibraryPlist, "endOfBookExperiencesFromItunesMetadataEntry:", a3));
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist experienceKindFromExperienceEntry:](IMLibraryPlist, "experienceKindFromExperienceEntry:", v4));
        if (objc_msgSend(v25, "isEqualToString:", CFSTR("end-of-book")))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist experienceLocationFromExperienceEntry:](IMLibraryPlist, "experienceLocationFromExperienceEntry:", v4));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist experienceLocationTypeFromExperienceEntry:](IMLibraryPlist, "experienceLocationTypeFromExperienceEntry:", v4));
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("cfi")))
          {
            v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
            objc_msgSend(v5, "setEndOfBookLocation:", v23);

            v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
            objc_msgSend(v6, "setEndOfBookConfidence:", &off_1CD6B8);

            v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
            objc_msgSend(v7, "setEndOfBookValidRange:", 0);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist experienceVersionFromExperienceEntry:](IMLibraryPlist, "experienceVersionFromExperienceEntry:", v4));
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
          objc_msgSend(v8, "setEndOfBookVersion:", v24);

          v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist experienceParamsFromExperienceEntry:](IMLibraryPlist, "experienceParamsFromExperienceEntry:", v4));
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(_QWORD *)v28 != v12)
                  objc_enumerationMutation(v10);
                v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist experienceConfidenceFromExperienceParamEntry:](IMLibraryPlist, "experienceConfidenceFromExperienceParamEntry:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j)));
                v15 = v14;
                if (v14)
                {
                  objc_msgSend(v14, "floatValue");
                  if (*(float *)&v16 > 1.0)
                    *(float *)&v16 = 1.0;
                  if (*(float *)&v16 < 0.0)
                    *(float *)&v16 = 0.0;
                  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
                  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
                  objc_msgSend(v18, "setEndOfBookConfidence:", v17);

                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v11);
          }

        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v22);
  }

}

- (void)resetItunesMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookParser book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookBundlePath"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));

  v5 = (void *)v7;
  if (v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:"));
    if (v6)
    {
      -[BKEpubBookParser setObeyPageBreaksFromPlist:](self, "setObeyPageBreaksFromPlist:", v6);
      -[BKEpubBookParser setArtworkTemplateFromPlist:](self, "setArtworkTemplateFromPlist:", v6);
      -[BKEpubBookParser setLanguageFromPlist:](self, "setLanguageFromPlist:", v6);
      -[BKEpubBookParser setCoverWritingModeFromPlist:](self, "setCoverWritingModeFromPlist:", v6);
      -[BKEpubBookParser setScrollAxisModeFromPlist:](self, "setScrollAxisModeFromPlist:", v6);
      -[BKEpubBookParser setEndOfBookExperienceFromPlist:](self, "setEndOfBookExperienceFromPlist:", v6);
    }

    v5 = (void *)v7;
  }

}

+ (BOOL)isValidMimeType:(id)a3
{
  id v3;
  ITEpubFolder *v4;
  const char *v5;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  v4 = (ITEpubFolder *)objc_msgSend(v3, "UTF8String");
  v5 = (const char *)objc_msgSend(v3, "length");
  LOBYTE(v4) = ITEpubFolder::isMimetypeFileContentsValid(v4, v5, 0, 0, v6) != 0;

  return (char)v4;
}

@end
