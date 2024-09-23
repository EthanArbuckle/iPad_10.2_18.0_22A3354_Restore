@implementation CRParagraphOutputRegion

+ (id)paragraphsWithLines:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  __double2 v16;
  __double2 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "baselineAngle", (_QWORD)v25);
        if (v10)
        {
          v16 = __sincos_stret(v15);
          v17 = __sincos_stret(v12);
          v15 = atan2(v17.__sinval * (double)v10 + v16.__sinval, v17.__cosval * (double)v10 + v16.__cosval);
        }
        v12 = v15;
        objc_msgSend(v6, "addObject:", v14);
        if ((objc_msgSend(v14, "shouldWrapToNextLine") & 1) != 0)
        {
          ++v10;
        }
        else
        {
          v18 = (void *)objc_msgSend(v6, "copy");
          objc_msgSend(a1, "paragraphWithLines:confidence:baselineAngle:", v18, 1, v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

          v20 = objc_opt_new();
          v10 = 0;
          v6 = (void *)v20;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  else
  {
    v12 = 0.0;
  }

  if (objc_msgSend(v6, "count"))
  {
    v21 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "paragraphWithLines:confidence:baselineAngle:", v21, 1, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  v23 = (void *)objc_msgSend(v5, "copy", (_QWORD)v25);

  return v23;
}

+ (id)paragraphWithLines:(id)a3 confidence:(int)a4 baselineAngle:(double)a5
{
  uint64_t v6;
  id v7;
  CRParagraphOutputRegion *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  CRNormalizedQuad *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  CRNormalizedQuad *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v6 = *(_QWORD *)&a4;
  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRParagraphOutputRegion alloc], "initWithConfidence:baselineAngle:", v6, a5);
  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v8, "setShouldComputeBoundsFromChildren:", 1);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v8, "setShouldComputeTranscriptFromChildren:", 1);
  -[CROutputRegion setChildren:](v8, "setChildren:", v7);
  -[CROutputRegion setNumberOfLines:](v8, "setNumberOfLines:", objc_msgSend(v7, "count"));
  -[CRParagraphOutputRegion setUseLineSeparatorAsJoiningDelimiter:](v8, "setUseLineSeparatorAsJoiningDelimiter:", 0);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setLayoutDirection:](v8, "setLayoutDirection:", objc_msgSend(v9, "layoutDirection"));

  }
  v10 = v7;
  objc_opt_self();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v60;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v18, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        objc_msgSend(v18, "activationProbability");
        v16 = v16 + v21 * (double)v20;
        v14 += v20;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v13);
    v22 = (double)v14;
  }
  else
  {
    v22 = 0.0;
    v16 = 0.0;
  }

  -[CROutputRegion setActivationProbability:](v8, "setActivationProbability:", v16 / v22);
  v23 = [CRNormalizedQuad alloc];
  -[CROutputRegion children](v8, "children");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "boundingQuad");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topLeft");
  v25 = v24;
  v27 = v26;
  -[CROutputRegion children](v8, "children");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "firstObject");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "boundingQuad");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topRight");
  v29 = v28;
  v31 = v30;
  -[CROutputRegion children](v8, "children");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "lastObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "boundingQuad");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomRight");
  v34 = v33;
  v36 = v35;
  -[CROutputRegion children](v8, "children");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "lastObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "boundingQuad");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomLeft");
  v41 = v40;
  v43 = v42;
  -[CROutputRegion children](v8, "children");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "boundingQuad");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "normalizationSize");
  v49 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v23, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v25, v27, v29, v31, v34, v36, v41, v43, v47, v48);
  -[CRParagraphOutputRegion setTopBottomEdgesQuad:](v8, "setTopBottomEdgesQuad:", v49);

  return v8;
}

- (unint64_t)type
{
  return 4;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)joiningDelimiter
{
  if (-[CRParagraphOutputRegion useLineSeparatorAsJoiningDelimiter](self, "useLineSeparatorAsJoiningDelimiter"))
    return CFSTR("\u2028");
  else
    return CFSTR("\n");
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (void)_computeGeometryInfo
{
  id v3;

  v3 = -[CRRegionGroupGeometryInfo initFromRegionGroup:]([CRRegionGroupGeometryInfo alloc], "initFromRegionGroup:", self);
  -[CROutputRegion setGeometryInfo:](self, "setGeometryInfo:", v3);

}

- (unint64_t)textAlignment
{
  unint64_t v3;
  void *v4;

  if (-[CROutputRegion layoutDirection](self, "layoutDirection") != 5)
  {
    -[CROutputRegion geometryInfo](self, "geometryInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isCenterJustified") & 1) != 0)
    {
      v3 = 1;
LABEL_18:

      return v3;
    }
    if (!objc_msgSend(v4, "isLeftJustified") || (objc_msgSend(v4, "isRightJustified") & 1) == 0)
    {
      if (-[CROutputRegion layoutDirection](self, "layoutDirection") == 1
        && (objc_msgSend(v4, "isLeftJustified") & 1) != 0
        || -[CROutputRegion layoutDirection](self, "layoutDirection") == 2
        && (objc_msgSend(v4, "isRightJustified") & 1) != 0)
      {
        v3 = 2;
        goto LABEL_18;
      }
      if (-[CROutputRegion layoutDirection](self, "layoutDirection") == 1
        && (objc_msgSend(v4, "isRightJustified") & 1) != 0
        || -[CROutputRegion layoutDirection](self, "layoutDirection") == 2
        && (objc_msgSend(v4, "isLeftJustified") & 1) != 0)
      {
        v3 = 3;
        goto LABEL_18;
      }
    }
    v3 = 0;
    goto LABEL_18;
  }
  return 0;
}

- (id)layoutComponents
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRParagraphOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v10, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  objc_msgSend(v7, "setUseLineSeparatorAsJoiningDelimiter:", -[CRParagraphOutputRegion useLineSeparatorAsJoiningDelimiter](self, "useLineSeparatorAsJoiningDelimiter"));
  -[CRParagraphOutputRegion topBottomEdgesQuad](self, "topBottomEdgesQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTopBottomEdgesQuad:", v8);

  return v7;
}

- (BOOL)useLineSeparatorAsJoiningDelimiter
{
  return self->_useLineSeparatorAsJoiningDelimiter;
}

- (void)setUseLineSeparatorAsJoiningDelimiter:(BOOL)a3
{
  self->_useLineSeparatorAsJoiningDelimiter = a3;
}

- (CRNormalizedQuad)topBottomEdgesQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTopBottomEdgesQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBottomEdgesQuad, 0);
}

@end
