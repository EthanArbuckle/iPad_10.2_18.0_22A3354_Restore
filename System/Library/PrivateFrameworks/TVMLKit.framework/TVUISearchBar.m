@implementation TVUISearchBar

void __32___TVUISearchBar__tvmlKitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TVMLKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_tvmlKitBundle_bundle;
  _tvmlKitBundle_bundle = v0;

}

void __29___TVUISearchBar__clearGlyph__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("Search-clear"), v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_flatImageWithColor:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_clearGlyph_clearGlpyh;
  _clearGlyph_clearGlpyh = v3;

}

void __30___TVUISearchBar__searchGlyph__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("Search-glyph"), v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_flatImageWithColor:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_searchGlyph_searchGlyph;
  _searchGlyph_searchGlyph = v3;

}

@end
