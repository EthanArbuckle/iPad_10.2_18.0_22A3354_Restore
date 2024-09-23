@implementation ShowPublisherActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = objc_opt_class(ShowPublisherAction);
  if ((objc_opt_isKindOfClass(v13, v6) & 1) != 0)
  {
    v7 = v13;
    v8 = objc_alloc((Class)MKMapItemIdentifier);
    v9 = objc_msgSend(v7, "publisherMUID");
    v10 = objc_msgSend(v7, "resultProviderID");

    v11 = objc_msgSend(v8, "initWithMUID:resultProviderID:coordinate:", v9, v10, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    objc_msgSend(v12, "openPublisherWithIdentifier:", v11);

  }
}

@end
