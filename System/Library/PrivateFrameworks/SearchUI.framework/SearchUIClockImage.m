@implementation SearchUIClockImage

- (SearchUIClockImage)initWithClockImage:(id)a3 variant:(unint64_t)a4
{
  id v6;
  void *v7;
  SearchUIClockImage *v8;
  objc_super v10;

  v6 = a3;
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SearchUIClockImage;
  v8 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](&v10, sel_initWithBundleIdentifier_variant_contentType_, v7, a4, 0);

  if (v8)
    -[SearchUIImage setSfImage:](v8, "setSfImage:", v6);

  return v8;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  void (**v7)(id, void *, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CGSize v26;

  v7 = (void (**)(id, void *, uint64_t))a5;
  -[SearchUIImage sfImage](self, "sfImage");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v25, "hour");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHour:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v25, "minute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "integerValue"));

  objc_msgSend(v25, "second");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecond:", objc_msgSend(v11, "integerValue"));

  v12 = objc_msgSend(v8, "hour") > 11;
  v13 = (void *)objc_opt_new();
  -[SearchUIImage size](self, "size");
  SBIconImageInfoMake();
  objc_msgSend(v13, "setIconImageInfo:");
  objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithVibrancyEnabled:isDark:", 0, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "overrideAppearanceForView:", v13);

  objc_msgSend(v13, "updateTraitsIfNeeded");
  objc_msgSend(MEMORY[0x1E0DAA420], "overrideDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(MEMORY[0x1E0DAA420], "hidesSecondsHand");
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateFromComponents:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA420], "setOverrideDate:", v18);

  objc_msgSend(v25, "second");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v25, "second");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(MEMORY[0x1E0DAA420], "setHidesSecondsHand:", v21 < 0.0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAA420], "setHidesSecondsHand:", 1);
  }

  v22 = (void *)objc_opt_new();
  objc_msgSend(v13, "setIcon:location:animated:", v22, &stru_1EA1FB118, 0);

  -[SearchUIImage size](self, "size");
  UIGraphicsBeginImageContextWithOptions(v26, 1, a3);
  objc_msgSend(v13, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(MEMORY[0x1E0DAA420], "setOverrideDate:", v15);
  objc_msgSend(MEMORY[0x1E0DAA420], "setHidesSecondsHand:", v16);
  v7[2](v7, v24, 1);

}

- (BOOL)isEqual:(id)a3
{
  SearchUIClockImage *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = (SearchUIClockImage *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (-[SearchUIClockImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[SearchUIImage sfImage](self, "sfImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[SearchUIImage sfImage](v4, "sfImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v11.receiver = self;
        v11.super_class = (Class)SearchUIClockImage;
        v6 = -[SearchUIAppIconImage isEqual:](&v11, sel_isEqual_, v4);
        goto LABEL_9;
      }
    }
    -[SearchUIImage sfImage](self, "sfImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIImage sfImage](v4, "sfImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v6 = 0;
  }
LABEL_9:

  return v6;
}

@end
