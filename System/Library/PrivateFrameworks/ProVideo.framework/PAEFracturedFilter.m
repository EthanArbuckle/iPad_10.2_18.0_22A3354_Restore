@implementation PAEFracturedFilter

- (PAEFracturedFilter)initWithAPIManager:(id)a3
{
  PAEFracturedFilter *v3;
  FracturedUtils::FracturedParams *v4;
  FracturedParams *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEFracturedFilter;
  v3 = -[PAESharedDefaultBase initWithAPIManager:](&v7, sel_initWithAPIManager_, a3);
  if (v3)
  {
    v4 = (FracturedUtils::FracturedParams *)operator new();
    FracturedUtils::FracturedParams::FracturedParams(v4);
    v3->_fxParams = v5;
    v3->_fxPoolLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_onVTBUserInteractionEventNotification_, CFSTR("VTBUserInteractionEventNotification"), 0);
  }
  return v3;
}

- (void)dealloc
{
  FracturedParams *fxParams;
  FracturedFXPoolItem **end;
  id **begin;
  objc_super v6;

  fxParams = self->_fxParams;
  if (fxParams)
    MEMORY[0x1B5E29170](fxParams, 0x1000C4085B916AELL);
  begin = (id **)self->_fxPool.__begin_;
  end = self->_fxPool.__end_;
  if (begin != (id **)end)
  {
    do
    {
      if (*begin)
      {
        FracturedUtils::FracturedFXPoolItem::~FracturedFXPoolItem(*begin);
        MEMORY[0x1B5E29170]();
        end = self->_fxPool.__end_;
      }
      ++begin;
    }
    while (begin != (id **)end);
    begin = (id **)self->_fxPool.__begin_;
  }
  self->_fxPool.__end_ = (FracturedFXPoolItem **)begin;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v6.receiver = self;
  v6.super_class = (Class)PAEFracturedFilter;
  -[PAESharedDefaultBase dealloc](&v6, sel_dealloc);
}

- (void)onVTBUserInteractionEventNotification:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X")), "doubleValue");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Y")), "doubleValue");
  v8 = v7;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VelocityX")), "doubleValue");
  v10 = v9;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VelocityY")), "doubleValue");
  v12 = v11;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Scale")), "doubleValue");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ScaleVelocity")), "doubleValue");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Rotation")), "doubleValue");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RotationVelocity")), "doubleValue");
  *(float *)&v13 = v6;
  FracturedUtils::_lastTouchX = v13;
  *(float *)&v14 = v8;
  FracturedUtils::_lastTouchY = v14;
  *(float *)&v15 = v10;
  FracturedUtils::_lastVelocityTouchX = v15;
  *(float *)&v16 = v12;
  FracturedUtils::_lastVelocityTouchY = v16;
  FracturedUtils::_frameTimeOffset = FracturedUtils::_lastFrameTime;
  -[NSLock lock](self->_fxPoolLock, "lock");
  self->_fxPool.__end_ = self->_fxPool.__begin_;
  -[NSLock unlock](self->_fxPoolLock, "unlock");
}

- (id)properties
{
  return (id)FracturedUtils::properties(0);
}

- (BOOL)addParameters
{
  return FracturedUtils::addParameters(self, self->super.super._apiManager, 0, (uint64_t)self->_fxParams);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  double v5;
  double v6;
  HGFractured::Effect *ReadyEffect;
  float v13;
  FracturedParams *fxParams;
  int v15;
  uint64_t v17;

  LODWORD(v5) = FracturedUtils::_lastTouchX;
  LODWORD(v6) = FracturedUtils::_lastTouchY;
  if (*(float *)&FracturedUtils::_lastTouchX == -1.0 || *(float *)&FracturedUtils::_lastTouchY == -1.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", a3, a4, a5, v5, v6);
    else
      v17 = 0;
    objc_msgSend(a3, "setHeliumRef:", &v17);
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);
  }
  else
  {
    ReadyEffect = (HGFractured::Effect *)FracturedUtils::getReadyEffect((void **)&self->_fxPool.__begin_, self->_fxPoolLock);
    v13 = *(float *)&FracturedUtils::_lastTouchY;
    fxParams = self->_fxParams;
    fxParams->var26[0] = -(float)(*(float *)&FracturedUtils::_lastTouchX + -0.5);
    fxParams->var26[1] = v13 + -0.5;
    v15 = FracturedUtils::_lastVelocityTouchY;
    LODWORD(fxParams->var27[0]) = FracturedUtils::_lastVelocityTouchX;
    LODWORD(fxParams->var27[1]) = v15;
    FracturedUtils::renderOutput(self, self->super.super._apiManager, ReadyEffect, (uint64_t)fxParams, a3, a4, 0, &a5->var0.var0, 0.0, 0);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  double v14;
  double v16;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (a3)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = v11 || a4 == 0;
  v13 = v12;
  if (!v12)
  {
    v16 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v16, 19, a6->var0.var1);
    v14 = v16;
    *a3 = (unint64_t)(v16 * (double)a5->var0);
    *a4 = (unint64_t)(v14 * (double)a5->var1);
  }
  return v13 ^ 1;
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)variesByDuration
{
  return 1;
}

- (void).cxx_destruct
{
  vector<FracturedUtils::FracturedFXPoolItem *, std::allocator<FracturedUtils::FracturedFXPoolItem *>> *p_fxPool;
  FracturedFXPoolItem **begin;

  p_fxPool = &self->_fxPool;
  begin = self->_fxPool.__begin_;
  if (begin)
  {
    p_fxPool->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
