@implementation WATodayPadViewStyle

+ (id)styleForScreenWithSize:(CGSize)a3 orientation:(int64_t)a4
{
  double height;
  double width;
  WATodayPadViewStyle *v7;
  double v8;

  height = a3.height;
  width = a3.width;
  v7 = [WATodayPadViewStyle alloc];
  if (width >= height)
    v8 = width;
  else
    v8 = height;
  return -[WATodayPadViewStyle initWithFormat:orientation:](v7, "initWithFormat:orientation:", v8 >= 1366.0, a4);
}

- (WATodayPadViewStyle)initWithFormat:(unint64_t)a3 orientation:(int64_t)a4
{
  WATodayPadViewStyle *v6;
  WATodayPadViewStyle *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WATodayPadViewStyle;
  v6 = -[WATodayPadViewStyle init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
      -[WATodayPadViewStyle _setupForGigantorWithOrientation:](v6, "_setupForGigantorWithOrientation:", a4);
    else
      -[WATodayPadViewStyle _setupForDefaultWithOrientation:](v6, "_setupForDefaultWithOrientation:", a4);
  }
  return v7;
}

- (WATodayPadViewStyle)init
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;
  void *v8;
  WATodayPadViewStyle *v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  v7 = v6 >= 1366.0;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WATodayPadViewStyle initWithFormat:orientation:](self, "initWithFormat:orientation:", v7, objc_msgSend(v8, "orientation"));

  return v9;
}

- (void)_setupForGigantorWithOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WATodayPadViewStyle setFormat:](self, "setFormat:", 1);
  -[WATodayPadViewStyle setOrientation:](self, "setOrientation:", a3);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 50.0, *MEMORY[0x24BDF7878]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setTemperatureFont:](self, "setTemperatureFont:", v5);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], 32770, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setLocationFont:](self, "setLocationFont:", v8);

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v10, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setConditionsFont:](self, "setConditionsFont:", v9);

  -[WATodayPadViewStyle setLabelLeadingMargin:](self, "setLabelLeadingMargin:", 16.0);
  -[WATodayPadViewStyle setConditionsImageLeadingMargin:](self, "setConditionsImageLeadingMargin:", 8.0);
  -[WATodayPadViewStyle setTemperatureLabelBaselineToConditionsImageViewBottom:](self, "setTemperatureLabelBaselineToConditionsImageViewBottom:", -40.0);
  -[WATodayPadViewStyle setLocationLabelBaselineToTemperatureLabelBaseline:](self, "setLocationLabelBaselineToTemperatureLabelBaseline:", 25.0);
  -[WATodayPadViewStyle setConditionsLabelBaselineToLocationLabelBaseline:](self, "setConditionsLabelBaselineToLocationLabelBaseline:", 20.0);
  -[WATodayPadViewStyle setConditionsLabelBaselineToBottom:](self, "setConditionsLabelBaselineToBottom:", 0.0);

}

- (void)_setupForDefaultWithOrientation:(int64_t)a3
{
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[WATodayPadViewStyle setFormat:](self, "setFormat:", 0);
  -[WATodayPadViewStyle setOrientation:](self, "setOrientation:", a3);
  v5 = 44.0;
  if ((unint64_t)(a3 - 1) < 2)
    v5 = 50.0;
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", v5, *MEMORY[0x24BDF7878]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setTemperatureFont:](self, "setTemperatureFont:", v6);

  v7 = *MEMORY[0x24BDF77D0];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], 32770, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v10, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setLocationFont:](self, "setLocationFont:", v8);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setConditionsFont:](self, "setConditionsFont:", v9);

  -[WATodayPadViewStyle setLabelLeadingMargin:](self, "setLabelLeadingMargin:", 16.0);
  -[WATodayPadViewStyle setConditionsImageLeadingMargin:](self, "setConditionsImageLeadingMargin:", 8.0);
  -[WATodayPadViewStyle setTemperatureLabelBaselineToConditionsImageViewBottom:](self, "setTemperatureLabelBaselineToConditionsImageViewBottom:", -40.0);
  -[WATodayPadViewStyle setLocationLabelBaselineToTemperatureLabelBaseline:](self, "setLocationLabelBaselineToTemperatureLabelBaseline:", 20.0);
  -[WATodayPadViewStyle setConditionsLabelBaselineToLocationLabelBaseline:](self, "setConditionsLabelBaselineToLocationLabelBaseline:", 20.0);
  -[WATodayPadViewStyle setConditionsLabelBaselineToBottom:](self, "setConditionsLabelBaselineToBottom:", 0.0);

}

- (id)copyWithZone:(_NSZone *)a3
{
  WATodayPadViewStyle *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[WATodayPadViewStyle init](+[WATodayPadViewStyle allocWithZone:](WATodayPadViewStyle, "allocWithZone:", a3), "init");
  -[WATodayPadViewStyle temperatureFont](self, "temperatureFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setTemperatureFont:](v4, "setTemperatureFont:", v5);

  -[WATodayPadViewStyle locationFont](self, "locationFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setLocationFont:](v4, "setLocationFont:", v6);

  -[WATodayPadViewStyle conditionsFont](self, "conditionsFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayPadViewStyle setConditionsFont:](v4, "setConditionsFont:", v7);

  -[WATodayPadViewStyle labelLeadingMargin](self, "labelLeadingMargin");
  -[WATodayPadViewStyle setLabelLeadingMargin:](v4, "setLabelLeadingMargin:");
  -[WATodayPadViewStyle conditionsImageLeadingMargin](self, "conditionsImageLeadingMargin");
  -[WATodayPadViewStyle setConditionsImageLeadingMargin:](v4, "setConditionsImageLeadingMargin:");
  -[WATodayPadViewStyle temperatureLabelBaselineToConditionsImageViewBottom](self, "temperatureLabelBaselineToConditionsImageViewBottom");
  -[WATodayPadViewStyle setTemperatureLabelBaselineToConditionsImageViewBottom:](v4, "setTemperatureLabelBaselineToConditionsImageViewBottom:");
  -[WATodayPadViewStyle locationLabelBaselineToTemperatureLabelBaseline](self, "locationLabelBaselineToTemperatureLabelBaseline");
  -[WATodayPadViewStyle setLocationLabelBaselineToTemperatureLabelBaseline:](v4, "setLocationLabelBaselineToTemperatureLabelBaseline:");
  -[WATodayPadViewStyle conditionsLabelBaselineToLocationLabelBaseline](self, "conditionsLabelBaselineToLocationLabelBaseline");
  -[WATodayPadViewStyle setConditionsLabelBaselineToLocationLabelBaseline:](v4, "setConditionsLabelBaselineToLocationLabelBaseline:");
  -[WATodayPadViewStyle conditionsLabelBaselineToBottom](self, "conditionsLabelBaselineToBottom");
  -[WATodayPadViewStyle setConditionsLabelBaselineToBottom:](v4, "setConditionsLabelBaselineToBottom:");
  return v4;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (UIFont)locationFont
{
  return self->_locationFont;
}

- (void)setLocationFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIFont)temperatureFont
{
  return self->_temperatureFont;
}

- (void)setTemperatureFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIFont)conditionsFont
{
  return self->_conditionsFont;
}

- (void)setConditionsFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)labelLeadingMargin
{
  return self->_labelLeadingMargin;
}

- (void)setLabelLeadingMargin:(double)a3
{
  self->_labelLeadingMargin = a3;
}

- (double)conditionsImageLeadingMargin
{
  return self->_conditionsImageLeadingMargin;
}

- (void)setConditionsImageLeadingMargin:(double)a3
{
  self->_conditionsImageLeadingMargin = a3;
}

- (double)temperatureLabelBaselineToConditionsImageViewBottom
{
  return self->_temperatureLabelBaselineToConditionsImageViewBottom;
}

- (void)setTemperatureLabelBaselineToConditionsImageViewBottom:(double)a3
{
  self->_temperatureLabelBaselineToConditionsImageViewBottom = a3;
}

- (double)locationLabelBaselineToTemperatureLabelBaseline
{
  return self->_locationLabelBaselineToTemperatureLabelBaseline;
}

- (void)setLocationLabelBaselineToTemperatureLabelBaseline:(double)a3
{
  self->_locationLabelBaselineToTemperatureLabelBaseline = a3;
}

- (double)conditionsLabelBaselineToLocationLabelBaseline
{
  return self->_conditionsLabelBaselineToLocationLabelBaseline;
}

- (void)setConditionsLabelBaselineToLocationLabelBaseline:(double)a3
{
  self->_conditionsLabelBaselineToLocationLabelBaseline = a3;
}

- (double)conditionsLabelBaselineToBottom
{
  return self->_conditionsLabelBaselineToBottom;
}

- (void)setConditionsLabelBaselineToBottom:(double)a3
{
  self->_conditionsLabelBaselineToBottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionsFont, 0);
  objc_storeStrong((id *)&self->_temperatureFont, 0);
  objc_storeStrong((id *)&self->_locationFont, 0);
}

@end
