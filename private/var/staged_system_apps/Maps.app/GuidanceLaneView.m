@implementation GuidanceLaneView

- (GuidanceLaneView)initWithLaneInfo:(id)a3 maneuverHasPreferredLane:(BOOL)a4 drawingBiasDirection:(unint64_t)a5 laneStyle:(unint64_t)a6
{
  id v11;
  GuidanceLaneView *v12;
  GuidanceLaneView *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIColor *invalidArrowColor;
  objc_super v22;

  v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GuidanceLaneView;
  v12 = -[GuidanceLaneView initWithFrame:](&v22, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v13 = v12;
  if (v12)
  {
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[GuidanceLaneView setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", v16);

    -[GuidanceLaneView setClearsContextBeforeDrawing:](v13, "setClearsContextBeforeDrawing:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[GuidanceLaneView setBackgroundColor:](v13, "setBackgroundColor:", v17);

    -[GuidanceLaneView setOpaque:](v13, "setOpaque:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceLaneView layer](v13, "layer"));
    objc_msgSend(v18, "setNeedsDisplayOnBoundsChange:", 1);

    objc_storeStrong((id *)&v13->_laneInfo, a3);
    v13->_maneuverHasPreferredLane = a4;
    v13->_drawingBiasDirection = a5;
    v13->_laneStyle = a6;
    v13->_drawingScale = 1.0;
    v19 = objc_claimAutoreleasedReturnValue(-[GuidanceLaneView _defaultInvalidArrowColor](v13, "_defaultInvalidArrowColor"));
    invalidArrowColor = v13->_invalidArrowColor;
    v13->_invalidArrowColor = (UIColor *)v19;

    -[GuidanceLaneView _updateLanePaths](v13, "_updateLanePaths");
  }

  return v13;
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)setLaneStyle:(unint64_t)a3
{
  if (self->_laneStyle != a3)
  {
    self->_laneStyle = a3;
    -[GuidanceLaneView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setDrawingScale:(double)a3
{
  if (self->_drawingScale != a3)
  {
    self->_drawingScale = a3;
    -[GuidanceLaneView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setVerticalOffset:(double)a3
{
  if (self->_verticalOffset != a3)
  {
    self->_verticalOffset = a3;
    -[GuidanceLaneView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setInvalidArrowColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (v5 && self->_invalidArrowColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_invalidArrowColor, a3);
    -[GuidanceLaneView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)_removeUnusedUTurns
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  GuidanceLaneView *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteLaneInfo directions](self->_laneInfo, "directions"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 >= 2)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteLaneInfo directions](self->_laneInfo, "directions"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (!v6)
    {
LABEL_40:

      return;
    }
    v7 = v6;
    v26 = self;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v12);
        if (objc_msgSend(v13, "direction", v26) == 16
          || objc_msgSend(v13, "direction") == 256)
        {
          v8 = 1;
        }
        else if ((MKLaneDirectionIsToTheLeft(objc_msgSend(v13, "direction")) & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          v14 = objc_msgSend(v13, "direction");
          v16 = (v14 - 16 > 0x30 || ((1 << (v14 - 16)) & 0x1000000010001) == 0) && v14 >= 2;
          if (v16 && v14 != 128)
            v9 = 1;
        }
        v12 = (char *)v12 + 1;
      }
      while (v7 != v12);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v7 = v17;
    }
    while (v17);

    if ((v8 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteLaneInfo directions](v26->_laneInfo, "directions"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

      if (!-[GuidanceLaneView _highlightFirstDirection](v26, "_highlightFirstDirection")
        || objc_msgSend(v5, "direction") != 16 && objc_msgSend(v5, "direction") != 256)
      {
        v19 = objc_opt_new(NSMutableArray);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteLaneInfo directions](v26->_laneInfo, "directions"));
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(_QWORD *)v28 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
              if (((objc_msgSend(v25, "direction") == 16) & v10) == 0
                && ((objc_msgSend(v25, "direction") == 256) & v9) == 0)
              {
                -[NSMutableArray addObject:](v19, "addObject:", v25);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v22);
        }

        -[GEOComposedRouteLaneInfo setDirections:](v26->_laneInfo, "setDirections:", v19);
      }
      goto LABEL_40;
    }
  }
}

- (void)_updateLanePaths
{
  _BOOL8 v3;
  id v4;
  GEOComposedRouteLaneInfo *laneInfo;
  unint64_t drawingBiasDirection;
  uint64_t v7;
  NSArray *v8;
  NSArray *allPaths;
  _OWORD v10[5];
  __int128 v11;
  __int128 v12;
  _OWORD v13[14];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v3 = -[GuidanceLaneView _highlightFirstDirection](self, "_highlightFirstDirection");
  v4 = -[GuidanceLaneView _removeUnusedUTurns](self, "_removeUnusedUTurns");
  laneInfo = self->_laneInfo;
  drawingBiasDirection = self->_drawingBiasDirection;
  memset(v10, 0, sizeof(v10));
  v11 = 0u;
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  MKDefaultJunctionManeuverMetrics(v10, v4);
  *(_OWORD *)((char *)v10 + 8) = xmmword_100E3C140;
  *((_QWORD *)&v10[1] + 1) = 0x401C000000000000;
  *(_OWORD *)((char *)&v13[1] + 8) = xmmword_100E3C150;
  *(_OWORD *)((char *)v13 + 8) = xmmword_100E3C160;
  *(_OWORD *)((char *)&v13[7] + 8) = xmmword_100E3C170;
  *(_OWORD *)((char *)&v13[5] + 8) = xmmword_100E3C180;
  *(_OWORD *)((char *)&v13[6] + 8) = xmmword_100E3C190;
  v11 = xmmword_100E3C1A0;
  v19 = xmmword_100E3C1B0;
  v20 = xmmword_100E3C1C0;
  *((_QWORD *)&v13[2] + 1) = 0;
  *((_QWORD *)&v14 + 1) = 0x4044000000000000;
  v15 = xmmword_100E3C1E0;
  v16 = xmmword_100E3C1F0;
  v17 = xmmword_100E3C210;
  v18 = xmmword_100E3C200;
  v21 = xmmword_100E3C1D0;
  v22 = xmmword_100E3C220;
  v23 = xmmword_100E3C230;
  v7 = MKCreateBezierPathsForLane(laneInfo, v3, drawingBiasDirection, &self->_laneDrawingSize, v10);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(v7);
  allPaths = self->_allPaths;
  self->_allPaths = v8;

  -[GuidanceLaneView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_laneDrawingSize.width;
  height = self->_laneDrawingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)_highlightFirstDirection
{
  void *v2;
  unsigned int v4;
  unsigned __int8 v5;
  void *v6;

  v4 = -[GuidanceLaneView maneuverHasPreferredLane](self, "maneuverHasPreferredLane");
  if (v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceLaneView laneInfo](self, "laneInfo"));
    if ((objc_msgSend(v2, "isPreferredLaneForManeuver") & 1) != 0)
    {
      v5 = 1;
LABEL_9:

      return v5;
    }
    if (-[GuidanceLaneView maneuverHasPreferredLane](self, "maneuverHasPreferredLane"))
    {
      v5 = 0;
      goto LABEL_9;
    }
  }
  else if (-[GuidanceLaneView maneuverHasPreferredLane](self, "maneuverHasPreferredLane"))
  {
    return 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceLaneView laneInfo](self, "laneInfo"));
  v5 = objc_msgSend(v6, "isLaneForManeuver");

  if (v4)
    goto LABEL_9;
  return v5;
}

- (BOOL)_markFirstDirectionAsValid
{
  return 0;
}

- (id)_preferredArrowColor
{
  void *v2;
  char v3;
  id v4;

  v2 = -[GuidanceLaneView laneStyle](self, "laneStyle");
  if (v2 == (void *)2)
  {
    v3 = 1;
LABEL_7:
    v4 = sub_100C556C4(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue(v4);
    return v2;
  }
  if (v2 == (void *)1)
  {
    v3 = 0;
    goto LABEL_7;
  }
  if (!v2)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  return v2;
}

- (id)_validArrowColor
{
  return self->_invalidArrowColor;
}

- (id)_defaultInvalidArrowColor
{
  void *v2;

  v2 = -[GuidanceLaneView laneStyle](self, "laneStyle");
  if (v2 == (void *)2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor carPlayDashboardJunctionColor](UIColor, "carPlayDashboardJunctionColor"));
  }
  else if (v2 == (void *)1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor carPlayJunctionColor](UIColor, "carPlayJunctionColor"));
  }
  else if (!v2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor iOSJunctionColor](UIColor, "iOSJunctionColor"));
  }
  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GuidanceLaneView;
  -[GuidanceLaneView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  if ((char *)-[GuidanceLaneView laneStyle](self, "laneStyle") - 1 <= (char *)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceLaneView traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = objc_msgSend(v4, "userInterfaceStyle");

    if (v6 != v7)
      -[GuidanceLaneView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
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
  CGContext *CurrentContext;
  double v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  void *v27;
  void *v28;
  UIColor *invalidArrowColor;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _BYTE v53[128];

  height = a3.size.height;
  width = a3.size.width;
  if (-[NSArray count](self->_allPaths, "count", a3.origin.x, a3.origin.y))
  {
    v6 = -[GuidanceLaneView _highlightFirstDirection](self, "_highlightFirstDirection");
    v7 = -[GuidanceLaneView _markFirstDirectionAsValid](self, "_markFirstDirectionAsValid");
    if (width > 0.0 && height > 0.0)
    {
      v8 = v7;
      v9 = self->_laneDrawingSize.width;
      -[GuidanceLaneView drawingScale](self, "drawingScale");
      v11 = (width - v9 * v10) * 0.5;
      v12 = self->_laneDrawingSize.height;
      -[GuidanceLaneView drawingScale](self, "drawingScale");
      v14 = height - v12 * v13;
      -[GuidanceLaneView verticalOffset](self, "verticalOffset");
      v16 = v14 - v15;
      v17 = 0.0;
      if (v16 >= 0.0)
      {
        v18 = self->_laneDrawingSize.height;
        -[GuidanceLaneView drawingScale](self, "drawingScale");
        v20 = height - v18 * v19;
        -[GuidanceLaneView verticalOffset](self, "verticalOffset");
        v17 = v20 - v21;
      }
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(CurrentContext, v11, v17);
      -[GuidanceLaneView drawingScale](self, "drawingScale");
      v24 = v23;
      -[GuidanceLaneView drawingScale](self, "drawingScale");
      CGContextScaleCTM(CurrentContext, v24, v25);
      v26 = -[NSArray mutableCopy](self->_allPaths, "mutableCopy");
      v27 = v26;
      if ((v6 | v8) == 1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
        objc_msgSend(v27, "removeObjectAtIndex:", 0);
      }
      else
      {
        v28 = 0;
      }
      if (objc_msgSend(v27, "count"))
      {
        v44 = v6;
        v51 = 0.0;
        v52 = 0.0;
        v49 = 0.0;
        v50 = 0.0;
        invalidArrowColor = self->_invalidArrowColor;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceLaneView traitCollection](self, "traitCollection"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](invalidArrowColor, "resolvedColorWithTraitCollection:", v30));

        objc_msgSend(v31, "getRed:green:blue:alpha:", &v52, &v51, &v50, &v49);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v52, v51, v50, 1.0));
        objc_msgSend(v32, "setFill");

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "reverseObjectEnumerator"));
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v38, "fillWithBlendMode:alpha:", 25, v49);
              objc_msgSend(v38, "fillWithBlendMode:alpha:", 18, v49);
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v35);
        }

        LOBYTE(v6) = v44;
      }
      if (v28)
      {
        if ((v6 & 1) != 0)
          v39 = objc_claimAutoreleasedReturnValue(-[GuidanceLaneView _preferredArrowColor](self, "_preferredArrowColor"));
        else
          v39 = objc_claimAutoreleasedReturnValue(-[GuidanceLaneView _validArrowColor](self, "_validArrowColor"));
        v40 = (void *)v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceLaneView traitCollection](self, "traitCollection"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "resolvedColorWithTraitCollection:", v41));

        v51 = 0.0;
        v52 = 0.0;
        v49 = 0.0;
        v50 = 0.0;
        objc_msgSend(v42, "getRed:green:blue:alpha:", &v52, &v51, &v50, &v49);
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v52, v51, v50, 1.0));
        objc_msgSend(v43, "setFill");

        objc_msgSend(v28, "fillWithBlendMode:alpha:", 0, v49);
      }
      CGContextRestoreGState(CurrentContext);

    }
  }
}

- (GEOComposedRouteLaneInfo)laneInfo
{
  return self->_laneInfo;
}

- (BOOL)maneuverHasPreferredLane
{
  return self->_maneuverHasPreferredLane;
}

- (UIColor)invalidArrowColor
{
  return self->_invalidArrowColor;
}

- (unint64_t)drawingBiasDirection
{
  return self->_drawingBiasDirection;
}

- (unint64_t)laneStyle
{
  return self->_laneStyle;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidArrowColor, 0);
  objc_storeStrong((id *)&self->_laneInfo, 0);
  objc_storeStrong((id *)&self->_allPaths, 0);
}

@end
