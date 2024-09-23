@implementation SFMagicHeadMarkerView

- (SFMagicHeadMarkerView)initWithPositionDegree:(double)a3 containerRadius:(double)a4
{
  SFMagicHeadMarkerView *v6;
  SFMagicHeadMarkerView *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFMagicHeadMarkerView;
  v6 = -[SFMagicHeadMarkerView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_positionDegree = a3;
    v6->_containerRadius = a4;
    -[SFMagicHeadMarkerView setBounds:](v6, "setBounds:", 0.0, 0.0, 5.0, 10.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadMarkerView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  return v7;
}

- (void)updateMarkerWithDegreeOffset:(double)a3
{
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = self->_positionDegree + a3;
  self->_currentOffset = v4;
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)&v14.a;
  *(_OWORD *)&v14.c = v7;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v5 = *(_OWORD *)&v14.tx;
  *(float *)&v4 = v4;
  *(float *)&v4 = *(float *)&v4 * 0.0174532925;
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeRotation(&v13, *(float *)&v4);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, 0.0, -self->_containerRadius);
  t1 = v13;
  *(_OWORD *)&t2.a = v6;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = v5;
  CGAffineTransformConcat(&v14, &t1, &t2);
  t2 = v12;
  v9 = v14;
  CGAffineTransformConcat(&t1, &t2, &v9);
  v14 = t1;
  v8 = t1;
  -[SFMagicHeadMarkerView setTransform:](self, "setTransform:", &v8);
}

- (double)currentOffset
{
  return self->_currentOffset;
}

@end
