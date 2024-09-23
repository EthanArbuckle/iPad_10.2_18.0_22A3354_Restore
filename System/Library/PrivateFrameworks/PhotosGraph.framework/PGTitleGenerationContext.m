@implementation PGTitleGenerationContext

- (PGTitleGenerationContext)initWithGraph:(id)a3 serviceManager:(id)a4
{
  id v7;
  id v8;
  PGTitleGenerationContext *v9;
  PGTitleGenerationContext *v10;
  PGGraphLocationHelper *v11;
  PGGraphLocationHelper *locationHelper;
  id v13;
  void *v14;
  uint64_t v15;
  CLSHolidayCalendarEventService *holidayService;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGTitleGenerationContext;
  v9 = -[PGTitleGenerationContext init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    v11 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v7);
    locationHelper = v10->_locationHelper;
    v10->_locationHelper = v11;

    v13 = objc_alloc(MEMORY[0x1E0D4B180]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithLocale:", v14);
    holidayService = v10->_holidayService;
    v10->_holidayService = (CLSHolidayCalendarEventService *)v15;

    objc_storeStrong((id *)&v10->_serviceManager, a4);
  }

  return v10;
}

- (id)initForTestingWithGraph:(id)a3
{
  id v5;
  PGTitleGenerationContext *v6;
  PGTitleGenerationContext *v7;
  PGGraphLocationHelper *v8;
  PGGraphLocationHelper *locationHelper;
  id v10;
  void *v11;
  uint64_t v12;
  CLSHolidayCalendarEventService *holidayService;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGTitleGenerationContext;
  v6 = -[PGTitleGenerationContext init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v8 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v5);
    locationHelper = v7->_locationHelper;
    v7->_locationHelper = v8;

    v10 = objc_alloc(MEMORY[0x1E0D4B180]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithLocale:", v11);
    holidayService = v7->_holidayService;
    v7->_holidayService = (CLSHolidayCalendarEventService *)v12;

  }
  return v7;
}

- (id)initLegacyForMemoriesWithServiceManager:(id)a3
{
  id v5;
  PGTitleGenerationContext *v6;
  uint64_t v7;
  PGGraphLocationHelper *locationHelper;
  id v9;
  void *v10;
  uint64_t v11;
  CLSHolidayCalendarEventService *holidayService;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGTitleGenerationContext;
  v6 = -[PGTitleGenerationContext init](&v14, sel_init);
  if (v6)
  {
    +[PGGraphLocationHelper inefficientLocationHelper](PGGraphLocationHelper, "inefficientLocationHelper");
    v7 = objc_claimAutoreleasedReturnValue();
    locationHelper = v6->_locationHelper;
    v6->_locationHelper = (PGGraphLocationHelper *)v7;

    v9 = objc_alloc(MEMORY[0x1E0D4B180]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithLocale:", v10);
    holidayService = v6->_holidayService;
    v6->_holidayService = (CLSHolidayCalendarEventService *)v11;

    if (!v5)
      __assert_rtn("-[PGTitleGenerationContext initLegacyForMemoriesWithServiceManager:]", "PGTitleGenerationContext.m", 57, "serviceManager != nil");
    objc_storeStrong((id *)&v6->_serviceManager, a3);
  }

  return v6;
}

- (PGGraphPublicEventCategoryNodeCollection)appleEventsCategoryNodes
{
  PGTitleGenerationContext *v2;
  void *v3;
  uint64_t v4;
  PGGraphPublicEventCategoryNodeCollection *appleEventsCategoryNodes;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_appleEventsCategoryNodes)
  {
    objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPublicEventCategoryNodeCollection publicEventCategoryNodesForCategory:inGraph:](PGGraphPublicEventCategoryNodeCollection, "publicEventCategoryNodesForCategory:inGraph:", v3, v2->_graph);
    v4 = objc_claimAutoreleasedReturnValue();
    appleEventsCategoryNodes = v2->_appleEventsCategoryNodes;
    v2->_appleEventsCategoryNodes = (PGGraphPublicEventCategoryNodeCollection *)v4;

  }
  objc_sync_exit(v2);

  return v2->_appleEventsCategoryNodes;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (PGGraphLocationHelper)locationHelper
{
  return (PGGraphLocationHelper *)objc_getProperty(self, a2, 16, 1);
}

- (CLSHolidayCalendarEventService)holidayService
{
  return (CLSHolidayCalendarEventService *)objc_getProperty(self, a2, 24, 1);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_appleEventsCategoryNodes, 0);
  objc_storeStrong((id *)&self->_holidayService, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
