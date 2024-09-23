@implementation VoiceDialResultHandler

- (id)_nameSource
{
  VoiceDialNameDataSource *nameSource;
  void *v4;
  VoiceDialNameDataSource *v5;
  VoiceDialNameDataSource *v6;

  nameSource = self->_nameSource;
  if (!nameSource)
  {
    VSPreferencesCopySpokenLanguageIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VoiceDialNameDataSource nameDataSourceForLanguageIdentifier:](VoiceDialNameDataSource, "nameDataSourceForLanguageIdentifier:", v4);
    v5 = (VoiceDialNameDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_nameSource;
    self->_nameSource = v5;

    nameSource = self->_nameSource;
  }
  return nameSource;
}

- (void)_addressBook
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21DBE2000, a2, OS_LOG_TYPE_ERROR, "Could not create address book: %@", (uint8_t *)&v3, 0xCu);
}

- (id)_phoneticNames:(id)a3 fromDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
  {
    v11 = 0;
    v9 = 0;
LABEL_16:

    v11 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v5);
      objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
        v9 = (__CFString *)v14;
      else
        v9 = &stru_24E19F250;
      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v10 |= v14 != 0;
      objc_msgSend(v11, "addObject:", v9);
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v8);
  if ((v10 & 1) == 0)
    goto LABEL_16;
LABEL_17:

  return v11;
}

- (id)actionForRecognitionResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VoiceDialResultHandlerContext *v7;
  VoiceDialVoicemailRecognitionAction *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  VoiceDialResultHandlerContext *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  VoiceDialResultHandlerContext *v47;
  uint64_t v48;
  uint64_t v49;
  VoiceDialResultHandlerContext *v50;
  id v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  VoiceDialResultHandlerContext *v77;
  void *v78;
  void *v79;
  VoiceDialResultHandlerContext *v80;
  void *v81;
  id v82;
  id v83;
  CFStringRef v84;
  CFStringRef v85;
  uint64_t v86;
  id MostLikelyFacetimeContactWithPersonAndLabel;
  const void *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  __CFString *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  __CFString *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  __CFString **v105;
  VoiceDialVoicemailRecognitionAction *v106;
  void *v107;
  void *v108;
  __CFString **v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  VoiceDialResultHandlerContext *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t j;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t k;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t m;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  uint64_t v153;
  id v154;
  void *v155;
  __CFString *v156;
  void *v157;
  id v158;
  void *v159;
  VoiceDialRecognitionAction *v160;
  uint64_t v161;
  uint64_t RecordID;
  VoiceDialVoicemailRecognitionAction *v163;
  __CFString *v164;
  uint64_t v165;
  uint64_t v166;
  VoiceDialFacetimeRecognitionAction *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  __CFString *v172;
  CFMutableStringRef v173;
  id v174;
  id v175;
  __CFString *v176;
  __CFString *v177;
  __CFString *v178;
  __CFString *v179;
  const __CFString *v180;
  int v181;
  void *v182;
  __CFString *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  id v187;
  id v188;
  void *v189;
  void *v190;
  void *v191;
  __CFString *v192;
  void *v193;
  void *v194;
  const __CFString *v195;
  __CFString *v196;
  uint64_t v197;
  void *v198;
  id v199;
  id v200;
  void *v201;
  void *v202;
  id v203;
  VoiceDialVoicemailRecognitionAction *v204;
  void *v206;
  void *v207;
  VoiceDialVoicemailRecognitionAction *v208;
  id v209;
  void *v210;
  void *v211;
  id v212;
  void *v213;
  __CFString *v214;
  __CFString *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  VoiceDialResultHandlerContext *v223;
  void *v224;
  unint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  unint64_t v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  id v236;
  id v237;
  id v238;
  __CFString *v239;
  __CFString *v240;
  void *v241;
  void *v242;
  VoiceDialVoicemailRecognitionAction *v243;
  int v244;
  void *v245;
  char v246;
  __CFString *v247;
  _BOOL4 v248;
  void *v249;
  void *v250;
  void *v251;
  __CFString *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  uint64_t v261;
  void *v262;
  void *v263;
  __CFString *v264;
  id v265;
  __CFString *v266;
  id v267;
  CFMutableStringRef v268;
  uint64_t v269;
  void *v270;
  id v271;
  void *v272;
  int v273;
  VoiceDialResultHandlerContext *v274;
  VoiceDialResultHandler *v275;
  VoiceDialResultHandlerContext *v276;
  VoiceDialVoicemailRecognitionAction *v277;
  void *v278;
  VoiceDialVoicemailRecognitionAction *v279;
  void *v280;
  __CFString *v281;
  id v282;
  id v283;
  __CFString *v284;
  __CFString *v285;
  id v286;
  void *v287;
  void *v288;
  void *v289;
  id v290;
  int isKindOfClass;
  id v292;
  id v293;
  char *v294;
  id v295;
  id obj;
  id obja;
  id objb;
  id objc;
  id v300;
  id v301;
  id v302;
  id v303;
  id v304;
  id v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  id v318;
  id v319;
  id v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  _BYTE v333[128];
  _BYTE v334[128];
  _BYTE v335[128];
  _BYTE v336[128];
  _BYTE v337[128];
  _BYTE v338[128];
  uint64_t v339;

  v339 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recognitionAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(VoiceDialResultHandlerContext);
  VoiceDialConfigureSpokenLocalizedLabel(1);
  VoiceDialCopyErrorActionForResult(v5);
  v8 = (VoiceDialVoicemailRecognitionAction *)objc_claimAutoreleasedReturnValue();
  v251 = v4;
  v262 = v5;
  v255 = v6;
  if (v8
    || (objc_msgSend(v5, "valueOfFirstElementWithClassIdentifier:", CFSTR("voicemail")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v18)
    && (v8 = objc_alloc_init(VoiceDialVoicemailRecognitionAction)) != 0)
  {
    v242 = 0;
    v243 = v8;
    v272 = 0;
    v274 = v7;
    obj = 0;
    v300 = 0;
    v264 = 0;
    v265 = 0;
    v253 = 0;
    v254 = 0;
    v257 = 0;
    v259 = 0;
    v287 = 0;
    v290 = 0;
    v263 = 0;
    v281 = 0;
    v245 = 0;
    v247 = 0;
    v266 = 0;
    v268 = 0;
    v249 = 0;
    v9 = 0;
    v252 = 0;
    v270 = 0;
    v260 = 0;
    v256 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v277 = 0;
    goto LABEL_219;
  }
  v320 = 0;
  v319 = 0;
  v318 = 0;
  VoiceDialCopyNamesLabelAndTypeFromRecognitionResults(v4, &v320, &v319, &v318);
  v19 = v320;
  v265 = v319;
  v20 = (__CFString *)v318;
  objc_msgSend(v5, "valueOfFirstElementWithClassIdentifier:");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = CFSTR("labeltype-phone");

    v248 = 0;
    v20 = v22;
  }
  else
  {
    v248 = v20 != 0;
  }
  v259 = v19;
  v241 = (void *)v21;
  v264 = v20;
  v275 = self;
  if (!v19 || (v301 = -[VoiceDialResultHandler _addressBook](self, "_addressBook")) == 0)
  {
    v23 = 0;
    v35 = 0;
    v36 = 0;
    v280 = 0;
    v273 = 1;
    goto LABEL_60;
  }
  -[VoiceDialResultHandler _nameSource](self, "_nameSource");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "knownValueForClassIdentifier:", CFSTR("nickname"));
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    if (v288)
    {
      v24 = v5;
      v316 = 0u;
      v317 = 0u;
      v314 = 0u;
      v315 = 0u;
      obja = v19;
      v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v314, v335, 16);
      if (v25)
      {
        v26 = v25;
        v27 = (void *)v23;
        v28 = 0;
        v29 = *(_QWORD *)v315;
        do
        {
          v30 = 0;
          v31 = v28;
          do
          {
            if (*(_QWORD *)v315 != v29)
              objc_enumerationMutation(obja);
            v28 = *(id *)(*((_QWORD *)&v314 + 1) + 8 * v30);

            -[VoiceDialResultHandlerContext setNameToMatch:](v7, "setNameToMatch:", v28);
            VoiceDialSendNameAndExtendedLabelMatches(v301, v27, 0, 1, v288, v265, v20, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v7);
            ++v30;
            v31 = v28;
          }
          while (v26 != v30);
          v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v314, v335, 16);
        }
        while (v26);

        v24 = v262;
        v23 = (uint64_t)v27;
        v19 = v259;
        v21 = (uint64_t)v241;
      }

      -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (!v33)
      {
        v34 = objc_alloc_init(VoiceDialResultHandlerContext);

        v7 = v34;
      }
      v6 = v255;
      v35 = v288;
      v5 = v24;
    }
    else
    {
      v35 = 0;
    }
    if (-[VoiceDialResultHandlerContext resultStatus](v7, "resultStatus"))
    {
      v36 = 0;
    }
    else
    {
      objc_msgSend(v6, "knownValuesForClassIdentifier:", CFSTR("firstname"));
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36
        || (objc_msgSend(v6, "knownValuesForClassIdentifier:", CFSTR("lastname")),
            (v36 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v37 = v5;
        v312 = 0u;
        v313 = 0u;
        v310 = 0u;
        v311 = 0u;
        v282 = v19;
        v38 = objc_msgSend(v282, "countByEnumeratingWithState:objects:count:", &v310, v334, 16);
        if (v38)
        {
          v39 = v38;
          v40 = (void *)v36;
          objb = (id)v23;
          v41 = 0;
          v42 = *(_QWORD *)v311;
          do
          {
            v43 = 0;
            v44 = v41;
            do
            {
              if (*(_QWORD *)v311 != v42)
                objc_enumerationMutation(v282);
              v41 = *(id *)(*((_QWORD *)&v310 + 1) + 8 * v43);

              if (objc_msgSend(v40, "containsObject:", v41))
              {
                -[VoiceDialResultHandlerContext setRequiredNameMatchType:](v7, "setRequiredNameMatchType:", 2);
                VoiceDialSendNameAndExtendedLabelMatches(v301, objb, 0, 0, v41, v265, v264, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v7);
                -[VoiceDialResultHandlerContext setRequiredNameMatchType:](v7, "setRequiredNameMatchType:", 0xFFFFFFFFLL);
              }
              ++v43;
              v44 = v41;
            }
            while (v39 != v43);
            v39 = objc_msgSend(v282, "countByEnumeratingWithState:objects:count:", &v310, v334, 16);
          }
          while (v39);

          v37 = v262;
          v23 = (uint64_t)objb;
          v19 = v259;
          v21 = (uint64_t)v241;
          v36 = (uint64_t)v40;
        }

        -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        if (v46)
        {
          v273 = 0;
        }
        else
        {
          v47 = objc_alloc_init(VoiceDialResultHandlerContext);

          v273 = 0;
          v7 = v47;
        }
        v35 = v288;
        v5 = v37;
        goto LABEL_45;
      }
    }
    v273 = 0;
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v273 = 1;
  }
LABEL_45:
  if (-[VoiceDialResultHandlerContext resultStatus](v7, "resultStatus"))
  {
    v280 = 0;
  }
  else
  {
    v289 = v35;
    v308 = 0u;
    v309 = 0u;
    v306 = 0u;
    v307 = 0u;
    v283 = v19;
    v48 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v306, v333, 16);
    if (v48)
    {
      v49 = v48;
      v261 = v36;
      objc = (id)v23;
      v50 = v7;
      v51 = 0;
      v280 = 0;
      v52 = *(_QWORD *)v307;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          v54 = v51;
          if (*(_QWORD *)v307 != v52)
            objc_enumerationMutation(v283);
          v51 = *(id *)(*((_QWORD *)&v306 + 1) + 8 * i);

          v55 = -[VoiceDialResultHandlerContext nicknameMatchCount](v50, "nicknameMatchCount");
          VoiceDialSendNameAndExtendedLabelMatches(v301, objc, 0, (isKindOfClass ^ 1) & 1, v51, v265, v264, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v50);
          if ((isKindOfClass & 1) == 0
            && -[VoiceDialResultHandlerContext nicknameMatchCount](v50, "nicknameMatchCount") > v55)
          {
            v56 = v51;

            v280 = v56;
          }
        }
        v49 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v306, v333, 16);
      }
      while (v49);

      v36 = v261;
      v7 = v50;
      v5 = v262;
      v23 = (uint64_t)objc;
      v21 = (uint64_t)v241;
    }
    else
    {
      v280 = 0;
    }

    v35 = v289;
  }
LABEL_60:
  v260 = (void *)v36;
  v287 = v35;
  obj = (id)v23;
  if (v21)
  {
    v57 = 0;
  }
  else
  {
    v58 = objc_alloc(MEMORY[0x24BDBCEF0]);
    -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v58, "initWithSet:", v59);

    -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "intersectSet:", v60);

    -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "minusSet:", v57);

    -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "minusSet:", v57);

  }
  -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "count");

  -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "count");

  -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "count");

  v69 = objc_msgSend(v57, "count");
  if (-[VoiceDialResultHandlerContext resultStatus](v7, "resultStatus") != 1)
  {
    v72 = v21;
    v253 = 0;
    v254 = 0;
    v272 = 0;
    v242 = 0;
    v73 = 0;
    v263 = 0;
    v303 = 0;
    v293 = 0;
    v284 = 0;
    v249 = 0;
    v238 = 0;
    v239 = 0;
    v252 = 0;
    v74 = 0;
    v256 = 0;
    v240 = 0;
    v234 = 0;
    v235 = 0;
    v75 = 0;
    goto LABEL_105;
  }
  v269 = v69;
  if (v64 == 1)
  {
    if (v68 + v66 > 1 || v69)
    {
      if (!v21)
      {
        v302 = (id)v68;
        v231 = v57;
        v76 = v5;
        v77 = objc_alloc_init(VoiceDialResultHandlerContext);
        v78 = -[VoiceDialResultHandler _addressBook](v275, "_addressBook");
        -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "anyObject");
        v80 = v7;
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        VoiceDialSendNameAndExtendedLabelMatches(v78, obj, 0, v273, v81, v265, v264, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v77);

        if (-[VoiceDialResultHandlerContext resultStatus](v77, "resultStatus"))
        {
          v7 = v77;

        }
        else
        {
          v7 = v80;
        }
        v5 = v76;

        v75 = 0;
        v57 = v231;
LABEL_88:
        v68 = (uint64_t)v302;
        goto LABEL_89;
      }
    }
    else if (-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"))
    {
      -[VoiceDialResultHandlerContext setResultStatus:](v7, "setResultStatus:", 2);
      v292 = (id)v66;
      v70 = v66 <= 0;
      v302 = (id)v68;
      v71 = v57;
      if (v70)
        -[VoiceDialResultHandlerContext unlocalizedEmailLabels](v7, "unlocalizedEmailLabels");
      else
        -[VoiceDialResultHandlerContext unlocalizedPhoneLabels](v7, "unlocalizedPhoneLabels");
      v82 = (id)objc_claimAutoreleasedReturnValue();

      -[VoiceDialResultHandlerContext setMatchedLabelType:](v7, "setMatchedLabelType:", (uint64_t)v292 > 0);
      v83 = v82;
      v84 = ABAddressBookCopyLocalizedLabel((CFStringRef)objc_msgSend(v82, "anyObject"));
      if (v84)
      {
        v85 = v84;
        v86 = -[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson");
        if (v21)
          MostLikelyFacetimeContactWithPersonAndLabel = VoiceDialCopyMostLikelyNumberWithPersonAndLabel(v86, (uint64_t)v85);
        else
          MostLikelyFacetimeContactWithPersonAndLabel = VoiceDialGetMostLikelyFacetimeContactWithPersonAndLabel(v86, (uint64_t)v85);
        v88 = MostLikelyFacetimeContactWithPersonAndLabel;
        if (MostLikelyFacetimeContactWithPersonAndLabel)
        {
          if (-[VoiceDialResultHandlerContext contactInfo](v7, "contactInfo"))
            CFRelease(-[VoiceDialResultHandlerContext contactInfo](v7, "contactInfo"));
          -[VoiceDialResultHandlerContext setContactInfo:](v7, "setContactInfo:", CFRetain(v88));
        }
        CFRelease(v85);
      }
      v75 = v83;
      v57 = v71;
      v66 = (uint64_t)v292;
      goto LABEL_88;
    }
  }
  v75 = 0;
LABEL_89:
  if (-[VoiceDialResultHandlerContext resultStatus](v7, "resultStatus") == 1)
  {
    v304 = (id)v68;
    v267 = v75;
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC0DD0]), "initWithModelIdentifier:", CFSTR("com.apple.voicedial"));
    v90 = v89;
    if (v21)
      v91 = CFSTR("namelabel");
    else
      v91 = CFSTR("namelonglabel");
    if (v21)
      v92 = CFSTR("command");
    else
      v92 = CFSTR("facetime");
    objc_msgSend(v89, "setSequenceTag:", v91);
    v93 = v92;
    objc_msgSend(v5, "valueOfFirstElementWithClassIdentifier:", v93);
    v278 = v90;
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setKnownValue:phoneticValue:forClassIdentifier:");
    v232 = v57;
    v240 = v93;
    v294 = (char *)v66;
    if (v64 == 1)
    {
      v94 = v57;
      -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "anyObject");
      v96 = objc_claimAutoreleasedReturnValue();

      -[VoiceDialResultHandlerContext spokenCompositeNames](v7, "spokenCompositeNames");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "count");

      if (v98)
      {
        -[VoiceDialResultHandlerContext spokenCompositeNames](v7, "spokenCompositeNames");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "anyObject");
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v100 || !-[__CFString isEqualToString:](v100, "isEqualToString:", v96))
          goto LABEL_102;

      }
      v100 = 0;
LABEL_102:
      objc_msgSend(v278, "setKnownValue:phoneticValue:forClassIdentifier:", v96, v100, CFSTR("name"));
      -[VoiceDialResultHandlerContext lastNamesByFirstNames](v7, "lastNamesByFirstNames");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "count");

      v252 = v100;
      v284 = (__CFString *)v96;
      if (v102)
      {
        v103 = v94;
        -[VoiceDialResultHandlerContext lastNamesByFirstNames](v7, "lastNamesByFirstNames");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = kVoiceDialFirstNameClassIdentifier;
      }
      else
      {
        -[VoiceDialResultHandlerContext firstNamesByLastNames](v7, "firstNamesByLastNames");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v111, "count");

        if (!v112)
        {
          v239 = 0;
          v235 = 0;
          v256 = 0;
          v110 = 0;
          v272 = 0;
          v57 = v94;
          goto LABEL_114;
        }
        v103 = v94;
        -[VoiceDialResultHandlerContext firstNamesByLastNames](v7, "firstNamesByLastNames");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = kVoiceDialLastNameClassIdentifier;
      }
      objc_msgSend(v104, "allKeys");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "setKnownValues:phoneticValues:forClassIdentifier:", v113, 0, *v105);

      v239 = 0;
      v235 = 0;
      v256 = 0;
      v110 = 0;
      v272 = 0;
      v57 = v103;
LABEL_114:
      v114 = v304;
      goto LABEL_115;
    }
    if (v64 < 2)
    {
      v239 = 0;
      v235 = 0;
      v256 = 0;
      v252 = 0;
      v284 = 0;
      v110 = 0;
      v272 = 0;
      goto LABEL_114;
    }
    -[VoiceDialResultHandlerContext lastNamesByFirstNames](v7, "lastNamesByFirstNames");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "count") == 1)
    {

LABEL_109:
      -[VoiceDialResultHandlerContext lastNamesByFirstNames](v7, "lastNamesByFirstNames");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = kVoiceDialFirstNameClassIdentifier;
LABEL_230:
      v214 = *v109;
      v239 = v214;
      if (v108)
      {
        v215 = v214;
        objc_msgSend(v108, "allKeys");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        v235 = v108;
        objc_msgSend(v108, "mergeSetValuesIntoArray");
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v278, "setKnownValues:phoneticValues:forClassIdentifier:", v216, 0, v215);
        -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v217, "allObjects");
        v218 = objc_claimAutoreleasedReturnValue();

        -[VoiceDialResultHandlerContext spokenCompositeNames](v7, "spokenCompositeNames");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "allObjects");
        v220 = (void *)objc_claimAutoreleasedReturnValue();

        v254 = v220;
        v272 = (void *)v218;
        if ((unint64_t)objc_msgSend(v220, "count") < 6)
        {
          v256 = 0;
        }
        else
        {
          v221 = objc_alloc(MEMORY[0x24BDD17C8]);
          VoiceDialSpokenLocalizedString(CFSTR("MANY_AMBIGUOUS_NAMES_SPOKEN_FORMAT_QUESTION_%@"));
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "lastObject");
          v223 = v7;
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          v256 = (void *)objc_msgSend(v221, "initWithFormat:", v222, v224);

          v7 = v223;
        }
        v57 = v232;
        goto LABEL_244;
      }
      v57 = v232;
LABEL_243:
      -[VoiceDialResultHandlerContext topLevelNonNickNames](v7, "topLevelNonNickNames");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "allObjects");
      v253 = (void *)objc_claimAutoreleasedReturnValue();

      -[VoiceDialResultHandlerContext compositeNames](v7, "compositeNames");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "allObjects");
      v272 = (void *)objc_claimAutoreleasedReturnValue();

      -[VoiceDialResultHandlerContext spokenCompositeNames](v7, "spokenCompositeNames");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "allObjects");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      v235 = 0;
      v256 = 0;
LABEL_244:

      if (-[VoiceDialResultHandlerContext nicknameMatchCount](v7, "nicknameMatchCount") >= 1
        && -[VoiceDialResultHandlerContext nicknameMatchCount](v7, "nicknameMatchCount") < v64
        && v280)
      {
        objc_msgSend(v278, "setKnownValue:phoneticValue:forClassIdentifier:", v280, 0, CFSTR("nickname"));
      }
      v114 = v304;
      if (v253)
      {
        -[VoiceDialResultHandlerContext phoneticNamesByName](v7, "phoneticNamesByName");
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        -[VoiceDialResultHandler _phoneticNames:fromDictionary:](v275, "_phoneticNames:fromDictionary:", v253, v228);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v278, "setAmbiguousValues:phoneticValues:forClassIdentifier:", v253, v229, CFSTR("name"));

        v244 = 0;
        v234 = 0;
        v242 = 0;
        v284 = 0;
        v252 = 0;
        v246 = 0;
LABEL_126:
        v271 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v7;
        -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v125;
        v129 = v127;
        v130 = v57;
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v329 = 0u;
        v330 = 0u;
        v331 = 0u;
        v332 = 0u;
        v305 = v128;
        v132 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v329, v338, 16);
        if (v132)
        {
          v133 = v132;
          v134 = *(_QWORD *)v330;
          do
          {
            for (j = 0; j != v133; ++j)
            {
              if (*(_QWORD *)v330 != v134)
                objc_enumerationMutation(v305);
              objc_msgSend(v131, "addObject:", *(_QWORD *)(*((_QWORD *)&v329 + 1) + 8 * j));
            }
            v133 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v329, v338, 16);
          }
          while (v133);
        }

        v327 = 0u;
        v328 = 0u;
        v325 = 0u;
        v326 = 0u;
        v136 = v129;
        v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v325, v337, 16);
        if (v137)
        {
          v138 = v137;
          v139 = *(_QWORD *)v326;
          do
          {
            for (k = 0; k != v138; ++k)
            {
              if (*(_QWORD *)v326 != v139)
                objc_enumerationMutation(v136);
              objc_msgSend(v131, "addObject:", *(_QWORD *)(*((_QWORD *)&v325 + 1) + 8 * k));
            }
            v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v325, v337, 16);
          }
          while (v138);
        }
        v276 = v126;
        v250 = v136;

        v323 = 0u;
        v324 = 0u;
        v321 = 0u;
        v322 = 0u;
        v295 = v130;
        v141 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v321, v336, 16);
        if (v141)
        {
          v142 = v141;
          v143 = *(_QWORD *)v322;
          do
          {
            for (m = 0; m != v142; ++m)
            {
              if (*(_QWORD *)v322 != v143)
                objc_enumerationMutation(v295);
              v145 = *(_QWORD *)(*((_QWORD *)&v321 + 1) + 8 * m);
              v146 = (void *)MEMORY[0x24BDD17C8];
              VoiceDialSpokenLocalizedString(CFSTR("SPOKEN_LABEL_WITH_PHONE"));
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v146, "stringWithFormat:", v147, v145);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "addObject:", v148);

              v149 = (void *)MEMORY[0x24BDD17C8];
              VoiceDialSpokenLocalizedString(CFSTR("SPOKEN_LABEL_WITH_%@_EMAIL"));
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "stringWithFormat:", v150, v145);
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "addObject:", v151);

            }
            v142 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v321, v336, 16);
          }
          while (v142);
        }

        objc_msgSend(v131, "allObjects");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = v271;
        if (v263)
          objc_msgSend(v271, "addObject:");
        v7 = v276;
        v72 = (uint64_t)v241;
        v57 = v232;
        v75 = v267;
        if (v272)
          objc_msgSend(v271, "addObjectsFromArray:", v272);
        if ((unint64_t)objc_msgSend(v272, "count") <= 1 && v73)
          objc_msgSend(v271, "addObjectsFromArray:", v73);
        objc_msgSend(v278, "setKeywords:", v271);
        v106 = v278;
        if ((v246 & 1) != 0)
        {
          v152 = v244;
          if (v269 > 0)
            v152 = 1;
          if (v152 == 1)
          {
            v258 = v73;
            _CommaSeparatedStringFromArray(v73);
            v153 = objc_claimAutoreleasedReturnValue();
            VoiceDialSpokenLocalizedString(CFSTR("AMBIGUOUS_LABEL_STATUS_STRING"));
            v293 = (id)objc_claimAutoreleasedReturnValue();
            v154 = objc_alloc(MEMORY[0x24BDD17C8]);
            VoiceDialSpokenLocalizedString(CFSTR("AMBIGUOUS_LABELS_SPOKEN_FORMAT"));
            v279 = v106;
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = v252;
            if (!v252)
              v156 = v284;
            v249 = (void *)v153;
            v157 = v154;
            v75 = v267;
            v303 = (id)objc_msgSend(v157, "initWithFormat:", v155, v156, v153);

            v106 = v279;
            v73 = v258;
            goto LABEL_165;
          }
          v303 = 0;
          v293 = 0;
        }
        else
        {
          VoiceDialSpokenLocalizedString(CFSTR("AMBIGUOUS_NAMES_STATUS_STRING"));
          v293 = (id)objc_claimAutoreleasedReturnValue();
          if (!v256)
          {
            if (v254)
              v206 = v254;
            else
              v206 = v272;
            _CommaSeparatedStringFromArray(v206);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            v208 = v106;
            v209 = objc_alloc(MEMORY[0x24BDD17C8]);
            VoiceDialSpokenLocalizedString(CFSTR("AMBIGUOUS_NAMES_SPOKEN_FORMAT_QUESTION_%@"));
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            v211 = v209;
            v106 = v208;
            v303 = (id)objc_msgSend(v211, "initWithFormat:", v210, v207);

            v57 = v232;
            v212 = v207;
            v75 = v267;
            v158 = v212;
            v249 = 0;
            goto LABEL_166;
          }
          v303 = v256;
        }
        v249 = 0;
LABEL_165:
        v158 = 0;
LABEL_166:
        v238 = v158;
        -[VoiceDialVoicemailRecognitionAction setRepeatedSpokenFeedbackString:](v106, "setRepeatedSpokenFeedbackString:", v158);
        goto LABEL_167;
      }
      v252 = 0;
      v284 = 0;
      v110 = v254;
LABEL_115:
      v254 = v110;
      if (&v294[(_QWORD)v114] != (char *)1 || v269)
      {
        if ((uint64_t)&v294[(_QWORD)v114 + v269] >= 1)
        {
          v118 = (void *)MEMORY[0x24BDBCEB8];
          -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "allObjects");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "arrayWithArray:", v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "allObjects");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObjectsFromArray:", v123);

          objc_msgSend(v57, "allObjects");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObjectsFromArray:", v124);

          if (v121)
          {
            v242 = v121;
            objc_msgSend(v278, "setAmbiguousValues:phoneticValues:forClassIdentifier:", v121, 0, CFSTR("label"));
            v234 = 0;
            v253 = 0;
            v244 = 1;
LABEL_125:
            v246 = 1;
            goto LABEL_126;
          }
        }
        v244 = 0;
        v234 = 0;
      }
      else
      {
        -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "anyObject");
        v116 = objc_claimAutoreleasedReturnValue();

        if (!v116)
        {
          -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "anyObject");
          v116 = objc_claimAutoreleasedReturnValue();

        }
        v234 = (void *)v116;
        objc_msgSend(v278, "setKnownValue:phoneticValue:forClassIdentifier:", v116, 0, CFSTR("label"));
        v244 = 0;
      }
      v242 = 0;
      v253 = 0;
      goto LABEL_125;
    }
    if (-[VoiceDialResultHandlerContext allNamesMatchedType](v7, "allNamesMatchedType")
      && !-[VoiceDialResultHandlerContext lastNameMatchType](v7, "lastNameMatchType"))
    {
      v230 = objc_msgSend(v259, "count");

      if (v230 > 1)
        goto LABEL_109;
    }
    else
    {

    }
    -[VoiceDialResultHandlerContext firstNamesByLastNames](v7, "firstNamesByLastNames");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v213, "count") == 1)
    {

LABEL_229:
      -[VoiceDialResultHandlerContext firstNamesByLastNames](v7, "firstNamesByLastNames");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = kVoiceDialLastNameClassIdentifier;
      goto LABEL_230;
    }
    if (-[VoiceDialResultHandlerContext allNamesMatchedType](v7, "allNamesMatchedType")
      && -[VoiceDialResultHandlerContext lastNameMatchType](v7, "lastNameMatchType") == 1)
    {
      v225 = objc_msgSend(v259, "count");

      if (v225 > 1)
        goto LABEL_229;
    }
    else
    {

    }
    v239 = 0;
    goto LABEL_243;
  }
  v72 = v21;
  v253 = 0;
  v254 = 0;
  v272 = 0;
  v242 = 0;
  v73 = 0;
  v263 = 0;
  v303 = 0;
  v293 = 0;
  v284 = 0;
  v249 = 0;
  v238 = 0;
  v239 = 0;
  v252 = 0;
  v74 = 0;
  v256 = 0;
  v240 = 0;
  v234 = 0;
  v235 = 0;
LABEL_105:
  v106 = 0;
LABEL_167:
  v274 = v7;
  v277 = v106;
  v270 = v74;
  v257 = v73;
  if (-[VoiceDialResultHandlerContext resultStatus](v7, "resultStatus") == 2)
  {
    v233 = v57;
    v159 = v75;
    if (v72)
    {
      v160 = [VoiceDialRecognitionAction alloc];
      v161 = -[VoiceDialResultHandlerContext contactInfo](v7, "contactInfo");
      if (-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"))
        RecordID = ABRecordGetRecordID(-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"));
      else
        RecordID = 0xFFFFFFFFLL;
      v170 = -[VoiceDialRecognitionAction initWithPhoneNumber:uid:](v160, "initWithPhoneNumber:uid:", v161, RecordID);
    }
    else
    {
      v167 = [VoiceDialFacetimeRecognitionAction alloc];
      v168 = -[VoiceDialResultHandlerContext contactInfo](v7, "contactInfo");
      if (-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"))
        v169 = ABRecordGetRecordID(-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"));
      else
        v169 = 0xFFFFFFFFLL;
      v170 = -[VoiceDialFacetimeRecognitionAction initWithContactInfo:uid:](v167, "initWithContactInfo:uid:", v168, v169);
    }
    v163 = (VoiceDialVoicemailRecognitionAction *)v170;

    v171 = v159;
    if (-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"))
    {
      v172 = (__CFString *)ABRecordCopyCompositeName(-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"));
      v173 = VoiceDialPersonCopyCompositeName(-[VoiceDialResultHandlerContext resultPerson](v7, "resultPerson"), 3);
    }
    else
    {
      v172 = 0;
      v173 = 0;
    }
    if (-[VoiceDialResultHandlerContext matchedLabelType](v7, "matchedLabelType") == 1)
      -[VoiceDialResultHandlerContext localizedPhoneLabels](v7, "localizedPhoneLabels");
    else
      -[VoiceDialResultHandlerContext localizedEmailLabels](v7, "localizedEmailLabels");
    v174 = (id)objc_claimAutoreleasedReturnValue();

    if (-[VoiceDialResultHandlerContext matchedLabelType](v7, "matchedLabelType") == 1)
      -[VoiceDialResultHandlerContext unlocalizedPhoneLabels](v7, "unlocalizedPhoneLabels");
    else
      -[VoiceDialResultHandlerContext unlocalizedEmailLabels](v7, "unlocalizedEmailLabels");
    v175 = (id)objc_claimAutoreleasedReturnValue();

    v236 = v175;
    v237 = v174;
    if (v174)
    {
      objc_msgSend(v174, "anyObject");
      v174 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "anyObject");
      v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v266 = (__CFString *)ABAddressBookCopyLocalizedLabel(v176);

    }
    else
    {
      v266 = 0;
    }
    v57 = v233;
    v177 = v172;
    v268 = v173;
    if (-[__CFString length](v172, "length"))
    {
      v178 = v172;

      if (objc_msgSend(v174, "length") && -[__CFString length](v266, "length"))
      {
        v285 = v178;
        if (v241)
          v179 = CFSTR("CONFIRMED_SPOKEN_NAME_LABEL_FORMAT_CALLING_%@_%@");
        else
          v179 = CFSTR("CONFIRMED_FACETIME_SPOKEN_NAME_LABEL_FORMAT_STARTING_FACETIME_WITH_%@_%@");
        if (v241)
          v180 = CFSTR("CONFIRMED_DISPLAY_NAME_LABEL_FORMAT_CALLING_%@");
        else
          v180 = CFSTR("CONFIRMED_FACETIME_DISPLAY_NAME_LABEL_FORMAT_FACETIME_%@");
        if (v248)
        {
          v181 = -[VoiceDialResultHandlerContext matchedLabelType](v274, "matchedLabelType");
          v182 = (void *)MEMORY[0x24BDD17C8];
          if (v181 == 1)
            v183 = CFSTR("SPOKEN_LABEL_WITH_PHONE");
          else
            v183 = CFSTR("SPOKEN_LABEL_WITH_%@_EMAIL");
          VoiceDialSpokenLocalizedString(v183);
          v184 = v174;
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "stringWithFormat:", v185, v184);
          v186 = objc_claimAutoreleasedReturnValue();

          v180 = CFSTR("CONFIRMED_FACETIME_DISPLAY_NAME_LABEL_FORMAT_FACETIME_%@");
          v187 = (id)v186;
          v179 = CFSTR("CONFIRMED_FACETIME_SPOKEN_NAME_LABEL_FORMAT_STARTING_FACETIME_WITH_%@_%@");
        }
        else
        {
          v187 = v174;
        }
        v200 = objc_alloc(MEMORY[0x24BDD17C8]);
        VoiceDialBundle();
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "localizedStringForKey:value:table:", v180, &stru_24E19F250, CFSTR("Feedback"));
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = objc_msgSend(v200, "initWithFormat:", v202, v266);

        v203 = objc_alloc(MEMORY[0x24BDD17C8]);
        VoiceDialSpokenLocalizedString(v179);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = v187;
        v165 = objc_msgSend(v203, "initWithFormat:", v198, v173, v187);

        v57 = v233;
        v178 = v285;
      }
      else
      {
        v245 = v174;
        v188 = objc_alloc(MEMORY[0x24BDD17C8]);
        VoiceDialBundle();
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = v189;
        if (v241)
        {
          objc_msgSend(v189, "localizedStringForKey:value:table:", CFSTR("CONFIRMED_DISPLAY_STRING"), &stru_24E19F250, CFSTR("Feedback"));
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          v286 = (id)objc_msgSend(v188, "initWithString:", v191);
          v192 = CFSTR("CONFIRMED_SPOKEN_NAME_FORMAT");
        }
        else
        {
          objc_msgSend(v189, "localizedStringForKey:value:table:", CFSTR("CONFIRMED_FACETIME_DISPLAY_STRING"), &stru_24E19F250, CFSTR("Feedback"));
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          v286 = (id)objc_msgSend(v188, "initWithFormat:", v191);
          v192 = CFSTR("CONFIRMED_FACETIME_SPOKEN_NAME_FORMAT_STARTING_FACETIME_WITH_%@");
        }

        v199 = objc_alloc(MEMORY[0x24BDD17C8]);
        VoiceDialSpokenLocalizedString(v192);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = objc_msgSend(v199, "initWithFormat:", v198, v173);

        v166 = (uint64_t)v286;
      }
    }
    else
    {
      v245 = v174;
      VoiceDialBundle();
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = v193;
      if (v241)
        v195 = CFSTR("CONFIRMED_DISPLAY_STRING");
      else
        v195 = CFSTR("CONFIRMED_FACETIME_DISPLAY_STRING");
      if (v241)
        v196 = CFSTR("CONFIRMED_SPOKEN_STRING");
      else
        v196 = CFSTR("CONFIRMED_FACETIME_SPOKEN_STRING");
      objc_msgSend(v193, "localizedStringForKey:value:table:", v195, &stru_24E19F250, CFSTR("Feedback"));
      v197 = objc_claimAutoreleasedReturnValue();

      VoiceDialSpokenLocalizedString(v196);
      v165 = objc_claimAutoreleasedReturnValue();
      v166 = v197;
      v178 = v284;
      v198 = v303;
    }
    v247 = v177;

    v164 = v178;
  }
  else
  {
    v245 = 0;
    v247 = 0;
    v266 = 0;
    v268 = 0;
    v236 = v75;
    v237 = 0;
    v163 = v106;
    v164 = v284;
    v165 = (uint64_t)v303;
    v166 = (uint64_t)v293;
  }
  v281 = v164;
  v290 = (id)v166;
  v300 = (id)v165;
  -[VSRecognitionAction setStatusDisplayString:](v163, "setStatusDisplayString:", v166);
  -[VSRecognitionAction setSpokenFeedbackString:](v163, "setSpokenFeedbackString:", v165);
  v243 = v163;
  -[VSRecognitionAction setResultDisplayString:](v163, "setResultDisplayString:", v164);

  v12 = v240;
  v11 = v241;
  v10 = v280;
  v9 = v238;
  v14 = v239;
  v15 = v234;
  v13 = v235;
  v17 = v236;
  v16 = v237;
LABEL_219:
  VoiceDialConfigureSpokenLocalizedLabel(0);
  v204 = v243;

  return v204;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSource, 0);
}

@end
