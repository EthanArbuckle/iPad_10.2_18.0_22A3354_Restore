@implementation PXWidgetCompositionElementScanner

void __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "widget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "preferredContentHeightForWidth:", *(double *)(a1 + 40));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v4 + 24) >= v3)
      v3 = *(double *)(v4 + 24);
    *(double *)(v4 + 24) = v3;
  }

}

uint64_t __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

@end
