@implementation GEORPPlaceInfo

- (GEORPPlaceInfo)initWithCorrectedSearch:(id)a3
{
  id v4;
  GEORPPlaceInfo *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORPPlaceInfo;
  v5 = -[GEORPPlaceInfo init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeResponse"));
    -[GEORPPlaceInfo setPlaceResponse:](v5, "setPlaceResponse:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeRequest"));
    -[GEORPPlaceInfo setPlaceRequest:](v5, "setPlaceRequest:", v7);

  }
  return v5;
}

@end
