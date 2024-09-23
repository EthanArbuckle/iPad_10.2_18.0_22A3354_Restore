@implementation _PIParallaxClockLayoutResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PIParallaxClockLayoutResult clockLayerOrder](self, "clockLayerOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PIParallaxClockLayoutResult clockIntersection](self, "clockIntersection");
  v7 = CFSTR("NO");
  if (v6 == 1)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p layerOrder:%@ intersectsForeground:%@>"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)clockLayerOrder
{
  return self->_clockLayerOrder;
}

- (void)setClockLayerOrder:(id)a3
{
  objc_storeStrong((id *)&self->_clockLayerOrder, a3);
}

- (unint64_t)clockIntersection
{
  return self->_clockIntersection;
}

- (void)setClockIntersection:(unint64_t)a3
{
  self->_clockIntersection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockLayerOrder, 0);
}

@end
