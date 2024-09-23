@implementation SBHTouchPassThroughViewController

- (void)loadView
{
  SBHTouchPassThroughView *v3;
  SBHTouchPassThroughView *v4;

  v3 = [SBHTouchPassThroughView alloc];
  v4 = -[SBHTouchPassThroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBHTouchPassThroughView setOpaque:](v4, "setOpaque:", 0);
  -[SBHTouchPassThroughViewController setView:](self, "setView:", v4);

}

@end
