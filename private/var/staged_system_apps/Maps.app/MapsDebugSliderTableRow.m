@implementation MapsDebugSliderTableRow

- (MapsDebugSliderTableRow)init
{
  MapsDebugSliderTableRow *v2;
  MapsDebugSliderTableRow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsDebugSliderTableRow;
  v2 = -[MapsDebugTableRow init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MapsDebugSliderTableRow setSubtitleFormatString:](v2, "setSubtitleFormatString:", CFSTR("%f"));
    v3->_minimum = 0.0;
    v3->_maximum = 100.0;
  }
  return v3;
}

- (void)invalidate
{
  objc_super v3;

  -[MapsDebugSliderTableRow setGet:](self, "setGet:", 0);
  -[MapsDebugSliderTableRow setSet:](self, "setSet:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugSliderTableRow;
  -[MapsDebugTableRow invalidate](&v3, "invalidate");
}

- (float)minimum
{
  return self->_minimum;
}

- (float)maximum
{
  return self->_maximum;
}

- (NSString)subtitleFormatString
{
  return self->_subtitleFormatString;
}

- (void)setSubtitleFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)validate
{
  return self->_validate;
}

- (void)setValidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)subtitleHandler
{
  return self->_subtitleHandler;
}

- (void)setSubtitleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subtitleHandler, 0);
  objc_storeStrong(&self->_validate, 0);
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_subtitleFormatString, 0);
}

- (int64_t)cellStyle
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow subtitleFormatString](self, "subtitleFormatString"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 3;
  v6.receiver = self;
  v6.super_class = (Class)MapsDebugSliderTableRow;
  return -[MapsDebugTableRow cellStyle](&v6, "cellStyle");
}

- (id)_createSliderForIdiom:(int64_t)a3
{
  id v4;
  void *v5;
  float (**v6)(void);
  float v7;
  float v8;
  float v9;
  double v10;

  v4 = objc_msgSend(objc_alloc((Class)UISlider), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MapsDebugSliderTableRow minimum](self, "minimum");
  objc_msgSend(v4, "setMinimumValue:");
  -[MapsDebugSliderTableRow maximum](self, "maximum");
  objc_msgSend(v4, "setMaximumValue:");
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "_sliderDidChangeValue:", 4096);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow get](self, "get"));

  if (v5)
  {
    v6 = (float (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow get](self, "get"));
    v7 = v6[2]();

    -[MapsDebugSliderTableRow maximum](self, "maximum");
    if (v7 >= v8)
    {
      -[MapsDebugSliderTableRow maximum](self, "maximum");
      v7 = v9;
    }
    -[MapsDebugSliderTableRow minimum](self, "minimum");
    if (v7 <= *(float *)&v10)
    {
      -[MapsDebugSliderTableRow minimum](self, "minimum");
      v7 = *(float *)&v10;
    }
    *(float *)&v10 = v7;
    objc_msgSend(v4, "setValue:", v10);
  }
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("MapsDebugSlider"));
  return v4;
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsDebugSliderTableRow;
  v4 = a3;
  -[MapsDebugTableRow configureCell:](&v7, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection", v7.receiver, v7.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow _createSliderForIdiom:](self, "_createSliderForIdiom:", objc_msgSend(v5, "userInterfaceIdiom")));

  objc_msgSend(v6, "value");
  -[MapsDebugSliderTableRow _updateSecondaryText:](self, "_updateSecondaryText:");
  objc_msgSend(v4, "setAccessoryView:", v6);

}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  id v11;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsDebugSliderTableRow;
  -[MapsDebugTableRow configureCollectionViewCell:](&v10, "configureCollectionViewCell:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow _createSliderForIdiom:](self, "_createSliderForIdiom:", objc_msgSend(v6, "userInterfaceIdiom")));

  objc_msgSend(v7, "value");
  -[MapsDebugSliderTableRow _updateSecondaryText:](self, "_updateSecondaryText:");
  v8 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", v7);
  objc_msgSend(v8, "setMaintainsFixedSize:", 1);
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v5, "setTrailingAccessoryConfigurations:", v9);

}

- (void)setMinimum:(float)a3
{
  void *v4;
  double v5;
  id v6;

  if (self->_minimum != a3)
  {
    self->_minimum = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryView"));
    *(float *)&v5 = a3;
    objc_msgSend(v4, "setMinimumValue:", v5);

  }
}

- (void)setMaximum:(float)a3
{
  void *v4;
  double v5;
  id v6;

  if (self->_maximum != a3)
  {
    self->_maximum = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryView"));
    *(float *)&v5 = a3;
    objc_msgSend(v4, "setMaximumValue:", v5);

  }
}

- (void)_sliderDidChangeValue:(id)a3
{
  float v4;
  float v5;
  void *v6;
  float (**v7)(float);
  void *v8;
  double v9;
  void (**v10)(float);

  objc_msgSend(a3, "value");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow validate](self, "validate"));

  if (v6)
  {
    v7 = (float (**)(float))objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow validate](self, "validate"));
    v5 = v7[2](v5);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow set](self, "set"));

  if (v8)
  {
    v10 = (void (**)(float))objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow set](self, "set"));
    v10[2](v5);

  }
  *(float *)&v9 = v5;
  -[MapsDebugSliderTableRow _updateSecondaryText:](self, "_updateSecondaryText:", v9);
}

- (void)_updateSecondaryText:(float)a3
{
  void *v5;
  void *v6;
  uint64_t (**v7)(float);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow subtitleHandler](self, "subtitleHandler"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentConfiguration"));

    v7 = (uint64_t (**)(float))objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow subtitleHandler](self, "subtitleHandler"));
    v8 = v7[2](a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v16, "setSecondaryText:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow subtitleFormatString](self, "subtitleFormatString"));

    if (!v10)
      return;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentConfiguration"));

    v7 = (uint64_t (**)(float))objc_claimAutoreleasedReturnValue(-[MapsDebugSliderTableRow subtitleFormatString](self, "subtitleFormatString"));
    *(float *)&v12 = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%f"), v13));
    objc_msgSend(v16, "setSecondaryText:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
  objc_msgSend(v15, "setContentConfiguration:", v16);

}

@end
