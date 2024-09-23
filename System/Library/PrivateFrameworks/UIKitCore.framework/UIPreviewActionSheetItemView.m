@implementation UIPreviewActionSheetItemView

void __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "selected") & 1) != 0)
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.74902, 0.3);
  else
    +[UIColor clearColor](UIColor, "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

uint64_t __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
