@implementation BRCNotification

- (id)subclassDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  BRFieldStructureSignature *v6;
  uint64_t v7;
  BRFieldContentSignature *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = v3;
  if (self->_itemGlobalID)
    objc_msgSend(v3, "appendFormat:", CFSTR(" i:%@"), self->_itemGlobalID);
  if (self->_parentGlobalID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" parent-id:%@"), self->_parentGlobalID);
  v5 = (int)*MEMORY[0x24BE17788];
  if (*(Class *)((char *)&self->super.super.isa + v5))
  {
    v6 = -[BRFieldStructureSignature initWithData:]([BRFieldStructureSignature alloc], "initWithData:", *(Class *)((char *)&self->super.super.isa + v5));
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v6);

  }
  v7 = (int)*MEMORY[0x24BE176F8];
  if (*(Class *)((char *)&self->super.super.isa + v7))
  {
    v8 = -[BRFieldContentSignature initWithData:]([BRFieldContentSignature alloc], "initWithData:", *(Class *)((char *)&self->super.super.isa + v7));
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v8);

  }
  v9 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE17708]);
  if (v9)
  {
    objc_msgSend(v9, "br_transform:", &__block_literal_global_3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" eqVersions:{%@}"), v11);

  }
  if (self->_isInDataScope)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sc:data"));
  if (self->_isInDocumentScope)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sc:docs"));
  if (self->_isInTrashScope)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sc:trash"));
  v12 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE17750]);
  if (v12 && (objc_msgSend(v12, "isEqualToFileObjectID:", self->_oldParentFileObjectID) & 1) == 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" old-pino:%@"), self->_oldParentFileObjectID);
  if (self->_aliasSourceAppLibraryID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" alias-container:%@"), self->_aliasSourceAppLibraryID);
  if (self->_oldAppLibraryID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" old-ct:%@"), self->_oldAppLibraryID);
  return v4;
}

id __38__BRCNotification_subclassDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BRFieldContentSignature *v3;
  void *v4;

  v2 = a2;
  v3 = -[BRFieldContentSignature initWithData:]([BRFieldContentSignature alloc], "initWithData:", v2);

  -[BRFieldContentSignature(BRAdditions) description](v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCNotification;
  v4 = -[BRCNotification copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 40, self->_itemGlobalID);
    objc_storeStrong(v5 + 37, self->_oldParentFileObjectID);
    objc_storeStrong(v5 + 41, self->_parentGlobalIDs);
    objc_storeStrong(v5 + 35, self->_appLibrary);
    objc_storeStrong(v5 + 36, self->_parentGlobalID);
    objc_storeStrong(v5 + 38, self->_aliasSourceAppLibraryID);
  }
  return v5;
}

- (BRCNotification)initWithLocalItem:(id)a3 itemDiffs:(unint64_t)a4
{
  NSObject *v4;
  id v7;
  BRCNotification *v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  BRCAppLibrary *appLibrary;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BRCItemGlobalID *itemGlobalID;
  uint64_t v19;
  BRCItemGlobalID *parentGlobalID;
  void *v21;
  id v22;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  BRFileObjectID *oldParentFileObjectID;
  void *v36;
  BRCAppLibrary *v37;
  BRCAppLibrary *v38;
  BRCAppLibrary *v39;
  BRCAppLibrary *v40;
  BOOL v41;
  BRCNotification *v42;
  void *v43;
  NSString *p_isa;
  uint64_t v45;
  int v46;
  unsigned int *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unsigned int *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  int *v69;
  uint64_t v70;
  void *v71;
  BRFieldFinderTags *v72;
  void *v73;
  BRFieldFinderTags *v74;
  void *v75;
  char v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  int v84;
  int v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void **v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  char v101;
  unint64_t v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  id v111;
  unsigned int v112;
  void *v113;
  NSObject *v114;
  int v115;
  char v116;
  unint64_t v117;
  int v118;
  int v119;
  uint64_t v120;
  unint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  unsigned int *v127;
  uint64_t v128;
  unint64_t v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  char v134;
  unint64_t v135;
  unint64_t v136;
  unsigned int *v137;
  unsigned int v138;
  int v139;
  void *v140;
  char v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  uint64_t *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  int v157;
  unint64_t v158;
  unsigned int *v159;
  void *v160;
  char v161;
  int v162;
  int v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  int v173;
  unint64_t v174;
  void *v175;
  int v176;
  int v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  char v185;
  void *v186;
  unsigned int *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  int v193;
  int v194;
  unint64_t v195;
  int v196;
  int v197;
  unint64_t v198;
  int v199;
  int v200;
  unint64_t v201;
  void *v202;
  int v203;
  unsigned int v204;
  unint64_t v205;
  void *v206;
  int v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  id v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t i;
  uint64_t v233;
  BRFieldContentSignature *v234;
  id v235;
  void *v236;
  void *v237;
  void *v238;
  id *v239;
  int v240;
  unsigned int *v241;
  uint64_t v242;
  unint64_t v243;
  void *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  void *v250;
  void *v251;
  int v252;
  int v253;
  unint64_t v254;
  void *v255;
  int v256;
  int v257;
  unint64_t v258;
  void *v259;
  int v260;
  void *v261;
  void *v262;
  int v263;
  void *v264;
  void *v265;
  uint64_t v266;
  void *v267;
  id v268;
  void *v269;
  void *v270;
  void *v271;
  char v272;
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
  BRFieldContentSignature *v284;
  void *v285;
  BRFieldContentSignature *v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  uint64_t v293;
  uint64_t v294;
  char v295;
  void *v296;
  BRFieldStructureSignature *v297;
  void *v298;
  void *v299;
  void *v300;
  uint64_t v301;
  void *v302;
  char v303;
  void *v304;
  void *v305;
  void *v306;
  int v307;
  int v308;
  BRCNotification *v309;
  id v311;
  void *v312;
  void *v313;
  NSObject *v314;
  void *v315;
  NSObject *v316;
  void *v317;
  NSObject *v318;
  void *v319;
  NSObject *v320;
  void *v321;
  NSObject *v322;
  void *v323;
  BRCAppLibrary *v324;
  void *v325;
  void *v326;
  id *location;
  unint64_t v328;
  void *v329;
  void *v330;
  unsigned int *v331;
  BRCNotification *v332;
  id obj;
  id obja;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  objc_super v339;
  uint8_t v340[128];
  uint8_t buf[4];
  void *v342;
  __int16 v343;
  void *v344;
  __int16 v345;
  uint64_t v346;
  __int16 v347;
  id v348;
  __int16 v349;
  void *v350;
  uint64_t v351;

  v351 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (objc_msgSend(v7, "isBRAlias"))
  {
    v311 = v7;
    brc_bread_crumbs();
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCNotification initWithLocalItem:itemDiffs:].cold.7();

    v7 = v311;
  }
  v339.receiver = self;
  v339.super_class = (Class)BRCNotification;
  v8 = -[BRCNotification init](&v339, sel_init);

  if (v8)
  {
    objc_msgSend(v7, "orig");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isZoneRoot") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "st");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v329 = (void *)v9;
    objc_msgSend(v7, "session");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isOnDisk");
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17738]) = (Class)-1;
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17768]) = (Class)-1;
    objc_msgSend(v7, "appLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    appLibrary = v8->_appLibrary;
    v8->_appLibrary = (BRCAppLibrary *)v12;

    -[BRCAppLibrary appLibraryID](v8->_appLibrary, "appLibraryID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (int)*MEMORY[0x24BE176C0];
    v16 = *(Class *)((char *)&v8->super.super.isa + v15);
    *(Class *)((char *)&v8->super.super.isa + v15) = (Class)v14;

    objc_msgSend(v7, "itemGlobalID");
    v17 = objc_claimAutoreleasedReturnValue();
    itemGlobalID = v8->_itemGlobalID;
    v8->_itemGlobalID = (BRCItemGlobalID *)v17;

    objc_msgSend(v7, "itemParentGlobalID");
    v19 = objc_claimAutoreleasedReturnValue();
    parentGlobalID = v8->_parentGlobalID;
    v8->_parentGlobalID = (BRCItemGlobalID *)v19;

    if (v10)
    {
      objc_msgSend(v10, "logicalName");
    }
    else
    {
      -[BRCAppLibrary mangledID](v8->_appLibrary, "mangledID");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject mangledIDString](v4, "mangledIDString");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23 = (id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17740]);
    objc_storeStrong(v23, v21);
    v330 = v22;
    if (!v22)
    {

      v21 = v4;
    }

    v24 = *v23;
    v25 = v22;
    if (!v24)
    {
      brc_bread_crumbs();
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v314 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v314, OS_LOG_TYPE_FAULT))
        -[BRCNotification initWithLocalItem:itemDiffs:].cold.6();

    }
    v8->_isInDocumentScope = objc_msgSend(v7, "isInDocumentScope");
    v8->_isInDataScope = objc_msgSend(v7, "isInDataScope");
    v8->_isInTrashScope = objc_msgSend(v7, "isInTrashScope");
    objc_msgSend(v7, "parentClientZone");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dbRowID");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (int)*MEMORY[0x24BE17760];
    v29 = *(Class *)((char *)&v8->super.super.isa + v28);
    *(Class *)((char *)&v8->super.super.isa + v28) = (Class)v27;

    objc_msgSend(v7, "clientZone");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dbRowID");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (int)*MEMORY[0x24BE177A0];
    v33 = *(Class *)((char *)&v8->super.super.isa + v32);
    *(Class *)((char *)&v8->super.super.isa + v32) = (Class)v31;

    if ((objc_msgSend(v329, "isFSRoot") & 1) == 0)
    {
      objc_msgSend(v329, "parentFileObjectID");
      v34 = objc_claimAutoreleasedReturnValue();
      oldParentFileObjectID = v8->_oldParentFileObjectID;
      v8->_oldParentFileObjectID = (BRFileObjectID *)v34;

    }
    objc_msgSend(v329, "appLibrary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v332 = v8;
    v37 = v8->_appLibrary;
    v38 = v36;
    v39 = v37;
    if (v38 == v39)
    {

      p_isa = (NSString *)&v38->super.isa;
      v42 = v332;
      v43 = v329;
    }
    else
    {
      v40 = v39;
      if (v39)
      {
        v41 = -[BRCAppLibrary isEqual:](v38, "isEqual:", v39);

        v42 = v332;
        v43 = v329;
        if (v41)
        {
LABEL_22:
          v324 = v38;
          v46 = objc_msgSend(v7, "fromReadOnlyDB");
          v47 = (unsigned int *)((char *)v42 + (int)*MEMORY[0x24BE17720]);
          v48 = 0x100000;
          if (!v46)
            v48 = 0;
          v49 = *v47 & 0xFFEFFFCF | ((unint64_t)*((unsigned __int8 *)v47 + 4) << 32) | v48;
          v328 = a4;
          v331 = (unsigned int *)((char *)v42 + (int)*MEMORY[0x24BE17720]);
          if ((v11 & 1) != 0)
          {
            *v47 = *v47 & 0xFFEFFFCF | v48;
            *((_BYTE *)v47 + 4) = BYTE4(v49);
            objc_msgSend(v7, "fileObjectID");
            v50 = objc_claimAutoreleasedReturnValue();
            v51 = (int)*MEMORY[0x24BE17718];
            v52 = *(Class *)((char *)&v42->super.super.isa + v51);
            *(Class *)((char *)&v42->super.super.isa + v51) = (Class)v50;

            v53 = v47;
            if ((objc_msgSend(v7, "isFSRoot") & 1) == 0)
            {
              objc_msgSend(v7, "parentFileObjectID");
              v54 = objc_claimAutoreleasedReturnValue();
              v55 = (int)*MEMORY[0x24BE17750];
              v56 = *(Class *)((char *)&v42->super.super.isa + v55);
              *(Class *)((char *)&v42->super.super.isa + v55) = (Class)v54;

              if ((objc_msgSend(v7, "sharingOptions") & 0x48) != 0)
              {
                if ((objc_msgSend(v7, "sharingOptions") & 4) == 0)
                {
                  objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v7);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v57;
                  if (v57)
                  {
                    objc_msgSend(v57, "brc_shareItemID");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "clientZone");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "db");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "itemByItemID:db:", v59, v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v62)
                    {
                      brc_bread_crumbs();
                      v321 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v322 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v322, OS_LOG_TYPE_FAULT))
                        -[BRCNotification initWithLocalItem:itemDiffs:].cold.5();

                      v42 = v332;
                    }
                    objc_msgSend(v62, "fileObjectID");
                    v63 = objc_claimAutoreleasedReturnValue();
                    v64 = (int)*MEMORY[0x24BE17778];
                    v65 = *(Class *)((char *)&v42->super.super.isa + v64);
                    *(Class *)((char *)&v42->super.super.isa + v64) = (Class)v63;

                    a4 = v328;
                    v25 = v22;
                    v53 = v331;
                  }
                  goto LABEL_35;
                }
                objc_msgSend(v7, "fileObjectID");
                v68 = objc_claimAutoreleasedReturnValue();
                v69 = (int *)MEMORY[0x24BE17778];
LABEL_34:
                v70 = *v69;
                v58 = *(Class *)((char *)&v42->super.super.isa + v70);
                *(Class *)((char *)&v42->super.super.isa + v70) = (Class)v68;
LABEL_35:

              }
            }
          }
          else
          {
            *((_BYTE *)v47 + 4) = BYTE4(v49);
            *v47 = v49 | 0x10;
            objc_msgSend(v43, "fileObjectID");
            v66 = objc_claimAutoreleasedReturnValue();
            v51 = (int)*MEMORY[0x24BE17718];
            v67 = *(Class *)((char *)&v42->super.super.isa + v51);
            *(Class *)((char *)&v42->super.super.isa + v51) = (Class)v66;

            v53 = v47;
            if ((objc_msgSend(v43, "isFSRoot") & 1) == 0)
            {
              objc_msgSend(v43, "parentFileObjectID");
              v68 = objc_claimAutoreleasedReturnValue();
              v69 = (int *)MEMORY[0x24BE17750];
              goto LABEL_34;
            }
          }
          if ((objc_msgSend(v7, "isDocument") & 1) == 0
            && objc_msgSend(*(id *)((char *)&v42->super.super.isa + (int)v51), "type") == 2)
          {
            brc_bread_crumbs();
            v317 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v318 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v318, OS_LOG_TYPE_FAULT))
              -[BRCNotification initWithLocalItem:itemDiffs:].cold.4();

          }
          objc_msgSend(v25, "finderTags");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71)
          {
            v72 = [BRFieldFinderTags alloc];
            objc_msgSend(v25, "finderTags");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = -[BRFieldFinderTags initWithData:](v72, "initWithData:", v73);

            if (!-[BRFieldFinderTags tagsCount](v74, "tagsCount"))
            {
              brc_bread_crumbs();
              v315 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v316 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v316, OS_LOG_TYPE_FAULT))
                -[BRCNotification initWithLocalItem:itemDiffs:].cold.3();

              v53 = v331;
            }
            -[BRFieldFinderTags tags](v74, "tags");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCNotification setAttribute:forKey:](v42, "setAttribute:forKey:", v75, *MEMORY[0x24BE178F0]);

          }
          if (v25)
            v76 = objc_msgSend(v25, "mode");
          else
            v76 = 1;
          v77 = *v53;
          v78 = v77 & 0xFFFFFFFFFFF1FFFFLL | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
          *v53 = v77 & 0xFFF1FFFF | ((v76 & 7) << 17);
          *((_BYTE *)v53 + 4) = BYTE4(v78);
          if (objc_msgSend(v7, "isDirectory"))
          {
            v79 = *v53 & 0xFFF1FFFF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32) | ((unint64_t)((*v53 >> 17) & 5 | 2) << 17);
            *v53 = *v53 & 0xFFF1FFFF | (((*v53 >> 17) & 5 | 2) << 17);
            *((_BYTE *)v53 + 4) = BYTE4(v79);
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v25, "birthtime"));
          v80 = objc_claimAutoreleasedReturnValue();
          v81 = (int)*MEMORY[0x24BE176D0];
          v82 = *(Class *)((char *)&v42->super.super.isa + v81);
          *(Class *)((char *)&v42->super.super.isa + v81) = (Class)v80;

          if (objc_msgSend(v7, "isInTrashScope"))
          {
            objc_msgSend(v7, "parentItemOnFS");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v83, "isAppLibraryTrashFolder");
            v85 = 0x10000;
            if (!v84)
              v85 = 0;
            v86 = *v53 & 0xFFFEFFFF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
            *v53 = *v53 & 0xFFFEFFFF | v85;
            *((_BYTE *)v53 + 4) = BYTE4(v86);

          }
          else
          {
            v87 = *v53;
            v88 = v87 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
            *v53 = v87 & 0xFFFEFFFF;
            *((_BYTE *)v53 + 4) = BYTE4(v88);
          }
          v89 = objc_msgSend(v25, "lastUsedTime");
          if (v89)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v25, "lastUsedTime"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v90 = 0;
          }
          objc_storeStrong((id *)((char *)&v42->super.super.isa + (int)*MEMORY[0x24BE17730]), v90);
          if (v89)

          v91 = objc_msgSend(v25, "favoriteRank");
          if (v91)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v25, "favoriteRank"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v92 = 0;
          }
          objc_storeStrong((id *)((char *)&v42->super.super.isa + (int)*MEMORY[0x24BE17710]), v92);
          if (v91)

          objc_msgSend(v7, "extendedAttributes");
          v93 = objc_claimAutoreleasedReturnValue();
          v94 = (void **)((char *)&v42->super.super.isa + (int)*MEMORY[0x24BE17798]);
          v95 = *v94;
          location = v94;
          *v94 = (void *)v93;

          objc_msgSend(v25, "creatorRowID");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "integerValue");

          if (v97)
          {
            objc_msgSend(v25, "creatorRowID");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "db");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            +[BRCAccountSessionFPFS nameComponentsForKey:db:](BRCAccountSessionFPFS, "nameComponentsForKey:db:", v98, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = v331;
            -[BRCNotification setAttribute:forKey:](v42, "setAttribute:forKey:", v100, *MEMORY[0x24BE178D0]);

          }
          else
          {
            -[BRCNotification setAttribute:forKey:](v42, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE178C8]);
          }
          v101 = objc_msgSend(v7, "uploadStatus");
          v102 = *v53 & 0xFFFFFFF3 | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
          *v53 = *v53 & 0xFFFFFFF3 | (4 * (v101 & 3));
          *((_BYTE *)v53 + 4) = BYTE4(v102);
          objc_msgSend(v7, "clientZone");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v103, "isSharedZone");

          v105 = objc_msgSend(v7, "sharingOptions") & 0x48;
          if (!v104)
          {
            v116 = objc_msgSend(v7, "sharingOptions");
            if (!v105)
            {
              if ((v116 & 1) != 0)
              {
                v134 = objc_msgSend(v7, "sharingOptions");
                v135 = *v53 & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
                v136 = HIDWORD(v135);
                v137 = v53;
                v119 = 0;
                v126 = 0;
                if ((v134 & 2) != 0)
                  v138 = v135 | 0x800;
                else
                  v138 = v135 | 0x1000;
                *((_BYTE *)v137 + 4) = v136;
                *v137 = v138;
              }
              else
              {
                v119 = 0;
                v127 = v53;
                v126 = 0;
                v128 = *v127;
                v129 = v128 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v127 + 4) << 32);
                *v127 = v128 & 0xFFFFC7FF;
                *((_BYTE *)v127 + 4) = BYTE4(v129);
              }
              goto LABEL_97;
            }
            v117 = *v53 & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
            v118 = 2048;
            if ((v116 & 0x10) == 0)
              v118 = 4096;
            *v53 = *v53 & 0xFFFFC7FF | v118;
            *((_BYTE *)v53 + 4) = BYTE4(v117);
            v119 = objc_msgSend(v7, "isDocument");
            goto LABEL_88;
          }
          if (!v105 && (objc_msgSend(v7, "isDead") & 1) == 0)
          {
            brc_bread_crumbs();
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "digestDescription");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "appLibrary");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = objc_msgSend(v7, "sharingOptions");
              objc_msgSend(v7, "sharingOptions");
              BRCPrettyPrintBitmap();
              v111 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v342 = v108;
              v343 = 2112;
              v344 = v109;
              v345 = 2048;
              v346 = v110;
              a4 = v328;
              v347 = 2112;
              v348 = v111;
              v349 = 2112;
              v350 = v106;
              _os_log_impl(&dword_230455000, v107, OS_LOG_TYPE_DEFAULT, "[WARNING] item %@ in shared zone \"%@\" should have share-options set (actual:%lu %@)%@", buf, 0x34u);

              v25 = v330;
              v53 = v331;

            }
          }
          if ((objc_msgSend(v7, "isShareAcceptationFault") & 1) == 0)
          {
            v112 = objc_msgSend(v7, "sharingOptions");
            if ((((objc_msgSend(v7, "sharingOptions") >> 3) ^ (v112 >> 6)) & 1) == 0
              && (objc_msgSend(v7, "isDead") & 1) == 0)
            {
              brc_bread_crumbs();
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, (os_log_type_t)0x90u))
                -[BRCNotification initWithLocalItem:itemDiffs:].cold.2();

            }
          }
          if ((objc_msgSend(v7, "sharingOptions") & 0x20) != 0)
          {
            if (!objc_msgSend(v7, "isKnownByServer"))
              goto LABEL_85;
            v115 = 6144;
            v53 = v331;
          }
          else
          {
            v115 = 0x2000;
          }
          v120 = *v53;
          v121 = v120 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
          *v53 = v120 & 0xFFFFC7FF | v115;
          *((_BYTE *)v53 + 4) = BYTE4(v121);
          objc_msgSend(v7, "ownerKey");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "db");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCAccountSessionFPFS nameComponentsForKey:db:](BRCAccountSessionFPFS, "nameComponentsForKey:db:", v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();

          -[BRCNotification setAttribute:forKey:](v332, "setAttribute:forKey:", v124, *MEMORY[0x24BE178E0]);
LABEL_85:
          v119 = objc_msgSend(v7, "isDocument");
          if (objc_msgSend(v7, "isSharedToMeTopLevelItem"))
          {
            if (*location)
              v125 = (void *)objc_msgSend(*location, "mutableCopy");
            else
              v125 = (void *)objc_opt_new();
            v130 = v125;
            v131 = v125;

            objc_msgSend(v7, "bookmarkData");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "dataUsingEncoding:", 4);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "setObject:forKeyedSubscript:", v133, CFSTR("com.apple.clouddocs.private.share-bookmark#B"));

            objc_storeStrong(location, v130);
            v126 = 1;
            a4 = v328;
            v25 = v330;
            goto LABEL_97;
          }
LABEL_88:
          v126 = 1;
LABEL_97:
          if (objc_msgSend(v7, "isShared") && (objc_msgSend(v7, "sharingOptions") & 4) != 0)
          {
            objc_msgSend(v7, "collaborationIdentifierIfComputable");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = 1;
          }
          else
          {
            v139 = 0;
            v140 = 0;
          }
          objc_storeStrong((id *)((char *)&v332->super.super.isa + (int)*MEMORY[0x24BE176E0]), v140);
          if (v139)

          if (v126)
          {
            v141 = objc_msgSend(v7, "sharingOptions");
            v142 = *v331;
            *((_BYTE *)v331 + 4) = (v142 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32)) >> 32;
            *v331 = (v142 & 0xFFDFFFFF | ((v141 & 4) << 19)) ^ 0x200000;
          }
          v8 = v332;
          if (v119)
          {
            objc_msgSend(v7, "asDocument");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "currentVersion");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "lastEditorRowID");
            v145 = (void *)objc_claimAutoreleasedReturnValue();

            v146 = objc_msgSend(v145, "br_isEqualToNumber:", &unk_24FEB31E8);
            v147 = (uint64_t *)MEMORY[0x24BE178D8];
            if (v146)
            {
              v8 = v332;
              -[BRCNotification setAttribute:forKey:](v332, "setAttribute:forKey:", 0, *MEMORY[0x24BE178D8]);
            }
            else
            {
              objc_msgSend(v143, "currentVersion");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "lastEditorRowID");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "db");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              +[BRCAccountSessionFPFS nameComponentsForKey:db:](BRCAccountSessionFPFS, "nameComponentsForKey:db:", v149, v150);
              v151 = (void *)objc_claimAutoreleasedReturnValue();

              a4 = v328;
              v25 = v330;
              v152 = *v147;
              v8 = v332;
              -[BRCNotification setAttribute:forKey:](v332, "setAttribute:forKey:", v151, v152);

            }
          }
          if ((objc_msgSend(v7, "isInTrashScope") & 1) != 0)
          {
            objc_msgSend(v7, "st");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "logicalName");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v154, "length"))
            {
              objc_msgSend(v7, "st");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "logicalName");
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = objc_msgSend(v156, "characterAtIndex:", 0) == 46;
              v158 = *v331 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              *v331 = *v331 & 0xFBFFFFFF | (v157 << 26);
              *((_BYTE *)v331 + 4) = BYTE4(v158);

              v25 = v330;
              v159 = v331;
            }
            else
            {
              v159 = v331;
              v167 = *v331;
              v168 = v167 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              *v331 = v167 & 0xFBFFFFFF;
              *((_BYTE *)v331 + 4) = BYTE4(v168);
            }

LABEL_123:
            if (objc_msgSend(v7, "isDocument"))
            {
              objc_msgSend(v7, "asDocument");
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "currentVersion");
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "st");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = objc_msgSend(v171, "isHiddenExt");
              v173 = 0x4000;
              if (!v172)
                v173 = 0;
              v174 = *v159 & 0xFFFFBFFF | ((unint64_t)*((unsigned __int8 *)v159 + 4) << 32);
              *v159 = *v159 & 0xFFFFBFFF | v173;
              *((_BYTE *)v159 + 4) = BYTE4(v174);

              if (v170)
              {
                objc_msgSend(v170, "editedSinceShared");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                v176 = objc_msgSend(v175, "BOOLValue");
                v177 = 0x1000000;
                if (!v176)
                  v177 = 0;
                v178 = *v159 & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)v159 + 4) << 32);
                *v159 = *v159 & 0xFEFFFFFF | v177;
                *((_BYTE *)v159 + 4) = BYTE4(v178);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v170, "size"));
                v179 = objc_claimAutoreleasedReturnValue();
                v180 = (int)*MEMORY[0x24BE17780];
                v181 = *(Class *)((char *)&v8->super.super.isa + v180);
                *(Class *)((char *)&v8->super.super.isa + v180) = (Class)v179;

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v170, "mtime"));
                v182 = objc_claimAutoreleasedReturnValue();
                v183 = (int)*MEMORY[0x24BE17748];
                v184 = *(Class *)((char *)&v8->super.super.isa + v183);
                *(Class *)((char *)&v8->super.super.isa + v183) = (Class)v182;

              }
              v326 = v169;
              if (objc_msgSend(v7, "isFinderBookmark"))
              {
                v185 = 3;
              }
              else if (objc_msgSend(v170, "isPackage"))
              {
                v185 = 2;
              }
              else
              {
                v185 = 1;
              }
              *((_BYTE *)v159 + 5) = v185;
              v225 = objc_alloc(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v170, "conflictLoserEtags");
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              obj = (id)objc_msgSend(v225, "initWithCapacity:", objc_msgSend(v226, "count"));

              objc_msgSend(v326, "resolvedConflictLoserEtags");
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v335 = 0u;
              v336 = 0u;
              v337 = 0u;
              v338 = 0u;
              v323 = v170;
              objc_msgSend(v170, "conflictLoserEtags");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              v229 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v335, v340, 16);
              if (v229)
              {
                v230 = v229;
                v231 = *(_QWORD *)v336;
                do
                {
                  for (i = 0; i != v230; ++i)
                  {
                    if (*(_QWORD *)v336 != v231)
                      objc_enumerationMutation(v228);
                    v233 = *(_QWORD *)(*((_QWORD *)&v335 + 1) + 8 * i);
                    if ((objc_msgSend(v227, "containsObject:", v233) & 1) == 0)
                    {
                      v234 = -[BRFieldContentSignature initWithLoserEtag:]([BRFieldContentSignature alloc], "initWithLoserEtag:", v233);
                      v235 = objc_alloc(MEMORY[0x24BDC83D8]);
                      -[BRFieldContentSignature data](v234, "data");
                      v236 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDBCE50], "data");
                      v237 = (void *)objc_claimAutoreleasedReturnValue();
                      v238 = (void *)objc_msgSend(v235, "initWithContentVersion:metadataVersion:", v236, v237);
                      objc_msgSend(obj, "addObject:", v238);

                    }
                  }
                  v230 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v335, v340, 16);
                }
                while (v230);
              }

              v8 = v332;
              v239 = (id *)((char *)&v332->super.super.isa + (int)*MEMORY[0x24BE176E8]);
              objc_storeStrong(v239, obj);
              v240 = objc_msgSend(*v239, "count") != 0;
              v241 = v331;
              v242 = *v331;
              v243 = v242 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              *v331 = v242 & 0xFFFFFFBF | (v240 << 6);
              *((_BYTE *)v331 + 4) = BYTE4(v243);
              if (objc_msgSend(v7, "isDocument")
                && (*v331 & 0x40) != 0
                && objc_msgSend(v7, "isIWorkItem"))
              {
                objc_msgSend(v7, "asDocument");
                v244 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v244, "currentVersion");
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "db");
                v246 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v245, "lastEditorDeviceDisplayNameWithDB:", v246);
                v247 = objc_claimAutoreleasedReturnValue();
                v248 = (int)*MEMORY[0x24BE17728];
                v249 = *(Class *)((char *)&v332->super.super.isa + v248);
                *(Class *)((char *)&v332->super.super.isa + v248) = (Class)v247;

                v241 = v331;
              }
              v250 = v326;
              a4 = v328;
              if ((objc_msgSend(v326, "isDead") & 1) == 0)
              {
                objc_msgSend(v325, "fsUploader");
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                v252 = objc_msgSend(v251, "isUploadingItem:", v326);
                v253 = 256;
                if (!v252)
                  v253 = 0;
                v254 = *v241 & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)v241 + 4) << 32);
                *v241 = *v241 & 0xFFFFFEFF | v253;
                *((_BYTE *)v241 + 4) = BYTE4(v254);

                v250 = v326;
              }
              *v241 = *v241 & 0xFFFFFFFC | objc_msgSend(v250, "downloadStatus") & 3;
              objc_msgSend(v250, "uploadError");
              v255 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v255, "brc_wrappedError");
              v188 = (void *)objc_claimAutoreleasedReturnValue();

              v189 = v326;
              v256 = objc_msgSend(v326, "isEvictable");
              v257 = 0x10000000;
              if (!v256)
                v257 = 0;
              v258 = *v241 & 0xEFFFFFFF | ((unint64_t)*((unsigned __int8 *)v241 + 4) << 32);
              *v241 = *v241 & 0xEFFFFFFF | v257;
              *((_BYTE *)v241 + 4) = BYTE4(v258);

              v25 = v330;
            }
            else if (objc_msgSend(v7, "isDirectory"))
            {
              objc_msgSend(v7, "syncUpError");
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v186, "brc_wrappedError");
              v187 = v159;
              v188 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "asDirectory");
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              *((_BYTE *)v187 + 5) = 0;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v189, "mtime"));
              v190 = objc_claimAutoreleasedReturnValue();
              v191 = (int)*MEMORY[0x24BE17748];
              v192 = *(Class *)((char *)&v8->super.super.isa + v191);
              *(Class *)((char *)&v8->super.super.isa + v191) = (Class)v190;

              v193 = objc_msgSend(v189, "isSharedByMeOrContainsSharedByMeItem");
              v194 = 0x800000;
              if (!v193)
                v194 = 0;
              v195 = *v187 & 0xFF7FFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              *v187 = *v187 & 0xFF7FFFFF | v194;
              *((_BYTE *)v187 + 4) = BYTE4(v195);
              v196 = objc_msgSend(v189, "isSharedToMeOrContainsSharedToMeItem");
              v197 = 0x400000;
              if (!v196)
                v197 = 0;
              v198 = *v187 & 0xFFBFFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              *v187 = *v187 & 0xFFBFFFFF | v197;
              *((_BYTE *)v187 + 4) = BYTE4(v198);
              v199 = objc_msgSend(v189, "isAppLibraryTrashFolder");
              v200 = 0x40000000;
              if (!v199)
                v200 = 0;
              v201 = *v187 & 0xBFFFFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              *v187 = *v187 & 0xBFFFFFFF | v200;
              *((_BYTE *)v187 + 4) = BYTE4(v201);
              objc_msgSend(v7, "itemID");
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              v203 = objc_msgSend(v202, "isNonDesktopRoot");
              v204 = 0x80000000;
              if (!v203)
                v204 = 0;
              v205 = *v187 & 0x7FFFFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              *v187 = *v187 & 0x7FFFFFFF | v204;
              *((_BYTE *)v187 + 4) = BYTE4(v205);

              objc_msgSend(v7, "itemID");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              v207 = objc_msgSend(v206, "isDocumentsFolder");
              v208 = 0x100000000;
              if (!v207)
                v208 = 0;
              v209 = (*v187 | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
              *v187 = *v187;
              *((_BYTE *)v187 + 4) = (v209 | v208) >> 32;

              if (objc_msgSend(v189, "isDirectoryFault"))
              {
                objc_msgSend(v189, "serverQuotaUsage");
                v210 = objc_claimAutoreleasedReturnValue();
                v211 = (int)*MEMORY[0x24BE17780];
                v212 = *(Class *)((char *)&v8->super.super.isa + v211);
                *(Class *)((char *)&v8->super.super.isa + v211) = (Class)v210;

              }
              objc_msgSend(v7, "asDirectory");
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v213, "childItemCount");
              v214 = objc_claimAutoreleasedReturnValue();
              v215 = (int)*MEMORY[0x24BE176D8];
              v216 = *(Class *)((char *)&v8->super.super.isa + v215);
              *(Class *)((char *)&v8->super.super.isa + v215) = (Class)v214;

              *v331 |= 3u;
            }
            else
            {
              if (!objc_msgSend(v7, "isSymLink"))
              {
                v188 = 0;
LABEL_172:
                objc_msgSend(v25, "parentID");
                v259 = (void *)objc_claimAutoreleasedReturnValue();
                v260 = objc_msgSend(v259, "isNonDesktopRoot");

                if (v260)
                  *v331 |= 0x8000000u;
                if (v188)
                {
                  objc_msgSend(v188, "br_fileProviderError");
                  v261 = (void *)objc_claimAutoreleasedReturnValue();

                  -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v261, *MEMORY[0x24BE178F8]);
                }
                if ((a4 & 0x100000000) != 0)
                {
                  objc_msgSend(v7, "orig");
                  v262 = (void *)objc_claimAutoreleasedReturnValue();
                  v263 = objc_msgSend(v262, "isLost");

                  if (v263)
                    *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17700]) |= 0x4000u;
                }
                -[BRCNotification parentItemIdentifier](v8, "parentItemIdentifier");
                v264 = (void *)objc_claimAutoreleasedReturnValue();
                v265 = (void *)objc_msgSend(v264, "isEqualToString:", *MEMORY[0x24BDC8230]);

                v266 = 288;
                if ((_DWORD)v265)
                {
                  if (*location)
                    v267 = (void *)objc_msgSend(*location, "mutableCopy");
                  else
                    v267 = (void *)objc_opt_new();
                  obja = v267;
                  v268 = v267;

                  objc_msgSend(v7, "serverZone");
                  v269 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v269, "dbRowID");
                  v270 = (void *)objc_claimAutoreleasedReturnValue();
                  -[BRCItemGlobalID zoneRowID](v8->_parentGlobalID, "zoneRowID");
                  v271 = (void *)objc_claimAutoreleasedReturnValue();
                  v272 = objc_msgSend(v270, "br_isEqualToNumber:", v271);

                  if ((v272 & 1) == 0)
                  {
                    brc_bread_crumbs();
                    v319 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v320 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v320, OS_LOG_TYPE_FAULT))
                      -[BRCNotification initWithLocalItem:itemDiffs:].cold.1();

                  }
                  -[BRCItemGlobalID itemID](v8->_parentGlobalID, "itemID");
                  v273 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v273, "itemIDString");
                  v274 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "serverZone");
                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                  +[BRCLocalItem bookmarkDataWithItemResolutionString:serverZone:](BRCLocalItem, "bookmarkDataWithItemResolutionString:serverZone:", v274, v275);
                  v276 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v276, "dataUsingEncoding:", 4);
                  v277 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v268, "setObject:forKeyedSubscript:", v277, CFSTR("com.apple.clouddocs.private.trash-parent-bookmark#B"));

                  objc_msgSend(v7, "clientZone");
                  v278 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "st");
                  v279 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v279, "trashPutBackParentID");
                  v280 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "db");
                  v281 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v278, "itemByItemID:db:", v280, v281);
                  v266 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v266, "asDirectory");
                  v265 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v265)
                  {
                    objc_msgSend(v265, "fileObjectID");
                    v282 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v282, "asString");
                    v266 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v266, "dataUsingEncoding:", 4);
                    v283 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v268, "setObject:forKeyedSubscript:", v283, CFSTR("com.apple.fileprovider.trash-put-back#PN"));

                  }
                  objc_storeStrong(location, obja);

                  a4 = v328;
                }
                if (objc_msgSend(v7, "isDocument"))
                {
                  v284 = [BRFieldContentSignature alloc];
                  objc_msgSend(v7, "asDocument");
                  v265 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v265, "currentVersion");
                  v285 = (void *)objc_claimAutoreleasedReturnValue();
                  v286 = -[BRFieldContentSignature initWithLocalVersion:](v284, "initWithLocalVersion:", v285);

                  -[BRFieldContentSignature data](v286, "data");
                  v287 = objc_claimAutoreleasedReturnValue();
                  v288 = (int)*MEMORY[0x24BE176F8];
                  v289 = *(Class *)((char *)&v8->super.super.isa + v288);
                  *(Class *)((char *)&v8->super.super.isa + v288) = (Class)v287;

                  -[BRFieldContentSignature equivalentVersions](v286, "equivalentVersions");
                  v290 = objc_claimAutoreleasedReturnValue();
                  v291 = (int)*MEMORY[0x24BE17708];
                  v292 = *(Class *)((char *)&v8->super.super.isa + v291);
                  *(Class *)((char *)&v8->super.super.isa + v291) = (Class)v290;

                }
                else
                {
                  v293 = objc_opt_new();
                  v294 = (int)*MEMORY[0x24BE176F8];
                  v286 = *(BRFieldContentSignature **)((char *)&v8->super.super.isa + v294);
                  *(Class *)((char *)&v8->super.super.isa + v294) = (Class)v293;
                }

                v295 = objc_msgSend(v7, "isZoneRoot");
                if ((v295 & 1) != 0)
                {
                  v296 = 0;
                }
                else
                {
                  v297 = [BRFieldStructureSignature alloc];
                  objc_msgSend(v7, "st");
                  v265 = (void *)objc_claimAutoreleasedReturnValue();
                  v266 = -[BRFieldStructureSignature initWithLocalStatInfo:](v297, "initWithLocalStatInfo:", v265);
                  objc_msgSend((id)v266, "data");
                  v296 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17788]), v296);
                if ((v295 & 1) == 0)
                {

                }
                +[BRCQueryItemUtil sharedQueryItemUtil](BRCQueryItemUtil, "sharedQueryItemUtil");
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                +[BRCQueryItemInfo queryItemInfoForItem:](BRCQueryItemInfo, "queryItemInfoForItem:", v7);
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                v300 = v325;
                v301 = objc_msgSend(v298, "contentPolicyForItemInfo:sessionContext:", v299, v325);
                *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE176F0]) = (Class)v301;

                if (objc_msgSend(v7, "isZoneRoot")
                  && (objc_msgSend(v7, "clientZone"),
                      v302 = (void *)objc_claimAutoreleasedReturnValue(),
                      v303 = objc_msgSend(v302, "isCloudDocsZone"),
                      v302,
                      (v303 & 1) == 0))
                {
                  objc_msgSend(v325, "cloudDocsClientZone");
                  v305 = (void *)objc_claimAutoreleasedReturnValue();
                  v304 = v330;
                  if (v305)
                    goto LABEL_202;
                }
                else
                {
                  v304 = v330;
                  if (objc_msgSend(v7, "isSharedToMeTopLevelItem"))
                  {
                    objc_msgSend(v7, "parentClientZone");
                    v305 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v305)
                      goto LABEL_206;
LABEL_202:
                    if (objc_msgSend(v7, "isDirectory"))
                    {
                      objc_msgSend(v7, "clientZone");
                      v306 = (void *)objc_claimAutoreleasedReturnValue();
                      v307 = objc_msgSend(v306, "enhancedDrivePrivacyEnabled");
                      v308 = objc_msgSend(v305, "enhancedDrivePrivacyEnabled");

                      if (v307 != v308)
                        *((_BYTE *)v331 + 4) = (*v331 | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32) | 0x400000000) >> 32;
                      v300 = v325;
                    }
                    goto LABEL_206;
                  }
                  v305 = 0;
                }
LABEL_206:
                if ((a4 & 0x20) != 0)
                  *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17700]) |= 0x10u;
                if ((a4 & 0x1000000040) != 0)
                  *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x24BE17700]) |= 0x20u;

                goto LABEL_211;
              }
              objc_msgSend(v7, "syncUpError");
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v217, "brc_wrappedError");
              v188 = (void *)objc_claimAutoreleasedReturnValue();

              *((_BYTE *)v331 + 5) = 4;
              *v331 |= 3u;
              objc_msgSend(v7, "asSymlink");
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v218, "symlinkTarget");
              v219 = objc_claimAutoreleasedReturnValue();
              v220 = (int)*MEMORY[0x24BE17790];
              v221 = *(Class *)((char *)&v332->super.super.isa + v220);
              *(Class *)((char *)&v332->super.super.isa + v220) = (Class)v219;

              objc_storeStrong((id *)((char *)&v332->super.super.isa + (int)*MEMORY[0x24BE17748]), *(id *)((char *)&v332->super.super.isa + v81));
              v222 = *(Class *)((char *)&v332->super.super.isa + v220);
              v8 = v332;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v222, "lengthOfBytesUsingEncoding:", 4));
              v223 = objc_claimAutoreleasedReturnValue();
              v224 = (int)*MEMORY[0x24BE17780];
              v189 = *(Class *)((char *)&v332->super.super.isa + v224);
              *(Class *)((char *)&v332->super.super.isa + v224) = (Class)v223;
            }

            goto LABEL_172;
          }
          objc_msgSend(v7, "appLibrary");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v331;
          if (objc_msgSend(v160, "isDocumentScopePublic"))
          {
            v161 = objc_msgSend(v7, "isInDataScope");

            if ((v161 & 1) == 0)
            {
              v162 = objc_msgSend(v7, "isUserVisible");
              v163 = 0x4000000;
              if (v162)
                v163 = 0;
              v164 = *v331 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              *v331 = *v331 & 0xFBFFFFFF | v163;
              v165 = HIDWORD(v164);
              goto LABEL_120;
            }
          }
          else
          {

          }
          v166 = *v331 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32) | 0x200000000;
          *v331 &= ~0x4000000u;
          v165 = HIDWORD(v166);
LABEL_120:
          *((_BYTE *)v331 + 4) = v165;
          goto LABEL_123;
        }
      }
      else
      {

        v42 = v332;
        v43 = v329;
      }
      -[BRCAppLibrary appLibraryID](v38, "appLibraryID");
      v45 = objc_claimAutoreleasedReturnValue();
      p_isa = v42->_oldAppLibraryID;
      v42->_oldAppLibraryID = (NSString *)v45;
    }

    goto LABEL_22;
  }
LABEL_211:
  v309 = v8;

  return v309;
}

- (id)initRootContainerNotificationWithSessionContext:(id)a3
{
  id v4;
  BRCNotification *v5;
  BRCNotification *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCNotification;
  v5 = -[BRCNotification init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (int)*MEMORY[0x24BE17740];
    v8 = *(Class *)((char *)&v5->super.super.isa + v7);
    *(Class *)((char *)&v5->super.super.isa + v7) = (Class)CFSTR(".rootContainerItemNotification");

    objc_msgSend(MEMORY[0x24BE17628], "fileObjectIDWithString:", *MEMORY[0x24BDC8228]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (int)*MEMORY[0x24BE17718];
    v11 = *(Class *)((char *)&v6->super.super.isa + v10);
    *(Class *)((char *)&v6->super.super.isa + v10) = (Class)v9;

    v12 = (int)*MEMORY[0x24BE17750];
    v13 = *(Class *)((char *)&v6->super.super.isa + v12);
    *(Class *)((char *)&v6->super.super.isa + v12) = 0;

    +[BRCQueryItemUtil sharedQueryItemUtil](BRCQueryItemUtil, "sharedQueryItemUtil");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contentPolicyForRootContainerWithSessionContext:", v4);
    *(Class *)((char *)&v6->super.super.isa + (int)*MEMORY[0x24BE176F0]) = (Class)v15;

  }
  return v6;
}

- (void)markAsLoserVersionWithEtag:(id)a3 modificationDate:(id)a4 editorNameComponents:(id)a5 lastEditorDeviceName:(id)a6 size:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  BRFieldContentSignature *v18;
  objc_class *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (int)*MEMORY[0x24BE176E8];
  v16 = *(Class *)((char *)&self->super.super.isa + v15);
  *(Class *)((char *)&self->super.super.isa + v15) = 0;
  v17 = a3;

  v18 = -[BRFieldContentSignature initWithLoserEtag:]([BRFieldContentSignature alloc], "initWithLoserEtag:", v17);
  -[BRFieldContentSignature data](v18, "data");
  v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v20 = (int)*MEMORY[0x24BE176F8];
  v21 = *(Class *)((char *)&self->super.super.isa + v20);
  *(Class *)((char *)&self->super.super.isa + v20) = v19;

  if (v26)
  {
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v26, "timeIntervalSince1970");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v24 = (int)*MEMORY[0x24BE17748];
    v25 = *(Class *)((char *)&self->super.super.isa + v24);
    *(Class *)((char *)&self->super.super.isa + v24) = v23;

  }
  if (v12)
    -[BRCNotification setAttribute:forKey:](self, "setAttribute:forKey:", v12, *MEMORY[0x24BDD10C0]);
  objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE17728]), a6);
  if (v14)
    objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE17780]), a7);

}

+ (id)notificationGatheredFromItem:(id)a3
{
  id result;

  result = (id)objc_msgSend(a1, "notificationFromItem:", a3);
  if (result)
    *(_WORD *)((char *)result + (int)*MEMORY[0x24BE17700]) |= 0x8000u;
  return result;
}

+ (id)notificationFromItem:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  BRCNotification *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isBRAlias"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[BRCNotification notificationFromItem:].cold.1();

    v6 = 0;
  }
  else
  {
    v6 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", v3, 0);
  }

  return v6;
}

- (void)setNumberAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "longLongValue"))
    v7 = v8;
  else
    v7 = 0;
  -[BRCNotification setAttribute:forKey:](self, "setAttribute:forKey:", v7, v6);

}

- (id)notificationByStrippingSharingInfoIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v3 = (int)*MEMORY[0x24BE176C8];
  v4 = *MEMORY[0x24BE178E0];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "objectForKey:", *MEMORY[0x24BE178E0]);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x24BE178D8];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "objectForKey:", *MEMORY[0x24BE178D8]);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7 | v5)
  {
    v8 = (char *)-[BRCNotification copy](self, "copy");
    objc_msgSend(*(id *)&v8[v3], "removeObjectForKey:", v4);
    objc_msgSend(*(id *)&v8[v3], "removeObjectForKey:", v6);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)canMerge:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (-[BRCItemGlobalID isEqualToItemGlobalID:](self->_itemGlobalID, "isEqualToItemGlobalID:", v4[40]))
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE17718]), "isEqualToFileObjectID:", *(_QWORD *)((char *)v4 + (int)*MEMORY[0x24BE17718]));
  else
    v5 = 0;

  return v5;
}

- (void)merge:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  NSSet *v7;
  NSSet *parentGlobalIDs;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCNotification;
  -[BRCNotification merge:](&v10, sel_merge_, v4);
  if (objc_msgSend(*((id *)v4 + 41), "count"))
  {
    v5 = -[NSSet count](self->_parentGlobalIDs, "count");
    v6 = (void *)*((_QWORD *)v4 + 41);
    if (v5)
    {
      v7 = (NSSet *)objc_msgSend(v6, "mutableCopy");
      -[NSSet unionSet:](v7, "unionSet:", self->_parentGlobalIDs);
    }
    else
    {
      v7 = v6;
    }
    parentGlobalIDs = self->_parentGlobalIDs;
    self->_parentGlobalIDs = v7;

  }
  v9 = (void *)*((_QWORD *)v4 + 42);
  if (v9)
    objc_storeStrong((id *)&self->_oldAppLibraryID, v9);

}

- (void)generateLogicalExtension:(id)a3 physicalExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCNotification *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int16 v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27[3];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  BRCNotification *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCNotification generateLogicalExtension:physicalExtension:]", 841, v27);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v29 = v27[0];
    v30 = 2112;
    v31 = self;
    v32 = 2112;
    v33 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx generating sandbox extensions for %@%@", buf, 0x20u);
  }

  v10 = self;
  objc_sync_enter(v10);
  v11 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x24BE17758]);
  v12 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x24BE17770]);
  v13 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x24BE17740]);
  v14 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x24BE17718]);
  v15 = *(_WORD *)((char *)&v10->super.super.isa + (int)*MEMORY[0x24BE17700]);
  objc_sync_exit(v10);

  v16 = -[BRCNotification isDead](v10, "isDead");
  if (v11)
    v17 = v16;
  else
    v17 = 1;
  if ((v17 & 1) == 0 && (v15 & 0xC030) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
    {
      objc_msgSend(v18, "URLByAppendingPathComponent:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _issueReadWriteSandboxExtensionForURL(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, v14);
      goto LABEL_23;
    }
    if (v13)
    {
      objc_msgSend(v18, "URLByAppendingPathComponent:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _issueReadWriteSandboxExtensionForURL(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v14);
      if (v12)
      {
LABEL_14:
        if ((objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
        {
          brc_bread_crumbs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            -[BRCNotification generateLogicalExtension:physicalExtension:].cold.1();

        }
        objc_msgSend(v18, "URLByAppendingPathComponent:", v12, v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        _issueReadWriteSandboxExtensionForURL(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v14);
        goto LABEL_23;
      }
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCNotification generateLogicalExtension:physicalExtension:].cold.2();

      v19 = 0;
      v20 = 0;
      if (v12)
        goto LABEL_14;
    }
    v21 = v19;
    v22 = v20;
LABEL_23:

  }
  __brc_leave_section(v27);

}

- (BOOL)isDocumentsFolder
{
  void *v2;
  void *v3;
  char v4;

  -[BRCNotification itemGlobalID](self, "itemGlobalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDocumentsFolder");

  return v4;
}

- (BRCItemGlobalID)itemGlobalID
{
  return self->_itemGlobalID;
}

- (BRCItemGlobalID)parentGlobalID
{
  return self->_parentGlobalID;
}

- (BRFileObjectID)oldParentFileObjectID
{
  return self->_oldParentFileObjectID;
}

- (NSSet)parentGlobalIDs
{
  return self->_parentGlobalIDs;
}

- (void)setParentGlobalIDs:(id)a3
{
  objc_storeStrong((id *)&self->_parentGlobalIDs, a3);
}

- (BRCAppLibrary)appLibrary
{
  return self->_appLibrary;
}

- (NSString)oldAppLibraryID
{
  return self->_oldAppLibraryID;
}

- (NSString)aliasSourceAppLibraryID
{
  return self->_aliasSourceAppLibraryID;
}

- (BOOL)isInDocumentScope
{
  return self->_isInDocumentScope;
}

- (BOOL)isInDataScope
{
  return self->_isInDataScope;
}

- (BOOL)isInTrashScope
{
  return self->_isInTrashScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAppLibraryID, 0);
  objc_storeStrong((id *)&self->_parentGlobalIDs, 0);
  objc_storeStrong((id *)&self->_itemGlobalID, 0);
  objc_storeStrong((id *)&self->_aliasSourceAppLibraryID, 0);
  objc_storeStrong((id *)&self->_oldParentFileObjectID, 0);
  objc_storeStrong((id *)&self->_parentGlobalID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
}

- (void)initWithLocalItem:itemDiffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [item.serverZone.dbRowID br_isEqualToNumber:_parentGlobalID.zoneRowID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithLocalItem:itemDiffs:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] item has both or neither a public and private share %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)initWithLocalItem:itemDiffs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: finderTags.tagsCount > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithLocalItem:itemDiffs:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _fileObjectID.type != BRFileObjectIDTypeDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithLocalItem:itemDiffs:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: shareRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithLocalItem:itemDiffs:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _logicalName != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithLocalItem:itemDiffs:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !item.isBRAlias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)notificationFromItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't create notification from alias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)generateLogicalExtension:physicalExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: physicalName.br_isSideFaultName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)generateLogicalExtension:physicalExtension:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: logicalName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
