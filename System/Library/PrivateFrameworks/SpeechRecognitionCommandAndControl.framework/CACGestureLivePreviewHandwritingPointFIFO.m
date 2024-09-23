@implementation CACGestureLivePreviewHandwritingPointFIFO

- (CACGestureLivePreviewHandwritingPointFIFO)initWithFIFO:(id)a3
{
  id v4;
  CACGestureLivePreviewHandwritingPointFIFO *v5;
  CACGestureLivePreviewHandwritingPointFIFO *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CACGestureLivePreviewHandwritingPointFIFO;
  v5 = -[CACGestureLivePreviewHandwritingPointFIFO init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CACGestureLivePreviewHandwritingPointFIFO setNextFIFO:](v5, "setNextFIFO:", v4);

  return v6;
}

- (void)emitPoint:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  -[CACGestureLivePreviewHandwritingPointFIFO nextFIFO](self, "nextFIFO", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addPoint:", v8, v7, v6);

}

- (void)flush
{
  id v2;

  -[CACGestureLivePreviewHandwritingPointFIFO nextFIFO](self, "nextFIFO");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

- (void)clear
{
  id v2;

  -[CACGestureLivePreviewHandwritingPointFIFO nextFIFO](self, "nextFIFO");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (CACGestureLivePreviewHandwritingPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)setNextFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_nextFIFO, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextFIFO, 0);
}

@end
