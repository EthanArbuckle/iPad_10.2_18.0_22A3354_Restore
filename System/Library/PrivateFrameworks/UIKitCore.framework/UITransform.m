@implementation UITransform

- (UITransform)init
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return (UITransform *)-[UITransform _initWithTransform:](self, "_initWithTransform:", v4);
}

- (id)_initWithTransform:(CGAffineTransform *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITransform;
  result = -[UITransform init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->a;
    v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)((char *)result + 40) = *(_OWORD *)&a3->tx;
    *(_OWORD *)((char *)result + 24) = v6;
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

+ (id)identity
{
  return objc_alloc_init(UITransform);
}

+ (id)transformWithCGAffineTransform:(CGAffineTransform *)a3
{
  UITransform *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = [UITransform alloc];
  v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  return -[UITransform _initWithTransform:](v4, "_initWithTransform:", v7);
}

+ (id)rotationWithDegrees:(int64_t)a3
{
  BSDegreesToRadians();
  return (id)objc_msgSend(a1, "rotationWithRadians:");
}

+ (id)rotationWithRadians:(double)a3
{
  UITransform *v4;
  CGAffineTransform v6;

  v4 = [UITransform alloc];
  CGAffineTransformMakeRotation(&v6, a3);
  return -[UITransform _initWithTransform:](v4, "_initWithTransform:", &v6);
}

+ (id)translation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  UITransform *v5;
  CGAffineTransform v7;

  y = a3.y;
  x = a3.x;
  v5 = [UITransform alloc];
  CGAffineTransformMakeTranslation(&v7, x, y);
  return -[UITransform _initWithTransform:](v5, "_initWithTransform:", &v7);
}

+ (id)scaleX:(double)a3 scaleY:(double)a4
{
  UITransform *v6;
  CGAffineTransform v8;

  v6 = [UITransform alloc];
  CGAffineTransformMakeScale(&v8, a3, a4);
  return -[UITransform _initWithTransform:](v6, "_initWithTransform:", &v8);
}

+ (id)scale:(double)a3
{
  UITransform *v4;
  CGAffineTransform v6;

  v4 = [UITransform alloc];
  CGAffineTransformMakeScale(&v6, a3, a3);
  return -[UITransform _initWithTransform:](v4, "_initWithTransform:", &v6);
}

- (unint64_t)hash
{
  return (unint64_t)self->_transform.a
       + (unint64_t)self->_transform.b
       + (unint64_t)self->_transform.c
       + (unint64_t)self->_transform.tx
       * (unint64_t)self->_transform.d
       * (unint64_t)self->_transform.ty
       + 199;
}

- (BOOL)isEqual:(id)a3
{
  UITransform *v4;
  UITransform *v5;
  BOOL v6;
  CGAffineTransform v8;
  CGAffineTransform t1;

  v4 = (UITransform *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UITransform transform](self, "transform");
    -[UITransform transform](v5, "transform");
    v6 = CGAffineTransformEqualToTransform(&t1, &v8);
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (NSString)description
{
  return (NSString *)-[UITransform descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UITransform succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  UITransform *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__UITransform_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E16B1B50;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

void __41__UITransform_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(v1 + 24);
  v6 = *(_OWORD *)(v1 + 40);
  v4 = *(_OWORD *)(v1 + 8);
  BSNSStringFromCGAffineTransform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("transform"), v4, v5, v6);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UITransform descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

@end
