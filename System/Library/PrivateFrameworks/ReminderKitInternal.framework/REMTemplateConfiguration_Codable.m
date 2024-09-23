@implementation REMTemplateConfiguration_Codable

- (REMTemplateConfiguration_Codable)initWithSourceListID:(id)a3 shouldSaveCompleted:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[REMTemplateConfiguration initWithSourceListID:shouldSaveCompleted:](&v7, sel_initWithSourceListID_shouldSaveCompleted_, a3, v4);
}

@end
