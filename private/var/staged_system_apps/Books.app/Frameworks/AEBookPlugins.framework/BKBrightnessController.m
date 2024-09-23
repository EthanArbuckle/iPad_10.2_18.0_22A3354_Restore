@implementation BKBrightnessController

- (void)dealloc
{
  objc_super v3;

  -[BKBrightnessController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKBrightnessController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIScreenBrightnessDidChangeNotification, v4);

  v5.receiver = self;
  v5.super_class = (Class)BKBrightnessController;
  -[BKViewController releaseViews](&v5, "releaseViews");
}

- (id)nibName
{
  return CFSTR("BKBrightnessController");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKBrightnessController;
  -[BKBrightnessController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sun.min.fill")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 1, 18.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithConfiguration:", v4));
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "setMinimumValueImage:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sun.max.fill")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 18.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithConfiguration:", v8));
  v10 = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(v10, "setMaximumValueImage:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "updateBrightness", UIScreenBrightnessDidChangeNotification, v12);

  -[BKBrightnessController setPreferredContentSize:](self, "setPreferredContentSize:", 300.0, 44.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKBrightnessController;
  -[BKBrightnessController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BKBrightnessController updateBrightness](self, "updateBrightness");
}

- (void)setBrightness:(id)a3
{
  float v3;
  double v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "value");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "setBrightness:", v4);

}

- (void)updateBrightness
{
  double v3;
  float v4;
  id WeakRetained;
  double v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "brightness");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  *(float *)&v6 = v4;
  objc_msgSend(WeakRetained, "setValue:", v6);

}

- (UISlider)slider
{
  return (UISlider *)objc_loadWeakRetained((id *)&self->_slider);
}

- (void)setSlider:(id)a3
{
  objc_storeWeak((id *)&self->_slider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_slider);
}

@end
