@implementation UIRectangularBoundingPath

void __50___UIRectangularBoundingPath__imageRepresentation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[UIColor whiteColor](UIColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  objc_msgSend(v5, "fillRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  +[UIColor blackColor](UIColor, "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v5, "fillRect:", *(double *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 40));
}

@end
