@implementation MTAUtilities

+ (id)pillButtonWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v4, "setRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration grayButtonConfiguration](UIButtonConfiguration, "grayButtonConfiguration"));
  objc_msgSend(v5, "setTitle:", v3);

  objc_msgSend(v5, "setButtonSize:", 2);
  objc_msgSend(v5, "setCornerStyle:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v6);

  objc_msgSend(v4, "setConfiguration:", v5);
  return v4;
}

+ (MTControlButtonAttributes)controlButtonAttributesForView:(SEL)a3 buttonCircleSize:(id)a4
{
  int v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double Height;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  MTControlButtonAttributes *result;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a4;
  v7 = MTUIShouldUseLargePadLayout(v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "traitCollection"));
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  if (v9 == (id)2)
    v10 = 1;
  else
    v10 = v7;
  objc_msgSend(v31, "bounds");
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v15, "bounds");
  Height = CGRectGetHeight(v32);

  if (v10)
  {
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", 1);
    if (v17 >= 120.0)
      v18 = 120.0;
    else
      v18 = v17;
    v19 = (double *)&unk_10007AB60;
    if (!v7)
      v19 = (double *)&unk_10007AB68;
    v20 = *v19;
    v21 = 24.0;
  }
  else
  {
    objc_msgSend(v31, "bounds");
    v22 = fmin(Height * 0.542, CGRectGetWidth(v33));
    objc_msgSend(v31, "safeAreaInsets");
    v24 = v22 - v23;
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", 0);
    v20 = v24 + (v25 + -84.0) * 0.5;
    objc_msgSend(v31, "bounds");
    v18 = (v26 + -32.0) * 0.25;
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", a5);
    if (v27 < v18)
      v18 = v27;
    v21 = 16.0;
  }
  v28 = UIRoundToViewScale(v20);
  *(_QWORD *)&retstr->var3 = 0;
  retstr->var0 = v28;
  retstr->var1 = v18;
  v29 = 40.0;
  if (!v7)
    v29 = v21;
  retstr->var2 = v29;
  retstr->var3 = v12 / v14 > 0.9;
  retstr->var4 = v10;
  retstr->var5 = v7;

  return result;
}

+ (id)thinG2FontWithSize:(double)a3
{
  CTFontRef UIFontForLanguage;
  void *CopyOfSystemUIFontWithGrade;

  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x66u, a3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade(UIFontForLanguage, 2);
  CFRelease(UIFontForLanguage);
  return CopyOfSystemUIFontWithGrade;
}

+ (id)thinG2MonospacedDigitFontWithSize:(double)a3
{
  const __CTFontDescriptor *v4;
  const __CTFontDescriptor *CopyWithFeature;
  CTFontRef v6;
  void *CopyOfSystemUIFontWithGrade;

  v4 = (const __CTFontDescriptor *)CTFontDescriptorCreateForUIType(102, 0);
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v4, (CFNumberRef)&off_10009CE48, (CFNumberRef)&off_10009CE60);
  CFRelease(v4);
  v6 = CTFontCreateWithFontDescriptor(CopyWithFeature, a3, 0);
  CFRelease(CopyWithFeature);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade(v6, 2);
  CFRelease(v6);
  return CopyOfSystemUIFontWithGrade;
}

+ (id)durationStringFromInterval:(double)a3
{
  if (qword_1000BFD30 != -1)
    dispatch_once(&qword_1000BFD30, &stru_100099DC8);
  objc_msgSend((id)qword_1000BFD28, "setAllowedUnits:", 224);
  objc_msgSend((id)qword_1000BFD28, "setUnitsStyle:", 2);
  return objc_msgSend((id)qword_1000BFD28, "stringFromTimeInterval:", a3);
}

+ (BOOL)isLandscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windows"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (char *)objc_msgSend(v5, "interfaceOrientation");

  return (unint64_t)(v6 - 3) < 2;
}

+ (id)sectionHeaderConfigurationWithTitle:(id)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[3];
  _QWORD v20[3];

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "prominentInsetGroupedHeaderConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "color"));

  v11 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v12 = v11;
  if (v4)
    v13 = 2;
  else
    v13 = 0;
  objc_msgSend(v11, "setAlignment:", v13);
  objc_msgSend(v12, "setLineBreakMode:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  v15 = objc_alloc((Class)NSAttributedString);
  v19[0] = NSFontAttributeName;
  v19[1] = NSForegroundColorAttributeName;
  v20[0] = v8;
  v20[1] = v10;
  v19[2] = NSParagraphStyleAttributeName;
  v20[2] = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
  v17 = objc_msgSend(v15, "initWithString:attributes:", v5, v16);

  objc_msgSend(v14, "setAttributedText:", v17);
  return v14;
}

+ (int64_t)estimatedSplitLayoutForWindowWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;

  v7 = v6 * 0.5;
  if (v6 > a3 && v7 < a3)
    return 1;
  if (v7 + v6 / -3.0 * 0.25 > a3)
    return 2;
  if (v6 == a3)
    return 0;
  return 3;
}

+ (BOOL)shouldUseCompactLayoutForSizeClass:(int64_t)a3 windowWidth:(double)a4
{
  uint64_t v4;
  uint64_t v5;

  return a3 == 1 || objc_msgSend(a1, "estimatedSplitLayoutForWindowWidth:", a4, v4, v5) == (id)3;
}

+ (void)updateTimerAppShortcuts
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutItems"));
  v9 = objc_msgSend(v4, "mutableCopy");

  v5 = objc_msgSend(v9, "indexOfObjectPassingTest:", &stru_100099DE8);
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "removeObjectAtIndex:", v5);
  v6 = objc_msgSend(v9, "indexOfObjectPassingTest:", &stru_100099E08);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "startTimerShortcutItem"));
  if (v7)
  {
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v9, "addObject:", v7);
    else
      objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v8, "setShortcutItems:", v9);

  }
}

+ (id)startTimerShortcutItem
{
  void *v2;
  NSBundle *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("timer")));
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTTimer));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("START_TIMER_QUICK_ACTION_TITLE"), &stru_10009A4D0, CFSTR("Localizable-OrbHW")));

  v6 = objc_alloc((Class)UIApplicationShortcutItem);
  v7 = objc_msgSend(v6, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", kStartTimerActionID, v5, 0, v2, 0);

  return v7;
}

@end
