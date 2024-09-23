@implementation VGExternalAccessoryState

- (void)_updateWithVehicleInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *displayName;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *mapsDisplayName;
  uint64_t v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *manufacturer;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *model;
  uint64_t v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *year;
  uint64_t v30;
  void *v31;
  void *v32;
  NSString *v33;
  NSString *colorHex;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  NSMeasurement *v43;
  NSMeasurement *maxEVRange;
  uint64_t v45;
  void *v46;
  void *v47;
  NSString *v48;
  NSString *consumptionArguments;
  uint64_t v50;
  void *v51;
  void *v52;
  NSString *v53;
  NSString *chargingArguments;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  NSNumber *v60;
  NSNumber *batteryCharge;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  id v67;
  void *v68;
  NSMeasurement *v69;
  NSMeasurement *minBatteryCapacity;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  id v76;
  void *v77;
  NSMeasurement *v78;
  NSMeasurement *currentBatteryCapacity;
  uint64_t v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  id v85;
  void *v86;
  NSMeasurement *v87;
  NSMeasurement *maxBatteryCapacity;
  uint64_t v89;
  void *v90;
  NSDictionary *powerByConnector;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  uint64_t v98;
  void *v99;
  double v100;
  double v101;
  id v102;
  id v103;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  VGExternalAccessoryState *v109;
  NSDictionary *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  char isKindOfClass;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSNumber *activeConnector;
  VGExternalAccessoryState *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDC7C40];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    displayName = self->_displayName;
    self->_displayName = v8;

  }
  v10 = *MEMORY[0x24BDC7C60];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSString *)objc_msgSend(v12, "copy");
    mapsDisplayName = self->_mapsDisplayName;
    self->_mapsDisplayName = v13;

  }
  v15 = *MEMORY[0x24BDC7C58];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSString *)objc_msgSend(v17, "copy");
    manufacturer = self->_manufacturer;
    self->_manufacturer = v18;

  }
  v20 = *MEMORY[0x24BDC7C80];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C80]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (NSString *)objc_msgSend(v22, "copy");
    model = self->_model;
    self->_model = v23;

  }
  v25 = *MEMORY[0x24BDC7CE0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7CE0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (NSString *)objc_msgSend(v27, "copy");
    year = self->_year;
    self->_year = v28;

  }
  v30 = *MEMORY[0x24BDC7CD8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7CD8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (NSString *)objc_msgSend(v32, "copy");
    colorHex = self->_colorHex;
    self->_colorHex = v33;

  }
  v35 = *MEMORY[0x24BDC7C70];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C70]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0x24BDD1000uLL;
  if (v36)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v39;

    v41 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (NSMeasurement *)objc_msgSend(v41, "initWithDoubleValue:unit:", v42, v40);
    maxEVRange = self->_maxEVRange;
    self->_maxEVRange = v43;

  }
  v45 = *MEMORY[0x24BDC7C30];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C30]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (NSString *)objc_msgSend(v47, "copy");
    consumptionArguments = self->_consumptionArguments;
    self->_consumptionArguments = v48;

  }
  v50 = *MEMORY[0x24BDC7C28];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C28]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (NSString *)objc_msgSend(v52, "copy");
    chargingArguments = self->_chargingArguments;
    self->_chargingArguments = v53;

  }
  v55 = *MEMORY[0x24BDC7C48];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C48]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v57, "doubleValue");
    objc_msgSend(v58, "numberWithDouble:", v59 / 100000.0);
    v60 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    batteryCharge = self->_batteryCharge;
    self->_batteryCharge = v60;

  }
  v62 = *MEMORY[0x24BDC7C78];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C78]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "doubleValue");
    v66 = v65 / 1000.0;

    v67 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (NSMeasurement *)objc_msgSend(v67, "initWithDoubleValue:unit:", v68, v66);
    minBatteryCapacity = self->_minBatteryCapacity;
    self->_minBatteryCapacity = v69;

  }
  v71 = *MEMORY[0x24BDC7C38];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C38]);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "doubleValue");
    v75 = v74 / 1000.0;

    v76 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (NSMeasurement *)objc_msgSend(v76, "initWithDoubleValue:unit:", v77, v75);
    currentBatteryCapacity = self->_currentBatteryCapacity;
    self->_currentBatteryCapacity = v78;

  }
  v80 = *MEMORY[0x24BDC7C68];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C68]);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v80);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "doubleValue");
    v84 = v83 / 1000.0;

    v85 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (NSMeasurement *)objc_msgSend(v85, "initWithDoubleValue:unit:", v86, v84);
    maxBatteryCapacity = self->_maxBatteryCapacity;
    self->_maxBatteryCapacity = v87;

  }
  v89 = *MEMORY[0x24BDC7CD0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7CD0]);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
    self->_supportedConnectors = (NSNumber *)(id)objc_msgSend(v4, "objectForKeyedSubscript:", v89);
  powerByConnector = self->_powerByConnector;
  if (powerByConnector)
    v92 = -[NSDictionary mutableCopy](powerByConnector, "mutableCopy");
  else
    v92 = objc_opt_new();
  v121 = self;
  v122 = (void *)v92;
  if (qword_253DA4228 != -1)
    dispatch_once(&qword_253DA4228, &__block_literal_global_2);
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v93 = (id)_MergedGlobals_2;
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v95; ++i)
      {
        if (*(_QWORD *)v124 != v96)
          objc_enumerationMutation(v93);
        v98 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v98, v121);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v99, "doubleValue");
          v101 = v100;
          v102 = v4;
          v103 = objc_alloc(*(Class *)(v37 + 1632));
          objc_msgSend(MEMORY[0x24BDD1938], "watts");
          v104 = v37;
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = (void *)objc_msgSend(v103, "initWithDoubleValue:unit:", v105, v101);
          objc_msgSend((id)_MergedGlobals_2, "objectForKeyedSubscript:", v98);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "setObject:forKeyedSubscript:", v106, v107);

          v4 = v102;
          v37 = v104;
        }

      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
    }
    while (v95);
  }

  v108 = objc_msgSend(v122, "copy");
  v109 = v121;
  v110 = v121->_powerByConnector;
  v121->_powerByConnector = (NSDictionary *)v108;

  v111 = *MEMORY[0x24BDC7C50];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C50]);
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    objc_msgSend(v4, "objectForKeyedSubscript:", v111);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v111);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v121->_isCharging = objc_msgSend(v116, "BOOLValue");

    }
  }
  v117 = *MEMORY[0x24BDC7C20];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC7C20], v121);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v117);
    v119 = objc_claimAutoreleasedReturnValue();
    activeConnector = v109->_activeConnector;
    v109->_activeConnector = (NSNumber *)v119;

  }
}

void __51__VGExternalAccessoryState__updateWithVehicleInfo___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDC7C90];
  v6[0] = *MEMORY[0x24BDC7C88];
  v6[1] = v0;
  v7[0] = &unk_24C301C78;
  v7[1] = &unk_24C301C90;
  v1 = *MEMORY[0x24BDC7C98];
  v6[2] = *MEMORY[0x24BDC7CB0];
  v6[3] = v1;
  v7[2] = &unk_24C301CA8;
  v7[3] = &unk_24C301CC0;
  v2 = *MEMORY[0x24BDC7CA8];
  v6[4] = *MEMORY[0x24BDC7CB8];
  v6[5] = v2;
  v7[4] = &unk_24C301CD8;
  v7[5] = &unk_24C301CF0;
  v3 = *MEMORY[0x24BDC7CC8];
  v6[6] = *MEMORY[0x24BDC7CA0];
  v6[7] = v3;
  v7[6] = &unk_24C301D08;
  v7[7] = &unk_24C301D20;
  v6[8] = *MEMORY[0x24BDC7CC0];
  v7[8] = &unk_24C301D38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = v4;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, _displayName=%@, _mapsDisplayName=%@>"), v5, self, self->_displayName, self->_mapsDisplayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  NSString *displayName;

  displayName = self->_displayName;
  if (!displayName)
    displayName = self->_mapsDisplayName;
  return displayName;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)year
{
  return self->_year;
}

- (void)setYear:(id)a3
{
  objc_storeStrong((id *)&self->_year, a3);
}

- (NSString)colorHex
{
  return self->_colorHex;
}

- (void)setColorHex:(id)a3
{
  objc_storeStrong((id *)&self->_colorHex, a3);
}

- (NSMeasurement)currentEVRange
{
  return self->_currentEVRange;
}

- (void)setCurrentEVRange:(id)a3
{
  objc_storeStrong((id *)&self->_currentEVRange, a3);
}

- (NSMeasurement)maxEVRange
{
  return self->_maxEVRange;
}

- (void)setMaxEVRange:(id)a3
{
  objc_storeStrong((id *)&self->_maxEVRange, a3);
}

- (NSString)consumptionArguments
{
  return self->_consumptionArguments;
}

- (void)setConsumptionArguments:(id)a3
{
  objc_storeStrong((id *)&self->_consumptionArguments, a3);
}

- (NSString)chargingArguments
{
  return self->_chargingArguments;
}

- (void)setChargingArguments:(id)a3
{
  objc_storeStrong((id *)&self->_chargingArguments, a3);
}

- (NSNumber)batteryCharge
{
  return self->_batteryCharge;
}

- (void)setBatteryCharge:(id)a3
{
  objc_storeStrong((id *)&self->_batteryCharge, a3);
}

- (NSMeasurement)minBatteryCapacity
{
  return self->_minBatteryCapacity;
}

- (void)setMinBatteryCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_minBatteryCapacity, a3);
}

- (NSMeasurement)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (void)setCurrentBatteryCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_currentBatteryCapacity, a3);
}

- (NSMeasurement)maxBatteryCapacity
{
  return self->_maxBatteryCapacity;
}

- (void)setMaxBatteryCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_maxBatteryCapacity, a3);
}

- (NSNumber)supportedConnectors
{
  return self->_supportedConnectors;
}

- (void)setSupportedConnectors:(id)a3
{
  self->_supportedConnectors = (NSNumber *)a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (NSNumber)activeConnector
{
  return self->_activeConnector;
}

- (NSDictionary)powerByConnector
{
  return self->_powerByConnector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerByConnector, 0);
  objc_storeStrong((id *)&self->_activeConnector, 0);
  objc_storeStrong((id *)&self->_maxBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_currentBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_minBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_batteryCharge, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_maxEVRange, 0);
  objc_storeStrong((id *)&self->_currentEVRange, 0);
  objc_storeStrong((id *)&self->_colorHex, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
