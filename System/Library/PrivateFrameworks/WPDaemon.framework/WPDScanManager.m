@implementation WPDScanManager

uint64_t __54__WPDScanManager_logScanTypes_method_window_interval___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%ld "), a2);
}

- (void)updateScanner
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WPDScanManager *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[136];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[WPDManager server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cbState");

  if (v4 != 3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_280_0);
    v16 = WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v17 = "Trying to update scanner but Daemon central manager isn't powered on";
    v18 = v16;
    v19 = OS_LOG_TYPE_DEFAULT;
LABEL_22:
    _os_log_impl(&dword_2175D1000, v18, v19, v17, buf, 2u);
    return;
  }
  if (-[WPDScanManager scanningDisabled](self, "scanningDisabled"))
    return;
  if (!-[WPDScanManager updateScanRules](self, "updateScanRules"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_282);
    v20 = WiProxLog;
    if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v17 = "Scan request no-op per <rdar://problem/36023927>";
    v18 = v20;
    v19 = OS_LOG_TYPE_INFO;
    goto LABEL_22;
  }
  -[WPDScanManager scanOptions](self, "scanOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBB088]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      v11 = *MEMORY[0x24BDBB0A8];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "objectForKeyedSubscript:", v11, (_QWORD)v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerValue");

          if (v14 == 8)
          {
            v15 = 1;
            goto LABEL_24;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
        if (v9)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_24:

  }
  else
  {
    v15 = 0;
  }
  -[WPDScanManager assertCBDiscoveryScan:](self, "assertCBDiscoveryScan:", v15, (_QWORD)v28);

  -[WPDScanManager scanOptions](self, "scanOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (-[WPDScanManager shallStop](self, "shallStop"))
    {
      -[WPDScanManager centralManager](self, "centralManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stopScan");

    }
    -[WPDScanManager centralManager](self, "centralManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDScanManager scanOptions](self, "scanOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scanForPeripheralsWithServices:options:", 0, v24);

    v25 = self;
    v26 = 1;
  }
  else
  {
    -[WPDScanManager centralManager](self, "centralManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stopScan");

    v25 = self;
    v26 = 0;
  }
  -[WPDScanManager setScanning:](v25, "setScanning:", v26);
}

void __49__WPDScanManager_scanOptionsChanged_ForRequests___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v7 = a3;
  if ((id)*MEMORY[0x24BDBB088] != v12 && *MEMORY[0x24BDBB188] != (_QWORD)v12)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "scanOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11 != v7;

    }
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Scan options %@ => %@ changed: %d\n"), v12, v7, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }

}

- (NSDictionary)scanOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)updateScanRules
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  __int128 v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  void *v34;
  int v35;
  void *v36;
  _BOOL4 v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  BOOL v41;
  _BOOL4 v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  BOOL v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  void *v82;
  NSObject *v83;
  void *v84;
  char v85;
  void *v86;
  _BOOL8 v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  NSObject *v94;
  BOOL v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  NSNumber *v99;
  void (*v100)(uint64_t, void *, uint64_t, _BYTE *);
  uint64_t *v101;
  NSNumber *scanRetainDuplicates;
  char v103;
  uint64_t v104;
  NSNumber *v105;
  NSNumber *v106;
  NSObject *v107;
  _BOOL4 v108;
  int v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  NSObject *v116;
  uint64_t v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  NSNumber *v134;
  void *v135;
  __int128 v137;
  id obj;
  uint64_t v139;
  _BOOL4 v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  NSObject *log;
  char v170;
  void *v171;
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _QWORD v178[5];
  _QWORD v179[5];
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  uint64_t (*v183)(uint64_t, uint64_t);
  void (*v184)(uint64_t);
  id v185;
  _QWORD v186[6];
  _QWORD v187[7];
  uint64_t v188;
  uint64_t *v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t v195;
  _QWORD v196[5];
  uint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  uint64_t (*v200)(uint64_t, uint64_t);
  void (*v201)(uint64_t);
  NSNumber *v202;
  _QWORD v203[5];
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t (*v207)(uint64_t, uint64_t);
  void (*v208)(uint64_t);
  NSNumber *v209;
  _QWORD v210[5];
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t (*v214)(uint64_t, uint64_t);
  void (*v215)(uint64_t);
  NSNumber *v216;
  _QWORD v217[6];
  uint64_t v218;
  uint64_t *v219;
  uint64_t v220;
  uint64_t (*v221)(uint64_t, uint64_t);
  void (*v222)(uint64_t);
  NSNumber *v223;
  uint64_t v224;
  uint64_t v225;
  _QWORD v226[5];
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  uint64_t v230;
  _QWORD v231[6];
  uint64_t v232;
  uint64_t *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  __int128 v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  __int128 v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  _QWORD v288[14];
  _QWORD v289[14];
  uint8_t buf[24];
  int v291;
  __int16 v292;
  void *v293;
  __int16 v294;
  void *v295;
  __int16 v296;
  uint64_t v297;
  __int16 v298;
  void *v299;
  uint8_t v300[128];
  uint8_t v301[8];
  uint8_t *v302;
  uint64_t v303;
  uint64_t (*v304)(uint64_t, uint64_t);
  void (*v305)(uint64_t);
  NSNumber *v306;
  _BYTE v307[24];
  uint64_t (*v308)(uint64_t, uint64_t);
  void (*v309)(uint64_t);
  id v310;
  id v311;
  void *v312;
  _BYTE v313[128];
  _BYTE v314[128];
  uint64_t v315;

  v315 = *MEMORY[0x24BDAC8D0];
  -[WPDManager server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopActivity:", 0);

  -[WPDScanManager scanRequests](self, "scanRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = -[WPDScanManager isScannerTestMode](self, "isScannerTestMode");
    v7 = -[WPDScanManager heySiriScanActive:](self, "heySiriScanActive:");
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = 0u;
    v286 = 0u;
    v285 = 0u;
    v284 = 0u;
    -[WPDScanManager scanRequests](self, "scanRequests");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v284, v314, 16);
    if (!v141)
      goto LABEL_156;
    v170 = !v7;
    v139 = *(_QWORD *)v285;
    v162 = (id)*MEMORY[0x24BDBB0A8];
    v160 = *MEMORY[0x24BDBB080];
    v146 = *MEMORY[0x24BDBB0D0];
    v148 = *MEMORY[0x24BDBB0E0];
    v144 = *MEMORY[0x24BDBB0D8];
    v156 = *MEMORY[0x24BDBB098];
    v158 = *MEMORY[0x24BDBB190];
    v154 = *MEMORY[0x24BDBB090];
    *(_QWORD *)&v8 = 138412290;
    v137 = v8;
    v150 = *MEMORY[0x24BDBB0A0];
    v152 = *MEMORY[0x24BDBB0B0];
    v143 = *MEMORY[0x24BDBB100];
    while (1)
    {
      for (i = 0; i != v141; i = v90 + 1)
      {
        if (*(_QWORD *)v285 != v139)
          objc_enumerationMutation(obj);
        v142 = i;
        v10 = *(_QWORD *)(*((_QWORD *)&v284 + 1) + 8 * i);
        if (!v140
          || (-[WPDManager server](self, "server"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v12 = objc_msgSend(v11, "isClientTestMode:", v10),
              v11,
              (v12 & 1) != 0))
        {
          -[WPDManager server](self, "server", v137);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "getClientForUUID:", v10);
          v167 = (void *)objc_claimAutoreleasedReturnValue();

          -[WPDScanManager scanRequests](self, "scanRequests");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v283 = 0u;
          v282 = 0u;
          v281 = 0u;
          v280 = 0u;
          v172 = v15;
          v16 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v280, v313, 16);
          if (!v16)
            goto LABEL_149;
          v17 = *(_QWORD *)v281;
          while (1)
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v281 != v17)
                objc_enumerationMutation(v172);
              v19 = *(_QWORD *)(*((_QWORD *)&v280 + 1) + 8 * v18);
              v20 = objc_msgSend((id)v19, "clientType");
              if (!-[WPDManager isScanAllowlistedForType:](self, "isScanAllowlistedForType:", v20))
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_184_1);
                v25 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v20;
                  _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, "Not scanning for client type (%ld) when denylisted or not allowlisted", buf, 0xCu);
                }
                goto LABEL_147;
              }
              if ((_DWORD)v20 == 8)
                v21 = 1;
              else
                v21 = v170;
              if ((v21 & 1) == 0)
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_186_0);
                v22 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v20;
                  v23 = v22;
                  v24 = "Not scanning for client type (%ld) when HeySiri scan is active";
LABEL_23:
                  _os_log_debug_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
                  goto LABEL_147;
                }
                goto LABEL_147;
              }
              if ((_DWORD)v20 == 16)
              {
                -[WPDManager server](self, "server");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "screenOff");

                if (!v35)
                  goto LABEL_77;
                memset(buf, 0, sizeof(buf));
                if (v19)
                  objc_msgSend((id)v19, "scanningRates");
                -[WPDManager server](self, "server");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v36, "isMirroring"))
                {
                  if (v19)
                  {
                    objc_msgSend((id)v19, "scanningRates");
                    v37 = v269 == 966;

                    if (v37)
                    {
                      *(_QWORD *)&buf[8] = 300;
                      if (WPLogInitOnce != -1)
                        dispatch_once(&WPLogInitOnce, &__block_literal_global_192_0);
                      v38 = (id)WiProxLog;
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v307 = 134218240;
                        *(_QWORD *)&v307[4] = *(_QWORD *)&buf[8];
                        *(_WORD *)&v307[12] = 2048;
                        *(_QWORD *)&v307[14] = 16;
                        v39 = v38;
                        v40 = "Boosting screen off scan interval to %ld for client type (%ld) when mirroring";
                        goto LABEL_65;
                      }
                      goto LABEL_75;
                    }
LABEL_58:
                    -[WPDManager server](self, "server");
                    v38 = objc_claimAutoreleasedReturnValue();
                    if ((-[NSObject isMirroring](v38, "isMirroring") & 1) != 0)
                      goto LABEL_75;
                    if (!v19)
                    {
                      v266 = 0;
                      v265 = 0;
                      v267 = 0;
                      goto LABEL_75;
                    }
                    objc_msgSend((id)v19, "scanningRates");
                    v42 = v266 == 300;

                    if (v42)
                    {
                      *(_QWORD *)&buf[8] = 966;
                      if (WPLogInitOnce != -1)
                        dispatch_once(&WPLogInitOnce, &__block_literal_global_194_1);
                      v38 = (id)WiProxLog;
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v307 = 134218240;
                        *(_QWORD *)&v307[4] = *(_QWORD *)&buf[8];
                        *(_WORD *)&v307[12] = 2048;
                        *(_QWORD *)&v307[14] = 16;
                        v39 = v38;
                        v40 = "Resetting screen off scan interval to %ld for client type (%ld) when not mirroring";
LABEL_65:
                        _os_log_impl(&dword_2175D1000, v39, OS_LOG_TYPE_DEFAULT, v40, v307, 0x16u);
                      }
LABEL_75:

                    }
                    v263 = *(_OWORD *)buf;
                    v264 = *(_QWORD *)&buf[16];
                    objc_msgSend((id)v19, "setScanningRates:", &v263);
                    goto LABEL_77;
                  }
                  v269 = 0;
                  v268 = 0;
                  v270 = 0;
                }

                goto LABEL_58;
              }
              if ((_DWORD)v20 == 12)
              {
                -[WPDManager server](self, "server");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "screenOff");

                if (v27)
                {
                  memset(buf, 0, sizeof(buf));
                  if (v19)
                    objc_msgSend((id)v19, "scanningRates");
                  -[WPDManager server](self, "server");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v28, "isMirroring"))
                  {
                    if (v19)
                    {
                      objc_msgSend((id)v19, "scanningRates");
                      v29 = v278 == 0xFFFF;

                      if (v29)
                      {
                        objc_msgSend((id)v19, "scanningRates");
                        *(_QWORD *)&buf[8] = v276;
                        if (WPLogInitOnce != -1)
                          dispatch_once(&WPLogInitOnce, &__block_literal_global_188_0);
                        v30 = (id)WiProxLog;
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v307 = 134218240;
                          *(_QWORD *)&v307[4] = *(_QWORD *)&buf[8];
                          *(_WORD *)&v307[12] = 2048;
                          *(_QWORD *)&v307[14] = 12;
                          v31 = v30;
                          v32 = "Enabling screen off scan interval of %ld for client type (%ld) when mirroring";
                          v33 = 22;
                          goto LABEL_71;
                        }
                        goto LABEL_72;
                      }
LABEL_52:
                      -[WPDManager server](self, "server");
                      v30 = objc_claimAutoreleasedReturnValue();
                      if ((-[NSObject isMirroring](v30, "isMirroring") & 1) != 0)
                        goto LABEL_72;
                      if (v19)
                      {
                        objc_msgSend((id)v19, "scanningRates");
                        v41 = v274 == 0xFFFF;

                        if (v41)
                          goto LABEL_73;
                      }
                      else
                      {
                        v274 = 0;
                        v273 = 0;
                        v275 = 0;

                      }
                      *(_QWORD *)&buf[8] = 0xFFFFLL;
                      if (WPLogInitOnce != -1)
                        dispatch_once(&WPLogInitOnce, &__block_literal_global_190_1);
                      v30 = (id)WiProxLog;
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v307 = 134217984;
                        *(_QWORD *)&v307[4] = 12;
                        v31 = v30;
                        v32 = "Disabling screen off scan for client type (%ld) when not mirroring";
                        v33 = 12;
LABEL_71:
                        _os_log_impl(&dword_2175D1000, v31, OS_LOG_TYPE_DEFAULT, v32, v307, v33);
                      }
LABEL_72:

LABEL_73:
                      v271 = *(_OWORD *)buf;
                      v272 = *(_QWORD *)&buf[16];
                      objc_msgSend((id)v19, "setScanningRates:", &v271);
                      goto LABEL_77;
                    }
                    v278 = 0;
                    v277 = 0;
                    v279 = 0;
                  }

                  goto LABEL_52;
                }
              }
LABEL_77:
              -[WPDManager server](self, "server");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v43, "screenOff"))
                goto LABEL_85;
              if (!v19)
              {
                v261 = 0;
                v260 = 0;
                v262 = 0;
LABEL_85:

                goto LABEL_86;
              }
              objc_msgSend((id)v19, "scanningRates");

              if (v261 == 0xFFFF)
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_196_0);
                v44 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v20;
                  v23 = v44;
                  v24 = "Not scanning for client type (%ld) because we don't scan when screen is off";
                  goto LABEL_23;
                }
                goto LABEL_147;
              }
LABEL_86:
              -[WPDManager server](self, "server");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v45, "systemLocked"))
              {
                v46 = objc_msgSend((id)v19, "scanWhenLocked");

                if ((v46 & 1) == 0)
                {
                  if (WPLogInitOnce != -1)
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_198_1);
                  v47 = WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v20;
                    v23 = v47;
                    v24 = "Not scanning for client type (%ld) because screen is locked";
                    goto LABEL_23;
                  }
                  goto LABEL_147;
                }
              }
              else
              {

              }
              if (!_os_feature_enabled_impl())
                goto LABEL_101;
              -[WPDManager server](self, "server");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v48, "screenOff"))
              {

LABEL_101:
                v51 = (void *)MEMORY[0x24BDBCED8];
                v311 = v162;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v20);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v312 = v52;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v312, &v311, 1);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "dictionaryWithDictionary:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend((id)v19, "allowDuplicates"));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, v160);

                if ((v20 - 15) <= 1u)
                {
                  if (v19)
                  {
                    objc_msgSend((id)v19, "scanningRates");
                    if (v259 <= 65534)
                    {
                      v56 = (void *)MEMORY[0x24BDD16E0];
                      objc_msgSend((id)v19, "scanningRates");
                      v57 = v256;
                      goto LABEL_106;
                    }
                    goto LABEL_107;
                  }
                  v57 = 0;
                  v258 = 0;
                  v257 = 0;
                  v259 = 0;
                  v56 = (void *)MEMORY[0x24BDD16E0];
                  v256 = 0;
                  v254 = 0;
                  v255 = 0;
LABEL_106:
                  objc_msgSend(v56, "numberWithInteger:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v58, v148);

                  if (v19)
                  {
LABEL_107:
                    objc_msgSend((id)v19, "scanningRates");
                    if (v251 <= 65534)
                    {
                      v59 = (void *)MEMORY[0x24BDD16E0];
                      objc_msgSend((id)v19, "scanningRates");
                      v60 = v248;
                      goto LABEL_110;
                    }
                    goto LABEL_111;
                  }
                  v60 = 0;
                  v252 = 0;
                  v251 = 0;
                  v253 = 0;
                  v59 = (void *)MEMORY[0x24BDD16E0];
                  v250 = 0;
                  v248 = 0;
                  v249 = 0;
LABEL_110:
                  objc_msgSend(v59, "numberWithInteger:", v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v61, v146);

                  if (v19)
                  {
LABEL_111:
                    objc_msgSend((id)v19, "scanningRates");
                    if (v246 <= 65534)
                    {
                      v62 = (void *)MEMORY[0x24BDD16E0];
                      objc_msgSend((id)v19, "scanningRates");
                      v63 = v243;
                      goto LABEL_114;
                    }
                  }
                  else
                  {
                    v63 = 0;
                    v246 = 0;
                    v245 = 0;
                    v247 = 0;
                    v62 = (void *)MEMORY[0x24BDD16E0];
                    v244 = 0;
                    v242 = 0;
                    v243 = 0;
LABEL_114:
                    objc_msgSend(v62, "numberWithInteger:", v63);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "setObject:forKeyedSubscript:", v64, v144);

                  }
                }
                objc_msgSend(v167, "bundleID");
                v65 = (void *)objc_claimAutoreleasedReturnValue();

                if (v65)
                {
                  v66 = (void *)MEMORY[0x24BDBCE30];
                  objc_msgSend(v167, "bundleID");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "arrayWithObject:", v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v68, v158);

                }
                objc_msgSend((id)v19, "blobValue");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = objc_msgSend(v69, "length") == 0;

                if (!v70)
                {
                  objc_msgSend((id)v19, "blobValue");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v71, v156);

                }
                objc_msgSend((id)v19, "maskValue");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend(v72, "length") == 0;

                if (!v73)
                {
                  objc_msgSend((id)v19, "maskValue");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v74, v154);

                }
                objc_msgSend((id)v19, "peers");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = objc_msgSend(v75, "count") == 0;

                if (!v76)
                {
                  objc_msgSend((id)v19, "peers");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v77, v152);

                }
                objc_msgSend((id)v19, "rssiThreshold");
                v78 = (void *)objc_claimAutoreleasedReturnValue();

                if (v78)
                {
                  objc_msgSend((id)v19, "rssiThreshold");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v79, v150);

                }
                objc_msgSend((id)v19, "useCaseList");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = objc_msgSend(v80, "count") == 0;

                if (!v81)
                {
                  objc_msgSend((id)v19, "useCaseList");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKeyedSubscript:", v82, CFSTR("kCBOptionUseCaseList"));

                }
                if (objc_msgSend((id)v19, "range") && -[WPDScanManager isRanging](self, "isRanging"))
                {
                  -[WPDScanManager rangingTypes](self, "rangingTypes");
                  v83 = objc_claimAutoreleasedReturnValue();
                  if (!-[NSObject containsIndex:](v83, "containsIndex:", v20))
                    goto LABEL_135;
                  -[WPDManager server](self, "server");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  v85 = objc_msgSend(v84, "screenOff");

                  if ((v85 & 1) == 0)
                  {
                    objc_msgSend(v54, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v143);
                    if (WPLogInitOnce != -1)
                      dispatch_once(&WPLogInitOnce, &__block_literal_global_205_1);
                    v83 = (id)WiProxLog;
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v137;
                      *(_QWORD *)&buf[4] = v54;
                      _os_log_debug_impl(&dword_2175D1000, v83, OS_LOG_TYPE_DEBUG, "[Ranging] scan rule with ranging: %@", buf, 0xCu);
                    }
LABEL_135:

                  }
                }
                if (objc_msgSend(v166, "containsIndex:", v20))
                {
                  -[WPDScanManager duplicateRulesGuard:forRule:](self, "duplicateRulesGuard:forRule:", v164, v54);
                }
                else
                {
                  objc_msgSend(v164, "addObject:", v54);
                  objc_msgSend(v166, "addIndex:", v20);
                }
                objc_msgSend(v165, "addObject:", v19);
                -[WPDManager server](self, "server");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v86, "screenOff"))
                {
                  if (v19)
                  {
                    objc_msgSend((id)v19, "scanningRates");
                    v19 = v240;
                  }
                  else
                  {
                    v240 = 0;
                    v239 = 0;
                    v241 = 0;
                  }
                }
                else if (v19)
                {
                  objc_msgSend((id)v19, "scanningRates");
                  v19 = v236;
                }
                else
                {
                  v237 = 0;
                  v236 = 0;
                  v238 = 0;
                }

                v87 = v19 > 299;
                -[WPDManager server](self, "server");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "statsManager");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "startActivity:forType:scanRate:", 0, v20, v87);

                goto LABEL_147;
              }
              v49 = objc_msgSend((id)v19, "advBuffer") == 0;

              if (v49)
                goto LABEL_101;
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_201);
              v50 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v20;
                v23 = v50;
                v24 = "Not scanning for client type (%ld) when screen is off and ADV Buffer is enabled";
                goto LABEL_23;
              }
LABEL_147:
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v280, v313, 16);
            if (!v16)
            {
LABEL_149:

              v90 = v142;
              goto LABEL_154;
            }
          }
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_182_0);
        v91 = WiProxLog;
        v90 = v142;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v137;
          *(_QWORD *)&buf[4] = v10;
          _os_log_debug_impl(&dword_2175D1000, v91, OS_LOG_TYPE_DEBUG, "Not scanning for non-test client UUID: %@ when in test mode", buf, 0xCu);
        }
LABEL_154:
        ;
      }
      v141 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v284, v314, 16);
      if (!v141)
      {
LABEL_156:

        if (objc_msgSend(v164, "count"))
        {
          v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexSet:", v166);
          -[WPDScanManager setCurrentScanners:](self, "setCurrentScanners:", v92);

          v232 = 0;
          v233 = &v232;
          v234 = 0x2020000000;
          v235 = 0xFFFFLL;
          v93 = MEMORY[0x24BDAC760];
          v231[0] = MEMORY[0x24BDAC760];
          v231[1] = 3221225472;
          v231[2] = __33__WPDScanManager_updateScanRules__block_invoke_208;
          v231[3] = &unk_24D7C5CB8;
          v231[4] = self;
          v231[5] = &v232;
          objc_msgSend(v165, "enumerateObjectsUsingBlock:", v231);
          if (v233[3] < 0xFFFF)
          {
            v227 = 0;
            v228 = &v227;
            v229 = 0x2020000000;
            v230 = 0xFFFFLL;
            v226[0] = v93;
            v226[1] = 3221225472;
            v226[2] = __33__WPDScanManager_updateScanRules__block_invoke_211;
            v226[3] = &unk_24D7C5D00;
            v226[4] = &v227;
            objc_msgSend(v165, "enumerateObjectsUsingBlock:", v226);
            if (v228[3] < 0xFFFF)
            {
              *(_QWORD *)v307 = 0;
              *(_QWORD *)&v307[8] = v307;
              *(_QWORD *)&v307[16] = 0x3032000000;
              v308 = __Block_byref_object_copy__2;
              v309 = __Block_byref_object_dispose__2;
              v99 = (NSNumber *)MEMORY[0x24BDBD1C0];
              v310 = (id)MEMORY[0x24BDBD1C0];
              if (_os_feature_enabled_impl())
              {
                v225 = v93;
                v100 = __33__WPDScanManager_updateScanRules__block_invoke_214;
                v101 = &v225;
              }
              else
              {
                v224 = v93;
                v100 = __33__WPDScanManager_updateScanRules__block_invoke_2_215;
                v101 = &v224;
              }
              v101[1] = 3221225472;
              v101[2] = (uint64_t)v100;
              v101[3] = (uint64_t)&unk_24D7C5D00;
              v101[4] = (uint64_t)v307;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v137);
              v218 = 0;
              v219 = &v218;
              v220 = 0x3032000000;
              v221 = __Block_byref_object_copy__2;
              v222 = __Block_byref_object_dispose__2;
              v223 = v99;
              v217[0] = v93;
              v217[1] = 3221225472;
              v217[2] = __33__WPDScanManager_updateScanRules__block_invoke_3;
              v217[3] = &unk_24D7C5CB8;
              v217[4] = self;
              v217[5] = &v218;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v217);
              v211 = 0;
              v212 = &v211;
              v213 = 0x3032000000;
              v214 = __Block_byref_object_copy__2;
              v215 = __Block_byref_object_dispose__2;
              v216 = v99;
              v210[0] = v93;
              v210[1] = 3221225472;
              v210[2] = __33__WPDScanManager_updateScanRules__block_invoke_4;
              v210[3] = &unk_24D7C5D00;
              v210[4] = &v211;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v210);
              v204 = 0;
              v205 = &v204;
              v206 = 0x3032000000;
              v207 = __Block_byref_object_copy__2;
              v208 = __Block_byref_object_dispose__2;
              v209 = v99;
              v203[0] = v93;
              v203[1] = 3221225472;
              v203[2] = __33__WPDScanManager_updateScanRules__block_invoke_5;
              v203[3] = &unk_24D7C5D00;
              v203[4] = &v204;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v203);
              v197 = 0;
              v198 = &v197;
              v199 = 0x3032000000;
              v200 = __Block_byref_object_copy__2;
              v201 = __Block_byref_object_dispose__2;
              v202 = v99;
              v196[0] = v93;
              v196[1] = 3221225472;
              v196[2] = __33__WPDScanManager_updateScanRules__block_invoke_6;
              v196[3] = &unk_24D7C5D00;
              v196[4] = &v197;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v196);
              v192 = 0;
              v193 = &v192;
              v194 = 0x2020000000;
              v195 = 0;
              v188 = 0;
              v189 = &v188;
              v190 = 0x2020000000;
              v191 = 0;
              v187[0] = v93;
              v187[1] = 3221225472;
              v187[2] = __33__WPDScanManager_updateScanRules__block_invoke_7;
              v187[3] = &unk_24D7C5D48;
              v187[5] = &v188;
              v187[6] = &v192;
              v187[4] = self;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v187);
              scanRetainDuplicates = self->_scanRetainDuplicates;
              self->_scanRetainDuplicates = v99;

              if (_os_feature_enabled_impl())
              {
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x2020000000;
                LOBYTE(v291) = 0;
                v180 = 0;
                v181 = &v180;
                v182 = 0x2020000000;
                LOBYTE(v183) = 0;
                if ((objc_msgSend((id)v219[5], "BOOLValue") & 1) != 0)
                  v103 = 1;
                else
                  v103 = objc_msgSend(*(id *)(*(_QWORD *)&v307[8] + 40), "BOOLValue");
                LOBYTE(v183) = v103;
                if (!*((_BYTE *)v181 + 24))
                {
                  v186[0] = v93;
                  v186[1] = 3221225472;
                  v186[2] = __33__WPDScanManager_updateScanRules__block_invoke_8;
                  v186[3] = &unk_24D7C5D90;
                  v186[4] = buf;
                  v186[5] = &v180;
                  objc_msgSend(v165, "enumerateObjectsUsingBlock:", v186);
                }
                if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                  v104 = *((unsigned __int8 *)v181 + 24) ^ 1u;
                else
                  v104 = 0;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v104);
                v105 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v106 = self->_scanRetainDuplicates;
                self->_scanRetainDuplicates = v105;

                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_218_2);
                v107 = (id)WiProxLog;
                if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
                {
                  v108 = -[NSNumber BOOLValue](self->_scanRetainDuplicates, "BOOLValue");
                  v109 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
                  v110 = *((unsigned __int8 *)v181 + 24);
                  *(_DWORD *)v301 = 67109632;
                  *(_DWORD *)&v301[4] = v108;
                  LOWORD(v302) = 1024;
                  *(_DWORD *)((char *)&v302 + 2) = v109;
                  HIWORD(v302) = 1024;
                  LODWORD(v303) = v110;
                  _os_log_impl(&dword_2175D1000, v107, OS_LOG_TYPE_INFO, "Retain duplicates:%d (askRetain:%d askReset:%d)", v301, 0x14u);
                }

                objc_msgSend(v165, "enumerateObjectsUsingBlock:", &__block_literal_global_220_1);
                _Block_object_dispose(&v180, 8);
                _Block_object_dispose(buf, 8);
              }
              v180 = 0;
              v181 = &v180;
              v182 = 0x3032000000;
              v183 = __Block_byref_object_copy__2;
              v184 = __Block_byref_object_dispose__2;
              v185 = (id)MEMORY[0x24BDBD1C8];
              v179[0] = v93;
              v179[1] = 3221225472;
              v179[2] = __33__WPDScanManager_updateScanRules__block_invoke_2_221;
              v179[3] = &unk_24D7C5D00;
              v179[4] = &v180;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v179);
              *(_QWORD *)v301 = 0;
              v302 = v301;
              v303 = 0x3032000000;
              v304 = __Block_byref_object_copy__2;
              v305 = __Block_byref_object_dispose__2;
              v306 = v99;
              v178[0] = v93;
              v178[1] = 3221225472;
              v178[2] = __33__WPDScanManager_updateScanRules__block_invoke_3_222;
              v178[3] = &unk_24D7C5D00;
              v178[4] = v301;
              objc_msgSend(v165, "enumerateObjectsUsingBlock:", v178);
              v111 = objc_msgSend((id)v219[5], "BOOLValue");
              -[WPDScanManager logScanTypes:method:window:interval:](self, "logScanTypes:method:window:interval:", v166, v111, v228[3], v233[3]);
              v176 = 0u;
              v177 = 0u;
              v174 = 0u;
              v175 = 0u;
              v163 = v164;
              v112 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v174, v300, 16);
              if (v112)
              {
                v113 = *(_QWORD *)v175;
                v159 = *MEMORY[0x24BDBB0A8];
                v155 = *MEMORY[0x24BDBB100];
                v157 = *MEMORY[0x24BDBB0A0];
                v151 = *MEMORY[0x24BDBB090];
                v153 = *MEMORY[0x24BDBB098];
                v149 = *MEMORY[0x24BDBB0B0];
                v147 = *MEMORY[0x24BDBB190];
                v145 = *(_QWORD *)v175;
                do
                {
                  v114 = 0;
                  v161 = v112;
                  do
                  {
                    if (*(_QWORD *)v175 != v113)
                      objc_enumerationMutation(v163);
                    v115 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v114);
                    if (WPLogInitOnce != -1)
                      dispatch_once(&WPLogInitOnce, &__block_literal_global_224_0);
                    v116 = (id)WiProxLog;
                    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                    {
                      log = v116;
                      objc_msgSend(v115, "objectForKeyedSubscript:", v159);
                      v173 = (id)objc_claimAutoreleasedReturnValue();
                      v168 = objc_msgSend(v173, "integerValue");
                      objc_msgSend(v115, "objectForKeyedSubscript:", v157);
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = objc_msgSend(v171, "integerValue");
                      objc_msgSend(v115, "objectForKeyedSubscript:", v155);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v119 = objc_msgSend(v118, "BOOLValue");
                      objc_msgSend(v115, "objectForKeyedSubscript:", v153);
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v115, "objectForKeyedSubscript:", v151);
                      v121 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v115, "objectForKeyedSubscript:", v149);
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      v123 = objc_msgSend(v122, "count");
                      objc_msgSend(v115, "objectForKeyedSubscript:", v147);
                      v124 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 134219522;
                      *(_QWORD *)&buf[4] = v168;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v117;
                      *(_WORD *)&buf[22] = 1024;
                      v291 = v119;
                      v292 = 2114;
                      v293 = v120;
                      v294 = 2114;
                      v295 = v121;
                      v296 = 2048;
                      v297 = v123;
                      v298 = 2112;
                      v299 = v124;
                      v116 = log;
                      _os_log_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEFAULT, "About to scan for type: %ld - rssi: %ld - range: %d - payload: %{public}@ - mask: %{public}@ - peers: %lu, bundleID: %@", buf, 0x44u);

                      v112 = v161;
                      v113 = v145;

                    }
                    ++v114;
                  }
                  while (v112 != v114);
                  v112 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v174, v300, 16);
                }
                while (v112);
              }

              v125 = *(_QWORD *)(*(_QWORD *)&v307[8] + 40);
              v126 = *MEMORY[0x24BDBB188];
              v288[0] = *MEMORY[0x24BDBB058];
              v288[1] = v126;
              v289[0] = v125;
              v289[1] = MEMORY[0x24BDBD1C8];
              v127 = *MEMORY[0x24BDBB088];
              v289[2] = v163;
              v128 = *MEMORY[0x24BDBB0E0];
              v288[2] = v127;
              v288[3] = v128;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v228[3]);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v289[3] = v129;
              v288[4] = *MEMORY[0x24BDBB0D0];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v233[3]);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v288[5] = *MEMORY[0x24BDBB050];
              v131 = v219[5];
              v289[4] = v130;
              v289[5] = v131;
              v288[6] = *MEMORY[0x24BDBB060];
              v289[6] = v212[5];
              v288[7] = *MEMORY[0x24BDBB078];
              v289[7] = v205[5];
              v288[8] = *MEMORY[0x24BDBB0B8];
              v289[8] = v198[5];
              v288[9] = *MEMORY[0x24BDBB0C0];
              v289[9] = v181[5];
              v288[10] = *MEMORY[0x24BDBB108];
              v289[10] = *((_QWORD *)v302 + 5);
              v288[11] = CFSTR("kCBScanOptionPriorityConfiguration");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v193[3]);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              v289[11] = v132;
              v288[12] = *MEMORY[0x24BDBB0F0];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v189 + 6));
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v288[13] = *MEMORY[0x24BDBB0C8];
              v134 = self->_scanRetainDuplicates;
              v289[12] = v133;
              v289[13] = v134;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v289, v288, 14);
              v135 = (void *)objc_claimAutoreleasedReturnValue();

              v95 = -[WPDScanManager scanOptionsChanged:ForRequests:](self, "scanOptionsChanged:ForRequests:", v135, v165);
              _Block_object_dispose(v301, 8);

              _Block_object_dispose(&v180, 8);
              _Block_object_dispose(&v188, 8);
              _Block_object_dispose(&v192, 8);
              _Block_object_dispose(&v197, 8);

              _Block_object_dispose(&v204, 8);
              _Block_object_dispose(&v211, 8);

              _Block_object_dispose(&v218, 8);
              _Block_object_dispose(v307, 8);

            }
            else
            {
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_213_0);
              v98 = (id)WiProxLog;
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2175D1000, v98, OS_LOG_TYPE_DEFAULT, "Scanning window is too high, not scanning", buf, 2u);
              }

              v95 = -[WPDScanManager scanOptionsChanged:ForRequests:](self, "scanOptionsChanged:ForRequests:", 0, 0);
            }
            _Block_object_dispose(&v227, 8);
          }
          else
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_210);
            v94 = (id)WiProxLog;
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2175D1000, v94, OS_LOG_TYPE_DEFAULT, "Scanning rate is too high, not scanning", buf, 2u);
            }

            v95 = -[WPDScanManager scanOptionsChanged:ForRequests:](self, "scanOptionsChanged:ForRequests:", 0, 0);
          }
          _Block_object_dispose(&v232, 8);
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_207);
          v97 = (id)WiProxLog;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2175D1000, v97, OS_LOG_TYPE_DEFAULT, "No Scan requests that fit the current criteria, bailing", buf, 2u);
          }

          v95 = -[WPDScanManager scanOptionsChanged:ForRequests:](self, "scanOptionsChanged:ForRequests:", 0, 0);
        }

        return v95;
      }
    }
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_180_0);
  v96 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v96, OS_LOG_TYPE_DEFAULT, "Nothing left to scan for - Stopping Scan", buf, 2u);
  }
  return -[WPDScanManager scanOptionsChanged:ForRequests:](self, "scanOptionsChanged:ForRequests:", 0, 0);
}

- (NSMutableDictionary)scanRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

uint64_t __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v6 = 138412546;
    v24 = v6;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "clientType", v24, (_QWORD)v25);
        if (objc_msgSend(*(id *)(a1 + 32), "integerValue") == v11)
        {
          objc_msgSend(v10, "peers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v12, "count"))
          {

LABEL_22:
            v22 = 1;
            goto LABEL_23;
          }
          objc_msgSend(v10, "peers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", *(_QWORD *)(a1 + 40));

          if ((v14 & 1) != 0)
            goto LABEL_22;
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_292_0);
          v15 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
          {
            v17 = *(_QWORD *)(a1 + 40);
            v16 = *(void **)(a1 + 48);
            *(_DWORD *)buf = v24;
            v30 = v16;
            v31 = 2112;
            v32 = v17;
            _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_INFO, "Ignoring scan packet %@ because it's peer %@ is not being tracked", buf, 0x16u);
          }
          if (objc_msgSend(v10, "clientType") == 16)
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_294_0);
            v18 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
            {
              v19 = v18;
              objc_msgSend(v10, "peers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v24;
              v30 = v20;
              v31 = 2112;
              v32 = v21;
              _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_INFO, "NearByInfo scanning for peers %@ but found %@", buf, 0x16u);

            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v7)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_23:

  return v22;
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BYTE *v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  _BYTE *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unint64_t v26;
  unint64_t v27;
  unsigned __int8 *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  id v38;
  __int128 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  WPDScanManager *v51;
  id v52;
  id v53;
  id v54;
  __CFString *v55;
  id v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_283_0);
  v14 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDScanManager centralManager:didDiscoverPeripheral:advertisementData:RSSI:].cold.1(v14, (uint64_t)v11, (uint64_t)v13);
  -[WPDScanManager scanRequests](self, "scanRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDScanManager currentScanners](self, "currentScanners");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDScanManager spyScanClients](self, "spyScanClients");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFC8]);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (_BYTE *)objc_msgSend(v17, "bytes");
  v19 = objc_msgSend(v17, "length");
  if (v19 < 2 || *v18 != 76 || v18[1])
    goto LABEL_30;
  v20 = v19;
  v40 = v15;
  v41 = v13;
  v42 = v12;
  v43 = v11;
  v44 = v10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 < 4)
    goto LABEL_26;
  v22 = &v18[v20];
  v23 = v18 + 2;
  *(_QWORD *)&v21 = 134218242;
  v39 = v21;
  while (1)
  {
    v24 = *v23;
    v25 = v23 + 2;
    v26 = v23[1] & 0x1F;
    v27 = v22 - (v23 + 2);
    if (v27 < v26)
      break;
    v28 = &v25[v26];
    if ((v24 - 27) <= 0xE5u)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_287);
      v29 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v39;
        v58 = v24;
        v59 = 2112;
        v60 = (unint64_t)v17;
        _os_log_debug_impl(&dword_2175D1000, v29, OS_LOG_TYPE_DEBUG, "Unsupported payload type %ld, data %@", buf, 0x16u);
      }
      goto LABEL_20;
    }
LABEL_18:
    if (objc_msgSend(v16, "containsIndex:", *v23, v39))
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v18, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appendBytes:length:", v23, v26 + 2);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setObject:forKey:", v31, v32);

    }
LABEL_20:
    v23 = v28;
    if (v22 - v28 <= 1)
      goto LABEL_26;
  }
  if ((_DWORD)v24 == 4)
  {
    v26 = ((_BYTE)v22 - ((_BYTE)v23 + 2));
    v28 = &v25[v27];
    goto LABEL_18;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_285);
  v33 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v58 = v24;
    v59 = 2048;
    v60 = v26;
    v61 = 2112;
    v62 = v17;
    _os_log_error_impl(&dword_2175D1000, v33, OS_LOG_TYPE_ERROR, "Bad payload type %ld length %zu, data %@", buf, 0x20u);
  }
LABEL_26:
  v11 = v43;
  objc_msgSend(v43, "name", v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(v43, "name");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = CFSTR("Unknown");
  }
  v10 = v44;
  v13 = v41;
  v12 = v42;
  v15 = v40;

  objc_msgSend(v43, "identifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_291;
  v47[3] = &unk_24D7C62C0;
  v48 = v40;
  v49 = v36;
  v50 = v42;
  v51 = self;
  v52 = v43;
  v53 = v41;
  v54 = v17;
  v55 = v35;
  v56 = v46;
  v37 = v35;
  v38 = v36;
  objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v47);

LABEL_30:
}

- (NSMutableSet)spyScanClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (NSIndexSet)currentScanners
{
  return (NSIndexSet *)objc_getProperty(self, a2, 88, 1);
}

- (NSIndexSet)rangingTypes
{
  return self->_rangingTypes;
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (BOOL)shallStop
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;

  if (_os_feature_enabled_impl())
  {
    -[WPDScanManager scanOptions](self, "scanOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBB0C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_279);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDScanManager shallStop].cold.1(v5, v6);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (void)setCurrentScanners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)scanningDisabled
{
  return self->_scanningDisabled;
}

- (void)logScanTypes:(id)a3 method:(BOOL)a4 window:(int64_t)a5 interval:(int64_t)a6
{
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a4)
    v8 = CFSTR("Actively");
  else
    v8 = CFSTR("Passively");
  v9 = (void *)MEMORY[0x24BDD16A8];
  v10 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ scanning for devices of types: "), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__WPDScanManager_logScanTypes_method_window_interval___block_invoke;
  v14[3] = &unk_24D7C5F90;
  v12 = v11;
  v15 = v12;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v14);

  objc_msgSend(v12, "appendFormat:", CFSTR("(Window: %ld/Interval: %ld)"), a5, a6);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_255);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

}

- (BOOL)isScannerTestMode
{
  void *v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[WPDManager testMode](self, "testMode"))
  {
    -[WPDScanManager scanRequests](self, "scanRequests");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __35__WPDScanManager_isScannerTestMode__block_invoke;
    v6[3] = &unk_24D7C59E0;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_164_2);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDScanManager isScannerTestMode].cold.1();
  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)heySiriScanActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[WPDScanManager scanRequests](self, "scanRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v22)
  {
    v6 = *(_QWORD *)v30;
    v23 = v5;
    v21 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v5);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[WPDScanManager scanRequests](self, "scanRequests");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
LABEL_8:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "clientType") == 8)
            {
              if (!v3)
                break;
              -[WPDManager server](self, "server");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isClientTestMode:", v8);

              if ((v17 & 1) != 0)
                break;
            }
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v13)
                goto LABEL_8;
              goto LABEL_16;
            }
          }

          if (-[WPDManager isScanAllowlistedForType:](self, "isScanAllowlistedForType:", 8))
          {
            v18 = 1;
            goto LABEL_26;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_169_1);
          v19 = WiProxLog;
          v18 = 0;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "WPClientHeySiri scan is denylisted or not allowlisted", buf, 2u);
            goto LABEL_25;
          }
          goto LABEL_26;
        }
LABEL_16:

        v5 = v23;
        v6 = v21;
      }
      v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v22)
        continue;
      break;
    }
  }

LABEL_25:
  v18 = 0;
LABEL_26:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_171_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDScanManager heySiriScanActive:].cold.1();
  return v18;
}

void __33__WPDScanManager_updateScanRules__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a2, "scanCache"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C8];

    *a4 = 1;
  }
}

void __44__WPDScanManager_ruleHashesFromScanOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __52__WPDScanManager_scanRequestHashesFromScanRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __33__WPDScanManager_updateScanRules__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;

  result = objc_msgSend(a2, "clientType");
  if ((_DWORD)result == 8)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 22;
    result = objc_msgSend(*(id *)(a1 + 32), "isHomePod");
    v7 = 3;
    if (!(_DWORD)result)
      v7 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
    *a4 = 1;
  }
  return result;
}

- (BOOL)scanOptionsChanged:(id)a3 ForRequests:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  void *v19;
  char v20;
  NSObject *v21;
  int v22;
  void *v23;
  char v24;
  int v25;
  NSObject *v26;
  int v27;
  BOOL v28;
  _QWORD v30[7];
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  v32 = 0;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x219A0EE8C]();
  -[WPDScanManager ruleHashesFromScanOptions:](self, "ruleHashesFromScanOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDScanManager scanRequestHashesFromScanRequests:](self, "scanRequestHashesFromScanRequests:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (-[WPDScanManager scanOptions](self, "scanOptions"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = v11 == 0,
        v11,
        v12))
  {
    -[WPDScanManager scanOptions](self, "scanOptions");
    v15 = objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v34 + 24) = (v6 | v15) != 0;

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_240);
    v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v17 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      v38 = v17;
      v18 = "Scan options changed (from/to nil): %d";
LABEL_29:
      _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_INFO, v18, buf, 8u);
    }
  }
  else
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __49__WPDScanManager_scanOptionsChanged_ForRequests___block_invoke;
    v30[3] = &unk_24D7C5E60;
    v30[4] = self;
    v30[5] = &v33;
    v30[6] = v31;
    objc_msgSend((id)v6, "enumerateKeysAndObjectsUsingBlock:", v30);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_232_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDScanManager scanOptionsChanged:ForRequests:].cold.1();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_234_0);
    v13 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v14 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      v38 = v14;
      _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_INFO, "Scan options changed (options): %d", buf, 8u);
    }
    if (*((_BYTE *)v34 + 24))
    {
      *((_BYTE *)v34 + 24) = 1;
    }
    else
    {
      -[WPDScanManager scanRequestHashes](self, "scanRequestHashes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v10, "isEqualToSet:", v19);
      *((_BYTE *)v34 + 24) = v20 ^ 1;

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_236);
    v21 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v22 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      v38 = v22;
      _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_INFO, "Scan options changed (requests): %d", buf, 8u);
    }
    if (*((_BYTE *)v34 + 24))
    {
      *((_BYTE *)v34 + 24) = 1;
    }
    else
    {
      -[WPDScanManager scanRuleHashes](self, "scanRuleHashes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v9, "isEqualToSet:", v23);
      *((_BYTE *)v34 + 24) = v24 ^ 1;

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_238);
    v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v25 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67109120;
      v38 = v25;
      v18 = "Scan options changed (rules): %d";
      goto LABEL_29;
    }
  }
  if (*((_BYTE *)v34 + 24))
  {
    -[WPDScanManager setScanOptions:](self, "setScanOptions:", v6);
    -[WPDScanManager setScanRequestHashes:](self, "setScanRequestHashes:", v10);
    -[WPDScanManager setScanRuleHashes:](self, "setScanRuleHashes:", v9);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_242);
  v26 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = *((unsigned __int8 *)v34 + 24);
    *(_DWORD *)buf = 67109120;
    v38 = v27;
    _os_log_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEFAULT, "Scan options changed: %d", buf, 8u);
  }

  objc_autoreleasePoolPop(v8);
  v28 = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v28;
}

- (void)setScanRuleHashes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setScanRequestHashes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setScanOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSSet)scanRequestHashes
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (id)scanRequestHashesFromScanRequests:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  if (v3)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2;
    v11 = __Block_byref_object_dispose__2;
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__WPDScanManager_scanRequestHashesFromScanRequests___block_invoke;
    v6[3] = &unk_24D7C5D00;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)ruleHashesFromScanOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBB088]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__2;
      v13 = __Block_byref_object_dispose__2;
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __44__WPDScanManager_ruleHashesFromScanOptions___block_invoke;
      v8[3] = &unk_24D7C5E38;
      v8[4] = &v9;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10[5]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(&v9, 8);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __33__WPDScanManager_updateScanRules__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "clientType") == 16 && objc_msgSend(v8, "nearbyScanMode") == 40)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C8];

    *a4 = 1;
  }

}

void __33__WPDScanManager_updateScanRules__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  NSObject *v8;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "retainDuplicates");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v5 + 24) = v6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v7 = 1;
  }
  else if (objc_msgSend(v4, "startPending"))
  {
    v7 = objc_msgSend(v4, "retainDuplicates") ^ 1;
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_216);
  v8 = (id)WiProxLog;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __33__WPDScanManager_updateScanRules__block_invoke_8_cold_1(v4, v8);

}

void __33__WPDScanManager_updateScanRules__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a2, "priorityCritical"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C8];

    *a4 = 1;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "activeScanning"))
  {
    if (objc_msgSend(v10, "clientType") != 6
      || (objc_msgSend(*(id *)(a1 + 32), "server"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "screenOff"),
          v6,
          (v7 & 1) == 0))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = MEMORY[0x24BDBD1C8];

      *a4 = 1;
    }
  }

}

- (BOOL)retainDuplicates
{
  void *v2;
  char v3;

  -[WPDScanManager scanRetainDuplicates](self, "scanRetainDuplicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)scanRetainDuplicates
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (id)addScanRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
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
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  WPDScanManager *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;
  _QWORD v52[2];
  _BYTE buf[22];
  _BYTE v54[128];
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_131_0);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Adding scan request called", buf, 2u);
  }
  if (-[WPDManager state](self, "state") == 3)
  {
    -[WPDScanManager removeConflictingRequest:forClient:](self, "removeConflictingRequest:forClient:", v6, v7);
    -[WPDScanManager scanRequests](self, "scanRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDScanManager scanRequests](self, "scanRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v41 = self;
    -[WPDScanManager scanRequests](self, "scanRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v7;
    objc_msgSend(v14, "objectForKeyedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v19);
          v21 = objc_msgSend(v20, "clientType");
          if (v21 == objc_msgSend(v6, "clientType"))
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_138_2);
            v22 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
            {
              v23 = v22;
              v24 = objc_msgSend(v6, "clientType");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v42;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v24;
              _os_log_debug_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEBUG, "%@ is already scanning for type %ld. Replacing scan request", buf, 0x16u);

            }
            objc_msgSend(v13, "addObject:", v20);
          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v17);
    }

    -[WPDScanManager scanRequests](v41, "scanRequests");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v42;
    objc_msgSend(v25, "objectForKeyedSubscript:", v42);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minusSet:", v13);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)&buf[14] = 0;
    v51 = 0;
    v52[0] = 0;
    *(_QWORD *)((char *)v52 + 6) = 0;
    objc_msgSend(v6, "blobValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maskValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length"))
    {
      objc_msgSend(v27, "getBytes:length:", buf, objc_msgSend(v27, "length"));
      if (objc_msgSend(v28, "length"))
      {
        objc_msgSend(v28, "getBytes:length:", &v51, objc_msgSend(v28, "length"));
      }
      else
      {
        objc_msgSend(v27, "length");
        __memset_chk();
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 22);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v51, 22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBlobValue:", v33);
    objc_msgSend(v6, "setMaskValue:", v34);
    if (_os_feature_enabled_impl())
      objc_msgSend(v6, "setStartPending:", 1);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_143_2);
    v35 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v47 = 138543618;
      v48 = v6;
      v49 = 2114;
      v50 = v42;
      _os_log_impl(&dword_2175D1000, v35, OS_LOG_TYPE_DEFAULT, "Adding scan request %{public}@ for client %{public}@", v47, 0x16u);
    }
    -[WPDScanManager scanRequests](v41, "scanRequests");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", v42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v6);

    -[WPDManager server](v41, "server");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "statsManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "resetActivity:forType:", 0, objc_msgSend(v6, "clientType"));

    -[WPDScanManager updateScanner](v41, "updateScanner");
    v31 = 0;
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v55 = *MEMORY[0x24BDD0FC8];
    v56[0] = CFSTR("CoreBluetooth is currently powered off");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_136_1);
    v32 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager addScanRequest:forClient:].cold.1(v32, (uint64_t)v6, self);
  }

  return v31;
}

- (void)removeConflictingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _BYTE *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPDManager server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isClientTestMode:", v7);

  v10 = objc_msgSend(v6, "clientType");
  v11 = v10;
  if ((v9 & 1) != 0 || v10 == 18)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_122_0);
    v23 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v39 = 138412802;
      *(_QWORD *)&v39[4] = v7;
      *(_WORD *)&v39[12] = 1024;
      *(_DWORD *)&v39[14] = v9;
      *(_WORD *)&v39[18] = 1024;
      *(_DWORD *)&v39[20] = v11 == 18;
      _os_log_debug_impl(&dword_2175D1000, v23, OS_LOG_TYPE_DEBUG, "%@ skip check for conflicting request: test mode:%d ObjectDiscovery:%d", v39, 0x18u);
    }
  }
  else
  {
    *(_QWORD *)v39 = 0;
    *(_QWORD *)&v39[8] = v39;
    *(_QWORD *)&v39[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__2;
    v41 = __Block_byref_object_dispose__2;
    v42 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    -[WPDScanManager scanRequests](self, "scanRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_123;
    v24[3] = &unk_24D7C5798;
    v24[4] = self;
    v25 = v6;
    v26 = v7;
    v27 = v39;
    v28 = &v29;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v24);

    if (*(_QWORD *)(*(_QWORD *)&v39[8] + 40))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_128_1);
      v13 = (id)WiProxLog;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)&v39[8] + 40);
        -[WPDScanManager scanRequests](self, "scanRequests");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v39[8] + 40));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v14;
        v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "Before removing scan request for client: %@ - %@", buf, 0x16u);

      }
      -[WPDScanManager scanRequests](self, "scanRequests");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v39[8] + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "removeObject:", v30[5]);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_130_1);
      v19 = (id)WiProxLog;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(*(_QWORD *)&v39[8] + 40);
        -[WPDScanManager scanRequests](self, "scanRequests");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v39[8] + 40));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v20;
        v37 = 2112;
        v38 = v22;
        _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "After removing scan request for client: %@ - %@", buf, 0x16u);

      }
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v39, 8);

  }
}

void __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_msgSend(v6, "clientType");
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "clientType")
    && (objc_msgSend(*(id *)(a1 + 40), "isEqual:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_124_2);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = v8;
      v12 = objc_msgSend(v9, "clientType");
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 138412802;
      v15 = v10;
      v16 = 2048;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_2175D1000, v11, OS_LOG_TYPE_ERROR, "%@ is already scanning for type %ld, but new client %@ also wants to scan for same type. Remove existing scan request", (uint8_t *)&v14, 0x20u);

    }
    *a3 = 1;
  }

}

- (void)assertCBDiscoveryScan:(BOOL)a3
{
  _BOOL4 v3;
  WPDScanManager *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_158_2);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDScanManager assertCBDiscoveryScan:].cold.1();
    -[WPDScanManager cbDiscoveryAsserter](v4, "cbDiscoveryAsserter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBB238]);
      -[WPDScanManager setCbDiscoveryAsserter:](v4, "setCbDiscoveryAsserter:", v6);

    }
    -[WPDScanManager cbDiscoveryAsserter](v4, "cbDiscoveryAsserter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateAssertionWithFlags:completion:", 1, &__block_literal_global_153_0);

  }
  else
  {
    -[WPDScanManager cbDiscoveryAsserter](v4, "cbDiscoveryAsserter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_161_2);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDScanManager assertCBDiscoveryScan:].cold.2();
      -[WPDScanManager cbDiscoveryAsserter](v4, "cbDiscoveryAsserter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      -[WPDScanManager setCbDiscoveryAsserter:](v4, "setCbDiscoveryAsserter:", 0);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_163_1);
      v10 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_INFO, "assertCBDiscoveryScan de-asserted", v11, 2u);
      }
    }
  }
  objc_sync_exit(v4);

}

- (CBController)cbDiscoveryAsserter
{
  return (CBController *)objc_getProperty(self, a2, 104, 1);
}

- (id)removeScanRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  WPDScanManager *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1540];
  v38 = *MEMORY[0x24BDD0FC8];
  v39[0] = CFSTR("CoreBluetooth isn't scanning for this device type");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_146_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      -[WPDScanManager removeScanRequest:forClient:].cold.1();
      if (v10)
        goto LABEL_21;
    }
    else if (v10)
    {
      goto LABEL_21;
    }
LABEL_26:
    -[WPDManager server](self, "server");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "statsManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resetActivity:forType:", 0, objc_msgSend(v6, "clientType"));

    -[WPDScanManager updateScanner](self, "updateScanner");
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = self;
  -[WPDScanManager scanRequests](self, "scanRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v7;
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "clientType");
        if (v19 == objc_msgSend(v6, "clientType"))
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_148_1);
          v20 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v34 = v6;
            v35 = 2114;
            v36 = v28;
            _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "Removing scan request %{public}@ for client %{public}@", buf, 0x16u);
          }
          objc_msgSend(v11, "addObject:", v18);

          v10 = 0;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v15);
  }

  self = v27;
  -[WPDScanManager scanRequests](v27, "scanRequests");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  objc_msgSend(v21, "objectForKeyedSubscript:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minusSet:", v11);

  if (!v10)
    goto LABEL_26;
LABEL_21:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_150_1);
  v23 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl(&dword_2175D1000, v23, OS_LOG_TYPE_INFO, "WirelessProximity has no scan requests for client %@", buf, 0xCu);
  }
LABEL_27:

  return v10;
}

- (WPDScanManager)initWithServer:(id)a3
{
  id v4;
  WPDScanManager *v5;
  uint64_t v6;
  NSMutableDictionary *scanRequests;
  uint64_t v8;
  NSMutableDictionary *peerRequests;
  uint64_t v10;
  NSMutableDictionary *connectionsInProgress;
  uint64_t v12;
  NSMutableSet *peripheralConnections;
  uint64_t v14;
  NSIndexSet *currentScanners;
  uint64_t v16;
  NSMutableSet *spyScanClients;
  NSDictionary *scanOptions;
  NSSet *scanRequestHashes;
  NSSet *scanRuleHashes;
  void *v21;
  CBController *cbDiscoveryAsserter;
  NSNumber *scanRetainDuplicates;
  void *v24;
  uint64_t v25;
  NSIndexSet *rangingTypes;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WPDScanManager;
  v5 = -[WPDManager initWithServer:Name:](&v37, sel_initWithServer_Name_, v4, CFSTR("Scanner Central"));
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    scanRequests = v5->_scanRequests;
    v5->_scanRequests = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    peerRequests = v5->_peerRequests;
    v5->_peerRequests = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    connectionsInProgress = v5->_connectionsInProgress;
    v5->_connectionsInProgress = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    peripheralConnections = v5->_peripheralConnections;
    v5->_peripheralConnections = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v14 = objc_claimAutoreleasedReturnValue();
    currentScanners = v5->_currentScanners;
    v5->_currentScanners = (NSIndexSet *)v14;

    v5->_scanning = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    spyScanClients = v5->_spyScanClients;
    v5->_spyScanClients = (NSMutableSet *)v16;

    scanOptions = v5->_scanOptions;
    v5->_scanOptions = 0;

    scanRequestHashes = v5->_scanRequestHashes;
    v5->_scanRequestHashes = 0;

    scanRuleHashes = v5->_scanRuleHashes;
    v5->_scanRuleHashes = 0;

    objc_msgSend(v4, "serverQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_serverQueue, v21);

    cbDiscoveryAsserter = v5->_cbDiscoveryAsserter;
    v5->_cbDiscoveryAsserter = 0;

    scanRetainDuplicates = v5->_scanRetainDuplicates;
    v5->_scanRetainDuplicates = (NSNumber *)MEMORY[0x24BDBD1C0];

    v5->_isRanging = 0;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addIndex:", 15);
    if (+[WPDaemonServer supportsRanging](WPDaemonServer, "supportsRanging"))
      objc_msgSend(v24, "addIndex:", 19);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexSet:", v24);
    rangingTypes = v5->_rangingTypes;
    v5->_rangingTypes = (NSIndexSet *)v25;

    v27 = objc_alloc(MEMORY[0x24BDBB220]);
    -[WPDScanManager serverQueue](v5, "serverQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x24BDBB198];
    v39[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithDelegate:queue:options:", v5, v28, v29);
    -[WPDScanManager setCentralManager:](v5, "setCentralManager:", v30);

    v31 = (void *)MEMORY[0x24BDBCF20];
    -[WPDScanManager centralManager](v5, "centralManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithObject:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDManager setCbManagers:](v5, "setCbManagers:", v33);

    objc_msgSend(v4, "wpdState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDScanManager centralManager](v5, "centralManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerManager:", v35);

  }
  return v5;
}

- (void)cleanup
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WPDScanManager cbDiscoveryAsserter](self, "cbDiscoveryAsserter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDScanManager cbDiscoveryAsserter](self, "cbDiscoveryAsserter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[WPDScanManager setCbDiscoveryAsserter:](self, "setCbDiscoveryAsserter:", 0);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WPDScanManager peripheralConnections](self, "peripheralConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[WPDScanManager centralManager](self, "centralManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cancelPeripheralConnection:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[WPDScanManager scanRequests](self, "scanRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[WPDScanManager spyScanClients](self, "spyScanClients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[WPDScanManager updateScanner](self, "updateScanner");
  v14.receiver = self;
  v14.super_class = (Class)WPDScanManager;
  -[WPDManager cleanup](&v14, sel_cleanup);
}

- (id)generateStateDumpStrings
{
  WPDScanManager *v2;
  void *v3;
  void *v4;
  WPDScanManager *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  WPDScanManager *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  objc_super v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v2 = self;
  v94 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v89.receiver = self;
  v89.super_class = (Class)WPDScanManager;
  -[WPDManager generateStateDumpStrings](&v89, sel_generateStateDumpStrings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v2;
  if (-[WPDManager isInternalBuild](v2, "isInternalBuild"))
  {
    v5 = v2;
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[WPDManager scanAllowlist](v5, "scanAllowlist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WPDManager scanAllowlist](v5, "scanAllowlist");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("all");
    }
    objc_msgSend(v6, "stringWithFormat:", CFSTR("allowlisted scan types: %@\n"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v9);

    if (v7)
    v2 = v72;
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  if (-[WPDScanManager isRanging](v2, "isRanging"))
    v11 = "yes";
  else
    v11 = "no";
  -[WPDScanManager rangingTypes](v2, "rangingTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ranging: %s, supported types: %@\n"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  -[WPDScanManager scanRequests](v2, "scanRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v70)
  {
    v17 = *(_QWORD *)v86;
    v66 = *(_QWORD *)v86;
    v67 = v16;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v86 != v17)
          objc_enumerationMutation(v16);
        v19 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
        -[WPDScanManager scanRequests](v2, "scanRequests");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v21;
        if (v21 && objc_msgSend(v21, "count"))
        {
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v68 = v21;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v82;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v82 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@: %@\n"), v19, *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v28);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
            }
            while (v25);
            v2 = v72;
            v17 = v66;
            v16 = v67;
          }
          v22 = v68;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@: (nil))\n"), v19);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v23);
        }

      }
      v70 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v70);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scan requests (%lu):\n"), objc_msgSend(v14, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObject:", v29);

  objc_msgSend(v65, "addObjectsFromArray:", v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[WPDScanManager peerRequests](v2, "peerRequests");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v78;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v78 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
        -[WPDScanManager peerRequests](v72, "peerRequests");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38 && objc_msgSend(v38, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@: %@\n"), v36, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v39);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tracked peers (%lu):\n"), objc_msgSend(v71, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObject:", v40);

  objc_msgSend(v65, "addObjectsFromArray:", v71);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[WPDScanManager connectionsInProgress](v72, "connectionsInProgress");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "allKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v74;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v74 != v45)
          objc_enumerationMutation(v42);
        v47 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * m);
        -[WPDScanManager connectionsInProgress](v72, "connectionsInProgress");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49 && objc_msgSend(v49, "count"))
        {
          objc_msgSend(v49, "count");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    %@: %@\n"), v47, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObject:", v50);

        }
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
    }
    while (v44);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("connections in progress (%lu):\n"), objc_msgSend(v69, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObject:", v51);

  objc_msgSend(v65, "addObjectsFromArray:", v69);
  v52 = (void *)MEMORY[0x24BDD17C8];
  if (-[WPDScanManager scanning](v72, "scanning"))
    v53 = "yes";
  else
    v53 = "no";
  -[WPDScanManager currentScanners](v72, "currentScanners");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "count");
  -[WPDScanManager currentScanners](v72, "currentScanners");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count");
  if (v57)
  {
    -[WPDScanManager currentScanners](v72, "currentScanners");
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = &stru_24D7CB278;
  }
  objc_msgSend(v52, "stringWithFormat:", CFSTR("scanning: %s types (%lu): %@\n"), v53, v55, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObject:", v59);

  if (v57)
  v60 = (void *)MEMORY[0x24BDD17C8];
  -[WPDScanManager scanOptions](v72, "scanOptions");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringWithFormat:", CFSTR("options: %@\n"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObject:", v62);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v65);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
}

- (void)enableRanging:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_12);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "WPScanManager enable ranging: %d", (uint8_t *)v6, 8u);
  }
  -[WPDScanManager setIsRanging:](self, "setIsRanging:", v3);
  if (-[WPDManager state](self, "state") == 3)
    -[WPDScanManager updateScanner](self, "updateScanner");
}

- (void)addSpyScanClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_116_0);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDScanManager spyScanClients](self, "spyScanClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@", (uint8_t *)&v14, 0xCu);

  }
  -[WPDScanManager spyScanClients](self, "spyScanClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) == 0)
  {
    -[WPDScanManager spyScanClients](self, "spyScanClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_118_1);
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WPDScanManager spyScanClients](self, "spyScanClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@ after adding client %@", (uint8_t *)&v14, 0x16u);

  }
}

- (void)removeSpyScanClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_119_2);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WPDScanManager spyScanClients](self, "spyScanClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@", (uint8_t *)&v14, 0xCu);

  }
  -[WPDScanManager spyScanClients](self, "spyScanClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[WPDScanManager spyScanClients](self, "spyScanClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v4);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_121_1);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[WPDScanManager spyScanClients](self, "spyScanClients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "Current spy scan clients: %@ after removing client %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

void __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isClientTestMode:", v8);

  if ((v7 & 1) == 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__WPDScanManager_removeConflictingRequest_forClient___block_invoke_2;
    v9[3] = &unk_24D7C5770;
    v10 = *(id *)(a1 + 40);
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    v13 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  }
}

- (id)getScanRequestsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WPDScanManager scanRequests](self, "scanRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeScanRequestsForClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_151_2);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "Removing all scan requests for client %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[WPDScanManager scanRequests](self, "scanRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  -[WPDScanManager updateScanner](self, "updateScanner");
}

void __40__WPDScanManager_assertCBDiscoveryScan___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  if (v2)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_154_2);
    v3 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __40__WPDScanManager_assertCBDiscoveryScan___block_invoke_cold_1(v3);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_156_2);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_INFO, "assertCBDiscoveryScan asserted", v5, 2u);
    }
  }

}

void __35__WPDScanManager_isScannerTestMode__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "isClientTestMode:", v8);

  if ((_DWORD)v7)
  {
    v10 = objc_msgSend(v12, "count");

    v11 = v12;
    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

    v11 = v12;
  }

}

- (void)reconcileScanRule:(id)a3 withRule:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBB0A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 18)
  {
    v9 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v5, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionSet:", v14);

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_173;
    v18[3] = &unk_24D7C5AA8;
    v15 = v5;
    v19 = v15;
    v20 = v6;
    v21 = v8;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_178_0);
    v16 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDScanManager reconcileScanRule:withRule:].cold.1((uint64_t)v15, v16, v17);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_172_2);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager reconcileScanRule:withRule:].cold.2();
  }

}

void __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_173(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a2;
  v5 = v4;
  if ((id)*MEMORY[0x24BDBB080] == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");
        if ((v12 & 1) != 0)
        {
          v13 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v2, "BOOLValue");
        }
        objc_msgSend(v10, "numberWithInt:", v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v27, v5);

        if ((v12 & 1) == 0)
        goto LABEL_29;
      }
    }
    goto LABEL_16;
  }
  if ((id)*MEMORY[0x24BDBB0A0] == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");

        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "intValue");

        if ((int)v19 >= (int)v21)
          v22 = v21;
        else
          v22 = v19;
        objc_msgSend(v17, "numberWithInt:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v11 = (void *)v23;
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, v5);
LABEL_29:

        goto LABEL_30;
      }
    }
LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

      goto LABEL_30;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_30;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if ((id)*MEMORY[0x24BDBB0A8] != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_30;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_175_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_173_cold_1();
  }
LABEL_30:

}

- (void)duplicateRulesGuard:(id)a3 forRule:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v6 = a4;
  v7 = *MEMORY[0x24BDBB0A8];
  v8 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__WPDScanManager_duplicateRulesGuard_forRule___block_invoke;
  v12[3] = &unk_24D7C5AF0;
  v14 = v10;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

}

void __46__WPDScanManager_duplicateRulesGuard_forRule___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBB0A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  v8 = *(unsigned __int8 *)(a1 + 48);

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "reconcileScanRule:withRule:", v9, *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

void __33__WPDScanManager_updateScanRules__block_invoke_208(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "screenOff"))
  {
    if (v3)
    {
      objc_msgSend(v3, "scanningRates");
      v5 = v8;
    }
    else
    {
      v5 = 0;
    }
  }
  else if (v3)
  {
    objc_msgSend(v3, "scanningRates");
    v5 = v7;
  }
  else
  {
    v5 = 0;
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 < *(_QWORD *)(v6 + 24))
    *(_QWORD *)(v6 + 24) = v5;

}

void __33__WPDScanManager_updateScanRules__block_invoke_211(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scanningRates");
    v5 = v7;
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 < *(_QWORD *)(v6 + 24))
    *(_QWORD *)(v6 + 24) = v5;

}

void __33__WPDScanManager_updateScanRules__block_invoke_214(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a2, "allowDuplicates"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C8];

    *a4 = 1;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_2_215(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "allowDuplicates") && objc_msgSend(v8, "clientType") != 18)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C8];

    *a4 = 1;
  }

}

uint64_t __33__WPDScanManager_updateScanRules__block_invoke_219(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStartPending:", 0);
}

void __33__WPDScanManager_updateScanRules__block_invoke_2_221(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  if ((objc_msgSend(a2, "range") & 1) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C0];

    *a4 = 1;
  }
}

void __33__WPDScanManager_updateScanRules__block_invoke_3_222(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a2, "holdVoucher"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x24BDBD1C8];

    *a4 = 1;
  }
}

- (void)logScanRequests:(id)a3 method:(BOOL)a4 window:(int64_t)a5 interval:(int64_t)a6
{
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a4)
    v8 = CFSTR("Actively");
  else
    v8 = CFSTR("Passively");
  v9 = (void *)MEMORY[0x24BDD16A8];
  v10 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ scanning for devices of types: "), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__WPDScanManager_logScanRequests_method_window_interval___block_invoke;
  v14[3] = &unk_24D7C5F48;
  v12 = v11;
  v15 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  objc_msgSend(v12, "appendFormat:", CFSTR("(Window: %ld/Interval: %ld)"), a5, a6);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_253);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

}

uint64_t __57__WPDScanManager_logScanRequests_method_window_interval___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%ld "), objc_msgSend(a2, "clientType"));
}

- (id)clearDuplicateFilterCache:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1540];
  v33 = *MEMORY[0x24BDD0FC8];
  v34[0] = CFSTR("CoreBluetooth isn't scanning for this device type");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[WPDScanManager scanRequests](self, "scanRequests", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "clientType");
          if (v17 == objc_msgSend(v6, "clientType"))
          {

            v10 = 0;
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_256_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager removeScanRequest:forClient:].cold.1();
  }
  if (v10)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_258_0);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_INFO, "WirelessProximity has no scan requests for client %@", buf, 0xCu);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_260_0);
    v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = objc_msgSend(v6, "clientType");
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "About to clearDuplicateFilterCache for type: %d", buf, 8u);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v6, "clientType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, *MEMORY[0x24BDBB048]);

    -[WPDScanManager centralManager](self, "centralManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clearDuplicateFilterCache:", v22);

  }
  return v10;
}

- (void)clearExistingConnections
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WPDScanManager peripheralConnections](self, "peripheralConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[WPDManager server](self, "server");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAllClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_262);

}

void __42__WPDScanManager_clearExistingConnections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "resetConnection");
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_267);
      v3 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        __42__WPDScanManager_clearExistingConnections__block_invoke_cold_2(v3);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_263);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __42__WPDScanManager_clearExistingConnections__block_invoke_cold_1();
  }

}

- (void)centralManagerDidUpdateState:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WPDScanManager;
  -[WPDManager cbManagerDidUpdateState:](&v3, sel_cbManagerDidUpdateState_, a3);
}

- (void)update
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  _BYTE v22[10];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_270_0);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v21 = 67109376;
    *(_DWORD *)v22 = -[WPDManager state](self, "state");
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = -[WPDManager restricted](self, "restricted");
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "Scanner Central manager update with state: %d restricted: %d", (uint8_t *)&v21, 0xEu);

  }
  switch(-[WPDManager state](self, "state"))
  {
    case 0:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_278_0);
      v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "Scanner Central manager state is unknown", (uint8_t *)&v21, 2u);
      }
      break;
    case 1:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_276);
      v6 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDScanManager peripheralConnections](self, "peripheralConnections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        *(_QWORD *)v22 = v8;
        *(_WORD *)&v22[8] = 2112;
        v23 = v9;
        _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Scanner Central manager is resetting - reset connection in progress %@ and peripheral connections %@", (uint8_t *)&v21, 0x16u);

      }
      goto LABEL_18;
    case 2:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_274);
      v10 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        -[WPDScanManager centralManager](self, "centralManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "state");
        -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDScanManager peripheralConnections](self, "peripheralConnections");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218498;
        *(_QWORD *)v22 = v13;
        *(_WORD *)&v22[8] = 2112;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "Scanner Central manager is unknown, powered off, unauthorized or not supported (%ld) - reset connection in progress %@ and peripheral connections %@", (uint8_t *)&v21, 0x20u);

      }
LABEL_18:
      -[WPDScanManager clearExistingConnections](self, "clearExistingConnections");
      -[WPDManager server](self, "server");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "statsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stopActivity:", 0);

      break;
    case 3:
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_272_0);
      v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = -[WPDManager restricted](self, "restricted");
        v21 = 67109120;
        *(_DWORD *)v22 = v20;
        _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "Scanner Central manager is powered on, restricted: %d", (uint8_t *)&v21, 8u);

      }
      -[WPDScanManager updateScanner](self, "updateScanner");
      break;
    default:
      return;
  }
}

void __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  NSObject *log;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _QWORD v75[12];
  _QWORD v76[15];

  v76[12] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_2;
  v66[3] = &unk_24D7C6258;
  v8 = v5;
  v67 = v8;
  v68 = *(id *)(a1 + 40);
  v9 = v6;
  v69 = v9;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", v66);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDBAFE8];
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFE8]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDBAFF0];
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFF0]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDBAFE0];
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFE0]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDBAFD0];
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFD0]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v48 = (void *)v11;
  if (v11)
    objc_msgSend(v15, "removeObjectForKey:", v10);
  if (v57)
    objc_msgSend(v16, "removeObjectForKey:", v12);
  if (v56)
    objc_msgSend(v16, "removeObjectForKey:", v13);
  if (v55)
    objc_msgSend(v16, "removeObjectForKey:", v14);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFA0]);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAF98]);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFD8]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDBAFF8]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "integerValue") == 15
    || objc_msgSend(v8, "integerValue") == 16
    || objc_msgSend(v8, "integerValue") == 7)
  {
    objc_msgSend(*(id *)(a1 + 56), "centralManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sharedPairingAgent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isPeerPaired:", *(_QWORD *)(a1 + 64));

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kCBAdvDataProximityPairingStatusDecrypted"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kCBAdvDataAccessoryStatusDecrypted"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = CFSTR("kDeviceAdvertisingPacket");
  v75[1] = CFSTR("kDeviceAdvertisingData");
  v47 = v16;
  v76[0] = v16;
  v76[1] = v9;
  v22 = &unk_24D7D7EA8;
  if (v18)
    v22 = (void *)v18;
  v76[2] = v22;
  v75[2] = CFSTR("kDeviceChannel");
  v75[3] = CFSTR("kDeviceAddress");
  v23 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = *(_QWORD *)(a1 + 72);
  v25 = *(_QWORD *)(a1 + 80);
  v76[3] = v23;
  v76[4] = v24;
  v75[4] = CFSTR("kDeviceRSSI");
  v75[5] = CFSTR("kDevicePeripheralUUID");
  v76[5] = *(_QWORD *)(a1 + 40);
  v76[6] = v25;
  v75[6] = CFSTR("kDeviceManufacturerData");
  v75[7] = CFSTR("kDeviceName");
  v76[7] = *(_QWORD *)(a1 + 88);
  v76[8] = v8;
  v50 = v8;
  v75[8] = CFSTR("kDeviceType");
  v75[9] = CFSTR("kDevicePaired");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v76[9] = v26;
  v75[10] = CFSTR("kDeviceTime");
  v27 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v75[11] = CFSTR("kDeviceDataSaturated");
  v28 = (void *)MEMORY[0x24BDBD1C0];
  if (v54)
    v28 = v54;
  v76[10] = v27;
  v76[11] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  if (!v53)
  if (!v17)

  if (v52)
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v52, CFSTR("kDeviceProxPairingStatusDecrypted"));
  v45 = (void *)v18;
  v46 = (void *)v17;
  v49 = v9;
  if (v51)
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v51, CFSTR("kDeviceAccessoryStatusDecrypted"), v18, v17, v16, v48, v9);
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_301;
  v64[3] = &unk_24D7C45D8;
  v64[4] = *(_QWORD *)(a1 + 56);
  v31 = v30;
  v65 = v31;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v64);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v32 = *(id *)(a1 + 96);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v61;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v61 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v36);
        objc_msgSend(*(id *)(a1 + 56), "server", v45);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "getClientForUUID:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v40 = (void *)objc_msgSend(v31, "copy");
          objc_msgSend(v39, "anyDiscoveredDevice:", v40);

        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_306);
          v41 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          {
            v42 = *(void **)(a1 + 56);
            log = v41;
            objc_msgSend(v42, "server");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "getAllClients");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v71 = v37;
            v72 = 2112;
            v73 = v44;
            _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "Spy client %@ doesn't exist in current all clients: %@", buf, 0x16u);

          }
        }

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v34);
  }

}

void __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_301(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getClientForUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v5, "discoveredDevice:", v6);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_303);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_301_cold_1();
  }

}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_308_0);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDScanManager centralManager:didDiscoverMultiplePeripherals:].cold.1(v7);

}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_309);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPDScanManager UNEXPECTED didFailToScanWithError %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_311);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "WPDScanManager scan failed to start - TODO add proper cleanup", (uint8_t *)&v9, 2u);
  }

}

+ (int64_t)zonesAvailableForType:(unsigned __int8)a3
{
  if ((a3 - 9) < 8u && ((0xCBu >> (a3 - 9)) & 1) != 0)
    return 15;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_312);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    +[WPDScanManager zonesAvailableForType:].cold.1();
  return 0;
}

- (id)addPeerTrackingRequest:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "clientType");
  if (-[WPDManager state](self, "state") == 3)
  {
    -[WPDScanManager peerRequests](self, "peerRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v10, "containsObject:", v6) & 1) != 0)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_324);
      v11 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v12 = v11;
        objc_msgSend(v6, "peerUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = (unint64_t)v13;
        _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_INFO, "Peer %@ is already being tracked", buf, 0xCu);

      }
LABEL_24:
      v15 = 0;
      goto LABEL_34;
    }
    v16 = +[WPDScanManager zonesAvailableForType:](WPDScanManager, "zonesAvailableForType:", v8);
    if (objc_msgSend(v10, "count") >= v16)
    {
      -[WPDManager server](self, "server");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "getClientForUUID:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "peerTrackingFull");

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Peer tracking maxed out for client %ld (%lu slots)"), objc_msgSend(v6, "clientType"), objc_msgSend(v10, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDD0FC8];
      v36 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 14, v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_322);
      v29 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = (unint64_t)v26;
        _os_log_impl(&dword_2175D1000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v10, "addObject:", v6);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_318);
      v17 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        *(_DWORD *)buf = 134218496;
        v38 = objc_msgSend(v6, "clientType");
        v39 = 2048;
        v40 = objc_msgSend(v10, "count");
        v41 = 2048;
        v42 = v16;
        _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_INFO, "Adding peer tracking request for client %ld. Using (%lu/%lu) tracking slots", buf, 0x20u);

      }
      objc_msgSend(v6, "peerUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[WPDScanManager startTrackingPeripheral:ofType:](self, "startTrackingPeripheral:ofType:", v19, v20);

      if (v21)
      {
        -[WPDScanManager peerRequests](self, "peerRequests");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, v7);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_326_0);
        v23 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPDScanManager addPeerTrackingRequest:forClient:].cold.1(v23);
        goto LABEL_24;
      }
      v30 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      v34 = CFSTR("Unknown error");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 26, v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_330);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDScanManager addPeerTrackingRequest:forClient:].cold.2();
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_313);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager addPeerTrackingRequest:forClient:].cold.3();
    v14 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    v44[0] = CFSTR("Trying to start tracking when central manager is not powered on");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:

  return v15;
}

- (id)removePeerTrackingRequest:(id)a3 checkZonesAvailable:(BOOL)a4 forClient:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_331);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 67109120;
    v27 = -[WPDManager state](self, "state");
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "Remove peer tracking when central state is %d", buf, 8u);

  }
  v12 = objc_msgSend(v8, "clientType");
  objc_msgSend(v8, "peerUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDScanManager peerRequests](self, "peerRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "containsObject:", v8))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_333);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDScanManager removePeerTrackingRequest:checkZonesAvailable:forClient:].cold.1();
    objc_msgSend(v15, "removeObject:", v8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDScanManager stopTrackingPeripheral:ofType:](self, "stopTrackingPeripheral:ofType:", v13, v16);

    if (!a4
      || (v17 = +[WPDScanManager zonesAvailableForType:](WPDScanManager, "zonesAvailableForType:", v12),
          objc_msgSend(v15, "count") >= v17))
    {
      v20 = 0;
      goto LABEL_19;
    }
    -[WPDManager server](self, "server");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getClientForUUID:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "peerTrackingAvailable");

    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't find peer tracking request for peer %@ of type %ld (internal error)"), v13, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    v25 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 16, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_337);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager removePeerTrackingRequest:checkZonesAvailable:forClient:].cold.2();
  }

LABEL_19:
  return v20;
}

- (void)removeAllPeerTrackingRequestsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPDScanManager peerRequests](self, "peerRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_338);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "Removing all peer tracking requests for client %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__WPDScanManager_removeAllPeerTrackingRequestsForClient___block_invoke_339;
  v9[3] = &unk_24D7C64A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

id __57__WPDScanManager_removeAllPeerTrackingRequestsForClient___block_invoke_339(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "removePeerTrackingRequest:checkZonesAvailable:forClient:", a2, 0, *(_QWORD *)(a1 + 40));
}

- (BOOL)startTrackingPeripheral:(id)a3 ofType:(id)a4
{
  return 0;
}

- (id)retrievePeripheralWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WPDManager state](self, "state") == 3)
  {
    -[WPDScanManager centralManager](self, "centralManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "retrievePeripheralsWithIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_341);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager retrievePeripheralWithUUID:].cold.1(v9);
    v8 = 0;
  }

  return v8;
}

- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WPDScanManager *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_342);
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2048;
    v21 = objc_msgSend(v7, "integerValue");
    _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_INFO, "Lost a peer %@ of type %ld", buf, 0x16u);

  }
  -[WPDScanManager peerRequests](self, "peerRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_343;
  v14[3] = &unk_24D7C6538;
  v15 = v8;
  v16 = v7;
  v17 = self;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_343(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_2;
  v9[3] = &unk_24D7C6510;
  v10 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v9);

}

void __59__WPDScanManager_centralManager_didLosePeripheral_forType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "peerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)))
    goto LABEL_4;
  v4 = objc_msgSend(v9, "clientType");
  v5 = objc_msgSend(*(id *)(a1 + 40), "unsignedCharValue");

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getClientForUUID:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "peerUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lostPeer:ofType:", v7, objc_msgSend(*(id *)(a1 + 40), "integerValue"));

    v8 = (id)objc_msgSend(*(id *)(a1 + 48), "removePeerTrackingRequest:checkZonesAvailable:forClient:", v9, 1, *(_QWORD *)(a1 + 56));
LABEL_4:

  }
}

- (void)centralManager:(id)a3 didFindPeripheral:(id)a4 forType:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WPDScanManager *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_344);
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2048;
    v21 = objc_msgSend(v7, "integerValue");
    _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "Found a peer %@ of type %ld", buf, 0x16u);

  }
  -[WPDScanManager peerRequests](self, "peerRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_345;
  v14[3] = &unk_24D7C6538;
  v15 = v8;
  v16 = v7;
  v17 = self;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_345(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_2;
  v9[3] = &unk_24D7C6510;
  v10 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v9);

}

void __59__WPDScanManager_centralManager_didFindPeripheral_forType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "peerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)))
    goto LABEL_4;
  v4 = objc_msgSend(v8, "clientType");
  v5 = objc_msgSend(*(id *)(a1 + 40), "unsignedCharValue");

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getClientForUUID:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "peerUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "foundPeer:ofType:", v7, objc_msgSend(*(id *)(a1 + 40), "integerValue"));

LABEL_4:
  }

}

- (id)connectToPeripheral:(id)a3 fromClient:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[5];
  id v37;
  _BYTE *v38;
  uint64_t v39;
  const __CFString *v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[WPDManager state](self, "state") == 3)
  {
    -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && objc_msgSend(v12, "count"))
    {
      if (objc_msgSend(v12, "containsObject:", v9))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_348_0);
        v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "Wireless Proximity is already connecting to peripheral %@ for client %@ - ignore the processing", buf, 0x16u);
        }
        v14 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[WPDManager server](self, "server");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getClientForUUID:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clientTypeString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = buf;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v42 = __Block_byref_object_copy__2;
      v43 = __Block_byref_object_dispose__2;
      v44 = 0;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __61__WPDScanManager_connectToPeripheral_fromClient_withOptions___block_invoke_349;
      v36[3] = &unk_24D7C65C0;
      v36[4] = self;
      v21 = v20;
      v37 = v21;
      v38 = buf;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v36);
      v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v22)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_352);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDScanManager connectToPeripheral:fromClient:withOptions:].cold.2();
        v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
      }

      _Block_object_dispose(buf, 8);
      if (v22)
        goto LABEL_30;
    }
    -[WPDScanManager retrievePeripheralWithUUID:](self, "retrievePeripheralWithUUID:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[WPDScanManager centralManager](self, "centralManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "connectPeripheral:options:", v23, v10);

      -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v8);

      }
      -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v9);

      -[WPDScanManager peripheralConnections](self, "peripheralConnections");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v23);

      v14 = 0;
    }
    else
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      v40 = CFSTR("Wireless Proximity can't retrieve the peripheral specified");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 6, v34);
      v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_356);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDScanManager connectToPeripheral:fromClient:withOptions:].cold.1();
    }

    goto LABEL_30;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  v45 = *MEMORY[0x24BDD0FC8];
  v46[0] = CFSTR("CoreBluetooth is currently powered off");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v16);
  v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_346);
  v17 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDScanManager connectToPeripheral:fromClient:withOptions:].cold.3(v17, self);
LABEL_31:

  return v14;
}

void __61__WPDScanManager_connectToPeripheral_fromClient_withOptions___block_invoke_349(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getClientForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "clientTypeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", a1[5]))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = CFSTR("Wireless Proximity is already trying to connect for this type");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 18, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a3 = 1;
  }

}

- (id)disconnectFromPeripheral:(id)a3 withSubscribedCharacteristics:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  WPDScanManager *v37;
  id v38;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  const __CFString *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_357);
  v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v57 = v8;
    v58 = 2114;
    v59 = v9;
    v60 = 2114;
    v61 = v10;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "Disconnect from peripheral: %{public}@, characteristics: %{public}@, for client: %{public}@", buf, 0x20u);
  }
  -[WPDScanManager retrievePeripheralWithUUID:](self, "retrievePeripheralWithUUID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v37 = self;
    v38 = v10;
    v39 = v8;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v12, "services");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v49;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v49 != v41)
            objc_enumerationMutation(obj);
          v43 = v14;
          v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          objc_msgSend(v15, "characteristics");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v45;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v45 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
                objc_msgSend(v21, "UUID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "UUIDString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v9, "containsObject:", v23);

                if (v24)
                {
                  if (WPLogInitOnce != -1)
                    dispatch_once(&WPLogInitOnce, &__block_literal_global_361);
                  v25 = (void *)WiProxLog;
                  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
                  {
                    v26 = v25;
                    objc_msgSend(v21, "UUID");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "UUIDString");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v57 = v28;
                    _os_log_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEFAULT, "Setting notify value to off for characteristic %{public}@", buf, 0xCu);

                  }
                  objc_msgSend(v13, "setNotifyValue:forCharacteristic:", 0, v21);
                }
                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            }
            while (v18);
          }

          v14 = v43 + 1;
        }
        while (v43 + 1 != v42);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v42);
    }

    -[WPDScanManager connectionsInProgress](v37, "connectionsInProgress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeObjectForKey:", v30);

    -[WPDScanManager peripheralConnections](v37, "peripheralConnections");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeObject:", v13);

    -[WPDScanManager centralManager](v37, "centralManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cancelPeripheralConnection:", v13);

    v33 = 0;
    v10 = v38;
    v8 = v39;
  }
  else
  {
    v34 = (void *)MEMORY[0x24BDD1540];
    v54 = *MEMORY[0x24BDD0FC8];
    v55 = CFSTR("Wireless Proximity can't retrieve the peripheral specified");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 6, v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_359);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDScanManager disconnectFromPeripheral:withSubscribedCharacteristics:forClient:].cold.1();
  }

  return v33;
}

- (void)disconnectFromCentral:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_362);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Disconnecting from central %{public}@ for client %{public}@", buf, 0x16u);
  }
  -[WPDScanManager retrievePeripheralWithUUID:](self, "retrievePeripheralWithUUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WPDScanManager centralManager](self, "centralManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDBB010];
    v16 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelPeripheralConnection:options:", v9, v11);

    -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

    -[WPDScanManager peripheralConnections](self, "peripheralConnections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v9);

  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_363);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 2048;
    v27 = objc_msgSend(v7, "role");
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "Connected to device (%{public}@) with UUID %{public}@ and role %ld", buf, 0x20u);

  }
  -[WPDScanManager peripheralConnections](self, "peripheralConnections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v7);

  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_365);
  v16 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v15;
    _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "Current Connection clients %@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_366;
  v19[3] = &unk_24D7C6808;
  v19[4] = self;
  v20 = v7;
  v21 = v15;
  v17 = v15;
  v18 = v7;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);

}

void __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_366(id *a1, void *a2)
{
  WPDConnection *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  WPDConnection *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  WPDConnection *v14;
  WPDConnection *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  WPDConnection *v30;
  NSObject *v31;
  const char *v32;
  int v33;
  WPDConnection *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_367);
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138412290;
    v34 = v3;
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "connection client uuid %@", (uint8_t *)&v33, 0xCu);
  }
  objc_msgSend(a1[4], "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getClientForUUID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a1 + 5;
  objc_msgSend(a1[5], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionForUUID:", v8);
  v9 = (WPDConnection *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v9)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_369);
      v10 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        objc_msgSend(v6, "clientUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v7, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v9;
        v35 = 2114;
        v36 = v12;
        v37 = 2114;
        v38 = v13;
        _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ already exists for client %{public}@ for peripheral %{public}@", (uint8_t *)&v33, 0x20u);

      }
      -[WPDConnection getPeripheral](v9, "getPeripheral");
      v14 = (WPDConnection *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        -[WPDConnection services](v14, "services");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_371);
          v17 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v33) = 0;
            _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "Services are discovered already", (uint8_t *)&v33, 2u);
          }
          -[WPDConnection subscribedCharacteristics](v9, "subscribedCharacteristics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_373);
            v20 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v33) = 0;
              _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "Characteristics are discovered and subscribed", (uint8_t *)&v33, 2u);
            }
            -[WPDConnection getPeripheralUUID](v9, "getPeripheralUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "connectedDevice:withError:shouldDiscover:", v21, 0, 0);

            goto LABEL_50;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_375);
          v31 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_50;
          LOWORD(v33) = 0;
          v32 = "Peripheral connection exist but characteristic discovery is in progress.. wait";
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_377);
          v31 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_50;
          LOWORD(v33) = 0;
          v32 = "Peripheral connection exist but service discovery is in progress.. wait";
        }
        _os_log_impl(&dword_2175D1000, v31, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v33, 2u);
LABEL_50:

        goto LABEL_51;
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_379);
      v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v25;
        objc_msgSend(v6, "clientUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v7, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412802;
        v34 = v9;
        v35 = 2112;
        v36 = v27;
        v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEFAULT, "Updating connection(%@) for client(%@) with peripheral(%@)", (uint8_t *)&v33, 0x20u);

      }
      -[WPDConnection updateWithPeripheral:](v9, "updateWithPeripheral:", *v7);
      v29 = v6;
      v30 = v9;
LABEL_40:
      objc_msgSend(v29, "createdConnection:", v30);
      goto LABEL_50;
    }
    if (objc_msgSend(*v7, "role") != 1)
    {
      v15 = -[WPDConnection initWithPeripheral:]([WPDConnection alloc], "initWithPeripheral:", *v7);
      -[WPDConnection setClient:](v15, "setClient:", v6);
      v29 = v6;
      v30 = v15;
      goto LABEL_40;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_381);
    v24 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_2175D1000, v24, OS_LOG_TYPE_DEFAULT, "Connected as peripheral, wait for subscribed notification from central", (uint8_t *)&v33, 2u);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_384);
    v22 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_366_cold_1((uint64_t)v3, (uint64_t)(a1 + 5), v22);
    if (objc_msgSend(a1[6], "count") == 1)
    {
      objc_msgSend(a1[4], "centralManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cancelPeripheralConnection:", a1[5]);

    }
  }
LABEL_51:

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_385);
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDScanManager centralManager:didFailToConnectPeripheral:error:].cold.1(v11, v9);
  v12 = v9;
  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __66__WPDScanManager_centralManager_didFailToConnectPeripheral_error___block_invoke_386;
  v21[3] = &unk_24D7C6808;
  v21[4] = self;
  v22 = v12;
  v23 = v10;
  v16 = v10;
  v17 = v12;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);
  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v19);

  -[WPDScanManager peripheralConnections](self, "peripheralConnections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObject:", v17);

}

void __66__WPDScanManager_centralManager_didFailToConnectPeripheral_error___block_invoke_386(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getClientForUUID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectedDevice:withError:shouldDiscover:", v6, *(_QWORD *)(a1 + 48), 0);

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = v7;
  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __63__WPDScanManager_centralManager_didDisconnectPeripheral_error___block_invoke;
  v22[3] = &unk_24D7C6808;
  v22[4] = self;
  v13 = v9;
  v23 = v13;
  v14 = v8;
  v24 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);
  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v16);

  -[WPDScanManager peripheralConnections](self, "peripheralConnections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v13);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_387);
  v18 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    v27 = 2114;
    v28 = v21;
    _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "Disconnected from peripheral %{public}@ with Error: %{public}@", buf, 0x16u);

  }
}

void __63__WPDScanManager_centralManager_didDisconnectPeripheral_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getClientForUUID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disconnectedPeer:error:", v6, *(_QWORD *)(a1 + 48));

}

- (void)removePeripheralConnection:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  WPDScanManager *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_388);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Removing connection to peer %{public}@ for client %{public}@", buf, 0x16u);
  }
  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__WPDScanManager_removePeripheralConnection_forClient___block_invoke_389;
  v13[3] = &unk_24D7C6808;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

void __55__WPDScanManager_removePeripheralConnection_forClient___block_invoke_389(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "connectionsInProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "retrievePeripheralWithUUID:", *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "peripheralConnections");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v7);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_390);
        v9 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138543362;
          v20 = v7;
          _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "Removing CBPeripheral object %{public}@", (uint8_t *)&v19, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "centralManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancelPeripheralConnection:", v7);

      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_392);
      v11 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 40);
        v13 = *(void **)(a1 + 48);
        v14 = v11;
        objc_msgSend(v12, "connectionsInProgress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v13;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "Don't disconnect because peer %@ has more than one connections %@", (uint8_t *)&v19, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "connectionsInProgress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObject:", v3);

  }
}

- (void)removePeripheralConnectionsForClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WPDScanManager *v9;

  v4 = a3;
  -[WPDScanManager connectionsInProgress](self, "connectionsInProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__WPDScanManager_removePeripheralConnectionsForClient___block_invoke;
  v7[3] = &unk_24D7C68D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __55__WPDScanManager_removePeripheralConnectionsForClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "connectionsInProgress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanningDisabled:(BOOL)a3
{
  self->_scanningDisabled = a3;
}

- (void)setScanRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)peerRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPeerRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)connectionsInProgress
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionsInProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableSet)peripheralConnections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPeripheralConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setCentralManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setCbDiscoveryAsserter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setSpyScanClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSSet)scanRuleHashes
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (OS_dispatch_queue)serverQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_serverQueue);
}

- (void)setServerQueue:(id)a3
{
  objc_storeWeak((id *)&self->_serverQueue, a3);
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (void)setScanRetainDuplicates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanRetainDuplicates, 0);
  objc_storeStrong((id *)&self->_rangingTypes, 0);
  objc_destroyWeak((id *)&self->_serverQueue);
  objc_storeStrong((id *)&self->_scanRuleHashes, 0);
  objc_storeStrong((id *)&self->_scanRequestHashes, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_spyScanClients, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryAsserter, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_currentScanners, 0);
  objc_storeStrong((id *)&self->_peripheralConnections, 0);
  objc_storeStrong((id *)&self->_connectionsInProgress, 0);
  objc_storeStrong((id *)&self->_peerRequests, 0);
  objc_storeStrong((id *)&self->_scanRequests, 0);
}

- (void)addScanRequest:(void *)a3 forClient:.cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2_1(a1);
  v5[0] = 67109376;
  v5[1] = objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "clientType");
  v6 = 2048;
  v7 = objc_msgSend(a3, "state");
  _os_log_error_impl(&dword_2175D1000, v3, OS_LOG_TYPE_ERROR, "Failed to start a scan for type %d - central is not powered on %ld", (uint8_t *)v5, 0x12u);

  OUTLINED_FUNCTION_1_1();
}

- (void)removeScanRequest:forClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "No scan request object was provided for client %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)assertCBDiscoveryScan:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "assertCBDiscoveryScan asserting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)assertCBDiscoveryScan:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "assertCBDiscoveryScan de-asserting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__WPDScanManager_assertCBDiscoveryScan___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "assertCBDiscoveryScan failed to assert with error: %@", v4);

  OUTLINED_FUNCTION_8();
}

- (void)isScannerTestMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "scannerTestMode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)heySiriScanActive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "heySiriScanActive: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)reconcileScanRule:(uint64_t)a3 withRule:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = 18;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, a2, a3, "Reconcile scan rules for type %ld - %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)reconcileScanRule:withRule:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "Reconcile scan rules for type %ld - removed (not supported type)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __45__WPDScanManager_reconcileScanRule_withRule___block_invoke_173_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_14(&dword_2175D1000, v1, (uint64_t)v1, "Reconcile scan rules for type %ld - unexpected key ignored:%@", v2);
  OUTLINED_FUNCTION_0();
}

void __33__WPDScanManager_updateScanRules__block_invoke_8_cold_1(void *a1, NSObject *a2)
{
  int v4;
  int v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "clientType");
  v5 = objc_msgSend(a1, "retainDuplicates");
  if (objc_msgSend(a1, "startPending"))
    v6 = objc_msgSend(a1, "retainDuplicates") ^ 1;
  else
    v6 = 0;
  v7[0] = 67109632;
  v7[1] = v4;
  v8 = 1024;
  v9 = v5;
  v10 = 1024;
  v11 = v6;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "Retain duplicates type:%d retain:%d reset:%d)", (uint8_t *)v7, 0x14u);
  OUTLINED_FUNCTION_1_1();
}

- (void)scanOptionsChanged:ForRequests:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_2175D1000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __42__WPDScanManager_clearExistingConnections__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPDClient is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__WPDScanManager_clearExistingConnections__block_invoke_cold_2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "Client %@ does not respond to selector resetConnection", v4);

  OUTLINED_FUNCTION_8();
}

- (void)shallStop
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "WPDScanManager shall call stopScan:%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)centralManager:(uint64_t)a3 didDiscoverPeripheral:advertisementData:RSSI:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_1();
  v8 = a3;
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v3, v6, "WPDScanManager didDiscoverPeripheral:%@ RSSI%@", v7);

  OUTLINED_FUNCTION_1_1();
}

void __78__WPDScanManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_301_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "Client with UUID (%@) doesn't exist, but we've still got a scan request for it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)centralManager:(void *)a1 didDiscoverMultiplePeripherals:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v2, "WPDScanManager UNEXPECTED didDiscoverMultiplePeripherals %lu peripherals", v3);

  OUTLINED_FUNCTION_8();
}

+ (void)zonesAvailableForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "Peer tracking request received for a type that doesn't support it (%ld)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addPeerTrackingRequest:(void *)a1 forClient:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "peerRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_2175D1000, v1, OS_LOG_TYPE_DEBUG, "Currently tracking peers: %@", v3, 0xCu);

  OUTLINED_FUNCTION_8();
}

- (void)addPeerTrackingRequest:forClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "Unknown error while attempting to track a peer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addPeerTrackingRequest:forClient:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "Failed to start tracking peer - central is not powered on %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)removePeerTrackingRequest:checkZonesAvailable:forClient:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v1, (uint64_t)v1, "Removing tracking for peer %@ of type %ld", v2);
  OUTLINED_FUNCTION_0();
}

- (void)removePeerTrackingRequest:checkZonesAvailable:forClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)retrievePeripheralWithUUID:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "centralManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "Failed to retrieve peripherals with identifiers - central is not powered on: %ld", v4);

  OUTLINED_FUNCTION_8();
}

- (void)connectToPeripheral:fromClient:withOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "Wireless Proximity can't retrieve peripheral with UUID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)connectToPeripheral:fromClient:withOptions:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15_1();
  v3 = v0;
  OUTLINED_FUNCTION_14(&dword_2175D1000, v1, (uint64_t)v1, "Wireless Proximity is already connecting to peripheral %@ for type %@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)connectToPeripheral:(void *)a1 fromClient:(void *)a2 withOptions:.cold.3(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "state");
  _os_log_error_impl(&dword_2175D1000, v3, OS_LOG_TYPE_ERROR, "Failed to create connection - central is not powered on %d", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_0();
}

- (void)disconnectFromPeripheral:withSubscribedCharacteristics:forClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_2175D1000, v0, v1, "Couldn't find peripheral to disconnect from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __54__WPDScanManager_centralManager_didConnectPeripheral___block_invoke_366_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_14(&dword_2175D1000, v3, v7, "Error getting client %{public}@ to inform about connection to peripheral %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)centralManager:(void *)a1 didFailToConnectPeripheral:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a2;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_14(&dword_2175D1000, v2, v5, "Failed to connect to peripheral %@ Error: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

@end
