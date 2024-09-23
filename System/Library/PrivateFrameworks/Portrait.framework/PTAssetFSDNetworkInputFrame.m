@implementation PTAssetFSDNetworkInputFrame

- (PTAssetFSDNetworkInputFrame)initWithRef:(__CVBuffer *)a3 aux:(__CVBuffer *)a4 unrectifyData:(id)a5 index:(unint64_t)a6
{
  NSDictionary *v10;
  PTAssetFSDNetworkInputFrame *v11;
  NSDictionary *unrectifyData;
  objc_super v14;

  v10 = (NSDictionary *)a5;
  v14.receiver = self;
  v14.super_class = (Class)PTAssetFSDNetworkInputFrame;
  v11 = -[PTAssetFSDNetworkInputFrame init](&v14, sel_init);
  v11->_refImageBuffer = a3;
  v11->_auxImageBuffer = a4;
  unrectifyData = v11->_unrectifyData;
  v11->_unrectifyData = v10;

  v11->_index = a6;
  return v11;
}

- (__CVBuffer)refImageBuffer
{
  return self->_refImageBuffer;
}

- (__CVBuffer)auxImageBuffer
{
  return self->_auxImageBuffer;
}

- (NSDictionary)unrectifyData
{
  return self->_unrectifyData;
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
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unrectifyData, 0);
}

@end
