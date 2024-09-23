@implementation RBSymbolShapeLayer

- (RBSymbolShapeLayer)initWithLayer:(id)a3
{
  RBSymbolShapeLayer *v4;
  RBSymbolShapeLayer *v5;
  uint64_t *v6;
  _QWORD *p_info;
  uint64_t info;
  uint64_t callbacks;
  RBPathCallbacks *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RBSymbolShapeLayer;
  v4 = -[RBSymbolShapeLayer initWithLayer:](&v12, sel_initWithLayer_);
  v5 = v4;
  if (v4)
  {
    v6 = (uint64_t *)((char *)a3 + 32);
    p_info = &v4->_rbPath._p.info;
    info = (uint64_t)v4->_rbPath._p.info;
    if (info != *v6)
    {
      callbacks = (uint64_t)v5->_rbPath._p.callbacks;
LABEL_5:
      RBPathRelease(info, callbacks);
      *p_info = RBPathRetain(*v6, v6[1]);
      v5->_rbPath._p.callbacks = v10;
      return v5;
    }
    callbacks = (uint64_t)v5->_rbPath._p.callbacks;
    if (callbacks != v6[1])
      goto LABEL_5;
  }
  return v5;
}

- (void)setRBPath:(uint64_t)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGPathRef v9;

  if (a1 && (RBPathEqualToPath(a2, a3, a1[4], (void *)a1[5]) & 1) == 0)
  {
    v6 = a1[4];
    if ((const CGPath *)v6 == a2)
    {
      v7 = a1[5];
      if (v7 == a3)
        goto LABEL_7;
    }
    else
    {
      v7 = a1[5];
    }
    RBPathRelease(v6, v7);
    a1[4] = RBPathRetain((uint64_t)a2, a3);
    a1[5] = v8;
LABEL_7:
    v9 = RBPathCopyCGPath(a2, a3);
    objc_msgSend(a1, "setPath:", v9);
    if (v9)
      CFRelease(v9);
  }
}

- (void).cxx_destruct
{
  RBPathRelease((uint64_t)self->_rbPath._p.info, (uint64_t)self->_rbPath._p.callbacks);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = RBPathEmpty;
  return self;
}

@end
