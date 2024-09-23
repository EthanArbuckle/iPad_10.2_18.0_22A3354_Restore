@implementation VectorKitDebugRenderController

+ (id)navigationDestinationTitle
{
  return CFSTR("Disable Render Features");
}

- (void)viewDidLoad
{
  uint64_t v3;
  NSMutableArray *v4;
  NSMutableArray *debugFeatureSwitches;
  NSMutableArray *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VectorKitDebugRenderController;
  -[MapsDebugValuesViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = 8;
  v4 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 8);
  debugFeatureSwitches = self->_debugFeatureSwitches;
  self->_debugFeatureSwitches = v4;

  do
  {
    v6 = self->_debugFeatureSwitches;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableArray addObject:](v6, "addObject:", v7);

    --v3;
  }
  while (v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return CFSTR("Disable Features");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 8 * (a4 == 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  VKDebugRenderSwitch *v13;
  void *v14;
  unsigned int v15;
  VKDebugRenderSwitch *v16;
  __CFString *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VectorKitDebugRenderController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allVisibleMapViewsForDebugController:", self));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapLayer"));

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("Cell")));
  if (!v12)
    v12 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
  objc_msgSend(v12, "setAccessoryView:", 0);
  if (!objc_msgSend(v6, "section")
    && (uint64_t)objc_msgSend(v6, "row") <= 7
    && ((unint64_t)objc_msgSend(v6, "row") & 0x8000000000000000) == 0)
  {
    v13 = (VKDebugRenderSwitch *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_debugFeatureSwitches, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v15 = -[VKDebugRenderSwitch isEqual:](v13, "isEqual:", v14);

    if (v15)
    {
      v16 = objc_alloc_init(VKDebugRenderSwitch);

      -[VKDebugRenderSwitch setSwitchIndex:](v16, "setSwitchIndex:", objc_msgSend(v6, "row"));
      -[VKDebugRenderSwitch addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", self, "featureDisableSwitchChanged:", 4096);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_debugFeatureSwitches, "setObject:atIndexedSubscript:", v16, objc_msgSend(v6, "row"));
      v13 = v16;
    }
    objc_msgSend(v12, "setAccessoryView:", v13);
    v17 = off_1011DB018[(_QWORD)objc_msgSend(v6, "row")];
    switch((unint64_t)objc_msgSend(v6, "row"))
    {
      case 0uLL:
        v18 = objc_msgSend(v11, "rastersDisabled");
        goto LABEL_19;
      case 1uLL:
        v18 = objc_msgSend(v11, "polygonsDisabled");
        goto LABEL_19;
      case 2uLL:
        v18 = objc_msgSend(v11, "roadsDisabled");
        goto LABEL_19;
      case 3uLL:
        v18 = objc_msgSend(v11, "transitLinesDisabled");
        goto LABEL_19;
      case 4uLL:
        v18 = objc_msgSend(v11, "labelsDisabled");
        goto LABEL_19;
      case 5uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
        v21 = objc_msgSend(v20, "disableBuildingFootprints");
        goto LABEL_17;
      case 6uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
        v21 = objc_msgSend(v20, "disableRoute");
LABEL_17:
        v19 = v21;

        break;
      case 7uLL:
        v18 = objc_msgSend(v11, "gridDisabled");
LABEL_19:
        v19 = v18;
        break;
      default:
        v19 = 0;
        break;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
    objc_msgSend(v22, "setText:", v17);

    -[VKDebugRenderSwitch setOn:](v13, "setOn:", v19);
  }

  return v12;
}

- (void)featureDisableSwitchChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VectorKitDebugRenderController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allVisibleMapViewsForDebugController:", self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));

  switch((unint64_t)objc_msgSend(v11, "switchIndex"))
  {
    case 0uLL:
      objc_msgSend(v7, "setDisableRasters:", objc_msgSend(v11, "isOn"));
      break;
    case 1uLL:
      objc_msgSend(v7, "setDisablePolygons:", objc_msgSend(v11, "isOn"));
      break;
    case 2uLL:
      objc_msgSend(v7, "setDisableRoads:", objc_msgSend(v11, "isOn"));
      break;
    case 3uLL:
      objc_msgSend(v7, "setDisableTransitLines:", objc_msgSend(v11, "isOn"));
      break;
    case 4uLL:
      objc_msgSend(v7, "setDisableLabels:", objc_msgSend(v11, "isOn"));
      break;
    case 5uLL:
      objc_msgSend(v7, "setDisableBuildingFootprints:", objc_msgSend(v11, "isOn"));
      v8 = objc_msgSend(v11, "isOn");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
      objc_msgSend(v9, "setDisableBuildingFootprints:", v8);
      goto LABEL_9;
    case 6uLL:
      v10 = objc_msgSend(v11, "isOn");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
      objc_msgSend(v9, "setDisableRoute:", v10);
LABEL_9:

      break;
    case 7uLL:
      objc_msgSend(v7, "setDisableGrid:", objc_msgSend(v11, "isOn"));
      break;
    default:
      break;
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugFeatureSwitches, 0);
}

@end
