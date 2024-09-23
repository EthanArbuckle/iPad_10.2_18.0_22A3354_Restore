@implementation RTLocationOfInterestVisit(RTExtensions)

- (uint64_t)initWithLearnedVisit:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeConfidence");
  v11 = v10;
  v12 = objc_msgSend(v4, "placeSource");

  v13 = objc_msgSend(a1, "initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:", v5, v6, v7, v9, v12, v11);
  return v13;
}

@end
