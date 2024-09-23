@implementation TCVegaCGCanvas

- (TCVegaCGCanvas)init
{
  TCVegaCGCanvas *v2;
  TCVegaCGContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCVegaCGCanvas;
  v2 = -[TCVegaHTMLElement initWithTagName:](&v5, sel_initWithTagName_, CFSTR("canvas"));
  if (v2)
  {
    v3 = objc_alloc_init(TCVegaCGContext);
    -[TCVegaCGCanvas setContext:](v2, "setContext:", v3);

  }
  return v2;
}

- (double)height
{
  void *v2;
  double v3;
  double v4;

  -[TCVegaCGCanvas context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "height");
  v4 = v3;

  return v4;
}

- (void)setHeight:(double)a3
{
  id v4;

  -[TCVegaCGCanvas context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeight:", a3);

}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[TCVegaCGCanvas context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "width");
  v4 = v3;

  return v4;
}

- (void)setWidth:(double)a3
{
  id v4;

  -[TCVegaCGCanvas context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidth:", a3);

}

- (TCVegaCGContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->context, 0);
}

@end
