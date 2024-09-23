@implementation PTCinematographyRefinementOptions

- (PTCinematographyRefinementOptions)init
{
  PTCinematographyRefinementOptions *v2;
  PTCinematographyFocusFramesOptions *v3;
  PTCinematographyFocusFramesOptions *focusFramesOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTCinematographyRefinementOptions;
  v2 = -[PTCinematographyRefinementOptions init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PTCinematographyFocusFramesOptions);
    focusFramesOptions = v2->_focusFramesOptions;
    v2->_focusFramesOptions = v3;

  }
  return v2;
}

- (PTGlobalCinematographyMetadata)globalMetadata
{
  return self->_globalMetadata;
}

- (void)setGlobalMetadata:(id)a3
{
  id v4;
  PTCinematographyFocusFramesOptions *v5;
  PTCinematographyFocusFramesOptions *focusFramesOptions;
  PTGlobalCinematographyMetadata *v7;
  PTGlobalCinematographyMetadata *globalMetadata;

  v4 = a3;
  v5 = -[PTCinematographyFocusFramesOptions initWithGlobalMetadata:]([PTCinematographyFocusFramesOptions alloc], "initWithGlobalMetadata:", v4);
  focusFramesOptions = self->_focusFramesOptions;
  self->_focusFramesOptions = v5;

  v7 = (PTGlobalCinematographyMetadata *)objc_msgSend(v4, "copy");
  globalMetadata = self->_globalMetadata;
  self->_globalMetadata = v7;

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rackFocusPullTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PTCinematographyRefinementOptions focusFramesOptions](self, "focusFramesOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "maximumRackFocusPullTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[PTCinematographyRefinementOptions focusFramesOptions](self, "focusFramesOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFocusFramesOptions:", v6);

  -[PTCinematographyRefinementOptions globalMetadata](self, "globalMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setGlobalMetadata:", v8);

  objc_msgSend(v4, "setDisableDetectionSmoothing:", -[PTCinematographyRefinementOptions disableDetectionSmoothing](self, "disableDetectionSmoothing"));
  return v4;
}

- (BOOL)disableDetectionSmoothing
{
  return self->_disableDetectionSmoothing;
}

- (void)setDisableDetectionSmoothing:(BOOL)a3
{
  self->_disableDetectionSmoothing = a3;
}

- (PTCinematographyFocusFramesOptions)focusFramesOptions
{
  return (PTCinematographyFocusFramesOptions *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFocusFramesOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusFramesOptions, 0);
  objc_storeStrong((id *)&self->_globalMetadata, 0);
}

@end
