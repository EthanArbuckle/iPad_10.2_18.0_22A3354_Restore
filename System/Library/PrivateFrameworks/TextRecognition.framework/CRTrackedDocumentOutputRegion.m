@implementation CRTrackedDocumentOutputRegion

+ (CRBlockOutputRegion)_blockFromTrackedRegionGroup:(uint64_t)a3 trackedType:
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  __double2 v18;
  __double2 v19;
  const __CFString *v20;
  void *v21;
  CRBlockOutputRegion *v22;
  void *v23;
  void *v24;
  CRBlockOutputRegion *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v3;
  objc_msgSend(v3, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v45;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "numberOfLines");
        objc_msgSend(v14, "baselineAngle");
        v17 = v16;
        if (v11 == 0.0)
        {
          v12 = v16;
        }
        else
        {
          v18 = __sincos_stret(v12);
          v19 = __sincos_stret(v17);
          v12 = atan2(v19.__sinval + v18.__sinval * v11, v19.__cosval + v18.__cosval * v11);
        }
        if (objc_msgSend(v4, "length"))
        {
          if (objc_msgSend(v5, "isInlineGroup"))
            v20 = CFSTR(" ");
          else
            v20 = CFSTR("\n");
          objc_msgSend(v4, "appendString:", v20);
        }
        v9 += v15;
        objc_msgSend(v14, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v21);

        v11 = v11 + 1.0;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v12 = 0.0;
  }

  v22 = [CRBlockOutputRegion alloc];
  objc_msgSend(v5, "children");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CROutputRegion initWithConfidence:baselineAngle:](v22, "initWithConfidence:baselineAngle:", objc_msgSend(v24, "confidence"), v12);

  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v25, "setShouldComputeBoundsFromChildren:", 0);
  -[CROutputRegion setShouldComputeParagraphsFromChildren:](v25, "setShouldComputeParagraphsFromChildren:", 0);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v25, "setShouldComputeTranscriptFromChildren:", 0);
  -[CROutputRegion setNumberOfLines:](v25, "setNumberOfLines:", v9);
  -[CROutputRegion setTextAlignment:](v25, "setTextAlignment:", objc_msgSend(v5, "textAlignment"));
  -[CROutputRegion setLayoutDirection:](v25, "setLayoutDirection:", objc_msgSend(v5, "layoutDirection"));
  -[CROutputRegion setText:](v25, "setText:", v4);
  objc_msgSend(v5, "boundingQuad");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setBoundingQuad:](v25, "setBoundingQuad:", v26);

  objc_msgSend(v5, "originalBoundingQuad");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setOriginalBoundingQuad:](v25, "setOriginalBoundingQuad:", v27);

  objc_msgSend(v5, "boundingQuadHomography");
  -[CROutputRegion setBoundingQuadHomography:](v25, "setBoundingQuadHomography:");
  objc_msgSend(v5, "trackingID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setTrackingID:](v25, "setTrackingID:", v28);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "vcQuad");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "homographyGroupID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setHomographyGroupID:](v25, "setHomographyGroupID:", v31);

  if (a3 == 4)
  {
    -[CROutputRegion setChildren:](v25, "setChildren:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v5, "children");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setParagraphRegions:](v25, "setParagraphRegions:", v32);

    -[CROutputRegion setNumberOfLines:](v25, "setNumberOfLines:", 0);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v5, "children");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(v33);
          -[CROutputRegion setNumberOfLines:](v25, "setNumberOfLines:", -[CROutputRegion numberOfLines](v25, "numberOfLines")+ objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "numberOfLines"));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v35);
    }
  }
  else
  {
    objc_msgSend(v5, "children");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setChildren:](v25, "setChildren:", v33);
  }

  return v25;
}

+ (CRBlockOutputRegion)_blockFromRegion:(uint64_t)a3 trackedType:
{
  id v4;
  CRBlockOutputRegion *v5;
  uint64_t v6;
  CRBlockOutputRegion *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  v5 = [CRBlockOutputRegion alloc];
  v6 = objc_msgSend(v4, "confidence");
  objc_msgSend(v4, "baselineAngle");
  v7 = -[CROutputRegion initWithConfidence:baselineAngle:](v5, "initWithConfidence:baselineAngle:", v6);
  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v7, "setShouldComputeBoundsFromChildren:", 0);
  -[CROutputRegion setShouldComputeParagraphsFromChildren:](v7, "setShouldComputeParagraphsFromChildren:", 0);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v7, "setShouldComputeTranscriptFromChildren:", 0);
  objc_msgSend(v4, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setChildren:](v7, "setChildren:", v8);

  -[CROutputRegion setNumberOfLines:](v7, "setNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
  -[CROutputRegion setTextAlignment:](v7, "setTextAlignment:", objc_msgSend(v4, "textAlignment"));
  -[CROutputRegion setLayoutDirection:](v7, "setLayoutDirection:", objc_msgSend(v4, "layoutDirection"));
  objc_msgSend(v4, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setText:](v7, "setText:", v9);

  objc_msgSend(v4, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setBoundingQuad:](v7, "setBoundingQuad:", v10);

  objc_msgSend(v4, "originalBoundingQuad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setOriginalBoundingQuad:](v7, "setOriginalBoundingQuad:", v11);

  objc_msgSend(v4, "boundingQuadHomography");
  -[CROutputRegion setBoundingQuadHomography:](v7, "setBoundingQuadHomography:");
  objc_msgSend(v4, "trackingID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setTrackingID:](v7, "setTrackingID:", v12);

  if (a3 == 4)
  {
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setParagraphRegions:](v7, "setParagraphRegions:", v13);

  }
  return v7;
}

+ (id)documentWithTrackedRegionGroups:(id)a3
{
  id v4;
  CRTrackedDocumentOutputRegion *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRTrackedDocumentOutputRegion alloc], "initWithConfidence:baselineAngle:", 2, 0.0);
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        +[CRTrackedDocumentOutputRegion _blockFromTrackedRegionGroup:trackedType:]((uint64_t)a1, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15), v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16, (_QWORD)v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[CRDocumentOutputRegion setChildren:](v5, "setChildren:", v10);
  return v5;
}

+ (id)documentWithTrackedRegions:(id)a3
{
  id v4;
  CRTrackedDocumentOutputRegion *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRTrackedDocumentOutputRegion alloc], "initWithConfidence:baselineAngle:", 2, 0.0);
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 8
    || (-[CROutputRegion setShouldComputeParagraphsFromChildren:](v5, "setShouldComputeParagraphsFromChildren:", 0),
        v7 != 2))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          +[CRTrackedDocumentOutputRegion _blockFromRegion:trackedType:]((uint64_t)a1, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14), v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15, (_QWORD)v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    v8 = (id)objc_msgSend(v9, "copy");
    -[CRDocumentOutputRegion setChildren:](v5, "setChildren:", v8);
    if (v7 == 4)
      -[CROutputRegion setParagraphRegions:](v5, "setParagraphRegions:", v10);
  }
  else
  {
    v8 = v4;
    -[CRDocumentOutputRegion setChildren:](v5, "setChildren:", v8);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CRTrackedDocumentOutputRegion;
  v8 = -[CRDocumentOutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v25, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  if (v6)
  {
    -[CROutputRegion paragraphRegions](self, "paragraphRegions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v8, "contentsWithTypes:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      -[CROutputRegion paragraphRegions](self, "paragraphRegions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v12 == v14)
      {
        -[CROutputRegion paragraphRegions](self, "paragraphRegions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          v17 = 0;
          do
          {
            -[CROutputRegion paragraphRegions](self, "paragraphRegions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "trackingID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setTrackingID:", v20);

            ++v17;
            -[CROutputRegion paragraphRegions](self, "paragraphRegions");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

          }
          while (v23 > v17);
        }
      }

    }
  }
  return v8;
}

@end
