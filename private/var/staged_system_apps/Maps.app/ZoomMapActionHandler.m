@implementation ZoomMapActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  v6 = objc_opt_class(ZoomMapAction);
  if ((objc_opt_isKindOfClass(v15, v6) & 1) != 0)
  {
    objc_msgSend(v15, "zoomFactor");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v10 = objc_msgSend(v9, "isAnyCarSceneHostingNavigation");

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chrome"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapView"));
      objc_msgSend(v12, "_zoomWithAmount:", v8);

    }
    if (v8 > 0.0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
      objc_msgSend(v14, "zoomIn");
LABEL_8:

      goto LABEL_9;
    }
    if (v8 < 0.0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
      objc_msgSend(v14, "zoomOut");
      goto LABEL_8;
    }
  }
LABEL_9:

}

@end
