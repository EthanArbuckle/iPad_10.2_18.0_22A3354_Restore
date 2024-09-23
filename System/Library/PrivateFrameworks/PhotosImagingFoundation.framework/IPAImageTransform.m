@implementation IPAImageTransform

- (IPAImageTransform)init
{
  IPAImageTransform *result;

  result = (IPAImageTransform *)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (IPAImageTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4
{
  id v7;
  id v8;
  void *v9;
  IPAImageTransform *v10;
  IPAImageTransform *v11;
  IPAImageTransform *result;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)IPAImageTransform;
    v10 = -[IPAImageTransform init](&v13, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_inputGeometry, a3);
      objc_storeStrong((id *)&v11->_intrinsicGeometry, a4);
    }

    return v11;
  }
  else
  {
    result = (IPAImageTransform *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (id)inputGeometry
{
  return self->_inputGeometry;
}

- (id)intrinsicGeometry
{
  return self->_intrinsicGeometry;
}

- (id)inverseTransform
{
  objc_class *v2;
  id result;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  result = (id)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (BOOL)canAlignToPixelsExactly
{
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p inputGeometry:%@ intrinsicGeometry:%@>"), v5, self, self->_inputGeometry, self->_intrinsicGeometry);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intrinsicGeometry, 0);
  objc_storeStrong((id *)&self->_inputGeometry, 0);
}

+ (id)identityTransformForGeometry:(id)a3
{
  id v3;
  IPAImageIdentityTransform *v4;
  id result;

  v3 = a3;
  if (v3)
  {
    v4 = -[IPAImageTransform initWithInputGeometry:intrinsicGeometry:]([IPAImageIdentityTransform alloc], "initWithInputGeometry:intrinsicGeometry:", v3, v3);

    return v4;
  }
  else
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

+ (id)compositeTransforms:(id)a3
{
  id v3;
  IPAImageTransformSequence *v4;
  id result;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[IPAImageTransformSequence initWithTransforms:]([IPAImageTransformSequence alloc], "initWithTransforms:", v3);

    return v4;
  }
  else
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

@end
