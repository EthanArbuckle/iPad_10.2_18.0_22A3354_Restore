@implementation CRTextFeatureOrderV2

- (CRTextFeatureOrderV2)initWithAngleThresholdForRotatedCrops:(double)a3
{
  CRTextFeatureOrderV2 *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRTextFeatureOrderV2;
  result = -[CRTextFeatureOrderV2 init](&v5, sel_init);
  if (result)
  {
    result->_textFeatureOrderMode = 0;
    result->_angleThresholdForRotatedCrops = a3;
  }
  return result;
}

- (id)orderAndGroupRegions:(id)a3
{
  -[CRTextFeatureOrderV2 orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:](self, "orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:", a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)orderAndGroupRegions:(id)a3 tableGroups:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[CRCTLDDelegateTablesCoarse delegateWithTableGroups:textRegions:](CRCTLDDelegateTablesCoarse, "delegateWithTableGroups:textRegions:", v7, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    +[CRCTLDDelegateTablesCoarse delegateWithTableGroups:textRegions:](CRCTLDDelegateTablesFine, "delegateWithTableGroups:textRegions:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)v8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[CRTextFeatureOrderV2 orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:](self, "orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:", v6, v10, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rowOrderLinesFromTable:(id)a3 cellGroups:(id)a4 outSortedCellGroups:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "subregions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "cells", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v15, "subregions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v16);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v10;
}

- (id)orderAndGroupRegions:(id)a3 coarseDelegate:(id)a4 fineDelegate:(id)a5 coarseOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  CRTableGroupRegion *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CRTableGroupRegion *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v38;
  void *v39;
  CRCTLD *v40;
  id v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v6 = a6;
  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v41 = a5;
  v34 = v9;
  v35 = v10;
  if (objc_msgSend(v9, "count"))
  {
    -[CRTextFeatureOrderV2 createCoarseCTLDConfig](self, "createCoarseCTLDConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc_init(CRCTLD);
    -[CRCTLD groupAndOrderRegions:config:delegate:](v40, "groupAndOrderRegions:config:delegate:", v9, v32, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11 = v33;
      v12 = v33;
    }
    else
    {
      -[CRTextFeatureOrderV2 createFineCTLDConfig](self, "createFineCTLDConfig", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v33;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v13)
      {
        v38 = *(_QWORD *)v49;
        do
        {
          v42 = v13;
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v49 != v38)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v15;
              objc_msgSend(v16, "subregions");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRCTLD groupAndOrderRegions:config:delegate:](v40, "groupAndOrderRegions:config:delegate:", v17, v39, v41);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRTextFeatureOrderV2 rowOrderLinesFromTable:cellGroups:outSortedCellGroups:](self, "rowOrderLinesFromTable:cellGroups:outSortedCellGroups:", v16, v18, v19);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = [CRTableGroupRegion alloc];
              objc_msgSend(v16, "boundingQuad");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v16, "layoutDirection");
              objc_msgSend(v16, "rowQuads");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "columnQuads");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[CRTableGroupRegion initWithBoundingQuad:layoutDirection:cells:lineRegions:rowQuads:columnQuads:](v20, "initWithBoundingQuad:layoutDirection:cells:lineRegions:rowQuads:columnQuads:", v21, v22, v19, v43, v23, v24);
              objc_msgSend(v12, "addObject:", v25);

            }
            else
            {
              objc_msgSend(v15, "subregions");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRCTLD groupAndOrderRegions:config:delegate:](v40, "groupAndOrderRegions:config:delegate:", v26, v39, v41);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              v18 = v27;
              v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v45;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v45 != v29)
                      objc_enumerationMutation(v18);
                    objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
                  }
                  v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                }
                while (v28);
              }
              v16 = v18;
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v13);
      }

      v11 = v33;
    }

  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)orderAndGroupRegions:(id)a3 coarseDelegate:(id)a4 fineDelegate:(id)a5
{
  -[CRTextFeatureOrderV2 orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:](self, "orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createCoarseCTLDConfig
{
  CRCTLDConfig *v3;
  double angleThresholdForRotatedCrops;
  int64_t v5;
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

  v3 = objc_alloc_init(CRCTLDConfig);
  angleThresholdForRotatedCrops = self->_angleThresholdForRotatedCrops;
  *(float *)&angleThresholdForRotatedCrops = angleThresholdForRotatedCrops;
  -[CRCTLDConfig setAngleThresholdForRotationCorrection:](v3, "setAngleThresholdForRotationCorrection:", angleThresholdForRotatedCrops);
  -[CRCTLDConfig setFlatMergeJumps:](v3, "setFlatMergeJumps:", 0);
  v5 = -[CRTextFeatureOrderV2 textFeatureOrderMode](self, "textFeatureOrderMode");
  if (!v5)
  {
    LODWORD(v6) = 1063675494;
    -[CRCTLDConfig setAllowedOverlap:](v3, "setAllowedOverlap:", v6);
    -[CRCTLDConfig setMaxRegions:](v3, "setMaxRegions:", 60);
    -[CRCTLDConfig setMaxQueueCapacity:](v3, "setMaxQueueCapacity:", 0xFFFFFFFFLL);
    LODWORD(v11) = 1047904911;
    -[CRCTLDConfig setMinWhitespaceWidth:](v3, "setMinWhitespaceWidth:", v11);
    LODWORD(v12) = 1073993482;
    -[CRCTLDConfig setMinWhitespaceHeight:](v3, "setMinWhitespaceHeight:", v12);
    -[CRCTLDConfig setNumLookupElements:](v3, "setNumLookupElements:", 40);
    -[CRCTLDConfig setNumPointsForSegmentsIntersection:](v3, "setNumPointsForSegmentsIntersection:", 9);
    LODWORD(v13) = 1081333514;
    -[CRCTLDConfig setQualityHeightFactor:](v3, "setQualityHeightFactor:", v13);
    LODWORD(v10) = 1065688760;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    LODWORD(v6) = 1062501089;
    -[CRCTLDConfig setAllowedOverlap:](v3, "setAllowedOverlap:", v6);
    -[CRCTLDConfig setMaxRegions:](v3, "setMaxRegions:", 123);
    -[CRCTLDConfig setMaxQueueCapacity:](v3, "setMaxQueueCapacity:", 0xFFFFFFFFLL);
    LODWORD(v7) = 1072902963;
    -[CRCTLDConfig setMinWhitespaceWidth:](v3, "setMinWhitespaceWidth:", v7);
    LODWORD(v8) = 1070889697;
    -[CRCTLDConfig setMinWhitespaceHeight:](v3, "setMinWhitespaceHeight:", v8);
    -[CRCTLDConfig setNumLookupElements:](v3, "setNumLookupElements:", 38);
    -[CRCTLDConfig setNumPointsForSegmentsIntersection:](v3, "setNumPointsForSegmentsIntersection:", 5);
    LODWORD(v9) = 1076593951;
    -[CRCTLDConfig setQualityHeightFactor:](v3, "setQualityHeightFactor:", v9);
    LODWORD(v10) = 1054615798;
LABEL_5:
    -[CRCTLDConfig setQualityWidthFactor:](v3, "setQualityWidthFactor:", v10);
    LODWORD(v14) = 8.0;
    -[CRCTLDConfig setMinSubRectangleSize:](v3, "setMinSubRectangleSize:", v14);
    LODWORD(v15) = 1035122882;
    -[CRCTLDConfig setMinQuadrilateralRotation:](v3, "setMinQuadrilateralRotation:", v15);
    LODWORD(v16) = 1065185444;
    -[CRCTLDConfig setMinWhitespaceHeightForReadingOrder:](v3, "setMinWhitespaceHeightForReadingOrder:", v16);
  }
  return v3;
}

- (id)createFineCTLDConfig
{
  CRCTLDConfig *v3;
  double angleThresholdForRotatedCrops;
  int64_t v5;
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

  v3 = objc_alloc_init(CRCTLDConfig);
  angleThresholdForRotatedCrops = self->_angleThresholdForRotatedCrops;
  *(float *)&angleThresholdForRotatedCrops = angleThresholdForRotatedCrops;
  -[CRCTLDConfig setAngleThresholdForRotationCorrection:](v3, "setAngleThresholdForRotationCorrection:", angleThresholdForRotatedCrops);
  -[CRCTLDConfig setFlatMergeJumps:](v3, "setFlatMergeJumps:", 1);
  v5 = -[CRTextFeatureOrderV2 textFeatureOrderMode](self, "textFeatureOrderMode");
  if (!v5)
  {
    LODWORD(v6) = 1050589266;
    -[CRCTLDConfig setAllowedOverlap:](v3, "setAllowedOverlap:", v6);
    -[CRCTLDConfig setMaxRegions:](v3, "setMaxRegions:", 169);
    -[CRCTLDConfig setMaxQueueCapacity:](v3, "setMaxQueueCapacity:", 0xFFFFFFFFLL);
    LODWORD(v11) = 1051260355;
    -[CRCTLDConfig setMinWhitespaceWidth:](v3, "setMinWhitespaceWidth:", v11);
    LODWORD(v12) = 1063843267;
    -[CRCTLDConfig setMinWhitespaceHeight:](v3, "setMinWhitespaceHeight:", v12);
    -[CRCTLDConfig setNumLookupElements:](v3, "setNumLookupElements:", 57);
    -[CRCTLDConfig setNumPointsForSegmentsIntersection:](v3, "setNumPointsForSegmentsIntersection:", 4);
    LODWORD(v13) = 1078523331;
    -[CRCTLDConfig setQualityHeightFactor:](v3, "setQualityHeightFactor:", v13);
    LODWORD(v10) = 1066863165;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    LODWORD(v6) = 1065185444;
    -[CRCTLDConfig setAllowedOverlap:](v3, "setAllowedOverlap:", v6);
    -[CRCTLDConfig setMaxRegions:](v3, "setMaxRegions:", 163);
    -[CRCTLDConfig setMaxQueueCapacity:](v3, "setMaxQueueCapacity:", 0xFFFFFFFFLL);
    LODWORD(v7) = 1053609165;
    -[CRCTLDConfig setMinWhitespaceWidth:](v3, "setMinWhitespaceWidth:", v7);
    LODWORD(v8) = 1065688760;
    -[CRCTLDConfig setMinWhitespaceHeight:](v3, "setMinWhitespaceHeight:", v8);
    -[CRCTLDConfig setNumLookupElements:](v3, "setNumLookupElements:", 46);
    -[CRCTLDConfig setNumPointsForSegmentsIntersection:](v3, "setNumPointsForSegmentsIntersection:", 10);
    LODWORD(v9) = 1068876431;
    -[CRCTLDConfig setQualityHeightFactor:](v3, "setQualityHeightFactor:", v9);
    LODWORD(v10) = 1046562734;
LABEL_5:
    -[CRCTLDConfig setQualityWidthFactor:](v3, "setQualityWidthFactor:", v10);
    LODWORD(v14) = 8.0;
    -[CRCTLDConfig setMinSubRectangleSize:](v3, "setMinSubRectangleSize:", v14);
    LODWORD(v15) = 1035122882;
    -[CRCTLDConfig setMinQuadrilateralRotation:](v3, "setMinQuadrilateralRotation:", v15);
    LODWORD(v16) = 1060320051;
    -[CRCTLDConfig setMinWhitespaceHeightForReadingOrder:](v3, "setMinWhitespaceHeightForReadingOrder:", v16);
  }
  return v3;
}

- (int64_t)textFeatureOrderMode
{
  return self->_textFeatureOrderMode;
}

- (void)setTextFeatureOrderMode:(int64_t)a3
{
  self->_textFeatureOrderMode = a3;
}

- (double)angleThresholdForRotatedCrops
{
  return self->_angleThresholdForRotatedCrops;
}

- (void)setAngleThresholdForRotatedCrops:(double)a3
{
  self->_angleThresholdForRotatedCrops = a3;
}

@end
