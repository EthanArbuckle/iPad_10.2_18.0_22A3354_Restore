@implementation CRLiOSImageHUDSlider

- (CRLiOSImageHUDSlider)initWithFrame:(CGRect)a3
{
  CRLiOSImageHUDSlider *v3;
  CRLiOSImageHUDSlider *v4;
  NSArray *detents;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSImageHUDSlider;
  v3 = -[CRLiOSImageHUDSlider initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    detents = v3->_detents;
    v3->_detents = (NSArray *)&__NSArray0__struct;

  }
  return v4;
}

- (CRLiOSImageHUDSlider)initWithCoder:(id)a3
{
  CRLiOSImageHUDSlider *v3;
  CRLiOSImageHUDSlider *v4;
  NSArray *detents;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSImageHUDSlider;
  v3 = -[CRLiOSImageHUDSlider initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    detents = v3->_detents;
    v3->_detents = (NSArray *)&__NSArray0__struct;

  }
  return v4;
}

- (float)value
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v27.receiver = self;
  v27.super_class = (Class)CRLiOSImageHUDSlider;
  -[CRLiOSImageHUDSlider value](&v27, "value");
  v4 = v3;
  -[CRLiOSImageHUDSlider minimumValue](self, "minimumValue");
  v6 = v5;
  -[CRLiOSImageHUDSlider maximumValue](self, "maximumValue");
  if (v4 != v6)
  {
    v8 = vabdd_f64(v4, v6) < 0.00999999978 || v4 == v7;
    if (!v8 && vabdd_f64(v4, v7) >= 0.00999999978)
    {
      -[CRLiOSImageHUDSlider p_positionForValue:](self, "p_positionForValue:");
      v10 = v9;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider detents](self, "detents", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "floatValue");
            v17 = v16;
            -[CRLiOSImageHUDSlider p_positionForValue:](self, "p_positionForValue:", v16);
            v19 = v18 + -4.0;
            v20 = v18 + 4.0;
            if (v10 >= v19 && v10 < v20)
            {
              v4 = v17;
              goto LABEL_20;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_20:

    }
  }
  return v4;
}

- (double)p_positionForValue:(double)a3
{
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;

  -[CRLiOSImageHUDSlider minimumValue](self, "minimumValue");
  v6 = v5;
  -[CRLiOSImageHUDSlider maximumValue](self, "maximumValue");
  *(float *)&a3 = (a3 - v6) / (float)(v7 - v6);
  -[CRLiOSImageHUDSlider bounds](self, "bounds");
  -[CRLiOSImageHUDSlider trackRectForBounds:](self, "trackRectForBounds:");
  return v8 + *(float *)&a3 * v9;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Image mask slider"), 0, 0));

  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider parentHUDViewController](self, "parentHUDViewController"));
  v3 = objc_msgSend(v2, "accessibilityPerformEscape");

  return v3;
}

- (NSArray)detents
{
  return self->_detents;
}

- (void)setDetents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRLiOSImageHUDViewController)parentHUDViewController
{
  return (CRLiOSImageHUDViewController *)objc_loadWeakRetained((id *)&self->_parentHUDViewController);
}

- (void)setParentHUDViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentHUDViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentHUDViewController);
  objc_storeStrong((id *)&self->_detents, 0);
}

@end
