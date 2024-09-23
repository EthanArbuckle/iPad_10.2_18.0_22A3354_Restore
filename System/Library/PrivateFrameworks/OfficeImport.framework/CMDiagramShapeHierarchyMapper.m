@implementation CMDiagramShapeHierarchyMapper

- (CMDiagramShapeHierarchyMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CMDiagramShapeHierarchyMapper *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *mNodeInfoMap;
  CMDiagramShapeHierarchyMapper *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CMDiagramShapeHierarchyMapper;
  v17 = -[CMDiagramShapeMapper initWithOddDiagram:drawingContext:orientedBounds:identifier:parent:](&v22, sel_initWithOddDiagram_drawingContext_orientedBounds_identifier_parent_, v12, v13, v14, v15, v16);
  if (v17)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mNodeInfoMap = v17->mNodeInfoMap;
    v17->mNodeInfoMap = v18;

    v17->super.mMaxMappableTreeDepth = 500;
    v17->super.mDefaultScale = 1.0;
    v17->mIsLayered = 0;
    -[CMDiagramShapeHierarchyMapper setUpLayers](v17, "setUpLayers");
    v20 = v17;
  }

  return v17;
}

- (void)setUpLayers
{
  if (-[NSString isEqualToString:](self->super.mIdentifier, "isEqualToString:", CFSTR("hierarchy5"))
    || -[NSString isEqualToString:](self->super.mIdentifier, "isEqualToString:", CFSTR("hierarchy6")))
  {
    self->mIsLayered = 1;
  }
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _BYTE *v10;
  char *v11;
  _BYTE *v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  OADOrientedBounds *v23;
  OADOrientedBounds *mDiagramShapeBounds;
  double Width;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  double v43;
  float v44;
  double v45;
  double v46;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v47 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramShapeHierarchyMapper copyInfoForNode:depth:](self, "copyInfoForNode:depth:", v7, 0xFFFFFFFFLL);
  v8 = -[CMDiagramShapeHierarchyMapper mapRangesForNode:](self, "mapRangesForNode:", v7);
  v9 = v8;
  v11 = (char *)*v8;
  v10 = (_BYTE *)v8[1];
  v12 = (_BYTE *)(*v8 + 8);
  v13 = v10 - v12;
  if (v10 != v12)
    memmove((void *)*v8, v12, v10 - v12);
  v9[1] = &v11[v13];
  -[CMDiagramShapeHierarchyMapper mapLogicalBoundsWithXRanges:](self, "mapLogicalBoundsWithXRanges:", v9);
  v16 = v14;
  v18 = v17;
  v20 = v19;
  if (self->mIsLayered)
    v21 = v15 + 1.0;
  else
    v21 = v15;
  +[CMShapeUtils inscribedBoundsWithBounds:logicalBounds:](CMShapeUtils, "inscribedBoundsWithBounds:logicalBounds:", self->super.super.super.mOrientedBounds, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeUtils relatvieBoundsWithAbsoluteInnerBounds:parentBounds:](CMShapeUtils, "relatvieBoundsWithAbsoluteInnerBounds:parentBounds:", v22, self->super.super.super.mOrientedBounds);
  v23 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mDiagramShapeBounds = self->super.mDiagramShapeBounds;
  self->super.mDiagramShapeBounds = v23;

  objc_msgSend(v22, "bounds");
  Width = CGRectGetWidth(v48);
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v21;
  v49.size.height = v20;
  v26 = Width / CGRectGetWidth(v49);
  v27 = v26;
  self->super.mDefaultScale = v27;
  LODWORD(v26) = 0;
  -[CMDiagramShapeHierarchyMapper setAbsolutePositionOfNode:parentRow:parentXOffset:index:](self, "setAbsolutePositionOfNode:parentRow:parentXOffset:index:", v7, 4294967294, 0, v26);
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  v28 = v16;
  v29 = -v28;
  v30 = 1.0 - v28;
  if (self->mIsLayered)
    v31 = v30;
  else
    v31 = v29;
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v34 = v33;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v32, "translateXBy:yBy:", v34);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v32);
  if (self->mIsLayered)
  {
    -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
    v35 = CGRectGetWidth(v50);
    -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
    v36 = v35;
    v38 = v37 + v18 * v27;
    *(float *)&v39 = v38;
    *(float *)&v38 = v27;
    *(float *)&v37 = v36;
    -[CMDiagramShapeHierarchyMapper mapLayerNodes:at:scale:offsetX:offsetY:withState:](self, "mapLayerNodes:at:scale:offsetX:offsetY:withState:", v7, v47, v6, v38, v37, v39);
  }
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v41 = v40;
  -[OADOrientedBounds bounds](self->super.mDiagramShapeBounds, "bounds");
  v42 = v18 + 0.200000003;
  v43 = v41 + (float)(v31 * v27);
  v44 = v43;
  v46 = v45 + (float)(v42 * v27);
  *(float *)&v43 = v46;
  *(float *)&v46 = v27;
  *(float *)&v45 = v44;
  -[CMDiagramShapeHierarchyMapper mapNode:at:scale:offsetX:offsetY:withState:](self, "mapNode:at:scale:offsetX:offsetY:withState:", v7, v47, v6, v46, v45, v43);
  -[CMDiagramShapeHierarchyMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v47, v6);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (void)copyInfoForNode:(id)a3 depth:(int)a4
{
  uint64_t v4;
  CMDiagramNodeInfo *v6;
  NSMutableDictionary *mNodeInfoMap;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  id v16;

  v4 = *(_QWORD *)&a4;
  v16 = a3;
  v6 = objc_alloc_init(CMDiagramNodeInfo);
  mNodeInfoMap = self->mNodeInfoMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mNodeInfoMap, "setObject:forKey:", v6, v8);

  -[CMDiagramNodeInfo setTreeDepth:](v6, "setTreeDepth:", v4);
  objc_msgSend(v16, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = 0;
    v12 = (v4 + 1);
    v13 = 1;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeHierarchyMapper copyInfoForNode:depth:](self, "copyInfoForNode:depth:", v14, v12);

      v11 = v13;
    }
    while (v10 > v13++);
  }

}

- (void)mapRangesForNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  unsigned int v11;
  float v12;
  char v13;
  void *v14;
  float v15;
  BOOL v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  double v25;
  float v26;
  float v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  float *v31;
  unint64_t v32;
  uint64_t v33;
  float *v34;
  int v35;
  float *v36;
  float v37;
  float *v38;
  float v39;
  unint64_t v40;
  float *v41;
  float v42;
  float v43;
  float *v44;
  unint64_t v45;
  uint64_t v46;
  unsigned int v47;
  unint64_t v48;
  char *v49;
  unsigned int v50;
  uint64_t v51;
  float *v52;
  float *v53;
  uint64_t v54;
  float v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  float *v59;
  unint64_t v60;
  float *v61;
  float v62;
  float v63;
  float v64;
  float *v65;
  unint64_t v66;
  uint64_t v67;
  unsigned int v68;
  unint64_t v69;
  char *v70;
  unsigned int v71;
  uint64_t v72;
  float *v73;
  float *v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  void *v78;
  void *v79;
  _QWORD *v80;
  float v81;
  float *v82;
  unint64_t v83;
  uint64_t v84;
  double v85;
  float *v86;
  float v87;
  uint64_t v88;
  uint64_t v89;
  float v90;
  unsigned int v91;
  void *v92;
  void *v93;
  double v94;
  unint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t v98;
  unsigned int v99;
  unint64_t v100;
  char *v101;
  unsigned int v102;
  uint64_t v103;
  char *v104;
  char *v105;
  float *v106;
  uint64_t v107;
  id v109;
  void *v110;
  void *v111;
  unint64_t v112;
  uint64_t v113;
  float *v114;
  uint64_t v115;

  v4 = a3;
  -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "xRanges");
  if (((*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) & 0x7FFFFFFF8) != 0)
    goto LABEL_104;
  objc_msgSend(v4, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v7;
  v8 = objc_msgSend(v7, "count");
  if (!v8)
    goto LABEL_103;
  v110 = v5;
  v10 = 0;
  v11 = 1;
  v12 = 0.0;
  v13 = 1;
  do
  {
    objc_msgSend(v111, "objectAtIndex:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "type"))
    {
      if ((v13 & 1) != 0)
      {
        ODIHRangeVector::boundingRange((float **)-[CMDiagramShapeHierarchyMapper mapRangesForNode:](self, "mapRangesForNode:", v14));
        if (v12 <= v15)
          v12 = v15;
      }
      v13 ^= 1u;
    }

    v10 = v11;
    v16 = v8 > v11++;
  }
  while (v16);
  v109 = v4;
  v17 = 0;
  LODWORD(v4) = 0;
  v18 = 0;
  v19 = (_QWORD *)(v6 + 16);
  v20 = -v12;
  v21 = v111;
  v112 = v8;
  do
  {
    objc_msgSend(v21, "objectAtIndex:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "type"))
      goto LABEL_67;
    objc_msgSend(v23, "setExtraRowsBetweenParentAndSelf:", ((*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3) - v4);
    objc_msgSend(v23, "setConnectToVerticalSide:", 1);
    v24 = -[CMDiagramShapeHierarchyMapper mapRangesForNode:](self, "mapRangesForNode:", v22);
    *(float *)&v25 = ODIHRangeVector::boundingRange((float **)v24);
    v27 = *(float *)&v25 + (float)(v26 * -0.5);
    if ((_DWORD)v4)
    {
      *(float *)&v25 = -v27;
      objc_msgSend(v23, "addToXOffsetRelativeToParent:", v25);
      v28 = *v24;
      v29 = v24[1] - *v24;
      if ((v29 & 0x7FFFFFFF8) != 0)
      {
        v30 = (v29 >> 3);
        v31 = (float *)*v24;
        do
        {
          *v31 = *v31 - v27;
          v31 += 2;
          --v30;
        }
        while (v30);
      }
      v32 = v29 >> 3;
      if (v4 >= v32)
        v33 = v32;
      else
        v33 = v4;
      if ((_DWORD)v33)
      {
        v34 = *(float **)v6;
        v35 = ((*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3) - (_DWORD)v4;
        v36 = (float *)(v28 + 4);
        do
        {
          v37 = *(v36 - 1) + (float)(*v36 * 0.5);
          v38 = &v34[2 * v35];
          v39 = *v38 - (float)(v38[1] * 0.5);
          *v38 = (float)(v37 + v39) * 0.5;
          v38[1] = v37 - v39;
          ++v35;
          v36 += 2;
          --v33;
        }
        while (v33);
      }
      if (v4 >= v32)
      {
LABEL_66:
        LODWORD(v4) = 0;
        goto LABEL_67;
      }
      v40 = v4;
      v41 = *(float **)(v6 + 8);
      do
      {
        v42 = *(float *)(v28 + 8 * v40) + (float)(*(float *)(v28 + 8 * v40 + 4) * 0.5);
        v43 = (float)(v42 + 0.0) * 0.5;
        if ((unint64_t)v41 >= *v19)
        {
          v44 = *(float **)v6;
          v45 = (unint64_t)v41 - *(_QWORD *)v6;
          v46 = (*v19 - *(_QWORD *)v6) >> 3;
          if (2 * (int)v46 <= (v45 >> 3) + 1)
            v47 = (v45 >> 3) + 1;
          else
            v47 = 2 * v46;
          if (v46 >= 0x7FFFFFFF)
            v48 = 0xFFFFFFFFLL;
          else
            v48 = v47;
          if ((_DWORD)v48)
          {
            v49 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v6 + 16, v48);
            v51 = v50;
            v44 = *(float **)v6;
            v41 = *(float **)(v6 + 8);
          }
          else
          {
            v49 = 0;
            v51 = 0;
          }
          v52 = (float *)&v49[v45 & 0x7FFFFFFF8];
          *v52 = v43;
          v52[1] = v42;
          v53 = v52;
          if (v41 == v44)
          {
            v8 = v112;
          }
          else
          {
            v8 = v112;
            do
            {
              v54 = *((_QWORD *)v41 - 1);
              v41 -= 2;
              *((_QWORD *)v53 - 1) = v54;
              v53 -= 2;
            }
            while (v41 != v44);
            v44 = *(float **)v6;
          }
          v41 = v52 + 2;
          *(_QWORD *)v6 = v53;
          *(_QWORD *)(v6 + 8) = v52 + 2;
          *(_QWORD *)(v6 + 16) = &v49[8 * v51];
          if (v44)
            operator delete(v44);
        }
        else
        {
          *v41 = v43;
          v41[1] = v42;
          v41 += 2;
        }
        *(_QWORD *)(v6 + 8) = v41;
        ++v40;
        v28 = *v24;
      }
      while (v40 < ((unint64_t)(v24[1] - *v24) >> 3));
      LODWORD(v4) = 0;
      v21 = v111;
    }
    else
    {
      v55 = v20 - v27;
      *(float *)&v25 = v55;
      objc_msgSend(v23, "addToXOffsetRelativeToParent:", v25);
      v56 = *v24;
      v57 = v24[1] - *v24;
      if ((v57 & 0x7FFFFFFF8) == 0)
        goto LABEL_66;
      v58 = (v57 >> 3);
      v59 = (float *)*v24;
      do
      {
        *v59 = v55 + *v59;
        v59 += 2;
        --v58;
      }
      while (v58);
      v60 = 0;
      v61 = *(float **)(v6 + 8);
      do
      {
        v62 = *(float *)(v56 + 8 * v60) - (float)(*(float *)(v56 + 8 * v60 + 4) * 0.5);
        v63 = (float)(v62 + 0.0) * 0.5;
        v64 = 0.0 - v62;
        if ((unint64_t)v61 >= *v19)
        {
          v65 = *(float **)v6;
          v66 = (unint64_t)v61 - *(_QWORD *)v6;
          v67 = (*v19 - *(_QWORD *)v6) >> 3;
          if (2 * (int)v67 <= (v66 >> 3) + 1)
            v68 = (v66 >> 3) + 1;
          else
            v68 = 2 * v67;
          if (v67 >= 0x7FFFFFFF)
            v69 = 0xFFFFFFFFLL;
          else
            v69 = v68;
          if ((_DWORD)v69)
          {
            v70 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v6 + 16, v69);
            v72 = v71;
            v65 = *(float **)v6;
            v61 = *(float **)(v6 + 8);
          }
          else
          {
            v70 = 0;
            v72 = 0;
          }
          v73 = (float *)&v70[v66 & 0x7FFFFFFF8];
          *v73 = v63;
          v73[1] = v64;
          v74 = v73;
          if (v61 != v65)
          {
            do
            {
              v75 = *((_QWORD *)v61 - 1);
              v61 -= 2;
              *((_QWORD *)v74 - 1) = v75;
              v74 -= 2;
            }
            while (v61 != v65);
            v65 = *(float **)v6;
          }
          v61 = v73 + 2;
          *(_QWORD *)v6 = v74;
          *(_QWORD *)(v6 + 8) = v73 + 2;
          *(_QWORD *)(v6 + 16) = &v70[8 * v72];
          if (v65)
            operator delete(v65);
        }
        else
        {
          *v61 = v63;
          v61[1] = v64;
          v61 += 2;
        }
        *(_QWORD *)(v6 + 8) = v61;
        ++v60;
        v56 = *v24;
        v4 = (id)((unint64_t)(v24[1] - *v24) >> 3);
      }
      while (v60 < v4);
      v21 = v111;
      v8 = v112;
    }
LABEL_67:

    v17 = ++v18;
  }
  while (v8 > v18);
  v76 = 0;
  v77 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  do
  {
    objc_msgSend(v21, "objectAtIndex:", v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "type") == 2)
    {
      objc_msgSend(v79, "setExtraRowsBetweenParentAndSelf:", (*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3);
      v80 = -[CMDiagramShapeHierarchyMapper mapRangesForNode:](self, "mapRangesForNode:", v78);
      v81 = ODIHRangeVector::minDistanceTo(&v113, v80);
      v82 = (float *)*v80;
      v83 = v80[1] - *v80;
      if ((v83 & 0x7FFFFFFF8) != 0)
      {
        v84 = (v83 >> 3);
        do
        {
          *v82 = *v82 - v81;
          v82 += 2;
          --v84;
        }
        while (v84);
      }
      ODIHRangeVector::operator+=(&v113, v80);
      *(float *)&v85 = -v81;
      objc_msgSend(v79, "addToXOffsetRelativeToParent:", v85);
    }

    v76 = ++v77;
  }
  while (v8 > v77);
  v86 = (float *)v113;
  if ((((unint64_t)v114 - v113) & 0x7FFFFFFF8) != 0)
  {
    v87 = *(float *)v113;
    v88 = (((unint64_t)v114 - v113) >> 3);
    do
    {
      *v86 = *v86 - v87;
      v86 += 2;
      --v88;
    }
    while (v88);
    v89 = 0;
    v90 = -v87;
    v91 = 1;
    do
    {
      objc_msgSend(v21, "objectAtIndex:", v89);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v92, "type") == 2)
      {
        *(float *)&v94 = v90;
        objc_msgSend(v93, "addToXOffsetRelativeToParent:", v94);
      }

      v89 = v91;
      v16 = v8 > v91++;
    }
    while (v16);
    v86 = (float *)v113;
    if ((((unint64_t)v114 - v113) & 0x7FFFFFFF8) != 0)
    {
      v95 = 0;
      v96 = *(_QWORD **)(v6 + 8);
      do
      {
        if ((unint64_t)v96 >= *v19)
        {
          v97 = (unint64_t)v96 - *(_QWORD *)v6;
          v98 = (*v19 - *(_QWORD *)v6) >> 3;
          v99 = 2 * v98;
          if (2 * (int)v98 <= (v97 >> 3) + 1)
            v99 = (v97 >> 3) + 1;
          if (v98 >= 0x7FFFFFFF)
            v100 = 0xFFFFFFFFLL;
          else
            v100 = v99;
          if ((_DWORD)v100)
          {
            v101 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v6 + 16, v100);
            v103 = v102;
          }
          else
          {
            v101 = 0;
            v103 = 0;
          }
          v104 = &v101[v97 & 0x7FFFFFFF8];
          *(_QWORD *)v104 = *(_QWORD *)&v86[2 * v95];
          v96 = v104 + 8;
          v106 = *(float **)v6;
          v105 = *(char **)(v6 + 8);
          if (v105 != *(char **)v6)
          {
            do
            {
              v107 = *((_QWORD *)v105 - 1);
              v105 -= 8;
              *((_QWORD *)v104 - 1) = v107;
              v104 -= 8;
            }
            while (v105 != (char *)v106);
            v105 = *(char **)v6;
          }
          *(_QWORD *)v6 = v104;
          *(_QWORD *)(v6 + 8) = v96;
          *(_QWORD *)(v6 + 16) = &v101[8 * v103];
          if (v105)
            operator delete(v105);
        }
        else
        {
          *v96++ = *(_QWORD *)&v86[2 * v95];
        }
        *(_QWORD *)(v6 + 8) = v96;
        ++v95;
        v86 = (float *)v113;
      }
      while (v95 < (((unint64_t)v114 - v113) >> 3));
    }
  }
  if (v86)
  {
    v114 = v86;
    operator delete(v86);
  }
  v4 = v109;
  v5 = v110;
  v7 = v111;
LABEL_103:
  v113 = 0x3F80000000000000;
  LODWORD(v9) = 1.0;
  objc_msgSend(v5, "setXRange:", 0.0078125, v9);
  std::vector<ODIHRange,ChAllocator<ODIHRange>>::insert(v6, *(char **)v6, &v113);

LABEL_104:
  return (void *)v6;
}

- (id)infoForNode:(id)a3
{
  NSMutableDictionary *mNodeInfoMap;
  void *v4;
  void *v5;

  mNodeInfoMap = self->mNodeInfoMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mNodeInfoMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)mapLogicalBoundsWithXRanges:(const void *)a3
{
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = ODIHRangeVector::boundingRange((float **)a3);
  v6 = (float)(v4 + (float)(v5 * -0.5));
  v7 = v5;
  v8 = (float)((float)((float)((*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) * 0.6) + -0.2);
  v9 = 0.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v6;
  return result;
}

- (void)setAbsolutePositionOfNode:(id)a3 parentRow:(int)a4 parentXOffset:(float)a5 index:(unint64_t)a6
{
  void *v9;
  float v10;
  float v11;
  int v12;
  int v13;
  uint64_t v14;
  float v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  id v24;

  v24 = a3;
  -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xRange");
  v11 = v10;
  v13 = v12;
  v14 = a4 + objc_msgSend(v9, "extraRowsBetweenParentAndSelf") + 1;
  objc_msgSend(v9, "setRow:", v14);
  objc_msgSend(v9, "xOffsetRelativeToParent");
  v16 = v15 + a5;
  *(float *)&v17 = v11 + v16;
  LODWORD(v18) = v13;
  objc_msgSend(v9, "setXRange:", v17, v18);
  objc_msgSend(v24, "children");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  if (v20)
  {
    for (i = 0; i != v20; ++i)
    {
      objc_msgSend(v19, "objectAtIndex:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v23 = v16;
      -[CMDiagramShapeHierarchyMapper setAbsolutePositionOfNode:parentRow:parentXOffset:index:](self, "setAbsolutePositionOfNode:parentRow:parentXOffset:index:", v22, v14, i, v23);

    }
  }

}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  float mDefaultScale;
  CGFloat v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  v5 = a3;
  -[CMDiagramShapeHierarchyMapper boundsForNode:](self, "boundsForNode:", v5);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v10 = CGRectGetWidth(v16);
  mDefaultScale = self->super.mDefaultScale;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v12 = CGRectGetHeight(v17) * mDefaultScale;

  v13 = v10 * mDefaultScale;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGRect)boundsForNode:(id)a3
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

  -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", a3);
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

- (void)mapNode:(id)a3 at:(id)a4 scale:(float)a5 offsetX:(float)a6 offsetY:(float)a7 withState:(id)a8
{
  id v14;
  id v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  OADPath *v31;
  void *v32;
  int v33;
  double MidX;
  double v35;
  double v36;
  double MidY;
  double v38;
  double v39;
  double MinY;
  OADMoveToPathElement *v41;
  OADLineToPathElement *v42;
  float v43;
  unint64_t v44;
  OADLineToPathElement *v45;
  OADLineToPathElement *v46;
  OADLineToPathElement *v47;
  double v48;
  double MaxX;
  OADMoveToPathElement *v50;
  OADLineToPathElement *v51;
  CMDiagramPointMapper *v52;
  void *v53;
  CMDiagramPointMapper *v54;
  OADStroke *v55;
  void *v56;
  void *v57;
  char isKindOfClass;
  OADStroke *v59;
  double v60;
  void *v61;
  void *v62;
  OADSolidFill *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  double v69;
  double v70;
  double v71;
  double MinX;
  double MaxY;
  double v74;
  CMDiagramPointRoundedRectMapper *v75;
  OADOrientedBounds *v76;
  CGRect v77;
  id v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v78 = a3;
  v14 = a4;
  v15 = a8;
  -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v78);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "treeDepth");

  if (v17 <= self->super.mMaxMappableTreeDepth)
  {
    if ((v17 & 0x80000000) == 0)
    {
      -[CMDiagramShapeHierarchyMapper boundsForNode:](self, "boundsForNode:", v78);
      +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
      v77.origin.x = v18;
      v77.origin.y = v19;
      v77.size.width = v20;
      v77.size.height = v21;
      v76 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v18, v19, v20, v21);
      v75 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointRoundedRectMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v78, self->super.super.mDrawingContext, v76, self);
      -[CMDiagramPointRoundedRectMapper mapAt:withState:](v75, "mapAt:withState:", v14, v15);
      if (v17)
      {
        objc_msgSend(v78, "parent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMDiagramShapeHierarchyMapper boundsForNode:](self, "boundsForNode:", v22);
        +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;

        v31 = objc_alloc_init(OADPath);
        -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v78);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "connectToVerticalSide");

        if (v33)
        {
          v79.origin.x = v24;
          v79.origin.y = v26;
          v79.size.width = v28;
          v79.size.height = v30;
          MidX = CGRectGetMidX(v79);
          if (MidX <= CGRectGetMinX(v77)
            || (v80.origin.x = v24,
                v80.origin.y = v26,
                v80.size.width = v28,
                v80.size.height = v30,
                v35 = CGRectGetMidX(v80),
                v35 >= CGRectGetMaxX(v77)))
          {
            v84.origin.x = v24;
            v84.origin.y = v26;
            v84.size.width = v28;
            v84.size.height = v30;
            v38 = CGRectGetMidX(v84);
            v85.origin.x = v24;
            v85.origin.y = v26;
            v85.size.width = v28;
            v85.size.height = v30;
            MaxY = CGRectGetMaxY(v85);
            v86.origin.x = v24;
            v86.origin.y = v26;
            v86.size.width = v28;
            v86.size.height = v30;
            v48 = CGRectGetMidX(v86);
            if (v48 >= CGRectGetMidX(v77))
              MaxX = CGRectGetMaxX(v77);
            else
              MaxX = CGRectGetMinX(v77);
            v36 = MaxX;
            MidY = CGRectGetMidY(v77);
          }
          else
          {
            MinX = CGRectGetMinX(v77);
            v81.origin.x = v24;
            v81.origin.y = v26;
            v81.size.width = v28;
            v81.size.height = v30;
            MaxY = CGRectGetMaxY(v81);
            v36 = CGRectGetMinX(v77);
            MidY = CGRectGetMidY(v77);
            v38 = MinX + -0.129999995;
          }
          v50 = -[OADToPointPathElement initWithToPoint:]([OADMoveToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v38 << 32, (unint64_t)(int)MaxY << 32);
          -[OADPath addElement:](v31, "addElement:", v50);
          v51 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v38 << 32, (unint64_t)(int)MidY << 32);

          -[OADPath addElement:](v31, "addElement:", v51);
          v47 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v36 << 32, (unint64_t)(int)MidY << 32);

          -[OADPath addElement:](v31, "addElement:", v47);
        }
        else
        {
          v82.origin.x = v24;
          v82.origin.y = v26;
          v82.size.width = v28;
          v82.size.height = v30;
          v74 = CGRectGetMidX(v82);
          v83.origin.x = v24;
          v83.origin.y = v26;
          v83.size.width = v28;
          v83.size.height = v30;
          v39 = CGRectGetMaxY(v83);
          MinX = CGRectGetMidX(v77);
          MinY = CGRectGetMinY(v77);
          v41 = -[OADToPointPathElement initWithToPoint:]([OADMoveToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v74 << 32, (unint64_t)(int)v39 << 32);
          -[OADPath addElement:](v31, "addElement:", v41);
          v42 = [OADLineToPathElement alloc];
          v43 = MinY + -10.0;
          v44 = (unint64_t)(int)v43 << 32;
          v45 = -[OADToPointPathElement initWithToPoint:](v42, "initWithToPoint:", (unint64_t)(int)v74 << 32, v44);

          -[OADPath addElement:](v31, "addElement:", v45);
          v46 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)MinX << 32, v44);

          -[OADPath addElement:](v31, "addElement:", v46);
          v47 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)MinX << 32, (unint64_t)(int)MinY << 32);

          -[OADPath addElement:](v31, "addElement:", v47);
        }

        v52 = [CMDiagramPointMapper alloc];
        objc_msgSend(v78, "parentTransition");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:](v52, "initWithPoint:drawingContext:orientedBounds:parent:", v53, self->super.super.mDrawingContext, v76, self);

        -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](v54, "applyDiagramStyleToShapeProperties");
        -[CMDiagramPointMapper stroke](v54, "stroke");
        v55 = (OADStroke *)objc_claimAutoreleasedReturnValue();
        -[CMDiagramPointMapper fill](v75, "fill");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55
          && (-[OADStroke fill](v55, "fill"),
              v57 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v57,
              (isKindOfClass & 1) == 0))
        {
          v59 = v55;
        }
        else
        {
          v59 = objc_alloc_init(OADStroke);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[OADStroke setFill:](v59, "setFill:", v56);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v56, "stops");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              v63 = objc_alloc_init(OADSolidFill);
              objc_msgSend(v62, "color");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[OADSolidFill setColor:](v63, "setColor:", v64);

              -[OADStroke setFill:](v59, "setFill:", v63);
              v56 = v63;
            }
          }
          LODWORD(v60) = 1.0;
          -[OADStroke setWidth:](v59, "setWidth:", v60, *(_QWORD *)&MinX);
        }
        +[CMShapeRenderer renderDiagramPath:fill:stroke:state:drawingContext:](CMShapeRenderer, "renderDiagramPath:fill:stroke:state:drawingContext:", v31, 0, v59, v15, self->super.super.mDrawingContext, *(_QWORD *)&MinX);

      }
    }
    objc_msgSend(v78, "children");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");
    if (v66)
    {
      for (i = 0; i != v66; ++i)
      {
        objc_msgSend(v65, "objectAtIndex:", i);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v69 = a5;
        *(float *)&v70 = a6;
        *(float *)&v71 = a7;
        -[CMDiagramShapeHierarchyMapper mapNode:at:scale:offsetX:offsetY:withState:](self, "mapNode:at:scale:offsetX:offsetY:withState:", v68, v14, v15, v69, v70, v71);

      }
    }

  }
}

- (void)mapLayerNodes:(id)a3 at:(id)a4 scale:(float)a5 offsetX:(float)a6 offsetY:(float)a7 withState:(id)a8
{
  id v14;
  void *v15;
  unint64_t v16;
  double v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  OADOrientedBounds *v22;
  CMDiagramPointRoundedRectMapper *v23;
  id v25;

  v25 = a4;
  v14 = a8;
  objc_msgSend(a3, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16 >= 2)
  {
    v17 = a6;
    v18 = 2;
    v19 = 1;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", 0.0, (float)(a7 + (float)((float)((float)(int)objc_msgSend(v21, "row") * 0.6) * a5)), v17, (float)(a5 * 0.4));
      v23 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointRoundedRectMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v20, self->super.super.mDrawingContext, v22, self);
      -[CMDiagramPointRoundedRectMapper mapAt:withState:](v23, "mapAt:withState:", v25, v14);

      v19 = v18;
    }
    while (v16 > v18++);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNodeInfoMap, 0);
}

@end
