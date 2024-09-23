@implementation VFXModelWrapDeformerParameters

- (VFXModelWrapDeformerParameters)initWithDrivingNode:(__n128)a3 deformedNode:(__n128)a4 bindingMode:(__n128)a5 bindingTransform:(uint64_t)a6 drivingNodeUVChannel:(uint64_t)a7 deformedNodeUVChannel:(uint64_t)a8
{
  VFXModelWrapDeformerParameters *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  VFXModelWrapDeformerParameters *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v33[7];
  objc_super v34;

  v34.receiver = a1;
  v34.super_class = (Class)VFXModelWrapDeformerParameters;
  v16 = -[VFXModelWrapDeformerParameters init](&v34, sel_init);
  v20 = v16;
  if (v16)
  {
    v16->_isLegacySingleLayerDeformer = 1;
    v16->_bindingMode = a9;
    *(__n128 *)v16->_anon_a0 = a2;
    *(__n128 *)&v16->_anon_a0[16] = a3;
    *(__n128 *)&v16->_anon_a0[32] = a4;
    *(__n128 *)&v16->_anon_a0[48] = a5;
    v16->_legacyDrivingNodeUVChannel = a10;
    v16->_legacyDeformedNodeUVChannel = a11;
    objc_msgSend_begin(VFXTransaction, v17, v18, v19);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v21, v22, v23, 0.0);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1B1920E9C;
    v33[3] = &unk_1E63D95A8;
    v33[4] = v20;
    v33[5] = a7;
    v33[6] = a8;
    objc_msgSend_enqueueCommandForObject_immediateTransactionBlock_(VFXTransaction, v24, a8, (uint64_t)v33);
    objc_msgSend_commit(VFXTransaction, v25, v26, v27);
  }
  return v20;
}

- (VFXModelWrapDeformerParameters)initWithInnerLayerNode:(__n128)a3 outerLayerNode:(__n128)a4 deformedNode:(__n128)a5 bindingMode:(uint64_t)a6 bindingTransform:(uint64_t)a7
{
  VFXModelWrapDeformerParameters *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  VFXModelWrapDeformerParameters *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v31[8];
  objc_super v32;

  v32.receiver = a1;
  v32.super_class = (Class)VFXModelWrapDeformerParameters;
  v14 = -[VFXModelWrapDeformerParameters init](&v32, sel_init);
  v18 = v14;
  if (v14)
  {
    v14->_bindingMode = a10;
    *(__n128 *)v14->_anon_a0 = a2;
    *(__n128 *)&v14->_anon_a0[16] = a3;
    *(__n128 *)&v14->_anon_a0[32] = a4;
    *(__n128 *)&v14->_anon_a0[48] = a5;
    objc_msgSend_begin(VFXTransaction, v15, v16, v17);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v19, v20, v21, 0.0);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1B1920FD0;
    v31[3] = &unk_1E63D95D0;
    v31[4] = v18;
    v31[5] = a7;
    v31[6] = a8;
    v31[7] = a9;
    objc_msgSend_enqueueCommandForObject_immediateTransactionBlock_(VFXTransaction, v22, a9, (uint64_t)v31);
    objc_msgSend_commit(VFXTransaction, v23, v24, v25);
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_bindingData.pointIndices);
  free(self->_bindingData.barycentricCoords);
  free(self->_bindingData.innerLayerInfluences);
  free(self->_bindingData.innerLayerTNBs);
  free(self->_bindingData.outerLayerTNBs);
  free(self->_bindingData.innerLayerOffsets);
  free(self->_bindingData.outerLayerOffsets);
  free(self->_bindingData.legacyOffsetsOrTransforms);
  v3.receiver = self;
  v3.super_class = (Class)VFXModelWrapDeformerParameters;
  -[VFXModelWrapDeformerParameters dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)bindingMode
{
  return self->_bindingMode;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  unint64_t *p_legacyOffsetsOrTransformsLength;
  unint64_t legacyOffsetsOrTransformsLength;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t *p_offsetsLength;
  unint64_t offsetsLength;
  const char *v23;
  const char *v24;
  const char *v25;

  objc_msgSend_encodeInt32_forKey_(a3, a2, self->_vertexCount, (uint64_t)CFSTR("vertexCount"));
  objc_msgSend_encodeInt32_forKey_(a3, v5, LODWORD(self->_bindingMode), (uint64_t)CFSTR("bindingMode"));
  objc_msgSend_encodeInt32_forKey_(a3, v6, LODWORD(self->_bindingData.pointIndicesStride), (uint64_t)CFSTR("bindingPointIndicesStride"));
  objc_msgSend_encodeInt32_forKey_(a3, v7, LODWORD(self->_bindingData.barycentricCoordsStride), (uint64_t)CFSTR("bindingBarycentricCoordsStride"));
  objc_msgSend_encodeInt32_forKey_(a3, v8, LODWORD(self->_bindingData.pointIndicesFormat), (uint64_t)CFSTR("bindingPointIndicesFormat"));
  objc_msgSend_encodeInt32_forKey_(a3, v9, LODWORD(self->_bindingData.barycentricCoordsFormat), (uint64_t)CFSTR("bindingBarycentricCoordsFormat"));
  objc_msgSend_encodeBytes_length_forKey_(a3, v10, (uint64_t)self->_bindingData.pointIndices, self->_bindingData.pointIndicesStride * self->_vertexCount, CFSTR("bindingPointIndices"));
  objc_msgSend_encodeBytes_length_forKey_(a3, v11, (uint64_t)self->_bindingData.barycentricCoords, self->_bindingData.barycentricCoordsStride * self->_vertexCount, CFSTR("bindingBarycentricCoords"));
  if (self->_isLegacySingleLayerDeformer)
  {
    objc_msgSend_encodeBool_forKey_(a3, v12, 1, (uint64_t)CFSTR("isLegacySingleLayerDeformer"));
    legacyOffsetsOrTransformsLength = self->_bindingData.legacyOffsetsOrTransformsLength;
    p_legacyOffsetsOrTransformsLength = &self->_bindingData.legacyOffsetsOrTransformsLength;
    objc_msgSend_encodeBytes_length_forKey_(a3, v15, *(p_legacyOffsetsOrTransformsLength - 1), legacyOffsetsOrTransformsLength, CFSTR("bindingOffsetsOrTransforms"));
    objc_msgSend_encodeInt32_forKey_(a3, v16, *(unsigned int *)p_legacyOffsetsOrTransformsLength, (uint64_t)CFSTR("bindingOffsetsOrTransformsLength"));
  }
  else
  {
    objc_msgSend_encodeBytes_length_forKey_(a3, v12, (uint64_t)self->_bindingData.innerLayerInfluences, self->_bindingData.innerLayerInfluencesLength, CFSTR("bindingInnerLayerInfluences"));
    objc_msgSend_encodeInt32_forKey_(a3, v17, LODWORD(self->_bindingData.innerLayerInfluencesLength), (uint64_t)CFSTR("bindingInnerLayerInfluencesLength"));
    if (self->_bindingMode == 1)
    {
      objc_msgSend_encodeBytes_length_forKey_(a3, v18, (uint64_t)self->_bindingData.innerLayerTNBs, self->_bindingData.tnbMatricesLength, CFSTR("bindingInnerTNBs"));
      objc_msgSend_encodeBytes_length_forKey_(a3, v19, (uint64_t)self->_bindingData.outerLayerTNBs, self->_bindingData.tnbMatricesLength, CFSTR("bindingOuterTNBs"));
      objc_msgSend_encodeInt32_forKey_(a3, v20, LODWORD(self->_bindingData.tnbMatricesLength), (uint64_t)CFSTR("bindingSpaceVectorsLength"));
      offsetsLength = self->_bindingData.offsetsLength;
      p_offsetsLength = (uint64_t *)&self->_bindingData.offsetsLength;
      objc_msgSend_encodeBytes_length_forKey_(a3, v23, *(p_offsetsLength - 2), offsetsLength, CFSTR("bindingInnerOffsets"));
      objc_msgSend_encodeBytes_length_forKey_(a3, v24, *(p_offsetsLength - 1), *p_offsetsLength, CFSTR("bindingOuterOffsets"));
      objc_msgSend_encodeInt32_forKey_(a3, v25, *(unsigned int *)p_offsetsLength, (uint64_t)CFSTR("bindingOffsetsLength"));
    }
  }
}

- (VFXModelWrapDeformerParameters)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXModelWrapDeformerParameters *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t vertexCount;
  size_t v18;
  size_t v19;
  const char *v20;
  const void *v21;
  const char *v22;
  const void *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  size_t v32;
  const void *v33;
  float *legacyOffsetsOrTransforms;
  int v35;
  const char *v36;
  const void *v37;
  const char *v38;
  uint64_t v39;
  int v40;
  const char *v41;
  const void *v42;
  const char *v43;
  const void *v44;
  const char *v45;
  uint64_t v46;
  int v47;
  const char *v48;
  const void *v49;
  const char *v50;
  uint64_t v51;
  size_t __n;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)VFXModelWrapDeformerParameters;
  v6 = -[VFXModelWrapDeformerParameters init](&v54, sel_init);
  if (v6)
  {
    v6->_vertexCount = objc_msgSend_decodeInt32ForKey_(a3, v4, (uint64_t)CFSTR("vertexCount"), v5);
    v6->_bindingMode = (int)objc_msgSend_decodeInt32ForKey_(a3, v7, (uint64_t)CFSTR("bindingMode"), v8);
    v6->_bindingData.pointIndicesStride = (int)objc_msgSend_decodeInt32ForKey_(a3, v9, (uint64_t)CFSTR("bindingPointIndicesStride"), v10);
    v6->_bindingData.barycentricCoordsStride = (int)objc_msgSend_decodeInt32ForKey_(a3, v11, (uint64_t)CFSTR("bindingBarycentricCoordsStride"), v12);
    v6->_bindingData.pointIndicesFormat = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("bindingPointIndicesFormat"), v14);
    v6->_bindingData.barycentricCoordsFormat = objc_msgSend_decodeIntegerForKey_(a3, v15, (uint64_t)CFSTR("bindingBarycentricCoordsFormat"), v16);
    vertexCount = v6->_vertexCount;
    v18 = v6->_bindingData.pointIndicesStride * vertexCount;
    v19 = v6->_bindingData.barycentricCoordsStride * vertexCount;
    v6->_bindingData.pointIndices = malloc_type_malloc(v18, 0x72B1CC1DuLL);
    v6->_bindingData.barycentricCoords = malloc_type_malloc(v19, 0xE8A5F9FAuLL);
    __n = 0;
    v21 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v20, (uint64_t)CFSTR("bindingPointIndices"), (uint64_t)&__n);
    if (__n == v18)
      memcpy(v6->_bindingData.pointIndices, v21, v18);
    v23 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v22, (uint64_t)CFSTR("bindingBarycentricCoords"), (uint64_t)&__n);
    if (__n == v19)
      memcpy(v6->_bindingData.barycentricCoords, v23, v19);
    v26 = objc_msgSend_decodeBoolForKey_(a3, v24, (uint64_t)CFSTR("isLegacySingleLayerDeformer"), v25);
    v6->_isLegacySingleLayerDeformer = v26;
    if (v26)
    {
      v29 = objc_msgSend_decodeInt32ForKey_(a3, v27, (uint64_t)CFSTR("bindingOffsetsOrTransformsLength"), v28);
      v6->_bindingData.legacyOffsetsOrTransformsLength = v29;
      v6->_bindingData.legacyOffsetsOrTransforms = (float *)malloc_type_malloc(v29, 0x54AC07DBuLL);
      __n = 0;
      v31 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v30, (uint64_t)CFSTR("bindingOffsetsOrTransforms"), (uint64_t)&__n);
      v32 = __n;
      if (__n == v6->_bindingData.legacyOffsetsOrTransformsLength)
      {
        v33 = (const void *)v31;
        legacyOffsetsOrTransforms = v6->_bindingData.legacyOffsetsOrTransforms;
LABEL_20:
        memcpy(legacyOffsetsOrTransforms, v33, v32);
      }
    }
    else
    {
      v35 = objc_msgSend_decodeInt32ForKey_(a3, v27, (uint64_t)CFSTR("bindingInnerLayerInfluencesLength"), v28);
      v6->_bindingData.innerLayerInfluencesLength = v35;
      v6->_bindingData.innerLayerInfluences = (float *)malloc_type_malloc(v35, 0x46013DE7uLL);
      __n = 0;
      v37 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v36, (uint64_t)CFSTR("bindingInnerLayerInfluences"), (uint64_t)&__n);
      if (__n == v6->_bindingData.innerLayerInfluencesLength)
        memcpy(v6->_bindingData.innerLayerInfluences, v37, __n);
      if (v6->_bindingMode == 1)
      {
        v40 = objc_msgSend_decodeInt32ForKey_(a3, v38, (uint64_t)CFSTR("bindingSpaceVectorsLength"), v39);
        v6->_bindingData.tnbMatricesLength = v40;
        v6->_bindingData.innerLayerTNBs = (float *)malloc_type_malloc(v40, 0x43AD7ADDuLL);
        v6->_bindingData.outerLayerTNBs = (float *)malloc_type_malloc(v6->_bindingData.tnbMatricesLength, 0x9FAA6ACAuLL);
        __n = 0;
        v42 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v41, (uint64_t)CFSTR("bindingInnerTNBs"), (uint64_t)&__n);
        if (__n == v6->_bindingData.tnbMatricesLength)
          memcpy(v6->_bindingData.innerLayerTNBs, v42, __n);
        v44 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v43, (uint64_t)CFSTR("bindingOuterTNBs"), (uint64_t)&__n);
        if (__n == v6->_bindingData.tnbMatricesLength)
          memcpy(v6->_bindingData.outerLayerTNBs, v44, __n);
        v47 = objc_msgSend_decodeInt32ForKey_(a3, v45, (uint64_t)CFSTR("bindingOffsetsLength"), v46);
        v6->_bindingData.offsetsLength = v47;
        v6->_bindingData.innerLayerOffsets = (float *)malloc_type_malloc(v47, 0x8CBC2B3DuLL);
        v6->_bindingData.outerLayerOffsets = (float *)malloc_type_malloc(v6->_bindingData.offsetsLength, 0xAD43F81CuLL);
        v49 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v48, (uint64_t)CFSTR("bindingInnerOffsets"), (uint64_t)&__n);
        if (__n == v6->_bindingData.offsetsLength)
          memcpy(v6->_bindingData.innerLayerOffsets, v49, __n);
        v51 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v50, (uint64_t)CFSTR("bindingOuterOffsets"), (uint64_t)&__n);
        v32 = __n;
        if (__n == v6->_bindingData.offsetsLength)
        {
          v33 = (const void *)v51;
          legacyOffsetsOrTransforms = v6->_bindingData.outerLayerOffsets;
          goto LABEL_20;
        }
      }
    }
  }
  return v6;
}

- (void)initParametersIfNeededWithDrivingNodeRef:(__CFXNode *)a3 deformedNodeRef:(__CFXNode *)a4
{
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  unsigned int v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  if (!self->_vertexCount)
  {
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.legacyOffsetsOrTransforms);
    v14 = sub_1B1868FA0((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);
    v22 = sub_1B17A0848(v14, v15, v16, v17, v18, v19, v20, v21);
    v30 = sub_1B1868FA0((uint64_t)a4, v23, v24, v25, v26, v27, v28, v29);
    v38 = sub_1B17A0848(v30, v31, v32, v33, v34, v35, v36, v37);
    v45 = sub_1B1875E70(v22, 0, v39, v40, v41, v42, v43, v44);
    v52 = sub_1B1875E70(v38, 0, v46, v47, v48, v49, v50, v51);
    v115 = sub_1B1875D94(v22, 0, 0, v53, v54, v55, v56, v57);
    v114 = sub_1B1875D94(v38, 0, 0, v58, v59, v60, v61, v62);
    v70 = sub_1B17EDAE0((uint64_t)v52, v63, v64, v65, v66, v67, v68, v69);
    self->_vertexCount = v70;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_1B2268260;
    v113 = malloc_type_malloc(4 * (v70 & 0x7FFFFFFF), 0x1000040BDFB0063uLL);
    self->_bindingData.barycentricCoords = v113;
    v78 = sub_1B17EDAE0((uint64_t)v45, v71, v72, v73, v74, v75, v76, v77) - 1;
    v79 = 1;
    if (v78 > 0xFF)
      v79 = 2;
    v80 = HIWORD(v78);
    if (HIWORD(v78))
      v81 = 4;
    else
      v81 = v79;
    v82 = 3 << (v78 > 0xFF);
    if (v80)
      v82 = 12;
    self->_bindingData.pointIndicesStride = v82;
    v83 = malloc_type_malloc(v82 * (unint64_t)self->_vertexCount, 0x62B93BFEuLL);
    self->_bindingData.pointIndices = v83;
    v116 = (uint64_t)v52;
    v117 = (uint64_t)v45;
    if (v81 == 1)
    {
      v89 = 0;
      v90 = 2;
      v88 = (uint64_t)v83;
    }
    else
    {
      v88 = 0;
      if (v81 == 2)
      {
        v90 = 14;
        v89 = (uint64_t)v83;
      }
      else
      {
        v89 = 0;
        v90 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v90;
    if (v80)
      v91 = (uint64_t)v83;
    else
      v91 = 0;
    v98 = sub_1B1875540(v22, 3, self->_legacyDrivingNodeUVChannel, 0, v84, v85, v86, v87);
    if (!v98)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v92, v93, v94, v95, v96, v97, (uint64_t)"driverTexcoordSource");
    v105 = sub_1B1875540(v38, 3, self->_legacyDeformedNodeUVChannel, 0, v94, v95, v96, v97);
    if (!v105)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v99, v100, v101, v102, v103, v104, (uint64_t)"deformedTexcoordSource");
    v106 = sub_1B1875D94(v22, 3, self->_legacyDrivingNodeUVChannel, v100, v101, v102, v103, v104);
    v112 = sub_1B1875D94(v38, 3, self->_legacyDeformedNodeUVChannel, v107, v108, v109, v110, v111);
    sub_1B18FFE58(self->_bindingMode, self->_vertexCount, v38, v22, v116, v117, (uint64_t)v105, (uint64_t)v98, *(float32x4_t *)self->_anon_a0, *(float32x4_t *)&self->_anon_a0[16], *(float32x4_t *)&self->_anon_a0[32], *(float32x4_t *)&self->_anon_a0[48], v114, v112, v115, v106, 0, v88, v89,
      v91,
      0,
      (uint64_t)v113,
      &self->_bindingData.legacyOffsetsOrTransforms,
      &self->_bindingData.legacyOffsetsOrTransformsLength);
  }
}

- (void)initParametersIfNeededWithInnerLayerNodeRef:(__CFXNode *)a3 outerLayerNodeRef:(__CFXNode *)a4 deformedNodeRef:(__CFXNode *)a5
{
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  char v102;
  int v103;
  uint64_t v104;
  const void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned int v114;
  uint64_t v115;
  unsigned int v116;
  uint64_t v117;
  unint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  float *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const void *v129;
  const void *v130;
  int v131;

  if (!self->_vertexCount)
  {
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.innerLayerInfluences);
    free(self->_bindingData.innerLayerTNBs);
    free(self->_bindingData.outerLayerTNBs);
    free(self->_bindingData.innerLayerOffsets);
    free(self->_bindingData.outerLayerOffsets);
    v16 = sub_1B1868FA0((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
    v24 = sub_1B17A0848(v16, v17, v18, v19, v20, v21, v22, v23);
    v32 = sub_1B1868FA0((uint64_t)a4, v25, v26, v27, v28, v29, v30, v31);
    v40 = sub_1B17A0848(v32, v33, v34, v35, v36, v37, v38, v39);
    v48 = sub_1B1868FA0((uint64_t)a5, v41, v42, v43, v44, v45, v46, v47);
    v56 = sub_1B17A0848(v48, v49, v50, v51, v52, v53, v54, v55);
    v130 = sub_1B1875E70(v24, 0, v57, v58, v59, v60, v61, v62);
    v129 = sub_1B1875E70(v40, 0, v63, v64, v65, v66, v67, v68);
    v131 = v56;
    v75 = sub_1B1875E70(v56, 0, v69, v70, v71, v72, v73, v74);
    v127 = sub_1B1875D94(v24, 0, 0, v76, v77, v78, v79, v80);
    v126 = sub_1B1875D94(v40, 0, 0, v81, v82, v83, v84, v85);
    v128 = (uint64_t)v75;
    v93 = sub_1B17EDAE0((uint64_t)v75, v86, v87, v88, v89, v90, v91, v92);
    self->_vertexCount = v93;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_1B2268270;
    v100 = malloc_type_malloc(8 * (v93 & 0x7FFFFFFF), 0x100004052888210uLL);
    v101 = 0;
    self->_bindingData.barycentricCoords = v100;
    v102 = 1;
    do
    {
      v103 = v102 & 1;
      if ((v102 & 1) != 0)
        v104 = v24;
      else
        v104 = v40;
      v105 = sub_1B1875E70(v104, 0, v94, v95, v96, v97, v98, v99);
      v113 = sub_1B17EDAE0((uint64_t)v105, v106, v107, v108, v109, v110, v111, v112);
      v102 = 0;
      if (v101 <= v113)
        v101 = v113;
    }
    while (v103);
    v114 = v101 - 1;
    v115 = 1;
    if ((v101 - 1) > 0xFF)
      v115 = 2;
    v116 = HIWORD(v114);
    if (HIWORD(v114))
      v117 = 4;
    else
      v117 = v115;
    v118 = 3 << ((v101 - 1) > 0xFF);
    if (v116)
      v118 = 12;
    self->_bindingData.pointIndicesStride = v118;
    v119 = malloc_type_malloc(v118 * (unint64_t)self->_vertexCount, 0x6942BD84uLL);
    self->_bindingData.pointIndices = v119;
    if (v117 == 1)
    {
      v121 = 0;
      v122 = 2;
      v120 = (uint64_t)v119;
    }
    else
    {
      v120 = 0;
      if (v117 == 2)
      {
        v122 = 14;
        v121 = (uint64_t)v119;
      }
      else
      {
        v120 = 0;
        v121 = 0;
        v122 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v122;
    if (v116)
      v123 = (uint64_t)v119;
    else
      v123 = 0;
    v124 = 4 * self->_vertexCount;
    self->_bindingData.innerLayerInfluencesLength = v124;
    v125 = (float *)malloc_type_malloc(v124, 0x72C4EE4DuLL);
    self->_bindingData.innerLayerInfluences = v125;
    sub_1B1900ABC(self->_bindingMode, self->_vertexCount, v131, v24, v40, v128, (uint64_t)v130, (uint64_t)v129, *(__n128 *)self->_anon_a0, *(__n128 *)&self->_anon_a0[16], *(__n128 *)&self->_anon_a0[32], *(__n128 *)&self->_anon_a0[48], v127, v126, 1, v120, v121, v123, (uint64_t)v100,
      0,
      (uint64_t)v125,
      (void **)&self->_bindingData.innerLayerTNBs,
      (void **)&self->_bindingData.outerLayerTNBs,
      &self->_bindingData.tnbMatricesLength,
      (void **)&self->_bindingData.innerLayerOffsets,
      &self->_bindingData.outerLayerOffsets,
      &self->_bindingData.offsetsLength);
  }
}

- (id)extraLayerMeshesWithDrivingMesh0:(__CFXMesh *)a3 drivingMesh1:(__CFXMesh *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const __CFAllocator *v33;
  unint64_t i;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const UInt8 *v41;
  uint64_t v42;
  double v43;
  unsigned int v44;
  unsigned int v45;
  float32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  CFDataRef v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const __CFArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const __CFArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const void *v73;
  const char *v74;
  uint64_t v75;
  const __CFAllocator *bytesDeallocator;
  char v78;
  __CFXMesh *v79;
  void *v80;
  float32x4_t v81;
  float32x4_t v82;
  char v83;
  void *values;

  v10 = sub_1B1875E70((uint64_t)a3, 0, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  v17 = sub_1B1875E70((uint64_t)a4, 0, v11, v12, v13, v14, v15, v16);
  v25 = sub_1B17EDAE0((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);
  v79 = a3;
  v78 = sub_1B1875D94((uint64_t)a3, 0, 0, v26, v27, v28, v29, v30);
  v80 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v31, 39, v32);
  v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE10];
  for (i = 1; i != 40; ++i)
  {
    v41 = (const UInt8 *)malloc_type_malloc(12 * v25, 0x1D106E29uLL);
    if (v25 >= 1)
    {
      v42 = 0;
      v43 = (double)i * 0.025;
      *(float *)&v43 = v43;
      v81 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v43, 0);
      v44 = 2;
      v45 = 1;
      do
      {
        *(double *)v46.i64 = sub_1B17EE400((uint64_t)v10, v42, v35, v36, v37, v38, v39, v40);
        v82 = v46;
        *(double *)v53.i64 = sub_1B17EE400((uint64_t)v17, v42, v47, v48, v49, v50, v51, v52);
        v54 = vmlaq_f32(v82, vsubq_f32(v53, v82), v81);
        *(_DWORD *)&v41[4 * v44 - 8] = v54.i32[0];
        *(_DWORD *)&v41[4 * v44 - 4] = v54.i32[1];
        *(_DWORD *)&v41[4 * v44] = v54.i32[2];
        v42 = v45;
        v44 += 3;
      }
      while (v25 > v45++);
    }
    v56 = CFDataCreateWithBytesNoCopy(v33, v41, 12 * v25, bytesDeallocator);
    values = 0;
    values = (void *)sub_1B17ED204(v56, 0, v25, 3, 1, v57, v58, v59);
    v60 = CFArrayCreate(v33, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v83 = v78;
    v67 = (const __CFArray *)sub_1B1876264((uint64_t)v79, 0, v61, v62, v63, v64, v65, v66);
    v73 = (const void *)sub_1B17AF674(v60, v67, (uint64_t)&v83, v68, v69, v70, v71, v72);
    objc_msgSend_addObject_(v80, v74, (uint64_t)v73, v75);
    CFRelease(v73);
    CFRelease(v60);
  }
  return v80;
}

@end
