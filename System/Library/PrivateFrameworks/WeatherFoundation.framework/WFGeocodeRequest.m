@implementation WFGeocodeRequest

- (WFGeocodeRequest)initWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v7;
  WFGeocodeRequest *v8;
  WFGeocodeRequest *v9;
  uint64_t v10;
  id resultHandler;
  WFGeocodeRequest *v12;
  objc_super v14;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFGeocodeRequest;
  v8 = -[WFTask initWithResponseRequired:](&v14, sel_initWithResponseRequired_, 1);
  v9 = v8;
  if (v8)
  {
    v8->_coordinate.latitude = latitude;
    v8->_coordinate.longitude = longitude;
    v10 = objc_msgSend(v7, "copy");
    resultHandler = v9->_resultHandler;
    v9->_resultHandler = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (WFGeocodeRequest)initWithSearchString:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  WFGeocodeRequest *v8;
  uint64_t v9;
  NSString *searchString;
  uint64_t v11;
  id resultHandler;
  WFGeocodeRequest *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFGeocodeRequest;
  v8 = -[WFTask initWithResponseRequired:](&v15, sel_initWithResponseRequired_, 1);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    searchString = v8->_searchString;
    v8->_searchString = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    resultHandler = v8->_resultHandler;
    v8->_resultHandler = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (WFGeocodeRequest)initWithSearchCompletion:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  WFGeocodeRequest *v9;
  WFGeocodeRequest *v10;
  uint64_t v11;
  id resultHandler;
  WFGeocodeRequest *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFGeocodeRequest;
  v9 = -[WFTask initWithResponseRequired:](&v15, sel_initWithResponseRequired_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_autocompleteSearchResult, a3);
    v11 = objc_msgSend(v8, "copy");
    resultHandler = v10->_resultHandler;
    v10->_resultHandler = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CLLocationCoordinate2D v15;

  -[WFGeocodeRequest autocompleteSearchResult](self, "autocompleteSearchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFGeocodeRequest autocompleteSearchResult](self, "autocompleteSearchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calloutTitle");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFGeocodeRequest searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFGeocodeRequest searchString](self, "searchString");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFGeocodeRequest coordinate](self, "coordinate");
      if (!CLLocationCoordinate2DIsValid(v15))
      {
        v5 = CFSTR("<none>");
        goto LABEL_9;
      }
      -[WFGeocodeRequest coordinate](self, "coordinate");
      NSStringFromCLLocationCoordinate2D(v8, v9);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (__CFString *)v7;
  }
LABEL_9:
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_opt_class();
  -[WFTask identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p, input = %@, identifier = %@>"), v11, self, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)startWithService:(id)a3
{
  void *v4;
  WFGeocodeResponse *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WFGeocodeResponse *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CLLocationCoordinate2D v17;

  v16 = a3;
  -[WFGeocodeRequest autocompleteSearchResult](self, "autocompleteSearchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFGeocodeRequest autocompleteSearchResult](self, "autocompleteSearchResult");
    v5 = (WFGeocodeResponse *)objc_claimAutoreleasedReturnValue();
    -[WFTask identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationForSearchCompletion:taskIdentifier:", v5, v6);
LABEL_5:

    goto LABEL_6;
  }
  -[WFGeocodeRequest searchString](self, "searchString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFGeocodeRequest searchString](self, "searchString");
    v5 = (WFGeocodeResponse *)objc_claimAutoreleasedReturnValue();
    -[WFTask identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationForString:taskIdentifier:", v5, v6);
    goto LABEL_5;
  }
  -[WFGeocodeRequest coordinate](self, "coordinate");
  if (CLLocationCoordinate2DIsValid(v17))
  {
    -[WFGeocodeRequest coordinate](self, "coordinate");
    v9 = v8;
    v11 = v10;
    -[WFTask identifier](self, "identifier");
    v5 = (WFGeocodeResponse *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationForCoordinate:taskIdentifier:", v5, v9, v11);
  }
  else
  {
    v12 = [WFGeocodeResponse alloc];
    -[WFTask identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFResponse initWithIdentifier:](v12, "initWithIdentifier:", v14);

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFResponse setError:](v5, "setError:", v15);

    -[WFGeocodeRequest handleResponse:](self, "handleResponse:", v5);
  }
LABEL_6:

}

- (void)handleResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGeocodeRequest setGeocodedResult:](self, "setGeocodedResult:", v6);

    -[WFGeocodeRequest resultHandler](self, "resultHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFGeocodeRequest resultHandler](self, "resultHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[WFGeocodeRequest geocodedResult](self, "geocodedResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v8)[2](v8, v9, v10);

    }
    v11.receiver = self;
    v11.super_class = (Class)WFGeocodeRequest;
    -[WFTask handleResponse:](&v11, sel_handleResponse_, v5);

  }
  else
  {
    -[WFGeocodeRequest handleCancellation](self, "handleCancellation");
  }

}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[WFGeocodeRequest resultHandler](self, "resultHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFGeocodeRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)handleCancellation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id resultHandler;
  objc_super v7;

  -[WFGeocodeRequest resultHandler](self, "resultHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFGeocodeRequest resultHandler](self, "resultHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
  resultHandler = self->_resultHandler;
  self->_resultHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFGeocodeRequest;
  -[WFTask handleCancellation](&v7, sel_handleCancellation);
}

- (void)cleanup
{
  id resultHandler;
  objc_super v4;

  resultHandler = self->_resultHandler;
  self->_resultHandler = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFGeocodeRequest;
  -[WFTask cleanup](&v4, sel_cleanup);
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  _QWORD v4[2];
  CLLocationCoordinate2D result;

  objc_copyStruct(v4, &self->_coordinate, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v3;

  v3 = a3;
  objc_copyStruct(&self->_coordinate, &v3, 16, 1, 0);
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MKLocalSearchCompletion)autocompleteSearchResult
{
  return (MKLocalSearchCompletion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAutocompleteSearchResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (WFLocation)geocodedResult
{
  return (WFLocation *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGeocodedResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocodedResult, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResult, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
