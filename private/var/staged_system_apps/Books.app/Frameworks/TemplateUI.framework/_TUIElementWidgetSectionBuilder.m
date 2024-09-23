@implementation _TUIElementWidgetSectionBuilder

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end
