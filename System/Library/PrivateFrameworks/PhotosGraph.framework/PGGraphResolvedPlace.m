@implementation PGGraphResolvedPlace

- (PGGraphResolvedPlace)initWithPlaceOfInterestType:(id)a3 confidence:(double)a4
{
  id v7;
  PGGraphResolvedPlace *v8;
  PGGraphResolvedPlace *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphResolvedPlace;
  v8 = -[PGGraphResolvedPlace init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_placeInterestType, a3);
    v9->_confidence = a4;
  }

  return v9;
}

- (NSString)placeInterestType
{
  return self->_placeInterestType;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInterestType, 0);
}

@end
