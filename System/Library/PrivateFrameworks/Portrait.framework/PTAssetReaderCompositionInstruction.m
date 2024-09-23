@implementation PTAssetReaderCompositionInstruction

- (BOOL)enablePostProcessing
{
  return 0;
}

- (BOOL)containsTweening
{
  return 1;
}

- (int)passthroughTrackID
{
  return 0;
}

- (NSArray)requiredSourceTrackIDs
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PTAssetReaderCompositionInstruction videTrackID](self, "videTrackID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PTAssetReaderCompositionInstruction auxvTrackID](self, "auxvTrackID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (int)videTrackID
{
  return self->_videTrackID;
}

- (void)setVideTrackID:(int)a3
{
  self->_videTrackID = a3;
}

- (int)auxvTrackID
{
  return self->_auxvTrackID;
}

- (void)setAuxvTrackID:(int)a3
{
  self->_auxvTrackID = a3;
}

- (PTAssetReader)assetReader
{
  return (PTAssetReader *)objc_loadWeakRetained((id *)&self->_assetReader);
}

- (void)setAssetReader:(id)a3
{
  objc_storeWeak((id *)&self->_assetReader, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetReader);
}

@end
