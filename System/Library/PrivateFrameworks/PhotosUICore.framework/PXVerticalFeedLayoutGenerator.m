@implementation PXVerticalFeedLayoutGenerator

- (void)willParseTiles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXVerticalFeedLayoutGenerator;
  -[PXFeedLayoutGenerator willParseTiles](&v3, sel_willParseTiles);
  self->_origin = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_enqueuedCaptionTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
  self->_enqueuedLikesTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
  self->_enqueuedCommentsTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parseNextTiles
{
  return -[PXVerticalFeedLayoutGenerator _parseTileRequiringFullWidth](self, "_parseTileRequiringFullWidth")
      || -[PXVerticalFeedLayoutGenerator _parseSpecialSequence](self, "_parseSpecialSequence")
      || -[PXVerticalFeedLayoutGenerator _parseSpecialTileTriplet](self, "_parseSpecialTileTriplet")
      || -[PXVerticalFeedLayoutGenerator _parseTileTriplet](self, "_parseTileTriplet")
      || -[PXVerticalFeedLayoutGenerator _parseTilePair](self, "_parseTilePair")
      || -[PXVerticalFeedLayoutGenerator _parseSingleTile](self, "_parseSingleTile");
}

- (void)didParseTiles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXVerticalFeedLayoutGenerator;
  -[PXFeedLayoutGenerator didParseTiles](&v3, sel_didParseTiles);
  -[PXVerticalFeedLayoutGenerator _dequeueCaption](self, "_dequeueCaption");
  -[PXVerticalFeedLayoutGenerator _dequeueLikes](self, "_dequeueLikes");
  -[PXVerticalFeedLayoutGenerator _dequeueComments](self, "_dequeueComments");
}

- (BOOL)_parseSingleTile
{
  _BOOL4 v3;
  _OWORD v5[4];

  memset(v5, 0, sizeof(v5));
  v3 = -[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v5);
  if (v3)
    -[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v5, 1);
  return v3;
}

- (BOOL)_parseTilePair
{
  void *v3;
  BOOL v4;
  _BYTE v6[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXVerticalFeedLayoutGenerator _scanTilePair:](self, "_scanTilePair:", v6))
    goto LABEL_5;
  if (!-[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v6, 2))
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
LABEL_6:

  return v4;
}

- (BOOL)_parseTileTriplet
{
  void *v3;
  BOOL v4;
  _BYTE v6[192];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXVerticalFeedLayoutGenerator _scanTileTriplet:](self, "_scanTileTriplet:", v6))
    goto LABEL_5;
  if (!-[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v6, 3))
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
LABEL_6:

  return v4;
}

- (BOOL)_parseTileRequiringFullWidth
{
  _BOOL4 v3;
  _OWORD v5[4];

  memset(v5, 0, sizeof(v5));
  v3 = -[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", v5);
  if (v3)
    -[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v5, 1);
  return v3;
}

- (BOOL)_parseSpecialTileTriplet
{
  void *v3;
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
  unint64_t v31;
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
  unint64_t v44;
  double v45;
  BOOL v46;
  _BYTE *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[4];
  _BYTE v58[64];
  _OWORD v59[4];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    goto LABEL_37;
  if (!-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v57))
    goto LABEL_37;
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
    goto LABEL_37;
  if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v58))
    goto LABEL_37;
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
    goto LABEL_37;
  if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v59))
    goto LABEL_37;
  if (-[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
    goto LABEL_37;
  -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v5 = v4;
  v7 = v6;
  -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
  v9 = v8 - v5;
  v10 = v9 * 0.75;
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v9 * 0.5);
  v12 = v11 + v11;
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v10 * 0.5);
  v14 = v13 + v13;
  v15 = v5 + v12 * 0.5;
  -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth", 0, 0, v12 * 0.5, v7 + v13 + v13);
  v51 = *(unint64_t *)&v15;
  *(double *)&v52 = v16 - v15;
  *((double *)&v52 + 1) = v14 * 0.5;
  -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
  *(double *)&v53 = v15;
  *((double *)&v53 + 1) = v7 + v14 * 0.5;
  *(double *)&v54 = v17 - v15;
  *((double *)&v54 + 1) = v14 * 0.5;
  if (!-[PXVerticalFeedLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", v57, &v49, 3))
  {
LABEL_37:
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
    if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
      goto LABEL_38;
    if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v57))
      goto LABEL_38;
    if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
      goto LABEL_38;
    if (!-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v58))
      goto LABEL_38;
    if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
      goto LABEL_38;
    if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v59))
      goto LABEL_38;
    if (-[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
      goto LABEL_38;
    -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
    v19 = v18;
    v21 = v20;
    -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
    v23 = v22 - v19;
    v24 = v23 * 0.75;
    -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v23 * 0.5);
    v26 = v25 + v25;
    -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v24 * 0.5);
    v28 = v27 + v27;
    v29 = v26 * 0.5;
    v30 = (v27 + v27) * 0.5;
    *(double *)&v50 = v26 * 0.5;
    *((double *)&v50 + 1) = v30;
    *(double *)&v31 = v19 + v26 * 0.5;
    -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth", 0, 0, v50);
    v51 = v31;
    *(double *)&v52 = v32 - *(double *)&v31;
    *((double *)&v52 + 1) = v21 + v28;
    *(_QWORD *)&v53 = 0;
    *((double *)&v53 + 1) = v19 + v28 * 0.5;
    *(double *)&v54 = v29;
    *((double *)&v54 + 1) = v30;
    if (!-[PXVerticalFeedLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", v57, &v49, 3))
    {
LABEL_38:
      -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
      if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
        goto LABEL_26;
      if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v57))
        goto LABEL_26;
      if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
        goto LABEL_26;
      if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v58))
        goto LABEL_26;
      if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
        goto LABEL_26;
      if (!-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v59))
        goto LABEL_26;
      if (-[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
        goto LABEL_26;
      -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
      v34 = v33;
      v36 = v35;
      -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
      v38 = v37 - v34;
      v39 = v38 * 0.75;
      -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v38 * 0.5);
      v41 = v40 + v40;
      -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v39 * 0.5);
      v43 = v42 + v42;
      *((double *)&v51 + 1) = v34 + (v42 + v42) * 0.5;
      *((double *)&v52 + 1) = (v42 + v42) * 0.5;
      *(double *)&v44 = v34 + v41 * 0.5;
      -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth", 0, 0, v41 * 0.5, *((_QWORD *)&v52 + 1), 0, *((_QWORD *)&v51 + 1), v41 * 0.5, *((_QWORD *)&v52 + 1));
      v53 = v44;
      *(double *)&v54 = v45 - *(double *)&v44;
      *((double *)&v54 + 1) = v36 + v43;
      if (!-[PXVerticalFeedLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", v57, &v49, 3))
      {
LABEL_26:
        -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
        if (-[PXVerticalFeedLayoutGenerator _scanTripletWithLargeLead:](self, "_scanTripletWithLargeLead:", v57))
        {
          v46 = 1;
          -[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v57, 1);
          if (-[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v58, 2))
          {
            goto LABEL_34;
          }
          v46 = 1;
          -[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v58, 1);
          v47 = v59;
        }
        else
        {
          -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
          if (!-[PXVerticalFeedLayoutGenerator _scanTripletWithRearrangment:](self, "_scanTripletWithRearrangment:", v57))goto LABEL_33;
          v49 = v57[0];
          v50 = v57[1];
          v51 = v57[2];
          v52 = v57[3];
          v53 = v59[0];
          v54 = v59[1];
          v55 = v59[2];
          v56 = v59[3];
          if (!-[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", &v49, 2))
          {
LABEL_33:
            -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
            v46 = 0;
            goto LABEL_34;
          }
          v47 = v58;
          v46 = 1;
        }
        -[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v47, 1);
        goto LABEL_34;
      }
    }
  }
  v46 = 1;
LABEL_34:

  return v46;
}

- (BOOL)_parseSpecialSequence
{
  _BOOL4 v3;
  char v5;

  v5 = 0;
  v3 = -[PXVerticalFeedLayoutGenerator _parseSpecialSubsequenceWithRowRequired:rowParsed:](self, "_parseSpecialSubsequenceWithRowRequired:rowParsed:", 1, &v5);
  if (v3)
  {
    do
    {
      if (!v5)
        break;
      if (-[PXFeedLayoutGenerator shouldStop](self, "shouldStop"))
        break;
      v5 = 0;
    }
    while (-[PXVerticalFeedLayoutGenerator _parseSpecialSubsequenceWithRowRequired:rowParsed:](self, "_parseSpecialSubsequenceWithRowRequired:rowParsed:", 0, &v5));
  }
  return v3;
}

- (BOOL)_parseSpecialSubsequenceWithRowRequired:(BOOL)a3 rowParsed:(BOOL *)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  uint64_t v12;
  _BYTE v13[192];
  _BYTE v14[192];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanSpecialSequenceBlock:](self, "_scanSpecialSequenceBlock:", v14))
  {
    -[PXFeedLayoutGenerator scanState](self, "scanState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (-[PXVerticalFeedLayoutGenerator _scanSpecialSequenceRow:count:](self, "_scanSpecialSequenceRow:count:", v13, &v12))
    {
      if (-[PXVerticalFeedLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v14))
      {
        if (-[PXVerticalFeedLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v13, v12))
        {
          v9 = 1;
        }
        else
        {
          -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v8);
          v9 = 0;
        }
        v10 = 1;
LABEL_14:

        if (!a4)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    else if (!a3 && !-[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
    {
      v10 = -[PXVerticalFeedLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v14);
      v9 = 0;
      goto LABEL_14;
    }
    v9 = 0;
    v10 = 0;
    goto LABEL_14;
  }
  v9 = 0;
  v10 = 0;
  if (a4)
LABEL_15:
    *a4 = v9;
LABEL_16:
  if (!v10)
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v7);

  return v10;
}

- (BOOL)_scanTileRequiringNewRow:(PXTileInfo *)a3
{
  void *v5;
  _BOOL4 v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", a3))
  {
LABEL_2:
    LOBYTE(v6) = 1;
    goto LABEL_3;
  }
  v9 = 0u;
  v10 = 0u;
  memset(v8, 0, sizeof(v8));
  v6 = -[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v8);
  if (v6 && !BYTE8(v9))
  {
    if (!objc_msgSend(v5, "scannedBatchHasCaption") || !BYTE8(v10))
    {
      -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
      LOBYTE(v6) = 0;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v6;
}

- (BOOL)_scanTilePair:(PXTileInfo *)a3
{
  void *v5;
  PXTileInfo *v6;
  BOOL v7;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    || !-[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", a3)
    || -[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    || (a3 ? (v6 = a3 + 1) : (v6 = 0), !-[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v6)))
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_scanTileTriplet:(PXTileInfo *)a3
{
  void *v5;
  PXTileInfo *v6;
  PXTileInfo *v7;
  BOOL v8;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    || !-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3)
    || -[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    || (a3 ? (v6 = a3 + 1) : (v6 = 0),
        !-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v6)
     || -[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
     || (a3 ? (v7 = a3 + 2) : (v7 = 0),
         !-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v7)
      || -[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))))
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_scanSpecialSequenceBlock:(PXTileInfo *)a3
{
  return -[PXVerticalFeedLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3);
}

- (BOOL)_scanSpecialSequenceRow:(PXTileInfo *)a3 count:(int64_t *)a4
{
  void *v7;
  int64_t v8;
  BOOL v9;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", a3))
  {
    v8 = 1;
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v7);
    if (-[PXVerticalFeedLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3)&& !-[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
    {
      v8 = 3;
    }
    else
    {
      -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v7);
      if (!-[PXVerticalFeedLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 2)|| -[PXVerticalFeedLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
      {
        -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v7);
        v9 = 0;
        goto LABEL_11;
      }
      v8 = 2;
    }
  }
  if (a4)
    *a4 = v8;
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_scanNonPanoramaSequence:(PXTileInfo *)a3 count:(int64_t)a4
{
  int64_t v7;
  void *v8;
  PXTileInfo *v9;
  PXTileInfo *v10;
  BOOL v11;
  void *v14;
  uint64_t v15;

  v7 = a4 - 1;
  if (a4 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVerticalFeedLayoutGenerator.m"), 443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count >= 2"));

  }
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    || (v15 = 0, !-[PXFeedLayoutGenerator scanTile:type:](self, "scanTile:type:", a3, &v15))
    || (unint64_t)(v15 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_15:
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v8);
    v11 = 0;
    goto LABEL_16;
  }
  if (a4 >= 2)
  {
    v9 = a3 + 1;
    while (!-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
    {
      v10 = a3 ? v9 : 0;
      if (!-[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", v10, v15))
        break;
      ++v9;
      if (!--v7)
        goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_14:
  v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)_scanTripletWithLargeLead:(PXTileInfo *)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVerticalFeedLayoutGenerator.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileInfos != NULL"));

  }
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (!-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (!-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (!-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  if ((-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
LABEL_80:
    v6 = 1;
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_scanTripletWithRearrangment:(PXTileInfo *)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVerticalFeedLayoutGenerator.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileInfos != NULL"));

  }
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[PXVerticalFeedLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3)
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && !-[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    v6 = 1;
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasLeftSuboptimalRow
{
  void *v3;
  BOOL v4;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", 0))
    v4 = -[PXVerticalFeedLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow");
  else
    v4 = 0;
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);

  return v4;
}

- (BOOL)_isAtEndOfRow
{
  void *v3;
  BOOL v4;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXFeedLayoutGenerator isAtEnd](self, "isAtEnd")
    || -[PXVerticalFeedLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0);
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);

  return v4;
}

- (void)_enqueueCaptionWithTileInfo:(PXTileInfo *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;

  -[PXVerticalFeedLayoutGenerator _dequeueCaption](self, "_dequeueCaption");
  v5 = *(_OWORD *)&a3->commentCount;
  v7 = *(_OWORD *)&a3->index;
  v6 = *(_OWORD *)&a3->imageSize.height;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.minimumSize.height = *(_OWORD *)&a3->minimumSize.height;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.commentCount = v5;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.index = v7;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.imageSize.height = v6;
}

- (BOOL)_hasEnqueuedCaption
{
  return self->_enqueuedCaptionTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_dequeueCaption
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  double v11;
  CGRect v13;

  v3 = -[PXVerticalFeedLayoutGenerator _hasEnqueuedCaption](self, "_hasEnqueuedCaption");
  if (v3)
  {
    if (-[PXVerticalFeedLayoutGenerator shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches")
      || self->_enqueuedCaptionTileInfo.index >= 1)
    {
      -[PXFeedLayoutGenerator captionPadding](self, "captionPadding");
      self->_origin.y = v4 + self->_origin.y;
    }
    -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
    -[PXFeedLayoutGenerator captionSizeForTileAtIndex:proposedSize:](self, "captionSizeForTileAtIndex:proposedSize:", self->_enqueuedCaptionTileInfo.index);
    v6 = v5;
    v8 = v7;
    x = self->_origin.x;
    y = self->_origin.y;
    -[PXFeedLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 1, self->_enqueuedCaptionTileInfo.index, x, y, v5, v7);
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = v6;
    v13.size.height = v8;
    self->_origin.y = CGRectGetMaxY(v13);
    if (-[PXVerticalFeedLayoutGenerator shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches")
      || self->_enqueuedCaptionTileInfo.index >= 1)
    {
      -[PXFeedLayoutGenerator captionPadding](self, "captionPadding");
      self->_origin.y = self->_origin.y + v11;
    }
    self->_enqueuedCaptionTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)_enqueueLikesWithTileInfo:(PXTileInfo *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;

  -[PXVerticalFeedLayoutGenerator _dequeueLikes](self, "_dequeueLikes");
  v5 = *(_OWORD *)&a3->commentCount;
  v7 = *(_OWORD *)&a3->index;
  v6 = *(_OWORD *)&a3->imageSize.height;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.minimumSize.height = *(_OWORD *)&a3->minimumSize.height;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.commentCount = v5;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.index = v7;
  *(_OWORD *)&self->_enqueuedLikesTileInfo.imageSize.height = v6;
}

- (BOOL)_hasEnqueuedLikes
{
  return self->_enqueuedLikesTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_dequeueLikes
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double x;
  double y;
  CGRect v11;

  v3 = -[PXVerticalFeedLayoutGenerator _hasEnqueuedLikes](self, "_hasEnqueuedLikes");
  if (v3)
  {
    -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
    -[PXFeedLayoutGenerator likesSizeForTileAtIndex:proposedSize:](self, "likesSizeForTileAtIndex:proposedSize:", self->_enqueuedLikesTileInfo.index);
    v5 = v4;
    v7 = v6;
    x = self->_origin.x;
    y = self->_origin.y;
    -[PXFeedLayoutGenerator parsedFrame:type:forLikesAtIndex:](self, "parsedFrame:type:forLikesAtIndex:", 2, self->_enqueuedLikesTileInfo.index, x, y, v4, v6);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = v5;
    v11.size.height = v7;
    self->_origin.y = CGRectGetMaxY(v11);
    self->_enqueuedLikesTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)_enqueueCommentsWithTileInfo:(PXTileInfo *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;

  -[PXVerticalFeedLayoutGenerator _dequeueComments](self, "_dequeueComments");
  v5 = *(_OWORD *)&a3->commentCount;
  v7 = *(_OWORD *)&a3->index;
  v6 = *(_OWORD *)&a3->imageSize.height;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.minimumSize.height = *(_OWORD *)&a3->minimumSize.height;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.commentCount = v5;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.index = v7;
  *(_OWORD *)&self->_enqueuedCommentsTileInfo.imageSize.height = v6;
}

- (BOOL)_hasEnqueuedComments
{
  return self->_enqueuedCommentsTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_dequeueComments
{
  _BOOL4 v3;
  PXTileInfo *p_enqueuedCommentsTileInfo;
  int64_t commentCount;
  uint64_t i;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double x;
  double y;
  CGRect v14;

  v3 = -[PXVerticalFeedLayoutGenerator _hasEnqueuedComments](self, "_hasEnqueuedComments");
  if (v3)
  {
    p_enqueuedCommentsTileInfo = &self->_enqueuedCommentsTileInfo;
    commentCount = self->_enqueuedCommentsTileInfo.commentCount;
    if (commentCount >= 1)
    {
      for (i = 0; i != commentCount; ++i)
      {
        -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
        -[PXFeedLayoutGenerator commentSizeForTileAtIndex:commentIndex:proposedSize:](self, "commentSizeForTileAtIndex:commentIndex:proposedSize:", p_enqueuedCommentsTileInfo->index, i);
        v8 = v7;
        v10 = v9;
        x = self->_origin.x;
        y = self->_origin.y;
        -[PXFeedLayoutGenerator parsedFrame:type:forCommentAtIndex:](self, "parsedFrame:type:forCommentAtIndex:", 3, i, x, y, v7, v9);
        v14.origin.x = x;
        v14.origin.y = y;
        v14.size.width = v8;
        v14.size.height = v10;
        self->_origin.y = CGRectGetMaxY(v14);
      }
    }
    p_enqueuedCommentsTileInfo->index = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (BOOL)_addRowWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4
{
  uint64_t v7;
  CGFloat *p_height;
  int64_t v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v31 = -[PXFeedLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") > 0;
  v7 = MEMORY[0x1E0C809B0];
  if (*((_BYTE *)v29 + 24))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke;
    v27[3] = &unk_1E5147770;
    v27[4] = &v28;
    -[PXVerticalFeedLayoutGenerator _enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, 1, v27);
  }
  if (a4 >= 2)
  {
    p_height = &a3->minimumSize.height;
    v9 = a4;
    while (*(p_height - 1) == *MEMORY[0x1E0C9D820] && *p_height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      p_height += 8;
      if (!--v9)
        goto LABEL_11;
    }
    v11 = *((unsigned __int8 *)v29 + 24);
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_2;
    v26[3] = &unk_1E5147798;
    v26[4] = &v32;
    v26[5] = a3;
    -[PXVerticalFeedLayoutGenerator _enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v11, v26);
  }
LABEL_11:
  if (*((_BYTE *)v33 + 24))
  {
    v12 = *(_OWORD *)&a3->imageSize.height;
    v22 = *(_OWORD *)&a3->index;
    v23 = v12;
    v13 = *(_OWORD *)&a3->commentCount;
    v24 = *(_OWORD *)&a3->minimumSize.height;
    v25 = v13;
    -[PXVerticalFeedLayoutGenerator _willAddCaptionRowWithFirstTileInfo:](self, "_willAddCaptionRowWithFirstTileInfo:", &v22);
    v14 = *(_OWORD *)&a3->imageSize.height;
    v22 = *(_OWORD *)&a3->index;
    v23 = v14;
    v15 = *(_OWORD *)&a3->commentCount;
    v24 = *(_OWORD *)&a3->minimumSize.height;
    v25 = v15;
    -[PXVerticalFeedLayoutGenerator _willAddLikeRowWithFirstTileInfo:](self, "_willAddLikeRowWithFirstTileInfo:", &v22);
    v16 = *(_OWORD *)&a3->imageSize.height;
    v22 = *(_OWORD *)&a3->index;
    v23 = v16;
    v17 = *(_OWORD *)&a3->commentCount;
    v24 = *(_OWORD *)&a3->minimumSize.height;
    v25 = v17;
    -[PXVerticalFeedLayoutGenerator _willAddCommentRowsWithFirstTileInfo:](self, "_willAddCommentRowsWithFirstTileInfo:", &v22);
    v18 = *((unsigned __int8 *)v29 + 24);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_3;
    v21[3] = &unk_1E51477C0;
    v21[4] = self;
    v21[5] = a3;
    -[PXVerticalFeedLayoutGenerator _enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v18, v21);
    v19 = *((_BYTE *)v33 + 24) != 0;
  }
  else
  {
    v19 = 0;
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v19;
}

- (void)_enumerateRowFramesWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6
{
  _BOOL8 v6;
  void (**v10)(id, int64_t, _BYTE *, double, double, double, double);
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat *p_height;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint *p_origin;
  double y;
  double v24;
  int64_t v25;
  double v26;
  double x;
  CGFloat *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char v35;

  v6 = a5;
  v10 = (void (**)(id, int64_t, _BYTE *, double, double, double, double))a6;
  -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v12 = v11;
  v14 = v13;
  if (a4 < 1)
  {
    v16 = 0.0;
  }
  else
  {
    p_height = &a3->imageSize.height;
    v16 = 0.0;
    v17 = a4;
    do
    {
      v16 = v16 + *(p_height - 1) / *p_height;
      p_height += 8;
      --v17;
    }
    while (v17);
  }
  -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
  v19 = (v18 - (double)(a4 - 1) * v12) / v16;
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v19);
  v21 = v20;
  p_origin = &self->_origin;
  y = self->_origin.y;
  v24 = -0.0;
  if (y > 0.0)
    v24 = v14;
  if (a4 >= 1)
  {
    v25 = 0;
    v26 = y + v24;
    x = p_origin->x;
    v28 = &a3->imageSize.height;
    v29 = p_origin->x;
    do
    {
      v30 = x + *(v28 - 1) / *v28 * v19;
      if (v25 >= a4 - 1)
        v31 = 0.0;
      else
        v31 = v12 * 0.5;
      -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", v6, v31 + v30);
      v33 = v32 - v31;
      -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
      if (v33 >= v34)
        v33 = v34;
      v35 = 0;
      v10[2](v10, v25, &v35, v29, v26, v33 - v29, v21);
      if (v35)
        break;
      x = v12 + v30;
      v29 = v12 + v33;
      ++v25;
      v28 += 8;
    }
    while (a4 != v25);
  }

}

- (BOOL)_addRowWithTiles:(PXTileInfo *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5
{
  int64_t v5;
  PXTileInfo *v7;
  CGFloat *p_height;
  CGFloat *v10;
  int64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double x;
  double y;
  double v20;
  CGSize *p_size;
  int64_t index;
  double width;
  double height;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double MaxY;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;

  v5 = a5;
  v7 = a3;
  if (a5 < 2)
  {
LABEL_6:
    v12 = *(_OWORD *)&a3->imageSize.height;
    v32 = *(_OWORD *)&a3->index;
    v33 = v12;
    v13 = *(_OWORD *)&a3->commentCount;
    v34 = *(_OWORD *)&a3->minimumSize.height;
    v35 = v13;
    -[PXVerticalFeedLayoutGenerator _willAddCaptionRowWithFirstTileInfo:](self, "_willAddCaptionRowWithFirstTileInfo:", &v32);
    v14 = *(_OWORD *)&v7->imageSize.height;
    v32 = *(_OWORD *)&v7->index;
    v33 = v14;
    v15 = *(_OWORD *)&v7->commentCount;
    v34 = *(_OWORD *)&v7->minimumSize.height;
    v35 = v15;
    -[PXVerticalFeedLayoutGenerator _willAddLikeRowWithFirstTileInfo:](self, "_willAddLikeRowWithFirstTileInfo:", &v32);
    v16 = *(_OWORD *)&v7->imageSize.height;
    v32 = *(_OWORD *)&v7->index;
    v33 = v16;
    v17 = *(_OWORD *)&v7->commentCount;
    v34 = *(_OWORD *)&v7->minimumSize.height;
    v35 = v17;
    -[PXVerticalFeedLayoutGenerator _willAddCommentRowsWithFirstTileInfo:](self, "_willAddCommentRowsWithFirstTileInfo:", &v32);
    x = self->_origin.x;
    y = self->_origin.y;
    if (y > 0.0)
    {
      -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
      y = y + v20;
    }
    if (v5 >= 1)
    {
      p_size = &a4->size;
      do
      {
        index = v7->index;
        ++v7;
        width = p_size[-1].width;
        height = p_size[-1].height;
        v25 = p_size->width;
        v26 = p_size->height;
        p_size += 2;
        v27 = x + width;
        v28 = y + height;
        -[PXFeedLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 0, index, x + width, y + height, v25, v26);
        v29 = self->_origin.y;
        v36.origin.x = v27;
        v36.origin.y = v28;
        v36.size.width = v25;
        v36.size.height = v26;
        MaxY = CGRectGetMaxY(v36);
        if (v29 >= MaxY)
          MaxY = v29;
        self->_origin.y = MaxY;
        --v5;
      }
      while (v5);
    }
    return 1;
  }
  else
  {
    p_height = &a3->minimumSize.height;
    v10 = &a4->size.height;
    v11 = a5;
    while (*(v10 - 1) >= *(p_height - 1) && *v10 >= *p_height)
    {
      p_height += 8;
      v10 += 4;
      if (!--v11)
        goto LABEL_6;
    }
    return 0;
  }
}

- (BOOL)_addSpecialSequenceBlock:(PXTileInfo *)a3
{
  int64_t v5;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  _QWORD v26[13];

  v26[12] = *MEMORY[0x1E0C80C00];
  v5 = -[PXFeedLayoutGenerator scanSpecialSequenceCount](self, "scanSpecialSequenceCount");
  width = a3->imageSize.width;
  height = a3->imageSize.height;
  -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v9 = v8;
  -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, height * ((v10 - v9) / 3.0 / width));
  -[PXVerticalFeedLayoutGenerator referenceWidth](self, "referenceWidth");
  if ((v5 & 1) != 0)
    -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 1, v11 / 3.0);
  else
    -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 1, (v11 + v11) / 3.0);
  PXRectWithEdges();
  v26[0] = v12;
  v26[1] = v13;
  v26[2] = v14;
  v26[3] = v15;
  PXRectWithEdges();
  v26[4] = v16;
  v26[5] = v17;
  v26[6] = v18;
  v26[7] = v19;
  PXRectWithEdges();
  v26[8] = v20;
  v26[9] = v21;
  v26[10] = v22;
  v26[11] = v23;
  v24 = -[PXVerticalFeedLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", a3, v26, 3);
  if (v24)
    -[PXFeedLayoutGenerator setScanSpecialSequenceCount:](self, "setScanSpecialSequenceCount:", v5 + 1);
  return v24;
}

- (void)_willAddCaptionRowWithFirstTileInfo:(PXTileInfo *)a3
{
  double v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[4];

  if (a3->isBatchStart
    && !-[PXVerticalFeedLayoutGenerator _dequeueCaption](self, "_dequeueCaption")
    && a3->hasCaption
    && a3->index >= 1)
  {
    -[PXFeedLayoutGenerator noCaptionSpacing](self, "noCaptionSpacing");
    self->_origin.y = v5 + self->_origin.y;
  }
  if (a3->hasCaption)
  {
    v6 = *(_OWORD *)&a3->imageSize.height;
    v8[0] = *(_OWORD *)&a3->index;
    v8[1] = v6;
    v7 = *(_OWORD *)&a3->commentCount;
    v8[2] = *(_OWORD *)&a3->minimumSize.height;
    v8[3] = v7;
    -[PXVerticalFeedLayoutGenerator _enqueueCaptionWithTileInfo:](self, "_enqueueCaptionWithTileInfo:", v8);
    if (!-[PXVerticalFeedLayoutGenerator shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches"))
      -[PXVerticalFeedLayoutGenerator _dequeueCaption](self, "_dequeueCaption");
  }
}

- (void)_willAddLikeRowWithFirstTileInfo:(PXTileInfo *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];

  if (a3->hasLikes)
  {
    v3 = *(_OWORD *)&a3->imageSize.height;
    v5[0] = *(_OWORD *)&a3->index;
    v5[1] = v3;
    v4 = *(_OWORD *)&a3->commentCount;
    v5[2] = *(_OWORD *)&a3->minimumSize.height;
    v5[3] = v4;
    -[PXVerticalFeedLayoutGenerator _enqueueLikesWithTileInfo:](self, "_enqueueLikesWithTileInfo:", v5);
  }
}

- (void)_willAddCommentRowsWithFirstTileInfo:(PXTileInfo *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];

  if (a3->commentCount >= 1)
  {
    v3 = *(_OWORD *)&a3->imageSize.height;
    v5[0] = *(_OWORD *)&a3->index;
    v5[1] = v3;
    v4 = *(_OWORD *)&a3->commentCount;
    v5[2] = *(_OWORD *)&a3->minimumSize.height;
    v5[3] = v4;
    -[PXVerticalFeedLayoutGenerator _enqueueCommentsWithTileInfo:](self, "_enqueueCommentsWithTileInfo:", v5);
  }
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (BOOL)shouldDisplayCaptionsBelowBatches
{
  return self->_shouldDisplayCaptionsBelowBatches;
}

- (void)setShouldDisplayCaptionsBelowBatches:(BOOL)a3
{
  self->_shouldDisplayCaptionsBelowBatches = a3;
}

uint64_t __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke(uint64_t result, double a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  if (a4 < 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
    *a6 = 1;
  }
  return result;
}

void __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v13;
  double v14;
  double v15;
  CGRect v16;

  v13 = *(_QWORD *)(a1 + 40) + (a2 << 6);
  v15 = *(double *)(v13 + 24);
  v14 = *(double *)(v13 + 32);
  if (CGRectGetWidth(*(CGRect *)&a4) < v15
    || (v16.origin.x = a4, v16.origin.y = a5, v16.size.width = a6, v16.size.height = a7, CGRectGetHeight(v16) < v14))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __66__PXVerticalFeedLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_3(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v11;
  double MaxY;
  CGRect v13;

  objc_msgSend(*(id *)(a1 + 32), "parsedFrame:type:forTileAtIndex:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + (a2 << 6)));
  v11 = *(double *)(*(_QWORD *)(a1 + 32) + 1672);
  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  MaxY = CGRectGetMaxY(v13);
  if (v11 >= MaxY)
    MaxY = v11;
  *(double *)(*(_QWORD *)(a1 + 32) + 1672) = MaxY;
}

@end
