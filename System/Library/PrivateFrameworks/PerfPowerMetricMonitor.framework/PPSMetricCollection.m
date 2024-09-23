@implementation PPSMetricCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken != -1)
    dispatch_once(&allPropertyKeys_onceToken, &__block_literal_global_2);
  return (id)allPropertyKeys_keys;
}

void __38__PPSMetricCollection_allPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  +[PPSMetricCollection _metricSamplePropertyKeys](PPSMetricCollection, "_metricSamplePropertyKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("isSystemPowerAvailableWhileCharging");
  v6[1] = CFSTR("thermalPressure");
  v6[2] = CFSTR("inducedThermalPressure");
  v6[3] = CFSTR("sampleTime");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setByAddingObjectsFromSet:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)allPropertyKeys_keys;
  allPropertyKeys_keys = v4;

}

+ (id)_metricSamplePropertyKeys
{
  if (_metricSamplePropertyKeys_onceToken != -1)
    dispatch_once(&_metricSamplePropertyKeys_onceToken, &__block_literal_global_12);
  return (id)_metricSamplePropertyKeys_keys;
}

void __48__PPSMetricCollection__metricSamplePropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25141D0D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_metricSamplePropertyKeys_keys;
  _metricSamplePropertyKeys_keys = v0;

}

- (PPSMetricCollection)init
{
  PPSMetricCollection *v2;
  uint64_t v3;
  NSMutableDictionary *processMetrics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSMetricCollection;
  v2 = -[PPSMetricCollection init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    processMetrics = v2->_processMetrics;
    v2->_processMetrics = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (PPSMetricCollection)initWithCoder:(id)a3
{
  id v4;
  PPSMetricCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSNumber *sampleTime;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *processMetrics;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PPSMetricCollection;
  v5 = -[PPSMetricCollection init](&v28, sel_init);
  if (v5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    +[PPSMetricCollection _metricSamplePropertyKeys](PPSMetricCollection, "_metricSamplePropertyKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSMetricCollection setValue:forKey:](v5, "setValue:forKey:", v12, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isSystemPowerAvailableWhileCharging"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSystemPowerAvailableWhileCharging = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thermalPressure"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_thermalPressure = (int)objc_msgSend(v14, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inducedThermalPressure"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inducedThermalPressure = (int)objc_msgSend(v15, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sampleTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    sampleTime = v5->_sampleTime;
    v5->_sampleTime = (NSNumber *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v18, v19, CFSTR("processMetrics"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    processMetrics = v5->_processMetrics;
    v5->_processMetrics = (NSMutableDictionary *)v21;

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
  +[PPSMetricCollection _metricSamplePropertyKeys](PPSMetricCollection, "_metricSamplePropertyKeys", 0);
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
        -[PPSMetricCollection valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PPSMetricCollection isSystemPowerAvailableWhileCharging](self, "isSystemPowerAvailableWhileCharging"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("isSystemPowerAvailableWhileCharging"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PPSMetricCollection thermalPressure](self, "thermalPressure"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("thermalPressure"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PPSMetricCollection inducedThermalPressure](self, "inducedThermalPressure"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("inducedThermalPressure"));

  -[PPSMetricCollection sampleTime](self, "sampleTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("sampleTime"));

  -[PPSMetricCollection processMetrics](self, "processMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("processMetrics"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PPSMetricCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *processMetrics;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = -[PPSMetricCollection init](+[PPSMetricCollection allocWithZone:](PPSMetricCollection, "allocWithZone:"), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[PPSMetricCollection _metricSamplePropertyKeys](PPSMetricCollection, "_metricSamplePropertyKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PPSMetricCollection valueForKey:](self, "valueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
        -[PPSMetricCollection setValue:forKey:](v5, "setValue:forKey:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v5->_isSystemPowerAvailableWhileCharging = self->_isSystemPowerAvailableWhileCharging;
  v5->_thermalPressure = self->_thermalPressure;
  v5->_inducedThermalPressure = self->_inducedThermalPressure;
  objc_storeStrong((id *)&v5->_sampleTime, self->_sampleTime);
  v14 = -[NSMutableDictionary copyWithZone:](self->_processMetrics, "copyWithZone:", a3);
  processMetrics = v5->_processMetrics;
  v5->_processMetrics = (NSMutableDictionary *)v14;

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
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
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
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[5];
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;

  v128 = 0;
  v129 = &v128;
  v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__0;
  v132 = __Block_byref_object_dispose__0;
  v133 = 0;
  v55 = (void *)MEMORY[0x24BDD17C8];
  -[PPSMetricCollection systemLoadPower](self, "systemLoadPower");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "value");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "doubleValue");
  v54 = v3;
  -[PPSMetricCollection systemLoadPower](self, "systemLoadPower");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "timestamp");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v123);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection batteryPower](self, "batteryPower");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "value");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "doubleValue");
  v53 = v4;
  -[PPSMetricCollection batteryPower](self, "batteryPower");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "timestamp");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v119);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection dcInputPower](self, "dcInputPower");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "value");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "doubleValue");
  v52 = v5;
  -[PPSMetricCollection dcInputPower](self, "dcInputPower");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "timestamp");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v115);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection cpuPower](self, "cpuPower");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "value");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "doubleValue");
  v51 = v6;
  -[PPSMetricCollection cpuPower](self, "cpuPower");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "timestamp");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v111);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection gpuPower](self, "gpuPower");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "value");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "doubleValue");
  v50 = v7;
  -[PPSMetricCollection gpuPower](self, "gpuPower");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "timestamp");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v107);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection dramPower](self, "dramPower");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "value");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "doubleValue");
  v49 = v8;
  -[PPSMetricCollection dramPower](self, "dramPower");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "timestamp");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v103);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection otherSocPower](self, "otherSocPower");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "value");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "doubleValue");
  v48 = v9;
  -[PPSMetricCollection otherSocPower](self, "otherSocPower");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "timestamp");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v99);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection wifiPower](self, "wifiPower");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "value");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "doubleValue");
  v11 = v10;
  -[PPSMetricCollection wifiPower](self, "wifiPower");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "timestamp");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v95);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection cellularPower](self, "cellularPower");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "value");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "doubleValue");
  v13 = v12;
  -[PPSMetricCollection cellularPower](self, "cellularPower");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "timestamp");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v87);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection displayPower](self, "displayPower");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "value");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "doubleValue");
  v15 = v14;
  -[PPSMetricCollection displayPower](self, "displayPower");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "timestamp");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v83);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection chargingRate](self, "chargingRate");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "value");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v81, "intValue");
  -[PPSMetricCollection chargingRate](self, "chargingRate");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "timestamp");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v75);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetricCollection isSystemPowerAvailableWhileCharging](self, "isSystemPowerAvailableWhileCharging");
  v17 = "NO";
  if (v16)
    v17 = "YES";
  v46 = v17;
  -[PPSMetricCollection batteryTemperature](self, "batteryTemperature");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "value");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "doubleValue");
  v19 = v18;
  -[PPSMetricCollection batteryTemperature](self, "batteryTemperature");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "timestamp");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v71);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection skinTemperature](self, "skinTemperature");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "value");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "doubleValue");
  v21 = v20;
  -[PPSMetricCollection skinTemperature](self, "skinTemperature");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "timestamp");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v63);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection _stringFromThermalPressure:](self, "_stringFromThermalPressure:", -[PPSMetricCollection thermalPressure](self, "thermalPressure"));
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v45 = objc_msgSend(v43, "UTF8String");
  -[PPSMetricCollection _stringFromInducedThermalPressure:](self, "_stringFromInducedThermalPressure:", -[PPSMetricCollection inducedThermalPressure](self, "inducedThermalPressure"));
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v44 = objc_msgSend(v42, "UTF8String");
  -[PPSMetricCollection displayAPL](self, "displayAPL");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "value");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "doubleValue");
  v23 = v22;
  -[PPSMetricCollection displayAPL](self, "displayAPL");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "timestamp");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection displayCost](self, "displayCost");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  -[PPSMetricCollection displayCost](self, "displayCost");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timestamp");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricCollection displayFPS](self, "displayFPS");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "value");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;
  -[PPSMetricCollection displayFPS](self, "displayFPS");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timestamp");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  PPSTimeStringFromDate(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stringWithFormat:", CFSTR("------------------ Power -------------------\nSystem Load        %8.3f W   %@\nBattery            %8.3f W   %@\nDC Input           %8.3f W   %@\n\nCPU                %8.3f W   %@\nGPU                %8.3f W   %@\nDRAM               %8.3f W   %@\nOther SoC          %8.3f W   %@\nWiFi               %8.3f W   %@\nCellular           %8.3f W   %@\nDisplay            %8.3f W   %@\n\nCharging Rate      %8d mA  %@\n\nSystem Power Available While Charging: %s\n\n----------------- Thermal ------------------\nBattery            %8.3f °C  %@\nSkin               %8.3f °C  %@\n\nThermal Pressure   %8s\nInduced Pressure   %8s\n\n----------------- Display ------------------\nDisplay APL        %8.3f     %@\nDisplay Cost       %8.3f     %@\nDisplay Avg FPS    %8.3f     %@"), v54, v93, v53, v91, v52, v90, v51, v89, v50, v80, v49, v79, v48, v77, v11, v76,
    v13,
    v68,
    v15,
    v67,
    v47,
    v65,
    v46,
    v19,
    v64,
    v21,
    v59,
    v45,
    v44,
    v23,
    v57,
    v26,
    v29,
    v33,
    v36);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v129[5];
  v129[5] = v37;

  -[PPSMetricCollection processMetrics](self, "processMetrics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = MEMORY[0x24BDAC760];
  v127[1] = 3221225472;
  v127[2] = __34__PPSMetricCollection_description__block_invoke;
  v127[3] = &unk_251419DC0;
  v127[4] = &v128;
  objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v127);

  v40 = (id)v129[5];
  _Block_object_dispose(&v128, 8);

  return v40;
}

void __34__PPSMetricCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n\n-------------- Process %-5d ---------------\n%@"), objc_msgSend(a2, "intValue"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)combineWithMetricCollection:(id)a3
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
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  void *v219;
  id v220;

  v220 = a3;
  objc_msgSend(v220, "sampleTime");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PPSMetricCollection sampleTime](self, "sampleTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v220, "sampleTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      -[PPSMetricCollection sampleTime](self, "sampleTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      objc_msgSend(v7, "numberWithDouble:", v10 + v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setSampleTime:](self, "setSampleTime:", v13);

    }
  }
  objc_msgSend(v220, "cpuEnergy");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[PPSMetricCollection cpuEnergy](self, "cpuEnergy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection cpuEnergy](self, "cpuEnergy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;
      objc_msgSend(v220, "cpuEnergy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      objc_msgSend(v17, "numberWithDouble:", v20 + v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection cpuEnergy](self, "cpuEnergy");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timestamp");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setCpuEnergy:](self, "setCpuEnergy:", v26);

    }
  }
  objc_msgSend(v220, "gpuEnergy");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PPSMetricCollection gpuEnergy](self, "gpuEnergy");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection gpuEnergy](self, "gpuEnergy");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;
      objc_msgSend(v220, "gpuEnergy");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      objc_msgSend(v30, "numberWithDouble:", v33 + v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection gpuEnergy](self, "gpuEnergy");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timestamp");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v36, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setGpuEnergy:](self, "setGpuEnergy:", v39);

    }
  }
  objc_msgSend(v220, "gpuSRAMEnergy");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[PPSMetricCollection gpuSRAMEnergy](self, "gpuSRAMEnergy");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection gpuSRAMEnergy](self, "gpuSRAMEnergy");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v46 = v45;
      objc_msgSend(v220, "gpuSRAMEnergy");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doubleValue");
      objc_msgSend(v43, "numberWithDouble:", v46 + v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection gpuSRAMEnergy](self, "gpuSRAMEnergy");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "timestamp");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v49, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setGpuSRAMEnergy:](self, "setGpuSRAMEnergy:", v52);

    }
  }
  objc_msgSend(v220, "aneEnergy");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PPSMetricCollection aneEnergy](self, "aneEnergy");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      v56 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection aneEnergy](self, "aneEnergy");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      v59 = v58;
      objc_msgSend(v220, "aneEnergy");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "doubleValue");
      objc_msgSend(v56, "numberWithDouble:", v59 + v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection aneEnergy](self, "aneEnergy");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "timestamp");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v62, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setAneEnergy:](self, "setAneEnergy:", v65);

    }
  }
  objc_msgSend(v220, "dcsEnergy");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    -[PPSMetricCollection dcsEnergy](self, "dcsEnergy");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection dcsEnergy](self, "dcsEnergy");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "doubleValue");
      v72 = v71;
      objc_msgSend(v220, "dcsEnergy");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      objc_msgSend(v69, "numberWithDouble:", v72 + v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection dcsEnergy](self, "dcsEnergy");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "timestamp");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v75, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDcsEnergy:](self, "setDcsEnergy:", v78);

    }
  }
  objc_msgSend(v220, "dramEnergy");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    -[PPSMetricCollection dramEnergy](self, "dramEnergy");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      v82 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection dramEnergy](self, "dramEnergy");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "doubleValue");
      v85 = v84;
      objc_msgSend(v220, "dramEnergy");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "doubleValue");
      objc_msgSend(v82, "numberWithDouble:", v85 + v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection dramEnergy](self, "dramEnergy");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "timestamp");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v88, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDramEnergy:](self, "setDramEnergy:", v91);

    }
  }
  objc_msgSend(v220, "pcieEnergy");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[PPSMetricCollection pcieEnergy](self, "pcieEnergy");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      v95 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection pcieEnergy](self, "pcieEnergy");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "doubleValue");
      v98 = v97;
      objc_msgSend(v220, "pcieEnergy");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "doubleValue");
      objc_msgSend(v95, "numberWithDouble:", v98 + v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection pcieEnergy](self, "pcieEnergy");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "timestamp");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v101, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setPcieEnergy:](self, "setPcieEnergy:", v104);

    }
  }
  objc_msgSend(v220, "dramBytes");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[PPSMetricCollection dramBytes](self, "dramBytes");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v107)
    {
      v108 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection dramBytes](self, "dramBytes");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "doubleValue");
      v111 = v110;
      objc_msgSend(v220, "dramBytes");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "doubleValue");
      objc_msgSend(v108, "numberWithDouble:", v111 + v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection dramBytes](self, "dramBytes");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "timestamp");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v114, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDramBytes:](self, "setDramBytes:", v117);

    }
  }
  objc_msgSend(v220, "aneDCSBytes");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[PPSMetricCollection aneDCSBytes](self, "aneDCSBytes");
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    if (v120)
    {
      v121 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection aneDCSBytes](self, "aneDCSBytes");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "doubleValue");
      v124 = v123;
      objc_msgSend(v220, "aneDCSBytes");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "doubleValue");
      objc_msgSend(v121, "numberWithDouble:", v124 + v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection aneDCSBytes](self, "aneDCSBytes");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "timestamp");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v127, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setAneDCSBytes:](self, "setAneDCSBytes:", v130);

    }
  }
  objc_msgSend(v220, "aneFabricBytes");
  v131 = objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    v132 = (void *)v131;
    -[PPSMetricCollection aneFabricBytes](self, "aneFabricBytes");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (v133)
    {
      v134 = (void *)MEMORY[0x24BDD16E0];
      -[PPSMetricCollection aneFabricBytes](self, "aneFabricBytes");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "doubleValue");
      v137 = v136;
      objc_msgSend(v220, "aneFabricBytes");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "doubleValue");
      objc_msgSend(v134, "numberWithDouble:", v137 + v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection aneFabricBytes](self, "aneFabricBytes");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "timestamp");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricSample sampleWithValue:timestamp:](PPSMetricSample, "sampleWithValue:timestamp:", v140, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setAneFabricBytes:](self, "setAneFabricBytes:", v143);

    }
  }
  objc_msgSend(v220, "systemLoadPower");
  v144 = objc_claimAutoreleasedReturnValue();
  if (v144)
  {
    v145 = (void *)v144;
    -[PPSMetricCollection systemLoadPower](self, "systemLoadPower");
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (v146)
    {
      objc_msgSend(v220, "systemLoadPower");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setSystemLoadPower:](self, "setSystemLoadPower:", v147);

    }
  }
  objc_msgSend(v220, "batteryPower");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    v149 = (void *)v148;
    -[PPSMetricCollection batteryPower](self, "batteryPower");
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (v150)
    {
      objc_msgSend(v220, "batteryPower");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setBatteryPower:](self, "setBatteryPower:", v151);

    }
  }
  objc_msgSend(v220, "dcInputPower");
  v152 = objc_claimAutoreleasedReturnValue();
  if (v152)
  {
    v153 = (void *)v152;
    -[PPSMetricCollection dcInputPower](self, "dcInputPower");
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      objc_msgSend(v220, "dcInputPower");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDcInputPower:](self, "setDcInputPower:", v155);

    }
  }
  objc_msgSend(v220, "cpuPower");
  v156 = objc_claimAutoreleasedReturnValue();
  if (v156)
  {
    v157 = (void *)v156;
    -[PPSMetricCollection cpuPower](self, "cpuPower");
    v158 = (void *)objc_claimAutoreleasedReturnValue();

    if (v158)
    {
      objc_msgSend(v220, "cpuPower");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setCpuPower:](self, "setCpuPower:", v159);

    }
  }
  objc_msgSend(v220, "gpuPower");
  v160 = objc_claimAutoreleasedReturnValue();
  if (v160)
  {
    v161 = (void *)v160;
    -[PPSMetricCollection gpuPower](self, "gpuPower");
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    if (v162)
    {
      objc_msgSend(v220, "gpuPower");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setGpuPower:](self, "setGpuPower:", v163);

    }
  }
  objc_msgSend(v220, "dramPower");
  v164 = objc_claimAutoreleasedReturnValue();
  if (v164)
  {
    v165 = (void *)v164;
    -[PPSMetricCollection dramPower](self, "dramPower");
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    if (v166)
    {
      objc_msgSend(v220, "dramPower");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDramPower:](self, "setDramPower:", v167);

    }
  }
  objc_msgSend(v220, "anePower");
  v168 = objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    v169 = (void *)v168;
    -[PPSMetricCollection anePower](self, "anePower");
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    if (v170)
    {
      objc_msgSend(v220, "anePower");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setAnePower:](self, "setAnePower:", v171);

    }
  }
  objc_msgSend(v220, "otherSocPower");
  v172 = objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    v173 = (void *)v172;
    -[PPSMetricCollection otherSocPower](self, "otherSocPower");
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    if (v174)
    {
      objc_msgSend(v220, "otherSocPower");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setOtherSocPower:](self, "setOtherSocPower:", v175);

    }
  }
  objc_msgSend(v220, "wifiPower");
  v176 = objc_claimAutoreleasedReturnValue();
  if (v176)
  {
    v177 = (void *)v176;
    -[PPSMetricCollection wifiPower](self, "wifiPower");
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    if (v178)
    {
      objc_msgSend(v220, "wifiPower");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setWifiPower:](self, "setWifiPower:", v179);

    }
  }
  objc_msgSend(v220, "cellularPower");
  v180 = objc_claimAutoreleasedReturnValue();
  if (v180)
  {
    v181 = (void *)v180;
    -[PPSMetricCollection cellularPower](self, "cellularPower");
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    if (v182)
    {
      objc_msgSend(v220, "cellularPower");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setCellularPower:](self, "setCellularPower:", v183);

    }
  }
  objc_msgSend(v220, "displayPower");
  v184 = objc_claimAutoreleasedReturnValue();
  if (v184)
  {
    v185 = (void *)v184;
    -[PPSMetricCollection displayPower](self, "displayPower");
    v186 = (void *)objc_claimAutoreleasedReturnValue();

    if (v186)
    {
      objc_msgSend(v220, "displayPower");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayPower:](self, "setDisplayPower:", v187);

    }
  }
  objc_msgSend(v220, "displayFPS");
  v188 = objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    v189 = (void *)v188;
    -[PPSMetricCollection displayFPS](self, "displayFPS");
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    if (v190)
    {
      objc_msgSend(v220, "displayFPS");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayFPS:](self, "setDisplayFPS:", v191);

    }
  }
  objc_msgSend(v220, "wifiAWDLStatus");
  v192 = objc_claimAutoreleasedReturnValue();
  if (v192)
  {
    v193 = (void *)v192;
    -[PPSMetricCollection wifiAWDLStatus](self, "wifiAWDLStatus");
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    if (v194)
    {
      objc_msgSend(v220, "wifiAWDLStatus");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setWifiAWDLStatus:](self, "setWifiAWDLStatus:", v195);

    }
  }
  objc_msgSend(v220, "wifiAWDLRange");
  v196 = objc_claimAutoreleasedReturnValue();
  if (v196)
  {
    v197 = (void *)v196;
    -[PPSMetricCollection wifiAWDLRange](self, "wifiAWDLRange");
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (v198)
    {
      objc_msgSend(v220, "wifiAWDLRange");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setWifiAWDLRange:](self, "setWifiAWDLRange:", v199);

    }
  }
  objc_msgSend(v220, "chargingRate");
  v200 = objc_claimAutoreleasedReturnValue();
  if (v200)
  {
    v201 = (void *)v200;
    -[PPSMetricCollection chargingRate](self, "chargingRate");
    v202 = (void *)objc_claimAutoreleasedReturnValue();

    if (v202)
    {
      objc_msgSend(v220, "chargingRate");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setChargingRate:](self, "setChargingRate:", v203);

    }
  }
  objc_msgSend(v220, "batteryTemperature");
  v204 = objc_claimAutoreleasedReturnValue();
  if (v204)
  {
    v205 = (void *)v204;
    -[PPSMetricCollection batteryTemperature](self, "batteryTemperature");
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    if (v206)
    {
      objc_msgSend(v220, "batteryTemperature");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setBatteryTemperature:](self, "setBatteryTemperature:", v207);

    }
  }
  objc_msgSend(v220, "skinTemperature");
  v208 = objc_claimAutoreleasedReturnValue();
  if (v208)
  {
    v209 = (void *)v208;
    -[PPSMetricCollection skinTemperature](self, "skinTemperature");
    v210 = (void *)objc_claimAutoreleasedReturnValue();

    if (v210)
    {
      objc_msgSend(v220, "skinTemperature");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setSkinTemperature:](self, "setSkinTemperature:", v211);

    }
  }
  objc_msgSend(v220, "displayAPL");
  v212 = objc_claimAutoreleasedReturnValue();
  if (v212)
  {
    v213 = (void *)v212;
    -[PPSMetricCollection displayAPL](self, "displayAPL");
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if (v214)
    {
      objc_msgSend(v220, "displayAPL");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayAPL:](self, "setDisplayAPL:", v215);

    }
  }
  objc_msgSend(v220, "displayCost");
  v216 = objc_claimAutoreleasedReturnValue();
  if (v216)
  {
    v217 = (void *)v216;
    -[PPSMetricCollection displayCost](self, "displayCost");
    v218 = (void *)objc_claimAutoreleasedReturnValue();

    if (v218)
    {
      objc_msgSend(v220, "displayCost");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricCollection setDisplayCost:](self, "setDisplayCost:", v219);

    }
  }
  -[PPSMetricCollection setIsSystemPowerAvailableWhileCharging:](self, "setIsSystemPowerAvailableWhileCharging:", objc_msgSend(v220, "isSystemPowerAvailableWhileCharging"));
  -[PPSMetricCollection setThermalPressure:](self, "setThermalPressure:", objc_msgSend(v220, "thermalPressure"));
  -[PPSMetricCollection setInducedThermalPressure:](self, "setInducedThermalPressure:", objc_msgSend(v220, "inducedThermalPressure"));

}

- (id)_stringFromThermalPressure:(int64_t)a3
{
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        return CFSTR("Heavy");
      case 40:
        return CFSTR("Trapping");
      case 50:
        return CFSTR("Sleeping");
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        return CFSTR("Nominal");
      case 10:
        return CFSTR("Light");
      case 20:
        return CFSTR("Moderate");
    }
  }
  return CFSTR("Unknown");
}

- (id)_stringFromInducedThermalPressure:(int64_t)a3
{
  if (a3 <= 9)
  {
    if (a3 == -1)
      return CFSTR("Not Set");
    if (!a3)
      return CFSTR("Nominal");
  }
  else
  {
    switch(a3)
    {
      case 10:
        return CFSTR("Light");
      case 20:
        return CFSTR("Moderate");
      case 30:
        return CFSTR("Heavy");
    }
  }
  return CFSTR("Unknown");
}

- (void)updateMetrics:(id)a3 forPid:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processMetrics, "setObject:forKeyedSubscript:", a3, a4);
}

- (PPSMetricSample)systemLoadPower
{
  return self->_systemLoadPower;
}

- (void)setSystemLoadPower:(id)a3
{
  objc_storeStrong((id *)&self->_systemLoadPower, a3);
}

- (PPSMetricSample)batteryPower
{
  return self->_batteryPower;
}

- (void)setBatteryPower:(id)a3
{
  objc_storeStrong((id *)&self->_batteryPower, a3);
}

- (PPSMetricSample)dcInputPower
{
  return self->_dcInputPower;
}

- (void)setDcInputPower:(id)a3
{
  objc_storeStrong((id *)&self->_dcInputPower, a3);
}

- (PPSMetricSample)cpuPower
{
  return self->_cpuPower;
}

- (void)setCpuPower:(id)a3
{
  objc_storeStrong((id *)&self->_cpuPower, a3);
}

- (PPSMetricSample)gpuPower
{
  return self->_gpuPower;
}

- (void)setGpuPower:(id)a3
{
  objc_storeStrong((id *)&self->_gpuPower, a3);
}

- (PPSMetricSample)dramPower
{
  return self->_dramPower;
}

- (void)setDramPower:(id)a3
{
  objc_storeStrong((id *)&self->_dramPower, a3);
}

- (PPSMetricSample)anePower
{
  return self->_anePower;
}

- (void)setAnePower:(id)a3
{
  objc_storeStrong((id *)&self->_anePower, a3);
}

- (PPSMetricSample)otherSocPower
{
  return self->_otherSocPower;
}

- (void)setOtherSocPower:(id)a3
{
  objc_storeStrong((id *)&self->_otherSocPower, a3);
}

- (PPSMetricSample)wifiPower
{
  return self->_wifiPower;
}

- (void)setWifiPower:(id)a3
{
  objc_storeStrong((id *)&self->_wifiPower, a3);
}

- (PPSMetricSample)cellularPower
{
  return self->_cellularPower;
}

- (void)setCellularPower:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPower, a3);
}

- (PPSMetricSample)displayPower
{
  return self->_displayPower;
}

- (void)setDisplayPower:(id)a3
{
  objc_storeStrong((id *)&self->_displayPower, a3);
}

- (PPSMetricSample)displayFPS
{
  return self->_displayFPS;
}

- (void)setDisplayFPS:(id)a3
{
  objc_storeStrong((id *)&self->_displayFPS, a3);
}

- (PPSMetricSample)wifiAWDLStatus
{
  return self->_wifiAWDLStatus;
}

- (void)setWifiAWDLStatus:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAWDLStatus, a3);
}

- (PPSMetricSample)wifiAWDLRange
{
  return self->_wifiAWDLRange;
}

- (void)setWifiAWDLRange:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAWDLRange, a3);
}

- (PPSMetricSample)chargingRate
{
  return self->_chargingRate;
}

- (void)setChargingRate:(id)a3
{
  objc_storeStrong((id *)&self->_chargingRate, a3);
}

- (BOOL)isSystemPowerAvailableWhileCharging
{
  return self->_isSystemPowerAvailableWhileCharging;
}

- (void)setIsSystemPowerAvailableWhileCharging:(BOOL)a3
{
  self->_isSystemPowerAvailableWhileCharging = a3;
}

- (PPSMetricSample)batteryTemperature
{
  return self->_batteryTemperature;
}

- (void)setBatteryTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_batteryTemperature, a3);
}

- (PPSMetricSample)skinTemperature
{
  return self->_skinTemperature;
}

- (void)setSkinTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_skinTemperature, a3);
}

- (int64_t)thermalPressure
{
  return self->_thermalPressure;
}

- (void)setThermalPressure:(int64_t)a3
{
  self->_thermalPressure = a3;
}

- (int64_t)inducedThermalPressure
{
  return self->_inducedThermalPressure;
}

- (void)setInducedThermalPressure:(int64_t)a3
{
  self->_inducedThermalPressure = a3;
}

- (PPSMetricSample)displayAPL
{
  return self->_displayAPL;
}

- (void)setDisplayAPL:(id)a3
{
  objc_storeStrong((id *)&self->_displayAPL, a3);
}

- (PPSMetricSample)displayCost
{
  return self->_displayCost;
}

- (void)setDisplayCost:(id)a3
{
  objc_storeStrong((id *)&self->_displayCost, a3);
}

- (NSMutableDictionary)processMetrics
{
  return self->_processMetrics;
}

- (void)setProcessMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_processMetrics, a3);
}

- (NSNumber)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(id)a3
{
  objc_storeStrong((id *)&self->_sampleTime, a3);
}

- (PPSMetricSample)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_cpuEnergy, a3);
}

- (PPSMetricSample)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_gpuEnergy, a3);
}

- (PPSMetricSample)gpuSRAMEnergy
{
  return self->_gpuSRAMEnergy;
}

- (void)setGpuSRAMEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_gpuSRAMEnergy, a3);
}

- (PPSMetricSample)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_aneEnergy, a3);
}

- (PPSMetricSample)dcsEnergy
{
  return self->_dcsEnergy;
}

- (void)setDcsEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_dcsEnergy, a3);
}

- (PPSMetricSample)dramEnergy
{
  return self->_dramEnergy;
}

- (void)setDramEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_dramEnergy, a3);
}

- (PPSMetricSample)pcieEnergy
{
  return self->_pcieEnergy;
}

- (void)setPcieEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_pcieEnergy, a3);
}

- (PPSMetricSample)dramBytes
{
  return self->_dramBytes;
}

- (void)setDramBytes:(id)a3
{
  objc_storeStrong((id *)&self->_dramBytes, a3);
}

- (PPSMetricSample)aneDCSBytes
{
  return self->_aneDCSBytes;
}

- (void)setAneDCSBytes:(id)a3
{
  objc_storeStrong((id *)&self->_aneDCSBytes, a3);
}

- (PPSMetricSample)aneFabricBytes
{
  return self->_aneFabricBytes;
}

- (void)setAneFabricBytes:(id)a3
{
  objc_storeStrong((id *)&self->_aneFabricBytes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneFabricBytes, 0);
  objc_storeStrong((id *)&self->_aneDCSBytes, 0);
  objc_storeStrong((id *)&self->_dramBytes, 0);
  objc_storeStrong((id *)&self->_pcieEnergy, 0);
  objc_storeStrong((id *)&self->_dramEnergy, 0);
  objc_storeStrong((id *)&self->_dcsEnergy, 0);
  objc_storeStrong((id *)&self->_aneEnergy, 0);
  objc_storeStrong((id *)&self->_gpuSRAMEnergy, 0);
  objc_storeStrong((id *)&self->_gpuEnergy, 0);
  objc_storeStrong((id *)&self->_cpuEnergy, 0);
  objc_storeStrong((id *)&self->_sampleTime, 0);
  objc_storeStrong((id *)&self->_processMetrics, 0);
  objc_storeStrong((id *)&self->_displayCost, 0);
  objc_storeStrong((id *)&self->_displayAPL, 0);
  objc_storeStrong((id *)&self->_skinTemperature, 0);
  objc_storeStrong((id *)&self->_batteryTemperature, 0);
  objc_storeStrong((id *)&self->_chargingRate, 0);
  objc_storeStrong((id *)&self->_wifiAWDLRange, 0);
  objc_storeStrong((id *)&self->_wifiAWDLStatus, 0);
  objc_storeStrong((id *)&self->_displayFPS, 0);
  objc_storeStrong((id *)&self->_displayPower, 0);
  objc_storeStrong((id *)&self->_cellularPower, 0);
  objc_storeStrong((id *)&self->_wifiPower, 0);
  objc_storeStrong((id *)&self->_otherSocPower, 0);
  objc_storeStrong((id *)&self->_anePower, 0);
  objc_storeStrong((id *)&self->_dramPower, 0);
  objc_storeStrong((id *)&self->_gpuPower, 0);
  objc_storeStrong((id *)&self->_cpuPower, 0);
  objc_storeStrong((id *)&self->_dcInputPower, 0);
  objc_storeStrong((id *)&self->_batteryPower, 0);
  objc_storeStrong((id *)&self->_systemLoadPower, 0);
}

@end
