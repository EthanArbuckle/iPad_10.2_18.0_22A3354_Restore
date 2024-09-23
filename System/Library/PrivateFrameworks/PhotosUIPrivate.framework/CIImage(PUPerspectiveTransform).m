@implementation CIImage(PUPerspectiveTransform)

- (id)pu_imageWithPerspectiveTransform:()PUPerspectiveTransform extent:
{
  void *v12;
  id v13;
  void *v14;
  double MinX;
  double MaxX;
  double MinY;
  CGFloat MaxY;
  float v19;
  float v20;
  float32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  float32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float64x2_t v34;
  float64x2_t v36;
  float64x2_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v12 = (void *)MEMORY[0x1E0C9DDB8];
  v13 = a1;
  objc_msgSend(v12, "filterWithName:", CFSTR("CIPerspectiveTransformWithExtent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40.origin.x = a5;
  v40.origin.y = a6;
  v40.size.width = a7;
  v40.size.height = a8;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = a5;
  v41.origin.y = a6;
  v41.size.width = a7;
  v41.size.height = a8;
  MaxX = CGRectGetMaxX(v41);
  v42.origin.x = a5;
  v42.origin.y = a6;
  v42.size.width = a7;
  v42.size.height = a8;
  MinY = CGRectGetMinY(v42);
  v43.origin.x = a5;
  v43.origin.y = a6;
  v43.size.width = a7;
  v43.size.height = a8;
  MaxY = CGRectGetMaxY(v43);
  v19 = MinX;
  v20 = MinY;
  v21 = vmulq_n_f32(a2, v19);
  v22 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v21, a3, v20));
  *(float *)&MaxY = MaxY;
  v23 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v21, a3, *(float *)&MaxY));
  v34 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2)));
  *(float *)v23.i32 = MaxX;
  v24 = vmulq_n_f32(a2, *(float *)v23.i32);
  v25 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v24, a3, *(float *)&MaxY));
  v36 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v25.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2)));
  v26 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v24, a3, v20));
  v39 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2)));
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2))));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", *(_OWORD *)&v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", *(_OWORD *)&v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", *(_OWORD *)&v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v13, *MEMORY[0x1E0C9E1F8]);

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", a5, a6, a7, a8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v31, CFSTR("inputExtent"));

  objc_msgSend(v14, "setValue:forKey:", v27, CFSTR("inputBottomLeft"));
  objc_msgSend(v14, "setValue:forKey:", v28, CFSTR("inputTopLeft"));
  objc_msgSend(v14, "setValue:forKey:", v29, CFSTR("inputTopRight"));
  objc_msgSend(v14, "setValue:forKey:", v30, CFSTR("inputBottomRight"));
  objc_msgSend(v14, "outputImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (uint64_t)pu_imageWithPerspectiveTransform:()PUPerspectiveTransform
{
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "extent");
  return objc_msgSend(a1, "pu_imageWithPerspectiveTransform:extent:", a2, a3, a4, v5, v6, v7, v8);
}

@end
