@implementation RAPReportMenuProvider

- (RAPReportMenuProvider)init
{
  RAPReportMenuProvider *v2;
  ReportLinkFactory *v3;
  ReportLinkFactory *linkFactory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPReportMenuProvider;
  v2 = -[RAPReportMenuProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(ReportLinkFactory);
    linkFactory = v2->_linkFactory;
    v2->_linkFactory = v3;

  }
  return v2;
}

- (void)_populateMenuSection
{
  NSMutableArray *v3;
  NSMutableArray *menuSections;
  void *v5;
  unsigned int v6;
  void *v7;
  _QWORD v8[5];

  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_101273908));
  menuSections = self->_menuSections;
  self->_menuSections = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v6 = objc_msgSend(v5, "supportsNavigation");

  if (v6)
  {
    -[NSMutableArray addObject:](self->_menuSections, "addObject:", &off_10126DF60);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100606860;
    v8[3] = &unk_1011B7B30;
    v8[4] = self;
    objc_msgSend(v7, "fetchTrafficIncidentsLayout:", v8);

  }
}

- (id)getReportMenuFromEntryPoint:(int)a3 sceneDelegate:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  int v21;
  id location;

  v16 = a4;
  if (!self->_menuSections)
    -[RAPReportMenuProvider _populateMenuSection](self, "_populateMenuSection", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v16));
  if (-[NSMutableArray count](self->_menuSections, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_menuSections, "objectAtIndexedSubscript:", v7));
      v9 = objc_msgSend(v8, "integerValue");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReportLinkFactory createModelForType:](self->_linkFactory, "createModelForType:", v9));
      objc_initWeak(&location, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "icon"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100606AB8;
      v18[3] = &unk_1011BDF48;
      objc_copyWeak(v20, &location);
      v20[1] = v9;
      v21 = a3;
      v19 = v17;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v18));

      objc_msgSend(v6, "addObject:", v13);
      objc_destroyWeak(v20);
      objc_destroyWeak(&location);

      ++v7;
    }
    while (v7 < (unint64_t)-[NSMutableArray count](self->_menuSections, "count"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 16, v6));

  return v14;
}

- (void)_handleMenuAction:(int64_t)a3 entryPoint:(int)a4 sceneDelegate:(id)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int BOOL;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = *(_QWORD *)&a4;
  v17 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rapPresenter"));
  v9 = v8;
  v10 = 229;
  v11 = 12;
  switch(a3)
  {
    case 0:
      v12 = -[RAPReportMenuProvider _mapIsSprMap:](self, "_mapIsSprMap:", v17);
      BOOL = GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]);
      if (v12)
      {
        v14 = 4;
        v15 = 6;
      }
      else
      {
        v14 = 3;
        v15 = 5;
      }
      if (BOOL)
        v11 = v15;
      else
        v11 = v14;
      v10 = 222;
      goto LABEL_15;
    case 1:
      objc_msgSend(v8, "presentIncidentsReportOptions", 12);
      v10 = 2152;
      goto LABEL_16;
    case 2:
      if (-[RAPReportMenuProvider _mapIsSprMap:](self, "_mapIsSprMap:", v17))
        v11 = 22;
      else
        v11 = 21;
      v10 = 224;
      goto LABEL_15;
    case 3:
LABEL_15:
      objc_msgSend(v9, "presentRAPWebBundleQuestionType:mapItem:fromEntryPoint:withCompletion:", v11, 0, v5, &stru_1011BDF88);
      goto LABEL_16;
    case 4:
      objc_msgSend(v8, "presentRouteListReportFromEntryPoint:", v5);
      v10 = 10117;
LABEL_16:
      if ((_DWORD)v5 == 29)
        v16 = 39;
      else
        v16 = v5;
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v10, v16, 0);
      break;
    default:
      break;
  }

}

- (BOOL)_mapIsSprMap:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  v5 = objc_msgSend(v4, "_isShowingCuratedElevatedGround");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuSections, 0);
  objc_storeStrong((id *)&self->_linkFactory, 0);
}

@end
