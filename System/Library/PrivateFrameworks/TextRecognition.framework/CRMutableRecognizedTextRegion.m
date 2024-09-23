@implementation CRMutableRecognizedTextRegion

- (void)adjustBoundsBasedOnSubregions
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  float v26;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double v31;
  double MaxY;
  double v33;
  CRImageSpaceQuad *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x1E0C80C00];
  -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "denormalizedQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "midPoint");
  v39 = v6;
  v40 = v5;

  -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baselineAngle");
  v9 = v8;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[CRRecognizedTextRegion subregions](self, "subregions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    v14 = v9;
    v15 = 1.79769313e308;
    v16 = -1.79769313e308;
    v17 = -1.79769313e308;
    v41 = 1.79769313e308;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "boundingQuad");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "denormalizedQuad");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v21 = v14;
        objc_msgSend(v20, "rotatedAroundPoint:angle:", v40, v39, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "boundingBox");
        x = v48.origin.x;
        y = v48.origin.y;
        width = v48.size.width;
        v26 = v14;
        height = v48.size.height;
        MinX = CGRectGetMinX(v48);
        if (v15 >= MinX)
          v15 = MinX;
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        MaxX = CGRectGetMaxX(v49);
        if (v17 < MaxX)
          v17 = MaxX;
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = width;
        v50.size.height = height;
        MinY = CGRectGetMinY(v50);
        v31 = v41;
        if (v41 >= MinY)
          v31 = MinY;
        v41 = v31;
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        v14 = v26;
        MaxY = CGRectGetMaxY(v51);
        if (v16 < MaxY)
          v16 = MaxY;

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v12);
    v33 = v41;
  }
  else
  {
    v14 = v9;
    v33 = 1.79769313e308;
    v16 = -1.79769313e308;
    v17 = -1.79769313e308;
    v15 = 1.79769313e308;
  }

  v34 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", v15, v33, v17 - v15, v16 - v33);
  *(float *)&v35 = -v14;
  -[CRImageSpaceQuad rotatedAroundPoint:angle:](v34, "rotatedAroundPoint:angle:", v40, v39, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "normalizationSize");
  objc_msgSend(v36, "normalizedQuadForImageSize:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRRecognizedTextRegion setBoundingQuad:](self, "setBoundingQuad:", v38);
}

- (void)removeUnknownScriptMarkersFromTranscripts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;

  v19 = a3;
  -[CRRecognizedTextRegion text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRMutableRecognizedTextRegion _removeUnknownScriptMarkersFromString:replacementString:]((uint64_t)self, v4, v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRecognizedTextRegion setText:](self, "setText:", v5);

  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[CRRecognizedTextRegion subregions](self, "subregions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRRecognizedTextRegion subregions](self, "subregions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      -[CRRecognizedTextRegion subregions](self, "subregions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRMutableRecognizedTextRegion _removeUnknownScriptMarkersFromString:replacementString:]((uint64_t)self, v15, v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v16);

      objc_msgSend(v8, "addObject:", v14);
      ++v11;
      -[CRRecognizedTextRegion subregions](self, "subregions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v11 < v18);
  }
  -[CRRecognizedTextRegion setSubregions:](self, "setSubregions:", v8);

}

- (id)_removeUnknownScriptMarkersFromString:(void *)a3 replacementString:
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CB3500];
    v5 = a3;
    v6 = a2;
    objc_msgSend(v4, "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "_crUnknownScriptCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "componentsJoinedByString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
