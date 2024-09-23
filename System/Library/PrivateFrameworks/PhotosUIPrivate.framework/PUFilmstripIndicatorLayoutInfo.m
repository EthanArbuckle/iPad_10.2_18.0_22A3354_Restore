@implementation PUFilmstripIndicatorLayoutInfo

- (id)clone
{
  PUFilmstripIndicatorLayoutInfo *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  PUFilmstripIndicatorLayoutInfo *v27;
  void *v28;
  double v30;
  double v31;
  double v32;
  _BYTE v33[48];

  v3 = [PUFilmstripIndicatorLayoutInfo alloc];
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v31 = v6;
  v32 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v30 = v7;
  v9 = v8;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v11 = v10;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v13 = v12;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v17 = v16;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](v3, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v4, v14, v15, v33, v26, v32, v31, v30, v9, v11, v13, v17, v19, v21, v23, v25);

  -[PUFilmstripIndicatorLayoutInfo highlightColor](self, "highlightColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFilmstripIndicatorLayoutInfo setHighlightColor:](v27, "setHighlightColor:", v28);

  return v27;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
