@implementation _UICellularSignalView

- (void)_commonInit
{
  void *v3;
  objc_class *v4;
  _UISignalViewImplementation *v5;
  _UISignalViewImplementation *signalView;
  void *v7;
  double v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)_MergedGlobals_1297;
  v14 = _MergedGlobals_1297;
  if (!_MergedGlobals_1297)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getSTUIStatusBarCellularSignalViewClass_block_invoke;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getSTUIStatusBarCellularSignalViewClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  v5 = (_UISignalViewImplementation *)objc_alloc_init(v4);
  signalView = self->_signalView;
  self->_signalView = v5;

  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  if (v8 <= 2.5)
    v9 = 1;
  else
    v9 = 2;
  -[_UISignalViewImplementation setIconSize:](self->_signalView, "setIconSize:", v9);

  -[_UISignalViewImplementation setTranslatesAutoresizingMaskIntoConstraints:](self->_signalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", self->_signalView);
}

- (_UICellularSignalView)initWithSizeCategory:(int64_t)a3
{
  _UICellularSignalView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICellularSignalView;
  v4 = -[UIView init](&v6, sel_init);
  -[_UICellularSignalView _commonInit](v4, "_commonInit");
  -[_UICellularSignalView setSizeCategory:](v4, "setSizeCategory:", a3);
  return v4;
}

- (_UICellularSignalView)initWithFrame:(CGRect)a3
{
  _UICellularSignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICellularSignalView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UICellularSignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (_UICellularSignalView)initWithCoder:(id)a3
{
  _UICellularSignalView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICellularSignalView;
  v3 = -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[_UICellularSignalView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICellularSignalView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[_UISignalViewImplementation setFrame:](self->_signalView, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UISignalViewImplementation intrinsicContentSize](self->_signalView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)sizeCategory
{
  return (unint64_t)(-[_UISignalViewImplementation iconSize](self->_signalView, "iconSize") - 9) < 2;
}

- (void)setSizeCategory:(int64_t)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  double v8;
  double v9;

  -[UIView traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 1)
  {
    objc_msgSend(v6, "displayScale");
    if (v9 <= 2.5)
      v3 = 9;
    else
      v3 = 10;
  }
  else if (!a3)
  {
    objc_msgSend(v6, "displayScale");
    if (v8 <= 2.5)
      v3 = 1;
    else
      v3 = 2;
  }

  -[_UISignalViewImplementation setIconSize:](self->_signalView, "setIconSize:", v3);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (int64_t)numberOfBars
{
  return -[_UISignalViewImplementation numberOfBars](self->_signalView, "numberOfBars");
}

- (void)setNumberOfBars:(int64_t)a3
{
  -[_UISignalViewImplementation setNumberOfBars:](self->_signalView, "setNumberOfBars:", a3);
}

- (int64_t)numberOfActiveBars
{
  return -[_UISignalViewImplementation numberOfActiveBars](self->_signalView, "numberOfActiveBars");
}

- (void)setNumberOfActiveBars:(int64_t)a3
{
  -[_UISignalViewImplementation setNumberOfActiveBars:](self->_signalView, "setNumberOfActiveBars:", a3);
}

- (int64_t)signalMode
{
  return -[_UISignalViewImplementation signalMode](self->_signalView, "signalMode");
}

- (void)setSignalMode:(int64_t)a3
{
  -[_UISignalViewImplementation setSignalMode:](self->_signalView, "setSignalMode:", a3);
}

- (UIColor)inactiveColor
{
  return (UIColor *)-[_UISignalViewImplementation inactiveColor](self->_signalView, "inactiveColor");
}

- (void)setInactiveColor:(id)a3
{
  -[_UISignalViewImplementation setInactiveColor:](self->_signalView, "setInactiveColor:", a3);
}

- (UIColor)activeColor
{
  return (UIColor *)-[_UISignalViewImplementation activeColor](self->_signalView, "activeColor");
}

- (void)setActiveColor:(id)a3
{
  -[_UISignalViewImplementation setActiveColor:](self->_signalView, "setActiveColor:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalView, 0);
}

@end
