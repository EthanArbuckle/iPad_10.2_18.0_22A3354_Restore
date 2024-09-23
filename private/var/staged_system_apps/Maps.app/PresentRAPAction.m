@implementation PresentRAPAction

- (PresentRAPAction)initWithMapItem:(id)a3
{
  id v5;
  PresentRAPAction *v6;
  PresentRAPAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = -[PresentRAPAction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (PresentRAPAction)initWithResponse:(id)a3
{
  id v5;
  PresentRAPAction *v6;
  PresentRAPAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = -[PresentRAPAction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_response, a3);

  return v7;
}

- (PresentRAPAction)initWithRapInfo:(id)a3
{
  id v5;
  PresentRAPAction *v6;
  PresentRAPAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = -[PresentRAPAction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rapInfo, a3);

  return v7;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 20;
}

- (GEORPProblemStatusResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (GEORPRapInfo)rapInfo
{
  return self->_rapInfo;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_rapInfo, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
