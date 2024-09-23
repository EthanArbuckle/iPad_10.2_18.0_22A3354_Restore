@implementation PKPassLiveRenderedImageSet

- (PKPassLiveRenderedImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassLiveRenderedImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *diffuseMaterialPropertyImage;
  uint64_t v9;
  PKImage *ambientMaterialPropertyImage;
  uint64_t v11;
  PKImage *specularMaterialPropertyImage;
  uint64_t v13;
  PKImage *normalMaterialPropertyImage;
  uint64_t v15;
  PKImage *reflectiveMaterialPropertyImage;
  uint64_t v17;
  PKImage *emissionMaterialPropertyImage;
  uint64_t v19;
  PKImage *transparentMaterialPropertyImage;
  uint64_t v21;
  PKImage *multiplyMaterialPropertyImage;
  uint64_t v23;
  PKImage *displacementMaterialPropertyImage;
  uint64_t v25;
  PKImage *ambientOcclusionMaterialPropertyImage;
  uint64_t v27;
  PKImage *selfIlluminationMaterialPropertyImage;
  uint64_t v29;
  PKImage *metalnessMaterialPropertyImage;
  uint64_t v31;
  PKImage *roughnessMaterialPropertyImage;
  uint64_t v33;
  PKImage *overlayMaterialPropertyImage;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPassLiveRenderedImageSet;
  v5 = -[PKImageSet initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diffuse"));
    v7 = objc_claimAutoreleasedReturnValue();
    diffuseMaterialPropertyImage = v5->_diffuseMaterialPropertyImage;
    v5->_diffuseMaterialPropertyImage = (PKImage *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ambient"));
    v9 = objc_claimAutoreleasedReturnValue();
    ambientMaterialPropertyImage = v5->_ambientMaterialPropertyImage;
    v5->_ambientMaterialPropertyImage = (PKImage *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specular"));
    v11 = objc_claimAutoreleasedReturnValue();
    specularMaterialPropertyImage = v5->_specularMaterialPropertyImage;
    v5->_specularMaterialPropertyImage = (PKImage *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normal"));
    v13 = objc_claimAutoreleasedReturnValue();
    normalMaterialPropertyImage = v5->_normalMaterialPropertyImage;
    v5->_normalMaterialPropertyImage = (PKImage *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reflective"));
    v15 = objc_claimAutoreleasedReturnValue();
    reflectiveMaterialPropertyImage = v5->_reflectiveMaterialPropertyImage;
    v5->_reflectiveMaterialPropertyImage = (PKImage *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emission"));
    v17 = objc_claimAutoreleasedReturnValue();
    emissionMaterialPropertyImage = v5->_emissionMaterialPropertyImage;
    v5->_emissionMaterialPropertyImage = (PKImage *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transparent"));
    v19 = objc_claimAutoreleasedReturnValue();
    transparentMaterialPropertyImage = v5->_transparentMaterialPropertyImage;
    v5->_transparentMaterialPropertyImage = (PKImage *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiply"));
    v21 = objc_claimAutoreleasedReturnValue();
    multiplyMaterialPropertyImage = v5->_multiplyMaterialPropertyImage;
    v5->_multiplyMaterialPropertyImage = (PKImage *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displacement"));
    v23 = objc_claimAutoreleasedReturnValue();
    displacementMaterialPropertyImage = v5->_displacementMaterialPropertyImage;
    v5->_displacementMaterialPropertyImage = (PKImage *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ambientOcclusion"));
    v25 = objc_claimAutoreleasedReturnValue();
    ambientOcclusionMaterialPropertyImage = v5->_ambientOcclusionMaterialPropertyImage;
    v5->_ambientOcclusionMaterialPropertyImage = (PKImage *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfIllumination"));
    v27 = objc_claimAutoreleasedReturnValue();
    selfIlluminationMaterialPropertyImage = v5->_selfIlluminationMaterialPropertyImage;
    v5->_selfIlluminationMaterialPropertyImage = (PKImage *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalness"));
    v29 = objc_claimAutoreleasedReturnValue();
    metalnessMaterialPropertyImage = v5->_metalnessMaterialPropertyImage;
    v5->_metalnessMaterialPropertyImage = (PKImage *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roughness"));
    v31 = objc_claimAutoreleasedReturnValue();
    roughnessMaterialPropertyImage = v5->_roughnessMaterialPropertyImage;
    v5->_roughnessMaterialPropertyImage = (PKImage *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overlay"));
    v33 = objc_claimAutoreleasedReturnValue();
    overlayMaterialPropertyImage = v5->_overlayMaterialPropertyImage;
    v5->_overlayMaterialPropertyImage = (PKImage *)v33;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_roughnessMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_metalnessMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_selfIlluminationMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_ambientOcclusionMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_displacementMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_multiplyMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_transparentMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_emissionMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_reflectiveMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_normalMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_specularMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_ambientMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_diffuseMaterialPropertyImage, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassLiveRenderedImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_diffuseMaterialPropertyImage, CFSTR("diffuse"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ambientMaterialPropertyImage, CFSTR("ambient"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_specularMaterialPropertyImage, CFSTR("specular"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_normalMaterialPropertyImage, CFSTR("normal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reflectiveMaterialPropertyImage, CFSTR("reflective"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_emissionMaterialPropertyImage, CFSTR("emission"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transparentMaterialPropertyImage, CFSTR("transparent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_multiplyMaterialPropertyImage, CFSTR("multiply"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displacementMaterialPropertyImage, CFSTR("displacement"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ambientOcclusionMaterialPropertyImage, CFSTR("ambientOcclusion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_selfIlluminationMaterialPropertyImage, CFSTR("selfIllumination"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metalnessMaterialPropertyImage, CFSTR("metalness"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_roughnessMaterialPropertyImage, CFSTR("roughness"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overlayMaterialPropertyImage, CFSTR("overlay"));
  objc_autoreleasePoolPop(v6);

}

+ (BOOL)shouldCache
{
  return 0;
}

+ (int64_t)imageSetType
{
  return 6;
}

+ (unsigned)currentVersion
{
  return 3;
}

+ (id)archiveName
{
  return CFSTR("LiveRendered");
}

- (PKImage)normalMaterialPropertyImage
{
  return self->_normalMaterialPropertyImage;
}

- (PKPassLiveRenderedImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassLiveRenderedImageSet *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PKPassLiveRenderedImageSet *v22;
  PKPassLiveRenderedImageSet *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *context;
  id v34;
  id v35;
  objc_super v36;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PKPassLiveRenderedImageSet;
  v13 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v36, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v10, v11, v12, a5);
  if (v13)
  {
    context = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("diffuse"), v14, v12, a5);
    v32 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setDiffuseMaterialPropertyImage:](v13, "setDiffuseMaterialPropertyImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("ambient"), v14, v12, a5);
    v31 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setAmbientMaterialPropertyImage:](v13, "setAmbientMaterialPropertyImage:", v31);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("specular"), v14, v12, a5);
    v30 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setSpecularMaterialPropertyImage:](v13, "setSpecularMaterialPropertyImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("normal"), v14, v12, a5);
    v29 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setNormalMaterialPropertyImage:](v13, "setNormalMaterialPropertyImage:", v29);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("reflective"), v14, v12, a5);
    v28 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setReflectiveMaterialPropertyImage:](v13, "setReflectiveMaterialPropertyImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("emission"), v14, v12, a5);
    v27 = objc_claimAutoreleasedReturnValue();
    v34 = v11;
    -[PKPassLiveRenderedImageSet setEmissionMaterialPropertyImage:](v13, "setEmissionMaterialPropertyImage:", v27);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("transparent"), v14, v12, a5);
    v26 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setTransparentMaterialPropertyImage:](v13, "setTransparentMaterialPropertyImage:", v26);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("multiply"), v14, v12, a5);
    v25 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setMultiplyMaterialPropertyImage:](v13, "setMultiplyMaterialPropertyImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("displacement"), v14, v12, a5);
    v15 = objc_claimAutoreleasedReturnValue();
    v35 = v10;
    -[PKPassLiveRenderedImageSet setDisplacementMaterialPropertyImage:](v13, "setDisplacementMaterialPropertyImage:", v15);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("ambientOcclusion"), v14, v12, a5);
    v16 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setAmbientOcclusionMaterialPropertyImage:](v13, "setAmbientOcclusionMaterialPropertyImage:", v16);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("selfIllumination"), v14, v12, a5);
    v17 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setSelfIlluminationMaterialPropertyImage:](v13, "setSelfIlluminationMaterialPropertyImage:", v17);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("metalness"), v14, v12, a5);
    v18 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setMetalnessMaterialPropertyImage:](v13, "setMetalnessMaterialPropertyImage:", v18);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("roughness"), v14, v12, a5);
    v19 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setRoughnessMaterialPropertyImage:](v13, "setRoughnessMaterialPropertyImage:", v19);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("overlay"), v14, v12, a5);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v32 | v31 | v30 | v29 | v28 | v27 | v26 | v25 | v15 | v16 | v17 | v18 | v19 | v20;
    -[PKPassLiveRenderedImageSet setOverlayMaterialPropertyImage:](v13, "setOverlayMaterialPropertyImage:", v20);

    v10 = v35;
    v11 = v34;

    objc_autoreleasePoolPop(context);
    if (v21)
      v22 = v13;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  return v23;
}

- (void)setTransparentMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_transparentMaterialPropertyImage, a3);
}

- (void)setSpecularMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_specularMaterialPropertyImage, a3);
}

- (void)setSelfIlluminationMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_selfIlluminationMaterialPropertyImage, a3);
}

- (void)setRoughnessMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_roughnessMaterialPropertyImage, a3);
}

- (void)setReflectiveMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_reflectiveMaterialPropertyImage, a3);
}

- (void)setOverlayMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_overlayMaterialPropertyImage, a3);
}

- (void)setNormalMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_normalMaterialPropertyImage, a3);
}

- (void)setMultiplyMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_multiplyMaterialPropertyImage, a3);
}

- (void)setMetalnessMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_metalnessMaterialPropertyImage, a3);
}

- (void)setEmissionMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_emissionMaterialPropertyImage, a3);
}

- (void)setDisplacementMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_displacementMaterialPropertyImage, a3);
}

- (void)setDiffuseMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_diffuseMaterialPropertyImage, a3);
}

- (void)setAmbientOcclusionMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_ambientOcclusionMaterialPropertyImage, a3);
}

- (void)setAmbientMaterialPropertyImage:(id)a3
{
  objc_storeStrong((id *)&self->_ambientMaterialPropertyImage, a3);
}

- (PKImage)overlayMaterialPropertyImage
{
  return self->_overlayMaterialPropertyImage;
}

- (PKImage)metalnessMaterialPropertyImage
{
  return self->_metalnessMaterialPropertyImage;
}

- (PKImage)diffuseMaterialPropertyImage
{
  return self->_diffuseMaterialPropertyImage;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_diffuseMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_ambientMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_specularMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_normalMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_reflectiveMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_emissionMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_transparentMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_multiplyMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_displacementMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_ambientOcclusionMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_selfIlluminationMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_metalnessMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_roughnessMaterialPropertyImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_overlayMaterialPropertyImage, "preheatBitmapData");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_diffuseMaterialPropertyImage, v5[3])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_ambientMaterialPropertyImage, v5[4])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_specularMaterialPropertyImage, v5[5])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_normalMaterialPropertyImage, v5[6])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_reflectiveMaterialPropertyImage, v5[7])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_emissionMaterialPropertyImage, v5[8])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_transparentMaterialPropertyImage, v5[9])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_multiplyMaterialPropertyImage, v5[10])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_displacementMaterialPropertyImage, v5[11])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_ambientOcclusionMaterialPropertyImage, v5[12])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_selfIlluminationMaterialPropertyImage, v5[13])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_metalnessMaterialPropertyImage, v5[14])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_roughnessMaterialPropertyImage, v5[15])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_overlayMaterialPropertyImage, v5[16]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[PKImage imageHash](self->_diffuseMaterialPropertyImage, "imageHash");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "hash");
  -[PKImage imageHash](self->_ambientMaterialPropertyImage, "imageHash");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash") + v3;
  -[PKImage imageHash](self->_specularMaterialPropertyImage, "imageHash");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v29, "hash");
  -[PKImage imageHash](self->_normalMaterialPropertyImage, "imageHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + v5 + objc_msgSend(v28, "hash");
  -[PKImage imageHash](self->_reflectiveMaterialPropertyImage, "imageHash");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v27, "hash");
  -[PKImage imageHash](self->_emissionMaterialPropertyImage, "imageHash");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 + objc_msgSend(v26, "hash");
  -[PKImage imageHash](self->_transparentMaterialPropertyImage, "imageHash");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 + v8 + objc_msgSend(v25, "hash");
  -[PKImage imageHash](self->_multiplyMaterialPropertyImage, "imageHash");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v24, "hash");
  -[PKImage imageHash](self->_displacementMaterialPropertyImage, "imageHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 + objc_msgSend(v11, "hash");
  -[PKImage imageHash](self->_ambientOcclusionMaterialPropertyImage, "imageHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 + objc_msgSend(v13, "hash");
  -[PKImage imageHash](self->_selfIlluminationMaterialPropertyImage, "imageHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9 + v14 + objc_msgSend(v15, "hash");
  -[PKImage imageHash](self->_metalnessMaterialPropertyImage, "imageHash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[PKImage imageHash](self->_roughnessMaterialPropertyImage, "imageHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 + objc_msgSend(v19, "hash");
  -[PKImage imageHash](self->_overlayMaterialPropertyImage, "imageHash");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16 + v20 + objc_msgSend(v21, "hash");

  return v22;
}

- (PKImage)ambientMaterialPropertyImage
{
  return self->_ambientMaterialPropertyImage;
}

- (PKImage)specularMaterialPropertyImage
{
  return self->_specularMaterialPropertyImage;
}

- (PKImage)reflectiveMaterialPropertyImage
{
  return self->_reflectiveMaterialPropertyImage;
}

- (PKImage)emissionMaterialPropertyImage
{
  return self->_emissionMaterialPropertyImage;
}

- (PKImage)transparentMaterialPropertyImage
{
  return self->_transparentMaterialPropertyImage;
}

- (PKImage)multiplyMaterialPropertyImage
{
  return self->_multiplyMaterialPropertyImage;
}

- (PKImage)displacementMaterialPropertyImage
{
  return self->_displacementMaterialPropertyImage;
}

- (PKImage)ambientOcclusionMaterialPropertyImage
{
  return self->_ambientOcclusionMaterialPropertyImage;
}

- (PKImage)selfIlluminationMaterialPropertyImage
{
  return self->_selfIlluminationMaterialPropertyImage;
}

- (PKImage)roughnessMaterialPropertyImage
{
  return self->_roughnessMaterialPropertyImage;
}

@end
