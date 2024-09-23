@implementation _VFXSnapshotWindow

- (id)vfxView
{
  return objc_loadWeakRetained(&qword_1ED4BFF30);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_VFXSnapshotWindow;
  -[_VFXSnapshotWindow dealloc](&v2, sel_dealloc);
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id result;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _VFXSnapshotWindow *i;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  objc_super v36;
  char v37;

  y = a3.y;
  x = a3.x;
  if (objc_msgSend_vfxView(self, a2, (uint64_t)a4, (uint64_t)a5))
  {
    v12 = (void *)objc_msgSend_layer(self, v9, v10, v11);
    objc_msgSend_convertPoint_toLayer_(v12, v13, 0, v14, x, y);
    v37 = 0;
    objc_msgSend__warpPoint_outOfBounds_(self, v15, (uint64_t)&v37, v16);
    result = 0;
    if (!v37)
    {
      v36.receiver = self;
      v36.super_class = (Class)_VFXSnapshotWindow;
      for (i = (_VFXSnapshotWindow *)-[_VFXSnapshotWindow hitTest:withEvent:](&v36, sel_hitTest_withEvent_, a4);
            i;
            i = (_VFXSnapshotWindow *)objc_msgSend_superview(i, v32, v33, v34))
      {
        v22 = (void *)objc_msgSend_gestureRecognizers(i, v18, v19, v20);
        if (objc_msgSend_count(v22, v23, v24, v25))
          break;
        if ((objc_msgSend_isMultipleTouchEnabled(i, v26, v27, v28) & 1) != 0)
          break;
        if ((objc_msgSend_canBecomeFirstResponder(i, v29, v30, v31) & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      if (i == self)
        return 0;
      else
        return i;
    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)_VFXSnapshotWindow;
    return -[_VFXSnapshotWindow hitTest:withEvent:](&v35, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

- (CGPoint)_warpPoint:(CGPoint)a3 outOfBounds:(BOOL *)a4
{
  uint64_t v4;
  double y;
  double x;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  __n128 v87;
  __n128 v88;
  __n128 v89;
  __n128 v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  float v95;
  unint64_t v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  double v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v9 = (void *)objc_msgSend_vfxView(self, a2, (uint64_t)a4, v4);
  if (v9)
  {
    v12 = v9;
    objc_msgSend_convertPoint_fromView_(v9, v10, 0, v11, x, y);
    v15 = (void *)objc_msgSend_hitTest_options_(v12, v13, 0, v14);
    if (!objc_msgSend_count(v15, v16, v17, v18))
      goto LABEL_8;
    v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(v15, v19, 0, v20);
    v25 = (void *)objc_msgSend_node(v21, v22, v23, v24);
    v29 = (void *)objc_msgSend_model(v25, v26, v27, v28);
    v33 = (void *)objc_msgSend_materials(v29, v30, v31, v32);
    if (objc_msgSend_count(v33, v34, v35, v36))
    {
      v40 = (void *)objc_msgSend_materials(v29, v37, v38, v39);
      v44 = objc_msgSend_geometryIndex(v21, v41, v42, v43);
      v48 = (void *)objc_msgSend_materials(v29, v45, v46, v47);
      v52 = objc_msgSend_count(v48, v49, v50, v51);
      v55 = (void *)objc_msgSend_objectAtIndexedSubscript_(v40, v53, v44 % v52, v54);
    }
    else
    {
      v55 = 0;
    }
    v56 = (void *)objc_msgSend_subviews(self, v37, v38, v39);
    if (objc_msgSend_count(v56, v57, v58, v59)
      && (v63 = (void *)objc_msgSend_diffuse(v55, v60, v61, v62),
          v67 = objc_msgSend_contents(v63, v64, v65, v66),
          v71 = (void *)objc_msgSend_subviews(self, v68, v69, v70),
          v67 == objc_msgSend_objectAtIndexedSubscript_(v71, v72, 0, v73)))
    {
      objc_msgSend_textureCoordinatesWithMappingChannel_(v21, v74, 0, v75);
      v77 = v76;
      v79 = v78;
      v83 = (void *)objc_msgSend_diffuse(v55, v80, v81, v82);
      objc_msgSend_contentsTransform(v83, v84, v85, v86);
      v104 = (float32x4_t)v87;
      v105 = (float32x4_t)v88;
      v106 = (float32x4_t)v90;
      v107 = (float32x4_t)v89;
      if (!VFXMatrix4IsIdentity(v87, v88, v89, v90))
      {
        v94 = v77;
        v95 = v79;
        v96 = vaddq_f32(v106, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v104, v94), v105, v95), (float32x4_t)0, v107)).u64[0];
        v77 = *(float *)&v96;
        v79 = *((float *)&v96 + 1);
      }
      objc_msgSend_bounds(self, v91, v92, v93, *(_OWORD *)&v104, *(_OWORD *)&v105, *(_OWORD *)&v106, *(_OWORD *)&v107);
      x = v77 * v97;
      objc_msgSend_bounds(self, v98, v99, v100);
      y = v79 * v101;
    }
    else
    {
LABEL_8:
      if (a4)
        *a4 = 1;
    }
  }
  v102 = x;
  v103 = y;
  result.y = v103;
  result.x = v102;
  return result;
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  double y;
  double x;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_msgSend_layer(self, a2, v3, v4);
  objc_msgSend_convertPoint_toLayer_(v8, v9, 0, v10, x, y);
  objc_msgSend__warpPoint_outOfBounds_(self, v11, 0, v12);
  result.y = v14;
  result.x = v13;
  return result;
}

@end
