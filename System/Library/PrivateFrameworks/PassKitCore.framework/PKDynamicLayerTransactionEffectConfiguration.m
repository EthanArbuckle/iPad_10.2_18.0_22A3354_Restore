@implementation PKDynamicLayerTransactionEffectConfiguration

- (PKDynamicLayerTransactionEffectConfiguration)initWithDictionary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  char v7;
  PKDynamicLayerTransactionEffectConfiguration *v8;
  objc_super v10;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v10.receiver = self;
  v10.super_class = (Class)PKDynamicLayerTransactionEffectConfiguration;
  self = -[PKDynamicLayerTransactionEffectConfiguration init](&v10, sel_init);
  if (self)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("style"));
    v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == CFSTR("zoomedShape")
      || v5
      && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("zoomedShape")),
          v6,
          (v7 & 1) != 0))
    {

      self->_style = 1;
      goto LABEL_7;
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_7:
  self = self;
  v8 = self;
LABEL_10:

  return v8;
}

- (id)configureTransactionEffectEmitterLayer:(id)a3 withImage:(CGImage *)a4 andEmitterShapeData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  double Width;
  float v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  const CGPath *CGPath;
  CGMutablePathRef v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  CATransform3D v50;
  _OWORD v51[8];
  CATransform3D v52;
  CGAffineTransform transform;
  _QWORD v54[3];
  _QWORD v55[2];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_style != 1)
    goto LABEL_12;
  v11 = 0;
  if (!a4 || !v9)
    goto LABEL_17;
  v12 = CGSVGDocumentCreateFromData();
  if (!v12)
  {
LABEL_12:
    v11 = 0;
    goto LABEL_17;
  }
  v13 = (const void *)v12;
  objc_msgSend(v8, "setEmitterMode:", *MEMORY[0x1E0CD2B18]);
  objc_msgSend(v8, "setEmitterShape:", *MEMORY[0x1E0CD2B20]);
  objc_msgSend(v8, "setRenderMode:", *MEMORY[0x1E0CD2B08]);
  Width = (double)CGImageGetWidth(a4);
  v15 = 12.8 / fmax(Width, (double)CGImageGetHeight(a4));
  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContents:", a4);
  objc_msgSend(v16, "setScale:", v15);
  LODWORD(v17) = 2.0;
  objc_msgSend(v16, "setLifetime:", v17);
  LODWORD(v18) = 0.5;
  objc_msgSend(v16, "setLifetimeRange:", v18);
  objc_msgSend(v16, "setEmissionRange:", 3.14159265);
  objc_msgSend(v16, "setVelocity:", 20.0);
  objc_msgSend(v16, "setYAcceleration:", 0.0);
  LODWORD(v19) = 1137180672;
  objc_msgSend(v16, "setBirthRate:", v19);
  CGSVGDocumentGetRootNode();
  CGSVGNodeGetChildAtIndex();
  CGSVGShapeNodeGetPath();
  CGSVGDocumentGetCanvasSize();
  v21 = v20;
  v23 = v22;
  CGPath = (const CGPath *)CGSVGPathCreateCGPath();
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeScale(&transform, 1.0 / v21, 1.0 / v23);
  v25 = CGPathCreateMutableCopyByTransformingPath(CGPath, &transform);
  objc_msgSend(v8, "setEmitterPath:", v25);
  if (v25)
    CFRelease(v25);
  CFRelease(v13);
  if (CGPath)
    CFRelease(CGPath);
  if (objc_msgSend(v8, "emitterPath"))
  {
    v56[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEmitterCells:", v26);

    objc_msgSend(v8, "setSeed:", arc4random_uniform(0x2710u));
    CATransform3DMakeScale(&v52, 0.5, 0.5, 0.5);
    objc_msgSend(v8, "setTransform:", &v52);
    LODWORD(v27) = 0;
    objc_msgSend(v8, "setOpacity:", v27);
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = PKCreateDynamicLayerOpacityBehavior(&unk_1E2C3E590);
    objc_msgSend(v28, "addObject:", v29);

    *(float *)&v30 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 / 5.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = PKCreateDynamicLayerScaleBehavior(v33);
    objc_msgSend(v28, "addObject:", v34);

    v35 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v8, "setEmitterBehaviors:", v35);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDuration:", 2.7);
    objc_msgSend(v36, "setKeyTimes:", &unk_1E2C3E5A8);
    objc_msgSend(v36, "setValues:", &unk_1E2C3E5C0);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBeginTime:", 0.0);
    objc_msgSend(v37, "setDuration:", 3.2);
    v38 = (void *)MEMORY[0x1E0CB3B18];
    if (v8)
      objc_msgSend(v8, "transform");
    else
      memset(v51, 0, sizeof(v51));
    objc_msgSend(v38, "valueWithCATransform3D:", v51);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFromValue:", v39);

    v40 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeScale(&v50, 5.0, 5.0, 5.0);
    objc_msgSend(v40, "valueWithCATransform3D:", &v50);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setToValue:", v41);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTimingFunction:", v42);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("birthRate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setBeginTime:", 1.0);
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "birthRate");
    objc_msgSend(v44, "numberWithFloat:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFromValue:", v45);

    LODWORD(v46) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setToValue:", v47);

    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v36;
    v54[1] = v37;
    v54[2] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnimations:", v48);

    objc_msgSend(v11, "setDuration:", 3.2);
    objc_msgSend(v11, "setBeginTime:", 0.1);
    objc_msgSend(v11, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
    objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B60]);

  }
  else
  {
    v11 = 0;
  }

LABEL_17:
  return v11;
}

- (void)configureTransactionEffectEmitterLayer:(id)a3 withBounds:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double MidX;
  id v9;
  CGRect v10;
  CGRect v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  objc_msgSend(v9, "setEmitterPosition:", MidX, CGRectGetMidY(v11));
  objc_msgSend(v9, "setEmitterSize:", width, height);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerTransactionEffectConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKDynamicLayerTransactionEffectConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDynamicLayerTransactionEffectConfiguration;
  v5 = -[PKDynamicLayerTransactionEffectConfiguration init](&v7, sel_init);
  if (v5)
    -[PKDynamicLayerTransactionEffectConfiguration setStyle:](v5, "setStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionEffectStyle")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_style, CFSTR("transactionEffectStyle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKDynamicLayerTransactionEffectConfiguration init](+[PKDynamicLayerTransactionEffectConfiguration allocWithZone:](PKDynamicLayerTransactionEffectConfiguration, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_style;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

@end
