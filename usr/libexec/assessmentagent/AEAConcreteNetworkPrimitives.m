@implementation AEAConcreteNetworkPrimitives

- (void)clearUUIDCache
{
  +[NEProcessInfo clearUUIDCache](NEProcessInfo, "clearUUIDCache");
}

- (id)machOUUIDsForExecutableURL:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v4 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", v3);

  return v4;
}

- (id)restrictNetworkExcludingProcessesWithIdentifiers:(id)a3 machOUUIDs:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  unsigned int v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id obj;
  NEPolicySession *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  void *v158;
  _QWORD v159[2];
  _BYTE v160[128];
  _QWORD v161[2];
  _BYTE v162[128];
  _QWORD v163[2];
  _BYTE v164[128];
  _QWORD v165[2];
  _BYTE v166[128];
  _QWORD v167[3];
  _QWORD v168[3];
  _QWORD v169[2];
  _BYTE v170[128];
  _QWORD v171[2];
  _BYTE v172[128];
  _QWORD v173[2];
  _BYTE v174[128];

  v5 = a3;
  v6 = a4;
  v129 = objc_opt_new(NEPolicySession);
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v174, 16);
  if (v7)
  {
    v8 = v7;
    v126 = v6;
    v9 = *(_QWORD *)v155;
    v10 = 10;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v155 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)v11);
        v14 = objc_alloc((Class)NEPolicy);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v173[0] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectivePID:](NEPolicyCondition, "effectivePID:", objc_msgSend(v13, "intValue")));
        v173[1] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v173, 2));
        v19 = objc_msgSend(v14, "initWithOrder:result:conditions:", (char *)v11 + v12, v15, v18);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v19);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v174, 16);
      v10 = (v12 + (_DWORD)v11);
    }
    while (v8);
    v20 = (v12 + (_DWORD)v11);
    v6 = v126;
  }
  else
  {
    v20 = 10;
  }

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v127 = v6;
  v21 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v151;
    do
    {
      v24 = 0;
      v25 = v20;
      do
      {
        if (*(_QWORD *)v151 != v23)
          objc_enumerationMutation(v127);
        v26 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)v24);
        v27 = objc_alloc((Class)NEPolicy);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v171[0] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v26));
        v171[1] = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v171, 2));
        v32 = objc_msgSend(v27, "initWithOrder:result:conditions:", (char *)v24 + v25, v28, v31);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v32);
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
      LODWORD(v20) = v25 + (_DWORD)v24;
    }
    while (v22);
    v20 = (v25 + (_DWORD)v24);
  }

  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v125 = +[NEProcessInfo copyUUIDsForBundleID:uid:](NEProcessInfo, "copyUUIDsForBundleID:uid:", CFSTR("com.apple.mDNSResponder"), 0);
  v33 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v146, v170, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v147;
    do
    {
      v36 = 0;
      v37 = v20;
      do
      {
        if (*(_QWORD *)v147 != v35)
          objc_enumerationMutation(v125);
        v38 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)v36);
        v39 = objc_alloc((Class)NEPolicy);
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v169[0] = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v38));
        v169[1] = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v169, 2));
        v44 = objc_msgSend(v39, "initWithOrder:result:conditions:", (char *)v36 + v37, v40, v43);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v44);
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v146, v170, 16);
      LODWORD(v20) = v37 + (_DWORD)v36;
    }
    while (v34);
    v20 = (v37 + (_DWORD)v36);
  }

  v45 = objc_claimAutoreleasedReturnValue(+[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", CFSTR("0.0.0.0"), CFSTR("53")));
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", CFSTR("::"), CFSTR("53")));
  v46 = objc_alloc((Class)NEPolicy);
  v123 = v20 + 1;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
  v168[0] = v48;
  v118 = (void *)v45;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition remoteAddress:prefix:](NEPolicyCondition, "remoteAddress:prefix:", v45, 0));
  v168[1] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition ipProtocol:](NEPolicyCondition, "ipProtocol:", 17));
  v168[2] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v168, 3));
  v52 = objc_msgSend(v46, "initWithOrder:result:conditions:", v20, v47, v51);

  v53 = objc_alloc((Class)NEPolicy);
  v54 = (v20 + 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
  v167[0] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition remoteAddress:prefix:](NEPolicyCondition, "remoteAddress:prefix:", v119, 0));
  v167[1] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition ipProtocol:](NEPolicyCondition, "ipProtocol:", 17));
  v167[2] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v167, 3));
  v60 = objc_msgSend(v53, "initWithOrder:result:conditions:", v123, v55, v59);

  v117 = v52;
  -[NEPolicySession addPolicy:](v129, "addPolicy:", v52);
  v116 = v60;
  -[NEPolicySession addPolicy:](v129, "addPolicy:", v60);
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v124 = +[NEProcessInfo copyUUIDsForBundleID:uid:](NEProcessInfo, "copyUUIDsForBundleID:uid:", CFSTR("com.apple.configd"), 0);
  v61 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v142, v166, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v143;
    do
    {
      v64 = 0;
      v65 = v54;
      do
      {
        if (*(_QWORD *)v143 != v63)
          objc_enumerationMutation(v124);
        v66 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)v64);
        v67 = objc_alloc((Class)NEPolicy);
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v165[0] = v69;
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v66));
        v165[1] = v70;
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v165, 2));
        v72 = objc_msgSend(v67, "initWithOrder:result:conditions:", (char *)v64 + v65, v68, v71);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v72);
        v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      v62 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v142, v166, 16);
      LODWORD(v54) = v65 + (_DWORD)v64;
    }
    while (v62);
    v54 = (v65 + (_DWORD)v64);
  }

  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v122 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", CFSTR("/usr/libexec/mdmd"));
  v73 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v138, v164, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v139;
    do
    {
      v76 = 0;
      v77 = v54;
      do
      {
        if (*(_QWORD *)v139 != v75)
          objc_enumerationMutation(v122);
        v78 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)v76);
        v79 = objc_alloc((Class)NEPolicy);
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v163[0] = v81;
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v78));
        v163[1] = v82;
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v163, 2));
        v84 = objc_msgSend(v79, "initWithOrder:result:conditions:", (char *)v76 + v77, v80, v83);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v84);
        v76 = (char *)v76 + 1;
      }
      while (v74 != v76);
      v74 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v138, v164, 16);
      LODWORD(v54) = v77 + (_DWORD)v76;
    }
    while (v74);
    v54 = (v77 + (_DWORD)v76);
  }

  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v121 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", CFSTR("/usr/libexec/mdmuserd"));
  v85 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v134, v162, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v135;
    do
    {
      v88 = 0;
      v89 = v54;
      do
      {
        if (*(_QWORD *)v135 != v87)
          objc_enumerationMutation(v121);
        v90 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)v88);
        v91 = objc_alloc((Class)NEPolicy);
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v161[0] = v93;
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v90));
        v161[1] = v94;
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v161, 2));
        v96 = objc_msgSend(v91, "initWithOrder:result:conditions:", (char *)v88 + v89, v92, v95);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v96);
        v88 = (char *)v88 + 1;
      }
      while (v86 != v88);
      v86 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v134, v162, 16);
      LODWORD(v54) = v89 + (_DWORD)v88;
    }
    while (v86);
    v54 = (v89 + (_DWORD)v88);
  }

  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v120 = +[NEProcessInfo copyUUIDsForBundleID:uid:](NEProcessInfo, "copyUUIDsForBundleID:uid:", CFSTR("com.apple.apsd"), 0);
  v97 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v130, v160, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v131;
    do
    {
      v100 = 0;
      v101 = v54;
      do
      {
        if (*(_QWORD *)v131 != v99)
          objc_enumerationMutation(v120);
        v102 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)v100);
        v103 = objc_alloc((Class)NEPolicy);
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 0));
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v159[0] = v105;
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v102));
        v159[1] = v106;
        v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v159, 2));
        v108 = objc_msgSend(v103, "initWithOrder:result:conditions:", (char *)v100 + v101, v104, v107);

        -[NEPolicySession addPolicy:](v129, "addPolicy:", v108);
        v100 = (char *)v100 + 1;
      }
      while (v98 != v100);
      v98 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v130, v160, 16);
      LODWORD(v54) = v101 + (_DWORD)v100;
    }
    while (v98);
    v54 = (v101 + (_DWORD)v100);
  }

  v109 = objc_alloc((Class)NEPolicy);
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult drop](NEPolicyResult, "drop"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
  v158 = v111;
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v158, 1));
  v113 = objc_msgSend(v109, "initWithOrder:result:conditions:", v54, v110, v112);
  -[NEPolicySession addPolicy:](v129, "addPolicy:", v113);

  if (-[NEPolicySession apply](v129, "apply"))
    v114 = sub_100004648((id *)[AEAConcreteRestrictedNetworkToken alloc], v129);
  else
    v114 = 0;

  return v114;
}

@end
