@implementation TSDDefaultHint

- (TSDDefaultHint)initWithBounds:(CGRect)a3 edges:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDDefaultHint *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)TSDDefaultHint;
  result = -[TSDDefaultHint init](&v10, sel_init);
  if (result)
  {
    result->mBounds.origin.x = x;
    result->mBounds.origin.y = y;
    result->mBounds.size.width = width;
    result->mBounds.size.height = height;
    result->mEdges = a4;
  }
  return result;
}

- (id)copyForArchiving
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDefaultHint copyForArchiving]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultHint.m"), 36, CFSTR("Should not be copying default hints."));
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBounds:edges:", self->mEdges, self->mBounds.origin.x, self->mBounds.origin.y, self->mBounds.size.width, self->mBounds.size.height);
}

- (BOOL)isLastPartitionHorizontally:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = -[TSDDefaultHint edges](self, "edges");
  v5 = 4;
  if (v3)
    v5 = 8;
  return (v4 & v5) != 0;
}

- (BOOL)overlapsWithSelection:(id)a3
{
  return 0;
}

- (id)firstChildHint
{
  return 0;
}

- (id)lastChildHint
{
  return 0;
}

+ (Class)archivedHintClass
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDDefaultHint archivedHintClass]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultHint.m"), 70, CFSTR("Can't archive default hints."));
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TSDDefaultHint)initWithCoder:(id)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDDefaultHint;
  v4 = -[TSDDefaultHint init](&v12, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bounds"));
    if (v5)
    {
      objc_msgSend(v5, "CGRectValue");
      *((_QWORD *)v4 + 1) = v6;
      *((_QWORD *)v4 + 2) = v7;
      *((_QWORD *)v4 + 3) = v8;
      *((_QWORD *)v4 + 4) = v9;
    }
    else
    {
      v10 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      *(_OWORD *)(v4 + 8) = *MEMORY[0x24BDBF090];
      *(_OWORD *)(v4 + 24) = v10;
    }
    *((_QWORD *)v4 + 5) = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("edges"));
  }
  return (TSDDefaultHint *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  v5 = (void *)MEMORY[0x24BDD1968];
  -[TSDDefaultHint bounds](self, "bounds");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v5, "valueWithCGRect:"), CFSTR("bounds"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[TSDDefaultHint edges](self, "edges"), CFSTR("edges"));
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)edges
{
  return self->mEdges;
}

@end
