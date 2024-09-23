@implementation PBFHomeScreenPreviewImageBuilder

- (void)homeScreenImageForConfiguration:(id)a3 unlockedPosterSnapshot:(id)a4 displayContext:(id)a5 imageScaleRelativeToScreen:(double)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  PBFHomeScreenPreviewViewBuilder *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _QWORD v32[5];
  id v33;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v15, "pbf_frame");
  objc_msgSend(v15, "pbf_scale");
  BSFloatRoundForScale();
  v19 = v18;
  objc_msgSend(v15, "pbf_frame");
  objc_msgSend(v15, "pbf_scale");
  BSFloatRoundForScale();
  v21 = v20;
  v22 = a7 & 1;
  v23 = (a7 >> 1) & 1;
  v24 = objc_alloc_init(PBFHomeScreenPreviewViewBuilder);
  -[PBFHomeScreenPreviewViewBuilder setDisplayContext:](v24, "setDisplayContext:", v15);
  -[PBFHomeScreenPreviewViewBuilder setHomeScreenConfiguration:](v24, "setHomeScreenConfiguration:", v17);

  -[PBFHomeScreenPreviewViewBuilder setUnlockedPosterSnapshot:](v24, "setUnlockedPosterSnapshot:", v16);
  -[PBFHomeScreenPreviewViewBuilder setExcludesSilhouette:](v24, "setExcludesSilhouette:", v22);
  -[PBFHomeScreenPreviewViewBuilder setExcludesHomeScreenDock:](v24, "setExcludesHomeScreenDock:", v23);
  -[PBFHomeScreenPreviewViewBuilder setViewScreenSizeScale:](v24, "setViewScreenSizeScale:", a6);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __152__PBFHomeScreenPreviewImageBuilder_homeScreenImageForConfiguration_unlockedPosterSnapshot_displayContext_imageScaleRelativeToScreen_options_completion___block_invoke;
  v32[3] = &unk_1E86F6358;
  v32[4] = self;
  v33 = v14;
  v25 = v14;
  -[PBFHomeScreenPreviewViewBuilder setRenderingCompletionHandler:](v24, "setRenderingCompletionHandler:", v32);
  -[PBFHomeScreenPreviewViewBuilder buildView](v24, "buildView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pbf_scale");
  v29 = v28;

  objc_msgSend(v27, "setContentsScale:", v29);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v29, v29);
  v30 = v31;
  objc_msgSend(v27, "setAffineTransform:", &v30);
  objc_msgSend(v27, "setFrame:", 0.0, 0.0, v19 * v29, v21 * v29);

}

void __152__PBFHomeScreenPreviewImageBuilder_homeScreenImageForConfiguration_unlockedPosterSnapshot_displayContext_imageScaleRelativeToScreen_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_imageForView:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)_imageForView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  CFStringRef *v21;
  CGColorSpaceRef v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsScale");
  v9 = v6 * v8;

  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  objc_msgSend(v3, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentsScale");
  v15 = v12 * v14;

  v16 = MTLCreateSystemDefaultDevice();
  v34 = 1;
  v17 = (void *)objc_msgSend(MEMORY[0x1E0CBBEA0], "bs_IOSurfaceWithWidth:height:options:", (uint64_t)v9, (uint64_t)v15, &v34);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, (unint64_t)v9, (unint64_t)v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUsage:", 4);
  v19 = objc_msgSend(v16, "newTextureWithDescriptor:iosurface:plane:", v18, v17, 0);
  v33 = (void *)v19;
  v20 = MGGetBoolAnswer();
  v21 = (CFStringRef *)MEMORY[0x1E0C9D960];
  if (!v20)
    v21 = (CFStringRef *)MEMORY[0x1E0C9DA10];
  v22 = CGColorSpaceCreateWithName(*v21);
  v23 = (void *)objc_msgSend(v16, "newCommandQueue");
  objc_msgSend(v23, "setBackgroundGPUPriority:", 2);
  v24 = *MEMORY[0x1E0CD3090];
  v35[0] = *MEMORY[0x1E0CD3088];
  v35[1] = v24;
  v36[0] = v22;
  v36[1] = v23;
  v35[2] = CFSTR("kCARendererFlags");
  v36[2] = &unk_1E8741BC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2820], "rendererWithMTLTexture:options:", v19, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setLayer:", v27);
  objc_msgSend(v26, "setBounds:", 0.0, 0.0, v9, v15);
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(v26, "beginFrameAtTime:timeStamp:", 0, 0.0);
  objc_msgSend(v26, "render");
  objc_msgSend(v26, "endFrame");
  objc_msgSend(v23, "commandBuffer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "enqueue");
  objc_msgSend(v28, "commit");
  objc_msgSend(v28, "waitUntilCompleted");
  objc_msgSend(v17, "CGImageBuilder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "setOpaque:", 1);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", CFAutorelease((CFTypeRef)objc_msgSend(v29, "buildCGImage")));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
