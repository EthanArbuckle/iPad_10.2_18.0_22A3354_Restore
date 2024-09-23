@implementation RCTrimmedCompositionWaveformDataSource

- (RCTrimmedCompositionWaveformDataSource)initWithSourceComposition:(id)a3 destinationWaveformURL:(id)a4
{
  id v7;
  RCTrimmedCompositionWaveformDataSource *v8;
  RCTrimmedCompositionWaveformDataSource *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RCTrimmedCompositionWaveformDataSource;
  v8 = -[RCCompositionWaveformDataSource initWithComposition:](&v11, sel_initWithComposition_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destinationWaveformURL, a4);
    -[RCCompositionWaveformDataSource setSaveGeneratedWaveform:](v9, "setSaveGeneratedWaveform:", 1);
  }

  return v9;
}

- (BOOL)preferLoadingFragmentWaveforms
{
  return 1;
}

- (id)generatedWaveformOutputURL
{
  return self->_destinationWaveformURL;
}

- (NSURL)destinationWaveformURL
{
  return self->_destinationWaveformURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationWaveformURL, 0);
}

@end
