@implementation NFFelicaStateEvent

+ (id)decodeEvent:(id)a3
{
  return +[NFFelicaStateEvent decodeEvent:reverse:](NFFelicaStateEvent, "decodeEvent:reverse:", a3, 0);
}

+ (id)decodeEvent:(id)a3 reverse:(BOOL)a4
{
  id v4;
  NSMutableDictionary *v5;
  NSDateComponents *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unsigned __int8 *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  NSMutableDictionary *v26;
  void *v27;
  id v28;
  _BYTE *v29;
  uint64_t v30;
  id v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  id v35;
  id v36;
  unsigned __int8 *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  unsigned int *v42;
  uint64_t v43;
  int v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  id v51;
  unsigned __int8 *v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  unsigned __int8 *v60;
  void *v61;
  void *v62;
  void *v63;
  NSMutableArray *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *i;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  void *v73;
  _BYTE *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  unsigned __int16 *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  unsigned __int16 *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  _BYTE *v103;
  unsigned int v104;
  unsigned int v105;
  uint64_t v106;
  NSMutableDictionary *v107;
  id v108;
  id v109;
  id v110;
  unsigned int v111;
  void *v112;
  id v113;
  id v114;
  uint64_t v115;
  void *v116;
  NSDateComponents *v117;
  void *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  void *v122;
  char *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  NSMutableDictionary *v130;
  _BOOL4 v132;
  void *v133;
  id obj;
  uint64_t v135;
  id v136;
  uint64_t v137;
  NSMutableArray *v138;
  id v139;
  uint64_t v140;
  id v141;
  NSMutableDictionary *v142;
  unsigned int v143;
  uint64_t v144;
  NSDateComponents *v145;
  void *v146;
  NSMutableArray *v147;
  id v148;
  id v149;
  unsigned int v150;
  NSMutableArray *v151;
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
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];

  v132 = a4;
  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v138 = objc_opt_new(NSMutableArray);
  v147 = objc_opt_new(NSMutableArray);
  v133 = v4;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[NFTLV simpleTLVsWithTag:fromData:](NFTLV, "simpleTLVsWithTag:fromData:", 225, v4));
  v142 = v5;
  v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v171, 16);
  v6 = 0;
  v7 = 0;
  if (v136)
  {
    v143 = 255;
    v135 = *(_QWORD *)v165;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v165 != v135)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v137 = v8;
        v10 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v8);
        v160 = 0u;
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v139 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "children"));
        v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v160, v170, 16);
        if (v141)
        {
          v140 = *(_QWORD *)v161;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v161 != v140)
              {
                v12 = v11;
                objc_enumerationMutation(v139);
                v11 = v12;
              }
              v144 = v11;
              v13 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v11);
              if (objc_msgSend(v13, "tag") == 209)
              {
                v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                v15 = (unsigned __int8 *)objc_msgSend(v14, "bytes");

                v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *v15));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, CFSTR("NFServiceProviderID"));

              }
              if (objc_msgSend(v13, "tag") == 210)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "NF_asHexString"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, CFSTR("NFDPAN"));

              }
              v149 = v13;
              if (objc_msgSend(v13, "tag") == 219)
              {
                v19 = objc_msgSend(v13, "valueAsUnsignedShort");
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19 & 1));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("NFInStation"));

                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v19 >> 1) & 1));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, CFSTR("NFInStationShinkansen"));

              }
              if (objc_msgSend(v13, "tag") == 220)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "valueAsUnsignedShort")));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v22, CFSTR("NFTicketUsed"));

              }
              if (objc_msgSend(v13, "tag") == 221)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "valueAsUnsignedShort")));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("NFBlacklisted"));

                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "valueAsUnsignedShort")));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v24, CFSTR("NFRevoked"));

              }
              v25 = objc_msgSend(v13, "tag");
              if ((v25 & 0xFFFFFFFC) == 0xD4 || v25 - 216 <= 7 && ((1 << (v25 + 40)) & 0xC7) != 0)
              {
                if (objc_msgSend(v13, "tag") <= v143)
                {
                  v26 = objc_opt_new(NSMutableDictionary);

                  -[NSMutableArray addObject:](v138, "addObject:", v26);
                  v6 = 0;
                  v7 = v26;
                }
                v143 = objc_msgSend(v13, "tag");
              }
              if (objc_msgSend(v13, "tag") == 212)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v28 = objc_msgSend(v27, "length");

                if ((unint64_t)v28 >= 4)
                {
                  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                  v29 = objc_msgSend(v31, "bytes");

                  v30 = 0;
                  LODWORD(v31) = 0;
                  do
                  {
                    v31 = (id)((v29[v30] & 0xF) + 100 * (int)v31 + 10 * (v29[v30] >> 4));
                    ++v30;
                  }
                  while (v30 != 2);
                  v32 = v29[2];
                  v33 = v29[3];
                  if (!v6)
                    v6 = objc_opt_new(NSDateComponents);
                  -[NSDateComponents setYear:](v6, "setYear:", v31);
                  -[NSDateComponents setMonth:](v6, "setMonth:", (v32 & 0xF) + 10 * (v32 >> 4));
                  -[NSDateComponents setDay:](v6, "setDay:", (v33 & 0xF) + 10 * (v33 >> 4));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, CFSTR("NFTransactionDate"));
                  v13 = v149;
                }
              }
              if (objc_msgSend(v13, "tag") == 213)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v35 = objc_msgSend(v34, "length");

                if ((unint64_t)v35 >= 2)
                {
                  if (!v6)
                    v6 = objc_opt_new(NSDateComponents);
                  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                  v37 = (unsigned __int8 *)objc_msgSend(v36, "bytes");

                  v38 = (v37[1] & 0xF) + 10 * (v37[1] >> 4);
                  -[NSDateComponents setHour:](v6, "setHour:", (*v37 & 0xF) + 10 * (*v37 >> 4));
                  -[NSDateComponents setMinute:](v6, "setMinute:", v38);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, CFSTR("NFTransactionDate"));
                }
              }
              if (objc_msgSend(v13, "tag") == 214)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v40 = objc_msgSend(v39, "length");

                if ((unint64_t)v40 >= 5)
                {
                  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                  v42 = (unsigned int *)objc_msgSend(v41, "bytes");

                  v43 = bswap32(*v42);
                  v44 = *((unsigned __int8 *)v42 + 4);
                  if (v44 == 2)
                  {
                    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v43));
                    v46 = v7;
                    v47 = v45;
                    v48 = CFSTR("NFLoyaltyBalance");
                    goto LABEL_45;
                  }
                  if (v44 == 1)
                  {
                    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v43));
                    v46 = v7;
                    v47 = v45;
                    v48 = CFSTR("NFBalance");
LABEL_45:
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v47, v48);

                  }
                }
              }
              if (objc_msgSend(v13, "tag") == 215)
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v50 = objc_msgSend(v49, "length");

                if ((unint64_t)v50 >= 5)
                {
                  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                  v52 = (unsigned __int8 *)objc_msgSend(v51, "bytes");

                  v53 = (char)*v52;
                  v54 = (v52[1] << 16) & 0x80FFFFFF | ((v53 & 0x7F) << 24) | (v52[2] << 8) | v52[3];
                  if (v53 >= 0)
                    v55 = v54;
                  else
                    v55 = -v54;
                  v56 = v52[4];
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v55));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v57, CFSTR("NFAmount"));

                  v13 = v149;
                  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v56));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v58, CFSTR("NFAmountType"));

                }
              }
              v145 = v6;
              if (objc_msgSend(v13, "tag") == 216)
              {
                v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                v60 = (unsigned __int8 *)objc_msgSend(v59, "bytes");

                v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *v60));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v61, CFSTR("NFTransactionType"));

                v13 = v149;
                v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v60[1]));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v62, CFSTR("NFSectorCombination"));

                v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
                LODWORD(v60) = objc_msgSend(&off_1002FF8E8, "isEqualToNumber:", v63);

                if ((_DWORD)v60)
                {
                  v158 = 0u;
                  v159 = 0u;
                  v156 = 0u;
                  v157 = 0u;
                  v64 = v147;
                  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v156, v169, 16);
                  if (!v65)
                    goto LABEL_67;
                  v66 = v65;
                  v67 = *(_QWORD *)v157;
                  while (1)
                  {
                    for (i = 0; i != v66; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v157 != v67)
                        objc_enumerationMutation(v64);
                      v69 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)i);
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("NFServiceCode")));
                      if (objc_msgSend(v70, "isEqualToString:", CFSTR("0x090c")))
                      {

                      }
                      else
                      {
                        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("NFServiceCode")));
                        v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("0x090f"));

                        if (!v72)
                          continue;
                      }
                      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("NFBlockData")));
                      if ((unint64_t)objc_msgSend(v73, "length") >= 3)
                      {
                        v74 = objc_msgSend(objc_retainAutorelease(v73), "bytes");
                        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v74[1] >> 7));
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v75, CFSTR("NFSFBreakdown"));

                        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *v74 & 0x7F));
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v76, CFSTR("NFDeviceCode"));

                        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v74[2] & 0x7F));
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v77, CFSTR("NFPaymentType"));

                      }
                    }
                    v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v156, v169, 16);
                    if (!v66)
                    {
LABEL_67:

                      v5 = v142;
                      v13 = v149;
                      break;
                    }
                  }
                }
              }
              if (objc_msgSend(v13, "tag") == 217)
              {
                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v79 = objc_msgSend(v78, "length");

                if ((unint64_t)v79 >= 3)
                {
                  v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                  v81 = (unsigned __int16 *)objc_msgSend(v80, "bytes");

                  v82 = bswap32(*v81) >> 16;
                  v83 = *((unsigned __int8 *)v81 + 2);
                  v13 = v149;
                  if ((_DWORD)v82 || (_DWORD)v83)
                  {
                    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "value"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v84, CFSTR("NFStartStationData"));

                    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v82));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v85, CFSTR("NFStartStation"));

                    v13 = v149;
                    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v83));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v86, CFSTR("NFStartStationExt"));

                  }
                }
              }
              if (objc_msgSend(v13, "tag") == 218)
              {
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v88 = objc_msgSend(v87, "length");

                if ((unint64_t)v88 >= 3)
                {
                  v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                  v90 = (unsigned __int16 *)objc_msgSend(v89, "bytes");

                  v91 = bswap32(*v90) >> 16;
                  v92 = *((unsigned __int8 *)v90 + 2);
                  v13 = v149;
                  if ((_DWORD)v91 || (_DWORD)v92)
                  {
                    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "value"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v93, CFSTR("NFEndStationData"));

                    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v91));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v94, CFSTR("NFEndStation"));

                    v13 = v149;
                    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v92));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v95, CFSTR("NFEndStationExt"));

                  }
                }
              }
              if (objc_msgSend(v13, "tag") == 222)
              {
                v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v97 = objc_msgSend(v96, "mutableCopy");

                if ((int)objc_msgSend(v97, "length") <= 31)
                  objc_msgSend(v97, "increaseLengthBy:", (int)(32 - objc_msgSend(v97, "length")));
                v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
                if ((objc_msgSend(v98, "isEqualToNumber:", &off_1002FF900) & 1) == 0)
                {
                  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "NF_asHexString"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v99, CFSTR("NFTransactionID"));

                  v13 = v149;
                }

              }
              if (objc_msgSend(v13, "tag") == 223)
              {
                v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "valueAsUnsignedLong")));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v100, CFSTR("NFHistorySequenceNumber"));

              }
              if (objc_msgSend(v13, "tag") == 208)
              {
                v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                v150 = objc_msgSend(v101, "length");

                v102 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value")));
                v103 = objc_msgSend(v102, "bytes");

                v104 = *v103;
                if (*v103)
                {
                  if (v150)
                  {
                    v105 = 1;
                    v106 = 1;
                    do
                    {
                      v107 = objc_opt_new(NSMutableDictionary);
                      v108 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), *(unsigned __int16 *)&v103[v106]);
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v108, CFSTR("NFServiceCode"));

                      v109 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), *(unsigned __int16 *)&v103[v106 + 2]);
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v109, CFSTR("NFBlockNumber"));

                      v110 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v103[v106 + 4], 16);
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v110, CFSTR("NFBlockData"));

                      -[NSMutableArray addObject:](v147, "addObject:", v107);
                      if (v105 >= v104)
                        break;
                      v111 = v106 + 19;
                      v106 += 20;
                      ++v105;
                    }
                    while (v111 < v150);
                  }
                }
              }
              v6 = v145;
              v11 = v144 + 1;
              v5 = v142;
            }
            while ((id)(v144 + 1) != v141);
            v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v160, v170, 16);
          }
          while (v141);
        }

        v8 = v137 + 1;
      }
      while ((id)(v137 + 1) != v136);
      v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v171, 16);
    }
    while (v136);
  }

  v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID")));
  if (!v112 || !objc_msgSend(&off_1002FF8E8, "isEqualToNumber:", v112))
    goto LABEL_112;
  v146 = v112;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v151 = v147;
  v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
  if (!v113)
    goto LABEL_111;
  v114 = v113;
  v115 = *(_QWORD *)v153;
  do
  {
    v116 = 0;
    v148 = v114;
    do
    {
      v117 = v6;
      if (*(_QWORD *)v153 != v115)
        objc_enumerationMutation(v151);
      v118 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)v116);
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("NFServiceCode")));
      if (objc_msgSend(v119, "isEqualToString:", CFSTR("0x0088")))
      {

        v6 = v117;
      }
      else
      {
        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("NFServiceCode")));
        v121 = objc_msgSend(v120, "isEqualToString:", CFSTR("0x008b"));

        v6 = v117;
        if (!v121)
          goto LABEL_109;
      }
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("NFBlockData")));
      if ((unint64_t)objc_msgSend(v122, "length") >= 0xD)
      {
        v123 = (char *)objc_msgSend(objc_retainAutorelease(v122), "bytes");
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int16 *)(v123 + 11) | (v123[13] << 16)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v142, "setObject:forKeyedSubscript:", v124, CFSTR("NFBalance"));

        LODWORD(v124) = v123[8];
        v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v124 >> 4) & 1));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v142, "setObject:forKeyedSubscript:", v125, CFSTR("NFNotifyOnLowBalance"));

        v114 = v148;
        v126 = (v124 >> 5) & 1;
        v6 = v117;
        v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v126));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v142, "setObject:forKeyedSubscript:", v127, CFSTR("NFAllowBalanceUsageForCommute"));

      }
LABEL_109:
      v116 = (char *)v116 + 1;
    }
    while (v114 != v116);
    v114 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
  }
  while (v114);
LABEL_111:

  v5 = v142;
  v112 = v146;
LABEL_112:
  if (v132)
  {
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](v138, "reverseObjectEnumerator"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "allObjects"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v129, CFSTR("NFHistoryRecords"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v138, CFSTR("NFHistoryRecords"));
  }
  if (-[NSMutableArray count](v147, "count"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v147, CFSTR("NFBlocks"));
  v130 = v5;

  return v130;
}

+ (id)decodeProvider:(id)a3 service:(id)a4 blocks:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _BYTE *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  void *specific;
  uint64_t Logger;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  id v52;
  void *v54;
  uint64_t v55;
  void (*v56)(uint64_t, const char *, ...);
  objc_class *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  int v65;
  unsigned __int8 *v66;
  id v67;
  id v68;
  unint64_t v69;
  unsigned int v70;
  NSDateComponents *v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  unint64_t v78;
  unsigned int v79;
  unint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  const char *v84;
  const char *Name;
  const char *v86;
  const char *v87;
  id v88;
  uint8_t buf[4];
  int v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  int v96;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "isEqualToNumber:", &off_1002FF8E8) & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v32 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v36 = 45;
      if (isMetaClass)
        v36 = 43;
      v32(6, "%c[%{public}s %{public}s]:%i Unsupported provider", v36, ClassName, Name, 385);
    }
    v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v38 = NFSharedLogGetLogger(v37);
    v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(&v26->super.super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v39 = object_getClass(a1);
    if (class_isMetaClass(v39))
      v40 = 43;
    else
      v40 = 45;
    *(_DWORD *)buf = 67109890;
    v90 = v40;
    v91 = 2082;
    v92 = object_getClassName(a1);
    v93 = 2082;
    v94 = sel_getName(a2);
    v95 = 1024;
    v96 = 385;
    v29 = "%c[%{public}s %{public}s]:%i Unsupported provider";
    goto LABEL_35;
  }
  if (!v11)
  {
    v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v42 = NFLogGetLogger(v41);
    if (v42)
    {
      v43 = (void (*)(uint64_t, const char *, ...))v42;
      v44 = object_getClass(a1);
      v45 = class_isMetaClass(v44);
      v46 = object_getClassName(a1);
      v86 = sel_getName(a2);
      v47 = 45;
      if (v45)
        v47 = 43;
      v43(6, "%c[%{public}s %{public}s]:%i Missing data", v47, v46, v86, 390);
    }
    v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v49 = NFSharedLogGetLogger(v48);
    v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v49);
    if (!os_log_type_enabled(&v26->super.super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v50 = object_getClass(a1);
    if (class_isMetaClass(v50))
      v51 = 43;
    else
      v51 = 45;
    *(_DWORD *)buf = 67109890;
    v90 = v51;
    v91 = 2082;
    v92 = object_getClassName(a1);
    v93 = 2082;
    v94 = sel_getName(a2);
    v95 = 1024;
    v96 = 390;
    v29 = "%c[%{public}s %{public}s]:%i Missing data";
    goto LABEL_35;
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
  v13 = v12;
  if (!v12 || (v14 = objc_retainAutorelease(v12), v15 = objc_msgSend(v14, "bytes"), !objc_msgSend(v14, "length")))
  {
LABEL_8:

    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFLogGetLogger(v17);
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(a1);
      v21 = class_isMetaClass(v20);
      v22 = object_getClassName(a1);
      v84 = sel_getName(a2);
      v23 = 45;
      if (v21)
        v23 = 43;
      v19(6, "%c[%{public}s %{public}s]:%i Block not valid", v23, v22, v84, 395);
    }
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger(v24);
    v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(&v26->super.super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v27 = object_getClass(a1);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    *(_DWORD *)buf = 67109890;
    v90 = v28;
    v91 = 2082;
    v92 = object_getClassName(a1);
    v93 = 2082;
    v94 = sel_getName(a2);
    v95 = 1024;
    v96 = 395;
    v29 = "%c[%{public}s %{public}s]:%i Block not valid";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, &v26->super.super, OS_LOG_TYPE_DEFAULT, v29, buf, 0x22u);
LABEL_36:
    v52 = 0;
    goto LABEL_37;
  }
  v16 = 0;
  while (!v15[v16])
  {
    if (++v16 >= (unint64_t)objc_msgSend(v14, "length"))
      goto LABEL_8;
  }

  if (!objc_msgSend(v10, "isEqualToNumber:", &off_1002FF918))
  {
    v52 = 0;
    goto LABEL_38;
  }
  v26 = objc_opt_new(NSMutableDictionary);
  v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v55 = NFLogGetLogger(v54);
  if (v55)
  {
    v56 = (void (*)(uint64_t, const char *, ...))v55;
    v57 = object_getClass(a1);
    v58 = class_isMetaClass(v57);
    v59 = object_getClassName(a1);
    v87 = sel_getName(a2);
    v60 = 45;
    if (v58)
      v60 = 43;
    v56(6, "%c[%{public}s %{public}s]:%i Decoding green car block", v60, v59, v87, 401);
  }
  v61 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v62 = NFSharedLogGetLogger(v61);
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = object_getClass(a1);
    if (class_isMetaClass(v64))
      v65 = 43;
    else
      v65 = 45;
    *(_DWORD *)buf = 67109890;
    v90 = v65;
    v91 = 2082;
    v92 = object_getClassName(a1);
    v93 = 2082;
    v94 = sel_getName(a2);
    v95 = 1024;
    v96 = 401;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Decoding green car block", buf, 0x22u);
  }

  v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0)));
  v66 = (unsigned __int8 *)objc_msgSend(v88, "bytes");
  v67 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v66, 2);
  if ((objc_msgSend(v67, "NF_isZeroed") & 1) == 0)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v67, CFSTR("NFStartStationData"));
  v68 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v66 + 2, 2);

  if ((objc_msgSend(v68, "NF_isZeroed") & 1) == 0)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v68, CFSTR("NFEndStationData"));
  v69 = v66[4];
  v70 = v66[5];
  v71 = objc_opt_new(NSDateComponents);
  -[NSDateComponents setYear:](v71, "setYear:", (v69 >> 1) + 2000);
  -[NSDateComponents setMonth:](v71, "setMonth:", ((unint64_t)(v70 | ((_DWORD)v69 << 8)) >> 5) & 0xF);
  -[NSDateComponents setDay:](v71, "setDay:", v70 & 0x1F);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v71, CFSTR("NFPurchaseDate"));
  v72 = 0;
  LODWORD(v73) = 0;
  do
    v73 = v66[v72++ + 6] | ((_DWORD)v73 << 8);
  while ((_DWORD)v72 != 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (v73 >> 13) & 0x3F));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v74, CFSTR("NFMinuteSold"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (v73 >> 19) & 0x1F));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v75, CFSTR("NFHourSold"));

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 10 * v66[9]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v76, CFSTR("NFFare"));

  v77 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v66 + 12, 2);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v77, CFSTR("NFRefundStation"));

  v78 = v66[14];
  v79 = v66[15];
  v80 = v79 | ((_DWORD)v78 << 8);
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v79 & 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v81, CFSTR("NFTicketUsed"));

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (v80 >> 5) & 0x3F));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v82, CFSTR("NFRefundDay"));

  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v78 >> 3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v83, CFSTR("NFRefundMonth"));

  v52 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v26, CFSTR("NFGreenCarTicket"), 0);
LABEL_37:

LABEL_38:
  return v52;
}

+ (id)decodeLogEvent:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  unsigned __int8 *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  unsigned __int8 *v27;
  id v28;
  void *v29;
  id v30;
  unsigned int v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  BOOL v38;
  id v39;
  _UNKNOWN **v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *specific;
  uint64_t Logger;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  int v70;
  const char *v71;
  const char *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void (*v76)(uint64_t, const char *, ...);
  objc_class *v77;
  _BOOL4 v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  objc_class *v83;
  int v84;
  const char *v85;
  const char *v86;
  const char *v88;
  const char *Name;
  const char *v90;
  void *v91;
  uint64_t v94;
  void *v95;
  id v96;
  uint64_t v97;
  NSMutableDictionary *v98;
  void *obj;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  int v113;
  __int16 v114;
  const char *v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  int v119;
  __int16 v120;
  NSMutableDictionary *v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v91 = v3;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NFTLV simpleTLVsWithTag:fromData:](NFTLV, "simpleTLVsWithTag:fromData:", 225, v3));
  v98 = v4;
  v96 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
  if (v96)
  {
    v94 = *(_QWORD *)v109;
    v95 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v109 != v94)
          objc_enumerationMutation(v5);
        v97 = v6;
        v7 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v6);
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        obj = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children"));
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v105;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v105 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)i);
              v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
              if (v13)
              {
                v14 = (void *)v13;
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
                v16 = objc_msgSend(v15, "length");

                if (v16)
                {
                  v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%02x"), objc_msgSend(v12, "tag"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, v17);

                  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value")));
                  v20 = (unsigned __int8 *)objc_msgSend(v19, "bytes");

                  if (objc_msgSend(v12, "tag") == 216)
                  {
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
                    v22 = objc_msgSend(v21, "length");

                    if ((unint64_t)v22 >= 0xE
                      && (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value")),
                          v24 = ((_QWORD)objc_msgSend(v23, "length") << 32) - 0x900000000,
                          v23,
                          v24))
                    {
                      v25 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v20, v24 >> 32);
                      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "NF_asHexString"));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v26, CFSTR("AID"));

                      v27 = &v20[v24 >> 32];
                      v28 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v27, 8);
                      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "NF_asHexString"));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v29, CFSTR("IDM"));

                      v4 = v98;
                      v30 = objc_alloc((Class)NSString);
                      v31 = v27[8];
                      v20 = v27 + 8;
                      v32 = objc_msgSend(v30, "initWithFormat:", CFSTR("%02x"), v31);
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v32, CFSTR("Command Code"));

                    }
                    else
                    {
                      v4 = v98;
                    }
                  }
                  if (objc_msgSend(v12, "tag") == 217)
                  {
                    v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%02x"), *v20);
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v33, CFSTR("Success Response Code"));

                  }
                  if (objc_msgSend(v12, "tag") == 218)
                  {
                    v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%02x"), *v20);
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v34, CFSTR("External error no response"));

                  }
                  if (objc_msgSend(v12, "tag") == 219)
                  {
                    v35 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%02x"), *v20);
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v35, CFSTR("External error"));

                  }
                  if (objc_msgSend(v12, "tag") == 220)
                  {
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
                    v37 = objc_msgSend(v36, "length");

                    v38 = (unint64_t)v37 >= 9;
                    v4 = v98;
                    if (v38)
                    {
                      v39 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v20 + 1, 8);
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v39, CFSTR("Additional Debug Info"));

                    }
                  }

                }
              }
            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
          }
          while (v9);
        }

        v6 = v97 + 1;
        v5 = v95;
      }
      while ((id)(v97 + 1) != v96);
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
    }
    while (v96);
  }

  if (!-[NSMutableDictionary count](v4, "count"))
  {
    v40 = &AMFDRSealingMapCopyLocalData_ptr;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV simpleTLVsWithData:](NFTLV, "simpleTLVsWithData:", v91));

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v5 = v41;
    v42 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v100, v122, 16);
    if (!v42)
      goto LABEL_62;
    v43 = v42;
    v44 = *(_QWORD *)v101;
    while (1)
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(_QWORD *)v101 != v44)
          objc_enumerationMutation(v5);
        v46 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v46, "tag") == 129)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "asData"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "NF_asHexString"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v48, CFSTR("AID"));

        }
        if (objc_msgSend(v46, "tag") == 130)
        {
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "children"));
          if (v49)
          {
            v50 = (void *)v49;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "children"));
            v52 = objc_msgSend(v51, "count");

            if (v52)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "children"));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndexedSubscript:", 0));

              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "asData"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "NF_asHexString"));
              v4 = v98;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v56, CFSTR("Command Code"));
              goto LABEL_57;
            }
          }
          v57 = v40[225];
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "asData"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "simpleTLVsWithData:", v58));

          if (v54 && objc_msgSend(v54, "count"))
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v61 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(a1);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(a1);
              Name = sel_getName(a2);
              v65 = 45;
              if (isMetaClass)
                v65 = 43;
              v61(6, "%c[%{public}s %{public}s]:%i Found parameter event in sub data", v65, ClassName, Name, 730);
            }
            v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v67 = NFSharedLogGetLogger(v66);
            v68 = objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              v69 = object_getClass(a1);
              if (class_isMetaClass(v69))
                v70 = 43;
              else
                v70 = 45;
              v71 = object_getClassName(a1);
              v72 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v113 = v70;
              v114 = 2082;
              v115 = v71;
              v116 = 2082;
              v117 = v72;
              v118 = 1024;
              v119 = 730;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found parameter event in sub data", buf, 0x22u);
            }

            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", 0));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "asData"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "NF_asHexString"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v73, CFSTR("Command Code"));

            v4 = v98;
            v40 = &AMFDRSealingMapCopyLocalData_ptr;
LABEL_57:

          }
          else
          {
            v4 = v98;
          }

          continue;
        }
      }
      v43 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v100, v122, 16);
      if (!v43)
      {
LABEL_62:

        v74 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v75 = NFLogGetLogger(v74);
        if (v75)
        {
          v76 = (void (*)(uint64_t, const char *, ...))v75;
          v77 = object_getClass(a1);
          v78 = class_isMetaClass(v77);
          v88 = object_getClassName(a1);
          v90 = sel_getName(a2);
          v79 = 45;
          if (v78)
            v79 = 43;
          v4 = v98;
          v76(6, "%c[%{public}s %{public}s]:%i %{public}@", v79, v88, v90, 738, v98);
        }
        v80 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v81 = NFSharedLogGetLogger(v80);
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          v83 = object_getClass(a1);
          if (class_isMetaClass(v83))
            v84 = 43;
          else
            v84 = 45;
          v85 = object_getClassName(a1);
          v86 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v113 = v84;
          v114 = 2082;
          v115 = v85;
          v116 = 2082;
          v117 = v86;
          v118 = 1024;
          v119 = 738;
          v120 = 2114;
          v121 = v4;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
        }

        break;
      }
    }
  }

  return v4;
}

- (NFFelicaStateEvent)init
{
  NFFelicaStateEvent *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *stateEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFFelicaStateEvent;
  v2 = -[NFFelicaStateEvent init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    stateEvents = v2->_stateEvents;
    v2->_stateEvents = v3;

  }
  return v2;
}

- (void)addStateInfo:(id)a3 appletAID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v14);
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("NFAppletAID"));
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_stateEvents, "valueForKey:", v6));
  if (v8)
  {
    v9 = (NSMutableDictionary *)v8;
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("NFHistoryRecords"));
    -[NSMutableDictionary addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", CFSTR("NFHistoryRecords")));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("NFHistoryRecords")));
    v12 = (void *)v11;
    if (v10 && v11)
    {
      v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v11);
      objc_msgSend(v13, "addObjectsFromArray:", v10);
      if (!v13)
        goto LABEL_10;
    }
    else
    {
      if (!v11)
        goto LABEL_10;
      v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v11);
      if (!v13)
        goto LABEL_10;
    }
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v13, CFSTR("NFHistoryRecords"));

LABEL_10:
    goto LABEL_11;
  }
  v9 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](self->_stateEvents, "setObject:forKey:", v9, v6);
  -[NSMutableDictionary addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v7);
LABEL_11:

}

- (id)asDictionary
{
  return self->_stateEvents;
}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->_stateEvents, "count") == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateEvents, 0);
}

@end
