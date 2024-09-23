@implementation PRSDirectivesManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = (void *)sLocalRSFeatureNameToBundleFeatureMappings;
    sLocalRSFeatureNameToBundleFeatureMappings = (uint64_t)&unk_1E6E9B858;

  }
}

- (PRSDirectivesManager)init
{
  if (init_onceToken_0 != -1)
    dispatch_once(&init_onceToken_0, &__block_literal_global_145);
  return self;
}

void __28__PRSDirectivesManager_init__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)featuresInOrder;
  featuresInOrder = v0;

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  _id_mapping *directive_id_mapping;
  char *var3;
  __CFDictionary *var0;
  uint64_t v8;
  uint64_t v9;
  _resultset_id_mapping *directive_resultset_id_mapping;
  char *v11;
  __CFDictionary *v12;
  float *var4;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _resultset_id_score_mapping *directive_resultset_id_score_mapping;
  char *v18;
  __CFDictionary *v19;
  __CFDictionary *v20;
  float *var5;
  int indexOfQuantize;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __CFDictionary *mapping;
  __CFDictionary *v27;
  float *score_vector;
  float *v29;
  unint64_t *PRSRankingBundleFeatureOrder;
  objc_super v31;

  if (self->indexOfIdMapping >= 1)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      directive_id_mapping = self->directive_id_mapping;
      var3 = directive_id_mapping[v3].var3;
      if (var3)
      {
        free(var3);
        self->directive_id_mapping[v3].var3 = 0;
        directive_id_mapping = self->directive_id_mapping;
      }
      var0 = directive_id_mapping[v3].var2.var0;
      if (var0)
      {
        CFRelease(var0);
        self->directive_id_mapping[v3].var2.var0 = 0;
      }
      ++v4;
      ++v3;
    }
    while (v4 < self->indexOfIdMapping);
  }
  if (self->indexOfResultSetIdMapping >= 1)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      directive_resultset_id_mapping = self->directive_resultset_id_mapping;
      v11 = directive_resultset_id_mapping[v8].var3;
      if (v11)
      {
        free(v11);
        self->directive_resultset_id_mapping[v8].var3 = 0;
        directive_resultset_id_mapping = self->directive_resultset_id_mapping;
      }
      v12 = directive_resultset_id_mapping[v8].var2.var0;
      if (v12)
      {
        CFRelease(v12);
        self->directive_resultset_id_mapping[v8].var2.var0 = 0;
        directive_resultset_id_mapping = self->directive_resultset_id_mapping;
      }
      var4 = directive_resultset_id_mapping[v8].var4;
      if (var4)
      {
        free(var4);
        self->directive_resultset_id_mapping[v8].var4 = 0;
      }
      ++v9;
      ++v8;
    }
    while (v9 < self->indexOfResultSetIdMapping);
  }
  if (self->indexOfResultSetIdScoreMapping >= 1)
  {
    v14 = 0;
    v15 = 0;
    v16 = 40;
    do
    {
      directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      v18 = directive_resultset_id_score_mapping[v14].var4;
      if (v18)
      {
        free(v18);
        *(unint64_t *)((char *)&self->directive_resultset_id_mapping->var0 + v16) = 0;
        directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      }
      v19 = directive_resultset_id_score_mapping[v14].var2.var0;
      if (v19)
      {
        CFRelease(v19);
        self->directive_resultset_id_score_mapping[v14].var2.var0 = 0;
        directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      }
      v20 = directive_resultset_id_score_mapping[v14].var3;
      if (v20)
      {
        CFRelease(v20);
        self->directive_resultset_id_score_mapping[v14].var3 = 0;
        directive_resultset_id_score_mapping = self->directive_resultset_id_score_mapping;
      }
      var5 = directive_resultset_id_score_mapping[v14].var5;
      if (var5)
      {
        free(var5);
        self->directive_resultset_id_score_mapping[v14].var5 = 0;
      }
      ++v15;
      ++v14;
      v16 += 56;
    }
    while (v15 < self->indexOfResultSetIdScoreMapping);
  }
  indexOfQuantize = self->indexOfQuantize;
  if (indexOfQuantize >= 1)
  {
    v23 = 0;
    v24 = 16;
    do
    {
      v25 = *(void **)((char *)&self->directive_quantize->var0 + v24);
      if (v25)
      {
        free(v25);
        *(unint64_t *)((char *)&self->directive_quantize->var0 + v24) = 0;
        indexOfQuantize = self->indexOfQuantize;
      }
      ++v23;
      v24 += 32;
    }
    while (v23 < indexOfQuantize);
  }
  mapping = self->directive_local_resultset_id_values_mapping.mapping;
  if (mapping)
    CFRelease(mapping);
  v27 = self->directive_parsec_resultset_id_values_mapping.mapping;
  if (v27)
    CFRelease(v27);
  score_vector = self->directive_local_resultset_id_values_mapping.score_vector;
  if (score_vector)
    free(score_vector);
  v29 = self->directive_parsec_resultset_id_values_mapping.score_vector;
  if (v29)
    free(v29);
  PRSRankingBundleFeatureOrder = self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder;
  if (PRSRankingBundleFeatureOrder)
    free(PRSRankingBundleFeatureOrder);
  free(self->directive_replace_if);
  free(self->directive_as_is);
  free(self->directive_as_is_range);
  free(self->directive_id_mapping);
  free(self->directive_is_populated);
  free(self->directive_replace_then_min);
  free(self->directive_value_if_not_exist);
  free(self->directive_resultset_id_mapping);
  free(self->directive_resultset_id_score_mapping);
  free(self->directive_quantize);
  v31.receiver = self;
  v31.super_class = (Class)PRSDirectivesManager;
  -[PRSDirectivesManager dealloc](&v31, sel_dealloc);
}

- (unint64_t)getDirectiveTypeFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = getDirectiveTypeFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&getDirectiveTypeFromString__onceToken, &__block_literal_global_147);
  objc_msgSend((id)directiveStringToEnumMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

void __51__PRSDirectivesManager_getDirectiveTypeFromString___block_invoke()
{
  void *v0;

  v0 = (void *)directiveStringToEnumMapping;
  directiveStringToEnumMapping = (uint64_t)&unk_1E6E9B880;

}

- (void)getAllDirectivesArraysForTesting:(void *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _quantize *directive_quantize;

  v3 = *(_OWORD *)&self->directive_replace_if;
  v4 = *(_OWORD *)&self->directive_value_if_not_exist;
  v5 = *(_OWORD *)&self->directive_id_mapping;
  v6 = *(_OWORD *)&self->directive_resultset_id_score_mapping;
  directive_quantize = self->directive_quantize;
  *(_OWORD *)a3 = *(_OWORD *)&self->directive_as_is;
  *((_OWORD *)a3 + 1) = v3;
  *((_OWORD *)a3 + 2) = v4;
  *((_OWORD *)a3 + 3) = v5;
  *((_OWORD *)a3 + 4) = v6;
  *((_QWORD *)a3 + 10) = directive_quantize;
}

- (void)processDirectives:(id)a3
{
  id v4;
  NSMutableIndexSet *disabledFeatureIndices;
  NSMutableDictionary *v6;
  NSMutableDictionary *mapInflatedIndexToSize;
  id v8;
  uint64_t v9;
  __objc2_class_ro **p_info;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v18;
  char v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  BOOL v28;
  void *v29;
  unsigned int sizeOfAsIs;
  int indexOfAsIs;
  _as_is *directive_as_is;
  unsigned int v33;
  unsigned int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int sizeOfAsIsRange;
  unsigned int v44;
  unsigned int v45;
  int v46;
  void *v47;
  unint64_t v48;
  int indexOfAsIsRange;
  unsigned int sizeOfReplaceIf;
  int indexOfReplaceIf;
  _replace_if *directive_replace_if;
  unsigned int v53;
  unsigned int v54;
  int v55;
  unsigned int sizeOfReplaceThenMin;
  int indexOfReplaceThenMin;
  _replace_then_min *directive_replace_then_min;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int sizeOfValueIfNotExist;
  int indexOfValueIfNotExist;
  _value_if_not_exist *directive_value_if_not_exist;
  unsigned int v65;
  unsigned int v66;
  int v67;
  unsigned int sizeOfIsPopulated;
  int indexOfIsPopulated;
  _is_populated *directive_is_populated;
  unsigned int v71;
  unsigned int v72;
  int v73;
  uint64_t v74;
  _is_populated *v75;
  int v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  float v89;
  unsigned int sizeOfIdMapping;
  int indexOfIdMapping;
  unsigned int v92;
  unsigned int v93;
  int v94;
  uint64_t v95;
  id v96;
  const char *v97;
  char *v98;
  uint64_t v99;
  _id_mapping *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int sizeOfResultSetIdMapping;
  int indexOfResultSetIdMapping;
  unsigned int v113;
  unsigned int v114;
  int v115;
  uint64_t v116;
  id v117;
  const char *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned int sizeOfResultSetIdScoreMapping;
  int indexOfResultSetIdScoreMapping;
  unsigned int v131;
  unsigned int v132;
  int v133;
  uint64_t v134;
  id v135;
  const char *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  unsigned int sizeOfOneSidedInverse;
  int indexOfOneSidedInverse;
  _one_sided_inverse *directive_one_sided_inverse;
  unsigned int v151;
  unsigned int v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  unsigned int sizeOfQuantize;
  unsigned int v157;
  unsigned int v158;
  int v159;
  void *v160;
  void *v161;
  unint64_t v162;
  unint64_t v163;
  void *v164;
  float v165;
  unint64_t v166;
  uint64_t indexOfQuantize;
  void *v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  NSMutableDictionary *v175;
  void *v176;
  void *v177;
  unint64_t v178;
  void *v179;
  unint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  id *v187;
  void *v188;
  unint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  NSMutableDictionary *v195;
  void *v196;
  void *v197;
  unint64_t v198;
  void *v199;
  unint64_t v200;
  void *v201;
  void *v202;
  int v203;
  id *v204;
  float *v205;
  unsigned int sizeOfFanOutValue;
  int indexOfFanOutValue;
  fan_out_value *directive_fan_out;
  unsigned int v209;
  unsigned int v210;
  int v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  _replace_if *v215;
  int v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  int v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  float v226;
  void *v227;
  float v228;
  uint64_t v229;
  PRSDirectivesManager *v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  int v234;
  int v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  float v241;
  void *v242;
  float v243;
  int v244;
  float v245;
  int v246;
  int v247;
  float v248;
  void *v249;
  void *v250;
  void *v251;
  __CFDictionary *v252;
  NSMutableDictionary *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  NSMutableDictionary *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  __CFDictionary *v265;
  void *v266;
  void *v267;
  void *v268;
  __CFDictionary *v269;
  uint64_t v270;
  NSMutableDictionary *v271;
  void *v272;
  void *v273;
  uint64_t v274;
  void *v275;
  void *v276;
  id v277;
  NSMutableIndexSet *v278;
  NSMutableIndexSet *v279;
  id v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t i;
  uint64_t v285;
  void *v286;
  __CFDictionary *v287;
  __CFDictionary *v288;
  void *v289;
  void *v290;
  uint64_t v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  unint64_t v296;
  unint64_t v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id obj;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  void *v315;
  void *v316;
  id v317;
  id v318;
  id v319;
  PRSDirectivesManager *v320;
  void *v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  _BYTE v354[128];
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  _BYTE v358[128];
  _BYTE v359[128];
  _BYTE v360[128];
  void *v361;
  _BYTE v362[128];
  uint64_t v363;

  v363 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  disabledFeatureIndices = self->disabledFeatureIndices;
  self->disabledFeatureIndices = 0;

  v6 = (NSMutableDictionary *)objc_opt_new();
  mapInflatedIndexToSize = self->mapInflatedIndexToSize;
  self->mapInflatedIndexToSize = v6;

  v352 = 0u;
  v353 = 0u;
  v350 = 0u;
  v351 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v350, v362, 16);
  p_info = &OBJC_METACLASS___PRSL2FeatureVectorProcessingContext.info;
  if (!v9)
  {
    v290 = 0;
    goto LABEL_184;
  }
  v11 = v9;
  v290 = 0;
  obj = v8;
  v312 = *(_QWORD *)v351;
  v320 = self;
  do
  {
    v12 = 0;
    v291 = v11;
    do
    {
      if (*(_QWORD *)v351 != v312)
        objc_enumerationMutation(obj);
      v313 = v12;
      v13 = *(void **)(*((_QWORD *)&v350 + 1) + 8 * v12);
      objc_msgSend(v13, "objectForKey:", CFSTR("names"));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
        v17 = 1;
      else
        v17 = v15 == 0;
      if (v17)
      {
        v316 = (void *)v14;
LABEL_12:
        v18 = 0;
        goto LABEL_18;
      }
      v19 = objc_msgSend(v15, "isEqualToString:", CFSTR("output"));
      if ((v19 & 1) != 0)
      {
        v18 = 1;
      }
      else
      {
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("model_weights")) & 1) == 0)
        {
          v361 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v361, 1);
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        v18 = 0;
      }
      v316 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:
      objc_msgSend(v13, "objectForKey:", CFSTR("type"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v315 = v16;
      v317 = (id)-[__objc2_class_ro count](p_info[481], "count");
      if (v18)
      {
        if (v20)
          -[PRSDirectivesManager getDirectiveTypeFromString:](self, "getDirectiveTypeFromString:", v20);
        v21 = 0x7FFFFFFFLL;
        v22 = v316;
      }
      else
      {
        v23 = -[__objc2_class_ro count](p_info[481], "count");
        v21 = cumulativeInflatedFeaturesCount + v23;
        v22 = v316;
        -[__objc2_class_ro addObjectsFromArray:](p_info[481], "addObjectsFromArray:", v316);
      }
      objc_msgSend(v13, "objectForKey:", CFSTR("excluded_values"));
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("values"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("value"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v27 = v26;
      if (v26)
        v28 = 1;
      else
        v28 = v25 == 0;
      v321 = v26;
      if (!v28)
        v27 = v25;
      v29 = v315;
      if (v20)
      {
        switch(-[PRSDirectivesManager getDirectiveTypeFromString:](self, "getDirectiveTypeFromString:", v20))
        {
          case 0uLL:
            sizeOfAsIs = self->sizeOfAsIs;
            indexOfAsIs = self->indexOfAsIs;
            directive_as_is = self->directive_as_is;
            if (sizeOfAsIs == indexOfAsIs)
            {
              v33 = sizeOfAsIs | (sizeOfAsIs >> 1) | ((sizeOfAsIs | (sizeOfAsIs >> 1)) >> 2);
              v34 = v33 | (v33 >> 4) | ((v33 | (v33 >> 4)) >> 8);
              v35 = (v34 | HIWORD(v34)) + 1;
              self->sizeOfAsIs = v35;
              directive_as_is = (_as_is *)malloc_type_realloc(directive_as_is, 16 * v35, 0x1000040451B5BE8uLL);
              self->directive_as_is = directive_as_is;
              indexOfAsIs = self->indexOfAsIs;
            }
            v36 = v313;
            directive_as_is[indexOfAsIs].var0 = v21;
            v37 = objc_msgSend(v22, "count");
            v38 = self->indexOfAsIs;
            self->directive_as_is[v38].var1 = v37 + v21;
            self->indexOfAsIs = v38 + 1;
            break;
          case 1uLL:
            v300 = v25;
            v42 = v20;
            sizeOfAsIsRange = self->sizeOfAsIsRange;
            if (sizeOfAsIsRange == self->indexOfAsIsRange)
            {
              v44 = sizeOfAsIsRange | (sizeOfAsIsRange >> 1) | ((sizeOfAsIsRange | (sizeOfAsIsRange >> 1)) >> 2);
              v45 = v44 | (v44 >> 4) | ((v44 | (v44 >> 4)) >> 8);
              v46 = (v45 | HIWORD(v45)) + 1;
              self->sizeOfAsIsRange = v46;
              self->directive_as_is_range = (_as_is_range *)malloc_type_realloc(self->directive_as_is_range, 24 * v46, 0x1000040504FFAC1uLL);
            }
            objc_msgSend(v27, "objectForKey:", CFSTR("count"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            self->directive_as_is_range[self->indexOfAsIsRange].var0 = v21;
            v22 = v316;
            self->directive_as_is_range[self->indexOfAsIsRange].var1 = objc_msgSend(v316, "count") + v21;
            v48 = objc_msgSend(v47, "integerValue");
            indexOfAsIsRange = self->indexOfAsIsRange;
            self->directive_as_is_range[indexOfAsIsRange].var2 = v48;
            self->indexOfAsIsRange = indexOfAsIsRange + 1;

            v36 = v313;
            v20 = v42;
            v25 = v300;
            break;
          case 2uLL:
            sizeOfReplaceIf = self->sizeOfReplaceIf;
            indexOfReplaceIf = self->indexOfReplaceIf;
            directive_replace_if = self->directive_replace_if;
            if (sizeOfReplaceIf == indexOfReplaceIf)
            {
              v53 = sizeOfReplaceIf | (sizeOfReplaceIf >> 1) | ((sizeOfReplaceIf | (sizeOfReplaceIf >> 1)) >> 2);
              v54 = v53 | (v53 >> 4) | ((v53 | (v53 >> 4)) >> 8);
              v55 = (v54 | HIWORD(v54)) + 1;
              self->sizeOfReplaceIf = v55;
              directive_replace_if = (_replace_if *)malloc_type_realloc(directive_replace_if, 40 * v55, 0x10000400A747E1EuLL);
              self->directive_replace_if = directive_replace_if;
              indexOfReplaceIf = self->indexOfReplaceIf;
            }
            directive_replace_if[indexOfReplaceIf].var0 = v21;
            v214 = objc_msgSend(v316, "count");
            v215 = self->directive_replace_if;
            v216 = self->indexOfReplaceIf;
            v215[v216].var1 = v214 + v21;
            v39 = v321;
            if (v321)
            {
              v309 = v27;
              v298 = v20;
              v348 = 0u;
              v349 = 0u;
              v346 = 0u;
              v347 = 0u;
              objc_msgSend(v321, "allKeys");
              v318 = (id)objc_claimAutoreleasedReturnValue();
              v217 = objc_msgSend(v318, "countByEnumeratingWithState:objects:count:", &v346, v360, 16);
              v305 = v25;
              if (v217)
              {
                v218 = v217;
                v219 = 0;
                v220 = 0;
                v221 = *(_QWORD *)v347;
                do
                {
                  v222 = 0;
                  v223 = v219;
                  v224 = v220;
                  do
                  {
                    if (*(_QWORD *)v347 != v221)
                      objc_enumerationMutation(v318);
                    v225 = *(void **)(*((_QWORD *)&v346 + 1) + 8 * v222);
                    objc_msgSend(v225, "floatValue");
                    v220 = v224 + 1;
                    v320->directive_replace_if[v320->indexOfReplaceIf].var2[v224] = v226;
                    objc_msgSend(v321, "objectForKey:", v225);
                    v227 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v227, "floatValue");
                    v219 = v223 + 1;
                    v320->directive_replace_if[v320->indexOfReplaceIf].var3[v223] = v228;

                    ++v222;
                    ++v224;
                    ++v223;
                  }
                  while (v218 != v222);
                  v218 = objc_msgSend(v318, "countByEnumeratingWithState:objects:count:", &v346, v360, 16);
                }
                while (v218);
              }
              else
              {
                v220 = 0;
              }

              self = v320;
              v39 = v321;
              v215 = v320->directive_replace_if;
              v216 = v320->indexOfReplaceIf;
              v246 = v216;
              v11 = v291;
              v20 = v298;
              v29 = v315;
              v25 = v305;
              v27 = v309;
            }
            else
            {
              v220 = 0;
              v246 = v216;
            }
            v215[v246].var4 = v220;
            self->indexOfReplaceIf = v216 + 1;
            p_info = (__objc2_class_ro **)(&OBJC_METACLASS___PRSL2FeatureVectorProcessingContext + 32);
            goto LABEL_173;
          case 3uLL:
            sizeOfReplaceThenMin = self->sizeOfReplaceThenMin;
            indexOfReplaceThenMin = self->indexOfReplaceThenMin;
            directive_replace_then_min = self->directive_replace_then_min;
            if (sizeOfReplaceThenMin == indexOfReplaceThenMin)
            {
              v59 = sizeOfReplaceThenMin | (sizeOfReplaceThenMin >> 1) | ((sizeOfReplaceThenMin | (sizeOfReplaceThenMin >> 1)) >> 2);
              v60 = v59 | (v59 >> 4) | ((v59 | (v59 >> 4)) >> 8);
              v61 = (v60 | HIWORD(v60)) + 1;
              self->sizeOfReplaceThenMin = v61;
              directive_replace_then_min = (_replace_then_min *)malloc_type_realloc(directive_replace_then_min, 72 * v61, 0x1000040811A10F9uLL);
              self->directive_replace_then_min = directive_replace_then_min;
              indexOfReplaceThenMin = self->indexOfReplaceThenMin;
            }
            v299 = v20;
            directive_replace_then_min[indexOfReplaceThenMin].var0 = v21;
            v229 = objc_msgSend(v22, "count");
            v230 = self;
            self->directive_replace_then_min[self->indexOfReplaceThenMin].var1 = v229 + v21;
            objc_msgSend(v27, "objectForKey:", CFSTR("replace"));
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            v310 = v27;
            objc_msgSend(v27, "objectForKey:", CFSTR("min"));
            v286 = (void *)objc_claimAutoreleasedReturnValue();
            v338 = 0u;
            v339 = 0u;
            v340 = 0u;
            v341 = 0u;
            objc_msgSend(v231, "allKeys");
            v319 = (id)objc_claimAutoreleasedReturnValue();
            v232 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v338, v358, 16);
            v306 = v25;
            v289 = v231;
            if (v232)
            {
              v233 = v232;
              v234 = 0;
              v235 = 0;
              v236 = *(_QWORD *)v339;
              do
              {
                v237 = 0;
                v238 = v234;
                v239 = v235;
                do
                {
                  if (*(_QWORD *)v339 != v236)
                    objc_enumerationMutation(v319);
                  v240 = *(void **)(*((_QWORD *)&v338 + 1) + 8 * v237);
                  objc_msgSend(v240, "floatValue");
                  v235 = v239 + 1;
                  v230->directive_replace_then_min[v230->indexOfReplaceThenMin].var2[v239] = v241;
                  objc_msgSend(v321, "objectForKey:", v240);
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v242, "floatValue");
                  v234 = v238 + 1;
                  v230->directive_replace_then_min[v230->indexOfReplaceThenMin].var3[v238] = v243;

                  ++v237;
                  ++v239;
                  ++v238;
                }
                while (v233 != v237);
                v233 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v338, v358, 16);
              }
              while (v233);
            }
            else
            {
              v235 = 0;
            }

            v230->directive_replace_then_min[v230->indexOfReplaceThenMin].var5 = v235;
            objc_msgSend(v286, "floatValue");
            v247 = v230->indexOfReplaceThenMin;
            self = v230;
            v230->directive_replace_then_min[v247].var4 = v248;
            v230->indexOfReplaceThenMin = v247 + 1;

            p_info = (__objc2_class_ro **)(&OBJC_METACLASS___PRSL2FeatureVectorProcessingContext + 32);
            v11 = v291;
            v20 = v299;
            v36 = v313;
            v29 = v315;
            v22 = v316;
            v25 = v306;
            v27 = v310;
            break;
          case 4uLL:
            sizeOfValueIfNotExist = self->sizeOfValueIfNotExist;
            indexOfValueIfNotExist = self->indexOfValueIfNotExist;
            directive_value_if_not_exist = self->directive_value_if_not_exist;
            if (sizeOfValueIfNotExist == indexOfValueIfNotExist)
            {
              v65 = sizeOfValueIfNotExist | (sizeOfValueIfNotExist >> 1) | ((sizeOfValueIfNotExist | (sizeOfValueIfNotExist >> 1)) >> 2);
              v66 = v65 | (v65 >> 4) | ((v65 | (v65 >> 4)) >> 8);
              v67 = (v66 | HIWORD(v66)) + 1;
              self->sizeOfValueIfNotExist = v67;
              directive_value_if_not_exist = (_value_if_not_exist *)malloc_type_realloc(directive_value_if_not_exist, 24 * v67, 0x10000400CE834B2uLL);
              self->directive_value_if_not_exist = directive_value_if_not_exist;
              indexOfValueIfNotExist = self->indexOfValueIfNotExist;
            }
            v36 = v313;
            directive_value_if_not_exist[indexOfValueIfNotExist].var0 = v21;
            self->directive_value_if_not_exist[self->indexOfValueIfNotExist].var1 = objc_msgSend(v22, "count") + v21;
            objc_msgSend(v25, "floatValue");
            v244 = self->indexOfValueIfNotExist;
            v22 = v316;
            self->directive_value_if_not_exist[v244].var2 = v245;
            self->indexOfValueIfNotExist = v244 + 1;
            break;
          case 5uLL:
            sizeOfIsPopulated = self->sizeOfIsPopulated;
            indexOfIsPopulated = self->indexOfIsPopulated;
            directive_is_populated = self->directive_is_populated;
            if (sizeOfIsPopulated == indexOfIsPopulated)
            {
              v71 = sizeOfIsPopulated | (sizeOfIsPopulated >> 1) | ((sizeOfIsPopulated | (sizeOfIsPopulated >> 1)) >> 2);
              v72 = v71 | (v71 >> 4) | ((v71 | (v71 >> 4)) >> 8);
              v73 = (v72 | HIWORD(v72)) + 1;
              self->sizeOfIsPopulated = v73;
              directive_is_populated = (_is_populated *)malloc_type_realloc(directive_is_populated, (uint64_t)v73 << 6, 0x1000040FA0F61DDuLL);
              self->directive_is_populated = directive_is_populated;
              indexOfIsPopulated = self->indexOfIsPopulated;
            }
            directive_is_populated[(uint64_t)indexOfIsPopulated].var0 = v21;
            v74 = objc_msgSend(v22, "count");
            v75 = self->directive_is_populated;
            v76 = self->indexOfIsPopulated;
            v77 = v76;
            v75[(uint64_t)v76].var1 = v74 + v21;
            if (v321)
            {
              v307 = v27;
              v292 = v20;
              v344 = 0u;
              v345 = 0u;
              v342 = 0u;
              v343 = 0u;
              objc_msgSend(v321, "allKeys");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v342, v359, 16);
              v301 = v25;
              if (v79)
              {
                v80 = v79;
                v81 = 0;
                v82 = 0;
                v83 = *(_QWORD *)v343;
                do
                {
                  v84 = 0;
                  v85 = v81;
                  v86 = v82;
                  do
                  {
                    if (*(_QWORD *)v343 != v83)
                      objc_enumerationMutation(v78);
                    v87 = *(void **)(*((_QWORD *)&v342 + 1) + 8 * v84);
                    v82 = v86 + 1;
                    self->directive_is_populated[(uint64_t)self->indexOfIsPopulated].var2[v86] = (float)objc_msgSend(v87, "BOOLValue");
                    objc_msgSend(v321, "objectForKey:", v87);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "floatValue");
                    v81 = v85 + 1;
                    self->directive_is_populated[(uint64_t)self->indexOfIsPopulated].var3[v85] = v89;

                    ++v84;
                    ++v86;
                    ++v85;
                  }
                  while (v80 != v84);
                  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v342, v359, 16);
                }
                while (v80);
              }
              else
              {
                v82 = 0;
              }

              v75 = self->directive_is_populated;
              v76 = self->indexOfIsPopulated;
              v77 = v76;
              p_info = (__objc2_class_ro **)(&OBJC_METACLASS___PRSL2FeatureVectorProcessingContext + 32);
              v11 = v291;
              v20 = v292;
              v29 = v315;
              v22 = v316;
              v25 = v301;
              v27 = v307;
            }
            else
            {
              v82 = 0;
            }
            v75[v77].var4 = v82;
            self->indexOfIsPopulated = v76 + 1;
            goto LABEL_160;
          case 6uLL:
            sizeOfIdMapping = self->sizeOfIdMapping;
            indexOfIdMapping = self->indexOfIdMapping;
            if (sizeOfIdMapping == indexOfIdMapping)
            {
              v92 = sizeOfIdMapping | (sizeOfIdMapping >> 1) | ((sizeOfIdMapping | (sizeOfIdMapping >> 1)) >> 2);
              v93 = v92 | (v92 >> 4) | ((v92 | (v92 >> 4)) >> 8);
              v94 = (v93 | HIWORD(v93)) + 1;
              self->sizeOfIdMapping = v94;
              self->directive_id_mapping = (_id_mapping *)malloc_type_realloc(self->directive_id_mapping, 48 * v94, 0x1072040C780C59AuLL);
              indexOfIdMapping = self->indexOfIdMapping;
            }
            if (v321)
            {
              self->directive_id_mapping[indexOfIdMapping].var0 = v21;
              self->directive_id_mapping[self->indexOfIdMapping].var1 = objc_msgSend(v321, "count") + v21;
              v95 = objc_msgSend(v321, "count");
              cumulativeInflatedFeaturesCount = v95 + cumulativeInflatedFeaturesCount - 1;
              objc_msgSend(v316, "firstObject");
              v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v97 = (const char *)objc_msgSend(v96, "UTF8String");

              v98 = strdup(v97);
              v99 = self->indexOfIdMapping;
              self->directive_id_mapping[self->indexOfIdMapping].var3 = v98;
              self->directive_id_mapping[v99].var2.var0 = 0;
              v100 = &self->directive_id_mapping[self->indexOfIdMapping];
              v100->var2.var0 = 0;
              *(_QWORD *)&v100->var2.var1[2] = 0;
              v100->var2.var1[4] = 0;
              objc_msgSend(v321, "allKeys");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "objectAtIndexedSubscript:", 0);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = objc_msgSend(v102, "integerValue");

              v39 = v321;
              if (v103)
              {
                v336 = 0u;
                v337 = 0u;
                v334 = 0u;
                v335 = 0u;
                objc_msgSend(v321, "allKeys");
                v104 = (id)objc_claimAutoreleasedReturnValue();
                v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v334, v357, 16);
                if (v105)
                {
                  v106 = v105;
                  v293 = v20;
                  v302 = v25;
                  v107 = 0;
                  v108 = *(_QWORD *)v335;
                  do
                  {
                    v109 = 0;
                    v110 = v107;
                    do
                    {
                      if (*(_QWORD *)v335 != v108)
                        objc_enumerationMutation(v104);
                      v107 = v110 + 1;
                      self->directive_id_mapping[self->indexOfIdMapping].var2.var1[v110++] = objc_msgSend(*(id *)(*((_QWORD *)&v334 + 1) + 8 * v109++), "intValue");
                    }
                    while (v106 != v109);
                    v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v334, v357, 16);
                  }
                  while (v106);
                  v20 = v293;
                  v25 = v302;
                  v39 = v321;
                }
              }
              else
              {
                v256 = (void *)MEMORY[0x1E0C97B70];
                lowercase_keys(v321);
                v257 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v256, "dictionaryWithDictionary:", v257);
                v258 = (void *)objc_claimAutoreleasedReturnValue();

                v104 = v258;
                self->directive_id_mapping[self->indexOfIdMapping].var2.var0 = (__CFDictionary *)v104;
              }

              v259 = self->mapInflatedIndexToSize;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v317);
              v261 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v259, "setObject:forKey:", v260, v261);

              indexOfIdMapping = self->indexOfIdMapping;
              v11 = v291;
              v29 = v315;
            }
            else
            {
              v39 = 0;
            }
            self->indexOfIdMapping = indexOfIdMapping + 1;
            goto LABEL_173;
          case 7uLL:
            sizeOfResultSetIdMapping = self->sizeOfResultSetIdMapping;
            indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
            if (sizeOfResultSetIdMapping == indexOfResultSetIdMapping)
            {
              v113 = sizeOfResultSetIdMapping | (sizeOfResultSetIdMapping >> 1) | ((sizeOfResultSetIdMapping | (sizeOfResultSetIdMapping >> 1)) >> 2);
              v114 = v113 | (v113 >> 4) | ((v113 | (v113 >> 4)) >> 8);
              v115 = (v114 | HIWORD(v114)) + 1;
              self->sizeOfResultSetIdMapping = v115;
              self->directive_resultset_id_mapping = (_resultset_id_mapping *)malloc_type_realloc(self->directive_resultset_id_mapping, 56 * v115, 0x10F20409CFFA869uLL);
              indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
            }
            if (v321)
            {
              self->directive_resultset_id_mapping[indexOfResultSetIdMapping].var0 = v21;
              self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var1 = objc_msgSend(v321, "count")
                                                                                         + v21;
              v116 = objc_msgSend(v321, "count");
              cumulativeInflatedFeaturesCount = v116 + cumulativeInflatedFeaturesCount - 1;
              objc_msgSend(v316, "firstObject");
              v117 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v118 = (const char *)objc_msgSend(v117, "UTF8String");

              self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var3 = strdup(v118);
              objc_msgSend(v321, "allKeys");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_msgSend(v120, "integerValue");

              v39 = v321;
              if (v121)
              {
                v294 = v20;
                v303 = v25;
                v332 = 0u;
                v333 = 0u;
                v330 = 0u;
                v331 = 0u;
                objc_msgSend(v321, "allKeys");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v330, v356, 16);
                if (v123)
                {
                  v124 = v123;
                  v125 = 0;
                  v126 = *(_QWORD *)v331;
                  do
                  {
                    v127 = 0;
                    v128 = v125;
                    do
                    {
                      if (*(_QWORD *)v331 != v126)
                        objc_enumerationMutation(v122);
                      v125 = v128 + 1;
                      self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var2.var1[v128++] = objc_msgSend(*(id *)(*((_QWORD *)&v330 + 1) + 8 * v127++), "intValue");
                    }
                    while (v124 != v127);
                    v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v330, v356, 16);
                  }
                  while (v124);
                }

                self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var2.var0 = 0;
                v11 = v291;
                v20 = v294;
                v25 = v303;
                v39 = v321;
              }
              else
              {
                v249 = (void *)MEMORY[0x1E0C97B70];
                lowercase_keys(v321);
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v249, "dictionaryWithDictionary:", v250);
                v251 = (void *)objc_claimAutoreleasedReturnValue();

                v252 = v251;
                self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var2.var0 = v252;

                v11 = v291;
              }
              self->directive_resultset_id_mapping[self->indexOfResultSetIdMapping].var4 = 0;
              v253 = self->mapInflatedIndexToSize;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
              v254 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v317);
              v255 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v253, "setObject:forKey:", v254, v255);

              indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
              v29 = v315;
            }
            else
            {
              v39 = 0;
            }
            self->indexOfResultSetIdMapping = indexOfResultSetIdMapping + 1;
LABEL_173:
            v36 = v313;
            v22 = v316;
            goto LABEL_162;
          case 8uLL:
            sizeOfResultSetIdScoreMapping = self->sizeOfResultSetIdScoreMapping;
            indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
            if (sizeOfResultSetIdScoreMapping == indexOfResultSetIdScoreMapping)
            {
              v131 = sizeOfResultSetIdScoreMapping | (sizeOfResultSetIdScoreMapping >> 1) | ((sizeOfResultSetIdScoreMapping | (sizeOfResultSetIdScoreMapping >> 1)) >> 2);
              v132 = v131 | (v131 >> 4) | ((v131 | (v131 >> 4)) >> 8);
              v133 = (v132 | HIWORD(v132)) + 1;
              self->sizeOfResultSetIdScoreMapping = v133;
              self->directive_resultset_id_score_mapping = (_resultset_id_score_mapping *)malloc_type_realloc(self->directive_resultset_id_score_mapping, (uint64_t)v133 << 6, 0x10F2040D14D0496uLL);
              indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
            }
            if (v321)
            {
              self->directive_resultset_id_score_mapping[(uint64_t)indexOfResultSetIdScoreMapping].var0 = v21;
              self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var1 = objc_msgSend(v321, "count") + v21;
              v134 = objc_msgSend(v321, "count");
              cumulativeInflatedFeaturesCount = v134 + cumulativeInflatedFeaturesCount - 1;
              objc_msgSend(v22, "firstObject");
              v135 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v136 = (const char *)objc_msgSend(v135, "UTF8String");

              self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var4 = strdup(v136);
              objc_msgSend(v321, "allKeys");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "objectAtIndexedSubscript:", 0);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              v139 = objc_msgSend(v138, "integerValue");

              v39 = v321;
              if (v139)
              {
                v295 = v20;
                v304 = v25;
                v328 = 0u;
                v329 = 0u;
                v326 = 0u;
                v327 = 0u;
                objc_msgSend(v321, "allKeys");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v326, v355, 16);
                if (v141)
                {
                  v142 = v141;
                  v143 = 0;
                  v144 = *(_QWORD *)v327;
                  do
                  {
                    v145 = 0;
                    v146 = v143;
                    do
                    {
                      if (*(_QWORD *)v327 != v144)
                        objc_enumerationMutation(v140);
                      v143 = v146 + 1;
                      self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var2.var1[v146++] = objc_msgSend(*(id *)(*((_QWORD *)&v326 + 1) + 8 * v145++), "intValue");
                    }
                    while (v142 != v145);
                    v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v326, v355, 16);
                  }
                  while (v142);
                }

                self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var2.var0 = 0;
                v20 = v295;
                v25 = v304;
                v39 = v321;
              }
              else
              {
                v262 = (void *)MEMORY[0x1E0C97B70];
                lowercase_keys(v321);
                v263 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v262, "dictionaryWithDictionary:", v263);
                v264 = (void *)objc_claimAutoreleasedReturnValue();

                v265 = v264;
                self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var2.var0 = v265;

              }
              v11 = v291;
              if (v314)
              {
                v266 = (void *)MEMORY[0x1E0C97B70];
                lowercase_keys(v314);
                v267 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v266, "dictionaryWithDictionary:", v267);
                v268 = (void *)objc_claimAutoreleasedReturnValue();

                v269 = v268;
                self->directive_resultset_id_score_mapping[(uint64_t)self->indexOfResultSetIdScoreMapping].var3 = v269;

                v270 = self->indexOfResultSetIdScoreMapping;
              }
              else
              {
                v270 = self->indexOfResultSetIdScoreMapping;
                self->directive_resultset_id_score_mapping[v270].var3 = 0;
              }
              self->directive_resultset_id_score_mapping[v270].var5 = 0;
              v271 = self->mapInflatedIndexToSize;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
              v272 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v317);
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v271, "setObject:forKey:", v272, v273);

              indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
              v29 = v315;
              v22 = v316;
            }
            else
            {
              v39 = 0;
            }
            self->indexOfResultSetIdScoreMapping = indexOfResultSetIdScoreMapping + 1;
            goto LABEL_180;
          case 9uLL:
            v147 = v22;

            v290 = v147;
            v22 = v316;
            goto LABEL_160;
          case 10uLL:
            sizeOfOneSidedInverse = self->sizeOfOneSidedInverse;
            indexOfOneSidedInverse = self->indexOfOneSidedInverse;
            directive_one_sided_inverse = self->directive_one_sided_inverse;
            if (sizeOfOneSidedInverse == indexOfOneSidedInverse)
            {
              v151 = sizeOfOneSidedInverse | (sizeOfOneSidedInverse >> 1) | ((sizeOfOneSidedInverse | (sizeOfOneSidedInverse >> 1)) >> 2);
              v152 = v151 | (v151 >> 4) | ((v151 | (v151 >> 4)) >> 8);
              v153 = (v152 | HIWORD(v152)) + 1;
              self->sizeOfOneSidedInverse = v153;
              directive_one_sided_inverse = (_one_sided_inverse *)malloc_type_realloc(directive_one_sided_inverse, 16 * v153, 0x1000040451B5BE8uLL);
              self->directive_one_sided_inverse = directive_one_sided_inverse;
              indexOfOneSidedInverse = self->indexOfOneSidedInverse;
            }
            v36 = v313;
            directive_one_sided_inverse[indexOfOneSidedInverse].var0 = v21;
            v154 = objc_msgSend(v22, "count");
            v155 = self->indexOfOneSidedInverse;
            self->directive_one_sided_inverse[v155].var1 = v154 + v21;
            self->indexOfOneSidedInverse = v155 + 1;
            break;
          case 11uLL:
            sizeOfQuantize = self->sizeOfQuantize;
            if (sizeOfQuantize == self->indexOfQuantize)
            {
              v157 = sizeOfQuantize | (sizeOfQuantize >> 1) | ((sizeOfQuantize | (sizeOfQuantize >> 1)) >> 2);
              v158 = v157 | (v157 >> 4) | ((v157 | (v157 >> 4)) >> 8);
              v159 = (v158 | HIWORD(v158)) + 1;
              self->sizeOfQuantize = v159;
              self->directive_quantize = (_quantize *)malloc_type_realloc(self->directive_quantize, 32 * v159, 0x10800403A84FC25uLL);
            }
            v36 = v313;
            if (!v321)
            {
              v39 = 0;
              goto LABEL_162;
            }
            objc_msgSend(v321, "objectForKey:", CFSTR("bins"));
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            v161 = v160;
            if (v160 && objc_msgSend(v160, "count"))
            {
              v162 = objc_msgSend(v161, "count");
              self->directive_quantize[self->indexOfQuantize].var3 = v162;
              self->directive_quantize[self->indexOfQuantize].var2 = (float *)malloc_type_calloc(v162, 4uLL, 0x100004052888210uLL);
              if (objc_msgSend(v161, "count"))
              {
                v163 = 0;
                do
                {
                  objc_msgSend(v161, "objectAtIndex:", v163);
                  v164 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v164, "floatValue");
                  self->directive_quantize[self->indexOfQuantize].var2[v163] = v165;

                  ++v163;
                }
                while (objc_msgSend(v161, "count") > v163);
              }
              self->directive_quantize[self->indexOfQuantize].var0 = v21;
              self->directive_quantize[self->indexOfQuantize].var1 = objc_msgSend(v316, "count") + v21;
              v166 = objc_msgSend(v161, "count");
              indexOfQuantize = self->indexOfQuantize;
              self->directive_quantize[indexOfQuantize].var3 = v166;
              self->indexOfQuantize = indexOfQuantize + 1;
              v36 = v313;
              v29 = v315;
            }

            goto LABEL_126;
          case 12uLL:
            v308 = v27;
            v168 = v321;
            if (!v321)
              goto LABEL_130;
            objc_msgSend(v13, "objectForKey:", CFSTR("features"));
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            v296 = objc_msgSend(v169, "count");
            v170 = objc_msgSend(v321, "count");
            self->directive_local_resultset_id_values_mapping.start_idx = v21;
            self->directive_local_resultset_id_values_mapping.end_idx = v170 * v296 + v21;
            v171 = v170 * v296 - 1;
            cumulativeInflatedFeaturesCount += v171;
            v172 = (void *)MEMORY[0x1E0C97B70];
            lowercase_keys(v321);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "dictionaryWithDictionary:", v173);
            v174 = (void *)objc_claimAutoreleasedReturnValue();

            v287 = v174;
            self->directive_local_resultset_id_values_mapping.mapping = v287;
            v175 = self->mapInflatedIndexToSize;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v171);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v317);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v175, "setObject:forKey:", v176, v177);

            self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder = (unint64_t *)malloc_type_malloc(8 * v296, 0x100004000313F17uLL);
            self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers = (id *)malloc_type_malloc(8 * objc_msgSend(v169, "count"), 0x80040B8603338uLL);
            v27 = v308;
            if (objc_msgSend(v169, "count"))
            {
              v178 = 0;
              do
              {
                objc_msgSend(v169, "objectAtIndexedSubscript:", v178);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                v180 = objc_msgSend(v179, "count");

                if (v180 >= 4)
                {
                  objc_msgSend(v169, "objectAtIndexedSubscript:", v178);
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v181, "objectAtIndexedSubscript:", 3);
                  v182 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v169, "objectAtIndexedSubscript:", v178);
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v183, "objectAtIndexedSubscript:", 4);
                  v184 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend((id)sLocalRSFeatureNameToBundleFeatureMappings, "objectForKeyedSubscript:", v182);
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                  self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder[v178] = objc_msgSend(v185, "unsignedIntegerValue");

                  v186 = objc_msgSend(v184, "isEqualToString:", CFSTR("min"));
                  v187 = (id *)&sMinPicker;
                  if (!v186)
                    v187 = (id *)&sMaxPicker;
                  self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[v178] = *v187;

                }
                ++v178;
              }
              while (v178 < objc_msgSend(v169, "count"));
            }
            self->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures = v296;
            self->directive_local_resultset_id_values_mapping.mapSize = 0;

            v11 = v291;
            v36 = v313;
            v29 = v315;
            goto LABEL_126;
          case 13uLL:
            v308 = v27;
            v168 = v321;
            if (!v321)
            {
LABEL_130:
              v36 = v313;
              v39 = v168;
              v27 = v308;
              goto LABEL_162;
            }
            objc_msgSend(v13, "objectForKey:", CFSTR("features"));
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = objc_msgSend(v188, "count");
            v190 = objc_msgSend(v321, "count");
            self->directive_parsec_resultset_id_values_mapping.start_idx = v21;
            self->directive_parsec_resultset_id_values_mapping.end_idx = v190 * v189 + v21;
            v297 = v190 * v189;
            v191 = v190 * v189 - 1;
            cumulativeInflatedFeaturesCount += v191;
            v192 = (void *)MEMORY[0x1E0C97B70];
            lowercase_keys(v321);
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "dictionaryWithDictionary:", v193);
            v194 = (void *)objc_claimAutoreleasedReturnValue();

            v288 = v194;
            self->directive_parsec_resultset_id_values_mapping.mapping = v288;
            v195 = self->mapInflatedIndexToSize;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v191);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v317);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v195, "setObject:forKey:", v196, v197);

            self->directive_parsec_resultset_id_values_mapping.numFeatures = v189;
            self->directive_parsec_resultset_id_values_mapping.PRSRankingBundleFeaturePickers = (id *)malloc_type_malloc(8 * v189, 0x80040B8603338uLL);
            v27 = v308;
            if (objc_msgSend(v188, "count"))
            {
              v198 = 0;
              do
              {
                objc_msgSend(v188, "objectAtIndexedSubscript:", v198);
                v199 = (void *)objc_claimAutoreleasedReturnValue();
                v200 = objc_msgSend(v199, "count");

                if (v200 >= 4)
                {
                  objc_msgSend(v188, "objectAtIndexedSubscript:", v198);
                  v201 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v201, "objectAtIndexedSubscript:", 4);
                  v202 = (void *)objc_claimAutoreleasedReturnValue();

                  v203 = objc_msgSend(v202, "isEqualToString:", CFSTR("min"));
                  v204 = (id *)&sMinPicker;
                  if (!v203)
                    v204 = (id *)&sMaxPicker;
                  self->directive_parsec_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[v198] = *v204;

                }
                ++v198;
              }
              while (v198 < objc_msgSend(v188, "count"));
            }
            v205 = (float *)malloc_type_malloc(4 * v297, 0x100004052888210uLL);
            self->directive_parsec_resultset_id_values_mapping.score_vector = v205;
            self->directive_parsec_resultset_id_values_mapping.mapSize = 4 * v297;
            v11 = v291;
            v29 = v315;
            if (v297)
              memset_pattern16(v205, &unk_1B87DEF60, 4 * v297);

            v36 = v313;
LABEL_126:
            v22 = v316;
            break;
          case 14uLL:
            v39 = v321;
            if (objc_msgSend(v321, "count"))
            {
              objc_msgSend(v321, "objectForKey:", CFSTR("model_weight_x"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v321, "objectForKey:", CFSTR("model_weight_y"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "doubleValue");
              -[PRSDirectivesManager setWeightX:](self, "setWeightX:");
              objc_msgSend(v41, "doubleValue");
              -[PRSDirectivesManager setWeightY:](self, "setWeightY:");

              v22 = v316;
            }
LABEL_180:
            v36 = v313;
            goto LABEL_162;
          case 15uLL:
            sizeOfFanOutValue = self->sizeOfFanOutValue;
            indexOfFanOutValue = self->indexOfFanOutValue;
            directive_fan_out = self->directive_fan_out;
            if (sizeOfFanOutValue == indexOfFanOutValue)
            {
              v209 = sizeOfFanOutValue | (sizeOfFanOutValue >> 1) | ((sizeOfFanOutValue | (sizeOfFanOutValue >> 1)) >> 2);
              v210 = v209 | (v209 >> 4) | ((v209 | (v209 >> 4)) >> 8);
              v211 = (v210 | HIWORD(v210)) + 1;
              self->sizeOfFanOutValue = v211;
              directive_fan_out = (fan_out_value *)malloc_type_realloc(directive_fan_out, 16 * v211, 0x1000040451B5BE8uLL);
              self->directive_fan_out = directive_fan_out;
              indexOfFanOutValue = self->indexOfFanOutValue;
            }
            v36 = v313;
            directive_fan_out[indexOfFanOutValue].var0 = v21;
            v212 = objc_msgSend(v22, "count");
            v213 = self->indexOfFanOutValue;
            self->directive_fan_out[v213].var1 = v212 + v21;
            cumulativeInflatedFeaturesCount += 95;
            self->indexOfFanOutValue = v213 + 1;
            break;
          default:
            goto LABEL_160;
        }
      }
      else
      {
LABEL_160:
        v36 = v313;
      }
      v39 = v321;
LABEL_162:

      v12 = v36 + 1;
    }
    while (v12 != v11);
    v8 = obj;
    v274 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v350, v362, 16);
    v11 = v274;
  }
  while (v274);
LABEL_184:

  if (-[__objc2_class_ro count](p_info[481], "count"))
  {
    +[PRSL2FeatureVector contextWithFeatureOrder:withInflation:withInflatedIndexToSize:](PRSL2FeatureVector, "contextWithFeatureOrder:withInflation:withInflatedIndexToSize:", p_info[481], cumulativeInflatedFeaturesCount, self->mapInflatedIndexToSize);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSDirectivesManager setProcessingContext:](self, "setProcessingContext:", v275);

  }
  v276 = v290;
  if (v290)
  {
    v277 = v8;
    v278 = (NSMutableIndexSet *)objc_opt_new();
    v279 = self->disabledFeatureIndices;
    self->disabledFeatureIndices = v278;

    v324 = 0u;
    v325 = 0u;
    v322 = 0u;
    v323 = 0u;
    v280 = v290;
    v281 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v322, v354, 16);
    if (v281)
    {
      v282 = v281;
      v283 = *(_QWORD *)v323;
      do
      {
        for (i = 0; i != v282; ++i)
        {
          if (*(_QWORD *)v323 != v283)
            objc_enumerationMutation(v280);
          v285 = -[__objc2_class_ro indexOfObject:](p_info[481], "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v322 + 1) + 8 * i));
          if (v285 != 0x7FFFFFFFFFFFFFFFLL)
            -[NSMutableIndexSet addIndex:](self->disabledFeatureIndices, "addIndex:", v285);
        }
        v282 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v322, v354, 16);
      }
      while (v282);
    }

    v8 = v277;
    v276 = v290;
  }
  cumulativeInflatedFeaturesCount = 0;
  -[__objc2_class_ro removeAllObjects](p_info[481], "removeAllObjects");

}

- (void)processResultSetValuesWithMap:(id)a3 serverFeatures:(id)a4
{
  id v6;
  int indexOfResultSetIdScoreMapping;
  __CFDictionary *v8;
  __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __CFDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  int indexOfResultSetIdMapping;
  uint64_t v55;
  __CFDictionary *v56;
  void *v57;
  float *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  __CFDictionary *mapping;
  __CFDictionary *v70;
  uint64_t v71;
  unint64_t numPRSRankingBundleFeatures;
  unint64_t v73;
  float *score_vector;
  float *v75;
  unint64_t *PRSRankingBundleFeatureOrder;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t ii;
  float *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  float v89;
  float v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  float (**v94)(id);
  void *v95;
  __CFDictionary *v96;
  float *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t numFeatures;
  unint64_t v105;
  __CFDictionary *v106;
  float *v107;
  size_t v108;
  uint64_t v109;
  _DWORD *v110;
  NSString *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t jj;
  void *v118;
  void *v119;
  float v120;
  float v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  unint64_t v126;
  float *v127;
  void *v128;
  uint64_t v129;
  unint64_t v130;
  _QWORD v131[2];
  unint64_t v132;
  id v133;
  void *v134;
  float *v135;
  id v136;
  PRSDirectivesManager *v137;
  __CFDictionary *v138;
  id v139;
  _DWORD *v140;
  __CFDictionary *v141;
  id v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
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
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v142 = a4;
  v133 = v6;
  v143 = (id)objc_msgSend(v6, "copy");
  indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
  v137 = self;
  if (indexOfResultSetIdScoreMapping >= 1)
  {
    v8 = 0;
    do
    {
      v9 = self->directive_resultset_id_score_mapping[(_QWORD)v8].var2.var0;
      v141 = self->directive_resultset_id_score_mapping[(_QWORD)v8].var3;
      -[__CFDictionary allKeys](v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = malloc_type_malloc(4 * objc_msgSend(v10, "count"), 0x100004052888210uLL);

      -[__CFDictionary allKeys](v9, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
        memset_pattern16(v11, &unk_1B87DEF60, 4 * v13);
      self->directive_resultset_id_score_mapping[(_QWORD)v8].var5 = (float *)v11;
      if ((objc_msgSend(v143, "count") || objc_msgSend(v142, "count"))
        && !strcmp("resultset_bundle_id_score", self->directive_resultset_id_score_mapping[(_QWORD)v8].var4))
      {
        v140 = v11;
        v138 = v8;
        v170 = 0u;
        v171 = 0u;
        v168 = 0u;
        v169 = 0u;
        objc_msgSend(v143, "keyEnumerator");
        v139 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v168, v178, 16);
        v15 = v141;
        if (v14)
        {
          v16 = v14;
          v17 = *(_QWORD *)v169;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v169 != v17)
                objc_enumerationMutation(v139);
              v19 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * i);
              objc_msgSend(v19, "lowercaseString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFDictionary objectForKey:](v9, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "objectForKey:", v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              -[__CFDictionary objectForKey:](v15, "objectForKey:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
                if (v21)
                {
                  v25 = objc_msgSend(v21, "unsignedIntegerValue");
                }
                else
                {
                  -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("__none_of_the_above__"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v26, "unsignedIntegerValue");

                }
                -[__CFDictionary allKeys](v9, "allKeys");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25 >= objc_msgSend(v27, "count"))
                  -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.6();

                objc_msgSend(v23, "floatValue");
                v140[v25] = v28;
                v15 = v141;
              }

            }
            v16 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v168, v178, 16);
          }
          while (v16);
        }

        v166 = 0u;
        v167 = 0u;
        v164 = 0u;
        v165 = 0u;
        objc_msgSend(v142, "keyEnumerator");
        v139 = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v164, v177, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v165;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v165 != v31)
                objc_enumerationMutation(v139);
              v33 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * j);
              objc_msgSend(v33, "lowercaseString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFDictionary objectForKey:](v9, "objectForKey:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "objectForKey:", v33);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "maxScore");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              -[__CFDictionary objectForKey:](v15, "objectForKey:", v34);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v38)
              {
                if (v35)
                {
                  v39 = objc_msgSend(v35, "unsignedIntegerValue");
                }
                else
                {
                  -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("__none_of_the_above__"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v40, "unsignedIntegerValue");

                }
                -[__CFDictionary allKeys](v9, "allKeys");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39 >= objc_msgSend(v41, "count"))
                  -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.5();

                objc_msgSend(v37, "floatValue");
                v140[v39] = v42;
                v15 = v141;
              }

            }
            v30 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v164, v177, 16);
          }
          while (v30);
        }

        self = v137;
        v8 = v138;
      }

      v8 = (__CFDictionary *)((char *)v8 + 1);
    }
    while ((uint64_t)v8 < self->indexOfResultSetIdScoreMapping);
  }
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v143, "count"));
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  objc_msgSend(v143, "keyEnumerator");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v161;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v161 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(v43, "addObject:", *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * k));
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
    }
    while (v46);
  }

  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  objc_msgSend(v142, "keyEnumerator");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v156, v175, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v157;
    do
    {
      for (m = 0; m != v51; ++m)
      {
        if (*(_QWORD *)v157 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(v43, "addObject:", *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * m));
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v156, v175, 16);
    }
    while (v51);
  }

  indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
  v134 = v43;
  if (indexOfResultSetIdMapping >= 1)
  {
    v55 = 0;
    do
    {
      v56 = self->directive_resultset_id_mapping[v55].var2.var0;
      -[__CFDictionary allKeys](v56, "allKeys");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (float *)malloc_type_calloc(objc_msgSend(v57, "count"), 4uLL, 0x100004052888210uLL);

      self->directive_resultset_id_mapping[v55].var4 = v58;
      if (objc_msgSend(v43, "count") && !strcmp("resultset_bundle_id", self->directive_resultset_id_mapping[v55].var3))
      {
        v140 = (_DWORD *)v55;
        v154 = 0u;
        v155 = 0u;
        v152 = 0u;
        v153 = 0u;
        v141 = v43;
        v59 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v141, "countByEnumeratingWithState:objects:count:", &v152, v174, 16);
        if (v59)
        {
          v60 = v59;
          v61 = *(_QWORD *)v153;
          do
          {
            for (n = 0; n != v60; ++n)
            {
              if (*(_QWORD *)v153 != v61)
                objc_enumerationMutation(v141);
              objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * n), "lowercaseString");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFDictionary objectForKey:](v56, "objectForKey:", v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              if (v64)
              {
                -[__CFDictionary objectForKey:](v56, "objectForKey:", v63);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "unsignedIntegerValue");
              }
              else
              {
                -[__CFDictionary objectForKey:](v56, "objectForKey:", CFSTR("__none_of_the_above__"));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "integerValue");
              }
              v67 = v66;

              -[__CFDictionary allKeys](v56, "allKeys");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (v67 >= objc_msgSend(v68, "count"))
                -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.4();

              v58[v67] = 1.0;
            }
            v60 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v141, "countByEnumeratingWithState:objects:count:", &v152, v174, 16);
          }
          while (v60);
        }

        self = v137;
        v43 = v134;
        v55 = (uint64_t)v140;
      }

      ++v55;
    }
    while (v55 < self->indexOfResultSetIdMapping);
  }
  if (objc_msgSend(v143, "count"))
  {
    mapping = self->directive_local_resultset_id_values_mapping.mapping;
    if (mapping)
    {
      v70 = mapping;
      v71 = -[__CFDictionary count](v70, "count");
      numPRSRankingBundleFeatures = self->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures;
      v132 = v71;
      v140 = (_DWORD *)(4 * v71 * numPRSRankingBundleFeatures);
      if (self->directive_local_resultset_id_values_mapping.mapSize < (unint64_t)v140)
      {
        v73 = (unint64_t)v140;
        self->directive_local_resultset_id_values_mapping.score_vector = (float *)malloc_type_realloc(self->directive_local_resultset_id_values_mapping.score_vector, (size_t)v140, 0x43D5FDC6uLL);
        self->directive_local_resultset_id_values_mapping.mapSize = v73;
        numPRSRankingBundleFeatures = self->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures;
      }
      score_vector = self->directive_local_resultset_id_values_mapping.score_vector;
      if (numPRSRankingBundleFeatures * v132)
        memset_pattern16(self->directive_local_resultset_id_values_mapping.score_vector, &unk_1B87DEF60, 4 * numPRSRankingBundleFeatures * v132);
      if ((unint64_t)v140 < 4
                                  * (self->directive_local_resultset_id_values_mapping.end_idx
                                   - self->directive_local_resultset_id_values_mapping.start_idx))
        -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.2();
      if (numPRSRankingBundleFeatures)
      {
        v75 = 0;
        do
        {
          PRSRankingBundleFeatureOrder = self->directive_local_resultset_id_values_mapping.PRSRankingBundleFeatureOrder;
          v135 = v75;
          v141 = (__CFDictionary *)PRSRankingBundleFeatureOrder[(_QWORD)v75];
          v148 = 0u;
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          objc_msgSend(v143, "keyEnumerator");
          v136 = (id)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v148, v173, 16);
          if (v77)
          {
            v78 = v77;
            v79 = *(void **)v149;
            v138 = (__CFDictionary *)((_QWORD)v135 * v132);
            v139 = v79;
            do
            {
              for (ii = 0; ii != v78; ++ii)
              {
                if (*(id *)v149 != v139)
                  objc_enumerationMutation(v136);
                v81 = score_vector;
                v82 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * ii);
                objc_msgSend(v143, "objectForKey:", v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "lowercaseString");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFDictionary objectForKey:](v70, "objectForKey:", v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();

                if (v85)
                {
                  -[__CFDictionary objectForKey:](v70, "objectForKey:", v84);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  v87 = objc_msgSend(v86, "unsignedIntegerValue");

                  objc_msgSend(v83, "objectAtIndexedSubscript:", v141);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "floatValue");
                  v90 = v89;

                  v91 = (unint64_t)v138 + v87;
                }
                else
                {
                  -[__CFDictionary objectForKey:](v70, "objectForKey:", CFSTR("__none_of_the_above__"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = objc_msgSend(v92, "integerValue");

                  v91 = (unint64_t)v138 + v93;
                  v94 = (float (**)(id))v137->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[(_QWORD)v135];
                  objc_msgSend(v83, "objectAtIndexedSubscript:", v141);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "floatValue");
                  v90 = v94[2](v94);

                }
                if (v91 >= (unint64_t)v140)
                  -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.3();
                score_vector = v81;
                v81[v91] = v90;

              }
              v78 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v148, v173, 16);
            }
            while (v78);
          }

          v75 = (float *)((char *)v135 + 1);
          self = v137;
        }
        while ((unint64_t)v135 + 1 < v137->directive_local_resultset_id_values_mapping.numPRSRankingBundleFeatures);
      }

      v43 = v134;
    }
  }
  if (objc_msgSend(v142, "count"))
  {
    v96 = self->directive_parsec_resultset_id_values_mapping.mapping;
    v97 = (float *)-[__CFDictionary count](v96, "count");
    numFeatures = self->directive_parsec_resultset_id_values_mapping.numFeatures;
    v135 = v97;
    v105 = numFeatures * (_QWORD)v97;
    v141 = (__CFDictionary *)(4 * numFeatures * (_QWORD)v97);
    if (self->directive_parsec_resultset_id_values_mapping.mapSize < (unint64_t)v141)
    {
      v106 = v141;
      v97 = (float *)malloc_type_realloc(self->directive_parsec_resultset_id_values_mapping.score_vector, (size_t)v141, 0xB319E144uLL);
      self->directive_parsec_resultset_id_values_mapping.score_vector = v97;
      self->directive_parsec_resultset_id_values_mapping.mapSize = (unint64_t)v106;
    }
    v107 = self->directive_parsec_resultset_id_values_mapping.score_vector;
    if (v105)
      memset_pattern16(self->directive_parsec_resultset_id_values_mapping.score_vector, &unk_1B87DEF60, (size_t)v141);
    v139 = v107;
    if (processResultSetValuesWithMap_serverFeatures__onceToken != -1)
      dispatch_once(&processResultSetValuesWithMap_serverFeatures__onceToken, &__block_literal_global_226);
    v131[1] = v131;
    MEMORY[0x1E0C80A78](v97, 8 * numFeatures, v98, v99, v100, v101, v102, v103);
    v140 = (_DWORD *)((char *)v131 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v140, v108);
    if (numFeatures)
    {
      v109 = 0;
      v110 = v140;
      do
      {
        objc_msgSend((id)processResultSetValuesWithMap_serverFeatures__parsecFeatureSelectors, "objectAtIndexedSubscript:", v109);
        v111 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v110[2 * v109] = NSSelectorFromString(v111);

        ++v109;
      }
      while (numFeatures != v109);
      v112 = 0;
      v138 = v96;
      v132 = numFeatures;
      do
      {
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        objc_msgSend(v142, "keyEnumerator");
        v136 = (id)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v144, v172, 16);
        if (v113)
        {
          v114 = v113;
          v115 = *(_QWORD *)v145;
          v116 = v112 * (_QWORD)v135;
          do
          {
            for (jj = 0; jj != v114; ++jj)
            {
              if (*(_QWORD *)v145 != v115)
                objc_enumerationMutation(v136);
              v118 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * jj);
              objc_msgSend(v142, "objectForKey:", v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_msgSend(v119, "performSelector:", *(_QWORD *)&v140[2 * v112]), "floatValue");
              v121 = v120;
              objc_msgSend(v118, "lowercaseString");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFDictionary objectForKey:](v96, "objectForKey:", v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();

              if (v123)
              {
                -[__CFDictionary objectForKey:](v96, "objectForKey:", v122);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = objc_msgSend(v124, "unsignedIntegerValue");

                v126 = v125 + v116;
                v127 = (float *)v139;
              }
              else
              {
                -[__CFDictionary objectForKey:](v96, "objectForKey:", CFSTR("__none_of_the_above__"));
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                v129 = objc_msgSend(v128, "integerValue");

                v126 = v129 + v116;
                v127 = (float *)v139;
                v121 = (*((float (**)(float, float))v137->directive_local_resultset_id_values_mapping.PRSRankingBundleFeaturePickers[v112]
                        + 2))(v121, *((float *)v139 + v126));
              }
              if (v126 >= (unint64_t)v141)
                -[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:].cold.1();
              v127[v126] = v121;

              v96 = v138;
            }
            v114 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v144, v172, 16);
          }
          while (v114);
        }

        ++v112;
      }
      while (v112 != v132);
    }
    v43 = v134;
LABEL_119:

    goto LABEL_120;
  }
  if (self->directive_parsec_resultset_id_values_mapping.mapSize)
  {
    v96 = self->directive_parsec_resultset_id_values_mapping.mapping;
    v130 = self->directive_parsec_resultset_id_values_mapping.numFeatures * -[__CFDictionary count](v96, "count");
    if (v130)
      memset_pattern16(self->directive_parsec_resultset_id_values_mapping.score_vector, &unk_1B87DEF60, 4 * v130);
    goto LABEL_119;
  }
LABEL_120:

}

void __69__PRSDirectivesManager_processResultSetValuesWithMap_serverFeatures___block_invoke()
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
  _QWORD v13[12];

  v13[11] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_numResults);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v12;
  NSStringFromSelector(sel_maxScoreAbsRank);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v0;
  NSStringFromSelector(sel_maxScoreRelRank);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v1;
  NSStringFromSelector(sel_originalOrderAbsRank);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v2;
  NSStringFromSelector(sel_originalOrderRelRank);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v3;
  NSStringFromSelector(sel_maxCEPAbsRank);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v4;
  NSStringFromSelector(sel_maxCEPRelRank);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v5;
  NSStringFromSelector("cep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v6;
  NSStringFromSelector(sel_cepMaxRatio);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v7;
  NSStringFromSelector(sel_cepAllMaxRatio);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[9] = v8;
  NSStringFromSelector(sel_blockIdValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)processResultSetValuesWithMap_serverFeatures__parsecFeatureSelectors;
  processResultSetValuesWithMap_serverFeatures__parsecFeatureSelectors = v10;

}

- (void)cleanup
{
  int indexOfResultSetIdMapping;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int indexOfResultSetIdScoreMapping;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
  if (indexOfResultSetIdMapping >= 1)
  {
    v4 = 0;
    v5 = 48;
    do
    {
      v6 = *(void **)((char *)&self->directive_resultset_id_mapping->var0 + v5);
      if (v6)
      {
        free(v6);
        *(unint64_t *)((char *)&self->directive_resultset_id_mapping->var0 + v5) = 0;
        indexOfResultSetIdMapping = self->indexOfResultSetIdMapping;
      }
      ++v4;
      v5 += 56;
    }
    while (v4 < indexOfResultSetIdMapping);
  }
  indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
  if (indexOfResultSetIdScoreMapping >= 1)
  {
    v8 = 0;
    v9 = 56;
    do
    {
      v10 = *(void **)((char *)&self->directive_resultset_id_score_mapping->var0 + v9);
      if (v10)
      {
        free(v10);
        *(unint64_t *)((char *)&self->directive_resultset_id_score_mapping->var0 + v9) = 0;
        indexOfResultSetIdScoreMapping = self->indexOfResultSetIdScoreMapping;
      }
      ++v8;
      v9 += 64;
    }
    while (v8 < indexOfResultSetIdScoreMapping);
  }
}

- (void)processL2FeatureVector:(id)a3 populatingValues:(float *)a4 scoreValue:(char *)a5 count:(int)a6
{
  uint64_t v6;
  int v7;
  int v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  _DWORD *v29;
  unsigned __int16 *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  float v40;
  uint64_t v41;
  float *v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  float *v50;
  uint64_t v51;
  char *v52;
  float *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float *v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float *v64;
  float v65;
  uint64_t v66;
  float *v67;
  float v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  float v83;
  float v84;
  void *v85;
  char v86;
  const __CFString *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const void *v101;
  BOOL v102;
  const void *v103;
  const void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const void *v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  float *v116;
  unint64_t *v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  float v121;
  unint64_t v122;
  float *v123;
  float v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t *v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  float *v132;
  unsigned __int16 *v133;
  unsigned int v134;
  float v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t *v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  float *v144;
  unsigned __int16 *v145;
  unsigned int v146;
  float v147;
  float v148;
  __CFString *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  _QWORD v156[5];
  _BYTE v157[12940];
  uint64_t v158;

  v6 = ((uint64_t (*)(PRSDirectivesManager *, SEL, id, float *, char *, _QWORD))MEMORY[0x1E0C80A78])(self, a2, a3, a4, a5, *(_QWORD *)&a6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v6;
  v158 = *MEMORY[0x1E0C80C00];
  v15 = v14;
  objc_msgSend((id)v13, "processingContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "expandedFeatureExecutionOrder");

  v18 = v13;
  bzero(v157, 0x328CuLL);
  v152 = v15;
  v19 = objc_msgSend(v15, "getAllScores:", v157);
  v20 = v19;
  v21 = *(unsigned int *)(v13 + 8);
  if ((int)v21 >= 1)
  {
    v22 = 0;
    v23 = *(_QWORD *)(v13 + 104);
    do
    {
      v24 = (unint64_t *)(v23 + 16 * v22);
      v26 = *v24;
      v25 = v24[1];
      v27 = v25 > v26;
      v28 = v25 - v26;
      if (v27)
      {
        v29 = (_DWORD *)(v12 + 4 * v26);
        v30 = (unsigned __int16 *)(v17 + 2 * v26);
        do
        {
          v31 = *v30++;
          *v29++ = *(_DWORD *)(v19 + 4 * v31);
          --v28;
        }
        while (v28);
      }
      ++v22;
    }
    while (v22 != v21);
  }
  v32 = *(unsigned int *)(v13 + 16);
  if ((int)v32 >= 1)
  {
    v33 = 0;
    v34 = *(_QWORD *)(v13 + 120);
    v35 = (float *)(v34 + 24);
    do
    {
      v36 = (unint64_t *)(v34 + 40 * v33);
      v37 = *v36;
      v38 = v36[1];
      if (v37 < v38)
      {
        v39 = *(_QWORD *)(v34 + 40 * v33 + 32);
        do
        {
          if (v39)
          {
            v40 = *(float *)(v19 + 4 * *(unsigned __int16 *)(v17 + 2 * v37));
            v41 = v39;
            v42 = v35;
            do
            {
              v43 = v40;
              if (v40 == *(v42 - 2))
                v43 = *v42;
              *(float *)(v12 + 4 * v37) = v43;
              ++v42;
              --v41;
            }
            while (v41);
          }
          ++v37;
        }
        while (v37 != v38);
      }
      ++v33;
      v35 += 10;
    }
    while (v33 != v32);
  }
  v44 = *(unsigned int *)(v13 + 52);
  if ((int)v44 >= 1)
  {
    v45 = 0;
    v46 = *(_QWORD *)(v13 + 192);
    do
    {
      v47 = (unint64_t *)(v46 + 16 * v45);
      v48 = *v47;
      v49 = v47[1];
      if (v48 < v49)
      {
        v50 = (float *)(v12 + 4 * v48);
        do
        {
          v51 = v8;
          v52 = v10;
          v53 = v50;
          if (v8 >= 1)
          {
            do
            {
              v54 = *v52++;
              *v53++ = (float)v54;
              --v51;
            }
            while (v51);
          }
          ++v48;
          ++v50;
        }
        while (v48 != v49);
      }
      ++v45;
    }
    while (v45 != v44);
  }
  v55 = *(int *)(v13 + 20);
  if ((_DWORD)v55)
  {
    v56 = 0;
    v57 = *(_QWORD *)(v13 + 128);
    v58 = (float *)(v57 + 36);
    do
    {
      v59 = (unint64_t *)(v57 + 72 * v56);
      v60 = *v59;
      v61 = v59[1];
      if (v60 < v61)
      {
        v62 = v57 + 72 * v56;
        v63 = *(_QWORD *)(v62 + 64);
        v64 = (float *)(v62 + 56);
        do
        {
          if (v63)
          {
            v65 = *(float *)(v20 + 4 * *(unsigned __int16 *)(v17 + 2 * v60));
            v66 = v63;
            v67 = v58;
            do
            {
              v68 = v65;
              if (v65 == *(v67 - 5))
                v68 = *v67;
              if (v68 < *v64)
                v68 = *v64;
              *(float *)(v12 + 4 * v60) = v68;
              ++v67;
              --v66;
            }
            while (v66);
          }
          ++v60;
        }
        while (v60 != v61);
      }
      ++v56;
      v58 += 18;
    }
    while (v56 != v55);
  }
  v155 = v13;
  if (*(int *)(v13 + 28) >= 1)
  {
    v69 = 0;
    v70 = 0;
    v149 = CFSTR("com.apple.CoreSuggestions");
    do
    {
      v71 = (uint64_t *)(*(_QWORD *)(v18 + 152) + v69);
      v72 = *v71;
      bzero((void *)(v12 + 4 * *v71), 4 * (v71[1] - *v71));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(v18 + 152) + v69 + 40));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "isEqualToString:", CFSTR("bundle_id")))
      {
        v153 = v73;
        v74 = *(id *)(*(_QWORD *)(v18 + 152) + v69 + 16);
        objc_msgSend(v152, "bundleID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "lowercaseString");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v74, "objectForKey:", v76);
        v77 = objc_claimAutoreleasedReturnValue();
        if (!v77)
          goto LABEL_45;
        v78 = (void *)v77;
        objc_msgSend(v74, "objectForKey:", v76);
        v150 = v74;
        v79 = v72;
        v80 = v76;
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "integerValue");

        v76 = v80;
        v72 = v79;
        v74 = v150;

        if (v82 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_45:
          objc_msgSend(v152, "scoreForFeature:", 372, v149);
          v84 = v83;
          -[__CFString lowercaseString](v149, "lowercaseString");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = v76;
          v86 = objc_msgSend(v76, "isEqualToString:", v85);

          v87 = CFSTR("__third_party_none_of_the_above__");
          if ((v86 & 1) == 0)
          {
            v87 = CFSTR("__parsec_none_of_the_above__");
            if (v84 == 0.0 && (objc_msgSend(v151, "hasPrefix:", CFSTR("com.apple.parsec")) & 1) == 0)
            {
              if (objc_msgSend(v151, "hasPrefix:", CFSTR("com.apple.")))
                v87 = 0;
              else
                v87 = CFSTR("__third_party_none_of_the_above__");
            }
          }
          objc_msgSend(v74, "objectForKey:", v87);
          v88 = objc_claimAutoreleasedReturnValue();
          if (!v88
            || (v89 = (void *)v88,
                objc_msgSend(v74, "objectForKey:", v87),
                v90 = (void *)objc_claimAutoreleasedReturnValue(),
                v82 = objc_msgSend(v90, "integerValue"),
                v90,
                v89,
                v82 == 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v74, "objectForKey:", CFSTR("__none_of_the_above__"));
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v91, "integerValue");

          }
          v76 = v151;
          if (!v82)
            -[PRSDirectivesManager processL2FeatureVector:populatingValues:scoreValue:count:].cold.1();
        }

        v73 = v153;
        v18 = v155;
      }
      else if (objc_msgSend(v73, "isEqualToString:", CFSTR("device_type")))
      {
        v92 = *(id *)(*(_QWORD *)(v18 + 152) + v69 + 16);
        objc_msgSend(v152, "device_type");
        v154 = v73;
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectForKey:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v155;
        v82 = objc_msgSend(v94, "unsignedIntegerValue");

        v73 = v154;
      }
      else if (objc_msgSend(v73, "isEqualToString:", CFSTR("query_terms")))
      {
        v82 = *(int *)(*(_QWORD *)(v18 + 152) + 4 * (unint64_t)*(float *)(v20 + 1452) + v69 + 16);
      }
      else
      {
        v82 = 0;
      }
      *(_DWORD *)(v12 + 4 * (v82 + v72)) = 1065353216;

      ++v70;
      v69 += 48;
    }
    while (v70 < *(int *)(v18 + 28));
  }
  if (*(int *)(v18 + 32) >= 1)
  {
    v95 = 0;
    v96 = 0;
    do
    {
      v97 = (uint64_t *)(*(_QWORD *)(v18 + 160) + v95);
      v98 = *v97;
      v99 = v97[1];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v97[5], v149);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = *(const void **)(*(_QWORD *)(v18 + 160) + v95 + 48);
      if (objc_msgSend(v100, "isEqualToString:", CFSTR("resultset_bundle_id")))
        v102 = v101 == 0;
      else
        v102 = 1;
      if (!v102)
        memcpy((void *)(v12 + 4 * v98), v101, 4 * (v99 - v98));

      ++v96;
      v18 = v155;
      v95 += 56;
    }
    while (v96 < *(int *)(v155 + 32));
  }
  v103 = *(const void **)(v18 + 248);
  if (v103)
    memcpy((void *)(v12 + 4 * *(_QWORD *)(v18 + 200)), v103, 4 * (*(_QWORD *)(v18 + 208) - *(_QWORD *)(v18 + 200)));
  v104 = *(const void **)(v18 + 304);
  if (v104)
    memcpy((void *)(v12 + 4 * *(_QWORD *)(v18 + 264)), v104, 4 * (*(_QWORD *)(v18 + 272) - *(_QWORD *)(v18 + 264)));
  if (*(int *)(v18 + 36) >= 1)
  {
    v105 = 0;
    v106 = 0;
    do
    {
      v107 = (uint64_t *)(*(_QWORD *)(v18 + 168) + v105);
      v108 = *v107;
      v109 = v107[1];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v107[6], v149);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = *(const void **)(*(_QWORD *)(v18 + 168) + v105 + 56);
      if (objc_msgSend(v110, "isEqualToString:", CFSTR("resultset_bundle_id_score")))
        v112 = v111 == 0;
      else
        v112 = 1;
      if (!v112)
        memcpy((void *)(v12 + 4 * v108), v111, 4 * (v109 - v108));

      ++v106;
      v18 = v155;
      v105 += 64;
    }
    while (v106 < *(int *)(v155 + 36));
  }
  v113 = *(unsigned int *)(v18 + 24);
  if ((int)v113 >= 1)
  {
    v114 = 0;
    v115 = *(_QWORD *)(v18 + 144);
    v116 = (float *)(v115 + 36);
    do
    {
      v117 = (unint64_t *)(v115 + (v114 << 6));
      v118 = *v117;
      v119 = v117[1];
      if (*v117 < v119)
      {
        v120 = v117[7];
        do
        {
          if (v120)
          {
            v121 = *(float *)(v20 + 4 * *(unsigned __int16 *)(v17 + 2 * v118));
            v122 = v120;
            v123 = v116;
            do
            {
              v124 = v121;
              if (v121 == *(v123 - 5))
                v124 = *v123;
              *(float *)(v12 + 4 * v118) = v124;
              ++v123;
              --v122;
            }
            while (v122);
          }
          ++v118;
        }
        while (v118 != v119);
      }
      ++v114;
      v116 += 16;
    }
    while (v114 != v113);
  }
  v125 = *(unsigned int *)(v18 + 40);
  if ((int)v125 >= 1)
  {
    v126 = 0;
    v127 = *(_QWORD *)(v18 + 136);
    do
    {
      v128 = (unint64_t *)(v127 + 24 * v126);
      v130 = *v128;
      v129 = v128[1];
      v27 = v129 > v130;
      v131 = v129 - v130;
      if (v27)
      {
        v132 = (float *)(v12 + 4 * v130);
        v133 = (unsigned __int16 *)(v17 + 2 * v130);
        do
        {
          v134 = *v133++;
          v135 = *(float *)(v20 + 4 * v134);
          if (v135 == -1.0)
            v135 = *(float *)(v127 + 24 * v126 + 16);
          *v132++ = v135;
          --v131;
        }
        while (v131);
      }
      ++v126;
    }
    while (v126 != v125);
  }
  v136 = *(void **)(v18 + 320);
  if (v136)
  {
    v156[0] = MEMORY[0x1E0C809B0];
    v156[1] = 3221225472;
    v156[2] = __81__PRSDirectivesManager_processL2FeatureVector_populatingValues_scoreValue_count___block_invoke;
    v156[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
    v156[4] = v12;
    objc_msgSend(v136, "enumerateIndexesUsingBlock:", v156);
  }
  v137 = *(unsigned int *)(v18 + 44);
  if ((int)v137 >= 1)
  {
    v138 = 0;
    v139 = *(_QWORD *)(v18 + 176);
    do
    {
      v140 = (unint64_t *)(v139 + 16 * v138);
      v142 = *v140;
      v141 = v140[1];
      v27 = v141 > v142;
      v143 = v141 - v142;
      if (v27)
      {
        v144 = (float *)(v12 + 4 * v142);
        v145 = (unsigned __int16 *)(v17 + 2 * v142);
        do
        {
          v146 = *v145++;
          v147 = *(float *)(v20 + 4 * v146);
          if (v147 <= 0.0)
            v148 = 0.0;
          else
            v148 = 1.0 / v147;
          *v144++ = v148;
          --v143;
        }
        while (v143);
      }
      ++v138;
    }
    while (v138 != v137);
  }
  if (processL2FeatureVector_populatingValues_scoreValue_count__onceToken != -1)
    dispatch_once(&processL2FeatureVector_populatingValues_scoreValue_count__onceToken, &__block_literal_global_270);

}

uint64_t __81__PRSDirectivesManager_processL2FeatureVector_populatingValues_scoreValue_count___block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 4 * a2) = 0;
  return result;
}

uint64_t __81__PRSDirectivesManager_processL2FeatureVector_populatingValues_scoreValue_count___block_invoke_2()
{
  objc_msgSend(CFSTR("com.apple.searchd"), "UTF8String");
  return os_variant_has_internal_diagnostics();
}

- (PRSL2FeatureVectorProcessingContext)processingContext
{
  return self->_processingContext;
}

- (void)setProcessingContext:(id)a3
{
  objc_storeStrong((id *)&self->_processingContext, a3);
}

- (double)weightX
{
  return self->_weightX;
}

- (void)setWeightX:(double)a3
{
  self->_weightX = a3;
}

- (double)weightY
{
  return self->_weightY;
}

- (void)setWeightY:(double)a3
{
  self->_weightY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingContext, 0);
  objc_storeStrong((id *)&self->mapInflatedIndexToSize, 0);
  objc_storeStrong((id *)&self->disabledFeatureIndices, 0);
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.1()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 944, "i*bundlesPerFeature+bundleIndex < expandedSize");
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.2()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 850, "expandedSize >= ((directive_local_resultset_id_values_mapping.end_idx - directive_local_resultset_id_values_mapping.start_idx) * sizeof(prs_ranking_score_t))");
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.3()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 874, "i*bundlesPerFeature+bundleIndex < expandedSize");
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.4()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 827, "index < mapping.allKeys.count");
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.5()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 792, "index < mapping.allKeys.count");
}

- (void)processResultSetValuesWithMap:serverFeatures:.cold.6()
{
  __assert_rtn("-[PRSDirectivesManager processResultSetValuesWithMap:serverFeatures:]", "PRSDirectivesManager.m", 775, "index < mapping.allKeys.count");
}

- (void)processL2FeatureVector:populatingValues:scoreValue:count:.cold.1()
{
  __assert_rtn("-[PRSDirectivesManager processL2FeatureVector:populatingValues:scoreValue:count:]", "PRSDirectivesManager.m", 1065, "index != 0");
}

@end
