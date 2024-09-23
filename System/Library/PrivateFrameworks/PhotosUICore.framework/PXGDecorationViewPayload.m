@implementation PXGDecorationViewPayload

- (PXGDecorationViewPayload)initWithDecorationOptions:(unint64_t)a3 viewClass:(Class)a4 userData:(id)a5
{
  PXGDecorationViewPayload *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGDecorationViewPayload;
  result = -[PXGViewPayload initWithViewClass:userData:](&v7, sel_initWithViewClass_userData_, a4, a5);
  if (result)
    result->_decorationOptions = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PXGDecorationViewPayload *v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = (PXGDecorationViewPayload *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXGDecorationViewPayload;
    if (-[PXGViewPayload isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = -[PXGDecorationViewPayload decorationOptions](v4, "decorationOptions");
      v6 = v5 == -[PXGDecorationViewPayload decorationOptions](self, "decorationOptions");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGDecorationViewPayload;
  v3 = -[PXGViewPayload hash](&v5, sel_hash);
  return v3 ^ (4 * -[PXGDecorationViewPayload decorationOptions](self, "decorationOptions"));
}

- (BOOL)shouldSeparateViewLayers
{
  _BOOL4 v3;
  objc_class *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGDecorationViewPayload;
  v3 = -[PXGViewPayload shouldSeparateViewLayers](&v6, sel_shouldSeparateViewLayers);
  if (v3)
  {
    v4 = -[PXGViewPayload viewClass](self, "viewClass");
    LOBYTE(v3) = v4 != (objc_class *)objc_opt_class();
  }
  return v3;
}

- (int64_t)decorationOptions
{
  return self->_decorationOptions;
}

@end
