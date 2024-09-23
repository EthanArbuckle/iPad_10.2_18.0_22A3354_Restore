@implementation PPSProcessMetricCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_metricSamplePropertyKeys
{
  if (_metricSamplePropertyKeys_onceToken_0 != -1)
    dispatch_once(&_metricSamplePropertyKeys_onceToken_0, &__block_literal_global_3);
  return (id)_metricSamplePropertyKeys_keys_0;
}

void __55__PPSProcessMetricCollection__metricSamplePropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25141D0F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_metricSamplePropertyKeys_keys_0;
  _metricSamplePropertyKeys_keys_0 = v0;

}

- (PPSProcessMetricCollection)initWithCoder:(id)a3
{
  id v4;
  PPSProcessMetricCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *coalitionID;
  uint64_t v16;
  NSString *processName;
  uint64_t v18;
  NSString *bundleID;
  uint64_t v20;
  NSNumber *sampleTime;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PPSProcessMetricCollection;
  v5 = -[PPSProcessMetricCollection init](&v27, sel_init);
  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[PPSProcessMetricCollection _metricSamplePropertyKeys](PPSProcessMetricCollection, "_metricSamplePropertyKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSProcessMetricCollection setValue:forKey:](v5, "setValue:forKey:", v12, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__pid__"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v13, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__coalitionID__"));
    v14 = objc_claimAutoreleasedReturnValue();
    coalitionID = v5->_coalitionID;
    v5->_coalitionID = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__processName__"));
    v16 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__bundleID__"));
    v18 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__sampleTime__"));
    v20 = objc_claimAutoreleasedReturnValue();
    sampleTime = v5->_sampleTime;
    v5->_sampleTime = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[PPSProcessMetricCollection _metricSamplePropertyKeys](PPSProcessMetricCollection, "_metricSamplePropertyKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PPSProcessMetricCollection valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PPSProcessMetricCollection pid](self, "pid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("__pid__"));

  -[PPSProcessMetricCollection coalitionID](self, "coalitionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("__coalitionID__"));

  -[PPSProcessMetricCollection processName](self, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("__processName__"));

  -[PPSProcessMetricCollection bundleID](self, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("__bundleID__"));

  -[PPSProcessMetricCollection sampleTime](self, "sampleTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("__sampleTime__"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PPSProcessMetricCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(PPSProcessMetricCollection);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[PPSProcessMetricCollection _metricSamplePropertyKeys](PPSProcessMetricCollection, "_metricSamplePropertyKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PPSProcessMetricCollection valueForKey:](self, "valueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
        -[PPSProcessMetricCollection setValue:forKey:](v5, "setValue:forKey:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v5->_pid = self->_pid;
  objc_storeStrong((id *)&v5->_processName, self->_processName);
  objc_storeStrong((id *)&v5->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v5->_sampleTime, self->_sampleTime);
  return v5;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;

  v57 = (id)MEMORY[0x24BDD17C8];
  -[PPSProcessMetricCollection energyCost](self, "energyCost");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "value");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "doubleValue");
  v4 = v3;
  -[PPSProcessMetricCollection energyCost](self, "energyCost");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "timestamp");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v76);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection energyOverhead](self, "energyOverhead");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "value");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "doubleValue");
  v6 = v5;
  -[PPSProcessMetricCollection energyOverhead](self, "energyOverhead");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "timestamp");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v72);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection cpuCost](self, "cpuCost");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "value");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "doubleValue");
  v8 = v7;
  -[PPSProcessMetricCollection cpuCost](self, "cpuCost");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "timestamp");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v68);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection cpuSeconds](self, "cpuSeconds");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "value");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "doubleValue");
  v10 = v9;
  -[PPSProcessMetricCollection cpuSeconds](self, "cpuSeconds");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "timestamp");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v64);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection gpuCost](self, "gpuCost");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "value");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "doubleValue");
  v12 = v11;
  -[PPSProcessMetricCollection gpuCost](self, "gpuCost");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "timestamp");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v60);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection networkCost](self, "networkCost");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "value");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v56, "intValue");
  -[PPSProcessMetricCollection networkCost](self, "networkCost");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "timestamp");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v54);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "value");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v52, "intValue");
  -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "timestamp");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v50);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "value");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v48, "intValue");
  -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "timestamp");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v46);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection cellIn](self, "cellIn");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "value");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v44, "intValue");
  -[PPSProcessMetricCollection cellIn](self, "cellIn");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "timestamp");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection cellOut](self, "cellOut");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "value");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v39, "intValue");
  -[PPSProcessMetricCollection cellOut](self, "cellOut");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timestamp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection locationCost](self, "locationCost");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "value");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v14 = v13;
  -[PPSProcessMetricCollection locationCost](self, "locationCost");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection ongoingLocation](self, "ongoingLocation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "value");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "BOOLValue"))
    v16 = "YES";
  else
    v16 = "NO";
  -[PPSProcessMetricCollection ongoingLocation](self, "ongoingLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection applicationState](self, "applicationState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSProcessMetricCollection applicationState](self, "applicationState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringWithFormat:", CFSTR("Energy Cost        %8.3f     %@\nEnergy Overhead    %8.3f     %@\nCPU Cost           %8.3f     %@\nCPU Seconds        %8.3f s   %@\nGPU Cost           %8.3f     %@\nNetwork Cost       %8d     %@\nWiFi In            %8d B   %@\nWiFi Out           %8d B   %@\nCell In            %8d B   %@\nCell Out           %8d B   %@\nLocation Cost      %8.3f     %@\nOngoing Location   %8s     %@\nApplication State               %@\n%29s"), v4, v87, v6, v86, v8, v85, v10, v84, v12, v83, v42, v82, v38, v81, v35, v80,
    v31,
    v29,
    v26,
    v25,
    v14,
    v15,
    v16,
    v19,
    v22,
    -[PPSProcessMetricCollection _stringForApplicationState:](self, "_stringForApplicationState:", objc_msgSend(v23, "intValue")));
  v58 = (id)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (void)combineWithProcessMetricCollection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;

  v157 = a3;
  objc_msgSend(v157, "sampleTime");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PPSProcessMetricCollection sampleTime](self, "sampleTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v157, "sampleTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      -[PPSProcessMetricCollection sampleTime](self, "sampleTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      objc_msgSend(v7, "numberWithDouble:", v10 + v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setSampleTime:](self, "setSampleTime:", v13);

    }
  }
  objc_msgSend(v157, "cpuInstructions");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[PPSProcessMetricCollection cpuInstructions](self, "cpuInstructions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection cpuInstructions](self, "cpuInstructions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;
      objc_msgSend(v157, "cpuInstructions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      objc_msgSend(v17, "numberWithDouble:", v20 + v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection cpuInstructions](self, "cpuInstructions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timestamp");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setCpuInstructions:](self, "setCpuInstructions:", v26);

    }
  }
  objc_msgSend(v157, "cpuPInstructions");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PPSProcessMetricCollection cpuPInstructions](self, "cpuPInstructions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection cpuPInstructions](self, "cpuPInstructions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;
      objc_msgSend(v157, "cpuPInstructions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      objc_msgSend(v30, "numberWithDouble:", v33 + v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection cpuPInstructions](self, "cpuPInstructions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timestamp");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v36, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setCpuPInstructions:](self, "setCpuPInstructions:", v39);

    }
  }
  objc_msgSend(v157, "wifiIn");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v46 = v45;
      objc_msgSend(v157, "wifiIn");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doubleValue");
      objc_msgSend(v43, "numberWithDouble:", v46 + v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection wifiIn](self, "wifiIn");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "timestamp");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v49, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setWifiIn:](self, "setWifiIn:", v52);

    }
  }
  objc_msgSend(v157, "wifiOut");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      v56 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      v59 = v58;
      objc_msgSend(v157, "wifiOut");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "doubleValue");
      objc_msgSend(v56, "numberWithDouble:", v59 + v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection wifiOut](self, "wifiOut");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "timestamp");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v62, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setWifiOut:](self, "setWifiOut:", v65);

    }
  }
  objc_msgSend(v157, "cellIn");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    -[PPSProcessMetricCollection cellIn](self, "cellIn");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection cellIn](self, "cellIn");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "doubleValue");
      v72 = v71;
      objc_msgSend(v157, "cellIn");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      objc_msgSend(v69, "numberWithDouble:", v72 + v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection cellIn](self, "cellIn");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "timestamp");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v75, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setCellIn:](self, "setCellIn:", v78);

    }
  }
  objc_msgSend(v157, "cellOut");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    -[PPSProcessMetricCollection cellOut](self, "cellOut");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      v82 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection cellOut](self, "cellOut");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "doubleValue");
      v85 = v84;
      objc_msgSend(v157, "cellOut");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "doubleValue");
      objc_msgSend(v82, "numberWithDouble:", v85 + v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection cellOut](self, "cellOut");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "timestamp");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v88, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setCellOut:](self, "setCellOut:", v91);

    }
  }
  objc_msgSend(v157, "bytesRead");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[PPSProcessMetricCollection bytesRead](self, "bytesRead");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      v95 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection bytesRead](self, "bytesRead");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "doubleValue");
      v98 = v97;
      objc_msgSend(v157, "bytesRead");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "doubleValue");
      objc_msgSend(v95, "numberWithDouble:", v98 + v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection bytesRead](self, "bytesRead");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "timestamp");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v101, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setBytesRead:](self, "setBytesRead:", v104);

    }
  }
  objc_msgSend(v157, "bytesWritten");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[PPSProcessMetricCollection bytesWritten](self, "bytesWritten");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v107)
    {
      v108 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection bytesWritten](self, "bytesWritten");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "doubleValue");
      v111 = v110;
      objc_msgSend(v157, "bytesWritten");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "doubleValue");
      objc_msgSend(v108, "numberWithDouble:", v111 + v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection bytesWritten](self, "bytesWritten");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "timestamp");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v114, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setBytesWritten:](self, "setBytesWritten:", v117);

    }
  }
  objc_msgSend(v157, "aneEnergy");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    if (v120)
    {
      v121 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "doubleValue");
      v124 = v123;
      objc_msgSend(v157, "aneEnergy");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "doubleValue");
      objc_msgSend(v121, "numberWithDouble:", v124 + v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "timestamp");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v127, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setAneEnergy:](self, "setAneEnergy:", v130);

    }
  }
  objc_msgSend(v157, "aneTime");
  v131 = objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    v132 = (void *)v131;
    -[PPSProcessMetricCollection aneEnergy](self, "aneEnergy");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (v133)
    {
      v134 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection aneTime](self, "aneTime");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "doubleValue");
      v137 = v136;
      objc_msgSend(v157, "aneTime");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "doubleValue");
      objc_msgSend(v134, "numberWithDouble:", v137 + v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection aneTime](self, "aneTime");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "timestamp");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v140, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setAneTime:](self, "setAneTime:", v143);

    }
  }
  objc_msgSend(v157, "gpuEnergy");
  v144 = objc_claimAutoreleasedReturnValue();
  if (v144)
  {
    v145 = (void *)v144;
    -[PPSProcessMetricCollection gpuEnergy](self, "gpuEnergy");
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (v146)
    {
      v147 = (void *)MEMORY[0x24BDD16E0];
      -[PPSProcessMetricCollection gpuEnergy](self, "gpuEnergy");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "doubleValue");
      v150 = v149;
      objc_msgSend(v157, "gpuEnergy");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "doubleValue");
      objc_msgSend(v147, "numberWithDouble:", v150 + v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection gpuEnergy](self, "gpuEnergy");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "timestamp");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v153, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSProcessMetricCollection setGpuEnergy:](self, "setGpuEnergy:", v156);

    }
  }

}

- (const)_stringForApplicationState:(unsigned int)a3
{
  id v3;
  const char *v4;

  if (a3 < 9 && ((0x117u >> a3) & 1) != 0)
    return (&off_251419E18)[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (PPSMetricSample)energyCost
{
  return self->_energyCost;
}

- (void)setEnergyCost:(id)a3
{
  objc_storeStrong((id *)&self->_energyCost, a3);
}

- (PPSMetricSample)energyOverhead
{
  return self->_energyOverhead;
}

- (void)setEnergyOverhead:(id)a3
{
  objc_storeStrong((id *)&self->_energyOverhead, a3);
}

- (PPSMetricSample)cpuCost
{
  return self->_cpuCost;
}

- (void)setCpuCost:(id)a3
{
  objc_storeStrong((id *)&self->_cpuCost, a3);
}

- (PPSMetricSample)cpuSeconds
{
  return self->_cpuSeconds;
}

- (void)setCpuSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_cpuSeconds, a3);
}

- (PPSMetricSample)gpuCost
{
  return self->_gpuCost;
}

- (void)setGpuCost:(id)a3
{
  objc_storeStrong((id *)&self->_gpuCost, a3);
}

- (PPSMetricSample)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(id)a3
{
  objc_storeStrong((id *)&self->_gpuTime, a3);
}

- (PPSMetricSample)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_gpuEnergy, a3);
}

- (PPSMetricSample)networkCost
{
  return self->_networkCost;
}

- (void)setNetworkCost:(id)a3
{
  objc_storeStrong((id *)&self->_networkCost, a3);
}

- (PPSMetricSample)wifiIn
{
  return self->_wifiIn;
}

- (void)setWifiIn:(id)a3
{
  objc_storeStrong((id *)&self->_wifiIn, a3);
}

- (PPSMetricSample)wifiOut
{
  return self->_wifiOut;
}

- (void)setWifiOut:(id)a3
{
  objc_storeStrong((id *)&self->_wifiOut, a3);
}

- (PPSMetricSample)cellIn
{
  return self->_cellIn;
}

- (void)setCellIn:(id)a3
{
  objc_storeStrong((id *)&self->_cellIn, a3);
}

- (PPSMetricSample)cellOut
{
  return self->_cellOut;
}

- (void)setCellOut:(id)a3
{
  objc_storeStrong((id *)&self->_cellOut, a3);
}

- (PPSMetricSample)locationCost
{
  return self->_locationCost;
}

- (void)setLocationCost:(id)a3
{
  objc_storeStrong((id *)&self->_locationCost, a3);
}

- (PPSMetricSample)ongoingLocation
{
  return self->_ongoingLocation;
}

- (void)setOngoingLocation:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingLocation, a3);
}

- (PPSMetricSample)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(id)a3
{
  objc_storeStrong((id *)&self->_applicationState, a3);
}

- (PPSMetricSample)cpuInstructions
{
  return self->_cpuInstructions;
}

- (void)setCpuInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_cpuInstructions, a3);
}

- (PPSMetricSample)cpuPInstructions
{
  return self->_cpuPInstructions;
}

- (void)setCpuPInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_cpuPInstructions, a3);
}

- (PPSMetricSample)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(id)a3
{
  objc_storeStrong((id *)&self->_bytesRead, a3);
}

- (PPSMetricSample)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(id)a3
{
  objc_storeStrong((id *)&self->_bytesWritten, a3);
}

- (PPSMetricSample)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_aneEnergy, a3);
}

- (PPSMetricSample)aneTime
{
  return self->_aneTime;
}

- (void)setAneTime:(id)a3
{
  objc_storeStrong((id *)&self->_aneTime, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSNumber)coalitionID
{
  return self->_coalitionID;
}

- (void)setCoalitionID:(id)a3
{
  objc_storeStrong((id *)&self->_coalitionID, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(id)a3
{
  objc_storeStrong((id *)&self->_sampleTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTime, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_coalitionID, 0);
  objc_storeStrong((id *)&self->_aneTime, 0);
  objc_storeStrong((id *)&self->_aneEnergy, 0);
  objc_storeStrong((id *)&self->_bytesWritten, 0);
  objc_storeStrong((id *)&self->_bytesRead, 0);
  objc_storeStrong((id *)&self->_cpuPInstructions, 0);
  objc_storeStrong((id *)&self->_cpuInstructions, 0);
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_ongoingLocation, 0);
  objc_storeStrong((id *)&self->_locationCost, 0);
  objc_storeStrong((id *)&self->_cellOut, 0);
  objc_storeStrong((id *)&self->_cellIn, 0);
  objc_storeStrong((id *)&self->_wifiOut, 0);
  objc_storeStrong((id *)&self->_wifiIn, 0);
  objc_storeStrong((id *)&self->_networkCost, 0);
  objc_storeStrong((id *)&self->_gpuEnergy, 0);
  objc_storeStrong((id *)&self->_gpuTime, 0);
  objc_storeStrong((id *)&self->_gpuCost, 0);
  objc_storeStrong((id *)&self->_cpuSeconds, 0);
  objc_storeStrong((id *)&self->_cpuCost, 0);
  objc_storeStrong((id *)&self->_energyOverhead, 0);
  objc_storeStrong((id *)&self->_energyCost, 0);
}

@end
