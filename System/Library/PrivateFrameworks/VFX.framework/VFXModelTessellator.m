@implementation VFXModelTessellator

- (VFXModelTessellator)init
{
  char *v2;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXModelTessellator;
  v2 = -[VFXModelTessellator init](&v9, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 20) = _Q0;
    *(_OWORD *)(v2 + 40) = xmmword_1B2244C80;
  }
  return (VFXModelTessellator *)v2;
}

- (VFXModelTessellator)initWithCoder:(id)a3
{
  VFXModelTessellator *v4;
  const char *v5;
  uint64_t v6;
  float v7;
  const char *v8;
  uint64_t v9;
  float v10;
  const char *v11;
  uint64_t v12;
  float v13;
  const char *v14;
  uint64_t v15;
  float v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VFXModelTessellator;
  v4 = -[VFXModelTessellator init](&v26, sel_init);
  if (v4)
  {
    v4->_clients = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend_decodeFloatForKey_(a3, v5, (uint64_t)CFSTR("tessellationFactorScale"), v6);
    v4->_tessellationFactorScale = v7;
    objc_msgSend_decodeFloatForKey_(a3, v8, (uint64_t)CFSTR("maximumEdgeLength"), v9);
    v4->_maximumEdgeLength = v10;
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("edgeTessellationFactor"), v12);
    v4->_edgeTessellationFactor = v13;
    objc_msgSend_decodeFloatForKey_(a3, v14, (uint64_t)CFSTR("insideTessellationFactor"), v15);
    v4->_insideTessellationFactor = v16;
    v4->_adaptive = objc_msgSend_decodeBoolForKey_(a3, v17, (uint64_t)CFSTR("adaptive"), v18);
    v4->_screenSpace = objc_msgSend_decodeBoolForKey_(a3, v19, (uint64_t)CFSTR("screenSpace"), v20);
    v4->_partitionMode = objc_msgSend_decodeIntegerForKey_(a3, v21, (uint64_t)CFSTR("tessellationPartitionMode"), v22);
    v4->_smoothingMode = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("smoothingMode"), v24);
  }
  return v4;
}

+ (id)modelTessellator
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  double v4;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;

  *(float *)&v4 = self->_tessellationFactorScale;
  objc_msgSend_encodeFloat_forKey_(a3, a2, (uint64_t)CFSTR("tessellationFactorScale"), v3, v4);
  *(float *)&v7 = self->_maximumEdgeLength;
  objc_msgSend_encodeFloat_forKey_(a3, v8, (uint64_t)CFSTR("maximumEdgeLength"), v9, v7);
  *(float *)&v10 = self->_edgeTessellationFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v11, (uint64_t)CFSTR("edgeTessellationFactor"), v12, v10);
  *(float *)&v13 = self->_insideTessellationFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v14, (uint64_t)CFSTR("insideTessellationFactor"), v15, v13);
  objc_msgSend_encodeBool_forKey_(a3, v16, self->_adaptive, (uint64_t)CFSTR("adaptive"));
  objc_msgSend_encodeBool_forKey_(a3, v17, self->_screenSpace, (uint64_t)CFSTR("screenSpace"));
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_partitionMode, (uint64_t)CFSTR("tessellationPartitionMode"));
  objc_msgSend_encodeInteger_forKey_(a3, v19, self->_smoothingMode, (uint64_t)CFSTR("smoothingMode"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXModelTessellator;
  -[VFXModelTessellator dealloc](&v3, sel_dealloc);
}

- (id)description
{
  _BOOL4 screenSpace;
  void *v4;
  objc_class *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  double maximumEdgeLength;
  void *v11;
  objc_class *v12;
  NSString *v13;
  const char *v14;
  uint64_t v15;

  if (self->_adaptive)
  {
    screenSpace = self->_screenSpace;
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    maximumEdgeLength = self->_maximumEdgeLength;
    if (screenSpace)
      return (id)objc_msgSend_stringWithFormat_(v4, v7, (uint64_t)CFSTR("<%@: %p, screen space (maximum edge length: %.3f px)>"), v8, maximumEdgeLength, v6, self, self->_maximumEdgeLength);
    else
      return (id)objc_msgSend_stringWithFormat_(v4, v7, (uint64_t)CFSTR("<%@: %p, local space (maximum edge length: %.3f)>"), v8, maximumEdgeLength, v6, self, self->_maximumEdgeLength);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    return (id)objc_msgSend_stringWithFormat_(v11, v14, (uint64_t)CFSTR("<%@: %p, uniform (inside: %.3f, edge: %.3f)>"), v15, self->_insideTessellationFactor, v13, self, self->_insideTessellationFactor, self->_edgeTessellationFactor);
  }
}

- (void)addClient:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_addObject_(self->_clients, a2, (uint64_t)a3, v3);
  objc_msgSend_tessellatorValueDidChangeForClient_(self, v6, (uint64_t)a3, v7);
}

- (void)removeClient:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[5];

  v6 = objc_msgSend_geometryRef(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_worldRef(a3, v7, v8, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B1793A9C;
  v14[3] = &unk_1E63D4AB0;
  v14[4] = v6;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)a3, v14);
  objc_msgSend_removeObject_(self->_clients, v12, (uint64_t)a3, v13);
}

- (void)clientWillDie:(id)a3
{
  uint64_t v3;

  objc_msgSend_removeObject_(self->_clients, a2, (uint64_t)a3, v3);
}

- (void)tessellatorValueDidChange
{
  NSMutableSet *clients;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  clients = self->_clients;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(clients, a2, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(clients);
        objc_msgSend_tessellatorValueDidChangeForClient_(self, v5, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), v6);
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(clients, v5, (uint64_t)&v10, (uint64_t)v14, 16);
    }
    while (v7);
  }
}

- ($B3497AEC183BF984E87C521FCF53B341)_tessellatorValueForGeometry:(SEL)a3
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  $B3497AEC183BF984E87C521FCF53B341 *result;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  v7 = (void *)objc_msgSend_tessellator(a4, a3, (uint64_t)a4, v4);
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0;
  *(_QWORD *)&retstr->var0 = 0;
  if (objc_msgSend_subdivisionLevel(a4, v8, v9, v10))
  {
    v14 = 4;
  }
  else if (objc_msgSend_isAdaptive(v7, v11, v12, v13))
  {
    if (objc_msgSend_isScreenSpace(v7, v11, v12, v13))
      v14 = 2;
    else
      v14 = 3;
  }
  else
  {
    v14 = 1;
  }
  retstr->var0 = v14;
  objc_msgSend_tessellationFactorScale(v7, v11, v12, v13);
  if (v18 < 0.001)
    v18 = 0.001;
  retstr->var1 = v18;
  retstr->var2 = objc_msgSend_tessellationPartitionMode(v7, v15, v16, v17);
  result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_smoothingMode(v7, v19, v20, v21);
  retstr->var3 = result;
  switch(v14)
  {
    case 1u:
      objc_msgSend_edgeTessellationFactor(v7, v23, v24, v25);
      retstr->var4.var0.var0 = v27;
      result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_insideTessellationFactor(v7, v28, v29, v30);
      retstr->var4.var0.var1 = v31;
      break;
    case 2u:
    case 3u:
      result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_maximumEdgeLength(v7, v23, v24, v25);
      retstr->var4.var0.var0 = v26;
      break;
    case 4u:
      objc_msgSend_tessellationFactorScale(v7, v23, v24, v25);
      retstr->var4.var3.var0 = (int)v32;
      BYTE1(retstr->var4.var0.var0) = 1;
      result = ($B3497AEC183BF984E87C521FCF53B341 *)objc_msgSend_isScreenSpace(v7, v33, v34, v35);
      if ((_DWORD)result)
        v36 = 3;
      else
        v36 = 1;
      BYTE1(retstr->var4.var0.var0) = v36;
      break;
    default:
      return result;
  }
  return result;
}

- (void)tessellatorValueDidChangeForClient:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = 0uLL;
  v11 = 0;
  if (self)
    objc_msgSend__tessellatorValueForGeometry_(self, a2, (uint64_t)a3, v3);
  v5 = objc_msgSend_worldRef(a3, a2, (uint64_t)a3, v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B1793D8C;
  v7[3] = &unk_1E63D4AD8;
  v7[4] = a3;
  v8 = v10;
  v9 = v11;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)a3, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_tessellationFactorScale(self, v5, v6, v7);
  v4[8] = v8;
  objc_msgSend_maximumEdgeLength(self, v9, v10, v11);
  v4[5] = v12;
  objc_msgSend_edgeTessellationFactor(self, v13, v14, v15);
  v4[6] = v16;
  objc_msgSend_insideTessellationFactor(self, v17, v18, v19);
  v4[7] = v20;
  *((_BYTE *)v4 + 16) = objc_msgSend_isAdaptive(self, v21, v22, v23);
  *((_BYTE *)v4 + 17) = objc_msgSend_isScreenSpace(self, v24, v25, v26);
  *((_QWORD *)v4 + 5) = objc_msgSend_smoothingMode(self, v27, v28, v29);
  return v4;
}

- (int64_t)smoothingMode
{
  return self->_smoothingMode;
}

- (void)setSmoothingMode:(int64_t)a3
{
  if (self->_smoothingMode != a3)
  {
    self->_smoothingMode = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (void)setAdaptive:(BOOL)a3
{
  if (self->_adaptive != a3)
  {
    self->_adaptive = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (BOOL)isScreenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)a3
{
  if (self->_screenSpace != a3)
  {
    self->_screenSpace = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (float)tessellationFactorScale
{
  return self->_tessellationFactorScale;
}

- (void)setTessellationFactorScale:(float)a3
{
  if (self->_tessellationFactorScale != a3)
  {
    self->_tessellationFactorScale = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (float)edgeTessellationFactor
{
  return self->_edgeTessellationFactor;
}

- (void)setEdgeTessellationFactor:(float)a3
{
  if (self->_edgeTessellationFactor != a3)
  {
    self->_edgeTessellationFactor = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (float)insideTessellationFactor
{
  return self->_insideTessellationFactor;
}

- (void)setInsideTessellationFactor:(float)a3
{
  if (self->_insideTessellationFactor != a3)
  {
    self->_insideTessellationFactor = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (float)maximumEdgeLength
{
  return self->_maximumEdgeLength;
}

- (void)setMaximumEdgeLength:(float)a3
{
  if (self->_maximumEdgeLength != a3)
  {
    self->_maximumEdgeLength = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

- (unint64_t)tessellationPartitionMode
{
  return self->_partitionMode;
}

- (void)setTessellationPartitionMode:(unint64_t)a3
{
  if (self->_partitionMode != a3)
  {
    self->_partitionMode = a3;
    MEMORY[0x1E0DE7D20]();
  }
}

@end
