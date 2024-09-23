@implementation SBLiveIconImageView

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLiveIconImageView;
  -[SBIconImageView prepareForReuse](&v3, sel_prepareForReuse);
  -[SBLiveIconImageView updateAnimatingState](self, "updateAnimatingState");
}

- (void)setPaused:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLiveIconImageView;
  -[SBIconImageView setPaused:](&v4, sel_setPaused_, a3);
  -[SBLiveIconImageView updateAnimatingState](self, "updateAnimatingState");
}

- (BOOL)isAnimationAllowed
{
  return !-[SBIconImageView isPaused](self, "isPaused")
      && -[SBIconImageView contentVisibility](self, "contentVisibility") != 2;
}

- (void)updateImageAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLiveIconImageView;
  -[SBIconImageView updateImageAnimated:](&v4, sel_updateImageAnimated_, a3);
  -[SBLiveIconImageView updateAnimatingState](self, "updateAnimatingState");
}

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLiveIconImageView;
  -[SBIconImageView setIcon:location:animated:](&v7, sel_setIcon_location_animated_, a3, a4, a5);
  -[SBIconImageView icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SBLiveIconImageView updateUnanimated](self, "updateUnanimated");
}

- (void)setContentVisibility:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLiveIconImageView;
  -[SBIconImageView setContentVisibility:](&v4, sel_setContentVisibility_, a3);
  -[SBLiveIconImageView updateAnimatingState](self, "updateAnimatingState");
}

+ (BOOL)allowsImageLayer
{
  return 0;
}

- (id)snapshot
{
  void *v3;
  void *v4;

  -[SBIconImageView icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v3, "iconImageWithInfo:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
