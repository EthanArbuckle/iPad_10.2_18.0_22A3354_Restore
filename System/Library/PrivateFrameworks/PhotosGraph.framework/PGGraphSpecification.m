@implementation PGGraphSpecification

- (PGGraphSpecification)init
{
  PGGraphSpecification *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGGraphSpecification;
  v2 = -[MAGraphSpecification init](&v4, sel_init);
  if (v2)
  {
    -[MAGraphSpecification setDefaultNodeClass:](v2, "setDefaultNodeClass:", objc_opt_class());
    -[MAGraphSpecification setDefaultEdgeClass:](v2, "setDefaultEdgeClass:", objc_opt_class());
  }
  return v2;
}

- (id)nodeClassByDomainAndLabel
{
  if (nodeClassByDomainAndLabel_onceToken != -1)
    dispatch_once(&nodeClassByDomainAndLabel_onceToken, &__block_literal_global_10794);
  return (id)nodeClassByDomainAndLabel_nodeClassByDomainAndLabel;
}

- (id)nodeClassByDomain
{
  if (nodeClassByDomain_onceToken != -1)
    dispatch_once(&nodeClassByDomain_onceToken, &__block_literal_global_190);
  return (id)nodeClassByDomain_nodeClassByDomain;
}

- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;

  v4 = a4;
  v6 = a3;
  if (!v6)
    goto LABEL_3;
  -[PGGraphSpecification nodeClassByDomainAndLabel](self, "nodeClassByDomainAndLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_msgSend(v9, "objectForKeyedSubscript:", v6);

  if (!v10)
  {
LABEL_3:
    -[PGGraphSpecification nodeClassByDomain](self, "nodeClassByDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v11, "objectForKeyedSubscript:", v12);

    if (!v10)
      v10 = -[MAGraphSpecification defaultNodeClass](self, "defaultNodeClass");
  }
  v13 = v10;

  return v13;
}

- (void)enumerateNodeClassesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PGGraphSpecification nodeClassByDomainAndLabel](self, "nodeClassByDomainAndLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke;
  v12[3] = &unk_1E8429000;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[PGGraphSpecification nodeClassByDomain](self, "nodeClassByDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_3;
  v10[3] = &unk_1E8429028;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

}

- (id)edgeClassByDomainAndLabel
{
  if (edgeClassByDomainAndLabel_onceToken != -1)
    dispatch_once(&edgeClassByDomainAndLabel_onceToken, &__block_literal_global_213);
  return (id)edgeClassByDomainAndLabel_edgeClassByDomainAndLabel;
}

- (id)edgeClassByDomain
{
  if (edgeClassByDomain_onceToken != -1)
    dispatch_once(&edgeClassByDomain_onceToken, &__block_literal_global_280_10713);
  return (id)edgeClassByDomain_edgeClassByDomain;
}

- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;

  v4 = a4;
  v6 = a3;
  if (!v6)
    goto LABEL_3;
  -[PGGraphSpecification edgeClassByDomainAndLabel](self, "edgeClassByDomainAndLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_msgSend(v9, "objectForKeyedSubscript:", v6);

  if (!v10)
  {
LABEL_3:
    -[PGGraphSpecification edgeClassByDomain](self, "edgeClassByDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v11, "objectForKeyedSubscript:", v12);

    if (!v10)
      v10 = -[MAGraphSpecification defaultEdgeClass](self, "defaultEdgeClass");
  }
  v13 = v10;

  return v13;
}

- (void)enumerateEdgeClassesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PGGraphSpecification edgeClassByDomainAndLabel](self, "edgeClassByDomainAndLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke;
  v12[3] = &unk_1E8429000;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[PGGraphSpecification edgeClassByDomain](self, "edgeClassByDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_3;
  v10[3] = &unk_1E8429028;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E8428FD8;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

uint64_t __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, (unsigned __int16)objc_msgSend(a2, "unsignedIntegerValue"), a3);
}

void __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  (*(void (**)(uint64_t, id, _QWORD, uint64_t))(v4 + 16))(v4, v6, (unsigned __int16)objc_msgSend(v5, "unsignedIntegerValue"), a3);

}

void __41__PGGraphSpecification_edgeClassByDomain__block_invoke()
{
  void *v0;

  v0 = (void *)edgeClassByDomain_edgeClassByDomain;
  edgeClassByDomain_edgeClassByDomain = MEMORY[0x1E0C9AA70];

}

void __49__PGGraphSpecification_edgeClassByDomainAndLabel__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
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
  const __CFString *v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[13];
  _QWORD v87[13];
  const __CFString *v88;
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  const __CFString *v92;
  uint64_t v93;
  _QWORD v94[2];
  _QWORD v95[2];
  const __CFString *v96;
  uint64_t v97;
  _QWORD v98[2];
  _QWORD v99[2];
  const __CFString *v100;
  uint64_t v101;
  _QWORD v102[9];
  _QWORD v103[9];
  const __CFString *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[17];
  _QWORD v119[17];
  _QWORD v120[22];
  _QWORD v121[22];
  const __CFString *v122;
  uint64_t v123;
  _QWORD v124[2];
  _QWORD v125[2];
  const __CFString *v126;
  uint64_t v127;
  const __CFString *v128;
  uint64_t v129;
  const __CFString *v130;
  uint64_t v131;
  _QWORD v132[2];
  _QWORD v133[2];
  const __CFString *v134;
  uint64_t v135;
  const __CFString *v136;
  uint64_t v137;
  _QWORD v138[34];
  _QWORD v139[36];

  v139[34] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 501);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v69;
  v136 = CFSTR("POI");
  v137 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v68;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 502);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v67;
  v134 = CFSTR("ROI");
  v135 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v66;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 700);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v65;
  v132[0] = CFSTR("MEANING");
  v133[0] = objc_opt_class();
  v132[1] = CFSTR("SUBMEANING_OF");
  v133[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v64;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 702);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v138[3] = v63;
  v130 = CFSTR("MEANING");
  v131 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v139[3] = v62;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 701);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v138[4] = v61;
  v128 = CFSTR("PERSON_ACTIVITY_MEANING");
  v129 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v139[4] = v60;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 101);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v138[5] = v59;
  v126 = CFSTR("NEXT");
  v127 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v139[5] = v58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 102);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v138[6] = v57;
  v124[0] = CFSTR("CONTAINS");
  v125[0] = objc_opt_class();
  v124[1] = CFSTR("GROUP_CONTAINS");
  v125[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v139[6] = v56;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 103);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v138[7] = v55;
  v122 = CFSTR("HAS_TYPE");
  v123 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v139[7] = v54;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 300);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v138[8] = v53;
  v120[0] = CFSTR("PRESENT");
  v121[0] = objc_opt_class();
  v120[1] = CFSTR("CPRESENT");
  v121[1] = objc_opt_class();
  v120[2] = CFSTR("PARTNER");
  v121[2] = objc_opt_class();
  v120[3] = CFSTR("FATHER");
  v121[3] = objc_opt_class();
  v120[4] = CFSTR("MOTHER");
  v121[4] = objc_opt_class();
  v120[5] = CFSTR("BROTHER");
  v121[5] = objc_opt_class();
  v120[6] = CFSTR("SISTER");
  v121[6] = objc_opt_class();
  v120[7] = CFSTR("DAUGHTER");
  v121[7] = objc_opt_class();
  v120[8] = CFSTR("SON");
  v121[8] = objc_opt_class();
  v120[9] = CFSTR("PARENT");
  v121[9] = objc_opt_class();
  v120[10] = CFSTR("FAMILY");
  v121[10] = objc_opt_class();
  v120[11] = CFSTR("FAMILY_SOCIALGROUP");
  v121[11] = objc_opt_class();
  v120[12] = CFSTR("CHILD");
  v121[12] = objc_opt_class();
  v120[13] = CFSTR("FRIEND");
  v121[13] = objc_opt_class();
  v120[14] = CFSTR("COWORKER");
  v121[14] = objc_opt_class();
  v120[15] = CFSTR("COWORKER_SOCIALGROUP");
  v121[15] = objc_opt_class();
  v120[16] = CFSTR("ACQUAINTANCE");
  v121[16] = objc_opt_class();
  v120[17] = CFSTR("VIP");
  v121[17] = objc_opt_class();
  v120[18] = CFSTR("AUTHOR");
  v121[18] = objc_opt_class();
  v120[19] = CFSTR("IN_PROXIMITY");
  v121[19] = objc_opt_class();
  v120[20] = CFSTR("IS_AROUND");
  v121[20] = objc_opt_class();
  v120[21] = CFSTR("INFERRED_TO");
  v121[21] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 22);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v139[8] = v52;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 306);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v138[9] = v51;
  v118[0] = CFSTR("PARTNER");
  v119[0] = objc_opt_class();
  v118[1] = CFSTR("FATHER");
  v119[1] = objc_opt_class();
  v118[2] = CFSTR("MOTHER");
  v119[2] = objc_opt_class();
  v118[3] = CFSTR("BROTHER");
  v119[3] = objc_opt_class();
  v118[4] = CFSTR("SISTER");
  v119[4] = objc_opt_class();
  v118[5] = CFSTR("DAUGHTER");
  v119[5] = objc_opt_class();
  v118[6] = CFSTR("SON");
  v119[6] = objc_opt_class();
  v118[7] = CFSTR("PARENT");
  v119[7] = objc_opt_class();
  v118[8] = CFSTR("FAMILY");
  v119[8] = objc_opt_class();
  v118[9] = CFSTR("FAMILY_SOCIALGROUP");
  v119[9] = objc_opt_class();
  v118[10] = CFSTR("CHILD");
  v119[10] = objc_opt_class();
  v118[11] = CFSTR("FRIEND");
  v119[11] = objc_opt_class();
  v118[12] = CFSTR("COWORKER");
  v119[12] = objc_opt_class();
  v118[13] = CFSTR("COWORKER_SOCIALGROUP");
  v119[13] = objc_opt_class();
  v118[14] = CFSTR("ACQUAINTANCE");
  v119[14] = objc_opt_class();
  v118[15] = CFSTR("VIP");
  v119[15] = objc_opt_class();
  v118[16] = CFSTR("HOUSEHOLD_MEMBER");
  v119[16] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 17);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v139[9] = v50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 301);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v138[10] = v49;
  v116[0] = CFSTR("BIRTHDAY");
  v117[0] = objc_opt_class();
  v116[1] = CFSTR("ANNIVERSARY");
  v117[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v139[10] = v48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 302);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v138[11] = v47;
  v114[0] = CFSTR("SOCIALGROUP");
  v115[0] = objc_opt_class();
  v114[1] = CFSTR("BELONGSTO");
  v115[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v139[11] = v46;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 304);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v138[12] = v45;
  v112[0] = CFSTR("PET_IS_PRESENT");
  v113[0] = objc_opt_class();
  v112[1] = CFSTR("IS_OWNER_OF");
  v113[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v139[12] = v44;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 305);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v138[13] = v43;
  v110 = CFSTR("RELATIONSHIP_TAG");
  v111 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v139[13] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 600);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v138[14] = v41;
  v108 = CFSTR("SCENE");
  v109 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v139[14] = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 602);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v138[15] = v39;
  v106 = CFSTR("VISUAL_LOOKUP_SCENE");
  v107 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v139[15] = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 603);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v138[16] = v37;
  v104 = CFSTR("SCENE");
  v105 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v139[16] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 200);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v138[17] = v35;
  v102[0] = CFSTR("ADDRESS");
  v103[0] = objc_opt_class();
  v102[1] = CFSTR("REMOTE_ADDRESS");
  v103[1] = objc_opt_class();
  v102[2] = CFSTR("NUMBER");
  v103[2] = objc_opt_class();
  v102[3] = CFSTR("STREET");
  v103[3] = objc_opt_class();
  v102[4] = CFSTR("DISTRICT");
  v103[4] = objc_opt_class();
  v102[5] = CFSTR("CITY");
  v103[5] = objc_opt_class();
  v102[6] = CFSTR("COUNTY");
  v103[6] = objc_opt_class();
  v102[7] = CFSTR("STATE");
  v103[7] = objc_opt_class();
  v102[8] = CFSTR("COUNTRY");
  v103[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v139[17] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 201);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v138[18] = v33;
  v100 = CFSTR("AREA");
  v101 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v139[18] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 202);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v138[19] = v31;
  v98[0] = CFSTR("IS_OWNED_BY");
  v99[0] = objc_opt_class();
  v98[1] = CFSTR("IS_HOME_WORK");
  v99[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v139[19] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 203);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v138[20] = v29;
  v96 = CFSTR("MOBILITY");
  v97 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v139[20] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 204);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v138[21] = v27;
  v94[0] = CFSTR("AT");
  v95[0] = objc_opt_class();
  v94[1] = CFSTR("IN");
  v95[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v139[21] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 205);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v138[22] = v25;
  v92 = CFSTR("POPULAR_LANGUAGE");
  v93 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v139[22] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 503);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v138[23] = v23;
  v90 = CFSTR("BUSINESS");
  v91 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v139[23] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 303);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v138[24] = v21;
  v88 = CFSTR("PEOPLE_CONTACT_SUGGESTION");
  v89 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v139[24] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 400);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v138[25] = v19;
  v86[0] = CFSTR("DAY");
  v87[0] = objc_opt_class();
  v86[1] = CFSTR("MONTH");
  v87[1] = objc_opt_class();
  v86[2] = CFSTR("MONTH_DAY");
  v87[2] = objc_opt_class();
  v86[3] = CFSTR("YEAR");
  v87[3] = objc_opt_class();
  v86[4] = CFSTR("WEEKMONTH");
  v87[4] = objc_opt_class();
  v86[5] = CFSTR("WEEKYEAR");
  v87[5] = objc_opt_class();
  v86[6] = CFSTR("SEASON");
  v87[6] = objc_opt_class();
  v86[7] = CFSTR("DATE");
  v87[7] = objc_opt_class();
  v86[8] = CFSTR("PARTOFWEEK");
  v87[8] = objc_opt_class();
  v86[9] = CFSTR("DAYOFWEEK");
  v87[9] = objc_opt_class();
  v86[10] = CFSTR("PARTOFDAY");
  v87[10] = objc_opt_class();
  v86[11] = CFSTR("BDAY_MONTH_DAY");
  v87[11] = objc_opt_class();
  v86[12] = CFSTR("ANNIVERSARY_MONTH_DAY");
  v87[12] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v139[25] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 401);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v138[26] = v17;
  v84[0] = CFSTR("HOLIDAY");
  v85[0] = objc_opt_class();
  v84[1] = CFSTR("CELEBRATING");
  v85[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v139[26] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 900);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v138[27] = v15;
  v82[0] = CFSTR("PUBLIC_EVENT");
  v83[0] = objc_opt_class();
  v82[1] = CFSTR("PERFORMER");
  v83[1] = objc_opt_class();
  v82[2] = CFSTR("PUBLIC_EVENT_BUSINESS");
  v83[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v139[27] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 901);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v138[28] = v13;
  v80 = CFSTR("CATEGORY");
  v81 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v139[28] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 902);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v138[29] = v11;
  v78 = CFSTR("LOCALIZED_SUBCATEGORY");
  v79 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v139[29] = v0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 504);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v138[30] = v1;
  v76 = CFSTR("BUSINESSCATEGORY");
  v77 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v139[30] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v138[31] = v3;
  v74 = CFSTR("MUSIC_SESSION");
  v75 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v139[31] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v138[32] = v5;
  v72[0] = CFSTR("CONTAINS_ASSETS_FROM");
  v72[1] = CFSTR("MEMORY_FEATURES");
  v73[0] = objc_opt_class();
  v73[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v139[32] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1200);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v138[33] = v7;
  v70 = CFSTR("MOMENT_FEATURES");
  v71 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v139[33] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 34);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)edgeClassByDomainAndLabel_edgeClassByDomainAndLabel;
  edgeClassByDomainAndLabel_edgeClassByDomainAndLabel = v9;

}

void __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E8428FD8;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

uint64_t __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, (unsigned __int16)objc_msgSend(a2, "unsignedIntegerValue"), a3);
}

void __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  (*(void (**)(uint64_t, id, _QWORD, uint64_t))(v4 + 16))(v4, v6, (unsigned __int16)objc_msgSend(v5, "unsignedIntegerValue"), a3);

}

void __41__PGGraphSpecification_nodeClassByDomain__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v21[19];
  _QWORD v22[21];

  v22[19] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 103);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v20;
  v22[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 203);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 700);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v18;
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 701);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v17;
  v22[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 305);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  v22[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 600);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v15;
  v22[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 602);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v14;
  v22[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 601);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v13;
  v22[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 603);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v12;
  v22[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 200);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v0;
  v22[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 901);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v1;
  v22[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 902);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v2;
  v22[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 504);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v3;
  v22[12] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 501);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v4;
  v22[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 502);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[14] = v5;
  v22[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 202);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[15] = v6;
  v22[15] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[16] = v7;
  v22[16] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[17] = v8;
  v22[17] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1201);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[18] = v9;
  v22[18] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 19);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)nodeClassByDomain_nodeClassByDomain;
  nodeClassByDomain_nodeClassByDomain = v10;

}

void __49__PGGraphSpecification_nodeClassByDomainAndLabel__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  _QWORD v36[3];
  _QWORD v37[3];
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[2];
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  _QWORD v56[8];
  _QWORD v57[8];
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  _QWORD v62[12];
  _QWORD v63[12];
  _QWORD v64[2];
  _QWORD v65[2];
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  _QWORD v70[17];
  _QWORD v71[19];

  v71[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v35;
  v68 = CFSTR("Info");
  v69 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 100);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v33;
  v66 = CFSTR("Moment");
  v67 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 102);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v31;
  v64[0] = CFSTR("Highlight");
  v65[0] = objc_opt_class();
  v64[1] = CFSTR("HighlightGroup");
  v65[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 400);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v29;
  v62[0] = CFSTR("Date");
  v63[0] = objc_opt_class();
  v62[1] = CFSTR("DayOfWeek");
  v63[1] = objc_opt_class();
  v62[2] = CFSTR("Day");
  v63[2] = objc_opt_class();
  v62[3] = CFSTR("Month");
  v63[3] = objc_opt_class();
  v62[4] = CFSTR("MonthDay");
  v63[4] = objc_opt_class();
  v62[5] = CFSTR("Year");
  v63[5] = objc_opt_class();
  v62[6] = CFSTR("WeekMonth");
  v63[6] = objc_opt_class();
  v62[7] = CFSTR("WeekYear");
  v63[7] = objc_opt_class();
  v62[8] = CFSTR("PartOfDay");
  v63[8] = objc_opt_class();
  v62[9] = CFSTR("Season");
  v63[9] = objc_opt_class();
  v62[10] = CFSTR("Weekend");
  v63[10] = objc_opt_class();
  v62[11] = CFSTR("Weekday");
  v63[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 401);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v27;
  v60 = CFSTR("Holiday");
  v61 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 402);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v25;
  v58 = CFSTR("OverTheYears");
  v59 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 200);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v70[6] = v23;
  v56[0] = CFSTR("Address");
  v57[0] = objc_opt_class();
  v56[1] = CFSTR("Number");
  v57[1] = objc_opt_class();
  v56[2] = CFSTR("Street");
  v57[2] = objc_opt_class();
  v56[3] = CFSTR("District");
  v57[3] = objc_opt_class();
  v56[4] = CFSTR("City");
  v57[4] = objc_opt_class();
  v56[5] = CFSTR("County");
  v57[5] = objc_opt_class();
  v56[6] = CFSTR("State");
  v57[6] = objc_opt_class();
  v56[7] = CFSTR("Country");
  v57[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 201);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v70[7] = v21;
  v54 = CFSTR("Area");
  v55 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 204);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v70[8] = v19;
  v52 = CFSTR("FrequentLocation");
  v53 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 205);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v70[9] = v17;
  v50 = CFSTR("Language");
  v51 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 503);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70[10] = v15;
  v48 = CFSTR("Business");
  v49 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 300);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v70[11] = v13;
  v46[0] = CFSTR("People");
  v46[1] = CFSTR("Me");
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v71[11] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 303);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v70[12] = v11;
  v44 = CFSTR("Contact");
  v45 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v71[12] = v0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 302);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v70[13] = v1;
  v42 = CFSTR("SocialGroup");
  v43 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v71[13] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 900);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v70[14] = v3;
  v40[0] = CFSTR("PublicEvent");
  v40[1] = CFSTR("Performer");
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v71[14] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 304);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v70[15] = v5;
  v38 = CFSTR("Pet");
  v39 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v71[15] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70[16] = v7;
  v36[0] = CFSTR("MusicSession");
  v37[0] = objc_opt_class();
  v36[1] = CFSTR("MusicAlbum");
  v37[1] = objc_opt_class();
  v36[2] = CFSTR("MusicTrack");
  v37[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71[16] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 17);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)nodeClassByDomainAndLabel_nodeClassByDomainAndLabel;
  nodeClassByDomainAndLabel_nodeClassByDomainAndLabel = v9;

}

@end
