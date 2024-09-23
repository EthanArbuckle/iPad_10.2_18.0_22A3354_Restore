@implementation PUSidebarDataController

- (id)makeSectionManagers
{
  void *v3;
  void *v4;
  char v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void (**v16)(void *, const char *, _QWORD *);
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(void *, const char *, void *, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t v67;
  NSObject *v68;
  NSObject *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  os_signpost_id_t v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  os_signpost_id_t v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  os_signpost_id_t v93;
  NSObject *v94;
  NSObject *v95;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  NSObject *v99;
  os_signpost_id_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  NSObject *v106;
  NSObject *v107;
  os_signpost_id_t v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  os_signpost_id_t v118;
  NSObject *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  NSObject *v125;
  NSObject *v126;
  os_signpost_id_t v127;
  NSObject *v128;
  NSObject *v129;
  void *v130;
  NSObject *v131;
  NSObject *v132;
  os_signpost_id_t v133;
  NSObject *v134;
  NSObject *v135;
  uint64_t v136;
  void *v137;
  NSObject *v138;
  NSObject *v139;
  os_signpost_id_t v140;
  NSObject *v141;
  NSObject *v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  NSObject *v148;
  NSObject *v149;
  os_signpost_id_t v150;
  NSObject *v151;
  NSObject *v152;
  void *v153;
  NSObject *v154;
  NSObject *v155;
  os_signpost_id_t v156;
  NSObject *v157;
  NSObject *v158;
  void *v159;
  NSObject *v160;
  NSObject *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  os_signpost_id_t v166;
  NSObject *v167;
  NSObject *v168;
  void *v169;
  NSObject *v170;
  NSObject *v171;
  uint64_t v172;
  uint64_t v173;
  NSObject *v174;
  NSObject *v175;
  void *v177;
  objc_class *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  objc_class *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  os_signpost_id_t spid;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  NSObject *v199;
  void *v200;
  void (**v202)(void *, const char *, uint64_t, _QWORD *);
  void *v203;
  unint64_t v204;
  NSObject *v205;
  unint64_t v206;
  NSObject *v207;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  _QWORD v212[4];
  id v213;
  _QWORD v214[5];
  id v215;
  id v216;
  char v217;
  _QWORD v218[5];
  id v219;
  id v220;
  char v221;
  _QWORD v222[4];
  id v223;
  PUSidebarDataController *v224;
  SEL v225;
  _QWORD v226[5];
  id v227;
  id v228;
  _QWORD v229[4];
  id v230;
  char v231;
  _QWORD v232[5];
  id v233;
  _QWORD v234[4];
  id v235;
  _QWORD v236[4];
  NSObject *v237;
  PUSidebarDataController *v238;
  id v239;
  id v240;
  _QWORD v241[4];
  NSObject *v242;
  PUSidebarDataController *v243;
  id v244;
  id v245;
  _QWORD aBlock[4];
  NSObject *v247;
  id v248;
  uint8_t buf[8];
  _QWORD v250[15];

  v250[13] = *MEMORY[0x1E0C80C00];
  -[PXSidebarDataController photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSidebarDataController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXSidebarDataController options](self, "options");
  v6 = -[PXSidebarDataController options](self, "options");
  objc_msgSend(v3, "px_virtualCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSidebarGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  v206 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PUSidebarDataController.makeSectionManagers", ", buf, 2u);
  }
  spid = v9;

  v210 = v7;
  v211 = v3;
  v207 = v11;
  v204 = v5 & 2;
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke;
    aBlock[3] = &unk_1E58AA8A0;
    v14 = v11;
    v247 = v14;
    v15 = v12;
    v248 = v15;
    v16 = (void (**)(void *, const char *, _QWORD *))_Block_copy(aBlock);
    v241[0] = v13;
    v241[1] = 3221225472;
    v241[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_139;
    v241[3] = &unk_1E58AA8C8;
    v17 = v14;
    v242 = v17;
    v243 = self;
    v18 = v4;
    v244 = v18;
    v19 = v15;
    v245 = v19;
    v202 = (void (**)(void *, const char *, uint64_t, _QWORD *))_Block_copy(v241);
    v236[0] = v13;
    v236[1] = 3221225472;
    v236[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_141;
    v236[3] = &unk_1E58AA8F0;
    v199 = v17;
    v237 = v199;
    v238 = self;
    v20 = v18;
    v239 = v20;
    v208 = v19;
    v240 = v208;
    v21 = (void (**)(void *, const char *, void *, _QWORD))_Block_copy(v236);
    objc_msgSend(v7, "momentsCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "photos", v22, 0);

    -[PXSidebarDataController pickerAllPhotosVirtualCollection](self, "pickerAllPhotosVirtualCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[PXSidebarDataController pickerAllPhotosVirtualCollection](self, "pickerAllPhotosVirtualCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, "all photos", v24, 25);

    }
    v25 = (v6 >> 2) & 1;
    objc_msgSend(v3, "px_assetCollectionForSmartAlbumWithSubtype:", 203);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "favorites", v26, 17);

    objc_msgSend(v210, "eventsCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "events", v27, 13);

    objc_msgSend(v210, "peopleCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "people", v28, 22);

    objc_msgSend(v210, "memoriesCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "memories", v29, 1);

    objc_msgSend(v210, "tripsCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "trips", v30, 12);

    objc_msgSend(v210, "featuredPhotosCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "featured", v31, 15);

    objc_msgSend(v210, "wallpaperSuggestionsCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, "wallpaper", v32, 14);

    v234[0] = v13;
    v234[1] = 3221225472;
    v234[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_153;
    v234[3] = &unk_1E58AA918;
    v33 = v3;
    v235 = v33;
    v202[2](v202, "bookmarks", 16, v234);
    if ((-[PXSidebarDataController options](self, "options") & 4) == 0)
    {
      v232[0] = v13;
      v232[1] = 3221225472;
      v232[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_2;
      v232[3] = &unk_1E58AA940;
      v232[4] = self;
      v233 = v33;
      v16[2](v16, "devices", v232);

    }
    v229[0] = v13;
    v229[1] = 3221225472;
    v229[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_3;
    v229[3] = &unk_1E58AA968;
    v34 = v33;
    v230 = v34;
    v231 = v25;
    v16[2](v16, "utility", v229);
    v226[0] = v13;
    v226[1] = 3221225472;
    v226[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_4;
    v226[3] = &unk_1E58AA990;
    v226[4] = self;
    v35 = v34;
    v227 = v35;
    v36 = v20;
    v228 = v36;
    v16[2](v16, "fromMyMac", v226);
    v222[0] = v13;
    v222[1] = 3221225472;
    v222[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_5;
    v222[3] = &unk_1E58AA9B8;
    v37 = v210;
    v223 = v210;
    v224 = self;
    v225 = a2;
    v16[2](v16, "mediaTypes", v222);
    v218[0] = v13;
    v218[1] = 3221225472;
    v218[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_7;
    v218[3] = &unk_1E58AA9E0;
    v218[4] = self;
    v38 = v35;
    v219 = v38;
    v39 = v36;
    v220 = v39;
    v221 = v204 >> 1;
    v16[2](v16, "myAlbums", v218);
    v214[0] = v13;
    v214[1] = 3221225472;
    v214[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_8;
    v214[3] = &unk_1E58AAA08;
    v214[4] = self;
    v215 = v38;
    v216 = v39;
    v217 = v204 >> 1;
    v16[2](v16, "shared", v214);
    v40 = v199;
    v41 = v40;
    if (v206 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v41, OS_SIGNPOST_INTERVAL_END, spid, "PUSidebarDataController.makeSectionManagers", ", buf, 2u);
    }

    v42 = v208;
    v43 = (void *)objc_msgSend(v208, "copy");

    v44 = v247;
    v45 = v3;
    v46 = v207;
    goto LABEL_119;
  }
  v47 = os_signpost_id_generate(v11);
  v48 = v11;
  v49 = v48;
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "PUSidebarDataController.makeSectionManagers.item", "item=photos", buf, 2u);
  }

  v50 = (void *)objc_opt_class();
  objc_msgSend(v7, "photosCollection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_singleItemDataSourceManagerForCollection:context:", v51, v4);
  v52 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "enablementProvider");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = (void *)v52;
  objc_msgSend(v53, "configureEnablementOfSectionManager:enablementItem:", v52, 0);

  v54 = v49;
  v55 = v54;
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v55, OS_SIGNPOST_INTERVAL_END, v47, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v56 = os_signpost_id_generate(v55);
  v57 = v55;
  v58 = v57;
  if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PUSidebarDataController.makeSectionManagers.item", "item=allPhotos", buf, 2u);
  }

  v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B628]), "initWithCollection:context:", 0, v4);
  -[PXSidebarDataController pickerAllPhotosVirtualCollection](self, "pickerAllPhotosVirtualCollection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    v61 = objc_alloc(MEMORY[0x1E0D7B5F8]);
    -[PXSidebarDataController pickerAllPhotosVirtualCollection](self, "pickerAllPhotosVirtualCollection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v61, "initWithAssetCollection:itemCount:", v62, 0x7FFFFFFFFFFFFFFFLL);
    -[NSObject setOutlineObject:](v59, "setOutlineObject:", v63);

  }
  objc_msgSend(v4, "enablementProvider");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "configureEnablementOfSectionManager:enablementItem:", v59, 25);

  v65 = v58;
  v66 = v65;
  if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v66, OS_SIGNPOST_INTERVAL_END, v56, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v67 = os_signpost_id_generate(v66);
  v68 = v66;
  v69 = v68;
  if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v69, OS_SIGNPOST_INTERVAL_BEGIN, v67, "PUSidebarDataController.makeSectionManagers.item", "item=forYou", buf, 2u);
  }

  v70 = objc_alloc(MEMORY[0x1E0D7B5F8]);
  objc_msgSend(v7, "forYouCollection");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v70, "initWithAssetCollection:itemCount:", v71, 0x7FFFFFFFFFFFFFFFLL);

  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B5F0]), "initWithItem:", v72);
  v190 = (void *)v72;
  objc_msgSend(v73, "setOutlineObject:", v72);
  objc_msgSend(v4, "enablementProvider");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = v73;
  objc_msgSend(v74, "configureEnablementOfSectionManager:enablementItem:", v73, 2);

  v75 = v69;
  v76 = v75;
  if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v76, OS_SIGNPOST_INTERVAL_END, v67, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v77 = os_signpost_id_generate(v76);
  v78 = v76;
  v79 = v78;
  if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v77, "PUSidebarDataController.makeSectionManagers.item", "item=batchFetchRootSmartAlbums", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CD13B8], "px_fetchSmartAlbumCollectionsBySubtypeForAlbumSubtypes:photoLibrary:", &unk_1E59BAA38, v211);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = v79;
  v82 = v81;
  if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v82, OS_SIGNPOST_INTERVAL_END, v77, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }
  v83 = v59;
  v198 = (void *)v80;

  v84 = os_signpost_id_generate(v82);
  v85 = v82;
  v86 = v85;
  if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v86, OS_SIGNPOST_INTERVAL_BEGIN, v84, "PUSidebarDataController.makeSectionManagers.item", "item=people", buf, 2u);
  }

  v87 = (void *)objc_opt_class();
  objc_msgSend(v7, "peopleCollection");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "_singleItemDataSourceManagerForCollection:context:", v88, v4);
  v89 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "enablementProvider");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = (void *)v89;
  objc_msgSend(v90, "configureEnablementOfSectionManager:enablementItem:", v89, 22);

  v91 = v86;
  v92 = v91;
  if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v92, OS_SIGNPOST_INTERVAL_END, v84, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v93 = os_signpost_id_generate(v92);
  v94 = v92;
  v95 = v94;
  if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v93, "PUSidebarDataController.makeSectionManagers.item", "item=places", buf, 2u);
  }

  objc_msgSend(v198, "objectForKeyedSubscript:", &unk_1E59BC378);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_singleItemDataSourceManagerForCollection:context:", v189, v4);
  v96 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enablementProvider");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = (void *)v96;
  objc_msgSend(v97, "configureEnablementOfSectionManager:enablementItem:", v96, 21);

  v98 = v95;
  v99 = v98;
  if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v99, OS_SIGNPOST_INTERVAL_END, v93, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v100 = os_signpost_id_generate(v99);
  v101 = v99;
  v102 = v101;
  if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v102, OS_SIGNPOST_INTERVAL_BEGIN, v100, "PUSidebarDataController.makeSectionManagers.item", "item=favorites", buf, 2u);
  }

  objc_msgSend(v198, "objectForKeyedSubscript:", &unk_1E59BC360);
  v103 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dataSectionManagerForCollection:context:", v103, v4);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = (void *)v103;
  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B5F8]), "initWithAssetCollection:itemCount:", v103, 0x7FFFFFFFFFFFFFFFLL);
  v195 = v104;
  objc_msgSend(v104, "setOutlineObject:", v105);

  v106 = v102;
  v107 = v106;
  if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v107, OS_SIGNPOST_INTERVAL_END, v100, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v108 = os_signpost_id_generate(v107);
  v109 = v107;
  v110 = v109;
  v111 = v83;
  if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v110, OS_SIGNPOST_INTERVAL_BEGIN, v108, "PUSidebarDataController.makeSectionManagers.item", "item=recents", buf, 2u);
  }

  objc_msgSend(v198, "objectForKeyedSubscript:", &unk_1E59BC390);
  v112 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dataSectionManagerForCollection:context:", v112, v4);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = (void *)v112;
  v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B5F8]), "initWithAssetCollection:itemCount:", v112, 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v113, "setOutlineObject:", v114);

  objc_msgSend(v4, "enablementProvider");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v113;
  objc_msgSend(v115, "configureEnablementOfSectionManager:enablementItem:", v113, 23);

  v116 = v110;
  v117 = v116;
  if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v116))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v117, OS_SIGNPOST_INTERVAL_END, v108, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v118 = os_signpost_id_generate(v117);
  v119 = v117;
  v120 = v119;
  if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v120, OS_SIGNPOST_INTERVAL_BEGIN, v118, "PUSidebarDataController.makeSectionManagers.item", "item=search", buf, 2u);
  }

  v121 = (void *)objc_opt_class();
  objc_msgSend(v7, "searchCollection");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "_singleItemDataSourceManagerForCollection:context:", v122, v4);
  v123 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "enablementProvider");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = (void *)v123;
  objc_msgSend(v124, "configureEnablementOfSectionManager:enablementItem:", v123, 24);

  v125 = v120;
  v126 = v125;
  if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v126, OS_SIGNPOST_INTERVAL_END, v118, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v127 = os_signpost_id_generate(v126);
  v128 = v126;
  v129 = v128;
  v130 = v211;
  if (v127 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v128))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v129, OS_SIGNPOST_INTERVAL_BEGIN, v127, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "myAlbumsDataSectionManagerForPhotoLibrary:context:hideAdd:", v211, v4, v204 != 0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v129;
  v132 = v131;
  if (v127 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v131))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v132, OS_SIGNPOST_INTERVAL_END, v127, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v133 = os_signpost_id_generate(v132);
  v134 = v132;
  v135 = v134;
  if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v135, OS_SIGNPOST_INTERVAL_BEGIN, v133, "PUSidebarDataController.makeSectionManagers.item", "item=shared", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "sharedAlbumsDataSectionManagerWithPhotoLibrary:context:hideAdd:", v211, v4, v204 != 0);
  v136 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enablementProvider");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = (void *)v136;
  objc_msgSend(v137, "configureEnablementOfSectionManager:enablementItem:", v136, 9);

  v138 = v135;
  v139 = v138;
  if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v138))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v139, OS_SIGNPOST_INTERVAL_END, v133, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v140 = os_signpost_id_generate(v139);
  v141 = v139;
  v142 = v141;
  if (v140 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v142, OS_SIGNPOST_INTERVAL_BEGIN, v140, "PUSidebarDataController.makeSectionManagers.item", "item=mediaTypes", buf, 2u);
  }

  -[PXSidebarDataController mediaTypesSectionManager](self, "mediaTypesSectionManager");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v143)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = (objc_class *)objc_opt_class();
    NSStringFromClass(v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarDataController.m"), 258, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.mediaTypesSectionManager"), v179);
LABEL_124:

    v130 = v211;
    goto LABEL_86;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = (objc_class *)objc_opt_class();
    NSStringFromClass(v185);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "px_descriptionForAssertionMessage");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarDataController.m"), 258, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.mediaTypesSectionManager"), v179, v186);

    goto LABEL_124;
  }
LABEL_86:
  v205 = v111;
  v144 = v143;

  v145 = objc_alloc(MEMORY[0x1E0D7B620]);
  v146 = (void *)objc_msgSend(v145, "initWithIdentifier:", *MEMORY[0x1E0D7C548]);
  objc_msgSend(v144, "setOutlineObject:", v146);

  objc_msgSend(v144, "setAllowsEmptyDataSection:", 1);
  if ((-[PXSidebarDataController options](self, "options") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v212[0] = MEMORY[0x1E0C809B0];
    v212[1] = 3221225472;
    v212[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_184;
    v212[3] = &unk_1E58ABD10;
    v213 = v144;
    objc_msgSend(v147, "scheduleTaskAfterCATransactionCommits:", v212);

  }
  v148 = v142;
  v149 = v148;
  if (v140 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v148))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v149, OS_SIGNPOST_INTERVAL_END, v140, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v150 = os_signpost_id_generate(v149);
  v151 = v149;
  v152 = v151;
  if (v150 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v152, OS_SIGNPOST_INTERVAL_BEGIN, v150, "PUSidebarDataController.makeSectionManagers.item", "item=other", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "otherAlbumsDataSectionManagerWithPhotoLibrary:context:", v130, v4);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v152;
  v155 = v154;
  if (v150 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v155, OS_SIGNPOST_INTERVAL_END, v150, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v156 = os_signpost_id_generate(v155);
  v157 = v155;
  v158 = v157;
  if (v156 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v158, OS_SIGNPOST_INTERVAL_BEGIN, v156, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "fromMyMacAlbumsDataSectionManagerWithPhotoLibrary:context:", v130, v4);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v158;
  v161 = v160;
  if (v156 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v160))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v161, OS_SIGNPOST_INTERVAL_END, v156, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v162 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v250[0] = v205;
  v250[1] = v209;
  v250[2] = v200;
  v250[3] = v197;
  v250[4] = v196;
  v250[5] = v195;
  v250[6] = v194;
  v250[7] = v203;
  v250[8] = v153;
  v250[9] = v144;
  v250[10] = v192;
  v250[11] = v193;
  v250[12] = v159;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v250, 13);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = (void *)objc_msgSend(v162, "initWithArray:", v163);

  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v163) = objc_msgSend(v165, "enablePrototypeTab");

  if ((_DWORD)v163)
  {
    v180 = (void *)objc_opt_class();
    objc_msgSend(v210, "prototypeCollection");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "_singleItemDataSourceManagerForCollection:context:", v181, v4);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    v183 = objc_msgSend(v164, "indexOfObject:", v203);
    if (v183 == 0x7FFFFFFFFFFFFFFFLL)
      v184 = objc_msgSend(v164, "count");
    else
      v184 = v183 + 1;
    objc_msgSend(v164, "insertObject:atIndex:", v182, v184);

  }
  if ((-[PXSidebarDataController options](self, "options") & 4) == 0)
  {
    v166 = os_signpost_id_generate(v161);
    v167 = v161;
    v168 = v167;
    if (v166 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v167))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v168, OS_SIGNPOST_INTERVAL_BEGIN, v166, "PUSidebarDataController.makeSectionManagers.item", "item=devices", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "devicesDataSectionManagerForLibrary:", v211);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = v168;
    v171 = v170;
    if (v166 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v170))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v171, OS_SIGNPOST_INTERVAL_END, v166, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
    }

    v172 = objc_msgSend(v164, "indexOfObject:", v203);
    if (v172 == 0x7FFFFFFFFFFFFFFFLL)
      v173 = objc_msgSend(v164, "count");
    else
      v173 = v172 + 1;
    objc_msgSend(v164, "insertObject:atIndex:", v169, v173);

  }
  v174 = v161;
  v175 = v174;
  v45 = v211;
  if (v206 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v174))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v175, OS_SIGNPOST_INTERVAL_END, spid, "PUSidebarDataController.makeSectionManagers", ", buf, 2u);
  }

  v43 = (void *)objc_msgSend(v164, "copy");
  v42 = v209;
  v37 = v210;
  v46 = v207;
  v44 = v205;
LABEL_119:

  return v43;
}

- (void)appearanceDidChange
{
  UIImage *emptyAlbumPlaceholderImage;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSidebarDataController;
  -[PXSidebarDataController appearanceDidChange](&v4, sel_appearanceDidChange);
  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  self->_emptyAlbumPlaceholderImage = 0;

}

- (int64_t)requestImageForItem:(id)a3 parentItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void (**v20)(void *, void *);
  id v21;
  void (**v22)(_QWORD);
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  int64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v41;
  id v42;
  unint64_t v43;
  id v44;
  _QWORD v45[4];
  void (**v46)(void *, void *);
  void (**v47)(_QWORD);
  _QWORD v48[4];
  void (**v49)(void *, void *);
  __int128 *p_buf;
  id v51;
  _QWORD v52[7];
  id location;
  _QWORD v54[4];
  id v55;
  PUSidebarDataController *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD aBlock[4];
  NSObject *v62;
  id v63;
  os_signpost_id_t v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44 = a4;
  v9 = a5;
  PLSidebarGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  v43 = v11 - 1;
  if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v17 = v13;
  }
  else
  {
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.sync", "itemIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v15 = v13;
    if (os_signpost_enabled(v15))
    {
      objc_msgSend(v8, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.async", "itemIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);

    }
  }

  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke;
  aBlock[3] = &unk_1E58AAA80;
  v19 = v13;
  v62 = v19;
  v64 = v11;
  v42 = v9;
  v63 = v42;
  v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = *MEMORY[0x1E0D7C808];
  v54[0] = v18;
  v54[1] = 3221225472;
  v54[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_195;
  v54[3] = &unk_1E58AAAA8;
  v21 = v8;
  v55 = v21;
  v56 = self;
  v22 = (void (**)(_QWORD))_Block_copy(v54);
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "sidebarSymbolImagesOnly");

  if (v24)
  {
    v22[2](v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, v25);

    v26 = v19;
    v27 = v26;
    if (v43 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v27, OS_SIGNPOST_INTERVAL_END, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.sync", ", (uint8_t *)&buf, 2u);
    }

    v28 = v58[3];
  }
  else
  {
    objc_msgSend(v21, "collection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[PXSidebarDataController dataSectionManagerForItem:](self, "dataSectionManagerForItem:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v41 = v29;
    if (objc_msgSend(v29, "px_isFolder"))
    {
      objc_msgSend(v30, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", *MEMORY[0x1E0D7C570], v21, 0x7FFFFFFFFFFFFFFFLL);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      v33 = (void *)MEMORY[0x1E0C9AA60];
      if (v31)
        v33 = (void *)v31;
      v34 = v33;

      objc_initWeak(&location, self);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__101342;
      v68 = __Block_byref_object_dispose__101343;
      v69 = 0;
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithDisplayScale:", 2.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v18;
      v52[1] = 3221225472;
      v52[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_201;
      v52[3] = &unk_1E58AAAD0;
      v52[4] = self;
      v52[5] = &buf;
      v52[6] = &v57;
      v48[0] = v18;
      v48[1] = 3221225472;
      v48[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_2;
      v48[3] = &unk_1E58AAAF8;
      objc_copyWeak(&v51, &location);
      p_buf = &buf;
      v49 = v20;
      PUSidebarRequestFolderImageForAssets(v34, v35, v52, v48, 100.0, 100.0);

      objc_destroyWeak(&v51);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v30, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", *MEMORY[0x1E0D7C588], v21, 0x7FFFFFFFFFFFFFFFLL);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v45[0] = v18;
        v45[1] = 3221225472;
        v45[2] = __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_3;
        v45[3] = &unk_1E58AAB20;
        v46 = v20;
        v47 = v22;
        v36 = -[PUSidebarDataController _requestImageForAsset:size:completion:](self, "_requestImageForAsset:size:completion:", v34, v45, 100.0, 100.0);
        v58[3] = v36;

        v37 = v46;
      }
      else
      {
        v22[2](v22);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2](v20, v37);
      }

    }
    v38 = v19;
    v39 = v38;
    if (v43 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v39, OS_SIGNPOST_INTERVAL_END, v11, "PUSidebarDataController.requestImageForItem_parentItem_completion_.sync", ", (uint8_t *)&buf, 2u);
    }

    v28 = v58[3];
  }

  _Block_object_dispose(&v57, 8);
  return v28;
}

- (int64_t)_requestImageForAsset:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D7CD30], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageProviderForAsset:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0D7CD08]);
  objc_msgSend(v13, "setDeliveryMode:", 1);
  objc_msgSend(v13, "setResizeMode:", 2);
  -[PXSidebarDataController beginRequestForMediaProvider:mediaRequestIDs:](self, "beginRequestForMediaProvider:mediaRequestIDs:", v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __65__PUSidebarDataController__requestImageForAsset_size_completion___block_invoke;
  v25 = &unk_1E58AAB48;
  v15 = v10;
  v27 = v15;
  objc_copyWeak(&v28, &location);
  v16 = v14;
  v26 = v16;
  v17 = objc_msgSend(v12, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 1, v13, &v22, width, height);
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB36B8]);
    v19 = (void *)objc_msgSend(v18, "initWithIndex:", v17, v22, v23, v24, v25);
    objc_msgSend(v16, "setMediaRequestIDs:", v19);

  }
  v20 = objc_msgSend(v16, "sidebarRequestID", v22, v23, v24, v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v20;
}

- (UIImage)emptyAlbumPlaceholderImage
{
  UIImage *emptyAlbumPlaceholderImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  if (!emptyAlbumPlaceholderImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSidebarDataController sidebarCustomSymbolImageWithName:symbolColor:scale:](self, "sidebarCustomSymbolImageWithName:symbolColor:scale:", CFSTR("photo.on.rectangle"), v4, 0.5);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_emptyAlbumPlaceholderImage;
    self->_emptyAlbumPlaceholderImage = v5;

    emptyAlbumPlaceholderImage = self->_emptyAlbumPlaceholderImage;
  }
  return emptyAlbumPlaceholderImage;
}

- (id)backedPlusButtonImage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarDataController sidebarCustomSymbolImageWithName:symbolColor:scale:](self, "sidebarCustomSymbolImageWithName:symbolColor:scale:", CFSTR("plus"), v3, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sidebarCustomSymbolImageWithName:(id)a3 symbolColor:(id)a4 scale:(double)a5
{
  void *v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0DC3888];
  v7 = a5 * 100.0;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "configurationWithPointSize:weight:", 5, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_tintedImageWithColor:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "pu_centeredImage:withBackgroundColor:size:", v13, v12, 100.0, 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setEmptyAlbumPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyAlbumPlaceholderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyAlbumPlaceholderImage, 0);
}

void __65__PUSidebarDataController__requestImageForAsset_size_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "cancelRequestDetails:", *(_QWORD *)(a1 + 32));

  }
}

void __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PUSidebarDataController.requestImageForItem_parentItem_completion_.async", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_195(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "glyphImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D7C580]))
  {
    objc_msgSend(*(id *)(a1 + 40), "backedPlusButtonImage");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D7C578]))
    {
      v4 = 0;
      if (!v2)
        goto LABEL_12;
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 40), "emptyAlbumPlaceholderImage");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  if (!v2)
    goto LABEL_12;
LABEL_8:
  if (!v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isEmbeddedGlyph");
    v6 = (void *)MEMORY[0x1E0DC3870];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageNamed:inBundle:", v2, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMonochrome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageByApplyingSymbolConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_201(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "beginRequestForMediaProvider:mediaRequestIDs:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sidebarRequestID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 48);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "cancelRequestDetails:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PUSidebarDataController_requestImageForItem_parentItem_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __46__PUSidebarDataController_makeSectionManagers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  void (**v6)(_QWORD);
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(NSObject **)(a1 + 32);
  v6 = a3;
  v7 = os_signpost_id_generate(v5);
  v8 = *(id *)(a1 + 32);
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v13 = 136315138;
    v14 = a2;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PUSidebarDataController.makeSectionManagers.item", "item=%s", (uint8_t *)&v13, 0xCu);
  }

  v6[2](v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(id *)(a1 + 32);
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v12, OS_SIGNPOST_INTERVAL_END, v7, "PUSidebarDataController.makeSectionManagers.item", ", (uint8_t *)&v13, 2u);
  }

  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

void __46__PUSidebarDataController_makeSectionManagers__block_invoke_139(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v7)(_QWORD);
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v16 = 136315138;
    v17 = a2;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PUSidebarDataController.makeSectionManagers.item", "item=%s", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_singleItemDataSourceManagerForCollection:context:", 0, *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "enablementProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureEnablementOfSectionManager:enablementItem:", v11, a3);

  v13 = 0;
  if (objc_msgSend(v11, "isEnabled"))
  {
    v7[2](v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(id *)(a1 + 32);
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PUSidebarDataController.makeSectionManagers.item", ", (uint8_t *)&v16, 2u);
  }

  if (v13)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);

}

void __46__PUSidebarDataController_makeSectionManagers__block_invoke_141(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  NSObject *v7;
  id v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a1[4];
  v8 = a3;
  v9 = os_signpost_id_generate(v7);
  v10 = a1[4];
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v16 = 136315138;
    v17 = a2;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PUSidebarDataController.makeSectionManagers.item", "item=%s", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_singleItemDataSourceManagerForCollection:context:", v8, a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "enablementProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configureEnablementOfSectionManager:enablementItem:", v12, a4);

  v14 = a1[4];
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v15, OS_SIGNPOST_INTERVAL_END, v9, "PUSidebarDataController.makeSectionManagers.item", ", (uint8_t *)&v16, 2u);
  }

  if (objc_msgSend(v12, "isEnabled"))
    objc_msgSend(a1[7], "addObject:", v12);

}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_153(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D7B998], "makeTopCollectionsDataSectionManagerWithLibrary:", *(_QWORD *)(a1 + 32));
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "devicesDataSectionManagerForLibrary:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D7B998], "makeUtilityTypesDataSectionManagerWithLibrary:forPicker:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "fromMyMacAlbumsDataSectionManagerWithPhotoLibrary:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __46__PUSidebarDataController_makeSectionManagers__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "mediaTypesCollectionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mediaTypesSectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PUSidebarDataController.m"), 152, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.mediaTypesSectionManager"), v12, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PUSidebarDataController.m"), 152, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.mediaTypesSectionManager"), v12);
  }

LABEL_3:
  v4 = objc_alloc(MEMORY[0x1E0D7B620]);
  v5 = (void *)objc_msgSend(v4, "initWithIdentifier:collection:", *MEMORY[0x1E0D7C8E0], v2);
  objc_msgSend(v3, "setOutlineObject:", v5);

  objc_msgSend(v3, "setAllowsEmptyDataSection:", 1);
  if ((objc_msgSend(*(id *)(a1 + 40), "options") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__PUSidebarDataController_makeSectionManagers__block_invoke_6;
    v17[3] = &unk_1E58ABD10;
    v18 = v3;
    objc_msgSend(v6, "scheduleTaskAfterCATransactionCommits:", v17);

  }
  return v3;
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_7(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "myAlbumsDataSectionManagerForPhotoLibrary:context:hideAdd:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_8(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "sharedAlbumsDataSectionManagerWithPhotoLibrary:context:hideAdd:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_184(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsEmptyDataSection:", 0);
}

uint64_t __46__PUSidebarDataController_makeSectionManagers__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsEmptyDataSection:", 0);
}

+ (id)_singleItemDataSourceManagerForCollection:(id)a3 context:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0D7B628];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCollection:context:", 0, v6);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B5F8]), "initWithAssetCollection:itemCount:", v7, 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v8, "setOutlineObject:", v9);

  return v8;
}

+ (id)_actionManagerWithActionType:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D7B5E8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithActionType:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B628]), "initWithItem:", v5);
  objc_msgSend(v6, "setOutlineObject:", v5);

  return v6;
}

+ (id)myAlbumsDataSectionManagerForPhotoLibrary:(id)a3 context:(id)a4 hideAdd:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  _QWORD v61[4];
  NSObject *v62;
  id v63;
  uint8_t buf[8];
  _QWORD v65[3];
  _QWORD v66[4];

  v55 = a5;
  v66[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "px_virtualCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSidebarGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PUSidebarDataController.makeSectionManagers.item", "item=search", buf, 2u);
  }

  v13 = objc_alloc(MEMORY[0x1E0D7B628]);
  objc_msgSend(v8, "myAlbumsCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithCollection:context:", v14, v6);

  v16 = objc_alloc(MEMORY[0x1E0D7B5F8]);
  objc_msgSend(v8, "myAlbumsCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithAssetCollection:itemCount:", v17, 0x7FFFFFFFFFFFFFFFLL);
  v57 = v15;
  objc_msgSend(v15, "setOutlineObject:", v18);

  v19 = v12;
  v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v20, OS_SIGNPOST_INTERVAL_END, v10, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v21 = os_signpost_id_generate(v20);
  v22 = v20;
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums, subItem=albumsFolder", buf, 2u);
  }

  v56 = v8;
  objc_msgSend(v8, "rootAlbumCollectionList");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B600], "configurationWithCollectionList:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v6;
  objc_msgSend(v6, "assetsFilterPredicate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_prepareSectionConfiguration:assetsFilterPredicate:", v24, v25);

  objc_msgSend(v24, "setIncludeKeyAssetFetches:", 1);
  objc_msgSend(v24, "setIncludeUserSmartAlbums:", 1);
  objc_msgSend(v24, "setSkipAssetFetches:", 1);
  objc_msgSend(v24, "setSkipAssetCountFetches:", 1);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B608]), "initWithConfiguration:", v24);
  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __85__PUSidebarDataController_myAlbumsDataSectionManagerForPhotoLibrary_context_hideAdd___block_invoke;
  v61[3] = &unk_1E58ABCA8;
  v28 = v23;
  v62 = v28;
  v58 = v26;
  v63 = v58;
  objc_msgSend(v27, "scheduleTaskAfterCATransactionCommits:", v61);

  v29 = v28;
  v30 = v29;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v30, OS_SIGNPOST_INTERVAL_END, v21, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v31 = os_signpost_id_generate(v30);
  v32 = v30;
  v33 = v32;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums, subItem=MPS", buf, 2u);
  }

  v34 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v7, "px_standardLibrarySpecificFetchOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "fetchAssetCollectionsWithType:subtype:options:", 1, 100, v35);
  v36 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)v36;
  objc_msgSend(MEMORY[0x1E0D7B600], "configurationWithCollectionsFetchResult:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsFilterPredicate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_prepareSectionConfiguration:assetsFilterPredicate:", v37, v38);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B608]), "initWithConfiguration:", v37);
  v40 = v33;
  v41 = v40;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v41, OS_SIGNPOST_INTERVAL_END, v31, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D7B570], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    || (objc_msgSend(v43, "enableSidebarHeaderSelection") & 1) == 0)
  {
    objc_msgSend(v42, "addObject:", v15);
  }
  if (v55)
  {
    v66[0] = v39;
    v66[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v44);
  }
  else
  {
    v65[0] = v39;
    v65[1] = v58;
    objc_msgSend(a1, "_actionManagerWithActionType:", *MEMORY[0x1E0D7C248]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v45);

  }
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    && objc_msgSend(v43, "enableSidebarHeaderSelection"))
  {
    objc_msgSend(v56, "myAlbumsCollection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "transientIdentifier");
    v47 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v47 = (id)*MEMORY[0x1E0D7C550];
  }
  v48 = objc_alloc(MEMORY[0x1E0D7B9C8]);
  v49 = (void *)objc_msgSend(v42, "copy");
  v50 = (void *)objc_msgSend(v48, "initWithChildDataSectionManagers:", v49);

  objc_msgSend(v50, "setAlwaysContainsObjects:", !v55);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B620]), "initWithIdentifier:collection:", v47, v54);
  objc_msgSend(v50, "setOutlineObject:", v51);

  return v50;
}

+ (id)sharedAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4 hideAdd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];

  v5 = a5;
  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "px_virtualCollections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D7B628]);
  objc_msgSend(v10, "sharedAlbumsCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithCollection:context:", v12, v8);

  v14 = objc_alloc(MEMORY[0x1E0D7B5F8]);
  objc_msgSend(v10, "sharedAlbumsCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithAssetCollection:itemCount:", v15, 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v13, "setOutlineObject:", v16);

  v17 = (void *)MEMORY[0x1E0D7B600];
  objc_msgSend(v9, "px_virtualCollections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sharedAlbumsCollectionList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationWithCollectionList:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "assetsFilterPredicate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_prepareSectionConfiguration:assetsFilterPredicate:", v20, v21);
  objc_msgSend(v20, "setIncludeKeyAssetFetches:", 1);
  objc_msgSend(v20, "setSkipAssetFetches:", 1);
  objc_msgSend(v20, "setSkipAssetCountFetches:", 1);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B608]), "initWithConfiguration:", v20);
  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __90__PUSidebarDataController_sharedAlbumsDataSectionManagerWithPhotoLibrary_context_hideAdd___block_invoke;
  v41[3] = &unk_1E58ABD10;
  v24 = v22;
  v42 = v24;
  objc_msgSend(v23, "scheduleTaskAfterCATransactionCommits:", v41);

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D7B570], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    || (objc_msgSend(v26, "enableSidebarHeaderSelection") & 1) == 0)
  {
    objc_msgSend(v25, "addObject:", v13);
  }
  if (v5)
  {
    v44[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v27);
  }
  else
  {
    objc_msgSend(a1, "_actionManagerWithActionType:", *MEMORY[0x1E0D7C258]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v24;
    v43[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v28);

  }
  v29 = !v5;
  v30 = objc_alloc(MEMORY[0x1E0D7B9C8]);
  v31 = (void *)objc_msgSend(v25, "copy");
  v32 = (void *)objc_msgSend(v30, "initWithChildDataSectionManagers:", v31);

  objc_msgSend(v32, "setAlwaysContainsObjects:", v29);
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    && objc_msgSend(v26, "enableSidebarHeaderSelection"))
  {
    objc_msgSend(v10, "sharedAlbumsCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "transientIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v36 = v34;
    }
    else
    {
      objc_msgSend(v33, "localIdentifier");
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v36;

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B620]), "initWithIdentifier:collection:", v38, v33);
    objc_msgSend(v32, "setOutlineObject:", v39);

  }
  else
  {
    v37 = objc_alloc(MEMORY[0x1E0D7B620]);
    v33 = (void *)objc_msgSend(v37, "initWithIdentifier:", *MEMORY[0x1E0D7C560]);
    objc_msgSend(v32, "setOutlineObject:", v33);
  }

  return v32;
}

+ (id)otherAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CD14E0], "px_otherAlbumsCollectionListIncludeDeleted:includeHidden:includeDuplicates:", 1, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke;
  v25 = &unk_1E58AAA30;
  v26 = v4;
  v8 = v4;
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B9C8]), "initWithChildDataSectionManagers:", v9);
  objc_msgSend(v10, "setAlwaysContainsObjects:", 1);
  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = 3221225472;
  v19 = __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke_2;
  v20 = &unk_1E58ABD10;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v11, "scheduleTaskAfterCATransactionCommits:", &v17);

  v13 = v12;
  v14 = objc_alloc(MEMORY[0x1E0D7B620]);
  v15 = (void *)objc_msgSend(v14, "initWithIdentifier:", *MEMORY[0x1E0D7C558], v17, v18, v19, v20);
  objc_msgSend(v13, "setOutlineObject:", v15);

  return v13;
}

+ (id)fromMyMacAlbumsDataSectionManagerWithPhotoLibrary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  os_signpost_id_t v43;
  uint8_t buf[16];
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSidebarGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac, subItem=albumsFolder", buf, 2u);
  }

  objc_msgSend(v6, "px_virtualCollections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rootAlbumCollectionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B600], "configurationWithCollectionList:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsFilterPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_prepareSectionConfiguration:assetsFilterPredicate:", v14, v15);
  objc_msgSend(v14, "setIncludeKeyAssetFetches:", 1);
  objc_msgSend(v14, "setShowSyncedFromMacAlbums:", 1);
  objc_msgSend(v14, "setSkipAssetFetches:", 1);
  objc_msgSend(v14, "setSkipAssetCountFetches:", 1);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B608]), "initWithConfiguration:", v14);
  v17 = v11;
  v18 = v17;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v18, OS_SIGNPOST_INTERVAL_END, v9, "PUSidebarDataController.makeSectionManagers.item", ", buf, 2u);
  }

  v19 = objc_alloc(MEMORY[0x1E0D7B9C8]);
  v45[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithChildDataSectionManagers:", v20);

  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    && (objc_msgSend(MEMORY[0x1E0D7B570], "sharedInstance"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "enableSidebarHeaderSelection"),
        v22,
        v23))
  {
    objc_msgSend(v6, "px_virtualCollections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "macSyncedAlbumsCollectionList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setAlwaysContainsObjects:", 1);
    objc_msgSend(v25, "transientIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(v25, "localIdentifier");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v28;

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B620]), "initWithIdentifier:collection:", v30, v25);
    objc_msgSend(v21, "setOutlineObject:", v31);

  }
  else
  {
    objc_msgSend(v21, "setEnabled:", 0);
    v29 = objc_alloc(MEMORY[0x1E0D7B620]);
    v25 = (void *)objc_msgSend(v29, "initWithIdentifier:", *MEMORY[0x1E0D7C568]);
    objc_msgSend(v21, "setOutlineObject:", v25);
  }

  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __85__PUSidebarDataController_fromMyMacAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke;
  v39[3] = &unk_1E58AAA58;
  v40 = v18;
  v41 = v16;
  v33 = v21;
  v42 = v33;
  v43 = v9;
  v34 = v16;
  v35 = v18;
  objc_msgSend(v32, "scheduleTaskAfterCATransactionCommits:", v39);

  v36 = v42;
  v37 = v33;

  return v37;
}

+ (void)_prepareSectionConfiguration:(id)a3 assetsFilterPredicate:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSimulateNonIncrementalChanges:", objc_msgSend(v7, "sidebarSimulateNonIncrementalChanges"));
  objc_msgSend(v6, "setPausedChangeDetailsBufferLength:", objc_msgSend(v7, "sidebarPausedChangeDetailsBufferLength"));
  objc_msgSend(v6, "setAssetsFilterPredicate:", v5);

}

void __85__PUSidebarDataController_fromMyMacAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac, subItem=albumsFolder, detail=startBackgroundFetchingIfNeeded", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "startBackgroundFetchingIfNeeded");
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, v2, "PUSidebarDataController.makeSectionManagers.item", ", v16, 2u);
  }

  v7 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v8 = *(id *)(a1 + 32);
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PUSidebarDataController.makeSectionManagers.item", "item=fromMyMac, detail=enablement", v15, 2u);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B2D8]), "initWithSourceDataSectionManager:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v10, "setEnablementTarget:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "setEnablementForwarder:", v10);
  v11 = *(id *)(a1 + 32);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PUSidebarDataController.makeSectionManagers.item", ", v14, 2u);
  }

}

id __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B628]), "initWithCollection:context:", v3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setHiddenWhenEmpty:", 1);
  if (objc_msgSend(v3, "px_isHiddenSmartAlbum"))
  {
    objc_msgSend(*(id *)(a1 + 32), "enablementProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureEnablementOfSectionManager:enablementItem:", v4, 4);

  }
  if (objc_msgSend(v3, "px_isRecentlyDeletedSmartAlbum"))
  {
    objc_msgSend(*(id *)(a1 + 32), "enablementProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configureEnablementOfSectionManager:enablementItem:", v4, 5);

  }
  if (objc_msgSend(v3, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
    objc_msgSend(*(id *)(a1 + 32), "enablementProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureEnablementOfSectionManager:enablementItem:", v4, 26);

  }
  return v4;
}

uint64_t __81__PUSidebarDataController_otherAlbumsDataSectionManagerWithPhotoLibrary_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlwaysContainsObjects:", 0);
}

uint64_t __90__PUSidebarDataController_sharedAlbumsDataSectionManagerWithPhotoLibrary_context_hideAdd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startBackgroundFetchingIfNeeded");
}

void __85__PUSidebarDataController_myAlbumsDataSectionManagerForPhotoLibrary_context_hideAdd___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "PUSidebarDataController.makeSectionManagers.item", "item=myAlbums, subItem=albumsFolder, detail=startBackgroundFetchingIfNeeded", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "startBackgroundFetchingIfNeeded");
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, v2, "PUSidebarDataController.makeSectionManagers.item", ", v7, 2u);
  }

}

@end
