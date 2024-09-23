@implementation TLKActivityIndicatorView

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setAlignment:", 3);
  objc_msgSend(v3, "setSpacing:", 12.0);
  +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", self, 40.0, 40.0, 40.0, 40.0);
  objc_msgSend(v3, "setLayoutMargins:");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v4, "setHidesWhenStopped:", 0);
  objc_msgSend(v3, "addArrangedSubview:", v4);
  -[TLKActivityIndicatorView setActivityIndicator:](self, "setActivityIndicator:", v4);
  +[TLKLabel secondaryLabel](TLKLabel, "secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addArrangedSubview:", v5);
  +[TLKFontUtilities subheadFont](TLKFontUtilities, "subheadFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[TLKActivityIndicatorView setSubtitleLabel:](self, "setSubtitleLabel:", v5);
  return v3;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKActivityIndicatorView;
  -[TLKActivityIndicatorView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKActivityIndicatorView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKActivityIndicatorView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKActivityIndicatorView;
  -[TLKActivityIndicatorView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLKActivityIndicatorView;
  v4 = a3;
  -[UIView tlk_updateForAppearance:](&v8, sel_tlk_updateForAppearance_, v4);
  objc_msgSend(v4, "secondaryColor", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKActivityIndicatorView activityIndicator](self, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

  -[TLKActivityIndicatorView activityIndicator](self, "activityIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForView:", v7);

}

- (void)setSubtitle:(id)a3
{
  id v5;
  TLKMultilineText **p_subtitle;
  TLKMultilineText *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TLKMultilineText *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_subtitle = &self->_subtitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle, "setObserver:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = *p_subtitle;
      v8 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "setObserver:", 0);
            ++v11;
          }
          while (v9 != v11);
          v9 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_subtitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle, "setObserver:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = *p_subtitle;
      v14 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "setObserver:", self);
            ++v17;
          }
          while (v15 != v17);
          v15 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v15);
      }

    }
  }
  -[TLKView observer](self, "observer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TLKView observer](self, "observer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "batchUpdateCount");

    if (!v22)
    {
      -[TLKView observer](self, "observer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertiesDidChange");

    }
  }

}

- (void)observedPropertiesChanged
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TLKActivityIndicatorView subtitle](self, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKActivityIndicatorView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[TLKActivityIndicatorView activityIndicator](self, "activityIndicator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAnimating");

}

- (id)subtitleLabelText
{
  void *v2;
  void *v3;

  -[TLKActivityIndicatorView subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TLKMultilineText)subtitle
{
  return self->_subtitle;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (TLKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end
