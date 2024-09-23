@implementation TPActionButton

+ (id)button
{
  void *v2;
  void *v3;
  double v4;

  +[TPActionButton buttonWithType:](TPActionButton, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "telephonyUIActionButtonGlyphImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v3, 0);

  LODWORD(v4) = -1.0;
  objc_msgSend(v2, "setCharge:", v4);
  return v2;
}

@end
