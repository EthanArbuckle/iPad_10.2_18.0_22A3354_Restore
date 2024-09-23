@implementation _UIDocumentPropertiesIconView

- (_UIDocumentPropertiesIconView)initWithProperties:(id)a3 metadata:(id)a4
{
  id v8;
  _UIDocumentPropertiesIconView *v9;
  _UIDocumentPropertiesIconView *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *centerXInsetConstraint;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *trailingInsetConstraint;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *centerYInsetConstraint;
  void *v27;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *bottomInsetConstraint;
  void *v31;
  void *v32;
  UITapGestureRecognizer *v33;
  void *v35;
  id v36;
  objc_super v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata != nil"));

  }
  v37.receiver = self;
  v37.super_class = (Class)_UIDocumentPropertiesIconView;
  v9 = -[UIView init](&v37, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_properties, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
    v11 = (void *)objc_msgSend(objc_alloc((Class)getLPLinkViewClass()), "initWithMetadata:", v8);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "_setDisableTapGesture:", 1);
    objc_msgSend(v11, "_setDisableAnimations:", 1);
    objc_msgSend(v11, "_setPreferredSizeClass:", 2);
    objc_msgSend(v11, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v12 = (void *)getLPLinkRendererSizeClassParametersClass_softClass;
    v42 = getLPLinkRendererSizeClassParametersClass_softClass;
    if (!getLPLinkRendererSizeClassParametersClass_softClass)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __getLPLinkRendererSizeClassParametersClass_block_invoke;
      v38[3] = &unk_1E16B14C0;
      v38[4] = &v39;
      __getLPLinkRendererSizeClassParametersClass_block_invoke((uint64_t)v38);
      v12 = (void *)v40[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v39, 8);
    v14 = objc_alloc_init(v13);
    objc_msgSend(v14, "setOnlyShowIcon:", 1);
    objc_msgSend(v14, "setPreserveIconAspectRatioAndAlignmentWhenScaling:", 1);
    objc_msgSend(v11, "_setSizeClassParameters:", v14);
    objc_storeStrong((id *)&v10->_linkView, v11);
    -[UIView addSubview:](v10, "addSubview:", v11);
    objc_msgSend(v11, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v10, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    centerXInsetConstraint = v10->_centerXInsetConstraint;
    v10->_centerXInsetConstraint = (NSLayoutConstraint *)v17;

    objc_msgSend(v11, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v10, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    trailingInsetConstraint = v10->_trailingInsetConstraint;
    v10->_trailingInsetConstraint = (NSLayoutConstraint *)v21;

    objc_msgSend(v11, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v10, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    centerYInsetConstraint = v10->_centerYInsetConstraint;
    v10->_centerYInsetConstraint = (NSLayoutConstraint *)v25;

    objc_msgSend(v11, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v10, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    bottomInsetConstraint = v10->_bottomInsetConstraint;
    v10->_bottomInsetConstraint = (NSLayoutConstraint *)v29;

    v31 = (void *)MEMORY[0x1E0D156E0];
    v43[0] = v10->_centerXInsetConstraint;
    v43[1] = v10->_trailingInsetConstraint;
    v43[2] = v10->_centerYInsetConstraint;
    v43[3] = v10->_bottomInsetConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v32);

    -[_UIDocumentPropertiesIconView _updateImage](v10, "_updateImage");
    if (v36)
    {
      v33 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v10, sel__fireTapAction_);
      -[UIView addGestureRecognizer:](v10, "addGestureRecognizer:", v33);

    }
  }

  return v10;
}

- (_UIDocumentPropertiesIconView)initWithMetadata:(id)a3
{
  return -[_UIDocumentPropertiesIconView initWithProperties:metadata:](self, "initWithProperties:metadata:", 0, a3);
}

- (void)_updateImage
{
  -[LPLinkView setMetadata:](self->_linkView, "setMetadata:", self->_metadata);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
  -[_UIDocumentPropertiesIconView _updateImage](self, "_updateImage");
}

- (void)setIconInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double top;

  trailing = a3.trailing;
  bottom = a3.bottom;
  top = a3.top;
  self->_iconInsets = a3;
  -[NSLayoutConstraint setConstant:](self->_centerXInsetConstraint, "setConstant:", (a3.leading - a3.trailing) * 0.5);
  -[NSLayoutConstraint setConstant:](self->_trailingInsetConstraint, "setConstant:", -trailing);
  -[NSLayoutConstraint setConstant:](self->_centerYInsetConstraint, "setConstant:", (top - bottom) * 0.5);
  -[NSLayoutConstraint setConstant:](self->_bottomInsetConstraint, "setConstant:", -bottom);
}

- (void)_fireTapAction:(id)a3
{
  void *v4;
  id v5;

  -[UIDocumentProperties iconRepresentationAction](self->_properties, "iconRepresentationAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "performWithSender:target:", self, 0);
    v4 = v5;
  }

}

- (id)_preferredSender
{
  void *v2;
  uint64_t v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSDirectionalEdgeInsets)iconInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_iconInsets.top;
  leading = self->_iconInsets.leading;
  bottom = self->_iconInsets.bottom;
  trailing = self->_iconInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_centerYInsetConstraint, 0);
  objc_storeStrong((id *)&self->_trailingInsetConstraint, 0);
  objc_storeStrong((id *)&self->_centerXInsetConstraint, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
