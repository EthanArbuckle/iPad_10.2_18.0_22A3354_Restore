@implementation PXPhotosGridFloatingHeaderSnapshot

- (PXPhotosGridFloatingHeaderSnapshot)initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 buttonActionType:(unint64_t)a6 assetCollectionReference:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PXPhotosGridFloatingHeaderSnapshot *v16;
  uint64_t v17;
  NSAttributedString *title;
  uint64_t v19;
  NSAttributedString *subtitle;
  uint64_t v21;
  NSString *buttonTitle;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosGridFloatingHeaderSnapshot;
  v16 = -[PXPhotosGridFloatingHeaderSnapshot init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    title = v16->_title;
    v16->_title = (NSAttributedString *)v17;

    v19 = objc_msgSend(v13, "copy");
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSAttributedString *)v19;

    v21 = objc_msgSend(v14, "copy");
    buttonTitle = v16->_buttonTitle;
    v16->_buttonTitle = (NSString *)v21;

    v16->_buttonActionType = a6;
    objc_storeStrong((id *)&v16->_assetCollectionReference, a7);
  }

  return v16;
}

- (BOOL)floatingEnableOverview
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PXPhotosGridFloatingHeaderSnapshot assetCollectionReference](self, "assetCollectionReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPhotosGridFloatingHeaderSnapshot buttonTitle](self, "buttonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSAttributedString)floatingSummaryTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PXPhotosGridFloatingHeaderSnapshot title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5149688);
  v5 = v4;

  return (NSAttributedString *)v5;
}

- (NSAttributedString)floatingSummarySubtitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PXPhotosGridFloatingHeaderSnapshot subtitle](self, "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5149688);
  v5 = v4;

  return (NSAttributedString *)v5;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (unint64_t)buttonActionType
{
  return self->_buttonActionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
