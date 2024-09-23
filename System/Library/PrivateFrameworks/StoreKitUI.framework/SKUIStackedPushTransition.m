@implementation SKUIStackedPushTransition

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
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double MaxY;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double split;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  SKUIStackedBar *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  SKUIStackedBar *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  uint64_t v86;
  id v87;
  SKUIStackedBar *v88;
  double v89;
  double v90;
  id v91;
  id v92;
  id v93;
  SKUIStackedBar *v94;
  SKUIStackedBar *v95;
  id v96;
  id v97;
  id v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  _QWORD v121[5];
  id v122;
  id v123;
  id v124;
  SKUIStackedBar *v125;
  SKUIStackedBar *v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  double v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD v136[4];
  id v137;
  _QWORD v138[4];
  id v139;
  SKUIStackedBar *v140;
  id v141;
  id v142;
  id v143;
  _QWORD v144[3];
  CGRect v145;
  CGRect v146;

  v144[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStackedPushTransition animateTransition:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v112 = v4;
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v118);
  v17 = v16;
  v19 = v18;
  v113 = v21;
  v115 = v20;
  -[SKUIStackedBar setHidden:](self->_toBar, "setHidden:", 1);
  -[SKUIStackedBar frame](self->_toBar, "frame");
  MaxY = CGRectGetMaxY(v145);
  v143 = 0;
  SKUIGetImagesFromView(v13, 0, &v143, MaxY);
  v117 = v143;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v117);
  v24 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v117, "size");
  v26 = v25;
  objc_msgSend(v117, "size");
  v28 = (void *)objc_msgSend(v24, "initWithFrame:", 0.0, 0.0, v26, v27);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v29);

  v120 = v23;
  objc_msgSend(v15, "addSubview:", v23);
  v109 = v28;
  objc_msgSend(v15, "addSubview:", v28);
  objc_msgSend(v23, "frame");
  v31 = v30;
  v33 = v32;
  v34 = v19 + self->_split;
  objc_msgSend(v23, "setFrame:", v17, v34);
  v102 = v34;
  objc_msgSend(v28, "setFrame:", v17, v34, v31, v33);
  -[SKUIStackedBar frame](self->_toBar, "frame");
  v36 = v19 + v35;
  -[SKUIStackedBar frame](self->_toBar, "frame");
  v38 = v36 + v37;
  v39 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[SKUIStackedBar frame](self->_toBar, "frame");
  v41 = v40;
  -[SKUIStackedBar frame](self->_toBar, "frame");
  v43 = v34 - (v41 + v42);
  v107 = v13;
  objc_msgSend(v13, "frame");
  objc_msgSend(v39, "setFrame:", v17, v43, v31);
  objc_msgSend(v15, "addSubview:", v39);
  objc_msgSend(v15, "sendSubviewToBack:", v39);
  -[SKUIStackedBar frame](self->_toBar, "frame");
  v45 = v44;
  -[SKUIStackedBar frame](self->_toBar, "frame");
  v106 = v38 - (v45 + v46);
  v99 = v38;
  objc_msgSend(v13, "frame");
  objc_msgSend(v39, "bounds");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v39, "addSubview:", v13);
  -[SKUIStackedBar setHidden:](self->_fromBar, "setHidden:", 1);
  split = self->_split;
  v141 = 0;
  v142 = 0;
  v48 = v14;
  v104 = v14;
  SKUIGetImagesFromView(v14, &v142, &v141, split);
  v111 = v142;
  v110 = v141;
  -[SKUIStackedBar setHidden:](self->_fromBar, "setHidden:", 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v111);
  objc_msgSend(v49, "frame");
  v105 = v19;
  v51 = v50;
  v53 = v52;
  objc_msgSend(v49, "setFrame:", v17, v19);
  objc_msgSend(v15, "addSubview:", v49);
  v103 = v38 - self->_split;
  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v110);
  objc_msgSend(v100, "frame");
  v55 = v54;
  v57 = v56;
  v146.origin.x = v17;
  v146.origin.y = v19;
  v146.size.width = v51;
  v146.size.height = v53;
  v58 = CGRectGetMaxY(v146);
  objc_msgSend(v100, "setFrame:", v17, v58, v55, v57);
  objc_msgSend(v15, "addSubview:", v100);
  v101 = v58 + v57;
  v59 = objc_alloc_init(SKUIStackedBar);
  -[SKUIStackedBar setSplitViewStyle:](v59, "setSplitViewStyle:", -[SKUIStackedBar splitViewStyle](self->_toBar, "splitViewStyle"));
  -[SKUIStackedBar setHidesStatusBar:](v59, "setHidesStatusBar:", 1);
  -[SKUIStackedBar items](self->_toBar, "items");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackedBar setAlwaysShowsBackButton:](v59, "setAlwaysShowsBackButton:", (unint64_t)objc_msgSend(v60, "count") > 1);

  -[SKUIStackedBar items](self->_toBar, "items");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "lastObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  SKUINavigationItemsShallowCopy(v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackedBar setItems:](v59, "setItems:", v64);

  -[SKUIStackedBar sizeToFit](v59, "sizeToFit");
  objc_msgSend(v15, "addSubview:", v59);
  -[SKUIStackedBar frame](v59, "frame");
  v66 = v65;
  -[SKUIStackedBar setFrame:](v59, "setFrame:", v17, v102 - v65, v31);
  -[SKUIStackedBar setAlpha:](v59, "setAlpha:", 0.0);
  v67 = objc_alloc_init(SKUIStackedBar);
  -[SKUIStackedBar setSplitViewStyle:](v67, "setSplitViewStyle:", -[SKUIStackedBar splitViewStyle](self->_fromBar, "splitViewStyle"));
  -[SKUIStackedBar items](self->_fromBar, "items");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  SKUINavigationItemsShallowCopy(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackedBar setItems:](v67, "setItems:", v69);

  -[SKUIStackedBar frame](self->_fromBar, "frame");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  -[SKUIStackedBar superview](self->_fromBar, "superview");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromView:", v78, v71, v73, v75, v77);
  -[SKUIStackedBar setFrame:](v67, "setFrame:");

  objc_msgSend(v15, "addSubview:", v67);
  objc_msgSend(v48, "removeFromSuperview");
  -[SKUIStackedBar setLastItemExpanded:animated:](v67, "setLastItemExpanded:animated:", 0, 1);
  v79 = SKUIStackedBarSpringAnimationForExpandCollapse(v59, v17, v99 - v66);
  v80 = SKUIStackedBarSpringAnimationForExpandCollapse(v39, v17, v106);
  v81 = SKUIStackedBarSpringAnimationForExpandCollapse(v120, v17, v99);
  v82 = SKUIStackedBarSpringAnimationForExpandCollapse(v109, v17, v99);
  v83 = SKUIStackedBarSpringAnimationForExpandCollapse(v49, v17, v103);
  v84 = SKUIStackedBarSpringAnimationForExpandCollapse(v100, v17, v101);
  v85 = (void *)MEMORY[0x1E0DC3F10];
  v86 = MEMORY[0x1E0C809B0];
  v138[0] = MEMORY[0x1E0C809B0];
  v138[1] = 3221225472;
  v138[2] = __47__SKUIStackedPushTransition_animateTransition___block_invoke;
  v138[3] = &unk_1E739FD10;
  v87 = v49;
  v139 = v87;
  v88 = v59;
  v140 = v88;
  objc_msgSend(v85, "animateWithDuration:animations:", v138, 0.4);
  v108 = (void *)MEMORY[0x1E0DC3F10];
  -[SKUIStackedPushTransition transitionDuration:](self, "transitionDuration:", v112);
  v90 = v89;
  v136[0] = v86;
  v136[1] = 3221225472;
  v136[2] = __47__SKUIStackedPushTransition_animateTransition___block_invoke_2;
  v136[3] = &unk_1E739FD38;
  v137 = v109;
  v121[0] = v86;
  v121[1] = 3221225472;
  v121[2] = __47__SKUIStackedPushTransition_animateTransition___block_invoke_3;
  v121[3] = &unk_1E73A1DE0;
  v121[4] = self;
  v122 = v39;
  v132 = v17;
  v133 = v105;
  v134 = v115;
  v135 = v113;
  v123 = v107;
  v124 = v15;
  v125 = v67;
  v126 = v88;
  v127 = v120;
  v128 = v87;
  v129 = v137;
  v130 = v100;
  v131 = v112;
  v116 = v112;
  v91 = v100;
  v114 = v137;
  v92 = v87;
  v93 = v120;
  v94 = v88;
  v95 = v67;
  v96 = v124;
  v97 = v107;
  v98 = v39;
  objc_msgSend(v108, "animateWithDuration:animations:completion:", v136, v121, v90);

}

uint64_t __47__SKUIStackedPushTransition_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __47__SKUIStackedPushTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __47__SKUIStackedPushTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144));
  objc_msgSend(*(id *)(a1 + 56), "addSubview:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 88), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 96), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 104), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 112), "completeTransition:", 1);
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
