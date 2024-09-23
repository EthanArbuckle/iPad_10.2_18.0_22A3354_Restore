@implementation FBSDisplayLayoutMonitor

- (void)setStu_currentLayout:(id)a3
{
  id value;

  value = a3;
  objc_setAssociatedObject(self, -[FBSDisplayLayoutMonitor stu_currentLayoutKey](self, "stu_currentLayoutKey"), value, (void *)0x301);

}

- (FBSDisplayLayout)stu_currentLayout
{
  return (FBSDisplayLayout *)objc_getAssociatedObject(self, -[FBSDisplayLayoutMonitor stu_currentLayoutKey](self, "stu_currentLayoutKey"));
}

- (const)stu_currentLayoutKey
{
  return a2;
}

@end
