@implementation RAPReportComposerDirectionsViewControllerProvider

- (id)rapViewControllerWithReport:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RAPDirectionsWhichOneQuestion *v14;
  RAPReportComposerDirectionsViewController *v15;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsHistory"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_context"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directionsHistory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v17 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

    v14 = -[RAPDirectionsWhichOneQuestion initWithReport:parentQuestion:selectableDirectionRequests:]([RAPDirectionsWhichOneQuestion alloc], "initWithReport:parentQuestion:selectableDirectionRequests:", v5, 0, v13);
    objc_msgSend(v5, "setInitialQuestion:", v14);
    v15 = -[RAPReportComposerDirectionsViewController initWithReport:question:completion:]([RAPReportComposerDirectionsViewController alloc], "initWithReport:question:completion:", v5, v14, v6);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
