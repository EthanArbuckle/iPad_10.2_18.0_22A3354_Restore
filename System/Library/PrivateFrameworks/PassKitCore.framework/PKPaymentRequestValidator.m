@implementation PKPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPaymentRequest:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentRequestValidator)initWithPaymentRequest:(id)a3
{
  id v5;
  PKPaymentRequestValidator *v6;
  PKPaymentRequestValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentRequestValidator;
  v6 = -[PKPaymentRequestValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (BOOL)_checkTotal:(id)a3 withAPIType:(int64_t)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = -[PKPaymentRequestValidator _checkTotalAmount:](self, "_checkTotalAmount:", a3);
  v9 = v8;
  if (a5 && v8)
  {
    -[PKPaymentRequestValidator _errorDescriptionFromPaymentTotalAmountValidationResult:withAPIType:](self, "_errorDescriptionFromPaymentTotalAmountValidationResult:withAPIType:", v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == 0;
}

- (unint64_t)_checkTotalAmount:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "pk_isNegativeNumber") & 1) != 0)
  {
    v4 = 1;
  }
  else if (PKIsCurrencyDecimalTooLarge(v3))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_errorDescriptionFromPaymentTotalAmountValidationResult:(unint64_t)a3 withAPIType:(int64_t)a4
{
  const __CFString *v4;

  if ((unint64_t)(a4 - 1) >= 2)
    v4 = CFSTR("PKPaymentRequest total");
  else
    v4 = CFSTR("Total amount");
  return -[PKPaymentRequestValidator _errorDescriptionFromTotalAmountValidationResult:prefix:](self, "_errorDescriptionFromTotalAmountValidationResult:prefix:", a3, v4);
}

- (id)_errorDescriptionFromTotalAmountValidationResult:(unint64_t)a3 prefix:(id)a4
{
  id v5;
  const __CFString *v6;
  void *v7;

  v5 = a4;
  if (a3 == 1)
  {
    v6 = CFSTR("%@ must be greater than or equal to zero");
  }
  else
  {
    if (a3 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("%@ is too large");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (BOOL)_checkMultiTokenTotal:(id)a3 withAPIType:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PKPaymentRequest multiTokenContexts](self->_request, "multiTokenContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v13), "amount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKPaymentRequestValidator _checkTotalAmount:](self, "_checkTotalAmount:", v14);

      if (v15)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if (!a5)
      goto LABEL_27;
    -[PKPaymentRequestValidator _errorDescriptionFromMultiTokenContextAmountValidationResult:withAPIType:](self, "_errorDescriptionFromMultiTokenContextAmountValidationResult:withAPIType:", v15, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = v24;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v44;
    v28 = &v43;
  }
  else
  {
LABEL_9:
    v31 = v8;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[PKPaymentRequest multiTokenContexts](self->_request, "multiTokenContexts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        v20 = 0;
        v21 = v9;
        do
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v20), "amount");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "decimalNumberByAdding:", v22);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          ++v20;
          v21 = v9;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v18);
    }

    if (!-[PKPaymentRequest isMultiTokenRequest](self->_request, "isMultiTokenRequest"))
    {
      LOBYTE(a5) = 1;
      v8 = v31;
      goto LABEL_27;
    }
    v8 = v31;
    if (!objc_msgSend(v9, "compare:", v31))
    {
      LOBYTE(a5) = 1;
      goto LABEL_27;
    }
    if ((unint64_t)(a4 - 1) >= 2)
      v23 = CFSTR("PKPaymentRequest total");
    else
      v23 = CFSTR("total amount");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The sum of all payment token context amounts must be equal to the %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = v24;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v41;
    v28 = &v40;
  }
  objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v29);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = 0;
LABEL_27:

  return (char)a5;
}

- (id)_errorDescriptionFromMultiTokenContextAmountValidationResult:(unint64_t)a3 withAPIType:(int64_t)a4
{
  const __CFString *v4;

  if ((unint64_t)(a4 - 1) >= 2)
    v4 = CFSTR("PKPaymentTokenContext amount");
  else
    v4 = CFSTR("Payment token context amount");
  return -[PKPaymentRequestValidator _errorDescriptionFromTotalAmountValidationResult:prefix:](self, "_errorDescriptionFromTotalAmountValidationResult:prefix:", a3, v4);
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentRequestValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", -[PKPaymentRequest APIType](self->_request, "APIType"), a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  PKPaymentRequestValidator *v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  int isKindOfClass;
  uint16x4_t v11;
  int v12;
  id v13;
  PKPaymentRequest *request;
  uint64_t v15;
  id v16;
  int v17;
  uint64_t v18;
  PKPaymentRequest *v19;
  PKPaymentRequestValidator *v20;
  uint64_t v21;
  void *v22;
  id v23;
  PKPaymentRequest *v24;
  uint64_t v25;
  id v26;
  PKPaymentRequest *v27;
  void *v28;
  void *v29;
  PKPaymentRequest *v30;
  void *v31;
  int v32;
  PKPaymentRequest *v33;
  uint64_t v34;
  uint64_t v35;
  PKPaymentRequestValidator *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  int v40;
  id *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  PKRecurringPaymentRequestValidator *v65;
  void *v66;
  id v67;
  PKAutomaticReloadPaymentRequestValidator *v68;
  void *v69;
  id v70;
  PKDeferredPaymentRequestValidator *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  objc_class *v79;
  uint64_t v80;
  id v81;
  PKPaymentRequest *v82;
  PKPaymentRequestValidator *v83;
  void *v84;
  void *v85;
  PKPaymentRequest *v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  PKPaymentRequest *v97;
  uint64_t v98;
  PKPaymentRequest *v99;
  uint64_t v100;
  id v101;
  PKPaymentRequestValidator *v102;
  id v103;
  PKPaymentRequest *v104;
  void *v105;
  void *v106;
  PKPaymentRequest *v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  id v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  int v119;
  uint64_t v120;
  int v121;
  void *v122;
  uint64_t v123;
  char v124;
  unint64_t v125;
  PKPaymentRequest *v126;
  uint64_t v127;
  int v128;
  id v129;
  PKPaymentRequest *v130;
  void *v131;
  int v132;
  PKPaymentRequest *v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  unint64_t v140;
  void *v141;
  void *v142;
  const __CFString **v143;
  uint64_t *v144;
  int32x4_t v145;
  PKPaymentRequest *v146;
  uint64_t v147;
  int v148;
  void *v149;
  void *v150;
  PKPaymentRequest *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  unint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id *v161;
  uint64_t *v162;
  void *v163;
  void *v164;
  unint64_t v165;
  void *v166;
  void *v167;
  PKPaymentRequest *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  int v174;
  const __CFString *v175;
  void *v176;
  char v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  int v184;
  NSObject *v185;
  char v186;
  void *v187;
  PKDisbursementPaymentRequestValidator *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  void *v194;
  uint64_t v195;
  PKPaymentRequest *v196;
  objc_class *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  PKPaymentRequest *v203;
  uint64_t v204;
  int v205;
  PKPaymentRequest *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  PKPaymentRequestValidator *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  int v223;
  id v224;
  uint64_t v225;
  int v226;
  uint64_t v227;
  char v228;
  uint64_t v229;
  int v230;
  void *v231;
  void *v232;
  int v233;
  void *v234;
  void *v235;
  const __CFString **v236;
  uint64_t *v237;
  uint64_t v238;
  int v239;
  uint64_t v240;
  int v241;
  objc_class *v242;
  uint64_t v243;
  void *v244;
  id v245;
  uint64_t v246;
  int v247;
  id v248;
  uint64_t v249;
  int v250;
  int v251;
  id v252;
  uint64_t v253;
  char v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  int64x2_t v261;
  id *v262;
  id *v263;
  BOOL v264;
  uint64_t v265;
  uint64_t v266;
  _BOOL4 v267;
  unsigned __int8 v268;
  unint64_t v269;
  id *p_isa;
  int64x2_t v271;
  int64_t v272;
  id v273;
  uint8_t buf[16];
  id v275;
  id v276;
  id v277;
  id v278;
  id v279;
  id v280;
  id v281;
  id v282;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  id v299;
  id v300;
  id v301;
  id v302;
  id v303;
  id v304;
  _QWORD v305[5];
  id v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  id v315;
  id v316;
  id v317;
  id v318;
  id v319;
  id v320;
  id v321;
  _QWORD v322[5];
  id v323;
  id v324;
  _QWORD aBlock[5];
  id v326;
  id v327;
  id v328;
  id v329;
  _QWORD v330[2];
  _QWORD v331[2];
  uint64_t v332;
  const __CFString *v333;
  uint64_t v334;
  const __CFString *v335;
  uint64_t v336;
  const __CFString *v337;
  uint64_t v338;
  id v339;
  uint64_t v340;
  id v341;
  uint64_t v342;
  id v343;
  uint64_t v344;
  id v345;
  uint64_t v346;
  const __CFString *v347;
  uint64_t v348;
  const __CFString *v349;
  uint64_t v350;
  const __CFString *v351;
  uint64_t v352;
  const __CFString *v353;
  uint64_t v354;
  const __CFString *v355;
  uint64_t v356;
  const __CFString *v357;
  _BYTE v358[128];
  uint64_t v359;
  const __CFString *v360;
  uint64_t v361;
  const __CFString *v362;
  uint64_t v363;
  const __CFString *v364;
  uint64_t v365;
  const __CFString *v366;
  uint64_t v367;
  _QWORD v368[4];

  v6 = self;
  v368[1] = *MEMORY[0x1E0C80C00];
  v7 = -[PKPaymentRequest requestType](self->_request, "requestType");
  v8 = -[PKPaymentRequest isPeerPaymentRequest](v6->_request, "isPeerPaymentRequest");
  v265 = -[PKPaymentRequest requestType](v6->_request, "requestType");
  if (v7 == 3)
  {
    v264 = 1;
  }
  else if (v7 == 1)
  {
    -[PKPaymentRequest merchantSession](v6->_request, "merchantSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = v9 != 0;

  }
  else
  {
    v264 = 0;
  }
  v271 = vdupq_n_s64(v7);
  v269 = v7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v261 = vceqq_s64(v271, (int64x2_t)xmmword_1904555B0);
  v11 = (uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)v261, (int32x4_t)vceqq_s64(v271, (int64x2_t)xmmword_1904555C0)));
  v272 = a3;
  p_isa = (id *)&v6->super.isa;
  if (!(vmaxv_u16(v11) & 1 | (v7 == 2) | ((isKindOfClass & 1) == 0) | (v7 == 4 || v8)))
  {
    v267 = v8;
    v262 = a4;
    request = v6->_request;
    v15 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v329 = 0;
    v17 = _PKPaymentValidatePropertyMembership(request, CFSTR("countryCode"), v15, v16, a3, &v329);
    v13 = v329;
    v18 = MEMORY[0x1E0C809B0];
    if (!v17)
    {
LABEL_19:

      goto LABEL_20;
    }
    v19 = v6->_request;
    v20 = v6;
    v21 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCurrencyCodes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v328 = v13;
    LODWORD(v21) = _PKPaymentValidatePropertyMembership(v19, CFSTR("currencyCode"), v21, v22, a3, &v328);
    v23 = v328;

    if ((_DWORD)v21)
    {
      v24 = v20->_request;
      v25 = objc_opt_class();
      v327 = v23;
      LOBYTE(v24) = _PKPaymentValidateProperty(v24, CFSTR("applicationData"), v25, 0, a3, (uint64_t)&v327);
      v26 = v327;

      if ((v24 & 1) != 0)
      {
        v27 = v20->_request;
        v28 = (void *)objc_opt_class();
        v326 = v26;
        LODWORD(v27) = _PKPaymentValidatePropertyArray(v27, CFSTR("shippingMethods"), v28, 0, 0, a3, (uint64_t)&v326);
        v13 = v326;

        if ((_DWORD)v27)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke;
          aBlock[3] = &unk_1E2AD3968;
          aBlock[4] = v20;
          v29 = _Block_copy(aBlock);
          v30 = v20->_request;
          v31 = (void *)objc_opt_class();
          v324 = v13;
          v32 = _PKPaymentValidatePropertyArray(v30, CFSTR("paymentSummaryItems"), v31, v29, 1, a3, (uint64_t)&v324);
          v16 = v324;

          v6 = v20;
          if (v32)
          {
            if (-[PKPaymentRequest supportsCouponCode](v20->_request, "supportsCouponCode"))
            {
              v33 = v20->_request;
              v34 = objc_opt_class();
              v323 = v16;
              v17 = _PKPaymentValidateProperty(v33, CFSTR("couponCode"), v34, 0, a3, (uint64_t)&v323);
              v13 = v323;
LABEL_18:
              v18 = MEMORY[0x1E0C809B0];
              goto LABEL_19;
            }
            v17 = 1;
            v13 = v16;
          }
          else
          {
            v17 = 0;
            v13 = v16;
          }
        }
        else
        {
          v17 = 0;
          v6 = v20;
        }
        v18 = MEMORY[0x1E0C809B0];
LABEL_20:
        -[PKPaymentRequest recurringPaymentRequest](v6->_request, "recurringPaymentRequest");
        v35 = objc_claimAutoreleasedReturnValue();

        -[PKPaymentRequest automaticReloadPaymentRequest](v6->_request, "automaticReloadPaymentRequest");
        v36 = v6;
        v37 = objc_claimAutoreleasedReturnValue();

        -[PKPaymentRequest multiTokenContexts](v36->_request, "multiTokenContexts");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v17)
        {
          v40 = 1;
          if (v35 | v37)
          {
            v41 = p_isa;
            if (v39)
            {
              v367 = *MEMORY[0x1E0CB2D50];
              v368[0] = CFSTR("Recurring or automatic reload payment requests and multi-token contexts cannot be used together on the same payment request");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v368, &v367, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v42);
              v43 = objc_claimAutoreleasedReturnValue();

              v40 = 0;
              v13 = (id)v43;
            }
LABEL_26:
            objc_msgSend(v41[1], "deferredPaymentRequest");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40 && v44 && v39)
            {
              v365 = *MEMORY[0x1E0CB2D50];
              v366 = CFSTR("Deferred payment requests and multi-token contexts cannot be used together on the same payment request");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v366, &v365, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (void *)MEMORY[0x1E0CB35C8];
LABEL_30:
              objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v45);
              v47 = objc_claimAutoreleasedReturnValue();

              v48 = 1;
              v13 = (id)v47;
              goto LABEL_35;
            }
            if (v40)
            {
              objc_msgSend(v41[1], "multiTokenContexts");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v49)
              {
                v85 = (void *)MEMORY[0x1E0CB35C8];
                v363 = *MEMORY[0x1E0CB2D50];
                v364 = CFSTR("The multi-token contexts field cannot be nil");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v364, &v363, 1);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v85;
                goto LABEL_30;
              }
              v48 = 0;
            }
            else
            {
              v48 = 1;
            }
LABEL_35:
            v322[0] = v18;
            v322[1] = 3221225472;
            v322[2] = __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_2;
            v322[3] = &unk_1E2AD3968;
            v322[4] = v41;
            v50 = _Block_copy(v322);
            if ((v48 & 1) != 0)
            {
              v12 = 0;
            }
            else
            {
              v51 = v41[1];
              v52 = (void *)objc_opt_class();
              v321 = v13;
              v12 = _PKPaymentValidatePropertyArray(v51, CFSTR("multiTokenContexts"), v52, v50, 0, a3, (uint64_t)&v321);
              v53 = v321;

              if (v12)
              {
                objc_msgSend(v41[1], "paymentSummaryItems");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "lastObject");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "amount");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                v320 = v53;
                v12 = objc_msgSend(p_isa, "_checkMultiTokenTotal:withAPIType:error:", v56, a3, &v320);
                v13 = v320;

                v41 = p_isa;
              }
              else
              {
                v13 = v53;
              }
            }
            objc_msgSend(v41[1], "recurringPaymentRequest");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41[1], "automaticReloadPaymentRequest");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41[1], "deferredPaymentRequest");
            v59 = objc_claimAutoreleasedReturnValue();
            v60 = (void *)v59;
            v61 = v57 != 0;
            v62 = 1;
            if (v57)
              v62 = 2;
            if (v58)
              v61 = v62;
            if (v59)
              ++v61;
            if (v61 >= 2)
            {
              v361 = *MEMORY[0x1E0CB2D50];
              v362 = CFSTR("A payment request can only have one of recurring, automatic reload, or deferred payment request set.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v362, &v361, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v63);
              v64 = (id)objc_claimAutoreleasedReturnValue();

              v12 = 0;
              goto LABEL_48;
            }
            if (v12 && v57)
            {
              v65 = -[PKRecurringPaymentRequestValidator initWithRecurringPaymentRequest:]([PKRecurringPaymentRequestValidator alloc], "initWithRecurringPaymentRequest:", v57);
              objc_msgSend(v41[1], "currencyCode");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKRecurringPaymentRequestValidator setCurrencyCode:](v65, "setCurrencyCode:", v66);

              v319 = v13;
              v12 = -[PKRecurringPaymentRequestValidator isValidWithAPIType:withError:](v65, "isValidWithAPIType:withError:", v272, &v319);
              v67 = v319;

              v13 = v67;
            }
            if (v58 && v12)
            {
              v68 = -[PKAutomaticReloadPaymentRequestValidator initWithAutomaticReloadPaymentRequest:]([PKAutomaticReloadPaymentRequestValidator alloc], "initWithAutomaticReloadPaymentRequest:", v58);
              objc_msgSend(p_isa[1], "currencyCode");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKAutomaticReloadPaymentRequestValidator setCurrencyCode:](v68, "setCurrencyCode:", v69);

              -[PKAutomaticReloadPaymentRequestValidator setRequestType:](v68, "setRequestType:", objc_msgSend(p_isa[1], "requestType"));
              v318 = v13;
              v12 = -[PKAutomaticReloadPaymentRequestValidator isValidWithAPIType:withError:](v68, "isValidWithAPIType:withError:", v272, &v318);
              v70 = v318;

              v13 = v70;
            }
            if (v60 && v12)
            {
              v71 = -[PKDeferredPaymentRequestValidator initWithDeferredPaymentRequest:]([PKDeferredPaymentRequestValidator alloc], "initWithDeferredPaymentRequest:", v60);
              objc_msgSend(p_isa[1], "currencyCode");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDeferredPaymentRequestValidator setCurrencyCode:](v71, "setCurrencyCode:", v72);

              v317 = v13;
              v12 = -[PKDeferredPaymentRequestValidator isValidWithAPIType:withError:](v71, "isValidWithAPIType:withError:", v272, &v317);
              v73 = v317;

              v13 = v73;
            }
            v6 = (PKPaymentRequestValidator *)p_isa;
            if (v12)
            {
              v74 = v269;
              if (v269 == 10 || !v269)
              {
                _PKAllNetworks();
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = v75;
                if (v265 != 8)
                {
                  objc_msgSend(v75, "pk_arrayByRemovingObject:", CFSTR("Barcode"));
                  v77 = objc_claimAutoreleasedReturnValue();

                  v76 = (void *)v77;
                }
                v78 = p_isa[1];
                v79 = (objc_class *)objc_opt_class();
                v80 = objc_opt_class();
                v316 = v13;
                LODWORD(v79) = _PKPaymentValidatePropertyUnion(v78, CFSTR("supportedNetworks"), v79, v80, v76, 1, v272, &v316);
                v81 = v316;

                if (!(_DWORD)v79)
                {
                  v12 = 0;
                  v13 = v81;
                  goto LABEL_50;
                }
                v13 = v81;
                v74 = v269;
                v6 = (PKPaymentRequestValidator *)p_isa;
              }
              if (v264 || v74 == 10 || !v74)
              {
                v82 = v6->_request;
                v315 = v13;
                v12 = _PKPaymentValidateMerchantCapabilities(v82, v272, v74, (uint64_t)&v315);
                v83 = v6;
                v64 = v315;

                if (v12)
                {
                  -[PKPaymentRequest merchantSession](v83->_request, "merchantSession");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v84)
                  {
                    if ((PKBypassCertValidation() & 1) != 0)
                    {
                      v12 = 1;
                      goto LABEL_49;
                    }
                    objc_msgSend(p_isa[1], "merchantSession");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    PKValidatePaymentMerchantSession(v63);
                    v150 = (void *)objc_claimAutoreleasedReturnValue();
                    v12 = v150 == 0;

LABEL_48:
LABEL_49:
                    v13 = v64;
LABEL_50:
                    v6 = (PKPaymentRequestValidator *)p_isa;
                    goto LABEL_81;
                  }
                  if (!-[PKPaymentRequest shouldUseMerchantSession](v83->_request, "shouldUseMerchantSession"))
                  {
                    v168 = v83->_request;
                    v169 = objc_opt_class();
                    v314 = v64;
                    v12 = _PKPaymentValidateProperty(v168, CFSTR("merchantIdentifier"), v169, 1, v272, (uint64_t)&v314);
                    v63 = v64;
                    v64 = v314;
                    goto LABEL_48;
                  }
                  v12 = 1;
                }
                v13 = v64;
                v6 = v83;
              }
              else
              {
                v12 = 1;
              }
            }
LABEL_81:

            a4 = v262;
            a3 = v272;
            v8 = v267;
            if ((v12 & 1) == 0)
              goto LABEL_92;
            goto LABEL_82;
          }
        }
        else
        {
          v40 = 0;
        }
        v41 = p_isa;
        goto LABEL_26;
      }
      v23 = v26;
    }

    v17 = 0;
    v13 = v23;
    v6 = (PKPaymentRequestValidator *)p_isa;
    goto LABEL_18;
  }
  v12 = isKindOfClass;
  v13 = 0;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_92;
LABEL_82:
  if (v265 == 8)
  {
    v86 = v6->_request;
    v87 = objc_opt_class();
    v313 = v13;
    LODWORD(v86) = _PKPaymentValidateProperty(v86, CFSTR("serviceProviderOrder"), v87, 1, a3, (uint64_t)&v313);
    v88 = v313;

    if (!(_DWORD)v86)
      goto LABEL_141;
    -[PKPaymentRequest serviceProviderPaymentRequest](v6->_request, "serviceProviderPaymentRequest");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "serviceProviderOrder");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = objc_opt_class();
    v312 = v88;
    v12 = _PKPaymentValidateProperty(v90, CFSTR("identifier"), v91, 1, a3, (uint64_t)&v312);
    v13 = v312;

    if (!v12)
      goto LABEL_91;
    v92 = objc_opt_class();
    v311 = v13;
    v93 = _PKPaymentValidateProperty(v90, CFSTR("itemDescription"), v92, 0, a3, (uint64_t)&v311);
    v94 = v311;

    if (v93)
    {
      v95 = objc_opt_class();
      v310 = v94;
      v12 = _PKPaymentValidateProperty(v90, CFSTR("serviceProviderIdentifier"), v95, 1, a3, (uint64_t)&v310);
      v13 = v310;

      if (!v12)
      {
LABEL_90:
        v6 = (PKPaymentRequestValidator *)p_isa;
LABEL_91:

        goto LABEL_92;
      }
      v96 = objc_opt_class();
      v309 = v13;
      v12 = _PKPaymentValidateProperty(v90, CFSTR("serviceProviderData"), v96, 0, a3, (uint64_t)&v309);
      v94 = v309;

    }
    else
    {
      v12 = 0;
    }
    v13 = v94;
    goto LABEL_90;
  }
LABEL_92:
  if ((v12 & v8) != 1)
  {
    if ((v12 & 1) != 0)
      goto LABEL_105;
    v135 = 0;
    v88 = v13;
    goto LABEL_167;
  }
  v97 = v6->_request;
  v98 = objc_opt_class();
  v308 = v13;
  LODWORD(v97) = _PKPaymentValidateProperty(v97, CFSTR("peerPaymentQuote"), v98, 1, a3, (uint64_t)&v308);
  v88 = v308;

  if (!(_DWORD)v97)
    goto LABEL_141;
  v99 = v6->_request;
  v100 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCurrencyCodes");
  v101 = (id)objc_claimAutoreleasedReturnValue();
  v307 = v88;
  LODWORD(v99) = _PKPaymentValidatePropertyMembership(v99, CFSTR("currencyCode"), v100, v101, a3, &v307);
  v102 = v6;
  v103 = v307;

  if (!(_DWORD)v99)
    goto LABEL_164;
  v104 = v102->_request;
  v105 = (void *)objc_opt_class();
  v306 = v103;
  LODWORD(v104) = _PKPaymentValidatePropertyArray(v104, CFSTR("shippingMethods"), v105, 0, 0, a3, (uint64_t)&v306);
  v88 = v306;

  if (!(_DWORD)v104)
  {
    v135 = 0;
    v6 = v102;
    goto LABEL_167;
  }
  v305[0] = MEMORY[0x1E0C809B0];
  v305[1] = 3221225472;
  v305[2] = __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_3;
  v305[3] = &unk_1E2AD3968;
  v305[4] = v102;
  v106 = _Block_copy(v305);
  v107 = v102->_request;
  v108 = (void *)objc_opt_class();
  v304 = v88;
  v109 = _PKPaymentValidatePropertyArray(v107, CFSTR("paymentSummaryItems"), v108, v106, 1, a3, (uint64_t)&v304);
  v101 = v304;

  v6 = v102;
  if (!v109)
  {
LABEL_200:
    v135 = 0;
    v88 = v101;
    goto LABEL_167;
  }
  -[PKPaymentRequest peerPaymentRequest](v102->_request, "peerPaymentRequest");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "peerPaymentQuote");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = objc_opt_class();
  v303 = v101;
  LODWORD(v110) = _PKPaymentValidateProperty(v111, CFSTR("appleHash"), v112, 1, a3, (uint64_t)&v303);
  v88 = v303;

  if (!(_DWORD)v110)
    goto LABEL_130;
  v113 = objc_opt_class();
  v302 = v88;
  v114 = _PKPaymentValidateProperty(v111, CFSTR("externalHash"), v113, 1, a3, (uint64_t)&v302);
  v115 = v302;

  if (!v114)
    goto LABEL_209;
  v116 = objc_opt_class();
  v301 = v115;
  v117 = _PKPaymentValidateProperty(v111, CFSTR("totalReceiveAmount"), v116, 1, a3, (uint64_t)&v301);
  v88 = v301;

  if (!v117)
  {
LABEL_130:
    v124 = 0;
    goto LABEL_210;
  }
  v118 = objc_opt_class();
  v300 = v88;
  v119 = _PKPaymentValidateProperty(v111, CFSTR("totalReceiveAmountCurrency"), v118, 1, a3, (uint64_t)&v300);
  v115 = v300;

  if (!v119)
  {
LABEL_209:
    v124 = 0;
    v88 = v115;
    goto LABEL_210;
  }
  v120 = objc_opt_class();
  v299 = v115;
  v121 = _PKPaymentValidateProperty(v111, CFSTR("items"), v120, 1, a3, (uint64_t)&v299);
  v88 = v299;

  if (!v121)
    goto LABEL_130;
  objc_msgSend(v111, "items");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v122, "count");

  if (!v123)
  {
    v213 = (void *)MEMORY[0x1E0CB35C8];
    v359 = *MEMORY[0x1E0CB2D50];
    v360 = CFSTR("Quote items must contain at least one item");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v360, &v359, 1);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v214);
    v115 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_209;
  }
  v124 = 1;
LABEL_210:
  v263 = a4;
  v297 = 0u;
  v298 = 0u;
  v295 = 0u;
  v296 = 0u;
  v260 = v111;
  objc_msgSend(v111, "items");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v295, v358, 16);
  if (!v216)
    goto LABEL_242;
  v217 = v216;
  v218 = *(_QWORD *)v296;
  v266 = *MEMORY[0x1E0CB2D50];
  do
  {
    v219 = 0;
    do
    {
      if (*(_QWORD *)v296 != v218)
        objc_enumerationMutation(v215);
      if ((v124 & 1) != 0)
      {
        v220 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * v219);
        v221 = objc_msgSend(v220, "type");
        if ((unint64_t)(v221 - 2) >= 3)
        {
          if (v221 != 1)
          {
            v234 = (void *)MEMORY[0x1E0CB35C8];
            v356 = v266;
            v357 = CFSTR("Unsupported PKPeerPaymentQuoteItem type");
            v235 = (void *)MEMORY[0x1E0C99D80];
            v236 = &v357;
            v237 = &v356;
            goto LABEL_234;
          }
          v238 = objc_opt_class();
          v294 = v88;
          v239 = _PKPaymentValidateProperty(v220, CFSTR("totalAmount"), v238, 1, v272, (uint64_t)&v294);
          v224 = v294;

          if (!v239)
            goto LABEL_232;
          v240 = objc_opt_class();
          v293 = v224;
          v241 = _PKPaymentValidateProperty(v220, CFSTR("totalAmountCurrency"), v240, 1, v272, (uint64_t)&v293);
          v88 = v293;

          if (!v241)
            goto LABEL_231;
          v242 = (objc_class *)objc_opt_class();
          v243 = objc_opt_class();
          _PKAllNetworks();
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          v292 = v88;
          LODWORD(v243) = _PKPaymentValidatePropertyUnion(v220, CFSTR("supportedNetworks"), v242, v243, v244, 1, v272, &v292);
          v245 = v292;

          if (!(_DWORD)v243)
            goto LABEL_235;
          v246 = objc_opt_class();
          v291 = v245;
          v247 = _PKPaymentValidateProperty(v220, CFSTR("merchantIdentifier"), v246, 1, v272, (uint64_t)&v291);
          v248 = v291;

          if (!v247)
          {
            v245 = v248;
            goto LABEL_235;
          }
          v249 = objc_opt_class();
          v290 = v248;
          v250 = _PKPaymentValidateProperty(v220, CFSTR("countryCode"), v249, 1, v272, (uint64_t)&v290);
          v245 = v290;

          if (!v250)
            goto LABEL_235;
          v289 = v245;
          v251 = _PKPaymentValidateMerchantCapabilities(v220, v272, v269, (uint64_t)&v289);
          v252 = v289;

          if (!v251)
          {
            v245 = v252;
            goto LABEL_235;
          }
          v253 = objc_opt_class();
          v288 = v252;
          v254 = _PKPaymentValidateProperty(v220, CFSTR("nonce"), v253, 1, v272, (uint64_t)&v288);
          v88 = v288;

          if ((v254 & 1) == 0)
          {
LABEL_231:
            v124 = 0;
            goto LABEL_236;
          }
        }
        else
        {
          v222 = objc_opt_class();
          v287 = v88;
          v223 = _PKPaymentValidateProperty(v220, CFSTR("totalAmount"), v222, 1, v272, (uint64_t)&v287);
          v224 = v287;

          if (!v223)
            goto LABEL_232;
          v225 = objc_opt_class();
          v286 = v224;
          v226 = _PKPaymentValidateProperty(v220, CFSTR("totalAmountCurrency"), v225, 1, v272, (uint64_t)&v286);
          v88 = v286;

          if (!v226)
            goto LABEL_231;
          v227 = objc_opt_class();
          v285 = v88;
          v228 = _PKPaymentValidateProperty(v220, CFSTR("countryCode"), v227, 1, v272, (uint64_t)&v285);
          v224 = v285;

          if ((v228 & 1) == 0)
          {
LABEL_232:
            v124 = 0;
            v88 = v224;
            goto LABEL_236;
          }
          v229 = objc_opt_class();
          v284 = v224;
          v230 = _PKPaymentValidateProperty(v220, CFSTR("nonce"), v229, 1, v272, (uint64_t)&v284);
          v88 = v284;

          if (!v230)
            goto LABEL_231;
        }
        objc_msgSend(v220, "totalAmount");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = objc_msgSend(v231, "isEqualToNumber:", v232);

        if (v233)
        {
          v234 = (void *)MEMORY[0x1E0CB35C8];
          v354 = v266;
          v355 = CFSTR("PKPeerPaymentQuoteItem totalAmount value can't be NaN");
          v235 = (void *)MEMORY[0x1E0C99D80];
          v236 = &v355;
          v237 = &v354;
LABEL_234:
          objc_msgSend(v235, "dictionaryWithObjects:forKeys:count:", v236, v237, 1);
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v234, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v244);
          v245 = (id)objc_claimAutoreleasedReturnValue();

LABEL_235:
          v124 = 0;
          v88 = v245;
          goto LABEL_236;
        }
        v124 = 1;
      }
LABEL_236:
      ++v219;
    }
    while (v217 != v219);
    v255 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v295, v358, 16);
    v217 = v255;
  }
  while (v255);
LABEL_242:

  if ((v124 & 1) == 0)
  {
    v135 = 0;
    a4 = v263;
    goto LABEL_244;
  }
  v13 = v88;
  a4 = v263;
  a3 = v272;
  v6 = (PKPaymentRequestValidator *)p_isa;
LABEL_105:
  v125 = v269;
  if (v269 != 1
    && !-[PKPaymentRequest _isPSD2StyleRequest](v6->_request, "_isPSD2StyleRequest")
    && !-[PKPaymentRequest _isAMPApplePayClassicRequest](v6->_request, "_isAMPApplePayClassicRequest"))
  {
    goto LABEL_122;
  }
  v126 = v6->_request;
  v127 = objc_opt_class();
  v283 = v13;
  v128 = _PKPaymentValidateProperty(v126, CFSTR("externalizedContext"), v127, 0, a3, (uint64_t)&v283);
  v129 = v283;

  if (v128)
  {
    v130 = v6->_request;
    v131 = (void *)objc_opt_class();
    v282 = v129;
    v132 = _PKPaymentValidatePropertyArray(v130, CFSTR("paymentContentItems"), v131, 0, 1, a3, (uint64_t)&v282);
    v88 = v282;

    if (v132)
    {
      v133 = v6->_request;
      v134 = objc_opt_class();
      v281 = v88;
      v132 = _PKPaymentValidateProperty(v133, CFSTR("appleIDAuthenticationContext"), v134, 0, a3, (uint64_t)&v281);
      v129 = v281;

      goto LABEL_113;
    }
  }
  else
  {
    v132 = 0;
LABEL_113:
    v88 = v129;
  }
  -[PKPaymentRequest externalizedContext](v6->_request, "externalizedContext");
  v136 = objc_claimAutoreleasedReturnValue();
  if (v136)
  {
    v137 = (void *)v136;
    -[PKPaymentRequest appleIDAuthenticationContext](v6->_request, "appleIDAuthenticationContext");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v138)
    {
      v141 = (void *)MEMORY[0x1E0CB35C8];
      v352 = *MEMORY[0x1E0CB2D50];
      v353 = CFSTR("If you are setting an externalizedContext you must also provide a fallback appleIDAuthenticationContext");
      v142 = (void *)MEMORY[0x1E0C99D80];
      v143 = &v353;
      v144 = &v352;
LABEL_143:
      objc_msgSend(v142, "dictionaryWithObjects:forKeys:count:", v143, v144, 1);
      v101 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v101);
      v103 = (id)objc_claimAutoreleasedReturnValue();

LABEL_164:
      v135 = 0;
LABEL_165:

      v88 = v103;
LABEL_166:
      v6 = (PKPaymentRequestValidator *)p_isa;
      goto LABEL_167;
    }
  }
  if (!v132)
    goto LABEL_141;
  -[PKPaymentRequest paymentContentItems](v6->_request, "paymentContentItems");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v139, "count");

  if (v140 >= 0x65)
  {
    v141 = (void *)MEMORY[0x1E0CB35C8];
    v350 = *MEMORY[0x1E0CB2D50];
    v351 = CFSTR("paymentContentItems may not contain more than 100 items");
    v142 = (void *)MEMORY[0x1E0C99D80];
    v143 = &v351;
    v144 = &v350;
    goto LABEL_143;
  }
  v13 = v88;
  v125 = v269;
LABEL_122:
  if (v125 > 0xD || ((1 << v125) & 0x20C0) == 0)
  {
LABEL_137:
    if (v125 > 0xD || ((1 << v125) & 0x20C0) == 0)
    {
      -[PKPaymentRequest paymentSummaryItems](v6->_request, "paymentSummaryItems");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "lastObject");
      v101 = (id)objc_claimAutoreleasedReturnValue();

      v171 = objc_opt_class();
      if (!_PKPaymentValidateProperty(v101, CFSTR("amount"), v171, 1, a3, 0)
        || (objc_msgSend(v101, "amount"),
            v172 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
            v173 = (void *)objc_claimAutoreleasedReturnValue(),
            v174 = objc_msgSend(v172, "isEqualToNumber:", v173),
            v173,
            v172,
            v174))
      {
        if ((unint64_t)(a3 - 1) >= 2)
          v175 = CFSTR("You must provide a total amount to be charged in the final payment summary item, even if the total item is pending.");
        else
          v175 = CFSTR("You must provide a total amount, even if the total item is pending.");
        v159 = (void *)MEMORY[0x1E0CB35C8];
        v346 = *MEMORY[0x1E0CB2D50];
        v347 = v175;
        v160 = (void *)MEMORY[0x1E0C99D80];
        v161 = (id *)&v347;
        v162 = &v346;
        goto LABEL_163;
      }

      v6 = (PKPaymentRequestValidator *)p_isa;
    }
    -[PKPaymentRequest paymentSummaryItems](v6->_request, "paymentSummaryItems");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend(v155, "count");

    if (v156 >= 0x65)
    {
      v157 = (void *)MEMORY[0x1E0CB3940];
      _PKPaymentRequestGetDescriptivePropertyName(CFSTR("paymentSummaryItems"), a3, (unint64_t)(a3 - 1) < 2);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "stringWithFormat:", CFSTR("%@ may not contain more than 100 items"), v158);
      v101 = (id)objc_claimAutoreleasedReturnValue();

      v159 = (void *)MEMORY[0x1E0CB35C8];
      v344 = *MEMORY[0x1E0CB2D50];
      v345 = v101;
      v160 = (void *)MEMORY[0x1E0C99D80];
      v161 = &v345;
      v162 = &v344;
LABEL_163:
      objc_msgSend(v160, "dictionaryWithObjects:forKeys:count:", v161, v162, 1);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v182);
      v103 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_164;
    }
    -[PKPaymentRequest availableShippingMethods](v6->_request, "availableShippingMethods");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "methods");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_msgSend(v164, "count");

    if (v165 >= 0x65)
    {
      v166 = (void *)MEMORY[0x1E0CB3940];
      _PKPaymentRequestGetDescriptivePropertyName(CFSTR("shippingMethods"), a3, (unint64_t)(a3 - 1) < 2);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "stringWithFormat:", CFSTR("%@ may not contain more than 100 items"), v167);
      v101 = (id)objc_claimAutoreleasedReturnValue();

      v159 = (void *)MEMORY[0x1E0CB35C8];
      v342 = *MEMORY[0x1E0CB2D50];
      v343 = v101;
      v160 = (void *)MEMORY[0x1E0C99D80];
      v161 = &v343;
      v162 = &v342;
      goto LABEL_163;
    }
    -[PKPaymentRequest applicationData](v6->_request, "applicationData");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = (unint64_t)objc_msgSend(v176, "length") < 0x401 || v264;

    if ((v177 & 1) == 0)
    {
      v180 = (void *)MEMORY[0x1E0CB3940];
      _PKPaymentRequestGetDescriptivePropertyName(CFSTR("applicationData"), a3, (unint64_t)(a3 - 1) < 2);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "stringWithFormat:", CFSTR("%@ may not be more than 1024 bytes"), v181);
      v101 = (id)objc_claimAutoreleasedReturnValue();

      v159 = (void *)MEMORY[0x1E0CB35C8];
      v340 = *MEMORY[0x1E0CB2D50];
      v341 = v101;
      v160 = (void *)MEMORY[0x1E0C99D80];
      v161 = &v341;
      v162 = &v340;
      goto LABEL_163;
    }
    if (!-[PKPaymentRequest isShippingEditable](v6->_request, "isShippingEditable"))
    {
      -[PKPaymentRequest shippingContact](v6->_request, "shippingContact");
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v178)
      {
        v200 = (void *)MEMORY[0x1E0CB3940];
        _PKPaymentRequestGetDescriptivePropertyName(CFSTR("shippingEditable"), a3, 0);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v200, "stringWithFormat:", CFSTR("When %@ is set to NO a shipping contact must be provided"), v201);
        v101 = (id)objc_claimAutoreleasedReturnValue();

        v159 = (void *)MEMORY[0x1E0CB35C8];
        v338 = *MEMORY[0x1E0CB2D50];
        v339 = v101;
        v160 = (void *)MEMORY[0x1E0C99D80];
        v161 = &v339;
        v162 = &v338;
        goto LABEL_163;
      }
    }
    if (-[PKPaymentRequest APIType](v6->_request, "APIType") >= 5)
    {
      v179 = (void *)MEMORY[0x1E0CB35C8];
      v336 = *MEMORY[0x1E0CB2D50];
      v337 = CFSTR("The API type is not valid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v337, &v336, 1);
      v101 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v101);
      v103 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_164;
    }
    if (v269 > 0xD || ((1 << v269) & 0x20C0) == 0)
    {
      -[PKPaymentRequest paymentSummaryItems](v6->_request, "paymentSummaryItems");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "lastObject");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "amount");
      v211 = v6;
      v212 = (void *)objc_claimAutoreleasedReturnValue();

      v278 = v13;
      LODWORD(v209) = -[PKPaymentRequestValidator _checkTotal:withAPIType:error:](v211, "_checkTotal:withAPIType:error:", v212, a3, &v278);
      v88 = v278;

      if (!(_DWORD)v209)
      {
        v135 = 0;
        goto LABEL_166;
      }
      v13 = v88;
      v6 = (PKPaymentRequestValidator *)p_isa;
    }
    -[PKPaymentRequest supportedCountries](v6->_request, "supportedCountries");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = objc_msgSend(v194, "count");

    if (v195)
    {
      v196 = v6->_request;
      v197 = (objc_class *)objc_opt_class();
      v198 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = v13;
      LODWORD(v196) = _PKPaymentValidatePropertyUnion(v196, CFSTR("supportedCountries"), v197, v198, v199, 0, a3, &v277);
      v88 = v277;

      v6 = (PKPaymentRequestValidator *)p_isa;
      v135 = 0;
      if (!(_DWORD)v196)
        goto LABEL_167;
    }
    else
    {
      v88 = v13;
    }
    if (v264)
    {
      if (v269 == 3)
      {
        -[PKPaymentRequest merchantSession](v6->_request, "merchantSession");
        v202 = (void *)objc_claimAutoreleasedReturnValue();

        if (v202)
        {
          v203 = v6->_request;
          v204 = objc_opt_class();
          v276 = v88;
          v205 = _PKPaymentValidateProperty(v203, CFSTR("passTypeIdentifier"), v204, 1, a3, (uint64_t)&v276);
          v101 = v276;

          if (v205)
          {
            v206 = v6->_request;
            v207 = objc_opt_class();
            v275 = v101;
            v135 = _PKPaymentValidateProperty(v206, CFSTR("passSerialNumber"), v207, 1, a3, (uint64_t)&v275);
            v103 = v275;
            goto LABEL_165;
          }
          goto LABEL_200;
        }
      }
    }
    else
    {
      if (!-[PKPaymentRequest isVirtualCardRequest](v6->_request, "isVirtualCardRequest"))
      {
        -[PKPaymentRequest peerPaymentRequest](v6->_request, "peerPaymentRequest");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        if (v208)
        {

        }
        else
        {
          -[PKPaymentRequest passTypeIdentifier](v6->_request, "passTypeIdentifier");
          v257 = (void *)objc_claimAutoreleasedReturnValue();

          if (v257)
          {
            v141 = (void *)MEMORY[0x1E0CB35C8];
            v334 = *MEMORY[0x1E0CB2D50];
            v335 = CFSTR("This sort of request may not use the passTypeIdentifier field");
            v142 = (void *)MEMORY[0x1E0C99D80];
            v143 = &v335;
            v144 = &v334;
            goto LABEL_143;
          }
        }
      }
      if (!-[PKPaymentRequest isVirtualCardRequest](v6->_request, "isVirtualCardRequest"))
      {
        -[PKPaymentRequest peerPaymentRequest](v6->_request, "peerPaymentRequest");
        v256 = objc_claimAutoreleasedReturnValue();
        if (v256)
        {
          v101 = (id)v256;
          v135 = 1;
          v103 = v88;
        }
        else
        {
          objc_msgSend(p_isa[1], "passSerialNumber");
          v258 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v258)
          {
            v135 = 1;
LABEL_244:
            a3 = v272;
            goto LABEL_166;
          }
          v259 = (void *)MEMORY[0x1E0CB35C8];
          v332 = *MEMORY[0x1E0CB2D50];
          v333 = CFSTR("This sort of request may not use the passSerialNumber field");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v333, &v332, 1);
          v101 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v259, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v101);
          v103 = (id)objc_claimAutoreleasedReturnValue();

          v135 = 0;
          a3 = v272;
        }
        goto LABEL_165;
      }
    }
    v135 = 1;
    goto LABEL_167;
  }
  v145.i64[1] = v261.i64[1];
  *(int32x2_t *)v145.i8 = vmovn_s64(v261);
  v268 = vmovn_s32(v145).u8[0];
  v146 = v6->_request;
  v147 = objc_opt_class();
  v280 = v13;
  v148 = _PKPaymentValidateProperty(v146, CFSTR("externalizedContext"), v147, 0, a3, (uint64_t)&v280);
  v88 = v280;

  if ((v268 & 1) == 0 && v148)
  {
    -[PKPaymentRequest clientViewSourceIdentifier](v6->_request, "clientViewSourceIdentifier");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (v149)
    {
      v148 = 1;
    }
    else
    {
      v151 = v6->_request;
      v152 = (void *)objc_opt_class();
      v279 = v88;
      v148 = _PKPaymentValidatePropertyArray(v151, CFSTR("paymentContentItems"), v152, 0, 1, a3, (uint64_t)&v279);
      v153 = v279;

      v88 = v153;
    }

  }
  -[PKPaymentRequest externalizedContext](v6->_request, "externalizedContext");
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v154)
  {
    v141 = (void *)MEMORY[0x1E0CB35C8];
    v348 = *MEMORY[0x1E0CB2D50];
    v349 = CFSTR("An externalizedContext must be set");
    v142 = (void *)MEMORY[0x1E0C99D80];
    v143 = &v349;
    v144 = &v348;
    goto LABEL_143;
  }
  if (v148)
  {
    v13 = v88;
    v125 = v269;
    goto LABEL_137;
  }
LABEL_141:
  v135 = 0;
LABEL_167:
  -[PKPaymentRequest paymentSummaryItems](v6->_request, "paymentSummaryItems");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend(v183, "pk_containsObjectPassingTest:", &__block_literal_global_448);

  if (v269 != 10 && v135 && v184)
  {
    PKLogFacilityTypeGetObject(0);
    v185 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v185, OS_LOG_TYPE_ERROR, "PKPaymentRequests cannot contain disbursement specific summary items", buf, 2u);
    }

    if (!a4)
    {
LABEL_185:
      LOBYTE(v135) = 0;
      goto LABEL_186;
    }
LABEL_181:
    if (v88)
    {
      v330[0] = *MEMORY[0x1E0CB2D50];
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INVALID_PAYMENT"), 0);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v330[1] = *MEMORY[0x1E0CB3388];
      v331[0] = v191;
      v331[1] = v88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v331, v330, 2);
      v192 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v192 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v192);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_185;
  }
  v186 = v135 ^ 1;
  if (v269 != 10)
    v186 = 1;
  if ((v186 & 1) == 0)
  {
    -[PKPaymentRequest disbursementPaymentRequest](v6->_request, "disbursementPaymentRequest");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = -[PKDisbursementPaymentRequestValidator initWithDisbursementPaymentRequest:]([PKDisbursementPaymentRequestValidator alloc], "initWithDisbursementPaymentRequest:", v187);
    -[PKPaymentRequest currencyCode](v6->_request, "currencyCode");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDisbursementPaymentRequestValidator setCurrencyCode:](v188, "setCurrencyCode:", v189);

    v273 = v88;
    v135 = -[PKDisbursementPaymentRequestValidator isValidWithAPIType:withError:](v188, "isValidWithAPIType:withError:", a3, &v273);
    v190 = v273;

    v88 = v190;
  }
  if (a4)
  {
    if (!v135)
      goto LABEL_181;
    *a4 = 0;
    LOBYTE(v135) = 1;
  }
LABEL_186:

  return v135;
}

void __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v4 = v6;
    objc_msgSend(v3, "currencyCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrencyCode:", v5);

  }
}

void __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v4 = v6;
    objc_msgSend(v3, "currencyCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrencyCode:", v5);

  }
}

void __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v4 = v6;
    objc_msgSend(v3, "currencyCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrencyCode:", v5);

  }
}

uint64_t __58__PKPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
