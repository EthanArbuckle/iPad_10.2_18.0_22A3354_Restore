@implementation PXGSpriteDataStore

- (PXGSpriteDataStore)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSpriteDataStore.m"), 38, CFSTR("%s is not available as initializer"), "-[PXGSpriteDataStore init]");

  abort();
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteDataStore;
  return -[PXGSpriteDataStore init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_entities);
  free(self->_geometries);
  free(self->_styles);
  free(self->_infos);
  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteDataStore;
  -[PXGSpriteDataStore dealloc](&v3, sel_dealloc);
}

- (void)setCount:(unsigned int)a3
{
  unsigned int capacity;

  self->_count = a3;
  capacity = self->_capacity;
  if (capacity < a3)
  {
    if (capacity)
    {
      do
        capacity *= 2;
      while (capacity < a3);
    }
    else
    {
      capacity = a3;
    }
    self->_capacity = capacity;
    self->_entities = ($738B17BD11CC339B30296C0EA03CEC2B *)malloc_type_realloc(self->_entities, 4 * capacity, 0xFA539D40uLL);
    self->_geometries = ($327AC5C1B3A50B4987650045CBFB5127 *)malloc_type_realloc(self->_geometries, 32 * self->_capacity, 0xFA539D40uLL);
    self->_styles = ($7B4C668D983231AF8D7B277595642D2D *)malloc_type_realloc(self->_styles, 160 * self->_capacity, 0xFA539D40uLL);
    self->_infos = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)malloc_type_realloc(self->_infos, 40 * self->_capacity, 0xFA539D40uLL);
  }
}

- (void)insertSpritesInRange:(_PXGSpriteIndexRange)a3
{
  uint64_t var1;
  unsigned int var0;
  unint64_t v7;

  var1 = a3.var1;
  -[PXGSpriteDataStore setCount:](self, "setCount:", -[PXGSpriteDataStore count](self, "count") + a3.var1);
  var0 = a3.var0;
  _PXGArrayInsertRange((uint64_t)self->_entities, 4, -[PXGSpriteDataStore count](self, "count"), a3.var0, var1);
  _PXGArrayInsertRange((uint64_t)self->_geometries, 32, -[PXGSpriteDataStore count](self, "count"), a3.var0, var1);
  _PXGArrayInsertRange((uint64_t)self->_styles, 160, -[PXGSpriteDataStore count](self, "count"), a3.var0, var1);
  _PXGArrayInsertRange((uint64_t)self->_infos, 40, -[PXGSpriteDataStore count](self, "count"), a3.var0, var1);
  bzero(&self->_entities[a3.var0], 4 * var1);
  bzero((char *)self->_geometries + 32 * a3.var0, 32 * var1);
  v7 = 4 * var1 + HIDWORD(*(unint64_t *)&a3);
  bzero((char *)self->_styles + 160 * var0, 32 * v7);
  bzero((char *)self->_infos + 40 * var0, 8 * v7);
}

- (void)removeSpritesInRange:(_PXGSpriteIndexRange)a3
{
  uint64_t var1;
  uint64_t var0;

  var1 = a3.var1;
  var0 = a3.var0;
  _PXGArrayRemoveRange((uint64_t)self->_entities, 4, -[PXGSpriteDataStore count](self, "count"), a3.var0, a3.var1);
  _PXGArrayRemoveRange((uint64_t)self->_geometries, 32, -[PXGSpriteDataStore count](self, "count"), var0, var1);
  _PXGArrayRemoveRange((uint64_t)self->_styles, 160, -[PXGSpriteDataStore count](self, "count"), var0, var1);
  _PXGArrayRemoveRange((uint64_t)self->_infos, 40, -[PXGSpriteDataStore count](self, "count"), var0, var1);
  -[PXGSpriteDataStore setCount:](self, "setCount:", -[PXGSpriteDataStore count](self, "count") - var1);
}

- (void)moveSpritesFromIndexes:(__CFArray *)a3 toIndexes:(id)a4
{
  id v7;
  CFIndex Count;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v14;
  $327AC5C1B3A50B4987650045CBFB5127 *geometries;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  $7B4C668D983231AF8D7B277595642D2D *styles;
  _OWORD *v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *infos;
  char *v30;
  char *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[6];
  unsigned int v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v7 = a4;
  Count = CFArrayGetCount(a3);
  v9 = objc_msgSend(v7, "count");
  v10 = v9;
  if (Count < 1 || v9 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSpriteDataStore.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexesCount > 0 && toIndexesCount > 0"));

  }
  if (Count != v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSpriteDataStore.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexesCount == toIndexesCount"));

  }
  if (!-[PXGSpriteDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSpriteDataStore.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.count != 0"));

  }
  v11 = -[PXGSpriteDataStore count](self, "count");
  -[PXGSpriteDataStore setCount:](self, "setCount:", -[PXGSpriteDataStore count](self, "count") + v10);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (Count < 1)
  {
    v34 = &v41;
  }
  else
  {
    for (i = 0; i < Count; v42[3] = i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      v14 = v42[3] + v11;
      self->_entities[v14].var0 = self->_entities[(_QWORD)ValueAtIndex].var0;
      geometries = self->_geometries;
      v16 = (_OWORD *)(&geometries->var0.var0 + 4 * v14);
      v17 = (_OWORD *)(&geometries->var0.var0 + 4 * (_QWORD)ValueAtIndex);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      styles = self->_styles;
      v20 = (_OWORD *)(&styles->var0 + 40 * v14);
      v21 = (_OWORD *)(&styles->var0 + 40 * (_QWORD)ValueAtIndex);
      v22 = v21[1];
      *v20 = *v21;
      v20[1] = v22;
      v23 = v21[2];
      v24 = v21[3];
      v25 = v21[5];
      v20[4] = v21[4];
      v20[5] = v25;
      v20[2] = v23;
      v20[3] = v24;
      v26 = v21[6];
      v27 = v21[7];
      v28 = v21[9];
      v20[8] = v21[8];
      v20[9] = v28;
      v20[6] = v26;
      v20[7] = v27;
      infos = self->_infos;
      v30 = (char *)infos + 40 * v14;
      v31 = (char *)infos + 40 * (_QWORD)ValueAtIndex;
      v32 = *((_QWORD *)v31 + 4);
      v33 = *((_OWORD *)v31 + 1);
      *(_OWORD *)v30 = *(_OWORD *)v31;
      *((_OWORD *)v30 + 1) = v33;
      *((_QWORD *)v30 + 4) = v32;
      v34 = v42;
      i = v42[3] + 1;
    }
  }
  v34[3] = 0;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __55__PXGSpriteDataStore_moveSpritesFromIndexes_toIndexes___block_invoke;
  v38[3] = &unk_251A6EA40;
  v39 = v11;
  v40 = v10;
  v38[4] = self;
  v38[5] = &v41;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v38);
  -[PXGSpriteDataStore setCount:](self, "setCount:", -[PXGSpriteDataStore count](self, "count") - v10);
  _Block_object_dispose(&v41, 8);

}

- (void)moveSpritesInRange:(_PXGSpriteIndexRange)a3 toRange:(_PXGSpriteIndexRange)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE72B60], "changeDetailsWithMovedFromIndexRange:toIndexRange:", a3.var0, a3.var1, a4.var0, a4.var1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "movesFromIndexes");
  objc_msgSend(v7, "movesToIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSpriteDataStore moveSpritesFromIndexes:toIndexes:](self, "moveSpritesFromIndexes:toIndexes:", v5, v6);

}

- (void)applyChangeDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[PXGSpriteDataStore setCount:](self, "setCount:", objc_msgSend(v4, "numberOfSpritesAfterChange")- objc_msgSend(v4, "numberOfSpritesBeforeChange")+ -[PXGSpriteDataStore count](self, "count"));
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_entities, 4, -[PXGSpriteDataStore count](self, "count"), 0, 0);
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_geometries, 32, -[PXGSpriteDataStore count](self, "count"), 0, 0);
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_styles, 160, -[PXGSpriteDataStore count](self, "count"), 0, 0);
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_infos, 40, -[PXGSpriteDataStore count](self, "count"), 0, 0);

}

- ($6A8CD14A92A2CBAC77B19B5162C382FC)spritesInRange:(SEL)a3
{
  unsigned int var0;
  unsigned int var1;
  uint64_t v9;
  PXGSpriteDataStore *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  PXGSpriteDataStore *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  PXGSpriteDataStore *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  $6A8CD14A92A2CBAC77B19B5162C382FC *result;
  void *v17;

  var0 = a4.var0;
  var1 = a4.var1;
  if (a4.var1 + a4.var0 > -[PXGSpriteDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXGSpriteDataStore.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXGSpriteIndexRangeMax(range) <= self.count"));

  }
  v9 = var0;
  v10 = objc_retainAutorelease(self);
  v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore entities](v10, "entities") + 4 * var0);
  v12 = objc_retainAutorelease(v10);
  v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore geometries](v12, "geometries") + 32 * v9);
  v14 = objc_retainAutorelease(v12);
  v15 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore styles](v14, "styles") + 160 * v9);
  result = -[PXGSpriteDataStore infos](objc_retainAutorelease(v14), "infos");
  retstr->var0 = var1;
  retstr->var1 = v11;
  retstr->var2 = v13;
  retstr->var3 = v15;
  retstr->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&result[v9];
  return result;
}

- ($B0083419B7591A93B72A99AB8D6AC1B6)_mutableSpritesInRange:(SEL)a3
{
  unsigned int var0;
  uint64_t v8;
  PXGSpriteDataStore *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  PXGSpriteDataStore *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  PXGSpriteDataStore *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $B0083419B7591A93B72A99AB8D6AC1B6 *result;
  void *v16;

  var0 = a4.var0;
  if (a4.var1 + a4.var0 > -[PXGSpriteDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXGSpriteDataStore.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXGSpriteIndexRangeMax(range) <= self.count"));

  }
  v8 = var0;
  v9 = objc_retainAutorelease(self);
  v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore entities](v9, "entities") + 4 * var0);
  v11 = objc_retainAutorelease(v9);
  v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore geometries](v11, "geometries") + 32 * v8);
  v13 = objc_retainAutorelease(v11);
  v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore styles](v13, "styles") + 160 * v8);
  result = -[PXGSpriteDataStore infos](objc_retainAutorelease(v13), "infos");
  retstr->var0 = v10;
  retstr->var1 = v12;
  retstr->var2 = v14;
  retstr->var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)result + 40 * v8);
  return result;
}

- ($B0083419B7591A93B72A99AB8D6AC1B6)spriteAtIndex:(SEL)a3
{
  PXGSpriteDataStore *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  PXGSpriteDataStore *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  PXGSpriteDataStore *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $B0083419B7591A93B72A99AB8D6AC1B6 *result;

  v6 = objc_retainAutorelease(self);
  v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore entities](v6, "entities") + 4 * a4);
  v8 = objc_retainAutorelease(v6);
  v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore geometries](v8, "geometries") + 32 * a4);
  v10 = objc_retainAutorelease(v8);
  v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(-[PXGSpriteDataStore styles](v10, "styles") + 160 * a4);
  result = -[PXGSpriteDataStore infos](objc_retainAutorelease(v10), "infos");
  retstr->var0 = v7;
  retstr->var1 = v9;
  retstr->var2 = v11;
  retstr->var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)result + 40 * a4);
  return result;
}

- ($6A8CD14A92A2CBAC77B19B5162C382FC)sprites
{
  return -[PXGSpriteDataStore spritesInRange:](self, "spritesInRange:", -[PXGSpriteDataStore count](self, "count") << 32);
}

- (void)setSprites:(id *)a3
{
  uint64_t var0;
  PXGSpriteDataStore *v6;
  PXGSpriteDataStore *v7;
  PXGSpriteDataStore *v8;

  var0 = a3->var0;
  -[PXGSpriteDataStore setCount:](self, "setCount:", var0);
  v6 = objc_retainAutorelease(self);
  memcpy(-[PXGSpriteDataStore entities](v6, "entities"), a3->var1, 4 * var0);
  v7 = objc_retainAutorelease(v6);
  memcpy(-[PXGSpriteDataStore geometries](v7, "geometries"), a3->var2, 32 * var0);
  v8 = objc_retainAutorelease(v7);
  var0 *= 5;
  memcpy(-[PXGSpriteDataStore styles](v8, "styles"), a3->var3, 32 * var0);
  memcpy(-[PXGSpriteDataStore infos](objc_retainAutorelease(v8), "infos"), a3->var4, 8 * var0);
}

- (void)copySpritesInRange:(_PXGSpriteIndexRange)a3 fromSpriteDataStore:(id)a4
{
  id v7;
  unint64_t v8;
  void *v9;

  v7 = a4;
  v8 = HIDWORD(*(unint64_t *)&a3);
  if (a3.var1 + a3.var0 > objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSpriteDataStore.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXGSpriteIndexRangeMax(spriteIndexRange) <= fromSpriteDataStore.count"));

  }
  -[PXGSpriteDataStore _mutableSpritesInRange:](self, "_mutableSpritesInRange:", a3);
  if (v7)
    objc_msgSend(v7, "_mutableSpritesInRange:", a3);
  memcpy(0, 0, 4 * v8);
  memcpy(0, 0, 32 * v8);
  memcpy(0, 0, 160 * v8);
  memcpy(0, 0, 40 * v8);

}

- (void)clearEntities
{
  bzero(self->_entities, 4 * -[PXGSpriteDataStore count](self, "count"));
}

- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned int v8;
  PXGSpriteDataStore *v9;
  uint64_t v10;
  PXGSpriteDataStore *v11;
  uint64_t v12;
  PXGSpriteDataStore *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  float64x2_t v20;
  __n128 v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  float32x2_t v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  BOOL v33;
  int v34;
  CGFloat width;
  __int128 v36;
  _QWORD v37[4];
  unsigned __int8 v38;

  width = a3.size.width;
  v36 = *(_OWORD *)&a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = a4;
  v8 = -[PXGSpriteDataStore count](self, "count");
  v9 = objc_retainAutorelease(self);
  v10 = -[PXGSpriteDataStore entities](v9, "entities");
  v11 = objc_retainAutorelease(v9);
  v12 = -[PXGSpriteDataStore geometries](v11, "geometries");
  v13 = objc_retainAutorelease(v11);
  v14 = -[PXGSpriteDataStore styles](v13, "styles");
  v15 = -[PXGSpriteDataStore infos](objc_retainAutorelease(v13), "infos");
  v38 = 0;
  if (v8)
  {
    v16 = v15;
    *(float *)&v17 = x;
    *(float *)&v18 = y;
    v19 = *(float *)&v17;
    v20.f64[0] = width;
    v21.n128_u64[1] = *((_QWORD *)&v36 + 1);
    *(_QWORD *)&v20.f64[1] = v36;
    v21.n128_u64[0] = (unint64_t)vadd_f32((float32x2_t)__PAIR64__(v18, v17), vcvt_f32_f64(v20));
    v22 = v21.n128_f32[1];
    v23 = *(float *)&v18;
    v24 = v21.n128_f32[0];
    v25 = 1;
    do
    {
      v26 = vmul_f32(*(float32x2_t *)(v12 + 24), (float32x2_t)0x3F0000003F000000);
      v27 = *(double *)(v12 + 8);
      v28 = v27 - v26.f32[1];
      v29 = v27 + v26.f32[1];
      v30 = v28 > v22 || v29 < v23;
      if (v30
        || ((v31 = v26.f32[0], v32 = *(double *)v12 - v31, v21.n128_f64[0] = *(double *)v12 + v31, v32 <= v24)
          ? (v33 = v21.n128_f64[0] < v19)
          : (v33 = 1),
            v33))
      {
        v34 = 0;
      }
      else
      {
        v37[0] = v10;
        v37[1] = v12;
        v37[2] = v14;
        v37[3] = v16;
        (*((void (**)(id, _QWORD, _QWORD *, unsigned __int8 *, __n128))v7 + 2))(v7, (v25 - 1), v37, &v38, v21);
        v34 = v38;
      }
      if (v25 >= v8)
        break;
      ++v25;
      v16 += 40;
      v14 += 160;
      v10 += 4;
      v12 += 32;
    }
    while (!v34);
  }

}

- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 usingBlock:(id)a4
{
  void (**v6)(id, _PXGSpriteIndexRange, _QWORD *, char *);
  unsigned int v7;
  PXGSpriteDataStore *v8;
  uint64_t v9;
  PXGSpriteDataStore *v10;
  uint64_t v11;
  PXGSpriteDataStore *v12;
  uint64_t v13;
  PXGSpriteDataStore *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  char v27;

  v6 = (void (**)(id, _PXGSpriteIndexRange, _QWORD *, char *))a4;
  v7 = -[PXGSpriteDataStore count](self, "count");
  v8 = objc_retainAutorelease(self);
  v9 = -[PXGSpriteDataStore entities](v8, "entities");
  v10 = objc_retainAutorelease(v8);
  v11 = -[PXGSpriteDataStore geometries](v10, "geometries");
  v12 = objc_retainAutorelease(v10);
  v13 = -[PXGSpriteDataStore styles](v12, "styles");
  v14 = objc_retainAutorelease(v12);
  v15 = -[PXGSpriteDataStore infos](v14, "infos");
  v16 = a3.var1 + a3.var0;
  if (v16 > v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%li, %li}"), a3.var0, HIDWORD(*(unint64_t *)&a3));
    v23 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("PXGSpriteDataStore.m"), 226, CFSTR("invalid range %@ not within 0..<%li"), v22, v23);

  }
  v27 = 0;
  if (v16 > a3.var0)
  {
    v17 = a3.var0 + 1;
    v18 = v15 + 40 * a3.var0;
    v19 = v13 + 160 * a3.var0;
    v20 = v11 + 32 * a3.var0;
    v21 = v9 + 4 * a3.var0;
    do
    {
      v26[0] = v21;
      v26[1] = v20;
      v26[2] = v19;
      v26[3] = v18;
      v6[2](v6, a3, v26, &v27);
      if (v17 >= v16)
        break;
      ++v17;
      a3 = (_PXGSpriteIndexRange)(a3.var0 + 1);
      v18 += 40;
      v19 += 160;
      v20 += 32;
      v21 += 4;
    }
    while (!v27);
  }

}

- (id)spriteIndexesInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x24BDD1698]);
  -[PXGSpriteDataStore _collectSpriteIndexes:inRange:inRect:](self, "_collectSpriteIndexes:inRange:inRect:", v8, -[PXGSpriteDataStore count](self, "count") << 32, x, y, width, height);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)spriteIndexesWithSpriteInfoFlags:(unsigned __int8)a3
{
  int v3;
  PXGSpriteDataStore *v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v3 = a3;
  v4 = objc_retainAutorelease(self);
  v5 = -[PXGSpriteDataStore infos](v4, "infos");
  v6 = -[PXGSpriteDataStore count](v4, "count");
  v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
  if (!v6)
    return v7;
  v8 = 0;
  v9 = 0;
  v10 = (unsigned __int8 *)(v5 + 34);
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v12 = v11;
    v13 = v9;
    v14 = *v10;
    v10 += 40;
    if ((v3 & ~v14) == 0)
    {
      if (v9)
      {
        v11 = v8;
        v9 = 1;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_11;
        if (v8 == v13 + v12)
        {
          v9 = v13 + 1;
          v11 = v12;
          goto LABEL_11;
        }
        objc_msgSend(v7, "addIndexesInRange:", v12, v13);
      }
      v11 = v8;
      v9 = 1;
    }
LABEL_11:
    ++v8;
  }
  while (v6 != v8);
  if (v9)
    objc_msgSend(v7, "addIndexesInRange:", v11);
  return v7;
}

- (void)_collectSpriteIndexes:(id)a3 inRange:(_PXGSpriteIndexRange)a4 inRect:(CGRect)a5
{
  double y;
  double x;
  $327AC5C1B3A50B4987650045CBFB5127 *v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  double v13;
  float64x2_t v14;
  float32x2_t v15;
  double v16;
  double v17;
  double v18;
  char *v19;
  float32x2_t v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  CGFloat width;
  CGFloat height;
  id v31;

  width = a5.size.width;
  height = a5.size.height;
  y = a5.origin.y;
  x = a5.origin.x;
  v31 = a3;
  v9 = -[PXGSpriteDataStore geometries](objc_retainAutorelease(self), "geometries");
  v10 = HIDWORD(*(unint64_t *)&a4);
  if (a4.var1 + a4.var0 > a4.var0)
  {
    *(float *)&v11 = x;
    *(float *)&v12 = y;
    v13 = *(float *)&v11;
    v14.f64[0] = width;
    v14.f64[1] = height;
    v15 = vadd_f32((float32x2_t)__PAIR64__(v12, v11), vcvt_f32_f64(v14));
    v16 = v15.f32[1];
    v17 = *(float *)&v12;
    v18 = v15.f32[0];
    a4 = (_PXGSpriteIndexRange)a4.var0;
    v19 = (char *)v9 + 32 * a4.var0;
    do
    {
      v20 = vmul_f32(*(float32x2_t *)(v19 + 24), (float32x2_t)0x3F0000003F000000);
      v21 = *((double *)v19 + 1);
      v22 = v21 - v20.f32[1];
      v23 = v21 + v20.f32[1];
      if (v22 <= v16 && v23 >= v17)
      {
        v25 = v20.f32[0];
        v26 = *(double *)v19 - v25;
        v27 = *(double *)v19 + v25;
        if (v26 <= v18 && v27 >= v13)
          objc_msgSend(v31, "addIndex:", a4, v27);
      }
      ++*(_QWORD *)&a4;
      v19 += 32;
      LODWORD(v10) = v10 - 1;
    }
    while ((_DWORD)v10);
  }

}

- (id)spriteAtIndexes:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, unsigned int, unsigned int);
  void *v18;
  PXGSpriteDataStore *v19;
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (objc_class *)MEMORY[0x24BDD1698];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __45__PXGSpriteDataStore_spriteAtIndexes_inRect___block_invoke;
  v18 = &unk_251A6EA68;
  v19 = self;
  v20 = v11;
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  v12 = v11;
  objc_msgSend(v10, "enumerateRangesUsingBlock:", &v15);

  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);
  return v13;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; count = %u>"),
    v5,
    self,
    -[PXGSpriteDataStore count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)diagnosticDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  PXGSpriteDataStore *v7;
  uint64_t v8;
  PXGSpriteDataStore *v9;
  $327AC5C1B3A50B4987650045CBFB5127 *v10;
  PXGSpriteDataStore *v11;
  $7B4C668D983231AF8D7B277595642D2D *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  $75DC967394D75D22597118241CE31CB7 var1;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  $75DC967394D75D22597118241CE31CB7 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n"), v5, self);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PXGSpriteDataStore count](self, "count");
  v7 = objc_retainAutorelease(self);
  v8 = -[PXGSpriteDataStore entities](v7, "entities");
  v9 = objc_retainAutorelease(v7);
  v10 = -[PXGSpriteDataStore geometries](v9, "geometries");
  v11 = objc_retainAutorelease(v9);
  v12 = -[PXGSpriteDataStore styles](v11, "styles");
  v13 = -[PXGSpriteDataStore infos](objc_retainAutorelease(v11), "infos");
  if (v6)
  {
    v14 = v13;
    v15 = 0;
    v16 = v6;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{id=%ld}"), *(unsigned int *)(v8 + 4 * v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_OWORD *)&v10->var0.var0;
      v19 = *(_OWORD *)&v10->var0.var2;
      v10 = ($327AC5C1B3A50B4987650045CBFB5127 *)((char *)v10 + 32);
      v32 = v18;
      v33 = v19;
      PXGSpriteGeometryDescription(&v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_OWORD *)&v12[2].var3;
      v38 = *(__int128 *)((char *)&v12[2].var1 + 4);
      v39 = v21;
      v22 = *(__int128 *)((char *)&v12[3].var1 + 8);
      v40 = *(_OWORD *)&v12[2].var8;
      v41 = v22;
      var1 = v12[1].var1;
      v34 = *(_OWORD *)&v12->var5;
      v35 = var1;
      v24 = *(_OWORD *)&v12[1].var6;
      v36 = *(_OWORD *)&v12[1].var2;
      v37 = v24;
      v25 = *(_OWORD *)&v12->var0;
      v26 = *(__int128 *)((char *)&v12->var1 + 12);
      v12 = ($7B4C668D983231AF8D7B277595642D2D *)((char *)v12 + 160);
      v32 = v25;
      v33 = v26;
      PXGSpriteStyleDescription((uint64_t)&v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_OWORD *)(v14 + 16);
      v32 = *(_OWORD *)v14;
      v33 = v28;
      *(_QWORD *)&v34 = *(_QWORD *)(v14 + 32);
      PXGSpriteInfoDescription((unsigned __int8 *)&v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "appendFormat:", CFSTR("\t%li: entity=%@ geometry=%@ style=%@ info=%@\n"), v15, v17, v20, v27, v29);

      ++v15;
      v14 += 40;
    }
    while (v16 != v15);
  }
  objc_msgSend(v31, "appendString:", CFSTR(">"));
  return (NSString *)v31;
}

- (unsigned)count
{
  return self->_count;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)entities
{
  return self->_entities;
}

- ($327AC5C1B3A50B4987650045CBFB5127)geometries
{
  return self->_geometries;
}

- ($7B4C668D983231AF8D7B277595642D2D)styles
{
  return self->_styles;
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)infos
{
  return self->_infos;
}

uint64_t __45__PXGSpriteDataStore_spriteAtIndexes_inRect___block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collectSpriteIndexes:inRange:inRect:", *(_QWORD *)(a1 + 40), a2 | ((unint64_t)a3 << 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

__n128 __55__PXGSpriteDataStore_moveSpritesFromIndexes_toIndexes___block_invoke(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __n128 result;
  __int128 v26;
  uint64_t v27;

  v3 = a2 + a3;
  if (v3 > a2)
  {
    v4 = v3 - a2;
    v5 = 4 * a2;
    v6 = 40 * a2;
    v7 = 160 * a2;
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + *(unsigned int *)(a1 + 48);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + v5) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
                                                                             + 4 * v8);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v10 = (_OWORD *)(v9 + 8 * v5);
      v11 = (_OWORD *)(v9 + 32 * v8);
      v12 = v11[1];
      *v10 = *v11;
      v10[1] = v12;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v14 = (_OWORD *)(v13 + v7);
      v15 = (_OWORD *)(v13 + 160 * v8);
      v16 = v15[5];
      v18 = v15[2];
      v17 = v15[3];
      v14[4] = v15[4];
      v14[5] = v16;
      v14[2] = v18;
      v14[3] = v17;
      v19 = v15[9];
      v21 = v15[6];
      v20 = v15[7];
      v14[8] = v15[8];
      v14[9] = v19;
      v14[6] = v21;
      v14[7] = v20;
      v22 = v15[1];
      *v14 = *v15;
      v14[1] = v22;
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v24 = v23 + 40 * v8;
      result = *(__n128 *)v24;
      v26 = *(_OWORD *)(v24 + 16);
      v27 = v23 + v6;
      *(_QWORD *)(v27 + 32) = *(_QWORD *)(v24 + 32);
      *(__n128 *)v27 = result;
      *(_OWORD *)(v27 + 16) = v26;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 += 40;
      v7 += 160;
      v5 += 4;
      --v4;
    }
    while (v4);
  }
  return result;
}

+ (id)newSpriteDataStore
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

@end
