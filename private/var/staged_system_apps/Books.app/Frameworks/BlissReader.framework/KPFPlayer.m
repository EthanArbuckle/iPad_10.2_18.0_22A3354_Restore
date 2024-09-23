@implementation KPFPlayer

+ (id)createPlayerWithKPFDocument:(id)a3 bundle:(id)a4 layer:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  CAKPFPlayerController *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a4)
    return 0;
  if ((objc_msgSend(a3, "isLegacy") & 1) != 0)
  {
    v7 = objc_opt_class(KPFDocument);
    TSUDynamicCast(v7, a3);
    v9 = -[CAKPFPlayerController initWithKPFDocument:showLayer:]([CAKPFPlayerController alloc], "initWithKPFDocument:showLayer:", v8, a5);
    -[CAKPFPlayerController resetToFirstEventAndShouldAutoPlay:](v9, "resetToFirstEventAndShouldAutoPlay:", 0);
  }
  else
  {
    v10 = objc_opt_class(KPFGingerDocument);
    TSUDynamicCast(v10, a3);
    v9 = -[KPFGingerPlayerController initWithKPFDocument:showLayer:]([KPFGingerPlayerController alloc], "initWithKPFDocument:showLayer:", v11, a5);
  }
  -[CAKPFPlayerController setAllowsShowToEndInternally:](v9, "setAllowsShowToEndInternally:", 1);
  -[CAKPFPlayerController setPlaysAutomaticEvents:](v9, "setPlaysAutomaticEvents:", 1);
  return v9;
}

@end
