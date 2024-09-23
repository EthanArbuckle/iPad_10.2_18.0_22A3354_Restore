@implementation SFSSAudioDataWrapper

- (SFSSAudioDataWrapper)initWithAudioChunks:(id)a3
{
  id v4;
  SFSSAudioDataWrapper *v5;
  SFSSAudioDataWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFSSAudioDataWrapper;
  v5 = -[SFSSAudioDataWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_index = 0;
    objc_storeWeak((id *)&v5->_audioChunks, v4);
  }

  return v6;
}

- (NSArray)audioChunks
{
  return (NSArray *)objc_loadWeakRetained((id *)&self->_audioChunks);
}

- (void)setAudioChunks:(id)a3
{
  objc_storeWeak((id *)&self->_audioChunks, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioChunks);
}

@end
