@implementation ATXPOICategoryGroupingResult

- (ATXPOICategoryGroupingResult)initWithEvents:(id)a3 finalPOIWithoutExit:(id)a4
{
  id v7;
  id v8;
  ATXPOICategoryGroupingResult *v9;
  ATXPOICategoryGroupingResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXPOICategoryGroupingResult;
  v9 = -[ATXPOICategoryGroupingResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_events, a3);
    objc_storeStrong((id *)&v10->_finalPOIWithoutExit, a4);
  }

  return v10;
}

- (NSArray)events
{
  return self->_events;
}

- (ATXPOICategoryVisitEvent)finalPOIWithoutExit
{
  return self->_finalPOIWithoutExit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPOIWithoutExit, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
