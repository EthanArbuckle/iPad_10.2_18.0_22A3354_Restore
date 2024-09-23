@implementation UIColor(NotesColors)

+ (id)ic_notesAppYellowColor
{
  if (ic_notesAppYellowColor_onceToken != -1)
    dispatch_once(&ic_notesAppYellowColor_onceToken, &__block_literal_global_92);
  return (id)ic_notesAppYellowColor_appYellowColor;
}

+ (id)ic_notesDefaultTextColor
{
  if (ic_notesDefaultTextColor_onceToken[0] != -1)
    dispatch_once(ic_notesDefaultTextColor_onceToken, &__block_literal_global_1_0);
  return (id)ic_notesDefaultTextColor_defaultTextColor;
}

@end
