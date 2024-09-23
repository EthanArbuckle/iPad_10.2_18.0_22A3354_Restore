@implementation REMReminderStorage

- (REMReminderStorage)initWithObjectID:(id)a3 listID:(id)a4 accountID:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMReminderStorage *v12;
  REMReminderStorage *v13;
  void *v14;
  uint64_t v15;
  NSString *daCalendarItemUniqueIdentifier;
  REMResolutionTokenMap *v17;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v19;
  NSData *resolutionTokenMapData;
  uint64_t v21;
  NSSet *subtaskIDsToUndelete;
  uint64_t v23;
  NSSet *hashtagIDsToUndelete;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)REMReminderStorage;
  v12 = -[REMReminderStorage init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_msgSend(v9, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    daCalendarItemUniqueIdentifier = v13->_daCalendarItemUniqueIdentifier;
    v13->_daCalendarItemUniqueIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v13->_listID, a4);
    objc_storeStrong((id *)&v13->_accountID, a5);
    v17 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v13->_resolutionTokenMap;
    v13->_resolutionTokenMap = v17;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v19 = objc_claimAutoreleasedReturnValue();
    resolutionTokenMapData = v13->_resolutionTokenMapData;
    v13->_resolutionTokenMapData = (NSData *)v19;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    subtaskIDsToUndelete = v13->_subtaskIDsToUndelete;
    v13->_subtaskIDsToUndelete = (NSSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    hashtagIDsToUndelete = v13->_hashtagIDsToUndelete;
    v13->_hashtagIDsToUndelete = (NSSet *)v23;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMReminderStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;

  v4 = [REMReminderStorage alloc];
  -[REMReminderStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMReminderStorage initWithObjectID:listID:accountID:](v4, "initWithObjectID:listID:accountID:", v5, v6, v7);

  -[REMReminderStorage parentReminderID](self, "parentReminderID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setParentReminderID:", v9);

  -[REMReminderStorage daCalendarItemUniqueIdentifier](self, "daCalendarItemUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDaCalendarItemUniqueIdentifier:", v10);

  -[REMReminderStorage externalIdentifier](self, "externalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setExternalIdentifier:", v11);

  -[REMReminderStorage externalModificationTag](self, "externalModificationTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setExternalModificationTag:", v12);

  -[REMReminderStorage daSyncToken](self, "daSyncToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDaSyncToken:", v13);

  -[REMReminderStorage daPushKey](self, "daPushKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDaPushKey:", v14);

  -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setTitleDocumentData:", v15);

  -[REMReminderStorage titleAsString](self, "titleAsString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setTitleAsString:", v16);

  -[REMReminderStorage primaryLocaleInferredFromLastUsedKeyboard](self, "primaryLocaleInferredFromLastUsedKeyboard");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setPrimaryLocaleInferredFromLastUsedKeyboard:", v17);

  objc_msgSend((id)v8, "setCompleted:", -[REMReminderStorage isCompleted](self, "isCompleted"));
  -[REMReminderStorage completionDate](self, "completionDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setCompletionDate:", v18);

  objc_msgSend((id)v8, "setPriority:", -[REMReminderStorage priority](self, "priority"));
  objc_msgSend((id)v8, "setFlagged:", -[REMReminderStorage flagged](self, "flagged"));
  -[REMReminderStorage startDateComponents](self, "startDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setStartDateComponents:", v19);

  -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDueDateComponents:", v20);

  -[REMReminderStorage timeZone](self, "timeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setTimeZone:", v21);

  objc_msgSend((id)v8, "setAllDay:", -[REMReminderStorage allDay](self, "allDay"));
  -[REMReminderStorage creationDate](self, "creationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setCreationDate:", v22);

  -[REMReminderStorage lastModifiedDate](self, "lastModifiedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setLastModifiedDate:", v23);

  -[REMReminderStorage recurrenceRules](self, "recurrenceRules");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setRecurrenceRules:", v24);

  -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setNotesDocumentData:", v25);

  -[REMReminderStorage notesAsString](self, "notesAsString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setNotesAsString:", v26);

  -[REMReminderStorage attachments](self, "attachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setAttachments:", v27);

  -[REMReminderStorage alarms](self, "alarms");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setAlarms:", v28);

  -[REMReminderStorage assignments](self, "assignments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setAssignments:", v29);

  -[REMReminderStorage hashtags](self, "hashtags");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setHashtags:", v30);

  -[REMReminderStorage dueDateDeltaAlertsData](self, "dueDateDeltaAlertsData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDueDateDeltaAlertsData:", v31);

  -[REMReminderStorage dueDateDeltaAlertsToUpsert](self, "dueDateDeltaAlertsToUpsert");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDueDateDeltaAlertsToUpsert:", v32);

  -[REMReminderStorage dueDateDeltaAlertIdentifiersToDelete](self, "dueDateDeltaAlertIdentifiersToDelete");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDueDateDeltaAlertIdentifiersToDelete:", v33);

  v34 = -[REMResolutionTokenMap copy](self->_resolutionTokenMap, "copy");
  v35 = *(void **)(v8 + 184);
  *(_QWORD *)(v8 + 184) = v34;

  -[REMReminderStorage resolutionTokenMapData](self, "resolutionTokenMapData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setResolutionTokenMapData:", v36);

  -[REMReminderStorage contactHandles](self, "contactHandles");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setContactHandles:", v37);

  objc_msgSend((id)v8, "setIcsDisplayOrder:", -[REMReminderStorage icsDisplayOrder](self, "icsDisplayOrder"));
  -[REMReminderStorage icsUrl](self, "icsUrl");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setIcsUrl:", v38);

  -[REMReminderStorage importedICSData](self, "importedICSData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setImportedICSData:", v39);

  -[REMReminderStorage subtaskIDsToUndelete](self, "subtaskIDsToUndelete");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copy");
  objc_msgSend((id)v8, "setSubtaskIDsToUndelete:", v41);

  -[REMReminderStorage hashtagIDsToUndelete](self, "hashtagIDsToUndelete");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "copy");
  objc_msgSend((id)v8, "setHashtagIDsToUndelete:", v43);

  -[REMReminderStorage userActivity](self, "userActivity");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copy");
  objc_msgSend((id)v8, "setUserActivity:", v45);

  -[REMReminderStorage siriFoundInAppsData](self, "siriFoundInAppsData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "copy");
  objc_msgSend((id)v8, "setSiriFoundInAppsData:", v47);

  objc_msgSend((id)v8, "setSiriFoundInAppsUserConfirmation:", -[REMReminderStorage siriFoundInAppsUserConfirmation](self, "siriFoundInAppsUserConfirmation"));
  -[REMReminderStorage lastBannerPresentationDate](self, "lastBannerPresentationDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setLastBannerPresentationDate:", v48);

  -[REMReminderStorage displayDate](self, "displayDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setDisplayDate:", v49);

  objc_msgSend((id)v8, "setMinimumSupportedVersion:", -[REMReminderStorage minimumSupportedVersion](self, "minimumSupportedVersion"));
  objc_msgSend((id)v8, "setEffectiveMinimumSupportedVersion:", -[REMReminderStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
  *(_BYTE *)(v8 + 8) = self->_hasDeserializedTitleDocument;
  *(_BYTE *)(v8 + 9) = self->_hasDeserializedNotesDocument;
  objc_storeStrong((id *)(v8 + 16), self->_deserializedTitleDocumentCache);
  objc_storeStrong((id *)(v8 + 24), self->_deserializedNotesDocumentCache);
  *(_QWORD *)(v8 + 32) = self->_storeGeneration;
  *(_QWORD *)(v8 + 40) = self->_copyGeneration + 1;
  v50 = -[NSArray copy](self->_fetchedDueDateDeltaAlerts, "copy");
  v51 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = v50;

  -[REMReminderStorage alternativeDisplayDateDate_forCalendar](self, "alternativeDisplayDateDate_forCalendar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setAlternativeDisplayDateDate_forCalendar:", v52);

  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  REMReminderStorage *v4;
  REMReminderStorage *v5;
  REMReminderStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  int64_t v62;
  int64_t v63;
  _BOOL4 v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  unint64_t v71;
  int64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  _BOOL4 v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  int v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  int v163;
  unint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  int v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  int v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  int v200;
  int64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  int v207;
  void *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  void *v212;
  int v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  int v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  NSObject *v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  void *v229;
  int v230;
  void *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  void *v235;
  int v236;
  void *v237;
  void *v238;
  void *v239;
  NSObject *v241;
  void *v242;
  uint64_t v243;
  void *v244;
  void *v245;
  void *v246;
  int v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  int v253;
  NSObject *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  objc_class *v260;
  id v261;
  REMResolutionTokenMap *resolutionTokenMap;
  REMResolutionTokenMap *v263;
  int v264;
  id v265;
  __int16 v266;
  REMResolutionTokenMap *v267;
  __int16 v268;
  REMResolutionTokenMap *v269;
  uint64_t v270;

  v270 = *MEMORY[0x1E0C80C00];
  v4 = (REMReminderStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMReminderStorage objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMReminderStorage objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_178;
      }
      -[REMReminderStorage listID](self, "listID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage listID](v6, "listID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMReminderStorage listID](self, "listID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage listID](v6, "listID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_178;
      }
      -[REMReminderStorage accountID](self, "accountID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage accountID](v6, "accountID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMReminderStorage accountID](self, "accountID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage accountID](v6, "accountID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_178;
      }
      -[REMReminderStorage parentReminderID](self, "parentReminderID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage parentReminderID](v6, "parentReminderID");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMReminderStorage parentReminderID](self, "parentReminderID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage parentReminderID](v6, "parentReminderID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_178;
      }
      -[REMReminderStorage daCalendarItemUniqueIdentifier](self, "daCalendarItemUniqueIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage daCalendarItemUniqueIdentifier](v6, "daCalendarItemUniqueIdentifier");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[REMReminderStorage daCalendarItemUniqueIdentifier](self, "daCalendarItemUniqueIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage daCalendarItemUniqueIdentifier](v6, "daCalendarItemUniqueIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_178;
      }
      -[REMReminderStorage externalIdentifier](self, "externalIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage externalIdentifier](v6, "externalIdentifier");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[REMReminderStorage externalIdentifier](self, "externalIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage externalIdentifier](v6, "externalIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_178;
      }
      -[REMReminderStorage externalModificationTag](self, "externalModificationTag");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage externalModificationTag](v6, "externalModificationTag");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v44 == (void *)v45)
      {

      }
      else
      {
        v46 = (void *)v45;
        -[REMReminderStorage externalModificationTag](self, "externalModificationTag");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage externalModificationTag](v6, "externalModificationTag");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "isEqual:", v48);

        if (!v49)
          goto LABEL_178;
      }
      -[REMReminderStorage daSyncToken](self, "daSyncToken");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage daSyncToken](v6, "daSyncToken");
      v51 = objc_claimAutoreleasedReturnValue();
      if (v50 == (void *)v51)
      {

      }
      else
      {
        v52 = (void *)v51;
        -[REMReminderStorage daSyncToken](self, "daSyncToken");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage daSyncToken](v6, "daSyncToken");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqual:", v54);

        if (!v55)
          goto LABEL_178;
      }
      -[REMReminderStorage daPushKey](self, "daPushKey");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage daPushKey](v6, "daPushKey");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v56 == (void *)v57)
      {

      }
      else
      {
        v58 = (void *)v57;
        -[REMReminderStorage daPushKey](self, "daPushKey");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage daPushKey](v6, "daPushKey");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "isEqual:", v60);

        if (!v61)
          goto LABEL_178;
      }
      v62 = -[REMReminderStorage minimumSupportedVersion](self, "minimumSupportedVersion");
      if (v62 != -[REMReminderStorage minimumSupportedVersion](v6, "minimumSupportedVersion"))
        goto LABEL_178;
      v63 = -[REMReminderStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion");
      if (v63 != -[REMReminderStorage effectiveMinimumSupportedVersion](v6, "effectiveMinimumSupportedVersion"))
        goto LABEL_178;
      v64 = -[REMReminderStorage isCompleted](self, "isCompleted");
      if (v64 != -[REMReminderStorage isCompleted](v6, "isCompleted"))
        goto LABEL_178;
      -[REMReminderStorage completionDate](self, "completionDate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage completionDate](v6, "completionDate");
      v66 = objc_claimAutoreleasedReturnValue();
      if (v65 == (void *)v66)
      {

      }
      else
      {
        v67 = (void *)v66;
        -[REMReminderStorage completionDate](self, "completionDate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage completionDate](v6, "completionDate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v68, "isEqual:", v69);

        if (!v70)
          goto LABEL_178;
      }
      v71 = -[REMReminderStorage priority](self, "priority");
      if (v71 != -[REMReminderStorage priority](v6, "priority"))
        goto LABEL_178;
      v72 = -[REMReminderStorage flagged](self, "flagged");
      if (v72 != -[REMReminderStorage flagged](v6, "flagged"))
        goto LABEL_178;
      -[REMReminderStorage startDateComponents](self, "startDateComponents");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage startDateComponents](v6, "startDateComponents");
      v74 = objc_claimAutoreleasedReturnValue();
      if (v73 == (void *)v74)
      {

      }
      else
      {
        v75 = (void *)v74;
        -[REMReminderStorage startDateComponents](self, "startDateComponents");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage startDateComponents](v6, "startDateComponents");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v76, "isEqual:", v77);

        if (!v78)
          goto LABEL_178;
      }
      -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage dueDateComponents](v6, "dueDateComponents");
      v80 = objc_claimAutoreleasedReturnValue();
      if (v79 == (void *)v80)
      {

      }
      else
      {
        v81 = (void *)v80;
        -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage dueDateComponents](v6, "dueDateComponents");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v82, "isEqual:", v83);

        if (!v84)
          goto LABEL_178;
      }
      -[REMReminderStorage timeZone](self, "timeZone");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage timeZone](v6, "timeZone");
      v86 = objc_claimAutoreleasedReturnValue();
      if (v85 == (void *)v86)
      {

      }
      else
      {
        v87 = (void *)v86;
        -[REMReminderStorage timeZone](self, "timeZone");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage timeZone](v6, "timeZone");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v88, "isEqual:", v89);

        if (!v90)
          goto LABEL_178;
      }
      -[REMReminderStorage primaryLocaleInferredFromLastUsedKeyboard](self, "primaryLocaleInferredFromLastUsedKeyboard");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderStorage primaryLocaleInferredFromLastUsedKeyboard](v6, "primaryLocaleInferredFromLastUsedKeyboard");
      v92 = objc_claimAutoreleasedReturnValue();
      if (v91 == (void *)v92)
      {

      }
      else
      {
        v93 = (void *)v92;
        -[REMReminderStorage primaryLocaleInferredFromLastUsedKeyboard](self, "primaryLocaleInferredFromLastUsedKeyboard");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage primaryLocaleInferredFromLastUsedKeyboard](v6, "primaryLocaleInferredFromLastUsedKeyboard");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v94, "isEqual:", v95);

        if (!v96)
          goto LABEL_178;
      }
      v97 = -[REMReminderStorage allDay](self, "allDay");
      if (v97 == -[REMReminderStorage allDay](v6, "allDay"))
      {
        -[REMReminderStorage creationDate](self, "creationDate");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage creationDate](v6, "creationDate");
        v99 = objc_claimAutoreleasedReturnValue();
        if (v98 == (void *)v99)
        {

        }
        else
        {
          v100 = (void *)v99;
          -[REMReminderStorage creationDate](self, "creationDate");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage creationDate](v6, "creationDate");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v101, "isEqual:", v102);

          if (!v103)
            goto LABEL_178;
        }
        -[REMReminderStorage lastModifiedDate](self, "lastModifiedDate");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage lastModifiedDate](v6, "lastModifiedDate");
        v105 = objc_claimAutoreleasedReturnValue();
        if (v104 == (void *)v105)
        {

        }
        else
        {
          v106 = (void *)v105;
          -[REMReminderStorage lastModifiedDate](self, "lastModifiedDate");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage lastModifiedDate](v6, "lastModifiedDate");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v107, "isEqual:", v108);

          if (!v109)
            goto LABEL_178;
        }
        -[REMReminderStorage recurrenceRules](self, "recurrenceRules");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage recurrenceRules](v6, "recurrenceRules");
        v111 = objc_claimAutoreleasedReturnValue();
        if (v110 == (void *)v111)
        {

        }
        else
        {
          v112 = (void *)v111;
          -[REMReminderStorage recurrenceRules](self, "recurrenceRules");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage recurrenceRules](v6, "recurrenceRules");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v113, "isEqual:", v114);

          if (!v115)
            goto LABEL_178;
        }
        -[REMReminderStorage attachments](self, "attachments");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage attachments](v6, "attachments");
        v117 = objc_claimAutoreleasedReturnValue();
        if (v116 == (void *)v117)
        {

        }
        else
        {
          v118 = (void *)v117;
          -[REMReminderStorage attachments](self, "attachments");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage attachments](v6, "attachments");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = objc_msgSend(v119, "isEqual:", v120);

          if (!v121)
            goto LABEL_178;
        }
        -[REMReminderStorage alarms](self, "alarms");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage alarms](v6, "alarms");
        v123 = objc_claimAutoreleasedReturnValue();
        if (v122 == (void *)v123)
        {

        }
        else
        {
          v124 = (void *)v123;
          -[REMReminderStorage alarms](self, "alarms");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage alarms](v6, "alarms");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = objc_msgSend(v125, "isEqual:", v126);

          if (!v127)
            goto LABEL_178;
        }
        -[REMReminderStorage assignments](self, "assignments");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage assignments](v6, "assignments");
        v129 = objc_claimAutoreleasedReturnValue();
        if (v128 == (void *)v129)
        {

        }
        else
        {
          v130 = (void *)v129;
          -[REMReminderStorage assignments](self, "assignments");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage assignments](v6, "assignments");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend(v131, "isEqual:", v132);

          if (!v133)
            goto LABEL_178;
        }
        -[REMReminderStorage hashtags](self, "hashtags");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage hashtags](v6, "hashtags");
        v135 = objc_claimAutoreleasedReturnValue();
        if (v134 == (void *)v135)
        {

        }
        else
        {
          v136 = (void *)v135;
          -[REMReminderStorage hashtags](self, "hashtags");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage hashtags](v6, "hashtags");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = objc_msgSend(v137, "isEqual:", v138);

          if (!v139)
            goto LABEL_178;
        }
        -[REMReminderStorage dueDateDeltaAlertsData](self, "dueDateDeltaAlertsData");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage dueDateDeltaAlertsData](v6, "dueDateDeltaAlertsData");
        v141 = objc_claimAutoreleasedReturnValue();
        if (v140 == (void *)v141)
        {

        }
        else
        {
          v142 = (void *)v141;
          -[REMReminderStorage dueDateDeltaAlertsData](self, "dueDateDeltaAlertsData");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage dueDateDeltaAlertsData](v6, "dueDateDeltaAlertsData");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = objc_msgSend(v143, "isEqual:", v144);

          if (!v145)
            goto LABEL_178;
        }
        -[REMReminderStorage dueDateDeltaAlertsToUpsert](self, "dueDateDeltaAlertsToUpsert");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage dueDateDeltaAlertsToUpsert](v6, "dueDateDeltaAlertsToUpsert");
        v147 = objc_claimAutoreleasedReturnValue();
        if (v146 == (void *)v147)
        {

        }
        else
        {
          v148 = (void *)v147;
          -[REMReminderStorage dueDateDeltaAlertsToUpsert](self, "dueDateDeltaAlertsToUpsert");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage dueDateDeltaAlertsToUpsert](v6, "dueDateDeltaAlertsToUpsert");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = objc_msgSend(v149, "isEqual:", v150);

          if (!v151)
            goto LABEL_178;
        }
        -[REMReminderStorage dueDateDeltaAlertIdentifiersToDelete](self, "dueDateDeltaAlertIdentifiersToDelete");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage dueDateDeltaAlertIdentifiersToDelete](v6, "dueDateDeltaAlertIdentifiersToDelete");
        v153 = objc_claimAutoreleasedReturnValue();
        if (v152 == (void *)v153)
        {

        }
        else
        {
          v154 = (void *)v153;
          -[REMReminderStorage dueDateDeltaAlertIdentifiersToDelete](self, "dueDateDeltaAlertIdentifiersToDelete");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage dueDateDeltaAlertIdentifiersToDelete](v6, "dueDateDeltaAlertIdentifiersToDelete");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          v157 = objc_msgSend(v155, "isEqual:", v156);

          if (!v157)
            goto LABEL_178;
        }
        -[REMReminderStorage contactHandles](self, "contactHandles");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage contactHandles](v6, "contactHandles");
        v159 = objc_claimAutoreleasedReturnValue();
        if (v158 == (void *)v159)
        {

        }
        else
        {
          v160 = (void *)v159;
          -[REMReminderStorage contactHandles](self, "contactHandles");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage contactHandles](v6, "contactHandles");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = objc_msgSend(v161, "isEqual:", v162);

          if (!v163)
            goto LABEL_178;
        }
        v164 = -[REMReminderStorage icsDisplayOrder](self, "icsDisplayOrder");
        if (v164 == -[REMReminderStorage icsDisplayOrder](v6, "icsDisplayOrder"))
        {
          -[REMReminderStorage icsUrl](self, "icsUrl");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage icsUrl](v6, "icsUrl");
          v166 = objc_claimAutoreleasedReturnValue();
          if (v165 == (void *)v166)
          {

          }
          else
          {
            v167 = (void *)v166;
            -[REMReminderStorage icsUrl](self, "icsUrl");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage icsUrl](v6, "icsUrl");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            v170 = objc_msgSend(v168, "isEqual:", v169);

            if (!v170)
              goto LABEL_178;
          }
          -[REMReminderStorage importedICSData](self, "importedICSData");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage importedICSData](v6, "importedICSData");
          v172 = objc_claimAutoreleasedReturnValue();
          if (v171 == (void *)v172)
          {

          }
          else
          {
            v173 = (void *)v172;
            -[REMReminderStorage importedICSData](self, "importedICSData");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage importedICSData](v6, "importedICSData");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            v176 = objc_msgSend(v174, "isEqual:", v175);

            if (!v176)
              goto LABEL_178;
          }
          -[REMReminderStorage subtaskIDsToUndelete](self, "subtaskIDsToUndelete");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage subtaskIDsToUndelete](v6, "subtaskIDsToUndelete");
          v178 = objc_claimAutoreleasedReturnValue();
          if (v177 == (void *)v178)
          {

          }
          else
          {
            v179 = (void *)v178;
            -[REMReminderStorage subtaskIDsToUndelete](self, "subtaskIDsToUndelete");
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage subtaskIDsToUndelete](v6, "subtaskIDsToUndelete");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            v182 = objc_msgSend(v180, "isEqual:", v181);

            if (!v182)
              goto LABEL_178;
          }
          -[REMReminderStorage hashtagIDsToUndelete](self, "hashtagIDsToUndelete");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage hashtagIDsToUndelete](v6, "hashtagIDsToUndelete");
          v184 = objc_claimAutoreleasedReturnValue();
          if (v183 == (void *)v184)
          {

          }
          else
          {
            v185 = (void *)v184;
            -[REMReminderStorage hashtagIDsToUndelete](self, "hashtagIDsToUndelete");
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage hashtagIDsToUndelete](v6, "hashtagIDsToUndelete");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v188 = objc_msgSend(v186, "isEqual:", v187);

            if (!v188)
              goto LABEL_178;
          }
          -[REMReminderStorage userActivity](self, "userActivity");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage userActivity](v6, "userActivity");
          v190 = objc_claimAutoreleasedReturnValue();
          if (v189 == (void *)v190)
          {

          }
          else
          {
            v191 = (void *)v190;
            -[REMReminderStorage userActivity](self, "userActivity");
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage userActivity](v6, "userActivity");
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = objc_msgSend(v192, "isEqual:", v193);

            if (!v194)
              goto LABEL_178;
          }
          -[REMReminderStorage siriFoundInAppsData](self, "siriFoundInAppsData");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderStorage siriFoundInAppsData](v6, "siriFoundInAppsData");
          v196 = objc_claimAutoreleasedReturnValue();
          if (v195 == (void *)v196)
          {

          }
          else
          {
            v197 = (void *)v196;
            -[REMReminderStorage siriFoundInAppsData](self, "siriFoundInAppsData");
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage siriFoundInAppsData](v6, "siriFoundInAppsData");
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            v200 = objc_msgSend(v198, "isEqual:", v199);

            if (!v200)
              goto LABEL_178;
          }
          v201 = -[REMReminderStorage siriFoundInAppsUserConfirmation](self, "siriFoundInAppsUserConfirmation");
          if (v201 == -[REMReminderStorage siriFoundInAppsUserConfirmation](v6, "siriFoundInAppsUserConfirmation"))
          {
            -[REMReminderStorage lastBannerPresentationDate](self, "lastBannerPresentationDate");
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage lastBannerPresentationDate](v6, "lastBannerPresentationDate");
            v203 = objc_claimAutoreleasedReturnValue();
            if (v202 == (void *)v203)
            {

            }
            else
            {
              v204 = (void *)v203;
              -[REMReminderStorage lastBannerPresentationDate](self, "lastBannerPresentationDate");
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMReminderStorage lastBannerPresentationDate](v6, "lastBannerPresentationDate");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              v207 = objc_msgSend(v205, "isEqual:", v206);

              if (!v207)
                goto LABEL_178;
            }
            -[REMReminderStorage displayDate](self, "displayDate");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage displayDate](v6, "displayDate");
            v209 = objc_claimAutoreleasedReturnValue();
            if (v208 == (void *)v209)
            {

            }
            else
            {
              v210 = (void *)v209;
              -[REMReminderStorage displayDate](self, "displayDate");
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMReminderStorage displayDate](v6, "displayDate");
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              v213 = objc_msgSend(v211, "isEqual:", v212);

              if (!v213)
                goto LABEL_178;
            }
            -[REMReminderStorage alternativeDisplayDateDate_forCalendar](self, "alternativeDisplayDateDate_forCalendar");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMReminderStorage alternativeDisplayDateDate_forCalendar](v6, "alternativeDisplayDateDate_forCalendar");
            v215 = objc_claimAutoreleasedReturnValue();
            if (v214 == (void *)v215)
            {

            }
            else
            {
              v216 = (void *)v215;
              -[REMReminderStorage alternativeDisplayDateDate_forCalendar](self, "alternativeDisplayDateDate_forCalendar");
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMReminderStorage alternativeDisplayDateDate_forCalendar](v6, "alternativeDisplayDateDate_forCalendar");
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              v219 = objc_msgSend(v217, "isEqual:", v218);

              if (!v219)
                goto LABEL_178;
            }
            -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            if (v220
              || (-[REMReminderStorage titleDocumentData](v6, "titleDocumentData"),
                  (v223 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
              v221 = (void *)objc_claimAutoreleasedReturnValue();
              if (v221)
              {
                -[REMReminderStorage titleDocumentData](v6, "titleDocumentData");
                v222 = (void *)objc_claimAutoreleasedReturnValue();

                if (v220)
                if (!v222)
                  goto LABEL_178;
              }
              else
              {

                if (v220)
              }
              if (!self->_hasDeserializedTitleDocument)
              {
                +[REMLogStore read](REMLogStore, "read");
                v224 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v224, OS_LOG_TYPE_FAULT))
                  -[REMReminderStorage isEqual:].cold.2();

              }
              -[REMReminderStorage titleDocument](self, "titleDocument");
              v225 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMReminderStorage titleDocument](v6, "titleDocument");
              v226 = objc_claimAutoreleasedReturnValue();
              if (v225 == (void *)v226)
              {

              }
              else
              {
                v227 = (void *)v226;
                -[REMReminderStorage titleDocument](self, "titleDocument");
                v228 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMReminderStorage titleDocument](v6, "titleDocument");
                v229 = (void *)objc_claimAutoreleasedReturnValue();
                v230 = objc_msgSend(v228, "isEqual:", v229);

                if (!v230)
                  goto LABEL_178;
              }
              -[REMReminderStorage titleAsString](self, "titleAsString");
              v231 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMReminderStorage titleAsString](v6, "titleAsString");
              v232 = objc_claimAutoreleasedReturnValue();
              if (v231 == (void *)v232)
              {

              }
              else
              {
                v233 = (void *)v232;
                -[REMReminderStorage titleAsString](self, "titleAsString");
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMReminderStorage titleAsString](v6, "titleAsString");
                v235 = (void *)objc_claimAutoreleasedReturnValue();
                v236 = objc_msgSend(v234, "isEqual:", v235);

                if (!v236)
                  goto LABEL_178;
              }
              -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              if (v237
                || (-[REMReminderStorage notesDocumentData](v6, "notesDocumentData"),
                    (v223 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                if (v238)
                {
                  -[REMReminderStorage notesDocumentData](v6, "notesDocumentData");
                  v239 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v237)
                  if (!v239)
                    goto LABEL_178;
                }
                else
                {

                  if (v237)
                }
                if (!self->_hasDeserializedNotesDocument)
                {
                  +[REMLogStore read](REMLogStore, "read");
                  v241 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v241, OS_LOG_TYPE_FAULT))
                    -[REMReminderStorage isEqual:].cold.1();

                }
                -[REMReminderStorage notesDocument](self, "notesDocument");
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMReminderStorage notesDocument](v6, "notesDocument");
                v243 = objc_claimAutoreleasedReturnValue();
                if (v242 == (void *)v243)
                {

                }
                else
                {
                  v244 = (void *)v243;
                  -[REMReminderStorage notesDocument](self, "notesDocument");
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMReminderStorage notesDocument](v6, "notesDocument");
                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                  v247 = objc_msgSend(v245, "isEqual:", v246);

                  if (!v247)
                    goto LABEL_178;
                }
                -[REMReminderStorage notesAsString](self, "notesAsString");
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMReminderStorage notesAsString](v6, "notesAsString");
                v249 = objc_claimAutoreleasedReturnValue();
                if (v248 == (void *)v249)
                {

                }
                else
                {
                  v250 = (void *)v249;
                  -[REMReminderStorage notesAsString](self, "notesAsString");
                  v251 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMReminderStorage notesAsString](v6, "notesAsString");
                  v252 = (void *)objc_claimAutoreleasedReturnValue();
                  v253 = objc_msgSend(v251, "isEqual:", v252);

                  if (!v253)
                    goto LABEL_178;
                }
                if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
                {
                  +[REMLogStore read](REMLogStore, "read");
                  v254 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
                  {
                    v260 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v260);
                    v261 = (id)objc_claimAutoreleasedReturnValue();
                    resolutionTokenMap = self->_resolutionTokenMap;
                    v263 = v6->_resolutionTokenMap;
                    v264 = 138543874;
                    v265 = v261;
                    v266 = 2112;
                    v267 = resolutionTokenMap;
                    v268 = 2112;
                    v269 = v263;
                    _os_log_error_impl(&dword_1B4A39000, v254, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v264, 0x20u);

                  }
                }
                -[REMReminderStorage resolutionTokenMap](self, "resolutionTokenMap");
                v255 = (void *)objc_claimAutoreleasedReturnValue();
                -[REMReminderStorage resolutionTokenMap](v6, "resolutionTokenMap");
                v256 = objc_claimAutoreleasedReturnValue();
                if (v255 == (void *)v256)
                {

                  v13 = 1;
                }
                else
                {
                  v257 = (void *)v256;
                  -[REMReminderStorage resolutionTokenMap](self, "resolutionTokenMap");
                  v258 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMReminderStorage resolutionTokenMap](v6, "resolutionTokenMap");
                  v259 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = objc_msgSend(v258, "isEqual:", v259);

                }
                goto LABEL_179;
              }
            }

          }
        }
      }
    }
LABEL_178:
    v13 = 0;
LABEL_179:

    goto LABEL_180;
  }
  v13 = 1;
LABEL_180:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMReminderStorage objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderStorage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  REMReminderStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSData *resolutionTokenMapData;
  REMResolutionTokenMap *resolutionTokenMap;
  NSData *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSArray *fetchedDueDateDeltaAlerts;
  void *v83;
  void *v85;
  void *v86;
  void *v87;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v6;
  v87 = (void *)v5;
  v7 = -[REMReminderStorage initWithObjectID:listID:accountID:](self, "initWithObjectID:listID:accountID:", v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentReminderID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setParentReminderID:](v7, "setParentReminderID:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daCalendarItemUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDaCalendarItemUniqueIdentifier:](v7, "setDaCalendarItemUniqueIdentifier:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setExternalIdentifier:](v7, "setExternalIdentifier:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalModificationTag"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setExternalModificationTag:](v7, "setExternalModificationTag:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daSyncToken"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDaSyncToken:](v7, "setDaSyncToken:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daPushKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDaPushKey:](v7, "setDaPushKey:", v13);

  -[REMReminderStorage setMinimumSupportedVersion:](v7, "setMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSupportedVersion")));
  -[REMReminderStorage setEffectiveMinimumSupportedVersion:](v7, "setEffectiveMinimumSupportedVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectiveMinimumSupportedVersion")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleDocumentData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setTitleDocumentData:](v7, "setTitleDocumentData:", v14);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleAsString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setTitleAsString:](v7, "setTitleAsString:", v15);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryLocaleInferredFromLastUsedKeyboard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setPrimaryLocaleInferredFromLastUsedKeyboard:](v7, "setPrimaryLocaleInferredFromLastUsedKeyboard:", v16);

  -[REMReminderStorage setCompleted:](v7, "setCompleted:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCompleted")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completionDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setCompletionDate:](v7, "setCompletionDate:", v17);

  -[REMReminderStorage setPriority:](v7, "setPriority:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority")));
  -[REMReminderStorage setFlagged:](v7, "setFlagged:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flagged")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDateComponents"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setStartDateComponents:](v7, "setStartDateComponents:", v18);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDateComponents"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDueDateComponents:](v7, "setDueDateComponents:", v19);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setTimeZone:](v7, "setTimeZone:", v20);

  -[REMReminderStorage setAllDay:](v7, "setAllDay:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allDay")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setCreationDate:](v7, "setCreationDate:", v21);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setLastModifiedDate:](v7, "setLastModifiedDate:", v22);

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("recurrenceRules"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setRecurrenceRules:](v7, "setRecurrenceRules:", v26);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notesDocumentData"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setNotesDocumentData:](v7, "setNotesDocumentData:", v27);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notesAsString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setNotesAsString:](v7, "setNotesAsString:", v28);

  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("attachments"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setAttachments:](v7, "setAttachments:", v32);

  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("alarms"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setAlarms:](v7, "setAlarms:", v36);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("assignments"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setAssignments:](v7, "setAssignments:", v40);

  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("hashtags"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setHashtags:](v7, "setHashtags:", v44);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDateDeltaAlertsData"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDueDateDeltaAlertsData:](v7, "setDueDateDeltaAlertsData:", v45);

  v46 = (void *)MEMORY[0x1E0C99E60];
  v47 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("dueDateDeltaAlertsToUpsert"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDueDateDeltaAlertsToUpsert:](v7, "setDueDateDeltaAlertsToUpsert:", v49);

  v50 = (void *)MEMORY[0x1E0C99E60];
  v51 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("dueDateDeltaAlertIdentifiersToDelete"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDueDateDeltaAlertIdentifiersToDelete:](v7, "setDueDateDeltaAlertIdentifiersToDelete:", v53);

  -[REMReminderStorage setIcsDisplayOrder:](v7, "setIcsDisplayOrder:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("icsDisplayOrder")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icsUrl"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setIcsUrl:](v7, "setIcsUrl:", v54);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("importedICSData"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setImportedICSData:](v7, "setImportedICSData:", v55);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setUserActivity:](v7, "setUserActivity:", v56);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriFoundInAppsData"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setSiriFoundInAppsData:](v7, "setSiriFoundInAppsData:", v57);

  v58 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("siriFoundInAppsUserConfirmation"));
  if (v58 >= 3)
  {
    v59 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      -[REMReminderStorage initWithCoder:].cold.1(v58, v59);

    v58 = 0;
  }
  -[REMReminderStorage setSiriFoundInAppsUserConfirmation:](v7, "setSiriFoundInAppsUserConfirmation:", v58);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastBannerPresentationDate"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setLastBannerPresentationDate:](v7, "setLastBannerPresentationDate:", v60);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayDate"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setDisplayDate:](v7, "setDisplayDate:", v61);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMapData"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMap"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    objc_storeStrong((id *)&v7->_resolutionTokenMap, v63);
    resolutionTokenMapData = v7->_resolutionTokenMapData;
    v7->_resolutionTokenMapData = 0;
  }
  else
  {
    resolutionTokenMap = v7->_resolutionTokenMap;
    v7->_resolutionTokenMap = 0;

    v66 = v62;
    resolutionTokenMapData = v7->_resolutionTokenMapData;
    v7->_resolutionTokenMapData = v66;
  }

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactHandles"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
    -[REMReminderStorage setContactHandles:](v7, "setContactHandles:", v67);
  v68 = (void *)MEMORY[0x1E0C99E60];
  v69 = objc_opt_class();
  objc_msgSend(v68, "setWithObjects:", v69, objc_opt_class(), 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v70, CFSTR("subtaskIDsToUndelete"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage setSubtaskIDsToUndelete:](v7, "setSubtaskIDsToUndelete:", v72);

  }
  v73 = (void *)MEMORY[0x1E0C99E60];
  v74 = objc_opt_class();
  objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("hashtagIDsToUndelete"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage setHashtagIDsToUndelete:](v7, "setHashtagIDsToUndelete:", v77);

  }
  v78 = (void *)MEMORY[0x1E0C99E60];
  v79 = objc_opt_class();
  objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v80, CFSTR("fetchedDueDateDeltaAlerts"));
  v81 = objc_claimAutoreleasedReturnValue();
  fetchedDueDateDeltaAlerts = v7->_fetchedDueDateDeltaAlerts;
  v7->_fetchedDueDateDeltaAlerts = (NSArray *)v81;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternativeDisplayDateDate_forCalendar"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setAlternativeDisplayDateDate_forCalendar:](v7, "setAlternativeDisplayDateDate_forCalendar:", v83);

  return v7;
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[REMReminderStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[REMReminderStorage alarms](self, "alarms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[REMReminderStorage assignments](self, "assignments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[REMReminderStorage hashtags](self, "hashtags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, attachments.count: %ld, alarms.count: %ld, assignments.count: %ld, hashtags.count: %ld>"), v3, self, v4, v6, v8, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)datesDebugDescriptionInTimeZone:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  char isKindOfClass;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  REMReminderStorage *v44;
  const __CFString *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  BOOL v54;
  void *v56;
  void *v57;
  void *v58;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = v4;
  objc_msgSend(MEMORY[0x1E0CB36A8], "rem_formatterWithTimeZone:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage startDateComponents](self, "startDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0x1E0CB3000uLL;
  if (v7)
  {
    -[REMReminderStorage startDateComponents](self, "startDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rem_stringFromDateComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderStorage startDateComponents](self, "startDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("startDate: %@ tz: %@"), v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rem_stringFromDateComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("dueDate: %@ tz: %@"), v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

  }
  -[REMReminderStorage displayDate](self, "displayDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[REMReminderStorage displayDate](self, "displayDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderStorage displayDate](self, "displayDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("displayDate: %@ tz: %@"), v25, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v29);

  }
  v57 = v6;
  -[REMReminderStorage alarms](self, "alarms");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    v32 = 0;
    v33 = 0x1E67F4000uLL;
    v34 = CFSTR("alarm[%ld]: %@");
    v58 = v5;
    do
    {
      -[REMReminderStorage alarms](self, "alarms");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "trigger");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v36, "trigger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v39, "dateComponents");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "rem_stringFromDateComponents:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = *(void **)(v8 + 2368);
        objc_msgSend(v40, "dateComponents");
        v44 = self;
        v45 = v34;
        v46 = v33;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "timeZone");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ tz: %@"), v42, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = 0x1E0CB3000;
        v33 = v46;
        v34 = v45;
        self = v44;

      }
      else
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", v34, v32, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v58;
      objc_msgSend(v58, "addObject:", v51);

      ++v32;
      -[REMReminderStorage alarms](self, "alarms");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count");

      v54 = v32 >= v53;
      v8 = 0x1E0CB3000;
    }
    while (!v54);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v52 = a3;
  -[REMReminderStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v4, CFSTR("objectID"));

  -[REMReminderStorage listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v5, CFSTR("listID"));

  -[REMReminderStorage accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[REMReminderStorage parentReminderID](self, "parentReminderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v7, CFSTR("parentReminderID"));

  -[REMReminderStorage daCalendarItemUniqueIdentifier](self, "daCalendarItemUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v8, CFSTR("daCalendarItemUniqueIdentifier"));

  -[REMReminderStorage externalIdentifier](self, "externalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v9, CFSTR("externalIdentifier"));

  -[REMReminderStorage externalModificationTag](self, "externalModificationTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v10, CFSTR("externalModificationTag"));

  -[REMReminderStorage daSyncToken](self, "daSyncToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v11, CFSTR("daSyncToken"));

  -[REMReminderStorage daPushKey](self, "daPushKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v12, CFSTR("daPushKey"));

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage minimumSupportedVersion](self, "minimumSupportedVersion"), CFSTR("minimumSupportedVersion"));
  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), CFSTR("effectiveMinimumSupportedVersion"));
  objc_msgSend(v52, "encodeBool:forKey:", -[REMReminderStorage isCompleted](self, "isCompleted"), CFSTR("isCompleted"));
  -[REMReminderStorage completionDate](self, "completionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v13, CFSTR("completionDate"));

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage priority](self, "priority"), CFSTR("priority"));
  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage flagged](self, "flagged"), CFSTR("flagged"));
  -[REMReminderStorage startDateComponents](self, "startDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v14, CFSTR("startDateComponents"));

  -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v15, CFSTR("dueDateComponents"));

  -[REMReminderStorage primaryLocaleInferredFromLastUsedKeyboard](self, "primaryLocaleInferredFromLastUsedKeyboard");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v16, CFSTR("primaryLocaleInferredFromLastUsedKeyboard"));

  -[REMReminderStorage timeZone](self, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v17, CFSTR("timeZone"));

  objc_msgSend(v52, "encodeBool:forKey:", -[REMReminderStorage allDay](self, "allDay"), CFSTR("allDay"));
  -[REMReminderStorage creationDate](self, "creationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v18, CFSTR("creationDate"));

  -[REMReminderStorage lastModifiedDate](self, "lastModifiedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v19, CFSTR("lastModifiedDate"));

  -[REMReminderStorage recurrenceRules](self, "recurrenceRules");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v20, CFSTR("recurrenceRules"));

  -[REMReminderStorage attachments](self, "attachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v21, CFSTR("attachments"));

  -[REMReminderStorage alarms](self, "alarms");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v22, CFSTR("alarms"));

  -[REMReminderStorage assignments](self, "assignments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v23, CFSTR("assignments"));

  -[REMReminderStorage hashtags](self, "hashtags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v24, CFSTR("hashtags"));

  -[REMReminderStorage dueDateDeltaAlertsData](self, "dueDateDeltaAlertsData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v25, CFSTR("dueDateDeltaAlertsData"));

  -[REMReminderStorage dueDateDeltaAlertsToUpsert](self, "dueDateDeltaAlertsToUpsert");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v26, CFSTR("dueDateDeltaAlertsToUpsert"));

  -[REMReminderStorage dueDateDeltaAlertIdentifiersToDelete](self, "dueDateDeltaAlertIdentifiersToDelete");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v27, CFSTR("dueDateDeltaAlertIdentifiersToDelete"));

  -[REMReminderStorage contactHandles](self, "contactHandles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v28, CFSTR("contactHandles"));

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage icsDisplayOrder](self, "icsDisplayOrder"), CFSTR("icsDisplayOrder"));
  -[REMReminderStorage icsUrl](self, "icsUrl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v29, CFSTR("icsUrl"));

  -[REMReminderStorage importedICSData](self, "importedICSData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v30, CFSTR("importedICSData"));

  -[REMReminderStorage userActivity](self, "userActivity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v31, CFSTR("userActivity"));

  -[REMReminderStorage siriFoundInAppsData](self, "siriFoundInAppsData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v32, CFSTR("siriFoundInAppsData"));

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage siriFoundInAppsUserConfirmation](self, "siriFoundInAppsUserConfirmation"), CFSTR("siriFoundInAppsUserConfirmation"));
  -[REMReminderStorage lastBannerPresentationDate](self, "lastBannerPresentationDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v33, CFSTR("lastBannerPresentationDate"));

  -[REMReminderStorage displayDate](self, "displayDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v34, CFSTR("displayDate"));

  if (self->_hasDeserializedTitleDocument)
  {
    if (self->_deserializedTitleDocumentCache)
    {
      -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "length");

      if (!v36)
      {
        -[REMCRMergeableStringDocument serializedData](self->_deserializedTitleDocumentCache, "serializedData");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage setTitleDocumentData:](self, "setTitleDocumentData:", v37);

      }
    }
    else
    {
      -[REMReminderStorage setTitleDocumentData:](self, "setTitleDocumentData:", 0);
    }
  }
  -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v38, CFSTR("titleDocumentData"));

  -[REMReminderStorage titleAsString](self, "titleAsString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v39, CFSTR("titleAsString"));

  if (self->_hasDeserializedNotesDocument)
  {
    if (self->_deserializedNotesDocumentCache)
    {
      -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "length");

      if (!v41)
      {
        -[REMCRMergeableStringDocument serializedData](self->_deserializedNotesDocumentCache, "serializedData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderStorage setNotesDocumentData:](self, "setNotesDocumentData:", v42);

      }
    }
    else
    {
      -[REMReminderStorage setNotesDocumentData:](self, "setNotesDocumentData:", 0);
    }
  }
  -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v43, CFSTR("notesDocumentData"));

  -[REMReminderStorage notesAsString](self, "notesAsString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v44, CFSTR("notesAsString"));

  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    objc_msgSend(v52, "encodeObject:forKey:", resolutionTokenMap, CFSTR("resolutionTokenMap"));
    objc_msgSend(v52, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMapData"));
  }
  else
  {
    objc_msgSend(v52, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMap"));
    -[REMReminderStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "encodeObject:forKey:", v46, CFSTR("resolutionTokenMapData"));

  }
  -[REMReminderStorage subtaskIDsToUndelete](self, "subtaskIDsToUndelete");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "allObjects");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v48, CFSTR("subtaskIDsToUndelete"));

  -[REMReminderStorage hashtagIDsToUndelete](self, "hashtagIDsToUndelete");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "allObjects");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v50, CFSTR("hashtagIDsToUndelete"));

  objc_msgSend(v52, "encodeObject:forKey:", self->_fetchedDueDateDeltaAlerts, CFSTR("fetchedDueDateDeltaAlerts"));
  -[REMReminderStorage alternativeDisplayDateDate_forCalendar](self, "alternativeDisplayDateDate_forCalendar");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "encodeObject:forKey:", v51, CFSTR("alternativeDisplayDateDate_forCalendar"));

}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration)
    self->_storeGeneration = a3;
}

- (id)titleDocument
{
  REMCRMergeableStringDocument *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (self->_hasDeserializedTitleDocument)
  {
    v3 = self->_deserializedTitleDocumentCache;
  }
  else
  {
    self->_hasDeserializedTitleDocument = 1;
    -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage titleReplicaIDSource](self, "titleReplicaIDSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMCRMergeableStringDocument documentFromSerializedData:replicaIDSource:forKey:ofObjectID:](REMCRMergeableStringDocument, "documentFromSerializedData:replicaIDSource:forKey:ofObjectID:", v4, v5, CFSTR("titleDocument"), v6);
    v3 = (REMCRMergeableStringDocument *)objc_claimAutoreleasedReturnValue();

    -[REMReminderStorage titleDocumentData](self, "titleDocumentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || v3)
    {
      objc_storeStrong((id *)&self->_deserializedTitleDocumentCache, v3);
    }
    else
    {
      +[REMLogStore read](REMLogStore, "read");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[REMReminderStorage titleDocument].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  return v3;
}

- (void)setTitleDocument:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_hasDeserializedTitleDocument = 1;
  objc_storeStrong((id *)&self->_deserializedTitleDocumentCache, a3);
  objc_msgSend(v7, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setTitleAsString:](self, "setTitleAsString:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage setTitleDocumentData:](self, "setTitleDocumentData:", v6);

  }
  else
  {
    -[REMReminderStorage setTitleDocumentData:](self, "setTitleDocumentData:", 0);
  }

}

- (id)notesDocument
{
  REMCRMergeableStringDocument *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (self->_hasDeserializedNotesDocument)
  {
    v3 = self->_deserializedNotesDocumentCache;
  }
  else
  {
    self->_hasDeserializedNotesDocument = 1;
    -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage notesReplicaIDSource](self, "notesReplicaIDSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMCRMergeableStringDocument documentFromSerializedData:replicaIDSource:forKey:ofObjectID:](REMCRMergeableStringDocument, "documentFromSerializedData:replicaIDSource:forKey:ofObjectID:", v4, v5, CFSTR("notesDocument"), v6);
    v3 = (REMCRMergeableStringDocument *)objc_claimAutoreleasedReturnValue();

    -[REMReminderStorage notesDocumentData](self, "notesDocumentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || v3)
    {
      objc_storeStrong((id *)&self->_deserializedNotesDocumentCache, v3);
    }
    else
    {
      +[REMLogStore read](REMLogStore, "read");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[REMReminderStorage notesDocument].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  return v3;
}

- (void)setNotesDocument:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_hasDeserializedNotesDocument = 1;
  objc_storeStrong((id *)&self->_deserializedNotesDocumentCache, a3);
  objc_msgSend(v7, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setNotesAsString:](self, "setNotesAsString:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderStorage setNotesDocumentData:](self, "setNotesDocumentData:", v6);

  }
  else
  {
    -[REMReminderStorage setNotesDocumentData:](self, "setNotesDocumentData:", 0);
  }

}

- (NSString)legacyNotificationIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminderStorage daCalendarItemUniqueIdentifier](self, "daCalendarItemUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (legacyNotificationIdentifier_onceToken != -1)
      dispatch_once(&legacyNotificationIdentifier_onceToken, &__block_literal_global_8);
    objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", legacyNotificationIdentifier_allowedCharacters);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-apple-eventkit-alert-x-apple-reminder://%@"), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

void __50__REMReminderStorage_legacyNotificationIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("/?&:$+,;=@"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)legacyNotificationIdentifier_allowedCharacters;
  legacyNotificationIdentifier_allowedCharacters = v1;

}

- (id)currentAssignment
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  -[REMReminderStorage assignments](self, "assignments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__REMReminderStorage_currentAssignment__block_invoke;
  v5[3] = &unk_1E67F8408;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__REMReminderStorage_currentAssignment__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v12 = v4;
  if (!v8)
    goto LABEL_4;
  objc_msgSend(v7, "orderValue");
  v10 = v9;
  objc_msgSend(v12, "orderValue");
  if (v10 <= v11)
  {
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_4:
    objc_storeStrong(v6, a2);
  }

}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDReminder");
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMReminderStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (id)cdKeyToStorageKeyMap
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t *v6;

  -[REMReminderStorage objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    if (cdSavedReminderKeyToStorageKeyMap_onceToken != -1)
      dispatch_once(&cdSavedReminderKeyToStorageKeyMap_onceToken, &__block_literal_global_508);
    v6 = &cdSavedReminderKeyToStorageKeyMap_mapping;
  }
  else
  {
    if (cdReminderKeyToStorageKeyMap_onceToken != -1)
      dispatch_once(&cdReminderKeyToStorageKeyMap_onceToken, &__block_literal_global_510);
    v6 = &cdReminderKeyToStorageKeyMap_mapping;
  }
  return (id)*v6;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  REMResolutionTokenMap **p_resolutionTokenMap;
  REMResolutionTokenMap *v4;
  REMResolutionTokenMap *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  p_resolutionTokenMap = &self->_resolutionTokenMap;
  v4 = self->_resolutionTokenMap;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[REMReminderStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLogStore read](REMLogStore, "read");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMReminderStorage resolutionTokenMap].cold.1((uint64_t)self, v7);

    }
    -[REMReminderStorage cdKeyToStorageKeyMap](self, "cdKeyToStorageKeyMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:](REMResolutionTokenMap, "resolutionTokenMapWithJSONData:keyMap:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    v5 = v9;

  }
  return v5;
}

+ (id)titleReplicaIDSourceWithAccountID:(id)a3 reminderID:(id)a4
{
  id v5;
  id v6;
  REMReplicaIDSource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REMReplicaIDSource initWithAccountID:objectID:property:]([REMReplicaIDSource alloc], "initWithAccountID:objectID:property:", v6, v5, CFSTR("titleDocument"));

  return v7;
}

+ (id)notesReplicaIDSourceWithAccountID:(id)a3 reminderID:(id)a4
{
  id v5;
  id v6;
  REMReplicaIDSource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REMReplicaIDSource initWithAccountID:objectID:property:]([REMReplicaIDSource alloc], "initWithAccountID:objectID:property:", v6, v5, CFSTR("notesDocument"));

  return v7;
}

- (id)titleReplicaIDSource
{
  void *v3;
  void *v4;
  void *v5;

  -[REMReminderStorage accountID](self, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReminderStorage titleReplicaIDSourceWithAccountID:reminderID:](REMReminderStorage, "titleReplicaIDSourceWithAccountID:reminderID:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notesReplicaIDSource
{
  void *v3;
  void *v4;
  void *v5;

  -[REMReminderStorage accountID](self, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReminderStorage notesReplicaIDSourceWithAccountID:reminderID:](REMReminderStorage, "notesReplicaIDSourceWithAccountID:reminderID:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateDisplayDate
{
  REMDisplayDate *v3;
  void *v4;
  REMDisplayDate *v5;
  id v6;

  v3 = [REMDisplayDate alloc];
  -[REMReminderStorage dueDateComponents](self, "dueDateComponents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage alarms](self, "alarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMDisplayDate initWithDueDateComponents:alarms:](v3, "initWithDueDateComponents:alarms:", v6, v4);
  -[REMReminderStorage setDisplayDate:](self, "setDisplayDate:", v5);

}

+ (BOOL)isDate:(id)a3 overdueAtReferenceDate:(id)a4 allDay:(BOOL)a5 showAllDayRemindersAsOverdue:(BOOL)a6
{
  void *v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  LODWORD(v6) = a6;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a5)
  {
    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startOfDayForDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "timeIntervalSinceDate:", v9);
      LOBYTE(v6) = v13 > 0.0;

    }
  }
  else
  {
    objc_msgSend(v10, "timeIntervalSinceDate:", v9);
    LOBYTE(v6) = v14 > 0.0;
  }

  return (char)v6;
}

- (BOOL)isOverdue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  -[REMReminderStorage displayDate](self, "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[REMReminderStorage displayDate](self, "displayDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage displayDate](self, "displayDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllDay");
  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[REMReminderStorage isDate:overdueAtReferenceDate:allDay:showAllDayRemindersAsOverdue:](REMReminderStorage, "isDate:overdueAtReferenceDate:allDay:showAllDayRemindersAsOverdue:", v5, v6, v8, objc_msgSend(v9, "showRemindersAsOverdue"));

  return v10;
}

- (BOOL)isRecurrent
{
  void *v2;
  BOOL v3;

  -[REMReminderStorage recurrenceRules](self, "recurrenceRules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasUnfetchedDueDateDeltaAlerts
{
  void *v3;
  void *v4;
  BOOL v5;

  -[REMReminderStorage dueDateDeltaAlertsData](self, "dueDateDeltaAlertsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[REMReminderStorage fetchedDueDateDeltaAlerts](self, "fetchedDueDateDeltaAlerts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fetchedDueDateDeltaAlerts
{
  return self->_fetchedDueDateDeltaAlerts;
}

- (void)setFetchedDueDateDeltaAlerts:(id)a3
{
  NSArray *v4;
  NSArray *fetchedDueDateDeltaAlerts;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  fetchedDueDateDeltaAlerts = self->_fetchedDueDateDeltaAlerts;
  self->_fetchedDueDateDeltaAlerts = v4;

}

- (id)effectiveDisplayDateComponents_forCalendar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[REMReminderStorage displayDate](self, "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[REMReminderStorage alternativeDisplayDateDate_forCalendar](self, "alternativeDisplayDateDate_forCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (-[REMReminderStorage isCompleted](self, "isCompleted")
       || !-[REMReminderStorage isRecurrent](self, "isRecurrent")))
    {
      objc_msgSend(v3, "timeZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D78];
      v8 = objc_msgSend(v3, "isAllDay");
      if (v6)
        objc_msgSend(v7, "rem_dateComponentsWithDate:timeZone:isAllDay:", v4, v6, v8);
      else
        objc_msgSend(v7, "rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:", v4, v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "dateComponentsRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v4)
      objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateWithDateComponents:timeZone:", v6, v4);
    else
      objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateWithDateComponentsUsingArchivingTimeZone:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[REMReminderStorage setAlternativeDisplayDateDate_forCalendar:](self, "setAlternativeDisplayDateDate_forCalendar:", v5);

}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (void)setDaSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (void)setDaPushKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void)setListID:(id)a3
{
  objc_storeStrong((id *)&self->_listID, a3);
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (void)setParentReminderID:(id)a3
{
  objc_storeStrong((id *)&self->_parentReminderID, a3);
}

- (NSData)titleDocumentData
{
  return self->_titleDocumentData;
}

- (void)setTitleDocumentData:(id)a3
{
  objc_storeStrong((id *)&self->_titleDocumentData, a3);
}

- (NSData)notesDocumentData
{
  return self->_notesDocumentData;
}

- (void)setNotesDocumentData:(id)a3
{
  objc_storeStrong((id *)&self->_notesDocumentData, a3);
}

- (NSString)primaryLocaleInferredFromLastUsedKeyboard
{
  return self->_primaryLocaleInferredFromLastUsedKeyboard;
}

- (void)setPrimaryLocaleInferredFromLastUsedKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLocaleInferredFromLastUsedKeyboard, a3);
}

- (NSString)titleAsString
{
  return self->_titleAsString;
}

- (void)setTitleAsString:(id)a3
{
  objc_storeStrong((id *)&self->_titleAsString, a3);
}

- (NSString)notesAsString
{
  return self->_notesAsString;
}

- (void)setNotesAsString:(id)a3
{
  objc_storeStrong((id *)&self->_notesAsString, a3);
}

- (void)setResolutionTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMap, a3);
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (void)setResolutionTokenMapData:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, a3);
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSSet)subtaskIDsToUndelete
{
  return self->_subtaskIDsToUndelete;
}

- (void)setSubtaskIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_subtaskIDsToUndelete, a3);
}

- (NSSet)hashtagIDsToUndelete
{
  return self->_hashtagIDsToUndelete;
}

- (void)setHashtagIDsToUndelete:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagIDsToUndelete, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)recurrenceRules
{
  return self->_recurrenceRules;
}

- (void)setRecurrenceRules:(id)a3
{
  objc_storeStrong((id *)&self->_recurrenceRules, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (REMContactRepresentation)contactHandles
{
  return self->_contactHandles;
}

- (void)setContactHandles:(id)a3
{
  objc_storeStrong((id *)&self->_contactHandles, a3);
}

- (unint64_t)icsDisplayOrder
{
  return self->_icsDisplayOrder;
}

- (void)setIcsDisplayOrder:(unint64_t)a3
{
  self->_icsDisplayOrder = a3;
}

- (NSURL)icsUrl
{
  return self->_icsUrl;
}

- (void)setIcsUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSData)importedICSData
{
  return self->_importedICSData;
}

- (void)setImportedICSData:(id)a3
{
  objc_storeStrong((id *)&self->_importedICSData, a3);
}

- (NSString)daCalendarItemUniqueIdentifier
{
  return self->_daCalendarItemUniqueIdentifier;
}

- (void)setDaCalendarItemUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (REMUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSData)siriFoundInAppsData
{
  return self->_siriFoundInAppsData;
}

- (void)setSiriFoundInAppsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (int64_t)siriFoundInAppsUserConfirmation
{
  return self->_siriFoundInAppsUserConfirmation;
}

- (void)setSiriFoundInAppsUserConfirmation:(int64_t)a3
{
  self->_siriFoundInAppsUserConfirmation = a3;
}

- (NSDate)lastBannerPresentationDate
{
  return self->_lastBannerPresentationDate;
}

- (void)setLastBannerPresentationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (int64_t)flagged
{
  return self->_flagged;
}

- (void)setFlagged:(int64_t)a3
{
  self->_flagged = a3;
}

- (NSSet)assignments
{
  return self->_assignments;
}

- (void)setAssignments:(id)a3
{
  objc_storeStrong((id *)&self->_assignments, a3);
}

- (NSSet)hashtags
{
  return self->_hashtags;
}

- (void)setHashtags:(id)a3
{
  objc_storeStrong((id *)&self->_hashtags, a3);
}

- (NSData)dueDateDeltaAlertsData
{
  return self->_dueDateDeltaAlertsData;
}

- (void)setDueDateDeltaAlertsData:(id)a3
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlertsData, a3);
}

- (NSArray)dueDateDeltaAlertsToUpsert
{
  return self->_dueDateDeltaAlertsToUpsert;
}

- (void)setDueDateDeltaAlertsToUpsert:(id)a3
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlertsToUpsert, a3);
}

- (NSSet)dueDateDeltaAlertIdentifiersToDelete
{
  return self->_dueDateDeltaAlertIdentifiersToDelete;
}

- (void)setDueDateDeltaAlertIdentifiersToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlertIdentifiersToDelete, a3);
}

- (NSDate)alternativeDisplayDateDate_forCalendar
{
  return self->_alternativeDisplayDateDate_forCalendar;
}

- (void)setAlternativeDisplayDateDate_forCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeDisplayDateDate_forCalendar, a3);
}

- (REMDisplayDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_alternativeDisplayDateDate_forCalendar, 0);
  objc_storeStrong((id *)&self->_dueDateDeltaAlertIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_dueDateDeltaAlertsToUpsert, 0);
  objc_storeStrong((id *)&self->_dueDateDeltaAlertsData, 0);
  objc_storeStrong((id *)&self->_hashtags, 0);
  objc_storeStrong((id *)&self->_assignments, 0);
  objc_storeStrong((id *)&self->_lastBannerPresentationDate, 0);
  objc_storeStrong((id *)&self->_siriFoundInAppsData, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_daCalendarItemUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_importedICSData, 0);
  objc_storeStrong((id *)&self->_icsUrl, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_recurrenceRules, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_hashtagIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_subtaskIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_notesAsString, 0);
  objc_storeStrong((id *)&self->_titleAsString, 0);
  objc_storeStrong((id *)&self->_primaryLocaleInferredFromLastUsedKeyboard, 0);
  objc_storeStrong((id *)&self->_notesDocumentData, 0);
  objc_storeStrong((id *)&self->_titleDocumentData, 0);
  objc_storeStrong((id *)&self->_parentReminderID, 0);
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchedDueDateDeltaAlerts, 0);
  objc_storeStrong((id *)&self->_deserializedNotesDocumentCache, 0);
  objc_storeStrong((id *)&self->_deserializedTitleDocumentCache, 0);
}

- (void)isEqual:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1B4A39000, v0, v1, "Tried to compare two REMReminderStorage instances without first deserializing their CRDT notesDocument {self: %@, other: %@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)isEqual:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1B4A39000, v0, v1, "Tried to compare two REMReminderStorage instances without first deserializing their CRDT titleDocument {self: %@, other: %@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMSiriFoundInAppsUserConfirmation %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3_1();
}

- (void)titleDocument
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Failed to read titleDocument from data. Returning nil.", a5, a6, a7, a8, 0);
}

- (void)notesDocument
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Failed to read notesDocument from data. Returning nil.", a5, a6, a7, a8, 0);
}

- (void)resolutionTokenMap
{
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2112;
  v9 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from reminder storage. Initialize an empty map {class: %{public}@, reminder: %@}", (uint8_t *)&v6, 0x16u);

}

@end
