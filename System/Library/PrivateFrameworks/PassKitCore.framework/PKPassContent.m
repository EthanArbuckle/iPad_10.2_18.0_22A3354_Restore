@implementation PKPassContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerBindingInformation, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_cardholderInfoSectionTitle, 0);
  objc_storeStrong((id *)&self->_barcodeSettings, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_allSemantics, 0);
  objc_storeStrong((id *)&self->_semantics, 0);
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_additionalInfoFields, 0);
  objc_storeStrong((id *)&self->_autoTopUpFields, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationSections, 0);
  objc_storeStrong((id *)&self->_passDetailSections, 0);
  objc_storeStrong((id *)&self->_backFieldBuckets, 0);
  objc_storeStrong((id *)&self->_frontFieldBuckets, 0);
  objc_storeStrong((id *)&self->_logoText, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassContent;
  v4 = a3;
  -[PKContent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitType, CFSTR("transitType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_logoText, CFSTR("logoText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_frontFieldBuckets, CFSTR("frontFieldBuckets"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backFieldBuckets, CFSTR("backFieldBuckets"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_balanceFields, CFSTR("balanceFields"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_autoTopUpFields, CFSTR("autoTopUpFields"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_additionalInfoFields, CFSTR("additionalInfoFields"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_balances, CFSTR("balances"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passDetailSections, CFSTR("passDetailSections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_auxiliaryPassInformationSections, CFSTR("auxiliaryPassInformation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_personalization, CFSTR("personalization"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_semantics, CFSTR("semantics"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allSemantics, CFSTR("allSemantics"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_businessChatIdentifier, CFSTR("businessChatIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_barcodeSettings, CFSTR("barcodeSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardholderInfoSectionTitle, CFSTR("cardholderInfoSectionTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_features, CFSTR("supportedFeatures"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoProfile, CFSTR("fidoProfile"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerBindingInformation, CFSTR("issuerBindingData"));

}

- (NSString)logoText
{
  return self->_logoText;
}

- (PKPassContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKPassContent *v13;
  void *v14;
  void *v15;
  void *v16;
  PKBarcode *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  PKPassContent *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  PKPassDetailSection *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  PKPassAuxiliaryPassInformation *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t n;
  void *v89;
  void *v90;
  void *v91;
  PKPassBarcodeSettings *v92;
  void *v93;
  PKPassBarcodeSettings *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  NSDictionary *features;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t ii;
  PKPassBalance *v109;
  void *v110;
  PKFidoProfile *v111;
  void *v112;
  PKFidoProfile *v113;
  void *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void (**v122)(void *, void *);
  id v123;
  id v124;
  id v125;
  void *v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  PKPassContent *v135;
  id v136;
  id obj;
  id v138;
  uint64_t v139;
  char v140;
  id v141;
  id v142;
  uint64_t v143;
  void *v144;
  id v145;
  uint64_t v146;
  void *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[4];
  id v153;
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
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _QWORD aBlock[4];
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  unint64_t v189;
  char v190;
  char v191;
  objc_super v192;
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _QWORD v196[2];
  _BYTE v197[128];
  _QWORD v198[2];
  _QWORD v199[2];
  _QWORD v200[2];
  _QWORD v201[2];
  _BYTE v202[128];
  _BYTE v203[128];
  id v204;
  _QWORD v205[4];
  _BYTE v206[128];
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v192.receiver = self;
  v192.super_class = (Class)PKPassContent;
  v13 = -[PKContent initWithDictionary:bundle:privateBundle:passType:](&v192, sel_initWithDictionary_bundle_privateBundle_passType_, v10, v11, v12, a6);
  if (v13)
  {
    objc_msgSend(v11, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKPrivateObjectDictionaryWithError(v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKContent barcode](v13, "barcode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = -[PKBarcode initWithPassDictionary:bundle:]([PKBarcode alloc], "initWithPassDictionary:bundle:", v15, v12);
      -[PKContent setBarcode:](v13, "setBarcode:", v17);

    }
    objc_msgSend(v10, "PKStringForKey:", CFSTR("logoText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v18, v11, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    -[PKPassContent setLogoText:](v13, "setLogoText:", v19);
    PKPassStyleDictionaryKeyForCardDictionary(v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v20);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v20);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = PKPassStyleFromString(v20);
    v134 = v10;
    v135 = v13;
    v130 = v15;
    v131 = v12;
    v118 = (void *)v19;
    v119 = v18;
    v117 = v20;
    if (v21 < 2)
    {
      v22 = 0;
      v140 = 1;
    }
    else if (v21 - 6 >= 2)
    {
      if (v21 == 4)
      {
        objc_msgSend(v132, "objectForKey:", CFSTR("transitType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v24 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (int)_PKEnumValueFromString(v23, v25, (uint64_t)CFSTR("PKTransitType"), CFSTR("PKTransitTypeGeneric, WLTransitTypeGeneric, PKTransitTypeAir, WLTransitTypeAir, PKTransitTypeTrain, WLTransitTypeTrain, PKTransitTypeBus, WLTransitTypeBus, PKTransitTypeBoat, WLTransitTypeBoat"), v26, v27, v28, v29, 0);

        v11 = v24;
        -[PKPassContent setTransitType:](v13, "setTransitType:", v30);

      }
      v22 = 0;
      v140 = 0;
    }
    else
    {
      v140 = 0;
      v22 = 1;
    }
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v142 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v145 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke;
    aBlock[3] = &unk_1E2ADB5C8;
    v120 = v11;
    v37 = v11;
    v179 = v37;
    v38 = v131;
    v190 = v22;
    v180 = v38;
    v189 = a6;
    v128 = v31;
    v181 = v128;
    v133 = v32;
    v182 = v133;
    v191 = v140;
    v127 = v33;
    v183 = v127;
    v39 = v34;
    v184 = v39;
    v138 = v35;
    v185 = v138;
    v125 = v36;
    v186 = v125;
    v124 = v142;
    v187 = v124;
    v123 = v145;
    v188 = v123;
    v122 = (void (**)(void *, void *))_Block_copy(aBlock);
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    objc_msgSend(v134, "objectForKey:", CFSTR("backFields"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v174, v206, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v175;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v175 != v43)
            objc_enumerationMutation(v40);
          _FieldForTypeWithDictionaryAndBundle(4, *(void **)(*((_QWORD *)&v174 + 1) + 8 * i), v37, v38, 1, v22, a6);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
            objc_msgSend(v138, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v174, v206, 16);
      }
      while (v42);
    }

    v122[2](v122, v132);
    v122[2](v122, v129);
    v205[0] = v133;
    v205[1] = v128;
    v205[2] = v127;
    v126 = v39;
    v205[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v205, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v135;
    -[PKPassContent setFrontFieldBuckets:](v135, "setFrontFieldBuckets:", v46);

    v204 = v138;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v204, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassContent setBackFieldBuckets:](v135, "setBackFieldBuckets:", v48);

    -[PKPassContent setBalanceFields:](v135, "setBalanceFields:", v125);
    -[PKPassContent setAutoTopUpFields:](v135, "setAutoTopUpFields:", v124);
    -[PKPassContent setAdditionalInfoFields:](v135, "setAdditionalInfoFields:", v123);
    +[PKPassPersonalization passPersonalizationWithPassBundle:](PKPassPersonalization, "passPersonalizationWithPassBundle:", v37);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassContent setPersonalization:](v135, "setPersonalization:", v49);

    v136 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v22)
    {
      v172 = 0u;
      v173 = 0u;
      v170 = 0u;
      v171 = 0u;
      objc_msgSend(v132, "objectForKey:", CFSTR("passDetailSections"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v170, v203, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v171;
        do
        {
          for (j = 0; j != v52; ++j)
          {
            if (*(_QWORD *)v171 != v53)
              objc_enumerationMutation(v50);
            v55 = -[PKPassDetailSection initWithDictionary:allowedRows:bundle:privateBundle:]([PKPassDetailSection alloc], "initWithDictionary:allowedRows:bundle:privateBundle:", *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * j), 0, v37, v38);
            objc_msgSend(v136, "safelyAddObject:", v55);

          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v170, v203, 16);
        }
        while (v52);
      }

      v47 = v135;
    }
    v56 = (void *)objc_msgSend(v136, "copy");
    -[PKPassContent setPassDetailSections:](v47, "setPassDetailSections:", v56);

    v141 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    objc_msgSend(v130, "objectForKey:", CFSTR("auxiliaryPassInformation"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v166, v202, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v167;
      do
      {
        for (k = 0; k != v59; ++k)
        {
          if (*(_QWORD *)v167 != v60)
            objc_enumerationMutation(v57);
          v62 = -[PKPassAuxiliaryPassInformation initWithInformation:bundle:privateBundle:passType:]([PKPassAuxiliaryPassInformation alloc], "initWithInformation:bundle:privateBundle:passType:", *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * k), v37, v38, a6);
          objc_msgSend(v141, "safelyAddObject:", v62);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v166, v202, 16);
      }
      while (v59);
    }

    v63 = (void *)objc_msgSend(v141, "copy");
    -[PKPassContent setAuxiliaryPassInformationSections:](v135, "setAuxiliaryPassInformationSections:", v63);

    if (!objc_msgSend(v133, "count"))
    {
      objc_msgSend(v134, "objectForKey:", CFSTR("topRightBackgroundTitle"));
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v64;
      if (v64)
      {
        v200[0] = CFSTR("key");
        v200[1] = CFSTR("value");
        v201[0] = CFSTR("top_right_background_title");
        v201[1] = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v201, v200, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        _FieldForTypeWithDictionaryAndBundle(0, v66, v37, v38, 0, v22, a6);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "addObject:", v67);

      }
    }
    if (!objc_msgSend(v126, "count"))
    {
      objc_msgSend(v134, "objectForKey:", CFSTR("topLeftBackgroundTitle"));
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = (void *)v68;
      if (v68)
      {
        v198[0] = CFSTR("key");
        v198[1] = CFSTR("value");
        v199[0] = CFSTR("top_left_background_title");
        v199[1] = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, v198, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        _FieldForTypeWithDictionaryAndBundle(3, v70, v37, v38, 0, v22, a6);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "addObject:", v71);

      }
    }
    objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("semantics"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassSemanticsFromDictionary(v116, 0, v37, v38);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassContent setSemantics:](v135, "setSemantics:");
    v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    -[PKPassContent backFieldBuckets](v135, "backFieldBuckets");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v196[0] = v73;
    -[PKPassContent frontFieldBuckets](v135, "frontFieldBuckets");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v196[1] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v75;
    v143 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v162, v197, 16);
    if (v143)
    {
      v139 = *(_QWORD *)v163;
      do
      {
        v76 = 0;
        do
        {
          if (*(_QWORD *)v163 != v139)
            objc_enumerationMutation(obj);
          v146 = v76;
          v77 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v76);
          v158 = 0u;
          v159 = 0u;
          v160 = 0u;
          v161 = 0u;
          v78 = v77;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v158, v195, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v159;
            do
            {
              for (m = 0; m != v80; ++m)
              {
                if (*(_QWORD *)v159 != v81)
                  objc_enumerationMutation(v78);
                v83 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * m);
                v154 = 0u;
                v155 = 0u;
                v156 = 0u;
                v157 = 0u;
                v84 = v83;
                v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v154, v194, 16);
                if (v85)
                {
                  v86 = v85;
                  v87 = *(_QWORD *)v155;
                  do
                  {
                    for (n = 0; n != v86; ++n)
                    {
                      if (*(_QWORD *)v155 != v87)
                        objc_enumerationMutation(v84);
                      objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * n), "semantics");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v89)
                        objc_msgSend(v72, "addEntriesFromDictionary:", v89);

                    }
                    v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v154, v194, 16);
                  }
                  while (v86);
                }

              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v158, v195, 16);
            }
            while (v80);
          }

          v76 = v146 + 1;
        }
        while (v146 + 1 != v143);
        v143 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v197, 16);
      }
      while (v143);
    }

    v90 = (void *)objc_msgSend(v121, "mutableCopy");
    objc_msgSend(v90, "addEntriesFromDictionary:", v72);
    v13 = v135;
    -[PKPassContent setAllSemantics:](v135, "setAllSemantics:", v90);
    v10 = v134;
    objc_msgSend(v134, "PKStringForKey:", CFSTR("businessChatIdentifier"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassContent setBusinessChatIdentifier:](v135, "setBusinessChatIdentifier:", v91);

    v92 = [PKPassBarcodeSettings alloc];
    objc_msgSend(v134, "PKDictionaryForKey:", CFSTR("barcodeSettings"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = -[PKPassBarcodeSettings initWithDictionary:](v92, "initWithDictionary:", v93);
    -[PKPassContent setBarcodeSettings:](v135, "setBarcodeSettings:", v94);

    objc_msgSend(v134, "PKStringForKey:", CFSTR("cardholderInfoSectionTitle"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassContent setCardholderInfoSectionTitle:](v135, "setCardholderInfoSectionTitle:", v95);

    v96 = objc_opt_class();
    objc_msgSend(v134, "PKDictionaryOfKeyClass:valueClass:ForKey:", v96, objc_opt_class(), CFSTR("supportedFeatures"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v152[0] = MEMORY[0x1E0C809B0];
    v152[1] = 3221225472;
    v152[2] = __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke_2;
    v152[3] = &unk_1E2AC28F0;
    v99 = v98;
    v153 = v99;
    objc_msgSend(v97, "enumerateKeysAndObjectsUsingBlock:", v152);
    if (objc_msgSend(v99, "count"))
    {
      v100 = objc_msgSend(v99, "copy");
      features = v135->_features;
      v135->_features = (NSDictionary *)v100;

    }
    objc_msgSend(v134, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("balances"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      v144 = v97;
      v147 = v90;
      v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v102, "count"));
      v148 = 0u;
      v149 = 0u;
      v150 = 0u;
      v151 = 0u;
      v104 = v102;
      v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v148, v193, 16);
      if (v105)
      {
        v106 = v105;
        v107 = *(_QWORD *)v149;
        do
        {
          for (ii = 0; ii != v106; ++ii)
          {
            if (*(_QWORD *)v149 != v107)
              objc_enumerationMutation(v104);
            v109 = -[PKPassBalance initWithDictionary:]([PKPassBalance alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * ii));
            objc_msgSend(v103, "addObject:", v109);

          }
          v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v148, v193, 16);
        }
        while (v106);
      }

      v110 = (void *)objc_msgSend(v103, "copy");
      v13 = v135;
      -[PKPassContent setBalances:](v135, "setBalances:", v110);

      v10 = v134;
      v97 = v144;
      v90 = v147;
    }
    v111 = [PKFidoProfile alloc];
    objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("fidoProfile"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = -[PKFidoProfile initWithDictionary:](v111, "initWithDictionary:", v112);
    -[PKPassContent setFidoProfile:](v13, "setFidoProfile:", v113);

    objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("issuerBindingData"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassContent setIssuerBindingInformation:](v13, "setIssuerBindingInformation:", v114);

    v11 = v120;
    v12 = v131;
  }

  return v13;
}

void __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  PKPassField *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ii;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t jj;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t kk;
  void *v54;
  uint64_t v55;
  BOOL v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t mm;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t nn;
  void *v68;
  void *v69;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
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
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    objc_msgSend(v3, "objectForKey:", CFSTR("primaryFields"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v107, v120, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v108 != v8)
            objc_enumerationMutation(v5);
          _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((_QWORD *)&v107 + 1) + 8 * i), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v107, v120, 16);
      }
      while (v7);
    }

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    objc_msgSend(v4, "objectForKey:", CFSTR("headerFields"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v104;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v104 != v14)
            objc_enumerationMutation(v11);
          _FieldForTypeWithDictionaryAndBundle(0, *(void **)(*((_QWORD *)&v103 + 1) + 8 * j), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
      }
      while (v13);
    }

    if (*(_BYTE *)(a1 + 121))
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      objc_msgSend(v4, "objectForKey:", CFSTR("secondaryFields"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v96;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v96 != v20)
              objc_enumerationMutation(v17);
            _FieldForTypeWithDictionaryAndBundle(3, *(void **)(*((_QWORD *)&v95 + 1) + 8 * k), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(*(id *)(a1 + 72), "addObject:", v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
        }
        while (v19);
      }

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      obj = *(id *)(a1 + 48);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
      if (v23)
      {
        v24 = v23;
        v69 = v4;
        v25 = *(_QWORD *)v92;
        do
        {
          for (m = 0; m != v24; ++m)
          {
            if (*(_QWORD *)v92 != v25)
              objc_enumerationMutation(obj);
            v27 = *(id *)(*((_QWORD *)&v91 + 1) + 8 * m);
            v28 = objc_alloc_init(PKPassField);
            -[PKPassField setType:](v28, "setType:", 2);
            objc_msgSend(v27, "label");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "key");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "stringByAppendingString:", CFSTR(".labelField"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPassField setKey:](v28, "setKey:", v31);

            -[PKPassField setUnformattedValue:](v28, "setUnformattedValue:", v29);
            if (v28)
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v28);

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
        }
        while (v24);
        v4 = v69;
      }
    }
    else
    {
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      objc_msgSend(v4, "objectForKey:", CFSTR("secondaryFields"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v100;
        do
        {
          for (n = 0; n != v33; ++n)
          {
            if (*(_QWORD *)v100 != v34)
              objc_enumerationMutation(obj);
            _FieldForTypeWithDictionaryAndBundle(2, *(void **)(*((_QWORD *)&v99 + 1) + 8 * n), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v36);

          }
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
        }
        while (v33);
      }
    }

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v4, "objectForKey:", CFSTR("auxiliaryFields"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v88;
      do
      {
        for (ii = 0; ii != v39; ++ii)
        {
          if (*(_QWORD *)v88 != v40)
            objc_enumerationMutation(v37);
          _FieldForTypeWithDictionaryAndBundle(3, *(void **)(*((_QWORD *)&v87 + 1) + 8 * ii), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(*(id *)(a1 + 72), "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
      }
      while (v39);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(v4, "objectForKey:", CFSTR("backFields"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v114, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v84;
      do
      {
        for (jj = 0; jj != v45; ++jj)
        {
          if (*(_QWORD *)v84 != v46)
            objc_enumerationMutation(v43);
          _FieldForTypeWithDictionaryAndBundle(4, *(void **)(*((_QWORD *)&v83 + 1) + 8 * jj), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
            objc_msgSend(*(id *)(a1 + 80), "addObject:", v48);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v114, 16);
      }
      while (v45);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v4, "objectForKey:", CFSTR("balanceFields"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v79, v113, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v80;
      do
      {
        for (kk = 0; kk != v51; ++kk)
        {
          if (*(_QWORD *)v80 != v52)
            objc_enumerationMutation(v49);
          _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((_QWORD *)&v79 + 1) + 8 * kk), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "foreignReferenceType");
          if (v54)
            v56 = (unint64_t)(v55 - 1) > 1;
          else
            v56 = 1;
          if (!v56)
            objc_msgSend(*(id *)(a1 + 88), "addObject:", v54);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v79, v113, 16);
      }
      while (v51);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v4, "objectForKey:", CFSTR("autoTopUpFields"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v75, v112, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v76;
      do
      {
        for (mm = 0; mm != v59; ++mm)
        {
          if (*(_QWORD *)v76 != v60)
            objc_enumerationMutation(v57);
          _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((_QWORD *)&v75 + 1) + 8 * mm), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
            objc_msgSend(*(id *)(a1 + 96), "addObject:", v62);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v75, v112, 16);
      }
      while (v59);
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v4, "objectForKey:", CFSTR("additionalInfoFields"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v71, v111, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v72;
      do
      {
        for (nn = 0; nn != v65; ++nn)
        {
          if (*(_QWORD *)v72 != v66)
            objc_enumerationMutation(v63);
          _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((_QWORD *)&v71 + 1) + 8 * nn), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 112));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
            objc_msgSend(*(id *)(a1 + 104), "addObject:", v68);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v71, v111, 16);
      }
      while (v65);
    }

  }
}

- (NSArray)frontFieldBuckets
{
  return self->_frontFieldBuckets;
}

- (void)setLogoText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)backFieldBuckets
{
  return self->_backFieldBuckets;
}

- (void)setSemantics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setPersonalization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setPassDetailSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setIssuerBindingInformation:(id)a3
{
  objc_storeStrong((id *)&self->_issuerBindingInformation, a3);
}

- (void)setFrontFieldBuckets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setFidoProfile:(id)a3
{
  objc_storeStrong((id *)&self->_fidoProfile, a3);
}

- (void)setCardholderInfoSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setBusinessChatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setBarcodeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeSettings, a3);
}

- (void)setBalanceFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setBackFieldBuckets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setAuxiliaryPassInformationSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setAutoTopUpFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setAllSemantics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKPassContent *v6;
  uint64_t v7;
  NSString *logoText;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *frontFieldBuckets;
  uint64_t v14;
  NSArray *backFieldBuckets;
  uint64_t v16;
  NSArray *balanceFields;
  uint64_t v18;
  NSArray *autoTopUpFields;
  uint64_t v20;
  NSArray *additionalInfoFields;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSSet *balances;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *passDetailSections;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *auxiliaryPassInformationSections;
  uint64_t v37;
  PKPassPersonalization *personalization;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSDictionary *semantics;
  uint64_t v45;
  NSDictionary *allSemantics;
  uint64_t v47;
  NSString *businessChatIdentifier;
  uint64_t v49;
  PKPassBarcodeSettings *barcodeSettings;
  uint64_t v51;
  NSString *cardholderInfoSectionTitle;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSDictionary *features;
  uint64_t v59;
  PKFidoProfile *fidoProfile;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSDictionary *issuerBindingInformation;
  objc_super v67;

  v4 = a3;
  v5 = (void *)MEMORY[0x19400CFE8]();
  v67.receiver = self;
  v67.super_class = (Class)PKPassContent;
  v6 = -[PKContent initWithCoder:](&v67, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_transitType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transitType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoText"));
    v7 = objc_claimAutoreleasedReturnValue();
    logoText = v6->_logoText;
    v6->_logoText = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("frontFieldBuckets"));
    v12 = objc_claimAutoreleasedReturnValue();
    frontFieldBuckets = v6->_frontFieldBuckets;
    v6->_frontFieldBuckets = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("backFieldBuckets"));
    v14 = objc_claimAutoreleasedReturnValue();
    backFieldBuckets = v6->_backFieldBuckets;
    v6->_backFieldBuckets = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("balanceFields"));
    v16 = objc_claimAutoreleasedReturnValue();
    balanceFields = v6->_balanceFields;
    v6->_balanceFields = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("autoTopUpFields"));
    v18 = objc_claimAutoreleasedReturnValue();
    autoTopUpFields = v6->_autoTopUpFields;
    v6->_autoTopUpFields = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("additionalInfoFields"));
    v20 = objc_claimAutoreleasedReturnValue();
    additionalInfoFields = v6->_additionalInfoFields;
    v6->_additionalInfoFields = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("balances"));
    v25 = objc_claimAutoreleasedReturnValue();
    balances = v6->_balances;
    v6->_balances = (NSSet *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("passDetailSections"));
    v30 = objc_claimAutoreleasedReturnValue();
    passDetailSections = v6->_passDetailSections;
    v6->_passDetailSections = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("auxiliaryPassInformation"));
    v35 = objc_claimAutoreleasedReturnValue();
    auxiliaryPassInformationSections = v6->_auxiliaryPassInformationSections;
    v6->_auxiliaryPassInformationSections = (NSArray *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personalization"));
    v37 = objc_claimAutoreleasedReturnValue();
    personalization = v6->_personalization;
    v6->_personalization = (PKPassPersonalization *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("semantics"));
    v43 = objc_claimAutoreleasedReturnValue();
    semantics = v6->_semantics;
    v6->_semantics = (NSDictionary *)v43;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("allSemantics"));
    v45 = objc_claimAutoreleasedReturnValue();
    allSemantics = v6->_allSemantics;
    v6->_allSemantics = (NSDictionary *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessChatIdentifier"));
    v47 = objc_claimAutoreleasedReturnValue();
    businessChatIdentifier = v6->_businessChatIdentifier;
    v6->_businessChatIdentifier = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeSettings"));
    v49 = objc_claimAutoreleasedReturnValue();
    barcodeSettings = v6->_barcodeSettings;
    v6->_barcodeSettings = (PKPassBarcodeSettings *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderInfoSectionTitle"));
    v51 = objc_claimAutoreleasedReturnValue();
    cardholderInfoSectionTitle = v6->_cardholderInfoSectionTitle;
    v6->_cardholderInfoSectionTitle = (NSString *)v51;

    v53 = (void *)MEMORY[0x1E0C99E60];
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    objc_msgSend(v53, "setWithObjects:", v54, v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("supportedFeatures"));
    v57 = objc_claimAutoreleasedReturnValue();
    features = v6->_features;
    v6->_features = (NSDictionary *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoProfile"));
    v59 = objc_claimAutoreleasedReturnValue();
    fidoProfile = v6->_fidoProfile;
    v6->_fidoProfile = (PKFidoProfile *)v59;

    v61 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v63, CFSTR("issuerBindingData"));
    v64 = objc_claimAutoreleasedReturnValue();
    issuerBindingInformation = v6->_issuerBindingInformation;
    v6->_issuerBindingInformation = (NSDictionary *)v64;

  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

void __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKPassFeatureConfiguration *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[PKPassFeatureConfiguration initWithDictionary:]([PKPassFeatureConfiguration alloc], "initWithDictionary:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

- (void)flushFormattedFieldValues
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v3 = self->_frontFieldBuckets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v34;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v13++), "flushCachedValue");
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v5);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_backFieldBuckets;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v18);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v26;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v26 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24++), "flushCachedValue");
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
          }
          while (v22);
        }

        ++v18;
      }
      while (v18 != v16);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v16);
  }

}

- (NSArray)primaryFields
{
  void *v3;

  if (-[NSArray count](self->_frontFieldBuckets, "count") < 2)
  {
    v3 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_frontFieldBuckets, "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (int64_t)transitType
{
  return self->_transitType;
}

- (void)setTransitType:(int64_t)a3
{
  self->_transitType = a3;
}

- (NSArray)passDetailSections
{
  return self->_passDetailSections;
}

- (NSArray)auxiliaryPassInformationSections
{
  return self->_auxiliaryPassInformationSections;
}

- (NSArray)balanceFields
{
  return self->_balanceFields;
}

- (NSArray)autoTopUpFields
{
  return self->_autoTopUpFields;
}

- (NSArray)additionalInfoFields
{
  return self->_additionalInfoFields;
}

- (void)setAdditionalInfoFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSSet)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKPassPersonalization)personalization
{
  return self->_personalization;
}

- (NSDictionary)semantics
{
  return self->_semantics;
}

- (NSDictionary)allSemantics
{
  return self->_allSemantics;
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (PKPassBarcodeSettings)barcodeSettings
{
  return self->_barcodeSettings;
}

- (NSString)cardholderInfoSectionTitle
{
  return self->_cardholderInfoSectionTitle;
}

- (NSDictionary)features
{
  return self->_features;
}

- (PKFidoProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (NSDictionary)issuerBindingInformation
{
  return self->_issuerBindingInformation;
}

@end
