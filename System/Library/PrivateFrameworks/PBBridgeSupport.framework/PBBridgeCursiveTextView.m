@implementation PBBridgeCursiveTextView

- (PBBridgeCursiveTextView)initWithFrame:(CGRect)a3
{
  PBBridgeCursiveTextView *v3;
  PBBridgeCursiveTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBBridgeCursiveTextView;
  v3 = -[PBBridgeCursiveTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PBBridgeCursiveTextView configure](v3, "configure");
  return v4;
}

- (void)configure
{
  CAShapeLayer *v3;
  CAShapeLayer *textLayer;
  id v5;
  id v6;

  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
  textLayer = self->_textLayer;
  self->_textLayer = v3;

  -[PBBridgeCursiveTextView frame](self, "frame");
  -[CAShapeLayer setFrame:](self->_textLayer, "setFrame:");
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_textLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

  -[PBBridgeCursiveTextView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", self->_textLayer);

}

- (void)layoutSubviews
{
  -[PBBridgeCursiveTextView frame](self, "frame");
  -[CAShapeLayer setFrame:](self->_textLayer, "setFrame:");
}

- (void)loadText:(id)a3 pointSize:(double)a4 options:(id)a5
{
  id v8;
  id v9;
  PBBridgeCursiveTextPath *v10;
  PBBridgeCursiveTextPath *textPath;
  PBBridgeCursiveTextPath *v12;
  NSObject *v13;
  _BOOL4 v14;
  PBBridgeCursiveTextPath *v15;
  __int128 v16;
  void *v17;
  float v18;
  float v19;
  _QWORD v20[5];
  uint8_t buf[32];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = -[PBBridgeCursiveTextPath initWithURL:options:]([PBBridgeCursiveTextPath alloc], "initWithURL:options:", v8, v9);
  textPath = self->_textPath;
  self->_textPath = v10;

  v12 = self->_textPath;
  pbb_setup_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v9;
      _os_log_impl(&dword_2113B6000, v13, OS_LOG_TYPE_DEFAULT, "Loading text from url: %@ at pointSize: %f with options: %@", buf, 0x20u);
    }

    v15 = self->_textPath;
    -[CAShapeLayer bounds](self->_textLayer, "bounds");
    if (v15)
    {
      -[PBBridgeCursiveTextPath transformForRect:pointSize:flipped:](v15, "transformForRect:pointSize:flipped:", 1);
    }
    else
    {
      v22 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    v16 = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_textTransform.a = *(_OWORD *)buf;
    *(_OWORD *)&self->_textTransform.c = v16;
    *(_OWORD *)&self->_textTransform.tx = v22;
    -[PBBridgeCursiveTextView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "opacity");
    v19 = v18;

    if (v19 < 1.0)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __54__PBBridgeCursiveTextView_loadText_pointSize_options___block_invoke;
      v20[3] = &unk_24CBBE1E0;
      v20[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v20, 1.0);
    }
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v13, OS_LOG_TYPE_DEFAULT, "No text path", buf, 2u);
    }

  }
}

void __54__PBBridgeCursiveTextView_loadText_pointSize_options___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setOpacity:", v1);

}

- (float)duration
{
  PBBridgeCursiveTextPath *textPath;
  float result;

  textPath = self->_textPath;
  if (!textPath)
    return 0.0;
  -[PBBridgeCursiveTextPath animationDuration](textPath, "animationDuration");
  return result;
}

- (void)setTime:(double)a3
{
  CGPath *v4;
  const CGPath *v5;

  *(float *)&a3 = a3;
  v4 = -[PBBridgeCursiveTextPath pathForTime:](self->_textPath, "pathForTime:", a3);
  v5 = (const CGPath *)MEMORY[0x212BD8EEC](v4, &self->_textTransform);
  -[CAShapeLayer setPath:](self->_textLayer, "setPath:", v5);
  CGPathRelease(v5);
  CGPathRelease(v4);
}

- (float)textPathLineHeight
{
  float result;

  -[PBBridgeCursiveTextPath lineHeight](self->_textPath, "lineHeight");
  return result;
}

- (CGRect)boundingBoxOfTextPath
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PBBridgeCursiveTextPath boundingBoxOfPath](self->_textPath, "boundingBoxOfPath");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)textPathScalePerc
{
  float result;

  -[PBBridgeCursiveTextPath scale](self->_textPath, "scale");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPath, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);
}

@end
