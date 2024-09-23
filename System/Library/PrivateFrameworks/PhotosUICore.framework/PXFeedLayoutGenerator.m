@implementation PXFeedLayoutGenerator

- (PXFeedLayoutGenerator)init
{
  PXFeedLayoutGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedLayoutGenerator;
  result = -[PXFeedLayoutGenerator init](&v3, sel_init);
  if (result)
    result->_roundingScale = 1.0;
  return result;
}

- (void)enumerateFramesWithBlock:(id)a3
{
  -[PXFeedLayoutGenerator setParsedFrameBlock:](self, "setParsedFrameBlock:", a3);
  -[PXFeedLayoutGenerator willParseTiles](self, "willParseTiles");
  -[PXFeedLayoutGenerator parseTiles](self, "parseTiles");
  -[PXFeedLayoutGenerator didParseTiles](self, "didParseTiles");
  -[PXFeedLayoutGenerator setParsedFrameBlock:](self, "setParsedFrameBlock:", 0);
}

- (void)parseTiles
{
  while (!-[PXFeedLayoutGenerator isAtEnd](self, "isAtEnd")
       && -[PXFeedLayoutGenerator parseNextTiles](self, "parseNextTiles")
       && !-[PXFeedLayoutGenerator shouldStop](self, "shouldStop"))
    ;
}

- (void)willParseTiles
{
  self->_cacheTailLocation = 0;
  self->_cacheHeadLocation = 0;
  -[PXFeedLayoutGenerator setScanLocation:](self, "setScanLocation:", 0);
  -[PXFeedLayoutGenerator setScannedBatchID:](self, "setScannedBatchID:", 0);
  -[PXFeedLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", 0);
}

- (BOOL)parseNextTiles
{
  -[PXFeedLayoutGenerator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PXFeedLayoutGeneratorScanState)scanState
{
  PXFeedLayoutGeneratorScanState *v3;
  void *v4;

  v3 = objc_alloc_init(PXFeedLayoutGeneratorScanState);
  -[PXFeedLayoutGeneratorScanState setScanLocation:](v3, "setScanLocation:", -[PXFeedLayoutGenerator scanLocation](self, "scanLocation"));
  -[PXFeedLayoutGenerator scannedBatchID](self, "scannedBatchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedLayoutGeneratorScanState setScannedBatchID:](v3, "setScannedBatchID:", v4);

  -[PXFeedLayoutGeneratorScanState setScannedBatchHasCaption:](v3, "setScannedBatchHasCaption:", -[PXFeedLayoutGenerator scannedBatchHasCaption](self, "scannedBatchHasCaption"));
  -[PXFeedLayoutGeneratorScanState setScanSpecialSequenceCount:](v3, "setScanSpecialSequenceCount:", -[PXFeedLayoutGenerator scanSpecialSequenceCount](self, "scanSpecialSequenceCount"));
  return v3;
}

- (void)setScanState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[PXFeedLayoutGenerator setScanLocation:](self, "setScanLocation:", objc_msgSend(v4, "scanLocation"));
  objc_msgSend(v4, "scannedBatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedLayoutGenerator setScannedBatchID:](self, "setScannedBatchID:", v5);

  -[PXFeedLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", objc_msgSend(v4, "scannedBatchHasCaption"));
  v6 = objc_msgSend(v4, "scanSpecialSequenceCount");

  -[PXFeedLayoutGenerator setScanSpecialSequenceCount:](self, "setScanSpecialSequenceCount:", v6);
}

- (BOOL)isAtEnd
{
  int64_t v3;

  v3 = -[PXFeedLayoutGenerator scanLocation](self, "scanLocation");
  return v3 >= -[PXFeedLayoutGenerator tileCount](self, "tileCount");
}

- (BOOL)scanTile:(PXTileInfo *)a3 passingTest:(id)a4
{
  _QWORD *v6;
  BOOL v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  int v17;
  char v18;
  int64_t v19;
  int v20;
  id *v21;
  BOOL v22;
  id v23;
  double (**v24)(_QWORD, _QWORD);
  double v25;
  void *v26;
  double (**v27)(_QWORD, _QWORD);
  double v28;
  void *v29;
  uint64_t (**v30)(_QWORD, _QWORD);
  void *v31;
  uint64_t (**v32)(_QWORD, _QWORD);
  void *v33;
  uint64_t v34;
  uint64_t (**v35)(_QWORD, _QWORD);
  void *v36;
  void (**v37)(_QWORD, _QWORD);
  char *v38;
  int64_t cacheTailLocation;
  uint64_t (*v40)(_QWORD *, _QWORD *);
  int v41;
  BOOL v42;
  char v44;
  void *v45;
  _QWORD v46[5];
  char v47;
  BOOL v48;
  int v49;
  __int16 v50;
  int64_t v51;
  char v52;
  _BYTE v53[7];
  _DWORD v54[2];
  int v55;
  __int16 v56;

  v6 = a4;
  if (-[PXFeedLayoutGenerator isAtEnd](self, "isAtEnd"))
  {
    v7 = 0;
  }
  else
  {
    v8 = -[PXFeedLayoutGenerator scanLocation](self, "scanLocation");
    -[PXFeedLayoutGenerator scannedBatchID](self, "scannedBatchID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = 0;
    v54[0] = 0;
    *(_DWORD *)((char *)v54 + 3) = 0;
    v10 = v8 % 20;
    v45 = v9;
    if (v8 < self->_cacheTailLocation || v8 >= self->_cacheHeadLocation)
    {
      -[PXFeedLayoutGenerator tileImageSizeBlock](self, "tileImageSizeBlock");
      v24 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = v24[2](v24, v8);
      v14 = v25;

      -[PXFeedLayoutGenerator tileMinimumSizeBlock](self, "tileMinimumSizeBlock");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        -[PXFeedLayoutGenerator tileMinimumSizeBlock](self, "tileMinimumSizeBlock");
        v27 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v15 = v27[2](v27, v8);
        v16 = v28;

      }
      else
      {
        v15 = *MEMORY[0x1E0C9D820];
        v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }

      -[PXFeedLayoutGenerator tileHasCaptionBlock](self, "tileHasCaptionBlock");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        -[PXFeedLayoutGenerator tileHasCaptionBlock](self, "tileHasCaptionBlock");
        v30 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v17 = v30[2](v30, v8);

      }
      else
      {
        v17 = 0;
      }

      -[PXFeedLayoutGenerator tileHasLikesBlock](self, "tileHasLikesBlock");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        -[PXFeedLayoutGenerator tileHasLikesBlock](self, "tileHasLikesBlock");
        v32 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44 = v32[2](v32, v8);

      }
      else
      {
        v44 = 0;
      }

      -[PXFeedLayoutGenerator tileCommentCountBlock](self, "tileCommentCountBlock");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v8 % 20;
      if (v33)
      {
        -[PXFeedLayoutGenerator tileCommentCountBlock](self, "tileCommentCountBlock");
        v35 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v19 = v35[2](v35, v8);

      }
      else
      {
        v19 = 0;
      }

      -[PXFeedLayoutGenerator tileBatchIDBlock](self, "tileBatchIDBlock");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        -[PXFeedLayoutGenerator tileBatchIDBlock](self, "tileBatchIDBlock");
        v37 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v37[2](v37, v8);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v9 = v45;
      }
      else
      {
        v23 = 0;
      }

      if (v8)
      {
        if (v9 == v23)
          v20 = 0;
        else
          v20 = objc_msgSend(v9, "isEqual:", v23) ^ 1;
      }
      else
      {
        v20 = 1;
      }
      v22 = v44;
      v38 = (char *)self + 64 * v34;
      *((_QWORD *)v38 + 3) = v8;
      *((CGFloat *)v38 + 4) = v13;
      *((CGFloat *)v38 + 5) = v14;
      *((CGFloat *)v38 + 6) = v15;
      *((CGFloat *)v38 + 7) = v16;
      v38[64] = v17;
      v38[65] = v44;
      *(_DWORD *)(v38 + 66) = 0;
      *((_WORD *)v38 + 35) = 0;
      *((_QWORD *)v38 + 9) = v19;
      v38[80] = v20;
      *(_DWORD *)(v38 + 81) = 0;
      *((_DWORD *)v38 + 21) = 0;
      objc_storeStrong(&self->_cachedBatchID[v34], v23);
      self->_cacheHeadLocation = v8 + 1;
      cacheTailLocation = self->_cacheTailLocation;
      if (v8 >= cacheTailLocation)
      {
        if (cacheTailLocation <= v8 - 19)
          cacheTailLocation = v8 - 19;
        self->_cacheTailLocation = cacheTailLocation;
      }
      else
      {
        self->_cacheTailLocation = v8;
      }
      v12 = v8;
    }
    else
    {
      v11 = (char *)self + 64 * v10;
      v12 = *((_QWORD *)v11 + 3);
      v13 = *((double *)v11 + 4);
      v14 = *((double *)v11 + 5);
      v15 = *((double *)v11 + 6);
      v16 = *((double *)v11 + 7);
      v17 = v11[64];
      v18 = v11[65];
      v55 = *(_DWORD *)(v11 + 66);
      v56 = *((_WORD *)v11 + 35);
      v19 = *((_QWORD *)v11 + 9);
      v20 = v11[80];
      *(_DWORD *)((char *)v54 + 3) = *((_DWORD *)v11 + 21);
      v54[0] = *(_DWORD *)(v11 + 81);
      v21 = (id *)(&self->super.isa + v10);
      v22 = v18;
      v23 = v21[163];
    }
    v40 = (uint64_t (*)(_QWORD *, _QWORD *))v6[2];
    v46[0] = v12;
    *(CGFloat *)&v46[1] = v13;
    *(CGFloat *)&v46[2] = v14;
    *(CGFloat *)&v46[3] = v15;
    *(CGFloat *)&v46[4] = v16;
    v47 = v17;
    v48 = v22;
    v49 = v55;
    v50 = v56;
    v51 = v19;
    v52 = v20;
    *(_DWORD *)v53 = v54[0];
    *(_DWORD *)&v53[3] = *(_DWORD *)((char *)v54 + 3);
    v41 = v40(v6, v46);
    v42 = v22;
    v7 = v41;
    if (v41)
    {
      if (a3)
      {
        a3->index = v12;
        a3->imageSize.width = v13;
        a3->imageSize.height = v14;
        a3->minimumSize.width = v15;
        a3->minimumSize.height = v16;
        a3->hasCaption = v17;
        a3->hasLikes = v42;
        *(_DWORD *)(&a3->hasLikes + 1) = v55;
        *(_WORD *)(&a3->hasLikes + 5) = v56;
        a3->commentCount = v19;
        a3->isBatchStart = v20;
        *(_DWORD *)(&a3->isBatchStart + 1) = v54[0];
        *((_DWORD *)&a3->isBatchStart + 1) = *(_DWORD *)((char *)v54 + 3);
      }
      -[PXFeedLayoutGenerator setScanLocation:](self, "setScanLocation:", v8 + 1);
      -[PXFeedLayoutGenerator setScannedBatchID:](self, "setScannedBatchID:", v23);
      if (((v17 | v20) & 1) != 0)
        -[PXFeedLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", v17 & 1);
    }

  }
  return v7;
}

- (BOOL)scanAnyTile:(PXTileInfo *)a3
{
  return -[PXFeedLayoutGenerator scanTile:passingTest:](self, "scanTile:passingTest:", a3, &__block_literal_global_83997);
}

- (BOOL)scanTileWithPortraitImage:(PXTileInfo *)a3
{
  return -[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 2);
}

- (BOOL)scanTileWithLandscapeImage:(PXTileInfo *)a3
{
  return -[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 1);
}

- (BOOL)scanTileWithHorizontalPanorama:(PXTileInfo *)a3
{
  return -[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 3);
}

- (BOOL)scanTileWithSquareImage:(PXTileInfo *)a3
{
  return -[PXFeedLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 0);
}

- (BOOL)scanTile:(PXTileInfo *)a3 type:(int64_t *)a4
{
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PXFeedLayoutGenerator_scanTile_type___block_invoke;
  v7[3] = &unk_1E51234D8;
  v7[4] = &v8;
  v5 = -[PXFeedLayoutGenerator scanTile:passingTest:](self, "scanTile:passingTest:", a3, v7);
  if (a4)
    *a4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)scanTile:(PXTileInfo *)a3 ofType:(int64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PXFeedLayoutGenerator_scanTile_ofType___block_invoke;
  v5[3] = &__block_descriptor_40_e47_B72__0_PXTileInfo_q_CGSize_dd__CGSize_dd_BBqB_8l;
  v5[4] = a4;
  return -[PXFeedLayoutGenerator scanTile:passingTest:](self, "scanTile:passingTest:", a3, v5);
}

- (CGSize)captionSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  double (**v9)(_QWORD, _QWORD, double, double);
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[PXFeedLayoutGenerator tileCaptionSizeBlock](self, "tileCaptionSizeBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXFeedLayoutGenerator tileCaptionSizeBlock](self, "tileCaptionSizeBlock");
    v9 = (double (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    width = v9[2](v9, a3, width, height);
    height = v10;

  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)likesSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  double (**v9)(_QWORD, _QWORD, double, double);
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[PXFeedLayoutGenerator tileLikesSizeBlock](self, "tileLikesSizeBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXFeedLayoutGenerator tileLikesSizeBlock](self, "tileLikesSizeBlock");
    v9 = (double (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    width = v9[2](v9, a3, width, height);
    height = v10;

  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)commentSizeForTileAtIndex:(int64_t)a3 commentIndex:(int64_t)a4 proposedSize:(CGSize)a5
{
  double height;
  double width;
  void *v10;
  double (**v11)(_QWORD, _QWORD, _QWORD, double, double);
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a5.height;
  width = a5.width;
  -[PXFeedLayoutGenerator tileCommentSizeBlock](self, "tileCommentSizeBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXFeedLayoutGenerator tileCommentSizeBlock](self, "tileCommentSizeBlock");
    v11 = (double (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    width = v11[2](v11, a3, a4, width, height);
    height = v12;

  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)parsedFrame:(CGRect)a3 type:(int64_t)a4 forTileAtIndex:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double);
  char v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXFeedLayoutGenerator parsedFrameBlock](self, "parsedFrameBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v14 = 0;
    -[PXFeedLayoutGenerator parsedFrameBlock](self, "parsedFrameBlock");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, int64_t, int64_t, char *, double, double, double, double))v13)[2](v13, a5, a4, &v14, x, y, width, height);

    if (v14)
      -[PXFeedLayoutGenerator setShouldStop:](self, "setShouldStop:", 1);
  }
}

- (double)valueByRounding:(double)a3 usingMagneticGuidelines:(BOOL)a4
{
  double v6;
  double v7;
  int64_t v8;
  double v9;

  if (a4 && -[PXFeedLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") >= 1)
  {
    -[PXFeedLayoutGenerator referenceDistanceForMagneticGuidelines](self, "referenceDistanceForMagneticGuidelines");
    v7 = v6;
    v8 = -[PXFeedLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") + 1;
    a3 = v7 / (double)v8 * round(a3 / (v7 / (double)v8));
  }
  -[PXFeedLayoutGenerator roundingScale](self, "roundingScale");
  return round(a3 * v9) / v9;
}

- (int64_t)tileCount
{
  return self->_tileCount;
}

- (void)setTileCount:(int64_t)a3
{
  self->_tileCount = a3;
}

- (CGSize)interTileSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interTileSpacing.width;
  height = self->_interTileSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterTileSpacing:(CGSize)a3
{
  self->_interTileSpacing = a3;
}

- (id)tileImageSizeBlock
{
  return self->_tileImageSizeBlock;
}

- (void)setTileImageSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (id)tileMinimumSizeBlock
{
  return self->_tileMinimumSizeBlock;
}

- (void)setTileMinimumSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (UIEdgeInsets)captionPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_captionPadding.top;
  left = self->_captionPadding.left;
  bottom = self->_captionPadding.bottom;
  right = self->_captionPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCaptionPadding:(UIEdgeInsets)a3
{
  self->_captionPadding = a3;
}

- (CGSize)noCaptionSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_noCaptionSpacing.width;
  height = self->_noCaptionSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNoCaptionSpacing:(CGSize)a3
{
  self->_noCaptionSpacing = a3;
}

- (id)tileHasCaptionBlock
{
  return self->_tileHasCaptionBlock;
}

- (void)setTileHasCaptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1496);
}

- (id)tileCaptionSizeBlock
{
  return self->_tileCaptionSizeBlock;
}

- (void)setTileCaptionSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1504);
}

- (id)tileHasLikesBlock
{
  return self->_tileHasLikesBlock;
}

- (void)setTileHasLikesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1512);
}

- (id)tileLikesSizeBlock
{
  return self->_tileLikesSizeBlock;
}

- (void)setTileLikesSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1520);
}

- (id)tileCommentCountBlock
{
  return self->_tileCommentCountBlock;
}

- (void)setTileCommentCountBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1528);
}

- (id)tileCommentSizeBlock
{
  return self->_tileCommentSizeBlock;
}

- (void)setTileCommentSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1536);
}

- (id)tileBatchIDBlock
{
  return self->_tileBatchIDBlock;
}

- (void)setTileBatchIDBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1544);
}

- (int64_t)numberOfMagneticGuidelines
{
  return self->_numberOfMagneticGuidelines;
}

- (void)setNumberOfMagneticGuidelines:(int64_t)a3
{
  self->_numberOfMagneticGuidelines = a3;
}

- (double)roundingScale
{
  return self->_roundingScale;
}

- (void)setRoundingScale:(double)a3
{
  self->_roundingScale = a3;
}

- (id)parsedFrameBlock
{
  return self->_parsedFrameBlock;
}

- (void)setParsedFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1568);
}

- (int64_t)scanLocation
{
  return self->_scanLocation;
}

- (void)setScanLocation:(int64_t)a3
{
  self->_scanLocation = a3;
}

- (id)scannedBatchID
{
  return self->_scannedBatchID;
}

- (void)setScannedBatchID:(id)a3
{
  objc_storeStrong(&self->_scannedBatchID, a3);
}

- (BOOL)scannedBatchHasCaption
{
  return self->_scannedBatchHasCaption;
}

- (void)setScannedBatchHasCaption:(BOOL)a3
{
  self->_scannedBatchHasCaption = a3;
}

- (int64_t)scanSpecialSequenceCount
{
  return self->_scanSpecialSequenceCount;
}

- (void)setScanSpecialSequenceCount:(int64_t)a3
{
  self->_scanSpecialSequenceCount = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  id *v4;

  objc_storeStrong(&self->_scannedBatchID, 0);
  objc_storeStrong(&self->_parsedFrameBlock, 0);
  objc_storeStrong(&self->_tileBatchIDBlock, 0);
  objc_storeStrong(&self->_tileCommentSizeBlock, 0);
  objc_storeStrong(&self->_tileCommentCountBlock, 0);
  objc_storeStrong(&self->_tileLikesSizeBlock, 0);
  objc_storeStrong(&self->_tileHasLikesBlock, 0);
  objc_storeStrong(&self->_tileCaptionSizeBlock, 0);
  objc_storeStrong(&self->_tileHasCaptionBlock, 0);
  objc_storeStrong(&self->_tileMinimumSizeBlock, 0);
  objc_storeStrong(&self->_tileImageSizeBlock, 0);
  v3 = 0;
  v4 = &self->_cachedBatchID[19];
  do
    objc_storeStrong(&v4[v3--], 0);
  while (v3 != -20);
}

BOOL __41__PXFeedLayoutGenerator_scanTile_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;

  v2 = *(double *)(a2 + 8) / *(double *)(a2 + 16);
  if (v2 >= 2.5)
  {
    v3 = 3;
  }
  else if (v2 <= 1.04999995)
  {
    if (v2 >= 0.952380996)
    {
      v3 = 0;
    }
    else
    {
      v3 = 4;
      if (v2 > 0.4)
        v3 = 2;
    }
  }
  else
  {
    v3 = 1;
  }
  return v3 == *(_QWORD *)(a1 + 32);
}

uint64_t __39__PXFeedLayoutGenerator_scanTile_type___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;

  v2 = *(double *)(a2 + 8) / *(double *)(a2 + 16);
  if (v2 >= 2.5)
  {
    v3 = 3;
  }
  else if (v2 <= 1.04999995)
  {
    if (v2 >= 0.952380996)
    {
      v3 = 0;
    }
    else
    {
      v3 = 4;
      if (v2 > 0.4)
        v3 = 2;
    }
  }
  else
  {
    v3 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

uint64_t __37__PXFeedLayoutGenerator_scanAnyTile___block_invoke()
{
  return 1;
}

@end
