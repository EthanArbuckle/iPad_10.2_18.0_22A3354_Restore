@implementation PUIMutableStylePickerHomeScreenConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAccentColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copyWithVariatedColor:", v4);

  -[PUIStylePickerHomeScreenConfiguration setAccentStyle:](self, "setAccentStyle:", v5);
}

- (void)setVariation:(double)a3
{
  void *v5;
  id v6;

  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copyWithVariation:", a3);
  -[PUIStylePickerHomeScreenConfiguration setAccentStyle:](self, "setAccentStyle:", v5);

}

- (void)setLuminance:(double)a3
{
  void *v5;
  id v6;

  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copyWithLuminance:", a3);
  -[PUIStylePickerHomeScreenConfiguration setAccentStyle:](self, "setAccentStyle:", v5);

}

- (void)setSaturation:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "luminance");
  v5 = (void *)objc_msgSend(v6, "copyWithLuminance:saturation:");
  -[PUIStylePickerHomeScreenConfiguration setAccentStyle:](self, "setAccentStyle:", v5);

}

@end
