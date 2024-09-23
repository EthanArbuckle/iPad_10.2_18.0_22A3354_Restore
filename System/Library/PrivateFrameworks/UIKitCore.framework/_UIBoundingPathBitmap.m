@implementation _UIBoundingPathBitmap

- (_UIBoundingPathBitmapData)bitmapData
{
  _UIBoundingPathBitmapDataSkipRegion v3;

  v3 = *(_UIBoundingPathBitmapDataSkipRegion *)&self->skipRegion.height;
  *(_OWORD *)&retstr->width = *(_OWORD *)&self->height;
  retstr->skipRegion = v3;
  *(_OWORD *)&retstr->nodeCount = *(_OWORD *)&self->maximumNodesPerRow;
  retstr->rows = (unsigned __int16 *)self[1].width;
  return self;
}

- (_UIBoundingPathBitmap)boundingPathBitmapWithRect:(_UIIntegralRect *)a3
{
  _UIIntegralSize var1;
  _OWORD v5[2];
  _OWORD v6[2];

  memset(v6, 0, sizeof(v6));
  var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  -[_UIBoundingPathBitmap boundingPathBitmapWithRect:cornerRadii:](self, "boundingPathBitmapWithRect:cornerRadii:", v5, v6);
  return (_UIBoundingPathBitmap *)(id)objc_claimAutoreleasedReturnValue();
}

- (_UIBoundingPathBitmap)boundingPathBitmapWithRect:(_UIIntegralRect *)a3 cornerRadii:(_UIIntegralCornerRadii *)a4
{
  unint64_t width;
  unint64_t height;
  BOOL v6;
  BOOL v7;
  __int128 v8;
  _UIIntegralSize var1;
  __int128 v10;
  _UIBoundingPathBitmap *v11;
  _UIBoundingPathBitmap *v12;
  _OWORD v14[2];
  _OWORD v15[2];
  __int128 v16;
  _UIBoundingPathBitmapDataSkipRegion skipRegion;
  __int128 v18;
  unsigned __int16 *rows;
  __int128 v20;
  _UIBoundingPathBitmapDataSkipRegion v21;
  __int128 v22;
  unsigned __int16 *v23;

  width = self->_bitmapData.width;
  height = self->_bitmapData.height;
  if (a3->var0.var0)
    v6 = 0;
  else
    v6 = a3->var1.var0 == width;
  v7 = v6 && a3->var0.var1 == 0;
  if (v7
    && a3->var1.var1 == height
    && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(*(int64x2_t *)&a4->var0), (int32x4_t)vceqzq_s64(*(int64x2_t *)&a4->var2))))) & 1) == 0)
  {
    v12 = self;
  }
  else
  {
    v23 = 0;
    v21 = (_UIBoundingPathBitmapDataSkipRegion)0;
    v22 = 0u;
    v20 = 0u;
    *(_QWORD *)&v16 = width;
    *((_QWORD *)&v16 + 1) = height;
    v8 = *(_OWORD *)&self->_bitmapData.nodeCount;
    skipRegion = self->_bitmapData.skipRegion;
    v18 = v8;
    rows = self->_bitmapData.rows;
    var1 = a3->var1;
    v15[0] = a3->var0;
    v15[1] = var1;
    v10 = *(_OWORD *)&a4->var2;
    v14[0] = *(_OWORD *)&a4->var0;
    v14[1] = v10;
    _UIBoundingPathBitmapDataFromDataWithRectAndRadii((uint64_t)&v16, v15, (uint64_t)v14, (uint64_t *)&v20);
    v11 = [_UIBoundingPathBitmap alloc];
    v16 = v20;
    skipRegion = v21;
    v18 = v22;
    rows = v23;
    v12 = -[_UIBoundingPathBitmap initWithBitmapData:](v11, "initWithBitmapData:", &v16);
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBoundingPathBitmap)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _UIBoundingPathBitmap *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nodeCount"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumNodesPerRow"));
  if (v5)
  {
    v23[0] = 0;
    v7 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("rows"), v23);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapData decodeBitmapDataWithCoder(NSCoder *__strong)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_UIBoundingPathBitmap.m"), 70, CFSTR("Failed to decode the bitmap data: decoded bytes are NULL"));

    }
    if (v23[0] != 2 * v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapData decodeBitmapDataWithCoder(NSCoder *__strong)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIBoundingPathBitmap.m"), 71, CFSTR("Failed to decode the bitmap data: decoded bytes length (%ld) does not equal expected length (%ld)"), v23[0], 2 * v5);

    }
    v8 = malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataNode *_UIAllocateHostNodeArrayFromDecodedStandardizedEndiannessByteArray(const uint8_t *, const size_t)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIBoundingPathBitmap.m"), 50, CFSTR("Failed to allocate memory for storing the bitmap data node array."));

    }
    memcpy(v8, v7, 2 * v5);
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("skipRegion.y"));
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("skipRegion.height"));
  if (v5 != (v10 - v12) * v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapData decodeBitmapDataWithCoder(NSCoder *__strong)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("_UIBoundingPathBitmap.m"), 81, CFSTR("Decoded bitmap data is malformed: width=%ld; height=%lu; skipRegionY=%lu; skipRegionHeight=%lu; nodeCount=%lu; maximumNodesPerRow=%lu"),
      v9,
      v10,
      v11,
      v12,
      v5,
      v6);

  }
  v23[0] = v9;
  v23[1] = v10;
  v23[2] = v11;
  v23[3] = v12;
  v23[4] = v5;
  v23[5] = v6;
  v23[6] = v8;
  v13 = -[_UIBoundingPathBitmap initWithBitmapData:](self, "initWithBitmapData:", v23);

  return v13;
}

- (_UIBoundingPathBitmap)initWithBitmapData:(_UIBoundingPathBitmapData *)a3
{
  _UIBoundingPathBitmap *result;
  __int128 v5;
  _UIBoundingPathBitmapDataSkipRegion skipRegion;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIBoundingPathBitmap;
  result = -[_UIBoundingPathBitmap init](&v8, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->width;
    skipRegion = a3->skipRegion;
    v7 = *(_OWORD *)&a3->nodeCount;
    result->_bitmapData.rows = a3->rows;
    *(_OWORD *)&result->_bitmapData.nodeCount = v7;
    result->_bitmapData.skipRegion = skipRegion;
    *(_OWORD *)&result->_bitmapData.width = v5;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t nodeCount;
  unsigned __int16 *rows;
  size_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", self->_bitmapData.nodeCount, CFSTR("nodeCount"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_bitmapData.maximumNodesPerRow, CFSTR("maximumNodesPerRow"));
  nodeCount = self->_bitmapData.nodeCount;
  if (nodeCount)
  {
    rows = self->_bitmapData.rows;
    v6 = 2 * nodeCount;
    v7 = malloc_type_malloc(2 * nodeCount, 0x1000040BDFB0063uLL);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint8_t *_UIAllocateStandardizedEndiannessByteArrayForEncodingHostNodeArray(const _UIBoundingPathBitmapDataNode *, const size_t)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_UIBoundingPathBitmap.m"), 34, CFSTR("Failed to allocate memory for encoding the bitmap data node array."));

    }
    memcpy(v7, rows, v6);
    objc_msgSend(v10, "encodeBytes:length:forKey:", v7, 2 * self->_bitmapData.nodeCount, CFSTR("rows"));
    free(v7);
  }
  objc_msgSend(v10, "encodeInteger:forKey:", self->_bitmapData.width, CFSTR("width"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_bitmapData.height, CFSTR("height"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_bitmapData.skipRegion.y, CFSTR("skipRegion.y"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_bitmapData.skipRegion.height, CFSTR("skipRegion.height"));

}

- (_UIBoundingPathBitmap)initWithSize:(_UIIntegralSize)a3 containsPoint:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  unint64_t v8;
  unint64_t v9;
  _OWORD v11[3];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v8 = _UIComputeSkipRegionForBoundingPathData(var0, var1, v7);
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  _UICreateBoundingPathBitmapData(var0, var1, v8, v9, v7, (unint64_t *)&v13);

  v11[0] = v13;
  v11[1] = v14;
  v11[2] = v15;
  v12 = v16;
  return -[_UIBoundingPathBitmap initWithBitmapData:](self, "initWithBitmapData:", v11);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_bitmapData.rows);
  v3.receiver = self;
  v3.super_class = (Class)_UIBoundingPathBitmap;
  -[_UIBoundingPathBitmap dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _UIBoundingPathBitmapDataSkipRegion skipRegion;
  void *v6;
  void *v7;
  _OWORD v9[3];
  unsigned __int16 *rows;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  skipRegion = self->_bitmapData.skipRegion;
  v9[0] = *(_OWORD *)&self->_bitmapData.width;
  v9[1] = skipRegion;
  v9[2] = *(_OWORD *)&self->_bitmapData.nodeCount;
  rows = self->_bitmapData.rows;
  _UIBoundingPathBitmapDataDescription(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_imageRepresentation
{
  _UIBoundingPathBitmapDataSkipRegion skipRegion;
  _OWORD v4[3];
  unsigned __int16 *rows;

  skipRegion = self->_bitmapData.skipRegion;
  v4[0] = *(_OWORD *)&self->_bitmapData.width;
  v4[1] = skipRegion;
  v4[2] = *(_OWORD *)&self->_bitmapData.nodeCount;
  rows = self->_bitmapData.rows;
  _UIBoundingPathBitmapDataImageRepresentation((unint64_t *)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
