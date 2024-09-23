@implementation PXPersonTiledImageCombinerItem

- (PXPersonTiledImageCombinerItem)initWithPerson:(id)a3
{
  id v6;
  PXPersonTiledImageCombinerItem *v7;
  PXPersonTiledImageCombinerItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPerson+PXFaceTileImageCombinerItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXPersonTiledImageCombinerItem;
  v7 = -[PXPersonTiledImageCombinerItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_person, a3);

  return v8;
}

- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  double height;
  double width;
  id v11;
  PXPerson *person;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPerson+PXFaceTileImageCombinerItem.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGSizeEqualToSize(targetSize, CGSizeZero)"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPerson+PXFaceTileImageCombinerItem.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

    if (v11)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPerson+PXFaceTileImageCombinerItem.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

    goto LABEL_8;
  }
  if (!v11)
    goto LABEL_10;
LABEL_8:
  person = self->_person;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__PXPersonTiledImageCombinerItem_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v18[3] = &unk_1E5147AB8;
  v19 = v11;
  v14 = v11;
  -[PXPerson requestFaceCropImageWithTargetSize:displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:](person, "requestFaceCropImageWithTargetSize:displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:", 0, 0, 1, 1, v18, width, height, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

void __97__PXPersonTiledImageCombinerItem_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);

}

@end
