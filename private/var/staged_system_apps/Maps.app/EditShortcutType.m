@implementation EditShortcutType

+ (id)shortcutWithType:(int64_t)a3
{
  EditShortcutType *v4;

  v4 = objc_alloc_init(EditShortcutType);
  -[EditShortcutType setType:](v4, "setType:", a3);
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
