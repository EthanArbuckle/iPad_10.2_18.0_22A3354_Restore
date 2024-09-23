@implementation PLAccountingQualificationOwner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyEstimate, 0);
}

- (id)ID
{
  void *v2;
  void *v3;

  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootNodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingEnergyEstimateEventEntry)energyEstimate
{
  return (PLAccountingEnergyEstimateEventEntry *)objc_getProperty(self, a2, 64, 1);
}

- (PLAccountingQualificationOwner)initWithEnergyEstimate:(id)a3
{
  id v5;
  PLAccountingQualificationOwner *v6;
  PLAccountingQualificationOwner *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingQualificationOwner;
  v6 = -[PLAccountingQualificationOwner init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_energyEstimate, a3);

  return v7;
}

- (id)range
{
  void *v2;
  void *v3;

  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activationDate
{
  void *v2;
  void *v3;

  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRunDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQualificationDate:", v4);

}

- (void)qualify
{
  unint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  int v73;
  int v74;
  uint64_t v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
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
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  double v101;
  uint64_t v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  uint64_t v119;
  int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  PLAccountingEnergyEventEntry *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  uint64_t v132;
  int v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  int v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  id obj;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD v158[4];
  __CFString *v159;
  uint64_t v160;
  _QWORD v161[4];
  __CFString *v162;
  uint64_t v163;
  _QWORD v164[4];
  __CFString *v165;
  uint64_t v166;
  _QWORD v167[4];
  __CFString *v168;
  uint64_t v169;
  _QWORD v170[4];
  __CFString *v171;
  uint64_t v172;
  _QWORD v173[4];
  __CFString *v174;
  uint64_t v175;
  _QWORD block[4];
  __CFString *v177;
  uint64_t v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _QWORD v183[4];
  __CFString *v184;
  uint64_t v185;
  _QWORD v186[4];
  __CFString *v187;
  uint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _QWORD v193[4];
  __CFString *v194;
  uint64_t v195;
  _QWORD v196[4];
  __CFString *v197;
  uint64_t v198;
  uint8_t v199[128];
  uint8_t buf[4];
  void *v201;
  _BYTE v202[128];
  uint64_t v203;

  v203 = *MEMORY[0x24BDAC8D0];
  v3 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    v196[0] = MEMORY[0x24BDAC760];
    v196[1] = 3221225472;
    v196[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke;
    v196[3] = &unk_24DCF9AA0;
    v198 = v4;
    v197 = CFSTR("qualify");
    if (qualify_defaultOnce != -1)
      dispatch_once(&qualify_defaultOnce, v196);
    v5 = qualify_classDebugEnabled;

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("self.energyEstimate=%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 49);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLAccountingCorrectionOwner correct].cold.1((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v20 = objc_opt_class();
    v193[0] = MEMORY[0x24BDAC760];
    v193[1] = 3221225472;
    v193[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_15;
    v193[3] = &unk_24DCF9AA0;
    v195 = v20;
    v194 = CFSTR("qualify");
    if (qualify_defaultOnce_13 != -1)
      dispatch_once(&qualify_defaultOnce_13, v193);
    v21 = qualify_classDebugEnabled_14;

    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("dependencyIDToDependenciesInRange=%@"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 50);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[PLAccountingCorrectionOwner correct].cold.1((uint64_t)v24, v29, v30, v31, v32, v33, v34, v35);

    }
  }
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allKeys");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v37;
  v153 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
  if (v153)
  {
    v152 = *(_QWORD *)v190;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v190 != v152)
          objc_enumerationMutation(obj);
        v154 = v38;
        v39 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * v38);
        if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
        {
          v40 = objc_opt_class();
          v186[0] = MEMORY[0x24BDAC760];
          v186[1] = 3221225472;
          v186[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_20;
          v186[3] = &unk_24DCF9AA0;
          v188 = v40;
          v187 = CFSTR("qualify");
          if (qualify_defaultOnce_18 != -1)
            dispatch_once(&qualify_defaultOnce_18, v186);
          v41 = qualify_classDebugEnabled_19;

          if (v41)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationID=%@"), v39);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "lastPathComponent");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 53);

            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v201 = v42;
              _os_log_debug_impl(&dword_21A62B000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v39);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
        {
          v50 = objc_opt_class();
          v183[0] = MEMORY[0x24BDAC760];
          v183[1] = 3221225472;
          v183[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_25;
          v183[3] = &unk_24DCF9AA0;
          v185 = v50;
          v184 = CFSTR("qualify");
          if (qualify_defaultOnce_23 != -1)
            dispatch_once(&qualify_defaultOnce_23, v183);
          v51 = qualify_classDebugEnabled_24;

          if (v51)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependenciesInRange=%@"), v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "lastPathComponent");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 56);

            PLLogCommon();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v201 = v52;
              _os_log_debug_impl(&dword_21A62B000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        v155 = v49;
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v179, v199, 16);
        if (v157)
        {
          v156 = *(_QWORD *)v180;
          do
          {
            v58 = 0;
            do
            {
              if (*(_QWORD *)v180 != v156)
                objc_enumerationMutation(v155);
              objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * v58), "qualificationEvent");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setUsed:", 1);
              if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
              {
                v60 = objc_opt_class();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_30;
                block[3] = &unk_24DCF9AA0;
                v177 = CFSTR("qualify");
                v178 = v60;
                if (qualify_defaultOnce_28 != -1)
                  dispatch_once(&qualify_defaultOnce_28, block);
                v61 = qualify_classDebugEnabled_29;

                if (v61)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEvent=%@"), v59);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "lastPathComponent");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v65, v66, 61);

                  PLLogCommon();
                  v67 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v201 = v62;
                    _os_log_debug_impl(&dword_21A62B000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                }
              }
              objc_msgSend(v59, "childNodeIDs");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v68, "containsObject:", &unk_24DD019F0))
              {

LABEL_49:
                v73 = objc_msgSend(v59, "instanceDirectionality");
                v74 = objc_msgSend(*(id *)(v3 + 4016), "debugEnabled");
                if (v73 == 4)
                {
                  if (v74)
                  {
                    v75 = objc_opt_class();
                    v170[0] = MEMORY[0x24BDAC760];
                    v170[1] = 3221225472;
                    v170[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_41;
                    v170[3] = &unk_24DCF9AA0;
                    v171 = CFSTR("qualify");
                    v172 = v75;
                    if (qualify_defaultOnce_39 != -1)
                      dispatch_once(&qualify_defaultOnce_39, v170);
                    v76 = qualify_classDebugEnabled_40;

                    if (v76)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EventPoint"));
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      v78 = (void *)MEMORY[0x24BE74FA8];
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v79, "lastPathComponent");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "logMessage:fromFile:fromFunction:fromLineNumber:", v77, v80, v81, 75);

                      PLLogCommon();
                      v82 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v201 = v77;
                        _os_log_debug_impl(&dword_21A62B000, v82, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                    }
                  }
                  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "range");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();

                  v85 = 1.0 / (double)(unint64_t)objc_msgSend(v155, "count");
                }
                else
                {
                  if (v74)
                  {
                    v86 = objc_opt_class();
                    v167[0] = MEMORY[0x24BDAC760];
                    v167[1] = 3221225472;
                    v167[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_46;
                    v167[3] = &unk_24DCF9AA0;
                    v168 = CFSTR("qualify");
                    v169 = v86;
                    if (qualify_defaultOnce_44 != -1)
                      dispatch_once(&qualify_defaultOnce_44, v167);
                    v87 = qualify_classDebugEnabled_45;

                    if (v87)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EventInterval"));
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = (void *)MEMORY[0x24BE74FA8];
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v90, "lastPathComponent");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v89, "logMessage:fromFile:fromFunction:fromLineNumber:", v88, v91, v92, 81);

                      PLLogCommon();
                      v93 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v201 = v88;
                        _os_log_debug_impl(&dword_21A62B000, v93, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                    }
                  }
                  objc_msgSend(v59, "range");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "range");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "intersect:", v96);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v84, "length");
                  v98 = v97;
                  -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "range");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "length");
                  v85 = v98 / v101;

                }
                if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
                {
                  v102 = objc_opt_class();
                  v164[0] = MEMORY[0x24BDAC760];
                  v164[1] = 3221225472;
                  v164[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_51;
                  v164[3] = &unk_24DCF9AA0;
                  v165 = CFSTR("qualify");
                  v166 = v102;
                  if (qualify_defaultOnce_49 != -1)
                    dispatch_once(&qualify_defaultOnce_49, v164);
                  v103 = qualify_classDebugEnabled_50;

                  if (v103)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationRange=%@, qualificationRangeWeight=%f"), v84, *(_QWORD *)&v85);
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v105 = (void *)MEMORY[0x24BE74FA8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v106, "lastPathComponent");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v105, "logMessage:fromFile:fromFunction:fromLineNumber:", v104, v107, v108, 85);

                    PLLogCommon();
                    v109 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v201 = v104;
                      _os_log_debug_impl(&dword_21A62B000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
                -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "terminationRatio");
                v112 = v85 * v111;
                -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "energy");
                v115 = v114;
                -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "correctionEnergy");
                v118 = v112 * (v115 + v117);

                if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
                {
                  v119 = objc_opt_class();
                  v161[0] = MEMORY[0x24BDAC760];
                  v161[1] = 3221225472;
                  v161[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_56;
                  v161[3] = &unk_24DCF9AA0;
                  v162 = CFSTR("qualify");
                  v163 = v119;
                  if (qualify_defaultOnce_54 != -1)
                    dispatch_once(&qualify_defaultOnce_54, v161);
                  v120 = qualify_classDebugEnabled_55;

                  if (v120)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEnergy=%f"), *(_QWORD *)&v118);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    v122 = (void *)MEMORY[0x24BE74FA8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v123, "lastPathComponent");
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v122, "logMessage:fromFile:fromFunction:fromLineNumber:", v121, v124, v125, 88);

                    PLLogCommon();
                    v126 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v201 = v121;
                      _os_log_debug_impl(&dword_21A62B000, v126, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
                v127 = [PLAccountingEnergyEventEntry alloc];
                -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "nodeID");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLAccountingOwner runDate](self, "runDate");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = -[PLAccountingEnergyEventEntry initWithNodeID:withEnergy:withRange:withEntryDate:](v127, "initWithNodeID:withEnergy:withRange:withEntryDate:", v129, v84, v130, v118);

                if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
                {
                  v132 = objc_opt_class();
                  v158[0] = MEMORY[0x24BDAC760];
                  v158[1] = 3221225472;
                  v158[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_62;
                  v158[3] = &unk_24DCF9AA0;
                  v159 = CFSTR("qualify");
                  v160 = v132;
                  if (qualify_defaultOnce_60 != -1)
                    dispatch_once(&qualify_defaultOnce_60, v158);
                  v133 = qualify_classDebugEnabled_61;

                  if (v133)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEnergyEvent=%@"), v131);
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    v135 = (void *)MEMORY[0x24BE74FA8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                    v136 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v136, "lastPathComponent");
                    v137 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v135, "logMessage:fromFile:fromFunction:fromLineNumber:", v134, v137, v138, 94);

                    PLLogCommon();
                    v139 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v201 = v134;
                      _os_log_debug_impl(&dword_21A62B000, v139, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    v3 = 0x24BE74000;
                  }
                }
                -[PLAccountingOwner manager](self, "manager");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "rootNodeID");
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "qualificationID");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "didQualifyEnergyEvent:withRootNodeID:withQualificationID:", v131, v142, v143);

LABEL_88:
                goto LABEL_89;
              }
              objc_msgSend(v59, "childNodeIDs");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLAccountingQualificationOwner energyEstimate](self, "energyEstimate");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "nodeID");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v69, "containsObject:", v71);

              if ((v72 & 1) != 0)
                goto LABEL_49;
              if (objc_msgSend(*(id *)(v3 + 4016), "debugEnabled"))
              {
                v144 = objc_opt_class();
                v173[0] = MEMORY[0x24BDAC760];
                v173[1] = 3221225472;
                v173[2] = __41__PLAccountingQualificationOwner_qualify__block_invoke_36;
                v173[3] = &unk_24DCF9AA0;
                v174 = CFSTR("qualify");
                v175 = v144;
                if (qualify_defaultOnce_34 != -1)
                  dispatch_once(&qualify_defaultOnce_34, v173);
                v145 = qualify_classDebugEnabled_35;

                if (v145)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEvent does not pertain to self"));
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  v146 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationOwner.m");
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v147, "lastPathComponent");
                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationOwner qualify]");
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "logMessage:fromFile:fromFunction:fromLineNumber:", v84, v148, v149, 66);

                  PLLogCommon();
                  v131 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v201 = v84;
                    _os_log_debug_impl(&dword_21A62B000, v131, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }
                  goto LABEL_88;
                }
              }
LABEL_89:

              ++v58;
            }
            while (v157 != v58);
            v150 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v179, v199, 16);
            v157 = v150;
          }
          while (v150);
        }

        v38 = v154 + 1;
      }
      while (v154 + 1 != v153);
      v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
    }
    while (v153);
  }

}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_14 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_19 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_24 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_29 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_36(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_35 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_40 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_45 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_51(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_50 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_55 = result;
  return result;
}

uint64_t __41__PLAccountingQualificationOwner_qualify__block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  qualify_classDebugEnabled_61 = result;
  return result;
}

- (void)setEnergyEstimate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
