@implementation PXMemoriesGridLayoutGenerator

- (id)geometryKinds
{
  if (geometryKinds_onceToken_222505 != -1)
    dispatch_once(&geometryKinds_onceToken_222505, &__block_literal_global_222506);
  return (id)geometryKinds_kinds_222507;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  uint64x2_t v12;
  int64x2_t v13;
  int64_t *p_var5;
  int64x2_t v15;
  int32x2_t v16;
  objc_super v17;

  length = a4.length;
  location = a4.location;
  v17.receiver = self;
  v17.super_class = (Class)PXMemoriesGridLayoutGenerator;
  -[PXGridLayoutGenerator getGeometries:inRange:withKind:](&v17, sel_getGeometries_inRange_withKind_);
  if (length && !__CFADD__(location, length - 1))
  {
    v9 = length + location;
    if (length + location <= location + 1)
      v9 = location + 1;
    v10 = v9 - location;
    v11 = (v9 - location + 1) & 0xFFFFFFFFFFFFFFFELL;
    v12 = (uint64x2_t)vdupq_n_s64(v10 - 1);
    v13 = (int64x2_t)xmmword_1A7BA6CB0;
    p_var5 = &a3[1].var5;
    v15 = vdupq_n_s64(2uLL);
    do
    {
      v16 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v13));
      if ((v16.i8[0] & 1) != 0)
        *(p_var5 - 19) = a5;
      if ((v16.i8[4] & 1) != 0)
        *p_var5 = a5;
      v13 = vaddq_s64(v13, v15);
      p_var5 += 38;
      v11 -= 2;
    }
    while (v11);
  }
}

void __46__PXMemoriesGridLayoutGenerator_geometryKinds__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addIndex:", 2);
  v1 = (void *)geometryKinds_kinds_222507;
  geometryKinds_kinds_222507 = (uint64_t)v0;

}

@end
