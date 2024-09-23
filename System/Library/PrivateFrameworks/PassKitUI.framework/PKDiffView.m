@implementation PKDiffView

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKDiffView;
  -[PKDiffView dealloc](&v2, sel_dealloc);
}

- (void)updateShapeLayer
{
  CAShapeLayer **p_shapeLayer;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const CGPath *v17;
  __int128 v18;
  float64x2_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGMutablePathRef v24;
  void *v25;
  CAShapeLayer *v26;
  void *v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform transform;

  p_shapeLayer = &self->_shapeLayer;
  if (!self->_shapeLayer)
  {
    -[PKDiffView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("DiffCircle"), CFSTR("caar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v9, *MEMORY[0x1E0CD3070], 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    objc_storeStrong((id *)p_shapeLayer, v12);
    -[CAShapeLayer frame](*p_shapeLayer, "frame");
    v14 = v13;
    v16 = v15;
    v17 = CGPathRetain(-[CAShapeLayer path](*p_shapeLayer, "path"));
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&transform.c = v18;
    *(_OWORD *)&transform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v29.a = *(_OWORD *)&transform.a;
    *(_OWORD *)&v29.c = v18;
    *(_OWORD *)&v29.tx = *(_OWORD *)&transform.tx;
    CGAffineTransformScale(&transform, &v29, v5 / v14, v7 / v16);
    v28 = transform;
    CGAffineTransformTranslate(&v29, &v28, v14 * 0.5, v16 * 0.5);
    transform = v29;
    v19 = vminnmq_f64(vmaxnmq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(RandomPathRotation_sPreviousRotation, 0), (float64x2_t)xmmword_19DF16370), (float64x2_t)vdupq_n_s64(0xBFE921FB54442D18)), (float64x2_t)vdupq_n_s64(0x3FE921FB54442D18uLL));
    v20 = v19.f64[1];
    v21 = v19.f64[0] - v19.f64[1];
    v22 = drand48() * (1.57079633 - (v19.f64[0] - v19.f64[1])) + -0.785398163;
    v23 = -0.0;
    if (v22 > v20)
      v23 = v21;
    *(double *)&RandomPathRotation_sPreviousRotation = v22 + v23;
    v28 = transform;
    CGAffineTransformRotate(&v29, &v28, v22 + v23);
    transform = v29;
    v28 = v29;
    CGAffineTransformTranslate(&v29, &v28, -(v14 * 0.5), -(v16 * 0.5));
    transform = v29;
    v24 = CGPathCreateMutableCopyByTransformingPath(v17, &transform);
    -[CAShapeLayer setPath:](*p_shapeLayer, "setPath:", v24);
    CFRelease(v24);
    -[CAShapeLayer mask](*p_shapeLayer, "mask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = transform;
    objc_msgSend(v25, "setAffineTransform:", &v29);

    CGPathRelease(v17);
    v26 = *p_shapeLayer;
    -[PKDiffView bounds](self, "bounds");
    -[CAShapeLayer setFrame:](v26, "setFrame:");
    -[CAShapeLayer setGeometryFlipped:](*p_shapeLayer, "setGeometryFlipped:", 1);
    -[CAShapeLayer setStrokeEnd:](*p_shapeLayer, "setStrokeEnd:", 0.0);
    -[PKDiffView layer](self, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSublayer:", *p_shapeLayer);

  }
}

- (void)performStrokeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  dispatch_time_t v8;
  id v9;

  v4 = a3;
  -[PKDiffView updateShapeLayer](self, "updateShapeLayer");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToValue:", v6);

  -[CAShapeLayer setStrokeEnd:](self->_shapeLayer, "setStrokeEnd:", 1.0);
  -[CAShapeLayer addAnimation:forKey:](self->_shapeLayer, "addAnimation:forKey:", v9, CFSTR("strokeEnd"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
  v8 = dispatch_time(0, (uint64_t)((v7 + 0.100000001) * 1000000000.0));
  dispatch_after(v8, MEMORY[0x1E0C80D38], v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
