@implementation NCUNUIKitPrototypeSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
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
  _QWORD v122[8];
  _QWORD v123[2];
  _QWORD v124[5];
  _QWORD v125[10];
  _QWORD v126[4];
  _QWORD v127[12];
  _QWORD v128[11];
  void *v129;
  _QWORD v130[3];

  v130[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  v130[0] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("List Animation Settings"), CFSTR("listAnimationSettings"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83078];
  v129 = v108;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("List Settings"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Icon Opacity Settings"), CFSTR("briefIconOpacitySettings"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Brief Icon Position Milestone"), CFSTR("briefIconPositionMilestone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 3);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Icon Position Settings"), CFSTR("briefIconPositionSettings"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Brief Icon Scale Milestone"), CFSTR("briefIconScaleMilestone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 3);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Icon Scale Settings"), CFSTR("briefIconScaleSettings"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Brief Grabber Milestone"), CFSTR("briefGrabberMilestone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 3);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Grabber Settings"), CFSTR("briefGrabberSettings"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Text Opacity Settings"), CFSTR("briefTextOpacitySettings"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Brief Text Position Milestone"), CFSTR("briefTextPositionMilestone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "precision:", 3);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Text Position Settings"), CFSTR("briefTextPositionSettings"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Brief Background Settings"), CFSTR("briefBackgroundSettings"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D83078];
  v128[0] = v121;
  v128[1] = v119;
  v128[2] = v107;
  v128[3] = v106;
  v128[4] = v105;
  v128[5] = v104;
  v128[6] = v103;
  v128[7] = v102;
  v128[8] = v101;
  v128[9] = v100;
  v128[10] = v99;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v17, CFSTR("Brief Stage Animation Settings"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Detail Stage Transition Delay"), CFSTR("detailStageTransitionDelay"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 2);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Detail Stage Transition Max Attempts"), CFSTR("detailStageTransitionMaxAttempts"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Outgoing Text Position Settings"), CFSTR("detailOutgoingTextPositionSettings"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Outgoing Text Opacity Settings"), CFSTR("detailOutgoingTextOpacitySettings"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Icon Scale Settings"), CFSTR("detailIconScaleSettings"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Detail Icon Position Milestone"), CFSTR("detailIconPositionMilestone"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Icon Position Settings"), CFSTR("detailIconPositionSettings"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Detail Text Milestone"), CFSTR("detailTextMilestone"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Detail Secondary Text Milestone"), CFSTR("detailSecondaryTextMilestone"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Text Position Settings"), CFSTR("detailTextPositionSettings"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Text Opacity Settings"), CFSTR("detailTextOpacitySettings"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Detail Background Settings"), CFSTR("detailBackgroundSettings"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0D83078];
  v127[0] = v117;
  v127[1] = v115;
  v127[2] = v114;
  v127[3] = v113;
  v127[4] = v98;
  v127[5] = v97;
  v127[6] = v96;
  v127[7] = v95;
  v127[8] = v94;
  v127[9] = v93;
  v127[10] = v92;
  v127[11] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v29, CFSTR("Detail Stage Animation Settings"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dismiss Icon Opacity Settings"), CFSTR("dismissIconOpacitySettings"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dismiss Text Opacity Settings"), CFSTR("dismissTextOpacitySettings"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dismiss Text Position Settings"), CFSTR("dismissTextPositionSettings"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dismiss Background Settings"), CFSTR("dismissBackgroundSettings"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0D83078];
  v126[0] = v90;
  v126[1] = v89;
  v126[2] = v88;
  v126[3] = v87;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v31, CFSTR("Dismiss Stage Animation Settings"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Interactive Animation Settings"), CFSTR("interactiveDismissalTrackingSettings"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Automatic Animation Settings"), CFSTR("interactiveDismissalAutomaticSettings"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Automatic Background Settings"), CFSTR("interactiveDismissalBackgoundSettings"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Threshold"), CFSTR("interactiveDismissalThreshold"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 400.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precision:", 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Rubberbanding Inset"), CFSTR("interactiveDismissalRubberbandingInset"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", 0.0, 200.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Rubberbanding Range"), CFSTR("interactiveDismissalRubberbandingRange"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 400.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "precision:", 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Background Progress"), CFSTR("interactiveDismissalMinBackgroundProgress"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.0, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "precision:", 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Content Scale"), CFSTR("interactiveDismissalMinContentScale"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "between:and:", 0.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "precision:", 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Content Alpha"), CFSTR("interactiveDismissalMinContentAlpha"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.0, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "precision:", 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Final Content Scale"), CFSTR("interactiveDismissalFinalContentScale"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "between:and:", 0.0, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "precision:", 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0D83078];
  v125[0] = v112;
  v125[1] = v111;
  v125[2] = v110;
  v125[3] = v84;
  v125[4] = v83;
  v125[5] = v82;
  v125[6] = v81;
  v125[7] = v80;
  v125[8] = v79;
  v125[9] = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "sectionWithRows:title:", v47, CFSTR("Interactive Dismissal Settings"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Make Hit Rects Visible"), CFSTR("contentHitRectVisible"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading Margin"), CFSTR("contentHitRectLeadingMargin"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "between:and:", 0.0, 100.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "precision:", 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing Margin"), CFSTR("contentHitRectTrailingMargin"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "between:and:", 0.0, 100.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "precision:", 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top Margin"), CFSTR("contentHitRectTopMargin"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "between:and:", 0.0, 100.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "precision:", 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom Margin"), CFSTR("contentHitRectBottomMargin"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "between:and:", 0.0, 100.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "precision:", 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = (void *)MEMORY[0x1E0D83078];
  v124[0] = v76;
  v124[1] = v75;
  v124[2] = v74;
  v124[3] = v73;
  v124[4] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "sectionWithRows:title:", v58, CFSTR("Content Hit Testing"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dynamic Grouping Threshold"), CFSTR("dynamicGroupingThreshold"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "between:and:", 1.0, 10.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "precision:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dynamic Grouping Threshold (iPad)"), CFSTR("dynamicGroupingThresholdPad"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "between:and:", 1.0, 10.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "precision:", 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = (void *)MEMORY[0x1E0D83078];
  v123[0] = v62;
  v123[1] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "sectionWithRows:title:", v67, CFSTR("Dynamic Grouping"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = (void *)MEMORY[0x1E0D83078];
  v122[0] = v120;
  v122[1] = v118;
  v122[2] = v116;
  v122[3] = v85;
  v122[4] = v86;
  v122[5] = v77;
  v122[6] = v59;
  v122[7] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 8);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "moduleWithTitle:contents:", CFSTR("Full Screen Banner Settings"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
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
  double v18;
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
  objc_super v88;
  CAFrameRateRange v89;
  CAFrameRateRange v90;
  CAFrameRateRange v91;
  CAFrameRateRange v92;
  CAFrameRateRange v93;
  CAFrameRateRange v94;
  CAFrameRateRange v95;
  CAFrameRateRange v96;
  CAFrameRateRange v97;
  CAFrameRateRange v98;
  CAFrameRateRange v99;
  CAFrameRateRange v100;
  CAFrameRateRange v101;
  CAFrameRateRange v102;
  CAFrameRateRange v103;
  CAFrameRateRange v104;
  CAFrameRateRange v105;
  CAFrameRateRange v106;
  CAFrameRateRange v107;
  CAFrameRateRange v108;
  CAFrameRateRange v109;

  v88.receiver = self;
  v88.super_class = (Class)NCUNUIKitPrototypeSettings;
  -[PTSettings setDefaultValues](&v88, sel_setDefaultValues);
  -[NCUNUIKitPrototypeSettings listAnimationSettings](self, "listAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings setBriefIconPositionMilestone:](self, "setBriefIconPositionMilestone:", 0.168);
  -[NCUNUIKitPrototypeSettings setBriefIconScaleMilestone:](self, "setBriefIconScaleMilestone:", 0.337);
  -[NCUNUIKitPrototypeSettings setBriefGrabberMilestone:](self, "setBriefGrabberMilestone:", 0.85);
  -[NCUNUIKitPrototypeSettings setBriefTextPositionMilestone:](self, "setBriefTextPositionMilestone:", 0.015);
  -[NCUNUIKitPrototypeSettings briefIconPositionSettings](self, "briefIconPositionSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings briefIconPositionSettings](self, "briefIconPositionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:");

  -[NCUNUIKitPrototypeSettings briefIconPositionSettings](self, "briefIconPositionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.702481473);

  -[NCUNUIKitPrototypeSettings briefIconPositionSettings](self, "briefIconPositionSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v89.minimum, *(double *)&v89.maximum, *(double *)&v89.preferred);

  -[NCUNUIKitPrototypeSettings briefIconScaleSettings](self, "briefIconScaleSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings briefIconScaleSettings](self, "briefIconScaleSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDampingRatio:", 0.9);

  -[NCUNUIKitPrototypeSettings briefIconScaleSettings](self, "briefIconScaleSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResponse:", 1.0);

  -[NCUNUIKitPrototypeSettings briefIconScaleSettings](self, "briefIconScaleSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v90.minimum, *(double *)&v90.maximum, *(double *)&v90.preferred);

  -[NCUNUIKitPrototypeSettings briefIconOpacitySettings](self, "briefIconOpacitySettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings briefIconOpacitySettings](self, "briefIconOpacitySettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDampingRatio:", 1.02062073);

  -[NCUNUIKitPrototypeSettings briefIconOpacitySettings](self, "briefIconOpacitySettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setResponse:", 0.513019932);

  -[NCUNUIKitPrototypeSettings briefIconOpacitySettings](self, "briefIconOpacitySettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v91.minimum, *(double *)&v91.maximum, *(double *)&v91.preferred);

  -[NCUNUIKitPrototypeSettings briefGrabberSettings](self, "briefGrabberSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDefaultCriticallyDampedValues");

  -[NCUNUIKitPrototypeSettings briefGrabberSettings](self, "briefGrabberSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "response");
  objc_msgSend(v17, "setResponse:", v18 + v18);

  -[NCUNUIKitPrototypeSettings briefGrabberSettings](self, "briefGrabberSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v19, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v92.minimum, *(double *)&v92.maximum, *(double *)&v92.preferred);

  -[NCUNUIKitPrototypeSettings briefTextPositionSettings](self, "briefTextPositionSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings briefTextPositionSettings](self, "briefTextPositionSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDampingRatio:", 0.8);

  -[NCUNUIKitPrototypeSettings briefTextPositionSettings](self, "briefTextPositionSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setResponse:", 0.9);

  -[NCUNUIKitPrototypeSettings briefTextPositionSettings](self, "briefTextPositionSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v23, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v93.minimum, *(double *)&v93.maximum, *(double *)&v93.preferred);

  -[NCUNUIKitPrototypeSettings briefTextOpacitySettings](self, "briefTextOpacitySettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings briefTextOpacitySettings](self, "briefTextOpacitySettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDampingRatio:", 1.02062073);

  -[NCUNUIKitPrototypeSettings briefTextOpacitySettings](self, "briefTextOpacitySettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setResponse:", 0.513019932);

  -[NCUNUIKitPrototypeSettings briefTextOpacitySettings](self, "briefTextOpacitySettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v27, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v94.minimum, *(double *)&v94.maximum, *(double *)&v94.preferred);

  -[NCUNUIKitPrototypeSettings briefBackgroundSettings](self, "briefBackgroundSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings briefBackgroundSettings](self, "briefBackgroundSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDampingRatio:", 0.9);

  -[NCUNUIKitPrototypeSettings briefBackgroundSettings](self, "briefBackgroundSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setResponse:", 0.5);

  -[NCUNUIKitPrototypeSettings briefBackgroundSettings](self, "briefBackgroundSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v31, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v95.minimum, *(double *)&v95.maximum, *(double *)&v95.preferred);

  -[NCUNUIKitPrototypeSettings setDetailStageTransitionDelay:](self, "setDetailStageTransitionDelay:", 1.0);
  -[NCUNUIKitPrototypeSettings setDetailStageTransitionMaxAttempts:](self, "setDetailStageTransitionMaxAttempts:", 4);
  -[NCUNUIKitPrototypeSettings setDynamicGroupingThreshold:](self, "setDynamicGroupingThreshold:", 4);
  -[NCUNUIKitPrototypeSettings setDynamicGroupingThresholdPad:](self, "setDynamicGroupingThresholdPad:", 6);
  -[NCUNUIKitPrototypeSettings setDetailIconPositionMilestone:](self, "setDetailIconPositionMilestone:", 0.185);
  -[NCUNUIKitPrototypeSettings setDetailTextMilestone:](self, "setDetailTextMilestone:", 0.85);
  -[NCUNUIKitPrototypeSettings setDetailSecondaryTextMilestone:](self, "setDetailSecondaryTextMilestone:", 0.7);
  -[NCUNUIKitPrototypeSettings detailOutgoingTextPositionSettings](self, "detailOutgoingTextPositionSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailOutgoingTextPositionSettings](self, "detailOutgoingTextPositionSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDampingRatio:", 1.021);

  -[NCUNUIKitPrototypeSettings detailOutgoingTextPositionSettings](self, "detailOutgoingTextPositionSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setResponse:", 0.9);

  -[NCUNUIKitPrototypeSettings detailOutgoingTextPositionSettings](self, "detailOutgoingTextPositionSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v35, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v96.minimum, *(double *)&v96.maximum, *(double *)&v96.preferred);

  -[NCUNUIKitPrototypeSettings detailOutgoingTextOpacitySettings](self, "detailOutgoingTextOpacitySettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailOutgoingTextOpacitySettings](self, "detailOutgoingTextOpacitySettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDampingRatio:", 0.8);

  -[NCUNUIKitPrototypeSettings detailOutgoingTextOpacitySettings](self, "detailOutgoingTextOpacitySettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setResponse:", 0.257);

  -[NCUNUIKitPrototypeSettings detailOutgoingTextOpacitySettings](self, "detailOutgoingTextOpacitySettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v39, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v97.minimum, *(double *)&v97.maximum, *(double *)&v97.preferred);

  -[NCUNUIKitPrototypeSettings detailIconScaleSettings](self, "detailIconScaleSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailIconScaleSettings](self, "detailIconScaleSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDampingRatio:", 0.782623792);

  -[NCUNUIKitPrototypeSettings detailIconScaleSettings](self, "detailIconScaleSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setResponse:", 0.702481473);

  -[NCUNUIKitPrototypeSettings detailIconScaleSettings](self, "detailIconScaleSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v43, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v98.minimum, *(double *)&v98.maximum, *(double *)&v98.preferred);

  -[NCUNUIKitPrototypeSettings detailIconPositionSettings](self, "detailIconPositionSettings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailIconPositionSettings](self, "detailIconPositionSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setDampingRatio:", 1.11803399);

  -[NCUNUIKitPrototypeSettings detailIconPositionSettings](self, "detailIconPositionSettings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setResponse:", 0.702481473);

  -[NCUNUIKitPrototypeSettings detailIconPositionSettings](self, "detailIconPositionSettings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v47, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v99.minimum, *(double *)&v99.maximum, *(double *)&v99.preferred);

  -[NCUNUIKitPrototypeSettings detailTextPositionSettings](self, "detailTextPositionSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailTextPositionSettings](self, "detailTextPositionSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setDampingRatio:", 1.0);

  -[NCUNUIKitPrototypeSettings detailTextPositionSettings](self, "detailTextPositionSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setResponse:", 1.2);

  -[NCUNUIKitPrototypeSettings detailTextPositionSettings](self, "detailTextPositionSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v51, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v100.minimum, *(double *)&v100.maximum, *(double *)&v100.preferred);

  -[NCUNUIKitPrototypeSettings detailTextOpacitySettings](self, "detailTextOpacitySettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailTextOpacitySettings](self, "detailTextOpacitySettings");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDampingRatio:", 0.9);

  -[NCUNUIKitPrototypeSettings detailTextOpacitySettings](self, "detailTextOpacitySettings");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setResponse:", 0.95);

  -[NCUNUIKitPrototypeSettings detailTextOpacitySettings](self, "detailTextOpacitySettings");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v55, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v101.minimum, *(double *)&v101.maximum, *(double *)&v101.preferred);

  -[NCUNUIKitPrototypeSettings detailBackgroundSettings](self, "detailBackgroundSettings");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings detailBackgroundSettings](self, "detailBackgroundSettings");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setDampingRatio:", 1.02062073);

  -[NCUNUIKitPrototypeSettings detailBackgroundSettings](self, "detailBackgroundSettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setResponse:", 0.513019932);

  -[NCUNUIKitPrototypeSettings detailBackgroundSettings](self, "detailBackgroundSettings");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v59, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v102.minimum, *(double *)&v102.maximum, *(double *)&v102.preferred);

  -[NCUNUIKitPrototypeSettings dismissIconOpacitySettings](self, "dismissIconOpacitySettings");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings dismissIconOpacitySettings](self, "dismissIconOpacitySettings");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setDampingRatio:", 2.04124145);

  -[NCUNUIKitPrototypeSettings dismissIconOpacitySettings](self, "dismissIconOpacitySettings");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setResponse:", 0.256509966);

  -[NCUNUIKitPrototypeSettings dismissIconOpacitySettings](self, "dismissIconOpacitySettings");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v63, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v103.minimum, *(double *)&v103.maximum, *(double *)&v103.preferred);

  -[NCUNUIKitPrototypeSettings dismissTextOpacitySettings](self, "dismissTextOpacitySettings");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings dismissTextOpacitySettings](self, "dismissTextOpacitySettings");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setDampingRatio:", 1.02062073);

  -[NCUNUIKitPrototypeSettings dismissTextOpacitySettings](self, "dismissTextOpacitySettings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setResponse:", 0.513019932);

  -[NCUNUIKitPrototypeSettings dismissTextOpacitySettings](self, "dismissTextOpacitySettings");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v67, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v104.minimum, *(double *)&v104.maximum, *(double *)&v104.preferred);

  -[NCUNUIKitPrototypeSettings dismissTextPositionSettings](self, "dismissTextPositionSettings");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings dismissTextPositionSettings](self, "dismissTextPositionSettings");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setDampingRatio:", 1.5);

  -[NCUNUIKitPrototypeSettings dismissTextPositionSettings](self, "dismissTextPositionSettings");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setResponse:", 1.2);

  -[NCUNUIKitPrototypeSettings dismissTextPositionSettings](self, "dismissTextPositionSettings");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v71, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v105.minimum, *(double *)&v105.maximum, *(double *)&v105.preferred);

  -[NCUNUIKitPrototypeSettings dismissBackgroundSettings](self, "dismissBackgroundSettings");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings dismissBackgroundSettings](self, "dismissBackgroundSettings");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setDampingRatio:", 1.0);

  -[NCUNUIKitPrototypeSettings dismissBackgroundSettings](self, "dismissBackgroundSettings");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setResponse:", 0.85);

  -[NCUNUIKitPrototypeSettings dismissBackgroundSettings](self, "dismissBackgroundSettings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v75, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v106.minimum, *(double *)&v106.maximum, *(double *)&v106.preferred);

  -[NCUNUIKitPrototypeSettings interactiveDismissalTrackingSettings](self, "interactiveDismissalTrackingSettings");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings interactiveDismissalTrackingSettings](self, "interactiveDismissalTrackingSettings");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setDampingRatio:", 0.85);

  -[NCUNUIKitPrototypeSettings interactiveDismissalTrackingSettings](self, "interactiveDismissalTrackingSettings");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setResponse:", 0.36);

  -[NCUNUIKitPrototypeSettings interactiveDismissalTrackingSettings](self, "interactiveDismissalTrackingSettings");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v79, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v107.minimum, *(double *)&v107.maximum, *(double *)&v107.preferred);

  -[NCUNUIKitPrototypeSettings interactiveDismissalAutomaticSettings](self, "interactiveDismissalAutomaticSettings");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings interactiveDismissalAutomaticSettings](self, "interactiveDismissalAutomaticSettings");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setDampingRatio:", 0.85);

  -[NCUNUIKitPrototypeSettings interactiveDismissalAutomaticSettings](self, "interactiveDismissalAutomaticSettings");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setResponse:", 0.4);

  -[NCUNUIKitPrototypeSettings interactiveDismissalAutomaticSettings](self, "interactiveDismissalAutomaticSettings");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v83, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v108.minimum, *(double *)&v108.maximum, *(double *)&v108.preferred);

  -[NCUNUIKitPrototypeSettings interactiveDismissalBackgoundSettings](self, "interactiveDismissalBackgoundSettings");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setDefaultValues");

  -[NCUNUIKitPrototypeSettings interactiveDismissalBackgoundSettings](self, "interactiveDismissalBackgoundSettings");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setDampingRatio:", 1.0);

  -[NCUNUIKitPrototypeSettings interactiveDismissalBackgoundSettings](self, "interactiveDismissalBackgoundSettings");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setResponse:", 0.85);

  -[NCUNUIKitPrototypeSettings interactiveDismissalBackgoundSettings](self, "interactiveDismissalBackgoundSettings");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v87, "setFrameRateRange:highFrameRateReason:", 2621441, *(double *)&v109.minimum, *(double *)&v109.maximum, *(double *)&v109.preferred);

  -[NCUNUIKitPrototypeSettings setInteractiveDismissalThreshold:](self, "setInteractiveDismissalThreshold:", 0.2);
  -[NCUNUIKitPrototypeSettings setInteractiveDismissalRubberbandingInset:](self, "setInteractiveDismissalRubberbandingInset:", 0.05);
  -[NCUNUIKitPrototypeSettings setInteractiveDismissalRubberbandingRange:](self, "setInteractiveDismissalRubberbandingRange:", 0.35);
  -[NCUNUIKitPrototypeSettings setInteractiveDismissalMinBackgroundProgress:](self, "setInteractiveDismissalMinBackgroundProgress:", 0.55);
  -[NCUNUIKitPrototypeSettings setInteractiveDismissalMinContentScale:](self, "setInteractiveDismissalMinContentScale:", 0.9);
  -[NCUNUIKitPrototypeSettings setInteractiveDismissalMinContentAlpha:](self, "setInteractiveDismissalMinContentAlpha:", 0.9);
  -[NCUNUIKitPrototypeSettings setInteractiveDismissalFinalContentScale:](self, "setInteractiveDismissalFinalContentScale:", 0.8);
  -[NCUNUIKitPrototypeSettings setContentHitRectVisible:](self, "setContentHitRectVisible:", 0);
  -[NCUNUIKitPrototypeSettings setContentHitRectLeadingMargin:](self, "setContentHitRectLeadingMargin:", 24.0);
  -[NCUNUIKitPrototypeSettings setContentHitRectTrailingMargin:](self, "setContentHitRectTrailingMargin:", 24.0);
  -[NCUNUIKitPrototypeSettings setContentHitRectTopMargin:](self, "setContentHitRectTopMargin:", 39.0);
  -[NCUNUIKitPrototypeSettings setContentHitRectBottomMargin:](self, "setContentHitRectBottomMargin:", 39.0);
}

- (NCListAnimationSettings)listAnimationSettings
{
  return self->_listAnimationSettings;
}

- (void)setListAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_listAnimationSettings, a3);
}

- (NCSpringAnimationSettings)briefIconOpacitySettings
{
  return self->_briefIconOpacitySettings;
}

- (void)setBriefIconOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefIconOpacitySettings, a3);
}

- (double)briefIconPositionMilestone
{
  return self->_briefIconPositionMilestone;
}

- (void)setBriefIconPositionMilestone:(double)a3
{
  self->_briefIconPositionMilestone = a3;
}

- (NCSpringAnimationSettings)briefIconPositionSettings
{
  return self->_briefIconPositionSettings;
}

- (void)setBriefIconPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefIconPositionSettings, a3);
}

- (double)briefIconScaleMilestone
{
  return self->_briefIconScaleMilestone;
}

- (void)setBriefIconScaleMilestone:(double)a3
{
  self->_briefIconScaleMilestone = a3;
}

- (NCSpringAnimationSettings)briefIconScaleSettings
{
  return self->_briefIconScaleSettings;
}

- (void)setBriefIconScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefIconScaleSettings, a3);
}

- (double)briefGrabberMilestone
{
  return self->_briefGrabberMilestone;
}

- (void)setBriefGrabberMilestone:(double)a3
{
  self->_briefGrabberMilestone = a3;
}

- (NCSpringAnimationSettings)briefGrabberSettings
{
  return self->_briefGrabberSettings;
}

- (void)setBriefGrabberSettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefGrabberSettings, a3);
}

- (NCSpringAnimationSettings)briefTextOpacitySettings
{
  return self->_briefTextOpacitySettings;
}

- (void)setBriefTextOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefTextOpacitySettings, a3);
}

- (double)briefTextPositionMilestone
{
  return self->_briefTextPositionMilestone;
}

- (void)setBriefTextPositionMilestone:(double)a3
{
  self->_briefTextPositionMilestone = a3;
}

- (NCSpringAnimationSettings)briefTextPositionSettings
{
  return self->_briefTextPositionSettings;
}

- (void)setBriefTextPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefTextPositionSettings, a3);
}

- (NCSpringAnimationSettings)briefBackgroundSettings
{
  return self->_briefBackgroundSettings;
}

- (void)setBriefBackgroundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_briefBackgroundSettings, a3);
}

- (double)detailStageTransitionDelay
{
  return self->_detailStageTransitionDelay;
}

- (void)setDetailStageTransitionDelay:(double)a3
{
  self->_detailStageTransitionDelay = a3;
}

- (int64_t)detailStageTransitionMaxAttempts
{
  return self->_detailStageTransitionMaxAttempts;
}

- (void)setDetailStageTransitionMaxAttempts:(int64_t)a3
{
  self->_detailStageTransitionMaxAttempts = a3;
}

- (NCSpringAnimationSettings)detailOutgoingTextPositionSettings
{
  return self->_detailOutgoingTextPositionSettings;
}

- (void)setDetailOutgoingTextPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailOutgoingTextPositionSettings, a3);
}

- (NCSpringAnimationSettings)detailOutgoingTextOpacitySettings
{
  return self->_detailOutgoingTextOpacitySettings;
}

- (void)setDetailOutgoingTextOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailOutgoingTextOpacitySettings, a3);
}

- (NCSpringAnimationSettings)detailIconScaleSettings
{
  return self->_detailIconScaleSettings;
}

- (void)setDetailIconScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailIconScaleSettings, a3);
}

- (double)detailIconPositionMilestone
{
  return self->_detailIconPositionMilestone;
}

- (void)setDetailIconPositionMilestone:(double)a3
{
  self->_detailIconPositionMilestone = a3;
}

- (NCSpringAnimationSettings)detailIconPositionSettings
{
  return self->_detailIconPositionSettings;
}

- (void)setDetailIconPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailIconPositionSettings, a3);
}

- (double)detailTextMilestone
{
  return self->_detailTextMilestone;
}

- (void)setDetailTextMilestone:(double)a3
{
  self->_detailTextMilestone = a3;
}

- (double)detailSecondaryTextMilestone
{
  return self->_detailSecondaryTextMilestone;
}

- (void)setDetailSecondaryTextMilestone:(double)a3
{
  self->_detailSecondaryTextMilestone = a3;
}

- (NCSpringAnimationSettings)detailTextPositionSettings
{
  return self->_detailTextPositionSettings;
}

- (void)setDetailTextPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextPositionSettings, a3);
}

- (NCSpringAnimationSettings)detailTextOpacitySettings
{
  return self->_detailTextOpacitySettings;
}

- (void)setDetailTextOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextOpacitySettings, a3);
}

- (NCSpringAnimationSettings)detailBackgroundSettings
{
  return self->_detailBackgroundSettings;
}

- (void)setDetailBackgroundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailBackgroundSettings, a3);
}

- (NCSpringAnimationSettings)dismissIconOpacitySettings
{
  return self->_dismissIconOpacitySettings;
}

- (void)setDismissIconOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_dismissIconOpacitySettings, a3);
}

- (NCSpringAnimationSettings)dismissTextOpacitySettings
{
  return self->_dismissTextOpacitySettings;
}

- (void)setDismissTextOpacitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTextOpacitySettings, a3);
}

- (NCSpringAnimationSettings)dismissTextPositionSettings
{
  return self->_dismissTextPositionSettings;
}

- (void)setDismissTextPositionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTextPositionSettings, a3);
}

- (NCSpringAnimationSettings)dismissBackgroundSettings
{
  return self->_dismissBackgroundSettings;
}

- (void)setDismissBackgroundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dismissBackgroundSettings, a3);
}

- (NCSpringAnimationSettings)interactiveDismissalTrackingSettings
{
  return self->_interactiveDismissalTrackingSettings;
}

- (void)setInteractiveDismissalTrackingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveDismissalTrackingSettings, a3);
}

- (NCSpringAnimationSettings)interactiveDismissalAutomaticSettings
{
  return self->_interactiveDismissalAutomaticSettings;
}

- (void)setInteractiveDismissalAutomaticSettings:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveDismissalAutomaticSettings, a3);
}

- (NCSpringAnimationSettings)interactiveDismissalBackgoundSettings
{
  return self->_interactiveDismissalBackgoundSettings;
}

- (void)setInteractiveDismissalBackgoundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveDismissalBackgoundSettings, a3);
}

- (double)interactiveDismissalThreshold
{
  return self->_interactiveDismissalThreshold;
}

- (void)setInteractiveDismissalThreshold:(double)a3
{
  self->_interactiveDismissalThreshold = a3;
}

- (double)interactiveDismissalRubberbandingInset
{
  return self->_interactiveDismissalRubberbandingInset;
}

- (void)setInteractiveDismissalRubberbandingInset:(double)a3
{
  self->_interactiveDismissalRubberbandingInset = a3;
}

- (double)interactiveDismissalRubberbandingRange
{
  return self->_interactiveDismissalRubberbandingRange;
}

- (void)setInteractiveDismissalRubberbandingRange:(double)a3
{
  self->_interactiveDismissalRubberbandingRange = a3;
}

- (double)interactiveDismissalMinBackgroundProgress
{
  return self->_interactiveDismissalMinBackgroundProgress;
}

- (void)setInteractiveDismissalMinBackgroundProgress:(double)a3
{
  self->_interactiveDismissalMinBackgroundProgress = a3;
}

- (double)interactiveDismissalMinContentScale
{
  return self->_interactiveDismissalMinContentScale;
}

- (void)setInteractiveDismissalMinContentScale:(double)a3
{
  self->_interactiveDismissalMinContentScale = a3;
}

- (double)interactiveDismissalMinContentAlpha
{
  return self->_interactiveDismissalMinContentAlpha;
}

- (void)setInteractiveDismissalMinContentAlpha:(double)a3
{
  self->_interactiveDismissalMinContentAlpha = a3;
}

- (double)interactiveDismissalFinalContentScale
{
  return self->_interactiveDismissalFinalContentScale;
}

- (void)setInteractiveDismissalFinalContentScale:(double)a3
{
  self->_interactiveDismissalFinalContentScale = a3;
}

- (BOOL)isContentHitRectVisible
{
  return self->_contentHitRectVisible;
}

- (void)setContentHitRectVisible:(BOOL)a3
{
  self->_contentHitRectVisible = a3;
}

- (double)contentHitRectLeadingMargin
{
  return self->_contentHitRectLeadingMargin;
}

- (void)setContentHitRectLeadingMargin:(double)a3
{
  self->_contentHitRectLeadingMargin = a3;
}

- (double)contentHitRectTrailingMargin
{
  return self->_contentHitRectTrailingMargin;
}

- (void)setContentHitRectTrailingMargin:(double)a3
{
  self->_contentHitRectTrailingMargin = a3;
}

- (double)contentHitRectTopMargin
{
  return self->_contentHitRectTopMargin;
}

- (void)setContentHitRectTopMargin:(double)a3
{
  self->_contentHitRectTopMargin = a3;
}

- (double)contentHitRectBottomMargin
{
  return self->_contentHitRectBottomMargin;
}

- (void)setContentHitRectBottomMargin:(double)a3
{
  self->_contentHitRectBottomMargin = a3;
}

- (int64_t)dynamicGroupingThreshold
{
  return self->_dynamicGroupingThreshold;
}

- (void)setDynamicGroupingThreshold:(int64_t)a3
{
  self->_dynamicGroupingThreshold = a3;
}

- (int64_t)dynamicGroupingThresholdPad
{
  return self->_dynamicGroupingThresholdPad;
}

- (void)setDynamicGroupingThresholdPad:(int64_t)a3
{
  self->_dynamicGroupingThresholdPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveDismissalBackgoundSettings, 0);
  objc_storeStrong((id *)&self->_interactiveDismissalAutomaticSettings, 0);
  objc_storeStrong((id *)&self->_interactiveDismissalTrackingSettings, 0);
  objc_storeStrong((id *)&self->_dismissBackgroundSettings, 0);
  objc_storeStrong((id *)&self->_dismissTextPositionSettings, 0);
  objc_storeStrong((id *)&self->_dismissTextOpacitySettings, 0);
  objc_storeStrong((id *)&self->_dismissIconOpacitySettings, 0);
  objc_storeStrong((id *)&self->_detailBackgroundSettings, 0);
  objc_storeStrong((id *)&self->_detailTextOpacitySettings, 0);
  objc_storeStrong((id *)&self->_detailTextPositionSettings, 0);
  objc_storeStrong((id *)&self->_detailIconPositionSettings, 0);
  objc_storeStrong((id *)&self->_detailIconScaleSettings, 0);
  objc_storeStrong((id *)&self->_detailOutgoingTextOpacitySettings, 0);
  objc_storeStrong((id *)&self->_detailOutgoingTextPositionSettings, 0);
  objc_storeStrong((id *)&self->_briefBackgroundSettings, 0);
  objc_storeStrong((id *)&self->_briefTextPositionSettings, 0);
  objc_storeStrong((id *)&self->_briefTextOpacitySettings, 0);
  objc_storeStrong((id *)&self->_briefGrabberSettings, 0);
  objc_storeStrong((id *)&self->_briefIconScaleSettings, 0);
  objc_storeStrong((id *)&self->_briefIconPositionSettings, 0);
  objc_storeStrong((id *)&self->_briefIconOpacitySettings, 0);
  objc_storeStrong((id *)&self->_listAnimationSettings, 0);
}

@end
