@implementation SWMediaSettings

- (SWMediaSettings)initWithMediaTypesRequiringUserActionForPlayback:(unint64_t)a3 fullScreenEnabled:(BOOL)a4
{
  SWMediaSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWMediaSettings;
  result = -[SWMediaSettings init](&v7, sel_init);
  if (result)
  {
    result->_mediaTypesRequiringUserActionForPlayback = a3;
    result->_fullScreenEnabled = a4;
  }
  return result;
}

- (unint64_t)mediaTypesRequiringUserActionForPlayback
{
  return self->_mediaTypesRequiringUserActionForPlayback;
}

- (BOOL)fullScreenEnabled
{
  return self->_fullScreenEnabled;
}

@end
