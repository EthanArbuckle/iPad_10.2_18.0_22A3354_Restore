@implementation SBHEditingWidgetButton

- (SBHEditingWidgetButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4
{
  return -[SBTitledHomeScreenButton initWithFrame:backgroundView:type:content:](self, "initWithFrame:backgroundView:type:content:", a4, 0, CFSTR("plus"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
