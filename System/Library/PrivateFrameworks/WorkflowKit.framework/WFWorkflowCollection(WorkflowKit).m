@implementation WFWorkflowCollection(WorkflowKit)

- (uint64_t)systemIconName
{
  objc_msgSend(a1, "glyphCharacter");
  return WFSystemImageNameForOutlineGlyphCharacter();
}

+ (uint64_t)defaultGlyphCharacter
{
  return 59737;
}

+ (id)defaultName
{
  return WFLocalizedString(CFSTR("New Folder"));
}

@end
