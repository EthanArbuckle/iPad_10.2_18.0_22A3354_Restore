@implementation _UIDragPreviewBlockProvider

+ (id)previewProviderWithBlock:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIDragPreview.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previewProviderBlock"));

  }
  objc_opt_class();
  v6 = (_QWORD *)objc_opt_new();
  v7 = _Block_copy(v5);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (UIDragPreview)preview
{
  void (**preview)(void *, SEL);
  UIDragPreview *v4;
  UIDragPreview *v5;
  id previewProviderBlock;

  preview = (void (**)(void *, SEL))self->_preview;
  if (!preview)
  {
    preview = (void (**)(void *, SEL))self->_previewProviderBlock;
    if (preview)
    {
      preview[2](preview, a2);
      v4 = (UIDragPreview *)objc_claimAutoreleasedReturnValue();
      v5 = self->_preview;
      self->_preview = v4;

      previewProviderBlock = self->_previewProviderBlock;
      self->_previewProviderBlock = 0;

      preview = (void (**)(void *, SEL))self->_preview;
    }
  }
  return (UIDragPreview *)preview;
}

- (id)_duiPreview
{
  void *v2;
  void *v3;

  -[_UIDragPreviewBlockProvider preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_duiPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageComponent
{
  _UIDraggingImageComponent *imageComponent;
  _UIDraggingImageComponent *v4;
  _UIDraggingImageComponent *v5;

  imageComponent = self->_imageComponent;
  if (!imageComponent)
  {
    -[_UIDragPreviewBlockProvider _createImageComponent](self, "_createImageComponent");
    v4 = (_UIDraggingImageComponent *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageComponent;
    self->_imageComponent = v4;

    imageComponent = self->_imageComponent;
  }
  return imageComponent;
}

- (id)_createImageComponent
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  _UIDraggingImageComponent *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  _BOOL4 CanBeRenderedAfterCommit;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  UIGraphicsImageRenderer *v25;
  _QWORD v27[4];
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;

  -[_UIDragPreviewBlockProvider preview](self, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDragPreviewBlockProvider preview](self, "preview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_4;
    -[_UIDragPreviewBlockProvider preview](self, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dragPreviewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageComponent");
    v8 = (_UIDraggingImageComponent *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_4:
      -[_UIDragPreviewBlockProvider preview](self, "preview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "parameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_previewMode");

      if ((unint64_t)(v12 - 3) > 1)
      {
        if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
          v13 = 0;
        else
          v13 = objc_msgSend(v9, "_preventAfterScreenUpdatesSnapshot") ^ 1;
        CanBeRenderedAfterCommit = _UIViewCanBeRenderedAfterCommit(v10, v13);
        v15 = objc_msgSend(v10, "accessibilityIgnoresInvertColors");
        objc_msgSend(v10, "bounds");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        if (!CanBeRenderedAfterCommit
          || (_UIRenderViewImageAfterCommit(v10, 0, v13), (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v25 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v21, v23);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __52___UIDragPreviewBlockProvider__createImageComponent__block_invoke;
          v27[3] = &unk_1E16B55B8;
          v29 = v17;
          v30 = v19;
          v31 = v21;
          v32 = v23;
          v28 = v10;
          -[UIGraphicsImageRenderer imageWithActions:](v25, "imageWithActions:", v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v8 = -[_UIDraggingImageComponent initWithImage:frame:ignoreAccessibilityFilters:]([_UIDraggingImageComponent alloc], "initWithImage:frame:ignoreAccessibilityFilters:", v24, v15, v17, v19, v21, v23);

      }
      else
      {
        v8 = -[_UIDraggingImageComponent initWithView:]([_UIDraggingImageComponent alloc], "initWithView:", v10);
      }

    }
  }
  else
  {
    v8 = -[_UIDraggingImageComponent initHidingDragImage]([_UIDraggingImageComponent alloc], "initHidingDragImage");
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong(&self->_previewProviderBlock, 0);
}

@end
