@implementation VFXHitTestResult

- (VFXHitTestResult)initWithResult:(__CFXHitTestResult *)a3
{
  VFXHitTestResult *v3;
  objc_super v6;

  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)VFXHitTestResult;
    v3 = -[VFXHitTestResult init](&v6, sel_init);
    if (v3)
      v3->_result = (__CFXHitTestResult *)CFRetain(a3);
  }
  return v3;
}

- (void)dealloc
{
  __CFXHitTestResult *result;
  objc_super v4;

  result = self->_result;
  if (result)
  {
    CFRelease(result);
    self->_result = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXHitTestResult;
  -[VFXHitTestResult dealloc](&v4, sel_dealloc);
}

- (VFXNode)node
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXNode *result;
  const char *v9;
  uint64_t v10;

  result = (VFXNode *)sub_1B17A7D10((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXNode *)objc_msgSend_nodeWithNodeRef_(VFXNode, v9, (uint64_t)result, v10);
  return result;
}

- (VFXNode)boneNode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXNode *result;
  const char *v9;
  uint64_t v10;

  result = (VFXNode *)sub_1B17A7D58((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXNode *)objc_msgSend_nodeWithNodeRef_(VFXNode, v9, (uint64_t)result, v10);
  return result;
}

- (int64_t)geometryIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1B17A7E18((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int64_t)faceIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1B17A7E60((uint64_t)self->_result, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (CGPoint)textureCoordinatesWithMappingChannel:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float64x2_t v8;
  double v9;
  CGPoint result;

  v8 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(sub_1B17A8078((uint64_t)self->_result, a3, a3, v3, v4, v5, v6, v7)));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (CGPoint)textureCoordinate
{
  const char *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGPoint result;

  NSLog(CFSTR("textureCoordinate is deprecated - use textureCoordinateWithMappingChannel instead"), a2);
  objc_msgSend_textureCoordinatesWithMappingChannel_(self, v3, 0, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

+ (id)hitTestResultsFromHitTestResultRef:(__CFArray *)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  VFXHitTestResult *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v5 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v6, v5, v7);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v12 = objc_msgSend_objectAtIndex_(a3, v8, i, v9);
      v13 = [VFXHitTestResult alloc];
      v16 = (void *)objc_msgSend_initWithResult_(v13, v14, v12, v15);
      objc_msgSend_addObject_(v10, v17, (uint64_t)v16, v18);

    }
  }
  return v10;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  __int128 v24;

  objc_msgSend_worldCoordinates(self, a2, v2, v3);
  v24 = v5;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v12 = objc_msgSend_geometryIndex(self, v9, v10, v11);
  v16 = objc_msgSend_node(self, v13, v14, v15);
  v20 = objc_msgSend_boneNode(self, v17, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v6, v21, (uint64_t)CFSTR("<%@: %p <%f,%f,%f> | geometryIndex=%d node=%@ bone=%@>"), v22, v8, self, *(float *)&v24, *((float *)&v24 + 1), *((float *)&v24 + 2), v12, v16, v20);
}

- (double)localCoordinates
{
  __int128 *v8;
  __int128 v9;

  v8 = (__int128 *)sub_1B17A7EA8(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  if (v8)
    v9 = *v8;
  else
    *(_QWORD *)&v9 = 0;
  return *(double *)&v9;
}

- (double)worldCoordinates
{
  __int128 *v8;
  __int128 v9;

  v8 = (__int128 *)sub_1B17A7EF0(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  if (v8)
    v9 = *v8;
  else
    *(_QWORD *)&v9 = 0;
  return *(double *)&v9;
}

- (double)localNormal
{
  __int128 *v8;
  __int128 v9;

  v8 = (__int128 *)sub_1B17A7F38(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  if (v8)
    v9 = *v8;
  else
    *(_QWORD *)&v9 = 0;
  return *(double *)&v9;
}

- (double)worldNormal
{
  return sub_1B17A7F80(*(float32x4_t **)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
}

- (__n128)modelTransform
{
  uint64_t v8;
  uint64_t v9;

  v8 = sub_1B17A8030(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7, a8);
  v9 = MEMORY[0x1E0C83FF0];
  if (v8)
    v9 = v8;
  return *(__n128 *)v9;
}

@end
