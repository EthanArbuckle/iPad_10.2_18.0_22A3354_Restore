@implementation RCChronologicalAnnotationView

- (RCChronologicalAnnotationView)initWithFrame:(CGRect)a3
{
  char *v3;
  RCChronologicalAnnotationView *v4;
  void *v5;
  uint64_t v6;
  UIFont *timeLabelFont;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCChronologicalAnnotationView;
  v3 = -[RCChronologicalAnnotationView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (RCChronologicalAnnotationView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 56) = RCTimeRangeZero;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeLineLabelFont"));
    timeLabelFont = v4->_timeLabelFont;
    v4->_timeLabelFont = (UIFont *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCChronologicalAnnotationView layer](v4, "layer"));
    objc_msgSend(v8, "removeAllAnimations");

    -[RCChronologicalAnnotationView setOpaque:](v4, "setOpaque:", 0);
  }
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCChronologicalAnnotationView;
  v3 = -[RCChronologicalAnnotationView description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = NSStringFromRCTimeRange(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[RCChronologicalAnnotationView timeLabelsMajorInterval](self, "timeLabelsMajorInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: visibleTimeRange = %@, self.timeLabelsMajorInterval = %@"), v4, v6, v7));

  return v8;
}

- (void)setVisibleTimeRange:(id)a3
{
  self->_visibleTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  -[RCChronologicalAnnotationView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setContentDuration:(double)a3
{
  if (self->_contentDuration != a3)
    self->_contentDuration = a3;
}

- (void)setMarkerClippingRange:(id)a3
{
  self->_markerClippingRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  -[RCChronologicalAnnotationView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBackgroundDebugColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDebugColor, a3);
}

- (CGSize)labelsSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = RCLocalizedDuration(self, a2, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCChronologicalAnnotationView _timeLabelAttributes](self, "_timeLabelAttributes"));
  objc_msgSend(v4, "sizeWithAttributes:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)timeLabelsMajorInterval
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v8;

  v3 = -[RCChronologicalAnnotationView frame](self, "frame");
  v5 = 100.0
     / (v4
      / RCTimeRangeDeltaWithExactPrecision(v3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime));
  if (v5 >= 1.0)
  {
    v8 = 60.0;
    if (v5 < 60.0)
    {
      v8 = 30.0;
      if (v5 < 30.0)
      {
        v8 = 15.0;
        if (v5 < 9.0)
        {
          v8 = 5.0;
          if (v5 < 2.0)
          {
            v8 = v5;
            if (v5 >= 1.0)
              return 1.0;
          }
        }
      }
    }
    return v8;
  }
  else
  {
    v6 = log2(v5);
    return exp2(round(v6));
  }
}

- (int64_t)tickMarksForMajorInterval:(double)a3
{
  if (a3 == 60.0 || a3 == 1.0)
    return 4;
  else
    return 5;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_visibleTimeRange;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  int *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double beginTime;
  double v24;
  double v25;
  CGContext *CurrentContext;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v37;
  double v38;
  void *v39;
  double v40;
  CGFloat v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  char v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  _BOOL4 v62;
  _BOOL8 v63;
  uint64_t v64;
  float v65;
  double v66;
  uint64_t v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  unsigned __int8 v80;
  double v81;
  double v82;
  id v83;
  long double __y[2];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCChronologicalAnnotationView superview](self, "superview"));
  v9 = objc_msgSend(v8, "isHidden");

  if ((v9 & 1) == 0)
  {
    p_visibleTimeRange = &self->_visibleTimeRange;
    v12 = RCTimeRangeDeltaWithExactPrecision(v10, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
    if (v12 >= 2.22044605e-16)
    {
      v13 = RCTimeRangeIntersectTimeRange(self->_markerClippingRange.beginTime, self->_markerClippingRange.endTime, p_visibleTimeRange->beginTime, self->_visibleTimeRange.endTime);
      if ((RCTimeRangeEqualToTimeRange(RCTimeRangeInvalid[0], RCTimeRangeInvalid[1], v13, v14) & 1) == 0)
      {
        -[RCChronologicalAnnotationView timeLabelsMajorInterval](self, "timeLabelsMajorInterval");
        v16 = v15;
        v17 = -[RCChronologicalAnnotationView tickMarksForMajorInterval:](self, "tickMarksForMajorInterval:");
        v18 = &OBJC_IVAR___RCRecordingControl__pauseStrokeCornerRadius;
        v83 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
        v80 = +[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
        v85.origin.x = x;
        v85.origin.y = y;
        v85.size.width = width;
        v85.size.height = height;
        v81 = CGRectGetWidth(v85);
        objc_msgSend(v83, "timeLineTickWidth");
        v20 = v19;
        v75 = v12 / v16;
        v77 = v16;
        v21 = v12 / v16 * (double)v17;
        v22 = v16 / (double)v17;
        beginTime = p_visibleTimeRange->beginTime;
        __y[0] = 0.0;
        v24 = modf(fabs(beginTime / v22), __y);
        if (beginTime < 0.0)
        {
          v25 = -__y[0];
        }
        else
        {
          v24 = -v24;
          v25 = __y[0];
        }
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[RCChronologicalAnnotationView _timeLabelAttributes](self, "_timeLabelAttributes", *(_QWORD *)&v24));
        CurrentContext = UIGraphicsGetCurrentContext();
        v86.origin.x = x;
        v27 = v20;
        v86.origin.y = y;
        v86.size.width = width;
        v86.size.height = height;
        CGContextClearRect(CurrentContext, v86);
        CGContextSetLineWidth(CurrentContext, v20);
        v28 = (uint64_t)(v21 + 1.0);
        if (v28 >= -1)
        {
          v29 = 0;
          v30 = v81 / v21;
          v71 = v81 / v75;
          v72 = v20 + v20;
          v31 = (uint64_t)v25;
          v32 = v20 * 0.5;
          v82 = v81 / v21 * v69;
          v33 = v28 + 2;
          v34 = v31 - 1;
          v70 = 1.0 / v77;
          v73 = v20 * 0.5;
          v74 = v20;
          v78 = v30;
          do
          {
            v35 = v22 * (double)(v34 + v29);
            if (v35 >= -0.0001 && v35 >= self->_markerClippingRange.beginTime + -0.0001)
            {
              if (v35 >= self->_markerClippingRange.endTime + -0.0001)
                break;
              v37 = v82 + v30 * (double)(v29 - 1);
              v38 = RCRoundCoord(v37 - v32);
              if ((v34 + v29) % v17)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "timeLineMinorPlaybackMarkerColor"));
                objc_msgSend(v83, "timeLineMinorTickHeight");
                v41 = v40;
                v42 = objc_retainAutorelease(v39);
                CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v42, "CGColor"));
                v87.origin.y = 0.0;
                v87.origin.x = v38;
                v87.size.width = v27;
                v87.size.height = v41;
                CGContextFillRect(CurrentContext, v87);
              }
              else
              {
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "timeLineMajorPlaybackMarkerColor"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 818, "sharedStyleProvider"));
                objc_msgSend(v44, "timeLineMajorTickHeight");
                v46 = v45;

                v42 = objc_retainAutorelease(v43);
                CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v42, "CGColor"));
                v88.origin.y = 0.0;
                v88.origin.x = v38;
                v88.size.width = v27;
                v88.size.height = v46;
                CGContextFillRect(CurrentContext, v88);
                v47 = v80;
                if (v35 < 0.0)
                  v47 = 1;
                if ((v47 & 1) == 0)
                {
                  v48 = RCRoundCoord(v37 - v72);
                  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 818, "sharedStyleProvider"));
                  objc_msgSend(v49, "timeLineMajorTickHeight");
                  v51 = v50;

                  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RCChronologicalAnnotationView window](self, "window"));
                  v76 = v48;
                  -[RCChronologicalAnnotationView convertRect:toView:](self, "convertRect:toView:", v52, v48, v51, v71, 1.0);
                  v54 = v53;
                  v56 = v55;
                  v57 = v22;
                  v59 = v58;
                  v61 = v60;
                  objc_msgSend(v52, "bounds");
                  v90.origin.x = v54;
                  v90.origin.y = v56;
                  v90.size.width = v59;
                  v22 = v57;
                  v90.size.height = v61;
                  v62 = CGRectIntersectsRect(v89, v90);
                  v63 = -[RCChronologicalAnnotationView shouldOnlyRenderOnScreenTimeLabels](self, "shouldOnlyRenderOnScreenTimeLabels");
                  if (!v63
                    || (v63 = -[RCChronologicalAnnotationView shouldOnlyRenderOnScreenTimeLabels](self, "shouldOnlyRenderOnScreenTimeLabels"), v63 && v62))
                  {
                    v65 = v70 * fabs(v35);
                    v66 = floorf(v65) / v70;
                    if (v77 < 1.0)
                      v67 = RCLocalizedPlaybackTimeWithMinimumComponents(2, 1, v66, v66);
                    else
                      v67 = RCLocalizedDuration(v63, v64, v66);
                    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
                    objc_msgSend(v68, "drawAtPoint:withAttributes:", v79, v76, v51, *(_QWORD *)&v70);

                  }
                  v18 = &OBJC_IVAR___RCRecordingControl__pauseStrokeCornerRadius;
                  v32 = v73;
                  v27 = v74;
                }
                v30 = v78;
              }

            }
            ++v29;
          }
          while (v33 != v29);
        }

      }
    }
  }
}

- (id)_timeLabelAttributesWithFont:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timelinePlaybackTimeColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, NSFontAttributeName, v5, NSForegroundColorAttributeName, 0));

  return v6;
}

- (id)_timeLabelAttributes
{
  return -[RCChronologicalAnnotationView _timeLabelAttributesWithFont:](self, "_timeLabelAttributesWithFont:", self->_timeLabelFont);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_visibleTimeRange.beginTime;
  endTime = self->_visibleTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (double)contentDuration
{
  return self->_contentDuration;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)markerClippingRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_markerClippingRange.beginTime;
  endTime = self->_markerClippingRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
}

- (BOOL)shouldOnlyRenderOnScreenTimeLabels
{
  return self->_shouldOnlyRenderOnScreenTimeLabels;
}

- (void)setShouldOnlyRenderOnScreenTimeLabels:(BOOL)a3
{
  self->_shouldOnlyRenderOnScreenTimeLabels = a3;
}

- (UIColor)backgroundDebugColor
{
  return self->_backgroundDebugColor;
}

- (unint64_t)debugID
{
  return self->_debugID;
}

- (void)setDebugID:(unint64_t)a3
{
  self->_debugID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDebugColor, 0);
  objc_storeStrong((id *)&self->_timeLabelFont, 0);
}

@end
