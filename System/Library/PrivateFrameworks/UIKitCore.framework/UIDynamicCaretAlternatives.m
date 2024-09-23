@implementation UIDynamicCaretAlternatives

uint64_t __45___UIDynamicCaretAlternatives_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3;
  double v4;

  v3 = 0.0;
  if ((a3 & 1) != 0)
    v4 = *(double *)(a1 + 32);
  else
    v4 = 0.0;
  if (a3 >= 2)
    v3 = *(double *)(a1 + 40);
  return objc_msgSend(a2, "setFrame:", v4, v3, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __47___UIDynamicCaretAlternatives_setButtonLabels___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setHighlighted:", 0);
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

}

@end
