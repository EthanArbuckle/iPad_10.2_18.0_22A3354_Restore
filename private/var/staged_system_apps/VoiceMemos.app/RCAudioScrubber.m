@implementation RCAudioScrubber

- (double)position
{
  float v3;
  double v4;
  double v5;

  -[RCAudioScrubber value](self, "value");
  v4 = v3;
  -[RCMPDetailSlider availableDuration](self, "availableDuration");
  return v5 * v4;
}

- (RCAudioScrubber)init
{
  RCAudioScrubber *v2;
  RCAudioScrubber *v3;

  v2 = -[RCMPDetailSlider initWithFrame:style:](self, "initWithFrame:style:", 5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
    -[RCMPDetailSlider setMinTimeLabelWidth:](v2, "setMinTimeLabelWidth:", 0.0);
  return v3;
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1);
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 0.6, 1.0);
}

@end
