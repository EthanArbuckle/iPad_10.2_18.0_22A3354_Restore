@implementation CRTrackedRegionGroup

- (CRTrackedRegionGroup)initWithRegion:(id)a3
{
  id v4;
  CRTrackedRegionGroup *v5;
  id v6;
  void *v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  SEL v12;
  void *v13;
  void *v14;
  void *v15;
  SEL v16;
  CRVCQuad *v17;
  void *v18;
  void *v19;
  SEL v20;
  CRVCQuad *v21;
  SEL v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  SEL v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRTrackedRegionGroup;
  v5 = -[CRTrackedRegionGroup init](&v29, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "trackingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);
    objc_setProperty_atomic(v5, v9, v8, 56);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
    objc_setProperty_atomic(v5, v11, v10, 64);

    v5->_numberOfLines = objc_msgSend(v4, "numberOfLines");
    v5->_isInlineGroup = 0;
    objc_setProperty_atomic(v5, v12, 0, 128);
    objc_msgSend(v4, "boundingQuad");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTrackedRegionGroup setBoundingQuad:](v5, "setBoundingQuad:", v13);

    objc_msgSend(v4, "boundingQuad");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTrackedRegionGroup setOriginalBoundingQuad:](v5, "setOriginalBoundingQuad:", v14);

    -[CRTrackedRegionGroup setBoundingQuadHomography:](v5, "setBoundingQuadHomography:", *MEMORY[0x1E0C83FE8], *(double *)(MEMORY[0x1E0C83FE8] + 16), *(double *)(MEMORY[0x1E0C83FE8] + 32));
    -[CRTrackedRegionGroup setHomographyGroupID:](v5, "setHomographyGroupID:", 0);
    -[CRTrackedRegionGroup setInitialOrthogonalityScore:](v5, "setInitialOrthogonalityScore:", 1.0);
    -[CRTrackedRegionGroup setTrackNeedsReplacement:](v5, "setTrackNeedsReplacement:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v16, v15, 136);

    v17 = [CRVCQuad alloc];
    objc_msgSend(v4, "boundingQuad");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "denormalizedQuad");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CRVCQuad initWithImageSpaceQuad:uuid:](v17, "initWithImageSpaceQuad:uuid:", v19, objc_getProperty(v5, v20, 136, 1));
    objc_setProperty_atomic(v5, v22, v21, 80);

    -[CRTrackedRegionGroup setTextAlignment:](v5, "setTextAlignment:", objc_msgSend(v4, "textAlignment"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "geometryInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "numberOfLines") < 2)
      {
        v24 = 1;
        v5->_isTextLeftJustified = 1;
      }
      else
      {
        v5->_isTextLeftJustified = objc_msgSend(v23, "isLeftJustified");
        v24 = objc_msgSend(v23, "isRightJustified");
      }
      v5->_isTextRightJustified = v24;
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "estimatedLineHeight");
      objc_msgSend(v25, "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v5, v27, v26, 128);

    }
    else
    {
      *(_WORD *)&v5->_isTextLeftJustified = 0;
    }
    v5->_groupChildrenAlignment = 0;
    v5->_layoutDirection = objc_msgSend(v4, "layoutDirection");
  }

  return v5;
}

- (BOOL)addGroupRegionIfValid:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  __double2 v25;
  __double2 v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
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
  _BOOL4 v80;
  _BOOL4 v81;
  int v82;
  double v83;
  double v84;
  double v85;
  _BOOL4 v86;
  _BOOL4 v87;
  int v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  CRImageSpaceQuad *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  void *v146;
  void *v147;
  char v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  const char *v153;
  void *v154;
  void *v155;
  double v156;
  void *v157;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  double v165;
  void *v166;
  double v167;
  void *v168;
  double v169;
  void *v170;
  void *v171;
  double v172;
  double v173;
  void *v174;
  id v175;
  id v176;
  double v177;
  double v178;
  id v179;
  void *v180;
  void *v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _BYTE v186[128];
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "layoutDirection");
  if (v8 == -[CRTrackedRegionGroup layoutDirection](self, "layoutDirection"))
  {
    -[NSMutableArray lastObject](self->_children, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baselineAngle");
    v11 = v10;
    objc_msgSend(v6, "baselineAngle");
    v13 = v11 - v12;
    if (v13 <= 3.14159265)
    {
      if (v13 > -3.14159265)
        goto LABEL_8;
      v14 = 6.28318531;
    }
    else
    {
      v14 = -6.28318531;
    }
    v13 = v13 + v14;
LABEL_8:
    if (fabs(v13) > 0.34906585)
    {
      v15 = 0;
LABEL_84:

      goto LABEL_85;
    }
    objc_msgSend(v9, "geometryInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "geometryInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baselineAngle");
    v19 = v18;
    -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "baselineAngle");
    v22 = v21;
    -[CRTrackedRegionGroup children](self, "children");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (double)(unint64_t)objc_msgSend(v23, "count");
    v25 = __sincos_stret(v19);
    v26 = __sincos_stret(v22);
    v27 = atan2(v25.__sinval + v26.__sinval * v24, v25.__cosval + v26.__cosval * v24);

    -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "boundingQuad");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 <= 3.14159265)
    {
      HIDWORD(v30) = -1073143301;
      if (v27 > -3.14159265)
        goto LABEL_15;
      v30 = 6.28318531;
    }
    else
    {
      v30 = -6.28318531;
    }
    v27 = v27 + v30;
LABEL_15:
    *(float *)&v30 = v27;
    objc_msgSend(v28, "unionWithNormalizedQuad:baselineAngle:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v181 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v9, objc_msgSend(v9, "layoutDirection"));
      v175 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v6, objc_msgSend(v6, "layoutDirection"));
      objc_msgSend(v32, "mutualGeometryInfoWith:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "geometryInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "geometryInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "estimatedLineHeight");
      v172 = v36;
      v171 = v35;
      objc_msgSend(v35, "estimatedLineHeight");
      v173 = v37;
      v180 = v33;
      v174 = v34;
      if (objc_msgSend(v33, "isCenterJustified") && (objc_msgSend(v34, "isLeftJustified") & 1) == 0)
        v38 = objc_msgSend(v34, "isRightJustified") ^ 1;
      else
        v38 = 0;
      v53 = v32;
      objc_msgSend(v180, "leftOffsetAlongBaseline");
      v177 = v54;
      objc_msgSend(v180, "rightOffsetAlongBaseline");
      v167 = v55;
      objc_msgSend(v180, "leftOffsetAlongBaseline");
      v169 = v56;
      objc_msgSend(v16, "size");
      v165 = v57;
      objc_msgSend(v17, "size");
      v163 = v58;
      objc_msgSend(v180, "rightOffsetAlongBaseline");
      v60 = v59;
      objc_msgSend(v16, "size");
      v62 = v61;
      objc_msgSend(v17, "size");
      v64 = v63;
      objc_msgSend(v180, "leftOffsetAlongBaseline");
      v66 = v65;
      objc_msgSend(v16, "size");
      v68 = v67;
      objc_msgSend(v17, "size");
      v70 = v66 / fmin(v68, v69);
      objc_msgSend(v180, "rightOffsetAlongBaseline");
      v72 = v71;
      objc_msgSend(v16, "size");
      v74 = v73;
      objc_msgSend(v17, "size");
      v76 = v75;
      objc_msgSend(v180, "leftOffsetAlongBaseline");
      v78 = v77;
      objc_msgSend(v32, "size");
      v80 = fabs(v70) < 1.0 || fabs(-v72 / fmin(v74, v76)) < 1.0;
      v81 = v173 / v172 >= 0.588235294;
      if (v173 / v172 > 1.7)
        v81 = 0;
      if ((v38 & 1) != 0)
      {
        v82 = 1;
      }
      else
      {
        v83 = -v167 / v172;
        v84 = v169 / fmax(v165, v163);
        v85 = -v60 / fmax(v62, v64);
        v86 = v177 / v172 < -1.6;
        if (v177 / v172 > 1.6)
          v86 = 1;
        if (v84 < -0.4)
          v86 = 1;
        if (v84 > 0.4)
          v86 = 1;
        v87 = v83 < -1.6;
        if (v83 > 1.6)
          v87 = 1;
        if (v85 < -0.4)
          v87 = 1;
        if (v85 > 0.4)
          v87 = 1;
        v82 = !v86 || !v87;
      }
      v52 = 0;
      v88 = 1;
      if (v80 && v81)
      {
        if (v82)
        {
          v89 = (v78 - v79) / v172;
          if (v89 >= -1.0 && v89 <= 1.0)
          {
            v164 = v53;
            v166 = v17;
            v168 = v16;
            v170 = v9;
            -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "denormalizedQuad");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "bottomLeft");
            v93 = v92;
            v95 = v94;

            -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "denormalizedQuad");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "bottomRight");
            v99 = v98;
            v178 = v98;
            v101 = v100;
            v162 = v100;

            objc_msgSend(v175, "bottomLeft");
            v102 = *MEMORY[0x1E0C9D820];
            v103 = *(double *)(MEMORY[0x1E0C9D820] + 8);
            v106 = squaredDistanceFromPointToLineDefinedByPoints(v104, v105, v93, v95, v99, v101, *MEMORY[0x1E0C9D820], v103);
            objc_msgSend(v175, "bottomRight");
            v159 = squaredDistanceFromPointToLineDefinedByPoints(v107, v108, v93, v95, v99, v101, v102, v103);
            v109 = atan2(v101 - v95, v99 - v93);
            v161 = rotatedPointAroundPoint(v99, v101, v93, v95, v109);
            objc_msgSend(v175, "bottomLeft");
            v112 = rotatedPointAroundPoint(v110, v111, v93, v95, v109);
            v114 = v113;
            objc_msgSend(v175, "bottomRight");
            v118 = rotatedPointAroundPoint(v115, v116, v93, v95, v109);
            if (v106 <= v159)
              v119 = v114;
            else
              v119 = v117;
            objc_msgSend(v174, "estimatedLineHeight");
            v121 = v119 + v120 * -0.2;
            v122 = rotatedPointAroundPoint(v93, v121, v93, v95, -v109);
            v160 = v123;
            v124 = rotatedPointAroundPoint(v161, v121, v93, v95, -v109);
            v126 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v93, v95, v178, v162, v124, v125, v122, v160);
            v182 = 0u;
            v183 = 0u;
            v184 = 0u;
            v185 = 0u;
            v179 = v7;
            v127 = v7;
            v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v182, v186, 16);
            if (v128)
            {
              v129 = v128;
              v130 = *(_QWORD *)v183;
              while (2)
              {
                for (i = 0; i != v129; ++i)
                {
                  if (*(_QWORD *)v183 != v130)
                    objc_enumerationMutation(v127);
                  v132 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
                  objc_msgSend(v132, "boundingQuad");
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v133, "denormalizedQuad");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "bottomLeft");
                  v137 = rotatedPointAroundPoint(v135, v136, v93, v95, v109);

                  objc_msgSend(v132, "boundingQuad");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "denormalizedQuad");
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v139, "bottomRight");
                  v142 = rotatedPointAroundPoint(v140, v141, v93, v95, v109);

                  if ((v137 <= v112 || v137 >= v118)
                    && (v142 <= v112 || v142 >= v118)
                    && (v137 >= v112 || v142 <= v118))
                  {
                    objc_msgSend(v132, "boundingQuad");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v146, "denormalizedQuad");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    v148 = objc_msgSend(v147, "intersectsQuad:", v126);

                    if ((v148 & 1) != 0)
                    {
                      v52 = 0;
                      v88 = 1;
                      v7 = v179;
                      goto LABEL_78;
                    }
                  }
                }
                v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v182, v186, 16);
                if (v129)
                  continue;
                break;
              }
            }

            -[CRTrackedRegionGroup averageLineHeight](self, "averageLineHeight");
            v149 = objc_claimAutoreleasedReturnValue();
            v7 = v179;
            if (!v149
              || (v150 = (void *)v149,
                  -[CRTrackedRegionGroup children](self, "children"),
                  v151 = (void *)objc_claimAutoreleasedReturnValue(),
                  v152 = objc_msgSend(v151, "count"),
                  v151,
                  v150,
                  v152 == 1))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v172);
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              if (self)
                objc_setProperty_atomic(self, v153, v154, 128);

            }
            v155 = (void *)MEMORY[0x1E0CB37E8];
            -[CRTrackedRegionGroup averageLineHeight](self, "averageLineHeight");
            v127 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "doubleValue");
            objc_msgSend(v155, "numberWithDouble:", v173 * (double)objc_msgSend(v6, "numberOfLines")+ v156 * (double)-[CRTrackedRegionGroup numberOfLines](self, "numberOfLines"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = 0;
LABEL_78:
            v9 = v170;

            v17 = v166;
            v16 = v168;
            v53 = v164;
            v34 = v174;
          }
        }
      }

      if (v88)
      {
        v15 = 0;
        goto LABEL_81;
      }
    }
    else
    {
      v176 = v7;
      v39 = v17;
      v40 = v16;
      objc_msgSend(v31, "denormalizedQuad");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "area");
      v43 = v42;

      -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "denormalizedQuad");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "area");
      v47 = v46;
      objc_msgSend(v6, "boundingQuad");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "denormalizedQuad");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "area");
      v51 = v47 + v50;

      v52 = 0;
      if (v43 > v51 * 1.5)
      {
        v15 = 0;
        v16 = v40;
        v17 = v39;
        v7 = v176;
LABEL_81:
        v157 = v181;
LABEL_83:

        goto LABEL_84;
      }
      v16 = v40;
      v17 = v39;
      v7 = v176;
    }
    v157 = v181;
    -[CRTrackedRegionGroup _commitRegionToGroup:unionQuad:totalLineHeight:]((uint64_t)self, v6, v181, v52);
    v15 = 1;
    goto LABEL_83;
  }
  v15 = 0;
LABEL_85:

  return v15;
}

- (void)_commitRegionToGroup:(void *)a3 unionQuad:(void *)a4 totalLineHeight:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  SEL v19;
  NSObject *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  const __CFString *v31;
  const __CFString *v32;
  int v33;
  _BOOL4 v34;
  const __CFString *v35;
  const __CFString *v36;
  char v37;
  const __CFString *v38;
  const __CFString *v39;
  char v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  const __CFString *v48;
  const __CFString *v49;
  char v50;
  char v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL4 v77;
  uint64_t v78;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE v83[24];
  const __CFString *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!a1)
    goto LABEL_86;
  v9 = a3;
  objc_msgSend((id)a1, "setBoundingQuad:", v9);
  objc_msgSend((id)a1, "setOriginalBoundingQuad:", v9);
  objc_msgSend((id)a1, "setBoundingQuadHomography:", *MEMORY[0x1E0C83FE8], *(double *)(MEMORY[0x1E0C83FE8] + 16), *(double *)(MEMORY[0x1E0C83FE8] + 32));
  objc_msgSend((id)a1, "vcQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "denormalizedQuad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateWithQuad:", v11);
  objc_msgSend((id)a1, "regionTrackingIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackingID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  objc_msgSend((id)a1, "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v7);

  if ((objc_msgSend((id)a1, "isInlineGroup") & 1) == 0)
  {
    v15 = objc_msgSend(v7, "numberOfLines");
    *(_QWORD *)(a1 + 72) = objc_msgSend((id)a1, "numberOfLines") + v15;
  }
  if (v8)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v16, "numberWithDouble:", v17 / (double)(unint64_t)objc_msgSend((id)a1, "numberOfLines"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)a1, v19, v18, 128);

  }
  CROSLogForCategory(4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("-");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = objc_msgSend((id)a1, "numberOfLines");
    objc_msgSend((id)a1, "children");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    if ((*(_BYTE *)(a1 + 10) & 1) != 0)
      v25 = CFSTR("L");
    else
      v25 = CFSTR("-");
    if ((*(_BYTE *)(a1 + 11) & 1) != 0)
      v26 = CFSTR("R");
    else
      v26 = CFSTR("-");
    *(_DWORD *)v83 = 134218754;
    *(_QWORD *)&v83[4] = v22;
    *(_WORD *)&v83[12] = 2048;
    *(_QWORD *)&v83[14] = v24;
    *(_WORD *)&v83[22] = 2112;
    v84 = v25;
    v85 = 2112;
    v86 = v26;
    _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEBUG, "ALIGNMENT: %ld line(s) %ld child(ren)\t%@-%@", v83, 0x2Au);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v7, "numberOfLines") < 2)
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(v7, "geometryInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isCenterJustified");
      CROSLogForCategory(4);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      if (v28)
      {
        if (v30)
        {
          if ((*(_BYTE *)(a1 + 10) & 1) != 0)
            v31 = CFSTR("L");
          else
            v31 = CFSTR("-");
          v32 = CFSTR("R");
          if ((*(_BYTE *)(a1 + 11) & 1) == 0)
            v32 = CFSTR("-");
          *(_DWORD *)v83 = 138412546;
          *(_QWORD *)&v83[4] = v31;
          *(_WORD *)&v83[12] = 2112;
          *(_QWORD *)&v83[14] = v32;
          _os_log_impl(&dword_1D4FB8000, v29, OS_LOG_TYPE_DEBUG, "  ALIGNMENT: multiline: C before: %@-%@", v83, 0x16u);
        }

        if ((*(_BYTE *)(a1 + 10) & 1) != 0 && (*(_BYTE *)(a1 + 11) & 1) != 0)
          objc_msgSend((id)a1, "setTextAlignment:", 1);
        v33 = 0;
      }
      else
      {
        if (v30)
        {
          if (objc_msgSend(v27, "isLeftJustified"))
            v35 = CFSTR("L");
          else
            v35 = CFSTR("-");
          if (objc_msgSend(v27, "isRightJustified"))
            v36 = CFSTR("R");
          else
            v36 = CFSTR("-");
          v37 = *(_BYTE *)(a1 + 11);
          if ((*(_BYTE *)(a1 + 10) & 1) != 0)
            v38 = CFSTR("L");
          else
            v38 = CFSTR("-");
          *(_DWORD *)v83 = 138413058;
          if ((v37 & 1) != 0)
            v39 = CFSTR("R");
          else
            v39 = CFSTR("-");
          *(_QWORD *)&v83[4] = v35;
          *(_WORD *)&v83[12] = 2112;
          *(_QWORD *)&v83[14] = v36;
          *(_WORD *)&v83[22] = 2112;
          v84 = v38;
          v85 = 2112;
          v86 = v39;
          _os_log_impl(&dword_1D4FB8000, v29, OS_LOG_TYPE_DEBUG, "  ALIGNMENT: multiline: %@-%@ before: %@-%@", v83, 0x2Au);
        }

        if (objc_msgSend(v27, "isLeftJustified"))
          v33 = objc_msgSend(v27, "isRightJustified");
        else
          v33 = 0;
        if ((*(_BYTE *)(a1 + 10) & 1) != 0)
          v40 = objc_msgSend(v27, "isLeftJustified");
        else
          v40 = 0;
        *(_BYTE *)(a1 + 10) = v40;
        if ((*(_BYTE *)(a1 + 11) & 1) != 0)
          v41 = objc_msgSend(v27, "isRightJustified");
        else
          v41 = 0;
        *(_BYTE *)(a1 + 11) = v41;
      }

    }
    if ((*(_BYTE *)(a1 + 10) & 1) != 0 || (v34 = v33 != 0, (*(_BYTE *)(a1 + 11) & 1) != 0))
    {
      objc_msgSend((id)a1, "children", *(_QWORD *)v83);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "boundingQuad");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "baselineAngle");
      +[CRParagraphOutputRegion paragraphWithLines:confidence:baselineAngle:](CRParagraphOutputRegion, "paragraphWithLines:confidence:baselineAngle:", v42, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "geometryInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 144) = objc_msgSend(v44, "textAlignment");
      CROSLogForCategory(4);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v47 = *(_QWORD *)(a1 + 144);
        if ((*(_BYTE *)(a1 + 10) & 1) != 0)
          v48 = CFSTR("L");
        else
          v48 = CFSTR("-");
        v49 = CFSTR("R");
        if ((*(_BYTE *)(a1 + 11) & 1) == 0)
          v49 = CFSTR("-");
        *(_DWORD *)v83 = 134218498;
        *(_QWORD *)&v83[4] = v47;
        *(_WORD *)&v83[12] = 2112;
        *(_QWORD *)&v83[14] = v48;
        *(_WORD *)&v83[22] = 2112;
        v84 = v49;
        _os_log_impl(&dword_1D4FB8000, v46, OS_LOG_TYPE_DEBUG, "  ALIGNMENT: SETGROUP %ld   %@-%@", v83, 0x20u);
      }

      if ((*(_BYTE *)(a1 + 10) & 1) != 0)
        v50 = objc_msgSend(v45, "isLeftJustified");
      else
        v50 = 0;
      *(_BYTE *)(a1 + 10) = v50;
      if ((*(_BYTE *)(a1 + 11) & 1) != 0)
        v51 = objc_msgSend(v45, "isRightJustified");
      else
        v51 = 0;
      *(_BYTE *)(a1 + 11) = v51;

      v34 = v33 != 0;
    }
  }
  else
  {
    v34 = 0;
  }
  v52 = objc_msgSend((id)a1, "numberOfLines", *(_QWORD *)v83);
  objc_msgSend((id)a1, "children");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");

  if (v52 == v54)
  {
    CROSLogForCategory(4);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
LABEL_73:
      v56 = objc_msgSend((id)a1, "textAlignment");
      v57 = *(_QWORD *)(a1 + 144);
      *(_DWORD *)v83 = 134218240;
      *(_QWORD *)&v83[4] = v56;
      *(_WORD *)&v83[12] = 2048;
      *(_QWORD *)&v83[14] = v57;
      _os_log_impl(&dword_1D4FB8000, v55, OS_LOG_TYPE_DEBUG, "ALIGNMENT: inherit group children alignment %ld->%ld", v83, 0x16u);
    }
LABEL_74:

    v58 = *(_QWORD *)(a1 + 144);
LABEL_75:
    objc_msgSend((id)a1, "setTextAlignment:", v58, *(_OWORD *)v83, *(_QWORD *)&v83[16]);
    goto LABEL_76;
  }
  v69 = objc_msgSend((id)a1, "numberOfLines");
  v70 = v69 - objc_msgSend(v7, "numberOfLines");
  objc_msgSend((id)a1, "children");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "count") - 1;

  if (v70 != v72)
  {
    v78 = objc_msgSend((id)a1, "textAlignment");
    if (v78 != objc_msgSend(v7, "textAlignment") && objc_msgSend(v7, "numberOfLines") >= 2 && !v34)
    {
      objc_msgSend((id)a1, "setTextAlignment:", 0);
      CROSLogForCategory(4);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v83 = 0;
        _os_log_impl(&dword_1D4FB8000, v80, OS_LOG_TYPE_DEBUG, "ALIGNMENT: mixed alignments", v83, 2u);
      }

    }
    goto LABEL_76;
  }
  v73 = *(_QWORD *)(a1 + 144);
  if (v73 == objc_msgSend(v7, "textAlignment"))
  {
    CROSLogForCategory(4);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      v75 = objc_msgSend((id)a1, "textAlignment");
      v76 = objc_msgSend(v7, "textAlignment");
      *(_DWORD *)v83 = 134218240;
      *(_QWORD *)&v83[4] = v75;
      *(_WORD *)&v83[12] = 2048;
      *(_QWORD *)&v83[14] = v76;
      _os_log_impl(&dword_1D4FB8000, v74, OS_LOG_TYPE_DEBUG, "ALIGNMENT: inherit new region's alignment (same children+text alignment) %ld->%ld", v83, 0x16u);
    }

    objc_msgSend((id)a1, "setTextAlignment:", objc_msgSend(v7, "textAlignment"));
  }
  if ((*(_BYTE *)(a1 + 10) & 1) != (*(_BYTE *)(a1 + 11) & 1) && !objc_msgSend((id)a1, "textAlignment"))
  {
    CROSLogForCategory(4);
    v55 = objc_claimAutoreleasedReturnValue();
    v77 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
    if (!v34)
    {
      if (v77)
      {
        v81 = objc_msgSend((id)a1, "textAlignment");
        v82 = objc_msgSend(v7, "textAlignment");
        *(_DWORD *)v83 = 134218240;
        *(_QWORD *)&v83[4] = v81;
        *(_WORD *)&v83[12] = 2048;
        *(_QWORD *)&v83[14] = v82;
        _os_log_impl(&dword_1D4FB8000, v55, OS_LOG_TYPE_DEBUG, "ALIGNMENT: inherit new region's alignment (text L^R and unknown) %ld->%ld", v83, 0x16u);
      }

      v58 = objc_msgSend(v7, "textAlignment");
      goto LABEL_75;
    }
    if (v77)
      goto LABEL_73;
    goto LABEL_74;
  }
LABEL_76:
  CROSLogForCategory(4);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    v60 = objc_msgSend((id)a1, "numberOfLines");
    objc_msgSend((id)a1, "children");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");
    if ((*(_BYTE *)(a1 + 10) & 1) != 0)
      v63 = CFSTR("L");
    else
      v63 = CFSTR("-");
    if ((*(_BYTE *)(a1 + 11) & 1) != 0)
      v21 = CFSTR("R");
    v64 = objc_msgSend((id)a1, "textAlignment");
    *(_DWORD *)v83 = 134219010;
    *(_QWORD *)&v83[4] = v60;
    *(_WORD *)&v83[12] = 2048;
    *(_QWORD *)&v83[14] = v62;
    *(_WORD *)&v83[22] = 2112;
    v84 = v63;
    v85 = 2112;
    v86 = v21;
    v87 = 2048;
    v88 = v64;
    _os_log_impl(&dword_1D4FB8000, v59, OS_LOG_TYPE_DEBUG, "ALIGNMENT: DONE %ld line(s) %ld child(ren)\t%@-%@\t%ld", v83, 0x34u);

  }
  CROSLogForCategory(4);
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "children");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "lastObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "text");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v83 = 138412290;
    *(_QWORD *)&v83[4] = v68;
    _os_log_impl(&dword_1D4FB8000, v65, OS_LOG_TYPE_DEBUG, "*  ALIGNMENT: DONE %@", v83, 0xCu);

  }
LABEL_86:

}

- (BOOL)addInlineGroupIfValid:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  __double2 v36;
  __double2 v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v49;

  v4 = a3;
  v5 = objc_msgSend(v4, "layoutDirection");
  if (v5 == -[CRTrackedRegionGroup layoutDirection](self, "layoutDirection"))
  {
    objc_msgSend(v4, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray lastObject](self->_children, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baselineAngle");
    v10 = v9;
    objc_msgSend(v7, "baselineAngle");
    v12 = v10 - v11;
    if (v12 <= 3.14159265)
    {
      if (v12 > -3.14159265)
        goto LABEL_8;
      v13 = 6.28318531;
    }
    else
    {
      v13 = -6.28318531;
    }
    v12 = v12 + v13;
LABEL_8:
    if (fabs(v12) > 0.34906585)
    {
      LOBYTE(v14) = 0;
LABEL_27:

      goto LABEL_28;
    }
    v15 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v8, objc_msgSend(v8, "layoutDirection"));
    v16 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v7, objc_msgSend(v7, "layoutDirection"));
    objc_msgSend(v15, "mutualGeometryInfoWith:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "estimatedLineHeight");
    v19 = v18;
    objc_msgSend(v16, "estimatedLineHeight");
    v21 = v20;
    objc_msgSend(v17, "inlineSpacingAlongBaseline");
    v23 = v22 / v19;
    objc_msgSend(v17, "leftOffsetAlongBaseline");
    v25 = v24 / v19;
    v26 = v21 / v19 >= 0.588235294;
    if (v21 / v19 > 1.7)
      v26 = 0;
    v27 = v23 >= -0.5;
    if (v23 > 0.3)
      v27 = 0;
    v28 = v26 && v27;
    if (v25 < -0.3)
      v28 = 0;
    if (v25 <= 0.3)
      v14 = v28;
    else
      v14 = 0;
    if (!v14)
    {
LABEL_26:

      goto LABEL_27;
    }
    v49 = v15;
    objc_msgSend(v7, "baselineAngle");
    v30 = v29;
    -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "baselineAngle");
    v33 = v32;
    -[CRTrackedRegionGroup children](self, "children");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (double)(unint64_t)objc_msgSend(v34, "count");
    v36 = __sincos_stret(v30);
    v37 = __sincos_stret(v33);
    v38 = atan2(v36.__sinval + v37.__sinval * v35, v36.__cosval + v37.__cosval * v35);

    -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingQuad");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 <= 3.14159265)
    {
      HIDWORD(v41) = -1073143301;
      if (v38 > -3.14159265)
      {
LABEL_25:
        *(float *)&v41 = v38;
        objc_msgSend(v39, "unionWithNormalizedQuad:baselineAngle:", v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = (void *)MEMORY[0x1E0CB37E8];
        v15 = v49;
        objc_msgSend(v49, "estimatedLineHeight");
        v45 = v44;
        objc_msgSend(v16, "estimatedLineHeight");
        objc_msgSend(v43, "numberWithDouble:", v45 + v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRTrackedRegionGroup _commitRegionToGroup:unionQuad:totalLineHeight:]((uint64_t)self, v7, v42, v47);

        goto LABEL_26;
      }
      v41 = 6.28318531;
    }
    else
    {
      v41 = -6.28318531;
    }
    v38 = v38 + v41;
    goto LABEL_25;
  }
  LOBYTE(v14) = 0;
LABEL_28:

  return v14;
}

- (id)estimatedPerspectiveQuad
{
  void *v3;
  void *v4;
  char isKindOfClass;
  unint64_t v6;
  void *v7;
  CRTrackedRegionGroup *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 isTextLeftJustified;
  _BOOL4 isTextRightJustified;
  CRTrackedRegionGroup *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  __double2 v104;
  __double2 v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  double v137;
  double v138;
  float v139;
  double v140;
  double v141;
  double v142;
  uint64_t j;
  void *v144;
  void *v145;
  double v146;
  void *v147;
  double v148;
  double v149;
  void *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  void *v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  double v166;
  double v167;
  CRImageSpaceQuad *v168;
  CRImageSpaceQuad *v169;
  float32x4_t v170;
  float32x4_t v171;
  float32x4_t v172;
  __int128 v173;
  float32x4_t v174;
  float32x4_t v175;
  double v176;
  double v177;
  CRImageSpaceQuad *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  CRImageSpaceQuad *v198;
  void *v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  float32x4_t v211;
  double v212;
  float32x4_t v213;
  double v214;
  float32x4_t v215;
  double v216;
  float32x4_t v217;
  double v218;
  double v219;
  float32x4_t v220;
  void *obj;
  double obja;
  id objb[2];
  void *v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  _BYTE v233[128];
  _BYTE v234[128];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  if (-[CRTrackedRegionGroup isInlineGroup](self, "isInlineGroup"))
    goto LABEL_7;
  -[CRTrackedRegionGroup children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  v6 = -[CRTrackedRegionGroup numberOfLines](self, "numberOfLines");
  v7 = 0;
  if (self && v6 >= 2)
  {
    if (!self->_isTextLeftJustified && !self->_isTextRightJustified)
    {
LABEL_7:
      v7 = 0;
      return v7;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v9 = self;
    -[CRTrackedRegionGroup children](self, "children");
    obj = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v229, v234, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(_QWORD *)v230;
      v16 = *MEMORY[0x1E0C9D538];
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v18 = 1.79769313e308;
      v19 = 2.22507386e-308;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v230 != v15)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * i);
          objc_msgSend(v21, "children");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v224, "addObjectsFromArray:", v22);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v21, "topBottomEdgesQuad");
          else
            objc_msgSend(v21, "boundingQuad");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "topLeft");
          v25 = v24;
          v27 = v26;
          -[CRTrackedRegionGroup boundingQuad](v9, "boundingQuad");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "baselineAngle");
          rotatedPointAroundPoint(v25, v27, v16, v17, v29);
          v31 = v30;

          if (v31 < v18)
          {
            v14 = v12 + i;
            v18 = v31;
          }
          if (v31 > v19)
          {
            v13 = v12 + i;
            v19 = v31;
          }

        }
        v12 += v11;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v229, v234, 16);
      }
      while (v11);
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }

    isTextLeftJustified = v9->_isTextLeftJustified;
    isTextRightJustified = v9->_isTextRightJustified;
    if (!isTextLeftJustified && !isTextRightJustified)
    {
      v7 = 0;
LABEL_62:

      return v7;
    }
    v34 = v9;
    -[CRTrackedRegionGroup children](v9, "children");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "boundingQuad");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "denormalizedQuad");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topLeft");
    v40 = v39;
    v42 = v41;

    -[CRTrackedRegionGroup children](v34, "children");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "boundingQuad");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "denormalizedQuad");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topRight");
    v216 = v47;
    v214 = v48;

    -[CRTrackedRegionGroup children](v34, "children");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", v13);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "boundingQuad");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "denormalizedQuad");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomLeft");
    v54 = v53;
    v56 = v55;

    -[CRTrackedRegionGroup children](v34, "children");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "boundingQuad");
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v59, "denormalizedQuad");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomRight");
    v62 = v61;
    v64 = v63;

    -[CRTrackedRegionGroup children](v34, "children");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectAtIndexedSubscript:", v14);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v59) = objc_opt_isKindOfClass();

    if ((v59 & 1) != 0)
    {
      -[CRTrackedRegionGroup children](v34, "children");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectAtIndexedSubscript:", v14);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "topBottomEdgesQuad");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "denormalizedQuad");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "topLeft");
      v40 = v71;
      v42 = v72;

      -[CRTrackedRegionGroup children](v34, "children");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectAtIndexedSubscript:", v14);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "topBottomEdgesQuad");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "denormalizedQuad");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "topRight");
      v216 = v77;
      v214 = v78;

    }
    -[CRTrackedRegionGroup children](v34, "children");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectAtIndexedSubscript:", v13);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = objc_opt_isKindOfClass();

    v218 = v42;
    if ((v81 & 1) != 0)
    {
      -[CRTrackedRegionGroup children](v34, "children");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectAtIndexedSubscript:", v13);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "topBottomEdgesQuad");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "denormalizedQuad");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "bottomLeft");
      v54 = v86;
      v56 = v87;

      -[CRTrackedRegionGroup children](v34, "children");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectAtIndexedSubscript:", v13);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "topBottomEdgesQuad");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "denormalizedQuad");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "bottomRight");
      v93 = v92;
      v212 = v94;

    }
    else
    {
      v212 = v64;
      v93 = v62;
    }
    v95 = (double *)MEMORY[0x1E0C9D538];
    -[CRTrackedRegionGroup children](v34, "children");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectAtIndexedSubscript:", v14);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "baselineAngle");
    v99 = v98;

    -[CRTrackedRegionGroup children](v34, "children");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectAtIndexedSubscript:", v13);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "baselineAngle");
    v103 = v102;

    v104 = __sincos_stret(v99);
    v105 = __sincos_stret(v103);
    v106 = atan2(v104.__sinval + v105.__sinval, v104.__cosval + v105.__cosval);
    v107 = *v95;
    v108 = v95[1];
    v209 = v40;
    v109 = rotatedPointAroundPoint(v40, v218, *v95, v108, v106);
    v202 = v110;
    v203 = v109;
    v111 = rotatedPointAroundPoint(v216, v214, v107, v108, v106);
    v113 = v112;
    v205 = v56;
    v207 = v54;
    v114 = rotatedPointAroundPoint(v54, v56, v107, v108, v106);
    v116 = v115;
    v204 = v93;
    obja = v107;
    v117 = v107;
    v118 = v108;
    v119 = rotatedPointAroundPoint(v93, v212, v117, v108, v106);
    if (!isTextLeftJustified || isTextRightJustified)
    {
      if (isTextLeftJustified || !isTextRightJustified)
      {
        v128 = v207;
        v125 = v209;
        v127 = v218;
        v129 = v205;
        v122 = obja;
LABEL_44:
        v227 = 0u;
        v228 = 0u;
        v225 = 0u;
        v226 = 0u;
        -[CRTrackedRegionGroup children](v34, "children");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v225, v233, 16);
        if (v133)
        {
          v134 = v133;
          v206 = v129;
          v208 = v128;
          v219 = v127;
          v210 = v125;
          v135 = *(_QWORD *)v226;
          v136 = 1.79769313e308;
          v137 = v122;
          v138 = 2.22507386e-308;
          v139 = v106;
          v140 = v108;
          v141 = v137;
          v142 = v137;
          do
          {
            for (j = 0; j != v134; ++j)
            {
              if (*(_QWORD *)v226 != v135)
                objc_enumerationMutation(v132);
              objc_msgSend(*(id *)(*((_QWORD *)&v225 + 1) + 8 * j), "boundingQuad");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "denormalizedQuad");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v146 = v139;
              objc_msgSend(v145, "rotatedAroundPoint:angle:", obja, v108, v146);
              v147 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v147, "topLeft");
              if (v148 < v136)
              {
                objc_msgSend(v147, "topLeft");
                v136 = v149;
                objc_msgSend(v144, "denormalizedQuad");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v150, "topLeft");
                v142 = v151;
                v118 = v152;

              }
              objc_msgSend(v147, "bottomLeft");
              if (v153 < v136)
              {
                objc_msgSend(v147, "bottomLeft");
                v136 = v154;
                objc_msgSend(v144, "denormalizedQuad");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v155, "bottomLeft");
                v142 = v156;
                v118 = v157;

              }
              objc_msgSend(v147, "topRight");
              if (v158 > v138)
              {
                objc_msgSend(v147, "topRight");
                v138 = v159;
                objc_msgSend(v144, "denormalizedQuad");
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v160, "topRight");
                v141 = v161;
                v140 = v162;

              }
              objc_msgSend(v147, "bottomRight");
              if (v163 > v138)
              {
                objc_msgSend(v147, "bottomRight");
                v138 = v164;
                objc_msgSend(v144, "denormalizedQuad");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v165, "bottomRight");
                v141 = v166;
                v140 = v167;

              }
            }
            v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v225, v233, 16);
          }
          while (v134);
          v122 = v141;
          v108 = v140;
          v128 = v208;
          v125 = v210;
          v127 = v219;
          v129 = v206;
        }
        else
        {
          v142 = v122;
        }

        v168 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v125, v127, v216, v214, v204, v212, v128, v129);
        v169 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", 0.0, 0.0, 1.0, 1.0);
        -[CRImageSpaceQuad homographyFromSelfToQuad:](v168, "homographyFromSelfToQuad:", v169);
        v170.i32[3] = 0;
        v171.i32[3] = 0;
        v213 = v171;
        v215 = v170;
        v172.i32[3] = 0;
        v211 = v172;
        -[CRImageSpaceQuad homographyFromSelfToQuad:](v169, "homographyFromSelfToQuad:", v168);
        HIDWORD(v173) = 0;
        v174.i32[3] = 0;
        v220 = v174;
        *(_OWORD *)objb = v173;
        v175.i32[3] = 0;
        v217 = v175;
        v176 = applyHomographyMatrix(v215, v213, v211, v142, v118);
        v177 = applyHomographyMatrix(v215, v213, v211, v122, v108);
        v178 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v176, 0.0, v177, 0.0, v177, 1.0, v176, 1.0);
        -[CRImageSpaceQuad topLeft](v178, "topLeft");
        v181 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v179, v180);
        v183 = v182;
        -[CRImageSpaceQuad topRight](v178, "topRight");
        v186 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v184, v185);
        v188 = v187;
        -[CRImageSpaceQuad bottomLeft](v178, "bottomLeft");
        v191 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v189, v190);
        v193 = v192;
        -[CRImageSpaceQuad bottomRight](v178, "bottomRight");
        v196 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v194, v195);
        v198 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v181, v183, v186, v188, v196, v197, v191, v193);
        -[CRTrackedRegionGroup boundingQuad](v34, "boundingQuad");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "normalizationSize");
        -[CRImageSpaceQuad normalizedQuadForImageSize:](v198, "normalizedQuadForImageSize:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_62;
      }
      v124 = -v106;
      if (v114 <= v203)
      {
        v200 = v120 + (v120 - v116) / (v119 - v114) * (v203 - v119);
        v122 = obja;
        v128 = rotatedPointAroundPoint(v203, v200, obja, v108, v124);
        v129 = v201;
        v125 = v209;
        v127 = v218;
        goto LABEL_44;
      }
      v122 = obja;
      v125 = rotatedPointAroundPoint(v114, v113 + (v113 - v202) / (v111 - v203) * (v114 - v111), obja, v108, v124);
      v127 = v126;
    }
    else
    {
      v121 = -v106;
      if (v119 <= v111)
      {
        v130 = v120 + (v120 - v116) / (v119 - v114) * (v111 - v119);
        v122 = obja;
        v204 = rotatedPointAroundPoint(v111, v130, obja, v108, v121);
        v212 = v131;
      }
      else
      {
        v122 = obja;
        v216 = rotatedPointAroundPoint(v119, v113 + (v113 - v202) / (v111 - v203) * (v119 - v111), obja, v108, v121);
        v214 = v123;
      }
      v125 = v209;
      v127 = v218;
    }
    v129 = v205;
    v128 = v207;
    goto LABEL_44;
  }
  return v7;
}

- (CRNormalizedQuad)originalBoundingQuad
{
  return self->_originalBoundingQuad;
}

- (void)setOriginalBoundingQuad:(id)a3
{
  CRNormalizedQuad *v5;
  double Current;
  CRNormalizedQuad *v7;

  v5 = (CRNormalizedQuad *)a3;
  if (self->_originalBoundingQuad != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_originalBoundingQuad, a3);
    Current = CFAbsoluteTimeGetCurrent();
    v5 = v7;
    self->_lastOriginalBoundingQuadUpdateTime = Current;
  }

}

- (void)updatePreviousAssociationQuad
{
  CRNormalizedQuad *v3;
  CRNormalizedQuad *boundingQuadAtOCRDispatch;
  uint64_t v5;
  __int128 v6;

  -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
  v3 = (CRNormalizedQuad *)objc_claimAutoreleasedReturnValue();
  boundingQuadAtOCRDispatch = self->_boundingQuadAtOCRDispatch;
  self->_boundingQuadAtOCRDispatch = v3;

  v5 = MEMORY[0x1E0C83FE8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)self->_anon_a0 = *MEMORY[0x1E0C83FE8];
  *(_OWORD *)&self->_anon_a0[16] = v6;
  *(_OWORD *)&self->_anon_a0[32] = *(_OWORD *)(v5 + 32);
}

- (void)updateBoundingQuadAfterOCR
{
  CRImageSpaceQuad *v3;
  CRImageSpaceQuad *boundingQuadAfterOCR;
  id v5;

  -[CRTrackedRegionGroup boundingQuad](self, "boundingQuad");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "denormalizedQuad");
  v3 = (CRImageSpaceQuad *)objc_claimAutoreleasedReturnValue();
  boundingQuadAfterOCR = self->_boundingQuadAfterOCR;
  self->_boundingQuadAfterOCR = v3;

}

- (void)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4 shouldApply:(float)a5
{
  unsigned int (**v9)(id, void *);
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  __int128 v27;
  float32x4_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  id v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  float32x4_t v44;
  float32x4_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v45 = a3;
  v44 = a2;
  v58 = *MEMORY[0x1E0C80C00];
  v9 = a7;
  objc_msgSend((id)a1, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "denormalizedQuad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a5;
  objc_msgSend(v11, "applyHomographyTransform:downscaleRate:", *(double *)v44.i64, *(double *)v45.i64, *(double *)a4.i64, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "normalizationSize");
  if (v9[2](v9, v13))
  {
    objc_msgSend(v10, "normalizationSize");
    objc_msgSend(v13, "normalizedQuadForImageSize:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setBoundingQuad:", v14);

    objc_msgSend((id)a1, "vcQuad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateWithQuad:", v13);

    objc_msgSend((id)a1, "originalBoundingQuad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (a4.f32[2] != 0.0)
      {
        v17 = 0;
        v18 = *(_OWORD *)(a1 + 176);
        v19 = *(_OWORD *)(a1 + 192);
        v51 = *(_OWORD *)(a1 + 160);
        v52 = v18;
        v53 = v19;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        do
        {
          *(__int128 *)((char *)&v54 + v17) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v17))), v45, *(float32x2_t *)((char *)&v51 + v17), 1), a4, *(float32x4_t *)((char *)&v51 + v17), 2);
          v17 += 16;
        }
        while (v17 != 48);
        v20 = 0;
        v21 = v54;
        v22 = v55;
        v23 = v56;
        *(_DWORD *)(a1 + 168) = DWORD2(v54);
        *(_QWORD *)(a1 + 160) = v21;
        *(_DWORD *)(a1 + 184) = DWORD2(v22);
        *(_QWORD *)(a1 + 176) = v22;
        *(float *)&v21 = 1.0 / *((float *)&v23 + 2);
        v24 = *(float32x4_t *)(a1 + 176);
        v25 = vmulq_n_f32(*(float32x4_t *)(a1 + 160), 1.0 / *((float *)&v23 + 2));
        *(_DWORD *)(a1 + 168) = v25.i32[2];
        *(_DWORD *)(a1 + 200) = DWORD2(v23);
        *(_QWORD *)(a1 + 192) = v23;
        *(_QWORD *)(a1 + 160) = v25.i64[0];
        v26 = vmulq_n_f32(v24, 1.0 / *((float *)&v23 + 2));
        *(_DWORD *)(a1 + 184) = v26.i32[2];
        *(_QWORD *)(a1 + 176) = v26.i64[0];
        v27 = *(_OWORD *)(a1 + 208);
        v28 = vmulq_n_f32(*(float32x4_t *)(a1 + 192), *(float *)&v21);
        *(_DWORD *)(a1 + 200) = v28.i32[2];
        *(_QWORD *)(a1 + 192) = v28.i64[0];
        v29 = *(_OWORD *)(a1 + 224);
        v30 = *(_OWORD *)(a1 + 240);
        v51 = v27;
        v52 = v29;
        v53 = v30;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        do
        {
          *(__int128 *)((char *)&v54 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v20))), v45, *(float32x2_t *)((char *)&v51 + v20), 1), a4, *(float32x4_t *)((char *)&v51 + v20), 2);
          v20 += 16;
        }
        while (v20 != 48);
        v31 = v54;
        v32 = v55;
        v33 = v56;
        *(_DWORD *)(a1 + 216) = DWORD2(v54);
        *(_DWORD *)(a1 + 232) = DWORD2(v32);
        *(_QWORD *)(a1 + 208) = v31;
        *(_QWORD *)(a1 + 224) = v32;
        *(_DWORD *)(a1 + 248) = DWORD2(v33);
        *(_QWORD *)(a1 + 240) = v33;
        *(float *)&v31 = 1.0 / *((float *)&v33 + 2);
        v34 = *(float32x4_t *)(a1 + 240);
        v35 = vmulq_n_f32(*(float32x4_t *)(a1 + 208), 1.0 / *((float *)&v33 + 2));
        v36 = vmulq_n_f32(*(float32x4_t *)(a1 + 224), 1.0 / *((float *)&v33 + 2));
        *(_DWORD *)(a1 + 216) = v35.i32[2];
        *(_DWORD *)(a1 + 232) = v36.i32[2];
        *(_QWORD *)(a1 + 208) = v35.i64[0];
        *(_QWORD *)(a1 + 224) = v36.i64[0];
        v37 = vmulq_n_f32(v34, *(float *)&v31);
        *(_DWORD *)(a1 + 248) = v37.i32[2];
        *(_QWORD *)(a1 + 240) = v37.i64[0];
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 32), v10);
      *(float32x4_t *)(a1 + 208) = v44;
      *(float32x4_t *)(a1 + 224) = v45;
      *(float32x4_t *)(a1 + 240) = a4;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v38 = *(id *)(a1 + 64);
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v39)
    {
      v41 = v39;
      v42 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v48 != v42)
            objc_enumerationMutation(v38);
          *(float *)&v40 = a5;
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "applyHomographyTransform:downscaleRate:shouldApply:", &__block_literal_global_20, *(double *)v44.i64, *(double *)v45.i64, *(double *)a4.i64, v40, *(_OWORD *)&v44, *(_OWORD *)&v45);
        }
        v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v41);
    }

  }
}

uint64_t __75__CRTrackedRegionGroup_applyHomographyTransform_downscaleRate_shouldApply___block_invoke()
{
  return 1;
}

+ (id)groupsFromOutputRegions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  CRTrackedRegionGroup *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  _BYTE *v28;
  void *v29;
  int v30;
  BOOL v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  int v46;
  BOOL v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id obj;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v58 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v61 = (void *)objc_msgSend(v3, "mutableCopy");
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v89;
    v62 = *(_QWORD *)v89;
    do
    {
      v8 = 0;
      v64 = v6;
      do
      {
        if (*(_QWORD *)v89 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v8);
        objc_msgSend(v9, "trackingID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v66 = v8;
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          v12 = v58;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v85;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v85 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count") + objc_msgSend(v61, "count"));
                objc_msgSend(v18, "addObjectsFromArray:", v61);
                objc_msgSend(v18, "addObjectsFromArray:", v12);
                objc_msgSend(v18, "removeObject:", v9);
                objc_msgSend(v18, "removeObject:", v17);
                if ((objc_msgSend(v17, "addGroupRegionIfValid:context:", v9, v18) & 1) != 0)
                {
                  objc_msgSend(v9, "trackingID");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v22);

                  objc_msgSend(v61, "removeObject:", v9);
                  goto LABEL_17;
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
              if (v14)
                continue;
              break;
            }
          }

          v19 = -[CRTrackedRegionGroup initWithRegion:]([CRTrackedRegionGroup alloc], "initWithRegion:", v9);
          objc_msgSend(v12, "addObject:", v19);

          objc_msgSend(v12, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "trackingID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v21);

          objc_msgSend(v61, "removeObject:", v9);
LABEL_17:
          v7 = v62;
          v6 = v64;
          v8 = v66;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v6);
  }

  v63 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v23 = v58;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (!v24)
    goto LABEL_36;
  v25 = v24;
  v26 = *(_QWORD *)v81;
  do
  {
    for (j = 0; j != v25; ++j)
    {
      if (*(_QWORD *)v81 != v26)
        objc_enumerationMutation(v23);
      v28 = *(_BYTE **)(*((_QWORD *)&v80 + 1) + 8 * j);
      if ((unint64_t)objc_msgSend(v28, "numberOfLines") <= 1)
      {
        objc_msgSend(v28, "children");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v29, "count") <= 1)
        {

          if (!v28)
            continue;
LABEL_33:
          v28[8] = 1;
          continue;
        }
        v30 = objc_msgSend(v28, "isInlineGroup");

        if (v28)
          v31 = v30 == 0;
        else
          v31 = 1;
        if (!v31)
          goto LABEL_33;
      }
    }
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  }
  while (v25);
LABEL_36:

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v32 = v23;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v77;
    v55 = *(_QWORD *)v77;
    v56 = v32;
    do
    {
      v36 = 0;
      v57 = v34;
      do
      {
        if (*(_QWORD *)v77 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v36);
        if (objc_msgSend(v37, "isInlineGroup"))
        {
          objc_msgSend(v37, "children");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (v39 <= 1)
          {
            v59 = v36;
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v40 = v32;
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v73;
              v65 = *(_QWORD *)v73;
              v67 = v40;
              do
              {
                for (k = 0; k != v42; ++k)
                {
                  if (*(_QWORD *)v73 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
                  v46 = objc_msgSend(v45, "isInlineGroup");
                  v47 = v37 == v45 || v46 == 0;
                  if (!v47 && objc_msgSend(v45, "addInlineGroupIfValid:", v37))
                  {
                    objc_msgSend(v63, "addObject:", v37);
                    v70 = 0u;
                    v71 = 0u;
                    v68 = 0u;
                    v69 = 0u;
                    objc_msgSend(v37, "children");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
                    if (v49)
                    {
                      v50 = v49;
                      v51 = *(_QWORD *)v69;
                      do
                      {
                        for (m = 0; m != v50; ++m)
                        {
                          if (*(_QWORD *)v69 != v51)
                            objc_enumerationMutation(v48);
                          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * m), "trackingID");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, v53);

                        }
                        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
                      }
                      while (v50);
                    }

                    v43 = v65;
                    v40 = v67;
                  }
                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
              }
              while (v42);
            }

            v35 = v55;
            v32 = v56;
            v34 = v57;
            v36 = v59;
          }
        }
        ++v36;
      }
      while (v36 != v34);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v34);
  }

  objc_msgSend(v32, "removeObjectsInArray:", v63);
  return v32;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<CRTrackedRegionGroup:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CRTrackedRegionGroup children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v10;
}

- (CRImageSpaceQuad)boundingQuadAfterOCR
{
  return (CRImageSpaceQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBoundingQuadAfterOCR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBoundingQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CRNormalizedQuad)boundingQuadAtOCRDispatch
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBoundingQuadAtOCRDispatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)boundingQuadHomographySinceOCRDispatch
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 160), 48, 1, 0);
  return *(double *)&v2;
}

- (NSUUID)trackingID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTrackingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)regionTrackingIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (CRVCQuad)vcQuad
{
  return (CRVCQuad *)objc_getProperty(self, a2, 80, 1);
}

- (double)lastOriginalBoundingQuadUpdateTime
{
  return self->_lastOriginalBoundingQuadUpdateTime;
}

- (double)boundingQuadHomography
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 208), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setBoundingQuadHomography:(__n128)a3
{
  _OWORD v4[3];

  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 208), v4, 48, 1, 0);
}

- (NSNumber)homographyGroupID
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHomographyGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (double)initialOrthogonalityScore
{
  return self->_initialOrthogonalityScore;
}

- (void)setInitialOrthogonalityScore:(double)a3
{
  self->_initialOrthogonalityScore = a3;
}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unint64_t)a3
{
  self->_textAlignment = a3;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSNumber)averageLineHeight
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isInlineGroup
{
  return self->_isInlineGroup;
}

- (BOOL)trackNeedsReplacement
{
  return self->_trackNeedsReplacement;
}

- (void)setTrackNeedsReplacement:(BOOL)a3
{
  self->_trackNeedsReplacement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_averageLineHeight, 0);
  objc_storeStrong((id *)&self->_homographyGroupID, 0);
  objc_storeStrong((id *)&self->_vcQuad, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_regionTrackingIDs, 0);
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_boundingQuadAtOCRDispatch, 0);
  objc_storeStrong((id *)&self->_originalBoundingQuad, 0);
  objc_storeStrong((id *)&self->boundingQuad, 0);
  objc_storeStrong((id *)&self->_boundingQuadAfterOCR, 0);
}

@end
