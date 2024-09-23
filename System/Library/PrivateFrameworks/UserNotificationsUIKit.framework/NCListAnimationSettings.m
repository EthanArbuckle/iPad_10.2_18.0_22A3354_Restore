@implementation NCListAnimationSettings

+ (id)moduleWithSectionTitle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  _QWORD v164[2];

  v164[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Internal Tools Button Hidden"), CFSTR("internalToolsButtonHidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("C2 only animations"), CFSTR("onlyC2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("High frame rate animations"), CFSTR("highFrameRateInteractiveAnimations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("viewVisibilityMargin"), CFSTR("viewVisibilityMargin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 500.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("viewSpacing"), CFSTR("viewSpacing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", -320.0, 320.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("headerSpacing"), CFSTR("headerSpacing"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 320.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "precision:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("viewOverlap"), CFSTR("viewOverlap"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", -20.0, 20.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("featuredLeadingViewSpacing"), CFSTR("featuredLeadingViewSpacing"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", -32.0, 32.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "precision:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v23);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("titleViewMargin"), CFSTR("titleViewMargin"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 100.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v26);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("titleViewHeight"), CFSTR("titleViewHeight"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "between:and:", 0.0, 500.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v29);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationTension"), CFSTR("animationTension"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 1450.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v32);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationFriction"), CFSTR("animationFriction"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 220.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v35);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationTensionVelocityFactor"), CFSTR("animationTensionVelocityFactor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 0.25);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "precision:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v38);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationFrictionVelocityFactor"), CFSTR("animationFrictionVelocityFactor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0002, 0.2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationScale"), CFSTR("animationScale"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.03, 3.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "precision:", 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v44);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationScaleGroupInsertion"), CFSTR("animationScaleGroupInsertion"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", 0.11, 11.1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "precision:", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v47);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationScaleWhileGrouping"), CFSTR("animationScaleWhileGrouping"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "between:and:", 0.01, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "precision:", 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v50);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationTranslation"), CFSTR("animationTranslation"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "between:and:", 0.0, 200.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "precision:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v53);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationTranslationWhileGrouping"), CFSTR("animationTranslationWhileGrouping"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "between:and:", 0.0, 400.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "precision:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v56);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("animationInsertionStartAlpha"), CFSTR("animationInsertionStartAlpha"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "between:and:", 0.02, 2.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "precision:", 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v59);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealHintingAnimationTension"), CFSTR("revealHintingAnimationTension"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "between:and:", 0.0, 1450.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "precision:", 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v62);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealHintingAnimationFriction"), CFSTR("revealHintingAnimationFriction"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "between:and:", 0.0, 240.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "precision:", 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v65);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealHintingAnimationTensionVelocityFactor"), CFSTR("revealHintingAnimationTensionVelocityFactor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "between:and:", 0.0, 250.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "precision:", 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v68);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealHintingAnimationFrictionVelocityFactor"), CFSTR("revealHintingAnimationFrictionVelocityFactor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "between:and:", 0.0, 20.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "precision:", 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v71);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealGestureAnimationRevealDelayStep"), CFSTR("revealGestureAnimationRevealDelayStep"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "between:and:", 0.003, 0.3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "precision:", 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v74);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("insertionTension"), CFSTR("insertionTension"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "between:and:", 0.0, 700.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "precision:", 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v77);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("insertionFriction"), CFSTR("insertionFriction"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "between:and:", 0.0, 120.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "precision:", 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v80);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("groupListMaxViewCount"), CFSTR("groupListMaxViewCount"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "between:and:", 0.0, 20.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "precision:", 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v83);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealHintingTriggerOffset"), CFSTR("revealHintingTriggerOffset"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "between:and:", 0.0, 500.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "precision:", 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v86);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("revealHintingOffset"), CFSTR("revealHintingOffset"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "between:and:", 0.0, 700.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "precision:", 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v89);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("hoverViewMovingTopMargin"), CFSTR("hoverViewMovingTopMargin"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "between:and:", 0.0, 50.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "precision:", 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v92);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("hoverViewTrailingMargin"), CFSTR("hoverViewTrailingMargin"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "between:and:", 0.0, 60.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "precision:", 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v95);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("hoverViewFadeInsertionMargin"), CFSTR("hoverViewFadeInsertionMargin"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "between:and:", 0.0, 250.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "precision:", 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v98);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("hoverViewBottomMarginMinimum"), CFSTR("hoverViewBottomMarginMinimum"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "between:and:", 0.0, 2000.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "precision:", 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v101);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("featuredViewOcclusionMinimumAlpha"), CFSTR("featuredViewOcclusionMinimumAlpha"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "between:and:", 0.0, 1.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "precision:", 2);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v104);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("overlayFooterViewMaxHeight"), CFSTR("overlayFooterViewMaxHeight"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "between:and:", 100.0, 100.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "precision:", 3);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v107);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("overlayFooterViewAnimationScale"), CFSTR("overlayFooterViewAnimationScale"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "between:and:", 0.0, 0.5);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "precision:", 3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v110);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("interactionTranslationOffsetMax"), CFSTR("interactionTranslationOffsetMax"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "between:and:", 0.0, 300.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "precision:", 1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v113);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("interactionTranslationVerticalOffsetMax"), CFSTR("interactionTranslationVerticalOffsetMax"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "between:and:", 0.0, 500.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "precision:", 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v116);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("interactionTranslationCollapseVerticalOffsetFactor"), CFSTR("interactionTranslationCollapseVerticalOffsetFactor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "between:and:", 0.05, 5.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "precision:", 3);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v119);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("rollUnderScaleMinimum"), CFSTR("rollUnderScaleMinimum"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "between:and:", 0.065, 6.5);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "precision:", 3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v122);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("rollUnderTranslationMaximum"), CFSTR("rollUnderTranslationMaximum"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "between:and:", 0.0, 1500.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "precision:", 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v125);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("rollUnderLimitHeightMax"), CFSTR("rollUnderLimitHeightMax"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "between:and:", 135.0, 135.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "precision:", 3);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v128);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("rollUnderNotVisibleTranslation"), CFSTR("rollUnderNotVisibleTranslation"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "between:and:", 0.0, 2200.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "precision:", 2);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v131);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("rollUnderNotRevealedScale"), CFSTR("rollUnderNotRevealedScale"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "between:and:", 0.005, 0.5);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "precision:", 3);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v134);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("rollUnderNotRevealedTranslationY"), CFSTR("rollUnderNotRevealedTranslationY"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "between:and:", -1200.0, 1200.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "precision:", 2);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v137);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("headerViewInitialOffsetHeightPercentage"), CFSTR("headerViewInitialOffsetHeightPercentage"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "between:and:", 0.05, 5.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "precision:", 3);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v140);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("headerViewRevealAlphaPercentage"), CFSTR("headerViewRevealAlphaPercentage"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "between:and:", 0.08, 8.0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "precision:", 3);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v143);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("headerViewRemoveAnimationTransform"), CFSTR("headerViewRemoveAnimationTransform"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "between:and:", 0.02, 2.0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "precision:", 3);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v146);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("headerViewRevealBlurRadiusMax"), CFSTR("headerViewRevealBlurRadiusMax"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "between:and:", 0.0, 100.0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "precision:", 2);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v149);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("headerViewRevealBlurTranslationDistance"), CFSTR("headerViewRevealBlurTranslationDistance"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "between:and:", 0.0, 1000.0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "precision:", 2);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v152);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("notRevealedPlacementOffset"), CFSTR("notRevealedPlacementOffset"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "between:and:", 0.0, 800.0);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "precision:", 2);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v155);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("initialLayoutBottomMarginAdjustment"), CFSTR("initialLayoutBottomMarginAdjustment"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "between:and:", 0.0, 200.0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "precision:", 2);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v158);

  v159 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v5, v4);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  v164[0] = v160;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 1);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "moduleWithTitle:contents:", 0, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  return v162;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "moduleWithSectionTitle:", CFSTR("Animation List Settings"));
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCListAnimationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[NCListAnimationSettings setInternalToolsButtonHidden:](self, "setInternalToolsButtonHidden:", 1);
  -[NCListAnimationSettings setOnlyC2:](self, "setOnlyC2:", 1);
  -[NCListAnimationSettings setHighFrameRateInteractiveAnimations:](self, "setHighFrameRateInteractiveAnimations:", 1);
  -[NCListAnimationSettings setViewVisibilityMargin:](self, "setViewVisibilityMargin:", 100.0);
  -[NCListAnimationSettings setViewSpacing:](self, "setViewSpacing:", 8.0);
  -[NCListAnimationSettings setHeaderSpacing:](self, "setHeaderSpacing:", 0.0);
  -[NCListAnimationSettings setViewOverlap:](self, "setViewOverlap:", 8.0);
  -[NCListAnimationSettings setFeaturedLeadingViewSpacing:](self, "setFeaturedLeadingViewSpacing:", 10.0);
  -[NCListAnimationSettings setTitleViewMargin:](self, "setTitleViewMargin:", 20.0);
  -[NCListAnimationSettings setTitleViewHeight:](self, "setTitleViewHeight:", 50.0);
  -[NCListAnimationSettings setAnimationTension:](self, "setAnimationTension:", 145.0);
  -[NCListAnimationSettings setAnimationFriction:](self, "setAnimationFriction:", 22.0);
  -[NCListAnimationSettings setAnimationTensionVelocityFactor:](self, "setAnimationTensionVelocityFactor:", 0.25);
  -[NCListAnimationSettings setAnimationFrictionVelocityFactor:](self, "setAnimationFrictionVelocityFactor:", 0.02);
  -[NCListAnimationSettings setAnimationScale:](self, "setAnimationScale:", 0.3);
  -[NCListAnimationSettings setAnimationScaleGroupInsertion:](self, "setAnimationScaleGroupInsertion:", 1.1);
  -[NCListAnimationSettings setAnimationScaleWhileGrouping:](self, "setAnimationScaleWhileGrouping:", 0.1);
  -[NCListAnimationSettings setAnimationTranslation:](self, "setAnimationTranslation:", 20.0);
  -[NCListAnimationSettings setAnimationTranslationWhileGrouping:](self, "setAnimationTranslationWhileGrouping:", 40.0);
  -[NCListAnimationSettings setAnimationInsertionStartAlpha:](self, "setAnimationInsertionStartAlpha:", 0.2);
  -[NCListAnimationSettings setRevealHintingAnimationTension:](self, "setRevealHintingAnimationTension:", 145.0);
  -[NCListAnimationSettings setRevealHintingAnimationFriction:](self, "setRevealHintingAnimationFriction:", 24.0);
  -[NCListAnimationSettings setRevealHintingAnimationTensionVelocityFactor:](self, "setRevealHintingAnimationTensionVelocityFactor:", 25.0);
  -[NCListAnimationSettings setRevealHintingAnimationFrictionVelocityFactor:](self, "setRevealHintingAnimationFrictionVelocityFactor:", 2.0);
  -[NCListAnimationSettings setRevealGestureAnimationRevealDelayStep:](self, "setRevealGestureAnimationRevealDelayStep:", 0.03);
  -[NCListAnimationSettings setInsertionTension:](self, "setInsertionTension:", 70.0);
  -[NCListAnimationSettings setInsertionFriction:](self, "setInsertionFriction:", 12.0);
  -[NCListAnimationSettings setGroupListMaxViewCount:](self, "setGroupListMaxViewCount:", 3.0);
  -[NCListAnimationSettings setRevealHintingTriggerOffset:](self, "setRevealHintingTriggerOffset:", 50.0);
  -[NCListAnimationSettings setRevealHintingOffset:](self, "setRevealHintingOffset:", 70.0);
  -[NCListAnimationSettings setHoverViewMovingTopMargin:](self, "setHoverViewMovingTopMargin:", 5.0);
  -[NCListAnimationSettings setHoverViewTrailingMargin:](self, "setHoverViewTrailingMargin:", 6.0);
  -[NCListAnimationSettings setHoverViewFadeInsertionMargin:](self, "setHoverViewFadeInsertionMargin:", 25.0);
  -[NCListAnimationSettings setHoverViewBottomMarginMinimum:](self, "setHoverViewBottomMarginMinimum:", 200.0);
  -[NCListAnimationSettings setFeaturedViewOcclusionMinimumAlpha:](self, "setFeaturedViewOcclusionMinimumAlpha:", 0.5);
  -[NCListAnimationSettings setOverlayFooterViewMaxHeight:](self, "setOverlayFooterViewMaxHeight:", 100.0);
  -[NCListAnimationSettings setOverlayFooterViewAnimationScale:](self, "setOverlayFooterViewAnimationScale:", 0.05);
  -[NCListAnimationSettings setInteractionTranslationOffsetMax:](self, "setInteractionTranslationOffsetMax:", 30.0);
  -[NCListAnimationSettings setInteractionTranslationVerticalOffsetMax:](self, "setInteractionTranslationVerticalOffsetMax:", 50.0);
  -[NCListAnimationSettings setInteractionTranslationCollapseVerticalOffsetFactor:](self, "setInteractionTranslationCollapseVerticalOffsetFactor:", 0.5);
  -[NCListAnimationSettings setRollUnderScaleMinimum:](self, "setRollUnderScaleMinimum:", 0.65);
  -[NCListAnimationSettings setRollUnderTranslationMaximum:](self, "setRollUnderTranslationMaximum:", 150.0);
  -[NCListAnimationSettings setRollUnderLimitHeightMax:](self, "setRollUnderLimitHeightMax:", 135.0);
  -[NCListAnimationSettings setRollUnderNotVisibleTranslation:](self, "setRollUnderNotVisibleTranslation:", 220.0);
  -[NCListAnimationSettings setRollUnderNotRevealedScale:](self, "setRollUnderNotRevealedScale:", 0.05);
  -[NCListAnimationSettings setRollUnderNotRevealedTranslationY:](self, "setRollUnderNotRevealedTranslationY:", -600.0);
  -[NCListAnimationSettings setHeaderViewInitialOffsetHeightPercentage:](self, "setHeaderViewInitialOffsetHeightPercentage:", 0.5);
  -[NCListAnimationSettings setHeaderViewRevealAlphaPercentage:](self, "setHeaderViewRevealAlphaPercentage:", 0.8);
  -[NCListAnimationSettings setHeaderViewRemoveAnimationTransform:](self, "setHeaderViewRemoveAnimationTransform:", 0.2);
  -[NCListAnimationSettings setHeaderViewRevealBlurRadiusMax:](self, "setHeaderViewRevealBlurRadiusMax:", 10.0);
  -[NCListAnimationSettings setHeaderViewRevealBlurTranslationDistance:](self, "setHeaderViewRevealBlurTranslationDistance:", 100.0);
  -[NCListAnimationSettings setNotRevealedPlacementOffset:](self, "setNotRevealedPlacementOffset:", 80.0);
  -[NCListAnimationSettings setInitialLayoutBottomMarginAdjustment:](self, "setInitialLayoutBottomMarginAdjustment:", 20.0);
}

- (BOOL)isInternalToolsButtonHidden
{
  return self->_internalToolsButtonHidden;
}

- (void)setInternalToolsButtonHidden:(BOOL)a3
{
  self->_internalToolsButtonHidden = a3;
}

- (BOOL)onlyC2
{
  return self->_onlyC2;
}

- (void)setOnlyC2:(BOOL)a3
{
  self->_onlyC2 = a3;
}

- (BOOL)highFrameRateInteractiveAnimations
{
  return self->_highFrameRateInteractiveAnimations;
}

- (void)setHighFrameRateInteractiveAnimations:(BOOL)a3
{
  self->_highFrameRateInteractiveAnimations = a3;
}

- (double)viewVisibilityMargin
{
  return self->_viewVisibilityMargin;
}

- (void)setViewVisibilityMargin:(double)a3
{
  self->_viewVisibilityMargin = a3;
}

- (double)viewSpacing
{
  return self->_viewSpacing;
}

- (void)setViewSpacing:(double)a3
{
  self->_viewSpacing = a3;
}

- (double)headerSpacing
{
  return self->_headerSpacing;
}

- (void)setHeaderSpacing:(double)a3
{
  self->_headerSpacing = a3;
}

- (double)viewOverlap
{
  return self->_viewOverlap;
}

- (void)setViewOverlap:(double)a3
{
  self->_viewOverlap = a3;
}

- (double)featuredLeadingViewSpacing
{
  return self->_featuredLeadingViewSpacing;
}

- (void)setFeaturedLeadingViewSpacing:(double)a3
{
  self->_featuredLeadingViewSpacing = a3;
}

- (double)titleViewMargin
{
  return self->_titleViewMargin;
}

- (void)setTitleViewMargin:(double)a3
{
  self->_titleViewMargin = a3;
}

- (double)titleViewHeight
{
  return self->_titleViewHeight;
}

- (void)setTitleViewHeight:(double)a3
{
  self->_titleViewHeight = a3;
}

- (double)animationTension
{
  return self->_animationTension;
}

- (void)setAnimationTension:(double)a3
{
  self->_animationTension = a3;
}

- (double)animationFriction
{
  return self->_animationFriction;
}

- (void)setAnimationFriction:(double)a3
{
  self->_animationFriction = a3;
}

- (double)animationTensionVelocityFactor
{
  return self->_animationTensionVelocityFactor;
}

- (void)setAnimationTensionVelocityFactor:(double)a3
{
  self->_animationTensionVelocityFactor = a3;
}

- (double)animationFrictionVelocityFactor
{
  return self->_animationFrictionVelocityFactor;
}

- (void)setAnimationFrictionVelocityFactor:(double)a3
{
  self->_animationFrictionVelocityFactor = a3;
}

- (double)animationScale
{
  return self->_animationScale;
}

- (void)setAnimationScale:(double)a3
{
  self->_animationScale = a3;
}

- (double)animationScaleGroupInsertion
{
  return self->_animationScaleGroupInsertion;
}

- (void)setAnimationScaleGroupInsertion:(double)a3
{
  self->_animationScaleGroupInsertion = a3;
}

- (double)animationScaleWhileGrouping
{
  return self->_animationScaleWhileGrouping;
}

- (void)setAnimationScaleWhileGrouping:(double)a3
{
  self->_animationScaleWhileGrouping = a3;
}

- (double)animationTranslation
{
  return self->_animationTranslation;
}

- (void)setAnimationTranslation:(double)a3
{
  self->_animationTranslation = a3;
}

- (double)animationTranslationWhileGrouping
{
  return self->_animationTranslationWhileGrouping;
}

- (void)setAnimationTranslationWhileGrouping:(double)a3
{
  self->_animationTranslationWhileGrouping = a3;
}

- (double)animationInsertionStartAlpha
{
  return self->_animationInsertionStartAlpha;
}

- (void)setAnimationInsertionStartAlpha:(double)a3
{
  self->_animationInsertionStartAlpha = a3;
}

- (double)revealHintingAnimationTension
{
  return self->_revealHintingAnimationTension;
}

- (void)setRevealHintingAnimationTension:(double)a3
{
  self->_revealHintingAnimationTension = a3;
}

- (double)revealHintingAnimationFriction
{
  return self->_revealHintingAnimationFriction;
}

- (void)setRevealHintingAnimationFriction:(double)a3
{
  self->_revealHintingAnimationFriction = a3;
}

- (double)revealHintingAnimationTensionVelocityFactor
{
  return self->_revealHintingAnimationTensionVelocityFactor;
}

- (void)setRevealHintingAnimationTensionVelocityFactor:(double)a3
{
  self->_revealHintingAnimationTensionVelocityFactor = a3;
}

- (double)revealHintingAnimationFrictionVelocityFactor
{
  return self->_revealHintingAnimationFrictionVelocityFactor;
}

- (void)setRevealHintingAnimationFrictionVelocityFactor:(double)a3
{
  self->_revealHintingAnimationFrictionVelocityFactor = a3;
}

- (double)revealGestureAnimationRevealDelayStep
{
  return self->_revealGestureAnimationRevealDelayStep;
}

- (void)setRevealGestureAnimationRevealDelayStep:(double)a3
{
  self->_revealGestureAnimationRevealDelayStep = a3;
}

- (double)insertionTension
{
  return self->_insertionTension;
}

- (void)setInsertionTension:(double)a3
{
  self->_insertionTension = a3;
}

- (double)insertionFriction
{
  return self->_insertionFriction;
}

- (void)setInsertionFriction:(double)a3
{
  self->_insertionFriction = a3;
}

- (double)groupListMaxViewCount
{
  return self->_groupListMaxViewCount;
}

- (void)setGroupListMaxViewCount:(double)a3
{
  self->_groupListMaxViewCount = a3;
}

- (double)revealHintingTriggerOffset
{
  return self->_revealHintingTriggerOffset;
}

- (void)setRevealHintingTriggerOffset:(double)a3
{
  self->_revealHintingTriggerOffset = a3;
}

- (double)revealHintingOffset
{
  return self->_revealHintingOffset;
}

- (void)setRevealHintingOffset:(double)a3
{
  self->_revealHintingOffset = a3;
}

- (double)hoverViewMovingTopMargin
{
  return self->_hoverViewMovingTopMargin;
}

- (void)setHoverViewMovingTopMargin:(double)a3
{
  self->_hoverViewMovingTopMargin = a3;
}

- (double)hoverViewTrailingMargin
{
  return self->_hoverViewTrailingMargin;
}

- (void)setHoverViewTrailingMargin:(double)a3
{
  self->_hoverViewTrailingMargin = a3;
}

- (double)hoverViewFadeInsertionMargin
{
  return self->_hoverViewFadeInsertionMargin;
}

- (void)setHoverViewFadeInsertionMargin:(double)a3
{
  self->_hoverViewFadeInsertionMargin = a3;
}

- (double)hoverViewBottomMarginMinimum
{
  return self->_hoverViewBottomMarginMinimum;
}

- (void)setHoverViewBottomMarginMinimum:(double)a3
{
  self->_hoverViewBottomMarginMinimum = a3;
}

- (double)featuredViewOcclusionMinimumAlpha
{
  return self->_featuredViewOcclusionMinimumAlpha;
}

- (void)setFeaturedViewOcclusionMinimumAlpha:(double)a3
{
  self->_featuredViewOcclusionMinimumAlpha = a3;
}

- (double)overlayFooterViewMaxHeight
{
  return self->_overlayFooterViewMaxHeight;
}

- (void)setOverlayFooterViewMaxHeight:(double)a3
{
  self->_overlayFooterViewMaxHeight = a3;
}

- (double)overlayFooterViewAnimationScale
{
  return self->_overlayFooterViewAnimationScale;
}

- (void)setOverlayFooterViewAnimationScale:(double)a3
{
  self->_overlayFooterViewAnimationScale = a3;
}

- (double)interactionTranslationOffsetMax
{
  return self->_interactionTranslationOffsetMax;
}

- (void)setInteractionTranslationOffsetMax:(double)a3
{
  self->_interactionTranslationOffsetMax = a3;
}

- (double)interactionTranslationVerticalOffsetMax
{
  return self->_interactionTranslationVerticalOffsetMax;
}

- (void)setInteractionTranslationVerticalOffsetMax:(double)a3
{
  self->_interactionTranslationVerticalOffsetMax = a3;
}

- (double)interactionTranslationCollapseVerticalOffsetFactor
{
  return self->_interactionTranslationCollapseVerticalOffsetFactor;
}

- (void)setInteractionTranslationCollapseVerticalOffsetFactor:(double)a3
{
  self->_interactionTranslationCollapseVerticalOffsetFactor = a3;
}

- (double)rollUnderScaleMinimum
{
  return self->_rollUnderScaleMinimum;
}

- (void)setRollUnderScaleMinimum:(double)a3
{
  self->_rollUnderScaleMinimum = a3;
}

- (double)rollUnderTranslationMaximum
{
  return self->_rollUnderTranslationMaximum;
}

- (void)setRollUnderTranslationMaximum:(double)a3
{
  self->_rollUnderTranslationMaximum = a3;
}

- (double)rollUnderLimitHeightMax
{
  return self->_rollUnderLimitHeightMax;
}

- (void)setRollUnderLimitHeightMax:(double)a3
{
  self->_rollUnderLimitHeightMax = a3;
}

- (double)rollUnderNotVisibleTranslation
{
  return self->_rollUnderNotVisibleTranslation;
}

- (void)setRollUnderNotVisibleTranslation:(double)a3
{
  self->_rollUnderNotVisibleTranslation = a3;
}

- (double)rollUnderNotRevealedScale
{
  return self->_rollUnderNotRevealedScale;
}

- (void)setRollUnderNotRevealedScale:(double)a3
{
  self->_rollUnderNotRevealedScale = a3;
}

- (double)rollUnderNotRevealedTranslationY
{
  return self->_rollUnderNotRevealedTranslationY;
}

- (void)setRollUnderNotRevealedTranslationY:(double)a3
{
  self->_rollUnderNotRevealedTranslationY = a3;
}

- (double)headerViewInitialOffsetHeightPercentage
{
  return self->_headerViewInitialOffsetHeightPercentage;
}

- (void)setHeaderViewInitialOffsetHeightPercentage:(double)a3
{
  self->_headerViewInitialOffsetHeightPercentage = a3;
}

- (double)headerViewRevealAlphaPercentage
{
  return self->_headerViewRevealAlphaPercentage;
}

- (void)setHeaderViewRevealAlphaPercentage:(double)a3
{
  self->_headerViewRevealAlphaPercentage = a3;
}

- (double)headerViewRemoveAnimationTransform
{
  return self->_headerViewRemoveAnimationTransform;
}

- (void)setHeaderViewRemoveAnimationTransform:(double)a3
{
  self->_headerViewRemoveAnimationTransform = a3;
}

- (double)headerViewRevealBlurRadiusMax
{
  return self->_headerViewRevealBlurRadiusMax;
}

- (void)setHeaderViewRevealBlurRadiusMax:(double)a3
{
  self->_headerViewRevealBlurRadiusMax = a3;
}

- (double)headerViewRevealBlurTranslationDistance
{
  return self->_headerViewRevealBlurTranslationDistance;
}

- (void)setHeaderViewRevealBlurTranslationDistance:(double)a3
{
  self->_headerViewRevealBlurTranslationDistance = a3;
}

- (double)notRevealedPlacementOffset
{
  return self->_notRevealedPlacementOffset;
}

- (void)setNotRevealedPlacementOffset:(double)a3
{
  self->_notRevealedPlacementOffset = a3;
}

- (double)initialLayoutBottomMarginAdjustment
{
  return self->_initialLayoutBottomMarginAdjustment;
}

- (void)setInitialLayoutBottomMarginAdjustment:(double)a3
{
  self->_initialLayoutBottomMarginAdjustment = a3;
}

@end
