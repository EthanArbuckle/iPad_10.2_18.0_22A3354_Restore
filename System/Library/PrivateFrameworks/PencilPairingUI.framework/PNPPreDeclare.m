@implementation PNPPreDeclare

+ (void)squeezeInteraction:(id)a3 setMiniPaletteVisible:(BOOL)a4 hoverLocation:(CGPoint)a5 inView:(id)a6
{
  double y;
  double x;
  _BOOL8 v9;
  id v10;
  id v11;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v11 = a3;
  v10 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "_setMiniPaletteVisible:hoverLocation:inView:", v9, v10, x, y);

}

@end
