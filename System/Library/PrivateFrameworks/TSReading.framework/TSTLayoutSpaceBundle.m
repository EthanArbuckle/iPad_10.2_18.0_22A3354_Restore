@implementation TSTLayoutSpaceBundle

- (TSTLayoutSpaceBundle)initWithLayout:(id)a3
{
  TSTLayoutSpaceBundle *v4;
  TSTLayoutSpaceBundle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTLayoutSpaceBundle;
  v4 = -[TSTLayoutSpaceBundle init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mLayout = (TSTLayout *)a3;
    v4->mSpace = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", v4, 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mSpace = 0;
  self->mFrozenHeaderColumnsSpace = 0;

  self->mFrozenHeaderRowsSpace = 0;
  self->mFrozenHeaderCornerSpace = 0;

  self->mRepeatHeaderColumnsSpace = 0;
  self->mRepeatHeaderRowsSpace = 0;

  self->mRepeatHeaderCornerSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutSpaceBundle;
  -[TSTLayoutSpaceBundle dealloc](&v3, sel_dealloc);
}

- (void)invalidateCoordinates
{
  -[TSTLayoutSpaceBundle performActionOnEachLayoutSpace:](self, "performActionOnEachLayoutSpace:", &__block_literal_global_81);
}

uint64_t __45__TSTLayoutSpaceBundle_invalidateCoordinates__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "invalidateCoordinates");
  return 0;
}

- (void)invalidateTableOffsets
{
  -[TSTLayoutSpaceBundle performActionOnEachLayoutSpace:](self, "performActionOnEachLayoutSpace:", &__block_literal_global_3_1);
}

uint64_t __46__TSTLayoutSpaceBundle_invalidateTableOffsets__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "invalidateTableOffset");
  return 0;
}

- (id)getSpaceContainingCellID:(id)a3
{
  TSTLayoutSpace **p_mSpace;
  unint64_t Range;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v11;
  TSTLayoutSpace **p_mRepeatHeaderRowsSpace;
  TSTLayoutSpace *mRepeatHeaderRowsSpace;
  unint64_t v14;
  void *v15;

  p_mSpace = &self->mSpace;
  Range = TSTLayoutSpaceGetRange((uint64_t)self->mSpace);
  if (HIWORD(Range))
    v7 = (Range & 0xFFFF00000000) == 0;
  else
    v7 = 1;
  if (!v7
    && (unsigned __int16)Range <= a3.var0
    && (unsigned __int16)(Range + HIWORD(Range) - 1) >= a3.var0
    && a3.var1 >= BYTE2(Range)
    && a3.var1 <= (BYTE4(Range) + BYTE2(Range) - 1))
  {
    return *p_mSpace;
  }
  p_mSpace = &self->mRepeatHeaderCornerSpace;
  v8 = TSTLayoutSpaceGetRange((uint64_t)self->mRepeatHeaderCornerSpace);
  v9 = !HIWORD(v8) || (v8 & 0xFFFF00000000) == 0;
  if (!v9
    && (unsigned __int16)v8 <= a3.var0
    && (unsigned __int16)(v8 + HIWORD(v8) - 1) >= a3.var0
    && a3.var1 >= BYTE2(v8)
    && a3.var1 <= (BYTE4(v8) + BYTE2(v8) - 1))
  {
    return *p_mSpace;
  }
  p_mSpace = &self->mRepeatHeaderColumnsSpace;
  v10 = TSTLayoutSpaceGetRange((uint64_t)self->mRepeatHeaderColumnsSpace);
  v11 = !HIWORD(v10) || (v10 & 0xFFFF00000000) == 0;
  if (!v11
    && (unsigned __int16)v10 <= a3.var0
    && (unsigned __int16)(v10 + HIWORD(v10) - 1) >= a3.var0
    && a3.var1 >= BYTE2(v10)
    && a3.var1 <= (BYTE4(v10) + BYTE2(v10) - 1))
  {
    return *p_mSpace;
  }
  mRepeatHeaderRowsSpace = self->mRepeatHeaderRowsSpace;
  p_mRepeatHeaderRowsSpace = &self->mRepeatHeaderRowsSpace;
  v14 = TSTLayoutSpaceGetRange((uint64_t)mRepeatHeaderRowsSpace);
  v15 = 0;
  if (HIWORD(v14) && (v14 & 0xFFFF00000000) != 0)
  {
    if ((unsigned __int16)v14 > a3.var0)
      return 0;
    if ((unsigned __int16)(v14 + HIWORD(v14) - 1) < a3.var0)
      return 0;
    if (a3.var1 < BYTE2(v14))
      return 0;
    p_mSpace = p_mRepeatHeaderRowsSpace;
    if (a3.var1 > (BYTE4(v14) + BYTE2(v14) - 1))
      return 0;
    return *p_mSpace;
  }
  return v15;
}

- (int)validateLayoutSpaces
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v3 = -[TSTLayoutSpace validate:](self->mSpace, "validate:", 0);
  v4 = -[TSTLayoutSpace validate:](self->mFrozenHeaderColumnsSpace, "validate:", self->mSpace) | v3;
  v5 = -[TSTLayoutSpace validate:](self->mFrozenHeaderRowsSpace, "validate:", self->mSpace);
  v6 = v4 | v5 | -[TSTLayoutSpace validate:](self->mFrozenHeaderCornerSpace, "validate:", self->mSpace);
  v7 = -[TSTLayoutSpace validate:](self->mRepeatHeaderColumnsSpace, "validate:", self->mSpace);
  v8 = v7 | -[TSTLayoutSpace validate:](self->mRepeatHeaderRowsSpace, "validate:", self->mSpace);
  return v6 | v8 | -[TSTLayoutSpace validate:](self->mRepeatHeaderCornerSpace, "validate:", self->mSpace);
}

- (void)performActionOnEachLayoutSpace:(id)a3
{
  if (!-[TSTLayoutSpaceBundle performActionOnFrozenLayoutSpaces:](self, "performActionOnFrozenLayoutSpaces:")
    && !-[TSTLayoutSpaceBundle performActionOnRepeatLayoutSpaces:](self, "performActionOnRepeatLayoutSpaces:", a3))
  {
    if (self->mSpace)
      (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)performActionOnFrozenLayoutSpaces:(id)a3
{
  if (self->mFrozenHeaderCornerSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0
    || self->mFrozenHeaderRowsSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0)
  {
    return 1;
  }
  if (self->mFrozenHeaderColumnsSpace)
    return (*((uint64_t (**)(id))a3 + 2))(a3);
  return 0;
}

- (BOOL)performActionOnRepeatLayoutSpaces:(id)a3
{
  if (self->mRepeatHeaderCornerSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0
    || self->mRepeatHeaderRowsSpace && ((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0)
  {
    return 1;
  }
  if (self->mRepeatHeaderColumnsSpace)
    return (*((uint64_t (**)(id))a3 + 2))(a3);
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  TSTLayout *mLayout;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  mLayout = self->mLayout;
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p layout=<%@ %p>\n   mainSpace=<%@ %p>"), v5, self, v7, mLayout, NSStringFromClass(v9), self->mSpace);
  if (self->mFrozenHeaderCornerSpace)
  {
    v11 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "appendFormat:", CFSTR("\n   frozenCorner=<%@ %p>"), NSStringFromClass(v11), self->mFrozenHeaderCornerSpace);
  }
  if (self->mFrozenHeaderRowsSpace)
  {
    v12 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "appendFormat:", CFSTR("\n   frozenRows=<%@ %p>"), NSStringFromClass(v12), self->mFrozenHeaderRowsSpace);
  }
  if (self->mFrozenHeaderColumnsSpace)
  {
    v13 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "appendFormat:", CFSTR("\n   frozenColumns=<%@ %p>"), NSStringFromClass(v13), self->mFrozenHeaderColumnsSpace);
  }
  if (self->mRepeatHeaderCornerSpace)
  {
    v14 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "appendFormat:", CFSTR("\n   repeatCorner=<%@ %p>"), NSStringFromClass(v14), self->mRepeatHeaderCornerSpace);
  }
  if (self->mRepeatHeaderRowsSpace)
  {
    v15 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "appendFormat:", CFSTR("\n   repeatRows=<%@ %p>"), NSStringFromClass(v15), self->mRepeatHeaderRowsSpace);
  }
  if (self->mRepeatHeaderColumnsSpace)
  {
    v16 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "appendFormat:", CFSTR("\n   repeatColumns=<%@ %p>"), NSStringFromClass(v16), self->mRepeatHeaderColumnsSpace);
  }
  objc_msgSend(v10, "appendString:", CFSTR("}>"));
  return v10;
}

- (TSTLayout)layout
{
  return self->mLayout;
}

- (void)setLayout:(id)a3
{
  self->mLayout = (TSTLayout *)a3;
}

- (TSTLayoutSpace)space
{
  return self->mSpace;
}

- (void)setSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSTLayoutSpace)frozenHeaderColumnsSpace
{
  return self->mFrozenHeaderColumnsSpace;
}

- (void)setFrozenHeaderColumnsSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSTLayoutSpace)frozenHeaderRowsSpace
{
  return self->mFrozenHeaderRowsSpace;
}

- (void)setFrozenHeaderRowsSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSTLayoutSpace)frozenHeaderCornerSpace
{
  return self->mFrozenHeaderCornerSpace;
}

- (void)setFrozenHeaderCornerSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSTLayoutSpace)repeatHeaderColumnsSpace
{
  return self->mRepeatHeaderColumnsSpace;
}

- (void)setRepeatHeaderColumnsSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TSTLayoutSpace)repeatHeaderRowsSpace
{
  return self->mRepeatHeaderRowsSpace;
}

- (void)setRepeatHeaderRowsSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (TSTLayoutSpace)repeatHeaderCornerSpace
{
  return self->mRepeatHeaderCornerSpace;
}

- (void)setRepeatHeaderCornerSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
