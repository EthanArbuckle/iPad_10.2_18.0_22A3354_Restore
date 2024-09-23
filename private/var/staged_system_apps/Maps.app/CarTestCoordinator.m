@implementation CarTestCoordinator

- (MKMapView)mapViewForPPTTest
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return (MKMapView *)v4;
}

- (void)setChromeHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarTestCoordinator forcedAutohideToken](self, "forcedAutohideToken"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "acquireForcedAutohideBehaviourTokenWithBehaviour:", 1));
      -[CarTestCoordinator setForcedAutohideToken:](self, "setForcedAutohideToken:", v6);

    }
  }
  else
  {
    -[CarTestCoordinator setForcedAutohideToken:](self, "setForcedAutohideToken:", 0);
  }
}

- (BOOL)pptTestCanResizePlacecard
{
  return 0;
}

- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topContext"));

  v5 = objc_opt_class(CarSearchCategoriesModeController);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    objc_msgSend(v6, "_ppt_selectFirstCarplayBrowseCategory");

}

- (void)pptTestAutocompleteSearchForFieldItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topContext"));

  v6 = objc_opt_class(CarKeyboardModeController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchString"));
    objc_msgSend(v7, "pptHandleTextChange:", v8);

  }
}

- (void)pptTestSearchEndEditing
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  v4 = objc_opt_class(CarKeyboardModeController);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_msgSend(v5, "pptEndEditing");

}

- (void)pptTestSearchForFieldItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topContext"));

  v6 = objc_opt_class(CarKeyboardModeController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchString"));
    objc_msgSend(v7, "pptInvokeSearch:", v8);

  }
}

- (void)pptSelectKeyboardInteractionModel
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  v4 = objc_opt_class(CarSearchCategoriesModeController);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_msgSend(v5, "_ppt_selectKeyboardMode");

}

- (void)pptTestEnterSearchMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v2, "displayMapBrowsing");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v3, "displaySearchCategories");

}

- (UIViewController)pptTestContaineeForDirectionsDetails
{
  return 0;
}

- (UIScrollView)pptTestScrollViewForDirectionsDetails
{
  return 0;
}

- (void)pptTestStartNavigation
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  v4 = objc_opt_class(CarRoutePlanningModeController);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_msgSend(v5, "pptTestStartNavigation");

}

- (void)pptTestEndNavigation
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  v4 = objc_opt_class(CarNavigationModeController);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_msgSend(v5, "endNavigation");

}

- (BOOL)pptTestSupportStepping
{
  return 0;
}

- (int64_t)pptTestCurrentStepIndex
{
  return 0;
}

- (BOOL)pptTestHasNextStep
{
  return 0;
}

- (BOOL)pptTestMoveToBoardStep
{
  return 0;
}

- (UIScrollView)pptTestScrollViewForProactive
{
  return 0;
}

- (void)pptTestOpenRecents
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v2, "displayDestinations");

}

- (BOOL)pptTestCanUpdateTrayLayout
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  v5 = objc_opt_class(CarNavigationModeController);
  LOBYTE(v2) = objc_opt_isKindOfClass(v4, v5);

  return v2 & 1;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topContext"));

  v8 = objc_opt_class(CarNavigationModeController);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    objc_msgSend(v9, "setTrayExpanded:animated:", a3 != 0, v4);

}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return 1;
}

- (UIScrollView)pptTestScrollView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  if ((objc_opt_respondsToSelector(v4, "pptTestScrollView") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pptTestScrollView"));
  else
    v5 = 0;

  return (UIScrollView *)v5;
}

- (id)_pptChromeTrayCoordinatorForCurrentMode
{
  return 0;
}

- (id)forcedAutohideToken
{
  return self->_forcedAutohideToken;
}

- (void)setForcedAutohideToken:(id)a3
{
  objc_storeStrong(&self->_forcedAutohideToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forcedAutohideToken, 0);
}

@end
