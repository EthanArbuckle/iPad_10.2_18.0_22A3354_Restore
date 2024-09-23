@implementation VFXMeshElement

- (VFXMeshElement)initWithMeshElement:(const void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VFXMeshElement *v10;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  NSArray *v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  unsigned __int16 v37;
  unsigned int v38;
  objc_super v39;

  v39.receiver = a1;
  v39.super_class = (Class)VFXMeshElement;
  v10 = -[VFXMeshElement init](&v39, sel_init);
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&v10->_pointSize = _D0;
  v10->_maximumPointScreenSpaceRadius = 1.0;
  if (a3)
  {
    sub_1B193E768((uint64_t)a3, v10, v4, v5, v6, v7, v8, v9);
    v38 = 0;
    v10->_meshElement = (__CFXMeshElement *)CFRetain(a3);
    v10->_elementData = (NSData *)(id)sub_1B17A4570((uint64_t)a3, &v38);
    v10->_primitiveType = (int)sub_1B17A426C((uint64_t)a3, v16, v17, v18, v19, v20, v21, v22);
    v10->_primitiveCount = sub_1B17A47FC((uint64_t)a3);
    v10->_indicesChannelCount = sub_1B17A47BC((uint64_t)a3);
    v10->_interleavedIndicesChannels = sub_1B17A47C4((uint64_t)a3);
    v37 = 0;
    v23 = sub_1B17A4608((uint64_t)a3, &v37);
    if (v23)
    {
      v24 = v23;
      v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v29 = (NSArray *)objc_msgSend_initWithCapacity_(v25, v26, v37, v27);
      if (v37)
      {
        v30 = 0;
        v31 = (uint64_t *)(v24 + 8);
        do
        {
          v32 = *v31;
          if (*(v31 - 1) == -1)
            v33 = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v28, 0x7FFFFFFFFFFFFFFFLL, v32);
          else
            v33 = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v28, *(v31 - 1), v32);
          objc_msgSend_addObject_(v29, v34, v33, v35);
          ++v30;
          v31 += 2;
        }
        while (v30 < v37);
      }
      v10->_primitiveRanges = v29;
    }
    v10->_bytesPerIndex = v38;
    v10->_pointSize = sub_1B17A47CC((uint64_t)a3);
    v10->_minimumPointScreenSpaceRadius = sub_1B17A47DC((uint64_t)a3);
    v10->_maximumPointScreenSpaceRadius = sub_1B17A47EC((uint64_t)a3);
  }
  return v10;
}

- (VFXMeshElement)init
{
  uint64_t v2;

  return (VFXMeshElement *)objc_msgSend_initWithMeshElement_(self, a2, 0, v2);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXMeshElement *meshElement;
  __CFXMeshElement *v10;
  const char *v11;
  objc_super v12;
  _QWORD v13[5];

  meshElement = self->_meshElement;
  if (meshElement)
  {
    sub_1B193E768((uint64_t)meshElement, 0, v2, v3, v4, v5, v6, v7);
    v10 = self->_meshElement;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B17C8804;
    v13[3] = &unk_1E63D4AB0;
    v13[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v13);
  }

  v12.receiver = self;
  v12.super_class = (Class)VFXMeshElement;
  -[VFXMeshElement dealloc](&v12, sel_dealloc);
}

- (void)enumerateIndexes:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  v6 = objc_msgSend_indexCount(self, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_data(self, v7, v8, v9);
  v14 = objc_msgSend_bytes(v10, v11, v12, v13);
  switch(objc_msgSend_bytesPerIndex(self, v15, v16, v17))
  {
    case 1:
      if (v6)
      {
        for (i = 0; i != v6; ++i)
          (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, i, *(unsigned __int8 *)(v14 + i));
      }
      break;
    case 2:
      if (v6)
      {
        for (j = 0; j != v6; ++j)
          (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, j, *(unsigned __int16 *)(v14 + 2 * j));
      }
      break;
    case 4:
      if (v6)
      {
        for (k = 0; k != v6; ++k)
          (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, k, *(unsigned int *)(v14 + 4 * k));
      }
      break;
    case 8:
      if (v6)
      {
        for (m = 0; m != v6; ++m)
          (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, m, *(_QWORD *)(v14 + 8 * m));
      }
      break;
    default:
      return;
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  unint64_t primitiveType;
  int64_t primitiveCount;
  const __CFString *v13;
  int64_t indicesChannelCount;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v4);
  primitiveType = self->_primitiveType;
  primitiveCount = self->_primitiveCount;
  if (primitiveType > 4)
    v13 = CFSTR("unknown");
  else
    v13 = (const __CFString *)*((_QWORD *)&off_1E63D55F8 + primitiveType);
  indicesChannelCount = self->_indicesChannelCount;
  v15 = sub_1B179EA58(self->_bytesPerIndex, 1, 0, v5, v6, v7, v8, v9);
  v23 = sub_1B179E5A0(v15, v16, v17, v18, v19, v20, v21, v22);
  return (id)objc_msgSend_stringWithFormat_(v3, v24, (uint64_t)CFSTR("<%@: %p | %u x %@, %u channels, %@ indices>"), v25, v10, self, primitiveCount, v13, indicesChannelCount, v23);
}

+ (id)meshElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  const char *v15;

  v9 = a7;
  v14 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithBuffer_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_(v14, v15, (uint64_t)a3, a4, a5, a6, v9, a8);
}

- (VFXMeshElement)initWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  VFXMeshElement *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VFXMeshElement;
  v20 = -[VFXMeshElement init](&v22, sel_init);
  if (v20)
  {
    if (a4 == 4)
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: VFXMeshPrimitiveTypePolygon not supported with MTLBuffers"), v14, v15, v16, v17, v18, v19, (uint64_t)v22.receiver);
    v20->_mtlBuffer = (MTLBuffer *)a3;
    v20->_primitiveType = a4;
    v20->_primitiveCount = a5;
    v20->_indicesChannelCount = a6;
    v20->_interleavedIndicesChannels = a7;
    v20->_bytesPerIndex = a8;
  }
  return v20;
}

- (VFXMeshElement)initWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  VFXMeshElement *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const char *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VFXMeshElement;
  v17 = -[VFXMeshElement init](&v34, sel_init);
  if (!v17)
    return v17;
  if (a4 != 4)
    goto LABEL_21;
  if (objc_msgSend_length(a3, v14, v15, v16) < (unint64_t)(a8 * a5))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. VFXMeshElement initialization - Invalid data length"), v15, v16, v18, v19, v20, v21, (uint64_t)"data.length >= (NSUInteger)(primitiveCount * bytesPerIndex)");
  if (a5 < 1)
  {
LABEL_20:
    v31 = objc_msgSend_length(a3, v14, v15, v16);
    a3 = (id)objc_msgSend_subdataWithRange_(a3, v32, a8 * a5, v31 - a8 * a5);
    a4 = 0;
    goto LABEL_21;
  }
  v22 = 0;
  v23 = 0;
  v24 = 1;
  while (1)
  {
    v25 = objc_msgSend_bytes(a3, v14, v15, v16);
    switch(a8)
    {
      case 4:
        v30 = *(unsigned int *)(v25 + v22);
        break;
      case 2:
        v30 = *(unsigned __int16 *)(v25 + v22);
        break;
      case 1:
        v30 = *(unsigned __int8 *)(v25 + v22);
        break;
      default:
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXMeshElement initialization - Invalid index size (%ld bytes)"), v15, v16, v26, v27, v28, v29, a8);
        goto LABEL_24;
    }
    if (v30 <= 2)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXMeshElement initialization - Invalid polygon edge count (%ld)"), v15, v16, v26, v27, v28, v29, v30);
LABEL_24:

      return 0;
    }
    if (v30 != 3)
      break;
    v24 = ++v23 < a5;
    v22 += a8;
    if (a5 == v23)
      goto LABEL_20;
  }
  if (!v24)
    goto LABEL_20;
  a4 = 4;
LABEL_21:
  v17->_elementData = (NSData *)objc_msgSend_copy(a3, v14, v15, v16);
  v17->_primitiveType = a4;
  v17->_primitiveCount = a5;
  v17->_indicesChannelCount = a6;
  v17->_interleavedIndicesChannels = a7;
  v17->_bytesPerIndex = a8;
  return v17;
}

+ (id)geometryElementWithMeshElementRef:(id *)a3
{
  id *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = sub_1B193E758(a3);
  if (!result)
  {
    v6 = [a1 alloc];
    return (id *)(id)objc_msgSend_initWithMeshElement_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)meshElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  const char *v15;

  v9 = a7;
  v14 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithData_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_(v14, v15, (uint64_t)a3, a4, a5, a6, v9, a8);
}

+ (id)meshElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  id v10;
  const char *v11;

  v10 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithData_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_(v10, v11, (uint64_t)a3, a4, a5, 1, 1, a6);
}

+ (id)meshElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_meshElementWithBuffer_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_, a3, a4);
}

- (NSData)data
{
  uint64_t v2;
  uint64_t v3;
  NSData *result;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  result = self->_elementData;
  if (!result)
  {
    result = (NSData *)self->_mtlBuffer;
    if (result)
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      v7 = objc_msgSend_contents(result, a2, v2, v3);
      v11 = objc_msgSend_length(self->_mtlBuffer, v8, v9, v10);
      return (NSData *)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v6, v12, v7, v11, 0);
    }
  }
  return result;
}

- (void)_printData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_meshElement(self, a2, v2, v3);
  sub_1B17A6658(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (unint64_t)indexCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_meshElement(self, a2, v2, v3);
  return sub_1B17A4304(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (int64_t)primitiveType
{
  return self->_primitiveType;
}

- (int64_t)primitiveCount
{
  return self->_primitiveCount;
}

- (int64_t)indicesChannelCount
{
  return self->_indicesChannelCount;
}

- (BOOL)hasInterleavedIndicesChannels
{
  return self->_interleavedIndicesChannels;
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (_QWORD *)objc_msgSend___CFObject(self, a2, v2, v3);
  return (__CFXWorld *)sub_1B17C6244(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return sub_1B193E758((id *)result);
  return result;
}

- (_NSRange)primitiveRange
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  if (objc_msgSend_count(self->_primitiveRanges, a2, v2, v3) == 1)
  {
    v7 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_primitiveRanges, v5, 0, v6);
    v11 = objc_msgSend_rangeValue(v7, v8, v9, v10);
  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 0;
  }
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)setPrimitiveRange:(_NSRange)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], a2, a3.location, a3.length);
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v8, 1);
  objc_msgSend_setPrimitiveRanges_(self, v6, v5, v7);
}

- (id)primitiveRanges
{
  return self->_primitiveRanges;
}

- (void)setPrimitiveRanges:(id)a3
{
  NSArray *primitiveRanges;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];

  primitiveRanges = self->_primitiveRanges;
  if (primitiveRanges != a3)
  {

    v9 = (NSArray *)objc_msgSend_count(a3, v6, v7, v8);
    if (v9)
      v9 = (NSArray *)objc_msgSend_copy(a3, v10, v11, v12);
    self->_primitiveRanges = v9;
    v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B17C8FE8;
    v15[3] = &unk_1E63D53C8;
    v15[4] = self;
    v15[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, 0, v15);
  }
}

- (float)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_pointSize != a3)
  {
    self->_pointSize = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17C9144;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
  }
}

- (float)minimumPointScreenSpaceRadius
{
  return self->_minimumPointScreenSpaceRadius;
}

- (void)setMinimumPointScreenSpaceRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_minimumPointScreenSpaceRadius != a3)
  {
    self->_minimumPointScreenSpaceRadius = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17C91F4;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
  }
}

- (float)maximumPointScreenSpaceRadius
{
  return self->_maximumPointScreenSpaceRadius;
}

- (void)setMaximumPointScreenSpaceRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_maximumPointScreenSpaceRadius != a3)
  {
    self->_maximumPointScreenSpaceRadius = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17C92A4;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
  }
}

- (int64_t)bytesPerIndex
{
  return self->_bytesPerIndex;
}

- (__CFXMeshElement)meshElement
{
  __CFXMeshElement *result;
  __CFXMeshElement *v4;
  uint64_t v5;
  MTLBuffer *mtlBuffer;
  char primitiveType;
  int64_t primitiveCount;
  _BOOL8 interleavedIndicesChannels;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  result = self->_meshElement;
  if (!result)
  {
    v4 = (__CFXMeshElement *)sub_1B17A39B4();
    self->_meshElement = v4;
    mtlBuffer = self->_mtlBuffer;
    primitiveType = self->_primitiveType;
    primitiveCount = self->_primitiveCount;
    interleavedIndicesChannels = self->_interleavedIndicesChannels;
    if (mtlBuffer)
      sub_1B17A3BAC((uint64_t)v4, primitiveType, primitiveCount, LOBYTE(self->_indicesChannelCount), interleavedIndicesChannels, mtlBuffer, LODWORD(self->_bytesPerIndex), v5);
    else
      sub_1B17A3ABC((uint64_t)v4, primitiveType, primitiveCount, LOBYTE(self->_indicesChannelCount), interleavedIndicesChannels, self->_elementData, LODWORD(self->_bytesPerIndex), v5);
    sub_1B17C8FF4((uint64_t)self->_meshElement, self->_primitiveRanges, v10, v11);
    result = self->_meshElement;
    if (result)
    {
      sub_1B193E768((uint64_t)result, self, v12, v13, v14, v15, v16, v17);
      return self->_meshElement;
    }
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *elementData;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;

  if (self->_elementData)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v8 = (void *)objc_msgSend_options(a3, v5, v6, v7),
          v11 = (void *)objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("VFXWorldExportCompressGeometryElements"), v10), objc_msgSend_BOOLValue(v11, v12, v13, v14)))
    {
      elementData = self->_elementData;
      if (!self->_primitiveType)
        elementData = (void *)objc_msgSend_vfx_indexedDataEncodingTrianglePairsWithBytesPerIndex_(elementData, v5, self->_bytesPerIndex, v15);
      v17 = (void *)objc_msgSend_vfx_indexedDataEncodingHighWatermarkWithBytesPerIndex_(elementData, v5, self->_bytesPerIndex, v15);
      v20 = objc_msgSend_vfx_compressedDataUsingCompressionAlgorithm_(v17, v18, 774, v19);
      objc_msgSend_encodeObject_forKey_(a3, v21, v20, (uint64_t)CFSTR("compressedElementData"));
    }
    else
    {
      objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_elementData, (uint64_t)CFSTR("elementData"));
    }
  }
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_primitiveType, (uint64_t)CFSTR("primitiveType"));
  objc_msgSend_encodeInteger_forKey_(a3, v22, self->_primitiveCount, (uint64_t)CFSTR("primitiveCount"));
  if (objc_msgSend_count(self->_primitiveRanges, v23, v24, v25) == 1)
  {
    v28 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_primitiveRanges, v26, 0, v27);
    v32 = objc_msgSend_rangeValue(v28, v29, v30, v31);
    v34 = (uint64_t)v33;
    objc_msgSend_encodeInteger_forKey_(a3, v33, v32, (uint64_t)CFSTR("primitiveRangeLocation"));
    objc_msgSend_encodeInteger_forKey_(a3, v35, v34, (uint64_t)CFSTR("primitiveRangeLength"));
  }
  objc_msgSend_encodeInteger_forKey_(a3, v26, self->_indicesChannelCount, (uint64_t)CFSTR("indicesChannelCount"));
  objc_msgSend_encodeBool_forKey_(a3, v36, self->_interleavedIndicesChannels, (uint64_t)CFSTR("interleavedIndicesChannels"));
  objc_msgSend_encodeInteger_forKey_(a3, v37, self->_bytesPerIndex, (uint64_t)CFSTR("bytesPerIndex"));
  *(float *)&v38 = self->_pointSize;
  objc_msgSend_encodeFloat_forKey_(a3, v39, (uint64_t)CFSTR("ptSize"), v40, v38);
  *(float *)&v41 = self->_minimumPointScreenSpaceRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v42, (uint64_t)CFSTR("minimumPointScreenSpaceRadius"), v43, v41);
  *(float *)&v44 = self->_maximumPointScreenSpaceRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v45, (uint64_t)CFSTR("maximumPointScreenSpaceRadius"), v46, v44);
}

- (VFXMeshElement)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMeshElement *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  float v34;
  const char *v35;
  uint64_t v36;
  float v37;
  const char *v38;
  uint64_t v39;
  float v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)VFXMeshElement;
  v7 = -[VFXMeshElement init](&v58, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->_primitiveType = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("primitiveType"), v12);
    v7->_primitiveCount = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("primitiveCount"), v14);
    if (objc_msgSend_containsValueForKey_(a3, v15, (uint64_t)CFSTR("primitiveRangeLocation"), v16)
      && objc_msgSend_containsValueForKey_(a3, v17, (uint64_t)CFSTR("primitiveRangeLength"), v18))
    {
      v19 = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("primitiveRangeLocation"), v18);
      v22 = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("primitiveRangeLength"), v21);
      v57 = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v23, v19, v22);
      v24 = objc_alloc(MEMORY[0x1E0C99D20]);
      v7->_primitiveRanges = (NSArray *)objc_msgSend_initWithObjects_count_(v24, v25, (uint64_t)&v57, 1);
    }
    if (objc_msgSend_containsValueForKey_(a3, v17, (uint64_t)CFSTR("indicesChannelCount"), v18)
      && objc_msgSend_containsValueForKey_(a3, v26, (uint64_t)CFSTR("interleavedIndicesChannels"), v27))
    {
      v7->_indicesChannelCount = objc_msgSend_decodeIntegerForKey_(a3, v26, (uint64_t)CFSTR("indicesChannelCount"), v27);
      v7->_interleavedIndicesChannels = objc_msgSend_decodeBoolForKey_(a3, v28, (uint64_t)CFSTR("interleavedIndicesChannels"), v29);
    }
    else
    {
      v7->_indicesChannelCount = 1;
      v7->_interleavedIndicesChannels = 1;
    }
    v7->_bytesPerIndex = objc_msgSend_decodeIntegerForKey_(a3, v26, (uint64_t)CFSTR("bytesPerIndex"), v27);
    if (objc_msgSend_containsValueForKey_(a3, v30, (uint64_t)CFSTR("ptSize"), v31))
    {
      objc_msgSend_decodeFloatForKey_(a3, v32, (uint64_t)CFSTR("pointSize"), v33);
      v7->_pointSize = v34;
      objc_msgSend_decodeFloatForKey_(a3, v35, (uint64_t)CFSTR("minimumPointScreenSpaceRadius"), v36);
      v7->_minimumPointScreenSpaceRadius = v37;
      objc_msgSend_decodeFloatForKey_(a3, v38, (uint64_t)CFSTR("maximumPointScreenSpaceRadius"), v39);
      v7->_maximumPointScreenSpaceRadius = v40;
    }
    v41 = objc_opt_class();
    v43 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, (uint64_t)CFSTR("compressedElementData"));
    if (v43)
    {
      v46 = (void *)objc_msgSend_vfx_uncompressedDataUsingCompressionAlgorithm_(v43, v44, 774, v45);
      v49 = (void *)objc_msgSend_vfx_indexedDataDecodingHighWatermarkWithBytesPerIndex_(v46, v47, v7->_bytesPerIndex, v48);
      if (!v7->_primitiveType)
        v49 = (void *)objc_msgSend_vfx_indexedDataDecodingTrianglePairsWithBytesPerIndex_(v49, v50, v7->_bytesPerIndex, v51);
    }
    else
    {
      v52 = objc_opt_class();
      v49 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v53, v52, (uint64_t)CFSTR("elementData"));
    }
    v7->_elementData = (NSData *)v49;
    objc_msgSend_setImmediateMode_(VFXTransaction, v54, v8, v55);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_optimizedmodelElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  void *v10;
  const char *v11;
  id v12;
  int64_t v13;
  const __CFData *v14;

  if (a4)
  {
    v10 = (void *)objc_opt_class();
    v12 = a3;
    v13 = a4;
  }
  else
  {
    v14 = sub_1B199966C((const __CFData *)a3, a5, a6);
    v10 = (void *)objc_opt_class();
    v12 = v14;
    v13 = 0;
  }
  return (id)objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(v10, v11, (uint64_t)v12, v13, a5, a6);
}

- (void)_optimizeTriangleIndices
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  if (!self->_primitiveType)
  {
    sub_1B1999978((uint64_t)self->_meshElement);
    v10 = 0;
    self->_elementData = (NSData *)(id)sub_1B17A4570((uint64_t)self->_meshElement, &v10);
    self->_primitiveType = (int)sub_1B17A426C((uint64_t)self->_meshElement, v3, v4, v5, v6, v7, v8, v9);
    self->_primitiveCount = sub_1B17A47FC((uint64_t)self->_meshElement);
    self->_bytesPerIndex = v10;
  }
}

- (float)_computeACMR
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1B199927C((uint64_t)self->_meshElement, 0x20uLL, v2, v3, v4, v5, v6, v7);
}

+ (id)modelElementWithMDLSubmesh:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  char v92;
  __int16 v93;
  int v94;
  uint64_t v95;
  const char *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v6 = objc_msgSend_faceIndexing(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_geometryType(a3, v7, v8, v9);
  if (!v6)
  {
    switch(v10)
    {
      case 0:
        goto LABEL_8;
      case 1:
        v22 = (unint64_t)objc_msgSend_indexCount(a3, v11, v12, v13) >> 1;
        v23 = 2;
        break;
      case 2:
        v23 = 0;
        v22 = objc_msgSend_indexCount(a3, v11, v12, v13) / 3uLL;
        break;
      case 3:
        v22 = objc_msgSend_indexCount(a3, v11, v12, v13) - 2;
        v23 = 1;
        break;
      case 4:
        v22 = (unint64_t)objc_msgSend_indexCount(a3, v11, v12, v13) >> 2;
        goto LABEL_13;
      case 5:
        v24 = (void *)objc_msgSend_topology(a3, v11, v12, v13);
        v22 = objc_msgSend_faceCount(v24, v25, v26, v27);
LABEL_13:
        v23 = 4;
        break;
      default:
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: unknown MKGeometryType"), v12, v13, v14, v15, v16, v17, v98);
LABEL_8:
        v22 = objc_msgSend_indexCount(a3, v11, v12, v13);
        v23 = 3;
        break;
    }
    v28 = (unint64_t)objc_msgSend_indexType(a3, v19, v20, v21) >> 3;
    v32 = (void *)objc_msgSend_indexBuffer(a3, v29, v30, v31);
    v36 = (void *)objc_msgSend_map(v32, v33, v34, v35);
    v40 = objc_msgSend_bytes(v36, v37, v38, v39);
    v44 = (void *)objc_msgSend_indexBuffer(a3, v41, v42, v43);
    v48 = objc_msgSend_length(v44, v45, v46, v47);
    if (objc_msgSend_geometryType(a3, v49, v50, v51) == 4)
    {
      v100 = v23;
      v55 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v58 = (void *)objc_msgSend_initWithCapacity_(v55, v56, v48 + v28 * v22, v57);
      objc_msgSend_setLength_(v58, v59, v28 * v22, v60);
      if (v22)
      {
        for (i = 0; i != v22; ++i)
        {
          switch(v28)
          {
            case 1uLL:
              *(_BYTE *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + i) = 4;
              break;
            case 2uLL:
              *(_WORD *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + 2 * i) = 4;
              break;
            case 4uLL:
              *(_DWORD *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + 4 * i) = 4;
              break;
            case 8uLL:
              *(_QWORD *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + 8 * i) = 4;
              break;
            default:
              continue;
          }
        }
      }
      objc_msgSend_appendBytes_length_(v58, v61, v40, v48);
      v65 = v58;
    }
    else
    {
      if (objc_msgSend_geometryType(a3, v52, v53, v54) != 5)
      {
        v97 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v66, v40, v48);
        return (id)objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(a1, v96, (uint64_t)v97, v23, v22, v28);
      }
      v99 = v40;
      v100 = v23;
      v69 = (void *)objc_msgSend_topology(a3, v66, v67, v68);
      v73 = (void *)objc_msgSend_faceTopology(v69, v70, v71, v72);
      v77 = (void *)objc_msgSend_map(v73, v74, v75, v76);
      v81 = objc_msgSend_bytes(v77, v78, v79, v80);
      v82 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v85 = (void *)objc_msgSend_initWithCapacity_(v82, v83, v48 + v28 * v22, v84);
      objc_msgSend_setLength_(v85, v86, v28 * v22, v87);
      if (v22)
      {
        for (j = 0; j != v22; ++j)
        {
          switch(v28)
          {
            case 1uLL:
              v92 = *(_BYTE *)(v81 + j);
              *(_BYTE *)(objc_msgSend_mutableBytes(v85, v88, v89, v90) + j) = v92;
              break;
            case 2uLL:
              v93 = *(unsigned __int8 *)(v81 + j);
              *(_WORD *)(objc_msgSend_mutableBytes(v85, v88, v89, v90) + 2 * j) = v93;
              break;
            case 4uLL:
              v94 = *(unsigned __int8 *)(v81 + j);
              *(_DWORD *)(objc_msgSend_mutableBytes(v85, v88, v89, v90) + 4 * j) = v94;
              break;
            case 8uLL:
              v95 = *(unsigned __int8 *)(v81 + j);
              *(_QWORD *)(objc_msgSend_mutableBytes(v85, v88, v89, v90) + 8 * j) = v95;
              break;
            default:
              continue;
          }
        }
      }
      objc_msgSend_appendBytes_length_(v85, v88, v99, v48);
      v65 = v85;
    }
    v97 = v65;
    v23 = v100;
    return (id)objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(a1, v96, (uint64_t)v97, v23, v22, v28);
  }
  if (v10 == 5)
    return (id)sub_1B1839F10(a3, v11, v12, v13);
  else
    return 0;
}

@end
