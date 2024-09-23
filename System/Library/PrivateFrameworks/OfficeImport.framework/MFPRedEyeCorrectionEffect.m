@implementation MFPRedEyeCorrectionEffect

+ (id)GUID
{
  return CFSTR("74D29D05-69A4-4266-9549-3CC52836B632");
}

- (MFPRedEyeCorrectionEffect)initWithAreas:(const void *)a3
{
  MFPRedEyeCorrectionEffect *v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPRedEyeCorrectionEffect;
  v4 = -[MFPRedEyeCorrectionEffect init](&v7, sel_init);
  if (v4)
  {
    v5 = (_QWORD *)operator new();
    *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
    std::vector<CGRect>::__init_with_size[abi:ne180100]<CGRect*,CGRect*>(v5, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5);
    v4->mAreas = v5;
  }
  return v4;
}

- (void)dealloc
{
  void **mAreas;
  void *v4;
  objc_super v5;

  mAreas = (void **)self->mAreas;
  if (mAreas)
  {
    v4 = *mAreas;
    if (*mAreas)
    {
      mAreas[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x22E2DD408](mAreas, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFPRedEyeCorrectionEffect;
  -[MFPRedEyeCorrectionEffect dealloc](&v5, sel_dealloc);
}

@end
