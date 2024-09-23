@implementation VehicleColorPickerCell

- (double)cellHeightWithWidth:(double)a3
{
  VehicleColorPicker **p_colorPicker;
  id WeakRetained;
  id v5;
  double v6;
  double v7;
  double v8;
  double result;

  p_colorPicker = &self->_colorPicker;
  WeakRetained = objc_loadWeakRetained((id *)&self->_colorPicker);
  objc_msgSend(WeakRetained, "layoutIfNeeded");

  v5 = objc_loadWeakRetained((id *)p_colorPicker);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "sizeThatFits:", v6, 1.79769313e308);
  v8 = v7;

  result = v8 + 16.0;
  if (v8 + 16.0 < 44.0)
    return 44.0;
  return result;
}

- (VehicleColorPicker)colorPicker
{
  return (VehicleColorPicker *)objc_loadWeakRetained((id *)&self->_colorPicker);
}

- (void)setColorPicker:(id)a3
{
  objc_storeWeak((id *)&self->_colorPicker, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_colorPicker);
}

@end
