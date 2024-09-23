@implementation VFXModelWrapDeformerInstance

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXModelWrapDeformerInstance;
  -[VFXModelWrapDeformerInstance dealloc](&v3, sel_dealloc);
}

- (unint64_t)updateWithContext:(id)a3
{
  uint64_t v3;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  __int128 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  __int128 v33;
  int64x2_t v34;
  __int128 v35;
  unsigned int *p_vertexCount;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  __int128 *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  int64x2_t v75;
  __int128 v76;
  __int128 v77;
  int64x2_t v78;
  __int128 v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  const char *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  int64x2_t v127;
  __int128 v128;
  simd_float4x4 v129;
  simd_float4x4 v130;
  simd_float4x4 v131;
  simd_float4x4 v132;

  v6 = objc_msgSend__currentFrameHash(a3, a2, (uint64_t)a3, v3);
  if (self->_currentFrameHash == v6)
    return 0;
  self->_currentFrameHash = v6;
  v11 = (void *)objc_msgSend__currentRenderContext(a3, v7, v8, v9);
  v22 = (void **)objc_msgSend_resourceComputeEncoder(v11, v12, v13, v14);
  if (self->_isLegacySingleLayerDeformer)
  {
    v23 = (__int128 *)sub_1B1869AC8((uint64_t)self->_legacyDrivingNode, v15, v16, v17, v18, v19, v20, v21);
    v113 = v23[1];
    v115 = *v23;
    v117 = v23[3];
    v119 = v23[2];
    v129 = *(simd_float4x4 *)sub_1B1869AC8((uint64_t)self->_deformedNode, v24, v25, v26, v27, v28, v29, v30);
    v130 = __invert_f4(v129);
    v32 = 0;
    v121 = v115;
    v122 = v113;
    v123 = v119;
    v124 = v117;
    do
    {
      *(__int128 *)((char *)&v125 + v32) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v130.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v121 + v32))), (float32x4_t)v130.columns[1], *(float32x2_t *)((char *)&v121 + v32), 1), (float32x4_t)v130.columns[2], *(float32x4_t *)((char *)&v121 + v32), 2), (float32x4_t)v130.columns[3], *(float32x4_t *)((char *)&v121 + v32), 3);
      v32 += 16;
    }
    while (v32 != 64);
    v33 = v126;
    v34 = v127;
    v35 = v128;
    p_vertexCount = &self->_legacyUniforms.vertexCount;
    *(_OWORD *)&self->_anon_114[12] = v125;
    *(_OWORD *)&self->_anon_114[28] = v33;
    *(int64x2_t *)&self->_anon_114[44] = v34;
    *(_OWORD *)&self->_anon_114[60] = v35;
    objc_msgSend_setBytes_length_atIndex_(*v22, v31, (uint64_t)&self->_legacyUniforms, 80, 0);
    v40 = objc_msgSend_dependency0PositionBuffer(a3, v37, v38, v39);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v41, v40, 0, 1);
    v45 = objc_msgSend_dstPositionBuffer(a3, v42, v43, v44);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v46, v45, 0, 11);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v47, (uint64_t)self->_pointIndicesBuffer, 0, 3);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v48, (uint64_t)self->_barycentricCoordsBuffer, 0, 4);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v49, (uint64_t)self->_legacyOffsetsOrTransformsBuffer, 0, 6);
    if (self->_bindingMode == 1)
    {
      v53 = objc_msgSend_srcPositionBuffer(a3, v50, v51, v52);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v54, v53, 0, 10);
    }
  }
  else
  {
    v55 = (__int128 *)sub_1B1869AC8((uint64_t)self->_innerLayerNode, v15, v16, v17, v18, v19, v20, v21);
    v109 = v55[1];
    v110 = *v55;
    v111 = v55[3];
    v112 = v55[2];
    v63 = (__int128 *)sub_1B1869AC8((uint64_t)self->_outerLayerNode, v56, v57, v58, v59, v60, v61, v62);
    v114 = v63[1];
    v116 = *v63;
    v118 = v63[3];
    v120 = v63[2];
    v131 = *(simd_float4x4 *)sub_1B1869AC8((uint64_t)self->_deformedNode, v64, v65, v66, v67, v68, v69, v70);
    v132 = __invert_f4(v131);
    v72 = 0;
    v121 = v110;
    v122 = v109;
    v123 = v112;
    v124 = v111;
    do
    {
      *(__int128 *)((char *)&v125 + v72) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v132.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v121 + v72))), (float32x4_t)v132.columns[1], *(float32x2_t *)((char *)&v121 + v72), 1), (float32x4_t)v132.columns[2], *(float32x4_t *)((char *)&v121 + v72), 2), (float32x4_t)v132.columns[3], *(float32x4_t *)((char *)&v121 + v72), 3);
      v72 += 16;
    }
    while (v72 != 64);
    v73 = 0;
    v74 = v126;
    v75 = v127;
    v76 = v128;
    *(_OWORD *)&self->_anon_14[12] = v125;
    *(_OWORD *)&self->_anon_14[28] = v74;
    *(int64x2_t *)&self->_anon_14[44] = v75;
    *(_OWORD *)&self->_anon_14[60] = v76;
    v121 = v116;
    v122 = v114;
    v123 = v120;
    v124 = v118;
    do
    {
      *(__int128 *)((char *)&v125 + v73) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v132.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v121 + v73))), (float32x4_t)v132.columns[1], *(float32x2_t *)((char *)&v121 + v73), 1), (float32x4_t)v132.columns[2], *(float32x4_t *)((char *)&v121 + v73), 2), (float32x4_t)v132.columns[3], *(float32x4_t *)((char *)&v121 + v73), 3);
      v73 += 16;
    }
    while (v73 != 64);
    p_vertexCount = &self->_uniforms.vertexCount;
    v77 = v126;
    v78 = v127;
    v79 = v128;
    *(_OWORD *)&self->_anon_14[76] = v125;
    *(_OWORD *)&self->_anon_14[92] = v77;
    *(int64x2_t *)&self->_anon_14[108] = v78;
    *(_OWORD *)&self->_anon_14[124] = v79;
    objc_msgSend_setBytes_length_atIndex_(*v22, v71, (uint64_t)&self->_uniforms, 144, 0);
    v83 = objc_msgSend_dependency0PositionBuffer(a3, v80, v81, v82);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v84, v83, 0, 1);
    v88 = objc_msgSend_dependency1PositionBuffer(a3, v85, v86, v87);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v89, v88, 0, 2);
    v93 = objc_msgSend_dstPositionBuffer(a3, v90, v91, v92);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v94, v93, 0, 11);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v95, (uint64_t)self->_pointIndicesBuffer, 0, 3);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v96, (uint64_t)self->_barycentricCoordsBuffer, 0, 4);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v97, (uint64_t)self->_innerLayerInfluencesBuffer, 0, 5);
    if (self->_bindingMode == 1)
    {
      v99 = objc_msgSend_srcPositionBuffer(a3, v50, v98, v52);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v100, v99, 0, 10);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v101, (uint64_t)self->_innerBindingSpaceVectorsBuffer, 0, 8);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v102, (uint64_t)self->_outerBindingSpaceVectorsBuffer, 0, 9);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v103, (uint64_t)self->_innerBindingOffsetsBuffer, 0, 6);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v104, (uint64_t)self->_outerBindingOffsetsBuffer, 0, 7, v109, v110, v111, v112);
    }
  }
  v105 = *p_vertexCount;
  v106 = *v22;
  v125 = 0uLL;
  *(_QWORD *)&v126 = 0;
  *((_QWORD *)&v126 + 1) = v105;
  v127 = vdupq_n_s64(1uLL);
  objc_msgSend_setStageInRegion_(v106, v50, (uint64_t)&v125, v52, v109, v110, v111, v112);
  v107 = sub_1B18FD774((uint64_t)self->_computePipeline);
  objc_msgSend_dispatchOnVertices_vertexCount_(*v22, v108, v107, *p_vertexCount);
  return 1;
}

@end
