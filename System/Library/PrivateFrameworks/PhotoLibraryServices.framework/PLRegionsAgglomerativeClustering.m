@implementation PLRegionsAgglomerativeClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double latitude;
  double longitude;
  _BOOL4 v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  PLRegionsAgglomerativeClusteringDataVector *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t ii;
  void *v54;
  id v55;
  uint64_t jj;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t kk;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t mm;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  unint64_t v85;
  id obj;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v93;
  uint64_t v94;
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
  _QWORD v111[5];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _QWORD v140[2];
  _QWORD v141[2];
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;
  CLLocationCoordinate2D v145;

  v144 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_10301);
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v130 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
        objc_msgSend(v10, "pl_coordinate");
        latitude = v145.latitude;
        longitude = v145.longitude;
        if (CLLocationCoordinate2DIsValid(v145))
        {
          v13 = latitude != 0.0;
          if (longitude != 0.0)
            v13 = 1;
          if (v13 && (latitude != 40.0 || longitude != -100.0))
            objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
    }
    while (v7);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v88 = v5;
  v15 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v125, v142, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v126;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v126 != v18)
          objc_enumerationMutation(v88);
        v20 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
        objc_msgSend(v20, "pl_coordinate");
        v22 = v21;
        objc_msgSend(v20, "pl_coordinate");
        v24 = v23;
        v25 = -[PLRegionsAgglomerativeClusteringDataVector initWithDataLength:]([PLRegionsAgglomerativeClusteringDataVector alloc], "initWithDataLength:", 2);
        *(_QWORD *)-[PLRegionsAgglomerativeClusteringDataVector data](v25, "data") = v24;
        *(_QWORD *)(-[PLRegionsAgglomerativeClusteringDataVector data](v25, "data") + 8) = v22;
        v141[0] = v20;
        v140[0] = CFSTR("version");
        v140[1] = CFSTR("index");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + j);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v141[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLRegionsAgglomerativeClusteringDataVector setUserInfo:](v25, "setUserInfo:", v27);

        objc_msgSend(v91, "addObject:", v25);
        -[PLRegionsAgglomerativeClusteringDataVector data](v25, "data");
        -[PLRegionsAgglomerativeClusteringDataVector data](v25, "data");

      }
      v17 += j;
      v16 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v125, v142, 16);
    }
    while (v16);
  }

  objc_msgSend(v88, "count");
  objc_msgSend(v88, "count");
  -[PLRegionsAgglomerativeClustering _clusterData:](self, "_clusterData:", v91);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v30 = v28;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v122;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v122 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * k), "vectors");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
    }
    while (v32);
  }
  v80 = v30;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v87 = v29;
  v36 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v117, v138, 16);
  if (v36)
  {
    v37 = v36;
    v93 = *(_QWORD *)v118;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v118 != v93)
          objc_enumerationMutation(v87);
        v39 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet", v80);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        v41 = v39;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v113, v137, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v114;
          do
          {
            for (n = 0; n != v43; ++n)
            {
              if (*(_QWORD *)v114 != v44)
                objc_enumerationMutation(v41);
              objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * n), "userInfo");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("index"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addIndex:", objc_msgSend(v47, "unsignedIntegerValue"));

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v113, v137, 16);
          }
          while (v43);
        }

        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_2;
        v111[3] = &unk_1E3672F90;
        v111[4] = v41;
        v112 = v90;
        objc_msgSend(v40, "enumerateRangesWithOptions:usingBlock:", 0, v111);

      }
      v37 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v117, v138, 16);
    }
    while (v37);
  }

  objc_msgSend(v90, "sortedArrayUsingComparator:", &__block_literal_global_79_10308);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
  if (v49)
  {
    v50 = v49;
    v51 = 0;
    v52 = *(_QWORD *)v108;
    do
    {
      for (ii = 0; ii != v50; ++ii)
      {
        if (*(_QWORD *)v108 != v52)
          objc_enumerationMutation(v48);
        v54 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * ii);
        if (objc_msgSend(v54, "count", v80) > v51)
          v51 = objc_msgSend(v54, "count");
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
    }
    while (v50);
  }
  else
  {
    v51 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v80);
  v84 = (id)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v55 = v48;
  v94 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
  if (v94)
  {
    v89 = *(_QWORD *)v104;
    v85 = v51 / 6;
    v83 = v55;
    do
    {
      for (jj = 0; jj != v94; ++jj)
      {
        if (*(_QWORD *)v104 != v89)
          objc_enumerationMutation(v55);
        v57 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * jj);
        if ((unint64_t)objc_msgSend(v57, "count") > 3 || objc_msgSend(v57, "count") >= v85)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v57, "count"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v59 = v57;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v134, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v100;
            do
            {
              for (kk = 0; kk != v61; ++kk)
              {
                if (*(_QWORD *)v100 != v62)
                  objc_enumerationMutation(v59);
                v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", *(double *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * kk), "data"), *(double *)(objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * kk), "data") + 8));
                objc_msgSend(v58, "addObject:", v64);

              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v134, 16);
            }
            while (v61);
          }

          objc_msgSend(v59, "valueForKey:", CFSTR("userInfo"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "valueForKey:", CFSTR("version"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v67, "meanRegion:", 50.0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
          {
            objc_msgSend(v67, "objects");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v69, v68);

            objc_msgSend(v68, "center");
            objc_msgSend(v68, "center");
            objc_msgSend(v68, "center");
            objc_msgSend(v68, "center");
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v98 = 0u;
            v70 = v59;
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v133, 16);
            if (v71)
            {
              v72 = v71;
              v73 = *(_QWORD *)v96;
              do
              {
                for (mm = 0; mm != v72; ++mm)
                {
                  if (*(_QWORD *)v96 != v73)
                    objc_enumerationMutation(v70);
                  v75 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * mm);
                  objc_msgSend(v75, "data");
                  objc_msgSend(v68, "center");
                  objc_msgSend(v75, "data");
                  objc_msgSend(v68, "center");
                  objc_msgSend(v75, "data");
                  objc_msgSend(v68, "center");
                  objc_msgSend(v75, "data");
                  objc_msgSend(v68, "center");
                }
                v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v133, 16);
              }
              while (v72);
            }

            v55 = v83;
          }

        }
      }
      v94 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
    }
    while (v94);
  }

  if (!objc_msgSend(v84, "count"))
  {
    +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v82);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "meanRegion:", 100.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objects");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v78, v77);

  }
  return v84;
}

- (id)_clusterData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  id v43;
  id v44;
  id v47;
  void *v48;
  void *context;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[2];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v68;
    v7 = 1.0e100;
    v8 = -1.0e100;
    v9 = -1.0e100;
    v10 = 1.0e100;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v68 != v6)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v12, "data");
        objc_msgSend(v12, "data");
        v13 = *(double *)objc_msgSend(v12, "data");
        if (v13 < v10)
          v10 = *(double *)objc_msgSend(v12, "data", v13);
        v14 = *(double *)objc_msgSend(v12, "data", v13);
        if (v14 > v9)
          v9 = *(double *)objc_msgSend(v12, "data", v14);
        if (*(double *)(objc_msgSend(v12, "data", v14) + 8) < v7)
          v7 = *(double *)(objc_msgSend(v12, "data") + 8);
        if (*(double *)(objc_msgSend(v12, "data") + 8) > v8)
          v8 = *(double *)(objc_msgSend(v12, "data") + 8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v16 = v3;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v64 != v19)
          objc_enumerationMutation(v16);
        +[PLRegionsAgglomerativeClusteringDataCluster dataClusterWithDataVector:](PLRegionsAgglomerativeClusteringDataCluster, "dataClusterWithDataVector:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    }
    while (v18);
  }

  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    v47 = v16;
    v48 = v15;
    while (1)
    {
      context = (void *)MEMORY[0x19AEC1554]();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v22 = v15;
      v52 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      v23 = 0;
      if (v52)
      {
        v54 = 0;
        v24 = 0;
        v50 = *(_QWORD *)v60;
        v51 = v22;
        v25 = 1.0e100;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v60 != v50)
              objc_enumerationMutation(v22);
            v53 = v26;
            v27 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v26);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v28 = v22;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v56;
              do
              {
                for (k = 0; k != v30; ++k)
                {
                  if (*(_QWORD *)v56 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
                  if (v33 != v27)
                  {
                    objc_msgSend(v27, "score");
                    v35 = -v34;
                    objc_msgSend(v33, "score");
                    v37 = v35 - v36 + -0.001 + -0.001;
                    v71[0] = v27;
                    v71[1] = v33;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PLRegionsAgglomerativeClusteringDataCluster mergedClusterFrom:](PLRegionsAgglomerativeClusteringDataCluster, "mergedClusterFrom:", v38);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v39, "score");
                    v41 = v37 + v40 + 0.001;
                    if (v41 < v25)
                    {
                      v42 = v27;

                      v43 = v33;
                      v44 = v39;

                      v54 = v43;
                      v24 = v44;
                      v23 = v42;
                      v25 = v41;
                    }

                  }
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
              }
              while (v30);
            }

            v26 = v53 + 1;
            v22 = v51;
          }
          while (v53 + 1 != v52);
          v52 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
        }
        while (v52);
      }
      else
      {
        v54 = 0;
        v24 = 0;
        v25 = 1.0e100;
      }

      objc_autoreleasePoolPop(context);
      if (v25 > 0.0 || v24 == 0)
        break;
      objc_msgSend(v22, "removeObject:", v23);
      objc_msgSend(v22, "removeObject:", v54);
      objc_msgSend(v22, "addObject:", v24);

      v16 = v47;
      v15 = v48;
      if ((unint64_t)objc_msgSend(v22, "count") <= 1)
        goto LABEL_52;
    }

    v16 = v47;
    v15 = v48;
  }
LABEL_52:

  return v15;
}

void __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_3;
  v7[3] = &__block_descriptor_48_e69_B24__0__PLRegionsAgglomerativeClusteringDataVector_8__NSDictionary_16l;
  v7[4] = a2;
  v7[5] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

uint64_t __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pl_date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pl_date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
}

BOOL __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = *(_QWORD *)(a1 + 32);
  return v5 >= v6 && v5 < *(_QWORD *)(a1 + 40) + v6;
}

uint64_t __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "pl_date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
