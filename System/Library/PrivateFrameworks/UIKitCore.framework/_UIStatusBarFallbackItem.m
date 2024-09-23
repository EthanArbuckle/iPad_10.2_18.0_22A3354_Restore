@implementation _UIStatusBarFallbackItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

- (_UIStatusBarStringView)label
{
  _UIStatusBarStringView *label;

  label = self->_label;
  if (!label)
  {
    -[_UIStatusBarFallbackItem _create_label](self, "_create_label");
    label = self->_label;
  }
  return label;
}

- (void)_create_label
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *label;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  label = self->_label;
  self->_label = v4;

  -[_UIStatusBarStringView setText:](self->_label, "setText:", CFSTR("😳 rdar:45025538"));
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
