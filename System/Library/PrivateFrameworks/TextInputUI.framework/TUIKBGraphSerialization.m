@implementation TUIKBGraphSerialization

- (int64_t)currentFileType
{
  return self->_currentFileType;
}

- (void)setSerializedData:(id)a3
{
  int v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  int v12;

  self->_serializedData = (NSData *)a3;
  self->_graphData = (NSData *)a3;
  v12 = 0;

  self->_minEdgeWidths = (NSMutableDictionary *)objc_msgSend(-[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v12), "mutableCopy");
  self->_maxEdgeWidths = (NSMutableDictionary *)objc_msgSend(-[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v12), "mutableCopy");
  v5 = -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", &v12);
  v6 = -[NSData bytes](self->_graphData, "bytes");
  v7 = &v6[v12];

  self->_keyboardOffsetsData = (NSData *)(id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v5, 0);
  self->_keyboardOffsets = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v12 + (uint64_t)v5;
  v12 += v5;
  v9 = &v6[v8];
  v10 = (void *)MEMORY[0x1E0C99D50];
  v11 = objc_msgSend(a3, "length");
  self->_graphData = (NSData *)(id)objc_msgSend(v10, "dataWithBytesNoCopy:length:freeWhenDone:", v9, v11 - v12, 0);
}

- (TUIKBGraphSerialization)init
{
  TUIKBGraphSerialization *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIKBGraphSerialization;
  v2 = -[TUIKBGraphSerialization init](&v4, sel_init);
  if (v2)
  {
    v2->_serializedOffsets = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2->_minEdgeWidths = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2->_maxEdgeWidths = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2->_keyboardOffsets = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2->_graphData = (NSData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v2->_referenceCount = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2->_serializedData = 0;
    v2->_currentFileType = -1;
  }
  return v2;
}

- (void)setDeserializationCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIKBGraphSerialization;
  -[TUIKBGraphSerialization dealloc](&v3, sel_dealloc);
}

- (id)arrayForOffset:(int *)a3 withCount:(unint64_t)a4
{
  unint64_t v4;
  void *i;

  v4 = a4;
  for (i = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4); v4; --v4)
    objc_msgSend(i, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  return i;
}

- (CGRect)CGRectForOffset:(int *)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  float *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15[4];
  uint64_t v16;
  CGRect result;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[NSData bytes](self->_graphData, "bytes");
  v6 = 0;
  v7 = *a3;
  v8 = v5[v7];
  *a3 = v7 + 1;
  v9 = v15;
  do
  {
    -[TUIKBGraphSerialization compressedFloatForOffset:withKind:](self, "compressedFloatForOffset:withKind:", a3, (v8 >> v6) & 3);
    *(_DWORD *)v9++ = v10;
    v6 += 2;
  }
  while (v6 != 8);
  v11 = v15[0];
  v12 = v15[1];
  v13 = v15[2];
  v14 = v15[3];
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (float)compressedFloatForOffset:(int *)a3 withKind:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  double v6;

  if (a4 == 3)
  {
    -[TUIKBGraphSerialization bareFloatForOffset:](self, "bareFloatForOffset:", a3);
  }
  else if (a4 == 2)
  {
    *(float *)&v6 = (float)-[TUIKBGraphSerialization compressedIntForOffset:](self, "compressedIntForOffset:", a3, v4, v5)/ 6.0;
  }
  else
  {
    LODWORD(v6) = 0;
    if (a4 == 1)
      *(float *)&v6 = (float)-[TUIKBGraphSerialization compressedIntForOffset:](self, "compressedIntForOffset:", a3, v6, v4, v5);
  }
  return *(float *)&v6;
}

- (id)_UIKBTreeForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  char v4;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v4 = a4;
  ++*a3;
  v7 = -[TUIKBGraphSerialization intValueForOffset:](self, "intValueForOffset:");
  if ((v4 & 1) != 0)
  {
    v8 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3);
    if ((v4 & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v8 = 0;
    if ((v4 & 2) != 0)
    {
LABEL_3:
      v9 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3);
      goto LABEL_6;
    }
  }
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
LABEL_6:
  v10 = v9;
  if ((v4 & 4) != 0)
  {
    v11 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3);
    if ((v4 & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v11 = 0;
  if ((v4 & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v12 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3);
LABEL_11:
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3920]), "initWithType:withName:withProperties:withSubtrees:withCache:", v7, v8, v10, v11, v12);
  if ((objc_msgSend(v13, "isLeafType") & 1) == 0 && !v11)
    objc_msgSend(v13, "setSubtrees:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
  return v13;
}

- (id)stringConcatForOffset:(int *)a3 withComponentCount:(unint64_t)a4
{
  void *v7;
  unsigned int v8;
  unint64_t v9;
  int v11;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  if (a4)
  {
    v8 = 1;
    do
    {
      v11 = 0;
      v11 = -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", a3);
      objc_msgSend(v7, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v11));
      v9 = v8++;
    }
    while (v9 < a4);
  }
  return (id)objc_msgSend(v7, "componentsJoinedByString:", &stru_1E24FC6C0);
}

- (id)relativeRefArrayForOffset:(int *)a3 withCount:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  int v9;
  int v11;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  if (a4)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      if (v8)
        v9 += -[TUIKBGraphSerialization compressedIntForOffset:](self, "compressedIntForOffset:", a3);
      else
        v9 = -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", a3);
      v11 = v9;
      objc_msgSend(v7, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v11));
      ++v8;
    }
    while (a4 != v8);
  }
  return v7;
}

- (id)objectForOffset:(int *)a3
{
  uint64_t v5;
  void *v6;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  int v15;

  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a3);
  v6 = (void *)-[NSMutableDictionary objectForKey:](-[TUIKBGraphSerialization deserializationCache](self, "deserializationCache"), "objectForKey:", v5);
  if (!v6)
  {
    v8 = -[NSData bytes](self->_graphData, "bytes");
    v9 = *a3;
    v10 = v8[v9];
    *a3 = v9 + 1;
    v11 = v10 & 0xF;
    v12 = v10 >> 4;
    if ((v10 >> 4) == 15)
      v12 = -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", a3);
    switch(v11)
    {
      case 0:
        v15 = -[TUIKBGraphSerialization intValueForOffset:](self, "intValueForOffset:", a3, v12);
        return -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v15);
      case 1:
        v13 = -[TUIKBGraphSerialization intValueForOffset:](self, "intValueForOffset:", a3, v12);
        return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
      case 2:
        -[TUIKBGraphSerialization floatValueForOffset:](self, "floatValueForOffset:", a3, v12);
        return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      case 3:
        v14 = -[TUIKBGraphSerialization simpleStringForOffset:withUTF8Length:](self, "simpleStringForOffset:withUTF8Length:", a3, v12);
        goto LABEL_21;
      case 4:
        v14 = -[TUIKBGraphSerialization stringConcatForOffset:withComponentCount:](self, "stringConcatForOffset:withComponentCount:", a3, v12);
        goto LABEL_21;
      case 5:
        v14 = -[TUIKBGraphSerialization arrayForOffset:withCount:](self, "arrayForOffset:withCount:", a3, v12);
        goto LABEL_21;
      case 6:
        v14 = -[TUIKBGraphSerialization setForOffset:nonEmpty:](self, "setForOffset:nonEmpty:", a3, v12 != 0);
        goto LABEL_21;
      case 7:
        v14 = -[TUIKBGraphSerialization dictionaryForOffset:nonEmpty:](self, "dictionaryForOffset:nonEmpty:", a3, v12 != 0);
        goto LABEL_21;
      case 8:
        v14 = -[TUIKBGraphSerialization geometryForOffset:withFlags:](self, "geometryForOffset:withFlags:", a3, v12);
        goto LABEL_21;
      case 9:
        v14 = -[TUIKBGraphSerialization shapeForOffset:withFlags:](self, "shapeForOffset:withFlags:", a3, v12);
        goto LABEL_21;
      case 10:
        v14 = -[TUIKBGraphSerialization mergeActionForOffset:withFlags:](self, "mergeActionForOffset:withFlags:", a3, v12);
        goto LABEL_21;
      case 11:
        v14 = -[TUIKBGraphSerialization UIKBTreeForOffset:withFlags:](self, "UIKBTreeForOffset:withFlags:", a3, v12);
        goto LABEL_21;
      case 12:
        v14 = -[TUIKBGraphSerialization refArrayForOffset:withCount:](self, "refArrayForOffset:withCount:", a3, v12);
        goto LABEL_21;
      case 13:
        v14 = -[TUIKBGraphSerialization relativeRefArrayForOffset:withCount:](self, "relativeRefArrayForOffset:withCount:", a3, v12);
LABEL_21:
        v6 = v14;
        if (v14)
        {
          if (-[TUIKBGraphSerialization deserializationCache](self, "deserializationCache"))
            -[NSMutableDictionary setObject:forKey:](-[TUIKBGraphSerialization deserializationCache](self, "deserializationCache"), "setObject:forKey:", v6, v5);
        }
        break;
      default:
        return 0;
    }
  }
  return v6;
}

- (NSMutableDictionary)deserializationCache
{
  return self->_deserializationCache;
}

- (unint64_t)compressedUIntForOffset:(int *)a3
{
  char *v4;
  unint64_t result;
  int v6;
  uint64_t v7;
  int v8;
  char *v9;
  char v10;

  v4 = -[NSData bytes](self->_graphData, "bytes");
  result = 0;
  v6 = 0;
  v7 = *a3;
  v8 = v7 + 1;
  v9 = &v4[v7];
  do
  {
    v10 = *v9++;
    result |= (unint64_t)(v10 & 0x7F) << v6;
    *a3 = v8;
    v6 += 7;
    ++v8;
  }
  while (v10 < 0);
  return result;
}

- (unint64_t)compressedIntForOffset:(int *)a3
{
  _BYTE *v4;
  uint64_t v5;
  int v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  char *v11;
  int v12;
  char v13;

  v4 = -[NSData bytes](self->_graphData, "bytes");
  v5 = *a3;
  v6 = (char)v4[v5];
  v7 = v4[v5];
  v8 = v7 & 0x3F;
  v9 = v5 + 1;
  *a3 = v5 + 1;
  if (v6 < 0)
  {
    v10 = v5 + 2;
    v11 = &v4[v9];
    v12 = 6;
    do
    {
      v13 = *v11++;
      v8 |= (unint64_t)(v13 & 0x7F) << v12;
      *a3 = v10;
      v12 += 7;
      ++v10;
    }
    while (v13 < 0);
  }
  if ((v7 & 0x40) != 0)
    return -(uint64_t)v8;
  else
    return v8;
}

- (int)intValueForOffset:(int *)a3
{
  return -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", a3);
}

- (id)simpleStringForOffset:(int *)a3 withUTF8Length:(unint64_t)a4
{
  const void *v6;
  id result;

  v6 = -[NSData bytes](self->_graphData, "bytes") + *a3;
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, a4, 4);
  *a3 += a4;
  return result;
}

- (id)dictionaryForOffset:(int *)a3 nonEmpty:(BOOL)a4
{
  id v6;
  id v7;

  if (!a4)
    return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v6 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:");
  v7 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjects:forKeys:", v7, v6);
}

- (id)UIKBTreeForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  void *v7;
  id v8;

  v7 = (void *)MEMORY[0x18D787638](self, a2);
  v8 = -[TUIKBGraphSerialization _UIKBTreeForOffset:withFlags:](self, "_UIKBTreeForOffset:withFlags:", a3, a4);
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (id)shapeForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  char v4;
  id v7;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DC3918]);
  if ((v4 & 1) != 0)
    objc_msgSend(v7, "setGeometry:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  -[TUIKBGraphSerialization CGRectForOffset:](self, "CGRectForOffset:", a3);
  objc_msgSend(v7, "setFrame:");
  -[TUIKBGraphSerialization CGRectForOffset:](self, "CGRectForOffset:", a3);
  objc_msgSend(v7, "setPaddedFrame:");
  return v7;
}

- (id)mergeActionForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  char v4;
  id v7;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DC38F0]);
  objc_msgSend(v7, "setRemainingKeyName:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  objc_msgSend(v7, "setDisappearingKeyName:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  if ((v4 & 1) != 0)
    objc_msgSend(v7, "setOrderedKeyList:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  if ((v4 & 2) != 0)
    objc_msgSend(v7, "setFactors:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  return v7;
}

- (id)geometryForOffset:(int *)a3 withFlags:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = objc_alloc_init(MEMORY[0x1E0DC38E0]);
  objc_msgSend(v7, "setName:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3));
  v8 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setX:", v8, v9);
  v10 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setY:", v10, v11);
  v12 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setW:", v12, v13);
  v14 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setH:", v14, v15);
  v16 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setPaddingTop:", v16, v17);
  v18 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setPaddingLeft:", v18, v19);
  v20 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setPaddingBottom:", v20, v21);
  v22 = -[TUIKBGraphSerialization UIKBValueForOffset:](self, "UIKBValueForOffset:", a3);
  objc_msgSend(v7, "setPaddingRight:", v22, v23);
  objc_msgSend(v7, "setExplicitlySpecified:", a4 & 1);
  objc_msgSend(v7, "setIsTemplate:", (a4 >> 1) & 1);
  return v7;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)UIKBValueForOffset:(int *)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  float v9;
  double v10;
  uint64_t v11;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v5 = -[NSData bytes](self->_graphData, "bytes");
  v6 = *a3;
  v7 = v5[v6];
  *a3 = v6 + 1;
  if ((v7 & 0xF) == 0xF)
    v8 = 100;
  else
    v8 = v7 & 0xF;
  -[TUIKBGraphSerialization compressedFloatForOffset:withKind:](self, "compressedFloatForOffset:withKind:", a3, v7 >> 4);
  v10 = v9;
  v11 = v8;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (id)setForOffset:(int *)a3 nonEmpty:(BOOL)a4
{
  id v4;

  if (!a4)
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
}

- (id)keyboardForName:(id)a3
{
  id v5;
  int v7;

  v5 = -[NSDictionary objectForKey:](self->_keyboardOffsets, "objectForKey:");
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
    return -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
    _CFPropertyListCreateFiltered();
    return 0;
  }
}

- (NSMutableDictionary)keyboardOffsets
{
  return (NSMutableDictionary *)self->_keyboardOffsets;
}

- (void)reset
{
  NSMutableData *v3;

  -[NSMapTable removeAllObjects](self->_serializedOffsets, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_minEdgeWidths, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_maxEdgeWidths, "removeAllObjects");

  -[NSMutableDictionary removeAllObjects](self->_referenceCount, "removeAllObjects");
  self->_keyboardOffsetsData = 0;
  -[NSMutableDictionary removeAllObjects](-[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets"), "removeAllObjects");
  v3 = -[TUIKBGraphSerialization graphData](self, "graphData");
  -[NSMutableData setData:](v3, "setData:", objc_msgSend(MEMORY[0x1E0C99D50], "data"));

  self->_serializedData = 0;
  self->_currentFileType = -1;
}

- (NSMutableData)graphData
{
  return (NSMutableData *)self->_graphData;
}

- (id)mutableDataForObjectType:(unsigned __int8)a3
{
  return -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", a3, 0);
}

- (id)mutableDataForObjectType:(unsigned __int8)a3 withSize:(unint64_t)a4
{
  void *v5;
  char v8;
  char v9;

  if (a4 > 0xE)
  {
    v8 = a3 | 0xF0;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v8, 1);
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a4));
  }
  else
  {
    v9 = a3 | (16 * a4);
    return (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v9, 1);
  }
  return v5;
}

- (id)dataForCompressedInt:(int64_t)a3
{
  unint64_t v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  char v9;
  uint64_t v10;
  _BYTE v12[10];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v12[0] = 0;
LABEL_12:
    v10 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, v10);
  }
  if (a3 >= 0)
    v3 = a3;
  else
    v3 = -a3;
  v4 = ((unint64_t)a3 >> 57) & 0x40 | v3 & 0x3F;
  if (v3 > 0x3F)
    v4 |= 0x80u;
  v12[0] = v4;
  if (v3 < 0x40)
    goto LABEL_12;
  v5 = v3 >> 6;
  v6 = 1;
  do
  {
    v7 = v5 > 0x7F;
    v8 = v5 > 0x7F;
    v9 = v5 & 0x7F;
    v5 >>= 7;
    v12[v6++] = v9 | (v8 << 7);
  }
  while (v7);
  v10 = v6;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, v10);
}

- (id)dataForCompressedUInt:(unint64_t)a3
{
  uint64_t v3;
  BOOL v4;
  char v5;
  char v6;
  uint64_t v7;
  _BYTE v9[10];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = 0;
    do
    {
      v4 = a3 > 0x7F;
      v5 = a3 > 0x7F;
      v6 = a3 & 0x7F;
      a3 >>= 7;
      v9[v3++] = v6 | (v5 << 7);
    }
    while (v4);
    v7 = v3;
  }
  else
  {
    v9[0] = 0;
    v7 = 1;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v7);
}

- (id)dataForCompressedFloat:(float)a3 kind:(unsigned __int8 *)a4
{
  unint64_t v5;

  if (a3 == 0.0)
  {
    *a4 = 0;
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  }
  if (a3 > 0.0)
  {
    if (vabds_f32(roundf(a3), a3) < 0.001)
    {
      *a4 = 1;
      v5 = llroundf(a3);
      return -[TUIKBGraphSerialization dataForCompressedInt:](self, "dataForCompressedInt:", v5);
    }
    if (fabsf(roundf(a3 * 6.0) - (float)(a3 * 6.0)) < 0.001)
    {
      *a4 = 2;
      v5 = llroundf(a3 * 6.0);
      return -[TUIKBGraphSerialization dataForCompressedInt:](self, "dataForCompressedInt:", v5);
    }
  }
  *a4 = 3;
  return -[TUIKBGraphSerialization dataForBareFloat:](self, "dataForBareFloat:");
}

- (id)dataForFlags:(unsigned __int8)a3
{
  return -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a3);
}

- (id)dataForInt:(int)a3
{
  id v5;

  v5 = -[TUIKBGraphSerialization mutableDataForObjectType:](self, "mutableDataForObjectType:", 1);
  objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a3));
  return v5;
}

- (id)dataForBareFloat:(float)a3
{
  float v4;

  v4 = a3;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 4);
}

- (id)dataForFloat:(float)a3
{
  id v5;
  double v6;

  v5 = -[TUIKBGraphSerialization mutableDataForObjectType:](self, "mutableDataForObjectType:", 2);
  *(float *)&v6 = a3;
  objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForBareFloat:](self, "dataForBareFloat:", v6));
  return v5;
}

- (id)dataForReference:(int)a3
{
  id v5;

  v5 = -[TUIKBGraphSerialization mutableDataForObjectType:](self, "mutableDataForObjectType:", 0);
  objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", a3));
  return v5;
}

- (id)stringsBySplittingString:(id)a3 afterCharactersInSet:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = objc_msgSend(a3, "length");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v6)
  {
    v8 = 0;
    do
    {
      v9 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", a4, 0, v8, v6);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        v6 = v10 - v8 + v9;
      objc_msgSend(v7, "addObject:", objc_msgSend(a3, "substringWithRange:", v8, v6));
      v8 += v6;
      v11 = objc_msgSend(a3, "length");
      v6 = v11 - v8;
    }
    while (v11 != v8);
  }
  return v7;
}

- (BOOL)stringIsSimple:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "length") < 2
      || objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", objc_msgSend((id)objc_opt_class(), "separatorCharacterSet"), 0, 1, objc_msgSend(a3, "length") - 2) == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)dataForStringConcat:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[TUIKBGraphSerialization stringsBySplittingString:afterCharactersInSet:](self, "stringsBySplittingString:afterCharactersInSet:", a3, objc_msgSend((id)objc_opt_class(), "separatorCharacterSet"));
  v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 4, objc_msgSend(v4, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[TUIKBGraphSerialization serializeObject:](self, "serializeObject:", v10);
        objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", -[TUIKBGraphSerialization _serializedOffsetForObject:](self, "_serializedOffsetForObject:", v10)));
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)dataForSimpleString:(id)a3
{
  id v5;
  int v6;

  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    v6 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
    v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 3, v6);
    if (v6 >= 1)
      objc_msgSend(v5, "appendBytes:length:", objc_msgSend(a3, "cStringUsingEncoding:", 4), v6);
  }
  return v5;
}

- (id)dataForString:(id)a3
{
  if (-[TUIKBGraphSerialization stringIsSimple:](self, "stringIsSimple:") || self->_disableOffsets)
    return -[TUIKBGraphSerialization dataForSimpleString:](self, "dataForSimpleString:", a3);
  else
    return -[TUIKBGraphSerialization dataForStringConcat:](self, "dataForStringConcat:", a3);
}

- (id)dataForArray:(id)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    if (self->_disableOffsets)
    {
      v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 5, objc_msgSend(a3, "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v26 != v9)
              objc_enumerationMutation(a3);
            v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            v12 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:", v11);
            if (!v12)
            {
              -[TUIKBGraphSerialization serializeObject:](self, "serializeObject:", v11);
              v12 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:", v11);
              if (!v12)
              {
                v12 = -[TUIKBGraphSerialization dataForObject:](self, "dataForObject:", v11);
                if (!v12)
                  continue;
              }
            }
            objc_msgSend(v5, "appendData:", v12);
          }
          v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v8);
      }
    }
    else
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(a3);
            v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
            v19 = -[TUIKBGraphSerialization _serializedOffsetForObject:](self, "_serializedOffsetForObject:", v18);
            if ((_DWORD)v19 == -1)
            {
              -[TUIKBGraphSerialization serializeObject:](self, "serializeObject:", v18);
              v19 = -[TUIKBGraphSerialization _serializedOffsetForObject:](self, "_serializedOffsetForObject:", v18);
            }
            objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19));
          }
          v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v15);
      }
      v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 13, objc_msgSend(a3, "count"));
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", (int)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "intValue")));
        if ((unint64_t)objc_msgSend(v13, "count") >= 2)
        {
          v20 = 1;
          do
          {
            objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCompressedInt:](self, "dataForCompressedInt:", (int)(objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v20), "intValue")- objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v20 - 1), "intValue"))));
            ++v20;
          }
          while (v20 < objc_msgSend(v13, "count"));
        }
      }
    }
  }
  return v5;
}

- (id)dataForSet:(id)a3
{
  id v5;

  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (v5)
    return v5;
  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 6, 1);
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", objc_msgSend(a3, "allObjects")));
    return v5;
  }
  return -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 6, 0);
}

- (id)sanitizedDictionary:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0DC4D68]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__TUIKBGraphSerialization_sanitizedDictionary___block_invoke;
  v6[3] = &unk_1E24FBF08;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v4;
}

- (id)dataForDictionary:(id)a3
{
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (v5)
    return v5;
  v6 = -[TUIKBGraphSerialization sanitizedDictionary:](self, "sanitizedDictionary:", a3);
  if ((int)objc_msgSend(v6, "count") >= 1)
  {
    v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 7, 1);
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = __Block_byref_object_copy__7947;
    v19 = __Block_byref_object_dispose__7948;
    v20 = 0;
    v20 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__7947;
    v13 = __Block_byref_object_dispose__7948;
    v14 = 0;
    v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__TUIKBGraphSerialization_dataForDictionary___block_invoke;
    v8[3] = &unk_1E24FBF30;
    v8[4] = &v15;
    v8[5] = &v9;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", v16[5]));
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", v10[5]));
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v15, 8);
    return v5;
  }
  return -[TUIKBGraphSerialization mutableDataForObjectType:withSize:](self, "mutableDataForObjectType:withSize:", 7, 0);
}

- (id)dataForUIKBValue:(id)a3
{
  char var1;
  double var0;
  void *v6;
  double v7;
  char v8;
  char v10;
  char v11;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v11 = 0;
  objc_msgSend(v6, "appendBytes:length:", &v11, 1);
  *(float *)&v7 = var0;
  objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v11, v7));
  if (var1 == 100)
    v8 = 15;
  else
    v8 = var1;
  v10 = v8 | (16 * v11);
  objc_msgSend(v6, "replaceBytesInRange:withBytes:", 0, 1, &v10);
  return v6;
}

- (id)dataForGeometry:(id)a3
{
  id v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    v6 = objc_msgSend(a3, "explicitlySpecified");
    if (objc_msgSend(a3, "isTemplate"))
      v7 = v6 | 2;
    else
      v7 = v6;
    v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withFlags:](self, "mutableDataForObjectType:withFlags:", 8, v7);
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "name")));
    v8 = objc_msgSend(a3, "x");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v8, v9));
    v10 = objc_msgSend(a3, "y");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v10, v11));
    v12 = objc_msgSend(a3, "w");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v12, v13));
    v14 = objc_msgSend(a3, "h");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v14, v15));
    v16 = objc_msgSend(a3, "paddingTop");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v16, v17));
    v18 = objc_msgSend(a3, "paddingLeft");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v18, v19));
    v20 = objc_msgSend(a3, "paddingBottom");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v20, v21));
    v22 = objc_msgSend(a3, "paddingRight");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForUIKBValue:](self, "dataForUIKBValue:", v22, v23));
  }
  return v5;
}

- (id)dataForCGRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v14;
  char v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v15 = 0;
  objc_msgSend(v8, "appendBytes:length:", &v15, 1);
  v14 = 0;
  *(float *)&v9 = x;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v9));
  v15 |= v14;
  *(float *)&v10 = y;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v10));
  v15 |= 4 * v14;
  *(float *)&v11 = width;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v11));
  v15 |= 16 * v14;
  *(float *)&v12 = height;
  objc_msgSend(v8, "appendData:", -[TUIKBGraphSerialization dataForCompressedFloat:kind:](self, "dataForCompressedFloat:kind:", &v14, v12));
  v15 |= v14 << 6;
  objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, 1, &v15);
  return v8;
}

- (id)dataForShape:(id)a3
{
  id v5;
  unsigned int v6;

  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    if (objc_msgSend(a3, "geometry"))
    {
      v6 = objc_msgSend((id)objc_msgSend(a3, "geometry"), "usesAutomaticMetrics");
      v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withFlags:](self, "mutableDataForObjectType:withFlags:", 9, v6);
      if (v6)
        objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForGeometry:](self, "dataForGeometry:", objc_msgSend(a3, "geometry")));
    }
    else
    {
      v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withFlags:](self, "mutableDataForObjectType:withFlags:", 9, 0);
    }
    objc_msgSend(a3, "frame");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCGRect:](self, "dataForCGRect:"));
    objc_msgSend(a3, "paddedFrame");
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForCGRect:](self, "dataForCGRect:"));
  }
  return v5;
}

- (id)dataForMergeAction:(id)a3
{
  id v5;
  _BOOL4 v6;
  uint64_t v7;

  v5 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:");
  if (!v5)
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "orderedKeyList"), "count") != 0;
    if (objc_msgSend(a3, "factors"))
      v7 = v6 | 2u;
    else
      v7 = v6;
    v5 = -[TUIKBGraphSerialization mutableDataForObjectType:withFlags:](self, "mutableDataForObjectType:withFlags:", 10, v7);
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "remainingKeyName")));
    objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "disappearingKeyName")));
    if (objc_msgSend((id)objc_msgSend(a3, "orderedKeyList"), "count"))
      objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", objc_msgSend(a3, "orderedKeyList")));
    if (objc_msgSend(a3, "factors"))
      objc_msgSend(v5, "appendData:", -[TUIKBGraphSerialization dataForGeometry:](self, "dataForGeometry:", objc_msgSend(a3, "factors")));
  }
  return v5;
}

- (id)dataForUIKBTree:(id)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  unsigned __int8 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "type") == 9)
    return -[TUIKBGraphSerialization dataForShape:](self, "dataForShape:", objc_msgSend(a3, "shape"));
  if (objc_msgSend(a3, "type") == 10)
    return -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", objc_msgSend(a3, "properties"));
  v6 = -[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:", a3);
  if (!v6)
  {
    if (objc_msgSend(a3, "type") == 1)
    {
      v7 = objc_msgSend((id)objc_msgSend(a3, "properties"), "objectForKey:", CFSTR("Alias"));
      if (v7)
      {
        -[NSMutableDictionary setObject:forKey:](-[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets"), "setObject:forKey:", v7, objc_msgSend(a3, "name"));
        return 0;
      }
    }
    v8 = (void *)objc_msgSend(a3, "properties");
    v9 = (id)objc_msgSend((id)objc_msgSend(a3, "subtrees"), "mutableCopy");
    if (objc_msgSend(a3, "type") == 2)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = (void *)objc_msgSend(a3, "subtrees", 0);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v15, "type") == 10)
            {
              v8 = (void *)objc_msgSend(v15, "properties");
            }
            else if (objc_msgSend(v15, "type") != 14)
            {
              continue;
            }
            objc_msgSend(v9, "removeObject:", v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }
      if (!-[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:", v8))
        -[TUIKBGraphSerialization serializeObject:](self, "serializeObject:", v8);
    }
    v16 = objc_msgSend(a3, "name") != 0;
    if (objc_msgSend(v8, "count"))
      v16 |= 2u;
    if (objc_msgSend(v9, "count"))
      v16 |= 4u;
    v17 = objc_msgSend(a3, "cache");
    v18 = v16 | 8;
    if (!v17)
      v18 = v16;
    v6 = -[TUIKBGraphSerialization mutableDataForObjectType:withFlags:](self, "mutableDataForObjectType:withFlags:", 11, v18);
    objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForInt:](self, "dataForInt:", objc_msgSend(a3, "type")));
    if (objc_msgSend(a3, "name"))
      objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForString:](self, "dataForString:", objc_msgSend(a3, "name")));
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", v8));
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", v9));
    if (objc_msgSend(a3, "cache"))
      objc_msgSend(v6, "appendData:", -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", objc_msgSend(a3, "cache")));
  }
  return v6;
}

- (id)dataForOffsetObject:(id)a3
{
  id v5;

  if (self->_disableOffsets)
    return 0;
  v5 = -[NSMapTable objectForKey:](self->_serializedOffsets, "objectForKey:", a3);
  if (!v5)
    return 0;
  else
    return -[TUIKBGraphSerialization dataForReference:](self, "dataForReference:", objc_msgSend(v5, "intValue"));
}

- (id)dataForObject:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForInt:](self, "dataForInt:", objc_msgSend(a3, "intValue"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForString:](self, "dataForString:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForArray:](self, "dataForArray:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForSet:](self, "dataForSet:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForGeometry:](self, "dataForGeometry:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForShape:](self, "dataForShape:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForMergeAction:](self, "dataForMergeAction:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TUIKBGraphSerialization dataForUIKBTree:](self, "dataForUIKBTree:", a3);
  else
    return 0;
}

- (void)persistData:(id)a3 forObject:(id)a4
{
  NSMutableDictionary *v7;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a4, "type") == 1)
    {
      v7 = -[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets");
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_graphData, "length")), objc_msgSend(a4, "name"));
    }
    -[NSMapTable setObject:forKey:](self->_serializedOffsets, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_graphData, "length")), a4);
    -[NSMutableData appendData:](-[TUIKBGraphSerialization graphData](self, "graphData"), "appendData:", a3);
  }
}

- (int)_serializedOffsetForObject:(id)a3
{
  id v3;

  if (a3 && (v3 = -[NSMapTable objectForKey:](self->_serializedOffsets, "objectForKey:")) != 0)
    return objc_msgSend(v3, "intValue");
  else
    return -1;
}

- (id)_objectAtSerializedOffset:(int)a3
{
  int v4;

  v4 = a3;
  return -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v4);
}

- (void)serializeObject:(id)a3
{
  uint64_t v5;
  id v6;

  if (!self->_disableOffsets)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_referenceCount, "objectForKey:", a3), "integerValue");
      -[NSMutableDictionary setObject:forKey:](self->_referenceCount, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1), a3);
    }
    if (!-[TUIKBGraphSerialization dataForOffsetObject:](self, "dataForOffsetObject:", a3))
    {
      v6 = -[TUIKBGraphSerialization dataForObject:](self, "dataForObject:", a3);
      if (v6)
        -[TUIKBGraphSerialization persistData:forObject:](self, "persistData:forObject:", v6, a3);
    }
    self->_serializedData = 0;
  }
}

- (id)statistics
{
  return self->_referenceCount;
}

- (void)preheatWithStatistics:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "allKeys");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__TUIKBGraphSerialization_preheatWithStatistics___block_invoke;
  v15[3] = &unk_1E24FBF58;
  v15[4] = a3;
  v6 = (void *)objc_msgSend(v5, "sortedArrayUsingComparator:", v15);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v6);
      -[TUIKBGraphSerialization serializeObject:](self, "serializeObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
      if (-[NSData length](self->_graphData, "length") > 0x3FFE)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v8)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (unint64_t)serializedObjectCount
{
  return -[NSMapTable count](self->_serializedOffsets, "count");
}

- (NSData)serializedData
{
  NSData *serializedData;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  serializedData = self->_serializedData;
  if (!serializedData)
  {
    self->_disableOffsets = 1;
    v4 = -[NSDictionary allKeys](self->_keyboardOffsets, "allKeys");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v10 = -[NSDictionary objectForKey:](self->_keyboardOffsets, "objectForKey:", v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = -[NSDictionary objectForKey:](self->_keyboardOffsets, "objectForKey:", v10);
            v12 = -[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets");
            if (v11)
              -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v9);
            else
              -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v9);
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }
    v13 = -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", self->_minEdgeWidths);
    v14 = -[TUIKBGraphSerialization dataForDictionary:](self, "dataForDictionary:", self->_maxEdgeWidths);
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", -[TUIKBGraphSerialization keyboardOffsets](self, "keyboardOffsets"), 200, 0, 0);
    v16 = -[TUIKBGraphSerialization dataForCompressedUInt:](self, "dataForCompressedUInt:", (int)objc_msgSend(v15, "length"));
    self->_disableOffsets = 0;
    serializedData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v14, "length")+ objc_msgSend(v13, "length")+ objc_msgSend(v15, "length")+ objc_msgSend(v16, "length"));
    -[NSData appendData:](serializedData, "appendData:", v13);
    -[NSData appendData:](serializedData, "appendData:", v14);
    -[NSData appendData:](serializedData, "appendData:", v16);
    -[NSData appendData:](serializedData, "appendData:", v15);
    -[NSData appendData:](serializedData, "appendData:", self->_graphData);
    self->_serializedData = serializedData;
  }
  return serializedData;
}

- (unsigned)flagsForOffset:(int *)a3
{
  return -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", a3);
}

- (float)bareFloatForOffset:(int *)a3
{
  char *v4;
  uint64_t v5;

  v4 = -[NSData bytes](self->_graphData, "bytes");
  v5 = *a3;
  *a3 = v5 + 4;
  return *(float *)&v4[v5];
}

- (id)refArrayForOffset:(int *)a3 withCount:(unint64_t)a4
{
  unint64_t v4;
  void *i;
  int v9;

  v4 = a4;
  for (i = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4); v4; --v4)
  {
    v9 = 0;
    v9 = -[TUIKBGraphSerialization compressedUIntForOffset:](self, "compressedUIntForOffset:", a3);
    objc_msgSend(i, "addObject:", -[TUIKBGraphSerialization objectForOffset:](self, "objectForOffset:", &v9));
  }
  return i;
}

- (void)addKeyboardPrefix:(id)a3 forWidth:(float)a4 minEdge:(BOOL)a5
{
  uint64_t v5;

  v5 = 56;
  if (a5)
    v5 = 48;
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "setObject:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
}

- (id)keyboardSuffixForPortraitWidth:(float)a3
{
  const __CFString *v4;

  if (a3 < 320.0)
    return CFSTR("Mini");
  if (a3 < 730.0)
    return CFSTR("Small");
  v4 = CFSTR("Grand");
  if (a3 < 1024.0)
    v4 = CFSTR("Large");
  if (a3 >= 815.0)
    return (id)v4;
  else
    return CFSTR("Medium");
}

- (id)keyboardPrefixForWidth:(float)a3 andEdge:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id result;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = 56;
  if (a4)
    v5 = 48;
  v6 = *(Class *)((char *)&self->super.isa + v5);
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_36);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  result = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
        objc_msgSend(v12, "floatValue");
        if (v13 <= a3)
          return (id)objc_msgSend(v6, "objectForKey:", v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      result = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)setCurrentFileType:(int64_t)a3
{
  self->_currentFileType = a3;
}

uint64_t __58__TUIKBGraphSerialization_keyboardPrefixForWidth_andEdge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;

  objc_msgSend(a2, "floatValue");
  v6 = v5;
  objc_msgSend(a3, "floatValue");
  if (v6 == v7)
    return 0;
  objc_msgSend(a2, "floatValue");
  v10 = v9;
  objc_msgSend(a3, "floatValue");
  if (v10 <= v11)
    return 1;
  else
    return -1;
}

uint64_t __49__TUIKBGraphSerialization_preheatWithStatistics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:"), "compare:", objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2));
  if (!result)
    return objc_msgSend(a2, "compare:", a3);
  return result;
}

uint64_t __45__TUIKBGraphSerialization_dataForDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a3);
}

uint64_t __47__TUIKBGraphSerialization_sanitizedDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = (void *)*MEMORY[0x1E0DC4D80];
  if (objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D80]))
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = visualStyleFromString();
LABEL_7:
    v10 = objc_msgSend(v8, "numberWithUnsignedInt:", v9);
LABEL_8:
    v11 = v10;
    v12 = v7;
    v13 = v6;
    return objc_msgSend(v12, "setObject:forKey:", v11, v13);
  }
  v6 = (void *)*MEMORY[0x1E0DC4D30];
  if (objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D30]))
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = attributeValueFromString();
    goto LABEL_7;
  }
  v6 = (void *)*MEMORY[0x1E0DC4D38];
  if (objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D38]))
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = variantsTypeFromString();
    goto LABEL_7;
  }
  result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D00]);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D08]);
    if ((result & 1) == 0)
    {
      result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D10]);
      if ((result & 1) == 0)
      {
        result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D18]);
        if ((result & 1) == 0)
        {
          result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D20]);
          if ((result & 1) == 0)
          {
            result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D60]);
            if ((result & 1) == 0)
            {
              result = objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D70]);
              if ((result & 1) == 0)
              {
                v6 = (void *)*MEMORY[0x1E0DC4CF8];
                if (objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4CF8]))
                {
                  v7 = *(void **)(a1 + 32);
                  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "integerValue"));
                  goto LABEL_8;
                }
                if (objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0DC4D28]))
                {
                  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0DC4D40]))
                    v15 = 1;
                  else
                    v15 = 2;
                  v16 = *(void **)(a1 + 32);
                  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
                  v12 = v16;
                }
                else
                {
                  objc_opt_class();
                  result = objc_opt_isKindOfClass();
                  if ((result & 1) == 0)
                    return result;
                  result = attributeValueFromString();
                  if (!(_DWORD)result)
                    return result;
                  v17 = *(void **)(a1 + 32);
                  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", attributeValueFromString());
                  v12 = v17;
                }
                v13 = a2;
                return objc_msgSend(v12, "setObject:forKey:", v11, v13);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

+ (id)separatorCharacterSet
{
  if (separatorCharacterSet_once != -1)
    dispatch_once(&separatorCharacterSet_once, &__block_literal_global_7955);
  return (id)separatorCharacterSet_set;
}

id __48__TUIKBGraphSerialization_separatorCharacterSet__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-_"));
  separatorCharacterSet_set = (uint64_t)result;
  return result;
}

@end
