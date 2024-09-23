@implementation SXDOMAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  id v153;
  id v154;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F17D00, &__block_literal_global_4);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_75);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254F2FA58, &__block_literal_global_84);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254F2F9E8, &__block_literal_global_90);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F2FAB8, &__block_literal_global_93);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerProtocol:factory:", &unk_254F42130, &__block_literal_global_100);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerClass:factory:", objc_opt_class(), &__block_literal_global_103);

  objc_msgSend(v3, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254F2F988, &__block_literal_global_110);

  objc_msgSend(v3, "privateContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerClass:factory:", objc_opt_class(), &__block_literal_global_112);

  objc_msgSend(v3, "privateContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254F688D0, &__block_literal_global_117);

  objc_msgSend(v3, "publicContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerProtocol:factory:", &unk_254F40058, &__block_literal_global_120);

  objc_msgSend(v3, "callback");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F05AC0, v27, &__block_literal_global_148);

  objc_msgSend(v3, "privateContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerClass:factory:", objc_opt_class(), &__block_literal_global_151);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "withConfiguration:", &__block_literal_global_159);

  objc_msgSend(v3, "publicContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v31, "registerClass:factory:", objc_opt_class(), &__block_literal_global_173);

  objc_msgSend(v3, "privateContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v33, "registerProtocol:factory:", &unk_254F41458, &__block_literal_global_207);

  objc_msgSend(v3, "privateContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v35, "registerProtocol:factory:", &unk_254EFABC8, &__block_literal_global_215);

  objc_msgSend(v3, "privateContainer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v37, "registerClass:factory:", objc_opt_class(), &__block_literal_global_218);

  objc_msgSend(v3, "privateContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v39, "registerClass:factory:", objc_opt_class(), &__block_literal_global_220);

  objc_msgSend(v3, "privateContainer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v41, "registerClass:factory:", objc_opt_class(), &__block_literal_global_222);

  objc_msgSend(v3, "privateContainer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_msgSend(v43, "registerClass:factory:", objc_opt_class(), &__block_literal_global_224);

  objc_msgSend(v3, "privateContainer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (id)objc_msgSend(v45, "registerClass:factory:", objc_opt_class(), &__block_literal_global_226);

  objc_msgSend(v3, "privateContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (id)objc_msgSend(v47, "registerClass:factory:", objc_opt_class(), &__block_literal_global_228);

  objc_msgSend(v3, "privateContainer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (id)objc_msgSend(v49, "registerClass:factory:", objc_opt_class(), &__block_literal_global_231);

  objc_msgSend(v3, "privateContainer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (id)objc_msgSend(v51, "registerProtocol:factory:", &unk_254F14218, &__block_literal_global_232);

  objc_msgSend(v3, "privateContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (id)objc_msgSend(v53, "registerClass:factory:", objc_opt_class(), &__block_literal_global_234);

  objc_msgSend(v3, "privateContainer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (id)objc_msgSend(v55, "registerClass:factory:", objc_opt_class(), &__block_literal_global_236);

  objc_msgSend(v3, "privateContainer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (id)objc_msgSend(v57, "registerClass:factory:", objc_opt_class(), &__block_literal_global_282_0);

  objc_msgSend(v3, "privateContainer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (id)objc_msgSend(v59, "registerClass:factory:", objc_opt_class(), &__block_literal_global_283);

  objc_msgSend(v3, "privateContainer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (id)objc_msgSend(v61, "registerClass:factory:", objc_opt_class(), &__block_literal_global_284);

  objc_msgSend(v3, "privateContainer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (id)objc_msgSend(v63, "registerClass:name:factory:", objc_opt_class(), CFSTR("ComponentStyle"), &__block_literal_global_286);

  objc_msgSend(v3, "privateContainer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (id)objc_msgSend(v65, "registerClass:name:factory:", objc_opt_class(), CFSTR("ComponentTextStyle"), &__block_literal_global_292_0);

  objc_msgSend(v3, "privateContainer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (id)objc_msgSend(v67, "registerClass:name:factory:", objc_opt_class(), CFSTR("TextStyle"), &__block_literal_global_296);

  objc_msgSend(v3, "privateContainer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (id)objc_msgSend(v69, "registerClass:name:factory:", objc_opt_class(), CFSTR("Component"), &__block_literal_global_300);

  objc_msgSend(v3, "privateContainer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (id)objc_msgSend(v71, "registerClass:name:factory:", objc_opt_class(), CFSTR("ComponentLayout"), &__block_literal_global_304_0);

  objc_msgSend(v3, "privateContainer");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (id)objc_msgSend(v73, "registerClass:name:factory:", objc_opt_class(), CFSTR("AdvertisementAutoPlacement"), &__block_literal_global_308);

  objc_msgSend(v3, "privateContainer");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (id)objc_msgSend(v75, "registerClass:name:factory:", objc_opt_class(), CFSTR("SuggestedArticlesAutoPlacement"), &__block_literal_global_312);

  objc_msgSend(v3, "privateContainer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (id)objc_msgSend(v77, "registerClass:name:factory:", objc_opt_class(), CFSTR("DocumentStyle"), &__block_literal_global_316_0);

  objc_msgSend(v3, "privateContainer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (id)objc_msgSend(v79, "registerClass:name:factory:", objc_opt_class(), CFSTR("Component"), &__block_literal_global_321_0);

  objc_msgSend(v3, "privateContainer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (id)objc_msgSend(v81, "registerClass:name:factory:", objc_opt_class(), CFSTR("TextStyle"), &__block_literal_global_325);

  objc_msgSend(v3, "privateContainer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (id)objc_msgSend(v83, "registerClass:name:factory:", objc_opt_class(), CFSTR("ComponentTextStyle"), &__block_literal_global_326);

  objc_msgSend(v3, "privateContainer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (id)objc_msgSend(v85, "registerClass:name:factory:", objc_opt_class(), CFSTR("ComponentLayout"), &__block_literal_global_327);

  objc_msgSend(v3, "privateContainer");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (id)objc_msgSend(v87, "registerClass:name:factory:", objc_opt_class(), CFSTR("ComponentStyle"), &__block_literal_global_328);

  objc_msgSend(v3, "privateContainer");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (id)objc_msgSend(v89, "registerClass:name:factory:", objc_opt_class(), CFSTR("AdvertisementAutoPlacement"), &__block_literal_global_329);

  objc_msgSend(v3, "privateContainer");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (id)objc_msgSend(v91, "registerClass:name:factory:", objc_opt_class(), CFSTR("SuggestedArticlesAutoPlacement"), &__block_literal_global_330);

  objc_msgSend(v3, "privateContainer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (id)objc_msgSend(v93, "registerClass:name:factory:", objc_opt_class(), CFSTR("DocumentStyle"), &__block_literal_global_331);

  objc_msgSend(v3, "callback");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_opt_class();
  TFCallbackScopeAny();
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "whenResolvingClass:scope:callbackBlock:", v96, v97, &__block_literal_global_334);

  objc_msgSend(v3, "publicContainer");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (id)objc_msgSend(v98, "registerProtocol:factory:", &unk_254F69D90, &__block_literal_global_355);

  objc_msgSend(v3, "privateContainer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (id)objc_msgSend(v100, "registerClass:factory:", objc_opt_class(), &__block_literal_global_357);

  objc_msgSend(v3, "publicContainer");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (id)objc_msgSend(v102, "registerProtocol:factory:", &unk_254F038D0, &__block_literal_global_359);

  objc_msgSend(v3, "privateContainer");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (id)objc_msgSend(v104, "registerProtocol:factory:", &unk_254F20528, &__block_literal_global_361);

  objc_msgSend(v3, "privateContainer");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (id)objc_msgSend(v106, "registerClass:factory:", objc_opt_class(), &__block_literal_global_364);

  objc_msgSend(v3, "privateContainer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (id)objc_msgSend(v108, "registerClass:factory:", objc_opt_class(), &__block_literal_global_366);

  objc_msgSend(v3, "privateContainer");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (id)objc_msgSend(v110, "registerClass:factory:", objc_opt_class(), &__block_literal_global_368);

  objc_msgSend(v3, "privateContainer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (id)objc_msgSend(v112, "registerClass:factory:", objc_opt_class(), &__block_literal_global_370);

  objc_msgSend(v3, "privateContainer");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (id)objc_msgSend(v114, "registerClass:factory:", objc_opt_class(), &__block_literal_global_372);

  objc_msgSend(v3, "privateContainer");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (id)objc_msgSend(v116, "registerClass:factory:", objc_opt_class(), &__block_literal_global_374);

  objc_msgSend(v3, "privateContainer");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (id)objc_msgSend(v118, "registerClass:factory:", objc_opt_class(), &__block_literal_global_376);

  objc_msgSend(v3, "privateContainer");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (id)objc_msgSend(v120, "registerClass:factory:", objc_opt_class(), &__block_literal_global_378);

  objc_msgSend(v3, "privateContainer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (id)objc_msgSend(v122, "registerClass:factory:", objc_opt_class(), &__block_literal_global_380);

  objc_msgSend(v3, "privateContainer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (id)objc_msgSend(v124, "registerClass:factory:", objc_opt_class(), &__block_literal_global_382);

  objc_msgSend(v3, "privateContainer");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (id)objc_msgSend(v126, "registerClass:factory:", objc_opt_class(), &__block_literal_global_384);

  objc_msgSend(v3, "privateContainer");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = (id)objc_msgSend(v128, "registerClass:factory:", objc_opt_class(), &__block_literal_global_386);

  objc_msgSend(v3, "privateContainer");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (id)objc_msgSend(v130, "registerClass:factory:", objc_opt_class(), &__block_literal_global_388);

  objc_msgSend(v3, "privateContainer");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (id)objc_msgSend(v132, "registerClass:factory:", objc_opt_class(), &__block_literal_global_389);

  objc_msgSend(v3, "privateContainer");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (id)objc_msgSend(v134, "registerClass:factory:", objc_opt_class(), &__block_literal_global_390);

  objc_msgSend(v3, "privateContainer");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (id)objc_msgSend(v136, "registerClass:factory:", objc_opt_class(), &__block_literal_global_391);

  objc_msgSend(v3, "privateContainer");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = (id)objc_msgSend(v138, "registerClass:factory:", objc_opt_class(), &__block_literal_global_393);

  objc_msgSend(v3, "publicContainer");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (id)objc_msgSend(v140, "registerClass:factory:", objc_opt_class(), &__block_literal_global_394);

  objc_msgSend(v3, "privateContainer");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "registerProtocol:factory:", &unk_254F56DA8, &__block_literal_global_395);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (id)objc_msgSend(v143, "withConfiguration:", &__block_literal_global_398);

  objc_msgSend(v3, "publicContainer");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = (id)objc_msgSend(v145, "registerProtocol:factory:", &unk_254F3AE48, &__block_literal_global_402);

  objc_msgSend(v3, "privateContainer");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = (id)objc_msgSend(v147, "registerClass:factory:", objc_opt_class(), &__block_literal_global_404);

  objc_msgSend(v3, "privateContainer");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (id)objc_msgSend(v149, "registerProtocol:factory:", &unk_254F835F8, &__block_literal_global_405);

  objc_msgSend(v3, "privateContainer");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (id)objc_msgSend(v151, "registerClass:factory:", objc_opt_class(), &__block_literal_global_407);

  objc_msgSend(v3, "privateContainer");
  v154 = (id)objc_claimAutoreleasedReturnValue();

  v153 = (id)objc_msgSend(v154, "registerClass:factory:", objc_opt_class(), &__block_literal_global_408);
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254F40058);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDOMObjectProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXDocumentProvider *__32__SXDOMAssembly_loadInRegistry___block_invoke_7()
{
  return objc_alloc_init(SXDocumentProvider);
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXDocumentMetadataProvider *__32__SXDOMAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SXDocumentMetadataProvider *v3;
  void *v4;
  SXDocumentMetadataProvider *v5;

  v2 = a2;
  v3 = [SXDocumentMetadataProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXDocumentMetadataProvider initWithDocumentProvider:](v3, "initWithDocumentProvider:", v4);
  return v5;
}

SXDOMFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SXDOMFactory *v3;
  void *v4;
  SXDOMFactory *v5;

  v2 = a2;
  v3 = [SXDOMFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXDOMFactory initWithDocumentProvider:](v3, "initWithDocumentProvider:", v4);
  return v5;
}

SXDOMObjectProviderFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  SXDOMObjectProviderFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXDOMObjectProviderFactory *v7;

  v2 = a2;
  v3 = [SXDOMObjectProviderFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F718A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentTextStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXDOMObjectProviderFactory initWithDocumentControllerProvider:componentStyleMerger:componentTextStyleMerger:](v3, "initWithDocumentControllerProvider:componentStyleMerger:componentTextStyleMerger:", v4, v5, v6);
  return v7;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addProcessor:type:", v6, 0);
}

SXDOMModifierManager *__32__SXDOMAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  SXDOMModifierManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SXDOMModifierManager *v7;

  v2 = a2;
  v3 = [SXDOMModifierManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F688D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254EFABC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F14218);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXDOMModifierManager initWithDOMFactory:contextFactory:cacheKeyFactory:](v3, "initWithDOMFactory:contextFactory:cacheKeyFactory:", v4, v5, v6);
  return v7;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  id v17;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v6);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v7);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v8);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v9);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v10);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v11);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v12);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v13);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v14);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v15);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addModifier:", v16);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addModifier:", v17);
}

SXDOMConditionResolverModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  SXDOMConditionResolverModifier *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXDOMConditionResolverModifier *v13;
  void *v14;
  void *v15;

  v2 = a2;
  v3 = [SXDOMConditionResolverModifier alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F20528);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("Component"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("TextStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentLayout"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentTextStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("AdvertisementAutoPlacement"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("SuggestedArticlesAutoPlacement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("DocumentStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F41458);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SXDOMConditionResolverModifier initWithValidationContextFactory:componentResolver:textStyleResolver:componentStyleResolver:componentLayoutResolver:componentTextStyleResolver:advertisementAutoPlacementResolver:suggestedArticlesAutoPlacementResolver:documentStyleResolver:instructions:](v3, "initWithValidationContextFactory:componentResolver:textStyleResolver:componentStyleResolver:componentLayoutResolver:componentTextStyleResolver:advertisementAutoPlacementResolver:suggestedArticlesAutoPlacementResolver:documentStyleResolver:instructions:", v4, v5, v6, v7, v15, v14, v8, v9, v10, v11);
  return v13;
}

SXConditionalResolverModifierInstructions *__32__SXDOMAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalResolverModifierInstructions *v3;
  void *v4;
  void *v5;
  SXConditionalResolverModifierInstructions *v6;

  v2 = a2;
  v3 = [SXConditionalResolverModifierInstructions alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F706C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalResolverModifierInstructions initWithDocumentProvider:hintsConfigurationOptionProvider:](v3, "initWithDocumentProvider:hintsConfigurationOptionProvider:", v4, v5);
  return v6;
}

SXDOMModificationContextFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  SXDOMModificationContextFactory *v3;
  void *v4;
  SXDOMModificationContextFactory *v5;

  v2 = a2;
  v3 = [SXDOMModificationContextFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXDOMModificationContextFactory initWithDocumentProvider:](v3, "initWithDocumentProvider:", v4);
  return v5;
}

SXContentDisplayContainerModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_18()
{
  return objc_alloc_init(SXContentDisplayContainerModifier);
}

SXHiddenComponentRemovalModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_19()
{
  return objc_alloc_init(SXHiddenComponentRemovalModifier);
}

SXAdComponentRemovalModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_20()
{
  return objc_alloc_init(SXAdComponentRemovalModifier);
}

SXComponentLayoutParentWidthModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_21()
{
  return objc_alloc_init(SXComponentLayoutParentWidthModifier);
}

SXDefaultComponentTextStyleModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_22()
{
  return objc_alloc_init(SXDefaultComponentTextStyleModifier);
}

SXDefaultButtonComponentTextStyleModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_23()
{
  return objc_alloc_init(SXDefaultButtonComponentTextStyleModifier);
}

SXColumnVisualizerModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_24()
{
  return objc_alloc_init(SXColumnVisualizerModifier);
}

SXDOMCacheKeyFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  SXDOMCacheKeyFactory *v3;
  void *v4;
  void *v5;
  SXDOMCacheKeyFactory *v6;

  v2 = a2;
  v3 = [SXDOMCacheKeyFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F706C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXDOMCacheKeyFactory initWithDocumentProvider:hintsConfigurationOptionProvider:](v3, "initWithDocumentProvider:hintsConfigurationOptionProvider:", v4, v5);
  return v6;
}

SXLineBalancingComponentTextStyleModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  SXLineBalancingComponentTextStyleModifier *v3;
  void *v4;
  SXLineBalancingComponentTextStyleModifier *v5;

  v2 = a2;
  v3 = [SXLineBalancingComponentTextStyleModifier alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXLineBalancingComponentTextStyleModifier initWithSettings:](v3, "initWithSettings:", v4);
  return v5;
}

SXDarkModeModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  SXDarkModeModifier *v3;
  void *v4;
  void *v5;
  void *v6;
  SXDarkModeModifier *v7;

  v2 = a2;
  v3 = [SXDarkModeModifier alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56DA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3AE48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F835F8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXDarkModeModifier initWithPolicyHandler:configuration:namespacedObjectFactory:](v3, "initWithPolicyHandler:configuration:namespacedObjectFactory:", v4, v5, v6);
  return v7;
}

SXDOMAnalyzerModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_28()
{
  return objc_alloc_init(SXDOMAnalyzerModifier);
}

SXGradientFillToBackgroundColorModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_29()
{
  return objc_alloc_init(SXGradientFillToBackgroundColorModifier);
}

SXAccessibilityHyphenationModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_30()
{
  return objc_alloc_init(SXAccessibilityHyphenationModifier);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_31()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702F00);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_32()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702F18);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_33()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702F30);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  SXJSONObjectMerger *v3;
  void *v4;
  SXJSONObjectMerger *v5;

  v2 = a2;
  v3 = [SXJSONObjectMerger alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXJSONObjectMerger initWithClassProvider:exclusionKeys:](v3, "initWithClassProvider:exclusionKeys:", v4, &unk_24D702F48);
  return v5;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_35()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702F60);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_36()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702F78);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_37()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702F90);
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_38()
{
  return -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), &unk_24D702FA8);
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_39(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("Component"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("TextStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_41(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentTextStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_42(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_43(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_44(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("AdvertisementAutoPlacement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("SuggestedArticlesAutoPlacement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_46(uint64_t a1, void *a2)
{
  id v2;
  SXConditionalObjectResolver *v3;
  void *v4;
  void *v5;
  SXConditionalObjectResolver *v6;

  v2 = a2;
  v3 = [SXConditionalObjectResolver alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F038D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("DocumentStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXConditionalObjectResolver initWithConditionValidator:objectMerger:](v3, "initWithConditionValidator:objectMerger:", v4, v5);
  return v6;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  id v21;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v6);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v7);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v8);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v9);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v10);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v11);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v12);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v13);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v14);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v15);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v16);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v17);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v18);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v19);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConditionValidator:", v20);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addConditionValidator:", v21);
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_48(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXConditionValidatorManager *__32__SXDOMAssembly_loadInRegistry___block_invoke_49()
{
  return objc_alloc_init(SXConditionValidatorManager);
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_50(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXConditionValidationContextFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_51()
{
  return objc_alloc_init(SXConditionValidationContextFactory);
}

SXPlatformConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_52()
{
  return -[SXPlatformConditionValidator initWithPlatform:]([SXPlatformConditionValidator alloc], "initWithPlatform:", CFSTR("ios"));
}

SXSpecVersionConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_53()
{
  return -[SXSpecVersionConditionValidator initWithSpecVersion:]([SXSpecVersionConditionValidator alloc], "initWithSpecVersion:", CFSTR("1.28"));
}

SXViewportConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_54()
{
  return objc_alloc_init(SXViewportConditionValidator);
}

SXSizeClassConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_55()
{
  return objc_alloc_init(SXSizeClassConditionValidator);
}

SXColumnConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_56()
{
  return objc_alloc_init(SXColumnConditionValidator);
}

SXContentSizeCategoryValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_57()
{
  return objc_alloc_init(SXContentSizeCategoryValidator);
}

SXSubscriptionStatusConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_58()
{
  return objc_alloc_init(SXSubscriptionStatusConditionValidator);
}

SXSubscriptionActivationEligibilityConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_59()
{
  return objc_alloc_init(SXSubscriptionActivationEligibilityConditionValidator);
}

SXOfferUpsellScenarioConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_60()
{
  return objc_alloc_init(SXOfferUpsellScenarioConditionValidator);
}

SXTestingConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_61()
{
  return objc_alloc_init(SXTestingConditionValidator);
}

SXViewLocationConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_62()
{
  return objc_alloc_init(SXViewLocationConditionValidator);
}

SXForwardCompatibleConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_63()
{
  return objc_alloc_init(SXForwardCompatibleConditionValidator);
}

SXPreferredColorSchemeConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_64()
{
  return objc_alloc_init(SXPreferredColorSchemeConditionValidator);
}

SXNewsletterConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_65()
{
  return objc_alloc_init(SXNewsletterConditionValidator);
}

SXConfiguredConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_66()
{
  return objc_alloc_init(SXConfiguredConditionValidator);
}

SXAppConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_67()
{
  return objc_alloc_init(SXAppConditionValidator);
}

SXComponentMergerClassProvider *__32__SXDOMAssembly_loadInRegistry___block_invoke_68()
{
  return objc_alloc_init(SXComponentMergerClassProvider);
}

SXLineBalancingSettings *__32__SXDOMAssembly_loadInRegistry___block_invoke_69()
{
  return -[SXLineBalancingSettings initWithLineBalancingEnabled:]([SXLineBalancingSettings alloc], "initWithLineBalancingEnabled:", 0);
}

SXDarkModePolicyHandler *__32__SXDOMAssembly_loadInRegistry___block_invoke_70(uint64_t a1, void *a2)
{
  id v2;
  SXDarkModePolicyHandler *v3;
  void *v4;
  void *v5;
  SXDarkModePolicyHandler *v6;

  v2 = a2;
  v3 = [SXDarkModePolicyHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3AE48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXDarkModePolicyHandler initWithDocumentProvider:darkModeConfiguration:](v3, "initWithDocumentProvider:darkModeConfiguration:", v4, v5);
  return v6;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPolicyException:", v6);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPolicyException:", v7);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addPolicyException:", v8);
}

SXDarkModeConfiguration *__32__SXDOMAssembly_loadInRegistry___block_invoke_72()
{
  return -[SXDarkModeConfiguration initWithAutoDarkModeEnabled:inversionBehavior:saturationThreshold:colors:]([SXDarkModeConfiguration alloc], "initWithAutoDarkModeEnabled:inversionBehavior:saturationThreshold:colors:", 0, 2, 0, 1.0);
}

SXFullscreenCaptionDarkModePolicyException *__32__SXDOMAssembly_loadInRegistry___block_invoke_73()
{
  return objc_alloc_init(SXFullscreenCaptionDarkModePolicyException);
}

SXNamespacedObjectFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_74()
{
  return objc_alloc_init(SXNamespacedObjectFactory);
}

SXTextContrastDarkModePolicyException *__32__SXDOMAssembly_loadInRegistry___block_invoke_75(uint64_t a1, void *a2)
{
  id v2;
  SXTextContrastDarkModePolicyException *v3;
  void *v4;
  void *v5;
  SXTextContrastDarkModePolicyException *v6;

  v2 = a2;
  v3 = [SXTextContrastDarkModePolicyException alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("ComponentTextStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXTextContrastDarkModePolicyException initWithComponentStyleMerger:componentTextStyleMerger:](v3, "initWithComponentStyleMerger:componentTextStyleMerger:", v4, v5);
  return v6;
}

SXGradientFillDarkModePolicyException *__32__SXDOMAssembly_loadInRegistry___block_invoke_76()
{
  return objc_alloc_init(SXGradientFillDarkModePolicyException);
}

@end
