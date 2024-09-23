@implementation _PXDetailsPlaybackRecord

- (void)setDesiredPlayState:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _OWORD v7[6];

  if (a3 == 1)
  {
    -[PXGridInlinePlaybackRecord bestVideoTimeRange](self, "bestVideoTimeRange");
    -[PXGridInlinePlaybackRecord geometryReference](self, "geometryReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v7[3];
    v7[1] = v7[4];
    v7[2] = v7[5];
    objc_msgSend(v4, "setBestPlaybackTimeRange:", v7);

    -[PXGridInlinePlaybackRecord geometryReference](self, "geometryReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDesiredPlayState:", 1);

  }
  else if (!a3)
  {
    -[PXGridInlinePlaybackRecord geometryReference](self, "geometryReference");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDesiredPlayState:", 0);

  }
}

- (int64_t)desiredPlayState
{
  void *v2;
  uint64_t v3;

  -[PXGridInlinePlaybackRecord geometryReference](self, "geometryReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "desiredPlayState");

  return v3 == 1;
}

- (PXTileIdentifier)tileIdentifier
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].index[1];
  *(_OWORD *)&retstr->index[3] = *(_OWORD *)&self[2].length;
  *(_OWORD *)&retstr->index[5] = v3;
  *(_OWORD *)&retstr->index[7] = *(_OWORD *)&self[2].index[3];
  retstr->index[9] = self[2].index[5];
  v4 = *(_OWORD *)&self[1].index[8];
  *(_OWORD *)&retstr->length = *(_OWORD *)&self[1].index[6];
  *(_OWORD *)&retstr->index[1] = v4;
  return self;
}

- (void)setTileIdentifier:(PXTileIdentifier *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->index[1];
  *(_OWORD *)&self->_tileIdentifier.length = *(_OWORD *)&a3->length;
  *(_OWORD *)&self->_tileIdentifier.index[1] = v3;
  v5 = *(_OWORD *)&a3->index[5];
  v4 = *(_OWORD *)&a3->index[7];
  v6 = *(_OWORD *)&a3->index[3];
  self->_tileIdentifier.index[9] = a3->index[9];
  *(_OWORD *)&self->_tileIdentifier.index[5] = v5;
  *(_OWORD *)&self->_tileIdentifier.index[7] = v4;
  *(_OWORD *)&self->_tileIdentifier.index[3] = v6;
}

@end
