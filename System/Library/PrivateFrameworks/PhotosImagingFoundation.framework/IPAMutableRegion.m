@implementation IPAMutableRegion

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IPARegion initWithRegion:](+[IPARegion allocWithZone:](IPARegion, "allocWithZone:", a3), "initWithRegion:", self);
}

- (void)addRect:(CGRect)a3
{
  PA::Region *imp;
  CGRect v4;

  imp = (PA::Region *)self->super._imp;
  v4 = a3;
  PA::Region::Add(imp, (const PA::Rect *)&v4);
}

- (void)removeRect:(CGRect)a3
{
  PA::Region *imp;
  CGRect v4;
  _BYTE v5[16];
  uint64_t v6;

  imp = (PA::Region *)self->super._imp;
  v4 = a3;
  PA::Region::Region((PA::Region *)v5, (const PA::Rect *)&v4);
  PA::Region::Break(v6, (uint64_t)imp);
  PA::Region::MergeVertically(imp);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
}

- (void)addRegion:(id)a3
{
  if (a3)
    PA::Region::Add((PA::Region *)self->super._imp, *((const PA::Region **)a3 + 1));
}

- (void)removeRegion:(id)a3
{
  PA::Region *imp;

  if (a3)
  {
    imp = (PA::Region *)self->super._imp;
    PA::Region::Break(*(_QWORD *)(*((_QWORD *)a3 + 1) + 16), (uint64_t)imp);
    PA::Region::MergeVertically(imp);
  }
}

- (void)addRectArray:(id)a3
{
  id v4;

  +[IPARegion regionWithRectArray:](IPARegion, "regionWithRectArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IPAMutableRegion addRegion:](self, "addRegion:");

}

- (void)removeRectArray:(id)a3
{
  id v4;

  +[IPARegion regionWithRectArray:](IPARegion, "regionWithRectArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IPAMutableRegion removeRegion:](self, "removeRegion:");

}

- (void)clipToRect:(CGRect)a3
{
  PA::Region *imp;
  CGRect v4;

  imp = (PA::Region *)self->super._imp;
  v4 = a3;
  PA::Region::Clip(imp, (const PA::Rect *)&v4);
}

- (void)clipToRegion:(id)a3
{
  if (a3)
    PA::Region::Clip((PA::Region *)self->super._imp, *((const PA::Region **)a3 + 1));
}

- (void)clipToRectArray:(id)a3
{
  id v4;

  +[IPARegion regionWithRectArray:](IPARegion, "regionWithRectArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IPAMutableRegion clipToRegion:](self, "clipToRegion:");

}

- (void)diffWithRect:(CGRect)a3
{
  PA::Region *imp;
  CGRect v4;
  _BYTE v5[40];

  imp = (PA::Region *)self->super._imp;
  v4 = a3;
  PA::Region::Region((PA::Region *)v5, (const PA::Rect *)&v4);
  PA::Region::Diff(imp, (const PA::Region *)v5);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
}

- (void)diffWithRegion:(id)a3
{
  if (a3)
    PA::Region::Diff((PA::Region *)self->super._imp, *((const PA::Region **)a3 + 1));
}

- (void)flipInRect:(CGRect)a3
{
  double x;
  __int128 *imp;
  uint64_t *v5;
  double v6;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int v12;

  x = a3.origin.x;
  imp = (__int128 *)self->super._imp;
  v10 = 0u;
  v11 = 0u;
  v12 = 1065353216;
  v5 = (uint64_t *)*((_QWORD *)imp + 2);
  if (v5)
  {
    v6 = a3.origin.y + a3.size.height;
    do
    {
      v7 = *((_OWORD *)v5 + 2);
      v8[0] = *((_OWORD *)v5 + 1);
      v8[1] = v7;
      v9 = v5[6];
      *(double *)v8 = *(double *)v8 - x;
      *((double *)v8 + 1) = v6 - (*((double *)v8 + 1) + *((double *)&v7 + 1));
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>((uint64_t)&v10, v8, (uint64_t)v8);
      v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
  if (&v10 != imp)
  {
    *((_DWORD *)imp + 8) = v12;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v11);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v10);
}

- (void)translateBy:(CGPoint)a3
{
  double x;
  __int128 *imp;
  uint64_t *v5;
  double y;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int v12;

  x = a3.x;
  imp = (__int128 *)self->super._imp;
  v10 = 0u;
  v11 = 0u;
  v12 = 1065353216;
  v5 = (uint64_t *)*((_QWORD *)imp + 2);
  if (v5)
  {
    y = a3.y;
    do
    {
      v7 = *((_OWORD *)v5 + 2);
      v8[0] = *((_OWORD *)v5 + 1);
      v8[1] = v7;
      v9 = v5[6];
      *(double *)v8 = *(double *)v8 + x;
      *((double *)v8 + 1) = *((double *)v8 + 1) + y;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>((uint64_t)&v10, v8, (uint64_t)v8);
      v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
  if (&v10 != imp)
  {
    *((_DWORD *)imp + 8) = v12;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v11);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v10);
}

- (void)scaleBy:(CGPoint)a3
{
  __int128 *imp;
  double y;
  double x;
  uint64_t *i;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  int v16;
  CGRect v17;

  imp = (__int128 *)self->super._imp;
  if (a3.x == 0.0 || (y = a3.y, a3.y == 0.0))
  {
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear((_QWORD *)self->super._imp);
  }
  else
  {
    x = a3.x;
    v14 = 0u;
    v15 = 0u;
    v16 = 1065353216;
    for (i = (uint64_t *)*((_QWORD *)imp + 2); i; i = (uint64_t *)*i)
    {
      v7 = *((_OWORD *)i + 2);
      v11 = *((_OWORD *)i + 1);
      v12 = v7;
      v13 = i[6];
      v8 = *(double *)&v11 * x;
      *(double *)&v7 = *((double *)&v11 + 1) * y;
      v9 = *(double *)&v12 * x;
      v10 = *((double *)&v12 + 1) * y;
      v17 = CGRectStandardize(*(CGRect *)((char *)&v7 - 8));
      *(CGFloat *)&v11 = v17.origin.x;
      *((_QWORD *)&v11 + 1) = *(_QWORD *)&v17.origin.y;
      *(CGFloat *)&v12 = v17.size.width;
      *((_QWORD *)&v12 + 1) = *(_QWORD *)&v17.size.height;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>((uint64_t)&v14, &v11, (uint64_t)&v11);
    }
    if (&v14 != imp)
    {
      *((_DWORD *)imp + 8) = v16;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v15);
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v14);
  }
}

- (void)clear
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear((_QWORD *)self->super._imp);
}

- (void)setRegion:(id)a3
{
  uint64_t v4;
  _DWORD *imp;
  _QWORD *v6;

  v6 = a3;
  v4 = v6[1];
  imp = self->super._imp;
  if (imp != (_DWORD *)v4)
  {
    imp[8] = *(_DWORD *)(v4 + 32);
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, *(uint64_t **)(v4 + 16));
  }

}

- (void)growBy:(CGPoint)a3
{
  IPAMutableRegion *v3;
  SEL v4;
  CGPoint v5;
  CGRect v6;

  if (a3.x < 0.0 || a3.y < 0.0)
  {
    v3 = (IPAMutableRegion *)_PFAssertFailHandler();
    -[IPAMutableRegion growBy:inRect:](v3, v4, v5, v6);
  }
  else
  {
    PA::Region::Grow((PA::Region *)self->super._imp, a3.x, a3.y);
  }
}

- (void)growBy:(CGPoint)a3 inRect:(CGRect)a4
{
  PA::Region *imp;
  IPAMutableRegion *v5;
  SEL v6;
  CGRect v7;
  CGPoint v8;

  if (a3.x < 0.0 || a3.y < 0.0)
  {
    v5 = (IPAMutableRegion *)_PFAssertFailHandler();
    -[IPAMutableRegion shrinkBy:](v5, v6, v8);
  }
  else
  {
    imp = (PA::Region *)self->super._imp;
    v7 = a4;
    PA::Region::Grow(imp, a3.x, a3.y);
    PA::Region::Clip(imp, (const PA::Rect *)&v7);
  }
}

- (void)shrinkBy:(CGPoint)a3
{
  double y;
  double x;
  PA::Region **imp;
  double Bounds;
  double v7;
  double v8;
  double v9;
  IPAMutableRegion *v10;
  SEL v11;
  double v12[4];
  CGPoint v13;
  CGRect v14;

  if (a3.x < 0.0 || (y = a3.y, a3.y < 0.0))
  {
    v10 = (IPAMutableRegion *)_PFAssertFailHandler();
    -[IPAMutableRegion shrinkBy:inRect:](v10, v11, v13, v14);
  }
  else
  {
    x = a3.x;
    imp = (PA::Region **)self->super._imp;
    Bounds = PA::Region::GetBounds(imp[2]);
    v12[0] = Bounds - x;
    v12[1] = v9 - y;
    v12[2] = v12[0] + Bounds + v7 - (Bounds - x) + x - v12[0];
    v12[3] = v9 - y + v9 + v8 - (v9 - y) + y - (v9 - y);
    PA::Region::ShrinkInRect((PA::Region *)imp, x, y, (const PA::Rect *)v12);
  }
}

- (void)shrinkBy:(CGPoint)a3 inRect:(CGRect)a4
{
  PA::Region *imp;
  IPAMutableRegion *v5;
  SEL v6;
  CGRect v7;

  if (a3.x < 0.0 || a3.y < 0.0)
  {
    v5 = (IPAMutableRegion *)_PFAssertFailHandler();
    -[IPAMutableRegion roundUp](v5, v6);
  }
  else
  {
    imp = (PA::Region *)self->super._imp;
    v7 = a4;
    PA::Region::ShrinkInRect(imp, a3.x, a3.y, (const PA::Rect *)&v7);
  }
}

- (void)roundUp
{
  PA::Region::RoundUp((PA::Region *)self->super._imp);
}

- (void)roundDown
{
  PA::Region **imp;
  double Bounds;
  double v4;
  double v5;
  double v6;
  uint64_t v7[5];
  _BYTE v8[16];
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;

  imp = (PA::Region **)self->super._imp;
  Bounds = PA::Region::GetBounds(imp[2]);
  v10 = Bounds + -1.0;
  v11 = v6 + -1.0;
  v12 = v10 + Bounds + v4 - (Bounds + -1.0) + 1.0 - v10;
  v13 = v11 + v6 + v5 - (v6 + -1.0) + 1.0 - v11;
  PA::Region::Region((PA::Region *)v8, (const PA::Rect *)&v10);
  PA::Region::Break((uint64_t)imp[2], (uint64_t)v8);
  PA::Region::MergeVertically((PA::Region *)v8);
  PA::Region::RoundUp((PA::Region *)v8);
  PA::Region::Region((PA::Region *)v7, (const PA::Rect *)&v10);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__move_assign((uint64_t)imp, v7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v7);
  PA::Region::Break(v9, (uint64_t)imp);
  PA::Region::MergeVertically((PA::Region *)imp);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v8);
}

- (void)applyOrientation:(int64_t)a3 imageSize:(CGSize)a4
{
  double width;
  __int128 *imp;
  double *v6;
  double height;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  int v15;

  width = a4.width;
  imp = (__int128 *)self->super._imp;
  v13 = 0u;
  v14 = 0u;
  v15 = 1065353216;
  v6 = (double *)*((_QWORD *)imp + 2);
  if (v6)
  {
    height = a4.height;
    do
    {
      v12[0] = IPAOrientationTransformImageRect(a3, width, height, v6[2], v6[3], v6[4], v6[5]);
      v12[1] = v9;
      v12[2] = v10;
      v12[3] = v11;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v13, v12, (uint64_t)v12);
      v6 = *(double **)v6;
    }
    while (v6);
  }
  if (&v13 != imp)
  {
    *((_DWORD *)imp + 8) = v15;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v14);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v13);
}

- (void)applyAffineTransform:(CGAffineTransform *)a3
{
  __int128 *imp;
  uint64_t *i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  CGAffineTransform v10;
  CGRect v11;
  CGRect v12;

  imp = (__int128 *)self->super._imp;
  v7 = 0u;
  v8 = 0u;
  v9 = 1065353216;
  for (i = (uint64_t *)*((_QWORD *)imp + 2); i; i = (uint64_t *)*i)
  {
    v11 = *(CGRect *)(i + 2);
    v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v10.c = v6;
    *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
    v12 = CGRectApplyAffineTransform(v11, &v10);
    v10.a = v12.origin.x;
    v10.b = v12.origin.y;
    v10.c = v12.size.width;
    v10.d = v12.size.height;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v7, &v10, (uint64_t)&v10);
  }
  if (&v7 != imp)
  {
    *((_DWORD *)imp + 8) = v9;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v8);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v7);
}

@end
