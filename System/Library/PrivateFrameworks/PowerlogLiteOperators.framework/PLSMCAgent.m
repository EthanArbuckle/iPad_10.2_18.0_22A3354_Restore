@implementation PLSMCAgent

- (void)logThermalInstantAndAccumlatedKeys
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  PLSMCAgent *v24;
  void *v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ThermalInstantKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[PLSMCAgent thermalInstantKeys](self, "thermalInstantKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v28 = v3;
    v29 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v34;
    v30 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      v32 = v7;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v10);
        v12 = v11;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("SDTO")))
        {
          objc_msgSend(v11, "stringByAppendingString:", CFSTR("_"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[PLSMCAgent readKey:](self, "readKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);

        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 != 0;
        v16 = v14 == 0;

        if (((v16 | v8) & 1) != 0)
        {
          v8 |= v15;
        }
        else
        {
          -[PLSMCAgent lastThermalInstantEntry](self, "lastThermalInstantEntry");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[PLSMCAgent lastThermalInstantEntry](self, "lastThermalInstantEntry");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              -[PLSMCAgent lastThermalInstantEntry](self, "lastThermalInstantEntry");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", v12);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "doubleValue");
              v22 = v21;
              objc_msgSend(v4, "objectForKeyedSubscript:", v12);
              v23 = v4;
              v24 = self;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "doubleValue");
              v8 = vabdd_f64(v22, v26) > 1.0;

              self = v24;
              v4 = v23;
              v5 = v29;

            }
            else
            {
              v8 = 1;
            }

            v9 = v30;
          }
          else
          {
            v8 = 1;
          }

          v7 = v32;
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);

    v3 = v28;
    if ((v8 & 1) != 0)
    {
      PLLogSMC();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "Logging Thermal Instant entry: %@", buf, 0xCu);
      }

      -[PLOperator logEntry:](self, "logEntry:", v4);
      -[PLSMCAgent setLastThermalInstantEntry:](self, "setLastThermalInstantEntry:", v4);
    }
  }
  else
  {

  }
}

- (id)readKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v8;
  int buf;
  uint8_t buf_4[8];
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "UTF8String");
    if (SMCMakeUInt32Key())
    {
      -[PLSMCAgent smcConnection](self, "smcConnection");
      if (!SMCGetKeyInfo())
      {
        -[PLSMCAgent smcConnection](self, "smcConnection");
        if (!SMCReadKeyAsNumericWithKnownKeyInfo())
        {
          PLLogSMC();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            buf = 138412546;
            *(_QWORD *)buf_4 = v6;
            v11 = 2112;
            v12 = 0;
            _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&buf, 0x16u);
          }

        }
      }
    }
  }

  return 0;
}

- ($9CEE2F78D9152958F56DF80F82CC2BF0)smcConnection
{
  return self->_smcConnection;
}

- (PLEntry)lastThermalInstantEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 152, 1);
}

- (id)thermalInstantKeys
{
  if (qword_1ED8826A8 != -1)
    dispatch_once(&qword_1ED8826A8, &__block_literal_global_554);
  return (id)qword_1ED8826B0;
}

- (void)setLastThermalInstantEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

uint64_t __34__PLSMCAgent_registerThermalTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logThermalInstantAndAccumlatedKeys");
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logDisplayPower");
}

- (void)virtualTemperatureMonitorCallback
{
  void *v3;
  void *v4;

  if (-[PLSMCAgent anyVirtualTemperatureAboveThreshold](self, "anyVirtualTemperatureAboveThreshold"))
  {
    -[PLSMCAgent registerThermalTimer](self, "registerThermalTimer");
  }
  else
  {
    -[PLSMCAgent thermalLoggingTimer](self, "thermalLoggingTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PLSMCAgent thermalLoggingTimer](self, "thermalLoggingTimer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invalidate");

      -[PLSMCAgent setThermalLoggingTimer:](self, "setThermalLoggingTimer:", 0);
    }
  }
}

- (id)virtualTemperatureKeys
{
  if (qword_1ED8826F8 != -1)
    dispatch_once(&qword_1ED8826F8, &__block_literal_global_562);
  return (id)qword_1ED882700;
}

- (PLTimer)thermalLoggingTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)registerThermalTimer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[PLSMCAgent thermalLoggingTimer](self, "thermalLoggingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__PLSMCAgent_registerThermalTimer__block_invoke;
    v9[3] = &unk_1E8578078;
    v9[4] = self;
    v7 = (void *)objc_msgSend(v4, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v5, 1, 0, v6, v9, 20.0, 0.0);
    -[PLSMCAgent setThermalLoggingTimer:](self, "setThermalLoggingTimer:", v7);

    -[PLSMCAgent thermalLoggingTimer](self, "thermalLoggingTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arm");

  }
}

- (void)parseThermalThresholds:(BOOL)a3 thermalPressure:(BOOL)a4 virtualTemp:(BOOL)a5 thermalLevel:(BOOL)a6
{
  if (a5)
    -[PLSMCAgent virtualTemperatureMonitorCallback](self, "virtualTemperatureMonitorCallback", a3, a4, a5, a6);
}

- (BOOL)anyVirtualTemperatureAboveThreshold
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLSMCAgent virtualTemperatureKeys](self, "virtualTemperatureKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        -[PLSMCAgent readKey:](self, "readKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "doubleValue");
          if (v10 > 35.0)
          {

            v11 = 1;
            goto LABEL_12;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)supportsThermalSMC
{
  if (qword_1ED882708 != -1)
    dispatch_once(&qword_1ED882708, &__block_literal_global_563);
  return byte_1ED882615;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSMCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ThermalKeys");
  objc_msgSend(a1, "entryEventPointDefinitionThermalKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("ThermalInstantKeys");
  objc_msgSend(a1, "entryEventPointDefinitionThermalInstantKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("MetricMonitorInstantKeys");
  objc_msgSend(a1, "entryEventPointDefinitionMetricMonitorInstantKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventPointDefinitionThermalKeys
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitionThermalInstantKeys
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  _QWORD v223[108];
  _QWORD v224[108];
  _QWORD v225[2];
  _QWORD v226[2];
  _QWORD v227[2];
  _QWORD v228[4];

  v228[2] = *MEMORY[0x1E0C80C00];
  v227[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v225[0] = *MEMORY[0x1E0D80318];
  v225[1] = v2;
  v226[0] = &unk_1E8652A10;
  v226[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v226, v225, 2);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v228[0] = v222;
  v227[1] = *MEMORY[0x1E0D802F0];
  v223[0] = CFSTR("voP0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "commonTypeDict_RealFormat");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = v220;
  v223[1] = CFSTR("TW0P");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "commonTypeDict_RealFormat");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v224[1] = v218;
  v223[2] = CFSTR("TB0T");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "commonTypeDict_RealFormat");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v224[2] = v216;
  v223[3] = CFSTR("TCMb");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "commonTypeDict_RealFormat");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v224[3] = v214;
  v223[4] = CFSTR("TN0n");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "commonTypeDict_RealFormat");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v224[4] = v212;
  v223[5] = CFSTR("TV0A");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "commonTypeDict_RealFormat");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v224[5] = v210;
  v223[6] = CFSTR("TVFM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "commonTypeDict_RealFormat");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v224[6] = v208;
  v223[7] = CFSTR("voC0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "commonTypeDict_RealFormat");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v224[7] = v206;
  v223[8] = CFSTR("mlCC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "commonTypeDict_RealFormat");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v224[8] = v204;
  v223[9] = CFSTR("voT0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "commonTypeDict_RealFormat");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v224[9] = v202;
  v223[10] = CFSTR("voR1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "commonTypeDict_RealFormat");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v224[10] = v200;
  v223[11] = CFSTR("voR2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "commonTypeDict_RealFormat");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v224[11] = v198;
  v223[12] = CFSTR("xPb1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "commonTypeDict_RealFormat");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v224[12] = v196;
  v223[13] = CFSTR("xPb2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "commonTypeDict_RealFormat");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v224[13] = v194;
  v223[14] = CFSTR("mlNN");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "commonTypeDict_RealFormat");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v224[14] = v192;
  v223[15] = CFSTR("voS0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "commonTypeDict_RealFormat");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v224[15] = v190;
  v223[16] = CFSTR("xPSp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "commonTypeDict_RealFormat");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v224[16] = v188;
  v223[17] = CFSTR("voBB");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "commonTypeDict_RealFormat");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v224[17] = v186;
  v223[18] = CFSTR("xPDs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "commonTypeDict_RealFormat");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v224[18] = v184;
  v223[19] = CFSTR("cmSM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "commonTypeDict_RealFormat");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v224[19] = v182;
  v223[20] = CFSTR("TVD0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "commonTypeDict_RealFormat");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v224[20] = v180;
  v223[21] = CFSTR("ftS0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "commonTypeDict_RealFormat");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v224[21] = v178;
  v223[22] = CFSTR("TVBM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "commonTypeDict_RealFormat");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v224[22] = v176;
  v223[23] = CFSTR("TVFD");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "commonTypeDict_RealFormat");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v224[23] = v174;
  v223[24] = CFSTR("TVFL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "commonTypeDict_RealFormat");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v224[24] = v172;
  v223[25] = CFSTR("TVFG");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "commonTypeDict_RealFormat");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v224[25] = v170;
  v223[26] = CFSTR("TVBQ");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "commonTypeDict_RealFormat");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v224[26] = v168;
  v223[27] = CFSTR("TVBR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "commonTypeDict_RealFormat");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v224[27] = v166;
  v223[28] = CFSTR("TV0s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "commonTypeDict_RealFormat");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v224[28] = v164;
  v223[29] = CFSTR("TV2s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "commonTypeDict_RealFormat");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v224[29] = v162;
  v223[30] = CFSTR("TV4s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "commonTypeDict_RealFormat");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v224[30] = v160;
  v223[31] = CFSTR("TV5s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "commonTypeDict_RealFormat");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v224[31] = v158;
  v223[32] = CFSTR("xPPT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "commonTypeDict_RealFormat");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v224[32] = v156;
  v223[33] = CFSTR("xDPE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "commonTypeDict_RealFormat");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v224[33] = v154;
  v223[34] = CFSTR("mTPL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "commonTypeDict_RealFormat");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v224[34] = v152;
  v223[35] = CFSTR("B0AP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "commonTypeDict_RealFormat");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v224[35] = v150;
  v223[36] = CFSTR("mTLL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "commonTypeDict_RealFormat");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v224[36] = v148;
  v223[37] = CFSTR("xPNf");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "commonTypeDict_RealFormat");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v224[37] = v146;
  v223[38] = CFSTR("xPWi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "commonTypeDict_RealFormat");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v224[38] = v144;
  v223[39] = CFSTR("xPAr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "commonTypeDict_RealFormat");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v224[39] = v142;
  v223[40] = CFSTR("TVBA");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "commonTypeDict_RealFormat");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v224[40] = v140;
  v223[41] = CFSTR("TVBC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "commonTypeDict_RealFormat");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v224[41] = v138;
  v223[42] = CFSTR("TVBF");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "commonTypeDict_RealFormat");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v224[42] = v136;
  v223[43] = CFSTR("TVBB");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "commonTypeDict_RealFormat");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v224[43] = v134;
  v223[44] = CFSTR("TVLN");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "commonTypeDict_RealFormat");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v224[44] = v132;
  v223[45] = CFSTR("SDTo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "commonTypeDict_RealFormat");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v224[45] = v130;
  v223[46] = CFSTR("SDTh");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "commonTypeDict_BoolFormat");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v224[46] = v128;
  v223[47] = CFSTR("SDTL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "commonTypeDict_RealFormat");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v224[47] = v126;
  v223[48] = CFSTR("xRPE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "commonTypeDict_RealFormat");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v224[48] = v124;
  v223[49] = CFSTR("TG0V");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "commonTypeDict_RealFormat");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v224[49] = v122;
  v223[50] = CFSTR("CKRQ");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "commonTypeDict_BoolFormat");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v224[50] = v120;
  v223[51] = CFSTR("TVBN");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "commonTypeDict_RealFormat");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v224[51] = v118;
  v223[52] = CFSTR("TVRQ");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "commonTypeDict_RealFormat");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v224[52] = v116;
  v223[53] = CFSTR("TVRH");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "commonTypeDict_RealFormat");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v224[53] = v114;
  v223[54] = CFSTR("TVRR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "commonTypeDict_RealFormat");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v224[54] = v112;
  v223[55] = CFSTR("TVBE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "commonTypeDict_RealFormat");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v224[55] = v110;
  v223[56] = CFSTR("TVRM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "commonTypeDict_RealFormat");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v224[56] = v108;
  v223[57] = CFSTR("TAOP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "commonTypeDict_RealFormat");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v224[57] = v106;
  v223[58] = CFSTR("TB50");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "commonTypeDict_RealFormat");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v224[58] = v104;
  v223[59] = CFSTR("TB5B");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "commonTypeDict_RealFormat");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v224[59] = v102;
  v223[60] = CFSTR("TKFP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "commonTypeDict_RealFormat");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v224[60] = v100;
  v223[61] = CFSTR("TVFC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "commonTypeDict_RealFormat");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v224[61] = v98;
  v223[62] = CFSTR("TNAP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "commonTypeDict_RealFormat");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v224[62] = v96;
  v223[63] = CFSTR("TR0P");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "commonTypeDict_RealFormat");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v224[63] = v94;
  v223[64] = CFSTR("mlr5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "commonTypeDict_RealFormat");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v224[64] = v92;
  v223[65] = CFSTR("BUIC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "commonTypeDict_IntegerFormat");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v224[65] = v90;
  v223[66] = CFSTR("xCTA");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "commonTypeDict_RealFormat");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v224[66] = v88;
  v223[67] = CFSTR("SDTA");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "commonTypeDict_RealFormat");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v224[67] = v86;
  v223[68] = CFSTR("SDTC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "commonTypeDict_RealFormat");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v224[68] = v84;
  v223[69] = CFSTR("TV1s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "commonTypeDict_RealFormat");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v224[69] = v82;
  v223[70] = CFSTR("TV3s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "commonTypeDict_RealFormat");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v224[70] = v80;
  v223[71] = CFSTR("TVBH");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "commonTypeDict_RealFormat");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v224[71] = v78;
  v223[72] = CFSTR("TTDa");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_RealFormat");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v224[72] = v76;
  v223[73] = CFSTR("TPMP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "commonTypeDict_RealFormat");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v224[73] = v74;
  v223[74] = CFSTR("TCHP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "commonTypeDict_RealFormat");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v224[74] = v72;
  v223[75] = CFSTR("TH0T");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_RealFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v224[75] = v70;
  v223[76] = CFSTR("TG0B");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_RealFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v224[76] = v68;
  v223[77] = CFSTR("zSLi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_RealFormat");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v224[77] = v66;
  v223[78] = CFSTR("zSPi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_RealFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v224[78] = v64;
  v223[79] = CFSTR("TAOC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_RealFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v224[79] = v62;
  v223[80] = CFSTR("TVBL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_RealFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v224[80] = v60;
  v223[81] = CFSTR("TVB1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_RealFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v224[81] = v58;
  v223[82] = CFSTR("TVB2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_RealFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v224[82] = v56;
  v223[83] = CFSTR("TVB3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_RealFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v224[83] = v54;
  v223[84] = CFSTR("TVB4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_RealFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v224[84] = v52;
  v223[85] = CFSTR("TPSP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_RealFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v224[85] = v50;
  v223[86] = CFSTR("TIOP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_RealFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v224[86] = v48;
  v223[87] = CFSTR("TTDb");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_RealFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v224[87] = v46;
  v223[88] = CFSTR("ftD0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_RealFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v224[88] = v44;
  v223[89] = CFSTR("SBAP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_RealFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v224[89] = v42;
  v223[90] = CFSTR("SDTK");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_RealFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v224[90] = v40;
  v223[91] = CFSTR("SDTO_");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_RealFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v224[91] = v38;
  v223[92] = CFSTR("SDMX");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_RealFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v224[92] = v36;
  v223[93] = CFSTR("TSCP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_RealFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v224[93] = v34;
  v223[94] = CFSTR("RP00");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_RealFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v224[94] = v32;
  v223[95] = CFSTR("RP01");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_RealFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v224[95] = v30;
  v223[96] = CFSTR("RP02");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_RealFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v224[96] = v28;
  v223[97] = CFSTR("SDRC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_RealFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v224[97] = v26;
  v223[98] = CFSTR("SPDM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_RealFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v224[98] = v24;
  v223[99] = CFSTR("TAOD");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_RealFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v224[99] = v22;
  v223[100] = CFSTR("TVAL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_RealFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v224[100] = v20;
  v223[101] = CFSTR("SDTZ");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_RealFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v224[101] = v18;
  v223[102] = CFSTR("TPCP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v224[102] = v16;
  v223[103] = CFSTR("TTCP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v224[103] = v14;
  v223[104] = CFSTR("TDCP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v224[104] = v4;
  v223[105] = CFSTR("TR0Q");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v224[105] = v6;
  v223[106] = CFSTR("TMPP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v224[106] = v8;
  v223[107] = CFSTR("TVB5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v224[107] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v224, v223, 108);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v228[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v228, v227, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionMetricMonitorInstantKeys
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v25[9];
  _QWORD v26[9];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
    return MEMORY[0x1E0C9AA70];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1E8632160;
  v28[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("B0AP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_RealFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v25[1] = CFSTR("zSLi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_RealFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("zSPi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_RealFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = CFSTR("xRPE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  v25[4] = CFSTR("CHAS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  v25[5] = CFSTR("TB0T");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v4;
  v25[6] = CFSTR("TVRM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  v25[7] = CFSTR("TVBM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v8;
  v25[8] = CFSTR("TVBH");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("AccumulatedKeys");
  objc_msgSend(a1, "entryEventBackwardDefinitionAccumulatedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("PowerAccumulatedKeys");
  objc_msgSend(a1, "entryEventBackwardDefinitionPowerAccumulatedKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("DisplayPowerKeys");
  objc_msgSend(a1, "entryEventBackwardDefinitionDisplayPowerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)channelValueKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), a3, "channelValue");
}

+ (id)channelValueDiffKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), a3, "channelValueDiff");
}

+ (id)cycleCountKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), a3, "cycleCount");
}

+ (id)variantKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), a3, "variant");
}

+ (id)entryEventBackwardDefinitionDisplayPowerKeys
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLSMCAgent shouldModelDisplayPowerFromSMC](PLSMCAgent, "shouldModelDisplayPowerFromSMC"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652A20;
  v14[1] = CFSTR("logDisplayAPL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("PDLP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("PDEP");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitionAccumulatedKeys
{
  uint64_t v3;
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
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  _QWORD v311[101];
  _QWORD v312[101];
  _QWORD v313[2];
  _QWORD v314[2];
  _QWORD v315[2];
  _QWORD v316[4];

  v316[2] = *MEMORY[0x1E0C80C00];
  v315[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D80288];
  v313[0] = *MEMORY[0x1E0D80318];
  v313[1] = v3;
  v314[0] = &unk_1E8652A30;
  v314[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v314, v313, 2);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v316[0] = v310;
  v315[1] = *MEMORY[0x1E0D802F0];
  objc_msgSend(a1, "channelValueKey:", CFSTR("PH0C"));
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v311[0] = v309;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "commonTypeDict_RealFormat");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v312[0] = v307;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PH0C"));
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v311[1] = v306;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "commonTypeDict_IntegerFormat");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v312[1] = v304;
  objc_msgSend(a1, "variantKey:", CFSTR("PH0C"));
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v311[2] = v303;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "commonTypeDict_IntegerFormat");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v312[2] = v301;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PH1C"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v311[3] = v300;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "commonTypeDict_RealFormat");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v312[3] = v298;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PH1C"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v311[4] = v297;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "commonTypeDict_IntegerFormat");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v312[4] = v295;
  objc_msgSend(a1, "variantKey:", CFSTR("PH1C"));
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v311[5] = v294;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "commonTypeDict_IntegerFormat");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v312[5] = v292;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PH0R"));
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v311[6] = v291;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "commonTypeDict_RealFormat");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v312[6] = v289;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PH0R"));
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v311[7] = v288;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "commonTypeDict_IntegerFormat");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v312[7] = v286;
  objc_msgSend(a1, "variantKey:", CFSTR("PH0R"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v311[8] = v285;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "commonTypeDict_IntegerFormat");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v312[8] = v283;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PH1R"));
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v311[9] = v282;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "commonTypeDict_RealFormat");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v312[9] = v280;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PH1R"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v311[10] = v279;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "commonTypeDict_IntegerFormat");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v312[10] = v277;
  objc_msgSend(a1, "variantKey:", CFSTR("PH1R"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v311[11] = v276;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "commonTypeDict_IntegerFormat");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v312[11] = v274;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PM0C"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v311[12] = v273;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "commonTypeDict_RealFormat");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v312[12] = v271;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PM0C"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v311[13] = v270;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "commonTypeDict_IntegerFormat");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v312[13] = v268;
  objc_msgSend(a1, "variantKey:", CFSTR("PM0C"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v311[14] = v267;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "commonTypeDict_IntegerFormat");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v312[14] = v265;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PM1C"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v311[15] = v264;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "commonTypeDict_RealFormat");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v312[15] = v262;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PM1C"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v311[16] = v261;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "commonTypeDict_IntegerFormat");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v312[16] = v259;
  objc_msgSend(a1, "variantKey:", CFSTR("PM1C"));
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v311[17] = v258;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "commonTypeDict_IntegerFormat");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v312[17] = v256;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PC0R"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v311[18] = v255;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "commonTypeDict_RealFormat");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v312[18] = v253;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PC0R"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v311[19] = v252;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "commonTypeDict_IntegerFormat");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v312[19] = v250;
  objc_msgSend(a1, "variantKey:", CFSTR("PC0R"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v311[20] = v249;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "commonTypeDict_IntegerFormat");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v312[20] = v247;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PCPT"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v311[21] = v246;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "commonTypeDict_RealFormat");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v312[21] = v244;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PCPT"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v311[22] = v243;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "commonTypeDict_IntegerFormat");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v312[22] = v241;
  objc_msgSend(a1, "variantKey:", CFSTR("PCPT"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v311[23] = v240;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "commonTypeDict_IntegerFormat");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v312[23] = v238;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PG0R"));
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v311[24] = v237;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "commonTypeDict_RealFormat");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v312[24] = v235;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PG0R"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v311[25] = v234;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "commonTypeDict_IntegerFormat");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v312[25] = v232;
  objc_msgSend(a1, "variantKey:", CFSTR("PG0R"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v311[26] = v231;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "commonTypeDict_IntegerFormat");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v312[26] = v229;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PSTR"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v311[27] = v228;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "commonTypeDict_RealFormat");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v312[27] = v226;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PSTR"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v311[28] = v225;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "commonTypeDict_IntegerFormat");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v312[28] = v223;
  objc_msgSend(a1, "variantKey:", CFSTR("PSTR"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v311[29] = v222;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "commonTypeDict_IntegerFormat");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v312[29] = v220;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PBLR"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v311[30] = v219;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "commonTypeDict_RealFormat");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v312[30] = v217;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PBLR"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v311[31] = v216;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "commonTypeDict_IntegerFormat");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v312[31] = v214;
  objc_msgSend(a1, "variantKey:", CFSTR("PBLR"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v311[32] = v213;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "commonTypeDict_IntegerFormat");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v312[32] = v211;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PCAC"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v311[33] = v210;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "commonTypeDict_RealFormat");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v312[33] = v208;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PCAC"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v311[34] = v207;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "commonTypeDict_IntegerFormat");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v312[34] = v205;
  objc_msgSend(a1, "variantKey:", CFSTR("PCAC"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v311[35] = v204;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "commonTypeDict_IntegerFormat");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v312[35] = v202;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PCIC"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v311[36] = v201;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "commonTypeDict_RealFormat");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v312[36] = v199;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PCIC"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v311[37] = v198;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "commonTypeDict_IntegerFormat");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v312[37] = v196;
  objc_msgSend(a1, "variantKey:", CFSTR("PCIC"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v311[38] = v195;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "commonTypeDict_IntegerFormat");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v312[38] = v193;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PCPC"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v311[39] = v192;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "commonTypeDict_RealFormat");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v312[39] = v190;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PCPC"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v311[40] = v189;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "commonTypeDict_IntegerFormat");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v312[40] = v187;
  objc_msgSend(a1, "variantKey:", CFSTR("PCPC"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v311[41] = v186;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "commonTypeDict_IntegerFormat");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v312[41] = v184;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PCPG"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v311[42] = v183;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "commonTypeDict_RealFormat");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v312[42] = v181;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PCPG"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v311[43] = v180;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "commonTypeDict_IntegerFormat");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v312[43] = v178;
  objc_msgSend(a1, "variantKey:", CFSTR("PCPG"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v311[44] = v177;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "commonTypeDict_IntegerFormat");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v312[44] = v175;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PCTC"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v311[45] = v174;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "commonTypeDict_RealFormat");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v312[45] = v172;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PCTC"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v311[46] = v171;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "commonTypeDict_IntegerFormat");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v312[46] = v169;
  objc_msgSend(a1, "variantKey:", CFSTR("PCTC"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v311[47] = v168;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "commonTypeDict_IntegerFormat");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v312[47] = v166;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PG0C"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v311[48] = v165;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "commonTypeDict_RealFormat");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v312[48] = v163;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PG0C"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v311[49] = v162;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "commonTypeDict_IntegerFormat");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v312[49] = v160;
  objc_msgSend(a1, "variantKey:", CFSTR("PG0C"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v311[50] = v159;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "commonTypeDict_IntegerFormat");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v312[50] = v157;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PLDC"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v311[51] = v156;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "commonTypeDict_RealFormat");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v312[51] = v154;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PLDC"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v311[52] = v153;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "commonTypeDict_IntegerFormat");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v312[52] = v151;
  objc_msgSend(a1, "variantKey:", CFSTR("PLDC"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v311[53] = v150;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "commonTypeDict_IntegerFormat");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v312[53] = v148;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PMCC"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v311[54] = v147;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "commonTypeDict_RealFormat");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v312[54] = v145;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PMCC"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v311[55] = v144;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "commonTypeDict_IntegerFormat");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v312[55] = v142;
  objc_msgSend(a1, "variantKey:", CFSTR("PMCC"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v311[56] = v141;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "commonTypeDict_IntegerFormat");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v312[56] = v139;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PO5R"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v311[57] = v138;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "commonTypeDict_RealFormat");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v312[57] = v136;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PO5R"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v311[58] = v135;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "commonTypeDict_IntegerFormat");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v312[58] = v133;
  objc_msgSend(a1, "variantKey:", CFSTR("PO5R"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v311[59] = v132;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "commonTypeDict_IntegerFormat");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v312[59] = v130;
  objc_msgSend(a1, "channelValueKey:", CFSTR("POLR"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v311[60] = v129;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "commonTypeDict_RealFormat");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v312[60] = v127;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("POLR"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v311[61] = v126;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "commonTypeDict_IntegerFormat");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v312[61] = v124;
  objc_msgSend(a1, "variantKey:", CFSTR("POLR"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v311[62] = v123;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "commonTypeDict_IntegerFormat");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v312[62] = v121;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PORR"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v311[63] = v120;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "commonTypeDict_RealFormat");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v312[63] = v118;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PORR"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v311[64] = v117;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "commonTypeDict_IntegerFormat");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v312[64] = v115;
  objc_msgSend(a1, "variantKey:", CFSTR("PORR"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v311[65] = v114;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "commonTypeDict_IntegerFormat");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v312[65] = v112;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PPBR"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v311[66] = v111;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "commonTypeDict_RealFormat");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v312[66] = v109;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PPBR"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v311[67] = v108;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "commonTypeDict_IntegerFormat");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v312[67] = v106;
  objc_msgSend(a1, "variantKey:", CFSTR("PPBR"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v311[68] = v105;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "commonTypeDict_IntegerFormat");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v312[68] = v103;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PS1C"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v311[69] = v102;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "commonTypeDict_RealFormat");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v312[69] = v100;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PS1C"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v311[70] = v99;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "commonTypeDict_IntegerFormat");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v312[70] = v97;
  objc_msgSend(a1, "variantKey:", CFSTR("PS1C"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v311[71] = v96;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v312[71] = v94;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PSLC"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v311[72] = v93;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "commonTypeDict_RealFormat");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v312[72] = v91;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PSLC"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v311[73] = v90;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "commonTypeDict_IntegerFormat");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v312[73] = v88;
  objc_msgSend(a1, "variantKey:", CFSTR("PSLC"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v311[74] = v87;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v312[74] = v85;
  objc_msgSend(a1, "channelValueKey:", CFSTR("B0AP"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v311[75] = v84;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "commonTypeDict_RealFormat");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v312[75] = v82;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("B0AP"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v311[76] = v81;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "commonTypeDict_IntegerFormat");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v312[76] = v79;
  objc_msgSend(a1, "variantKey:", CFSTR("B0AP"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v311[77] = v78;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v312[77] = v76;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PG0R"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v311[78] = v75;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_RealFormat");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v312[78] = v73;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PG0R"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v311[79] = v72;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v312[79] = v70;
  objc_msgSend(a1, "variantKey:", CFSTR("PG0R"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v311[80] = v69;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v312[80] = v67;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PAPC"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v311[81] = v66;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_RealFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v312[81] = v64;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PAPC"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v311[82] = v63;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v312[82] = v61;
  objc_msgSend(a1, "variantKey:", CFSTR("PAPC"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v311[83] = v60;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v312[83] = v58;
  objc_msgSend(a1, "channelValueKey:", CFSTR("MSAc"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v311[84] = v57;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_RealFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v312[84] = v55;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("MSAc"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v311[85] = v54;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v312[85] = v52;
  objc_msgSend(a1, "variantKey:", CFSTR("MSAc"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v311[86] = v51;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v312[86] = v49;
  objc_msgSend(a1, "channelValueKey:", CFSTR("MSAg"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v311[87] = v48;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_RealFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v312[87] = v46;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("MSAg"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v311[88] = v45;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v312[88] = v43;
  objc_msgSend(a1, "variantKey:", CFSTR("MSAg"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v311[89] = v42;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v312[89] = v40;
  objc_msgSend(a1, "channelValueKey:", CFSTR("MSAi"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v311[90] = v39;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_RealFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v312[90] = v37;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("MSAi"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v311[91] = v36;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v312[91] = v34;
  objc_msgSend(a1, "variantKey:", CFSTR("MSAi"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v311[92] = v33;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v312[92] = v31;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PW3C"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v311[93] = v30;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_RealFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v312[93] = v28;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PW3C"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v311[94] = v27;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_RealFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v312[94] = v25;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PW3C"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v311[95] = v24;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v312[95] = v22;
  objc_msgSend(a1, "variantKey:", CFSTR("PW3C"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v311[96] = v21;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v312[96] = v19;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PO3R"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v311[97] = v18;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v312[97] = v16;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PO3R"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v311[98] = v15;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v312[98] = v5;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PO3R"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v311[99] = v6;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v312[99] = v8;
  objc_msgSend(a1, "variantKey:", CFSTR("PO3R"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v311[100] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v312[100] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v312, v311, 101);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v316[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v316, v315, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventBackwardDefinitionPowerAccumulatedKeys
{
  uint64_t v3;
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
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  _QWORD v392[128];
  _QWORD v393[128];
  _QWORD v394[2];
  _QWORD v395[2];
  _QWORD v396[2];
  _QWORD v397[4];

  v397[2] = *MEMORY[0x1E0C80C00];
  v396[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D80288];
  v394[0] = *MEMORY[0x1E0D80318];
  v394[1] = v3;
  v395[0] = &unk_1E8652A40;
  v395[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v395, v394, 2);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v397[0] = v391;
  v396[1] = *MEMORY[0x1E0D802F0];
  objc_msgSend(a1, "channelValueKey:", CFSTR("PBat"));
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v392[0] = v390;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v389, "commonTypeDict_RealFormat");
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v393[0] = v388;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PBat"));
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v392[1] = v387;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v386, "commonTypeDict_IntegerFormat");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v393[1] = v385;
  objc_msgSend(a1, "variantKey:", CFSTR("PBat"));
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v392[2] = v384;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v383, "commonTypeDict_IntegerFormat");
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v393[2] = v382;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PBat"));
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v392[3] = v381;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v380, "commonTypeDict_RealFormat");
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v393[3] = v379;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PSTR"));
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v392[4] = v378;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v377, "commonTypeDict_RealFormat");
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v393[4] = v376;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PSTR"));
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  v392[5] = v375;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v374, "commonTypeDict_IntegerFormat");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v393[5] = v373;
  objc_msgSend(a1, "variantKey:", CFSTR("PSTR"));
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v392[6] = v372;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v371, "commonTypeDict_IntegerFormat");
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v393[6] = v370;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PSTR"));
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v392[7] = v369;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v368, "commonTypeDict_RealFormat");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v393[7] = v367;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VBat"));
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v392[8] = v366;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "commonTypeDict_RealFormat");
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v393[8] = v364;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VBat"));
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  v392[9] = v363;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v362, "commonTypeDict_IntegerFormat");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v393[9] = v361;
  objc_msgSend(a1, "variantKey:", CFSTR("VBat"));
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v392[10] = v360;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v359, "commonTypeDict_IntegerFormat");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  v393[10] = v358;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VBat"));
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v392[11] = v357;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "commonTypeDict_RealFormat");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v393[11] = v355;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PDEP"));
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v392[12] = v354;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v353, "commonTypeDict_RealFormat");
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v393[12] = v352;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PDEP"));
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v392[13] = v351;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "commonTypeDict_IntegerFormat");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v393[13] = v349;
  objc_msgSend(a1, "variantKey:", CFSTR("PDEP"));
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v392[14] = v348;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v347, "commonTypeDict_IntegerFormat");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v393[14] = v346;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PDEP"));
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v392[15] = v345;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "commonTypeDict_RealFormat");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v393[15] = v343;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PDLP"));
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v392[16] = v342;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "commonTypeDict_RealFormat");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v393[16] = v340;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PDLP"));
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v392[17] = v339;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "commonTypeDict_IntegerFormat");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v393[17] = v337;
  objc_msgSend(a1, "variantKey:", CFSTR("PDLP"));
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v392[18] = v336;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "commonTypeDict_IntegerFormat");
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v393[18] = v334;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PDLP"));
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v392[19] = v333;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v332, "commonTypeDict_RealFormat");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v393[19] = v331;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP0b"));
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v392[20] = v330;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "commonTypeDict_RealFormat");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v393[20] = v328;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP0b"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v392[21] = v327;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "commonTypeDict_IntegerFormat");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v393[21] = v325;
  objc_msgSend(a1, "variantKey:", CFSTR("PP0b"));
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v392[22] = v324;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "commonTypeDict_IntegerFormat");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v393[22] = v322;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP0b"));
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v392[23] = v321;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "commonTypeDict_RealFormat");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v393[23] = v319;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP1b"));
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v392[24] = v318;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "commonTypeDict_RealFormat");
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v393[24] = v316;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP1b"));
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v392[25] = v315;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "commonTypeDict_IntegerFormat");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v393[25] = v313;
  objc_msgSend(a1, "variantKey:", CFSTR("PP1b"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v392[26] = v312;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "commonTypeDict_IntegerFormat");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v393[26] = v310;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP1b"));
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v392[27] = v309;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "commonTypeDict_RealFormat");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v393[27] = v307;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP2b"));
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v392[28] = v306;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "commonTypeDict_RealFormat");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v393[28] = v304;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP2b"));
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v392[29] = v303;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "commonTypeDict_IntegerFormat");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v393[29] = v301;
  objc_msgSend(a1, "variantKey:", CFSTR("PP2b"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v392[30] = v300;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "commonTypeDict_IntegerFormat");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v393[30] = v298;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP2b"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v392[31] = v297;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "commonTypeDict_RealFormat");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v393[31] = v295;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP3b"));
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v392[32] = v294;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "commonTypeDict_RealFormat");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v393[32] = v292;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP3b"));
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v392[33] = v291;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "commonTypeDict_IntegerFormat");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v393[33] = v289;
  objc_msgSend(a1, "variantKey:", CFSTR("PP3b"));
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v392[34] = v288;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "commonTypeDict_IntegerFormat");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v393[34] = v286;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP3b"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v392[35] = v285;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "commonTypeDict_RealFormat");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v393[35] = v283;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP4b"));
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v392[36] = v282;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "commonTypeDict_RealFormat");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v393[36] = v280;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP4b"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v392[37] = v279;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "commonTypeDict_IntegerFormat");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v393[37] = v277;
  objc_msgSend(a1, "variantKey:", CFSTR("PP4b"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v392[38] = v276;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "commonTypeDict_IntegerFormat");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v393[38] = v274;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP4b"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v392[39] = v273;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "commonTypeDict_RealFormat");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v393[39] = v271;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP5b"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v392[40] = v270;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "commonTypeDict_RealFormat");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v393[40] = v268;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP5b"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v392[41] = v267;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "commonTypeDict_IntegerFormat");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v393[41] = v265;
  objc_msgSend(a1, "variantKey:", CFSTR("PP5b"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v392[42] = v264;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "commonTypeDict_IntegerFormat");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v393[42] = v262;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP5b"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v392[43] = v261;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "commonTypeDict_RealFormat");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v393[43] = v259;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP6b"));
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v392[44] = v258;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "commonTypeDict_RealFormat");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v393[44] = v256;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP6b"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v392[45] = v255;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "commonTypeDict_IntegerFormat");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v393[45] = v253;
  objc_msgSend(a1, "variantKey:", CFSTR("PP6b"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v392[46] = v252;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "commonTypeDict_IntegerFormat");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v393[46] = v250;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP6b"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v392[47] = v249;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "commonTypeDict_RealFormat");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v393[47] = v247;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP7b"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v392[48] = v246;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "commonTypeDict_RealFormat");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v393[48] = v244;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP7b"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v392[49] = v243;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "commonTypeDict_IntegerFormat");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v393[49] = v241;
  objc_msgSend(a1, "variantKey:", CFSTR("PP7b"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v392[50] = v240;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "commonTypeDict_IntegerFormat");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v393[50] = v238;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP7b"));
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v392[51] = v237;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "commonTypeDict_RealFormat");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v393[51] = v235;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP8b"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v392[52] = v234;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "commonTypeDict_RealFormat");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v393[52] = v232;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP8b"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v392[53] = v231;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "commonTypeDict_IntegerFormat");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v393[53] = v229;
  objc_msgSend(a1, "variantKey:", CFSTR("PP8b"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v392[54] = v228;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "commonTypeDict_IntegerFormat");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v393[54] = v226;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP8b"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v392[55] = v225;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "commonTypeDict_RealFormat");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v393[55] = v223;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PP9b"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v392[56] = v222;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "commonTypeDict_RealFormat");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v393[56] = v220;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PP9b"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v392[57] = v219;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "commonTypeDict_IntegerFormat");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v393[57] = v217;
  objc_msgSend(a1, "variantKey:", CFSTR("PP9b"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v392[58] = v216;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "commonTypeDict_IntegerFormat");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v393[58] = v214;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PP9b"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v392[59] = v213;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "commonTypeDict_RealFormat");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v393[59] = v211;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PPab"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v392[60] = v210;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "commonTypeDict_RealFormat");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v393[60] = v208;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PPab"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v392[61] = v207;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "commonTypeDict_IntegerFormat");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v393[61] = v205;
  objc_msgSend(a1, "variantKey:", CFSTR("PPab"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v392[62] = v204;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "commonTypeDict_IntegerFormat");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v393[62] = v202;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PPab"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v392[63] = v201;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "commonTypeDict_RealFormat");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v393[63] = v199;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PPbb"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v392[64] = v198;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "commonTypeDict_RealFormat");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v393[64] = v196;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PPbb"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v392[65] = v195;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "commonTypeDict_IntegerFormat");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v393[65] = v193;
  objc_msgSend(a1, "variantKey:", CFSTR("PPbb"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v392[66] = v192;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "commonTypeDict_IntegerFormat");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v393[66] = v190;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PPbb"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v392[67] = v189;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "commonTypeDict_RealFormat");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v393[67] = v187;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PPdb"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v392[68] = v186;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "commonTypeDict_RealFormat");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v393[68] = v184;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PPdb"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v392[69] = v183;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "commonTypeDict_IntegerFormat");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v393[69] = v181;
  objc_msgSend(a1, "variantKey:", CFSTR("PPdb"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v392[70] = v180;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "commonTypeDict_IntegerFormat");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v393[70] = v178;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PPdb"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v392[71] = v177;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "commonTypeDict_RealFormat");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v393[71] = v175;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP0b"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v392[72] = v174;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "commonTypeDict_RealFormat");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v393[72] = v172;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP0b"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v392[73] = v171;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "commonTypeDict_IntegerFormat");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v393[73] = v169;
  objc_msgSend(a1, "variantKey:", CFSTR("VP0b"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v392[74] = v168;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "commonTypeDict_IntegerFormat");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v393[74] = v166;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP0b"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v392[75] = v165;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "commonTypeDict_RealFormat");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v393[75] = v163;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP1b"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v392[76] = v162;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "commonTypeDict_RealFormat");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v393[76] = v160;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP1b"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v392[77] = v159;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "commonTypeDict_IntegerFormat");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v393[77] = v157;
  objc_msgSend(a1, "variantKey:", CFSTR("VP1b"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v392[78] = v156;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "commonTypeDict_IntegerFormat");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v393[78] = v154;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP1b"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v392[79] = v153;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "commonTypeDict_RealFormat");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v393[79] = v151;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP2b"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v392[80] = v150;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "commonTypeDict_RealFormat");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v393[80] = v148;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP2b"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v392[81] = v147;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "commonTypeDict_IntegerFormat");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v393[81] = v145;
  objc_msgSend(a1, "variantKey:", CFSTR("VP2b"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v392[82] = v144;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "commonTypeDict_IntegerFormat");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v393[82] = v142;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP2b"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v392[83] = v141;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "commonTypeDict_RealFormat");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v393[83] = v139;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP3b"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v392[84] = v138;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "commonTypeDict_RealFormat");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v393[84] = v136;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP3b"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v392[85] = v135;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "commonTypeDict_IntegerFormat");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v393[85] = v133;
  objc_msgSend(a1, "variantKey:", CFSTR("VP3b"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v392[86] = v132;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "commonTypeDict_IntegerFormat");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v393[86] = v130;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP3b"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v392[87] = v129;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "commonTypeDict_RealFormat");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v393[87] = v127;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP4b"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v392[88] = v126;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "commonTypeDict_RealFormat");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v393[88] = v124;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP4b"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v392[89] = v123;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "commonTypeDict_IntegerFormat");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v393[89] = v121;
  objc_msgSend(a1, "variantKey:", CFSTR("VP4b"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v392[90] = v120;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "commonTypeDict_IntegerFormat");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v393[90] = v118;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP4b"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v392[91] = v117;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "commonTypeDict_RealFormat");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v393[91] = v115;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP5b"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v392[92] = v114;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "commonTypeDict_RealFormat");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v393[92] = v112;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP5b"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v392[93] = v111;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "commonTypeDict_IntegerFormat");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v393[93] = v109;
  objc_msgSend(a1, "variantKey:", CFSTR("VP5b"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v392[94] = v108;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "commonTypeDict_IntegerFormat");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v393[94] = v106;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP5b"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v392[95] = v105;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "commonTypeDict_RealFormat");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v393[95] = v103;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP6b"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v392[96] = v102;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "commonTypeDict_RealFormat");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v393[96] = v100;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP6b"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v392[97] = v99;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "commonTypeDict_IntegerFormat");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v393[97] = v97;
  objc_msgSend(a1, "variantKey:", CFSTR("VP6b"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v392[98] = v96;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v393[98] = v94;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP6b"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v392[99] = v93;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "commonTypeDict_RealFormat");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v393[99] = v91;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP7b"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v392[100] = v90;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "commonTypeDict_RealFormat");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v393[100] = v88;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP7b"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v392[101] = v87;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v393[101] = v85;
  objc_msgSend(a1, "variantKey:", CFSTR("VP7b"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v392[102] = v84;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v393[102] = v82;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP7b"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v392[103] = v81;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "commonTypeDict_RealFormat");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v393[103] = v79;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP8b"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v392[104] = v78;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_RealFormat");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v393[104] = v76;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP8b"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v392[105] = v75;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_IntegerFormat");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v393[105] = v73;
  objc_msgSend(a1, "variantKey:", CFSTR("VP8b"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v392[106] = v72;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v393[106] = v70;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP8b"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v392[107] = v69;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_RealFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v393[107] = v67;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VP9b"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v392[108] = v66;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_RealFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v393[108] = v64;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VP9b"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v392[109] = v63;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v393[109] = v61;
  objc_msgSend(a1, "variantKey:", CFSTR("VP9b"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v392[110] = v60;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v393[110] = v58;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VP9b"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v392[111] = v57;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_RealFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v393[111] = v55;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VPab"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v392[112] = v54;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_RealFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v393[112] = v52;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VPab"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v392[113] = v51;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v393[113] = v49;
  objc_msgSend(a1, "variantKey:", CFSTR("VPab"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v392[114] = v48;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v393[114] = v46;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VPab"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v392[115] = v45;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_RealFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v393[115] = v43;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VPbb"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v392[116] = v42;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_RealFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v393[116] = v40;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VPbb"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v392[117] = v39;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v393[117] = v37;
  objc_msgSend(a1, "variantKey:", CFSTR("VPbb"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v392[118] = v36;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v393[118] = v34;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VPbb"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v392[119] = v33;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_RealFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v393[119] = v31;
  objc_msgSend(a1, "channelValueKey:", CFSTR("VPdb"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v392[120] = v30;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_RealFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v393[120] = v28;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("VPdb"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v392[121] = v27;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v393[121] = v25;
  objc_msgSend(a1, "variantKey:", CFSTR("VPdb"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v392[122] = v24;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v393[122] = v22;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("VPdb"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v392[123] = v21;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_RealFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v393[123] = v19;
  objc_msgSend(a1, "channelValueKey:", CFSTR("PR4b"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v392[124] = v18;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v393[124] = v16;
  objc_msgSend(a1, "cycleCountKey:", CFSTR("PR4b"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v392[125] = v15;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v393[125] = v5;
  objc_msgSend(a1, "variantKey:", CFSTR("PR4b"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v392[126] = v6;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v393[126] = v8;
  objc_msgSend(a1, "channelValueDiffKey:", CFSTR("PR4b"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v392[127] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_RealFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v393[127] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v393, v392, 128);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v397[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v397, v396, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventNoneDefinitionPowerDeliveryKeys
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitionDRAMVendorKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8652A20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("MDSV");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("PowerDeliveryKeys");
  objc_msgSend(a1, "entryEventNoneDefinitionPowerDeliveryKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("DRAMVendorKey");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventNoneDefinitionDRAMVendorKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLSMCAgent)init
{
  PLSMCAgent *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *lastAccumValueDict;
  NSMutableDictionary *v5;
  NSMutableDictionary *lastAccumCycleCountDict;
  NSDictionary *lastAccumlatedKeysSample;
  NSDictionary *lastAccumlatedKeysSampleCA;
  PLTimer *thermalAggregationTimer;
  NSDictionary *lastDisplayAccumlatedSample;
  uint64_t v11;
  NSDate *lastDisplayAccumulatedSampleEndDate;
  PLEntry *lastThermalInstantEntry;
  PLTimer *thermalLoggingTimer;
  NSDictionary *lastPowerAccumlatedSample;
  NSDictionary *lastPowerAccumlatedSampleCA;
  PLSMCAgent *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PLSMCAgent;
  v2 = -[PLAgent init](&v19, sel_init);
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd")
    && +[PLSMCAgent supportsBasicSMC](PLSMCAgent, "supportsBasicSMC")
    || +[PLSMCAgent supportsThermalSMC](PLSMCAgent, "supportsThermalSMC"))
  {
    if (v2)
    {
      v2->_smcConnection = ($9CEE2F78D9152958F56DF80F82CC2BF0 *)SMCOpenConnectionWithDefaultService();
      v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      lastAccumValueDict = v2->_lastAccumValueDict;
      v2->_lastAccumValueDict = v3;

      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      lastAccumCycleCountDict = v2->_lastAccumCycleCountDict;
      v2->_lastAccumCycleCountDict = v5;

      lastAccumlatedKeysSample = v2->_lastAccumlatedKeysSample;
      v2->_lastAccumlatedKeysSample = 0;

      lastAccumlatedKeysSampleCA = v2->_lastAccumlatedKeysSampleCA;
      v2->_lastAccumlatedKeysSampleCA = 0;

      thermalAggregationTimer = v2->_thermalAggregationTimer;
      v2->_thermalAggregationTimer = 0;

      lastDisplayAccumlatedSample = v2->_lastDisplayAccumlatedSample;
      v2->_lastDisplayAccumlatedSample = 0;

      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v11 = objc_claimAutoreleasedReturnValue();
      lastDisplayAccumulatedSampleEndDate = v2->_lastDisplayAccumulatedSampleEndDate;
      v2->_lastDisplayAccumulatedSampleEndDate = (NSDate *)v11;

      lastThermalInstantEntry = v2->_lastThermalInstantEntry;
      v2->_lastThermalInstantEntry = 0;

      thermalLoggingTimer = v2->_thermalLoggingTimer;
      v2->_thermalLoggingTimer = 0;

      lastPowerAccumlatedSample = v2->_lastPowerAccumlatedSample;
      v2->_lastPowerAccumlatedSample = 0;

      lastPowerAccumlatedSampleCA = v2->_lastPowerAccumlatedSampleCA;
      v2->_lastPowerAccumlatedSampleCA = 0;

    }
    v17 = v2;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)initOperatorDependancies
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PLEntryNotificationOperatorComposition *v7;
  PLEntryNotificationOperatorComposition *sbc;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  id location;

  if (+[PLSMCAgent supportsThermalSMC](PLSMCAgent, "supportsThermalSMC"))
  {
    v3 = -[PLSMCAgent accumSupported](self, "accumSupported");
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D80038], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSMCAgent setStateTracker:](self, "setStateTracker:", v5);

      -[PLSMCAgent stateTracker](self, "stateTracker");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v4;
      v26[1] = 3221225472;
      v26[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke;
      v26[3] = &unk_1E8579578;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v6, "registerForStates:withOperator:withBlock:", 57, self, v26);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    v25[0] = v4;
    v25[1] = 3221225472;
    v25[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_2;
    v25[3] = &unk_1E8577F48;
    v25[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v25);
    v7 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
    sbc = self->_sbc;
    self->_sbc = v7;

    if (+[PLSMCAgent shouldModelDisplayPowerFromSMC](PLSMCAgent, "shouldModelDisplayPowerFromSMC")
      && -[PLSMCAgent accumSupported](self, "accumSupported"))
    {
      +[PLOperator entryKeyForType:andName:](PLScreenStateAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ScreenState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D7FFC8]);
      v24[0] = v4;
      v24[1] = 3221225472;
      v24[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_3;
      v24[3] = &unk_1E8577F48;
      v24[4] = self;
      v11 = (void *)objc_msgSend(v10, "initWithOperator:forEntryKey:withFilter:withBlock:", self, v9, MEMORY[0x1E0C9AA70], v24);
      -[PLSMCAgent setScreenStateNotification:](self, "setScreenStateNotification:", v11);

    }
    v12 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_4;
    v23[3] = &unk_1E8578078;
    v23[4] = self;
    v15 = (void *)objc_msgSend(v12, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v13, 1, 0, v14, v23, 60.0, 0.0);
    -[PLSMCAgent setThermalMonitorTimer:](self, "setThermalMonitorTimer:", v15);

    -[PLSMCAgent thermalMonitorTimer](self, "thermalMonitorTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arm");

    v17 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_5;
    v22[3] = &unk_1E8578078;
    v22[4] = self;
    v20 = (void *)objc_msgSend(v17, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v18, 1, 0, v19, v22, 600.0, 0.0);
    -[PLSMCAgent setThermalAggregationTimer:](self, "setThermalAggregationTimer:", v20);

    -[PLSMCAgent thermalAggregationTimer](self, "thermalAggregationTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arm");

    -[PLSMCAgent logDRAMVendorKey](self, "logDRAMVendorKey");
    if (+[PLSMCAgent shouldModelDisplayPowerFromSMC](PLSMCAgent, "shouldModelDisplayPowerFromSMC"))
    {
      if (-[PLSMCAgent accumSupported](self, "accumSupported"))
        -[PLSMCAgent logDisplayPower](self, "logDisplayPower");
    }
  }
}

void __38__PLSMCAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleStateChangeForSMCStats");

}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = +[PLSMCAgent supportsThermalSMC](PLSMCAgent, "supportsThermalSMC");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "parseThermalThresholds:thermalPressure:virtualTemp:thermalLevel:", 0, 0, 1, 0);
  return result;
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logThermalAggregationKeysToCA");
}

- (void)dealloc
{
  objc_super v3;

  if (-[PLSMCAgent smcConnection](self, "smcConnection"))
  {
    -[PLSMCAgent smcConnection](self, "smcConnection");
    SMCCloseConnection();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLSMCAgent;
  -[PLAgent dealloc](&v3, sel_dealloc);
}

- (void)log
{
  id v3;

  -[PLSMCAgent logThermalInstantAndAccumlatedKeys](self, "logThermalInstantAndAccumlatedKeys");
  if (-[PLSMCAgent accumSupported](self, "accumSupported"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PLSMCAgent logAccumulatedKeysToPowerlog:ToCoreAnalytics:withDate:isWake:](self, "logAccumulatedKeysToPowerlog:ToCoreAnalytics:withDate:isWake:", 1, 1, v3, 0);

  }
}

- (void)logEventPointThermalKeys
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ThermalKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PLSMCAgent thermalKeys](self, "thermalKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[PLSMCAgent readKey:](self, "readKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[PLOperator logEntry:](self, "logEntry:", v4);
}

- (void)logEventPointMetricMonitorInstantKeys
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("MetricMonitorInstantKeys"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PLSMCAgent metricMonitorInstantKeys](self, "metricMonitorInstantKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[PLSMCAgent readKey:](self, "readKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

    v17 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator postEntries:](self, "postEntries:", v12);

  }
}

- (id)sampleAccumulatedKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  id obj;
  _QWORD block[5];
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
        v22 = 0.0;
        v23 = 0;
        if (-[PLSMCAgent readKeyViaOSAccum:toOutput:](self, "readKeyViaOSAccum:toOutput:", v9, &v22))
        {
          +[PLSMCOutputObject objectWithChannelValue:cycleCount:variant:](PLSMCOutputObject, "objectWithChannelValue:cycleCount:variant:", v23, BYTE4(v23), v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v9);

        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v11 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __36__PLSMCAgent_sampleAccumulatedKeys___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v11;
          if (qword_1ED882630 != -1)
            dispatch_once(&qword_1ED882630, block);
          if (_MergedGlobals_1_12)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccumulatedKeys: keyName=%@, channelValue=%f, cycleCount=%d, variant=%d"), v9, *(_QWORD *)&v22, v23, BYTE4(v23));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLSMCAgent.m");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSMCAgent sampleAccumulatedKeys:]");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 2279);

            PLLogCommon();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v12;
              _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v6);
  }

  return v19;
}

uint64_t __36__PLSMCAgent_sampleAccumulatedKeys___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_12 = result;
  return result;
}

- (id)resetAccumulatedKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 138412290;
    v16 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[PLSMCAgent SMCKeyExists:](self, "SMCKeyExists:", v12, v16, (_QWORD)v17))
        {
          +[PLSMCOutputObject objectWithChannelValue:cycleCount:variant:](PLSMCOutputObject, "objectWithChannelValue:cycleCount:variant:", 0, 0, 0.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);
          PLLogSMC();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            v22 = v12;
            _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "ExistingKeys: keyName=%@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)getPowerEntryFromSample:(id)a3 lastSample:(id)a4 withEntryKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PLSMCAgent_getPowerEntryFromSample_lastSample_withEntryKey___block_invoke;
    v12[3] = &unk_1E85795A0;
    v13 = v8;
    v14 = &v15;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __62__PLSMCAgent_getPowerEntryFromSample_lastSample_withEntryKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  unsigned int v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (v9 = objc_msgSend(v7, "cycleCount"), v9 < objc_msgSend(v5, "cycleCount"))
      && (objc_msgSend(v5, "channelValue"),
          v11 = v10,
          objc_msgSend(v8, "channelValue"),
          v13 = v12,
          v14 = objc_msgSend(v5, "cycleCount") - v9,
          v14 > 0))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v11 - v13) / (double)v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v15, v22);

    }
    else
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = 0;

    }
  }
  else if (objc_msgSend(v5, "cycleCount"))
  {
    objc_msgSend(v5, "channelValue");
    v19 = v18;
    v20 = objc_msgSend(v5, "cycleCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 / (double)v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, v22);
  }
  else
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;
  }

}

- (id)getAccumEntryFromSample:(id)a3 lastSample:(id)a4 withEntryKey:(id)a5 withDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v11, v13);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__PLSMCAgent_getAccumEntryFromSample_lastSample_withEntryKey_withDate___block_invoke;
    v19[3] = &unk_1E85795C8;
    v15 = v14;
    v20 = v15;
    v21 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);
    v16 = v21;
    v17 = v15;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __71__PLSMCAgent_getAccumEntryFromSample_lastSample_withEntryKey_withDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
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
  unsigned int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a2;
  v5 = a3;
  +[PLSMCAgent channelValueKey:](PLSMCAgent, "channelValueKey:", v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "definedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "channelValue");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "cycleCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 32);
  +[PLSMCAgent cycleCountKey:](PLSMCAgent, "cycleCountKey:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v5, "variant"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 32);
  +[PLSMCAgent variantKey:](PLSMCAgent, "variantKey:", v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  +[PLSMCAgent channelValueDiffKey:](PLSMCAgent, "channelValueDiffKey:", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "definedKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v18, "containsObject:", v17);

  if ((_DWORD)v16)
  {
    v19 = *(void **)(a1 + 40);
    if (v19)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = objc_msgSend(v20, "cycleCount");
        if (v22 <= objc_msgSend(v5, "cycleCount"))
        {
          objc_msgSend(v5, "channelValue");
          v24 = v23;
          objc_msgSend(v21, "channelValue");
          v26 = v24 - v25;
          v27 = (void *)MEMORY[0x1E0CB37E8];
          v28 = (void *)MEMORY[0x1E0D80078];
LABEL_10:
          objc_msgSend(v28, "roundToSigFigDouble:withSigFig:", 4, v26);
          objc_msgSend(v27, "numberWithDouble:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v30, v17);

          goto LABEL_11;
        }
      }
    }
    else
    {
      v21 = 0;
    }
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v29 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v5, "channelValue");
    v28 = v29;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)logAccumKeysToCA:(id)a3 withLastSample:(id)a4 andDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PLStateTrackingComposition *stateTracker;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9 && a5)
  {
    stateTracker = self->_stateTracker;
    v12 = a5;
    -[PLStateTrackingComposition getState:beforeDate:](stateTracker, "getState:beforeDate:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLStateTrackingComposition getState:beforeDate:](self->_stateTracker, "getState:beforeDate:", 8, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      PLLogSMC();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "Log Power Accumulated Keys to CA", buf, 2u);
      }

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54__PLSMCAgent_logAccumKeysToCA_withLastSample_andDate___block_invoke;
      v17[3] = &unk_1E8579618;
      v18 = v10;
      v19 = v13;
      v20 = v14;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);

    }
  }

}

void __54__PLSMCAgent_logAccumKeysToCA_withLastSample_andDate___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "cycleCount");
    if (v9 <= objc_msgSend(v6, "cycleCount"))
    {
      objc_msgSend(v6, "cycleCount");
      objc_msgSend(v8, "cycleCount");
      objc_msgSend(v6, "channelValue");
      objc_msgSend(v8, "channelValue");
      v10 = v5;
      v11 = a1[5];
      v12 = a1[6];
      AnalyticsSendEventLazy();

    }
  }

}

id __54__PLSMCAgent_logAccumKeysToCA_withLastSample_andDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v9[0] = *(_QWORD *)(a1 + 32);
  v8[0] = CFSTR("KeyName");
  v8[1] = CFSTR("ChannelValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  v8[2] = CFSTR("CycleCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9[2] = v3;
  v9[3] = v4;
  v8[3] = CFSTR("Plugged");
  v8[4] = CFSTR("Wake");
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)logDisplayPower
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PLSMCAgent_logDisplayPower__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __29__PLSMCAgent_logDisplayPower__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "smcConnection"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "displayAccumulatedKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sampleAccumulatedKeys:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("DisplayPowerKeys"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "lastDisplayAccumlatedSample");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getPowerEntryFromSample:lastSample:withEntryKey:", v4, v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "logEntry:", v8);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PDEP"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PDLP"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = (v11 + v13) * 1000.0;

        objc_msgSend(*(id *)(a1 + 32), "lastDisplayAccumulatedSampleEndDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 56, v15, v17, v14);

        objc_msgSend(*(id *)(a1 + 32), "setLastDisplayAccumlatedSample:", v4);
        objc_msgSend(v8, "entryDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setLastDisplayAccumulatedSampleEndDate:", v18);

      }
    }
    else
    {
      PLLogSMC();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_ERROR, "Failed to sample OSAccumulator channel", buf, 2u);
      }

      v4 = 0;
    }
  }
  else
  {
    PLLogSMC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "Failed to log, invalid SMC connection", v20, 2u);
    }
  }

}

- (void)logAccumulatedKeysToPowerlog:(BOOL)a3 ToCoreAnalytics:(BOOL)a4 withDate:(id)a5 isWake:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v9 = a5;
  if (v7 || v6)
  {
    v16 = v9;
    -[PLSMCAgent powerAccumulatedKeys](self, "powerAccumulatedKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSMCAgent sampleAccumulatedKeys:](self, "sampleAccumulatedKeys:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PLSMCAgent lastPowerAccumlatedSample](self, "lastPowerAccumlatedSample");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("PowerAccumulatedKeys"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSMCAgent getAccumEntryFromSample:lastSample:withEntryKey:withDate:](self, "getAccumEntryFromSample:lastSample:withEntryKey:withDate:", v11, v12, v13, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLOperator logEntry:](self, "logEntry:", v14);
      -[PLSMCAgent setLastPowerAccumlatedSample:](self, "setLastPowerAccumlatedSample:", v11);

    }
    if (v6)
    {
      -[PLSMCAgent lastPowerAccumlatedSampleCA](self, "lastPowerAccumlatedSampleCA");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSMCAgent logAccumKeysToCA:withLastSample:andDate:](self, "logAccumKeysToCA:withLastSample:andDate:", v11, v15, v16);

      -[PLSMCAgent setLastPowerAccumlatedSampleCA:](self, "setLastPowerAccumlatedSampleCA:", v11);
    }

    v9 = v16;
  }

}

- (void)handleStateChangeForSMCStats
{
  void *v3;
  void *v4;
  int v5;
  NSDictionary *lastDisplayAccumlatedSample;
  NSDate *v7;
  NSDate *lastDisplayAccumulatedSampleEndDate;
  id v9;

  if (-[PLStateTrackingComposition stateChanged:](self->_stateTracker, "stateChanged:", 16))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSMCAgent logAccumulatedKeysToPowerlog:ToCoreAnalytics:withDate:isWake:](self, "logAccumulatedKeysToPowerlog:ToCoreAnalytics:withDate:isWake:", 1, 0, v3, 1);

  }
  if (-[PLStateTrackingComposition stateChanged:](self->_stateTracker, "stateChanged:", 32))
  {
    -[PLStateTrackingComposition getLastState:](self->_stateTracker, "getLastState:", 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
    {
      -[PLSMCAgent setLastAccumlatedKeysSample:](self, "setLastAccumlatedKeysSample:", 0);
      -[PLSMCAgent setLastAccumlatedKeysSampleCA:](self, "setLastAccumlatedKeysSampleCA:", 0);
      if (+[PLSMCAgent shouldModelDisplayPowerFromSMC](PLSMCAgent, "shouldModelDisplayPowerFromSMC"))
      {
        if (-[PLSMCAgent accumSupported](self, "accumSupported"))
        {
          lastDisplayAccumlatedSample = self->_lastDisplayAccumlatedSample;
          self->_lastDisplayAccumlatedSample = 0;

          objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
          v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
          lastDisplayAccumulatedSampleEndDate = self->_lastDisplayAccumulatedSampleEndDate;
          self->_lastDisplayAccumulatedSampleEndDate = v7;

          -[PLSMCAgent logDisplayPower](self, "logDisplayPower");
        }
      }
    }
  }
  -[PLStateTrackingComposition getSystemStateChangeTime](self->_stateTracker, "getSystemStateChangeTime");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSMCAgent logAccumulatedKeysToPowerlog:ToCoreAnalytics:withDate:isWake:](self, "logAccumulatedKeysToPowerlog:ToCoreAnalytics:withDate:isWake:", 0, 1, v9, 0);

}

- (void)logThermalAggregationKeysToCA
{
  PLStateTrackingComposition *stateTracker;
  void *v4;
  void *v5;
  PLStateTrackingComposition *v6;
  void *v7;
  void *v8;
  PLStateTrackingComposition *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[16];

  stateTracker = self->_stateTracker;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStateTrackingComposition getState:beforeDate:](stateTracker, "getState:beforeDate:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self->_stateTracker;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStateTrackingComposition getState:beforeDate:](v6, "getState:beforeDate:", 8, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->_stateTracker;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStateTrackingComposition getState:beforeDate:](v9, "getState:beforeDate:", 64, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  PLLogSMC();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "Log Thermal Aggregated Keys to CA", buf, 2u);
  }

  v14 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 ^ 1u);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v5, CFSTR("Plugged"), v8, CFSTR("Wake"), v15, CFSTR("Active"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSMCAgent thermalAggregationKeys](self, "thermalAggregationKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke;
  v21[3] = &unk_1E8579640;
  v21[4] = self;
  v18 = v16;
  v22 = v18;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v21);
  v20 = v18;
  v19 = v18;
  AnalyticsSendEventLazy();

}

void __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "readKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("SDTO")))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("_"));
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "doubleValue");
    objc_msgSend(MEMORY[0x1E0D80078], "roundToSigFigDouble:withSigFig:", 1);
    v7 = 10.0;
    v8 = v6 >= 5.0 && v6 < 10.0;
    if (!v8)
      v7 = v6;
    v8 = v6 < 5.0;
    v9 = 1.0;
    if (!v8)
      v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
    v3 = (id)v5;
  }
  PLLogSMC();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "logging key to CA: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);

}

id __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke_457(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)accumSupported
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PLSMCAgent_accumSupported__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED882638 != -1)
    dispatch_once(&qword_1ED882638, block);
  return byte_1ED882611;
}

uint64_t __28__PLSMCAgent_accumSupported__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "smcConnection");
  result = SMCOSAccumIsSupported();
  byte_1ED882611 = result;
  return result;
}

- (BOOL)writeKeyNumeric:(id)a3 withValue:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  _BYTE v23[24];
  uint8_t buf[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    PLLogSMC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v16 = "Not a valid key name";
    v17 = v15;
    v18 = 2;
LABEL_13:
    _os_log_error_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_10;
  }
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "UTF8String");
  v9 = SMCMakeUInt32Key();
  if (v9)
  {
    v10 = v9;
    *(_QWORD *)buf = 0;
    v25 = 0;
    v26 = 0;
    -[PLSMCAgent smcConnection](self, "smcConnection");
    v11 = SMCGetKeyInfo();
    if (v11)
    {
      v12 = v11;
      PLLogSMC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v23 = 67109376;
        *(_DWORD *)&v23[4] = v10;
        *(_WORD *)&v23[8] = 1024;
        *(_DWORD *)&v23[10] = v12;
        v14 = "SMCGetKeyInfo for %u key failed with %d";
LABEL_6:
        _os_log_error_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_ERROR, v14, v23, 0xEu);
      }
    }
    else
    {
      -[PLSMCAgent smcConnection](self, "smcConnection", *(_OWORD *)v23, *(_QWORD *)&v23[16]);
      v20 = SMCWriteKeyAsNumeric();
      PLLogSMC();
      v21 = objc_claimAutoreleasedReturnValue();
      v13 = v21;
      if (!v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v23 = 138412546;
          *(_QWORD *)&v23[4] = v8;
          *(_WORD *)&v23[12] = 2048;
          *(_QWORD *)&v23[14] = a4;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@: %llu", v23, 0x16u);
        }
        v19 = 1;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v23 = 67109376;
        *(_DWORD *)&v23[4] = v10;
        *(_WORD *)&v23[8] = 1024;
        *(_DWORD *)&v23[10] = v20;
        v14 = "Writing to %u key failed with %d";
        goto LABEL_6;
      }
    }
    v19 = 0;
LABEL_17:

    goto LABEL_18;
  }
  PLLogSMC();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 0;
    v16 = "SMCMakeUInt32Key for %u key returned 0";
    v17 = v15;
    v18 = 8;
    goto LABEL_13;
  }
LABEL_10:

  v19 = 0;
LABEL_18:

  return v19;
}

- (BOOL)sampleKey:(id *)a3 forKey:(unsigned int)a4
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[PLSMCAgent getChannelInfo:](self, "getChannelInfo:", *(_QWORD *)&a4))
  {
    PLLogSMC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a4;
      v7 = "Fail to fetch channelInfo for key %u";
      v8 = v6;
      v9 = 8;
      goto LABEL_10;
    }
LABEL_6:

    return 0;
  }
  -[PLSMCAgent smcConnection](self, "smcConnection");
  if (SMCOSAccumSampleChannel())
  {
    PLLogSMC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      v7 = "SMCOSAccumSampleChannel fails";
      v8 = v6;
      v9 = 2;
LABEL_10:
      _os_log_error_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)v11, v9);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  return 1;
}

- (const)getChannelInfo:(unsigned int)a3
{
  const SMCAccumChannelInfo *ChannelInfoForKey;
  NSObject *v4;
  uint8_t v6[16];

  -[PLSMCAgent smcConnection](self, "smcConnection");
  ChannelInfoForKey = (const SMCAccumChannelInfo *)SMCAccumGetChannelInfoForKey();
  if (!ChannelInfoForKey)
  {
    PLLogSMC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "Invalid reference to SMCAccumChannelInfo", v6, 2u);
    }

  }
  return ChannelInfoForKey;
}

- (BOOL)SMCKeyExists:(id)a3
{
  int v4;

  if (a3)
  {
    objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    v4 = SMCMakeUInt32Key();
    if (v4)
    {
      -[PLSMCAgent smcConnection](self, "smcConnection");
      LOBYTE(v4) = SMCGetKeyInfo() == 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)readKeyViaOSAccum:(id)a3 toOutput:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "UTF8String");
  v9 = SMCMakeUInt32Key();
  if ((_DWORD)v9)
  {
    -[PLSMCAgent smcConnection](self, "smcConnection");
    if (SMCGetKeyInfo())
    {
LABEL_4:
      LOBYTE(v9) = 0;
      goto LABEL_5;
    }
    if (-[PLSMCAgent sampleKey:forKey:](self, "sampleKey:forKey:", a4, v9))
    {
      if (a4->var1)
      {
        PLLogSMC();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = (const char *)v8;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Accumulated key: %@", buf, 0xCu);
        }
        LOBYTE(v9) = 1;
        goto LABEL_16;
      }
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_4;
      v12 = objc_opt_class();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke_471;
      v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      v22 = v12;
      if (qword_1ED882650 != -1)
        dispatch_once(&qword_1ED882650, &v18);
      if (!byte_1ED882614)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Returned cycleCount is zero for %u key, returning kSMCReturnError"), "-[PLSMCAgent readKeyViaOSAccum:toOutput:]", v9, v18, v19, v20, v21, v22);
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLSMCAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSMCAgent readKeyViaOSAccum:toOutput:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v15, v16, 2920);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = (const char *)v11;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    else
    {
      PLLogSMC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[PLSMCAgent readKeyViaOSAccum:toOutput:]";
        v28 = 1024;
        v29 = v9;
        _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "%s: %u key call to sampleKey failed, returning kSMCReturnError", buf, 0x12u);
      }
    }
    LOBYTE(v9) = 0;
LABEL_16:

  }
LABEL_5:

  return v9;
}

uint64_t __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882612 = result;
  return result;
}

uint64_t __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke_466(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882613 = result;
  return result;
}

uint64_t __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke_471(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882614 = result;
  return result;
}

- (void)logPowerDeliveryKeys
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PowerDeliveryKeys"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v21);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PLSMCAgent powerDeliveryKeys](self, "powerDeliveryKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[PLSMCAgent readKey:](self, "readKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
          objc_msgSend(v4, "setObject:forKey:", v11, v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v7);
  }

  -[PLOperator logEntry:](self, "logEntry:", v3);
  PLLogSMC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "Log Power Delivery Keys to CA", buf, 2u);
  }

  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __34__PLSMCAgent_logPowerDeliveryKeys__block_invoke;
  v29 = &unk_1E85780A0;
  v20 = v4;
  v30 = v20;
  AnalyticsSendEventLazy();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PLSMCAgent powerDeliveryResetKeys](self, "powerDeliveryResetKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (-[PLSMCAgent writeKeyNumeric:withValue:](self, "writeKeyNumeric:withValue:", v18, 1, v20))
        {
          PLLogSMC();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v18;
            _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@ key has been successfully reset", buf, 0xCu);
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v37, 16);
    }
    while (v15);
  }

}

id __34__PLSMCAgent_logPowerDeliveryKeys__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logDRAMVendorKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("DRAMVendorKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  -[PLSMCAgent DRAMVendorKey](self, "DRAMVendorKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSMCAgent readKey:](self, "readKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PLLogSMC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Log DRAM Vendor key with value %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
  }
  -[PLOperator logEntry:](self, "logEntry:", v4);

}

- (id)thermalKeys
{
  if (qword_1ED882658 != -1)
    dispatch_once(&qword_1ED882658, &__block_literal_global_476);
  return (id)qword_1ED882660;
}

void __25__PLSMCAgent_thermalKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TCXC"), CFSTR("Ts0S"), CFSTR("TC0F"), CFSTR("TH0A"), CFSTR("TH0F"), CFSTR("TM0P"), CFSTR("Ts0P"), CFSTR("TBXT"), CFSTR("TC0P"), CFSTR("TH0C"), CFSTR("Ts1S"), CFSTR("Th1H"), CFSTR("Ta0P"), CFSTR("TA0V"), CFSTR("Th2H"), CFSTR("TCMc"), CFSTR("TH0B"),
    CFSTR("TM0V"),
    CFSTR("TG0P"),
    CFSTR("TG1F"),
    CFSTR("Th0N"),
    CFSTR("TKBV"),
    CFSTR("TM0S"),
    CFSTR("TPMV"),
    CFSTR("TG0D"),
    CFSTR("TG0F"),
    CFSTR("TG1D"),
    CFSTR("TH0J"),
    CFSTR("TH0x"),
    CFSTR("TB1T"),
    CFSTR("TB2T"),
    CFSTR("F0Ac"),
    CFSTR("F1Ac"),
    CFSTR("F0Tg"),
    CFSTR("F1Tg"),
    CFSTR("FPDc"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED882660;
  qword_1ED882660 = v0;

}

- (id)metricMonitorInstantKeys
{
  if (qword_1ED882668 != -1)
    dispatch_once(&qword_1ED882668, &__block_literal_global_550);
  return (id)qword_1ED882670;
}

void __38__PLSMCAgent_metricMonitorInstantKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("B0AP"), CFSTR("zSLi"), CFSTR("zSPi"), CFSTR("xRPE"), CFSTR("CHAS"), CFSTR("TB0T"), CFSTR("TVRM"), CFSTR("TVBM"), CFSTR("TVBH"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED882670;
  qword_1ED882670 = v0;

}

- (id)displayAccumulatedKeys
{
  if (qword_1ED882678 != -1)
    dispatch_once(&qword_1ED882678, &__block_literal_global_551);
  return (id)qword_1ED882680;
}

void __36__PLSMCAgent_displayAccumulatedKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PDLP"), CFSTR("PDEP"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED882680;
  qword_1ED882680 = v0;

}

- (id)accumulatedKeys
{
  if (qword_1ED882688 != -1)
    dispatch_once(&qword_1ED882688, &__block_literal_global_552);
  return (id)qword_1ED882690;
}

void __29__PLSMCAgent_accumulatedKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED882690;
  qword_1ED882690 = v0;

}

- (id)powerAccumulatedKeys
{
  if (qword_1ED882698 != -1)
    dispatch_once(&qword_1ED882698, &__block_literal_global_553);
  return (id)qword_1ED8826A0;
}

void __34__PLSMCAgent_powerAccumulatedKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PSTR"), CFSTR("PBat"), CFSTR("VBat"), CFSTR("PDLP"), CFSTR("PDEP"), CFSTR("PP0b"), CFSTR("PP1b"), CFSTR("PP2b"), CFSTR("PP3b"), CFSTR("PP4b"), CFSTR("PP5b"), CFSTR("PP6b"), CFSTR("PP7b"), CFSTR("PP8b"), CFSTR("PP9b"), CFSTR("PPab"), CFSTR("PPbb"),
    CFSTR("PPdb"),
    CFSTR("VP0b"),
    CFSTR("VP1b"),
    CFSTR("VP2b"),
    CFSTR("VP3b"),
    CFSTR("VP4b"),
    CFSTR("VP5b"),
    CFSTR("VP6b"),
    CFSTR("VP7b"),
    CFSTR("VP8b"),
    CFSTR("VP9b"),
    CFSTR("VPab"),
    CFSTR("VPbb"),
    CFSTR("VPdb"),
    CFSTR("PR4b"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8826A0;
  qword_1ED8826A0 = v0;

}

void __32__PLSMCAgent_thermalInstantKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TN0n"), CFSTR("TV0A"), CFSTR("TVFM"), CFSTR("voC0"), CFSTR("mlCC"), CFSTR("voP0"), CFSTR("voT0"), CFSTR("voR1"), CFSTR("voR2"), CFSTR("xPb1"), CFSTR("xPb2"), CFSTR("mlNN"), CFSTR("voS0"), CFSTR("xPSp"), CFSTR("voBB"), CFSTR("xPDs"), CFSTR("cmSM"),
    CFSTR("TVD0"),
    CFSTR("ftS0"),
    CFSTR("TVBM"),
    CFSTR("TVFD"),
    CFSTR("TVFL"),
    CFSTR("TVFG"),
    CFSTR("TVBQ"),
    CFSTR("TVBR"),
    CFSTR("TV0s"),
    CFSTR("TV2s"),
    CFSTR("TV4s"),
    CFSTR("TV5s"),
    CFSTR("xPPT"),
    CFSTR("xDPE"),
    CFSTR("mTPL"),
    CFSTR("B0AP"),
    CFSTR("mTLL"),
    CFSTR("xPNf"),
    CFSTR("xPWi"),
    CFSTR("xPAr"),
    CFSTR("TVBA"),
    CFSTR("TVBC"),
    CFSTR("TVBF"),
    CFSTR("TVBB"),
    CFSTR("TVLN"),
    CFSTR("SDTo"),
    CFSTR("SDTh"),
    CFSTR("SDTL"),
    CFSTR("xRPE"),
    CFSTR("TG0V"),
    CFSTR("CKRQ"),
    CFSTR("TVBN"),
    CFSTR("TVRQ"),
    CFSTR("TVRH"),
    CFSTR("TVRR"),
    CFSTR("TVBE"),
    CFSTR("TVRM"),
    CFSTR("TAOP"),
    CFSTR("TB50"),
    CFSTR("TB5B"),
    CFSTR("TKFP"),
    CFSTR("TW0P"),
    CFSTR("TVFC"),
    CFSTR("mlr5"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8826B0;
  qword_1ED8826B0 = v0;

}

- (id)thermalAggregationKeys
{
  if (qword_1ED8826B8 != -1)
    dispatch_once(&qword_1ED8826B8, &__block_literal_global_555);
  return (id)qword_1ED8826C0;
}

void __36__PLSMCAgent_thermalAggregationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("B0AP"), CFSTR("TB5B"), CFSTR("TVBA"), CFSTR("TVBB"), CFSTR("TVBC"), CFSTR("TVBF"), CFSTR("TVBQ"), CFSTR("TVBM"), CFSTR("TVBR"), CFSTR("TVFD"), CFSTR("TVFL"), CFSTR("TVFG"), CFSTR("TVLN"), CFSTR("TV0s"), CFSTR("TV2s"), CFSTR("TG0V"), CFSTR("TH0T"),
    CFSTR("SDTs"),
    CFSTR("ftS0"),
    CFSTR("voP0"),
    CFSTR("mTPL"),
    CFSTR("TVBN"),
    CFSTR("TVRQ"),
    CFSTR("TVRH"),
    CFSTR("TVRR"),
    CFSTR("TVBE"),
    CFSTR("TVRM"),
    CFSTR("TAOP"),
    CFSTR("TB50"),
    CFSTR("TKFP"),
    CFSTR("TW0P"),
    CFSTR("TVFC"),
    CFSTR("mlr5"),
    CFSTR("BUIC"),
    CFSTR("TNAP"),
    CFSTR("TR0P"),
    CFSTR("xCTA"),
    CFSTR("SDTA"),
    CFSTR("SDTC"),
    CFSTR("TB0T"),
    CFSTR("TCMb"),
    CFSTR("TV1s"),
    CFSTR("TV3s"),
    CFSTR("TVBH"),
    CFSTR("TTDa"),
    CFSTR("TPMP"),
    CFSTR("TCHP"),
    CFSTR("TN0n"),
    CFSTR("TV0A"),
    CFSTR("TVFM"),
    CFSTR("TG0B"),
    CFSTR("zSLi"),
    CFSTR("zSPi"),
    CFSTR("TVBL"),
    CFSTR("TAOC"),
    CFSTR("TVB1"),
    CFSTR("TVB2"),
    CFSTR("TVB3"),
    CFSTR("TVB4"),
    CFSTR("TPSP"),
    CFSTR("TIOP"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8826C0;
  qword_1ED8826C0 = v0;

}

- (id)powerDeliveryKeys
{
  if (qword_1ED8826C8 != -1)
    dispatch_once(&qword_1ED8826C8, &__block_literal_global_559);
  return (id)qword_1ED8826D0;
}

void __31__PLSMCAgent_powerDeliveryKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8826D0;
  qword_1ED8826D0 = v0;

}

- (id)powerDeliveryResetKeys
{
  if (qword_1ED8826D8 != -1)
    dispatch_once(&qword_1ED8826D8, &__block_literal_global_560);
  return (id)qword_1ED8826E0;
}

void __36__PLSMCAgent_powerDeliveryResetKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8826E0;
  qword_1ED8826E0 = v0;

}

- (id)DRAMVendorKey
{
  if (qword_1ED8826E8 != -1)
    dispatch_once(&qword_1ED8826E8, &__block_literal_global_561);
  return (id)qword_1ED8826F0;
}

void __27__PLSMCAgent_DRAMVendorKey__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED8826F0;
  qword_1ED8826F0 = (uint64_t)CFSTR("MDSV");

}

void __36__PLSMCAgent_virtualTemperatureKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TVBA"), CFSTR("TVBB"), CFSTR("TVBC"), CFSTR("TVBE"), CFSTR("TVBF"), CFSTR("TVBM"), CFSTR("TVBN"), CFSTR("TVBQ"), CFSTR("TVBR"), CFSTR("TVFC"), CFSTR("TVFD"), CFSTR("TVFG"), CFSTR("TVFL"), CFSTR("TVLN"), CFSTR("TVRH"), CFSTR("TVRM"), CFSTR("TVRQ"),
    CFSTR("TVRR"),
    CFSTR("TV0s"),
    CFSTR("TV2s"),
    CFSTR("TV4s"),
    CFSTR("TV5s"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED882700;
  qword_1ED882700 = v0;

}

- (void)stopThermalTimerAndlogFirstLowSample:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[PLSMCAgent setLastThermalInstantEntry:](self, "setLastThermalInstantEntry:", 0);
  if (v3)
    -[PLSMCAgent logThermalInstantAndAccumlatedKeys](self, "logThermalInstantAndAccumlatedKeys");
  -[PLSMCAgent thermalLoggingTimer](self, "thermalLoggingTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLSMCAgent thermalLoggingTimer](self, "thermalLoggingTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[PLSMCAgent setThermalLoggingTimer:](self, "setThermalLoggingTimer:", 0);
  }
}

uint64_t __32__PLSMCAgent_supportsThermalSMC__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
  byte_1ED882615 = (int)result > 1001014;
  return result;
}

+ (BOOL)shouldModelDisplayPowerFromSMC
{
  if (qword_1ED882710 != -1)
    dispatch_once(&qword_1ED882710, &__block_literal_global_565);
  return byte_1ED882616;
}

uint64_t __44__PLSMCAgent_shouldModelDisplayPowerFromSMC__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLDisplayClassIsOneOf:", 1002057, 0);
  byte_1ED882616 = result;
  return result;
}

+ (BOOL)supportsBasicSMC
{
  if (qword_1ED882718 != -1)
    dispatch_once(&qword_1ED882718, &__block_literal_global_566);
  return byte_1ED882617;
}

uint64_t __30__PLSMCAgent_supportsBasicSMC__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
  byte_1ED882617 = (int)result > 1001009;
  return result;
}

+ (id)parsePMUEvents:(unint64_t)a3
{
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_1E864FD18, "count"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(&unk_1E864FD18, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (a3 >> v5));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);

      ++v6;
      v5 += 8;
    }
    while (v6 < objc_msgSend(&unk_1E864FD18, "count"));
  }
  return v4;
}

+ (void)reportPMUEventsToCA:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "unsignedLongLongValue"))
  {
    if ((byte_1ED882618 & 1) != 0)
      goto LABEL_10;
    if (qword_1ED882720 != -1)
      dispatch_once(&qword_1ED882720, &__block_literal_global_579);
  }
  v4 = objc_msgSend(v3, "unsignedLongLongValue");
  +[PLSMCAgent parsePMUEvents:](PLSMCAgent, "parsePMUEvents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PLLogSMC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_INFO, "PMU events: %llu -> %@", buf, 0x16u);
    }

    v7 = v5;
    AnalyticsSendEventLazy();

  }
LABEL_10:

}

void __34__PLSMCAgent_reportPMUEventsToCA___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PLLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAF47000, v0, OS_LOG_TYPE_INFO, "PMU events: pushed empty event", v1, 2u);
  }

  byte_1ED882618 = 1;
}

id __34__PLSMCAgent_reportPMUEventsToCA___block_invoke_582(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PLEntryNotificationOperatorComposition)sbc
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSbc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)screenStateNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScreenStateNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)lastAccumlatedKeysSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastAccumlatedKeysSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)lastAccumlatedKeysSampleCA
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastAccumlatedKeysSampleCA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)lastDisplayAccumlatedSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastDisplayAccumlatedSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDate)lastDisplayAccumulatedSampleEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastDisplayAccumulatedSampleEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)focalAppSwitch
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFocalAppSwitch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)lastFocalSampleDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastFocalSampleDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLTimer)focalSwitchFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFocalSwitchFilterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLTimer)thermalAggregationTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setThermalAggregationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLTimer)thermalMonitorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setThermalMonitorTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setThermalLoggingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDictionary)lastPowerAccumlatedSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastPowerAccumlatedSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDictionary)lastPowerAccumlatedSampleCA
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastPowerAccumlatedSampleCA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSMutableDictionary)lastAccumValueDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastAccumValueDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)lastAccumCycleCountDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastAccumCycleCountDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void)setSmcConnection:(id *)a3
{
  self->_smcConnection = a3;
}

- (PLEntryNotificationOperatorComposition)luxEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLuxEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)currentLux
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCurrentLux:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLux, 0);
  objc_storeStrong((id *)&self->_luxEntryNotification, 0);
  objc_storeStrong((id *)&self->_lastAccumCycleCountDict, 0);
  objc_storeStrong((id *)&self->_lastAccumValueDict, 0);
  objc_storeStrong((id *)&self->_lastPowerAccumlatedSampleCA, 0);
  objc_storeStrong((id *)&self->_lastPowerAccumlatedSample, 0);
  objc_storeStrong((id *)&self->_lastThermalInstantEntry, 0);
  objc_storeStrong((id *)&self->_thermalLoggingTimer, 0);
  objc_storeStrong((id *)&self->_thermalMonitorTimer, 0);
  objc_storeStrong((id *)&self->_thermalAggregationTimer, 0);
  objc_storeStrong((id *)&self->_focalSwitchFilterTimer, 0);
  objc_storeStrong((id *)&self->_lastFocalSampleDate, 0);
  objc_storeStrong((id *)&self->_focalAppSwitch, 0);
  objc_storeStrong((id *)&self->_lastDisplayAccumulatedSampleEndDate, 0);
  objc_storeStrong((id *)&self->_lastDisplayAccumlatedSample, 0);
  objc_storeStrong((id *)&self->_lastAccumlatedKeysSampleCA, 0);
  objc_storeStrong((id *)&self->_lastAccumlatedKeysSample, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_screenStateNotification, 0);
  objc_storeStrong((id *)&self->_sbc, 0);
}

@end
