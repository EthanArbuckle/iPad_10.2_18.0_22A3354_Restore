@implementation UMLUser

- (UMLUser)init
{
  UMLUser *v2;
  UMLUser *v3;
  UMLUser *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UMLUser;
  v2 = -[UMLUser init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UMLUser *v4;
  UMLUser *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  char v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  UMLUser *v22;
  int v23;
  int v24;
  void *v26;
  int v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _BOOL4 v53;
  UMLUser *v54;
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
  _QWORD v118[5];
  _BYTE v119[12];
  int v120;
  _BOOL4 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;

  v4 = (UMLUser *)a3;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_104;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_104;
  }
  v5 = v4;
  v6 = -[UMLUser uid](self, "uid");
  if ((_DWORD)v6 != -[UMLUser uid](v5, "uid")
    || (v6 = -[UMLUser gid](self, "gid"), (_DWORD)v6 != -[UMLUser gid](v5, "gid"))
    || (v6 = -[UMLUser apnsID](self, "apnsID"), v6 != -[UMLUser apnsID](v5, "apnsID")))
  {
    v133 = 0;
    v134 = 0;
    v120 = 0;
    v131 = 0;
    v132 = 0;
    memset(v119, 0, sizeof(v119));
    v129 = 0;
    v130 = 0;
    v127 = 0;
    v128 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v124 = 0;
    v11 = 0;
    v122 = 0;
    v12 = 0;
    v13 = 0;
    v121 = 0;
    memset(v118, 0, sizeof(v118));
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v10 = 0;
    goto LABEL_13;
  }
  -[UMLUser userUUID](self, "userUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  v6 = v7 == 0;
  v117 = (void *)v7;
  LODWORD(v134) = v7 == 0;
  if (v7 || (-[UMLUser userUUID](v5, "userUUID"), (v113 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser userUUID](self, "userUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser userUUID](v5, "userUUID");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v8;
    if (!objc_msgSend(v8, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v120 = 0;
      v131 = 0;
      v132 = 0;
      memset(v119, 0, sizeof(v119));
      v129 = 0;
      v130 = 0;
      v127 = 0;
      v128 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v124 = 0;
      v11 = 0;
      v122 = 0;
      v12 = 0;
      v13 = 0;
      v121 = 0;
      memset(v118, 0, sizeof(v118));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v133 = 1;
      goto LABEL_13;
    }
    v9 = 1;
  }
  else
  {
    v113 = 0;
    v9 = 0;
  }
  -[UMLUser alternateDSID](self, "alternateDSID");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v133) = v9;
  HIDWORD(v133) = v114 == 0;
  if (v114
    || (-[UMLUser alternateDSID](v5, "alternateDSID"), (v109 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser alternateDSID](self, "alternateDSID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser alternateDSID](v5, "alternateDSID");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      memset(v119, 0, sizeof(v119));
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v126 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      v122 = 0;
      v123 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      memset(v118, 0, sizeof(v118));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      v132 = 1;
      goto LABEL_13;
    }
    v27 = 1;
  }
  else
  {
    v109 = 0;
    v27 = 0;
  }
  -[UMLUser userType](self, "userType");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v132) = v27;
  HIDWORD(v132) = v110 == 0;
  if (v110 || (-[UMLUser userType](v5, "userType"), (v105 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser userType](self, "userType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser userType](v5, "userType");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v28;
    if (!objc_msgSend(v28, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v129 = 0;
      v130 = 0;
      v127 = 0;
      v128 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v124 = 0;
      v11 = 0;
      v122 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      memset(v118, 0, sizeof(v118));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      *(_DWORD *)v119 = 1;
      v131 = 1;
      goto LABEL_13;
    }
    v29 = 1;
  }
  else
  {
    v105 = 0;
    v29 = 0;
  }
  -[UMLUser username](self, "username");
  v30 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v131) = v30 == 0;
  v106 = (void *)v30;
  LODWORD(v131) = v29;
  if (v30 || (-[UMLUser username](v5, "username"), (v101 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser username](self, "username");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser username](v5, "username");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v128 = 0;
      v129 = 0;
      v126 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      memset(v118, 0, 32);
      v122 = 0;
      v123 = 0;
      v11 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      *(_DWORD *)v119 = 1;
      v118[4] = 1;
      v130 = 1;
      goto LABEL_13;
    }
    LODWORD(v130) = 1;
  }
  else
  {
    v101 = 0;
    LODWORD(v130) = 0;
  }
  -[UMLUser firstName](self, "firstName");
  v32 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v130) = v32 == 0;
  v102 = (void *)v32;
  if (v32 || (-[UMLUser firstName](v5, "firstName"), (v97 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser firstName](self, "firstName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser firstName](v5, "firstName");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v127 = 0;
      v128 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v124 = 0;
      v11 = 0;
      v122 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      memset(v118, 0, 28);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      v129 = 1;
      goto LABEL_13;
    }
    LODWORD(v129) = 1;
  }
  else
  {
    v97 = 0;
    LODWORD(v129) = 0;
  }
  -[UMLUser lastName](self, "lastName");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v129) = v98 == 0;
  if (v98 || (-[UMLUser lastName](v5, "lastName"), (v93 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser lastName](self, "lastName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser lastName](v5, "lastName");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v34;
    if (!objc_msgSend(v34, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v126 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      memset(v118, 0, 24);
      v122 = 0;
      v123 = 0;
      v11 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      LODWORD(v118[3]) = 1;
      v128 = 1;
      goto LABEL_13;
    }
    LODWORD(v128) = 1;
  }
  else
  {
    v93 = 0;
    LODWORD(v128) = 0;
  }
  -[UMLUser displayName](self, "displayName");
  v35 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v128) = v35 == 0;
  v94 = (void *)v35;
  if (v35 || (-[UMLUser displayName](v5, "displayName"), (v89 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser displayName](self, "displayName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser displayName](v5, "displayName");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v36;
    if (!objc_msgSend(v36, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v124 = 0;
      v11 = 0;
      v122 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      memset(v118, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v118[2] + 4) = 0x100000001;
      v127 = 1;
      goto LABEL_13;
    }
    LODWORD(v127) = 1;
  }
  else
  {
    v89 = 0;
    LODWORD(v127) = 0;
  }
  -[UMLUser userLanguauge](self, "userLanguauge");
  v37 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v127) = v37 == 0;
  v90 = (void *)v37;
  if (v37
    || (-[UMLUser userLanguauge](v5, "userLanguauge"), (v85 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser userLanguauge](self, "userLanguauge");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser userLanguauge](v5, "userLanguauge");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v118[1] = 0;
      v124 = 0;
      v125 = 0;
      v118[0] = 0;
      v122 = 0;
      v123 = 0;
      v11 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v126 = 1;
      goto LABEL_13;
    }
    LODWORD(v126) = 1;
  }
  else
  {
    v85 = 0;
    LODWORD(v126) = 0;
  }
  -[UMLUser fileInfoPath](self, "fileInfoPath");
  v39 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v126) = v39 == 0;
  v86 = (void *)v39;
  if (v39 || (-[UMLUser fileInfoPath](v5, "fileInfoPath"), (v81 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser fileInfoPath](self, "fileInfoPath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser fileInfoPath](v5, "fileInfoPath");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v40;
    if (!objc_msgSend(v40, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      *(_QWORD *)((char *)v118 + 4) = 0;
      v123 = 0;
      v124 = 0;
      v11 = 0;
      v122 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      LODWORD(v118[0]) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v118[2] + 4) = 0x100000001;
      HIDWORD(v118[1]) = 1;
      LODWORD(v118[2]) = 1;
      v125 = 1;
      goto LABEL_13;
    }
    LODWORD(v125) = 1;
  }
  else
  {
    v81 = 0;
    LODWORD(v125) = 0;
  }
  -[UMLUser libInfoPath](self, "libInfoPath");
  v41 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v125) = v41 == 0;
  v82 = (void *)v41;
  if (v41 || (-[UMLUser libInfoPath](v5, "libInfoPath"), (v77 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser libInfoPath](self, "libInfoPath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UMLUser libInfoPath](v5, "libInfoPath");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v42;
    HIDWORD(v134) = 1;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      v118[0] = 0;
      v122 = 0;
      v123 = 0;
      v11 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001;
      v124 = 1;
      goto LABEL_13;
    }
    LODWORD(v124) = 1;
  }
  else
  {
    v77 = 0;
    LODWORD(v124) = 0;
  }
  -[UMLUser diskNode](self, "diskNode");
  v43 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v124) = v43 == 0;
  v78 = (void *)v43;
  if (v43 || (-[UMLUser diskNode](v5, "diskNode"), (v73 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser diskNode](self, "diskNode");
    v6 = objc_claimAutoreleasedReturnValue();
    -[UMLUser diskNode](v5, "diskNode");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)v6;
    HIDWORD(v134) = 1;
    if (!objc_msgSend((id)v6, "isEqual:"))
    {
      v11 = 0;
      v122 = 0;
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001;
      v118[0] = 0x100000000;
      v123 = 1;
      goto LABEL_13;
    }
    LODWORD(v123) = 1;
  }
  else
  {
    v73 = 0;
    LODWORD(v123) = 0;
  }
  -[UMLUser volumeUUID](self, "volumeUUID");
  v44 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v123) = v44 == 0;
  v74 = (void *)v44;
  v54 = v5;
  if (v44 || (-[UMLUser volumeUUID](v5, "volumeUUID"), (v69 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UMLUser volumeUUID](self, "volumeUUID");
    v6 = objc_claimAutoreleasedReturnValue();
    -[UMLUser volumeUUID](v5, "volumeUUID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v6;
    HIDWORD(v134) = 1;
    if (!objc_msgSend((id)v6, "isEqual:"))
    {
      v12 = 0;
      *(_QWORD *)&v119[4] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v120 = 1;
      v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(_QWORD *)((char *)&v118[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v118[2] + 4) = 0x100000001;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001;
      v118[0] = 0x100000000;
      v11 = 1;
      v122 = 1;
LABEL_206:
      v5 = v54;
      goto LABEL_13;
    }
    LODWORD(v122) = 1;
  }
  else
  {
    v69 = 0;
    LODWORD(v122) = 0;
  }
  -[UMLUser homeDirPath](self, "homeDirPath");
  v45 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v122) = v45 == 0;
  v70 = (void *)v45;
  if (!v45)
  {
    -[UMLUser homeDirPath](v5, "homeDirPath");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v65)
    {
      v65 = 0;
      *(_DWORD *)&v119[8] = 0;
      goto LABEL_188;
    }
  }
  -[UMLUser homeDirPath](self, "homeDirPath");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser homeDirPath](v54, "homeDirPath");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v46;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v46, "isEqual:"))
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v10 = 0;
    v120 = 1;
    v121 = 0;
    *(_DWORD *)v119 = 1;
    *(_QWORD *)&v119[4] = 0x100000000;
    v118[4] = 1;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    v118[1] = 0x100000001;
    v118[0] = 0x100000000;
    v11 = 1;
    v12 = 1;
    goto LABEL_206;
  }
  *(_DWORD *)&v119[8] = 1;
LABEL_188:
  -[UMLUser opaqueData](self, "opaqueData");
  v47 = objc_claimAutoreleasedReturnValue();
  v121 = v47 == 0;
  v66 = (void *)v47;
  if (!v47)
  {
    -[UMLUser opaqueData](v54, "opaqueData");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      v61 = 0;
      LODWORD(v118[0]) = 0;
      goto LABEL_194;
    }
  }
  -[UMLUser opaqueData](self, "opaqueData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser opaqueData](v54, "opaqueData");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v48;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v48, "isEqual:"))
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v10 = 0;
    v120 = 1;
    *(_QWORD *)v119 = 1;
    v118[4] = 1;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    v118[1] = 0x100000001;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v118[0] = 0x100000001;
    goto LABEL_206;
  }
  LODWORD(v118[0]) = 1;
LABEL_194:
  -[UMLUser keybagOpaqueData](self, "keybagOpaqueData");
  v49 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v119[4] = v49 == 0;
  v62 = (void *)v49;
  if (!v49)
  {
    -[UMLUser keybagOpaqueData](v54, "keybagOpaqueData");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      v58 = 0;
      HIDWORD(v118[4]) = 0;
      goto LABEL_200;
    }
  }
  -[UMLUser keybagOpaqueData](self, "keybagOpaqueData");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser keybagOpaqueData](v54, "keybagOpaqueData");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v50;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v50, "isEqual:"))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v10 = 0;
    v120 = 1;
    *(_DWORD *)v119 = 1;
    v118[4] = 0x100000001;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    HIDWORD(v118[0]) = 1;
    v118[1] = 0x100000001;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    goto LABEL_206;
  }
  HIDWORD(v118[4]) = 1;
LABEL_200:
  v6 = -[UMLUser needsMount](self, "needsMount");
  if ((_DWORD)v6 != -[UMLUser needsMount](v54, "needsMount")
    || (v6 = -[UMLUser isForeground](self, "isForeground"), (_DWORD)v6 != -[UMLUser isForeground](v54, "isForeground"))
    || (v6 = -[UMLUser isDirty](self, "isDirty"), (_DWORD)v6 != -[UMLUser isDirty](v54, "isDirty"))
    || (v6 = -[UMLUser isPrimaryUser](self, "isPrimaryUser"),
        (_DWORD)v6 != -[UMLUser isPrimaryUser](v54, "isPrimaryUser"))
    || (v6 = -[UMLUser isAdminUser](self, "isAdminUser"), (_DWORD)v6 != -[UMLUser isAdminUser](v54, "isAdminUser")))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v10 = 0;
    HIDWORD(v134) = 1;
    v120 = 1;
    *(_DWORD *)v119 = 1;
    LODWORD(v118[4]) = 1;
    v118[3] = 0x100000001;
    v118[2] = 0x100000001;
    HIDWORD(v118[0]) = 1;
    v118[1] = 0x100000001;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    goto LABEL_206;
  }
  -[UMLUser creationDate](self, "creationDate");
  v51 = objc_claimAutoreleasedReturnValue();
  v53 = v51 == 0;
  v57 = (void *)v51;
  if (!v51)
  {
    -[UMLUser creationDate](v54, "creationDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v55)
    {
      v57 = 0;
      v55 = 0;
      v17 = 0;
      HIDWORD(v134) = 1;
      v120 = 1;
      *(_DWORD *)v119 = 1;
      LODWORD(v118[4]) = 1;
      v118[3] = 0x100000001;
      v118[2] = 0x100000001;
      HIDWORD(v118[0]) = 1;
      v118[1] = 0x100000001;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      v16 = 1;
      v10 = 1;
      goto LABEL_206;
    }
  }
  -[UMLUser creationDate](self, "creationDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v54;
  -[UMLUser creationDate](v54, "creationDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v56 = v52;
  v10 = objc_msgSend(v52, "isEqual:", v6);
  v17 = 1;
  HIDWORD(v134) = 1;
  v120 = 1;
  *(_DWORD *)v119 = 1;
  LODWORD(v118[4]) = 1;
  v118[3] = 0x100000001;
  v118[2] = 0x100000001;
  HIDWORD(v118[0]) = 1;
  v118[1] = 0x100000001;
  v11 = 1;
  v12 = 1;
  v13 = 1;
  v14 = 1;
  v15 = 1;
  v16 = v53;
LABEL_13:
  if (v17)
  {
    v18 = v14;
    v19 = v13;
    v20 = v12;
    v21 = v11;
    v22 = v5;
    v23 = v15;
    v24 = v16;

    v16 = v24;
    v15 = v23;
    v5 = v22;
    v11 = v21;
    v12 = v20;
    v13 = v19;
    v14 = v18;
  }
  if (v16)

  if (v15)
  if (HIDWORD(v118[4]))
  {

  }
  if (*(_DWORD *)&v119[4])

  if (v14)
  if (LODWORD(v118[0]))
  {

  }
  if (v121)

  if (v13)
  if (*(_DWORD *)&v119[8])
  {

  }
  if (HIDWORD(v122))

  if (v12)
  if ((_DWORD)v122)
  {

  }
  if (HIDWORD(v123))

  if (v11)
  if ((_DWORD)v123)
  {

  }
  if (HIDWORD(v124))

  if (HIDWORD(v118[0]))
  if ((_DWORD)v124)
  {

  }
  if (HIDWORD(v125))

  if (LODWORD(v118[1]))
  if ((_DWORD)v125)
  {

  }
  if (HIDWORD(v126))

  if (HIDWORD(v118[1]))
  if ((_DWORD)v126)
  {

  }
  if (HIDWORD(v127))

  if (LODWORD(v118[2]))
  if ((_DWORD)v127)
  {

  }
  if (HIDWORD(v128))

  if (HIDWORD(v118[2]))
  if ((_DWORD)v128)
  {

  }
  if (HIDWORD(v129))

  if (LODWORD(v118[3]))
  if ((_DWORD)v129)
  {

  }
  if (HIDWORD(v130))

  if (HIDWORD(v118[3]))
  if ((_DWORD)v130)
  {

  }
  if (HIDWORD(v131))

  if (LODWORD(v118[4]))
  {

    if (!(_DWORD)v131)
      goto LABEL_91;
  }
  else if (!(_DWORD)v131)
  {
LABEL_91:
    if (!HIDWORD(v132))
      goto LABEL_93;
    goto LABEL_92;
  }

  if (HIDWORD(v132))
LABEL_92:

LABEL_93:
  if (*(_DWORD *)v119)
  {

    if (!(_DWORD)v132)
      goto LABEL_95;
  }
  else if (!(_DWORD)v132)
  {
LABEL_95:
    if (!HIDWORD(v133))
      goto LABEL_97;
    goto LABEL_96;
  }

  if (HIDWORD(v133))
LABEL_96:

LABEL_97:
  if (v120)
  {

    if (!(_DWORD)v133)
      goto LABEL_99;
LABEL_112:

    if (!(_DWORD)v134)
      goto LABEL_101;
    goto LABEL_100;
  }
  if ((_DWORD)v133)
    goto LABEL_112;
LABEL_99:
  if ((_DWORD)v134)
LABEL_100:

LABEL_101:
  if (HIDWORD(v134))

LABEL_104:
  return v10;
}

- (unint64_t)hash
{
  int v3;
  int v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v3 = -[UMLUser uid](self, "uid");
  v4 = -[UMLUser gid](self, "gid") + v3;
  v5 = -[UMLUser apnsID](self, "apnsID") + v4;
  -[UMLUser userUUID](self, "userUUID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v43, "hash");
  -[UMLUser alternateDSID](self, "alternateDSID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 + objc_msgSend(v42, "hash");
  -[UMLUser userType](self, "userType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 + v7 + objc_msgSend(v41, "hash");
  -[UMLUser username](self, "username");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v40, "hash");
  -[UMLUser firstName](self, "firstName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 + objc_msgSend(v39, "hash");
  -[UMLUser lastName](self, "lastName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 + objc_msgSend(v38, "hash");
  -[UMLUser displayName](self, "displayName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 + v11 + objc_msgSend(v37, "hash");
  -[UMLUser userLanguauge](self, "userLanguauge");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v36, "hash");
  -[UMLUser fileInfoPath](self, "fileInfoPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 + objc_msgSend(v14, "hash");
  -[UMLUser libInfoPath](self, "libInfoPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 + objc_msgSend(v16, "hash");
  -[UMLUser diskNode](self, "diskNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 + objc_msgSend(v18, "hash");
  -[UMLUser volumeUUID](self, "volumeUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v12 + v19 + objc_msgSend(v20, "hash");
  -[UMLUser homeDirPath](self, "homeDirPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");
  -[UMLUser opaqueData](self, "opaqueData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23 + objc_msgSend(v24, "hash");
  -[UMLUser keybagOpaqueData](self, "keybagOpaqueData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v21 + v25 + objc_msgSend(v26, "hash");
  v28 = v27 + -[UMLUser needsMount](self, "needsMount");
  v29 = v28 + -[UMLUser isForeground](self, "isForeground");
  v30 = v29 + -[UMLUser isDirty](self, "isDirty");
  v31 = v30 + -[UMLUser isPrimaryUser](self, "isPrimaryUser");
  v32 = v31 + -[UMLUser isAdminUser](self, "isAdminUser");
  -[UMLUser creationDate](self, "creationDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v32 + objc_msgSend(v33, "hash");

  return v34;
}

- (int)uid
{
  return self->_uid;
}

- (void)setUid:(int)a3
{
  self->_uid = a3;
}

- (int)gid
{
  return self->_gid;
}

- (void)setGid:(int)a3
{
  self->_gid = a3;
}

- (int64_t)apnsID
{
  return self->_apnsID;
}

- (void)setApnsID:(int64_t)a3
{
  self->_apnsID = a3;
}

- (NSString)userUUID
{
  return self->_userUUID;
}

- (void)setUserUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (void)setAlternateDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)userType
{
  return self->_userType;
}

- (void)setUserType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)userLanguauge
{
  return self->_userLanguauge;
}

- (void)setUserLanguauge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)fileInfoPath
{
  return self->_fileInfoPath;
}

- (void)setFileInfoPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)libInfoPath
{
  return self->_libInfoPath;
}

- (void)setLibInfoPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)diskNode
{
  return self->_diskNode;
}

- (void)setDiskNode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)volumeUUID
{
  return self->_volumeUUID;
}

- (void)setVolumeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)homeDirPath
{
  return self->_homeDirPath;
}

- (void)setHomeDirPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)opaqueData
{
  return self->_opaqueData;
}

- (void)setOpaqueData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)keybagOpaqueData
{
  return self->_keybagOpaqueData;
}

- (void)setKeybagOpaqueData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)needsMount
{
  return self->_needsMount;
}

- (void)setNeedsMount:(BOOL)a3
{
  self->_needsMount = a3;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  self->_isPrimaryUser = a3;
}

- (BOOL)isAdminUser
{
  return self->_isAdminUser;
}

- (void)setIsAdminUser:(BOOL)a3
{
  self->_isAdminUser = a3;
}

- (NSDate)lastLoginStart
{
  return self->_lastLoginStart;
}

- (void)setLastLoginStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDate)lastLoginEnd
{
  return self->_lastLoginEnd;
}

- (void)setLastLoginEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)isDisabledUser
{
  return self->_isDisabledUser;
}

- (void)setIsDisabledUser:(BOOL)a3
{
  self->_isDisabledUser = a3;
}

- (BOOL)isLoginUser
{
  return self->_isLoginUser;
}

- (void)setIsLoginUser:(BOOL)a3
{
  self->_isLoginUser = a3;
}

- (BOOL)isAuditor
{
  return self->_isAuditor;
}

- (void)setIsAuditor:(BOOL)a3
{
  self->_isAuditor = a3;
}

- (BOOL)hasSyncBag
{
  return self->_hasSyncBag;
}

- (void)setHasSyncBag:(BOOL)a3
{
  self->_hasSyncBag = a3;
}

- (int)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int)a3
{
  self->_gracePeriod = a3;
}

- (NSDate)firstLoginStart
{
  return self->_firstLoginStart;
}

- (void)setFirstLoginStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)firstLoginEnd
{
  return self->_firstLoginEnd;
}

- (void)setFirstLoginEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDate)cachedLoginStart
{
  return self->_cachedLoginStart;
}

- (void)setCachedLoginStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDate)cachedLoginEnd
{
  return self->_cachedLoginEnd;
}

- (void)setCachedLoginEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_cachedLoginEnd, 0);
  objc_storeStrong((id *)&self->_cachedLoginStart, 0);
  objc_storeStrong((id *)&self->_firstLoginEnd, 0);
  objc_storeStrong((id *)&self->_firstLoginStart, 0);
  objc_storeStrong((id *)&self->_lastLoginEnd, 0);
  objc_storeStrong((id *)&self->_lastLoginStart, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_keybagOpaqueData, 0);
  objc_storeStrong((id *)&self->_opaqueData, 0);
  objc_storeStrong((id *)&self->_homeDirPath, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_diskNode, 0);
  objc_storeStrong((id *)&self->_libInfoPath, 0);
  objc_storeStrong((id *)&self->_fileInfoPath, 0);
  objc_storeStrong((id *)&self->_userLanguauge, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

- (BOOL)isValidClassTypeinDictionary:(id)a3 withKey:(id)a4 withType:(Class)a5
{
  void *v5;
  BOOL v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a3, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v7 = (id)qword_2578B0E00;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_249998C68();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if (v9)
      {
        v10 = _os_log_send_and_compose_impl();
        v11 = (void *)v10;
        if (v10)
          sub_249998C90(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)userFromManifestDictionary:(id)a3
{
  id v3;
  UMLUser *v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  void *v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
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
  NSObject *v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  void *v76;
  UMLUser *v77;
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

  v3 = a3;
  v4 = objc_alloc_init(UMLUser);
  -[UMLUser setUid:](v4, "setUid:", sub_2499913E4(v3, (uint64_t)CFSTR("MKBUserSessionID"), 0));
  if (*__error() == 2)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v6 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v7 = v6;
    else
      v7 = v6 & 0xFFFFFFFE;
    if (v7)
      goto LABEL_171;
LABEL_173:
    v76 = 0;
LABEL_174:
    free(v76);
LABEL_175:

    v77 = 0;
    goto LABEL_176;
  }
  if (qword_2578B0E08 != -1)
    dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
  v8 = (id)qword_2578B0E00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_249998C68();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 &= ~1u;
    if (v9)
    {
      v10 = v8;
      -[UMLUser uid](v4, "uid");
      v11 = (void *)_os_log_send_and_compose_impl();

      if (v11)
        sub_249998C90((uint64_t)v11);
    }
    else
    {
      v11 = 0;
    }
    free(v11);
  }

  -[UMLUser setGid:](v4, "setGid:", sub_2499913E4(v3, (uint64_t)CFSTR("MKBUserSessionGroupID"), 0));
  if (*__error() == 2)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v12 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v13 = v12;
    else
      v13 = v12 & 0xFFFFFFFE;
    if (!v13)
      goto LABEL_173;
    goto LABEL_171;
  }
  if (qword_2578B0E08 != -1)
    dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
  v14 = (id)qword_2578B0E00;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = sub_249998C68();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      v15 &= ~1u;
    if (v15)
    {
      v16 = v14;
      -[UMLUser gid](v4, "gid");
      v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
        sub_249998C90((uint64_t)v17);
    }
    else
    {
      v17 = 0;
    }
    free(v17);
  }

  -[UMLUser setApnsID:](v4, "setApnsID:", sub_2499914EC(v3, (uint64_t)CFSTR("MKBUserSessionAPNSID"), 0));
  if (*__error() == 2)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v18 = (id)qword_2578B0E00;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = sub_249998C68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if (v20)
      {
        v21 = (void *)_os_log_send_and_compose_impl();
        if (!v21)
          goto LABEL_58;
        goto LABEL_56;
      }
      goto LABEL_57;
    }
  }
  else
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v18 = (id)qword_2578B0E00;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = sub_249998C68();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        v22 &= ~1u;
      if (v22)
      {
        v23 = v18;
        -[UMLUser apnsID](v4, "apnsID");
        v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
LABEL_58:
          free(v21);
          goto LABEL_59;
        }
LABEL_56:
        sub_249998C90((uint64_t)v21);
        goto LABEL_58;
      }
LABEL_57:
      v21 = 0;
      goto LABEL_58;
    }
  }
LABEL_59:

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionUUID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUserUUID:](v4, "setUserUUID:", v24);

  -[UMLUser userUUID](v4, "userUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v30 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v31 = v30;
    else
      v31 = v30 & 0xFFFFFFFE;
    if (!v31)
      goto LABEL_173;
LABEL_171:
    v75 = _os_log_send_and_compose_impl();
    v76 = (void *)v75;
    if (v75)
      sub_249998C90(v75);
    goto LABEL_174;
  }
  if (qword_2578B0E08 != -1)
    dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
  v26 = (id)qword_2578B0E00;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = sub_249998C68();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      v27 &= ~1u;
    if (v27)
    {
      v28 = v26;
      -[UMLUser userUUID](v4, "userUUID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)_os_log_send_and_compose_impl();

      if (v29)
        sub_249998C90((uint64_t)v29);
    }
    else
    {
      v29 = 0;
    }
    free(v29);
  }

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionAlternateUUID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setAlternateDSID:](v4, "setAlternateDSID:", v32);

  -[UMLUser alternateDSID](v4, "alternateDSID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v34 = (id)qword_2578B0E00;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = sub_249998C68();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        v35 &= ~1u;
      if (v35)
      {
        v36 = v34;
        -[UMLUser alternateDSID](v4, "alternateDSID");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)_os_log_send_and_compose_impl();

        if (!v37)
          goto LABEL_97;
        goto LABEL_95;
      }
      goto LABEL_96;
    }
  }
  else
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v34 = (id)qword_2578B0E00;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v38 = sub_249998C68();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        v39 = v38;
      else
        v39 = v38 & 0xFFFFFFFE;
      if (v39)
      {
        v37 = (void *)_os_log_send_and_compose_impl();
        if (!v37)
        {
LABEL_97:
          free(v37);
          goto LABEL_98;
        }
LABEL_95:
        sub_249998C90((uint64_t)v37);
        goto LABEL_97;
      }
LABEL_96:
      v37 = 0;
      goto LABEL_97;
    }
  }
LABEL_98:

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserTypeKey"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUserType:](v4, "setUserType:", v40);

  -[UMLUser userType](v4, "userType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v46 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v47 = v46;
    else
      v47 = v46 & 0xFFFFFFFE;
    if (!v47)
      goto LABEL_173;
    goto LABEL_171;
  }
  if (qword_2578B0E08 != -1)
    dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
  v42 = (id)qword_2578B0E00;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    v43 = sub_249998C68();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      v43 &= ~1u;
    if (v43)
    {
      v44 = v42;
      -[UMLUser userType](v4, "userType");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)_os_log_send_and_compose_impl();

      if (v45)
        sub_249998C90((uint64_t)v45);
    }
    else
    {
      v45 = 0;
    }
    free(v45);
  }

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionShortName"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUsername:](v4, "setUsername:", v48);

  -[UMLUser username](v4, "username");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v65 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v66 = v65;
    else
      v66 = v65 & 0xFFFFFFFE;
    if (!v66)
      goto LABEL_173;
    goto LABEL_171;
  }
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionFirstName"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFirstName:](v4, "setFirstName:", v50);

  -[UMLUser firstName](v4, "firstName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v67 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v68 = v67;
    else
      v68 = v67 & 0xFFFFFFFE;
    if (!v68)
      goto LABEL_173;
    goto LABEL_171;
  }
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionLastName"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLastName:](v4, "setLastName:", v52);

  -[UMLUser lastName](v4, "lastName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v69 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v70 = v69;
    else
      v70 = v69 & 0xFFFFFFFE;
    if (!v70)
      goto LABEL_173;
    goto LABEL_171;
  }
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionDisplayName"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setDisplayName:](v4, "setDisplayName:", v54);

  -[UMLUser displayName](v4, "displayName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v71 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v72 = v71;
    else
      v72 = v71 & 0xFFFFFFFE;
    if (!v72)
      goto LABEL_173;
    goto LABEL_171;
  }
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionLibinfoHomeDir"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLibInfoPath:](v4, "setLibInfoPath:", v56);

  -[UMLUser libInfoPath](v4, "libInfoPath");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v57)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v5 = (id)qword_2578B0E00;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_175;
    v73 = sub_249998C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v74 = v73;
    else
      v74 = v73 & 0xFFFFFFFE;
    if (!v74)
      goto LABEL_173;
    goto LABEL_171;
  }
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionHomeDir"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setHomeDirPath:](v4, "setHomeDirPath:", v58);

  -[UMLUser homeDirPath](v4, "homeDirPath");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
  {
    if (qword_2578B0E08 != -1)
      dispatch_once(&qword_2578B0E08, &unk_251AD48E0);
    v60 = (id)qword_2578B0E00;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v61 = sub_249998C68();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        v62 = v61;
      else
        v62 = v61 & 0xFFFFFFFE;
      if (v62)
      {
        v63 = _os_log_send_and_compose_impl();
        v64 = (void *)v63;
        if (v63)
          sub_249998C90(v63);
      }
      else
      {
        v64 = 0;
      }
      free(v64);
    }

  }
  -[UMLUser setNeedsMount:](v4, "setNeedsMount:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionNeedsMount")));
  -[UMLUser setIsForeground:](v4, "setIsForeground:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionForeground")));
  -[UMLUser setIsDirty:](v4, "setIsDirty:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionDirty")));
  -[UMLUser setIsPrimaryUser:](v4, "setIsPrimaryUser:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionisPrimary")));
  -[UMLUser setIsAdminUser:](v4, "setIsAdminUser:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionisAdminKey")));
  -[UMLUser setIsDisabledUser:](v4, "setIsDisabledUser:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionDisabled")));
  -[UMLUser setIsLoginUser:](v4, "setIsLoginUser:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionLoginUser")));
  -[UMLUser setIsAuditor:](v4, "setIsAuditor:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionAuditor")));
  -[UMLUser setHasSyncBag:](v4, "setHasSyncBag:", sub_249991360(v3, (uint64_t)CFSTR("MKBUserSessionHasSyncBag")));
  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionLanguage"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setUserLanguauge:](v4, "setUserLanguauge:", v79);

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionFileInfo"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFileInfoPath:](v4, "setFileInfoPath:", v80);

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionVolumeDeviceNode"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setDiskNode:](v4, "setDiskNode:", v81);

  sub_2499915F4(v3, (uint64_t)CFSTR("MKBUserSessionVolumeUUID"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setVolumeUUID:](v4, "setVolumeUUID:", v82);

  sub_24999191C(v3, (uint64_t)CFSTR("MKBUserSessionOpaque"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setOpaqueData:](v4, "setOpaqueData:", v83);

  sub_24999191C(v3, (uint64_t)CFSTR("MKBUserSessionKeybagOpaqueData"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setKeybagOpaqueData:](v4, "setKeybagOpaqueData:", v84);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionCreateTimeStamp"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCreationDate:](v4, "setCreationDate:", v85);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionCreateTimeStamp"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCreationDate:](v4, "setCreationDate:", v86);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionCachedLoginStartTime"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLastLoginStart:](v4, "setLastLoginStart:", v87);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionCachedLoginEndTime"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setLastLoginEnd:](v4, "setLastLoginEnd:", v88);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionFirstLoginStartTime"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFirstLoginStart:](v4, "setFirstLoginStart:", v89);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionFirstLoginEndTime"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setFirstLoginEnd:](v4, "setFirstLoginEnd:", v90);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionCachedLoginStartTime"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCachedLoginStart:](v4, "setCachedLoginStart:", v91);

  sub_2499918A0(v3, (uint64_t)CFSTR("MKBUserSessionCachedLoginEndTime"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUser setCachedLoginEnd:](v4, "setCachedLoginEnd:", v92);

  -[UMLUser setGracePeriod:](v4, "setGracePeriod:", sub_2499913E4(v3, (uint64_t)CFSTR("MKBUserSessionRequiresPasscode"), 0));
  v77 = v4;
LABEL_176:

  return v77;
}

- (id)userManifestDictionary
{
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUser uid](self, "uid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("MKBUserSessionID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUser gid](self, "gid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("MKBUserSessionGroupID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[UMLUser apnsID](self, "apnsID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("MKBUserSessionAPNSID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[UMLUser apnsID](self, "apnsID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MKBUserSessionAPNSID"));

  -[UMLUser userUUID](self, "userUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("MKBUserSessionUUID"));

  -[UMLUser alternateDSID](self, "alternateDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UMLUser alternateDSID](self, "alternateDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("MKBUserSessionAlternateUUID"));

  }
  -[UMLUser userType](self, "userType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("MKBUserTypeKey"));

  -[UMLUser username](self, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("MKBUserSessionShortName"));

  -[UMLUser firstName](self, "firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("MKBUserSessionFirstName"));

  -[UMLUser lastName](self, "lastName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("MKBUserSessionLastName"));

  -[UMLUser displayName](self, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("MKBUserSessionDisplayName"));

  -[UMLUser libInfoPath](self, "libInfoPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("MKBUserSessionLibinfoHomeDir"));

  -[UMLUser homeDirPath](self, "homeDirPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("MKBUserSessionHomeDir"));

  if (-[UMLUser needsMount](self, "needsMount"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser needsMount](self, "needsMount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("MKBUserSessionNeedsMount"));

  }
  if (-[UMLUser isForeground](self, "isForeground"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isForeground](self, "isForeground"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("MKBUserSessionForeground"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isDirty](self, "isDirty"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("MKBUserSessionDirty"));

  -[UMLUser creationDate](self, "creationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("MKBUserSessionCreateTimeStamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isPrimaryUser](self, "isPrimaryUser"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("MKBUserSessionisPrimary"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isAdminUser](self, "isAdminUser"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("MKBUserSessionisAdminKey"));

  -[UMLUser lastLoginStart](self, "lastLoginStart");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[UMLUser lastLoginStart](self, "lastLoginStart");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("MKBUserSessionCachedLoginStartTime"));

  }
  -[UMLUser lastLoginEnd](self, "lastLoginEnd");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[UMLUser lastLoginEnd](self, "lastLoginEnd");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("MKBUserSessionCachedLoginEndTime"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isDirty](self, "isDirty"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("MKBUserSessionDirty"));

  if (-[UMLUser isDisabledUser](self, "isDisabledUser"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isDisabledUser](self, "isDisabledUser"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("MKBUserSessionDisabled"));

  }
  if (-[UMLUser isLoginUser](self, "isLoginUser"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isLoginUser](self, "isLoginUser"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("MKBUserSessionLoginUser"));

  }
  if (-[UMLUser isAuditor](self, "isAuditor"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser isAuditor](self, "isAuditor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("MKBUserSessionAuditor"));

  }
  if (-[UMLUser hasSyncBag](self, "hasSyncBag"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UMLUser hasSyncBag](self, "hasSyncBag"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("MKBUserSessionHasSyncBag"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[UMLUser gracePeriod](self, "gracePeriod"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("MKBUserSessionRequiresPasscode"));

  -[UMLUser firstLoginStart](self, "firstLoginStart");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[UMLUser firstLoginStart](self, "firstLoginStart");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("MKBUserSessionFirstLoginStartTime"));

  }
  -[UMLUser firstLoginEnd](self, "firstLoginEnd");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[UMLUser firstLoginEnd](self, "firstLoginEnd");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("MKBUserSessionFirstLoginEndTime"));

  }
  -[UMLUser cachedLoginStart](self, "cachedLoginStart");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[UMLUser cachedLoginStart](self, "cachedLoginStart");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("MKBUserSessionCachedLoginStartTime"));

  }
  -[UMLUser cachedLoginEnd](self, "cachedLoginEnd");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[UMLUser cachedLoginEnd](self, "cachedLoginEnd");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("MKBUserSessionCachedLoginEndTime"));

  }
  return v3;
}

@end
