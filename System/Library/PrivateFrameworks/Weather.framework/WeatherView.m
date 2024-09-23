@implementation WeatherView

- (WeatherView)initWithFrame:(CGRect)a3
{
  WeatherView *v3;
  uint64_t v4;
  NSLocale *lastLocale;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WeatherView;
  v3 = -[WeatherView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = objc_claimAutoreleasedReturnValue();
    lastLocale = v3->_lastLocale;
    v3->_lastLocale = (NSLocale *)v4;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_resetLocale_, *MEMORY[0x24BDBCA70], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[City removeUpdateObserver:](self->_city, "removeUpdateObserver:", self);
  -[WeatherView cleanupWindView](self, "cleanupWindView");
  v4.receiver = self;
  v4.super_class = (Class)WeatherView;
  -[WeatherView dealloc](&v4, sel_dealloc);
}

- (void)resetLocale:(id)a3
{
  NSLocale *lastLocale;
  void *v5;
  void *v6;
  NSLocale *v7;
  NSLocale *v8;

  lastLocale = self->_lastLocale;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(lastLocale) = -[NSLocale isEqualToLocaleForWeather:](lastLocale, "isEqualToLocaleForWeather:", v5);

  if ((lastLocale & 1) == 0)
  {
    -[WeatherView city](self, "city");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherView showCity:](self, "showCity:", v6);

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  v8 = self->_lastLocale;
  self->_lastLocale = v7;

}

- (BOOL)_setCity:(id)a3 associateAsDelegate:(BOOL)a4
{
  _BOOL4 v4;
  City *v7;
  City *city;
  BOOL v9;

  v4 = a4;
  v7 = (City *)a3;
  city = self->_city;
  if (city != v7)
  {
    -[City removeUpdateObserver:](self->_city, "removeUpdateObserver:", self);
    if ((objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_city, a3);
      if (self->_city)
        v9 = !v4;
      else
        v9 = 1;
      if (!v9)
        -[City addUpdateObserver:](v7, "addUpdateObserver:", self);
    }
  }

  return city != v7;
}

- (void)showCity:(id)a3
{
  id v4;

  v4 = a3;
  if (-[WeatherView _setCity:associateAsDelegate:](self, "_setCity:associateAsDelegate:"))
    -[WeatherView updateWeatherDisplayForCity:](self, "updateWeatherDisplayForCity:", v4);

}

- (BOOL)updateWeatherDisplayForCity:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeatherView.m"), 113, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[WeatherView updateWeatherDisplayForCity:]", objc_opt_class());

  return 0;
}

- (void)cityDidStartWeatherUpdate:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeatherView.m"), 119, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[WeatherView cityDidStartWeatherUpdate:]", objc_opt_class());

}

- (void)refreshLocalization
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeatherView.m"), 124, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[WeatherView refreshLocalization]", objc_opt_class());

}

- (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle___bundle;
  if (!bundle___bundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle___bundle;
    bundle___bundle = v3;

    v2 = (void *)bundle___bundle;
  }
  return v2;
}

- (void)cleanupWindView
{
  UIView *windView;
  void *v4;
  UIView *v5;

  windView = self->_windView;
  if (windView)
  {
    -[UIView layer](windView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAnimationForKey:", CFSTR("contents"));

    -[UIView removeFromSuperview](self->_windView, "removeFromSuperview");
    v5 = self->_windView;
    self->_windView = 0;

  }
}

- (City)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocale, 0);
  objc_storeStrong((id *)&self->_windView, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end
