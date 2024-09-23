@implementation PTAssetCinematicGlobals

- (PTAssetCinematicGlobals)initWithAssetReader:(id)a3
{
  id v4;
  PTAssetCinematicGlobals *v5;
  PTAssetCinematicGlobals *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTAssetCinematicGlobals;
  v5 = -[PTAssetCinematicGlobals init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PTAssetCinematicGlobals _assignGlobalsFromAssetReader:](v5, "_assignGlobalsFromAssetReader:", v4);

  return v6;
}

- (void)_assignGlobalsFromAssetReader:(id)a3
{
  id v4;
  PTGlobalCinematographyMetadata *v5;
  PTGlobalCinematographyMetadata *globalCinematographyMetadata;
  PTGlobalRenderingMetadata *v7;
  PTGlobalRenderingMetadata *globalRenderingMetadata;
  PTGlobalStabilizationMetadata *v9;
  PTGlobalStabilizationMetadata *globalStabilizationMetadata;
  PTGlobalVideoHeaderMetadata *v11;
  PTGlobalVideoHeaderMetadata *globalVideoHeaderMetadata;
  NSString *v13;
  NSString *colorPrimaries;
  NSString *v15;
  NSString *transferFunction;
  NSString *v17;
  NSString *YCbCrMatrix;
  opaqueCMFormatDescription *v19;
  __int128 v20;
  int64_t v21;

  v4 = a3;
  objc_msgSend(v4, "globalCinematographyMetadata");
  v5 = (PTGlobalCinematographyMetadata *)objc_claimAutoreleasedReturnValue();
  globalCinematographyMetadata = self->_globalCinematographyMetadata;
  self->_globalCinematographyMetadata = v5;

  objc_msgSend(v4, "globalRenderingMetadata");
  v7 = (PTGlobalRenderingMetadata *)objc_claimAutoreleasedReturnValue();
  globalRenderingMetadata = self->_globalRenderingMetadata;
  self->_globalRenderingMetadata = v7;

  objc_msgSend(v4, "globalStabilizationMetadata");
  v9 = (PTGlobalStabilizationMetadata *)objc_claimAutoreleasedReturnValue();
  globalStabilizationMetadata = self->_globalStabilizationMetadata;
  self->_globalStabilizationMetadata = v9;

  objc_msgSend(v4, "globalVideoHeaderMetadata");
  v11 = (PTGlobalVideoHeaderMetadata *)objc_claimAutoreleasedReturnValue();
  globalVideoHeaderMetadata = self->_globalVideoHeaderMetadata;
  self->_globalVideoHeaderMetadata = v11;

  objc_msgSend(v4, "colorPrimaries");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  colorPrimaries = self->_colorPrimaries;
  self->_colorPrimaries = v13;

  objc_msgSend(v4, "transferFunction");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  transferFunction = self->_transferFunction;
  self->_transferFunction = v15;

  objc_msgSend(v4, "YCbCrMatrix");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  YCbCrMatrix = self->_YCbCrMatrix;
  self->_YCbCrMatrix = v17;

  self->_estimatedDataRate = objc_msgSend(v4, "estimatedDataRate");
  v19 = (opaqueCMFormatDescription *)objc_msgSend(v4, "formatDescription");
  self->_formatDescription = v19;
  if (v19)
    CFRetain(v19);
  if (v4)
  {
    objc_msgSend(v4, "frameDuration");
  }
  else
  {
    v20 = 0uLL;
    v21 = 0;
  }
  *(_OWORD *)&self->_frameDuration.value = v20;
  self->_frameDuration.epoch = v21;

}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  objc_super v4;

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  v4.receiver = self;
  v4.super_class = (Class)PTAssetCinematicGlobals;
  -[PTAssetCinematicGlobals dealloc](&v4, sel_dealloc);
}

- (PTGlobalCinematographyMetadata)globalCinematographyMetadata
{
  return self->_globalCinematographyMetadata;
}

- (void)setGlobalCinematographyMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_globalCinematographyMetadata, a3);
}

- (PTGlobalRenderingMetadata)globalRenderingMetadata
{
  return self->_globalRenderingMetadata;
}

- (void)setGlobalRenderingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_globalRenderingMetadata, a3);
}

- (PTGlobalStabilizationMetadata)globalStabilizationMetadata
{
  return self->_globalStabilizationMetadata;
}

- (void)setGlobalStabilizationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_globalStabilizationMetadata, a3);
}

- (PTGlobalVideoHeaderMetadata)globalVideoHeaderMetadata
{
  return self->_globalVideoHeaderMetadata;
}

- (void)setGlobalVideoHeaderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_globalVideoHeaderMetadata, a3);
}

- (NSString)colorPrimaries
{
  return self->_colorPrimaries;
}

- (NSString)transferFunction
{
  return self->_transferFunction;
}

- (NSString)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

- (BOOL)is420YUV10Bit
{
  return self->_is420YUV10Bit;
}

- (unint64_t)estimatedDataRate
{
  return self->_estimatedDataRate;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, 0);
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);
  objc_storeStrong((id *)&self->_globalVideoHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_globalStabilizationMetadata, 0);
  objc_storeStrong((id *)&self->_globalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_globalCinematographyMetadata, 0);
}

@end
