@implementation TVSearchBar

void __34___TVSearchBar__listItemTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_listItemTextColor___lightThemeColor;
  _listItemTextColor___lightThemeColor = v0;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_listItemTextColor___darkThemeColor;
  _listItemTextColor___darkThemeColor = v2;

}

void __49___TVSearchBar__listItemSelectedOverlayFillColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_listItemSelectedOverlayFillColor___lightThemeColor;
  _listItemSelectedOverlayFillColor___lightThemeColor = v0;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.501960784, 0.482352941, 0.501960784, 0.1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_listItemSelectedOverlayFillColor___darkThemeColor;
  _listItemSelectedOverlayFillColor___darkThemeColor = v2;

}

@end
