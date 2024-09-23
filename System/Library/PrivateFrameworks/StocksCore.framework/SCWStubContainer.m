@implementation SCWStubContainer

- (SCWStubContainer)init
{
  SCWStubContainer *v2;
  NSArray *v3;
  NSArray *modifyZonesSavedZones;
  NSArray *v5;
  NSArray *modifyRecordsSavedRecords;
  NSArray *v7;
  NSArray *modifySubscriptionsSavedSubscriptions;
  NSMutableDictionary *v9;
  NSMutableDictionary *zoneContentsByZoneID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCWStubContainer;
  v2 = -[SCWStubContainer init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    modifyZonesSavedZones = v2->_modifyZonesSavedZones;
    v2->_modifyZonesSavedZones = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    modifyRecordsSavedRecords = v2->_modifyRecordsSavedRecords;
    v2->_modifyRecordsSavedRecords = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    modifySubscriptionsSavedSubscriptions = v2->_modifySubscriptionsSavedSubscriptions;
    v2->_modifySubscriptionsSavedSubscriptions = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    zoneContentsByZoneID = v2->_zoneContentsByZoneID;
    v2->_zoneContentsByZoneID = v9;

    v2->_accountInfoSupportsDeviceToDeviceEncryption = 1;
  }
  return v2;
}

- (void)setContentsOfZone:(id)a3 toRecords:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "recordID", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v16 = objc_alloc(MEMORY[0x1E0C95098]);
  v17 = (void *)objc_msgSend(v16, "initWithZoneName:ownerName:", v6, *MEMORY[0x1E0C94730]);
  -[SCWStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, v17);

}

- (id)contentsOfZone:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v5, *MEMORY[0x1E0C94730]);

  -[SCWStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contentsOfZone:(id)a3 withType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  -[SCWStubContainer contentsOfZone:](self, "contentsOfZone:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__SCWStubContainer_contentsOfZone_withType___block_invoke;
  v12[3] = &unk_1E5AF26B0;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44__SCWStubContainer_contentsOfZone_withType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)recordWithName:(id)a3 inZone:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (objc_class *)MEMORY[0x1E0C95098];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithZoneName:ownerName:", v7, *MEMORY[0x1E0C94730]);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v8, v10);
  -[SCWStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)addDatabaseOperation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t jj;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v28;
  int64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v41;
  void (**v42)(void);
  void *v43;
  void (**v44)(_QWORD, _QWORD);
  void *v45;
  void (**v46)(void);
  id v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v51;
  void *v52;
  NSArray *v53;
  NSArray *modifyZonesSavedZones;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSArray *v71;
  NSArray *modifySubscriptionsSavedSubscriptions;
  void *v73;
  void (**v74)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v75;
  void *v76;
  void *v77;
  uint64_t k;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t m;
  uint64_t v89;
  void *v90;
  void (**v91)(_QWORD, _QWORD);
  void *v92;
  void *v93;
  void (**v94)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v95;
  void (**v96)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t n;
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
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t ii;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  SCWStubContainer *v131;
  void *v132;
  void *v133;
  void (**v134)(void);
  void *v135;
  void (**v136)(_QWORD, _QWORD);
  void *v137;
  uint64_t v138;
  id v139;
  id v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void (**v145)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v146;
  id v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  void (**v152)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v153;
  id v154;
  id obj;
  void *v156;
  void *v157;
  id v158;
  id v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  SCWStubContainer *v164;
  void *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[4];
  id v171;
  SCWStubContainer *v172;
  id v173;
  _QWORD v174[4];
  id v175;
  SCWStubContainer *v176;
  id v177;
  id v178;
  _QWORD v179[4];
  id v180;
  SCWStubContainer *v181;
  id v182;
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
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _BYTE v207[128];
  uint64_t v208;
  id v209;
  void *v210;
  _BYTE v211[128];
  void *v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v164 = self;
  if (v5 == objc_opt_class())
  {
    v153 = v4;
    v24 = v4;
    ++self->_modifyZonesOperationCount;
    if (-[SCWStubContainer modifyZonesErrorMode](self, "modifyZonesErrorMode"))
    {
      -[SCWStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", -[SCWStubContainer modifyZonesErrorMode](self, "modifyZonesErrorMode"));
      v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "modifyRecordZonesCompletionBlock");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
LABEL_53:

LABEL_54:
        goto LABEL_132;
      }
      objc_msgSend(v24, "modifyRecordZonesCompletionBlock");
      v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v27[2](v27, 0, 0, v25);
    }
    else
    {
      -[SCWStubContainer modifyZonesSavedZones](self, "modifyZonesSavedZones");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recordZonesToSave");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "arrayByAddingObjectsFromArray:", v52);
      v53 = (NSArray *)objc_claimAutoreleasedReturnValue();
      modifyZonesSavedZones = self->_modifyZonesSavedZones;
      self->_modifyZonesSavedZones = v53;

      v205 = 0u;
      v206 = 0u;
      v203 = 0u;
      v204 = 0u;
      objc_msgSend(v24, "recordZonesToSave");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v203, v217, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v204;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v204 != v58)
              objc_enumerationMutation(v55);
            v60 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * i);
            -[SCWStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "zoneID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectForKeyedSubscript:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[SCWStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "zoneID");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, v66);

            }
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v203, v217, 16);
        }
        while (v57);
      }

      objc_msgSend(v24, "modifyRecordZonesCompletionBlock");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
        goto LABEL_54;
      objc_msgSend(v24, "modifyRecordZonesCompletionBlock");
      v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recordZonesToSave");
      v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recordZoneIDsToDelete");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, _QWORD))v25)[2](v25, v27, v68, 0);

    }
    goto LABEL_53;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v28 = v4;
    ++self->_zoneChangesOperationCount;
    if (-[SCWStubContainer zoneChangesErrorMode](self, "zoneChangesErrorMode"))
    {
      v29 = -[SCWStubContainer zoneChangesErrorMode](self, "zoneChangesErrorMode");
      objc_msgSend(v28, "recordZoneIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCWStubContainer _errorForErrorMode:itemIDs:](self, "_errorForErrorMode:itemIDs:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v31, "code") == 2)
      {
        v32 = v4;
        v201 = 0u;
        v202 = 0u;
        v199 = 0u;
        v200 = 0u;
        objc_msgSend(v28, "recordZoneIDs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v199, v216, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v200;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v200 != v36)
                objc_enumerationMutation(v33);
              v38 = *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * j);
              objc_msgSend(v28, "recordZoneFetchCompletionBlock");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                objc_msgSend(v28, "recordZoneFetchCompletionBlock");
                v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, void *))v40)[2](v40, v38, 0, 0, 0, v31);

              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v199, v216, 16);
          }
          while (v35);
        }

        v4 = v32;
      }
      -[SCWStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        -[SCWStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
        v42 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v42[2]();

      }
      objc_msgSend(v28, "fetchRecordZoneChangesCompletionBlock");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v28, "fetchRecordZoneChangesCompletionBlock");
        v44 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v44)[2](v44, v31);
        goto LABEL_115;
      }
      goto LABEL_116;
    }
    v154 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = 0u;
    v196 = 0u;
    v197 = 0u;
    v198 = 0u;
    objc_msgSend(v28, "recordZoneIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v160 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v215, 16);
    if (!v160)
      goto LABEL_82;
    v156 = v31;
    v158 = *(id *)v196;
    while (1)
    {
      for (k = 0; k != v160; ++k)
      {
        if (*(id *)v196 != v158)
          objc_enumerationMutation(obj);
        v79 = *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * k);
        -[SCWStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v81)
        {
          objc_msgSend(v31, "addObject:", v79);
          -[SCWStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", 2);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "recordZoneFetchCompletionBlock");
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v97)
            goto LABEL_80;
          objc_msgSend(v28, "recordZoneFetchCompletionBlock");
          v96 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, void *))v96)[2](v96, v79, 0, 0, 0, v93);
          goto LABEL_78;
        }
        v82 = objc_alloc(MEMORY[0x1E0C95100]);
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = objc_msgSend(v82, "initWithData:", v83);

        v193 = 0u;
        v194 = 0u;
        v191 = 0u;
        v192 = 0u;
        objc_msgSend(v81, "allValues");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v191, v214, 16);
        if (v85)
        {
          v86 = v85;
          v87 = *(_QWORD *)v192;
          do
          {
            for (m = 0; m != v86; ++m)
            {
              if (*(_QWORD *)v192 != v87)
                objc_enumerationMutation(v84);
              v89 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * m);
              objc_msgSend(v28, "recordChangedBlock");
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              if (v90)
              {
                objc_msgSend(v28, "recordChangedBlock");
                v91 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                v91[2](v91, v89);

              }
            }
            v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v191, v214, 16);
          }
          while (v86);
        }

        objc_msgSend(v28, "recordZoneChangeTokensUpdatedBlock");
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        v93 = (void *)v162;
        if (v92)
        {
          objc_msgSend(v28, "recordZoneChangeTokensUpdatedBlock");
          v94 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v94[2](v94, v79, v162, 0);

        }
        objc_msgSend(v28, "recordZoneFetchCompletionBlock");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v156;
        if (v95)
        {
          objc_msgSend(v28, "recordZoneFetchCompletionBlock");
          v96 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v96[2](v96, v79, v162, 0, 0, 0);
          self = v164;
LABEL_78:

          goto LABEL_80;
        }
        self = v164;
LABEL_80:

      }
      v160 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v215, 16);
      if (!v160)
      {
LABEL_82:

        if (objc_msgSend(v31, "count"))
        {
          -[SCWStubContainer _errorForErrorMode:itemIDs:](self, "_errorForErrorMode:itemIDs:", 2, v31);
          v44 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = 0;
        }
        -[SCWStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        if (v133)
        {
          -[SCWStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
          v134 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v134[2]();

        }
        objc_msgSend(v28, "fetchRecordZoneChangesCompletionBlock");
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v154;
        if (v135)
        {
          objc_msgSend(v28, "fetchRecordZoneChangesCompletionBlock");
          v136 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v136[2](v136, v44);

        }
LABEL_115:

LABEL_116:
LABEL_117:

        goto LABEL_133;
      }
    }
  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    -[SCWStubContainer willModifyRecords](self, "willModifyRecords");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[SCWStubContainer willModifyRecords](self, "willModifyRecords");
      v46 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v46[2]();

    }
    v153 = v4;
    v47 = v4;
    ++self->_modifyRecordsOperationCount;
    if (-[SCWStubContainer modifyRecordsErrorMode](self, "modifyRecordsErrorMode"))
    {
      -[SCWStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", -[SCWStubContainer modifyRecordsErrorMode](self, "modifyRecordsErrorMode"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "modifyRecordsCompletionBlock");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v47, "modifyRecordsCompletionBlock");
        v50 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v50)[2](v50, 0, 0, v48);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v190 = 0u;
      v157 = v47;
      objc_msgSend(v47, "recordsToSave");
      v159 = (id)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v187, v213, 16);
      if (v99)
      {
        v100 = v99;
        v101 = *(_QWORD *)v188;
        do
        {
          for (n = 0; n != v100; ++n)
          {
            if (*(_QWORD *)v188 != v101)
              objc_enumerationMutation(v159);
            v103 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * n);
            objc_msgSend(v103, "recordID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "zoneID");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "objectForKeyedSubscript:", v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            if (v106)
            {
              objc_msgSend(v106, "arrayByAddingObject:", v103);
              v107 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v212 = v103;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v212, 1);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v103, "recordID");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "zoneID");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "setObject:forKeyedSubscript:", v107, v109);

            -[SCWStubContainer zoneContentsByZoneID](v164, "zoneContentsByZoneID");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "recordID");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "zoneID");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "objectForKeyedSubscript:", v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v113)
            {
              objc_msgSend(v103, "recordID");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "zoneID");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "addObject:", v115);

            }
          }
          v100 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v187, v213, 16);
        }
        while (v100);
      }

      v185 = 0u;
      v186 = 0u;
      v183 = 0u;
      v184 = 0u;
      objc_msgSend(v157, "recordIDsToDelete");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v183, v211, 16);
      if (v117)
      {
        v118 = v117;
        v119 = *(_QWORD *)v184;
        do
        {
          for (ii = 0; ii != v118; ++ii)
          {
            if (*(_QWORD *)v184 != v119)
              objc_enumerationMutation(v116);
            v121 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * ii);
            objc_msgSend(v121, "zoneID");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "objectForKeyedSubscript:", v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            if (v123)
            {
              objc_msgSend(v123, "arrayByAddingObject:", v121);
              v124 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v210 = v121;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v210, 1);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v121, "zoneID");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:forKeyedSubscript:", v124, v125);

            -[SCWStubContainer zoneContentsByZoneID](v164, "zoneContentsByZoneID");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "zoneID");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "objectForKeyedSubscript:", v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v128)
            {
              objc_msgSend(v121, "zoneID");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "addObject:", v129);

            }
          }
          v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v183, v211, 16);
        }
        while (v118);
      }

      if (objc_msgSend(v161, "count"))
      {
        objc_msgSend(v161, "allObjects");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = v164;
        -[SCWStubContainer _errorForErrorMode:itemIDs:](v164, "_errorForErrorMode:itemIDs:", 2, v130);
        v132 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v132 = 0;
        v131 = v164;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = MEMORY[0x1E0C809B0];
      v179[0] = MEMORY[0x1E0C809B0];
      v179[1] = 3221225472;
      v179[2] = __41__SCWStubContainer_addDatabaseOperation___block_invoke;
      v179[3] = &unk_1E5AF26D8;
      v139 = v161;
      v180 = v139;
      v181 = v131;
      v140 = v137;
      v182 = v140;
      objc_msgSend(v163, "enumerateKeysAndObjectsUsingBlock:", v179);
      if (!v132)
      {
        if (objc_msgSend(v140, "count"))
        {
          v141 = (void *)MEMORY[0x1E0CB35C8];
          v142 = *MEMORY[0x1E0C947D8];
          v208 = *MEMORY[0x1E0C94940];
          v209 = v140;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "errorWithDomain:code:userInfo:", v142, 2, v143);
          v132 = (void *)objc_claimAutoreleasedReturnValue();

          v131 = v164;
        }
        else
        {
          v132 = 0;
        }
      }
      if (objc_msgSend(v140, "count") && objc_msgSend(v157, "atomic"))
      {
        objc_msgSend(v157, "modifyRecordsCompletionBlock");
        v144 = (void *)objc_claimAutoreleasedReturnValue();

        if (v144)
        {
          objc_msgSend(v157, "modifyRecordsCompletionBlock");
          v145 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, _QWORD, void *))v145)[2](v145, 0, 0, v132);

        }
        goto LABEL_132;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v174[0] = v138;
      v174[1] = 3221225472;
      v174[2] = __41__SCWStubContainer_addDatabaseOperation___block_invoke_2;
      v174[3] = &unk_1E5AF2700;
      v165 = v139;
      v147 = v139;
      v175 = v147;
      v176 = v131;
      v177 = v140;
      v47 = v157;
      v148 = v146;
      v178 = v148;
      objc_msgSend(v163, "enumerateKeysAndObjectsUsingBlock:", v174);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v170[0] = v138;
      v170[1] = 3221225472;
      v170[2] = __41__SCWStubContainer_addDatabaseOperation___block_invoke_3;
      v170[3] = &unk_1E5AF26D8;
      v171 = v147;
      v172 = v131;
      v150 = v149;
      v173 = v150;
      objc_msgSend(v98, "enumerateKeysAndObjectsUsingBlock:", v170);
      objc_msgSend(v157, "modifyRecordsCompletionBlock");
      v151 = (void *)objc_claimAutoreleasedReturnValue();

      if (v151)
      {
        objc_msgSend(v157, "modifyRecordsCompletionBlock");
        v152 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id, void *))v152)[2](v152, v148, v150, v132);

      }
    }

LABEL_132:
    v4 = v153;
    goto LABEL_133;
  }
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v28 = v4;
    ++self->_modifySubscriptionsOperationCount;
    -[SCWStubContainer modifySubscriptionsSavedSubscriptions](self, "modifySubscriptionsSavedSubscriptions");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subscriptionsToSave");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "arrayByAddingObjectsFromArray:", v70);
    v71 = (NSArray *)objc_claimAutoreleasedReturnValue();
    modifySubscriptionsSavedSubscriptions = self->_modifySubscriptionsSavedSubscriptions;
    self->_modifySubscriptionsSavedSubscriptions = v71;

    objc_msgSend(v28, "modifySubscriptionsCompletionBlock");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v28, "modifySubscriptionsCompletionBlock");
      v74 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "subscriptionsToSave");
      v75 = v4;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "subscriptionIDsToDelete");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v74)[2](v74, v76, v77, 0);

      v4 = v75;
    }
    goto LABEL_117;
  }
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    v10 = v4;
    v11 = v4;
    ++self->_databaseChangesOperationCount;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    -[SCWStubContainer databaseChangesOperationChangedZoneIDs](self, "databaseChangesOperationChangedZoneIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v166, v207, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v167;
      do
      {
        for (jj = 0; jj != v14; ++jj)
        {
          if (*(_QWORD *)v167 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * jj);
          objc_msgSend(v11, "recordZoneWithIDChangedBlock");
          v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v18[2](v18, v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v166, v207, 16);
      }
      while (v14);
    }

    v19 = objc_alloc(MEMORY[0x1E0C95100]);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithData:", v20);

    objc_msgSend(v11, "fetchDatabaseChangesCompletionBlock");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v11, "fetchDatabaseChangesCompletionBlock");
      v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD))v23)[2](v23, v21, 0, 0);

    }
    v4 = v10;
  }
LABEL_133:

}

void __41__SCWStubContainer_addDatabaseOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    v29 = a1;
    objc_msgSend(*(id *)(a1 + 40), "zoneContentsByZoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v5;
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (!v8)
      goto LABEL_15;
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v28 = *MEMORY[0x1E0C949B0];
    v27 = *MEMORY[0x1E0C949B8];
    v26 = *MEMORY[0x1E0C947D8];
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "recordID", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "recordChangeTag");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recordChangeTag");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v15 == (void *)v16)
          {
            v21 = v15;
          }
          else
          {
            v17 = (void *)v16;
            objc_msgSend(v12, "recordChangeTag");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "recordChangeTag");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToString:", v19);

            if ((v20 & 1) != 0)
              goto LABEL_13;
            v36[0] = v28;
            v36[1] = v27;
            v37[0] = v12;
            v37[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v26, 14, v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = *(void **)(v29 + 48);
            objc_msgSend(v12, "recordID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKey:", v15, v23);

          }
        }
LABEL_13:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (!v9)
      {
LABEL_15:

        v6 = v24;
        v5 = v25;
        break;
      }
    }
  }

}

void __41__SCWStubContainer_addDatabaseOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "zoneContentsByZoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v15 = *(void **)(a1 + 48);
          objc_msgSend(v14, "recordID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v14, "recordID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v18);

            objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
            objc_msgSend(*(id *)(a1 + 40), "modifyRecordsSavedRecords");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "arrayByAddingObject:", v14);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = *(_QWORD *)(a1 + 40);
            v22 = *(void **)(v21 + 88);
            *(_QWORD *)(v21 + 88) = v20;

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v6 = v23;
  }

}

void __41__SCWStubContainer_addDatabaseOperation___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(a1[4], "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(a1[5], "zoneContentsByZoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v8, "removeObjectForKey:", v14, (_QWORD)v15);
          objc_msgSend(a1[6], "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  id v5;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (-[SCWStubContainer accountInfoErrorMode](self, "accountInfoErrorMode"))
  {
    -[SCWStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", -[SCWStubContainer accountInfoErrorMode](self, "accountInfoErrorMode"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C94B88]);
    objc_msgSend(v5, "setAccountStatus:", 1);
    objc_msgSend(v5, "setAccountPartition:", 1);
    objc_msgSend(v5, "setHasValidCredentials:", 1);
    objc_msgSend(v5, "setHasEncryptionIdentity:", 1);
    objc_msgSend(v5, "setSupportsDeviceToDeviceEncryption:", -[SCWStubContainer accountInfoSupportsDeviceToDeviceEncryption](self, "accountInfoSupportsDeviceToDeviceEncryption"));
    ((void (**)(id, id, id))v4)[2](v4, v5, 0);
  }

}

- (id)_errorForErrorMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  v5 = -[SCWStubContainer _ckErrorCodeForErrorMode:](self, "_ckErrorCodeForErrorMode:", v3, v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_errorForErrorMode:(int64_t)a3 itemIDs:(id)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      v19 = -[SCWStubContainer _ckErrorCodeForErrorMode:](self, "_ckErrorCodeForErrorMode:", 1);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], v19, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v7 = -[SCWStubContainer _ckErrorCodeForErrorMode:](self, "_ckErrorCodeForErrorMode:", a3);
    v8 = *MEMORY[0x1E0C947D8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15++), (_QWORD)v21);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v13);
    }

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0C94940];
    v26 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v8, 2, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (int64_t)_ckErrorCodeForErrorMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 1;
  else
    return qword_1ABF365D0[a3 - 1];
}

- (int64_t)modifyZonesErrorMode
{
  return self->_modifyZonesErrorMode;
}

- (void)setModifyZonesErrorMode:(int64_t)a3
{
  self->_modifyZonesErrorMode = a3;
}

- (unint64_t)modifyZonesOperationCount
{
  return self->_modifyZonesOperationCount;
}

- (NSArray)modifyZonesSavedZones
{
  return self->_modifyZonesSavedZones;
}

- (int64_t)zoneChangesErrorMode
{
  return self->_zoneChangesErrorMode;
}

- (void)setZoneChangesErrorMode:(int64_t)a3
{
  self->_zoneChangesErrorMode = a3;
}

- (id)willFinishZoneChanges
{
  return self->_willFinishZoneChanges;
}

- (void)setWillFinishZoneChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)zoneChangesOperationCount
{
  return self->_zoneChangesOperationCount;
}

- (int64_t)modifyRecordsErrorMode
{
  return self->_modifyRecordsErrorMode;
}

- (void)setModifyRecordsErrorMode:(int64_t)a3
{
  self->_modifyRecordsErrorMode = a3;
}

- (id)willModifyRecords
{
  return self->_willModifyRecords;
}

- (void)setWillModifyRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)modifyRecordsOperationCount
{
  return self->_modifyRecordsOperationCount;
}

- (NSArray)modifyRecordsSavedRecords
{
  return self->_modifyRecordsSavedRecords;
}

- (unint64_t)modifySubscriptionsOperationCount
{
  return self->_modifySubscriptionsOperationCount;
}

- (NSArray)modifySubscriptionsSavedSubscriptions
{
  return self->_modifySubscriptionsSavedSubscriptions;
}

- (unint64_t)databaseChangesOperationCount
{
  return self->_databaseChangesOperationCount;
}

- (NSArray)databaseChangesOperationChangedZoneIDs
{
  return self->_databaseChangesOperationChangedZoneIDs;
}

- (void)setDatabaseChangesOperationChangedZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)accountInfoSupportsDeviceToDeviceEncryption
{
  return self->_accountInfoSupportsDeviceToDeviceEncryption;
}

- (void)setAccountInfoSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_accountInfoSupportsDeviceToDeviceEncryption = a3;
}

- (int64_t)accountInfoErrorMode
{
  return self->_accountInfoErrorMode;
}

- (void)setAccountInfoErrorMode:(int64_t)a3
{
  self->_accountInfoErrorMode = a3;
}

- (NSMutableDictionary)zoneContentsByZoneID
{
  return self->_zoneContentsByZoneID;
}

- (void)setZoneContentsByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneContentsByZoneID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneContentsByZoneID, 0);
  objc_storeStrong((id *)&self->_databaseChangesOperationChangedZoneIDs, 0);
  objc_storeStrong((id *)&self->_modifySubscriptionsSavedSubscriptions, 0);
  objc_storeStrong((id *)&self->_modifyRecordsSavedRecords, 0);
  objc_storeStrong(&self->_willModifyRecords, 0);
  objc_storeStrong(&self->_willFinishZoneChanges, 0);
  objc_storeStrong((id *)&self->_modifyZonesSavedZones, 0);
}

@end
