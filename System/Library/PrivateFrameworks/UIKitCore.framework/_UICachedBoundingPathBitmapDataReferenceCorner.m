@implementation _UICachedBoundingPathBitmapDataReferenceCorner

+ (id)cachedReferenceCornerForRadius:(int64_t)a3
{
  void *v4;
  void *v5;
  _UICachedBoundingPathBitmapDataReferenceCorner *v6;
  id v7;
  void *v8;
  _UICachedBoundingPathBitmapDataReferenceCorner *v9;
  void *v10;
  void *v11;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = (void *)__cachedReferenceCornersByRadius;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (_UICachedBoundingPathBitmapDataReferenceCorner *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!__cachedReferenceCornersByRadius)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      v8 = (void *)__cachedReferenceCornersByRadius;
      __cachedReferenceCornersByRadius = (uint64_t)v7;

    }
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    _UIBoundingPathBitmapDataCreateReferenceCornerWithRadius(a3, (uint64_t)&v14);
    v9 = [_UICachedBoundingPathBitmapDataReferenceCorner alloc];
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    v6 = -[_UICachedBoundingPathBitmapDataReferenceCorner initWithReferenceCorner:](v9, "initWithReferenceCorner:", v13);
    v10 = (void *)__cachedReferenceCornersByRadius;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v6, v11);

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICachedBoundingPathBitmapDataReferenceCorner)initWithReferenceCorner:(_UIBoundingPathBitmapDataCorner *)a3
{
  char *v5;
  __int128 v6;
  __int128 v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UICachedBoundingPathBitmapDataReferenceCorner;
  v5 = -[_UICachedBoundingPathBitmapDataReferenceCorner init](&v12, sel_init);
  if (v5)
  {
    if (a3->location)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UIBoundingPathBitmapDataCornerCache.m"), 161, CFSTR("%@ should only be used to cache reference corners"), v11);

    }
    v6 = *(_OWORD *)&a3->location;
    v7 = *(_OWORD *)&a3->size;
    *(_OWORD *)(v5 + 40) = *(_OWORD *)&a3->referenceEdgePositionsByRow;
    *(_OWORD *)(v5 + 24) = v7;
    *(_OWORD *)(v5 + 8) = v6;
  }
  return (_UICachedBoundingPathBitmapDataReferenceCorner *)v5;
}

- (_UICachedBoundingPathBitmapDataReferenceCorner)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id v9;
  const void *v10;
  void *HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray;
  void *v12;
  const void *v13;
  _UICachedBoundingPathBitmapDataReferenceCorner *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  char v25;
  _BYTE v26[7];
  void *v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("radius"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("size"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("edgePositionsUseLargeValues"));
  v8 = v6 << v7;
  if (v6 << v7)
  {
    v24[0] = 0;
    v9 = objc_retainAutorelease(v4);
    v10 = (const void *)objc_msgSend(v9, "decodeBytesForKey:returnedLength:", CFSTR("referenceEdgePositionsByRow"), v24);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_UIBoundingPathBitmapDataCornerCache.m"), 110, CFSTR("Failed to decode the bitmap data corner: decoded row bytes are NULL"));

    }
    if (v24[0] != v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIBoundingPathBitmapDataCornerCache.m"), 111, CFSTR("Failed to decode the bitmap data corner: decoded row bytes length (%ld) does not equal expected length (%ld)"), v24[0], v8);

    }
    HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray = _allocateHostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray(v10, v6, v7);
    v12 = HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("referenceEdgePositionsByCol")))
    {
      v29 = 0;
      v13 = (const void *)objc_msgSend(objc_retainAutorelease(v9), "decodeBytesForKey:returnedLength:", CFSTR("referenceEdgePositionsByCol"), &v29);
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIBoundingPathBitmapDataCornerCache.m"), 119, CFSTR("Failed to decode the bitmap data corner: decoded col bytes are NULL"));

      }
      if (v29 != v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_UIBoundingPathBitmapDataCornerCache.m"), 120, CFSTR("Failed to decode the bitmap data corner: decoded col bytes length (%ld) does not equal expected length (%ld)"), v29, v8);

      }
      v12 = _allocateHostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray(v13, v6, v7);
    }
  }
  else
  {
    HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray = 0;
    v12 = 0;
  }

  v24[0] = 0;
  v24[1] = v5;
  v24[2] = v6;
  v25 = v7;
  memset(v26, 0, sizeof(v26));
  v27 = HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray;
  v28 = v12;
  v14 = -[_UICachedBoundingPathBitmapDataReferenceCorner initWithReferenceCorner:](self, "initWithReferenceCorner:", v24);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t radius;
  unint64_t location;
  unint64_t size;
  int edgePositionsUseLargeValues;
  void *referenceEdgePositionsByCol;
  void *referenceEdgePositionsByRow;
  id v11;
  unint64_t v12;
  void *StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  location = self->_referenceCorner.location;
  radius = self->_referenceCorner.radius;
  size = self->_referenceCorner.size;
  edgePositionsUseLargeValues = self->_referenceCorner.edgePositionsUseLargeValues;
  referenceEdgePositionsByRow = self->_referenceCorner.referenceEdgePositionsByRow;
  referenceEdgePositionsByCol = self->_referenceCorner.referenceEdgePositionsByCol;
  v11 = v4;
  v17 = v11;
  if (location)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _encodeReferenceCornerWithCoder(const _UIBoundingPathBitmapDataCorner, NSCoder *__strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UIBoundingPathBitmapDataCornerCache.m"), 130, CFSTR("Only reference corners can be encoded as data."));

    v11 = v17;
  }
  objc_msgSend(v11, "encodeInteger:forKey:", radius, CFSTR("radius"));
  objc_msgSend(v17, "encodeInteger:forKey:", size, CFSTR("size"));
  objc_msgSend(v17, "encodeBool:forKey:", edgePositionsUseLargeValues != 0, CFSTR("edgePositionsUseLargeValues"));
  v12 = size << edgePositionsUseLargeValues;
  if (size << edgePositionsUseLargeValues)
  {
    StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions = _allocateStandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions(referenceEdgePositionsByRow, size, edgePositionsUseLargeValues != 0);
    objc_msgSend(v17, "encodeBytes:length:forKey:", StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions, size << edgePositionsUseLargeValues, CFSTR("referenceEdgePositionsByRow"));
    free(StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions);
    if (referenceEdgePositionsByRow != referenceEdgePositionsByCol)
    {
      v14 = _allocateStandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions(referenceEdgePositionsByCol, size, edgePositionsUseLargeValues != 0);
      objc_msgSend(v17, "encodeBytes:length:forKey:", v14, v12, CFSTR("referenceEdgePositionsByCol"));
      free(v14);
    }
  }

}

- (_UIBoundingPathBitmapDataCorner)referenceCornerCopy
{
  __int128 v4;
  unint64_t v5;
  char referenceEdgePositionsByRow;
  const void *location;
  void *referenceEdgePositionsByCol;
  void *v9;
  void *v10;
  __int128 v11;

  v4 = *(_OWORD *)&self->radius;
  v5 = *(_QWORD *)&self->edgePositionsUseLargeValues;
  referenceEdgePositionsByRow = (char)self->referenceEdgePositionsByRow;
  if (v5 << referenceEdgePositionsByRow)
  {
    v11 = *(_OWORD *)&self->radius;
    referenceEdgePositionsByCol = self->referenceEdgePositionsByCol;
    location = (const void *)self[1].location;
    v9 = malloc_type_malloc(v5 << referenceEdgePositionsByRow, 0xEEEA5B69uLL);
    self = (_UIBoundingPathBitmapDataCorner *)memcpy(v9, referenceEdgePositionsByCol, v5 << referenceEdgePositionsByRow);
    if (referenceEdgePositionsByCol == location)
    {
      v10 = v9;
    }
    else
    {
      v10 = malloc_type_malloc(v5 << referenceEdgePositionsByRow, 0x6D775E6uLL);
      self = (_UIBoundingPathBitmapDataCorner *)memcpy(v10, location, v5 << referenceEdgePositionsByRow);
    }
    v4 = v11;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  *(_OWORD *)&retstr->location = v4;
  retstr->size = v5;
  retstr->edgePositionsUseLargeValues = referenceEdgePositionsByRow;
  retstr->referenceEdgePositionsByRow = v9;
  retstr->referenceEdgePositionsByCol = v10;
  return self;
}

- (void)dealloc
{
  __int128 v3;
  objc_super v4;
  _OWORD v5[3];

  v3 = *(_OWORD *)&self->_referenceCorner.size;
  v5[0] = *(_OWORD *)&self->_referenceCorner.location;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_referenceCorner.referenceEdgePositionsByRow;
  _UIBoundingPathBitmapDataDestroyCorner((uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)_UICachedBoundingPathBitmapDataReferenceCorner;
  -[_UICachedBoundingPathBitmapDataReferenceCorner dealloc](&v4, sel_dealloc);
}

@end
