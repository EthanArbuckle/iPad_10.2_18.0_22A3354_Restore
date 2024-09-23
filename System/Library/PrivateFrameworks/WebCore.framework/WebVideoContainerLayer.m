@implementation WebVideoContainerLayer

- (void)setPlayerLayer:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_playerLayer.m_ptr;
  self->_playerLayer.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (AVPlayerLayer)playerLayer
{
  return (AVPlayerLayer *)self->_playerLayer.m_ptr;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)WebVideoContainerLayer;
  -[WebVideoContainerLayer setBounds:](&v17, sel_setBounds_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)-[WebVideoContainerLayer sublayers](self, "sublayers", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setFrame:", x, y, width, height);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  objc_super v7;
  CATransform3D v8;
  CGAffineTransform v9;
  CATransform3D v10;

  y = a3.y;
  x = a3.x;
  if (self)
  {
    -[WebVideoContainerLayer transform](self, "transform");
    if (!CATransform3DIsIdentity(&v10))
    {
      -[WebVideoContainerLayer transform](self, "transform");
LABEL_6:
      CATransform3DGetAffineTransform(&v9, &v8);
      v6 = y * v9.d + v9.b * x;
      x = v9.tx + y * v9.c + v9.a * x;
      y = v9.ty + v6;
    }
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    if (!CATransform3DIsIdentity(&v10))
    {
      memset(&v8, 0, sizeof(v8));
      goto LABEL_6;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)WebVideoContainerLayer;
  -[WebVideoContainerLayer setPosition:](&v7, sel_setPosition_, x, y);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_playerLayer.m_ptr;
  self->_playerLayer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
