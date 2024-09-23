@implementation UIConstraintBasedLayoutHostingView

void __69___UIConstraintBasedLayoutHostingView__layoutSizeThatFits_fixedAxes___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[UIView _nsis_layoutSizeInEngine:](*(void **)(a1 + 32), a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v5;
}

@end
