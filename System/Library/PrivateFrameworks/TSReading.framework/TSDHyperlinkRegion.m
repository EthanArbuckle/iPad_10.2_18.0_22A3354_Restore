@implementation TSDHyperlinkRegion

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDHyperlinkRegion;
  -[TSDHyperlinkRegion dealloc](&v3, sel_dealloc);
}

+ (id)hyperlinkRegionWithURL:(id)a3 bezierPath:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:bezierPath:", a3, a4);
}

- (TSDHyperlinkRegion)initWithURL:(id)a3 bezierPath:(id)a4
{
  TSDHyperlinkRegion *v6;
  TSDBezierPath *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDHyperlinkRegion;
  v6 = -[TSDHyperlinkRegion init](&v9, sel_init);
  if (v6)
  {
    v6->mURL = (NSURL *)a3;
    v7 = objc_alloc_init(TSDBezierPath);
    v6->mBezierPath = v7;
    -[TSDBezierPath appendBezierPath:](v7, "appendBezierPath:", a4);
  }
  return v6;
}

- (NSURL)URL
{
  return self->mURL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSDBezierPath)bezierPath
{
  return self->mBezierPath;
}

- (void)setBezierPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
