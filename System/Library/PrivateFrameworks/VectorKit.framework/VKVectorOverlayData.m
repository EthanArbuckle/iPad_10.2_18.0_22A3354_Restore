@implementation VKVectorOverlayData

- (VKVectorOverlayData)init
{
  VKVectorOverlayData *v2;
  VKVectorOverlayData *v3;
  VKVectorOverlayData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKVectorOverlayData;
  v2 = -[VKVectorOverlayData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_blendMode = 0;
    v4 = v2;
  }

  return v3;
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int64_t)a3
{
  self->_blendMode = a3;
}

- (VKVectorOverlayDelegate)_delegate
{
  return (VKVectorOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
