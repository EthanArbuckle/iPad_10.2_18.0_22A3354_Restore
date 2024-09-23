@implementation VTUIColorLayer

- (VTUIColorLayer)init
{
  VTUIColorLayer *v2;
  uint64_t v3;
  UIColor *redColor;
  uint64_t v5;
  UIColor *blueColor;
  uint64_t v7;
  UIColor *backgroundColor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VTUIColorLayer;
  v2 = -[VTUIColorLayer init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.96875, 0.25390625, 0.36328125, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    redColor = v2->_redColor;
    v2->_redColor = (UIColor *)v3;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.15625, 0.52734375, 0.9921875, 1.0);
    v5 = objc_claimAutoreleasedReturnValue();
    blueColor = v2->_blueColor;
    v2->_blueColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v2->_backgroundColor;
    v2->_backgroundColor = (UIColor *)v7;

  }
  return v2;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("phase")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VTUIColorLayer;
    v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)display
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGContext *CurrentContext;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  uint64_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  double v34;
  id v35;
  id v36;
  CGFloat v37;
  double v38;
  id v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGSize v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[VTUIColorLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VTUIColorLayer bounds](self, "bounds");
  v43.width = v11;
  v43.height = v12;
  v13 = 0.0;
  UIGraphicsBeginImageContextWithOptions(v43, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v41 = v4;
  v42 = v10;
  v44.origin.x = v4;
  v44.origin.y = v6;
  v37 = v8;
  v44.size.width = v8;
  v44.size.height = v10;
  CGContextClearRect(CurrentContext, v44);
  -[VTUIColorLayer presentationLayer](self, "presentationLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "phase");
  v17 = v16;

  v18 = (float)((float)(v17 + -0.57) / 0.4) * 12.0;
  if (v18 > -10.0)
  {
    v13 = 1.0;
    if (v18 < 10.0)
    {
      v19 = 1.0 / (exp((float)-v18) + 1.0);
      v13 = v19;
    }
  }
  v40 = v13;
  v20 = (float)((float)(v17 + -0.4) / 0.8) * 12.0;
  v21 = 0.0;
  v22 = 0.0;
  if (v20 > -10.0)
  {
    v22 = 1.0;
    if (v20 < 10.0)
      v22 = 1.0 / (exp((float)-v20) + 1.0);
  }
  v23 = (float)((float)(v17 + -0.6) / 0.3) * 12.0;
  if (v23 > -10.0)
  {
    v21 = 1.0;
    if (v23 < 10.0)
      v21 = 1.0 / (exp((float)-v23) + 1.0);
  }
  v24 = (float)((float)(v17 + -0.35) / 0.6) * 12.0;
  v25 = 0.0;
  v26 = 0.0;
  if (v24 > -10.0)
  {
    v26 = 1.0;
    if (v24 < 10.0)
      v26 = 1.0 / (exp((float)-v24) + 1.0);
  }
  v27 = (float)((float)(v17 + -0.3) / 0.4) * 12.0;
  if (v27 > -10.0)
  {
    v25 = 1.0;
    if (v27 < 10.0)
      v25 = 1.0 / (exp((float)-v27) + 1.0);
  }
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection", *(_QWORD *)&v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "userInterfaceStyle");

  v30 = v38;
  v31 = v25 * v30;
  v32 = v26 * v30;
  v33 = v22 * v30;
  CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](self->_redColor, "CGColor"));
  v45.size.width = v31;
  v45.origin.x = v41;
  v45.origin.y = v6;
  v45.size.height = v42;
  CGContextFillRect(CurrentContext, v45);
  CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](self->_blueColor, "CGColor"));
  v46.size.width = v32;
  v46.origin.x = v41;
  v46.origin.y = v6;
  v46.size.height = v42;
  CGContextFillRect(CurrentContext, v46);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (float)((float)(1.0 - v21) * 0.37891), (float)((float)(1.0 - v21) * 0.98828), (float)((float)(1.0 - v21) * 0.67578), 1.0);
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v39, "CGColor"));
  v47.size.width = v33;
  v47.origin.x = v41;
  v47.origin.y = v6;
  v47.size.height = v42;
  CGContextFillRect(CurrentContext, v47);
  v34 = 0.0;
  if (v29 != 1)
    v34 = v40;
  -[UIColor colorWithAlphaComponent:](self->_backgroundColor, "colorWithAlphaComponent:", v34);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v35, "CGColor"));
  -[VTUIColorLayer bounds](self, "bounds");
  CGContextFillRect(CurrentContext, v48);
  UIGraphicsGetImageFromCurrentImageContext();
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[VTUIColorLayer setContents:](self, "setContents:", objc_msgSend(v36, "CGImage"));

  UIGraphicsEndImageContext();
}

- (id)actionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("phase")))
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimingFunction:", v6);

    v7 = (void *)MEMORY[0x24BDD16E0];
    -[VTUIColorLayer phase](self, "phase");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFromValue:", v8);

    return v5;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VTUIColorLayer;
    -[VTUIColorLayer actionForKey:](&v11, sel_actionForKey_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_blueColor, 0);
  objc_storeStrong((id *)&self->_redColor, 0);
}

@end
