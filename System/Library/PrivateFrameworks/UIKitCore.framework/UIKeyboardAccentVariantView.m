@implementation UIKeyboardAccentVariantView

- (UIKeyboardAccentVariantView)initWithFrame:(CGRect)a3
{
  UIKeyboardAccentVariantView *v3;
  NSMutableArray *v4;
  NSMutableArray *cells;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardAccentVariantView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cells = v3->_cells;
    v3->_cells = v4;

    +[UIColor greenColor](UIColor, "greenColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[UIView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);

    -[UIView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderWidth:", 1.0);

  }
  return v3;
}

+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (double)v5 * 36.0 + 4.0;
  v7 = 52.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  UIKeyboardAccentVariantView *v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->_cells, "count"))
  {
    -[UIKeyboardAccentVariantView updateHighlightForSelectedVariantIndex:](self, "updateHighlightForSelectedVariantIndex:", objc_msgSend(v7, "selectedVariantIndex"));
  }
  else
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__16;
    v13[4] = __Block_byref_object_dispose__16;
    -[UIView leadingAnchor](self, "leadingAnchor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtrees");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__UIKeyboardAccentVariantView_updateForKeyplane_key___block_invoke;
    v9[3] = &unk_1E16B6130;
    v10 = v7;
    v11 = self;
    v12 = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

    _Block_object_dispose(v13, 8);
  }

}

void __53__UIKeyboardAccentVariantView_updateForKeyplane_key___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  UIKeyboardAccentVariantViewCell *v6;
  UIKeyboardAccentVariantViewCell *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  UIKeyboardAccentVariantViewCell *v18;

  v5 = a2;
  v6 = [UIKeyboardAccentVariantViewCell alloc];
  v7 = -[UIKeyboardAccentVariantViewCell initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "representedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardAccentVariantViewCell setAccentedChar:](v7, "setAccentedChar:", v8);
  if (objc_msgSend(*(id *)(a1 + 32), "selectedVariantIndex") == a3)
    -[UIKeyboardAccentVariantViewCell setHighlighted:](v7, "setHighlighted:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "addObject:", v7);
  v18 = v7;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v18);
  if (a3)
    v9 = 0.0;
  else
    v9 = 8.0;
  -[UIView leadingAnchor](v18, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIView topAnchor](v18, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 4.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIView trailingAnchor](v18, "trailingAnchor");
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

- (void)updateHighlightForSelectedVariantIndex:(int64_t)a3
{
  id v5;

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_cells, "enumerateObjectsUsingBlock:", &__block_literal_global_61);
  if (-[NSMutableArray count](self->_cells, "count") > (unint64_t)a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", 1);

  }
}

uint64_t __70__UIKeyboardAccentVariantView_updateHighlightForSelectedVariantIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHighlighted:", 0);
}

- (BOOL)updateSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  uint64_t v8;
  NSMutableArray *cells;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = objc_msgSend(v7, "selectedVariantIndex");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0x7FEFFFFFFFFFFFFFLL;
  cells = self->_cells;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__UIKeyboardAccentVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke;
  v14[3] = &unk_1E16B6178;
  *(CGFloat *)&v14[6] = x;
  *(CGFloat *)&v14[7] = y;
  v14[4] = v15;
  v14[5] = &v16;
  -[NSMutableArray enumerateObjectsUsingBlock:](cells, "enumerateObjectsUsingBlock:", v14);
  if (v17[3] == 0x7FFFFFFFFFFFFFFFLL
    || (-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "setHighlighted:", 1),
        v10,
        v11 = v17[3],
        objc_msgSend(v7, "setSelectedVariantIndex:", v11),
        v11 == v8))
  {
    v12 = 0;
  }
  else
  {
    -[UIKeyboardAccentVariantView updateHighlightForSelectedVariantIndex:](self, "updateHighlightForSelectedVariantIndex:", v11);
    v12 = 1;
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __72__UIKeyboardAccentVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  uint64_t result;
  double v7;
  double v8;
  uint64_t v9;

  v5 = *(double *)(a1 + 48);
  result = objc_msgSend(a2, "center");
  v8 = v5 - v7;
  if (v8 < 0.0)
    v8 = -v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v8 < *(double *)(v9 + 24))
  {
    *(double *)(v9 + 24) = v8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (void)updateRenderConfig:(id)a3
{
  id v4;
  NSMutableArray *cells;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  cells = self->_cells;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__UIKeyboardAccentVariantView_updateRenderConfig___block_invoke;
  v7[3] = &unk_1E16B61A0;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](cells, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __50__UIKeyboardAccentVariantView_updateRenderConfig___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRenderConfig:", *(_QWORD *)(a1 + 32));
}

- (id)nextResponder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[UIKeyboardAccentVariantView touchForwardingView](self, "touchForwardingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardAccentVariantView;
    -[UIView nextResponder](&v8, sel_nextResponder);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (UIView)touchForwardingView
{
  return self->_touchForwardingView;
}

- (void)setTouchForwardingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchForwardingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchForwardingView, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

@end
