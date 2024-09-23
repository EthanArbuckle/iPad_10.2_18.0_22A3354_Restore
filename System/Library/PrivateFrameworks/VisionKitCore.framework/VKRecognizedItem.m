@implementation VKRecognizedItem

- (VKRecognizedItem)initWithFrameInfo:(id)a3 rectangleObservation:(id)a4
{
  return -[VKRecognizedItem initWithFrameInfo:rectangleObservation:layoutDirection:](self, "initWithFrameInfo:rectangleObservation:layoutDirection:", a3, a4, 0);
}

- (VKRecognizedItem)initWithFrameInfo:(id)a3 rectangleObservation:(id)a4 layoutDirection:(unint64_t)a5
{
  id v9;
  id v10;
  VKRecognizedItem *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  VKQuad *v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  VKQuad *visionQuad;
  objc_super v31;
  _QWORD v32[9];

  v32[8] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VKRecognizedItem;
  v11 = -[VKRecognizedItem init](&v31, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "uuid");
    v12 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_frameInfo, a3);
    objc_msgSend(v10, "topLeft");
    v32[0] = v14;
    v32[1] = v15;
    objc_msgSend(v10, "topRight");
    v32[2] = v16;
    v32[3] = v17;
    objc_msgSend(v10, "bottomRight");
    v32[4] = v18;
    v32[5] = v19;
    objc_msgSend(v10, "bottomLeft");
    v32[6] = v20;
    v32[7] = v21;
    v22 = [VKQuad alloc];
    v23 = 2;
    v24 = 4;
    if (a5 == 5)
      v23 = 4;
    v25 = (double *)&v32[v23];
    v26 = 6;
    if (a5 == 5)
      v24 = 6;
    v27 = (double *)&v32[v24];
    if (a5 == 5)
      v26 = 0;
    v28 = -[VKQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v22, "initWithTopLeft:topRight:bottomRight:bottomLeft:", *(double *)&v32[2 * (a5 == 5)], *(double *)&v32[2 * (a5 == 5) + 1], *v25, v25[1], *v27, v27[1], *(double *)&v32[v26], *(double *)&v32[v26 + 1]);
    visionQuad = v11->_visionQuad;
    v11->_visionQuad = (VKQuad *)v28;

    -[VKRecognizedItem setObservation:](v11, "setObservation:", v10);
  }

  return v11;
}

- (VKFrameInfo)frameInfo
{
  return self->_frameInfo;
}

- (VKQuad)visionQuad
{
  return self->_visionQuad;
}

- (VKQuad)layerQuad
{
  VKQuad *layerQuad;
  void *v4;
  double v5;
  double v6;
  double v7;
  float64x2_t v8;
  double v9;
  double v10;
  double v11;
  float64x2_t v12;
  float64x2_t v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  double v19;
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  VKQuad *v24;
  VKQuad *v25;
  double v27;
  double v28;
  double v29;
  float64x2_t v30;
  double v31;
  float64x2_t v32;
  double v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  double v38;
  float64x2_t v39;
  double v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;

  layerQuad = self->_layerQuad;
  if (!layerQuad)
  {
    -[VKRecognizedItem frameInfo](self, "frameInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKQuad topLeft](self->_visionQuad, "topLeft");
    v37 = v6;
    v7 = v5;
    if (v4)
    {
      v40 = v5;
      objc_msgSend(v4, "visionToLayerTransform");
      v7 = v40;
      v8 = v54;
      v32 = v55;
      v34 = v53;
    }
    else
    {
      v8 = 0uLL;
      v32 = 0u;
      v34 = 0u;
    }
    v41 = vmulq_n_f64(v8, v7);
    -[VKQuad topRight](self->_visionQuad, "topRight");
    v11 = v9;
    if (v4)
    {
      v27 = v10;
      v28 = v9;
      objc_msgSend(v4, "visionToLayerTransform");
      v10 = v27;
      v11 = v28;
      v12 = v50;
      v13 = v51;
      v30 = v52;
    }
    else
    {
      v12 = 0uLL;
      v30 = 0u;
      v13 = 0uLL;
    }
    v42 = vmlaq_n_f64(v41, v34, v37);
    v35 = vmlaq_n_f64(vmulq_n_f64(v13, v10), v12, v11);
    -[VKQuad bottomRight](self->_visionQuad, "bottomRight");
    if (v4)
    {
      v38 = v14;
      v29 = v15;
      objc_msgSend(v4, "visionToLayerTransform");
      v15 = v29;
      v14 = v38;
      v17 = v47;
      v16 = v48;
      v18 = v49;
    }
    else
    {
      v18 = 0uLL;
      v17 = 0uLL;
      v16 = 0uLL;
    }
    v39 = vaddq_f64(v32, v42);
    v43 = vaddq_f64(v30, v35);
    v36 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v16, v15), v17, v14));
    -[VKQuad bottomLeft](self->_visionQuad, "bottomLeft");
    if (v4)
    {
      v31 = v20;
      v33 = v19;
      objc_msgSend(v4, "visionToLayerTransform");
      v20 = v31;
      v19 = v33;
      v22 = v44;
      v21 = v45;
      v23 = v46;
    }
    else
    {
      v23 = 0uLL;
      v22 = 0uLL;
      v21 = 0uLL;
    }
    v24 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([VKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", *(_OWORD *)&v39, *(_OWORD *)&v43, vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v21, v20), v22, v19)), *(_OWORD *)&v36);
    v25 = self->_layerQuad;
    self->_layerQuad = v24;

    layerQuad = self->_layerQuad;
  }
  return layerQuad;
}

- (BOOL)shouldAssociateWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;

  v4 = a3;
  -[VKRecognizedItem visionQuad](self, "visionQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visionQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "topLeft");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "topLeft");
  if (!VKMNearlyEqualPointsWithThreshold(v8, v10, v11, v12, 0.1))
    goto LABEL_5;
  objc_msgSend(v5, "topRight");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "topRight");
  if (!VKMNearlyEqualPointsWithThreshold(v14, v16, v17, v18, 0.1))
    goto LABEL_5;
  objc_msgSend(v5, "bottomRight");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v6, "bottomRight");
  if (VKMNearlyEqualPointsWithThreshold(v20, v22, v23, v24, 0.1))
  {
    objc_msgSend(v5, "bottomLeft");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v6, "bottomLeft");
    v31 = VKMNearlyEqualPointsWithThreshold(v26, v28, v29, v30, 0.1);
  }
  else
  {
LABEL_5:
    v31 = 0;
  }

  return v31;
}

- (void)associateWithItem:(id)a3
{
  id v4;
  VNObservation *v5;
  VNObservation *observation;
  uint64_t v7;
  VKQuad *v8;
  VKQuad *visionQuad;
  VKQuad *layerQuad;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "observation");
  v5 = (VNObservation *)objc_claimAutoreleasedReturnValue();
  observation = self->_observation;
  self->_observation = v5;

  v7 = objc_opt_class();
  VKCheckedDynamicCast(v7, (uint64_t)v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "visionQuad");
  v8 = (VKQuad *)objc_claimAutoreleasedReturnValue();
  visionQuad = self->_visionQuad;
  self->_visionQuad = v8;

  layerQuad = self->_layerQuad;
  self->_layerQuad = 0;

}

- (void)applyHomographyWarpTransform:(uint64_t)a1
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  VKQuad *v17;
  void *v18;
  void *v19;

  __invert_f3(a2);
  objc_msgSend(*(id *)(a1 + 16), "topLeft");
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 16), "topRight");
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 16), "bottomRight");
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 16), "bottomLeft");
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  v17 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([VKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v4, v6, v8, v10, v15, v16, v12, v14);
  v18 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v17;

  v19 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;

}

- (CGAffineTransform)_applyWarpTransform:(CGAffineTransform *)result toVisionPoint:
{
  void *v1;
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  if (result)
  {
    memset(&v5, 0, sizeof(v5));
    -[CGAffineTransform frameInfo](result, "frameInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
      objc_msgSend(v1, "visionToCroppedImageTransform");
    else
      memset(&v5, 0, sizeof(v5));

    v3 = v5;
    memset(&v4, 0, sizeof(v4));
    return CGAffineTransformInvert(&v4, &v3);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VKRecognizedItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (VKRecognizedItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VKRecognizedItem uuid](self, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKRecognizedItem uuid](v4, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VKRecognizedItem uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (VNObservation)observation
{
  return self->_observation;
}

- (void)setObservation:(id)a3
{
  objc_storeStrong((id *)&self->_observation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_layerQuad, 0);
  objc_storeStrong((id *)&self->_visionQuad, 0);
  objc_storeStrong((id *)&self->_frameInfo, 0);
}

@end
