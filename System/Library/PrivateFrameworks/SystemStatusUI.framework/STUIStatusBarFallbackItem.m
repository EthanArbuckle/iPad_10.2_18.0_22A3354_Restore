@implementation STUIStatusBarFallbackItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

- (STUIStatusBarStringView)label
{
  STUIStatusBarStringView *label;

  label = self->_label;
  if (!label)
  {
    -[STUIStatusBarFallbackItem _create_label](self, "_create_label");
    label = self->_label;
  }
  return label;
}

- (void)_create_label
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *label;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  label = self->_label;
  self->_label = v4;

  -[STUIStatusBarStringView setText:](self->_label, "setText:", CFSTR("😳 rdar:45025538"));
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
