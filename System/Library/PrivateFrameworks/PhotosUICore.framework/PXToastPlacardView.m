@implementation PXToastPlacardView

- (void)addActionWithTitle:(id)a3 action:(id)a4
{
  id v6;
  NSMutableArray *actions;
  NSMutableArray *v8;
  NSMutableArray *v9;
  _PXToastAction *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  actions = self->_actions;
  if (!actions)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = self->_actions;
    self->_actions = v8;

    actions = self->_actions;
  }
  v10 = -[_PXToastAction initWithTitle:action:]([_PXToastAction alloc], "initWithTitle:action:", v11, v6);
  -[NSMutableArray addObject:](actions, "addObject:", v10);

}

- (void)didMoveToSuperview
{
  NSMutableArray *v3;
  PXToastPlacardView *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  double v40;
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
  NSMutableArray *obj;
  uint64_t v55;
  void *v56;
  PXToastPlacardView *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _QWORD v78[6];
  _QWORD v79[4];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)PXToastPlacardView;
  -[PXToastPlacardView didMoveToSuperview](&v77, sel_didMoveToSuperview);
  if (!self->_didLoad)
  {
    self->_didLoad = 1;
    v3 = self->_actions;
    v4 = self;
    -[PXToastPlacardView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 8.0);
    LODWORD(v6) = 1050253722;
    objc_msgSend(v5, "setShadowOpacity:", v6);
    objc_msgSend(v5, "setShadowRadius:", 10.0);
    v52 = v5;
    objc_msgSend(v5, "setShadowOffset:", 3.0, 3.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXToastPlacardView setBackgroundColor:](v4, "setBackgroundColor:", v7);

    -[PXToastPlacardView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[PXToastPlacardView message](v4, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v57 = v4;
    v53 = v8;
    -[PXToastPlacardView addSubview:](v4, "addSubview:", v8);
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = v3;
    v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    v10 = 0;
    if (v58)
    {
      v55 = *(_QWORD *)v74;
      do
      {
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v74 != v55)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v11);
          v14 = (void *)MEMORY[0x1E0DC3518];
          v15 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v13, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __40__PXToastPlacardView_didMoveToSuperview__block_invoke;
          v72[3] = &unk_1E513C038;
          v72[4] = v13;
          objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v72);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "buttonWithType:primaryAction:", 1, v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[PXToastPlacardView addSubview:](v57, "addSubview:", v10);
          v18 = (void *)MEMORY[0x1E0CB3718];
          objc_msgSend(v10, "trailingAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v19;
          v64 = v18;
          v66 = v12;
          if (v12)
          {
            objc_msgSend(v12, "leadingAnchor");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = -10.0;
          }
          else
          {
            -[PXToastPlacardView trailingAnchor](v57, "trailingAnchor");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = -20.0;
          }
          v68 = (void *)v20;
          objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = v62;
          objc_msgSend(v10, "centerYAnchor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXToastPlacardView centerYAnchor](v57, "centerYAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "constraintEqualToAnchor:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v79[1] = v23;
          objc_msgSend(v10, "widthAnchor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "intrinsicContentSize");
          objc_msgSend(v24, "constraintGreaterThanOrEqualToConstant:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v79[2] = v25;
          objc_msgSend(v10, "heightAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXToastPlacardView heightAnchor](v57, "heightAnchor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v27, -40.0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v79[3] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "activateConstraints:", v29);

          ++v11;
          v12 = v10;
        }
        while (v58 != v11);
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v58);
    }

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    v34 = v33;

    if (v32 >= v34)
      v35 = v34;
    else
      v35 = v32;
    v36 = v35 + -40.0;
    v59 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v53, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXToastPlacardView leadingAnchor](v57, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v37;
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", 20.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v67;
    objc_msgSend(v53, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v38;
    v61 = v10;
    if (v10)
    {
      objc_msgSend(v10, "leadingAnchor");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = -10.0;
    }
    else
    {
      -[PXToastPlacardView trailingAnchor](v57, "trailingAnchor");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = -20.0;
    }
    v63 = (void *)v39;
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v56;
    objc_msgSend(v53, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXToastPlacardView centerYAnchor](v57, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v42;
    objc_msgSend(v53, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXToastPlacardView heightAnchor](v57, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:constant:", v44, -40.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v45;
    -[PXToastPlacardView heightAnchor](v57, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:", 80.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v78[4] = v47;
    -[PXToastPlacardView widthAnchor](v57, "widthAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToConstant:", v36);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v78[5] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v50);

  }
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

void __40__PXToastPlacardView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

@end
