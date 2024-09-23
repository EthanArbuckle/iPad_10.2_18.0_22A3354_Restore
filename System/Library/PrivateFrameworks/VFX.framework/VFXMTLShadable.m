@implementation VFXMTLShadable

- (void)dealloc
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  objc_super v6;

  for (i = 0; i != 31; ++i)
  {

  }
  for (j = 0; j != 31; ++j)
  {

  }
  for (k = 0; k != 16; ++k)
  {

  }
  v6.receiver = self;
  v6.super_class = (Class)VFXMTLShadable;
  -[VFXMTLShadable dealloc](&v6, sel_dealloc);
}

- (void)setResource:(id)a3 ofType:(int64_t)a4 atIndices:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char var0;
  uint64_t v11;
  int var1;
  id v13;
  id *v14;
  id v15;
  id *v16;
  id v17;
  id *v18;
  id v19;
  id *v20;
  id v21;
  id *v22;
  id v23;
  id *v24;
  uint64_t v25;

  var0 = a5.var0;
  v11 = *(_QWORD *)&a5.var0 >> 8;
  var1 = a5.var1;
  if (a4 == 3)
  {
    if (a5.var0 != 255)
    {
      v17 = a3;
      v18 = (id *)(&self->super.isa + var0);

      v18[125] = a3;
    }
    if (var1 != 255)
    {
      v19 = a3;
      v20 = (id *)(&self->super.isa + (char)v11);

      v20[141] = a3;
    }
  }
  else if (a4 == 2)
  {
    if (a5.var0 != 255)
    {
      v21 = a3;
      v22 = (id *)(&self->super.isa + var0);

      v22[63] = a3;
    }
    if (var1 != 255)
    {
      v23 = a3;
      v24 = (id *)(&self->super.isa + (char)v11);

      v24[94] = a3;
    }
  }
  else if (a4)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Invalid resource type"), (uint64_t)a3, a4, *(uint64_t *)&a5.var0, v5, v6, v7, v25);
  }
  else
  {
    if (a5.var0 != 255)
    {
      v13 = a3;
      v14 = (id *)(&self->super.isa + var0);

      v14[1] = a3;
    }
    if (var1 != 255)
    {
      v15 = a3;
      v16 = (id *)(&self->super.isa + (char)v11);

      v16[32] = a3;
    }
  }
}

- (id)bufferAtIndices:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if (a3.var0 != -1)
    return self->_vertexBuffers[a3.var0];
  if ((~*(_WORD *)&a3 & 0xFF00) != 0)
    return self->_fragmentBuffers[a3.var1];
  sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Not indices are bound!?!"), *(uint64_t *)&a3.var0, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)textureAtIndices:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if (a3.var0 != -1)
    return self->_vertexTextures[a3.var0];
  if ((~*(_WORD *)&a3 & 0xFF00) != 0)
    return self->_fragmentTextures[a3.var1];
  sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Not indices are bound!?!"), *(uint64_t *)&a3.var0, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)samplerAtIndices:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if (a3.var0 != -1)
    return self->_vertexSamplers[a3.var0];
  if ((~*(_WORD *)&a3 & 0xFF00) != 0)
    return self->_fragmentSamplers[a3.var1];
  sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Not indices are bound!?!"), *(uint64_t *)&a3.var0, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (int64_t)materialModificationCount
{
  return self->materialModificationCount;
}

- (void)setMaterialModificationCount:(int64_t)a3
{
  self->materialModificationCount = a3;
}

- (int64_t)geometryModificationCount
{
  return self->geometryModificationCount;
}

- (void)setGeometryModificationCount:(int64_t)a3
{
  self->geometryModificationCount = a3;
}

@end
