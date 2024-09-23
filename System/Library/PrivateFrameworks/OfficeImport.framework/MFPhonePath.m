@implementation MFPhonePath

- (MFPhonePath)init
{
  MFPhonePath *v2;
  uint64_t v3;
  OITSUBezierPath *m_path;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFPhonePath;
  v2 = -[MFPhonePath init](&v6, sel_init);
  if (v2)
  {
    +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
    v3 = objc_claimAutoreleasedReturnValue();
    m_path = v2->m_path;
    v2->m_path = (OITSUBezierPath *)v3;

    v2->m_state = 0;
  }
  return v2;
}

- (BOOL)isOpen
{
  return self->m_state == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  MFPhonePath *v6;

  v5 = -[OITSUBezierPath copyWithZone:](self->m_path, "copyWithZone:");
  v6 = -[MFPhonePath initWithPath:state:](+[MFPhonePath allocWithZone:](MFPhonePath, "allocWithZone:", a3), "initWithPath:state:", v5, self->m_state);

  return v6;
}

- (MFPhonePath)initWithPath:(id)a3 state:(int)a4
{
  id v7;
  MFPhonePath *v8;
  MFPhonePath *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFPhonePath;
  v8 = -[MFPhonePath init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->m_path, a3);
    v9->m_state = a4;
  }

  return v9;
}

- (int)begin
{
  -[OITSUBezierPath removeAllPoints](self->m_path, "removeAllPoints");
  -[OITSUBezierPath moveToPoint:](self->m_path, "moveToPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  self->m_state = 1;
  return 0;
}

- (void)appendBezierPath:(id)a3 dc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v6 = a3;
  v7 = a4;
  if (-[MFPhonePath isOpen](self, "isOpen"))
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    objc_msgSend(v7, "getCurrentTransform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "getTransformMatrix");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
    }

    v10 = (void *)objc_msgSend(v6, "copy");
    v11[0] = v12;
    v11[1] = v13;
    v11[2] = v14;
    objc_msgSend(v10, "transformUsingAffineTransform:", v11);
    -[OITSUBezierPath attachBezierPath:](self->m_path, "attachBezierPath:", v10);

  }
}

- (int)closeFigure
{
  if (-[MFPhonePath isOpen](self, "isOpen"))
    -[OITSUBezierPath closePath](self->m_path, "closePath");
  return 0;
}

- (CGPoint)currentPoint
{
  double v3;
  double v4;
  CGPoint result;

  if (-[OITSUBezierPath isEmpty](self->m_path, "isEmpty"))
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  else
  {
    -[OITSUBezierPath currentPoint](self->m_path, "currentPoint");
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (int)end
{
  if (-[MFPhonePath isOpen](self, "isOpen"))
    self->m_state = 2;
  return 0;
}

- (int)fill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = a3;
  v5 = v4;
  if (self->m_state == 2)
  {
    memset(&v14, 0, sizeof(v14));
    objc_msgSend(v4, "getCurrentTransform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "getTransformMatrix");
    else
      memset(&v13, 0, sizeof(v13));
    CGAffineTransformInvert(&v14, &v13);

    v9 = (void *)-[OITSUBezierPath copy](self->m_path, "copy");
    v12 = v14;
    objc_msgSend(v9, "transformUsingAffineTransform:", &v12);
    objc_msgSend(v5, "getBrush");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fillPath:in_path:", v5, v9);

    v8 = 0;
  }
  else
  {
    v8 = -7;
  }

  return v8;
}

- (id)getBezierPath
{
  return self->m_path;
}

- (int)stroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = a3;
  v5 = v4;
  if (self->m_state == 2)
  {
    memset(&v14, 0, sizeof(v14));
    objc_msgSend(v4, "getCurrentTransform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "getTransformMatrix");
    else
      memset(&v13, 0, sizeof(v13));
    CGAffineTransformInvert(&v14, &v13);

    v9 = (void *)-[OITSUBezierPath copy](self->m_path, "copy");
    v12 = v14;
    objc_msgSend(v9, "transformUsingAffineTransform:", &v12);
    objc_msgSend(v5, "getPen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokePath:in_path:", v5, v9);

    v8 = 0;
  }
  else
  {
    v8 = -7;
  }

  return v8;
}

- (int)state
{
  return self->m_state;
}

- (int)abort
{
  -[OITSUBezierPath removeAllPoints](self->m_path, "removeAllPoints");
  self->m_state = 0;
  return 0;
}

- (int)flatten
{
  if (-[MFPhonePath isOpen](self, "isOpen"))
    -[OITSUBezierPath setFlatness:](self->m_path, "setFlatness:", 3.40282347e38);
  return 0;
}

- (int)widen:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_path, 0);
}

@end
