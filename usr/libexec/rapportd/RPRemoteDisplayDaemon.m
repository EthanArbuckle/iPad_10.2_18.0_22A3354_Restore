@implementation RPRemoteDisplayDaemon

- (RPRemoteDisplayDaemon)init
{
  RPRemoteDisplayDaemon *v2;
  RPRemoteDisplayDaemon *v3;
  RPRemoteDisplayDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPRemoteDisplayDaemon;
  v2 = -[RPRemoteDisplayDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    *(_QWORD *)&v3->_wombatStateReadyToken = 0xFFFFFFFFLL;
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int v7;
  CUSystemMonitor *v8;
  CUSystemMonitor *v9;
  id *v10;
  unsigned int v11;
  const char *v12;
  SFDeviceDiscovery *v13;
  SFDeviceDiscovery *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  RPNearbyActionV2Advertiser *v18;
  RPNearbyActionV2Advertiser *v19;
  id *v20;
  RPNearbyActionV2Discovery *v21;
  RPNearbyActionV2Discovery *v22;
  id *v23;
  SFService *v24;
  SFService *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  SFDeviceDiscovery *v29;
  SFDeviceDiscovery *v30;
  id *v31;
  uint64_t v32;
  void *v33;
  CUBonjourAdvertiser *v34;
  CUBonjourAdvertiser *v35;
  id *v36;
  uint64_t v37;
  void *v38;
  CUBonjourAdvertiser *v39;
  CUBonjourAdvertiser *v40;
  id *v41;
  uint64_t v42;
  void *v43;
  id *v44;
  CUBonjourBrowser *v45;
  CUBonjourBrowser *v46;
  id *v47;
  uint64_t v48;
  void *v49;
  CUBonjourBrowser *v50;
  CUBonjourBrowser *v51;
  id *v52;
  uint64_t v53;
  void *v54;
  id *v55;
  CUTCPServer *v56;
  CUTCPServer *v57;
  id *v58;
  CUTCPServer *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSString *v63;
  id *v64;
  NSString *v65;
  id *v66;
  void *v67;
  void *v68;
  id *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  id *v76;
  id v77;
  uint64_t v78;
  void *i;
  uint64_t v80;
  id *v81;
  uint64_t v82;
  void *v83;
  id v84;
  id *v85;
  NSMutableSet *v86;
  id v87;
  uint64_t v88;
  void *j;
  uint64_t v90;
  id *v91;
  uint64_t v92;
  void *v93;
  id v94;
  id *v95;
  NSMutableDictionary *tcpServerConnections;
  unint64_t v97;
  unint64_t v98;
  id *v99;
  NSMutableDictionary *discoveredDevices;
  id v101;
  id *v102;
  NSMutableDictionary *needsAWDLDevices;
  id *v104;
  NSMutableDictionary *xpcMatchingDiscoveryMap;
  id *v106;
  NSMutableDictionary *xpcMatchingServerMap;
  id *v108;
  id v109;
  void *k;
  void *v111;
  id *v112;
  void *v113;
  void *v114;
  id *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  id *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  id *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  id *v131;
  uint64_t v132;
  void *v133;
  id *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  id v138;
  uint64_t v139;
  void *m;
  uint64_t v141;
  id *v142;
  uint64_t v143;
  void *v144;
  id *v145;
  NSMutableSet *v147;
  uint64_t v148;
  id v149;
  id v150;
  unsigned int v151;
  id v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  id v168;
  _QWORD v169[5];
  id v170;
  _QWORD v171[5];
  id v172;
  _QWORD v173[6];
  unsigned int v174;
  _QWORD v175[3];
  int v176;
  id v177;
  _QWORD v178[5];
  unsigned int v179;
  id v180;
  _QWORD v181[5];
  unsigned int v182;
  id v183;
  id v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  id v189;
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id obj;
  uint64_t v213;
  uint64_t *v214;
  uint64_t v215;
  uint64_t (*v216)(uint64_t, uint64_t);
  void (*v217)(uint64_t);
  id v218;
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];

  if (a3 < 21)
  {
    v6 = *(_QWORD *)&a3;
    v213 = 0;
    v214 = &v213;
    v215 = 0x3032000000;
    v216 = sub_10000F9E8;
    v217 = sub_10000F980;
    v218 = 0;
    obj = 0;
    NSAppendPrintF(&obj, "-- RPRemoteDisplayDaemon --\n");
    objc_storeStrong(&v218, obj);
    if ((int)v6 >= 11)
      v7 = 50;
    else
      v7 = 30;
    v151 = v7;
    v8 = self->_systemMonitor;
    v9 = v8;
    if (v8)
    {
      v10 = (id *)(v214 + 5);
      v211 = (id)v214[5];
      v11 = -[CUSystemMonitor firstUnlocked](v8, "firstUnlocked");
      v12 = "no";
      if (v11)
        v12 = "yes";
      NSAppendPrintF(&v211, "Self: First unlocked: %s\n", v12);
      objc_storeStrong(v10, v211);
    }

    v13 = self->_bleDiscovery;
    v14 = v13;
    if (v13)
    {
      v15 = (id *)(v214 + 5);
      v210 = (id)v214[5];
      v16 = CUDescriptionWithLevel(v13, v151);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      NSAppendPrintF(&v210, "%@\n", v17);
      objc_storeStrong(v15, v210);

    }
    v18 = self->_bleNearbyActionV2Advertiser;
    v19 = v18;
    if (v18)
    {
      v20 = (id *)(v214 + 5);
      v209 = (id)v214[5];
      NSAppendPrintF(&v209, "%@\n", v18);
      objc_storeStrong(v20, v209);
    }

    v21 = self->_bleNearbyActionV2Discovery;
    v22 = v21;
    if (v21)
    {
      v23 = (id *)(v214 + 5);
      v208 = (id)v214[5];
      NSAppendPrintF(&v208, "%@\n", v21);
      objc_storeStrong(v23, v208);
    }

    v24 = self->_bleNeedsAWDLAdvertiser;
    v25 = v24;
    if (v24)
    {
      v26 = (id *)(v214 + 5);
      v207 = (id)v214[5];
      v27 = CUDescriptionWithLevel(v24, v151);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      NSAppendPrintF(&v207, "%@\n", v28);
      objc_storeStrong(v26, v207);

    }
    v29 = self->_bleNeedsAWDLScanner;
    v30 = v29;
    if (v29)
    {
      v31 = (id *)(v214 + 5);
      v206 = (id)v214[5];
      v32 = CUDescriptionWithLevel(v29, v151);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      NSAppendPrintF(&v206, "%@\n", v33);
      objc_storeStrong(v31, v206);

    }
    v34 = self->_bonjourAdvertiser;
    v35 = v34;
    if (v34)
    {
      v36 = (id *)(v214 + 5);
      v205 = (id)v214[5];
      v37 = CUDescriptionWithLevel(v34, v151);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      NSAppendPrintF(&v205, "%@\n", v38);
      objc_storeStrong(v36, v205);

    }
    v39 = self->_bonjourAWDLAdvertiser;
    v40 = v39;
    if (v39)
    {
      v41 = (id *)(v214 + 5);
      v204 = (id)v214[5];
      v42 = CUDescriptionWithLevel(v39, v151);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      NSAppendPrintF(&v204, "%@\n", v43);
      objc_storeStrong(v41, v204);

    }
    if (self->_bonjourAWDLAdvertiserForce)
    {
      v44 = (id *)(v214 + 5);
      v203 = (id)v214[5];
      NSAppendPrintF(&v203, "Force AWDL Advertiser\n");
      objc_storeStrong(v44, v203);
    }
    v45 = self->_bonjourBrowser;
    v46 = v45;
    if (v45)
    {
      v47 = (id *)(v214 + 5);
      v202 = (id)v214[5];
      v48 = CUDescriptionWithLevel(v45, v6);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      NSAppendPrintF(&v202, "%@", v49);
      objc_storeStrong(v47, v202);

    }
    v50 = self->_bonjourBrowserAWDL;
    v51 = v50;
    if (v50)
    {
      v52 = (id *)(v214 + 5);
      v201 = (id)v214[5];
      v53 = CUDescriptionWithLevel(v50, v6);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      NSAppendPrintF(&v201, "%@", v54);
      objc_storeStrong(v52, v201);

    }
    if (self->_bonjourBrowserAWDLForce)
    {
      v55 = (id *)(v214 + 5);
      v200 = (id)v214[5];
      NSAppendPrintF(&v200, "Force AWDL Browser\n");
      objc_storeStrong(v55, v200);
    }
    v56 = self->_tcpServer;
    v57 = v56;
    if (v56)
    {
      v58 = (id *)(v214 + 5);
      v199 = (id)v214[5];
      v59 = v56;
      if ((objc_opt_respondsToSelector(v59, "detailedDescription") & 1) != 0)
      {
        v60 = objc_claimAutoreleasedReturnValue(-[CUTCPServer detailedDescription](v59, "detailedDescription"));
      }
      else if ((objc_opt_respondsToSelector(v59, "descriptionWithLevel:") & 1) != 0)
      {
        v60 = objc_claimAutoreleasedReturnValue(-[CUTCPServer descriptionWithLevel:](v59, "descriptionWithLevel:", 20));
      }
      else
      {
        v61 = NSPrintF("%@\n", v59);
        v60 = objc_claimAutoreleasedReturnValue(v61);
      }
      v62 = (void *)v60;

      NSAppendPrintF(&v199, "%@", v62);
      objc_storeStrong(v58, v199);

    }
    v63 = self->_deviceConfirmedIdentifier;
    if (v63)
    {
      v64 = (id *)(v214 + 5);
      v198 = (id)v214[5];
      NSAppendPrintF(&v198, "Device in session %@\n", self->_deviceConfirmedIdentifier);
      objc_storeStrong(v64, v198);
    }

    v65 = self->_deviceSessionPaired;
    if (v65)
    {
      v66 = (id *)(v214 + 5);
      v197 = (id)v214[5];
      NSAppendPrintF(&v197, "GuestPairing %@\n", self->_deviceSessionPaired);
      objc_storeStrong(v66, v197);
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
    v68 = v67;
    if (v67)
    {
      v69 = (id *)(v214 + 5);
      v196 = (id)v214[5];
      v70 = v67;
      if ((objc_opt_respondsToSelector(v70, "detailedDescription") & 1) != 0)
      {
        v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "detailedDescription"));
      }
      else if ((objc_opt_respondsToSelector(v70, "descriptionWithLevel:") & 1) != 0)
      {
        v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "descriptionWithLevel:", 20));
      }
      else
      {
        v72 = NSPrintF("%@\n", v70);
        v71 = objc_claimAutoreleasedReturnValue(v72);
      }
      v73 = (void *)v71;

      NSAppendPrintF(&v196, "Dedicated device %@\n", v73);
      objc_storeStrong(v69, v196);

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activatedServerXPCCnxMap, "allValues"));
    v75 = objc_msgSend(v74, "count");
    if (v75)
    {
      v76 = (id *)(v214 + 5);
      v195 = (id)v214[5];
      NSAppendPrintF(&v195, "%d Server XPC connections are active\n", (_DWORD)v75);
      objc_storeStrong(v76, v195);
    }
    v193 = 0u;
    v194 = 0u;
    v191 = 0u;
    v192 = 0u;
    v150 = v74;
    v77 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v191, v222, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v192;
      do
      {
        for (i = 0; i != v77; i = (char *)i + 1)
        {
          if (*(_QWORD *)v192 != v78)
            objc_enumerationMutation(v150);
          v80 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * (_QWORD)i);
          v81 = (id *)(v214 + 5);
          v190 = (id)v214[5];
          v82 = CUDescriptionWithLevel(v80, v151);
          v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          NSAppendPrintF(&v190, "Server: %@ \n", v83);
          objc_storeStrong(v81, v190);

        }
        v77 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v191, v222, 16);
      }
      while (v77);
    }

    v84 = -[NSMutableSet count](self->_bufferedConnections, "count");
    if (v84)
    {
      v85 = (id *)(v214 + 5);
      v189 = (id)v214[5];
      NSAppendPrintF(&v189, "%d RemoteDisplay buffered connection(s)\n", (_DWORD)v84);
      objc_storeStrong(v85, v189);
    }
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v86 = self->_bufferedConnections;
    v87 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v185, v221, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v186;
      do
      {
        for (j = 0; j != v87; j = (char *)j + 1)
        {
          if (*(_QWORD *)v186 != v88)
            objc_enumerationMutation(v86);
          v90 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)j);
          v91 = (id *)(v214 + 5);
          v184 = (id)v214[5];
          v92 = CUDescriptionWithLevel(v90, 30);
          v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
          NSAppendPrintF(&v184, "    %@\n", v93);
          objc_storeStrong(v91, v184);

        }
        v87 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v185, v221, 16);
      }
      while (v87);
    }

    v94 = -[NSMutableDictionary count](self->_tcpServerConnections, "count");
    if (v94)
    {
      v95 = (id *)(v214 + 5);
      v183 = (id)v214[5];
      NSAppendPrintF(&v183, "%d RemoteDisplay server connection(s)\n", (_DWORD)v94);
      objc_storeStrong(v95, v183);
    }
    tcpServerConnections = self->_tcpServerConnections;
    v181[0] = _NSConcreteStackBlock;
    v181[1] = 3221225472;
    v181[2] = sub_100096E40;
    v181[3] = &unk_100114758;
    v181[4] = &v213;
    v182 = v151;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v181);
    v97 = (unint64_t)-[NSMutableDictionary count](self->_discoveredDevices, "count");
    v98 = (unint64_t)-[NSMutableDictionary count](self->_unresolvedDevices, "count");
    if (v97 | v98)
    {
      v99 = (id *)(v214 + 5);
      v180 = (id)v214[5];
      NSAppendPrintF(&v180, "%d resolved device(s), %d unresolved\n", v97, v98);
      objc_storeStrong(v99, v180);
    }
    discoveredDevices = self->_discoveredDevices;
    v178[0] = _NSConcreteStackBlock;
    v178[1] = 3221225472;
    v178[2] = sub_100096EA8;
    v178[3] = &unk_100114780;
    v178[4] = &v213;
    v179 = v151;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v178);
    v101 = -[NSMutableDictionary count](self->_needsAWDLDevices, "count");
    if (v101)
    {
      v102 = (id *)(v214 + 5);
      v177 = (id)v214[5];
      NSAppendPrintF(&v177, "NeedsAWDL device (%d)\n", (_DWORD)v101);
      objc_storeStrong(v102, v177);
    }
    v175[0] = 0;
    v175[1] = v175;
    v175[2] = 0x2020000000;
    v176 = 0;
    needsAWDLDevices = self->_needsAWDLDevices;
    v173[0] = _NSConcreteStackBlock;
    v173[1] = 3221225472;
    v173[2] = sub_100096F2C;
    v173[3] = &unk_1001147A8;
    v174 = v151;
    v173[4] = &v213;
    v173[5] = v175;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](needsAWDLDevices, "enumerateKeysAndObjectsUsingBlock:", v173);
    if (-[NSMutableSet count](self->_xpcConnections, "count")
      || -[NSMutableDictionary count](self->_xpcMatchingDiscoveryMap, "count")
      || -[NSMutableDictionary count](self->_xpcMatchingServerMap, "count"))
    {
      v104 = (id *)(v214 + 5);
      v172 = (id)v214[5];
      NSAppendPrintF(&v172, "XPC Matching Discovery: %d \n", -[NSMutableDictionary count](self->_xpcMatchingDiscoveryMap, "count"));
      objc_storeStrong(v104, v172);
      xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      v171[0] = _NSConcreteStackBlock;
      v171[1] = 3221225472;
      v171[2] = sub_10009701C;
      v171[3] = &unk_100111578;
      v171[4] = &v213;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingDiscoveryMap, "enumerateKeysAndObjectsUsingBlock:", v171);
      v106 = (id *)(v214 + 5);
      v170 = (id)v214[5];
      NSAppendPrintF(&v170, "XPC Matching Server: %d \n", -[NSMutableDictionary count](self->_xpcMatchingServerMap, "count"));
      objc_storeStrong(v106, v170);
      xpcMatchingServerMap = self->_xpcMatchingServerMap;
      v169[0] = _NSConcreteStackBlock;
      v169[1] = 3221225472;
      v169[2] = sub_100097100;
      v169[3] = &unk_100111578;
      v169[4] = &v213;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingServerMap, "enumerateKeysAndObjectsUsingBlock:", v169);
      v108 = (id *)(v214 + 5);
      v168 = (id)v214[5];
      NSAppendPrintF(&v168, "XPC Cnx: %d\n", -[NSMutableSet count](self->_xpcConnections, "count"));
      objc_storeStrong(v108, v168);
      v166 = 0u;
      v167 = 0u;
      v164 = 0u;
      v165 = 0u;
      v147 = self->_xpcConnections;
      v109 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v147, "countByEnumeratingWithState:objects:count:", &v164, v220, 16);
      if (v109)
      {
        v148 = *(_QWORD *)v165;
        do
        {
          v149 = v109;
          for (k = 0; k != v149; k = (char *)k + 1)
          {
            if (*(_QWORD *)v165 != v148)
              objc_enumerationMutation(v147);
            v111 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)k);
            v112 = (id *)(v214 + 5);
            v163 = (id)v214[5];
            v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "xpcCnx"));
            NSAppendPrintF(&v163, "    %#{pid}", objc_msgSend(v113, "processIdentifier"));
            objc_storeStrong(v112, v163);

            v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activatedDiscovery"));
            if (v114)
            {
              v115 = (id *)(v214 + 5);
              v162 = (id)v214[5];
              v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activatedDiscovery"));
              v117 = CUDescriptionWithLevel(v116, v151);
              v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
              NSAppendPrintF(&v162, ", %@", v118);
              objc_storeStrong(v115, v162);

            }
            v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activatedServer"));

            if (v119)
            {
              v120 = (id *)(v214 + 5);
              v161 = (id)v214[5];
              v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activatedServer"));
              v122 = CUDescriptionWithLevel(v121, v151);
              v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
              NSAppendPrintF(&v161, ", %@", v123);
              objc_storeStrong(v120, v161);

            }
            v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activatedSession"));

            if (v124)
            {
              v125 = (id *)(v214 + 5);
              v160 = (id)v214[5];
              v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activatedSession"));
              v127 = CUDescriptionWithLevel(v126, v151);
              v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
              NSAppendPrintF(&v160, ", %@", v128);
              objc_storeStrong(v125, v160);

            }
            v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "activeNetCnx"));
            v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "clientNetCnx"));
            if (v129)
            {
              v131 = (id *)(v214 + 5);
              v159 = (id)v214[5];
              v132 = CUDescriptionWithLevel(v129, 30);
              v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
              NSAppendPrintF(&v159, ", A %@", v133);
              objc_storeStrong(v131, v159);

            }
            if (v130 && v130 != v129)
            {
              v134 = (id *)(v214 + 5);
              v158 = (id)v214[5];
              v135 = CUDescriptionWithLevel(v130, 30);
              v136 = (void *)objc_claimAutoreleasedReturnValue(v135);
              NSAppendPrintF(&v158, ", C %@", v136);
              objc_storeStrong(v134, v158);

            }
            v156 = 0u;
            v157 = 0u;
            v154 = 0u;
            v155 = 0u;
            v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "serverNetCnxs"));
            v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v154, v219, 16);
            if (v138)
            {
              v139 = *(_QWORD *)v155;
              do
              {
                for (m = 0; m != v138; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v155 != v139)
                    objc_enumerationMutation(v137);
                  v141 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)m);
                  v142 = (id *)(v214 + 5);
                  v153 = (id)v214[5];
                  v143 = CUDescriptionWithLevel(v141, 30);
                  v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
                  NSAppendPrintF(&v153, ", S %@", v144);
                  objc_storeStrong(v142, v153);

                }
                v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v154, v219, 16);
              }
              while (v138);
            }

            v145 = (id *)(v214 + 5);
            v152 = (id)v214[5];
            NSAppendPrintF(&v152, "\n");
            objc_storeStrong(v145, v152);

          }
          v109 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v147, "countByEnumeratingWithState:objects:count:", &v164, v220, 16);
        }
        while (v109);
      }

    }
    v5 = (id)v214[5];
    _Block_object_dispose(v175, 8);

    _Block_object_dispose(&v213, 8);
  }
  else
  {
    v4 = NSPrintF("RPRemoteDisplayDaemon %{ptr}", a2, self);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  }
  return v5;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009723C;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v5;
  NSXPCListener *v6;
  NSXPCListener *xpcListener;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _activate]", 30, "Activate\n");
  RandomBytes(&self->_sessionIDLast, 4);
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100097438;
    v10[3] = &unk_1001110F8;
    v10[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100097440;
    v9[3] = &unk_1001110F8;
    v9[4] = self;
    -[CUSystemMonitor setNetFlagsChangedHandler:](self->_systemMonitor, "setNetFlagsChangedHandler:", v9);
    v5 = self->_systemMonitor;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100097448;
    v8[3] = &unk_1001110F8;
    v8[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v8);
  }
  if (!self->_xpcListener)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _activate]", 30, "Activating XPC listener %@\n", CFSTR("com.apple.RemoteDisplay"));
    }
    v6 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.RemoteDisplay"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v6;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  -[RPRemoteDisplayDaemon _registerForWombatStateNotifications](self, "_registerForWombatStateNotifications");
  -[RPRemoteDisplayDaemon prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000974A8;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableSet *needsAWDLNewPeers;
  NSMutableSet *needsAWDLSentToPeers;
  NSMutableSet *needsAWDLRequestIdentifiers;
  OS_dispatch_source *needsAWDLRequestTimer;
  NSObject *v14;
  OS_dispatch_source *v15;
  CUSystemMonitor *systemMonitor;
  RPRemoteDisplayPerson *personSelected;
  OS_dispatch_source *discoverySessionExpirationTimer;
  NSObject *v19;
  OS_dispatch_source *v20;
  OS_dispatch_source *inSessionDeviceLost;
  NSObject *v22;
  OS_dispatch_source *v23;
  id v24;
  uint64_t v25;
  SFAuthenticationManager *authenticationManager;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _invalidate]", 30, "Invalidating\n");
    }
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = self->_xpcConnections;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "xpcCnx", (_QWORD)v27));
          objc_msgSend(v9, "invalidate");

        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v6);
    }

    -[NSMutableDictionary removeAllObjects](self->_xpcMatchingDiscoveryMap, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_xpcMatchingServerMap, "removeAllObjects");
    -[RPRemoteDisplayDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPRemoteDisplayDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[NSMutableSet removeAllObjects](self->_needsAWDLNewPeers, "removeAllObjects");
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    self->_needsAWDLNewPeers = 0;

    -[NSMutableSet removeAllObjects](self->_needsAWDLSentToPeers, "removeAllObjects");
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;

    -[NSMutableSet removeAllObjects](self->_needsAWDLRequestIdentifiers, "removeAllObjects");
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    self->_needsAWDLRequestIdentifiers = 0;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      v14 = needsAWDLRequestTimer;
      dispatch_source_cancel(v14);
      v15 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;

    }
    -[RPRemoteDisplayDaemon _unregisterWombatStateNotifications](self, "_unregisterWombatStateNotifications", (_QWORD)v27);
    -[RPRemoteDisplayDaemon _btAddressMonitorEnsureStopped](self, "_btAddressMonitorEnsureStopped");
    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    personSelected = self->_personSelected;
    self->_personSelected = 0;

    discoverySessionExpirationTimer = self->_discoverySessionExpirationTimer;
    if (discoverySessionExpirationTimer)
    {
      v19 = discoverySessionExpirationTimer;
      dispatch_source_cancel(v19);
      v20 = self->_discoverySessionExpirationTimer;
      self->_discoverySessionExpirationTimer = 0;

    }
    inSessionDeviceLost = self->_inSessionDeviceLost;
    if (inSessionDeviceLost)
    {
      v22 = inSessionDeviceLost;
      dispatch_source_cancel(v22);
      v23 = self->_inSessionDeviceLost;
      self->_inSessionDeviceLost = 0;

    }
    -[RPRemoteDisplayDaemon _clearConfirmationClientCache](self, "_clearConfirmationClientCache");
    v24 = -[RPRemoteDisplayDaemon setDeviceConfirmedIdentifier:](self, "setDeviceConfirmedIdentifier:", 0);
    if (GestaltGetDeviceClass(v24, v25) == 1)
    {
      -[RPRemoteDisplayDaemon _stopObservingOnenessEnabledState](self, "_stopObservingOnenessEnabledState");
      authenticationManager = self->_authenticationManager;
      self->_authenticationManager = 0;

    }
    -[RPRemoteDisplayDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_tcpServerConnections, "count")
    && !self->_tcpServer
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  char v3;
  NSString *deviceAuthTagStr;
  NSData *deviceAWDLRandomID;
  void *v7;
  id v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon daemonInfoChanged:]", 30, "Resetting on sign out\n");
    }
    -[RPRemoteDisplayDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPRemoteDisplayDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPRemoteDisplayDaemon _update](self, "_update");
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_24;
      goto LABEL_11;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  -[RPRemoteDisplayDaemon _update](self, "_update");
  if ((v3 & 4) == 0)
    goto LABEL_24;
LABEL_11:
  if (self->_deviceAuthTagStr)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon daemonInfoChanged:]", 30, "Clearing cached DeviceAuthTag to re-generate for updated SelfIdentity\n");
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;

  }
  if (self->_deviceAWDLRandomID)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon daemonInfoChanged:]", 30, "Clearing cached AWDL random ID to re-generate for updated SelfIdentity\n");
    }
    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;

  }
  -[RPRemoteDisplayDaemon _update](self, "_update");
LABEL_24:
  if ((v3 & 9) != 0)
  {
    -[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices](self, "_clientBonjourReevaluateDevices");
    -[RPRemoteDisplayDaemon _update](self, "_update");
  }
  if ((v3 & 0x20) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    v8 = objc_msgSend(v7, "errorFlags");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_xpcConnections;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "updateErrorFlags:", v8, (_QWORD)v14);
        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v5;
  BOOL v6;
  _BOOL4 bonjourAWDLAdvertiserForce;
  const char *v8;
  const char *v9;
  _BOOL4 bonjourBrowserAWDLForce;
  const char *v11;
  const char *v12;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("rdAWDLa"), 9) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    bonjourAWDLAdvertiserForce = self->_bonjourAWDLAdvertiserForce;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v8 = "yes";
      if (bonjourAWDLAdvertiserForce)
        v9 = "yes";
      else
        v9 = "no";
      if (bonjourAWDLAdvertiserForce)
        v8 = "no";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon diagnosticCommand:params:]", 30, "Diag: AWDL advertiser force: %s -> %s\n", v9, v8);
    }
    self->_bonjourAWDLAdvertiserForce = !bonjourAWDLAdvertiserForce;
    goto LABEL_28;
  }
  if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("rdAWDLb"), 9) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    bonjourBrowserAWDLForce = self->_bonjourBrowserAWDLForce;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v11 = "yes";
      if (bonjourBrowserAWDLForce)
        v12 = "yes";
      else
        v12 = "no";
      if (bonjourBrowserAWDLForce)
        v11 = "no";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon diagnosticCommand:params:]", 30, "Diag: AWDL browser force: %s -> %s\n", v12, v11);
    }
    self->_bonjourBrowserAWDLForce = !bonjourBrowserAWDLForce;
LABEL_28:
    -[RPRemoteDisplayDaemon _update](self, "_update");
LABEL_29:
    v6 = 1;
    goto LABEL_30;
  }
  if (!objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("rdEval")))
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon diagnosticCommand:params:]", 30, "Diag: Re-evaluate devices\n");
    }
    -[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices](self, "_clientBonjourReevaluateDevices");
    goto LABEL_29;
  }
  v6 = 0;
LABEL_30:

  return v6;
}

- (void)prefsChanged
{
  uint64_t v3;
  uint64_t v4;
  int DeviceClass;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v8;
  const char *v9;
  const char *v10;
  uint64_t Int64;
  _BOOL4 v12;
  BOOL v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  _BOOL4 v18;
  BOOL v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  BOOL v29;
  _BOOL4 v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  _BOOL4 v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  _BOOL4 v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  unint64_t v59;
  unint64_t v62;
  unint64_t prefCameraCapabilitiesRetrySeconds;
  unint64_t v64;
  unint64_t v67;
  unint64_t prefDiscoverySessionExpirationSeconds;
  unint64_t v69;
  unint64_t v72;
  unint64_t prefInSessionDeviceLostSeconds;
  int v74;

  v74 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  DeviceClass = GestaltGetDeviceClass(v3, v4);
  v6 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdBLEClient"), &v74) != 0;
  if (v74 && (DeviceClass == 100 || DeviceClass == 4))
    v6 = 1;
  if (v74)
    v7 = DeviceClass == 11;
  else
    v7 = 0;
  v8 = v7 || v6;
  if (self->_prefBLEClient != v8)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v9 = "yes";
      if (v8)
        v10 = "no";
      else
        v10 = "yes";
      if (!v8)
        v9 = "no";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "BLE client enabled: %s -> %s\n", v10, v9);
    }
    self->_prefBLEClient = v8;
  }
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdBLEServer"), &v74);
  v12 = Int64 != 0;
  if (v74)
    v12 = (DeviceClass - 1) < 3 || Int64 != 0;
  if (v74)
    v14 = DeviceClass == 11;
  else
    v14 = 0;
  v15 = v14 || v12;
  if (self->_prefBLEServer != v15)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v16 = "yes";
      if (v15)
        v17 = "no";
      else
        v17 = "yes";
      if (!v15)
        v16 = "no";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "BLE server enabled: %s -> %s\n", v17, v16);
    }
    self->_prefBLEServer = v15;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdClientEnabled"), &v74) != 0;
  if (v74 && (DeviceClass == 100 || DeviceClass == 4))
    v18 = 1;
  if (v74)
    v19 = DeviceClass == 11;
  else
    v19 = 0;
  v20 = v19 || v18;
  if (self->_prefClientEnabled != v20)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v21 = "yes";
      if (v20)
        v22 = "no";
      else
        v22 = "yes";
      if (!v20)
        v21 = "no";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Client enabled: %s -> %s\n", v22, v21);
    }
    self->_prefClientEnabled = v20;
  }
  v23 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("ignoreRemoteDisplayChecks"), &v74);
  v24 = v23 != 0;
  if (self->_prefIgnoreRemoteDisplayChecks != v24)
  {
    if (dword_100131A18 <= 30)
    {
      v25 = v23;
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v26 = "yes";
        if (v25)
          v27 = "no";
        else
          v27 = "yes";
        if (!v25)
          v26 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Ignore RemoteDisplay Checks: %s -> %s\n", v27, v26);
      }
    }
    self->_prefIgnoreRemoteDisplayChecks = v24;
  }
  v28 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdNearbyActionV2"), &v74);
  if (v74)
    v29 = (DeviceClass & 0xFFFFFFFD) == 1;
  else
    v29 = 0;
  v31 = v29 || v28 != 0;
  if (self->_prefNearbyActionV2 != v31)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v32 = "yes";
      if (v31)
        v33 = "no";
      else
        v33 = "yes";
      if (!v31)
        v32 = "no";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "NearbyActionV2: %s -> %s\n", v33, v32);
    }
    self->_prefNearbyActionV2 = v31;
  }
  v34 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdNoInfra"), &v74);
  v35 = v34 != 0;
  if (self->_prefNoInfra != v35)
  {
    if (dword_100131A18 <= 30)
    {
      v36 = v34;
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v37 = "yes";
        if (v36)
          v38 = "no";
        else
          v38 = "yes";
        if (!v36)
          v37 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "NoInfra: %s -> %s\n", v38, v37);
      }
    }
    self->_prefNoInfra = v35;
  }
  v39 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdNoUSB"), &v74);
  v40 = v39 != 0;
  if (self->_prefNoUSB != v40)
  {
    if (dword_100131A18 <= 30)
    {
      v41 = v39;
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v42 = "yes";
        if (v41)
          v43 = "no";
        else
          v43 = "yes";
        if (!v41)
          v42 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "NoUSB: %s -> %s\n", v43, v42);
      }
    }
    self->_prefNoUSB = v40;
  }
  v44 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdPairingServer"), &v74);
  v45 = v44 != 0;
  if (self->_prefAllowPairingServer != v45)
  {
    if (dword_100131A18 <= 30)
    {
      v46 = v44;
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v47 = "yes";
        if (v46)
          v48 = "no";
        else
          v48 = "yes";
        if (!v46)
          v47 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Allow pairing server: %s -> %s\n", v48, v47);
      }
    }
    self->_prefAllowPairingServer = v45;
  }
  v49 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdServerEnabled"), 0);
  v50 = v49 != 0;
  if (self->_prefServerEnabled != v50)
  {
    if (dword_100131A18 <= 30)
    {
      v51 = v49;
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v52 = "yes";
        if (v51)
          v53 = "no";
        else
          v53 = "yes";
        if (!v51)
          v52 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Server enabled: %s -> %s\n", v53, v52);
      }
    }
    self->_prefServerEnabled = v50;
  }
  v54 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("rdServerBonjourInfra"), 0);
  v55 = v54 != 0;
  if (self->_prefServerBonjourInfra != v55)
  {
    if (dword_100131A18 <= 30)
    {
      v56 = v54;
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v57 = "yes";
        if (v56)
          v58 = "no";
        else
          v58 = "yes";
        if (!v56)
          v57 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Server Bonjour Infra: %s -> %s\n", v58, v57);
      }
    }
    self->_prefServerBonjourInfra = v55;
  }
  v59 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("ccRetrySeconds"), &v74);
  if (v59 <= 0x3E8 && v59 != 0 && v74 == 0)
    v62 = v59;
  else
    v62 = 60;
  prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
  if (v62 != prefCameraCapabilitiesRetrySeconds)
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131A18, 30))
          goto LABEL_167;
        prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
      }
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Camera capabilities retry seconds: %lu -> %lu\n", prefCameraCapabilitiesRetrySeconds, v62);
    }
LABEL_167:
    self->_prefCameraCapabilitiesRetrySeconds = v62;
  }
  v64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("discoverySessionExp"), &v74);
  if (v64 <= 0x7080 && v64 != 0 && v74 == 0)
    v67 = v64;
  else
    v67 = 28800;
  prefDiscoverySessionExpirationSeconds = self->_prefDiscoverySessionExpirationSeconds;
  if (v67 != prefDiscoverySessionExpirationSeconds)
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131A18, 30))
          goto LABEL_182;
        prefDiscoverySessionExpirationSeconds = self->_prefDiscoverySessionExpirationSeconds;
      }
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "Discovery session expiration seconds: %lu -> %lu\n", prefDiscoverySessionExpirationSeconds, v67);
    }
LABEL_182:
    self->_prefDiscoverySessionExpirationSeconds = v67;
  }
  v69 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("inSessionDeviceLost"), &v74);
  if (v69 <= 0x5A && v69 != 0 && v74 == 0)
    v72 = v69;
  else
    v72 = 90;
  prefInSessionDeviceLostSeconds = self->_prefInSessionDeviceLostSeconds;
  if (v72 != prefInSessionDeviceLostSeconds)
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131A18, 30))
          goto LABEL_197;
        prefInSessionDeviceLostSeconds = self->_prefInSessionDeviceLostSeconds;
      }
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon prefsChanged]", 30, "In session device lost seconds: %lu -> %lu\n", prefInSessionDeviceLostSeconds, v72);
    }
LABEL_197:
    self->_prefInSessionDeviceLostSeconds = v72;
  }
  -[RPRemoteDisplayDaemon _update](self, "_update");
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v11;
  __CFString *v12;
  CFTypeID v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  CFTypeID v20;
  uint64_t v21;
  CFTypeID v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeID v25;
  uint64_t v26;
  void *v27;
  RPXPCMatchingEntry *v28;
  NSMutableDictionary *xpcMatchingDiscoveryMap;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  void *v32;
  const __CFString *v33;
  NSMutableDictionary *xpcMatchingServerMap;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  void *v37;
  const __CFString *v38;
  BOOL v39;
  void *v41;
  __CFString *v42;
  id v43;
  id v45;
  int v46;

  v7 = a4;
  v8 = a5;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("serviceType"), TypeID, 0);
  v11 = objc_claimAutoreleasedReturnValue(TypedValue);
  if (v11)
    v12 = (__CFString *)v11;
  else
    v12 = CFSTR("_rdlink._tcp");
  v46 = 0;
  v13 = CFDictionaryGetTypeID();
  v14 = CFDictionaryGetTypedValue(v7, CFSTR("RBSAssertion"), v13, &v46);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)v15;
  v17 = 0;
  if (v46)
  {
    v18 = 0;
    v19 = 0;
LABEL_10:
    v25 = CFStringGetTypeID();
    v26 = CFDictionaryGetTypedValue(v7, CFSTR("type"), v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (objc_msgSend(v27, "isEqual:", CFSTR("discovery")))
    {
      v41 = v16;
      v42 = v12;
      v28 = objc_alloc_init(RPXPCMatchingEntry);
      -[RPXPCMatchingEntry setEvent:](v28, "setEvent:", v7);
      v43 = v8;
      -[RPXPCMatchingEntry setHandler:](v28, "setHandler:", v8);
      -[RPXPCMatchingEntry setToken:](v28, "setToken:", a3);
      -[RPXPCMatchingEntry setAngelJobLabel:](v28, "setAngelJobLabel:", v19);
      -[RPXPCMatchingEntry setAngelAssertionName:](v28, "setAngelAssertionName:", v18);
      xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      if (!xpcMatchingDiscoveryMap)
      {
        v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v31 = self->_xpcMatchingDiscoveryMap;
        self->_xpcMatchingDiscoveryMap = v30;

        xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](xpcMatchingDiscoveryMap, "setObject:forKeyedSubscript:", v28, v32);

      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        v33 = &stru_100115158;
        if (v17)
          v33 = v17;
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon addXPCMatchingToken:event:handler:]", 30, "Added discovery XPC matching token %llu, %@%##@\n", a3, v33, v7);
      }
      -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
    }
    else
    {
      if ((objc_msgSend(v27, "isEqual:", CFSTR("server")) & 1) == 0
        && !objc_msgSend(v27, "isEqual:", CFSTR("rdserver")))
      {
        v39 = 0;
LABEL_36:

        goto LABEL_41;
      }
      v41 = v16;
      v28 = objc_alloc_init(RPXPCMatchingEntry);
      -[RPXPCMatchingEntry setEvent:](v28, "setEvent:", v7);
      v43 = v8;
      -[RPXPCMatchingEntry setHandler:](v28, "setHandler:", v8);
      -[RPXPCMatchingEntry setToken:](v28, "setToken:", a3);
      v42 = v12;
      -[RPXPCMatchingEntry setServiceType:](v28, "setServiceType:", v12);
      -[RPXPCMatchingEntry setAngelJobLabel:](v28, "setAngelJobLabel:", v19);
      -[RPXPCMatchingEntry setAngelAssertionName:](v28, "setAngelAssertionName:", v18);
      xpcMatchingServerMap = self->_xpcMatchingServerMap;
      if (!xpcMatchingServerMap)
      {
        v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v36 = self->_xpcMatchingServerMap;
        self->_xpcMatchingServerMap = v35;

        xpcMatchingServerMap = self->_xpcMatchingServerMap;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](xpcMatchingServerMap, "setObject:forKeyedSubscript:", v28, v37);

      if (dword_100131A18 > 30)
      {
        v12 = v42;
        v8 = v43;
LABEL_35:
        v16 = v41;

        -[RPRemoteDisplayDaemon _update](self, "_update");
        v39 = 1;
        goto LABEL_36;
      }
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v38 = &stru_100115158;
        if (v17)
          v38 = v17;
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon addXPCMatchingToken:event:handler:]", 30, "Added server XPC matching token %llu, %@%##@\n", a3, v38, v7);
      }
    }
    v12 = v42;
    v8 = v43;
    goto LABEL_35;
  }
  v18 = 0;
  v19 = 0;
  if (!v15)
    goto LABEL_10;
  v20 = CFStringGetTypeID();
  v21 = CFDictionaryGetTypedValue(v16, CFSTR("AngelJobLabel"), v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v22 = CFStringGetTypeID();
  v23 = CFDictionaryGetTypedValue(v16, CFSTR("AssertionName"), v22, 0);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v18 = (void *)v24;
  if (v19 && v24)
  {
    v45 = 0;
    NSAppendPrintF(&v45, "Angel job label '%@' assertion '%@', ", v19, v24);
    v17 = (__CFString *)v45;
    goto LABEL_10;
  }
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon addXPCMatchingToken:event:handler:]", 30, "Ignoring launch angel XPC matching token that is missing fields angelJobLabel '%@' angelAssertionName '%@' token %llu\n", v19, v18, a3);
  v39 = 0;
LABEL_41:

  return v39;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_xpcMatchingDiscoveryMap, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_xpcMatchingDiscoveryMap, "setObject:forKeyedSubscript:", 0, v4);
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon removeXPCMatchingToken:]", 30, "Removed discovery XPC matching token %llu\n");
    }
LABEL_14:
    -[RPRemoteDisplayDaemon _update](self, "_update");
    v7 = 1;
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_xpcMatchingServerMap, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_xpcMatchingServerMap, "setObject:forKeyedSubscript:", 0, v4);
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon removeXPCMatchingToken:]", 30, "Removed server XPC matching token %llu\n");
    }
    goto LABEL_14;
  }
  v7 = 0;
LABEL_15:

  return v7;
}

- (void)_update
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  id v13;

  v3 = self->_prefClientEnabled
    || -[NSMutableSet count](self->_activatedDiscoverySet, "count")
    || -[NSMutableSet count](self->_activatedSessionSet, "count")
    || -[NSMutableDictionary count](self->_xpcMatchingDiscoveryMap, "count") != 0;
  if (self->_prefServerEnabled || -[NSMutableDictionary count](self->_activatedServerXPCCnxMap, "count"))
  {
    v4 = 1;
LABEL_8:
    -[RPRemoteDisplayDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
    -[RPRemoteDisplayDaemon _btAddressMonitorEnsureStarted](self, "_btAddressMonitorEnsureStarted");
    goto LABEL_9;
  }
  v10 = -[NSMutableDictionary count](self->_xpcMatchingServerMap, "count");
  v4 = v10 != 0;
  if (v10)
    v11 = 1;
  else
    v11 = v3;
  if (v11 == 1)
    goto LABEL_8;
  -[RPRemoteDisplayDaemon _btAddressMonitorEnsureStopped](self, "_btAddressMonitorEnsureStopped");
  v4 = 0;
LABEL_9:
  if (v3)
    -[RPRemoteDisplayDaemon _clientEnsureStarted](self, "_clientEnsureStarted");
  else
    -[RPRemoteDisplayDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identitiesOfType:error:", 13, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identitiesOfType:error:", 12, 0));

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceArray"));
    if (objc_msgSend(v9, "count") || objc_msgSend(v13, "count"))
    {

LABEL_16:
      -[RPRemoteDisplayDaemon _serverEnsureStarted](self, "_serverEnsureStarted");
      goto LABEL_24;
    }
    v12 = objc_msgSend(v7, "count");

    if (v12)
      goto LABEL_16;
  }
  -[RPRemoteDisplayDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
LABEL_24:
  if (-[RPRemoteDisplayDaemon _needToHoldPowerAssertion](self, "_needToHoldPowerAssertion"))
    -[RPRemoteDisplayDaemon _powerAssertionEnsureHeld](self, "_powerAssertionEnsureHeld");
  else
    -[RPRemoteDisplayDaemon _powerAssertionEnsureReleased](self, "_powerAssertionEnsureReleased");

}

- (void)_updateXPCMatchingDiscovery
{
  BOOL v3;
  NSMutableDictionary *xpcMatchingDiscoveryMap;
  _QWORD v5[5];
  BOOL v6;

  v3 = -[NSMutableDictionary count](self->_discoveredDevices, "count") != 0;
  xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100098DA0;
  v5[3] = &unk_1001147F8;
  v6 = v3;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingDiscoveryMap, "enumerateKeysAndObjectsUsingBlock:", v5);
}

- (void)_bluetoothUseCaseFromWombatState:(unsigned int)a3 resultBlock:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v11;

  v6 = 131078;
  v7 = a4;
  v11 = v7;
  if (a3 == 2)
  {
    v8 = 40;
    v9 = 40;
  }
  else if (a3 == 3)
  {
    v6 = 131080;
    v8 = 30;
    v9 = 30;
  }
  else
  {
    v10 = !-[RPRemoteDisplayDaemon _onenessEnabled](self, "_onenessEnabled");
    v7 = v11;
    if (v10)
      v6 = 0x20000;
    else
      v6 = 131101;
    v9 = 20;
    v8 = 30;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t))v7 + 2))(v7, v6, v8, v9);

}

- (void)_connectionConfigureCommon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned int v12;
  void *v14;
  unsigned __int8 v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activatedServerXPCCnxMap, "allValues"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "activatedServer"));
        v12 = objc_msgSend(v11, "passwordType");
        if (v12 > 4 || ((1 << v12) & 0x19) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "password"));
          objc_msgSend(v4, "setPassword:", v14);

          objc_msgSend(v4, "setPasswordType:", objc_msgSend(v11, "passwordType"));
          v15 = objc_msgSend(v11, "internalAuthFlags");
          if ((v15 & 1) != 0)
          {
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_1000992B8;
            v20[3] = &unk_100111C48;
            v20[4] = v11;
            objc_msgSend(v4, "setShowPasswordHandler:", v20);
          }
          if ((v15 & 2) != 0)
          {
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_100099318;
            v19[3] = &unk_100111C70;
            v19[4] = v11;
            objc_msgSend(v4, "setHidePasswordHandler:", v19);
          }

          goto LABEL_18;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_18:

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100099360;
  v17[3] = &unk_1001121C0;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v16, "setAuthCompletionHandler:", v17);

}

- (void)_updateForXPCClientChange
{
  int64_t v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  int64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (GestaltGetDeviceClass(self, a2) == 4)
    v3 = -75;
  else
    v3 = -60;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_activatedDiscoverySet;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "rssiThreshold", (_QWORD)v13);
        if ((uint64_t)v11 >= v3)
          v12 = v3;
        else
          v12 = (int64_t)v11;
        if (v11)
          v3 = v12;
        if (objc_msgSend(v10, "triggerEnhancedDiscovery"))
        {
          objc_msgSend(v10, "setTriggerEnhancedDiscovery:", 0);
          v7 = 1;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);

    self->_bleRSSIThreshold = v3;
    if ((v7 & 1) != 0)
      -[RPRemoteDisplayDaemon _bleDiscoveryTriggerEnhancedDiscovery:useCase:](self, "_bleDiscoveryTriggerEnhancedDiscovery:useCase:", CFSTR("RemoteDisplayDiscovery"), 131076);
  }
  else
  {

    self->_bleRSSIThreshold = v3;
  }
  -[RPRemoteDisplayDaemon _update](self, "_update", (_QWORD)v13);
}

- (void)_clientEnsureStarted
{
  int DeviceClass;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    -[RPRemoteDisplayDaemon _clientBonjourEnsureStarted](self, "_clientBonjourEnsureStarted");
    if (-[RPRemoteDisplayDaemon _clientBLEDiscoveryShouldRun](self, "_clientBLEDiscoveryShouldRun"))
      -[RPRemoteDisplayDaemon _clientBLEDiscoveryEnsureStarted](self, "_clientBLEDiscoveryEnsureStarted");
    else
      -[RPRemoteDisplayDaemon _clientBLEDiscoveryEnsureStopped](self, "_clientBLEDiscoveryEnsureStopped");
    if (-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun](self, "_clientBLENearbyActionV2AdvertiserShouldRun"))
    {
      -[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted](self, "_clientBLENearbyActionV2AdvertiserEnsureStarted");
    }
    else
    {
      -[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped](self, "_clientBLENearbyActionV2AdvertiserEnsureStopped");
    }
    if (-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserShouldRun](self, "_clientBLENeedsAWDLAdvertiserShouldRun"))
      -[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStarted](self, "_clientBLENeedsAWDLAdvertiserEnsureStarted");
    else
      -[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStopped](self, "_clientBLENeedsAWDLAdvertiserEnsureStopped");
    if (-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserShouldRun](self, "_clientBonjourAWDLBrowserShouldRun"))
      -[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStarted](self, "_clientBonjourAWDLBrowserEnsureStarted");
    else
      -[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStopped](self, "_clientBonjourAWDLBrowserEnsureStopped");
    if (DeviceClass == 100 || DeviceClass == 4)
      -[RPRemoteDisplayDaemon _registerForIncomingMessages](self, "_registerForIncomingMessages");
  }
  else if (dword_100131A18 <= 30
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientEnsureStarted]", 30, "Deferring client start until FirstUnlock\n");
  }
}

- (void)_clientEnsureStopped
{
  RPCompanionLinkClient *clientIncomingMessageCLinkClient;
  RPCompanionLinkClient *v4;

  -[RPRemoteDisplayDaemon _clientLostAllDevices](self, "_clientLostAllDevices");
  -[RPRemoteDisplayDaemon _clientBLEDiscoveryEnsureStopped](self, "_clientBLEDiscoveryEnsureStopped");
  -[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStopped](self, "_clientBLENeedsAWDLAdvertiserEnsureStopped");
  -[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStopped](self, "_clientBonjourAWDLBrowserEnsureStopped");
  -[RPRemoteDisplayDaemon _clientBonjourEnsureStopped](self, "_clientBonjourEnsureStopped");
  clientIncomingMessageCLinkClient = self->_clientIncomingMessageCLinkClient;
  if (clientIncomingMessageCLinkClient)
  {
    -[RPCompanionLinkClient invalidate](clientIncomingMessageCLinkClient, "invalidate");
    v4 = self->_clientIncomingMessageCLinkClient;
    self->_clientIncomingMessageCLinkClient = 0;

  }
}

- (void)_bleDiscoveryEnsureStarted:(BOOL)a3
{
  _BOOL4 v3;
  SFDeviceDiscovery *bleDiscovery;
  unsigned int v6;
  SFDeviceDiscovery *v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int bleDiscoveryID;
  SFDeviceDiscovery *v11;
  SFDeviceDiscovery *v12;
  id v13;
  uint64_t v14;
  int64_t bleRSSIThreshold;
  SFDeviceDiscovery *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  unsigned int v19;
  _QWORD v20[5];
  unsigned int v21;
  _QWORD v22[5];
  unsigned int v23;
  _QWORD v24[5];
  unsigned int v25;

  v3 = a3;
  bleDiscovery = self->_bleDiscovery;
  if (!bleDiscovery)
  {
    bleDiscoveryID = self->_bleDiscoveryID;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]", 30, "BLE discovery start ID %u\n", bleDiscoveryID);
    }
    v11 = (SFDeviceDiscovery *)objc_alloc_init((Class)off_100131A88[0]());
    v12 = self->_bleDiscovery;
    self->_bleDiscovery = v11;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", 1);
    if (-[RPRemoteDisplayDaemon _discoveriCloudDevicesOnly](self, "_discoveriCloudDevicesOnly"))
      -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", (unint64_t)-[SFDeviceDiscovery discoveryFlags](self->_bleDiscovery, "discoveryFlags") | 0x20);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_bleDiscovery, "setPurpose:", CFSTR("RDLink"));
    v13 = -[SFDeviceDiscovery setRssiChangeDetection:](self->_bleDiscovery, "setRssiChangeDetection:", 1);
    if (GestaltGetDeviceClass(v13, v14) == 4)
    {
      bleRSSIThreshold = -75;
    }
    else if (self->_bleRSSIThreshold)
    {
      bleRSSIThreshold = self->_bleRSSIThreshold;
    }
    else
    {
      bleRSSIThreshold = -60;
    }
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", bleRSSIThreshold);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100099AA4;
    v24[3] = &unk_1001117E8;
    v24[4] = self;
    v25 = bleDiscoveryID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleDiscovery, "setDeviceFoundHandler:", v24);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100099AC8;
    v22[3] = &unk_1001117E8;
    v22[4] = self;
    v23 = bleDiscoveryID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleDiscovery, "setDeviceLostHandler:", v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100099AEC;
    v20[3] = &unk_100111810;
    v20[4] = self;
    v21 = bleDiscoveryID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleDiscovery, "setDeviceChangedHandler:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100099B10;
    v18[3] = &unk_100111838;
    v18[4] = self;
    v19 = bleDiscoveryID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleDiscovery, "setInterruptionHandler:", v18);
    if (v3)
      goto LABEL_27;
LABEL_7:
    if (bleDiscovery)
      return;
LABEL_32:
    v16 = self->_bleDiscovery;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100099BA4;
    v17[3] = &unk_100111860;
    v17[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v16, "activateWithCompletion:", v17);
    return;
  }
  v6 = -[RPRemoteDisplayDaemon _discoveriCloudDevicesOnly](self, "_discoveriCloudDevicesOnly");
  v7 = self->_bleDiscovery;
  v8 = (unint64_t)-[SFDeviceDiscovery discoveryFlags](v7, "discoveryFlags");
  if (v6)
    v9 = v8 | 0x20;
  else
    v9 = v8 & 0xFFFFFFDF;
  -[SFDeviceDiscovery setDiscoveryFlags:](v7, "setDiscoveryFlags:", v9);
  if (-[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold") != (id)self->_bleRSSIThreshold)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]", 30, "BLE discovery RSSI threshold changed from %ld -> %ld\n", -[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold"), self->_bleRSSIThreshold);
    }
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold);
    if (v3)
      goto LABEL_27;
    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_7;
LABEL_27:
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]", 30, "BLE discovery overrideScreenOff: %s\n", "yes");
  -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleDiscovery, "setOverrideScreenOff:", 1);
  if (!bleDiscovery)
    goto LABEL_32;
}

- (void)_bleDiscoveryEnsureStopped
{
  SFDeviceDiscovery *bleDiscovery;

  if (self->_bleDiscovery)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStopped]", 30, "BLE discovery stop ID %u\n", self->_bleDiscoveryID);
    }
    -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
    bleDiscovery = self->_bleDiscovery;
    self->_bleDiscovery = 0;

    ++self->_bleDiscoveryID;
  }
}

- (void)_bleDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4
{
  SFDeviceDiscovery *bleDiscovery;
  _QWORD v5[4];
  unsigned int v6;

  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100099DA0;
    v5[3] = &unk_100114818;
    v6 = a4;
    -[SFDeviceDiscovery triggerEnhancedDiscovery:useCase:completion:](bleDiscovery, "triggerEnhancedDiscovery:useCase:completion:", a3, *(_QWORD *)&a4, v5);
  }
}

- (BOOL)_discoveriCloudDevicesOnly
{
  NSMutableSet *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_activatedDiscoverySet;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "discoveryFlags", (_QWORD)v10);
        if (v8)
          v5 |= v8;
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 == 0;
}

- (void)_clientBLEDiscoveryEnsureStarted
{
  -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:](self, "_bleDiscoveryEnsureStarted:", 0);
  self->_clientBLEDiscoveryStarted = 1;
}

- (void)_clientBLEDiscoveryEnsureStopped
{
  if (self->_clientBLEDiscoveryStarted)
    -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStopped](self, "_bleDiscoveryEnsureStopped");
}

- (void)_clientBLEDiscoveryDeviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  unsigned __int16 v21;
  id v22;
  NSMutableSet *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  NSString *deviceConfirmedIdentifier;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  os_signpost_id_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *v45;
  NSMutableDictionary *v46;
  NSMutableSet *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *j;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  id v57;
  unsigned __int16 v58;
  RPRemoteDisplayDaemon *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
      || (objc_msgSend(v6, "hasPrefix:", CFSTR("iPad")) & 1) != 0
      || (objc_msgSend(v6, "hasPrefix:", CFSTR("iPod")) & 1) != 0
      || (objc_msgSend(v6, "hasPrefix:", CFSTR("RealityDevice")) & 1) != 0
      || self->_prefIgnoreRemoteDisplayChecks)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsIdentifier"));
      if (!v7)
      {
        if (dword_100131A18 <= 90
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 90, "### Ignoring BLE device found with no IDS device ID: %@\n", v4);
        }
        goto LABEL_100;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceMap"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

      if ((objc_msgSend(v4, "deviceFlags") & 8) != 0 && !v10)
      {
        if (dword_100131A18 <= 90
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 90, "### Ignoring BLE device found with no IDS device: %@\n", v4);
        }
        goto LABEL_99;
      }
      v11 = GestaltProductTypeStringToDeviceClass(v6);
      v73 = 0;
      v74 = 0;
      v75 = 0;
      if (v10)
      {
        v13 = v11;
        v11 = (uint64_t)objc_msgSend(v10, "operatingSystemVersion");
        if ((_DWORD)v13)
        {
          v11 = wInTP56r94EFs9NAAi(v13, v73, v74, v75);
          if ((v11 & 1) == 0 && !self->_prefIgnoreRemoteDisplayChecks)
          {
            if (dword_100131A18 <= 30
              && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
            {
              LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 30, "Ignoring BLE device with old OS: %d.%d.%d, %@\n", v73, v74, v75, v4);
            }
            goto LABEL_99;
          }
        }
      }
      if (GestaltGetDeviceClass(v11, v12) == 4
        && !-[RPRemoteDisplayDaemon _deviceSupportsLaguna:](self, "_deviceSupportsLaguna:", v4))
      {
        if (dword_100131A18 > 20
          || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 20))
        {
          goto LABEL_99;
        }
        v57 = v4;
        v18 = "Ignoring unsupported BLE device for Laguna: %@\n";
      }
      else
      {
        if (((unsigned __int16)objc_msgSend(v4, "deviceFlags") & 0xC008) != 0)
        {
          v14 = objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v7));
          if (v14)
          {
            v15 = (void *)v14;
            if (dword_100131A18 <= 30
              && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
            {
              v16 = CUDescriptionWithLevel(v4, 30);
              v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 30, "BLE device changed: %@\n", v17);

            }
            v21 = (unsigned __int16)objc_msgSend(v15, "statusFlags");
            v22 = objc_msgSend(v15, "updateWithSFDevice:", v4);
            objc_msgSend(v15, "setIdsDeviceIdentifier:", v7);
            -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v15);
            if ((_DWORD)v22)
            {
              v58 = v21;
              v59 = self;
              v61 = v10;
              v63 = v7;
              v60 = v6;
              v71 = 0u;
              v72 = 0u;
              v69 = 0u;
              v70 = 0u;
              v23 = self->_xpcConnections;
              v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v70;
                do
                {
                  for (i = 0; i != v25; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v70 != v26)
                      objc_enumerationMutation(v23);
                    v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "activatedDiscovery"));
                    v30 = objc_msgSend(v29, "shouldReportDevice:", v15);

                    if (v30)
                    {
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "xpcCnx"));
                      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "remoteObjectProxy"));
                      objc_msgSend(v32, "remoteDisplayChangedDevice:changes:", v15, v22);

                    }
                  }
                  v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
                }
                while (v25);
              }

              if ((v58 & 0x200) != 0 && (objc_msgSend(v15, "statusFlags") & 0x200) == 0)
                -[RPRemoteDisplayDaemon _clientBonjourReconfirmDevice:reason:](v59, "_clientBonjourReconfirmDevice:reason:", v15, "WiFiP2P lost");
              v6 = v60;
              v10 = v61;
              v7 = v63;
              if ((v22 & 1) != 0
                && -[RPRemoteDisplayDevice isEqualToDevice:](v59->_bleNearbyActionV2Device, "isEqualToDevice:", v15))
              {
                -[RPRemoteDisplayDevice updateWithSFDevice:](v59->_bleNearbyActionV2Device, "updateWithSFDevice:", v4);
                -[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserUpdate](v59, "_clientBLENearbyActionV2AdvertiserUpdate");
              }
              if (((unsigned __int16)v22 & 0x400) != 0)
              {
                deviceConfirmedIdentifier = v59->_deviceConfirmedIdentifier;
                if (deviceConfirmedIdentifier)
                {
                  if (-[NSString isEqualToString:](deviceConfirmedIdentifier, "isEqualToString:", v63)
                    && (objc_msgSend(v15, "inDiscoverySession") & 1) == 0)
                  {
                    -[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer](v59, "_startInSessionDeviceLostTimer");
                  }
                }
              }
            }

          }
          else
          {
            if (dword_100131A18 <= 30
              && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
            {
              v19 = CUDescriptionWithLevel(v4, 30);
              v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 30, "BLE device found: %@\n", v20);

            }
            v34 = sub_10009AF98();
            v35 = objc_claimAutoreleasedReturnValue(v34);
            v36 = sub_10009AF98();
            v37 = objc_claimAutoreleasedReturnValue(v36);
            v38 = os_signpost_id_make_with_pointer(v37, self);

            if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
            {
              v39 = CUDescriptionWithLevel(v4, 30);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              *(_DWORD *)buf = 138412290;
              v78 = v40;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, v38, "BLE device found", "BLE device found: %@\n", buf, 0xCu);

            }
            v41 = objc_alloc_init((Class)RPRemoteDisplayDevice);
            objc_msgSend(v41, "setIdentifier:", v7);
            objc_msgSend(v41, "setIdsDevice:", v10);
            objc_msgSend(v41, "setPersistentIdentifier:", v7);
            objc_msgSend(v41, "updateWithSFDevice:", v4);
            objc_msgSend(v41, "setIdsDeviceIdentifier:", v7);
            if (self->_prefIgnoreRemoteDisplayChecks)
            {
              v42 = RPVersionToSourceVersionString(4000000);
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              objc_msgSend(v41, "setSourceVersion:", v43);

            }
            v62 = v10;
            discoveredDevices = self->_discoveredDevices;
            if (!discoveredDevices)
            {
              v45 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v46 = self->_discoveredDevices;
              self->_discoveredDevices = v45;

              discoveredDevices = self->_discoveredDevices;
            }
            v64 = v7;
            -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v41, v7);
            -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v41);
            -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v47 = self->_xpcConnections;
            v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
            if (v48)
            {
              v49 = v48;
              v50 = *(_QWORD *)v66;
              do
              {
                for (j = 0; j != v49; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v66 != v50)
                    objc_enumerationMutation(v47);
                  v52 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "activatedDiscovery"));
                  v54 = objc_msgSend(v53, "shouldReportDevice:", v41);

                  if (v54)
                  {
                    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "xpcCnx"));
                    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "remoteObjectProxy"));
                    objc_msgSend(v56, "remoteDisplayFoundDevice:", v41);

                  }
                }
                v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
              }
              while (v49);
            }

            v10 = v62;
            v7 = v64;
          }
          goto LABEL_99;
        }
        if (dword_100131A18 > 20
          || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 20))
        {
LABEL_99:

LABEL_100:
          goto LABEL_101;
        }
        v57 = v4;
        v18 = "### Ignoring BLE device that does not have expected status flags: %@\n";
      }
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 20, v18, v57);
      goto LABEL_99;
    }
    if (dword_100131A18 <= 20
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 20, "Ignoring unsupported BLE device found: %@\n", v4);
    }
  }
  else if (dword_100131A18 <= 10
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 10)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 10, "### Ignoring BLE device found with no model: %@\n", v4);
  }
LABEL_101:

}

- (void)_clientBLEDiscoveryDeviceLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableSet *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  RPRemoteDisplayDaemon *v28;
  void *v29;
  unsigned int v30;
  NSMutableSet *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  unsigned __int16 v41;
  RPRemoteDisplayDaemon *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsIdentifier"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v5));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));

      if (v10 && v13 && (objc_msgSend(v10, "isEqual:", v13) & 1) == 0)
      {
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]", 30, "Ignoring BLE device lost: cachedBLEDeviceID %@ inBLEDeviceID %@ \n", v10, v13);
        }
      }
      else if (objc_msgSend(v4, "isBLEDeviceReplaced"))
      {
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]", 30, "Ignoring BLE device lost, BLE Device is being replaced: %@\n", v4);
        }
      }
      else
      {
        v41 = (unsigned __int16)objc_msgSend(v7, "statusFlags");
        v43 = v13;
        v44 = v10;
        v42 = self;
        if (objc_msgSend(v7, "removeSFDevice:", v4))
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            v14 = CUDescriptionWithLevel(v4, 30);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]", 30, "BLE device lost (removed): %@\n", v15);

          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v5);
          objc_msgSend(v7, "clearCameraCapabilitiesRefetchTimer");
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v18 = self->_xpcConnections;
          v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(_QWORD *)v50 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "activatedDiscovery"));
                v25 = objc_msgSend(v24, "shouldReportDevice:", v7);

                if (v25)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "xpcCnx"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "remoteObjectProxy"));
                  objc_msgSend(v27, "remoteDisplayLostDevice:", v7);

                }
              }
              v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
            }
            while (v20);
          }

          v28 = v42;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](v42, "deviceConfirmedIdentifier"));
          v30 = objc_msgSend(v5, "isEqualToString:", v29);

          if (v30)
            -[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer](v42, "_startInSessionDeviceLostTimer");
        }
        else
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            v16 = CUDescriptionWithLevel(v4, 30);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]", 30, "BLE device lost (changed): %@\n", v17);

          }
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v31 = self->_xpcConnections;
          v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v46;
            do
            {
              for (j = 0; j != v33; j = (char *)j + 1)
              {
                if (*(_QWORD *)v46 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "activatedDiscovery"));
                v38 = objc_msgSend(v37, "shouldReportDevice:", v7);

                if (v38)
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "xpcCnx"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "remoteObjectProxy"));
                  objc_msgSend(v40, "remoteDisplayChangedDevice:changes:", v7, 2);

                }
              }
              v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            }
            while (v33);
          }

          v28 = v42;
        }
        -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](v28, "_updateXPCMatchingDiscovery");
        v13 = v43;
        v10 = v44;
        if ((v41 & 0x200) != 0 && (objc_msgSend(v7, "statusFlags") & 0x200) == 0)
          -[RPRemoteDisplayDaemon _clientBonjourReconfirmDevice:reason:](v28, "_clientBonjourReconfirmDevice:reason:", v7, "BLE device lost");
      }

    }
  }
  else if (dword_100131A18 <= 10
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 10)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]", 10, "### Ignoring BLE device lost with no IDS device ID: %@\n", v4);
  }

}

- (BOOL)_clientBLEDiscoveryShouldRun
{
  void *v3;
  BOOL v4;

  if (!self->_prefBLEClient)
    return 0;
  if (GestaltGetDeviceClass(self, a2) != 4)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));
  v4 = (int)sub_1000175E8(v3) > 10;

  return v4;
}

- (void)_clientBLENeedsAWDLAdvertiserEnsureStarted
{
  SFService *v3;
  SFService *bleNeedsAWDLAdvertiser;
  uint64_t v5;
  void *v6;
  SFService *v7;
  _QWORD v8[5];

  if (!self->_bleNeedsAWDLAdvertiser)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStarted]", 30, "BLE NeedsAWDL advertiser start\n");
    }
    v3 = (SFService *)objc_alloc_init((Class)off_100131A90[0]());
    bleNeedsAWDLAdvertiser = self->_bleNeedsAWDLAdvertiser;
    self->_bleNeedsAWDLAdvertiser = v3;

    -[SFService setAdvertiseRate:](self->_bleNeedsAWDLAdvertiser, "setAdvertiseRate:", 60);
    -[SFService setDeviceActionType:](self->_bleNeedsAWDLAdvertiser, "setDeviceActionType:", 50);
    -[SFService setDispatchQueue:](self->_bleNeedsAWDLAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    v5 = off_100131A98[0]();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[SFService setIdentifier:](self->_bleNeedsAWDLAdvertiser, "setIdentifier:", v6);

    -[SFService setLabel:](self->_bleNeedsAWDLAdvertiser, "setLabel:", CFSTR("RDLink"));
    -[SFService setNeedsKeyboard:](self->_bleNeedsAWDLAdvertiser, "setNeedsKeyboard:", 1);
    -[SFService setPairSetupDisabled:](self->_bleNeedsAWDLAdvertiser, "setPairSetupDisabled:", 1);
    v7 = self->_bleNeedsAWDLAdvertiser;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009B6EC;
    v8[3] = &unk_100111860;
    v8[4] = self;
    -[SFService activateWithCompletion:](v7, "activateWithCompletion:", v8);
    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1);
  }
}

- (void)_clientBLENeedsAWDLAdvertiserEnsureStopped
{
  SFService *bleNeedsAWDLAdvertiser;

  if (self->_bleNeedsAWDLAdvertiser)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStopped]", 30, "BLE NeedsAWDL advertiser stop\n");
    }
    -[SFService invalidate](self->_bleNeedsAWDLAdvertiser, "invalidate");
    bleNeedsAWDLAdvertiser = self->_bleNeedsAWDLAdvertiser;
    self->_bleNeedsAWDLAdvertiser = 0;

    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0);
  }
}

- (BOOL)_clientBLENeedsAWDLAdvertiserShouldRun
{
  NSMutableSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_xpcConnections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientNetCnx", (_QWORD)v14));
        v8 = objc_msgSend(v7, "state");

        if (v8 != 1)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activatedSession"));
          v10 = objc_msgSend(v9, "needsAWDL");

          if (v10)
          {
            if ((objc_msgSend(v6, "usingNearbyActionV2") & 1) == 0)
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activatedSession"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bonjourDevice"));

              if (!v12)
              {
                LOBYTE(v3) = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v3;
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted
{
  RPRemoteDisplayDevice *bleNearbyActionV2Device;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  RPRemoteDisplayDevice *v9;
  RPNearbyActionV2Advertiser *v10;
  RPNearbyActionV2Advertiser *bleNearbyActionV2Advertiser;
  void *v12;
  RPNearbyActionV2Advertiser *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  RPRemoteDisplayDevice *v16;

  bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
  if (!bleNearbyActionV2Device)
    return;
  if (self->_bleNearbyActionV2Advertiser)
  {
    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1);
    return;
  }
  if (dword_100131A18 <= 30)
  {
    if (dword_100131A18 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131A18, 30))
        goto LABEL_8;
      bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    }
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted]", 30, "BLE NearbyActionV2 advertiser start for device %@\n", bleNearbyActionV2Device);
  }
LABEL_8:
  v4 = sub_10009AF98();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_10009AF98();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v9 = self->_bleNearbyActionV2Device;
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "BLE NearbyActionV2 advertisement", "BLE NearbyActionV2 advertiser start for device %@\n signpost_begin:begin_time", buf, 0xCu);
  }

  v10 = objc_alloc_init(RPNearbyActionV2Advertiser);
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  self->_bleNearbyActionV2Advertiser = v10;

  -[RPNearbyActionV2Advertiser setDispatchQueue:](self->_bleNearbyActionV2Advertiser, "setDispatchQueue:", self->_dispatchQueue);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDevice bleTargetData](self->_bleNearbyActionV2Device, "bleTargetData"));
  -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v12);

  -[RPNearbyActionV2Advertiser setNearbyActionType:](self->_bleNearbyActionV2Advertiser, "setNearbyActionType:", -[RPRemoteDisplayDevice nearbyActionV2Type](self->_bleNearbyActionV2Device, "nearbyActionV2Type"));
  v13 = self->_bleNearbyActionV2Advertiser;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009BC18;
  v14[3] = &unk_100111860;
  v14[4] = self;
  -[RPNearbyActionV2Advertiser activateWithCompletion:](v13, "activateWithCompletion:", v14);
  -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1);
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped
{
  RPNearbyActionV2Advertiser *bleNearbyActionV2Advertiser;
  RPNearbyActionV2Advertiser *v4;
  RPRemoteDisplayDevice *bleNearbyActionV2Device;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser)
  {
    -[RPNearbyActionV2Advertiser invalidate](bleNearbyActionV2Advertiser, "invalidate");
    v4 = self->_bleNearbyActionV2Advertiser;
    self->_bleNearbyActionV2Advertiser = 0;

    bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    self->_bleNearbyActionV2Device = 0;

    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped]", 30, "BLE NearbyActionV2 advertiser stopped\n");
    }
    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0);
    v6 = sub_10009AF98();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_10009AF98();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_signpost_id_make_with_pointer(v9, self);

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v10, "BLE NearbyActionV2 advertisement", "BLE NearbyActionV2 advertiser stopped\n signpost_end:end_time", v11, 2u);
    }

  }
}

- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun
{
  void *v3;
  unsigned int v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  id *location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v4 = objc_msgSend(v3, "isNearbyActionV2AdvertiserActive");

  if (v4)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]", 30, "Skip using NearbyActionV2 advertiser because it is already in use\n");
    }
    return 0;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v6)
    goto LABEL_26;
  v7 = v6;
  v8 = *(_QWORD *)v34;
  location = (id *)&self->_bleNearbyActionV2Device;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientNetCnx"));
      v12 = objc_msgSend(v11, "state");

      if (v12 != 1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedSession"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedSession"));
          v15 = objc_msgSend(v14, "needsAWDL");

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedSession"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bonjourDevice"));

            if (!v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedSession"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "daemonDevice"));

              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "idsDeviceIdentifier"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "idsDeviceMap"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v20));

              if ((objc_msgSend(v19, "statusFlags") & 0x80000) != 0)
              {
                if (!v23)
                {
                  if (dword_100131A18 <= 90
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
                  {
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]", 90, "### Failed to use NearbyActionV2 advertiser, IDS device for ID %@ not found\n", v20);
                  }
                  v23 = 0;
                  goto LABEL_50;
                }
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "modelIdentifier"));
                v25 = GestaltProductTypeStringToDeviceClass(v24);

                if ((v25 & 0xFFFFFFFD) != 1)
                {
                  if (dword_100131A18 <= 30
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "modelIdentifier"));
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]", 30, "Skip using NearbyActionV2 advertiser, destination device model did not match '%@'\n", v30);

                  }
                  goto LABEL_50;
                }
                objc_msgSend(v23, "operatingSystemVersion");
                if ((DeviceOSVersionAtOrLater(v25, 0, 0, 0, 160000, 130000, 160000, 90000) & 1) == 0)
                {
                  if (dword_100131A18 <= 30
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                  {
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]", 30, "Skip using NearbyActionV2 advertiser, destinationDevice (%@) OSVersion is older\n", v20);
                  }
                  goto LABEL_50;
                }
              }
              else if (((unint64_t)objc_msgSend(v19, "statusFlags") & 0x3000000000) == 0)
              {
                if (dword_100131A18 <= 30
                  && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                {
                  LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]", 30, "Skip using NearbyActionV2 as destination device is missing correct status flags: %@\n", v19);
                }
LABEL_50:

                v29 = 0;
                goto LABEL_51;
              }
              v26 = *location;
              if (!*location)
              {
                v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bleTargetData"));
                if (!v27)
                {
                  if (dword_100131A18 <= 30
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                  {
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]", 30, "Skip using NearbyActionV2 advertiser, targetAuthTag is nil\n");
                  }
                  goto LABEL_50;
                }
                v28 = (void *)v27;
                objc_storeStrong(location, v19);
                objc_msgSend(*location, "setNearbyActionV2Type:", 50);
                objc_msgSend(v10, "setUsingNearbyActionV2:", 1);

                v26 = *location;
              }

              if (v26)
              {
                v29 = 1;
LABEL_51:

                return v29;
              }
            }
          }
        }
      }
    }
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
      continue;
    break;
  }
LABEL_26:

  return 0;
}

- (void)_clientBLENearbyActionV2AdvertiserUpdate
{
  RPNearbyActionV2Advertiser *bleNearbyActionV2Advertiser;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  id v8;

  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser && self->_bleNearbyActionV2Device)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Advertiser targetData](bleNearbyActionV2Advertiser, "targetData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDevice bleTargetData](self->_bleNearbyActionV2Device, "bleTargetData"));
    v8 = v4;
    v6 = v5;
    if (v8 != v6)
    {
      if ((v8 == 0) != (v6 != 0))
      {
        v7 = objc_msgSend(v8, "isEqual:", v6);

        if ((v7 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserUpdate]", 30, "BLE NearbyActionV2 advertiser updating target data <%.3@> -> <%.3@>\n", v8, v6);
      }
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6);
      goto LABEL_15;
    }

LABEL_15:
  }
}

- (void)_clientBonjourEnsureStarted
{
  CUBonjourBrowser *v3;
  CUBonjourBrowser *bonjourBrowser;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_bonjourBrowser)
  {
    if (self->_btAdvAddrData)
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourEnsureStarted]", 30, "Bonjour browser start\n");
      }
      v3 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
      bonjourBrowser = self->_bonjourBrowser;
      self->_bonjourBrowser = v3;

      if (self->_prefNoInfra)
        v5 = 0x8000000000000;
      else
        v5 = 0x20000000000000;
      -[CUBonjourBrowser setBrowseFlags:](self->_bonjourBrowser, "setBrowseFlags:", v5);
      -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowser, "setChangeFlags:", 0xFFFFFFFFLL);
      -[CUBonjourBrowser setControlFlags:](self->_bonjourBrowser, "setControlFlags:", 1);
      -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowser, "setDispatchQueue:", self->_dispatchQueue);
      -[CUBonjourBrowser setDomain:](self->_bonjourBrowser, "setDomain:", CFSTR("local."));
      -[CUBonjourBrowser setLabel:](self->_bonjourBrowser, "setLabel:", CFSTR("RDLink"));
      -[CUBonjourBrowser setServiceType:](self->_bonjourBrowser, "setServiceType:", CFSTR("_rdlink._tcp"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10009C60C;
      v8[3] = &unk_1001118D8;
      v8[4] = self;
      -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowser, "setDeviceFoundHandler:", v8);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10009C628;
      v7[3] = &unk_1001118D8;
      v7[4] = self;
      -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowser, "setDeviceLostHandler:", v7);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10009C68C;
      v6[3] = &unk_100111900;
      v6[4] = self;
      -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowser, "setDeviceChangedHandler:", v6);
      -[CUBonjourBrowser activate](self->_bonjourBrowser, "activate");
    }
    else if (dword_100131A18 <= 20
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourEnsureStarted]", 20, "Deferring Bonjour browse without BT addr\n");
    }
  }
}

- (void)_clientBonjourEnsureStopped
{
  CUBonjourBrowser *bonjourBrowser;
  NSObject *pendingLostDevicesTimer;
  OS_dispatch_source *v5;

  if (self->_bonjourBrowser)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourEnsureStopped]", 30, "Bonjour browser stop\n");
    }
    -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

    pendingLostDevicesTimer = self->_pendingLostDevicesTimer;
    if (pendingLostDevicesTimer)
    {
      dispatch_source_cancel(pendingLostDevicesTimer);
      v5 = self->_pendingLostDevicesTimer;
      self->_pendingLostDevicesTimer = 0;

    }
    -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
  }
}

- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4
{
  id v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t Int64;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSMutableSet *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *i;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *v57;
  NSMutableDictionary *v58;
  NSMutableSet *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *j;
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txtDictionary"));
  if (self->_btAdvAddrStr)
  {
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("rpBA"), TypeID, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    v11 = v10;
    if (!v10)
    {
      if (dword_100131A18 > 10
        || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 10))
      {
        goto LABEL_42;
      }
      v14 = CUDescriptionWithLevel(v6, 30);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring device with no BLE address: %@\n", v13);
LABEL_10:

      goto LABEL_42;
    }
    if (objc_msgSend(v10, "isEqual:", self->_btAdvAddrStr))
    {
      if (dword_100131A18 > 10
        || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 10))
      {
        goto LABEL_42;
      }
      v12 = CUDescriptionWithLevel(v6, 30);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring our own Bonjour device: %@\n", v13);
      goto LABEL_10;
    }

  }
  Int64 = CFDictionaryGetInt64(v7, CFSTR("rpRF"), 0);
  if (!Int64)
  {
    if ((CFDictionaryGetInt64(v7, CFSTR("rpFl"), 0) & 0x800) != 0)
    {
      if (dword_100131A18 > 10
        || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 10))
      {
        goto LABEL_43;
      }
      v34 = CUDescriptionWithLevel(v6, 30);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v34);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring ConnectOnly Bonjour device: %@\n", v11);
      goto LABEL_42;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resolveIdentityForBonjourDevice:typeFlags:", v6, 3074));
    v19 = v18;
    if (!v18)
    {
      if (dword_100131A18 <= 10
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 10)))
      {
        v35 = CUDescriptionWithLevel(v6, 30);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 10, "Ignoring found unresolved device: %@\n", v36);

      }
      -[RPRemoteDisplayDaemon _clientBonjourFoundUnresolvedDevice:](self, "_clientBonjourFoundUnresolvedDevice:", v6);
      v21 = 0;
      goto LABEL_101;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "idsDeviceID"));
    v21 = v20 != 0;
    if (!v20)
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        v38 = CUDescriptionWithLevel(v6, 30);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 90, "Ignoring found device with missing IDS device ID: %@\n", v39);

      }
      -[RPRemoteDisplayDaemon _clientBonjourFoundUnresolvedDevice:](self, "_clientBonjourFoundUnresolvedDevice:", v6);
      goto LABEL_100;
    }
    if (!a4)
      -[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices](self, "_clientBonjourReevaluateDevices");
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "model"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "idsDeviceMap"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v20));

    v74 = v24;
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelIdentifier"));
      v26 = v25;
      if (v25)
      {
        v27 = v25;

        v76 = v27;
      }

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingLostDevices, "setObject:forKeyedSubscript:", 0, v20);
    v75 = v20;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v20));
    if (v28)
    {
      v29 = v28;
      v30 = objc_msgSend(v28, "updateWithBonjourDevice:", v6);
      if (v76)
      {
        v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "model"));
        v32 = v76;
        v33 = v32;
        if (v31 == v32)
        {

        }
        else
        {
          if (!v31)
          {

LABEL_61:
            objc_msgSend(v29, "setModel:", v33);
            v30 = (id)(v30 | 2);
            -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v29);
LABEL_62:
            if (dword_100131A18 <= 30
              && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
            {
              v42 = CUDescriptionWithLevel(v6, 30);
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 30, "Bonjour device changed %@, %@\n", v75, v43);

            }
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v44 = self->_xpcConnections;
            v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
            if (v45)
            {
              v46 = v45;
              v69 = v21;
              v70 = v19;
              v71 = v17;
              v73 = v7;
              v47 = *(_QWORD *)v82;
              do
              {
                for (i = 0; i != v46; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v82 != v47)
                    objc_enumerationMutation(v44);
                  v49 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "activatedDiscovery"));
                  v51 = objc_msgSend(v50, "shouldReportDevice:", v29);

                  if (v51)
                  {
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "xpcCnx"));
                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "remoteObjectProxy"));
                    objc_msgSend(v53, "remoteDisplayChangedDevice:changes:", v29, v30);

                  }
                }
                v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
              }
              while (v46);

LABEL_98:
              v17 = v71;
              v7 = v73;
              v19 = v70;
              v21 = v69;
              goto LABEL_99;
            }

LABEL_77:
LABEL_99:

            v20 = v75;
LABEL_100:

LABEL_101:
            goto LABEL_44;
          }
          v72 = objc_msgSend(v31, "isEqual:", v32);

          if ((v72 & 1) == 0)
            goto LABEL_61;
        }
      }
      -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v29);
      if (!(_DWORD)v30)
        goto LABEL_77;
      goto LABEL_62;
    }
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v40 = CUDescriptionWithLevel(v6, 30);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 30, "Bonjour device found: %@, %@\n", v20, v41);

    }
    v54 = objc_alloc_init((Class)RPRemoteDisplayDevice);
    objc_msgSend(v54, "setIdentifier:", v75);
    objc_msgSend(v54, "setIdsDevice:", v24);
    objc_msgSend(v54, "setIdsDeviceIdentifier:", v75);
    objc_msgSend(v54, "setModel:", v76);
    objc_msgSend(v54, "setPersistentIdentifier:", v75);
    v71 = v17;
    if (objc_msgSend(v19, "type") == 2)
    {
      v55 = 0x80000;
    }
    else if (objc_msgSend(v19, "type") == 12)
    {
      v55 = 0x1000000000;
    }
    else
    {
      if (objc_msgSend(v19, "type") != 13)
      {
LABEL_86:
        v69 = v21;
        v70 = v19;
        v73 = v7;
        objc_msgSend(v54, "updateWithBonjourDevice:", v6);
        discoveredDevices = self->_discoveredDevices;
        if (!discoveredDevices)
        {
          v57 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v58 = self->_discoveredDevices;
          self->_discoveredDevices = v57;

          discoveredDevices = self->_discoveredDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v54, v75);
        -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v54);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v59 = self->_xpcConnections;
        v60 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v61; j = (char *)j + 1)
            {
              if (*(_QWORD *)v78 != v62)
                objc_enumerationMutation(v59);
              v64 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "activatedDiscovery"));
              v66 = objc_msgSend(v65, "shouldReportDevice:", v54);

              if (v66)
              {
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "xpcCnx"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "remoteObjectProxy"));
                objc_msgSend(v68, "remoteDisplayFoundDevice:", v54);

              }
            }
            v61 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
          }
          while (v61);
        }

        -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
        goto LABEL_98;
      }
      v55 = 0x2000000000;
    }
    objc_msgSend(v54, "setStatusFlags:", (unint64_t)objc_msgSend(v54, "statusFlags") | v55);
    goto LABEL_86;
  }
  if (dword_100131A18 > 20 || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 20))
    goto LABEL_43;
  v16 = CUDescriptionWithLevel(v6, 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
  LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]", 20, "Ignoring device with unsupported requirements: %#ll{flags}, %@\n", Int64, &unk_10010B41D, v11);
LABEL_42:

LABEL_43:
  v21 = 0;
LABEL_44:

  return v21;
}

- (void)_clientBonjourLostDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *pendingLostDevices;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolveIdentityForBonjourDevice:typeFlags:", v13, 2));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v7));
      if (v8)
      {
        pendingLostDevices = self->_pendingLostDevices;
        if (!pendingLostDevices)
        {
          v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v11 = self->_pendingLostDevices;
          self->_pendingLostDevices = v10;

          pendingLostDevices = self->_pendingLostDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](pendingLostDevices, "setObject:forKeyedSubscript:", v13, v7);
        -[RPRemoteDisplayDaemon _schedulePendingLostDeviceTimer](self, "_schedulePendingLostDeviceTimer");
      }
    }
    else
    {
      if (dword_100131A18 > 90
        || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 90))
      {
        goto LABEL_11;
      }
      v12 = CUDescriptionWithLevel(v13, 30);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourLostDevice:]", 90, "Ignoring lost device with missing IDS device ID: %@\n", v8);
    }

LABEL_11:
  }

}

- (void)_schedulePendingLostDeviceTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *pendingLostDevicesTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (!self->_pendingLostDevicesTimer)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _schedulePendingLostDeviceTimer]", 30, "Scheduling timer to process lost bonjour devices, count %d", -[NSMutableDictionary count](self->_pendingLostDevices, "count"));
    }
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pendingLostDevicesTimer = self->_pendingLostDevicesTimer;
    self->_pendingLostDevicesTimer = v3;

    v5 = self->_pendingLostDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10009D2F4;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(self->_pendingLostDevicesTimer, 0.5, -1.0, 0.5);
    dispatch_activate((dispatch_object_t)self->_pendingLostDevicesTimer);
  }
}

- (void)_processPendingLostDevices
{
  RPRemoteDisplayDaemon *v2;
  void *i;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  NSMutableDictionary *pendingLostDevices;
  id obj;
  RPRemoteDisplayDaemon *v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _processPendingLostDevices]", 30, "Processing lost bonjour devices, count %d", -[NSMutableDictionary count](v2->_pendingLostDevices, "count"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_pendingLostDevices, "allKeys"));
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v34)
  {
    v32 = v2;
    v33 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_pendingLostDevices, "objectForKeyedSubscript:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](v2, "_findMatchingDeviceWithIdentifier:", v4));
        if (objc_msgSend(v6, "removeBonjourDevice:", v5))
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            v7 = CUDescriptionWithLevel(v5, 30);
            v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _processPendingLostDevices]", 30, "Bonjour device lost (removed): %@, %@\n", v4, v8);

          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v4);
          objc_msgSend(v6, "clearCameraCapabilitiesRefetchTimer");
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v11 = v2->_xpcConnections;
          v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v40 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activatedDiscovery"));
                v18 = objc_msgSend(v17, "shouldReportDevice:", v6);

                if (v18)
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "xpcCnx"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "remoteObjectProxy"));
                  objc_msgSend(v20, "remoteDisplayLostDevice:", v6);

                }
              }
              v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            }
            while (v13);
LABEL_38:
            v2 = v32;
          }
        }
        else
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            v9 = CUDescriptionWithLevel(v5, 30);
            v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _processPendingLostDevices]", 30, "Bonjour device lost (changed): %@, %@\n", v4, v10);

          }
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v11 = v2->_xpcConnections;
          v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v36;
            do
            {
              for (k = 0; k != v22; k = (char *)k + 1)
              {
                if (*(_QWORD *)v36 != v23)
                  objc_enumerationMutation(v11);
                v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)k);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activatedDiscovery"));
                v27 = objc_msgSend(v26, "shouldReportDevice:", v6);

                if (v27)
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "xpcCnx"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "remoteObjectProxy"));
                  objc_msgSend(v29, "remoteDisplayChangedDevice:changes:", v6, 2);

                }
              }
              v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
            }
            while (v22);
            goto LABEL_38;
          }
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v34);
  }

  -[NSMutableDictionary removeAllObjects](v2->_pendingLostDevices, "removeAllObjects");
  pendingLostDevices = v2->_pendingLostDevices;
  v2->_pendingLostDevices = 0;

  -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](v2, "_updateXPCMatchingDiscovery");
}

- (void)_clientBonjourFoundUnresolvedDevice:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *unresolvedDevices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    unresolvedDevices = self->_unresolvedDevices;
    if (!unresolvedDevices)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v8 = self->_unresolvedDevices;
      self->_unresolvedDevices = v7;

      unresolvedDevices = self->_unresolvedDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](unresolvedDevices, "setObject:forKeyedSubscript:", v9, v5);
  }

}

- (void)_clientBonjourLostUnresolvedDevice:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v5 = v6;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unresolvedDevices, "setObject:forKeyedSubscript:", 0, v6);
    v5 = v6;
  }

}

- (void)_clientBonjourReconfirmDevice:(id)a3 reason:(const char *)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (dword_100131A18 <= 30)
  {
    if (dword_100131A18 != -1 || (v6 = _LogCategory_Initialize(&dword_100131A18, 30), v5 = v9, v6))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourReconfirmDevice:reason:]", 30, "Bonjour reconfirm (%s): %@\n", a4, v5);
      v5 = v9;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bonjourDevice"));
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "reconfirm");

}

- (void)_clientBonjourReevaluateDevices
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  if (-[NSMutableDictionary count](self->_unresolvedDevices, "count")
    && dword_100131A18 <= 30
    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices]", 30, "Re-evaluating devices\n");
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "bonjourDevice"));
        if (v8)
          -[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:](self, "_clientBonjourFoundDevice:reevaluate:", v8, 1);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_unresolvedDevices, "allValues"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j);
        if (-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:](self, "_clientBonjourFoundDevice:reevaluate:", v14, 1))
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices]", 30, "Removing unresolved device after re-evaluating: %@\n", v14);
          }
          -[RPRemoteDisplayDaemon _clientBonjourLostUnresolvedDevice:](self, "_clientBonjourLostUnresolvedDevice:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

}

- (void)_clientBonjourAWDLBrowserEnsureStarted
{
  void *v3;
  CUBonjourBrowser *v4;
  CUBonjourBrowser *bonjourBrowserAWDL;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_bonjourBrowserAWDL)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStarted]", 30, "Bonjour AWDL browser start\n");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
    objc_msgSend(v3, "activateForClient:", CFSTR("Sidecar"));

    v4 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = v4;

    -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowserAWDL, "setChangeFlags:", 0xFFFFFFFFLL);
    -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowserAWDL, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBonjourBrowser setDomain:](self->_bonjourBrowserAWDL, "setDomain:", CFSTR("local."));
    -[CUBonjourBrowser setInterfaceName:](self->_bonjourBrowserAWDL, "setInterfaceName:", CFSTR("awdl0"));
    -[CUBonjourBrowser setLabel:](self->_bonjourBrowserAWDL, "setLabel:", CFSTR("RDLink"));
    -[CUBonjourBrowser setServiceType:](self->_bonjourBrowserAWDL, "setServiceType:", CFSTR("_rdlink._tcp"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009DD80;
    v8[3] = &unk_1001118D8;
    v8[4] = self;
    -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowserAWDL, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009DD98;
    v7[3] = &unk_1001118D8;
    v7[4] = self;
    -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowserAWDL, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009DDB0;
    v6[3] = &unk_100111900;
    v6[4] = self;
    -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowserAWDL, "setDeviceChangedHandler:", v6);
    -[CUBonjourBrowser activate](self->_bonjourBrowserAWDL, "activate");
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStopped
{
  CUBonjourBrowser *bonjourBrowserAWDL;
  void *v4;
  NSMutableDictionary *bonjourAWDLDevices;

  if (self->_bonjourBrowserAWDL)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStopped]", 30, "Bonjour AWDL browser stop\n");
    }
    -[CUBonjourBrowser invalidate](self->_bonjourBrowserAWDL, "invalidate");
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = 0;

    if (!self->_bonjourAWDLAdvertiser)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
      objc_msgSend(v4, "invalidateForClient:", CFSTR("Sidecar"));

    }
    -[NSMutableDictionary removeAllObjects](self->_bonjourAWDLDevices, "removeAllObjects");
    bonjourAWDLDevices = self->_bonjourAWDLDevices;
    self->_bonjourAWDLDevices = 0;

  }
}

- (BOOL)_clientBonjourAWDLBrowserShouldRun
{
  id v2;
  NSMutableSet *v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  if (self->_bonjourBrowserAWDLForce)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = self->_activatedSessionSet;
    v2 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "needsAWDL", (_QWORD)v7) & 1) != 0)
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        v2 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return (char)v2;
}

- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t Int64;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  RPRemoteDisplayDaemon *v22;
  NSMutableDictionary *bonjourAWDLDevices;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  void *v26;
  NSMutableSet *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  os_signpost_id_t v53;
  void *v54;
  unsigned __int8 v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  RPRemoteDisplayDaemon *v60;
  NSMutableSet *v61;
  void *v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "txtDictionary"));
  Int64 = CFDictionaryGetInt64(v5, CFSTR("rpRF"), 0);
  if (Int64)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v7 = CUDescriptionWithLevel(v4, 30);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Ignoring AWDL device with unsupported requirements: %#ll{flags}, %@\n", Int64, &unk_10010B41D, v8);
LABEL_9:

      goto LABEL_71;
    }
    goto LABEL_71;
  }
  v9 = CFDictionaryGetInt64(v5, CFSTR("rpFl"), 0);
  if ((v9 & 0x800) != 0)
  {
    if ((v9 & 0x80000) != 0)
    {
      -[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:](self, "_clientAWDLPairingSessionWithDevice:", v4);
      goto LABEL_71;
    }
    v60 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resolveIdentityForBonjourDevice:typeFlags:", v4, 3074));
    v13 = v12;
    if (v12)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDeviceID"));
      if (v62)
      {
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          v14 = CUDescriptionWithLevel(v4, 30);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v60->_bonjourAWDLDevices, "objectForKeyedSubscript:", v62));
          v17 = "(update)";
          if (!v16)
            v17 = "(new)";
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Found AWDL device: %@, %@ %s\n", v62, v15, v17);

        }
        v57 = v13;
        v58 = v11;
        v59 = v5;
        v22 = v60;
        bonjourAWDLDevices = v60->_bonjourAWDLDevices;
        if (!bonjourAWDLDevices)
        {
          v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v25 = v60->_bonjourAWDLDevices;
          v60->_bonjourAWDLDevices = v24;

          bonjourAWDLDevices = v60->_bonjourAWDLDevices;
        }
        v26 = v62;
        -[NSMutableDictionary setObject:forKeyedSubscript:](bonjourAWDLDevices, "setObject:forKeyedSubscript:", v4, v62);
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v27 = v60->_xpcConnections;
        v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v66;
          v61 = v27;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v66 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "clientNetCnx"));
              v34 = objc_msgSend(v33, "present");

              if ((v34 & 1) == 0)
              {
                v35 = v30;
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "activatedSession"));
                v37 = v36;
                if (!v36 || !objc_msgSend(v36, "needsAWDL"))
                  goto LABEL_62;
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "daemonDevice"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
                v63 = v38;
                if (objc_msgSend(v39, "isEqual:", v26))
                {

LABEL_43:
                  objc_msgSend(v37, "setBonjourDevice:", v4);
                  if (dword_100131A18 <= 30
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                  {
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "serviceType"));
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Start connection to found AWDL device (%@) for service type %@ \n", v63, v44);

                  }
                  v49 = sub_10009AF98();
                  v50 = objc_claimAutoreleasedReturnValue(v49);
                  v51 = sub_10009AF98();
                  v52 = objc_claimAutoreleasedReturnValue(v51);
                  v53 = os_signpost_id_make_with_pointer(v52, v22);

                  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "serviceType"));
                    *(_DWORD *)buf = 138412546;
                    v70 = v63;
                    v71 = 2112;
                    v72 = v54;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_EVENT, v53, "Found AWDL device", "Start connection to found AWDL device (%@) for service type %@ \n", buf, 0x16u);

                  }
                  v64 = 0;
                  v45 = v63;
                  v55 = objc_msgSend(v32, "netConnectionStartWithDevice:session:error:", v63, v37, &v64);
                  v46 = v64;
                  if ((v55 & 1) != 0)
                  {
                    v27 = v61;
                    v26 = v62;
                    goto LABEL_60;
                  }
                  v27 = v61;
                  if (dword_100131A18 <= 90)
                  {
                    v26 = v62;
                    if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90))
                      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 90, "### Start connection on found AWDL device failed: %@, %{error}\n", v63, v46);
LABEL_60:

LABEL_61:
LABEL_62:

                    v30 = v35;
                    goto LABEL_63;
                  }
                }
                else
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bleDevice"));
                  v41 = v4;
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "rapportIdentifier"));
                  v43 = objc_msgSend(v42, "isEqual:", v26);

                  v4 = v41;
                  v22 = v60;

                  if ((v43 & 1) != 0)
                    goto LABEL_43;
                  v27 = v61;
                  v26 = v62;
                  v45 = v63;
                  if (dword_100131A18 > 30
                    || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 30))
                  {
                    goto LABEL_61;
                  }
                  v46 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "identifier"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bleDevice"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "rapportIdentifier"));
                  LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "AWDL device idsDeviceID %@ did not match identifier %@ rapportIdentifier %@\n", v62, v46, v48);

                  v45 = v63;
                }
                v26 = v62;
                goto LABEL_60;
              }
LABEL_63:
              v31 = (char *)v31 + 1;
            }
            while (v29 != v31);
            v56 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            v29 = v56;
          }
          while (v56);
        }

        v11 = v58;
        v5 = v59;
        v13 = v57;
      }
      else if (dword_100131A18 <= 90
             && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        v20 = CUDescriptionWithLevel(v4, 30);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 90, "Ignoring found AWDL device with missing IDS device ID: %@\n", v21);

      }
    }
    else if (dword_100131A18 <= 30
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v18 = CUDescriptionWithLevel(v4, 30);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Ignoring found unresolved AWDL device: %@\n", v19);

    }
    goto LABEL_71;
  }
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    v10 = CUDescriptionWithLevel(v4, 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]", 30, "Ignoring non-ConnectOnly AWDL device: %@\n", v8);
    goto LABEL_9;
  }
LABEL_71:

}

- (void)_clientAWDLPairingSessionWithDevice:(id)a3
{
  id v4;
  void *v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  CFTypeID v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "txtDictionary"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v5, CFSTR("rpPI"), TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v9 = v8;
  if (v8 && (unint64_t)objc_msgSend(v8, "length") > 0xF)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = self->_xpcConnections;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "clientNetCnx"));
          v17 = objc_msgSend(v16, "present");

          if ((v17 & 1) == 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activatedSession"));
            v19 = v18;
            if (v18)
            {
              if (objc_msgSend(v18, "needsAWDL"))
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pairingInfo"));

                if (v20)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pairingInfo"));
                  v32 = 0;
                  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v21, 16, &v32));
                  v23 = v32;

                  if (v23
                    && dword_100131A18 <= 30
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                  {
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]", 30, "JSON error: %@\n", v23);
                  }
                  v24 = CFStringGetTypeID();
                  v25 = CFDictionaryGetTypedValue(v22, CFSTR("_pi"), v24, 0);
                  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
                  if (dword_100131A18 <= 30
                    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                  {
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]", 30, "AWDL pairing device: awdlPairingID %@ sessionPairingID %@\n", v9, v26);
                  }
                  if (v26 && (objc_msgSend(v26, "isEqualToString:", v9) & 1) != 0)
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daemonDevice"));
                    objc_msgSend(v19, "setBonjourDevice:", v4);
                    if (dword_100131A18 <= 30
                      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                    {
                      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "serviceType"));
                      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]", 30, "Start connection to found AWDL device (%@) for service type %@ \n", v4, v27);

                    }
                    v31 = 0;
                    v28 = objc_msgSend(v15, "netConnectionStartWithDevice:session:error:", v30, v19, &v31);
                    v29 = v31;
                    if ((v28 & 1) == 0
                      && dword_100131A18 <= 90
                      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
                    {
                      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]", 90, "### Start connection on found AWDL device failed: %@, %{error}\n", v30, v29);
                    }

                  }
                  else if (dword_100131A18 <= 90
                         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
                  {
                    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]", 90, "Ignoring device found over AWDL, pairing ID (%@) did not match session pairing ID (%@)\n", v9, v26);
                  }

                  goto LABEL_48;
                }
              }
            }

          }
        }
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_48:

  }
  else if (dword_100131A18 <= 90
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]", 90, "Ignoring device found over AWDL in pairing mode, incomplete pairing ID %@\n", v9);
  }

}

- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolveIdentityForBonjourDevice:typeFlags:", v13, 2));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
    if (v7)
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        v8 = CUDescriptionWithLevel(v13, 30);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Lost AWDL device: %@, %@\n", v7, v9);

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", 0, v7);
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      v11 = CUDescriptionWithLevel(v13, 30);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserLostDevice:]", 90, "Ignoring lost AWDL device with missing IDS device ID: %@\n", v12);

    }
    goto LABEL_14;
  }
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    v10 = CUDescriptionWithLevel(v13, 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserLostDevice:]", 30, "Ignoring lost unresolved AWDL device: %@\n", v7);
LABEL_14:

  }
}

- (void)_clientLostAllDevices
{
  id v2;
  id v3;
  void *i;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *j;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  NSMutableDictionary *discoveredDevices;
  id obj;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v2)
  {
    v3 = v2;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "clearCameraCapabilitiesRefetchTimer");
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = self->_xpcConnections;
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activatedDiscovery"));
              v13 = objc_msgSend(v12, "shouldReportDevice:", v5);

              if (v13)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcCnx"));
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remoteObjectProxy"));
                objc_msgSend(v15, "remoteDisplayLostDevice:", v5);

              }
            }
            v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v8);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v3);
  }

  -[NSMutableDictionary removeAllObjects](self->_discoveredDevices, "removeAllObjects");
  discoveredDevices = self->_discoveredDevices;
  self->_discoveredDevices = 0;

  -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
}

- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSMutableSet *needsAWDLSentToPeers;
  NSMutableSet *needsAWDLNewPeers;
  id obj;
  _QWORD v21[6];
  id v22;
  RPRemoteDisplayDaemon *v23;
  BOOL v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = a3;
  v5 = 368;
  if (a3)
    v5 = 352;
  v6 = *(id *)((char *)&self->super.isa + v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc_init((Class)RPCompanionLinkClient);
        objc_msgSend(v12, "setDispatchQueue:", self->_dispatchQueue);
        v13 = objc_alloc_init((Class)RPCompanionLinkDevice);
        objc_msgSend(v13, "setIdentifier:", v11);
        objc_msgSend(v12, "setDestinationDevice:", v13);
        objc_msgSend(v12, "setControlFlags:", (unint64_t)objc_msgSend(v12, "controlFlags") | 0x400000);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("_i"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("_ena"));

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10009F218;
        v21[3] = &unk_100114840;
        v21[4] = v11;
        v21[5] = v12;
        v24 = v3;
        v22 = v14;
        v23 = self;
        v25 = v3;
        v17 = v14;
        objc_msgSend(v12, "activateWithCompletion:", v21);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  if (!v3)
  {
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;

  }
  needsAWDLNewPeers = self->_needsAWDLNewPeers;
  self->_needsAWDLNewPeers = 0;

}

- (void)_serverEnsureStarted
{
  unsigned int v3;
  unsigned __int8 v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  uint64_t DeviceClass;
  uint64_t v9;
  uint64_t v10;
  id v11;
  SFAuthenticationManager *v12;
  SFAuthenticationManager *authenticationManager;

  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    if (self->_prefServerBonjourInfra)
    {
      v3 = -[RPRemoteDisplayDaemon _serverBonjourAWDLNeeded](self, "_serverBonjourAWDLNeeded");
      -[RPRemoteDisplayDaemon _serverTCPEnsureStarted](self, "_serverTCPEnsureStarted");
LABEL_4:
      -[RPRemoteDisplayDaemon _serverBonjourEnsureStarted](self, "_serverBonjourEnsureStarted");
LABEL_15:
      if (-[RPRemoteDisplayDaemon _serverBLEDiscoveryShouldStart](self, "_serverBLEDiscoveryShouldStart"))
        -[RPRemoteDisplayDaemon _serverBLEDiscoveryEnsureStarted](self, "_serverBLEDiscoveryEnsureStarted");
      else
        -[RPRemoteDisplayDaemon _serverBLEDiscoveryEnsureStopped](self, "_serverBLEDiscoveryEnsureStopped");
      if (self->_prefBLEServer
        && -[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryShouldRun](self, "_serverBLENearbyActionV2DiscoveryShouldRun"))
      {
        -[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStarted](self, "_serverBLENearbyActionV2DiscoveryEnsureStarted");
      }
      else
      {
        -[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStopped](self, "_serverBLENearbyActionV2DiscoveryEnsureStopped");
      }
      if (self->_prefBLEServer || self->_awdlPairingID)
        -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStarted](self, "_serverBLENeedsAWDLScannerEnsureStarted");
      else
        -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStopped](self, "_serverBLENeedsAWDLScannerEnsureStopped");
      if (v3)
        v6 = -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted](self, "_serverBonjourAWDLAdvertiserEnsureStarted");
      else
        v6 = -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStopped](self, "_serverBonjourAWDLAdvertiserEnsureStopped");
      DeviceClass = GestaltGetDeviceClass(v6, v7);
      if ((_DWORD)DeviceClass == 1 || (v11 = (id)GestaltGetDeviceClass(DeviceClass, v9), (_DWORD)v11 == 3))
      {
        v11 = (id)objc_opt_class(AVCaptureDevice, v9, v10);
        if (v11)
          v11 = -[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest](self, "_registerForCameraCapabilitiesRequest");
      }
      if (!self->_serverIncomingMessageCLinkClient)
        v11 = -[RPRemoteDisplayDaemon _serverRegisterForIncomingMessages](self, "_serverRegisterForIncomingMessages");
      if (GestaltGetDeviceClass(v11, v9) == 1 && !self->_authenticationManager)
      {
        v12 = (SFAuthenticationManager *)objc_msgSend(objc_alloc(off_100131AA0()), "initWithQueue:", self->_dispatchQueue);
        authenticationManager = self->_authenticationManager;
        self->_authenticationManager = v12;

        -[RPRemoteDisplayDaemon _startObservingOnenessEnabledState](self, "_startObservingOnenessEnabledState");
      }
      return;
    }
    v4 = -[CUSystemMonitor netFlags](self->_systemMonitor, "netFlags");
    v5 = -[RPRemoteDisplayDaemon _serverBonjourAWDLNeeded](self, "_serverBonjourAWDLNeeded");
    v3 = v5;
    if ((v4 & 1) != 0 || (v5 & 1) != 0)
    {
      -[RPRemoteDisplayDaemon _serverTCPEnsureStarted](self, "_serverTCPEnsureStarted");
      if ((v4 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      -[RPRemoteDisplayDaemon _serverTCPEnsureStopped](self, "_serverTCPEnsureStopped");
    }
    -[RPRemoteDisplayDaemon _serverBonjourEnsureStopped](self, "_serverBonjourEnsureStopped");
    goto LABEL_15;
  }
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverEnsureStarted]", 30, "Deferring server start until FirstUnlock\n");
}

- (void)_serverEnsureStopped
{
  RPCompanionLinkClient *clinkClient;
  RPCompanionLinkClient *v4;
  void *v5;
  NSDictionary *cameraCapabilities;
  RPCompanionLinkClient *serverIncomingMessageCLinkClient;
  RPCompanionLinkClient *v8;
  OS_dispatch_source *needsAWDLRequestTimer;
  OS_dispatch_source *v10;
  NSObject *v11;

  -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStopped](self, "_serverBLENeedsAWDLScannerEnsureStopped");
  -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStopped](self, "_serverBonjourAWDLAdvertiserEnsureStopped");
  -[RPRemoteDisplayDaemon _serverBonjourEnsureStopped](self, "_serverBonjourEnsureStopped");
  -[RPRemoteDisplayDaemon _serverTCPEnsureStopped](self, "_serverTCPEnsureStopped");
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    -[RPCompanionLinkClient invalidate](clinkClient, "invalidate");
    v4 = self->_clinkClient;
    self->_clinkClient = 0;

  }
  if (self->_cameraCapabilityNotificationRegistered)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification, 0);
    self->_cameraCapabilityNotificationRegistered = 0;

  }
  cameraCapabilities = self->_cameraCapabilities;
  self->_cameraCapabilities = 0;

  serverIncomingMessageCLinkClient = self->_serverIncomingMessageCLinkClient;
  if (serverIncomingMessageCLinkClient)
  {
    -[RPCompanionLinkClient invalidate](serverIncomingMessageCLinkClient, "invalidate");
    v8 = self->_serverIncomingMessageCLinkClient;
    self->_serverIncomingMessageCLinkClient = 0;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      v11 = needsAWDLRequestTimer;
      dispatch_source_cancel(v11);
      v10 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;

    }
  }
}

- (void)_serverBLEDiscoveryEnsureStarted
{
  if (!self->_bleDiscovery)
  {
    -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:](self, "_bleDiscoveryEnsureStarted:", 1);
    self->_serverBLEDiscoveryStarted = 1;
    -[RPRemoteDisplayDaemon _bleDiscoveryTriggerEnhancedDiscovery:useCase:](self, "_bleDiscoveryTriggerEnhancedDiscovery:useCase:", CFSTR("StartWombatStream"), 131087);
  }
}

- (void)_serverBLEDiscoveryEnsureStopped
{
  if (self->_serverBLEDiscoveryStarted)
    -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStopped](self, "_bleDiscoveryEnsureStopped");
}

- (BOOL)_serverBLEDiscoveryShouldStart
{
  uint64_t DeviceClass;
  uint64_t v4;
  void *v5;
  BOOL v6;

  DeviceClass = GestaltGetDeviceClass(self, a2);
  if ((_DWORD)DeviceClass != 1 && GestaltGetDeviceClass(DeviceClass, v4) != 3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (void)_serverBLENeedsAWDLScannerEnsureStarted
{
  _BOOL8 v3;
  unsigned int bleNeedsAWDLScannerID;
  SFDeviceDiscovery *v5;
  SFDeviceDiscovery *bleNeedsAWDLScanner;
  id v7;
  uint64_t v8;
  uint64_t v9;
  SFDeviceDiscovery *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  unsigned int v13;
  _QWORD v14[5];
  unsigned int v15;
  _QWORD v16[5];
  unsigned int v17;

  if (self->_bleNeedsAWDLScanner)
  {
    v3 = -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerScreenOff](self, "_serverBLENeedsAWDLScannerScreenOff");
    if (v3 != -[SFDeviceDiscovery overrideScreenOff](self->_bleNeedsAWDLScanner, "overrideScreenOff"))
      -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleNeedsAWDLScanner, "setOverrideScreenOff:", v3);
  }
  else
  {
    bleNeedsAWDLScannerID = self->_bleNeedsAWDLScannerID;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStarted]", 30, "BLE NeedsAWDL scanner start ID %u\n", bleNeedsAWDLScannerID);
    }
    v5 = (SFDeviceDiscovery *)objc_alloc_init((Class)off_100131A88[0]());
    bleNeedsAWDLScanner = self->_bleNeedsAWDLScanner;
    self->_bleNeedsAWDLScanner = v5;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleNeedsAWDLScanner, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleNeedsAWDLScanner, "setDiscoveryFlags:", 131136);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleNeedsAWDLScanner, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleNeedsAWDLScanner, "setOverrideScreenOff:", -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerScreenOff](self, "_serverBLENeedsAWDLScannerScreenOff"));
    v7 = -[SFDeviceDiscovery setPurpose:](self->_bleNeedsAWDLScanner, "setPurpose:", CFSTR("RDLink"));
    if (GestaltGetDeviceClass(v7, v8) == 4)
      v9 = -75;
    else
      v9 = -60;
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleNeedsAWDLScanner, "setRssiThreshold:", v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10009FA2C;
    v16[3] = &unk_1001117E8;
    v16[4] = self;
    v17 = bleNeedsAWDLScannerID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleNeedsAWDLScanner, "setDeviceFoundHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009FA50;
    v14[3] = &unk_1001117E8;
    v14[4] = self;
    v15 = bleNeedsAWDLScannerID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleNeedsAWDLScanner, "setDeviceLostHandler:", v14);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009FA74;
    v12[3] = &unk_100111810;
    v12[4] = self;
    v13 = bleNeedsAWDLScannerID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleNeedsAWDLScanner, "setDeviceChangedHandler:", v12);
    v10 = self->_bleNeedsAWDLScanner;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009FA98;
    v11[3] = &unk_100111860;
    v11[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v10, "activateWithCompletion:", v11);
  }
}

- (void)_serverBLENeedsAWDLScannerEnsureStopped
{
  SFDeviceDiscovery *bleNeedsAWDLScanner;
  NSMutableDictionary *needsAWDLDevices;

  if (self->_bleNeedsAWDLScanner)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStopped]", 30, "BLE NeedsAWDL scanner stop ID %u\n", self->_bleNeedsAWDLScannerID);
    }
    -[SFDeviceDiscovery invalidate](self->_bleNeedsAWDLScanner, "invalidate");
    bleNeedsAWDLScanner = self->_bleNeedsAWDLScanner;
    self->_bleNeedsAWDLScanner = 0;

    ++self->_bleNeedsAWDLScannerID;
    -[NSMutableDictionary removeAllObjects](self->_needsAWDLDevices, "removeAllObjects");
    needsAWDLDevices = self->_needsAWDLDevices;
    self->_needsAWDLDevices = 0;

  }
}

- (BOOL)_serverBLENeedsAWDLScannerScreenOff
{
  return (GestaltGetDeviceClass(self, a2) & 0xFFFFFFFD) == 1;
}

- (void)_serverBLENeedsAWDLScannerDeviceFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *needsAWDLDevices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsIdentifier"));
  if (v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString")),
        v5,
        v4))
  {
    if (((unsigned __int16)objc_msgSend(v10, "deviceFlags") & 0xC008) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_needsAWDLDevices, "objectForKeyedSubscript:", v4));
      if (objc_msgSend(v10, "deviceActionType") == 50)
      {
        needsAWDLDevices = self->_needsAWDLDevices;
        if (!needsAWDLDevices)
        {
          v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v9 = self->_needsAWDLDevices;
          self->_needsAWDLDevices = v8;

          needsAWDLDevices = self->_needsAWDLDevices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](needsAWDLDevices, "setObject:forKeyedSubscript:", v10, v4);
        if (v6)
        {
          if (dword_100131A18 <= 30
            && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
          {
            LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]", 30, "NeedsAWDL device changed: %@\n", v10);
          }
        }
        else if (dword_100131A18 <= 30
               && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]", 30, "NeedsAWDL device found: %@\n", v10);
        }
      }
      else if (v6)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_needsAWDLDevices, "setObject:forKeyedSubscript:", 0, v4);
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]", 30, "NeedsAWDL device removed: %@\n", v6);
        }
      }
      -[RPRemoteDisplayDaemon _update](self, "_update");

    }
    else if (dword_100131A18 <= 20
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]", 20, "### Ignoring NeedsAWDL device that does not have expected status flags: %@\n", v10);
    }
  }
  else
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]", 30, "Ignoring NeedsAWDL device found, empty identifier: %@\n", v10);
    }
    v4 = 0;
  }

}

- (void)_serverBLENeedsAWDLScannerDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsIdentifier"));
  if (v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString")),
        v5,
        v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_needsAWDLDevices, "objectForKeyedSubscript:", v4));
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_needsAWDLDevices, "setObject:forKeyedSubscript:", 0, v4);
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceLost:]", 30, "NeedsAWDL device removed: %@\n", v6);
      }
      -[RPRemoteDisplayDaemon _update](self, "_update");
    }

  }
  else if (dword_100131A18 <= 30
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceLost:]", 30, "Ignoring NeedsAWDL lost, empty identifier: %@\n", v7);
  }

}

- (BOOL)_serverBLENearbyActionV2DiscoveryShouldRun
{
  void *v3;
  id v4;
  uint64_t v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v4 = objc_msgSend(v3, "idsIsSignedIn");
  v6 = (_DWORD)v4
    && self->_prefNearbyActionV2
    && ((GestaltGetDeviceClass(v4, v5) & 0xFFFFFFFD) == 1 || objc_msgSend(v3, "idsHasMac"));

  return v6;
}

- (void)_serverBLENearbyActionV2DiscoveryEnsureStarted
{
  RPNearbyActionV2Discovery *v3;
  RPNearbyActionV2Discovery *bleNearbyActionV2Discovery;
  uint64_t wombatState;
  RPNearbyActionV2Discovery *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_bleNearbyActionV2Discovery)
  {
    v3 = objc_alloc_init(RPNearbyActionV2Discovery);
    bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = v3;

    -[RPNearbyActionV2Discovery setDiscoveryFlags:](self->_bleNearbyActionV2Discovery, "setDiscoveryFlags:", 33554688);
    -[RPNearbyActionV2Discovery setDispatchQueue:](self->_bleNearbyActionV2Discovery, "setDispatchQueue:", self->_dispatchQueue);
    wombatState = self->_wombatState;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A01E8;
    v9[3] = &unk_100114868;
    v9[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:](self, "_bluetoothUseCaseFromWombatState:resultBlock:", wombatState, v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A0268;
    v8[3] = &unk_1001110F8;
    v8[4] = self;
    -[RPNearbyActionV2Discovery setUpdateHandler:](self->_bleNearbyActionV2Discovery, "setUpdateHandler:", v8);
    v6 = self->_bleNearbyActionV2Discovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A0294;
    v7[3] = &unk_100111860;
    v7[4] = self;
    -[RPNearbyActionV2Discovery activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

- (void)_serverBLENearbyActionV2DiscoveryEnsureStopped
{
  RPNearbyActionV2Discovery *bleNearbyActionV2Discovery;
  RPNearbyActionV2Discovery *v4;

  bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
  if (bleNearbyActionV2Discovery)
  {
    -[RPNearbyActionV2Discovery invalidate](bleNearbyActionV2Discovery, "invalidate");
    v4 = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = 0;

    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStopped]", 30, "BLE NearbyActionV2 discovery stopped\n");
    }
  }
}

- (void)_serverBonjourEnsureStarted
{
  id v3;
  id v4;
  const char *v5;
  CUBonjourAdvertiser *v6;
  CUBonjourAdvertiser *bonjourAdvertiser;

  if (self->_bonjourAdvertiser)
  {
    -[RPRemoteDisplayDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
    return;
  }
  if (!self->_btAdvAddrData)
  {
    if (dword_100131A18 > 20 || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 20))
      return;
    v5 = "Deferring Bonjour advertise without BT addr\n";
LABEL_14:
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourEnsureStarted]", 20, v5);
    return;
  }
  v3 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
  if ((int)v3 <= 0)
  {
    if (dword_100131A18 > 20 || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 20))
      return;
    v5 = "Deferring Bonjour advertise without TCP listening port\n";
    goto LABEL_14;
  }
  v4 = v3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourEnsureStarted]", 30, "Bonjour advertiser start\n");
  v6 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = v6;

  -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourAdvertiser setDomain:](self->_bonjourAdvertiser, "setDomain:", CFSTR("local."));
  -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:", CFSTR("RDLink"));
  -[CUBonjourAdvertiser setPort:](self->_bonjourAdvertiser, "setPort:", v4);
  -[CUBonjourAdvertiser setServiceType:](self->_bonjourAdvertiser, "setServiceType:", CFSTR("_rdlink._tcp"));
  -[CUBonjourAdvertiser setInterfaceIndex:](self->_bonjourAdvertiser, "setInterfaceIndex:", -[RPRemoteDisplayDaemon _serverDirectLinkInterfaceIndex](self, "_serverDirectLinkInterfaceIndex"));
  -[RPRemoteDisplayDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
  -[CUBonjourAdvertiser activate](self->_bonjourAdvertiser, "activate");
}

- (void)_serverBonjourEnsureStopped
{
  CUBonjourAdvertiser *bonjourAdvertiser;

  if (self->_bonjourAdvertiser)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourEnsureStopped]", 30, "Bonjour advertiser stop\n");
    }
    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = 0;

  }
}

- (id)_serverBonjourAuthTagString
{
  NSString *v3;
  NSString *deviceAuthTagStr;

  if (!self->_deviceAuthTagStr)
  {
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _serverBonjourAuthTagStringWithData:](self, "_serverBonjourAuthTagStringWithData:", self->_btAdvAddrData));
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = v3;

    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourAuthTagString]", 30, "AuthTagDevice updated: <%@>\n", self->_deviceAuthTagStr);
    }
  }
  return self->_deviceAuthTagStr;
}

- (id)_serverBonjourAuthTagStringWithData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identityOfSelfAndReturnError:", 0));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "authTagForData:type:error:", v4, 1, 0));
      v8 = v7;
      if (v7)
      {
        v9 = objc_retainAutorelease(v7);
        v10 = NSPrintF("%.3H", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), objc_msgSend(v9, "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_serverBonjourUpdateTXT
{
  void *v3;
  NSString *btAdvAddrStr;
  id v5;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  -[RPRemoteDisplayDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _serverBonjourAuthTagString](self, "_serverBonjourAuthTagString"));
  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("rpAD"));

  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", btAdvAddrStr, CFSTR("rpBA"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("rpVr"));
  -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAdvertiser, "setTxtDictionary:", v5);

}

- (void)_serverBonjourAWDLAdvertiserEnsureStarted
{
  NSData *v3;
  id v4;
  id v5;
  void *v6;
  CUBonjourAdvertiser *v7;
  CUBonjourAdvertiser *bonjourAWDLAdvertiser;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;

  if (self->_bonjourAWDLAdvertiser)
  {
    -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
  }
  else
  {
    v3 = self->_btAdvAddrData;
    if (v3)
    {
      v4 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
      if ((int)v4 <= 0)
      {
        if (dword_100131A18 <= 20
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]", 20, "Deferring Bonjour AWDL advertise without TCP listening port\n");
        }
      }
      else
      {
        v5 = v4;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
        objc_msgSend(v6, "activateForClient:", CFSTR("Sidecar"));

        v7 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
        self->_bonjourAWDLAdvertiser = v7;

        -[CUBonjourAdvertiser setAdvertiseFlags:](self->_bonjourAWDLAdvertiser, "setAdvertiseFlags:", 2048);
        -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAWDLAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
        -[CUBonjourAdvertiser setDomain:](self->_bonjourAWDLAdvertiser, "setDomain:", CFSTR("local."));
        -[CUBonjourAdvertiser setInterfaceName:](self->_bonjourAWDLAdvertiser, "setInterfaceName:", CFSTR("awdl0"));
        -[CUBonjourAdvertiser setLabel:](self->_bonjourAWDLAdvertiser, "setLabel:", CFSTR("RDLink"));
        v9 = NSPrintF("RDLink-%@", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[CUBonjourAdvertiser setName:](self->_bonjourAWDLAdvertiser, "setName:", v10);

        -[CUBonjourAdvertiser setPort:](self->_bonjourAWDLAdvertiser, "setPort:", v5);
        -[CUBonjourAdvertiser setServiceType:](self->_bonjourAWDLAdvertiser, "setServiceType:", CFSTR("_rdlink._tcp"));
        -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          v11 = CUDescriptionWithLevel(self->_bonjourAWDLAdvertiser, 30);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]", 30, "Bonjour AWDL advertiser start: %@\n", v12);

        }
        v13 = sub_10009AF98();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        v15 = sub_10009AF98();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = os_signpost_id_make_with_pointer(v16, self);

        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          v18 = CUDescriptionWithLevel(self->_bonjourAWDLAdvertiser, 30);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          *(_DWORD *)buf = 138412290;
          v21 = v19;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, v17, "Bonjour AWDL advertiser start", "Bonjour AWDL advertiser start: %@\n", buf, 0xCu);

        }
        -[CUBonjourAdvertiser activate](self->_bonjourAWDLAdvertiser, "activate");
      }
    }
    else if (dword_100131A18 <= 20
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]", 20, "Deferring Bonjour AWDL advertise without BT addr\n");
    }

  }
}

- (void)_serverBonjourAWDLAdvertiserEnsureStopped
{
  CUBonjourAdvertiser *bonjourAWDLAdvertiser;
  uint64_t v4;
  void *v5;
  int v6;
  CUBonjourAdvertiser *v7;
  void *v8;
  NSData *deviceAWDLRandomID;

  bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
  if (bonjourAWDLAdvertiser)
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 != -1
        || (v6 = _LogCategory_Initialize(&dword_100131A18, 30),
            bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser,
            v6))
      {
        v4 = CUDescriptionWithLevel(bonjourAWDLAdvertiser, 30);
        v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStopped]", 30, "Bonjour AWDL advertiser stop: %@\n", v5);

        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
      }
    }
    -[CUBonjourAdvertiser invalidate](bonjourAWDLAdvertiser, "invalidate");
    v7 = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = 0;

    if (!self->_bonjourBrowserAWDL)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](RPWiFiP2PTransaction, "sharedInstance"));
      objc_msgSend(v8, "invalidateForClient:", CFSTR("Sidecar"));

    }
    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;

  }
}

- (void)_serverBonjourAWDLAdvertiserUpdateTXT
{
  uint64_t v3;
  NSData *v4;
  NSData *deviceAWDLRandomID;
  NSData *v6;
  NSData *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *awdlPairingID;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (self->_deviceAWDLRandomID
    || (v3 = NSRandomData(6, 0),
        v4 = (NSData *)objc_claimAutoreleasedReturnValue(v3),
        deviceAWDLRandomID = self->_deviceAWDLRandomID,
        self->_deviceAWDLRandomID = v4,
        deviceAWDLRandomID,
        (id)-[NSData length](self->_deviceAWDLRandomID, "length") == (id)6))
  {
    v15 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = self->_deviceAWDLRandomID;
    v7 = v6;
    if (v6)
    {
      v8 = NSPrintF("%.6a", COERCE_DOUBLE((id)-[NSData bytes](objc_retainAutorelease(v6), "bytes")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (v9)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("rpBA"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _serverBonjourAuthTagStringWithData:](self, "_serverBonjourAuthTagStringWithData:", self->_deviceAWDLRandomID));
      if (v10)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("rpAD"));
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserUpdateTXT]", 30, "Using Bluetooth Identifier %@ and AuthTag %@ for AWDL Bonjour advertisement\n", v9, v10);
      }
      awdlPairingID = self->_awdlPairingID;
      if (awdlPairingID)
      {
        objc_msgSend(v15, "setObject:forKeyedSubscript:", awdlPairingID, CFSTR("rpPI"));
        v12 = 526336;
      }
      else
      {
        v12 = 2048;
      }
      v13 = NSPrintF("0x%llX", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("rpFl"));

      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("rpVr"));
      -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAWDLAdvertiser, "setTxtDictionary:", v15);

    }
  }
}

- (BOOL)_serverBonjourAWDLNeeded
{
  BOOL v3;
  void *v4;
  BOOL v5;
  NSMutableDictionary *tcpServerConnections;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[NSMutableDictionary count](self->_needsAWDLDevices, "count"))
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
    v3 = objc_msgSend(v4, "count") || self->_bonjourAWDLAdvertiserForce || self->_awdlPairingID != 0;

  }
  v12 = v3;
  if (*((_BYTE *)v10 + 24) || -[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
  {
    v5 = 1;
  }
  else
  {
    tcpServerConnections = self->_tcpServerConnections;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A0FB0;
    v8[3] = &unk_100114890;
    v8[4] = &v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v8);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)_serverTCPEnsureStarted
{
  CUTCPServer *v3;
  CUTCPServer *tcpServer;
  unsigned int v5;
  CUTCPServer *v6;
  CUTCPServer *v7;
  id v8;
  CUTCPServer *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  __int16 v13;
  uint64_t v14;
  _BYTE v15[14];
  unsigned int v16;

  if (!self->_tcpServer)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverTCPEnsureStarted]", 30, "TCP server start\n");
    }
    v3 = (CUTCPServer *)objc_alloc_init((Class)CUTCPServer);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v3;

    -[CUTCPServer setDispatchQueue:](self->_tcpServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPServer setFlags:](self->_tcpServer, "setFlags:", 9);
    -[CUTCPServer setLabel:](self->_tcpServer, "setLabel:", CFSTR("RDLink"));
    -[CUTCPServer setMaxConnectionCount:](self->_tcpServer, "setMaxConnectionCount:", 8);
    if (self->_awdlPairingID)
    {
      memset(v15, 0, sizeof(v15));
      v14 = 0;
      v5 = if_nametoindex("awdl0");
      -[CUTCPServer setMaxConnectionCount:](self->_tcpServer, "setMaxConnectionCount:", 1);
      v6 = self->_tcpServer;
      v13 = 7708;
      v16 = v5;
      -[CUTCPServer setInterfaceAddress:](v6, "setInterfaceAddress:", &v13);
    }
    -[CUTCPServer setConnectionPrepareHandler:](self->_tcpServer, "setConnectionPrepareHandler:", &stru_1001148B0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A1220;
    v12[3] = &unk_100111B40;
    v12[4] = self;
    -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A1238;
    v11[3] = &unk_1001148D8;
    v11[4] = self;
    -[CUTCPServer setConnectionEndedHandler:](self->_tcpServer, "setConnectionEndedHandler:", v11);
    v7 = self->_tcpServer;
    v10 = 0;
    -[CUTCPServer activateDirectAndReturnError:](v7, "activateDirectAndReturnError:", &v10);
    v8 = v10;
    if (v8)
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverTCPEnsureStarted]", 90, "### TCP server failed: %{error}\n", v8);
      }
      -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
      v9 = self->_tcpServer;
      self->_tcpServer = 0;

    }
  }
}

- (void)_serverTCPEnsureStopped
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  CUTCPServer *tcpServer;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_tcpServer)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverTCPEnsureStopped]", 30, "TCP server stop\n");
    }
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_bufferedConnections;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v9);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_bufferedConnections, "removeAllObjects");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", &stru_100114918);
    -[NSMutableDictionary removeAllObjects](self->_tcpServerConnections, "removeAllObjects");
    -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
    tcpServer = self->_tcpServer;
    self->_tcpServer = 0;

  }
}

- (void)_serverTCPHandleConnectionStarted:(id)a3
{
  uint64_t sessionIDLast;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSMutableSet *bufferedConnections;
  NSMutableSet *v13;
  NSMutableSet *v14;
  NSMutableDictionary *tcpServerConnections;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  _QWORD v18[6];
  _QWORD v19[7];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[7];

  sessionIDLast = self->_sessionIDLast;
  self->_sessionIDLast = sessionIDLast + 1;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sessionIDLast));
  v7 = objc_alloc_init((Class)RPConnection);
  objc_msgSend(v7, "setControlFlags:", 0x400000000240);
  objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v7, "setIdentityDaemon:", v8);

  objc_msgSend(v7, "setKeepAliveSeconds:", 10);
  v9 = objc_alloc((Class)NSString);
  v10 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v10;
  v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@Cnx-%u"), CFSTR("RDLink"), v10);
  objc_msgSend(v7, "setLabel:", v11);

  objc_msgSend(v7, "setLocalDeviceInfo:", self->_localDeviceInfo);
  objc_msgSend(v7, "setTcpConnection:", v5);

  -[RPRemoteDisplayDaemon _connectionConfigureCommon:](self, "_connectionConfigureCommon:", v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A1804;
  v22[3] = &unk_1001116C8;
  v22[4] = self;
  v22[5] = v6;
  v22[6] = v7;
  objc_msgSend(v7, "setInvalidationHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A185C;
  v21[3] = &unk_100111950;
  v21[4] = v7;
  v21[5] = v6;
  objc_msgSend(v7, "setReceivedEventHandler:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000A194C;
  v20[3] = &unk_100111978;
  v20[4] = v7;
  v20[5] = v6;
  objc_msgSend(v7, "setReceivedRequestHandler:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A1A50;
  v19[3] = &unk_100114940;
  v19[4] = self;
  v19[5] = v6;
  v19[6] = v7;
  objc_msgSend(v7, "setSessionStartHandler:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A1A80;
  v18[3] = &unk_1001119A0;
  v18[4] = v7;
  v18[5] = self;
  objc_msgSend(v7, "setStateChangedHandler:", v18);
  bufferedConnections = self->_bufferedConnections;
  if (!bufferedConnections)
  {
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v14 = self->_bufferedConnections;
    self->_bufferedConnections = v13;

    bufferedConnections = self->_bufferedConnections;
  }
  -[NSMutableSet addObject:](bufferedConnections, "addObject:", v7);
  tcpServerConnections = self->_tcpServerConnections;
  if (!tcpServerConnections)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v17 = self->_tcpServerConnections;
    self->_tcpServerConnections = v16;

    tcpServerConnections = self->_tcpServerConnections;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](tcpServerConnections, "setObject:forKeyedSubscript:", v7, v6);
  objc_msgSend(v7, "activate");

}

- (void)_serverHandleSessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *deviceConfirmedIdentifier;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD *v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  _QWORD *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[6];
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  _BYTE v78[128];

  v61 = a3;
  v7 = a4;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000A2328;
  v74[3] = &unk_100114968;
  v62 = a5;
  v77 = v62;
  v75 = 0;
  v8 = v7;
  v76 = v8;
  v64 = objc_retainBlock(v74);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceType"));
  LODWORD(a5) = v9 == 0;

  if ((_DWORD)a5)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]", 30, "Using service type %@ on incoming connection for backwards compatibility\n", CFSTR("_rdlink._tcp"));
    }
    objc_msgSend(v8, "setServiceType:", CFSTR("_rdlink._tcp"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDeviceInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
  v13 = GestaltProductTypeStringToDeviceClass(v12);

  if (v13 == 4 && objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.continuitycapture")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDeviceInfo"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "verifiedIdentity"));

    deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
    if (!deviceConfirmedIdentifier || !-[NSString isEqualToString:](deviceConfirmedIdentifier, "isEqualToString:", v15))
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]", 90, "### Discovery session device identifier '%@' did not match the peer IDS identifier '%@' on incoming connection.\n", self->_deviceConfirmedIdentifier, v15);
      }
      v57 = RPErrorF(4294960548, (uint64_t)"Device in discovery session did not match\n", v16, v17, v18, v19, v20, v21, v60);
      v56 = objc_claimAutoreleasedReturnValue(v57);
      goto LABEL_47;
    }

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_xpcMatchingServerMap, "allValues"));
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v15 = v23;
  v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v71;
LABEL_14:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v71 != v25)
        objc_enumerationMutation(v15);
      v27 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serviceType"));
      v29 = v28 == 0;

      if (!v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serviceType"));
        v31 = v10;
        v32 = v30;
        if (v31 == v32)
        {

LABEL_27:
          v41 = v27;

          if (!v41)
            goto LABEL_32;
          v48 = -[NSMutableSet count](self->_bufferedConnections, "count");
          if ((unint64_t)v48 >= 6)
          {
            if (dword_100131A18 <= 30
              && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
            {
              LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]", 30, "Rejecting incoming connection, too many buffered (%d)\n", (_DWORD)v48);
            }
            v58 = RPErrorF(4294960551, (uint64_t)"Rejecting incoming connection, too many buffered (%d)\n", v42, v43, v44, v45, v46, v47, (uint64_t)v48);
            v50 = (id)objc_claimAutoreleasedReturnValue(v58);
            goto LABEL_63;
          }
          v69 = 0;
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _acquireRBSAssertionForEntry:error:](self, "_acquireRBSAssertionForEntry:error:", v41, &v69));
          v50 = v69;
          if (!v50)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activatedServerXPCCnxMap, "objectForKeyedSubscript:", v31));
            v52 = v51;
            if (v51)
            {
              v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serverNetCnxs"));
              if (!v53)
              {
                v53 = objc_alloc_init((Class)NSMutableSet);
                objc_msgSend(v52, "setServerNetCnxs:", v53);
              }
              objc_msgSend(v53, "addObject:", v8);
              objc_msgSend(v8, "setClient:", v52);
              v65[0] = _NSConcreteStackBlock;
              v65[1] = 3221225472;
              v65[2] = sub_1000A2424;
              v65[3] = &unk_100113508;
              v54 = v65;
              v65[4] = v49;
              v66 = v62;
              objc_msgSend(v52, "sessionStartWithID:netCnx:completion:", v61, v8, v65);
              -[NSMutableSet removeObject:](self->_bufferedConnections, "removeObject:", v8);

LABEL_60:
            }
            else
            {
              if (dword_100131A18 <= 30)
              {
                if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
                  LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]", 30, "Buffering incoming connection for proxied server: %@\n", v8);
                if (dword_100131A18 <= 30
                  && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_activatedServerXPCCnxMap, "allKeys"));
                  LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]", 30, "Service types that are currently active: %@\n", v59);

                }
              }
              v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "handler"));
              if (v53)
              {
                v54 = v67;
                v67[0] = _NSConcreteStackBlock;
                v67[1] = 3221225472;
                v67[2] = sub_1000A2370;
                v67[3] = &unk_100114990;
                v67[4] = v41;
                v67[5] = self;
                v68 = v49;
                (*((void (**)(id, _QWORD, _QWORD, _QWORD *))v53 + 2))(v53, 0, 0, v67);

                goto LABEL_60;
              }
            }

          }
LABEL_63:

          goto LABEL_64;
        }
        v33 = v32;
        if ((v10 == 0) != (v32 != 0))
        {
          v34 = objc_msgSend(v31, "isEqual:", v32);

          if ((v34 & 1) != 0)
            goto LABEL_27;
        }
        else
        {

        }
      }
      if (v24 == (id)++v26)
      {
        v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        if (v24)
          goto LABEL_14;
        break;
      }
    }
  }

LABEL_32:
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]", 30, "Rejecting incoming connection when server not active for service type '%@'\n", v10);
  v55 = RPErrorF(4294960551, (uint64_t)"Rejecting incoming connection when server not active\n", v35, v36, v37, v38, v39, v40, v60);
  v56 = objc_claimAutoreleasedReturnValue(v55);
LABEL_47:
  v50 = (id)v56;
LABEL_64:

  ((void (*)(void))v64[2])();
}

- (void)_serverProximityGetDeviceIdentifiers
{
  void *v3;
  NSMutableDictionary *needsAWDLDevices;
  id v5;
  NSMutableDictionary *tcpServerConnections;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  needsAWDLDevices = self->_needsAWDLDevices;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A2554;
  v10[3] = &unk_1001145F0;
  v5 = v3;
  v11 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](needsAWDLDevices, "enumerateKeysAndObjectsUsingBlock:", v10);
  tcpServerConnections = self->_tcpServerConnections;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A25BC;
  v8[3] = &unk_1001149B8;
  v9 = v5;
  v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (unsigned)_serverDirectLinkInterfaceIndex
{
  unsigned int result;
  _QWORD *v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD *v8;

  v8 = 0;
  v7 = 0;
  if (!CreateUsableInterfaceList(0, 0, &v8))
  {
    v3 = v8;
    if (!v8)
      goto LABEL_16;
    while (1)
    {
      v6 = 0;
      v5 = 0;
      SocketGetInterfaceInfo(0xFFFFFFFFLL, v3[1], 0, &v7, 0, 0, 0, &v6, 0, &v5);
      v4 = v6;
      if ((v6 & 0x20000000) != 0)
        break;
      v7 = 0;
      v3 = (_QWORD *)*v3;
      if (!v3)
        goto LABEL_16;
    }
    if (dword_100131A18 > 30)
      goto LABEL_16;
    if (dword_100131A18 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131A18, 30))
        goto LABEL_16;
      v4 = v6;
    }
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverDirectLinkInterfaceIndex]", 30, "DirectLink interface %s found with flags 0x%x\n", (const char *)v3[1], v4);
LABEL_16:
    ReleaseUsableInterfaceList(v8);
    return v7;
  }
  if (dword_100131A18 > 30)
    return 0;
  if (dword_100131A18 != -1 || (result = _LogCategory_Initialize(&dword_100131A18, 30)) != 0)
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverDirectLinkInterfaceIndex]", 30, "### Failed to get Interface list to find DirectLink interface\n");
    return 0;
  }
  return result;
}

- (void)_serverRegisterForIncomingMessages
{
  id v3;
  RPCompanionLinkClient *serverIncomingMessageCLinkClient;
  id v5;
  _QWORD v6[6];

  if (!self->_serverIncomingMessageCLinkClient)
  {
    v3 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
    serverIncomingMessageCLinkClient = self->_serverIncomingMessageCLinkClient;
    self->_serverIncomingMessageCLinkClient = (RPCompanionLinkClient *)v3;
    v5 = v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A280C;
    v6[3] = &unk_1001121C0;
    v6[4] = v5;
    v6[5] = self;
    objc_msgSend(v5, "activateWithCompletion:", v6);

  }
}

- (void)_serverReceivedNeedsAWDLEvent:(id)a3
{
  id v4;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v7;
  uint64_t NSNumber;
  void *v9;
  unsigned int v10;
  const char *v11;
  NSMutableSet *needsAWDLRequestIdentifiers;
  NSMutableSet *v13;
  NSMutableSet *v14;
  OS_dispatch_source *v15;
  OS_dispatch_source *needsAWDLRequestTimer;
  NSObject *v17;
  NSMutableSet *v18;
  OS_dispatch_source *v19;
  OS_dispatch_source *v20;
  _QWORD handler[5];

  v4 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("_i"), TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v7)
  {
    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("_ena"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v10 = objc_msgSend(v9, "BOOLValue");

    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v11 = "disable";
      if (v10)
        v11 = "enable";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverReceivedNeedsAWDLEvent:]", 30, "Received NeedsAWDL %s event from peer %@\n", v11, v7);
    }
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    if (v10)
    {
      if (!needsAWDLRequestIdentifiers)
      {
        v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v14 = self->_needsAWDLRequestIdentifiers;
        self->_needsAWDLRequestIdentifiers = v13;

        needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
      }
      -[NSMutableSet addObject:](needsAWDLRequestIdentifiers, "addObject:", v7);
      if (self->_needsAWDLRequestTimer)
        goto LABEL_20;
      v15 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = v15;
      v17 = v15;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000A2BAC;
      handler[3] = &unk_1001110F8;
      handler[4] = self;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet(v17, 15.0, -1.0, 1.0);
      dispatch_activate(v17);
    }
    else
    {
      -[NSMutableSet removeObject:](needsAWDLRequestIdentifiers, "removeObject:", v7);
      if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
        goto LABEL_20;
      v18 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = 0;

      v19 = self->_needsAWDLRequestTimer;
      if (!v19)
        goto LABEL_20;
      v17 = v19;
      dispatch_source_cancel(v17);
      v20 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;

    }
LABEL_20:
    -[RPRemoteDisplayDaemon _update](self, "_update");
    goto LABEL_21;
  }
  if (dword_100131A18 <= 90 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverReceivedNeedsAWDLEvent:]", 90, "Ignoring received NeedsAWDL event as it does not have peer identifier\n");
LABEL_21:

}

- (void)_btAddressMonitorEnsureStarted
{
  CUSystemMonitor *v3;
  CUSystemMonitor *btAdvAddrMonitor;
  CUSystemMonitor *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_btAdvAddrMonitor)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _btAddressMonitorEnsureStarted]", 30, "Bluetooth address monitor start\n");
    }
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_btAdvAddrMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A2D80;
    v7[3] = &unk_1001110F8;
    v7[4] = self;
    -[CUSystemMonitor setRotatingIdentifierChangedHandler:](self->_btAdvAddrMonitor, "setRotatingIdentifierChangedHandler:", v7);
    v5 = self->_btAdvAddrMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A2D88;
    v6[3] = &unk_1001110F8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }
}

- (void)_btAddressMonitorEnsureStopped
{
  CUSystemMonitor *btAdvAddrMonitor;

  if (self->_btAdvAddrMonitor)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _btAddressMonitorEnsureStopped]", 30, "Bluetooth address monitor stop\n");
    }
    -[CUSystemMonitor invalidate](self->_btAdvAddrMonitor, "invalidate");
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = 0;

  }
}

- (void)_btAddressChanged
{
  uint64_t v3;
  NSString *v4;
  NSString *btAdvAddrStr;
  NSString *deviceAuthTagStr;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor rotatingIdentifierData](self->_btAdvAddrMonitor, "rotatingIdentifierData"));
  if (objc_msgSend(obj, "length") == (id)6
    && (-[NSData isEqual:](self->_btAdvAddrData, "isEqual:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_btAdvAddrData, obj);
    v3 = NSPrintF("%.6a", COERCE_DOUBLE(objc_msgSend(objc_retainAutorelease(obj), "bytes")));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(v3);
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v4;

    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _btAddressChanged]", 30, "Bluetooth address changed: %@\n", self->_btAdvAddrStr);
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;

    -[RPRemoteDisplayDaemon _update](self, "_update");
  }

}

- (BOOL)_deviceSupportsLaguna:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v5 = GestaltProductTypeStringToDeviceClass(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (v9)
    objc_msgSend(v9, "operatingSystemVersion");
  if ((v5 & 0xFFFFFFFD) == 1)
  {
    if (v5 == 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
      if ((int)sub_1000174BC(v10) > 7)
      {
        v12 = 1;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
        v12 = (int)sub_100017564(v11) > 12;

      }
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_findMatchingDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "compareWithDeviceIdentifier:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  if (!_os_feature_enabled_impl("Sharing", "DedicatedLaguna"))
    return (RPRemoteDisplayDevice *)0;
  v2 = objc_alloc_init((Class)CUKeychainItem);
  objc_msgSend(v2, "setAccessGroup:", CFSTR("com.apple.rapport"));
  objc_msgSend(v2, "setSyncType:", 1);
  objc_msgSend(v2, "setType:", CFSTR("RPIdentity-PairedDevice"));
  objc_msgSend(v2, "setIdentifier:", CFSTR("RPRemoteDisplayDevice-Dedicated"));
  v3 = objc_alloc_init((Class)CUKeychainManager);
  v11 = 0;
  v4 = objc_msgSend(v3, "copyItemMatchingItem:flags:error:", v2, 0, &v11);
  v5 = v11;
  v6 = v5;
  if (!v4)
  {
    if (objc_msgSend(v5, "code") != (id)-25300
      && dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon dedicatedDevice]", 90, "### DedicatedDevice find failed: %{error}\n", v6);
    }
    goto LABEL_16;
  }
  v7 = objc_alloc((Class)RPRemoteDisplayDevice);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
  v9 = objc_msgSend(v7, "initWithKeychainDictionaryRepresentation:", v8);

  if (!v9)
  {
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon dedicatedDevice]", 90, "### DedicatedDevice deserialization failed\n");
    }
LABEL_16:
    v9 = 0;
  }

  return (RPRemoteDisplayDevice *)v9;
}

- (void)saveDedicatedDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSMutableSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  _BYTE v37[128];

  v4 = a3;
  if (_os_feature_enabled_impl("Sharing", "DedicatedLaguna"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
    v6 = v5;
    if (v5 == v4 || (objc_msgSend(v5, "isEqualToDevice:", v4) & 1) != 0)
    {
LABEL_40:

      goto LABEL_41;
    }
    v7 = objc_alloc_init((Class)CUKeychainManager);
    v8 = objc_alloc_init((Class)CUKeychainItem);
    objc_msgSend(v8, "setAccessGroup:", CFSTR("com.apple.rapport"));
    v29 = v7;
    v30 = v6;
    if (v4)
    {
      objc_msgSend(v8, "setAccessibleType:", 7);
      objc_msgSend(v8, "setInvisible:", 1);
      objc_msgSend(v8, "setSyncType:", 1);
      objc_msgSend(v8, "setType:", CFSTR("RPIdentity-PairedDevice"));
      objc_msgSend(v8, "setIdentifier:", CFSTR("RPRemoteDisplayDevice-Dedicated"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keychainDictionaryRepresentation"));
      objc_msgSend(v8, "setMetadata:", v9);

      v36 = 0;
      objc_msgSend(v7, "addOrUpdateOrReAddItem:logCategory:logLabel:error:", v8, &dword_100131A18, CFSTR("DedicatedDevice"), &v36);
      v10 = v36;
      if (v10)
      {
        if (dword_100131A18 > 90
          || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 90))
        {
          goto LABEL_22;
        }
        v27 = v8;
        v28 = v10;
        v11 = "### DedicatedDevice save failed: %@, %{error}\n";
        goto LABEL_13;
      }
      if (dword_100131A18 > 30
        || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 30))
      {
        goto LABEL_22;
      }
      v11 = "DedicatedDevice saved\n";
    }
    else
    {
      objc_msgSend(v8, "setSyncType:", 1);
      objc_msgSend(v8, "setType:", CFSTR("RPIdentity-PairedDevice"));
      objc_msgSend(v8, "setIdentifier:", CFSTR("RPRemoteDisplayDevice-Dedicated"));
      v35 = 0;
      objc_msgSend(v7, "removeItemMatchingItem:error:", v8, &v35);
      v10 = v35;
      if (v10)
      {
        if (dword_100131A18 > 90
          || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 90))
        {
          goto LABEL_22;
        }
        v27 = v8;
        v28 = v10;
        v11 = "### DedicatedDevice remove failed: %@, %{error}\n";
LABEL_13:
        v12 = 90;
LABEL_21:
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon saveDedicatedDevice:]", v12, v11, v27, v28);
LABEL_22:

        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon saveDedicatedDevice:]", 30, "Notifying update for dedicatedDevice: %@ \n", v4);
        }
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v13 = self->_xpcConnections;
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activatedDiscovery"));

              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "xpcCnx"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForEntitlement:", CFSTR("com.apple.RemoteDisplay.Dedicated")));

                if (v21)
                {
                  v24 = objc_opt_class(NSNumber, v22, v23);
                  if ((objc_opt_isKindOfClass(v21, v24) & 1) != 0)
                  {
                    if (objc_msgSend(v21, "BOOLValue"))
                    {
                      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "xpcCnx"));
                      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "remoteObjectProxy"));
                      objc_msgSend(v26, "remoteDisplayDedicatedDeviceChanged:", v4);

                    }
                  }
                }

              }
            }
            v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v15);
        }

        v6 = v30;
        goto LABEL_40;
      }
      if (dword_100131A18 > 30
        || dword_100131A18 == -1 && !_LogCategory_Initialize(&dword_100131A18, 30))
      {
        goto LABEL_22;
      }
      v11 = "DedicatedDevice removed\n";
    }
    v12 = 30;
    goto LABEL_21;
  }
LABEL_41:

}

- (void)_localDeviceUpdate
{
  unsigned int v3;
  RPCompanionLinkDevice *localDeviceInfo;
  RPCompanionLinkDevice *v5;
  RPCompanionLinkDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *btAdvAddrStr;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = -[RPCompanionLinkDevice changed](self->_localDeviceInfo, "changed");
  localDeviceInfo = self->_localDeviceInfo;
  if (!localDeviceInfo)
  {
    v5 = (RPCompanionLinkDevice *)objc_alloc_init((Class)RPCompanionLinkDevice);
    v6 = self->_localDeviceInfo;
    self->_localDeviceInfo = v5;

    -[RPCompanionLinkDevice setDaemon:](self->_localDeviceInfo, "setDaemon:", 1);
    -[RPCompanionLinkDevice setFlags:](self->_localDeviceInfo, "setFlags:", -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x48);
    localDeviceInfo = self->_localDeviceInfo;
  }
  v19 = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](localDeviceInfo, "identifier"));
  if (!v19)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDeviceIDSelf"));
    -[RPCompanionLinkDevice setIdentifier:](self->_localDeviceInfo, "setIdentifier:", v8);

    v3 = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));

  if (!v9)
  {
    v10 = (void *)GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
    -[RPCompanionLinkDevice setModel:](self->_localDeviceInfo, "setModel:", v10);

    v3 = 1;
  }
  btAdvAddrStr = self->_btAdvAddrStr;
  if (!btAdvAddrStr)
    goto LABEL_13;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice publicIdentifier](self->_localDeviceInfo, "publicIdentifier"));
  v13 = btAdvAddrStr;
  v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_13;
  }
  v15 = v14;
  if (v14)
  {
    v16 = -[NSString isEqual:](v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_16;
LABEL_13:
    if (!v3)
      goto LABEL_21;
    goto LABEL_17;
  }

LABEL_16:
  -[RPCompanionLinkDevice setPublicIdentifier:](self->_localDeviceInfo, "setPublicIdentifier:", self->_btAdvAddrStr);
LABEL_17:
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    v17 = CUDescriptionWithLevel(self->_localDeviceInfo, 50);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _localDeviceUpdate]", 30, "Local device changed: %@\n", v18, v19);

  }
LABEL_21:
  -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 0);

}

- (void)_startPairingServerWithPassword:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  NSString *v20;
  NSString *awdlPairingID;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  RPRemoteDisplayDaemon *v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_10000F9E8;
  v41 = sub_10000F980;
  v42 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000A3D34;
  v32[3] = &unk_1001149E0;
  v33 = 0;
  v34 = self;
  v36 = &v37;
  v8 = v7;
  v35 = v8;
  v9 = objc_retainBlock(v32);
  if (GestaltGetDeviceClass(v9, v10) == 4 || self->_prefAllowPairingServer)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startPairingServerWithPassword:completion:]", 30, "Starting pairing server over AWDL: \n");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
    awdlPairingID = self->_awdlPairingID;
    self->_awdlPairingID = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sessionPairingIdentifier"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v24, self->_awdlPairingID, v6, 0));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("_pubID"), CFSTR("_pi"), CFSTR("_pinC"), 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v25, v26));
    v31 = 0;
    v28 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v27, 4, &v31));
    v18 = v31;
    v29 = (void *)v38[5];
    v38[5] = v28;

    -[RPRemoteDisplayDaemon _update](self, "_update");
  }
  else
  {
    v17 = RPErrorF(4294960561, (uint64_t)"Platform does not support pairing\n", v11, v12, v13, v14, v15, v16, v30);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);
  }
  ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(&v37, 8);
}

- (void)_stopPairingServer
{
  NSString *awdlPairingID;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _stopPairingServer]", 30, "Stop pairing server over AWDL\n");
  awdlPairingID = self->_awdlPairingID;
  self->_awdlPairingID = 0;

  -[RPRemoteDisplayDaemon _update](self, "_update");
}

- (id)_acquireRBSAssertionForEntry:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  id v29;
  void *v30;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "angelJobLabel"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "angelAssertionName")),
        v8,
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "angelJobLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForAngelJobLabel:](RBSProcessIdentity, "identityForAngelJobLabel:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentity:](RBSTarget, "targetWithProcessIdentity:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "angelAssertionName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.rapportd"), v12));

    v14 = objc_alloc((Class)RBSAssertion);
    v30 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v16 = objc_msgSend(v14, "initWithExplanation:target:attributes:", CFSTR("Rapport remote display"), v11, v15);

    v29 = 0;
    v17 = objc_msgSend(v16, "acquireWithError:", &v29);
    v24 = v29;
    if ((v17 & 1) != 0)
    {
      v25 = v16;
    }
    else
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "angelJobLabel"));
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _acquireRBSAssertionForEntry:error:]", 90, "### Failed to acquire runningboard assertion for launch angel '%@' error (%@) \n");

      }
      v26 = RPErrorF(4294960582, (uint64_t)"Failed to acquire runningboard assertion for launch angel", v18, v19, v20, v21, v22, v23, (uint64_t)v28);
      v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v26);
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_scheduleCameraCapabilitiesRequest:(id)a3 interval:(unint64_t)prefCameraCapabilitiesRetrySeconds
{
  id v6;
  void *v7;
  dispatch_source_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  RPRemoteDisplayDaemon *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cameraCapabilitiesRefetchTimer"));

  if (!v7)
  {
    if (!prefCameraCapabilitiesRetrySeconds)
      prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
    v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_msgSend(v6, "setCameraCapabilitiesRefetchTimer:", v8);

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cameraCapabilitiesRefetchTimer"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000A41F4;
    v16 = &unk_100111928;
    v10 = v6;
    v17 = v10;
    v18 = self;
    dispatch_source_set_event_handler(v9, &v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cameraCapabilitiesRefetchTimer", v13, v14, v15, v16));
    CUDispatchTimerSet(v11, (double)prefCameraCapabilitiesRetrySeconds, -1.0, 0.5);

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cameraCapabilitiesRefetchTimer"));
    dispatch_activate(v12);

  }
}

- (void)_receivedCameraCapabilitiesMessage:(id)a3 fromDevice:(id)a4 isFirstUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v12;
  void *v13;
  void *v14;
  RPRemoteDisplayDaemon *v15;
  NSMutableSet *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  NSString *deviceSessionPaired;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  _BYTE v37[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v36 = 0;
  TypeID = CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("_cCap"), TypeID, &v36);
  v12 = objc_claimAutoreleasedReturnValue(TypedValue);
  v30 = v8;
  if (v12)
  {
    v13 = (void *)v12;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]", 30, "Received camera capabilities update from device %@\n", v14);
LABEL_8:

    }
  }
  else
  {
    if (dword_100131A18 <= 50
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 50)))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]", 50, "Received empty or nil camera capabilities update from device %@\n", v14);
      v13 = &__NSDictionary0__struct;
      goto LABEL_8;
    }
    v13 = &__NSDictionary0__struct;
  }
  v31 = v13;
  objc_msgSend(v9, "setCameraCapabilities:", v13);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = self;
  v16 = self->_xpcConnections;
  v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activatedDiscovery"));
        v23 = objc_msgSend(v22, "shouldReportDevice:", v9);

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "xpcCnx"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "remoteObjectProxy"));
          objc_msgSend(v25, "remoteDisplayChangedDevice:changes:", v9, 2);

        }
      }
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v18);
  }

  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    if (v5)
      v26 = "yes";
    else
      v26 = "no";
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]", 30, "inIsFirstUpdate: %s inDevice.identifier:%@ _devicePairedIdentifier:%@\n", v26, v27, v15->_deviceSessionPaired);

  }
  if (v5 && ((unint64_t)objc_msgSend(v9, "statusFlags") & 0x2000000000) != 0)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]", 30, "Discovery session state change after first update of camera capabilities for device: %@\n", v15->_deviceSessionPaired);
    }
    deviceSessionPaired = v15->_deviceSessionPaired;
    v15->_deviceSessionPaired = 0;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](v15, "_changeDiscoverySessionStateForDevice:startReason:", v29, 1);

  }
}

- (void)_receivedCameraExitEvent:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;

  v6 = a4;
  v14 = 0;
  v7 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("_cExitReson"), TypeID, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (objc_msgSend(v10, "length"))
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]", 30, "Received exit reason '%@' from device %@\n", v10, v6);
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("User disconnect")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceIdentifier"));
      v13 = objc_msgSend(v6, "isEqualToString:", v12);

      if (v13)
      {
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]", 30, "Received '%@' exit reason for dedicated device %@ -> clear dedicated device\n", v10, v6);
        }
        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self, "saveDedicatedDevice:", 0);
      }

    }
    if (objc_msgSend(v6, "isEqualToString:", self->_deviceConfirmedIdentifier))
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]", 30, "Exit active session for device %@\n", v6);
      }
      -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self, "_changeDiscoverySessionStateForDevice:startReason:", 0, 0);
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]", 90, "Received exit session event from non-active device %@\n", v6);
    }
  }
  else if (dword_100131A18 <= 50
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 50)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]", 50, "Received empty or nil exit reason from device %@\n", v6);
  }

}

- (void)_registerForIncomingMessages
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *clientIncomingMessageCLinkClient;
  RPCompanionLinkClient *v5;
  _QWORD v6[6];

  if (!self->_clientIncomingMessageCLinkClient)
  {
    v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    clientIncomingMessageCLinkClient = self->_clientIncomingMessageCLinkClient;
    self->_clientIncomingMessageCLinkClient = v3;
    v5 = v3;

    -[RPCompanionLinkClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A490C;
    v6[3] = &unk_1001121C0;
    v6[4] = v5;
    v6[5] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v5, "activateWithCompletion:", v6);

  }
}

- (void)_requestCameraCapabilitiesForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  int DeviceClass;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  RPRemoteDisplayDaemon *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  DeviceClass = GestaltGetDeviceClass(v4, v5);
  v7 = DeviceClass;
  if (DeviceClass == 100 || DeviceClass == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraCapabilities"));
    if (!v8 && !objc_msgSend(v4, "cameraCapabilityRequestIsActive"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraCapabilitiesRefetchTimer"));

      if (v9)
        goto LABEL_6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDeviceMap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));

        if (v12 || ((unint64_t)objc_msgSend(v4, "statusFlags") & 0x3000000000) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modelIdentifier"));
          v14 = v13;
          if (v13)
            v15 = v13;
          else
            v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
          v16 = v15;

          v27 = 0;
          v28 = 0;
          v29 = 0;
          if (v12)
            objc_msgSend(v12, "operatingSystemVersion");
          v17 = GestaltProductTypeStringToDeviceClass(v16);
          if ((v17 | 2) == 3)
          {
            v18 = v7 == 100 && v17 == 1;
            v19 = !v18;
            if (v7 == 4 || !v19)
            {
              if (dword_100131A18 <= 30
                && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
              {
                LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]", 30, "Requesting camera capabilities from device %@\n", v4);
              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
              objc_msgSend(v4, "setCameraCapabilityRequestIsActive:", 1);
              v21 = objc_alloc_init((Class)RPCompanionLinkClient);
              v22 = objc_alloc_init((Class)RPCompanionLinkDevice);
              objc_msgSend(v22, "setIdentifier:", v20);
              objc_msgSend(v21, "setDispatchQueue:", self->_dispatchQueue);
              objc_msgSend(v21, "setDestinationDevice:", v22);
              objc_msgSend(v21, "setControlFlags:", 6);
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472;
              v23[2] = sub_1000A51E4;
              v23[3] = &unk_100114A80;
              v23[4] = v21;
              v24 = v4;
              v25 = self;
              v26 = v20;
              objc_msgSend(v21, "activateWithCompletion:", v23);

            }
          }

        }
        else if (dword_100131A18 <= 90
               && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]", 90, "### Failed to get camera capabilities, there is no IDS device and status flags do not match: %@\n", v4);
        }

      }
      else if (dword_100131A18 <= 90
             && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]", 90, "### Failed to get camera capabilities, there is no IDS device identifier %@\n", v4);
      }
    }

  }
LABEL_6:

}

- (void)_sendCameraCapabilitiesUpdateEventForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSMutableDictionary *cameraCapabilitiesUpdateSendMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  RPRemoteDisplayDaemon *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIDOverride"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelIdentifier"));
  v7 = GestaltProductTypeStringToDeviceClass(v6);

  v20 = 0;
  v21 = 0;
  v22 = 0;
  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");
  if (v5
    && ((_DWORD)v7 == 100 || (_DWORD)v7 == 4)
    && DeviceOSVersionAtOrLater(v7, v20, v21, v22, 160000, 130000, 160000, 90000))
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendCameraCapabilitiesUpdateEventForDevice:]", 30, "Sending camera capabilities update to device %@\n", v4);
    }
    v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cameraCapabilitiesUpdateSendMap, "objectForKeyedSubscript:", v5));
    v9 = (id)v8;
    if (!v8)
    {
      v9 = objc_alloc_init((Class)RPCompanionLinkClient);
      objc_msgSend(v9, "setDispatchQueue:", self->_dispatchQueue);
      objc_msgSend(v9, "setControlFlags:", 6);
      cameraCapabilitiesUpdateSendMap = self->_cameraCapabilitiesUpdateSendMap;
      if (!cameraCapabilitiesUpdateSendMap)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v12 = self->_cameraCapabilitiesUpdateSendMap;
        self->_cameraCapabilitiesUpdateSendMap = v11;

        cameraCapabilitiesUpdateSendMap = self->_cameraCapabilitiesUpdateSendMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](cameraCapabilitiesUpdateSendMap, "setObject:forKeyedSubscript:", v9, v5);
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationDevice"));
    if (!v13)
    {
      v13 = objc_alloc_init((Class)RPCompanionLinkDevice);
      objc_msgSend(v13, "setIdentifier:", v5);
      objc_msgSend(v9, "setDestinationDevice:", v13);
    }
    if (!v8)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000A5944;
      v16[3] = &unk_100114AA8;
      v17 = v9;
      v18 = self;
      v19 = v5;
      objc_msgSend(v17, "activateWithCompletion:", v16);

    }
    ++self->_cameraCapabilitiesUpdatesOutstanding;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", self->_cameraCapabilities, CFSTR("_cCap")));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A59F4;
    v15[3] = &unk_1001121C0;
    v15[4] = self;
    v15[5] = v5;
    objc_msgSend(v9, "sendEventID:event:options:completion:", CFSTR("_camCapUpdate"), v14, 0, v15);

  }
}

- (void)_clearCameraCapabilitiesUpdateCache
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *cameraCapabilitiesUpdateSendMap;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cameraCapabilitiesUpdateSendMap, "allValues"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "invalidate");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_cameraCapabilitiesUpdateSendMap, "removeAllObjects");
  cameraCapabilitiesUpdateSendMap = self->_cameraCapabilitiesUpdateSendMap;
  self->_cameraCapabilitiesUpdateSendMap = 0;

}

- (void)_cameraCapabilitiesChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5CA4;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateCameraCapabilities
{
  NSDictionary *v3;
  void *v4;
  NSDictionary *cameraCapabilities;

  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice continuityCaptureCameraCapabilities](AVCaptureDevice, "continuityCaptureCameraCapabilities"));
  if (!v3)
  {
    if (dword_100131A18 <= 50
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 50)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _updateCameraCapabilities]", 50, "Continuity camera capabilities query returned nil\n");
    }
    v3 = (NSDictionary *)&__NSDictionary0__struct;
  }
  if (off_100131B78[0]())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));

    if (v4)
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _updateCameraCapabilities]", 30, "Continuity camera disabled, removing dedicated device \n");
      }
      -[RPRemoteDisplayDaemon saveDedicatedDevice:](self, "saveDedicatedDevice:", 0);
    }
  }
  cameraCapabilities = self->_cameraCapabilities;
  self->_cameraCapabilities = v3;

}

- (void)_registerForCameraCapabilitiesRequest
{
  void *v3;
  id v4;
  _QWORD v5[6];

  if (!self->_cameraCapabilityNotificationRegistered)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest]", 30, "Registering for AVCaptureDeviceContinuityCaptureCameraCapabilitiesChanged Notification\n");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_cameraCapabilitiesChanged:", AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification, 0);
    self->_cameraCapabilityNotificationRegistered = 1;

  }
  if (!self->_cameraCapabilities)
    -[RPRemoteDisplayDaemon _updateCameraCapabilities](self, "_updateCameraCapabilities");
  if (!self->_clinkClient)
  {
    v4 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)&self->_clinkClient, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A61B4;
    v5[3] = &unk_1001121C0;
    v5[4] = v4;
    v5[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v5);
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest]", 30, "Registered for camera capabilities request\n");
    }

  }
}

- (void)_postNotificationForWombatActivity:(unsigned int)a3
{
  const char *v4;

  if (dword_100131AA8 == -1)
    notify_register_check("com.apple.rapport.wombat-activity", &dword_100131AA8);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    if (a3 > 5)
      v4 = "?";
    else
      v4 = (&off_100114CF8)[a3];
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _postNotificationForWombatActivity:]", 30, "Posting notification for wombat activity change: %s (0x%x)\n", v4, a3);
  }
  notify_set_state(dword_100131AA8, a3);
  notify_post("com.apple.rapport.wombat-activity");
}

- (void)_registerForWombatStateNotifications
{
  NSObject *dispatchQueue;
  int wombatStateReadyToken;
  uint64_t wombatState;
  const char *v6;
  int v7;
  _QWORD v8[5];
  _QWORD handler[5];
  uint64_t state64;

  if (self->_wombatStateReadyToken == -1)
  {
    if (dword_100131A18 <= 20
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForWombatStateNotifications]", 20, "Registering for wombat state notification\n");
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A67E4;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch("com.apple.sharing.wombat-state", &self->_wombatStateReadyToken, dispatchQueue, handler);
    wombatStateReadyToken = self->_wombatStateReadyToken;
    state64 = 0;
    notify_get_state(wombatStateReadyToken, &state64);
    wombatState = state64;
    self->_wombatState = state64;
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 != -1
        || (v7 = _LogCategory_Initialize(&dword_100131A18, 30), wombatState = self->_wombatState, v7))
      {
        if (wombatState > 3)
          v6 = "?";
        else
          v6 = (&off_100114D28)[(int)wombatState];
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForWombatStateNotifications]", 30, "SFWombatState initialized to: %s (0x%x)\n", v6, wombatState);
        wombatState = self->_wombatState;
      }
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A6978;
    v8[3] = &unk_100114868;
    v8[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:](self, "_bluetoothUseCaseFromWombatState:resultBlock:", wombatState, v8);
  }
  -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](self, "_postNotificationForWombatActivity:", 5);
}

- (void)_unregisterWombatStateNotifications
{
  if (self->_wombatStateReadyToken != -1)
  {
    if (dword_100131A18 <= 20
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _unregisterWombatStateNotifications]", 20, "Unregistering wombat state notifications\n");
    }
    notify_cancel(self->_wombatStateReadyToken);
    self->_wombatStateReadyToken = -1;
  }
}

- (BOOL)_onenessEnabled
{
  unsigned int v2;
  const char *v3;

  v2 = -[SFAuthenticationManager isEnabledForType:](self->_authenticationManager, "isEnabledForType:", 5);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    v3 = "no";
    if (v2)
      v3 = "yes";
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _onenessEnabled]", 30, "Oneness is enabled: %s\n", v3);
  }
  return v2;
}

- (void)_startObservingOnenessEnabledState
{
  SFAuthenticationManager *authenticationManager;
  _QWORD v4[5];

  if (self->_authenticationManager)
  {
    if (dword_100131A18 <= 20
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startObservingOnenessEnabledState]", 20, "Starting authentication state change observations\n");
    }
    authenticationManager = self->_authenticationManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000A6BDC;
    v4[3] = &unk_1001110F8;
    v4[4] = self;
    -[SFAuthenticationManager startObservingForAuthenticationStateChanges:queue:](authenticationManager, "startObservingForAuthenticationStateChanges:queue:", v4, self->_dispatchQueue);
  }
}

- (void)_stopObservingOnenessEnabledState
{
  uint64_t wombatState;
  _QWORD v4[5];

  if (self->_authenticationManager)
  {
    if (dword_100131A18 <= 20
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _stopObservingOnenessEnabledState]", 20, "Stopping authentication state change observations\n");
    }
    -[SFAuthenticationManager stopObservingForAuthenticationStateChanges](self->_authenticationManager, "stopObservingForAuthenticationStateChanges");
    wombatState = self->_wombatState;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000A6DD4;
    v4[3] = &unk_100114868;
    v4[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:](self, "_bluetoothUseCaseFromWombatState:resultBlock:", wombatState, v4);
  }
}

- (BOOL)_needToHoldPowerAssertion
{
  uint64_t DeviceClass;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  DeviceClass = GestaltGetDeviceClass(self, a2);
  if ((_DWORD)DeviceClass == 1 || GestaltGetDeviceClass(DeviceClass, v4) == 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
    v6 = objc_msgSend(v5, "count");

    if (v6 || -[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_tcpServerConnections, "allValues", 0));
      v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v9 = 0;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v8);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "linkType") == 4)
              ++v9;
          }
          v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
        LOBYTE(v7) = v9 != 0;
      }

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (void)_powerAssertionEnsureHeld
{
  unsigned int *p_powerAssertion;
  const __CFDictionary *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (!self->_powerAssertion)
  {
    v4[0] = CFSTR("AssertType");
    v4[1] = CFSTR("AssertLevel");
    v5[0] = CFSTR("PreventUserIdleSystemSleep");
    v5[1] = &off_10011ACB0;
    v4[2] = CFSTR("AssertName");
    v4[3] = CFSTR("TimeoutSeconds");
    v5[2] = CFSTR("com.apple.rapport.RPRemoteDisplayDaemon.Wombat");
    v5[3] = &off_10011ACC8;
    v4[4] = CFSTR("TimeoutAction");
    v5[4] = CFSTR("TimeoutActionTurnOff");
    p_powerAssertion = &self->_powerAssertion;
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 5));
    if (IOPMAssertionCreateWithProperties(v3, p_powerAssertion) || !*p_powerAssertion)
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _powerAssertionEnsureHeld]", 30, "Failed to acquire power assertion");
      }
      *p_powerAssertion = 0;
    }
    else if (dword_100131A18 <= 30
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _powerAssertionEnsureHeld]", 30, "Acquired power assertion");
    }

  }
}

- (void)_powerAssertionEnsureReleased
{
  IOPMAssertionID powerAssertion;

  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    IOPMAssertionRelease(powerAssertion);
    self->_powerAssertion = 0;
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _powerAssertionEnsureReleased]", 30, "Released power assertion");
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPRemoteDisplayXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  RPRemoteDisplayXPCConnection *v11;
  void *v12;
  _QWORD v14[5];
  RPRemoteDisplayXPCConnection *v15;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = -[RPRemoteDisplayXPCConnection initWithDaemon:xpcCnx:]([RPRemoteDisplayXPCConnection alloc], "initWithDaemon:xpcCnx:", self, v5);
  -[RPRemoteDisplayXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  ++self->_xpcLastID;
  -[RPRemoteDisplayXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPRemoteDisplayXPCDaemonInterface));
  objc_msgSend(v5, "setExportedInterface:", v10);

  objc_msgSend(v5, "setExportedObject:", v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A73A4;
  v14[3] = &unk_100111928;
  v14[4] = self;
  v11 = v6;
  v15 = v11;
  objc_msgSend(v5, "setInvalidationHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPRemoteDisplayXPCClientInterface));
  objc_msgSend(v5, "setRemoteObjectInterface:", v12);

  objc_msgSend(v5, "resume");
  if (dword_100131A18 <= 20 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (void)_handleServerActivation:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *activatedServerXPCCnxMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  __CFString *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedServer"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));

  activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
  if (!activatedServerXPCCnxMap)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8 = self->_activatedServerXPCCnxMap;
    self->_activatedServerXPCCnxMap = v7;

    activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
  }
  if (v5)
    v9 = (__CFString *)v5;
  else
    v9 = CFSTR("_rdlink._tcp");
  -[NSMutableDictionary setObject:forKeyedSubscript:](activatedServerXPCCnxMap, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)_deliverBufferedConnectionsToServer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  NSMutableDictionary *tcpServerConnections;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activatedServer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));

  v6 = -[NSMutableSet copy](self->_bufferedConnections, "copy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v8)
    goto LABEL_22;
  v9 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceType"));
      v13 = v5;
      v14 = v13;
      if (v12 == v13)
      {

LABEL_15:
        v23 = 0;
        v24 = &v23;
        v25 = 0x2020000000;
        v26 = 0;
        tcpServerConnections = self->_tcpServerConnections;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000A7714;
        v22[3] = &unk_100114AD0;
        v22[4] = v11;
        v22[5] = &v23;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v22);
        v17 = v24;
        v18 = *((unsigned int *)v24 + 6);
        if (!(_DWORD)v18)
        {
LABEL_21:
          _Block_object_dispose(&v23, 8);
          goto LABEL_22;
        }
        if (dword_100131A18 <= 30)
        {
          if (dword_100131A18 == -1)
          {
            v19 = _LogCategory_Initialize(&dword_100131A18, 30);
            v17 = v24;
            if (!v19)
              goto LABEL_20;
            v18 = *((unsigned int *)v24 + 6);
          }
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _deliverBufferedConnectionsToServer:]", 30, "Starting buffered connection %@ with session ID %u\n", v11, v18);
          v17 = v24;
        }
LABEL_20:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v17 + 6)));
        -[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:](self, "_serverHandleSessionStartWithID:netCnx:completion:", v20, v11, 0);

        goto LABEL_21;
      }
      if ((v5 != 0) != (v12 == 0))
      {
        v15 = objc_msgSend(v12, "isEqual:", v13);

        if (v15)
          goto LABEL_15;
      }
      else
      {

      }
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
      continue;
    break;
  }
LABEL_22:

}

- (void)_xpcConnectionInvalidated:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activatedServer"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));

  if (v5)
    v6 = (__CFString *)v5;
  else
    v6 = CFSTR("_rdlink._tcp");
  objc_msgSend(v7, "connectionInvalidated");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activatedServerXPCCnxMap, "setObject:forKeyedSubscript:", 0, v6);
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[RPRemoteDisplayDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");

}

- (void)addNeedsAWDLPeer:(id)a3
{
  void *v4;
  NSMutableSet *needsAWDLNewPeers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v4 || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"))) != 0)
  {
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    if (!needsAWDLNewPeers)
    {
      v6 = objc_opt_new(NSMutableSet);
      v7 = self->_needsAWDLNewPeers;
      self->_needsAWDLNewPeers = v6;

      needsAWDLNewPeers = self->_needsAWDLNewPeers;
    }
    -[NSMutableSet addObject:](needsAWDLNewPeers, "addObject:", v4);

  }
  else if (dword_100131A18 <= 30
         && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon addNeedsAWDLPeer:]", 30, "Failed to send NeedsAWDL event over WiFi, no identifier: %@\n", v8);
  }

}

- (void)_requestConfirmationFromPerson:(id)a3 forDedicated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSUUID *v8;
  NSUUID *personConfirmationSessionID;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v7 = a3;
  v8 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = v8;

  objc_storeStrong((id *)&self->_personSelected, a3);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A7994;
  v11[3] = &unk_100114AF8;
  v12 = v7;
  v10 = v7;
  -[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:](self, "_requestConfirmationFromDevicesMatching:forDedicated:", v11, v4);

}

- (void)_requestConfirmationFromDevice:(id)a3 forDedicated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSUUID *v7;
  NSUUID *personConfirmationSessionID;
  RPRemoteDisplayPerson *personSelected;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = v7;

  personSelected = self->_personSelected;
  self->_personSelected = 0;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A7B6C;
  v11[3] = &unk_100114AF8;
  v12 = v6;
  v10 = v6;
  -[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:](self, "_requestConfirmationFromDevicesMatching:forDedicated:", v11, v4);

}

- (void)_requestConfirmationFromDevicesMatching:(id)a3 forDedicated:(BOOL)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]", 30, "Discovery session state change as new confirmation flow has started\n");
  -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self, "_changeDiscoverySessionStateForDevice:startReason:", 0, 0);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7C64;
  block[3] = &unk_100114B98;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_handleConfirmationResult:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  CFTypeID v11;
  uint64_t v12;
  void *v13;
  uint64_t NSNumber;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  RPRemoteDisplayDaemon *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSMutableSet *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  RPRemoteDisplayPerson *v38;
  RPRemoteDisplayPerson *personSelected;
  void *v40;
  void *v41;
  id v42;
  unsigned __int8 v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v6 = a3;
  v7 = a4;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 30, "Response dictionary: %@\n", v6);
  TypeID = CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("info"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v11 = CFDictionaryGetTypeID();
  v12 = CFDictionaryGetTypedValue(v10, CFSTR("usi"), v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  NSNumber = NSDictionaryGetNSNumber(v13, CFSTR("DDUIMessageResponseResultKey"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
  v17 = v16;
  if (!v15)
  {
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 90, "### Skip continuity camera confirmation, empty result\n");
    }
    goto LABEL_53;
  }
  if (!self->_personSelected)
  {
    if (v16)
    {
      v20 = v16;
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsDeviceIdentifier"));
      v22 = v7;
      v23 = v22;
      if (v21 == v22)
      {

        v17 = v20;
        goto LABEL_7;
      }
      if ((v22 != 0) != (v21 == 0))
      {
        v43 = objc_msgSend(v21, "isEqual:", v22);

        v17 = v20;
        if ((v43 & 1) != 0)
          goto LABEL_7;
      }
      else
      {

        v17 = v20;
      }
    }
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 90, "### Skip continuity camera confirmation, no person or dedicated device selected\n");
    }
    goto LABEL_53;
  }
LABEL_7:
  if (self->_personConfirmationSessionID)
  {
    v18 = (unint64_t)objc_msgSend(v15, "unsignedIntegerValue");
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      if (v18 > 7)
        v19 = "?";
      else
        v19 = (&off_100114D48)[v18];
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 30, "Received '%s' for continuity camera confirmation from device: %@\n", v19, v7);
    }
    v44 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v7));
    if (v18 == 1)
    {
      -[RPRemoteDisplayDaemon _sendConfirmationCancelToAllDevices](self, "_sendConfirmationCancelToAllDevices");
      if (!v24)
      {
        if (dword_100131A18 <= 90
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
        {
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 90, "### Failed to find continuity camera device confirmed (IDS ID: %@), treat as decline\n", v7);
        }
        personSelected = self->_personSelected;
        self->_personSelected = 0;

        goto LABEL_52;
      }
      v25 = self;
      v26 = v7;
      v27 = 1;
    }
    else
    {
      if (!-[NSMutableDictionary count](self->_personConfirmationClientMap, "count"))
      {
        v40 = v13;
        v41 = v10;
        v42 = v6;
        if (dword_100131A18 <= 30
          && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayPerson accountID](self->_personSelected, "accountID"));
          LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 30, "Received non-accept response from all devices for selected person: %{mask}@\n", v28);

        }
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v29 = self->_xpcConnections;
        v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "activatedDiscovery"));

              if (v35)
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "xpcCnx"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "remoteObjectProxy"));
                objc_msgSend(v37, "remoteDisplayPersonDeclined");

              }
            }
            v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v31);
        }

        v38 = self->_personSelected;
        self->_personSelected = 0;

        v10 = v41;
        v6 = v42;
        v13 = v40;
      }
      v25 = self;
      v26 = 0;
      v27 = 0;
    }
    -[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:](v25, "_processDiscoverySessionStateChangeForDevice:startReason:", v26, v27);
LABEL_52:

    v17 = v44;
    goto LABEL_53;
  }
  if (dword_100131A18 <= 90 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]", 90, "### Skip continuity camera confirmation, no confirmation session ID\n");
LABEL_53:

}

- (void)_sendConfirmationCancelToAllDevices
{
  NSMutableDictionary *personConfirmationClientMap;
  NSMutableDictionary *v4;
  NSUUID *personConfirmationSessionID;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  personConfirmationClientMap = self->_personConfirmationClientMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A8880;
  v6[3] = &unk_100114BE8;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](personConfirmationClientMap, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[NSMutableDictionary removeAllObjects](self->_personConfirmationClientMap, "removeAllObjects");
  v4 = self->_personConfirmationClientMap;
  self->_personConfirmationClientMap = 0;

  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = 0;

}

- (void)_clearConfirmationClientCache
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *personConfirmationClientMap;
  NSUUID *personConfirmationSessionID;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_personConfirmationClientMap, "allValues"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "invalidate");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_personConfirmationClientMap, "removeAllObjects");
  personConfirmationClientMap = self->_personConfirmationClientMap;
  self->_personConfirmationClientMap = 0;

  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = 0;

}

- (void)_sendDiscoverySessionExitWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[6];
  id v14;
  RPRemoteDisplayDaemon *v15;

  v4 = a3;
  if (self->_deviceConfirmedIdentifier)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:"));
    v6 = v5;
    if (v5 && objc_msgSend(v5, "inDiscoverySession"))
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:]", 30, "Sending exit session with reason '%@' to device %@\n", v4, v6);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceIdentifier"));
      v8 = objc_alloc_init((Class)RPCompanionLinkClient);
      v9 = objc_alloc_init((Class)RPCompanionLinkDevice);
      objc_msgSend(v9, "setIdentifier:", v7);
      objc_msgSend(v8, "setDispatchQueue:", self->_dispatchQueue);
      objc_msgSend(v8, "setDestinationDevice:", v9);
      objc_msgSend(v8, "setControlFlags:", 2097162);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("_i"));

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, CFSTR("_cExitReson"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000A8DD8;
      v13[3] = &unk_100114A80;
      v13[4] = v8;
      v13[5] = v7;
      v14 = v10;
      v15 = self;
      v12 = v10;
      objc_msgSend(v8, "activateWithCompletion:", v13);

    }
  }

}

- (void)setDeviceConfirmedIdentifier:(id)a3
{
  NSString *v4;
  NSString *deviceConfirmedIdentifier;

  v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon setDeviceConfirmedIdentifier:]", 30, "Device confirmed changed %@ -> %@\n", self->_deviceConfirmedIdentifier, v4);
  deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
  self->_deviceConfirmedIdentifier = v4;

}

- (void)_changeDiscoverySessionStateForDevice:(id)a3 startReason:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  unsigned int v7;
  RPRemoteDisplayDaemon *v8;
  id v9;
  id v10;

  v4 = a4;
  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = v10;
  if (v10
    && self->_deviceConfirmedIdentifier
    && (v7 = objc_msgSend(v10, "isEqualToString:"), v6 = v10, !v7))
  {
    -[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:](self, "_processDiscoverySessionStateChangeForDevice:startReason:", 0, 0);
    v8 = self;
    v9 = v10;
  }
  else
  {
    v8 = self;
    v9 = v6;
  }
  -[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:](v8, "_processDiscoverySessionStateChangeForDevice:startReason:", v9, v4);

}

- (void)_processDiscoverySessionStateChangeForDevice:(id)a3 startReason:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSString *deviceConfirmedIdentifier;
  _BOOL8 v8;
  const char *v9;
  const char *v10;
  const char *v11;
  id v12;
  NSMutableSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  OS_dispatch_source *discoverySessionExpirationTimer;
  NSObject *v29;
  OS_dispatch_source *v30;
  NSString *v31;
  NSString *v32;
  RPRemoteDisplayDaemon *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v4 = a4;
  v6 = a3;
  deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
  v8 = v6 != 0;
  if (v8 != (deviceConfirmedIdentifier != 0))
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      v9 = "OutOfSession";
      if (deviceConfirmedIdentifier)
        v10 = "InSession";
      else
        v10 = "OutOfSession";
      if (v6)
        v9 = "InSession";
      if (v4 > 2)
        v11 = "?";
      else
        v11 = (&off_100114D88)[(char)v4];
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:]", 30, "Discovery session state %s -> %s, peer %@, startReason %s \n", v10, v9, v6, v11);
    }
    v31 = self->_deviceConfirmedIdentifier;
    v32 = v31;
    -[RPRemoteDisplayDaemon setDeviceConfirmedIdentifier:](self, "setDeviceConfirmedIdentifier:", v6);
    if (v6)
    {
      v12 = v6;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v6));
    }
    else
    {
      v12 = 0;
      v34 = 0;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = self;
    v13 = self->_xpcConnections;
    v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activatedDiscovery"));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "xpcCnx"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "remoteObjectProxy"));
            objc_msgSend(v21, "remoteDisplayDeviceSelected:", v34);

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "xpcCnx"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "remoteObjectProxy"));
            objc_msgSend(v23, "remoteDisplayNotifyDiscoverySessionState:forDevice:startReason:", v8, v12, v4);

          }
        }
        v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v15);
    }

    v6 = v12;
    if (v12)
    {
      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](v33, "_postNotificationForWombatActivity:", 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v24, "postDaemonInfoChanges:", 0x8000);

      -[RPRemoteDisplayDaemon _startDiscoverySessionExpirationTimer](v33, "_startDiscoverySessionExpirationTimer");
      v25 = v32;
    }
    else
    {
      v25 = v32;
      if (v31)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
        objc_msgSend(v26, "removeSessionPairedIdentityWithIdentifier:", v32);

      }
      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](v33, "_postNotificationForWombatActivity:", 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v27, "postDaemonInfoChanges:", 0x10000);

      discoverySessionExpirationTimer = v33->_discoverySessionExpirationTimer;
      if (discoverySessionExpirationTimer)
      {
        v29 = discoverySessionExpirationTimer;
        dispatch_source_cancel(v29);
        v30 = v33->_discoverySessionExpirationTimer;
        v33->_discoverySessionExpirationTimer = 0;

      }
    }

  }
}

- (void)_startDiscoverySessionExpirationTimer
{
  OS_dispatch_source *discoverySessionExpirationTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD handler[5];

  discoverySessionExpirationTimer = self->_discoverySessionExpirationTimer;
  if (discoverySessionExpirationTimer)
  {
    v4 = discoverySessionExpirationTimer;
    dispatch_source_cancel(v4);
    v5 = self->_discoverySessionExpirationTimer;
    self->_discoverySessionExpirationTimer = 0;

  }
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v7 = self->_discoverySessionExpirationTimer;
  self->_discoverySessionExpirationTimer = v6;

  v8 = self->_discoverySessionExpirationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A94EC;
  handler[3] = &unk_1001110F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet(self->_discoverySessionExpirationTimer, (double)self->_prefDiscoverySessionExpirationSeconds, -1.0, 1.0);
  dispatch_activate((dispatch_object_t)self->_discoverySessionExpirationTimer);
}

- (void)_startInSessionDeviceLostTimer
{
  OS_dispatch_source *inSessionDeviceLost;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD handler[5];

  if (self->_deviceConfirmedIdentifier)
  {
    inSessionDeviceLost = self->_inSessionDeviceLost;
    if (inSessionDeviceLost)
    {
      v4 = inSessionDeviceLost;
      dispatch_source_cancel(v4);
      v5 = self->_inSessionDeviceLost;
      self->_inSessionDeviceLost = 0;

    }
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer]", 30, "Starting device lost timer for device %@\n", self->_deviceConfirmedIdentifier);
    }
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v7 = self->_inSessionDeviceLost;
    self->_inSessionDeviceLost = v6;

    v8 = self->_inSessionDeviceLost;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A96B8;
    handler[3] = &unk_1001110F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet(self->_inSessionDeviceLost, (double)self->_prefInSessionDeviceLostSeconds, -1.0, 1.0);
    dispatch_activate((dispatch_object_t)self->_inSessionDeviceLost);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)deviceConfirmedIdentifier
{
  return self->_deviceConfirmedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceConfirmedIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_personSelected, 0);
  objc_storeStrong((id *)&self->_personConfirmationSessionID, 0);
  objc_storeStrong((id *)&self->_personConfirmationClientMap, 0);
  objc_storeStrong((id *)&self->_pendingLostDevicesTimer, 0);
  objc_storeStrong((id *)&self->_pendingLostDevices, 0);
  objc_storeStrong((id *)&self->_xpcMatchingServerMap, 0);
  objc_storeStrong((id *)&self->_xpcMatchingDiscoveryMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_unresolvedDevices, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_tcpServerConnections, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_serverIncomingMessageCLinkClient, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestTimer, 0);
  objc_storeStrong((id *)&self->_needsAWDLSentToPeers, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_needsAWDLNewPeers, 0);
  objc_storeStrong((id *)&self->_needsAWDLDevices, 0);
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_inSessionDeviceLost, 0);
  objc_storeStrong((id *)&self->_discoverySessionExpirationTimer, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_deviceSessionPaired, 0);
  objc_storeStrong((id *)&self->_devicesInProximity, 0);
  objc_storeStrong((id *)&self->_deviceAWDLRandomID, 0);
  objc_storeStrong((id *)&self->_deviceAuthTagStr, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_cameraCapabilitiesUpdateSendMap, 0);
  objc_storeStrong((id *)&self->_clientIncomingMessageCLinkClient, 0);
  objc_storeStrong((id *)&self->_cameraCapabilities, 0);
  objc_storeStrong((id *)&self->_bufferedConnections, 0);
  objc_storeStrong((id *)&self->_btAdvAddrStr, 0);
  objc_storeStrong((id *)&self->_btAdvAddrData, 0);
  objc_storeStrong((id *)&self->_btAdvAddrMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserAWDL, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLDevices, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLAdvertiser, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNeedsAWDLScanner, 0);
  objc_storeStrong((id *)&self->_bleNeedsAWDLAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Discovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Device, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Advertiser, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
  objc_storeStrong((id *)&self->_awdlPairingID, 0);
  objc_storeStrong((id *)&self->_authenticationManager, 0);
  objc_storeStrong((id *)&self->_activatedSessionSet, 0);
  objc_storeStrong((id *)&self->_activatedServerXPCCnxMap, 0);
  objc_storeStrong((id *)&self->_activatedDiscoverySet, 0);
}

@end
