@implementation SFVerticalLayoutCardSection(SearchUIHorizontallyScrollingSectionModel)

- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t result;
  objc_super v11;

  objc_msgSend(a1, "thumbnail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  objc_msgSend(a1, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasContent"))
  {

  }
  else
  {
    objc_msgSend(a1, "footnote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasContent");

    if ((v9 & 1) == 0)
      return objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  }
  if (v4 <= 200.0)
  {
    result = objc_msgSend(a1, "contentsLeading");
    if ((result & 1) == 0)
      return objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS", 1.0);
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_1F0336C88;
    return (uint64_t)objc_msgSendSuper2(&v11, sel_searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier);
  }
  return result;
}

@end
