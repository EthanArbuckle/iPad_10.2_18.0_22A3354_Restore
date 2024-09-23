@implementation VFXParametricModel

- (VFXParametricModel)init
{
  const void *v3;
  VFXParametricModel *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXParametricModel *v8;
  objc_super v10;

  v3 = (const void *)-[VFXParametricModel __createCFObject]_0();
  v10.receiver = self;
  v10.super_class = (Class)VFXParametricModel;
  v4 = -[VFXModel initWithGeometryRef:](&v10, sel_initWithGeometryRef_, v3);
  v8 = v4;
  if (v4)
    objc_msgSend__syncObjCModel(v4, v5, v6, v7);
  CFRelease(v3);
  return v8;
}

- (VFXParametricModel)initWithDefaultMaterial
{
  const void *v3;
  VFXParametricModel *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXParametricModel *v8;
  objc_super v10;

  v3 = (const void *)-[VFXParametricModel __createCFObject]_0();
  v10.receiver = self;
  v10.super_class = (Class)VFXParametricModel;
  v4 = -[VFXModel initWithGeometryRef:](&v10, sel_initWithGeometryRef_, v3);
  v8 = v4;
  if (v4)
    objc_msgSend__syncObjCModel(v4, v5, v6, v7);
  CFRelease(v3);
  return v8;
}

- (id)initUninitialized
{
  const void *v3;
  VFXParametricModel *v4;
  VFXParametricModel *v5;
  objc_super v7;

  v3 = (const void *)sub_1B1918DDC(0, 0, 0);
  v7.receiver = self;
  v7.super_class = (Class)VFXParametricModel;
  v4 = -[VFXModel initWithGeometryRef:](&v7, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
    v4->_type = -1;
  CFRelease(v3);
  return v5;
}

- (id)initPresentationParametricModelWithParametricGeometryRef:(__CFXParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXParametricModel;
  return -[VFXModel initPresentationModelWithGeometryRef:](&v4, sel_initPresentationModelWithGeometryRef_, a3);
}

- (id)mesh
{
  id result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXParametricModel;
  result = -[VFXModel mesh](&v7, sel_mesh);
  if (!result)
    return (id)objc_msgSend__fetchMesh(self, v4, v5, v6);
  return result;
}

- (id)presentationModel
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  if ((objc_msgSend_isPresentationObject(self, a2, v2, v3) & 1) != 0)
    return self;
  v6 = objc_alloc((Class)objc_opt_class());
  v10 = objc_msgSend_geometryRef(self, v7, v8, v9);
  return (id)objc_msgSend_initPresentationParametricModelWithParametricGeometryRef_(v6, v11, v10, v12);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double width;
  double height;
  double length;
  const char *v8;
  uint64_t v9;
  id result;
  void *v11;
  double radius;
  const char *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  double v43;
  const char *v44;
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

  switch(self->_type)
  {
    case 0:
      v4 = (void *)MEMORY[0x1E0CB3940];
      width = self->_width;
      height = self->_height;
      length = self->_length;
      v53 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("<Cube [w=%f h=%f l=%f] %@>"), v9, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&length, v53);
      break;
    case 1:
      v11 = (void *)MEMORY[0x1E0CB3940];
      radius = self->_radius;
      v46 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("<Sphere [r=%f]> %@"), v14, *(_QWORD *)&radius, v46);
      break;
    case 2:
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = self->_width;
      v17 = self->_height;
      v52 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v15, v18, (uint64_t)CFSTR("<Plane [w=%f h=%f]> %@"), v19, *(_QWORD *)&v16, *(_QWORD *)&v17, v52);
      break;
    case 3:
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = self->_width;
      v22 = self->_height;
      v23 = self->_length;
      v54 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v20, v24, (uint64_t)CFSTR("<pyramid [w=%f h=%f l=%f] %@>"), v25, *(_QWORD *)&v21, *(_QWORD *)&v22, *(_QWORD *)&v23, v54);
      break;
    case 4:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = self->_height;
      v47 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v26, v28, (uint64_t)CFSTR("<Cylinder [h=%f]> %@"), v29, *(_QWORD *)&v27, v47);
      break;
    case 5:
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = self->_height;
      v48 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v30, v32, (uint64_t)CFSTR("<Cone [h=%f]> %@"), v33, *(_QWORD *)&v31, v48);
      break;
    case 6:
      v34 = (void *)MEMORY[0x1E0CB3940];
      v35 = self->_height;
      v49 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v34, v36, (uint64_t)CFSTR("<Tube [h=%f]> %@"), v37, *(_QWORD *)&v35, v49);
      break;
    case 7:
      v38 = (void *)MEMORY[0x1E0CB3940];
      v39 = self->_height;
      v50 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)CFSTR("<Capsule [h=%f]> %@"), v41, *(_QWORD *)&v39, v50);
      break;
    case 8:
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = self->_radius;
      v51 = objc_msgSend_modelDescription(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v42, v44, (uint64_t)CFSTR("<Torus [r=%f]> %@"), v45, *(_QWORD *)&v43, v51);
      break;
    default:
      result = CFSTR("unknown parametric type");
      break;
  }
  return result;
}

- (void)_syncObjCModel
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXParametricModel;
  -[VFXModel _syncObjCModel](&v9, sel__syncObjCModel);
  v6 = objc_msgSend_geometryRef(self, v3, v4, v5);
  objc_msgSend__syncObjCModel_(self, v7, v6, v8);
}

- (void)_syncObjCModel:(__CFXParametricGeometry *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v10;
  int64_t v11;
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
  int v26;

  v10 = sub_1B1915520(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7) - 1;
  if (v10 > 7)
    v11 = 2;
  else
    v11 = qword_1B2248068[v10];
  self->_type = v11;
  self->_width = sub_1B1915A70((uint64_t)a3, 0);
  self->_height = sub_1B1915A70((uint64_t)a3, 1);
  self->_length = sub_1B1915A70((uint64_t)a3, 2);
  self->_chamferRadius = sub_1B1915A70((uint64_t)a3, 3);
  self->_radius = sub_1B1915A70((uint64_t)a3, 4);
  self->_pipeRadius = sub_1B1915A70((uint64_t)a3, 7);
  self->_topRadius = sub_1B1915A70((uint64_t)a3, 5);
  self->_innerRadius = sub_1B1915A70((uint64_t)a3, 6);
  self->_widthSegmentCount = sub_1B191913C((int *)a3, 9);
  self->_heightSegmentCount = sub_1B191913C((int *)a3, 10);
  self->_lengthSegmentCount = sub_1B191913C((int *)a3, 11);
  self->_chamferSegmentCount = sub_1B191913C((int *)a3, 12);
  self->_pipeSegmentCount = sub_1B191913C((int *)a3, 15);
  self->_capSegmentCount = sub_1B191913C((int *)a3, 14);
  self->_cornerSegmentCount = sub_1B191913C((int *)a3, 12);
  self->_segmentCount = (int)sub_1B1919B80((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  self->_radialSegmentCount = (int)sub_1B191991C((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);
  v26 = sub_1B191913C((int *)a3, 19);
  self->_spheregeodesic = v26 == 1;
  self->_spherehemispheric = v26 == 2;
  self->_radialSpan = (float)(uint64_t)sub_1B1915A70((uint64_t)a3, 18);
  self->_primitiveType = sub_1B191913C((int *)a3, 17);
}

- (void)_setupObjCModelFrom:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
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
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t isGeodesic;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t isHemispheric;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  objc_super v139;

  v139.receiver = self;
  v139.super_class = (Class)VFXParametricModel;
  -[VFXModel _setupObjCModelFrom:](&v139, sel__setupObjCModelFrom_);
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v13 = objc_msgSend_primitiveType(a3, v10, v11, v12);
  objc_msgSend_setPrimitiveType_(self, v14, v13, v15);
  objc_msgSend_width(a3, v16, v17, v18);
  objc_msgSend_setWidth_(self, v19, v20, v21);
  objc_msgSend_height(a3, v22, v23, v24);
  objc_msgSend_setHeight_(self, v25, v26, v27);
  objc_msgSend_length(a3, v28, v29, v30);
  objc_msgSend_setLength_(self, v31, v32, v33);
  objc_msgSend_radius(a3, v34, v35, v36);
  objc_msgSend_setRadius_(self, v37, v38, v39);
  objc_msgSend_chamferRadius(a3, v40, v41, v42);
  objc_msgSend_setChamferRadius_(self, v43, v44, v45);
  objc_msgSend_topRadius(a3, v46, v47, v48);
  objc_msgSend_setTopRadius_(self, v49, v50, v51);
  objc_msgSend_pipeRadius(a3, v52, v53, v54);
  objc_msgSend_setPipeRadius_(self, v55, v56, v57);
  objc_msgSend_innerRadius(a3, v58, v59, v60);
  objc_msgSend_setInnerRadius_(self, v61, v62, v63);
  v67 = objc_msgSend_segmentCount(a3, v64, v65, v66);
  objc_msgSend_setSegmentCount_(self, v68, v67, v69);
  v73 = objc_msgSend_widthSegmentCount(a3, v70, v71, v72);
  objc_msgSend_setWidthSegmentCount_(self, v74, v73, v75);
  v79 = objc_msgSend_heightSegmentCount(a3, v76, v77, v78);
  objc_msgSend_setHeightSegmentCount_(self, v80, v79, v81);
  v85 = objc_msgSend_lengthSegmentCount(a3, v82, v83, v84);
  objc_msgSend_setLengthSegmentCount_(self, v86, v85, v87);
  v91 = objc_msgSend_cornerSegmentCount(a3, v88, v89, v90);
  objc_msgSend_setCornerSegmentCount_(self, v92, v91, v93);
  v97 = objc_msgSend_pipeSegmentCount(a3, v94, v95, v96);
  objc_msgSend_setPipeSegmentCount_(self, v98, v97, v99);
  v103 = objc_msgSend_capSegmentCount(a3, v100, v101, v102);
  objc_msgSend_setCapSegmentCount_(self, v104, v103, v105);
  v109 = objc_msgSend_radialSegmentCount(a3, v106, v107, v108);
  objc_msgSend_setRadialSegmentCount_(self, v110, v109, v111);
  objc_msgSend_radialSpan(a3, v112, v113, v114);
  objc_msgSend_setRadialSpan_(self, v115, v116, v117);
  isGeodesic = objc_msgSend_isGeodesic(a3, v118, v119, v120);
  objc_msgSend_setGeodesic_(self, v122, isGeodesic, v123);
  isHemispheric = objc_msgSend_isHemispheric(a3, v124, v125, v126);
  objc_msgSend_setHemispheric_(self, v128, isHemispheric, v129);
  v133 = objc_msgSend_parametricType(a3, v130, v131, v132);
  objc_msgSend_setParametricType_(self, v134, v133, v135);
  objc_msgSend_commitImmediate(VFXTransaction, v136, v137, v138);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *inited;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v4 = objc_alloc((Class)objc_opt_class());
  inited = (void *)objc_msgSend_initUninitialized(v4, v5, v6, v7);
  objc_msgSend__setupObjCModelFrom_(inited, v9, (uint64_t)self, v10);
  objc_msgSend__copyAttributesTo_(self, v11, (uint64_t)inited, v12);
  return inited;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (BOOL)getBoundingBoxMin:(VFXParametricModel *)self max:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  _OWORD *v5;
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
  uint64_t v18;
  const char *v19;
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
  char v32;
  int32x4_t v33;
  double v34;
  objc_super v36;
  __int128 v37;
  __int128 v38;

  v4 = (_OWORD *)v3;
  v5 = (_OWORD *)v2;
  DWORD2(v38) = 0;
  *(_QWORD *)&v38 = 0;
  DWORD2(v37) = 0;
  *(_QWORD *)&v37 = 0;
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v18 = v10;
    if (v10)
      sub_1B187973C(v10, (uint64_t)v11, v12, v13, v14, v15, v16, v17);
    if (objc_msgSend_geometryRef(self, v11, v12, v13))
    {
      v26 = objc_msgSend_geometryRef(self, v19, v20, v21);
      v32 = sub_1B1915AF8(v26, (uint64_t)&v38, (uint64_t)&v37, v27, v28, v29, v30, v31);
      if (!v18)
      {
LABEL_13:
        if (!v5)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    else
    {
      v32 = 0;
      if (!v18)
        goto LABEL_13;
    }
    sub_1B18797B4(v18, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_13;
  }
  if (objc_msgSend__hasFixedBoundingBoxExtrema(self, v7, v8, v9))
  {
    v36.receiver = self;
    v36.super_class = (Class)VFXParametricModel;
    return -[VFXModel getBoundingBoxMin:max:](&v36, sel_getBoundingBoxMin_max_, v5, v4);
  }
  switch(self->_type)
  {
    case 0:
      v33.i32[0] = LODWORD(self->_width);
      sub_1B1915E98((float32x2_t *)&v38, (float32x2_t *)&v37, *(float32x2_t *)v33.i8, self->_height, self->_length);
      break;
    case 1:
      v33.i32[0] = LODWORD(self->_radius);
      sub_1B191706C((uint64_t)&v38, (uint64_t)&v37, *(double *)v33.i64, v34);
      break;
    case 2:
      v33.i32[0] = LODWORD(self->_width);
      sub_1B19159F8((float32x2_t *)&v38, (float32x2_t *)&v37, *(float32x2_t *)v33.i8, self->_height);
      break;
    case 3:
      v33.i32[0] = LODWORD(self->_width);
      sub_1B1916880((uint64_t)&v38, (uint64_t)&v37, v33, self->_height, self->_length);
      break;
    case 4:
    case 6:
    case 7:
      sub_1B1917430((uint64_t)&v38, (uint64_t)&v37, self->_radius, self->_height);
      break;
    case 5:
      v33.i32[0] = LODWORD(self->_topRadius);
      sub_1B1917998((uint64_t)&v38, (__n64 *)&v37, *(__n64 *)v33.i8, self->_radius, self->_height);
      break;
    case 8:
      v33.i32[0] = LODWORD(self->_radius);
      sub_1B1918920((uint64_t)&v38, (__n64 *)&v37, *(__n64 *)v33.i8, self->_pipeRadius);
      break;
    default:
      break;
  }
  v32 = 1;
  if (v5)
LABEL_14:
    *v5 = v38;
LABEL_15:
  if (v4)
    *v4 = v37;
  return v32;
}

- (BOOL)getBoundingSphereCenter:(VFXParametricModel *)self radius:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  int32x4_t *v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int32x4_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
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
  BOOL v35;
  int32x4_t v37;

  v4 = (_DWORD *)v3;
  v5 = (int32x4_t *)v2;
  v37 = 0uLL;
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v12 = objc_msgSend_worldRef(self, v7, v8, v9);
    v20 = v12;
    if (v12)
      sub_1B187973C(v12, (uint64_t)v13, v14, v15, v16, v17, v18, v19);
    if (objc_msgSend_geometryRef(self, v13, v14, v15)
      && (v28 = objc_msgSend_geometryRef(self, v21, v22, v23),
          sub_1B1915B5C(v28, (uint64_t)&v37, v29, v30, v31, v32, v33, v34)))
    {
      if (v5)
        *v5 = v37;
      if (v4)
        *v4 = v37.i32[3];
      v35 = 1;
      if (!v20)
        return v35;
    }
    else
    {
      v35 = 0;
      if (!v20)
        return v35;
    }
    sub_1B18797B4(v20, (uint64_t)v21, v22, v23, v24, v25, v26, v27);
    return v35;
  }
  switch(self->_type)
  {
    case 0:
      if (sub_1B1915F34(&v37, self->_width, self->_height, self->_length))
        goto LABEL_18;
      goto LABEL_14;
    case 1:
      if (sub_1B19170D8(&v37, self->_radius))
        goto LABEL_18;
      goto LABEL_14;
    case 2:
      if (sub_1B1915A94(&v37, self->_width, self->_height))
        goto LABEL_18;
      goto LABEL_14;
    case 3:
      v10.i32[0] = LODWORD(self->_width);
      *(float *)&v11 = self->_height;
      if (sub_1B191697C(&v37, v10, v11, self->_length))
        goto LABEL_18;
      goto LABEL_14;
    case 4:
      if (sub_1B1917558(&v37, self->_radius, self->_height))
        goto LABEL_18;
      goto LABEL_14;
    case 5:
      if (sub_1B1917AD0(&v37, self->_topRadius, self->_radius, self->_height))
        goto LABEL_18;
      goto LABEL_14;
    case 6:
      if (sub_1B1917558(&v37, self->_radius, self->_height))
        goto LABEL_18;
      goto LABEL_14;
    case 7:
      v10.i32[0] = LODWORD(self->_radius);
      if (sub_1B1918460(&v37, *(double *)v10.i64, self->_height))
        goto LABEL_18;
      goto LABEL_14;
    case 8:
      if (!sub_1B19189B0(&v37, self->_radius, self->_pipeRadius))
        goto LABEL_14;
LABEL_18:
      if (v5)
        *v5 = v37;
      if (v4)
        *v4 = v37.i32[3];
      v35 = 1;
      break;
    default:
LABEL_14:
      v35 = 0;
      break;
  }
  return v35;
}

- (void)_notifyModelChanged
{
  ((void (*)(VFXParametricModel *, char *))MEMORY[0x1E0DE7D20])(self, sel__meshChanged);
}

- (void)setParametricType:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_type != a3)
  {
    self->_type = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1908A50;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)parametricType
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
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
  int v32;
  int64_t *p_type;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    p_type = &self->_type;
    return *p_type;
  }
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = (_OWORD *)objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1915520(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  if ((v32 - 1) < 8)
  {
    p_type = &qword_1B2248068[v32 - 1];
    return *p_type;
  }
  return 2;
}

- (float)width
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_width;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1916680(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setWidth:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_width != a3)
  {
    self->_width = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B1908C4C;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("width"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)height
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_height;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B19166C8(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setHeight:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_height != a3)
  {
    self->_height = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B1908DA0;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("height"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)length
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_length;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1916710(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setLength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_length != a3)
  {
    self->_length = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B1908EF4;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("length"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)radius
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_radius;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1917510(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_radius != a3)
  {
    self->_radius = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B1909048;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("radius"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)chamferRadius
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_chamferRadius;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1915D4C(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setChamferRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_chamferRadius != a3)
  {
    self->_chamferRadius = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B19091A4;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("chamferRadius"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)topRadius
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_topRadius;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1917A88(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setTopRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_topRadius != a3)
  {
    self->_topRadius = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B19092F8;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("topRadius"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)innerRadius
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_innerRadius;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1917A88(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setInnerRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_innerRadius != a3)
  {
    self->_innerRadius = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B190944C;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("innerRadius"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)pipeRadius
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_pipeRadius;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1918CBC(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setPipeRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_pipeRadius != a3)
  {
    self->_pipeRadius = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B19095A0;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("pipeRadius"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (int64_t)segmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_segmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B1919B80(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_segmentCount != a3)
  {
    self->_segmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B19096E8;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("segmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)widthSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_widthSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B19197B0(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setWidthSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_widthSegmentCount != a3)
  {
    self->_widthSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909830;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("widthSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)heightSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_heightSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B19194A4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setHeightSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_heightSegmentCount != a3)
  {
    self->_heightSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909978;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("heightSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)lengthSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_lengthSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B19195D0(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setLengthSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_lengthSegmentCount != a3)
  {
    self->_lengthSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909AC0;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("lengthSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)chamferSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_chamferSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B1919378(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setChamferSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_chamferSegmentCount != a3)
  {
    self->_chamferSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909C08;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("chamferSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)cornerSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_cornerSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B1919378(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setCornerSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_cornerSegmentCount != a3)
  {
    self->_cornerSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909D50;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("cornerSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)pipeSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_pipeSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B1919CAC(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setPipeSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_pipeSegmentCount != a3)
  {
    self->_pipeSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909E98;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("pipeSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)capSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_capSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B1919864(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setCapSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_capSegmentCount != a3)
  {
    self->_capSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1909FE0;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("capSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)radialSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_radialSegmentCount;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B191991C(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setRadialSegmentCount:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_radialSegmentCount != a3)
  {
    self->_radialSegmentCount = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B190A128;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("radialSegmentCount"), v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (float)radialSpan
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_radialSpan;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1919A48(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setRadialSpan:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  float v16;

  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_radialSpan != a3)
  {
    self->_radialSpan = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B190A27C;
    v15[3] = &unk_1E63D53A0;
    v15[4] = self;
    v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("radialSpan"), v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (int64_t)primitiveType
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_primitiveType;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B1919684(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setPrimitiveType:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];

  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B190A3BC;
    v14[3] = &unk_1E63D5440;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (BOOL)isGeodesic
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  BOOL v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_spheregeodesic;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B1919260(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setGeodesic:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_spheregeodesic != v4)
  {
    self->_spheregeodesic = v4;
    if (v4)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, (uint64_t)CFSTR("hemispheric"), v8);
      self->_spherehemispheric = 0;
      objc_msgSend_didChangeValueForKey_(self, v9, (uint64_t)CFSTR("hemispheric"), v10);
    }
    objc_msgSend__updateSphereType(self, v6, v7, v8);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (BOOL)isHemispheric
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  BOOL v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_spherehemispheric;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B19191B4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (int)_sphereType
{
  if (self->_spherehemispheric)
    return 2;
  else
    return self->_spheregeodesic;
}

- (void)_updateSphereType
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];
  int v12;

  v5 = objc_msgSend__sphereType(self, a2, v2, v3);
  v9 = objc_msgSend_worldRef(self, v6, v7, v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B190A60C;
  v11[3] = &unk_1E63D53A0;
  v12 = v5;
  v11[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
}

- (void)setHemispheric:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_spherehemispheric != v4)
  {
    self->_spherehemispheric = v4;
    if (v4)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, (uint64_t)CFSTR("geodesic"), v8);
      self->_spheregeodesic = 0;
      objc_msgSend_didChangeValueForKey_(self, v9, (uint64_t)CFSTR("geodesic"), v10);
    }
    objc_msgSend__updateSphereType(self, v6, v7, v8);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

+ (id)planeWithWidth:(float)a3 height:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_alloc((Class)objc_opt_class());
  v10 = (void *)objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 2, v12);
  *(float *)&v13 = a3;
  objc_msgSend_setWidth_(v10, v14, v15, v16, v13);
  *(float *)&v17 = a4;
  objc_msgSend_setHeight_(v10, v18, v19, v20, v17);
  return v10;
}

+ (id)cubeWithWidth:(float)a3 height:(float)a4 length:(float)a5 chamferRadius:(float)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  v10 = objc_alloc((Class)objc_opt_class());
  v14 = (void *)objc_msgSend_initWithDefaultMaterial(v10, v11, v12, v13);
  objc_msgSend_setParametricType_(v14, v15, 0, v16);
  *(float *)&v17 = a3;
  objc_msgSend_setWidth_(v14, v18, v19, v20, v17);
  *(float *)&v21 = a4;
  objc_msgSend_setHeight_(v14, v22, v23, v24, v21);
  *(float *)&v25 = a5;
  objc_msgSend_setLength_(v14, v26, v27, v28, v25);
  *(float *)&v29 = a6;
  objc_msgSend_setChamferRadius_(v14, v30, v31, v32, v29);
  return v14;
}

+ (id)unitCube
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;

  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 0;
  return (id)objc_msgSend_cubeWithWidth_height_length_chamferRadius_(a1, a2, v2, v3, v4, v5, v6, v7);
}

+ (id)pyramidWithWidth:(float)a3 height:(float)a4 length:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = objc_alloc((Class)objc_opt_class());
  v12 = (void *)objc_msgSend_initWithDefaultMaterial(v8, v9, v10, v11);
  objc_msgSend_setParametricType_(v12, v13, 3, v14);
  *(float *)&v15 = a3;
  objc_msgSend_setWidth_(v12, v16, v17, v18, v15);
  *(float *)&v19 = a4;
  objc_msgSend_setHeight_(v12, v20, v21, v22, v19);
  *(float *)&v23 = a5;
  objc_msgSend_setLength_(v12, v24, v25, v26, v23);
  return v12;
}

+ (id)cylinderWithRadius:(float)a3 height:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_alloc((Class)objc_opt_class());
  v10 = (void *)objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 4, v12);
  *(float *)&v13 = a3;
  objc_msgSend_setRadius_(v10, v14, v15, v16, v13);
  *(float *)&v17 = a4;
  objc_msgSend_setHeight_(v10, v18, v19, v20, v17);
  return v10;
}

+ (id)sphereWithRadius:(float)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithDefaultMaterial(v4, v5, v6, v7);
  objc_msgSend_setParametricType_(v8, v9, 1, v10);
  *(float *)&v11 = a3;
  objc_msgSend_setRadius_(v8, v12, v13, v14, v11);
  return v8;
}

+ (id)coneWithTopRadius:(float)a3 bottomRadius:(float)a4 height:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = objc_alloc((Class)objc_opt_class());
  v12 = (void *)objc_msgSend_initWithDefaultMaterial(v8, v9, v10, v11);
  objc_msgSend_setParametricType_(v12, v13, 5, v14);
  *(float *)&v15 = a3;
  objc_msgSend_setTopRadius_(v12, v16, v17, v18, v15);
  *(float *)&v19 = a4;
  objc_msgSend_setRadius_(v12, v20, v21, v22, v19);
  *(float *)&v23 = a5;
  objc_msgSend_setHeight_(v12, v24, v25, v26, v23);
  return v12;
}

+ (id)tubeWithInnerRadius:(float)a3 outerRadius:(float)a4 height:(float)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = objc_alloc((Class)objc_opt_class());
  v12 = (void *)objc_msgSend_initWithDefaultMaterial(v8, v9, v10, v11);
  objc_msgSend_setParametricType_(v12, v13, 6, v14);
  *(float *)&v15 = a3;
  objc_msgSend_setInnerRadius_(v12, v16, v17, v18, v15);
  *(float *)&v19 = a4;
  objc_msgSend_setRadius_(v12, v20, v21, v22, v19);
  *(float *)&v23 = a5;
  objc_msgSend_setHeight_(v12, v24, v25, v26, v23);
  return v12;
}

+ (id)capsuleWithCapRadius:(float)a3 height:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_alloc((Class)objc_opt_class());
  v10 = (void *)objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 7, v12);
  *(float *)&v13 = a3;
  objc_msgSend_setRadius_(v10, v14, v15, v16, v13);
  *(float *)&v17 = a4;
  objc_msgSend_setHeight_(v10, v18, v19, v20, v17);
  return v10;
}

+ (id)torusWithRingRadius:(float)a3 pipeRadius:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_alloc((Class)objc_opt_class());
  v10 = (void *)objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 8, v12);
  *(float *)&v13 = a3;
  objc_msgSend_setRadius_(v10, v14, v15, v16, v13);
  *(float *)&v17 = a4;
  objc_msgSend_setPipeRadius_(v10, v18, v19, v20, v17);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t isGeodesic;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t isHemispheric;
  const char *v50;
  const char *v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)VFXParametricModel;
  -[VFXModel encodeWithCoder:](&v52, sel_encodeWithCoder_);
  if (objc_msgSend_isPresentationObject(self, v5, v6, v7))
  {
    v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    objc_msgSend__syncObjCModel_(self, v12, v11, v13);
  }
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_type, (uint64_t)CFSTR("parametricType"));
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("width"), v15, self->_width);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("height"), v17, self->_height);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("length"), v19, self->_length);
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("radius"), v21, self->_radius);
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("innerRadius"), v23, self->_innerRadius);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("chamferRadius"), v25, self->_chamferRadius);
  objc_msgSend_encodeDouble_forKey_(a3, v26, (uint64_t)CFSTR("topRadius"), v27, self->_topRadius);
  objc_msgSend_encodeDouble_forKey_(a3, v28, (uint64_t)CFSTR("pipeRadius"), v29, self->_pipeRadius);
  objc_msgSend_encodeInteger_forKey_(a3, v30, self->_widthSegmentCount, (uint64_t)CFSTR("widthSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v31, self->_heightSegmentCount, (uint64_t)CFSTR("heightSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v32, self->_lengthSegmentCount, (uint64_t)CFSTR("lengthSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v33, self->_segmentCount, (uint64_t)CFSTR("segmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v34, self->_chamferSegmentCount, (uint64_t)CFSTR("chamferSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v35, self->_cornerSegmentCount, (uint64_t)CFSTR("cornerSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v36, self->_pipeSegmentCount, (uint64_t)CFSTR("pipeSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v37, self->_capSegmentCount, (uint64_t)CFSTR("capSegmentCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v38, self->_radialSegmentCount, (uint64_t)CFSTR("radialSegmentCount"));
  objc_msgSend_encodeDouble_forKey_(a3, v39, (uint64_t)CFSTR("radialSpan"), v40, self->_radialSpan);
  isGeodesic = objc_msgSend_isGeodesic(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(a3, v45, isGeodesic, (uint64_t)CFSTR("geodesic"));
  isHemispheric = objc_msgSend_isHemispheric(self, v46, v47, v48);
  objc_msgSend_encodeBool_forKey_(a3, v50, isHemispheric, (uint64_t)CFSTR("hemispheric"));
  objc_msgSend_encodeInteger_forKey_(a3, v51, self->_primitiveType, (uint64_t)CFSTR("primitiveType"));
}

- (VFXParametricModel)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXParametricModel *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  double v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  objc_super v133;

  v133.receiver = self;
  v133.super_class = (Class)VFXParametricModel;
  v7 = -[VFXModel initWithCoder:](&v133, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("parametricType"), v12);
    objc_msgSend_setParametricType_(v7, v14, v13, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("width"), v17);
    *(float *)&v18 = v18;
    objc_msgSend_setWidth_(v7, v19, v20, v21, v18);
    objc_msgSend_decodeDoubleForKey_(a3, v22, (uint64_t)CFSTR("height"), v23);
    *(float *)&v24 = v24;
    objc_msgSend_setHeight_(v7, v25, v26, v27, v24);
    objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("length"), v29);
    *(float *)&v30 = v30;
    objc_msgSend_setLength_(v7, v31, v32, v33, v30);
    objc_msgSend_decodeDoubleForKey_(a3, v34, (uint64_t)CFSTR("radius"), v35);
    *(float *)&v36 = v36;
    objc_msgSend_setRadius_(v7, v37, v38, v39, v36);
    objc_msgSend_decodeDoubleForKey_(a3, v40, (uint64_t)CFSTR("innerRadius"), v41);
    *(float *)&v42 = v42;
    objc_msgSend_setInnerRadius_(v7, v43, v44, v45, v42);
    objc_msgSend_decodeDoubleForKey_(a3, v46, (uint64_t)CFSTR("chamferRadius"), v47);
    *(float *)&v48 = v48;
    objc_msgSend_setChamferRadius_(v7, v49, v50, v51, v48);
    objc_msgSend_decodeDoubleForKey_(a3, v52, (uint64_t)CFSTR("topRadius"), v53);
    *(float *)&v54 = v54;
    objc_msgSend_setTopRadius_(v7, v55, v56, v57, v54);
    objc_msgSend_decodeDoubleForKey_(a3, v58, (uint64_t)CFSTR("pipeRadius"), v59);
    *(float *)&v60 = v60;
    objc_msgSend_setPipeRadius_(v7, v61, v62, v63, v60);
    v66 = objc_msgSend_decodeIntegerForKey_(a3, v64, (uint64_t)CFSTR("segmentCount"), v65);
    objc_msgSend_setSegmentCount_(v7, v67, v66, v68);
    v71 = objc_msgSend_decodeIntegerForKey_(a3, v69, (uint64_t)CFSTR("chamferSegmentCount"), v70);
    objc_msgSend_setChamferSegmentCount_(v7, v72, v71, v73);
    v76 = objc_msgSend_decodeIntegerForKey_(a3, v74, (uint64_t)CFSTR("widthSegmentCount"), v75);
    objc_msgSend_setWidthSegmentCount_(v7, v77, v76, v78);
    v81 = objc_msgSend_decodeIntegerForKey_(a3, v79, (uint64_t)CFSTR("heightSegmentCount"), v80);
    objc_msgSend_setHeightSegmentCount_(v7, v82, v81, v83);
    v86 = objc_msgSend_decodeIntegerForKey_(a3, v84, (uint64_t)CFSTR("lengthSegmentCount"), v85);
    objc_msgSend_setLengthSegmentCount_(v7, v87, v86, v88);
    v91 = objc_msgSend_decodeIntegerForKey_(a3, v89, (uint64_t)CFSTR("cornerSegmentCount"), v90);
    objc_msgSend_setCornerSegmentCount_(v7, v92, v91, v93);
    v96 = objc_msgSend_decodeIntegerForKey_(a3, v94, (uint64_t)CFSTR("pipeSegmentCount"), v95);
    objc_msgSend_setPipeSegmentCount_(v7, v97, v96, v98);
    v101 = objc_msgSend_decodeIntegerForKey_(a3, v99, (uint64_t)CFSTR("capSegmentCount"), v100);
    objc_msgSend_setCapSegmentCount_(v7, v102, v101, v103);
    v106 = objc_msgSend_decodeIntegerForKey_(a3, v104, (uint64_t)CFSTR("radialSegmentCount"), v105);
    objc_msgSend_setRadialSegmentCount_(v7, v107, v106, v108);
    objc_msgSend_decodeDoubleForKey_(a3, v109, (uint64_t)CFSTR("radialSpan"), v110);
    *(float *)&v111 = v111;
    objc_msgSend_setRadialSpan_(v7, v112, v113, v114, v111);
    v117 = objc_msgSend_decodeBoolForKey_(a3, v115, (uint64_t)CFSTR("geodesic"), v116);
    objc_msgSend_setGeodesic_(v7, v118, v117, v119);
    v122 = objc_msgSend_decodeBoolForKey_(a3, v120, (uint64_t)CFSTR("hemispheric"), v121);
    objc_msgSend_setHemispheric_(v7, v123, v122, v124);
    v127 = objc_msgSend_decodeIntegerForKey_(a3, v125, (uint64_t)CFSTR("primitiveType"), v126);
    objc_msgSend_setPrimitiveType_(v7, v128, v127, v129);
    objc_msgSend_setImmediateMode_(VFXTransaction, v130, v8, v131);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)__createCFObject
{
  return sub_1B1918DDC(0, &xmmword_1E63D2D98, 1);
}

- (NSArray)bridgedComponentNames
{
  return (NSArray *)(id)sub_1B2228AAC();
}

@end
