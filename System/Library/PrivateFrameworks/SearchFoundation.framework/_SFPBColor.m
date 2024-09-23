@implementation _SFPBColor

- (_SFPBColor)initWithFacade:(id)a3
{
  id v4;
  _SFPBColor *v5;
  _SFPBGraphicalFloat *v6;
  _SFPBGraphicalFloat *v7;
  _SFPBGraphicalFloat *v8;
  _SFPBGraphicalFloat *v9;
  _SFPBGraphicalFloat *v10;
  _SFPBGraphicalFloat *v11;
  _SFPBGraphicalFloat *v12;
  _SFPBGraphicalFloat *v13;
  void *v14;
  _SFPBColor *v15;
  void *v16;
  _SFPBColor *v17;
  _SFPBCalendarColor *v18;
  _SFPBAppColor *v19;
  _SFPBImageDerivedColor *v20;
  _SFPBGradientColor *v21;
  _SFPBWeatherColor *v22;
  _SFPBColor *v23;

  v4 = a3;
  v5 = -[_SFPBColor init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasRedComponent"))
    {
      v6 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "redComponent");
      v7 = -[_SFPBGraphicalFloat initWithCGFloat:](v6, "initWithCGFloat:");
      -[_SFPBColor setRedComponent:](v5, "setRedComponent:", v7);

    }
    if (objc_msgSend(v4, "hasGreenComponent"))
    {
      v8 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "greenComponent");
      v9 = -[_SFPBGraphicalFloat initWithCGFloat:](v8, "initWithCGFloat:");
      -[_SFPBColor setGreenComponent:](v5, "setGreenComponent:", v9);

    }
    if (objc_msgSend(v4, "hasBlueComponent"))
    {
      v10 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "blueComponent");
      v11 = -[_SFPBGraphicalFloat initWithCGFloat:](v10, "initWithCGFloat:");
      -[_SFPBColor setBlueComponent:](v5, "setBlueComponent:", v11);

    }
    if (objc_msgSend(v4, "hasAlphaComponent"))
    {
      v12 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "alphaComponent");
      v13 = -[_SFPBGraphicalFloat initWithCGFloat:](v12, "initWithCGFloat:");
      -[_SFPBColor setAlphaComponent:](v5, "setAlphaComponent:", v13);

    }
    if (objc_msgSend(v4, "hasColorTintStyle"))
      -[_SFPBColor setColorTintStyle:](v5, "setColorTintStyle:", objc_msgSend(v4, "colorTintStyle"));
    objc_msgSend(v4, "darkModeColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBColor alloc];
      objc_msgSend(v4, "darkModeColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBColor initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBColor setDarkModeColor:](v5, "setDarkModeColor:", v17);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBCalendarColor initWithFacade:]([_SFPBCalendarColor alloc], "initWithFacade:", v4);
      -[_SFPBColor setCalendarColor:](v5, "setCalendarColor:", v18);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBAppColor initWithFacade:]([_SFPBAppColor alloc], "initWithFacade:", v4);
      -[_SFPBColor setAppColor:](v5, "setAppColor:", v19);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBImageDerivedColor initWithFacade:]([_SFPBImageDerivedColor alloc], "initWithFacade:", v4);
      -[_SFPBColor setImageDerivedColor:](v5, "setImageDerivedColor:", v20);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBGradientColor initWithFacade:]([_SFPBGradientColor alloc], "initWithFacade:", v4);
      -[_SFPBColor setGradientColor:](v5, "setGradientColor:", v21);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[_SFPBWeatherColor initWithFacade:]([_SFPBWeatherColor alloc], "initWithFacade:", v4);
      -[_SFPBColor setWeatherColor:](v5, "setWeatherColor:", v22);

    }
    v23 = v5;
  }

  return v5;
}

- (void)setRedComponent:(id)a3
{
  objc_storeStrong((id *)&self->_redComponent, a3);
}

- (void)setGreenComponent:(id)a3
{
  objc_storeStrong((id *)&self->_greenComponent, a3);
}

- (void)setBlueComponent:(id)a3
{
  objc_storeStrong((id *)&self->_blueComponent, a3);
}

- (void)setAlphaComponent:(id)a3
{
  objc_storeStrong((id *)&self->_alphaComponent, a3);
}

- (void)setColorTintStyle:(int)a3
{
  self->_colorTintStyle = a3;
}

- (void)setDarkModeColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkModeColor, a3);
}

- (void)setCalendarColor:(id)a3
{
  _SFPBCalendarColor *v4;
  _SFPBAppColor *appColor;
  _SFPBImageDerivedColor *imageDerivedColor;
  _SFPBGradientColor *gradientColor;
  _SFPBWeatherColor *weatherColor;
  _SFPBCalendarColor *calendarColor;

  v4 = (_SFPBCalendarColor *)a3;
  appColor = self->_appColor;
  self->_appColor = 0;

  imageDerivedColor = self->_imageDerivedColor;
  self->_imageDerivedColor = 0;

  gradientColor = self->_gradientColor;
  self->_gradientColor = 0;

  weatherColor = self->_weatherColor;
  self->_weatherColor = 0;

  self->_whichValue = v4 != 0;
  calendarColor = self->_calendarColor;
  self->_calendarColor = v4;

}

- (_SFPBCalendarColor)calendarColor
{
  if (self->_whichValue == 1)
    return self->_calendarColor;
  else
    return (_SFPBCalendarColor *)0;
}

- (void)setAppColor:(id)a3
{
  _SFPBAppColor *v4;
  _SFPBCalendarColor *calendarColor;
  _SFPBImageDerivedColor *imageDerivedColor;
  _SFPBGradientColor *gradientColor;
  _SFPBWeatherColor *weatherColor;
  _SFPBAppColor *appColor;

  v4 = (_SFPBAppColor *)a3;
  calendarColor = self->_calendarColor;
  self->_calendarColor = 0;

  imageDerivedColor = self->_imageDerivedColor;
  self->_imageDerivedColor = 0;

  gradientColor = self->_gradientColor;
  self->_gradientColor = 0;

  weatherColor = self->_weatherColor;
  self->_weatherColor = 0;

  self->_whichValue = 2 * (v4 != 0);
  appColor = self->_appColor;
  self->_appColor = v4;

}

- (_SFPBAppColor)appColor
{
  if (self->_whichValue == 2)
    return self->_appColor;
  else
    return (_SFPBAppColor *)0;
}

- (void)setImageDerivedColor:(id)a3
{
  _SFPBImageDerivedColor *v4;
  _SFPBCalendarColor *calendarColor;
  _SFPBAppColor *appColor;
  _SFPBGradientColor *gradientColor;
  _SFPBWeatherColor *weatherColor;
  unint64_t v9;
  _SFPBImageDerivedColor *imageDerivedColor;

  v4 = (_SFPBImageDerivedColor *)a3;
  calendarColor = self->_calendarColor;
  self->_calendarColor = 0;

  appColor = self->_appColor;
  self->_appColor = 0;

  gradientColor = self->_gradientColor;
  self->_gradientColor = 0;

  weatherColor = self->_weatherColor;
  self->_weatherColor = 0;

  v9 = 3;
  if (!v4)
    v9 = 0;
  self->_whichValue = v9;
  imageDerivedColor = self->_imageDerivedColor;
  self->_imageDerivedColor = v4;

}

- (_SFPBImageDerivedColor)imageDerivedColor
{
  if (self->_whichValue == 3)
    return self->_imageDerivedColor;
  else
    return (_SFPBImageDerivedColor *)0;
}

- (void)setGradientColor:(id)a3
{
  _SFPBGradientColor *v4;
  _SFPBCalendarColor *calendarColor;
  _SFPBAppColor *appColor;
  _SFPBImageDerivedColor *imageDerivedColor;
  _SFPBWeatherColor *weatherColor;
  _SFPBGradientColor *gradientColor;

  v4 = (_SFPBGradientColor *)a3;
  calendarColor = self->_calendarColor;
  self->_calendarColor = 0;

  appColor = self->_appColor;
  self->_appColor = 0;

  imageDerivedColor = self->_imageDerivedColor;
  self->_imageDerivedColor = 0;

  weatherColor = self->_weatherColor;
  self->_weatherColor = 0;

  self->_whichValue = 4 * (v4 != 0);
  gradientColor = self->_gradientColor;
  self->_gradientColor = v4;

}

- (_SFPBGradientColor)gradientColor
{
  if (self->_whichValue == 4)
    return self->_gradientColor;
  else
    return (_SFPBGradientColor *)0;
}

- (void)setWeatherColor:(id)a3
{
  _SFPBWeatherColor *v4;
  _SFPBCalendarColor *calendarColor;
  _SFPBAppColor *appColor;
  _SFPBImageDerivedColor *imageDerivedColor;
  _SFPBGradientColor *gradientColor;
  unint64_t v9;
  _SFPBWeatherColor *weatherColor;

  v4 = (_SFPBWeatherColor *)a3;
  calendarColor = self->_calendarColor;
  self->_calendarColor = 0;

  appColor = self->_appColor;
  self->_appColor = 0;

  imageDerivedColor = self->_imageDerivedColor;
  self->_imageDerivedColor = 0;

  gradientColor = self->_gradientColor;
  self->_gradientColor = 0;

  v9 = 5;
  if (!v4)
    v9 = 0;
  self->_whichValue = v9;
  weatherColor = self->_weatherColor;
  self->_weatherColor = v4;

}

- (_SFPBWeatherColor)weatherColor
{
  if (self->_whichValue == 5)
    return self->_weatherColor;
  else
    return (_SFPBWeatherColor *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_SFPBColor redComponent](self, "redComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor greenComponent](self, "greenComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor blueComponent](self, "blueComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor alphaComponent](self, "alphaComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBColor colorTintStyle](self, "colorTintStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBColor darkModeColor](self, "darkModeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor calendarColor](self, "calendarColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor appColor](self, "appColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor imageDerivedColor](self, "imageDerivedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor gradientColor](self, "gradientColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  -[_SFPBColor weatherColor](self, "weatherColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int colorTintStyle;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  -[_SFPBColor redComponent](self, "redComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor redComponent](self, "redComponent");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBColor redComponent](self, "redComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor greenComponent](self, "greenComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "greenComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor greenComponent](self, "greenComponent");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBColor greenComponent](self, "greenComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "greenComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor blueComponent](self, "blueComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blueComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor blueComponent](self, "blueComponent");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBColor blueComponent](self, "blueComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blueComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor alphaComponent](self, "alphaComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alphaComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor alphaComponent](self, "alphaComponent");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBColor alphaComponent](self, "alphaComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alphaComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_53;
  }
  else
  {

  }
  colorTintStyle = self->_colorTintStyle;
  if (colorTintStyle != objc_msgSend(v4, "colorTintStyle"))
    goto LABEL_53;
  -[_SFPBColor darkModeColor](self, "darkModeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "darkModeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor darkModeColor](self, "darkModeColor");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBColor darkModeColor](self, "darkModeColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "darkModeColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor calendarColor](self, "calendarColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor calendarColor](self, "calendarColor");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBColor calendarColor](self, "calendarColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor appColor](self, "appColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor appColor](self, "appColor");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_SFPBColor appColor](self, "appColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor imageDerivedColor](self, "imageDerivedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageDerivedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor imageDerivedColor](self, "imageDerivedColor");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_SFPBColor imageDerivedColor](self, "imageDerivedColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageDerivedColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor gradientColor](self, "gradientColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_52;
  -[_SFPBColor gradientColor](self, "gradientColor");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_SFPBColor gradientColor](self, "gradientColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradientColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_53;
  }
  else
  {

  }
  -[_SFPBColor weatherColor](self, "weatherColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weatherColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_52:

    goto LABEL_53;
  }
  -[_SFPBColor weatherColor](self, "weatherColor");
  v53 = objc_claimAutoreleasedReturnValue();
  if (!v53)
  {

LABEL_56:
    v58 = 1;
    goto LABEL_54;
  }
  v54 = (void *)v53;
  -[_SFPBColor weatherColor](self, "weatherColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weatherColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v55, "isEqual:", v56);

  if ((v57 & 1) != 0)
    goto LABEL_56;
LABEL_53:
  v58 = 0;
LABEL_54:

  return v58;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[_SFPBGraphicalFloat hash](self->_redComponent, "hash");
  v4 = -[_SFPBGraphicalFloat hash](self->_greenComponent, "hash");
  v5 = -[_SFPBGraphicalFloat hash](self->_blueComponent, "hash");
  v6 = -[_SFPBGraphicalFloat hash](self->_alphaComponent, "hash");
  v7 = 2654435761 * self->_colorTintStyle;
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ -[_SFPBColor hash](self->_darkModeColor, "hash");
  v9 = v8 ^ -[_SFPBCalendarColor hash](self->_calendarColor, "hash") ^ v7;
  v10 = -[_SFPBAppColor hash](self->_appColor, "hash");
  v11 = v10 ^ -[_SFPBImageDerivedColor hash](self->_imageDerivedColor, "hash");
  v12 = v11 ^ -[_SFPBGradientColor hash](self->_gradientColor, "hash");
  return v9 ^ v12 ^ -[_SFPBWeatherColor hash](self->_weatherColor, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alphaComponent)
  {
    -[_SFPBColor alphaComponent](self, "alphaComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alphaComponent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alphaComponent"));

    }
  }
  if (self->_appColor)
  {
    -[_SFPBColor appColor](self, "appColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appColor"));

    }
  }
  if (self->_blueComponent)
  {
    -[_SFPBColor blueComponent](self, "blueComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("blueComponent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("blueComponent"));

    }
  }
  if (self->_calendarColor)
  {
    -[_SFPBColor calendarColor](self, "calendarColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("calendarColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("calendarColor"));

    }
  }
  if (self->_colorTintStyle)
  {
    v16 = -[_SFPBColor colorTintStyle](self, "colorTintStyle");
    if (v16 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = *(&off_1E4042190 + v16);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("colorTintStyle"));

  }
  if (self->_darkModeColor)
  {
    -[_SFPBColor darkModeColor](self, "darkModeColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("darkModeColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("darkModeColor"));

    }
  }
  if (self->_gradientColor)
  {
    -[_SFPBColor gradientColor](self, "gradientColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("gradientColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("gradientColor"));

    }
  }
  if (self->_greenComponent)
  {
    -[_SFPBColor greenComponent](self, "greenComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("greenComponent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("greenComponent"));

    }
  }
  if (self->_imageDerivedColor)
  {
    -[_SFPBColor imageDerivedColor](self, "imageDerivedColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("imageDerivedColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("imageDerivedColor"));

    }
  }
  if (self->_redComponent)
  {
    -[_SFPBColor redComponent](self, "redComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("redComponent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("redComponent"));

    }
  }
  if (self->_weatherColor)
  {
    -[_SFPBColor weatherColor](self, "weatherColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("weatherColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("weatherColor"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBColor dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBColor)initWithJSON:(id)a3
{
  void *v4;
  _SFPBColor *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBColor initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBColor)initWithDictionary:(id)a3
{
  id v4;
  _SFPBColor *v5;
  uint64_t v6;
  _SFPBGraphicalFloat *v7;
  uint64_t v8;
  _SFPBGraphicalFloat *v9;
  uint64_t v10;
  _SFPBGraphicalFloat *v11;
  uint64_t v12;
  _SFPBGraphicalFloat *v13;
  void *v14;
  void *v15;
  _SFPBColor *v16;
  void *v17;
  _SFPBCalendarColor *v18;
  void *v19;
  _SFPBAppColor *v20;
  void *v21;
  _SFPBImageDerivedColor *v22;
  void *v23;
  _SFPBGradientColor *v24;
  void *v25;
  _SFPBWeatherColor *v26;
  _SFPBColor *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_SFPBColor;
  v5 = -[_SFPBColor init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redComponent"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v6);
      -[_SFPBColor setRedComponent:](v5, "setRedComponent:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("greenComponent"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v8);
      -[_SFPBColor setGreenComponent:](v5, "setGreenComponent:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blueComponent"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v10);
      -[_SFPBColor setBlueComponent:](v5, "setBlueComponent:", v11);

    }
    v31 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alphaComponent"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v12);
      -[_SFPBColor setAlphaComponent:](v5, "setAlphaComponent:", v13);

    }
    v30 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorTintStyle"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBColor setColorTintStyle:](v5, "setColorTintStyle:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("darkModeColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v15);
      -[_SFPBColor setDarkModeColor:](v5, "setDarkModeColor:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBCalendarColor initWithDictionary:]([_SFPBCalendarColor alloc], "initWithDictionary:", v17);
      -[_SFPBColor setCalendarColor:](v5, "setCalendarColor:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBAppColor initWithDictionary:]([_SFPBAppColor alloc], "initWithDictionary:", v19);
      -[_SFPBColor setAppColor:](v5, "setAppColor:", v20);

    }
    v32 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageDerivedColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[_SFPBImageDerivedColor initWithDictionary:]([_SFPBImageDerivedColor alloc], "initWithDictionary:", v21);
      -[_SFPBColor setImageDerivedColor:](v5, "setImageDerivedColor:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gradientColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[_SFPBGradientColor initWithDictionary:]([_SFPBGradientColor alloc], "initWithDictionary:", v23);
      -[_SFPBColor setGradientColor:](v5, "setGradientColor:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weatherColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[_SFPBWeatherColor initWithDictionary:]([_SFPBWeatherColor alloc], "initWithDictionary:", v25);
      -[_SFPBColor setWeatherColor:](v5, "setWeatherColor:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (_SFPBGraphicalFloat)redComponent
{
  return self->_redComponent;
}

- (_SFPBGraphicalFloat)greenComponent
{
  return self->_greenComponent;
}

- (_SFPBGraphicalFloat)blueComponent
{
  return self->_blueComponent;
}

- (_SFPBGraphicalFloat)alphaComponent
{
  return self->_alphaComponent;
}

- (int)colorTintStyle
{
  return self->_colorTintStyle;
}

- (_SFPBColor)darkModeColor
{
  return self->_darkModeColor;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherColor, 0);
  objc_storeStrong((id *)&self->_gradientColor, 0);
  objc_storeStrong((id *)&self->_imageDerivedColor, 0);
  objc_storeStrong((id *)&self->_appColor, 0);
  objc_storeStrong((id *)&self->_calendarColor, 0);
  objc_storeStrong((id *)&self->_darkModeColor, 0);
  objc_storeStrong((id *)&self->_alphaComponent, 0);
  objc_storeStrong((id *)&self->_blueComponent, 0);
  objc_storeStrong((id *)&self->_greenComponent, 0);
  objc_storeStrong((id *)&self->_redComponent, 0);
}

@end
