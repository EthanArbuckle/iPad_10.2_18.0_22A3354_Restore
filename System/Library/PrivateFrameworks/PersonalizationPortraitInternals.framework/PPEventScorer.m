@implementation PPEventScorer

- (PPEventScorer)initWithPastEventTitlesAndParticipants:(id)a3 andEarliestStartTime:(double)a4 shouldConsiderAlarms:(BOOL)a5 withOptions:(int)a6 trialWrapper:(id)a7
{
  id v13;
  id v14;
  PPEventScorer *v15;
  PPEventScorer *v16;
  EAEmailAddressSet *emailVIPEmailAddresses;
  NSSet *favoritesEmailAddresses;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PPEventScorer;
  v15 = -[PPEventScorer init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pastEventTitlesAndParticipants, a3);
    v16->_earliestStartTime = a4;
    v16->_shouldConsiderAlarms = a5;
    emailVIPEmailAddresses = v16->_emailVIPEmailAddresses;
    v16->_emailVIPEmailAddresses = 0;

    favoritesEmailAddresses = v16->_favoritesEmailAddresses;
    v16->_favoritesEmailAddresses = 0;

    v16->_rankingOptions = a6;
    objc_storeStrong((id *)&v16->_trialWrapper, a7);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSDictionary allKeys](v16->_pastEventTitlesAndParticipants, "allKeys", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v19);
          v22 += objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "containsString:", CFSTR("@")) ^ 1;
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

    v16->_pastTitlesCount = v22;
    if (initWithPastEventTitlesAndParticipants_andEarliestStartTime_shouldConsiderAlarms_withOptions_trialWrapper__once != -1)
      dispatch_once(&initWithPastEventTitlesAndParticipants_andEarliestStartTime_shouldConsiderAlarms_withOptions_trialWrapper__once, &__block_literal_global_12004);
  }

  return v16;
}

- (PPEventScorer)initWithTrialWrapper:(id)a3
{
  return -[PPEventScorer initWithPastEventTitlesAndParticipants:andEarliestStartTime:shouldConsiderAlarms:withOptions:trialWrapper:](self, "initWithPastEventTitlesAndParticipants:andEarliestStartTime:shouldConsiderAlarms:withOptions:trialWrapper:", MEMORY[0x1E0C9AA70], 1, 0, a3, -1.0);
}

- (PPEventScorer)init
{
  void *v3;
  PPEventScorer *v4;

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPEventScorer initWithPastEventTitlesAndParticipants:andEarliestStartTime:shouldConsiderAlarms:withOptions:trialWrapper:](self, "initWithPastEventTitlesAndParticipants:andEarliestStartTime:shouldConsiderAlarms:withOptions:trialWrapper:", MEMORY[0x1E0C9AA70], 1, 0, v3, -1.0);

  return v4;
}

- (id)scoreEvent:(id)a3 usingDate:(id)a4
{
  PPEventRankerFeaturizer *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  PPEventScorer *v41;
  _BOOL4 shouldConsiderAlarms;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t mm;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  id v89;
  PPEventScorer *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;
  void *v122;
  NSDictionary *pastEventTitlesAndParticipants;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  void *v131;
  int64_t pastTitlesCount;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  int v148;
  uint64_t v149;
  uint64_t kk;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  EAEmailAddressSet *emailVIPEmailAddresses;
  EAEmailAddressSet *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  id v169;
  NSObject *v170;
  void *v171;
  uint64_t v172;
  EAEmailAddressSet *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  uint64_t jj;
  void *v179;
  void *v180;
  void *v181;
  NSSet *favoritesEmailAddresses;
  NSSet *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  double v187;
  uint64_t ii;
  NSSet *v189;
  void *v190;
  uint64_t v191;
  uint64_t m;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t n;
  void *v199;
  NSSet *v200;
  void *v201;
  void *v202;
  void *v203;
  id v204;
  id v205;
  void *v206;
  uint64_t v207;
  __CFString **v208;
  void *v209;
  void *v210;
  id v211;
  id v212;
  PPEventScorer *v213;
  unint64_t v214;
  __CFString **v215;
  void *v216;
  void *v217;
  id v218;
  id v219;
  id v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  double v228;
  uint64_t j;
  void *v230;
  _BOOL4 v231;
  void *v232;
  void *v233;
  void *v234;
  id v235;
  id v236;
  id v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  uint64_t v245;
  double v246;
  uint64_t k;
  double v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  id v254;
  id v255;
  void *v256;
  double v257;
  double v258;
  double earliestStartTime;
  void *v260;
  void *v261;
  id v262;
  void *v263;
  uint64_t v264;
  void *v265;
  double v266;
  double v267;
  uint64_t v268;
  void *v269;
  void *v271;
  id v272;
  void *context;
  void *v274;
  id v275;
  id v276;
  id v277;
  void *v278;
  id v279;
  id v280;
  id obj;
  id obja;
  PPEventScorer *v283;
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
  _BYTE v296[128];
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 buf;
  Class (*v302)(uint64_t);
  void *v303;
  __int128 *v304;
  uint64_t v305;

  v305 = *MEMORY[0x1E0C80C00];
  v277 = a3;
  v275 = a4;
  v283 = self;
  v6 = -[PPEventRankerFeaturizer initWithTrialWrapper:]([PPEventRankerFeaturizer alloc], "initWithTrialWrapper:", self->_trialWrapper);
  -[PPEventRankerFeaturizer featureSchema](v6, "featureSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    context = (void *)MEMORY[0x1C3BD6630]();
    v8 = v277;
    v9 = v7;
    v297 = 0u;
    v298 = 0u;
    v299 = 0u;
    v300 = 0u;
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v279 = v8;
    objc_msgSend(v8, "recurrenceRules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v298;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v298 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1C3BD6630]();
          switch(objc_msgSend(v14, "frequency"))
          {
            case 0:
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RecurrenceFeatures"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RecurrenceFrequencyDaily"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1:
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RecurrenceFeatures"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RecurrenceFrequencyWeekly"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 2:
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RecurrenceFeatures"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RecurrenceFrequencyMonthly"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 3:
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RecurrenceFeatures"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RecurrenceFrequencyYearly"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            default:
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RecurrenceFeatures"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RecurrenceRuleSet"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              break;
          }
          v18 = v17;
          objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
      }
      while (v11);
    }

    if ((objc_msgSend(v8, "hasRecurrenceRules") & 1) == 0 && objc_msgSend(v8, "isDetached"))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RecurrenceFeatures"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("RecurrenceRuleEventIsDetached"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

    }
    v21 = v9;

    v22 = v279;
    v23 = v21;
    if (v283)
    {
      objc_msgSend(v22, "duration");
      if (v24 > 43200.0)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DurationFeatures"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("DurationLongerThan12Hrs"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

      }
      objc_msgSend(v22, "duration");
      if (v27 > 79200.0)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DurationFeatures"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DurationLongerThan24Hrs"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

      }
      objc_msgSend(v22, "duration");
      if (v30 > 432000.0)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DurationFeatures"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DurationLongerThan5Days"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

      }
      v33 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v22, "duration");
      objc_msgSend(v33, "numberWithDouble:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DurationFeatures"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Duration"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v34, CFSTR("Value"));

      v37 = v23;
    }
    else
    {
      v37 = 0;
    }

    v38 = v22;
    v39 = v37;
    if (!v283)
    {
      v61 = 0;
      v41 = 0;
LABEL_49:

      v62 = v38;
      v63 = v61;
      if (v41)
      {
        objc_msgSend(v62, "travelTime");
        if (v64 > 0.0)
        {
          v65 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v62, "travelTime");
          objc_msgSend(v65, "numberWithDouble:", floor(v66 / 60.0 / 10.0));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("TravelTimeSet"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v67, CFSTR("Value"));

        }
        v70 = v63;
      }
      else
      {
        v70 = 0;
      }

      v71 = v70;
      if (v283)
      {
        objc_msgSend(v62, "attachments");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "count");

        if (v73)
        {
          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Attachments"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

        }
        v76 = v71;
      }
      else
      {
        v76 = 0;
      }

      v77 = v62;
      v78 = v76;
      if (v283)
      {
        v79 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v77, "suggestionInfo");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v79);

        if (v80)
        {
          v81 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("SuggestionsInfo"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

          objc_msgSend(v77, "customObjectForKey:", *MEMORY[0x1E0D70F30]);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "isEqualToString:", CFSTR("Flight"));

          if (v86)
          {
            objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("StructuredEventFlight"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

          }
          objc_autoreleasePoolPop(v81);
        }
        v89 = v78;
      }
      else
      {
        v89 = 0;
      }
      v90 = v283;

      v91 = v89;
      if (v283)
      {
        if (objc_msgSend(v77, "hasNotes"))
        {
          objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("Notes"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

          v90 = v283;
        }
        v94 = v91;
      }
      else
      {
        v94 = 0;
      }

      v95 = v94;
      if (v90)
      {
        objc_msgSend(v77, "URL");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v96)
        {
          objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("URL"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

        }
        v99 = v95;
      }
      else
      {
        v99 = 0;
      }

      v100 = v99;
      if (v283)
      {
        objc_msgSend(v77, "calendar");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend(v101, "allowsContentModifications");

        if ((v102 & 1) == 0)
        {
          objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("ContentModificationsNotAllowed"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

        }
        v105 = v100;
      }
      else
      {
        v105 = 0;
      }

      v106 = v77;
      v107 = v105;
      if (!v283)
      {
        v118 = 0;
        goto LABEL_83;
      }
      objc_msgSend(v106, "calendar");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v108, "isSubscribed"))
      {

      }
      else
      {
        objc_msgSend(v106, "calendar");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "source");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "sourceType");

        if (v111 != 4)
        {
LABEL_80:
          objc_msgSend(v106, "calendar");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v114, "sharingStatus");

          if (v115 == 2)
          {
            objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("CalendarFeatures"));
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("Shared"));
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

          }
          v118 = v107;
LABEL_83:

          v119 = v106;
          v120 = v118;
          v121 = (uint64_t)v283;
          if (v283)
          {
            if (v283->_pastEventTitlesAndParticipants)
            {
              objc_msgSend(v119, "title");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = (uint64_t)v283;
              if (v122)
              {
                pastEventTitlesAndParticipants = v283->_pastEventTitlesAndParticipants;
                objc_msgSend(v119, "title");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKeyedSubscript:](pastEventTitlesAndParticipants, "objectForKeyedSubscript:", v124);
                v125 = (void *)objc_claimAutoreleasedReturnValue();

                v121 = (uint64_t)v283;
                if (v125)
                {
                  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("TitleFeatures"));
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("RecurringTitle"));
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v127, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                  v121 = (uint64_t)v283;
                }
              }
            }
            v128 = v120;
          }
          else
          {
            v128 = 0;
          }

          v129 = v128;
          if (v121)
          {
            if (*(_QWORD *)(v121 + 56))
            {
              -[PPEventScorer eventScorerConfig](v121);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v131 = v130;
              if (v130)
              {
                pastTitlesCount = v283->_pastTitlesCount;
                objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("minEkEventsForThreshold"));
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = objc_msgSend(v133, "integerValue");

                if (pastTitlesCount > v134)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v283->_pastTitlesCount);
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("TitleFeatures"));
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("PastTitleCount"));
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v137, "setObject:forKeyedSubscript:", v135, CFSTR("Value"));

                }
              }

              v121 = (uint64_t)v283;
            }
            v138 = v129;
          }
          else
          {
            v138 = 0;
          }

          v139 = v119;
          v140 = v138;
          v278 = v139;
          if (!v121)
          {
            v162 = 0;
LABEL_119:

            v276 = v162;
            if (!v283)
            {
              v204 = 0;
              goto LABEL_177;
            }
            +[PPEventScorer participantsInEvent:]((uint64_t)PPEventScorer, v278);
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v274, "count"))
            {
LABEL_176:
              v204 = v276;

LABEL_177:
              v205 = v204;
              if (v283)
              {
                objc_msgSend(v278, "selfAttendee");
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                v207 = objc_msgSend(v206, "participantRole");

                if ((unint64_t)(v207 - 2) <= 2)
                {
                  v208 = off_1E7E19FE8[v207 - 2];
                  objc_msgSend(v205, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v209, "objectForKeyedSubscript:", *v208);
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v210, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                }
                v211 = v205;
              }
              else
              {
                v211 = 0;
              }

              v212 = v211;
              v213 = v283;
              if (v283)
              {
                v214 = objc_msgSend(v278, "availability");
                if (v214 <= 2)
                {
                  v215 = off_1E7E1A000[v214];
                  objc_msgSend(v212, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v216, "objectForKeyedSubscript:", *v215);
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v217, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                  v213 = v283;
                }
                v218 = v212;
              }
              else
              {
                v218 = 0;
              }

              v219 = v278;
              v220 = v218;
              if (v213)
              {
                +[PPEventScorer participantsInEvent:]((uint64_t)PPEventScorer, v219);
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                v222 = (void *)objc_msgSend(v221, "mutableCopy");

                if (objc_msgSend(v222, "count"))
                {
                  objc_msgSend(v219, "selfAttendee");
                  v223 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PPEventScorer emailAddressFromEKAttendee:]((uint64_t)PPEventScorer, v223);
                  v224 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v224)
                    objc_msgSend(v222, "removeObject:", v224);
                  v299 = 0u;
                  v300 = 0u;
                  v297 = 0u;
                  v298 = 0u;
                  v225 = v222;
                  v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                  if (v226)
                  {
                    v227 = *(_QWORD *)v298;
                    v228 = 0.0;
                    do
                    {
                      for (j = 0; j != v226; ++j)
                      {
                        if (*(_QWORD *)v298 != v227)
                          objc_enumerationMutation(v225);
                        -[NSDictionary objectForKeyedSubscript:](v283->_pastEventTitlesAndParticipants, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v297 + 1) + 8 * j));
                        v230 = (void *)objc_claimAutoreleasedReturnValue();
                        v231 = v230 == 0;

                        if (!v231)
                          v228 = v228 + 1.0;
                      }
                      v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                    }
                    while (v226);
                  }
                  else
                  {
                    v228 = 0.0;
                  }

                  if (v228 / (double)(unint64_t)objc_msgSend(v225, "count") > 0.0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                    v232 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v220, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
                    v233 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v233, "objectForKeyedSubscript:", CFSTR("ParticipantsInPast"));
                    v234 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v232, CFSTR("Value"));

                  }
                }
                v235 = v220;

              }
              else
              {
                v235 = 0;
              }

              v236 = v275;
              v237 = v235;
              if (v283)
              {
                objc_msgSend(v219, "structuredLocationWithoutPrediction");
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v238, "geoLocation");
                v239 = (void *)objc_claimAutoreleasedReturnValue();

                if (v239)
                {
                  v240 = v236;
                  +[PPEventRankerDateUtils dateTwoWeeksPriorToDate:](PPEventRankerDateUtils, "dateTwoWeeksPriorToDate:", v240);
                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PPEventScorer cacheKeyforCoreRoutineCacheForStartDate:endDate:]((uint64_t)PPEventScorer, v241, v240);
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)routineCache, "objectForKey:", v242);
                  v243 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v243)
                  {
                    +[PPRoutineSupport locationsOfInterestVisitedBetweenStartDate:endDate:](PPRoutineSupport, "locationsOfInterestVisitedBetweenStartDate:endDate:", v241, v240);
                    v243 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v243)
                      objc_msgSend((id)routineCache, "setObject:forKey:", v243, v242);
                  }

                  v299 = 0u;
                  v300 = 0u;
                  v297 = 0u;
                  v298 = 0u;
                  v244 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                  if (v244)
                  {
                    v245 = *(_QWORD *)v298;
                    v246 = -1.0;
                    do
                    {
                      for (k = 0; k != v244; ++k)
                      {
                        if (*(_QWORD *)v298 != v245)
                          objc_enumerationMutation(v243);
                        objc_msgSend(*(id *)(*((_QWORD *)&v297 + 1) + 8 * k), "distanceFromLocation:", v239);
                        if (v246 == -1.0 || v246 > v248)
                          v246 = v248;
                      }
                      v244 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                    }
                    while (v244);
                    if (v246 != 0.0 && v246 > 1000.0)
                    {
                      objc_msgSend(v237, "objectForKeyedSubscript:", CFSTR("RoutineFeatures"));
                      v249 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v249, "objectForKeyedSubscript:", CFSTR("OutsideLocationsOfInterest"));
                      v250 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v250, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                    }
                  }
                  else
                  {
                    v246 = -1.0;
                  }
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(floor(v246 / 1000.0), 100.0));
                  v251 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v237, "objectForKeyedSubscript:", CFSTR("RoutineFeatures"));
                  v252 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v252, "objectForKeyedSubscript:", CFSTR("MinDistanceFromLocationsOfInterest"));
                  v253 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v253, "setObject:forKeyedSubscript:", v251, CFSTR("Value"));

                }
                v254 = v237;

              }
              else
              {
                v254 = 0;
              }

              v255 = v254;
              if (v283)
              {
                objc_msgSend(v219, "startDate");
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPEventRankerDateUtils secondsFromMidnight:](PPEventRankerDateUtils, "secondsFromMidnight:", v256);
                v258 = v257;

                earliestStartTime = v283->_earliestStartTime;
                if (earliestStartTime != -1.0 && earliestStartTime + -3600.0 > v258)
                {
                  objc_msgSend(v255, "objectForKeyedSubscript:", CFSTR("UnusualStartTimeFeatures"));
                  v260 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v260, "objectForKeyedSubscript:", CFSTR("UnusualStartTime"));
                  v261 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v261, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                }
                v262 = v255;
              }
              else
              {
                v262 = 0;
              }

              +[PPEventRankerFeaturizer scoreFeatureSchema:](PPEventRankerFeaturizer, "scoreFeatureSchema:", v262);
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v263, "weightedScore");
              v264 = -[PPEventScorer scoreIsExtraordinary:rankingOptions:](v283, "scoreIsExtraordinary:rankingOptions:", v283->_rankingOptions);
              objc_autoreleasePoolPop(context);
              v265 = (void *)MEMORY[0x1E0D70B38];
              objc_msgSend(v263, "weightedScore");
              v267 = v266;
              v268 = objc_msgSend(v263, "prominentFeature");
              objc_msgSend(v263, "featureValues");
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v265, "eventHighlightWithEKEvent:score:prominentFeature:features:isExtraordinary:", v219, v268, v269, v264, v267);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_231;
            }
            emailVIPEmailAddresses = v283->_emailVIPEmailAddresses;
            if (emailVIPEmailAddresses)
            {
              v164 = emailVIPEmailAddresses;
            }
            else
            {
              *(_QWORD *)&v297 = 0;
              *((_QWORD *)&v297 + 1) = &v297;
              *(_QWORD *)&v298 = 0x2050000000;
              v165 = (void *)getEMDaemonInterfaceClass_softClass;
              *((_QWORD *)&v298 + 1) = getEMDaemonInterfaceClass_softClass;
              if (!getEMDaemonInterfaceClass_softClass)
              {
                *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                *((_QWORD *)&buf + 1) = 3221225472;
                v302 = __getEMDaemonInterfaceClass_block_invoke;
                v303 = &unk_1E7E1F798;
                v304 = &v297;
                __getEMDaemonInterfaceClass_block_invoke((uint64_t)&buf);
                v165 = *(void **)(*((_QWORD *)&v297 + 1) + 24);
              }
              v166 = objc_retainAutorelease(v165);
              _Block_object_dispose(&v297, 8);
              v167 = (void *)objc_opt_new();
              objc_msgSend(v167, "vipManager");
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v168, "conformsToProtocol:", &unk_1EF919308))
              {
                v169 = (id)objc_msgSend(v168, "allVIPWaitForResult");
              }
              else
              {
                pp_default_log_handle();
                v170 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v170, OS_LOG_TYPE_FAULT))
                {
                  v271 = (void *)objc_opt_class();
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v271;
                  v272 = v271;
                  _os_log_fault_impl(&dword_1C392E000, v170, OS_LOG_TYPE_FAULT, "[vipManager conformsToProtocol:@protocol(EMVIPReader_Private)] was false (class: %@) -- the VIP set will likely be empty even if the user has VIP’s", (uint8_t *)&buf, 0xCu);

                }
              }
              objc_msgSend(v168, "allVIPEmailAddresses");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = objc_msgSend(v171, "copy");
              v173 = v283->_emailVIPEmailAddresses;
              v283->_emailVIPEmailAddresses = (EAEmailAddressSet *)v172;

              v164 = v283->_emailVIPEmailAddresses;
              if (!v164)
              {
LABEL_144:
                favoritesEmailAddresses = v283->_favoritesEmailAddresses;
                if (favoritesEmailAddresses)
                {
                  v183 = favoritesEmailAddresses;
                }
                else
                {
                  v189 = (NSSet *)objc_opt_new();
                  PPFavoriteContacts();
                  v190 = (void *)objc_claimAutoreleasedReturnValue();
                  v294 = 0u;
                  v295 = 0u;
                  v292 = 0u;
                  v293 = 0u;
                  v280 = v190;
                  v191 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v292, &buf, 16);
                  if (v191)
                  {
                    obja = *(id *)v293;
                    do
                    {
                      for (m = 0; m != v191; ++m)
                      {
                        if (*(id *)v293 != obja)
                          objc_enumerationMutation(v280);
                        v193 = *(void **)(*((_QWORD *)&v292 + 1) + 8 * m);
                        v194 = (void *)MEMORY[0x1C3BD6630]();
                        v290 = 0u;
                        v291 = 0u;
                        v288 = 0u;
                        v289 = 0u;
                        objc_msgSend(v193, "emailAddresses");
                        v195 = (void *)objc_claimAutoreleasedReturnValue();
                        v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v288, &v297, 16);
                        if (v196)
                        {
                          v197 = *(_QWORD *)v289;
                          do
                          {
                            for (n = 0; n != v196; ++n)
                            {
                              if (*(_QWORD *)v289 != v197)
                                objc_enumerationMutation(v195);
                              objc_msgSend(*(id *)(*((_QWORD *)&v288 + 1) + 8 * n), "value");
                              v199 = (void *)objc_claimAutoreleasedReturnValue();
                              -[NSSet addObject:](v189, "addObject:", v199);

                            }
                            v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v288, &v297, 16);
                          }
                          while (v196);
                        }

                        objc_autoreleasePoolPop(v194);
                      }
                      v191 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v292, &buf, 16);
                    }
                    while (v191);
                  }

                  v200 = v283->_favoritesEmailAddresses;
                  v283->_favoritesEmailAddresses = v189;

                  v183 = v283->_favoritesEmailAddresses;
                  if (!v183)
                    goto LABEL_175;
                }
                v299 = 0u;
                v300 = 0u;
                v297 = 0u;
                v298 = 0u;
                v184 = v274;
                v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                if (v185)
                {
                  v186 = *(_QWORD *)v298;
                  v187 = 0.0;
                  do
                  {
                    for (ii = 0; ii != v185; ++ii)
                    {
                      if (*(_QWORD *)v298 != v186)
                        objc_enumerationMutation(v184);
                      if (-[NSSet containsObject:](v183, "containsObject:", *(_QWORD *)(*((_QWORD *)&v297 + 1) + 8 * ii)))
                      {
                        v187 = v187 + 1.0;
                      }
                    }
                    v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                  }
                  while (v185);
                }
                else
                {
                  v187 = 0.0;
                }

                if (v187 / (double)(unint64_t)objc_msgSend(v184, "count") > 0.0)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                  v201 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v276, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
                  v202 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v202, "objectForKeyedSubscript:", CFSTR("ParticipantsFavorites"));
                  v203 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v203, "setObject:forKeyedSubscript:", v201, CFSTR("Value"));

                }
LABEL_175:

                goto LABEL_176;
              }
            }
            v286 = 0u;
            v287 = 0u;
            v284 = 0u;
            v285 = 0u;
            v174 = v274;
            v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v284, v296, 16);
            if (v175)
            {
              v176 = *(_QWORD *)v285;
              v177 = 0.0;
              do
              {
                for (jj = 0; jj != v175; ++jj)
                {
                  if (*(_QWORD *)v285 != v176)
                    objc_enumerationMutation(v174);
                  if (-[EAEmailAddressSet containsObject:](v164, "containsObject:", *(_QWORD *)(*((_QWORD *)&v284 + 1) + 8 * jj)))v177 = v177 + 1.0;
                }
                v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v284, v296, 16);
              }
              while (v175);
            }
            else
            {
              v177 = 0.0;
            }

            if (v177 / (double)(unint64_t)objc_msgSend(v174, "count") > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v276, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("ParticipantsVIP"));
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v179, CFSTR("Value"));

            }
            goto LABEL_144;
          }
          objc_msgSend(v139, "selfAttendee");
          v141 = (void *)objc_claimAutoreleasedReturnValue();

          if (v141)
          {
            objc_msgSend(v278, "selfAttendee");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = objc_msgSend(v142, "participantStatus");

            if (v143 == 2)
            {
              objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("SelfAttendeeStatusAccepted"));
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v145, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

              v299 = 0u;
              v300 = 0u;
              v297 = 0u;
              v298 = 0u;
              objc_msgSend(v278, "attendees");
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
              if (v147)
              {
                v148 = 0;
                v149 = *(_QWORD *)v298;
                do
                {
                  for (kk = 0; kk != v147; ++kk)
                  {
                    if (*(_QWORD *)v298 != v149)
                      objc_enumerationMutation(v146);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v297 + 1) + 8 * kk), "participantType") == 1)
                      ++v148;
                  }
                  v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
                }
                while (v147);

                if (v148 == 2)
                {
                  objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("AttendeeCountLessThanThree"));
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v152, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                }
                else if (v148 >= 11)
                {
                  objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
                  v160 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("AtendeeCountMoreThanTen"));
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v161, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

                }
              }
              else
              {

              }
              goto LABEL_118;
            }
            objc_msgSend(v278, "selfAttendee");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = objc_msgSend(v153, "participantStatus");

            if (v154 == 3)
            {
              objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("SelfAttendeeStatusDeclined"));
              v156 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_114:
              v159 = v156;
              objc_msgSend(v156, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

              goto LABEL_118;
            }
            objc_msgSend(v278, "selfAttendee");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = objc_msgSend(v157, "participantStatus");

            if (v158 == 4)
            {
              objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("ParticipantsFeatures"));
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("SelfAttendeeStatusTentative"));
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_114;
            }
          }
LABEL_118:
          v162 = v140;
          goto LABEL_119;
        }
      }
      objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("CalendarFeatures"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("Subscribed"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

      goto LABEL_80;
    }
    objc_msgSend(v38, "alarms");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "count"))
      goto LABEL_46;
    v41 = v283;
    shouldConsiderAlarms = v283->_shouldConsiderAlarms;

    if (!shouldConsiderAlarms)
    {
LABEL_48:
      v61 = v39;
      goto LABEL_49;
    }
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("AlarmSet"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", &unk_1E7E598D0, CFSTR("Value"));

    v299 = 0u;
    v300 = 0u;
    v297 = 0u;
    v298 = 0u;
    objc_msgSend(v38, "alarms");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v298;
      v47 = 0.0;
      do
      {
        for (mm = 0; mm != v45; ++mm)
        {
          if (*(_QWORD *)v298 != v46)
            objc_enumerationMutation(v40);
          v49 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * mm);
          objc_msgSend(v49, "absoluteDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            objc_msgSend(v49, "absoluteDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "startDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "timeIntervalSinceDate:", v52);
            v54 = v53;

          }
          else
          {
            objc_msgSend(v49, "relativeOffset");
            v54 = v55;
          }
          if (v47 > v54)
            v47 = v54;
        }
        v45 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v297, &buf, 16);
      }
      while (v45);

      v41 = v283;
      if (v47 == 0.0)
        goto LABEL_48;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(fabs(floor(v47 / 60.0 / 10.0)), 100.0));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("EventAttributeFeatures"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("AlarmTime"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v56, CFSTR("Value"));

    }
    else
    {
LABEL_46:

    }
    v41 = v283;
    goto LABEL_48;
  }
  pp_default_log_handle();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1C392E000, v59, OS_LOG_TYPE_ERROR, "PPEventRankerFeatureSchema is nil", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D70B38], "eventHighlightWithEKEvent:score:prominentFeature:features:isExtraordinary:", v277, 8, MEMORY[0x1E0C9AA60], 0, 0.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_231:

  return v60;
}

- (BOOL)isWorkCalendar:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("calendar.apple.com"));

  }
  return v5;
}

- (BOOL)isHomeCalendar:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "isEqualToString:", CFSTR("Home")) & 1) != 0 || objc_msgSend(v3, "type") == 4;

  return v5;
}

- (BOOL)scoreIsExtraordinary:(double)a3 rankingOptions:(int)a4
{
  char v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  BOOL v13;
  uint8_t v15[16];

  v4 = a4;
  -[PPEventScorer eventScorerConfig]((uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v11 = 1000.0;
LABEL_10:
    v13 = v11 < a3;
    goto LABEL_11;
  }
  if ((v4 & 2) != 0)
    v8 = CFSTR("highExtraordinaryThreshold");
  else
    v8 = CFSTR("extraordinaryThreshold");
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v11 != 0.0)
    goto LABEL_10;
  pp_events_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPEventRankerFeaturizer: Scoring threshold set to 0", v15, 2u);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (void)setEmailVIPEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailVIPEmailAddresses, a3);
}

- (void)setFavoritesEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesEmailAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_favoritesEmailAddresses, 0);
  objc_storeStrong((id *)&self->_emailVIPEmailAddresses, 0);
  objc_storeStrong((id *)&self->_pastEventTitlesAndParticipants, 0);
}

- (id)eventScorerConfig
{
  id v2;
  void *v3;

  if (a1)
  {
    if (eventScorerConfig_onceToken != -1)
      dispatch_once(&eventScorerConfig_onceToken, &__block_literal_global_85);
    objc_msgSend((id)_configCache, "objectForKey:", CFSTR("TCK"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      pthread_mutex_lock(&configLock);
      objc_msgSend(*(id *)(a1 + 64), "plistForFactorName:namespaceName:", CFSTR("EventRankerConfig.plist"), CFSTR("PERSONALIZATION_PORTRAIT_EVENTS"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count"))
      {
        v2 = v3;
        objc_msgSend((id)_configCache, "setObject:forKey:", v2, CFSTR("TCK"));
      }
      else
      {
        v2 = 0;
      }
      pthread_mutex_unlock(&configLock);

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __34__PPEventScorer_eventScorerConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_configCache;
  _configCache = v0;

  return objc_msgSend((id)_configCache, "setCountLimit:", 1);
}

+ (id)cacheKeyforCoreRoutineCacheForStartDate:(void *)a3 endDate:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setFormatOptions:", 275);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "stringFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringFromDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)participantsInEvent:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)MEMORY[0x1C3BD6630](v4);
  objc_msgSend(v2, "attendees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1C3BD6630]();
        +[PPEventScorer emailAddressFromEKAttendee:](v3, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v4, "addObject:", v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)emailAddressFromEKAttendee:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "participantType") == 1)
  {
    objc_msgSend(v2, "emailAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("mailto:")))
    {
      objc_msgSend(v3, "substringFromIndex:", 7);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __123__PPEventScorer_initWithPastEventTitlesAndParticipants_andEarliestStartTime_shouldConsiderAlarms_withOptions_trialWrapper___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)routineCache;
  routineCache = v0;

  return objc_msgSend((id)routineCache, "setCountLimit:", 1);
}

+ (void)enrichDictionary:(id)a3 withEvent:(id)a4 interningSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(void *, void *);
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PPEventScorer_enrichDictionary_withEvent_interningSet___block_invoke;
  aBlock[3] = &unk_1E7E19F90;
  v32 = v10;
  v39 = v32;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "integerValue") + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v13);

    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7E598D0, v13);
    }
  }
  v30 = (void *)v13;
  v33 = v9;
  +[PPEventScorer participantsInEvent:]((uint64_t)a1, v9);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v11;
  objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v24);

        }
        else
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7E598D0, v24);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v21);
  }

}

+ (void)setLocationsOfInterestLocations:(id)a3 withReferenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[PPEventRankerDateUtils dateTwoWeeksPriorToDate:](PPEventRankerDateUtils, "dateTwoWeeksPriorToDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPEventScorer cacheKeyforCoreRoutineCacheForStartDate:endDate:]((uint64_t)a1, v8, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)routineCache, "setObject:forKey:", v7, v9);
}

+ (void)clearAssetCache
{
  objc_msgSend((id)_configCache, "removeAllObjects");
  +[PPEventRankerFeaturizer clearAssetCache](PPEventRankerFeaturizer, "clearAssetCache");
}

id __57__PPEventScorer_enrichDictionary_withEvent_interningSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "member:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = (void *)objc_msgSend(v4, "copy");

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      v7 = v8;
      v4 = v7;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
