@implementation PTEffectTemporalState

- (PTEffectTemporalState)initWithMetalContext:(id)a3
{
  id v5;
  PTEffectTemporalState *v6;
  PTEffectTemporalState *v7;
  PTEffectTemporalState *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTEffectTemporalState;
  v6 = -[PTEffectTemporalState init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)saveState:(id)a3 cvmNetwork:(id)a4 msrColorPyramid:(id)a5
{
  PTMetalContext *metalContext;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  MTLTexture *v18;
  MTLTexture *disparityNetworkTemporalState;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MTLTexture *v24;
  MTLTexture *lastQuatersizeRGBA;
  void *v26;
  id v27;

  metalContext = self->_metalContext;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PTMetalContext textureUtil](metalContext, "textureUtil");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inPrevDisparity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "width");
  objc_msgSend(v10, "inPrevDisparity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "height");
  objc_msgSend(v10, "inPrevDisparity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createWithWidth:height:pixelFormat:", v14, v16, objc_msgSend(v17, "pixelFormat"));
  v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  disparityNetworkTemporalState = self->_disparityNetworkTemporalState;
  self->_disparityNetworkTemporalState = v18;

  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outDisparity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "copy:inTex:outTex:", v11, v21, self->_disparityNetworkTemporalState);
  objc_msgSend(v9, "pyramidRGBA");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "firstObject");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "createWithWidth:height:pixelFormat:", objc_msgSend(v27, "width"), objc_msgSend(v27, "height"), objc_msgSend(v27, "pixelFormat"));
  v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  lastQuatersizeRGBA = self->_lastQuatersizeRGBA;
  self->_lastQuatersizeRGBA = v24;

  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "copy:inTex:outTex:", v11, v27, self->_lastQuatersizeRGBA);

}

- (void)restoreState:(id)a3 cvmNetwork:(id)a4 temporalFilter:(id)a5
{
  PTMetalContext *metalContext;
  id v9;
  id v10;
  id v11;
  void *v12;
  MTLTexture *disparityNetworkTemporalState;
  void *v14;
  void *v15;
  MTLTexture *lastQuatersizeRGBA;
  void *v17;
  id v18;

  metalContext = self->_metalContext;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PTMetalContext textureUtil](metalContext, "textureUtil");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  disparityNetworkTemporalState = self->_disparityNetworkTemporalState;
  objc_msgSend(v10, "inPrevDisparity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "copy:inTex:outTex:", v11, disparityNetworkTemporalState, v14);

  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  lastQuatersizeRGBA = self->_lastQuatersizeRGBA;
  objc_msgSend(v10, "inRGBA");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "copy:inTex:outTex:", v11, lastQuatersizeRGBA, v17);

  objc_msgSend(v10, "inRGBA");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "prepareFilter:opticalFlowRGB:frameIndex:", v11, v18, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQuatersizeRGBA, 0);
  objc_storeStrong((id *)&self->_disparityNetworkTemporalState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
