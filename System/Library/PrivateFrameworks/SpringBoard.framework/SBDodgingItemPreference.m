@implementation SBDodgingItemPreference

- (SBDodgingItemPreference)initWithPreferredSize:(CGSize)a3 preferredCenter:(CGPoint)a4 updateInteractively:(BOOL)a5 dodgingAxisMask:(unint64_t)a6 minimumSize:(CGSize)a7 canBePositionedOutsideContainerBounds:(BOOL)a8 excludedDodgingIdentifiers:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v16;
  CGFloat v17;
  id v19;
  SBDodgingItemPreference *v20;
  SBDodgingItemPreference *v21;
  uint64_t v22;
  NSSet *excludedDodgingIdentifiers;
  objc_super v25;

  height = a7.height;
  width = a7.width;
  y = a4.y;
  x = a4.x;
  v16 = a3.height;
  v17 = a3.width;
  v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SBDodgingItemPreference;
  v20 = -[SBDodgingItemPreference init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_preferredSize.width = v17;
    v20->_preferredSize.height = v16;
    v20->_preferredCenter.x = x;
    v20->_preferredCenter.y = y;
    v20->_updateInteractively = a5;
    v20->_dodgingAxisMask = a6;
    v20->_minimumSize.width = width;
    v20->_minimumSize.height = height;
    v20->_canBePositionedOutsideContainerBounds = a8;
    v22 = objc_msgSend(v19, "copy");
    excludedDodgingIdentifiers = v21->_excludedDodgingIdentifiers;
    v21->_excludedDodgingIdentifiers = (NSSet *)v22;

  }
  return v21;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)preferredCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_preferredCenter.x;
  y = self->_preferredCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isUpdatingInteractively
{
  return self->_updateInteractively;
}

- (unint64_t)dodgingAxisMask
{
  return self->_dodgingAxisMask;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)canBePositionedOutsideContainerBounds
{
  return self->_canBePositionedOutsideContainerBounds;
}

- (NSSet)excludedDodgingIdentifiers
{
  return self->_excludedDodgingIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedDodgingIdentifiers, 0);
}

@end
