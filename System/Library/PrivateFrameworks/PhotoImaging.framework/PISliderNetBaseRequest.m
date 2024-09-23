@implementation PISliderNetBaseRequest

- (PISliderNetBaseRequest)initWithComposition:(id)a3 sliderNetModel:(id)a4
{
  id v7;
  PISliderNetBaseRequest *v8;
  PISliderNetBaseRequest *v9;
  uint64_t v10;
  NUScalePolicy *scalePolicy;
  uint64_t v12;
  NUColorSpace *colorSpace;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PISliderNetBaseRequest;
  v8 = -[NURenderRequest initWithComposition:](&v15, sel_initWithComposition_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sliderNetModel, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D520C0]), "initWithTargetPixelSize:", 256, 256);
    scalePolicy = v9->_scalePolicy;
    v9->_scalePolicy = (NUScalePolicy *)v10;

    objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
    v12 = objc_claimAutoreleasedReturnValue();
    colorSpace = v9->_colorSpace;
    v9->_colorSpace = (NUColorSpace *)v12;

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PISliderNetBaseRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 21, self->_sliderNetModel);
    objc_storeStrong(v5 + 19, self->_scalePolicy);
    objc_storeStrong(v5 + 20, self->_colorSpace);
    objc_storeStrong(v5 + 22, self->_assetScenePrint);
  }
  return v5;
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (IHKSliderNetCPModel)sliderNetModel
{
  return self->_sliderNetModel;
}

- (void)setSliderNetModel:(id)a3
{
  objc_storeStrong((id *)&self->_sliderNetModel, a3);
}

- (NSData)assetScenePrint
{
  return self->_assetScenePrint;
}

- (void)setAssetScenePrint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetScenePrint, 0);
  objc_storeStrong((id *)&self->_sliderNetModel, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

@end
