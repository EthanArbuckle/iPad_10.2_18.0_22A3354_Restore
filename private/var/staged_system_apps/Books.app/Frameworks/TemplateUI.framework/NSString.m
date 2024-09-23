@implementation NSString

- (id)tui_identiferFromString
{
  return +[_TUIIdentifier fromString:](_TUIIdentifier, "fromString:", self);
}

@end
