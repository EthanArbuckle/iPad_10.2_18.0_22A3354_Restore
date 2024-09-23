@implementation PKPassFrontFaceImage

void __PKPassFrontFaceImage_block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CGColor *CopyWithAlpha;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CGColor *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGPDFDocument *v26;
  CGPDFPage *Page;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  unsigned int v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double (**v67)(void *, double);
  double (**v68)(void *, double);
  double v69;
  double v70;
  double v71;
  double v72;
  double (**v73)(void *, double);
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  CGSize v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  uint64_t v116;
  void *v117;
  id v118;
  void *v119;
  const __CFAttributedString *v120;
  void *v121;
  void *v122;
  _BOOL4 v123;
  id v124;
  uint64_t v125;
  id v126;
  void *v127;
  void *v128;
  uint64_t v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  CGSize v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGSize v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  CGFloat v145;
  const __CFAttributedString *v146;
  const __CFAttributedString *v147;
  const __CTFramesetter *v148;
  CGSize v149;
  double v150;
  double v151;
  double v152;
  CGFloat v153;
  void *v154;
  id v155;
  __int128 v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  double v165;
  double v166;
  uint64_t v167;
  double v168;
  double v169;
  double v170;
  double v171;
  id v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  void *v178;
  id v184;
  id v185;
  id v186;
  void *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  unint64_t v193;
  __CFString *v194;
  void *v195;
  void *v196;
  id v197;
  double v198;
  double v199;
  double v200;
  CGFloat y;
  __int128 v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  BOOL IsNull;
  double *v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double MidX;
  double v217;
  double v218;
  double v219;
  double MaxY;
  double MidY;
  CTFontRef UIFontForLanguage;
  uint64_t v223;
  double v224;
  double MaxX;
  double v226;
  __int128 v227;
  double height;
  double v229;
  CGFloat x;
  CGFloat v231;
  CGFloat width;
  CGFloat v233;
  void *v234;
  CGColor *v235;
  double v236;
  double v237;
  double v238;
  double v239;
  unint64_t v240;
  void *v241;
  __int128 v242;
  id v243;
  void *v244;
  uint64_t v245;
  id v246;
  void *v247;
  void *v248;
  id v249;
  id v250;
  double v251;
  CGRect *p_slice;
  CGColor *v253;
  CGBlendMode v254;
  CGColor *GenericGray;
  CGColor *v256;
  CGColor *v257;
  const __CFArray *v258;
  CGGradient *v259;
  CGFloat v260;
  CGFloat v261;
  CGFloat v262;
  CGFloat v263;
  id v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t i;
  void *v268;
  void *v269;
  __int128 v270;
  CGColor *v271;
  uint64_t v272;
  double v273;
  double v274;
  double v275;
  int v276;
  const void *v277;
  void **v278;
  uint64_t v279;
  void **v280;
  void *v281;
  void *v282;
  id v283;
  CTParagraphStyleRef cf;
  void *v285;
  uint64_t v286;
  void *v287;
  const __CTFramesetter *v288;
  CTFramesetterRef v289;
  double MinX;
  const __CTFramesetter *framesettera;
  CTFramesetterRef framesetter;
  double framesetterb;
  CFAttributedStringRef v294;
  const __CFAttributedString *v295;
  CFAttributedStringRef v296;
  double v297;
  double attrString;
  const __CFAttributedString *attrStringa;
  CFAttributedStringRef attrStringb;
  double attrStringc;
  void *context;
  double contexta;
  void *v304;
  double MinY;
  double constraints;
  CGSize constraintsa;
  double constraintsb;
  double rect;
  double recta;
  float64x2_t rectc;
  void *rectb;
  id v313;
  CGFloat v314;
  CGRect v315;
  CGFloat v316;
  CGFloat v317;
  CGFloat v318;
  void (**v319)(void *, _QWORD *, double, double, double, double);
  CGFloat v320;
  double v321;
  CGFloat v322;
  CGFloat v323;
  _QWORD v324[6];
  __int128 v325;
  __int128 v326;
  uint64_t v327;
  uint64_t v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  _QWORD v333[5];
  __int128 v334;
  __int128 v335;
  uint64_t v336;
  unint64_t v337;
  unint64_t v338;
  unint64_t v339;
  unint64_t v340;
  unint64_t v341;
  unint64_t v342;
  unint64_t v343;
  unint64_t v344;
  _QWORD v345[4];
  id v346;
  __int128 v347;
  __int128 v348;
  CGContextRef v349;
  _QWORD v350[4];
  id v351;
  id v352;
  double v353;
  double v354;
  double v355;
  double v356;
  CGContextRef v357;
  float64x2_t v358;
  CGSize v359;
  _QWORD v360[4];
  id v361;
  CGContextRef v362;
  __int128 v363;
  __int128 v364;
  double v365;
  double v366;
  double v367;
  double v368;
  _QWORD v369[5];
  _QWORD v370[5];
  __int128 v371;
  __int128 v372;
  CGContextRef v373;
  _QWORD v374[4];
  id v375;
  __int128 v376;
  __int128 v377;
  CGContextRef v378;
  _QWORD v379[4];
  const __CFAttributedString *v380;
  CGContextRef v381;
  double v382;
  CGFloat v383;
  double v384;
  double v385;
  const __CTFramesetter *v386;
  _QWORD v387[4];
  const __CFAttributedString *v388;
  CGContextRef v389;
  double v390;
  CGFloat v391;
  double v392;
  double v393;
  const __CTFramesetter *v394;
  _QWORD v395[4];
  const __CFAttributedString *v396;
  CGContextRef v397;
  double v398;
  CGFloat v399;
  double v400;
  double v401;
  const __CTFramesetter *v402;
  _QWORD v403[4];
  id v404;
  CGContextRef v405;
  double v406;
  double v407;
  double v408;
  double v409;
  uint64_t v410;
  _QWORD v411[4];
  id v412;
  CGContextRef v413;
  double v414;
  double v415;
  double v416;
  double v417;
  _QWORD v418[4];
  id v419;
  CGContextRef v420;
  double v421;
  double v422;
  double v423;
  double v424;
  uint64_t v425;
  _QWORD v426[4];
  id v427;
  CGContextRef v428;
  double v429;
  double v430;
  double v431;
  double v432;
  uint64_t v433;
  _QWORD v434[4];
  id v435;
  CGContextRef v436;
  double v437;
  double v438;
  double v439;
  double v440;
  uint64_t v441;
  CGRect remainder;
  _QWORD v443[5];
  _QWORD aBlock[4];
  id v445;
  CGFloat v446;
  CGFloat v447;
  CGFloat v448;
  CGFloat v449;
  CGFloat v450;
  CGFloat v451;
  CGFloat v452;
  double v453;
  _QWORD v454[4];
  CGRect v455;
  __int128 v456;
  __int128 v457;
  unsigned int v458;
  CGAffineTransform v459;
  char v460;
  _BYTE v461[128];
  _QWORD v462[3];
  _QWORD v463[3];
  CTParagraphStyleSetting settings;
  CGRect buf;
  __int128 v466;
  __int128 v467;
  unint64_t v468;
  CGRect slice;
  __int128 v470;
  __int128 v471;
  unint64_t v472;
  uint64_t v473;
  CFRange v474;
  CFRange v475;
  CFRange v476;
  CGSize v477;
  CGSize v478;
  CGSize v479;
  CGPoint v480;
  CGPoint v481;
  CGRect v482;
  CGRect v483;
  CGRect v484;
  CGRect v485;
  CGRect v486;
  CGRect v487;
  CGRect v488;
  CGRect v489;
  CGRect v490;
  CGRect v491;
  CGRect v492;
  CGRect v493;
  CGRect v494;
  CGRect v495;
  CGRect v496;
  CGRect v497;
  CGRect v498;
  CGRect v499;
  CGRect v500;
  CGRect v501;
  CGRect v502;
  CGRect v503;
  CGRect v504;
  CGRect v505;

  v3 = a1;
  v473 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 488))
  {
    CGContextScaleCTM(c, *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 112));
    CGContextGetCTM(&v459, c);
    a1 = CGContextSetBaseCTM();
  }
  v4 = (void *)MEMORY[0x19400CFE8](a1);
  objc_msgSend(*(id *)(v3 + 32), "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 32), "secondaryBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(objc_retainAutorelease(v5), "CGColor"), 1.0);
  }
  else
  {
    +[PKColor colorWithR:G:B:A:](PKColor, "colorWithR:G:B:A:", 0.0, 0.0, 0.0, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CopyWithAlpha = CGColorRetain((CGColorRef)objc_msgSend(v8, "CGColor"));

  }
  CGContextSaveGState(c);
  CGContextSetBlendMode(c, kCGBlendModeCopy);
  CGContextSetFillColorWithColor(c, CopyWithAlpha);
  CGContextFillRect(c, *(CGRect *)(v3 + 120));
  CGContextRestoreGState(c);
  CGColorRelease(CopyWithAlpha);
  if (*(_BYTE *)(v3 + 489))
  {
    v9 = *(void **)(v3 + 40);
    if (v9)
    {
      objc_msgSend(v9, "size");
      v11 = v10;
      v13 = v12;
      v14 = *(double *)(v3 + 168);
      v15 = *(double *)(v3 + 176);
      v16 = v14 / v11;
      if (v11 == 0.0)
        v16 = 1.0;
      v17 = v15 / v13;
      if (v13 == 0.0)
        v17 = 1.0;
      if (fmax(v16, v17) == 1.0)
      {
        v15 = v13;
        v14 = v11;
      }
      else if (v16 <= v17)
      {
        v14 = v15 * (v11 / v13);
      }
      else
      {
        v15 = v14 * (v13 / v11);
      }
      v29 = PKSizeCeilToPixelWithScale(v14, v15, *(double *)(v3 + 112));
      if (*(_QWORD *)(v3 + 184) == 9)
        v31 = 1;
      else
        v31 = 0x100000001;
      v22 = PKSizeAlignedInRectWithScale(v31, v29, v30, *(CGFloat *)(v3 + 152), *(CGFloat *)(v3 + 160), *(CGFloat *)(v3 + 168), *(CGFloat *)(v3 + 176), *(double *)(v3 + 112));
      v23 = v32;
      v24 = v33;
      v25 = v34;
      objc_msgSend(*(id *)(v3 + 40), "drawInRect:inContext:", c);
    }
    else
    {
      v22 = *MEMORY[0x1E0C9D628];
      v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v26 = *(CGPDFDocument **)(v3 + 192);
      if (v26)
      {
        if (CGPDFDocumentGetNumberOfPages(v26))
        {
          Page = CGPDFDocumentGetPage(*(CGPDFDocumentRef *)(v3 + 192), 1uLL);
          if (Page)
          {
            v22 = *(double *)(v3 + 152);
            v23 = *(double *)(v3 + 160);
            v24 = *(double *)(v3 + 168);
            v25 = *(double *)(v3 + 176);
            _DrawPDFPageInRect(c, Page, v22, v23, v24, v25);
          }
        }
      }
    }
    v482.origin.x = v22;
    v482.origin.y = v23;
    v482.size.width = v24;
    v482.size.height = v25;
    if (!CGRectIsEmpty(v482))
    {
      v35 = *(_QWORD *)(v3 + 184);
      if (v35 != 6 && v35 != 9)
      {
        v483.origin.x = v22;
        v483.origin.y = v23;
        v483.size.width = v24;
        v483.size.height = v25;
        v484 = CGRectIntersection(v483, *(CGRect *)(v3 + 120));
        if (*(_BYTE *)(v3 + 488))
        {
          v36 = *(double *)(v3 + 112);
          v484.origin.x = v484.origin.x * v36;
          v484.origin.y = v484.origin.y * v36;
          v484.size.width = v484.size.width * v36;
          v484.size.height = v484.size.height * v36;
        }
        v485 = CGRectIntegral(v484);
        v37 = vcvtpd_s64_f64(*(double *)(v3 + 112) * 7.0);
        v38 = *(void **)(v3 + 48);
        v454[0] = MEMORY[0x1E0C809B0];
        v454[1] = 3221225472;
        v454[2] = __PKPassFrontFaceImage_block_invoke_2;
        v454[3] = &__block_descriptor_100_e79_v24__0r__vImage_CGImageFormat_II__CGColorSpace_II_di_8r__vImage_Buffer__vQQQ_16l;
        v455 = v485;
        v456 = *(_OWORD *)(v3 + 200);
        v457 = *(_OWORD *)(v3 + 216);
        v458 = v37;
        objc_msgSend(v38, "accessData:", v454);
      }
    }
  }
  else
  {
    v18 = objc_retainAutorelease(v5);
    _DrawColorInRect(c, (CGColor *)objc_msgSend(v18, "CGColor"), (CGColor *)objc_msgSend(objc_retainAutorelease(v6), "CGColor"), *(CGFloat *)(v3 + 152), *(CGFloat *)(v3 + 160), *(CGFloat *)(v3 + 168), *(CGFloat *)(v3 + 176));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24) = 1;
    v19 = (CGColor *)objc_msgSend(objc_retainAutorelease(v18), "CGColor");
    if (v19)
    {
      v20 = PKColorGetRelativeLuminance(v19) / 100.0;
      if (v20 <= 0.00885645168)
        v21 = v20 * 7.78703704 + 0.137931034;
      else
        v21 = pow(v20, 0.333333333);
      v28 = (v21 * 116.0 + -16.0) / 100.0;
    }
    else
    {
      v28 = 0.0;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24) = v28;
    PKLogFacilityTypeGetObject(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24);
      LODWORD(buf.origin.x) = 134217984;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v40;
      _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Color sampled for lightness: %f.", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v4);
  CGContextSaveGState(c);
  CGContextTranslateCTM(c, *(CGFloat *)(v3 + 240), *(CGFloat *)(v3 + 232));
  v41 = *(double *)(v3 + 264);
  rect = *(double *)(v3 + 272);
  v42 = _FrontFacePartialBlurRect(*(_QWORD *)(v3 + 184));
  v317 = v43;
  v318 = v42;
  v314 = v45;
  v316 = v44;
  v46 = objc_msgSend(*(id *)(v3 + 32), "suppressesHeaderDarkening");
  v48 = *MEMORY[0x1E0C9D538];
  v47 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v46 || *(_QWORD *)(v3 + 184) != 9)
  {
    v322 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v323 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v320 = *MEMORY[0x1E0C9D628];
    v321 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v49 = *(double *)(v3 + 112);
    PKGetMaxPassWidth();
    v51 = v50;
    v52 = v49;
    if (v49 == 0.0)
      v52 = PKScreenScale();
    _ZF = v52 == 0.0;
    v53 = round(v51);
    v54 = round(v51 * v52) / v52;
    if (_ZF)
      v54 = v53;
    v323 = v54;
    if (v49 == 0.0)
      v49 = PKScreenScale();
    v55 = round(v51 / 358.0 * 448.0) / 3.0;
    if (v49 == 0.0)
    {
      v321 = round(v55);
      v322 = v47;
      v320 = v48;
    }
    else
    {
      v320 = v48;
      v321 = round(v55 * v49) / v49;
      v322 = v47;
    }
  }
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __PKPassFrontFaceImage_block_invoke_35;
  aBlock[3] = &unk_1E2AD8130;
  v446 = v318;
  v447 = v317;
  v448 = v316;
  v449 = v314;
  v450 = v320;
  v451 = v322;
  v452 = v323;
  v453 = v321;
  v313 = v56;
  v445 = v313;
  v319 = (void (**)(void *, _QWORD *, double, double, double, double))_Block_copy(aBlock);
  if (*(_QWORD *)(v3 + 184) == 6)
  {
    _PKPassDictionaryFromBundle(*(void **)(v3 + 56));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v3 + 56), "bundleURL");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    PKPrivateObjectDictionaryWithError(v58, 0);
    v304 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = *(double *)(v3 + 264);
    v60 = PKPaymentPassContentInsets();
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v443[0] = MEMORY[0x1E0C809B0];
    v443[1] = 3221225472;
    v443[2] = __PKPassFrontFaceImage_block_invoke_2_37;
    v443[3] = &__block_descriptor_40_e8_d16__0d8l;
    attrString = v59 / 375.0;
    *(double *)&v443[4] = v59 / 375.0;
    v67 = (double (**)(void *, double))_Block_copy(v443);
    v68 = v67;
    v69 = v48 + v62;
    v70 = v47 + v60;
    v71 = v62 + v66;
    constraints = v41 - v71;
    recta = rect - (v60 + v64);
    if (!*(_BYTE *)(v3 + 490))
      goto LABEL_62;
    v72 = *(double *)(v3 + 264);
    v73 = v67 + 2;
    v74 = v67[2](v67, 69.0);
    v75 = (*v73)(v68, 112.0);
    v76 = (*v73)(v68, 69.0);
    buf.origin.x = v69;
    buf.origin.y = v70;
    v77 = constraints;
    buf.size.width = constraints;
    v78 = recta;
    buf.size.height = recta;
    v79 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v79;
    memset(&remainder, 0, sizeof(remainder));
    v80 = v69;
    v79.width = v70;
    CGRectDivide(*(CGRect *)(&v77 - 2), &slice, &buf, v74, CGRectMinYEdge);
    v81 = PKSizeAlignedInRectWithScale(0x100000001uLL, v72 - v71, v74, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, *(double *)(v3 + 112));
    v83 = v82;
    v85 = v84;
    v87 = v86;
    _FetchImageNamed(CFSTR("cobrandLogo"), *(void **)(v3 + 56), *(void **)(v3 + 64), *(double *)(v3 + 112));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    if (v88)
    {
      v434[0] = MEMORY[0x1E0C809B0];
      v434[1] = 3221225472;
      v434[2] = __PKPassFrontFaceImage_block_invoke_3;
      v434[3] = &unk_1E2AD8158;
      v436 = c;
      v435 = v88;
      v437 = v81;
      v438 = v83;
      v439 = v85;
      v440 = v87;
      v441 = *(_QWORD *)(v3 + 112);
      v319[2](v319, v434, v81, v83, v85, v87);

      v90 = 1;
    }
    else
    {
      v90 = 0;
    }
    _FetchImageNamed(CFSTR("bankLogo"), *(void **)(v3 + 56), *(void **)(v3 + 64), *(double *)(v3 + 112));
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      v426[0] = MEMORY[0x1E0C809B0];
      v426[1] = 3221225472;
      v426[2] = __PKPassFrontFaceImage_block_invoke_4;
      v426[3] = &unk_1E2AD8158;
      v428 = c;
      v427 = v91;
      v429 = v81;
      v430 = v83;
      v431 = v85;
      v432 = v87;
      v433 = *(_QWORD *)(v3 + 112);
      v319[2](v319, v426, v81, v83, v85, v87);

      v90 = 1;
    }
    CGRectDivide(buf, &slice, &buf, v76, CGRectMaxYEdge);
    CGRectDivide(slice, &slice, &remainder, v75, CGRectMaxXEdge);
    v92 = PKSizeAlignedInRectWithScale(0x100000001uLL, v75, v76, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, *(double *)(v3 + 112));
    v94 = v93;
    v96 = v95;
    v98 = v97;
    _FetchImageNamed(CFSTR("networkLogo"), *(void **)(v3 + 56), *(void **)(v3 + 64), *(double *)(v3 + 112));
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      v418[0] = MEMORY[0x1E0C809B0];
      v418[1] = 3221225472;
      v418[2] = __PKPassFrontFaceImage_block_invoke_5;
      v418[3] = &unk_1E2AD8158;
      v420 = c;
      v100 = v99;
      v419 = v100;
      v421 = v92;
      v422 = v94;
      v423 = v96;
      v424 = v98;
      v425 = *(_QWORD *)(v3 + 112);
      v319[2](v319, v418, v92, v94, v96, v98);
      v101 = v419;
LABEL_60:

      goto LABEL_62;
    }
    if (v90)
    {
LABEL_62:
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("paymentApplications"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v470 = 0u;
      v471 = 0u;
      memset(&slice, 0, sizeof(slice));
      v103 = v102;
      v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &slice, &buf, 16);
      if (v104)
      {
        v105 = **(_QWORD **)&slice.size.width;
LABEL_64:
        v106 = 0;
        while (1)
        {
          if (**(_QWORD **)&slice.size.width != v105)
            objc_enumerationMutation(v103);
          objc_msgSend(*(id *)(*(_QWORD *)&slice.origin.y + 8 * v106), "objectForKeyedSubscript:", CFSTR("paymentType"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v107;
          if (v107)
            break;
          if (v104 == ++v106)
          {
            v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &slice, &buf, 16);
            if (v104)
              goto LABEL_64;
            goto LABEL_70;
          }
        }
        v109 = PKPaymentMethodTypeForString(v107);

        _ZF = (unint64_t)(v109 - 1001) > 3 || v109 == 1002;
        if (_ZF)
          goto LABEL_76;
LABEL_91:

        if (*(_QWORD *)(v3 + 184) == 6)
          goto LABEL_152;
        goto LABEL_92;
      }
LABEL_70:

LABEL_76:
      objc_msgSend(*(id *)(v3 + 32), "foregroundColor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      PKGetMaxPassWidth();
      v113 = v112;
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("sanitizedPrimaryAccountName"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      v115 = round(v113 / 375.0 * 17.0 + v113 / 375.0 * 17.0) * 0.5;
      if (v114)
      {
        context = (void *)MEMORY[0x19400CFE8]();
        v116 = objc_msgSend(objc_retainAutorelease(v111), "CGColor");
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("sanitizedPrimaryAccountName"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (v117)
        {
          v118 = objc_alloc(MEMORY[0x1E0CB3498]);
          _PANStringAttributes(v116, 0, v115);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = (const __CFAttributedString *)objc_msgSend(v118, "initWithString:attributes:", v117, v119);

        }
        else
        {
          v120 = 0;
        }

        v148 = CTFramesetterCreateWithAttributedString(v120);
        v476.length = -[__CFAttributedString length](v120, "length");
        v476.location = 0;
        v479.width = constraints;
        v479.height = recta;
        v149 = CTFramesetterSuggestFrameSizeWithConstraints(v148, v476, 0, v479, 0);
        v150 = PKSizeCeilToPixelWithScale(v149.width, v149.height, 0.0);
        v152 = v151;
        v487.origin.x = v69;
        v487.origin.y = v70;
        v487.size.width = constraints;
        v487.size.height = recta;
        v153 = CGRectGetMaxY(v487) - v152;
        v395[0] = MEMORY[0x1E0C809B0];
        v395[1] = 3221225472;
        v395[2] = __PKPassFrontFaceImage_block_invoke_8;
        v395[3] = &unk_1E2AD8158;
        v397 = c;
        v146 = v120;
        v396 = v146;
        v398 = v69;
        v399 = v153;
        v400 = v150;
        v401 = v152;
        v402 = v148;
        v319[2](v319, v395, v69, v153, v150, v152);
        CFRelease(v148);
        v147 = v396;
      }
      else
      {
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("primaryAccountSuffix"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v121)
          goto LABEL_90;
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("dynamicLayerConfiguration"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v122 == 0;

        if (!v123)
          goto LABEL_90;
        context = (void *)MEMORY[0x19400CFE8]();
        v124 = objc_retainAutorelease(v111);
        v125 = objc_msgSend(v124, "CGColor");
        v126 = objc_alloc(MEMORY[0x1E0CB3498]);
        PKPANMask();
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        _PANStringAttributes(v125, 1, v115);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        attrStringa = (const __CFAttributedString *)objc_msgSend(v126, "initWithString:attributes:", v127, v128);

        v129 = objc_msgSend(objc_retainAutorelease(v124), "CGColor");
        v130 = v57;
        objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("primaryAccountSuffix"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v294 = (CFAttributedStringRef)objc_alloc(MEMORY[0x1E0CB3498]);
        v132 = v131;
        if (!v131)
        {
          _PKPaymentPassDefaultSuffixFromDictionary(v130);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
        }
        _PANStringAttributes(v129, v131 == 0, v115);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v295 = -[__CFAttributedString initWithString:attributes:](v294, "initWithString:attributes:", v132, v133);

        if (!v131)
        framesettera = CTFramesetterCreateWithAttributedString(attrStringa);
        v288 = CTFramesetterCreateWithAttributedString(v295);
        v474.length = -[__CFAttributedString length](attrStringa, "length");
        v474.location = 0;
        v477.width = constraints;
        v477.height = recta;
        v134 = CTFramesetterSuggestFrameSizeWithConstraints(framesettera, v474, 0, v477, 0);
        v135 = PKSizeCeilToPixelWithScale(v134.width, v134.height, 0.0);
        v137 = v136;
        v475.length = -[__CFAttributedString length](v295, "length");
        v138 = v135 + 6.0;
        v478.width = constraints - (v135 + 6.0);
        v475.location = 0;
        v478.height = recta;
        v139 = CTFramesetterSuggestFrameSizeWithConstraints(v288, v475, 0, v478, 0);
        v140 = PKSizeCeilToPixelWithScale(v139.width, v139.height, 0.0);
        v142 = v141;
        v486.origin.x = v69;
        v486.origin.y = v70;
        v486.size.width = constraints;
        v486.size.height = recta;
        v143 = v138 + v140;
        v144 = fmax(v137, v142);
        v145 = CGRectGetMaxY(v486) - v144;
        v387[0] = MEMORY[0x1E0C809B0];
        v387[1] = 3221225472;
        v387[2] = __PKPassFrontFaceImage_block_invoke_9;
        v387[3] = &unk_1E2AD8158;
        v389 = c;
        v146 = attrStringa;
        v388 = v146;
        v390 = v69;
        v391 = v145;
        v392 = v143;
        v393 = v144;
        v394 = framesettera;
        v319[2](v319, v387, v69, v145, v143, v144);
        v379[0] = MEMORY[0x1E0C809B0];
        v379[1] = 3221225472;
        v379[2] = __PKPassFrontFaceImage_block_invoke_10;
        v379[3] = &unk_1E2AD8158;
        v381 = c;
        v147 = v295;
        v380 = v147;
        v382 = v69 + v138;
        v383 = v145;
        v384 = v143 - v138;
        v385 = v144;
        v386 = v288;
        v319[2](v319, v379, v69 + v138, v145, v143 - v138, v144);
        CFRelease(framesettera);
        CFRelease(v288);

      }
      objc_autoreleasePoolPop(context);
LABEL_90:

      goto LABEL_91;
    }
    objc_msgSend(*(id *)(v3 + 32), "foregroundColor");
    framesetter = (CTFramesetterRef)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v286 = -[__CTFramesetter CGColor](framesetter, "CGColor");
    v185 = v57;
    v186 = v304;
    objc_msgSend(v185, "objectForKey:", CFSTR("paymentCard"));
    v296 = (CFAttributedStringRef)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "objectForKey:", CFSTR("paymentCard"));
    v289 = (CTFramesetterRef)objc_claimAutoreleasedReturnValue();

    -[__CFAttributedString objectForKey:](v296, "objectForKey:", CFSTR("auxiliaryFields"));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v187, "count"))
    {
      -[__CTFramesetter objectForKey:](v289, "objectForKey:", CFSTR("auxiliaryFields"));
      v188 = objc_claimAutoreleasedReturnValue();

      v187 = (void *)v188;
    }
    -[__CFAttributedString objectForKey:](v296, "objectForKey:", CFSTR("headerFields"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v189, "count"))
    {
      -[__CTFramesetter objectForKey:](v289, "objectForKey:", CFSTR("headerFields"));
      v190 = objc_claimAutoreleasedReturnValue();

      v189 = (void *)v190;
    }
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("topLeftBackgroundTitle"));
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("topRightBackgroundTitle"));
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v187, "count"))
      goto LABEL_117;
    v100 = 0;
    if (objc_msgSend(v189, "count") || v191 || v287)
      goto LABEL_118;
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("description"));
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    if (v285
      || (objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("organizationName")),
          (v285 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v283 = objc_alloc(MEMORY[0x1E0CB3498]);
      v460 = 4;
      settings.spec = kCTParagraphStyleSpecifierLineBreakMode;
      settings.valueSize = 1;
      settings.value = &v460;
      cf = CTParagraphStyleCreate(&settings, 1uLL);
      UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontEmphasizedSystem, round(attrString * 18.0 + attrString * 18.0) * 0.5, 0);
      v223 = *MEMORY[0x1E0CA8550];
      v462[0] = *MEMORY[0x1E0CA85A0];
      v462[1] = v223;
      v463[0] = cf;
      v463[1] = v286;
      v462[2] = *MEMORY[0x1E0CA8188];
      v463[2] = UIFontForLanguage;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v463, v462, 3);
      attrStringb = (CFAttributedStringRef)objc_claimAutoreleasedReturnValue();
      CFRelease(UIFontForLanguage);
      CFRelease(cf);
      v100 = (id)objc_msgSend(v283, "initWithString:attributes:", v285, attrStringb);

    }
    else
    {
LABEL_117:
      v100 = 0;
    }
LABEL_118:

    if (v100)
    {
      v411[0] = MEMORY[0x1E0C809B0];
      v411[1] = 3221225472;
      v411[2] = __PKPassFrontFaceImage_block_invoke_6;
      v411[3] = &unk_1E2AD8180;
      v413 = c;
      v412 = v100;
      v414 = v69;
      v415 = v70;
      v416 = constraints;
      v417 = recta;
      ((void (*)(void (**)(void *, _QWORD *, double, double, double, double), _QWORD *, double, double))v319[2])(v319, v411, v69, v70);

    }
    _PKPaymentPassNetworkIdentifierFromDictionary(v185);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v192;
    if (v192)
    {
      v193 = objc_msgSend(v192, "integerValue") - 1;
      if (v193 <= 0x12 && ((0x5DD0Fu >> v193) & 1) != 0)
      {
        v194 = off_1E2AD8490[v193];
        PKPassKitCoreBundle();
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        _FetchImageNamed(v194, v195, *(void **)(v3 + 64), *(double *)(v3 + 112));
        v196 = (void *)objc_claimAutoreleasedReturnValue();

        if (v196)
        {
          v403[0] = MEMORY[0x1E0C809B0];
          v403[1] = 3221225472;
          v403[2] = __PKPassFrontFaceImage_block_invoke_7;
          v403[3] = &unk_1E2AD8158;
          v405 = c;
          v197 = v196;
          v404 = v197;
          v406 = v92;
          v407 = v94;
          v408 = v96;
          v409 = v98;
          v410 = *(_QWORD *)(v3 + 112);
          v319[2](v319, v403, v92, v94, v96, v98);

        }
      }
    }
    goto LABEL_60;
  }
LABEL_92:
  v154 = (void *)MEMORY[0x19400CFE8]();
  if (*(_QWORD *)(v3 + 72) && !CGRectIsNull(*(CGRect *)(v3 + 280)))
  {
    v374[0] = MEMORY[0x1E0C809B0];
    v374[1] = 3221225472;
    v374[2] = __PKPassFrontFaceImage_block_invoke_11;
    v374[3] = &unk_1E2AD8180;
    v155 = *(id *)(v3 + 72);
    v156 = *(_OWORD *)(v3 + 296);
    v376 = *(_OWORD *)(v3 + 280);
    v377 = v156;
    v375 = v155;
    v378 = c;
    v319[2](v319, v374, *(double *)(v3 + 280), *(double *)(v3 + 288), *(double *)(v3 + 296), *(double *)(v3 + 304));

  }
  objc_autoreleasePoolPop(v154);
  v157 = (void *)MEMORY[0x19400CFE8]();
  if (*(_BYTE *)(v3 + 491))
  {
    v158 = *(void **)(*(_QWORD *)(*(_QWORD *)(v3 + 104) + 8) + 40);
    +[PKImageResizingConstraints constraintsWithAspectFillToSize:](PKImageResizingConstraints, "constraintsWithAspectFillToSize:", *(double *)(v3 + 328), *(double *)(v3 + 336));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "resizedImageWithConstraints:", v159);
    v160 = objc_claimAutoreleasedReturnValue();
    v161 = *(_QWORD *)(*(_QWORD *)(v3 + 104) + 8);
    v162 = *(void **)(v161 + 40);
    *(_QWORD *)(v161 + 40) = v160;

    v370[0] = MEMORY[0x1E0C809B0];
    v370[1] = 3221225472;
    v370[2] = __PKPassFrontFaceImage_block_invoke_12;
    v370[3] = &unk_1E2AD81A8;
    v163 = *(_QWORD *)(v3 + 104);
    v371 = *(_OWORD *)(v3 + 312);
    v372 = *(_OWORD *)(v3 + 328);
    v370[4] = v163;
    v373 = c;
    v319[2](v319, v370, *(double *)(v3 + 312), *(double *)(v3 + 320), *(double *)(v3 + 328), *(double *)(v3 + 336));
  }
  objc_autoreleasePoolPop(v157);
  v164 = (void *)MEMORY[0x19400CFE8]();
  if (*(_BYTE *)(v3 + 492))
  {
    v165 = *(double *)(v3 + 344);
    v166 = *(double *)(v3 + 352);
    if (v165 != *MEMORY[0x1E0C9D820] || v166 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v167 = *(_QWORD *)(v3 + 360);
      if (v167)
      {
        if (v167 == 1)
        {
          v173 = *(double *)(v3 + 368);
          v174 = *(double *)(v3 + 376);
          v175 = *(double *)(v3 + 384);
          v176 = *(double *)(v3 + 392);
          +[PKImage passesImageNamed:](PKImage, "passesImageNamed:", CFSTR("Generic_ThumbnailFrame"));
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "resizableImageByTilingCenterPixel");
          v178 = (void *)objc_claimAutoreleasedReturnValue();

          v350[0] = MEMORY[0x1E0C809B0];
          v350[1] = 3221225472;
          v350[2] = __PKPassFrontFaceImage_block_invoke_3_74;
          v350[3] = &unk_1E2AD8220;
          __asm { FMOV            V1.2D, #5.0 }
          rectc = vaddq_f64(*(float64x2_t *)(v3 + 368), _Q1);
          __asm { FMOV            V1.2D, #-5.0 }
          constraintsa = (CGSize)vaddq_f64(vaddq_f64(*(float64x2_t *)(v3 + 384), _Q1), (float64x2_t)xmmword_190455D30);
          v184 = v178;
          v351 = v184;
          v353 = v173;
          v354 = v174;
          v355 = v175;
          v356 = v176;
          v357 = c;
          v352 = *(id *)(v3 + 80);
          v358 = rectc;
          v359 = constraintsa;
          v319[2](v319, v350, v173, v174, v175, v176);

        }
        else if (v167 == 2)
        {
          v168 = *(double *)(v3 + 384);
          v169 = *(double *)(v3 + 392);
          v170 = v168 / v165;
          if (v165 == 0.0)
            v170 = 1.0;
          v171 = v169 / v166;
          if (v166 == 0.0)
            v171 = 1.0;
          if (fmax(v170, v171) == 1.0)
          {
            v169 = *(double *)(v3 + 352);
            v168 = *(double *)(v3 + 344);
          }
          else if (v170 <= v171)
          {
            v168 = v165 / v166 * v169;
          }
          else
          {
            v169 = v166 / v165 * v168;
          }
          v198 = PKSizeCeilToPixelWithScale(v168, v169, *(double *)(v3 + 112));
          v200 = v199;
          y = COERCE_DOUBLE(&buf);
          buf.origin.x = 0.0;
          *(_QWORD *)&buf.origin.y = &buf;
          *(_QWORD *)&buf.size.width = 0x4010000000;
          *(_QWORD *)&buf.size.height = "";
          v202 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          v466 = *MEMORY[0x1E0C9D628];
          v467 = v202;
          if (*(double *)(v3 + 344) != *(double *)(v3 + 352))
          {
            v203 = (void *)MEMORY[0x19400CFE8]();
            v204 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.PassKitCoreXPCService"));
            objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE296B68);
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v204, "setRemoteObjectInterface:", v205);

            objc_msgSend(v204, "resume");
            objc_msgSend(v204, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_186);
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v3 + 80), "imageData");
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            v369[0] = MEMORY[0x1E0C809B0];
            v369[1] = 3221225472;
            v369[2] = __PKPassFrontFaceImage_block_invoke_69;
            v369[3] = &unk_1E2AD81D0;
            v369[4] = &buf;
            objc_msgSend(v206, "faceBoundingBoxForImageData:withReply:", v207, v369);

            objc_msgSend(v204, "invalidate");
            objc_autoreleasePoolPop(v203);
            IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)&buf.origin.y + 32));
            y = buf.origin.y;
            if (!IsNull)
              *(double *)(*(_QWORD *)&buf.origin.y + 40) = 1.0
                                                           - *(double *)(*(_QWORD *)&buf.origin.y + 40)
                                                           - *(double *)(*(_QWORD *)&buf.origin.y + 56);
          }
          v209 = (double *)(v3 + 368);
          if (CGRectIsNull(*(CGRect *)(*(_QWORD *)&y + 32)))
          {
            v210 = PKSizeAlignedInRectWithScale(0x100000001uLL, v198, v200, *(CGFloat *)(v3 + 368), *(CGFloat *)(v3 + 376), *(CGFloat *)(v3 + 384), *(CGFloat *)(v3 + 392), *(double *)(v3 + 112));
            v212 = v211;
            v198 = v213;
            v200 = v214;
          }
          else
          {
            v488 = *(CGRect *)(v3 + 368);
            v215 = v200 * *(double *)(*(_QWORD *)&buf.origin.y + 56) / v488.size.height;
            MidX = CGRectGetMidX(v488);
            v217 = CGRectGetMidX(*(CGRect *)(*(_QWORD *)&buf.origin.y + 32));
            if (v215 <= 0.6)
            {
              MidY = CGRectGetMidY(*(CGRect *)(v3 + 368));
              MaxY = CGRectGetMidY(*(CGRect *)(*(_QWORD *)&buf.origin.y + 32));
            }
            else
            {
              v218 = *(double *)(v3 + 376);
              v219 = *(double *)(v3 + 392);
              MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)&buf.origin.y + 32));
              MidY = v218 + (1.0 - fmin((1.0 - v215) * 0.5, 0.1)) * v219;
            }
            v224 = MidX - v217 * v198;
            v212 = MidY - MaxY * v200;
            if (v224 <= *v209)
              v210 = v224;
            else
              v210 = *v209;
            v489.origin.x = v210;
            v489.origin.y = v212;
            v489.size.width = v198;
            v489.size.height = v200;
            MaxX = CGRectGetMaxX(v489);
            if (MaxX < CGRectGetMaxX(*(CGRect *)(v3 + 368)))
              v210 = CGRectGetMaxX(*(CGRect *)(v3 + 368)) - v198;
            if (v212 > *(double *)(v3 + 376))
              v212 = *(double *)(v3 + 376);
            v490.origin.x = v210;
            v490.origin.y = v212;
            v490.size.width = v198;
            v490.size.height = v200;
            v226 = CGRectGetMaxY(v490);
            if (v226 < CGRectGetMaxY(*(CGRect *)(v3 + 368)))
              v212 = CGRectGetMaxY(*(CGRect *)(v3 + 368)) - v200;
          }
          v360[0] = MEMORY[0x1E0C809B0];
          v360[1] = 3221225472;
          v360[2] = __PKPassFrontFaceImage_block_invoke_2_71;
          v360[3] = &unk_1E2AD81F8;
          v362 = c;
          v227 = *(_OWORD *)(v3 + 384);
          v363 = *(_OWORD *)v209;
          v364 = v227;
          v361 = *(id *)(v3 + 80);
          v365 = v210;
          v366 = v212;
          v367 = v198;
          v368 = v200;
          v319[2](v319, v360, *(double *)(v3 + 368), *(double *)(v3 + 376), *(double *)(v3 + 384), *(double *)(v3 + 392));

          _Block_object_dispose(&buf, 8);
        }
      }
      else
      {
        v345[0] = MEMORY[0x1E0C809B0];
        v345[1] = 3221225472;
        v345[2] = __PKPassFrontFaceImage_block_invoke_4_75;
        v345[3] = &unk_1E2AD8180;
        v172 = *(id *)(v3 + 80);
        v347 = *(_OWORD *)(v3 + 368);
        v348 = *(_OWORD *)(v3 + 384);
        v346 = v172;
        v349 = c;
        v319[2](v319, v345, *(double *)(v3 + 368), *(double *)(v3 + 376), *(double *)(v3 + 384), *(double *)(v3 + 392));

      }
    }
  }
  objc_autoreleasePoolPop(v164);
LABEL_152:
  CGContextRestoreGState(c);
  v491.origin.y = v317;
  v491.origin.x = v318;
  v491.size.height = v314;
  v491.size.width = v316;
  if (!CGRectIsEmpty(v491))
  {
    v492.origin.y = v317;
    v492.origin.x = v318;
    v492.size.height = v314;
    v492.size.width = v316;
    v493 = CGRectOffset(v492, *(CGFloat *)(v3 + 240), *(CGFloat *)(v3 + 232));
    v494 = CGRectIntersection(v493, *(CGRect *)(v3 + 120));
    v315 = v494;
    height = v494.size.height;
    if (*(_BYTE *)(v3 + 488))
    {
      v229 = *(double *)(v3 + 112);
      v494.origin.x = v494.origin.x * v229;
      v494.origin.y = v494.origin.y * v229;
      v494.size.width = v494.size.width * v229;
      v494.size.height = height * v229;
    }
    v495 = CGRectIntegral(v494);
    x = v495.origin.x;
    v231 = v495.origin.y;
    width = v495.size.width;
    v233 = v495.size.height;
    objc_msgSend(*(id *)(v3 + 32), "footerBackgroundColor");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    rectb = v234;
    if (v234)
    {
      v235 = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(objc_retainAutorelease(v234), "CGColor"), 1.0);
      CGContextSaveGState(c);
      CGContextSetBlendMode(c, kCGBlendModeCopy);
      CGContextSetFillColorWithColor(c, v235);
      CGContextFillRect(c, v315);
      CGContextRestoreGState(c);
      CGColorRelease(v235);
    }
    else
    {
      constraintsb = CGRectGetMinX(*(CGRect *)(v3 + 400));
      MinY = CGRectGetMinY(*(CGRect *)(v3 + 400));
      contexta = CGRectGetHeight(*(CGRect *)(v3 + 200));
      attrStringc = CGRectGetHeight(*(CGRect *)(v3 + 400));
      v297 = CGRectGetWidth(*(CGRect *)(v3 + 200));
      framesetterb = CGRectGetWidth(*(CGRect *)(v3 + 400));
      v496.origin.x = x;
      v496.origin.y = v231;
      v496.size.width = width;
      v496.size.height = v233;
      MinX = CGRectGetMinX(v496);
      v497.origin.x = x;
      v497.origin.y = v231;
      v497.size.width = width;
      v497.size.height = v233;
      v236 = CGRectGetMinY(v497);
      v237 = CGRectGetHeight(*(CGRect *)(v3 + 200));
      v498.origin.x = x;
      v498.origin.y = v231;
      v498.size.width = width;
      v498.size.height = v233;
      v238 = CGRectGetHeight(v498);
      v239 = CGRectGetWidth(*(CGRect *)(v3 + 200));
      v499.origin.x = x;
      v499.origin.y = v231;
      v499.size.width = width;
      v499.size.height = v233;
      v240 = (unint64_t)(v239 - CGRectGetWidth(v499));
      remainder.origin.x = 0.0;
      *(_QWORD *)&remainder.origin.y = &remainder;
      *(_QWORD *)&remainder.size.width = 0x2020000000;
      remainder.size.height = 0.0;
      v241 = *(void **)(v3 + 48);
      v333[0] = MEMORY[0x1E0C809B0];
      v333[1] = 3221225472;
      v333[2] = __PKPassFrontFaceImage_block_invoke_5_76;
      v333[3] = &unk_1E2AD8248;
      v242 = *(_OWORD *)(v3 + 448);
      v334 = *(_OWORD *)(v3 + 432);
      v335 = v242;
      v333[4] = &remainder;
      v336 = *(_QWORD *)(v3 + 112);
      v337 = (unint64_t)MinY;
      v338 = (unint64_t)constraintsb;
      v339 = (unint64_t)(contexta - attrStringc);
      v340 = (unint64_t)(v297 - framesetterb);
      v341 = (unint64_t)MinX;
      v342 = (unint64_t)v236;
      v343 = (unint64_t)(v237 - v238);
      v344 = v240;
      objc_msgSend(v241, "accessData:", v333);
      v243 = *(id *)(v3 + 48);
      if (!v243)
        goto LABEL_198;
      if (!v240)
        goto LABEL_198;
      if (!(unint64_t)(v237 - v238))
        goto LABEL_198;
      v244 = v243;
      v245 = PKColorSpaceStandardLinearRGB();
      v246 = +[PKBitmapConversionDescriptor create32Float](PKBitmapConversionDescriptor, "create32Float");
      objc_msgSend(v246, "setColorSpace:withPolicy:", v245, &__block_literal_global_149);
      v247 = (void *)objc_msgSend(v246, "convertFromContext:", v244);
      v248 = v247;
      if (!v247)
        goto LABEL_198;
      *(_QWORD *)&buf.origin.x = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf.origin.y = 3221225472;
      *(_QWORD *)&buf.size.width = __vImageSaturate_ARGB16F_block_invoke_2;
      *(_QWORD *)&buf.size.height = &__block_descriptor_72_e79_v24__0r__vImage_CGImageFormat_II__CGColorSpace_II_di_8r__vImage_Buffer__vQQQ_16l;
      *(_QWORD *)&v466 = 0x3FF8000000000000;
      *((_QWORD *)&v466 + 1) = (unint64_t)MinX;
      *(_QWORD *)&v467 = (unint64_t)v236;
      *((_QWORD *)&v467 + 1) = (unint64_t)(v237 - v238);
      v468 = v240;
      objc_msgSend(v247, "accessData:", &buf);
      v249 = +[PKBitmapConversionDescriptor create16Float](PKBitmapConversionDescriptor, "create16Float");

      objc_msgSend(v249, "setColorSpace:withPolicy:", v245, &__block_literal_global_151);
      if ((objc_msgSend(v249, "convertContext:", v248) & 1) == 0)
LABEL_198:
        __break(1u);
      *(_QWORD *)&slice.origin.x = MEMORY[0x1E0C809B0];
      *(_QWORD *)&slice.origin.y = 3221225472;
      *(_QWORD *)&slice.size.width = __vImageSaturate_ARGB16F_block_invoke_4;
      *(_QWORD *)&slice.size.height = &unk_1E2AD8470;
      *(_QWORD *)&v470 = v244;
      *((_QWORD *)&v470 + 1) = (unint64_t)MinX;
      *(_QWORD *)&v471 = (unint64_t)v236;
      *((_QWORD *)&v471 + 1) = (unint64_t)(v237 - v238);
      v472 = v240;
      v250 = v244;
      objc_msgSend(v248, "accessData:", &slice);

      v251 = *(double *)(*(_QWORD *)&remainder.origin.y + 24);
      buf = *(CGRect *)ymmword_190455D68;
      slice = *(CGRect *)ymmword_190455D88;
      if (v251 <= 0.9)
        p_slice = &slice;
      else
        p_slice = &buf;
      v253 = CGColorCreate(*(CGColorSpaceRef *)(v3 + 464), &p_slice->origin.x);
      CGContextSaveGState(c);
      if (v251 <= 0.9)
        v254 = kCGBlendModeDarken;
      else
        v254 = kCGBlendModePlusLighter;
      CGContextSetBlendMode(c, v254);
      CGContextSetFillColorWithColor(c, v253);
      CGContextFillRect(c, v315);
      CGContextRestoreGState(c);
      CGColorRelease(v253);
      _Block_object_dispose(&remainder, 8);
    }

  }
  CGContextSaveGState(c);
  CGContextTranslateCTM(c, *(CGFloat *)(v3 + 240), *(CGFloat *)(v3 + 232));
  v500.origin.x = v320;
  v500.size.height = v321;
  v500.origin.y = v322;
  v500.size.width = v323;
  if (!CGRectIsEmpty(v500))
  {
    GenericGray = CGColorCreateGenericGray(0.0, 0.55);
    v256 = CGColorCreateGenericGray(0.0, 0.4);
    v257 = CGColorCreateGenericGray(0.0, 0.0);
    *(_QWORD *)&buf.origin.x = GenericGray;
    *(_QWORD *)&buf.origin.y = v256;
    *(_QWORD *)&buf.size.width = v257;
    slice.origin = (CGPoint)xmmword_190455DA8;
    slice.size.width = 1.0;
    v258 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&buf, 3, 0);
    v259 = CGGradientCreateWithColors(*(CGColorSpaceRef *)(v3 + 464), v258, &slice.origin.x);
    CGContextSaveGState(c);
    v501.origin.x = v320;
    v501.size.height = v321;
    v501.origin.y = v322;
    v501.size.width = v323;
    v260 = CGRectGetMidX(v501);
    v502.origin.x = v320;
    v502.size.height = v321;
    v502.origin.y = v322;
    v502.size.width = v323;
    v261 = CGRectGetMinY(v502);
    v503.origin.x = v320;
    v503.size.height = v321;
    v503.origin.y = v322;
    v503.size.width = v323;
    v262 = CGRectGetMidX(v503);
    v504.origin.x = v320;
    v504.size.height = v321;
    v504.origin.y = v322;
    v504.size.width = v323;
    v263 = CGRectGetMaxY(v504);
    v505.origin.x = v320;
    v505.size.height = v321;
    v505.origin.y = v322;
    v505.size.width = v323;
    CGContextAddRect(c, v505);
    CGContextClip(c);
    v480.x = v260;
    v480.y = v261;
    v481.x = v262;
    v481.y = v263;
    CGContextDrawLinearGradient(c, v259, v480, v481, 0);
    CGContextRestoreGState(c);
    CGGradientRelease(v259);
    CFRelease(v258);
    CGColorRelease(GenericGray);
    CGColorRelease(v256);
    CGColorRelease(v257);
  }
  v331 = 0u;
  v332 = 0u;
  v329 = 0u;
  v330 = 0u;
  v264 = v313;
  v265 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v329, v461, 16);
  if (v265)
  {
    v266 = *(_QWORD *)v330;
    do
    {
      for (i = 0; i != v265; ++i)
      {
        if (*(_QWORD *)v330 != v266)
          objc_enumerationMutation(v264);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v329 + 1) + 8 * i) + 16))();
      }
      v265 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v329, v461, 16);
    }
    while (v265);
  }

  CGContextRestoreGState(c);
  _MaskImageForEdgeStyle(*(_QWORD *)(v3 + 472));
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "drawInRect:inContext:withBlendMode:alpha:", c, 22, *(double *)(v3 + 120), *(double *)(v3 + 128), *(double *)(v3 + 136), *(double *)(v3 + 144), 1.0);
  buf.origin.x = 0.0;
  *(_QWORD *)&buf.origin.y = &buf;
  buf.size = (CGSize)0x2020000000uLL;
  slice.origin.x = 0.0;
  *(_QWORD *)&slice.origin.y = &slice;
  *(_QWORD *)&slice.size.width = 0x2020000000;
  slice.size.height = 0.0;
  v269 = *(void **)(v3 + 48);
  v324[0] = MEMORY[0x1E0C809B0];
  v324[1] = 3221225472;
  v324[2] = __PKPassFrontFaceImage_block_invoke_6_77;
  v324[3] = &unk_1E2AD8270;
  v270 = *(_OWORD *)(v3 + 448);
  v325 = *(_OWORD *)(v3 + 432);
  v326 = v270;
  v327 = *(_QWORD *)(v3 + 112);
  v328 = *(_QWORD *)(v3 + 464);
  v324[4] = &slice;
  v324[5] = &buf;
  objc_msgSend(v269, "accessData:", v324);
  v271 = *(CGColor **)(*(_QWORD *)&buf.origin.y + 24);
  if (v271)
  {
    v272 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8);
    if (!*(_BYTE *)(v272 + 24))
    {
      *(_BYTE *)(v272 + 24) = 1;
      v273 = PKColorGetRelativeLuminance(v271) / 100.0;
      if (v273 <= 0.00885645168)
        v274 = v273 * 7.78703704 + 0.137931034;
      else
        v274 = pow(v273, 0.333333333);
      *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24) = (v274 * 116.0 + -16.0) / 100.0;
      v271 = *(CGColor **)(*(_QWORD *)&buf.origin.y + 24);
    }
    CFRelease(v271);
    *(_QWORD *)(*(_QWORD *)&buf.origin.y + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8) + 24))
  {
    v275 = *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 96) + 8) + 24);
    if (v275 <= 0.9)
      v276 = v275 < 0.1;
    else
      v276 = 2;
  }
  else
  {
    v276 = 0;
  }
  _PKDrawGlossInRect(c, *(_QWORD *)(v3 + 472), v276, *(CGFloat *)(v3 + 120), *(CGFloat *)(v3 + 128), *(CGFloat *)(v3 + 136), *(CGFloat *)(v3 + 144));
  v277 = *(const void **)(*(_QWORD *)&slice.origin.y + 24);
  v278 = *(void ***)(v3 + 480);
  if (v277)
  {
    if (v278)
    {
      +[PKColor matchingColorFromColor:](PKColor, "matchingColorFromColor:");
      v279 = objc_claimAutoreleasedReturnValue();
      v280 = *(void ***)(v3 + 480);
      v281 = *v280;
      *v280 = (void *)v279;

      v277 = *(const void **)(*(_QWORD *)&slice.origin.y + 24);
    }
    CFRelease(v277);
    *(_QWORD *)(*(_QWORD *)&slice.origin.y + 24) = 0;
  }
  else if (v278)
  {
    v282 = *v278;
    *v278 = 0;

  }
  _Block_object_dispose(&slice, 8);
  _Block_object_dispose(&buf, 8);

}

void __PKPassFrontFaceImage_block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unint64_t MinX;
  unint64_t MinY;
  double Height;
  unint64_t v9;
  double Width;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v15[4];

  MinX = (unint64_t)CGRectGetMinX(*(CGRect *)(a1 + 32));
  MinY = (unint64_t)CGRectGetMinY(*(CGRect *)(a1 + 32));
  Height = CGRectGetHeight(*(CGRect *)(a1 + 64));
  v9 = (unint64_t)(Height - CGRectGetHeight(*(CGRect *)(a1 + 32)));
  Width = CGRectGetWidth(*(CGRect *)(a1 + 64));
  v11 = CGRectGetWidth(*(CGRect *)(a1 + 32));
  v13 = a3[2];
  v12 = a3[3];
  v14 = a3[1] - v9;
  v15[0] = *a3 + v12 * MinY + ((*(_DWORD *)(a2 + 4) + 7) >> 3) * MinX;
  v15[1] = v14;
  v15[2] = v13 - (unint64_t)(Width - v11);
  v15[3] = v12;
  vImageGaussianBlur_ARGB16F(a2, (uint64_t)v15, (uint64_t)v15, 0, 0, (double)*(int *)(a1 + 96), 0.5);
}

void __PKPassFrontFaceImage_block_invoke_35(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v11;
  void *v12;
  void (**aBlock)(void);
  CGRect v14;
  CGRect v15;

  aBlock = a2;
  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v14)
    || (v15.origin.x = a3,
        v15.origin.y = a4,
        v15.size.width = a5,
        v15.size.height = a6,
        CGRectIntersectsRect(*(CGRect *)(a1 + 72), v15)))
  {
    v11 = *(void **)(a1 + 32);
    v12 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    aBlock[2]();
  }

}

double __PKPassFrontFaceImage_block_invoke_2_37(uint64_t a1, double a2)
{
  return round(*(double *)(a1 + 32) * a2);
}

void __PKPassFrontFaceImage_block_invoke_3(uint64_t a1)
{
  _DrawImageInRect(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 0, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(double *)(a1 + 80));
}

void __PKPassFrontFaceImage_block_invoke_4(uint64_t a1)
{
  _DrawImageInRect(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 2uLL, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(double *)(a1 + 80));
}

void __PKPassFrontFaceImage_block_invoke_5(uint64_t a1)
{
  _DrawImageInRect(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 0x200000002uLL, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(double *)(a1 + 80));
}

void __PKPassFrontFaceImage_block_invoke_6(double *a1)
{
  void *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGContext *v6;
  const __CFAttributedString *v7;
  const __CTFramesetter *v8;

  v1 = (void *)*((_QWORD *)a1 + 4);
  if (v1)
  {
    v2 = a1[6];
    v3 = a1[7];
    v4 = a1[8];
    v5 = a1[9];
    v6 = (CGContext *)*((_QWORD *)a1 + 5);
    v7 = v1;
    v8 = CTFramesetterCreateWithAttributedString(v7);
    _DrawTextInRectWithFramesetter(v6, v7, 0, v8, v2, v3, v4, v5);

    CFRelease(v8);
  }
}

void __PKPassFrontFaceImage_block_invoke_7(uint64_t a1)
{
  _DrawImageInRect(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 0x200000002uLL, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(double *)(a1 + 80));
}

void __PKPassFrontFaceImage_block_invoke_8(uint64_t a1)
{
  _DrawTextInRectWithFramesetter(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 0x100000000uLL, *(const __CTFramesetter **)(a1 + 80), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
}

void __PKPassFrontFaceImage_block_invoke_9(uint64_t a1)
{
  _DrawTextInRectWithFramesetter(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 0x100000000uLL, *(const __CTFramesetter **)(a1 + 80), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
}

void __PKPassFrontFaceImage_block_invoke_10(uint64_t a1)
{
  _DrawTextInRectWithFramesetter(*(CGContext **)(a1 + 40), *(void **)(a1 + 32), 0x100000000uLL, *(const __CTFramesetter **)(a1 + 80), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
}

uint64_t __PKPassFrontFaceImage_block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:inContext:", *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __PKPassFrontFaceImage_block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "drawInRect:inContext:", *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __PKPassFrontFaceImage_block_invoke_13(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitCoreXPCService: %@.", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __PKPassFrontFaceImage_block_invoke_69(uint64_t result, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

void __PKPassFrontFaceImage_block_invoke_2_71(uint64_t a1)
{
  const CGPath *v2;

  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  v2 = CGPathCreateWithEllipseInRect(*(CGRect *)(a1 + 48), 0);
  CGContextBeginPath(*(CGContextRef *)(a1 + 40));
  CGContextAddPath(*(CGContextRef *)(a1 + 40), v2);
  CGContextClosePath(*(CGContextRef *)(a1 + 40));
  CGContextClip(*(CGContextRef *)(a1 + 40));
  CGPathRelease(v2);
  CGContextSetGrayFillColor(*(CGContextRef *)(a1 + 40), 0.0, 1.0);
  CGContextFillRect(*(CGContextRef *)(a1 + 40), *(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:inContext:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
}

uint64_t __PKPassFrontFaceImage_block_invoke_3_74(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:inContext:", *(_QWORD *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:inContext:", *(_QWORD *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

uint64_t __PKPassFrontFaceImage_block_invoke_4_75(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:inContext:", *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __PKPassFrontFaceImage_block_invoke_5_76(uint64_t a1, size_t a2, uint64_t *a3)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  CGColor *v19;
  CGColor *v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64x2_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64x2_t v34;
  uint64_t v35;
  _BYTE v36[32];

  if (!a2)
    goto LABEL_26;
  if (!a3)
    goto LABEL_26;
  v5 = *(unsigned int *)(a2 + 4);
  if ((v5 & 7) != 0)
    goto LABEL_26;
  if (v5 >= 0x800)
    goto LABEL_26;
  v6 = v5 >> 3;
  v7 = a3[2];
  if (!is_mul_ok(v6, v7))
    goto LABEL_26;
  v8 = a3[3];
  if (v6 * v7 > v8)
    goto LABEL_26;
  v11 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v14 = *((_OWORD *)a3 + 1);
  *(_OWORD *)v36 = *(_OWORD *)a3;
  *(_OWORD *)&v36[16] = v14;
  v15 = __CFADD__(v11, v13);
  v16 = v11 + v13;
  if (v15)
    goto LABEL_26;
  v15 = __CFADD__(v10, v12);
  v17 = v10 + v12;
  if (v15)
    goto LABEL_26;
  if (v16 >= a3[1] || v17 >= v7)
  {
    memset(v36, 0, 24);
    goto LABEL_19;
  }
  v18 = *(_QWORD *)v36;
  if (v11)
  {
    if (!is_mul_ok(v11, v8))
      goto LABEL_26;
    v18 = *(_QWORD *)v36 + v11 * v8;
  }
  *(_QWORD *)&v36[8] -= v16;
  if (v10)
  {
    if (is_mul_ok(v10, v6))
    {
      v18 += v10 * v6;
      goto LABEL_17;
    }
LABEL_26:
    __break(1u);
    return;
  }
LABEL_17:
  *(_QWORD *)&v36[16] -= v17;
  *(_QWORD *)v36 = v18;
LABEL_19:
  v19 = (CGColor *)pk_vImageCopyAverageColor_ARGB16F(a2, (__int16 **)v36, 0, 0);
  if (v19)
  {
    v20 = v19;
    v21 = PKColorGetRelativeLuminance(v19) / 100.0;
    if (v21 <= 0.00885645168)
      v22 = v21 * 7.78703704 + 0.137931034;
    else
      v22 = pow(v21, 0.333333333);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (v22 * 116.0 + -16.0) / 100.0;
    CFRelease(v20);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  v23 = vcvtpd_s64_f64(*(double *)(a1 + 72) * 66.0);
  v24 = (*(_DWORD *)(a2 + 4) + 7) >> 3;
  v25 = a3[3];
  v26 = *(_QWORD *)(a1 + 80);
  v27 = *(_QWORD *)(a1 + 88);
  v28 = *a3;
  v29 = *a3 + v26 * v25 + v27 * v24;
  v35 = v25;
  *(_QWORD *)v36 = v29;
  v30 = *(int64x2_t *)(a3 + 1);
  *(int64x2_t *)&v36[8] = vsubq_s64(v30, *(int64x2_t *)(a1 + 96));
  *(_QWORD *)&v36[24] = v25;
  v31 = *(_QWORD *)(a1 + 112);
  v32 = *(_QWORD *)(a1 + 120);
  v33 = v28 + v31 * v24 + v32 * v25;
  v34 = vsubq_s64(v30, *(int64x2_t *)(a1 + 128));
  vImageGaussianBlur_ARGB16F(a2, (uint64_t)v36, (uint64_t)&v33, v31 - v27, v32 - v26, (double)v23, 0.125);
}

void __PKPassFrontFaceImage_block_invoke_6_77(uint64_t a1, size_t a2, __int128 *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  CGColor *v17;
  CGColor *v18;
  CFTypeRef v19;
  __int128 v20;
  __int128 v21;

  if (!a2)
    goto LABEL_22;
  if (!a3)
    goto LABEL_22;
  v3 = *(unsigned int *)(a2 + 4);
  if ((v3 & 7) != 0)
    goto LABEL_22;
  if (v3 >= 0x800)
    goto LABEL_22;
  v4 = v3 >> 3;
  v5 = *((_QWORD *)a3 + 2);
  if (!is_mul_ok(v4, v5))
    goto LABEL_22;
  v6 = *((_QWORD *)a3 + 3);
  if (v4 * v5 > v6)
    goto LABEL_22;
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v12 = a3[1];
  v20 = *a3;
  v21 = v12;
  v13 = __CFADD__(v9, v11);
  v14 = v9 + v11;
  if (v13)
    goto LABEL_22;
  v13 = __CFADD__(v8, v10);
  v15 = v8 + v10;
  if (v13)
    goto LABEL_22;
  if (v14 >= *((_QWORD *)a3 + 1) || v15 >= v5)
  {
    v20 = 0uLL;
    *(_QWORD *)&v21 = 0;
    goto LABEL_19;
  }
  v16 = v20;
  if (v9)
  {
    if (!is_mul_ok(v9, v6))
      goto LABEL_22;
    v16 = v20 + v9 * v6;
  }
  *((_QWORD *)&v20 + 1) -= v14;
  if (v8)
  {
    if (is_mul_ok(v8, v4))
    {
      v16 += v8 * v4;
      goto LABEL_17;
    }
LABEL_22:
    __break(1u);
    return;
  }
LABEL_17:
  *(_QWORD *)&v21 = v21 - v15;
  *(_QWORD *)&v20 = v16;
LABEL_19:
  v19 = 0;
  v17 = (CGColor *)pk_vImageCopyAverageColor_ARGB16F(a2, (__int16 **)&v20, (unint64_t)*(double *)(a1 + 80), &v19);
  if (v17)
  {
    v18 = v17;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGColorCreateCopyByMatchingToColorSpace(*(CGColorSpaceRef *)(a1 + 88), kCGRenderingIntentAbsoluteColorimetric, v17, 0);
    CFRelease(v18);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
}

uint64_t __PKPassFrontFaceImage_block_invoke_7_80()
{
  return 1;
}

void __PKPassFrontFaceImage_block_invoke_8_83(uint64_t a1, CGContext *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  PKGetImageFromBitmapContext(a2, *(double *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
