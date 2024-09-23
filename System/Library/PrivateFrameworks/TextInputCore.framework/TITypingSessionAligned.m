@implementation TITypingSessionAligned

- (void)computeAlignedWordsFromSession:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  TIDocumentWordsAligned *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  __CFString *v130;
  __CFString *v131;
  __CFString *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  char v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  __CFString *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  int v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  char v198;
  void *v199;
  uint64_t v200;
  void *v201;
  const __CFString *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  char v220;
  id v221;
  BOOL v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t k;
  char v228;
  void *v229;
  void *v230;
  int v231;
  void *v232;
  _BOOL8 v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t m;
  int v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  void *v245;
  void *v246;
  uint64_t v247;
  NSArray *alignedEntries;
  void *context;
  NSArray *v250;
  void *v251;
  __CFString *v252;
  id v253;
  char v254;
  void *v255;
  void *v256;
  void *v258;
  void *v259;
  uint64_t v260;
  char v261;
  void *v262;
  void *v263;
  uint64_t v264;
  id obj;
  id obja;
  id v267;
  __CFString *v268;
  char v269;
  TIDocumentWordsAligned *v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  unint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  void *v278;
  void *v279;
  int v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  _BYTE v301[128];
  _BYTE v302[128];
  _BYTE v303[128];
  _BYTE v304[128];
  _BYTE v305[128];
  uint64_t v306;

  v306 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "userActionHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v250 = (NSArray *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1DF0A2708]();
    v6 = objc_alloc_init(TIDocumentWordsAligned);
    objc_msgSend(v3, "userActionHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    objc_msgSend(v3, "userActionHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextBeforeInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = v3;
    v270 = v6;
    v260 = v8;
    if (v8)
    {
      v14 = 0;
      v262 = 0;
      v15 = 0;
      v254 = 0;
      v269 = 0;
      v261 = 0;
      v267 = 0;
      v16 = 0;
      while (1)
      {
        v17 = v14;
        objc_msgSend(v3, "userActionHistory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v264 = v16;
        if (objc_msgSend(v14, "actionType") == 10)
        {
          if (!v16)
          {
            objc_msgSend(v14, "keyboardState");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "emojiSearchMode");

            if ((v20 & 1) == 0)
            {
              objc_msgSend(v14, "originalWordEntries");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setOriginalWords:", v21);

              v299 = 0u;
              v300 = 0u;
              v297 = 0u;
              v298 = 0u;
              objc_msgSend(v3, "originalWords");
              v22 = (id)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v297, v305, 16);
              if (v23)
              {
                v24 = v23;
                v25 = v14;
                v26 = *(_QWORD *)v298;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v298 != v26)
                      objc_enumerationMutation(v22);
                    -[TIDocumentWordsAligned pushWordToDocument:](v6, "pushWordToDocument:", *(_QWORD *)(*((_QWORD *)&v297 + 1) + 8 * i));
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v297, v305, 16);
                }
                while (v24);
                v14 = v25;
              }
              goto LABEL_177;
            }
          }
          goto LABEL_178;
        }
        if (objc_msgSend(v14, "actionType"))
        {
          if (objc_msgSend(v14, "actionType") == 1
            && -[TIDocumentWordsAligned wordsCount](v6, "wordsCount"))
          {
            v28 = v14;
            v29 = v14;
            objc_msgSend(v29, "documentState");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "contextAfterInput");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "length");

            objc_msgSend(v29, "documentState");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "contextBeforeInput");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              -[TIDocumentWordsAligned wordsFromContext:](v6, "wordsFromContext:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v283 = 0u;
              v284 = 0u;
              v281 = 0u;
              v282 = 0u;
              v36 = v35;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v281, v301, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v282;
                do
                {
                  for (j = 0; j != v38; ++j)
                  {
                    if (*(_QWORD *)v282 != v39)
                      objc_enumerationMutation(v36);
                    v41 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * j);
                    objc_msgSend(v41, "editedEntry");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v42)
                      objc_msgSend(v41, "setWordAlignmentConf:", 1);
                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v281, v301, 16);
                }
                while (v38);
                v43 = v36;
                v3 = v253;
              }
              else
              {
                v43 = v36;
              }
LABEL_174:
              v14 = v28;
LABEL_175:

LABEL_176:
              v22 = v14;
              goto LABEL_177;
            }
            -[TIDocumentWordsAligned deleteWordsUpToContext:](v6, "deleteWordsUpToContext:", v34);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            -[TIDocumentWordsAligned inDocumentWordsStack](v6, "inDocumentWordsStack");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "lastObject");
            v36 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v43, "count"))
            {
              objc_msgSend(v43, "firstObject");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v57;
              if (!v57)
                goto LABEL_173;
              if (objc_msgSend(v57, "followsContinuousPath"))
              {
                if (v36)
                {
                  v59 = 2;
                  goto LABEL_172;
                }
                goto LABEL_173;
              }
              if (!v36)
                goto LABEL_173;
              objc_msgSend(v29, "documentState");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v206, "contextBeforeInput");
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v207, "endsInWhitespace"))
              {

                goto LABEL_165;
              }
              objc_msgSend(v29, "documentState");
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v214, "contextBeforeInput");
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              v280 = objc_msgSend(v215, "endsInPunctuation");

              if (v280)
LABEL_165:
                v59 = 2;
              else
                v59 = 1;
              v6 = v270;
LABEL_172:
              objc_msgSend(v36, "setUnfinishedWordEntryTreatment:", v59);
LABEL_173:

              goto LABEL_174;
            }
            objc_msgSend(v29, "allKeyboardInputs");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v118, "count") != 1)
            {

              v254 = 1;
              goto LABEL_174;
            }
            objc_msgSend(v29, "allKeyboardInputs");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "firstObject");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v120, "isBackspace");

            v254 = 1;
            if (v121)
            {
              v14 = v28;
              if (v36)
              {
                objc_msgSend(v36, "allKeyboardInputs");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v122, "count"))
                {
                  objc_msgSend(v36, "allKeyboardInputs");
                  v278 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v278, "lastObject");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "string");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v124, "stringByTrimmingCharactersInSet:", v125);
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  v275 = objc_msgSend(v126, "length");

                  v254 = 1;
                  if (!v275)
                    objc_msgSend(v36, "setUnfinishedWordEntryTreatment:", 1);
                  goto LABEL_218;
                }

                v254 = 1;
              }
              v6 = v270;
              goto LABEL_175;
            }
LABEL_218:
            v6 = v270;
            goto LABEL_174;
          }
          if (objc_msgSend(v14, "actionType") == 2)
          {
            v22 = v14;
            if (objc_msgSend(v22, "isSelection"))
            {
              if (objc_msgSend(v262, "actionType") == 2)
              {
                v43 = v267;
                v269 = 1;
                v267 = v262;
                goto LABEL_176;
              }
              v269 = 1;
            }
LABEL_177:

LABEL_178:
            v261 = 0;
            v44 = v15;
LABEL_179:
            v221 = v14;

            v262 = v221;
            goto LABEL_180;
          }
          v261 = 0;
          v44 = v15;
          goto LABEL_180;
        }
        v44 = v14;

        if (objc_msgSend(v44, "cancelled"))
        {
          objc_msgSend(v44, "setDeleted:", 1);
          v261 = 0;
          goto LABEL_180;
        }
        objc_msgSend(v44, "setFollowsContinuousPath:", v261 & 1);
        objc_msgSend(v44, "acceptedCandidate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v261 = objc_msgSend(v45, "isContinuousPathConversion");

        objc_msgSend(v44, "acceptedString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v46, "isEqualToString:", &stru_1EA1081D0) & 1) == 0)
          break;
        v47 = objc_msgSend(v44, "candidateContainsEmoji");

        if ((v47 & 1) != 0)
          goto LABEL_53;
LABEL_41:
        v50 = v14;
        objc_msgSend(v44, "allKeyboardInputs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "lastObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "acceptedCandidate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "candidate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDocumentWordsAligned lastWord](v6, "lastWord");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqualToString:", v54);

        if (!v55)
        {
          v6 = v270;
          v14 = v50;
          goto LABEL_52;
        }
        v44 = v44;

        v262 = v44;
        v6 = v270;
        v14 = v50;
LABEL_180:
        v16 = v264 + 1;
        v15 = v44;
        if (v264 + 1 == v260)
          goto LABEL_225;
      }
      objc_msgSend(v44, "acceptedString");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v48, "isEqualToString:", CFSTR(" ")) & 1) != 0)
      {
        v49 = objc_msgSend(v44, "candidateContainsEmoji");

        if ((v49 & 1) != 0)
          goto LABEL_53;
        goto LABEL_41;
      }

LABEL_52:
LABEL_53:
      v255 = v14;
      objc_msgSend(v44, "allKeyboardInputs");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = v44;
      if (objc_msgSend(v60, "count"))
      {
        objc_msgSend(v44, "allKeyboardInputs");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isBackspace");

        v64 = v267;
        if ((v63 & 1) != 0)
        {
          v254 = 1;
LABEL_58:
          objc_msgSend(v44, "acceptedString");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "componentsSeparatedByCharactersInSet:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v44, "acceptedCandidate");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "input");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "componentsSeparatedByCharactersInSet:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v259 = v67;
          v72 = objc_msgSend(v67, "count");
          v258 = v71;
          v73 = objc_msgSend(v71, "count");
          -[TIDocumentWordsAligned inDocumentWordsStack](v6, "inDocumentWordsStack");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "count");

          v14 = v255;
          if (v72 >= 2 && v72 == v73)
          {
            objc_msgSend(v44, "documentContextBeforeInput");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIDocumentWordsAligned wordsForContext:](v6, "wordsForContext:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v77, "count"))
            {
              -[TIDocumentWordsAligned inDocumentWordsStack](v6, "inDocumentWordsStack");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = objc_msgSend(v78, "indexOfObject:", v79);

              if ((v80 & 0x8000000000000000) == 0)
              {
                v81 = v72 - 1;
                v271 = v80;
                if (v80 + v72 - 1 <= v75)
                {
                  obj = v77;
                  v82 = 0;
                  if (v81 >= v72)
                    v81 = v72;
                  v274 = v81;
                  v6 = v270;
                  v83 = v80;
                  while (1)
                  {
                    -[TIDocumentWordsAligned inDocumentWordsStack](v6, "inDocumentWordsStack");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "objectAtIndexedSubscript:", v83 + v82);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v259, "objectAtIndexedSubscript:", v82);
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v258, "objectAtIndexedSubscript:", v82);
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "acceptedCandidate");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "candidate");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    v277 = v87;
                    if ((objc_msgSend(v86, "isEqualToString:", v89) & 1) != 0)
                    {
                      objc_msgSend(v85, "acceptedCandidate");
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v90, "input");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      v92 = objc_msgSend(v87, "isEqualToString:", v91);

                      if ((v92 & 1) != 0)
                        goto LABEL_71;
                    }
                    else
                    {

                    }
                    -[TIDocumentWordsAligned removeFromContextMap:](v270, "removeFromContextMap:", v85);
                    objc_msgSend(v273, "acceptedCandidate");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "acceptedCandidate");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "input");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "candidateByReplacingWithCandidate:input:", v86, v95);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "setAcceptedCandidate:", v96);

                    objc_msgSend(v85, "acceptedCandidate");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "candidate");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "setAcceptedString:", v98);

                    v99 = (void *)MEMORY[0x1E0DBDB78];
                    objc_msgSend(v85, "documentState");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v100, "selectedText");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "documentState");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "contextAfterInput");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "documentStateWithContextBefore:selectedText:contextAfter:", v76, v101, v103);
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "setDocumentState:", v104);

                    objc_msgSend(v85, "setWordEntryType:", objc_msgSend(v85, "wordEntryType") | 1);
                    objc_msgSend(v85, "setIsRetrocorrection:", 1);
                    v83 = v271;
                    -[TIDocumentWordsAligned addToContextMap:](v270, "addToContextMap:", v85);
LABEL_71:
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v76, v86);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();

                    ++v82;
                    v76 = v105;
                    v6 = v270;
                    if (v274 == v82)
                    {
                      objc_msgSend(v273, "acceptedCandidate");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v259, "lastObject");
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v258, "lastObject");
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v106, "candidateByReplacingWithCandidate:input:", v107, v108);
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v273, "setAcceptedCandidate:", v109);

                      objc_msgSend(v273, "acceptedCandidate");
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "candidate");
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v273, "setAcceptedString:", v111);

                      v112 = (void *)MEMORY[0x1E0DBDB78];
                      objc_msgSend(v273, "documentState");
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v113, "selectedText");
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v273, "documentState");
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v115, "contextAfterInput");
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v112, "documentStateWithContextBefore:selectedText:contextAfter:", v105, v114, v116);
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v273, "setDocumentState:", v117);

                      v3 = v253;
                      v14 = v255;
                      v77 = obj;
                      v64 = v267;
                      goto LABEL_81;
                    }
                  }
                }
              }
              v105 = v76;
              v6 = v270;
              v14 = v255;
            }
            else
            {
              v105 = v76;
            }
LABEL_81:

          }
          objc_msgSend(v273, "documentState");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "contextBeforeInput");
          v128 = objc_claimAutoreleasedReturnValue();
          v129 = (void *)v128;
          v130 = &stru_1EA1081D0;
          if (v128)
            v130 = (__CFString *)v128;
          v131 = v130;

          v132 = v131;
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByTrimmingCharactersInSet:](v131, "stringByTrimmingCharactersInSet:", v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDocumentWordsAligned wordsForContext:](v6, "wordsForContext:", v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();

          obja = v135;
          v252 = v132;
          if (!objc_msgSend(v135, "count")
            && (objc_msgSend(v262, "actionType") != 2
             || !-[TIDocumentWordsAligned wordsCount](v6, "wordsCount")))
          {
            v44 = v273;
            objc_msgSend(v273, "setWordAlignmentConf:", 3);
            if (v264)
            {
              -[TIDocumentWordsAligned description](v6, "description");
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v251, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v147, v132);
                v148 = objc_claimAutoreleasedReturnValue();

                v147 = (void *)v148;
              }
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByTrimmingCharactersInSet:](v132, "stringByTrimmingCharactersInSet:", v149);
              v150 = (void *)objc_claimAutoreleasedReturnValue();

              if (v150 && (objc_msgSend(v147, "isEqualToString:", v150) & 1) == 0)
                objc_msgSend(v273, "setWordAlignmentConf:", 2);

              v14 = v255;
            }
            goto LABEL_102;
          }
          if (objc_msgSend(v262, "actionType") == 2
            || objc_msgSend(v262, "actionType") == 10)
          {
            v136 = v262;
            v279 = v136;
            if (!objc_msgSend(v136, "extendsPriorWord"))
            {
              objc_msgSend(v273, "setWordAlignmentConf:", 1);
              if (objc_msgSend(v135, "count"))
              {
                objc_msgSend(v135, "objectAtIndexedSubscript:", 0);
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                -[TIDocumentWordsAligned insertWord:atIndex:](v6, "insertWord:atIndex:", v273, objc_msgSend(v151, "sessionIndex"));

              }
LABEL_150:
              v267 = v64;

              v146 = 1;
LABEL_151:
              v44 = v273;
              goto LABEL_152;
            }
            v44 = v273;
            objc_msgSend(v273, "documentState");
            v137 = (void *)objc_claimAutoreleasedReturnValue();

            if (v137)
            {
              objc_msgSend(v273, "acceptedCandidate");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v138, "isContinuousPathConversion") & 1) == 0)
              {
                objc_msgSend(v273, "allKeyboardInputs");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = objc_msgSend(v139, "count");

                if (!v140)
                {
                  objc_msgSend(obja, "lastObject");
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "acceptedCandidate");
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v142, "candidate");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v273, "acceptedString");
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  v145 = objc_msgSend(v143, "isEqualToString:", v144);

                  if (v145)
                  {

                    v146 = 0;
                    v6 = v270;
                    goto LABEL_152;
                  }
                  objc_msgSend(v273, "acceptedCandidate");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v216, "input");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "acceptedCandidate");
                  v218 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v218, "candidate");
                  v219 = (void *)objc_claimAutoreleasedReturnValue();
                  v220 = objc_msgSend(v217, "isEqualToString:", v219);

                  if ((v220 & 1) == 0)
                  {

                    v146 = 0;
                    v6 = v270;
                    goto LABEL_151;
                  }
                  v6 = v270;
                }
                goto LABEL_113;
              }
            }
            else
            {
              objc_msgSend(v136, "documentState");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "contextBeforeInput");
              v138 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v136, "inWordRange") != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v138, "substringToIndex:", objc_msgSend(v136, "inWordRange"));
                v158 = objc_claimAutoreleasedReturnValue();

                v138 = (void *)v158;
              }
              -[TIDocumentWordsAligned wordsForContext:](v6, "wordsForContext:", v138);
              v159 = objc_claimAutoreleasedReturnValue();

              obja = (id)v159;
            }

LABEL_113:
            if (objc_msgSend(obja, "count"))
            {
              v295 = 0u;
              v296 = 0u;
              v293 = 0u;
              v294 = 0u;
              v160 = obja;
              obja = v160;
              v276 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v293, v304, 16);
              if (!v276)
                goto LABEL_147;
              v272 = *(_QWORD *)v294;
              while (1)
              {
                v161 = 0;
                v162 = v279;
                do
                {
                  if (*(_QWORD *)v294 != v272)
                    objc_enumerationMutation(obja);
                  v163 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * v161);
                  objc_msgSend(v163, "documentState");
                  v164 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v164, "contextBeforeInput");
                  v165 = objc_claimAutoreleasedReturnValue();

                  if (v165)
                    v166 = (__CFString *)v165;
                  else
                    v166 = &stru_1EA1081D0;
                  v167 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v163, "acceptedString");
                  v168 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v167, "stringWithFormat:", CFSTR("%@%@"), v166, v168);
                  v169 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v162, "inWord");
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v163, "acceptedString");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  v172 = objc_msgSend(v170, "isEqualToString:", v171);

                  if (v172)
                  {
                    objc_msgSend(v162, "documentState");
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v173, "contextBeforeInput");
                    v174 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v162, "documentState");
                    v175 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v175, "contextAfterInput");
                    v176 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v176)
                    {
                      objc_msgSend(v162, "documentState");
                      v177 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v177, "contextBeforeInput");
                      v178 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v162, "documentState");
                      v268 = v166;
                      v179 = v169;
                      v180 = v64;
                      v181 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v181, "contextAfterInput");
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v178, "stringByAppendingString:", v182);
                      v183 = objc_claimAutoreleasedReturnValue();

                      v162 = v279;
                      v64 = v180;
                      v169 = v179;
                      v166 = v268;

                      v174 = (void *)v183;
                      v6 = v270;
                    }
                    if (objc_msgSend(v162, "inWordRange") != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v184 = objc_msgSend(v162, "inWordRange");
                      v185 = v162;
                      v186 = v184;
                      objc_msgSend(v185, "inWordRange");
                      v188 = v187 + v186;
                      if (v187 + v186 <= (unint64_t)objc_msgSend(v174, "length"))
                      {
                        objc_msgSend(v174, "substringToIndex:", v188);
                        v191 = (void *)objc_claimAutoreleasedReturnValue();
                        v162 = v279;
                        if (objc_msgSend(v191, "isEqualToString:", v169))
                        {
                          objc_msgSend(v163, "addUserEdit:", v273);
                          objc_msgSend(v163, "setEditActionType:", objc_msgSend(v279, "actionType"));
                          objc_msgSend(v163, "setEditActionExtendsPriorWord:", objc_msgSend(v279, "extendsPriorWord"));
                          objc_msgSend(v163, "setWordAlignmentConf:", 3);
                        }

                      }
                      else
                      {
                        v162 = v279;
                      }
                    }
                    goto LABEL_144;
                  }
                  if ((v269 & 1) != 0)
                  {
                    objc_msgSend(v64, "inWord");
                    v189 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v163, "acceptedString");
                    v190 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v189, "isEqualToString:", v190))
                    {

LABEL_135:
                      objc_msgSend(v163, "addUserEdit:", v273);
                      v162 = v279;
                      objc_msgSend(v163, "setEditActionType:", objc_msgSend(v279, "actionType"));
                      objc_msgSend(v163, "setEditActionExtendsPriorWord:", objc_msgSend(v279, "extendsPriorWord"));
                      objc_msgSend(v163, "setWordAlignmentConf:", 3);
                      v269 = 0;
                      v174 = v64;
                      v64 = 0;
                      goto LABEL_144;
                    }
                    v192 = objc_msgSend(v273, "wordEntryType") & 0xC0;

                    if (v192)
                      goto LABEL_135;
                  }
                  objc_msgSend(v273, "documentState");
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v193, "contextAfterInput");
                  v194 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v194)
                  {

                  }
                  else
                  {
                    -[TIDocumentWordsAligned lastWord](v6, "lastWord");
                    v195 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v163, "acceptedCandidate");
                    v196 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v196, "candidate");
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    v198 = objc_msgSend(v195, "isEqualToString:", v197);

                    if ((v198 & 1) != 0)
                    {
                      v6 = v270;
                      v162 = v279;
                      goto LABEL_145;
                    }
                  }
                  objc_msgSend(v263, "appendString:", CFSTR("<BOS>"));
                  objc_msgSend(v273, "documentState");
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v199, "contextBeforeInput");
                  v200 = objc_claimAutoreleasedReturnValue();
                  v201 = (void *)v200;
                  if (v200)
                    v202 = (const __CFString *)v200;
                  else
                    v202 = &stru_1EA1081D0;
                  objc_msgSend(v263, "stringByAppendingString:", v202);
                  v174 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateWithContextBefore:selectedText:contextAfter:", v174, 0, 0);
                  v203 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v273, "setDocumentState:", v203);

                  v6 = v270;
                  -[TIDocumentWordsAligned pushWordToDocument:](v270, "pushWordToDocument:", v273);
                  v162 = v279;
LABEL_144:

LABEL_145:
                  ++v161;
                }
                while (v276 != v161);
                v160 = obja;
                v276 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v293, v304, 16);
                if (!v276)
                {
LABEL_147:

                  v3 = v253;
                  v14 = v255;
                  goto LABEL_150;
                }
              }
            }
            objc_msgSend(v273, "documentState");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v204, "contextAfterInput");
            v205 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v205)
              -[TIDocumentWordsAligned pushWordToDocument:](v6, "pushWordToDocument:", v273);
            goto LABEL_150;
          }
          if (((objc_msgSend(v135, "count") != 0) & v254) != 1)
          {
            v44 = v273;
            objc_msgSend(v273, "documentState");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v208, "contextAfterInput");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            v210 = objc_msgSend(v209, "length");

            if (v210)
              goto LABEL_103;
            if (objc_msgSend(v262, "actionType")
              || !-[TITypingSessionAligned isNewLineScenarioWithCurrentWord:andPreviousWord:](self, "isNewLineScenarioWithCurrentWord:andPreviousWord:", v273, v262))
            {
              objc_msgSend(v273, "documentState");
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "contextBeforeInput");
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              v213 = -[TIDocumentWordsAligned deleteWordsUpToContext:](v6, "deleteWordsUpToContext:", v212);

            }
LABEL_102:
            -[TIDocumentWordsAligned pushWordToDocument:](v6, "pushWordToDocument:", v44);
LABEL_103:
            v146 = 1;
            goto LABEL_152;
          }
          objc_msgSend(v135, "firstObject");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v273;
          objc_msgSend(v273, "documentState");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "contextAfterInput");
          v154 = objc_claimAutoreleasedReturnValue();
          if (v154)
          {
            v155 = (void *)v154;
            v156 = 0;
          }
          else
          {
            if (objc_msgSend(v262, "actionType"))
            {

            }
            else
            {
              v222 = -[TITypingSessionAligned isNewLineScenarioWithCurrentWord:andPreviousWord:](self, "isNewLineScenarioWithCurrentWord:andPreviousWord:", v273, v262);

              if (v222)
              {
                v156 = 0;
                goto LABEL_186;
              }
            }
            objc_msgSend(v273, "documentState");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "contextBeforeInput");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIDocumentWordsAligned deleteWordsUpToContext:](v270, "deleteWordsUpToContext:", v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
          }

LABEL_186:
          v291 = 0u;
          v292 = 0u;
          v289 = 0u;
          v290 = 0u;
          objc_msgSend(v273, "allKeyboardInputs");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v289, v303, 16);
          if (v224)
          {
            v225 = v224;
            v226 = *(_QWORD *)v290;
            while (2)
            {
              for (k = 0; k != v225; ++k)
              {
                if (*(_QWORD *)v290 != v226)
                  objc_enumerationMutation(v223);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v289 + 1) + 8 * k), "isBackspace") & 1) != 0)
                {
                  v228 = 1;
                  goto LABEL_196;
                }
              }
              v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v289, v303, 16);
              if (v225)
                continue;
              break;
            }
            v228 = 0;
LABEL_196:
            v3 = v253;
          }
          else
          {
            v228 = 0;
          }

          objc_msgSend(v273, "acceptedCandidate");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          v254 = objc_msgSend(v229, "isContinuousPathConversion");
          if ((v254 & 1) != 0)
          {
            v230 = v273;
          }
          else
          {
            if ((v228 & 1) != 0)
            {

            }
            else
            {
              v231 = objc_msgSend(v262, "actionType");

              if (v231 != 1)
              {
                v254 = 1;
                v230 = v273;
LABEL_222:
                -[TIDocumentWordsAligned pushWordToDocument:](v270, "pushWordToDocument:", v230);
                goto LABEL_223;
              }
            }
            objc_msgSend(v152, "addUserEdit:", v273);
            objc_msgSend(v152, "editedEntry");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v232, "setExtendsPriorWord:", 1);

            objc_msgSend(v152, "setEditActionType:", objc_msgSend(v262, "actionType"));
            v233 = (objc_opt_respondsToSelector() & 1) != 0
                && objc_msgSend(v262, "performSelector:", sel_extendsPriorWord) != 0;
            objc_msgSend(v152, "setEditActionExtendsPriorWord:", v233);
            if (!objc_msgSend(v156, "count"))
            {
              v254 = 0;
LABEL_223:

              v146 = 1;
              v6 = v270;
              v14 = v255;
LABEL_152:

              if ((v146 & 1) == 0)
                goto LABEL_180;
              goto LABEL_179;
            }
            objc_msgSend(v152, "setDeleted:", 0);
            v287 = 0u;
            v288 = 0u;
            v285 = 0u;
            v286 = 0u;
            objc_msgSend(v152, "allEdits");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            v234 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v285, v302, 16);
            if (v234)
            {
              v235 = v234;
              v236 = *(_QWORD *)v286;
              do
              {
                for (m = 0; m != v235; ++m)
                {
                  if (*(_QWORD *)v286 != v236)
                    objc_enumerationMutation(v229);
                  objc_msgSend(*(id *)(*((_QWORD *)&v285 + 1) + 8 * m), "setDeleted:", 0);
                }
                v235 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v285, v302, 16);
              }
              while (v235);
              v230 = v152;
              v3 = v253;
            }
            else
            {
              v230 = v152;
            }
          }

          goto LABEL_222;
        }
      }
      else
      {

        v64 = v267;
      }
      v254 |= objc_msgSend(v262, "actionType") == 1;
      goto LABEL_58;
    }
    v267 = 0;
    v44 = 0;
    v262 = 0;
    v14 = 0;
LABEL_225:
    v256 = v14;
    v238 = -[TIDocumentWordsAligned wordsCount](v6, "wordsCount");
    -[TITypingSessionAligned setFirstCPEntryIndex:](self, "setFirstCPEntryIndex:", -1);
    if (v238 >= 1)
    {
      v239 = 0;
      v240 = v238;
      do
      {
        -[TIDocumentWordsAligned inDocumentWordsStack](v270, "inDocumentWordsStack");
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v241, "objectAtIndexedSubscript:", v239);
        v242 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v242, "origin") != 1
          || (objc_msgSend(v242, "allEdits"),
              v243 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v243, "firstObject"),
              v244 = objc_claimAutoreleasedReturnValue(),
              v242,
              v243,
              (v242 = (void *)v244) != 0))
        {
          +[TITypingSessionAligned alignedEntryForWord:](TITypingSessionAligned, "alignedEntryForWord:", v242);
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "completeString");
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          v247 = objc_msgSend(v246, "length");

          if (v247)
          {
            -[NSArray addObject:](v250, "addObject:", v245);
            if (objc_msgSend(v245, "isContinuousPathConversion"))
            {
              if (-[TITypingSessionAligned firstCPEntryIndex](self, "firstCPEntryIndex") == -1)
              {
                -[TITypingSessionAligned setFirstCPEntryIndex:](self, "setFirstCPEntryIndex:", v239);
                -[TITypingSessionAligned setContainsCPEntries:](self, "setContainsCPEntries:", 1);
              }
            }
          }

        }
        ++v239;
      }
      while (v240 != v239);
    }

    objc_autoreleasePoolPop(context);
    alignedEntries = self->_alignedEntries;
    self->_alignedEntries = v250;

    v3 = v253;
  }

}

- (void)getAlignedTextAndConfidence
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;
  _QWORD v19[7];
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  __CFString *v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7537;
  v26 = __Block_byref_object_dispose__7538;
  v27 = &stru_1EA1081D0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  -[TITypingSessionAligned alignedEntries](self, "alignedEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke;
  v19[3] = &unk_1EA0FFCA8;
  v19[4] = self;
  v19[5] = &v22;
  v19[6] = v20;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v19);

  objc_storeStrong((id *)&self->_alignedText, (id)v23[5]);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7537;
  v17 = __Block_byref_object_dispose__7538;
  v18 = &stru_1EA1081D0;
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_2;
  aBlock[3] = &unk_1EA0FFCD0;
  aBlock[4] = &v13;
  v5 = _Block_copy(aBlock);
  -[TITypingSessionAligned alignedEntries](self, "alignedEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_3;
  v10[3] = &unk_1EA0FFCF8;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  objc_storeStrong((id *)&self->_completeText, (id)v14[5]);
  -[TITypingSessionAligned alignedEntries](self, "alignedEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  self->_success = objc_msgSend(v9, "inSessionAlignmentConfidence") == 3;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

}

- (NSArray)alignedEntries
{
  return self->_alignedEntries;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setFirstCPEntryIndex:(unint64_t)a3
{
  self->_firstCPEntryIndex = a3;
}

- (TITypingSessionAligned)initWithSession:(id)a3
{
  id v4;
  TITypingSessionAligned *v5;
  TITypingSessionAligned *v6;
  uint64_t v7;
  NSArray *layouts;
  uint64_t v9;
  NSLocale *locale;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TITypingSessionAligned;
  v5 = -[TITypingSessionAligned init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TITypingSessionAligned computeAlignedWordsFromSession:](v5, "computeAlignedWordsFromSession:", v4);
    objc_msgSend(v4, "layouts");
    v7 = objc_claimAutoreleasedReturnValue();
    layouts = v6->_layouts;
    v6->_layouts = (NSArray *)v7;

    objc_msgSend(v4, "locale");
    v9 = objc_claimAutoreleasedReturnValue();
    locale = v6->_locale;
    v6->_locale = (NSLocale *)v9;

    -[TITypingSessionAligned getAlignedTextAndConfidence](v6, "getAlignedTextAndConfidence");
  }

  return v6;
}

- (NSString)completeText
{
  return self->_completeText;
}

- (TITypingSessionAligned)initWithCoder:(id)a3
{
  id v4;
  TITypingSessionAligned *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *alignedEntries;
  uint64_t v11;
  NSString *alignedText;
  uint64_t v13;
  NSString *highConfAlignedSubSegment;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *layouts;
  uint64_t v20;
  NSLocale *locale;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TITypingSessionAligned;
  v5 = -[TITypingSessionAligned init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("alignedEntries"));
    v9 = objc_claimAutoreleasedReturnValue();
    alignedEntries = v5->_alignedEntries;
    v5->_alignedEntries = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alignedText"));
    v11 = objc_claimAutoreleasedReturnValue();
    alignedText = v5->_alignedText;
    v5->_alignedText = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highConfAlignedSubSegment"));
    v13 = objc_claimAutoreleasedReturnValue();
    highConfAlignedSubSegment = v5->_highConfAlignedSubSegment;
    v5->_highConfAlignedSubSegment = (NSString *)v13;

    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("layouts"));
    v18 = objc_claimAutoreleasedReturnValue();
    layouts = v5->_layouts;
    v5->_layouts = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v20 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v20;

    v5->_containsCPEntries = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containsCPEntries"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *alignedEntries;
  id v5;

  alignedEntries = self->_alignedEntries;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alignedEntries, CFSTR("alignedEntries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alignedText, CFSTR("alignedText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highConfAlignedSubSegment, CFSTR("highConfAlignedSubSegment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_success, CFSTR("success"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layouts, CFSTR("layouts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_containsCPEntries, CFSTR("containsCPEntries"));

}

- (id)restrictedAlignedSessionWithWordLimit:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  TITypingSessionAligned *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *layouts;
  uint64_t v18;
  NSString *alignedText;
  uint64_t v20;
  NSLocale *locale;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  NSString *highConfAlignedSubSegment;
  BOOL v27;

  -[TITypingSessionAligned alignedEntries](self, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v7 = self;
  }
  else
  {
    v7 = objc_alloc_init(TITypingSessionAligned);
    -[TITypingSessionAligned alignedEntries](self, "alignedEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", 0, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSessionAligned setAlignedEntries:](v7, "setAlignedEntries:", v9);

    -[TITypingSessionAligned alignedText](self, "alignedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    if (v13 >= a3)
      v14 = a3;
    else
      v14 = v13;
    objc_msgSend(v12, "subarrayWithRange:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSessionAligned layouts](self, "layouts");
    v16 = objc_claimAutoreleasedReturnValue();
    layouts = v7->_layouts;
    v7->_layouts = (NSArray *)v16;

    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" "));
    v18 = objc_claimAutoreleasedReturnValue();
    alignedText = v7->_alignedText;
    v7->_alignedText = (NSString *)v18;

    -[TITypingSessionAligned locale](self, "locale");
    v20 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v20;

    v7->_success = -[TITypingSessionAligned success](self, "success");
    -[TITypingSessionAligned alignedText](v7, "alignedText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    -[TITypingSessionAligned highConfAlignedSubSegment](self, "highConfAlignedSubSegment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 >= objc_msgSend(v24, "length"))
      -[TITypingSessionAligned highConfAlignedSubSegment](self, "highConfAlignedSubSegment");
    else
      -[TITypingSessionAligned alignedText](v7, "alignedText");
    v25 = objc_claimAutoreleasedReturnValue();
    highConfAlignedSubSegment = v7->_highConfAlignedSubSegment;
    v7->_highConfAlignedSubSegment = (NSString *)v25;

    v27 = -[TITypingSessionAligned firstCPEntryIndex](self, "firstCPEntryIndex") < a3
       && -[TITypingSessionAligned containsCPEntries](self, "containsCPEntries");
    v7->_containsCPEntries = v27;

  }
  return v7;
}

- (BOOL)compareForConfidenceContextA:(id)a3 contextB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v10;
    v23 = v8;
    if (objc_msgSend(v12, "count"))
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (objc_msgSend(v14, "count", v22, v23) > (unint64_t)v16)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqualToString:", &stru_1EA1081D0) & 1) != 0
          || objc_msgSend(v18, "isEqualToString:", CFSTR(" ")))
        {
          ++v17;
        }
        else
        {
          if ((objc_msgSend(v19, "isEqualToString:", &stru_1EA1081D0) & 1) == 0
            && !objc_msgSend(v19, "isEqualToString:", CFSTR(" ")))
          {
            if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) == 0)
            {

              goto LABEL_18;
            }
            ++v17;
          }
          ++v16;
        }

        v15 = v17;
        if (objc_msgSend(v12, "count") <= (unint64_t)v17)
          break;
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    if (objc_msgSend(v12, "count", v22, v23) <= v15)
      v20 = objc_msgSend(v14, "count") <= (unint64_t)v16;
    else
LABEL_18:
      v20 = 0;

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (id)textToAppendForEntry:(id)a3 sessionIndx:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = v5;
  if (!a4)
    goto LABEL_4;
  objc_msgSend(v5, "originalWord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isPunctuationEntryFollowingAWord") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v6, "originalWord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acceptedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10 > 1)
  {
LABEL_6:
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "expectedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
LABEL_4:
  objc_msgSend(v6, "expectedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

- (BOOL)isNewLineScenarioWithCurrentWord:(id)a3 andPreviousWord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;
  char v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "acceptedCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isContinuousPathConversion");

  v9 = objc_msgSend(v6, "startsWithNewLine");
  v10 = v8 ^ 1 | v9;
  if ((v8 & 1) == 0 && (v9 & 1) == 0)
    v10 = objc_msgSend(v5, "endsWithNewLine");

  return v10;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setAlignedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_alignedEntries, a3);
}

- (NSString)alignedText
{
  return self->_alignedText;
}

- (void)setAlignedText:(id)a3
{
  objc_storeStrong((id *)&self->_alignedText, a3);
}

- (NSString)highConfAlignedSubSegment
{
  return self->_highConfAlignedSubSegment;
}

- (void)setHighConfAlignedSubSegment:(id)a3
{
  objc_storeStrong((id *)&self->_highConfAlignedSubSegment, a3);
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)containsCPEntries
{
  return self->_containsCPEntries;
}

- (void)setContainsCPEntries:(BOOL)a3
{
  self->_containsCPEntries = a3;
}

- (unint64_t)firstCPEntryIndex
{
  return self->_firstCPEntryIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highConfAlignedSubSegment, 0);
  objc_storeStrong((id *)&self->_completeText, 0);
  objc_storeStrong((id *)&self->_alignedText, 0);
  objc_storeStrong((id *)&self->_alignedEntries, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
}

void __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  objc_msgSend(v29, "originalWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentContextBeforeInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "compareForConfidenceContextA:contextB:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7))v8 = 3;
  else
    v8 = 1;
  objc_msgSend(v29, "setInSessionAlignmentConfidence:", v8);
  objc_msgSend(v29, "expectedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = v29;
  if (v10)
  {
    objc_msgSend(v29, "expectedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "endsInPunctuation");

    v14 = v29;
    if (a3)
    {
      objc_msgSend(v29, "originalWord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isPunctuationEntryFollowingAWord");
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v29, "originalWord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "acceptedString");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v3, "length") < 2)
          goto LABEL_13;
      }
      objc_msgSend(v29, "expectedString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length") == 1)
        v19 = v13;
      else
        v19 = 0;
      if ((v19 & 1) != 0)
      {

        if ((v17 & 1) == 0)
        {
LABEL_14:

          v14 = v29;
          goto LABEL_18;
        }
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v29, "originalWord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "acceptedCandidate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isMecabraCandidate");

      if ((v17 & 1) != 0)
      {

      }
      v14 = v29;
      if ((v22 & 1) == 0)
      {
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(v29, "expectedString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(" %@"), v24);
        goto LABEL_19;
      }
    }
LABEL_18:
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v14, "expectedString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("%@"), v24);
LABEL_19:
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    v11 = v29;
  }
  if (objc_msgSend(v11, "inSessionAlignmentConfidence") != 3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "originalWord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "emojiSearchMode");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v19, "originalWord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editedEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v19, "originalWord");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    if (objc_msgSend(v10, "isPeriodFromDoubleSpaceEntry")
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "endsInWhitespace"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length") - 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v19, "completeString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

uint64_t __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)alignedEntryForWord:(id)a3
{
  id v3;
  void *v4;
  int v5;
  TIWordEntryAligned *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *, unint64_t);
  void *v44;
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD v49[6];
  _QWORD v50[3];
  int v51;
  _QWORD v52[3];
  int v53;

  v3 = a3;
  objc_msgSend(v3, "acceptedCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContinuousPathConversion");

  if (v5)
  {
    +[TITypingSessionAligned alignedPathTouchesForWord:](TITypingSessionAligned, "alignedPathTouchesForWord:", v3);
    v6 = (TIWordEntryAligned *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v6 = objc_alloc_init(TIWordEntryAligned);
  objc_msgSend(v3, "allKeyboardInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TITypingSessionAligned resolveBackspacesInKeyboardInputs:](TITypingSessionAligned, "resolveBackspacesInKeyboardInputs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inputTriggeredTextAccepted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "inputTriggeredTextAccepted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v10);

  }
  objc_msgSend(v3, "editedEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v3, "editActionType") == 2
      && (objc_msgSend(v3, "editActionExtendsPriorWord") & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v3, "editedEntry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "extendsPriorWord") & 1) == 0)
      {

LABEL_25:
        objc_msgSend(v3, "editedEntry");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "acceptedString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIWordEntryAligned setExpectedString:](v6, "setExpectedString:", v29);

        goto LABEL_26;
      }
      v12 = 1;
    }
    objc_msgSend(v3, "editedEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeyboardInputs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v12)
    if (v15)
    {
      objc_msgSend(v3, "editedEntry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allKeyboardInputs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = 0;
        do
        {
          objc_msgSend(v3, "editedEntry");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "allKeyboardInputs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "editedEntry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "inputTriggeredTextAccepted");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 != v24)
          {
            if ((objc_msgSend(v22, "isBackspace") & 1) != 0)
            {
              if (objc_msgSend(v8, "count"))
                objc_msgSend(v8, "removeLastObject");
            }
            else
            {
              objc_msgSend(v8, "addObject:", v22);
            }
          }

          ++v19;
          objc_msgSend(v3, "editedEntry");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "allKeyboardInputs");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

        }
        while (v27 > v19);
      }
    }
    goto LABEL_25;
  }
  objc_msgSend(v3, "acceptedString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntryAligned setExpectedString:](v6, "setExpectedString:", v28);
LABEL_26:

  -[TIWordEntryAligned setAlignedKeyboardInputs:](v6, "setAlignedKeyboardInputs:", v8);
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v53 = -1;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = -1;
  v30 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __46__TITypingSessionAligned_alignedEntryForWord___block_invoke;
  v49[3] = &unk_1EA0FFD20;
  v49[4] = v52;
  v49[5] = v50;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v49);
  v41 = v30;
  v42 = 3221225472;
  v43 = __46__TITypingSessionAligned_alignedEntryForWord___block_invoke_2;
  v44 = &unk_1EA0FFD48;
  v47 = v52;
  v48 = v50;
  v45 = (id)objc_opt_new();
  v31 = (id)objc_opt_new();
  v46 = v31;
  v32 = v45;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v41);
  objc_msgSend(v3, "editedEntry", v41, v42, v43, v44);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v3;
  v36 = v35;

  objc_msgSend(v36, "inputTriggeredTextAccepted");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v36, "inputTriggeredTextAccepted");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v38);

  }
  +[TITypingSessionAligned completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:](TITypingSessionAligned, "completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:", v36, v32, v31, objc_msgSend(v36, "followsContinuousPath"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntryAligned setCompleteString:](v6, "setCompleteString:", v39);

  -[TIWordEntryAligned setOriginalWord:](v6, "setOriginalWord:", v3);
  objc_msgSend(v3, "setOriginalWordInAlignment:", 1);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

LABEL_32:
  return v6;
}

+ (id)alignedPathTouchesForWord:(id)a3
{
  id v3;
  TIWordEntryAligned *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v3 = a3;
  v4 = objc_alloc_init(TIWordEntryAligned);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__7537;
  v28[4] = __Block_byref_object_dispose__7538;
  v29 = 0;
  objc_msgSend(v3, "allTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke;
  v25[3] = &unk_1EA0FFD70;
  v27 = v28;
  v8 = v5;
  v26 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke_2;
  v19[3] = &unk_1EA0FFD98;
  v19[4] = v24;
  v19[5] = &v20;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);
  v9 = v21[3];
  if (v9 < objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v21[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntryAligned setAlignedTouches:](v4, "setAlignedTouches:", v10);

  }
  -[TIWordEntryAligned setIsContinuousPathConversion:](v4, "setIsContinuousPathConversion:", 1);
  objc_msgSend(v3, "editedEntry");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v3;
  v14 = v13;

  objc_msgSend(v14, "acceptedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntryAligned setExpectedString:](v4, "setExpectedString:", v15);

  objc_msgSend(v3, "allKeyboardInputs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[TITypingSessionAligned completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:](TITypingSessionAligned, "completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:", v14, v16, 0, objc_msgSend(v14, "followsContinuousPath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntryAligned setCompleteString:](v4, "setCompleteString:", v17);

  -[TIWordEntryAligned setOriginalWord:](v4, "setOriginalWord:", v3);
  objc_msgSend(v3, "setOriginalWordInAlignment:", 1);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v28, 8);
  return v4;
}

+ (id)completeStringFromWordEntry:(id)a3 leadingInputs:(id)a4 trailingInputs:(id)a5 followsContinuousPath:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  id v45;
  id v46;
  _BOOL4 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v6 = a6;
  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "acceptedCandidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isPeriodFromDoubleSpaceEntry") & 1) != 0)
  {
    v13 = CFSTR(". ");
    goto LABEL_54;
  }
  v46 = v10;
  v47 = v6;
  if (!v10)
  {
    v18 = &stru_1EA1081D0;
    goto LABEL_20;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (!v15)
  {
    v18 = &stru_1EA1081D0;
    goto LABEL_19;
  }
  v16 = v15;
  v17 = *(_QWORD *)v53;
  v18 = &stru_1EA1081D0;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v53 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      if (objc_msgSend(v20, "isBackspace"))
      {
        if (!-[__CFString length](v18, "length"))
          continue;
        -[__CFString substringToIndex:](v18, "substringToIndex:", -[__CFString length](v18, "length") - 1);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v20, "string");
        v22 = objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v22);
        v21 = objc_claimAutoreleasedReturnValue();

        v18 = (__CFString *)v22;
      }

      v18 = (__CFString *)v21;
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  }
  while (v16);
LABEL_19:

  v6 = v47;
LABEL_20:
  objc_msgSend(v12, "candidate");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (__CFString *)v23;
  else
    v25 = &stru_1EA1081D0;
  v26 = v25;

  if (-[__CFString endsInPunctuation](v26, "endsInPunctuation"))
  {
    -[__CFString substringToIndex:](v26, "substringToIndex:", -[__CFString length](v26, "length") - 1);
    v27 = objc_claimAutoreleasedReturnValue();

    v26 = (__CFString *)v27;
  }
  if (objc_msgSend(v12, "isContinuousPathConversion"))
  {
    if (-[__CFString length](v18, "length"))
    {
      v28 = -[__CFString characterAtIndex:](v26, "characterAtIndex:", 0);
      if ((_DWORD)v28 == -[__CFString characterAtIndex:](v18, "characterAtIndex:", -[__CFString length](v18, "length") - 1))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "characterIsMember:", v28);

        if (v30)
        {
          -[__CFString substringFromIndex:](v26, "substringFromIndex:", 1);
          v31 = objc_claimAutoreleasedReturnValue();

          v26 = (__CFString *)v31;
        }
      }
    }
  }
  if (!-[__CFString length](v18, "length") && v6 && (objc_msgSend(v12, "isMecabraCandidate") & 1) == 0)
  {
    if (-[__CFString length](v26, "length"))
    {
      v32 = -[__CFString characterAtIndex:](v26, "characterAtIndex:", 0);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = objc_msgSend(v33, "characterIsMember:", v32);

      if ((v32 & 1) == 0)
      {
        -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR(" "));
        v34 = objc_claimAutoreleasedReturnValue();

        v18 = (__CFString *)v34;
      }
    }
  }
  -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v26);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v45 = v11;
    v35 = v11;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v49;
      do
      {
        v39 = 0;
        v40 = v13;
        do
        {
          if (*(_QWORD *)v49 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v39), "string");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v40, "stringByAppendingString:", v41);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v39;
          v40 = v13;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v37);
    }

    v11 = v45;
    LOBYTE(v6) = v47;
  }
  if (objc_msgSend(v9, "unfinishedWordEntryTreatment") != 1 || v6)
  {
    if (objc_msgSend(v9, "unfinishedWordEntryTreatment") == 2
      && (-[__CFString endsInWhitespace](v13, "endsInWhitespace") & 1) == 0)
    {
      -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR(" "));
      v42 = objc_claimAutoreleasedReturnValue();
LABEL_52:
      v43 = (__CFString *)v42;

      v13 = v43;
    }
  }
  else if (-[__CFString endsInWhitespace](v13, "endsInWhitespace"))
  {
    -[__CFString substringToIndex:](v13, "substringToIndex:", -[__CFString length](v13, "length") - 1);
    v42 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }

  v10 = v46;
LABEL_54:

  return v13;
}

+ (id)resolveBackspacesInKeyboardInputs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v4, "lastObject", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && objc_msgSend(v10, "isBackspace") && (objc_msgSend(v11, "isBackspace") & 1) == 0)
          objc_msgSend(v4, "removeLastObject");
        else
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v12;
    }
    while (v12);
  }

  return v4;
}

void __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!objc_msgSend(v8, "stage"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
  if (objc_msgSend(v8, "stage") == 2
    || objc_msgSend(v8, "stage") == 3
    || objc_msgSend(v8, "stage") == 4)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:");
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

    }
  }

}

void __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((unint64_t)objc_msgSend(v5, "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "count");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }

}

void __46__TITypingSessionAligned_alignedEntryForWord___block_invoke(uint64_t a1, void *a2, int a3)
{
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
  void *v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_10;
  objc_msgSend(v20, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
LABEL_9:

LABEL_10:
    v15 = v20;
    goto LABEL_11;
  }
  v19 = a1;
  objc_msgSend(v20, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {

    goto LABEL_9;
  }
  v17 = a3;
  objc_msgSend(v20, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "_containsEmoji");

  v15 = v20;
  if ((v18 & 1) == 0)
  {
    v16 = *(_QWORD *)(*(_QWORD *)(v19 + 32) + 8);
    if (*(_DWORD *)(v16 + 24) == -1)
      *(_DWORD *)(v16 + 24) = v17;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v19 + 40) + 8) + 24) = v17 + 1;
  }
LABEL_11:

}

void __46__TITypingSessionAligned_alignedEntryForWord___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  id v9;

  v5 = a2;
  v6 = v5;
  v7 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = (_DWORD)v7 == -1 || v7 > a3;
  v9 = v5;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v6 = v9;
  }
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v6 = v9;
  }

}

@end
