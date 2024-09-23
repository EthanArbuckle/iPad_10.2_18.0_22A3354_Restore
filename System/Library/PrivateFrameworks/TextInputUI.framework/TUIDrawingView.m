@implementation TUIDrawingView

- (void)setPath:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_storeStrong((id *)&self->_path, a3);
  v5 = a3;
  -[TUIDrawingView shapeLayer](self, "shapeLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "CGPath");

  objc_msgSend(v8, "setPath:", v7);
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
