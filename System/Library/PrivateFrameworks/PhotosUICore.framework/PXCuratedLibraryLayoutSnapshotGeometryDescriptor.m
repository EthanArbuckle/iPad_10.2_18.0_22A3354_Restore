@implementation PXCuratedLibraryLayoutSnapshotGeometryDescriptor

- (PXCuratedLibraryLayoutSnapshotGeometryDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutSnapshotGeometryDescriptor.m"), 33, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor init]");

  abort();
}

- (PXCuratedLibraryLayoutSnapshotGeometryDescriptor)initWithLayout:(id)a3
{
  id v4;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSDictionary *sectionGeometryDescriptorsByIndexPath;
  double v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PXCuratedLibraryLayoutSnapshotGeometryDescriptor;
  v5 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "libraryBodyLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataSourceIdentifier = objc_msgSend(v7, "identifier");

    v5->_zoomLevel = objc_msgSend(v4, "presentedZoomLevel");
    objc_msgSend(v4, "presentedVisibleRect");
    v5->_visibleRect.origin.x = v8;
    v5->_visibleRect.origin.y = v9;
    v5->_visibleRect.size.width = v10;
    v5->_visibleRect.size.height = v11;
    v5->_offset = (CGPoint)*MEMORY[0x1E0C9D538];
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v6)
    {
      objc_msgSend(v6, "orientedContentTransform");
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
      v31 = 0u;
    }
    v28 = v31;
    v29 = v32;
    v30 = v33;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __67__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_initWithLayout___block_invoke;
    v23 = &unk_1E5138298;
    v24 = v4;
    v13 = v5;
    v25 = v13;
    v26 = v6;
    v27 = v12;
    v14 = v12;
    v15 = v6;
    objc_msgSend(v15, "enumerateAssetsSectionSublayoutsUsingBlock:", &v20);
    v16 = objc_msgSend(v14, "copy", v20, v21, v22, v23);
    sectionGeometryDescriptorsByIndexPath = v13->_sectionGeometryDescriptorsByIndexPath;
    v13->_sectionGeometryDescriptorsByIndexPath = (NSDictionary *)v16;

    objc_msgSend(v15, "defaultInterlayoutSpacing");
    v13->_intersectionSpacing = v18;

  }
  return v5;
}

- (CGRect)visibleRect
{
  CGFloat v3;
  CGFloat v4;

  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor offset](self, "offset");
  return CGRectOffset(self->_visibleRect, v3, v4);
}

- (id)geometryDescriptorForSectionAtIndexPath:(PXSimpleIndexPath *)a3
{
  NSDictionary *sectionGeometryDescriptorsByIndexPath;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];

  sectionGeometryDescriptorsByIndexPath = self->_sectionGeometryDescriptorsByIndexPath;
  v5 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sectionGeometryDescriptorsByIndexPath, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor offset](self, "offset");
  objc_msgSend(v7, "sectionGeometryDescriptorOffsetBy:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSIndexSet)sections
{
  id v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v4 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self, "dataSourceIdentifier");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSDictionary keyEnumerator](self->_sectionGeometryDescriptorsByIndexPath, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v10)
          objc_msgSend(v10, "px_simpleIndexPathValue");
        if (!v4)
          objc_msgSend(v3, "addIndex:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSIndexSet *)v11;
}

- (void)extrapolateSectionsBetween:(int64_t)a3 and:(int64_t)a4 withAnchorSection:(int64_t)a5
{
  void *v7;
  NSObject *v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  int64x2_t v49;
  __int128 buf;
  int64x2_t v51;
  uint64_t v52;
  CGRect v53;
  CGRect v54;

  v52 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[NSDictionary mutableCopy](self->_sectionGeometryDescriptorsByIndexPath, "mutableCopy");
    v9 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self, "dataSourceIdentifier");
    v10 = objc_msgSend(v7, "firstIndex");
    if (v10 >= a5)
    {
      v12 = 0;
    }
    else
    {
      v11 = v10;
      v12 = 0;
      v46 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v13 = objc_msgSend(v7, "containsIndex:", v11);
        *(_QWORD *)&buf = v9;
        *((_QWORD *)&buf + 1) = v11;
        v51 = v46;
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v15;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, v14);
        }

        ++v11;
      }
      while (a5 != v11);
    }
    v16 = objc_msgSend(v7, "lastIndex");
    if (v16 > a5)
    {
      v17 = v16;
      v47 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v18 = objc_msgSend(v7, "containsIndex:", v17);
        *(_QWORD *)&buf = v9;
        *((_QWORD *)&buf + 1) = v17;
        v51 = v47;
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v20;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, v19);
        }

        --v17;
      }
      while (v17 > a5);
    }
    v21 = objc_msgSend(v7, "firstIndex", self);
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = v21;
    v48 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v51 = v48;
    objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __101__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_extrapolateSectionsBetween_and_withAnchorSection___block_invoke(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = a4;
    if (a3 < a4)
      v25 = a3;
    v26 = v25 & ~(v25 >> 63);
    v43 = v7;
    v27 = objc_msgSend(v7, "firstIndex");
    if (v27 - 1 >= v26)
    {
      v29 = v27;
      do
      {
        --v29;
        objc_msgSend(v24, "sectionRect");
        objc_msgSend(v24, "sectionGeometryDescriptorOffsetBy:", 0.0, -(CGRectGetHeight(v53) + *(double *)(v42 + 16)));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)&buf = v9;
        *((_QWORD *)&buf + 1) = v29;
        v51 = v48;
        objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v28, v30);

        v24 = v28;
      }
      while (v29 > v26);
    }
    else
    {
      v28 = v24;
    }
    v31 = objc_msgSend(v7, "lastIndex");
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = v31;
    v51 = v48;
    objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    __101__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_extrapolateSectionsBetween_and_withAnchorSection___block_invoke(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 <= a4)
      v35 = a4;
    else
      v35 = a3;
    v36 = objc_msgSend(v7, "lastIndex") + 1;
    if (v36 <= v35)
    {
      v49 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v38 = v42;
      do
      {
        objc_msgSend(v34, "sectionRect");
        objc_msgSend(v34, "sectionGeometryDescriptorOffsetBy:", 0.0, CGRectGetHeight(v54) + *(double *)(v42 + 16));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)&buf = v9;
        *((_QWORD *)&buf + 1) = v36;
        v51 = v49;
        objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &buf);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v37, v39);

        ++v36;
        v34 = v37;
      }
      while (v36 <= v35);
    }
    else
    {
      v37 = v34;
      v38 = v42;
    }
    v40 = -[NSObject copy](v8, "copy");
    v41 = *(void **)(v38 + 8);
    *(_QWORD *)(v38 + 8) = v40;

    v7 = v43;
  }
  else
  {
    PLCuratedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "cannot extrapolate sections in %@", (uint8_t *)&buf, 0xCu);
    }
  }

}

- (void)compactifySectionsBeyondVisibleRectWithAnchorSection:(int64_t)a3
{
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int64_t v10;
  void *v11;
  void *v12;
  double v13;
  double MinY;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  double v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MaxY;
  double v43;
  double v44;
  double v45;
  double v46;
  PXCuratedLibrarySectionGeometryDescriptor *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  void *v56;
  PXCuratedLibrarySectionGeometryDescriptor *v57;
  BOOL v58;
  int64_t v59;
  uint64_t v60;
  int64_t v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double v95;
  PXCuratedLibrarySectionGeometryDescriptor *v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  void *v105;
  PXCuratedLibrarySectionGeometryDescriptor *v106;
  uint64_t v107;
  NSDictionary *sectionGeometryDescriptorsByIndexPath;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  int64x2_t v119;
  int64x2_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  double v140;
  CGFloat rect;
  double recta;
  CGFloat v143;
  CGFloat v144;
  _QWORD v145[2];
  int64x2_t v146;
  _QWORD v147[2];
  int64x2_t v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;

  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](self, "zoomLevel") == 3
    && objc_msgSend(v5, "containsIndex:", a3))
  {
    x = self->_visibleRect.origin.x;
    y = self->_visibleRect.origin.y;
    width = self->_visibleRect.size.width;
    height = self->_visibleRect.size.height;
    v10 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self, "dataSourceIdentifier");
    v113 = self;
    v11 = (void *)-[NSDictionary mutableCopy](self->_sectionGeometryDescriptorsByIndexPath, "mutableCopy");
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interitemSpacingForDays");
    v115 = v13;

    v135 = *MEMORY[0x1E0C9D538];
    v136 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v111 = y;
    v112 = x;
    v149.origin.x = x;
    v149.origin.y = y;
    v109 = height;
    v110 = width;
    v149.size.width = width;
    v149.size.height = height;
    MinY = CGRectGetMinY(v149);
    v114 = v5;
    v15 = objc_msgSend(v5, "firstIndex");
    if (v15 <= a3)
    {
      v16 = v15;
      v17 = 0;
      v116 = MinY - v115;
      v117 = -1.79769313e308;
      v119 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v18 = v136;
      v19 = a3;
      v121 = MinY;
      do
      {
        v147[0] = v10;
        v147[1] = v19;
        v148 = v119;
        objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", v147);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sectionGeometryDescriptorOffsetBy:", v135, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "sectionRect");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        objc_msgSend(v22, "keyAssetRect");
        v143 = v31;
        v137 = v32;
        v139 = v33;
        rect = v34;
        objc_msgSend(v22, "headerRect");
        v36 = v35;
        v38 = v37;
        v129 = v40;
        v131 = v39;
        v150.origin.x = v24;
        v150.origin.y = v26;
        v150.size.width = v28;
        v150.size.height = v30;
        v133 = v36;
        v127 = v28;
        if (CGRectGetMaxY(v150) >= MinY)
        {
          v155.origin.x = v143;
          v155.origin.y = v137;
          v155.size.height = v139;
          v155.size.width = rect;
          if (CGRectGetMaxY(v155) >= MinY)
          {
            v123 = v30;
            v125 = v18;
            v44 = v38;
            v45 = v137;
          }
          else
          {
            v156.origin.x = v143;
            v156.size.height = v139;
            v156.origin.y = v137;
            v156.size.width = rect;
            v46 = v116 - CGRectGetMaxY(v156);
            v26 = v26 + v46;
            v123 = v30 - v46;
            v125 = v18 + v46;
            v143 = v24;
            rect = v28;
            v44 = v38;
            v45 = v137 + v46;
          }
        }
        else
        {
          v151.origin.x = v143;
          v151.origin.y = v137;
          v151.size.height = v139;
          v151.size.width = rect;
          v41 = CGRectGetHeight(v151);
          v152.origin.x = v24;
          v152.origin.y = v26;
          v152.size.width = v28;
          v152.size.height = v30;
          MaxY = CGRectGetMaxY(v152);
          if (MaxY < v117)
            MaxY = v117;
          v43 = MaxY - v41;
          v153.origin.x = v24;
          v153.origin.y = v26;
          v153.size.width = v28;
          v153.size.height = v30;
          v44 = v43;
          v125 = v18 + v43 - CGRectGetMinY(v153);
          ++v17;
          v139 = v41;
          if (v17 == 3)
          {
            v154.origin.x = v24;
            v154.origin.y = v44;
            v154.size.width = v28;
            v154.size.height = v41;
            v117 = CGRectGetMaxY(v154);
          }
          v143 = v24;
          rect = v28;
          v45 = v44;
          v123 = v41;
          v26 = v44;
        }
        v47 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
        objc_msgSend(v22, "headerCornerRadius");
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v55 = v54;
        objc_msgSend(v22, "headerAsset");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:](v47, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v56, objc_msgSend(v22, "visualPosition"), v24, v26, v127, v123, v133, v44, v131, v129, *(_QWORD *)&v143, *(_QWORD *)&v45, *(_QWORD *)&rect, *(_QWORD *)&v139, __PAIR64__(v51, v49), __PAIR64__(v55, v53));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v57, v20);

        v58 = v19-- <= v16;
        MinY = v121;
        v18 = v125;
      }
      while (!v58);
    }
    v157.origin.y = v111;
    v157.origin.x = v112;
    v157.size.height = v109;
    v157.size.width = v110;
    v122 = CGRectGetMaxY(v157);
    v5 = v114;
    v59 = objc_msgSend(v114, "lastIndex");
    if (v59 >= a3)
    {
      v60 = 0;
      v61 = v59 + 1;
      v118 = 1.79769313e308;
      v120 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v145[0] = v10;
        v145[1] = a3;
        v146 = v120;
        objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", v145);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "sectionGeometryDescriptorOffsetBy:", v135, v136);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "sectionRect");
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v72 = v71;
        objc_msgSend(v64, "keyAssetRect");
        v74 = v73;
        v126 = v76;
        v128 = v75;
        v78 = v77;
        objc_msgSend(v64, "headerRect");
        v80 = v79;
        v82 = v81;
        v130 = v84;
        v132 = v83;
        v158.origin.x = v66;
        v158.origin.y = v68;
        v158.size.width = v70;
        v158.size.height = v72;
        v138 = v80;
        v134 = v82;
        if (CGRectGetMinY(v158) <= v122)
        {
          v144 = v78;
          v140 = v66;
          recta = v68;
          v164.origin.x = v66;
          v164.origin.y = v68;
          v164.size.width = v70;
          v164.size.height = v72;
          v92 = v72;
          if (CGRectGetMaxY(v164) <= v122)
          {
            v124 = v72;
            v91 = v128;
            v66 = v74;
            v89 = v126;
          }
          else
          {
            v165.origin.x = v74;
            v165.origin.y = v128;
            v165.size.width = v126;
            v165.size.height = v78;
            if (CGRectGetMinY(v165) >= v122)
            {
              v124 = v72;
              v89 = v126;
              v91 = v128;
              v66 = v74;
            }
            else
            {
              v166.origin.x = v74;
              v166.origin.y = v128;
              v166.size.width = v126;
              v166.size.height = v78;
              v93 = v115 + CGRectGetMaxY(v166);
              v94 = v122;
              if (v122 < v93)
                v94 = v93;
              v167.origin.x = v66;
              v167.origin.y = recta;
              v167.size.width = v70;
              v167.size.height = v92;
              v95 = v94 - CGRectGetMaxY(v167);
              v136 = v136 + v95;
              v124 = v92 + v95;
              v89 = v126;
              v91 = v128;
              v66 = v74;
            }
          }
          v90 = v70;
        }
        else
        {
          v159.origin.x = v74;
          v159.size.width = v126;
          v159.origin.y = v128;
          v159.size.height = v78;
          v85 = CGRectGetHeight(v159);
          v160.origin.x = v66;
          v160.origin.y = v68;
          v160.size.width = v70;
          v160.size.height = v72;
          v86 = v136 + v85 - CGRectGetHeight(v160);
          v161.origin.x = v66;
          v161.origin.y = v68;
          v161.size.width = v70;
          v161.size.height = v72;
          v87 = CGRectGetMinY(v161);
          if (v87 >= v118)
            v88 = v118;
          else
            v88 = v87;
          v162.origin.x = v66;
          v162.origin.y = v68;
          v162.size.width = v70;
          v162.size.height = v72;
          v136 = v86 + v88 - CGRectGetMinY(v162);
          ++v60;
          v89 = v70;
          v124 = v85;
          if (v60 == 3)
          {
            v163.origin.x = v66;
            v163.origin.y = v88;
            v163.size.width = v70;
            v163.size.height = v85;
            v118 = CGRectGetMinY(v163);
          }
          v140 = v66;
          recta = v88;
          v90 = v70;
          v144 = v85;
          v91 = v88;
        }
        v96 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
        objc_msgSend(v64, "headerCornerRadius");
        v98 = v97;
        v100 = v99;
        v102 = v101;
        v104 = v103;
        objc_msgSend(v64, "headerAsset");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:](v96, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v105, objc_msgSend(v64, "visualPosition"), v140, recta, v90, v124, v138, v134, v132, v130, *(_QWORD *)&v66, *(_QWORD *)&v91, *(_QWORD *)&v89, *(_QWORD *)&v144, __PAIR64__(v100, v98), __PAIR64__(v104, v102));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v106, v62);

        ++a3;
      }
      while (v61 != a3);
    }
    v107 = objc_msgSend(v11, "copy");
    sectionGeometryDescriptorsByIndexPath = v113->_sectionGeometryDescriptorsByIndexPath;
    v113->_sectionGeometryDescriptorsByIndexPath = (NSDictionary *)v107;

  }
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSDictionary *sectionGeometryDescriptorsByIndexPath;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  CGPoint v20;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p\n"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("\tdataSourceIdentifier=%li\n"), -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self, "dataSourceIdentifier"));
  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor offset](self, "offset");
  NSStringFromCGPoint(v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\toffset=%@\n"), v7);

  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke;
  v18[3] = &unk_1E51460E8;
  v18[4] = self;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v18);

  sectionGeometryDescriptorsByIndexPath = self->_sectionGeometryDescriptorsByIndexPath;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke_2;
  v16[3] = &unk_1E51382C0;
  v12 = v10;
  v17 = v12;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](sectionGeometryDescriptorsByIndexPath, "enumerateKeysAndObjectsUsingBlock:", v16);
  objc_msgSend(v12, "appendString:", CFSTR(">"));
  v13 = v17;
  v14 = v12;

  return v14;
}

- (int64_t)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (int64_t)skimmingDataSourceIdentifier
{
  return self->_skimmingDataSourceIdentifier;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionGeometryDescriptorsByIndexPath, 0);
}

void __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  int64x2_t v12;
  CGRect v13;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[1];
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v11[0] = objc_msgSend(v4, "dataSourceIdentifier");
  v11[1] = a2;
  v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v6, "px_valueWithSimpleIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v8, "sectionRect");
  NSStringFromCGRect(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\t%lu: %@\n"), a2, v10);

}

void __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (a2)
    objc_msgSend(a2, "px_simpleIndexPathValue");
  v6 = *(void **)(a1 + 32);
  PXSimpleIndexPathDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\t%@: %@\n"), v7, v5, 0, 0, 0, 0);

}

id __101__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_extrapolateSectionsBetween_and_withAnchorSection___block_invoke(void *a1)
{
  id v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  CGRect v16;

  v1 = a1;
  objc_msgSend(v1, "sectionRect");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  PXRectEdgeValue();
  v11 = v10;
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  objc_msgSend(v1, "sectionGeometryDescriptorWithMaximumHeightBelowHeader:", CGRectGetWidth(v16) * 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sectionRect");
  PXRectEdgeValue();
  objc_msgSend(v12, "sectionGeometryDescriptorOffsetBy:", 0.0, v11 - v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __67__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_initWithLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  PXCuratedLibrarySectionGeometryDescriptor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  PXCuratedLibrarySectionGeometryDescriptor *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double MaxY;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double x;
  double y;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  PXCuratedLibrarySectionGeometryDescriptor *v80;
  void *v81;
  __int128 v82;
  uint64_t v83;
  void *v84;
  void *v85;
  __int128 v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  uint64_t v99;
  _OWORD v100[2];
  uint8_t buf[32];
  __int128 v102;
  uint64_t v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "bodyContentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "presentedGeometryDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
    objc_msgSend(v7, "sectionRect");
    objc_msgSend(v5, "padding");
    PXEdgeInsetsInsetRect();
    v94 = v10;
    v98 = v9;
    v91 = v12;
    v92 = v11;
    objc_msgSend(v7, "headerRect");
    v89 = v14;
    v90 = v13;
    v87 = v16;
    v88 = v15;
    objc_msgSend(v7, "keyAssetRect");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v7, "headerCornerRadius");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v7, "headerAsset");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:](v8, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:", v33, v98, v94, v92, v91, v90, v89, v88, v87, v18, v20, v22, v24, __PAIR64__(v28, v26), __PAIR64__(v32, v30));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "presentedGeometryDescriptor");
      v34 = (PXCuratedLibrarySectionGeometryDescriptor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
  }
  objc_msgSend(v5, "headerLayout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v6 && v35)
  {
    v37 = *MEMORY[0x1E0C9D538];
    v38 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v35, "contentSize");
    objc_msgSend(v6, "convertRect:fromLayout:", v36, v37, v38, v39, v40);
    v42 = v41;
    v44 = v43;
    -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v34, "sectionRect");
    v46 = v45;
    v48 = v47;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v36, "alpha");
      if (v49 <= 0.0)
      {
        -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v34, "sectionRect");
        MaxY = CGRectGetMaxY(v104);
        v105.origin.x = v46;
        v105.origin.y = v42;
        v105.size.width = v48;
        v105.size.height = v44;
        v51 = MaxY - CGRectGetHeight(v105);
        if (v42 >= v51)
          v42 = v51;
      }
    }
    -[PXCuratedLibrarySectionGeometryDescriptor sectionGeometryDescriptorWithHeaderRect:](v34, "sectionGeometryDescriptorWithHeaderRect:", v46, v42, v48, v44);
    v52 = objc_claimAutoreleasedReturnValue();

    v34 = (PXCuratedLibrarySectionGeometryDescriptor *)v52;
  }
  if (!v34)
    goto LABEL_29;
  v53 = *(_QWORD *)off_1E50B8778;
  v54 = *((_QWORD *)off_1E50B8778 + 1);
  v55 = *((_QWORD *)off_1E50B8778 + 2);
  v56 = *((_QWORD *)off_1E50B8778 + 3);
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  x = v106.origin.x;
  y = v106.origin.y;
  if (!CGRectIsNull(v106) && (PXPointIsNull() & 1) == 0)
  {
    -[PXCuratedLibrarySectionGeometryDescriptor sectionGeometryDescriptorOffsetBy:](v34, "sectionGeometryDescriptorOffsetBy:", x, y);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "presentedSectionIndexPath");
      v53 = *(_QWORD *)buf;
      v54 = *(_QWORD *)&buf[8];
      v56 = *(_QWORD *)&buf[24];
      v99 = *(_QWORD *)&buf[16];
    }
    else
    {
      v56 = 0;
      v99 = 0;
      v54 = 0;
      v53 = 0;
    }
    objc_msgSend(v59, "sectionGeometryDescriptorWithVisualPosition:", v54);
    v34 = (PXCuratedLibrarySectionGeometryDescriptor *)objc_claimAutoreleasedReturnValue();

    if (v53 != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
    {
      if (objc_msgSend(v5, "presentedSkimming"))
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = v53;
        memset(buf, 0, sizeof(buf));
        objc_msgSend(*(id *)(a1 + 48), "presentedDataSource");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "assetCollectionReference");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v60;
        objc_msgSend(v60, "assetCollectionReferenceNearestToObjectReference:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        if (v61)
          objc_msgSend(v61, "indexPath");
        else
          memset(buf, 0, sizeof(buf));

        -[PXCuratedLibrarySectionGeometryDescriptor sectionGeometryDescriptorWithVisualPosition:](v34, "sectionGeometryDescriptorWithVisualPosition:", *(_QWORD *)&buf[8]);
        v66 = objc_claimAutoreleasedReturnValue();

        v97 = *(void **)(a1 + 56);
        v100[0] = *(_OWORD *)buf;
        v100[1] = *(_OWORD *)&buf[16];
        objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", v100);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v66, v67);

        v34 = (PXCuratedLibrarySectionGeometryDescriptor *)v66;
      }
      else
      {
        PLCuratedLibraryGetLog();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_QWORD *)buf = v53;
          *(_QWORD *)&buf[8] = v54;
          *(_QWORD *)&buf[16] = v99;
          *(_QWORD *)&buf[24] = v56;
          PXSimpleIndexPathDescription();
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = *(_QWORD *)(a1 + 40);
          v65 = *(_QWORD *)(v64 + 24);
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v96;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v65;
          LOWORD(v102) = 2112;
          *(_QWORD *)((char *)&v102 + 2) = v64;
          _os_log_impl(&dword_1A6789000, v63, OS_LOG_TYPE_DEFAULT, "The index path (%@) of the presented section (%@) doesn't match the data source identifier (%li) of the library layout (%@). This can lead to missing transition animations.", buf, 0x2Au);

        }
      }
    }
    v55 = v99;
    if (!v34)
    {
LABEL_29:
      v68 = *MEMORY[0x1E0C9D538];
      v69 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v5, "contentSize");
      objc_msgSend(*(id *)(a1 + 48), "convertRect:fromDescendantLayout:", v5, v68, v69, v70, v71);
      v73 = v72;
      v75 = v74;
      v77 = v76;
      v79 = v78;
      v80 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
      HIDWORD(v86) = *((_DWORD *)off_1E50B8248 + 3);
      *(_QWORD *)((char *)&v86 + 4) = *(_QWORD *)((char *)off_1E50B8248 + 4);
      LODWORD(v86) = *(_DWORD *)off_1E50B8248;
      v34 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:](v80, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", 0, a2, v73, v75, v77, v79, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), v86);
      objc_msgSend(*(id *)(a1 + 48), "presentedDataSource");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v81, "identifier");

      if (!v34)
        goto LABEL_33;
      v55 = 0x7FFFFFFFFFFFFFFFLL;
      v54 = a2;
      v56 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v53 != *(_QWORD *)off_1E50B7E98)
  {
    v82 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&buf[16] = v82;
    v102 = *(_OWORD *)(a1 + 96);
    -[PXCuratedLibrarySectionGeometryDescriptor sectionGeometryDescriptorTransformedBy:](v34, "sectionGeometryDescriptorTransformedBy:", buf);
    v83 = objc_claimAutoreleasedReturnValue();

    v84 = *(void **)(a1 + 56);
    *(_QWORD *)buf = v53;
    *(_QWORD *)&buf[8] = v54;
    *(_QWORD *)&buf[16] = v55;
    *(_QWORD *)&buf[24] = v56;
    objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", buf);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v83, v85);

    v34 = (PXCuratedLibrarySectionGeometryDescriptor *)v83;
  }
LABEL_33:

}

@end
