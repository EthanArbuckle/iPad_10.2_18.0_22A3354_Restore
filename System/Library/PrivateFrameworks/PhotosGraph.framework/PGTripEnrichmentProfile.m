@implementation PGTripEnrichmentProfile

- (id)identifier
{
  return CFSTR("Trips Enrichment Profile");
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  objc_msgSend(a3, "type");
  JUMPOUT(0x1CAA4E40CLL);
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v18;

  v9 = a3;
  objc_msgSend(v9, "highlightNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "highlightTailorContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "titleGenerationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[PGTripTitleGenerator titleTupleForDayHighlightGroupNode:locationHelper:error:](PGTripTitleGenerator, "titleTupleForDayHighlightGroupNode:locationHelper:error:", v10, v13, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;

  if (v14)
  {
    v16 = v14;
  }
  else if (a8)
  {
    *a8 = objc_retainAutorelease(v15);
  }

  return v14;
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  PGCurationOptions *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 14);
  -[PGCurationOptions setLastPassMovieAdditionEnabled:](v6, "setLastPassMovieAdditionEnabled:", 0);
  -[PGCurationOptions setSharingFilter:](v6, "setSharingFilter:", v4);
  -[PGCurationOptions setUseDurationBasedCuration:](v6, "setUseDurationBasedCuration:", 1);
  -[PGCurationOptions setMinimumDuration:](v6, "setMinimumDuration:", 0.0);
  +[PGDefaultEnrichmentProfile targetCurationDurationWithHighlightInfo:sharingFilter:options:](PGDefaultEnrichmentProfile, "targetCurationDurationWithHighlightInfo:sharingFilter:options:", v5, v4, v6);
  -[PGCurationOptions setTargetDuration:](v6, "setTargetDuration:");
  -[PGCurationOptions setFailIfMinimumDurationNotReached:](v6, "setFailIfMinimumDurationNotReached:", 0);
  -[PGCurationOptions setSemanticalDedupingEnabled:](v6, "setSemanticalDedupingEnabled:", 1);
  -[PGCurationOptions setMovieDedupingEnabled:](v6, "setMovieDedupingEnabled:", 1);
  objc_msgSend(v5, "uuidsOfRequiredAssetsForSharingFilter:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    -[PGCurationOptions setUuidsOfRequiredAssets:](v6, "setUuidsOfRequiredAssets:", v7);

  return v6;
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "highlightNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "numberOfExtendedAssets");
  objc_msgSend(v3, "highlightTailorContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "neighborScoreComputer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightNode promotionScoreWithHighlightNode:enrichmentState:numberOfExtendedAssets:neighborScoreComputer:](PGGraphHighlightNode, "promotionScoreWithHighlightNode:enrichmentState:numberOfExtendedAssets:neighborScoreComputer:", v4, 4, v5, v7);
  v9 = v8;

  return v9;
}

@end
