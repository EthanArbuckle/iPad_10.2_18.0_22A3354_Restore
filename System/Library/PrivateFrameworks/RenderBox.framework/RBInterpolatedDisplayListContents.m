@implementation RBInterpolatedDisplayListContents

- (id)initWithInterpolator:(float)a3 by:
{
  id *v5;
  uint64_t v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)RBInterpolatedDisplayListContents;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a2, "copy");

    v5[1] = (id)v6;
    *((float *)v5 + 4) = a3;
  }
  return v5;
}

- (void)_contentsWithScale:(double)a3@<D0>
{
  os_unfair_lock_s *v6;
  void *v7;
  _QWORD *v8;
  double v9;
  uint64_t v10;

  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 20);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    v7 = *(void **)(a1 + 24);
    if (!v7 || *(double *)(a1 + 32) != a3)
    {
      v8 = (_QWORD *)objc_opt_new();
      objc_msgSend(v8, "setDeviceScale:", a3);
      LODWORD(v9) = 1.0;
      objc_msgSend((id)a1, "_drawInState:alpha:", v8[35], v9);
      v10 = objc_msgSend(v8, "moveContents");

      *(_QWORD *)(a1 + 24) = v10;
      *(double *)(a1 + 32) = a3;

      v7 = *(void **)(a1 + 24);
    }
    *a2 = v7;
    os_unfair_lock_unlock(v6);
  }
  else
  {
    *a2 = 0;
  }
}

- (BOOL)isEmpty
{
  RBDisplayListInterpolator *p;
  _RBDisplayListContents *v3;
  _RBDisplayListContents *v4;
  BOOL result;

  p = self->_interp._p;
  result = 0;
  if (p)
  {
    v3 = p->_from._p;
    if (!v3 || -[_RBDisplayListContents isEmpty](v3, "isEmpty"))
    {
      v4 = p->_to._p;
      if (!v4 || (-[_RBDisplayListContents isEmpty](v4, "isEmpty") & 1) != 0)
        return 1;
    }
  }
  return result;
}

- (CGRect)boundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  *(float *)&v2 = self->_progress;
  -[RBDisplayListInterpolator boundingRectWithProgress:](self->_interp._p, "boundingRectWithProgress:", v2);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)drawInState:(_RBDrawingState *)a3
{
  -[RBDisplayListInterpolator _drawInState:alpha:by:]((uint64_t)self->_interp._p, (unsigned int **)a3, 1.0, self->_progress);
}

- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4
{
  -[RBDisplayListInterpolator _drawInState:alpha:by:]((uint64_t)self->_interp._p, (unsigned int **)a3, a4, self->_progress);
}

- (void)renderInContext:(CGContext *)a3 options:(id)a4
{
  void *v7;
  double v8;
  id v9;
  id v10;

  v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBDisplayListRenderRasterizationScale);
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    v8 = 1.0;
  -[RBInterpolatedDisplayListContents _contentsWithScale:]((uint64_t)self, &v10, v8);
  v9 = v10;
  objc_msgSend(v10, "renderInContext:options:", a3, a4);

}

- (NSString)xmlDescription
{
  id v2;
  NSString *v3;
  id v5;

  -[RBInterpolatedDisplayListContents _contentsWithScale:]((uint64_t)self, &v5, 1.0);
  v2 = v5;
  v3 = (NSString *)objc_msgSend(v5, "xmlDescription");

  return v3;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v9;

  -[RBInterpolatedDisplayListContents _contentsWithScale:]((uint64_t)self, &v9, 1.0);
  v6 = v9;
  v7 = (void *)objc_msgSend(v9, "encodedDataForDelegate:error:", a3, a4);

  return v7;
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  return +[RBMovedDisplayListContents decodedObjectWithData:delegate:error:](RBMovedDisplayListContents, "decodedObjectWithData:delegate:error:", a3, a4, a5);
}

- (const)_rb_contents
{
  id v2;
  const void *v3;
  id v5;

  -[RBInterpolatedDisplayListContents _contentsWithScale:]((uint64_t)self, &v5, 1.0);
  v2 = v5;
  v3 = (const void *)objc_msgSend(v5, "_rb_contents");

  return v3;
}

- (const)_rb_xml_document
{
  id v2;
  const void *v3;
  id v5;

  -[RBInterpolatedDisplayListContents _contentsWithScale:]((uint64_t)self, &v5, 1.0);
  v2 = v5;
  v3 = (const void *)objc_msgSend(v5, "_rb_xml_document");

  return v3;
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
