@implementation CRNMS

- (id)initForRevision:(unint64_t)a3
{
  CRNMS *v3;
  CRNMS *v4;
  void (**v6)(nms::PyramidNMSConfigV3 *__hidden);
  _OWORD v7[60];
  deque<nms::RectForest<unsigned short, double>, std::allocator<nms::RectForest<unsigned short, double>>> *p_preNMSForests;
  objc_super v9;

  if (a3 == 3)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRNMS;
    v3 = -[CRNMS init](&v9, sel_init);
    if (v3)
    {
      nms::PyramidNMS<unsigned short,double,unsigned char>::PyramidNMS(&v6);
      p_preNMSForests = &v3->_preNMSForests;
      nms::PyramidNMS<unsigned short,double,unsigned char>::operator=((uint64_t)&v3->_pyrNMS, (uint64_t)&v6);
      nms::PyramidNMS<unsigned short,double,unsigned char>::~PyramidNMS(&v6);
      nms::PyramidNMSConfig::PyramidNMSConfig((uint64_t)&v6, 1, 1uLL);
      v6 = &off_1E98D9340;
      v7[6] = xmmword_1D513B260;
      *((_QWORD *)&v7[18] + 1) = 0x3FC999999999999ALL;
      BYTE10(v7[1]) = 1;
      *((_QWORD *)&v7[5] + 1) = 20;
      *(_QWORD *)&v7[2] = 0x4004000000000000;
      *((_QWORD *)&v7[8] + 1) = 0x3FA1EB851EB851ECLL;
      *((_QWORD *)&v7[9] + 1) = 0x3FE6666666666666;
      *(_QWORD *)&v7[13] = 0x3FE6666666666666;
      *(_QWORD *)&v7[11] = 0x3FE0000000000000;
      memcpy(&v3->_pyrNMS.config.methodType, v7, 0x148uLL);
      v3->_outputTextFeatureLevel = 6;
    }
    self = v3;
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CRNMS)initWithNMSMethodType:(unint64_t)a3 NMSScoreType:(unint64_t)a4
{
  CRNMS *v6;
  uint64_t v8;
  _QWORD v9[163];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRNMS;
  v6 = -[CRNMS init](&v10, sel_init);
  if (v6)
  {
    nms::PyramidNMS<unsigned short,double,unsigned char>::PyramidNMS(&v8);
    v9[120] = &v6->_preNMSForests;
    nms::PyramidNMS<unsigned short,double,unsigned char>::operator=((uint64_t)&v6->_pyrNMS, (uint64_t)&v8);
    nms::PyramidNMS<unsigned short,double,unsigned char>::~PyramidNMS(&v8);
    nms::PyramidNMSConfig::PyramidNMSConfig((uint64_t)&v8, a3, a4);
    if (a3 == 1)
      v9[11] = 20;
    memcpy(&v6->_pyrNMS.config.methodType, v9, 0x148uLL);
    v6->_outputTextFeatureLevel = 6;
  }
  return v6;
}

- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 andScoreMap:(vImage_Buffer *)a5 options:(id)a6
{
  return -[CRNMS addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, a5, 0, a6, a4.width, a4.height, -1.0);
}

- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 scoreMap:(vImage_Buffer *)a5 andScoreMapScaleFactor:(double)a6 options:(id)a7
{
  return -[CRNMS addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, a5, 0, a7, a4.width, a4.height, a6);
}

- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 scoreMap:(vImage_Buffer *)a5 scoreMapScaleFactor:(double)a6 andTileRects:(id)a7 options:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  unint64_t v17;
  _BYTE v19[200];

  height = a4.height;
  width = a4.width;
  v15 = a7;
  v16 = a8;
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)v19, 0);
  std::deque<nms::RectForest<unsigned short,double>>::push_back(&self->_preNMSForests.__map_.__first_, (uint64_t)v19);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)v19);
  v17 = self->_preNMSForests.__size_.__value_ + self->_preNMSForests.__start_ - 1;
  LOBYTE(a5) = -[CRNMS buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", (char *)self->_preNMSForests.__map_.__begin_[v17 / 0x14] + 200 * (v17 % 0x14), a3, 0, a5, v15, v16, width, height, a6);

  return (char)a5;
}

- (BOOL)preprocessScoreMaps
{
  BOOL result;
  unint64_t value;
  unint64_t start;
  float64x2_t v6;
  _QWORD *v7;
  float64x2_t v8;
  unint64_t v9;
  size_t v10;
  vImagePixelCount v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  const vImage_Buffer *v15;
  vImagePixelCount height;
  char *v17;
  vImagePixelCount width;
  void **v19;
  vImagePixelCount v20;
  size_t v21;
  _BYTE *data;
  _BYTE *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  vImagePixelCount *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  unint64_t v34;
  char *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  char *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  unint64_t v45;
  vImagePixelCount v46;
  vImage_Buffer dest;

  if (self->_forestFeatureType)
    return 1;
  value = self->_preNMSForests.__size_.__value_;
  if (!value)
    return 1;
  start = self->_preNMSForests.__start_;
  v6 = 0uLL;
  do
  {
    v7 = self->_preNMSForests.__map_.__begin_[start / 0x14];
    if (!v7[25 * (start % 0x14) + 2])
      goto LABEL_30;
    v8 = vcvtq_f64_u64(*(uint64x2_t *)&v7[25 * (start % 0x14) + 3]);
    v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v6), (int8x16_t)v8, (int8x16_t)v6);
    ++start;
    --value;
  }
  while (value);
  if (v6.f64[0] <= 0.0 || v6.f64[1] <= 0.0)
    goto LABEL_30;
  v9 = 0;
  v10 = (unint64_t)(v6.f64[0] * v6.f64[1]);
  v11 = (unint64_t)v6.f64[0];
  v45 = (unint64_t)v6.f64[0];
  v46 = (unint64_t)v6.f64[1];
  while (1)
  {
    v12 = self->_preNMSForests.__start_ + v9;
    v13 = (char *)self->_preNMSForests.__map_.__begin_[v12 / 0x14];
    v14 = v12 % 0x14;
    v15 = (const vImage_Buffer *)&v13[200 * (v12 % 0x14) + 16];
    memset(&dest, 0, sizeof(dest));
    dest.data = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
    dest.height = v11;
    dest.width = v46;
    dest.rowBytes = v46;
    if (vImageScale_Planar8(v15, &dest, 0, 0))
      break;
    if (dest.data)
    {
      height = dest.height;
      v17 = &v13[200 * v14];
      *((_QWORD *)v17 + 6) = dest.height;
      width = dest.width;
      *((_QWORD *)v17 + 7) = dest.width;
      v19 = (void **)(v17 + 64);
      std::valarray<unsigned char>::resize((uint64_t)(v17 + 64), width * height);
      v20 = dest.width * dest.height;
      if (dest.width * dest.height)
      {
        v21 = v10;
        data = dest.data;
        v23 = operator new(dest.width * dest.height);
        v24 = v23;
        v25 = 0;
        do
        {
          v23[v25] = data[v25];
          ++v25;
        }
        while (v20 != v25);
        v20 = (vImagePixelCount)&v23[v25];
        v10 = v21;
        v11 = v45;
      }
      else
      {
        v24 = 0;
      }
      v26 = &v13[200 * v14];
      v29 = (void *)*((_QWORD *)v26 + 9);
      v28 = (vImagePixelCount *)(v26 + 72);
      v27 = v29;
      v30 = *v19;
      if (*v19)
      {
        if (v27 != v30)
          *v28 = (vImagePixelCount)v30;
        operator delete(v30);
      }
      *v19 = v24;
      *v28 = v20;
      if (dest.data)
        free(dest.data);
    }
    if (v15->data)
    {
      free(v15->data);
      v15->data = 0;
    }
    ++v9;
    result = 1;
    if (v9 >= self->_preNMSForests.__size_.__value_)
      return result;
  }
  if (dest.data)
    free(dest.data);
  if (self->_preNMSForests.__size_.__value_)
  {
LABEL_30:
    v31 = 0;
    do
    {
      v32 = v31 + self->_preNMSForests.__start_;
      v33 = (char *)self->_preNMSForests.__map_.__begin_[v32 / 0x14];
      v34 = v32 % 0x14;
      v35 = &v33[200 * (v32 % 0x14)];
      v38 = (void *)*((_QWORD *)v35 + 2);
      v37 = v35 + 16;
      v36 = v38;
      if (v38)
      {
        free(v36);
        *v37 = 0;
      }
      v39 = &v33[200 * v34];
      v42 = (void *)*((_QWORD *)v39 + 9);
      v40 = v39 + 72;
      v41 = v42;
      v44 = v40 - 1;
      v43 = (void *)*(v40 - 1);
      *(v40 - 3) = 0;
      *(v40 - 2) = 0;
      if (v43)
      {
        if (v41 != v43)
          *v40 = v43;
        operator delete(v43);
        *v44 = 0;
        v44[1] = 0;
      }
      ++v31;
    }
    while (v31 < self->_preNMSForests.__size_.__value_);
  }
  return 0;
}

- (id)generateConsolidatedTextFeatures:(id)a3
{
  void *v3;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  -[CRNMS generateConsolidatedTextFeatures:withScaleIds:](self, "generateConsolidatedTextFeatures:withScaleIds:", a3, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  std::deque<unsigned char>::~deque[abi:ne180100](v5);
  return v3;
}

- (id)generateConsolidatedTextFeatures:(id)a3 withScaleIds:(void *)a4
{
  id v6;
  unint64_t forestFeatureType;
  _QWORD *pForests;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  BOOL v27;
  _QWORD *v28;
  unint64_t v29;
  double v30;
  unint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  BOOL v37;
  _QWORD *v38;
  unint64_t v39;
  BOOL **end;
  BOOL **begin;
  uint64_t v42;
  uint64_t v43;
  unint64_t value;
  unint64_t start;
  unint64_t v46;
  CRNMS *v47;
  BOOL **v48;
  BOOL *v49;
  BOOL *v50;
  BOOL **v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  BOOL **v57;
  int64_t v58;
  BOOL **v59;
  BOOL **v60;
  BOOL **first;
  BOOL *v62;
  BOOL *v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  BOOL **v77;
  uint64_t v78;
  BOOL **v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  BOOL **v83;
  BOOL *v84;
  BOOL **v85;
  void *v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  CRNMS *v92;
  BOOL **v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  BOOL **v108;
  unint64_t v109;
  BOOL **v110;
  uint64_t v111;
  char *v112;
  BOOL **v113;
  uint64_t v114;
  uint64_t v115;
  BOOL **v116;
  BOOL *v117;
  BOOL **v118;
  BOOL **v119;
  BOOL **v120;
  BOOL *v121;
  BOOL **v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  BOOL **v127;
  int64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  BOOL **v132;
  uint64_t v133;
  BOOL **v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  BOOL **v138;
  BOOL *v139;
  BOOL **v140;
  BOOL **v141;
  unint64_t v142;
  BOOL **v143;
  BOOL *v144;
  unsigned __int8 *v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  unsigned __int8 *v150;
  _WORD *v151;
  unsigned __int16 v152;
  _QWORD *v153;
  __int16 *v154;
  uint64_t v155;
  char *v156;
  char *v157;
  char v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  int64_t v170;
  char *v171;
  unint64_t v172;
  char *v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  _QWORD *v177;
  uint64_t v178;
  void *v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  unint64_t v183;
  char *v184;
  uint64_t v185;
  char *v186;
  uint64_t *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  void *v192;
  _QWORD *v193;
  char *v194;
  uint64_t v195;
  __int16 *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  int64_t v202;
  unint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  unsigned __int16 **v209;
  unsigned __int16 *v210;
  unsigned __int16 *v211;
  uint64_t v212;
  unsigned __int16 v213;
  unsigned __int16 *v214;
  unsigned __int16 *v215;
  unint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  _WORD *v220;
  _QWORD *v221;
  _QWORD *v222;
  _QWORD *v223;
  unint64_t v224;
  double v225;
  _QWORD *v226;
  _QWORD *v227;
  _QWORD *v228;
  _QWORD *v229;
  uint64_t v230;
  _QWORD *v231;
  unint64_t v232;
  double v233;
  _QWORD *v234;
  _QWORD *v235;
  _QWORD *v236;
  _QWORD *v237;
  unint64_t v238;
  _QWORD *v239;
  unint64_t v240;
  double v241;
  _QWORD *v242;
  _QWORD *v243;
  _QWORD *v244;
  unint64_t v245;
  _QWORD *v246;
  _QWORD *v247;
  _QWORD *v248;
  unsigned int v249;
  unint64_t v250;
  uint64_t v251;
  unsigned __int16 v252;
  unsigned __int16 *v253;
  unint64_t v254;
  uint64_t v255;
  unint64_t v256;
  uint64_t v257;
  _QWORD *v258;
  _QWORD *v259;
  _QWORD *v260;
  _QWORD *v261;
  unint64_t v262;
  double v263;
  uint64_t v264;
  unint64_t v265;
  unsigned __int16 *v266;
  unsigned __int16 v267;
  __int16 v268;
  uint64_t v269;
  _QWORD *v270;
  uint64_t v271;
  _QWORD *v272;
  double v273;
  double v274;
  unint64_t v275;
  _BYTE *v276;
  _BYTE *v277;
  _QWORD *v278;
  unint64_t v279;
  uint64_t *v280;
  uint64_t v281;
  uint64_t v282;
  _QWORD *v283;
  _QWORD *v284;
  unint64_t v285;
  BOOL v286;
  _QWORD *v287;
  unint64_t v288;
  double v289;
  _QWORD *v290;
  _QWORD *v291;
  _QWORD *v292;
  _QWORD *v293;
  unint64_t v294;
  _QWORD *v295;
  unint64_t v296;
  double v297;
  _BYTE *v298;
  _BYTE *v299;
  _QWORD *v300;
  unint64_t v301;
  uint64_t *v302;
  uint64_t v303;
  uint64_t v304;
  _QWORD *v305;
  _QWORD *v306;
  uint64_t v307;
  BOOL v308;
  _QWORD *v309;
  unint64_t v310;
  double v311;
  unsigned __int16 v312;
  _QWORD *v313;
  _QWORD *v314;
  _QWORD *v315;
  _QWORD *v316;
  uint64_t v317;
  _QWORD *v318;
  unint64_t v319;
  double v320;
  uint64_t v321;
  _BYTE *v322;
  _BYTE *v323;
  _QWORD *v324;
  unint64_t v325;
  uint64_t *v326;
  uint64_t v327;
  _QWORD *v328;
  _QWORD *v329;
  unint64_t v330;
  BOOL v331;
  _QWORD *v332;
  unint64_t v333;
  double v334;
  uint64_t v335;
  _QWORD *v336;
  _QWORD *v337;
  _QWORD *v338;
  _QWORD *v339;
  unint64_t v340;
  _QWORD *v341;
  unint64_t v342;
  double v343;
  _BYTE *v344;
  _BYTE *v345;
  _QWORD *v346;
  unint64_t v347;
  uint64_t *v348;
  uint64_t v349;
  unint64_t v350;
  unint64_t v351;
  uint64_t v352;
  unint64_t v353;
  unsigned __int16 *v354;
  unint64_t v355;
  _WORD *v356;
  unint64_t v357;
  uint64_t v358;
  uint64_t v359;
  _WORD *v360;
  void **v361;
  void **v362;
  __compressed_pair<unsigned long, std::allocator<nms::RectForest<unsigned short, double>>> *p_size;
  unint64_t v364;
  void **v365;
  unint64_t v366;
  void *v367;
  void (***v368)(void);
  void (**v369)(void);
  void (***v370)(void);
  unint64_t v371;
  void **v372;
  unint64_t v373;
  void *v374;
  void **v375;
  void **v376;
  unint64_t v377;
  void **v378;
  __compressed_pair<unsigned long, std::allocator<nms::RectForest<unsigned short, double>>> *v379;
  unint64_t v380;
  void (***v381)(void);
  void (**v382)(void);
  void (***v383)(void);
  unint64_t v384;
  unint64_t v385;
  uint64_t v387;
  uint64_t v388;
  unint64_t v389;
  unint64_t v390;
  id v391;
  _QWORD *v392;
  unsigned int v393;
  _QWORD *v394;
  CRNMS *v395;
  _BYTE v396[200];
  _BYTE v397[200];
  _OWORD v398[3];
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  unint64_t v402;
  uint64_t v403;
  uint64_t v404;
  unint64_t v405;
  uint64_t v406;
  unint64_t v407;
  _QWORD v408[2];
  __int16 v409;
  __int16 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  _BYTE *v414;
  _BYTE *v415;
  __int128 v416;
  __int128 v417;
  char *v418;

  v6 = a3;
  self->_forestFeatureType = *((_QWORD *)self->_preNMSForests.__map_.__begin_[self->_preNMSForests.__start_ / 0x14]
                             + 25 * (self->_preNMSForests.__start_ % 0x14)
                             + 1);
  v391 = v6;
  -[CRNMS preprocessScoreMaps](self, "preprocessScoreMaps");
  forestFeatureType = self->_forestFeatureType;
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)v396, forestFeatureType);
  pForests = self->_pyrNMS.pForests;
  if (!pForests)
    goto LABEL_416;
  v9 = pForests[5];
  if (!v9)
    goto LABEL_416;
  v387 = forestFeatureType;
  v10 = pForests[1];
  v395 = self;
  if (pForests[2] == v10)
    goto LABEL_140;
  v11 = pForests[4];
  v12 = *(_QWORD **)(v10 + 8 * (v11 / 0x14));
  v13 = &v12[25 * (v11 % 0x14)];
  v14 = *(_QWORD *)(v10 + 8 * ((v11 + v9) / 0x14)) + 200 * ((v11 + v9) % 0x14);
  if (v13 == (_QWORD *)v14)
    goto LABEL_140;
  v392 = (_QWORD *)(v10 + 8 * (v11 / 0x14));
  v389 = *(_QWORD *)(v10 + 8 * ((v11 + v9) / 0x14)) + 200 * ((v11 + v9) % 0x14);
  do
  {
    v15 = 0;
    v16 = 0;
    v17 = v13 + 23;
    do
    {
      if (v13[21] > v16)
      {
        v18 = *(_QWORD *)(*(_QWORD *)(v13[17] + 8 * ((v13[20] + v16) / 0x55)) + 48 * ((v13[20] + v16) % 0x55) + 40);
        if (v18)
        {
          if (v16 > 5)
            goto LABEL_42;
          v19 = qword_1D513B338[v16];
          v20 = qword_1D513B368[v16];
          v21 = v13[15];
          if (v21 <= v19)
          {
            v31 = 0;
          }
          else
          {
            v22 = (_QWORD *)v13[23];
            if (!v22)
              goto LABEL_42;
            v23 = v13[14] + v19;
            v24 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(v13[11] + ((v23 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v23
                                      + 8)
                          - *(_QWORD *)(*(_QWORD *)(v13[11] + ((v23 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v23)) >> 3;
            v25 = v13 + 23;
            do
            {
              v26 = v22[4];
              v27 = v26 >= v19;
              if (v26 >= v19)
                v28 = v22;
              else
                v28 = v22 + 1;
              if (v27)
                v25 = v22;
              v22 = (_QWORD *)*v28;
            }
            while (*v28);
            if (v25 == v17 || v25[4] > v19 || (v29 = v25[5], v29 > 8))
              v30 = 0.0;
            else
              v30 = dbl_1D513B3B8[v29];
            v31 = v24 / *(_QWORD *)&v30;
          }
          if (v21 <= v20 || v31 != v18)
            goto LABEL_42;
          v32 = (_QWORD *)v13[23];
          if (v32)
          {
            v33 = v13[14] + v20;
            v34 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(v13[11] + ((v33 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v33
                                      + 8)
                          - *(_QWORD *)(*(_QWORD *)(v13[11] + ((v33 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v33)) >> 3;
            v35 = v13 + 23;
            do
            {
              v36 = v32[4];
              v37 = v36 >= v20;
              if (v36 >= v20)
                v38 = v32;
              else
                v38 = v32 + 1;
              if (v37)
                v35 = v32;
              v32 = (_QWORD *)*v38;
            }
            while (*v38);
            if (v35 != v17 && v35[4] <= v20)
            {
              v39 = v35[5];
              if (v39 <= 8 && *(_QWORD *)&dbl_1D513B3B8[v39] > v34)
              {
LABEL_42:
                v15 = 0;
                goto LABEL_43;
              }
            }
          }
          v15 = 1;
        }
      }
LABEL_43:
      ++v16;
    }
    while (v16 != 6);
    end = self->_pyrNMS.fullySpecifiedForests.__map_.__end_;
    begin = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
    v42 = (char *)end - (char *)begin;
    if (end == begin)
      v43 = 0;
    else
      v43 = (((char *)end - (char *)begin) << 9) - 1;
    start = self->_pyrNMS.fullySpecifiedForests.__start_;
    value = self->_pyrNMS.fullySpecifiedForests.__size_.__value_;
    v46 = value + start;
    if (v43 == value + start)
    {
      if (start < 0x1000)
      {
        v60 = self->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_;
        first = self->_pyrNMS.fullySpecifiedForests.__map_.__first_;
        if (v42 >> 3 >= (unint64_t)(v60 - first))
        {
          v388 = v42 >> 3;
          if (v60 == first)
            v64 = 1;
          else
            v64 = ((char *)v60 - (char *)first) >> 2;
          v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v64);
          v67 = v66;
          v68 = operator new(0x1000uLL);
          v69 = &v65[8 * v388];
          v70 = &v65[8 * v67];
          if (v388 == v67)
          {
            v71 = 8 * v388;
            if (v42 < 1)
            {
              v86 = v68;
              v87 = v71 >> 2;
              if (end == begin)
                v88 = 1;
              else
                v88 = v87;
              v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v88);
              v69 = &v89[8 * (v88 >> 2)];
              v70 = &v89[8 * v90];
              if (v65)
                operator delete(v65);
              v65 = v89;
              v68 = v86;
            }
            else
            {
              v72 = v71 >> 3;
              if (v72 >= -1)
                v73 = v72 + 1;
              else
                v73 = v72 + 2;
              v69 -= 8 * (v73 >> 1);
            }
          }
          *(_QWORD *)v69 = v68;
          v91 = v69 + 8;
          v92 = v395;
          v93 = v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
          while (v93 != v92->_pyrNMS.fullySpecifiedForests.__map_.__begin_)
          {
            if (v69 == v65)
            {
              if (v91 >= v70)
              {
                if (v70 == v65)
                  v98 = 1;
                else
                  v98 = (v70 - v65) >> 2;
                v99 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v98);
                v101 = v99;
                v69 = &v99[(2 * v98 + 6) & 0xFFFFFFFFFFFFFFF8];
                v102 = v91 - v65;
                v308 = v91 == v65;
                v91 = v69;
                if (!v308)
                {
                  v91 = &v69[v102 & 0xFFFFFFFFFFFFFFF8];
                  v103 = 8 * (v102 >> 3);
                  v104 = v69;
                  v105 = (uint64_t *)v65;
                  do
                  {
                    v106 = *v105++;
                    *(_QWORD *)v104 = v106;
                    v104 += 8;
                    v103 -= 8;
                  }
                  while (v103);
                }
                v70 = &v99[8 * v100];
                if (v65)
                  operator delete(v65);
                v65 = v101;
              }
              else
              {
                v94 = (v70 - v91) >> 3;
                if (v94 >= -1)
                  v95 = v94 + 1;
                else
                  v95 = v94 + 2;
                v96 = v95 >> 1;
                v69 = &v65[8 * (v95 >> 1)];
                v97 = v65;
                if (v91 != v65)
                {
                  memmove(v69, v65, v91 - v65);
                  v97 = v91;
                }
                v91 = &v97[8 * v96];
              }
            }
            v107 = (uint64_t)*--v93;
            *((_QWORD *)v69 - 1) = v107;
            v69 -= 8;
            v92 = v395;
          }
          v108 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = (BOOL **)v65;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = (BOOL **)v69;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = (BOOL **)v91;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = (BOOL **)v70;
          self = v395;
          v14 = v389;
          if (v108)
            operator delete(v108);
        }
        else
        {
          v62 = (BOOL *)operator new(0x1000uLL);
          v63 = v62;
          if (v60 == end)
          {
            if (begin == first)
            {
              if (end == begin)
                v109 = 1;
              else
                v109 = ((char *)v60 - (char *)begin) >> 2;
              v110 = (BOOL **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v109);
              begin = (BOOL **)((char *)v110 + ((2 * v109 + 6) & 0xFFFFFFFFFFFFFFF8));
              self = v395;
              v112 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
              v113 = begin;
              v114 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ - v112;
              v14 = v389;
              if (v114)
              {
                v113 = (BOOL **)((char *)begin + (v114 & 0xFFFFFFFFFFFFFFF8));
                v115 = 8 * (v114 >> 3);
                v116 = begin;
                do
                {
                  v117 = *(BOOL **)v112;
                  v112 += 8;
                  *v116++ = v117;
                  v115 -= 8;
                }
                while (v115);
              }
              v118 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = v110;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = begin;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = v113;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = &v110[v111];
              if (v118)
              {
                operator delete(v118);
                begin = v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
              }
            }
            else
            {
              self = v395;
              v14 = v389;
            }
            *(begin - 1) = v63;
            v119 = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
            v120 = self->_pyrNMS.fullySpecifiedForests.__map_.__end_;
            self->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v119 - 1;
            v121 = *(v119 - 1);
            self->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v119;
            if (v120 == self->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_)
            {
              v122 = self->_pyrNMS.fullySpecifiedForests.__map_.__first_;
              v123 = (char *)v119 - (char *)v122;
              if (v119 <= v122)
              {
                v129 = (char *)v120 - (char *)v122;
                v308 = v129 == 0;
                v130 = v129 >> 2;
                if (v308)
                  v131 = 1;
                else
                  v131 = v130;
                v132 = (BOOL **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v131);
                v134 = &v132[v131 >> 2];
                self = v395;
                v135 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
                v120 = v134;
                v136 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ - v135;
                v14 = v389;
                if (v136)
                {
                  v120 = (BOOL **)((char *)v134 + (v136 & 0xFFFFFFFFFFFFFFF8));
                  v137 = 8 * (v136 >> 3);
                  v138 = &v132[v131 >> 2];
                  do
                  {
                    v139 = *(BOOL **)v135;
                    v135 += 8;
                    *v138++ = v139;
                    v137 -= 8;
                  }
                  while (v137);
                }
                v140 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = v132;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v134;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = v120;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = &v132[v133];
                if (v140)
                {
                  operator delete(v140);
                  v120 = v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
                }
              }
              else
              {
                v124 = v123 >> 3;
                v54 = v123 >> 3 < -1;
                v125 = (v123 >> 3) + 2;
                if (v54)
                  v126 = v125;
                else
                  v126 = v124 + 1;
                v127 = &v119[-(v126 >> 1)];
                v128 = (char *)v120 - (char *)v119;
                if (v120 != v119)
                {
                  memmove(&v119[-(v126 >> 1)], v119, (char *)v120 - (char *)v119);
                  v119 = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
                }
                v120 = (BOOL **)((char *)v127 + v128);
                self->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = &v119[-(v126 >> 1)];
                self->_pyrNMS.fullySpecifiedForests.__map_.__end_ = (BOOL **)((char *)v127 + v128);
              }
            }
            *v120 = v121;
            ++self->_pyrNMS.fullySpecifiedForests.__map_.__end_;
          }
          else
          {
            *end = v62;
            self = v395;
            ++v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
            v14 = v389;
          }
        }
      }
      else
      {
        self->_pyrNMS.fullySpecifiedForests.__start_ = start - 4096;
        v47 = self;
        v50 = *begin;
        v48 = begin + 1;
        v49 = v50;
        v47->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v48;
        if (end == v47->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_)
        {
          v51 = v47->_pyrNMS.fullySpecifiedForests.__map_.__first_;
          v52 = (char *)v48 - (char *)v51;
          if (v48 <= v51)
          {
            v74 = (char *)end - (char *)v51;
            v308 = v74 == 0;
            v75 = v74 >> 2;
            if (v308)
              v76 = 1;
            else
              v76 = v75;
            v77 = (BOOL **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v76);
            v79 = &v77[v76 >> 2];
            v80 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
            end = v79;
            v81 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ - v80;
            v14 = v389;
            if (v81)
            {
              end = (BOOL **)((char *)v79 + (v81 & 0xFFFFFFFFFFFFFFF8));
              v82 = 8 * (v81 >> 3);
              v83 = &v77[v76 >> 2];
              do
              {
                v84 = *(BOOL **)v80;
                v80 += 8;
                *v83++ = v84;
                v82 -= 8;
              }
              while (v82);
            }
            v47 = v395;
            v85 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = v77;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v79;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = end;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = &v77[v78];
            if (v85)
            {
              operator delete(v85);
              end = v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
            }
          }
          else
          {
            v53 = v52 >> 3;
            v54 = v52 >> 3 < -1;
            v55 = (v52 >> 3) + 2;
            if (v54)
              v56 = v55;
            else
              v56 = v53 + 1;
            v57 = &v48[-(v56 >> 1)];
            v58 = (char *)end - (char *)v48;
            v47 = v395;
            if (end != v48)
            {
              memmove(&v48[-(v56 >> 1)], v48, (char *)end - (char *)v48);
              end = v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
            }
            v59 = &end[-(v56 >> 1)];
            end = (BOOL **)((char *)v57 + v58);
            v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v59;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = (BOOL **)((char *)v57 + v58);
            v14 = v389;
          }
        }
        *end = v49;
        ++v47->_pyrNMS.fullySpecifiedForests.__map_.__end_;
        self = v47;
      }
      begin = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
      value = self->_pyrNMS.fullySpecifiedForests.__size_.__value_;
      v46 = self->_pyrNMS.fullySpecifiedForests.__start_ + value;
      v12 = (_QWORD *)*v392;
    }
    (*(BOOL **)((char *)begin + ((v46 >> 9) & 0x7FFFFFFFFFFFF8)))[v46 & 0xFFF] = v15 & 1;
    self->_pyrNMS.fullySpecifiedForests.__size_.__value_ = value + 1;
    v13 += 25;
    if ((char *)v13 - (char *)v12 == 4000)
    {
      v12 = (_QWORD *)v392[1];
      ++v392;
      v13 = v12;
    }
  }
  while (v13 != (_QWORD *)v14);
LABEL_140:
  v141 = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
  if (self->_pyrNMS.fullySpecifiedForests.__map_.__end_ == v141)
    goto LABEL_416;
  v142 = self->_pyrNMS.fullySpecifiedForests.__start_;
  v143 = &v141[v142 >> 12];
  v144 = *v143;
  v145 = (unsigned __int8 *)&(*v143)[v142 & 0xFFF];
  v146 = (unint64_t)&(*(BOOL **)((char *)v141
                                      + (((self->_pyrNMS.fullySpecifiedForests.__size_.__value_ + v142) >> 9) & 0x7FFFFFFFFFFFF8)))[(self->_pyrNMS.fullySpecifiedForests.__size_.__value_ + v142) & 0xFFF];
  if (v145 == (unsigned __int8 *)v146)
    goto LABEL_416;
  v147 = 0;
  do
  {
    v149 = *v145++;
    v148 = v149;
    if (v145 - (unsigned __int8 *)v144 == 4096)
    {
      v150 = (unsigned __int8 *)v143[1];
      ++v143;
      v144 = (BOOL *)v150;
      v145 = v150;
    }
    v147 += v148;
  }
  while (v145 != (unsigned __int8 *)v146);
  if (!v147 || self->_pyrNMS.config.methodType != 1)
    goto LABEL_416;
  memset(v398, 0, sizeof(v398));
  nms::PyramidNMS<unsigned short,double,unsigned char>::computeRectRelationships((uint64_t)&self->_pyrNMS, v398, self->_pyrNMS.config.computeIntrascaleGeometricRelationships);
  nms::PyramidNMS<unsigned short,double,unsigned char>::performNMSAtOneLevel((uint64_t)&self->_pyrNMS);
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)v397, v387);
  v151 = self->_pyrNMS.pForests;
  if (!v151)
    goto LABEL_415;
  v393 = (unsigned __int16)v151[20];
  if (!v151[20])
    goto LABEL_415;
  v152 = 0;
  v412 = 0u;
  v413 = 0u;
  v411 = 0u;
  v410 = 0;
  while (2)
  {
    nms::BOOLeanMaskToIndices<unsigned short>((uint64_t)&v399, *(uint64_t *)((char *)self->_pyrNMS.masksValid.__map_.__begin_+ (((self->_pyrNMS.masksValid.__start_ + v152) >> 5) & 0x7FFFFFFFFFFFFF8))+ 16 * (LOBYTE(self->_pyrNMS.masksValid.__start_) + v152));
    if (v401 != v400)
    {
      v153 = (_QWORD *)(v400 + 8 * (v402 >> 11));
      v154 = (__int16 *)(*v153 + 2 * (v402 & 0x7FF));
      v155 = *(_QWORD *)(v400 + (((v403 + v402) >> 8) & 0xFFFFFFFFFFFFF8)) + 2 * ((v403 + v402) & 0x7FF);
      if (v154 != (__int16 *)v155)
      {
        while (2)
        {
          v409 = 0;
          v409 = *v154;
          std::deque<std::pair<unsigned short,unsigned short>>::emplace_back<unsigned short &,unsigned short &>(&v411, &v410, &v409);
          v156 = (char *)*((_QWORD *)a4 + 2);
          v157 = (char *)*((_QWORD *)a4 + 1);
          v158 = v410;
          if (v156 == v157)
            v159 = 0;
          else
            v159 = ((v156 - v157) << 9) - 1;
          v160 = *((_QWORD *)a4 + 4);
          v161 = *((_QWORD *)a4 + 5) + v160;
          if (v159 == v161)
          {
            if (v160 >= 0x1000)
            {
              *((_QWORD *)a4 + 4) = v160 - 4096;
              v164 = *(_QWORD *)v157;
              v162 = v157 + 8;
              v163 = v164;
              *((_QWORD *)a4 + 1) = v162;
              if (v156 == *((char **)a4 + 3))
              {
                v165 = (uint64_t)&v162[-*(_QWORD *)a4];
                if ((unint64_t)v162 > *(_QWORD *)a4)
                {
                  v166 = v165 >> 3;
                  v54 = v165 >> 3 < -1;
                  v167 = (v165 >> 3) + 2;
                  if (v54)
                    v168 = v167;
                  else
                    v168 = v166 + 1;
                  v169 = &v162[-8 * (v168 >> 1)];
                  v170 = v156 - v162;
                  if (v156 != v162)
                  {
                    memmove(&v162[-8 * (v168 >> 1)], v162, v156 - v162);
                    v156 = (char *)*((_QWORD *)a4 + 1);
                  }
                  v171 = &v156[-8 * (v168 >> 1)];
                  v156 = &v169[v170];
                  goto LABEL_166;
                }
                if (v156 == *(char **)a4)
                  v183 = 1;
                else
                  v183 = (uint64_t)&v156[-*(_QWORD *)a4] >> 2;
                v184 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a4 + 24, v183);
                v186 = &v184[8 * (v183 >> 2)];
                v187 = (uint64_t *)*((_QWORD *)a4 + 1);
                v156 = v186;
                v188 = *((_QWORD *)a4 + 2) - (_QWORD)v187;
                if (v188)
                {
                  v156 = &v186[v188 & 0xFFFFFFFFFFFFFFF8];
                  v189 = 8 * (v188 >> 3);
                  v190 = &v184[8 * (v183 >> 2)];
                  do
                  {
                    v191 = *v187++;
                    *(_QWORD *)v190 = v191;
                    v190 += 8;
                    v189 -= 8;
                  }
                  while (v189);
                }
LABEL_186:
                v192 = *(void **)a4;
                *(_QWORD *)a4 = v184;
                *((_QWORD *)a4 + 1) = v186;
                *((_QWORD *)a4 + 2) = v156;
                *((_QWORD *)a4 + 3) = &v184[8 * v185];
                if (v192)
                {
                  operator delete(v192);
                  v156 = (char *)*((_QWORD *)a4 + 2);
                }
              }
              goto LABEL_189;
            }
            v172 = (v156 - v157) >> 3;
            v173 = (char *)*((_QWORD *)a4 + 3);
            v174 = (uint64_t)&v173[-*(_QWORD *)a4];
            if (v172 >= v174 >> 3)
            {
              if (v173 == *(char **)a4)
                v175 = 1;
              else
                v175 = v174 >> 2;
              v418 = (char *)a4 + 24;
              *(_QWORD *)&v416 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a4 + 24, v175);
              *((_QWORD *)&v416 + 1) = v416 + 8 * v172;
              *(_QWORD *)&v417 = *((_QWORD *)&v416 + 1);
              *((_QWORD *)&v417 + 1) = v416 + 8 * v176;
              v414 = operator new(0x1000uLL);
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *> &>::push_back(&v416, &v414);
              v177 = (_QWORD *)*((_QWORD *)a4 + 2);
              v178 = -7 - (_QWORD)v177;
              while (v177 != *((_QWORD **)a4 + 1))
              {
                --v177;
                v178 += 8;
                std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *> &>::push_front((uint64_t)&v416, v177);
              }
              v179 = *(void **)a4;
              v180 = v416;
              v181 = v417;
              *(_QWORD *)&v416 = *(_QWORD *)a4;
              *((_QWORD *)&v416 + 1) = v177;
              v182 = *((_OWORD *)a4 + 1);
              *(_OWORD *)a4 = v180;
              *((_OWORD *)a4 + 1) = v181;
              v417 = v182;
              if (v177 != (_QWORD *)v182)
                *(_QWORD *)&v417 = v182 + (-(v182 + v178) & 0xFFFFFFFFFFFFFFF8);
              if (v179)
                operator delete(v179);
            }
            else if (v173 == v156)
            {
              *(_QWORD *)&v416 = operator new(0x1000uLL);
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)a4, &v416);
              v193 = (_QWORD *)*((_QWORD *)a4 + 1);
              v156 = (char *)*((_QWORD *)a4 + 2);
              v195 = *v193;
              v194 = (char *)(v193 + 1);
              v163 = v195;
              *((_QWORD *)a4 + 1) = v194;
              if (v156 == *((char **)a4 + 3))
              {
                v197 = (uint64_t)&v194[-*(_QWORD *)a4];
                if ((unint64_t)v194 <= *(_QWORD *)a4)
                {
                  if (v156 == *(char **)a4)
                    v203 = 1;
                  else
                    v203 = (uint64_t)&v156[-*(_QWORD *)a4] >> 2;
                  v184 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a4 + 24, v203);
                  v186 = &v184[8 * (v203 >> 2)];
                  v204 = (uint64_t *)*((_QWORD *)a4 + 1);
                  v156 = v186;
                  v205 = *((_QWORD *)a4 + 2) - (_QWORD)v204;
                  if (v205)
                  {
                    v156 = &v186[v205 & 0xFFFFFFFFFFFFFFF8];
                    v206 = 8 * (v205 >> 3);
                    v207 = &v184[8 * (v203 >> 2)];
                    do
                    {
                      v208 = *v204++;
                      *(_QWORD *)v207 = v208;
                      v207 += 8;
                      v206 -= 8;
                    }
                    while (v206);
                  }
                  goto LABEL_186;
                }
                v198 = v197 >> 3;
                v54 = v197 >> 3 < -1;
                v199 = (v197 >> 3) + 2;
                if (v54)
                  v200 = v199;
                else
                  v200 = v198 + 1;
                v201 = &v194[-8 * (v200 >> 1)];
                v202 = v156 - v194;
                if (v156 != v194)
                {
                  memmove(&v194[-8 * (v200 >> 1)], v194, v156 - v194);
                  v194 = (char *)*((_QWORD *)a4 + 1);
                }
                v156 = &v201[v202];
                v171 = &v194[-8 * (v200 >> 1)];
LABEL_166:
                *((_QWORD *)a4 + 1) = v171;
                *((_QWORD *)a4 + 2) = v156;
              }
LABEL_189:
              *(_QWORD *)v156 = v163;
              *((_QWORD *)a4 + 2) += 8;
            }
            else
            {
              *(_QWORD *)&v416 = operator new(0x1000uLL);
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_back(a4, &v416);
            }
            v157 = (char *)*((_QWORD *)a4 + 1);
            v161 = *((_QWORD *)a4 + 5) + *((_QWORD *)a4 + 4);
          }
          *(_BYTE *)(*(_QWORD *)&v157[(v161 >> 9) & 0x7FFFFFFFFFFFF8] + (v161 & 0xFFF)) = v158;
          ++*((_QWORD *)a4 + 5);
          if ((__int16 *)((char *)++v154 - *v153) == (__int16 *)4096)
          {
            v196 = (__int16 *)v153[1];
            ++v153;
            v154 = v196;
          }
          if (v154 == (__int16 *)v155)
          {
            v152 = v410;
            break;
          }
          continue;
        }
      }
    }
    std::deque<unsigned short>::~deque[abi:ne180100](&v399);
    v410 = ++v152;
    self = v395;
    if (v393 > v152)
      continue;
    break;
  }
  v394 = v395->_pyrNMS.pForests;
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)&v399, v387);
  if (v387)
    goto LABEL_414;
  if ((_QWORD)v412 == *((_QWORD *)&v411 + 1)
    || (v209 = (unsigned __int16 **)(*((_QWORD *)&v411 + 1) + 8 * ((unint64_t)v413 >> 10)),
        v210 = *v209,
        v211 = &(*v209)[2 * (v413 & 0x3FF)],
        v212 = *(_QWORD *)(*((_QWORD *)&v411 + 1)
                         + ((((_QWORD)v413 + *((_QWORD *)&v413 + 1)) >> 7) & 0x1FFFFFFFFFFFFF8))
             + 4 * ((v413 + *((_QWORD *)&v413 + 1)) & 0x3FF),
        v211 == (unsigned __int16 *)v212))
  {
    v213 = 0;
  }
  else
  {
    v213 = 0;
    do
    {
      v214 = v211 + 2;
      if ((char *)(v211 + 2) - (char *)v210 == 4096)
      {
        v215 = v209[1];
        ++v209;
        v210 = v215;
        v214 = v215;
      }
      v216 = v394[4] + *v211;
      v217 = *(_QWORD *)(v394[1] + 8 * (v216 / 0x14)) + 200 * (v216 % 0x14);
      v218 = *(_QWORD *)(*(_QWORD *)(v217 + 136) + 8 * (*(_QWORD *)(v217 + 160) / 0x55uLL))
           + 48 * (*(_QWORD *)(v217 + 160) % 0x55uLL);
      v219 = *(_QWORD *)(v218 + 32) + v211[1];
      v220 = (_WORD *)(*(_QWORD *)(*(_QWORD *)(v218 + 8) + ((v219 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v219 & 0x3FF));
      v213 = v213 + v220[1] - *v220 + 1;
      v211 = v214;
    }
    while (v214 != (unsigned __int16 *)v212);
  }
  v221 = (_QWORD *)v408[0];
  if (!v408[0])
  {
    v241 = 0.0;
    v225 = 0.0;
    v233 = 0.0;
LABEL_272:
    v249 = 0;
    goto LABEL_273;
  }
  v222 = (_QWORD *)v408[0];
  do
  {
    v223 = v222;
    v222 = (_QWORD *)*v222;
  }
  while (v222);
  if (v223 == v408 || v223[4] || (v224 = v223[5], v224 >= 9))
    v225 = 0.0;
  else
    v225 = dbl_1D513B3B8[v224];
  v226 = v408;
  v227 = (_QWORD *)v408[0];
  do
  {
    v228 = v227;
    v229 = v226;
    v230 = v227[4];
    if (v230)
      v226 = v227;
    else
      ++v227;
    v227 = (_QWORD *)*v227;
  }
  while (v227);
  if (v226 == v408)
    goto LABEL_241;
  v231 = v230 ? v228 : v229;
  if (v231[4] > 1uLL)
    goto LABEL_241;
  if (!v230)
    v228 = v229;
  v232 = v228[5];
  if (v232 > 8)
LABEL_241:
    v233 = 0.0;
  else
    v233 = dbl_1D513B3B8[v232];
  v234 = v408;
  v235 = (_QWORD *)v408[0];
  do
  {
    v236 = v235;
    v237 = v234;
    v238 = v235[4];
    if (v238 >= 3)
      v234 = v235;
    else
      ++v235;
    v235 = (_QWORD *)*v235;
  }
  while (v235);
  if (v234 == v408)
    goto LABEL_256;
  v239 = v238 >= 3 ? v236 : v237;
  if (v239[4] > 3uLL)
    goto LABEL_256;
  if (v238 < 3)
    v236 = v237;
  v240 = v236[5];
  if (v240 > 8)
LABEL_256:
    v241 = 0.0;
  else
    v241 = dbl_1D513B3B8[v240];
  v242 = v408;
  do
  {
    v243 = v221;
    v244 = v242;
    v245 = v221[4];
    v246 = v221 + 1;
    if (v245 >= 4)
    {
      v246 = v243;
      v242 = v243;
    }
    v221 = (_QWORD *)*v246;
  }
  while (v221);
  if (v242 == v408)
    goto LABEL_272;
  v247 = v245 >= 4 ? v243 : v244;
  if (v247[4] > 4uLL)
    goto LABEL_272;
  if (v245 >= 4)
    v248 = v243;
  else
    v248 = v244;
  switch(v248[5])
  {
    case 0:
    case 1:
      v249 = 4;
      break;
    case 2:
      v249 = 8;
      break;
    case 3:
    case 4:
      v249 = 2;
      break;
    case 5:
      v249 = 5;
      break;
    case 6:
      v249 = 9;
      break;
    case 7:
      v249 = 3;
      break;
    case 8:
      v249 = 14;
      break;
    default:
      goto LABEL_272;
  }
LABEL_273:
  v250 = WORD4(v413);
  std::valarray<double>::resize(*(_QWORD *)(v404 + ((v405 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v405, *(_QWORD *)&v225 * WORD4(v413), 0.0);
  std::valarray<double>::resize(*(_QWORD *)(v404 + (((v405 + 1) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v405 + 1), *(_QWORD *)&v233 * v213, 0.0);
  std::valarray<double>::resize(*(_QWORD *)(v404 + (((v405 + 3) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v405 + 3), *(_QWORD *)&v241 * v250, 0.0);
  std::valarray<double>::resize(*(_QWORD *)(v404 + (((v405 + 4) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v405 + 4), v249 * (unint64_t)v213, 0.0);
  std::deque<std::pair<unsigned short,unsigned short>>::resize((_QWORD *)(*(_QWORD *)(v406 + 8 * (v407 / 0x55)) + 48 * (v407 % 0x55)), v250);
  std::deque<std::pair<unsigned short,unsigned short>>::resize((_QWORD *)(*(_QWORD *)(v406 + 8 * ((v407 + 4) / 0x55)) + 48 * ((v407 + 4) % 0x55)), v250);
  std::deque<std::pair<unsigned short,unsigned short>>::resize((_QWORD *)(*(_QWORD *)(v406 + 8 * ((v407 + 5) / 0x55)) + 48 * ((v407 + 5) % 0x55)), v213);
  if (v250)
  {
    v251 = 0;
    v252 = 0;
    v390 = v250;
    while (1)
    {
      v253 = (unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)&v411 + 1)
                                            + (((unint64_t)(v413 + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                                + 4 * ((v413 + v251) & 0x3FF));
      v254 = v394[4] + *v253;
      v255 = *(_QWORD *)(v394[1] + 8 * (v254 / 0x14));
      v256 = v254 % 0x14;
      v257 = v255 + 200 * v256;
      v260 = *(_QWORD **)(v257 + 184);
      v259 = (_QWORD *)(v257 + 184);
      v258 = v260;
      if (!v260)
        goto LABEL_281;
      do
      {
        v261 = v258;
        v258 = (_QWORD *)*v258;
      }
      while (v258);
      if (v261 == v259 || v261[4] || (v262 = v261[5], v262 > 8))
LABEL_281:
        v263 = 0.0;
      else
        v263 = dbl_1D513B3B8[v262];
      v264 = v253[1];
      v265 = *(_QWORD *)(*(_QWORD *)(v255 + 200 * v256 + 136) + 8 * (*(_QWORD *)(v255 + 200 * v256 + 160) / 0x55uLL))
           + 48 * (*(_QWORD *)(v255 + 200 * v256 + 160) % 0x55uLL);
      v266 = (unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(v265 + 8)
                                            + (((unint64_t)(*(_QWORD *)(v265 + 32) + v264) >> 7) & 0x1FFFFFFFFFFFFF8))
                                + 4 * ((*(_QWORD *)(v265 + 32) + v264) & 0x3FF));
      v267 = v266[1];
      v268 = *v266;
      v269 = v255 + 200 * v256;
      v271 = *(_QWORD *)(v269 + 88);
      v270 = (_QWORD *)(v269 + 88);
      v272 = v270 + 3;
      *(_QWORD *)&v416 = *(_QWORD *)(v271 + ((v270[3] >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v270[3];
      *((_QWORD *)&v416 + 1) = *(_QWORD *)&v263 * v264;
      *(double *)&v417 = v263;
      *((_QWORD *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v273 = *(double *)v408;
      if (v408[0])
      {
        do
        {
          v274 = v273;
          v273 = **(double **)&v273;
        }
        while (v273 != 0.0);
        if (*(_QWORD **)&v274 == v408
          || *(_QWORD *)(*(_QWORD *)&v274 + 32)
          || (v275 = *(_QWORD *)(*(_QWORD *)&v274 + 40), v275 > 8))
        {
          v273 = 0.0;
        }
        else
        {
          v273 = dbl_1D513B3B8[v275];
        }
      }
      v276 = v414;
      v277 = v415;
      if (v415 != v414)
        break;
      if (v415)
        goto LABEL_296;
LABEL_297:
      v282 = *(unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)&v411 + 1)
                                             + (((unint64_t)(v413 + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((v413 + v251) & 0x3FF)
                                 + 2);
      v283 = (_QWORD *)*v259;
      if (!*v259)
        goto LABEL_310;
      v284 = v259;
      do
      {
        v285 = v283[4];
        v286 = v285 >= 3;
        if (v285 >= 3)
          v287 = v283;
        else
          v287 = v283 + 1;
        if (v286)
          v284 = v283;
        v283 = (_QWORD *)*v287;
      }
      while (*v287);
      if (v284 == v259 || v284[4] > 3uLL || (v288 = v284[5], v288 > 8))
LABEL_310:
        v289 = 0.0;
      else
        v289 = dbl_1D513B3B8[v288];
      *(_QWORD *)&v416 = *(_QWORD *)(*v270 + (((unint64_t)(*v272 + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*(_BYTE *)v272 + 3);
      *((_QWORD *)&v416 + 1) = *(_QWORD *)&v289 * v282;
      *(double *)&v417 = v289;
      *((_QWORD *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v290 = (_QWORD *)v408[0];
      if (!v408[0])
        goto LABEL_326;
      v291 = v408;
      do
      {
        v292 = v290;
        v293 = v291;
        v294 = v290[4];
        if (v294 >= 3)
          v291 = v290;
        else
          ++v290;
        v290 = (_QWORD *)*v290;
      }
      while (v290);
      if (v291 == v408)
        goto LABEL_326;
      v295 = v294 >= 3 ? v292 : v293;
      if (v295[4] > 3uLL)
        goto LABEL_326;
      if (v294 < 3)
        v292 = v293;
      v296 = v292[5];
      if (v296 > 8)
LABEL_326:
        v297 = 0.0;
      else
        v297 = dbl_1D513B3B8[v296];
      v298 = v414;
      v299 = v415;
      if (v415 != v414)
      {
        v300 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v404 + (((v405 + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v405 + 3))
                        + 8 * *(_QWORD *)&v297 * v251);
        v301 = (v415 - v414) >> 3;
        if (v301 <= 1)
          v301 = 1;
        v302 = (uint64_t *)v414;
        do
        {
          v303 = *v302++;
          *v300++ = v303;
          --v301;
        }
        while (v301);
        v415 = &v299[(v298 - v299 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_334:
        operator delete(v298);
        goto LABEL_335;
      }
      if (v415)
        goto LABEL_334;
LABEL_335:
      v304 = *v266;
      v305 = (_QWORD *)*v259;
      if (!*v259)
        goto LABEL_347;
      v306 = v259;
      do
      {
        v307 = v305[4];
        v308 = v307 == 0;
        if (v307)
          v309 = v305;
        else
          v309 = v305 + 1;
        if (!v308)
          v306 = v305;
        v305 = (_QWORD *)*v309;
      }
      while (*v309);
      if (v306 == v259 || v306[4] > 1uLL || (v310 = v306[5], v310 > 8))
LABEL_347:
        v311 = 0.0;
      else
        v311 = dbl_1D513B3B8[v310];
      v312 = v267 - v268 + 1;
      *(_QWORD *)&v416 = *(_QWORD *)(*v270 + (((unint64_t)(*v272 + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*(_BYTE *)v272 + 1);
      *((_QWORD *)&v416 + 1) = *(_QWORD *)&v311 * v304;
      *(_QWORD *)&v417 = *(_QWORD *)&v311 * v312;
      *((_QWORD *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v313 = (_QWORD *)v408[0];
      if (!v408[0])
        goto LABEL_363;
      v314 = v408;
      do
      {
        v315 = v313;
        v316 = v314;
        v317 = v313[4];
        if (v317)
          v314 = v313;
        else
          ++v313;
        v313 = (_QWORD *)*v313;
      }
      while (v313);
      if (v314 == v408)
        goto LABEL_363;
      v318 = v317 ? v315 : v316;
      if (v318[4] > 1uLL)
        goto LABEL_363;
      if (!v317)
        v315 = v316;
      v319 = v315[5];
      if (v319 > 8)
LABEL_363:
        v320 = 0.0;
      else
        v320 = dbl_1D513B3B8[v319];
      v321 = v252;
      v322 = v414;
      v323 = v415;
      if (v415 != v414)
      {
        v324 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v404 + (((v405 + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v405 + 1))
                        + 8 * *(_QWORD *)&v320 * v252);
        v325 = (v415 - v414) >> 3;
        if (v325 <= 1)
          v325 = 1;
        v326 = (uint64_t *)v414;
        do
        {
          v327 = *v326++;
          *v324++ = v327;
          --v325;
        }
        while (v325);
        v415 = &v323[(v322 - v323 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_371:
        operator delete(v322);
        goto LABEL_372;
      }
      if (v415)
        goto LABEL_371;
LABEL_372:
      v328 = (_QWORD *)*v259;
      if (!*v259)
        goto LABEL_385;
      v329 = v259;
      do
      {
        v330 = v328[4];
        v331 = v330 >= 4;
        if (v330 >= 4)
          v332 = v328;
        else
          v332 = v328 + 1;
        if (v331)
          v329 = v328;
        v328 = (_QWORD *)*v332;
      }
      while (*v332);
      if (v329 == v259 || v329[4] > 4uLL || (v333 = v329[5], v333 > 8))
LABEL_385:
        v334 = 0.0;
      else
        v334 = dbl_1D513B3B8[v333];
      v335 = *(_QWORD *)&v334 * *v266;
      *(_QWORD *)&v416 = *(_QWORD *)(*v270 + (((unint64_t)(*v272 + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*(_BYTE *)v272 + 4);
      *((_QWORD *)&v416 + 1) = v335;
      *(_QWORD *)&v417 = *(_QWORD *)&v334 * v312;
      *((_QWORD *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v336 = (_QWORD *)v408[0];
      if (!v408[0])
        goto LABEL_401;
      v337 = v408;
      do
      {
        v338 = v336;
        v339 = v337;
        v340 = v336[4];
        if (v340 >= 4)
          v337 = v336;
        else
          ++v336;
        v336 = (_QWORD *)*v336;
      }
      while (v336);
      if (v337 == v408)
        goto LABEL_401;
      v341 = v340 >= 4 ? v338 : v339;
      if (v341[4] > 4uLL)
        goto LABEL_401;
      if (v340 < 4)
        v338 = v339;
      v342 = v338[5];
      if (v342 > 8)
LABEL_401:
        v343 = 0.0;
      else
        v343 = dbl_1D513B3B8[v342];
      v344 = v414;
      v345 = v415;
      if (v415 != v414)
      {
        v346 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v404 + (((v405 + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v405 + 4))
                        + 8 * *(_QWORD *)&v343 * v252);
        v347 = (v415 - v414) >> 3;
        if (v347 <= 1)
          v347 = 1;
        v348 = (uint64_t *)v414;
        do
        {
          v349 = *v348++;
          *v346++ = v349;
          --v347;
        }
        while (v347);
        v415 = &v345[(v344 - v345 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_409:
        operator delete(v344);
        goto LABEL_410;
      }
      if (v415)
        goto LABEL_409;
LABEL_410:
      v350 = v312 + v252;
      v351 = v407;
      v352 = v406;
      v353 = *(_QWORD *)(v406 + 8 * (v407 / 0x55)) + 48 * (v407 % 0x55);
      v354 = (unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(v353 + 8)
                                            + (((unint64_t)(*(_QWORD *)(v353 + 32) + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                                + 4 * ((*(_QWORD *)(v353 + 32) + v251) & 0x3FF));
      *v354 = v252;
      v354[1] = v312 + v252 - 1;
      v355 = *(_QWORD *)(v352 + 8 * ((v351 + 4) / 0x55)) + 48 * ((v351 + 4) % 0x55);
      v356 = (_WORD *)(*(_QWORD *)(*(_QWORD *)(v355 + 8)
                                 + (((unint64_t)(*(_QWORD *)(v355 + 32) + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                     + 4 * ((*(_QWORD *)(v355 + 32) + v251) & 0x3FF));
      *v356 = v251;
      v356[1] = v251;
      if (v252 < v350)
      {
        v357 = *(_QWORD *)(v352 + 8 * ((v351 + 5) / 0x55)) + 48 * ((v351 + 5) % 0x55);
        v358 = *(_QWORD *)(v357 + 32);
        v359 = *(_QWORD *)(v357 + 8);
        do
        {
          v360 = (_WORD *)(*(_QWORD *)(v359 + (((unint64_t)(v358 + v321) >> 7) & 0x1FFFFFFFFFFFFF8))
                         + 4 * ((v358 + v321) & 0x3FF));
          *v360 = v321;
          v360[1] = v321++;
        }
        while (v350 != v321);
      }
      v252 += v312;
      ++v251;
      self = v395;
      if (v251 == v390)
        goto LABEL_414;
    }
    v278 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v404 + ((v405 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v405)
                    + 8 * *(_QWORD *)&v273 * v251);
    v279 = (v415 - v414) >> 3;
    if (v279 <= 1)
      v279 = 1;
    v280 = (uint64_t *)v414;
    do
    {
      v281 = *v280++;
      *v278++ = v281;
      --v279;
    }
    while (v279);
    v415 = &v277[(v276 - v277 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_296:
    operator delete(v276);
    goto LABEL_297;
  }
LABEL_414:
  nms::RectForest<unsigned short,double>::operator=((uint64_t)v397, (uint64_t)&v399);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)&v399);
  std::deque<std::pair<unsigned short,unsigned short>>::~deque[abi:ne180100](&v411);
LABEL_415:
  nms::RectForest<unsigned short,double>::operator=((uint64_t)v396, (uint64_t)v397);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)v397);
  std::deque<std::valarray<unsigned char>>::~deque[abi:ne180100]((uint64_t)v398);
LABEL_416:
  std::deque<nms::RectForest<unsigned short,double>>::push_back(&self->_postNMSForests.__map_.__first_, (uint64_t)v396);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)v396);
  v361 = self->_preNMSForests.__map_.__begin_;
  v362 = self->_preNMSForests.__map_.__end_;
  if (v362 == v361)
  {
    p_size = &self->_preNMSForests.__size_;
    v362 = self->_preNMSForests.__map_.__begin_;
    v367 = v391;
  }
  else
  {
    p_size = &self->_preNMSForests.__size_;
    v364 = self->_preNMSForests.__start_;
    v365 = &v361[v364 / 0x14];
    v366 = (unint64_t)v361[(self->_preNMSForests.__size_.__value_ + v364) / 0x14]
         + 200 * ((self->_preNMSForests.__size_.__value_ + v364) % 0x14);
    v367 = v391;
    if ((char *)*v365 + 200 * (v364 % 0x14) != (void *)v366)
    {
      v368 = (void (***)(void))((char *)*v365 + 200 * (v364 % 0x14));
      do
      {
        v369 = *v368;
        v368 += 25;
        (*v369)();
        if ((char *)v368 - (_BYTE *)*v365 == 4000)
        {
          v370 = (void (***)(void))v365[1];
          ++v365;
          v368 = v370;
        }
      }
      while (v368 != (void (***)(void))v366);
      v361 = self->_preNMSForests.__map_.__begin_;
      v362 = self->_preNMSForests.__map_.__end_;
    }
  }
  p_size->__value_ = 0;
  v371 = (char *)v362 - (char *)v361;
  if (v371 >= 0x11)
  {
    do
    {
      operator delete(*v361);
      v372 = self->_preNMSForests.__map_.__end_;
      v361 = self->_preNMSForests.__map_.__begin_ + 1;
      self->_preNMSForests.__map_.__begin_ = v361;
      v371 = (char *)v372 - (char *)v361;
    }
    while (v371 > 0x10);
  }
  if (v371 >> 3 == 1)
  {
    v373 = 10;
LABEL_430:
    self->_preNMSForests.__start_ = v373;
  }
  else if (v371 >> 3 == 2)
  {
    v373 = 20;
    goto LABEL_430;
  }
  -[CRNMS buildTextFeaturesFromRectForest:byEdge:options:](self, "buildTextFeaturesFromRectForest:byEdge:options:", (char *)self->_postNMSForests.__map_.__begin_[self->_postNMSForests.__start_ / 0x14]+ 200 * (self->_postNMSForests.__start_ % 0x14), self->_outputTextFeatureLevel, v367, v387);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v375 = self->_postNMSForests.__map_.__begin_;
  v376 = self->_postNMSForests.__map_.__end_;
  if (v376 == v375)
  {
    v379 = &self->_postNMSForests.__size_;
    v376 = self->_postNMSForests.__map_.__begin_;
  }
  else
  {
    v377 = self->_postNMSForests.__start_;
    v378 = &v375[v377 / 0x14];
    v379 = &self->_postNMSForests.__size_;
    v380 = (unint64_t)v375[(self->_postNMSForests.__size_.__value_ + v377) / 0x14]
         + 200 * ((self->_postNMSForests.__size_.__value_ + v377) % 0x14);
    if ((char *)*v378 + 200 * (v377 % 0x14) != (void *)v380)
    {
      v381 = (void (***)(void))((char *)*v378 + 200 * (v377 % 0x14));
      do
      {
        v382 = *v381;
        v381 += 25;
        (*v382)();
        if ((char *)v381 - (_BYTE *)*v378 == 4000)
        {
          v383 = (void (***)(void))v378[1];
          ++v378;
          v381 = v383;
        }
      }
      while (v381 != (void (***)(void))v380);
      v376 = self->_postNMSForests.__map_.__end_;
      v375 = self->_postNMSForests.__map_.__begin_;
      v367 = v391;
    }
  }
  v379->__value_ = 0;
  v384 = (char *)v376 - (char *)v375;
  if (v384 >= 0x11)
  {
    do
    {
      operator delete(*v375);
      v375 = self->_postNMSForests.__map_.__begin_ + 1;
      self->_postNMSForests.__map_.__begin_ = v375;
      v384 = (char *)self->_postNMSForests.__map_.__end_ - (char *)v375;
    }
    while (v384 > 0x10);
  }
  if (v384 >> 3 == 1)
  {
    v385 = 10;
LABEL_445:
    self->_postNMSForests.__start_ = v385;
  }
  else if (v384 >> 3 == 2)
  {
    v385 = 20;
    goto LABEL_445;
  }

  return v374;
}

- (unint64_t)convertSubTextFeatures:(id)a3 toRects:(void *)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v5;
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          if (*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i))
            ++v8;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }

    std::valarray<double>::resize((uint64_t)a4, 4 * v8, 0.0);
    v24 = v6;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          if (v17)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "bounds");
            *(_QWORD *)(*(_QWORD *)a4 + 32 * v14) = v18;
            objc_msgSend(v17, "bounds");
            v19 = 32 * v14;
            *(_QWORD *)(*(_QWORD *)a4 + ((32 * v14) | 8)) = v20;
            objc_msgSend(v17, "bounds");
            *(_QWORD *)(*(_QWORD *)a4 + (v19 | 0x10)) = v21;
            objc_msgSend(v17, "bounds");
            *(_QWORD *)(*(_QWORD *)a4 + (v19 | 0x18)) = v22;
            ++v14;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v13);
    }

    v6 = v24;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)buildRectForest:(void *)a3 fromTextDetectorQuadFeatures:(const void *)a4 forestFeatureType:(unint64_t)a5 withInputSize:(CGSize)a6 scoreMap:(vImage_Buffer *)a7 andScoreMapScaleFactor:(double)a8 options:(id)a9
{
  return -[CRNMS buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, a4, a5, a7, 0, a9, a6.width, a6.height, a8);
}

- (BOOL)buildRectForest:(void *)a3 fromTextDetectorQuadFeatures:(const void *)a4 forestFeatureType:(unint64_t)a5 withInputSize:(CGSize)a6 scoreMap:(vImage_Buffer *)a7 scoreMapScaleFactor:(double)a8 andTileRects:(id)a9 options:(id)a10
{
  double height;
  double width;
  id v16;
  unint64_t v17;
  const CGPoint *v18;
  void *v19;
  void **v20;
  void *v21;
  vImagePixelCount v22;
  vImagePixelCount v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat x;
  CGFloat y;
  CGFloat v51;
  CGFloat v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  BOOL v58;
  BOOL v59;
  _QWORD *v60;
  _QWORD **v61;
  _QWORD *v62;
  _QWORD *v63;
  unint64_t v64;
  double v65;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  BOOL v70;
  _QWORD *v71;
  unint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  unint64_t v75;
  BOOL v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  BOOL v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  double v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _WORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _WORD *v112;
  _WORD *v113;
  _WORD *v114;
  _QWORD *v115;
  _QWORD *v116;
  double v117;
  _QWORD *v118;
  _QWORD *v119;
  _QWORD *v120;
  _QWORD *v121;
  vImagePixelCount v122;
  id v123;
  unint64_t v124;
  uint64_t v125;
  _QWORD *v127;
  _QWORD *v128;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD *v131;
  _QWORD *v132;
  _QWORD *v133;
  _QWORD *v134;
  _QWORD *v135;
  double v136;
  unint64_t v137;
  uint64_t v138;
  uint64x2_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  BOOL v144;
  uint64_t v145;
  uint64_t v146;
  void *v148;
  void *v149;
  _BYTE *v150;
  _QWORD v151[3];
  void *v152;
  _BYTE *v153;
  uint64_t v154;
  _QWORD v155[3];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  CGAffineTransform v160;
  void *__p;
  vImage_Buffer dest;
  _BYTE v163[128];
  uint64_t v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;

  height = a6.height;
  width = a6.width;
  v164 = *MEMORY[0x1E0C80C00];
  v16 = a9;
  v123 = a10;
  v148 = v16;
  if (v16)
    v144 = (unint64_t)objc_msgSend(v16, "count") > 1;
  else
    v144 = 0;
  v17 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  LOBYTE(dest.data) = 0;
  std::vector<BOOL>::vector(&__p, v17, (unsigned __int8 *)&dest);
  if (!a5)
  {
    *((_QWORD *)a3 + 1) = 0;
    dest.data = 0;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 0, (uint64_t **)&dest)[5] = (uint64_t *)5;
    dest.data = (void *)1;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 1uLL, (uint64_t **)&dest)[5] = (uint64_t *)5;
    dest.data = (void *)2;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 2uLL, (uint64_t **)&dest)[5] = (uint64_t *)9;
    dest.data = (void *)3;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 3uLL, (uint64_t **)&dest)[5] = (uint64_t *)8;
    dest.data = (void *)4;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 4uLL, (uint64_t **)&dest)[5] = (uint64_t *)8;
  }
  if (a7->data)
  {
    v20 = (void **)((char *)a3 + 16);
    v19 = (void *)*((_QWORD *)a3 + 2);
    if (v19)
    {
      free(v19);
      *v20 = 0;
    }
    v21 = malloc_type_calloc(a7->height * a7->width, 1uLL, 0x100004077774924uLL);
    v22 = a7->height;
    v23 = a7->width;
    dest.data = v21;
    dest.height = v22;
    dest.width = v23;
    dest.rowBytes = v23;
    vImageConvert_PlanarFtoPlanar8(a7, &dest, 1.0, 0.0, 0);
    if (a8 == 1.0 || a8 <= 0.0)
    {
      v25 = *(_OWORD *)&dest.width;
      *(_OWORD *)v20 = *(_OWORD *)&dest.data;
      *((_OWORD *)a3 + 2) = v25;
      if (!a5)
        goto LABEL_17;
LABEL_55:
      v59 = 0;
      goto LABEL_56;
    }
    v140 = vcvtq_u64_f64(vrndpq_f64(vmulq_n_f64(vcvtq_f64_u64(*(uint64x2_t *)&a7->height), a8)));
    *((_QWORD *)a3 + 2) = malloc_type_calloc(v140.i64[0] * v140.i64[1], 1uLL, 0x100004077774924uLL);
    *(uint64x2_t *)((char *)a3 + 24) = v140;
    *((_QWORD *)a3 + 5) = v140.i64[1];
    if (vImageScale_Planar8(&dest, (const vImage_Buffer *)((char *)a3 + 16), 0, 0))
    {
      free(*v20);
      v24 = *(_OWORD *)&dest.width;
      *(_OWORD *)v20 = *(_OWORD *)&dest.data;
      *((_OWORD *)a3 + 2) = v24;
    }
    free(dest.data);
  }
  if (a5)
    goto LABEL_55;
LABEL_17:
  v26 = *(_QWORD *)a4;
  if (*((_QWORD *)a4 + 1) == *(_QWORD *)a4)
    goto LABEL_55;
  v129 = a3;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = __p;
  do
  {
    v31 = v26 + 168 * v29;
    v34 = *(_QWORD *)(v31 + 144);
    v32 = (_QWORD *)(v31 + 144);
    v33 = v34;
    v35 = v32 + 1;
    v36 = v32[1];
    v37 = v29 >> 6;
    v38 = 1 << v29;
    if (v34 == v36)
      v39 = v30[v37] & ~v38;
    else
      v39 = v30[v37] | v38;
    v30[v37] = v39;
    v40 = v144;
    if (v33 == v36)
      v40 = 0;
    if (!v40)
    {
      if ((v39 & v38) == 0)
        goto LABEL_45;
LABEL_44:
      v28 -= 0x71C71C71C71C71C7 * ((uint64_t)(*v35 - *v32) >> 4);
      ++v27;
      goto LABEL_45;
    }
    v133 = v32 + 1;
    v135 = v32;
    v137 = v27;
    v141 = v28;
    do
    {
      CRDetectorUtils::convertPointToRect(v33, v18);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      CGAffineTransformMakeScale(&v160, 1.0 / width, 1.0 / height);
      v165.origin.x = v42;
      v165.origin.y = v44;
      v165.size.width = v46;
      v165.size.height = v48;
      v166 = CGRectApplyAffineTransform(v165, &v160);
      x = v166.origin.x;
      y = v166.origin.y;
      v51 = v166.size.width;
      v52 = v166.size.height;
      v156 = 0u;
      v157 = 0u;
      v158 = 0u;
      v159 = 0u;
      v53 = v16;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v157;
        while (2)
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v157 != v55)
              objc_enumerationMutation(v53);
            objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * i), "rectValue");
            v168.origin.x = x;
            v168.origin.y = y;
            v168.size.width = v51;
            v168.size.height = v52;
            if (CGRectContainsRect(v167, v168))
            {
              *((_QWORD *)__p + v37) &= ~v38;
              goto LABEL_36;
            }
          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
          if (v54)
            continue;
          break;
        }
      }
LABEL_36:

      v30 = __p;
      v57 = *((_QWORD *)__p + v37) & v38;
      v33 += 144;
      if (v57)
        v58 = v33 == v36;
      else
        v58 = 1;
    }
    while (!v58);
    v27 = v137;
    v28 = v141;
    v35 = v133;
    v32 = v135;
    if (v57)
      goto LABEL_44;
LABEL_45:
    ++v29;
    v26 = *(_QWORD *)a4;
  }
  while (v29 < 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3));
  v59 = 0;
  if (!v27 || !v28)
    goto LABEL_56;
  v61 = (_QWORD **)(v129 + 23);
  v60 = (_QWORD *)v129[23];
  if (!v60)
  {
    v122 = 0;
    v65 = 0.0;
    v136 = 0.0;
LABEL_98:
    v138 = 0;
    goto LABEL_99;
  }
  v62 = (_QWORD *)v129[23];
  do
  {
    v63 = v62;
    v62 = (_QWORD *)*v62;
  }
  while (v62);
  if (v63 == v61 || v63[4] || (v64 = v63[5], v64 > 8))
    v65 = 0.0;
  else
    v65 = dbl_1D513B3B8[v64];
  v67 = v129 + 23;
  v68 = (_QWORD *)v129[23];
  do
  {
    v69 = v68[4];
    v70 = v69 == 0;
    if (v69)
      v71 = v68;
    else
      v71 = v68 + 1;
    if (!v70)
      v67 = v68;
    v68 = (_QWORD *)*v71;
  }
  while (*v71);
  if (v67 == v61 || v67[4] > 1uLL || (v72 = v67[5], v72 > 8))
    v136 = 0.0;
  else
    v136 = dbl_1D513B3B8[v72];
  v73 = v129 + 23;
  v74 = (_QWORD *)v129[23];
  do
  {
    v75 = v74[4];
    v76 = v75 >= 3;
    if (v75 >= 3)
      v77 = v74;
    else
      v77 = v74 + 1;
    if (v76)
      v73 = v74;
    v74 = (_QWORD *)*v77;
  }
  while (*v77);
  if (v73 == v61 || v73[4] > 3uLL || (v78 = v73[5], v78 > 8))
    v122 = 0;
  else
    v122 = *(_QWORD *)&dbl_1D513B3B8[v78];
  v79 = v129 + 23;
  do
  {
    v80 = v60[4];
    v81 = v80 >= 4;
    if (v80 >= 4)
      v82 = v60;
    else
      v82 = v60 + 1;
    if (v81)
      v79 = v60;
    v60 = (_QWORD *)*v82;
  }
  while (*v82);
  if (v79 == v61 || v79[4] > 4uLL)
    goto LABEL_98;
  switch(v79[5])
  {
    case 0:
    case 1:
      v83 = 4;
      break;
    case 2:
      v83 = 8;
      break;
    case 3:
    case 4:
      v83 = 2;
      break;
    case 5:
      v83 = 5;
      break;
    case 6:
      v83 = 9;
      break;
    case 7:
      v83 = 3;
      break;
    case 8:
      v83 = 14;
      break;
    default:
      goto LABEL_98;
  }
  v138 = v83;
LABEL_99:
  v120 = (_QWORD *)(*(_QWORD *)(v129[11] + ((v129[14] >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v129[14]);
  std::valarray<double>::resize((uint64_t)v120, *(_QWORD *)&v65 * v27, 0.0);
  v132 = (_QWORD *)(*(_QWORD *)(v129[11] + (((unint64_t)(v129[14] + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (*((_BYTE *)v129 + 112) + 1));
  std::valarray<double>::resize((uint64_t)v132, *(_QWORD *)&v136 * v28, 0.0);
  v121 = (_QWORD *)(*(_QWORD *)(v129[11] + (((unint64_t)(v129[14] + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (*((_BYTE *)v129 + 112) + 3));
  std::valarray<double>::resize((uint64_t)v121, v122 * v27, 0.0);
  v134 = (_QWORD *)(*(_QWORD *)(v129[11] + (((unint64_t)(v129[14] + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (*((_BYTE *)v129 + 112) + 4));
  std::valarray<double>::resize((uint64_t)v134, v138 * v28, 0.0);
  v84 = v129[20];
  v85 = *(_QWORD *)(v129[17] + 8 * (v84 / 0x55));
  v86 = v84 % 0x55;
  v118 = (_QWORD *)(v85 + 48 * (v84 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v118, v27);
  v87 = v129[20] + 4;
  v88 = *(_QWORD *)(v129[17] + 8 * (v87 / 0x55));
  v89 = v87 % 0x55;
  v119 = (_QWORD *)(v88 + 48 * (v87 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v119, v27);
  v142 = v86;
  v145 = v85;
  v90 = v65;
  v91 = v129[20] + 5;
  v92 = *(_QWORD *)(v129[17] + 8 * (v91 / 0x55));
  v93 = v91 % 0x55;
  v131 = (_QWORD *)(v92 + 48 * (v91 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v131, v28);
  v94 = v129[20] + 2;
  v95 = *(_QWORD *)(v129[17] + 8 * (v94 / 0x55));
  v96 = v94 % 0x55;
  v130 = (_QWORD *)(v95 + 48 * (v94 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v130, v28);
  v98 = *(_QWORD *)a4;
  v97 = *((_QWORD *)a4 + 1);
  if (v97 != *(_QWORD *)a4)
  {
    v99 = 0;
    v125 = 0;
    v100 = 0;
    v116 = (_QWORD *)(v88 + 48 * v89 + 32);
    v117 = v90;
    v128 = (_QWORD *)(v92 + 48 * v93 + 32);
    v127 = (_QWORD *)(v95 + 48 * v96 + 32);
    v115 = (_QWORD *)(v145 + 48 * v142 + 32);
    v146 = 8 * *(_QWORD *)&v136;
    v143 = 8 * v138;
    do
    {
      if (((*(_QWORD *)((char *)__p + ((v99 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v99) & 1) != 0)
      {
        v101 = v98 + 168 * v99;
        v103 = *(_QWORD *)(v101 + 144);
        v102 = *(_QWORD *)(v101 + 152);
        dest.data = (void *)(*v121 + 8 * v100 * v122);
        dest.height = v122;
        dest.width = 1;
        std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 3uLL);
        -[CRNMS fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:](self, "fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:", &dest, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 3uLL), *(_QWORD *)a4 + 168 * v99, width, height);
        v155[0] = *v120 + 8 * v100 * *(_QWORD *)&v117;
        *(double *)&v155[1] = v117;
        v155[2] = 1;
        std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 0);
        v104 = *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 0);
        std::valarray<double>::valarray(&v152, (uint64_t)&dest);
        -[CRNMS fillRectForestDatum:asDimType:withQuad:andDimType:](self, "fillRectForestDatum:asDimType:withQuad:andDimType:", v155, v104, &v152, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 3uLL));
        if (v152)
        {
          if (v153 != v152)
            v153 += ((_BYTE *)v152 - v153 + 7) & 0xFFFFFFFFFFFFFFF8;
          operator delete(v152);
        }
        v124 = (v102 - v103) / 144;
        v105 = (_WORD *)(*(_QWORD *)(v119[1] + (((unint64_t)(*v116 + v100) >> 7) & 0x1FFFFFFFFFFFFF8))
                       + 4 * ((*v116 + v100) & 0x3FF));
        *v105 = v100;
        v105[1] = v100;
        if (v102 != v103)
        {
          v106 = 0;
          v107 = v125;
          if (v124 <= 1)
            v108 = 1;
          else
            v108 = (v102 - v103) / 144;
          v109 = v146 * v125;
          v110 = v143 * v125;
          do
          {
            v152 = (void *)(*v134 + v110);
            v153 = (_BYTE *)v138;
            v154 = 1;
            std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 4uLL);
            -[CRNMS fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:](self, "fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:", &v152, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 4uLL), *(_QWORD *)(*(_QWORD *)a4 + 168 * v99 + 144) + v106, width, height);
            v151[0] = *v132 + v109;
            *(double *)&v151[1] = v136;
            v151[2] = 1;
            std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 1uLL);
            v111 = *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 1uLL);
            std::valarray<double>::valarray(&v149, (uint64_t)&v152);
            -[CRNMS fillRectForestDatum:asDimType:withQuad:andDimType:](self, "fillRectForestDatum:asDimType:withQuad:andDimType:", v151, v111, &v149, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 4uLL));
            if (v149)
            {
              if (v150 != v149)
                v150 += ((_BYTE *)v149 - v150 + 7) & 0xFFFFFFFFFFFFFFF8;
              operator delete(v149);
            }
            v112 = (_WORD *)(*(_QWORD *)(v131[1] + (((unint64_t)(v107 + *v128) >> 7) & 0x1FFFFFFFFFFFFF8))
                           + 4 * ((v107 + *v128) & 0x3FF));
            *v112 = v107;
            v112[1] = v107;
            v113 = (_WORD *)(*(_QWORD *)(v130[1] + (((unint64_t)(v107 + *v127) >> 7) & 0x1FFFFFFFFFFFFF8))
                           + 4 * ((v107 + *v127) & 0x3FF));
            ++v107;
            *v113 = v100;
            v113[1] = v100;
            v106 += 144;
            v109 += v146;
            v110 += v143;
            --v108;
          }
          while (v108);
        }
        v114 = (_WORD *)(*(_QWORD *)(v118[1] + (((unint64_t)(*v115 + v100) >> 7) & 0x1FFFFFFFFFFFFF8))
                       + 4 * ((*v115 + v100) & 0x3FF));
        *v114 = v125;
        v114[1] = v124 + v125 - 1;
        ++v100;
        v98 = *(_QWORD *)a4;
        v97 = *((_QWORD *)a4 + 1);
        v125 += v124;
      }
      ++v99;
    }
    while (v99 < 0xCF3CF3CF3CF3CF3DLL * ((v97 - v98) >> 3));
  }
  v59 = 1;
LABEL_56:
  if (__p)
    operator delete(__p);

  return v59;
}

- (void)fillTextFeature:(id)a3 withRectDatum:(const void *)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "setBounds:", **(double **)a4, *(double *)(*(_QWORD *)a4 + 8), *(double *)(*(_QWORD *)a4 + 16), *(double *)(*(_QWORD *)a4 + 24));
  objc_msgSend(v23, "bounds");
  v6 = v5;
  objc_msgSend(v23, "bounds");
  objc_msgSend(v23, "setTopLeft:", v6);
  objc_msgSend(v23, "bounds");
  v8 = v7;
  objc_msgSend(v23, "bounds");
  v10 = v9;
  objc_msgSend(v23, "bounds");
  objc_msgSend(v23, "setTopRight:", v8 + v10);
  objc_msgSend(v23, "bounds");
  v12 = v11;
  objc_msgSend(v23, "bounds");
  v14 = v13;
  objc_msgSend(v23, "bounds");
  v16 = v15;
  objc_msgSend(v23, "bounds");
  objc_msgSend(v23, "setBottomRight:", v12 + v14, v16 + v17);
  objc_msgSend(v23, "bounds");
  v19 = v18;
  objc_msgSend(v23, "bounds");
  v21 = v20;
  objc_msgSend(v23, "bounds");
  objc_msgSend(v23, "setBottomLeft:", v19, v21 + v22);

}

- (id)getTextFeatureFromQuadAngleDatum:(const void *)a3
{
  CRTextFeature *v4;
  double v5;

  v4 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:]([CRTextFeature alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", **(double **)a3, *(double *)(*(_QWORD *)a3 + 8), *(double *)(*(_QWORD *)a3 + 16), *(double *)(*(_QWORD *)a3 + 24), *(double *)(*(_QWORD *)a3 + 48), *(double *)(*(_QWORD *)a3 + 56), *(double *)(*(_QWORD *)a3 + 32), *(double *)(*(_QWORD *)a3 + 40));
  v5 = *(double *)(*(_QWORD *)a3 + 72);
  *(float *)&v5 = v5;
  -[CRTextFeature setBaselineAngle:](v4, "setBaselineAngle:", v5);
  -[CRTextFeature setIsCurved:](v4, "setIsCurved:", *(double *)(*(_QWORD *)a3 + 80) != 0.0);
  -[CRTextFeature setFeatureID:](v4, "setFeatureID:", (int)*(double *)(*(_QWORD *)a3 + 104));
  return v4;
}

- (id)buildTextFeaturesFromRectForest:(const void *)a3 byEdge:(unint64_t)a4 options:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  unint64_t v24;
  BOOL v25;
  _QWORD *v26;
  unint64_t v27;
  double v28;
  void *v29;
  unsigned __int16 *v30;
  unint64_t v31;
  _QWORD *v32;
  char *v33;
  unint64_t v34;
  BOOL v35;
  _QWORD *v36;
  unint64_t v37;
  double v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  char *v52;
  unint64_t v53;
  BOOL v54;
  _QWORD *v55;
  unint64_t v56;
  double v57;
  void *v58;
  unsigned __int16 *v59;
  unint64_t v60;
  _QWORD *v61;
  char *v62;
  unint64_t v63;
  BOOL v64;
  _QWORD *v65;
  unint64_t v66;
  double v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  char *v84;
  char *v85;
  unint64_t v86;
  double v87;
  unsigned __int16 *v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  BOOL v93;
  char **v94;
  unint64_t v95;
  double v96;
  void *v97;
  void *v98;
  unsigned __int16 *v99;
  unint64_t v100;
  char *v101;
  char *v102;
  unint64_t v103;
  BOOL v104;
  char **v105;
  unint64_t v106;
  double v107;
  void *v108;
  id v110;
  void *v111;
  unint64_t *v112;
  void *v113;
  id v114;
  _QWORD *v115;
  unint64_t *v116;
  _QWORD *v117;
  void *v118;
  unint64_t *v119;
  void *v120;
  _QWORD *v121;
  void *v122;
  unint64_t v123;
  void *v124;
  _BYTE *v125;
  void *__p;
  _BYTE *v127;
  void *v128;
  _BYTE *v129;
  uint64_t v130;
  unint64_t v131;
  double v132;
  uint64_t v133;

  v110 = a5;
  if (a4 > 5)
  {
    v8 = 5;
    v9 = 5;
  }
  else
  {
    v8 = qword_1D513B338[a4];
    v9 = qword_1D513B368[a4];
  }
  objc_msgSend(v110, "objectForKey:", CFSTR("CRImageReaderTextDetector"), v110);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("CRImageReaderTextDetectorCI"));

  if (v11)
  {
    if ((a4 | 2) == 3)
    {
      v12 = *((_QWORD *)a3 + 20) + a4;
      v13 = *(_QWORD *)(*((_QWORD *)a3 + 17) + 8 * (v12 / 0x55));
      v14 = v12 % 0x55;
      v15 = v13 + 48 * (v12 % 0x55);
      v17 = *(_QWORD *)(v15 + 40);
      v16 = (unint64_t *)(v15 + 40);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
      v114 = (id)objc_claimAutoreleasedReturnValue();
      if (*v16)
      {
        v18 = 0;
        v19 = (char *)a3 + 184;
        v20 = v13 + 48 * v14;
        v121 = (_QWORD *)(v20 + 32);
        v21 = (_QWORD *)(v20 + 8);
        v116 = v16;
        do
        {
          v22 = *(_QWORD **)v19;
          if (!*(_QWORD *)v19)
            goto LABEL_21;
          v23 = (char *)a3 + 184;
          do
          {
            v24 = v22[4];
            v25 = v24 >= v8;
            if (v24 >= v8)
              v26 = v22;
            else
              v26 = v22 + 1;
            if (v25)
              v23 = (char *)v22;
            v22 = (_QWORD *)*v26;
          }
          while (*v26);
          if (v23 == v19 || *((_QWORD *)v23 + 4) > v8 || (v27 = *((_QWORD *)v23 + 5), v27 > 8))
LABEL_21:
            v28 = 0.0;
          else
            v28 = dbl_1D513B3B8[v27];
          v130 = *(_QWORD *)(*((_QWORD *)a3 + 11) + (((*((_QWORD *)a3 + 14) + v8) >> 5) & 0x7FFFFFFFFFFFFF8))
               + 16 * (*((_BYTE *)a3 + 112) + v8);
          v131 = *(_QWORD *)&v28 * v18;
          v132 = v28;
          v133 = 1;
          std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v128, (uint64_t)&v130);
          v118 = (void *)objc_opt_new();
          -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:");
          v29 = (void *)objc_opt_new();
          v30 = (unsigned __int16 *)(*(_QWORD *)(*v21 + (((*v121 + v18) >> 7) & 0x1FFFFFFFFFFFFF8))
                                   + 4 * ((*v121 + v18) & 0x3FF));
          v31 = *v30;
          if (v31 <= v30[1])
          {
            do
            {
              v32 = *(_QWORD **)v19;
              if (!*(_QWORD *)v19)
                goto LABEL_36;
              v33 = (char *)a3 + 184;
              do
              {
                v34 = v32[4];
                v35 = v34 >= v9;
                if (v34 >= v9)
                  v36 = v32;
                else
                  v36 = v32 + 1;
                if (v35)
                  v33 = (char *)v32;
                v32 = (_QWORD *)*v36;
              }
              while (*v36);
              if (v33 == v19 || *((_QWORD *)v33 + 4) > v9 || (v37 = *((_QWORD *)v33 + 5), v37 > 8))
LABEL_36:
                v38 = 0.0;
              else
                v38 = dbl_1D513B3B8[v37];
              v130 = *(_QWORD *)(*((_QWORD *)a3 + 11) + (((*((_QWORD *)a3 + 14) + v9) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (*((_BYTE *)a3 + 112) + v9);
              v131 = *(_QWORD *)&v38 * v31;
              v132 = v38;
              v133 = 1;
              std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&__p, (uint64_t)&v130);
              v39 = (void *)objc_opt_new();
              -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:", v39, &__p);
              objc_msgSend(v29, "addObject:", v39);

              if (__p)
              {
                if (v127 != __p)
                  v127 += ((_BYTE *)__p - v127 + 7) & 0xFFFFFFFFFFFFFFF8;
                operator delete(__p);
              }
              v25 = v31++ >= *(unsigned __int16 *)(*(_QWORD *)(*v21 + (((*v121 + v18) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                 + 4 * ((*v121 + v18) & 0x3FF)
                                                 + 2);
            }
            while (!v25);
          }
          objc_msgSend(v118, "setSubFeatures:", v29);
          objc_msgSend(v114, "addObject:", v118);

          if (v128)
          {
            if (v129 != v128)
              v129 += ((_BYTE *)v128 - v129 + 7) & 0xFFFFFFFFFFFFFFF8;
            operator delete(v128);
          }
          ++v18;
        }
        while (v18 < *v116);
      }
    }
    else
    {
      v69 = *((_QWORD *)a3 + 20);
      v70 = *((_QWORD *)a3 + 17);
      v71 = *(_QWORD *)(v70 + 8 * (v69 / 0x55));
      v72 = v69 % 0x55;
      v73 = v69 + 1;
      v74 = (v69 + 1) / 0x55;
      v75 = *(_QWORD *)(v70 + 8 * v74);
      v76 = v71 + 48 * (v69 % 0x55);
      v78 = *(_QWORD *)(v76 + 40);
      v77 = (unint64_t *)(v76 + 40);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v78);
      v114 = (id)objc_claimAutoreleasedReturnValue();
      if (*v77)
      {
        v112 = v77;
        v123 = 0;
        v79 = (char *)a3 + 184;
        v80 = v71 + 48 * v72;
        v115 = (_QWORD *)(v80 + 8);
        v117 = (_QWORD *)(v80 + 32);
        v81 = v75 + 48 * (v73 - 85 * v74);
        v82 = (_QWORD *)(v81 + 32);
        v83 = (_QWORD *)(v81 + 8);
        do
        {
          v84 = *(char **)v79;
          if (!*(_QWORD *)v79)
            goto LABEL_100;
          do
          {
            v85 = v84;
            v84 = *(char **)v84;
          }
          while (v84);
          if (v85 == v79 || *((_QWORD *)v85 + 4) || (v86 = *((_QWORD *)v85 + 5), v86 > 8))
LABEL_100:
            v87 = 0.0;
          else
            v87 = dbl_1D513B3B8[v86];
          v130 = *(_QWORD *)(*((_QWORD *)a3 + 11) + ((*((_QWORD *)a3 + 14) >> 5) & 0x7FFFFFFFFFFFFF8))
               + 16 * *((_QWORD *)a3 + 14);
          v131 = *(_QWORD *)&v87 * v123;
          v132 = v87;
          v133 = 1;
          std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v128, (uint64_t)&v130);
          v113 = (void *)objc_opt_new();
          -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:");
          v120 = (void *)objc_opt_new();
          v88 = (unsigned __int16 *)(*(_QWORD *)(*v115 + (((*v117 + v123) >> 7) & 0x1FFFFFFFFFFFFF8))
                                   + 4 * ((*v117 + v123) & 0x3FF));
          v89 = *v88;
          if (v89 <= v88[1])
          {
            do
            {
              v90 = *(char **)v79;
              if (!*(_QWORD *)v79)
                goto LABEL_114;
              v91 = (char *)a3 + 184;
              do
              {
                v92 = *((_QWORD *)v90 + 4);
                v93 = v92 == 0;
                if (v92)
                  v94 = (char **)v90;
                else
                  v94 = (char **)(v90 + 8);
                if (!v93)
                  v91 = v90;
                v90 = *v94;
              }
              while (*v94);
              if (v91 == v79 || *((_QWORD *)v91 + 4) > 1uLL || (v95 = *((_QWORD *)v91 + 5), v95 > 8))
LABEL_114:
                v96 = 0.0;
              else
                v96 = dbl_1D513B3B8[v95];
              v130 = *(_QWORD *)(*((_QWORD *)a3 + 11)
                               + (((unint64_t)(*((_QWORD *)a3 + 14) + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (*((_BYTE *)a3 + 112) + 1);
              v131 = *(_QWORD *)&v96 * v89;
              v132 = v96;
              v133 = 1;
              std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&__p, (uint64_t)&v130);
              v97 = (void *)objc_opt_new();
              -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:", v97, &__p);
              v98 = (void *)objc_opt_new();
              v99 = (unsigned __int16 *)(*(_QWORD *)(*v83 + (((*v82 + v89) >> 7) & 0x1FFFFFFFFFFFFF8))
                                       + 4 * ((*v82 + v89) & 0x3FF));
              v100 = *v99;
              if (v100 <= v99[1])
              {
                do
                {
                  v101 = *(char **)v79;
                  if (!*(_QWORD *)v79)
                    goto LABEL_129;
                  v102 = (char *)a3 + 184;
                  do
                  {
                    v103 = *((_QWORD *)v101 + 4);
                    v104 = v103 >= 2;
                    if (v103 >= 2)
                      v105 = (char **)v101;
                    else
                      v105 = (char **)(v101 + 8);
                    if (v104)
                      v102 = v101;
                    v101 = *v105;
                  }
                  while (*v105);
                  if (v102 == v79 || *((_QWORD *)v102 + 4) > 2uLL || (v106 = *((_QWORD *)v102 + 5), v106 > 8))
LABEL_129:
                    v107 = 0.0;
                  else
                    v107 = dbl_1D513B3B8[v106];
                  v130 = *(_QWORD *)(*((_QWORD *)a3 + 11)
                                   + (((unint64_t)(*((_QWORD *)a3 + 14) + 2) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*((_BYTE *)a3 + 112) + 2);
                  v131 = *(_QWORD *)&v107 * v100;
                  v132 = v107;
                  v133 = 1;
                  std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v124, (uint64_t)&v130);
                  v108 = (void *)objc_opt_new();
                  -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:", v108, &v124);
                  objc_msgSend(v98, "addObject:", v108);

                  if (v124)
                  {
                    if (v125 != v124)
                      v125 += ((_BYTE *)v124 - v125 + 7) & 0xFFFFFFFFFFFFFFF8;
                    operator delete(v124);
                  }
                  v25 = v100++ >= *(unsigned __int16 *)(*(_QWORD *)(*v83 + (((*v82 + v89) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                      + 4 * ((*v82 + v89) & 0x3FF)
                                                      + 2);
                }
                while (!v25);
              }
              objc_msgSend(v97, "setSubFeatures:", v98);
              objc_msgSend(v120, "addObject:", v97);

              if (__p)
              {
                if (v127 != __p)
                  v127 += ((_BYTE *)__p - v127 + 7) & 0xFFFFFFFFFFFFFFF8;
                operator delete(__p);
              }
              v25 = v89++ >= *(unsigned __int16 *)(*(_QWORD *)(*v115 + (((*v117 + v123) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                 + 4 * ((*v117 + v123) & 0x3FF)
                                                 + 2);
            }
            while (!v25);
          }
          objc_msgSend(v113, "setSubFeatures:", v120);
          objc_msgSend(v114, "addObject:", v113);

          if (v128)
          {
            if (v129 != v128)
              v129 += ((_BYTE *)v128 - v129 + 7) & 0xFFFFFFFFFFFFFFF8;
            operator delete(v128);
          }
          ++v123;
        }
        while (v123 < *v112);
      }
    }
  }
  else
  {
    v40 = *((_QWORD *)a3 + 20);
    v41 = *(_QWORD *)(*((_QWORD *)a3 + 17) + 8 * (v40 / 0x55));
    v42 = v40 % 0x55;
    v43 = v41 + 48 * (v40 % 0x55);
    v45 = *(_QWORD *)(v43 + 40);
    v44 = (unint64_t *)(v43 + 40);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v45);
    v114 = (id)objc_claimAutoreleasedReturnValue();
    if (*v44)
    {
      v46 = 0;
      v47 = (char *)a3 + 184;
      v48 = v41 + 48 * v42;
      v49 = (_QWORD *)(v48 + 32);
      v50 = (_QWORD *)(v48 + 8);
      v119 = v44;
      do
      {
        v51 = *(_QWORD **)v47;
        if (!*(_QWORD *)v47)
          goto LABEL_64;
        v52 = (char *)a3 + 184;
        do
        {
          v53 = v51[4];
          v54 = v53 >= 3;
          if (v53 >= 3)
            v55 = v51;
          else
            v55 = v51 + 1;
          if (v54)
            v52 = (char *)v51;
          v51 = (_QWORD *)*v55;
        }
        while (*v55);
        if (v52 == v47 || *((_QWORD *)v52 + 4) > 3uLL || (v56 = *((_QWORD *)v52 + 5), v56 > 8))
LABEL_64:
          v57 = 0.0;
        else
          v57 = dbl_1D513B3B8[v56];
        v130 = *(_QWORD *)(*((_QWORD *)a3 + 11)
                         + (((unint64_t)(*((_QWORD *)a3 + 14) + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
             + 16 * (*((_BYTE *)a3 + 112) + 3);
        v131 = *(_QWORD *)&v57 * v46;
        v132 = v57;
        v133 = 1;
        std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v128, (uint64_t)&v130);
        -[CRNMS getTextFeatureFromQuadAngleDatum:](self, "getTextFeatureFromQuadAngleDatum:", &v128);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_opt_new();
        v59 = (unsigned __int16 *)(*(_QWORD *)(*v50 + (((*v49 + v46) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((*v49 + v46) & 0x3FF));
        v60 = *v59;
        if (v60 <= v59[1])
        {
          do
          {
            v61 = *(_QWORD **)v47;
            if (!*(_QWORD *)v47)
              goto LABEL_79;
            v62 = (char *)a3 + 184;
            do
            {
              v63 = v61[4];
              v64 = v63 >= 4;
              if (v63 >= 4)
                v65 = v61;
              else
                v65 = v61 + 1;
              if (v64)
                v62 = (char *)v61;
              v61 = (_QWORD *)*v65;
            }
            while (*v65);
            if (v62 == v47 || *((_QWORD *)v62 + 4) > 4uLL || (v66 = *((_QWORD *)v62 + 5), v66 > 8))
LABEL_79:
              v67 = 0.0;
            else
              v67 = dbl_1D513B3B8[v66];
            v130 = *(_QWORD *)(*((_QWORD *)a3 + 11)
                             + (((unint64_t)(*((_QWORD *)a3 + 14) + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (*((_BYTE *)a3 + 112) + 4);
            v131 = *(_QWORD *)&v67 * v60;
            v132 = v67;
            v133 = 1;
            std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&__p, (uint64_t)&v130);
            -[CRNMS getTextFeatureFromQuadAngleDatum:](self, "getTextFeatureFromQuadAngleDatum:", &__p);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "addObject:", v68);

            if (__p)
            {
              if (v127 != __p)
                v127 += ((_BYTE *)__p - v127 + 7) & 0xFFFFFFFFFFFFFFF8;
              operator delete(__p);
            }
            v25 = v60++ >= *(unsigned __int16 *)(*(_QWORD *)(*v50 + (((*v49 + v46) >> 7) & 0x1FFFFFFFFFFFFF8))
                                               + 4 * ((*v49 + v46) & 0x3FF)
                                               + 2);
          }
          while (!v25);
        }
        objc_msgSend(v122, "setSubFeatures:", v58);
        objc_msgSend(v114, "addObject:", v122);

        if (v128)
        {
          if (v129 != v128)
            v129 += ((_BYTE *)v128 - v129 + 7) & 0xFFFFFFFFFFFFFFF8;
          operator delete(v128);
        }
        ++v46;
      }
      while (v46 < *v119);
    }
  }

  return v114;
}

- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withCGRect:(const CGRect *)a5
{
  CGFloat *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  CGFloat *v14;
  uint64_t v15;
  CGFloat *v16;
  uint64_t v17;

  v16 = 0;
  v17 = 0;
  std::valarray<double>::resize((uint64_t)&v16, 4uLL, 0.0);
  if (a4 == 5)
    std::valarray<double>::resize((uint64_t)&v16, 5uLL, 0.0);
  v8 = v16;
  v9 = v17;
  *v16 = a5->origin.x;
  v8[1] = a5->origin.y;
  v8[2] = a5->size.width;
  v8[3] = a5->size.height;
  v10 = v9 - (_QWORD)v8;
  if (v10)
  {
    v11 = v10 >> 3;
    v12 = *(_QWORD **)a3;
    if (v11 <= 1)
      v11 = 1;
    v13 = 8 * *((_QWORD *)a3 + 2);
    v14 = v8;
    do
    {
      v15 = *(_QWORD *)v14++;
      *v12 = v15;
      v12 = (_QWORD *)((char *)v12 + v13);
      --v11;
    }
    while (v11);
  }
  operator delete(v8);
}

- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withQuad:(const void *)a5 andDimType:(unint64_t)a6
{
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  char *v17;
  uint64_t *v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *__p;
  char *v25;
  uint64_t *v26;
  _QWORD *v27;
  float64x2_t v28[2];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = 0;
  if (a4)
  {
    if (a4 != 5)
      return;
    std::valarray<double>::resize((uint64_t)&v26, 5uLL, 0.0);
    if (a6 == 8 || a6 == 6)
      v26[4] = *(_QWORD *)(*(_QWORD *)a5 + 64);
  }
  else
  {
    std::valarray<double>::resize((uint64_t)&v26, 4uLL, 0.0);
  }
  v9 = *(float64x2_t *)*(_QWORD *)a5;
  v10 = *(float64x2_t *)(*(_QWORD *)a5 + 16);
  v11 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v9, v10), (int8x16_t)v10, (int8x16_t)v9);
  v12 = *(float64x2_t *)(*(_QWORD *)a5 + 32);
  v13 = *(float64x2_t *)(*(_QWORD *)a5 + 48);
  v14 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v11, v12), (int8x16_t)v12, (int8x16_t)v11);
  v15 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v10, v9), (int8x16_t)v10, (int8x16_t)v9);
  v16 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v12, v15), (int8x16_t)v12, (int8x16_t)v15);
  v28[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v13), (int8x16_t)v13, (int8x16_t)v14);
  v28[1] = vsubq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v16), (int8x16_t)v13, (int8x16_t)v16), v28[0]);
  std::valarray<double>::valarray(&__p, (uint64_t *)v28, 4uLL);
  v17 = (char *)__p;
  v18 = v26;
  *v26 = *(_QWORD *)__p;
  v18[1] = *((_QWORD *)v17 + 1);
  v18[2] = *((_QWORD *)v17 + 2);
  v18[3] = *((_QWORD *)v17 + 3);
  if (v25 != v17)
    v25 += (v17 - v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  operator delete(v17);
  if (v27 != v18)
  {
    v19 = v27 - v18;
    v20 = *(_QWORD **)a3;
    if (v19 <= 1)
      v19 = 1;
    v21 = 8 * *((_QWORD *)a3 + 2);
    v22 = v18;
    do
    {
      v23 = *v22++;
      *v20 = v23;
      v20 = (_QWORD *)((char *)v20 + v21);
      --v19;
    }
    while (v19);
  }
  operator delete(v18);
}

- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withCRTextDetectorQuad:(const void *)a5 andInputSize:(CGSize)a6
{
  double height;
  double width;
  double *v10;
  double v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  void *__p;
  double *v18;

  height = a6.height;
  width = a6.width;
  __p = 0;
  v18 = 0;
  if (a4 == 2)
  {
    std::valarray<double>::resize((uint64_t)&__p, 8uLL, 0.0);
    v10 = (double *)__p;
  }
  else
  {
    if (a4 == 6)
    {
      std::valarray<double>::resize((uint64_t)&__p, 9uLL, 0.0);
      v10 = (double *)__p;
    }
    else
    {
      if (a4 != 8)
        return;
      std::valarray<double>::resize((uint64_t)&__p, 0xEuLL, 0.0);
      v10 = (double *)__p;
      *((_QWORD *)__p + 9) = *((_QWORD *)a5 + 13);
      v11 = 1.0;
      if (!*((_BYTE *)a5 + 136))
        v11 = 0.0;
      v10[10] = v11;
      v10[11] = *((double *)a5 + 15);
      v10[12] = *((double *)a5 + 16);
      v10[13] = (double)*((int *)a5 + 35);
    }
    v10[8] = *((double *)a5 + 14);
  }
  *v10 = *(double *)a5 / width;
  v10[1] = *((double *)a5 + 1) / height;
  v10[2] = *((double *)a5 + 2) / width;
  v10[3] = *((double *)a5 + 3) / height;
  v10[4] = *((double *)a5 + 4) / width;
  v10[5] = *((double *)a5 + 5) / height;
  v10[6] = *((double *)a5 + 6) / width;
  v10[7] = *((double *)a5 + 7) / height;
  if (v18 != v10)
  {
    v12 = v18 - v10;
    v13 = *(_QWORD **)a3;
    if (v12 <= 1)
      v12 = 1;
    v14 = 8 * *((_QWORD *)a3 + 2);
    v15 = v10;
    do
    {
      v16 = *(_QWORD *)v15++;
      *v13 = v16;
      v13 = (_QWORD *)((char *)v13 + v14);
      --v12;
    }
    while (v12);
  }
  operator delete(v10);
}

- (void).cxx_destruct
{
  std::deque<nms::RectForest<unsigned short,double>>::~deque[abi:ne180100]((uint64_t)&self->_postNMSForests);
  nms::PyramidNMS<unsigned short,double,unsigned char>::~PyramidNMS(&self->_pyrNMS._vptr$PyramidNMS);
  std::deque<nms::RectForest<unsigned short,double>>::~deque[abi:ne180100]((uint64_t)&self->_preNMSForests);
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_preNMSForests.__start_ = 0u;
  *(_OWORD *)&self->_preNMSForests.__map_.__end_ = 0u;
  *(_OWORD *)&self->_preNMSForests.__map_.__first_ = 0u;
  nms::PyramidNMS<unsigned short,double,unsigned char>::PyramidNMS(&self->_pyrNMS._vptr$PyramidNMS);
  *(_OWORD *)&self->_postNMSForests.__map_.__end_ = 0u;
  *(_OWORD *)&self->_postNMSForests.__start_ = 0u;
  *(_OWORD *)&self->_postNMSForests.__map_.__first_ = 0u;
  return self;
}

@end
