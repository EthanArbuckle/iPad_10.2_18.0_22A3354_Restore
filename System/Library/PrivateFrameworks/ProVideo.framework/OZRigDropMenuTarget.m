@implementation OZRigDropMenuTarget

+ (id)rigDropMenuTargetForRig:(void *)a3
{
  OZRigDropMenuTarget *v4;

  v4 = (OZRigDropMenuTarget *)+[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance;
  if (!+[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance)
  {
    v4 = objc_alloc_init(OZRigDropMenuTarget);
    +[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance = (uint64_t)v4;
  }
  -[OZRigDropMenuTarget setRig:](v4, "setRig:", a3);
  return (id)+[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance;
}

- (void)setRig:(void *)a3
{
  self->_pRig = a3;
}

- (void)pasteToNewSwitch
{
  -[OZRigDropMenuTarget pasteHelper:](self, "pasteHelper:", 1);
}

- (void)pasteToNewList
{
  -[OZRigDropMenuTarget pasteHelper:](self, "pasteHelper:", 2);
}

- (void)pasteToNewSlider
{
  -[OZRigDropMenuTarget pasteHelper:](self, "pasteHelper:", 3);
}

@end
