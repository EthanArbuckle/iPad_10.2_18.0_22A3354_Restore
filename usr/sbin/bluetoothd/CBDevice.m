@implementation CBDevice

- (CBDevice)initWithBTStackDevice:(void *)a3 error:(id *)a4
{
  CBDevice *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  CBDevice *v18;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[6];
  objc_super v26;
  _QWORD v27[2];

  v26.receiver = self;
  v26.super_class = (Class)CBDevice;
  v6 = -[CBDevice init](&v26, "init");
  if (!v6)
  {
    if (a4)
    {
      v20 = objc_msgSend((id)objc_opt_class(0), "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = CBErrorF(4294960540, "%@ super init failed", v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v22);

    }
    goto LABEL_13;
  }
  v7 = *((unsigned __int8 *)a3 + 128);
  v8 = *((unsigned __int8 *)a3 + 129);
  v9 = *((unsigned __int8 *)a3 + 130);
  v10 = *((unsigned __int8 *)a3 + 131);
  v11 = *((unsigned __int8 *)a3 + 133);
  v12 = (v7 << 40) | (v8 << 32) | (v9 << 24) | (v10 << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 132) << 8);
  v13 = v12 | v11;
  if (!(v12 | v11))
  {
    if (a4)
    {
      v23 = CBErrorF(4294960535, "Get device address failed");
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v23);
      goto LABEL_8;
    }
LABEL_13:
    v18 = 0;
    goto LABEL_8;
  }
  v25[0] = v7;
  v25[1] = v8;
  v25[2] = v9;
  v25[3] = v10;
  v25[4] = BYTE1(v12);
  v25[5] = v11;
  v14 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v25, 6);
  -[CBDevice setBtAddressData:](v6, "setBtAddressData:", v14);

  v27[0] = 0;
  v27[1] = 0;
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100917EB0);
  sub_10003F924((uint64_t)off_1009778C0, v13, 1u, 1u, 0, 0, (unsigned __int8 *)v27);
  v15 = sub_100030DF4((const unsigned __int8 *)v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  if (v17)
  {
    -[CBDevice setIdentifier:](v6, "setIdentifier:", v17);
    v18 = v6;
  }
  else if (a4)
  {
    v24 = CBErrorF(4294960588, "Get device identifier failed");
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
  }
  else
  {
    v18 = 0;
  }

LABEL_8:
  return v18;
}

- (unint64_t)updateWithBLEDevice:(id)a3 btAddr:(unint64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  void *v14;
  _WORD *v15;
  BOOL v16;
  id v17;
  unsigned int v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  unsigned __int8 v51;
  int v52;
  unsigned int v53;
  int v54;
  _BOOL4 v55;
  id v57;
  BOOL v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  unsigned __int8 v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned __int8 v69;
  id v70;
  void *v71;
  void *v72;
  void *v74;
  int v75;
  __int16 v76;
  _QWORD v77[4];
  id v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  char v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  __int16 v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  char v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  char v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  __int16 v176;

  v6 = a3;
  v173 = 0;
  v174 = &v173;
  v175 = 0x2020000000;
  v176 = 0;
  v169 = 0;
  v170 = &v169;
  v171 = 0x2020000000;
  v172 = 0;
  v165 = 0;
  v166 = &v165;
  v167 = 0x2020000000;
  v168 = 0;
  v161 = 0;
  v162 = &v161;
  v163 = 0x2020000000;
  v164 = 0;
  v157 = 0;
  v158 = &v157;
  v159 = 0x2020000000;
  v160 = 0;
  v153 = 0;
  v154 = &v153;
  v155 = 0x2020000000;
  v156 = 0;
  v149 = 0;
  v150 = &v149;
  v151 = 0x2020000000;
  v152 = 0;
  v143 = 0;
  v144 = &v143;
  v145 = 0x3032000000;
  v146 = sub_10006249C;
  v147 = sub_100062308;
  v148 = 0;
  v139 = 0;
  v140 = &v139;
  v141 = 0x2020000000;
  v142 = 0;
  v135 = 0;
  v136 = &v135;
  v137 = 0x2020000000;
  v138 = 0;
  v131 = 0;
  v132 = &v131;
  v133 = 0x2020000000;
  v134 = 0;
  v125 = 0;
  v126 = &v125;
  v127 = 0x3032000000;
  v128 = sub_10006249C;
  v129 = sub_100062308;
  v130 = 0;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v124 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_10006249C;
  v119 = sub_100062308;
  v120 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = sub_10006249C;
  v109 = sub_100062308;
  v110 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100917EB0);
  v7 = off_1009778C0;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_10008E7C4;
  v77[3] = &unk_100917E70;
  v79 = &v173;
  v80 = &v157;
  v81 = &v153;
  v82 = &v165;
  v83 = &v161;
  v84 = &v143;
  v85 = &v139;
  v86 = &v135;
  v87 = &v131;
  v88 = &v125;
  v89 = &v121;
  v78 = v6;
  v90 = &v169;
  v91 = &v115;
  v92 = &v111;
  v93 = &v105;
  v94 = &v101;
  v95 = &v97;
  v96 = &v149;
  v74 = v78;
  sub_10065E6EC((uint64_t)v7, v78, v77);
  if (*((_WORD *)v174 + 12)
    && (v8 = -[CBDevice appearanceValue](self, "appearanceValue"), v8 != *((unsigned __int16 *)v174 + 12)))
  {
    -[CBDevice setAppearanceValue:](self, "setAppearanceValue:");
    v9 = 0x80000000000;
  }
  else
  {
    v9 = 0;
  }
  if ((unint64_t)objc_msgSend((id)v106[5], "length") < 5)
  {
    v13 = 0;
    v12 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_18;
  }
  else
  {
    v10 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease((id)v106[5]), "bytes");
    v11 = *v10;
    v12 = *(_WORD *)(v10 + 1);
    v13 = *(unsigned __int16 *)(v10 + 3);
    if (!a4)
      goto LABEL_18;
  }
  LOBYTE(v75) = BYTE5(a4);
  BYTE1(v75) = BYTE4(a4);
  BYTE2(v75) = BYTE3(a4);
  HIBYTE(v75) = BYTE2(a4);
  LOBYTE(v76) = BYTE1(a4);
  HIBYTE(v76) = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self, "btAddressData"));
  if (objc_msgSend(v14, "length") != (id)6
    || ((v15 = objc_msgSend(objc_retainAutorelease(v14), "bytes"), v75 == *(_DWORD *)v15)
      ? (v16 = v76 == v15[2])
      : (v16 = 0),
        !v16))
  {
    v17 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v75, 6);
    -[CBDevice setBtAddressData:](self, "setBtAddressData:", v17);

    v9 = 0x80000000000;
  }

LABEL_18:
  v18 = *((unsigned __int8 *)v170 + 24);
  if (!*((_BYTE *)v170 + 24))
    goto LABEL_30;
  if (v18 > 0xD)
    v19 = "?";
  else
    v19 = off_100917FB0[(char)(v18 - 1)];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btVersion](self, "btVersion"));
  v22 = v20;
  v23 = v21;
  if (v22 == v23)
  {

  }
  else
  {
    v24 = v23;
    if ((v22 == 0) != (v23 != 0))
    {
      v25 = objc_msgSend(v22, "isEqual:", v23);

      if ((v25 & 1) != 0)
        goto LABEL_29;
    }
    else
    {

    }
    -[CBDevice setBtVersion:](self, "setBtVersion:", v22);
    v9 = 0x80000000000;
  }
LABEL_29:

LABEL_30:
  v26 = -[CBDevice connectedServices](self, "connectedServices");
  v27 = *((unsigned __int8 *)v158 + 24);
  if (qword_100977908 != -1)
    dispatch_once(&qword_100977908, &stru_100917ED0);
  v28 = sub_1005357E0(qword_100977900, v74);
  if (v28 && *((_BYTE *)v132 + 24))
    v29 = v26 & 0xFFBFFFFF | (v27 << 22) | 0x10000;
  else
    v29 = v26 & 0xFFBEFFFF | (v27 << 22);
  if (v29 != v26)
  {
    -[CBDevice setConnectedServices:](self, "setConnectedServices:");
    v9 |= 0x80000200000uLL;
  }
  if (*((_WORD *)v154 + 12))
  {
    v30 = *((unsigned __int16 *)v154 + 12);
    if (v30 != -[CBDevice interval](self, "interval"))
    {
      -[CBDevice setInterval:](self, "setInterval:", *((unsigned __int16 *)v154 + 12));
      v9 |= 0x80000000000uLL;
    }
  }
  v31 = -[CBDevice deviceFlags](self, "deviceFlags");
  v32 = *((unsigned __int8 *)v140 + 24);
  v33 = v32 << 41;
  if (*((_BYTE *)v112 + 24))
    v33 = ((unint64_t)*((unsigned __int8 *)v140 + 24) << 41) | 0x2000;
  if (*((_BYTE *)v166 + 24))
    v34 = v33 | 0x200000;
  else
    v34 = v33;
  if (*((_BYTE *)v162 + 24))
    v34 |= 0x8000uLL;
  if (!*((_BYTE *)v112 + 24) || *((_BYTE *)v98 + 24) || ((unsigned __int16)v31 & 0x4000) != 0)
  {
    v35 = v34 | 0x40000000000;
    if (!*((_BYTE *)v162 + 24))
      goto LABEL_54;
LABEL_55:
    v36 = v35 | 0x1000;
    goto LABEL_56;
  }
  v35 = v34 & 0xFFFFFBFFFFFFFFFFLL;
  if (*((_BYTE *)v162 + 24))
    goto LABEL_55;
LABEL_54:
  if (*((unsigned __int8 *)v122 + 24) | v32)
    goto LABEL_55;
  v36 = v35 & 0xFFFFFFFFFFFFEFFFLL;
LABEL_56:
  if ((id)(v36 & 0xFFFFFFFFFFFCFFFFLL | ((unint64_t)*((unsigned __int8 *)v136 + 24) << 17) | ((unint64_t)(*((_BYTE *)v136 + 24) == 0) << 16)) != v31)
  {
    -[CBDevice setDeviceFlags:](self, "setDeviceFlags:");
    v9 |= 0x80000000000uLL;
  }
  if (*((_BYTE *)v150 + 24))
  {
    v37 = *((unsigned __int8 *)v150 + 24);
    if (v37 != -[CBDevice deviceType](self, "deviceType"))
    {
      -[CBDevice setDeviceType:](self, "setDeviceType:", *((unsigned __int8 *)v150 + 24));
      v9 |= 0x80000000000uLL;
    }
  }
  v38 = (void *)v144[5];
  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice idsDeviceID](self, "idsDeviceID"));

    if (v38 != v39)
    {
      -[CBDevice setIdsDeviceID:](self, "setIdsDeviceID:", v144[5]);
      v9 |= 0x80000000000uLL;
    }
  }
  if (objc_msgSend((id)v126[5], "length"))
  {
    v40 = (void *)v126[5];
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice firmwareVersion](self, "firmwareVersion"));
    v42 = v40;
    v43 = v41;
    if (v42 == v43)
    {

      goto LABEL_72;
    }
    v44 = v43;
    if ((v42 == 0) == (v43 != 0))
    {

    }
    else
    {
      v45 = objc_msgSend(v42, "isEqual:", v43);

      if ((v45 & 1) != 0)
        goto LABEL_72;
    }
    -[CBDevice setFirmwareVersion:](self, "setFirmwareVersion:", v126[5]);
    v9 |= 0x80000000000uLL;
  }
LABEL_72:
  if (objc_msgSend((id)v116[5], "length"))
  {
    v46 = (void *)v116[5];
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name"));
    v48 = v46;
    v49 = v47;
    if (v48 == v49)
    {

    }
    else
    {
      v50 = v49;
      if ((v48 == 0) == (v49 != 0))
      {

        goto LABEL_81;
      }
      v51 = objc_msgSend(v48, "isEqual:", v49);

      if ((v51 & 1) == 0)
      {
LABEL_81:
        -[CBDevice setName:](self, "setName:", v116[5]);
        v9 |= 0x80000000000uLL;
        if (!(_DWORD)v13)
          goto LABEL_84;
        goto LABEL_82;
      }
    }
  }
  if (!(_DWORD)v13)
    goto LABEL_84;
LABEL_82:
  if ((_DWORD)v13 != -[CBDevice productID](self, "productID"))
  {
    -[CBDevice setProductID:](self, "setProductID:", v13);
    v9 |= 0x80000000000uLL;
  }
LABEL_84:
  v52 = *((_DWORD *)v102 + 6);
  if (v52 && v52 != -[CBDevice bleRSSI](self, "bleRSSI"))
  {
    -[CBDevice setBleRSSI:](self, "setBleRSSI:", *((unsigned int *)v102 + 6));
    v9 |= 0x200000000uLL;
  }
  v53 = -[CBDevice supportedServices](self, "supportedServices");
  if (v28)
    v54 = 0x10000;
  else
    v54 = 0;
  if ((v53 & 0xFFFEFFFF | v54) != -[CBDevice supportedServices](self, "supportedServices"))
    -[CBDevice setSupportedServices:](self, "setSupportedServices:");
  if (v12 && -[CBDevice vendorID](self, "vendorID") != v12)
  {
    -[CBDevice setVendorID:](self, "setVendorID:", v12);
    v9 |= 0x80000000000uLL;
  }
  if (!(_DWORD)v11)
    goto LABEL_101;
  if ((_DWORD)v11 != -[CBDevice vendorIDSource](self, "vendorIDSource"))
  {
    -[CBDevice setVendorIDSource:](self, "setVendorIDSource:", v11);
    v9 |= 0x80000000000uLL;
  }
  if ((_DWORD)v11 == 1 && v12 == 76)
    v55 = 1;
  else
LABEL_101:
    v55 = (_DWORD)v11 == 2 && v12 == 1452;
  v57 = -[CBDevice productID](self, "productID");
  if (!(_DWORD)v57)
    v57 = -[CBDevice proximityPairingProductID](self, "proximityPairingProductID");
  if ((_DWORD)v57)
    v58 = v55;
  else
    v58 = 0;
  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v57));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "productName"));

    if (v60)
    {
      v61 = (id)objc_claimAutoreleasedReturnValue(-[CBDevice productName](self, "productName"));
      v62 = v60;
      v63 = v62;
      if (v61 == v62)
      {

      }
      else
      {
        if (v61)
        {
          v64 = objc_msgSend(v61, "isEqual:", v62);

          if ((v64 & 1) != 0)
            goto LABEL_122;
        }
        else
        {

        }
        -[CBDevice setProductName:](self, "setProductName:", v63);
        v9 |= 0x80000000000uLL;
      }
    }
LABEL_122:

  }
  v65 = CBDeviceTypeToNSLocalizedString(-[CBDevice deviceType](self, "deviceType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  if (v55)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name"));
    if (!v67
      || (v68 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name")),
          v69 = objc_msgSend(v68, "isEqualToString:", v66),
          v68,
          v67,
          (v69 & 1) != 0))
    {
      v70 = sub_10008EFB0((uint64_t)v57);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      if (v71)
      {
        -[CBDevice setName:](self, "setName:", v71);
        v9 |= 0x80000000000uLL;
      }

    }
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name"));

  if (!v72)
  {
    -[CBDevice setName:](self, "setName:", v66);
    v9 |= 0x80000000000uLL;
  }

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v125, 8);

  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v143, 8);

  _Block_object_dispose(&v149, 8);
  _Block_object_dispose(&v153, 8);
  _Block_object_dispose(&v157, 8);
  _Block_object_dispose(&v161, 8);
  _Block_object_dispose(&v165, 8);
  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);

  return v9;
}

- (unint64_t)updateWithClassicDevice:(void *)a3 deviceUUID:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  unint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  void *v47;
  unsigned __int16 *v48;
  BOOL v49;
  id v50;
  unsigned __int16 v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __int16 v56;
  unsigned int v57;
  unsigned int v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  unsigned __int16 v65;
  _OWORD *v66;
  void *v67;
  void **v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  int v100;
  int v101;
  int v102;
  _BOOL4 v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  _BOOL4 v113;
  uint64_t v114;
  unint64_t v115;
  int v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  int v121;
  _BOOL4 v122;
  int v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  const char *v131;
  void *v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  unsigned __int8 v137;
  unsigned __int8 v138;
  __int16 v139;
  unsigned __int8 v140;
  unsigned __int8 v141;
  unsigned int v142;
  int v143;
  uint64_t v144;
  _QWORD *v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  unsigned __int8 v151;
  uint64_t v152;
  id v153;
  unsigned __int8 v154;
  uint64_t v155;
  uint64_t v156;
  unsigned int v157;
  unsigned __int8 v158;
  _QWORD *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  unsigned __int8 v165;
  void **v166;
  void *v167;
  void *v168;
  id v169;
  id v170;
  void *v171;
  unsigned __int8 v172;
  void *v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  int v178;
  uint64_t v179;
  unsigned __int8 v180;
  char v181;
  char v182;
  int v183;
  int v184;
  uint64_t v185;
  unsigned int v186;
  uint64_t v187;
  void *v188;
  id v189;
  id v190;
  void *v191;
  unsigned __int8 v192;
  void *v193;
  id v194;
  id v195;
  void *v196;
  unsigned __int8 v197;
  void *v198;
  id v199;
  id v200;
  void *v201;
  unsigned __int8 v202;
  int v203;
  uint64_t v204;
  uint64_t v205;
  int v206;
  _BOOL4 v207;
  _BOOL4 v208;
  _BOOL4 v209;
  _BOOL4 v210;
  id v211;
  BOOL v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  void *v217;
  unsigned __int8 v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  unsigned __int8 v224;
  id v225;
  void *v226;
  void *v227;
  char v229;
  void *v230;
  uint64_t v231;
  void *v232;
  uint64_t v233;
  _BOOL4 v234;
  _BOOL4 v235;
  void *v236;
  unsigned int v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  int v242;
  int v243;
  void *v244[2];
  char v245;
  int v246;
  void *__p[2];
  uint64_t v248;
  __int128 v249;
  __int128 v250;
  void *v251[2];
  uint64_t v252;
  _BYTE v253[6];
  __int128 v254;
  __int128 v255;
  uint64_t v256;
  uint64_t v257;
  char *v258;
  uint64_t v259;
  uint64_t v260;

  v241 = a4;
  if (qword_1009778C8 != -1)
    dispatch_once(&qword_1009778C8, &stru_100917EB0);
  v6 = off_1009778C0;
  if (qword_100977A68 != -1)
    dispatch_once(&qword_100977A68, &stru_100917EF0);
  v7 = off_100977A60;
  if (qword_100977A78 != -1)
    dispatch_once(&qword_100977A78, &stru_100917F10);
  v8 = off_100977A70;
  v237 = sub_100498AC8((uint64_t)off_100977A70, (uint64_t)a3);
  v233 = (uint64_t)v7;
  v258 = 0;
  v259 = 0;
  v260 = 0;
  sub_100448DAC((uint64_t)a3, (uint64_t)&v258);
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 4)
  {
    v240 = 0;
    v10 = 0;
LABEL_19:
    v239 = 0;
    goto LABEL_20;
  }
  v9 = v258 + 72;
  if (v258[95] < 0)
    v9 = (_QWORD *)*v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 9)
  {
    v240 = 0;
    goto LABEL_19;
  }
  v11 = v258 + 192;
  if (v258[215] < 0)
    v11 = (_QWORD *)*v11;
  v240 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 0xA)
    goto LABEL_19;
  v12 = v258 + 216;
  if (v258[239] < 0)
    v12 = (_QWORD *)*v12;
  v239 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
LABEL_20:
  v231 = (uint64_t)v6;
  if (!objc_msgSend(v10, "length"))
  {
    v18 = 0;
    v17 = 0;
    v229 = 0;
    goto LABEL_35;
  }
  v13 = sub_100660768((uint64_t)v6, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v14)
  {
    v18 = 0;
    v17 = 0;
    v229 = 0;
LABEL_34:

    goto LABEL_35;
  }
  if (sub_100660DD0((uint64_t)v6, v14))
    v15 = 1;
  else
    v15 = 2;
  v16 = sub_100660B4C((uint64_t)v6, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v229 = v15;
  if (sub_100660D1C((uint64_t)v6, v14) != 2)
  {
    v18 = 0;
    goto LABEL_34;
  }
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

  if (!v18)
    goto LABEL_35;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice findMyCaseIdentifier](self, "findMyCaseIdentifier"));
  v18 = v18;
  v20 = v19;
  if (v18 == v20)
  {

    v14 = v18;
    goto LABEL_34;
  }
  v21 = v20;
  if (v20)
  {
    v22 = objc_msgSend(v18, "isEqual:", v20);

    if ((v22 & 1) == 0)
      goto LABEL_463;
LABEL_35:
    v23 = 0;
    goto LABEL_36;
  }

LABEL_463:
  -[CBDevice setFindMyCaseIdentifier:](self, "setFindMyCaseIdentifier:", v18);
  v23 = 0x80000000000;
LABEL_36:
  v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
  if (!v236)
    goto LABEL_44;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice findMyGroupIdentifier](self, "findMyGroupIdentifier"));
  v25 = v236;
  v26 = v24;
  if (v25 == v26)
  {

    goto LABEL_44;
  }
  v27 = v26;
  if (!v26)
  {

    goto LABEL_43;
  }
  v28 = objc_msgSend(v25, "isEqual:", v26);

  if ((v28 & 1) == 0)
  {
LABEL_43:
    -[CBDevice setFindMyGroupIdentifier:](self, "setFindMyGroupIdentifier:", v25);
    v23 = 0x80000000000;
  }
LABEL_44:
  v256 = 0;
  v257 = 0;
  v234 = sub_100444BF0((uint64_t)a3, (_DWORD *)&v257 + 1, &v257, (_DWORD *)&v256 + 1, &v256);
  v29 = sub_10044FB48((uint64_t)a3);
  if ((_DWORD)v29 != -[CBDevice adaptiveVolumeConfig](self, "adaptiveVolumeConfig"))
  {
    -[CBDevice setAdaptiveVolumeConfig:](self, "setAdaptiveVolumeConfig:", v29);
    v23 = 0x80000000000;
  }
  v30 = sub_10044FE34((uint64_t)a3, 144);
  v31 = sub_1000438A4();
  v32 = v30 & sub_1003312CC(v31, 0);
  if ((_DWORD)v32 == 1 && -[CBDevice adaptiveVolumeCapability](self, "adaptiveVolumeCapability") != 1)
  {
    -[CBDevice setAdaptiveVolumeCapability:](self, "setAdaptiveVolumeCapability:", v32);
    v23 = 0x80000000000;
  }
  if (qword_100977A88 != -1)
    dispatch_once(&qword_100977A88, &stru_100917F30);
  v33 = sub_10027FE1C((uint64_t)off_100977A80, (uint64_t)a3);
  if (v33 > 2)
    v34 = 0;
  else
    v34 = dword_100737DD0[v33];
  if ((_DWORD)v34 != -[CBDevice audioStreamState](self, "audioStreamState"))
  {
    -[CBDevice setAudioStreamState:](self, "setAudioStreamState:", v34);
    v23 |= 0x80000000000uLL;
  }
  v35 = sub_10044FE34((uint64_t)a3, 176);
  v36 = sub_1000438A4();
  v37 = v35 & sub_1003312CC(v36, 3u);
  if ((_DWORD)v37 == 1 && -[CBDevice autoAncCapability](self, "autoAncCapability") != 1)
  {
    -[CBDevice setAutoAncCapability:](self, "setAutoAncCapability:", v37);
    v23 |= 0x80000000000uLL;
  }
  v254 = 0u;
  v255 = 0u;
  v235 = sub_10043FC5C((uint64_t)a3);
  if (v235 || (v38 = *((unsigned __int8 *)a3 + 1288), *((_BYTE *)a3 + 1288)))
  {
    sub_1004474E8((uint64_t)a3, (uint64_t)&v254);
    v38 = v254;
    v39 = BYTE4(v254);
  }
  else
  {
    v39 = 0;
  }
  if (v38 >= 100)
    v40 = 100;
  else
    v40 = v38;
  if (-[CBDevice batteryInfoMain](self, "batteryInfoMain") != (unsigned __int16)(v40 & ~(unsigned __int16)(v40 >> 31) | (v39 << 8)))
  {
    -[CBDevice setBatteryInfoMain:](self, "setBatteryInfoMain:", (unsigned __int16)(v40 & ~(unsigned __int16)(v40 >> 31) | (v39 << 8)));
    v23 |= 0x80000000000uLL;
  }
  v41 = BYTE12(v254);
  if (SDWORD2(v254) >= 100)
    v42 = 100;
  else
    v42 = DWORD2(v254);
  if (-[CBDevice batteryInfoLeft](self, "batteryInfoLeft") != (unsigned __int16)(v42 & ~(unsigned __int16)(v42 >> 31) | (v41 << 8)))
  {
    -[CBDevice setBatteryInfoLeft:](self, "setBatteryInfoLeft:", (unsigned __int16)(v42 & ~(unsigned __int16)(v42 >> 31) | (v41 << 8)));
    v23 |= 0x80000000000uLL;
  }
  v43 = BYTE4(v255);
  if ((int)v255 >= 100)
    v44 = 100;
  else
    v44 = v255;
  if (-[CBDevice batteryInfoRight](self, "batteryInfoRight") != (unsigned __int16)(v44 & ~(unsigned __int16)(v44 >> 31) | (v43 << 8)))
  {
    -[CBDevice setBatteryInfoRight:](self, "setBatteryInfoRight:", (unsigned __int16)(v44 & ~(unsigned __int16)(v44 >> 31) | (v43 << 8)));
    v23 |= 0x80000000000uLL;
  }
  v45 = BYTE12(v255);
  if (SDWORD2(v255) >= 100)
    v46 = 100;
  else
    v46 = DWORD2(v255);
  if (-[CBDevice batteryInfoCase](self, "batteryInfoCase") != (unsigned __int16)(v46 & ~(unsigned __int16)(v46 >> 31) | (v45 << 8)))
  {
    -[CBDevice setBatteryInfoCase:](self, "setBatteryInfoCase:", (unsigned __int16)(v46 & ~(unsigned __int16)(v46 >> 31) | (v45 << 8)));
    v23 |= 0x80000000000uLL;
  }
  *(_DWORD *)v253 = *((_DWORD *)a3 + 32);
  *(_WORD *)&v253[4] = *((_WORD *)a3 + 66);
  if (((unint64_t)v253[0] << 40) | ((unint64_t)v253[1] << 32) | ((unint64_t)v253[2] << 24) | ((unint64_t)v253[3] << 16) | ((unint64_t)v253[4] << 8) | v253[5])
  {
    LOBYTE(v249) = v253[0];
    *(_DWORD *)((char *)&v249 + 1) = *(_DWORD *)&v253[1];
    BYTE5(v249) = v253[5];
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self, "btAddressData"));
    if (objc_msgSend(v47, "length") != (id)6
      || ((v48 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v47), "bytes"), (_DWORD)v249 == *(_DWORD *)v48)
        ? (v49 = WORD2(v249) == v48[2])
        : (v49 = 0),
          !v49))
    {
      v50 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v249, 6);
      -[CBDevice setBtAddressData:](self, "setBtAddressData:", v50);

      v23 |= 0x80000000000uLL;
    }

  }
  v252 = 0;
  v250 = 0u;
  *(_OWORD *)v251 = 0u;
  v249 = 0u;
  sub_100091AE8(v251, "");
  if (sub_1004495CC((uint64_t)a3, (uint64_t)&v249) && (_QWORD)v250)
  {
    v51 = v250 >> 4;
    if (v249 < 2u)
    {
      v52 = v250 & 0xF;
    }
    else
    {
      v52 = ((unint64_t)v250 >> 20) & 0xFFF0 | v250 & 0xF;
      v51 |= WORD2(v250) & 0xFFF0;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u.%u.%u"), (unsigned __int16)(v250 >> 8), v51, v52));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice caseVersion](self, "caseVersion"));

    if (v53 != v54)
    {
      -[CBDevice setCaseVersion:](self, "setCaseVersion:", v53);
      v23 |= 0x80000000000uLL;
    }

  }
  v55 = sub_10043FB64((uint64_t)a3);
  if ((_DWORD)v55 != -[CBDevice classicRSSI](self, "classicRSSI"))
  {
    -[CBDevice setClassicRSSI:](self, "setClassicRSSI:", v55);
    v23 |= 0x200000000uLL;
  }
  v56 = sub_10044F8A0((uint64_t)a3);
  if (-[CBDevice clickHoldModeLeft](self, "clickHoldModeLeft") != HIBYTE(v56))
  {
    -[CBDevice setClickHoldModeLeft:](self, "setClickHoldModeLeft:", HIBYTE(v56));
    v23 |= 0x80000000000uLL;
  }
  if (-[CBDevice clickHoldModeRight](self, "clickHoldModeRight") != v56)
  {
    -[CBDevice setClickHoldModeRight:](self, "setClickHoldModeRight:", v56);
    v23 |= 0x80000000000uLL;
  }
  v57 = sub_10044FB04((uint64_t)a3);
  v58 = v57;
  v59 = v57 & 0xF;
  v238 = v10;
  v232 = v17;
  v230 = v18;
  if ((_DWORD)v59 == 1)
  {
    v62 = v57 >> 4;
    v63 = (v57 >> 8) & 0xF;
    v60 = (unsigned __int16)v57 >> 12;
    v61 = HIWORD(v57) & 0xF;
  }
  else if ((v57 & 0xF) != 0)
  {
    v62 = 0;
    v63 = 0;
    v60 = 0;
    v61 = 0;
  }
  else
  {
    v60 = 0;
    v61 = 0;
    v62 = v57 >> 4;
    v63 = (v57 >> 8) & 0xF;
  }
  if (sub_10044FE34((uint64_t)a3, 80))
  {
    if (v58)
      v64 = v63;
    else
      v64 = 2;
    -[CBDevice setCallMgmtMsg:](self, "setCallMgmtMsg:", (v60 << 24) | (v61 << 32) | (v64 << 16) | (v62 << 8) | v59);
    if (-[CBDevice callMgmtMsg](self, "callMgmtMsg") == 1)
    {
      -[CBDevice setMuteControlCapability:](self, "setMuteControlCapability:", 1);
    }
    else if (!-[CBDevice callMgmtMsg](self, "callMgmtMsg"))
    {
      -[CBDevice setEndCallCapability:](self, "setEndCallCapability:", 1);
    }
    if ((_DWORD)v64 != -[CBDevice endCallConfig](self, "endCallConfig")
      || (_DWORD)v61 != -[CBDevice muteControlConfig](self, "muteControlConfig"))
    {
      -[CBDevice setEndCallConfig:](self, "setEndCallConfig:", v64);
      -[CBDevice setMuteControlConfig:](self, "setMuteControlConfig:", v61);
      v23 |= 0x80000000000uLL;
    }
  }
  v65 = sub_1004512E8((uint64_t)a3);
  if (!-[CBDevice colorInfo](self, "colorInfo")
    && -[CBDevice colorInfo](self, "colorInfo") != v65)
  {
    -[CBDevice setColorInfo:](self, "setColorInfo:", v65);
    v23 |= 0x80000000000uLL;
  }
  v66 = (char *)a3 + 392;
  if (*((char *)a3 + 415) < 0)
  {
    sub_10003430C(__p, *((void **)a3 + 49), *((_QWORD *)a3 + 50));
  }
  else
  {
    *(_OWORD *)__p = *v66;
    v248 = *((_QWORD *)a3 + 51);
  }
  if (SHIBYTE(v248) < 0)
  {
    v67 = __p[1];
    operator delete(__p[0]);
    if (!v67)
      goto LABEL_142;
  }
  else if (!HIBYTE(v248))
  {
    goto LABEL_142;
  }
  if (*((char *)a3 + 415) < 0)
  {
    sub_10003430C(__p, *((void **)a3 + 49), *((_QWORD *)a3 + 50));
  }
  else
  {
    *(_OWORD *)__p = *v66;
    v248 = *((_QWORD *)a3 + 51);
  }
  if (v248 >= 0)
    v68 = __p;
  else
    v68 = (void **)__p[0];
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v68));
  if (SHIBYTE(v248) < 0)
    operator delete(__p[0]);
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice model](self, "model"));

  if (v69 != v70)
  {
    -[CBDevice setModel:](self, "setModel:", v69);
    v23 |= 0x80000000000uLL;
  }

LABEL_142:
  v71 = sub_100496DBC((uint64_t)v8, (uint64_t)a3);
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100917E90);
  if (*((_BYTE *)off_100977A50 + 60))
  {
    LOBYTE(__p[0]) = 0;
    sub_100043758(__p);
    v72 = sub_10019AEA4((uint64_t)v253);
    if (v72 && !*(_BYTE *)(v72 + 54))
      LODWORD(v71) = v71 | 0x800000;
    v73 = sub_10019AEFC((uint64_t)v253);
    sub_10004339C(__p);
    if (v73)
      v71 = v71 | 0x1000000;
    else
      v71 = v71;
    sub_100043728(__p);
  }
  if ((_DWORD)v71 != -[CBDevice connectedServices](self, "connectedServices"))
  {
    -[CBDevice setConnectedServices:](self, "setConnectedServices:", v71);
    v23 |= 0x80000200000uLL;
  }
  v74 = sub_10044FBD0((uint64_t)a3);
  if (v74 != -[CBDevice conversationDetectConfig](self, "conversationDetectConfig"))
  {
    -[CBDevice setConversationDetectConfig:](self, "setConversationDetectConfig:", v74);
    v23 |= 0x80000000000uLL;
  }
  v75 = sub_10044FE34((uint64_t)a3, 160);
  v76 = sub_1000438A4();
  v77 = v75 & sub_1003312CC(v76, 2u);
  if ((_DWORD)v77 == 1
    && -[CBDevice conversationDetectCapability](self, "conversationDetectCapability") != 1)
  {
    -[CBDevice setConversationDetectCapability:](self, "setConversationDetectCapability:", v77);
    v23 |= 0x80000000000uLL;
  }
  v78 = sub_10044F9B0((uint64_t)a3);
  if ((_DWORD)v78 != -[CBDevice crownRotationDirection](self, "crownRotationDirection"))
  {
    -[CBDevice setCrownRotationDirection:](self, "setCrownRotationDirection:", v78);
    v23 |= 0x80000000000uLL;
  }
  v79 = -[CBDevice deviceFlags](self, "deviceFlags");
  v80 = sub_100442118((uint64_t)a3, 12);
  v81 = sub_100442118((uint64_t)a3, 16);
  v82 = *((unsigned __int8 *)a3 + 952);
  v83 = *((unsigned __int8 *)a3 + 968);
  v84 = sub_10045E940(v233, (uint64_t)a3);
  v85 = sub_100442118((uint64_t)a3, 27);
  v86 = sub_100442118((uint64_t)a3, 26);
  v87 = v83 != 0;
  v88 = (v237 >> 19) & 1;
  if (v80)
    v88 |= 0x1000000uLL;
  if (v81)
    v88 |= 0x4000000uLL;
  if (v82)
    v89 = v88 | 0x2000000;
  else
    v89 = v88;
  if (v84)
    v90 = 2;
  else
    v90 = 0;
  if (v85)
    v91 = 4;
  else
    v91 = 0;
  if (v86)
    v92 = 8;
  else
    v92 = 0;
  v93 = v89 & 0xFFFFFFFFCF7FFFF1 | (v87 << 29) | v90 | v91 | v92;
  if (!sub_10044FE34((uint64_t)a3, 64)
    || (v94 = sub_10003BE44(), !(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v94 + 792))(v94, 1)))
  {
    v246 = 0;
LABEL_186:
    v98 = v93 & 0xFFFFFFFFBFFFFFFFLL;
    goto LABEL_187;
  }
  v246 = 0;
  if (qword_1009778E8 != -1)
    dispatch_once(&qword_1009778E8, &stru_100917F50);
  sub_10047134C((uint64_t)off_1009778E0, (uint64_t)a3, &v246);
  v95 = v246 == 1;
  if (qword_100977A98 != -1)
    dispatch_once(&qword_100977A98, &stru_100917F70);
  v96 = sub_100527654((uint64_t)off_100977A90, (uint64_t)a3);
  v97 = v93 | (v95 << 28);
  if (!v96)
  {
    v93 = v97 | 0x800000;
    goto LABEL_186;
  }
  v98 = v97 | 0x40800000;
LABEL_187:
  if (sub_100442118((uint64_t)a3, 32) && sub_10044F658((uint64_t)a3) == 1)
    v99 = v98 | 0x10;
  else
    v99 = v98 & 0xFFFFFFFFFFFFFFEFLL;
  v100 = sub_100442118((uint64_t)a3, 17);
  v101 = sub_100442118((uint64_t)a3, 33);
  v102 = sub_10044FD68((uint64_t)a3);
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100917F90);
  v103 = sub_100030864(qword_1009778B0, v241);
  v104 = sub_10043E93C((unsigned __int8 *)a3);
  sub_1006594CC(v231, v241, (uint64_t)__p);
  v105 = 0x8000000;
  if (!v100)
    v105 = 0;
  v106 = 32;
  if (!v101)
    v106 = 0;
  v107 = v105 | v106;
  v108 = 64;
  if (!v102)
    v108 = 0;
  v109 = v107 | v108;
  v110 = 0x2000;
  if (!v103)
    v110 = 0;
  v111 = v109 | v110 | v99 & 0xFFFFFFFFF7EB1F9FLL;
  if (v104)
    v112 = 0x4000;
  else
    v112 = 0;
  if (SHIBYTE(v248) < 0)
  {
    v113 = __p[1] == 0;
    operator delete(__p[0]);
  }
  else
  {
    v113 = SHIBYTE(v248) == 0;
  }
  v114 = 0x8000;
  if (v113)
    v114 = 0;
  v115 = v111 | v112 | v114 | ((unint64_t)*((unsigned __int8 *)a3 + 1427) << 18) | ((unint64_t)*((unsigned __int8 *)a3 + 1288) << 20);
  if (v235)
  {
    v116 = sub_1004557A4((uint64_t)a3);
    v117 = 0x200000;
    if (!v116)
      v117 = 0;
    v118 = v117 | v115 & 0xFFFFFFFFFFDFFFFFLL;
    if (*((_BYTE *)a3 + 1428))
    {
      v119 = v118 | 0x400000;
      goto LABEL_216;
    }
  }
  else
  {
    v118 = v115 & 0xFFFFFFFFFFDFFFFFLL;
  }
  v119 = v118 & 0xFFFFFFFFFFBFFFFFLL;
LABEL_216:
  v120 = sub_10044F9F4((uint64_t)a3) == 1;
  v121 = sub_100454394((uint64_t)a3);
  v122 = sub_10044936C((uint64_t)a3);
  v123 = sub_10044D708((uint64_t)a3);
  v124 = v119 & 0xFFFFFBFF7FFFFFFFLL | (v120 << 31) | 0x40000001000;
  if (v113 | v104)
    v124 = v119 & 0xFFFFFAFF7FF4EFFFLL | (v120 << 31) & 0xFFFFFAFFFFF4EFFFLL | 0x40000000000;
  v125 = 0x20000;
  if (!v121)
    v125 = 0;
  v126 = 0x10000;
  if (v121)
    v126 = 0;
  v127 = 0x80000;
  if (!v122)
    v127 = 0;
  v128 = 0x10000000000;
  if (!v123)
    v128 = 0;
  v129 = v125 | v126 | v127 | v128 | v124 & 0xFFFFFEFFFFF4FFFFLL;
  if (v229)
    v130 = v129 & 0xFFFFFF7FFFFFFFFFLL | ((unint64_t)(v229 == 1) << 39);
  else
    v130 = v129;
  if ((id)v130 != v79)
  {
    -[CBDevice setDeviceFlags:](self, "setDeviceFlags:");
    v23 |= 0x80000000000uLL;
  }
  if (qword_100977A58 != -1)
    dispatch_once(&qword_100977A58, &stru_100917E90);
  if (*((_BYTE *)off_100977A50 + 60))
  {
    LOBYTE(v242) = 0;
    LOWORD(__p[0]) = 0;
    LOWORD(v243) = 0;
    sub_1004466F4((uint64_t)a3, __p, &v242, &v243);
    if ((_BYTE)v242)
    {
      if (v242 > 0xDu)
        v131 = "?";
      else
        v131 = off_100917FB0[(char)(v242 - 1)];
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v131));
      v133 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btVersion](self, "btVersion"));
      v134 = v132;
      v135 = v133;
      if (v134 == v135)
      {

      }
      else
      {
        v136 = v135;
        if ((v134 == 0) != (v135 != 0))
        {
          v137 = objc_msgSend(v134, "isEqual:", v135);

          if ((v137 & 1) != 0)
            goto LABEL_246;
        }
        else
        {

        }
        -[CBDevice setBtVersion:](self, "setBtVersion:", v134);
        v23 |= 0x80000000000uLL;
      }
LABEL_246:

    }
  }
  v138 = sub_10043F854((uint64_t)a3);
  if (-[CBDevice deviceType](self, "deviceType") != v138)
  {
    -[CBDevice setDeviceType:](self, "setDeviceType:", v138);
    v23 |= 0x80000000000uLL;
  }
  v139 = sub_1004459D0((uint64_t)a3);
  if (HIBYTE(v139) < 5u)
    v140 = HIBYTE(v139) + 1;
  else
    v140 = 0;
  if (v140 != -[CBDevice doubleTapActionLeft](self, "doubleTapActionLeft"))
  {
    -[CBDevice setDoubleTapActionLeft:](self, "setDoubleTapActionLeft:", (char)v140);
    v23 |= 0x80000000000uLL;
  }
  if (v139 < 5u)
    v141 = v139 + 1;
  else
    v141 = 0;
  if (v141 != -[CBDevice doubleTapActionRight](self, "doubleTapActionRight"))
  {
    -[CBDevice setDoubleTapActionRight:](self, "setDoubleTapActionRight:", (char)v141);
    v23 |= 0x80000000000uLL;
  }
  v142 = -[CBDevice doubleTapCapability](self, "doubleTapCapability");
  if (sub_10043F65C((uint64_t)a3, 0x80000u) == 4)
  {
    v143 = sub_100442118((uint64_t)a3, 14) ? 2 : 1;
    if (v143 != v142)
    {
      -[CBDevice setDoubleTapCapability:](self, "setDoubleTapCapability:", (char)v143);
      v23 |= 0x80000000000uLL;
    }
  }
  v144 = sub_100447C64((uint64_t)a3);
  if ((_DWORD)v144 != -[CBDevice gapaFlags](self, "gapaFlags"))
  {
    -[CBDevice setGapaFlags:](self, "setGapaFlags:", v144);
    v23 |= 0x80000000000uLL;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 0xB)
  {
    if (!v234)
      goto LABEL_283;
    v152 = NSPrintF_safe("%u.%u.%u", BYTE1(v256), v256 >> 4, v256 & 0xF);
    v148 = (id)objc_claimAutoreleasedReturnValue(v152);
    v153 = (id)objc_claimAutoreleasedReturnValue(-[CBDevice firmwareVersion](self, "firmwareVersion"));

    if (v148 != v153)
    {
LABEL_281:
      -[CBDevice setFirmwareVersion:](self, "setFirmwareVersion:", v148);
      v23 |= 0x80000000000uLL;
    }
  }
  else
  {
    v145 = v258 + 240;
    if (v258[263] < 0)
      v145 = (_QWORD *)*v145;
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v145));
    if (objc_msgSend(v146, "length"))
    {
      v147 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice firmwareVersion](self, "firmwareVersion"));
      v148 = v146;
      v149 = v147;
      if (v148 != v149)
      {
        v150 = v149;
        if ((v148 == 0) == (v149 != 0))
        {

        }
        else
        {
          v151 = objc_msgSend(v148, "isEqual:", v149);

          if ((v151 & 1) != 0)
            goto LABEL_282;
        }
        goto LABEL_281;
      }

    }
    else
    {
      v148 = v146;
    }
  }
LABEL_282:

LABEL_283:
  if (*((_BYTE *)a3 + 1365))
    v154 = 2;
  else
    v154 = 1;
  if (-[CBDevice frequencyBand](self, "frequencyBand") != v154)
  {
    -[CBDevice setFrequencyBand:](self, "setFrequencyBand:", v154);
    v23 |= 0x80000000000uLL;
  }
  v155 = sub_10044F708((uint64_t)a3);
  if ((_DWORD)v155 != -[CBDevice listeningMode](self, "listeningMode"))
  {
    -[CBDevice setListeningMode:](self, "setListeningMode:", v155);
    v23 |= 0x80000000000uLL;
  }
  v156 = sub_10044F74C((uint64_t)a3);
  if ((_DWORD)v156 != -[CBDevice listeningModeConfigs](self, "listeningModeConfigs"))
  {
    -[CBDevice setListeningModeConfigs:](self, "setListeningModeConfigs:", v156);
    v23 |= 0x80000000000uLL;
  }
  v157 = sub_10044F5D0((uint64_t)a3);
  if (v157 >= 3)
    v158 = 0;
  else
    v158 = 0x20301u >> (8 * v157);
  if (v158 != -[CBDevice microphoneMode](self, "microphoneMode"))
  {
    -[CBDevice setMicrophoneMode:](self, "setMicrophoneMode:", (char)v158);
    v23 |= 0x80000000000uLL;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) >= 2)
  {
    v159 = v258 + 24;
    if (v258[47] < 0)
      v159 = (_QWORD *)*v159;
    v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v159));
    if (!objc_msgSend(v160, "length"))
      goto LABEL_308;
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice modelUser](self, "modelUser"));
    v162 = v160;
    v163 = v161;
    if (v162 == v163)
    {

    }
    else
    {
      v164 = v163;
      if ((v162 == 0) == (v163 != 0))
      {

      }
      else
      {
        v165 = objc_msgSend(v162, "isEqual:", v163);

        if ((v165 & 1) != 0)
          goto LABEL_308;
      }
      -[CBDevice setModelUser:](self, "setModelUser:", v162);
      v23 |= 0x80000000000uLL;
    }
LABEL_308:

  }
  sub_10043F6EC((uint64_t)a3, (uint64_t)__p);
  if (v248 >= 0)
    v166 = __p;
  else
    v166 = (void **)__p[0];
  v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v166));
  if (SHIBYTE(v248) < 0)
    operator delete(__p[0]);
  if (objc_msgSend(v167, "length"))
  {
    v168 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name"));
    v169 = v167;
    v170 = v168;
    if (v169 == v170)
    {

      goto LABEL_322;
    }
    v171 = v170;
    if ((v169 == 0) == (v170 != 0))
    {

    }
    else
    {
      v172 = objc_msgSend(v169, "isEqual:", v170);

      if ((v172 & 1) != 0)
        goto LABEL_322;
    }
    -[CBDevice setName:](self, "setName:", v169);
    v23 |= 0x80000000000uLL;
  }
LABEL_322:
  if (objc_msgSend(v167, "length"))
  {
    if (qword_1009778C8 != -1)
      dispatch_once(&qword_1009778C8, &stru_100917EB0);
    v173 = off_1009778C0;
    sub_10043F6EC((uint64_t)a3, (uint64_t)v244);
    sub_10065B14C((uint64_t)v173, v241, (unsigned __int8 *)v244);
    if (v245 < 0)
      operator delete(v244[0]);
  }
  v174 = -[CBDevice primaryPlacement](self, "primaryPlacement");
  v175 = -[CBDevice secondaryPlacement](self, "secondaryPlacement");
  v176 = -[CBDevice primaryBudSide](self, "primaryBudSide");
  if (sub_10043F65C((uint64_t)a3, 0x80000u) == 4)
  {
    v177 = sub_10044F614((uint64_t)a3);
    LODWORD(__p[0]) = 3;
    v242 = 3;
    v243 = 3;
    if (v235)
    {
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100917F30);
      sub_1002835F4((uint64_t)off_100977A80, (uint64_t)a3, (int *)__p, &v243);
      if (qword_100977A88 != -1)
        dispatch_once(&qword_100977A88, &stru_100917F30);
      sub_100283884((uint64_t)off_100977A80, (uint64_t)a3, &v242);
    }
    if (v177)
    {
      if (LODWORD(__p[0]) > 0xC)
        v178 = 0;
      else
        v178 = dword_100737DDC[SLODWORD(__p[0])];
      v179 = 1;
      switch(v243)
      {
        case 0:
          break;
        case 1:
          v179 = 2;
          break;
        case 2:
          v179 = 3;
          break;
        case 10:
          v179 = 4;
          break;
        case 11:
          v179 = 5;
          break;
        case 12:
          v179 = 6;
          break;
        default:
          v179 = 0;
          break;
      }
    }
    else
    {
      v178 = 7;
      v179 = 7;
    }
    if (v242 == 2)
      v181 = 2;
    else
      v181 = 3;
    if (v242 == 1)
      v180 = 1;
    else
      v180 = v181;
  }
  else
  {
    v178 = 0;
    v179 = 0;
    v180 = 3;
  }
  if (v178 != v174)
  {
    -[CBDevice setPrimaryPlacement:](self, "setPrimaryPlacement:");
    v23 |= 0x80000000000uLL;
  }
  if ((_DWORD)v179 != v175)
  {
    -[CBDevice setSecondaryPlacement:](self, "setSecondaryPlacement:", v179);
    v23 |= 0x80000000000uLL;
  }
  if (v176 != v180)
  {
    -[CBDevice setPrimaryBudSide:](self, "setPrimaryBudSide:", v180);
    v23 |= 0x80000000000uLL;
  }
  if (sub_10044F614((uint64_t)a3))
    v182 = 1;
  else
    v182 = 2;
  if (v182 != -[CBDevice placementMode](self, "placementMode"))
  {
    -[CBDevice setPlacementMode:](self, "setPlacementMode:", v182);
    v23 |= 0x80000000000uLL;
  }
  v183 = sub_10044FC14((uint64_t)a3);
  if (v183 != -[CBDevice selectiveSpeechListeningConfig](self, "selectiveSpeechListeningConfig"))
  {
    -[CBDevice setSelectiveSpeechListeningConfig:](self, "setSelectiveSpeechListeningConfig:", v183);
    v23 |= 0x80000000000uLL;
  }
  v184 = sub_10044FF54((uint64_t)a3, 6u);
  v185 = sub_1000438A4();
  v186 = sub_1003312CC(v185, 4u);
  if (v184 == 3)
    v187 = v186;
  else
    v187 = 0;
  if ((_DWORD)v187
    && -[CBDevice selectiveSpeechListeningCapability](self, "selectiveSpeechListeningCapability") != 1)
  {
    -[CBDevice setSelectiveSpeechListeningCapability:](self, "setSelectiveSpeechListeningCapability:", v187);
    v23 |= 0x80000000000uLL;
  }
  if (objc_msgSend(v238, "length"))
  {
    v188 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice serialNumber](self, "serialNumber"));
    v189 = v238;
    v190 = v188;
    if (v189 == v190)
    {

      goto LABEL_372;
    }
    v191 = v190;
    if ((v189 == 0) == (v190 != 0))
    {

    }
    else
    {
      v192 = objc_msgSend(v189, "isEqual:", v190);

      if ((v192 & 1) != 0)
        goto LABEL_372;
    }
    -[CBDevice setSerialNumber:](self, "setSerialNumber:", v189);
    v23 |= 0x80000000000uLL;
  }
LABEL_372:
  if (!objc_msgSend(v240, "length"))
    goto LABEL_380;
  v193 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice serialNumberLeft](self, "serialNumberLeft"));
  v194 = v240;
  v195 = v193;
  if (v194 == v195)
  {

    goto LABEL_380;
  }
  v196 = v195;
  if ((v194 == 0) == (v195 != 0))
  {

    goto LABEL_379;
  }
  v197 = objc_msgSend(v194, "isEqual:", v195);

  if ((v197 & 1) == 0)
  {
LABEL_379:
    -[CBDevice setSerialNumberLeft:](self, "setSerialNumberLeft:", v194);
    v23 |= 0x80000000000uLL;
  }
LABEL_380:
  if (!objc_msgSend(v239, "length"))
    goto LABEL_388;
  v198 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice serialNumberRight](self, "serialNumberRight"));
  v199 = v239;
  v200 = v198;
  if (v199 == v200)
  {

    goto LABEL_388;
  }
  v201 = v200;
  if ((v199 == 0) == (v200 != 0))
  {

    goto LABEL_387;
  }
  v202 = objc_msgSend(v199, "isEqual:", v200);

  if ((v202 & 1) == 0)
  {
LABEL_387:
    -[CBDevice setSerialNumberRight:](self, "setSerialNumberRight:", v199);
    v23 |= 0x80000000000uLL;
  }
LABEL_388:
  v203 = sub_10044F658((uint64_t)a3);
  if (v203 == 1)
    v204 = 1;
  else
    v204 = 2 * (v203 == 2);
  if ((_DWORD)v204 != -[CBDevice smartRoutingMode](self, "smartRoutingMode"))
  {
    -[CBDevice setSmartRoutingMode:](self, "setSmartRoutingMode:", v204);
    v23 |= 0x80000000000uLL;
  }
  v205 = sub_10044FDAC((uint64_t)a3);
  if ((_DWORD)v205 && (_DWORD)v205 != -[CBDevice interval](self, "interval"))
  {
    -[CBDevice setInterval:](self, "setInterval:", v205);
    v23 |= 0x80000000000uLL;
  }
  LODWORD(__p[0]) = 0;
  LOBYTE(v243) = 0;
  if (qword_1009778E8 != -1)
    dispatch_once(&qword_1009778E8, &stru_100917F50);
  sub_100471864((uint64_t)off_1009778E0, (uint64_t)a3, CFSTR("global"), (int *)__p, &v243);
  v206 = (int)__p[0];
  if (v206 != -[CBDevice spatialAudioMode](self, "spatialAudioMode"))
  {
    -[CBDevice setSpatialAudioMode:](self, "setSpatialAudioMode:", LODWORD(__p[0]));
    v23 |= 0x80000000000uLL;
  }
  if (v237 != -[CBDevice supportedServices](self, "supportedServices"))
  {
    -[CBDevice setSupportedServices:](self, "setSupportedServices:");
    v23 |= 0x80000200000uLL;
  }
  if (-[CBDevice productID](self, "productID"))
    v207 = 0;
  else
    v207 = v234;
  if (v207 && HIDWORD(v256))
  {
    -[CBDevice setProductID:](self, "setProductID:");
    v23 |= 0x80000000000uLL;
  }
  if (-[CBDevice vendorID](self, "vendorID"))
    v208 = 0;
  else
    v208 = v234;
  if (v208 && (_DWORD)v257)
  {
    -[CBDevice setVendorID:](self, "setVendorID:", (unsigned __int16)v257);
    v23 |= 0x80000000000uLL;
  }
  if (-[CBDevice vendorIDSource](self, "vendorIDSource"))
    v209 = 0;
  else
    v209 = v234;
  if (v209 && HIDWORD(v257))
  {
    -[CBDevice setVendorIDSource:](self, "setVendorIDSource:", BYTE4(v257));
    v23 |= 0x80000000000uLL;
  }
  if (-[CBDevice vendorIDSource](self, "vendorIDSource") == 1
    && -[CBDevice vendorID](self, "vendorID") == 76)
  {
    v210 = 1;
  }
  else
  {
    v210 = -[CBDevice vendorIDSource](self, "vendorIDSource") == 2
        && -[CBDevice vendorID](self, "vendorID") == 1452;
  }
  v211 = -[CBDevice productID](self, "productID");
  if (!(_DWORD)v211)
    v211 = -[CBDevice proximityPairingProductID](self, "proximityPairingProductID");
  if ((_DWORD)v211)
    v212 = v210;
  else
    v212 = 0;
  if (v212)
  {
    v213 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v211));
    v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "productName"));

    if (v214)
    {
      v215 = (id)objc_claimAutoreleasedReturnValue(-[CBDevice productName](self, "productName"));
      v216 = v214;
      v217 = v216;
      if (v215 == v216)
      {

      }
      else
      {
        if (v215)
        {
          v218 = objc_msgSend(v215, "isEqual:", v216);

          if ((v218 & 1) != 0)
            goto LABEL_443;
        }
        else
        {

        }
        -[CBDevice setProductName:](self, "setProductName:", v217);
        v23 |= 0x80000000000uLL;
      }
    }
LABEL_443:

  }
  v219 = CBDeviceTypeToNSLocalizedString(-[CBDevice deviceType](self, "deviceType"));
  v220 = (void *)objc_claimAutoreleasedReturnValue(v219);
  if (v210)
  {
    v221 = v232;
    v222 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name"));
    if (!v222
      || (v223 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name")),
          v224 = objc_msgSend(v223, "isEqualToString:", v220),
          v223,
          v222,
          (v224 & 1) != 0))
    {
      v225 = sub_10008EFB0((uint64_t)v211);
      v226 = (void *)objc_claimAutoreleasedReturnValue(v225);
      if (v226)
      {
        -[CBDevice setName:](self, "setName:", v226);
        v23 |= 0x80000000000uLL;
      }

    }
  }
  else
  {
    v221 = v232;
  }
  v227 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self, "name"));

  if (!v227)
  {
    -[CBDevice setName:](self, "setName:", v220);
    v23 |= 0x80000000000uLL;
  }

  if (SHIBYTE(v252) < 0)
    operator delete(v251[0]);

  *(_QWORD *)&v249 = &v258;
  sub_100091BF8((void ***)&v249);

  return v23;
}

@end
