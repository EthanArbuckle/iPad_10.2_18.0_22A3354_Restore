@implementation PXStoryConcreteTimelineSpec

- (PXStoryConcreteTimelineSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXStoryConcreteTimelineSpec *v7;
  PXStoryConcreteTimelineSpec *v8;
  CGSize *p_viewportSize;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double width;
  double nUpDividerWidth;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryConcreteTimelineSpec;
  v7 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v19, sel_initWithExtendedTraitCollection_options_, v6, a4);
  v8 = v7;
  if (v7)
  {
    p_viewportSize = &v7->_viewportSize;
    objc_msgSend(v6, "layoutReferenceSize");
    p_viewportSize->width = v10;
    v8->_viewportSize.height = v11;
    objc_msgSend(v6, "peripheryInsets");
    v8->_safeAreaInsets.top = v12;
    v8->_safeAreaInsets.left = v13;
    v8->_safeAreaInsets.bottom = v14;
    v8->_safeAreaInsets.right = v15;
    if ((PXSizeIsValid() & 1) != 0)
    {
      width = p_viewportSize->width;
      if (p_viewportSize->width < v8->_viewportSize.height)
        width = p_viewportSize->height;
      nUpDividerWidth = round(width / 900.0 * 4.0);
      v8->_nUpDividerWidth = nUpDividerWidth;
    }
    else
    {
      nUpDividerWidth = v8->_nUpDividerWidth;
    }
    if (nUpDividerWidth < 4.0)
      nUpDividerWidth = 4.0;
    v8->_nUpDividerWidth = nUpDividerWidth;
    v8->_layoutDirection = objc_msgSend(v6, "layoutDirection");
    v8->_allowedInlineTitles = -1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryConcreteTimelineSpec *v4;
  PXStoryConcreteTimelineSpec *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  BOOL v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  unint64_t v22;
  CMTime v24[2];
  CMTime time2;
  CMTime time1;

  v4 = (PXStoryConcreteTimelineSpec *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryConcreteTimelineSpec viewportSize](self, "viewportSize");
      v7 = v6;
      v9 = v8;
      -[PXStoryConcreteTimelineSpec viewportSize](v5, "viewportSize");
      if (v7 != v11 || v9 != v10)
        goto LABEL_21;
      -[PXStoryConcreteTimelineSpec safeAreaInsets](self, "safeAreaInsets");
      -[PXStoryConcreteTimelineSpec safeAreaInsets](v5, "safeAreaInsets");
      if (!PXEdgeInsetsEqualToEdgeInsets())
        goto LABEL_21;
      -[PXStoryConcreteTimelineSpec nUpDividerWidth](self, "nUpDividerWidth");
      v14 = v13;
      -[PXStoryConcreteTimelineSpec nUpDividerWidth](v5, "nUpDividerWidth");
      if (v14 != v15)
        goto LABEL_21;
      v16 = -[PXStoryConcreteTimelineSpec layoutDirection](self, "layoutDirection");
      if (v16 != -[PXStoryConcreteTimelineSpec layoutDirection](v5, "layoutDirection"))
        goto LABEL_21;
      -[PXStoryConcreteTimelineSpec fixedSegmentDuration](self, "fixedSegmentDuration");
      if (v5)
        -[PXStoryConcreteTimelineSpec fixedSegmentDuration](v5, "fixedSegmentDuration");
      else
        memset(v24, 0, 24);
      time1 = v24[1];
      time2 = v24[0];
      if (!CMTimeCompare(&time1, &time2)
        && (v18 = -[PXStoryConcreteTimelineSpec allowedInlineTitles](self, "allowedInlineTitles"),
            v18 == -[PXStoryConcreteTimelineSpec allowedInlineTitles](v5, "allowedInlineTitles")))
      {
        -[PXStoryConcreteTimelineSpec allowedTransitionKinds](self, "allowedTransitionKinds");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryConcreteTimelineSpec allowedTransitionKinds](v5, "allowedTransitionKinds");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToIndexSet:", v20)
          && (v21 = -[PXStoryConcreteTimelineSpec fallbackTransitionKind](self, "fallbackTransitionKind"),
              v21 == -[PXStoryConcreteTimelineSpec fallbackTransitionKind](v5, "fallbackTransitionKind")))
        {
          v22 = -[PXStoryConcreteTimelineSpec storyTransitionCurveType](self, "storyTransitionCurveType");
          v17 = v22 == -[PXStoryConcreteTimelineSpec storyTransitionCurveType](v5, "storyTransitionCurveType");
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
LABEL_21:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  -[PXStoryConcreteTimelineSpec viewportSize](self, "viewportSize");
  v5 = (uint64_t)v3 ^ (2 * (uint64_t)v4);
  -[PXStoryConcreteTimelineSpec fixedSegmentDuration](self, "fixedSegmentDuration");
  v6 = v5 ^ (4 * v11);
  -[PXStoryConcreteTimelineSpec allowedTransitionKinds](self, "allowedTransitionKinds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ (8 * objc_msgSend(v7, "hash"));

  v9 = v8 ^ (16 * -[PXStoryConcreteTimelineSpec fallbackTransitionKind](self, "fallbackTransitionKind"));
  return v9 ^ (32 * -[PXStoryConcreteTimelineSpec storyTransitionCurveType](self, "storyTransitionCurveType"));
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)nUpDividerWidth
{
  return self->_nUpDividerWidth;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (unint64_t)allowedInlineTitles
{
  return self->_allowedInlineTitles;
}

- (void)setAllowedInlineTitles:(unint64_t)a3
{
  self->_allowedInlineTitles = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (void)setFixedSegmentDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_fixedSegmentDuration.value = *(_OWORD *)&a3->var0;
  self->_fixedSegmentDuration.epoch = var3;
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (void)setAllowedTransitionKinds:(id)a3
{
  objc_storeStrong((id *)&self->_allowedTransitionKinds, a3);
}

- (char)fallbackTransitionKind
{
  return self->_fallbackTransitionKind;
}

- (void)setFallbackTransitionKind:(char)a3
{
  self->_fallbackTransitionKind = a3;
}

- (unint64_t)storyTransitionCurveType
{
  return self->_storyTransitionCurveType;
}

- (void)setStoryTransitionCurveType:(unint64_t)a3
{
  self->_storyTransitionCurveType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTransitionKinds, 0);
}

@end
