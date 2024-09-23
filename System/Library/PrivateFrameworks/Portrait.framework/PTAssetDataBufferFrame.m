@implementation PTAssetDataBufferFrame

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_dataBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PTAssetDataBufferFrame;
  -[PTAssetDataBufferFrame dealloc](&v3, sel_dealloc);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (__CVBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(__CVBuffer *)a3
{
  self->_dataBuffer = a3;
}

@end
