@implementation UIKBDimmingView

- (UIKBDimmingView)initWithFrame:(CGRect)a3
{
  UIKBDimmingView *v3;
  UIKBDimmingView *v4;
  UIKBDimmingView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBDimmingView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    v5 = v4;
  }

  return v4;
}

- (void)refreshStyleForKeyplane:(id)a3
{
  objc_storeStrong((id *)&self->_keyplane, a3);
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *ContextStack;
  CGContext *v9;
  char v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v9);
  if (-[UIKBTree isSplit](self->_keyplane, "isSplit")
    && !-[UIKBScreenTraits centerFilled](self->_screenTraits, "centerFilled"))
  {
    v10 = -[UIView _clipCornersOfView:](self, "_clipCornersOfView:", self) | 0xC;
    -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-left"));
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-right"));
    UIKBClipTwoPieceBackground(v9, v10, x, y, width, height, v12, v14, v16, height, v17, v18, v19, height);
  }
  +[UIColor blackColor](UIColor, "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "set");

  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  CGContextFillRect(v9, v21);
  CGContextRestoreGState(v9);
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_screenTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end
