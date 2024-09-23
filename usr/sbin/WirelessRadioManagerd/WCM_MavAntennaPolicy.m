@implementation WCM_MavAntennaPolicy

- (WCM_MavAntennaPolicy)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCM_MavAntennaPolicy;
  v2 = -[WCM_MavAntennaPolicy init](&v7, "init");
  *(_OWORD *)(v2 + 8) = xmmword_1001DEBE0;
  v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("wifi_client"), CFSTR("rc3_client"), CFSTR("rc1_client"), CFSTR("fid_client"), CFSTR("rcam_t_client"), CFSTR("rcam_w_client"), CFSTR("e85_u_client0"), CFSTR("e85_d_client0"), 0));
  v4 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v3;

  v5 = (void *)*((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 4) = &__NSArray0__struct;

  return (WCM_MavAntennaPolicy *)v2;
}

- (void)applyMavAntennaPolicyForPlatformId:(int)a3 sku:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a3;
  self->mPlatformId = a3;
  self->mSKU = a4;
  -[WCM_MavAntennaPolicy initSfPboffParams](self, "initSfPboffParams");
  -[WCM_MavAntennaPolicy createClientMappingsfromPlist:](self, "createClientMappingsfromPlist:", v4);
}

- (void)initSfPboffParams
{
  uint64_t mPlatformId;
  NSArray *mFixedPbOffBands;
  NSArray *v4;

  mPlatformId = self->mPlatformId;
  if ((_DWORD)mPlatformId == 54)
  {
    mFixedPbOffBands = self->mFixedPbOffBands;
    v4 = (NSArray *)&off_100241E98;
    goto LABEL_5;
  }
  if ((_DWORD)mPlatformId == 57)
  {
    mFixedPbOffBands = self->mFixedPbOffBands;
    v4 = (NSArray *)&off_100241E80;
LABEL_5:
    self->mFixedPbOffBands = v4;

    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("SF Pboff Policy: Platform %u is not supported"), mPlatformId);
}

- (id)getPlatformPlistName
{
  uint64_t mPlatformId;

  mPlatformId = self->mPlatformId;
  switch((int)mPlatformId)
  {
    case '2':
      return CFSTR("antenna_block_policy_mav_p031");
    case '3':
      return CFSTR("antenna_block_policy_mav_p032");
    case '4':
      return CFSTR("antenna_block_policy_mav_p033");
    case '5':
      return CFSTR("antenna_block_policy_mav_p034");
    case '6':
      return CFSTR("antenna_block_policy_mav_p043");
    case '7':
      return CFSTR("antenna_block_policy_mav_p044");
    case '8':
      return CFSTR("antenna_block_policy_mav_p041");
    case '9':
      return CFSTR("antenna_block_policy_mav_p042");
    default:
      if ((mPlatformId - 162) > 8)
        goto LABEL_15;
      if (((1 << (mPlatformId + 94)) & 0x145) != 0)
        return CFSTR("antenna_block_policy_mav_dummy");
      if ((_DWORD)mPlatformId == 166)
        return CFSTR("antenna_block_policy_mav_p045");
LABEL_15:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Ant Block Policy: Platform %u is not supported"), mPlatformId);
      return 0;
  }
}

- (id)getPlatformCidPlistName
{
  int mPlatformId;
  id result;

  mPlatformId = self->mPlatformId;
  result = CFSTR("bb_CoEx-Table-CellCoex034_V7WiFiEnh");
  switch(mPlatformId)
  {
    case '2':
      result = CFSTR("bb_CoEx-Table-CellCoex031_V7WiFiEnh");
      break;
    case '3':
      result = CFSTR("bb_CoEx-Table-CellCoex032_V7WiFiEnh");
      break;
    case '4':
      result = CFSTR("bb_CoEx-Table-CellCoex033_V7WiFiEnh");
      break;
    case '5':
      return result;
    case '6':
      result = CFSTR("bb_CoEx-Table-CellCoex043_V7WiFiEnh");
      break;
    case '7':
      result = CFSTR("bb_CoEx-Table-CellCoex044_V7WiFiEnh");
      break;
    case '8':
      result = CFSTR("bb_CoEx-Table-CellCoex041_V7WiFiEnh");
      break;
    case '9':
      result = CFSTR("bb_CoEx-Table-CellCoex042_V7WiFiEnh");
      break;
    default:
      switch(mPlatformId)
      {
        case 162:
          result = CFSTR("bb_CoEx-Table-CellCoex035_V7WiFiEnh");
          break;
        case 164:
          result = CFSTR("bb_CoEx-Table-CellCoex036_V7WiFiEnh");
          break;
        case 166:
          result = CFSTR("bb_CoEx-Table-CellCoex045_V7WiFiEnh");
          break;
        case 168:
          result = CFSTR("bb_CoEx-Table-CellCoex039_V7WiFiEnh");
          break;
        case 170:
          result = CFSTR("bb_CoEx-Table-CellCoex040_V7WiFiEnh");
          break;
        default:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Condition id Policy: Platform %u is not supported"), 1992);
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (id)getFaceIDConfigDictionarySKUBased:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch(self->mSKU)
    {
      case 1:
        v6 = CFSTR("A");
        break;
      case 2:
        v6 = CFSTR("B");
        break;
      case 3:
        v6 = CFSTR("C");
        break;
      case 4:
        v6 = CFSTR("D");
        break;
      default:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("FaceId Config: SKU %u is not supported"), self->mSKU);
        goto LABEL_5;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v6));
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (id)getFaceIDPlatformPlistName
{
  uint64_t mPlatformId;

  mPlatformId = self->mPlatformId;
  if ((mPlatformId - 54) < 4)
    return (id)*((_QWORD *)&off_100204C28 + (int)mPlatformId - 54);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Face id Policy: Platform %u is not supported"), mPlatformId);
  return 0;
}

- (int)getMavClientIdforAntClient:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int mAntBlockClientId;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("wifi_client")) & 1) != 0)
  {
    v5 = 0;
LABEL_18:
    self->mAntBlockClientId = v5;
    goto LABEL_19;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("rc3_client")) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("rc1_client")) & 1) != 0)
  {
    v5 = 2;
    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fid_client")) & 1) != 0)
  {
    v5 = 3;
    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("rcam_t_client")) & 1) != 0)
  {
    v5 = 4;
    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("rcam_w_client")) & 1) != 0)
  {
    v5 = 5;
    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("e85_u_client0")) & 1) != 0)
  {
    v5 = 6;
    goto LABEL_18;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("e85_d_client0")) & 1) != 0)
  {
    v5 = 7;
    goto LABEL_18;
  }
  v5 = -1;
  if (v4)
    goto LABEL_18;
  mAntBlockClientId = self->mAntBlockClientId;
  self->mAntBlockClientId = mAntBlockClientId + 1;
  if ((int)(mAntBlockClientId + 1) <= 15)
    v5 = mAntBlockClientId + 1;
  else
    v5 = -1;
LABEL_19:

  return v5;
}

- (void)createClientMappingsfromPlist:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSData *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  id *p_isa;
  uint64_t v25;
  NSData *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *i;
  void *v32;
  void *v33;
  void *v34;
  void *j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  int v53;
  uint64_t v54;
  void *k;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  xpc_object_t v84;
  xpc_object_t v85;
  xpc_object_t v86;
  xpc_object_t v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  void *m;
  void *v94;
  uint64_t v95;
  void *v96;
  unsigned __int8 v97;
  void *v98;
  void *v99;
  xpc_object_t v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  id obj;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  xpc_object_t xarray;
  void *v113;
  xpc_object_t object;
  id v115;
  void *v116;
  void *v117;
  int v118;
  uint64_t v119;
  id v120;
  unsigned int v121;
  unsigned int v122;
  void *v123;
  unsigned __int8 v124;
  uint64_t v125;
  void *v126;
  id v127;
  xpc_object_t v128;
  id v129;
  WCM_MavAntennaPolicy *v130;
  unsigned int v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  unsigned int v136;
  void *v137;
  void *v138;
  uint64_t v139;
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
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  uint64_t v170;
  _BYTE v171[128];
  _QWORD v172[3];
  _QWORD v173[3];
  _QWORD v174[2];
  _QWORD v175[2];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];

  v3 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Cellular controller create MavClientMappings from Plist"));
  v170 = 0;
  xarray = xpc_array_create(0, 0);
  if (xarray)
  {
    object = xpc_array_create(0, 0);
    if (!object)
    {
      v9 = 0;
      v23 = 0;
      v10 = 0;
LABEL_122:

      goto LABEL_123;
    }
    v128 = xpc_array_create(0, 0);
    if (!v128)
    {
      v9 = 0;
      v113 = 0;
      v10 = 0;
LABEL_121:

      v23 = v113;
      goto LABEL_122;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy getPlatformPlistName](self, "getPlatformPlistName"));
    v106 = (void *)v5;
    if (v5)
    {
      v6 = sub_1000896B4(v5, (uint64_t)CFSTR("plist"));
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (v7)
      {
        v8 = (void *)v7;
        v169 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v7, 2, &v170, &v169));
        v10 = v169;
        if (v9)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create Mav Client AntennaM appings from Plist: Antenna blocking policy Plist File Found"));
          v167 = 0u;
          v168 = 0u;
          v165 = 0u;
          v166 = 0u;
          v130 = self;
          v11 = self->mFixedAntClients;
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v165, v181, 16);
          v135 = v8;
          if (v12)
          {
            v13 = v12;
            v138 = 0;
            v113 = 0;
            v14 = *(_QWORD *)v166;
            do
            {
              v15 = 0;
              v16 = v113;
              do
              {
                v17 = v16;
                if (*(_QWORD *)v166 != v14)
                  objc_enumerationMutation(v11);
                v18 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)v15);
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v18));

                v20 = (id)-[WCM_MavAntennaPolicy getMavClientIdforAntClient:](v130, "getMavClientIdforAntClient:", v18);
                v16 = (void *)v19;
                if (v19)
                  v21 = (_DWORD)v20 == -1;
                else
                  v21 = 1;
                if (!v21)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createAntennaBlockingClientXpcArray:client_id:convBand:](v130, "createAntennaBlockingClientXpcArray:client_id:convBand:", v19, v20, 1));

                  if (v22)
                  {
                    xpc_array_append_value(xarray, v22);
                    v138 = v22;
                  }
                  else
                  {
                    v138 = 0;
                  }
                  v16 = (void *)v19;
                }
                v15 = (char *)v15 + 1;
              }
              while (v13 != v15);
              v113 = v16;
              v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v165, v181, 16);
            }
            while (v13);
          }
          else
          {
            v138 = 0;
            v113 = 0;
          }

          p_isa = (id *)&v130->super.isa;
          v25 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy getPlatformCidPlistName](v130, "getPlatformCidPlistName"));

          v104 = (void *)v25;
          v26 = sub_1000896B4(v25, (uint64_t)CFSTR("plist"));
          v27 = objc_claimAutoreleasedReturnValue(v26);

          v105 = (void *)v27;
          if (v27)
          {
            v164 = 0;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v27, 2, &v170, &v164));
            v103 = v164;

            if (v28)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create Mav Client Antenna Mappings from Plist: Antenna condition id policy Plist File Found for device"));
              v102 = v28;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("config")));
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              v160 = 0u;
              v161 = 0u;
              v162 = 0u;
              v163 = 0u;
              v101 = v29;
              obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "reverseObjectEnumerator"));
              v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
              if (v109)
              {
                v108 = *(_QWORD *)v161;
                v116 = v30;
                do
                {
                  for (i = 0; i != v109; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v161 != v108)
                    {
                      v32 = i;
                      objc_enumerationMutation(obj);
                      i = v32;
                    }
                    v33 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)i);
                    if (v33)
                    {
                      v111 = i;
                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("Policy")));
                      v156 = 0u;
                      v157 = 0u;
                      v158 = 0u;
                      v159 = 0u;
                      v110 = v34;
                      v115 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "reverseObjectEnumerator"));
                      v120 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
                      if (v120)
                      {
                        v124 = 0;
                        v119 = *(_QWORD *)v157;
                        v117 = v33;
                        do
                        {
                          for (j = 0; j != v120; j = (char *)j + 1)
                          {
                            if (*(_QWORD *)v157 != v119)
                              objc_enumerationMutation(v115);
                            v36 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)j);
                            if (v36)
                            {
                              v123 = j;
                              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("cellular_frequency_upper")));
                              v121 = objc_msgSend(v37, "unsignedIntValue");

                              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("cellular_frequency_lower")));
                              v122 = objc_msgSend(v38, "unsignedIntValue");

                              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("cellular_band")));
                              v136 = objc_msgSend(p_isa, "convertBandToEurBandId:", v39);

                              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("condition_id")));
                              v131 = objc_msgSend(v40, "unsignedIntValue");

                              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("antenna_info")));
                              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("antblock_client_id")));

                              if (v42)
                              {
                                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("antblock_client_id")));
                                v44 = objc_msgSend(v43, "unsignedIntValue");

                                v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v44));
                                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v45));

                                if (!v46)
                                {
                                  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                                  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v44));
                                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v47, v48);

                                }
                                v118 = (int)v44;
                                v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v44));
                                v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v49));

                              }
                              else
                              {
                                v126 = 0;
                                v118 = -1;
                              }
                              v154 = 0u;
                              v155 = 0u;
                              v152 = 0u;
                              v153 = 0u;
                              v50 = v41;
                              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
                              if (v51)
                              {
                                v52 = v51;
                                v53 = 0;
                                v133 = 0;
                                v54 = *(_QWORD *)v153;
                                do
                                {
                                  for (k = 0; k != v52; k = (char *)k + 1)
                                  {
                                    if (*(_QWORD *)v153 != v54)
                                      objc_enumerationMutation(v50);
                                    v56 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)k);
                                    if (v56)
                                    {
                                      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)k), "objectForKey:", CFSTR("target_power")));
                                      v58 = objc_msgSend(v57, "unsignedIntValue");

                                      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKey:", CFSTR("antenna_num")));
                                      v60 = objc_msgSend(v59, "unsignedIntValue");

                                      if ((_DWORD)v58)
                                      {
                                        v53 |= (unsigned __int16)(1 << ((_BYTE)v60 - 1));
                                        v61 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createPowerTableXpcElement:ant:target_power_dbm:condition_id:entry_num:](v130, "createPowerTableXpcElement:ant:target_power_dbm:condition_id:entry_num:", v136, v60, v58, v131, v124));

                                        if (v61)
                                        {
                                          xpc_array_append_value(v128, v61);
                                          v138 = v61;
                                        }
                                        else
                                        {
                                          v138 = 0;
                                        }
                                      }
                                      else
                                      {
                                        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v60));
                                        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "objectForKeyedSubscript:", v62));

                                        if (v63)
                                        {
                                          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v136));
                                          objc_msgSend(v63, "addObject:", v64);
                                          v133 = v63;
                                        }
                                        else
                                        {
                                          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
                                          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v136));
                                          objc_msgSend(v65, "addObject:", v66);

                                          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v60));
                                          v133 = v65;
                                          objc_msgSend(v126, "setObject:forKeyedSubscript:", v65, v64);
                                        }

                                        v53 |= 0x10000 << ((_BYTE)v60 - 1);
                                      }
                                    }
                                  }
                                  v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
                                }
                                while (v52);
                              }
                              else
                              {
                                v53 = 0;
                                v133 = 0;
                              }

                              p_isa = (id *)&v130->super.isa;
                              if (v122)
                              {
                                v33 = v117;
                                if (v121 && v53)
                                {
                                  if (v118 == -1)
                                    v67 = 8;
                                  else
                                    v67 = (v118 + 8);
                                  v68 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createConditionIdXpcElement:mav_antenna_block_client_id:cellular_band:cellular_frequency_upper:cellular_frequency_lower:cellular_ant_mitigation:](v130, "createConditionIdXpcElement:mav_antenna_block_client_id:cellular_band:cellular_frequency_upper:cellular_frequency_lower:cellular_ant_mitigation:", v131, v67, v136));

                                  if (v68)
                                  {
                                    xpc_array_append_value(object, v68);
                                    v138 = v68;
                                  }
                                  else
                                  {
                                    v138 = 0;
                                  }
                                }
                              }
                              else
                              {
                                v33 = v117;
                              }
                              j = v123;
                              ++v124;

                              v30 = v116;
                            }
                          }
                          v120 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
                        }
                        while (v120);
                      }

                      i = v111;
                    }
                  }
                  v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
                }
                while (v109);
              }

              v150 = 0u;
              v151 = 0u;
              v148 = 0u;
              v149 = 0u;
              v129 = v30;
              v127 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
              if (v127)
              {
                v125 = *(_QWORD *)v149;
                do
                {
                  v69 = 0;
                  v70 = v138;
                  v71 = v113;
                  do
                  {
                    v134 = v71;
                    v137 = v70;
                    if (*(_QWORD *)v149 != v125)
                      objc_enumerationMutation(v129);
                    v139 = v69;
                    v72 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v69);
                    v73 = objc_alloc_init((Class)NSMutableArray);
                    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", v72));
                    v144 = 0u;
                    v145 = 0u;
                    v146 = 0u;
                    v147 = 0u;
                    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v144, v176, 16);
                    v132 = v72;
                    if (v75)
                    {
                      v76 = v75;
                      v77 = 0;
                      v78 = *(_QWORD *)v145;
                      do
                      {
                        v79 = 0;
                        v80 = v77;
                        do
                        {
                          if (*(_QWORD *)v145 != v78)
                            objc_enumerationMutation(v74);
                          v175[0] = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)v79);
                          v174[0] = CFSTR("Cellular_Ant");
                          v174[1] = CFSTR("Cellular_Band_Array");
                          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:"));
                          v175[1] = v81;
                          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v175, v174, 2));

                          objc_msgSend(v73, "addObject:", v77);
                          v79 = (char *)v79 + 1;
                          v80 = v77;
                        }
                        while (v76 != v79);
                        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v144, v176, 16);
                      }
                      while (v76);
                    }
                    else
                    {
                      v77 = 0;
                    }
                    v172[0] = CFSTR("Block_Voice");
                    v172[1] = CFSTR("Duration_Granularity");
                    v173[0] = &off_100230780;
                    v173[1] = &off_100230798;
                    v172[2] = CFSTR("Policy");
                    v173[2] = v73;
                    v82 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v173, v172, 3));

                    p_isa = (id *)&v130->super.isa;
                    v113 = (void *)v82;
                    v83 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createAntennaBlockingClientXpcArray:client_id:convBand:](v130, "createAntennaBlockingClientXpcArray:client_id:convBand:", v82, objc_msgSend(v132, "unsignedIntValue") + 8, 0));

                    if (v83)
                      xpc_array_append_value(xarray, v83);

                    v69 = v139 + 1;
                    v70 = v83;
                    v71 = v113;
                  }
                  while ((id)(v139 + 1) != v127);
                  v138 = v83;
                  v127 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
                }
                while (v127);
              }

              v84 = xpc_copy(xarray);
              objc_msgSend(p_isa, "setMEurekaConfig:", v84);

              v85 = xpc_copy(object);
              objc_msgSend(p_isa, "setMMavCiConfig:", v85);

              v86 = xpc_copy(v128);
              objc_msgSend(p_isa, "setMMavPtConfig:", v86);

              v87 = xpc_array_create(0, 0);
              v140 = 0u;
              v141 = 0u;
              v142 = 0u;
              v143 = 0u;
              v88 = p_isa[4];
              v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v140, v171, 16);
              if (v89)
              {
                v90 = v89;
                v91 = 0;
                v92 = *(_QWORD *)v141;
                do
                {
                  for (m = 0; m != v90; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v141 != v92)
                      objc_enumerationMutation(v88);
                    v94 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)m);
                    if (v94)
                    {
                      v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)m), "objectForKey:", CFSTR("band")));

                      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectForKey:", CFSTR("cid")));
                      v97 = objc_msgSend(v96, "unsignedIntValue");

                      v98 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createSubframePowerBackOffTableXpcElement:condition_id:](v130, "createSubframePowerBackOffTableXpcElement:condition_id:", v95, v97));
                      if (v98)
                      {
                        xpc_array_append_value(v87, v98);
                        v138 = v98;
                      }
                      else
                      {
                        v138 = 0;
                      }
                      v91 = (void *)v95;
                    }
                  }
                  v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v140, v171, 16);
                }
                while (v90);
              }
              else
              {
                v91 = 0;
              }

              v100 = xpc_copy(v87);
              -[WCM_MavAntennaPolicy setMMavSfPboffConfig:](v130, "setMMavSfPboffConfig:", v100);

              -[WCM_MavAntennaPolicy createFaceIDpowerTablefromPlist](v130, "createFaceIDpowerTablefromPlist");
            }
            else
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create Mav Client Antenna Mappings from Plist: No antenna condition id policy Plist File Found"));
            }
            v10 = v103;
            v99 = v104;
          }
          else
          {
            v99 = v104;
          }

          v8 = v105;
          v9 = v138;
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create Mav ClientAntenna Mappings from Plist: No antenna blocking policy Plist File Found"));
          v113 = 0;
        }

        goto LABEL_120;
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create Client Mappings from Plist: Ant Block Policy: Platform %u is not supported"), v3);
    }
    v9 = 0;
    v113 = 0;
    v10 = 0;
LABEL_120:

    goto LABEL_121;
  }
LABEL_123:

}

- (void)createFaceIDpowerTablefromPlist
{
  uint64_t v3;
  void *v4;
  NSData *v5;
  void *v6;
  void *v7;
  id v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  xpc_object_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint64_t v41;
  _BYTE v42[128];

  v3 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy getFaceIDPlatformPlistName](self, "getFaceIDPlatformPlistName"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = sub_1000896B4(v3, (uint64_t)CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      v40 = 0;
      v41 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 2, &v41, &v40));
      v8 = v40;
      if (v7)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create FaceID power Tables from Plist: Face ID policy Plist File Found for device"));
        v9 = xpc_array_create(0, 0);
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Config")));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy getFaceIDConfigDictionarySKUBased:](self, "getFaceIDConfigDictionarySKUBased:", v10));
          v12 = v11;
          if (v11)
          {
            v30 = v10;
            v31 = v8;
            v32 = v7;
            v33 = v6;
            v34 = v4;
            v29 = v11;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Policy")));
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            if (v13)
            {
              v14 = v13;
              v15 = 0;
              v16 = *(_QWORD *)v37;
              do
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v37 != v16)
                    objc_enumerationMutation(obj);
                  v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
                  if (v18)
                  {
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("band")));
                    v20 = objc_msgSend(v19, "unsignedIntValue");

                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("target_power")));
                    v22 = objc_msgSend(v21, "unsignedIntValue");

                    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("antenna_num")));
                    v24 = objc_msgSend(v23, "unsignedIntValue");

                    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createFaceIDPowerTableXpcElement:ant:target_power_dbm:](self, "createFaceIDPowerTableXpcElement:ant:target_power_dbm:", v20, v24, v22));
                    if (v25)
                    {
                      if (!xpc_array_get_count(v9))
                      {
                        v26 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createFaceIDPowerTableXpcElement:ant:target_power_dbm:](self, "createFaceIDPowerTableXpcElement:ant:target_power_dbm:", 0, 0, 0));
                        if (v26)
                          xpc_array_append_value(v9, v26);

                      }
                      xpc_array_append_value(v9, v25);
                      v15 = v25;
                    }
                    else
                    {
                      v15 = 0;
                    }
                  }
                }
                v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
              }
              while (v14);
            }
            else
            {
              v15 = 0;
            }
            v6 = v33;
            v4 = v34;
            v12 = v29;
            if (xpc_array_get_count(v9))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createFaceIDPowerTableXpcElement:ant:target_power_dbm:](self, "createFaceIDPowerTableXpcElement:ant:target_power_dbm:", 244, 0, 0));
              if (v27)
                xpc_array_append_value(v9, v27);

            }
            v28 = xpc_copy(v9);
            -[WCM_MavAntennaPolicy setMMavFaceIdPtConfig:](self, "setMMavFaceIdPtConfig:", v28);

            v8 = v31;
            v7 = v32;
            v10 = v30;
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Face ID Policy Table not found for the SKU"));
            -[WCM_MavAntennaPolicy setMMavFaceIdPtConfig:](self, "setMMavFaceIdPtConfig:", 0);
          }

        }
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("create FaceID power Tables from Plist: No Face ID policy Plist File Found"));
      }

    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Face ID policy is not found for this platform"));
  }

}

- (void)sendFaceIDPowerTables
{
  void *v3;
  void *v4;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  xpc_object_t v10;
  int count;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  xpc_object_t value;
  void *v16;
  xpc_object_t v17;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  if (xdict)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavFaceIdPtConfig](self, "mMavFaceIdPtConfig"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellularController"));

      if (v5)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("sendFaceIDPowerTables"));
        v6 = xpc_array_create(0, 0);
        v7 = xpc_array_create(0, 0);
        if (v7)
        {
          v8 = v7;
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavFaceIdPtConfig](self, "mMavFaceIdPtConfig"));
          v10 = xpc_copy(v9);

          count = xpc_array_get_count(v10);
          if (count >= 1)
          {
            v12 = count;
            v13 = (count + 1);
            v14 = 1;
            do
            {
              value = xpc_array_get_value(v10, v14 - 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue(value);
              xpc_array_append_value(v6, v16);
              if (v12 == v14 || (v14 & 7) == 0)
              {
                xpc_dictionary_set_value(xdict, "kWCMCellularTransparentMessageInformationSet", v6);
                objc_msgSend(v5, "sendMessage:withArgs:", 1223, xdict);
                v17 = xpc_array_create(0, 0);

                v6 = v17;
              }

              ++v14;
            }
            while (v13 != v14);
          }
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("create FaceID Power Tables failed due controller being NULL"));
      }

    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Baseband FaceID config is null"));
    }
  }

}

- (void)sendMavConfigitems
{
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  void *v21;
  xpc_object_t v22;
  xpc_object_t v23;
  size_t v24;
  xpc_object_t value;
  void *v26;
  xpc_object_t v27;
  xpc_object_t v28;
  void *v29;
  xpc_object_t v30;
  xpc_object_t v31;
  size_t v32;
  xpc_object_t v33;
  void *v34;
  xpc_object_t v35;
  xpc_object_t v36;
  void *v37;
  xpc_object_t v38;
  xpc_object_t v39;
  size_t v40;
  xpc_object_t v41;
  void *v42;
  xpc_object_t v43;
  void *v44;
  void *v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  void *v49;
  xpc_object_t xdict;

  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    xdict = v3;
    v4 = xpc_dictionary_create(0, 0, 0);
    if (!v4)
    {
LABEL_36:

      v3 = xdict;
      goto LABEL_37;
    }
    v5 = xpc_dictionary_create(0, 0, 0);
    if (!v5)
    {
LABEL_35:

      goto LABEL_36;
    }
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mEurekaConfig](self, "mEurekaConfig"));
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavCiConfig](self, "mMavCiConfig"));
        if (v9)
        {
          v10 = (void *)v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavPtConfig](self, "mMavPtConfig"));

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellularController"));

            if (v13)
            {
              v14 = xpc_dictionary_create(0, 0, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mEurekaConfig](self, "mEurekaConfig"));
              v16 = xpc_copy(v15);

              xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_ClientInformationSet", v16);
              objc_msgSend(v13, "sendMessage:withArgs:", 1224, v4);
              v17 = xpc_dictionary_create(0, 0, 0);
              if (v17)
              {
                v47 = v16;
                v48 = v6;
                v18 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createConditionIdXpcElement:mav_antenna_block_client_id:cellular_band:cellular_frequency_upper:cellular_frequency_lower:cellular_ant_mitigation:](self, "createConditionIdXpcElement:mav_antenna_block_client_id:cellular_band:cellular_frequency_upper:cellular_frequency_lower:cellular_ant_mitigation:", 0, 0, 0, 0, 0, 0));
                v19 = xpc_array_create(0, 0);
                v45 = v18;
                xpc_array_append_value(v19, v18);
                v44 = v19;
                xpc_dictionary_set_value(v17, "kWCMCellularTransparentMessageInformationSet", v19);
                v49 = v13;
                v46 = v17;
                objc_msgSend(v13, "sendMessage:withArgs:", 1223, v17);
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Sending CID config params"));
                v20 = xpc_array_create(0, 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavCiConfig](self, "mMavCiConfig"));
                v22 = xpc_copy(v21);

                v23 = xpc_array_create(0, 0);
                if (xpc_array_get_count(v22))
                {
                  v24 = 0;
                  do
                  {
                    value = xpc_array_get_value(v22, v24);
                    v26 = (void *)objc_claimAutoreleasedReturnValue(value);
                    xpc_array_append_value(v23, v26);
                    if (((v24 + 1) & 7) == 0 || v24 + 1 == xpc_array_get_count(v22))
                    {
                      xpc_dictionary_set_value(v5, "kWCMCellularTransparentMessageInformationSet", v23);
                      objc_msgSend(v49, "sendMessage:withArgs:", 1223, v5);
                      v27 = xpc_array_create(0, 0);

                      v23 = v27;
                    }

                    ++v24;
                  }
                  while (xpc_array_get_count(v22) > v24);
                }
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Sending CID Pboff params"));
                v28 = xpc_array_create(0, 0);
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavPtConfig](self, "mMavPtConfig"));
                v30 = xpc_copy(v29);

                v31 = xpc_array_create(0, 0);
                if (xpc_array_get_count(v30))
                {
                  v32 = 0;
                  do
                  {
                    v33 = xpc_array_get_value(v30, v32);
                    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                    xpc_array_append_value(v31, v34);
                    if (((v32 + 1) & 7) == 0 || v32 + 1 == xpc_array_get_count(v30))
                    {
                      xpc_dictionary_set_value(xdict, "kWCMCellularTransparentMessageInformationSet", v31);
                      objc_msgSend(v49, "sendMessage:withArgs:", 1223, xdict);
                      v35 = xpc_array_create(0, 0);

                      v31 = v35;
                    }

                    ++v32;
                  }
                  while (xpc_array_get_count(v30) > v32);
                }
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Sending SF Pboff params"));
                v36 = xpc_array_create(0, 0);
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy mMavSfPboffConfig](self, "mMavSfPboffConfig"));
                v38 = xpc_copy(v37);

                v39 = xpc_array_create(0, 0);
                if (xpc_array_get_count(v38))
                {
                  v40 = 0;
                  do
                  {
                    v41 = xpc_array_get_value(v38, v40);
                    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
                    xpc_array_append_value(v39, v42);
                    if (((v40 + 1) & 7) == 0 || v40 + 1 == xpc_array_get_count(v38))
                    {
                      xpc_dictionary_set_value(v48, "kWCMCellularTransparentMessageInformationSet", v39);
                      objc_msgSend(v49, "sendMessage:withArgs:", 1223, v48);
                      v43 = xpc_array_create(0, 0);

                      v39 = v43;
                    }

                    ++v40;
                  }
                  while (xpc_array_get_count(v38) > v40);
                }
                -[WCM_MavAntennaPolicy sendFaceIDPowerTables](self, "sendFaceIDPowerTables");

                v6 = v48;
                v13 = v49;
                v17 = v46;
                v16 = v47;
              }

            }
            else
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("create Mav ClientMappings failed due controller being NULL"));
            }

            goto LABEL_34;
          }
        }
        else
        {

        }
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Baseband eur config is null"));
    }
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:

}

- (id)createAntennaBlockingClientXpcArray:(id)a3 client_id:(int)a4 convBand:(unsigned __int8)a5
{
  int v5;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  unsigned int v37;
  id v38;
  int v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  id v44;
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

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (!v8
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Block_Voice"))),
        v11 = objc_msgSend(v10, "BOOLValue"),
        v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Duration_Granularity"))),
        v13 = objc_msgSend(v12, "unsignedIntValue"),
        v12,
        (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Policy")))) == 0))
  {
    v34 = 0;
    v15 = 0;
    v33 = 0;
    goto LABEL_25;
  }
  v37 = v11;
  v38 = v8;
  v51 = 0u;
  v52 = 0u;
  v36 = v13;
  v49 = 0u;
  v50 = 0u;
  obj = v14;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  v15 = 0;
  if (!v44)
    goto LABEL_23;
  v43 = *(_QWORD *)v50;
  v40 = v9;
  v39 = v5;
  do
  {
    for (i = 0; i != v44; i = (char *)i + 1)
    {
      v17 = v15;
      if (*(_QWORD *)v50 != v43)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("Cellular_Ant")));
      v21 = objc_msgSend(v20, "unsignedIntValue");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("Cellular_Band_Array")));
      if (v5 != 1)
      {
        if (!v15)
          goto LABEL_21;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, v32);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21));
        v29 = v9;
        v30 = v15;
        goto LABEL_20;
      }
      v42 = v21;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v22 = v15;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v22);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[WCM_MavAntennaPolicy convertBandToEurBandId:](self, "convertBandToEurBandId:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j))));
            objc_msgSend(v19, "addObject:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v24);
      }

      v9 = v40;
      v5 = v39;
      if (v19)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v42));
        v29 = v40;
        v30 = v19;
LABEL_20:
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, v28);

      }
LABEL_21:

    }
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  }
  while (v44);
LABEL_23:
  v33 = obj;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", a4, v37, v36, v9));
  v8 = v38;
LABEL_25:

  return v34;
}

- (void)addXpcBandEntriesWithAnt:(unint64_t)a3 bandsToAddSet:(id)a4 bandArray:(id)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v7 = a4;
  v8 = a5;
  v9 = xpc_array_create(0, 0);
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = xpc_uint64_create(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), "unsignedIntValue", (_QWORD)v18));
          xpc_array_append_value(v9, v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = xpc_dictionary_create(0, 0, 0);
    v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_value(v16, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v9);
      xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", a3);
      xpc_array_append_value(v8, v17);
    }

  }
}

- (id)createXpcClientObjectWithClientId:(int)a3 blockVoice:(BOOL)a4 timeMultipler:(unint64_t)a5 antennaBandMappings:(id)a6
{
  id v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  void *v23;
  id v24;
  xpc_object_t v26;
  xpc_object_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v10 = a6;
  v11 = xpc_dictionary_create(0, 0, 0);
  if (v11)
  {
    v12 = xpc_uint64_create(a3);
    xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_ClientId", v12);
    v13 = xpc_BOOL_create(a4);
    xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_BlockVoice", v13);
    v14 = xpc_uint64_create(a5);
    xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_TimeMultiplier", v14);
    v15 = xpc_array_create(0, 0);
    if (v15)
    {
      v26 = v13;
      v27 = v12;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v28 = v10;
      v16 = v10;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v22 = objc_msgSend(v21, "unsignedLongValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v21));
            -[WCM_MavAntennaPolicy addXpcBandEntriesWithAnt:bandsToAddSet:bandArray:](self, "addXpcBandEntriesWithAnt:bandsToAddSet:bandArray:", v22, v23, v15);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v18);
      }

      xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_BandInformationSet", v15);
      v24 = v11;
      v12 = v27;
      v10 = v28;
      v13 = v26;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)createHardcodedWifiClientMappings
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
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
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeCoexFeatures"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. createHardcodedWifiClientMappings"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller createHardcodedWifiClientMappings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformManager"));
  v7 = objc_msgSend(v6, "wrmPlatformId");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((v7 & 0xFFFFFFFC) == 0x10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    objc_msgSend(v12, "addObject:", &off_1002307B0);

    if (v7 == 17)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v15));
      objc_msgSend(v16, "addObject:", &off_1002307C8);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v17));
      objc_msgSend(v18, "addObject:", &off_1002307E0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v19));
      v21 = v20;
      v22 = &off_1002307F8;
LABEL_13:
      objc_msgSend(v20, "addObject:", v22);
      goto LABEL_14;
    }
  }
  if ((v7 & 0xFFFFFFFD) == 0x10)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v25));
    objc_msgSend(v26, "addObject:", &off_100230810);

  }
  switch(v7)
  {
    case 0x92u:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 4));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, v28);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 4));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v19));
      v21 = v20;
      v22 = &off_1002307B0;
      goto LABEL_13;
    case 0x90u:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 6));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, v30);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 6));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v19));
      v21 = v20;
      v22 = &off_100230828;
      goto LABEL_13;
    case 0x13u:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 3));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v21);
LABEL_14:

      break;
  }
  return v8;
}

- (id)createDynamicAntBlockingWifiClientMappingsWithCellAntBlkEnableIdx1:(unsigned __int8)a3 cellAntBlkEnableIdx2:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
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

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeCoexFeatures"));
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v8 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. createN79MitigationWifiClientMappingsWithCellAntBlkEnableIdx1"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  v9 = v4;
  v10 = v5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller createN79MitigationWifiClientMappings idx1: %d and idx2: %d"), v5, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platformManager"));
  objc_msgSend(v12, "wrmPlatformId");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v16));
  objc_msgSend(v17, "addObject:", &off_1002307B0);

  if (v4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v20));
    objc_msgSend(v21, "addObject:", &off_1002307B0);

  }
  return v13;
}

- (id)createHardcodedRc1ClientMappings
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
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
  void *v22;
  void *v23;
  _UNKNOWN **v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeCoexFeatures"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. createHardcodedRc1ClientMappings"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller createHardcodedRc1ClientMappings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformManager"));
  v7 = objc_msgSend(v6, "wrmPlatformId");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((v7 & 0xFFFFFFFC) == 0x10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    objc_msgSend(v12, "addObject:", &off_1002307B0);

    if (v7 == 17)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v15));
      objc_msgSend(v16, "addObject:", &off_100230840);

LABEL_10:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 4));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, v28);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 4));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v21));
      v23 = v22;
      v24 = &off_100230870;
      goto LABEL_11;
    }
  }
  switch(v7)
  {
    case 0x12u:
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v26);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v21));
      v23 = v22;
      v24 = &off_100230840;
      goto LABEL_11;
    case 0x10u:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v19));
      objc_msgSend(v20, "addObject:", &off_100230840);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v21));
      v23 = v22;
      v24 = &off_100230858;
LABEL_11:
      objc_msgSend(v22, "addObject:", v24);

      return v8;
    case 0x11u:
      goto LABEL_10;
  }
  return v8;
}

- (id)createHardcodedFcamClientMappings
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeCoexFeatures"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. createHardcodedFcamClientMappings"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller createHardcodedFcamClientMappings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformManager"));
  v7 = objc_msgSend(v6, "wrmPlatformId");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  switch(v7)
  {
    case 0x10u:
    case 0x11u:
    case 0x13u:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
      objc_msgSend(v12, "addObject:", &off_1002307B0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
      v15 = v14;
      v16 = &off_100230888;
      goto LABEL_6;
    case 0x12u:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v24);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
      v15 = v14;
      v16 = &off_1002307B0;
      goto LABEL_6;
    case 0x16u:
    case 0x17u:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v19));
      objc_msgSend(v20, "addObject:", &off_1002307B0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v21));
      objc_msgSend(v22, "addObject:", &off_100230888);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
      v15 = v14;
      v16 = &off_100230870;
LABEL_6:
      objc_msgSend(v14, "addObject:", v16);

      break;
    default:
      return v8;
  }
  return v8;
}

- (id)createHardcodedFidClientMappings
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeCoexFeatures"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. createHardcodedFidClientMappings"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller createHardcodedFidClientMappings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformManager"));
  v7 = objc_msgSend(v6, "wrmPlatformId");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v7 == 23 || v7 == 16)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    objc_msgSend(v12, "addObject:", &off_100230858);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
    objc_msgSend(v14, "addObject:", &off_100230840);

  }
  return v8;
}

- (id)createHardcodedJpgRegClientMappings
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeCoexFeatures"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. createHardcodedJpgRegClientMappings"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller createHardcodedJpgRegClientMappings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformManager"));
  v7 = objc_msgSend(v6, "wrmPlatformId");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v7 == 146)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 6));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    objc_msgSend(v12, "addObject:", &off_100230888);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
    objc_msgSend(v14, "addObject:", &off_100230870);

  }
  return v8;
}

- (void)reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1:(unsigned __int8)a3 cellAntBlkEnableIdx2:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  xpc_object_t v14;
  xpc_object_t v15;
  uint64_t v16;
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

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeCoexFeatures"));
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING"));

  if ((v9 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1"));
    objc_exception_throw(objc_retainAutorelease(NSInternalInconsistencyException));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller reconfigure antenna blocking to cellAntBlkEnableIdx1 %d and cellAntBlkEnableIdx2 %d"), v5, v4);
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platformManager"));
  v13 = objc_msgSend(v12, "wrmPlatformId");

  v14 = xpc_dictionary_create(0, 0, 0);
  if (v14)
  {
    v15 = xpc_array_create(0, 0);
    if (v15)
    {
      if (v13 == 25)
        v16 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createDynamicAntBlockingWifiClientMappingsWithCellAntBlkEnableIdx1:cellAntBlkEnableIdx2:](self, "createDynamicAntBlockingWifiClientMappingsWithCellAntBlkEnableIdx1:cellAntBlkEnableIdx2:", v5, v4));
      else
        v16 = objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createHardcodedWifiClientMappings](self, "createHardcodedWifiClientMappings"));
      v30 = (void *)v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 0, 0, 250, v16));
      if (v17)
        xpc_array_append_value(v15, v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createHardcodedRc1ClientMappings](self, "createHardcodedRc1ClientMappings"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 1, 1, 250));
      if (v18)
        xpc_array_append_value(v15, v18);
      v31 = v10;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createHardcodedFcamClientMappings](self, "createHardcodedFcamClientMappings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 2, 1, 250));
      if (v19)
        xpc_array_append_value(v15, v19);
      v29 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createHardcodedFidClientMappings](self, "createHardcodedFidClientMappings"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 3, 1, 250, v20));
      if (v21)
        xpc_array_append_value(v15, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createHardcodedJpgRegClientMappings](self, "createHardcodedJpgRegClientMappings"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 2, 0, 250, v22));
      if (v23)
        xpc_array_append_value(v15, v23);
      xpc_dictionary_set_value(v14, "kWCMCellularSetAntBlocking_ClientInformationSet", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("cellular controller final args: %@"), v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cellularController"));

      objc_msgSend(v26, "sendMessage:withArgs:", 1221, v14);
      v10 = v31;
    }

  }
  objc_autoreleasePoolPop(v10);
}

- (id)createConditionIdXpcElement:(unsigned int)a3 mav_antenna_block_client_id:(unsigned int)a4 cellular_band:(unsigned int)a5 cellular_frequency_upper:(unsigned int)a6 cellular_frequency_lower:(unsigned int)a7 cellular_ant_mitigation:(unsigned int)a8
{
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  uint64_t i;
  xpc_object_t v20;
  uint64_t j;
  xpc_object_t v22;
  uint64_t k;
  xpc_object_t v24;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;

  v28 = a8;
  v13 = xpc_array_create(0, 0);
  v14 = xpc_dictionary_create(0, 0, 0);
  v15 = xpc_uint64_create(0xAuLL);
  v26 = 1000 * a6;
  v27 = 1000 * a7;
  v16 = xpc_uint64_create(a3);
  xpc_array_append_value(v13, v16);

  v17 = xpc_uint64_create(a4);
  xpc_array_append_value(v13, v17);

  v18 = xpc_uint64_create(a5);
  xpc_array_append_value(v13, v18);

  for (i = 0; i != 4; ++i)
  {
    v20 = xpc_uint64_create(*((unsigned __int8 *)&v26 + i));
    xpc_array_append_value(v13, v20);

  }
  for (j = 0; j != 4; ++j)
  {
    v22 = xpc_uint64_create(*((unsigned __int8 *)&v27 + j));
    xpc_array_append_value(v13, v22);

  }
  for (k = 0; k != 4; ++k)
  {
    v24 = xpc_uint64_create(*((unsigned __int8 *)&v28 + k));
    xpc_array_append_value(v13, v24);

  }
  xpc_dictionary_set_value(v14, "kWCMCellularTransparentMessage_Type", v15);
  xpc_dictionary_set_value(v14, "kWCMCellularTransparentMessage_ByteList", v13);

  return v14;
}

- (id)createPowerTableXpcElement:(unsigned int)a3 ant:(unsigned int)a4 target_power_dbm:(unsigned int)a5 condition_id:(unsigned int)a6 entry_num:(unsigned int)a7
{
  unsigned __int8 v7;
  unsigned __int8 v8;
  char v9;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = xpc_array_create(0, 0);
  v13 = xpc_dictionary_create(0, 0, 0);
  v14 = xpc_uint64_create(0xBuLL);
  v15 = xpc_uint64_create(a3);
  xpc_array_append_value(v12, v15);

  v16 = xpc_uint64_create(a4);
  xpc_array_append_value(v12, v16);

  v17 = xpc_uint64_create(2 * ((5 * v9) & 0x7Fu));
  xpc_array_append_value(v12, v17);

  v18 = xpc_uint64_create(v8);
  xpc_array_append_value(v12, v18);

  v19 = xpc_uint64_create(v7);
  xpc_array_append_value(v12, v19);

  xpc_dictionary_set_value(v13, "kWCMCellularTransparentMessage_Type", v14);
  xpc_dictionary_set_value(v13, "kWCMCellularTransparentMessage_ByteList", v12);

  return v13;
}

- (id)createFaceIDPowerTableXpcElement:(unsigned int)a3 ant:(unsigned int)a4 target_power_dbm:(unsigned int)a5
{
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;

  v8 = xpc_array_create(0, 0);
  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = xpc_uint64_create(0xDuLL);
  v11 = xpc_uint64_create(a3);
  xpc_array_append_value(v8, v11);

  v12 = xpc_uint64_create(a4);
  xpc_array_append_value(v8, v12);

  v13 = xpc_uint64_create(a5);
  xpc_array_append_value(v8, v13);

  xpc_dictionary_set_value(v9, "kWCMCellularTransparentMessage_Type", v10);
  xpc_dictionary_set_value(v9, "kWCMCellularTransparentMessage_ByteList", v8);

  return v9;
}

- (id)createSubframePowerBackOffTableXpcElement:(id)a3 condition_id:(unsigned int)a4
{
  unsigned __int8 v4;
  id v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  v4 = a4;
  v6 = a3;
  v7 = xpc_array_create(0, 0);
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = xpc_uint64_create(0xCuLL);
  v10 = xpc_uint64_create(v4);
  xpc_array_append_value(v7, v10);

  LOBYTE(v10) = -[WCM_MavAntennaPolicy convertBandToEurBandId:](self, "convertBandToEurBandId:", v6);
  v11 = xpc_uint64_create(v10);
  xpc_array_append_value(v7, v11);

  xpc_dictionary_set_value(v8, "kWCMCellularTransparentMessage_Type", v9);
  xpc_dictionary_set_value(v8, "kWCMCellularTransparentMessage_ByteList", v7);

  return v8;
}

- (int)convertBandToEurBandId:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n79")) & 1) != 0)
  {
    v4 = 202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n1")) & 1) != 0)
  {
    v4 = 182;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n77")) & 1) != 0)
  {
    v4 = 200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n78")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b1")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b38")) & 1) != 0)
  {
    v4 = 157;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b3")) & 1) != 0)
      goto LABEL_14;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n38")) & 1) != 0)
      goto LABEL_16;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b25")) & 1) != 0)
    {
      v4 = 144;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b7")) & 1) != 0)
    {
      v4 = 126;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n7")) & 1) != 0)
    {
      v4 = 186;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b40")) & 1) != 0)
    {
      v4 = 159;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b4")) & 1) != 0)
    {
      v4 = 123;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b42")) & 1) != 0)
    {
      v4 = 161;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n40")) & 1) != 0)
    {
      v4 = 219;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n38")) & 1) != 0)
    {
LABEL_16:
      v4 = 190;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n41")) & 1) != 0)
    {
      v4 = 191;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b41")) & 1) != 0)
    {
      v4 = 160;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n48")) & 1) != 0)
    {
      v4 = 222;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b48")) & 1) != 0)
    {
      v4 = 178;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n30")) & 1) != 0)
    {
      v4 = 227;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b30")) & 1) != 0)
    {
      v4 = 149;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n66")) & 1) != 0)
    {
      v4 = 194;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b66")) & 1) != 0)
    {
      v4 = 168;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n3")) & 1) != 0)
    {
      v4 = 184;
      goto LABEL_66;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b3")) & 1) != 0)
    {
LABEL_14:
      v4 = 122;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n70")) & 1) != 0)
    {
      v4 = 195;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b34")) & 1) != 0)
    {
      v4 = 153;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b2")) & 1) != 0)
    {
      v4 = 121;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n2")) & 1) != 0)
    {
      v4 = 183;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b5")) & 1) != 0)
    {
      v4 = 124;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("n18")) & 1) != 0)
    {
      v4 = 225;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b18")) & 1) != 0)
    {
      v4 = 137;
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("MavAntPolicy Plist Error: Unrecognized band in plist, rectify %@"), v3);
      v4 = 244;
    }
  }
LABEL_66:

  return v4;
}

- (OS_xpc_object)mEurekaConfig
{
  return self->_mEurekaConfig;
}

- (void)setMEurekaConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mEurekaConfig, a3);
}

- (OS_xpc_object)mMavCiConfig
{
  return self->_mMavCiConfig;
}

- (void)setMMavCiConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mMavCiConfig, a3);
}

- (NSMutableArray)mWifiCiConfig
{
  return self->_mWifiCiConfig;
}

- (void)setMWifiCiConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mWifiCiConfig, a3);
}

- (OS_xpc_object)mMavPtConfig
{
  return self->_mMavPtConfig;
}

- (void)setMMavPtConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mMavPtConfig, a3);
}

- (OS_xpc_object)mMavSfPboffConfig
{
  return self->_mMavSfPboffConfig;
}

- (void)setMMavSfPboffConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mMavSfPboffConfig, a3);
}

- (OS_xpc_object)mMavFaceIdPtConfig
{
  return self->_mMavFaceIdPtConfig;
}

- (void)setMMavFaceIdPtConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mMavFaceIdPtConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mMavFaceIdPtConfig, 0);
  objc_storeStrong((id *)&self->_mMavSfPboffConfig, 0);
  objc_storeStrong((id *)&self->_mMavPtConfig, 0);
  objc_storeStrong((id *)&self->_mWifiCiConfig, 0);
  objc_storeStrong((id *)&self->_mMavCiConfig, 0);
  objc_storeStrong((id *)&self->_mEurekaConfig, 0);
  objc_storeStrong((id *)&self->mFixedPbOffBands, 0);
  objc_storeStrong((id *)&self->mFixedAntClients, 0);
}

@end
