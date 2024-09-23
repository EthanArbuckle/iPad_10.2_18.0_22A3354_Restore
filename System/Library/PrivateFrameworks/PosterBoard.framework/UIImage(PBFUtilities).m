@implementation UIImage(PBFUtilities)

+ (id)pbf_galleryPosterWithColor:()PBFUtilities scale:
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD block[6];

  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a1 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");

  }
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterContentSize");
  v9 = v8;
  v11 = v10;

  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&block[4] = v9;
  *(double *)&block[5] = v11;
  if (pbf_galleryPosterWithColor_scale__onceToken != -1)
    dispatch_once(&pbf_galleryPosterWithColor_scale__onceToken, block);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v9, v11);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke_2;
  v17[3] = &unk_1E86F5EC0;
  v18 = v5;
  v14 = v5;
  objc_msgSend(v13, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)pbf_colorOfImage
{
  id v1;
  CGImage *v2;
  CGColorSpace *DeviceRGB;
  CGContext *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int data;
  CGRect v13;

  v1 = objc_retainAutorelease(a1);
  v2 = (CGImage *)objc_msgSend(v1, "CGImage");
  if (!v2)
  {
    v9 = (void *)objc_msgSend(v1, "ioSurface");
    if (!v9)
      return v9;
    objc_msgSend((id)objc_msgSend(v1, "ioSurface"), "CGImageBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (CGImage *)CFAutorelease((CFTypeRef)objc_msgSend(v10, "buildCGImage"));

    if (!v2)
      goto LABEL_6;
  }
  data = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 0x20uLL, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v4)
  {
LABEL_6:
    v9 = 0;
    return v9;
  }
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = 1.0;
  v13.size.height = 1.0;
  CGContextDrawImage(v4, v13, v2);
  CGContextRelease(v4);
  LOBYTE(v6) = BYTE1(data);
  LOBYTE(v5) = data;
  LOBYTE(v8) = HIBYTE(data);
  LOBYTE(v7) = BYTE2(data);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)v5 / 255.0, (double)v6 / 255.0, (double)v7 / 255.0, (double)v8 / 255.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)pbf_alphaOnlyImage
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  size_t v10;
  size_t v11;
  size_t NumberOfComponents;
  CGContext *v13;
  CGContext *v14;
  CGImage *Image;
  void *v16;
  CGRect v18;
  CGRect v19;

  objc_msgSend(a1, "scale");
  v3 = v2;
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(a1, "size");
  v7 = v6;
  v9 = v8;
  v18.origin.x = v4;
  v18.origin.y = v5;
  v18.size.width = v7;
  v18.size.height = v9;
  v10 = (unint64_t)(v3 * CGRectGetWidth(v18));
  v19.origin.x = v4;
  v19.origin.y = v5;
  v19.size.width = v7;
  v19.size.height = v9;
  v11 = (unint64_t)(v3 * CGRectGetHeight(v19));
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(0);
  v13 = CGBitmapContextCreate(0, v10, v11, 8uLL, v10 + v10 * NumberOfComponents, 0, 7u);
  if (v13)
  {
    v14 = v13;
    CGContextTranslateCTM(v13, 0.0, (double)v11);
    CGContextScaleCTM(v14, v3, -v3);
    UIGraphicsPushContext(v14);
    objc_msgSend(a1, "drawInRect:", v4, v5, v7, v9);
    UIGraphicsPopContext();
    Image = CGBitmapContextCreateImage(v14);
    CGContextRelease(v14);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(a1, "imageOrientation"), v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[UIImage(PBFUtilities) pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA94038);
  }
  v10 = v9;
  v11 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[UIImage(PBFUtilities) pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA9409CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[UIImage(PBFUtilities) pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA94100);
  }

  objc_msgSend(v7, "posterExtensionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (PFIsPhotosPosterProviderBundleId())
  {
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("|"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = v14;

      v11 = v15;
    }

  }
  if (pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__onceToken != -1)
    dispatch_once(&pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__onceToken, &__block_literal_global_24);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "pbf_displayContextPersistenceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pbf_sha256Hash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@]-[%@]-[%@]-[%@].png"), v12, v11, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__heroCache;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __97__UIImage_PBFUtilities__pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext___block_invoke_2;
  v30[3] = &unk_1E86F5F08;
  v31 = v12;
  v32 = v11;
  v33 = v10;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  objc_msgSend(v21, "imageForKey:generatingIfNecessaryWithBlock:", v20, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (void)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
