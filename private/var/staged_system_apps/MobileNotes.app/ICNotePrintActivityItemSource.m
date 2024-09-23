@implementation ICNotePrintActivityItemSource

- (ICNotePrintActivityItemSource)initWithNote:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  ICNotePrintActivityItemSource *v8;
  ICNotePrintActivityItemSource *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNotePrintActivityItemSource;
  v8 = -[ICNotePrintActivityItemSource init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[ICNotePrintActivityItemSource setNote:](v8, "setNote:", v7);
    -[ICNotePrintActivityItemSource setSize:](v9, "setSize:", width, height);
  }

  return v9;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePrintActivityItemSource note](self, "note"));
  v7 = objc_msgSend(v6, "isSharable");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollectionByModifyingTraits:", &stru_100554D58));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePrintActivityItemSource note](self, "note"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textStorage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styler"));

    if (!v12)
    {
      v13 = objc_alloc_init((Class)ICTextController);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePrintActivityItemSource note](self, "note"));
      -[ICNotePrintActivityItemSource size](self, "size");
      v15 = +[ICTextViewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:](ICTextViewController, "createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:", v13, 0, v14, 0, 0, v9);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePrintActivityItemSource note](self, "note"));
    -[ICNotePrintActivityItemSource size](self, "size");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewController printFormatterForNote:withSize:traitCollection:](ICTextViewController, "printFormatterForNote:withSize:traitCollection:", v16, v9));

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_alloc_init((Class)UIPrintFormatter);
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (void)setNote:(id)a3
{
  objc_storeWeak((id *)&self->_note, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_note);
}

@end
