@implementation PLBatteryUIResponseTypeBatteryBreakdownBLD

- (void)populateBLDKeysWithEnergyEntries:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v60 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v74 != v62)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(&unk_1EA1DC8E0, "objectAtIndexedSubscript:", 15);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v72 = (void *)v7;
        if (v7)
          v8 = (void *)v7;
        else
          v8 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("BLDEnergyAudio"));
        objc_msgSend(&unk_1EA1DC8F8, "objectAtIndexedSubscript:", 50);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v71 = (void *)v10;
        if (v10)
          v11 = (void *)v10;
        else
          v11 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("BLDEnergyBluetooth"));
        objc_msgSend(&unk_1EA1DC910, "objectAtIndexedSubscript:", 37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v70 = (void *)v13;
        if (v13)
          v14 = (void *)v13;
        else
          v14 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("BLDEnergyCellData"));
        objc_msgSend(&unk_1EA1DC928, "objectAtIndexedSubscript:", 10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v69 = (void *)v16;
        if (v16)
          v17 = (void *)v16;
        else
          v17 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("BLDEnergyDisplay"));
        objc_msgSend(&unk_1EA1DC940, "objectAtIndexedSubscript:", 38);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v68 = (void *)v19;
        if (v19)
          v20 = (void *)v19;
        else
          v20 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("BLDEnergyVoice"));
        objc_msgSend(&unk_1EA1DC958, "objectAtIndexedSubscript:", 11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v67 = (void *)v22;
        if (v22)
          v23 = (void *)v22;
        else
          v23 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("BLDEnergyWiFi"));
        objc_msgSend(&unk_1EA1DC970, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v66 = (void *)v25;
        if (v25)
          v26 = (void *)v25;
        else
          v26 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("BBCondition"));
        v27 = (void *)objc_opt_class();
        objc_msgSend(&unk_1EA1DC988, "objectAtIndexedSubscript:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1EA1DC9A0, "objectAtIndexedSubscript:", 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v28, v29);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v65);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v30)
          v32 = (void *)v30;
        else
          v32 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("BLDEnergyFGCPU"));
        objc_msgSend(&unk_1EA1DC9B8, "objectAtIndexedSubscript:", 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          v35 = v34;
        else
          v35 = &unk_1EA1C1250;
        v36 = v35;

        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v36, "doubleValue");
        v39 = v38;
        objc_msgSend(v31, "doubleValue");
        v41 = v39 - v40;
        if (v41 < 0.0)
          v41 = 0.0;
        objc_msgSend(v37, "numberWithDouble:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("BLDEnergyBGCPU"));
        v43 = (void *)objc_opt_class();
        objc_msgSend(&unk_1EA1DC9D0, "objectAtIndexedSubscript:", 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1EA1DC9E8, "objectAtIndexedSubscript:", 48);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v46);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v47;
        if (v47)
          v49 = (void *)v47;
        else
          v49 = &unk_1EA1C1250;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("BLDEnergyFGLocation"));
        objc_msgSend(&unk_1EA1DCA00, "objectAtIndexedSubscript:", 48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
          v52 = v51;
        else
          v52 = &unk_1EA1C1250;
        v53 = v52;

        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v53, "doubleValue");
        v56 = v55;

        objc_msgSend(v48, "doubleValue");
        v58 = v56 - v57;
        if (v58 < 0.0)
          v58 = 0.0;
        objc_msgSend(v54, "numberWithDouble:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v59, CFSTR("BLDEnergyBGLocation"));
        objc_msgSend(v63, "addObject:", v5);

      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    }
    while (v64);
  }

  objc_msgSend(v60, "setObject:forKeyedSubscript:", v63, CFSTR("PLBatteryUIAppArrayKey"));
}

+ (id)rootNodeQualificationNameWithQualificationName:(id)a3 withRootNodeName:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, a4);
}

@end
