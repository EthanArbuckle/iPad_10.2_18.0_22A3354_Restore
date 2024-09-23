@implementation TVStyleFactory

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[TVStyleFactory _registerDefaultStyles](TVStyleFactory, "_registerDefaultStyles");
}

+ (void)registerStyle:(id)a3 withType:(int64_t)a4 inherited:(BOOL)a5
{
  _BOOL8 v5;
  int64_t v6;

  v5 = a5;
  if ((unint64_t)(a4 - 1) >= 8)
    v6 = 3;
  else
    v6 = a4 - 1;
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", a3, 0, v6, v5);
}

+ (void)_registerDefaultStyles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE51A48], "unregisterStyles");
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("background-color"), 0, 4, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("border-color"), 0, 4, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:withType:inherited:", CFSTR("border-radius"), 8, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("color"), 0, 4, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("column-count"), 0, 0, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("row-count"), 0, 0, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("font-family"), 0, 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("font-size"), 0, 2, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("font-weight"), 0, 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("font-stretch"), 0, 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("height"), *MEMORY[0x24BE518D8], 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("max-height"), 0, 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("max-width"), 0, 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("min-height"), 0, 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("min-width"), 0, 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("text-align"), 0, 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("text-shadow"), 0, 9, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("transform"), 0, 6, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("width"), *MEMORY[0x24BE518E0], 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("text-transform"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:withType:inherited:", CFSTR("tv-overflow"), 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:withType:inherited:", CFSTR("line-height"), 2, 1);
  v2 = (void *)MEMORY[0x24BE51A48];
  v14[0] = CFSTR("border-top-width");
  v14[1] = CFSTR("border-left-width");
  v14[2] = CFSTR("border-bottom-width");
  v14[3] = CFSTR("border-right-width");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("border-width"), 0, v3, 0);

  v4 = (void *)MEMORY[0x24BE51A48];
  v13[0] = CFSTR("margin-top");
  v13[1] = CFSTR("margin-left");
  v13[2] = CFSTR("margin-bottom");
  v13[3] = CFSTR("margin-right");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("margin"), 0, v5, 0);

  v6 = (void *)MEMORY[0x24BE51A48];
  v12[0] = CFSTR("padding-top");
  v12[1] = CFSTR("padding-left");
  v12[2] = CFSTR("padding-bottom");
  v12[3] = CFSTR("padding-right");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("padding"), CFSTR("itml-padding"), v7, 0);

  v8 = (void *)MEMORY[0x24BE51A48];
  v11[0] = CFSTR("tv-scrollable-bounds-inset-top");
  v11[1] = CFSTR("tv-scrollable-bounds-inset-left");
  v11[2] = CFSTR("tv-scrollable-bounds-inset-bottom");
  v11[3] = CFSTR("tv-scrollable-bounds-inset-right");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerEdgeInsetStyle:aliasName:withPositionStyleNames:inherited:", CFSTR("tv-scrollable-bounds-inset"), 0, v9, 0);

  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("padding-top"), CFSTR("itml-top-padding"), 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("padding-left"), CFSTR("itml-left-padding"), 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("padding-bottom"), CFSTR("itml-bottom-padding"), 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("padding-right"), CFSTR("itml-right-padding"), 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:withType:inherited:", CFSTR("tv-background-highlight-style"), 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:withType:inherited:", CFSTR("tv-background-highlight-color"), 4, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-focus-margin"), 0, 7, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-img-upscale-factor"), 0, 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-accepts-focus"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-align"), *MEMORY[0x24BE518C0], 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-border-continuous"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-content-align"), CFSTR("itml-content-align"), 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-focus-align"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-focus-size-increase"), 0, 0, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-focus-transform"), 0, 6, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-highlight-color"), CFSTR("itml-highlight-color"), 4, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-img-treatment"), *MEMORY[0x24BE518D0], 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-index-display"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-interitem-spacing"), CFSTR("itml-interitem-spacing"), 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-line-spacing"), CFSTR("itml-line-spacing"), 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-minimum-scale-factor"), CFSTR("itml-minimum-scale-factor"), 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-placeholder"), CFSTR("itml-placeholder"), 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-position"), *MEMORY[0x24BE518C8], 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-progress-style"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-rating-style"), CFSTR("itml-rating-style"), 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-search-style"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-shadow"), 0, 9, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-text-highlight-style"), CFSTR("itml-text-hightlight-style"), 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-highlight-style"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-scroll-mode"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-text-hyphenation-factor"), 0, 1, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-text-max-lines"), *MEMORY[0x24BE51900], 0, 0);
  v10 = *MEMORY[0x24BE51908];
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-text-style"), *MEMORY[0x24BE51908], 3, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-tint-color"), CFSTR("itml-tint-color"), 4, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-dark-tint-color"), 0, 4, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-tint-color2"), CFSTR("itml-tint-color2"), 4, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-transition"), *MEMORY[0x24BE51910], 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-transition-interval"), *MEMORY[0x24BE51918], 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-visual-effect"), CFSTR("itml-visual-effect"), 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-column-color"), 0, 4, 1);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-column-padding"), 0, 1, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-layer-flip-mode"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-symbol-point-size"), 0, 2, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-symbol-weight"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-symbol-scale"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-symbol-text-style"), v10, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerHiddenStyle:", CFSTR("tv-hidden"));
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-group"), 0, 3, 0);
  objc_msgSend(MEMORY[0x24BE51A48], "registerStyle:aliasName:withType:inherited:", CFSTR("tv-max-lines"), 0, 0, 0);
}

@end
