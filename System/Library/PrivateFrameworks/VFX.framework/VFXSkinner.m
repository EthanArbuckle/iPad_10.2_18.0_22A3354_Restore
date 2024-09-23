@implementation VFXSkinner

- (VFXSkinner)initWithSkinnerRef:(__CFXSkinner *)a3
{
  VFXSkinner *v4;
  __CFXSkinner *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VFXSkinner;
  v4 = -[VFXSkinner init](&v14, sel_init);
  if (v4)
  {
    v5 = (__CFXSkinner *)CFRetain(a3);
    v4->_skinner = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
  }
  return v4;
}

+ (VFXSkinner)skinnerWithSkinnerRef:(__CFXSkinner *)a3
{
  VFXSkinner *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXSkinner *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXSkinner *)(id)objc_msgSend_initWithSkinnerRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXSkinner *skinner;
  __CFXSkinner *v10;
  const char *v11;
  objc_super v12;
  _QWORD v13[5];

  skinner = self->_skinner;
  if (skinner)
  {
    sub_1B193E768((uint64_t)skinner, 0, v2, v3, v4, v5, v6, v7);
    v10 = self->_skinner;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B18E682C;
    v13[3] = &unk_1E63D4AB0;
    v13[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v13);
  }
  objc_storeWeak((id *)&self->_skeleton, 0);

  v12.receiver = self;
  v12.super_class = (Class)VFXSkinner;
  -[VFXSkinner dealloc](&v12, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFTypeRef *v4;
  VFXSkinner *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v4 = sub_1B18E44B0((uint64_t)self->_skinner);
  v5 = [VFXSkinner alloc];
  v8 = (void *)objc_msgSend_initWithSkinnerRef_(v5, v6, (uint64_t)v4, v7);
  CFRelease(v4);
  v12 = objc_msgSend_skeleton(self, v9, v10, v11);
  objc_msgSend__setSkeleton_(v8, v13, v12, v14);
  objc_msgSend__setBaseMesh_(v8, v15, (uint64_t)self->_baseMesh, v16);
  objc_msgSend_set_bonesAndIndicesCompression_(v8, v17, self->_bonesAndIndicesCompression, v18);
  return v8;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (__CFXSkinner)skinnerRef
{
  return self->_skinner;
}

- (VFXNode)skeleton
{
  return (VFXNode *)objc_loadWeak((id *)&self->_skeleton);
}

- (BOOL)_setSkeleton:(id)a3
{
  VFXNode **p_skeleton;
  id Weak;

  p_skeleton = &self->_skeleton;
  Weak = objc_loadWeak((id *)&self->_skeleton);
  if (Weak != a3)
    objc_storeWeak((id *)p_skeleton, a3);
  return Weak != a3;
}

- (void)_syncObjCModel
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v3 = sub_1B17EE4F8((uint64_t)self->_skinner);
  if (v3)
  {
    v7 = objc_msgSend_nodeWithNodeRef_(VFXNode, v4, v3, v6);
  }
  else
  {
    v10 = (void *)objc_msgSend_bones(self, v4, v5, v6);
    v7 = (uint64_t)sub_1B18E69AC(v10, v11);
    if (!v7)
      return;
  }
  objc_msgSend__setSkeleton_(self, v8, v7, v9);
}

- (void)setSkeleton:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[7];

  v6 = objc_msgSend_skeleton(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend__setSkeleton_(self, v7, (uint64_t)a3, v8))
  {
    if (self->_skinner)
    {
      v12 = objc_msgSend_worldRef(self, v9, v10, v11);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1B18E6B80;
      v14[3] = &unk_1E63D5350;
      v14[4] = self;
      v14[5] = a3;
      v14[6] = v6;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
    }
  }
}

- (BOOL)_bonesAndIndicesCompression
{
  return self->_bonesAndIndicesCompression;
}

- (void)set_bonesAndIndicesCompression:(BOOL)a3
{
  self->_bonesAndIndicesCompression = a3;
}

- (VFXMesh)baseMesh
{
  return self->_baseMesh;
}

- (void)_setBaseMesh:(id)a3
{
  VFXMesh *baseMesh;

  if (a3)
  {
    baseMesh = self->_baseMesh;
    if (baseMesh != a3)
    {

      self->_baseMesh = (VFXMesh *)a3;
    }
  }
}

+ (__CFXSkinner)createSkinnerWithBaseMesh:(id)a3 bones:(id)a4 boneWeights:(id)a5 boneIndices:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;

  v11 = objc_msgSend_meshRef(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v18 = sub_1B1875E70(v11, 0, v12, v13, v14, v15, v16, v17);
  v26 = sub_1B17EDAE0((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
  return (__CFXSkinner *)objc_msgSend__createSkinnerWithVertexCount_bones_boneWeights_boneIndices_baseMesh_(a1, v27, v26, (uint64_t)a4, a5, a6, a3);
}

+ (__CFXSkinner)_createSkinnerWithVertexCount:(int64_t)a3 bones:(id)a4 boneWeights:(id)a5 boneIndices:(id)a6 baseMesh:(id)a7
{
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const __CFString *v55;
  uint64_t v56;
  size_t *v57;
  __CFXSkinner *v58;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  int64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  int64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i;
  __int16 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;

  v11 = objc_msgSend_count(a4, a2, a3, (uint64_t)a4);
  v15 = v11;
  if (v11 < 2)
  {
    v56 = objc_msgSend_meshRef(a7, v12, v13, v14);
    v57 = (size_t *)sub_1B18F0138(a3, v15, 0, v56);
    sub_1B18F0EDC((uint64_t)v57, 1);
  }
  else
  {
    v16 = (void *)objc_msgSend_data(a5, v12, v13, v14);
    v20 = objc_msgSend_length(v16, v17, v18, v19);
    v24 = objc_msgSend_bytesPerComponent(a5, v21, v22, v23);
    v28 = (void *)objc_msgSend_data(a6, v25, v26, v27);
    v32 = objc_msgSend_length(v28, v29, v30, v31);
    v36 = objc_msgSend_bytesPerComponent(a6, v33, v34, v35);
    v40 = objc_msgSend_vectorCount(a6, v37, v38, v39);
    if (v40 != objc_msgSend_vectorCount(a5, v41, v42, v43) || (v51 = v20 / a3 / v24, v32 / a3 / v36 != v51))
    {
      v55 = CFSTR("Error: VFXSkinner: there must be the same number of bone weights and bone indices");
      goto LABEL_12;
    }
    if (!objc_msgSend_floatComponents(a5, v44, v45, v46)
      || objc_msgSend_bytesPerComponent(a5, v52, v45, v46) != 4)
    {
      goto LABEL_12;
    }
    if (objc_msgSend_bytesPerComponent(a6, v53, v45, v46) >= 3)
    {
      v55 = CFSTR("Error: VFXSkinner: bone indices must be uint8 or uint16 (maximum of 2 bytes)");
LABEL_12:
      sub_1B17C4408(16, (uint64_t)v55, v45, v46, v47, v48, v49, v50, v120);
      return 0;
    }
    v60 = objc_msgSend_dataStride(a6, v54, v45, v46);
    v64 = objc_msgSend_componentsPerVector(a6, v61, v62, v63);
    if (v60 != objc_msgSend_bytesPerComponent(a6, v65, v66, v67) * v64)
    {
      v55 = CFSTR("Error: VFXSkinner: bone indices stride must be equal to componentsPerVector * bytesPerComponent");
      goto LABEL_12;
    }
    v69 = objc_msgSend_dataStride(a5, v68, v45, v46);
    v73 = objc_msgSend_componentsPerVector(a5, v70, v71, v72);
    if (v69 != objc_msgSend_bytesPerComponent(a5, v74, v75, v76) * v73)
    {
      v55 = CFSTR("Error: VFXSkinner: bone weights stride must be equal to componentsPerVector * bytesPerComponent");
      goto LABEL_12;
    }
    v78 = v51 * a3;
    v79 = objc_msgSend_meshRef(a7, v77, v45, v46);
    v57 = (size_t *)sub_1B18F0138(a3, v15, v51 * a3, v79);
    sub_1B18F0EDC((uint64_t)v57, v51);
    v122 = 0;
    v123 = 0;
    v121 = 0;
    sub_1B18F091C(v57, &v123, &v122, &v121);
    v83 = v123;
    if (v123 && (a3 & 0x8000000000000000) == 0)
    {
      v84 = 0;
      v85 = a3 + 1;
      do
      {
        *v83++ = v84 * v51;
        ++v84;
        --v85;
      }
      while (v85);
    }
    v86 = (void *)objc_msgSend_data(a6, v80, v81, v82);
    v90 = objc_msgSend_bytes(v86, v87, v88, v89);
    v94 = (void *)objc_msgSend_data(a6, v91, v92, v93);
    v98 = objc_msgSend_bytes(v94, v95, v96, v97);
    v102 = (void *)objc_msgSend_data(a5, v99, v100, v101);
    v106 = objc_msgSend_bytes(v102, v103, v104, v105);
    v110 = objc_msgSend_bytesPerComponent(a6, v107, v108, v109);
    if (v78 >= 1)
    {
      v117 = v110;
      for (i = 0; i != v78; ++i)
      {
        if (v117 == 1)
          v119 = *(unsigned __int8 *)(v90 + i);
        else
          v119 = *(_WORD *)(v98 + 2 * i);
        *(_WORD *)(v122 + 2 * i) = v119;
        if (v121)
          *(_DWORD *)(v121 + 4 * i) = *(_DWORD *)(v106 + 4 * i);
        if (v119 < 0)
        {
          sub_1B17C4408(16, (uint64_t)CFSTR("Error: skinner: invalid index (%d)"), v111, v112, v113, v114, v115, v116, v119);
          *(_WORD *)(v122 + 2 * i) = -1;
        }
      }
    }
    sub_1B18F0670(v57);
  }
  v58 = (__CFXSkinner *)sub_1B18E4404(v57);
  CFRelease(v57);
  return v58;
}

+ (__CFXSkinner)_createSkinnerWithCompressedData:(id)a3 bonesCount:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  __CFXSkinner *v57;
  unsigned __int8 *v58;
  uint64_t *v59;
  unint64_t v60;
  unsigned int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unsigned __int8 *v74;
  _WORD *v75;
  float *v76;
  __int16 v77;
  unsigned int v78;
  _WORD *v79;
  float *v80;
  __int16 v81;
  unsigned __int16 *v82;
  _WORD *v83;
  float *v84;
  __int16 v85;
  unsigned int v86;
  _WORD *v87;
  float *v88;
  __int16 v89;
  uint64_t v91;
  float *v92;
  _WORD *v93;
  uint64_t *v94;

  if (objc_msgSend_count(a3, a2, (uint64_t)a3, a4) != 3)
  {
    if (objc_msgSend_count(a3, v8, v9, v10) != 1)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. skinner: invalid compressed data"), v40, v41, v42, v43, v44, v45, (uint64_t)"skinCompressedData.count == 1");
    v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 0, v41);
    v33 = objc_msgSend_length(v26, v46, v47, v48);
    v11 = 0;
    v23 = 0;
    v22 = 1;
    goto LABEL_13;
  }
  v11 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v8, 0, v10);
  if (objc_msgSend_length(v11, v12, v13, v14) == a5)
  {
    v22 = 1;
    v23 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v15, 1, v17);
    v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 2, v25);
    v33 = objc_msgSend_length(v26, v27, v28, v29);
    if (v11)
    {
      v34 = (unsigned __int8 *)objc_msgSend_bytes(v11, v30, v31, v32);
      if (a5)
      {
        v35 = 1;
        v36 = a5;
        do
        {
          v38 = *v34++;
          v37 = v38;
          if (v35 <= v38)
            v35 = v37;
          --v36;
        }
        while (v36);
        v22 = 0;
LABEL_14:
        v49 = (_QWORD *)sub_1B18F0138(a5, (__int16)a4, v33, 0);
        sub_1B18F0EDC((uint64_t)v49, v35);
        if (a4 < 2)
        {
LABEL_50:
          v57 = (__CFXSkinner *)sub_1B18E4404(v49);
          CFRelease(v49);
          return v57;
        }
        v93 = 0;
        v94 = 0;
        v92 = 0;
        sub_1B18F091C(v49, &v94, &v93, &v92);
        if (v22)
        {
          if (a5)
          {
            v53 = 0;
            v54 = v94;
            v55 = a5;
            do
            {
              if (v53 >= v33)
                v56 = v33 - 1;
              else
                v56 = v53;
              if (v53 < v33)
                ++v53;
              *v54++ = v56;
              --v55;
            }
            while (v55);
            goto LABEL_31;
          }
        }
        else
        {
          v58 = (unsigned __int8 *)objc_msgSend_bytes(v11, v50, v51, v52);
          if (a5)
          {
            v53 = 0;
            v59 = v94;
            v60 = a5;
            do
            {
              *v59++ = v53;
              v61 = *v58++;
              v53 += v61;
              --v60;
            }
            while (v60);
            goto LABEL_31;
          }
        }
        v53 = 0;
LABEL_31:
        v94[a5] = v53;
        v65 = (unsigned __int8 *)objc_msgSend_bytes(v26, v50, v51, v52);
        if (v23)
        {
          v73 = objc_msgSend_length(v23, v62, v63, v64) / (unint64_t)v33;
          if (v73 == 2)
          {
            v82 = (unsigned __int16 *)objc_msgSend_bytes(v23, v66, v67, v68);
            if (v33 >= 1)
            {
              v84 = v92;
              v83 = v93;
              do
              {
                v85 = *v65++;
                *v83++ = v85;
                v86 = *v82++;
                *v84++ = (float)v86 / 65535.0;
                --v33;
              }
              while (v33);
            }
          }
          else if (v73 == 1)
          {
            v74 = (unsigned __int8 *)objc_msgSend_bytes(v23, v66, v67, v68);
            if (v33 >= 1)
            {
              v76 = v92;
              v75 = v93;
              do
              {
                v77 = *v65++;
                *v75++ = v77;
                v78 = *v74++;
                *v76++ = (float)v78 / 255.0;
                --v33;
              }
              while (v33);
            }
          }
          else
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported bytes per weight"), v67, v68, v69, v70, v71, v72, v91);
            if (v33 >= 1)
            {
              v88 = v92;
              v87 = v93;
              do
              {
                v89 = *v65++;
                *v87++ = v89;
                *v88++ = 1.0;
                --v33;
              }
              while (v33);
            }
          }
        }
        else if (v33 >= 1)
        {
          v80 = v92;
          v79 = v93;
          do
          {
            v81 = *v65++;
            *v79++ = v81;
            *v80++ = 1.0;
            --v33;
          }
          while (v33);
        }
        sub_1B18F0670(v49);
        goto LABEL_50;
      }
      v22 = 0;
    }
LABEL_13:
    LOWORD(v35) = 1;
    goto LABEL_14;
  }
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: mismatch between the vertex count and the number of bones per vertex"), v16, v17, v18, v19, v20, v21, v91);
  return 0;
}

+ (VFXSkinner)skinnerWithBaseMesh:(id)a3 bones:(id)a4 boneInverseBindTransforms:(id)a5 boneWeights:(id)a6 boneIndices:(id)a7
{
  uint64_t v7;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t SkinnerWithBaseMesh_bones_boneWeights_boneIndices;
  const void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const __CFString *v37;
  uint64_t v38;

  if (!a4 || !objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4))
  {
    v37 = CFSTR("Error: can't create a skinner with no bones");
LABEL_8:
    sub_1B17C4408(16, (uint64_t)v37, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v7, v38);
    return 0;
  }
  if (!a3)
  {
    v37 = CFSTR("Error: can't create a skinner with no base mesh");
    goto LABEL_8;
  }
  v15 = objc_msgSend_count(a4, v14, (uint64_t)a3, (uint64_t)a4);
  if (v15 != objc_msgSend_count(a5, v16, v17, v18))
  {
    v37 = CFSTR("Error: bones count and bind transform count don't match");
    goto LABEL_8;
  }
  SkinnerWithBaseMesh_bones_boneWeights_boneIndices = objc_msgSend_createSkinnerWithBaseMesh_bones_boneWeights_boneIndices_(a1, v19, (uint64_t)a3, (uint64_t)a4, a6, a7);
  if (SkinnerWithBaseMesh_bones_boneWeights_boneIndices)
  {
    v21 = (const void *)SkinnerWithBaseMesh_bones_boneWeights_boneIndices;
    v22 = objc_alloc((Class)a1);
    v25 = (void *)objc_msgSend_initWithSkinnerRef_(v22, v23, (uint64_t)v21, v24);
    CFRelease(v21);
    objc_msgSend_setBones_(v25, v26, (uint64_t)a4, v27);
    objc_msgSend_setBoneInverseBindTransforms_(v25, v28, (uint64_t)a5, v29);
    objc_msgSend__setBaseMesh_(v25, v30, (uint64_t)a3, v31);
    v33 = sub_1B18E69AC(a4, v32);
    objc_msgSend__setSkeleton_(v25, v34, (uint64_t)v33, v35);
    return (VFXSkinner *)v25;
  }
  return 0;
}

- (__n128)baseMeshBindTransform
{
  uint64_t v5;
  uint64_t v6;
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
  __n128 result;
  __n128 v23;

  v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = sub_1B17A0A4C(a1[1]);
  if (v14)
  {
    result = *(__n128 *)sub_1B18F0998(v14);
    if (!v13)
      return result;
  }
  else
  {
    result = (__n128)VFXMatrix4Identity;
    if (!v13)
      return result;
  }
  v23 = result;
  sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v23;
}

- (uint64_t)setBaseMeshBindTransform:(uint64_t)a3
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
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v9 = objc_msgSend_worldRef(a1, a2, a3, a4);
  v17 = v9;
  if (v9)
    sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
  result = sub_1B17A0A4C(a1[1]);
  if (result)
    result = sub_1B18F098C(result, a5, a6, a7, a8);
  if (v17)
    return sub_1B18797B4(v17, v19, v20, v21, v22, v23, v24, v25);
  return result;
}

- (VFXMeshSource)boneWeights
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
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
  VFXMeshSource *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float *v35;
  float v36;
  uint64_t v37;
  float v38;
  float *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  if (sub_1B18E4B20((uint64_t)self->_skinner))
  {
    v21 = 0;
    if (!v13)
      return v21;
    goto LABEL_27;
  }
  v45 = v13;
  v22 = (_QWORD *)sub_1B17A0A4C((uint64_t)self->_skinner);
  v23 = sub_1B17EE4F8((uint64_t)v22);
  v24 = (int)sub_1B18F0ED4((uint64_t)v22);
  v47 = 0;
  v48 = 0;
  sub_1B18F091C(v22, &v47, 0, &v48);
  v26 = (float *)malloc_type_malloc(4 * v23 * v24, 0x9B7D2798uLL);
  if (v23 >= 1)
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = v47;
    v46 = v48;
    v31 = *v47;
    do
    {
      v32 = v31;
      v31 = v30[++v29];
      v33 = v31 - v32;
      if (v31 - v32 >= v24)
        v34 = v24;
      else
        v34 = v31 - v32;
      if (v34 < 1)
      {
        v34 = 0;
        v36 = 0.0;
      }
      else
      {
        v35 = (float *)(v46 + 4 * v27);
        v36 = 0.0;
        v37 = v34;
        do
        {
          v38 = *v35++;
          v36 = v36 + v38;
          v26[v28++] = v38;
          --v37;
        }
        while (v37);
        v27 += v34;
      }
      if (v24 > v34)
      {
        bzero(&v26[v28], 4 * (v24 - v34));
        v28 = v28 + v24 - v34;
      }
      if (v33 > v24 && v36 > 0.0 && (int)v24 >= 1)
      {
        v40 = &v26[v28 - v24];
        v41 = v24;
        do
        {
          *v40 = *v40 / v36;
          ++v40;
          --v41;
        }
        while (v41);
      }
    }
    while (v29 != v23);
  }
  v42 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v25, (uint64_t)v26, 4 * v23 * v24, 1);
  v21 = (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(VFXMeshSource, v43, v42, (uint64_t)CFSTR("kGeometrySourceSemanticBoneWeights"), v23, 1, v24, 4, 0, 0);
  v13 = v45;
  if (v45)
LABEL_27:
    sub_1B18797B4(v13, v14, v15, v16, v17, v18, v19, v20);
  return v21;
}

- (VFXMeshSource)boneIndices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
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
  VFXMeshSource *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _WORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int16 *v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  if (sub_1B18E4B20((uint64_t)self->_skinner))
  {
    v21 = 0;
    if (!v13)
      return v21;
    goto LABEL_26;
  }
  v56 = v13;
  v22 = (_QWORD *)sub_1B17A0A4C((uint64_t)self->_skinner);
  v23 = (int)sub_1B18F0ED4((uint64_t)v22);
  v24 = sub_1B17EE4F8((uint64_t)v22);
  v57 = 0;
  v58 = 0;
  v55 = (uint64_t)v22;
  sub_1B18F091C(v22, &v57, &v58, 0);
  v32 = malloc_type_malloc(2 * v23 * v24, 0xBC423831uLL);
  if (v24 < 1)
  {
    v34 = 0;
    v33 = 0;
  }
  else
  {
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = v57;
    v37 = v58;
    v38 = *v57;
    do
    {
      v39 = v38;
      v38 = v36[++v35];
      v40 = v38 - v39;
      if (v40 >= v23)
        v41 = v23;
      else
        v41 = v40;
      if (v41 < 1)
      {
        v41 = 0;
      }
      else
      {
        v42 = (__int16 *)(v37 + 2 * v33);
        v43 = v41;
        do
        {
          v44 = *v42++;
          v32[v34++] = v44;
          --v43;
        }
        while (v43);
        v33 += v41;
      }
      if (v23 > v41)
      {
        bzero(&v32[v34], 2 * (v23 - v41));
        v34 = v34 + v23 - v41;
      }
    }
    while (v35 != v24);
  }
  if (v33 > sub_1B18F0944(v55, v25, v26, v27, v28, v29, v30, v31))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. boneIndices - failed to deindex"), v46, v47, v48, v49, v50, v51, (uint64_t)"r <= CFXSkinGetWeightsCount(skin)");
  if (v34 != v24 * v23)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. boneIndices - failed to deindex (2)"), v46, v47, v48, v49, v50, v51, (uint64_t)"w == numberOfInfluence * vertexCount");
  v52 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v45, (uint64_t)v32, 2 * v24 * v23, 1);
  v21 = (VFXMeshSource *)objc_msgSend__modelSourceWithData_semantic_vectorCount_componentType_componentCount_dataOffset_dataStride_(VFXMeshSource, v53, v52, (uint64_t)CFSTR("kGeometrySourceSemanticBoneIndices"), v24, 13, v23, 0, 0);
  v13 = v56;
  if (v56)
LABEL_26:
    sub_1B18797B4(v13, v14, v15, v16, v17, v18, v19, v20);
  return v21;
}

- (NSArray)boneInverseBindTransforms
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = sub_1B17A0A4C((uint64_t)self->_skinner);
  v22 = (NSArray *)v14;
  if (v14)
  {
    LODWORD(v23) = sub_1B18F09A0(v14);
    v24 = sub_1B181F5A8((uint64_t)v22);
    v22 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v25, (int)v23, v26);
    if ((int)v23 >= 1)
    {
      v23 = (unsigned __int16)v23;
      v27 = (double *)(v24 + 32);
      do
      {
        v28 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E0CB3B18], v15, v16, v17, *(v27 - 4), *(v27 - 2), *v27, v27[2]);
        objc_msgSend_addObject_(v22, v29, v28, v30);
        v27 += 8;
        --v23;
      }
      while (v23);
    }
  }
  if (v13)
    sub_1B18797B4(v13, (uint64_t)v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setBoneInverseBindTransforms:(id)a3
{
  uint64_t v3;
  uint64_t v6;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v14 = v6;
  if (v6)
  {
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
    v22 = sub_1B17A0A4C((uint64_t)self->_skinner);
    if (!v22)
    {
LABEL_10:
      sub_1B18797B4(v14, v15, v16, v17, v18, v19, v20, v21);
      return;
    }
  }
  else
  {
    v22 = sub_1B17A0A4C((uint64_t)self->_skinner);
    if (!v22)
      return;
  }
  v23 = (int)sub_1B18F09A0(v22);
  if (objc_msgSend_count(a3, v24, v25, v26) == v23)
  {
    v30 = sub_1B181F5A8(v22);
    if ((_DWORD)v23)
    {
      v33 = 0;
      v34 = (_OWORD *)(v30 + 32);
      do
      {
        v35 = (void *)objc_msgSend_objectAtIndex_(a3, v31, v33, v32);
        objc_msgSend_VFXMatrix4Value(v35, v36, v37, v38);
        *(v34 - 2) = v39;
        *(v34 - 1) = v40;
        *v34 = v41;
        v34[1] = v42;
        v34 += 4;
        ++v33;
      }
      while (v23 != v33);
    }
    sub_1B18F055C(v22);
    if (v14)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend_count(a3, v27, v28, v29);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: number of transforms (%d) doesn't match the number of joints (%d)"), v43, v44, v45, v46, v47, v48, v23);
  }
}

- (NSArray)bones
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSArray *v27;
  uint64_t i;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = (void *)sub_1B181F5A8((uint64_t)self->_skinner);
  v18 = (void *)objc_msgSend_copy(v14, v15, v16, v17);
  v22 = objc_msgSend_count(v18, v19, v20, v21);
  v27 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v23, v22, v24);
  if (v22)
  {
    for (i = 0; i != v22; ++i)
    {
      v29 = objc_msgSend_objectAtIndex_(v18, v25, i, v26);
      v32 = objc_msgSend_nodeWithNodeRef_(VFXNode, v30, v29, v31);
      objc_msgSend_addObject_(v27, v33, v32, v34);
    }
  }

  if (v13)
    sub_1B18797B4(v13, v35, v36, v37, v38, v39, v40, v41);
  return v27;
}

- (void)setBones:(id)a3
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_arrayWithCapacity_(v6, v8, v7, v9);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v11, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(a3);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v20 = objc_msgSend_nodeRef(v19, v13, v14, v15);
        objc_msgSend_addObject_(v10, v21, v20, v22);
        objc_msgSend_setIsJoint_(v19, v23, 1, v24);
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v16);
  }
  v25 = objc_msgSend_worldRef(self, v13, v14, v15);
  if (v25)
  {
    v33 = v25;
    sub_1B187973C(v25, v26, v27, v28, v29, v30, v31, v32);
    sub_1B18E45B0((uint64_t)self->_skinner, v10);
    sub_1B18797B4(v33, v34, v35, v36, v37, v38, v39, v40);
  }
  else
  {
    sub_1B18E45B0((uint64_t)self->_skinner, v10);
  }
}

- (void)__CFObject
{
  return self->_skinner;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  unsigned int v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  _WORD *v71;
  const char *v72;
  uint64_t v73;
  float *v74;
  float v75;
  int v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  __n128 v102;
  __n128 v103;
  __n128 v104;
  __n128 v105;
  uint64_t v106;
  uint64_t v107;
  float *v108;

  v6 = objc_msgSend_skeleton(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("skeleton"));
  v11 = objc_msgSend_baseMesh(self, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, (uint64_t)CFSTR("baseMesh"));
  objc_msgSend_baseMeshBindTransform(self, v13, v14, v15);
  sub_1B18BD294(a3, CFSTR("baseMeshBindTransform"), v16, v17, v18, v19);
  v23 = (void *)objc_msgSend_bones(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)v23, (uint64_t)CFSTR("bones"));
  if ((unint64_t)objc_msgSend_count(v23, v25, v26, v27) >= 2)
  {
    if (self->_bonesAndIndicesCompression)
    {
      v31 = (_QWORD *)sub_1B17A0A4C((uint64_t)self->_skinner);
      v32 = sub_1B17EE4F8((uint64_t)v31);
      v40 = sub_1B18F0944((uint64_t)v31, v33, v34, v35, v36, v37, v38, v39);
      v41 = sub_1B18F0ED4((uint64_t)v31);
      v107 = 0;
      v108 = 0;
      v106 = 0;
      sub_1B18F091C(v31, &v107, &v106, &v108);
      v44 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v42, v40, v43);
      v48 = objc_msgSend_bytes(v44, v45, v46, v47);
      if (v40 >= 1)
      {
        v56 = v48;
        for (i = 0; i != v40; ++i)
        {
          v58 = *(__int16 *)(v106 + 2 * i);
          if (v58 >= 0x100)
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Error: Bones index too large for compressed representation : %d"), v50, v51, v52, v53, v54, v55, *(__int16 *)(v106 + 2 * i));
            LOWORD(v58) = *(_WORD *)(v106 + 2 * i);
          }
          *(_BYTE *)(v56 + i) = v58;
        }
      }
      if (v41 <= 1)
      {
        v77 = objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v49, (uint64_t)v44, v51);
      }
      else
      {
        v59 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v49, v32, v51);
        v63 = objc_msgSend_bytes(v59, v60, v61, v62);
        if (v32 >= 1)
        {
          for (j = 0; j != v32; ++j)
            *(_BYTE *)(v63 + j) = *(_DWORD *)(v107 + 8 * j + 8) - *(_QWORD *)(v107 + 8 * j);
        }
        v67 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v64, 2 * v40, v65);
        v71 = (_WORD *)objc_msgSend_bytes(v67, v68, v69, v70);
        if (v40 >= 1)
        {
          v74 = v108;
          do
          {
            v75 = *v74++;
            v76 = (int)rintf(v75 * 65535.0);
            if (v76 >= 0xFFFF)
              v76 = 0xFFFF;
            *v71++ = v76 & ~(unsigned __int16)(v76 >> 31);
            --v40;
          }
          while (v40);
        }
        v77 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v72, (uint64_t)v59, v73, v67, v44, 0);
      }
      objc_msgSend_encodeObject_forKey_(a3, v78, v77, (uint64_t)CFSTR("compressedSkinData"));
    }
    else
    {
      v79 = objc_msgSend_boneWeights(self, v28, v29, v30);
      objc_msgSend_encodeObject_forKey_(a3, v80, v79, (uint64_t)CFSTR("boneWeights"));
      v84 = objc_msgSend_boneIndices(self, v81, v82, v83);
      objc_msgSend_encodeObject_forKey_(a3, v85, v84, (uint64_t)CFSTR("boneIndices"));
    }
  }
  v86 = (void *)objc_msgSend_boneInverseBindTransforms(self, v28, v29, v30);
  v90 = objc_msgSend_count(v86, v87, v88, v89);
  if (v90)
  {
    v93 = v90;
    for (k = 0; k != v93; ++k)
    {
      v95 = (const char *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v91, (uint64_t)CFSTR("baseMeshBindTransform-%d"), v92, k);
      v98 = (void *)objc_msgSend_objectAtIndex_(v86, v96, k, v97);
      objc_msgSend_VFXMatrix4Value(v98, v99, v100, v101);
      sub_1B18BD294(a3, v95, v102, v103, v104, v105);
    }
  }
}

- (VFXSkinner)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXSkinner *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *Object;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t SkinnerWithCompressedData_bonesCount_vertexCount;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const __CFString *v67;
  const char *i;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const __CFString *v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  objc_super v93;

  v93.receiver = self;
  v93.super_class = (Class)VFXSkinner;
  v7 = -[VFXSkinner init](&v93, sel_init);
  if (v7)
  {
    v92 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
    v10 = objc_opt_class();
    v91 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("skeleton"));
    v12 = objc_opt_class();
    v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("baseMesh"));
    v17 = (void *)v16;
    if (!v16)
    {
      v18 = objc_opt_class();
      v20 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("baseModel"));
      v17 = (void *)objc_msgSend_mesh(v20, v21, v22, v23);
    }
    v24 = (void *)objc_msgSend_meshSourcesForSemantic_(v17, v14, (uint64_t)CFSTR("kGeometrySourceSemanticPosition"), v15);
    Object = (void *)objc_msgSend_firstObject(v24, v25, v26, v27);
    v32 = objc_msgSend_vectorCount(Object, v29, v30, v31);
    v33 = objc_opt_class();
    v35 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v34, v33, (uint64_t)CFSTR("bones"));
    v36 = objc_opt_class();
    v38 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v37, v36, (uint64_t)CFSTR("compressedSkinData"));
    if (v38)
    {
      v39 = v38;
      v7->_bonesAndIndicesCompression = 1;
      v40 = (void *)objc_opt_class();
      v44 = objc_msgSend_count(v35, v41, v42, v43);
      SkinnerWithCompressedData_bonesCount_vertexCount = objc_msgSend__createSkinnerWithCompressedData_bonesCount_vertexCount_(v40, v45, v39, v44, v32);
    }
    else
    {
      v50 = objc_opt_class();
      v52 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, (uint64_t)CFSTR("boneWeights"));
      v53 = objc_opt_class();
      v55 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v54, v53, (uint64_t)CFSTR("boneIndices"));
      v56 = (void *)objc_opt_class();
      SkinnerWithCompressedData_bonesCount_vertexCount = objc_msgSend__createSkinnerWithVertexCount_bones_boneWeights_boneIndices_baseMesh_(v56, v57, v32, (uint64_t)v35, v52, v55, v17);
    }
    v7->_skinner = (__CFXSkinner *)SkinnerWithCompressedData_bonesCount_vertexCount;
    if (SkinnerWithCompressedData_bonesCount_vertexCount)
    {
      v90 = (uint64_t)v17;
      v58 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v47, v48, v49);
      v62 = objc_msgSend_count(v35, v59, v60, v61);
      if (v62)
      {
        v65 = v62;
        v66 = 0;
        if (v16)
        {
          v67 = CFSTR("baseMeshBindTransform-%d");
          goto LABEL_12;
        }
        v67 = CFSTR("baseModelBindTransform-%d");
        for (i = (const char *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v63, (uint64_t)CFSTR("baseModelBindTransform-%d"), v64, 0);
              ;
              i = (const char *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v63, (uint64_t)v67, v64, v66))
        {
          *(_QWORD *)&v69 = sub_1B18BD380(a3, i).n128_u64[0];
          v73 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E0CB3B18], v70, v71, v72, v69);
          objc_msgSend_addObject_(v58, v74, v73, v75);
          if (v65 == ++v66)
            break;
LABEL_12:
          ;
        }
      }
      objc_msgSend__setBaseMesh_(v7, v63, v90, v64);
      objc_msgSend_setBones_(v7, v76, (uint64_t)v35, v77);
      if (v16)
        v78 = CFSTR("baseMeshBindTransform");
      else
        v78 = CFSTR("baseModelBindTransform");
      *(_QWORD *)&v79 = sub_1B18BD380(a3, (const char *)v78).n128_u64[0];
      objc_msgSend_setBaseMeshBindTransform_(v7, v80, v81, v82, v79);
      objc_msgSend_setBoneInverseBindTransforms_(v7, v83, (uint64_t)v58, v84);
      objc_msgSend_setSkeleton_(v7, v85, v91, v86);
      objc_msgSend_setImmediateMode_(VFXTransaction, v87, v92, v88);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

@end
