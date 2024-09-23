@implementation RAPReportLocationSection

- (RAPReportLocationSection)initWithQuestion:(id)a3
{
  id v5;
  RAPReportLocationSection *v6;
  RAPReportLocationSection *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  GEOComposedRoute *route;
  RAPInstructionDetailRouteCellProvider *v22;
  RAPInstructionDetailRouteCellProvider *provider;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RAPReportLocationSection;
  v6 = -[RAPTablePartSection init](&v25, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_question, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](v7->_question, "parentQuestion"));
    v9 = objc_opt_class(RAPDirectionInstructionsIncorrectQuestion);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentQuestion"));
      v13 = objc_opt_class(RAPDirectionsCategoryQuestion);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        v14 = v12;
      else
        v14 = 0;
      v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parentQuestion"));
      v17 = objc_opt_class(RAPDirectionsWhichOneQuestion);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        v18 = v16;
      else
        v18 = 0;
      v19 = v18;

      if (v19)
      {
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routeFromRecording"));
        route = v7->_route;
        v7->_route = (GEOComposedRoute *)v20;

        v22 = -[RAPInstructionDetailRouteCellProvider initWithRoute:]([RAPInstructionDetailRouteCellProvider alloc], "initWithRoute:", v7->_route);
        provider = v7->_provider;
        v7->_provider = v22;

      }
    }

  }
  return v7;
}

- (int64_t)rowsCount
{
  return 2;
}

- (void)registerReuseIdentifiersForCells
{
  RAPInstructionDetailRouteCellProvider *provider;
  id v3;

  provider = self->_provider;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  -[RAPInstructionDetailRouteCellProvider registerCellsForTableView:](provider, "registerCellsForTableView:", v3);

}

- (BOOL)shouldHighlightCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  return 0;
}

- (NSData)imageDataOfMapAndInstructionsCell
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGContext *CurrentContext;
  void *v9;
  CGFloat v10;
  void *v11;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v13;
  NSData *v14;
  void *v15;
  CGSize v17;

  -[RAPRouteStepMapViewCell bounds](self->_mapViewCell, "bounds");
  v4 = v3;
  -[RAPRouteStepMapViewCell bounds](self->_mapViewCell, "bounds");
  v6 = v5;
  -[UITableViewCell bounds](self->_instructionCell, "bounds");
  v17.height = v6 + v7;
  v17.width = v4;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell layer](self->_mapViewCell, "layer"));
  objc_msgSend(v9, "renderInContext:", CurrentContext);

  -[RAPRouteStepMapViewCell bounds](self->_mapViewCell, "bounds");
  CGContextTranslateCTM(CurrentContext, 0.0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell layer](self->_instructionCell, "layer"));
  objc_msgSend(v11, "renderInContext:", CurrentContext);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v13 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v14 = UIImagePNGRepresentation(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return (NSData *)v15;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v4;
  RAPRouteStepMapViewCell *v5;
  void **p_instructionCell;
  RAPRouteStepMapViewCell *mapViewCell;
  RAPRouteStepMapViewCell *v8;
  RAPRouteStepMapViewCell *v9;
  GEOComposedRoute *route;
  void *v11;
  RAPRouteStepMapViewCell *v12;
  void *v13;
  void *v14;
  RAPInstructionDetailRouteCellProvider *provider;
  void *v16;
  RAPInstructionCorrectionQuestion *question;
  void *v18;
  UITableViewCell *v19;
  UITableViewCell *instructionCell;
  RAPRouteStepMapViewCell *v21;
  void *v22;
  UITableViewCell *v23;
  UITableViewCell *v24;
  CGRect v26;

  if (a3 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionCorrectionQuestion listItem](self->_question, "listItem"));

    provider = self->_provider;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    question = self->_question;
    if (v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionCorrectionQuestion listItem](question, "listItem"));
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPInstructionDetailRouteCellProvider transitDirectionsCellForTableView:item:](provider, "transitDirectionsCellForTableView:item:", v16, v18));
      instructionCell = self->_instructionCell;
      self->_instructionCell = v19;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
      objc_msgSend(v16, "bounds");
      -[UITableViewCell setSeparatorInset:](self->_instructionCell, "setSeparatorInset:", 0.0, 0.0, 0.0, CGRectGetWidth(v26));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionCorrectionQuestion composedRouteStep](question, "composedRouteStep"));
      v23 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPInstructionDetailRouteCellProvider directionStepCellForTableView:step:](provider, "directionStepCellForTableView:step:", v16, v22));
      v24 = self->_instructionCell;
      self->_instructionCell = v23;

    }
    p_instructionCell = (void **)&self->_instructionCell;
    goto LABEL_10;
  }
  if (!a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v5 = (RAPRouteStepMapViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("RAPRouteStepMapViewCell")));
    p_instructionCell = (void **)&self->_mapViewCell;
    mapViewCell = self->_mapViewCell;
    self->_mapViewCell = v5;

    v8 = self->_mapViewCell;
    if (v8)
    {
LABEL_11:
      v21 = v8;
      return v21;
    }
    v9 = [RAPRouteStepMapViewCell alloc];
    route = self->_route;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionCorrectionQuestion composedRouteStep](self->_question, "composedRouteStep"));
    v12 = -[RAPRouteStepMapViewCell initWithIdentifier:route:routeStep:](v9, "initWithIdentifier:route:routeStep:", CFSTR("RAPRouteStepMapViewCell"), route, v11);
    v13 = *p_instructionCell;
    *p_instructionCell = v12;

LABEL_10:
    v8 = (RAPRouteStepMapViewCell *)*p_instructionCell;
    goto LABEL_11;
  }
  v21 = 0;
  return v21;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Information [RAP]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionCell, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_mapViewCell, 0);
}

@end
