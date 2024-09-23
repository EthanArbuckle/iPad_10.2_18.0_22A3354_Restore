@implementation WFCreateFolderEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)folderSource
{
  return self->_folderSource;
}

- (void)setFolderSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)icon
{
  return self->_icon;
}

- (void)setIcon:(unsigned int)a3
{
  self->_icon = a3;
}

- (unsigned)shortcutCount
{
  return self->_shortcutCount;
}

- (void)setShortcutCount:(unsigned int)a3
{
  self->_shortcutCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
