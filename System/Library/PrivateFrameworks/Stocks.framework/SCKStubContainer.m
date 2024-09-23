@implementation SCKStubContainer

- (SCKStubContainer)init
{
  SCKStubContainer *v2;
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
  v12.super_class = (Class)SCKStubContainer;
  v2 = -[SCKStubContainer init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modifyZonesSavedZones = v2->_modifyZonesSavedZones;
    v2->_modifyZonesSavedZones = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modifyRecordsSavedRecords = v2->_modifyRecordsSavedRecords;
    v2->_modifyRecordsSavedRecords = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modifySubscriptionsSavedSubscriptions = v2->_modifySubscriptionsSavedSubscriptions;
    v2->_modifySubscriptionsSavedSubscriptions = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
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

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
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

  v16 = objc_alloc(MEMORY[0x24BDB91F8]);
  v17 = (void *)objc_msgSend(v16, "initWithZoneName:ownerName:", v6, *MEMORY[0x24BDB8E88]);
  -[SCKStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
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

  v4 = (objc_class *)MEMORY[0x24BDB91F8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v5, *MEMORY[0x24BDB8E88]);

  -[SCKStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
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
  -[SCKStubContainer contentsOfZone:](self, "contentsOfZone:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SCKStubContainer_contentsOfZone_withType___block_invoke;
  v12[3] = &unk_24D74B848;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44__SCKStubContainer_contentsOfZone_withType___block_invoke(uint64_t a1, void *a2)
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

  v6 = (objc_class *)MEMORY[0x24BDB91F8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithZoneName:ownerName:", v7, *MEMORY[0x24BDB8E88]);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v8, v10);
  -[SCKStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)addDatabaseOperation:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v18;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v31;
  void (**v32)(void);
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  void (**v36)(void);
  id v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v41;
  void *v42;
  NSArray *v43;
  NSArray *modifyZonesSavedZones;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSArray *v61;
  NSArray *modifySubscriptionsSavedSubscriptions;
  void *v63;
  void (**v64)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v65;
  void *v66;
  void *v67;
  uint64_t k;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t m;
  uint64_t v79;
  void *v80;
  void (**v81)(_QWORD, _QWORD);
  void *v82;
  void *v83;
  void (**v84)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v85;
  void (**v86)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t jj;
  uint64_t v95;
  void (**v96)(_QWORD, _QWORD);
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void (**v101)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t n;
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
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t ii;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  SCKStubContainer *v135;
  void *v136;
  void *v137;
  void (**v138)(void);
  void *v139;
  void (**v140)(_QWORD, _QWORD);
  void *v141;
  uint64_t v142;
  id v143;
  id v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void (**v149)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v150;
  id v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  void (**v156)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v157;
  id v158;
  id obj;
  void *v160;
  void *v161;
  id v162;
  id v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  SCKStubContainer *v168;
  void *v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[4];
  id v175;
  SCKStubContainer *v176;
  id v177;
  _QWORD v178[4];
  id v179;
  SCKStubContainer *v180;
  id v181;
  id v182;
  _QWORD v183[4];
  id v184;
  SCKStubContainer *v185;
  id v186;
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
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[128];
  uint64_t v212;
  id v213;
  void *v214;
  _BYTE v215[128];
  void *v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  uint64_t v222;

  v222 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_opt_class();
  v168 = self;
  if (v6 == objc_opt_class())
  {
    v157 = v5;
    v14 = v5;
    ++self->_modifyZonesOperationCount;
    if (-[SCKStubContainer modifyZonesErrorMode](self, "modifyZonesErrorMode"))
    {
      -[SCKStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", -[SCKStubContainer modifyZonesErrorMode](self, "modifyZonesErrorMode"));
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "modifyRecordZonesCompletionBlock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_44:

LABEL_45:
        goto LABEL_133;
      }
      objc_msgSend(v14, "modifyRecordZonesCompletionBlock");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0, 0, v15);
    }
    else
    {
      -[SCKStubContainer modifyZonesSavedZones](self, "modifyZonesSavedZones");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordZonesToSave");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "arrayByAddingObjectsFromArray:", v42);
      v43 = (NSArray *)objc_claimAutoreleasedReturnValue();
      modifyZonesSavedZones = self->_modifyZonesSavedZones;
      self->_modifyZonesSavedZones = v43;

      v209 = 0u;
      v210 = 0u;
      v207 = 0u;
      v208 = 0u;
      objc_msgSend(v14, "recordZonesToSave");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v207, v221, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v208;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v208 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * i);
            -[SCKStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "zoneID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v53)
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[SCKStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "zoneID");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, v56);

            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v207, v221, 16);
        }
        while (v47);
      }

      objc_msgSend(v14, "modifyRecordZonesCompletionBlock");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
        goto LABEL_45;
      objc_msgSend(v14, "modifyRecordZonesCompletionBlock");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordZonesToSave");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordZoneIDsToDelete");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, _QWORD))v15)[2](v15, v17, v58, 0);

    }
    goto LABEL_44;
  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v18 = v5;
    ++self->_zoneChangesOperationCount;
    if (-[SCKStubContainer zoneChangesErrorMode](self, "zoneChangesErrorMode"))
    {
      v19 = -[SCKStubContainer zoneChangesErrorMode](self, "zoneChangesErrorMode");
      objc_msgSend(v18, "recordZoneIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCKStubContainer _errorForErrorMode:itemIDs:](self, "_errorForErrorMode:itemIDs:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "code") == 2)
      {
        v22 = v5;
        v205 = 0u;
        v206 = 0u;
        v203 = 0u;
        v204 = 0u;
        objc_msgSend(v18, "recordZoneIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v203, v220, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v204;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v204 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * j);
              objc_msgSend(v18, "recordZoneFetchCompletionBlock");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                objc_msgSend(v18, "recordZoneFetchCompletionBlock");
                v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, void *))v30)[2](v30, v28, 0, 0, 0, v21);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v203, v220, 16);
          }
          while (v25);
        }

        v5 = v22;
      }
      -[SCKStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[SCKStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
        v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v32[2]();

      }
      objc_msgSend(v18, "fetchRecordZoneChangesCompletionBlock");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v18, "fetchRecordZoneChangesCompletionBlock");
        v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v34)[2](v34, v21);
        goto LABEL_116;
      }
      goto LABEL_117;
    }
    v158 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = 0u;
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    objc_msgSend(v18, "recordZoneIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
    if (!v164)
      goto LABEL_73;
    v160 = v21;
    v162 = *(id *)v200;
    while (1)
    {
      for (k = 0; k != v164; ++k)
      {
        if (*(id *)v200 != v162)
          objc_enumerationMutation(obj);
        v69 = *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * k);
        -[SCKStubContainer zoneContentsByZoneID](self, "zoneContentsByZoneID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKeyedSubscript:", v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v71)
        {
          objc_msgSend(v21, "addObject:", v69);
          -[SCKStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", 2);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "recordZoneFetchCompletionBlock");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v87)
            goto LABEL_71;
          objc_msgSend(v18, "recordZoneFetchCompletionBlock");
          v86 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, void *))v86)[2](v86, v69, 0, 0, 0, v83);
          goto LABEL_69;
        }
        v72 = objc_alloc(MEMORY[0x24BDB9228]);
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = objc_msgSend(v72, "initWithData:", v73);

        v197 = 0u;
        v198 = 0u;
        v195 = 0u;
        v196 = 0u;
        objc_msgSend(v71, "allValues");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v195, v218, 16);
        if (v75)
        {
          v76 = v75;
          v77 = *(_QWORD *)v196;
          do
          {
            for (m = 0; m != v76; ++m)
            {
              if (*(_QWORD *)v196 != v77)
                objc_enumerationMutation(v74);
              v79 = *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * m);
              objc_msgSend(v18, "recordChangedBlock");
              v80 = (void *)objc_claimAutoreleasedReturnValue();

              if (v80)
              {
                objc_msgSend(v18, "recordChangedBlock");
                v81 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                v81[2](v81, v79);

              }
            }
            v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v195, v218, 16);
          }
          while (v76);
        }

        objc_msgSend(v18, "recordZoneChangeTokensUpdatedBlock");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = (void *)v166;
        if (v82)
        {
          objc_msgSend(v18, "recordZoneChangeTokensUpdatedBlock");
          v84 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v84[2](v84, v69, v166, 0);

        }
        objc_msgSend(v18, "recordZoneFetchCompletionBlock");
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v160;
        if (v85)
        {
          objc_msgSend(v18, "recordZoneFetchCompletionBlock");
          v86 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v86[2](v86, v69, v166, 0, 0, 0);
          self = v168;
LABEL_69:

          goto LABEL_71;
        }
        self = v168;
LABEL_71:

      }
      v164 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
      if (!v164)
      {
LABEL_73:

        if (objc_msgSend(v21, "count"))
        {
          -[SCKStubContainer _errorForErrorMode:itemIDs:](self, "_errorForErrorMode:itemIDs:", 2, v21);
          v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = 0;
        }
        -[SCKStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
        v137 = (void *)objc_claimAutoreleasedReturnValue();

        if (v137)
        {
          -[SCKStubContainer willFinishZoneChanges](self, "willFinishZoneChanges");
          v138 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v138[2]();

        }
        objc_msgSend(v18, "fetchRecordZoneChangesCompletionBlock");
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v158;
        if (v139)
        {
          objc_msgSend(v18, "fetchRecordZoneChangesCompletionBlock");
          v140 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v140[2](v140, v34);

        }
LABEL_116:

LABEL_117:
LABEL_118:

        goto LABEL_134;
      }
    }
  }
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    -[SCKStubContainer willModifyRecords](self, "willModifyRecords");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[SCKStubContainer willModifyRecords](self, "willModifyRecords");
      v36 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v36[2]();

    }
    v157 = v5;
    v37 = v5;
    ++self->_modifyRecordsOperationCount;
    if (-[SCKStubContainer modifyRecordsErrorMode](self, "modifyRecordsErrorMode"))
    {
      -[SCKStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", -[SCKStubContainer modifyRecordsErrorMode](self, "modifyRecordsErrorMode"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "modifyRecordsCompletionBlock");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v37, "modifyRecordsCompletionBlock");
        v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v40)[2](v40, 0, 0, v38);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = 0u;
      v192 = 0u;
      v193 = 0u;
      v194 = 0u;
      v161 = v37;
      objc_msgSend(v37, "recordsToSave");
      v163 = (id)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v191, v217, 16);
      if (v103)
      {
        v104 = v103;
        v105 = *(_QWORD *)v192;
        do
        {
          for (n = 0; n != v104; ++n)
          {
            if (*(_QWORD *)v192 != v105)
              objc_enumerationMutation(v163);
            v107 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * n);
            objc_msgSend(v107, "recordID");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "zoneID");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v167, "objectForKeyedSubscript:", v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();

            if (v110)
            {
              objc_msgSend(v110, "arrayByAddingObject:", v107);
              v111 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v216 = v107;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v216, 1);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v107, "recordID");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "zoneID");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v167, "setObject:forKeyedSubscript:", v111, v113);

            -[SCKStubContainer zoneContentsByZoneID](v168, "zoneContentsByZoneID");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "recordID");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "zoneID");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "objectForKeyedSubscript:", v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v117)
            {
              objc_msgSend(v107, "recordID");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "zoneID");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "addObject:", v119);

            }
          }
          v104 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v191, v217, 16);
        }
        while (v104);
      }

      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      objc_msgSend(v161, "recordIDsToDelete");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v187, v215, 16);
      if (v121)
      {
        v122 = v121;
        v123 = *(_QWORD *)v188;
        do
        {
          for (ii = 0; ii != v122; ++ii)
          {
            if (*(_QWORD *)v188 != v123)
              objc_enumerationMutation(v120);
            v125 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * ii);
            objc_msgSend(v125, "zoneID");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "objectForKeyedSubscript:", v126);
            v127 = (void *)objc_claimAutoreleasedReturnValue();

            if (v127)
            {
              objc_msgSend(v127, "arrayByAddingObject:", v125);
              v128 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v214 = v125;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v214, 1);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v125, "zoneID");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "setObject:forKeyedSubscript:", v128, v129);

            -[SCKStubContainer zoneContentsByZoneID](v168, "zoneContentsByZoneID");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "zoneID");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "objectForKeyedSubscript:", v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v132)
            {
              objc_msgSend(v125, "zoneID");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "addObject:", v133);

            }
          }
          v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v187, v215, 16);
        }
        while (v122);
      }

      if (objc_msgSend(v165, "count"))
      {
        objc_msgSend(v165, "allObjects");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = v168;
        -[SCKStubContainer _errorForErrorMode:itemIDs:](v168, "_errorForErrorMode:itemIDs:", 2, v134);
        v136 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v136 = 0;
        v135 = v168;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = MEMORY[0x24BDAC760];
      v183[0] = MEMORY[0x24BDAC760];
      v183[1] = 3221225472;
      v183[2] = __41__SCKStubContainer_addDatabaseOperation___block_invoke;
      v183[3] = &unk_24D74CE88;
      v143 = v165;
      v184 = v143;
      v185 = v135;
      v144 = v141;
      v186 = v144;
      objc_msgSend(v167, "enumerateKeysAndObjectsUsingBlock:", v183);
      if (!v136)
      {
        if (objc_msgSend(v144, "count"))
        {
          v145 = (void *)MEMORY[0x24BDD1540];
          v146 = *MEMORY[0x24BDB8EA8];
          v212 = *MEMORY[0x24BDB8EE8];
          v213 = v144;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "errorWithDomain:code:userInfo:", v146, 2, v147);
          v136 = (void *)objc_claimAutoreleasedReturnValue();

          v135 = v168;
        }
        else
        {
          v136 = 0;
        }
      }
      if (objc_msgSend(v144, "count") && objc_msgSend(v161, "atomic"))
      {
        objc_msgSend(v161, "modifyRecordsCompletionBlock");
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        if (v148)
        {
          objc_msgSend(v161, "modifyRecordsCompletionBlock");
          v149 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, _QWORD, void *))v149)[2](v149, 0, 0, v136);

        }
        goto LABEL_133;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v178[0] = v142;
      v178[1] = 3221225472;
      v178[2] = __41__SCKStubContainer_addDatabaseOperation___block_invoke_2;
      v178[3] = &unk_24D74CEB0;
      v169 = v143;
      v151 = v143;
      v179 = v151;
      v180 = v135;
      v181 = v144;
      v37 = v161;
      v152 = v150;
      v182 = v152;
      objc_msgSend(v167, "enumerateKeysAndObjectsUsingBlock:", v178);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v174[0] = v142;
      v174[1] = 3221225472;
      v174[2] = __41__SCKStubContainer_addDatabaseOperation___block_invoke_3;
      v174[3] = &unk_24D74CE88;
      v175 = v151;
      v176 = v135;
      v154 = v153;
      v177 = v154;
      objc_msgSend(v102, "enumerateKeysAndObjectsUsingBlock:", v174);
      objc_msgSend(v161, "modifyRecordsCompletionBlock");
      v155 = (void *)objc_claimAutoreleasedReturnValue();

      if (v155)
      {
        objc_msgSend(v161, "modifyRecordsCompletionBlock");
        v156 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id, void *))v156)[2](v156, v152, v154, v136);

      }
    }

LABEL_133:
    v5 = v157;
    goto LABEL_134;
  }
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    v18 = v5;
    ++self->_modifySubscriptionsOperationCount;
    -[SCKStubContainer modifySubscriptionsSavedSubscriptions](self, "modifySubscriptionsSavedSubscriptions");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subscriptionsToSave");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "arrayByAddingObjectsFromArray:", v60);
    v61 = (NSArray *)objc_claimAutoreleasedReturnValue();
    modifySubscriptionsSavedSubscriptions = self->_modifySubscriptionsSavedSubscriptions;
    self->_modifySubscriptionsSavedSubscriptions = v61;

    objc_msgSend(v18, "modifySubscriptionsCompletionBlock");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v18, "modifySubscriptionsCompletionBlock");
      v64 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subscriptionsToSave");
      v65 = v5;
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subscriptionIDsToDelete");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v64)[2](v64, v66, v67, 0);

      v5 = v65;
    }
    goto LABEL_118;
  }
  v10 = objc_opt_class();
  if (v10 == objc_opt_class())
  {
    v88 = v5;
    v89 = v5;
    ++self->_databaseChangesOperationCount;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    -[SCKStubContainer databaseChangesOperationChangedZoneIDs](self, "databaseChangesOperationChangedZoneIDs");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v170, v211, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v171;
      do
      {
        for (jj = 0; jj != v92; ++jj)
        {
          if (*(_QWORD *)v171 != v93)
            objc_enumerationMutation(v90);
          v95 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * jj);
          objc_msgSend(v89, "recordZoneWithIDChangedBlock");
          v96 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v96[2](v96, v95);

        }
        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v170, v211, 16);
      }
      while (v92);
    }

    v97 = objc_alloc(MEMORY[0x24BDB9228]);
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)objc_msgSend(v97, "initWithData:", v98);

    objc_msgSend(v89, "fetchDatabaseChangesCompletionBlock");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v89, "fetchDatabaseChangesCompletionBlock");
      v101 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD))v101)[2](v101, v99, 0, 0);

    }
    v5 = v88;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCKStubContainer.m"), 312, CFSTR("unknown operation class %@"), v13);

  }
LABEL_134:

}

void __41__SCKStubContainer_addDatabaseOperation___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v39 = *MEMORY[0x24BDAC8D0];
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
    v28 = *MEMORY[0x24BDB8F08];
    v27 = *MEMORY[0x24BDB8F10];
    v26 = *MEMORY[0x24BDB8EA8];
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
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v26, 14, v21);
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

void __41__SCKStubContainer_addDatabaseOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

  v29 = *MEMORY[0x24BDAC8D0];
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

void __41__SCKStubContainer_addDatabaseOperation___block_invoke_3(id *a1, void *a2, void *a3)
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

  v20 = *MEMORY[0x24BDAC8D0];
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
  if (-[SCKStubContainer accountInfoErrorMode](self, "accountInfoErrorMode"))
  {
    -[SCKStubContainer _errorForErrorMode:](self, "_errorForErrorMode:", -[SCKStubContainer accountInfoErrorMode](self, "accountInfoErrorMode"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDB8FF0]);
    objc_msgSend(v5, "setAccountStatus:", 1);
    objc_msgSend(v5, "setAccountPartition:", 1);
    objc_msgSend(v5, "setHasValidCredentials:", 1);
    objc_msgSend(v5, "setHasEncryptionIdentity:", 1);
    objc_msgSend(v5, "setSupportsDeviceToDeviceEncryption:", -[SCKStubContainer accountInfoSupportsDeviceToDeviceEncryption](self, "accountInfoSupportsDeviceToDeviceEncryption"));
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
  v5 = -[SCKStubContainer _ckErrorCodeForErrorMode:](self, "_ckErrorCodeForErrorMode:", v3, v4);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], v5, 0);
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

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      v19 = -[SCKStubContainer _ckErrorCodeForErrorMode:](self, "_ckErrorCodeForErrorMode:", 1);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], v19, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v7 = -[SCKStubContainer _ckErrorCodeForErrorMode:](self, "_ckErrorCodeForErrorMode:", a3);
    v8 = *MEMORY[0x24BDB8EA8];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
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

    v16 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDB8EE8];
    v26 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v8, 2, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (int64_t)_ckErrorCodeForErrorMode:(int64_t)a3
{
  void *v5;

  if (a3 == 3)
    return 21;
  if (a3 == 2)
    return 26;
  if (a3)
    return 4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCKStubContainer.m"), 393, CFSTR("can't convert no error to a ck error code"));

  return 1;
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
