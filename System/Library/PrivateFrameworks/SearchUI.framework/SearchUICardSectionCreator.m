@implementation SearchUICardSectionCreator

+ (Class)viewClassForCardSection:(id)a3 horizontal:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_msgSend(v5, "_searchUIHorizontalViewClass");
    if (!v7)
      v7 = (void *)objc_msgSend(v6, "_searchUIViewClass");
    v8 = v7;
  }
  else
  {
    objc_msgSend(v5, "_searchUIViewClass");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return (Class)v9;
}

+ (id)cardSectionViewForModel:(id)a3 feedbackDelegate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "cardSectionViewClass")), "initWithRowModel:feedbackDelegate:", v6, v5);

  return v7;
}

@end
