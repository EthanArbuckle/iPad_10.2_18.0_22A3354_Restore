@implementation PUFilmstripIndicatorTileController

- (id)loadView
{
  PUPlayheadView *v2;

  v2 = [PUPlayheadView alloc];
  return -[PUPlayheadView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)applyLayoutInfo:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUFilmstripIndicatorTileController;
  -[PUTileViewController applyLayoutInfo:](&v14, sel_applyLayoutInfo_, v5);
  v6 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripView.m"), 765, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layoutInfo"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripView.m"), 765, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layoutInfo"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v6, "highlightColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredHighlightColor:", v7);

}

@end
