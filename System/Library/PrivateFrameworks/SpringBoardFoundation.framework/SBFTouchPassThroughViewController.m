@implementation SBFTouchPassThroughViewController

- (void)loadView
{
  SBFTouchPassThroughView *v3;
  SBFTouchPassThroughView *v4;

  v3 = [SBFTouchPassThroughView alloc];
  v4 = -[SBFTouchPassThroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBFTouchPassThroughViewController configureTouchPassThroughView:](self, "configureTouchPassThroughView:", v4);
  -[SBFTouchPassThroughViewController setView:](self, "setView:", v4);

}

- (void)configureTouchPassThroughView:(id)a3
{
  objc_msgSend(a3, "setOpaque:", 0);
}

@end
