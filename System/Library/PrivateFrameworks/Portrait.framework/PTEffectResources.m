@implementation PTEffectResources

- (NSString)effectNetworkConfig
{
  return self->_effectNetworkConfig;
}

- (void)setSegmentationNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationNetwork, a3);
}

- (void)setRenderEffect:(id)a3
{
  objc_storeStrong((id *)&self->_renderEffect, a3);
}

- (void)setHandGestureDetector:(id)a3
{
  objc_storeStrong((id *)&self->_handGestureDetector, a3);
}

- (void)setEffectNetworkPath:(id)a3
{
  objc_storeStrong((id *)&self->_effectNetworkPath, a3);
}

- (void)setEffectNetworkConfig:(id)a3
{
  objc_storeStrong((id *)&self->_effectNetworkConfig, a3);
}

- (void)setEffectNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_effectNetwork, a3);
}

- (PTEspressoGenericExecutor)segmentationNetwork
{
  return self->_segmentationNetwork;
}

- (PTVFXRenderEffect)renderEffect
{
  return self->_renderEffect;
}

- (PTHandGestureDetector)handGestureDetector
{
  return self->_handGestureDetector;
}

- (NSString)effectNetworkPath
{
  return self->_effectNetworkPath;
}

- (PTEspressoGenericExecutor)effectNetwork
{
  return self->_effectNetwork;
}

- (PTEffectPersonSegmentationViSegHQVisionCore)personSegmentationProvider
{
  return self->_personSegmentationProvider;
}

- (void)setPersonSegmentationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_personSegmentationProvider, a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 64);
  return self;
}

- (void)setSegmentationSize:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_segmentationSize.depth = a3->var2;
  *(_OWORD *)&self->_segmentationSize.width = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderEffect, 0);
  objc_storeStrong((id *)&self->_personSegmentationProvider, 0);
  objc_storeStrong((id *)&self->_handGestureDetector, 0);
  objc_storeStrong((id *)&self->_segmentationNetwork, 0);
  objc_storeStrong((id *)&self->_effectNetwork, 0);
  objc_storeStrong((id *)&self->_effectNetworkConfig, 0);
  objc_storeStrong((id *)&self->_effectNetworkPath, 0);
}

@end
