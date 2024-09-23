@implementation PXHorizontalFeedLayoutGenerator

- (void)willParseTiles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXHorizontalFeedLayoutGenerator;
  -[PXFeedLayoutGenerator willParseTiles](&v3, sel_willParseTiles);
  self->_origin = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (BOOL)parseNextTiles
{
  return -[PXHorizontalFeedLayoutGenerator _parseSpecialSequence](self, "_parseSpecialSequence")
      || -[PXHorizontalFeedLayoutGenerator _parseSpecialTileTriplet](self, "_parseSpecialTileTriplet")
      || -[PXHorizontalFeedLayoutGenerator _parseTileTriplet](self, "_parseTileTriplet")
      || -[PXHorizontalFeedLayoutGenerator _parseTilePair](self, "_parseTilePair")
      || -[PXHorizontalFeedLayoutGenerator _parseSingleTile](self, "_parseSingleTile");
}

- (BOOL)_parseSingleTile
{
  void *v3;
  _BOOL4 v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", &v10);
  if (v4)
  {
    -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
    v6 = v5;
    -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v5 * (*((double *)&v10 + 1) / *(double *)&v11));
    v9[0] = 0;
    v9[1] = 0;
    v9[2] = v7;
    *(double *)&v9[3] = v6;
    -[PXHorizontalFeedLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", &v10, v9, 1);
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
  }

  return v4;
}

- (BOOL)_parseTilePair
{
  void *v3;
  BOOL v4;
  _BYTE v6[64];
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXFeedLayoutGenerator scanLocation](self, "scanLocation")
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v6)
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v7)
    && -[PXFeedLayoutGenerator isAtEnd](self, "isAtEnd"))
  {
    v4 = 1;
    -[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v6, 1);
    -[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v7, 1);
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
    if (-[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v6)
      && -[PXFeedLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v7)
      && -[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v6, 2))
    {
      v4 = 1;
    }
    else
    {
      -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_parseTileTriplet
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
  double v46;
  double v47;
  double v48;
  BOOL v49;
  uint64_t v51;
  uint64_t v52;
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
  _BYTE v63[64];
  _BYTE v64[64];
  _QWORD v65[9];

  v65[8] = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v63))
  {
    if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v64))
    {
      if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v65))
      {
        if (!-[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
        {
          -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
          v5 = v4;
          v7 = v6;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v9 = v8 - v7;
          -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v8 - v7) * 0.75 * 0.5);
          v11 = v10 + v10;
          -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v9 * 0.5);
          v51 = 0;
          v52 = 0;
          v53 = v11 * 0.5;
          v54 = (v12 + v12) * 0.5;
          v55 = v5 + v11 * 0.5;
          v56 = 0.0;
          v57 = v11 * 0.5;
          v58 = v54;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v59 = 0.0;
          v60 = v7 + v54;
          v61 = v5 + v11;
          v62 = v13 - (v7 + v54);
          if (-[PXHorizontalFeedLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v63, &v51, 3))
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
  if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v63))
  {
    if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v64))
    {
      if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v65))
      {
        if (!-[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
        {
          -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
          v15 = v14;
          v17 = v16;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v19 = v18 - v17;
          -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v18 - v17) * 0.75 * 0.5);
          v21 = v20 + v20;
          -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v19 * 0.5);
          v51 = 0;
          v52 = 0;
          v53 = v15 + v21;
          v54 = (v22 + v22) * 0.5;
          v23 = v17 + v54;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v55 = 0.0;
          v56 = v23;
          v57 = v21 * 0.5;
          v58 = v24 - v23;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v59 = v15 + v21 * 0.5;
          v60 = v23;
          v61 = v21 * 0.5;
          v62 = v25 - v23;
          if (-[PXHorizontalFeedLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v63, &v51, 3))
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
  if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v63))
  {
    if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v64))
    {
      if (-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v65))
      {
        if (!-[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
        {
          -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
          v27 = v26;
          v29 = v28;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v31 = v30 - v29;
          -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v30 - v29) * 0.75 * 0.5);
          v33 = v32 + v32;
          -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v31 * 0.5);
          v35 = (v34 + v34) * 0.5;
          v51 = 0;
          v52 = 0;
          v53 = v33 * 0.5;
          v54 = v35;
          -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
          v55 = 0.0;
          v56 = v29 + v35;
          v57 = v27 + v33;
          v58 = v36 - (v29 + v35);
          v59 = v27 + v33 * 0.5;
          v60 = 0.0;
          v61 = v33 * 0.5;
          v62 = v35;
          if (-[PXHorizontalFeedLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v63, &v51, 3))
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
  if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v63))
    goto LABEL_22;
  if (!-[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v64))
    goto LABEL_22;
  if (!-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v65))
    goto LABEL_22;
  if (-[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
    goto LABEL_22;
  -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v38 = v37;
  v40 = v39;
  -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
  v42 = v41 - v40;
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v41 - v40) * 1.33333337 * 0.5);
  v44 = v43 + v43;
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v42 * 0.5);
  v46 = v45 + v45;
  v51 = 0;
  v52 = 0;
  v53 = v44 * 0.5;
  v54 = (v45 + v45) * 0.5;
  -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
  v55 = v38 + v44 * 0.5;
  v56 = 0.0;
  v57 = v44 * 0.5;
  v58 = v47;
  -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
  v59 = 0.0;
  v60 = v40 + v46 * 0.5;
  v61 = v44 * 0.5;
  v62 = v48 - v60;
  if (-[PXHorizontalFeedLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v63, &v51, 3))
  {
LABEL_21:
    v49 = 1;
  }
  else
  {
LABEL_22:
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
    v49 = 0;
  }

  return v49;
}

- (BOOL)_parseSpecialTileTriplet
{
  void *v3;
  _BOOL4 v4;
  _BYTE v6[64];
  _BYTE v7[64];
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXHorizontalFeedLayoutGenerator _scanTripletWithLargeLead:](self, "_scanTripletWithLargeLead:", v6);
  if (v4)
  {
    -[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v6, 1);
    if (!-[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v7, 2))
    {
      -[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v7, 1);
      -[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v8, 1);
    }
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);
  }

  return v4;
}

- (BOOL)_parseSpecialSequence
{
  _BOOL4 v3;
  char v5;

  v5 = 0;
  v3 = -[PXHorizontalFeedLayoutGenerator _parseSpecialSubsequenceWithColumnRequired:columnParsed:](self, "_parseSpecialSubsequenceWithColumnRequired:columnParsed:", 1, &v5);
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
    while (-[PXHorizontalFeedLayoutGenerator _parseSpecialSubsequenceWithColumnRequired:columnParsed:](self, "_parseSpecialSubsequenceWithColumnRequired:columnParsed:", 0, &v5));
  }
  return v3;
}

- (BOOL)_parseSpecialSubsequenceWithColumnRequired:(BOOL)a3 columnParsed:(BOOL *)a4
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
  if (-[PXHorizontalFeedLayoutGenerator _scanSpecialSequenceBlock:](self, "_scanSpecialSequenceBlock:", v14))
  {
    -[PXFeedLayoutGenerator scanState](self, "scanState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (-[PXHorizontalFeedLayoutGenerator _scanSpecialSequenceColumn:count:](self, "_scanSpecialSequenceColumn:count:", v13, &v12))
    {
      if (-[PXHorizontalFeedLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v14))
      {
        if (-[PXHorizontalFeedLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v13, v12))
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
    else if (!a3 && !-[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
    {
      v10 = -[PXHorizontalFeedLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v14);
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

- (BOOL)_scanTripletWithLargeLead:(PXTileInfo *)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalFeedLayoutGenerator.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileInfos != NULL"));

  }
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
  {
    goto LABEL_43;
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3))
  {
    if (-[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
      && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
      && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
    {
      goto LABEL_43;
    }
  }
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3))
  {
    if (-[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
      && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
      && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
    {
      goto LABEL_43;
    }
  }
  if ((-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3))
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && -[PXFeedLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[PXHorizontalFeedLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
  {
LABEL_43:
    v6 = 1;
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_scanSpecialSequenceBlock:(PXTileInfo *)a3
{
  return -[PXHorizontalFeedLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3);
}

- (BOOL)_scanSpecialSequenceColumn:(PXTileInfo *)a3 count:(int64_t *)a4
{
  void *v7;
  int64_t v8;
  BOOL v9;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 4))
  {
    v8 = 1;
  }
  else
  {
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v7);
    if (-[PXHorizontalFeedLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3)&& !-[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
    {
      v8 = 3;
    }
    else
    {
      -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v7);
      if (!-[PXHorizontalFeedLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 2)|| -[PXHorizontalFeedLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalFeedLayoutGenerator.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count >= 2"));

  }
  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (!-[PXFeedLayoutGenerator scanTile:type:](self, "scanTile:type:", a3, &v15)
    || (unint64_t)(v15 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_13:
    -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v8);
    v11 = 0;
    goto LABEL_14;
  }
  if (a4 >= 2)
  {
    v9 = a3 + 1;
    do
    {
      v10 = a3 ? v9 : 0;
      if (!-[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", v10, v15))
        goto LABEL_13;
      ++v9;
    }
    while (--v7);
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_hasLeftSuboptimalColumn
{
  void *v3;
  BOOL v4;

  -[PXFeedLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXFeedLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", 0))
    v4 = -[PXFeedLayoutGenerator isAtEnd](self, "isAtEnd");
  else
    v4 = 0;
  -[PXFeedLayoutGenerator setScanState:](self, "setScanState:", v3);

  return v4;
}

- (BOOL)_addColumnWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4
{
  uint64_t v7;
  CGFloat *p_height;
  int64_t v9;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v21 = -[PXFeedLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") > 0;
  v7 = MEMORY[0x1E0C809B0];
  if (*((_BYTE *)v19 + 24))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke;
    v17[3] = &unk_1E5147770;
    v17[4] = &v18;
    -[PXHorizontalFeedLayoutGenerator _enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, 1, v17);
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
    v11 = *((unsigned __int8 *)v19 + 24);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_2;
    v16[3] = &unk_1E5147798;
    v16[4] = &v22;
    v16[5] = a3;
    -[PXHorizontalFeedLayoutGenerator _enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v11, v16);
  }
LABEL_11:
  if (*((_BYTE *)v23 + 24))
  {
    v12 = *((unsigned __int8 *)v19 + 24);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_3;
    v15[3] = &unk_1E51477C0;
    v15[4] = self;
    v15[5] = a3;
    -[PXHorizontalFeedLayoutGenerator _enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v12, v15);
    v13 = *((_BYTE *)v23 + 24) != 0;
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)_enumerateColumnFramesWithContiguousTiles:(PXTileInfo *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6
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
  int64_t v22;
  double y;
  double x;
  double v25;
  double v26;
  CGFloat *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;

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
      v16 = v16 + *p_height / *(p_height - 1);
      p_height += 8;
      --v17;
    }
    while (v17);
  }
  -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
  v19 = (v18 - (double)(a4 - 1) * v14) / v16;
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v19);
  if (a4 >= 1)
  {
    v21 = v20;
    v22 = 0;
    x = self->_origin.x;
    y = self->_origin.y;
    v25 = -0.0;
    if (x > 0.0)
      v25 = v12;
    v26 = x + v25;
    v27 = &a3->imageSize.height;
    v28 = self->_origin.y;
    do
    {
      v29 = y + *v27 / *(v27 - 1) * v19;
      if (v22 >= a4 - 1)
        v30 = 0.0;
      else
        v30 = v14 * 0.5;
      -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", v6, v30 + v29);
      v32 = v31 - v30;
      -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
      if (v32 >= v33)
        v32 = v33;
      v34 = 0;
      v10[2](v10, v22, &v34, v26, v28, v21, v32 - v28);
      if (v34)
        break;
      y = v14 + v29;
      v28 = v14 + v32;
      ++v22;
      v27 += 8;
    }
    while (a4 != v22);
  }

}

- (BOOL)_addColumnWithTiles:(PXTileInfo *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5
{
  int64_t v5;
  PXTileInfo *v7;
  CGFloat *p_height;
  CGFloat *v10;
  int64_t v11;
  CGPoint *p_origin;
  double x;
  double y;
  double v15;
  CGSize *p_size;
  int64_t index;
  double width;
  double height;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double MaxX;
  CGRect v27;

  v5 = a5;
  v7 = a3;
  if (a5 < 2)
  {
LABEL_6:
    p_origin = &self->_origin;
    x = self->_origin.x;
    y = self->_origin.y;
    if (x > 0.0)
    {
      -[PXFeedLayoutGenerator interTileSpacing](self, "interTileSpacing");
      x = x + v15;
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
        v20 = p_size->width;
        v21 = p_size->height;
        p_size += 2;
        v22 = x + width;
        v23 = y + height;
        -[PXFeedLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 0, index, x + width, y + height, v20, v21);
        v24 = p_origin->x;
        v27.origin.x = v22;
        v27.origin.y = v23;
        v27.size.width = v20;
        v27.size.height = v21;
        MaxX = CGRectGetMaxX(v27);
        if (v24 >= MaxX)
          MaxX = v24;
        p_origin->x = MaxX;
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
  -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
  -[PXFeedLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, width * ((v10 - v9) / 3.0 / height));
  -[PXHorizontalFeedLayoutGenerator referenceHeight](self, "referenceHeight");
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
  v24 = -[PXHorizontalFeedLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", a3, v26, 3);
  if (v24)
    -[PXFeedLayoutGenerator setScanSpecialSequenceCount:](self, "setScanSpecialSequenceCount:", v5 + 1);
  return v24;
}

- (double)referenceHeight
{
  return self->_referenceHeight;
}

- (void)setReferenceHeight:(double)a3
{
  self->_referenceHeight = a3;
}

uint64_t __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke(uint64_t result, double a2, double a3, double a4, double a5, uint64_t a6, _BYTE *a7)
{
  if (a5 < 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
    *a7 = 1;
  }
  return result;
}

void __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
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

void __71__PXHorizontalFeedLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_3(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v11;
  double MaxX;
  CGRect v13;

  objc_msgSend(*(id *)(a1 + 32), "parsedFrame:type:forTileAtIndex:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + (a2 << 6)));
  v11 = *(double *)(*(_QWORD *)(a1 + 32) + 1664);
  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  MaxX = CGRectGetMaxX(v13);
  if (v11 >= MaxX)
    MaxX = v11;
  *(double *)(*(_QWORD *)(a1 + 32) + 1664) = MaxX;
}

@end
