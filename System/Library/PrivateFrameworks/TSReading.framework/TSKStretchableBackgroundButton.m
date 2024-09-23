@implementation TSKStretchableBackgroundButton

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  objc_super v6;

  if (a3)
    a3 = (id)objc_msgSend(a3, "stretchableImageWithLeftCapWidth:topCapHeight:", self->mBackgroundLeftCapWidth, self->mBackgroundTopCapHeight);
  v6.receiver = self;
  v6.super_class = (Class)TSKStretchableBackgroundButton;
  -[TSKStretchableBackgroundButton setBackgroundImage:forState:](&v6, sel_setBackgroundImage_forState_, a3, a4);
}

- (void)setBackgroundTopCapHeight:(int64_t)a3
{
  objc_sync_enter(self);
  if (self->mBackgroundTopCapHeight != a3)
  {
    self->mBackgroundTopCapHeight = a3;
    -[TSKStretchableBackgroundButton p_resetBackgroundImage](self, "p_resetBackgroundImage");
  }
  objc_sync_exit(self);
}

- (void)setBackgroundLeftCapWidth:(int64_t)a3
{
  objc_sync_enter(self);
  if (self->mBackgroundLeftCapWidth != a3)
  {
    self->mBackgroundLeftCapWidth = a3;
    -[TSKStretchableBackgroundButton p_resetBackgroundImage](self, "p_resetBackgroundImage");
  }
  objc_sync_exit(self);
}

- (void)setBackgroundTopLeftCapHeight:(int64_t)a3 width:(int64_t)a4
{
  int64_t *p_mBackgroundLeftCapWidth;

  objc_sync_enter(self);
  if (self->mBackgroundTopCapHeight == a3)
  {
    p_mBackgroundLeftCapWidth = &self->mBackgroundLeftCapWidth;
    if (self->mBackgroundLeftCapWidth == a4)
      goto LABEL_7;
    goto LABEL_5;
  }
  -[TSKStretchableBackgroundButton willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundTopCapHeight"));
  self->mBackgroundTopCapHeight = a3;
  -[TSKStretchableBackgroundButton didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundTopCapHeight"));
  p_mBackgroundLeftCapWidth = &self->mBackgroundLeftCapWidth;
  if (self->mBackgroundLeftCapWidth != a4)
  {
LABEL_5:
    -[TSKStretchableBackgroundButton willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundLeftCapWidth"));
    *p_mBackgroundLeftCapWidth = a4;
    -[TSKStretchableBackgroundButton didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundLeftCapWidth"));
  }
  -[TSKStretchableBackgroundButton p_resetBackgroundImage](self, "p_resetBackgroundImage");
LABEL_7:
  objc_sync_exit(self);
}

- (void)guessBackgroundTopLeftCapSize
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)-[TSKStretchableBackgroundButton backgroundImageForState:](self, "backgroundImageForState:", 0);
  if (v3)
  {
    objc_msgSend(v3, "size");
    -[TSKStretchableBackgroundButton setBackgroundTopLeftCapHeight:width:](self, "setBackgroundTopLeftCapHeight:width:", vcvtmd_s64_f64(v4 * 0.5), vcvtmd_s64_f64(v5 * 0.5));
  }
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKStretchableBackgroundButton;
  -[TSKStretchableBackgroundButton awakeFromNib](&v3, sel_awakeFromNib);
  if (*(_OWORD *)&self->mBackgroundTopCapHeight == 0)
    -[TSKStretchableBackgroundButton guessBackgroundTopLeftCapSize](self, "guessBackgroundTopLeftCapSize");
}

- (void)p_resetBackgroundImageForState:(unint64_t)a3
{
  -[TSKStretchableBackgroundButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", -[TSKStretchableBackgroundButton backgroundImageForState:](self, "backgroundImageForState:"), a3);
}

- (void)p_resetBackgroundImage
{
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 0);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 1);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 2);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 3);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 4);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 5);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 6);
  -[TSKStretchableBackgroundButton p_resetBackgroundImageForState:](self, "p_resetBackgroundImageForState:", 7);
}

- (int64_t)backgroundTopCapHeight
{
  return self->mBackgroundTopCapHeight;
}

- (int64_t)backgroundLeftCapWidth
{
  return self->mBackgroundLeftCapWidth;
}

@end
