@implementation IPAShortestEdgeImageSizePolicy

- (IPAShortestEdgeImageSizePolicy)initWithShortestEdge:(double)a3
{
  IPAShortestEdgeImageSizePolicy *result;
  IPAShortestEdgeImageSizePolicy *v5;
  SEL v6;
  objc_super v7;

  if (a3 <= 0.0)
  {
    v5 = (IPAShortestEdgeImageSizePolicy *)_PFAssertFailHandler();
    return (IPAShortestEdgeImageSizePolicy *)-[IPAShortestEdgeImageSizePolicy isBestFitPolicy](v5, v6);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IPAShortestEdgeImageSizePolicy;
    result = -[IPAShortestEdgeImageSizePolicy init](&v7, sel_init);
    if (result)
      result->_shortestEdge = a3;
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (CGSize)transformSize:(CGSize)result
{
  double width;
  double height;
  double shortestEdge;
  double v7;

  width = result.width;
  if (result.width >= result.height)
    height = result.height;
  else
    height = result.width;
  shortestEdge = self->_shortestEdge;
  if (height > 0.0 && shortestEdge < height)
  {
    if (width == result.height)
    {
      result.height = self->_shortestEdge;
    }
    else
    {
      v7 = shortestEdge / height;
      if (width < result.height)
      {
        result.height = result.height * v7;
      }
      else
      {
        result.height = self->_shortestEdge;
        shortestEdge = width * v7;
      }
    }
  }
  else
  {
    shortestEdge = width;
  }
  result.width = shortestEdge;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> shortestEdge=%f"), objc_opt_class(), self, *(_QWORD *)&self->_shortestEdge);
}

- (IPAShortestEdgeImageSizePolicy)initWithCoder:(id)a3
{
  id v3;
  IPAShortestEdgeImageSizePolicy *v4;
  float v5;
  float v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPAShortestEdgeImageSizePolicy;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("shortest edge"), v8.receiver, v8.super_class);
  v6 = v5;

  v4->_shortestEdge = v6;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double shortestEdge;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAShortestEdgeImageSizePolicy;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  shortestEdge = self->_shortestEdge;
  *(float *)&shortestEdge = shortestEdge;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("shortest edge"), shortestEdge, v6.receiver, v6.super_class);

}

- (BOOL)isEqual:(id)a3
{
  return self->_shortestEdge == *((double *)a3 + 1);
}

- (unint64_t)hash
{
  return (unint64_t)self->_shortestEdge;
}

@end
