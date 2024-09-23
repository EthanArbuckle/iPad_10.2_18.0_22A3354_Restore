@implementation PNPetPromoterWrapper

- (PNPetPromoterWrapper)initWithLibrary:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  PNPetPromoterWrapper *v8;
  PNPetPromoter *v9;
  PNPetPromoter *petPromoter;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PNPetPromoterWrapper;
  v8 = -[PNPetPromoterWrapper init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PNPetPromoter initWithPhotoLibrary:andDelegate:]([PNPetPromoter alloc], "initWithPhotoLibrary:andDelegate:", v6, v7);
    petPromoter = v8->_petPromoter;
    v8->_petPromoter = v9;

  }
  return v8;
}

- (void)promoteUnverifiedPetsWithUpdateBlock:(id)a3
{
  -[PNPetPromoter promoteUnverifiedPetsWithUpdateBlock:](self->_petPromoter, "promoteUnverifiedPetsWithUpdateBlock:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petPromoter, 0);
}

+ (void)promoteUnverifiedPetsInPhotoLibrary:(id)a3 withUpdateBlock:(id)a4
{
  +[PNPetPromoter promoteUnverifiedPetsInPhotoLibrary:withUpdateBlock:](PNPetPromoter, "promoteUnverifiedPetsInPhotoLibrary:withUpdateBlock:", a3, a4);
}

+ (id)statusWithLibrary:(id)a3 delegate:(id)a4
{
  return +[PNPetPromoter statusWithPhotoLibrary:delegate:](PNPetPromoter, "statusWithPhotoLibrary:delegate:", a3, a4);
}

+ (unint64_t)minimumNumberOfFacesNeededForPromotion
{
  return +[PNPetPromoter kPNPetPromoterVerifiedPetMinimumNumberOfFaces](PNPetPromoter, "kPNPetPromoterVerifiedPetMinimumNumberOfFaces");
}

@end
