@implementation UIWindowScene

- (int64_t)carSceneType
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  UIWindowScene *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindowScene delegate](self, "delegate"));
  v4 = objc_opt_class(CarSceneDelegate);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindowScene delegate](self, "delegate"));
    v6 = objc_opt_class(MapsSceneDelegate);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
      return 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindowScene delegate](self, "delegate"));
  v9 = objc_opt_class(CarSceneDelegate);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = objc_msgSend(v11, "sceneType");
  }
  else
  {
    v13 = sub_1004317AC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "carSceneType: failed to get scene delegate for scene: %@", (uint8_t *)&v16, 0xCu);
    }

    v12 = 0;
  }

  return (int64_t)v12;
}

- (int64_t)_maps_lightLevelPriority
{
  int64_t v2;

  v2 = -[UIWindowScene carSceneType](self, "carSceneType");
  if ((unint64_t)(v2 - 1) > 6)
    return 0;
  else
    return qword_100E34900[v2 - 1];
}

- (int64_t)_maps_interfaceStyle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindowScene windows](self, "windows"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "_car_userInterfaceStyle");

  return (int64_t)v5;
}

@end
