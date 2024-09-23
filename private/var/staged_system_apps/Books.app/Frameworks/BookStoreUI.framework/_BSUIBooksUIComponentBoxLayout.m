@implementation _BSUIBooksUIComponentBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a3 < 4)
    return 0;
  -[_BSUIBooksUIComponentBoxLayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", a4);
  v6 = v5;
  v8 = v7;
  v10 = objc_opt_class(BSUIBooksUIComponentBox, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIBooksUIComponentBoxLayout box](self, "box"));
  v12 = TUIDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIBooksUIComponentBoxLayout box](self, "box"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rawComponentModel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIBooksUIComponentView renderModelWithIdentifier:rawComponentModel:](BSUIBooksUIComponentView, "renderModelWithIdentifier:rawComponentModel:", v15, v16));

  objc_msgSend(v17, "setSize:", v6, v8);
  return v17;
}

@end
