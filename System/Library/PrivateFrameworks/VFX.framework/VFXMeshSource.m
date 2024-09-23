@implementation VFXMeshSource

+ (id)geometrySourceWithMDLVertexAttribute:(id)a3 mesh:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  __CFString **v25;
  __CFString *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
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
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  float *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  float *v139;
  unint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  float *v157;
  unint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  const __CFString *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  float v167;
  _BYTE *v168;
  unint64_t v169;
  float *v170;
  _BYTE *v171;
  unsigned int v172;
  unsigned int v173;
  float v174;
  uint64_t v175;
  _BYTE *v176;
  float *v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const __CFString *v187;
  void *__p;
  _BYTE *v189;
  uint64_t v190;

  v6 = (void *)objc_msgSend_vertexDescriptor(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v13 = (objc_msgSend_format(a3, v7, v8, v9) >> 16) & 0xF;
  if (v13 >= 5)
  {
    v14 = 0;
    v15 = 2;
    if (v13 >= 9)
    {
      v16 = v13 - 11;
      if (v16)
      {
        v14 = v16 < 0xFFFFFFFE;
        v15 = 4;
      }
    }
  }
  else
  {
    v14 = 0;
    v15 = 1;
  }
  v17 = (void *)objc_msgSend_name(a3, v10, v11, v12);
  v20 = objc_msgSend_containsString_(v17, v18, *MEMORY[0x1E0CC7760], v19);
  v24 = (uint64_t *)MEMORY[0x1E0CC7730];
  if ((v20 & 1) != 0)
  {
    v25 = VFXMeshSourceSemanticPosition;
  }
  else
  {
    if ((objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E0CC7750], v23) & 1) == 0)
    {
      if ((objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E0CC7770], v23) & 1) != 0)
      {
        v25 = VFXMeshSourceSemanticTexcoord;
        goto LABEL_14;
      }
      if ((objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E0CC7768], v23) & 1) != 0)
      {
        v25 = VFXMeshSourceSemanticTangent;
        goto LABEL_14;
      }
      v162 = CFSTR("aoCoord");
      if ((objc_msgSend_isEqualToString_(v17, v21, (uint64_t)CFSTR("aoCoord"), v23) & 1) != 0
        || (v162 = CFSTR("lightmapCoord"),
            (objc_msgSend_isEqualToString_(v17, v21, (uint64_t)CFSTR("lightmapCoord"), v23) & 1) != 0))
      {
        v187 = v162;
        v25 = VFXMeshSourceSemanticTexcoord;
        goto LABEL_15;
      }
      if ((objc_msgSend_containsString_(v17, v21, *v24, v23) & 1) != 0
        || (objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E0CC7758], v23) & 1) != 0)
      {
        v25 = VFXMeshSourceSemanticColor;
        goto LABEL_14;
      }
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Unknown Model I/O semantic %@"), v22, v23, v182, v183, v184, v185, (uint64_t)v17);
    }
    v25 = VFXMeshSourceSemanticNormal;
  }
LABEL_14:
  v187 = CFSTR("unknown");
LABEL_15:
  v26 = *v25;
  v27 = (void *)objc_msgSend_layouts(v6, v21, v22, v23);
  v31 = objc_msgSend_bufferIndex(a3, v28, v29, v30);
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(v27, v32, v31, v33);
  v38 = objc_msgSend_stride(v34, v35, v36, v37);
  v42 = objc_msgSend_format(a3, v39, v40, v41);
  v46 = objc_msgSend_offset(a3, v43, v44, v45);
  v50 = (void *)objc_msgSend_name(a3, v47, v48, v49);
  if (objc_msgSend_containsString_(v50, v51, *v24, v52)
    && objc_msgSend_format(a3, v53, v54, v55) == 65540)
  {
    v56 = (void *)objc_msgSend_vertexBuffers(a4, v53, v54, v55);
    v60 = objc_msgSend_bufferIndex(a3, v57, v58, v59);
    v63 = (void *)objc_msgSend_objectAtIndexedSubscript_(v56, v61, v60, v62);
    v67 = (void *)objc_msgSend_map(v63, v64, v65, v66);
    v71 = objc_msgSend_bytes(v67, v68, v69, v70);
    v75 = (void *)objc_msgSend_vertexBuffers(a4, v72, v73, v74);
    v79 = objc_msgSend_bufferIndex(a3, v76, v77, v78);
    v82 = (void *)objc_msgSend_objectAtIndexedSubscript_(v75, v80, v79, v81);
    v86 = objc_msgSend_length(v82, v83, v84, v85);
    if (objc_msgSend_format(a3, v87, v88, v89) == 786436)
    {
      __p = 0;
      v189 = 0;
      v190 = 0;
      if (v86 >= 0x10)
      {
        sub_1B183CC28((unint64_t *)&__p, 4 * (v86 >> 4));
        v93 = 0;
        if (v86 >> 4 <= 1)
          v94 = 1;
        else
          v94 = v86 >> 4;
        v95 = 4 * v94;
        v96 = (float *)(v71 + 8);
        do
        {
          *((_BYTE *)__p + v93) = (int)(float)(*(v96 - 2) * 255.0);
          *((_BYTE *)__p + v93 + 1) = (int)(float)(*(v96 - 1) * 255.0);
          *((_BYTE *)__p + v93 + 2) = (int)(float)(*v96 * 255.0);
          *((_BYTE *)__p + v93 + 3) = (int)(float)(v96[1] * 255.0);
          v93 += 4;
          v96 += 4;
        }
        while (v95 != v93);
      }
    }
    else
    {
      if (objc_msgSend_format(a3, v90, v91, v92) != 786435)
      {
        if (objc_msgSend_format(a3, v90, v134, v135) == 65539)
        {
          __p = 0;
          v189 = 0;
          v190 = 0;
          sub_1B17F8160((uint64_t)&__p, 4 * (v86 / 3));
          v168 = __p;
          if (v86 >= 3)
          {
            if (v86 / 3 <= 1)
              v169 = 1;
            else
              v169 = v86 / 3;
            v170 = (float *)((char *)__p + 8);
            v171 = (_BYTE *)(v71 + 2);
            do
            {
              LOBYTE(v167) = *(v171 - 2);
              *(float *)&v172 = (float)LODWORD(v167) / 255.0;
              *(v170 - 2) = *(float *)&v172;
              LOBYTE(v172) = *(v171 - 1);
              *(float *)&v173 = (float)v172 / 255.0;
              *(v170 - 1) = *(float *)&v173;
              LOBYTE(v173) = *v171;
              v167 = (float)v173 / 255.0;
              *v170 = v167;
              v170[1] = 1.0;
              v170 += 4;
              v171 += 3;
              --v169;
            }
            while (v169);
          }
        }
        else
        {
          if (objc_msgSend_format(a3, v163, v164, v165) != 65540)
            return 0;
          __p = 0;
          v189 = 0;
          v190 = 0;
          sub_1B17F8160((uint64_t)&__p, v86 & 0xFFFFFFFFFFFFFFFCLL);
          v168 = __p;
          if (v86 >= 4)
          {
            v175 = v86 >> 2;
            if (v86 >> 2 <= 1)
              v175 = 1;
            v176 = (_BYTE *)(v71 + 3);
            v177 = (float *)((char *)__p + 8);
            do
            {
              LOBYTE(v174) = *(v176 - 3);
              *(float *)&v178 = (float)LODWORD(v174) / 255.0;
              *(v177 - 2) = *(float *)&v178;
              LOBYTE(v178) = *(v176 - 2);
              *(float *)&v179 = (float)v178 / 255.0;
              *(v177 - 1) = *(float *)&v179;
              LOBYTE(v179) = *(v176 - 1);
              *(float *)&v180 = (float)v179 / 255.0;
              *v177 = *(float *)&v180;
              LOBYTE(v180) = *v176;
              v174 = (float)v180 / 255.0;
              v177[1] = v174;
              v176 += 4;
              v177 += 4;
              --v175;
            }
            while (v175);
          }
        }
        v133 = (void *)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v166, (uint64_t)v168, v189 - v168);
        if (__p)
        {
          v189 = __p;
          operator delete(__p);
        }
        v46 = 0;
        v14 = 1;
        v38 = 16;
        v15 = 4;
LABEL_37:
        v97 = 4;
        if (v133)
          goto LABEL_38;
        return 0;
      }
      __p = 0;
      v189 = 0;
      v190 = 0;
      if (v86 >= 0xC)
      {
        sub_1B183CC28((unint64_t *)&__p, 4 * (v86 / 0xC));
        v136 = 0;
        if (v86 / 0xC <= 1)
          v137 = 1;
        else
          v137 = v86 / 0xC;
        v138 = 4 * v137;
        v139 = (float *)(v71 + 4);
        do
        {
          *((_BYTE *)__p + v136) = (int)(float)(*(v139 - 1) * 255.0);
          *((_BYTE *)__p + v136 + 1) = (int)(float)(*v139 * 255.0);
          *((_BYTE *)__p + v136 + 2) = (int)(float)(v139[1] * 255.0);
          *((_BYTE *)__p + v136 + 3) = -1;
          v136 += 4;
          v139 += 3;
        }
        while (v138 != v136);
      }
    }
    v133 = (void *)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v90, (uint64_t)__p, v189 - (_BYTE *)__p);
    if (__p)
    {
      v189 = __p;
      operator delete(__p);
    }
    v46 = 0;
    v14 = 0;
    v38 = 4;
    v15 = 1;
    goto LABEL_37;
  }
  v97 = v42 & 7;
  v98 = (void *)objc_msgSend_vertexBuffers(a4, v53, v54, v55);
  v102 = objc_msgSend_bufferIndex(a3, v99, v100, v101);
  v105 = (void *)objc_msgSend_objectAtIndexedSubscript_(v98, v103, v102, v104);
  v109 = (void *)objc_msgSend_map(v105, v106, v107, v108);
  v113 = objc_msgSend_bytes(v109, v110, v111, v112);
  v117 = (void *)objc_msgSend_vertexBuffers(a4, v114, v115, v116);
  v121 = objc_msgSend_bufferIndex(a3, v118, v119, v120);
  v124 = (void *)objc_msgSend_objectAtIndexedSubscript_(v117, v122, v121, v123);
  v128 = objc_msgSend_length(v124, v125, v126, v127);
  v133 = (void *)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v129, v113, v128);
  if (!v133)
    return 0;
LABEL_38:
  v140 = objc_msgSend_length(v133, v130, v131, v132);
  if (objc_msgSend_isEqualToString_(v26, v141, (uint64_t)CFSTR("kGeometrySourceSemanticTexcoord"), v142))
  {
    v146 = objc_msgSend_format(a3, v143, v144, v145);
    v150 = objc_msgSend_bytes(v133, v147, v148, v149);
    if (v146 == 786434)
    {
      if (v38 <= v140)
      {
        v157 = (float *)(v150 + v46 + 4);
        v158 = v140 / v38;
        do
        {
          *v157 = 1.0 - *v157;
          v157 = (float *)((char *)v157 + v38);
          --v158;
        }
        while (v158);
      }
    }
    else
    {
      sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Warning: unable to flip non-float2 texture coordinates, skipping\n"), v151, v152, v153, v154, v155, v156, v186);
    }
  }
  v159 = (void *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(VFXMeshSource, v143, (uint64_t)v133, (uint64_t)v26, v140 / v38, v14, v97, v15, v46, v38);
  objc_msgSend_setMkSemantic_(v159, v160, (uint64_t)v187, v161);
  return v159;
}

+ (id)geometrySourceWithMeshSourceRef:(__CFXMeshSource *)a3
{
  id result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (id)objc_msgSend_initWithMeshSource_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

- (VFXMeshSource)initWithMeshSource:(__CFXMeshSource *)a3
{
  VFXMeshSource *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  __CFString *v21;
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
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)VFXMeshSource;
  v4 = -[VFXMeshSource init](&v51, sel_init);
  if (a3)
  {
    v4->_meshSource = (__CFXMeshSource *)CFRetain(a3);
    v4->_data = (NSData *)(id)sub_1B17EDADC(a3);
    sub_1B17ED6C4((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
    v13 = v12;
    v20 = sub_1B17ED7B4((uint64_t)a3, v12, v14, v15, v16, v17, v18, v19);
    if (v20 > 8)
      v21 = 0;
    else
      v21 = off_1E63DA540[v20];
    v4->_semantic = (NSString *)v21;
    v4->_vectorCount = v13;
    v4->_componentType = BYTE6(v13);
    v4->_componentCount = HIBYTE(v13);
    v4->_mkSemantic = sub_1B17EEEB0((uint64_t)a3, v22, v23, v24, v25, v26, v27, v28);
    sub_1B193E768((uint64_t)a3, v4, v29, v30, v31, v32, v33, v34);
    v42 = sub_1B17EE3B4((uint64_t)a3, v35, v36, v37, v38, v39, v40, v41);
    v4->_dataOffset = sub_1B18F3D80(v42, v43, v44, v45, v46, v47, v48, v49);
    v4->_dataStride = sub_1B18F3B74(v42);
  }
  return v4;
}

- (VFXMeshSource)init
{
  uint64_t v2;

  return (VFXMeshSource *)objc_msgSend_initWithMeshSource_(self, a2, 0, v2);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXMeshSource *meshSource;
  __CFXMeshSource *v10;
  const char *v11;
  CGColorSpace *colorSpace;
  objc_super v13;
  _QWORD v14[5];

  meshSource = self->_meshSource;
  if (meshSource)
  {
    sub_1B193E768((uint64_t)meshSource, 0, v2, v3, v4, v5, v6, v7);
    v10 = self->_meshSource;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B19B3C08;
    v14[3] = &unk_1E63D4AB0;
    v14[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v14);
  }

  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    CFRelease(colorSpace);
    self->_colorSpace = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)VFXMeshSource;
  -[VFXMeshSource dealloc](&v13, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  const __CFString *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_semantic(self, v6, v7, v8);
  v13 = objc_msgSend_vectorCount(self, v10, v11, v12);
  v21 = sub_1B179E5A0(self->_componentType, v14, v15, v16, v17, v18, v19, v20);
  v25 = objc_msgSend_componentsPerVector(self, v22, v23, v24);
  return (id)objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("<%@: %p | semantic=%@ vectors=%d %@x%d>"), v27, v5, self, v9, v13, v21, v25);
}

+ (id)dataByConvertingDoublesToFloats:(const double *)a3 count:(int64_t)a4
{
  int64_t v4;
  uint64_t v6;
  float *v7;
  const char *v8;
  float *v9;
  double v10;
  float v11;

  v4 = a4;
  v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x7868951uLL);
  if (v4 >= 1)
  {
    v9 = v7;
    do
    {
      v10 = *a3++;
      v11 = v10;
      *v9++ = v11;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v8, (uint64_t)v7, v6, 1);
}

+ (id)dataWithVector3Array:(id)a1 count:(SEL)a2 bytesPerComponent:
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (v4)
    *v4 = 4;
  return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, v2, 16 * v3);
}

+ (id)dataWithPointArray:(const CGPoint *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5
{
  int64_t v5;
  uint64_t v7;
  float32x2_t *v8;
  const char *v9;
  float32x2_t *v10;
  float64x2_t v11;

  v5 = a4;
  if (a5)
    *a5 = 4;
  v7 = 8 * a4;
  v8 = (float32x2_t *)malloc_type_malloc(8 * a4, 0xB55F8631uLL);
  if (v5 >= 1)
  {
    v10 = v8;
    do
    {
      v11 = *(float64x2_t *)a3++;
      *v10++ = vcvt_f32_f64(v11);
      --v5;
    }
    while (v5);
  }
  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v9, (uint64_t)v8, v7, 1);
}

- (VFXMeshSource)initWithData:(id)a3 semantic:(id)a4 colorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 floatComponents:(BOOL)a7 componentsPerVector:(int64_t)a8 bytesPerComponent:(int64_t)a9 dataOffset:(int64_t)a10 dataStride:(int64_t)a11
{
  _BOOL8 v12;
  int64_t v17;
  int64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  VFXMeshSource *v26;
  int64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v45;
  objc_super v46;

  v12 = a7;
  v17 = a10;
  v18 = a11;
  v46.receiver = self;
  v46.super_class = (Class)VFXMeshSource;
  v26 = -[VFXMeshSource init](&v46, sel_init);
  if (v26)
  {
    v27 = a9;
    if (a9 == 8)
    {
      if (v17 || v18 && 8 * a8 != v18)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: meshSourceWithData: interleaved buffers as doubles are not supported"), v20, v21, v22, v23, v24, v25, v45);
        return 0;
      }
      v28 = (void *)objc_opt_class();
      v32 = objc_msgSend_bytes(a3, v29, v30, v31);
      a3 = (id)objc_msgSend_dataByConvertingDoublesToFloats_count_(v28, v33, v32, a8 * a6);
      v18 = 4 * a8;
      a11 = 4 * a8;
      v27 = 4;
    }
    if (a5 && objc_msgSend_isEqualToString_(a4, v19, (uint64_t)CFSTR("kGeometrySourceSemanticColor"), v21))
      a3 = (id)objc_msgSend_dataByConvertingColorData_colorSpace_newColorSpace_vectorCount_componentsPerVector_bytesPerComponent_dataOffset_dataStride_newDataOffset_newDataStride_(v26, v34, (uint64_t)a3, (uint64_t)a5, &v26->_colorSpace, a6, a8, v27, v17, v18, &a10, &a11);
    v26->_data = (NSData *)a3;
    v26->_semantic = (NSString *)objc_msgSend_copy(a4, v35, v36, v37);
    v26->_vectorCount = a6;
    v26->_componentType = sub_1B179EA58(v27, 1, v12, v38, v39, v40, v41, v42);
    v26->_componentCount = a8;
    v43 = a11;
    if (!a11)
      v43 = v27 * a8;
    v26->_dataOffset = a10;
    v26->_dataStride = v43;
  }
  return v26;
}

- (VFXMeshSource)initWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  unsigned __int16 v10;
  int v11;
  VFXMeshSource *v15;
  int64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v10 = a7;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)VFXMeshSource;
  v15 = -[VFXMeshSource init](&v28, sel_init);
  if (v15)
  {
    v16 = a9;
    v15->_data = (NSData *)a3;
    v15->_semantic = (NSString *)objc_msgSend_copy(a4, v17, v18, v19);
    v15->_vectorCount = a5;
    v15->_componentType = v11;
    v15->_componentCount = v10;
    v15->_dataOffset = a8;
    if (!a9)
      v16 = sub_1B179E250(v11, v20, v21, v22, v23, v24, v25, v26) * v15->_componentCount;
    v15->_dataStride = v16;
  }
  return v15;
}

- (VFXMeshSource)initWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8
{
  VFXMeshSource *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
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
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)VFXMeshSource;
  v14 = -[VFXMeshSource init](&v48, sel_init);
  if (v14)
  {
    v14->_mtlBuffer = (MTLBuffer *)a3;
    v14->_semantic = (NSString *)objc_msgSend_copy(a5, v15, v16, v17);
    v14->_vectorCount = a6;
    v14->_mtlVertexFormat = a4;
    v25 = sub_1B189D5B4(a4, v18, v19, v20, v21, v22, v23, v24);
    v14->_componentType = sub_1B179E600(v25, v26, v27, v28, v29, v30, v31, v32);
    v14->_componentCount = sub_1B179E64C(v25, v33, v34, v35, v36, v37, v38, v39);
    v14->_dataOffset = a7;
    if (!a8)
      a8 = sub_1B179E250(v25, v40, v41, v42, v43, v44, v45, v46);
    v14->_dataStride = a8;
  }
  return v14;
}

+ (VFXMeshSource)meshSourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10
{
  _BOOL8 v12;
  id v16;
  const char *v17;

  v12 = a6;
  v16 = objc_alloc((Class)a1);
  return (VFXMeshSource *)(id)objc_msgSend_initWithData_semantic_colorSpace_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(v16, v17, (uint64_t)a3, (uint64_t)a4, 0, a5, v12, a7, a8, a9, a10);
}

+ (id)_modelSourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  uint64_t v11;
  id v15;
  const char *v16;

  v11 = a6;
  v15 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithData_semantic_vectorCount_componentType_componentCount_dataOffset_dataStride_(v15, v16, (uint64_t)a3, (uint64_t)a4, a5, v11, a7, a8, a9);
}

+ (VFXMeshSource)meshSourceWithVertices:(id)a1 count:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v9;

  v4 = v3;
  v9 = 0;
  v6 = objc_msgSend_dataWithVector3Array_count_bytesPerComponent_(a1, a2, v2, v3, &v9);
  return (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(a1, v7, v6, (uint64_t)CFSTR("kGeometrySourceSemanticPosition"), v4, 1, 3, v9, 0, 16);
}

+ (VFXMeshSource)meshSourceWithNormals:(id)a1 count:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v9;

  v4 = v3;
  v9 = 0;
  v6 = objc_msgSend_dataWithVector3Array_count_bytesPerComponent_(a1, a2, v2, v3, &v9);
  return (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(a1, v7, v6, (uint64_t)CFSTR("kGeometrySourceSemanticNormal"), v4, 1, 3, v9, 0, 16);
}

+ (VFXMeshSource)meshSourceWithTextureCoordinates:(const CGPoint *)a3 count:(int64_t)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v9;

  v9 = 0;
  v6 = objc_msgSend_dataWithPointArray_count_bytesPerComponent_(a1, a2, (uint64_t)a3, a4, &v9);
  return (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(a1, v7, v6, (uint64_t)CFSTR("kGeometrySourceSemanticTexcoord"), a4, 1, 2, v9, 0, 0);
}

- (id)dataByConvertingColorData:(id)a3 colorSpace:(CGColorSpace *)a4 newColorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10 newDataOffset:(int64_t *)a11 newDataStride:(int64_t *)a12
{
  int64_t *v17;
  int64_t v18;
  CGColorSpace *ColorSpace;
  CGColorSpace *v20;
  CGColorSpace *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v35;
  id v36;

  v17 = a12;
  v18 = a9;
  sub_1B179CFC4();
  ColorSpace = (CGColorSpace *)CGColorTransformGetColorSpace();
  v20 = *a5;
  if (*a5 != ColorSpace)
  {
    if (v20)
    {
      CFRelease(v20);
      *a5 = 0;
    }
    if (ColorSpace)
      v21 = (CGColorSpace *)CFRetain(ColorSpace);
    else
      v21 = 0;
    *a5 = v21;
  }
  if (CFEqual(a4, ColorSpace))
    goto LABEL_19;
  v25 = a8 * a7;
  if (a10)
    v26 = a10;
  else
    v26 = a8 * a7;
  v36 = a3;
  v27 = objc_msgSend_bytes(a3, v22, v23, v24);
  v35 = v25 * a6;
  v28 = (char *)malloc_type_malloc(v25 * a6, 0x6123C480uLL);
  if (!CGColorTransformConvertData())
  {
    free(v28);
    v18 = a9;
    v17 = a12;
    a3 = v36;
LABEL_19:
    *a11 = v18;
    *v17 = a10;
    return a3;
  }
  *a11 = 0;
  *a12 = v25;
  if (a7 != 4)
    return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v29, (uint64_t)v28, v35, 1);
  v30 = (uint64_t)v28;
  if (a6 >= 1)
  {
    v31 = v27;
    v32 = &v28[3 * a8];
    v33 = (char *)(v31 + 3 * a8 + a9);
    do
    {
      memcpy(v32, v33, a8);
      v32 += v25;
      v33 += v26;
      --a6;
    }
    while (a6);
  }
  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v29, v30, v35, 1);
}

+ (id)geometrySourceWithColorComponents:(const float *)a3 count:(int64_t)a4 hasAlpha:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  _BOOL4 v7;
  const void *ColorSpace;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _DWORD *v15;
  const char *v16;
  _DWORD *v17;
  const float *v18;
  int64_t v19;
  int v20;
  uint64_t v21;
  const char *v22;
  id v23;
  const char *v24;
  int v26;
  int v27;
  id v28;

  v7 = a5;
  sub_1B179CFC4();
  ColorSpace = (const void *)CGColorTransformGetColorSpace();
  if (!a6)
    a6 = (CGColorSpace *)sub_1B179D1A8();
  if (v7)
    v12 = 4;
  else
    v12 = 3;
  if (CFEqual(a6, ColorSpace))
  {
    v14 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)a3, 4 * v12 * a4);
  }
  else
  {
    v28 = a1;
    v15 = malloc_type_malloc(4 * v12 * a4, 0x795F62BuLL);
    v27 = 4 * v12;
    v26 = 4 * v12;
    if (CGColorTransformConvertData())
    {
      if (a4 >= 1 && v7)
      {
        v17 = v15 + 3;
        v18 = a3 + 3;
        v19 = a4;
        do
        {
          v20 = *(_DWORD *)v18;
          v18 += 4;
          *v17 = v20;
          v17 += 4;
          --v19;
        }
        while (v19);
      }
      v21 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v16, (uint64_t)v15, 4 * v12 * a4, 1, v26, v15, 96, v27);
    }
    else
    {
      free(v15);
      v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v22, (uint64_t)a3, 4 * v12 * a4, v26, v15, 96, v27);
    }
    v14 = v21;
    a1 = v28;
  }
  v23 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithData_semantic_colorSpace_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(v23, v24, v14, (uint64_t)CFSTR("kGeometrySourceSemanticColor"), ColorSpace, a4, 1, v12, 4, 0, 4 * v12);
}

+ (id)geometrySourceWithColorData:(id)a3 colorSpace:(CGColorSpace *)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10
{
  _BOOL8 v12;
  id v16;
  const char *v17;

  v12 = a6;
  v16 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithData_semantic_colorSpace_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(v16, v17, (uint64_t)a3, (uint64_t)CFSTR("kGeometrySourceSemanticColor"), a4, a5, v12, a7, a8, a9, a10);
}

+ (VFXMeshSource)meshSourceWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8
{
  id v14;
  const char *v15;
  uint64_t v17;

  if (a4)
  {
    v14 = objc_alloc((Class)a1);
    return (VFXMeshSource *)(id)objc_msgSend_initWithBuffer_vertexFormat_semantic_vertexCount_dataOffset_dataStride_(v14, v15, (uint64_t)a3, a4, a5, a6, a7, a8);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: meshSourceWithBuffer - invalid vertex format"), (uint64_t)a3, 0, (uint64_t)a5, a6, a7, a8, v17);
    return 0;
  }
}

+ (id)_modelSourceWithSource:(id)a3 vertexFormat:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
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
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v26;

  if (a3)
  {
    if (a4)
    {
      v10 = sub_1B189D5B4(a4, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7);
      v14 = objc_msgSend_meshSource(a3, v11, v12, v13);
      v20 = sub_1B17EE7BC(v14, v10, 0, v15, v16, v17, v18, v19);
      if (v20)
      {
        v21 = v20;
        v22 = objc_alloc((Class)a1);
        return (id)objc_msgSend_initWithMeshSource_(v22, v23, v21, v24);
      }
      NSLog(CFSTR("_modelSourceWithSource - Conversion failed"));
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: _modelSourceWithSource - invalid vertex format"), (uint64_t)a3, 0, v4, v5, v6, v7, v26);
    }
  }
  return 0;
}

- (BOOL)_encodeDataAsHalf
{
  return self->_encodeDataAsHalf;
}

- (void)set_encodeDataAsHalf:(BOOL)a3
{
  self->_encodeDataAsHalf = a3;
}

- (id)mkSemantic
{
  unint64_t mkSemantic;
  id *v3;

  mkSemantic = (char)self->_mkSemantic;
  if (mkSemantic > 9)
    v3 = (id *)MEMORY[0x1E0CC7730];
  else
    v3 = (id *)qword_1E63DA588[mkSemantic];
  return *v3;
}

- (void)setMkSemantic:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  __CFXMeshSource *meshSource;

  if ((objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x1E0CC7720], v3) & 1) != 0)
  {
    v13 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CC7760], v8) & 1) != 0)
  {
    v13 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v14, *MEMORY[0x1E0CC7770], v8) & 1) != 0)
  {
    v13 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v15, *MEMORY[0x1E0CC7750], v8) & 1) != 0)
  {
    v13 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v16, (uint64_t)CFSTR("aoCoord"), v8) & 1) != 0)
  {
    v13 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v17, *MEMORY[0x1E0CC7730], v8) & 1) != 0)
  {
    v13 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v18, *MEMORY[0x1E0CC7758], v8) & 1) != 0)
  {
    v13 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v19, *MEMORY[0x1E0CC7768], v8) & 1) != 0)
  {
    v13 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v20, *MEMORY[0x1E0CC7728], v8) & 1) != 0)
  {
    v13 = 8;
  }
  else if (objc_msgSend_isEqualToString_(a3, v21, (uint64_t)CFSTR("lightmapCoord"), v8))
  {
    v13 = 9;
  }
  else
  {
    v13 = 0;
  }
  self->_mkSemantic = v13;
  meshSource = self->_meshSource;
  if (meshSource)
    sub_1B17EEEF8((uint64_t)meshSource, v13, v7, v8, v9, v10, v11, v12);
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

  result = self->_data;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend_meshSource(self, a2, v2, v3);
  v12 = sub_1B17EDAE0(v4, v5, v6, v7, v8, v9, v10, v11);
  sub_1B17EE9C8(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (NSString)semantic
{
  return self->_semantic;
}

- (int64_t)vectorCount
{
  return self->_vectorCount;
}

- (BOOL)floatComponents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1B179E6DC(self->_componentType, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int64_t)componentsPerVector
{
  return self->_componentCount;
}

- (int64_t)bytesPerComponent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1B179E694(self->_componentType, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int64_t)dataOffset
{
  return self->_dataOffset;
}

- (int64_t)dataStride
{
  return self->_dataStride;
}

- (signed)_componentType
{
  return self->_componentType;
}

- (void)_clearCFXCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXMeshSource *meshSource;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFXMeshSource *v16;
  __CFXMeshSource *v17;

  if (self->_data)
  {
    meshSource = self->_meshSource;
    if (meshSource)
    {
      if (!sub_1B18472DC((uint64_t)meshSource, a2, v2, v3, v4, v5, v6, v7))
      {
        v16 = self->_meshSource;
        if (v16)
        {
          sub_1B193E768((uint64_t)v16, 0, v10, v11, v12, v13, v14, v15);
          v17 = self->_meshSource;
          if (v17)
          {
            CFRelease(v17);
            self->_meshSource = 0;
          }
        }
      }
    }
  }
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

- (__CFXMeshSource)meshSource
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLBuffer *mtlBuffer;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  __CFXMeshSource *v14;
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
  __CFXMeshSource *meshSource;
  uint64_t v28;

  if (!self->_meshSource)
  {
    if (self->_componentType)
    {
      mtlBuffer = self->_mtlBuffer;
      v11 = sub_1B19B38EC(self->_semantic, a2, v2, v3);
      if (mtlBuffer)
        v14 = (__CFXMeshSource *)sub_1B189E744(v11, self->_mtlBuffer, self->_mtlVertexFormat, self->_vectorCount, self->_dataStride, self->_dataOffset, v12, v13);
      else
        v14 = (__CFXMeshSource *)sub_1B17ED264(v11, self->_data, self->_componentType, self->_componentCount, self->_vectorCount, self->_dataStride, self->_dataOffset, v13);
      self->_meshSource = v14;
      sub_1B17EEEF8((uint64_t)v14, self->_mkSemantic, v15, v16, v17, v18, v19, v20);
      meshSource = self->_meshSource;
      if (meshSource)
        sub_1B193E768((uint64_t)meshSource, self, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not create mesh source"), v2, v3, v4, v5, v6, v7, v28);
    }
  }
  return self->_meshSource;
}

- (id)_uninterleaveData:(id)a3 count:(unint64_t)a4 srcOffset:(unint64_t)a5 srcStride:(unint64_t)a6 dstStride:(unint64_t)a7
{
  unint64_t v10;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  v10 = a4;
  v12 = a7 * a4;
  v13 = (void *)objc_msgSend_dataWithCapacity_(MEMORY[0x1E0C99DF0], a2, a7 * a4, a4);
  objc_msgSend_setLength_(v13, v14, v12, v15);
  v19 = (char *)objc_msgSend_mutableBytes(v13, v16, v17, v18);
  v23 = objc_msgSend_bytes(a3, v20, v21, v22);
  if (v10)
  {
    v24 = (char *)(v23 + a5);
    do
    {
      memcpy(v19, v24, a7);
      v24 += a6;
      v19 += a7;
      --v10;
    }
    while (v10);
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  int v6;
  int64_t dataStride;
  int64_t dataOffset;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int componentType;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  int64_t v31;
  int componentCount;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const void *v40;
  uint64_t v41;
  unsigned int v42;
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
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  NSString *semantic;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  CGColorSpace *colorSpace;
  CFPropertyListRef v92;
  const char *v93;
  unsigned __int8 v94;
  uint64_t v95;
  uint64_t v96;

  LOWORD(v6) = self->_componentType;
  dataOffset = self->_dataOffset;
  dataStride = self->_dataStride;
  v9 = objc_msgSend_data(self, a2, (uint64_t)a3, v3);
  if (v9)
  {
    v17 = (void *)v9;
    if (self->_encodeDataAsHalf)
    {
      componentType = (unsigned __int16)self->_componentType;
      if (componentType != (unsigned __int16)sub_1B179E600((__int16)componentType, (uint64_t)v10, v11, v12, v13, v14, v15, v16))sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. VFXMeshSource should only store a base type"), v19, v20, v21, v22, v23, v24, (uint64_t)"_componentType == CFXBaseTypeGetComponentType(_componentType)");
      if (self->_componentType == 14)
      {
        v25 = v17;
      }
      else
      {
        componentCount = self->_componentCount;
        if ((componentCount - 2) >= 3)
        {
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. vImageEncodeVectorHalf only supports half2/3/4"), v19, v20, v21, v22, v23, v24, (uint64_t)"_componentCount >= 2 && _componentCount <= 4");
          componentCount = self->_componentCount;
        }
        v40 = (const void *)sub_1B17EE7BC((uint64_t)self->_meshSource, *(__int16 *)&asc_1B236F40A[2 * componentCount - 4], 0, v20, v21, v22, v23, v24);
        if (!v40)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v34, v35, v36, v37, v38, v39, (uint64_t)"halfSource");
        v41 = sub_1B17EE3B4((uint64_t)v40, v33, v34, v35, v36, v37, v38, v39);
        v42 = sub_1B18F3854(v41);
        v6 = sub_1B179E600(v42, v43, v44, v45, v46, v47, v48, v49);
        dataStride = sub_1B18F3B74(v41);
        dataOffset = sub_1B18F3D80(v41, v50, v51, v52, v53, v54, v55, v56);
        if (v6 != 14)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Consistenty check issue during conversion for vImageEncodeVectorHalf"), v58, v59, v60, v61, v62, v63, (uint64_t)"encodedComponentType == kCFXBaseTypeHalf");
        sub_1B179E250(v6, v57, v58, v59, v60, v61, v62, v63);
        v25 = (id)sub_1B17EDADC(v40);
        CFRelease(v40);
      }
      v96 = vImageEncodeVectorOptionsCreate();
      vImageEncodeVectorOptionsSetQuantization();
      v95 = 0;
      objc_msgSend_bytes(v25, v64, v65, v66);
      objc_msgSend_length(v25, v67, v68, v69);
      v70 = vImageEncodeVectorHalf();

      if (!v70)
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. vImageEncodeVectorHalf failed to write bytes"), v71, v72, v73, v74, v75, v76, (uint64_t)"compressedSize > 0");
      vImageEncodeVectorOptionsFree();
      v78 = objc_msgSend_dataWithBytesNoCopy_length_(MEMORY[0x1E0C99D50], v77, v95, v70);
      objc_msgSend_encodeObject_forKey_(a3, v79, v78, (uint64_t)CFSTR("cdata"));
    }
    else
    {
      v26 = objc_msgSend_bytesPerComponent(self, v10, v11, v12);
      v31 = objc_msgSend_componentsPerVector(self, v27, v28, v29) * v26;
      if (v31 < self->_dataStride)
      {
        v17 = (void *)objc_msgSend__uninterleaveData_count_srcOffset_srcStride_dstStride_(self, v30, (uint64_t)v17, self->_vectorCount, self->_dataOffset);
        dataOffset = 0;
        dataStride = v31;
      }
      objc_msgSend_encodeObject_forKey_(a3, v30, (uint64_t)v17, (uint64_t)CFSTR("data"));
    }
  }
  semantic = self->_semantic;
  if (semantic)
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)semantic, (uint64_t)CFSTR("semantic"));
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_vectorCount, (uint64_t)CFSTR("vectorCount"));
  v95 = 0;
  v96 = 0;
  v94 = 0;
  if (sub_1B179E998((__int16)v6, &v96, &v95, &v94, v81, v82, v83, v84))
  {
    objc_msgSend_encodeBool_forKey_(a3, v85, v94, (uint64_t)CFSTR("floatComponents"));
    objc_msgSend_encodeInteger_forKey_(a3, v86, v96, (uint64_t)CFSTR("bytesPerComponent"));
  }
  else
  {
    objc_msgSend_encodeInteger_forKey_(a3, v85, (__int16)v6, (uint64_t)CFSTR("componentType"));
  }
  objc_msgSend_encodeInteger_forKey_(a3, v87, self->_componentCount, (uint64_t)CFSTR("componentsPerVector"));
  objc_msgSend_encodeInteger_forKey_(a3, v88, dataOffset, (uint64_t)CFSTR("dataOffset"));
  objc_msgSend_encodeInteger_forKey_(a3, v89, dataStride, (uint64_t)CFSTR("dataStride"));
  objc_msgSend_encodeInt_forKey_(a3, v90, self->_mkSemantic, (uint64_t)CFSTR("mkSemantic"));
  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    v92 = CGColorSpaceCopyPropertyList(colorSpace);
    objc_msgSend_encodeObject_forKey_(a3, v93, (uint64_t)v92, (uint64_t)CFSTR("colorSpace"));
    CFRelease(v92);
  }
}

- (VFXMeshSource)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMeshSource *v7;
  _UNKNOWN **v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  signed __int16 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int componentType;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  size_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  NSData *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  const void *v81;
  CGColorSpaceRef v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  CGColorSpaceRef v90;
  uint64_t data;
  int64_t vectorCount;
  uint64_t componentCount;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  __CFXMeshSource *meshSource;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t dataOffset;
  objc_super v173;

  v173.receiver = self;
  v173.super_class = (Class)VFXMeshSource;
  v7 = -[VFXMeshSource init](&v173, sel_init);
  if (!v7)
    return v7;
  v8 = &off_1E636B000;
  v9 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
  objc_msgSend_setImmediateMode_(VFXTransaction, v10, 1, v11);
  v12 = objc_opt_class();
  v14 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("semantic"));
  v7->_semantic = v14;
  if (objc_msgSend_isEqualToString_(v14, v15, (uint64_t)CFSTR("kGeometrySourceSemanticVertex"), v16))
  {

    v7->_semantic = (NSString *)CFSTR("kGeometrySourceSemanticPosition");
  }
  v7->_vectorCount = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("vectorCount"), v18);
  v7->_dataOffset = objc_msgSend_decodeIntegerForKey_(a3, v19, (uint64_t)CFSTR("dataOffset"), v20);
  v7->_dataStride = objc_msgSend_decodeIntegerForKey_(a3, v21, (uint64_t)CFSTR("dataStride"), v22);
  v7->_componentCount = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("componentsPerVector"), v24);
  v27 = objc_msgSend_decodeIntegerForKey_(a3, v25, (uint64_t)CFSTR("componentType"), v26);
  v7->_componentType = v27;
  if (!v27)
  {
    v30 = objc_msgSend_decodeBoolForKey_(a3, v28, (uint64_t)CFSTR("floatComponents"), v29);
    v33 = objc_msgSend_decodeIntegerForKey_(a3, v31, (uint64_t)CFSTR("bytesPerComponent"), v32);
    v7->_componentType = sub_1B179EA58(v33, 1, v30, v34, v35, v36, v37, v38);
  }
  v39 = objc_opt_class();
  v41 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v40, v39, (uint64_t)CFSTR("cdata"));
  v7->_encodeDataAsHalf = v41 != 0;
  if (v41)
  {
    v49 = (void *)v41;
    componentType = (unsigned __int16)v7->_componentType;
    if (componentType == (unsigned __int16)sub_1B179E600((__int16)componentType, v42, v43, v44, v45, v46, v47, v48))
    {
      if (v7->_componentType == 14)
      {
        sub_1B179E250(14, v51, v52, v53, v54, v55, v56, v57);
        v58 = v7->_dataStride * v7->_vectorCount;
        v59 = malloc_type_malloc(v58, 0x42562927uLL);
        objc_msgSend_bytes(v49, v60, v61, v62);
        objc_msgSend_length(v49, v63, v64, v65);
        if (vImageDecodeVectorHalf() != v58)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Decoding failed"), v66, v67, v68, v69, v70, v71, (uint64_t)"decompressedSize == decompressedDataCapacity");
        v72 = objc_alloc(MEMORY[0x1E0C99D50]);
        v74 = (NSData *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v72, v73, (uint64_t)v59, v58, 1);
        v9 = v9;
        v8 = &off_1E636B000;
        goto LABEL_13;
      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: VFXMeshSource should only store a base type"), v52, v53, v54, v55, v56, v57, dataOffset);
      if (v7->_componentType == 14)
      {
LABEL_23:
        objc_msgSend_setImmediateMode_(VFXTransaction, v116, v9, v53);

        return 0;
      }
    }
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Data is marked as compressed but does not contain half components"), v52, v53, v54, v55, v56, v57, dataOffset);
    goto LABEL_23;
  }
  v77 = objc_opt_class();
  v74 = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v78, v77, (uint64_t)CFSTR("data"));
LABEL_13:
  v7->_data = v74;
  v7->_mkSemantic = objc_msgSend_decodeIntForKey_(a3, v75, (uint64_t)CFSTR("mkSemantic"), v76);
  v81 = (const void *)objc_msgSend_decodePropertyListForKey_(a3, v79, (uint64_t)CFSTR("colorSpace"), v80);
  if (v81)
  {
    v82 = CGColorSpaceCreateWithPropertyList(v81);
    if (v82)
    {
      v90 = v82;
      data = (uint64_t)v7->_data;
      vectorCount = v7->_vectorCount;
      componentCount = v7->_componentCount;
      v94 = sub_1B179E694(v7->_componentType, v83, v84, v85, v86, v87, v88, v89);
      dataOffset = v7->_dataOffset;
      v7->_data = (NSData *)objc_msgSend_dataByConvertingColorData_colorSpace_newColorSpace_vectorCount_componentsPerVector_bytesPerComponent_dataOffset_dataStride_newDataOffset_newDataStride_(v7, v95, data, (uint64_t)v90, &v7->_colorSpace, vectorCount, componentCount, v94);
      CFRelease(v90);
    }
  }
  if ((+[VFXView _isMetalSupported]_0() & 1) == 0)
  {
    v99 = (unsigned __int16)v7->_componentType;
    if (v99 <= 0x17 && ((1 << v99) & 0xC04000) != 0)
    {
      v100 = objc_msgSend_meshSource(v7, v96, v97, v98);
      v108 = sub_1B17ED7B4(v100, v101, v102, v103, v104, v105, v106, v107);
      if ((v7->_componentType & 0xFFFE) == 0x16)
      {
        v115 = 4;
        v7->_componentCount = 4;
      }
      else
      {
        v115 = v7->_componentCount;
      }
      if (v115 == 4 && v108 <= 1)
      {
        v115 = 3;
        v7->_componentCount = 3;
      }
      v117 = sub_1B179E720(1, v115, v109, v110, v111, v112, v113, v114);
      v123 = sub_1B17EE7BC(v100, v117, 0, v118, v119, v120, v121, v122);
      if (v123)
      {
        v130 = v123;
        meshSource = v7->_meshSource;
        if (meshSource)
          CFRelease(meshSource);
        v7->_meshSource = (__CFXMeshSource *)v130;

        v7->_data = (NSData *)(id)sub_1B17EDADC(v130);
        sub_1B17ED6C4(v130, v132, v133, v134, v135, v136, v137, v138);
        v7->_componentType = 1;
        v7->_componentCount = HIBYTE(v139);
        sub_1B193E768(v130, v7, v140, v141, v142, v143, v144, v145);
        v153 = sub_1B17EE3B4(v130, v146, v147, v148, v149, v150, v151, v152);
        v7->_dataOffset = sub_1B18F3D80(v153, v154, v155, v156, v157, v158, v159, v160);
        v7->_dataStride = sub_1B18F3B74(v153);
      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: _modelSourceWithSource - Conversion failed"), v124, v125, v126, v127, v128, v129, dataOffset);
      }
    }
  }
  v161 = objc_msgSend_bytesPerComponent(v7, v96, v97, v98);
  v165 = objc_msgSend_componentsPerVector(v7, v162, v163, v164);
  if (objc_msgSend_length(v7->_data, v166, v167, v168) < (unint64_t)(v7->_dataOffset
                                                                           + v165 * v161
                                                                           + (v7->_vectorCount - 1) * v7->_dataStride))
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v169, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Geometry source has invalid bounds"));
  objc_msgSend_setImmediateMode_(v8[223], v169, v9, v170);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableData
{
  return self->_data;
}

@end
