@implementation BSUIAudiobookControlBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(BSUIAudiobookControlBoxLayout, a2);
}

- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress
{
  return self->_dynamicAudiobookProgress;
}

- (void)setDynamicAudiobookProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, a3);
}

- (TUIDynamicProviding)dynamicState
{
  return self->_dynamicState;
}

- (void)setDynamicState:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicState, 0);
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, 0);
}

@end
