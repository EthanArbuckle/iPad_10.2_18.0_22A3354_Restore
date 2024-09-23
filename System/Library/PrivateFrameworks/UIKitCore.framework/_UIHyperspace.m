@implementation _UIHyperspace

- (_UIHyperspace)initWithDimensions:(unint64_t)a3
{
  _UIHyperspace *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIHyperspace;
  result = -[_UIHyperspace init](&v5, sel_init);
  if (result)
    result->__dimensions = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; dimensions = %lu>"),
                       objc_opt_class(),
                       self,
                       self->__dimensions);
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  cblas_dcopy_NEWLAPACK();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperspace)initWithCoder:(id)a3
{
  return -[_UIHyperspace initWithDimensions:](self, "initWithDimensions:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_dimensions")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->__dimensions, CFSTR("_dimensions"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UIHyperspace initWithDimensions:]([_UIHyperspace alloc], "initWithDimensions:", -[_UIHyperspace _dimensions](self, "_dimensions"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperspace _dimensions](self, "_dimensions");
    v7 = objc_msgSend(v5, "_dimensions");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

@end
