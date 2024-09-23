@implementation TCColorPalettizer

- (id)initWitMaxPaletteSize:(unsigned int)a3
{
  unsigned __int16 v3;
  TCColorPalettizer *v4;
  TCColorPalettizer *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TCColorPalettizer;
  v4 = -[TCColorPalettizer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TCColorPalettizer createOctree:maxPaletteSize:](v4, "createOctree:maxPaletteSize:", &v4->m_pTree, v3);
    v5->isDefaultPaletteSize = 0;
  }
  return v5;
}

- (id)initWitDefaultPaletteSize
{
  TCColorPalettizer *v2;
  TCColorPalettizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCColorPalettizer;
  v2 = -[TCColorPalettizer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TCColorPalettizer createOctree:maxPaletteSize:](v2, "createOctree:maxPaletteSize:", &v2->m_pTree, 54);
    v3->isDefaultPaletteSize = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->m_pTree)
    -[TCColorPalettizer deleteOctree:](self, "deleteOctree:");
  v3.receiver = self;
  v3.super_class = (Class)TCColorPalettizer;
  -[TCColorPalettizer dealloc](&v3, sel_dealloc);
}

- (BOOL)addTSUColor:(id)a3
{
  double v5;
  unsigned int v6;
  double v7;
  uint64_t v8;
  double v9;

  if (!a3 || !self->m_pTree)
    return 0;
  objc_msgSend(a3, "redComponent");
  v6 = (int)(v5 * 255.0);
  objc_msgSend(a3, "greenComponent");
  v8 = (int)(v7 * 255.0);
  objc_msgSend(a3, "blueComponent");
  return -[TCColorPalettizer addQuadColor:](self, "addQuadColor:", ((unint64_t)v6 << 16) | (v8 << 8) | (int)(v9 * 255.0));
}

- (BOOL)addQuadColor:(_tagRgbQuad)a3
{
  BOOL result;

  if (!self->m_pTree)
    return 0;
  if (self->isDefaultPaletteSize
    && (!a3.var2 && !a3.var1 && !a3.var0 || a3.var2 == 255 && a3.var1 == 255 && a3.var0 == 255))
  {
    return 1;
  }
  if (!-[TCColorPalettizer addPixelToOctree:pixel:](self, "addPixelToOctree:pixel:"))
  {
    while (self->m_pTree->var2 > self->m_pTree->var1)
    {
      if (-[TCColorPalettizer reduceOctree:](self, "reduceOctree:"))
        goto LABEL_14;
    }
    return 1;
  }
LABEL_14:
  -[TCColorPalettizer deleteOctree:](self, "deleteOctree:", self->m_pTree);
  result = 0;
  self->m_pTree = 0;
  return result;
}

- (void)createPalette
{
  _tagOctree *m_pTree;

  m_pTree = self->m_pTree;
  if (m_pTree)
    self->m_pTree->var2 = -[TCColorPalettizer getPaletteFromOctree:paletteEntry:index:](self, "getPaletteFromOctree:paletteEntry:index:", m_pTree->var0, m_pTree->var3, 0);
}

- (unsigned)paletteColorCount
{
  _tagOctree *m_pTree;
  unsigned int var2;

  m_pTree = self->m_pTree;
  if (!m_pTree)
    return 0;
  var2 = m_pTree->var2;
  if (self->isDefaultPaletteSize)
    return var2 + 2;
  else
    return var2;
}

- (id)getPaletteDataRaw
{
  _tagOctree *m_pTree;
  void *v4;
  void *v5;
  char v7;

  m_pTree = self->m_pTree;
  if (!m_pTree || !m_pTree->var2)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0);
  v5 = v4;
  if (self->isDefaultPaletteSize)
  {
    v7 = 0;
    objc_msgSend(v4, "appendBytes:length:", &v7, 1);
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
    v7 = -1;
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
    v7 = 0;
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
  }
  objc_msgSend(v5, "appendBytes:length:", self->m_pTree->var3, 4 * self->m_pTree->var2);
  return v5;
}

- (id)getPngPaletteData
{
  _tagOctree *m_pTree;
  void *v4;
  void *v5;
  _tagOctree *v6;
  uint64_t v7;
  unint64_t v8;
  _tagRgbQuad *v9;
  char var0;
  char var1;
  char var2;

  m_pTree = self->m_pTree;
  if (!m_pTree || !m_pTree->var2)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0);
  v5 = v4;
  var2 = 0;
  if (self->isDefaultPaletteSize)
  {
    objc_msgSend(v4, "appendBytes:length:", &var2, 1);
    objc_msgSend(v5, "appendBytes:length:", &var2, 1);
    objc_msgSend(v5, "appendBytes:length:", &var2, 1);
    var2 = -1;
    objc_msgSend(v5, "appendBytes:length:", &var2, 1);
    objc_msgSend(v5, "appendBytes:length:", &var2, 1);
    objc_msgSend(v5, "appendBytes:length:", &var2, 1);
  }
  v6 = self->m_pTree;
  if (v6->var2)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = &v6->var3[v7];
      var0 = v9->var0;
      var1 = v9->var1;
      var2 = v9->var2;
      objc_msgSend(v5, "appendBytes:length:", &var2, 1);
      var2 = var1;
      objc_msgSend(v5, "appendBytes:length:", &var2, 1);
      var2 = var0;
      objc_msgSend(v5, "appendBytes:length:", &var2, 1);
      ++v8;
      v6 = self->m_pTree;
      ++v7;
    }
    while (v8 < v6->var2);
  }
  return v5;
}

- (id)getPaletteData
{
  _tagOctree *m_pTree;
  void *v4;
  void *v5;
  _tagOctree *v6;
  uint64_t v7;
  unint64_t v8;
  _tagRgbQuad *v9;
  char var0;
  char var1;
  char var2;
  char v14;

  m_pTree = self->m_pTree;
  if (!m_pTree || !m_pTree->var2)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0);
  v5 = v4;
  v14 = 0;
  if (self->isDefaultPaletteSize)
  {
    objc_msgSend(v4, "appendBytes:length:", &v14, 1);
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
    v14 = -1;
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
    objc_msgSend(v5, "appendBytes:length:", &v14, 1);
  }
  v6 = self->m_pTree;
  if (v6->var2)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = &v6->var3[v7];
      var0 = v9->var0;
      var1 = v9->var1;
      var2 = v9->var2;
      v14 = 0;
      objc_msgSend(v5, "appendBytes:length:", &v14, 1);
      v14 = var0;
      objc_msgSend(v5, "appendBytes:length:", &v14, 1);
      v14 = var1;
      objc_msgSend(v5, "appendBytes:length:", &v14, 1);
      v14 = var2;
      objc_msgSend(v5, "appendBytes:length:", &v14, 1);
      ++v8;
      v6 = self->m_pTree;
      ++v7;
    }
    while (v8 < v6->var2);
  }
  return v5;
}

- (int)paletteIndexFromTSUColor:(id)a3
{
  double v5;
  unsigned int v6;
  double v7;
  uint64_t v8;
  double v9;

  if (!self->m_pTree)
    return -1;
  objc_msgSend(a3, "redComponent");
  v6 = (int)(v5 * 255.0);
  objc_msgSend(a3, "greenComponent");
  v8 = (int)(v7 * 255.0);
  objc_msgSend(a3, "blueComponent");
  return -[TCColorPalettizer paletteIndexFromQuadColor:](self, "paletteIndexFromQuadColor:", ((unint64_t)v6 << 16) | (v8 << 8) | (int)(v9 * 255.0));
}

- (int)paletteIndexFromQuadColor:(_tagRgbQuad)a3
{
  if (!self->m_pTree)
    return -1;
  if (self->isDefaultPaletteSize)
  {
    if (!a3.var2 && !a3.var1 && !a3.var0)
      return 0;
    if (a3.var2 == 255 && a3.var1 == 255 && a3.var0 == 255)
      return 1;
  }
  if (-[TCColorPalettizer rgbToIndexOctree:source:destination:](self, "rgbToIndexOctree:source:destination:"))
    return -1;
  if (self->isDefaultPaletteSize)
    return 2;
  else
    return 0;
}

- (int)createOctree:(_tagOctree *)a3 maxPaletteSize:(unsigned __int16)a4
{
  unsigned int v4;
  _tagOctree *v7;
  _tagOctree *v8;
  _tagRgbQuad **p_var3;
  _tagRgbQuad *v10;
  int v11;

  v4 = a4;
  v7 = (_tagOctree *)malloc_type_malloc(0x60uLL, 0x10200403BC0D067uLL);
  *a3 = v7;
  if (!v7)
    return 1;
  v8 = v7;
  v7->var0 = 0;
  v7->var1 = v4;
  v7->var2 = 0;
  *(_OWORD *)&v7->var3 = 0u;
  p_var3 = &v7->var3;
  *(_OWORD *)&v7->var4[1] = 0u;
  *(_OWORD *)&v7->var4[3] = 0u;
  *(_OWORD *)&v7->var4[5] = 0u;
  *(_OWORD *)&v7->var4[7] = 0u;
  if (v4 && (v10 = (_tagRgbQuad *)malloc_type_malloc(4 * v4, 0xD809582AuLL), (*p_var3 = v10) != 0))
  {
    v11 = -[TCColorPalettizer createNodeOctree:parent:](self, "createNodeOctree:parent:", v8, 0);
    if (!v11)
      return v11;
  }
  else
  {
    v11 = 1;
  }
  -[TCColorPalettizer deleteOctree:](self, "deleteOctree:", v8);
  *a3 = 0;
  return v11;
}

- (int)deleteOctree:(_tagOctree *)a3
{
  int v5;
  uint64_t i;
  int v7;
  _tagRgbQuad *var3;

  if (!a3)
    return 0;
  v5 = -[TCColorPalettizer deleteNodeOctree:](self, "deleteNodeOctree:", a3->var0);
  for (i = 24; i != 96; i += 8)
  {
    v7 = -[TCColorPalettizer deleteListOctree:](self, "deleteListOctree:", *(_tagOctreeNode **)((char *)&a3->var0 + i));
    if (v7)
      v5 = v7;
  }
  var3 = a3->var3;
  if (var3)
    free(var3);
  free(a3);
  return v5;
}

- (int)createNodeOctree:(_tagOctreeNode *)a3 parent:(_tagOctreeNode *)a4
{
  _tagOctreeNode *v6;
  _tagOctreeNode *v7;
  int result;

  v6 = (_tagOctreeNode *)malloc_type_malloc(0x60uLL, 0x10200401E285E51uLL);
  *a3 = v6;
  if (!v6)
    return 1;
  v7 = v6;
  result = 0;
  v7->var0 = a4;
  v7->var4 = 0;
  *(_OWORD *)v7->var1 = 0u;
  *(_OWORD *)&v7->var1[2] = 0u;
  *(_OWORD *)&v7->var1[4] = 0u;
  *(_OWORD *)&v7->var1[6] = 0u;
  v7->var2 = 0;
  return result;
}

- (int)deleteNodeOctree:(_tagOctreeNode *)a3
{
  int v5;
  uint64_t i;
  int v7;

  if (!a3)
    return 0;
  v5 = 0;
  for (i = 8; i != 72; i += 8)
  {
    v7 = -[TCColorPalettizer deleteNodeOctree:](self, "deleteNodeOctree:", *(_tagOctreeNode **)((char *)&a3->var0 + i));
    if (v7)
      v5 = v7;
  }
  free(a3);
  return v5;
}

- (int)deleteListOctree:(_tagLevelItem *)a3
{
  int v4;

  if (!a3)
    return 0;
  if (a3->var0)
    v4 = -[TCColorPalettizer deleteListOctree:](self, "deleteListOctree:");
  else
    v4 = 0;
  free(a3);
  return v4;
}

- (int)addPixelToOctree:(_tagOctree *)a3 pixel:(_tagRgbQuad)a4
{
  unsigned __int8 var0;
  uint64_t v6;
  uint64_t v7;
  _tagOctreeNode *v8;
  unsigned int var2;
  _tagOctreeNode *v10;
  _tagLevelItem *v11;
  unsigned int var1;
  unsigned int v14;
  int v15;
  char *v16;
  _tagOctreeNode **v17;
  _tagOctreeNode *v18;
  unsigned int v19;
  _tagLevelItem *v20;
  uint64_t v22;

  if (a3)
  {
    var0 = a4.var0;
    v6 = *(_QWORD *)&a4.var0 >> 8;
    v7 = *(_QWORD *)&a4.var0 >> 16;
    v8 = a3->var0;
    var2 = a3->var0->var2;
    if (var2)
    {
      v10 = a3->var0;
LABEL_12:
      if (var2 < 0x9999)
      {
        v10->var3.var2 = ((v7 << 8) + v10->var3.var2 * var2) / (var2 + 1);
        v19 = ((v6 << 8) + v10->var3.var1 * var2) / (var2 + 1);
        v10->var3.var0 = ((var0 << 8) + v10->var3.var0 * var2) / (var2 + 1);
        v10->var3.var1 = v19;
      }
      LODWORD(v11) = 0;
      v10->var2 = var2 + 1;
    }
    else
    {
      v22 = *(_QWORD *)&a4.var0 >> 8;
      var1 = a4.var1;
      v14 = a4.var0;
      v15 = 7;
      while (v15 != -1)
      {
        v16 = (char *)v8
            + 8 * ((v14 >> v15) & 1 | (2 * ((var1 >> v15) & 1)) & 0xFFFFFFFB | (4 * ((v7 >> v15) & 1)));
        v18 = (_tagOctreeNode *)*((_QWORD *)v16 + 1);
        v17 = (_tagOctreeNode **)(v16 + 8);
        v10 = v18;
        if (!v18)
        {
          LODWORD(v11) = -[TCColorPalettizer createNodeOctree:parent:](self, "createNodeOctree:parent:", v17, v8);
          if ((_DWORD)v11)
            return (int)v11;
          v10 = *v17;
        }
        var2 = v10->var2;
        --v15;
        v8 = v10;
        if (var2)
        {
          LOBYTE(v6) = v22;
          goto LABEL_12;
        }
      }
      v8->var3.var1 = v22 << 8;
      v8->var3.var2 = v7 << 8;
      v8->var2 = 1;
      v8->var3.var0 = var0 << 8;
      ++a3->var2;
      v11 = (_tagLevelItem *)malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
      if (v11)
      {
        v20 = v11;
        LODWORD(v11) = 0;
        v20->var0 = a3->var4[8];
        v20->var1 = v8;
        a3->var4[8] = v20;
      }
    }
  }
  else
  {
    LODWORD(v11) = 2;
  }
  return (int)v11;
}

- (int)reduceOctree:(_tagOctree *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  int32x2_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  _tagOctreeNode *v20;
  char *v21;
  _tagOctreeNode *var0;

  v5 = 0x700000000;
  v6 = 88;
  while (1)
  {
    v7 = *(uint64_t *)((char *)&a3->var0 + v6);
    if (v7)
      break;
    v5 -= 0x100000000;
    v6 -= 8;
    if (v6 == 24)
    {
LABEL_4:
      LODWORD(v8) = 1;
      return (int)v8;
    }
  }
  v9 = **(_QWORD **)(v7 + 8);
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = *(_QWORD *)(v9 + 8 + v10);
      if (v12)
      {
        v13 = *(_DWORD *)(v12 + 72);
        if (!v13)
          goto LABEL_4;
        v11 += v13;
      }
      v10 += 8;
    }
    while (v10 != 64);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = v9 + 8;
    do
    {
      v18 = *(_QWORD *)(v17 + v14);
      if (v18)
      {
        v19 = (*(_DWORD *)(v18 + 72) << 8) / v11;
        v15 += v19 * *(_DWORD *)(v18 + 84);
        v16 = vmla_s32(v16, *(int32x2_t *)(v18 + 76), vdup_n_s32(v19));
        *(_QWORD *)v18 = 0;
        *(_QWORD *)(v17 + v14) = 0;
      }
      v14 += 8;
    }
    while (v14 != 64);
    *(_DWORD *)(v9 + 72) = v11;
    *(_DWORD *)(v9 + 84) = v15 >> 8;
    *(uint32x2_t *)(v9 + 76) = vshr_n_u32((uint32x2_t)v16, 8uLL);
  }
  ++a3->var2;
  v8 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
  if (v8)
  {
    v20 = (_tagOctreeNode *)((char *)a3 + v6);
    v21 = (char *)a3 + (v5 >> 29);
    *v8 = *((_QWORD *)v21 + 3);
    v8[1] = v9;
    *((_QWORD *)v21 + 3) = v8;
    while (1)
    {
      var0 = v20->var0;
      if (!v20->var0)
        break;
      if (var0->var1[0]->var0)
      {
        v20 = v20->var0;
      }
      else
      {
        v20->var0 = var0->var0;
        LODWORD(v8) = -[TCColorPalettizer deleteNodeOctree:](self, "deleteNodeOctree:", var0->var1[0]);
        if ((_DWORD)v8)
          return (int)v8;
        --a3->var2;
        free(var0);
      }
    }
    LODWORD(v8) = 0;
  }
  return (int)v8;
}

- (unsigned)getPaletteFromOctree:(_tagOctreeNode *)a3 paletteEntry:(_tagRgbQuad *)a4 index:(unsigned __int16)a5
{
  uint64_t v8;
  unsigned __int16 v9;
  _tagOctreeNode **var1;
  unsigned __int16 v11;
  _tagOctreeNode *v12;
  unsigned int v13;
  unsigned int var0;

  v8 = 0;
  v9 = 0;
  var1 = a3->var1;
  if (a3->var0)
    v11 = a5;
  else
    v11 = 0;
  do
  {
    v12 = var1[v8];
    if (v12)
    {
      v13 = -[TCColorPalettizer getPaletteFromOctree:paletteEntry:index:](self, "getPaletteFromOctree:paletteEntry:index:", v12, a4, v11);
      a4 += v13;
      v11 += v13;
      v9 += v13;
    }
    ++v8;
  }
  while (v8 != 8);
  if (!a3->var1[0]
    && !a3->var1[1]
    && !a3->var1[2]
    && !a3->var1[3]
    && !a3->var1[4]
    && !a3->var1[5]
    && !a3->var1[6]
    && !a3->var1[7])
  {
    a4->var2 = BYTE1(a3->var3.var2);
    var0 = a3->var3.var0;
    a4->var1 = BYTE1(a3->var3.var1);
    a4->var0 = BYTE1(var0);
    a4->var3 = 0;
    a3->var4 = v11;
    ++v9;
  }
  return v9;
}

- (int)rgbToIndexOctree:(_tagOctree *)a3 source:(_tagRgbQuad)a4 destination:(char *)a5
{
  _tagOctreeNode *var0;
  int v6;
  unsigned int v7;
  int result;

  var0 = a3->var0;
  if (!a3->var0)
    return 1;
  v6 = 0;
  while (var0->var1[0]
       || var0->var1[1]
       || var0->var1[2]
       || var0->var1[3]
       || var0->var1[4]
       || var0->var1[5]
       || var0->var1[6]
       || var0->var1[7])
  {
    v7 = (a4.var0 >> (7 - v6)) & 1 | (2 * ((a4.var1 >> (7 - v6)) & 1)) & 0xFFFFFFFB | (4 * ((a4.var2 >> (7 - v6)) & 1));
    ++v6;
    var0 = var0->var1[v7];
    if (!var0)
      return 1;
  }
  if (!var0->var2)
    return 1;
  result = 0;
  *a5 = var0->var4;
  return result;
}

@end
