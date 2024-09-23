@implementation PAEFracturedTransition

- (PAEFracturedTransition)initWithAPIManager:(id)a3
{
  PAEFracturedTransition *v3;
  FracturedUtils::FracturedParams *v4;
  FracturedParams *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEFracturedTransition;
  v3 = -[PAESharedDefaultBase initWithAPIManager:](&v7, sel_initWithAPIManager_, a3);
  if (v3)
  {
    v4 = (FracturedUtils::FracturedParams *)operator new();
    FracturedUtils::FracturedParams::FracturedParams(v4);
    v3->_fxParams = v5;
    v3->_fxPoolLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
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

  v6.receiver = self;
  v6.super_class = (Class)PAEFracturedTransition;
  -[PAESharedDefaultBase dealloc](&v6, sel_dealloc);
}

- (id)properties
{
  return (id)FracturedUtils::properties(0);
}

- (BOOL)addParameters
{
  return FracturedUtils::addParameters(self, self->super.super._apiManager, 1, (uint64_t)self->_fxParams);
}

- (BOOL)frameSetup:(id *)a3 inputInfoA:(id *)a4 inputInfoB:(id *)a5 timeFraction:(float)a6 hardware:(BOOL *)a7 software:(BOOL *)a8
{
  *a7 = 1;
  *a8 = 0;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7
{
  HGFractured::Effect *ReadyEffect;

  ReadyEffect = (HGFractured::Effect *)FracturedUtils::getReadyEffect((void **)&self->_fxPool.__begin_, self->_fxPoolLock);
  FracturedUtils::renderOutput(self, self->super.super._apiManager, ReadyEffect, (uint64_t)self->_fxParams, a3, a4, a5, &a7->var0.var0, a6, 1);
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
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
