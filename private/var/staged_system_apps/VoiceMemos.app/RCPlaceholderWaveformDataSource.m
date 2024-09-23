@implementation RCPlaceholderWaveformDataSource

- (RCPlaceholderWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCPlaceholderWaveformDataSource;
  return -[RCPlaceholderWaveformDataSource initWithWaveformGenerator:generatedWaveformOutputURL:](&v5, "initWithWaveformGenerator:generatedWaveformOutputURL:", a3, a4);
}

- (RCPlaceholderWaveformDataSource)initWithDuration:(double)a3
{
  RCPlaceholderWaveformDataSource *result;

  result = -[RCPlaceholderWaveformDataSource initWithWaveformGenerator:generatedWaveformOutputURL:](self, "initWithWaveformGenerator:generatedWaveformOutputURL:", 0, 0);
  if (result)
    result->_placeholderDuration = a3;
  return result;
}

- (double)duration
{
  return self->_placeholderDuration;
}

@end
