@implementation PLAccountingDistributionOwner

- (id)range
{
  void *v2;
  void *v3;

  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyEstimate, 0);
}

- (id)ID
{
  void *v2;
  void *v3;

  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distributionRuleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingDistributionOwner)initWithEnergyEstimate:(id)a3
{
  id v5;
  PLAccountingDistributionOwner *v6;
  PLAccountingDistributionOwner *v7;
  PLAccountingDistributionOwner *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLAccountingDistributionOwner;
    v6 = -[PLAccountingDistributionOwner init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_energyEstimate, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setRunDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDistributionDate:", v4);

}

- (void)distribute
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  double v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  uint64_t v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  int v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  uint64_t v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  PLAccountingEnergyEstimateEventEntry *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  uint64_t v158;
  int v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  NSObject *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  NSObject *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  id obj;
  uint64_t v190;
  void *v191;
  void *v192;
  id v193;
  PLAccountingDistributionOwner *v194;
  uint64_t v195;
  uint64_t v196;
  _QWORD v197[4];
  __CFString *v198;
  uint64_t v199;
  _QWORD v200[4];
  __CFString *v201;
  uint64_t v202;
  _QWORD v203[4];
  __CFString *v204;
  uint64_t v205;
  _QWORD v206[4];
  __CFString *v207;
  uint64_t v208;
  _QWORD block[4];
  __CFString *v210;
  uint64_t v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _QWORD v216[4];
  __CFString *v217;
  uint64_t v218;
  _QWORD v219[4];
  __CFString *v220;
  uint64_t v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  _QWORD v226[4];
  __CFString *v227;
  uint64_t v228;
  _QWORD v229[4];
  __CFString *v230;
  uint64_t v231;
  _QWORD v232[4];
  __CFString *v233;
  uint64_t v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  _QWORD v239[4];
  __CFString *v240;
  uint64_t v241;
  _QWORD v242[4];
  __CFString *v243;
  uint64_t v244;
  uint8_t buf[4];
  double v246;
  __int16 v247;
  void *v248;
  __int16 v249;
  void *v250;
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  uint64_t v254;

  v254 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    v242[0] = MEMORY[0x24BDAC760];
    v242[1] = 3221225472;
    v242[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke;
    v242[3] = &unk_24DCF9AA0;
    v244 = v3;
    v243 = CFSTR("distribute");
    if (distribute_defaultOnce != -1)
      dispatch_once(&distribute_defaultOnce, v242);
    v4 = distribute_classDebugEnabled;

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("self.energyEstimate=%@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 52);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v194 = self;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    v239[0] = MEMORY[0x24BDAC760];
    v239[1] = 3221225472;
    v239[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_15;
    v239[3] = &unk_24DCF9AA0;
    v241 = v16;
    v240 = CFSTR("distribute");
    if (distribute_defaultOnce_13 != -1)
      dispatch_once(&distribute_defaultOnce_13, v239);
    v17 = distribute_classDebugEnabled_14;

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionDependenciesInRange=%@"), v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 56);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      self = v194;
    }
  }
  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  obj = v15;
  v188 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v235, v253, 16);
  if (!v188)
  {
    v24 = 0.0;
    goto LABEL_114;
  }
  v187 = *(_QWORD *)v236;
  v24 = 0.0;
  do
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v236 != v187)
        objc_enumerationMutation(obj);
      v190 = v25;
      objc_msgSend(*(id *)(*((_QWORD *)&v235 + 1) + 8 * v25), "distributionEvent");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "setUsed:", 1);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v26 = objc_opt_class();
        v232[0] = MEMORY[0x24BDAC760];
        v232[1] = 3221225472;
        v232[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_20;
        v232[3] = &unk_24DCF9AA0;
        v234 = v26;
        v233 = CFSTR("distribute");
        if (distribute_defaultOnce_18 != -1)
          dispatch_once(&distribute_defaultOnce_18, v232);
        v27 = distribute_classDebugEnabled_19;

        if (v27)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEvent=%@"), v192);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 62);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v246 = *(double *)&v28;
            _os_log_debug_impl(&dword_21A62B000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          self = v194;
        }
      }
      if (objc_msgSend(v192, "instanceDirectionality") == 4)
      {
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v34 = objc_opt_class();
          v229[0] = MEMORY[0x24BDAC760];
          v229[1] = 3221225472;
          v229[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_25;
          v229[3] = &unk_24DCF9AA0;
          v231 = v34;
          v230 = CFSTR("distribute");
          if (distribute_defaultOnce_23 != -1)
            dispatch_once(&distribute_defaultOnce_23, v229);
          v35 = distribute_classDebugEnabled_24;

          if (v35)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EventPoint"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "lastPathComponent");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 69);

            PLLogCommon();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v246 = *(double *)&v36;
              _os_log_debug_impl(&dword_21A62B000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v194;
          }
        }
        -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "range");
        v191 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 1.0 / (double)(unint64_t)objc_msgSend(obj, "count");
      }
      else
      {
        v44 = objc_msgSend(v192, "distributeRangeWeightedTotal");
        v45 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
        if (v44)
        {
          if (v45)
          {
            v46 = objc_opt_class();
            v226[0] = MEMORY[0x24BDAC760];
            v226[1] = 3221225472;
            v226[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_30;
            v226[3] = &unk_24DCF9AA0;
            v228 = v46;
            v227 = CFSTR("distribute");
            if (distribute_defaultOnce_28 != -1)
              dispatch_once(&distribute_defaultOnce_28, v226);
            v47 = distribute_classDebugEnabled_29;

            if (v47)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RangeWeightedTotal"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "lastPathComponent");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v51, v52, 75);

              PLLogCommon();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v246 = *(double *)&v48;
                _os_log_debug_impl(&dword_21A62B000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v194;
            }
          }
          objc_msgSend(v192, "range");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "range");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "intersect:", v56);
          v191 = (void *)objc_claimAutoreleasedReturnValue();

          v224 = 0u;
          v225 = 0u;
          v222 = 0u;
          v223 = 0u;
          v57 = obj;
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v222, v252, 16);
          if (v58)
          {
            v59 = v58;
            v60 = *(_QWORD *)v223;
            v61 = 0.0;
            do
            {
              for (i = 0; i != v59; ++i)
              {
                if (*(_QWORD *)v223 != v60)
                  objc_enumerationMutation(v57);
                objc_msgSend(*(id *)(*((_QWORD *)&v222 + 1) + 8 * i), "range");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "range");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "intersect:", v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                self = v194;
                objc_msgSend(v66, "length");
                v61 = v61 + v67;

              }
              v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v222, v252, 16);
            }
            while (v59);

            v43 = 1.0;
            if (v61 > 0.0)
            {
              objc_msgSend(v191, "length");
              v43 = v68 / v61;
            }
          }
          else
          {

            v43 = 1.0;
          }
        }
        else
        {
          if (v45)
          {
            v69 = objc_opt_class();
            v219[0] = MEMORY[0x24BDAC760];
            v219[1] = 3221225472;
            v219[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_35;
            v219[3] = &unk_24DCF9AA0;
            v221 = v69;
            v220 = CFSTR("distribute");
            if (distribute_defaultOnce_33 != -1)
              dispatch_once(&distribute_defaultOnce_33, v219);
            v70 = distribute_classDebugEnabled_34;

            if (v70)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EventInterval"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "lastPathComponent");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "logMessage:fromFile:fromFunction:fromLineNumber:", v71, v74, v75, 86);

              PLLogCommon();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v246 = *(double *)&v71;
                _os_log_debug_impl(&dword_21A62B000, v76, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v194;
            }
          }
          objc_msgSend(v192, "range");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "range");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "intersect:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v191 = v80;
          objc_msgSend(v80, "length");
          v82 = v81;
          -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "range");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "length");
          v43 = v82 / v85;

        }
      }
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v86 = objc_opt_class();
        v216[0] = MEMORY[0x24BDAC760];
        v216[1] = 3221225472;
        v216[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_40;
        v216[3] = &unk_24DCF9AA0;
        v217 = CFSTR("distribute");
        v218 = v86;
        if (distribute_defaultOnce_38 != -1)
          dispatch_once(&distribute_defaultOnce_38, v216);
        v87 = distribute_classDebugEnabled_39;

        if (v87)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childRange=%@, childRangeWeight=%f"), v191, *(_QWORD *)&v43);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "lastPathComponent");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "logMessage:fromFile:fromFunction:fromLineNumber:", v88, v91, v92, 90);

          PLLogCommon();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v246 = *(double *)&v88;
            _os_log_debug_impl(&dword_21A62B000, v93, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          self = v194;
        }
      }
      v214 = 0u;
      v215 = 0u;
      v212 = 0u;
      v213 = 0u;
      objc_msgSend(v192, "childNodeIDToWeight");
      v193 = (id)objc_claimAutoreleasedReturnValue();
      v196 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v212, v251, 16);
      if (v196)
      {
        v195 = *(_QWORD *)v213;
        do
        {
          v94 = 0;
          do
          {
            if (*(_QWORD *)v213 != v195)
              objc_enumerationMutation(v193);
            v95 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * v94);
            if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
            {
              v96 = objc_opt_class();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_45;
              block[3] = &unk_24DCF9AA0;
              v210 = CFSTR("distribute");
              v211 = v96;
              if (distribute_defaultOnce_43 != -1)
                dispatch_once(&distribute_defaultOnce_43, block);
              v97 = distribute_classDebugEnabled_44;

              if (v97)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childNodeID=%@"), v95);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "lastPathComponent");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "logMessage:fromFile:fromFunction:fromLineNumber:", v98, v101, v102, 94);

                PLLogCommon();
                v103 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v246 = *(double *)&v98;
                  _os_log_debug_impl(&dword_21A62B000, v103, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "nodeID");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = objc_msgSend(v95, "isEqual:", v105);

            if (!v106)
            {
              objc_msgSend(v192, "childNodeIDToWeight");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "objectForKeyedSubscript:", v95);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "doubleValue");
              v118 = v117;

              -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "energy");
              v121 = v43 * v118 * v120;

              +[PLAccountingEngine minDistributionEnergy](PLAccountingEngine, "minDistributionEnergy");
              if (v121 >= v122)
              {
                v24 = v24 + v121;
                if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
                {
                  v124 = objc_opt_class();
                  v203[0] = MEMORY[0x24BDAC760];
                  v203[1] = 3221225472;
                  v203[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_56;
                  v203[3] = &unk_24DCF9AA0;
                  v204 = CFSTR("distribute");
                  v205 = v124;
                  if (distribute_defaultOnce_54 != -1)
                    dispatch_once(&distribute_defaultOnce_54, v203);
                  v125 = distribute_classDebugEnabled_55;

                  if (v125)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childElementWeight=%f, childEnergy=%f, energyDistributed=%f"), *(_QWORD *)&v118, *(_QWORD *)&v121, *(_QWORD *)&v24);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    v127 = (void *)MEMORY[0x24BE74FA8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v128, "lastPathComponent");
                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v127, "logMessage:fromFile:fromFunction:fromLineNumber:", v126, v129, v130, 112);

                    PLLogCommon();
                    v131 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v246 = *(double *)&v126;
                      _os_log_debug_impl(&dword_21A62B000, v131, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
                v132 = [PLAccountingEnergyEstimateEventEntry alloc];
                -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "rootNodeID");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                v136 = objc_msgSend(v135, "entryID");
                -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                v138 = objc_msgSend(v137, "numAncestors") + 1;
                -[PLAccountingOwner runDate](v194, "runDate");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = v138;
                self = v194;
                v109 = -[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:](v132, "initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:", v95, v134, v136, v140, v191, v139, v121);

                if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
                {
                  v141 = objc_opt_class();
                  v200[0] = MEMORY[0x24BDAC760];
                  v200[1] = 3221225472;
                  v200[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_62;
                  v200[3] = &unk_24DCF9AA0;
                  v201 = CFSTR("distribute");
                  v202 = v141;
                  if (distribute_defaultOnce_60 != -1)
                    dispatch_once(&distribute_defaultOnce_60, v200);
                  v142 = distribute_classDebugEnabled_61;

                  if (v142)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childEnergyEstimate=%@"), v109);
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    v144 = (void *)MEMORY[0x24BE74FA8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v145, "lastPathComponent");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v144, "logMessage:fromFile:fromFunction:fromLineNumber:", v143, v146, v147, 121);

                    PLLogCommon();
                    v148 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v246 = *(double *)&v143;
                      _os_log_debug_impl(&dword_21A62B000, v148, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
                -[PLAccountingOwner manager](v194, "manager");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLAccountingDistributionOwner energyEstimate](v194, "energyEstimate");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v149, "didDistributeToChildEnergyEstimate:fromParentEnergyEstimate:", v109, v150);

              }
              else
              {
                PLLogCommon();
                v109 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                {
                  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
                  v114 = objc_claimAutoreleasedReturnValue();
                  -[NSObject rootNodeID](v114, "rootNodeID");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218498;
                  v246 = v121;
                  v247 = 2112;
                  v248 = v95;
                  v249 = 2112;
                  v250 = v123;
                  _os_log_debug_impl(&dword_21A62B000, v109, OS_LOG_TYPE_DEBUG, "Skipping distribution of childEnergy=%f, childNodeID=%@, rootNodeID=%@", buf, 0x20u);

                  goto LABEL_88;
                }
              }
LABEL_107:

              goto LABEL_108;
            }
            if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
            {
              v107 = objc_opt_class();
              v206[0] = MEMORY[0x24BDAC760];
              v206[1] = 3221225472;
              v206[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_50;
              v206[3] = &unk_24DCF9AA0;
              v207 = CFSTR("distribute");
              v208 = v107;
              if (distribute_defaultOnce_48 != -1)
                dispatch_once(&distribute_defaultOnce_48, v206);
              v108 = distribute_classDebugEnabled_49;

              if (v108)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("skipping distribution to self"));
                v109 = objc_claimAutoreleasedReturnValue();
                v110 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "lastPathComponent");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "logMessage:fromFile:fromFunction:fromLineNumber:", v109, v112, v113, 98);

                PLLogCommon();
                v114 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v246 = *(double *)&v109;
                  _os_log_debug_impl(&dword_21A62B000, v114, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
LABEL_88:

                goto LABEL_107;
              }
            }
LABEL_108:
            ++v94;
          }
          while (v196 != v94);
          v196 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v212, v251, 16);
        }
        while (v196);
      }

      v25 = v190 + 1;
    }
    while (v190 + 1 != v188);
    v188 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v235, v253, 16);
  }
  while (v188);
LABEL_114:

  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "energy");
  v153 = v152;

  if (v153 > 0.0)
  {
    -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "energy");
    v156 = 1.0 - v24 / v155;
    -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setTerminationRatio:", v156);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v158 = objc_opt_class();
      v197[0] = MEMORY[0x24BDAC760];
      v197[1] = 3221225472;
      v197[2] = __43__PLAccountingDistributionOwner_distribute__block_invoke_67;
      v197[3] = &unk_24DCF9AA0;
      v198 = CFSTR("distribute");
      v199 = v158;
      if (distribute_defaultOnce_65 != -1)
        dispatch_once(&distribute_defaultOnce_65, v197);
      v159 = distribute_classDebugEnabled_66;

      if (v159)
      {
        v160 = (void *)MEMORY[0x24BDD17C8];
        -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "terminationRatio");
        objc_msgSend(v160, "stringWithFormat:", CFSTR("terminationRatio=%f"), v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();

        v164 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "lastPathComponent");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "logMessage:fromFile:fromFunction:fromLineNumber:", v163, v166, v167, 132);

        PLLogCommon();
        v168 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "energy");
    v171 = v24 - v170;
    +[PLAccountingEngine minEnergy](PLAccountingEngine, "minEnergy");
    v173 = v172;

    if (v171 > v173)
    {
      v174 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "energy");
      v177 = v176;
      -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "stringWithFormat:", CFSTR("ERROR: energyDistributed=%f greater than energy=%f for energyEstimate=%@"), *(_QWORD *)&v24, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      v180 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionOwner.m");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "lastPathComponent");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionOwner distribute]");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "logMessage:fromFile:fromFunction:fromLineNumber:", v179, v182, v183, 136);

      PLLogCommon();
      v184 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwner manager](self, "manager");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "didDistributeEnergyEstimate:", v186);

}

- (PLAccountingEnergyEstimateEventEntry)energyEstimate
{
  return (PLAccountingEnergyEstimateEventEntry *)objc_getProperty(self, a2, 64, 1);
}

- (id)activationDate
{
  void *v2;
  void *v3;

  -[PLAccountingDistributionOwner energyEstimate](self, "energyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_14 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_19 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_24 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_29 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_34 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_39 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_44 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_50(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_49 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_55 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_61 = result;
  return result;
}

uint64_t __43__PLAccountingDistributionOwner_distribute__block_invoke_67(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  distribute_classDebugEnabled_66 = result;
  return result;
}

- (void)setEnergyEstimate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
