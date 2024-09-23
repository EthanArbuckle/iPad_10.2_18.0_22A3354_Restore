@implementation VSFooterMessageView

- (VSFooterMessageView)initWithSpecifier:(id)a3
{
  id v4;
  VSFooterMessageView *v5;
  VSFontCenter *v6;
  VSFontCenter *fontCenter;
  void *v8;
  uint64_t v9;
  NSString *primaryMessage;
  void *v11;
  uint64_t v12;
  NSString *secondaryMessage;
  void *v14;
  uint64_t v15;
  NSString *tertiaryMessage;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  VSFontCenter *v24;
  void *v25;
  VSFontCenter *v26;
  void *v27;
  VSFontCenter *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v64;
  id v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _QWORD v72[3];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSRequireMainThread();
  v5 = -[VSFooterMessageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = -[VSFontCenter initWithTraitEnvironment:]([VSFontCenter alloc], "initWithTraitEnvironment:", v5);
    fontCenter = v5->_fontCenter;
    v5->_fontCenter = v6;

    objc_msgSend(v4, "propertyForKey:", CFSTR("VSFooterPrimaryMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    primaryMessage = v5->_primaryMessage;
    v5->_primaryMessage = (NSString *)v9;

    objc_msgSend(v4, "propertyForKey:", CFSTR("VSFooterSecondaryMessage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    secondaryMessage = v5->_secondaryMessage;
    v5->_secondaryMessage = (NSString *)v12;

    objc_msgSend(v4, "propertyForKey:", CFSTR("VSFooterTertiaryMessage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    tertiaryMessage = v5->_tertiaryMessage;
    v5->_tertiaryMessage = (NSString *)v15;

    v17 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v65 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v66 = v17;
    v72[0] = v17;
    v72[1] = v65;
    v64 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v72[2] = v64;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v68 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v23, "setNumberOfLines:", 0);
          objc_msgSend(v23, "setTextAlignment:", 1);
          objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[VSFooterMessageView addSubview:](v5, "addSubview:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v20);
    }

    objc_msgSend(v66, "setText:", v5->_primaryMessage);
    objc_msgSend(v65, "setText:", v5->_secondaryMessage);
    objc_msgSend(v64, "setText:", v5->_tertiaryMessage);
    v24 = v5->_fontCenter;
    VSMainConcurrencyBindingOptions();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v24, CFSTR("bodyFont"), v25);

    v26 = v5->_fontCenter;
    VSMainConcurrencyBindingOptions();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v26, CFSTR("footnoteFont"), v27);

    v28 = v5->_fontCenter;
    VSMainConcurrencyBindingOptions();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v28, CFSTR("footnoteFont"), v29);

    v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v66, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView topAnchor](v5, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v33);

    objc_msgSend(v64, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView bottomAnchor](v5, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v36);

    objc_msgSend(v66, "lastBaselineAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "firstBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -48.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v39);

    objc_msgSend(v65, "lastBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "firstBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -43.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v42);

    objc_msgSend(v66, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView centerXAnchor](v5, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v45);

    objc_msgSend(v65, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView centerXAnchor](v5, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v48);

    objc_msgSend(v64, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView centerXAnchor](v5, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v51);

    objc_msgSend(v66, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView widthAnchor](v5, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:constant:", v53, -40.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v54);

    objc_msgSend(v65, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView widthAnchor](v5, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:constant:", v56, -40.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v57);

    objc_msgSend(v64, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSFooterMessageView widthAnchor](v5, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:constant:", v59, -40.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v60);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v30);
    v71 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (id)-[VSFooterMessageView registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v61, &__block_literal_global_17);

  }
  return v5;
}

void __41__VSFooterMessageView_initWithSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "fontCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTraitCollection:", v3);
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSFooterMessageView;
  -[VSFooterMessageView dealloc](&v3, sel_dealloc);
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1144766464;
  LODWORD(v4) = 1.0;
  -[VSFooterMessageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 1.79769313e308, v3, v4);
  return v5;
}

- (NSString)primaryMessage
{
  return self->_primaryMessage;
}

- (void)setPrimaryMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)secondaryMessage
{
  return self->_secondaryMessage;
}

- (void)setSecondaryMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)tertiaryMessage
{
  return self->_tertiaryMessage;
}

- (void)setTertiaryMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
  objc_storeStrong((id *)&self->_fontCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_tertiaryMessage, 0);
  objc_storeStrong((id *)&self->_secondaryMessage, 0);
  objc_storeStrong((id *)&self->_primaryMessage, 0);
}

@end
