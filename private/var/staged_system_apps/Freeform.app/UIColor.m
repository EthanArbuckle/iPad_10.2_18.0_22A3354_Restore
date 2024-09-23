@implementation UIColor

+ (id)crl_tableViewCellDarkBlueTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1014152D0;
  if (!qword_1014152D0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.219607843, 0.329411765, 0.529411765, 1.0));
    v4 = (void *)qword_1014152D0;
    qword_1014152D0 = v3;

    v2 = (void *)qword_1014152D0;
  }
  return v2;
}

- (id)crl_withReducedAlpha:(double)a3
{
  double v5;

  -[UIColor alphaComponent](self, "alphaComponent");
  return -[UIColor colorWithAlphaComponent:](self, "colorWithAlphaComponent:", v5 * a3);
}

+ (id)crl_switchOnTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

+ (id)crl_switchTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.125490196, 0.125490196, 0.125490196, 1.0);
}

+ (id)crl_switchOffOutlineColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
}

+ (id)crl_sliderMinimumTrackTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

+ (id)crl_sliderMaximumTrackTintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.15));

  return v3;
}

+ (id)crl_sliderThumbTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
}

+ (id)crl_sidebarBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (id)crl_sidebarHighContrastBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.584313725, 0.584313725, 0.584313725, 1.0);
}

+ (id)crl_styleUpdateButtonDarkColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.368627451, 0.368627451, 0.368627451, 1.0);
}

+ (id)crl_styleUpdateButtonLightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.960784314, 0.960784314, 0.960784314, 1.0);
}

+ (id)crl_styleUpdateButton6ptBlackColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.06);
}

+ (id)crl_sidebarNavigationBarTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)crl_sidebarNavigationBarBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (id)crl_insertPaneBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (id)crl_sidebarCellBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.223529412, 0.223529412, 0.22745098, 1.0);
}

+ (id)crl_rowItemDividersColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.141176471, 1.0);
}

+ (id)crl_mediaBrowserNavigationBarTitleColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (id)crl_mediaBrowserNavigationBarTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)crl_mediaBrowserPrimaryContentColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (id)crl_mediaBrowserSecondaryContentColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (id)crl_mediaBrowserChickletLightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.06);
}

+ (id)crl_mediaBrowserChickletDarkColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.298039216, 0.298039216, 0.298039216, 1.0);
}

+ (id)crl_mediaBrowserChickletTitleLightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (id)crl_mediaBrowserChickletTitleDarkColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
}

+ (id)crl_sidebarNavigationBarTitleColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (id)crl_sidebarActiveTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

+ (id)crl_sidebarInactiveTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (id)crl_sidebarPlaybackButtonTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)crl_sidebarPrimaryContentColor
{
  double v2;

  if (UIAccessibilityDarkerSystemColorsEnabled())
    v2 = 0.784313725;
  else
    v2 = 0.647058824;
  return (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v2, v2, v2, 1.0));
}

+ (id)crl_sidebarSecondaryContentColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)crl_sidebarInactiveCellTintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.2));

  return v3;
}

+ (id)crl_sidebarSegmentedControlTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.42745098, 0.42745098, 0.431372549, 1.0);
}

+ (id)crl_sidebarSegmentedCellTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)crl_sidebarTableViewCellTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)crl_sidebarPressedStateColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.203921569, 1.0);
}

+ (id)crl_sidebarTopTabTextColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (id)crl_sidebarPopoverDimmingColor
{
  return +[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("CRLSidebarPopoverDimmingColor"));
}

+ (id)crl_navigatorSelectionHighlightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.129411765, 0.48627451, 0.956862745, 1.0);
}

+ (id)crl_navigatorSelectionFocusedHighlightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.180392157, 0.576470588, 1.0, 1.0);
}

@end
