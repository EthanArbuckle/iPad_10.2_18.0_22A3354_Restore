@implementation MapsRoutePrintingInfo

- (MapsRoutePrintingInfo)initWithNumberOfPages:(int64_t)a3 routeStepCells:(id)a4 routeStepCalloutCells:(id)a5
{
  id v8;
  id v9;
  MapsRoutePrintingInfo *v10;
  NSArray *v11;
  NSArray *routeStepCells;
  NSArray *v13;
  NSArray *routeStepCalloutCells;
  MapsRoutePrintingInfo *v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MapsRoutePrintingInfo;
  v10 = -[MapsPrintingInfo initWithNumberOfPages:](&v17, "initWithNumberOfPages:", a3);
  if (v10)
  {
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    routeStepCells = v10->_routeStepCells;
    v10->_routeStepCells = v11;

    v13 = (NSArray *)objc_msgSend(v9, "copy");
    routeStepCalloutCells = v10->_routeStepCalloutCells;
    v10->_routeStepCalloutCells = v13;

    v15 = v10;
  }

  return v10;
}

- (NSArray)routeStepCells
{
  return self->_routeStepCells;
}

- (NSArray)routeStepCalloutCells
{
  return self->_routeStepCalloutCells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeStepCalloutCells, 0);
  objc_storeStrong((id *)&self->_routeStepCells, 0);
}

@end
