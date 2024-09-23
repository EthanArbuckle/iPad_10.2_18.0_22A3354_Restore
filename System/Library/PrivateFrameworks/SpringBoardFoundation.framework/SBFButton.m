@implementation SBFButton

- (SBFButton)initWithFrame:(CGRect)a3
{
  SBFButton *v3;
  SBFButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFButton;
  v3 = -[SBFButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBFButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__touchUpInside, 64);
  return v4;
}

- (void)_touchUpInside
{
  -[SBFButton _updateSelected:highlighted:](self, "_updateSelected:highlighted:", -[SBFButton isSelected](self, "isSelected") ^ 1, 0);
}

- (BOOL)_drawingAsSelected
{
  if (-[SBFButton isSelected](self, "isSelected")
    && !-[SBFButton isHighlighted](self, "isHighlighted"))
  {
    return 1;
  }
  if ((-[SBFButton isSelected](self, "isSelected") & 1) != 0)
    return 0;
  return -[SBFButton isHighlighted](self, "isHighlighted");
}

- (void)_updateSelected:(BOOL)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  objc_super v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v7 = -[SBFButton _drawingAsSelected](self, "_drawingAsSelected");
  v9.receiver = self;
  v9.super_class = (Class)SBFButton;
  -[SBFButton setSelected:](&v9, sel_setSelected_, v5);
  v8.receiver = self;
  v8.super_class = (Class)SBFButton;
  -[SBFButton setHighlighted:](&v8, sel_setHighlighted_, v4);
  if (v7 != -[SBFButton _drawingAsSelected](self, "_drawingAsSelected"))
    -[SBFButton _updateForStateChange](self, "_updateForStateChange");
}

- (void)setSelected:(BOOL)a3
{
  -[SBFButton _updateSelected:highlighted:](self, "_updateSelected:highlighted:", a3, -[SBFButton isHighlighted](self, "isHighlighted"));
}

- (void)setHighlighted:(BOOL)a3
{
  -[SBFButton _updateSelected:highlighted:](self, "_updateSelected:highlighted:", -[SBFButton isSelected](self, "isSelected"), a3);
}

@end
