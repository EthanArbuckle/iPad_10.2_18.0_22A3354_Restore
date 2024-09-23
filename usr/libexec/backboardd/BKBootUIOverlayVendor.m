@implementation BKBootUIOverlayVendor

- (BKBootUIOverlayVendor)initWithFirstBootDetector:(id)a3
{
  id v5;
  BKBootUIOverlayVendor *v6;
  BKBootUIOverlayVendor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKBootUIOverlayVendor;
  v6 = -[BKBootUIOverlayVendor init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_firstBootDetector, a3);

  return v7;
}

- (id)currentOverlayWithLevel:(float)a3
{
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  int v16;
  void *v17;

  v4 = -[BKFirstBootDetector isFirstBoot](self->_firstBootDetector, "isFirstBoot");
  v5 = sub_1000597D0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current bootUI is an Apple Logo", (uint8_t *)&v16, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    *(float *)&v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayRenderOverlayAppleLogo overlayWithLevel:display:](BKDisplayRenderOverlayAppleLogo, "overlayWithLevel:display:", v9, v10));

  }
  else
  {
    if (v7)
    {
      *(float *)&v8 = a3;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      v16 = 138412290;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current bootUI is the spinny, level %@", (uint8_t *)&v16, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    *(float *)&v14 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayRenderOverlaySpinny overlayWithLevel:display:](BKDisplayRenderOverlaySpinny, "overlayWithLevel:display:", v13, v14));

    objc_msgSend(v11, "setBackground:", 1);
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstBootDetector, 0);
}

+ (id)sharedInstance
{
  if (qword_1001175E8 != -1)
    dispatch_once(&qword_1001175E8, &stru_1000ECCA8);
  return (id)qword_1001175E0;
}

@end
