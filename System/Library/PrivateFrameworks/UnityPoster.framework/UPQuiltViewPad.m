@implementation UPQuiltViewPad

- (UPQuiltViewPad)initWithFrame:(CGRect)a3 identifier:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UPQuiltViewPad *v10;
  UPQuiltViewPad *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  CALayer *quiltImageLayer;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UPQuiltViewPad;
  v10 = -[UPQuiltViewPad initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_originalFrame.origin.x = x;
    v10->_originalFrame.origin.y = y;
    v10->_originalFrame.size.width = width;
    v10->_originalFrame.size.height = height;
    v12 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v11->_widthRatioToHero = width / 834.0;
    v11->_heightRatioToHero = height / 1194.0;
    -[UPQuiltViewPad setupLayerForIdentifier:](v11, v11->_identifier);
    v14 = objc_claimAutoreleasedReturnValue();
    quiltImageLayer = v11->_quiltImageLayer;
    v11->_quiltImageLayer = (CALayer *)v14;

    -[UPQuiltViewPad layer](v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v11->_quiltImageLayer);

    -[UPQuiltViewPad layer](v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsDisplay");

  }
  return v11;
}

- (id)setupLayerForIdentifier:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  if (a1)
  {
    if (setupLayerForIdentifier__onceToken != -1)
      dispatch_once(&setupLayerForIdentifier__onceToken, &__block_literal_global_0);
    v4 = (void *)setupLayerForIdentifier__cache;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__UPQuiltViewPad_setupLayerForIdentifier___block_invoke_2;
    v12[3] = &unk_24EF48668;
    v13 = v3;
    objc_msgSend(v4, "imageForKey:generatingIfNecessaryWithBlock:", v13, v12);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGImage");
    v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    objc_msgSend(v5, "size");
    v9 = v8;
    objc_msgSend(v5, "size");
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v9, v10);
    objc_msgSend(v7, "setContents:", v6);
    objc_msgSend(a1, "setClipsToBounds:", 0);
    objc_msgSend(v7, "setMasksToBounds:", 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  CALayer *v6;
  void *v7;
  void *v8;
  void *v9;
  CALayer *quiltImageLayer;
  id v11;

  v11 = a3;
  if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:") || !self->_quiltImageLayer)
  {
    v4 = (NSString *)objc_msgSend(v11, "copy");
    identifier = self->_identifier;
    self->_identifier = v4;

    -[UPQuiltViewPad setupLayerForIdentifier:](self, v11);
    v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
    -[CALayer superlayer](self->_quiltImageLayer, "superlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UPQuiltViewPad layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "replaceSublayer:with:", self->_quiltImageLayer, v6);
    else
      objc_msgSend(v8, "addSublayer:", v6);

    quiltImageLayer = self->_quiltImageLayer;
    self->_quiltImageLayer = v6;

  }
}

void __42__UPQuiltViewPad_setupLayerForIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BF28]), "initWithUniqueIdentifier:", CFSTR("UnityPoster"));
  v1 = (void *)setupLayerForIdentifier__cache;
  setupLayerForIdentifier__cache = v0;

}

id __42__UPQuiltViewPad_setupLayerForIdentifier___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v2;
  void *v3;
  void *v4;

  *a2 |= 4uLL;
  v2 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("_ipad"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)getOffsetForDeviceInterfaceOrientation:(double *)a1
{
  uint64_t v2;
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  double v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGRect v15;

  if (!a1)
    return 0.0;
  v2 = a2 - 2;
  if ((unint64_t)(a2 - 2) > 2)
  {
    v4 = 0.0;
    v3 = 0.6;
  }
  else
  {
    v3 = dbl_226FF82A8[v2];
    v4 = dbl_226FF82C0[v2];
  }
  v5 = a1[71];
  v6 = a1[72];
  v7 = a1[73];
  v8 = a1[74];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tx = *(_OWORD *)&v14.tx;
  CGAffineTransformTranslate(&v14, &v13, v5 * 0.5 * v7, v6 * 0.5 * v8);
  v12 = v14;
  CGAffineTransformRotate(&v13, &v12, v4);
  v14 = v13;
  v12 = v13;
  CGAffineTransformScale(&v13, &v12, v3 * v7, v3 * v8);
  v14 = v13;
  v12 = v13;
  CGAffineTransformTranslate(&v13, &v12, -(v5 * 0.5 * v7), -(v6 * 0.5 * v8));
  v14 = v13;
  v15.size.width = v5 * v7;
  v15.size.height = v6 * v8;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  *(_QWORD *)&v10 = (unint64_t)CGRectApplyAffineTransform(v15, &v13);
  return UPSubtractPoints(0.0, 0.0, v10);
}

- (double)originTranslationValueForPortraitMode
{
  unsigned int v2;
  double v3;

  if (a1)
  {
    v2 = MGGetSInt32Answer();
    if (v2 > 0x1C)
      goto LABEL_9;
    v3 = -0.282;
    if (((1 << v2) & 0x200018) != 0 || ((1 << v2) & 0x100000C0) != 0)
      goto LABEL_10;
    if (((1 << v2) & 0x4800) != 0)
      v3 = -0.276;
    else
LABEL_9:
      v3 = -0.276;
LABEL_10:
    objc_msgSend(a1, "timeRect");
    objc_msgSend(a1, "timeRect");
    return v3 * a1[73] * 3414.0;
  }
  return 0.0;
}

- (double)scaleValueForLandscapeMode
{
  unsigned int v1;

  if (!a1)
    return 0.0;
  v1 = MGGetSInt32Answer();
  if (v1 > 0x1C || ((1 << v1) & 0x100000C0) == 0)
    return 0.4;
  else
    return 0.45;
}

- (double)originTranslationValueForLandscapeMode
{
  unsigned int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (!a1)
    return 0.0;
  v2 = MGGetSInt32Answer();
  if (v2 > 0x1C)
    goto LABEL_9;
  if (((1 << v2) & 0x200018) != 0)
  {
    v3 = 0.1262;
    goto LABEL_10;
  }
  if (((1 << v2) & 0x100000C0) == 0)
  {
    if (((1 << v2) & 0x4800) != 0)
    {
      v3 = 0.1054;
      goto LABEL_10;
    }
LABEL_9:
    v3 = 0.1326;
    goto LABEL_10;
  }
  v3 = 0.15112;
LABEL_10:
  objc_msgSend(a1, "timeRect");
  v5 = v4;
  objc_msgSend(a1, "timeRect");
  v7 = -(v3 * a1[73] * 3414.0 - (v5 + v6 * 0.5));
  objc_msgSend(a1, "landscapeWidgetRect");
  return v7;
}

- (void)updateQuiltsWithIdentifier:(id)a3 deviceInterfaceOrientation:(int64_t)a4 unlockProgress:(double)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  CGFloat v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  double v26;
  double v27;
  CGFloat v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double widthRatioToHero;
  double heightRatioToHero;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", v8))
    -[UPQuiltViewPad setIdentifier:](self, "setIdentifier:", v8);
  v9 = a5 * -0.2 + 1.0;
  if ((unint64_t)(a4 - 3) >= 2)
    v10 = a5 * -0.2 + 1.0;
  else
    v10 = a5 * -0.1 + 1.0;
  v11 = -[UPQuiltViewPad getOffsetForDeviceInterfaceOrientation:]((double *)self, a4);
  v13 = v12;
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v40.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v40.c = v14;
  *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v39.a = *(_OWORD *)&v40.a;
  *(_OWORD *)&v39.c = v14;
  *(_OWORD *)&v39.tx = *(_OWORD *)&v40.tx;
  CGAffineTransformScale(&v40, &v39, v9, v10);
  switch(a4)
  {
    case 2:
      v20 = -[UPQuiltViewPad originTranslationValueForPortraitMode]((double *)self);
      v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, -v20, -v21);
      v40 = v39;
      v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, -v11, -v13);
      v40 = v39;
      v38 = v39;
      CGAffineTransformRotate(&v39, &v38, 3.14159265);
      break;
    case 3:
      v22 = -[UPQuiltViewPad originTranslationValueForLandscapeMode]((double *)self);
      v24 = v23;
      v25 = MGGetSInt32Answer();
      if (v25 <= 0x1C && ((1 << v25) & 0x100000C0) != 0)
        v26 = 0.45;
      else
        v26 = 0.4;
      v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, -v22, -v24);
      *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
      *(_OWORD *)&v40.tx = *(_OWORD *)&v39.tx;
      *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
      v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, -v11, v13);
      *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
      *(_OWORD *)&v40.tx = *(_OWORD *)&v39.tx;
      *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
      v38 = v39;
      CGAffineTransformRotate(&v39, &v38, 1.57079633);
      v30 = *(_OWORD *)&v39.c;
      v29 = *(_OWORD *)&v39.tx;
      *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
      *(_OWORD *)&v40.tx = *(_OWORD *)&v39.tx;
      v31 = *(_OWORD *)&v39.a;
      widthRatioToHero = self->_widthRatioToHero;
      *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
      v33 = v26 * widthRatioToHero;
      heightRatioToHero = self->_heightRatioToHero;
      goto LABEL_22;
    case 4:
      v15 = -[UPQuiltViewPad originTranslationValueForLandscapeMode]((double *)self);
      v17 = v16;
      v18 = MGGetSInt32Answer();
      if (v18 <= 0x1C && ((1 << v18) & 0x100000C0) != 0)
        v19 = 0.45;
      else
        v19 = 0.4;
      v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, v15, v17);
      v40 = v39;
      v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, v11, -v13);
      v40 = v39;
      v38 = v39;
      CGAffineTransformRotate(&v39, &v38, -1.57079633);
      v30 = *(_OWORD *)&v39.c;
      v29 = *(_OWORD *)&v39.tx;
      v40 = v39;
      v31 = *(_OWORD *)&v39.a;
      heightRatioToHero = self->_heightRatioToHero;
      v33 = v19 * self->_widthRatioToHero;
LABEL_22:
      v34 = heightRatioToHero * 0.4;
      goto LABEL_23;
    default:
      v27 = -[UPQuiltViewPad originTranslationValueForPortraitMode]((double *)self);
      v38 = v40;
      CGAffineTransformTranslate(&v39, &v38, v27, v28);
      v40 = v39;
      v38 = v39;
      CGAffineTransformTranslate(&v39, &v38, v11, v13);
      break;
  }
  v30 = *(_OWORD *)&v39.c;
  v29 = *(_OWORD *)&v39.tx;
  *(_OWORD *)&v40.c = *(_OWORD *)&v39.c;
  *(_OWORD *)&v40.tx = *(_OWORD *)&v39.tx;
  v31 = *(_OWORD *)&v39.a;
  v32 = self->_widthRatioToHero;
  *(_OWORD *)&v40.a = *(_OWORD *)&v39.a;
  v33 = v32 * 0.6;
  v34 = self->_heightRatioToHero * 0.6;
LABEL_23:
  *(_OWORD *)&v38.a = v31;
  *(_OWORD *)&v38.c = v30;
  *(_OWORD *)&v38.tx = v29;
  CGAffineTransformScale(&v39, &v38, v33, v34);
  v40 = v39;
  v37 = v39;
  -[UPQuiltViewPad setTransform:](self, "setTransform:", &v37);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPQuilt = memory:%p"), self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_quiltImageLayer, 0);
  objc_storeStrong((id *)&self->_transitionLayer, 0);
}

@end
