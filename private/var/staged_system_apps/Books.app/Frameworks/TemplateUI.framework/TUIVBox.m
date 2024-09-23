@implementation TUIVBox

- (BOOL)allowDynamicWindowInstantiation
{
  return 1;
}

- (TUIVBox)init
{
  TUIVBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIVBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    result->super.super._storage._data = TUIVBoxStorageDataset | 1;
  return result;
}

- (void)setPivotChild:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x2Eu, (objc_object *)a3);
}

- (TUIBox)pivotChild
{
  return (TUIBox *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x2Eu);
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIVBoxLayout, a2);
}

- (Class)dynamicArrayLayoutContainerClass
{
  return (Class)objc_opt_class(_TUIVBoxDynamicArrayLayout, a2);
}

@end
