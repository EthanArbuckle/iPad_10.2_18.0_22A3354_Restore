@implementation LPRFlowController

- (void)presentLPRFlowWithVehicle:(id)a3 scenario:(int64_t)a4 presenter:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  __objc2_class **v11;
  id v12;
  NSObject *v13;
  OBNavigationController *v14;
  OBNavigationController *navigationController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  int64_t v22;

  v9 = a3;
  v10 = a5;
  -[LPRFlowController setScenario:](self, "setScenario:", a4);
  if (!-[LPRFlowController scenario](self, "scenario"))
  {
    v12 = 0;
    v11 = off_101196DD0;
    goto LABEL_5;
  }
  if ((id)-[LPRFlowController scenario](self, "scenario") == (id)1)
  {
    v11 = &off_101196DD8;
    v12 = v9;
LABEL_5:
    v13 = objc_msgSend(objc_alloc(*v11), "initWithScenario:vehicle:delegate:", a4, v12, self);
    v14 = (OBNavigationController *)objc_msgSend(objc_alloc((Class)OBNavigationController), "initWithRootViewController:", v13);
    navigationController = self->_navigationController;
    self->_navigationController = v14;

    -[OBNavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OBNavigationController navigationItem](self->_navigationController, "navigationItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rightBarButtonItem"));
    objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("RightBarButtonItem"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OBNavigationController navigationItem](self->_navigationController, "navigationItem"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leftBarButtonItem"));
    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("LeftBarButtonItem"));

    objc_msgSend(v10, "_maps_topMostPresentViewController:animated:completion:", self->_navigationController, 1, 0);
    goto LABEL_6;
  }
  v20 = sub_1004326FC();
  v13 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v21 = 134217984;
    v22 = -[LPRFlowController scenario](self, "scenario");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid scenario: %ld aborting presentation of LPR", (uint8_t *)&v21, 0xCu);
  }
LABEL_6:

}

- (void)didFinishConfiguringLPRForVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  OBNavigationController *navigationController;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;

  v4 = a3;
  v5 = sub_1004326FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v10 = 138412546;
    v11 = v7;
    v12 = 2048;
    v13 = -[LPRFlowController scenario](self, "scenario");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didCancelConfiguringLPRForVehicle: %@ in scenario: %lu", (uint8_t *)&v10, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OBNavigationController presentingViewController](self->_navigationController, "presentingViewController"));
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  navigationController = self->_navigationController;
  self->_navigationController = 0;

}

- (void)didCancelConfiguringLPRForVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  OBNavigationController *navigationController;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;

  v4 = a3;
  v5 = sub_1004326FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v10 = 138412546;
    v11 = v7;
    v12 = 2048;
    v13 = -[LPRFlowController scenario](self, "scenario");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didCancelConfiguringLPRForVehicle: %@ in scenario: %lu", (uint8_t *)&v10, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OBNavigationController presentingViewController](self->_navigationController, "presentingViewController"));
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  navigationController = self->_navigationController;
  self->_navigationController = 0;

}

- (int64_t)scenario
{
  return self->_scenario;
}

- (void)setScenario:(int64_t)a3
{
  self->_scenario = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
