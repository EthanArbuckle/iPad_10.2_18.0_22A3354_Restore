@implementation PKCoreSpotlightUtilities

+ (void)searchableItemForTransaction:(id)a3 passUniqueIdentifier:(id)a4 regions:(id)a5 tags:(id)a6 keywords:(id)a7 imageGenerator:(id)a8 contactResolver:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  __CFString *v71;
  void *v72;
  __CFString *v73;
  uint64_t v74;
  __CFString *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __CFString *v82;
  void (**v83)(_QWORD);
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
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
  double latitude;
  double longitude;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void (**v142)(_QWORD);
  void *v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  _QWORD v157[4];
  id v158;
  id v159;
  void (**v160)(_QWORD);
  _QWORD v161[4];
  id v162;
  id v163;
  id v164;
  void (**v165)(_QWORD);
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD aBlock[4];
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  _BYTE v176[128];
  _QWORD v177[5];
  CLLocationCoordinate2D v178;

  v177[2] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v155 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (v22)
  {
    v151 = v18;
    v23 = v19;
    v145 = v21;
    v149 = v20;
    +[PKPaymentTransactionPresentation presentationInformationForTransaction:transactionSource:secondaryTransactionSource:familyMember:account:deviceName:context:](PKPaymentTransactionPresentation, "presentationInformationForTransaction:transactionSource:secondaryTransactionSource:familyMember:account:deviceName:context:", v16, 0, 0, 0, 0, 0, 2);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.pktransaction"));
    objc_msgSend(v16, "merchant");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mapsMerchant");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v25;
    objc_msgSend(v25, "mapsBrand");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke;
    aBlock[3] = &unk_1E2ACA840;
    v175 = a1;
    v147 = v16;
    v26 = v16;
    v171 = v26;
    v172 = v17;
    v27 = v24;
    v173 = v27;
    v174 = v22;
    v142 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v26, "transactionDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAddedDate:", v28);

    objc_msgSend(v26, "transactionStatusChangedDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v27;
    if (v29)
    {
      objc_msgSend(v26, "transactionDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v177[0] = v30;
      objc_msgSend(v26, "transactionStatusChangedDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v177[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setImportantDates:", v32);

    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionAmount"), 1, 1, 0, 0);
    objc_msgSend(v26, "amount");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = (void *)v33;
    objc_msgSend(v27, "setValue:forCustomKey:", v34, v33);

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionCurrencyCode"), 1, 1, 0, 0);
    objc_msgSend(v26, "currencyCode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = (void *)v35;
    objc_msgSend(v27, "setValue:forCustomKey:", v36, v35);

    v37 = objc_msgSend(v26, "transactionType");
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionType"), 1, 1, 0, 0);
    v132 = v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)v38;
    objc_msgSend(v27, "setValue:forCustomKey:", v39, v38);

    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionStatus"), 1, 1, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "transactionStatus"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (void *)v40;
    objc_msgSend(v27, "setValue:forCustomKey:", v41, v40);

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionSource"), 1, 1, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "effectiveTransactionSource"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = (void *)v42;
    objc_msgSend(v27, "setValue:forCustomKey:", v43, v42);

    if (v154)
    {
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_POImuid"), 1, 1, 0, 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v154, "identifier"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringValue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setValue:forCustomKey:", v46, v44);

    }
    v47 = v23;
    if (v153)
    {
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_Brandmuid"), 1, 1, 0, 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v153, "identifier"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringValue");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setValue:forCustomKey:", v50, v48);

    }
    v146 = v17;
    v144 = v22;
    v150 = v23;
    if (objc_msgSend(v155, "count"))
    {
      v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v53 = v155;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v166, v176, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v167;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v167 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v58, "type"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addObject:", v59);

            objc_msgSend(v58, "localizedTitle");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v60)
              objc_msgSend(v52, "addObject:", v60);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v166, v176, 16);
        }
        while (v55);
      }

      v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionTags"), 1, 1, 0, 1);
      objc_msgSend(v51, "allObjects");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setValue:forCustomKey:", v62, v61);

      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionTagKeywords"), 1, 1, 0, 1);
      objc_msgSend(v52, "allObjects");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setValue:forCustomKey:", v64, v63);

      v47 = v150;
    }
    if (objc_msgSend(v47, "count"))
      objc_msgSend(v156, "setKeywords:", v47);
    objc_msgSend(v26, "identifier");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionIdentifier"), 1, 1, 0, 0);
      objc_msgSend(v156, "setValue:forCustomKey:", v65, v66);

    }
    objc_msgSend(v26, "transactionSourceIdentifier");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    if (v135)
    {
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionSourceIdentifier"), 1, 1, 0, 0);
      objc_msgSend(v26, "transactionSourceIdentifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setValue:forCustomKey:", v68, v67);

    }
    objc_msgSend(v26, "altDSID");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionAltDSID"), 1, 1, 0, 0);
      objc_msgSend(v156, "setValue:forCustomKey:", v69, v70);

    }
    v136 = (void *)v65;
    v134 = (void *)v69;
    if (objc_msgSend(v26, "transactionType") == 3)
    {
      objc_msgSend(v152, "secondaryString");
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "tertiaryString");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v71;
      v74 = -[__CFString length](v71, "length");
      v18 = v151;
      if (v74)
      {
        v75 = &stru_1E2ADF4C0;
        if (objc_msgSend(&stru_1E2ADF4C0, "length"))
        {
          objc_msgSend(&stru_1E2ADF4C0, "stringByAppendingString:", CFSTR("\n"));
          v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        -[__CFString stringByAppendingFormat:](v75, "stringByAppendingFormat:", CFSTR("%@"), v73);
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v76 = &stru_1E2ADF4C0;
      }
      if (objc_msgSend(v72, "length"))
      {
        if (-[__CFString length](v76, "length"))
        {
          -[__CFString stringByAppendingString:](v76, "stringByAppendingString:", CFSTR("\n"));
          v85 = objc_claimAutoreleasedReturnValue();

          v76 = (__CFString *)v85;
        }
        -[__CFString stringByAppendingFormat:](v76, "stringByAppendingFormat:", CFSTR("%@"), v72);
        v86 = objc_claimAutoreleasedReturnValue();

        v76 = (__CFString *)v86;
      }
      v133 = v72;
      objc_msgSend(v156, "setContentDescription:", v76);
      objc_msgSend(v26, "peerPaymentCounterpartHandle");
      v87 = objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        v88 = (void *)v87;
        v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionHandle"), 1, 1, 0, 0);
        objc_msgSend(v156, "setValue:forCustomKey:", v88, v89);
        v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionSubType"), 1, 1, 0, 0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "peerPaymentType"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setValue:forCustomKey:", v91, v90);

        v18 = v151;
        v161[0] = MEMORY[0x1E0C809B0];
        v161[1] = 3221225472;
        v161[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_2;
        v161[3] = &unk_1E2ACA868;
        v92 = v88;
        v162 = v92;
        v163 = v156;
        v164 = v26;
        v83 = v142;
        v165 = v142;
        v21 = v145;
        objc_msgSend(v145, "contactForHandle:withCompletion:", v92, v161);

        v20 = v149;
      }
      else
      {
        v83 = v142;
        v142[2](v142);
        v92 = 0;
        v20 = v149;
        v21 = v145;
      }
      v103 = v153;
LABEL_86:

      v17 = v146;
      v22 = v144;
      v19 = v150;
      goto LABEL_87;
    }
    objc_msgSend(v152, "primaryString");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setDisplayName:", v78);

    objc_msgSend(v152, "secondaryString");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "tertiaryString");
    v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "badgeString");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v79;
    if (objc_msgSend(v79, "length"))
    {
      v82 = &stru_1E2ADF4C0;
      v83 = v142;
      if (objc_msgSend(&stru_1E2ADF4C0, "length"))
      {
        objc_msgSend(&stru_1E2ADF4C0, "stringByAppendingString:", CFSTR("\n"));
        v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v84 = v156;
      -[__CFString stringByAppendingFormat:](v82, "stringByAppendingFormat:", CFSTR("%@"), v81);
      v73 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v73 = &stru_1E2ADF4C0;
      v84 = v156;
      v83 = v142;
    }
    if (-[__CFString length](v76, "length"))
    {
      if (-[__CFString length](v73, "length"))
      {
        -[__CFString stringByAppendingString:](v73, "stringByAppendingString:", CFSTR("\n"));
        v93 = objc_claimAutoreleasedReturnValue();

        v73 = (__CFString *)v93;
      }
      -[__CFString stringByAppendingFormat:](v73, "stringByAppendingFormat:", CFSTR("%@"), v76);
      v94 = objc_claimAutoreleasedReturnValue();

      v73 = (__CFString *)v94;
    }
    v133 = v81;
    objc_msgSend(v84, "setContentDescription:", v73);
    if (objc_msgSend(v80, "length"))
      objc_msgSend(v84, "setComment:", v80);
    v143 = v80;
    objc_msgSend(v26, "merchant");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "category");

    if (v96 && v132 <= 0xE && ((1 << v132) & 0x4003) != 0)
    {
      v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionCategory"), 1, 1, 0, 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v96);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setValue:forCustomKey:", v98, v97);

    }
    objc_msgSend(v154, "postalAddress");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "locality");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v26, "locality");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setCity:", v101);

      objc_msgSend(v26, "administrativeArea");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setStateOrProvince:", v102);
    }
    else
    {
      if (!v99)
      {
LABEL_61:
        objc_msgSend(v26, "preferredLocation");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v109;
        if (v109)
        {
          objc_msgSend(v109, "coordinate");
          latitude = v178.latitude;
          longitude = v178.longitude;
          if (CLLocationCoordinate2DIsValid(v178))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", latitude);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setLatitude:", v113);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", longitude);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setLongitude:", v114);

          }
        }
        if (objc_msgSend(v151, "count"))
        {
          v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionRegions"), 1, 1, 0, 1);
          objc_msgSend(v151, "valueForKey:", CFSTR("identifier"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "setValue:forCustomKey:", v116, v115);

        }
        objc_msgSend(v148, "originURL");
        v117 = (void *)objc_claimAutoreleasedReturnValue();

        if (v117)
        {
          objc_msgSend(v148, "originURL");
          v118 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v154, "url");
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (v119)
          {
            v120 = v154;
          }
          else
          {
            objc_msgSend(v153, "url");
            v121 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v121)
            {
LABEL_74:
              objc_msgSend(v26, "rewards");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "rewardsItems");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = objc_msgSend(v124, "count");

              if (v125)
              {
                objc_msgSend(v123, "totalEligibleValueForUnit:", 1);
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = v126;
                if (v126 && (objc_msgSend(v126, "pk_isZeroNumber") & 1) == 0)
                {
                  v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionRewardsPercentAggregate"), 1, 1, 0, 0);
                  objc_msgSend(v156, "setValue:forCustomKey:", v127, v128);

                }
                objc_msgSend(v123, "totalEligibleValueForUnit:", 2);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                v130 = v129;
                if (v129 && (objc_msgSend(v129, "pk_isZeroNumber") & 1) == 0)
                {
                  v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_transactionRewardsCashAggregate"), 1, 1, 0, 0);
                  objc_msgSend(v156, "setValue:forCustomKey:", v130, v131);

                  v16 = v147;
                }

              }
              v18 = v151;
              if (v149)
              {
                v157[0] = MEMORY[0x1E0C809B0];
                v157[1] = 3221225472;
                v157[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_4;
                v157[3] = &unk_1E2ACA890;
                v158 = v156;
                v160 = v83;
                v159 = v149;
                objc_msgSend(v159, "imageDataForTransaction:size:completion:", v26, v157, 75.0, 75.0);

              }
              else
              {
                v83[2](v83);
              }
              v21 = v145;
              v103 = v153;

              v20 = v149;
              v92 = v143;
              goto LABEL_86;
            }
            v120 = v153;
          }
          objc_msgSend(v120, "url");
          v118 = objc_claimAutoreleasedReturnValue();
        }
        v122 = (void *)v118;
        objc_msgSend(v156, "setURL:", v118);

        goto LABEL_74;
      }
      objc_msgSend(v99, "street");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setThoroughfare:", v104);

      objc_msgSend(v99, "city");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setCity:", v105);

      objc_msgSend(v99, "state");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setStateOrProvince:", v106);

      objc_msgSend(v99, "country");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setCountry:", v107);

      objc_msgSend(v99, "postalCode");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setPostalCode:", v108);

      objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v99, 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setFullyFormattedAddress:", v102);
    }

    goto LABEL_61;
  }
LABEL_87:

}

void __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0CA6B48]);
  v3 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spotlightIdentifierForTransactionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExpirationDate:", v6);

  +[PKAppIntentUtilities associateSearchableItem:withEntityForTransaction:](PKAppIntentUtilities, "associateSearchableItem:withEntityForTransaction:", v7, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_3;
  block[3] = &unk_1E2ABE260;
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:](PKPeerPaymentCounterpartHandleFormatter, "displayNameForCounterpartHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setDisplayName:", v2);
  v3 = *(void **)(a1 + 48);
  v16[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountHandles:", v4);

  v5 = objc_alloc(MEMORY[0x1E0CA6B10]);
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDisplayName:handles:handleIdentifier:", v2, v6, v7);

  if (v8)
  {
    v9 = objc_msgSend(*(id *)(a1 + 56), "peerPaymentType");
    if (v9 == 2)
    {
      v12 = *(void **)(a1 + 48);
      v13 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAuthors:", v11);
      goto LABEL_6;
    }
    if (v9 == 1)
    {
      v10 = *(void **)(a1 + 48);
      v14 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPrimaryRecipients:", v11);
LABEL_6:

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __142__PKCoreSpotlightUtilities_searchableItemForTransaction_passUniqueIdentifier_regions_tags_keywords_imageGenerator_contactResolver_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailData:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (void)searchableItemForPass:(id)a3 completion:(id)a4
{
  +[PKCoreSpotlightUtilities searchableItemForPass:passKitServicesXPCService:completion:](PKCoreSpotlightUtilities, "searchableItemForPass:passKitServicesXPCService:completion:", a3, 0, a4);
}

+ (void)searchableItemForPass:(id)a3 passKitServicesXPCService:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  int v41;
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
  id v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
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
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  _QWORD v106[13];
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    goto LABEL_47;
  v94 = a1;
  v98 = v10;
  objc_msgSend(v8, "paymentPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.pkpass"));
  objc_msgSend(v8, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDisplayName:", v14);

  v97 = v9;
  if (v11)
  {
    objc_msgSend(v11, "cobrandName");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v107[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlternateNames:", v17);

    }
    if (objc_msgSend(v11, "isTransitPass"))
    {
      v18 = CFSTR("TRANSIT_CARD");
    }
    else if (objc_msgSend(v11, "isAccessPass"))
    {
      v18 = CFSTR("ACCESS_BADGE");
    }
    else
    {
      if (objc_msgSend(v11, "isIdentityPass"))
      {
        PKLocalizedIdentityString(CFSTR("GOVERNMENT_ID"), 0);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v19 = v21;
        if (objc_msgSend(v11, "hasAssociatedPeerPaymentAccount"))
        {
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_CASH"), 0);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v106[0] = v90;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_SEND_CASH"), 0);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v106[1] = v88;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_SEND_MONEY"), 0);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v106[2] = v86;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_SEND_APPLE_CASH"), 0);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v106[3] = v84;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_REQUEST_CASH"), 0);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v106[4] = v82;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_REQUEST_MONEY"), 0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v106[5] = v80;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_REQUEST_APPLE_CASH"), 0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v106[6] = v78;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_RECEIVE_MONEY"), 0);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v106[7] = v76;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_GET_MONEY"), 0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v106[8] = v74;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_CASH_CARD"), 0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v106[9] = v72;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_APPLE_CASH_CARD"), 0);
          v95 = v19;
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v106[10] = v22;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_APPLE_CASH_FAMILY"), 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v24 = v11;
          v25 = v16;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v106[11] = v26;
          PKLocalizedPeerPaymentString(CFSTR("SPOTLIGHT_KEYWORD_ALLOWANCE"), 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v106[12] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 13);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v25;
          v11 = v24;

          v19 = v95;
          objc_msgSend(v12, "setKeywords:", v29);

        }
        v20 = &unk_1E2C3ED58;
        goto LABEL_17;
      }
      v18 = CFSTR("PAYMENT_CARD");
    }
    PKLocalizedPaymentString(&v18->isa, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v8, "localizedName");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = &unk_1E2C3ED70;
LABEL_17:
  v96 = (void *)v19;
  objc_msgSend(v12, "setContentDescription:", v19);
  v30 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v12, "setUserOwned:", MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v12, "setUserCurated:", v30);
  objc_msgSend(v8, "organizationName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCreator:", v31);

  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("Passbook_isPaymentPass"), 1, 1, 0, 0);
  objc_msgSend(v12, "setValue:forCustomKey:", v20);
  if (v11)
  {
    PKSanitizedPrimaryAccountRepresentationForPass(v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
      objc_msgSend(v12, "setPrimaryAccountNumberSuffix:", v32);
    objc_msgSend(v11, "localizedValueForFieldKey:", CFSTR("contactNumber"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      v105 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPhoneNumbers:", v34);

      objc_msgSend(v12, "setSupportsPhoneCall:", MEMORY[0x1E0C9AAB0]);
    }
    objc_msgSend(v11, "localizedValueForFieldKey:", CFSTR("contactEmail"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      v104 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRecipientEmailAddresses:", v36);

    }
    v37 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "uniqueID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("wallet://%@/%@/%@"), CFSTR("card"), v38, CFSTR("details"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCardDetailsActionURL:", v40);

    if (objc_msgSend(v11, "cardType") == 1 && !objc_msgSend(v11, "activationState"))
    {
      v41 = objc_msgSend(v11, "isAppleCardPass");
      v42 = (void *)MEMORY[0x1E0CB3940];
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wallet://%@/%@"), CFSTR("credit"), CFSTR("numbers"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "uniqueID");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR("wallet://%@/%@/%@"), CFSTR("card"), v91, CFSTR("cardInformation"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCardNumberActionURL:", v44);

    }
    if (objc_msgSend(v11, "isAppleCardPass") && !objc_msgSend(v11, "activationState"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wallet://%@/%@"), CFSTR("credit"), CFSTR("billPayment"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPayBalanceActionURL:", v46);

    }
  }
  objc_msgSend(v8, "ingestedDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAddedDate:", v47);
  if (!v11)
  {
    objc_msgSend(v8, "webServiceURL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v8, "modifiedDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContentModificationDate:", v49);

    }
  }
  objc_msgSend(v8, "relevantDates");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "count"))
  {
    objc_msgSend(v50, "pk_arrayByApplyingBlock:", &__block_literal_global_79);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImportantDates:", v51);

  }
  objc_msgSend(v8, "embeddedLocationsArray");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "count") == 1)
  {
    objc_msgSend(v52, "firstObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "name");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNamedLocation:", v54);

    objc_msgSend(v12, "setSupportsNavigation:", MEMORY[0x1E0C9AAB0]);
    v55 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v53, "latitude");
    objc_msgSend(v55, "numberWithDouble:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLatitude:", v56);

    v57 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v53, "longitude");
    objc_msgSend(v57, "numberWithDouble:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLongitude:", v58);

    if (objc_msgSend(v53, "hasAltitude"))
    {
      v59 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v53, "altitude");
      objc_msgSend(v59, "numberWithDouble:");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAltitude:", v60);

    }
  }
  objc_msgSend(v8, "groupingID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_alloc(MEMORY[0x1E0CA6B48]);
  objc_msgSend(v94, "spotlightIdentifierForPassUniqueIdentifier:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v63, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v64, v61, v12);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setExpirationDate:", v66);

  +[PKAppIntentUtilities associateSearchableItem:withEntityForPass:](PKAppIntentUtilities, "associateSearchableItem:withEntityForPass:", v65, v8);
  v9 = v97;
  if (v97)
  {
    PKPassViewFrontSize(objc_msgSend(v8, "style"));
    v9 = v97;
    +[PKCoreSpotlightUtilities _thumbnailImageSizeForSourceImageSize:](PKCoreSpotlightUtilities, "_thumbnailImageSizeForSourceImageSize:");
    v68 = v67;
    v70 = v69;
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __87__PKCoreSpotlightUtilities_searchableItemForPass_passKitServicesXPCService_completion___block_invoke_2;
    v99[3] = &unk_1E2ACA8D8;
    v100 = v12;
    v103 = v98;
    v101 = v65;
    v102 = v97;
    objc_msgSend(v102, "snapshotDataForPassUniqueIdentifier:size:completion:", v62, v99, v68, v70);

  }
  else
  {
    (*((void (**)(id, void *))v98 + 2))(v98, v65);
  }

  v10 = v98;
LABEL_47:

}

uint64_t __87__PKCoreSpotlightUtilities_searchableItemForPass_passKitServicesXPCService_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "earliestDate");
}

uint64_t __87__PKCoreSpotlightUtilities_searchableItemForPass_passKitServicesXPCService_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailData:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (void)searchableItemForCardNumberFromPass:(id)a3 completion:(id)a4
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void (**v109)(id, void *);
  _QWORD v110[14];

  v110[12] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = (objc_class *)MEMORY[0x1E0CA6B50];
    v109 = (void (**)(id, void *))a4;
    v104 = a3;
    v6 = (void *)objc_msgSend([v5 alloc], "initWithItemContentType:", CFSTR("com.apple.pkpassdetail"));
    objc_msgSend(v104, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v6;
    objc_msgSend(v6, "setDisplayName:", v7);

    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_ITEM_DESCRIPTION"), 2, 0, v8, v9, v10, v11, v12, v90);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentDescription:", v13);

    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_CARD_NUMBERS"), 2, 0, v14, v15, v16, v17, v18, v91);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v106;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_INFO"), 2, 0, v19, v20, v21, v22, v23, v92);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v105;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_NAME"), 2, 0, v24, v25, v26, v27, v28, v93);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v110[2] = v103;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_CVV"), 2, 0, v29, v30, v31, v32, v33, v94);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v110[3] = v34;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_CVC"), 2, 0, v35, v36, v37, v38, v39, v95);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v110[4] = v40;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_SECURITY_CODE"), 2, 0, v41, v42, v43, v44, v45, v96);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v110[5] = v46;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_CODE"), 2, 0, v47, v48, v49, v50, v51, v97);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v110[6] = v52;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_EXPIRATION"), 2, 0, v53, v54, v55, v56, v57, v98);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v110[7] = v58;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_EXPIRE"), 2, 0, v59, v60, v61, v62, v63, v99);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v110[8] = v64;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_NETWORK"), 2, 0, v65, v66, v67, v68, v69, v100);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v110[9] = v70;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_ADVANCED_FRAUD_PROTECTION"), 2, 0, v71, v72, v73, v74, v75, v101);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v110[10] = v76;
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SPOTLIGHT_CARD_ADVANCED_FRAUD_PROTECTION"), 2, 0, v77, v78, v79, v80, v81, v102);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v110[11] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 12);
    v83 = objc_claimAutoreleasedReturnValue();

    v84 = (void *)v83;
    objc_msgSend(v107, "setKeywords:", v83);
    objc_msgSend(v104, "groupingID");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "uniqueID");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "spotlightIdentifierForCardInformationUniqueIdentifier:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v87, v85, v107);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setExpirationDate:", v89);

    v109[2](v109, v88);
  }
}

+ (CGSize)_thumbnailImageSizeForSourceImageSize:(CGSize)result
{
  double v3;

  v3 = result.width / result.height;
  if (fabs(result.width / result.height + -1.0) >= 0.1)
  {
    if (result.height <= result.width)
    {
      if (result.width > 180.0)
        result.width = 180.0;
      result.height = ceil(result.width / v3);
    }
    else
    {
      if (result.height > 270.0)
        result.height = 270.0;
      result.width = ceil(v3 * result.height);
    }
  }
  else
  {
    if (result.width <= result.height)
      result.width = result.height;
    if (result.width > 180.0)
      result.width = 180.0;
    result.height = result.width;
  }
  return result;
}

+ (id)spotlightIdentifierForCardInformationUniqueIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("card-information-"), a3);
}

+ (id)passUniqueIdentifierFromCardInformationSpotlightIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("card-information-")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("card-information-"), &stru_1E2ADF4C0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)spotlightIdentifierForPassUniqueIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("pass-"), a3);
}

+ (id)passUniqueIdentifierFromSpotlightIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("pass-")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("pass-"), &stru_1E2ADF4C0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)spotlightIdentifierForTransactionIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("transaction-"), a3);
}

+ (id)transactionIdentifierFromSpotlightIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("transaction-")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("transaction-"), &stru_1E2ADF4C0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
