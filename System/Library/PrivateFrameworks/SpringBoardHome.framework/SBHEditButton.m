@implementation SBHEditButton

- (SBHEditButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  SBHEditButton *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  SBHBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SBTitledHomeScreenButton initWithFrame:backgroundView:type:content:](self, "initWithFrame:backgroundView:type:content:", v9, 1, v11, x, y, width, height);
  return v12;
}

@end
