@implementation PRXCrossDissolveTransition

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  PRXCrossDissolveTransition *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  int v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  char v67;
  _QWORD v68[4];
  id v69;
  id v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[2];
  uint8_t buf[4];
  void *v81;
  uint64_t v82;
  CGRect v83;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PRXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PRXCrossDissolveTransition animateTransition:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector() & 1;
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BDF7F98]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BDF7F88]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "snapshotViewAfterScreenUpdates:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v18);
  objc_msgSend(v16, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v16);
  v19 = (void *)MEMORY[0x24BDF6F90];
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke;
  v77[3] = &unk_24CC31DB8;
  v20 = v16;
  v78 = v20;
  objc_msgSend(v19, "performWithoutAnimation:", v77);
  v21 = -[PRXCrossDissolveTransition cardStyle](self, "cardStyle");
  objc_msgSend(v14, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = PRXCardPreferredSize(v21, objc_msgSend(v22, "prx_cardSizeClass"));
  v25 = v24;

  objc_msgSend(v14, "preferredContentSize");
  if (v25 >= v26)
    v27 = v25;
  else
    v27 = v26;
  v28 = *MEMORY[0x24BDBF090];
  v29 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[PRXCrossDissolveTransition maxSize](self, "maxSize");
  if (v30 >= v23)
    v31 = v23;
  else
    v31 = v30;
  -[PRXCrossDissolveTransition maxSize](self, "maxSize");
  if (v32 < v27)
    v27 = v32;
  PRXDefaultLog();
  v33 = objc_claimAutoreleasedReturnValue();
  v60 = v17;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v83.origin.x = v28;
    v83.origin.y = v29;
    v83.size.width = v31;
    v83.size.height = v27;
    NSStringFromCGRect(v83);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v56;
    _os_log_debug_impl(&dword_21161A000, v33, OS_LOG_TYPE_DEBUG, "Animating to %@", buf, 0xCu);

  }
  objc_msgSend(v20, "setFrame:", v28, v29, v31, v27);
  objc_msgSend(v20, "intrinsicContentSize");
  if (v34 == *MEMORY[0x24BDF7FB8])
  {
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v57 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v20, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v23);
    v59 = v15;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v36;
    objc_msgSend(v20, "heightAnchor");
    v58 = v4;
    v37 = v14;
    v38 = self;
    v39 = v5;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintGreaterThanOrEqualToConstant:", v25);
    v41 = v18;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v43);

    v18 = v41;
    v5 = v39;
    self = v38;
    v14 = v37;
    v4 = v58;

    v15 = v59;
  }
  v44 = (void *)MEMORY[0x24BDF6F90];
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3;
  v75[3] = &unk_24CC31DB8;
  v45 = v20;
  v76 = v45;
  objc_msgSend(v44, "performWithoutAnimation:", v75);
  -[PRXCrossDissolveTransition transitionDuration:](self, "transitionDuration:", v4);
  v47 = v46;
  if (v15)
    objc_msgSend(v14, "setTransitioningSize:", 1);
  v48 = (void *)MEMORY[0x24BDF6F90];
  v49 = MEMORY[0x24BDAC760];
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke_2;
  v68[3] = &unk_24CC31DE0;
  v69 = v45;
  v50 = v5;
  v70 = v50;
  v71 = v28;
  v72 = v29;
  v73 = v31;
  v74 = v27;
  v61[0] = v49;
  v61[1] = 3221225472;
  v61[2] = __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3;
  v61[3] = &unk_24CC31E08;
  v51 = v18;
  v62 = v51;
  v52 = v60;
  v63 = v52;
  v53 = v69;
  v64 = v53;
  v67 = v15;
  v54 = v14;
  v65 = v54;
  v55 = v4;
  v66 = v55;
  objc_msgSend(v48, "transitionWithView:duration:options:animations:completion:", v50, 0, v68, v61, v47);
  if (self->_additionalAnimations)
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v47);

}

uint64_t __48__PRXCrossDissolveTransition_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 56), "setTransitioningSize:", 0);
  PRXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 64), "completeTransition:", 1);
}

uint64_t __48__PRXCrossDissolveTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (id)additionalAnimations
{
  return self->_additionalAnimations;
}

- (void)setAdditionalAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)cardStyle
{
  return self->_cardStyle;
}

- (void)setCardStyle:(int64_t)a3
{
  self->_cardStyle = a3;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalAnimations, 0);
}

- (void)animateTransition:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21161A000, a1, a3, "Beginning animation", a5, a6, a7, a8, 0);
}

void __48__PRXCrossDissolveTransition_animateTransition___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21161A000, a1, a3, "Finished animating", a5, a6, a7, a8, 0);
}

@end
