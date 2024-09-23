@implementation PXSearchZeroKeywordPlaceViewModel

- (PXSearchZeroKeywordPlaceViewModel)initWithTitle:(id)a3 representedObject:(id)a4 fullGeoLocationName:(id)a5 keyAssetLocalIdentifiers:(id)a6 region:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchZeroKeywordViewModel.m"), 168, CFSTR("%s is not available as initializer"), "-[PXSearchZeroKeywordPlaceViewModel initWithTitle:representedObject:fullGeoLocationName:keyAssetLocalIdentifiers:region:]");

  abort();
}

- (PXSearchZeroKeywordPlaceViewModel)initWithType:(int64_t)a3 title:(id)a4 representedObject:(id)a5 fullGeoLocationName:(id)a6 keyAssetLocalIdentifiers:(id)a7 region:(id *)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  id v22;
  PXSearchZeroKeywordPlaceViewModel *v23;
  PXSearchZeroKeywordPlaceViewModel *v24;
  objc_super v26;

  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PXSearchZeroKeywordPlaceViewModel;
  v23 = -[PXSearchZeroKeywordBaseViewModel initWithType:title:representedObject:displayInfo:](&v26, sel_initWithType_title_representedObject_displayInfo_, a3, a4, a5, a6);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_keyAssetLocalIdentifiers, a7);
    v24->_region.center.latitude = v15;
    v24->_region.center.longitude = v14;
    v24->_region.span.latitudeDelta = v13;
    v24->_region.span.longitudeDelta = v12;
  }

  return v24;
}

- (NSArray)keyAssetLocalIdentifiers
{
  return self->_keyAssetLocalIdentifiers;
}

- ($FF1229205817863B52D17A627F035FCE)region
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifiers, 0);
}

@end
