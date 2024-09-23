@implementation PBSlideObjAndMasterPair

+ (id)createPair:(id)a3 masterId:(int)a4
{
  uint64_t v4;
  id v5;
  PBSlideObjAndMasterPair *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(PBSlideObjAndMasterPair);
  -[PBSlideObjAndMasterPair setSlide:masterId:](v6, "setSlide:masterId:", v5, v4);

  return v6;
}

- (void)setSlide:(id)a3 masterId:(int)a4
{
  objc_storeStrong((id *)&self->mSlide, a3);
  self->mMasterId = a4;
}

- (id)slide
{
  return self->mSlide;
}

- (int)masterId
{
  return self->mMasterId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSlide, 0);
}

@end
