@implementation CRTextFeature

- (CRTextFeature)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRTextFeature;
  return -[CRTextFeature init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "encodeObject:forKey:", self->_subFeatures, CFSTR("subFeatures"));
  objc_msgSend(v14, "encodePoint:forKey:", CFSTR("topLeft"), self->_topLeft.x, self->_topLeft.y);
  objc_msgSend(v14, "encodePoint:forKey:", CFSTR("topRight"), self->_topRight.x, self->_topRight.y);
  objc_msgSend(v14, "encodePoint:forKey:", CFSTR("bottomLeft"), self->_bottomLeft.x, self->_bottomLeft.y);
  objc_msgSend(v14, "encodePoint:forKey:", CFSTR("bottomRight"), self->_bottomRight.x, self->_bottomRight.y);
  objc_msgSend(v14, "encodeRect:forKey:", CFSTR("bounds"), self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  objc_msgSend(v14, "encodePoint:forKey:", CFSTR("toplineOrigin"), self->_toplineOrigin.x, self->_toplineOrigin.y);
  objc_msgSend(v14, "encodePoint:forKey:", CFSTR("baselineOrigin"), self->_baselineOrigin.x, self->_baselineOrigin.y);
  objc_msgSend(v14, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));
  *(float *)&v4 = self->_baselineAngle;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("baselineAngle"));

  *(float *)&v6 = self->_textlineHeight;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("textlineHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_bestCandidateIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("bestCandidateIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("type"));

  objc_msgSend(v14, "encodeObject:forKey:", self->_polygon, CFSTR("polygon"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lineWrappingType != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("lineWrappingType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nmsOutputScale != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("nmsOutputScale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_textType != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("textType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_whitespaceInjected);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("whitespaceInjected"));

}

- (CRTextFeature)initWithCoder:(id)a3
{
  id v4;
  CRTextFeature *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRTextFeature;
  v5 = -[CRTextFeature init](&v24, sel_init);
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("subFeatures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setSubFeatures:](v5, "setSubFeatures:", v6);

  objc_msgSend(v4, "decodePointForKey:", CFSTR("topRight"));
  -[CRTextFeature setTopRight:](v5, "setTopRight:");
  objc_msgSend(v4, "decodePointForKey:", CFSTR("topLeft"));
  -[CRTextFeature setTopLeft:](v5, "setTopLeft:");
  objc_msgSend(v4, "decodePointForKey:", CFSTR("bottomLeft"));
  -[CRTextFeature setBottomLeft:](v5, "setBottomLeft:");
  objc_msgSend(v4, "decodePointForKey:", CFSTR("bottomRight"));
  -[CRTextFeature setBottomRight:](v5, "setBottomRight:");
  objc_msgSend(v4, "decodeRectForKey:", CFSTR("bounds"));
  -[CRTextFeature setBounds:](v5, "setBounds:");
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("stringValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setStringValue:](v5, "setStringValue:", v7);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("baselineAngle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v5->_baselineAngle = v9;

  objc_msgSend(v4, "decodePointForKey:", CFSTR("toplineOrigin"));
  v5->_toplineOrigin.x = v10;
  v5->_toplineOrigin.y = v11;
  objc_msgSend(v4, "decodePointForKey:", CFSTR("baselineOrigin"));
  v5->_baselineOrigin.x = v12;
  v5->_baselineOrigin.y = v13;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("textlineHeight"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  -[CRTextFeature setTextlineHeight:](v5, "setTextlineHeight:");

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("bestCandidateIndex"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setBestCandidateIndex:](v5, "setBestCandidateIndex:", objc_msgSend(v15, "integerValue"));

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setType:](v5, "setType:", objc_msgSend(v16, "unsignedIntegerValue"));

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setUuid:](v5, "setUuid:", v17);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("polygon"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setPolygon:](v5, "setPolygon:", v18);

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("lineWrappingType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setLineWrappingType:](v5, "setLineWrappingType:", objc_msgSend(v19, "unsignedIntegerValue"));

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("nmsOutputScale"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setNmsOutputScale:](v5, "setNmsOutputScale:", objc_msgSend(v20, "unsignedIntegerValue"));

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("textType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setTextType:](v5, "setTextType:", objc_msgSend(v21, "unsignedIntegerValue"));

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("whitespaceInjected"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setWhitespaceInjected:](v5, "setWhitespaceInjected:", objc_msgSend(v22, "BOOLValue"));

  return v5;
}

- (CRTextFeature)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CRTextFeature *v14;
  CGPath *Mutable;
  void *v16;
  void *v17;
  objc_super v19;
  CGPoint points;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CGRect PathBoundingBox;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v27 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)CRTextFeature;
  v14 = -[CRTextFeature init](&v19, sel_init);
  if (v14)
  {
    points.x = v13;
    points.y = v12;
    v21 = v11;
    v22 = v10;
    v23 = x;
    v24 = y;
    v25 = v9;
    v26 = v8;
    Mutable = CGPathCreateMutable();
    CGPathAddLines(Mutable, 0, &points, 4uLL);
    PathBoundingBox = CGPathGetPathBoundingBox(Mutable);
    -[CRTextFeature setBounds:](v14, "setBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
    -[CRTextFeature setTopLeft:](v14, "setTopLeft:", v13, v12);
    -[CRTextFeature setTopRight:](v14, "setTopRight:", v11, v10);
    -[CRTextFeature setBottomLeft:](v14, "setBottomLeft:", v9, v8);
    -[CRTextFeature setBottomRight:](v14, "setBottomRight:", x, y);
    -[CRTextFeature setShouldExpandToFullWidth:](v14, "setShouldExpandToFullWidth:", 0);
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setConfidence:](v14, "setConfidence:", v16);

    -[CRTextFeature setSubFeatures:](v14, "setSubFeatures:", 0);
    -[CRTextFeature setType:](v14, "setType:", 0);
    CGPathRelease(Mutable);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setUuid:](v14, "setUuid:", v17);

    -[CRTextFeature setPolygon:](v14, "setPolygon:", 0);
    -[CRTextFeature setLineWrappingType:](v14, "setLineWrappingType:", 0);
    -[CRTextFeature setNmsOutputScale:](v14, "setNmsOutputScale:", 0);
    -[CRTextFeature setTextType:](v14, "setTextType:", 0);
  }
  return v14;
}

- (unint64_t)subFeatureType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[CRTextFeature subFeatures](self, "subFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[CRTextFeature subFeatures](self, "subFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRTextFeature *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = -[CRTextFeature init](+[CRTextFeature allocWithZone:](CRTextFeature, "allocWithZone:"), "init");
  -[CRTextFeature bounds](self, "bounds");
  -[CRTextFeature setBounds:](v5, "setBounds:");
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  -[CRTextFeature setBottomLeft:](v5, "setBottomLeft:");
  -[CRTextFeature bottomRight](self, "bottomRight");
  -[CRTextFeature setBottomRight:](v5, "setBottomRight:");
  -[CRTextFeature topLeft](self, "topLeft");
  -[CRTextFeature setTopLeft:](v5, "setTopLeft:");
  -[CRTextFeature topRight](self, "topRight");
  -[CRTextFeature setTopRight:](v5, "setTopRight:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[CRTextFeature subFeatures](self, "subFeatures", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v10), "copy");
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v8);
  }

  -[CRTextFeature setSubFeatures:](v5, "setSubFeatures:", v6);
  -[CRTextFeature setShouldExpandToFullWidth:](v5, "setShouldExpandToFullWidth:", -[CRTextFeature shouldExpandToFullWidth](self, "shouldExpandToFullWidth"));
  -[CRTextFeature stringValue](self, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setStringValue:](v5, "setStringValue:", v12);

  -[CRTextFeature imageCut](self, "imageCut");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setImageCut:](v5, "setImageCut:", v13);

  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[CRTextFeature setStringValueCandidates:](v5, "setStringValueCandidates:", v15);

  -[CRTextFeature subFeatureCandidates](self, "subFeatureCandidates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[CRTextFeature setSubFeatureCandidates:](v5, "setSubFeatureCandidates:", v17);

  -[CRTextFeature candidateProbs](self, "candidateProbs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[CRTextFeature setCandidateProbs:](v5, "setCandidateProbs:", v19);

  -[CRTextFeature gtStringValue](self, "gtStringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setGtStringValue:](v5, "setGtStringValue:", v20);

  -[CRTextFeature confidence](self, "confidence");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setConfidence:](v5, "setConfidence:", v21);

  -[CRTextFeature setFeatureMapID:](v5, "setFeatureMapID:", -[CRTextFeature featureMapID](self, "featureMapID"));
  -[CRTextFeature setBestCandidateIndex:](v5, "setBestCandidateIndex:", -[CRTextFeature bestCandidateIndex](self, "bestCandidateIndex"));
  -[CRTextFeature textlineHeight](self, "textlineHeight");
  -[CRTextFeature setTextlineHeight:](v5, "setTextlineHeight:");
  -[CRTextFeature baselineOrigin](self, "baselineOrigin");
  v23 = v22;
  v25 = v24;
  -[CRTextFeature toplineOrigin](self, "toplineOrigin");
  v27 = v26;
  v29 = v28;
  -[CRTextFeature baselineAngle](self, "baselineAngle");
  LODWORD(v31) = v30;
  -[CRTextFeature setBaselineOrigin:toplineOrigin:slope:](v5, "setBaselineOrigin:toplineOrigin:slope:", v23, v25, v27, v29, v31);
  -[CRTextFeature setSizeHint:](v5, "setSizeHint:", -[CRTextFeature sizeHint](self, "sizeHint"));
  v32 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CRTextFeature scriptCategoryResults](self, "scriptCategoryResults");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithArray:copyItems:", v33, 1);
  -[CRTextFeature setScriptCategoryResults:](v5, "setScriptCategoryResults:", v34);

  v35 = (void *)MEMORY[0x1E0C99D80];
  -[CRTextFeature scriptCounts](self, "scriptCounts");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryWithDictionary:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setScriptCounts:](v5, "setScriptCounts:", v37);

  -[CRTextFeature selectedLocale](self, "selectedLocale");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
  -[CRTextFeature setSelectedLocale:](v5, "setSelectedLocale:", v39);

  -[CRTextFeature sequenceScriptOutputResult](self, "sequenceScriptOutputResult");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copyWithZone:", a3);
  -[CRTextFeature setSequenceScriptOutputResult:](v5, "setSequenceScriptOutputResult:", v41);

  -[CRTextFeature setIsCurved:](v5, "setIsCurved:", -[CRTextFeature isCurved](self, "isCurved"));
  -[CRTextFeature setIsVerticalLayout:](v5, "setIsVerticalLayout:", -[CRTextFeature isVerticalLayout](self, "isVerticalLayout"));
  -[CRTextFeature setShouldRotate180:](v5, "setShouldRotate180:", -[CRTextFeature shouldRotate180](self, "shouldRotate180"));
  -[CRTextFeature setShouldRotate180DetectorOrientationFallBack:](v5, "setShouldRotate180DetectorOrientationFallBack:", -[CRTextFeature shouldRotate180DetectorOrientationFallBack](self, "shouldRotate180DetectorOrientationFallBack"));
  -[CRTextFeature setUseSequenceOrientation:](v5, "setUseSequenceOrientation:", -[CRTextFeature useSequenceOrientation](self, "useSequenceOrientation"));
  -[CRTextFeature setUseSequenceScriptLocale:](v5, "setUseSequenceScriptLocale:", -[CRTextFeature useSequenceScriptLocale](self, "useSequenceScriptLocale"));
  -[CRTextFeature setAppliedOrientationCorrection:](v5, "setAppliedOrientationCorrection:", -[CRTextFeature appliedOrientationCorrection](self, "appliedOrientationCorrection"));
  -[CRTextFeature setWhitespaceInjected:](v5, "setWhitespaceInjected:", -[CRTextFeature whitespaceInjected](self, "whitespaceInjected"));
  -[CRTextFeature setType:](v5, "setType:", -[CRTextFeature type](self, "type"));
  -[CRTextFeature uuid](self, "uuid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setUuid:](v5, "setUuid:", v42);

  -[CRTextFeature setFeatureID:](v5, "setFeatureID:", -[CRTextFeature featureID](self, "featureID"));
  -[CRTextFeature polygon](self, "polygon");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copyWithZone:", a3);
  -[CRTextFeature setPolygon:](v5, "setPolygon:", v44);

  -[CRTextFeature setLineWrappingType:](v5, "setLineWrappingType:", -[CRTextFeature lineWrappingType](self, "lineWrappingType"));
  -[CRTextFeature setNmsOutputScale:](v5, "setNmsOutputScale:", -[CRTextFeature nmsOutputScale](self, "nmsOutputScale"));
  -[CRTextFeature setTextType:](v5, "setTextType:", -[CRTextFeature textType](self, "textType"));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[CRTextFeature uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("CRTextFeature (%@)\n"), v5);

  -[CRTextFeature stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("stringValue: '%@'\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("type: %ld\n"), -[CRTextFeature type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR("subFeatureType: %ld\n"), -[CRTextFeature subFeatureType](self, "subFeatureType"));
  -[CRTextFeature selectedLocale](self, "selectedLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("selectedLocale: %@\n"), v7);

  -[CRTextFeature confidence](self, "confidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("confidence: %lf\n"), v9);

  -[CRTextFeature topLeft](self, "topLeft");
  v11 = v10;
  -[CRTextFeature topLeft](self, "topLeft");
  objc_msgSend(v3, "appendFormat:", CFSTR("topLeft: (%lf, %lf)\n"), v11, v12);
  -[CRTextFeature subFeatures](self, "subFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v3, "appendString:", CFSTR("subFeatures:\n"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v31;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v18, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v27;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v27 != v22)
                  objc_enumerationMutation(v20);
                objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23++));
              }
              while (v21 != v23);
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v21);
          }

          ++v17;
        }
        while (v17 != v15);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v15);
    }

  }
  return (NSString *)v3;
}

- (CRTextFeature)initWithFeatureRect:(id)a3 subFeatureRects:(id)a4
{
  NSString *v6;
  id v7;
  CRTextFeature *v8;
  double x;
  double y;
  double width;
  double height;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CRTextFeature *v22;
  CRTextFeature *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;
  NSRect v33;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CRTextFeature;
  v8 = -[CRTextFeature init](&v30, sel_init);
  if (v8)
  {
    v33 = NSRectFromString(v6);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    -[CRTextFeature setBounds:](v8, "setBounds:");
    -[CRTextFeature setTopLeft:](v8, "setTopLeft:", x, y);
    v13 = x + width;
    -[CRTextFeature setTopRight:](v8, "setTopRight:", v13, y);
    v14 = y + height;
    -[CRTextFeature setBottomLeft:](v8, "setBottomLeft:", x, v14);
    -[CRTextFeature setBottomRight:](v8, "setBottomRight:", v13, v14);
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setConfidence:](v8, "setConfidence:", v15);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
          v22 = [CRTextFeature alloc];
          v23 = -[CRTextFeature initWithFeatureRect:subFeatureRects:](v22, "initWithFeatureRect:subFeatureRects:", v21, 0, (_QWORD)v26);
          objc_msgSend(v16, "addObject:", v23);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }

    -[CRTextFeature setSubFeatures:](v8, "setSubFeatures:", v16);
    -[CRTextFeature setType:](v8, "setType:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setUuid:](v8, "setUuid:", v24);

    -[CRTextFeature setPolygon:](v8, "setPolygon:", 0);
    -[CRTextFeature setLineWrappingType:](v8, "setLineWrappingType:", 0);
    -[CRTextFeature setNmsOutputScale:](v8, "setNmsOutputScale:", 0);
    -[CRTextFeature setTextType:](v8, "setTextType:", 0);

  }
  return v8;
}

- (CRTextFeature)initWithFeatureRect:(id)a3 subFeatureRects:(id)a4 inImage:(id)a5
{
  NSString *v8;
  id v9;
  id v10;
  CRTextFeature *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CRTextFeature *v17;
  NSString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  NSRect v26;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = a5;
  v19 = v8;
  v26 = NSRectFromString(v8);
  v11 = -[CRTextFeature initWithFeatureRect:inImage:](self, "initWithFeatureRect:inImage:", v10, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  if (v11)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v13);
          v17 = -[CRTextFeature initWithFeatureRect:subFeatureRects:inImage:]([CRTextFeature alloc], "initWithFeatureRect:subFeatureRects:inImage:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), 0, v10);
          objc_msgSend(v12, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    -[CRTextFeature setSubFeatures:](v11, "setSubFeatures:", v12);
  }

  return v11;
}

- (CRTextFeature)initWithCCFeatureRect:(id)a3 subFeatureRects:(id)a4 rotatePortrait:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CRTextFeature *v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  CRTextFeature *v24;
  void *v25;
  NSString *aString;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;
  NSRect v35;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  aString = (NSString *)a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CRTextFeature;
  v9 = -[CRTextFeature init](&v32, sel_init);
  if (v9)
  {
    NSRectFromString(aString);
    v35 = NSRectFromString(aString);
    v10 = 54.05;
    if (v5)
      v11 = 85.685;
    else
      v11 = 54.05;
    if (!v5)
      v10 = 85.685;
    v12 = v35.size.height / v11;
    v13 = 1.0 - v35.origin.y / v11 - v35.size.height / v11;
    v14 = v35.origin.x / v10;
    v15 = v35.size.width / v10;
    -[CRTextFeature setBounds:](v9, "setBounds:", v35.origin.x / v10, v13, v35.size.width / v10, v35.size.height / v11);
    -[CRTextFeature setTopLeft:](v9, "setTopLeft:", v14, v13);
    v16 = v14 + v15;
    -[CRTextFeature setTopRight:](v9, "setTopRight:", v16, v13);
    v17 = v12 + v13;
    -[CRTextFeature setBottomLeft:](v9, "setBottomLeft:", v14, v17);
    -[CRTextFeature setBottomRight:](v9, "setBottomRight:", v16, v17);
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setConfidence:](v9, "setConfidence:", v18);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v20);
          v24 = -[CRTextFeature initWithCCFeatureRect:subFeatureRects:rotatePortrait:]([CRTextFeature alloc], "initWithCCFeatureRect:subFeatureRects:rotatePortrait:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0, v5);
          objc_msgSend(v19, "addObject:", v24);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);
    }

    -[CRTextFeature setSubFeatures:](v9, "setSubFeatures:", v19);
    -[CRTextFeature setType:](v9, "setType:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setUuid:](v9, "setUuid:", v25);

    -[CRTextFeature setPolygon:](v9, "setPolygon:", 0);
    -[CRTextFeature setLineWrappingType:](v9, "setLineWrappingType:", 0);
    -[CRTextFeature setNmsOutputScale:](v9, "setNmsOutputScale:", 0);
    -[CRTextFeature setTextType:](v9, "setTextType:", 0);

  }
  return v9;
}

- (CRTextFeature)initWithSubfeatures:(id)a3
{
  return -[CRTextFeature initWithSubfeatures:stringValue:](self, "initWithSubfeatures:stringValue:", a3, 0);
}

- (CRTextFeature)initWithSubfeatures:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  CRTextFeature *v8;
  void *v9;
  double v10;
  double x;
  double v12;
  double y;
  double v14;
  CGFloat width;
  double v16;
  CGFloat height;
  unint64_t i;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CRTextFeature;
  v8 = -[CRTextFeature init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    x = v10;
    y = v12;
    width = v14;
    height = v16;

    for (i = 1; objc_msgSend(v6, "count") > i; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v35.origin.x = v20;
      v35.origin.y = v21;
      v35.size.width = v22;
      v35.size.height = v23;
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectUnion(v27, v35);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;

    }
    -[CRTextFeature setTopLeft:](v8, "setTopLeft:", x, y);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectOffset(v29, 0.0, width);
    -[CRTextFeature setTopRight:](v8, "setTopRight:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v32 = CGRectOffset(v31, height, width);
    -[CRTextFeature setBottomRight:](v8, "setBottomRight:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v34 = CGRectOffset(v33, height, 0.0);
    -[CRTextFeature setBottomLeft:](v8, "setBottomLeft:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
    -[CRTextFeature setBounds:](v8, "setBounds:", x, y, width, height);
    -[CRTextFeature setSubFeatures:](v8, "setSubFeatures:", v6);
    -[CRTextFeature setStringValue:](v8, "setStringValue:", v7);
    -[CRTextFeature setType:](v8, "setType:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setUuid:](v8, "setUuid:", v24);

    -[CRTextFeature setPolygon:](v8, "setPolygon:", 0);
    -[CRTextFeature setLineWrappingType:](v8, "setLineWrappingType:", 0);
    -[CRTextFeature setNmsOutputScale:](v8, "setNmsOutputScale:", 0);
    -[CRTextFeature setTextType:](v8, "setTextType:", 0);
  }

  return v8;
}

- (CRTextFeature)initWithFeatureRect:(CGRect)a3 inImage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CRTextFeature *v10;
  double v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CRTextFeature;
  v10 = -[CRTextFeature init](&v50, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "extent");
    v12 = v11;
    objc_msgSend(v9, "extent");
    v13 = v12;
    v15 = v14;
    -[CRTextFeature setBounds:](v10, "setBounds:", x / v13, y / v15, width / v13, height / v15);
    -[CRTextFeature bounds](v10, "bounds");
    -[CRTextFeature setTopLeft:](v10, "setTopLeft:");
    -[CRTextFeature bounds](v10, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[CRTextFeature bounds](v10, "bounds");
    v25 = v24;
    v51.origin.x = v17;
    v51.origin.y = v19;
    v51.size.width = v21;
    v51.size.height = v23;
    v52 = CGRectOffset(v51, 0.0, v25);
    -[CRTextFeature setTopRight:](v10, "setTopRight:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    -[CRTextFeature bounds](v10, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[CRTextFeature bounds](v10, "bounds");
    v35 = v34;
    -[CRTextFeature bounds](v10, "bounds");
    v37 = v36;
    v53.origin.x = v27;
    v53.origin.y = v29;
    v53.size.width = v31;
    v53.size.height = v33;
    v54 = CGRectOffset(v53, v35, v37);
    -[CRTextFeature setBottomRight:](v10, "setBottomRight:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
    -[CRTextFeature bounds](v10, "bounds");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    -[CRTextFeature bounds](v10, "bounds");
    v47 = v46;
    v55.origin.x = v39;
    v55.origin.y = v41;
    v55.size.width = v43;
    v55.size.height = v45;
    v56 = CGRectOffset(v55, v47, 0.0);
    -[CRTextFeature setBottomLeft:](v10, "setBottomLeft:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
    -[CRTextFeature setType:](v10, "setType:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setUuid:](v10, "setUuid:", v48);

    -[CRTextFeature setPolygon:](v10, "setPolygon:", 0);
    -[CRTextFeature setLineWrappingType:](v10, "setLineWrappingType:", 0);
    -[CRTextFeature setNmsOutputScale:](v10, "setNmsOutputScale:", 0);
    -[CRTextFeature setTextType:](v10, "setTextType:", 0);
  }

  return v10;
}

- (id)textFeatureSplitForStringValue:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CRTextFeature *v20;
  void *v21;
  void *v22;
  int v23;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  void *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (v26)
  {
    if (objc_msgSend(v26, "containsString:", CFSTR(" ")))
    {
      objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");
      -[CRTextFeature subFeatures](self, "subFeatures");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v5 == v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(" "));
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v8)
        {
          v9 = 0;
          v10 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              if ((objc_msgSend(v12, "isEqualToString:", &stru_1E98DC948) & 1) == 0)
              {
                v13 = objc_msgSend(v12, "length");
                -[CRTextFeature subFeatures](self, "subFeatures");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v13 + v9 > (unint64_t)objc_msgSend(v14, "count");

                if (v15)
                  goto LABEL_14;
                v16 = objc_alloc(MEMORY[0x1E0C99D20]);
                -[CRTextFeature subFeatures](self, "subFeatures");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "subarrayWithRange:", v9, v13);
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = (void *)objc_msgSend(v16, "initWithArray:copyItems:", v18, 1);

                v20 = -[CRTextFeature initWithSubfeatures:stringValue:]([CRTextFeature alloc], "initWithSubfeatures:stringValue:", v19, v12);
                objc_msgSend(v27, "addObject:", v20);
                LODWORD(v18) = objc_msgSend(v12, "length");

                v9 += v18;
              }
            }
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v8);
        }
LABEL_14:

        v21 = obj;
        goto LABEL_18;
      }
    }
  }
  -[CRTextFeature stringValue](self, "stringValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v26, "isEqualToString:", v22);

  if (!v23)
  {
    v21 = (void *)-[CRTextFeature copy](self, "copy");
    objc_msgSend(v21, "setStringValue:", v26);
    v33 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v34[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v27;
}

- (id)wordFeatures
{
  void *v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  CRTextFeature *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  -[CRTextFeature stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(" "));

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = 0; ; ++i)
    {
      -[CRTextFeature stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (i >= objc_msgSend(v6, "length"))
        break;
      -[CRTextFeature stringValue](self, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "characterAtIndex:", i);

      if (v8 != 32)
        goto LABEL_8;
    }

LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (!v10)
      goto LABEL_26;
    v42 = *(_QWORD *)v45;
    v11 = i;
LABEL_10:
    v43 = v10;
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v42)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
      objc_msgSend(v9, "addObject:", v13);
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length") == 0;

      if (!v15)
      {
        objc_msgSend(v13, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        -[CRTextFeature stringValue](self, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 + v11 >= objc_msgSend(v18, "length"))
        {

LABEL_18:
          -[CRTextFeature stringValue](self, "stringValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "substringWithRange:", i, v17 + v11 - i);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = -[CRTextFeature initWithSubfeatures:stringValue:]([CRTextFeature alloc], "initWithSubfeatures:stringValue:", v9, v22);
          -[CRTextFeature baselineOrigin](self, "baselineOrigin");
          v25 = v24;
          v27 = v26;
          -[CRTextFeature toplineOrigin](self, "toplineOrigin");
          v29 = v28;
          v31 = v30;
          -[CRTextFeature baselineAngle](self, "baselineAngle");
          LODWORD(v33) = v32;
          -[CRTextFeature setBaselineOrigin:toplineOrigin:slope:](v23, "setBaselineOrigin:toplineOrigin:slope:", v25, v27, v29, v31, v33);
          -[CRTextFeature updateSizeHints](v23, "updateSizeHints");
          objc_msgSend(v40, "addObject:", v23);
          v34 = v11 + v17 + 1;
          while (1)
          {
            i = v34;
            -[CRTextFeature stringValue](self, "stringValue");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (i >= objc_msgSend(v35, "length"))
              break;
            -[CRTextFeature stringValue](self, "stringValue");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "characterAtIndex:", i) == 32;

            v34 = i + 1;
            if (!v37)
              goto LABEL_23;
          }

LABEL_23:
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v38 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v38;
          v11 = i;
          goto LABEL_24;
        }
        -[CRTextFeature stringValue](self, "stringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "characterAtIndex:", v17 + v11) == 32;

        if (v20)
          goto LABEL_18;
        v11 += v17;
      }
LABEL_24:
      if (++v12 == v43)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (!v10)
        {
LABEL_26:

          return v40;
        }
        goto LABEL_10;
      }
    }
  }
  v49[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  return v40;
}

- (id)textFeatureScaledToImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "extent");
  v6 = v5;
  objc_msgSend(v4, "extent");
  *(float *)&v7 = v6;
  *(float *)&v9 = v8;
  -[CRTextFeature textFeatureScaledToImageWidth:height:](self, "textFeatureScaledToImageWidth:height:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)textFeatureScaledToImageWidth:(float)a3 height:(float)a4
{
  CRTextFeature *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  void *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(CRTextFeature);
  -[CRTextFeature bounds](self, "bounds");
  v9 = v8;
  -[CRTextFeature bounds](self, "bounds");
  v11 = v10;
  -[CRTextFeature bounds](self, "bounds");
  v13 = v12;
  -[CRTextFeature bounds](self, "bounds");
  v15 = v14;
  -[CRTextFeature bounds](self, "bounds");
  v16 = a3;
  v17 = a4;
  -[CRTextFeature setBounds:](v7, "setBounds:", v9 * a3, v17 - (v11 + v13) * v17, v15 * a3, v18 * a4);
  -[CRTextFeature topLeft](self, "topLeft");
  v20 = v19;
  -[CRTextFeature topLeft](self, "topLeft");
  -[CRTextFeature setTopLeft:](v7, "setTopLeft:", v20 * a3, v17 - v21 * v17);
  -[CRTextFeature topRight](self, "topRight");
  v23 = v22;
  -[CRTextFeature topRight](self, "topRight");
  -[CRTextFeature setTopRight:](v7, "setTopRight:", v23 * a3, v17 - v24 * v17);
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  v26 = v25;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  -[CRTextFeature setBottomLeft:](v7, "setBottomLeft:", v26 * a3, v17 - v27 * v17);
  -[CRTextFeature bottomRight](self, "bottomRight");
  v29 = v28;
  -[CRTextFeature bottomRight](self, "bottomRight");
  -[CRTextFeature setBottomRight:](v7, "setBottomRight:", v29 * a3, v17 - v30 * v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[CRTextFeature subFeatures](self, "subFeatures", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v33)
  {
    v36 = *(_QWORD *)v53;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v53 != v36)
          objc_enumerationMutation(v32);
        *(float *)&v34 = a3;
        *(float *)&v35 = a4;
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v37), "textFeatureScaledToImageWidth:height:", v34, v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v38);

        ++v37;
      }
      while (v33 != v37);
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v33);
  }

  -[CRTextFeature setSubFeatures:](v7, "setSubFeatures:", v31);
  -[CRTextFeature stringValue](self, "stringValue");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setStringValue:](v7, "setStringValue:", v39);

  -[CRTextFeature baselineOrigin](self, "baselineOrigin");
  v41 = v40;
  -[CRTextFeature baselineOrigin](self, "baselineOrigin");
  v43 = v42;
  -[CRTextFeature toplineOrigin](self, "toplineOrigin");
  v45 = v44;
  -[CRTextFeature toplineOrigin](self, "toplineOrigin");
  v47 = v46;
  -[CRTextFeature baselineAngle](self, "baselineAngle");
  LODWORD(v49) = v48;
  -[CRTextFeature setBaselineOrigin:toplineOrigin:slope:](v7, "setBaselineOrigin:toplineOrigin:slope:", v41 * v16, v17 - v43 * v17, v45 * v16, v17 - v47 * v17, v49);
  -[CRTextFeature setSizeHint:](v7, "setSizeHint:", -[CRTextFeature sizeHint](self, "sizeHint"));
  -[CRTextFeature setType:](v7, "setType:", -[CRTextFeature type](self, "type"));
  -[CRTextFeature uuid](self, "uuid");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setUuid:](v7, "setUuid:", v50);

  return v7;
}

- (id)textFeaturebyPaddingToWidth:(float)a3 height:(float)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  CRTextFeature *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  double v42;
  double v43;
  double v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  double v50;
  double v51;
  double v52;
  double v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  -[CRTextFeature subFeatures](self, "subFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (-[CRTextFeature subFeatures](self, "subFeatures"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    v10 = objc_alloc_init(CRTextFeature);
    v11 = (void *)MEMORY[0x1E0C99DE8];
    -[CRTextFeature subFeatures](self, "subFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v15)
    {
      v18 = *(_QWORD *)v65;
      v19 = 3.4028e38;
      v20 = 1.1755e-38;
      v21 = 1.1755e-38;
      v22 = 3.4028e38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v65 != v18)
            objc_enumerationMutation(v14);
          *(float *)&v16 = a3;
          *(float *)&v17 = a4;
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "textFeaturebyPaddingToWidth:height:", v16, v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v24);
          objc_msgSend(v24, "bounds");
          if (v25 < v22)
          {
            objc_msgSend(v24, "bounds");
            v22 = v26;
          }
          objc_msgSend(v24, "bounds");
          if (v27 < v19)
          {
            objc_msgSend(v24, "bounds");
            v19 = v28;
          }
          objc_msgSend(v24, "bounds");
          v30 = v29;
          objc_msgSend(v24, "bounds");
          if (v30 + v31 >= v21)
          {
            objc_msgSend(v24, "bounds", v21, v30 + v31);
            v33 = v32;
            objc_msgSend(v24, "bounds");
            v21 = v33 + v34;
          }
          objc_msgSend(v24, "bounds");
          v36 = v35;
          objc_msgSend(v24, "bounds");
          if (v36 + v37 >= v20)
          {
            objc_msgSend(v24, "bounds", v20, v36 + v37);
            v39 = v38;
            objc_msgSend(v24, "bounds");
            v20 = v39 + v40;
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v15);
    }
    else
    {
      v19 = 3.4028e38;
      v20 = 1.1755e-38;
      v21 = 1.1755e-38;
      v22 = 3.4028e38;
    }

    -[CRTextFeature setSubFeatures:](v10, "setSubFeatures:", v13);
    -[CRTextFeature setBounds:](v10, "setBounds:", v22, v19, (float)(v21 - v22), (float)(v20 - v19));
    -[CRTextFeature setType:](v10, "setType:", -[CRTextFeature type](self, "type"));
    -[CRTextFeature uuid](self, "uuid");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setUuid:](v10, "setUuid:", v62);

  }
  else
  {
    -[CRTextFeature bounds](self, "bounds");
    v43 = v42;
    v44 = v41;
    v45 = v41 * a3 / a4;
    v46 = v42;
    if (v43 <= v45)
      v47 = v41 * a3 / a4;
    else
      v47 = v46;
    if (v41 <= (float)((float)(v46 * a4) / a3))
      v48 = (float)(v46 * a4) / a3;
    else
      v48 = v41;
    v10 = (CRTextFeature *)-[CRTextFeature copy](self, "copy");
    -[CRTextFeature bounds](self, "bounds");
    v49 = (v47 - v43) * 0.5;
    v50 = v49;
    v52 = 0.0;
    if (v51 - v49 >= 0.0)
    {
      -[CRTextFeature bounds](self, "bounds");
      v52 = v53 - v50;
    }
    -[CRTextFeature bounds](self, "bounds");
    v54 = (v48 - v44) * 0.5;
    v55 = v54;
    v57 = v56 - v54;
    v58 = 0.0;
    if (v57 >= 0.0)
    {
      -[CRTextFeature bounds](self, "bounds");
      v58 = v59 - v55;
    }
    v60 = 1.0 - v52;
    if (v52 + v47 <= 1.0)
      v60 = v47;
    if (v58 + v48 <= 1.0)
      v61 = v48;
    else
      v61 = 1.0 - v58;
    -[CRTextFeature setBounds:](v10, "setBounds:", v52, v58, v60, v61);
  }
  return v10;
}

- (void)setStringValue:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_stringValue, a3);
  if (v5)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E98DC948);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    if (v7 == -[NSArray count](self->_subFeatures, "count"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[CRTextFeature subFeatures](self, "subFeatures", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v9)
      {
        v10 = 0;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
            objc_msgSend(v6, "substringWithRange:", v10 + v12, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setStringValue:", v14);

            ++v12;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          v10 += v12;
        }
        while (v9);
      }

    }
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17++), "setStringValue:", 0);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
    }
  }

}

uint64_t __35__CRTextFeature_slopeOfSubFeatures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "bounds");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  if (v6 <= v7)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

BOOL __35__CRTextFeature_slopeOfSubFeatures__block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  float v4;

  objc_msgSend(a2, "bounds");
  v4 = v3;
  return (float)(vabds_f32(v4, *(float *)(a1 + 32)) / *(float *)(a1 + 32)) < 0.1;
}

- (float)caseInsensitiveProbabilityCandidateIndex:(int)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexOfObject:", v12);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL || v10 == v13)
  {
    -[CRTextFeature candidateProbs](self, "candidateProbs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v21 = v22;
  }
  else
  {
    -[CRTextFeature candidateProbs](self, "candidateProbs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    -[CRTextFeature candidateProbs](self, "candidateProbs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v17 + v20;

  }
  return v21;
}

- (void)addKohlsDigitProjection
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  float v20;
  float v21;
  uint64_t v22;
  float v23;
  float v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  float v53;
  CGFloat v54;
  float v55;
  CGFloat v56;
  CGFloat v57;
  double x;
  double y;
  double width;
  double height;
  CRTextFeature *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat rect;
  CRTextFeature *recta;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  float v89;
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v91 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[CRTextFeature subFeatures](self, "subFeatures");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectAtIndex:", (unint64_t)objc_msgSend(v4, "count") >> 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    -[CRTextFeature subFeatures](self, "subFeatures");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __35__CRTextFeature_slopeOfSubFeatures__block_invoke_2;
    v88[3] = &__block_descriptor_36_e40_B24__0__CRTextFeature_8__NSDictionary_16l;
    v89 = v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v88);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    if (v19)
    {
      v20 = v14;
      v21 = v17;
      v22 = *(_QWORD *)v85;
      v23 = 0.0;
      v24 = 0.0;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v85 != v22)
            objc_enumerationMutation(v18);
          v26 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          objc_msgSend(v26, "bounds");
          v28 = v27;
          objc_msgSend(v26, "bounds");
          v29 = v28;
          *(float *)&v30 = v30;
          v31 = v29 - v20;
          v24 = v24 + (float)(v31 * (float)(*(float *)&v30 - v21));
          v23 = v23 + (float)(v31 * v31);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
      }
      while (v19);
    }
    else
    {
      v23 = 0.0;
      v24 = 0.0;
    }

    v32 = (float)(v24 / v23);
  }
  else
  {
    v32 = 0.0;
  }
  -[CRTextFeature subFeatures](self, "subFeatures");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  rect = v35;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  -[CRTextFeature subFeatures](self, "subFeatures");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature subFeatures](self, "subFeatures");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectAtIndex:", objc_msgSend(v43, "count") - 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v41;
  objc_msgSend(v44, "bounds");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  v53 = v37 - (v46 + v50);
  v54 = v39;
  v55 = v39 - v48;
  v56 = (float)(sqrtf((float)(v55 * v55) + (float)(v53 * v53)) * 6.5);
  v57 = v32 * v56;
  v92.origin.x = v46;
  v92.origin.y = v48;
  v92.size.width = v50;
  v92.size.height = v52;
  v93 = CGRectOffset(v92, v56, v57);
  v94 = CGRectInset(v93, v93.size.width * -0.200000003, 0.0);
  x = v94.origin.x;
  y = v94.origin.y;
  width = v94.size.width;
  height = v94.size.height;
  v62 = objc_alloc_init(CRTextFeature);
  -[CRTextFeature setBounds:](v62, "setBounds:", x, y, width, height);
  -[CRTextFeature subFeatures](self, "subFeatures");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "mutableCopy");

  objc_msgSend(v64, "addObject:", v62);
  v95.origin.x = v37;
  v95.size.width = v81;
  v95.origin.y = v54;
  v95.size.height = rect;
  v96 = CGRectOffset(v95, v56, v57);
  v97 = CGRectInset(v96, v96.size.width * -0.200000003, 0.0);
  v65 = v97.origin.x;
  v66 = v97.origin.y;
  v67 = v97.size.width;
  v68 = v97.size.height;
  recta = objc_alloc_init(CRTextFeature);

  -[CRTextFeature setBounds:](recta, "setBounds:", v65, v66, v67, v68);
  objc_msgSend(v64, "addObject:");
  -[CRTextFeature setSubFeatures:](self, "setSubFeatures:", v64);
  -[CRTextFeature bounds](self, "bounds");
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  -[CRTextFeature bounds](recta, "bounds");
  v100.origin.x = v77;
  v100.origin.y = v78;
  v100.size.width = v79;
  v100.size.height = v80;
  v98.origin.x = v70;
  v98.origin.y = v72;
  v98.size.width = v74;
  v98.size.height = v76;
  v99 = CGRectUnion(v98, v100);
  -[CRTextFeature setBounds:](self, "setBounds:", v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);

}

+ (id)lineFeatures:(id)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  float v31;
  float v32;
  float v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t i;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unint64_t k;
  void *v66;
  void *v67;
  float v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
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
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  unint64_t j;
  void *v99;
  void *v100;
  float v101;
  float v102;
  void *v103;
  void *v104;
  void *v105;
  float v106;
  void *v107;
  float v108;
  float v109;
  double v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v115;
  double v116;
  id obj;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v115 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  obj = v115;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
  if (v7)
  {
    v126 = v7;
    v127 = 0;
    v8 = 0;
    v9 = 0;
    v125 = *(_QWORD *)v130;
    v120 = (double)a4;
    v116 = (double)a5;
    do
    {
      v128 = 0;
      do
      {
        if (*(_QWORD *)v130 != v125)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v128);
        if (!v9)
          goto LABEL_16;
        objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * v128), "bounds");
        v12 = v11;
        objc_msgSend(v9, "bounds");
        if (v12 <= v13)
          goto LABEL_16;
        objc_msgSend(v9, "bounds");
        v15 = v14;
        objc_msgSend(v9, "bounds");
        v17 = v16;
        objc_msgSend(v9, "bounds");
        v123 = v18;
        objc_msgSend(v9, "bounds");
        v119 = v19;
        objc_msgSend(v9, "bounds");
        v122 = v20;
        objc_msgSend(v10, "bounds");
        v121 = v21;
        objc_msgSend(v10, "bounds");
        v23 = v22;
        objc_msgSend(v10, "bounds");
        v25 = v24;
        objc_msgSend(v10, "bounds");
        v27 = v26;
        objc_msgSend(v10, "bounds");
        v29 = v28;
        objc_msgSend(v10, "baselineAngle");
        v31 = v30;
        objc_msgSend(v10, "baselineAngle");
        v33 = v32;
        v118 = v27;
        v34 = v17;
        v35 = cosf(v31);
        LODWORD(v17) = sinf(v33);
        objc_msgSend(v9, "baselineAngle");
        v37 = v36;
        objc_msgSend(v9, "baselineAngle");
        v39 = v15 * v120;
        v40 = v116;
        v41 = v40 - (v23 + v25) * v40 + v29 * v116;
        v42 = v39 - (v121 * v120 + v35);
        v43 = v40 - (v34 + v123) * v40 + v122 * v116 - (v41 - *(float *)&v17);
        v44 = sqrt(v43 * v43 + v42 * v42);
        if (v44 >= 0.01)
        {
          v45 = (float)-sinf(v38);
          if (fabs(fabs((v43 * v45 + cosf(v37) * v42) / v44) + -1.0) >= 0.01)
            goto LABEL_16;
        }
        if (v121 * v120 - (v39 + v119 * v120) < v118 * v120 * 0.5)
        {
          objc_msgSend(v9, "stringValue");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "stringValue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR(" %@"), v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringByAppendingString:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setStringValue:", v50);

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          for (i = 0; ; ++i)
          {
            objc_msgSend(v9, "stringValueCandidates");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = i < objc_msgSend(v53, "count");

            if (!v54)
              break;
            objc_msgSend(v9, "stringValueCandidates");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectAtIndexedSubscript:", i);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "stringValueCandidates");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "stringValueCandidates");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = i < objc_msgSend(v59, "count");

            if (v60)
            {
              objc_msgSend(v10, "stringValueCandidates");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", i);
              v62 = objc_claimAutoreleasedReturnValue();

              v58 = (void *)v62;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v58);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringByAppendingString:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "addObject:", v64);
          }
          objc_msgSend(v9, "setStringValueCandidates:", v51);
          objc_msgSend(v9, "bounds");
          v76 = v75;
          objc_msgSend(v9, "bounds");
          v78 = v77;
          objc_msgSend(v10, "bounds");
          if (v78 >= v79)
            objc_msgSend(v10, "bounds");
          else
            objc_msgSend(v9, "bounds");
          v81 = v80;
          objc_msgSend(v9, "bounds");
          v83 = v82;
          objc_msgSend(v9, "bounds");
          v85 = v84;
          objc_msgSend(v10, "bounds");
          v87 = v86;
          objc_msgSend(v10, "bounds");
          v88 = v83 + v85;
          if (v83 + v85 <= v87 + v89)
          {
            objc_msgSend(v10, "bounds", v88);
            v91 = v93;
            objc_msgSend(v10, "bounds");
          }
          else
          {
            objc_msgSend(v9, "bounds", v88);
            v91 = v90;
            objc_msgSend(v9, "bounds");
          }
          v94 = v92;
          objc_msgSend(v10, "bounds");
          v96 = v95;
          objc_msgSend(v10, "bounds");
          objc_msgSend(v9, "setBounds:", v76, v81, v96 + v97 - v76, v91 + v94 - v81);
          for (j = 0; j < objc_msgSend(v8, "count"); ++j)
          {
            objc_msgSend(v10, "candidateProbs");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "objectAtIndexedSubscript:", 0);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "floatValue");
            v102 = v101;

            objc_msgSend(v10, "candidateProbs");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v99) = j < objc_msgSend(v103, "count");

            if ((_DWORD)v99)
            {
              objc_msgSend(v10, "candidateProbs");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "objectAtIndexedSubscript:", j);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "floatValue");
              v102 = v106;

            }
            objc_msgSend(v8, "objectAtIndexedSubscript:", j);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "floatValue");
            v109 = v108;

            *(float *)&v110 = v102 + v109;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:atIndexedSubscript:", v111, j);

          }
          ++v127;
        }
        else
        {
LABEL_16:
          if (v127 >= 2)
          {
            for (k = 0; k < objc_msgSend(v8, "count"); ++k)
            {
              v66 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v8, "objectAtIndexedSubscript:", k);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "floatValue");
              *(float *)&v69 = v68 / (float)v127;
              objc_msgSend(v66, "numberWithFloat:", v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:atIndexedSubscript:", v70, k);

            }
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setCandidateProbs:", v71);

          }
          v72 = (void *)objc_msgSend(v10, "copy");

          objc_msgSend(v72, "candidateProbs");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "mutableCopy");

          objc_msgSend(v124, "addObject:", v72);
          v127 = 1;
          v8 = (void *)v74;
          v9 = v72;
        }
        ++v128;
      }
      while (v128 != v126);
      v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
      v126 = v112;
    }
    while (v112);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v124);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  return v113;
}

+ (id)overlayFeatures:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  CGColor *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  CGColor *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  CGImage *Image;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  id obj;
  CGColor *color;
  _BOOL4 v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  CGFloat components[2];
  __int128 v46;
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v32 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  v28 = v6;
  objc_msgSend(v33, "extent");
  if (v6 && (v9 = v7, v10 = v8, objc_msgSend(v6, "count")))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v12 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(v9, 5uLL), DeviceRGB, 2u);
    *(_OWORD *)components = xmmword_1D513B428;
    v46 = unk_1D513B438;
    v13 = CGColorCreate(DeviceRGB, components);
    CGContextSetStrokeColorWithColor(v12, v13);
    color = v13;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v6;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v40;
      v29 = *(_QWORD *)v40;
      do
      {
        v34 = v14;
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "textFeatureScaledToImage:", v33);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          CGContextSetStrokeColorWithColor(v12, color);
          CGContextSetLineWidth(v12, 7.0);
          objc_msgSend(v17, "bounds");
          CGContextStrokeRect(v12, v48);
          if (v32)
          {
            v18 = CGColorCreate(DeviceRGB, components);
            CGContextSetStrokeColorWithColor(v12, v18);
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            objc_msgSend(v17, "subFeatures");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v36;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v36 != v21)
                    objc_enumerationMutation(v19);
                  v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                  CGContextSetLineWidth(v12, 1.0);
                  objc_msgSend(v23, "bounds");
                  CGContextStrokeRect(v12, v49);
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v20);
            }

            v15 = v29;
            CGColorRelease(v18);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v14);
    }

    Image = CGBitmapContextCreateImage(v12);
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", Image);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageByCompositingOverImage:", v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(Image);
    CGContextRelease(v12);
    CGColorRelease(color);
    CGColorSpaceRelease(DeviceRGB);

  }
  else
  {
    v26 = v33;
  }

  return v26;
}

+ (id)overlayFeaturesQuadVertices:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  CGColor *SRGB;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGColor *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGImage *Image;
  void *v55;
  void *v56;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  CGColor *color;
  _BOOL4 v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v63 = a5;
  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v64 = a4;
  v58 = v6;
  objc_msgSend(v64, "extent");
  if (v6 && (v9 = v7, v10 = v8, objc_msgSend(v6, "count")))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v12 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(v9, 5uLL), DeviceRGB, 2u);
    SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.5);
    CGContextSetStrokeColorWithColor(v12, SRGB);
    color = SRGB;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v6;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v70;
      v59 = *(_QWORD *)v70;
      do
      {
        v16 = 0;
        v60 = v14;
        do
        {
          if (*(_QWORD *)v70 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v16), "textFeatureScaledToImage:", v64);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          CGContextSetStrokeColorWithColor(v12, color);
          CGContextSetLineWidth(v12, 7.0);
          objc_msgSend(v17, "topLeft");
          v19 = v18;
          objc_msgSend(v17, "topLeft");
          CGContextMoveToPoint(v12, v19, v20);
          objc_msgSend(v17, "topRight");
          v22 = v21;
          objc_msgSend(v17, "topRight");
          CGContextAddLineToPoint(v12, v22, v23);
          objc_msgSend(v17, "bottomRight");
          v25 = v24;
          objc_msgSend(v17, "bottomRight");
          CGContextAddLineToPoint(v12, v25, v26);
          objc_msgSend(v17, "bottomLeft");
          v28 = v27;
          objc_msgSend(v17, "bottomLeft");
          CGContextAddLineToPoint(v12, v28, v29);
          objc_msgSend(v17, "topLeft");
          v31 = v30;
          objc_msgSend(v17, "topLeft");
          CGContextAddLineToPoint(v12, v31, v32);
          CGContextStrokePath(v12);
          if (v63)
          {
            v33 = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.5);
            CGContextSetStrokeColorWithColor(v12, v33);
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            objc_msgSend(v17, "subFeatures");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v66;
              do
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v66 != v36)
                    objc_enumerationMutation(v34);
                  v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                  CGContextSetLineWidth(v12, 1.0);
                  objc_msgSend(v38, "topLeft");
                  v40 = v39;
                  objc_msgSend(v38, "topLeft");
                  CGContextMoveToPoint(v12, v40, v41);
                  objc_msgSend(v38, "topRight");
                  v43 = v42;
                  objc_msgSend(v38, "topRight");
                  CGContextAddLineToPoint(v12, v43, v44);
                  objc_msgSend(v38, "bottomRight");
                  v46 = v45;
                  objc_msgSend(v38, "bottomRight");
                  CGContextAddLineToPoint(v12, v46, v47);
                  objc_msgSend(v38, "bottomLeft");
                  v49 = v48;
                  objc_msgSend(v38, "bottomLeft");
                  CGContextAddLineToPoint(v12, v49, v50);
                  objc_msgSend(v38, "topLeft");
                  v52 = v51;
                  objc_msgSend(v38, "topLeft");
                  CGContextAddLineToPoint(v12, v52, v53);
                  CGContextStrokePath(v12);
                }
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
              }
              while (v35);
            }

            v15 = v59;
            v14 = v60;
            CGColorRelease(v33);
          }

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v14);
    }

    Image = CGBitmapContextCreateImage(v12);
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", Image);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "imageByCompositingOverImage:", v64);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(Image);
    CGContextRelease(v12);
    CGColorRelease(color);
    CGColorSpaceRelease(DeviceRGB);

  }
  else
  {
    v56 = v64;
  }

  return v56;
}

+ (id)overlayFeaturesPolygonVertices:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGContext *v11;
  CGColor *SRGB;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  unint64_t j;
  void *v28;
  double v29;
  CGFloat v30;
  CGColor *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  unint64_t m;
  void *v49;
  double v50;
  CGFloat v51;
  CGImage *Image;
  void *v53;
  void *v54;
  CGColorSpace *space;
  id v57;
  void *v58;
  CGColor *color;
  id obj;
  CGColor *v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL4 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v64 = a5;
  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57 = a4;
  v58 = v6;
  objc_msgSend(v57, "extent");
  if (v6 && (v9 = v7, v10 = v8, objc_msgSend(v6, "count")))
  {
    space = CGColorSpaceCreateDeviceRGB();
    v11 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(v9, 5uLL), space, 2u);
    SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.5);
    CGContextSetStrokeColorWithColor(v11, SRGB);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v6;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    color = SRGB;
    if (v13)
    {
      v62 = *(_QWORD *)v70;
      do
      {
        v63 = v13;
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v70 != v62)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v15, "polygon");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v15, "polygon");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (unint64_t)objc_msgSend(v17, "pointCount") > 3;

            if (v18)
            {
              objc_msgSend(v15, "polygon");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "denormalizedPolyline");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "pointValues");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              CGContextSetStrokeColorWithColor(v11, color);
              CGContextSetLineWidth(v11, 7.0);
              objc_msgSend(v21, "objectAtIndex:", 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "pointValue");
              v24 = v23;
              v26 = v10 - v25;
              CGContextMoveToPoint(v11, v23, v10 - v25);
              for (j = 1; objc_msgSend(v21, "count") > j; ++j)
              {
                objc_msgSend(v21, "objectAtIndex:", j);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v28, "pointValue");
                CGContextAddLineToPoint(v11, v30, v10 - v29);
                v22 = v28;
              }
              CGContextAddLineToPoint(v11, v24, v26);
              CGContextStrokePath(v11);

            }
          }
          if (v64)
          {
            v31 = CGColorCreateSRGB(0.0, 1.0, 0.0, 0.5);
            CGContextSetStrokeColorWithColor(v11, v31);
            v61 = v31;
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            objc_msgSend(v15, "subFeatures");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v66;
              do
              {
                for (k = 0; k != v33; ++k)
                {
                  if (*(_QWORD *)v66 != v34)
                    objc_enumerationMutation(v32);
                  v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
                  objc_msgSend(v36, "polygon");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {
                    objc_msgSend(v36, "polygon");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = (unint64_t)objc_msgSend(v38, "pointCount") > 3;

                    if (v39)
                    {
                      objc_msgSend(v36, "polygon");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "denormalizedPolyline");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "pointValues");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      CGContextSetLineWidth(v11, 7.0);
                      objc_msgSend(v42, "objectAtIndex:", 0);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "pointValue");
                      v45 = v44;
                      v47 = v10 - v46;
                      CGContextMoveToPoint(v11, v44, v10 - v46);
                      for (m = 1; objc_msgSend(v42, "count") > m; ++m)
                      {
                        objc_msgSend(v42, "objectAtIndex:", m);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v49, "pointValue");
                        CGContextAddLineToPoint(v11, v51, v10 - v50);
                        v43 = v49;
                      }
                      CGContextAddLineToPoint(v11, v45, v47);
                      CGContextStrokePath(v11);

                    }
                  }
                }
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
              }
              while (v33);
            }

            CGColorRelease(v61);
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v13);
    }

    Image = CGBitmapContextCreateImage(v11);
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", Image);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "imageByCompositingOverImage:", v57);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(Image);
    CGContextRelease(v11);
    CGColorRelease(color);
    CGColorSpaceRelease(space);

  }
  else
  {
    v54 = v57;
  }

  return v54;
}

+ (id)sortedTextFeaturesByAspectRatio:(id)a3 imageSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  _QWORD v9[6];

  height = a4.height;
  width = a4.width;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CRTextFeature_sortedTextFeaturesByAspectRatio_imageSize___block_invoke;
  v9[3] = &__block_descriptor_48_e41_q24__0__CRTextFeature_8__CRTextFeature_16l;
  *(CGFloat *)&v9[4] = width;
  *(CGFloat *)&v9[5] = height;
  objc_msgSend(v6, "sortUsingComparator:", v9);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__CRTextFeature_sortedTextFeaturesByAspectRatio_imageSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "aspectRatioWithImageSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  v8 = v7;
  objc_msgSend(v6, "aspectRatioWithImageSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  if (v8 > v9)
    v10 = 1;
  else
    v10 = -1;

  return v10;
}

- (void)scale:(CGPoint)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  CGFloat v6;
  float64x2_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  CGPoint v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a4.y;
  x = a4.x;
  a4.x = a3.y;
  a4.y = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = y + self->_bounds.origin.y * a3.y;
  self->_bounds.origin.x = x + self->_bounds.origin.x * a3.x;
  self->_bounds.origin.y = v6;
  v7.f64[0] = a3.x;
  v7.f64[1] = a4.x;
  self->_bounds.size = (CGSize)vmulq_f64(v7, (float64x2_t)self->_bounds.size);
  v7.f64[0] = y + self->_topLeft.y * a4.x;
  self->_topLeft.x = x + self->_topLeft.x * a3.x;
  self->_topLeft.y = v7.f64[0];
  v7.f64[0] = y + self->_topRight.y * a4.x;
  self->_topRight.x = x + self->_topRight.x * a3.x;
  self->_topRight.y = v7.f64[0];
  v7.f64[0] = y + self->_bottomRight.y * a4.x;
  self->_bottomRight.x = x + self->_bottomRight.x * a3.x;
  self->_bottomRight.y = v7.f64[0];
  v7.f64[0] = y + self->_bottomLeft.y * a4.x;
  self->_bottomLeft.x = x + self->_bottomLeft.x * a3.x;
  self->_bottomLeft.y = v7.f64[0];
  v12 = *(__int128 *)&a4.y;
  v13 = a4;
  self->_toplineOrigin.x = x + self->_toplineOrigin.x * a3.x;
  self->_baselineOrigin.y = y + self->_baselineOrigin.y * a4.x;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_subFeatures;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "scale:offset:", *(double *)&v12, v13.x, x, y, v12, v13, (_QWORD)v14);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)setBaselineOrigin:(CGPoint)a3 toplineOrigin:(CGPoint)a4 slope:(float)a5
{
  if (!self || !self->_contextSet)
  {
    self->_baselineOrigin = a3;
    self->_toplineOrigin = a4;
    self->_baselineAngle = a5;
    self->_contextSet = 1;
  }
}

uint64_t __39__CRTextFeature_estimateTopAndBaseline__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "bounds");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  if (v6 <= v7)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (void)updateSizeHints
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
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
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  float baselineAngle;
  float v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
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
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  -[CRTextFeature subFeatures](self, "subFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (self)
    {
      if (!self->_contextSet)
      {
        -[CRTextFeature subFeatures](self, "subFeatures");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "count");

        if ((int)v6 > 1)
        {
          -[CRTextFeature subFeatures](self, "subFeatures");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_80);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v6 & 1) != 0)
          {
            objc_msgSend(v23, "objectAtIndex:", v6 >> 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "bounds");
            v30 = v31;
          }
          else
          {
            v24 = v6 >> 1;
            objc_msgSend(v23, "objectAtIndex:", v6 >> 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "bounds");
            v27 = v26;
            objc_msgSend(v23, "objectAtIndex:", v24 - 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "bounds");
            v30 = (v27 + v29) * 0.5;

          }
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          -[CRTextFeature subFeatures](self, "subFeatures");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v110;
            v20 = -1.0;
            v103 = 0.0;
            v101 = 0.0;
            v19 = -1.0;
            v18 = -1.0;
            v21 = -1.0;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v110 != v34)
                  objc_enumerationMutation(v32);
                v36 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
                objc_msgSend(v36, "bounds");
                v38 = v37;
                objc_msgSend(v36, "bounds");
                v40 = v39;
                objc_msgSend(v36, "bounds");
                v42 = v41;
                objc_msgSend(v36, "bounds");
                v44 = v38 + v40 * 0.5;
                v45 = vabdd_f64(v42, v30);
                if (v43 >= v30)
                  v46 = v43;
                else
                  v46 = v30;
                if (v45 < v46 * 0.1 && v21 < 0.0)
                {
                  objc_msgSend(v36, "bounds");
                  v18 = v47;
                  v21 = v44;
                }
                objc_msgSend(v36, "bounds");
                v49 = v48;
                objc_msgSend(v36, "bounds");
                v51 = vabdd_f64(v49, v30);
                if (v50 >= v30)
                  v52 = v50;
                else
                  v52 = v30;
                if (v51 < v52 * 0.3)
                {
                  objc_msgSend(v36, "bounds");
                  v54 = v53;
                  objc_msgSend(v36, "bounds");
                  if (v19 < 0.0)
                  {
                    v20 = v54 + v55;
                    v19 = v44;
                  }
                  v101 = v101 + (v44 - v19) * (v54 + v55 - v20);
                  v103 = v103 + (v44 - v19) * (v44 - v19);
                }
              }
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
            }
            while (v33);

            if (v103 <= 0.0)
              v56 = NAN;
            else
              v56 = v101 / v103;
          }
          else
          {

            v21 = -1.0;
            v56 = NAN;
            v18 = -1.0;
            v19 = -1.0;
            v20 = -1.0;
          }
          self->_baselineAngle = v56;

        }
        else
        {
          self->_baselineAngle = NAN;
          -[CRTextFeature subFeatures](self, "subFeatures");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "firstObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "bounds");
          v10 = v9;
          objc_msgSend(v8, "bounds");
          v12 = v11;
          objc_msgSend(v8, "bounds");
          v14 = v13;
          objc_msgSend(v8, "bounds");
          v16 = v15;
          objc_msgSend(v8, "bounds");
          v18 = v17;
          v19 = v10 + v12 * 0.5;
          v20 = v14 + v16;

          v21 = v19;
        }
        self->_baselineOrigin.x = v19;
        self->_baselineOrigin.y = v20;
        self->_toplineOrigin.x = v21;
        self->_toplineOrigin.y = v18;
        self->_contextSet = 1;
      }
      baselineAngle = self->_baselineAngle;
      v58 = sqrtf((float)(baselineAngle * baselineAngle) + 1.0);
      v104 = (float)(1.0 / v58);
      v59 = (float)(baselineAngle / v58);
    }
    else
    {
      v59 = 0.0;
      v104 = 0.0;
    }
    -[CRTextFeature toplineOrigin](self, "toplineOrigin");
    v61 = v60;
    -[CRTextFeature baselineOrigin](self, "baselineOrigin");
    v63 = v62;
    -[CRTextFeature toplineOrigin](self, "toplineOrigin");
    v65 = v64;
    -[CRTextFeature baselineOrigin](self, "baselineOrigin");
    v67 = v66;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    if (v69)
    {
      v102 = -v59;
      v70 = fabs(v104 * (v65 - v67) - (v61 - v63) * v59);
      v96 = v70 * 0.3;
      v71 = *(_QWORD *)v106;
      v97 = v70 + v70 * 0.2;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v106 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
          objc_msgSend(v73, "setSizeHint:", 0);
          objc_msgSend(v73, "topLeft");
          v100 = v74;
          -[CRTextFeature baselineOrigin](self, "baselineOrigin");
          v99 = v75;
          objc_msgSend(v73, "topLeft");
          v77 = v76;
          -[CRTextFeature baselineOrigin](self, "baselineOrigin");
          v79 = v78;
          objc_msgSend(v73, "bottomLeft");
          v98 = v80;
          -[CRTextFeature baselineOrigin](self, "baselineOrigin");
          v82 = v81;
          objc_msgSend(v73, "bottomLeft");
          v84 = v83;
          -[CRTextFeature baselineOrigin](self, "baselineOrigin");
          v86 = v85;
          objc_msgSend(v73, "bottomLeft");
          v88 = v87;
          objc_msgSend(v73, "topLeft");
          v90 = v89;
          objc_msgSend(v73, "bottomLeft");
          v92 = v91;
          objc_msgSend(v73, "topLeft");
          v93 = -(v104 * (v77 - v79) + (v100 - v99) * v102);
          v95 = v104 * (v92 - v94) + (v88 - v90) * v102;
          if (v95 < v93)
            v93 = v95;
          if (v93 > v97)
            objc_msgSend(v73, "setSizeHint:", objc_msgSend(v73, "sizeHint") | 2);
          if (v104 * (v84 - v86) + (v98 - v82) * v102 > v96)
            objc_msgSend(v73, "setSizeHint:", objc_msgSend(v73, "sizeHint") | 1);
        }
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
      }
      while (v69);
    }

  }
}

- (BOOL)isUp
{
  return (-[CRTextFeature sizeHint](self, "sizeHint") >> 1) & 1;
}

- (BOOL)isDown
{
  return -[CRTextFeature sizeHint](self, "sizeHint") & 1;
}

- (id)createCharacterSubFeaturesForCandidateAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  CRTextFeature *v18;
  id v19;

  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return MEMORY[0x1E0C9AA60];
  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v8, "length");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __63__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex___block_invoke;
  v17 = &unk_1E98DB800;
  v18 = self;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, &v14);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11, v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __63__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CRTextFeature *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", CFSTR(" ")) & 1) == 0)
  {
    v4 = objc_alloc_init(CRTextFeature);
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setStringValueCandidates:](v4, "setStringValueCandidates:", v5);

    -[CRTextFeature setCandidateProbs:](v4, "setCandidateProbs:", &unk_1E993F8F0);
    -[CRTextFeature setStringValue:](v4, "setStringValue:", v3);
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    -[CRTextFeature setBounds:](v4, "setBounds:");
    objc_msgSend(*(id *)(a1 + 32), "topLeft");
    -[CRTextFeature setTopLeft:](v4, "setTopLeft:");
    objc_msgSend(*(id *)(a1 + 32), "topRight");
    -[CRTextFeature setTopRight:](v4, "setTopRight:");
    objc_msgSend(*(id *)(a1 + 32), "bottomRight");
    -[CRTextFeature setBottomRight:](v4, "setBottomRight:");
    objc_msgSend(*(id *)(a1 + 32), "bottomLeft");
    -[CRTextFeature setBottomLeft:](v4, "setBottomLeft:");
    objc_msgSend(*(id *)(a1 + 32), "selectedLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature setSelectedLocale:](v4, "setSelectedLocale:", v6);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

- (id)createCharacterSubFeaturesForCandidateAtIndex:(int64_t)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 falsePositiveFiltering:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  id v33;
  CRTextFeature *v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  _QWORD v40[4];
  _QWORD v41[5];
  id v42;

  v10 = a4;
  v11 = a5;
  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 <= a3)
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

    v17 = characterCount(v16);
    if (v10 && v11 && (v18 = v17, objc_msgSend(v10, "count")) && objc_msgSend(v11, "count"))
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = 0;
      objc_msgSend(MEMORY[0x1E0CB3500], "_crUnknownScriptCharacterSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[NSString length](v16, "length");
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2;
      v30 = &unk_1E98DB828;
      v31 = v10;
      v37 = 2 * v18 - 2;
      v32 = v11;
      v39 = a6;
      v21 = v19;
      v33 = v21;
      v34 = self;
      v36 = v40;
      v38 = v18;
      v22 = v14;
      v35 = v22;
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 2, &v27);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v22, v27, v28, v29, v30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v40, 8);
    }
    else
    {
      v24 = -[NSString length](v16, "length");
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke;
      v41[3] = &unk_1E98DB800;
      v41[4] = self;
      v25 = v14;
      v42 = v25;
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 2, v41);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v23;
}

void __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CRTextFeature *v4;
  double v5;
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
  double v17;
  double v18;
  CRTextFeature *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [CRTextFeature alloc];
  objc_msgSend(*(id *)(a1 + 32), "topLeft");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "topRight");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "bottomLeft");
  v14 = v13;
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "bottomRight");
  v19 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v4, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v6, v8, v10, v12, v14, v16, v17, v18);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  -[CRTextFeature setBounds:](v19, "setBounds:");
  -[CRTextFeature setStringValue:](v19, "setStringValue:", v3);
  v26[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setStringValueCandidates:](v19, "setStringValueCandidates:", v20);

  objc_msgSend(*(id *)(a1 + 32), "confidence");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setConfidence:](v19, "setConfidence:", v21);

  objc_msgSend(*(id *)(a1 + 32), "confidence");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setCandidateProbs:](v19, "setCandidateProbs:", v23);

  objc_msgSend(*(id *)(a1 + 32), "baselineAngle");
  -[CRTextFeature setBaselineAngle:](v19, "setBaselineAngle:");
  -[CRTextFeature setType:](v19, "setType:", 4);
  objc_msgSend(*(id *)(a1 + 32), "selectedLocale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setSelectedLocale:](v19, "setSelectedLocale:", v24);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
}

void __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  CRTextFeature *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(a1 + 80)
    && objc_msgSend(*(id *)(a1 + 40), "count") == *(_QWORD *)(a1 + 80))
  {
    if (!*(_BYTE *)(a1 + 96)
      || objc_msgSend(v3, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 48)) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v4)
      {
        v5 = *(void **)(a1 + 32);
        v6 = 2 * v4 - 1;
        if (v4 == *(_QWORD *)(a1 + 88) - 1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pointValue");
          v9 = v8;
          v11 = v10;

          objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) - 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "pointValue");
          v14 = v13;
          v16 = v15;

          objc_msgSend(*(id *)(a1 + 56), "topRight");
          v18 = v17;
          v20 = v19;
          objc_msgSend(*(id *)(a1 + 56), "bottomRight");
          v22 = v21;
          v24 = v23;
LABEL_13:
          v46 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:]([CRTextFeature alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v9, v11, v18, v20, v14, v16, v22, v24);
          -[CRTextFeature setStringValue:](v46, "setStringValue:", v3);
          v52[0] = v3;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRTextFeature setStringValueCandidates:](v46, "setStringValueCandidates:", v47);

          objc_msgSend(*(id *)(a1 + 56), "confidence");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRTextFeature setConfidence:](v46, "setConfidence:", v48);

          objc_msgSend(*(id *)(a1 + 56), "confidence");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRTextFeature setCandidateProbs:](v46, "setCandidateProbs:", v50);

          objc_msgSend(*(id *)(a1 + 56), "baselineAngle");
          -[CRTextFeature setBaselineAngle:](v46, "setBaselineAngle:");
          -[CRTextFeature setType:](v46, "setType:", 4);
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v46);

          goto LABEL_9;
        }
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "pointValue");
        v9 = v38;
        v11 = v39;

        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) - 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "pointValue");
        v14 = v41;
        v16 = v42;

        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "pointValue");
        v18 = v44;
        v20 = v45;

        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "pointValue");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "topLeft");
        v9 = v27;
        v11 = v28;
        objc_msgSend(*(id *)(a1 + 56), "bottomLeft");
        v14 = v29;
        v16 = v30;
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pointValue");
        v18 = v32;
        v20 = v33;

        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "pointValue");
      }
      v22 = v35;
      v24 = v36;

      goto LABEL_13;
    }
  }
  else
  {
    v25 = *(void **)(a1 + 64);
    v26 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    objc_msgSend(v25, "addObject:", v26);

  }
LABEL_9:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

}

- (CGSize)sizeForImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  double v42;
  double v43;
  double v44;
  double v45;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CRTextFeature polygon](self, "polygon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRTextFeature polygon](self, "polygon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "denormalizedPolyline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "estimatedLineSizeForPairedPointPolygon");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v14 = v13;
    v16 = v15;
    -[CRTextFeature topRight](self, "topRight");
    v19 = v14 == v18 && v16 == v17;
    if (v19
      || (-[CRTextFeature topLeft](self, "topLeft"),
          v21 = v20,
          v23 = v22,
          -[CRTextFeature bottomLeft](self, "bottomLeft"),
          v21 == v25)
      && v23 == v24)
    {
      -[CRTextFeature bounds](self, "bounds");
      v10 = v26;
      -[CRTextFeature bounds](self, "bounds");
      v12 = v27;
    }
    else
    {
      -[CRTextFeature topLeft](self, "topLeft");
      v29 = v28;
      -[CRTextFeature topRight](self, "topRight");
      v31 = width * (v29 - v30);
      -[CRTextFeature topLeft](self, "topLeft");
      v33 = v32;
      -[CRTextFeature topRight](self, "topRight");
      v35 = height * (v33 - v34);
      -[CRTextFeature bottomLeft](self, "bottomLeft");
      v37 = v36;
      -[CRTextFeature topLeft](self, "topLeft");
      v39 = width * (v37 - v38);
      -[CRTextFeature bottomLeft](self, "bottomLeft");
      v41 = v40;
      -[CRTextFeature topLeft](self, "topLeft");
      v43 = height * (v41 - v42);
      v10 = sqrt(v35 * v35 + v31 * v31);
      v12 = sqrt(v43 * v43 + v39 * v39);
    }
  }
  v44 = v10;
  v45 = v12;
  result.height = v45;
  result.width = v44;
  return result;
}

- (float)aspectRatioWithImageSize:(CGSize)a3
{
  double v3;
  double v4;
  float v5;
  float result;
  float v7;

  -[CRTextFeature sizeForImageSize:](self, "sizeForImageSize:", a3.width, a3.height);
  v5 = v4;
  result = 0.0;
  if (v5 != 0.0)
  {
    v7 = v3;
    result = v7 / v5;
    if (v5 <= 0.0)
      return 0.0;
  }
  return result;
}

- (void)setStringValueByReplacingCharactersInSet:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  NSString *stringValue;
  CRTextFeature *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  id obj;
  void *v40;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  stringValue = self->_stringValue;
  if (stringValue)
  {
    v9 = self;
    -[NSString componentsSeparatedByCharactersInSet:](stringValue, "componentsSeparatedByCharactersInSet:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v38);
    v12 = objc_claimAutoreleasedReturnValue();

    self = v9;
    v13 = v9->_stringValue;
    v9->_stringValue = (NSString *)v12;

  }
  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "_crUnknownScriptCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v37, "stringValueCandidates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v54 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v20, "rangeOfCharacterFromSet:", v16) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v40, "addObject:", v20);
          }
          else
          {
            objc_msgSend(v20, "componentsSeparatedByCharactersInSet:", v6);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "componentsJoinedByString:", v7);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v38);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "addObject:", v23);
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v17);
    }

    objc_msgSend(v37, "setStringValueCandidates:", v40);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v37, "subFeatures");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "setStringValueByReplacingCharactersInSet:withString:", v6, v7);
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v25);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v37, "subFeatureCandidates");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v46 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v42;
          do
          {
            for (m = 0; m != v34; ++m)
            {
              if (*(_QWORD *)v42 != v35)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * m), "setStringValueByReplacingCharactersInSet:withString:", v6, v7);
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
          }
          while (v34);
        }

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v29);
  }

}

- (void)adjustBoundsBasedOnSubfeaturesForImageSize:(CGSize)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double *v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
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
  double v50;
  double v51;
  double v52;
  double v53;
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
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
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
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double width;
  double height;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  _BYTE v155[128];
  uint64_t v156;
  float64x2x2_t v157;
  float64x2x2_t v158;

  width = a3.width;
  height = a3.height;
  v156 = *MEMORY[0x1E0C80C00];
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  -[CRTextFeature subFeatures](self, "subFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v135, v155, 16);
  v6 = width * 0.5;
  v7 = height * 0.5;
  if (v5)
  {
    v8 = *(_QWORD *)v136;
    v9 = 1.79769313e308;
    v10 = -1.79769313e308;
    v11 = -1.79769313e308;
    v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v136 != v8)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v14, "topLeft");
        v147 = v15;
        v148 = v16;
        objc_msgSend(v14, "topRight");
        v149 = v17;
        v150 = v18;
        objc_msgSend(v14, "bottomRight");
        v151 = v19;
        v152 = v20;
        objc_msgSend(v14, "bottomLeft");
        v21 = 0;
        v153 = v22;
        v154 = v23;
        do
        {
          v24 = (double *)((char *)&v147 + v21);
          v157 = vld2q_f64(v24);
          v158.val[0] = vmulq_n_f64(v157.val[0], width);
          v158.val[1] = vmulq_n_f64(v157.val[1], height);
          vst2q_f64(v24, v158);
          v21 += 32;
        }
        while (v21 != 64);
        -[CRTextFeature baselineAngle](self, "baselineAngle");
        rotatePolygon(&v147, &v139, v6, v7, v25);
        v26 = v139;
        if (v12 >= v139)
          v27 = v139;
        else
          v27 = v12;
        if (v27 >= v141)
          v28 = v141;
        else
          v28 = v27;
        if (v28 >= v143)
        {
          v12 = v145;
          if (v143 < v145)
            v12 = v143;
        }
        else if (v28 >= v145)
        {
          v12 = v145;
        }
        else
        {
          v12 = v28;
        }
        if (v11 > v139)
          v26 = v11;
        if (v26 <= v141)
          v26 = v141;
        if (v26 <= v143)
        {
          v11 = v145;
          if (v143 > v145)
            v11 = v143;
        }
        else if (v26 <= v145)
        {
          v11 = v145;
        }
        else
        {
          v11 = v26;
        }
        v29 = v140;
        if (v9 >= v140)
          v30 = v140;
        else
          v30 = v9;
        if (v30 >= v142)
          v31 = v142;
        else
          v31 = v30;
        if (v31 >= v144)
        {
          v9 = v146;
          if (v144 < v146)
            v9 = v144;
        }
        else if (v31 >= v146)
        {
          v9 = v146;
        }
        else
        {
          v9 = v31;
        }
        if (v10 > v140)
          v29 = v10;
        if (v29 <= v142)
          v29 = v142;
        if (v29 <= v144)
        {
          v10 = v146;
          if (v144 > v146)
            v10 = v144;
        }
        else
        {
          v10 = v146;
          if (v29 > v146)
            v10 = v29;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v135, v155, 16);
    }
    while (v5);
  }
  else
  {
    v9 = 1.79769313e308;
    v10 = -1.79769313e308;
    v11 = -1.79769313e308;
    v12 = 1.79769313e308;
  }

  v147 = v12;
  v148 = v9;
  v149 = v11;
  v150 = v9;
  v151 = v11;
  v152 = v10;
  v153 = v12;
  v154 = v10;
  -[CRTextFeature baselineAngle](self, "baselineAngle");
  rotatePolygon(&v147, &v139, v6, v7, (float)-v32);
  v33 = v139;
  v34 = v140;
  v35 = width == 0.0 || height == 0.0;
  if (!v35)
  {
    v33 = v139 / width;
    v34 = v140 / height;
  }
  -[CRTextFeature setTopLeft:](self, "setTopLeft:", v33, v34, height, width);
  v36 = v141;
  v37 = v142;
  if (!v35)
  {
    v36 = v141 / width;
    v37 = v142 / height;
  }
  -[CRTextFeature setTopRight:](self, "setTopRight:", v36, v37);
  v38 = v143;
  v39 = v144;
  if (!v35)
  {
    v38 = v143 / width;
    v39 = v144 / height;
  }
  -[CRTextFeature setBottomRight:](self, "setBottomRight:", v38, v39);
  v40 = v145;
  v41 = v146;
  if (!v35)
  {
    v40 = v145 / width;
    v41 = v146 / height;
  }
  -[CRTextFeature setBottomLeft:](self, "setBottomLeft:", v40, v41);
  -[CRTextFeature topLeft](self, "topLeft");
  v43 = v42;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  if (v43 >= v44)
    -[CRTextFeature bottomLeft](self, "bottomLeft");
  else
    -[CRTextFeature topLeft](self, "topLeft");
  v46 = v45;
  -[CRTextFeature topRight](self, "topRight");
  if (v46 >= v47)
  {
    -[CRTextFeature topRight](self, "topRight");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v49 = v48;
    -[CRTextFeature bottomLeft](self, "bottomLeft");
    if (v49 >= v50)
      -[CRTextFeature bottomLeft](self, "bottomLeft");
    else
      -[CRTextFeature topLeft](self, "topLeft");
  }
  v52 = v51;
  -[CRTextFeature bottomRight](self, "bottomRight");
  if (v52 >= v53)
  {
    -[CRTextFeature bottomRight](self, "bottomRight");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v55 = v54;
    -[CRTextFeature bottomLeft](self, "bottomLeft");
    if (v55 >= v56)
      -[CRTextFeature bottomLeft](self, "bottomLeft");
    else
      -[CRTextFeature topLeft](self, "topLeft");
    v59 = v57;
    -[CRTextFeature topRight](self, "topRight");
    if (v59 >= v60)
    {
      -[CRTextFeature topRight](self, "topRight");
    }
    else
    {
      -[CRTextFeature topLeft](self, "topLeft");
      v62 = v61;
      -[CRTextFeature bottomLeft](self, "bottomLeft");
      if (v62 >= v63)
        -[CRTextFeature bottomLeft](self, "bottomLeft");
      else
        -[CRTextFeature topLeft](self, "topLeft");
    }
  }
  v64 = v58;
  -[CRTextFeature topLeft](self, "topLeft");
  v66 = v65;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  if (v66 <= v67)
    -[CRTextFeature bottomLeft](self, "bottomLeft");
  else
    -[CRTextFeature topLeft](self, "topLeft");
  v69 = v68;
  -[CRTextFeature topRight](self, "topRight");
  if (v69 <= v70)
  {
    -[CRTextFeature topRight](self, "topRight");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v72 = v71;
    -[CRTextFeature bottomLeft](self, "bottomLeft");
    if (v72 <= v73)
      -[CRTextFeature bottomLeft](self, "bottomLeft");
    else
      -[CRTextFeature topLeft](self, "topLeft");
  }
  v75 = v74;
  -[CRTextFeature bottomRight](self, "bottomRight");
  if (v75 <= v76)
  {
    -[CRTextFeature bottomRight](self, "bottomRight");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v78 = v77;
    -[CRTextFeature bottomLeft](self, "bottomLeft");
    if (v78 <= v79)
      -[CRTextFeature bottomLeft](self, "bottomLeft");
    else
      -[CRTextFeature topLeft](self, "topLeft");
    v82 = v80;
    -[CRTextFeature topRight](self, "topRight");
    if (v82 <= v83)
    {
      -[CRTextFeature topRight](self, "topRight");
    }
    else
    {
      -[CRTextFeature topLeft](self, "topLeft");
      v85 = v84;
      -[CRTextFeature bottomLeft](self, "bottomLeft");
      if (v85 <= v86)
        -[CRTextFeature bottomLeft](self, "bottomLeft");
      else
        -[CRTextFeature topLeft](self, "topLeft");
    }
  }
  v87 = v81;
  -[CRTextFeature topLeft](self, "topLeft");
  v89 = v88;
  -[CRTextFeature topRight](self, "topRight");
  if (v89 >= v90)
    -[CRTextFeature topRight](self, "topRight");
  else
    -[CRTextFeature topLeft](self, "topLeft");
  v92 = v91;
  -[CRTextFeature bottomRight](self, "bottomRight");
  if (v92 >= v93)
  {
    -[CRTextFeature bottomRight](self, "bottomRight");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v95 = v94;
    -[CRTextFeature topRight](self, "topRight");
    if (v95 >= v96)
      -[CRTextFeature topRight](self, "topRight");
    else
      -[CRTextFeature topLeft](self, "topLeft");
  }
  v98 = v97;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  if (v98 >= v99)
  {
    -[CRTextFeature bottomLeft](self, "bottomLeft");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v101 = v100;
    -[CRTextFeature topRight](self, "topRight");
    if (v101 >= v102)
      -[CRTextFeature topRight](self, "topRight");
    else
      -[CRTextFeature topLeft](self, "topLeft");
    v105 = v103;
    -[CRTextFeature bottomRight](self, "bottomRight");
    if (v105 >= v106)
    {
      -[CRTextFeature bottomRight](self, "bottomRight");
    }
    else
    {
      -[CRTextFeature topLeft](self, "topLeft");
      v108 = v107;
      -[CRTextFeature topRight](self, "topRight");
      if (v108 >= v109)
        -[CRTextFeature topRight](self, "topRight");
      else
        -[CRTextFeature topLeft](self, "topLeft");
    }
  }
  v110 = v104;
  -[CRTextFeature topLeft](self, "topLeft");
  v112 = v111;
  -[CRTextFeature topRight](self, "topRight");
  if (v112 <= v113)
    -[CRTextFeature topRight](self, "topRight");
  else
    -[CRTextFeature topLeft](self, "topLeft");
  v115 = v114;
  -[CRTextFeature bottomRight](self, "bottomRight");
  if (v115 <= v116)
  {
    -[CRTextFeature bottomRight](self, "bottomRight");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v118 = v117;
    -[CRTextFeature topRight](self, "topRight");
    if (v118 <= v119)
      -[CRTextFeature topRight](self, "topRight");
    else
      -[CRTextFeature topLeft](self, "topLeft");
  }
  v121 = v120;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  if (v121 <= v122)
  {
    -[CRTextFeature bottomLeft](self, "bottomLeft");
  }
  else
  {
    -[CRTextFeature topLeft](self, "topLeft");
    v124 = v123;
    -[CRTextFeature topRight](self, "topRight");
    if (v124 <= v125)
      -[CRTextFeature topRight](self, "topRight");
    else
      -[CRTextFeature topLeft](self, "topLeft");
    v128 = v126;
    -[CRTextFeature bottomRight](self, "bottomRight");
    if (v128 <= v129)
    {
      -[CRTextFeature bottomRight](self, "bottomRight");
    }
    else
    {
      -[CRTextFeature topLeft](self, "topLeft");
      v131 = v130;
      -[CRTextFeature topRight](self, "topRight");
      if (v131 <= v132)
        -[CRTextFeature topRight](self, "topRight");
      else
        -[CRTextFeature topLeft](self, "topLeft");
    }
  }
  -[CRTextFeature setBounds:](self, "setBounds:", v64, v110, v87 - v64, v127 - v110);
}

- (void)flipHorizontally
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[CRTextFeature topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[CRTextFeature topRight](self, "topRight");
  v8 = v7;
  v10 = v9;
  -[CRTextFeature bottomRight](self, "bottomRight");
  -[CRTextFeature setTopLeft:](self, "setTopLeft:");
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  -[CRTextFeature setTopRight:](self, "setTopRight:");
  -[CRTextFeature setBottomLeft:](self, "setBottomLeft:", v8, v10);
  -[CRTextFeature setBottomRight:](self, "setBottomRight:", v4, v6);
  -[CRTextFeature baselineAngle](self, "baselineAngle");
  v12 = v11 + 3.14159265;
  if (v12 <= 3.14159265)
  {
    if (v12 > -3.14159265)
      goto LABEL_6;
    v13 = 6.28318531;
  }
  else
  {
    v13 = -6.28318531;
  }
  v12 = v12 + v13;
LABEL_6:
  *(float *)&v12 = v12;
  -[CRTextFeature setBaselineAngle:](self, "setBaselineAngle:", v12);
  v14 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CRTextFeature subFeatures](self, "subFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((objc_msgSend(v14, "containsObject:", v19) & 1) == 0)
        {
          objc_msgSend(v19, "flipHorizontally");
          objc_msgSend(v14, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v16);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[CRTextFeature subFeatureCandidates](self, "subFeatureCandidates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v31;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v31 != v27)
                objc_enumerationMutation(v25);
              v29 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
              if ((objc_msgSend(v14, "containsObject:", v29) & 1) == 0)
              {
                objc_msgSend(v29, "flipHorizontally");
                objc_msgSend(v14, "addObject:", v29);
              }
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v26);
        }

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v21);
  }

}

- (id)createSubFeaturesFromStringsForCandidateAtIndex:(int64_t)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 hasBoundarySpacePoints:(BOOL)a6 hasCharacterAndWordBoundaries:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  _BOOL4 v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  _BOOL4 v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  int v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  int v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  CRTextFeature *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  id obj;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  void *v140;
  id v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  void *v147;
  void *v148;
  _BYTE v149[128];
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  _QWORD v155[3];

  v7 = a7;
  v8 = a6;
  v155[1] = *MEMORY[0x1E0C80C00];
  v142 = a4;
  v141 = a5;
  -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 > a3)
  {
    if (v8)
    {
      objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pointValue");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v142, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pointValue");
      v139 = 0;
      if (v16 == v21 && v18 == v20)
      {
        objc_msgSend(v141, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pointValue");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v141, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pointValue");
        v29 = v24 == v28;
        if (v26 != v30)
          v29 = 0;
        v139 = v29;

      }
      objc_msgSend(v142, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pointValue");
      v33 = v32;
      v35 = v34;
      objc_msgSend(v142, "objectAtIndexedSubscript:", objc_msgSend(v142, "count") - 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pointValue");
      v133 = 0;
      if (v33 == v38 && v35 == v37)
      {
        objc_msgSend(v141, "lastObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "pointValue");
        v41 = v40;
        v43 = v42;
        objc_msgSend(v141, "objectAtIndexedSubscript:", objc_msgSend(v141, "count") - 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "pointValue");
        v46 = v41 == v45;
        if (v43 != v47)
          v46 = 0;
        v133 = v46;

      }
      if (objc_msgSend(v142, "count") == 4)
      {
        if ((v139 & v133) != 1)
          goto LABEL_26;
        goto LABEL_24;
      }
      if (objc_msgSend(v141, "count") == 4 && ((v139 ^ 1) & 1) == 0 && ((v133 ^ 1) & 1) == 0)
      {
LABEL_24:
        v140 = (void *)-[CRTextFeature copy](self, "copy");
        -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndexedSubscript:", a3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setStringValueCandidates:", v58);

        -[CRTextFeature candidateProbs](self, "candidateProbs");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", a3);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setCandidateProbs:", v61);

        v150 = v140;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
        v55 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    else
    {
      if (!objc_msgSend(v142, "count") || !objc_msgSend(v141, "count"))
      {
        v140 = (void *)-[CRTextFeature copy](self, "copy");
        -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", a3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v155[0] = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setStringValueCandidates:", v51);

        -[CRTextFeature candidateProbs](self, "candidateProbs");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectAtIndexedSubscript:", a3);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setCandidateProbs:", v54);

        v153 = v140;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
        v55 = objc_claimAutoreleasedReturnValue();
LABEL_25:
        v48 = (void *)v55;
LABEL_64:

        goto LABEL_65;
      }
      v133 = 1;
      v139 = 1;
    }
LABEL_26:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectAtIndexedSubscript:", a3);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "componentsSeparatedByCharactersInSet:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v128 = v65;
    v66 = (void *)objc_msgSend(v65, "mutableCopy");
    objc_msgSend(v66, "removeObject:", &stru_1E98DC948);
    v67 = objc_msgSend(v66, "count");
    if (v8)
      v68 = 2;
    else
      v68 = -2;
    v69 = v68 + 2 * v67;
    if (objc_msgSend(v142, "count") == v69 && objc_msgSend(v141, "count") == v69)
    {
      v127 = v66;
      if (v8)
        v70 = objc_msgSend(v66, "count");
      else
        v70 = objc_msgSend(v66, "count") - 1;
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      obj = v66;
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v149, 16);
      if (v72)
      {
        v73 = v8;
        v74 = 3;
        if (v7)
          v74 = 4;
        v136 = v74;
        v132 = 2 * v70 - 1;
        v75 = 2;
        if (!v8)
          v75 = 0;
        v137 = v75;
        v138 = *(_QWORD *)v144;
        v130 = -v70;
        v129 = -(uint64_t)v8;
        do
        {
          v76 = 0;
          v77 = 2 * v73;
          v134 = v130 + v73;
          v131 = v73;
          v78 = v129 + v73;
          do
          {
            if (*(_QWORD *)v144 != v138)
              objc_enumerationMutation(obj);
            v79 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v76);
            if (v78 + v76)
              v80 = 0;
            else
              v80 = v139;
            if (v80 == 1)
            {
              -[CRTextFeature topLeft](self, "topLeft");
              v82 = v81;
              v84 = v83;
              -[CRTextFeature bottomLeft](self, "bottomLeft");
              v86 = v85;
              v88 = v87;
              objc_msgSend(v142, "objectAtIndexedSubscript:", v137);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "pointValue");
              v91 = v90;
              v93 = v92;

              objc_msgSend(v141, "objectAtIndexedSubscript:", v137);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "pointValue");
            }
            else
            {
              if (v134 + v76)
                v97 = 0;
              else
                v97 = v133;
              if (v97 == 1)
              {
                objc_msgSend(v142, "objectAtIndexedSubscript:", v132);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "pointValue");
                v82 = v99;
                v84 = v100;

                objc_msgSend(v141, "objectAtIndexedSubscript:", v132);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "pointValue");
                v86 = v102;
                v88 = v103;

                -[CRTextFeature topRight](self, "topRight");
                v91 = v104;
                v93 = v105;
                -[CRTextFeature bottomRight](self, "bottomRight");
                v107 = v106;
                v109 = v108;
                goto LABEL_56;
              }
              objc_msgSend(v142, "objectAtIndexedSubscript:", v77 - 1);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "pointValue");
              v82 = v111;
              v84 = v112;

              objc_msgSend(v141, "objectAtIndexedSubscript:", v77 - 1);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "pointValue");
              v86 = v114;
              v88 = v115;

              objc_msgSend(v142, "objectAtIndexedSubscript:", v77);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "pointValue");
              v91 = v117;
              v93 = v118;

              objc_msgSend(v141, "objectAtIndexedSubscript:", v77);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "pointValue");
            }
            v107 = v95;
            v109 = v96;

LABEL_56:
            v119 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:]([CRTextFeature alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v82, v84, v91, v93, v86, v88, v107, v109);
            if (v7)
            {
              objc_msgSend(v79, "combinedTokenSequenceString");
              v70 = objc_claimAutoreleasedReturnValue();
              v79 = (void *)v70;
            }
            -[CRTextFeature setStringValue:](v119, "setStringValue:", v79, v127);
            if (v7)

            -[CRTextFeature stringValue](v119, "stringValue");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v148 = v120;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 1);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRTextFeature setStringValueCandidates:](v119, "setStringValueCandidates:", v121);

            -[CRTextFeature confidence](self, "confidence");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRTextFeature setConfidence:](v119, "setConfidence:", v122);

            -[CRTextFeature confidence](self, "confidence");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = v123;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRTextFeature setCandidateProbs:](v119, "setCandidateProbs:", v124);

            -[CRTextFeature baselineAngle](self, "baselineAngle");
            -[CRTextFeature setBaselineAngle:](v119, "setBaselineAngle:");
            -[CRTextFeature selectedLocale](self, "selectedLocale");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRTextFeature setSelectedLocale:](v119, "setSelectedLocale:", v125);

            -[CRTextFeature setType:](v119, "setType:", v136);
            objc_msgSend(v140, "addObject:", v119);

            ++v76;
            v77 += 2;
          }
          while (v72 != v76);
          v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v149, 16);
          v73 = v131 + v76;
        }
        while (v72);
      }

      v66 = v127;
    }
    else
    {
      v71 = (void *)-[CRTextFeature copy](self, "copy");
      objc_msgSend(v140, "addObject:", v71);

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v140, v127);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_64;
  }
  v48 = (void *)MEMORY[0x1E0C9AA60];
LABEL_65:

  return v48;
}

- (float)calculateTextBoxHeightForImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float result;

  -[CRTextFeature topLeft](self, "topLeft");
  v8 = v7;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  v10 = (v8 - v9) * (double)a3;
  -[CRTextFeature topLeft](self, "topLeft");
  v12 = v11;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  v14 = (v12 - v13) * (double)a4;
  -[CRTextFeature topRight](self, "topRight");
  v16 = v15;
  -[CRTextFeature bottomRight](self, "bottomRight");
  v18 = (v16 - v17) * (double)a3;
  -[CRTextFeature topRight](self, "topRight");
  v20 = v19;
  -[CRTextFeature bottomRight](self, "bottomRight");
  v22 = (v20 - v21) * (double)a4;
  v23 = sqrtf((float)(v14 * v14) + (float)(v10 * v10));
  result = sqrtf((float)(v22 * v22) + (float)(v18 * v18));
  if (v23 > result)
    return v23;
  return result;
}

- (void)setSelectedLocale:(id)a3 includeSubfeatures:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CRTextFeature setSelectedLocale:](self, "setSelectedLocale:", v6);
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setSelectedLocale:includeSubfeatures:", v6, 1);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setSelectedScriptCategory:(id)a3 includeSubfeatures:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CRTextFeature setSelectedScriptCategory:](self, "setSelectedScriptCategory:", v6);
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CRTextFeature subFeatures](self, "subFeatures", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setSelectedScriptCategory:includeSubfeatures:", v6, 1);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)appendTextFeature:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t i;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t j;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  void *v55;
  float v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t k;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  float v70;
  float v71;
  void *v72;
  void *v73;
  float v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t m;
  void *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  unint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  float v95;
  float v96;
  float v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CRNormalizedQuad *v103;
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
  CRNormalizedQuad *v118;
  CRNormalizedQuad *v119;
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
  double v132;
  double v133;
  CRNormalizedQuad *v134;
  void *v135;
  void *v136;
  id v137;

  height = a4.height;
  width = a4.width;
  v137 = a3;
  -[CRTextFeature stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  -[CRTextFeature stringValue](self, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  objc_msgSend(v137, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CRTextFeature confidence](self, "confidence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;
  objc_msgSend(v137, "confidence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v18 = (float)v8 / (float)(unint64_t)(v12 + v10);
  *(float *)&v20 = (float)((float)(1.0 - v18) * v19) + (float)(v16 * v18);
  objc_msgSend(v13, "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setConfidence:](self, "setConfidence:", v21);

  -[CRTextFeature subFeatures](self, "subFeatures");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "subFeatures");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setSubFeatures:](self, "setSubFeatures:", v24);

  -[CRTextFeature stringValue](self, "stringValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature selectedLocale](self, "selectedLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_crStringByAppendingString:locale:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setStringValue:](self, "setStringValue:", v28);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");
    objc_msgSend(v137, "stringValueCandidates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 >= objc_msgSend(v32, "count"))
      objc_msgSend(v137, "stringValueCandidates");
    else
      -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34 <= i)
      break;
    -[CRTextFeature stringValueCandidates](self, "stringValueCandidates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", i);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "stringValueCandidates");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", i);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextFeature selectedLocale](self, "selectedLocale");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_crStringByAppendingString:locale:", v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v136, "addObject:", v40);
  }
  v41 = (void *)objc_msgSend(v136, "copy");
  -[CRTextFeature setStringValueCandidates:](self, "setStringValueCandidates:", v41);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; ; ++j)
  {
    -[CRTextFeature candidateProbs](self, "candidateProbs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");
    objc_msgSend(v137, "candidateProbs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 >= objc_msgSend(v46, "count"))
      objc_msgSend(v137, "candidateProbs");
    else
      -[CRTextFeature candidateProbs](self, "candidateProbs");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48 <= j)
      break;
    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[CRTextFeature candidateProbs](self, "candidateProbs");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", j);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "floatValue");
    v53 = v52;
    objc_msgSend(v137, "candidateProbs");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", j);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "floatValue");
    *(float *)&v57 = (float)((float)(1.0 - v18) * v56) + (float)(v53 * v18);
    objc_msgSend(v49, "numberWithFloat:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "addObject:", v58);
  }
  v59 = (void *)objc_msgSend(v42, "copy");
  -[CRTextFeature setCandidateProbs:](self, "setCandidateProbs:", v59);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  for (k = 0; ; ++k)
  {
    -[CRTextFeature candidateActivationProbs](self, "candidateActivationProbs");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "count");
    objc_msgSend(v137, "candidateActivationProbs");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63 >= objc_msgSend(v64, "count"))
      objc_msgSend(v137, "candidateActivationProbs");
    else
      -[CRTextFeature candidateActivationProbs](self, "candidateActivationProbs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");

    if (v66 <= k)
      break;
    v67 = (void *)MEMORY[0x1E0CB37E8];
    -[CRTextFeature candidateActivationProbs](self, "candidateActivationProbs");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectAtIndexedSubscript:", k);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "floatValue");
    v71 = v70;
    objc_msgSend(v137, "candidateActivationProbs");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectAtIndexedSubscript:", k);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "floatValue");
    *(float *)&v75 = (float)(v71 + v74) * 0.5;
    objc_msgSend(v67, "numberWithFloat:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "addObject:", v76);
  }
  v77 = (void *)objc_msgSend(v60, "copy");
  -[CRTextFeature setCandidateActivationProbs:](self, "setCandidateActivationProbs:", v77);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  for (m = 0; ; ++m)
  {
    -[CRTextFeature subFeatureCandidates](self, "subFeatureCandidates");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "count");
    objc_msgSend(v137, "subFeatureCandidates");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81 >= objc_msgSend(v82, "count"))
      objc_msgSend(v137, "subFeatureCandidates");
    else
      -[CRTextFeature subFeatureCandidates](self, "subFeatureCandidates");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "count");

    if (v84 <= m)
      break;
    -[CRTextFeature subFeatureCandidates](self, "subFeatureCandidates");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "objectAtIndexedSubscript:", m);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "subFeatureCandidates");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "objectAtIndexedSubscript:", m);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "arrayByAddingObjectsFromArray:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "addObject:", v89);
  }
  v90 = (void *)objc_msgSend(v78, "copy");
  -[CRTextFeature setSubFeatureCandidates:](self, "setSubFeatureCandidates:", v90);

  -[CRTextFeature sizeForImageSize:](self, "sizeForImageSize:", width, height);
  v92 = v91;
  objc_msgSend(v137, "sizeForImageSize:", width, height);
  v94 = v93;
  -[CRTextFeature baselineAngle](self, "baselineAngle");
  v96 = v95;
  objc_msgSend(v137, "baselineAngle");
  v98 = v97;
  v99 = v96 - v98;
  if (v99 <= 3.14159265)
  {
    if (v99 > -3.14159265)
      goto LABEL_30;
    v100 = 6.28318531;
  }
  else
  {
    v100 = -6.28318531;
  }
  v99 = v99 + v100;
LABEL_30:
  v101 = v92 / (v92 + v94) * v99 + v98;
  if (v101 > 3.14159265)
  {
    v102 = -6.28318531;
LABEL_34:
    v101 = v101 + v102;
    goto LABEL_35;
  }
  if (v101 <= -3.14159265)
  {
    v102 = 6.28318531;
    goto LABEL_34;
  }
LABEL_35:
  *(float *)&v101 = v101;
  -[CRTextFeature setBaselineAngle:](self, "setBaselineAngle:", v101);
  v103 = [CRNormalizedQuad alloc];
  -[CRTextFeature topLeft](self, "topLeft");
  v105 = v104;
  v107 = v106;
  -[CRTextFeature topRight](self, "topRight");
  v109 = v108;
  v111 = v110;
  -[CRTextFeature bottomRight](self, "bottomRight");
  v113 = v112;
  v115 = v114;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  v118 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v103, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v105, v107, v109, v111, v113, v115, v116, v117, *(_QWORD *)&width, *(_QWORD *)&height);
  v119 = [CRNormalizedQuad alloc];
  objc_msgSend(v137, "topLeft");
  v121 = v120;
  v123 = v122;
  objc_msgSend(v137, "topRight");
  v125 = v124;
  v127 = v126;
  objc_msgSend(v137, "bottomRight");
  v129 = v128;
  v131 = v130;
  objc_msgSend(v137, "bottomLeft");
  v134 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v119, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v121, v123, v125, v127, v129, v131, v132, v133, *(_QWORD *)&width, *(_QWORD *)&height);
  -[CRTextFeature baselineAngle](self, "baselineAngle");
  -[CRNormalizedQuad unionWithNormalizedQuad:baselineAngle:](v118, "unionWithNormalizedQuad:baselineAngle:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "topLeft");
  -[CRTextFeature setTopLeft:](self, "setTopLeft:");
  objc_msgSend(v135, "topRight");
  -[CRTextFeature setTopRight:](self, "setTopRight:");
  objc_msgSend(v135, "bottomRight");
  -[CRTextFeature setBottomRight:](self, "setBottomRight:");
  objc_msgSend(v135, "bottomLeft");
  -[CRTextFeature setBottomLeft:](self, "setBottomLeft:");
  objc_msgSend(v135, "boundingBox");
  -[CRTextFeature setBounds:](self, "setBounds:");

}

- (NSLocale)locale
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  -[CRTextFeature selectedLocale](self, "selectedLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v4;
}

- (double)confidenceScore
{
  void *v2;
  double v3;
  double v4;

  -[CRTextFeature confidence](self, "confidence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (unint64_t)textRegionType
{
  unint64_t v2;

  v2 = -[CRTextFeature type](self, "type");
  if (v2 - 2 >= 3)
    return 2;
  else
    return 4 - v2;
}

- (void)mergeWithLine:(id)a3
{
  id v4;

  v4 = a3;
  -[CRTextFeature originalImageSize](self, "originalImageSize");
  -[CRTextFeature appendTextFeature:imageSize:](self, "appendTextFeature:imageSize:", v4);

}

- (CRNormalizedQuad)boundingQuad
{
  CRNormalizedQuad *v3;
  double v4;
  double v5;
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
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;

  v3 = [CRNormalizedQuad alloc];
  -[CRTextFeature topLeft](self, "topLeft");
  v5 = v4;
  v7 = v6;
  -[CRTextFeature topRight](self, "topRight");
  v9 = v8;
  v11 = v10;
  -[CRTextFeature bottomRight](self, "bottomRight");
  v13 = v12;
  v15 = v14;
  -[CRTextFeature bottomLeft](self, "bottomLeft");
  v17 = v16;
  v19 = v18;
  -[CRTextFeature originalImageSize](self, "originalImageSize");
  return -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v3, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v5, v7, v9, v11, v13, v15, v17, v19, v20, v21);
}

- (unint64_t)layoutDirection
{
  return 1;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_topLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_topLeft, &v3, 16, 1, 0);
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_topRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_topRight, &v3, 16, 1, 0);
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_bottomLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_bottomLeft, &v3, 16, 1, 0);
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_bottomRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_bottomRight, &v3, 16, 1, 0);
}

- (NSArray)subFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)stringValueCandidates
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStringValueCandidates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)candidateProbs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCandidateProbs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)candidateActivationProbs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCandidateActivationProbs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)subFeatureCandidates
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubFeatureCandidates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)bestCandidateIndex
{
  return self->_bestCandidateIndex;
}

- (void)setBestCandidateIndex:(int64_t)a3
{
  self->_bestCandidateIndex = a3;
}

- (BOOL)shouldExpandToFullWidth
{
  return self->_shouldExpandToFullWidth;
}

- (void)setShouldExpandToFullWidth:(BOOL)a3
{
  self->_shouldExpandToFullWidth = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)gtStringValue
{
  return self->_gtStringValue;
}

- (void)setGtStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_gtStringValue, a3);
}

- (CRImage)imageCut
{
  return (CRImage *)objc_getProperty(self, a2, 112, 1);
}

- (void)setImageCut:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)confidence
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConfidence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CGPoint)toplineOrigin
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_toplineOrigin, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)baselineOrigin
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_baselineOrigin, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (float)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setBaselineAngle:(float)a3
{
  self->_baselineAngle = a3;
}

- (unsigned)sizeHint
{
  return self->_sizeHint;
}

- (void)setSizeHint:(unsigned __int8)a3
{
  self->_sizeHint = a3;
}

- (float)textlineHeight
{
  return self->_textlineHeight;
}

- (void)setTextlineHeight:(float)a3
{
  self->_textlineHeight = a3;
}

- (int)featureMapID
{
  return self->_featureMapID;
}

- (void)setFeatureMapID:(int)a3
{
  self->_featureMapID = a3;
}

- (NSArray)scriptCategoryResults
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setScriptCategoryResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CRScriptCategory)selectedScriptCategory
{
  return (CRScriptCategory *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSelectedScriptCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDictionary)scriptCounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setScriptCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)selectedLocale
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSelectedLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)sequenceScriptOutputResult
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSequenceScriptOutputResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)shouldRotate180
{
  return self->_shouldRotate180;
}

- (void)setShouldRotate180:(BOOL)a3
{
  self->_shouldRotate180 = a3;
}

- (BOOL)shouldRotate180DetectorOrientationFallBack
{
  return self->_shouldRotate180DetectorOrientationFallBack;
}

- (void)setShouldRotate180DetectorOrientationFallBack:(BOOL)a3
{
  self->_shouldRotate180DetectorOrientationFallBack = a3;
}

- (BOOL)isCurved
{
  return self->_isCurved;
}

- (void)setIsCurved:(BOOL)a3
{
  self->_isCurved = a3;
}

- (BOOL)isVerticalLayout
{
  return self->_isVerticalLayout;
}

- (void)setIsVerticalLayout:(BOOL)a3
{
  self->_isVerticalLayout = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (int)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(int)a3
{
  self->_featureID = a3;
}

- (CRNormalizedPolyline)polygon
{
  return (CRNormalizedPolyline *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPolygon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)useSequenceScriptLocale
{
  return self->_useSequenceScriptLocale;
}

- (void)setUseSequenceScriptLocale:(BOOL)a3
{
  self->_useSequenceScriptLocale = a3;
}

- (BOOL)useSequenceOrientation
{
  return self->_useSequenceOrientation;
}

- (void)setUseSequenceOrientation:(BOOL)a3
{
  self->_useSequenceOrientation = a3;
}

- (BOOL)appliedOrientationCorrection
{
  return self->_appliedOrientationCorrection;
}

- (void)setAppliedOrientationCorrection:(BOOL)a3
{
  self->_appliedOrientationCorrection = a3;
}

- (BOOL)whitespaceInjected
{
  return self->_whitespaceInjected;
}

- (void)setWhitespaceInjected:(BOOL)a3
{
  self->_whitespaceInjected = a3;
}

- (unint64_t)lineWrappingType
{
  return self->_lineWrappingType;
}

- (void)setLineWrappingType:(unint64_t)a3
{
  self->_lineWrappingType = a3;
}

- (CGSize)originalImageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_originalImageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOriginalImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_originalImageSize, &v3, 16, 1, 0);
}

- (unint64_t)nmsOutputScale
{
  return self->_nmsOutputScale;
}

- (void)setNmsOutputScale:(unint64_t)a3
{
  self->_nmsOutputScale = a3;
}

- (unint64_t)textType
{
  return self->_textType;
}

- (void)setTextType:(unint64_t)a3
{
  self->_textType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sequenceScriptOutputResult, 0);
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_scriptCounts, 0);
  objc_storeStrong((id *)&self->_selectedScriptCategory, 0);
  objc_storeStrong((id *)&self->_scriptCategoryResults, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_imageCut, 0);
  objc_storeStrong((id *)&self->_gtStringValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_subFeatureCandidates, 0);
  objc_storeStrong((id *)&self->_candidateActivationProbs, 0);
  objc_storeStrong((id *)&self->_candidateProbs, 0);
  objc_storeStrong((id *)&self->_stringValueCandidates, 0);
  objc_storeStrong((id *)&self->_subFeatures, 0);
}

@end
