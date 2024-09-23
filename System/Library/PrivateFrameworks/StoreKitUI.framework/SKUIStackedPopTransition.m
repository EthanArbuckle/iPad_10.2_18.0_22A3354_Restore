@implementation SKUIStackedPopTransition

- (void)animateTransition:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  SKUIStackedBar *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  SKUIStackedBar *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  double v80;
  id v81;
  id v82;
  id v83;
  id v84;
  SKUIStackedBar *v85;
  SKUIStackedBar *v86;
  id v87;
  id v88;
  void *v89;
  double MaxY;
  double split;
  dispatch_time_t when;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  double rect;
  id recta;
  void *v106;
  void *v107;
  _QWORD block[4];
  id v109;
  id v110;
  SKUIStackedBar *v111;
  SKUIStackedBar *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  double v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD v123[4];
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  _QWORD v129[3];
  CGRect v130;

  v129[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStackedPopTransition animateTransition:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v13;
  objc_msgSend(v13, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v4;
  v102 = v14;
  objc_msgSend(v4, "finalFrameForViewController:", v14);
  v19 = v18;
  v21 = v20;
  rect = v20;
  v96 = v23;
  v97 = v22;
  -[SKUIStackedBar setHidden:](self->_fromBar, "setHidden:", 1);
  -[SKUIStackedBar bounds](self->_fromBar, "bounds");
  objc_msgSend(v16, "convertRect:fromView:", self->_fromBar);
  v25 = v24;
  -[SKUIStackedBar frame](self->_fromBar, "frame");
  v128 = 0;
  SKUIGetImagesFromView(v16, 0, &v128, v25 + v26);
  v27 = v128;
  -[SKUIStackedBar setHidden:](self->_fromBar, "setHidden:", 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v27);
  v29 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v27, "size");
  v31 = v30;
  v101 = v27;
  objc_msgSend(v27, "size");
  v33 = (void *)objc_msgSend(v29, "initWithFrame:", 0.0, 0.0, v31, v32);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v34);

  objc_msgSend(v33, "setAlpha:", 0.0);
  objc_msgSend(v17, "addSubview:", v28);
  objc_msgSend(v17, "addSubview:", v33);
  objc_msgSend(v28, "frame");
  v36 = v35;
  v38 = v37;
  -[SKUIStackedBar frame](self->_fromBar, "frame");
  v40 = v21 + v39;
  -[SKUIStackedBar bounds](self->_fromBar, "bounds");
  v107 = v16;
  objc_msgSend(v16, "convertRect:fromView:", self->_fromBar);
  v42 = v40 + v41;
  v106 = v28;
  objc_msgSend(v28, "setFrame:", v19, v40 + v41, v36, v38);
  objc_msgSend(v33, "setFrame:", v19, v42, v36, v38);
  split = self->_split;
  -[SKUIStackedBar setHidden:](self->_toBar, "setHidden:", 1);
  v43 = self->_split;
  v126 = 0;
  v127 = 0;
  v98 = v15;
  SKUIGetImagesFromView(v15, &v127, &v126, v43);
  v44 = v127;
  v45 = v126;
  -[SKUIStackedBar setHidden:](self->_toBar, "setHidden:", 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v44);
  objc_msgSend(v46, "frame");
  v48 = v47;
  v50 = v49;
  v51 = v42 - self->_split;
  objc_msgSend(v46, "setFrame:", v19, v51);
  v93 = v46;
  objc_msgSend(v17, "addSubview:", v46);
  v94 = v45;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v45);
  objc_msgSend(v52, "frame");
  v54 = v53;
  v56 = v55;
  v130.origin.x = v19;
  v130.origin.y = rect;
  v130.size.width = v48;
  v130.size.height = v50;
  MaxY = CGRectGetMaxY(v130);
  objc_msgSend(v52, "setFrame:", v19, MaxY + v56, v54, v56);
  v57 = v52;
  objc_msgSend(v17, "addSubview:", v52);
  v58 = objc_alloc_init(SKUIStackedBar);
  -[SKUIStackedBar setSplitViewStyle:](v58, "setSplitViewStyle:", -[SKUIStackedBar splitViewStyle](self->_fromBar, "splitViewStyle"));
  -[SKUIStackedBar setHidesStatusBar:](v58, "setHidesStatusBar:", 1);
  -[SKUIStackedBar items](self->_fromBar, "items");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackedBar setAlwaysShowsBackButton:](v58, "setAlwaysShowsBackButton:", (unint64_t)objc_msgSend(v59, "count") > 1);

  -[SKUIStackedBar items](self->_fromBar, "items");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "lastObject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  SKUINavigationItemsShallowCopy(v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackedBar setItems:](v58, "setItems:", v63);

  -[SKUIStackedBar sizeToFit](v58, "sizeToFit");
  objc_msgSend(v17, "addSubview:", v58);
  -[SKUIStackedBar frame](v58, "frame");
  v65 = v64;
  -[SKUIStackedBar setFrame:](v58, "setFrame:", v19, v42 - v64, v36);
  v95 = v44;
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v44);
  objc_msgSend(v66, "setFrame:", v19, v51, v48, v50);
  objc_msgSend(v66, "setAlpha:", 0.0);
  objc_msgSend(v17, "addSubview:", v66);
  v67 = objc_alloc_init(SKUIStackedBar);
  -[SKUIStackedBar setSplitViewStyle:](v67, "setSplitViewStyle:", -[SKUIStackedBar splitViewStyle](self->_toBar, "splitViewStyle"));
  -[SKUIStackedBar items](self->_toBar, "items");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  SKUINavigationItemsShallowCopy(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackedBar setItems:](v67, "setItems:", v69);

  -[SKUIStackedBar setLastItemExpanded:](v67, "setLastItemExpanded:", 0);
  if (-[SKUIStackedBar splitViewStyle](self->_toBar, "splitViewStyle"))
    -[SKUIStackedBar setZeroHeightWhenFirstChildExpanded:](v67, "setZeroHeightWhenFirstChildExpanded:", 1);
  -[SKUIStackedBar frame](v67, "frame");
  -[SKUIStackedBar sizeThatFits:](v67, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  -[SKUIStackedBar frame](self->_fromBar, "frame");
  -[SKUIStackedBar setFrame:](v67, "setFrame:", v19);
  v89 = v17;
  objc_msgSend(v17, "addSubview:", v67);
  objc_msgSend(v107, "removeFromSuperview");
  -[SKUIStackedBar setLastItemExpanded:animated:](v67, "setLastItemExpanded:animated:", 1, 1);
  v70 = SKUIStackedBarSpringAnimationForExpandCollapse(v58, v19, rect + split - v65 + -1.0);
  v71 = SKUIStackedBarSpringAnimationForExpandCollapse(v106, v19, rect + split);
  v72 = SKUIStackedBarSpringAnimationForExpandCollapse(v33, v19, rect + split);
  v73 = SKUIStackedBarSpringAnimationForExpandCollapse(v93, v19, rect);
  v74 = SKUIStackedBarSpringAnimationForExpandCollapse(v66, v19, rect);
  v75 = SKUIStackedBarSpringAnimationForExpandCollapse(v57, v19, MaxY);
  v76 = (void *)MEMORY[0x1E0DC3F10];
  v77 = MEMORY[0x1E0C809B0];
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __46__SKUIStackedPopTransition_animateTransition___block_invoke;
  v123[3] = &unk_1E739FD10;
  v78 = v66;
  v124 = v78;
  v79 = v33;
  v125 = v79;
  objc_msgSend(v76, "animateWithDuration:animations:", v123, 0.2);
  -[SKUIStackedPopTransition transitionDuration:](self, "transitionDuration:", v99);
  when = dispatch_time(0, (uint64_t)(v80 * 1000000000.0));
  block[0] = v77;
  block[1] = 3221225472;
  block[2] = __46__SKUIStackedPopTransition_animateTransition___block_invoke_2;
  block[3] = &unk_1E73A1E08;
  v119 = v19;
  v120 = rect;
  v121 = v97;
  v122 = v96;
  v109 = v98;
  v110 = v89;
  v111 = v67;
  v112 = v58;
  v113 = v106;
  v114 = v93;
  v115 = v78;
  v116 = v79;
  v117 = v57;
  v118 = v99;
  recta = v99;
  v81 = v57;
  v100 = v79;
  v82 = v78;
  v83 = v93;
  v84 = v106;
  v85 = v58;
  v86 = v67;
  v87 = v89;
  v88 = v98;
  dispatch_after(when, MEMORY[0x1E0C80D38], block);

}

uint64_t __46__SKUIStackedPopTransition_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __46__SKUIStackedPopTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 88), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 96), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 104), "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.6;
}

- (double)split
{
  return self->_split;
}

- (void)setSplit:(double)a3
{
  self->_split = a3;
}

- (SKUIStackedBar)fromBar
{
  return self->_fromBar;
}

- (void)setFromBar:(id)a3
{
  objc_storeStrong((id *)&self->_fromBar, a3);
}

- (SKUIStackedBar)toBar
{
  return self->_toBar;
}

- (void)setToBar:(id)a3
{
  objc_storeStrong((id *)&self->_toBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBar, 0);
  objc_storeStrong((id *)&self->_fromBar, 0);
}

- (void)animateTransition:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
