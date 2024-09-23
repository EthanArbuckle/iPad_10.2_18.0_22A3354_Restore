@implementation PEPhotoStyleValuesPlatterView

- (double)tone
{
  PEPhotoStyleValuesPlatterView *v2;
  double v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.tone.getter();

  return v3;
}

- (void)setTone:(double)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.tone.setter();

}

- (double)color
{
  PEPhotoStyleValuesPlatterView *v2;
  double v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.color.getter();

  return v3;
}

- (void)setColor:(double)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.color.setter();

}

- (double)palette
{
  PEPhotoStyleValuesPlatterView *v2;
  double v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.palette.getter();

  return v3;
}

- (void)setPalette:(double)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.palette.setter();

}

- (BOOL)hideToneAndColorLabels
{
  PEPhotoStyleValuesPlatterView *v2;
  char v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.getter();

  return v3 & 1;
}

- (void)setHideToneAndColorLabels:(BOOL)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.setter();

}

- (BOOL)hidePaletteLabel
{
  PEPhotoStyleValuesPlatterView *v2;
  char v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.hidePaletteLabel.getter();

  return v3 & 1;
}

- (void)setHidePaletteLabel:(BOOL)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.hidePaletteLabel.setter();

}

- (BOOL)hideResetButton
{
  PEPhotoStyleValuesPlatterView *v2;
  char v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.hideResetButton.getter();

  return v3 & 1;
}

- (void)setHideResetButton:(BOOL)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.hideResetButton.setter();

}

- (BOOL)isResetButtonEnabled
{
  PEPhotoStyleValuesPlatterView *v2;
  char v3;

  v2 = self;
  v3 = PEPhotoStyleValuesPlatterView.isResetButtonEnabled.getter();

  return v3 & 1;
}

- (void)setIsResetButtonEnabled:(BOOL)a3
{
  PEPhotoStyleValuesPlatterView *v3;

  v3 = self;
  PEPhotoStyleValuesPlatterView.isResetButtonEnabled.setter();

}

- (id)resetAction
{
  PEPhotoStyleValuesPlatterView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v2 = self;
  PEPhotoStyleValuesPlatterView.resetAction.getter();
  v4 = v3;
  v6 = v5;

  v9[4] = v4;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_20D1635CC;
  v9[3] = &block_descriptor_1;
  v7 = _Block_copy(v9);
  swift_release();
  return v7;
}

- (void)setResetAction:(id)a3
{
  void *v4;
  PEPhotoStyleValuesPlatterView *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  PEPhotoStyleValuesPlatterView.resetAction.setter();

}

- (PEPhotoStyleValuesPlatterView)initWithTone:(double)a3 color:(double)a4 palette:(double)a5
{
  return (PEPhotoStyleValuesPlatterView *)PEPhotoStyleValuesPlatterView.init(tone:color:palette:)(a3, a4, a5);
}

- (PEPhotoStyleValuesPlatterView)initWithCoder:(id)a3
{
  PEPhotoStyleValuesPlatterView.init(coder:)();
}

- (PEPhotoStyleValuesPlatterView)initWithFrame:(CGRect)a3
{
  PEPhotoStyleValuesPlatterView.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
