@implementation UIScreen

- (int64_t)_music_sizeClass
{
  if (_music_sizeClass_sOnceToken != -1)
    dispatch_once(&_music_sizeClass_sOnceToken, &__block_literal_global_51);
  return _music_sizeClass_screenSizeClass;
}

void __45__UIScreen_ScreenSizeClass___music_sizeClass__block_invoke(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  float v6;
  int64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v15;
  NSObject *v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v1, "nativeBounds");
  v3 = v2;
  v5 = v4;

  v6 = MGGetFloat32Answer(CFSTR("DeviceCornerRadius"), 0.0);
  v7 = ((unint64_t)v3 << 17) | (2 * (unint64_t)v5) | (v6 > 0.0);
  if (v7 <= 153359304)
  {
    if (v7 <= 100665343)
    {
      v10 = 1;
      if (v7 > 83888351)
      {
        if (v7 == 83888352)
          goto LABEL_52;
        if (v7 == 98306668)
        {
          v10 = 2;
          goto LABEL_52;
        }
      }
      else if (v7 == 41944000 || v7 == 83888000)
      {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (v7 <= 141561599)
    {
      if (v7 == 100665344)
        goto LABEL_43;
      v11 = 108531201;
    }
    else
    {
      if (v7 == 141561600)
      {
        v10 = 4;
        goto LABEL_52;
      }
      if (v7 == 141562441)
      {
        v10 = 10;
        goto LABEL_52;
      }
      v11 = 147460873;
    }
    if (v7 != v11)
      goto LABEL_51;
LABEL_37:
    v10 = 3;
    goto LABEL_52;
  }
  if (v7 > 201330687)
  {
    if (v7 > 218632872)
    {
      switch(v7)
      {
        case 218632873:
          v10 = 7;
          goto LABEL_52;
        case 268440920:
          v10 = 8;
          goto LABEL_52;
        case 268440921:
          v10 = 9;
          goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (v7 != 201330688 && v7 != 218632544)
      goto LABEL_51;
LABEL_43:
    v10 = 6;
    goto LABEL_52;
  }
  if (v7 > 162796800)
  {
    if (v7 == 162796801 || v7 == 168302005 || v7 == 169088473)
    {
      v10 = 5;
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if (v7 == 153359305 || v7 == 154539001)
    goto LABEL_37;
LABEL_51:
  v10 = 0;
LABEL_52:
  _music_sizeClass_screenSizeClass = v10;
  v15 = _MTLogCategoryDefault();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218752;
    v18 = v5;
    v19 = 2048;
    v20 = v3;
    v21 = 1024;
    v22 = v6 > 0.0;
    v23 = 2048;
    v24 = _music_sizeClass_screenSizeClass;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Reporting screen size as %f x %f with rounded corners %d which resolves to size class %ld", (uint8_t *)&v17, 0x26u);
  }

}

@end
