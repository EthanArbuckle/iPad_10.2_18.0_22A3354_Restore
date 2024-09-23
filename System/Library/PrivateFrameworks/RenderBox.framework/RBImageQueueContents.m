@implementation RBImageQueueContents

- (void)CA_prepareRenderValue
{
  -[_CAImageQueue CA_prepareRenderValue](self->_queue._p, "CA_prepareRenderValue");
}

- (void)CA_copyRenderValue
{
  return (void *)-[_CAImageQueue CA_copyRenderValue](self->_queue._p, "CA_copyRenderValue");
}

- (void)setSurface:(uint64_t)a1
{
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;

  if (a1)
  {
    v4 = *(unsigned int **)(a1 + 16);
    if (v4 == a2)
    {
LABEL_11:

      *(_QWORD *)(a1 + 24) = 0;
      return;
    }
    if (!v4)
      goto LABEL_7;
    v5 = v4 + 2;
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 8))(v4);
      if (a2)
      {
LABEL_8:
        v8 = a2 + 2;
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
    }
    else
    {
LABEL_7:
      if (a2)
        goto LABEL_8;
    }
    *(_QWORD *)(a1 + 16) = a2;
    goto LABEL_11;
  }
}

- (_QWORD)initWithSlots:(void *)a1
{
  _QWORD *v1;
  uint64_t v2;
  const void *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)RBImageQueueContents;
  v1 = objc_msgSendSuper2(&v5, sel_init);
  if (v1)
  {
    v2 = CAImageQueueCreate();
    v3 = (const void *)v1[1];
    if (v3)
      CFRelease(v3);
    v1[1] = v2;
    CAImageQueueSetFlags();
  }
  return v1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = RB::SurfacePool::shared((RB::SurfacePool *)self);
  RB::SurfacePool::erase_queue(v3, (CFTypeRef *)&self->_queue._p);
  v4.receiver = self;
  v4.super_class = (Class)RBImageQueueContents;
  -[RBImageQueueContents dealloc](&v4, sel_dealloc);
}

- (void)CA_copyRenderValueWithColorspace:(CGColorSpace *)a3
{
  return (void *)-[_CAImageQueue CA_copyRenderValueWithColorspace:](self->_queue._p, "CA_copyRenderValueWithColorspace:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBImageQueueContents)initWithCoder:(id)a3
{
  RBImageQueueContents *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBImageQueueContents;
  v3 = -[RBImageQueueContents init](&v5, sel_init, a3);
  if (v3)

  return 0;
}

- (id)replacementObjectForCoder:(id)a3
{
  Surface *p;

  p = self->_surface._p;
  if (p)
    RBUpdateIOSurfaceCodingProxy(&self->_proxy._p, *((_QWORD *)p + 6));
  return self->_proxy._p;
}

- (void).cxx_destruct
{
  Surface *p;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  _CAImageQueue *v7;

  p = self->_surface._p;
  if (p)
  {
    v4 = (unsigned int *)((char *)p + 8);
    do
    {
      v5 = __ldxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      __dmb(9u);
      (*(void (**)(Surface *))(*(_QWORD *)p + 8))(p);
    }
  }
  v7 = self->_queue._p;
  if (v7)
    CFRelease(v7);
}

@end
