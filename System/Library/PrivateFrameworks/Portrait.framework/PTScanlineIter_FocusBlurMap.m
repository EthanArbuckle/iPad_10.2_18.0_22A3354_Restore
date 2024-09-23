@implementation PTScanlineIter_FocusBlurMap

- (PTScanlineIter_FocusBlurMap)initWithMask:(id)a3
{
  id v5;
  PTScanlineIter_FocusBlurMap *v6;
  PTScanlineIter_FocusBlurMap *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTScanlineIter_FocusBlurMap;
  v6 = -[PTScanlineIter_FocusBlurMap init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mask, a3);
    -[PTScanlineIter_FocusBlurMap reset](v7, "reset");
  }

  return v7;
}

- (_NSRange)nextRangeY
{
  NSUInteger v2;
  NSUInteger v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  if (self->_currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "tileYForTile:", self->_currentTile);

    v7 = -[PTScanlineMask_FocusBlurMap pixelRangeForTileRangeY:](self->_mask, "pixelRangeForTileRangeY:", v6, 1);
    v9 = v8;
    -[PTScanlineIter_FocusBlurMap _advanceToNextTileRow](self, "_advanceToNextTileRow");
    v2 = v7;
    v3 = v9;
  }
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)nextRangeX
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  if (self->_currentTile == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tileYForTile:", self->_currentTile);
  -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tileYForTile:", self->_currentTileRow);

  if (v4 != v6)
  {
LABEL_4:
    v12 = 0;
    v13 = 0;
  }
  else
  {
    -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "tileXForTile:", self->_currentTile);

    v9 = -[PTScanlineMask_FocusBlurMap pixelRangeForTileRangeX:](self->_mask, "pixelRangeForTileRangeX:", v8, 1);
    v11 = v10;
    -[PTScanlineIter_FocusBlurMap _advanceToNextTile](self, "_advanceToNextTile");
    v12 = v9;
    v13 = v11;
  }
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)resetX
{
  unint64_t currentTileRow;

  currentTileRow = self->_currentTileRow;
  if (currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PTScanlineIter_FocusBlurMap reset](self, "reset");
    currentTileRow = self->_currentTileRow;
  }
  self->_currentTile = currentTileRow;
}

- (void)reset
{
  void *v3;

  -[PTScanlineMask_FocusBlurMap region](self->_mask, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentTileRow = objc_msgSend(v3, "firstIndex");

  self->_currentTile = self->_currentTileRow;
}

- (void)_advanceToNextTileRow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PTScanlineIter_FocusBlurMap reset](self, "reset");
  }
  else
  {
    -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tileYForTile:", self->_currentTileRow);

    do
    {
      -[PTScanlineMask_FocusBlurMap region](self->_mask, "region");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_currentTileRow = objc_msgSend(v5, "indexGreaterThanIndex:", self->_currentTileRow);

      if (self->_currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
        break;
      -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "tileYForTile:", self->_currentTileRow);

    }
    while (v7 == v4);
  }
}

- (void)_advanceToNextTile
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (self->_currentTile == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PTScanlineIter_FocusBlurMap resetX](self, "resetX");
  }
  else
  {
    -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tileYForTile:", self->_currentTile);
    -[PTScanlineMask_FocusBlurMap map](self->_mask, "map");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "tileYForTile:", self->_currentTileRow);

    if (v4 == v6)
    {
      -[PTScanlineMask_FocusBlurMap region](self->_mask, "region");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      self->_currentTile = objc_msgSend(v7, "indexGreaterThanIndex:", self->_currentTile);

    }
  }
}

- (PTScanlineMask_FocusBlurMap)mask
{
  return (PTScanlineMask_FocusBlurMap *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)currentTileRow
{
  return self->_currentTileRow;
}

- (void)setCurrentTileRow:(unint64_t)a3
{
  self->_currentTileRow = a3;
}

- (unint64_t)currentTile
{
  return self->_currentTile;
}

- (void)setCurrentTile:(unint64_t)a3
{
  self->_currentTile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
}

@end
