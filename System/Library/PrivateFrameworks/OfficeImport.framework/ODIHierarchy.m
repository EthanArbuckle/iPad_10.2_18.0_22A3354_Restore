@implementation ODIHierarchy

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  ODIHierarchy *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("orgChart1")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("hierarchy3")) & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("hierarchy")))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v7 = 2;
  }
  v8 = -[ODIHierarchy initWithType:state:]([ODIHierarchy alloc], "initWithType:state:", v7, v6);
  -[ODIHierarchy map](v8, "map");

  v9 = 1;
LABEL_8:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNodeInfoMap, 0);
  objc_storeStrong((id *)&self->mState, 0);
}

- (ODIHierarchy)initWithType:(int)a3 state:(id)a4
{
  id v7;
  ODIHierarchy *v8;
  ODIHierarchy *v9;
  int v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *mNodeInfoMap;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ODIHierarchy;
  v8 = -[ODIHierarchy init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3 == 3)
      v10 = 1;
    else
      v10 = 0x7FFFFFFF;
    v8->mType = a3;
    v8->mMaxMappableTreeDepth = v10;
    objc_storeStrong((id *)&v8->mState, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mNodeInfoMap = v9->mNodeInfoMap;
    v9->mNodeInfoMap = v11;

  }
  return v9;
}

- (id)infoForNode:(id)a3
{
  NSMutableDictionary *mNodeInfoMap;
  void *v4;
  void *v5;

  mNodeInfoMap = self->mNodeInfoMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mNodeInfoMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)createInfoForNode:(id)a3 depth:(int)a4
{
  uint64_t v4;
  ODIHNodeInfo *v6;
  NSMutableDictionary *mNodeInfoMap;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v14 = a3;
  v6 = objc_alloc_init(ODIHNodeInfo);
  mNodeInfoMap = self->mNodeInfoMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mNodeInfoMap, "setObject:forKey:", v6, v8);

  -[ODIHNodeInfo setTreeDepth:](v6, "setTreeDepth:", v4);
  objc_msgSend(v14, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = 0;
    v12 = (v4 + 1);
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODIHierarchy createInfoForNode:depth:](self, "createInfoForNode:depth:", v13, v12);

      ++v11;
    }
    while (v10 != v11);
  }

}

- (void)mapRangesForNode:(id)a3
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  double v6;
  int mType;
  unint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  float v14;
  void *v15;
  float v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  float v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  double v24;
  float v25;
  float v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  float *v30;
  unint64_t v31;
  uint64_t v32;
  float *v33;
  int v34;
  float *v35;
  float v36;
  float *v37;
  float v38;
  float *v39;
  float v40;
  float v41;
  float *v42;
  unint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unint64_t v46;
  char *v47;
  unsigned int v48;
  uint64_t v49;
  float *v50;
  float *v51;
  uint64_t v52;
  float v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float *v58;
  unint64_t v59;
  float *v60;
  float v61;
  float v62;
  float v63;
  float *v64;
  unint64_t v65;
  uint64_t v66;
  unsigned int v67;
  unint64_t v68;
  char *v69;
  unsigned int v70;
  uint64_t v71;
  float *v72;
  float *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  BOOL v78;
  float v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  int v85;
  int v86;
  float v87;
  float v88;
  unint64_t v89;
  float *v90;
  float *v91;
  float *v92;
  unint64_t v93;
  unint64_t v94;
  unsigned int v95;
  unint64_t v96;
  char *v97;
  unsigned int v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  int v106;
  _QWORD *v107;
  float v108;
  float *v109;
  unint64_t v110;
  uint64_t v111;
  double v112;
  float *v113;
  float v114;
  float v115;
  uint64_t v116;
  uint64_t j;
  void *v118;
  void *v119;
  int v120;
  double v121;
  unint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  unint64_t v125;
  uint64_t v126;
  unsigned int v127;
  unint64_t v128;
  char *v129;
  unsigned int v130;
  uint64_t v131;
  char *v132;
  char *v133;
  float *v134;
  uint64_t v135;
  uint64_t v137;
  id v138;
  void *v139;
  void *v140;
  uint64_t v142;
  float *v143;
  uint64_t v144;

  v138 = a3;
  -[ODIHierarchy infoForNode:](self, "infoForNode:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v139, "xRanges");
  if (((*(_QWORD *)(v3 + 8) - *(_QWORD *)v3) & 0x7FFFFFFF8) != 0)
    goto LABEL_147;
  objc_msgSend(v138, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v4;
  v5 = objc_msgSend(v4, "count");
  if (!v5 || (int)objc_msgSend(v139, "treeDepth") >= self->mMaxMappableTreeDepth)
    goto LABEL_146;
  mType = self->mType;
  if (mType != 1)
    goto LABEL_110;
  if ((int)objc_msgSend(v139, "treeDepth") < 1)
  {
    HIDWORD(v137) = 0;
  }
  else
  {
    HIDWORD(v137) = 0;
    for (i = 0; i != v5; HIDWORD(v137) = i >= v5)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
        break;
      ++i;
    }
  }
  v12 = 0;
  if (v5 <= 1)
    v5 = 1;
  v13 = 1;
  v14 = 0.0;
  do
  {
    objc_msgSend(v4, "objectAtIndex:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "type"))
    {
      if ((v13 & 1) != 0)
      {
        ODIHRangeVector::boundingRange((float **)-[ODIHierarchy mapRangesForNode:](self, "mapRangesForNode:", v15));
        if (v14 < v16)
          v14 = v16;
      }
      v13 ^= 1u;
    }

    ++v12;
  }
  while (v5 != v12);
  LODWORD(v17) = 0;
  v18 = 0;
  v19 = (_QWORD *)(v3 + 16);
  v20 = -v14;
  LODWORD(v137) = 1;
  do
  {
    objc_msgSend(v4, "objectAtIndex:", v18, v137);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ODIHierarchy infoForNode:](self, "infoForNode:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "type"))
      goto LABEL_81;
    objc_msgSend(v22, "setExtraRowsBetweenParentAndSelf:", ((*(_QWORD *)(v3 + 8) - *(_QWORD *)v3) >> 3) - v17);
    objc_msgSend(v22, "setConnectToVerticalSide:", 1);
    v23 = -[ODIHierarchy mapRangesForNode:](self, "mapRangesForNode:", v21);
    *(float *)&v24 = ODIHRangeVector::boundingRange((float **)v23);
    v26 = *(float *)&v24 + (float)(v25 * -0.5);
    if ((_DWORD)v17)
    {
      *(float *)&v24 = -v26;
      objc_msgSend(v22, "addToXOffsetRelativeToParent:", v24);
      v27 = *v23;
      v28 = v23[1] - *v23;
      if ((v28 & 0x7FFFFFFF8) != 0)
      {
        v29 = (v28 >> 3);
        v30 = (float *)*v23;
        do
        {
          *v30 = *v30 - v26;
          v30 += 2;
          --v29;
        }
        while (v29);
      }
      v31 = v28 >> 3;
      if (v31 >= v17)
        v32 = v17;
      else
        v32 = v31;
      if ((_DWORD)v32)
      {
        v33 = *(float **)v3;
        v34 = ((*(_QWORD *)(v3 + 8) - *(_QWORD *)v3) >> 3) - v17;
        v35 = (float *)(v27 + 4);
        do
        {
          v36 = *(v35 - 1) + (float)(*v35 * 0.5);
          v37 = &v33[2 * v34];
          v38 = *v37 - (float)(v37[1] * 0.5);
          *v37 = (float)(v36 + v38) * 0.5;
          v37[1] = v36 - v38;
          ++v34;
          v35 += 2;
          --v32;
        }
        while (v32);
      }
      if (v17 >= v31)
      {
LABEL_77:
        LODWORD(v17) = 0;
        goto LABEL_81;
      }
      v17 = v17;
      v39 = *(float **)(v3 + 8);
      do
      {
        v40 = *(float *)(v27 + 8 * v17) + (float)(*(float *)(v27 + 8 * v17 + 4) * 0.5);
        v41 = (float)(v40 + 0.0) * 0.5;
        if ((unint64_t)v39 >= *v19)
        {
          v42 = *(float **)v3;
          v43 = (unint64_t)v39 - *(_QWORD *)v3;
          v44 = (*v19 - *(_QWORD *)v3) >> 3;
          if (2 * (int)v44 <= (v43 >> 3) + 1)
            v45 = (v43 >> 3) + 1;
          else
            v45 = 2 * v44;
          if (v44 >= 0x7FFFFFFF)
            v46 = 0xFFFFFFFFLL;
          else
            v46 = v45;
          if ((_DWORD)v46)
          {
            v47 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v46);
            v49 = v48;
            v42 = *(float **)v3;
            v39 = *(float **)(v3 + 8);
          }
          else
          {
            v47 = 0;
            v49 = 0;
          }
          v50 = (float *)&v47[v43 & 0x7FFFFFFF8];
          *v50 = v41;
          v50[1] = v40;
          v51 = v50;
          if (v39 == v42)
          {
            v4 = v140;
          }
          else
          {
            v4 = v140;
            do
            {
              v52 = *((_QWORD *)v39 - 1);
              v39 -= 2;
              *((_QWORD *)v51 - 1) = v52;
              v51 -= 2;
            }
            while (v39 != v42);
            v42 = *(float **)v3;
          }
          v39 = v50 + 2;
          *(_QWORD *)v3 = v51;
          *(_QWORD *)(v3 + 8) = v50 + 2;
          *(_QWORD *)(v3 + 16) = &v47[8 * v49];
          if (v42)
            operator delete(v42);
        }
        else
        {
          *v39 = v41;
          v39[1] = v40;
          v39 += 2;
        }
        *(_QWORD *)(v3 + 8) = v39;
        ++v17;
        v27 = *v23;
      }
      while (v17 < ((unint64_t)(v23[1] - *v23) >> 3));
      LODWORD(v17) = 0;
    }
    else
    {
      v53 = v20 - v26;
      *(float *)&v24 = v53;
      objc_msgSend(v22, "addToXOffsetRelativeToParent:", v24);
      v54 = *v23;
      v55 = v23[1] - *v23;
      v56 = v55 & 0x7FFFFFFF8;
      if ((v55 & 0x7FFFFFFF8) == 0)
        goto LABEL_77;
      v57 = (v55 >> 3);
      v58 = (float *)*v23;
      do
      {
        *v58 = v53 + *v58;
        v58 += 2;
        --v57;
      }
      while (v57);
      if (v56)
      {
        v59 = 0;
        v60 = *(float **)(v3 + 8);
        do
        {
          v61 = *(float *)(v54 + 8 * v59) - (float)(*(float *)(v54 + 8 * v59 + 4) * 0.5);
          v62 = (float)(v61 + 0.0) * 0.5;
          v63 = 0.0 - v61;
          if ((unint64_t)v60 >= *v19)
          {
            v64 = *(float **)v3;
            v65 = (unint64_t)v60 - *(_QWORD *)v3;
            v66 = (*v19 - *(_QWORD *)v3) >> 3;
            if (2 * (int)v66 <= (v65 >> 3) + 1)
              v67 = (v65 >> 3) + 1;
            else
              v67 = 2 * v66;
            if (v66 >= 0x7FFFFFFF)
              v68 = 0xFFFFFFFFLL;
            else
              v68 = v67;
            if ((_DWORD)v68)
            {
              v69 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v68);
              v71 = v70;
              v64 = *(float **)v3;
              v60 = *(float **)(v3 + 8);
            }
            else
            {
              v69 = 0;
              v71 = 0;
            }
            v72 = (float *)&v69[v65 & 0x7FFFFFFF8];
            *v72 = v62;
            v72[1] = v63;
            v73 = v72;
            if (v60 != v64)
            {
              do
              {
                v74 = *((_QWORD *)v60 - 1);
                v60 -= 2;
                *((_QWORD *)v73 - 1) = v74;
                v73 -= 2;
              }
              while (v60 != v64);
              v64 = *(float **)v3;
            }
            v60 = v72 + 2;
            *(_QWORD *)v3 = v73;
            *(_QWORD *)(v3 + 8) = v72 + 2;
            *(_QWORD *)(v3 + 16) = &v69[8 * v71];
            if (v64)
              operator delete(v64);
          }
          else
          {
            *v60 = v62;
            v60[1] = v63;
            v60 += 2;
          }
          *(_QWORD *)(v3 + 8) = v60;
          ++v59;
          v54 = *v23;
          v17 = (unint64_t)(v23[1] - *v23) >> 3;
        }
        while (v59 < v17);
      }
      else
      {
        LODWORD(v17) = 0;
      }
      v4 = v140;
    }
    mType = v137;
LABEL_81:

    ++v18;
  }
  while (v18 != v5);
  if ((v137 & 0x100000000) != 0)
  {
    v75 = 0;
    v76 = 0;
    v77 = (*(_QWORD *)(v3 + 8) - *(_QWORD *)v3) >> 3;
    if (objc_msgSend(v138, "type"))
      v78 = (_DWORD)v77 == 0;
    else
      v78 = 0;
    if (v78)
      v79 = 0.2;
    else
      v79 = 0.53;
    v4 = v140;
    do
    {
      objc_msgSend(v140, "objectAtIndex:", v75);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v80, "type") == 2)
      {
        -[ODIHierarchy infoForNode:](self, "infoForNode:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setConnectToVerticalSide:", 1);
        objc_msgSend(v81, "setExtraRowsBetweenParentAndSelf:", (v76 + v77));
        LODWORD(v82) = 0;
        LODWORD(v83) = 1.0;
        objc_msgSend(v81, "setXRange:", v82, v83);
        *(float *)&v84 = v79;
        objc_msgSend(v81, "setXOffsetRelativeToParent:", v84);
        objc_msgSend(v81, "xRange");
        v86 = v85;
        v88 = v79 + v87;
        v90 = *(float **)(v3 + 8);
        v89 = *(_QWORD *)(v3 + 16);
        if ((unint64_t)v90 >= v89)
        {
          v92 = *(float **)v3;
          v93 = (unint64_t)v90 - *(_QWORD *)v3;
          v94 = (v89 - *(_QWORD *)v3) >> 3;
          if (2 * (int)v94 <= (v93 >> 3) + 1)
            v95 = (v93 >> 3) + 1;
          else
            v95 = 2 * v94;
          if (v94 >= 0x7FFFFFFF)
            v96 = 0xFFFFFFFFLL;
          else
            v96 = v95;
          if ((_DWORD)v96)
          {
            v97 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v96);
            v99 = v98;
            v92 = *(float **)v3;
            v90 = *(float **)(v3 + 8);
          }
          else
          {
            v97 = 0;
            v99 = 0;
          }
          v100 = &v97[v93 & 0x7FFFFFFF8];
          *(float *)v100 = v88;
          *((_DWORD *)v100 + 1) = v86;
          v101 = v100;
          if (v90 != v92)
          {
            do
            {
              v102 = *((_QWORD *)v90 - 1);
              v90 -= 2;
              *((_QWORD *)v101 - 1) = v102;
              v101 -= 8;
            }
            while (v90 != v92);
            v92 = *(float **)v3;
          }
          v91 = (float *)(v100 + 8);
          *(_QWORD *)v3 = v101;
          *(_QWORD *)(v3 + 8) = v100 + 8;
          *(_QWORD *)(v3 + 16) = &v97[8 * v99];
          if (v92)
            operator delete(v92);
        }
        else
        {
          *v90 = v88;
          *((_DWORD *)v90 + 1) = v85;
          v91 = v90 + 2;
        }
        *(_QWORD *)(v3 + 8) = v91;
        ++v76;

      }
      ++v75;
    }
    while (v75 != v5);
    goto LABEL_146;
  }
LABEL_110:
  v103 = 0;
  v142 = 0;
  v143 = 0;
  v144 = 0;
  do
  {
    objc_msgSend(v4, "objectAtIndex:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[ODIHierarchy infoForNode:](self, "infoForNode:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "type");
    if (mType != 1 || v106 == 2)
    {
      objc_msgSend(v105, "setExtraRowsBetweenParentAndSelf:", (*(_QWORD *)(v3 + 8) - *(_QWORD *)v3) >> 3);
      v107 = -[ODIHierarchy mapRangesForNode:](self, "mapRangesForNode:", v104);
      v108 = ODIHRangeVector::minDistanceTo(&v142, v107);
      v109 = (float *)*v107;
      v110 = v107[1] - *v107;
      if ((v110 & 0x7FFFFFFF8) != 0)
      {
        v111 = (v110 >> 3);
        do
        {
          *v109 = *v109 - v108;
          v109 += 2;
          --v111;
        }
        while (v111);
      }
      ODIHRangeVector::operator+=(&v142, v107);
      *(float *)&v112 = -v108;
      objc_msgSend(v105, "addToXOffsetRelativeToParent:", v112);
    }

    ++v103;
  }
  while (v103 != v5);
  v113 = (float *)v142;
  if ((((unint64_t)v143 - v142) & 0x7FFFFFFF8) != 0)
  {
    v114 = *(float *)v142;
    v115 = -*(float *)v142;
    v116 = (((unint64_t)v143 - v142) >> 3);
    do
    {
      *v113 = *v113 - v114;
      v113 += 2;
      --v116;
    }
    while (v116);
    for (j = 0; j != v5; ++j)
    {
      objc_msgSend(v4, "objectAtIndex:", j);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODIHierarchy infoForNode:](self, "infoForNode:", v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v118, "type");
      if (mType != 1 || v120 == 2)
      {
        *(float *)&v121 = v115;
        objc_msgSend(v119, "addToXOffsetRelativeToParent:", v121);
      }

    }
    v113 = (float *)v142;
    if ((((unint64_t)v143 - v142) & 0x7FFFFFFF8) != 0)
    {
      v122 = 0;
      v123 = (_QWORD *)(v3 + 16);
      v124 = *(_QWORD **)(v3 + 8);
      do
      {
        if ((unint64_t)v124 >= *v123)
        {
          v125 = (unint64_t)v124 - *(_QWORD *)v3;
          v126 = (*v123 - *(_QWORD *)v3) >> 3;
          v127 = 2 * v126;
          if (2 * (int)v126 <= (v125 >> 3) + 1)
            v127 = (v125 >> 3) + 1;
          if (v126 >= 0x7FFFFFFF)
            v128 = 0xFFFFFFFFLL;
          else
            v128 = v127;
          if ((_DWORD)v128)
          {
            v129 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v128);
            v131 = v130;
          }
          else
          {
            v129 = 0;
            v131 = 0;
          }
          v132 = &v129[v125 & 0x7FFFFFFF8];
          *(_QWORD *)v132 = *(_QWORD *)&v113[2 * v122];
          v124 = v132 + 8;
          v134 = *(float **)v3;
          v133 = *(char **)(v3 + 8);
          if (v133 != *(char **)v3)
          {
            do
            {
              v135 = *((_QWORD *)v133 - 1);
              v133 -= 8;
              *((_QWORD *)v132 - 1) = v135;
              v132 -= 8;
            }
            while (v133 != (char *)v134);
            v133 = *(char **)v3;
          }
          *(_QWORD *)v3 = v132;
          *(_QWORD *)(v3 + 8) = v124;
          *(_QWORD *)(v3 + 16) = &v129[8 * v131];
          if (v133)
            operator delete(v133);
        }
        else
        {
          *v124++ = *(_QWORD *)&v113[2 * v122];
        }
        *(_QWORD *)(v3 + 8) = v124;
        ++v122;
        v113 = (float *)v142;
      }
      while (v122 < (((unint64_t)v143 - v142) >> 3));
    }
  }
  v4 = v140;
  if (v113)
  {
    v143 = v113;
    operator delete(v113);
  }
LABEL_146:
  v142 = 0x3F80000000000000;
  LODWORD(v6) = 1.0;
  objc_msgSend(v139, "setXRange:", 0.0078125, v6);
  std::vector<ODIHRange,ChAllocator<ODIHRange>>::insert(v3, *(char **)v3, &v142);

LABEL_147:
  return (void *)v3;
}

- (void)mapLogicalBoundsWithXRanges:(const void *)a3
{
  float v5;
  float v6;

  v5 = ODIHRangeVector::boundingRange((float **)a3);
  -[ODIState setLogicalBounds:](self->mState, "setLogicalBounds:", (float)(v5 + (float)(v6 * -0.5)), -0.300000012, v6, (float)((float)((*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) * 0.6));
}

- (void)setAbsolutePositionOfNode:(id)a3 parentRow:(int)a4 parentXOffset:(float)a5
{
  void *v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  id v20;

  v20 = a3;
  -[ODIHierarchy infoForNode:](self, "infoForNode:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v8, "treeDepth") <= self->mMaxMappableTreeDepth)
  {
    v9 = a4 + objc_msgSend(v8, "extraRowsBetweenParentAndSelf") + 1;
    objc_msgSend(v8, "setRow:", v9);
    objc_msgSend(v8, "xOffsetRelativeToParent");
    v11 = v10;
    objc_msgSend(v8, "xRange");
    v12 = v11 + a5;
    *(float *)&v14 = v12 + v13;
    objc_msgSend(v8, "setXRange:", v14);
    objc_msgSend(v20, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v16)
    {
      v17 = 0;
      do
      {
        objc_msgSend(v15, "objectAtIndex:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v19 = v12;
        -[ODIHierarchy setAbsolutePositionOfNode:parentRow:parentXOffset:](self, "setAbsolutePositionOfNode:parentRow:parentXOffset:", v18, v9, v19);

        ++v17;
      }
      while (v16 != v17);
    }

  }
}

- (CGRect)boundsOfNode:(id)a3
{
  void *v3;
  int v4;
  float v5;
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
  CGRect result;

  -[ODIHierarchy infoForNode:](self, "infoForNode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "row");
  objc_msgSend(v3, "xRange");
  v6 = TSURectWithCenterAndSize(v5, (float)((float)v4 * 0.6), 0.800000012);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)mapNode:(id)a3
{
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  OITSUBezierPath *v25;
  void *v26;
  int v27;
  double MidX;
  double v29;
  double v30;
  double MidY;
  double v32;
  double v33;
  double MinY;
  void *v35;
  int v36;
  float v37;
  double v38;
  double v39;
  double MaxX;
  ODIState *mState;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  double MinX;
  double v52;
  double MaxY;
  double v54;
  double rect;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v56 = a3;
  -[ODIHierarchy infoForNode:](self, "infoForNode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "treeDepth");

  if (v5 <= self->mMaxMappableTreeDepth)
  {
    if ((v5 & 0x80000000) == 0)
    {
      -[ODIHierarchy boundsOfNode:](self, "boundsOfNode:", v56);
      rect = v6;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 0;
      +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, self->mState, v8, v10, v12, rect, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v56, v15, self->mState);
      +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v56, v15, 0, v5 == self->mMaxMappableTreeDepth, self->mState);
      if (v5)
      {
        objc_msgSend(v56, "parent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ODIHierarchy boundsOfNode:](self, "boundsOfNode:", v16);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        v25 = objc_alloc_init(OITSUBezierPath);
        -[ODIHierarchy infoForNode:](self, "infoForNode:", v56);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "connectToVerticalSide");

        if (v27)
        {
          v57.origin.x = v18;
          v57.origin.y = v20;
          v57.size.width = v22;
          v57.size.height = v24;
          MidX = CGRectGetMidX(v57);
          v58.origin.x = v8;
          v58.origin.y = v10;
          v58.size.width = v12;
          v58.size.height = rect;
          if (MidX <= CGRectGetMinX(v58))
            goto LABEL_9;
          v59.origin.x = v18;
          v59.origin.y = v20;
          v59.size.width = v22;
          v59.size.height = v24;
          v29 = CGRectGetMidX(v59);
          v60.origin.x = v8;
          v60.origin.y = v10;
          v60.size.width = v12;
          v60.size.height = rect;
          if (v29 >= CGRectGetMaxX(v60))
          {
LABEL_9:
            v69.origin.x = v18;
            v69.origin.y = v20;
            v69.size.width = v22;
            v69.size.height = v24;
            v52 = CGRectGetMidX(v69);
            v70.origin.x = v18;
            v70.origin.y = v20;
            v70.size.width = v22;
            v70.size.height = v24;
            MaxY = CGRectGetMaxY(v70);
            v71.origin.x = v18;
            v71.origin.y = v20;
            v71.size.width = v22;
            v71.size.height = v24;
            v39 = CGRectGetMidX(v71);
            v72.origin.x = v8;
            v72.origin.y = v10;
            v72.size.width = v12;
            v72.size.height = rect;
            if (v39 >= CGRectGetMidX(v72))
            {
              v74.origin.x = v8;
              v74.origin.y = v10;
              v74.size.width = v12;
              v74.size.height = rect;
              MaxX = CGRectGetMaxX(v74);
            }
            else
            {
              v73.origin.x = v8;
              v73.origin.y = v10;
              v73.size.width = v12;
              v73.size.height = rect;
              MaxX = CGRectGetMinX(v73);
            }
            v30 = MaxX;
            v75.origin.x = v8;
            v75.origin.y = v10;
            v75.size.width = v12;
            v75.size.height = rect;
            MidY = CGRectGetMidY(v75);
          }
          else
          {
            v61.origin.x = v8;
            v61.origin.y = v10;
            v61.size.width = v12;
            v61.size.height = rect;
            MinX = CGRectGetMinX(v61);
            v62.origin.x = v18;
            v62.origin.y = v20;
            v62.size.width = v22;
            v62.size.height = v24;
            MaxY = CGRectGetMaxY(v62);
            v63.origin.x = v8;
            v63.origin.y = v10;
            v63.size.width = v12;
            v63.size.height = rect;
            v30 = CGRectGetMinX(v63);
            v64.origin.x = v8;
            v64.origin.y = v10;
            v64.size.width = v12;
            v64.size.height = rect;
            MidY = CGRectGetMidY(v64);
            v52 = MinX + -0.129999995;
          }
          -[OITSUBezierPath moveToPoint:](v25, "moveToPoint:", v52, MaxY);
          -[OITSUBezierPath lineToPoint:](v25, "lineToPoint:", v52, MidY);
          -[OITSUBezierPath lineToPoint:](v25, "lineToPoint:", v30, MidY);
        }
        else
        {
          v65.origin.x = v18;
          v65.origin.y = v20;
          v65.size.width = v22;
          v65.size.height = v24;
          v54 = CGRectGetMidX(v65);
          v66.origin.x = v18;
          v66.origin.y = v20;
          v66.size.width = v22;
          v66.size.height = v24;
          v32 = CGRectGetMaxY(v66);
          v67.origin.x = v8;
          v67.origin.y = v10;
          v67.size.width = v12;
          v67.size.height = rect;
          v33 = CGRectGetMidX(v67);
          v68.origin.x = v8;
          v68.origin.y = v10;
          v68.size.width = v12;
          v68.size.height = rect;
          MinY = CGRectGetMinY(v68);
          -[ODIHierarchy infoForNode:](self, "infoForNode:", v56);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "row");

          -[OITSUBezierPath moveToPoint:](v25, "moveToPoint:", v54, v32);
          v37 = ((double)v36 + -0.5) * 0.600000024;
          v38 = v37;
          -[OITSUBezierPath lineToPoint:](v25, "lineToPoint:", v54, v37);
          -[OITSUBezierPath lineToPoint:](v25, "lineToPoint:", v33, v38);
          -[OITSUBezierPath lineToPoint:](v25, "lineToPoint:", v33, MinY);
        }
        mState = self->mState;
        if (v5 >= 3)
          v42 = 3;
        else
          v42 = v5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parChTrans1D%d"), (v42 + 1));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[ODIState setDefaultStyleLabelName:forPointType:](mState, "setDefaultStyleLabelName:forPointType:", v43, 3);

        -[ODIState logicalBounds](self->mState, "logicalBounds");
        +[ODIDrawable shapeGeometryForBezierPath:gSpace:](ODIDrawable, "shapeGeometryForBezierPath:gSpace:", v25);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[ODIState logicalBounds](self->mState, "logicalBounds");
        +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v44, self->mState);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "parentTransition");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[ODIDrawable mapStyleAndTextFromPoint:shape:state:](ODIDrawable, "mapStyleAndTextFromPoint:shape:state:", v46, v45, self->mState);

      }
    }
    objc_msgSend(v56, "children");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");
    if (v48)
    {
      for (i = 0; i != v48; ++i)
      {
        objc_msgSend(v47, "objectAtIndex:", i);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[ODIHierarchy mapNode:](self, "mapNode:", v50);

      }
    }

  }
}

- (void)map
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;
  char *v7;
  _BYTE *v8;
  int64_t v9;
  double v10;
  id v11;

  -[ODIState diagram](self->mState, "diagram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentPoint");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[ODIHierarchy createInfoForNode:depth:](self, "createInfoForNode:depth:", v11, 0xFFFFFFFFLL);
  v4 = -[ODIHierarchy mapRangesForNode:](self, "mapRangesForNode:", v11);
  v5 = v4;
  v7 = (char *)*v4;
  v6 = (_BYTE *)v4[1];
  v8 = (_BYTE *)(*v4 + 8);
  v9 = v6 - v8;
  if (v6 != v8)
    memmove((void *)*v4, v8, v6 - v8);
  v5[1] = &v7[v9];
  -[ODIHierarchy mapLogicalBoundsWithXRanges:](self, "mapLogicalBoundsWithXRanges:", v5);
  LODWORD(v10) = 0;
  -[ODIHierarchy setAbsolutePositionOfNode:parentRow:parentXOffset:](self, "setAbsolutePositionOfNode:parentRow:parentXOffset:", v11, 4294967294, v10);
  -[ODIHierarchy mapNode:](self, "mapNode:", v11);

}

@end
