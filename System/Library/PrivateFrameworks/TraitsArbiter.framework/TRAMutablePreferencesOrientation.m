@implementation TRAMutablePreferencesOrientation

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->super._supportedOrientations = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRAPreferencesOrientation initWithOrientationPreferences:](+[TRAPreferencesOrientation allocWithZone:](TRAPreferencesOrientation, "allocWithZone:", a3), "initWithOrientationPreferences:", self);
}

- (void)setCanDetermineActiveOrientation:(BOOL)a3
{
  self->super._canDetermineActiveOrientation = a3;
}

- (void)setPreferredOrientation:(int64_t)a3
{
  self->super._preferredOrientation = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOrientationPreferences:", self);
}

@end
