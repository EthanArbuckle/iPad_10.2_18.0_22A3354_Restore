@implementation _UITileLayer

- (void)setNeedsDisplay
{
  objc_super v2;

  atomic_store(0, (unsigned __int8 *)&self->pendingDeferredOffscreenSetNeedsDisplay);
  v2.receiver = self;
  v2.super_class = (Class)_UITileLayer;
  -[_UITileLayer setNeedsDisplay](&v2, sel_setNeedsDisplay);
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  id v7;

  -[_UITileLayer superlayer](self, "superlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITileLayer frame](self, "frame");
  objc_msgSend(v7, "_drawInContext:offset:clip:", a3, -[UIBezierPath CGPath](self->maskPath, "CGPath"), v5, v6);

}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->maskPath, 0);
}

@end
