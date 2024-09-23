@implementation _UIMotionFocusAnalyzer

- (void)updateWithEvent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "focusPosition");
      v5 = v4;
      v7 = v6;
      -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setViewerOffset:", v5, v7);

    }
  }

}

- (void)reset
{
  id v2;

  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reset");

}

@end
