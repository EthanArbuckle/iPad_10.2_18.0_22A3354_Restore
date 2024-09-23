@implementation CBStackBLEScannerBTStack

- (void)_addUUIDIfNeeded:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6
{
  NSArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  signed int v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  char *v30;
  char *v31;
  __int128 v32;
  LeUuid *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v33 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = self->_discoveryArray;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v14 = (unint64_t)objc_msgSend(v13, "discoveryFlags", v33);
        v15 = (unint64_t)objc_msgSend(v13, "extraDiscoveryFlags") | v14;
        v16 = (v15 & a4) != 0;
        if (a5 && (v15 & a4) == 0)
          v16 = objc_msgSend(v13, "discoveryTypesContainTypes:", a5);
        if (v16)
        {
          self->_aggregateDiscoveryFlags |= v15;
          if (a5)
            CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, objc_msgSend(objc_retainAutorelease(v13), "discoveryTypesInternalPtr"));
          if ((v15 & 0x100000000000) == 0)
          {
            if ((v15 & 0x2000000000) != 0)
              self->_anyActiveScan = 1;
            if ((v15 & 0x200000000) != 0)
              self->_anyNeedsDups = 1;
            if ((v15 & 0x10000000000) != 0)
              self->_anyRangeScan = 1;
            v17 = objc_msgSend(v13, "bleScanRateOverride");
            if (!v17 && (self->_screenOn || (v17 = objc_msgSend(v13, "bleScanRateScreenOff")) == 0))
            {
              v17 = objc_msgSend(v13, "bleScanRate");
              if (!v17)
                self->_scanRateAnyDefault = 1;
            }
            if (v17 > self->_scanRateHighest)
              self->_scanRateHighest = v17;
            v18 = *((_QWORD *)a6 + 2);
            v19 = *((_QWORD *)a6 + 1);
            if (v19 >= v18)
            {
              v22 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - *(_QWORD *)a6) >> 2);
              v23 = v22 + 1;
              if (v22 + 1 > 0xCCCCCCCCCCCCCCCLL)
                abort();
              v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - *(_QWORD *)a6) >> 2);
              if (2 * v24 > v23)
                v23 = 2 * v24;
              if (v24 >= 0x666666666666666)
                v25 = 0xCCCCCCCCCCCCCCCLL;
              else
                v25 = v23;
              if (v25)
                v26 = (char *)sub_1000B58EC((uint64_t)a6 + 16, v25);
              else
                v26 = 0;
              v27 = &v26[20 * v22];
              v28 = &v26[20 * v25];
              v29 = *(_OWORD *)&v33->var0.var0;
              *((_DWORD *)v27 + 4) = *(_DWORD *)&v33->var0.var1.var2[12];
              *(_OWORD *)v27 = v29;
              v21 = v27 + 20;
              v31 = *(char **)a6;
              v30 = (char *)*((_QWORD *)a6 + 1);
              if (v30 != *(char **)a6)
              {
                do
                {
                  v32 = *(_OWORD *)(v30 - 20);
                  *((_DWORD *)v27 - 1) = *((_DWORD *)v30 - 1);
                  *(_OWORD *)(v27 - 20) = v32;
                  v27 -= 20;
                  v30 -= 20;
                }
                while (v30 != v31);
                v30 = *(char **)a6;
              }
              *(_QWORD *)a6 = v27;
              *((_QWORD *)a6 + 1) = v21;
              *((_QWORD *)a6 + 2) = v28;
              if (v30)
                operator delete(v30);
            }
            else
            {
              v20 = *(_OWORD *)&v33->var0.var0;
              *(_DWORD *)(v19 + 16) = *(_DWORD *)&v33->var0.var1.var2[12];
              *(_OWORD *)v19 = v20;
              v21 = (char *)(v19 + 20);
            }
            *((_QWORD *)a6 + 1) = v21;
            goto LABEL_46;
          }
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_46:

}

- (void)_addTypeIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  uint64_t v8;
  int v9;
  id v10;
  char v11;
  char v12;
  BOOL v14;
  void *i;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  char v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  BOOL v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *suppressedOobKeys;
  NSMutableDictionary *v40;
  NSMutableDictionary *suppressedDeviceFilter;
  void *v42;
  NSMutableDictionary *v43;
  void *v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  NSMutableDictionary *v54;
  void *v55;
  NSMutableDictionary *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  int v61;
  int v62;
  BOOL v63;
  signed int v64;
  uint64_t v65;
  void *v66;
  char v67;
  __CFString *v68;
  NSUInteger v69;
  id v70;
  char v71;
  char v72;
  uint64_t j;
  uint64_t k;
  char v75;
  unsigned int *v76;
  NSUInteger v77;
  id v78;
  int v79;
  uint64_t v80;
  void *m;
  void *v82;
  char v83;
  unsigned int v84;
  void *v85;
  void *v86;
  char v87;
  id v88;
  id v89;
  char v90;
  char v91;
  int v92;
  BOOL v93;
  uint64_t v94;
  NSData *v95;
  NSData *v96;
  BOOL v98;
  char v99;
  uint64_t v100;
  void *v101;
  id v102;
  char v103;
  unsigned int v104;
  char v105;
  BOOL v106;
  NSArray *obj;
  NSArray *obja;
  uint64_t v109;
  char v110;
  char v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t (**v117)();
  unsigned int *v118;
  uint64_t (**v119)();
  unsigned int *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  uint64_t v126;
  _QWORD v127[2];
  uint64_t v128;
  _QWORD v129[2];
  _BYTE v130[128];

  v104 = a3;
  v8 = sub_100027F68();
  v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 888))(v8);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = self->_discoveryArray;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
  if (!v10)
  {

    v95 = 0;
    v96 = 0;
    v66 = 0;
    goto LABEL_181;
  }
  v92 = v9;
  v93 = 0;
  v11 = 0;
  v100 = 0;
  v101 = 0;
  v12 = 0;
  v103 = 0;
  v95 = 0;
  v96 = 0;
  v94 = 0;
  v109 = *(_QWORD *)v122;
  v14 = (a4 & 0x40000) == 0 || v104 != 19;
  v105 = 0;
  v106 = 1;
  v98 = v14;
  v99 = 1;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v122 != v109)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
      v17 = (unint64_t)objc_msgSend(v16, "discoveryFlags");
      v18 = (unint64_t)objc_msgSend(v16, "extraDiscoveryFlags") | v17;
      v19 = (v18 & a4) != 0;
      if (a5 && (v18 & a4) == 0)
        v19 = (uint64_t)objc_msgSend(v16, "discoveryTypesContainTypes:", a5);
      if ((_DWORD)v19)
      {
        self->_aggregateDiscoveryFlags |= v18;
        if (a5)
          v19 = CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, objc_msgSend(objc_retainAutorelease(v16), "discoveryTypesInternalPtr"));
        if ((v18 & 0x100000000000) == 0)
        {
          switch(v104)
          {
            case 0xFu:
              if ((v18 & 0x2000000) != 0)
              {
                if ((v94 & 0x100000000) != 0)
                {
                  BYTE4(v94) = 1;
                }
                else
                {
                  v51 = objc_retainAutorelease(v16);
                  if ((*(_BYTE *)objc_msgSend(v51, "discoveryTypesInternalPtr") & 4) != 0)
                  {
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "deviceFilter"));
                    v53 = objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _deviceFilterUUIDs:](self, "_deviceFilterUUIDs:", v52));

                    BYTE4(v94) = 1;
                    v101 = (void *)v53;
                  }
                  else
                  {
                    BYTE4(v94) = 0;
                  }
                }
                if (!v95)
                {
                  if ((id)-[NSData length](self->_selfAuthTagNonConnectable, "length") == (id)3
                    && (*((_BYTE *)objc_msgSend(objc_retainAutorelease(v16), "discoveryTypesInternalPtr") + 1) & 0x40) != 0)
                  {
                    v95 = self->_selfAuthTagNonConnectable;
                  }
                  else
                  {
                    v95 = 0;
                  }
                }
              }
              goto LABEL_55;
            case 0x13u:
              v20 = objc_msgSend(v16, "bleRSSIThresholdOrder");
              v93 = (char)objc_msgSend(v16, "bleRSSIThresholdOrder") < 0;
              LODWORD(v94) = (v20 >> 2) & 1;
              goto LABEL_55;
            case 0x15u:
              if ((v18 & 0x2000000400020108) == 0
                && !objc_msgSend(v16, "discoveryTypesContainTypes:", CBDiscoveryTypesNearbyActionV2(v19)))
              {
                goto LABEL_55;
              }
              if (v96)
                continue;
              if ((id)-[NSData length](self->_selfAuthTag, "length") == (id)3)
              {
                v96 = self->_selfAuthTag;
                goto LABEL_55;
              }
              v96 = 0;
              continue;
            case 0x16u:
              v21 = objc_retainAutorelease(v16);
              v22 = *((_BYTE *)objc_msgSend(v21, "discoveryTypesInternalPtr") + 2);
              v102 = objc_retainAutorelease(v21);
              LOBYTE(v100) = ((v22 & 0x40 | *(_BYTE *)objc_msgSend(v102, "discoveryTypesInternalPtr") & 0x10) != 0) | v100;
              if ((self->_aggregateDiscoveryFlags & 0x40000) != 0)
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "oobKeys"));
                v37 = v36 == 0;

                if (v37)
                  goto LABEL_55;
                if (!self->_suppressedOobKeys)
                {
                  v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                  suppressedOobKeys = self->_suppressedOobKeys;
                  self->_suppressedOobKeys = v38;

                  v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                  suppressedDeviceFilter = self->_suppressedDeviceFilter;
                  self->_suppressedDeviceFilter = v40;

                }
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "oobKeys"));
                v43 = self->_suppressedOobKeys;
                v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v42, v44);

                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceFilter"));
                v46 = self->_suppressedDeviceFilter;
                v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v45, v47);

                if (dword_100977ED8 <= 30
                  && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
                {
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "oobKeys"));
                  v49 = objc_msgSend(v48, "count");
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceFilter"));
                  LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]", 30, "Removing oob keys count :%lu and device filter count:%lu from controller", v49, objc_msgSend(v50, "count"));

                }
                objc_msgSend(v102, "setOobKeys:", 0);
                objc_msgSend(v102, "setDeviceFilter:", 0);
                goto LABEL_54;
              }
              v23 = self->_suppressedOobKeys;
              if (v23)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24));
                v26 = v25 == 0;

                if (!v26)
                {
                  v27 = self->_suppressedOobKeys;
                  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28));
                  objc_msgSend(v102, "setOobKeys:", v29);

                  v30 = self->_suppressedDeviceFilter;
                  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v31));
                  objc_msgSend(v102, "setDeviceFilter:", v32);

                  if (dword_100977ED8 <= 30
                    && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
                  {
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "oobKeys"));
                    v34 = objc_msgSend(v33, "count");
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceFilter"));
                    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]", 30, "Adding oob keys count :%lu and device filter count:%lu to controller", v34, objc_msgSend(v35, "count"));

                  }
                  v54 = self->_suppressedOobKeys;
                  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", 0, v55);

                  v56 = self->_suppressedDeviceFilter;
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v102, "useCase")));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", 0, v57);

LABEL_54:
                  -[CBStackBLEScannerBTStack _oobKeysUpdate](self, "_oobKeysUpdate");
                }
              }
LABEL_55:
              if ((v18 & 0x2000000000) != 0)
                self->_anyActiveScan = 1;
              if (v106)
              {
                v106 = ((unint64_t)objc_msgSend(v16, "discoveryFlags") & 0x200000000) == 0;
                if ((v18 & 0x40000) != 0)
                  goto LABEL_62;
              }
              else
              {
                v106 = 0;
                if ((v18 & 0x40000) != 0)
                  goto LABEL_62;
              }
              if (!objc_msgSend(v16, "discoveryTypesContainTypes:", CBDiscoveryTypesNeedsObjectLocator()))
                goto LABEL_69;
LABEL_62:
              if (v104 != 26)
              {
                if (!v98)
                  v103 |= (int)objc_msgSend(v16, "bleRSSIThresholdHint") < 0;
                goto LABEL_68;
              }
              v58 = sub_100027F68();
              v103 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v58 + 896))(v58);
              v59 = sub_100027F68();
              v99 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v59 + 896))(v59);
              v60 = objc_msgSend(objc_retainAutorelease(v16), "discoveryTypesInternalPtr");
              BYTE4(v100) = 1;
              if ((v18 & 0x200000000) != 0 && (v60[1] & 1) != 0)
              {
                self->_aopBTTypes |= 0x100u;
LABEL_68:
                BYTE4(v100) = 1;
              }
LABEL_69:
              if ((v18 & 0x100000000000000) != 0)
              {
                self->_objectDiscoveryFlags |= 2u;
                if ((v18 & 0x200000000000000) == 0)
                {
LABEL_71:
                  if ((v18 & 0x10000000000) == 0)
                    goto LABEL_73;
LABEL_72:
                  self->_anyRangeScan = 1;
                  goto LABEL_73;
                }
              }
              else if ((v18 & 0x200000000000000) == 0)
              {
                goto LABEL_71;
              }
              self->_objectDiscoveryFlags |= 1u;
              if ((v18 & 0x10000000000) != 0)
                goto LABEL_72;
LABEL_73:
              v61 = objc_msgSend(v16, "bleRSSIThresholdHint");
              if ((v103 & 1) != 0)
                v62 = -120;
              else
                v62 = -90;
              if (v62 <= (v61 & (v61 >> 31)))
                v62 = v61 & (v61 >> 31);
              v63 = v62 == 0;
              if (v62 < v12)
                v12 = v62;
              v64 = objc_msgSend(v16, "bleScanRateOverride");
              if (!v64 && (self->_screenOn || (v64 = objc_msgSend(v16, "bleScanRateScreenOff")) == 0))
              {
                v64 = objc_msgSend(v16, "bleScanRate");
                if (!v64)
                  self->_scanRateAnyDefault = 1;
              }
              v105 |= v63;
              if (v64 > self->_scanRateHighest)
                self->_scanRateHighest = v64;
              v11 = 1;
              break;
            default:
              goto LABEL_55;
          }
        }
      }
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
  }
  while (v10);

  if ((v11 & 1) == 0)
    goto LABEL_167;
  if ((v100 & 0x100000000) != 0)
  {
    v65 = sub_1000438A4();
    v110 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v65 + 2344))(v65);
  }
  else
  {
    v110 = 0;
  }
  v112 = !v106;
  v128 = 0;
  v129[0] = 0;
  *(_QWORD *)((char *)v129 + 6) = 0;
  v126 = 0;
  v127[0] = 0;
  *(_QWORD *)((char *)v127 + 6) = 0;
  if ((self->_aggregateDiscoveryTypes.bitArray[1] & 0x40) != 0)
  {
    v67 = 1;
    v68 = CFSTR("Placeholder");
    if (!self->_screenOn && v95)
    {
      BYTE1(v128) = 56;
      BYTE5(v128) = 2;
      BYTE1(v126) = 56;
      BYTE5(v126) = 2;
      v69 = -[NSData length](v95, "length");
      memcpy((char *)&v128 + 6, -[NSData bytes](objc_retainAutorelease(v95), "bytes"), v69);
      if (v69)
        memset((char *)&v126 + 6, 255, v69);
      v119 = 0;
      v120 = 0;
      sub_10003994C(&v119, &v128, 0x16uLL);
      v117 = 0;
      v118 = 0;
      sub_10003994C(&v117, &v126, 0x16uLL);
      v70 = objc_msgSend(v101, "count");
      if ((v105 & 1) != 0)
        v71 = -90;
      else
        v71 = v12;
      if (v92)
        v71 = -120;
      if (v70)
        v72 = 3;
      else
        v72 = 2;
      sub_10003BFE0((uint64_t)a6, CFSTR("AcceptedInvitation"), v104, v72, (uint64_t)&v119, (uint64_t)&v117, v71, 0, v112, self->_targetCore, 1, 0, v110, 0, 0, 0, 1, 0, 0xFFFF,
        0xFFFF,
        0xFFFF);
      v117 = &off_100918258;
      if (v118)
        sub_100056AAC(v118);
      v119 = &off_100918258;
      if (v120)
        sub_100056AAC(v120);
      v67 = 0;
      v68 = CFSTR("AcceptedInvitation");
    }
  }
  else
  {
    v67 = 1;
    v68 = CFSTR("Placeholder");
  }
  for (j = 0; j != 22; ++j)
    *((_BYTE *)&v129[-1] + j) = 0;
  for (k = 0; k != 22; ++k)
    *((_BYTE *)&v127[-1] + k) = 0;
  if (v104 == 22)
  {
    if ((v100 & 1) != 0)
    {
      v119 = 0;
      v120 = 0;
      sub_10003994C(&v119, &v128, 0x16uLL);
      v117 = 0;
      v118 = 0;
      sub_10003994C(&v117, &v126, 0x16uLL);
      if ((v105 & 1) != 0)
        v75 = -90;
      else
        v75 = v12;
      if (v92)
        v75 = -120;
      sub_10003BFE0((uint64_t)a6, CFSTR("NearbyInfoV2"), 0x16u, 2, (uint64_t)&v119, (uint64_t)&v117, v75, 0, v112, self->_targetCore, 1, 0, v110, v67, 0, 0, 1, 0, 0xFFFF,
        0xFFFF,
        0xFFFF);
      v117 = &off_100918258;
      v66 = v101;
      if (v118)
        sub_100056AAC(v118);
      v119 = &off_100918258;
      v76 = v120;
      if (!v120)
        goto LABEL_181;
LABEL_180:
      sub_100056AAC(v76);
      goto LABEL_181;
    }
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    obja = self->_discoveryArray;
    v78 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
    if (v78)
    {
      if ((v103 & 1) != 0)
        v79 = -120;
      else
        v79 = -90;
      v80 = *(_QWORD *)v114;
      do
      {
        for (m = 0; m != v78; m = (char *)m + 1)
        {
          if (*(_QWORD *)v114 != v80)
            objc_enumerationMutation(obja);
          v82 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)m);
          if ((int)objc_msgSend(v82, "bleRSSIThresholdHint") > 0
            || (v83 = v79, v79 <= (int)objc_msgSend(v82, "bleRSSIThresholdHint")))
          {
            if ((int)objc_msgSend(v82, "bleRSSIThresholdHint") > 0
              || (v84 = objc_msgSend(v82, "bleRSSIThresholdHint"), v83 = v84, !v84))
            {
              v83 = -90;
            }
          }
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "deviceFilter"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _deviceFilterUUIDs:](self, "_deviceFilterUUIDs:", v85));

          v101 = v86;
          if (objc_msgSend(v86, "count"))
            v87 = 3;
          else
            v87 = 2;
          v88 = objc_retainAutorelease(v82);
          if ((*((_BYTE *)objc_msgSend(v88, "discoveryTypesInternalPtr") + 2) & 0x20) != 0)
          {
            bzero(&v128, 0x16uLL);
            bzero(&v126, 0x16uLL);
            v119 = 0;
            v120 = 0;
            sub_10003994C(&v119, &v128, 0x16uLL);
            v117 = 0;
            v118 = 0;
            sub_10003994C(&v117, &v126, 0x16uLL);
            sub_10003BFE0((uint64_t)a6, CFSTR("MiLo"), 0x16u, v87, (uint64_t)&v119, (uint64_t)&v117, v83, 0, v112, self->_targetCore, 1, v86, v110, 0, 0, 0, 1, 0, 0xFFFF,
              0xFFFF,
              0xFFFF);
            v117 = &off_100918258;
            if (v118)
              sub_100056AAC(v118);
            v119 = &off_100918258;
            if (v120)
              sub_100056AAC(v120);
          }
          if ((*((_BYTE *)objc_msgSend(objc_retainAutorelease(v88), "discoveryTypesInternalPtr") + 2) & 8) != 0)
          {
            LOBYTE(v128) = 4;
            LOBYTE(v126) = 4;
            v119 = 0;
            v120 = 0;
            sub_10003994C(&v119, &v128, 0x16uLL);
            v117 = 0;
            v118 = 0;
            sub_10003994C(&v117, &v126, 0x16uLL);
            sub_10003BFE0((uint64_t)a6, CFSTR("Invitation"), 0x16u, v87, (uint64_t)&v119, (uint64_t)&v117, v83, 0, v112, self->_targetCore, 1, v86, v110, 0, 0, 0, 1, 0, 0xFFFF,
              0xFFFF,
              0xFFFF);
            v117 = &off_100918258;
            if (v118)
              sub_100056AAC(v118);
            v119 = &off_100918258;
            if (v120)
              sub_100056AAC(v120);
          }
        }
        v78 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
      }
      while (v78);
    }

LABEL_167:
    v66 = v101;
    goto LABEL_181;
  }
  if ((v94 & 0x100000000) != 0 && !self->_screenOn)
  {
    v67 = 0;
    LOWORD(v128) = 14080;
    LOWORD(v126) = 14080;
    v68 = CFSTR("AUAction");
  }
  else if (v96)
  {
    LOBYTE(v128) = 1;
    LOBYTE(v126) = 1;
    v77 = -[NSData length](v96, "length");
    memcpy((char *)&v128 + 2, -[NSData bytes](objc_retainAutorelease(v96), "bytes"), v77);
    if (v77)
      memset((char *)&v126 + 2, 255, v77);

    v101 = 0;
  }
  v119 = 0;
  v120 = 0;
  sub_10003994C(&v119, &v128, 0x16uLL);
  v117 = 0;
  v118 = 0;
  sub_10003994C(&v117, &v126, 0x16uLL);
  v89 = objc_msgSend(v101, "count");
  if ((v105 & 1) != 0)
    v90 = -90;
  else
    v90 = v12;
  if (v92)
    v90 = -120;
  if (v89)
    v91 = 3;
  else
    v91 = 2;
  sub_10003BFE0((uint64_t)a6, v68, v104, v91, (uint64_t)&v119, (uint64_t)&v117, v90, 0, v112, self->_targetCore, 1, v101, v110, v67, v93, v94 & 1, v99 & 1, 0, 0xFFFF,
    0xFFFF,
    0xFFFF);
  v117 = &off_100918258;
  if (v118)
    sub_100056AAC(v118);
  v119 = &off_100918258;
  v76 = v120;
  v66 = v101;
  if (v120)
    goto LABEL_180;
LABEL_181:

}

- (id)_deviceFilterUUIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v7);
        v9 = objc_alloc((Class)NSUUID);
        v10 = objc_msgSend(v9, "initWithUUIDString:", v8, (_QWORD)v15);
        if (v10)
          goto LABEL_10;
        v11 = sub_100649C7C(v8);
        v19[0] = 0;
        v19[1] = 0;
        if (qword_1009778C8 != -1)
          dispatch_once(&qword_1009778C8, &stru_100918AC0);
        sub_10003F924((uint64_t)off_1009778C0, v11, 1u, 1u, 0, 0, (unsigned __int8 *)v19);
        v12 = sub_100030DF4((const unsigned __int8 *)v19);
        v10 = (id)objc_claimAutoreleasedReturnValue(v12);
        if (v10)
        {
LABEL_10:
          if (!v4)
            v4 = objc_alloc_init((Class)NSMutableSet);
          objc_msgSend(v4, "addObject:", v10);
        }

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v4, "count"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  else
    v13 = 0;

  return v13;
}

- (void)deviceFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t aggregateDiscoveryFlags;
  uint64_t v14;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  int v24;

  v4 = a3;
  v5 = v4;
  if (!self->_invalidateCalled)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    if (!v6)
    {
LABEL_42:

      goto LABEL_43;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v6));
    if (v7)
    {
      v8 = 0;
    }
    else
    {
      v9 = objc_alloc_init((Class)CBDevice);
      objc_msgSend(v9, "setIdentifier:", v6);
      objc_msgSend(v9, "setInternalFlags:", objc_msgSend(v5, "internalFlags"));
      v8 = 0x4000000;
      v7 = v9;
    }
    objc_msgSend(v7, "changedTypesRemoveAll");
    v10 = (unint64_t)objc_msgSend(v7, "updateWithCBDevice:", v5);
    v11 = v10 | v8;
    objc_msgSend(v7, "setChangeFlags:", (unint64_t)objc_msgSend(v7, "changeFlags") | v10 | v8);
    objc_msgSend(v7, "setLastSeenTicks:", mach_absolute_time());
    v12 = (unint64_t)objc_msgSend(v7, "discoveryFlags");
    aggregateDiscoveryFlags = self->_aggregateDiscoveryFlags;
    v24 = 0;
    CBDiscoveryTypesAddTypes(&v24, &self->_aggregateDiscoveryTypes);
    v14 = aggregateDiscoveryFlags & 0x7CFAA6C5B14FFFFFLL;
    if ((v24 & 0x600000) != 0)
      LOBYTE(v24) = v24 | 0x10;
    if ((v14 & (v12 | v10)) == 0
      && (objc_msgSend(v7, "discoveryTypesContainTypes:", &v24) & 1) == 0
      && (objc_msgSend(v7, "changedTypesContainTypes:", &v24) & 1) == 0)
    {
      if (dword_100977ED8 <= 5
        && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 5)))
      {
        v18 = CUPrintFlags64(v14, &unk_100738388);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = CBDiscoveryTypesToString(&v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceFound:]", 5, "Device found mismatch: %@, DsFl %@, DsTy %@", v7, v19, v21);

      }
      goto LABEL_41;
    }
    if ((v11 & 0x4000000) != 0)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v17 = self->_deviceMap;
        self->_deviceMap = v16;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v7, v6);
      if (dword_100977ED8 <= 20
        && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 20)))
      {
        LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceFound:]", 20, "Device found new: %@", v7);
      }
      if ((objc_msgSend(v7, "internalFlags") & 0x4000) == 0)
      {
        v22 = objc_retainBlock(self->_deviceFoundHandler);
        v23 = v22;
        if (v22)
          goto LABEL_35;
        goto LABEL_36;
      }
    }
    else
    {
      if ((self->_aggregateDiscoveryFlags & (v11 | 0x100000)) == 0
        && !objc_msgSend(v7, "changedTypesContainTypes:", &v24))
      {
        if (dword_100977ED8 <= 10
          && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 10)))
        {
          LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceFound:]", 10, "Device found unchanged: %@", v7);
        }
        goto LABEL_38;
      }
      if (dword_100977ED8 <= 15
        && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 15)))
      {
        LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceFound:]", 15, "Device found changed: %@", v7);
      }
      if ((objc_msgSend(v7, "internalFlags") & 0x4000) == 0)
      {
        v22 = objc_retainBlock(self->_deviceFoundHandler);
        v23 = v22;
        if (v22)
LABEL_35:
          (*((void (**)(id, void *))v22 + 2))(v22, v7);
LABEL_36:

LABEL_38:
        if ((objc_msgSend(v5, "internalFlags") & 0x1000) != 0)
          -[CBStackBLEScannerBTStack _proxyOOBKeysUpdateOnDeviceFound:](self, "_proxyOOBKeysUpdateOnDeviceFound:", v7);
        -[CBStackBLEScannerBTStack _rescanTimerUpdate:](self, "_rescanTimerUpdate:", 0);
LABEL_41:

        goto LABEL_42;
      }
    }
    -[CBStackBLEScannerBTStack _deviceSegmentFound:](self, "_deviceSegmentFound:", v7);
    goto LABEL_38;
  }
LABEL_43:

}

- (void)_rescanTimerUpdate:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  OS_dispatch_source *rescanTimer;
  OS_dispatch_source **p_rescanTimer;
  OS_dispatch_source *v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  dispatch_source_t v11;
  NSObject *v12;
  _QWORD handler[4];
  NSObject *v14;
  CBStackBLEScannerBTStack *v15;

  v3 = a3;
  v5 = -[NSMutableDictionary count](self->_deviceMap, "count");
  p_rescanTimer = &self->_rescanTimer;
  rescanTimer = self->_rescanTimer;
  if (v5)
  {
    v8 = rescanTimer;
    if (v8)
    {
      v9 = v8;
      if (v3)
        CUDispatchTimerSet(v8, 20.0, -1.0, 1.0);
    }
    else
    {
      v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_rescanTimer, v11);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000B3078;
      handler[3] = &unk_100918340;
      v9 = v11;
      v14 = v9;
      v15 = self;
      dispatch_source_set_event_handler(v9, handler);
      CUDispatchTimerSet(v9, 20.0, -1.0, 1.0);
      dispatch_activate(v9);

    }
  }
  else if (rescanTimer)
  {
    v12 = rescanTimer;
    dispatch_source_cancel(v12);
    v10 = *p_rescanTimer;
    *p_rescanTimer = 0;

  }
}

- (void)setDiscoveryArray:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryArray, a3);
}

- (void)_reportAggressiveScanIfNeeded
{
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  signed int v7;
  _BOOL4 screenOn;
  int v9;
  BOOL v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_discoveryArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v7 = objc_msgSend(v6, "bleScanRateOverride");
        if (!v7 && (self->_screenOn || (v7 = objc_msgSend(v6, "bleScanRateScreenOff")) == 0))
          v7 = objc_msgSend(v6, "bleScanRate");
        screenOn = self->_screenOn;
        if (self->_screenOn)
          v9 = 31;
        else
          v9 = 21;
        if (v7 < v9)
        {
          if (((unint64_t)objc_msgSend(v6, "discoveryFlags") & 0x200000000) == 0)
            continue;
          screenOn = self->_screenOn;
        }
        v10 = !screenOn;
        v11 = CFSTR("agsN");
        if (v10)
          v11 = CFSTR("agsF");
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
        objc_msgSend(v13, "reportAggressiveScan:action:", v6, v12);

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (NSData)selfAuthTagNonConnectable
{
  return self->_selfAuthTagNonConnectable;
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (NSArray)discoveryArray
{
  return self->_discoveryArray;
}

- (void)activate
{
  -[CBStackBLEScannerBTStack _activate:](self, "_activate:", 0);
}

- (void)_activate:(BOOL)a3
{
  CBStackBLEScannerBTStack *v3;
  BOOL v4;
  id v5;
  unint64_t *p_btSession;
  __objc2_class *v7;
  NSObject *dispatchQueue;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  BOOL scanning;
  void *sessionHandle;
  void *v16;
  uint64_t v17;
  _QWORD v18[7];
  BOOL v19;
  BOOL v20;
  void *__p[2];
  char v22;

  if (!self->_deviceFoundHandler)
  {
    FatalErrorF("CBStackBLEScanner: No deviceFoundHandler", a2);
    goto LABEL_24;
  }
  v3 = self;
  if (!self->_deviceLostHandler)
  {
LABEL_24:
    FatalErrorF("CBStackBLEScanner: No deviceLostHandler", a2);
    goto LABEL_25;
  }
  if (!self->_discoveryArray)
  {
LABEL_25:
    FatalErrorF("CBStackBLEScanner: No discoveryArray", a2);
    goto LABEL_26;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_26:
    FatalErrorF("CBStackBLEScanner: No dispatchQueue", a2);
    goto LABEL_27;
  }
  if (!v3->_identifier)
  {
LABEL_27:
    FatalErrorF("CBStackBLEScanner: No identifier", a2);
    goto LABEL_28;
  }
  v4 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (v3->_invalidateCalled)
  {
LABEL_28:
    FatalErrorF("CBStackBLEScanner: Activate after invalidate", v9);
LABEL_29:
    dispatch_once(&qword_100977B50, &stru_100918A60);
    goto LABEL_9;
  }
  p_btSession = (unint64_t *)&v3->_btSession;
  if (v3->_btSession)
    goto LABEL_14;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-0x%X"), v3->_identifier, CBXPCGetNextClientID());
  v7 = &OBJC_METACLASS___BTVCLinkAdvertiseSet;
  if (qword_100977B50 != -1)
    goto LABEL_29;
LABEL_9:
  v10 = qword_100977B48;
  v11 = objc_retainAutorelease(v5);
  sub_100091AE8(__p, (char *)objc_msgSend(v11, "UTF8String"));
  sub_10000A378(v10, (uint64_t)__p);
  if (v22 < 0)
    operator delete(__p[0]);
  if (v7[72].cache != (void *)-1)
    dispatch_once(&qword_100977B50, &stru_100918A60);
  v12 = sub_1000229D8((_QWORD *)qword_100977B48, *p_btSession);
  v3->_proxyoobKeysHash = 0;
  v3->_sessionHandle = (void *)v12;
  v3->_typeToRssiThresholdHash = 0;

LABEL_14:
  if (!v3->_bleScannerCPP._bleScannerObjC)
  {
    if (dword_100977ED8 <= 30
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    {
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _activate:]", 30, "Activate");
    }
    objc_storeStrong((id *)&v3->_bleScannerCPP._bleScannerObjC, v3);
    objc_storeStrong((id *)&v3->_bleScannerCPP._dispatchQueue, v3->_dispatchQueue);
    if (qword_100977FB0 != -1)
      dispatch_once(&qword_100977FB0, &stru_100918A80);
    sub_1000B5218((uint64_t)off_100977FA8 + 1872, (uint64_t)&v3->_bleScannerCPP);
  }
  v3->_aggregateDiscoveryFlags = 0;
  v3->_aggregateDiscoveryTypes = 0;
  -[CBStackBLEScannerBTStack _oobKeysUpdate](v3, "_oobKeysUpdate");
  -[CBStackBLEScannerBTStack _sensorTrackingUpdate](v3, "_sensorTrackingUpdate");
  v13 = -[CBStackBLEScannerBTStack _scanRequestCreate](v3, "_scanRequestCreate");
  scanning = v3->_scanning;
  v3->_scanning = v13 != 0;
  sessionHandle = v3->_sessionHandle;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _scanSummary:](v3, "_scanSummary:", v13));
  objc_storeStrong((id *)&v3->_scanSummary, v16);
  v3->_scanTicks = mach_absolute_time();
  v17 = sub_1000419F4();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100065928;
  v18[3] = &unk_100918840;
  v19 = scanning;
  v20 = v4;
  v18[4] = v16;
  v18[5] = v13;
  v18[6] = sessionHandle;
  sub_100041A34(v17, v18);
  -[CBStackBLEScannerBTStack _rescanTimerUpdate:](v3, "_rescanTimerUpdate:", 1);

}

- (void)_sensorTrackingUpdate
{
  id v2;
  id v3;
  _UNKNOWN **v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _UNKNOWN **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSSet *v21;
  id v22;
  int v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *sessionHandle;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  id v33;
  NSSet *v34;
  NSSet *v35;
  NSSet *sensorTrackingDevices;
  NSArray *obj;
  uint64_t v39;
  id v40;
  void *i;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[6];
  int v46;
  char v47;
  _QWORD v48[6];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int v53;
  __int16 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];

  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = self->_discoveryArray;
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v2)
  {
    v3 = 0;
    v39 = *(_QWORD *)v60;
    v40 = v2;
    v4 = &AMFDRSealingMapCopyLocalDictForClass_ptr;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "discoveryFlags") & 0x20000000) != 0)
        {
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceFilter"));
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v56;
            v42 = v5;
            v43 = v6;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v56 != v8)
                  objc_enumerationMutation(v6);
                v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v9);
                v11 = objc_msgSend(objc_alloc((Class)v4[503]), "initWithUUIDString:", v10);
                if (v11)
                  goto LABEL_13;
                v54 = 0;
                v53 = 0;
                if (TextToHardwareAddress(objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), -1, 6, &v53))goto LABEL_17;
                v44 = v3;
                v12 = v4;
                v13 = v53;
                v14 = BYTE1(v53);
                v15 = BYTE2(v53);
                v16 = HIBYTE(v53);
                v17 = v54;
                v18 = HIBYTE(v54);
                v63 = 0;
                v64 = 0;
                if (qword_1009778C8 != -1)
                  dispatch_once(&qword_1009778C8, &stru_100918AC0);
                sub_10003F924((uint64_t)off_1009778C0, (v13 << 40) | (v14 << 32) | (v15 << 24) | (v16 << 16) | (v17 << 8) | v18, 1u, 1u, 0, 0, (unsigned __int8 *)&v63);
                v19 = sub_100030DF4((const unsigned __int8 *)&v63);
                v11 = (id)objc_claimAutoreleasedReturnValue(v19);
                v4 = v12;
                v6 = v43;
                v3 = v44;
                v5 = v42;
                if (v11)
                {
LABEL_13:
                  if (!v3)
                    v3 = objc_alloc_init((Class)NSMutableDictionary);
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v11);
                }
                else
                {
LABEL_17:
                  v11 = 0;
                }

                v9 = (char *)v9 + 1;
              }
              while (v7 != v9);
              v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
              v7 = v20;
            }
            while (v20);
          }

        }
      }
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v40);
  }
  else
  {
    v3 = 0;
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = self->_sensorTrackingDevices;
  v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
  v23 = 0;
  if (v22)
  {
    v24 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v26));
        v28 = v27 == 0;

        if (v28)
        {
          if (dword_100977ED8 <= 30
            && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
          {
            LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _sensorTrackingUpdate]", 30, "SensorTracking stop %@", v26);
          }
          sessionHandle = self->_sessionHandle;
          v30 = sub_1000419F4();
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_1000B459C;
          v48[3] = &unk_100918868;
          v48[4] = v26;
          v48[5] = sessionHandle;
          sub_100041A34(v30, v48);
          ++v23;
        }
      }
      v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
    }
    while (v22);
  }

  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000B45F0;
  v45[3] = &unk_1009189B8;
  v47 = 1;
  v46 = -127;
  v45[4] = self;
  v45[5] = &v63;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v45);
  if (*((_DWORD *)v64 + 6) | v23)
  {
    if (dword_100977ED8 <= 30
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    {
      v31 = -[NSSet count](self->_sensorTrackingDevices, "count");
      v32 = objc_msgSend(v3, "count");
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _sensorTrackingUpdate]", 30, "SensorTracking update: %d -> %d total, %d started, %d stopped", v31, v32, *((_DWORD *)v64 + 6), v23);
    }
  }
  else if (dword_100977ED8 <= 10
         && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 10)))
  {
    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _sensorTrackingUpdate]", 10, "SensorTracking update: unchanged, %d total", objc_msgSend(v3, "count"));
  }
  if (v3)
  {
    v33 = objc_alloc((Class)NSSet);
    v34 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v35 = (NSSet *)objc_msgSend(v33, "initWithArray:", v34);
    sensorTrackingDevices = self->_sensorTrackingDevices;
    self->_sensorTrackingDevices = v35;

  }
  else
  {
    v34 = self->_sensorTrackingDevices;
    self->_sensorTrackingDevices = 0;
  }

  self->_aggregateDiscoveryFlags = self->_aggregateDiscoveryFlags & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(objc_msgSend(v3, "count") != 0) << 29);
  _Block_object_dispose(&v63, 8);

}

- (id)_scanSummary:(void *)a3
{
  uint64_t v5;
  void *v6;
  id *v7;
  id *v8;
  NSSet *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  void *i;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  id *v18;
  NSMutableDictionary *oobKeyMap;
  id *v20;
  id *v21;
  const char *v22;
  unsigned __int8 *v23;
  id *v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  id *v29;
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  id *v38;
  id *v39;
  const char *v40;
  id *v41;
  char *v42;
  id *v43;
  id *v44;
  unsigned int *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unsigned int *v52;
  unint64_t v53;
  id *v54;
  uint64_t j;
  id *v56;
  const char *v57;
  unint64_t v58;
  const char *v59;
  const char *v60;
  const char *v61;
  id *v62;
  id *v63;
  id *v64;
  uint64_t k;
  id *v66;
  const char *v67;
  id *v68;
  const char *v69;
  id *v70;
  id *v71;
  id *v72;
  unsigned int *v73;
  unsigned int *v74;
  const char *v75;
  id *v76;
  const char *p_p;
  int v78;
  id *v79;
  int v80;
  const char *v81;
  id v82;
  void *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  id v88;
  void *__p;
  unsigned int *v90;
  char v91;
  id v92;
  id v93;
  void *v94;
  unsigned int *v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  _QWORD v119[6];
  char *v120;
  char *v121;
  uint64_t v122;
  char v123;
  id v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  id v132;
  id obj;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  _BYTE v140[128];

  obj = 0;
  v134 = 0;
  v135 = &v134;
  v136 = 0x3032000000;
  v137 = sub_1000624EC;
  v138 = sub_100062330;
  v139 = 0;
  v5 = CUPrintFlags64(self->_aggregateDiscoveryFlags, &unk_100738388);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v84 = a3;
  NSAppendPrintF_safe(&obj, "DsFl %@", v6);
  objc_storeStrong(&v139, obj);

  v7 = (id *)(v135 + 5);
  v132 = (id)v135[5];
  CBDiscoveryTypesAppendString(&v132, ", DsTy", &self->_aggregateDiscoveryTypes);
  objc_storeStrong(v7, v132);
  if (-[NSSet count](self->_sensorTrackingDevices, "count"))
  {
    v8 = (id *)(v135 + 5);
    v131 = (id)v135[5];
    NSAppendPrintF_safe(&v131, ", DeviceFilter: [ ");
    objc_storeStrong(v8, v131);
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v9 = self->_sensorTrackingDevices;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v128;
      v12 = "";
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v128 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)i);
          v15 = (id *)(v135 + 5);
          v126 = (id)v135[5];
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
          NSAppendPrintF_safe(&v126, "%s%@", v12, v16);
          objc_storeStrong(v15, v126);

          v12 = ", ";
        }
        v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
        v12 = ", ";
      }
      while (v10);
    }

    v17 = (id *)(v135 + 5);
    v125 = (id)v135[5];
    NSAppendPrintF_safe(&v125, " ]");
    objc_storeStrong(v17, v125);
  }
  if (-[NSMutableDictionary count](self->_oobKeyMap, "count"))
  {
    v18 = (id *)(v135 + 5);
    v124 = (id)v135[5];
    NSAppendPrintF_safe(&v124, ", OOBKeys: [ ");
    objc_storeStrong(v18, v124);
    v120 = 0;
    v121 = (char *)&v120;
    v122 = 0x2020000000;
    v123 = 1;
    oobKeyMap = self->_oobKeyMap;
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_1000B43F4;
    v119[3] = &unk_100918968;
    v119[4] = &v134;
    v119[5] = &v120;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](oobKeyMap, "enumerateKeysAndObjectsUsingBlock:", v119);
    v20 = (id *)(v135 + 5);
    v118 = (id)v135[5];
    NSAppendPrintF_safe(&v118, " ]");
    objc_storeStrong(v20, v118);
    _Block_object_dispose(&v120, 8);
  }
  v21 = (id *)(v135 + 5);
  v117 = (id)v135[5];
  if (self->_screenOn)
    v22 = "yes";
  else
    v22 = "no";
  NSAppendPrintF_safe(&v117, ", ScreenOn %s", v22);
  objc_storeStrong(v21, v117);
  v23 = (unsigned __int8 *)a3;
  if (a3)
  {
    if (*((_BYTE *)a3 + 144))
    {
      v24 = (id *)(v135 + 5);
      v116 = (id)v135[5];
      NSAppendPrintF_safe(&v116, ", RetainDups %s", "yes");
      objc_storeStrong(v24, v116);
      v23 = (unsigned __int8 *)a3;
    }
    if (v23[120])
    {
      v26 = *((_DWORD *)v23 + 32);
      v25 = *((_DWORD *)v23 + 33);
      v27 = v26 ? 100 * v25 / v26 : 0;
      v28 = v23[136];
      v29 = (id *)(v135 + 5);
      v115 = (id)v135[5];
      NSAppendPrintF_safe(&v115, ", %u/%u ms (%u%%)", v25, v26, v27);
      objc_storeStrong(v29, v115);
      v23 = (unsigned __int8 *)a3;
      if (v28)
      {
        v30 = (id *)(v135 + 5);
        v114 = (id)v135[5];
        NSAppendPrintF_safe(&v114, ", ActiveScan %s", "yes");
        objc_storeStrong(v30, v114);
        v23 = (unsigned __int8 *)a3;
      }
    }
    if (*v23)
    {
      v31 = (id *)(v135 + 5);
      v113 = (id)v135[5];
      NSAppendPrintF_safe(&v113, ", OverallDups %s", "yes");
      objc_storeStrong(v31, v113);
      v23 = (unsigned __int8 *)a3;
    }
    if (v23[140])
    {
      v32 = (id *)(v135 + 5);
      v112 = (id)v135[5];
      NSAppendPrintF_safe(&v112, ", RangeScan %s", "yes");
      objc_storeStrong(v32, v112);
      v23 = (unsigned __int8 *)a3;
    }
    v120 = 0;
    v121 = 0;
    v122 = 0;
    sub_1000B6A6C(&v120, *((_QWORD *)v23 + 8), *((_QWORD *)v23 + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v23 + 9) - *((_QWORD *)v23 + 8)) >> 5));
    if (v120 != v121)
    {
      v33 = (id *)(v135 + 5);
      v111 = (id)v135[5];
      NSAppendPrintF_safe(&v111, ", Filters: ");
      objc_storeStrong(v33, v111);
      v34 = v120;
      v85 = v121;
      if (v120 != v121)
      {
        v35 = "";
        v36 = " ";
        v37 = "";
        do
        {
          v38 = (id *)(v135 + 5);
          v110 = (id)v135[5];
          v87 = v34;
          NSAppendPrintF_safe(&v110, "%s{Type %d", v37, v34[8]);
          objc_storeStrong(v38, v110);
          v39 = (id *)(v135 + 5);
          v109 = (id)v135[5];
          v40 = "yes";
          if (!v87[50])
            v40 = "no";
          NSAppendPrintF_safe(&v109, ", Dups %s", v40);
          objc_storeStrong(v39, v109);
          v41 = (id *)(v135 + 5);
          v108 = (id)v135[5];
          NSAppendPrintF_safe(&v108, ", RSSI %d", v87[48]);
          objc_storeStrong(v41, v108);
          v42 = v87;
          if (v87[64])
          {
            v43 = (id *)(v135 + 5);
            v107 = (id)v135[5];
            NSAppendPrintF_safe(&v107, ", ObjL");
            objc_storeStrong(v43, v107);
            v42 = v87;
          }
          if (!v42[68])
          {
            v44 = (id *)(v135 + 5);
            v106 = (id)v135[5];
            NSAppendPrintF_safe(&v106, ", NoConfigController");
            objc_storeStrong(v44, v106);
            v42 = v87;
          }
          v45 = (unsigned int *)*((_QWORD *)v42 + 5);
          v94 = &off_100918258;
          v95 = v45;
          if (v45)
            sub_10003C37C((uint64_t)v45);
          v46 = sub_10003EB18((uint64_t)&v94);
          v47 = sub_10003F8C4((uint64_t)&v94);
          v48 = 0;
          if (v47)
          {
            while (!*(_BYTE *)(v46 + v48))
            {
              if (v47 == ++v48)
                goto LABEL_78;
            }
          }
          if (v48 != v47)
          {
            if (v48 >= v47)
              v49 = v47;
            else
              v49 = v48;
            while (v47 > v48)
            {
              v50 = v47 - 1;
              if (*(unsigned __int8 *)(v46 - 1 + v47--))
              {
                v49 = v50 + 1;
                break;
              }
            }
            v52 = (unsigned int *)*((_QWORD *)v42 + 3);
            __p = &off_100918258;
            v90 = v52;
            if (v52)
              sub_10003C37C((uint64_t)v52);
            v86 = sub_10003EB18((uint64_t)&__p);
            v53 = sub_10003F8C4((uint64_t)&__p);
            v54 = (id *)(v135 + 5);
            v105 = (id)v135[5];
            NSAppendPrintF_safe(&v105, ", Blob [");
            objc_storeStrong(v54, v105);
            if (v48)
            {
              for (j = 0; j != v48; ++j)
              {
                v56 = (id *)(v135 + 5);
                v104 = (id)v135[5];
                if (j)
                  v57 = v36;
                else
                  v57 = v35;
                NSAppendPrintF_safe(&v104, "%s..", v57);
                objc_storeStrong(v56, v104);
              }
            }
            v58 = v48;
            if (v48 < v49)
            {
              do
              {
                v59 = v36;
                v60 = v35;
                v61 = v59;
                if (!v58)
                  v59 = v35;
                v62 = (id *)(v135 + 5);
                if (v58 >= v53)
                {
                  v102 = v135[5];
                  v63 = (id *)&v102;
                  NSAppendPrintF_safe(&v102, "%s~~", v59);
                }
                else
                {
                  v103 = v135[5];
                  v63 = (id *)&v103;
                  NSAppendPrintF_safe(&v103, "%s%02X", v59, *(unsigned __int8 *)(v86 + v58));
                }
                objc_storeStrong(v62, *v63);
                v35 = v60;
                v36 = v61;
                ++v58;
              }
              while (v49 != v58);
            }
            v64 = (id *)(v135 + 5);
            v101 = (id)v135[5];
            NSAppendPrintF_safe(&v101, "], Mask [");
            objc_storeStrong(v64, v101);
            if (v48)
            {
              for (k = 0; k != v48; ++k)
              {
                v66 = (id *)(v135 + 5);
                v100 = (id)v135[5];
                if (k)
                  v67 = v36;
                else
                  v67 = v35;
                NSAppendPrintF_safe(&v100, "%s..", v67);
                objc_storeStrong(v66, v100);
              }
            }
            if (v48 < v49)
            {
              do
              {
                v68 = (id *)(v135 + 5);
                v99 = (id)v135[5];
                if (v48)
                  v69 = v36;
                else
                  v69 = v35;
                NSAppendPrintF_safe(&v99, "%s%02X", v69, *(unsigned __int8 *)(v46 + v48));
                objc_storeStrong(v68, v99);
                ++v48;
              }
              while (v49 != v48);
            }
            v70 = (id *)(v135 + 5);
            v98 = (id)v135[5];
            NSAppendPrintF_safe(&v98, "]");
            objc_storeStrong(v70, v98);
            __p = &off_100918258;
            if (v90)
              sub_100056AAC(v90);
          }
LABEL_78:
          v71 = (id *)(v135 + 5);
          v97 = (id)v135[5];
          NSAppendPrintF_safe(&v97, "}");
          objc_storeStrong(v71, v97);
          v94 = &off_100918258;
          if (v95)
            sub_100056AAC(v95);
          v34 = v87 + 96;
          v37 = ", ";
        }
        while (v87 + 96 != v85);
      }
    }
    v94 = 0;
    v95 = 0;
    v96 = 0;
    sub_1000B61B8((char *)&v94, *((__int128 **)v84 + 1), *((__int128 **)v84 + 2), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)v84 + 2) - *((_QWORD *)v84 + 1)) >> 2));
    if (v94 != v95)
    {
      v72 = (id *)(v135 + 5);
      v93 = (id)v135[5];
      NSAppendPrintF_safe(&v93, ", UUIDs: ");
      objc_storeStrong(v72, v93);
      v73 = (unsigned int *)v94;
      v74 = v95;
      if (v94 != v95)
      {
        v75 = "";
        do
        {
          v76 = (id *)(v135 + 5);
          v92 = (id)v135[5];
          sub_10006887C((uint64_t)v73, &__p);
          if (v91 >= 0)
            p_p = (const char *)&__p;
          else
            p_p = (const char *)__p;
          NSAppendPrintF_safe(&v92, "%s%s", v75, p_p);
          objc_storeStrong(v76, v92);
          if (v91 < 0)
            operator delete(__p);
          v73 += 5;
          v75 = ", ";
        }
        while (v73 != v74);
      }
    }
    v78 = *((_DWORD *)v84 + 42);
    if (v78)
    {
      v79 = (id *)(v135 + 5);
      v88 = (id)v135[5];
      if (v78 >= 0x20000)
      {
        if (v78 >= 327680)
        {
          if (v78 >= 589824)
          {
            if (v78 <= 2147418111)
            {
              switch(v78)
              {
                case 589824:
                  v81 = "FindNearbyRemote";
                  break;
                case 589825:
                  v81 = "FindNearbyPencil";
                  break;
                case 655360:
                  v81 = "AccessDigitalHomeKey";
                  break;
                default:
LABEL_231:
                  v81 = "?";
                  break;
              }
            }
            else
            {
              switch(v78)
              {
                case 2147418112:
                  v81 = "InternalTestNoLockScan";
                  break;
                case 2147418113:
                  v81 = "InternalTestNoScreenOffScan";
                  break;
                case 2147418114:
                  v81 = "InternalTestScanWithNoDups";
                  break;
                case 2147418115:
                  v81 = "InternalTestScanWithDups";
                  break;
                case 2147418116:
                  v81 = "InternalTestScanFor20Seconds";
                  break;
                case 2147418117:
                  v81 = "InternalTestActiveScan";
                  break;
                case 2147418118:
                  v81 = "InternalTestUUIDScan";
                  break;
                case 2147418119:
                  v81 = "InternalTestScanFor10ClockSeconds";
                  break;
                case 2147418120:
                  v81 = "InternalTestScanBoost";
                  break;
                default:
                  goto LABEL_231;
              }
            }
          }
          else if (v78 > 458752)
          {
            switch(v78)
            {
              case 524288:
                v81 = "ADPD";
                break;
              case 524289:
                v81 = "ADPDBuffer";
                break;
              case 524290:
                v81 = "MicroLocation";
                break;
              case 524291:
                v81 = "MicroLocationLeech";
                break;
              default:
                if (v78 == 458753)
                {
                  v81 = "PrecisionFindingFindee";
                }
                else
                {
                  if (v78 != 458754)
                    goto LABEL_231;
                  v81 = "PrecisionFindingFindeeHighPriority";
                }
                break;
            }
          }
          else
          {
            switch(v78)
            {
              case 393216:
                v81 = "CaptiveNetworkJoin";
                break;
              case 393217:
                v81 = "UseCaseSIMTransfer";
                break;
              case 393218:
                v81 = "MacSetup";
                break;
              case 393219:
                v81 = "AppleIDSignIn";
                break;
              case 393220:
                v81 = "AppleIDSignInSettings";
                break;
              default:
                if (v78 == 327680)
                {
                  v81 = "RapportThirdParty";
                }
                else
                {
                  if (v78 != 458752)
                    goto LABEL_231;
                  v81 = "PrecisionFindingFinder";
                }
                break;
            }
          }
        }
        else
        {
          switch(v78)
          {
            case 131072:
              v81 = "SharingDefault";
              break;
            case 131073:
              v81 = "SharingPhoneAutoUnlock";
              break;
            case 131074:
              v81 = "SharingSiriWatchAuth";
              break;
            case 131075:
              v81 = "SharingMacAutoUnlock";
              break;
            case 131076:
              v81 = "SharingEDTScreenOn";
              break;
            case 131077:
              v81 = "SharingEDTWiFiDisabled";
              break;
            case 131078:
              v81 = "SharingEDTWombatEligibleAsDefaultCamera";
              break;
            case 131079:
              v81 = "SharingEDTWombatCameraPicker";
              break;
            case 131080:
              v81 = "SharingWombatBackground";
              break;
            case 131081:
              v81 = "SharingUniversalControl";
              break;
            case 131082:
              v81 = "SharingPeopleProximity";
              break;
            case 131083:
              v81 = "SharingEDTEnsembleOpenDisplayPrefs";
              break;
            case 131084:
              v81 = "SharingEDTNearbydMotionStopped";
              break;
            case 131085:
              v81 = "SharingDoubleBoostGenericScan";
              break;
            case 131086:
              v81 = "SharingEDTIncomingAdvertisement ";
              break;
            case 131087:
              v81 = "SharingEDTWombatStreamStart";
              break;
            case 131088:
              v81 = "SharingOYAutoUnlock";
              break;
            case 131089:
              goto LABEL_231;
            case 131090:
              v81 = "SharingAirDrop";
              break;
            case 131091:
              v81 = "SharingNearbyInvitationHost";
              break;
            case 131092:
              v81 = "SharingNearbyInvitationParticipant";
              break;
            case 131093:
              v81 = "SharingAirDropAskToAirDrop";
              break;
            case 131094:
              v81 = "SharingAirDropTempIdentity";
              break;
            case 131095:
              v81 = "SharingAirDropNeedsCLink";
              break;
            case 131096:
              v81 = "SharingRemoteWidgetUpdate";
              break;
            case 131097:
              v81 = "SharingCountryCodeUpdate";
              break;
            case 131098:
              v81 = "SharingMacPhoneAutoUnlock";
              break;
            case 131099:
              v81 = "SharingVisionProDiscovery";
              break;
            case 131100:
              v81 = "SharingVisionProStateChange";
              break;
            case 131101:
              v81 = "SharingContinuityScreen";
              break;
            case 131102:
              v81 = "SharingEDTRemoteDisplay";
              break;
            default:
              if (v78 == 196608)
              {
                v81 = "DigitalIDTSA";
              }
              else
              {
                if (v78 != 0x40000)
                  goto LABEL_231;
                v81 = "DigitalCarKeyThirdParty";
              }
              break;
          }
        }
      }
      else
      {
        switch(v78)
        {
          case 65536:
            v81 = "FindMyAction";
            break;
          case 65537:
            v81 = "FindMyBackground";
            break;
          case 65538:
            v81 = "FindMyActionHELE";
            break;
          case 65539:
            v81 = "FindMyBackgroundHELE";
            break;
          case 65540:
            v81 = "FindMyActionTransient";
            break;
          case 65541:
            v81 = "FindMyBackgroundTransient";
            break;
          case 65542:
            v81 = "FindMyActionHELETransient";
            break;
          case 65543:
            v81 = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            v81 = "FindMyNotOptedIn";
            break;
          case 65545:
            v81 = "FindMyOptedIn";
            break;
          case 65546:
            v81 = "FindMySepAlertsEnabled";
            break;
          case 65547:
            v81 = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            v81 = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            v81 = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            v81 = "FindMyHELE";
            break;
          case 65551:
            v81 = "FindMyBeaconOnDemand";
            break;
          case 65552:
            v81 = "FindMyWildTimedScan";
            break;
          case 65553:
            v81 = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            v81 = "FindMySnifferMode";
            break;
          case 65555:
            v81 = "FindMyUnpair";
            break;
          case 65556:
            v81 = "FindMyUnpairHELE";
            break;
          case 65557:
            v81 = "FindMyPlaySound";
            break;
          case 65558:
            v81 = "FindMyPlaySoundHELE";
            break;
          case 65559:
            v81 = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            v81 = "FindMyUTTransient";
            break;
          case 65561:
            v81 = "FindMyUTHELETransient";
            break;
          default:
            v80 = v78 - 1;
            v81 = "HealthKit";
            switch(v80)
            {
              case 0:
                goto LABEL_232;
              case 1:
                v81 = "HomeKit";
                break;
              case 2:
                v81 = "FindMyObjectConnection";
                break;
              case 3:
                v81 = "FindMyObjectConnectionTransient";
                break;
              case 4:
                v81 = "MIDI";
                break;
              case 5:
                v81 = "Continuity";
                break;
              case 6:
                v81 = "InstantHotSpot";
                break;
              case 7:
                v81 = "NearBy";
                break;
              case 8:
                v81 = "Sharing";
                break;
              case 9:
                v81 = "HearingSupport";
                break;
              case 10:
                v81 = "Magnet";
                break;
              case 11:
                v81 = "HID";
                break;
              case 12:
                v81 = "LEA";
                break;
              case 13:
                v81 = "External";
                break;
              case 14:
                v81 = "ExternalMedical";
                break;
              case 15:
                v81 = "ExternalLock";
                break;
              case 16:
                v81 = "ExternalWatch";
                break;
              case 17:
                v81 = "SmartRouting";
                break;
              case 18:
                v81 = "DigitalID";
                break;
              case 19:
                v81 = "DigitalKey";
                break;
              case 20:
                v81 = "DigitalCarKey";
                break;
              case 21:
                v81 = "HeySiri";
                break;
              case 22:
                v81 = "ThirdPartyApp";
                break;
              case 23:
                v81 = "CNJ";
                break;
              default:
                switch("HealthKit")
                {
                  case 0x100u:
                    v81 = "DevicePresenceDetection";
                    break;
                  case 0x101u:
                    v81 = "AudioBox";
                    break;
                  case 0x102u:
                    v81 = "SIMTransfer";
                    break;
                  case 0x103u:
                    v81 = "ProximityScreenOnLeechScan";
                    break;
                  case 0x104u:
                    v81 = "MacMigrate";
                    break;
                  case 0x107u:
                    v81 = "HIDUARTService";
                    break;
                  case 0x108u:
                    v81 = "AccessibilitySwitchControlPairing";
                    break;
                  case 0x109u:
                    v81 = "BaseBandFastConnect";
                    break;
                  case 0x10Au:
                    v81 = "SafetyAlerts";
                    break;
                  case 0x10Bu:
                    v81 = "LECarPlay";
                    break;
                  case 0x10Cu:
                    v81 = "TCCBluetooth";
                    break;
                  case 0x10Du:
                    v81 = "AOPBufferLeech";
                    break;
                  default:
                    goto LABEL_231;
                }
                break;
            }
            break;
        }
      }
LABEL_232:
      NSAppendPrintF_safe(&v88, ", usecase %s", v81);
      objc_storeStrong(v79, v88);
    }
    if (v94)
    {
      v95 = (unsigned int *)v94;
      operator delete(v94);
    }
    v94 = &v120;
    sub_1000B6134((void ***)&v94);
  }
  v82 = (id)v135[5];
  _Block_object_dispose(&v134, 8);

  return v82;
}

- (void)_oobKeysUpdate
{
  void *v2;
  void *v3;
  id v4;
  void *j;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSMutableDictionary *oobKeyMap;
  NSMutableDictionary *v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  NSMutableDictionary *v64;
  NSMutableDictionary *v65;
  NSArray *obj;
  uint64_t v68;
  id v69;
  void *i;
  unint64_t v71;
  int64_t v72;
  void *v73;
  int v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[6];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  int v86;
  _QWORD v87[4];
  NSMutableDictionary *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  int v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];

  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = self->_discoveryArray;
  v69 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
  if (v69)
  {
    v75 = 0;
    v2 = 0;
    v72 = 0;
    v73 = 0;
    v71 = 0;
    v74 = 0;
    v68 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        v77 = v2;
        if (*(_QWORD *)v99 != v68)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oobKeys"));
        v4 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
        if (v4)
        {
          v79 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v4; j = (char *)j + 1)
            {
              if (*(_QWORD *)v95 != v79)
                objc_enumerationMutation(v76);
              v6 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
              v7 = objc_msgSend(v6, "btAddressType");
              v8 = objc_msgSend(v6, "addressType");
              v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddressData"));
              if (objc_msgSend(v9, "length") == (id)6 || objc_msgSend(v9, "length") == (id)7)
              {
                v10 = v8 | v7;
                if (v10)
                {
                  LOBYTE(v90) = v10;
                  v11 = v9;
                  v12 = v11;
                  if (v11)
                  {
                    if (objc_msgSend(v11, "length") == (id)7 || v10 > 1 || objc_msgSend(v12, "length") != (id)6)
                    {
                      v9 = v12;
                    }
                    else
                    {
                      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v90, 1));
                      objc_msgSend(v13, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v12), "bytes"), 6);
                      v9 = objc_msgSend(v13, "copy");

                    }
                  }
                  else
                  {
                    v9 = 0;
                  }

                }
                if (objc_msgSend(v9, "length") == (id)7)
                  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 1, 6));
                else
                  v14 = v9;
                v15 = v14;
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "irkData"));
                if (objc_msgSend(v16, "length") == (id)16)
                {
                  v17 = objc_msgSend(v6, "keyType");
                  v18 = v17;
                  if ((_DWORD)v17)
                  {
                    if ((_DWORD)v17 == 255)
                    {
                      if (dword_100977ED8 <= 30
                        && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
                      {
                        v19 = CUPrintNSDataAddress(v15);
                        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                        v21 = CUPrintNSObjectMasked(v16);
                        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                        v23 = CUPrintFlags32(255, &unk_1007386EB);
                        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                        LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", 30, "OOB key skip: something went wrong with oobkey type, Addr %@, IRK %@, keyType: %@", v20, v22, v24);

                      }
                    }
                    else
                    {
                      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
                      v30 = v75;
                      if (!v75)
                        v30 = objc_alloc_init((Class)NSMutableDictionary);
                      v75 = v30;
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v29));
                      v32 = v31 == 0;

                      if (v32)
                      {
                        v33 = objc_alloc_init((Class)NSMutableArray);
                        objc_msgSend(v75, "setObject:forKeyedSubscript:", v33, v29);

                      }
                      v34 = v77;
                      if (!v77)
                        v34 = objc_alloc_init((Class)NSMutableDictionary);
                      v77 = v34;
                      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v29));
                      v36 = v35 == 0;

                      if (v36)
                      {
                        v37 = objc_alloc_init((Class)NSMutableOrderedSet);
                        objc_msgSend(v77, "setObject:forKeyedSubscript:", v37, v29);

                      }
                      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v29));
                      v39 = objc_msgSend(v38, "count");

                      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v29));
                      objc_msgSend(v40, "addObject:", v16);

                      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", v29));
                      LODWORD(v39) = v39 == objc_msgSend(v41, "count");

                      if ((_DWORD)v39)
                      {
                        if (dword_100977ED8 <= 30
                          && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
                        {
                          v42 = CUPrintNSObjectMasked(v16);
                          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
                          v44 = CUPrintNSDataAddress(v15);
                          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
                          v46 = CUPrintFlags32(v18, &unk_1007386EB);
                          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                          LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", 30, "OOB key skip: Duplicate irkData %@, its address %@ and keyType %@", v43, v45, v47);

                        }
                      }
                      else
                      {
                        if ((_DWORD)v18 == 1)
                        {
                          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", v29));
                          objc_msgSend(v49, "addObject:", v6);

                          v71 = (v71 + 1);
                          if (dword_100977ED8 <= 20
                            && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 20)))
                          {
                            v50 = CUPrintNSDataAddress(v15);
                            v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                            v52 = CUPrintNSObjectMasked(v16);
                            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
                            v54 = CUPrintFlags32(1, &unk_1007386EB);
                            v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
                            LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", 20, "OOB key add: Addr %@, IRK %@, keyType: %@", v51, v53, v55);

                          }
                        }
                        v72 ^= (unint64_t)objc_msgSend(v6, "hash");
                      }

                    }
                  }
                  else if (v74 < 10)
                  {
                    v48 = v73;
                    if (!v73)
                      v48 = objc_alloc_init((Class)NSMutableDictionary);
                    v73 = v48;
                    objc_msgSend(v48, "setObject:forKeyedSubscript:", v16, v9);
                    ++v74;
                  }
                  else if (dword_100977ED8 <= 30
                         && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
                  {
                    v25 = CUPrintNSDataAddress(v15);
                    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
                    v27 = CUPrintNSObjectMasked(v16);
                    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
                    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", 30, "OOB key skip: too many, Addr %@, IRK %@", v26, v28);

                  }
                }

              }
            }
            v4 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
          }
          while (v4);
        }

        v2 = v77;
      }
      v69 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    }
    while (v69);
  }
  else
  {
    v75 = 0;
    v2 = 0;
    v72 = 0;
    v73 = 0;
    v71 = 0;
  }
  v78 = v2;

  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  oobKeyMap = self->_oobKeyMap;
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1000B1500;
  v87[3] = &unk_1009188D8;
  v57 = v73;
  v88 = v57;
  v89 = &v90;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](oobKeyMap, "enumerateKeysAndObjectsUsingBlock:", v87);
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_1000B1A78;
  v82[3] = &unk_1009188D8;
  v82[4] = self;
  v82[5] = &v83;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v57, "enumerateKeysAndObjectsUsingBlock:", v82);
  if (v72 != self->_proxyoobKeysHash)
  {
    if (!v75)
      v75 = objc_alloc_init((Class)NSMutableDictionary);
    v58 = sub_100475B20();
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000B2018;
    v80[3] = &unk_1009172A0;
    v75 = v75;
    v81 = v75;
    sub_100041A34(v58, v80);

  }
  if (*((_DWORD *)v84 + 6) || *((_DWORD *)v91 + 6) || v72 != self->_proxyoobKeysHash)
  {
    if (dword_100977ED8 <= 30
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    {
      v62 = -[NSMutableDictionary count](self->_oobKeyMap, "count");
      v63 = -[NSMutableDictionary count](v57, "count");
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", 30, "OOB keys update: changed, %d -> %d total, %d started, %d stopped", v62, v63, *((_DWORD *)v84 + 6), *((_DWORD *)v91 + 6));
    }
    if ((_DWORD)v71
      && dword_100977ED8 <= 30
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    {
      v60 = "Non Default OOB keys wiped and replaced: %d";
      v61 = 30;
      goto LABEL_88;
    }
  }
  else if (dword_100977ED8 <= 10
         && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 10)))
  {
    v59 = -[NSMutableDictionary count](v57, "count");
    v60 = "OOB keys update: unchanged, %d total";
    v61 = 10;
    v71 = (unint64_t)v59;
LABEL_88:
    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", v61, v60, v71);
  }
  v64 = self->_oobKeyMap;
  self->_oobKeyMap = v57;
  v65 = v57;

  self->_proxyoobKeysHash = v72;
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v90, 8);
}

- (void)_scanRequestCreate
{
  operator new();
}

- (void)_addTypeWithParamsIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  unsigned int v7;
  id v9;
  void *i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  int v15;
  char v16;
  signed int v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  NSData *v24;
  NSUInteger v25;
  id v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  NSData *v36;
  unsigned int v38;
  int v39;
  NSArray *obj;
  char v41;
  uint64_t v42;
  id v44;
  uint64_t (**v45)();
  unsigned int *v46;
  uint64_t (**v47)();
  unsigned int *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  _QWORD v55[2];
  uint64_t v56;
  _QWORD v57[2];

  v7 = a3;
  v56 = 0;
  v57[0] = 0;
  *(_QWORD *)((char *)v57 + 6) = 0;
  v54 = 0;
  v55[0] = 0;
  *(_QWORD *)((char *)v55 + 6) = 0;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_discoveryArray;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v9)
  {
    v36 = 0;
    goto LABEL_109;
  }
  v38 = v7;
  v39 = 0;
  v36 = 0;
  v42 = *(_QWORD *)v50;
  while (2)
  {
    v44 = v9;
    for (i = 0; i != v44; i = (char *)i + 1)
    {
      if (*(_QWORD *)v50 != v42)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
      v12 = (unint64_t)objc_msgSend(v11, "discoveryFlags");
      v13 = (unint64_t)objc_msgSend(v11, "extraDiscoveryFlags") | v12;
      v14 = (v13 & a4) != 0;
      if (a5 && (v13 & a4) == 0)
        v14 = objc_msgSend(v11, "discoveryTypesContainTypes:", a5);
      if (v14)
      {
        self->_aggregateDiscoveryFlags |= v13;
        if (a5)
          CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, objc_msgSend(objc_retainAutorelease(v11), "discoveryTypesInternalPtr"));
        if ((v13 & 0x100000000000) == 0)
        {
          if ((v13 & 0x2000000000) != 0)
          {
            self->_anyActiveScan = 1;
            if ((v13 & 0x100000000000000) == 0)
            {
LABEL_15:
              if ((v13 & 0x200000000000000) == 0)
                goto LABEL_16;
              goto LABEL_27;
            }
          }
          else if ((v13 & 0x100000000000000) == 0)
          {
            goto LABEL_15;
          }
          self->_objectDiscoveryFlags |= 2u;
          if ((v13 & 0x200000000000000) == 0)
          {
LABEL_16:
            if ((v13 & 0x10000000000) == 0)
              goto LABEL_18;
            goto LABEL_17;
          }
LABEL_27:
          self->_objectDiscoveryFlags |= 1u;
          if ((v13 & 0x10000000000) == 0)
          {
LABEL_18:
            v15 = objc_msgSend(v11, "bleRSSIThresholdHint");
            if ((v15 & (v15 >> 31)) <= -90)
              v16 = -90;
            else
              v16 = v15 & (v15 >> 31);
            v17 = objc_msgSend(v11, "bleScanRateOverride");
            if (!v17 && (self->_screenOn || (v17 = objc_msgSend(v11, "bleScanRateScreenOff")) == 0))
            {
              v17 = objc_msgSend(v11, "bleScanRate");
              if (!v17)
                self->_scanRateAnyDefault = 1;
            }
            if (v17 > self->_scanRateHighest)
              self->_scanRateHighest = v17;
            v39 |= (v13 >> 18) & 1;
            if ((v39 & 1) != 0)
            {
              v18 = sub_1000438A4();
              v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 2344))(v18);
            }
            else
            {
              v19 = 0;
            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceFilter"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _deviceFilterUUIDs:](self, "_deviceFilterUUIDs:", v20));

            if (objc_msgSend(v21, "count"))
              v22 = 3;
            else
              v22 = 2;
            v41 = v22;
            if (v38 == 19)
            {
              if (objc_msgSend(v11, "bleRSSIThresholdOrder"))
              {
                bzero(&v56, 0x16uLL);
                bzero(&v54, 0x16uLL);
                v47 = 0;
                v48 = 0;
                sub_10003994C(&v47, &v56, 0x16uLL);
                v45 = 0;
                v46 = 0;
                sub_10003994C(&v45, &v54, 0x16uLL);
                v27 = objc_msgSend(v11, "bleRSSIThresholdOrder");
                v28 = objc_msgSend(v11, "bleRSSIThresholdOrder");
                if (v16)
                  v29 = v16;
                else
                  v29 = -90;
                sub_10003BFE0((uint64_t)a6, CFSTR("Placeholder"), 0x13u, v41, (uint64_t)&v47, (uint64_t)&v45, v29, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 1, (v27 & 4) != 0, (v28 & 0x80) != 0, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                goto LABEL_95;
              }
            }
            else if (v38 == 21)
            {
              bzero(&v56, 0x16uLL);
              bzero(&v54, 0x16uLL);
              if ((v13 & 0x2000000400020108) == 0)
              {
                v26 = objc_msgSend(v11, "discoveryTypesContainTypes:", CBDiscoveryTypesNearbyActionV2(v23));
                if (!(_DWORD)v26)
                  goto LABEL_112;
                v26 = objc_msgSend(v11, "discoveryTypesContainTypes:", CBDiscoveryTypesNeedsIdentify());
                if (!(_DWORD)v26)
                  goto LABEL_112;
              }
              if ((id)-[NSData length](self->_selfAuthTag, "length") != (id)3)
              {
                if (dword_100977ED8 <= 90
                  && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 90)))
                {
                  LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _addTypeWithParamsIfNeeded:matchFlags:matchTypes:scanRequest:]", 90, "Authtag length doesn't match set: %lu, required: %d", -[NSData length](self->_selfAuthTag, "length"), 3);
                }

                goto LABEL_109;
              }
              v24 = self->_selfAuthTag;

              LOBYTE(v56) = 1;
              LOBYTE(v54) = 1;
              v25 = -[NSData length](v24, "length");
              v36 = objc_retainAutorelease(v24);
              v26 = memcpy((char *)&v56 + 2, -[NSData bytes](v36, "bytes"), v25);
              if (v25)
                v26 = memset((char *)&v54 + 2, 255, v25);
              if ((v13 & 0x2000000400020108) == 0)
              {
LABEL_112:
                if (!objc_msgSend(v11, "discoveryTypesContainTypes:", CBDiscoveryTypesNearbyActionV2(v26)))goto LABEL_99;
              }
              if ((v13 & 0x400000000) != 0)
              {
                BYTE1(v56) = 38;
                BYTE1(v54) = 38;
                v47 = 0;
                v48 = 0;
                sub_10003994C(&v47, &v56, 0x16uLL);
                v45 = 0;
                v46 = 0;
                sub_10003994C(&v45, &v54, 0x16uLL);
                if (v16)
                  v31 = v16;
                else
                  v31 = -90;
                sub_10003BFE0((uint64_t)a6, CFSTR("Ensemble"), 0x15u, v41, (uint64_t)&v47, (uint64_t)&v45, v31, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                v45 = &off_100918258;
                if (v46)
                  sub_100056AAC(v46);
                v47 = &off_100918258;
                if (v48)
                  sub_100056AAC(v48);
              }
              if ((v13 & 8) != 0)
              {
                BYTE1(v56) = 51;
                BYTE1(v54) = 51;
                v47 = 0;
                v48 = 0;
                sub_10003994C(&v47, &v56, 0x16uLL);
                v45 = 0;
                v46 = 0;
                sub_10003994C(&v45, &v54, 0x16uLL);
                if (v16)
                  v32 = v16;
                else
                  v32 = -90;
                sub_10003BFE0((uint64_t)a6, CFSTR("CLink"), 0x15u, v41, (uint64_t)&v47, (uint64_t)&v45, v32, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                v45 = &off_100918258;
                if (v46)
                  sub_100056AAC(v46);
                v47 = &off_100918258;
                if (v48)
                  sub_100056AAC(v48);
              }
              if ((v13 & 0x100) != 0)
              {
                BYTE1(v56) = 50;
                BYTE1(v54) = 50;
                v47 = 0;
                v48 = 0;
                sub_10003994C(&v47, &v56, 0x16uLL);
                v45 = 0;
                v46 = 0;
                sub_10003994C(&v45, &v54, 0x16uLL);
                if (v16)
                  v33 = v16;
                else
                  v33 = -90;
                sub_10003BFE0((uint64_t)a6, CFSTR("RDisplay"), 0x15u, v41, (uint64_t)&v47, (uint64_t)&v45, v33, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                v45 = &off_100918258;
                if (v46)
                  sub_100056AAC(v46);
                v47 = &off_100918258;
                if (v48)
                  sub_100056AAC(v48);
              }
              if ((v13 & 0x20000) != 0)
              {
                BYTE1(v56) = 41;
                BYTE1(v54) = 41;
                v47 = 0;
                v48 = 0;
                sub_10003994C(&v47, &v56, 0x16uLL);
                v45 = 0;
                v46 = 0;
                sub_10003994C(&v45, &v54, 0x16uLL);
                if (v16)
                  v34 = v16;
                else
                  v34 = -90;
                sub_10003BFE0((uint64_t)a6, CFSTR("RemotePairing"), 0x15u, v41, (uint64_t)&v47, (uint64_t)&v45, v34, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                v45 = &off_100918258;
                if (v46)
                  sub_100056AAC(v46);
                v47 = &off_100918258;
                if (v48)
                  sub_100056AAC(v48);
              }
              if ((v13 & 0x2000000000000000) == 0)
                goto LABEL_99;
              BYTE1(v56) = 40;
              BYTE1(v54) = 40;
              v47 = 0;
              v48 = 0;
              sub_10003994C(&v47, &v56, 0x16uLL);
              v45 = 0;
              v46 = 0;
              sub_10003994C(&v45, &v54, 0x16uLL);
              if (v16)
                v35 = v16;
              else
                v35 = -90;
              sub_10003BFE0((uint64_t)a6, CFSTR("Wombat"), 0x15u, v41, (uint64_t)&v47, (uint64_t)&v45, v35, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 0, 0, 1, 0, 0xFFFF,
                0xFFFF,
                0xFFFF);
LABEL_95:
              v45 = &off_100918258;
              if (v46)
                sub_100056AAC(v46);
              v47 = &off_100918258;
              if (v48)
                sub_100056AAC(v48);
LABEL_99:

              continue;
            }
            bzero(&v56, 0x16uLL);
            bzero(&v54, 0x16uLL);
            v47 = 0;
            v48 = 0;
            sub_10003994C(&v47, &v56, 0x16uLL);
            v45 = 0;
            v46 = 0;
            sub_10003994C(&v45, &v54, 0x16uLL);
            if (v16)
              v30 = v16;
            else
              v30 = -90;
            sub_10003BFE0((uint64_t)a6, CFSTR("Placeholder"), v38, v41, (uint64_t)&v47, (uint64_t)&v45, v30, 0, (v13 & 0x200000000) != 0, self->_targetCore, 1, v21, v19, 0, 0, 0, 1, 0, 0xFFFF,
              0xFFFF,
              0xFFFF);
            goto LABEL_95;
          }
LABEL_17:
          self->_anyRangeScan = 1;
          goto LABEL_18;
        }
      }
    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v9)
      continue;
    break;
  }
LABEL_109:

}

- (BOOL)_addMfgScanIfNeeded:(unint64_t)a3 scanRequest:(void *)a4
{
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_discoveryArray;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (unint64_t)objc_msgSend(v10, "discoveryFlags", (_QWORD)v15);
        v12 = (unint64_t)objc_msgSend(v10, "extraDiscoveryFlags") | v11;
        if ((v12 & a3) != 0)
        {
          self->_aggregateDiscoveryFlags |= v12;
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)_addBufferedTypesIfNeeded:(id *)a3 scanRequest:(void *)a4
{
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  signed int v14;
  int v15;
  unsigned int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_discoveryArray;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "discoveryTypesContainTypes:", a3) & 1) != 0)
        {
          v11 = objc_retainAutorelease(v10);
          CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, objc_msgSend(v11, "discoveryTypesInternalPtr"));
          v12 = (unint64_t)objc_msgSend(v11, "discoveryFlags");
          v13 = (unint64_t)objc_msgSend(v11, "extraDiscoveryFlags") | v12;
          self->_aggregateDiscoveryFlags |= v13;
          if ((v13 & 0x100000000000) == 0)
          {
            v17 = 0x2000;
            if (objc_msgSend(v11, "discoveryTypesContainTypes:", &v17))
              self->_aopBTTypes |= 1u;
            v16 = 0x80000000;
            if (objc_msgSend(v11, "discoveryTypesContainTypes:", &v16))
              self->_aopBTTypes |= 2u;
            v15 = 0x8000000;
            if (objc_msgSend(v11, "discoveryTypesContainTypes:", &v15))
              self->_aopBTTypes |= 4u;
            if (objc_msgSend(v11, "useCase") == 269)
            {
              self->_anyLeechBufferScan = 1;
            }
            else
            {
              self->_anyNonLeechBufferScan = 1;
              v14 = objc_msgSend(v11, "bleScanRateOverride");
              if (!v14 && (self->_screenOn || (v14 = objc_msgSend(v11, "bleScanRateScreenOff")) == 0))
              {
                v14 = objc_msgSend(v11, "bleScanRate");
                if (!v14)
                  self->_scanRateAnyDefault = 1;
              }
              if (v14 > self->_scanRateHighest)
                self->_scanRateHighest = v14;
            }
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)_advBufferDrained
{
  if (dword_100977ED8 <= 30 && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _advBufferDrained]", 30, "ADV buffer drained");
}

- (id)description
{
  return -[CBStackBLEScannerBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4;
  char *v5;
  NSMutableArray *bufferedDevices;
  const char *v7;
  uint64_t v8;
  const char *v10;
  id *v11;
  NSMutableDictionary *deviceMap;
  unint64_t v13;
  BOOL v14;
  char *v15;
  id *v16;
  id v17;
  id obj;
  _QWORD v19[6];
  unsigned int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v5 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  bufferedDevices = self->_bufferedDevices;
  if (bufferedDevices)
    bufferedDevices = (NSMutableArray *)-[NSMutableArray count](bufferedDevices, "count");
  if (v4 < 0x15)
  {
    v27 = 0;
    v28 = (id *)&v27;
    v29 = 0x3032000000;
    v30 = sub_1000624EC;
    v31 = sub_100062330;
    v32 = 0;
    v26 = 0;
    v10 = "yes";
    if (!self->_screenOn)
      v10 = "no";
    NSAppendPrintF_safe(&v26, "== CBStackBLEScanner: ID %@, devices %d, bufferedDevices %d, screenOn %s, scan %@ ==", self->_identifier, v5, bufferedDevices, v10, self->_scanSummary);
    objc_storeStrong(&v32, v26);
    v11 = v28;
    v25 = v28[5];
    NSAppendPrintF_safe(&v25, "\n");
    objc_storeStrong(v11 + 5, v25);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    deviceMap = self->_deviceMap;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AFFE8;
    v19[3] = &unk_100917278;
    v19[4] = &v27;
    v19[5] = &v21;
    v20 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v19);
    v13 = v22[3];
    v14 = (unint64_t)v5 >= v13;
    v15 = &v5[-v13];
    if (v15 != 0 && v14)
    {
      v16 = v28;
      obj = v28[5];
      NSAppendPrintF_safe(&obj, "... %d more, %d total\n", (_DWORD)v15, (_DWORD)v5);
      objc_storeStrong(v16 + 5, obj);
    }
    _Block_object_dispose(&v21, 8);
    v17 = v28[5];
    _Block_object_dispose(&v27, 8);

    return v17;
  }
  else
  {
    v7 = "yes";
    if (!self->_screenOn)
      v7 = "no";
    v8 = NSPrintF_safe("CBStackBLEScanner: ID %@, devices %d, buffered devices %d, screenOn %s, scan %@", self->_identifier, v5, bufferedDevices, v7, self->_scanSummary);
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (void)invalidate
{
  CBStackBLEScannerBTStack *bleScannerObjC;
  CBStackBLEScannerBTStack *v4;
  uint64_t v5;
  void *sessionHandle;
  uint64_t v7;
  OS_dispatch_source *rescanTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  _QWORD v11[6];
  _QWORD v12[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (self->_bleScannerCPP._bleScannerObjC)
    {
      if (dword_100977ED8 <= 30
        && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
      {
        LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack invalidate]", 30, "Invalidate");
      }
      if (qword_100977FB0 != -1)
        dispatch_once(&qword_100977FB0, &stru_100918A80);
      sub_100069060((uint64_t)off_100977FA8 + 1872, (uint64_t)&self->_bleScannerCPP);
      bleScannerObjC = self->_bleScannerCPP._bleScannerObjC;
      self->_bleScannerCPP._bleScannerObjC = 0;

      v4 = self;
      v5 = sub_1000419F4();
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = nullsub_77;
      v12[3] = &unk_1009172A0;
      v12[4] = v4;
      sub_100041A34(v5, v12);

    }
    if (self->_scanning)
    {
      sessionHandle = self->_sessionHandle;
      v7 = sub_1000419F4();
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000B0264;
      v11[3] = &unk_100918868;
      v11[4] = self;
      v11[5] = sessionHandle;
      sub_100041A34(v7, v11);
    }
    rescanTimer = self->_rescanTimer;
    if (rescanTimer)
    {
      v9 = rescanTimer;
      dispatch_source_cancel(v9);
      v10 = self->_rescanTimer;
      self->_rescanTimer = 0;

    }
    -[CBStackBLEScannerBTStack _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  BTSessionImpl *btSession;
  void *sessionHandle;
  uint64_t v5;
  void (**v6)(_QWORD);
  id deviceFoundHandler;
  id deviceLostHandler;
  id devicesBufferedHandler;
  NSArray *discoveryArray;
  id invalidationHandler;
  NSMutableDictionary *suppressedOobKeys;
  NSMutableDictionary *suppressedDeviceFilter;
  _QWORD v14[6];

  if (!self->_scanning && !self->_invalidateDone)
  {
    btSession = self->_btSession;
    if (btSession)
    {
      sessionHandle = self->_sessionHandle;
      v5 = sub_1000419F4();
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000B04DC;
      v14[3] = &unk_100918090;
      v14[4] = sessionHandle;
      v14[5] = btSession;
      sub_100041A34(v5, v14);
      self->_btSession = 0;
    }
    -[CBStackBLEScannerBTStack _oobKeysRemoveAll](self, "_oobKeysRemoveAll");
    v6 = (void (**)(_QWORD))objc_retainBlock(self->_invalidationHandler);
    self->_sessionHandle = 0;
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    devicesBufferedHandler = self->_devicesBufferedHandler;
    self->_devicesBufferedHandler = 0;

    discoveryArray = self->_discoveryArray;
    self->_discoveryArray = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    suppressedOobKeys = self->_suppressedOobKeys;
    self->_suppressedOobKeys = 0;

    suppressedDeviceFilter = self->_suppressedDeviceFilter;
    self->_suppressedDeviceFilter = 0;

    self->_invalidateDone = 1;
    if (v6)
      v6[2](v6);
    if (dword_100977ED8 <= 30
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    {
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _invalidated]", 30, "Invalidated");
    }

  }
}

- (void)deviceLost:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v4);
    if (dword_100977ED8 <= 15
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 15)))
    {
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceLost:]", 15, "Device lost: %@", v5);
    }
    v6 = objc_retainBlock(self->_deviceLostHandler);
    v7 = v6;
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v5);

  }
  else if (dword_100977ED8 <= 20
         && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 20)))
  {
    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceLost:]", 20, "Device lost unknown: %@", v4);
  }

}

- (void)deviceBuffered:(id)a3
{
  NSMutableArray *bufferedDevices;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (!self->_invalidateCalled)
  {
    bufferedDevices = self->_bufferedDevices;
    if (!bufferedDevices)
    {
      v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v6 = self->_bufferedDevices;
      self->_bufferedDevices = v5;

      bufferedDevices = self->_bufferedDevices;
    }
    -[NSMutableArray addObject:](bufferedDevices, "addObject:", v7);
    if (dword_100977ED8 <= 30
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    {
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack deviceBuffered:]", 30, "inDevice buffered: %@", v7);
    }
  }

}

- (void)_deviceSegmentFound:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *safetyAlertsDevices;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char v24;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryTypesContainType:", 26))
  {
    if (!self->_safetyAlertsDevices)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      safetyAlertsDevices = self->_safetyAlertsDevices;
      self->_safetyAlertsDevices = v5;

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safetyAlertsAlertID"));
    if (v7)
    {
      v8 = objc_msgSend(v4, "safetyAlertsVersion");
      v24 = v8;
      if (v8)
      {
        v9 = objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v9, "appendBytes:length:", &v24, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v9));

        if (!v10)
        {
          v11 = objc_alloc_init((Class)NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_safetyAlertsDevices, "setObject:forKeyedSubscript:", v11, v9);

        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v4, "safetyAlertsSegmentSegmentNumber")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v9));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, v12);

        if (dword_100977ED8 <= 30
          && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
        {
          LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _deviceSegmentFound:]", 30, "Safety Alerts segment found: %@", v4);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v9));
        v15 = objc_msgSend(v14, "count");
        v16 = objc_msgSend(v4, "safetyAlertsSegmentSegmentsTotal");

        if (v15 == (id)v16)
        {
          v17 = objc_alloc_init((Class)CBDevice);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
          objc_msgSend(v17, "setIdentifier:", v18);

          objc_msgSend(v17, "setInternalFlags:", objc_msgSend(v4, "internalFlags"));
          objc_msgSend(v17, "updateWithCBDevice:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v9));
          v23 = 0;
          objc_msgSend(v17, "updateWithSafetyAlertsSegments:error:", v19, &v23);
          v20 = v23;

          if (v20)
          {
            if (dword_100977ED8 <= 90
              && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 90)))
            {
              LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _deviceSegmentFound:]", 90, "Safety Alerts update failed with error: %@", v20);
            }
          }
          else
          {
            if (dword_100977ED8 <= 30
              && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
            {
              LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _deviceSegmentFound:]", 30, "Safety Alerts found: %@", v17);
            }
            v21 = objc_retainBlock(self->_deviceFoundHandler);
            v22 = v21;
            if (v21)
              (*((void (**)(id, id))v21 + 2))(v21, v17);

          }
        }

      }
      else if (dword_100977ED8 <= 90
             && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 90)))
      {
        LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _deviceSegmentFound:]", 90, "Safety Alerts segment has no version");
      }
    }
    else if (dword_100977ED8 <= 90
           && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 90)))
    {
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _deviceSegmentFound:]", 90, "Safety Alerts segment has no alert ID");
    }

  }
}

- (void)_deviceSegmentLost:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryTypesContainType:", 26))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safetyAlertsAlertID"));
    if (v5)
    {
      v6 = objc_msgSend(v4, "safetyAlertsVersion");
      v13 = v6;
      if (v6)
      {
        v7 = objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v7, "appendBytes:length:", &v13, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v4, "safetyAlertsSegmentSegmentNumber")));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v7));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v7));
          objc_msgSend(v10, "removeObjectForKey:", v8);

          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v7));
          v12 = objc_msgSend(v11, "count");

          if (!v12)
            -[NSMutableDictionary removeObjectForKey:](self->_safetyAlertsDevices, "removeObjectForKey:", v7);
        }

      }
    }

  }
}

- (void)finishDiscovery:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);

  v6 = (void (**)(id, id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = objc_alloc_init((Class)CBDiscoverySummary);
  v6[2](v6, v5, 0);

}

- (id)_packetTypeForDiscovery:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (unint64_t)objc_msgSend(v3, "discoveryFlags");
  v6 = (unint64_t)objc_msgSend(v3, "extraDiscoveryFlags");
  v7 = v6 | v5;
  if ((v7 & 0x4000000000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960340);
  if ((v7 & 0x8000000000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960358);
  if ((v7 & 0x800000000000000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960370);
  if ((v7 & 0x400000000000000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960388);
  if ((v7 & 0x400000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_1009603A0);
  if ((v7 & 0x1000000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_1009603B8);
  if ((v7 & 0x40) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_1009603D0);
  if ((v7 & 0x60000000000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_1009603E8);
  if ((v7 & 0x40) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_1009603D0);
  if ((v7 & 0x40000) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960400);
  if ((v7 & 0x5030800010083E37) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960418);
  if ((v7 & 0x2000000400020108) != 0)
    v6 = (unint64_t)objc_msgSend(v4, "addObject:", &off_100960430);
  if ((v7 & 0x5030800010083E37) != 0
    || (v8 = objc_msgSend(v3, "discoveryTypesContainTypes:", CBDiscoveryTypesNearbyActionV1(v6)), (_DWORD)v8))
  {
    v8 = objc_msgSend(v4, "addObject:", &off_100960418);
  }
  if ((v7 & 0x2000000400020108) != 0
    || objc_msgSend(v3, "discoveryTypesContainTypes:", CBDiscoveryTypesNearbyActionV2(v8)))
  {
    objc_msgSend(v4, "addObject:", &off_100960430);
  }
  v15 = 1024;
  if ((v7 & 0x1C080) != 0 || objc_msgSend(v3, "discoveryTypesContainTypes:", &v15))
    objc_msgSend(v4, "addObject:", &off_100960448);
  v14 = 128;
  if (objc_msgSend(v3, "discoveryTypesContainTypes:", &v14))
    objc_msgSend(v4, "addObject:", &off_100960460);
  v13 = 2;
  v9 = objc_msgSend(v3, "discoveryTypesContainTypes:", &v13);
  if ((_DWORD)v9)
    v9 = objc_msgSend(v4, "addObject:", &off_100960478);
  if (objc_msgSend(v3, "discoveryTypesContainTypes:", CBDiscoveryTypesNearbyInfoV2(v9)))
    objc_msgSend(v4, "addObject:", &off_100960490);
  v12 = 32;
  if (objc_msgSend(v3, "discoveryTypesContainTypes:", &v12))
    objc_msgSend(v4, "addObject:", &off_1009604A8);
  v11 = 768;
  if (objc_msgSend(v3, "discoveryTypesContainTypes:", &v11))
    objc_msgSend(v4, "addObject:", &off_1009604C0);

  return v4;
}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4;
  void *sessionHandle;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  _QWORD v12[5];
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sessionHandle = self->_sessionHandle;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _packetTypeForDiscovery:](self, "_packetTypeForDiscovery:", v4));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "unsignedCharValue");
        v11 = sub_1000419F4();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000B1328;
        v12[3] = &unk_100918888;
        v13 = v10;
        v12[4] = sessionHandle;
        sub_100041A34(v11, v12);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_aopBTBufferDrained
{
  NSMutableArray *bufferedDevices;
  id v4;
  void *v5;
  NSMutableArray *v6;

  bufferedDevices = self->_bufferedDevices;
  if (bufferedDevices)
  {
    if (dword_100977ED8 <= 30)
    {
      if (dword_100977ED8 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977ED8, 30))
          goto LABEL_6;
        bufferedDevices = self->_bufferedDevices;
      }
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _aopBTBufferDrained]", 30, "AOP BT buffer drained reporting %d devices", -[NSMutableArray count](bufferedDevices, "count"));
    }
LABEL_6:
    v4 = objc_retainBlock(self->_devicesBufferedHandler);
    v5 = v4;
    if (v4)
      (*((void (**)(id, NSMutableArray *))v4 + 2))(v4, self->_bufferedDevices);

    v6 = self->_bufferedDevices;
    self->_bufferedDevices = 0;

    return;
  }
  if (dword_100977ED8 <= 30 && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 30)))
    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _aopBTBufferDrained]", 30, "AOP BT buffer drained, but no devices buffered");
}

- (void)_oobKeysRemoveAll
{
  NSMutableDictionary *oobKeyMap;
  uint64_t v4;
  id v5;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_oobKeyMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100918918);
  oobKeyMap = self->_oobKeyMap;
  self->_oobKeyMap = 0;

  if (qword_100977FD0 != -1)
    dispatch_once(&qword_100977FD0, &stru_100918B00);
  v4 = qword_100977FC8;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  sub_10039E68C(v4, v5);

  self->_proxyoobKeysHash = 0;
}

- (void)_proxyOOBKeysUpdateOnDeviceFound:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSArray *obj;
  void *v15;
  void *v16;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  _BYTE v30[128];

  v13 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nearbyActionNoWakeAuthTagData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "btAddressData"));
  v4 = sub_1000438A4();
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 2376))(v4);
  if (v16)
    v6 = v5;
  else
    v6 = 0;
  if ((v6 & 1) != 0 && (objc_msgSend(v13, "nearbyActionNoWakeType") & 1) != 0 && v15)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_1000624EC;
    v28[4] = sub_100062330;
    v29 = 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = self->_discoveryArray;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v18 = 0;
          v19 = &v18;
          v20 = 0x3032000000;
          v21 = sub_1000624EC;
          v22 = sub_100062330;
          v23 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "oobKeys"));
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1000B28C0;
          v17[3] = &unk_100918940;
          v17[4] = v16;
          v17[5] = v15;
          v17[7] = v28;
          v17[8] = &v18;
          v17[6] = v10;
          objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

          if (v19[5])
          {
            objc_msgSend(v10, "setOobKeys:");
            if (dword_100977ED8 <= 20
              && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 20)))
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "oobKeys"));
              LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _proxyOOBKeysUpdateOnDeviceFound:]", 20, "Updated discoveryObject.oobKeys: %@", v12);

            }
          }
          _Block_object_dispose(&v18, 8);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v7);
    }

    _Block_object_dispose(v28, 8);
  }

}

- (void)_rescanTimerFired
{
  void (**v3)(id, void *);
  unint64_t scanTicks;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21[16];
  _BYTE v22[128];

  if (dword_100977ED8 <= 15 && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 15)))
    LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _rescanTimerFired]", 15, "Rescan timer: %d device(s)", -[NSMutableDictionary count](self->_deviceMap, "count"));
  v3 = (void (**)(id, void *))objc_retainBlock(self->_deviceLostHandler);
  scanTicks = self->_scanTicks;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceMap, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v8));
        if ((unint64_t)objc_msgSend(v9, "lastSeenTicks") < scanTicks)
        {
          if (((unint64_t)objc_msgSend(v9, "discoveryFlags") & 0x1400000) == 0)
            goto LABEL_19;
          v10 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v8);
          if (!v10)
            goto LABEL_19;
          if (qword_1009778A8 != -1)
            dispatch_once(&qword_1009778A8, &stru_100918B20);
          v11 = (uint64_t)off_1009778A0;
          sub_100030BCC(v21, v10);
          LOBYTE(v11) = sub_100069F08(v11, v21);

          if ((v11 & 1) != 0)
          {
            if (dword_100977ED8 <= 20
              && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 20)))
            {
              LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _rescanTimerFired]", 20, "Device connected without adv: %@", v9);
            }
            objc_msgSend(v9, "setLastSeenTicks:", mach_absolute_time());
          }
          else
          {
LABEL_19:
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v8);
            if (dword_100977ED8 <= 20
              && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 20)))
            {
              v12 = mach_absolute_time();
              v13 = UpTicksToSeconds(v12 - (_QWORD)objc_msgSend(v9, "lastSeenTicks"));
              v14 = CUPrintDuration64(v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
              LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _rescanTimerFired]", 20, "Device lost: %@, lastSeen %@", v9, v15);

            }
            if ((objc_msgSend(v9, "internalFlags") & 0x4000) != 0)
              -[CBStackBLEScannerBTStack _deviceSegmentLost:](self, "_deviceSegmentLost:", v9);
            if (v3)
              v3[2](v3, v9);
          }
        }

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  -[CBStackBLEScannerBTStack _activate:](self, "_activate:", 1);
}

- (void)sessionHandle
{
  return self->_sessionHandle;
}

- (void)_typeToRssiThresholdUpdate
{
  id v3;
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  CBStackBLEScannerBTStack *v23;
  NSArray *obj;
  uint64_t v25;
  id v26;
  void *i;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];
  _BYTE v43[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = self;
  obj = self->_discoveryArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v4)
  {
    v5 = 0;
    v25 = *(_QWORD *)v35;
    v26 = v4;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "typeToRssiThresholds"));
        if (v7)
        {
          v8 = objc_retainAutorelease(v6);
          v9 = *((char *)objc_msgSend(v8, "discoveryTypesInternalPtr") + 3) >= 0;

          if (!v9)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "typeToRssiThresholds"));
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v11; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v31 != v12)
                    objc_enumerationMutation(v10);
                  v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
                  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "applePayloadType")));
                  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "rssiThreshold")));
                  objc_msgSend(v3, "setObject:forKey:", v16, v15);
                  v17 = (unint64_t)objc_msgSend(v14, "hash");

                  v5 ^= v17;
                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
              }
              while (v11);
            }

          }
        }
      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v26);
  }
  else
  {
    v5 = 0;
  }

  if (self->_typeToRssiThresholdHash != v5)
  {
    v40[1] = CFSTR("descriptor");
    v41[0] = &off_1009604D8;
    v40[0] = CFSTR("type");
    v38 = CFSTR("TypeToRssiThresholdMapping");
    v18 = objc_msgSend(v3, "copy");
    v39 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v41[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));

    if (dword_100977ED8 <= 40
      && (dword_100977ED8 != -1 || _LogCategory_Initialize(&dword_100977ED8, 40)))
    {
      LogPrintF_safe(&dword_100977ED8, "-[CBStackBLEScannerBTStack _typeToRssiThresholdUpdate]", 40, "typeToRssiThresholdHash changed from %ld to %ld. Sending report : %@", v23->_typeToRssiThresholdHash, v5, v20);
    }
    v21 = sub_100475B20();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000B34F4;
    v28[3] = &unk_1009172A0;
    v22 = v20;
    v29 = v22;
    sub_100041A34(v21, v28);
    v23->_typeToRssiThresholdHash = v5;

  }
}

- (void)_addUUIDIfNeededWithParams:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  signed int v16;
  int v17;
  char v18;
  _BOOL8 v19;
  uint64_t j;
  uint64_t k;
  void *v22;
  void *v23;
  NSArray *obj;
  uint64_t (**v27)();
  unsigned int *v28;
  uint64_t (**v29)();
  unsigned int *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[2];
  _BYTE v41[128];

  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_discoveryArray;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v13 = (unint64_t)objc_msgSend(v12, "discoveryFlags");
        v14 = (unint64_t)objc_msgSend(v12, "extraDiscoveryFlags") | v13;
        v15 = (v14 & a4) != 0;
        if (a5 && (v14 & a4) == 0)
          v15 = objc_msgSend(v12, "discoveryTypesContainTypes:", a5);
        if (v15)
        {
          self->_aggregateDiscoveryFlags |= v14;
          if (a5)
            CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, objc_msgSend(objc_retainAutorelease(v12), "discoveryTypesInternalPtr"));
          if ((v14 & 0x100000000000) == 0)
          {
            if ((v14 & 0x2000000000) != 0)
            {
              self->_anyActiveScan = 1;
              if ((v14 & 0x200000000) != 0)
                goto LABEL_22;
LABEL_15:
              if ((v14 & 0x10000000000) == 0)
              {
LABEL_17:
                v16 = objc_msgSend(v12, "bleScanRateOverride");
                if (!v16 && (self->_screenOn || (v16 = objc_msgSend(v12, "bleScanRateScreenOff")) == 0))
                {
                  v16 = objc_msgSend(v12, "bleScanRate");
                  if (!v16)
                    self->_scanRateAnyDefault = 1;
                }
                if (v16 > self->_scanRateHighest)
                  self->_scanRateHighest = v16;
                v17 = objc_msgSend(v12, "bleRSSIThresholdHint");
                if ((v17 & (v17 >> 31)) <= -90)
                  v18 = -90;
                else
                  v18 = v17 & (v17 >> 31);
                sub_10005F5E4((uint64_t)&v39, 65061);
                v19 = sub_100072DF0(&a3->var0.var0, (unsigned __int8 *)&v39);
                if (v19)
                {
                  if (objc_msgSend(v12, "discoveryTypesContainTypes:", CBDiscoveryTypesProximityService(v19)))
                  {
                    v39 = 0;
                    v40[0] = 0;
                    *(_QWORD *)((char *)v40 + 6) = 0;
                    v37 = 0;
                    v38[0] = 0;
                    *(_QWORD *)((char *)v38 + 6) = 0;
                    if ((*((_BYTE *)objc_msgSend(objc_retainAutorelease(v12), "discoveryTypesInternalPtr") + 2) & 2) != 0)
                    {
                      for (j = 0; j != 22; ++j)
                        *((_BYTE *)&v40[-1] + j) = 0;
                      for (k = 0; k != 22; ++k)
                        *((_BYTE *)&v38[-1] + k) = 0;
                      LOBYTE(v39) = 6;
                      LOBYTE(v37) = 6;
                      v29 = 0;
                      v30 = 0;
                      sub_10003994C(&v29, &v39, 0x16uLL);
                      v27 = 0;
                      v28 = 0;
                      sub_10003994C(&v27, &v37, 0x16uLL);
                      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1009604F0, "stringValue"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "WatchSetup"));
                      v35 = *(_OWORD *)&a3->var0.var0;
                      v36 = *(_DWORD *)&a3->var0.var1.var2[12];
                      sub_1000B3950(a6, v22, v23, &v35, (uint64_t)&v29, (uint64_t)&v27, v18, 0, 0, self->_targetCore, 1, 0, 0, 1);

                      v27 = &off_100918258;
                      if (v28)
                        sub_100056AAC(v28);
                      v29 = &off_100918258;
                      if (v30)
                        sub_100056AAC(v30);
                    }
                  }
                }
                continue;
              }
            }
            else
            {
              if ((v14 & 0x200000000) == 0)
                goto LABEL_15;
LABEL_22:
              self->_anyNeedsDups = 1;
              if ((v14 & 0x10000000000) == 0)
                goto LABEL_17;
            }
            self->_anyRangeScan = 1;
            goto LABEL_17;
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v9);
  }

}

- (void)_addServiceUUIDsWithParametersToScanRequestIfNeeded:(void *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  signed int v10;
  int v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  char *v25;
  void *v26;
  void *v27;
  __int128 v28;
  id v29;
  char *v30;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  __int128 v46;
  char *v47;
  char *v48;
  char *v49;
  __int128 v50;
  _QWORD *v51;
  NSArray *obj;
  uint64_t v53;
  id v55;
  void *i;
  char v60;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t (**v65)();
  unsigned int *v66;
  uint64_t (**v67)();
  unsigned int *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  int v78;
  _OWORD v79[2];
  _OWORD __dst[2];
  __int128 v81;
  int v82;
  _BYTE v83[128];
  _BYTE v84[128];

  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = self->_discoveryArray;
  v55 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  if (v55)
  {
    v53 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v53)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
        v7 = (unint64_t)objc_msgSend(v6, "discoveryFlags");
        v62 = v6;
        v8 = (unint64_t)objc_msgSend(v6, "extraDiscoveryFlags") | v7;
        v9 = (v8 & a4) != 0;
        if (a5 && (v8 & a4) == 0)
          v9 = objc_msgSend(v62, "discoveryTypesContainTypes:", a5);
        if (!v9)
          continue;
        self->_aggregateDiscoveryFlags |= v8;
        if (a5)
          CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, objc_msgSend(objc_retainAutorelease(v62), "discoveryTypesInternalPtr"));
        if ((v8 & 0x100000000000) != 0)
          continue;
        if ((v8 & 0x2000000000) != 0)
        {
          self->_anyActiveScan = 1;
          if ((v8 & 0x200000000) != 0)
          {
LABEL_22:
            self->_anyNeedsDups = 1;
            if ((v8 & 0x10000000000) == 0)
              goto LABEL_17;
LABEL_16:
            self->_anyRangeScan = 1;
            goto LABEL_17;
          }
        }
        else if ((v8 & 0x200000000) != 0)
        {
          goto LABEL_22;
        }
        if ((v8 & 0x10000000000) != 0)
          goto LABEL_16;
LABEL_17:
        v10 = objc_msgSend(v62, "bleScanRateOverride");
        if (!v10 && (self->_screenOn || (v10 = objc_msgSend(v62, "bleScanRateScreenOff")) == 0))
        {
          v10 = objc_msgSend(v62, "bleScanRate");
          if (!v10)
            self->_scanRateAnyDefault = 1;
        }
        if (v10 > self->_scanRateHighest)
          self->_scanRateHighest = v10;
        v11 = objc_msgSend(v62, "bleRSSIThresholdHint");
        v12 = v11 & (v11 >> 31);
        v71 = 0u;
        v72 = 0u;
        if (v12 <= -90)
          LOBYTE(v12) = -90;
        v60 = v12;
        v69 = 0uLL;
        v70 = 0uLL;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "serviceUUIDs"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
        if (v14)
        {
          LODWORD(v15) = 0;
          v63 = v13;
          v64 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v70 != v64)
                objc_enumerationMutation(v63);
              v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serviceUUID"));
              v19 = v18;
              if (v18 && (unint64_t)objc_msgSend(v18, "length") <= 0xFF)
              {
                v81 = 0uLL;
                v82 = 0;
                v20 = objc_retainAutorelease(v19);
                sub_100069B04((uint64_t)&v81, (int8x16_t *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "blobData"));
                if (objc_msgSend(v21, "length"))
                {

LABEL_39:
                  memset(__dst, 0, 22);
                  memset(v79, 0, 22);
                  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "blobData")));
                  v25 = (char *)objc_msgSend(v24, "bytes");
                  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "blobData"));
                  if ((unint64_t)objc_msgSend(v26, "length") > 0x15)
                  {
                    v28 = *(_OWORD *)v25;
                    *(_QWORD *)((char *)__dst + 14) = *(_QWORD *)(v25 + 14);
                    __dst[0] = v28;
                  }
                  else
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "blobData"));
                    memcpy(__dst, v25, (size_t)objc_msgSend(v27, "length"));

                  }
                  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maskData")));
                  v30 = (char *)objc_msgSend(v29, "bytes");
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maskData"));
                  if ((unint64_t)objc_msgSend(v31, "length") > 0x15)
                  {
                    v33 = *(_OWORD *)v30;
                    *(_QWORD *)((char *)v79 + 14) = *(_QWORD *)(v30 + 14);
                    v79[0] = v33;
                  }
                  else
                  {
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maskData"));
                    memcpy(v79, v30, (size_t)objc_msgSend(v32, "length"));

                  }
                  v67 = 0;
                  v68 = 0;
                  sub_10003994C(&v67, __dst, 0x16uLL);
                  v65 = 0;
                  v66 = 0;
                  sub_10003994C(&v65, v79, 0x16uLL);
                  v15 = (v15 + 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ServiceUUIDwithBlobMask-%d"), v15));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "appID"));
                  v77 = v81;
                  v78 = v82;
                  sub_1000B3950(a3, v34, v35, &v77, (uint64_t)&v67, (uint64_t)&v65, v60, 0, 0, self->_targetCore, 1, 0, 0, 1);

                  v65 = &off_100918258;
                  if (v66)
                    sub_100056AAC(v66);
                  v67 = &off_100918258;
                  if (v68)
                    sub_100056AAC(v68);
                  goto LABEL_67;
                }
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maskData"));
                v23 = objc_msgSend(v22, "length") == 0;

                if (!v23)
                  goto LABEL_39;
                v37 = *((_QWORD *)a6 + 1);
                v36 = *((_QWORD *)a6 + 2);
                if (v37 >= v36)
                {
                  v40 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v37 - *(_QWORD *)a6) >> 2);
                  v41 = v40 + 1;
                  if (v40 + 1 > 0xCCCCCCCCCCCCCCCLL)
                    abort();
                  v42 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v36 - *(_QWORD *)a6) >> 2);
                  if (2 * v42 > v41)
                    v41 = 2 * v42;
                  if (v42 >= 0x666666666666666)
                    v43 = 0xCCCCCCCCCCCCCCCLL;
                  else
                    v43 = v41;
                  if (v43)
                    v44 = (char *)sub_1000B58EC((uint64_t)a6 + 16, v43);
                  else
                    v44 = 0;
                  v45 = &v44[20 * v40];
                  v46 = v81;
                  *((_DWORD *)v45 + 4) = v82;
                  *(_OWORD *)v45 = v46;
                  v48 = *(char **)a6;
                  v47 = (char *)*((_QWORD *)a6 + 1);
                  v49 = v45;
                  if (v47 == *(char **)a6)
                  {
                    v51 = a6;
                  }
                  else
                  {
                    do
                    {
                      v50 = *(_OWORD *)(v47 - 20);
                      *((_DWORD *)v49 - 1) = *((_DWORD *)v47 - 1);
                      *(_OWORD *)(v49 - 20) = v50;
                      v49 -= 20;
                      v47 -= 20;
                    }
                    while (v47 != v48);
                    v51 = a6;
                    v47 = *(char **)a6;
                  }
                  v39 = v45 + 20;
                  *v51 = v49;
                  v51[1] = v45 + 20;
                  v51[2] = &v44[20 * v43];
                  if (v47)
                    operator delete(v47);
                }
                else
                {
                  v38 = v81;
                  *(_DWORD *)(v37 + 16) = v82;
                  *(_OWORD *)v37 = v38;
                  v39 = (char *)(v37 + 20);
                }
                *((_QWORD *)a6 + 1) = v39;
              }
LABEL_67:

            }
            v13 = v63;
            v14 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
          }
          while (v14);
        }

      }
      v55 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    }
    while (v55);
  }

}

- (unint64_t)aggregateDiscoveryFlags
{
  CBStackBLEScannerBTStack *v2;
  unint64_t aggregateDiscoveryFlags;

  v2 = self;
  objc_sync_enter(v2);
  aggregateDiscoveryFlags = v2->_aggregateDiscoveryFlags;
  objc_sync_exit(v2);

  return aggregateDiscoveryFlags;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)aggregateDiscoveryTypes
{
  CBStackBLEScannerBTStack *v2;
  $A0BF7C2F34202597F9F30F6CD4123348 aggregateDiscoveryTypes;

  v2 = self;
  objc_sync_enter(v2);
  aggregateDiscoveryTypes = ($A0BF7C2F34202597F9F30F6CD4123348)v2->_aggregateDiscoveryTypes;
  objc_sync_exit(v2);

  return aggregateDiscoveryTypes;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)devicesBufferedHandler
{
  return self->_devicesBufferedHandler;
}

- (void)setDevicesBufferedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (void)setSelfAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setSelfAuthTagNonConnectable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfAuthTagNonConnectable, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryArray, 0);
  objc_storeStrong(&self->_devicesBufferedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_scanSummary, 0);
  objc_storeStrong((id *)&self->_safetyAlertsDevices, 0);
  objc_storeStrong((id *)&self->_suppressedDeviceFilter, 0);
  objc_storeStrong((id *)&self->_suppressedOobKeys, 0);
  objc_storeStrong((id *)&self->_sensorTrackingDevices, 0);
  objc_storeStrong((id *)&self->_rescanTimer, 0);
  objc_storeStrong((id *)&self->_oobKeyMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_bufferedDevices, 0);

}

- (id).cxx_construct
{
  id v3;

  self->_bleScannerCPP._vptr$LeObserverListener = (void **)&off_100918A10;
  self->_bleScannerCPP._bleScannerObjC = 0;
  v3 = &_dispatch_main_q;
  self->_bleScannerCPP._dispatchQueue = (OS_dispatch_queue *)&_dispatch_main_q;
  self->_bleScannerCPP._reportedNonLeech = 0;
  return self;
}

@end
