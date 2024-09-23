@implementation PBUITreatImageRequest

+ (NSSet)secureCodableTreatmentClasses
{
  if (secureCodableTreatmentClasses_onceToken != -1)
    dispatch_once(&secureCodableTreatmentClasses_onceToken, &__block_literal_global_14);
  return (NSSet *)(id)secureCodableTreatmentClasses_result;
}

void __54__PBUITreatImageRequest_secureCodableTreatmentClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureCodableTreatmentClasses_result;
  secureCodableTreatmentClasses_result = v2;

}

- (PBUITreatImageRequest)initWithImage:(CGImage *)a3 scale:(double)a4 downscaleFactor:(double)a5 treatment:(id)a6
{
  id v11;
  PBUITreatImageRequest *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  NSString *identifier;

  v11 = a6;
  v12 = -[PBUITreatImageRequest init](self, "init");
  if (v12)
  {
    v12->_image = CGImageRetain(a3);
    v12->_scale = a4;
    v12->_downscaleFactor = a5;
    objc_storeStrong((id *)&v12->_treatment, a6);
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("TreatImage(%@)"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v16;

  }
  return v12;
}

- (PBUITreatImageRequest)initWithImage:(id)a3 downscaleFactor:(double)a4 treatment:(id)a5
{
  id v9;
  id v10;
  PBUITreatImageRequest *v11;
  PBUITreatImageRequest *v12;
  double v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  NSString *identifier;

  v9 = a3;
  v10 = a5;
  v11 = -[PBUITreatImageRequest init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_codableImage, a3);
    objc_msgSend(v9, "scale");
    v12->_scale = v13;
    v12->_image = CGImageRetain((CGImageRef)objc_msgSend(objc_retainAutorelease(v9), "CGImage"));
    v12->_downscaleFactor = a4;
    objc_storeStrong((id *)&v12->_treatment, a5);
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("TreatImage(%@)"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v17;

  }
  return v12;
}

- (void)setImage:(CGImage *)a3
{
  CGImageRelease(self->_image);
  self->_image = CGImageRetain(a3);
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  void *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;

  if (a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("TreatImage(%@)"), v10);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_identifier;
    self->_identifier = v8;

    identifier = (NSString *)v10;
  }

}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PBUITreatImageRequest;
  -[PBUITreatImageRequest dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBUICodableImage *codableImage;
  PBUITreatImageRequest *v6;
  PBUICodableImage *v7;
  double downscaleFactor;
  void *v9;
  uint64_t v10;
  CGImage *image;
  double scale;
  double v13;
  void *v14;

  codableImage = self->_codableImage;
  v6 = +[PBUITreatImageRequest allocWithZone:](PBUITreatImageRequest, "allocWithZone:");
  if (codableImage)
  {
    v7 = self->_codableImage;
    downscaleFactor = self->_downscaleFactor;
    v9 = (void *)-[PBUIImageTreatment copyWithZone:](self->_treatment, "copyWithZone:", a3);
    v10 = -[PBUITreatImageRequest initWithImage:downscaleFactor:treatment:](v6, "initWithImage:downscaleFactor:treatment:", v7, v9, downscaleFactor);
  }
  else
  {
    image = self->_image;
    scale = self->_scale;
    v13 = self->_downscaleFactor;
    v9 = (void *)-[PBUIImageTreatment copyWithZone:](self->_treatment, "copyWithZone:", a3);
    v10 = -[PBUITreatImageRequest initWithImage:scale:downscaleFactor:treatment:](v6, "initWithImage:scale:downscaleFactor:treatment:", image, v9, scale, v13);
  }
  v14 = (void *)v10;

  return v14;
}

- (id)treatmentOptions
{
  PBUIImageTreatmentOptions *v3;
  double scale;
  double v5;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[PBUIImageTreatment canInterpolateToLowerScales](self->_treatment, "canInterpolateToLowerScales"))
  {
    v3 = [PBUIImageTreatmentOptions alloc];
    if (v3)
    {
      scale = self->_scale;
      v3 = -[PBUIImageTreatmentOptions init](v3, "init");
      if (v3)
      {
        v5 = 1.0;
LABEL_8:
        v3->_originalScale = scale;
        v3->_reducedScale = v5;
      }
    }
  }
  else
  {
    v3 = [PBUIImageTreatmentOptions alloc];
    if (v3)
    {
      scale = self->_scale;
      v3 = -[PBUIImageTreatmentOptions init](v3, "init");
      v5 = scale;
      if (v3)
        goto LABEL_8;
    }
  }
  return v3;
}

- (CGSize)requestedOutputSizeInPointsAtScale:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PBUITreatImageRequest requestedOutputSizeInPixels](self, "requestedOutputSizeInPixels");
  v5 = v4 * a3;
  v7 = v6 * a3;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGSize)requestedOutputSizeInPixels
{
  double downscaleFactor;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PBUITreatImageRequest imagePixelSize](self, "imagePixelSize");
  downscaleFactor = self->_downscaleFactor;
  v5 = v4 / downscaleFactor;
  v7 = v6 / downscaleFactor;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGSize)imagePixelSize
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CGImageGetWidth(self->_image);
  Height = (double)CGImageGetHeight(self->_image);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)usesCoreImageForTreatment:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)CIImage
{
  CGImage *image;
  void *v4;
  void *v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  image = self->_image;
  if (!image)
    return 0;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:options:", image, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, 1.0 / self->_downscaleFactor, 1.0 / self->_downscaleFactor);
  v7 = v8;
  objc_msgSend(v4, "imageByApplyingTransform:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)configureState:(PBUIRenderState *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  PBUIImageTreatment *treatment;
  void *v14;
  id v15;
  PBUIImageTreatment *v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;

  +[PBUIImageContainerLayer layer](PBUIImageContainerLayer, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  objc_msgSend(v7, "setDelegate:", self);
  -[PBUITreatImageRequest treatmentOptions](self, "treatmentOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContents:", self->_image);

  objc_msgSend(v7, "setNeedsLayout");
  v11 = -[PBUITreatImageRequest usesCoreImageForTreatment:](self, "usesCoreImageForTreatment:", self->_treatment);
  if (v11)
  {
    -[PBUITreatImageRequest CIImage](self, "CIImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    treatment = self->_treatment;
    v31 = 0;
    -[PBUIImageTreatment applyToImage:options:error:](treatment, "applyToImage:options:error:", v12, v9, &v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v31;

  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  v16 = self->_treatment;
  v30 = 0;
  v17 = -[PBUIImageTreatment commitToRenderingTree:options:error:](v16, "commitToRenderingTree:options:error:", v7, v9, &v30);
  v18 = v30;
  v19 = v18;
  v20 = !v11;
  if (v14)
    v20 = 1;
  v21 = v11 & v20 | v17;
  if ((v21 & 1) != 0)
  {
    -[PBUITreatImageRequest requestedOutputSizeInPixels](self, "requestedOutputSizeInPixels");
    *(_QWORD *)&v26 = v22;
    *((_QWORD *)&v26 + 1) = v23;
    objc_msgSend(v9, "reducedScale");
    v27 = v24;
    v28 = v7;
    v29 = v14;
    __copy_assignment_8_8_t0w24_s24_s32((uint64_t)a3, &v26);

  }
  else if (a4)
  {
    if (v15)
      v18 = v15;
    *a4 = objc_retainAutorelease(v18);
  }

  return v21;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v5, "setFrame:");
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUITreatImageRequest)initWithCoder:(id)a3
{
  id v4;
  PBUITreatImageRequest *v5;
  uint64_t v6;
  NSString *identifier;
  double v8;
  void *v9;
  uint64_t v10;
  PBUIImageTreatment *treatment;
  uint64_t v12;
  PBUICodableImage *codableImage;
  PBUICodableImage *v14;
  double v15;
  PBUITreatImageRequest *v16;

  v4 = a3;
  v5 = -[PBUITreatImageRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DownscaleFactor"));
    v5->_downscaleFactor = v8;
    objc_msgSend((id)objc_opt_class(), "secureCodableTreatmentClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Treatment"));
    v10 = objc_claimAutoreleasedReturnValue();
    treatment = v5->_treatment;
    v5->_treatment = (PBUIImageTreatment *)v10;

    if (!v5->_treatment
      || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Image")),
          v12 = objc_claimAutoreleasedReturnValue(),
          codableImage = v5->_codableImage,
          v5->_codableImage = (PBUICodableImage *)v12,
          codableImage,
          (v14 = v5->_codableImage) == 0))
    {
      v16 = 0;
      goto LABEL_7;
    }
    -[PBUICodableImage scale](v14, "scale");
    v5->_scale = v15;
    v5->_image = CGImageRetain(-[PBUICodableImage CGImage](v5->_codableImage, "CGImage"));
  }
  v16 = v5;
LABEL_7:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PBUICodableImage *codableImage;
  PBUICodableImage *v6;
  PBUICodableImage *v7;
  id v8;

  v4 = a3;
  codableImage = self->_codableImage;
  v8 = v4;
  if (!codableImage)
  {
    v6 = -[PBUICodableImage initWithCGImage:scale:error:]([PBUICodableImage alloc], "initWithCGImage:scale:error:", self->_image, 0, self->_scale);
    v7 = self->_codableImage;
    self->_codableImage = v6;

    v4 = v8;
    codableImage = self->_codableImage;
  }
  objc_msgSend(v4, "encodeObject:forKey:", codableImage, CFSTR("Image"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_treatment, CFSTR("Treatment"));
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("DownscaleFactor"), self->_downscaleFactor);
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifier, CFSTR("Identifier"));

}

- (NSString)description
{
  return (NSString *)-[PBUITreatImageRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUITreatImageRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUITreatImageRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("identifier"));

  v6 = (id)objc_msgSend(v4, "appendObject:withName:", -[PBUITreatImageRequest image](self, "image"), CFSTR("image"));
  -[PBUITreatImageRequest scale](self, "scale");
  v7 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("scale"), 3);
  -[PBUITreatImageRequest downscaleFactor](self, "downscaleFactor");
  v8 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("downscaleFactor"), 3);
  -[PBUITreatImageRequest treatment](self, "treatment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("treatment"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUITreatImageRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (CGImage)image
{
  return self->_image;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)downscaleFactor
{
  return self->_downscaleFactor;
}

- (void)setDownscaleFactor:(double)a3
{
  self->_downscaleFactor = a3;
}

- (PBUIImageTreatment)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_treatment, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_codableImage, 0);
}

@end
