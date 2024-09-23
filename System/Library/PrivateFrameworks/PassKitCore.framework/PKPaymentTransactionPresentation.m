@implementation PKPaymentTransactionPresentation

+ (id)presentationInformationForTransaction:(id)a3 transactionSource:(id)a4 secondaryTransactionSource:(id)a5 familyMember:(id)a6 account:(id)a7 deviceName:(id)a8 context:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKPaymentTransactionPresentationInformation *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v26;
  int v27;
  uint64_t v28;
  _BOOL4 v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  char v64;
  void *v65;
  BOOL v66;
  uint64_t v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  int v72;
  __CFString *v74;
  void *v75;
  uint64_t v76;
  char v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  __CFString *v83;
  uint64_t v84;
  __CFString *v85;
  void *v86;
  uint64_t v87;
  __CFString *v88;
  void *v89;
  uint64_t v90;
  void *v91;
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
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  void *v113;
  void *v114;
  int v115;
  __CFString *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  id v131;
  __CFString *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  const __CFString *v146;
  NSDecimalNumber *v147;
  void *v148;
  uint64_t v149;
  NSDecimalNumber *v150;
  NSDecimalNumber *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  NSDecimalNumber *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  id v169;
  NSString *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  id v177;
  uint64_t v178;
  id v179;
  id v180;
  PKPaymentTransactionPresentationInformation *v181;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  __CFString *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  void *v202;
  __CFString *v203;
  void *v204;
  uint64_t v205;
  id v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  char v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  uint64_t v222;
  __CFString *v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  uint64_t v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  __CFString *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  __CFString *v250;
  uint64_t v251;
  __CFString *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  BOOL v256;
  id v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  void *v262;
  void *v263;
  id v264;
  id v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  __CFString *v285;
  id v286;
  void *v287;
  uint64_t v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  void *v296;
  void *v297;
  uint64_t v298;
  __CFString *v299;
  id v300;
  id v301;
  void *v302;
  uint64_t v303;
  void *v304;
  id v305;
  id v306;
  void *v307;
  char v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  id v313;
  __CFString *v314;
  void *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  uint64_t v322;
  char v323;
  uint64_t v324;
  int v325;
  id v326;
  id v327;
  void *v328;
  uint64_t v329;
  id v330;
  void *v331;
  id v332;
  unsigned int v333;
  _BOOL4 v334;
  _BOOL4 v335;
  id v336;
  id v337;
  __int128 v338;
  id v339;
  uint64_t v340;
  id v341;
  void *v342;
  void *v343;
  id v344;
  unsigned int v345;
  void *v346;
  void *v347;
  void *v348;
  id v349;
  void *v350;
  void *v351;
  id v352;
  void *v353;
  uint64_t v354;
  id v355;
  const __CFString *v356;
  uint64_t v357;
  id v358;
  void *v359;
  uint64_t v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  id v365;
  id v366;
  id v367;
  id v368;
  id v369;
  id v370;
  char v371;
  id v372;
  id v373;
  id v374;
  _BYTE v375[128];
  uint64_t v376;

  v376 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (objc_msgSend(v15, "isBankConnectTransaction"))
  {
    objc_msgSend(a1, "_presentationInformationForBankConnectTransaction:", v15);
    v21 = (PKPaymentTransactionPresentationInformation *)objc_claimAutoreleasedReturnValue();
    goto LABEL_259;
  }
  v349 = a1;
  v342 = v19;
  v343 = v20;
  objc_msgSend(v16, "paymentPass");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "transactionType");
  v23 = objc_msgSend(v15, "transactionStatus");
  v24 = objc_msgSend(v15, "transitType");
  v323 = objc_msgSend(v15, "transitModifiers");
  v324 = v24;
  v26 = v22 == 2 && v24 != 0;
  if ((objc_msgSend(v15, "hasNotificationServiceData") & 1) != 0)
  {
    v27 = 1;
  }
  else if (objc_msgSend(v15, "processedForLocation"))
  {
    v27 = objc_msgSend(v15, "processedForStations");
  }
  else
  {
    v27 = 0;
  }
  v325 = objc_msgSend(v15, "enRoute");
  v357 = objc_msgSend(v15, "featureIdentifier");
  if ((v26 & v27) == 1)
  {
    objc_msgSend(v15, "startStation");
    *((_QWORD *)&v338 + 1) = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endStation");
    *(_QWORD *)&v338 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v338 = 0uLL;
  }
  v28 = objc_msgSend(v15, "transactionType");
  v30 = a9 != 5 && v28 != 12;
  v335 = v30;
  v354 = v23;
  if (objc_msgSend(v15, "isRecurring"))
  {
    v31 = objc_msgSend(v15, "transactionType");
    v32 = CFSTR("arrow.triangle.2.circlepath");
    if (v31 == 6)
      v32 = 0;
    v356 = v32;
  }
  else
  {
    v356 = 0;
  }
  v33 = objc_msgSend(v15, "peerPaymentType");
  objc_msgSend(v15, "peerPaymentCounterpartHandle");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == 3)
  {
    v34 = objc_msgSend(v15, "peerPaymentPaymentMode");
    v35 = v356;
    if (v34 == 2)
      v35 = CFSTR("apple.cash.tap");
    v356 = v35;
  }
  objc_msgSend(v15, "amount");
  v36 = objc_claimAutoreleasedReturnValue();
  v344 = v18;
  if (v36)
  {
    v348 = (void *)v36;
    v37 = !v26;
    if (v22 == 3)
      v37 = 0;
    if (v37)
    {
      objc_msgSend(v15, "formattedBalanceAdjustmentAmount");
      v352 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v15, "formattedBalanceAdjustmentSubtotalAmount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v352 = v38;
      }
      else
      {
        objc_msgSend(v15, "formattedBalanceAdjustmentAmount");
        v352 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v15, "currencyCode");
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      goto LABEL_47;
LABEL_43:
    v336 = 0;
    v339 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v15, "amounts");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {

  }
  else
  {
    objc_msgSend(v15, "plans");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      v347 = 0;
      v348 = 0;
      v352 = 0;
      if (!v27)
        goto LABEL_43;
      goto LABEL_47;
    }
  }
  objc_msgSend(v15, "formattedStringForMultipleAmountsForPass:", v353);
  v352 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transactionAmountsForMultipleAmounts");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "amount");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "amount");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "currency");
  v347 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v344;
  if (!v27)
    goto LABEL_43;
LABEL_47:
  objc_msgSend(v15, "merchant");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "displayName");
  v339 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayLocation");
  v336 = (id)objc_claimAutoreleasedReturnValue();

LABEL_48:
  v340 = v33;
  if (objc_msgSend(v15, "transactionStatus") == 3)
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_TRANSACTION_REFUNDED"), 0);
    v51 = objc_claimAutoreleasedReturnValue();

    v52 = 0;
    v53 = 0;
    v54 = 1;
LABEL_50:
    v352 = (id)v51;
    goto LABEL_115;
  }
  if (v26 && (!v348 || !v347))
  {
    if (v354)
      v64 = 1;
    else
      v64 = v325;
    if ((v64 & 1) == 0)
    {
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAIL_PENDING"), 0);
      v67 = objc_claimAutoreleasedReturnValue();
LABEL_321:
      v51 = v67;

      v52 = 0;
      v54 = 0;
      v53 = 0;
      goto LABEL_50;
    }
    v52 = 0;
    if (v324 > 256)
    {
      v65 = v353;
      if ((unint64_t)(v324 - 257) >= 5)
      {
        if (v324 == 1025)
        {
          if ((v325 & 1) != 0)
            goto LABEL_85;
          v74 = CFSTR("TRANSIT_TRANSACTION_REDEEMED");
          goto LABEL_320;
        }
        if (v324 != 517)
          goto LABEL_114;
        if (v354)
        {
          if ((objc_msgSend(v353, "shouldSuppressNoChargeAmount") & 1) != 0)
            goto LABEL_85;
          objc_msgSend(v353, "devicePrimaryPaymentApplication");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "paymentNetworkIdentifier");

          if (v76 == 131)
            v74 = CFSTR("-");
          else
            v74 = CFSTR("TRANSIT_TRANSACTION_FARE_FREE");
          goto LABEL_320;
        }
        goto LABEL_319;
      }
    }
    else
    {
      v65 = v353;
      if ((unint64_t)(v324 - 1) >= 8)
        goto LABEL_114;
    }
    if ((v325 & 1) != 0)
      goto LABEL_85;
    if ((v323 & 1) != 0)
    {
      v74 = CFSTR("TRANSIT_TRANSACTION_FARE_PAID");
LABEL_320:
      PKLocalizedPaymentString(&v74->isa, 0);
      v67 = objc_claimAutoreleasedReturnValue();
      goto LABEL_321;
    }
    if ((v323 & 6) != 0)
    {
      _zeroCurrencyAmount(v65);
      v67 = objc_claimAutoreleasedReturnValue();
      goto LABEL_321;
    }
    if (v354)
    {
      v77 = objc_msgSend(v65, "shouldSuppressNoChargeAmount");
      v52 = 0;
      if ((v77 & 1) == 0)
      {
        v54 = 0;
        v53 = 0;
        if (v352)
          goto LABEL_115;
        PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_FARE_FREE"), 0);
        v352 = (id)objc_claimAutoreleasedReturnValue();
LABEL_85:
        v52 = 0;
        v54 = 0;
        v53 = 0;
        goto LABEL_115;
      }
LABEL_114:
      v54 = 0;
      v53 = 0;
      goto LABEL_115;
    }
LABEL_319:
    v74 = CFSTR("TRANSIT_TRANSACTION_PENDING");
    goto LABEL_320;
  }
  v52 = 0;
  if (!v348 || !v347)
    goto LABEL_114;
  if (a9 == 4)
  {
    v330 = v17;
    if (objc_msgSend(v15, "transactionType") == 8)
    {
      objc_msgSend(v15, "currencyAmount");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v342, "feature") == 5;
    }
    else
    {
      objc_msgSend(v15, "rewardsTotalCurrencyAmount");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v15, "redemptionType") == 3;
    }
    v68 = !v66;
    if (v56)
    {
      v326 = v16;
      objc_msgSend(v56, "formattedStringValue");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "amount");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "compare:", v70);

      if (v71 == -1)
        v72 = 0;
      else
        v72 = v68;
      if (v72 == 1)
      {
        v321 = (uint64_t)v63;
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"));
        v61 = objc_claimAutoreleasedReturnValue();
        v16 = v326;
        v17 = v330;
LABEL_92:
        v33 = v340;

        v352 = (id)v61;
        v18 = v344;
        goto LABEL_93;
      }
      v352 = v63;
      v16 = v326;
      v17 = v330;
      v18 = v344;
      v33 = v340;
    }
    else
    {
      v17 = v330;
    }
  }
  else
  {
    if (a9 != 3)
      goto LABEL_94;
    objc_msgSend(v15, "rewardsTotalCurrencyAmount");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v55)
    {
      objc_msgSend(v55, "amount");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "compare:", v58);

      objc_msgSend(v56, "formattedStringValue");
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (v59 == -1)
      {
        v63 = v352;
      }
      else
      {
        v321 = v60;
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"));
        v62 = objc_claimAutoreleasedReturnValue();

        v63 = (void *)v61;
        v61 = v62;
      }
      goto LABEL_92;
    }
  }
LABEL_93:

LABEL_94:
  v52 = 0;
  v54 = 0;
  v53 = 0;
  switch(v354)
  {
    case 0:
    case 8:
      v52 = 0;
      v53 = 0;
      v54 = v22 == 3 && v33 == 2;
      break;
    case 1:
      break;
    case 2:
      v52 = 1;
      goto LABEL_95;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
LABEL_95:
      v54 = 1;
      v53 = 1;
      break;
    default:
      goto LABEL_114;
  }
LABEL_115:
  v337 = v15;
  v333 = v53;
  v334 = v54;
  v345 = v52;
  if (a9 == 1)
  {
    if (v22 == 11)
    {
      objc_msgSend(v15, "transactionDate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      PKMonthAndYearStringFromDate(v78);
      v341 = (id)objc_claimAutoreleasedReturnValue();
LABEL_118:

LABEL_155:
      v358 = 0;
      goto LABEL_156;
    }
    v81 = v349;
    objc_msgSend(v349, "_relativeDateForTransaction:", v15);
    v82 = (id)objc_claimAutoreleasedReturnValue();
LABEL_127:
    v341 = v82;
    v358 = 0;
    goto LABEL_157;
  }
  if (v22 == 3)
  {
    if (objc_msgSend(v346, "length"))
    {
      if (objc_msgSend(v15, "peerPaymentPaymentMode") != 2)
      {
        +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:](PKPeerPaymentCounterpartHandleFormatter, "displayNameForCounterpartHandle:contact:", v346, 0);
        v80 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_154;
      }
      v79 = v346;
LABEL_123:
      v80 = v79;
LABEL_154:
      v341 = v80;
      goto LABEL_155;
    }
    if (v33 == 1)
    {
      v85 = CFSTR("PAYMENT_SUMMARY_PEER_PAYMENT_UNKNOWN_RECIPIENT_TITLE");
      goto LABEL_144;
    }
    if (v33 == 2)
    {
      v85 = CFSTR("PAYMENT_SUMMARY_PEER_PAYMENT_UNKNOWN_SENDER_TITLE");
LABEL_144:
      PKLocalizedPeerPaymentString(&v85->isa, 0);
      v80 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_154;
    }
    goto LABEL_136;
  }
  if ((unint64_t)(v22 - 5) <= 1)
  {
    v81 = v349;
    objc_msgSend((id)objc_opt_class(), "secondaryFundingSourceDescriptionForTransaction:secondarySource:includeBankAccountSuffix:useGenericNameIfNoDescriptionAvailable:", v15, v17, 0, 0);
    v82 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_127;
  }
  if (v22 == 11)
  {
    if (objc_msgSend(v342, "type") == 1)
    {
      v88 = CFSTR("TRANSACTION_TYPE_INTEREST_CHARGE");
LABEL_142:
      PKLocalizedPaymentString(&v88->isa, 0);
      v80 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_154;
    }
    v84 = objc_msgSend(v15, "featureIdentifier");
    v83 = CFSTR("TRANSACTION_TYPE_INTEREST_PAID");
LABEL_153:
    PKLocalizedFeatureString(v83, v84, 0, v46, v47, v48, v49, v50, v321);
    v80 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_154;
  }
  if (v22 == 10)
  {
    v83 = CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_TITLE");
LABEL_131:
    v84 = 2;
    goto LABEL_153;
  }
LABEL_136:
  if (!objc_msgSend(v15, "transactionType"))
  {
    objc_msgSend(v15, "payments");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "count");

    if (v92)
    {
      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_DISPLAY_NAME"), 2, 0, v93, v94, v95, v96, v97, v321);
      v341 = (id)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString(CFSTR("TRANSACTION_DETAIL_BILL_PAYMENT_TITLE"), 2, 0, v98, v99, v100, v101, v102, v322);
      v103 = objc_claimAutoreleasedReturnValue();
      goto LABEL_151;
    }
  }
  if (objc_msgSend(v15, "transactionType") == 15)
  {
    v79 = v339;
    if (!v339)
    {
      objc_msgSend(v15, "releasedData");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "verificationType");

      PKTransactionReleasedDataVerificationTypeToLocalizedTitle(v87);
      v80 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_154;
    }
    goto LABEL_123;
  }
  if (!objc_msgSend(v15, "transactionType"))
  {
    objc_msgSend(v15, "transfers");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v191, "count");

    if (v192)
    {
      v373 = 0;
      v374 = 0;
      v81 = v349;
      objc_msgSend(v349, "_transferFundingSourceInformationForTransaction:primaryString:secondaryString:", v15, &v374, &v373);
      v341 = v374;
      v358 = v373;
      goto LABEL_157;
    }
  }
  if (objc_msgSend(v15, "transactionType") == 7)
  {
    objc_msgSend(v15, "transfers");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "count");

    if (v90)
    {
      v372 = 0;
      v81 = v349;
      objc_msgSend(v349, "_transferFundingSourceInformationForTransaction:primaryString:secondaryString:", v15, &v372, 0);
      v82 = v372;
      goto LABEL_127;
    }
  }
  if (!objc_msgSend(v15, "transactionType") && objc_msgSend(v15, "accountType") == 1)
  {
    objc_msgSend(v15, "referenceIdentifier");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v186, "length");

    if (v187)
    {
      v88 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
      goto LABEL_142;
    }
  }
  if (!objc_msgSend(v15, "transactionType"))
  {
    objc_msgSend(v15, "recurringPeerPayment");
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if (v214)
    {
      objc_msgSend(v15, "merchant");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = objc_msgSend(v215, "hasMapsMatch");

      if ((v216 & 1) != 0)
      {
        objc_msgSend(v15, "merchant");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v217, "displayName");
        v341 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKLocalizedPeerPaymentString(CFSTR("APPLE_CASH"), 0);
        v341 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "recurringPeerPayment");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = objc_msgSend(v248, "type");

      if (v249 == 1)
      {
        v250 = CFSTR("TRANSACTION_DEBIT_RECURRING_PAYMENT");
      }
      else
      {
        if (v249 != 3)
          goto LABEL_155;
        v250 = CFSTR("TRANSACTION_DEBIT_AUTO_RELOAD");
      }
      PKLocalizedPeerPaymentRecurringString(&v250->isa, 0);
      v103 = objc_claimAutoreleasedReturnValue();
LABEL_151:
      v358 = (id)v103;
LABEL_156:
      v81 = v349;
      goto LABEL_157;
    }
  }
  if (objc_msgSend(v349, "transactionIsPaymentForPayLaterFinancingPlan:", v15))
  {
    objc_msgSend(v15, "merchant");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "displayName");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = v189;
    if (v189)
    {
      v341 = v189;
    }
    else
    {
      PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER"), 0);
      v341 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v15, "associatedFinancingPlan");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = v244;
    if (v244)
    {
      objc_msgSend(v244, "merchant");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "displayNamePurchase");
      v358 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v358 = 0;
    }

    goto LABEL_156;
  }
  if (objc_msgSend(v15, "transactionType") == 13)
    goto LABEL_304;
  if (objc_msgSend(v15, "transactionType") == 14)
  {
    objc_msgSend(v15, "installmentPlan");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "product");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "model");
    v341 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_118;
  }
  v256 = v357 == 4 || v26;
  if (!v256 && objc_msgSend(v339, "length"))
  {
LABEL_304:
    v79 = v339;
    goto LABEL_123;
  }
  switch(v22)
  {
    case 4:
      v88 = CFSTR("TRANSACTION_TYPE_FEE");
      goto LABEL_142;
    case 7:
      PKLocalizedTitleForTransactionWithAdjustment(v15);
      v80 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_154;
    case 8:
      objc_msgSend(v15, "redemptionEvent");
      v275 = (void *)objc_claimAutoreleasedReturnValue();

      if (v275)
      {
        v83 = CFSTR("TRANSACTION_REWARDS_TITLE");
        goto LABEL_131;
      }
      v88 = CFSTR("TRANSACTION_TYPE_DISBURSEMENT");
      goto LABEL_142;
    case 9:
      v83 = CFSTR("ACCOUNT_SERVICE_DISPLAY_NAME");
      goto LABEL_131;
    case 12:
      objc_msgSend(v15, "rewards");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v276, "rewardsItems");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v277, "firstObject");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = objc_msgSend(v278, "type");

      if (v279 == 6)
        v285 = CFSTR("TRANSACTION_REWARDS_REASON_ACTIVATION_OFFER");
      else
        v285 = CFSTR("TRANSACTION_REWARDS_REASON_OTHER");
      PKLocalizedFeatureString(v285, 2, 0, v280, v281, v282, v283, v284, v321);
      v341 = (id)objc_claimAutoreleasedReturnValue();
      v358 = 0;
      v18 = v344;
      goto LABEL_156;
    default:
      if (!v26)
      {
        if (v357 != 4 || !objc_msgSend(v339, "length"))
        {
          PKLocalizedPaymentString(CFSTR("PAYMENT_SUMMARY_NO_MERCHANT_TITLE"), 0);
          v289 = (id)objc_claimAutoreleasedReturnValue();
LABEL_489:
          v341 = v289;
          v358 = 0;
          goto LABEL_490;
        }
        goto LABEL_487;
      }
      if (v338 != 0)
      {
        v274 = (void *)*((_QWORD *)&v338 + 1);
        if ((_QWORD)v338)
          v274 = (void *)v338;
        goto LABEL_488;
      }
      if (objc_msgSend(v336, "length"))
      {
        v274 = v336;
LABEL_488:
        v289 = v274;
        goto LABEL_489;
      }
      if (objc_msgSend(v339, "length"))
      {
LABEL_487:
        v274 = v339;
        goto LABEL_488;
      }
      if (!objc_msgSend(v15, "transactionSource") && (v324 == 516 || v324 == 513))
      {
        objc_msgSend(v353, "organizationName");
        v289 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_489;
      }
      v358 = 0;
      v341 = 0;
LABEL_490:
      v18 = v344;
      v81 = v349;
LABEL_157:
      v104 = objc_msgSend(v15, "disputeStatus");
      v371 = 1;
      objc_msgSend(v81, "_statusAnnotationForTransaction:overloadAnnotation:", v15, &v371);
      v351 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v104 - 1) <= 4)
      {
        v105 = objc_msgSend(v15, "transactionType");
        v106 = objc_msgSend(v15, "disputeType");
        if ((unint64_t)(v104 - 1) < 3)
        {
          PKLocalizedFeatureString(CFSTR("TRANSACTION_DISPUTE_STATUS_IN_REVIEW"), 2, 0, v107, v108, v109, v110, v111, v321);
          v112 = (id)objc_claimAutoreleasedReturnValue();

LABEL_160:
          v355 = 0;
          v345 = 1;
LABEL_199:
          v358 = v112;
          goto LABEL_200;
        }
        if (v104 == 4)
        {
          if (v105 || v106 != 1)
            v132 = CFSTR("TRANSACTION_DISPUTE_STATUS_APPROVED");
          else
            v132 = CFSTR("TRANSACTION_DISPUTE_STATUS_CREDIT_APPLIED");
          PKLocalizedFeatureString(v132, 2, 0, v107, v108, v109, v110, v111, v321);
          v112 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_198;
        }
        if (v104 == 5)
        {
          if (v105 || v106 != 1)
          {
            v116 = CFSTR("TRANSACTION_DISPUTE_STATUS_REJECTED");
          }
          else
          {
            objc_msgSend(v15, "disputeStatusDetails");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "statusReasons");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v114, "containsObject:", CFSTR("splitLiability"));

            if (v115)
              v116 = CFSTR("TRANSACTION_DISPUTE_STATUS_CREDIT_APPLIED");
            else
              v116 = CFSTR("TRANSACTION_DISPUTE_STATUS_NO_CREDIT_APPLIED");
          }
          goto LABEL_194;
        }
        goto LABEL_400;
      }
      switch(v22)
      {
        case 14:
          PKLocalizedBeekmanString(CFSTR("APPLE_CARD_INSTALLMENTS"), 0);
          v117 = objc_claimAutoreleasedReturnValue();
LABEL_196:
          v112 = (id)v117;
LABEL_197:

LABEL_198:
          v355 = 0;
          goto LABEL_199;
        case 13:
          objc_msgSend(v15, "installmentPayment");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "localizedDisplay");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v119;
          if (v119)
          {
            v121 = v119;
            v122 = v358;
          }
          else
          {
            PKLocalizedBeekmanString(CFSTR("APPLE_CARD_INSTALLMENTS"), 0);
            v121 = (id)objc_claimAutoreleasedReturnValue();

            v122 = v121;
          }

          v355 = 0;
          v358 = v121;
          goto LABEL_200;
        case 11:
          if (objc_msgSend(v342, "type") == 1)
          {

            v355 = 0;
            v358 = 0;
            goto LABEL_200;
          }
          v133 = objc_msgSend(v15, "featureIdentifier");
          v116 = CFSTR("TRANSACTION_TYPE_TOP_UP");
          goto LABEL_195;
        case 3:
          v123 = objc_msgSend(v15, "peerPaymentType");
          switch(v123)
          {
            case 1:
              v193 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_SENT");
              goto LABEL_279;
            case 2:
              v193 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_RECEIVED");
LABEL_279:
              PKLocalizedPeerPaymentString(&v193->isa, 0);
              v194 = objc_claimAutoreleasedReturnValue();
              v355 = 0;
              v124 = v358;
              goto LABEL_415;
            case 3:
              PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_REQUEST"), 0);
              v195 = (void *)objc_claimAutoreleasedReturnValue();

              if (a9 == 1)
              {
                v355 = 0;
                v358 = v195;
                goto LABEL_416;
              }
              v360 = v123;
              objc_msgSend(v15, "expirationDate");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              PKStartOfDay(v219);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v218, "components:fromDate:toDate:options:", 16, v220, v124, 0);
              v221 = (void *)objc_claimAutoreleasedReturnValue();

              v222 = objc_msgSend(v221, "day");
              if (v222 == 1)
              {
                v223 = CFSTR("PEER_PAYMENT_PENDING_REQUEST_EXPIRATION_BADGE_VALUE_TOMORROW");
                goto LABEL_356;
              }
              if (!v222)
              {
                v223 = CFSTR("PEER_PAYMENT_PENDING_REQUEST_EXPIRATION_BADGE_VALUE_TODAY");
LABEL_356:
                PKLocalizedPeerPaymentString(&v223->isa, 0, v321);
                goto LABEL_358;
              }
              PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PENDING_REQUEST_EXPIRATION_BADGE_FORMAT"), CFSTR("%ld"), v222);
LABEL_358:
              v251 = objc_claimAutoreleasedReturnValue();
              v18 = v344;
              v123 = v360;

              v355 = 0;
              v194 = v251;
              goto LABEL_415;
            case 4:
            case 5:
              objc_msgSend(v15, "recurringPeerPayment");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = objc_msgSend(v124, "frequency");
              objc_msgSend(v124, "startDate");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              PKPeerPaymentRecurringPaymentFrequencyToLocalizedWeekdayString(v125, v126);
              v127 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "transactionDate");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "memo");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "text");
              v331 = (void *)objc_claimAutoreleasedReturnValue();

              if (a9)
              {
                v130 = v127;

                if (!v128)
                {
                  v355 = 0;
                  goto LABEL_413;
                }
                v359 = v128;
                PKMediumDateString(v128);
                v131 = (id)objc_claimAutoreleasedReturnValue();
                PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_NEXT_PAYMENT"), CFSTR("%@"), v131);
                v355 = (id)objc_claimAutoreleasedReturnValue();
LABEL_412:

                v128 = v359;
LABEL_413:

                v194 = (uint64_t)v331;
LABEL_414:
                v341 = v130;
LABEL_415:
                v358 = (id)v194;

LABEL_416:
                objc_msgSend(v15, "peerPaymentMemo");
                v261 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v261)
                {
                  objc_msgSend(v15, "recurringPeerPayment");
                  v262 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v262, "memo");
                  v263 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v263, "text");
                  v261 = (void *)objc_claimAutoreleasedReturnValue();

                }
                if (!objc_msgSend(v261, "length"))
                  goto LABEL_426;
                if (v123 == 3)
                {
                  if (a9 != 1)
                  {
                    v264 = v358;

                    v358 = v261;
                    v355 = v264;
LABEL_426:

                    goto LABEL_200;
                  }
                }
                else if ((unint64_t)(v123 - 6) > 0xFFFFFFFFFFFFFFFDLL)
                {
                  goto LABEL_426;
                }
                if (v358)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v358, v261);
                  v265 = (id)objc_claimAutoreleasedReturnValue();

                  v358 = v265;
                }
                else
                {
                  v358 = v261;
                }
                goto LABEL_426;
              }
              if (v123 == 4)
              {
                v328 = v127;
                objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                PKStartOfDay(v208);
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                v359 = v128;
                objc_msgSend(v207, "components:fromDate:toDate:options:", 16, v209, v128, 0);
                v131 = (id)objc_claimAutoreleasedReturnValue();

                v210 = objc_msgSend(v131, "day");
                if (v210 == 1)
                  PKLocalizedPeerPaymentRecurringString(CFSTR("SENDING_TOMORROW"), 0, v321);
                else
                  PKLocalizedPeerPaymentRecurringString(CFSTR("SENDING_IN_DAYS"), CFSTR("%ld"), v210);
                v355 = (id)objc_claimAutoreleasedReturnValue();
                v18 = v344;
                v130 = v341;
                v127 = v328;
                goto LABEL_412;
              }
              v355 = v127;
              v224 = objc_msgSend(v124, "status");
              if ((unint64_t)(v224 - 3) >= 2)
              {
                if (v224 == 2)
                {
                  v359 = v128;
                  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_STATUS_PAUSED"), 0);
                  v247 = (void *)objc_claimAutoreleasedReturnValue();
                  v131 = v247;
                  if (v355)
                  {
                    PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_STATUS_CONCATENATED"), CFSTR("%@%@"), v355, v247);
                    v329 = objc_claimAutoreleasedReturnValue();

                    v355 = (id)v329;
                  }
                  else
                  {
                    v131 = v247;
                    v355 = v131;
                  }
LABEL_411:
                  v130 = v341;
                  goto LABEL_412;
                }
              }
              else if ((objc_msgSend(v124, "lastExecutedTransactionAppearsInHistory") & 1) == 0)
              {
                v359 = v128;
                objc_msgSend(v124, "lastExecutedTransaction");
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                v226 = objc_msgSend(v225, "errorCode");

                if (v226 == 40311)
                {
                  objc_msgSend(v124, "fundingSource");
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v227, "name");
                  v131 = (id)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v131, "length"))
                    PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_STATUS_FAILED_PAYMENT_METHOD_NAME"), CFSTR("%@"), v131);
                  else
                    PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_STATUS_FAILED_PAYMENT_METHOD"), 0, v321);
                  v260 = objc_claimAutoreleasedReturnValue();

                  v345 = 1;
                  v331 = (void *)v260;
                }
                else
                {
                  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_STATUS_FAILED"), 0);
                  v131 = v331;
                  v345 = 1;
                  v331 = (void *)objc_claimAutoreleasedReturnValue();
                }
                goto LABEL_411;
              }
              v130 = v341;
              goto LABEL_413;
            case 6:
              objc_msgSend(v15, "recurringPeerPayment");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ENTRY_TITLE"), 0);
              v130 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v124, "currencyThreshold");
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v196, "minimalFormattedStringValue");
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ENTRY_SUBTITLE"), CFSTR("%@"), v197);
              v198 = objc_claimAutoreleasedReturnValue();

              v355 = 0;
              v194 = v198;
              v18 = v344;
              goto LABEL_414;
            default:
              v355 = 0;
              goto LABEL_416;
          }
        case 5:
          objc_msgSend(v15, "transfers");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = objc_msgSend(v183, "count");

          if (v184)
          {
            v136 = v358;
            v367 = v358;
            v368 = v341;
            objc_msgSend(v349, "_transferFundingSourceInformationForTransaction:primaryString:secondaryString:", v15, &v368, &v367);
            v112 = v368;

            v137 = v367;
            goto LABEL_290;
          }
          v200 = objc_msgSend(v15, "secondaryFundingSourceType");
          v201 = v341;
          if (v200 == 1)
          {
            v203 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_BANK_ACCOUNT");
            v202 = v358;
          }
          else
          {
            v202 = v358;
            if (v200 != 2)
            {
              v228 = 0;
              goto LABEL_327;
            }
            v203 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_DEBIT");
          }
          PKLocalizedPaymentString(&v203->isa, 0);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_327:
          v229 = objc_msgSend(v341, "length");
          v230 = v202;
          if (v229)
            v230 = v228;
          else
            v202 = v341;
          v358 = v230;
          if (!v229)
            v201 = v228;
          v341 = v201;
          v231 = v228;

          goto LABEL_400;
        case 6:
          objc_msgSend(v15, "transfers");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = objc_msgSend(v134, "count");

          if (!v135)
          {
            v199 = objc_msgSend(v341, "length");
            PKLocalizedPaymentString(CFSTR("TRANSACTION_TYPE_TOP_UP"), 0);
            v112 = (id)objc_claimAutoreleasedReturnValue();
            if (v199)
              goto LABEL_197;

            v355 = 0;
            goto LABEL_291;
          }
          v136 = v358;
          v369 = v358;
          v370 = v341;
          objc_msgSend(v349, "_transferFundingSourceInformationForTransaction:primaryString:secondaryString:", v15, &v370, &v369);
          v112 = v370;

          v137 = v369;
LABEL_290:
          v206 = v137;

          v355 = 0;
          v358 = v206;
LABEL_291:
          v341 = v112;
          goto LABEL_200;
      }
      if (!objc_msgSend(v15, "transactionType"))
      {
        objc_msgSend(v15, "transfers");
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        v205 = objc_msgSend(v204, "count");

        if (v205)
        {
          v136 = v358;
          v365 = v358;
          v366 = v341;
          objc_msgSend(v349, "_transferFundingSourceInformationForTransaction:primaryString:secondaryString:", v15, &v366, &v365);
          v112 = v366;

          v137 = v365;
          goto LABEL_290;
        }
      }
      if (v22 == 8)
      {
        objc_msgSend(v15, "redemptionEvent");
        v211 = (void *)objc_claimAutoreleasedReturnValue();

        v185 = v354;
        if (v211)
        {
          v116 = CFSTR("TRANSACTION_REWARDS_CASH_BACK");
          goto LABEL_194;
        }
        objc_msgSend(v15, "merchantProvidedDescription");
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        v234 = objc_msgSend(v233, "length");

        if (v234)
        {
          objc_msgSend(v15, "merchantProvidedDescription");
          v117 = objc_claimAutoreleasedReturnValue();
          goto LABEL_196;
        }
      }
      else
      {
        v185 = v354;
        if (v22 == 7)
        {
          PKLocalizedSubtitleForTransactionWithAdjustment(v15);
          v117 = objc_claimAutoreleasedReturnValue();
          goto LABEL_196;
        }
        if (v26)
        {
          if ((v323 & 2) == 0)
          {
            v212 = (uint64_t)v341;
            if ((v323 & 8) != 0)
            {
              v213 = 0;
              if (v324 > 256)
              {
                v252 = CFSTR("MAGLEV_TRANSACTION_LIST_FARE_ADJUSTMENT");
                switch(v324)
                {
                  case 257:
                    v252 = CFSTR("SHINKANSEN_TRANSACTION_LIST_FARE_ADJUSTMENT");
                    goto LABEL_360;
                  case 258:
                    goto LABEL_360;
                  case 259:
                    v252 = CFSTR("TAXI_TRANSACTION_LIST_FARE_ADJUSTMENT");
                    goto LABEL_360;
                  case 260:
                    v252 = CFSTR("FERRY_TRANSACTION_LIST_FARE_ADJUSTMENT");
                    goto LABEL_360;
                  case 261:
                    v252 = CFSTR("BIKE_TRANSACTION_LIST_FARE_ADJUSTMENT");
                    goto LABEL_360;
                  default:
                    if (v324 == 1025)
                    {
                      v252 = CFSTR("GREEN_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT");
LABEL_485:
                      v18 = v344;
                      v212 = (uint64_t)v341;
                    }
                    else
                    {
                      v18 = v344;
                      v212 = (uint64_t)v341;
                      if (v324 != 1026)
                        goto LABEL_361;
                      v252 = CFSTR("METRO_UPGRADE_TRANSACTION_LIST_FARE_ADJUSTMENT");
                    }
                    break;
                }
                goto LABEL_360;
              }
              switch(v324)
              {
                case 1:
                  v252 = CFSTR("TRANSIT_TRANSACTION_LIST_FARE_ADJUSTMENT");
                  goto LABEL_360;
                case 2:
                  v252 = CFSTR("METRO_TRANSACTION_LIST_FARE_ADJUSTMENT");
                  goto LABEL_360;
                case 3:
                  v252 = CFSTR("BUS_TRANSACTION_LIST_FARE_ADJUSTMENT");
                  goto LABEL_360;
                case 4:
                  v252 = CFSTR("TRAIN_TRANSACTION_LIST_FARE_ADJUSTMENT");
                  goto LABEL_360;
                case 7:
                  v252 = CFSTR("LIGHT_RAIL_TRANSACTION_LIST_FARE_ADJUSTMENT");
                  goto LABEL_360;
                case 8:
                  v252 = CFSTR("CABLE_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT");
                  goto LABEL_360;
                default:
                  break;
              }
            }
            else
            {
              if ((v323 & 0x10) == 0)
              {
                if (v341)
                {
                  PKPaymentTransactionTransitSubtypeToLocalizedTitle(v324);
                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_363;
                }
                v213 = 0;
LABEL_362:
                PKPaymentTransactionTransitSubtypeToLocalizedTitle(v324);
                v212 = objc_claimAutoreleasedReturnValue();
LABEL_363:
                if (*((_QWORD *)&v338 + 1) && (_QWORD)v338)
                {
                  PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_FROM_START_STATION"), CFSTR("%@"), *((_QWORD *)&v338 + 1));
                  v253 = objc_claimAutoreleasedReturnValue();

                  v358 = (id)v253;
                }
                if (v325)
                {
                  PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_EN_ROUTE"), 0);
                  v254 = objc_claimAutoreleasedReturnValue();

                  v358 = (id)v254;
                }
                if (v213)
                {
                  if (v212)
                  {
                    v341 = (id)v212;
                    if (v358)
                    {
                      PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_ANNOTATED_DETAIL_FORMAT"), CFSTR("%2$@%1$@"), v213, v358);
                      v255 = objc_claimAutoreleasedReturnValue();

                      v358 = (id)v255;
                    }
                    else
                    {
                      v358 = v213;
                    }
                  }
                  else
                  {
                    v257 = v358;
                    v358 = v213;
                    v341 = v257;

                  }
                }
                else if (v212)
                {
                  v341 = (id)v212;
                }
                else
                {
                  v341 = v358;

                  v358 = 0;
                }

LABEL_400:
                v355 = 0;
                goto LABEL_200;
              }
              v213 = 0;
              if (v324 > 256)
              {
                v252 = CFSTR("MAGLEV_TRANSACTION_LIST_FARE_REBATE");
                switch(v324)
                {
                  case 257:
                    v252 = CFSTR("SHINKANSEN_TRANSACTION_LIST_FARE_REBATE");
                    goto LABEL_360;
                  case 258:
                    goto LABEL_360;
                  case 259:
                    v252 = CFSTR("TAXI_TRANSACTION_LIST_FARE_REBATE");
                    goto LABEL_360;
                  case 260:
                    v252 = CFSTR("FERRY_TRANSACTION_LIST_FARE_REBATE");
                    goto LABEL_360;
                  case 261:
                    v252 = CFSTR("BIKE_TRANSACTION_LIST_FARE_REBATE");
                    goto LABEL_360;
                  default:
                    if (v324 == 1025)
                    {
                      v252 = CFSTR("GREEN_CAR_TRANSACTION_LIST_FARE_REBATE");
                      goto LABEL_485;
                    }
                    v18 = v344;
                    v212 = (uint64_t)v341;
                    if (v324 != 1026)
                      goto LABEL_361;
                    v252 = CFSTR("METRO_UPGRADE_TRANSACTION_LIST_FARE_REBATE");
                    break;
                }
                goto LABEL_360;
              }
              switch(v324)
              {
                case 1:
                  v252 = CFSTR("TRANSIT_TRANSACTION_LIST_FARE_REBATE");
                  goto LABEL_360;
                case 2:
                  v252 = CFSTR("METRO_TRANSACTION_LIST_FARE_REBATE");
                  goto LABEL_360;
                case 3:
                  v252 = CFSTR("BUS_TRANSACTION_LIST_FARE_REBATE");
                  goto LABEL_360;
                case 4:
                  v252 = CFSTR("TRAIN_TRANSACTION_LIST_FARE_REBATE");
                  goto LABEL_360;
                case 7:
                  v252 = CFSTR("LIGHT_RAIL_TRANSACTION_LIST_FARE_REBATE");
                  goto LABEL_360;
                case 8:
                  v252 = CFSTR("CABLE_CAR_TRANSACTION_LIST_FARE_REBATE");
                  goto LABEL_360;
                default:
                  break;
              }
            }
LABEL_361:
            if (v212)
              goto LABEL_363;
            goto LABEL_362;
          }
          v252 = CFSTR("TRANSIT_TRANSACTION_TRANSFER");
          v212 = (uint64_t)v341;
LABEL_360:
          PKLocalizedPaymentString(&v252->isa, 0);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_361;
        }
        if (v22 == 10)
        {
          objc_msgSend(v349, "_billPaymentFundingSourceForTransaction:", v15);
          v117 = objc_claimAutoreleasedReturnValue();
          goto LABEL_196;
        }
      }
      objc_msgSend(v15, "unansweredQuestions");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = objc_msgSend(v235, "count");

      if (v185 == 2)
      {
        v242 = v358;
        if (v236)
        {
          v243 = CFSTR("TRANSACTION_VERIFICATION_REQUIRED");
LABEL_397:
          PKLocalizedFeatureString(v243, 2, 0, v237, v238, v239, v240, v241, v321);
          v112 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_198;
        }
        objc_msgSend(v15, "questions");
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        v259 = objc_msgSend(v258, "count");

        if (!v259)
        {
          v266 = objc_msgSend(v15, "transactionDeclinedReason");
          PKPaymentTransactionDeclinedReasonLocalizedString(v266, v267, v268, v269, v270, v271, v272, v273);
          v117 = objc_claimAutoreleasedReturnValue();
          goto LABEL_196;
        }
        if (!objc_msgSend(v15, "reviewed"))
          goto LABEL_400;
        v116 = CFSTR("TRANSACTION_REVIEWED");
LABEL_194:
        v133 = 2;
LABEL_195:
        PKLocalizedFeatureString(v116, v133, 0, v107, v108, v109, v110, v111, v321);
        v117 = objc_claimAutoreleasedReturnValue();
        goto LABEL_196;
      }
      v242 = v358;
      if (v236)
      {
        PKLocalizedFeatureString(CFSTR("TRANSACTION_VERIFICATION_REQUIRED"), 2, 0, v237, v238, v239, v240, v241, v321);
        v112 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_160;
      }
      if (objc_msgSend(v15, "reviewed"))
      {
        v243 = CFSTR("TRANSACTION_REVIEWED");
        goto LABEL_397;
      }
      if (objc_msgSend(v15, "isIssuerInstallmentTransaction"))
      {
        PKLocalizedPaymentOffersString(CFSTR("PAY_LATER_BADGE_TEXT"), 0);
        v117 = objc_claimAutoreleasedReturnValue();
        goto LABEL_196;
      }
      v286 = v17;
      if (!PKHideCardBenefitRewards())
      {
        objc_msgSend(v15, "paymentRewardsRedemption");
        v287 = (void *)objc_claimAutoreleasedReturnValue();

        if (v287)
        {
          PKLocalizedPayWithPointsString(CFSTR("TRANSACTION_REWARDS_BADGE_TEXT"), 0);
          v288 = objc_claimAutoreleasedReturnValue();

          v355 = 0;
          v358 = (id)v288;
          v18 = v344;
          goto LABEL_200;
        }
      }
      v355 = 0;
      v18 = v344;
      switch(objc_msgSend(v15, "effectiveTransactionSource"))
      {
        case 1:
          v301 = v336;

          if (v301)
            goto LABEL_526;
          if (v22 != 15)
          {
            PKLocalizedPaymentString(CFSTR("TRANSACTION_SOURCE_APPLE_PAY"), 0);
            v358 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_532;
          }
          objc_msgSend(v15, "releasedData");
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          v303 = objc_msgSend(v302, "verificationType");

          PKTransactionReleasedDataVerificationTypeToLocalizedTitle(v303);
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          v305 = v341;
          v306 = v304;
          v307 = v306;
          v341 = v305;
          if (v305 == v306)
          {

          }
          else
          {
            if (!v305 || !v306)
            {

LABEL_537:
              v358 = v307;
              goto LABEL_538;
            }
            v308 = objc_msgSend(v305, "isEqualToString:", v306);

            if ((v308 & 1) == 0)
              goto LABEL_537;
          }
          v358 = 0;
LABEL_538:

          goto LABEL_532;
        case 2:
        case 7:
        case 8:
          if (v22 == 15)
          {
            objc_msgSend(v15, "releasedData");
            v295 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v295, "application");
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            v297 = v296;
            if (v295 && v296)
            {
              v298 = objc_msgSend(v296, "client");
              if (!v298)
              {
                objc_msgSend(v15, "releasedData");
                v318 = (void *)objc_claimAutoreleasedReturnValue();
                PKTransactionReleasedDataVerificationTypeToLocalizedTitle(objc_msgSend(v318, "verificationType"));
                v319 = objc_claimAutoreleasedReturnValue();

LABEL_530:
                v358 = (id)v319;
                goto LABEL_531;
              }
              if (v298 != 2)
              {
                if (v298 != 1)
                {
LABEL_531:

                  goto LABEL_532;
                }
                v299 = CFSTR("TRANSACTION_TYPE_SERVICES");
                goto LABEL_528;
              }
              if (!objc_msgSend(v15, "requiresLocation")
                || (objc_msgSend(v15, "displayLocation"),
                    v320 = (void *)objc_claimAutoreleasedReturnValue(),
                    v320,
                    !v320))
              {
                v299 = CFSTR("TRANSACTION_TYPE_APPS");
LABEL_528:
                PKLocalizedIdentityString(&v299->isa, 0);
                v317 = objc_claimAutoreleasedReturnValue();
                goto LABEL_529;
              }
              objc_msgSend(v15, "displayLocation");
              v317 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v15, "releasedData");
              v315 = (void *)objc_claimAutoreleasedReturnValue();
              v316 = objc_msgSend(v315, "verificationType");

              PKTransactionReleasedDataVerificationTypeToLocalizedTitle(v316);
              v317 = objc_claimAutoreleasedReturnValue();
            }
LABEL_529:
            v319 = v317;

            goto LABEL_530;
          }
          if (!objc_msgSend(v358, "length") && objc_msgSend(v15, "featureIdentifier") != 4)
          {
            PKLocalizedPaymentString(CFSTR("TRANSACTION_SOURCE_APPLE_PAY"), 0);
            v300 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_505;
          }
LABEL_532:
          v355 = 0;
LABEL_533:
          v17 = v286;
          v18 = v344;
          break;
        case 3:
          objc_msgSend(v15, "merchant");
          v309 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "originURL");
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v310, "absoluteString");
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          v312 = v311;
          if (v311)
          {
            v313 = v311;
          }
          else
          {
            PKLocalizedPaymentString(CFSTR("TRANSACTION_SOURCE_APPLE_PAY"), 0);
            v313 = (id)objc_claimAutoreleasedReturnValue();

            v358 = v313;
          }

          v355 = 0;
          v358 = v313;
          goto LABEL_533;
        case 4:
          break;
        case 5:
          if (v336)
          {
            v300 = v336;
LABEL_505:
            v301 = v300;

          }
          else
          {
            if (v351)
              v314 = CFSTR("TRANSACTION_DETAILS_PHYSICAL_CARD_SEPARATOR");
            else
              v314 = CFSTR("TRANSACTION_DETAILS_PHYSICAL_CARD");
LABEL_525:
            PKLocalizedFeatureString(v314, 2, 0, v290, v291, v292, v293, v294, v321);
            v301 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_526:
          v355 = 0;
          v358 = v301;
          goto LABEL_533;
        case 6:
          if (v351)
            v314 = CFSTR("TRANSACTION_DETAILS_VIRTUAL_CARD_SEPARATOR");
          else
            v314 = CFSTR("TRANSACTION_DETAILS_VIRTUAL_CARD");
          goto LABEL_525;
        default:
          goto LABEL_533;
      }
LABEL_200:
      if ((unint64_t)(v340 - 6) > 0xFFFFFFFFFFFFFFFCLL)
        goto LABEL_214;
      if (!objc_msgSend(v351, "length"))
      {
        v138 = v349;
        goto LABEL_209;
      }
      v138 = v349;
      if (!v371)
      {
        v139 = v351;

        goto LABEL_207;
      }
      if (v358)
      {
        PKLocalizedPaymentString(CFSTR("PAYMENT_PASS_DETAILS_TRANSACTION_CELL_TIME_AND_STATUS_FORMAT"), CFSTR("%@%@"), v351, v358);
        v139 = (id)objc_claimAutoreleasedReturnValue();

LABEL_207:
        v358 = v139;
        goto LABEL_209;
      }
      v358 = v351;
LABEL_209:
      if (a9 != 1)
      {
        if (a9 == 2)
        {
          objc_msgSend(v15, "transactionDate");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString(v140);
          v141 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v138, "_relativeDateForTransaction:", v15);
          v141 = objc_claimAutoreleasedReturnValue();
          v140 = v355;
        }

        v355 = (id)v141;
      }
LABEL_214:
      objc_msgSend(v15, "rewards");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v350 = v142;
      if (!v142)
      {
        v161 = 0;
        goto LABEL_238;
      }
      v143 = v142;
      v327 = v16;
      v332 = v17;
      objc_msgSend(v142, "promotionalRewardsItems");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend(v144, "count");
      v146 = v356;
      if (v145)
        v146 = CFSTR("star.fill");
      v356 = v146;
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v147 = (NSDecimalNumber *)(id)objc_claimAutoreleasedReturnValue();
      v361 = 0u;
      v362 = 0u;
      v363 = 0u;
      v364 = 0u;
      objc_msgSend(v143, "rewardsItems");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v361, v375, 16);
      v150 = v147;
      v151 = v147;
      if (v149)
      {
        v152 = v149;
        v153 = *(_QWORD *)v362;
        v150 = v147;
        v151 = v147;
        do
        {
          for (i = 0; i != v152; ++i)
          {
            if (*(_QWORD *)v362 != v153)
              objc_enumerationMutation(v148);
            v155 = *(void **)(*((_QWORD *)&v361 + 1) + 8 * i);
            if (objc_msgSend(v155, "state") != 3)
            {
              v156 = objc_msgSend(v155, "eligibleValueUnit");
              if (v156 == 2)
              {
                objc_msgSend(v155, "eligibleValue");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDecimalNumber decimalNumberByAdding:](v151, "decimalNumberByAdding:", v157);
                v160 = objc_claimAutoreleasedReturnValue();
                v159 = v151;
                v151 = (NSDecimalNumber *)v160;
              }
              else
              {
                if (v156 != 1)
                  continue;
                objc_msgSend(v155, "eligibleValue");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDecimalNumber decimalNumberByAdding:](v150, "decimalNumberByAdding:", v157);
                v158 = objc_claimAutoreleasedReturnValue();
                v159 = v150;
                v150 = (NSDecimalNumber *)v158;
              }

            }
          }
          v152 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v361, v375, 16);
        }
        while (v152);
      }

      if ((-[NSDecimalNumber isEqualToNumber:](v150, "isEqualToNumber:", v147) & 1) == 0)
      {
        PKFormattedStringMinimalFractionDigitsFromNumber(v150, 0);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString(CFSTR("TRANSACTION_REWARDS_PERCENT_FORMAT"), 2, CFSTR("%@%%"), v163, v164, v165, v166, v167, (uint64_t)v162);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v332;
        v18 = v344;
LABEL_236:

        goto LABEL_237;
      }
      v17 = v332;
      v18 = v344;
      if (objc_msgSend(v15, "transactionType") != 12
        && (-[NSDecimalNumber isEqualToNumber:](v151, "isEqualToNumber:", v147) & 1) == 0)
      {
        objc_msgSend(v15, "rewardsTotalCurrencyCode");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = (NSString *)v162;
        if (!v162)
        {
          objc_msgSend(v15, "currencyCode");
          v170 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        PKCurrencyAmountCreate(v151, v170, 0);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "minimalFormattedStringValue");
        v161 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v162)
        v17 = v332;
        goto LABEL_236;
      }
      v161 = 0;
LABEL_237:

      v16 = v327;
LABEL_238:
      if (objc_msgSend(v353, "supportsFPANNotifications")
        && objc_msgSend(v353, "supportsDPANNotifications")
        && objc_msgSend(v15, "hasAssociatedPaymentApplication")
        && objc_msgSend(v343, "length"))
      {
        if (v355)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" - %@"), v343);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v355, "stringByAppendingString:", v168);
          v169 = (id)objc_claimAutoreleasedReturnValue();

          v355 = v169;
        }
        else
        {
          v355 = v343;
        }
      }
      if (objc_msgSend(v16, "type") == 2)
      {
        objc_msgSend(v16, "accountUser");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "nameComponents");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKContactResolver contactForFamilyMember:nameComponents:imageData:](PKContactResolver, "contactForFamilyMember:nameComponents:imageData:", v18, v173, 0);
        v174 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v174, "givenName");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = v175;
        v177 = v16;
        if (v175)
        {
          if (v355)
          {
            PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_NAME_TIME"), CFSTR("%1$@%2$@"), v175, v355);
            v178 = objc_claimAutoreleasedReturnValue();

            v355 = (id)v178;
            v179 = v344;
          }
          else
          {
            v179 = v18;
            v355 = v175;
          }
        }
        else
        {
          v179 = v18;
        }
        v180 = v17;

      }
      else
      {
        v177 = v16;
        v179 = v18;
        v180 = v17;
      }
      v19 = v342;
      v181 = objc_alloc_init(PKPaymentTransactionPresentationInformation);
      -[PKPaymentTransactionPresentationInformation setPrimaryString:](v181, "setPrimaryString:", v341);
      -[PKPaymentTransactionPresentationInformation setSecondaryString:](v181, "setSecondaryString:", v358);
      -[PKPaymentTransactionPresentationInformation setTertiaryString:](v181, "setTertiaryString:", v355);
      -[PKPaymentTransactionPresentationInformation setDestructiveSecondaryString:](v181, "setDestructiveSecondaryString:", v345);
      -[PKPaymentTransactionPresentationInformation setBadgeString:](v181, "setBadgeString:", v161);
      -[PKPaymentTransactionPresentationInformation setValueString:](v181, "setValueString:", v352);
      -[PKPaymentTransactionPresentationInformation setSecondaryBadgeSymbol:](v181, "setSecondaryBadgeSymbol:", v356);
      -[PKPaymentTransactionPresentationInformation setShouldGrayValue:](v181, "setShouldGrayValue:", v334);
      -[PKPaymentTransactionPresentationInformation setShouldStrikeValue:](v181, "setShouldStrikeValue:", v333);
      -[PKPaymentTransactionPresentationInformation setShouldShowDisclosure:](v181, "setShouldShowDisclosure:", v335);
      v21 = v181;

      v20 = v343;
      v17 = v180;
      v18 = v179;
      v16 = v177;
      v15 = v337;
LABEL_259:

      return v21;
  }
}

+ (id)_presentationInformationForBankConnectTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  uint64_t v25;
  PKPaymentTransactionPresentationInformation *v26;
  char v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "bankConnectCreditDebitIndicator");
  v6 = objc_msgSend(v4, "transactionType");
  v7 = objc_msgSend(v4, "transactionStatus");
  objc_msgSend(v4, "formattedBalanceAdjustmentAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v6 <= 0x16)
  {
    if (((1 << v6) & 0x7F06F3) != 0)
    {
      objc_msgSend(v4, "merchant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v6 == 11)
    {
      if (v5 == 1)
        v13 = CFSTR("BANK_CONNECT_INTEREST_EARNED_TRANSACTION_CELL_PRIMARY_STRING");
      else
        v13 = CFSTR("BANK_CONNECT_INTEREST_CHARGED_TRANSACTION_CELL_PRIMARY_STRING");
      PKLocalizedBankConnectString(&v13->isa, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      if (objc_msgSend(v4, "isIssuerInstallmentTransaction"))
      {
        PKLocalizedPaymentOffersString(CFSTR("PAY_LATER_BADGE_TEXT"), 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
LABEL_15:
      if (!PKHideCardBenefitRewards())
      {
        objc_msgSend(v4, "paymentRewardsRedemption");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          PKLocalizedPayWithPointsString(CFSTR("TRANSACTION_REWARDS_BADGE_TEXT"), 0);
          v15 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v15;
        }
      }
      goto LABEL_37;
    }
  }
  v11 = 0;
  switch(v6)
  {
    case 0uLL:
      objc_msgSend(v4, "displayLocation");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isIssuerInstallmentTransaction"))
      {
        PKLocalizedPaymentOffersString(CFSTR("PAY_LATER_BADGE_TEXT"), 0);
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v12;
      }
      goto LABEL_15;
    case 1uLL:
      v16 = CFSTR("BANK_CONNECT_REFUND_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 3uLL:
    case 0xBuLL:
    case 0x10uLL:
      goto LABEL_12;
    case 4uLL:
      v16 = CFSTR("BANK_CONNECT_FEE_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 5uLL:
      v16 = CFSTR("BANK_CONNECT_WITHDRAWAL_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 6uLL:
      v16 = CFSTR("BANK_CONNECT_DEPOSIT_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 7uLL:
      v16 = CFSTR("BANK_CONNECT_ADJUSTMENT_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 9uLL:
      v16 = CFSTR("BANK_CONNECT_REWARDS_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 0xAuLL:
      objc_msgSend(v4, "displayLocation");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 0x11uLL:
      v16 = CFSTR("BANK_CONNECT_DIVIDEND_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 0x12uLL:
      if (v5 == 1)
        v16 = CFSTR("BANK_CONNECT_LOAN_CREDIT_TRANSACTION_CELL_SECONDARY_STRING");
      else
        v16 = CFSTR("BANK_CONNECT_LOAN_DEBIT_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 0x13uLL:
      v16 = CFSTR("BANK_CONNECT_STANDING_ORDER_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 0x14uLL:
      v16 = CFSTR("BANK_CONNECT_DIRECT_DEBIT_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 0x15uLL:
      v16 = CFSTR("BANK_CONNECT_TRANSFER_TRANSACTION_CELL_SECONDARY_STRING");
      goto LABEL_35;
    case 0x16uLL:
      if (v5 == 1)
        v16 = CFSTR("BANK_CONNECT_CHECK_CREDIT_TRANSACTION_CELL_SECONDARY_STRING");
      else
        v16 = CFSTR("BANK_CONNECT_CHECK_DEBIT_TRANSACTION_CELL_SECONDARY_STRING");
LABEL_35:
      PKLocalizedBankConnectString(&v16->isa, 0);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v11 = (id)v17;
      break;
    default:
      break;
  }
LABEL_37:
  if (!v9 || !objc_msgSend(v9, "length"))
  {
    if (v11)
    {
      v18 = objc_msgSend(v11, "copy");

      v9 = v11;
    }
    else
    {
      objc_msgSend(v4, "localizedTypeDescription");
      v18 = objc_claimAutoreleasedReturnValue();
    }

    v11 = 0;
    v9 = (void *)v18;
  }
  v28 = 1;
  objc_msgSend(a1, "_statusAnnotationForTransaction:overloadAnnotation:", v4, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    if (!v28)
    {
      v20 = v19;
      goto LABEL_48;
    }
    if (v11)
    {
      PKLocalizedPaymentString(CFSTR("PAYMENT_PASS_DETAILS_TRANSACTION_CELL_TIME_AND_STATUS_FORMAT"), CFSTR("%@%@"), v19, v11);
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:
      v21 = v20;

      v11 = v21;
      goto LABEL_50;
    }
    v11 = v19;
  }
LABEL_50:
  objc_msgSend(a1, "_relativeDateForTransaction:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v11)
  {
    v11 = (id)objc_msgSend(v22, "copy");

    v23 = 0;
  }
  v24 = v7 == 2;
  v25 = (v7 < 8) & (0xF8u >> v7);
  v26 = objc_alloc_init(PKPaymentTransactionPresentationInformation);
  -[PKPaymentTransactionPresentationInformation setValueString:](v26, "setValueString:", v8);
  -[PKPaymentTransactionPresentationInformation setPrimaryString:](v26, "setPrimaryString:", v9);
  -[PKPaymentTransactionPresentationInformation setSecondaryString:](v26, "setSecondaryString:", v11);
  -[PKPaymentTransactionPresentationInformation setDestructiveSecondaryString:](v26, "setDestructiveSecondaryString:", v24);
  -[PKPaymentTransactionPresentationInformation setTertiaryString:](v26, "setTertiaryString:", v23);
  -[PKPaymentTransactionPresentationInformation setBadgeString:](v26, "setBadgeString:", 0);
  -[PKPaymentTransactionPresentationInformation setSecondaryBadgeSymbol:](v26, "setSecondaryBadgeSymbol:", 0);
  -[PKPaymentTransactionPresentationInformation setShouldGrayValue:](v26, "setShouldGrayValue:", v25);
  -[PKPaymentTransactionPresentationInformation setShouldStrikeValue:](v26, "setShouldStrikeValue:", v25);
  -[PKPaymentTransactionPresentationInformation setShouldShowDisclosure:](v26, "setShouldShowDisclosure:", 1);

  return v26;
}

+ (id)_relativeDateForTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "transactionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKRelativeDateStringWithFullDateForUnits(v4, 8206, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "transactionType");
  v7 = v6;
  if (v6 != 9)
  {
    if (v6 != 5)
      goto LABEL_7;
    objc_msgSend(v3, "transfers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {
      v9 = objc_msgSend(v3, "isBankConnectTransaction");

      if ((v9 & 1) != 0)
        goto LABEL_7;
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSACTION_LEDGER_SUBMITTED_DATE_FORMAT"), CFSTR("%@"), v5);
      v8 = v5;
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_7:
    if (!objc_msgSend(v3, "bankConnectRoundTransactionDate"))
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDateInToday:", v4))
  {
    PKLocalizedString(CFSTR("RELATIVE_DATE_TODAY"), 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }

LABEL_11:
  if (v7 == 2 && (objc_msgSend(v3, "shouldSuppressDate") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "pk_uppercaseFirstStringForPreferredLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_statusAnnotationForTransaction:(id)a3 overloadAnnotation:(BOOL *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  __CFString *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  v6 = objc_msgSend(v5, "transactionType");
  v7 = objc_msgSend(v5, "featureIdentifier");
  switch(v6)
  {
    case 9:
      v14 = CFSTR("TRANSACTION_REWARDS_CASH_BACK");
LABEL_7:
      PKLocalizedFeatureString(v14, 2, 0, v8, v9, v10, v11, v12, v26);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v13 = (void *)v15;
      goto LABEL_15;
    case 2:
LABEL_5:
      v13 = 0;
      goto LABEL_15;
    case 1:
      if ((objc_msgSend(v5, "isBankConnectTransaction") & 1) != 0)
        goto LABEL_5;
      v19 = CFSTR("PAYMENT_TRANSACTION_REFUND");
LABEL_13:
      PKLocalizedPaymentString(&v19->isa, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
  }
  v16 = v7;
  v17 = objc_msgSend(v5, "transactionStatus");
  v13 = 0;
  v18 = 1;
  switch(v17)
  {
    case 0:
    case 8:
      if (v16 == 2 && v6 == 10)
      {
        v14 = CFSTR("PAYMENT_TRANSACTION_PENDING_PAYMENT");
        goto LABEL_7;
      }
      objc_msgSend(v5, "transfers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23
        && (objc_msgSend(v23, "externalAccount"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "type"),
            v24,
            v25 == 2))
      {
        v13 = 0;
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("PAYMENT_TRANSACTION_PENDING"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 2:
      PKLocalizedPaymentString(CFSTR("PAYMENT_TRANSACTION_DECLINED"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v5, "accountType") != 3;
      if (a4)
        goto LABEL_17;
      goto LABEL_18;
    case 4:
      v19 = CFSTR("PAYMENT_TRANSACTION_FAILED");
      goto LABEL_13;
    case 5:
      v19 = CFSTR("PAYMENT_TRANSACTION_CANCELED");
      goto LABEL_13;
    case 6:
      v19 = CFSTR("PAYMENT_TRANSACTION_REJECTED");
      goto LABEL_13;
    case 7:
      v19 = CFSTR("PAYMENT_TRANSACTION_EXPIRED");
      goto LABEL_13;
    default:
      goto LABEL_16;
  }
LABEL_15:
  v18 = 1;
LABEL_16:
  if (a4)
LABEL_17:
    *a4 = v18;
LABEL_18:
  objc_msgSend(v13, "pk_uppercaseFirstStringForPreferredLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)secondaryFundingSourceDescriptionForTransaction:(id)a3 secondarySource:(id)a4 includeBankAccountSuffix:(BOOL)a5 useGenericNameIfNoDescriptionAvailable:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v25;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "transactionType");
  if (v11 != 10)
  {
    if (v11 == 5)
    {
      objc_msgSend(v9, "secondaryFundingSourceDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "secondaryFundingSourceType");
      if (v13)
      {
        if (v13 == 1)
        {
          if (!objc_msgSend(v12, "length"))
          {
            if (v6)
            {
              v14 = CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_BANK_ACCOUNT_DESCRIPTION_GENERIC");
              goto LABEL_28;
            }
LABEL_29:
            v15 = 0;
            goto LABEL_36;
          }
        }
        else
        {
          if (v13 != 2)
            goto LABEL_29;
          if (!objc_msgSend(v12, "length"))
          {
            if (v6)
            {
              v14 = CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_DEBIT_DESCRIPTION_GENERIC");
LABEL_28:
              PKLocalizedPeerPaymentString(&v14->isa, 0);
              v20 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
            goto LABEL_29;
          }
        }
      }
      else if (!objc_msgSend(v12, "length"))
      {
        goto LABEL_29;
      }
      v20 = v12;
LABEL_23:
      v15 = v20;
LABEL_36:

      goto LABEL_37;
    }
    objc_msgSend(v9, "secondaryFundingSourceFPANIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v10, "paymentPass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(v9, "secondaryFundingSourceDescription");
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
    if (objc_msgSend(v15, "length"))
      goto LABEL_36;
    PKDisplayablePaymentNetworkNameForPaymentCredentialType(objc_msgSend(v9, "secondaryFundingSourceNetwork"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryFundingSourceDPANSuffix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length") && objc_msgSend(v19, "length"))
    {
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_CARD_DESCRIPTION_NETWORK_AND_DPAN_SUFFIX_FORMAT_STRING"), CFSTR("%@%@"), v18, v19);
      goto LABEL_33;
    }
    if (objc_msgSend(v18, "length"))
    {
      v25 = v18;
      v21 = CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_CARD_DESCRIPTION_NETWORK_FORMAT_STRING");
    }
    else
    {
      if (!objc_msgSend(v19, "length"))
      {
        if (objc_msgSend(v9, "isBankConnectTransaction"))
        {
          PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_OTHER_ACCOUNT"), 0);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (!v6)
          goto LABEL_35;
        PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_CARD_DESCRIPTION_GENERIC"), 0);
LABEL_33:
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v23 = (void *)v22;

        v15 = v23;
LABEL_35:

        goto LABEL_36;
      }
      v25 = v19;
      v21 = CFSTR("TRANSACTION_SECONDARY_FUNDING_SOURCE_CARD_DESCRIPTION_DPAN_SUFFIX_FORMAT_STRING");
    }
    PKLocalizedPeerPaymentString(&v21->isa, CFSTR("%@"), v25);
    goto LABEL_33;
  }
  objc_msgSend(a1, "_billPaymentFundingSourceForTransaction:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v15;
}

+ (id)_billPaymentFundingSourceForTransaction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v20;

  objc_msgSend(a3, "payments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fundingSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  switch(objc_msgSend(v5, "type"))
  {
    case 1:
    case 5:
      objc_msgSend(v5, "displayDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ACH_ITEM_FORMAT"), 2, CFSTR("%@"), v13, v14, v15, v16, v17, (uint64_t)v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      v18 = CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_APC_ITEM");
      goto LABEL_5;
    case 3:
      v18 = CFSTR("ACCOUNT_SERVICE_PAYMENT_DETAILS_OFFLINE_PAYMENT");
LABEL_5:
      PKLocalizedFeatureString(v18, 2, 0, v6, v7, v8, v9, v10, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v11;
}

+ (void)_transferFundingSourceInformationForTransaction:(id)a3 primaryString:(id *)a4 secondaryString:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
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
  uint64_t v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  uint64_t v49;
  id v50;

  v50 = a3;
  objc_msgSend(v50, "transfers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "externalAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v50, "associatedFeatureIdentifier");
  v11 = 0;
  v12 = 0;
  switch(objc_msgSend(v9, "type"))
  {
    case 1:
    case 5:
      objc_msgSend(v9, "displayDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "type") == 2)
        goto LABEL_3;
      v35 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
      goto LABEL_13;
    case 2:
      v21 = objc_msgSend(v8, "type");
      v22 = objc_msgSend(v50, "featureIdentifier");
      if (v21 == 2)
      {
        if (v22 != 1)
        {
          v36 = objc_msgSend(v50, "featureIdentifier");
          PKLocalizedFeatureString(CFSTR("TRANSACTION_TYPE_TOPUP_CASH"), v36, 0, v37, v38, v39, v40, v41, v49);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
          v13 = objc_msgSend(v50, "featureIdentifier");
          v19 = CFSTR("TRANSACTION_TYPE_TOP_UP");
          goto LABEL_4;
        }
        if (v10)
        {
          PKLocalizedFeatureString(CFSTR("TRANSACTION_PRODUCT_NAME"), v10, 0, v23, v24, v25, v26, v27, v49);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_ACCOUNT");
          v13 = v10;
LABEL_4:
          PKLocalizedFeatureString(v19, v13, 0, v14, v15, v16, v17, v18, v49);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        v48 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
      }
      else
      {
        if (v22 != 1)
        {
          v42 = objc_msgSend(v50, "featureIdentifier");
          PKLocalizedFeatureString(CFSTR("TRANSACTION_TYPE_TOPUP_CASH"), v42, 0, v43, v44, v45, v46, v47, v49);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v50, "featureIdentifier");
          v19 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_CASH");
          goto LABEL_4;
        }
        if (v10)
        {
          PKLocalizedFeatureString(CFSTR("TRANSACTION_PRODUCT_NAME"), v10, 0, v23, v24, v25, v26, v27, v49);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = CFSTR("TRANSACTION_TYPE_TOP_UP");
LABEL_13:
          PKLocalizedPaymentString(&v35->isa, 0);
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v12 = (id)v20;
          if (!a4)
            goto LABEL_17;
          goto LABEL_15;
        }
        v48 = CFSTR("TRANSACTION_TYPE_TOP_UP");
      }
      PKLocalizedPaymentString(&v48->isa, 0);
      v34 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v34;
      v12 = 0;
      if (a4)
      {
LABEL_15:
        if (v11)
          *a4 = objc_retainAutorelease(v11);
      }
LABEL_17:
      if (a5 && v12)
      {
        v12 = objc_retainAutorelease(v12);
        *a5 = v12;
      }
LABEL_20:

      return;
    case 3:
      v28 = objc_msgSend(v50, "featureIdentifier");
      PKLocalizedFeatureString(CFSTR("TRANSACTION_TYPE_OFFLINE_TRANSFER"), v28, 0, v29, v30, v31, v32, v33, v49);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      goto LABEL_20;
    default:
      v12 = 0;
      goto LABEL_20;
  }
}

+ (unint64_t)iconTypeForTransaction:(id)a3 ignoreLogoURL:(BOOL)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a1, "staticIconNameForTransaction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "merchant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4
      || (objc_msgSend(v9, "logoImageURL"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
    {
      if (objc_msgSend(v6, "transactionType") == 2)
      {
        v8 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (objc_msgSend(v6, "transactionType") == 15)
      {
        if (objc_msgSend(v6, "transactionSource") == 2)
          v8 = 3;
        else
          v8 = 0;
        goto LABEL_12;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 2;
LABEL_13:

  return v8;
}

+ (BOOL)transactionIsPaymentForPayLaterFinancingPlan:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "transactionType"))
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "associatedFeatureIdentifier") == 3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "associatedFinancingPlan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

+ (id)staticIconNameForTransaction:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;

  v4 = a3;
  if (objc_msgSend(v4, "isBankConnectTransaction"))
  {
    v5 = 0;
    switch(objc_msgSend(v4, "transactionType"))
    {
      case 4:
        v5 = CFSTR("BANK_CONNECT_Fee");
        break;
      case 5:
      case 6:
      case 7:
      case 10:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        objc_msgSend(v4, "currencyCode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqual:", CFSTR("GBP"));

        if ((v7 & 1) != 0)
        {
          v5 = CFSTR("IconGBP");
        }
        else
        {
          objc_msgSend(v4, "currencyCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", CFSTR("USD"));

          if (v15)
            v5 = CFSTR("SAVINGS_Bank");
          else
            v5 = 0;
        }
        break;
      case 9:
        goto LABEL_22;
      case 11:
        v5 = CFSTR("SAVINGS_Interest");
        break;
      case 17:
        v5 = CFSTR("BANK_CONNECT_Dividend");
        break;
      default:
        break;
    }
  }
  else
  {
    v8 = objc_msgSend(v4, "accountType");
    v5 = 0;
    switch(objc_msgSend(v4, "transactionType"))
    {
      case 0:
      case 1:
      case 2:
      case 13:
      case 14:
      case 15:
        objc_msgSend(v4, "releasedData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "application");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "client");

        if (v11 == 1)
          v5 = CFSTR("apple_icon_identity");
        else
          v5 = 0;
        if (objc_msgSend(a1, "transactionIsPaymentForPayLaterFinancingPlan:", v4))
          v5 = CFSTR("PayLater_welcome_icon");
        if (objc_msgSend(v4, "transactionType"))
          break;
        objc_msgSend(v4, "payments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          v5 = CFSTR("AppleCardIcon");
          break;
        }
        objc_msgSend(v4, "transfers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "count"))
        {
          v30 = objc_msgSend(v4, "associatedFeatureIdentifier");

          if (v30 == 5)
          {
            v5 = CFSTR("SAVINGS_Icon");
            break;
          }
        }
        else
        {

        }
        if (objc_msgSend(v4, "associatedFeatureIdentifier") == 1)
        {
          objc_msgSend(v4, "merchant");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "hasMapsMatch");

          if (!v32)
            v5 = CFSTR("SAVINGS_Cash");
        }
        break;
      case 3:
        v21 = objc_msgSend(v4, "peerPaymentType");
        v22 = CFSTR("CashBackIcon");
        v23 = CFSTR("SAVINGS_Cash");
        v24 = v21 == 6;
        goto LABEL_37;
      case 4:
      case 12:
LABEL_22:
        v5 = CFSTR("CashBackIcon");
        break;
      case 5:
      case 6:
      case 19:
      case 20:
      case 21:
      case 22:
        objc_msgSend(v4, "transfers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (!v17)
          goto LABEL_34;
        objc_msgSend(v4, "transfers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "externalAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "type") == 2)
        {
          if (objc_msgSend(v4, "associatedFeatureIdentifier") == 5)
            v5 = CFSTR("SAVINGS_Icon");
          else
            v5 = CFSTR("SAVINGS_Cash");
        }
        else
        {
          v5 = CFSTR("SAVINGS_Bank");
        }

        break;
      case 7:
        if (v8 == 3
          && (objc_msgSend(v4, "transfers"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v25, "count"),
              v25,
              v26))
        {
LABEL_34:
          v5 = CFSTR("SAVINGS_Bank");
        }
        else
        {
          v5 = CFSTR("AdjustmentsIcon");
        }
        break;
      case 8:
        objc_msgSend(v4, "redemptionEvent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = CFSTR("AppleCardIcon");
        v23 = CFSTR("CashBackIcon");
        v24 = v27 == 0;
        goto LABEL_37;
      case 9:
      case 10:
        if (objc_msgSend(v4, "isBankConnectTransaction"))
          v5 = 0;
        else
          v5 = CFSTR("AppleCardIcon");
        break;
      case 11:
        v22 = CFSTR("InterestIcon");
        v23 = CFSTR("SAVINGS_Interest");
        v24 = v8 == 3;
LABEL_37:
        if (v24)
          v5 = v23;
        else
          v5 = v22;
        break;
      default:
        break;
    }
  }

  return (id)v5;
}

@end
