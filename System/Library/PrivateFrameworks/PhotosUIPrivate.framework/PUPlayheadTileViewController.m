@implementation PUPlayheadTileViewController

- (id)loadView
{
  PUPlayheadView *v2;

  v2 = [PUPlayheadView alloc];
  return -[PUPlayheadView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

@end
