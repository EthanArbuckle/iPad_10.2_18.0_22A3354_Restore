@implementation TCMPSStyleTransfer

+ (id)defineTransformerDescriptor:(unint64_t)a3 tuneAllWeights:(BOOL)a4
{
  _BOOL8 v4;
  TCMPSTransformerDescriptor *v6;
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
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
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
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;

  v4 = a4;
  v6 = objc_alloc_init(TCMPSTransformerDescriptor);
  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conv");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKernelWidth:", 9);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conv");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKernelHeight:", 9);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "conv");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInputFeatureChannels:", 3);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conv");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOutputFeatureChannels:", 32);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conv");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conv");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "conv");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaddingWidth:", 4);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "conv");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPaddingHeight:", 4);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "conv");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLabel:", CFSTR("transformer_encode_1_conv"));

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "conv");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "inst");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setChannels:", 32);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "inst");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStyles:", a3);

  -[TCMPSTransformerDescriptor encode1](v6, "encode1");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "inst");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLabel:", CFSTR("transformer_encode_1_inst"));

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "conv");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "conv");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "conv");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setInputFeatureChannels:", 32);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "conv");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setOutputFeatureChannels:", 64);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "conv");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setStrideWidth:", 2);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "conv");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setStrideHeight:", 2);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "conv");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "conv");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "conv");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLabel:", CFSTR("transformer_encode_2_conv"));

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "conv");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "inst");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setChannels:", 64);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "inst");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setStyles:", a3);

  -[TCMPSTransformerDescriptor encode2](v6, "encode2");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "inst");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setLabel:", CFSTR("transformer_encode_2_inst"));

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "conv");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "conv");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "conv");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setInputFeatureChannels:", 64);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "conv");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "conv");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setStrideWidth:", 2);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "conv");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setStrideHeight:", 2);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "conv");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "conv");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "conv");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setLabel:", CFSTR("transformer_encode_3_conv"));

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "conv");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "inst");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setChannels:", 128);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "inst");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setStyles:", a3);

  -[TCMPSTransformerDescriptor encode3](v6, "encode3");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "inst");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setLabel:", CFSTR("transformer_encode_3_inst"));

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "conv1");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "conv1");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "conv1");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "conv1");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "conv1");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "conv1");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "conv1");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "conv1");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "conv1");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setLabel:", CFSTR("transformer_residual_1_conv_1"));

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "conv1");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "conv2");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "conv2");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "conv2");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "conv2");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "conv2");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "conv2");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "conv2");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "conv2");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "conv2");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setLabel:", CFSTR("transformer_residual_1_conv_2"));

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "conv2");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "inst1");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "inst1");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "inst1");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setLabel:", CFSTR("transformer_residual_1_inst_1"));

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "inst2");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "inst2");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual1](v6, "residual1");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "inst2");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setLabel:", CFSTR("transformer_residual_1_inst_2"));

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "conv1");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "conv1");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "conv1");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "conv1");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "conv1");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "conv1");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "conv1");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "conv1");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "conv1");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setLabel:", CFSTR("transformer_residual_2_conv_1"));

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "conv1");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "conv2");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "conv2");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "conv2");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "conv2");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "conv2");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "conv2");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "conv2");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "conv2");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "conv2");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "setLabel:", CFSTR("transformer_residual_2_conv_2"));

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "conv2");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "inst1");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "inst1");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "inst1");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setLabel:", CFSTR("transformer_residual_2_inst_1"));

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "inst2");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "inst2");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual2](v6, "residual2");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "inst2");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "setLabel:", CFSTR("transformer_residual_2_inst_2"));

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "conv1");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "conv1");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "conv1");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "conv1");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "conv1");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "conv1");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "conv1");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "conv1");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "conv1");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "setLabel:", CFSTR("transformer_residual_3_conv_1"));

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "conv1");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "conv2");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "conv2");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "conv2");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "conv2");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "conv2");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "conv2");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "conv2");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "conv2");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "conv2");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "setLabel:", CFSTR("transformer_residual_3_conv_2"));

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "conv2");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "inst1");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "inst1");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "inst1");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "setLabel:", CFSTR("transformer_residual_3_inst_1"));

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "inst2");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "inst2");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual3](v6, "residual3");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "inst2");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setLabel:", CFSTR("transformer_residual_3_inst_2"));

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "conv1");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "conv1");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "conv1");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "conv1");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "conv1");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "conv1");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v252, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "conv1");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "conv1");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "conv1");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "setLabel:", CFSTR("transformer_residual_4_conv_1"));

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "conv1");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "conv2");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "conv2");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "conv2");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "conv2");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "conv2");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "conv2");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "conv2");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "conv2");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "conv2");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "setLabel:", CFSTR("transformer_residual_4_conv_2"));

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "conv2");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "inst1");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "inst1");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "inst1");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "setLabel:", CFSTR("transformer_residual_4_inst_1"));

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "inst2");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "inst2");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual4](v6, "residual4");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "inst2");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "setLabel:", CFSTR("transformer_residual_4_inst_2"));

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "conv1");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "conv1");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "conv1");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "conv1");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "conv1");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v303, "conv1");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "conv1");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "conv1");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v309, "conv1");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v310, "setLabel:", CFSTR("transformer_residual_5_conv_1"));

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "conv1");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "conv2");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "conv2");
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v317, "conv2");
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "conv2");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "setOutputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "conv2");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v322, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "conv2");
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v324, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v325, "conv2");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v327, "conv2");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v328, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "conv2");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "setLabel:", CFSTR("transformer_residual_5_conv_2"));

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v331, "conv2");
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v332, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v333, "inst1");
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v334, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "inst1");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v337, "inst1");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "setLabel:", CFSTR("transformer_residual_5_inst_1"));

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "inst2");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v340, "setChannels:", 128);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "inst2");
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v342, "setStyles:", a3);

  -[TCMPSTransformerDescriptor residual5](v6, "residual5");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v343, "inst2");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "setLabel:", CFSTR("transformer_residual_5_inst_2"));

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v345, "conv");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v346, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v347, "conv");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v349, "conv");
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "setInputFeatureChannels:", 128);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v351, "conv");
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v352, "setOutputFeatureChannels:", 64);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v353, "conv");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v354, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v355, "conv");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v357, "conv");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v358, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v359, "conv");
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v360, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v361, "conv");
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v362, "setLabel:", CFSTR("transformer_decode_1_conv"));

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v363, "conv");
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v364, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "inst");
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v366, "setChannels:", 64);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v367, "inst");
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v368, "setStyles:", a3);

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v369, "inst");
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v370, "setLabel:", CFSTR("transformer_decode_1_inst"));

  -[TCMPSTransformerDescriptor decode1](v6, "decode1");
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v371, "upsample");
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v372, "setScale:", 2);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v373, "conv");
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v374, "setKernelWidth:", 3);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v375, "conv");
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v376, "setKernelHeight:", 3);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v377, "conv");
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v378, "setInputFeatureChannels:", 64);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v379, "conv");
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v380, "setOutputFeatureChannels:", 32);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v381, "conv");
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v382, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v383, "conv");
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v384, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v385, "conv");
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v386, "setPaddingWidth:", 1);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v387, "conv");
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v388, "setPaddingHeight:", 1);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v389, "conv");
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v390, "setLabel:", CFSTR("transformer_decode_2_conv"));

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "conv");
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v392, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v393, "inst");
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v394, "setChannels:", 32);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v395, "inst");
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v396, "setStyles:", a3);

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v397, "inst");
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v398, "setLabel:", CFSTR("transformer_decode_2_inst"));

  -[TCMPSTransformerDescriptor decode2](v6, "decode2");
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v399, "upsample");
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v400, "setScale:", 2);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v401, "setKernelWidth:", 9);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v402, "setKernelHeight:", 9);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v403, "setInputFeatureChannels:", 32);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "setOutputFeatureChannels:", 3);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v405, "setStrideWidth:", 1);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v406, "setStrideHeight:", 1);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v407, "setPaddingWidth:", 4);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v408, "setPaddingHeight:", 4);

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v409, "setLabel:", CFSTR("transformer_decode_3_conv"));

  -[TCMPSTransformerDescriptor conv](v6, "conv");
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v410, "setUpdateWeights:", v4);

  -[TCMPSTransformerDescriptor inst](v6, "inst");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v411, "setChannels:", 3);

  -[TCMPSTransformerDescriptor inst](v6, "inst");
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v412, "setStyles:", a3);

  -[TCMPSTransformerDescriptor inst](v6, "inst");
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v413, "setLabel:", CFSTR("transformer_decode_3_inst"));

  return v6;
}

+ (id)defineVGG16Descriptor:(unint64_t)a3
{
  TCMPSVgg16Descriptor *v3;
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
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;

  v3 = objc_alloc_init(TCMPSVgg16Descriptor);
  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conv1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conv1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conv1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInputFeatureChannels:", 3);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conv1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOutputFeatureChannels:", 64);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conv1");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conv1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "conv1");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conv1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "conv1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLabel:", CFSTR("vgg16_block_1_conv_1"));

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "conv1");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "conv2");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "conv2");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "conv2");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInputFeatureChannels:", 64);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "conv2");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setOutputFeatureChannels:", 64);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "conv2");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "conv2");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "conv2");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "conv2");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "conv2");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLabel:", CFSTR("vgg16_block_1_conv_2"));

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "conv2");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "pooling");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setKernelSize:", 2);

  -[TCMPSVgg16Descriptor block1](v3, "block1");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "pooling");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setStrideSize:", 2);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "conv1");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "conv1");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "conv1");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setInputFeatureChannels:", 64);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "conv1");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setOutputFeatureChannels:", 128);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "conv1");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "conv1");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "conv1");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "conv1");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "conv1");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setLabel:", CFSTR("vgg16_block_2_conv_1"));

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "conv1");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "conv2");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "conv2");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "conv2");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setInputFeatureChannels:", 128);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "conv2");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setOutputFeatureChannels:", 128);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "conv2");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "conv2");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "conv2");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "conv2");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "conv2");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setLabel:", CFSTR("vgg16_block_2_conv_2"));

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "conv2");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "pooling");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setKernelSize:", 2);

  -[TCMPSVgg16Descriptor block2](v3, "block2");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "pooling");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setStrideSize:", 2);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "conv1");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "conv1");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "conv1");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setInputFeatureChannels:", 128);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "conv1");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setOutputFeatureChannels:", 256);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "conv1");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "conv1");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "conv1");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "conv1");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "conv1");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setLabel:", CFSTR("vgg16_block_3_conv_1"));

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "conv1");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "conv2");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "conv2");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "conv2");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setInputFeatureChannels:", 256);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "conv2");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setOutputFeatureChannels:", 256);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "conv2");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "conv2");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "conv2");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "conv2");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "conv2");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setLabel:", CFSTR("vgg16_block_3_conv_2"));

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "conv2");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "conv3");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "conv3");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "conv3");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setInputFeatureChannels:", 256);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "conv3");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setOutputFeatureChannels:", 256);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "conv3");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "conv3");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "conv3");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "conv3");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "conv3");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setLabel:", CFSTR("vgg16_block_3_conv_3"));

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "conv3");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "pooling");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setKernelSize:", 2);

  -[TCMPSVgg16Descriptor block3](v3, "block3");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "pooling");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "setStrideSize:", 2);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "conv1");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "conv1");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "conv1");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setInputFeatureChannels:", 256);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "conv1");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setOutputFeatureChannels:", 512);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "conv1");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "conv1");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "conv1");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "conv1");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "conv1");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "setLabel:", CFSTR("vgg16_block_4_conv_1"));

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "conv1");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "conv2");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "conv2");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "conv2");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setInputFeatureChannels:", 512);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "conv2");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "setOutputFeatureChannels:", 512);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "conv2");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "conv2");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "conv2");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "conv2");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "conv2");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "setLabel:", CFSTR("vgg16_block_4_conv_2"));

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "conv2");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "conv3");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "setKernelWidth:", 3);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "conv3");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "setKernelHeight:", 3);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "conv3");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "setInputFeatureChannels:", 512);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "conv3");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "setOutputFeatureChannels:", 512);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "conv3");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "setStrideWidth:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "conv3");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "setStrideHeight:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "conv3");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "setPaddingWidth:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "conv3");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "setPaddingHeight:", 1);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "conv3");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "setLabel:", CFSTR("vgg16_block_4_conv_3"));

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "conv3");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "setUpdateWeights:", 0);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "pooling");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "setKernelSize:", 2);

  -[TCMPSVgg16Descriptor block4](v3, "block4");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "pooling");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "setStrideSize:", 2);

  return v3;
}

+ (void)populateMean:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (0xAAAAAAAAAAAAAAABLL * (v6 >> 2) >= 0x5555555555555556)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("mps_style_transfer_utils.m"), 479, CFSTR("Data must follow a 3 channel format"));

  }
  v10 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v10, "mutableBytes");
  if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    v8 = v7 + 4 * (v6 >> 2);
    do
    {
      *(_QWORD *)v7 = 0x42E98ED942F75C29;
      *(_DWORD *)(v7 + 8) = 1120919749;
      v7 += 12;
    }
    while (v7 < v8);
  }

}

+ (void)populateMultiplication:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_msgSend(v11, "length");
  v6 = v5 >> 2;
  if (0xAAAAAAAAAAAAAAABLL * (v5 >> 2) >= 0x5555555555555556)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("mps_style_transfer_utils.m"), 494, CFSTR("Data must follow a 3 channel format"));

  }
  v7 = v11;
  if (v5 >= 4)
  {
    v8 = 0;
    if (v6 <= 1)
      v9 = 1;
    else
      v9 = v6;
    do
    {
      *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v11), "mutableBytes") + 4 * v8) = 1132396544;
      v7 = v11;
      ++v8;
    }
    while (v9 != v8);
  }

}

+ (void)populateMeanCWH:(id)a3 height:(unint64_t)a4 width:(unint64_t)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  id v16;

  v9 = a3;
  if (0xAAAAAAAAAAAAAAABLL * ((unint64_t)objc_msgSend(v9, "length") >> 2) >= 0x5555555555555556)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("mps_style_transfer_utils.m"), 501, CFSTR("Data must follow a 3 channel format"));

  }
  v16 = objc_retainAutorelease(v9);
  v10 = objc_msgSend(v16, "mutableBytes");
  v11 = 0;
  v12 = a5 * a4;
  do
  {
    if (v12)
    {
      v13 = 0;
      v14 = dword_2186C1078[v11];
      do
        *(_DWORD *)(v10 + 4 * v13++) = v14;
      while (v12 != v13);
    }
    ++v11;
    v10 += 4 * a5 * a4;
  }
  while (v11 != 3);

}

+ (void)populateVarianceCWH:(id)a3 height:(unint64_t)a4 width:(unint64_t)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  id v16;

  v9 = a3;
  if (0xAAAAAAAAAAAAAAABLL * ((unint64_t)objc_msgSend(v9, "length") >> 2) >= 0x5555555555555556)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("mps_style_transfer_utils.m"), 518, CFSTR("Data must follow a 3 channel format"));

  }
  v16 = objc_retainAutorelease(v9);
  v10 = objc_msgSend(v16, "mutableBytes");
  v11 = 0;
  v12 = a5 * a4;
  do
  {
    if (v12)
    {
      v13 = 0;
      v14 = dword_2186C1084[v11];
      do
        *(_DWORD *)(v10 + 4 * v13++) = v14;
      while (v12 != v13);
    }
    ++v11;
    v10 += 4 * a5 * a4;
  }
  while (v11 != 3);

}

- (TCMPSStyleTransfer)initWithDev:(id)a3 commandQueue:(id)a4 weights:(id)a5 numStyles:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  TCMPSStyleTransfer *v14;
  TCMPSStyleTransfer *v15;
  void *v16;
  TCMPSGraphNodeHandle *v17;
  uint64_t v18;
  MPSNNImageNode *contentNode;
  void *v20;
  TCMPSGraphNodeHandle *v21;
  uint64_t v22;
  MPSNNImageNode *contentScaleNode;
  void *v24;
  TCMPSGraphNodeHandle *v25;
  uint64_t v26;
  MPSNNImageNode *contenMeanNode;
  void *v28;
  TCMPSGraphNodeHandle *v29;
  uint64_t v30;
  MPSNNImageNode *styleNode;
  void *v32;
  TCMPSGraphNodeHandle *v33;
  uint64_t v34;
  MPSNNImageNode *styleScaleNode;
  void *v36;
  TCMPSGraphNodeHandle *v37;
  uint64_t v38;
  MPSNNImageNode *styleMeanNode;
  uint64_t v40;
  TCMPSStyleTransferTransformerNetwork *v41;
  TCMPSStyleTransferTransformerNetwork *model;
  TCMPSGraphNodeHandle *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  TCMPSStyleTransferPreProcessing *v49;
  void *v50;
  uint64_t v51;
  TCMPSStyleTransferPreProcessing *contentPreProcess;
  TCMPSVgg16Network *v53;
  void *v54;
  uint64_t v55;
  TCMPSVgg16Network *contentVgg;
  TCMPSStyleTransferPreProcessing *v57;
  TCMPSStyleTransferPreProcessing *stylePreProcessLoss;
  TCMPSVgg16Network *v59;
  void *v60;
  uint64_t v61;
  TCMPSVgg16Network *styleVggLoss;
  TCMPSStyleTransferPreProcessing *v63;
  TCMPSStyleTransferPreProcessing *contentPreProcessLoss;
  TCMPSVgg16Network *v65;
  void *v66;
  uint64_t v67;
  TCMPSVgg16Network *contentVggLoss;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
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
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  TCMPSGraphNodeHandle *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  MPSNNGraph *trainingGraph;
  void *v151;
  MTLDevice *v152;
  void *v153;
  uint64_t v154;
  MPSNNGraph *inferenceGraph;
  MTLDevice *dev;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  id v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  __int16 v185;
  objc_super v186;
  _QWORD v187[4];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[4];

  v191[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v186.receiver = self;
  v186.super_class = (Class)TCMPSStyleTransfer;
  v14 = -[TCMPSStyleTransfer init](&v186, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dev, a3);
    objc_storeStrong((id *)&v15->_commandQueue, a4);
    *(_QWORD *)&v15->_contentLossMultiplier = 0x38D1B7173F800000;
    v15->_totalLossMultiplier = 0.0001;
    v15->_updateAllParams = 1;
    *(_OWORD *)&v15->_batchSize = xmmword_2186C10A0;
    v15->_imgHeight = 256;
    v16 = (void *)MEMORY[0x24BDDE4A0];
    v179 = v12;
    v17 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("contentImage"));
    objc_msgSend(v16, "nodeWithHandle:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    contentNode = v15->_contentNode;
    v15->_contentNode = (MPSNNImageNode *)v18;

    v20 = (void *)MEMORY[0x24BDDE4A0];
    v21 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("contentScaleImage"));
    objc_msgSend(v20, "nodeWithHandle:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    contentScaleNode = v15->_contentScaleNode;
    v15->_contentScaleNode = (MPSNNImageNode *)v22;

    v24 = (void *)MEMORY[0x24BDDE4A0];
    v25 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("contentMeanImage"));
    objc_msgSend(v24, "nodeWithHandle:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    contenMeanNode = v15->_contenMeanNode;
    v15->_contenMeanNode = (MPSNNImageNode *)v26;

    v28 = (void *)MEMORY[0x24BDDE4A0];
    v29 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("styleImage"));
    objc_msgSend(v28, "nodeWithHandle:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    styleNode = v15->_styleNode;
    v15->_styleNode = (MPSNNImageNode *)v30;

    v32 = (void *)MEMORY[0x24BDDE4A0];
    v33 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("styleScaleImage"));
    objc_msgSend(v32, "nodeWithHandle:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    styleScaleNode = v15->_styleScaleNode;
    v15->_styleScaleNode = (MPSNNImageNode *)v34;

    v36 = (void *)MEMORY[0x24BDDE4A0];
    v37 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("styleMeanImage"));
    objc_msgSend(v36, "nodeWithHandle:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    styleMeanNode = v15->_styleMeanNode;
    v15->_styleMeanNode = (MPSNNImageNode *)v38;

    +[TCMPSStyleTransfer defineTransformerDescriptor:tuneAllWeights:](TCMPSStyleTransfer, "defineTransformerDescriptor:tuneAllWeights:", a6, v15->_updateAllParams);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCMPSStyleTransfer defineVGG16Descriptor:](TCMPSStyleTransfer, "defineVGG16Descriptor:", a6);
    v40 = objc_claimAutoreleasedReturnValue();
    v178 = v13;
    v41 = -[TCMPSStyleTransferTransformerNetwork initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:]([TCMPSStyleTransferTransformerNetwork alloc], "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("Transformer"), v15->_contentNode, v15->_dev, v15->_commandQueue, v177, v13);
    model = v15->_model;
    v15->_model = v41;

    v43 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("TransformerForwardPass"));
    -[TCMPSStyleTransferTransformerNetwork forwardPass](v15->_model, "forwardPass");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setHandle:", v43);

    -[TCMPSStyleTransferTransformerNetwork forwardPass](v15->_model, "forwardPass");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setExportFromGraph:", 1);

    -[TCMPSStyleTransferTransformerNetwork forwardPass](v15->_model, "forwardPass");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setSynchronizeResource:", 1);

    objc_msgSend(MEMORY[0x24BDDE368], "defaultAllocator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCMPSStyleTransferTransformerNetwork forwardPass](v15->_model, "forwardPass");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setImageAllocator:", v47);

    v49 = [TCMPSStyleTransferPreProcessing alloc];
    -[TCMPSStyleTransferTransformerNetwork forwardPass](v15->_model, "forwardPass");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[TCMPSStyleTransferPreProcessing initWithParameters:inputNode:scaleNode:meanNode:](v49, "initWithParameters:inputNode:scaleNode:meanNode:", CFSTR("Content_Pre_Processing"), v50, v15->_contentScaleNode, v15->_contenMeanNode);
    contentPreProcess = v15->_contentPreProcess;
    v15->_contentPreProcess = (TCMPSStyleTransferPreProcessing *)v51;

    v53 = [TCMPSVgg16Network alloc];
    -[TCMPSStyleTransferPreProcessing output](v15->_contentPreProcess, "output");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[TCMPSVgg16Network initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v53, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("Content_VGG_16"), v54, v15->_dev, v15->_commandQueue, v40, v13);
    contentVgg = v15->_contentVgg;
    v15->_contentVgg = (TCMPSVgg16Network *)v55;

    v57 = -[TCMPSStyleTransferPreProcessing initWithParameters:inputNode:scaleNode:meanNode:]([TCMPSStyleTransferPreProcessing alloc], "initWithParameters:inputNode:scaleNode:meanNode:", CFSTR("Style_Pre_Processing"), v15->_styleNode, v15->_styleScaleNode, v15->_styleMeanNode);
    stylePreProcessLoss = v15->_stylePreProcessLoss;
    v15->_stylePreProcessLoss = v57;

    v59 = [TCMPSVgg16Network alloc];
    -[TCMPSStyleTransferPreProcessing output](v15->_stylePreProcessLoss, "output");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = (void *)v40;
    v61 = -[TCMPSVgg16Network initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v59, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("Style_VGG_16"), v60, v15->_dev, v15->_commandQueue, v40, v13);
    styleVggLoss = v15->_styleVggLoss;
    v15->_styleVggLoss = (TCMPSVgg16Network *)v61;

    v63 = -[TCMPSStyleTransferPreProcessing initWithParameters:inputNode:scaleNode:meanNode:]([TCMPSStyleTransferPreProcessing alloc], "initWithParameters:inputNode:scaleNode:meanNode:", CFSTR("Content_Loss_Pre_Processing"), v15->_contentNode, v15->_contentScaleNode, v15->_contenMeanNode);
    contentPreProcessLoss = v15->_contentPreProcessLoss;
    v15->_contentPreProcessLoss = v63;

    v65 = [TCMPSVgg16Network alloc];
    -[TCMPSStyleTransferPreProcessing output](v15->_contentPreProcessLoss, "output");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[TCMPSVgg16Network initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v65, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("Content_Loss_VGG_16"), v66, v15->_dev, v15->_commandQueue, v40, v13);
    contentVggLoss = v15->_contentVggLoss;
    v15->_contentVggLoss = (TCMPSVgg16Network *)v67;

    objc_msgSend(MEMORY[0x24BDDE2B0], "cnnLossDescriptorWithType:reductionType:", 1, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v15->_styleLossMultiplier * 0.5 * v15->_totalLossMultiplier;
    *(float *)&v70 = v70;
    v71 = v69;
    objc_msgSend(v69, "setWeight:", v70);
    objc_msgSend(MEMORY[0x24BDDE2B0], "cnnLossDescriptorWithType:reductionType:", 1, 2);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v15->_contentLossMultiplier * 0.5 * v15->_totalLossMultiplier;
    *(float *)&v72 = v72;
    objc_msgSend(v184, "setWeight:", v72);
    v180 = v11;
    v73 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut1](v15->_styleVggLoss, "reluOut1");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v75) = 931135488;
    objc_msgSend(v73, "nodeWithSource:alpha:", v74, v75);
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut1](v15->_contentVgg, "reluOut1");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v78) = 931135488;
    objc_msgSend(v76, "nodeWithSource:alpha:", v77, v78);
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = (void *)MEMORY[0x24BDDE488];
    objc_msgSend(v175, "resultImage");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "resultImage");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "nodeWithSource:labels:lossDescriptor:", v80, v81, v71);
    v183 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut2](v15->_styleVggLoss, "reluOut2");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = 947912704;
    objc_msgSend(v82, "nodeWithSource:alpha:", v83, v84);
    v172 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut2](v15->_contentVgg, "reluOut2");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v87) = 947912704;
    objc_msgSend(v85, "nodeWithSource:alpha:", v86, v87);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = (void *)MEMORY[0x24BDDE488];
    objc_msgSend(v173, "resultImage");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "resultImage");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "nodeWithSource:labels:lossDescriptor:", v89, v90, v71);
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut3](v15->_styleVggLoss, "reluOut3");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v93) = 964689920;
    objc_msgSend(v91, "nodeWithSource:alpha:", v92, v93);
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut3](v15->_contentVgg, "reluOut3");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v96) = 964689920;
    objc_msgSend(v94, "nodeWithSource:alpha:", v95, v96);
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    v97 = (void *)MEMORY[0x24BDDE488];
    objc_msgSend(v171, "resultImage");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "resultImage");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v71;
    objc_msgSend(v97, "nodeWithSource:labels:lossDescriptor:", v98, v99, v71);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut4](v15->_styleVggLoss, "reluOut4");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v102) = 981467136;
    objc_msgSend(v100, "nodeWithSource:alpha:", v101, v102);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    v103 = (void *)MEMORY[0x24BDDE490];
    -[TCMPSVgg16Network reluOut4](v15->_contentVgg, "reluOut4");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v105) = 981467136;
    objc_msgSend(v103, "nodeWithSource:alpha:", v104, v105);
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    v106 = (void *)MEMORY[0x24BDDE488];
    objc_msgSend(v168, "resultImage");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "resultImage");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "nodeWithSource:labels:lossDescriptor:", v107, v108, v71);
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    v109 = (void *)MEMORY[0x24BDDE488];
    -[TCMPSVgg16Network reluOut3](v15->_contentVgg, "reluOut3");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCMPSVgg16Network reluOut3](v15->_contentVggLoss, "reluOut3");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "nodeWithSource:labels:lossDescriptor:", v110, v111, v184);
    v181 = (void *)objc_claimAutoreleasedReturnValue();

    v112 = (void *)MEMORY[0x24BDDE478];
    objc_msgSend(v183, "resultImage");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v191[0] = v113;
    objc_msgSend(v166, "resultImage");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v191[1] = v114;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v191, 2);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "nodeWithSources:", v115);
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    v116 = (void *)MEMORY[0x24BDDE478];
    objc_msgSend(v182, "resultImage");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = v117;
    objc_msgSend(v165, "resultImage");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v118;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v190, 2);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "nodeWithSources:", v119);
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = (void *)MEMORY[0x24BDDE478];
    objc_msgSend(v164, "resultImage");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v189[0] = v121;
    objc_msgSend(v163, "resultImage");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v189[1] = v122;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v189, 2);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "nodeWithSources:", v123);
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    v124 = (void *)MEMORY[0x24BDDE478];
    objc_msgSend(v181, "resultImage");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = v125;
    objc_msgSend(v162, "resultImage");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v126;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v188, 2);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "nodeWithSources:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = -[TCMPSGraphNodeHandle initWithLabel:]([TCMPSGraphNodeHandle alloc], "initWithLabel:", CFSTR("totalLossValue"));
    objc_msgSend(v128, "resultImage");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setHandle:", v129);

    objc_msgSend(v128, "resultImage");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setExportFromGraph:", 1);

    objc_msgSend(v128, "resultImage");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setSynchronizeResource:", 1);

    objc_msgSend(MEMORY[0x24BDDE368], "defaultAllocator");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v128;
    objc_msgSend(v128, "resultImage");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setImageAllocator:", v133);

    v135 = (void *)MEMORY[0x24BDDE4A8];
    objc_msgSend(v128, "resultImage");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "nodeWithSource:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    v185 = 257;
    v138 = v137;
    v160 = v137;
    objc_msgSend(v137, "resultImage");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "trainingGraphWithSourceGradient:nodeHandler:", v139, 0);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    dev = v15->_dev;
    v158 = (void *)MEMORY[0x24BDDE498];
    objc_msgSend(v140, "objectAtIndexedSubscript:", 0);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "resultImage");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v187[0] = v141;
    objc_msgSend(v140, "objectAtIndexedSubscript:", 1);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "resultImage");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v187[1] = v143;
    objc_msgSend(v140, "objectAtIndexedSubscript:", 2);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "resultImage");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v187[2] = v145;
    objc_msgSend(v140, "objectAtIndexedSubscript:", 3);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "resultImage");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v187[3] = v147;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v187, 4);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "graphWithDevice:resultImages:resultsAreNeeded:", dev, v148, &v185);
    v149 = objc_claimAutoreleasedReturnValue();
    trainingGraph = v15->_trainingGraph;
    v15->_trainingGraph = (MPSNNGraph *)v149;

    v13 = v178;
    v12 = v179;

    v11 = v180;
    v151 = (void *)MEMORY[0x24BDDE498];
    v152 = v15->_dev;
    -[TCMPSStyleTransferTransformerNetwork forwardPass](v15->_model, "forwardPass");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "graphWithDevice:resultImage:resultImageIsNeeded:", v152, v153, 1);
    v154 = objc_claimAutoreleasedReturnValue();
    inferenceGraph = v15->_inferenceGraph;
    v15->_inferenceGraph = (MPSNNGraph *)v154;

    -[MPSNNGraph setFormat:](v15->_trainingGraph, "setFormat:", 4);
    -[MPSNNGraph setFormat:](v15->_inferenceGraph, "setFormat:", 4);

  }
  return v15;
}

+ (id)topLeftCropImage:(id)a3 inputHeight:(unint64_t)a4 inputWidth:(unint64_t)a5 outputHeight:(unint64_t)a6 outputWidth:(unint64_t)a7 numChannels:(unint64_t)a8
{
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v12 = a3;
  v13 = 4 * a8 * a7;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v13 * a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v15 = 0;
    v16 = 0;
    v17 = 4 * a8 * a5;
    do
    {
      objc_msgSend(v12, "getBytes:range:", objc_msgSend(objc_retainAutorelease(v14), "mutableBytes") + v16, v15, v13);
      v16 += v13;
      v15 += v17;
      --a6;
    }
    while (a6);
  }

  return v14;
}

- (id)exportWeights
{
  -[TCMPSStyleTransfer checkpoint](self, "checkpoint");
  return -[TCMPSStyleTransferTransformerNetwork exportWeights:](self->_model, "exportWeights:", CFSTR("transformer_"));
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  MPSNNGraph *inferenceGraph;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  TCMPSStyleTransferWeights *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  float v47;
  float v48;
  float v49;
  const __CFString *v50;
  TCMPSStyleTransferWeights *v51;
  _QWORD v52[4];
  _BYTE v53[128];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_batchSize = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
  v49 = 0.0;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "getBytes:length:", &v49, 4);
  self->_imgWidth = (uint64_t)v49;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
  v48 = 0.0;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "getBytes:length:", &v48, 4);
  self->_imgHeight = (uint64_t)v48;
  v47 = 0.0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getBytes:length:", &v47, 4);

  -[TCMPSStyleTransferTransformerNetwork setStyleIndex:](self->_model, "setStyleIndex:", (unint64_t)v47);
  -[MPSNNGraph reloadFromDataSources](self->_inferenceGraph, "reloadFromDataSources");
  objc_msgSend(MEMORY[0x24BDDE3B8], "imageDescriptorWithChannelFormat:width:height:featureChannels:numberOfImages:usage:", 4, self->_imgWidth, self->_imgHeight, 3, 1, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_batchSize)
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", self->_dev, v6);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("input"));
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v10, "bytes"), 0, 0);

      objc_msgSend(v7, "addObject:", v9);
      ++v8;
    }
    while (v8 < self->_batchSize);
  }
  v11 = objc_msgSend(v7, "copy");
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  inferenceGraph = self->_inferenceGraph;
  v39 = (void *)v11;
  v54[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v14;
  v38 = v13;
  -[MPSNNGraph encodeBatchToCommandBuffer:sourceImages:sourceStates:intermediateImages:destinationStates:](inferenceGraph, "encodeBatchToCommandBuffer:sourceImages:sourceStates:intermediateImages:destinationStates:", v12, v16, 0, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v22++), "synchronizeOnCommandBuffer:", v12);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v20);
  }

  objc_msgSend(v12, "commit");
  objc_msgSend(v12, "waitUntilCompleted");
  v42 = objc_alloc_init(TCMPSStyleTransferWeights);
  objc_msgSend(v18, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "width");
  v25 = objc_msgSend(v23, "height");
  v36 = v23;
  v33 = objc_msgSend(v23, "featureChannels");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * v24 * v25 * v33);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v23, "readBytes:dataLayout:imageIndex:", objc_msgSend(v35, "mutableBytes"), 0, 0);
  +[TCMPSStyleTransfer topLeftCropImage:inputHeight:inputWidth:outputHeight:outputWidth:numChannels:](TCMPSStyleTransfer, "topLeftCropImage:inputHeight:inputWidth:outputHeight:outputWidth:numChannels:", v35, v25, v24, self->_imgHeight, self->_imgWidth, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferWeights setData:](v42, "setData:", v26);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_batchSize);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v34;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_imgHeight);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_imgWidth);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferWeights setShape:](v42, "setShape:", v30);

  v50 = CFSTR("output");
  v51 = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)setLearningRate:(float)a3
{
  double v5;
  double v6;
  double v7;

  -[TCMPSStyleTransferTransformerNetwork setLearningRate:](self->_model, "setLearningRate:");
  *(float *)&v5 = a3;
  -[TCMPSVgg16Network setLearningRate:](self->_contentVgg, "setLearningRate:", v5);
  *(float *)&v6 = a3;
  -[TCMPSVgg16Network setLearningRate:](self->_styleVggLoss, "setLearningRate:", v6);
  *(float *)&v7 = a3;
  -[TCMPSVgg16Network setLearningRate:](self->_contentVggLoss, "setLearningRate:", v7);
}

- (id)train:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  TCMPSStyleTransfer *v32;
  id v33;
  id v34;
  MPSNNGraph *trainingGraph;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  uint64_t j;
  void *v49;
  void *v50;
  TCMPSStyleTransferWeights *v51;
  void *v52;
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
  void *v67;
  id v68;
  id v69;
  id v70;
  TCMPSStyleTransfer *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  float v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  float v82;
  float v83;
  float v84;
  const __CFString *v85;
  TCMPSStyleTransferWeights *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _QWORD v89[8];

  v89[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_batchSize = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
  v84 = 0.0;
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "getBytes:length:", &v84, 4);
  self->_imgWidth = (uint64_t)v84;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
  v83 = 0.0;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "getBytes:length:", &v83, 4);
  self->_imgHeight = (uint64_t)v83;
  v82 = 0.0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getBytes:length:", &v82, 4);

  -[TCMPSStyleTransferTransformerNetwork setStyleIndex:](self->_model, "setStyleIndex:", (unint64_t)v82);
  v6 = 12 * self->_imgWidth * self->_imgHeight;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE3B8], "imageDescriptorWithChannelFormat:width:height:featureChannels:numberOfImages:usage:", 4, self->_imgWidth, self->_imgHeight, 3, 1, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  +[TCMPSStyleTransfer populateMean:](TCMPSStyleTransfer, "populateMean:", v7);
  v63 = (id)v8;
  +[TCMPSStyleTransfer populateMultiplication:](TCMPSStyleTransfer, "populateMultiplication:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v70 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v71 = self;
  v66 = v10;
  v67 = v7;
  v72 = (void *)v9;
  v64 = v12;
  v65 = v11;
  if (self->_batchSize)
  {
    v13 = 0;
    do
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", self->_dev, v9);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("input"));
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v15, "bytes"), 0, 0);

      objc_msgSend(v10, "addObject:", v14);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", self->_dev, v72);
      v17 = objc_retainAutorelease(v7);
      objc_msgSend(v16, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v17, "bytes"), 0, 0);
      objc_msgSend(v11, "addObject:", v16);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", v71->_dev, v72);
      v19 = objc_retainAutorelease(v63);
      objc_msgSend(v18, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v19, "bytes"), 0, 0);
      objc_msgSend(v12, "addObject:", v18);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", v71->_dev, v72);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labels"));
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v21, "bytes"), 0, 0);

      objc_msgSend(v69, "addObject:", v20);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", v71->_dev, v72);
      objc_msgSend(v22, "writeBytes:dataLayout:imageIndex:", objc_msgSend(objc_retainAutorelease(v17), "bytes"), 0, 0);
      objc_msgSend(v68, "addObject:", v22);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE368]), "initWithDevice:imageDescriptor:", v71->_dev, v72);
      v24 = v19;
      v11 = v65;
      objc_msgSend(v23, "writeBytes:dataLayout:imageIndex:", objc_msgSend(objc_retainAutorelease(v24), "bytes"), 0, 0);
      objc_msgSend(v70, "addObject:", v23);

      v7 = v67;
      v12 = v64;

      v10 = v66;
      self = v71;

      v9 = (uint64_t)v72;
      ++v13;
    }
    while (v13 < v71->_batchSize);
  }
  v55 = v4;
  v25 = objc_msgSend(v10, "copy");
  v26 = objc_msgSend(v11, "copy");
  v27 = objc_msgSend(v12, "copy");
  v28 = objc_msgSend(v69, "copy");
  v29 = (void *)objc_msgSend(v68, "copy");
  v30 = objc_msgSend(v70, "copy");
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self;
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  trainingGraph = v32->_trainingGraph;
  v59 = (void *)v26;
  v60 = (void *)v25;
  v89[0] = v25;
  v89[1] = v27;
  v57 = (void *)v28;
  v58 = (void *)v27;
  v89[2] = v26;
  v89[3] = v28;
  v56 = (void *)v30;
  v89[4] = v30;
  v89[5] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v34;
  -[MPSNNGraph encodeBatchToCommandBuffer:sourceImages:sourceStates:intermediateImages:destinationStates:](trainingGraph, "encodeBatchToCommandBuffer:sourceImages:sourceStates:intermediateImages:destinationStates:", v31, v36, 0, v33, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v38 = v37;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v79 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "synchronizeOnCommandBuffer:", v31);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v40);
  }

  objc_msgSend(v31, "commit");
  objc_msgSend(v31, "waitUntilCompleted");
  objc_msgSend(v33, "objectAtIndex:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v74;
    v47 = 0.0;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v74 != v46)
          objc_enumerationMutation(v43);
        v49 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v77 = 0.0;
        objc_msgSend(v49, "readBytes:dataLayout:imageIndex:", &v77, 0, 0);
        v47 = v77 + v47;
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v45);
  }
  else
  {
    v47 = 0.0;
  }
  v77 = v47 / (float)v71->_batchSize;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "appendBytes:length:", &v77, 4);
  v51 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v51, "setData:", v50);
  -[TCMPSStyleTransferWeights setShape:](v51, "setShape:", &unk_24D95F9B0);
  v85 = CFSTR("loss");
  v86 = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (void)checkpoint
{
  void *v3;
  MTLDevice *dev;
  void *v5;
  MPSNNGraph *v6;
  MPSNNGraph *inferenceGraph;

  v3 = (void *)MEMORY[0x24BDDE498];
  dev = self->_dev;
  -[TCMPSStyleTransferTransformerNetwork forwardPass](self->_model, "forwardPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graphWithDevice:resultImage:resultImageIsNeeded:", dev, v5, 1);
  v6 = (MPSNNGraph *)objc_claimAutoreleasedReturnValue();
  inferenceGraph = self->_inferenceGraph;
  self->_inferenceGraph = v6;

  -[MPSNNGraph setFormat:](self->_inferenceGraph, "setFormat:", 4);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (float)contentLossMultiplier
{
  return self->_contentLossMultiplier;
}

- (void)setContentLossMultiplier:(float)a3
{
  self->_contentLossMultiplier = a3;
}

- (float)styleLossMultiplier
{
  return self->_styleLossMultiplier;
}

- (void)setStyleLossMultiplier:(float)a3
{
  self->_styleLossMultiplier = a3;
}

- (float)totalLossMultiplier
{
  return self->_totalLossMultiplier;
}

- (void)setTotalLossMultiplier:(float)a3
{
  self->_totalLossMultiplier = a3;
}

- (BOOL)updateAllParams
{
  return self->_updateAllParams;
}

- (void)setUpdateAllParams:(BOOL)a3
{
  self->_updateAllParams = a3;
}

- (unint64_t)imgWidth
{
  return self->_imgWidth;
}

- (void)setImgWidth:(unint64_t)a3
{
  self->_imgWidth = a3;
}

- (unint64_t)imgHeight
{
  return self->_imgHeight;
}

- (void)setImgHeight:(unint64_t)a3
{
  self->_imgHeight = a3;
}

- (TCMPSStyleTransferTransformerNetwork)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (TCMPSStyleTransferPreProcessing)contentPreProcess
{
  return self->_contentPreProcess;
}

- (void)setContentPreProcess:(id)a3
{
  objc_storeStrong((id *)&self->_contentPreProcess, a3);
}

- (TCMPSStyleTransferPreProcessing)stylePreProcessLoss
{
  return self->_stylePreProcessLoss;
}

- (void)setStylePreProcessLoss:(id)a3
{
  objc_storeStrong((id *)&self->_stylePreProcessLoss, a3);
}

- (TCMPSStyleTransferPreProcessing)contentPreProcessLoss
{
  return self->_contentPreProcessLoss;
}

- (void)setContentPreProcessLoss:(id)a3
{
  objc_storeStrong((id *)&self->_contentPreProcessLoss, a3);
}

- (TCMPSVgg16Network)contentVgg
{
  return self->_contentVgg;
}

- (void)setContentVgg:(id)a3
{
  objc_storeStrong((id *)&self->_contentVgg, a3);
}

- (TCMPSVgg16Network)styleVggLoss
{
  return self->_styleVggLoss;
}

- (void)setStyleVggLoss:(id)a3
{
  objc_storeStrong((id *)&self->_styleVggLoss, a3);
}

- (TCMPSVgg16Network)contentVggLoss
{
  return self->_contentVggLoss;
}

- (void)setContentVggLoss:(id)a3
{
  objc_storeStrong((id *)&self->_contentVggLoss, a3);
}

- (MPSNNImageNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
  objc_storeStrong((id *)&self->_contentNode, a3);
}

- (MPSNNImageNode)contentScaleNode
{
  return self->_contentScaleNode;
}

- (void)setContentScaleNode:(id)a3
{
  objc_storeStrong((id *)&self->_contentScaleNode, a3);
}

- (MPSNNImageNode)contenMeanNode
{
  return self->_contenMeanNode;
}

- (void)setContenMeanNode:(id)a3
{
  objc_storeStrong((id *)&self->_contenMeanNode, a3);
}

- (MPSNNImageNode)styleNode
{
  return self->_styleNode;
}

- (void)setStyleNode:(id)a3
{
  objc_storeStrong((id *)&self->_styleNode, a3);
}

- (MPSNNImageNode)styleScaleNode
{
  return self->_styleScaleNode;
}

- (void)setStyleScaleNode:(id)a3
{
  objc_storeStrong((id *)&self->_styleScaleNode, a3);
}

- (MPSNNImageNode)styleMeanNode
{
  return self->_styleMeanNode;
}

- (void)setStyleMeanNode:(id)a3
{
  objc_storeStrong((id *)&self->_styleMeanNode, a3);
}

- (MPSNNGraph)trainingGraph
{
  return self->_trainingGraph;
}

- (void)setTrainingGraph:(id)a3
{
  objc_storeStrong((id *)&self->_trainingGraph, a3);
}

- (MPSNNGraph)inferenceGraph
{
  return self->_inferenceGraph;
}

- (void)setInferenceGraph:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceGraph, a3);
}

- (MTLDevice)dev
{
  return self->_dev;
}

- (void)setDev:(id)a3
{
  objc_storeStrong((id *)&self->_dev, a3);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_dev, 0);
  objc_storeStrong((id *)&self->_inferenceGraph, 0);
  objc_storeStrong((id *)&self->_trainingGraph, 0);
  objc_storeStrong((id *)&self->_styleMeanNode, 0);
  objc_storeStrong((id *)&self->_styleScaleNode, 0);
  objc_storeStrong((id *)&self->_styleNode, 0);
  objc_storeStrong((id *)&self->_contenMeanNode, 0);
  objc_storeStrong((id *)&self->_contentScaleNode, 0);
  objc_storeStrong((id *)&self->_contentNode, 0);
  objc_storeStrong((id *)&self->_contentVggLoss, 0);
  objc_storeStrong((id *)&self->_styleVggLoss, 0);
  objc_storeStrong((id *)&self->_contentVgg, 0);
  objc_storeStrong((id *)&self->_contentPreProcessLoss, 0);
  objc_storeStrong((id *)&self->_stylePreProcessLoss, 0);
  objc_storeStrong((id *)&self->_contentPreProcess, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
