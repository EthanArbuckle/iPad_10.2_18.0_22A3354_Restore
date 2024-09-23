@implementation _TVOrganizerView

- (_TVOrganizerView)initWithFrame:(CGRect)a3
{
  _TVOrganizerView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVOrganizerView;
  v3 = -[_TVFocusRedirectView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVOrganizerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[_TVOrganizerView setOpaque:](v3, "setOpaque:", 0);
    -[_TVFocusRedirectView containerGuide](v3, "containerGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

    v3->_remembersLastFocusedItem = 0;
  }
  return v3;
}

- (void)setPreferredFocusedComponent:(id)a3
{
  objc_storeWeak((id *)&self->_lastFocusedView, a3);
}

- (UIView)preferredFocusedComponent
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_lastFocusedView);
}

- (void)setComponentsNeedUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x24BDBF148], v8);
  objc_msgSend(v5, "valueWithCGSize:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, &unk_24EBCCC28);

  v10 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v7, v8);
  objc_msgSend(v10, "valueWithCGSize:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, &unk_24EBCCC40);

  v13 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v7, v8);
  objc_msgSend(v13, "valueWithCGSize:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, &unk_24EBCCC58);

  v16 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v7, v8);
  objc_msgSend(v16, "valueWithCGSize:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, &unk_24EBCCC70);

  v19 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", v7, v8);
  objc_msgSend(v19, "valueWithCGSize:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, &unk_24EBCCC88);

  v22 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeThatFits:", v7, v8);
  objc_msgSend(v22, "valueWithCGSize:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, &unk_24EBCCCA0);

  -[_TVOrganizerView setDivSizesByPosition:](self, "setDivSizesByPosition:", v4);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "setComponentsNeedUpdate");
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v27);
  }

  -[_TVOrganizerView setNeedsLayout](self, "setNeedsLayout");
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[_TVOrganizerView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[_TVOrganizerView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setBackgroundImageView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundImageView;
  UIView *backgroundImageView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_backgroundImageView = &self->_backgroundImageView;
  backgroundImageView = self->_backgroundImageView;
  v8 = v5;
  if (backgroundImageView != v5)
  {
    -[UIView removeFromSuperview](backgroundImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundImageView, a3);
    if (*p_backgroundImageView)
      -[_TVOrganizerView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundImageView, 0);
  }
  -[_TVOrganizerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setRemembersLastFocusedItem:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_remembersLastFocusedItem = a3;
  -[_TVFocusRedirectView containerGuide](self, "containerGuide");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setComponents:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _TVOrganizerView *v30;
  uint64_t j;
  void *v32;
  void *v33;
  _TVOrganizerCellView *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
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
  void *v62;
  void *v63;
  void *v64;
  id obj;
  _TVOrganizerView *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_components, a3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCEB8];
  v66 = self;
  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          v16 = -[_TVOrganizerView _positionFromView:](v66, "_positionFromView:", v15);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v18, v19);

          }
          objc_msgSend(v18, "addObject:", v15);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObject:", v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v68, "count"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v68, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v70;
    v26 = *MEMORY[0x24BDBF090];
    v27 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v28 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v29 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v30 = v66;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v70 != v25)
          objc_enumerationMutation(v21);
        v32 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
        if ((objc_msgSend(v9, "containsObject:", v32) & 1) != 0
          || (-[_TVOrganizerView divsByPosition](v30, "divsByPosition"),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v33, "objectForKeyedSubscript:", v32),
              v34 = (_TVOrganizerCellView *)objc_claimAutoreleasedReturnValue(),
              v33,
              !v34))
        {
          if (v24 >= objc_msgSend(v9, "count"))
          {
            v34 = -[_TVOrganizerCellView initWithFrame:]([_TVOrganizerCellView alloc], "initWithFrame:", v26, v27, v28, v29);
          }
          else
          {
            -[_TVOrganizerView divsByPosition](v30, "divsByPosition");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v24 + 1;
            objc_msgSend(v9, "objectAtIndexedSubscript:", v24);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v37);
            v34 = (_TVOrganizerCellView *)objc_claimAutoreleasedReturnValue();

            v24 = v36;
            v30 = v66;
          }
        }
        objc_msgSend(v68, "objectForKeyedSubscript:", v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVOrganizerCellView setComponents:](v34, "setComponents:", v38);

        v39 = objc_msgSend(v32, "integerValue") - 1;
        if (v39 <= 0xA)
          -[_TVOrganizerCellView setContentVerticalAlignment:](v34, "setContentVerticalAlignment:", qword_222E773F0[v39]);
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v34, v32);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
    v30 = v66;
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v67, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x24BDBF148];
  v44 = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v42, "sizeThatFits:", *MEMORY[0x24BDBF148], v44);
  objc_msgSend(v41, "valueWithCGSize:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, &unk_24EBCCC28);

  v46 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v67, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sizeThatFits:", v43, v44);
  objc_msgSend(v46, "valueWithCGSize:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v48, &unk_24EBCCC40);

  v49 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v67, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sizeThatFits:", v43, v44);
  objc_msgSend(v49, "valueWithCGSize:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v51, &unk_24EBCCC58);

  v52 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v67, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sizeThatFits:", v43, v44);
  objc_msgSend(v52, "valueWithCGSize:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v54, &unk_24EBCCC70);

  v55 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v67, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sizeThatFits:", v43, v44);
  objc_msgSend(v55, "valueWithCGSize:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v57, &unk_24EBCCC88);

  v58 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v67, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sizeThatFits:", v43, v44);
  objc_msgSend(v58, "valueWithCGSize:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v60, &unk_24EBCCCA0);

  while (v24 < objc_msgSend(v9, "count"))
  {
    -[_TVOrganizerView divsByPosition](v30, "divsByPosition");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v24);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "removeFromSuperview");

    ++v24;
  }
  -[_TVOrganizerView constraints](v30, "constraints");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVOrganizerView removeConstraints:](v30, "removeConstraints:", v64);

  -[_TVOrganizerView setDivsByPosition:](v30, "setDivsByPosition:", v67);
  -[_TVOrganizerView setDivSizesByPosition:](v30, "setDivSizesByPosition:", v40);
  -[_TVOrganizerView setNeedsLayout](v30, "setNeedsLayout");

}

- (void)setColumnDividerPadding:(double)a3
{
  self->_columnDividerPadding = a3;
}

- (void)setColumnDividersEnabled:(BOOL)a3
{
  UIView *rightColumnDivider;
  UIView *v5;
  UIView *leftColumnDivider;
  UIView *v7;
  UIView *v8;
  UIView *v9;

  self->_columnDividersEnabled = a3;
  rightColumnDivider = self->_rightColumnDivider;
  if (!a3)
  {
    -[UIView removeFromSuperview](rightColumnDivider, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_leftColumnDivider, "removeFromSuperview");
    v5 = self->_rightColumnDivider;
    self->_rightColumnDivider = 0;

    leftColumnDivider = self->_leftColumnDivider;
    self->_leftColumnDivider = 0;
LABEL_6:

    return;
  }
  if (!rightColumnDivider)
  {
    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    v8 = self->_leftColumnDivider;
    self->_leftColumnDivider = v7;

    v9 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    leftColumnDivider = self->_rightColumnDivider;
    self->_rightColumnDivider = v9;
    goto LABEL_6;
  }
}

- (UIEdgeInsets)tv_alignmentInsetsForExpectedWidth:(double)a3
{
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  void *v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  _QWORD v153[3];
  _QWORD v154[3];
  _QWORD v155[3];
  _QWORD v156[3];
  _QWORD v157[3];
  _QWORD v158[5];
  UIEdgeInsets result;

  v158[3] = *MEMORY[0x24BDAC8D0];
  v5 = (double *)MEMORY[0x24BDF7718];
  -[UIView tv_padding](self, "tv_padding");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = a3 - (v8 + v12);
  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", &unk_24EBCCCB8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", &unk_24EBCCCD0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_24EBCCCE8);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", &unk_24EBCCD00);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", &unk_24EBCCD18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v151 = v31;
  if (v16)
  {
    objc_msgSend(v16, "components");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "tv_alignmentInsetsForExpectedWidth:", v14);
    v35 = v34;
    objc_msgSend(v33, "tv_margin");
    v37 = v35 + v36;

    v31 = v151;
  }
  else
  {
    v37 = *v5;
  }
  v38 = v5[2];
  v39 = v147;
  if (v31)
  {
    objc_msgSend(v31, "components");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "tv_alignmentInsetsForExpectedWidth:", v14);
    v43 = v42;
    objc_msgSend(v41, "tv_margin");
    v37 = v43 + v44;

    v45 = v151;
    if (v16)
      goto LABEL_52;
  }
  v141 = v37;
  v142 = v38;
  v143 = v13;
  v144 = v9;
  v145 = v7;
  v146 = v11;
  -[_TVOrganizerView divSizesByPosition](self, "divSizesByPosition");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "CGSizeValue");
  v137 = v48;
  v139 = v49;

  objc_msgSend(v46, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "CGSizeValue");
  v134 = v51;
  v136 = v52;

  objc_msgSend(v46, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "CGSizeValue");
  v132 = v54;
  v56 = v55;

  objc_msgSend(v46, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "CGSizeValue");
  v58 = v14;
  v60 = v59;
  v62 = v61;

  objc_msgSend(v46, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "CGSizeValue");
  v65 = v64;
  v67 = v66;

  objc_msgSend(v46, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "CGSizeValue");
  v70 = v69;
  v72 = v71;

  v73 = fmax(v65, v60);
  v74 = v62;
  v75 = v58 - (fmax(v137, fmax(v134, v132)) + fmax(v70, v73));
  if (v75 >= 0.0)
    v76 = v75;
  else
    v76 = 0.0;
  objc_msgSend(v20, "sizeThatFits:", v76);
  v78 = v77;
  objc_msgSend(v147, "sizeThatFits:", v76, 0.0);
  v80 = v79;
  objc_msgSend(v152, "sizeThatFits:", v76, 0.0);
  v128 = v56;
  v81 = v139 + v136 + v56;
  v83 = v82;
  v138 = v67;
  v133 = v74;
  v135 = v72;
  v84 = fmax(v81, fmax(v78 + v80 + v82, v74 + v67 + v72));
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v85;
  v131 = v18;
  v129 = v24;
  if (v18 || v24 || v149)
  {
    if (v18)
      v88 = (uint64_t)v18;
    else
      v88 = v85;
    if (v24)
      v89 = (uint64_t)v24;
    else
      v89 = v85;
    v158[0] = v88;
    v158[1] = v89;
    v90 = (uint64_t)v149;
    if (!v149)
      v90 = v85;
    v158[2] = v90;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v158, 3);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v139);
    v92 = v16;
    v93 = v22;
    v94 = v20;
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v157[0] = v95;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v136);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v157[1] = v96;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v128);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v157[2] = v97;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 3);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(v84, (uint64_t)v98, v91, v98);
    v87 = v99;

    v20 = v94;
    v22 = v93;
    v16 = v92;
    v39 = v147;

  }
  else
  {
    v87 = 1.79769313e308;
    v140 = 1.79769313e308;
  }
  v37 = v141;
  v130 = v20;
  if (v20 || v39 || v152)
  {
    if (v20)
      v102 = v20;
    else
      v102 = v86;
    if (v39)
      v103 = v39;
    else
      v103 = v86;
    v156[0] = v102;
    v156[1] = v103;
    v104 = v152;
    if (!v152)
      v104 = v86;
    v156[2] = v104;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156, 3);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v78);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v155[0] = v106;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v80);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v155[1] = v107;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v83);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v155[2] = v108;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 3);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(v84, (uint64_t)v109, v105, v109);
    v100 = v110;

    if (v22)
      goto LABEL_39;
  }
  else
  {
    v100 = 1.79769313e308;
    v101 = 1.79769313e308;
    if (v22)
      goto LABEL_39;
  }
  if (v150 || v148)
  {
LABEL_39:
    if (v22)
      v113 = v22;
    else
      v113 = v86;
    v114 = v150;
    if (!v150)
      v114 = v86;
    v154[0] = v113;
    v154[1] = v114;
    v115 = v148;
    if (!v148)
      v115 = v86;
    v154[2] = v115;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 3);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v135);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = v117;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v138);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v153[1] = v118;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v133);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v153[2] = v119;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v153, 3);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(v84, (uint64_t)v120, v116, v120);
    v111 = v121;

    goto LABEL_47;
  }
  v111 = 1.79769313e308;
  v112 = 1.79769313e308;
LABEL_47:
  v5 = (double *)MEMORY[0x24BDF7718];
  v20 = v130;
  v18 = v131;
  v24 = v129;
  v45 = v151;
  v122 = fmin(v140, fmin(v101, v112));
  if (!v16)
    v37 = v122;
  v123 = fmin(v87, fmin(v100, v111));
  v38 = v142;
  if (!v151)
    v38 = v123;

  v7 = v145;
  v11 = v146;
  v13 = v143;
  v9 = v144;
LABEL_52:

  v124 = v7 + v37;
  v125 = v5[1] + v9;
  v126 = v5[3] + v13;
  v127 = v11 + v38;
  result.right = v126;
  result.bottom = v127;
  result.left = v125;
  result.top = v124;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView tv_itemWidth](self, "tv_itemWidth");
  v7 = v6;
  -[UIView tv_itemHeight](self, "tv_itemHeight");
  v9 = v8;
  if (v7 > 0.0)
    width = v7;
  if (v8 > 0.0)
    height = v8;
  -[_TVOrganizerView backgroundImageView](self, "backgroundImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_TVOrganizerView backgroundImageView](self, "backgroundImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", width, height);
    v28 = v13;
    v30 = v12;

  }
  else
  {
    v28 = *(_QWORD *)(MEMORY[0x24BDBF148] + 8);
    v30 = *MEMORY[0x24BDBF148];
  }
  -[UIView tv_padding](self, "tv_padding", v28, v30);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = width - (v16 + v20);
  v23 = height - (v15 + v18);
  if (v22 < 0.0)
    v22 = 0.0;
  if (v23 < 0.0)
    v23 = 0.0;
  -[_TVOrganizerView _contentSizeThatFits:](self, "_contentSizeThatFits:", v22, v23);
  v26 = fmax(v21 + v17 + v24, v31);
  v27 = fmax(v19 + v15 + v25, v29);
  if (v7 > 0.0)
    v26 = v7;
  if (v9 > 0.0)
    v27 = v9;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _TVOrganizerView *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  CGFloat v30;
  double height;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD, __n128, double);
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double *v87;
  __n128 v88;
  double *v89;
  float v90;
  double v91;
  float v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  id v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[18];
  _QWORD v112[16];
  _QWORD v113[4];
  id v114;
  uint64_t v115;
  double *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double *v120;
  uint64_t v121;
  uint64_t v122;
  objc_super v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;

  v123.receiver = self;
  v123.super_class = (Class)_TVOrganizerView;
  -[_TVFocusRedirectView layoutSubviews](&v123, sel_layoutSubviews);
  -[_TVOrganizerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_TVOrganizerView divsByPosition](self, "divsByPosition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVOrganizerView divSizesByPosition](self, "divSizesByPosition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVOrganizerView backgroundImageView](self, "backgroundImageView");
  v13 = objc_claimAutoreleasedReturnValue();
  v103 = v8;
  objc_msgSend((id)v13, "setFrame:", v4, v6, v8, v10);

  v14 = self;
  -[_TVOrganizerView backgroundImageView](v14, "backgroundImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  v16 = v14;
  if ((v13 & 1) != 0)
  {
    -[_TVOrganizerView backgroundImageView](v14, "backgroundImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIView tv_padding](v14, "tv_padding");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = v8 - (v20 + v24);
  v104 = v10;
  v27 = v10 - (v18 + v22);
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCCB8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCD18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v26;
  if (v28)
  {
    objc_msgSend(v28, "sizeThatFits:", v26, 0.0);
    v124.size.height = v30;
    v124.origin.x = v21;
    v124.origin.y = v19;
    v124.size.width = v26;
    v125 = CGRectIntegral(v124);
    height = v125.size.height;
    objc_msgSend(v28, "setFrame:", v125.origin.x, v125.origin.y, v125.size.width);
    objc_msgSend(v16, "addSubview:", v28);
    v19 = v19 + height;
    v27 = v27 - height;
  }
  v97 = v29;
  v98 = v28;
  v107 = v4;
  if (v29)
  {
    objc_msgSend(v29, "sizeThatFits:", v102, 0.0);
    v126.size.height = v32;
    v33 = v104;
    v126.origin.y = v104 - v23 - v32;
    v126.origin.x = v21;
    v126.size.width = v102;
    v127 = CGRectIntegral(v126);
    v34 = v127.size.height;
    objc_msgSend(v29, "setFrame:", v127.origin.x, v127.origin.y, v127.size.width);
    objc_msgSend(v16, "addSubview:", v29);
    v23 = v23 + v34;
    v27 = v27 - v34;
  }
  else
  {
    v33 = v104;
  }
  v99 = v27;
  v119 = 0;
  v120 = (double *)&v119;
  v121 = 0x2020000000;
  v122 = 0;
  v115 = 0;
  v116 = (double *)&v115;
  v117 = 0x2020000000;
  v118 = 0;
  v35 = v25;
  v36 = (v21 - v25) * 0.5;
  v37 = MEMORY[0x24BDAC760];
  v113[0] = MEMORY[0x24BDAC760];
  v113[1] = 3221225472;
  v113[2] = __34___TVOrganizerView_layoutSubviews__block_invoke;
  v113[3] = &unk_24EB86E50;
  v101 = v16;
  v114 = v101;
  v38 = (void (**)(_QWORD, _QWORD, __n128, double))MEMORY[0x22767F470](v113);
  v112[0] = v37;
  v112[1] = 3221225472;
  v112[2] = __34___TVOrganizerView_layoutSubviews__block_invoke_2;
  v112[3] = &__block_descriptor_128_e38_v32__0__UIView_8__UIView_16__UIView_24l;
  *(double *)&v112[4] = v107;
  *(double *)&v112[5] = v6;
  *(double *)&v112[6] = v103;
  *(double *)&v112[7] = v33;
  *(double *)&v112[8] = v19;
  *(double *)&v112[9] = v21;
  *(double *)&v112[10] = v23;
  *(double *)&v112[11] = v35;
  *(double *)&v112[12] = v102;
  *(double *)&v112[13] = v99;
  *(double *)&v112[14] = v36;
  *(double *)&v112[15] = (v19 - v23) * 0.5;
  v39 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22767F470](v112);
  v111[0] = v37;
  v111[1] = 3221225472;
  v111[2] = __34___TVOrganizerView_layoutSubviews__block_invoke_3;
  v111[3] = &unk_24EB86E98;
  *(double *)&v111[6] = v107;
  *(double *)&v111[7] = v6;
  *(double *)&v111[8] = v103;
  *(double *)&v111[9] = v104;
  *(double *)&v111[10] = v19;
  *(double *)&v111[11] = v21;
  *(double *)&v111[12] = v23;
  *(double *)&v111[13] = v35;
  *(double *)&v111[14] = v102;
  *(double *)&v111[15] = v99;
  v111[4] = &v119;
  v111[5] = &v115;
  *(double *)&v111[16] = v36;
  *(double *)&v111[17] = (v19 - v23) * 0.5;
  v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22767F470](v111);
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCCD0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCCE8);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCD00);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "CGSizeValue");
  v46 = v45;
  v48 = v47;

  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "CGSizeValue");
  v51 = v50;
  v53 = v52;

  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "CGSizeValue");
  v96 = v55;
  v57 = v56;

  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "CGSizeValue");
  v95 = v59;
  v61 = v60;

  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "CGSizeValue");
  v94 = v63;
  v65 = v64;

  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "CGSizeValue");
  v93 = v67;
  v69 = v68;

  v70 = v120;
  v120[3] = fmax(v46, fmax(v57, v65));
  v71 = fmax(v51, fmax(v61, v69));
  v116[3] = v71;
  if (v14->_rightColumnDivider)
  {
    -[UIView setFrame:](v14->_leftColumnDivider, "setFrame:", v70[3], v14->_columnDividerPadding, 1.0, v104 + v14->_columnDividerPadding * -2.0);
    -[UIView setFrame:](v14->_rightColumnDivider, "setFrame:", v103 - v116[3], v14->_columnDividerPadding, 1.0, v104 + v14->_columnDividerPadding * -2.0);
    -[UIView setBackgroundColor:](v14->_rightColumnDivider, "setBackgroundColor:", v14->_columnDividerColor);
    -[UIView setBackgroundColor:](v14->_leftColumnDivider, "setBackgroundColor:", v14->_columnDividerColor);
    objc_msgSend(v101, "addSubview:", v14->_leftColumnDivider);
    objc_msgSend(v101, "addSubview:", v14->_rightColumnDivider);
    v72 = v53;
    v70 = v120;
    v71 = v116[3];
  }
  else
  {
    v72 = v53;
  }
  v73 = v102 - (v70[3] + v71);
  if (v73 > 0.0)
    v74 = v73;
  else
    v74 = 0.0;
  objc_msgSend(v42, "sizeThatFits:", v74);
  v76 = v75;
  v78 = v77;
  objc_msgSend(v110, "sizeThatFits:", v74, 0.0);
  v80 = v79;
  v82 = v81;
  objc_msgSend(v43, "sizeThatFits:", v74, 0.0);
  v83 = v88.n128_f64[0];
  v85 = v84;
  v86 = fmax(v76, fmax(v80, v88.n128_f64[0]));
  v87 = v120;
  v88.n128_f64[0] = v120[3];
  v89 = v116;
  if (v86 < v102 + fmax(v88.n128_f64[0], v116[3]) * -2.0)
  {
    v90 = -(v88.n128_f64[0] + v86 * 0.5 - v102 * 0.5);
    v120[3] = v88.n128_f64[0] + floorf(v90);
    v91 = v89[3];
    v92 = -(v91 + v86 * 0.5 - v102 * 0.5);
    v89[3] = v91 + floorf(v92);
    v88.n128_f64[0] = v87[3];
  }
  ((void (**)(_QWORD, void *, __n128, double))v38)[2](v38, v41, v88, v48);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v42, v76, v78);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v100, v116[3], v72);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v109, v120[3], v96);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v110, v80, v82);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v108, v116[3], v95);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v106, v120[3], v94);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v43, v83, v85);
  ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v38[2])(v38, v105, v116[3], v93);
  ((void (**)(_QWORD, void *, void *, void *))v40)[2](v40, v41, v42, v100);
  ((void (**)(_QWORD, void *, void *, void *))v40)[2](v40, v109, v110, v108);
  ((void (**)(_QWORD, void *, void *, void *))v40)[2](v40, v106, v43, v105);
  ((void (**)(_QWORD, void *, void *, void *))v39)[2](v39, v41, v109, v106);
  ((void (**)(_QWORD, void *, void *, void *))v39)[2](v39, v42, v110, v43);
  ((void (**)(_QWORD, void *, void *, void *))v39)[2](v39, v100, v108, v105);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  BOOL v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a4;
  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke;
  v22[3] = &unk_24EB86EC0;
  v9 = v8;
  v23 = v9;
  v24 = v5;
  v25 = v6;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v22);
  if (-[UIView tv_showOnHighlight](self->_backgroundImageView, "tv_showOnHighlight"))
    ((void (**)(_QWORD, UIView *))v10)[2](v10, self->_backgroundImageView);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_components;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "setHighlighted:animated:withAnimationCoordinator:", v6, v5, v9);
        if (objc_msgSend(v15, "tv_showOnHighlight"))
          ((void (**)(_QWORD, void *))v10)[2](v10, v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "setHighlighted:", v6);
          objc_msgSend(v15, "valueForTVViewStyle:", CFSTR("tv-text-highlight-style"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("marquee-on-highlight")))
          {
            objc_msgSend(v15, "setMarqueeEnabled:", v6);
            objc_msgSend(v15, "setMarqueeRunning:", v6);
            if (!v6)
              objc_msgSend(v15, "setLineBreakMode:", 4);
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v15, "setSelected:animated:", v6, v5);
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[_TVOrganizerView setSelected:animated:withAnimationCoordinator:](self, "setSelected:animated:withAnimationCoordinator:", a3, a4, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_components;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          objc_msgSend(v9, "setHighlighted:", v3, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);
  if (WeakRetained)
    goto LABEL_2;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_TVOrganizerView components](self, "components", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "preferredFocusEnvironments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "canBecomeFocused"))
        {

          goto LABEL_13;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  WeakRetained = v11;
  if (v11)
  {
LABEL_2:
    v17 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  id obj;

  objc_msgSend(a3, "nextFocusedView");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "isDescendantOfView:", self))
  {
    objc_msgSend(obj, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(obj, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_lastFocusedView, v7);

    }
    else
    {
      objc_storeWeak((id *)&self->_lastFocusedView, obj);
    }
  }

}

- (CGSize)_contentSizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGSize result;

  width = a3.width;
  -[_TVOrganizerView divsByPosition](self, "divsByPosition", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVOrganizerView divSizesByPosition](self, "divSizesByPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24EBCCC28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGSizeValue");
  v9 = v8;
  v66 = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24EBCCC40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGSizeValue");
  v13 = v12;
  v65 = v14;

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24EBCCC58);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGSizeValue");
  v17 = v16;
  v64 = v18;

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24EBCCCA0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CGSizeValue");
  v21 = v20;
  v63 = v22;

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24EBCCC88);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "CGSizeValue");
  v25 = v24;
  v62 = v26;

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24EBCCC70);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "CGSizeValue");
  v29 = v28;
  v61 = v30;

  v31 = fmax(v9, fmax(v13, v17));
  v32 = fmax(v29, fmax(v25, v21));
  if (width - (v31 + v32) >= 0.0)
    v33 = width - (v31 + v32);
  else
    v33 = 0.0;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24EBCCCD0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sizeThatFits:", v33, 0.0);
  v59 = v35;
  v60 = v36;

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24EBCCCE8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sizeThatFits:", v33, 0.0);
  v39 = v38;
  v41 = v40;

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24EBCCD00);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sizeThatFits:", v33, 0.0);
  v44 = v43;
  v46 = v45;

  v47 = fmax(v59, fmax(v39, v44));
  if (v47 < v33 && v32 > 0.0 && v31 > 0.0)
    v47 = v33;
  v50 = v31 + v32 + v47;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24EBCCCB8, *(_QWORD *)&v59);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sizeThatFits:", v50, 0.0);
  v53 = v52;

  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24EBCCD18);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sizeThatFits:", v50, 0.0);
  v56 = v55;

  v57 = v50;
  v58 = fmax(v66 + v65 + v64, fmax(v60 + v41 + v46, v63 + v62 + v61)) + v53 + v56;
  result.height = v58;
  result.width = v57;
  return result;
}

- (int64_t)_positionFromView:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "tv_position");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSObject tv_associatedIKViewElement](self, "tv_associatedIKViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_TVOrganizerView components](self, "components", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "tv_impressionableElementsForDocument:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (double)columnDividerPadding
{
  return self->_columnDividerPadding;
}

- (BOOL)columnDividersEnabled
{
  return self->_columnDividersEnabled;
}

- (UIColor)columnDividerColor
{
  return self->_columnDividerColor;
}

- (void)setColumnDividerColor:(id)a3
{
  objc_storeStrong((id *)&self->_columnDividerColor, a3);
}

- (BOOL)remembersLastFocusedItem
{
  return self->_remembersLastFocusedItem;
}

- (NSArray)components
{
  return self->_components;
}

- (NSDictionary)divsByPosition
{
  return self->_divsByPosition;
}

- (void)setDivsByPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSDictionary)divSizesByPosition
{
  return self->_divSizesByPosition;
}

- (void)setDivSizesByPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divSizesByPosition, 0);
  objc_storeStrong((id *)&self->_divsByPosition, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_columnDividerColor, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_leftColumnDivider, 0);
  objc_storeStrong((id *)&self->_rightColumnDivider, 0);
  objc_destroyWeak((id *)&self->_lastFocusedView);
}

@end
