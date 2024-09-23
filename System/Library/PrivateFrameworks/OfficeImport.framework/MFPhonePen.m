@implementation MFPhonePen

+ (id)penWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6 LPToDPTransform:(CGAffineTransform *)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  float *v13;
  float *v14;
  __int128 v15;
  float v16;
  void *v17;
  CGAffineTransform v19;
  CGAffineTransform v20;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = (float *)objc_alloc((Class)a1);
  v14 = v13;
  if ((int)v10 > 4 || (_DWORD)v9)
  {
    v13[8] = (float)(int)v9;
  }
  else
  {
    v15 = *(_OWORD *)&a7->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&a7->a;
    *(_OWORD *)&v19.c = v15;
    *(_OWORD *)&v19.tx = *(_OWORD *)&a7->tx;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v20, &v19);
    v16 = v20.a + v20.c;
    v14[8] = v16;
    v9 = 1;
  }
  v17 = (void *)objc_msgSend(v14, "initWithStyle:width:colour:styleArray:", v10, v9, v12, a6);

  return v17;
}

- (MFPhonePen)initWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPhonePen;
  return -[MFPen initWithStyle:width:colour:styleArray:](&v7, sel_initWithStyle_width_colour_styleArray_, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
}

- (void)applyDashedLinesToPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  float m_PixelSize;
  uint64_t v10;
  char *v11;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (-[MFPen getStyle](self, "getStyle") & 0xF) - 1;
  if (v5 < 4)
  {
    v6 = 0;
    v7 = qword_22A4C0CE0[v5];
    v8 = s_dashArraysSize[v7];
    m_PixelSize = self->m_PixelSize;
    if (v8 <= 1)
      v10 = 1;
    else
      v10 = v8;
    v11 = (char *)&s_dashArrays + 24 * v7;
    do
    {
      *(double *)&v12[v6] = (float)(*(float *)&v11[4 * v6] * m_PixelSize);
      ++v6;
    }
    while (v10 != v6);
    objc_msgSend(v4, "setLineDash:count:phase:", v12, 0.0);
  }

}

- (void)applyLineCapStyleToPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = -[MFPen getStyle](self, "getStyle") & 0xF00;
  v5 = 1;
  if ((_DWORD)v4 == 256)
    v5 = 2;
  if ((_DWORD)v4 == 512)
    v6 = 0;
  else
    v6 = v5;
  objc_msgSend(v7, "setLineCapStyle:", v6);

}

- (void)applyLineJoinStyleToPath:(id)a3 in_path:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = -[MFPen getStyle](self, "getStyle") & 0xF000;
  v8 = 1;
  if (v7 == 4096)
    v8 = 2;
  if (v7 == 0x2000)
    v9 = 0;
  else
    v9 = v8;
  objc_msgSend(v6, "setLineJoinStyle:", v9);
  if (v7 == 0x2000)
  {
    objc_msgSend(v12, "getMiterLimit");
    v11 = v10;
    if (v10 < 0.0)
      objc_msgSend(v6, "setMiterLimit:", 10.0);
    objc_msgSend(v6, "setMiterLimit:", v11);
  }

}

- (void)strokePath:(id)a3 in_path:(id)a4
{
  id v6;
  int v7;
  int v8;
  int m_penWidth;
  void *v11;
  int m_penStyle;
  double v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = +[MFPhoneDeviceDriver getROP:](MFPhoneDeviceDriver, "getROP:", v14);
  v8 = v7;
  if (self->super.m_penStyle != 5 && v7 != 3)
  {
    m_penWidth = self->super.m_penWidth;
    if (m_penWidth)
    {
      objc_msgSend(v6, "setLineWidth:", (double)m_penWidth);
      if (v8 == 1)
      {
        +[OITSUColor whiteColor](OITSUColor, "whiteColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "set");
      }
      else
      {
        if (v8)
          -[MFPen getColor](self, "getColor");
        else
          +[OITSUColor blackColor](OITSUColor, "blackColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "set");
      }

      -[MFPhonePen applyDashedLinesToPath:](self, "applyDashedLinesToPath:", v6);
      m_penStyle = self->super.m_penStyle;
      if ((m_penStyle & 0xF0000) == 0x10000 || self->super.m_penWidth >= 2)
      {
        -[MFPhonePen applyLineCapStyleToPath:](self, "applyLineCapStyleToPath:", v6);
        -[MFPhonePen applyLineJoinStyleToPath:in_path:](self, "applyLineJoinStyleToPath:in_path:", v14, v6);
        m_penStyle = self->super.m_penStyle;
      }
      if ((~m_penStyle & 0x12000) == 0)
      {
        objc_msgSend(v14, "getMiterLimit");
        if (v13 > 0.0 && v13 != 4.0)
          objc_msgSend(v6, "setMiterLimit:");
      }
      objc_msgSend(v6, "stroke");
    }
  }

}

@end
