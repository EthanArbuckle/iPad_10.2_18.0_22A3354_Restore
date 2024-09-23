@implementation VFXMaterialProperty

+ (id)precomputedLightingEnvironmentContentsWithURL:(id)a3 error:(id *)a4
{
  uint64_t v6;

  v6 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, 1, a4);
  return (id)MEMORY[0x1E0DE7D20](a1, sel_precomputedLightingEnvironmentContentsWithData_error_, v6, a4);
}

+ (id)precomputedLightingEnvironmentContentsWithData:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  const char *v8;

  if (!a3)
    return 0;
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  return (id)objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v8, v7, (uint64_t)a3, a4);
}

+ (id)precomputedLightingEnvironmentDataForContents:(id)a3 device:(id)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  VFXWorld *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
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
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  VFXPrecomputedLightingEnvironment *v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  VFXPrecomputedLightingEnvironment *v75;
  const char *v76;
  void *v77;
  uint64_t v79;
  const __CFString *v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v10 = [VFXWorld alloc];
  v80 = CFSTR("VFXWorldLoaderDisableVFXCoreSupport");
  v81[0] = MEMORY[0x1E0C9AAB0];
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v81, (uint64_t)&v80, 1);
  v15 = (void *)objc_msgSend_initWithOptions_(v10, v13, v12, v14);
  v19 = (void *)objc_msgSend_lightingEnvironment(v15, v16, v17, v18);
  objc_msgSend_setContents_(v19, v20, (uint64_t)a3, v21);
  v32 = objc_msgSend_materialProperty(v19, v22, v23, v24);
  if (!v32)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v26, v27, v28, v29, v30, v31, (uint64_t)"materialProperty");
  objc_msgSend_commit(VFXTransaction, v25, v26, v27);
  if (sub_1B1841A40(v32, v33, v34, v35, v36, v37, v38, v39))
  {
    v47 = (void *)objc_msgSend_rendererWithDevice_options_(VFXRenderer, v40, (uint64_t)a4, 0);
    v51 = (void *)objc_msgSend__renderContextMetal(v47, v48, v49, v50);
    objc_msgSend_beginFrame_(v51, v52, 0, v53);
    v56 = objc_msgSend_radianceTextureForMaterialProperty_(v51, v54, v32, v55);
    v59 = objc_msgSend_irradianceTextureForMaterialProperty_(v51, v57, v32, v58);
    v79 = 5;
    objc_msgSend_endFrameWaitingUntilCompleted_status_error_(v51, v60, 1, (uint64_t)&v79, a5);
    v61 = 0;
    if (v56 && v59 && v79 == 4)
    {
      v62 = (void *)sub_1B189EB54(v56);
      v63 = (void *)sub_1B189EB54(v59);
      v61 = objc_alloc_init(VFXPrecomputedLightingEnvironment);
      objc_msgSend_setRadianceData_(v61, v64, (uint64_t)v62, v65);
      objc_msgSend_setIrradianceData_(v61, v66, (uint64_t)v63, v67);

    }
  }
  else
  {
    if (!sub_1B1842E64(v32, (uint64_t)v40, v41, v42, v43, v44, v45, v46))
    {

      return 0;
    }
    v61 = (VFXPrecomputedLightingEnvironment *)sub_1B1842EE4(v32, v68, v69, v70, v71, v72, v73, v74);
    v75 = v61;
  }

  if (!v61)
    return 0;
  v77 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v76, (uint64_t)v61, 1, a5);

  return v77;
}

- (VFXMaterialProperty)init
{
  VFXMaterialProperty *v2;
  VFXMaterialProperty *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXMaterialProperty;
  v2 = -[VFXMaterialProperty init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_parent = 0;
    v2->_propertyType = 26;
    *((_BYTE *)v2 + 8) &= ~2u;
    v2->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B1840FAC(0, 26);
    v3->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v3, v4, v5, v6);
  }
  return v3;
}

+ (VFXMaterialProperty)materialPropertyWithContents:(id)a3
{
  id v4;
  const char *v5;
  VFXMaterialProperty *v6;
  const char *v7;
  uint64_t v8;

  v4 = objc_alloc((Class)a1);
  v6 = (VFXMaterialProperty *)(id)objc_msgSend_initWithParent_propertyType_(v4, v5, 0, 26);
  objc_msgSend_setContents_(v6, v7, (uint64_t)a3, v8);
  return v6;
}

- (VFXMaterialProperty)initWithParent:(id)a3 propertyType:(char)a4
{
  int v4;
  VFXMaterialProperty *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  VFXMaterialProperty *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VFXMaterialProperty;
  v6 = -[VFXMaterialProperty init](&v16, sel_init);
  v10 = v6;
  if (v6)
  {
    if (v6 == a3)
      v11 = 0;
    else
      v11 = a3;
    v6->_parent = v11;
    v6->_propertyType = v4;
    *((_BYTE *)v6 + 8) = *((_BYTE *)v6 + 8) & 0xFD | (2 * (v4 < 20));
    if (!v11)
      v6->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B1840FAC(0, 26);
    v10->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v10, v7, v8, v9);
    objc_msgSend__syncObjCAnimations(v10, v12, v13, v14);
  }
  return v10;
}

- (VFXMaterialProperty)initWithParent:(id)a3 andCustomName:(id)a4
{
  VFXMaterialProperty *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  VFXMaterialProperty *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VFXMaterialProperty;
  v6 = -[VFXMaterialProperty init](&v19, sel_init);
  v10 = v6;
  if (v6)
  {
    if (v6 == a3)
      v11 = 0;
    else
      v11 = a3;
    v6->_parent = v11;
    v6->_propertyType = 26;
    v6->_customMaterialPropertyName = (NSString *)objc_msgSend_copy(a4, v7, v8, v9);
    *((_BYTE *)v10 + 8) &= ~2u;
    v10->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v10, v12, v13, v14);
    objc_msgSend__syncObjCAnimations(v10, v15, v16, v17);
  }
  return v10;
}

- (id)initPresentationMaterialPropertyWithModelProperty:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMaterialProperty *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXMaterialProperty;
  v7 = -[VFXMaterialProperty init](&v15, sel_init);
  if (v7)
  {
    if ((VFXMaterialProperty *)objc_msgSend_parent(a3, v4, v5, v6) == v7)
      v11 = 0;
    else
      v11 = objc_msgSend_parent(a3, v8, v9, v10);
    v7->_parent = (id)v11;
    v12 = objc_msgSend_propertyType(a3, v8, v9, v10);
    v7->_propertyType = v12;
    if (v12 >= 20)
      v13 = 1;
    else
      v13 = 3;
    *((_BYTE *)v7 + 8) = v13 | *((_BYTE *)v7 + 8) & 0xFC;
    v7->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v7;
}

- (void)__allocateContentTransformIfNeeded
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v3;

  if (!self->_contentTransform)
  {
    v3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
    self->_contentTransform = v3;
    *((_OWORD *)v3 + 2) = xmmword_1B2247DC0;
    *((_OWORD *)v3 + 3) = unk_1B2247DD0;
    *(_OWORD *)v3 = VFXMatrix4Identity;
    *((_OWORD *)v3 + 1) = unk_1B2247DB0;
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  self->_runtimeResolvedURL = 0;
  objc_msgSend__clearContents(self, v8, v9, v10);

  free(self->_contentTransform);
  v11.receiver = self;
  v11.super_class = (Class)VFXMaterialProperty;
  -[VFXMaterialProperty dealloc](&v11, sel_dealloc);
}

- (id)contentsAbsoluteURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXImage *cfxImage;
  const char *v11;
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

  cfxImage = self->_cfxImage;
  if (cfxImage)
    return (id)sub_1B1809180((uint64_t)cfxImage, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return self->_runtimeResolvedURL;
  v14 = (void *)objc_msgSend_world(self, v11, v12, v13);
  v18 = (void *)objc_msgSend_assetPathResolver(v14, v15, v16, v17);
  v22 = objc_msgSend_filename(self->_contents, v19, v20, v21);
  return (id)objc_msgSend_absoluteURLForAssetPath_(v18, v23, v22, v24);
}

- (id)__runtimeResolvedURL
{
  return self->_runtimeResolvedURL;
}

- (void)_setParent:(id)a3
{
  self->_parent = a3;
}

- (void)unlinkCustomPropertyWithParent:(id)a3
{
  uint64_t v3;

  self->_customMaterialProperty->var13 = 0;
  objc_msgSend__setParent_(self, a2, 0, v3);
}

- (void)linkCustomPropertyWithParent:(id)a3 andCustomName:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (a3 == self)
    v7 = 0;
  else
    v7 = a3;
  self->_parent = v7;

  v11 = (NSString *)objc_msgSend_copy(a4, v8, v9, v10);
  self->_customMaterialPropertyName = v11;
  self->_propertyType = 26;
  *((_BYTE *)self + 8) &= ~2u;
  if (v11 && !self->_customMaterialProperty)
    self->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B1840FAC(0, 26);
  if ((VFXMaterialProperty *)objc_msgSend___CFObject(a3, v12, v13, v14) == self)
    v18 = 0;
  else
    v18 = (void *)objc_msgSend___CFObject(a3, v15, v16, v17);
  self->_customMaterialProperty->var13 = v18;
}

- (__CFXMaterialProperty)materialPropertyCreateIfNeeded:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  __CFXMaterialProperty *result;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a3;
  switch(self->_propertyType)
  {
    case 0x15:
      result = (__CFXMaterialProperty *)objc_msgSend_lightRef(self->_parent, a2, a3, v3);
      if (result)
        result = (__CFXMaterialProperty *)sub_1B185F064((uint64_t)result, v8, v11, v12, v13, v14, v15, v16);
      break;
    case 0x17:
      result = (__CFXMaterialProperty *)objc_msgSend_worldRef(self->_parent, a2, a3, v3);
      if (result)
        result = (__CFXMaterialProperty *)sub_1B187B0A0((uint64_t)result, v8);
      break;
    case 0x18:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        result = (__CFXMaterialProperty *)objc_msgSend_worldRef(self->_parent, v22, v23, v24);
        if (result)
          result = (__CFXMaterialProperty *)sub_1B187B0F0((uint64_t)result, v8);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        result = (__CFXMaterialProperty *)objc_msgSend_lightRef(self->_parent, v25, v26, v27);
        if (result)
          result = (__CFXMaterialProperty *)sub_1B185F0C8((uint64_t)result, v8, v28, v29, v30, v31, v32, v33);
      }
      break;
    case 0x19:
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: custom color grading not implemented"), a3, v3, v4, v5, v6, v7, v34);
LABEL_12:
      result = 0;
      break;
    case 0x1A:
      result = self->_customMaterialProperty;
      break;
    default:
      result = (__CFXMaterialProperty *)objc_msgSend_commonProfile(self, a2, a3, v3);
      if (result)
        result = (__CFXMaterialProperty *)sub_1B1840E70((uint64_t)result, self->_propertyType, v8, v17, v18, v19, v20, v21);
      break;
  }
  return result;
}

- (id)_animationPathForKey:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_materialPropertyName(self, a2, (uint64_t)a3, v3);
  v8 = (void *)objc_msgSend_stringByAppendingString_(v5, v6, (uint64_t)CFSTR("."), v7);
  return (id)objc_msgSend_stringByAppendingString_(v8, v9, (uint64_t)a3, v10);
}

- (void)_clearContents
{
  uint64_t v2;
  uint64_t v3;
  unsigned int contentType;
  BOOL v6;
  int v7;
  id contents;
  uint64_t v10;
  const char *v11;
  __CFXImage *cfxImage;
  _QWORD v13[5];
  _QWORD v14[6];

  contentType = self->_contentType;
  v6 = contentType > 0xA;
  v7 = (1 << contentType) & 0x794;
  if (!v6 && v7 != 0)
  {
    contents = self->_contents;
    if (contents)
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3052000000;
      v14[3] = sub_1B18CA7BC;
      v14[4] = sub_1B18CA7CC;
      v14[5] = contents;
      v10 = objc_msgSend_worldRef(self, a2, v2, v3);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_1B18CA7D8;
      v13[3] = &unk_1E63D8A20;
      v13[4] = v14;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v13);
      _Block_object_dispose(v14, 8);
    }
  }
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    CFRelease(cfxImage);
    self->_cfxImage = 0;
  }

  self->_contents = 0;
}

- (void)_setColor:(id)a3
{
  if (self->_contents != a3)
  {
    self->_contents = a3;
    self->_contentType = 0;
  }
}

- (void)setColor:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[6];

  if ((*((_BYTE *)self + 8) & 1) != 0 || self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 0;
    if (a3)
    {
      v9 = objc_msgSend_worldRef(self, v6, v7, v8);
      v12 = objc_msgSend__animationPathForKey_(self, v10, (uint64_t)CFSTR("color"), v11);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1B18CA90C;
      v14[3] = &unk_1E63D53C8;
      v14[4] = self;
      v14[5] = a3;
      objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v13, v9, (uint64_t)self, v12, v14);
    }
  }
}

- (id)color
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int isColorManaged;
  const char *v27;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15 && (v23 = sub_1B1841910(v15, (uint64_t)v16, v17, v18, v19, v20, v21, v22)) != 0)
    {
      v24 = v23;
      v25 = (void *)MEMORY[0x1E0DC3658];
      isColorManaged = objc_msgSend_isColorManaged(self, v16, v17, v18);
      v5 = (void *)objc_msgSend_vfx_colorWithCFXColor_ignoringColorSpace_(v25, v27, v24, isColorManaged ^ 1u);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  if (self->_contentType)
    return 0;
  return self->_contents;
}

- (double)linearExtendedSRGBColor
{
  const void *v4;

  v4 = (const void *)objc_msgSend_color(a1, a2, a3, a4);
  return sub_1B18BCF48(v4);
}

- (void)setLinearExtendedSRGBColor:(VFXMaterialProperty *)self
{
  float32x4_t v2;
  CGColorRef v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = sub_1B179D614(v2);
  v7 = objc_msgSend_colorWithCGColor_(MEMORY[0x1E0DC3658], v5, (uint64_t)v4, v6);
  objc_msgSend_setColor_(self, v8, v7, v9);
  if (v4)
    CFRelease(v4);
}

- (void)setFloatValue:(id)a3
{
  uint64_t v3;
  id contents;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[6];

  contents = self->_contents;
  if (contents != a3 && (objc_msgSend_isEqual_(contents, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    objc_msgSend__clearContents(self, v7, v8, v9);
    self->_contents = a3;
    self->_contentType = 5;
    if (a3)
    {
      v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v16 = objc_msgSend__animationPathForKey_(self, v14, (uint64_t)CFSTR("color"), v15);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_1B18CAB14;
      v18[3] = &unk_1E63D53C8;
      v18[4] = self;
      v18[5] = a3;
      objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v17, v13, (uint64_t)self, v16, v18);
    }
  }
}

- (id)floatValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  const char *v7;
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
  char *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15)
    {
      v23 = v15;
      v24 = (char *)sub_1B1841910(v15, v16, v17, v18, v19, v20, v21, v22);
      if (v24)
      {
        v25 = sub_1B1843540(v23);
        v30 = 12;
        if (v25 != 4)
          v30 = 0;
        LODWORD(v29) = *(_DWORD *)&v24[v30];
        v24 = (char *)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v26, v27, v28, v29);
      }
      if (!v14)
        return v24;
    }
    else
    {
      v24 = 0;
      if (!v14)
        return v24;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v24;
  }
  if (self->_contentType == 5)
    return self->_contents;
  return 0;
}

- (void)setAssetValue:(id)a3
{
  uint64_t v3;
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
  const char *v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[6];
  _QWORD v23[6];
  uint64_t v24;

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 6;
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend_rootLayer(a3, v6, v7, v8);
        if (v9)
        {
          v17 = v9;
          v18 = objc_msgSend_worldRef(self, v10, v11, v12);
          objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, (uint64_t)self, v23, v22[0], v22[1], v22[2], v22[3], v22[4], v22[5], MEMORY[0x1E0C809B0], 3221225472, sub_1B18CAD34, &unk_1E63D53C8, self, v17);
        }
        else
        {
          sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to decode CALayer"), v11, v12, v13, v14, v15, v16, v24);
        }
      }
      else
      {
        v20 = objc_msgSend_worldRef(self, v6, v7, v8);
        objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22, MEMORY[0x1E0C809B0], 3221225472, sub_1B18CAD40, &unk_1E63D53C8, self, a3, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5]);
      }
    }
  }
}

- (id)assetValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  const char *v7;
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
  void *v23;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15)
    {
      v23 = (void *)sub_1B184293C(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v23;
    }
    else
    {
      v23 = 0;
      if (!v14)
        return v23;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v23;
  }
  if (self->_contentType == 6)
    return self->_contents;
  return 0;
}

- (void)_setCFXImageRef:(__CFXImage *)a3
{
  __CFXImage *cfxImage;
  __CFXImage *v6;

  cfxImage = self->_cfxImage;
  if (cfxImage != a3)
  {
    if (cfxImage)
    {
      CFRelease(cfxImage);
      self->_cfxImage = 0;
    }
    if (a3)
      v6 = (__CFXImage *)CFRetain(a3);
    else
      v6 = 0;
    self->_cfxImage = v6;
  }
}

- (void)_setupContentsFromCFXImage
{
  __CFXImage *cfxImage;
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
  id v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;

  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    if (sub_1B180A390((uint64_t)cfxImage))
    {

      v18 = (id)sub_1B180A3A0((uint64_t)self->_cfxImage, v11, v12, v13, v14, v15, v16, v17);
LABEL_7:
      self->_contents = v18;
      self->_contentType = 1;
      return;
    }
    v19 = sub_1B1809180((uint64_t)self->_cfxImage, v4, v5, v6, v7, v8, v9, v10);
    if (v19
      || (v19 = objc_msgSend_copyImageFromCFXImage_(VFXMaterialProperty, v20, (uint64_t)self->_cfxImage, v21)) != 0)
    {
      v22 = (void *)v19;

      v18 = v22;
      goto LABEL_7;
    }
  }
}

- (void)getCFXImageRef
{
  return self->_cfxImage;
}

- (CGImage)contentsAsCGImage
{
  CGImage *result;
  CFTypeID v4;

  result = (CGImage *)self->_contents;
  if (result)
  {
    v4 = CFGetTypeID(result);
    if (v4 == CGImageGetTypeID())
      return (CGImage *)self->_contents;
    else
      return 0;
  }
  return result;
}

- (CGContext)copyBitmap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXImage *cfxImage;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  CGContext *v24;

  cfxImage = self->_cfxImage;
  if (cfxImage)
    return (CGContext *)sub_1B180ADA4((uint64_t)cfxImage, 1, v2, v3, v4, v5, v6, v7);
  v11 = objc_msgSend_contentsAbsoluteURL(self, a2, v2, v3);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = (void *)objc_opt_class();
  v16 = objc_msgSend_copyCFXImageFromImage_(v13, v14, v12, v15);
  if (!v16)
    return 0;
  v23 = (const void *)v16;
  v24 = (CGContext *)sub_1B180ADA4(v16, 1, v17, v18, v19, v20, v21, v22);
  CFRelease(v23);
  return v24;
}

- (CFXColor4)color4
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  CFXColor4 result;

  v16 = 0;
  v4 = (const void *)objc_msgSend_color(self, a2, v2, v3);
  v5 = (void *)sub_1B18831BC(v4);
  v7 = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(v5, v6, 0, (uint64_t)&v16);
  if (v16)
    v10 = v8;
  else
    v10 = 0;
  if (v16)
    v11 = v9;
  else
    v11 = 0;
  if (v16)
    v12 = HIDWORD(v7);
  else
    v12 = 0;
  if (v16)
    v13 = v7;
  else
    v13 = 0;
  v14 = v10 | (v11 << 32);
  v15 = v13 | (v12 << 32);
  *(_QWORD *)&result.var0.var1.var2 = v14;
  *(_QWORD *)result.var0.var0 = v15;
  return result;
}

- (int64_t)minificationFilter
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      v5 = (int)sub_1B180CDF0(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return *((_BYTE *)self + 58) & 3;
}

- (int64_t)magnificationFilter
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      v5 = (int)sub_1B180CE38(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return ((unint64_t)*((unsigned __int8 *)self + 58) >> 2) & 3;
}

- (int64_t)mipFilter
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      v5 = (int)sub_1B180CE80(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return ((unint64_t)*((unsigned __int8 *)self + 58) >> 4) & 3;
}

- (void)setMinificationFilter:(int64_t)a3
{
  uint64_t v3;
  char v4;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  v4 = *((_BYTE *)self + 58);
  if ((v4 & 3) != a3)
  {
    *((_BYTE *)self + 58) = v4 & 0xFC | a3 & 3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18CB1C4;
    v8[3] = &unk_1E63D5378;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (void)setMagnificationFilter:(int64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  v4 = *((unsigned __int8 *)self + 58);
  if (((v4 >> 2) & 3) != a3)
  {
    *((_BYTE *)self + 58) = v4 & 0xF3 | (4 * (a3 & 3));
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18CB264;
    v8[3] = &unk_1E63D5378;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (void)setMipFilter:(int64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  v4 = *((unsigned __int8 *)self + 58);
  if (((v4 >> 4) & 3) != a3)
  {
    *((_BYTE *)self + 58) = v4 & 0xCF | (16 * (a3 & 3));
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18CB304;
    v8[3] = &unk_1E63D5378;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)_presentationMappingChannel
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

  v4 = objc_msgSend_materialProperty(self, a2, v2, v3);
  if (v4)
    return sub_1B1841F58(v4, v5, v6, v7, v8, v9, v10, v11);
  else
    return -1;
}

- (int64_t)mappingChannel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  const char *v7;
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
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if ((*((_BYTE *)self + 8) & 1) == 0)
    return self->_mappingChannel;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return objc_msgSend__presentationMappingChannel(self, v7, v8, v9);
  v14 = v6;
  sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v18 = objc_msgSend__presentationMappingChannel(self, v15, v16, v17);
  sub_1B18797B4(v14, v19, v20, v21, v22, v23, v24, v25);
  return v18;
}

- (void)setMappingChannel:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_mappingChannel != a3)
  {
    self->_mappingChannel = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18CB428;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)textureComponents
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15)
    {
      v5 = sub_1B18433B4(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 15;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return LOBYTE(self->_intensity) & 0xF;
}

- (void)setTextureComponents:(int64_t)a3
{
  uint64_t v3;
  char intensity_low;
  uint64_t v7;
  const char *v8;
  _QWORD v9[6];

  intensity_low = LOBYTE(self->_intensity);
  if ((intensity_low & 0xF) != a3)
  {
    LOBYTE(self->_intensity) = intensity_low & 0xF0 | a3 & 0xF;
    v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18CB57C;
    v9[3] = &unk_1E63D5440;
    v9[4] = self;
    v9[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (void)setIntensity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];
  float v13;

  if ((*((_BYTE *)self + 8) & 1) != 0 || self->_maxAnisotropy != a3)
  {
    self->_maxAnisotropy = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10 = objc_msgSend__animationPathForKey_(self, v8, (uint64_t)CFSTR("intensity"), v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B18CB684;
    v12[3] = &unk_1E63D53A0;
    v12[4] = self;
    v13 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v11, v7, (uint64_t)self, v10, v12);
  }
}

- (float)intensity
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_materialProperty(self, v7, v8, v9);
    if (v15)
    {
      v5 = sub_1B1841E14(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0.0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return self->_maxAnisotropy;
}

- (int64_t)wrapS
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      v5 = (int)sub_1B180CD18(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 1;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return *((_BYTE *)self + 59) & 7;
}

- (void)setWrapS:(int64_t)a3
{
  uint64_t v3;
  char v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  if ((unint64_t)(a3 - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    v5 = *((_BYTE *)self + 59);
    if ((v5 & 7) != a3)
    {
      *((_BYTE *)self + 59) = v5 & 0xF8 | a3;
      v6 = objc_msgSend_worldRef(self, a2, a3, v3);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18CB864;
      v8[3] = &unk_1E63D5378;
      v8[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
    }
  }
  else
  {
    NSLog(CFSTR("invalid wrapS value: %d"), a2, a3);
  }
}

- (int64_t)wrapT
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
    if (v15)
    {
      v5 = (int)sub_1B180CD60(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 1;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return ((unint64_t)*((unsigned __int8 *)self + 59) >> 3) & 7;
}

- (void)setWrapT:(int64_t)a3
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  if ((unint64_t)(a3 - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    v5 = *((unsigned __int8 *)self + 59);
    if (((v5 >> 3) & 7) != a3)
    {
      *((_BYTE *)self + 59) = v5 & 0xC7 | (8 * (a3 & 7));
      v6 = objc_msgSend_worldRef(self, a2, a3, v3);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18CB9A0;
      v8[3] = &unk_1E63D5378;
      v8[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
    }
  }
  else
  {
    NSLog(CFSTR("invalid wrapT value: %d"), a2, a3);
  }
}

- (BOOL)isColorManaged
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  VFXMaterialProperty *v5;
  uint64_t v6;
  const char *v7;
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

  v4 = *((unsigned __int8 *)self + 8);
  if ((v4 & 1) != 0)
  {
    v5 = self;
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_materialProperty(v5, v7, v8, v9);
    LOBYTE(v5) = sub_1B1843548(v15);
    if (v14)
      sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    LODWORD(v5) = (v4 >> 2) & 1;
  }
  return (char)v5;
}

- (void)setColorManaged:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 8);
  if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 4;
    else
      v7 = 0;
    *((_BYTE *)self + 8) = v4 & 0xFB | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B18CBAB8;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (int)_textureOptions
{
  uint64_t v2;
  uint64_t IfNeeded;

  IfNeeded = objc_msgSend_materialPropertyCreateIfNeeded_(self, a2, 0, v2);
  if (IfNeeded)
    return sub_1B1843134(IfNeeded);
  else
    return sub_1B184358C(self->_propertyType, (*((unsigned __int8 *)self + 8) >> 2) & 1);
}

- (void)_updateCFXImageWithContents:(id)a3
{
  __CFXImage *cfxImage;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  _QWORD v24[6];
  char v25;

  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
    CFRelease(cfxImage);
    self->_cfxImage = 0;
  }
  v25 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend_world(self, v6, v7, v8);
    v13 = (void *)objc_msgSend_assetPathResolver(v9, v10, v11, v12);
    if (v13)
    {
      v14 = objc_msgSend_absoluteURLForAssetPath_(v13, v6, (uint64_t)a3, v8);
      if (v14)
      {
        v15 = (void *)v14;

        self->_runtimeResolvedURL = v15;
        a3 = v15;
      }
    }
  }
  v16 = objc_msgSend__textureOptions(self, v6, v7, v8);
  v18 = (void *)objc_msgSend_copyCFXImageFromImage_textureOptions_wasCached_(VFXMaterialProperty, v17, (uint64_t)a3, v16, &v25);
  v22 = objc_msgSend_worldRef(self, v19, v20, v21);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1B18CBC4C;
  v24[3] = &unk_1E63D53C8;
  v24[4] = self;
  v24[5] = v18;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v23, v22, (uint64_t)self, v24);

}

- (void)setImage:(id)a3
{
  uint64_t v3;
  __CFXImage *cfxImage;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  if (self->_contents == a3)
  {
    if (!a3)
    {
      cfxImage = self->_cfxImage;
      if (cfxImage)
        goto LABEL_3;
    }
  }
  else
  {
    cfxImage = self->_cfxImage;
    if (cfxImage)
    {
LABEL_3:
      CFRetain(cfxImage);
      objc_msgSend__clearContents(self, v7, v8, v9);
      self->_contents = a3;
      self->_contentType = 1;
      objc_msgSend__updateCFXImageWithContents_(self, v10, (uint64_t)a3, v11);
      CFRelease(cfxImage);
      return;
    }
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 1;
    objc_msgSend__updateCFXImageWithContents_(self, v12, (uint64_t)a3, v13);
  }
}

- (id)image
{
  uint64_t v2;
  __CFXImage *cfxImage;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  cfxImage = self->_cfxImage;
  if (cfxImage && (self->_contentType != 1 || !self->_contents))
  {
    v5 = objc_msgSend_copyImageFromCFXImage_(VFXMaterialProperty, a2, (uint64_t)cfxImage, v2);
    if (v5)
    {
      v12 = (void *)v5;
      if (self->_contentType == 2)
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. the cfxImage should have been cleared when setting a layer"), v6, v7, v8, v9, v10, v11, (uint64_t)"_contentType != VFXContentTypeLayer");

      self->_contents = v12;
      self->_contentType = 1;
    }
  }
  if (self->_contentType == 1)
    return self->_contents;
  else
    return 0;
}

- (id)pvrtcData
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
  __CFXImage *cfxImage;
  void *v15;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  cfxImage = self->_cfxImage;
  if (cfxImage && sub_1B180B84C((uint64_t)cfxImage) == 1)
  {
    v15 = (void *)sub_1B180A64C((uint64_t)self->_cfxImage, v6, v7, v8, v9, v10, v11, v12);
    if (!v13)
      return v15;
    goto LABEL_8;
  }
  v15 = 0;
  if (v13)
LABEL_8:
    sub_1B18797B4(v13, v6, v7, v8, v9, v10, v11, v12);
  return v15;
}

- (void)setLayer:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 2;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CBEC8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)layer
{
  if (self->_contentType == 2)
    return self->_contents;
  else
    return 0;
}

- (void)setAvPlayer:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 7;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CBF94;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)avPlayer
{
  if (self->_contentType == 7)
    return self->_contents;
  else
    return 0;
}

- (void)setCaptureDevice:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 8;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CC060;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)captureDevice
{
  if (self->_contentType == 8)
    return self->_contents;
  else
    return 0;
}

- (void)setCaptureDeviceOutputConsumerSource:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 9;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CC12C;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)captureDeviceOutputConsumerSource
{
  if (self->_contentType == 9)
    return self->_contents;
  else
    return 0;
}

- (void)setTextureProvider:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 10;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CC1F8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)textureProvider
{
  if (self->_contentType == 10)
    return self->_contents;
  else
    return 0;
}

- (void)setPrecomputedLightingEnvironment:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 11;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CC2C4;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)precomputedLightingEnvironment
{
  if (self->_contentType == 11)
    return self->_contents;
  else
    return 0;
}

- (void)_updateMaterialUIComponent:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  VFXUIKitSource *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v6 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
    v10 = v6;
    if (a3)
    {
      v11 = sub_1B18BCED0(a3);
      if (v11)
      {
        v15 = v11;
        v16 = 0;
      }
      else
      {
        v15 = (const void *)sub_1B181F08C(0);
        v25 = objc_alloc_init(VFXUIKitSource);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_setUiView_(v25, v26, (uint64_t)a3, v27);
        else
          objc_msgSend_setUiWindow_(v25, v26, (uint64_t)a3, v27);
        objc_msgSend_connectToProxy_(v25, v28, (uint64_t)v15, v29);

        sub_1B18BCEF4(v15, a3);
        v16 = v15;
      }
      v30 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v12, v13, v14);
      v38 = sub_1B181F198((uint64_t)v15, v31, v32, v33, v34, v35, v36, v37);
      objc_msgSend_addObserver_selector_name_object_(v30, v39, (uint64_t)self, (uint64_t)sel__layerDidChange_, CFSTR("VFXUITreeDidChange"), v38);
      sub_1B1843200(v10, v15, v40, v41, v42, v43, v44, v45, v46);
      if (v16)
        CFRelease(v16);
    }
    else
    {
      v17 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v7, v8, v9);
      objc_msgSend_removeObserver_name_object_(v17, v18, (uint64_t)self, (uint64_t)CFSTR("VFXUITreeDidChange"), 0);
      sub_1B1843200(v10, 0, v19, v20, v21, v22, v23, v24, v47);
    }
  }
}

- (void)setUIView:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 4;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CC514;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)UIView
{
  if (self->_contentType == 4)
    return self->_contents;
  else
    return 0;
}

- (void)setUIWindow:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 4;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CC5E0;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (void)setContents:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
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
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;

  if ((*((_BYTE *)self + 8) & 1) != 0 || (id)objc_msgSend_contents(self, a2, (uint64_t)a3, v3) != a3)
  {

    self->_runtimeResolvedURL = 0;
    v6 = (void *)sub_1B18831BC(a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_setColor_(self, v7, (uint64_t)v6, v8);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_setLayer_(self, v13, (uint64_t)v6, v14);
    }
    else if (objc_msgSend_conformsToProtocol_(v6, v13, (uint64_t)&unk_1EF023E28, v14))
    {
      objc_msgSend_setMtlTexture_(self, v15, (uint64_t)v6, v16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_setUIView_(self, v17, (uint64_t)v6, v18);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_setUIWindow_(self, v19, (uint64_t)v6, v20);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_setFloatValue_(self, v21, (uint64_t)v6, v22);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_setAssetValue_(self, v23, (uint64_t)v6, v24);
            }
            else
            {
              NSClassFromString(CFSTR("AVPlayer"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_setAvPlayer_(self, v25, (uint64_t)v6, v26);
              }
              else
              {
                NSClassFromString(CFSTR("AVCaptureDevice"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_setCaptureDevice_(self, v27, (uint64_t)v6, v28);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend_setCaptureDeviceOutputConsumerSource_(self, v29, (uint64_t)v6, v30);
                  }
                  else if (objc_msgSend_conformsToProtocol_(v6, v29, (uint64_t)&unk_1EF023F48, v30))
                  {
                    objc_msgSend_setTextureProvider_(self, v31, (uint64_t)v6, v32);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
LABEL_8:
                      objc_msgSend_setImage_(self, v9, (uint64_t)v6, v10);
                      goto LABEL_9;
                    }
                    objc_msgSend_setPrecomputedLightingEnvironment_(self, v9, (uint64_t)v6, v10);
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_9:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      MEMORY[0x1E0DE7D20](self->_parent, sel__updateProbeStamp, v11, v12);
  }
}

+ (id)dvt_supportedTypesForPropertyContents
{
  const char *v2;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = NSClassFromString(CFSTR("AVPlayer"));
  v4[9] = NSClassFromString(CFSTR("AVCaptureDevice"));
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 12);
}

- (id)contents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t IfNeeded;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if ((*((_BYTE *)self + 8) & 1) == 0)
    return self->_contents;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  IfNeeded = objc_msgSend_materialPropertyCreateIfNeeded_(self, v7, 0, v9);
  v23 = (void *)IfNeeded;
  if (IfNeeded)
  {
    v24 = sub_1B1842D3C(IfNeeded, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
    if (v24)
    {
      v32 = (id)sub_1B181F198(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    else
    {
      v33 = sub_1B1841C84((uint64_t)v23, v25, v26, v27, v28, v29, v30, v31);
      if (v33)
      {
        v32 = (id)objc_msgSend_copyImageFromCFXImage_(VFXMaterialProperty, v34, v33, v36);
      }
      else
      {
        v41 = sub_1B1841910((uint64_t)v23, (uint64_t)v34, v35, v36, v37, v38, v39, v40);
        if (!v41)
        {
          v23 = 0;
          if (!v14)
            return v23;
          goto LABEL_14;
        }
        v32 = (id)sub_1B18BCF74(v41, v16, v17, v18);
      }
    }
    v23 = v32;
  }
  if (v14)
LABEL_14:
    sub_1B18797B4(v14, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
  return v23;
}

- (void)_setImagePath:(id)a3 withResolvedURL:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id runtimeResolvedURL;

  objc_msgSend__updateCFXImageWithContents_(self, a2, (uint64_t)a4, (uint64_t)a4);
  objc_msgSend__clearContents(self, v7, v8, v9);
  self->_contents = a3;
  self->_contentType = 1;
  runtimeResolvedURL = self->_runtimeResolvedURL;
  if (runtimeResolvedURL != a4)
  {

    self->_runtimeResolvedURL = a4;
  }
}

- (float)maxAnisotropy
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 8) & 1) == 0)
    return *(&self->_maxAnisotropy + 1);
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_textureSampler(self, v7, v8, v9);
  v5 = sub_1B180CEC8(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setMaxAnisotropy:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (*(&self->_maxAnisotropy + 1) != a3)
  {
    *(&self->_maxAnisotropy + 1) = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18CCC30;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (void)setMtlTexture:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_contents != a3)
  {
    objc_msgSend__clearContents(self, a2, (uint64_t)a3, v3);
    self->_contents = a3;
    self->_contentType = 3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18CCD0C;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)mtlTexture
{
  if (self->_contentType == 3)
    return self->_contents;
  else
    return 0;
}

- (uint64_t)setContentsTransform:(__n128)a3
{
  __n128 *v6;
  uint64_t result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  __n128 v20;
  __int128 v21;
  __n128 v22;
  __int128 v23;
  __n128 v24;
  __n128 v25;
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __n128 v30;
  _QWORD *v31;

  v6 = (__n128 *)a1[12];
  v24 = a4;
  v25 = a5;
  v20 = a2;
  v22 = a3;
  if (!v6
    || (result = VFXMatrix4EqualToMatrix4(a2, a3, a4, a5, *v6, v6[1], v6[2], v6[3]),
        a2 = v20,
        a3 = v22,
        a4 = v24,
        a5 = v25,
        (result & 1) == 0))
  {
    if (VFXMatrix4IsIdentity(a2, a3, a4, a5))
    {
      result = a1[12];
      if (!result)
        return result;
      free((void *)result);
      a1[12] = 0;
    }
    else
    {
      objc_msgSend___allocateContentTransformIfNeeded(a1, v8, v9, v10);
      v14 = (__n128 *)a1[12];
      *v14 = v20;
      v14[1] = v22;
      v14[2] = v24;
      v14[3] = v25;
    }
    v15 = objc_msgSend_worldRef(a1, v11, v12, v13, *(_OWORD *)&v20, *(_OWORD *)&v22);
    v18 = objc_msgSend__animationPathForKey_(a1, v16, (uint64_t)CFSTR("contentsTransform"), v17);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B18CCE54;
    v26[3] = &unk_1E63D6A70;
    v31 = a1;
    v27 = v21;
    v28 = v23;
    v29 = v24;
    v30 = v25;
    return objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v19, v15, (uint64_t)a1, v18, v26);
  }
  return result;
}

- (__n128)contentsTransform
{
  __n128 result;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
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
  __n128 *v24;
  __n128 v25;

  result = (__n128)VFXMatrix4Identity;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 96);
    if (v6)
      return *(__n128 *)v6;
    return result;
  }
  v7 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  v16 = objc_msgSend_materialProperty((void *)a1, v8, v9, v10);
  if (!v16)
  {
    result = (__n128)VFXMatrix4Identity;
    if (!v15)
      return result;
    goto LABEL_10;
  }
  v24 = (__n128 *)sub_1B1842B0C(v16, v17, v18, v19, v20, v21, v22, v23);
  result = (__n128)VFXMatrix4Identity;
  if (v24)
    result = *v24;
  if (v15)
  {
LABEL_10:
    v25 = result;
    sub_1B18797B4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v25;
  }
  return result;
}

- (id)propertyName
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = objc_msgSend_propertyType(self, a2, v2, v3);
  result = CFSTR("diffuse");
  switch(v8)
  {
    case 0:
      result = CFSTR("emission");
      break;
    case 1:
      return result;
    case 2:
      result = CFSTR("specular");
      break;
    case 3:
      result = CFSTR("reflective");
      break;
    case 4:
      result = CFSTR("transparent");
      break;
    case 5:
      result = CFSTR("multiply");
      break;
    case 6:
      result = CFSTR("normal");
      break;
    case 7:
      result = CFSTR("ambientOcclusion");
      break;
    case 8:
      result = CFSTR("selfIllumination");
      break;
    case 9:
      result = CFSTR("metalness");
      break;
    case 10:
      result = CFSTR("roughness");
      break;
    case 11:
      result = CFSTR("clearCoat");
      break;
    case 12:
      result = CFSTR("clearCoatRoughness");
      break;
    case 13:
      result = CFSTR("clearCoatNormal");
      break;
    case 14:
      result = CFSTR("subsurface");
      break;
    case 15:
      result = CFSTR("subsurfaceRadius");
      break;
    case 16:
      result = CFSTR("displacement");
      break;
    case 21:
      result = CFSTR("gobo");
      break;
    case 22:
      result = CFSTR("ies");
      break;
    case 23:
      result = CFSTR("background");
      break;
    case 24:
      objc_msgSend_parent(self, v5, v6, v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        result = CFSTR("probeEnvironment");
      else
        result = CFSTR("environment");
      break;
    case 25:
      result = CFSTR("colorGrading");
      break;
    case 26:
      result = self->_customMaterialPropertyName;
      break;
    default:
      v10 = objc_msgSend_propertyType(self, v5, v6, v7);
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: materialPropertyName %d not found"), v11, v12, v13, v14, v15, v16, v10);
      result = 0;
      break;
  }
  return result;
}

- (char)propertyType
{
  return self->_propertyType;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v5 = objc_msgSend_contents(self, a2, v2, v3);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v12 = objc_msgSend_propertyName(self, v9, v10, v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("<data %p>"), v14, v5);
  return (NSString *)objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("<%@: %p | %@ contents=%@>"), v14, v8, self, v12, v5);
}

+ (__CFXImage)_copyCFXImageFromImageData:(id)a3 typeID:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFXImage *v37;
  uint64_t i;
  const void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (__CFXImage *)sub_1B18092C8(a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend_count(a3, v17, v18, v19) == 6)
      {
        v27 = 0;
        v44 = 0u;
        v45 = 0u;
        v43 = 0u;
        do
        {
          v28 = objc_msgSend_objectAtIndexedSubscript_(a3, v20, v27, v22, v43, v44, v45);
          v31 = objc_msgSend_copyCFXImageFromImage_(a1, v29, v28, v30);
          *((_QWORD *)&v43 + v27) = v31;
          if (!v31)
            sub_1B17C4408(0, (uint64_t)CFSTR("Warning: copyCFXImageFromImage: invalid sub-image\n"), v32, v22, v33, v34, v35, v36, v43);
          ++v27;
        }
        while (v27 != 6);
        v37 = (__CFXImage *)sub_1B18094F4((uint64_t *)&v43, (uint64_t)v20, v32, v22, v33, v34, v35, v36);
        for (i = 0; i != 48; i += 8)
        {
          v39 = *(const void **)((char *)&v43 + i);
          if (v39)
          {
            CFRelease(v39);
            *(_QWORD *)((char *)&v43 + i) = 0;
          }
        }
        return v37;
      }
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: array for material property contents must have 6 elements"), v21, v22, v23, v24, v25, v26, v43);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__CFXImage *)sub_1B1809308(a3);
      if (CGImageGetTypeID() == a4)
        return (__CFXImage *)sub_1B1809F34((CGImage *)a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__CFXImage *)sub_1B180A048(a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__CFXImage *)sub_1B1831230(a3, v40, v41, v42);
    }
    return 0;
  }
  v9 = (void *)objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v7, (uint64_t)a3, v8);
  if (objc_msgSend_scheme(v9, v10, v11, v12))
    return (__CFXImage *)sub_1B18092C8(v9);
  else
    return (__CFXImage *)sub_1B180A088((uint64_t)a3, v13, v14, v15);
}

+ (__CFXImage)copyCFXImageFromImage:(id)a3 textureOptions:(int)a4 wasCached:(BOOL *)a5
{
  char v6;
  CFTypeID v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFXImage *v17;
  __CFXImage *v18;
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
  uint64_t v32;
  uint64_t v33;

  if (!a3)
    return 0;
  v6 = a4;
  v8 = CFGetTypeID(a3);
  if (v8 == sub_1B18091DC())
    return (__CFXImage *)a3;
  v18 = (__CFXImage *)sub_1B180B630(a3, v9, v10, v11, v12, v13, v14, v15);
  if (v18)
  {
    v17 = v18;
    if (a5)
      *a5 = 1;
  }
  else
  {
    v20 = objc_msgSend__copyCFXImageFromImageData_typeID_(a1, v19, (uint64_t)a3, v8);
    v17 = (__CFXImage *)v20;
    if (v20)
    {
      if ((v6 & 2) != 0)
        sub_1B180B1A0(v20);
      if ((v6 & 8) != 0)
        sub_1B180B0FC((uint64_t)v17, v21, v22, v23, v24, v25, v26, v27);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        sub_1B180B67C(v17, a3, v28, v29, v30, v31, v32, v33);
    }
    if (a5)
      *a5 = 0;
  }
  return v17;
}

+ (__CFXImage)copyCFXImageFromImage:(id)a3 textureOptions:(int)a4
{
  return (__CFXImage *)objc_msgSend_copyCFXImageFromImage_textureOptions_wasCached_(a1, a2, (uint64_t)a3, *(uint64_t *)&a4, 0);
}

+ (__CFXImage)copyCFXImageFromImage:(id)a3
{
  return (__CFXImage *)MEMORY[0x1E0DE7D20](a1, sel_copyCFXImageFromImage_textureOptions_, a3, 0);
}

+ (id)_copyImageFromCFXImage:(__CFXImage *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v8 = sub_1B1809CAC((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v9 = objc_alloc(MEMORY[0x1E0DC3870]);
  v12 = (void *)objc_msgSend_initWithCGImage_(v9, v10, (uint64_t)v8, v11);
  CGImageRelease(v8);
  return v12;
}

+ (id)copyImageFromCFXImage:(__CFXImage *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  if (sub_1B180A91C((uint64_t)a3))
    return 0;
  v6 = sub_1B18FEB10();
  v28 = (id)sub_1B18FEE08(v6, a3, v7, v8, v9, v10, v11, v12);
  if (!v28)
  {
    v5 = (void *)objc_msgSend__copyImageFromCFXImage_(a1, v13, (uint64_t)a3, v14);
    if (v5)
      sub_1B18FEEA8(v6, v5, a3, v23, v24, v25, v26, v27);
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return v28;
  v15 = objc_alloc(MEMORY[0x1E0DC3870]);
  v19 = objc_msgSend_path(v28, v16, v17, v18);
  return (id)objc_msgSend_initWithContentsOfFile_(v15, v20, v19, v21);
}

- (void)parentWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_parent != a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. inconsistency in VFXMaterialProperty::parentWillDie"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"parent == _parent");
  self->_parent = 0;
}

- (id)parent
{
  return self->_parent;
}

- (__CFXMaterialProperty)materialProperty
{
  uint64_t v2;

  return (__CFXMaterialProperty *)objc_msgSend_materialPropertyCreateIfNeeded_(self, a2, 1, v2);
}

- (__CFXCommonProfile)commonProfile
{
  uint64_t v2;
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 2) != 0)
    return (__CFXCommonProfile *)objc_msgSend_commonProfile(self->_parent, a2, v2, v3);
  else
    return 0;
}

- (__CFXTextureSampler)textureSampler
{
  uint64_t v2;
  uint64_t v3;
  __CFXTextureSampler *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (__CFXTextureSampler *)objc_msgSend_materialProperty(self, a2, v2, v3);
  if (result)
    return (__CFXTextureSampler *)sub_1B1842028((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->_parent, sel_copyAnimationChannelForKeyPath_property_, a3, self);
}

- (void)__CFObject
{
  uint64_t v2;
  uint64_t v3;

  return (void *)objc_msgSend___CFObject(self->_parent, a2, v2, v3);
}

- (__CFXAnimationManager)animationManager
{
  uint64_t v2;
  uint64_t v3;
  __CFXAnimationManager *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return (__CFXAnimationManager *)sub_1B187A97C((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v10 = (void *)objc_msgSend_objectForKey_(self->_animations, v8, (uint64_t)a4, v9);
  v16 = objc_msgSend_animation(v10, v11, v12, v13) == (_QWORD)a3;
  if (v16)
  {
    objc_msgSend_removeObjectForKey_(self->_animations, v14, (uint64_t)a4, v15);
    v20 = (_QWORD *)objc_msgSend___CFObject(self, v17, v18, v19);
    if ((sub_1B193EBA0(v20) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity"), v21, v22, v23, v24, v25, v26, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    sub_1B193F164(v20, a4, 1, v22, v23, v24, v25, v26);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v16;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  VFXOrderedDictionary *animations;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[7];

  if (a3)
  {
    v9 = (uint64_t)a4;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(VFXOrderedDictionary);
      self->_animations = animations;
    }
    objc_msgSend_setObject_forKey_(animations, v15, (uint64_t)a3, v9);
    os_unfair_lock_unlock(&self->_animationsLock);
    v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B18CD9AC;
    v22[3] = &unk_1E63D5350;
    v22[4] = a3;
    v22[5] = self;
    v22[6] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation player on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (a3)
  {
    v9 = (uint64_t)a4;
    v10 = (uint64_t)a3;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v15, v10, v16);
    v17 = (void *)objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
    objc_msgSend_addAnimationPlayer_forKey_(self, v18, (uint64_t)v17, v9);
    objc_msgSend_play(v17, v19, v20, v21);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3
{
  objc_msgSend_addAnimation_forKey_(self, a2, (uint64_t)a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B18CDB7C;
  v12[3] = &unk_1E63D5378;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];
  float v15;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B18CDC28;
  v14[3] = &unk_1E63D53A0;
  v14[4] = self;
  v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B18CDCE4;
    v13[3] = &unk_1E63D53C8;
    v13[4] = self;
    v13[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];
  float v16;

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B18CDDA8;
    v15[3] = &unk_1E63D53F0;
    v15[4] = self;
    v15[5] = a3;
    v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v7 = (NSArray *)objc_msgSend_allKeys(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  if (objc_msgSend_count(v7, v8, v9, v10))
    return v7;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_syncObjCAnimations
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
  const char *v14;
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
  uint64_t v31;
  uint64_t v32;
  const __CFDictionary *v33;
  uint64_t v34;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(VFXOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
  if (v17)
  {
    v25 = (uint64_t)v17;
    if ((sub_1B193EBA0(v17) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. sync animations: cftype is not an entity"), v27, v28, v29, v30, v31, v32, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    v33 = sub_1B193EF14(v25, v26, v27, v28, v29, v30, v31, v32);
    if (v33)
    {
      v34 = (uint64_t)v33;
      os_unfair_lock_lock(&self->_animationsLock);
      sub_1B18C00E8(v34, (uint64_t)sub_1B18C2084, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v13)
    sub_1B18797B4(v13, v18, v19, v20, v21, v22, v23, v24);
}

- (id)_vfxAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
    {
      v9 = (void *)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
      v3 = (id)objc_msgSend_animation(v9, v10, v11, v12);
    }
    else
    {
      v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_msgSend_animationKeys(a3, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = (void *)objc_msgSend_animationPlayerForKey_(a3, v9, v14, v10);
        v19 = (void *)objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_addAnimationPlayer_forKey_(self, v20, (uint64_t)v19, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a5;
  v7 = a3;
  v9 = objc_msgSend___CFObject(self, a2, a3, (uint64_t)a4);
  if (v9)
  {
    v13 = (void *)v9;
    v14 = objc_msgSend_animationManager(self, v10, v11, v12);
    if (v14)
    {
      v15 = v14;
      v16 = CACurrentMediaTime();
      sub_1B17F41C0(v15, v13, a4, v7, v5, v17, v18, v19, v16);
    }
  }
}

- (id)_vfxBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  CFXBinding *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSMutableDictionary *bindings;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD v29[17];

  if (self != a4)
  {
    v29[15] = v6;
    v29[16] = v7;
    v13 = objc_alloc_init(CFXBinding);
    objc_msgSend_setSourceObject_(v13, v14, (uint64_t)a4, v15);
    objc_msgSend_setKeyPathDst_(v13, v16, (uint64_t)a3, v17);
    objc_msgSend_setKeyPathSrc_(v13, v18, (uint64_t)a5, v19);
    objc_msgSend_setOptions_(v13, v20, (uint64_t)a6, v21);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    objc_msgSend_setValue_forKey_(bindings, v22, (uint64_t)v13, (uint64_t)a3);

    v27 = objc_msgSend_worldRef(self, v24, v25, v26);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B18CE288;
    v29[3] = &unk_1E63D5418;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a3;
    v29[7] = a5;
    v29[8] = a6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v28, v27, (uint64_t)self, v29);
  }
}

- (void)unbindAnimatablePath:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[6];

  objc_msgSend_removeObjectForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_bindings, v6, v7, v8))
  {

    self->_bindings = 0;
  }
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B18CE3B4;
  v14[3] = &unk_1E63D53C8;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAllBindings
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  self->_bindings = 0;
  v6 = objc_msgSend_worldRef(self, v3, v4, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B18CE460;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;

  return (__CFXWorld *)objc_msgSend_worldRef(self->_parent, a2, v2, v3);
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

- (void)_syncObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t IfNeeded;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *contentTransform;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  unsigned int propertyType;
  char v104;
  char v105;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  IfNeeded = objc_msgSend_materialPropertyCreateIfNeeded_(self, v6, 0, v8);
  if (IfNeeded)
  {
    v22 = IfNeeded;
    v30 = sub_1B1842028(IfNeeded, v15, v16, v17, v18, v19, v20, v21);
    if (v30 || (v30 = sub_1B180CF10()) != 0)
    {
      *((_BYTE *)self + 58) = *((_BYTE *)self + 58) & 0xFC | sub_1B180CDF0(v30, (uint64_t)v23, v24, v25, v26, v27, v28, v29) & 3;
      *((_BYTE *)self + 58) = (4 * (sub_1B180CE38(v30, v31, v32, v33, v34, v35, v36, v37) & 3)) | *((_BYTE *)self + 58) & 0xF3;
      *((_BYTE *)self + 58) = (16 * (sub_1B180CE80(v30, v38, v39, v40, v41, v42, v43, v44) & 3)) | *((_BYTE *)self + 58) & 0xCF;
      *((_BYTE *)self + 59) = *((_BYTE *)self + 59) & 0xF8 | sub_1B180CD18(v30, v45, v46, v47, v48, v49, v50, v51) & 7;
      *((_BYTE *)self + 59) = (8 * (sub_1B180CD60(v30, v52, v53, v54, v55, v56, v57, v58) & 7)) | *((_BYTE *)self + 59) & 0xC7;
      *(&self->_maxAnisotropy + 1) = sub_1B180CEC8(v30, v59, v60, v61, v62, v63, v64, v65);
    }
    self->_mappingChannel = objc_msgSend__presentationMappingChannel(self, v23, v24, v25);
    LOBYTE(self->_intensity) = LOBYTE(self->_intensity) & 0xF0 | sub_1B18433B4(v22, v66, v67, v68, v69, v70, v71, v72) & 0xF;
    self->_maxAnisotropy = sub_1B1841E14(v22, v73, v74, v75, v76, v77, v78, v79);
    if (sub_1B1843548(v22))
      v80 = 4;
    else
      v80 = 0;
    *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v80;
    if (sub_1B1842B54(v22))
    {
      objc_msgSend___allocateContentTransformIfNeeded(self, v81, v82, v83);
      v91 = (_OWORD *)sub_1B1842B0C(v22, v84, v85, v86, v87, v88, v89, v90);
      contentTransform = self->_contentTransform;
      v101 = v91[2];
      v100 = v91[3];
      v102 = v91[1];
      *(_OWORD *)contentTransform = *v91;
      *((_OWORD *)contentTransform + 1) = v102;
      *((_OWORD *)contentTransform + 2) = v101;
      *((_OWORD *)contentTransform + 3) = v100;
      if (!v13)
        return;
LABEL_22:
      sub_1B18797B4(v13, v92, v93, v94, v95, v96, v97, v98);
      return;
    }
    free(self->_contentTransform);
    self->_contentTransform = 0;
    if (v13)
      goto LABEL_22;
  }
  else
  {
    *((_BYTE *)self + 58) = *((_BYTE *)self + 58) & 0xC0 | 0x2A;
    *((_BYTE *)self + 59) = *((_BYTE *)self + 59) & 0xC0 | 9;
    *(_QWORD *)&self->_maxAnisotropy = 0x7F7FFFFF3F800000;
    propertyType = self->_propertyType;
    if (propertyType == 16)
      v104 = 8;
    else
      v104 = 15;
    LOBYTE(self->_intensity) = LOBYTE(self->_intensity) & 0xF0 | v104;
    if (sub_1B1843520(propertyType))
      v105 = 4;
    else
      v105 = 0;
    *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v105;
    if (v13)
      goto LABEL_22;
  }
}

- (void)copyPropertiesFrom:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t isColorManaged;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;

  if (*((_QWORD *)a3 + 13)
    && (objc_msgSend_contents(a3, a2, (uint64_t)a3, v3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend_contents(a3, a2, (uint64_t)a3, v3);
    objc_msgSend__setImagePath_withResolvedURL_(self, v7, v6, *((_QWORD *)a3 + 13));
  }
  else
  {
    v11 = objc_msgSend_contents(a3, a2, (uint64_t)a3, v3);
    objc_msgSend_setContents_(self, v12, v11, v13);
  }
  v14 = objc_msgSend_minificationFilter(a3, v8, v9, v10);
  objc_msgSend_setMinificationFilter_(self, v15, v14, v16);
  v20 = objc_msgSend_magnificationFilter(a3, v17, v18, v19);
  objc_msgSend_setMagnificationFilter_(self, v21, v20, v22);
  v26 = objc_msgSend_mipFilter(a3, v23, v24, v25);
  objc_msgSend_setMipFilter_(self, v27, v26, v28);
  objc_msgSend_contentsTransform(a3, v29, v30, v31);
  objc_msgSend_setContentsTransform_(self, v32, v33, v34);
  v38 = objc_msgSend_wrapS(a3, v35, v36, v37);
  objc_msgSend_setWrapS_(self, v39, v38, v40);
  v44 = objc_msgSend_wrapT(a3, v41, v42, v43);
  objc_msgSend_setWrapT_(self, v45, v44, v46);
  objc_msgSend_intensity(a3, v47, v48, v49);
  objc_msgSend_setIntensity_(self, v50, v51, v52);
  isColorManaged = objc_msgSend_isColorManaged(a3, v53, v54, v55);
  objc_msgSend_setColorManaged_(self, v57, isColorManaged, v58);
  v62 = objc_msgSend_mappingChannel(a3, v59, v60, v61);
  objc_msgSend_setMappingChannel_(self, v63, v62, v64);
  v68 = objc_msgSend_textureComponents(a3, v65, v66, v67);
  objc_msgSend_setTextureComponents_(self, v69, v68, v70);
  objc_msgSend__copyAnimationsFrom_(self, v71, (uint64_t)a3, v72);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_materialPropertyWithContents_(v4, v5, 0, v6);
  v8 = v7;
  objc_msgSend_copyPropertiesFrom_(v7, v9, (uint64_t)self, v10);
  return v7;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)presentationMaterialProperty
{
  id v2;
  VFXMaterialProperty *v3;
  const char *v4;
  uint64_t v5;

  v2 = self;
  if ((*((_BYTE *)self + 8) & 1) == 0)
  {
    v3 = [VFXMaterialProperty alloc];
    return (id)objc_msgSend_initPresentationMaterialPropertyWithModelProperty_(v3, v4, (uint64_t)v2, v5);
  }
  return self;
}

- (id)presentationObject
{
  return (id)((uint64_t (*)(VFXMaterialProperty *, char *))MEMORY[0x1E0DE7D20])(self, sel_presentationMaterialProperty);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)_updateMaterialFilters
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
  uint64_t v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  const void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v5 = objc_msgSend_materialProperty(self, a2, v2, v3);
  if (v5)
  {
    v13 = v5;
    v14 = sub_1B1842028(v5, v6, v7, v8, v9, v10, v11, v12);
    v22 = *((unsigned __int8 *)self + 58);
    v23 = v22 & 3;
    v24 = (v22 >> 2) & 3;
    v25 = (v22 >> 4) & 3;
    v26 = *((unsigned __int8 *)self + 59);
    v27 = v26 & 7;
    v28 = (v26 >> 3) & 7;
    if (v14)
      v29 = sub_1B180CDA8(v14, v15, v16, v17, v18, v19, v20, v21);
    else
      v29 = 2;
    sub_1B180CC5C(v23, v24, v25, v27, v28, v29, *(&self->_maxAnisotropy + 1));
    v31 = v30;
    sub_1B18420F4(v13, v30, v32, v33, v34, v35, v36, v37, v38);
    CFRelease(v31);
  }
}

- (void)_updateMaterialPropertyTransform:(uint64_t)a3
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;

  v8 = objc_msgSend_materialProperty(a1, a2, a3, a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8);
  if (v8)
    sub_1B1842B64(v8, &v15, v9, v10, v11, v12, v13, v14);
}

- (void)_layerDidChange:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_worldRef(self, v6, v7, v8);
  objc_msgSend_postNotificationName_object_(v5, v10, (uint64_t)CFSTR("kCFXWorldDidUpdateNotification"), v9);
}

- (void)_updateMaterialMTLTexture:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
    sub_1B1843174(v5, a3, v6, v7, v8, v9, v10, v11, v12);
}

- (void)_updateMaterialLayer:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  CFTypeRef v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const void *v29;
  VFXCoreAnimationSource *v30;
  const char *v31;
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
  uint64_t v42;

  v6 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v6)
  {
    v14 = v6;
    if (a3)
    {
      v15 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v7, v8, v9);
      objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)self, (uint64_t)sel__layerDidChange_, CFSTR("VFXLayerTreeDidChange"), a3);
      v17 = sub_1B18BCED0(a3);
      if (v17)
      {
        sub_1B1843200(v14, v17, v18, v19, v20, v21, v22, v23, v42);
      }
      else
      {
        v29 = (const void *)sub_1B181F08C(0);
        v30 = objc_alloc_init(VFXCoreAnimationSource);
        objc_msgSend_setLayer_(v30, v31, (uint64_t)a3, v32);
        objc_msgSend_connectToProxy_(v30, v33, (uint64_t)v29, v34);

        sub_1B18BCEF4(v29, a3);
        sub_1B1843200(v14, v29, v35, v36, v37, v38, v39, v40, v41);
        if (v29)
          CFRelease(v29);
      }
    }
    else
    {
      sub_1B1843200(v6, 0, v8, v9, v10, v11, v12, v13, v41);
      v27 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26);
      objc_msgSend_removeObserver_name_object_(v27, v28, (uint64_t)self, (uint64_t)CFSTR("VFXLayerTreeDidChange"), 0);
    }
  }
}

- (void)_updateMaterialAVPlayer:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef v13;
  const void *v14;
  const void *v15;
  VFXAVPlayerSource *v16;
  const char *v17;
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

  v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v12 = v5;
    if (!a3)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v13 = sub_1B18BCED0(a3);
    if (v13)
    {
      v14 = v13;
      v5 = v12;
LABEL_6:
      sub_1B1843200(v5, v14, v6, v7, v8, v9, v10, v11, v28);
      return;
    }
    v15 = (const void *)sub_1B181F08C(1);
    v16 = objc_alloc_init(VFXAVPlayerSource);
    objc_msgSend_setPlayer_(v16, v17, (uint64_t)a3, v18);
    objc_msgSend_connectToProxy_(v16, v19, (uint64_t)v15, v20);

    sub_1B18BCEF4(v15, a3);
    sub_1B1843200(v12, v15, v21, v22, v23, v24, v25, v26, v27);
    if (v15)
      CFRelease(v15);
  }
}

- (void)_updateMaterialCaptureDevice:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef v13;
  const void *v14;
  const void *v15;
  VFXCaptureDeviceSource *v16;
  const char *v17;
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

  v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v12 = v5;
    if (!a3)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v13 = sub_1B18BCED0(a3);
    if (v13)
    {
      v14 = v13;
      v5 = v12;
LABEL_6:
      sub_1B1843200(v5, v14, v6, v7, v8, v9, v10, v11, v28);
      return;
    }
    v15 = (const void *)sub_1B181F08C(2);
    v16 = objc_alloc_init(VFXCaptureDeviceSource);
    objc_msgSend_setCaptureDevice_(v16, v17, (uint64_t)a3, v18);
    objc_msgSend_connectToProxy_(v16, v19, (uint64_t)v15, v20);

    sub_1B18BCEF4(v15, a3);
    sub_1B1843200(v12, v15, v21, v22, v23, v24, v25, v26, v27);
    if (v15)
      CFRelease(v15);
  }
}

- (void)_updateMaterialCaptureDeviceOutputConsumerSource:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef v13;
  const void *v14;
  const void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v12 = v5;
    if (!a3)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v13 = sub_1B18BCED0(a3);
    if (v13)
    {
      v14 = v13;
      v5 = v12;
LABEL_6:
      sub_1B1843200(v5, v14, v6, v7, v8, v9, v10, v11, v25);
      return;
    }
    v15 = (const void *)sub_1B181F08C(3);
    objc_msgSend_connectToProxy_(a3, v16, (uint64_t)v15, v17);
    sub_1B18BCEF4(v15, a3);
    sub_1B1843200(v12, v15, v18, v19, v20, v21, v22, v23, v24);
    if (v15)
      CFRelease(v15);
  }
}

- (void)_updateMaterialTextureProvider:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef v13;
  const void *v14;
  const void *v15;
  VFXMaterialPropertyTextureProviderSource *v16;
  const char *v17;
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

  v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v12 = v5;
    if (!a3)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v13 = sub_1B18BCED0(a3);
    if (v13)
    {
      v14 = v13;
      v5 = v12;
LABEL_6:
      sub_1B1843200(v5, v14, v6, v7, v8, v9, v10, v11, v28);
      return;
    }
    v15 = (const void *)sub_1B181F08C(0);
    v16 = objc_alloc_init(VFXMaterialPropertyTextureProviderSource);
    objc_msgSend_setTextureProvider_(v16, v17, (uint64_t)a3, v18);
    objc_msgSend_connectToProxy_(v16, v19, (uint64_t)v15, v20);

    sub_1B18BCEF4(v15, a3);
    sub_1B1843200(v12, v15, v21, v22, v23, v24, v25, v26, v27);
    if (v15)
      CFRelease(v15);
  }
}

- (void)_updatePrecomputedLightingEnvironment:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v5)
    sub_1B18432D4(v5, a3, v6, v7, v8, v9, v10, v11, v12);
}

- (void)_updateMaterialImage:(id)a3
{
  uint64_t v3;
  const char *v6;
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

  objc_msgSend__setCFXImageRef_(self, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_materialProperty(self, v6, v7, v8);
  if (v9)
    sub_1B1841D60(v9, a3, v10, v11, v12, v13, v14, v15, v16);
}

- (void)_updateMaterialAsset:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, v3, v4, v5, v6, v7, (uint64_t)"asset");
  v10 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v10)
    sub_1B1842998(v10, a3, v11, v12, v13, v14, v15, v16, v17);
}

- (void)_updateMaterialNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int32x2_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int32x4_t v22;
  int32x2_t v28;
  int32x4_t v29;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, v3, v4, v5, v6, v7, (uint64_t)"value");
  v10 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v10)
  {
    v14 = v10;
    objc_msgSend_floatValue(a3, v11, v12, v13);
    v28 = v15;
    if (sub_1B1843540(v14) == 4)
    {
      v22 = vdupq_lane_s32(v28, 0);
    }
    else
    {
      __asm { FMOV            V0.4S, #1.0 }
      _Q0.i32[0] = v28.i32[0];
      v22 = vzip1q_s32(_Q0, _Q0);
      v22.i32[2] = v28.i32[0];
    }
    v29 = v22;
    sub_1B184105C(v14, (float *)v29.i32, v16, v17, v18, v19, v20, v21);
  }
}

- (void)_updateMaterialColor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, v3, v4, v5, v6, v7, (uint64_t)"color");
  v10 = objc_msgSend_materialProperty(self, a2, (uint64_t)a3, v3);
  if (v10)
  {
    v11 = v10;
    v12 = sub_1B1843540(v10);
    v13 = sub_1B18435C0(v12);
    v21[0] = sub_1B18BCF20(a3, v13);
    v21[1] = v14;
    sub_1B184105C(v11, (float *)v21, v15, v16, v17, v18, v19, v20);
  }
}

+ (id)captureDeviceOutputConsumer
{
  return (id)((uint64_t (*)(id, char *, _QWORD))MEMORY[0x1E0DE7D20])(a1, sel_captureDeviceOutputConsumerWithOptions_, 0);
}

+ (id)captureDeviceOutputConsumerWithOptions:(id)a3
{
  VFXCaptureDeviceOutputConsumerSource *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXCaptureDeviceOutputConsumerSource alloc];
  return (id)objc_msgSend_initWithOptions_(v4, v5, (uint64_t)a3, v6);
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("contentsTransform"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_contentsTransform(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("linearExtendedSRGBColor"), v8))
  {
    v17 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_linearExtendedSRGBColor(self, v14, v15, v16);
    return (id)objc_msgSend_valueWithVFXFloat4_(v17, v18, v19, v20);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)VFXMaterialProperty;
    return -[VFXMaterialProperty valueForKey:](&v21, sel_valueForKey_, a3);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("contentsTransform"), (uint64_t)a4))
  {
    objc_msgSend_VFXMatrix4Value(a3, v7, v8, v9);
    objc_msgSend_setContentsTransform_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("linearExtendedSRGBColor"), v9))
  {
    objc_msgSend_VFXFloat4Value(a3, v13, v14, v15);
    MEMORY[0x1E0DE7D20](self, sel_setLinearExtendedSRGBColor_, v16, v17);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VFXMaterialProperty;
    -[VFXMaterialProperty setValue:forKey:](&v18, sel_setValue_forKey_, a3, a4);
  }
}

- (void)_customEncodingOfVFXMaterialProperty:(id)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *contentTransform;
  int contentType;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id contents;
  const char *v21;
  uint64_t v22;
  double v23;
  char intensity_low;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  int v30;
  __CFXImage *cfxImage;
  const char *v32;
  uint64_t v33;

  contentTransform = self->_contentTransform;
  if (contentTransform)
    sub_1B18BD294(a3, CFSTR("contentsTransform"), *(__n128 *)contentTransform, *((__n128 *)contentTransform + 1), *((__n128 *)contentTransform + 2), *((__n128 *)contentTransform + 3));
  if (self->_contents)
  {
    contentType = self->_contentType;
    if (contentType == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        sub_1B18BF5F4(a3, CFSTR("imageArray"), self->_contents, v8);
        goto LABEL_17;
      }
    }
    else if (contentType == 6)
    {
      objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_contents, (uint64_t)CFSTR("asset"));
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v13 = (void *)objc_msgSend_options(a3, v10, v11, v12),
          v16 = (void *)objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("VFXWorldExportEmbedImages"), v15), !objc_msgSend_BOOLValue(v16, v17, v18, v19))|| (contents = self->_runtimeResolvedURL) == 0)
    {
      contents = self->_contents;
    }
    goto LABEL_16;
  }
  contents = self->_contents;
  if (!contents)
  {
    cfxImage = self->_cfxImage;
    if (!cfxImage)
      goto LABEL_17;
    goto LABEL_34;
  }
  v30 = self->_contentType;
  if (v30 == 1)
  {
LABEL_16:
    sub_1B18BF0F4(a3, (uint64_t)CFSTR("image"), contents);
    goto LABEL_17;
  }
  cfxImage = self->_cfxImage;
  if (cfxImage)
  {
LABEL_34:
    sub_1B18BEB2C(a3, (uint64_t)CFSTR("image"), (uint64_t)cfxImage);
    goto LABEL_17;
  }
  if (!self->_contentType)
  {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)contents, (uint64_t)CFSTR("color"));
    v30 = self->_contentType;
  }
  if (v30 == 5)
  {
    objc_msgSend_floatValue(self->_contents, v7, (uint64_t)contents, v9);
    objc_msgSend_encodeFloat_forKey_(a3, v32, (uint64_t)CFSTR("float"), v33);
    v30 = self->_contentType;
  }
  if (v30 == 2)
  {
    sub_1B18BDAB8(a3, (const char *)self->_contents, (uint64_t)CFSTR("layer"));
    v30 = self->_contentType;
  }
  if (v30 == 3)
  {
    sub_1B18BDA60(a3, (uint64_t)self->_contents, (uint64_t)CFSTR("data"));
    v30 = self->_contentType;
  }
  if (v30 == 11)
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_contents, (uint64_t)CFSTR("precomputedLightingEnvironment"));
LABEL_17:
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_mappingChannel, (uint64_t)CFSTR("mappingChannel"));
  intensity_low = LOBYTE(self->_intensity);
  if ((intensity_low & 0xF) != 0xF)
    objc_msgSend_encodeInteger_forKey_(a3, v21, intensity_low & 0xF, (uint64_t)CFSTR("textureComponents"));
  LODWORD(v23) = *((_DWORD *)&self->_maxAnisotropy + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("maxAnisotropy"), v22, v23);
  objc_msgSend_encodeInteger_forKey_(a3, v25, *((_BYTE *)self + 58) & 3, (uint64_t)CFSTR("minificationFilter"));
  objc_msgSend_encodeInteger_forKey_(a3, v26, ((unint64_t)*((unsigned __int8 *)self + 58) >> 2) & 3, (uint64_t)CFSTR("magnificationFilter"));
  objc_msgSend_encodeInteger_forKey_(a3, v27, ((unint64_t)*((unsigned __int8 *)self + 58) >> 4) & 3, (uint64_t)CFSTR("mipFilter"));
  objc_msgSend_encodeInteger_forKey_(a3, v28, *((_BYTE *)self + 59) & 7, (uint64_t)CFSTR("wrapS"));
  objc_msgSend_encodeInteger_forKey_(a3, v29, ((unint64_t)*((unsigned __int8 *)self + 59) >> 3) & 7, (uint64_t)CFSTR("wrapT"));
}

- (void)_didDecodeVFXMaterialProperty:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  if (self->_customMaterialPropertyName && !self->_customMaterialProperty)
    self->_customMaterialProperty = (__CFXMaterialProperty *)sub_1B1840FAC(0, 26);
  v5 = sub_1B18BEA64(a3, (uint64_t)CFSTR("image"));
  if (v5)
  {
    v8 = v5;
    v9 = (void *)objc_msgSend_valueForKey_(VFXTransaction, v6, (uint64_t)CFSTR("VFXWorldLoadingContextKey"), v7);
    v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("VFXWorldLoaderAssetPathResolver"), v11);
    if (v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_msgSend_absoluteURLForAssetPath_(v13, v14, (uint64_t)v8, v15);
        if (v16)
        {
          objc_msgSend__setImagePath_withResolvedURL_(self, v17, (uint64_t)v8, v16);
          goto LABEL_30;
        }
      }
    }
    v20 = (void *)sub_1B18774E4((uint64_t)a3);
    if (v20)
    {
      v23 = VFXResolveImageContents(v8, v20);
      if (v23)
      {
        v24 = (uint64_t)v23;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v25, v24, v26);
        objc_msgSend__setImagePath_withResolvedURL_(self, v25, (uint64_t)v8, v24);
        goto LABEL_30;
      }
    }
LABEL_29:
    objc_msgSend_setContents_(self, v21, (uint64_t)v8, v22);
    goto LABEL_30;
  }
  v27 = objc_opt_class();
  v29 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("asset"));
  if (v29
    || (v32 = objc_opt_class(),
        (v29 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("data"))) != 0))
  {
    objc_msgSend_setContents_(self, v30, v29, v31);
    goto LABEL_30;
  }
  v34 = sub_1B18BF730(a3, CFSTR("imageArray"));
  if (v34)
  {
    v8 = v34;
    v35 = sub_1B18774E4((uint64_t)a3);
    if (v35)
    {
      v36 = (void *)v35;
      v37 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v21, 6, v22);
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v38, (uint64_t)&v116, (uint64_t)v120, 16);
      if (!v39)
      {
LABEL_28:
        objc_msgSend__updateCFXImageWithContents_(self, v40, (uint64_t)v37, v41);
        objc_msgSend__clearContents(self, v47, v48, v49);
        self->_contents = v8;
        self->_contentType = 1;
        goto LABEL_30;
      }
      v42 = v39;
      v43 = *(_QWORD *)v117;
LABEL_22:
      v44 = 0;
      while (1)
      {
        if (*(_QWORD *)v117 != v43)
          objc_enumerationMutation(v8);
        v45 = VFXResolveImageContents(*(void **)(*((_QWORD *)&v116 + 1) + 8 * v44), v36);
        if (!v45)
          break;
        objc_msgSend_addObject_(v37, v21, (uint64_t)v45, v22);
        if (v42 == ++v44)
        {
          v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v46, (uint64_t)&v116, (uint64_t)v120, 16);
          if (v42)
            goto LABEL_22;
          goto LABEL_28;
        }
      }
    }
    goto LABEL_29;
  }
  v79 = objc_opt_class();
  v81 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v80, v79, (uint64_t)CFSTR("color"));
  if (v81)
  {
    objc_msgSend_setColor_(self, v82, v81, v83);
  }
  else
  {
    v87 = pthread_main_np();
    if (!v87)
    {
      objc_msgSend_begin(MEMORY[0x1E0CD28B0], v84, v85, v86);
      objc_msgSend_activateBackground_(MEMORY[0x1E0CD28B0], v88, 1, v89);
    }
    v90 = (void *)MEMORY[0x1E0C99E60];
    v91 = objc_opt_class();
    v94 = (void *)objc_msgSend_setWithObject_(v90, v92, v91, v93);
    v95 = sub_1B18BDB20(a3, (uint64_t)CFSTR("layer"), v94);
    if (v95)
    {
      objc_msgSend_setLayer_(self, v96, v95, v98);
      if (!v87)
        objc_msgSend_commit(MEMORY[0x1E0CD28B0], v18, v99, v19);
    }
    else
    {
      if (!v87)
        objc_msgSend_commit(MEMORY[0x1E0CD28B0], v96, v97, v98);
      if (objc_msgSend_containsValueForKey_(a3, v96, (uint64_t)CFSTR("float"), v98))
      {
        objc_msgSend_decodeFloatForKey_(a3, v100, (uint64_t)CFSTR("float"), v101);
        v105 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v102, v103, v104);
        objc_msgSend_setFloatValue_(self, v106, v105, v107);
      }
      else if (objc_msgSend_containsValueForKey_(a3, v100, (uint64_t)CFSTR("precomputedLightingEnvironment"), v101))
      {
        v108 = (void *)MEMORY[0x1E0C99E60];
        v109 = objc_opt_class();
        v112 = (void *)objc_msgSend_setWithObject_(v108, v110, v109, v111);
        v113 = sub_1B18BDB20(a3, (uint64_t)CFSTR("precomputedLightingEnvironment"), v112);
        objc_msgSend_setPrecomputedLightingEnvironment_(self, v114, v113, v115);
      }
    }
  }
LABEL_30:
  v50 = objc_msgSend_decodeIntegerForKey_(a3, v18, (uint64_t)CFSTR("mappingChannel"), v19);
  if (v50 != -1)
    objc_msgSend_setMappingChannel_(self, v51, v50, v52);
  if (objc_msgSend_containsValueForKey_(a3, v51, (uint64_t)CFSTR("textureComponents"), v52))
  {
    v55 = objc_msgSend_decodeIntegerForKey_(a3, v53, (uint64_t)CFSTR("textureComponents"), v54);
    objc_msgSend_setTextureComponents_(self, v56, v55, v57);
  }
  *((_BYTE *)self + 58) = *((_BYTE *)self + 58) & 0xFC | objc_msgSend_decodeIntegerForKey_(a3, v53, (uint64_t)CFSTR("minificationFilter"), v54) & 3;
  *((_BYTE *)self + 58) = (4
                         * (objc_msgSend_decodeIntegerForKey_(a3, v58, (uint64_t)CFSTR("magnificationFilter"), v59) & 3)) | *((_BYTE *)self + 58) & 0xF3;
  *((_BYTE *)self + 58) = (16 * (objc_msgSend_decodeIntegerForKey_(a3, v60, (uint64_t)CFSTR("mipFilter"), v61) & 3)) | *((_BYTE *)self + 58) & 0xCF;
  *((_BYTE *)self + 59) = *((_BYTE *)self + 59) & 0xF8 | objc_msgSend_decodeIntegerForKey_(a3, v62, (uint64_t)CFSTR("wrapS"), v63) & 7;
  *((_BYTE *)self + 59) = (8 * (objc_msgSend_decodeIntegerForKey_(a3, v64, (uint64_t)CFSTR("wrapT"), v65) & 7)) | *((_BYTE *)self + 59) & 0xC7;
  objc_msgSend__updateMaterialFilters(self, v66, v67, v68);
  *((_DWORD *)&self->_maxAnisotropy + 1) = 2139095039;
  if (objc_msgSend_containsValueForKey_(a3, v69, (uint64_t)CFSTR("maxAnisotropy"), v70))
  {
    objc_msgSend_decodeFloatForKey_(a3, v71, (uint64_t)CFSTR("maxAnisotropy"), v72);
    if (v74 != 3.4028e38)
      objc_msgSend_setMaxAnisotropy_(self, v71, v73, v72);
  }
  if (objc_msgSend_containsValueForKey_(a3, v71, (uint64_t)CFSTR("contentsTransform"), v72))
  {
    *(_QWORD *)&v75 = sub_1B18BD380(a3, CFSTR("contentsTransform")).n128_u64[0];
    objc_msgSend_setContentsTransform_(self, v76, v77, v78, v75);
  }
}

- (BOOL)_hasDefaultValues
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  BOOL result;
  float *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[3];
  char v11;

  if ((*((_BYTE *)self + 8) & 2) == 0
    || self->_customMaterialPropertyName
    || objc_msgSend_count(self->_animations, a2, v2, v3)
    || self->_contentType
    || self->_mappingChannel
    || self->_maxAnisotropy != 1.0
    || (*((_BYTE *)self + 58) & 0x3F) != 0x2A
    || (*((_BYTE *)self + 59) & 0x3F) != 9)
  {
    return 0;
  }
  v5 = LOBYTE(self->_intensity) & 0xF;
  if (v5 == 15 || (result = 0, v5 == 8) && self->_propertyType == 16)
  {
    if (!self->_contentTransform && *(&self->_maxAnisotropy + 1) == 3.4028e38)
    {
      if (!self->_contents)
        return 1;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (float *)sub_1B1840E44(self->_propertyType);
        v11 = 1;
        v10[0] = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(self->_contents, v8, 1, (uint64_t)&v11);
        v10[1] = v9;
        if (v11)
        {
          if (sub_1B179CC58((float *)v10, v7))
            return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id parent;
  unsigned int propertyType;
  const char *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  NSString *customMaterialPropertyName;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t isColorManaged;
  const char *v26;
  uint64_t v27;

  if ((*((_BYTE *)self + 8) & 1) != 0)
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  objc_msgSend__customEncodingOfVFXMaterialProperty_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v6, (*((unsigned __int8 *)self + 8) >> 1) & 1, (uint64_t)CFSTR("isCommonProfileProperty"));
  parent = self->_parent;
  if (parent)
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)parent, (uint64_t)CFSTR("parent"));
  propertyType = self->_propertyType;
  if (propertyType < 0x1B && ((0x7E1FFFFu >> propertyType) & 1) != 0)
  {
    objc_msgSend_encodeInteger_forKey_(a3, v7, qword_1B2247A40[(char)propertyType], (uint64_t)CFSTR("propertyType"));
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: unknown material property type for archiving"), (uint64_t)parent, v8, v9, v10, v11, v12, v27);
    objc_msgSend_encodeInteger_forKey_(a3, v15, 0, (uint64_t)CFSTR("propertyType"));
  }
  customMaterialPropertyName = self->_customMaterialPropertyName;
  if (customMaterialPropertyName)
    objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)customMaterialPropertyName, (uint64_t)CFSTR("customMaterialPropertyName"));
  *(float *)&v18 = self->_maxAnisotropy;
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("intensity"), v17, v18);
  if (objc_msgSend_materialPropertyCreateIfNeeded_(self, v20, 0, v21))
  {
    isColorManaged = objc_msgSend_isColorManaged(self, v22, v23, v24);
    objc_msgSend_encodeBool_forKey_(a3, v26, isColorManaged, (uint64_t)CFSTR("isColorManaged"));
  }
  sub_1B18BDCC8(a3, self, v23, v24);
}

- (VFXMaterialProperty)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMaterialProperty *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  objc_super v54;
  _QWORD v55[6];

  v55[5] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)VFXMaterialProperty;
  v7 = -[VFXMaterialProperty init](&v54, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *((_BYTE *)v7 + 8) |= 8u;
    v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("propertyType"), v12);
    if (v13 < 0x19 && ((0x17FFFFDu >> v13) & 1) != 0)
    {
      v20 = byte_1B2247B18[v13];
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: unknown archived material property type"), v14, v15, v16, v17, v18, v19, (uint64_t)v54.receiver);
      v20 = 0;
    }
    v7->_propertyType = v20;
    v21 = (void *)MEMORY[0x1E0C99E60];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    v55[2] = objc_opt_class();
    v55[3] = objc_opt_class();
    v55[4] = objc_opt_class();
    v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v55, 5);
    v26 = objc_msgSend_setWithArray_(v21, v24, v23, v25);
    v28 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v27, v26, (uint64_t)CFSTR("parent"));
    if ((VFXMaterialProperty *)v28 == v7)
      v31 = 0;
    else
      v31 = v28;
    v7->_parent = (id)v31;
    objc_msgSend__customDecodingOfVFXMaterialProperty_(v7, v29, (uint64_t)a3, v30);
    *((_BYTE *)v7 + 8) = (2
                        * (objc_msgSend_decodeIntForKey_(a3, v32, (uint64_t)CFSTR("isCommonProfileProperty"), v33) & 1)) | *((_BYTE *)v7 + 8) & 0xFD;
    v34 = objc_opt_class();
    v7->_customMaterialPropertyName = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v35, v34, (uint64_t)CFSTR("customMaterialPropertyName"));
    objc_msgSend_decodeFloatForKey_(a3, v36, (uint64_t)CFSTR("intensity"), v37);
    objc_msgSend_setIntensity_(v7, v38, v39, v40);
    v41 = CFSTR("sRGB");
    if ((objc_msgSend_containsValueForKey_(a3, v42, (uint64_t)CFSTR("sRGB"), v43) & 1) != 0
      || (v41 = CFSTR("colorManaged"),
          objc_msgSend_containsValueForKey_(a3, v44, (uint64_t)CFSTR("colorManaged"), v45)))
    {
      v46 = objc_msgSend_decodeBoolForKey_(a3, v44, (uint64_t)v41, v45);
      objc_msgSend_setColorManaged_(v7, v47, v46, v48);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B18BDFA4(a3, v7);
    objc_msgSend__didDecodeVFXMaterialProperty_(v7, v49, (uint64_t)a3, v50);
    *((_BYTE *)v7 + 8) &= ~8u;
    objc_msgSend_setImmediateMode_(VFXTransaction, v51, v8, v52);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
