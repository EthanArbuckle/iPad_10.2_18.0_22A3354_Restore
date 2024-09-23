@implementation PMCredentialPickerViewControllerBase

- (id)initRequiringTableView:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PMCredentialPickerViewControllerBase();
  return -[ASCredentialRequestPaneViewController initRequiringTableView:](&v5, sel_initRequiringTableView_, v3);
}

@end
