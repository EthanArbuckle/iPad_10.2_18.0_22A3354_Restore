@implementation PXStoryConcreteTimelineParser

- (PXStoryConcreteTimelineParser)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineParser.m"), 39, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteTimelineParser init]");

  abort();
}

- (PXStoryConcreteTimelineParser)initWithConfiguration:(id)a3
{
  id v4;
  PXStoryConcreteTimelineParser *v5;
  PXStoryConcreteSubtimelineScanner *v6;
  PXStoryConcreteSubtimelineScanner *scanner;
  uint64_t v8;
  PXStoryResourcesDataSource *resourcesDataSource;
  void *v10;
  uint64_t v11;
  NSIndexSet *allowedTransitionKinds;
  void *v13;
  uint64_t v14;
  PFRandomNumberGenerator *randomNumberGenerator;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  NSObject *v21;
  void (**v22)(void);
  uint64_t v23;
  PXStoryMutableConcreteTimeline *accumulatedBestTimeline;
  uint64_t v25;
  PXStoryMutableConcreteTimeline *nextBestTimeline;
  uint64_t v27;
  PXStoryMutableConcreteTimeline *candidateAccumulatedTimelineWithNextBestTimeline;
  void *v30;
  _QWORD aBlock[4];
  id v32;
  CGFloat v33;
  CGFloat v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;
  CGSize v39;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PXStoryConcreteTimelineParser;
  v5 = -[PXStoryConcreteTimelineParser init](&v35, sel_init);
  if (v5)
  {
    v6 = -[PXStoryConcreteSubtimelineScanner initWithConfiguration:]([PXStoryConcreteSubtimelineScanner alloc], "initWithConfiguration:", v4);
    scanner = v5->_scanner;
    v5->_scanner = v6;

    objc_msgSend(v4, "resourcesDataSource");
    v8 = objc_claimAutoreleasedReturnValue();
    resourcesDataSource = v5->_resourcesDataSource;
    v5->_resourcesDataSource = (PXStoryResourcesDataSource *)v8;

    v5->_preferredInitialDisplayAssetResourceIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allowedTransitionKinds");
    v11 = objc_claimAutoreleasedReturnValue();
    allowedTransitionKinds = v5->_allowedTransitionKinds;
    v5->_allowedTransitionKinds = (NSIndexSet *)v11;

    objc_msgSend(v4, "spec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fallbackTransitionKind = objc_msgSend(v13, "fallbackTransitionKind");

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75238]), "initWithSeed:", 0);
    randomNumberGenerator = v5->_randomNumberGenerator;
    v5->_randomNumberGenerator = (PFRandomNumberGenerator *)v14;

    objc_msgSend(v4, "spec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewportSize");
    v18 = v17;
    v20 = v19;

    if ((PXSizeIsEmpty() & 1) != 0 || (PXSizeIsValid() & 1) == 0)
    {
      PXAssertGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v39.width = v18;
        v39.height = v20;
        NSStringFromCGSize(v39);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_fault_impl(&dword_1A6789000, v21, OS_LOG_TYPE_FAULT, "invalid viewport size %@", buf, 0xCu);

      }
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PXStoryConcreteTimelineParser_initWithConfiguration___block_invoke;
    aBlock[3] = &unk_1E51312E0;
    v33 = v18;
    v34 = v20;
    v32 = v4;
    v22 = (void (**)(void))_Block_copy(aBlock);
    v22[2]();
    v23 = objc_claimAutoreleasedReturnValue();
    accumulatedBestTimeline = v5->_accumulatedBestTimeline;
    v5->_accumulatedBestTimeline = (PXStoryMutableConcreteTimeline *)v23;

    ((void (*)(void (**)(void)))v22[2])(v22);
    v25 = objc_claimAutoreleasedReturnValue();
    nextBestTimeline = v5->_nextBestTimeline;
    v5->_nextBestTimeline = (PXStoryMutableConcreteTimeline *)v25;

    ((void (*)(void (**)(void)))v22[2])(v22);
    v27 = objc_claimAutoreleasedReturnValue();
    candidateAccumulatedTimelineWithNextBestTimeline = v5->_candidateAccumulatedTimelineWithNextBestTimeline;
    v5->_candidateAccumulatedTimelineWithNextBestTimeline = (PXStoryMutableConcreteTimeline *)v27;

  }
  return v5;
}

- (id)parseNextBestTimeline
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, _QWORD);
  char v18;
  char v19;
  PXStoryMutableConcreteTimeline *accumulatedBestTimeline;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  PXStoryMutableConcreteTimeline *v26;
  double v27;
  PXStoryMutableConcreteTimeline *nextBestTimeline;
  void *v30;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v36;
  _OWORD v37[3];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[4];
  id v41;
  PXStoryConcreteTimelineParser *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[4];
  id v47;
  PXStoryConcreteTimelineParser *v48;
  SEL v49;
  uint8_t buf[16];
  __int128 v51;
  __int128 v52;

  -[PXStoryConcreteTimelineParser scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteTimelineParser parseTimeLimit](self, "parseTimeLimit");
  v5 = v4;
  if (v4 <= 0.0)
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v9 = -[PXStoryConcreteTimelineParser parseCountLimit](self, "parseCountLimit");
  v10 = v9;
  if (v9 >= 1)
    v11 = v9;
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = -[PXStoryConcreteTimelineParser preferredInitialDisplayAssetResourceIndex](self, "preferredInitialDisplayAssetResourceIndex");
  v13 = 0;
  v14 = v10 <= 0 && v5 <= 0.0;
  v15 = MEMORY[0x1E0C809B0];
  if (!v14)
  {
    v16 = v12;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v36 = v12 - 1;
      if (v12 >= 1)
      {
        if (objc_msgSend(v3, "isAtBeginning") && (objc_msgSend(v3, "isAtEnd") & 1) == 0)
        {
          v51 = 0u;
          v52 = 0u;
          *(_OWORD *)buf = 0u;
          if (v3)
            objc_msgSend(v3, "scanState");
          aBlock[0] = v15;
          aBlock[1] = 3221225472;
          aBlock[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke;
          aBlock[3] = &unk_1E5131330;
          v34 = v3;
          v47 = v34;
          v48 = self;
          v49 = a2;
          v17 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
          v17[2](v17, v16);
          v18 = 1;
          do
          {
            v19 = v18;
            accumulatedBestTimeline = self->_accumulatedBestTimeline;
            -[PXStoryConcreteTimelineParser resourcesDataSource](self, "resourcesDataSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXStoryConcreteTimeline indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:](accumulatedBestTimeline, "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", 1, v21, -[PXStoryBaseTimeline lastSegmentIdentifier](self->_accumulatedBestTimeline, "lastSegmentIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "lastIndex");

            if (v23 == v36)
              break;
            v17[2](v17, 1);
            v18 = 0;
          }
          while ((v19 & 1) != 0);
          v40[0] = v15;
          v40[1] = 3221225472;
          v40[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_3;
          v40[3] = &unk_1E513CEF0;
          v24 = v34;
          v43 = *(_OWORD *)buf;
          v44 = v51;
          v45 = v52;
          v41 = v24;
          v42 = self;
          v13 = (void (**)(_QWORD))_Block_copy(v40);

        }
        else
        {
          v13 = 0;
        }
      }
    }
  }
  v25 = 1;
  do
  {
    if ((objc_msgSend(v3, "isAtEnd") & 1) != 0)
      break;
    v26 = self->_accumulatedBestTimeline;
    v39[0] = v15;
    v39[1] = 3221225472;
    v39[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_4;
    v39[3] = &unk_1E5131308;
    v39[4] = self;
    if ((objc_msgSend(v3, "scanBestSubtimelineFollowingTimeline:loggingOptions:resultHandler:", v26, 0, v39) & 1) == 0)
    {
      PLStoryGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "failed to scan next subtimeline", buf, 2u);
      }

      objc_msgSend(v3, "scanBestSubtimelineFollowingTimeline:loggingOptions:resultHandler:", self->_accumulatedBestTimeline, 1, &__block_literal_global_170341);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineParser.m"), 111, CFSTR("couldn't scan next subtimeline"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  }
  while (v27 < v8 && v25++ < v11);
  if (objc_msgSend(v3, "isAtEnd"))
  {
    nextBestTimeline = self->_accumulatedBestTimeline;
  }
  else
  {
    -[PXStoryMutableConcreteTimeline setTimeline:](self->_nextBestTimeline, "setTimeline:", self->_accumulatedBestTimeline);
    v51 = 0u;
    v52 = 0u;
    *(_OWORD *)buf = 0u;
    if (v3)
      objc_msgSend(v3, "scanState");
    v38[0] = v15;
    v38[1] = 3221225472;
    v38[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2_16;
    v38[3] = &unk_1E5131308;
    v38[4] = self;
    objc_msgSend(v3, "scanFastestSubtimelineWithRemainingClipsResultHandler:", v38);
    v37[0] = *(_OWORD *)buf;
    v37[1] = v51;
    v37[2] = v52;
    objc_msgSend(v3, "setScanState:", v37);
    nextBestTimeline = self->_nextBestTimeline;
  }
  v30 = (void *)-[PXStoryMutableConcreteTimeline copy](nextBestTimeline, "copy");
  if (v13)
    v13[2](v13);

  return v30;
}

- (BOOL)isAtEnd
{
  void *v2;
  char v3;

  -[PXStoryConcreteTimelineParser scanner](self, "scanner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAtEnd");

  return v3;
}

- (void)_adjustTimeline:(id)a3 andAppendTimeline:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  PXStoryMutableConcreteTimeline *candidateAccumulatedTimelineWithNextBestTimeline;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double (*v16)(uint64_t, uint64_t);
  void *v17;
  PXStoryConcreteTimelineParser *v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[9];
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfSegments") >= 1 && objc_msgSend(v7, "numberOfSegments") >= 1)
  {
    -[PXStoryMutableConcreteTimeline setTimeline:](self->_candidateAccumulatedTimelineWithNextBestTimeline, "setTimeline:", v6);
    v8 = -[PXStoryBaseTimeline lastSegmentIdentifier](self->_candidateAccumulatedTimelineWithNextBestTimeline, "lastSegmentIdentifier");
    -[PXStoryMutableConcreteTimeline appendTimeline:](self->_candidateAccumulatedTimelineWithNextBestTimeline, "appendTimeline:", v7);
    v9 = -[PXStoryConcreteTimeline identifierForSegmentAtIndex:](self->_candidateAccumulatedTimelineWithNextBestTimeline, "identifierForSegmentAtIndex:", objc_msgSend(v6, "numberOfSegments"));
    v29 = 0;
    v27 = 0u;
    memset(v28, 0, sizeof(v28));
    v25 = 0u;
    v26 = 0u;
    candidateAccumulatedTimelineWithNextBestTimeline = self->_candidateAccumulatedTimelineWithNextBestTimeline;
    if (candidateAccumulatedTimelineWithNextBestTimeline)
    {
      -[PXStoryConcreteTimeline infoForSegmentWithIdentifier:](candidateAccumulatedTimelineWithNextBestTimeline, "infoForSegmentWithIdentifier:", v8);
      v11 = v28[0];
    }
    else
    {
      v11 = 0;
    }
    v23 = *(_OWORD *)((char *)v28 + 4);
    v24 = *(_QWORD *)((char *)&v28[1] + 4);
    -[PXStoryConcreteTimelineParser allowedTransitionKinds](self, "allowedTransitionKinds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") && !objc_msgSend(v12, "containsIndex:", v11)
      || !+[PXStoryTransitionProducer isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:](PXStoryTransitionProducer, "isSupportedTransitionWithKind:fromSegmentIdentifier:toSegmentIdentifier:inTimeline:", v11, v8, v9, self->_candidateAccumulatedTimelineWithNextBestTimeline))
    {
      v13 = objc_msgSend(v6, "numberOfSegments") - 1;
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __67__PXStoryConcreteTimelineParser__adjustTimeline_andAppendTimeline___block_invoke;
      v17 = &unk_1E5131398;
      v18 = self;
      v19 = v12;
      v22 = v11;
      v20 = v23;
      v21 = v24;
      objc_msgSend(v6, "modifyInfoForSegmentAtIndex:usingBlock:", v13, &v14);

    }
  }
  objc_msgSend(v6, "appendTimeline:", v7, v14, v15, v16, v17, v18);

}

- (int64_t)preferredInitialDisplayAssetResourceIndex
{
  return self->_preferredInitialDisplayAssetResourceIndex;
}

- (void)setPreferredInitialDisplayAssetResourceIndex:(int64_t)a3
{
  self->_preferredInitialDisplayAssetResourceIndex = a3;
}

- (double)parseTimeLimit
{
  return self->_parseTimeLimit;
}

- (void)setParseTimeLimit:(double)a3
{
  self->_parseTimeLimit = a3;
}

- (int64_t)parseCountLimit
{
  return self->_parseCountLimit;
}

- (void)setParseCountLimit:(int64_t)a3
{
  self->_parseCountLimit = a3;
}

- (PXStoryConcreteSubtimelineScanner)scanner
{
  return self->_scanner;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (char)fallbackTransitionKind
{
  return self->_fallbackTransitionKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTransitionKinds, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_candidateAccumulatedTimelineWithNextBestTimeline, 0);
  objc_storeStrong((id *)&self->_nextBestTimeline, 0);
  objc_storeStrong((id *)&self->_accumulatedBestTimeline, 0);
}

double __67__PXStoryConcreteTimelineParser__adjustTimeline_andAppendTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTime *v4;
  int v5;
  char v6;
  double result;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime v11;
  CMTime rhs;
  CMTime lhs;

  v4 = (CMTime *)(a2 + 112);
  v11 = *(CMTime *)(a2 + 112);
  v10 = *(CMTime *)(a2 + 136);
  v5 = objc_msgSend(*(id *)(a1 + 32), "fallbackTransitionKind");
  if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v5) & 1) != 0)
  {
    *(_QWORD *)(a2 + 68) = 0;
    *(_OWORD *)(a2 + 52) = PXStoryTimeZero;
    v6 = v5;
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "px_indexAtPosition:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "nextUnsignedIntegerLessThan:", objc_msgSend(*(id *)(a1 + 40), "count")));
  }
  *(_BYTE *)(a2 + 48) = v6;
  *(_BYTE *)(a2 + 76) = *(_BYTE *)(a1 + 72);
  lhs = v11;
  rhs = *(CMTime *)(a1 + 48);
  CMTimeAdd(&v8, &lhs, &rhs);
  rhs = v10;
  lhs = v8;
  CMTimeMaximum(&v9, &lhs, &rhs);
  result = *(double *)&v9.value;
  *v4 = v9;
  return result;
}

void __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2;
  v5[3] = &unk_1E5131308;
  v3 = (void *)a1[4];
  v5[4] = a1[5];
  if ((objc_msgSend(v3, "scanFastestSubtimelineWithDisplayAssetResourceCount:resultHandler:", a2, v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[5], CFSTR("PXStoryConcreteTimelineParser.m"), 85, CFSTR("failed to scan up to preferred initial position"));

  }
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_3(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "setScanState:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setPreferredInitialDisplayAssetResourceIndex:", 0x7FFFFFFFFFFFFFFFLL);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeAllClipsAndSegments");
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustTimeline:andAppendTimeline:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2_16(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appendTimeline:", a2);
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appendTimeline:", a2);
}

PXStoryMutableConcreteTimeline *__55__PXStoryConcreteTimelineParser_initWithConfiguration___block_invoke(uint64_t a1)
{
  PXStoryMutableConcreteTimeline *v2;
  void *v3;
  PXStoryMutableConcreteTimeline *v4;

  v2 = [PXStoryMutableConcreteTimeline alloc];
  objc_msgSend(*(id *)(a1 + 32), "resourcesDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](v2, "initWithSize:resourcesDataSource:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v4;
}

@end
