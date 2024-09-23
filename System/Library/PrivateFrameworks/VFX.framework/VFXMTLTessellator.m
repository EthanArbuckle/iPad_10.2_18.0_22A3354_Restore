@implementation VFXMTLTessellator

- (VFXMTLTessellator)initWithGeometry:(__CFXGeometry *)a3 resourceManager:(id)a4
{
  VFXMTLTessellator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXMTLTessellator;
  result = -[VFXMTLTessellator init](&v7, sel_init);
  if (result)
  {
    result->_geometry = a3;
    result->_resourceManager = (VFXMTLResourceManager *)a4;
    *(_QWORD *)&result->_cachedTessellator.tessellationPartitionMode = 0;
    result->_cachedTessellator.parameters = 0;
    *(_QWORD *)&result->_cachedTessellator.type = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLTessellator;
  -[VFXMTLTessellator dealloc](&v3, sel_dealloc);
}

- ($7A7BD8EC73F1DE0C75AE87F164959927)_pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  int type;
  unsigned int tessellationPartitionMode;
  char *v8;
  $7A7BD8EC73F1DE0C75AE87F164959927 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  type = self->_cachedTessellator.type;
  if ((type - 1) < 3)
  {
    tessellationPartitionMode = self->_cachedTessellator.tessellationPartitionMode;
LABEL_5:
    v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(tessellationPartitionMode & 3);
    goto LABEL_7;
  }
  if (type == 4)
  {
    v8 = sub_1B195BC3C((uint64_t)self->_geometry, 0, 0);
    LOBYTE(tessellationPartitionMode) = sub_1B1958B5C((uint64_t)v8);
    type = self->_cachedTessellator.type;
    goto LABEL_5;
  }
  v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)1;
LABEL_7:
  if (type == 4)
  {
    sub_1B195BC3C((uint64_t)self->_geometry, 0, 0);
    v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFF3 | (4 * (sub_1B179FDD8() & 3)));
    type = self->_cachedTessellator.type;
  }
  else if (type == 3)
  {
    v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 4);
    goto LABEL_12;
  }
  if ((type - 1) < 3)
  {
LABEL_12:
    v10 = sub_1B1955D00((uint64_t)a3);
    if (v10 == 1)
    {
      v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x20);
    }
    else if (v10)
    {
      v11 = sub_1B1955D00((uint64_t)a3);
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown index type %d"), v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x10);
    }
    goto LABEL_21;
  }
  if (type != 4)
  {
    if (!type)
      return v9;
    goto LABEL_22;
  }
  sub_1B195BC3C((uint64_t)self->_geometry, 0, 0);
  v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFCF | (16 * (sub_1B1958B68() & 3)));
LABEL_21:
  type = self->_cachedTessellator.type;
LABEL_22:
  if ((type - 1) < 3)
    return ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | ((self->_cachedTessellator.tessellationFactorScale != 1.0) << 6));
  return v9;
}

- (unsigned)pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4)
    return 0;
  else
    return objc_msgSend__pipelineStateHashForMeshElement_patchType_(self, a2, (uint64_t)a3, a4);
}

- (id)newPipelineStateConfiguratorForMeshElement:(id)a3 patchType:(unsigned __int8)a4 device:(id)a5
{
  char v7;
  _QWORD v9[5];
  char v10;

  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4)
    return 0;
  v7 = objc_msgSend__pipelineStateHashForMeshElement_patchType_(self, a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B17C69B8;
  v9[3] = &unk_1E63D5578;
  v10 = v7;
  v9[4] = a5;
  return _Block_copy(v9);
}

- (void)update:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  __n128 v22;
  $BF99454ECFE41BE5C1604073DE609D0A v23;
  _OWORD v24[2];
  __n128 v25;
  $BF99454ECFE41BE5C1604073DE609D0A v26;
  _OWORD v27[2];
  __n128 v28;
  $BF99454ECFE41BE5C1604073DE609D0A v29;
  __n128 v30;
  $BF99454ECFE41BE5C1604073DE609D0A v31;
  __n128 v32;
  $BF99454ECFE41BE5C1604073DE609D0A v33;

  v32 = 0uLL;
  v33 = 0;
  sub_1B17A28EC((__n128 *)self->_geometry, (uint64_t)a3, v3, v4, v5, v6, v7, &v32);
  v17 = v32.n128_u8[0];
  if (v32.n128_u8[0] != self->_cachedTessellator.type)
  {

    self->_tessellationFactorBuffer = 0;
    v17 = v32.n128_u8[0];
  }
  switch(v17)
  {
    case 0:
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: A tessellator object should not exist when no tessellation is required"), v11, v12, v13, v14, v15, v16, *(uint64_t *)&v21[0]);
      break;
    case 1:
      v30 = v32;
      v31 = v33;
      objc_msgSend_updateUniformTessellator_(self, v10, (uint64_t)&v30, v12);
      break;
    case 2:
      v28 = v32;
      v29 = v33;
      v18 = *(_OWORD *)&a3->var2;
      v27[0] = *(_OWORD *)&a3->var0;
      v27[1] = v18;
      objc_msgSend_updateScreenSpaceAdaptiveTessellator_parameters_(self, v10, (uint64_t)&v28, (uint64_t)v27);
      break;
    case 3:
      v26 = v33;
      v19 = *(_OWORD *)&a3->var2;
      v24[0] = *(_OWORD *)&a3->var0;
      v24[1] = v19;
      v25 = v32;
      objc_msgSend_updateConstrainedEdgeLengthTessellator_parameters_(self, v10, (uint64_t)&v25, (uint64_t)v24);
      break;
    case 4:
      v23 = v33;
      v20 = *(_OWORD *)&a3->var2;
      v21[0] = *(_OWORD *)&a3->var0;
      v21[1] = v20;
      v22 = v32;
      objc_msgSend_updateSubdivisionSurfaceTessellator_parameters_(self, v10, (uint64_t)&v22, (uint64_t)v21);
      break;
    default:
      break;
  }
  *(__n128 *)&self->_cachedTessellator.type = v32;
  self->_cachedTessellator.parameters = v33;
}

- (void)draw:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  _OWORD v19[3];
  uint64_t v20;
  __n128 v21;
  uint64_t v22;

  v21 = 0uLL;
  v22 = 0;
  *(_QWORD *)&v17 = sub_1B17A28EC((__n128 *)self->_geometry, (uint64_t)a3, v3, v4, v5, v6, v7, &v21).n128_u64[0];
  switch(v21.n128_u8[0])
  {
    case 0u:
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: A tessellator object should not exist when no tessellation is required"), v11, v12, v13, v14, v15, v16, *(uint64_t *)&v19[0]);
      goto LABEL_3;
    case 1u:
LABEL_3:
      objc_msgSend_uniformTessellationDrawMeshElement_forMesh_instanceCount_renderContext_(self, v10, (uint64_t)a3->var3, (uint64_t)a3->var1, a3->var4, a3->var5, v17);
      break;
    case 2u:
      objc_msgSend_screenSpaceAdaptiveTessellationDrawMeshElement_forMesh_instanceCount_renderContext_(self, v10, (uint64_t)a3->var3, (uint64_t)a3->var1, a3->var4, a3->var5, v17);
      break;
    case 3u:
      objc_msgSend_constrainedEdgeLengthTessellationDrawMeshElement_forMesh_instanceCount_renderContext_(self, v10, (uint64_t)a3->var3, (uint64_t)a3->var1, a3->var4, a3->var5, v17);
      break;
    case 4u:
      v18 = *(_OWORD *)&a3->var2;
      v19[0] = *(_OWORD *)&a3->var0;
      v19[1] = v18;
      v19[2] = *(_OWORD *)&a3->var4;
      v20 = *(_QWORD *)&a3->var6;
      objc_msgSend_subdivisionSurfaceTessellationDraw_(self, v10, (uint64_t)v19, v12);
      break;
    default:
      return;
  }
}

- (void)updateUniformTessellator:(id *)a3
{
  uint64_t v3;
  float var0;
  float var1;
  int v7;
  unsigned int v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  int v20;
  MTLBuffer *tessellationFactorBuffer;
  void *v22;
  const char *v23;
  uint64_t v24;

  var0 = a3->var4.var0.var0;
  var1 = a3->var4.var0.var1;
  v7 = HIWORD(LODWORD(var0)) & 0x8000;
  v8 = (LODWORD(var0) >> 23);
  v9 = v8 - 112;
  v10 = v7 | 0x7BFF;
  if (v8 == 255)
    v10 = v7 | ((LODWORD(var0) & 0x7FFFFF) != 0) | 0x7C00;
  v11 = v8 - 113;
  if (v8 >= 0x71)
    LOWORD(v12) = v10;
  else
    v12 = HIWORD(LODWORD(var0)) & 0x8000;
  v13 = HIWORD(LODWORD(var0)) & 0x8000 | (LODWORD(var0) >> 13) & 0x3FF | (v9 << 10);
  if (v11 > 0x1D)
    LOWORD(v13) = v12;
  WORD2(v24) = v13;
  WORD1(v24) = v13;
  LOWORD(v24) = v13;
  v14 = HIWORD(LODWORD(var1)) & 0x8000;
  v15 = (LODWORD(var1) >> 23);
  v16 = v15 - 112;
  v17 = v15 - 113;
  v18 = v14 | 0x7BFF;
  if (v15 == 255)
    v18 = v14 | ((LODWORD(var1) & 0x7FFFFF) != 0) | 0x7C00;
  if (v15 >= 0x71)
    LOWORD(v19) = v18;
  else
    v19 = HIWORD(LODWORD(var1)) & 0x8000;
  v20 = HIWORD(LODWORD(var1)) & 0x8000 | (LODWORD(var1) >> 13) & 0x3FF | (v16 << 10);
  if (v17 > 0x1D)
    LOWORD(v20) = v19;
  HIWORD(v24) = v20;
  tessellationFactorBuffer = self->_tessellationFactorBuffer;
  if (tessellationFactorBuffer)
  {
    if (*(_QWORD *)&a3->var4 != *(_QWORD *)&self->_cachedTessellator.parameters)
      *(_QWORD *)objc_msgSend_contents(tessellationFactorBuffer, a2, (uint64_t)a3, v3) = v24;
  }
  else
  {
    v22 = (void *)sub_1B18FD774((uint64_t)self->_resourceManager);
    self->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v22, v23, (uint64_t)&v24, 8, 0);
  }
}

- (void)uniformTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;

  v10 = objc_msgSend_renderEncoder(a6, a2, (uint64_t)a3, (uint64_t)a4);
  *(float *)&v11 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend_setTessellationFactorScale_(*(void **)(v10 + 16), v12, v13, v14, v11);
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(*(void **)(v10 + 16), v15, (uint64_t)self->_tessellationFactorBuffer, 0, 0);
  objc_msgSend__drawPatchForMeshElement_instanceCount_(a6, v16, (uint64_t)a3, a5);
}

- (void)updateScreenSpaceAdaptiveTessellator:(id *)a3 parameters:(id *)a4
{
  id var0;
  void **v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *EncoderAndResetCache;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const __CFString *v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  __n128 *v90;
  __n128 v91;
  float v92;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  id obj;
  int64x2_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  VFXMTLTessellator *v124;
  unint64_t v125;
  int64x2_t v126;
  unint64_t v127;
  int64x2_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  var0 = a4->var0;
  v6 = (void **)objc_msgSend_resourceComputeEncoder(a4->var1, a2, (uint64_t)a3, (uint64_t)a4);
  EncoderAndResetCache = (void *)objc_msgSend_getEncoderAndResetCache(*v6, v7, v8, v9);
  v124 = self;
  if (!self->_tessellationFactorBuffer)
  {
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v11 = (void *)sub_1B1955D00((uint64_t)var0);
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v147, (uint64_t)v152, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v148;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v148 != v16)
            objc_enumerationMutation(v11);
          v15 += sub_1B195606C(*(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * i));
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v18, (uint64_t)&v147, (uint64_t)v152, 16);
      }
      while (v14);
      v19 = 24 * v15;
    }
    else
    {
      v19 = 0;
    }
    v20 = (void *)sub_1B18FD774((uint64_t)v124->_resourceManager);
    v124->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v20, v21, v19, 32);
  }
  v22 = (void *)sub_1B18FD780((uint64_t)var0);
  v26 = (void *)objc_msgSend_attributes(v22, v23, v24, v25);
  v29 = (void *)objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0, v28);
  v33 = (void *)objc_msgSend_layouts(v22, v30, v31, v32);
  v116 = v29;
  v37 = objc_msgSend_bufferIndex(v29, v34, v35, v36);
  v115 = (void *)objc_msgSend_objectAtIndexedSubscript_(v33, v38, v37, v39);
  objc_msgSend_pushDebugGroup_(EncoderAndResetCache, v40, (uint64_t)CFSTR("Compute VFXModelScreenSpaceAdaptiveTessellator tessellation factors"), v41);
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v117 = (uint64_t)var0;
  obj = (id)sub_1B1955D00((uint64_t)var0);
  v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v143, (uint64_t)v151, 16);
  if (v120)
  {
    v46 = 0;
    v113 = *(_QWORD *)v144;
    v114 = EncoderAndResetCache;
    v112 = vdupq_n_s64(1uLL);
    do
    {
      for (j = 0; j != v120; ++j)
      {
        if (*(_QWORD *)v144 != v113)
          objc_enumerationMutation(obj);
        v48 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * j);
        v49 = sub_1B1955D00(v48);
        if (v49)
        {
          if (v49 == 1)
          {
            v52 = CFSTR("compute_tessellation_factors_screeenspace_adaptive_uint32");
          }
          else
          {
            v53 = sub_1B1955D00(v48);
            sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown index type %d"), v54, v55, v56, v57, v58, v59, v53);
            v52 = &stru_1E63FD500;
          }
        }
        else
        {
          v52 = CFSTR("compute_tessellation_factors_screeenspace_adaptive_uint16");
        }
        v60 = objc_msgSend_computePipelineStateForKernel_(v124->_resourceManager, v50, (uint64_t)v52, v51);
        v61 = (void *)sub_1B18FD774(v60);
        v62 = sub_1B195606C(v48);
        v63 = (void *)sub_1B1956188(v48);
        v123 = objc_msgSend_buffer(v63, v64, v65, v66);
        v67 = (void *)sub_1B1956188(v48);
        v71 = objc_msgSend_offset(v67, v68, v69, v70);
        v122 = sub_1B18FD768(v48) + v71;
        v72 = (void *)sub_1B1955CE0(v117);
        v76 = objc_msgSend_bufferIndex(v116, v73, v74, v75);
        v121 = objc_msgSend_objectAtIndexedSubscript_(v72, v77, v76 - 18, v78);
        v82 = objc_msgSend_stride(v115, v79, v80, v81);
        v86 = objc_msgSend_threadExecutionWidth(v61, v83, v84, v85);
        v90 = (__n128 *)objc_msgSend_engineContext(a4->var1, v87, v88, v89);
        v91 = sub_1B1815A98(v90);
        v92 = a3->var4.var0.var0;
        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        v91.n128_f32[0] = v91.n128_f32[3] / v92;
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        LODWORD(v129) = v62;
        BYTE4(v129) = v82;
        var2 = a4->var2;
        v94 = *(_OWORD *)var2;
        v95 = *((_OWORD *)var2 + 1);
        v96 = *((_OWORD *)var2 + 3);
        v132 = *((_OWORD *)var2 + 2);
        v133 = v96;
        v130 = v94;
        v131 = v95;
        v97 = *((_OWORD *)var2 + 4);
        v98 = *((_OWORD *)var2 + 5);
        v99 = *((_OWORD *)var2 + 7);
        v136 = *((_OWORD *)var2 + 6);
        v137 = v99;
        v134 = v97;
        v135 = v98;
        v100 = *((_OWORD *)var2 + 8);
        v101 = *((_OWORD *)var2 + 9);
        v102 = *((_OWORD *)var2 + 11);
        v140 = *((_OWORD *)var2 + 10);
        v141 = v102;
        v138 = v100;
        v139 = v101;
        LODWORD(v142) = v91.n128_u32[0];
        EncoderAndResetCache = v114;
        objc_msgSend_setComputePipelineState_(v114, v103, (uint64_t)v61, v104);
        objc_msgSend_setBuffer_offset_atIndex_(v114, v105, (uint64_t)v124->_tessellationFactorBuffer, 24 * v46, 0);
        objc_msgSend_setBuffer_offset_atIndex_(v114, v106, v123, v122, 1);
        objc_msgSend_setBuffer_offset_atIndex_(v114, v107, v121, 0, 2);
        objc_msgSend_setBytes_length_atIndex_(v114, v108, (uint64_t)&v129, 224, 3);
        v127 = (v62 + v86 - 1) / v86;
        v128 = v112;
        v125 = v86;
        v126 = v112;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v114, v109, (uint64_t)&v127, (uint64_t)&v125);
        v46 += v62;
      }
      v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v110, (uint64_t)&v143, (uint64_t)v151, 16);
    }
    while (v120);
  }
  objc_msgSend_popDebugGroup(EncoderAndResetCache, v43, v44, v45);
}

- (void)screenSpaceAdaptiveTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (void *)sub_1B1955D00((uint64_t)a4);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v12)
  {
    v16 = v12;
    v17 = 0;
    v18 = *(_QWORD *)v29;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v18)
        objc_enumerationMutation(v10);
      v20 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v19);
      if (v20 == a3)
        break;
      v17 += sub_1B195606C((uint64_t)v20);
      if (v16 == ++v19)
      {
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v17 = 0;
  }
  v21 = objc_msgSend_renderEncoder(a6, v13, v14, v15, (_QWORD)v28);
  *(float *)&v22 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend_setTessellationFactorScale_(*(void **)(v21 + 16), v23, v24, v25, v22);
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(*(void **)(v21 + 16), v26, (uint64_t)self->_tessellationFactorBuffer, 24 * v17, 0);
  objc_msgSend__drawPatchForMeshElement_instanceCount_(a6, v27, (uint64_t)a3, a5);
}

- (void)updateConstrainedEdgeLengthTessellator:(id *)a3 parameters:(id *)a4
{
  id var0;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  void *v15;
  const char *v16;
  void **v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *EncoderAndResetCache;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  id obj;
  int64x2_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  VFXMTLTessellator *v103;
  $B3497AEC183BF984E87C521FCF53B341 *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  int64x2_t v110;
  unint64_t v111;
  int64x2_t v112;
  _DWORD v113[3];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  var0 = a4->var0;
  if (self->_tessellationFactorBuffer)
  {
    if (a3->var4.var0.var0 == self->_cachedTessellator.parameters.uniform.edgeTessellationFactor)
      return;
  }
  else
  {
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v8 = (void *)sub_1B1955D00((uint64_t)var0);
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v118, (uint64_t)v123, 16);
    if (v10)
    {
      v11 = 0;
      v12 = *(_QWORD *)v119;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v119 != v12)
            objc_enumerationMutation(v8);
          v11 += sub_1B195606C(*(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i));
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v118, (uint64_t)v123, 16);
      }
      while (v10);
      v10 = 24 * v11;
    }
    v15 = (void *)sub_1B18FD774((uint64_t)self->_resourceManager);
    self->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v15, v16, v10, 32);
  }
  v103 = self;
  v104 = a3;
  v17 = (void **)objc_msgSend_resourceComputeEncoder(a4->var1, a2, (uint64_t)a3, (uint64_t)a4);
  EncoderAndResetCache = (void *)objc_msgSend_getEncoderAndResetCache(*v17, v18, v19, v20);
  v22 = (void *)sub_1B18FD780((uint64_t)var0);
  v26 = (void *)objc_msgSend_attributes(v22, v23, v24, v25);
  v29 = (void *)objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0, v28);
  v33 = (void *)objc_msgSend_layouts(v22, v30, v31, v32);
  v101 = v29;
  v37 = objc_msgSend_bufferIndex(v29, v34, v35, v36);
  v100 = (void *)objc_msgSend_objectAtIndexedSubscript_(v33, v38, v37, v39);
  v105 = EncoderAndResetCache;
  objc_msgSend_pushDebugGroup_(EncoderAndResetCache, v40, (uint64_t)CFSTR("Compute kCFXGeometryTessellatorTypeConstrainedEdgeLength tessellation factors"), v41);
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v102 = (uint64_t)var0;
  obj = (id)sub_1B1955D00((uint64_t)var0);
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v114, (uint64_t)v122, 16);
  if (v106)
  {
    v46 = 0;
    v99 = *(_QWORD *)v115;
    v98 = vdupq_n_s64(1uLL);
    do
    {
      for (j = 0; j != v106; ++j)
      {
        if (*(_QWORD *)v115 != v99)
          objc_enumerationMutation(obj);
        v48 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
        v49 = sub_1B1955D00(v48);
        if (v49)
        {
          if (v49 == 1)
          {
            v52 = objc_msgSend_computePipelineStateForKernel_(v103->_resourceManager, v50, (uint64_t)CFSTR("compute_tessellation_factors_constrained_edge_uint32"), v51);
          }
          else
          {
            v53 = sub_1B1955D00(v48);
            sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown index type %d"), v54, v55, v56, v57, v58, v59, v53);
            v52 = objc_msgSend_computePipelineStateForKernel_(v103->_resourceManager, v60, (uint64_t)&stru_1E63FD500, v61);
          }
        }
        else
        {
          v52 = objc_msgSend_computePipelineStateForKernel_(v103->_resourceManager, v50, (uint64_t)CFSTR("compute_tessellation_factors_constrained_edge_uint16"), v51);
        }
        v62 = (void *)sub_1B18FD774(v52);
        v63 = sub_1B195606C(v48);
        v64 = (void *)sub_1B1956188(v48);
        v108 = objc_msgSend_buffer(v64, v65, v66, v67);
        v68 = (void *)sub_1B1956188(v48);
        v72 = objc_msgSend_offset(v68, v69, v70, v71);
        v107 = sub_1B18FD768(v48) + v72;
        v73 = (void *)sub_1B1955CE0(v102);
        v77 = objc_msgSend_bufferIndex(v101, v74, v75, v76);
        v80 = objc_msgSend_objectAtIndexedSubscript_(v73, v78, v77 - 18, v79);
        v84 = objc_msgSend_stride(v100, v81, v82, v83);
        v88 = objc_msgSend_threadExecutionWidth(v62, v85, v86, v87);
        v113[0] = v63;
        v113[1] = v84;
        v113[2] = LODWORD(v104->var4.var0.var0);
        objc_msgSend_setComputePipelineState_(v105, v89, (uint64_t)v62, v90);
        objc_msgSend_setBuffer_offset_atIndex_(v105, v91, (uint64_t)v103->_tessellationFactorBuffer, 24 * v46, 0);
        objc_msgSend_setBuffer_offset_atIndex_(v105, v92, v108, v107, 1);
        objc_msgSend_setBuffer_offset_atIndex_(v105, v93, v80, 0, 2);
        objc_msgSend_setBytes_length_atIndex_(v105, v94, (uint64_t)v113, 12, 3);
        v111 = (v63 + v88 - 1) / v88;
        v112 = v98;
        v109 = v88;
        v110 = v98;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v105, v95, (uint64_t)&v111, (uint64_t)&v109);
        v46 += v63;
      }
      v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v114, (uint64_t)v122, 16);
    }
    while (v106);
  }
  objc_msgSend_popDebugGroup(v105, v43, v44, v45);
}

- (void)constrainedEdgeLengthTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (void *)sub_1B1955D00((uint64_t)a4);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v12)
  {
    v16 = v12;
    v17 = 0;
    v18 = *(_QWORD *)v29;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v18)
        objc_enumerationMutation(v10);
      v20 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v19);
      if (v20 == a3)
        break;
      v17 += sub_1B195606C((uint64_t)v20);
      if (v16 == ++v19)
      {
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v17 = 0;
  }
  v21 = objc_msgSend_renderEncoder(a6, v13, v14, v15, (_QWORD)v28);
  *(float *)&v22 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend_setTessellationFactorScale_(*(void **)(v21 + 16), v23, v24, v25, v22);
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(*(void **)(v21 + 16), v26, (uint64_t)self->_tessellationFactorBuffer, 24 * v17, 0);
  objc_msgSend__drawPatchForMeshElement_instanceCount_(a6, v27, (uint64_t)a3, a5);
}

- (void)updateSubdivisionSurfaceTessellator:(id *)a3 parameters:(id *)a4
{
  char *v7;
  uint64_t v8;
  uint64_t v9;
  MTLBuffer *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTLBuffer *lastFramePositionBuffer;
  BOOL v16;
  int v17;
  double v19;

  v7 = sub_1B195BC3C((uint64_t)self->_geometry, 0, 0);
  v7[1] = (int)a3->var1;
  v10 = (MTLBuffer *)sub_1B1955C8C((uint64_t)a4->var0, 0, v8, v9);
  lastFramePositionBuffer = self->_lastFramePositionBuffer;
  if (lastFramePositionBuffer)
    v16 = lastFramePositionBuffer == v10;
  else
    v16 = 1;
  v17 = !v16;
  self->_lastFramePositionBuffer = v10;
  if (!a4->var4 && v17 == 0)
  {
    if (!sub_1B195D2F8((uint64_t)v7))
      return;
  }
  else
  {
    v19 = sub_1B195D10C((uint64_t)v7, (uint64_t)v10, a4->var1, a4->var3, v11, v12, v13, v14);
  }
  sub_1B195D320((uint64_t)v7, a4->var1, (uint64_t)a4->var2, a4->var3, *(float *)&v19);
}

- (void)subdivisionSurfaceTessellationDraw:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  char *v15;

  v10 = (void *)sub_1B1876264((uint64_t)a3->var0, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
  v13 = objc_msgSend_indexOfObject_(v10, v11, (uint64_t)a3->var2, v12);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    v14 = 0;
  else
    v14 = v13;
  v15 = sub_1B195BC3C((uint64_t)self->_geometry, 0, 0);
  sub_1B195D704((uint64_t)v15, a3->var5, a3->var6, v14, a3->var4);
}

@end
