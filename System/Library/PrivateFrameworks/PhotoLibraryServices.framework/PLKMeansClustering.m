@implementation PLKMeansClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  return -[PLKMeansClustering _performWithDataset:numericData:progressBlock:](self, "_performWithDataset:numericData:progressBlock:", a3, 0, a4);
}

- (id)_performWithDataset:(id)a3 numericData:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, double);
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  double *v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  unint64_t k;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  double v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  double v32;
  double *v33;
  double v34;
  double *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  char *v42;
  void *v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  unint64_t v48;
  unsigned int v49;
  double v50;
  double *v51;
  double v52;
  double *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int v60;
  uint64_t v61;
  double *v62;
  double *v63;
  uint64_t v64;
  double v65;
  int v66;
  unint64_t v67;
  double *v68;
  uint64_t v69;
  unsigned int v70;
  BOOL v72;
  int v73;
  uint64_t v74;
  unsigned int v75;
  uint32_t v76;
  BOOL v77;
  id v78;
  int v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t kk;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  double *v95;
  double v96;
  double *v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  unint64_t v102;
  id v103;
  void *i;
  void *v105;
  uint64_t v106;
  uint64_t j;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t m;
  void *v115;
  NSObject *v116;
  id v118;
  void *n;
  void *v120;
  uint64_t v121;
  uint64_t ii;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t jj;
  void *v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  unsigned int *v136;
  uint64_t v137;
  unsigned int v138;
  void (**v139)(_QWORD, _QWORD, double);
  uint64_t __n;
  uint32_t __upper_bound;
  PLKMeansClustering *v142;
  uint64_t v143;
  void *v144;
  double *v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint64_t v155;
  uint8_t v156[128];
  uint8_t buf[4];
  uint64_t v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x19AEC174C]();
  v12 = (void (**)(_QWORD, _QWORD, double))v11;
  if (v11)
  {
    LOBYTE(v151) = 0;
    (*(void (**)(uint64_t, __int128 *, double))(v11 + 16))(v11, &v151, 0.0);
    if ((_BYTE)v151)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_99:
        v81 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_169;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v158) = 48;
      v13 = MEMORY[0x1E0C81028];
LABEL_98:
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      goto LABEL_99;
    }
  }
  if (v9)
    objc_msgSend(v9, "firstObject");
  else
    -[PLDataClustering numericValueKeypaths](self, "numericValueKeypaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!(_DWORD)v15 || !self->_k)
  {
    if (!v12
      || (LOBYTE(v151) = 0, ((void (**)(_QWORD, __int128 *, double))v12)[2](v12, &v151, 1.0), !(_BYTE)v151))
    {
      v81 = 0;
      goto LABEL_169;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_99;
    *(_DWORD *)buf = 67109120;
    LODWORD(v158) = 54;
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_98;
  }
  if (!objc_msgSend(v8, "count"))
  {
    if (!v12)
      goto LABEL_99;
    LOBYTE(v151) = 0;
    ((void (**)(_QWORD, __int128 *, double))v12)[2](v12, &v151, 1.0);
    if (!(_BYTE)v151 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_99;
    *(_DWORD *)buf = 67109120;
    LODWORD(v158) = 60;
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_98;
  }
  v134 = v10;
  v139 = v12;
  v135 = v8;
  if (objc_msgSend(v8, "count") > self->_k)
  {
    v133 = v9;
    if (v9)
      v16 = v9;
    else
      v16 = v8;
    v17 = -[PLKMeansClustering _dataArray:featureCount:useKeypaths:](self, "_dataArray:featureCount:useKeypaths:", v16, v15, v9 == 0);
    v18 = objc_msgSend(v8, "count");
    v19 = v18;
    v136 = (unsigned int *)malloc_type_calloc(4uLL, v18, 0xAC329060uLL);
    v20 = malloc_type_calloc(4uLL, self->_k, 0x67231C3EuLL);
    v21 = (char *)malloc_type_calloc(8uLL, self->_k * v15, 0x45204A9EuLL);
    v22 = (char *)malloc_type_calloc(8uLL, self->_k * v15, 0xD989A7FEuLL);
    __upper_bound = v18;
    v18 >>= 1;
    __n = 8 * v15;
    memcpy(v22, &v17[v18 * v15], __n);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v18);
    v145 = v17;
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = self;
    k = self->_k;
    if (k < 2)
    {
LABEL_41:
      v138 = 0;
      if (v15 <= 1)
        v41 = 1;
      else
        v41 = v15;
      do
      {
        v42 = v21;
        v21 = v22;
        v17 = v145;
        if (v12)
        {
          buf[0] = 0;
          ((void (**)(_QWORD, uint8_t *, double))v12)[2](v12, buf, 0.5);
          if (buf[0])
          {
            v78 = 0;
            v79 = 1;
            v80 = v42;
            v42 = v22;
            goto LABEL_148;
          }
          k = v142->_k;
        }
        bzero(v20, 4 * k);
        v43 = v136;
        if (__upper_bound)
        {
          v44 = 0;
          v45 = 0;
          v46 = v142->_k;
          do
          {
            if (v46)
            {
              v47 = 0;
              LODWORD(v48) = 0;
              v49 = -1;
              v50 = 1.79769313e308;
              do
              {
                v51 = (double *)&v21[8 * v47];
                v52 = 0.0;
                v53 = &v145[v44];
                v54 = v41;
                do
                {
                  v55 = *v53++;
                  v56 = v55;
                  v57 = *v51++;
                  v52 = v52 + (v56 - v57) * (v56 - v57);
                  --v54;
                }
                while (v54);
                v58 = sqrt(v52);
                if (v58 < v50)
                {
                  v50 = v58;
                  v49 = v48;
                }
                v48 = (v48 + 1);
                v47 += v15;
              }
              while (v46 > v48);
            }
            else
            {
              v49 = -1;
            }
            v136[v45] = v49;
            ++*((_DWORD *)v20 + v49);
            ++v45;
            v44 += v15;
          }
          while (v45 != v19);
        }
        if (v12)
        {
          buf[0] = 0;
          ((void (**)(_QWORD, uint8_t *, double))v12)[2](v12, buf, 0.5);
          if (buf[0])
            goto LABEL_119;
        }
        bzero(v42, v142->_k * __n);
        if (__upper_bound)
        {
          v60 = 0;
          v61 = 0;
          do
          {
            v62 = &v145[v60];
            v63 = (double *)&v42[8 * v136[v61] * v15];
            v64 = v41;
            do
            {
              v65 = *v62++;
              v59 = v65 + *v63;
              *v63++ = v59;
              --v64;
            }
            while (v64);
            ++v61;
            v60 += v15;
          }
          while (v61 != v19);
        }
        if (v12)
        {
          buf[0] = 0;
          ((void (**)(_QWORD, uint8_t *, double))v12)[2](v12, buf, 0.5);
          if (buf[0])
          {
LABEL_119:
            v78 = 0;
            v79 = 1;
            v80 = v21;
            goto LABEL_151;
          }
        }
        k = v142->_k;
        if (k)
        {
          v66 = 0;
          v67 = 0;
          do
          {
            v68 = (double *)&v42[8 * v66];
            LODWORD(v59) = *((_DWORD *)v20 + v67);
            v59 = (double)*(unint64_t *)&v59;
            v69 = v41;
            do
            {
              *v68 = *v68 / v59;
              ++v68;
              --v69;
            }
            while (v69);
            v67 = (v67 + 1);
            v66 += v15;
          }
          while (k > v67);
        }
        v70 = ++v138;
        v72 = memcmp(v42, v21, k * __n) && v70 < 0x64;
        if (v12)
        {
          buf[0] = 0;
          ((void (**)(_QWORD, uint8_t *, double))v12)[2](v12, buf, 0.5);
          if (buf[0])
            goto LABEL_93;
          k = v142->_k;
        }
        if (k)
        {
          v73 = 0;
          v74 = 0;
          v75 = 1;
          do
          {
            if (!*((_DWORD *)v20 + v74))
            {
              v76 = arc4random_uniform(__upper_bound);
              memcpy(&v42[8 * v73], &v145[v76 * v15], __n);
              k = v142->_k;
              v72 = 1;
            }
            v74 = v75;
            v77 = k > v75++;
            v73 += v15;
          }
          while (v77);
        }
        v22 = v42;
        v12 = v139;
      }
      while (v72);
      if (v138 >= 0x64 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v158 = 100;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "KMeans failed to converge: max number of iterations reached: %ld", buf, 0xCu);
      }
      v43 = v136;
      if (v139)
      {
        buf[0] = 0;
        ((void (**)(_QWORD, uint8_t *, double))v139)[2](v139, buf, 0.5);
        if (buf[0])
        {
LABEL_93:
          v78 = 0;
          v79 = 1;
          v80 = v21;
          v17 = v145;
          goto LABEL_151;
        }
      }
      v102 = v142->_k;
      v103 = v135;
      v143 = v102;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v102);
      for (i = (void *)objc_claimAutoreleasedReturnValue(); (_DWORD)v102; LODWORD(v102) = v102 - 1)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(i, "addObject:", v105);

      }
      v106 = objc_msgSend(v103, "count");
      if (v106)
      {
        for (j = 0; j != v106; ++j)
        {
          objc_msgSend(i, "objectAtIndexedSubscript:", v136[j]);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "objectAtIndexedSubscript:", j);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "addObject:", v109);

        }
      }
      v144 = v103;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v143);
      v78 = (id)objc_claimAutoreleasedReturnValue();
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      v154 = 0u;
      v110 = i;
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
      if (v111)
      {
        v112 = v111;
        v113 = *(_QWORD *)v152;
        do
        {
          for (m = 0; m != v112; ++m)
          {
            if (*(_QWORD *)v152 != v113)
              objc_enumerationMutation(v110);
            +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * m));
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "addObject:", v115);

          }
          v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
        }
        while (v112);
      }

      v79 = 0;
      v80 = v21;
      v12 = v139;
      v17 = v145;
LABEL_148:
      v43 = v136;
LABEL_151:
      if (v17)
        free(v17);
      if (v43)
        free(v43);
      if (v20)
        free(v20);
      if (v42)
        free(v42);
      v8 = v135;
      if (v80)
        free(v80);
      if (!v12
        || (LOBYTE(v151) = 0,
            ((void (**)(_QWORD, __int128 *, double))v12)[2](v12, &v151, 1.0),
            !(v151 | v79)))
      {
        v78 = v78;
        v81 = v78;
        v9 = v133;
        v10 = v134;
        goto LABEL_168;
      }
      v9 = v133;
      v10 = v134;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_166:
        v81 = (id)MEMORY[0x1E0C9AA60];
LABEL_168:

        goto LABEL_169;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v158) = 287;
      v116 = MEMORY[0x1E0C81028];
    }
    else
    {
      v132 = v20;
      v24 = 1;
      v25 = 1;
      while (1)
      {
        if (v12)
        {
          buf[0] = 0;
          ((void (**)(_QWORD, uint8_t *, double))v12)[2](v12, buf, 0.5);
          if (buf[0])
            goto LABEL_133;
        }
        v137 = v24;
        if (__upper_bound)
        {
          v26 = 0;
          v27 = 0;
          v28 = -1.0;
          v29 = -1;
          do
          {
            if ((objc_msgSend(v146, "containsIndex:", v27) & 1) == 0)
            {
              if (v25)
              {
                v30 = 0;
                v31 = 0;
                v32 = 1.79769313e308;
                do
                {
                  v33 = (double *)&v22[8 * v30];
                  v34 = 0.0;
                  v35 = &v145[v26];
                  v36 = v15;
                  do
                  {
                    v37 = *v35++;
                    v38 = v37;
                    v39 = *v33++;
                    v34 = v34 + (v38 - v39) * (v38 - v39);
                    --v36;
                  }
                  while (v36);
                  v40 = sqrt(v34);
                  if (v40 < v32)
                    v32 = v40;
                  ++v31;
                  v30 += v15;
                }
                while (v31 != v25);
              }
              else
              {
                v32 = 1.79769313e308;
              }
              if (v32 > v28)
              {
                v28 = v32;
                v29 = v27;
              }
            }
            ++v27;
            v26 += v15;
          }
          while (v27 != v19);
        }
        else
        {
          v29 = -1;
          v28 = -1.0;
        }
        v12 = v139;
        if (v139)
        {
          buf[0] = 0;
          ((void (**)(_QWORD, uint8_t *, double))v139)[2](v139, buf, 0.5);
          if (buf[0])
          {
            v78 = 0;
            v79 = 1;
            v80 = v21;
            v42 = v22;
            v17 = v145;
            goto LABEL_150;
          }
        }
        v17 = v145;
        if (v28 == 0.0)
          break;
        memcpy(&v22[8 * v25 * v15], &v145[v29 * v15], __n);
        objc_msgSend(v146, "addIndex:", v29);
        k = v142->_k;
        v24 = ++v25;
        if (k <= v25)
        {
          v20 = v132;
          goto LABEL_41;
        }
      }
      if (__upper_bound)
      {
        v91 = 0;
        v92 = 0;
        do
        {
          if (v25)
          {
            v93 = 0;
            v94 = 0;
            while (1)
            {
              v95 = (double *)&v22[8 * v93];
              v96 = 0.0;
              v97 = &v145[v91];
              v98 = v15;
              do
              {
                v99 = *v97++;
                v100 = v99;
                v101 = *v95++;
                v96 = v96 + (v100 - v101) * (v100 - v101);
                --v98;
              }
              while (v98);
              if (sqrt(v96) == 0.0)
                break;
              ++v94;
              v93 += v15;
              if (v94 == v25)
                goto LABEL_130;
            }
            v136[v92] = v94;
          }
LABEL_130:
          ++v92;
          v91 += v15;
        }
        while (v92 != v19);
      }
      if (v139)
      {
        buf[0] = 0;
        ((void (**)(_QWORD, uint8_t *, double))v139)[2](v139, buf, 0.5);
        if (buf[0])
        {
LABEL_133:
          v78 = 0;
          v79 = 1;
          v80 = v21;
          v42 = v22;
LABEL_150:
          v43 = v136;
          v20 = v132;
          goto LABEL_151;
        }
      }
      v118 = v135;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v137);
      for (n = (void *)objc_claimAutoreleasedReturnValue(); v25; --v25)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(n, "addObject:", v120);

      }
      v121 = objc_msgSend(v118, "count");
      if (v121)
      {
        for (ii = 0; ii != v121; ++ii)
        {
          objc_msgSend(n, "objectAtIndexedSubscript:", v136[ii]);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "objectAtIndexedSubscript:", ii);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObject:", v124);

        }
      }
      v125 = v118;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v137);
      v78 = (id)objc_claimAutoreleasedReturnValue();
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      v154 = 0u;
      v126 = n;
      v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
      if (v127)
      {
        v128 = v127;
        v129 = *(_QWORD *)v152;
        do
        {
          for (jj = 0; jj != v128; ++jj)
          {
            if (*(_QWORD *)v152 != v129)
              objc_enumerationMutation(v126);
            +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * jj));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "addObject:", v131);

          }
          v128 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
        }
        while (v128);
      }

      if (v145)
        free(v145);
      v9 = v133;
      v10 = v134;
      v12 = v139;
      if (v136)
        free(v136);
      if (v132)
        free(v132);
      if (v22)
        free(v22);
      v8 = v135;
      if (v21)
        free(v21);
      if (!v139
        || (LOBYTE(v151) = 0, ((void (**)(_QWORD, __int128 *, double))v139)[2](v139, &v151, 1.0),
                              !(_BYTE)v151))
      {
        v78 = v78;
        v81 = v78;
        goto LABEL_168;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_166;
      *(_DWORD *)buf = 67109120;
      LODWORD(v158) = 167;
      v116 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_199541000, v116, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    goto LABEL_166;
  }
  v82 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v84 = v8;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v147, v156, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v148;
    do
    {
      for (kk = 0; kk != v86; ++kk)
      {
        if (*(_QWORD *)v148 != v87)
          objc_enumerationMutation(v84);
        v155 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * kk);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addObject:", v90);

      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v147, v156, 16);
    }
    while (v86);
  }

  v10 = v134;
  if (v139
    && (LOBYTE(v151) = 0, ((void (**)(_QWORD, __int128 *, double))v139)[2](v139, &v151, 1.0), (_BYTE)v151))
  {
    v9 = v82;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v158) = 72;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    v81 = (id)MEMORY[0x1E0C9AA60];
    v8 = v135;
  }
  else
  {
    v81 = v83;
    v8 = v135;
    v9 = v82;
  }
  v12 = v139;

LABEL_169:
  return v81;
}

- (double)_dataArray:(id)a3 featureCount:(unsigned int)a4 useKeypaths:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  double v30;
  uint64_t v32;
  _BOOL4 v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (double *)malloc_type_calloc(8uLL, objc_msgSend(v7, "count") * a4, 0x52467F7CuLL);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v38 = *(_QWORD *)v48;
    v33 = v5;
    v36 = v8;
    do
    {
      v13 = 0;
      v14 = v8 * v12;
      v32 = v11 + v12;
      v37 = v11;
      do
      {
        if (*(_QWORD *)v48 != v38)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v13);
        if (v5)
        {
          v45 = 0uLL;
          v46 = 0uLL;
          v43 = 0uLL;
          v44 = 0uLL;
          -[PLDataClustering numericValueKeypaths](self, "numericValueKeypaths");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v17)
          {
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v44 != v20)
                  objc_enumerationMutation(v16);
                objc_msgSend(v15, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i), v32);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "doubleValue");
                v9[v14 + v19 + i] = v23;

              }
              v19 += i;
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v18);
            v5 = v33;
            v8 = v36;
            v11 = v37;
          }
        }
        else
        {
          v41 = 0uLL;
          v42 = 0uLL;
          v39 = 0uLL;
          v40 = 0uLL;
          v16 = v15;
          v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v24)
          {
            v25 = v24;
            v26 = v13;
            v27 = 0;
            v28 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v40 != v28)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "doubleValue", v32);
                v9[v14 + v27 + j] = v30;
              }
              v27 += j;
              v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v25);
            v13 = v26;
            v8 = v36;
            v11 = v37;
          }
        }

        ++v13;
        v14 += v8;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      v12 = v32;
    }
    while (v11);
  }

  return v9;
}

- (unint64_t)k
{
  return self->_k;
}

- (void)setK:(unint64_t)a3
{
  self->_k = a3;
}

@end
