@implementation _UIKeyboardFeedbackDescriptor

+ (id)descriptorWithIntensity:(float)a3 sharpness:(float)a4 audio:(id)a5 volume:(float)a6
{
  id v9;
  _UIKeyboardFeedbackDescriptor *v10;
  double v11;
  double v12;
  double v13;

  v9 = a5;
  v10 = objc_alloc_init(_UIKeyboardFeedbackDescriptor);
  *(float *)&v11 = a3;
  -[_UIKeyboardFeedbackDescriptor setHapticIntensity:](v10, "setHapticIntensity:", v11);
  *(float *)&v12 = a4;
  -[_UIKeyboardFeedbackDescriptor setHapticSharpness:](v10, "setHapticSharpness:", v12);
  -[_UIKeyboardFeedbackDescriptor setAudioFile:](v10, "setAudioFile:", v9);

  *(float *)&v13 = a6;
  -[_UIKeyboardFeedbackDescriptor setAudioVolume:](v10, "setAudioVolume:", v13);
  return v10;
}

- (float)hapticIntensity
{
  return self->_hapticIntensity;
}

- (void)setHapticIntensity:(float)a3
{
  self->_hapticIntensity = a3;
}

- (float)hapticSharpness
{
  return self->_hapticSharpness;
}

- (void)setHapticSharpness:(float)a3
{
  self->_hapticSharpness = a3;
}

- (NSString)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFile, 0);
}

@end
