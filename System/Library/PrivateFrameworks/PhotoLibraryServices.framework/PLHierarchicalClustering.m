@implementation PLHierarchicalClustering

- (PLHierarchicalClustering)init
{
  PLHierarchicalClustering *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLHierarchicalClustering;
  result = -[PLHierarchicalClustering init](&v3, sel_init);
  if (result)
  {
    result->_threshold = 0.5;
    result->_k = 2;
    result->_linkage = 0;
    result->_usesSortedDataRelativeDistanceCache = 0;
    result->_reportsProgressInDistancesMatrixCalculation = 0;
  }
  return result;
}

- (unint64_t)_clustroidIndexForClusters:(unint64_t *)a3 numberOfObjects:(unint64_t)a4 distances:(double *)a5 relativeDistanceCache:(double *)a6
{
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  double v20;

  if (!a3)
    return 0x7FFFFFFFLL;
  v6 = 0;
  if (a4)
  {
    v7 = 0;
    v8 = 0.0;
    v9 = 3.40282347e38;
    do
    {
      v10 = a3[v7];
      if (self->_usesSortedDataRelativeDistanceCache)
      {
        v11 = 0.0;
        v12 = a3;
        v13 = a4;
        do
        {
          v14 = *v12++;
          v15 = a6[v10] - a6[v14];
          if (v15 < 0.0)
            v15 = -v15;
          if (v15 > v8)
            v8 = v15;
          v11 = v11 + v15;
          --v13;
        }
        while (v13);
      }
      else
      {
        v11 = 0.0;
        v16 = a3;
        v17 = a4;
        do
        {
          v18 = *v16++;
          v19 = a5[v10][v18];
          if (v19 > v8)
            v8 = v19;
          v11 = v11 + v19;
          --v17;
        }
        while (v17);
      }
      v20 = v11 / (double)a4;
      if (v20 < v9)
      {
        v9 = v20;
        v6 = a3[v7];
      }
      ++v7;
    }
    while (v7 != a4);
  }
  else
  {
    v8 = 0.0;
  }
  if (v8 <= self->_threshold)
    return v6;
  else
    return 0x7FFFFFFFLL;
}

- (double)_createRelativeDistanceCacheForDataset:(id)a3
{
  id v4;
  size_t v5;
  double *v6;
  uint64_t i;
  double (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (double *)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  *v6 = 0.0;
  if (v5 >= 2)
  {
    for (i = 1; i != v5; ++i)
    {
      -[PLDataClustering distanceBlock](self, "distanceBlock");
      v8 = (double (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[i] = ((double (**)(_QWORD, void *, void *))v8)[2](v8, v9, v10);

    }
  }

  return v6;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  double *v14;
  void *v15;
  void **v16;
  unint64_t v17;
  unint64_t i;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t j;
  unint64_t k;
  unsigned __int8 *v23;
  void **v24;
  PLHierarchicalClustering *v25;
  unint64_t linkage;
  unint64_t v27;
  unint64_t v28;
  double v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  double v48;
  unint64_t n;
  double v50;
  unint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  _QWORD *v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  double v76;
  unint64_t v77;
  _QWORD *v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  uint64_t (**v93)(_QWORD, _QWORD);
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  double v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  BOOL v104;
  uint64_t v105;
  unint64_t v106;
  double threshold;
  unint64_t v108;
  _QWORD *v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  double *v113;
  uint64_t v114;
  const void *v115;
  const void *v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  const void *v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  void (**v135)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v136;
  unint64_t m;
  void *v138;
  double v139;
  void *v140;
  void **v141;
  void **v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void **v150;
  uint64_t v151;
  void *v152;
  uint64_t v154;
  uint64_t ii;
  _QWORD *v156;
  void *v157;
  unint64_t v158;
  void *v159;
  void *v160;
  uint64_t jj;
  _QWORD *v162;
  void *v163;
  unint64_t v164;
  void *v165;
  void *v166;
  unint64_t kk;
  void *v168;
  void *v169;
  uint64_t v170;
  void **v171;
  void **v172;
  id *v173;
  void *v174;
  int v175;
  unint64_t v176;
  void *v177;
  PLHierarchicalClustering *v178;
  double (**v179)(_QWORD, _QWORD, _QWORD);
  id v180;
  void *v181;
  uint64_t v182;
  unint64_t v183;
  _QWORD *v184;
  unsigned __int8 *v185;
  unint64_t v186;
  unint64_t v187;
  unint64_t v188;
  _QWORD *v189;
  unint64_t v190;
  _BOOL4 usesSortedDataRelativeDistanceCache;
  void *v192;
  unint64_t v193;
  double **v194;
  _QWORD v195[4];
  _QWORD v196[3];
  uint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  char v200;

  v6 = a3;
  v180 = a4;
  v197 = 0;
  v198 = &v197;
  v199 = 0x2020000000;
  v200 = 0;
  v7 = (void *)MEMORY[0x1E0CB38A8];
  v8 = objc_msgSend(v6, "count");
  if (v8 - self->_k + 2 <= 1)
    v9 = 1;
  else
    v9 = v8 - self->_k + 2;
  objc_msgSend(v7, "progressWithTotalUnitCount:", v9);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v181, "totalUnitCount");
  -[PLDataClustering distanceBlock](self, "distanceBlock");
  v179 = (double (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v180 && self->_reportsProgressInDistancesMatrixCalculation)
  {
    v195[0] = MEMORY[0x1E0C809B0];
    v195[1] = 3221225472;
    v195[2] = __61__PLHierarchicalClustering_performWithDataset_progressBlock___block_invoke;
    v195[3] = &unk_1E3671A18;
    v11 = v195;
    v173 = (id *)v196;
    v12 = v180;
    *(double *)&v196[2] = 1.0 / (double)v10;
    v196[0] = v12;
    v196[1] = &v197;
    v175 = 1;
  }
  else
  {
    v175 = 0;
    v11 = 0;
  }
  v13 = MEMORY[0x19AEC174C](v11);
  v178 = self;
  usesSortedDataRelativeDistanceCache = self->_usesSortedDataRelativeDistanceCache;
  v174 = (void *)v13;
  if (!self->_usesSortedDataRelativeDistanceCache)
  {
    v194 = -[PLDataClustering createDistancesMatrixForDataset:progressBlock:](self, "createDistancesMatrixForDataset:progressBlock:", v6, v13);
    if (!*((_BYTE *)v198 + 24))
    {
      v14 = 0;
      goto LABEL_15;
    }
    -[PLDataClustering freeDistancesMatrix:forDataset:](self, "freeDistancesMatrix:forDataset:", v194, v6);
LABEL_13:
    v15 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_281;
  }
  if (*((_BYTE *)v198 + 24))
    goto LABEL_13;
  v14 = -[PLHierarchicalClustering _createRelativeDistanceCacheForDataset:](self, "_createRelativeDistanceCacheForDataset:", v6);
  v194 = 0;
LABEL_15:
  v192 = v6;
  v16 = (void **)malloc_type_calloc(8uLL, objc_msgSend(v6, "count", v173, v174), 0xC444E7BEuLL);
  v17 = objc_msgSend(v6, "count");
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    v19 = malloc_type_calloc(8uLL, 1uLL, 0x19BDE57uLL);
    v16[i] = v19;
    *v19 = i;
  }
  v20 = malloc_type_calloc(8uLL, objc_msgSend(v6, "count"), 0xBE8B73B8uLL);
  for (j = 0; j < objc_msgSend(v6, "count"); ++j)
    v20[j] = 1;
  v184 = malloc_type_calloc(8uLL, objc_msgSend(v6, "count"), 0xF7CA9C21uLL);
  for (k = 0; k < objc_msgSend(v6, "count"); ++k)
    v184[k] = k;
  v23 = (unsigned __int8 *)malloc_type_calloc(1uLL, objc_msgSend(v6, "count"), 0x990CF440uLL);
  v177 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
  objc_msgSend(v181, "setCompletedUnitCount:", objc_msgSend(v181, "completedUnitCount") + 1);
  if (v180)
  {
    objc_msgSend(v181, "fractionCompleted");
    (*((void (**)(id, uint64_t *))v180 + 2))(v180, v198 + 3);
  }
  if (*((_BYTE *)v198 + 24))
  {
    if (v17)
    {
      v24 = v16;
      do
      {
        if (*v24)
          free(*v24);
        ++v24;
        --v17;
      }
      while (v17);
    }
    else if (!v16)
    {
LABEL_246:
      if (v20)
        free(v20);
      if (v184)
        free(v184);
      if (v23)
        free(v23);
      if (!usesSortedDataRelativeDistanceCache)
        -[PLDataClustering freeDistancesMatrix:forDataset:](v178, "freeDistancesMatrix:forDataset:", v194, v6);
      goto LABEL_277;
    }
    free(v16);
    goto LABEL_246;
  }
  v176 = v17 - 1;
  v185 = v23;
  while (2)
  {
    v25 = v178;
    v193 = v17;
    v189 = v20;
    if (v17 <= v178->_k)
      goto LABEL_286;
    linkage = v178->_linkage;
    switch(linkage)
    {
      case 0uLL:
        v27 = v178->_linkage;
        v28 = v27;
        v29 = 3.40282347e38;
        while (1)
        {
          v30 = v16[linkage];
          if (!v30)
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 255, "clustersIndices[i] != NULL");
          v31 = linkage++;
          if (linkage < v17)
            break;
LABEL_66:
          if (linkage == v17)
            goto LABEL_153;
        }
        v32 = linkage;
        while (!v16[v32])
        {
LABEL_65:
          if (++v32 == v17)
            goto LABEL_66;
        }
        v33 = v20[v31];
        if (usesSortedDataRelativeDistanceCache)
        {
          if (v33)
          {
            v34 = 0;
            v35 = 0.0;
            do
            {
              if (v20[v32])
              {
                v36 = (uint64_t *)v16[v32];
                v37 = v20[v32];
                do
                {
                  v38 = *v36++;
                  v39 = v14[v30[v34]] - v14[v38];
                  if (v39 < 0.0)
                    v39 = -v39;
                  if (v39 > v35)
                    v35 = v39;
                  --v37;
                }
                while (v37);
              }
              ++v34;
            }
            while (v34 != v33);
            goto LABEL_63;
          }
        }
        else if (v33)
        {
          v40 = 0;
          v35 = 0.0;
          do
          {
            if (v20[v32])
            {
              v41 = (uint64_t *)v16[v32];
              v42 = v20[v32];
              do
              {
                v43 = *v41++;
                v44 = v194[v30[v40]][v43];
                if (v44 > v35)
                  v35 = v44;
                --v42;
              }
              while (v42);
            }
            ++v40;
          }
          while (v40 != v33);
          goto LABEL_63;
        }
        v35 = 0.0;
LABEL_63:
        if (v35 < v29)
        {
          v29 = v35;
          v28 = v31;
          v27 = v32;
        }
        goto LABEL_65;
      case 1uLL:
        v77 = 0;
        v27 = 0;
        v28 = 0;
        v29 = 3.40282347e38;
        while (1)
        {
          v78 = v16[v77];
          if (!v78)
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 317, "clustersIndices[i] != NULL");
          v79 = v77++;
          if (v77 < v17)
            break;
LABEL_152:
          if (v77 == v17)
            goto LABEL_153;
        }
        v80 = v77;
        while (!v16[v80])
        {
LABEL_151:
          if (++v80 == v17)
            goto LABEL_152;
        }
        v81 = v20[v79];
        if (usesSortedDataRelativeDistanceCache)
        {
          if (v81)
          {
            v82 = 0;
            v83 = 0.0;
            do
            {
              if (v20[v80])
              {
                v84 = (uint64_t *)v16[v80];
                v85 = v20[v80];
                do
                {
                  v86 = *v84++;
                  v87 = v14[v78[v82]] - v14[v86];
                  if (v87 < 0.0)
                    v87 = -v87;
                  v83 = v83 + v87;
                  --v85;
                }
                while (v85);
              }
              ++v82;
            }
            while (v82 != v81);
            goto LABEL_149;
          }
        }
        else if (v81)
        {
          v88 = 0;
          v83 = 0.0;
          do
          {
            if (v20[v80])
            {
              v89 = (uint64_t *)v16[v80];
              v90 = v20[v80];
              do
              {
                v91 = *v89++;
                v83 = v83 + v194[v78[v88]][v91];
                --v90;
              }
              while (v90);
            }
            ++v88;
          }
          while (v88 != v81);
          goto LABEL_149;
        }
        v83 = 0.0;
LABEL_149:
        v92 = v83 / (double)(unint64_t)(v20[v80] * v81);
        if (v92 < v29)
        {
          v29 = v92;
          v28 = v79;
          v27 = v80;
        }
        goto LABEL_151;
      case 2uLL:
        v51 = 0;
        v27 = 0;
        v28 = 0;
        v29 = 3.40282347e38;
        break;
      case 3uLL:
        if (usesSortedDataRelativeDistanceCache)
        {
          v67 = 0;
          v68 = 0;
          v69 = 0;
          v70 = 3.40282347e38;
          v71 = v184;
          v72 = v17;
          v73 = v17;
          do
          {
            v74 = v67 + 1;
            if (v67 + 1 < v72)
            {
              v75 = 1;
              do
              {
                v76 = v14[v184[v67]] - v14[v71[v75]];
                if (v76 < 0.0)
                  v76 = -v76;
                if (v76 < v70)
                {
                  v70 = v76;
                  v69 = v67;
                  v68 = v67 + v75;
                }
                ++v75;
              }
              while (v73 != v75);
            }
            --v73;
            ++v71;
            ++v67;
            v72 = v17;
          }
          while (v74 != v17);
        }
        else
        {
          v108 = 0;
          v68 = 0;
          v69 = 0;
          v70 = 3.40282347e38;
          v109 = v184;
          v110 = v17;
          v111 = v17;
          do
          {
            v112 = v108 + 1;
            if (v108 + 1 < v110)
            {
              v114 = 1;
              do
              {
                v113 = v194[v184[v108]];
                if (v113[v109[v114]] < v70)
                {
                  v70 = v113[v109[v114]];
                  v69 = v108;
                  v68 = v108 + v114;
                }
                ++v114;
              }
              while (v111 != v114);
            }
            --v111;
            ++v109;
            ++v108;
            v110 = v17;
          }
          while (v112 != v17);
        }
        v115 = v16[v69];
        if (v115 && (v116 = v16[v68]) != 0)
        {
          v117 = v68;
          v118 = v69;
          v119 = v189[v69];
          v187 = v117;
          v120 = v189[v117];
          if (v120 + v119)
          {
            v121 = (char *)malloc_type_calloc(8uLL, v120 + v119, 0xD933F80FuLL);
            memcpy(v121, v115, 8 * v119);
            memcpy(&v121[8 * v119], v116, 8 * v120);
          }
          else
          {
            v121 = 0;
          }
          v68 = v187;
          v69 = v118;
        }
        else
        {
          v121 = 0;
        }
        v20 = v189;
        v122 = -[PLHierarchicalClustering _clustroidIndexForClusters:numberOfObjects:distances:relativeDistanceCache:](v178, "_clustroidIndexForClusters:numberOfObjects:distances:relativeDistanceCache:", v121, v189[v68] + v189[v69], v194, v14, v70);
        if (v122 == 0x7FFFFFFF)
        {
          v25 = v178;
          if (v121)
            free(v121);
          goto LABEL_286;
        }
        v184[v69] = v122;
        if (v193 < 2)
        {
          v124 = 0;
          v127 = v184;
LABEL_197:
          free(v127);
          goto LABEL_198;
        }
        v123 = malloc_type_calloc(8uLL, v193 - 1, 0x80B826BFuLL);
        v124 = v123;
        v125 = 0;
        v126 = 0;
        do
        {
          if (v68 != v125)
            v123[v126++] = v184[v125];
          ++v125;
        }
        while (v193 != v125);
        v127 = v184;
        if (v184)
          goto LABEL_197;
LABEL_198:
        if (v121)
          free(v121);
        v184 = v124;
LABEL_201:
        if (v69 == v68)
LABEL_341:
          __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 474, "idx1 != idx2");
        v128 = v16[v69];
        if (v128)
        {
          v129 = v16[v68];
          if (v129)
          {
            v130 = v68;
            v131 = v69;
            v132 = v189[v69];
            v188 = v130;
            v133 = v189[v130];
            if (v133 + v132)
            {
              v134 = (char *)malloc_type_calloc(8uLL, v133 + v132, 0xD933F80FuLL);
              memcpy(v134, v128, 8 * v132);
              memcpy(&v134[8 * v132], v129, 8 * v133);
              v69 = v131;
              v128 = v16[v131];
              v68 = v188;
              v20 = v189;
              v23 = v185;
              if (!v128)
                goto LABEL_211;
            }
            else
            {
              v134 = 0;
              v68 = v130;
              v20 = v189;
              v69 = v131;
            }
          }
          else
          {
            v134 = 0;
            v20 = v189;
          }
          free(v128);
        }
        else
        {
          v134 = 0;
        }
LABEL_211:
        v16[v69] = v134;
        v20[v69] += v20[v68];
        if (v178->_linkage != 4)
        {
          v140 = v16[v68];
          if (v140)
            free(v140);
          if (v193 < 2)
          {
            v142 = 0;
          }
          else
          {
            v141 = (void **)malloc_type_calloc(8uLL, v193 - 1, 0x47D17044uLL);
            v142 = v141;
            v143 = 0;
            v144 = 0;
            v20 = v189;
            do
            {
              if (v68 != v143)
                v141[v144++] = v16[v143];
              ++v143;
            }
            while (v193 != v143);
            if (!v16)
            {
LABEL_230:
              if (v193 < 2)
              {
                v146 = 0;
                if (v20)
                  goto LABEL_236;
              }
              else
              {
                v145 = malloc_type_calloc(8uLL, v193 - 1, 0x80B826BFuLL);
                v146 = v145;
                v147 = 0;
                v148 = 0;
                v20 = v189;
                do
                {
                  if (v68 != v147)
                    v145[v148++] = v189[v147];
                  ++v147;
                }
                while (v193 != v147);
                if (v189)
LABEL_236:
                  free(v20);
              }
              v189 = v146;
              v16 = v142;
              goto LABEL_238;
            }
          }
          free(v16);
          goto LABEL_230;
        }
        v23[v68] = 1;
        -[PLDataClustering clusterConsolidationBlock](v178, "clusterConsolidationBlock");
        v135 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void **, unint64_t, _QWORD, void *))v135)[2](v135, v16, v69, v20[v69], v192);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "setObject:atIndexedSubscript:", v136, v69);
        for (m = 0; m < objc_msgSend(v192, "count"); ++m)
        {
          if (v69 != m && !(v23[m] | usesSortedDataRelativeDistanceCache))
          {
            objc_msgSend(v177, "objectAtIndexedSubscript:", m);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = ((double (**)(_QWORD, void *, void *))v179)[2](v179, v136, v138);
            v194[v69][m] = v139;
            v194[m][v69] = v139;

          }
        }

LABEL_238:
        objc_msgSend(v181, "setCompletedUnitCount:", objc_msgSend(v181, "completedUnitCount") + 1);
        if (v180)
        {
          objc_msgSend(v181, "fractionCompleted");
          (*((void (**)(id, uint64_t *))v180 + 2))(v180, v198 + 3);
        }
        v17 = v193 - 1;
        --v176;
        v20 = v189;
        v23 = v185;
        if (*((_BYTE *)v198 + 24))
        {
          if (v178->_linkage == 4)
          {
            v149 = objc_msgSend(v192, "count");
            if (v149)
            {
              v150 = v16;
              do
              {
                if (*v150)
                  free(*v150);
                ++v150;
                --v149;
              }
              while (v149);
              goto LABEL_268;
            }
LABEL_267:
            if (v16)
              goto LABEL_268;
          }
          else
          {
            if (v193 == 1)
              goto LABEL_267;
            v151 = 0;
            do
            {
              v152 = v16[v151];
              if (v152)
                free(v152);
              ++v151;
            }
            while (v17 != v151);
LABEL_268:
            free(v16);
          }
          if (v189)
            free(v189);
          if (v184)
            free(v184);
          if (v185)
            free(v185);
          if (!usesSortedDataRelativeDistanceCache)
            -[PLDataClustering freeDistancesMatrix:forDataset:](v178, "freeDistancesMatrix:forDataset:", v194, v192);
LABEL_277:
          v15 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_278;
        }
        continue;
      case 4uLL:
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 3.40282347e38;
        while (v47 < objc_msgSend(v192, "count"))
        {
          if (!v16[v47])
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 222, "clustersIndices[i] != NULL");
          for (n = v47 + 1; n < objc_msgSend(v192, "count"); ++n)
          {
            if (v16[n] && !v23[v47] && !v23[n])
            {
              v50 = usesSortedDataRelativeDistanceCache ? 3.40282347e38 : v194[v47][n];
              if (v50 < v48)
              {
                v48 = v50;
                v45 = v47;
                v46 = n;
              }
            }
          }
          ++v47;
        }
        v25 = v178;
        if (v48 > v178->_threshold)
          goto LABEL_286;
        v68 = v46;
        v69 = v45;
        goto LABEL_201;
      case 5uLL:
        -[PLDataClustering clusterKeyElementBlock](v178, "clusterKeyElementBlock");
        v93 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v94 = 0;
        v95 = 0;
        v96 = 0;
        v97 = 3.40282347e38;
        v98 = v176;
        do
        {
          if (!v16[v94])
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 190, "clustersIndices[i] != NULL");
          v99 = v94;
          v190 = v96;
          v100 = v94 + 1;
          v182 = v94 + 1;
          v183 = v98;
          if (v94 + 1 < v193)
          {
            do
            {
              if (v16[v100])
              {
                if (usesSortedDataRelativeDistanceCache)
                {
                  v101 = 3.40282347e38;
                }
                else
                {
                  v186 = v95;
                  v102 = v99;
                  v103 = ((uint64_t (**)(_QWORD, void **))v93)[2](v93, v16);
                  v101 = v194[v103][((uint64_t (*)(uint64_t (**)(_QWORD, _QWORD), void **, unint64_t, _QWORD, void *))v93[2])(v93, v16, v100, v189[v100], v192)];
                  v23 = v185;
                  v95 = v186;
                  v99 = v102;
                }
                v104 = v101 < v97;
                if (v101 < v97)
                  v97 = v101;
                v105 = v190;
                if (v104)
                  v105 = v99;
                v190 = v105;
                if (v104)
                  v95 = v100;
              }
              ++v100;
              --v98;
            }
            while (v98);
          }
          v94 = v182;
          v98 = v183 - 1;
          v96 = v190;
        }
        while (v182 != v193);
        v106 = v95;
        v25 = v178;
        threshold = v178->_threshold;

        v20 = v189;
        if (v97 > threshold)
          goto LABEL_286;
        v68 = v106;
        v69 = v190;
        goto LABEL_201;
      default:
        goto LABEL_341;
    }
    break;
  }
  do
  {
    v52 = v16[v51];
    if (!v52)
      __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 366, "clustersIndices[i] != NULL");
    v53 = v51++;
    if (v51 < v17)
    {
      v54 = v51;
      while (!v16[v54])
      {
LABEL_112:
        if (++v54 == v17)
          goto LABEL_113;
      }
      v55 = v20[v53];
      if (usesSortedDataRelativeDistanceCache)
      {
        if (v55)
        {
          v56 = 0;
          v57 = 3.40282347e38;
          do
          {
            if (v20[v54])
            {
              v58 = (uint64_t *)v16[v54];
              v59 = v20[v54];
              do
              {
                v60 = *v58++;
                v61 = v14[v52[v56]] - v14[v60];
                if (v61 < 0.0)
                  v61 = -v61;
                if (v61 < v57)
                  v57 = v61;
                --v59;
              }
              while (v59);
            }
            ++v56;
          }
          while (v56 != v55);
          goto LABEL_110;
        }
      }
      else if (v55)
      {
        v62 = 0;
        v57 = 3.40282347e38;
        do
        {
          if (v20[v54])
          {
            v63 = (uint64_t *)v16[v54];
            v64 = v20[v54];
            do
            {
              v65 = *v63++;
              v66 = v194[v52[v62]][v65];
              if (v66 < v57)
                v57 = v66;
              --v64;
            }
            while (v64);
          }
          ++v62;
        }
        while (v62 != v55);
        goto LABEL_110;
      }
      v57 = 3.40282347e38;
LABEL_110:
      if (v57 < v29)
      {
        v29 = v57;
        v28 = v53;
        v27 = v54;
      }
      goto LABEL_112;
    }
LABEL_113:
    ;
  }
  while (v51 != v17);
LABEL_153:
  v25 = v178;
  if (v29 <= v178->_threshold)
  {
    v68 = v27;
    v69 = v28;
    goto LABEL_201;
  }
LABEL_286:
  if (v25->_linkage == 4)
  {
    v154 = objc_msgSend(v192, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v154);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v154)
    {
      for (ii = 0; ii != v154; ++ii)
      {
        if (!v185[ii])
        {
          v156 = v16[ii];
          if (!v156)
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 551, "clustersIndicesIndex != NULL");
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v20[ii]);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20[ii])
          {
            v158 = 0;
            do
            {
              objc_msgSend(v192, "objectAtIndexedSubscript:", v156[v158]);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "addObject:", v159);

              ++v158;
            }
            while (v158 < v189[ii]);
          }
          +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v157);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v160);

          v20 = v189;
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v193);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v193)
    {
      for (jj = 0; jj != v193; ++jj)
      {
        v162 = v16[jj];
        if (!v162)
          __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 568, "clustersIndicesIndex != NULL");
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v189[jj]);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        if (v189[jj])
        {
          v164 = 0;
          do
          {
            objc_msgSend(v192, "objectAtIndexedSubscript:", v162[v164]);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "addObject:", v165);

            ++v164;
          }
          while (v164 < v189[jj]);
        }
        +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v163);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v166);

      }
      v20 = v189;
    }
  }
  if (v178->_linkage == 3)
  {
    for (kk = 0; kk < objc_msgSend(v15, "count"); ++kk)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", kk);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "objectAtIndexedSubscript:", v184[kk]);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "setClustroid:", v169);

    }
  }
  objc_msgSend(v181, "setCompletedUnitCount:", objc_msgSend(v181, "totalUnitCount"));
  if (v180)
  {
    objc_msgSend(v181, "fractionCompleted");
    (*((void (**)(id, uint64_t *))v180 + 2))(v180, v198 + 3);
  }
  if (v178->_linkage == 4)
  {
    v170 = objc_msgSend(v192, "count");
    if (v170)
    {
      v171 = v16;
      do
      {
        if (*v171)
          free(*v171);
        ++v171;
        --v170;
      }
      while (v170);
      goto LABEL_325;
    }
LABEL_324:
    if (v16)
      goto LABEL_325;
  }
  else
  {
    if (!v193)
      goto LABEL_324;
    v172 = v16;
    do
    {
      if (*v172)
        free(*v172);
      ++v172;
      --v193;
    }
    while (v193);
LABEL_325:
    free(v16);
  }
  if (v20)
    free(v20);
  if (v184)
    free(v184);
  if (v185)
    free(v185);
  if (!usesSortedDataRelativeDistanceCache)
    -[PLDataClustering freeDistancesMatrix:forDataset:](v178, "freeDistancesMatrix:forDataset:", v194, v192);
LABEL_278:
  if (v14)
    free(v14);

  v6 = v192;
LABEL_281:

  if (v175)
  _Block_object_dispose(&v197, 8);

  return v15;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (unint64_t)k
{
  return self->_k;
}

- (void)setK:(unint64_t)a3
{
  self->_k = a3;
}

- (unint64_t)linkage
{
  return self->_linkage;
}

- (void)setLinkage:(unint64_t)a3
{
  self->_linkage = a3;
}

- (BOOL)usesSortedDataRelativeDistanceCache
{
  return self->_usesSortedDataRelativeDistanceCache;
}

- (void)setUsesSortedDataRelativeDistanceCache:(BOOL)a3
{
  self->_usesSortedDataRelativeDistanceCache = a3;
}

- (BOOL)reportsProgressInDistancesMatrixCalculation
{
  return self->_reportsProgressInDistancesMatrixCalculation;
}

- (void)setReportsProgressInDistancesMatrixCalculation:(BOOL)a3
{
  self->_reportsProgressInDistancesMatrixCalculation = a3;
}

uint64_t __61__PLHierarchicalClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) * a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a2;
  return result;
}

@end
