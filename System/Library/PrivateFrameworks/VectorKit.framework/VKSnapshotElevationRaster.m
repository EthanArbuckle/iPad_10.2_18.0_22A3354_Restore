@implementation VKSnapshotElevationRaster

- (VKSnapshotElevationRaster)initWithQuadTile:(QuadTile *)a3 width:(int)a4 height:(int)a5 scale:(float)a6 tileSizeInMeters:(float)a7 minElevationInMeters:(signed __int16)a8
{
  VKSnapshotElevationRaster *result;
  __int128 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VKSnapshotElevationRaster;
  result = -[VKSnapshotElevationRaster init](&v16, sel_init);
  if (result)
  {
    v15 = *(_OWORD *)&a3->_type;
    result->_tile._hash = a3->_hash;
    *(_OWORD *)&result->_tile._type = v15;
    result->_width = a4;
    result->_height = a5;
    result->_scale = a6;
    result->_tileSizeInMeters = a7;
    result->_minElevationInMeters = a8;
  }
  return result;
}

- (VKSnapshotElevationRaster)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  int v6;
  int v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  char *v12;
  int32x2_t v14;
  char v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKSnapshotElevationRaster;
  v5 = -[VKSnapshotElevationRaster init](&v16, sel_init);
  if (v5)
  {
    *((_DWORD *)v5 + 8) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("width"));
    *((_DWORD *)v5 + 9) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("height"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("scale"));
    *((_DWORD *)v5 + 11) = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("tileSizeInMeters"));
    *((_DWORD *)v5 + 12) = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quadTile"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (!strcmp((const char *)objc_msgSend(v8, "objCType"), "{QuadTileCoding=iiC}"))
    {
      v15 = 0;
      v14 = 0;
      objc_msgSend(v8, "getValue:", &v14);
      v9 = v15;
      v5[8] = -1;
      v5[9] = v9;
      *(int32x2_t *)(v5 + 12) = vrev64_s32(v14);
    }
    *((_WORD *)v5 + 26) = objc_msgSend(v4, "decodeIntForKey:", CFSTR("minElevationInMeters"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rasterData"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v10;

    v12 = v5;
  }

  return (VKSnapshotElevationRaster *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  unsigned __int8 level;
  void *v9;
  int32x2_t v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = v4;
  if (self->_rasterData)
  {
    objc_msgSend(v4, "encodeInt32:forKey:", self->_width, CFSTR("width"));
    objc_msgSend(v5, "encodeInt32:forKey:", self->_height, CFSTR("height"));
    *(float *)&v6 = self->_scale;
    objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("scale"), v6);
    *(float *)&v7 = self->_tileSizeInMeters;
    objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("tileSizeInMeters"), v7);
    level = self->_tile._level;
    v10 = vrev64_s32(*(int32x2_t *)&self->_tile._yIdx);
    v11 = level;
    objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v10, "{QuadTileCoding=iiC}");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("quadTile"));

    objc_msgSend(v5, "encodeInt:forKey:", self->_minElevationInMeters, CFSTR("minElevationInMeters"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_rasterData, CFSTR("rasterData"));
  }

}

- (float)_rasterElevationInMetersAtPoint:()Matrix<int
{
  int v4;
  int width;
  int v6;
  NSUInteger v7;
  _WORD *v8;
  NSUInteger v9;
  int16x4_t v10;
  float v11;

  v4 = a3._e[1];
  width = self->_width;
  v6 = width - 1;
  if (width - 1 >= a3._e[0])
    v6 = a3._e[0];
  if (a3._e[0] < 0)
    v6 = 0;
  if (self->_height - 1 < a3._e[1])
    v4 = self->_height - 1;
  if (*(uint64_t *)&a3 < 0)
    v4 = 0;
  v7 = v6 + v4 * width;
  v8 = -[NSData bytes](self->_rasterData, "bytes");
  v9 = -[NSData length](self->_rasterData, "length");
  v11 = 0.0;
  if (v9 >= v7)
  {
    LOWORD(v11) = v8[v7];
    v11 = (float)LODWORD(v11);
  }
  v10.i16[0] = self->_minElevationInMeters;
  return (float)vmovl_s16(v10).i32[0] + (float)(self->_scale * v11);
}

- (float)getElevationAtPoint:(const void *)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;

  v4 = *(double *)a3;
  v5 = 1.0 - *((double *)a3 + 1);
  v6 = (float)(self->_width - 1) * v4;
  v7 = (float)(self->_height - 1) * v5;
  v8 = (int)v7;
  -[VKSnapshotElevationRaster _rasterElevationInMetersAtPoint:](self, "_rasterElevationInMetersAtPoint:", (int)v6 | ((unint64_t)v8 << 32));
  v10 = v9;
  v11 = ((int)v6 + 1);
  -[VKSnapshotElevationRaster _rasterElevationInMetersAtPoint:](self, "_rasterElevationInMetersAtPoint:", v11 | (v8 << 32));
  v13 = v12;
  v14 = (v8 + 1);
  -[VKSnapshotElevationRaster _rasterElevationInMetersAtPoint:](self, "_rasterElevationInMetersAtPoint:", (int)v6 | ((unint64_t)v14 << 32));
  v16 = v15;
  -[VKSnapshotElevationRaster _rasterElevationInMetersAtPoint:](self, "_rasterElevationInMetersAtPoint:", v11 | (v14 << 32));
  v17 = v6 - truncf(v6);
  return (float)((float)(v10 * (float)(1.0 - v17)) + (float)(v13 * v17))
       + (float)((float)(v7 - truncf(v7))
               * (float)((float)((float)(v16 * (float)(1.0 - v17)) + (float)(v18 * v17))
                       - (float)((float)(v10 * (float)(1.0 - v17)) + (float)(v13 * v17))));
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (float)scale
{
  return self->_scale;
}

- (float)tileSizeInMeters
{
  return self->_tileSizeInMeters;
}

- (signed)minElevationInMeters
{
  return self->_minElevationInMeters;
}

- (NSData)rasterData
{
  return self->_rasterData;
}

- (void)setRasterData:(id)a3
{
  objc_storeStrong((id *)&self->_rasterData, a3);
}

- (const)tile
{
  return &self->_tile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rasterData, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 4) = 255;
  *((_DWORD *)self + 3) = 0;
  *((_DWORD *)self + 4) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
