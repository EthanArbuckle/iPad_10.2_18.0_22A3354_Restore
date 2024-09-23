@implementation UITextRangeImpl

+ (id)wrapDOMRange:(id)a3 withAffinity:(int64_t)a4
{
  id v5;
  UITextRangeImpl *v6;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(UITextRangeImpl);
    -[UITextRangeImpl setDomRange:](v6, "setDomRange:", v5);

    -[UITextRangeImpl setAffinity:](v6, "setAffinity:", a4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)wrapDOMRange:(id)a3
{
  return (id)objc_msgSend(a1, "wrapDOMRange:withAffinity:", a3, 1);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UITextRangeImpl start](self, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeImpl end](self, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%p) - start:%@, end:%@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)adjustAffinityOfPosition:(id)a3 isStart:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[UITextRangeImpl isEmpty](self, "isEmpty"))
    v4 = -[UITextRangeImpl affinity](self, "affinity") == 0;
  objc_msgSend(v7, "webVisiblePosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAffinity:", v4);

}

- (id)start
{
  UITextPositionImpl *v3;
  void *v4;
  void *v5;

  WebThreadLock();
  v3 = objc_alloc_init(UITextPositionImpl);
  -[UITextRangeImpl domRange](self, "domRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextPositionImpl setWebVisiblePosition:](v3, "setWebVisiblePosition:", v5);

  -[UITextRangeImpl adjustAffinityOfPosition:isStart:](self, "adjustAffinityOfPosition:isStart:", v3, 1);
  return v3;
}

- (id)end
{
  UITextPositionImpl *v3;
  void *v4;
  void *v5;

  WebThreadLock();
  v3 = objc_alloc_init(UITextPositionImpl);
  -[UITextRangeImpl domRange](self, "domRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextPositionImpl setWebVisiblePosition:](v3, "setWebVisiblePosition:", v5);

  -[UITextRangeImpl adjustAffinityOfPosition:isStart:](self, "adjustAffinityOfPosition:isStart:", v3, 0);
  return v3;
}

- (BOOL)isEmpty
{
  void *v3;
  char v4;

  WebThreadLock();
  -[UITextRangeImpl domRange](self, "domRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collapsed");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UITextRangeImpl *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int64_t v12;

  v4 = a3;
  WebThreadLock();
  v5 = (UITextRangeImpl *)v4;
  if (self == v5)
  {
    v10 = 1;
    goto LABEL_6;
  }
  -[UITextRangeImpl domRange](self, "domRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeImpl domRange](v5, "domRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
    goto LABEL_3;
  if (!objc_msgSend(v6, "collapsed"))
  {
    if (v6 != v7)
    {
      if ((objc_msgSend(v7, "collapsed") & 1) == 0
        && !objc_msgSend(v6, "compareBoundaryPoints:sourceRange:", 2, v7))
      {
        goto LABEL_15;
      }
      goto LABEL_3;
    }
LABEL_16:
    v10 = 1;
    goto LABEL_4;
  }
  v12 = -[UITextRangeImpl affinity](self, "affinity");
  if (v12 != -[UITextRangeImpl affinity](v5, "affinity"))
    goto LABEL_3;
  if (v6 == v7)
    goto LABEL_16;
  if ((objc_msgSend(v7, "collapsed") & 1) != 0)
  {
LABEL_15:
    v10 = objc_msgSend(v6, "compareBoundaryPoints:sourceRange:", 0, v7) == 0;
    goto LABEL_4;
  }
LABEL_3:
  v10 = 0;
LABEL_4:

LABEL_6:
  return v10;
}

- (DOMRange)domRange
{
  return self->_domRange;
}

- (void)setDomRange:(id)a3
{
  objc_storeStrong((id *)&self->_domRange, a3);
}

- (int64_t)affinity
{
  return self->_affinityIfCollapsed;
}

- (void)setAffinity:(int64_t)a3
{
  self->_affinityIfCollapsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domRange, 0);
}

@end
