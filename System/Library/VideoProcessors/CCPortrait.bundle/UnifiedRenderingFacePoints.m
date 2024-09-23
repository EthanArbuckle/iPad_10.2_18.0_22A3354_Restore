@implementation UnifiedRenderingFacePoints

- (UnifiedRenderingFacePoints)init
{
  UnifiedRenderingFacePoints *result;
  CGPoint v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UnifiedRenderingFacePoints;
  result = -[UnifiedRenderingFacePoints init](&v4, sel_init);
  if (result)
  {
    v3 = (CGPoint)*MEMORY[0x24BDBEFB0];
    result->_centerPos = (CGPoint)*MEMORY[0x24BDBEFB0];
    result->_leftEyeCenterPos = v3;
    result->_rightEyeCenterPos = v3;
    result->_chinCenterPos = v3;
  }
  return result;
}

- (UnifiedRenderingFacePoints)initWithCenterPos:(CGPoint)a3 leftEyeCenterPos:(CGPoint)a4 rightEyeCenterPos:(CGPoint)a5 chinCenterPos:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  UnifiedRenderingFacePoints *result;
  objc_super v15;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)UnifiedRenderingFacePoints;
  result = -[UnifiedRenderingFacePoints init](&v15, sel_init);
  if (result)
  {
    result->_centerPos.x = v13;
    result->_centerPos.y = v12;
    result->_leftEyeCenterPos.x = v11;
    result->_leftEyeCenterPos.y = v10;
    result->_rightEyeCenterPos.x = v9;
    result->_rightEyeCenterPos.y = v8;
    result->_chinCenterPos.x = x;
    result->_chinCenterPos.y = y;
  }
  return result;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)objc_opt_class();
  objc_msgSend_description(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: %p center:%.4f,%.4f leftEye:%.4f,%.4f rightEye:%.4f,%.4f chin:%.4f,%.4f>"), v7, self, *(_QWORD *)&self->_centerPos.x, *(_QWORD *)&self->_centerPos.y, *(_QWORD *)&self->_leftEyeCenterPos.x, *(_QWORD *)&self->_leftEyeCenterPos.y, *(_QWORD *)&self->_rightEyeCenterPos.x, *(_QWORD *)&self->_rightEyeCenterPos.y, *(_QWORD *)&self->_chinCenterPos.x, *(_QWORD *)&self->_chinCenterPos.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeys
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)CFSTR("centerPos"), CFSTR("leftEyeCenterPos"), CFSTR("rightEyeCenterPos"), CFSTR("chinCenterPos"), 0);
}

- (UnifiedRenderingFacePoints)initWithDictionary:(id)a3
{
  id v4;
  UnifiedRenderingFacePoints *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  CGFloat v50;
  CGFloat v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)UnifiedRenderingFacePoints;
  v5 = -[UnifiedRenderingFacePoints init](&v57, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend_validKeys(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend_allKeys(v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v53, v64, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v9, v15, v19) & 1) == 0)
          {
            uni_logger_api();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = (void *)objc_opt_class();
              *(_DWORD *)buf = 136446722;
              v59 = "-[UnifiedRenderingFacePoints initWithDictionary:]";
              v60 = 2112;
              v61 = v21;
              v62 = 2112;
              v63 = v19;
              v22 = v21;
              _os_log_error_impl(&dword_24B6B5000, v20, OS_LOG_TYPE_ERROR, "%{public}s Invalid key for %@: %@; results will be unpredictable",
                buf,
                0x20u);

            }
          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v53, v64, 16);
      }
      while (v16);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v23, (uint64_t)CFSTR("centerPos"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v25, (uint64_t)CFSTR("centerPos"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGPointValue(v26, v27, v28);
      v5->_centerPos.x = v29;
      v5->_centerPos.y = v30;

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v25, (uint64_t)CFSTR("leftEyeCenterPos"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v32, (uint64_t)CFSTR("leftEyeCenterPos"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGPointValue(v33, v34, v35);
      v5->_leftEyeCenterPos.x = v36;
      v5->_leftEyeCenterPos.y = v37;

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v32, (uint64_t)CFSTR("rightEyeCenterPos"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v39, (uint64_t)CFSTR("rightEyeCenterPos"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGPointValue(v40, v41, v42);
      v5->_rightEyeCenterPos.x = v43;
      v5->_rightEyeCenterPos.y = v44;

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v39, (uint64_t)CFSTR("chinCenterPos"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v46, (uint64_t)CFSTR("chinCenterPos"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGPointValue(v47, v48, v49);
      v5->_chinCenterPos.x = v50;
      v5->_chinCenterPos.y = v51;

    }
  }

  return v5;
}

- (CGPoint)centerPos
{
  double x;
  double y;
  CGPoint result;

  x = self->_centerPos.x;
  y = self->_centerPos.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenterPos:(CGPoint)a3
{
  self->_centerPos = a3;
}

- (CGPoint)leftEyeCenterPos
{
  double x;
  double y;
  CGPoint result;

  x = self->_leftEyeCenterPos.x;
  y = self->_leftEyeCenterPos.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLeftEyeCenterPos:(CGPoint)a3
{
  self->_leftEyeCenterPos = a3;
}

- (CGPoint)rightEyeCenterPos
{
  double x;
  double y;
  CGPoint result;

  x = self->_rightEyeCenterPos.x;
  y = self->_rightEyeCenterPos.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRightEyeCenterPos:(CGPoint)a3
{
  self->_rightEyeCenterPos = a3;
}

- (CGPoint)chinCenterPos
{
  double x;
  double y;
  CGPoint result;

  x = self->_chinCenterPos.x;
  y = self->_chinCenterPos.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setChinCenterPos:(CGPoint)a3
{
  self->_chinCenterPos = a3;
}

@end
