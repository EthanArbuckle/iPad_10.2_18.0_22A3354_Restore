@implementation VKCDataDetectorHighlightView

+ (id)highlightColor
{
  if (highlightColor_onceToken != -1)
    dispatch_once(&highlightColor_onceToken, &__block_literal_global_30);
  return (id)highlightColor_sHighlightColor;
}

void __46__VKCDataDetectorHighlightView_highlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.29, 0.29, 0.29, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)highlightColor_sHighlightColor;
  highlightColor_sHighlightColor = v0;

}

- (VKCDataDetectorHighlightView)initWithFrame:(CGRect)a3
{
  VKCDataDetectorHighlightView *v3;
  VKCDataDetectorHighlightView *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKCDataDetectorHighlightView;
  v3 = -[VKCDataDetectorHighlightView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VKCDataDetectorHighlightView shapeLayer](v3, "shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "highlightColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
    objc_msgSend(v5, "setLineWidth:", 2.0);
    objc_msgSend(v5, "setFillColor:", 0);
    -[VKCDataDetectorHighlightView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v5, "setFrame:");

    objc_msgSend(v5, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
    objc_msgSend(v5, "setMasksToBounds:", 0);

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAShapeLayer)shapeLayer
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[VKCDataDetectorHighlightView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKCheckedDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAShapeLayer *)v5;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCDataDetectorHighlightView;
  -[VKCDataDetectorHighlightView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[VKCDataDetectorHighlightView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

}

- (void)setPath:(id)a3
{
  id v4;
  UIBezierPath *v5;
  UIBezierPath *path;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (UIBezierPath *)objc_msgSend(v4, "copy");
  path = self->_path;
  self->_path = v5;

  -[VKCDataDetectorHighlightView configureDashPatternForPath:](self, "configureDashPatternForPath:", self->_path);
  v7 = objc_msgSend(v4, "vk_CGPath");

  -[VKCDataDetectorHighlightView shapeLayer](self, "shapeLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPath:", v7);

}

- (void)configureDashPatternForPath:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", a3, 1.0);
  v5 = v4;
  -[VKCDataDetectorHighlightView shapeLayer](self, "shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 3.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineDashPattern:", v9);

  LODWORD(v10) = 2.0;
  objc_msgSend(v6, "setRepeatCount:", v10);
  objc_msgSend(v6, "setLineWidth:", v5 + v5);
  objc_msgSend(v6, "setLineJoin:", *MEMORY[0x1E0CD3030]);

}

- (void)setHideDashedLine:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hideDashedLine = a3;
  -[VKCDataDetectorHighlightView shapeLayer](self, "shapeLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (UIBezierPath)path
{
  return self->_path;
}

- (BOOL)hideDashedLine
{
  return self->_hideDashedLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
