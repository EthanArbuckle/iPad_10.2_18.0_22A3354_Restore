@implementation EditShortcutSection

+ (id)sectionWithType:(unint64_t)a3
{
  EditShortcutSection *v4;

  v4 = objc_alloc_init(EditShortcutSection);
  -[EditShortcutSection setType:](v4, "setType:", a3);
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
