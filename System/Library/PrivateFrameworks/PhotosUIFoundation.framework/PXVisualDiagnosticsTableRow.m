@implementation PXVisualDiagnosticsTableRow

void __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  double x;
  double y;
  double width;
  double height;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  v11 = a2;
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.width = a5;
  v19.size.height = a6;
  v20 = CGRectInset(v19, 1.0, 1.0);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke_2;
  v16[3] = &unk_2514CFF90;
  v17 = *(id *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "drawTextInRect:configuration:", v16, x, y, width, height);

}

void __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setFontSize:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setRelativePosition:", 0.0, 0.5);

}

@end
