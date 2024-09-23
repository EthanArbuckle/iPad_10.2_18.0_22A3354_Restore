@implementation UIKeyboardEmojiVariantView

- (UIKeyboardEmojiVariantView)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiVariantView *v3;
  NSMutableArray *v4;
  NSMutableArray *cells;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiVariantView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cells = v3->_cells;
    v3->_cells = v4;

  }
  return v3;
}

+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  v6 = (double)(unint64_t)v5 * 44.0 + 13.0 + 24.0;
  v7 = 56.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->_cells, "count"))
  {
    -[UIKeyboardEmojiVariantView updateHighlightForSelectedVariantIndex:](self, "updateHighlightForSelectedVariantIndex:", objc_msgSend(v7, "selectedVariantIndex"));
  }
  else
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__70;
    v12[4] = __Block_byref_object_dispose__70;
    -[UIView leadingAnchor](self, "leadingAnchor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtrees");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__UIKeyboardEmojiVariantView_updateForKeyplane_key___block_invoke;
    v9[3] = &unk_1E16B6130;
    v9[4] = self;
    v10 = v7;
    v11 = v12;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

    _Block_object_dispose(v12, 8);
  }

}

void __52__UIKeyboardEmojiVariantView_updateForKeyplane_key___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  UIKeyboardEmojiVariantDivider *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  UIKeyboardEmojiVariantViewCell *v9;
  UIKeyboardEmojiVariantViewCell *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  if (objc_msgSend(v21, "displayType") == 50)
  {
    v5 = [UIKeyboardEmojiVariantDivider alloc];
    v6 = -[UIKeyboardEmojiVariantDivider initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 416);
    *(_QWORD *)(v7 + 416) = v6;

    v9 = (UIKeyboardEmojiVariantViewCell *)*(id *)(*(_QWORD *)(a1 + 32) + 416);
  }
  else
  {
    v10 = [UIKeyboardEmojiVariantViewCell alloc];
    v9 = -[UIKeyboardEmojiVariantViewCell initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v21, "representedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiVariantViewCell setEmoji:](v9, "setEmoji:", v11);

    if (objc_msgSend(*(id *)(a1 + 40), "selectedVariantIndex") == a3)
      -[UIKeyboardEmojiVariantViewCell setHighlighted:](v9, "setHighlighted:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addObject:", v9);
  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v9);
  if (a3)
    v12 = 6.0;
  else
    v12 = 9.0;
  -[UIView leadingAnchor](v9, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIView topAnchor](v9, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 3.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[UIView trailingAnchor](v9, "trailingAnchor");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

}

- (void)updateHighlightForSelectedVariantIndex:(int64_t)a3
{
  id v5;

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_cells, "enumerateObjectsUsingBlock:", &__block_literal_global_164);
  if (!a3 || (--a3, a3))
  {
    if (a3 < (unint64_t)-[NSMutableArray count](self->_cells, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHighlighted:", 1);

    }
  }
}

uint64_t __69__UIKeyboardEmojiVariantView_updateHighlightForSelectedVariantIndex___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  BOOL v13;
  _QWORD v15[8];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = objc_msgSend(v7, "selectedVariantIndex");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0x7FEFFFFFFFFFFFFFLL;
  cells = self->_cells;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__UIKeyboardEmojiVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke;
  v15[3] = &unk_1E16C41A0;
  *(CGFloat *)&v15[6] = x;
  *(CGFloat *)&v15[7] = y;
  v15[4] = v16;
  v15[5] = &v17;
  -[NSMutableArray enumerateObjectsUsingBlock:](cells, "enumerateObjectsUsingBlock:", v15);
  if (v18[3] == 0x7FFFFFFFFFFFFFFFLL
    || ((-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v10, "setHighlighted:", 1),
         v10,
         v11 = v18[3],
         v11 <= 0)
      ? (v12 = v18[3])
      : (v12 = v11 + 1),
        objc_msgSend(v7, "setSelectedVariantIndex:", v12),
        v12 == v8))
  {
    v13 = 0;
  }
  else
  {
    -[UIKeyboardEmojiVariantView updateHighlightForSelectedVariantIndex:](self, "updateHighlightForSelectedVariantIndex:", v12);
    v13 = 1;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);

  return v13;
}

uint64_t __71__UIKeyboardEmojiVariantView_updateSelectedVariantIndexForKey_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  v7[2] = __49__UIKeyboardEmojiVariantView_updateRenderConfig___block_invoke;
  v7[3] = &unk_1E16C41C8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](cells, "enumerateObjectsUsingBlock:", v7);
  -[UIKeyboardEmojiVariantDivider setRenderConfig:](self->_divider, "setRenderConfig:", v6);

}

uint64_t __49__UIKeyboardEmojiVariantView_updateRenderConfig___block_invoke(uint64_t a1, void *a2)
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

  -[UIKeyboardEmojiVariantView touchForwardingView](self, "touchForwardingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardEmojiVariantView;
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
  objc_storeStrong((id *)&self->_divider, 0);
}

@end
